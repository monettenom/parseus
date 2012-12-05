#pragma once

#include "tokenizer.h"

enum eCPPToken
{
  TOKEN_UNKNOWN = 0, // 0
  TOKEN_COMMENT,     // 1
  TOKEN_LINECOMMENT, // 2
  TOKEN_NEWLINE,     // 3
  TOKEN_WHITESPACE,  // 4
  TOKEN_PREPROC,     // 5
  TOKEN_LABEL,       // 6
  TOKEN_LITERAL,     // 7
  TOKEN_STRING,      // 8
  TOKEN_MULTILINE_STRING, // 9
  TOKEN_CHAR,        // 10
  TOKEN_NUMBER,      // 11
  TOKEN_OPERATOR,    // 12
  TOKEN_BLOCK_BEGIN, // 13
  TOKEN_BLOCK_END,   // 14
  TOKEN_KEYWORD,     // 15
  TOKEN_MAX         
};

enum eCPPTokenType
{
  OP_UNKNOWN = 0,
  OP_MEMBER_ACCESS,
  OP_LIST,
  OP_COMMAND_END,
  OP_CONDITIONAL,
  OP_BRACKET_OPEN, 
  OP_BRACKET_CLOSE, 
  OP_INDEX_OPEN,
  OP_INDEX_CLOSE,
  OP_ASTERISK,
  OP_INCREMENT, // 10
  OP_DIVIDE,
  OP_SUM_ASSIGNMENT,
  OP_ADDITION,
  OP_DECREMENT, 
  OP_DIFFERENCE_ASSIGNMENT,
  OP_SUBTRACTION,
  OP_POINTER,
  OP_REMAINDER_ASSIGNMENT,
  OP_MODULUS,
  OP_EQUAL,     // 20
  OP_ASSIGNMENT,
  OP_NOT_EQUAL,
  OP_LOGICAL_NOT,
  OP_SMALLER_OR_EQUAL,
  OP_SHIFT_LEFT, 
  OP_SMALLER, 
  OP_SHIFT_LEFT_ASSIGNMENT,
  OP_BIGGER_OR_EQUAL,
  OP_SHIFT_RIGHT_ASSIGNMENT,
  OP_SHIFT_RIGHT, // 30
  OP_BIGGER,
  OP_AND_ASSIGNMENT,
  OP_LOGICAL_AND,
  OP_BITWISE_AND,
  OP_OR_ASSIGNMENT,
  OP_LOGICAL_OR,
  OP_BITWISE_OR,
  OP_XOR_ASSIGNMENT,
  OP_BITWISE_XOR,
  OP_COMPLEMENT, // 40
  OP_COLON,
  OP_SCOPE,
  OP_PRODUCT_ASSIGNMENT,
  OP_QUOTIENT_ASSIGNMENT,
  OP_POINTER_DEREFERNCE,
  OP_MEMBER_ACCESS_DEREFERENCE,
  OP_ELLIPSIS,
  OP_MAX,

  KW_UNKNOWN,
  //KW_PP_DEFINE,
  //KW_PP_UNDEF,
  //KW_PP_IFDEF,
  //KW_PP_IFNDEF,
  //KW_PP_IF,
  //KW_PP_ENDIF,
  //KW_PP_ELSE,
  //KW_PP_ELIF,
  //KW_PP_INCLUDE,
  //KW_PP_PRAGMA,
  //KW_PP_LINE,
  //KW_PP_ERROR,
  //KW_PPM_LINE,
  //KW_PPM_FILE,
  //KW_PPM_DATE,
  //KW_PPM_TIME,
  //KW_PPM_CPLUSPLUS,
  KW_TYPE_INT64,
  KW_11_ALIGNAS,
  KW_11_ALIGNOF,
  KW_ASM,
  KW_AUTO,
  KW_TYPE_BOOL, // 50
  KW_BREAK,
  KW_CASE,
  KW_CATCH,
  KW_TYPE_CHAR,
  KW_11_CHAR16_T,
  KW_11_CHAR32_T,
  KW_CLASS,
  KW_TYPE_CONST,
  KW_11_CONSTEXPR,
  KW_CONST_CAST,
  KW_CONTINUE,
  KW_11_DECLTYPE, // 60
  KW_DEFAULT,
  KW_DELETE,
  KW_DO,
  KW_TYPE_DOUBLE,
  KW_DYNAMIC_CAST,
  KW_ELSE,
  KW_ENUM,
  KW_EXTERN,
  KW_EXPLICIT,
  KW_EXPORT,
  KW_FALSE, // 70
  KW_11_FINAL,
  KW_TYPE_FLOAT,
  KW_FOR,
  KW_FRIEND,
  KW_GOTO,
  KW_IF,
  KW_INLINE,
  KW_TYPE_INT,
  KW_TYPE_LONG,
  KW_MUTABLE, // 80
  KW_NAMESPACE,
  KW_NEW,
  KW_11_NOEXCEPT,
  KW_11_NULLPTR,
  KW_OPERATOR,
  KW_11_OVERRIDE,
  KW_PRIVATE,
  KW_PROTECTED,
  KW_PUBLIC,
  KW_REGISTER,
  KW_REINTERPRET_CAST,
  KW_RETURN,
  KW_TYPE_SHORT,
  KW_TYPE_SIGNED,
  KW_SIZEOF,
  KW_STATIC,
  KW_11_STATIC_ASSERT,
  KW_STATIC_CAST,
  KW_STRUCT,
  KW_SWITCH,
  KW_TEMPLATE,
  KW_THIS,
  KW_11_THREAD_LOCAL,
  KW_THROW,
  KW_TRUE,
  KW_TRY,
  KW_TYPEDEF,
  KW_TYPEID,
  KW_TYPENAME,
  KW_UNION,
  KW_TYPE_UNSIGNED,
  KW_USING,
  KW_VIRTUAL,
  KW_TYPE_VOID,
  KW_VOLATILE,
  KW_TYPE_WCHAR_T,
  KW_WHILE,

  KW_USER,
};

class cCPPTokenizer: public ITokenizer
{
public:
  cCPPTokenizer(int nStringBufferSize = 1 << 18);
  ~cCPPTokenizer();

  void Reset();
  void SetTokenHandler(ITokenHandler* pTokenHandler);

  void AddKeywords(tKeyword* pKeywords);
  void AddOperators(tKeyword* pKeywords); 
  const char* GetKeywordString(int type);
  const char* GetOperatorString(int type);

  bool Parse(const char* strLine, bool bSkipWhiteSpaces = false, bool bSkipComments = false);

  int GetLine() const;

protected:
  void PushEOL();

  void PushToken(tToken& token);
  void PushToken(int nToken);
  void PushToken(int nTokenType, int opType);
  void PushToken(int nTokenType, const char* strName, int iLen = 0);

  const char* HandleBlockComment(const char* strLine, bool bSkipComments = false);
  const char* HandleString(const char* strLine, char cDelimiter, int token);
  const char* HandlePreProc(const char* strLine);
  const char* AppendPreProc(const char* strLine);
  const char* AppendBlockComment(const char* strLine, bool bSkipComments = false);
  const char* AppendString(const char* strLine);
  const char* ParseLabel(const char* strLine);
  const char* ParseLiteral(const char* strLine);

  int IsKeyword(const char* strLabel);

private:
  bool m_bBlockComment;
  bool m_bMultiLineString;
  bool m_bConcatPreProc;
  int m_iLine;

  typedef std::map<std::string, int> tKeywordMap;
  tKeywordMap m_Keywords;
  tKeywordMap m_Operators;

  typedef std::map<int, std::string> tKeywordStringMap;
  tKeywordStringMap m_KeywordStrings;
  tKeywordStringMap m_OperatorStrings;

  ITokenHandler* m_pTokenHandler;
  cStringMem* m_pStringMem;
  std::string m_strBuffer;
};

