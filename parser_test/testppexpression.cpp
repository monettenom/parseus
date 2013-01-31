#include "stdafx.h"
#include "testppexpression.h"
#include "ppexptestdata.inc"

using namespace std;

REGISTER_TEST(cTestPPExpression);

cTestPPExpression::cTestPPExpression()
: cTestTokenHandler(&m_Tokenizer, sPPExpressionTestData)
, m_Tokenizer()
, m_pExpression(NULL)
{
  m_Tokenizer.SetTokenHandler(this);
}

cTestPPExpression::~cTestPPExpression()
{
}

bool cTestPPExpression::IsDefined(const char* strMacro)
{
  return true;
}

cPreprocessorMacro* cTestPPExpression::GetMacro(const char* strMacro)
{
  return NULL;
}

void cTestPPExpression::HandleToken(tToken& oToken)
{
  if (!GetResult())
    return;

  // will be sent every new line if there was a line before
  if (oToken.m_Token == TOKEN_NEWLINE)
    return;

  if (GetTestEntry()->m_bIgnoreWhitespace && oToken.m_Token == TOKEN_WHITESPACE)
    return;

  IncTokenCount();

  if (m_pExpression != NULL)
  {
    if (!m_pExpression->HandleToken(oToken))
    {
      delete m_pExpression;
      m_pExpression = NULL;
      HandleError("Expression error!", GetTokenCount());
    }
    else if (m_pExpression->IsReady())
    {
      int iResult = m_pExpression->Evaluate(this);
      delete m_pExpression;
      m_pExpression = NULL;

      if (iResult != GetTestEntry()->m_pTokenList[0])
      {
        stringstream strMessage;
        strMessage << "Expected result: " << GetTestEntry()->m_pTokenList[0] << 
                      " expression result: " << iResult;
        HandleError(strMessage.str().c_str(), GetTokenCount());
      }
    }
  }

  if (oToken.IsToken(TOKEN_KEYWORD, PP_KW_IF))
  {
    m_pExpression = new cPreprocessorExpression;
  }
}

