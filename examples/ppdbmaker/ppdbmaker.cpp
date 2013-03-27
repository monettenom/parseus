#include "stdafx.h"
#include "parseus.h"
#include "preprocessorlib.h"

// cPreProcessorStatisticsHandler

typedef std::map<std::string, std::string> tStringMap;

class cPreProcessorStatisticsHandler
: public IPreProcessorStatistics
, public ICodeHandler
{
public:
  cPreProcessorStatisticsHandler();
  ~cPreProcessorStatisticsHandler();

  void AddInclude(const char* strInclude, const cFileInfo& FileInfo);
  void AddDefine(const char* strDefine, const cFileInfo& FileInfo);
  void UseDefine(const char* strDefine, const cFileInfo& FileInfo);
  void AddSource(const char* strCode, const cFileInfo& FileInfo);

  void HandleCode(const char* strLine, const cFileInfo& FileInfo);

protected:
  void CreateDatabase();
  void InsertRow(const char* strTable, const tSQLiteDBRow& dbRow);
  const char* GetFileID(const char* strFile);
  void SaveFileMap();

  const char* GetMacroID(const char* strMacro);
  void SaveMacroMap();

private:
  cSQLiteDB* m_pDB;
  tStringMap m_FileMap;
  tStringMap m_MacroMap;
};

cPreProcessorStatisticsHandler::cPreProcessorStatisticsHandler()
: m_pDB(NULL)
{
  CreateDatabase();
}

cPreProcessorStatisticsHandler::~cPreProcessorStatisticsHandler()
{
  if (m_pDB != NULL)
  {
    SaveFileMap();
    SaveMacroMap();
    m_pDB->Close();
    delete m_pDB;
    m_pDB = NULL;
  }
}

const char* cPreProcessorStatisticsHandler::GetFileID(const char* strFile)
{
  std::string File(strFile);

  tStringMap::const_iterator it = m_FileMap.find(File);
  if (it != m_FileMap.end())
  {
    return it->second.c_str();
  }
  else
  {
    std::stringstream FileId;
    FileId << m_FileMap.size();
    m_FileMap[File] = FileId.str();
    return GetFileID(strFile);
  }
}

void cPreProcessorStatisticsHandler::SaveFileMap()
{
  for (tStringMap::const_iterator it = m_FileMap.begin(); it != m_FileMap.end(); ++it)
  {
    tSQLiteDBRow dbRow;
    dbRow["FileID"] = it->second;
    dbRow["Name"] = it->first;

    m_pDB->InsertRow("Files", dbRow);
  }
}

const char* cPreProcessorStatisticsHandler::GetMacroID(const char* strMacro)
{
  std::string Macro(strMacro);

  tStringMap::const_iterator it = m_MacroMap.find(Macro);
  if (it != m_MacroMap.end())
  {
    return it->second.c_str();
  }
  else
  {
    std::stringstream FileId;
    FileId << m_MacroMap.size();
    m_MacroMap[Macro] = FileId.str();
    return GetMacroID(strMacro);
  }
}

void cPreProcessorStatisticsHandler::SaveMacroMap()
{
  for (tStringMap::const_iterator it = m_MacroMap.begin(); it != m_MacroMap.end(); ++it)
  {
    tSQLiteDBRow dbRow;
    dbRow["MacroID"] = it->second;
    dbRow["Name"] = it->first;

    m_pDB->InsertRow("Macros", dbRow);
  }
}

void cPreProcessorStatisticsHandler::AddInclude(const char* strInclude, const cFileInfo& FileInfo)
{
  std::stringstream strLine;
  strLine << FileInfo.GetLine();

  tSQLiteDBRow dbRow;
  dbRow["Include"] = GetFileID(strInclude);
  dbRow["File"] = GetFileID(FileInfo.GetFile());
  dbRow["Line"] = strLine.str();

  m_pDB->InsertRow("Includes", dbRow);
}

void cPreProcessorStatisticsHandler::AddDefine(const char* strDefine, const cFileInfo& FileInfo)
{
  std::stringstream strLine;
  strLine << FileInfo.GetLine();

  tSQLiteDBRow dbRow;
  dbRow["Macro"] = GetMacroID(strDefine);
  dbRow["File"] = GetFileID(FileInfo.GetFile());
  dbRow["Line"] = strLine.str();

  m_pDB->InsertRow("MacroDefine", dbRow);
}

void cPreProcessorStatisticsHandler::UseDefine(const char* strDefine, const cFileInfo& FileInfo)
{
  std::stringstream strLine;
  strLine << FileInfo.GetLine();

  tSQLiteDBRow dbRow;
  dbRow["Macro"] = GetMacroID(strDefine);
  dbRow["File"] = GetFileID(FileInfo.GetFile());
  dbRow["Line"] = strLine.str();

  m_pDB->InsertRow("MacroUsage", dbRow);
}

void cPreProcessorStatisticsHandler::AddSource(const char* strCode, const cFileInfo& FileInfo)
{
  std::string strCodeLine(strCode);

  strCodeLine.erase (std::remove (strCodeLine.begin(), strCodeLine.end(), ' '), strCodeLine.end());
  if (strCodeLine.size() > 0)
  {
    std::stringstream strLine;
    strLine << FileInfo.GetLine();

    tSQLiteDBRow dbRow;
    dbRow["Code"] = strCode;
    dbRow["File"] = GetFileID(FileInfo.GetFile());
    dbRow["Line"] = strLine.str();

    m_pDB->InsertRow("Source", dbRow);
  }
}

void cPreProcessorStatisticsHandler::CreateDatabase()
{
  m_pDB = new cSQLiteDB("C:/Projekte/parseus/examples/ppdbmaker/test.sqlite");
  if (m_pDB->Open(true))
  {
    m_pDB->CreateTable("Files", "CREATE TABLE Files (FileID INTEGER, Name VARCHAR(250));");
    m_pDB->CreateTable("Macros", "CREATE TABLE Macros (MacroID INTEGER, Name VARCHAR(250));");
    m_pDB->CreateTable("Includes", "CREATE TABLE Includes (Include INTEGER, File INTEGER, Line INTEGER);", true);
    m_pDB->CreateTable("MacroDefine", "CREATE TABLE MacroDefine (Macro Integer, File INTEGER, Line INTEGER);", true);
    m_pDB->CreateTable("MacroUsage", "CREATE TABLE MacroUsage (Macro Integer, File INTEGER, Line INTEGER);", true);
    m_pDB->CreateTable("Source", "CREATE TABLE Source (Code VARCHAR(1024), File INTEGER, Line INTEGER);", true);
  }
}

void cPreProcessorStatisticsHandler::HandleCode(const char* strLine, const cFileInfo& FileInfo)
{
  std::cout << strLine << std::endl;
}

int main(int argc, char* argv[])
{
  cPreProcessorStatisticsHandler Stats;

  cPreProcessor pp(&Stats);
  pp.SetPreprocessorStatistics(&Stats);

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

  pp.Process("C:/Projekte/parseus/examples/ppdbmaker/ppdbmaker.cpp");
}
