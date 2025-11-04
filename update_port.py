#!/usr/bin/env python

import argparse
import hashlib
import json
from pathlib import Path
from urllib import request


def write_json(js, fpath):
  with open(fpath, 'w') as f:
    f.write(f'{json.dumps(js, indent=2)}\n')


parser = argparse.ArgumentParser(prog='update_port.py',
                                 description='Update an NYU PD vcpkg port')

parser.add_argument('port_name', help='update port', type=str)
parser.add_argument('port_version', help='update version', type=str)

args = parser.parse_args()

base_file = Path('versions/baseline.json')
baseline = json.load(open(base_file))
base_port = baseline['default'][args.port_name]
base_port['baseline'] = args.port_version
base_port['port-version'] = 0
write_json(baseline, base_file)

port_folder = Path('ports') / args.port_name
vcpkg = json.load(open(port_folder / 'vcpkg.json'))
if 'version' in vcpkg:
  vcpkg['version'] = args.port_version
else:
  vcpkg['version-semver'] = args.port_version

write_json(vcpkg, port_folder / 'vcpkg.json')

portfile = open(port_folder / 'portfile.cmake').read()
for line in portfile.splitlines():
  if 'SHA512' in line:
    old_hash = line.split()[1]
    break
new_hash = hashlib.sha512(
    request.urlopen(
        f'https://github.com/NYU-Processor-Design/{args.port_name}/archive/v{args.port_version}.tar.gz'
    ).read()).hexdigest()

open(port_folder / 'portfile.cmake',
     'w').write(portfile.replace(old_hash, new_hash))
