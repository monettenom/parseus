cmake_minimum_required (VERSION 2.6)

project(parseus)

add_library(parseus  
  stdafx.h
  stdafx.cpp
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
)

