cmake_minimum_required (VERSION 2.6)

include_directories(
  "${CMAKE_SOURCE_DIR}/parseus"
)

set(CPP_PREPROCESSOR_FILES
  stdafx.h
  stdafx.cpp
  pp_tokenizer.h
  pp_tokenizer.cpp  
  
  breakpoint.h
  breakpoint.cpp  
  nestinglevel.h
  nestinglevel.cpp  
  fileinfo.h
  ppinterfaces.h
  preprocessormacro.h
  preprocessormacro.cpp  
  macrohandler.h
  macrohandler.cpp
  macroresolver.h
  macroresolver.cpp  
  ppexpression.h
  ppexpression.cpp  
  pragmahandler.h
  pragmahandler.cpp  
  preprocessorstatistics.h
  preprocessor.h
  preprocessor.cpp
)

add_library(cpp_preprocessor
  ${CPP_PREPROCESSOR_FILES}
)



