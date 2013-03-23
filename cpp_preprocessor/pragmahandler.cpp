#include "stdafx.h"

static tKeyword g_KeyWords[] = {
  {"", PP_PRAGMA_NULL},
  {"alloc_text", PP_PRAGMA_ALLOC_TEXT},
  {"auto_inline", PP_PRAGMA_AUTO_INLINE},
  {"bss_seg", PP_PRAGMA_BSS_SEG},
  {"check_stack", PP_PRAGMA_CHECK_STACK},
  {"code_seg", PP_PRAGMA_CODE_SEG},
  {"comment", PP_PRAGMA_COMMENT},
  {"component", PP_PRAGMA_COMPONENT},
  {"conform", PP_PRAGMA_CONFORM},
  {"const_seg", PP_PRAGMA_CONST_SEG},
  {"data_seg", PP_PRAGMA_DATA_SEG},
  {"deprecated", PP_PRAGMA_DEPRECATED},
  {"function", PP_PRAGMA_FUNCTION},
  {"hdrstop", PP_PRAGMA_HDRSTOP},
  {"include_alias", PP_PRAGMA_INCLUDE_ALIAS},
  {"init_seg", PP_PRAGMA_INIT_SEG},
  {"inline_depth", PP_PRAGMA_INLINE_DEPTH},
  {"inline_recursion", PP_PRAGMA_INLINE_RECURSION},
  {"intrinsic", PP_PRAGMA_INTRINSIC},
  {"managed", PP_PRAGMA_MANAGED},
  {"message", PP_PRAGMA_MESSAGE},
  {"once", PP_PRAGMA_ONCE},
  {"optimize", PP_PRAGMA_OPTIMIZE},
  {"pack", PP_PRAGMA_PACK},
  {"pointers_to_members", PP_PRAGMA_POINTERS_TO_MEMBERS},
  {"pop_macro", PP_PRAGMA_POP_MACRO},
  {"push_macro", PP_PRAGMA_PUSH_MACRO},
  {"runtime_checks", PP_PRAGMA_RUNTIME_CHECKS},
  {"section", PP_PRAGMA_SECTION},
  {"setlocale", PP_PRAGMA_SETLOCALE},
  {"unmanaged", PP_PRAGMA_UNMANAGED},
  {"vtordisp", PP_PRAGMA_VTORDISP},
  {"warning", PP_PRAGMA_WARNING},
  {"unknown", PP_PRAGMA_UNKNOWN}
};

cPragmaHandler::cPragmaHandler()
: m_eState(eInit)
, m_nKeyword(PP_PRAGMA_UNKNOWN)
{
  tKeyword* pCrsr = g_KeyWords;
  while (pCrsr->m_Type != PP_PRAGMA_UNKNOWN)
  {
    m_Keywords.insert(std::pair<std::string, int>(pCrsr->m_strKeyword, pCrsr->m_Type));
    pCrsr++;
  }
}

cPragmaHandler::~cPragmaHandler()
{

}

bool cPragmaHandler::IsKeyword(const char* strLabel)
{
  tKeywordMap::iterator it = m_Keywords.find(std::string(strLabel));
  return it != m_Keywords.end();
}

bool cPragmaHandler::HandleToken(tToken& oToken)
{
  if (oToken.IsToken(TOKEN_WHITESPACE))
  {
    return true;
  }

  switch (m_eState)
  {
    case eInit:
      if (oToken.IsToken(TOKEN_LABEL) && IsKeyword(oToken.m_strName))
      {
        m_nKeyword = m_Keywords[oToken.m_strName];
        m_eState = eParam;
      }
      else
      {
        m_eState = eError;
      }
      break;
    case eParam:
      if (oToken.IsToken(TOKEN_NEWLINE))
      {
        m_eState = eReady;
      }
      else
      {
        m_vParamList.push_back(oToken);
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

bool cPragmaHandler::IsReady()
{
  return m_eState == eReady;
}

int cPragmaHandler::GetPragma()
{
  return m_nKeyword;
}

tTokenList& cPragmaHandler::GetParams()
{
  return m_vParamList;
}

int cPragmaHandler::GetTokenCount()
{
  return m_vParamList.size();
}
