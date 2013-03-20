cmake_minimum_required (VERSION 2.6)

set(
  PARSEUS_FILES
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
)

add_library(parseus
  ${PARSEUS_FILES}
)


