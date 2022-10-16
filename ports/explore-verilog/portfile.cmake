vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO NYU-Processor-Design/explore-verilog
  REF a89b04bfe1efcd1fe8563e63a8ca4bd9b2f9857e
  SHA512 802ac48a7e951a86ee9bf8a458ece16f72ea07f3656ad2396329033dd235239144d66c387aa8fa8054ca579a4128c8a291186bf8500b71e57098a3f5dd9c823a
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
