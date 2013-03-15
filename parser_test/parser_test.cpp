#include "stdafx.h"
#include "testsuite.h"
#include "preprocessor.h"


class cCPPCode
: public cCPPTokenizer
, public ICodeHandler
{
public:
  cCPPCode();
  ~cCPPCode();

  void HandleCode(char strCode);
  void HandleCode(const char* strCode);

private:
  std::stringstream m_strLine;
};

cCPPCode::cCPPCode()
{
}

cCPPCode::~cCPPCode()
{
}

void cCPPCode::HandleCode(char strCode)
{
  if (strCode == '\n')
  {
    //Parse(m_strLine.str().c_str());
    if (m_strLine.str().length() > 0)
    {
      std::cout << m_strLine.str() << std::endl;
      LOG("OUTPUT: %s", m_strLine.str().c_str());
      m_strLine.str(std::string());
    }
  }
  else
  {
    m_strLine << strCode;
  }
}

void cCPPCode::HandleCode(const char* strCode)
{
  m_strLine << strCode;
}

int main(int argc, char* argv[])
{
  cCPPCode cppCode;
  cPreProcessor pp(&cppCode);
  pp.AddStandardInclude("C:/Program Files (x86)/Microsoft Visual Studio 8/VC/include");
  pp.AddProjectInclude("D:/Projekte/parseus");
  pp.AddProjectInclude("D:/Projekte/parseus/parseus");
  
  pp.Define("__cplusplus", "199711L");
  pp.Define("_WIN32");
  pp.Define("_WIN64");
  pp.Define("_WINDOWS");
  pp.Define("NDEBUG");
  pp.Define("_MBCS");
  pp.Define("_MSC_VER", 1400);
  pp.Parse("#define __pragma(x)");

  cBreakPoint BreakPoint("C:/Program Files (x86)/Microsoft Visual Studio 8/VC/include/crtdefs.h", 713);
  pp.SetBreakPoint(&BreakPoint);

  //pp.Process("parser_test.cpp");
  //pp.LogMacros();
  cTestSuite::GetTestSuite()->RunTests();
}
