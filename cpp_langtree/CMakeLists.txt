cmake_minimum_required (VERSION 2.6)

include_directories(
  "${CMAKE_SOURCE_DIR}/parseus"
)

set(CPP_LANGTREE_FILES
  stdafx.h
  stdafx.cpp
  specifier.h
  specifier.cpp
  scope.h
  scope.cpp
)

add_library(cpp_langtree
  ${CPP_LANGTREE_FILES}
)



