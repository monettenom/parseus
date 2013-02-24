cmake_minimum_required (VERSION 2.6)

project(parseus)

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
  pp_tokenizer.h
  pp_tokenizer.cpp
  preprocessormacro.h
  preprocessormacro.cpp
  macroresolver.h
  macroresolver.cpp
  ppexpression.h
  ppexpression.cpp
  preprocessor.h
  preprocessor.cpp
)

