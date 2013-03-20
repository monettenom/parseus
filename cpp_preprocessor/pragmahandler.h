#ifndef PRAGMA_HANDLER_H
#define PRAGMA_HANDLER_H

#include "tokenizer.h"

enum ePragmaTokenType
{
  PP_PRAGMA_NULL,
  PP_PRAGMA_ALLOC_TEXT,
  PP_PRAGMA_AUTO_INLINE,
  PP_PRAGMA_BSS_SEG,
  PP_PRAGMA_CHECK_STACK,
  PP_PRAGMA_CODE_SEG,
  PP_PRAGMA_COMMENT,
  PP_PRAGMA_COMPONENT,
  PP_PRAGMA_CONFORM,
  PP_PRAGMA_CONST_SEG,
  PP_PRAGMA_DATA_SEG,
  PP_PRAGMA_DEPRECATED,
  PP_PRAGMA_FUNCTION,
  PP_PRAGMA_HDRSTOP,
  PP_PRAGMA_INCLUDE_ALIAS,
  PP_PRAGMA_INIT_SEG,
  PP_PRAGMA_INLINE_DEPTH,
  PP_PRAGMA_INLINE_RECURSION,
  PP_PRAGMA_INTRINSIC,
  PP_PRAGMA_MANAGED,
  PP_PRAGMA_MESSAGE,
  PP_PRAGMA_ONCE,
  PP_PRAGMA_OPTIMIZE,
  PP_PRAGMA_PACK,
  PP_PRAGMA_POINTERS_TO_MEMBERS,
  PP_PRAGMA_POP_MACRO,
  PP_PRAGMA_PUSH_MACRO,
  PP_PRAGMA_RUNTIME_CHECKS,
  PP_PRAGMA_SECTION,
  PP_PRAGMA_SETLOCALE,
  PP_PRAGMA_UNMANAGED,
  PP_PRAGMA_VTORDISP,
  PP_PRAGMA_WARNING,
  PP_PRAGMA_UNKNOWN
};

class cPragmaHandler: public ITokenHandler
{
public:
  cPragmaHandler();
  ~cPragmaHandler();

  bool HandleToken(tToken& oToken);
  bool IsReady();
  int GetPragma();
  tTokenList& GetParams();

  void HandleError(const char* strError, int iLine){};
  void LogEntry(const char* strLog){};
  int GetTokenCount();
  bool IsKeyword(const char* strLabel);

private:
  enum eMacroState
  {
    eError = -1,
    eInit = 0,
    eName,
    eParam,
    eReady
  } m_eState;

  int m_nKeyword;
  tKeywordMap m_Keywords;
  tTokenList m_vParamList;
};


#endif