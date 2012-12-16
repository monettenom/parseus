#include "stdafx.h"
#include "testcpptokenhandler.h"
#include "testpastokenhandler.h"

int main(int argc, char* argv[])
{
  //cTestCPPTokenHandler tester;
  cTestPasTokenHandler tester;
  int nFailed = tester.RunTests(); 
  int nTests = tester.GetTestCount();
  std::cout << nFailed << " of " << nTests << " failed!" << std::endl;

  return 0;
}
