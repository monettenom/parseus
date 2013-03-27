#ifndef PPINTERFACES_H
#define PPINTERFACES_H

class ICodeHandler
{
public:
  virtual void HandleCode(const char* strLine, const cFileInfo& FileInfo) = 0;
};

class IPreProcessorStatistics
{
public:
  virtual void AddInclude(const char* strInclude, const cFileInfo& FileInfo) = 0;
  virtual void AddDefine(const char* strDefine, const cFileInfo& FileInfo) = 0;
  virtual void UseDefine(const char* strDefine, const cFileInfo& FileInfo) = 0;
  virtual void AddSource(const char* strCode, const cFileInfo& FileInfo) = 0;
};

class IMacroHandler
{
public:
  virtual bool IsDefined(const char* strMacro) = 0;
  virtual cPreprocessorMacro* GetMacro(const char* strMacro) = 0;
  virtual const cFileInfo& GetFileInfo() = 0;
  virtual IPreProcessorStatistics* Stats() = 0;
};

#endif // PPINTERFACES_H
