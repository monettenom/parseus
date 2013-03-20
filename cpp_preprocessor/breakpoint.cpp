#include "breakpoint.h"

// cBreakPoint

cBreakPoint::cBreakPoint(const char* strFile, int nLine)
: m_strFile(strFile)
, m_nLine(nLine)
{

}

cBreakPoint::~cBreakPoint()
{
}

bool cBreakPoint::CheckFile(const char* strFile)
{
  return m_bFileHit = m_strFile == strFile;
}

bool cBreakPoint::CheckLine(int nLine)
{
  return m_bFileHit && (m_nLine == nLine);
}
