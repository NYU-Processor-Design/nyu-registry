vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO NYU-Processor-Design/nyu-cmake
  REF 67e2210b22ab08fecfe2c724c645b9d3d2b69520
  SHA512 a53b9f4dbab55fa85f0e90ee11dc1dca7c20523a3425ec4e29734ce7db8b7e5f63c1daa5e9a919cfc8647465220b3ba7b300251114eb49613e5792cbb7af6d15
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
