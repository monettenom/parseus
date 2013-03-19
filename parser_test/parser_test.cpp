#include "stdafx.h"
#include "testsuite.h"
#include "preprocessor.h"

class cPreProcessorStatisticsHandler
: public IPreProcessorStatistics
{
public:
  cPreProcessorStatisticsHandler();
  ~cPreProcessorStatisticsHandler();

  void AddInclude(const char* strInclude, const cFileInfo& FileInfo);
  void AddDefine(const char* strDefine, const cFileInfo& FileInfo);
  void UseDefine(const char* strDefine, const cFileInfo& FileInfo);
};

cPreProcessorStatisticsHandler::cPreProcessorStatisticsHandler()
{

}

cPreProcessorStatisticsHandler::~cPreProcessorStatisticsHandler()
{

}

void cPreProcessorStatisticsHandler::AddInclude(const char* strInclude, const cFileInfo& FileInfo)
{
  std::cout << "ADD INCLUDE: " << strInclude << " (" << FileInfo.GetFile() << ":" << FileInfo.GetLine() << ")" << std::endl;
}

void cPreProcessorStatisticsHandler::AddDefine(const char* strDefine, const cFileInfo& FileInfo)
{
  std::cout << "ADD DEFINE: " << strDefine << " (" << FileInfo.GetFile() << ":" << FileInfo.GetLine() << ")" << std::endl;
}

void cPreProcessorStatisticsHandler::UseDefine(const char* strDefine, const cFileInfo& FileInfo)
{
  std::cout << "USE DEFINE: " << strDefine << " (" << FileInfo.GetFile() << ":" << FileInfo.GetLine() << ")" << std::endl;
}


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
  cPreProcessorStatisticsHandler Stats;

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
  pp.SetPreprocessorStatistics(&Stats);

  pp.Process("parser_test.cpp");
  //pp.LogMacros();
  //cTestSuite::GetTestSuite()->RunTests();
}
