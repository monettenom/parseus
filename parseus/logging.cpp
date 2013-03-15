#include <stdarg.h>
#include <string.h>
#include "logging.h"

cLogger::cLogger()
{
  m_File.open("parseus.log");
}

cLogger::~cLogger()
{
  m_File.close();
}

void cLogger::Log(const char* strFile, int nLine, const char* strFunction, const char* strFormat, ...)
{
  va_list args;
  char strBuffer[2048];

  va_start(args, strFormat);
  vsnprintf(strBuffer, 2048, strFormat, args);
  va_end(args);

  const char* strCrsr = strrchr(strFile, '\\');
  if (!strCrsr)
    strCrsr = strFile;
  else
    strCrsr++;
  m_File << strCrsr << ':' << nLine << ' ' << strFunction << ":\t" << strBuffer << std::endl;
}

cLogger* cLogger::GetInstance()
{
  static cLogger* pLogger = NULL;

  if (!pLogger)
  {
    pLogger = new cLogger;
  }
  return pLogger;
}



