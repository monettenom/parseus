#ifndef PREPROCESSOR_H
#define PREPROCESSOR_H

#include <vector>
#include <map>
#include <stack>
#include "breakpoint.h"
#include "pp_tokenizer.h"
#include "preprocessormacro.h"
#include "macroresolver.h"
#include "ppexpression.h"
#include "pragmahandler.h"
#include "nestinglevel.h"
#include "fileinfo.h"
#include "preprocessorstatistics.h"

class ICodeHandler
{
public:
  virtual void HandleCode(const char* strLine, const cFileInfo& FileInfo) = 0;
};

typedef std::vector<std::string> tIncludeList;
typedef std::map<std::string, cPreprocessorMacro*> tMacroMap;
typedef std::pair<std::string, cPreprocessorMacro*> tMacroMapEntry;
typedef std::stack<cNestingLevel> tConditionStack;
typedef std::stack<cFileInfo> tFileInfoStack;

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
  cPreprocessorMacro* Define(const char* strMacro, const char* strText = NULL);
  cPreprocessorMacro* Define(const char* strMacro, int nValue);
  bool IsDefined(const char* strMacro);
  void Undef(const char* strMacro);
  void Endif();
  cPreprocessorMacro* GetMacro(const char* strMacro);
  int GetDepth(){return m_ConditionStack.size();}
  void Reset();

  void SetBreakPoint(cBreakPoint* pBreakPoint);
  void SetPreprocessorStatistics(IPreProcessorStatistics* pStats);

  void LogMacros();

protected:
  void OutputCode(char cCode);
  void OutputCode(const char* strCode);
  bool FindInclude(tIncludeList& vIncludes, const char* strFile, std::string& strPath);
  bool FileExists(const char* strFile);
  void HandleMacro(tToken& oToken);
  bool HandleMacroResolver(tToken& oToken);
  void ResolveMacro(tToken& oToken);
  void HandleExpression(tToken& oToken);
  void HandlePragma(tToken& oToken);

  void ProcessPragma(cPragmaHandler* pPragmaHandler);
  cPreprocessorMacro* InsertMacro(const char* strMacro, int nToken, const char* strText);

  bool IsOutputAllowed();
  void SetLineMacro(int iLine);
  void SetFileMacro(const char* strFile);
  void MakeMacroFromPath(std::string& strPath);

  void SetBreakPointFile();
  bool IsBreakPointHit();

private:
  cPPTokenizer m_Tokenizer;
  tIncludeList m_vStdIncludes;
  tIncludeList m_vPrjIncludes;
  tMacroMap m_MacroMap;

  bool m_bPreProc;
  bool m_bInclude;
  bool m_bUndefNext;
  bool m_bStringify;
  bool m_bLogMessage;

  cPreprocessorMacro* m_pCurrentMacro;
  cMacroResolver* m_pMacroResolver;
  cPreprocessorExpression* m_pExpression;
  cPragmaHandler* m_pPragmaHandler;

  tConditionStack m_ConditionStack;
  tFileInfoStack m_FileInfoStack;
  ICodeHandler* m_pCodeHandler;

  cPreprocessorMacro* m_pLineMacro;
  cPreprocessorMacro* m_pFileMacro;

  cBreakPoint* m_pBreakPoint;
  IPreProcessorStatistics* m_pStats;

  std::stringstream m_strLine;
};

#endif // PREPROCESSOR_H