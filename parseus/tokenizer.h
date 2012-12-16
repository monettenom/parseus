#pragma once

#include <map>

enum eToken
{
  TOKEN_UNKNOWN = 0,      // 0
  TOKEN_COMMENT,          // 1
  TOKEN_LINECOMMENT,      // 2
  TOKEN_NEWLINE,          // 3
  TOKEN_WHITESPACE,       // 4
  TOKEN_PREPROC,          // 5
  TOKEN_LABEL,            // 6
  TOKEN_LITERAL,          // 7
  TOKEN_STRING,           // 8
  TOKEN_MULTILINE_STRING, // 9
  TOKEN_CHAR,             // 10
  TOKEN_NUMBER,           // 11
  TOKEN_OPERATOR,         // 12
  TOKEN_BLOCK_BEGIN,      // 13
  TOKEN_BLOCK_END,        // 14
  TOKEN_KEYWORD,          // 15
  TOKEN_MAX
};

struct tKeyword
{
  const char* m_strKeyword;
  int m_Type;
};

class cStringMem;

struct tToken
{
  int m_Token;

  union
  {
    char* m_strName;
    int m_Type;
    char m_cChar;
  };

  bool m_bIsCopy;
  bool m_bNameSet;

  tToken();
  tToken(const tToken& token);
  ~tToken();

  void SetName(const char* strName);
  void SetName(const char* strName, int iLen);
  tToken& operator=(const tToken& token);

  static void SetStringMem(cStringMem* pStringMem);
  static cStringMem* s_pStringMem;
};

class ITokenizer
{
public:
  virtual const char* GetTokenString(int nToken) = 0;
  virtual const char* GetKeywordString(int nKeyword) = 0;
  virtual const char* GetOperatorString(int type) = 0;
  virtual bool Parse(const char* strLine, bool bSkipWhiteSpaces = false, bool bSkipComments = false) = 0;
  virtual void Reset() = 0;
};

class ITokenHandler
{
public:
  virtual void HandleToken(tToken& oToken) = 0;
  virtual void HandleError(const char* strError, int iLine) = 0;
  virtual void LogEntry(const char* strLog) = 0;
  virtual int GetTokenCount() = 0;
};

class cTokenizer: public ITokenizer
{
public:
  cTokenizer();
  virtual ~cTokenizer();

  void Reset();

  const char* GetTokenString(int nToken);
  const char* GetKeywordString(int type);
  const char* GetOperatorString(int type);

  void SetTokenHandler(ITokenHandler* pTokenHandler);
  ITokenHandler* GetTokenHandler();

  int GetLine() const;

protected:

  int IncLine(int nOffset = 1);
  void LogLine(const char* strLine);

  void PushToken(int nToken);
  void PushToken(tToken& token);
  void PushToken(int nTokenType, int opType);
  void PushToken(int nTokenType, const char* strName, int iLen = 0);

  void AddKeywords(tKeyword* pKeywords, int nUnknown);
  void AddOperators(tKeyword* pKeywords, int nUnknown); 

  int IsKeyword(const char* strLabel);

private:
  typedef std::map<std::string, int> tKeywordMap;
  tKeywordMap m_Keywords;
  tKeywordMap m_Operators;

  typedef std::map<int, std::string> tKeywordStringMap;
  tKeywordStringMap m_KeywordStrings;
  tKeywordStringMap m_OperatorStrings;
  int m_nUnkownKeyword;
  int m_nUnknownOperator;

  ITokenHandler* m_pTokenHandler;
  cStringMem* m_pStringMem;
  int m_iLine;
};
