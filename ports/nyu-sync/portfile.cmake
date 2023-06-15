vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO nickelpro/nyu-sync
  REF dc0d3bd5fdff8b285c872f1f64b54840b0774ef1
  SHA512 a4b51139405f4fc24dfa7e8fbfb131147ea8fb2747cd498d69b9e7988df172a5268555f8ab5241294a2fe7aae870c12aef2f80f96b75df6897a27960bb6b463e
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  OPTIONS
  -DNYU_BUILD_TESTS=FALSE
)
vcpkg_cmake_install()
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug)
vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/License)
file(
  INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
