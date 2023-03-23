vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO NYU-Processor-Design/nyu-amba
  REF 760b94fc8dbcf996f82a280380425c2d8d977387
  SHA512 9df11408425df17279f1001958abace2ce59fd2a8a82f341550135cc13d6e1d6bce4a9cdc78625cdec120c2ecdb5f8ee430f1168da0ef9eb3bdb71f0486217af
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
