#include "stdafx.h"
#include "testsuite.h"
#include "preprocessormacro.h"
#include "macroresolver.h"
#include "ppexpression.h"
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
    std::cout << m_strLine.str().c_str() << std::endl;
    m_strLine.str(std::string());
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

  //pp.Process("parser_test.cpp");
  cTestSuite::GetTestSuite()->RunTests();
}
