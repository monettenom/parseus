#include "stdafx.h"
#include "cpp_tokenizer.h"

static const char* g_OperatorString[OP_MAX] = {
  "OP_UNKNOWN",
  "OP_MEMBER_ACCESS",
  "OP_LIST",
  "OP_COMMAND_END",
  "OP_CONDITIONAL",
  "OP_BRACKET_OPEN", 
  "OP_BRACKET_CLOSE", 
  "OP_INDEX_OPEN",
  "OP_INDEX_CLOSE",
  "OP_ASTERISK",
  "OP_INCREMENT",
  "OP_DIVIDE",
  "OP_SUM_ASSIGNMENT",
  "OP_ADDITION",
  "OP_DECREMENT", 
  "OP_DIFFERENCE_ASSIGNMENT",
  "OP_SUBTRACTION",
  "OP_POINTER",
  "OP_REMAINDER_ASSIGNMENT",
  "OP_MODULUS",
  "OP_EQUAL",
  "OP_ASSIGNMENT",
  "OP_NOT_EQUAL",
  "OP_LOGICAL_NOT",
  "OP_SMALLER_OR_EQUAL",
  "OP_SHIFT_LEFT", 
  "OP_SMALLER", 
  "OP_SHIFT_LEFT_ASSIGNMENT",
  "OP_BIGGER_OR_EQUAL",
  "OP_SHIFT_RIGHT_ASSIGNMENT",
  "OP_SHIFT_RIGHT",
  "OP_BIGGER",
  "OP_AND_ASSIGNMENT",
  "OP_LOGICAL_AND",
  "OP_BITWISE_AND",
  "OP_OR_ASSIGNMENT",
  "OP_LOGICAL_OR",
  "OP_BITWISE_OR",
  "OP_XOR_ASSIGNMENT",
  "OP_BITWISE_XOR",
  "OP_COMPLEMENT",
  "OP_COLON",
  "OP_SCOPE",
  "OP_PRODUCT_ASSIGNMENT",
  "OP_QUOTIENT_ASSIGNMENT",
  "OP_POINTER_DEREFERNCE",
  "OP_MEMBER_ACCESS_DEREFERENCE",
  "OP_ELLIPSIS"
};

static tKeyword g_KeyWords[] = {
  {"__int64", KW_TYPE_INT64},
  {"alignas", KW_11_ALIGNAS},
  {"alignof", KW_11_ALIGNOF},
  {"and", OP_LOGICAL_AND},
  {"and_eq", OP_AND_ASSIGNMENT},
  {"asm", KW_ASM},
  {"auto", KW_AUTO},
  {"bitand", OP_BITWISE_AND},
  {"bitor", OP_BITWISE_OR},
  {"bool", KW_TYPE_BOOL},
  {"break", KW_BREAK},
  {"case", KW_CASE},
  {"catch", KW_CATCH},
  {"char", KW_TYPE_CHAR},
  {"char16_t", KW_11_CHAR16_T},
  {"char32_t", KW_11_CHAR32_T},
  {"class", KW_CLASS},
  {"compl", OP_COMPLEMENT},
  {"const", KW_TYPE_CONST},
  {"constexpr", KW_11_CONSTEXPR},
  {"const_cast", KW_CONST_CAST},
  {"continue", KW_CONTINUE},
  {"decltype", KW_11_DECLTYPE},
  {"default", KW_DEFAULT},
  {"delete", KW_DELETE},
  {"do", KW_DO},
  {"double", KW_TYPE_DOUBLE},
  {"dynamic_cast", KW_DYNAMIC_CAST},
  {"else", KW_ELSE},
  {"enum", KW_ENUM},
  {"extern", KW_EXTERN},
  {"explicit", KW_EXPLICIT},
  {"export", KW_EXPORT},
  {"false", KW_FALSE},
  {"final", KW_11_FINAL},
  {"float", KW_TYPE_FLOAT},
  {"for", KW_FOR},
  {"friend", KW_FRIEND},
  {"goto", KW_GOTO},
  {"if", KW_IF},
  {"inline", KW_INLINE},
  {"int", KW_TYPE_INT},
  {"long", KW_TYPE_LONG},
  {"mutable", KW_MUTABLE},
  {"namespace", KW_NAMESPACE}, 
  {"new", KW_NEW},
  {"noexcept", KW_11_NOEXCEPT},
  {"not", OP_LOGICAL_NOT},
  {"not_eq", OP_NOT_EQUAL},
  {"nullptr", KW_11_NULLPTR},
  {"operator", KW_OPERATOR},
  {"or", OP_LOGICAL_OR},
  {"or_eq", OP_OR_ASSIGNMENT},
  {"override", KW_11_OVERRIDE},
  {"private", KW_PRIVATE},
  {"protected", KW_PROTECTED},
  {"public", KW_PUBLIC},
  {"register", KW_REGISTER},
  {"reinterpret_cast", KW_REINTERPRET_CAST},
  {"return", KW_RETURN},
  {"short", KW_TYPE_SHORT},
  {"signed", KW_TYPE_SIGNED},
  {"sizeof", KW_SIZEOF},
  {"static", KW_STATIC},
  {"static_assert", KW_11_STATIC_ASSERT},
  {"static_cast", KW_STATIC_CAST},
  {"struct", KW_STRUCT},
  {"switch", KW_SWITCH},
  {"template", KW_TEMPLATE},
  {"this", KW_THIS},
  {"thread_local", KW_11_THREAD_LOCAL},
  {"throw", KW_THROW},
  {"true", KW_TRUE},
  {"try", KW_TRY},
  {"typedef", KW_TYPEDEF},
  {"typeid", KW_TYPEID},
  {"typename", KW_TYPENAME},
  {"union", KW_UNION},
  {"unsigned", KW_TYPE_UNSIGNED},
  {"using", KW_USING},
  {"virtual", KW_VIRTUAL},
  {"void", KW_TYPE_VOID}, 
  {"volatile", KW_VOLATILE}, 
  {"wchar_t", KW_TYPE_WCHAR_T},
  {"while", KW_WHILE},
  {"xor", OP_BITWISE_XOR},
  {"xor_eq", OP_XOR_ASSIGNMENT},
  {"unknown", KW_UNKNOWN}
};

static tKeyword g_Operators[] = {
  {".", OP_MEMBER_ACCESS},
  {",", OP_LIST},
  {";", OP_COMMAND_END},
  {"?", OP_CONDITIONAL},
  {"(", OP_BRACKET_OPEN},
  {")", OP_BRACKET_CLOSE},
  {"[", OP_INDEX_OPEN},
  {"]", OP_INDEX_CLOSE},
  {"*", OP_ASTERISK},
  {"++", OP_INCREMENT},
  {"/", OP_DIVIDE},
  {"+=", OP_SUM_ASSIGNMENT},
  {"+", OP_ADDITION},
  {"--", OP_DECREMENT}, 
  {"-=", OP_DIFFERENCE_ASSIGNMENT},
  {"-", OP_SUBTRACTION},
  {"->", OP_POINTER},
  {"%=", OP_REMAINDER_ASSIGNMENT},
  {"%", OP_MODULUS},
  {"==", OP_EQUAL},
  {"=", OP_ASSIGNMENT},
  {"!=", OP_NOT_EQUAL},
  {"!", OP_LOGICAL_NOT},
  {"<=", OP_SMALLER_OR_EQUAL},
  {"<<", OP_SHIFT_LEFT},
  {"<", OP_SMALLER}, 
  {"<<=", OP_SHIFT_LEFT_ASSIGNMENT},
  {">=", OP_BIGGER_OR_EQUAL},
  {">>=", OP_SHIFT_RIGHT_ASSIGNMENT},
  {">>", OP_SHIFT_RIGHT},
  {">", OP_BIGGER},
  {"&=", OP_AND_ASSIGNMENT},
  {"&&", OP_LOGICAL_AND},
  {"&", OP_BITWISE_AND},
  {"|=", OP_OR_ASSIGNMENT},
  {"||", OP_LOGICAL_OR},
  {"|", OP_BITWISE_OR},
  {"^=", OP_XOR_ASSIGNMENT},
  {"^", OP_BITWISE_XOR},
  {"~", OP_COMPLEMENT},
  {":", OP_COLON},
  {"::", OP_SCOPE},
  {"*=", OP_PRODUCT_ASSIGNMENT},
  {"/=", OP_QUOTIENT_ASSIGNMENT},
  {"->*", OP_POINTER_DEREFERNCE},
  {".*", OP_MEMBER_ACCESS_DEREFERENCE},
  {"...", OP_ELLIPSIS},
  {"unknown", OP_UNKNOWN}
};

// cCPPTokenizer

cCPPTokenizer::cCPPTokenizer()
: cTokenizer()
, m_bBlockComment(false)
, m_bMultiLineString(false)
, m_bConcatPreProc(false)
{
  AddKeywords(g_KeyWords, KW_UNKNOWN);
  AddOperators(g_Operators, OP_UNKNOWN);
}

cCPPTokenizer::~cCPPTokenizer()
{
}

const char* cCPPTokenizer::HandleWhiteSpace(const char* strLine, bool bSkipWhiteSpaces)
{
  const char* strCrsr = strLine-1;
  char c = *strLine;
  while(c && (c == ' ' || c == '\t'))
  {
    c = *strLine++;
  }
  if (!bSkipWhiteSpaces)
    PushToken(TOKEN_WHITESPACE, strCrsr, strLine - strCrsr);
  return strLine;
}

const char* cCPPTokenizer::HandleBlockComment(const char* strLine, bool bSkipComments)
{
  tToken token;
  const char* strEnd = strstr(strLine, "*/");
  if (strEnd == NULL)
  {
    m_strBuffer = strLine;
    m_bBlockComment = true;
    return NULL;
  }
  else
  {
    if (!bSkipComments)
      PushToken(TOKEN_COMMENT, strLine, strEnd - strLine + 2);
    m_bBlockComment = false;
    m_strBuffer.clear();
    return strEnd + 2;
  }
}

const char* cCPPTokenizer::AppendBlockComment(const char* strLine, bool bSkipComments)
{
  m_strBuffer.append("\n");

  const char* strEnd = strstr(strLine, "*/");
  if (strEnd == NULL)
  {
    m_strBuffer.append(strLine);
    return NULL;
  }

  m_strBuffer.append(strLine, strEnd - strLine + 2);
  if (!bSkipComments)
    PushToken(TOKEN_COMMENT, m_strBuffer.c_str());
  m_bBlockComment = false;
  m_strBuffer.clear();

  return strEnd + 2;
}

const char* cCPPTokenizer::HandlePreProc(const char* strLine)
{
  int iLen = strlen(strLine);
  if (strLine[iLen-1] == '\\')
  {
    m_strBuffer = strLine;
    m_bConcatPreProc = true;
  }
  else if ((iLen >= 3) && (strcmp(strLine + iLen-3, "?""?""/") == 0)) // trigraphs will also be handled inside strings
  {
    m_strBuffer = strLine;
    m_bConcatPreProc = true;
  }
  else
  {
    PushToken(TOKEN_PREPROC, strLine);
  }
  return strLine + iLen;
}

const char* cCPPTokenizer::AppendPreProc(const char* strLine)
{
  int iLen = strlen(strLine);

  m_strBuffer.append("\n");
  m_strBuffer.append(strLine);

  if (strLine[iLen-1] == '\\')
  {
    m_bConcatPreProc = true;
  }
  else if ((iLen >= 3) && (strcmp(strLine + iLen-3, "?""?""/") == 0)) // trigraphs will also be handled inside strings
  {
    m_bConcatPreProc = true;
  }
  else
  {
    PushToken(TOKEN_PREPROC, m_strBuffer.c_str());
    m_bConcatPreProc = false;
    m_strBuffer.clear();
  }
  return strLine + iLen;
}

const char* cCPPTokenizer::HandleString(const char* strLine, char cDelimiter, int nToken)
{
  std::stringstream strError;
  const char* strEnd = NULL;
  const char* strCrsr = strLine;

  if (*strLine == 'l' || *strLine == 'L')
    strCrsr++;

  do 
  { 
    strEnd = strchr(strCrsr+1, cDelimiter);
    if (strEnd == NULL)
    {
      int iLen = strlen(strLine)-1;
      if (nToken == TOKEN_STRING)
      {
        switch (strLine[iLen])
        {
          case '\\':
            m_strBuffer.assign(strLine, iLen+1);
            m_bMultiLineString = true;
            return strLine + iLen + 1;
          case '/':
            if (strncmp(strLine + iLen-2, "?""?""/", 3) == 0)
            {
              m_strBuffer.assign(strLine, iLen+1);
              m_bMultiLineString = true;
              return strLine + iLen + 1;
            }
            break;
          default: // continue
            break;
        }
      }
      strError << "ERROR: Missing end of string character " << *strLine << std::endl;
      GetTokenHandler()->HandleError(strError.str().c_str(), GetLine());
      return NULL;
    }
    strCrsr = strEnd;
  } while((*(strEnd-1) == '\\') && (*(strEnd-2) != '\\'));

  int iLen = strEnd - strLine + 1;
  PushToken(nToken, strLine, iLen);
  m_bMultiLineString = false;
  return strLine + iLen;
}

const char* cCPPTokenizer::AppendString(const char* strLine)
{
  m_strBuffer.append("\n");

  const char* strEnd = strstr(strLine, "\"");
  if (strEnd == NULL)
  {
    m_strBuffer.append(strLine);
    return NULL;
  }

  m_strBuffer.append(strLine, strEnd - strLine + 1);
  PushToken(TOKEN_MULTILINE_STRING, m_strBuffer.c_str());
  m_bMultiLineString = false;
  m_strBuffer.clear();

  return strEnd + 1;
}

const char* cCPPTokenizer::ParseLabel(const char* strLine)
{
  static char strBuffer[256];
  char c;
  const char* strCrsr = strLine+1;

  while(c = *strCrsr++)
  {
    if(!isalpha(c) && !isdigit(c) && c != '_')
      break;
  }

  int iLen = strCrsr - strLine - 1;
  strncpy_s<256>(strBuffer, strLine, iLen);
  strBuffer[iLen] = '\0';

  int kw = IsKeyword(strBuffer);
  if (kw != KW_UNKNOWN)
  {
    // filter keywords which are operators (alternative operators)
    switch (kw)
    {
      case OP_LOGICAL_AND:
      case OP_AND_ASSIGNMENT:
      case OP_BITWISE_AND:
      case OP_BITWISE_OR:
      case OP_COMPLEMENT:
      case OP_LOGICAL_NOT:
      case OP_NOT_EQUAL:
      case OP_LOGICAL_OR:
      case OP_OR_ASSIGNMENT:
      case OP_BITWISE_XOR:
      case OP_XOR_ASSIGNMENT:
        PushToken(TOKEN_OPERATOR, kw);
        break;
      default:
        PushToken(TOKEN_KEYWORD, kw);
        break;
    }    
  }
  else
  {
    PushToken(TOKEN_LABEL, strLine, iLen);
  }
  return strCrsr-1;
}

const char* cCPPTokenizer::ParseLiteral(const char* strLine)
{
  const char* strCrsr = strLine;
  int pos = 0;
  bool bContinue = true;
  bool bExponent = false;
  bool bFloating = false;
  bool bExpectSign = false;
  bool bHex = false;

  while(bContinue && *strCrsr)
  {
    char c = *strCrsr++;
    switch(c)
    {
      case '0': case '1': case '2': case '3': case '4':
      case '5': case '6': case '7': case '8': case '9':
        break;
      case 'x': case 'X':
        if (pos != 1) // x only at position 1
        {
          bContinue = false;
          bFloating = true; // no . in hex numbers
        }
        else
        {
          if (*strLine != '0')
            bContinue = false;
          bHex = true;
        }
        break;
      case 'e':
      case 'E':
        if (!bHex && !bExponent)
        {
          bExponent = true;
          bFloating = true; // no . after e
          bExpectSign = true;
        }
        else
        {
          if (!bHex)
            bContinue = false;
        }
        break;
      case 'a': case 'b': case 'c': case 'd': case 'f':
      case 'A': case 'B': case 'C': case 'D': case 'F':
        if (!bHex)
          bContinue = false;
        break;
      case '.':
        if (!bFloating)
          bFloating = true;
        else
          bContinue = false;
        break;
      case '-':
      case '+':
        if (bExpectSign)
          bExpectSign = false;
        else
          bContinue = false;
        break;
      default:
        strCrsr--;
        bContinue = false;
        break;
    }

    pos++;
  }

  switch(*strCrsr)
  {
    case 'F': case 'f':
      strCrsr++;
      break;
    case 'L': case 'l':
    case 'U': case 'u':
      strCrsr++;
      switch (*strCrsr)
      {
      case 'l':
      case 'L':
        strCrsr++;
        switch (*strCrsr) // c++11: ll & ull
        {
        case 'l':
        case 'L':
          strCrsr++;
          break;
        }
        break;
      }
      break;
  }

  PushToken(TOKEN_LITERAL, strLine, strCrsr - strLine);
  return strCrsr;
}

bool cCPPTokenizer::Parse(const char* strLine, bool bSkipWhiteSpaces, bool bSkipComments)
{
  bool bSlashFound = false;
  char c;

  if (!GetTokenHandler())
    return false;

  IncLine();
  LogLine(strLine);

  if (m_bBlockComment)
  {
    strLine = AppendBlockComment(strLine, bSkipComments);
  }
  else if (m_bMultiLineString)
  {
    strLine = AppendString(strLine);
  }
  else if (m_bConcatPreProc)
  {
    strLine = AppendPreProc(strLine);
  }
  else if (GetLine() > 1)
  {
    if (!bSkipWhiteSpaces)
      PushToken(TOKEN_NEWLINE);
  }

  if (strLine == NULL)
    return false;

  while(c = *strLine++)
  {
    tToken token;

    switch(c)
    {
      case ' ':
      case '\t':
        strLine = HandleWhiteSpace(strLine, bSkipWhiteSpaces);
        break;

      case '/':
        bSlashFound = true;
        break;

      case 'l': case 'L':
        switch (*strLine)
        {
          case '\'':
            strLine = HandleString(strLine-1, '\'', TOKEN_CHAR);
            break;
          case '\"':
            strLine = HandleString(strLine-1, '\"', TOKEN_STRING);
            break;
          default:
            strLine = ParseLabel(strLine-1);
            break;
        }
        if (strLine == NULL)
          return true;
        break;

        case '\"':
          strLine = HandleString(strLine-1, '\"', TOKEN_STRING);
          if (strLine == NULL)
            return true;
          break;

        case '\'':
          strLine = HandleString(strLine-1, '\'', TOKEN_CHAR);
          if (strLine == NULL)
            return true;
          break;

        case '#': 
          strLine = HandlePreProc(strLine); 
          if (strLine == NULL)
            return true;
          break;
        case '{': PushToken(TOKEN_BLOCK_BEGIN); break;
        case '}': PushToken(TOKEN_BLOCK_END); break;

        case '.': 
          switch(*strLine)
          {
            case '*': PushToken(TOKEN_OPERATOR, OP_MEMBER_ACCESS_DEREFERENCE); strLine++; break;
            case '.':
              if (strLine[1] == '.')
              {
                PushToken(TOKEN_OPERATOR, OP_ELLIPSIS); 
                strLine += 2;
              }
              break;
            case '0': case '1': case '2': case '3': case '4':
            case '5': case '6': case '7': case '8': case '9':
              strLine = ParseLiteral(strLine-1);
              if (strLine == NULL)
                return false;
              break;
            default: PushToken(TOKEN_OPERATOR, OP_MEMBER_ACCESS); break;
          }
          break;

        case ',': PushToken(TOKEN_OPERATOR, OP_LIST); break;
        case ';': PushToken(TOKEN_OPERATOR, OP_COMMAND_END); break;
        case '?': 
          switch(*strLine)
          {
            case '?':
              strLine++;
              switch(*strLine)
              {
                case '<': PushToken(TOKEN_BLOCK_BEGIN); strLine++; break;
                case '>': PushToken(TOKEN_BLOCK_END); strLine++; break;
                case '(': PushToken(TOKEN_OPERATOR, OP_INDEX_OPEN); strLine++; break;
                case ')': PushToken(TOKEN_OPERATOR, OP_INDEX_CLOSE); strLine++; break;
                case '\'': PushToken(TOKEN_OPERATOR, OP_BITWISE_XOR); strLine++; break;
                case '!':  PushToken(TOKEN_OPERATOR, OP_BITWISE_OR); strLine++; break;
                case '-': PushToken(TOKEN_OPERATOR, OP_COMPLEMENT); strLine++; break;
                case '=': 
                  strLine++; 
                  strLine = HandlePreProc(++strLine); 
                  if (strLine == NULL)
                    return true;
                  break;
                default: GetTokenHandler()->HandleError("unexpected character follows ?? (trigraph)", GetLine()); break;
              }
              break;
            default: PushToken(TOKEN_OPERATOR, OP_CONDITIONAL); break;
          }
          break;
        case '(': PushToken(TOKEN_OPERATOR, OP_BRACKET_OPEN); break;
        case ')': PushToken(TOKEN_OPERATOR, OP_BRACKET_CLOSE); break;
        case '[': PushToken(TOKEN_OPERATOR, OP_INDEX_OPEN); break;
        case ']': PushToken(TOKEN_OPERATOR, OP_INDEX_CLOSE); break;
        case '~': PushToken(TOKEN_OPERATOR, OP_COMPLEMENT); break;
        case '*': 
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, OP_PRODUCT_ASSIGNMENT); strLine++; break;
            default: PushToken(TOKEN_OPERATOR, OP_ASTERISK); break;
          }
          break;
          
        case '+': //+, ++, += 
          switch(*strLine)
          {
            case '+': PushToken(TOKEN_OPERATOR, OP_INCREMENT); strLine++; break;
            case '=': PushToken(TOKEN_OPERATOR, OP_SUM_ASSIGNMENT); strLine++; break;
            default: PushToken(TOKEN_OPERATOR, OP_ADDITION); break;
          }
          break;

        case '-': //-, --, -=, ->
          switch(*strLine)
          {
            case '-': PushToken(TOKEN_OPERATOR, OP_DECREMENT); strLine++; break;
            case '=': PushToken(TOKEN_OPERATOR, OP_DIFFERENCE_ASSIGNMENT); strLine++; break;
            case '>': 
            {
              strLine++; 
              switch(*strLine)
              {
                case '*': PushToken(TOKEN_OPERATOR, OP_POINTER_DEREFERNCE); strLine++; break;
                default: PushToken(TOKEN_OPERATOR, OP_POINTER); break;
              }
            }
            break;
            default: PushToken(TOKEN_OPERATOR, OP_SUBTRACTION); break;
          }
          break;

        case '%': //%, %=
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, OP_REMAINDER_ASSIGNMENT); strLine++; break;
            case '>': PushToken(TOKEN_BLOCK_END); strLine++; break;
            case ':':           
              strLine = HandlePreProc(++strLine); 
              if (strLine == NULL)
                return true;
              break;
            default: PushToken(TOKEN_OPERATOR, OP_MODULUS); break;
          }
          break;

        case '=': //=, ==
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, OP_EQUAL); strLine++; break;
            default: PushToken(TOKEN_OPERATOR, OP_ASSIGNMENT); break;
          }
          break;

        case '!': //!, !=
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, OP_NOT_EQUAL); strLine++; break;
            default: PushToken(TOKEN_OPERATOR, OP_LOGICAL_NOT); break;
          }
          break;

        case '<': //<, <=, <<, <<=
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, OP_SMALLER_OR_EQUAL); strLine++; break;
            case '%': PushToken(TOKEN_BLOCK_BEGIN); strLine++; break;
            case ':': PushToken(TOKEN_OPERATOR, OP_INDEX_OPEN); strLine++; break;
            case '<': 
              strLine++;
              switch(*strLine)
              {
                case '=': PushToken(TOKEN_OPERATOR, OP_SHIFT_LEFT_ASSIGNMENT); strLine++; break;
                default: PushToken(TOKEN_OPERATOR, OP_SHIFT_LEFT); break;
              }
              break;
            default: PushToken(TOKEN_OPERATOR, OP_SMALLER); break;
          }
          break;

        case '>': //>, >=, >>, >>=
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, OP_BIGGER_OR_EQUAL); strLine++; break;
            case '>': 
              strLine++;
              switch(*strLine)
              {
                case '=': PushToken(TOKEN_OPERATOR, OP_SHIFT_RIGHT_ASSIGNMENT); strLine++; break;
                default: PushToken(TOKEN_OPERATOR, OP_SHIFT_RIGHT); break;
              }
              break;
            default: PushToken(TOKEN_OPERATOR, OP_BIGGER); break;
          }
          break;

        case '&': //&, &&, &=
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, OP_AND_ASSIGNMENT); strLine++; break;
            case '&': PushToken(TOKEN_OPERATOR, OP_LOGICAL_AND); strLine++; break;
            default: PushToken(TOKEN_OPERATOR, OP_BITWISE_AND); break;
          }
          break;

        case '|': //|, ||, |=
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, OP_OR_ASSIGNMENT); strLine++; break;
            case '|': PushToken(TOKEN_OPERATOR, OP_LOGICAL_OR); strLine++; break;
            default: PushToken(TOKEN_OPERATOR, OP_BITWISE_OR); break;
          }
          break;

        case '^': //^, ^=
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, OP_XOR_ASSIGNMENT); strLine++; break;
            default: PushToken(TOKEN_OPERATOR, OP_BITWISE_XOR); break;
          }
          break;

        case ':': //:, ::
          switch(*strLine)
          {
            case ':': PushToken(TOKEN_OPERATOR, OP_SCOPE); strLine++; break;
            case '>': PushToken(TOKEN_OPERATOR, OP_INDEX_CLOSE); strLine++; break;
            default: PushToken(TOKEN_OPERATOR, OP_COLON); break;
          }
          break;

        default:
          if (isalpha(c) || c == '_')
          {
            strLine = ParseLabel(strLine-1);
          }
          else if (isdigit(c))
          {
            strLine = ParseLiteral(strLine-1);
          }
          else
          {
            std::stringstream strLog;
            strLog << "unknown character " << c;
            GetTokenHandler()->HandleError(strLog.str().c_str(), GetLine());
          }
          if (strLine == NULL)
            return false;
          break;
    }

    if (bSlashFound)
    {
      switch(c = *strLine++)
      {
        case '*':
          strLine = HandleBlockComment(strLine-2, bSkipComments);
          if (strLine == NULL)
          {
            return true;
          }
          break;

        case '/':
          if (!bSkipComments)
            PushToken(TOKEN_LINECOMMENT, strLine-2);
          return true;

        case '=':
          PushToken(TOKEN_OPERATOR, OP_QUOTIENT_ASSIGNMENT);
          break;

        default:
          PushToken(TOKEN_OPERATOR, OP_DIVIDE);
          strLine--; // current char is not used, process this again
          break;
      }

      if (c == 0)
      {
        return true;
      }

      bSlashFound = false;
    }
  }

  return true;
}
