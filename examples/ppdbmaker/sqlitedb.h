#ifndef SQLITEDB_H
#define SQLITEDB_H

typedef std::map<std::string, std::string> tSQLiteDBRow;

class cSQLiteSelect
{
public:
  cSQLiteSelect(sqlite3_stmt* pStatement);
  ~cSQLiteSelect();

  bool Fetch(tSQLiteDBRow& dbRow);

private:
  sqlite3_stmt* m_pStatement;
  tSQLiteDBRow m_dbRow;
};

class cSQLiteDB
{
public:
  cSQLiteDB(const char* strDBPath);
  ~cSQLiteDB();

  bool Open(bool bCreateIfNotExists = false);
  void Close();

  bool IsConnected();

  bool ExecuteSQL(const char* strSQL);

  bool CreateTable(const char* strTable, const char* strCreationSQL, bool bDropIfExists = false);
  bool DropTable(const char* strTable);

  bool InsertRow(const char* strTable, const tSQLiteDBRow& dbRow);

  cSQLiteSelect* Select(const char *strSQL);

private:
  std::string m_strDBPath;
  sqlite3* m_pDatabase;
};

#endif // SQLITEDB_H