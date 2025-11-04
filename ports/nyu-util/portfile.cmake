vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO NYU-Processor-Design/nyu-util
  REF v${VERSION}
  SHA512 f1e5bf30fba0406a547510b2397c000ccfa1b59dc4b1c668f465259920c0a4eb2bc0006be9c6dc51981f05b92f431b7e16efc93ec73aa06a27c0865e70a9369f
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
