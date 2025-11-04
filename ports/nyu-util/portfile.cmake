vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO NYU-Processor-Design/nyu-util
  REF v${VERSION}
  SHA512 94460ef32c9dd64a0acba6aa4633fd48f5eefdc2cdc58d966ed2c47c98842084e2bf75ac931fd2916fac9d0384c7fa055de26dbff84b0969c9a21ae8d0901986
  HEAD_REF main
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/License)

file(
  INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
)
