#ifndef LOGGING_H
#define LOGGING_H

#define LOG(format, ...) cLogger::GetInstance()->Log(__FILE__, __LINE__, __FUNCTION__, format, __VA_ARGS__)

class cLogger
{
public:
  cLogger();
  ~cLogger();

  void Log(const char* strFile, int nLine, const char* strFunction, const char* strEntry, ...);

  static cLogger* GetInstance();

private:
  FILE* m_File;
};


#endif