vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO NYU-Processor-Design/explore-verilog
  REF 593fb1f0ca7b80d99c8674f20b4ef687a7f6f962
  SHA512 b9407f8b0c27a6b88249fce6c184b3379a21945b2b75ffa4e6d175b85d3487dd3529039532c571ad293d603ef7b19732fca1734a47632a4646ca3e48de59542c
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  OPTIONS
    -DBUILD_TESTS=FALSE
)
vcpkg_cmake_install()
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug)
vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/License)
file(
  INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
)