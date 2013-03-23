#include "stdafx.h"

cPreprocessorMacro::cPreprocessorMacro()
: m_eState(eInit)
{
}

cPreprocessorMacro::~cPreprocessorMacro()
{
}

bool cPreprocessorMacro::IsReady()
{
  return m_eState == eReady;
}

int cPreprocessorMacro::GetParamCount()
{
  return m_vParamList.size();
}

const char* cPreprocessorMacro::GetParam(int nIndex)
{
  return m_vParamList[nIndex].m_strName;
}

const char* cPreprocessorMacro::GetName()
{
  return m_strName.c_str();
}

tTokenList& cPreprocessorMacro::GetMacroText()
{
  return m_vMacroText;
}

bool cPreprocessorMacro::HandleToken(tToken& oToken)
{
  switch(m_eState)
  {
    case eInit:
      switch (oToken.m_Token)
      {
        case TOKEN_WHITESPACE:
          break;
        case TOKEN_LABEL:
          m_strName = oToken.m_strName;
          m_eState = eName;
          break;
        default:
          // label expected
          m_eState = eError;
          return false;
      }
      break;
    case eName:
      if (oToken.IsToken(TOKEN_OPERATOR, PP_OP_BRACKET_OPEN))
      {
        m_eState = eParam;
      }
      else
      {
        m_eState = eMacro;
        // the current macro must be processed
        return HandleToken(oToken);
      }
      break;
    case eParam:
      switch(oToken.m_Token)
      {
        case TOKEN_OPERATOR:
          switch(oToken.m_Type)
          {
            case PP_OP_BRACKET_CLOSE:
              m_eState = eMacro;
              break;
            case PP_OP_COMMA:
              //ignore
              break;
            case PP_OP_ELLIPSIS:
              m_vParamList.push_back(tToken("__VA_ARGS__"));
              break;
            default:
              // unexpected
              break;
          }
          break;
        case TOKEN_LABEL:
          m_vParamList.push_back(oToken);
          break;
        case TOKEN_WHITESPACE:
          break;
        default:
          // unexpected
          break;
      }
      break;
    case eMacro:
      switch (oToken.m_Token)
      {
        case TOKEN_OPERATOR:
          if (oToken.m_Type == PP_OP_PREPROC_END)
            m_eState = eReady;
          else
            m_vMacroText.push_back(oToken);
          break;
        case TOKEN_WHITESPACE:
          if (m_vMacroText.size() > 0 &&
              m_vMacroText[m_vMacroText.size()-1].m_Token != TOKEN_WHITESPACE)
          {
            m_vMacroText.push_back(tToken(TOKEN_WHITESPACE, " "));
          }
          break;
        default:
          m_vMacroText.push_back(oToken);
          break;
      }
      break;
    case eReady:
    case eError:
      return false;
    default:
      m_eState = eError;
      return false;
  }
  return true;
}

void cPreprocessorMacro::Debug()
{
  LOG("Name: %s", m_strName);

  for (tTokenList::const_iterator it = m_vParamList.begin();
    it != m_vParamList.end(); ++it)
  {
    switch (it->m_Token)
    {
      case TOKEN_LABEL:
        LOG("Param: %s", *it->m_strName);
        break;
      case TOKEN_OPERATOR:
        switch (it->m_Type)
        {
          case PP_OP_ELLIPSIS:
            LOG("Operator: Ellipsis");
            break;
          default:
            LOG("Operator: %d");
            break;
        }
        break;
    }
  }

  LOG("Macro text tokens: %d", m_vMacroText.size());
}
