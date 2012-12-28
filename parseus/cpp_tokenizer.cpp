#include "stdafx.h"
#include "cpp_tokenizer.h"

static const char* g_OperatorString[CPP_OP_MAX] = {
  "CPP_OP_UNKNOWN",
  "CPP_OP_MEMBER_ACCESS",
  "CPP_OP_LIST",
  "CPP_OP_COMMAND_END",
  "CPP_OP_CONDITIONAL",
  "CPP_OP_BRACKET_OPEN", 
  "CPP_OP_BRACKET_CLOSE", 
  "CPP_OP_INDEX_OPEN",
  "CPP_OP_INDEX_CLOSE",
  "CPP_OP_ASTERISK",
  "CPP_OP_INCREMENT",
  "CPP_OP_DIVIDE",
  "CPP_OP_SUM_ASSIGNMENT",
  "CPP_OP_ADDITION",
  "CPP_OP_DECREMENT", 
  "CPP_OP_DIFFERENCE_ASSIGNMENT",
  "CPP_OP_SUBTRACTION",
  "CPP_OP_POINTER",
  "CPP_OP_REMAINDER_ASSIGNMENT",
  "CPP_OP_MODULUS",
  "CPP_OP_EQUAL",
  "CPP_OP_ASSIGNMENT",
  "CPP_OP_NOT_EQUAL",
  "CPP_OP_LOGICAL_NOT",
  "CPP_OP_SMALLER_OR_EQUAL",
  "CPP_OP_SHIFT_LEFT", 
  "CPP_OP_SMALLER", 
  "CPP_OP_SHIFT_LEFT_ASSIGNMENT",
  "CPP_OP_BIGGER_OR_EQUAL",
  "CPP_OP_SHIFT_RIGHT_ASSIGNMENT",
  "CPP_OP_SHIFT_RIGHT",
  "CPP_OP_BIGGER",
  "CPP_OP_AND_ASSIGNMENT",
  "CPP_OP_LOGICAL_AND",
  "CPP_OP_BITWISE_AND",
  "CPP_OP_OR_ASSIGNMENT",
  "CPP_OP_LOGICAL_OR",
  "CPP_OP_BITWISE_OR",
  "CPP_OP_XOR_ASSIGNMENT",
  "CPP_OP_BITWISE_XOR",
  "CPP_OP_COMPLEMENT",
  "CPP_OP_COLON",
  "CPP_OP_SCOPE",
  "CPP_OP_PRODUCT_ASSIGNMENT",
  "CPP_OP_QUOTIENT_ASSIGNMENT",
  "CPP_OP_POINTER_DEREFERNCE",
  "CPP_OP_MEMBER_ACCESS_DEREFERENCE",
  "CPP_OP_ELLIPSIS"
};

static tKeyword g_KeyWords[] = {
  {"__int64", CPP_KW_TYPE_INT64},
  {"alignas", CPP_KW_11_ALIGNAS},
  {"alignof", CPP_KW_11_ALIGNOF},
  {"and", CPP_OP_LOGICAL_AND},
  {"and_eq", CPP_OP_AND_ASSIGNMENT},
  {"asm", CPP_KW_ASM},
  {"auto", CPP_KW_AUTO},
  {"bitand", CPP_OP_BITWISE_AND},
  {"bitor", CPP_OP_BITWISE_OR},
  {"bool", CPP_KW_TYPE_BOOL},
  {"break", CPP_KW_BREAK},
  {"case", CPP_KW_CASE},
  {"catch", CPP_KW_CATCH},
  {"char", CPP_KW_TYPE_CHAR},
  {"char16_t", CPP_KW_11_CHAR16_T},
  {"char32_t", CPP_KW_11_CHAR32_T},
  {"class", CPP_KW_CLASS},
  {"compl", CPP_OP_COMPLEMENT},
  {"const", CPP_KW_TYPE_CONST},
  {"constexpr", CPP_KW_11_CONSTEXPR},
  {"const_cast", CPP_KW_CONST_CAST},
  {"continue", CPP_KW_CONTINUE},
  {"decltype", CPP_KW_11_DECLTYPE},
  {"default", CPP_KW_DEFAULT},
  {"delete", CPP_KW_DELETE},
  {"do", CPP_KW_DO},
  {"double", CPP_KW_TYPE_DOUBLE},
  {"dynamic_cast", CPP_KW_DYNAMIC_CAST},
  {"else", CPP_KW_ELSE},
  {"enum", CPP_KW_ENUM},
  {"extern", CPP_KW_EXTERN},
  {"explicit", CPP_KW_EXPLICIT},
  {"export", CPP_KW_EXPORT},
  {"false", CPP_KW_FALSE},
  {"final", CPP_KW_11_FINAL},
  {"float", CPP_KW_TYPE_FLOAT},
  {"for", CPP_KW_FOR},
  {"friend", CPP_KW_FRIEND},
  {"goto", CPP_KW_GOTO},
  {"if", CPP_KW_IF},
  {"inline", CPP_KW_INLINE},
  {"int", CPP_KW_TYPE_INT},
  {"long", CPP_KW_TYPE_LONG},
  {"mutable", CPP_KW_MUTABLE},
  {"namespace", CPP_KW_NAMESPACE}, 
  {"new", CPP_KW_NEW},
  {"noexcept", CPP_KW_11_NOEXCEPT},
  {"not", CPP_OP_LOGICAL_NOT},
  {"not_eq", CPP_OP_NOT_EQUAL},
  {"nullptr", CPP_KW_11_NULLPTR},
  {"operator", CPP_KW_OPERATOR},
  {"or", CPP_OP_LOGICAL_OR},
  {"or_eq", CPP_OP_OR_ASSIGNMENT},
  {"override", CPP_KW_11_OVERRIDE},
  {"private", CPP_KW_PRIVATE},
  {"protected", CPP_KW_PROTECTED},
  {"public", CPP_KW_PUBLIC},
  {"register", CPP_KW_REGISTER},
  {"reinterpret_cast", CPP_KW_REINTERPRET_CAST},
  {"return", CPP_KW_RETURN},
  {"short", CPP_KW_TYPE_SHORT},
  {"signed", CPP_KW_TYPE_SIGNED},
  {"sizeof", CPP_KW_SIZEOF},
  {"static", CPP_KW_STATIC},
  {"static_assert", CPP_KW_11_STATIC_ASSERT},
  {"static_cast", CPP_KW_STATIC_CAST},
  {"struct", CPP_KW_STRUCT},
  {"switch", CPP_KW_SWITCH},
  {"template", CPP_KW_TEMPLATE},
  {"this", CPP_KW_THIS},
  {"thread_local", CPP_KW_11_THREAD_LOCAL},
  {"throw", CPP_KW_THROW},
  {"true", CPP_KW_TRUE},
  {"try", CPP_KW_TRY},
  {"typedef", CPP_KW_TYPEDEF},
  {"typeid", CPP_KW_TYPEID},
  {"typename", CPP_KW_TYPENAME},
  {"union", CPP_KW_UNION},
  {"unsigned", CPP_KW_TYPE_UNSIGNED},
  {"using", CPP_KW_USING},
  {"virtual", CPP_KW_VIRTUAL},
  {"void", CPP_KW_TYPE_VOID}, 
  {"volatile", CPP_KW_VOLATILE}, 
  {"wchar_t", CPP_KW_TYPE_WCHAR_T},
  {"while", CPP_KW_WHILE},
  {"xor", CPP_OP_BITWISE_XOR},
  {"xor_eq", CPP_OP_XOR_ASSIGNMENT},
  {"unknown", CPP_KW_UNKNOWN}
};

static tKeyword g_Operators[] = {
  {".", CPP_OP_MEMBER_ACCESS},
  {",", CPP_OP_LIST},
  {";", CPP_OP_COMMAND_END},
  {"?", CPP_OP_CONDITIONAL},
  {"(", CPP_OP_BRACKET_OPEN},
  {")", CPP_OP_BRACKET_CLOSE},
  {"[", CPP_OP_INDEX_OPEN},
  {"]", CPP_OP_INDEX_CLOSE},
  {"*", CPP_OP_ASTERISK},
  {"++", CPP_OP_INCREMENT},
  {"/", CPP_OP_DIVIDE},
  {"+=", CPP_OP_SUM_ASSIGNMENT},
  {"+", CPP_OP_ADDITION},
  {"--", CPP_OP_DECREMENT}, 
  {"-=", CPP_OP_DIFFERENCE_ASSIGNMENT},
  {"-", CPP_OP_SUBTRACTION},
  {"->", CPP_OP_POINTER},
  {"%=", CPP_OP_REMAINDER_ASSIGNMENT},
  {"%", CPP_OP_MODULUS},
  {"==", CPP_OP_EQUAL},
  {"=", CPP_OP_ASSIGNMENT},
  {"!=", CPP_OP_NOT_EQUAL},
  {"!", CPP_OP_LOGICAL_NOT},
  {"<=", CPP_OP_SMALLER_OR_EQUAL},
  {"<<", CPP_OP_SHIFT_LEFT},
  {"<", CPP_OP_SMALLER}, 
  {"<<=", CPP_OP_SHIFT_LEFT_ASSIGNMENT},
  {">=", CPP_OP_BIGGER_OR_EQUAL},
  {">>=", CPP_OP_SHIFT_RIGHT_ASSIGNMENT},
  {">>", CPP_OP_SHIFT_RIGHT},
  {">", CPP_OP_BIGGER},
  {"&=", CPP_OP_AND_ASSIGNMENT},
  {"&&", CPP_OP_LOGICAL_AND},
  {"&", CPP_OP_BITWISE_AND},
  {"|=", CPP_OP_OR_ASSIGNMENT},
  {"||", CPP_OP_LOGICAL_OR},
  {"|", CPP_OP_BITWISE_OR},
  {"^=", CPP_OP_XOR_ASSIGNMENT},
  {"^", CPP_OP_BITWISE_XOR},
  {"~", CPP_OP_COMPLEMENT},
  {":", CPP_OP_COLON},
  {"::", CPP_OP_SCOPE},
  {"*=", CPP_OP_PRODUCT_ASSIGNMENT},
  {"/=", CPP_OP_QUOTIENT_ASSIGNMENT},
  {"->*", CPP_OP_POINTER_DEREFERNCE},
  {".*", CPP_OP_MEMBER_ACCESS_DEREFERENCE},
  {"...", CPP_OP_ELLIPSIS},
  {"unknown", CPP_OP_UNKNOWN}
};

// cCPPTokenizer

cCPPTokenizer::cCPPTokenizer()
: cTokenizer()
, m_bBlockComment(false)
, m_bMultiLineString(false)
, m_bConcatPreProc(false)
{
  AddKeywords(g_KeyWords, CPP_KW_UNKNOWN);
  AddOperators(g_Operators, CPP_OP_UNKNOWN);
}

cCPPTokenizer::~cCPPTokenizer()
{
}

const char* cCPPTokenizer::HandleBlockComment(const char* strLine, bool bSkipComments)
{
  tToken token;
  strLine += 2;
  const char* strEnd = strstr(strLine, "*/");
  if (strEnd == NULL)
  {
    m_strBuffer = strLine;
    m_bBlockComment = true;
    return NULL;
  }
  else if(strLine == strEnd)
  {
    if (!bSkipComments)
      PushToken(TOKEN_COMMENT, "", 0);
    return strEnd + 2;
  }
  else
  {
    if (!bSkipComments)
      PushToken(TOKEN_COMMENT, strLine, strEnd - strLine);
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

  m_strBuffer.append(strLine, strEnd - strLine);
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

void cCPPTokenizer::PushKeyword(int nKeyword)
{
  switch (nKeyword)
  {
    case CPP_OP_LOGICAL_AND:
    case CPP_OP_AND_ASSIGNMENT:
    case CPP_OP_BITWISE_AND:
    case CPP_OP_BITWISE_OR:
    case CPP_OP_COMPLEMENT:
    case CPP_OP_LOGICAL_NOT:
    case CPP_OP_NOT_EQUAL:
    case CPP_OP_LOGICAL_OR:
    case CPP_OP_OR_ASSIGNMENT:
    case CPP_OP_BITWISE_XOR:
    case CPP_OP_XOR_ASSIGNMENT:
      PushToken(TOKEN_OPERATOR, nKeyword);
      break;
    default:
      cTokenizer::PushKeyword(nKeyword);
      break;  
  }
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
            case '*': PushToken(TOKEN_OPERATOR, CPP_OP_MEMBER_ACCESS_DEREFERENCE); strLine++; break;
            case '.':
              if (strLine[1] == '.')
              {
                PushToken(TOKEN_OPERATOR, CPP_OP_ELLIPSIS); 
                strLine += 2;
              }
              break;
            case '0': case '1': case '2': case '3': case '4':
            case '5': case '6': case '7': case '8': case '9':
              strLine = ParseLiteral(strLine-1);
              if (strLine == NULL)
                return false;
              break;
            default: PushToken(TOKEN_OPERATOR, CPP_OP_MEMBER_ACCESS); break;
          }
          break;

        case ',': PushToken(TOKEN_OPERATOR, CPP_OP_LIST); break;
        case ';': PushToken(TOKEN_OPERATOR, CPP_OP_COMMAND_END); break;
        case '?': 
          switch(*strLine)
          {
            case '?':
              strLine++;
              switch(*strLine)
              {
                case '<': PushToken(TOKEN_BLOCK_BEGIN); strLine++; break;
                case '>': PushToken(TOKEN_BLOCK_END); strLine++; break;
                case '(': PushToken(TOKEN_OPERATOR, CPP_OP_INDEX_OPEN); strLine++; break;
                case ')': PushToken(TOKEN_OPERATOR, CPP_OP_INDEX_CLOSE); strLine++; break;
                case '\'': PushToken(TOKEN_OPERATOR, CPP_OP_BITWISE_XOR); strLine++; break;
                case '!':  PushToken(TOKEN_OPERATOR, CPP_OP_BITWISE_OR); strLine++; break;
                case '-': PushToken(TOKEN_OPERATOR, CPP_OP_COMPLEMENT); strLine++; break;
                case '=': 
                  strLine++; 
                  strLine = HandlePreProc(++strLine); 
                  if (strLine == NULL)
                    return true;
                  break;
                default: GetTokenHandler()->HandleError("unexpected character follows ?? (trigraph)", GetLine()); break;
              }
              break;
            default: PushToken(TOKEN_OPERATOR, CPP_OP_CONDITIONAL); break;
          }
          break;
        case '(': PushToken(TOKEN_OPERATOR, CPP_OP_BRACKET_OPEN); break;
        case ')': PushToken(TOKEN_OPERATOR, CPP_OP_BRACKET_CLOSE); break;
        case '[': PushToken(TOKEN_OPERATOR, CPP_OP_INDEX_OPEN); break;
        case ']': PushToken(TOKEN_OPERATOR, CPP_OP_INDEX_CLOSE); break;
        case '~': PushToken(TOKEN_OPERATOR, CPP_OP_COMPLEMENT); break;
        case '*':
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, CPP_OP_PRODUCT_ASSIGNMENT); strLine++; break;
            default: PushToken(TOKEN_OPERATOR, CPP_OP_ASTERISK); break;
          }
          break;
          
        case '+': //+, ++, +=
          switch(*strLine)
          {
            case '+': PushToken(TOKEN_OPERATOR, CPP_OP_INCREMENT); strLine++; break;
            case '=': PushToken(TOKEN_OPERATOR, CPP_OP_SUM_ASSIGNMENT); strLine++; break;
            default: PushToken(TOKEN_OPERATOR, CPP_OP_ADDITION); break;
          }
          break;

        case '-': //-, --, -=, ->
          switch(*strLine)
          {
            case '-': PushToken(TOKEN_OPERATOR, CPP_OP_DECREMENT); strLine++; break;
            case '=': PushToken(TOKEN_OPERATOR, CPP_OP_DIFFERENCE_ASSIGNMENT); strLine++; break;
            case '>':
            {
              strLine++;
              switch(*strLine)
              {
                case '*': PushToken(TOKEN_OPERATOR, CPP_OP_POINTER_DEREFERNCE); strLine++; break;
                default: PushToken(TOKEN_OPERATOR, CPP_OP_POINTER); break;
              }
            }
            break;
            default: PushToken(TOKEN_OPERATOR, CPP_OP_SUBTRACTION); break;
          }
          break;

        case '%': //%, %=
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, CPP_OP_REMAINDER_ASSIGNMENT); strLine++; break;
            case '>': PushToken(TOKEN_BLOCK_END); strLine++; break;
            case ':':
              strLine = HandlePreProc(++strLine);
              if (strLine == NULL)
                return true;
              break;
            default: PushToken(TOKEN_OPERATOR, CPP_OP_MODULUS); break;
          }
          break;

        case '=': //=, ==
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, CPP_OP_EQUAL); strLine++; break;
            default: PushToken(TOKEN_OPERATOR, CPP_OP_ASSIGNMENT); break;
          }
          break;

        case '!': //!, !=
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, CPP_OP_NOT_EQUAL); strLine++; break;
            default: PushToken(TOKEN_OPERATOR, CPP_OP_LOGICAL_NOT); break;
          }
          break;

        case '<': //<, <=, <<, <<=
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, CPP_OP_SMALLER_OR_EQUAL); strLine++; break;
            case '%': PushToken(TOKEN_BLOCK_BEGIN); strLine++; break;
            case ':': PushToken(TOKEN_OPERATOR, CPP_OP_INDEX_OPEN); strLine++; break;
            case '<': 
              strLine++;
              switch(*strLine)
              {
                case '=': PushToken(TOKEN_OPERATOR, CPP_OP_SHIFT_LEFT_ASSIGNMENT); strLine++; break;
                default: PushToken(TOKEN_OPERATOR, CPP_OP_SHIFT_LEFT); break;
              }
              break;
            default: PushToken(TOKEN_OPERATOR, CPP_OP_SMALLER); break;
          }
          break;

        case '>': //>, >=, >>, >>=
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, CPP_OP_BIGGER_OR_EQUAL); strLine++; break;
            case '>': 
              strLine++;
              switch(*strLine)
              {
                case '=': PushToken(TOKEN_OPERATOR, CPP_OP_SHIFT_RIGHT_ASSIGNMENT); strLine++; break;
                default: PushToken(TOKEN_OPERATOR, CPP_OP_SHIFT_RIGHT); break;
              }
              break;
            default: PushToken(TOKEN_OPERATOR, CPP_OP_BIGGER); break;
          }
          break;

        case '&': //&, &&, &=
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, CPP_OP_AND_ASSIGNMENT); strLine++; break;
            case '&': PushToken(TOKEN_OPERATOR, CPP_OP_LOGICAL_AND); strLine++; break;
            default: PushToken(TOKEN_OPERATOR, CPP_OP_BITWISE_AND); break;
          }
          break;

        case '|': //|, ||, |=
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, CPP_OP_OR_ASSIGNMENT); strLine++; break;
            case '|': PushToken(TOKEN_OPERATOR, CPP_OP_LOGICAL_OR); strLine++; break;
            default: PushToken(TOKEN_OPERATOR, CPP_OP_BITWISE_OR); break;
          }
          break;

        case '^': //^, ^=
          switch(*strLine)
          {
            case '=': PushToken(TOKEN_OPERATOR, CPP_OP_XOR_ASSIGNMENT); strLine++; break;
            default: PushToken(TOKEN_OPERATOR, CPP_OP_BITWISE_XOR); break;
          }
          break;

        case ':': //:, ::
          switch(*strLine)
          {
            case ':': PushToken(TOKEN_OPERATOR, CPP_OP_SCOPE); strLine++; break;
            case '>': PushToken(TOKEN_OPERATOR, CPP_OP_INDEX_CLOSE); strLine++; break;
            default: PushToken(TOKEN_OPERATOR, CPP_OP_COLON); break;
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
            PushToken(TOKEN_LINECOMMENT, strLine);
          return true;

        case '=':
          PushToken(TOKEN_OPERATOR, CPP_OP_QUOTIENT_ASSIGNMENT);
          break;

        default:
          PushToken(TOKEN_OPERATOR, CPP_OP_DIVIDE);
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
