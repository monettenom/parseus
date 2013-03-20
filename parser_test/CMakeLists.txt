
include_directories(
  "${PROJECT_SOURCE_DIR}"
  "${PROJECT_SOURCE_DIR}/parseus"
  "${PROJECT_SOURCE_DIR}/cpp_preprocessor"
)

link_directories("${PARSEUS_BINARY_DIR}/parseus")
link_directories("${PARSEUS_BINARY_DIR}/cpp_preprocessor")

set(
  TEST_FILES
  cpptestdata.inc
  pastestdata.inc
  phptestdata.inc
  pptestdata.inc
  ppexptestdata.inc
  preproctestdata.inc
)

add_executable(
  parser_test
  parser_test.cpp
  cpp_tokenprinter.h
  cpp_tokenprinter.cpp
  
  stdafx.h
  stdafx.cpp
  
  testsuite.h
  testsuite.cpp

  teststringmem.h
  teststringmem.cpp

  testtokenhandler.h
  testtokenhandler.cpp

  testcpptokenhandler.cpp
  testcpptokenhandler.h

  testpastokenhandler.cpp
  testpastokenhandler.h

  testphptokenhandler.cpp
  testphptokenhandler.h

  testpptokenhandler.cpp
  testpptokenhandler.h
  
  testppexpression.cpp
  testppexpression.h
  
  testpreprocessor.cpp
  testpreprocessor.h
  ${TEST_FILES}
)

source_group(
  "Test Files"
  FILES 
  ${TEST_FILES}
)

target_link_libraries(parser_test parseus cpp_preprocessor) 