#include "stdafx.h"
#include "testpreprocessor.h"
#include "preproctestdata.inc"

using namespace std;

REGISTER_TEST(cTestPreprocessor);

cTestPreprocessor::cTestPreprocessor()
: cTestTokenHandler(&m_Tokenizer, sPreprocessorTestData)
, m_Tokenizer()
, m_Preprocessor(this)
{
  m_Tokenizer.SetTokenHandler(this);
}

cTestPreprocessor::~cTestPreprocessor()
{
}

void cTestPreprocessor::HandleCode(char strCode)
{
  if (strCode == '\n')
  {
    m_Tokenizer.Parse(m_strLine.str().c_str());
    m_strLine.str(std::string());
  }
  else
  {
    m_strLine << strCode; 
  }
}

void cTestPreprocessor::HandleCode(const char* strCode)
{
  m_strLine << strCode;
}

bool cTestPreprocessor::Test(tTestData* pTestData)
{
  IncTestCount();
  InitTest(pTestData);
  for (int i = 0; pTestData->m_strCode[i] != NULL; i++)
  {
    m_Preprocessor.Parse(pTestData->m_strCode[i]); 
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

bool cTestPreprocessor::HandleToken(tToken& oToken)
{
  if (!GetResult())
    return false;

  // will be sent every new line if there was a line before
  if (oToken.m_Token == TOKEN_NEWLINE)
    return true;

  if (GetTestEntry()->m_bIgnoreWhitespace && oToken.m_Token == TOKEN_WHITESPACE)
    return true;

  if (oToken.m_Token != GetTestEntry()->m_pTokenList[GetTokenCount()])
  {
    stringstream strMessage;
    strMessage << "Token mismatch! Expected: " << m_Tokenizer.GetTokenString(GetTestEntry()->m_pTokenList[GetTokenCount()]) << 
      " result: " << m_Tokenizer.GetTokenString(oToken.m_Token);
    HandleError(strMessage.str().c_str(), GetTokenCount());
    return false;
  }
  else
  {
    switch(oToken.m_Token)
    {
    case TOKEN_KEYWORD:
    case TOKEN_OPERATOR:
      {
        if (oToken.m_Type != GetTestEntry()->m_pTokenTypeList[GetTokenCount()])
        {
          HandleError("keyword or operator expected", GetTokenCount());
          return false;
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
    case TOKEN_MULTILINE_STRING:
      {
        if (strcmp(oToken.m_strName, GetTestEntry()->m_pNameList[GetTokenCount()]) != 0)
        {
          stringstream strMessage;
          strMessage << "expected: \"" << GetTestEntry()->m_pNameList[GetTokenCount()] << "\", result: \"" << oToken.m_strName << "\"";
          HandleError(strMessage.str().c_str(), GetTokenCount());
          return false;
        }
      }
      break;

    case TOKEN_BLOCK_BEGIN:
    case TOKEN_BLOCK_END:
      break;

    }
  }
  IncTokenCount();
  return true;
}
