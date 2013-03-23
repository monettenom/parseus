#include "stdafx.h"

cTestSuite::cTestSuite()
{
}

cTestSuite::~cTestSuite()
{
}

void cTestSuite::AddTest(ITester* pTester)
{
  m_Tests.push_back(pTester);
}

void cTestSuite::RunTests()
{
  int nFailed = 0;
  int nTests = 0;

  std::vector<ITester*>::iterator it;
  for (it = m_Tests.begin(); it != m_Tests.end(); ++it)
  {
    nFailed += (*it)->RunTests();
    nTests += (*it)->GetTestCount();
  }

  std::cout << nFailed << " of " << nTests << " tests failed!" << std::endl;
}

cTestSuite* cTestSuite::GetTestSuite()
{
  static cTestSuite s_TestSuite;
  return &s_TestSuite;
}


