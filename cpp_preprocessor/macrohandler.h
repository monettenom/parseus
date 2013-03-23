#ifndef MACROHANDLER_H
#define MACROHANDLER_H

typedef std::map<std::string, cPreprocessorMacro*> tMacroMap;
typedef std::pair<std::string, cPreprocessorMacro*> tMacroMapEntry;
typedef std::stack<cFileInfo> tFileInfoStack;

class cMacroHandler
: public IMacroHandler
{
public:
  cMacroHandler();
  ~cMacroHandler();

  void Reset();

  void SetPreprocessorStatistics(IPreProcessorStatistics* pStats);

  cPreprocessorMacro* GetMacro(const char* strMacro);
  void Undef(const char* strMacro);
  bool IsDefined(const char* strMacro);
  cPreprocessorMacro* Define(const char* strMacro, const char* strText = NULL);
  cPreprocessorMacro* Define(const char* strMacro, int nValue);

  void LogMacros();

protected:
  cPreprocessorMacro* InsertMacro(const char* strMacro, int nToken, const char* strText);
  cPreprocessorMacro* InsertMacro(cPreprocessorMacro* pMacro);

  // FileInfo access
  int GetCurrentLine() const;
  const char* GetCurrentFile() const;
  void IncCurrentLine();
  void PushFileInfo(const char* strFile, int iLine);
  void PopFileInfo();
  const cFileInfo& GetFileInfo();

  IPreProcessorStatistics* Stats();

private:
  IPreProcessorStatistics* m_pStats;
  tMacroMap m_MacroMap;
  tFileInfoStack m_FileInfoStack;
};

#endif // MACROHANDLER