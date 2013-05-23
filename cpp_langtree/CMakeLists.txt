cmake_minimum_required (VERSION 2.6)

include_directories(
  "${CMAKE_SOURCE_DIR}/parseus"
)

set(CPP_LANGTREE_FILES
  cpp_langtreelib.h
  stdafx.h
  stdafx.cpp
  languageelement.h
  languageelement.cpp
  typequalifier.h
  typequalifier.cpp
  scope.h
  scope.cpp
  namedscope.h
  namedscope.cpp
  class.h
  class.cpp
  namespace.h
  namespace.cpp
  globalscope.h
  globalscope.cpp
)

add_library(cpp_langtree
  ${CPP_LANGTREE_FILES}
)



