vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO NYU-Processor-Design/nyu-cmake
  REF dbf239e289549b5702b1328d049c00c6175d7b00
  SHA512 aba9a083faca95ef0b8d76d10ac7dcdda07d935abf15fe19d728c53f13488705e81b77207dd04454f5fd73fac3e28ef9da790dc6d2074ac5c42b49d5b53d8ba6
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
)
vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/License)
file(
  INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
