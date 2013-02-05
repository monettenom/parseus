#ifndef PREPROCESSOR_H
#define PREPROCESSOR_H

#include "pp_tokenizer.h"
#include "preprocessormacro.h"
#include "macroresolver.h"
#include "ppexpression.h"
#include <vector>
#include <map>
#include <stack>

typedef std::vector<std::string> tIncludeList;
typedef std::map<std::string, cPreprocessorMacro*> tMacroMap;
typedef std::pair<std::string, cPreprocessorMacro*> tMacroMapEntry;
typedef std::stack<bool> tConditionStack;

class cPreProcessor: public ITokenHandler, IMacroMap
{
public:
  cPreProcessor();
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
  void Include(const char* strFile);
  bool IsDefined(const char* strMacro);
  cPreprocessorMacro* GetMacro(const char* strMacro);

protected:
  void OutputCode(char cCode);
  void OutputCode(const char* strCode);
  bool FindInclude(tIncludeList& vIncludes, const char* strFile, std::string& strPath);
  void HandleMacro(tToken& oToken);
  void ResolveMacro(tToken& oToken);
  void HandleExpression(tToken& oToken);

private:
  cPPTokenizer m_Tokenizer;
  tIncludeList m_vStdIncludes;
  tIncludeList m_vPrjIncludes;
  tMacroMap m_MacroMap;
  bool m_bPreProc;
  bool m_bInclude;
  cPreprocessorMacro* m_pCurrentMacro;
  cMacroResolver* m_pMacroResolver;
  cPreprocessorExpression* m_pExpression;
  tConditionStack m_ConditionStack;
};

#endif // PREPROCESSOR_H