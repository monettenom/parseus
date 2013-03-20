#include <string>
#include <iostream>
#include <sstream>
#include "parseus.h"
#include "preprocessor.h"

class cCPPCode
: public ICodeHandler
{
public:
  cCPPCode();
  ~cCPPCode();

  void HandleCode(const char* strLine, const cFileInfo& FileInfo);
};

cCPPCode::cCPPCode()
{
}

cCPPCode::~cCPPCode()
{
}

void cCPPCode::HandleCode(const char* strLine, const cFileInfo& FileInfo)
{
  std::cout << strLine << std::endl;
}

int main(int argc, char* argv[])
{
  cCPPCode cppCode;

  cPreProcessor pp(&cppCode);
  pp.AddStandardInclude("C:/Program Files (x86)/Microsoft Visual Studio 8/VC/include");
  pp.AddProjectInclude("C:/Projekte/parseus/parseus");
  pp.AddProjectInclude("C:/Projekte/parseus/cpp_preprocessor");
  pp.AddProjectInclude("C:/Projekte/parseus/examples/preprocessor");
  
  pp.Define("__cplusplus", "199711L");
  pp.Define("_WIN32");
  pp.Define("_WIN64");
  pp.Define("_WINDOWS");
  pp.Define("NDEBUG");
  pp.Define("_MBCS");
  pp.Define("_MSC_VER", 1400);
  pp.Parse("#define __pragma(x)");

  pp.Process("preprocessor.cpp");
}
