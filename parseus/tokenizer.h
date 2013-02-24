/*
   Author: Rolf Neumann
     File: tokenizer.h
     Date: 24.12.2012
  License: see license.txt
  Purpose: Declares the common types, enums and interface which are the base
           of the parser library.
*/

#ifndef TOKENIZER_H
#define TOKENIZER_H

#include <vector>
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
  TOKEN_OPERATOR,         // 11
  TOKEN_BLOCK_BEGIN,      // 12
  TOKEN_BLOCK_END,        // 13
  TOKEN_KEYWORD,          // 14
  TOKEN_TEXT,             // 15
  TOKEN_MAX
};

struct tKeyword
{
  const char* m_strKeyword;
  int m_Type;
};

typedef std::map<std::string, int> tKeywordMap;

class cStringMem;

/*
  The tToken structure contains all information about a token which is passed
  to ITokenHandler::HandleToken.
  The eToken enum describes all kind of tokens, which can be contained in 
  a token structure m_Token. The content of the token structure depends on this
  token.
  Content of tToken if m_Token is

  TOKEN_COMMENT:    Comments are block comments. The comment is returned
                    in m_strName as is

  TOKEN_LINE_COMMENT: Only line comments (//) are returned in this token type.

  TOKEN_OPERATOR:   The field m_Type contains the operator type from
                    the list passed to cTokenHandler::AddOperators.

  TOKEN_KEYWORD:    The field m_Type contains the keyword identifier from
                    the list passed to cTokenHandler::AddKeywords.

  TOKEN_WHITESPACE: The field m_strName contains the whitespace string
                    which also can be several whitespaces at once.

  TOKEN_LITERAL:    This can be any numeric literal of any type. It is
                    returned as string and the type is not returned.
                    For analyzing this literals a special mechanism will be
                    provided.

  TOKEN_PREPROC:    If any preprocessor command is found, the whole string
                    is returned as is. For example "#include <stdafx.h>"
                    results in "include <stdafx.h>"

  TOKEN_LABEL:      Each word which is not a keyword is returned in m_strName.

  TOKEN_STRING:     The string is returned in m_strName including the delimiters (" or ')

  TOKEN_MULTILINE_STRING: Multiline strings for example occur in C++ and are 
                          concatenated with '\\\n'. This concatenation is returned in
                          the result in m_strName.

  TOKEN_CHAR:       In C++ a char is returned in this field
                    In Pascal/Delphi only the character codes (e.g. #48) are marked 
                    with this token. Characters ('x') returned as string.

  TOKEN_NEWLINE:    This token is returned before a new line starts

  TOKEN_BLOCK_BEGIN, TOKEN_BLOCK_END: This tokens are returned on { and } or begin and end
*/

struct tToken
{
  int m_Token;

  union
  {
    char* m_strName;
    int m_Type;
    char m_cChar;
  };

  tToken();
  tToken(const char* strLabel);
  tToken(const tToken& token);
  tToken(int nToken, int nType);
  tToken(int nToken, const char* strName);
  ~tToken();

  void SetName(const char* strName);
  void SetName(const char* strName, int iLen);
  tToken& operator=(const tToken& token);
  bool IsToken(eToken nToken) const;
  bool IsToken(eToken nToken, int nType) const;

  static void SetStringMem(cStringMem* pStringMem);
  static cStringMem* s_pStringMem;
};

typedef std::vector<tToken> tTokenList;

class ITokenizer
{
public:
  virtual const char* GetTokenString(int nToken) = 0;
  virtual const char* GetKeywordString(int nKeyword) = 0;
  virtual const char* GetOperatorString(int type) = 0;
  virtual bool Parse(const char* strLine, bool bSkipWhiteSpaces = false, bool bSkipComments = false) = 0;
  virtual void Reset() = 0;
};

/*
  The parsing job and the handling of the parsed tokens is divided in two classes.
  The tokenizer gets a reference to a tokenhandler and calls any of the ITokenHandler
  methods.
 */
class ITokenHandler
{
public:
  virtual bool HandleToken(tToken& oToken) = 0;
  virtual void HandleError(const char* strError, int iLine) = 0;
  virtual void LogEntry(const char* strLog) = 0;
  virtual int GetTokenCount() = 0;
};

/*
 This is the common base class for all tokenizer and contains the mechanisms
 needed for the parsing process.
 */
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
  void PushToken(int nTokenType, char cChar);
  
  // if iLen == 0 then the whole string will be taken.
  void PushToken(int nTokenType, const char* strName, int iLen = 0);
  virtual void PushKeyword(int nKeyword);

  virtual const char* HandleWhiteSpace(const char* strLine, bool bSkipWhiteSpaces);
  virtual const char* ParseLabel(const char* strLine);

  // AddKeywords can be called several times
  // so it is possible to append user defined keywords.
  void AddKeywords(tKeyword* pKeywords, int nUnknown);
  void AddOperators(tKeyword* pKeywords, int nUnknown);

  // returns the keyword identifier or the value from nUnknown which
  // was passed to AddKeywords (xx_KW_UNKNOWN)
  virtual int IsKeyword(const char* strLabel);

private:  
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

#endif //TOKENIZER_H