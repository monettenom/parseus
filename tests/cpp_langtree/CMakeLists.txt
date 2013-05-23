
set(TEST_NAME testscope)

include_directories(
  "${PROJECT_SOURCE_DIR}/tests/cppunit"
  "${PROJECT_SOURCE_DIR}/parseus"
  "${PROJECT_SOURCE_DIR}/cpp_langtree"
)

link_directories("${PARSEUS_BINARY_DIR}/tests/cppunit")
link_directories("${PARSEUS_BINARY_DIR}/parseus")
link_directories("${PARSEUS_BINARY_DIR}/cpp_langtree")

add_executable(
  ${TEST_NAME}
  main.cpp
  testscope.h
  testscope.cpp
  testtype.h
  testtype.cpp
)

target_link_libraries(
  ${TEST_NAME} 
  cppunit 
  parseus 
  cpp_langtree
) 

set_target_properties(
   ${TEST_NAME} PROPERTIES FOLDER "tests"
)