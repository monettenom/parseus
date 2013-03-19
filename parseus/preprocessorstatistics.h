#ifndef PREPROCESSORSTATISTICS_H
#define PREPROCESSORSTATISTICS_H

class IPreProcessorStatistics
{
public:
  virtual void AddInclude(const char* strInclude, const cFileInfo& FileInfo) = 0;
  virtual void AddDefine(const char* strDefine, const cFileInfo& FileInfo) = 0;
  virtual void UseDefine(const char* strDefine, const cFileInfo& FileInfo) = 0;
};

class cPreProcessorStatisticsDummy
  : public IPreProcessorStatistics
{
public:
  void AddInclude(const char* strInclude, const cFileInfo& FileInfo){};
  void AddDefine(const char* strDefine, const cFileInfo& FileInfo){};
  void UseDefine(const char* strDefine, const cFileInfo& FileInfo){};
};

#endif
