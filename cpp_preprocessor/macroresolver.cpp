#include "stdafx.h"

cMacroResolver::cMacroResolver(cPreprocessorMacro* pMacro)
: m_pMacro(pMacro)
, m_nBracketDepth(0)
, m_nParamIndex(0)
, m_bEllipsis(false)
{
  if (m_pMacro->GetParamCount() == 0)
  {
    m_eState = eReady;
  }
  else
  {
    FinishParam();
    m_eState = eInit;
  }
}

cMacroResolver::~cMacroResolver()
{
}

void cMacroResolver::FinishParam()
{
  if (m_nParamIndex < m_pMacro->GetParamCount())
  {
    m_itCurrentParam = m_Params.insert(tParamMapEntry(m_pMacro->GetParam(m_nParamIndex), tTokenList())).first;
    if (m_itCurrentParam->first == "__VA_ARGS__")
    {
      LOG("__VA_ARGS__");
      m_bEllipsis = true;
    }
    m_nParamIndex++;
    if (m_nParamIndex > m_pMacro->GetParamCount())
    {
      LOG("Ready");
      m_eState = eReady;
    }
  }
  else
  {
    LOG("Ready");
    m_eState = eReady;
  }
}

bool cMacroResolver::HandleToken(tToken& oToken)
{
  if (oToken.IsToken(TOKEN_WHITESPACE))
  {
    m_Output.push_back(oToken);
    return true;
  }

  switch(m_eState)
  {
  case eInit:
    {
      LOG("eInit");
      if (oToken.IsToken(TOKEN_OPERATOR, PP_OP_BRACKET_OPEN))
      {
        LOG("Param");
        m_eState = eParam;
      }
      else
      {
        LOG("Error");
        m_eState = eError;
      }
    }
    break;
  case eParam:
    {
      LOG("eParam");
      bool bParamReady = false;
      bool bComma = false;

      if (oToken.IsToken(TOKEN_OPERATOR))
      {
        switch (oToken.m_Type)
        {
          case PP_OP_BRACKET_CLOSE:
            if (m_nBracketDepth == 0)
            {
              bParamReady = true;
            }
            else
            {
              m_nBracketDepth--;
            }
            break;
          case PP_OP_BRACKET_OPEN:
            m_nBracketDepth++;
            break;
          case PP_OP_COMMA:
            bComma = true;
            break;
        }
      }

      // if bracket depth is zero and comma is not inside brackets and not ellipsis mode
      if(bParamReady || ((m_nBracketDepth == 0) && bComma) && !m_bEllipsis)
      {
        FinishParam();
      }
      else
      {
        m_itCurrentParam->second.push_back(oToken);
      }
    }
    break;

  case eReady:
    LOG("eReady");
    return true;
  case eError:
    LOG("eError");
    return false;
  default:
    LOG("Error");
    m_eState = eError;
    return false;
  }

  return true;
}

bool cMacroResolver::IsParam(const char* strLabel)
{
  tParamMap::iterator it = m_Params.find(strLabel);
  return it != m_Params.end();
}

void cMacroResolver::CallTokenHandler(ITokenHandler* pHandler, tToken& oToken)
{
  pHandler->HandleToken(oToken);
}

void cMacroResolver::InsertParamText(ITokenHandler* pHandler, tTokenList& tokenList)
{
  for (tTokenList::iterator it = tokenList.begin(); it != tokenList.end(); ++it)
  {
    CallTokenHandler(pHandler, *it);
  }
}

bool cMacroResolver::ExpandMacro(ITokenHandler* pHandler)
{
  if (m_Params.size() == 0)
  {
    LOG("Simple Macro");
    InsertParamText(pHandler, m_pMacro->GetMacroText());
    return true;
  }

  tTokenList& tokenList = m_pMacro->GetMacroText();
  for (tTokenList::iterator it = tokenList.begin(); it != tokenList.end(); ++it)
  {
    switch((*it).m_Token)
    {
    case TOKEN_LABEL:
      if (IsParam((*it).m_strName))
      {
        InsertParamText(pHandler, m_Params[(*it).m_strName]);
      }
      else
      {
        CallTokenHandler(pHandler, *it);
      }
      break;
    default:
      CallTokenHandler(pHandler, *it);
      break;
    }
  }
  return true;
}

bool cMacroResolver::IsReady()
{
  return m_eState == eReady;
}
