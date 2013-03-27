#include "stdafx.h"

// cSQLiteSelect

cSQLiteSelect::cSQLiteSelect(sqlite3_stmt* pStatement)
: m_pStatement(pStatement)
{
}

cSQLiteSelect::~cSQLiteSelect()
{
  sqlite3_finalize(m_pStatement);
}

bool cSQLiteSelect::Fetch(tSQLiteDBRow& dbRow)
{
  int nResult = sqlite3_step(m_pStatement);
  switch (nResult)
  {
    case SQLITE_ROW:
      {
        dbRow.clear();
        int nColumnCount = sqlite3_column_count(m_pStatement);
        for (int i = 0; i < nColumnCount; i++)
        {
          dbRow[std::string((const char*)sqlite3_column_name(m_pStatement, i))] =
            std::string((const char*)sqlite3_column_text(m_pStatement, i));
        }
      }
      return true;
    case SQLITE_DONE:
      return false;
    default:
      std::cerr << "Error: " << nResult << std::endl;
      return false;
  }
}

// cSQLiteDB

cSQLiteDB::cSQLiteDB(const char* strDBPath)
: m_strDBPath(strDBPath)
, m_pDatabase(NULL)
{

}

cSQLiteDB::~cSQLiteDB()
{
  Close();
}

bool cSQLiteDB::Open(bool bCreateIfNotExists)
{
  int nResult = sqlite3_open_v2(
    m_strDBPath.c_str(),
    &m_pDatabase,
    SQLITE_OPEN_NOMUTEX | SQLITE_OPEN_READWRITE | (bCreateIfNotExists?SQLITE_OPEN_CREATE:0),
    NULL
  );

  if (nResult != SQLITE_OK)
  {
    Close();
    return false;
  }

  ExecuteSQL("PRAGMA synchronous=OFF");
  ExecuteSQL("PRAGMA count_changes=OFF");
  ExecuteSQL("PRAGMA journal_mode=MEMORY");
  ExecuteSQL("PRAGMA temp_store=MEMORY");
  return true;
}

void cSQLiteDB::Close()
{
  if (m_pDatabase)
  {
    sqlite3_close_v2(m_pDatabase);
    m_pDatabase = NULL;
  }
}

bool cSQLiteDB::IsConnected()
{
  return m_pDatabase != NULL;
}

bool cSQLiteDB::ExecuteSQL(const char* strSQL)
{
  if (!IsConnected())
    return false;

  sqlite3_stmt* pStatement = NULL;

  int nResult = sqlite3_prepare_v2(
    m_pDatabase,
    strSQL,
    -1,
    &pStatement,
    0
  );

  if (nResult == SQLITE_OK)
  {
    nResult = sqlite3_step(pStatement);
    if (nResult == SQLITE_DONE)
    {
      sqlite3_finalize(pStatement);
      return true;
    }
  }
  sqlite3_finalize(pStatement);
  return false;
}

bool cSQLiteDB::CreateTable(const char* strTable, const char* strCreationSQL, bool bDropIfExists)
{
  if (bDropIfExists)
    DropTable(strTable);
  return ExecuteSQL(strCreationSQL);
}

bool cSQLiteDB::DropTable(const char* strTable)
{
  std::stringstream strStream;
  strStream << "DROP TABLE IF EXISTS " << strTable << ";";
  return ExecuteSQL(strStream.str().c_str());
}

bool cSQLiteDB::InsertRow(const char* strTable, const tSQLiteDBRow& dbRow)
{
  std::stringstream strStatement;
  std::stringstream strFields;
  std::stringstream strValues;

  bool bFirst = true;
  for (tSQLiteDBRow::const_iterator it = dbRow.begin(); it != dbRow.end(); ++it)
  {
    if (bFirst)
    {
      strFields << it->first;
      strValues << '\"' << it->second << '\"';
      bFirst = false;
    }
    else
    {
      strFields << ',' << it->first;
      strValues << ',' << '\"' << it->second << '\"';
    }
  }

  strStatement << "insert into " << strTable << " (" << strFields.str() << ") values (" << strValues.str() << ");";
  return ExecuteSQL(strStatement.str().c_str());
}

cSQLiteSelect* cSQLiteDB::Select(const char *strSQL)
{
  sqlite3_stmt* pStatement = NULL;

  int nResult = sqlite3_prepare_v2(
    m_pDatabase,
    strSQL,
    -1,
    &pStatement,
    NULL
  );

  if (nResult == SQLITE_OK)
  {
    return new cSQLiteSelect(pStatement);
  }
  else
  {
    return NULL;
  }
}

//// Example:
//
//int main(int argc, char* argv[])
//{
//  cSQLiteDB db("C:/Projekte/parseus/examples/ppdbmaker/test.sqlite");
//  db.Open(true);
//  if (db.IsConnected())
//  {
//    if(!db.CreateTable("a", "CREATE TABLE a (b INTEGER, c INTEGER);", true))
//    {
//      printf("Error!\n");
//    }
//
//    tSQLiteDBRow dbRow;
//    dbRow["b"] = "100";
//    dbRow["c"] = "200";
//    db.InsertRow("a", dbRow);
//    dbRow["b"] = "300";
//    dbRow["c"] = "400";
//    db.InsertRow("a", dbRow);
//
//    cSQLiteSelect* pSelect = db.Select("select * from a");
//    tSQLiteDBRow dbResult;
//
//    while (pSelect->Fetch(dbResult))
//    {
//      std::cout << "b: " << dbResult["b"] << std::endl;
//      std::cout << "c: " << dbResult["c"] << std::endl;
//    }
//
//    delete pSelect;
//  }
//  db.Close();
//}
