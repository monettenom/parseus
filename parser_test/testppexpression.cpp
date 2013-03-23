#include "stdafx.h"
#include "preprocessorlib.h"
#include "testppexpression.h"
#include "ppexptestdata.inc"

using namespace std;

REGISTER_TEST(cTestPPExpression);

cTestPPExpression::cTestPPExpression()
: cTestTokenHandler(&m_Tokenizer, sPPExpressionTestData)
, m_Tokenizer()
, m_pExpression(NULL)
, m_pCurrentMacro(NULL)
{
  m_Tokenizer.SetTokenHandler(this);
}

cTestPPExpression::~cTestPPExpression()
{
}

bool cTestPPExpression::IsDefined(const char* strMacro)
{
  return GetMacro(strMacro) != NULL;
}

cPreprocessorMacro* cTestPPExpression::GetMacro(const char* strMacro)
{
  tMacroMap::const_iterator it = m_MacroMap.find(strMacro);
  if (it != m_MacroMap.end())
    return it->second;
  else
    return NULL;
}

void cTestPPExpression::HandleMacro(tToken& oToken)
{
  if (!m_pCurrentMacro->HandleToken(oToken))
  {
    std::cout << "Error while handling preprocessor macro!" << std::endl;
    delete m_pCurrentMacro;
    m_pCurrentMacro = NULL;
  }
  else if (m_pCurrentMacro->IsReady())
  {
    tMacroMap::iterator it = m_MacroMap.find(m_pCurrentMacro->GetName());
    if (it == m_MacroMap.end())
    {
      m_MacroMap.insert(tMacroMapEntry(m_pCurrentMacro->GetName(), m_pCurrentMacro));
    }
    else
    {
      delete it->second;
      it->second = m_pCurrentMacro;
    }
    m_pCurrentMacro = NULL;
  }
}

void cTestPPExpression::HandleExpression(tToken& oToken)
{
  if (!m_pExpression->HandleToken(oToken))
  {
    delete m_pExpression;
    m_pExpression = NULL;
    HandleError("Expression error!", GetTokenCount());
  }
  else if (m_pExpression->IsReady())
  {
    int iResult = m_pExpression->Evaluate();
    delete m_pExpression;
    m_pExpression = NULL;

    if (iResult != GetTestEntry()->m_pTokenList[0])
    {
      stringstream strMessage;
      strMessage << "Expected: " << GetTestEntry()->m_pTokenList[0] << 
        " expression: " << iResult;
      HandleError(strMessage.str().c_str(), GetTokenCount());
    }
  }
}

bool cTestPPExpression::HandleToken(tToken& oToken)
{
  if (!GetResult())
    return false;

  // will be sent every new line if there was a line before
  if (oToken.m_Token == TOKEN_NEWLINE)
    return true;

  if (m_pCurrentMacro)
  {
    IncTokenCount();
    HandleMacro(oToken);
    return true;
  }

  if (GetTestEntry()->m_bIgnoreWhitespace && oToken.m_Token == TOKEN_WHITESPACE)
    return true;

  IncTokenCount();

  if (m_pExpression != NULL)
  {
    HandleExpression(oToken);
    return true;
  }

  if (oToken.IsToken(TOKEN_KEYWORD, PP_KW_IF))
  {
    m_pExpression = new cPreprocessorExpression(this);
  }
  if (oToken.IsToken(TOKEN_KEYWORD, PP_KW_DEFINE))
  {
    m_pCurrentMacro = new cPreprocessorMacro;
  }
  return true;
}

