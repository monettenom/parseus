#define A (5+5)
#define B 

#if A && defined B && A==10
#if 0

#define TEXT "any text"
#define PRINTF(s, ...) printf(s, __VA_ARGS__)

void test()
{
  PRINTF("%s", TEXT);
}
#endif
#endif

#include "stdafx.h"
#include <typeinfo>
#include "testsuite.h"
#include "preprocessormacro.h"
#include "macroresolver.h"
#include "ppexpression.h"
#include "preprocessor.h"

int main(int argc, char* argv[])
{
  cPreProcessor pp;
  pp.AddStandardInclude("C:/Programme/Microsoft Visual Studio 8/VC/include");
  pp.AddProjectInclude("C:/Projekte/parseus");
  pp.AddProjectInclude("C:/Projekte/parseus/parseus");

  //pp.Process("parser_test.cpp");
  cTestSuite::GetTestSuite()->RunTests();

  //std::cout << -(4-2) << std::endl;
}
