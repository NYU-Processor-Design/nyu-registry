vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO NYU-Processor-Design/nyu-amba
  REF 01a96dfa915f1317d0c8c09ddd0f75814e19e6ef
  SHA512 4f2bdf976a2abfd38531d88a134a4beca14ce8baa380e286ed5d74c5fef9033b08e2a6971dede85427fa60da598dd6fad0c5c936dc97a4efa588b5a5bac756b8
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
