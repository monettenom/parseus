#include "stdafx.h"
#include "parseus.h"
#include "preprocessorlib.h"

// cPreProcessorStatisticsHandler

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

// cCPPCode

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

void Test()
{
  cCPPCode cppCode;
  cPreProcessorStatisticsHandler Stats;

  cPreProcessor pp(&cppCode);
  pp.AddStandardInclude("C:/Program Files (x86)/Microsoft Visual Studio 8/VC/include");
  pp.AddProjectInclude("C:/Projekte/parseus/parseus");
  pp.AddProjectInclude("C:/Projekte/parseus/cpp_preprocessor");
  pp.AddProjectInclude("C:/Projekte/parseus/examples/ppdbmaker");

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

int main(int argc, char* argv[])
{
  cSQLiteDB db("C:/Projekte/parseus/examples/ppdbmaker/test.sqlite");

  if (db.Open(true))
  {
    if(db.CreateTable("a", "CREATE TABLE a (b INTEGER, c INTEGER);", true))
    {
      tSQLiteDBRow dbRow;
      dbRow["b"] = "100";
      dbRow["c"] = "200";
      db.InsertRow("a", dbRow);
      dbRow["b"] = "300";
      dbRow["c"] = "400";
      db.InsertRow("a", dbRow);

      cSQLiteSelect* pSelect = db.Select("select * from a");
      tSQLiteDBRow dbResult;

      while (pSelect->Fetch(dbResult))
      {
        std::cout << "b: " << dbResult["b"] << std::endl;
        std::cout << "c: " << dbResult["c"] << std::endl;
      }

      delete pSelect;
    }
  }
  db.Close();
}
