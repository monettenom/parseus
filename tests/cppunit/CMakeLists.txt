cmake_minimum_required (VERSION 2.6)

set(
  CPPUNIT_FILES
  cppunit.h
  estring.h
  Exception.cpp
  Exception.h
  Test.h
  TestCaller.h
  TestCase.cpp
  TestCase.h
  TestFailure.cpp
  TestFailure.h
  TestRegistry.cpp
  TestRegistry.h
  TestResult.cpp
  TestResult.h
  TestSuite.cpp
  TestSuite.h
  TextTestResult.cpp
  TextTestResult.h
  TestMacros.h
)

add_library(cppunit
  ${CPPUNIT_FILES}
)

set_target_properties(
   cppunit PROPERTIES FOLDER "tests"
)
