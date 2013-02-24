#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include "logging.h"

cLogger::cLogger()
{
  m_File = fopen("parseus.log", "w");
}

cLogger::~cLogger()
{
  fclose(m_File);
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
  fprintf(m_File, "%s:%d %s:\t%s\n", strCrsr, nLine, strFunction, strBuffer);
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



