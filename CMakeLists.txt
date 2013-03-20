cmake_minimum_required (VERSION 2.6)

project(parseus)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

add_subdirectory(parseus)
add_subdirectory(cpp_preprocessor)
add_subdirectory(parser_test)
add_subdirectory(examples)
