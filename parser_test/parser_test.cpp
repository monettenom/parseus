#include "stdafx.h"
#include "testcpptokenhandler.h"

int main(int argc, char* argv[])
{
  cTestCPPTokenHandler tester;
  int nFailed = tester.RunTests(); 
  int nTests = tester.GetTestCount();
  std::cout << nFailed << " of " << nTests << " failed!" << std::endl;

  return 0;
}
