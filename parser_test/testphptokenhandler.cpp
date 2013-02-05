#include "stdafx.h"
#include "testphptokenhandler.h"
#include "phptestdata.inc"

using namespace std;

REGISTER_TEST(cTestPhpTokenHandler);

cTestPhpTokenHandler::cTestPhpTokenHandler()
: cTestTokenHandler(&m_Tokenizer, sPhpTestData)
, m_Tokenizer()
{
  m_Tokenizer.SetTokenHandler(this);
}

cTestPhpTokenHandler::~cTestPhpTokenHandler()
{

}

bool cTestPhpTokenHandler::HandleToken(tToken& oToken)
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
      case TOKEN_OPERATOR:
        {
          if (oToken.m_Type != GetTestEntry()->m_pTokenTypeList[GetTokenCount()])
          {
            stringstream strMessage;
            strMessage << 
              "Operator mismatch. Expected: " << 
              m_Tokenizer.GetOperatorString(GetTestEntry()->m_pTokenTypeList[GetTokenCount()]) << 
              ", found: " <<
              m_Tokenizer.GetOperatorString(oToken.m_Type);
            HandleError(strMessage.str().c_str(), GetTokenCount());
            return false;
          }
        }
        break;

      case TOKEN_KEYWORD:
        {
          if (oToken.m_Type != GetTestEntry()->m_pTokenTypeList[GetTokenCount()])
          {
            stringstream strMessage;
            strMessage << 
              "Keyword mismatch. Expected: " << 
              m_Tokenizer.GetKeywordString(GetTestEntry()->m_pTokenTypeList[GetTokenCount()]) << 
              ", found: " <<
              m_Tokenizer.GetKeywordString(oToken.m_Type);
            HandleError(strMessage.str().c_str(), GetTokenCount());
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

