#pragma once

#include "testtokenhandler.h"

class cTestCPPTokenHandler: public cTestTokenHandler
{
public:
  cTestCPPTokenHandler();
  ~cTestCPPTokenHandler();

  int RunTests();
  int GetTestCount(){ return m_nTestCount; }

protected:
  void HandleToken(tToken& oToken);
  void HandleError(const char* strError, int iLine);
  void LogEntry(const char* strLog);
  int GetTokenCount();

  bool Test(tTestData* pTestData);
  void InitTest(tTestData* pTestData);

private:
  cCPPTokenizer m_Tokenizer;
  tTestData* m_pTestData;
  bool m_bResult;
  int m_nTokenCount;
  int m_nTestCount;
};
