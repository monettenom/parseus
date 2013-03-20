#ifndef BREAKPOINT_H
#define BREAKPOINT_H

#include <string>

#if defined(_DEBUG) && defined(WIN32)
# define TRIGGER_BREAKPOINT __asm int 3
#else
# define TRIGGER_BREAKPOINT
#endif

class cBreakPoint
{
public:
  cBreakPoint(const char* strFile, int nLine);
  ~cBreakPoint();

  bool CheckFile(const char* strFile);
  bool CheckLine(int nLine);

private:
  std::string m_strFile;
  int m_nLine;
  bool m_bFileHit;
};

#endif
