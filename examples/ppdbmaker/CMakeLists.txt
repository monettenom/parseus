project(ppdbmaker)

set(SQLITE_DIR ${SQLITE_DIR} CACHE PATH "" FORCE)

include_directories(
  "${CMAKE_SOURCE_DIR}/parseus"
  "${CMAKE_SOURCE_DIR}/cpp_preprocessor"
  "${SQLITE_DIR}/include"
)

link_directories("${PARSEUS_BINARY_DIR}/parseus")
link_directories("${PARSEUS_BINARY_DIR}/cpp_preprocessor")
link_directories("${SQLITE_DIR}/lib")

set(PPDBMAKER_FILES
  ppdbmaker.cpp
  stdafx.h
  sqlitedb.h
  sqlitedb.cpp
)

add_executable(
  ppdbmaker
  ${PPDBMAKER_FILES}
)

if(${CMAKE_BUILD_TYPE} MATCHES "Debug")
 target_link_libraries(ppdbmaker parseus cpp_preprocessor sqlite3d)
else()
 target_link_libraries(ppdbmaker parseus cpp_preprocessor sqlite3)
endif()

set_target_properties(
   ppdbmaker PROPERTIES FOLDER "examples"
)