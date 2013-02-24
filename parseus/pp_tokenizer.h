/*
   Author: Rolf Neumann
     File: pp_tokenizer.h
     Date: 02.01.2012
  License: see license.txt
  Purpose: Preprocessor tokenizer
*/

#ifndef PPTOKENIZER_H
#define PPTOKENIZER_H

#include "tokenizer.h"

enum ePPTokenType
{
  PP_OP_UNKNOWN = 0,
  PP_OP_PREPROC,
  PP_OP_PREPROC_END,
  PP_OP_BRACKET_OPEN,
  PP_OP_BRACKET_CLOSE,
  PP_OP_COMMA,
  PP_OP_ELLIPSIS,
  PP_OP_STRINGIFICATION,
  PP_OP_CONCATENATION,
  PP_OP_ADDITION,
  PP_OP_SUBTRACTION,
  PP_OP_MULTIPLICATION,
  PP_OP_DIVISION,
  PP_OP_MODULUS,
  PP_OP_LOGICAL_AND,
  PP_OP_LOGICAL_OR,
  PP_OP_LOGICAL_NOT,
  PP_OP_BITWISE_AND,
  PP_OP_BITWISE_OR,
  PP_OP_BITWISE_XOR,
  PP_OP_BITWISE_NOT,
  PP_OP_SHL,
  PP_OP_SHR,
  PP_OP_EQUAL,
  PP_OP_NOT_EQUAL,
  PP_OP_SMALLER,
  PP_OP_SMALLER_OR_EQUAL,
  PP_OP_BIGGER,
  PP_OP_BIGGER_OR_EQUAL,
  PP_OP_CONDITIONAL,
  PP_OP_CONDITIONAL_ELSE,
  PP_OP_MAX,

  PP_KW_UNKNOWN,
  PP_KW_NULL,
  PP_KW_INCLUDE,
  PP_KW_INCLUDE_NEXT,
  PP_KW_IMPORT,
  PP_KW_DEFINE,
  PP_KW_UNDEF,
  PP_KW_IFDEF,
  PP_KW_IFNDEF,
  PP_KW_IF,
  PP_KW_DEFINED,
  PP_KW_ELSE,
  PP_KW_ELIF,
  PP_KW_ENDIF,
  PP_KW_ERROR,
  PP_KW_WARNING,
  PP_KW_LINE,
  PP_KW_PRAGMA,
  PP_KW_IDENT,
  PP_KW_SCCS,
  PP_KW_ASSERT,
  PP_KW_UNASSERT,
  PP_KW_USER,
};

class cPPTokenizer: public cTokenizer
{
public:
  cPPTokenizer();
  ~cPPTokenizer();

  bool Parse(const char* strLine, bool bSkipWhiteSpaces = false, bool bSkipComments = false);
  void LogToken(tToken& token);

protected:
  const char* HandleWhiteSpace(const char* strLine, bool bSkipWhiteSpaces);
  const char* HandleBlockComment(const char* strLine);
  const char* AppendBlockComment(const char* strLine);
  const char* HandleLineComment(const char* strLine);
  const char* HandleString(const char* strLine, char cDelimiter, int token);
  const char* AppendString(const char* strLine);
  const char* ParseLiteral(const char* strLine);
  void PushKeyword(int nKeyword);
  bool PushPreProcEnd();
  void PushTokenIfPreProcMode(int nToken, int nType, const char* strText);

private:
  bool m_bBlockComment;
  bool m_bLineComment;
  bool m_bMultiLineString;
  bool m_bPreProcMode;
  bool m_bInclude;

  std::string m_strBuffer;
};

#endif //PPTOKENIZER_H