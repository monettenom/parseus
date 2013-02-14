#pragma once

#include "stdafx.h"
#include "testtokenhandler.h"

cTestTokenHandler::cTestTokenHandler(cTokenizer* pTokenizer, tTestData pTestData[])
: m_bResult(false)
, m_pTestData((tTestData*)pTestData)
, m_pCurrentTestEntry(NULL)
, m_nTokenCount(0)
, m_nTestCount(0)
, m_pTokenizer(pTokenizer)
{
}

cTestTokenHandler::~cTestTokenHandler()
{
}

void cTestTokenHandler::InitTest(tTestData* pTestData)
{
  m_nTokenCount = 0;
  m_pCurrentTestEntry = pTestData;
  SetResult(true);
}

void cTestTokenHandler::HandleError(const char* strError, int iLine)
{
  m_bResult = false;
  std::cout << strError << " index " << iLine << std::endl;
}

void cTestTokenHandler::LogEntry(const char* strLog)
{
  std::cout << strLog << std::endl;
}

bool cTestTokenHandler::Test(tTestData* pTestData)
{
  IncTestCount();
  InitTest(pTestData);
  for (int i = 0; pTestData->m_strCode[i] != NULL; i++)
  {
    m_pTokenizer->Parse(pTestData->m_strCode[i]); 
  }
  if (pTestData->m_nExpectedTokens != IGNORE_TOKEN_COUNT && pTestData->m_nExpectedTokens != GetTokenCount())
  {
    std::stringstream strLog;
    strLog << "Expected tokens: " << pTestData->m_nExpectedTokens << ", tokens found: " << GetTokenCount();
    LogEntry(strLog.str().c_str());
    SetResult(false);
  }
  return GetResult();
}

int cTestTokenHandler::RunTests()
{
  int nTokenCount = 0;
  int nResult = 0;

  for (int nTestCase = 0; m_pTestData[nTestCase].m_nExpectedTokens != -1; nTestCase++)
  {
    std::stringstream strLog;

    strLog << "Running test case " << (nTestCase + 1);
    LogEntry(strLog.str().c_str());
    nResult += Test(&m_pTestData[nTestCase]) ? 0 : 1;
    nTokenCount += m_pTestData[nTestCase].m_nExpectedTokens;
  }

  std::stringstream strLog;
  strLog << "Tokens checked: " << nTokenCount;
  LogEntry(strLog.str().c_str());

  return nResult;
}
