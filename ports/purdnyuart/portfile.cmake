vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO NYU-Processor-Design/PurdNyUart
  REF 7113c5e42c96378f7216d2c7cafb23b01aedf39d
  SHA512 5e53ddc0383e491b50688f497f20a8e9c507ffae0ecec33c08ac24805929cda5f203221377b2c4e7ac41df340d370dd05e8bccbfbac9533ceacb4c103e3d0753
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
