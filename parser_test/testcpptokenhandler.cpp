#include "stdafx.h"

#include "cpptestdata.inc"

using namespace std;

cTestCPPTokenHandler::cTestCPPTokenHandler()
: m_Tokenizer()
, m_pTestData(NULL)
, m_bResult(false)
, m_nTestCount(0)
, m_nTokenCount(0)
{
  m_Tokenizer.SetTokenHandler(this);
}

cTestCPPTokenHandler::~cTestCPPTokenHandler()
{

}

void cTestCPPTokenHandler::HandleToken(tToken& oToken)
{
  if (!m_bResult)
    return;

  // will be sent every new line if there was a line before
  if (oToken.m_Token == TOKEN_NEWLINE)
    return;

  if (m_pTestData->m_bIgnoreWhitespace && oToken.m_Token == TOKEN_WHITESPACE)
    return;

  if (oToken.m_Token != m_pTestData->m_pTokenList[m_nTokenCount])
  {
    m_bResult = false;
    stringstream strMessage;
    strMessage << "Token mismatch! Expected: " << m_Tokenizer.GetTokenString(m_pTestData->m_pTokenList[m_nTokenCount]) << 
      " result: " << m_Tokenizer.GetTokenString(oToken.m_Token);
    HandleError(strMessage.str().c_str(), m_nTokenCount);
  }
  else
  {
    switch(oToken.m_Token)
    {
    case TOKEN_KEYWORD:
    case TOKEN_OPERATOR:
      {
        if (oToken.m_Type != m_pTestData->m_pTokenTypeList[m_nTokenCount])
        {
          m_bResult = false;
          HandleError("keyword or operator expected", m_nTokenCount);
        }
      }
      break;

    case TOKEN_PREPROC:
    case TOKEN_WHITESPACE:
    case TOKEN_LITERAL:
    case TOKEN_LABEL:
    case TOKEN_COMMENT:
    case TOKEN_LINECOMMENT:
    case TOKEN_STRING:
    case TOKEN_CHAR:
    case TOKEN_NUMBER:
    case TOKEN_MULTILINE_STRING:
      {
        if (strcmp(oToken.m_strName, m_pTestData->m_pNameList[m_nTokenCount]) != 0)
        {
          stringstream strMessage;
          strMessage << "expected: \"" << m_pTestData->m_pNameList[m_nTokenCount] << "\", result: \"" << oToken.m_strName << "\"";
          HandleError(strMessage.str().c_str(), m_nTokenCount);
          m_bResult = false;
        }
      }
      break;

    case TOKEN_BLOCK_BEGIN:
    case TOKEN_BLOCK_END:
      break;

    }
  }
  m_nTokenCount++;
}

void cTestCPPTokenHandler::HandleError(const char* strError, int iLine)
{
  m_bResult = false;
  std::cout << strError << " index " << iLine << std::endl;
}

void cTestCPPTokenHandler::LogEntry(const char* strLog)
{
  std::cout << strLog << std::endl;
}

int cTestCPPTokenHandler::GetTokenCount()
{
  return 0;
}

void cTestCPPTokenHandler::InitTest(tTestData* pTestData)
{
  m_nTokenCount = 0;
  m_pTestData = pTestData;
  m_bResult = true;
}

bool cTestCPPTokenHandler::Test(tTestData* pTestData)
{
  m_nTestCount++;
  InitTest(pTestData);
  for (int i = 0; pTestData->m_strCode[i] != NULL; i++)
  {
    m_Tokenizer.Parse(pTestData->m_strCode[i]); 
  }
  return m_bResult && pTestData->m_nExpectedTokens == m_nTokenCount;
}

int cTestCPPTokenHandler::RunTests()
{
  int nTokenCount = 0;
  int nResult = 0;
  for (int nTestCase = 0; sCPPTestData[nTestCase].m_nExpectedTokens != -1; nTestCase++)
  {
    std::stringstream strLog;
    strLog << "Running test case " << (nTestCase + 1);
    LogEntry(strLog.str().c_str());
    nResult += Test(&sCPPTestData[nTestCase]) ? 0 : 1;
    nTokenCount += sCPPTestData[nTestCase].m_nExpectedTokens;
  }

  std::stringstream strLog;
  strLog << "Tokens checked: " << nTokenCount;
  LogEntry(strLog.str().c_str());

  return nResult;
}
