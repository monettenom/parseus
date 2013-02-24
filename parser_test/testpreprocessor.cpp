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

int cTestPreprocessor::CreateInclude(const char** strLines, int iStartIndex)
{
  std::ofstream ofile(strLines[iStartIndex]+1, ios::out);
  while (strcmp(strLines[++iStartIndex], "<") != 0)
  {
    ofile.write(strLines[iStartIndex], strlen(strLines[iStartIndex]));
    ofile.write("\n", 1);
  }
  return iStartIndex;
}

bool cTestPreprocessor::Test(tTestData* pTestData)
{
  IncTestCount();
  m_Preprocessor.Reset();
  InitTest(pTestData);
  for (int i = 0; pTestData->m_strCode[i] != NULL; i++)
  {
    TEST_LOG("Code: \"%s\"", pTestData->m_strCode[i]);
    switch (pTestData->m_strCode[i][0])
    {
      case '>':
        i = CreateInclude(pTestData->m_strCode, i);
        break;
      case '-':
        _unlink(pTestData->m_strCode[i]+1);
        break;
      default:
        m_Preprocessor.Parse(pTestData->m_strCode[i]);
        break;
    }
    printf("Depth: %d\n", m_Preprocessor.GetDepth());
  }
  HandleCode('\n');
  if (pTestData->m_nExpectedTokens != IGNORE_TOKEN_COUNT && pTestData->m_nExpectedTokens != GetTokenCount())
  {
    TEST_LOG("Expected tokens: %d, tokens found: %d", pTestData->m_nExpectedTokens, GetTokenCount());
    SetResult(false);
  }
  return GetResult();
}

bool cTestPreprocessor::HandleToken(tToken& oToken)
{
  m_Tokenizer.LogToken(oToken);

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

