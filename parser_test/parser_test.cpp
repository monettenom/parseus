#include "stdafx.h"
#include "teststringmem.h"
#include "testcpptokenhandler.h"
#include "testpastokenhandler.h"
#include "testphptokenhandler.h"
#include "testpptokenhandler.h"

int main(int argc, char* argv[])
{
  int nFailed = 0;
  int nTests = 0;

  {
    cTestStringMem tester;
    nFailed += tester.RunTests();
    nTests += tester.GetTestCount();
  }

  {
    cTestPPTokenHandler tester;
    nFailed += tester.RunTests(); 
    nTests += tester.GetTestCount();
  }

  {
    cTestCPPTokenHandler tester;
    nFailed += tester.RunTests(); 
    nTests += tester.GetTestCount();
  }

  {
    cTestPasTokenHandler tester;
    nFailed += tester.RunTests(); 
    nTests += tester.GetTestCount();
  }

  {
    cTestPhpTokenHandler tester;
    nFailed += tester.RunTests(); 
    nTests += tester.GetTestCount();
  }

  std::cout << nFailed << " of " << nTests << " tests failed!" << std::endl;

  return 0;
}
