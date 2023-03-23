vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO NYU-Processor-Design/explore-verilog
  REF 1ac181ab19f21ab637fa94923cba4a727cee54a3
  SHA512 2e4fb4f494f26fe7d870d2d66f2ffaa4663a8f8db141061a974473e0582dfc0626bd8789b0fdc4d5c071baa666cf88112b9b540fb8ae09ed176101118bfbdbd9
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
