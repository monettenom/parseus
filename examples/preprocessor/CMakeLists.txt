project(preprocessor)

include_directories(
  "${CMAKE_SOURCE_DIR}/parseus"
  "${CMAKE_SOURCE_DIR}/cpp_preprocessor"
)

link_directories("${PARSEUS_BINARY_DIR}/parseus")
link_directories("${PARSEUS_BINARY_DIR}/cpp_preprocessor")

set(PREPROCESSOR_FILES
  preprocessor.cpp
)

add_executable(
  preprocessor
  ${PREPROCESSOR_FILES}
)

target_link_libraries(preprocessor parseus cpp_preprocessor)

set_target_properties(
   preprocessor PROPERTIES FOLDER "examples"
)