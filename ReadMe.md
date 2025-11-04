# NYU Registry

This is the NYU Processor Design Team's vcpkg registry

## Using the registry

The typical way to use a vcpkg registry is to add it to the package manifest,
see the [vcpkg documentation](https://learn.microsoft.com/en-us/vcpkg/concepts/manifest-mode)
on manifest mode for more details. Ordinary usage of the NYU PD registry would
look like:

```jsonc
{
  "default-registry": { /* ... */ },
  "registries": [
    {
      "kind": "git",
      "repository": "https://github.com/NYU-Processor-Design/nyu-registry",
      "baseline": "...",
      "packages": [ "nyu-*" ]
    }
  ],
  "overlay-ports": [ /* ... */ ]
}
```

This would provide any ports prefixed with `nyu-` from the NYU PD registry
when requested by a project.

## Adding / Updating a port

The NYU PD registry is a standard vcpkg registry, thus adding a port requires
the standard steps documented in [the vcpkg maintainer guide](https://learn.microsoft.com/en-us/vcpkg/contributing/maintainer-guide).

The Python script `update_port.py` handles some of the monotonous work of
updating version numbers and SHA512 hashes, and when used in conjunction with
the `vcpkg x-add-version` script for managing the version database can be
used to quickly update ports.

However these are presented without further commentary, it is not intended for
those unfamiliar with vcpkg registry maintenance to update ports at this time.
