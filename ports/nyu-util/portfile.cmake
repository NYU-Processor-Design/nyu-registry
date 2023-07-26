vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO NYU-Processor-Design/nyu-util
  REF 084433792acf2c184ac20e0cc63eddbfb1061f91
  SHA512 55482cac7f6b9d3d3556dd8ca50443b0424a04579e039400cebc70aa1afc50ec9a885a676b53a2fe3234962e53b537da35a22a9dceb7c10c1fbea0b55d195d07
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
)
vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST ${SOURCE_PATH}/License)

file(
  INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
)
