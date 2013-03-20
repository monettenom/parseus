#ifndef FILEINFO_H
#define FILEINFO_H

class cFileInfo
{
private:
  std::string m_strFile;
  int m_iLine;

public:
  cFileInfo()
  : m_strFile()
  , m_iLine(0)
  {
  }

  cFileInfo(std::string strFile, int iLine)
  : m_strFile(strFile)
  , m_iLine(iLine)
  {
  }

  const char* GetFile() const
  {
    return m_strFile.c_str();
  }

  int GetLine() const
  {
    return m_iLine;
  }

  void IncLine()
  {
    m_iLine++;
  }
};

#endif
