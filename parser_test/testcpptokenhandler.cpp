#include "stdafx.h"
#include "testcpptokenhandler.h"
#include "cpptestdata.inc"

using namespace std;

REGISTER_TEST(cTestCPPTokenHandler);

cTestCPPTokenHandler::cTestCPPTokenHandler()
: cTestTokenHandler(&m_Tokenizer, sCPPTestData)
, m_Tokenizer()
{
  m_Tokenizer.SetTokenHandler(this);
}

cTestCPPTokenHandler::~cTestCPPTokenHandler()
{

}

void cTestCPPTokenHandler::HandleToken(tToken& oToken)
{
  if (!GetResult())
    return;

  // will be sent every new line if there was a line before
  if (oToken.m_Token == TOKEN_NEWLINE)
    return;

  if (GetTestEntry()->m_bIgnoreWhitespace && oToken.m_Token == TOKEN_WHITESPACE)
    return;

  if (oToken.m_Token != GetTestEntry()->m_pTokenList[GetTokenCount()])
  {
    stringstream strMessage;
    strMessage << "Token mismatch! Expected: " << m_Tokenizer.GetTokenString(GetTestEntry()->m_pTokenList[GetTokenCount()]) << 
      " result: " << m_Tokenizer.GetTokenString(oToken.m_Token);
    HandleError(strMessage.str().c_str(), GetTokenCount());
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
        }
      }
      break;

    case TOKEN_BLOCK_BEGIN:
    case TOKEN_BLOCK_END:
      break;

    }
  }
  IncTokenCount();
}


