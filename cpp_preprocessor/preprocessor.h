#ifndef PREPROCESSOR_H
#define PREPROCESSOR_H

typedef std::vector<std::string> tIncludeList;
typedef std::stack<cNestingLevel> tConditionStack;

class cPreProcessor
: public cMacroHandler
, public ITokenHandler
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

  // cPreProcessorContext
  void Reset();

  // cPreProcessor
  bool Process(const char* strFile);
  bool Parse(const char* strLine, bool bSkipWhiteSpaces = false, bool bSkipComments = false);
  void Include(const char* strFile);
  void Endif();

  int GetDepth(){return m_ConditionStack.size();}
  bool IsOutputAllowed();

  void SetBreakPoint(cBreakPoint* pBreakPoint);

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

  void SetLineMacro(int iLine);
  void SetFileMacro(const char* strFile);
  void MakeMacroFromPath(std::string& strPath);

  void SetBreakPointFile();
  bool IsBreakPointHit();

private:
  cPPTokenizer m_Tokenizer;
  tIncludeList m_vStdIncludes;
  tIncludeList m_vPrjIncludes;

  bool m_bPreProc;
  bool m_bInclude;
  bool m_bUndefNext;
  bool m_bStringify;
  bool m_bLogMessage;

  tConditionStack m_ConditionStack;

  cPreprocessorMacro* m_pCurrentMacro;
  cMacroResolver* m_pMacroResolver;
  cPreprocessorExpression* m_pExpression;
  cPragmaHandler* m_pPragmaHandler;

  ICodeHandler* m_pCodeHandler;

  cPreprocessorMacro* m_pLineMacro;
  cPreprocessorMacro* m_pFileMacro;

  cBreakPoint* m_pBreakPoint;

  std::stringstream m_strLine;
};

#endif // PREPROCESSOR_H