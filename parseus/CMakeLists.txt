cmake_minimum_required (VERSION 2.6)

project(parseus)

set(
  PREPROCESSOR_FILES
  pp_tokenizer.h
  pp_tokenizer.cpp  
  breakpoint.h
  breakpoint.cpp
  preprocessormacro.h
  preprocessormacro.cpp
  macroresolver.h
  macroresolver.cpp
  ppexpression.h
  ppexpression.cpp
  pragmahandler.h
  pragmahandler.cpp
  nestinglevel.h
  nestinglevel.cpp
  fileinfo.h
  preprocessorstatistics.h
  preprocessor.h
  preprocessor.cpp
)

add_library(parseus
  stdafx.h
  stdafx.cpp
  logging.h
  logging.cpp
  parseus.h
  stringmem.h
  stringmem.cpp
  tokenizer.h
  tokenizer.cpp
  cpp_tokenizer.h
  cpp_tokenizer.cpp
  pas_tokenizer.h
  pas_tokenizer.cpp
  php_tokenizer.h
  php_tokenizer.cpp
  ${PREPROCESSOR_FILES}
)

source_group(
  Preprocessor 
  FILES 
  ${PREPROCESSOR_FILES}
)
