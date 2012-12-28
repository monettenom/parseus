#include "stdafx.h"
#include "testcpptokenhandler.h"
#include "testpastokenhandler.h"
#include "testphptokenhandler.h"

int main(int argc, char* argv[])
{
  int nFailed = 0;
  int nTests = 0;
  {
    cTestPhpTokenHandler tester;
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

  std::cout << nFailed << " of " << nTests << " tests failed!" << std::endl;

  return 0;
}
