// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

#ifndef STDAFX_H
#define STDAFX_H

#include <stdio.h>
#include <tchar.h>
#include <string>
#include <vector>
#include <map>
#include <stack>
#include <sstream>
#include <fstream>
#include <iostream>

#include "parseus.h"
#include "logging.h"
#include "testsuite.h"
#include "testtokenhandler.h"

#define TEST_LOG(format, ...)\
  printf(format, __VA_ARGS__);\
  printf("\n");\
  LOG(format, __VA_ARGS__)

#endif //STDAFX_H