vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO NYU-Processor-Design/PurdNyUart
  REF bc1cc93664bb929bc2e8f96f8b364a64d6475cac
  SHA512 184939931ed29fa6658ad39d9d3e44e641c388363b38beda49537c71d8de10e5ebbea1e93a9628b299ac21e3c04ace1c25b91dfa5261660b8da8b211f2d14247
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  OPTIONS
    -DNYU_BUILD_TESTS=FALSE
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug)
vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/License)
file(
  INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
