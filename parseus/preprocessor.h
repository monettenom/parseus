#ifndef PREPROCESSOR_H
#define PREPROCESSOR_H

#include "pp_tokenizer.h"
#include "preprocessormacro.h"
#include "macroresolver.h"
#include "ppexpression.h"
#include <vector>
#include <map>
#include <stack>

class ICodeHandler
{
public:
  virtual void HandleCode(char strCode) = 0;
  virtual void HandleCode(const char* strCode) = 0;
};

class cNestingLevel
{
public:
  enum eNestingLevelType
  {
    NLTYPE_NONE,
    NLTYPE_IF,
    NLTYPE_ELSE,
  };

public:
  cNestingLevel(eNestingLevelType eType = NLTYPE_NONE, bool bOutputAllowed = true);
  cNestingLevel(const cNestingLevel& NestingLevel);
  ~cNestingLevel();

  bool IsOutputAllowed();
  eNestingLevelType GetType();
  void DoElse();

private:
  bool m_bOutputAllowed;
  bool m_bWasTrue;
  eNestingLevelType m_eType;
};

typedef std::vector<std::string> tIncludeList;
typedef std::map<std::string, cPreprocessorMacro*> tMacroMap;
typedef std::pair<std::string, cPreprocessorMacro*> tMacroMapEntry;
typedef std::stack<cNestingLevel> tConditionStack;

class cPreProcessor: public ITokenHandler, IMacroMap
{
public:
  cPreProcessor(ICodeHandler* m_pCodeHandler);
  ~cPreProcessor();

  // ITokenHandler
  bool HandleToken(tToken& oToken);
  void HandleError(const char* strError, int iLine);

  void LogEntry(const char* strLog);
  int GetTokenCount(){ return 0; }

  // Configuration
  void AddStandardInclude(const char* strPath);
  void AddProjectInclude(const char* strPath);

  // cPreProcessor
  bool Process(const char* strFile);
  bool Parse(const char* strLine, bool bSkipWhiteSpaces = false, bool bSkipComments = false);
  void Include(const char* strFile);
  bool IsDefined(const char* strMacro);
  void Undef(const char* strMacro);
  void Endif();
  cPreprocessorMacro* GetMacro(const char* strMacro);
  int GetDepth(){return m_ConditionStack.size();}
  void Reset();

protected:
  void OutputCode(char cCode);
  void OutputCode(const char* strCode);
  bool FindInclude(tIncludeList& vIncludes, const char* strFile, std::string& strPath);
  bool FileExists(const char* strFile);
  void HandleMacro(tToken& oToken);
  void ResolveMacro(tToken& oToken);
  void HandleExpression(tToken& oToken);

  bool IsOutputAllowed();

private:
  cPPTokenizer m_Tokenizer;
  tIncludeList m_vStdIncludes;
  tIncludeList m_vPrjIncludes;
  tMacroMap m_MacroMap;
  bool m_bPreProc;
  bool m_bInclude;
  bool m_bUndefNext;
  bool m_bStringify;
  cPreprocessorMacro* m_pCurrentMacro;
  cMacroResolver* m_pMacroResolver;
  cPreprocessorExpression* m_pExpression;
  tConditionStack m_ConditionStack;
  ICodeHandler* m_pCodeHandler;
};

#endif // PREPROCESSOR_H