
include_directories(
  "${PROJECT_SOURCE_DIR}"
  "${PROJECT_SOURCE_DIR}/parseus"
)

link_directories("${PARSEUS_BINARY_DIR}/parseus")

add_executable(parser_test
  parser_test.cpp
  cpp_tokenprinter.h
  cpp_tokenprinter.cpp
  stdafx.h
  stdafx.cpp
  testtokenhandler.h
  testtokenhandler.cpp

  cpptestdata.inc
  testcpptokenhandler.cpp
  testcpptokenhandler.h

  pastestdata.inc
  testpastokenhandler.cpp
  testpastokenhandler.h

  phptestdata.inc
  testphptokenhandler.cpp
  testphptokenhandler.h

  pptestdata.inc
  testpptokenhandler.cpp
  testpptokenhandler.h
)

target_link_libraries (parser_test parseus) 