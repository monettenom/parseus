#ifndef TESTTOKENHANDLER_H
#define TESTTOKENHANDLER_H

const int IGNORE_TOKEN_COUNT = -2;

struct tTestData
{
  const char* m_strCode[128];
  const int m_nExpectedTokens;
  const bool m_bIgnoreWhitespace;
  const char* m_pNameList[128];
  const int m_pTokenList[128];
  const int m_pTokenTypeList[128];
};

class cTestTokenHandler
: public ITokenHandler
, public ITester
{
public:
  cTestTokenHandler(cTokenizer* pTokenizer, tTestData pTestData[]);
  virtual ~cTestTokenHandler();

  virtual void InitTest(tTestData* pTestData);
  virtual bool Test(tTestData* pTestData);
  virtual int RunTests();
  
  int GetTestCount(){ return m_nTestCount; }
  void IncTestCount(){ m_nTestCount++; };
  int GetTokenCount(){ return m_nTokenCount; }
  void IncTokenCount(){ m_nTokenCount++; }
  tTestData* GetTestEntry(){ return m_pCurrentTestEntry; }

  bool GetResult(){ return m_bResult; }
  void SetResult(bool bResult){ m_bResult = bResult; }

  void HandleError(const char* strError, int iLine);
  void LogEntry(const char* strLog);

private:
  cTokenizer* m_pTokenizer;
  tTestData* m_pCurrentTestEntry;
  tTestData* m_pTestData;

  int m_nTestCount;
  int m_nTokenCount;
  bool m_bResult;
};

#endif //TESTTOKENHANDLER_H