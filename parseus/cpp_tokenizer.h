/*
   Author: Rolf Neumann
     File: cpp_tokenizer.h
     Date: 24.12.2012
  License: see license.txt
  Purpose: Tokenizer for CPP files
*/

#ifndef CPP_TOKENIZER_H
#define CPP_TOKENIZER_H

#include "tokenizer.h"

enum eCPPTokenType
{
  CPP_OP_UNKNOWN = 0,
  CPP_OP_MEMBER_ACCESS,
  CPP_OP_LIST,
  CPP_OP_COMMAND_END,
  CPP_OP_CONDITIONAL,
  CPP_OP_BRACKET_OPEN,
  CPP_OP_BRACKET_CLOSE,
  CPP_OP_INDEX_OPEN,
  CPP_OP_INDEX_CLOSE,
  CPP_OP_ASTERISK,
  CPP_OP_INCREMENT, // 10
  CPP_OP_DIVIDE,
  CPP_OP_SUM_ASSIGNMENT,
  CPP_OP_ADDITION,
  CPP_OP_DECREMENT,
  CPP_OP_DIFFERENCE_ASSIGNMENT,
  CPP_OP_SUBTRACTION,
  CPP_OP_POINTER,
  CPP_OP_REMAINDER_ASSIGNMENT,
  CPP_OP_MODULUS,
  CPP_OP_EQUAL,     // 20
  CPP_OP_ASSIGNMENT,
  CPP_OP_NOT_EQUAL,
  CPP_OP_LOGICAL_NOT,
  CPP_OP_SMALLER_OR_EQUAL,
  CPP_OP_SHIFT_LEFT,
  CPP_OP_SMALLER,
  CPP_OP_SHIFT_LEFT_ASSIGNMENT,
  CPP_OP_BIGGER_OR_EQUAL,
  CPP_OP_SHIFT_RIGHT_ASSIGNMENT,
  CPP_OP_SHIFT_RIGHT, // 30
  CPP_OP_BIGGER,
  CPP_OP_AND_ASSIGNMENT,
  CPP_OP_LOGICAL_AND,
  CPP_OP_BITWISE_AND,
  CPP_OP_OR_ASSIGNMENT,
  CPP_OP_LOGICAL_OR,
  CPP_OP_BITWISE_OR,
  CPP_OP_XOR_ASSIGNMENT,
  CPP_OP_BITWISE_XOR,
  CPP_OP_COMPLEMENT, // 40
  CPP_OP_COLON,
  CPP_OP_SCOPE,
  CPP_OP_PRODUCT_ASSIGNMENT,
  CPP_OP_QUOTIENT_ASSIGNMENT,
  CPP_OP_POINTER_DEREFERNCE,
  CPP_OP_MEMBER_ACCESS_DEREFERENCE,
  CPP_OP_ELLIPSIS,
  CPP_OP_MAX,

  CPP_KW_UNKNOWN,
  CPP_KW_TYPE_INT64, // 50
  CPP_KW_11_ALIGNAS,
  CPP_KW_11_ALIGNOF,
  CPP_KW_ASM,
  CPP_KW_AUTO,
  CPP_KW_TYPE_BOOL,
  CPP_KW_BREAK,
  CPP_KW_CASE,
  CPP_KW_CATCH,
  CPP_KW_TYPE_CHAR,
  CPP_KW_11_CHAR16_T, // 60
  CPP_KW_11_CHAR32_T,
  CPP_KW_CLASS,
  CPP_KW_TYPE_CONST,
  CPP_KW_11_CONSTEXPR,
  CPP_KW_CONST_CAST,
  CPP_KW_CONTINUE,
  CPP_KW_11_DECLTYPE,
  CPP_KW_DEFAULT,
  CPP_KW_DELETE,
  CPP_KW_DO,         // 70
  CPP_KW_TYPE_DOUBLE,
  CPP_KW_DYNAMIC_CAST,
  CPP_KW_ELSE,
  CPP_KW_ENUM,
  CPP_KW_EXTERN,
  CPP_KW_EXPLICIT,
  CPP_KW_EXPORT,
  CPP_KW_FALSE,
  CPP_KW_11_FINAL,
  CPP_KW_TYPE_FLOAT,  // 80
  CPP_KW_FOR,
  CPP_KW_FRIEND,
  CPP_KW_GOTO,
  CPP_KW_IF,
  CPP_KW_INLINE,
  CPP_KW_TYPE_INT,
  CPP_KW_TYPE_LONG,
  CPP_KW_MUTABLE,
  CPP_KW_NAMESPACE,
  CPP_KW_NEW,         // 90
  CPP_KW_11_NOEXCEPT,
  CPP_KW_11_NULLPTR,
  CPP_KW_OPERATOR,
  CPP_KW_11_OVERRIDE,
  CPP_KW_PRIVATE,
  CPP_KW_PROTECTED,
  CPP_KW_PUBLIC,
  CPP_KW_REGISTER,
  CPP_KW_REINTERPRET_CAST,
  CPP_KW_RETURN,     // 100
  CPP_KW_TYPE_SHORT,
  CPP_KW_TYPE_SIGNED,
  CPP_KW_SIZEOF,
  CPP_KW_STATIC,
  CPP_KW_11_STATIC_ASSERT,
  CPP_KW_STATIC_CAST,
  CPP_KW_STRUCT,
  CPP_KW_SWITCH,
  CPP_KW_TEMPLATE,
  CPP_KW_THIS,      // 110
  CPP_KW_11_THREAD_LOCAL,
  CPP_KW_THROW,
  CPP_KW_TRUE,
  CPP_KW_TRY,
  CPP_KW_TYPEDEF,
  CPP_KW_TYPEID,
  CPP_KW_TYPENAME,
  CPP_KW_UNION,
  CPP_KW_TYPE_UNSIGNED,
  CPP_KW_USING,     // 120
  CPP_KW_VIRTUAL,
  CPP_KW_TYPE_VOID,
  CPP_KW_VOLATILE,
  CPP_KW_TYPE_WCHAR_T,
  CPP_KW_WHILE,

  CPP_KW_USER,
};

class cCPPTokenizer: public cTokenizer
{
public:
  cCPPTokenizer();
  ~cCPPTokenizer();

  bool Parse(const char* strLine, bool bSkipWhiteSpaces = false, bool bSkipComments = false);
  void LogToken(tToken& token);

protected:
  const char* HandleBlockComment(const char* strLine, bool bSkipComments = false);
  const char* AppendBlockComment(const char* strLine, bool bSkipComments = false);
  const char* HandleLineComment(const char* strLine, bool bSkipComments = false);
  const char* HandleString(const char* strLine, char cDelimiter, int token);
  const char* AppendString(const char* strLine);
  const char* HandlePreProc(const char* strLine);
  const char* AppendPreProc(const char* strLine);
  const char* ParseLiteral(const char* strLine);

private:
  bool m_bBlockComment;
  bool m_bLineComment;
  bool m_bMultiLineString;
  bool m_bConcatPreProc;

  std::string m_strBuffer;
};

#endif //CPP_TOKENIZER_H