#ifndef LOGGING_H
#define LOGGING_H

#include <fstream>

#ifdef _DEBUG
#define LOG(format, ...) cLogger::GetInstance()->Log(__FILE__, __LINE__, __FUNCTION__, format, __VA_ARGS__)
#else
#define LOG(format, ...)
#endif

class cLogger
{
public:
  cLogger();
  ~cLogger();

  void Log(const char* strFile, int nLine, const char* strFunction, const char* strEntry, ...);
  static cLogger* GetInstance();

private:
  std::ofstream m_File;
};


#endif
