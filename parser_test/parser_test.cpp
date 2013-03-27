#include "stdafx.h"
#include "preprocessorlib.h"

class cCPPCode
: public cCPPTokenizer
, public ICodeHandler
{
public:
  cCPPCode();
  ~cCPPCode();

  void HandleCode(const char* strLine, const cFileInfo& FileInfo);

private:

};

cCPPCode::cCPPCode()
{
}

cCPPCode::~cCPPCode()
{
}

void cCPPCode::HandleCode(const char* strLine, const cFileInfo& FileInfo)
{
  static std::string strLastFile;

  if (FileInfo.GetFile() != strLastFile)
  {
    std::cout << FileInfo.GetFile() << std::endl;
    strLastFile = FileInfo.GetFile();
  }

  std::cout << FileInfo.GetLine() << ": " << strLine << std::endl;

  LOG("OUTPUT: %s", strLine);
}

int main(int argc, char* argv[])
{
  cCPPCode cppCode;
  cPreProcessor pp(&cppCode);
  pp.AddStandardInclude("C:/Program Files (x86)/Microsoft Visual Studio 8/VC/include");
  pp.AddProjectInclude("C:/Projekte/parseus");
  pp.AddProjectInclude("C:/Projekte/parseus/parseus");

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
