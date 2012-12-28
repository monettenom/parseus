/*
   Author: Rolf Neumann
     File: PHP_tokenizer.h
     Date: 24.12.2012
  License: see license.txt
  Purpose: Tokenizer for PHP files
*/

#ifndef PHP_TOKENIZER_H
#define PHP_TOKENIZER_H

#include "tokenizer.h"

enum ePHPTokenType
{
  PHP_OP_UNKNOWN = 0,
  PHP_OP_MEMBER_ACCESS,
  PHP_OP_LIST,
  PHP_OP_COMMAND_SEPARATOR,
  PHP_OP_CONDITIONAL,
  PHP_OP_BRACKET_OPEN,
  PHP_OP_BRACKET_CLOSE,
  PHP_OP_INDEX_OPEN,
  PHP_OP_INDEX_CLOSE,
  PHP_OP_MULTIPLICATION,
  PHP_OP_INCREMENT,
  PHP_OP_DIVISION,
  PHP_OP_SUM_ASSIGNMENT,
  PHP_OP_ADDITION,
  PHP_OP_DECREMENT,
  PHP_OP_DIFFERENCE_ASSIGNMENT,
  PHP_OP_SUBTRACTION,
  PHP_OP_MODULUS,
  PHP_OP_MODULUS_ASSIGNMENT,
  PHP_OP_EQUAL,
  PHP_OP_NOT_EQUAL,
  PHP_OP_IDENTICAL,
  PHP_OP_NOT_IDENTICAL,
  PHP_OP_ASSIGNMENT,
  PHP_OP_LOGICAL_NOT,
  PHP_OP_SMALLER_OR_EQUAL,
  PHP_OP_SHIFT_LEFT,
  PHP_OP_SMALLER,
  PHP_OP_SHIFT_LEFT_ASSIGNMENT,
  PHP_OP_BIGGER_OR_EQUAL,
  PHP_OP_SHIFT_RIGHT_ASSIGNMENT,
  PHP_OP_SHIFT_RIGHT, // 30
  PHP_OP_BIGGER,
  PHP_OP_AND_ASSIGNMENT,
  PHP_OP_LOGICAL_AND,
  PHP_OP_AMPERSAND,
  PHP_OP_OR_ASSIGNMENT,
  PHP_OP_LOGICAL_OR,
  PHP_OP_BITWISE_OR,
  PHP_OP_XOR_ASSIGNMENT,
  PHP_OP_BITWISE_XOR,
  PHP_OP_COMPLEMENT, // 40
  PHP_OP_COMPLEMENT_ASSIGNMENT,
  PHP_OP_COLON,
  PHP_OP_SCOPE,
  PHP_OP_PRODUCT_ASSIGNMENT,
  PHP_OP_QUOTIENT_ASSIGNMENT,
  PHP_OP_BACKTICK,
  PHP_OP_CONCATENATION_ASSIGNMENT,
  PHP_OP_POINTER,
  PHP_OP_ASSOCIATION,
  PHP_OP_VARIABLE,
  PHP_OP_MAX,

  PHP_KW_UNKNOWN,
  PHP_KW_CAST_BOOL,
  PHP_KW_CAST_BOOLEAN,
  PHP_KW_CAST_INT,
  PHP_KW_CAST_INTEGER,
  PHP_KW_CAST_FLOAT,
  PHP_KW_CAST_DOUBLE,
  PHP_KW_CAST_STRING,
  PHP_KW_CAST_ARRAY,
  PHP_KW_CAST_OBJECT,
  PHP_KW_CAST_BINARY, // b"binary string"

  PHP_KW_NULL,
  PHP_KW_HALT_COMPILER,
  PHP_KW_ABSTRACT,
  PHP_KW_AND,
  PHP_KW_AS,
  PHP_KW_BREAK,
  PHP_KW_CALLABLE,
  PHP_KW_CASE,
  PHP_KW_CATCH,
  PHP_KW_CLASS,
  PHP_KW_CLONE,
  PHP_KW_CONST,
  PHP_KW_CONTINUE,
  PHP_KW_DECLARE,
  PHP_KW_DEFAULT,
  PHP_KW_DIE,
  PHP_KW_DO,
  PHP_KW_ECHO,
  PHP_KW_ELSE,
  PHP_KW_ELSEIF,
  PHP_KW_EMPTY,
  PHP_KW_ENDDECLARE,
  PHP_KW_ENDFOR,
  PHP_KW_ENDFOREACH,
  PHP_KW_ENDIF,
  PHP_KW_ENDSWITCH,
  PHP_KW_ENDWHILE,
  PHP_KW_EVAL,
  PHP_KW_EXIT,
  PHP_KW_EXTENDS,
  PHP_KW_FINAL,
  PHP_KW_FOR,
  PHP_KW_FOREACH,
  PHP_KW_FUNCTION,
  PHP_KW_GLOBAL,
  PHP_KW_GOTO,
  PHP_KW_IF,
  PHP_KW_IMPLEMENTS,
  PHP_KW_INCLUDE,
  PHP_KW_INCLUDE_ONCE,
  PHP_KW_INSTANCEOF,
  PHP_KW_INSTEADOF,
  PHP_KW_INTERFACE,
  PHP_KW_ISSET,
  PHP_KW_LIST,
  PHP_KW_NAMESPACE,
  PHP_KW_NEW,
  PHP_KW_OR,
  PHP_KW_PRINT,
  PHP_KW_PRIVATE,
  PHP_KW_PROTECTED,
  PHP_KW_PUBLIC,
  PHP_KW_REQUIRE,
  PHP_KW_REQUIRE_ONCE,
  PHP_KW_RETURN,
  PHP_KW_STATIC,
  PHP_KW_SWITCH,
  PHP_KW_THROW,
  PHP_KW_TRAIT,
  PHP_KW_TRY,
  PHP_KW_UNSET,
  PHP_KW_USE,
  PHP_KW_VAR,
  PHP_KW_WHILE,
  PHP_KW_XOR,
  PHP_KW_USER,
};

class cPHPTokenizer: public cTokenizer
{
public:
  cPHPTokenizer();
  ~cPHPTokenizer();

  bool Parse(const char* strLine, bool bSkipWhiteSpaces = false, bool bSkipComments = false);

protected:
  const char* HandleBlockComment(const char* strLine, bool bSkipComments = false);
  const char* HandleString(const char* strLine, char cDelimiter, int nToken);
  const char* AppendPreProc(const char* strLine);
  const char* AppendBlockComment(const char* strLine, bool bSkipComments = false);
  const char* AppendString(const char* strLine);
  const char* ParseLiteral(const char* strLine);
  void PushKeyword(int nKeyword);
  int IsKeyword(const char* strLabel);

private:
  bool m_bBlockComment;
  bool m_bMultiLineString;

  std::string m_strBuffer;
};

#endif //PHP_TOKENIZER_H