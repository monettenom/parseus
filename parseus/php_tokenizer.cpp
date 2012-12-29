#include "stdafx.h"
#include <algorithm>
#include "PHP_tokenizer.h"

static const char* g_OperatorString[PHP_OP_MAX] = {
  "OP_UNKNOWN",
  "OP_MEMBER_ACCESS",
  "OP_LIST",
  "OP_COMMAND_SEPARATOR",
  "OP_CONDITIONAL",
  "OP_BRACKET_OPEN",
  "OP_BRACKET_CLOSE",
  "OP_INDEX_OPEN",
  "OP_INDEX_CLOSE",
  "OP_MULTIPLICATION",
  "OP_INCREMENT",
  "OP_DIVISION",
  "OP_SUM_ASSIGNMENT",
  "OP_ADDITION",
  "OP_DECREMENT",
  "OP_DIFFERENCE_ASSIGNMENT",
  "OP_SUBTRACTION",
  "OP_REMAINDER_ASSIGNMENT",
  "OP_MODULUS",
  "OP_EQUAL",
  "OP_NOT_EQUAL",
  "OP_IDENTICAL",
  "OP_NOT_IDENTICAL",
  "OP_ASSIGNMENT",
  "OP_LOGICAL_NOT",
  "OP_SMALLER_OR_EQUAL",
  "OP_SHIFT_LEFT",
  "OP_SMALLER",
  "OP_SHIFT_LEFT_ASSIGNMENT",
  "OP_BIGGER_OR_EQUAL",
  "OP_SHIFT_RIGHT_ASSIGNMENT",
  "OP_SHIFT_RIGHT", // 30
  "OP_BIGGER",
  "OP_AND_ASSIGNMENT",
  "OP_LOGICAL_AND",
  "OP_BITWISE_AND",
  "OP_OR_ASSIGNMENT",
  "OP_LOGICAL_OR",
  "OP_BITWISE_OR",
  "OP_XOR_ASSIGNMENT",
  "OP_BITWISE_XOR",
  "OP_COMPLEMENT", // 40
  "OP_COLON",
  "OP_SCOPE",
  "OP_PRODUCT_ASSIGNMENT",
  "OP_QUOTIENT_ASSIGNMENT",
  "OP_BACKTICK",
  "OP_STRING_CONCATENATION",
  "OP_VARIABLE",
  "OP_HEREDOC",
  "OP_MAX"
};

static tKeyword g_KeyWords[] = {
  {"bool", PHP_KW_CAST_BOOL},
  {"boolean", PHP_KW_CAST_BOOLEAN},
  {"int", PHP_KW_CAST_INT},
  {"integer", PHP_KW_CAST_INTEGER},
  {"float", PHP_KW_CAST_FLOAT},
  {"double", PHP_KW_CAST_DOUBLE},
  {"string", PHP_KW_CAST_STRING},
  {"array", PHP_KW_CAST_ARRAY},
  {"object", PHP_KW_CAST_OBJECT},
  {"binary", PHP_KW_CAST_BINARY},
  {"null", PHP_KW_NULL},
  {"__halt_compiler", PHP_KW_HALT_COMPILER},
  {"abstract", PHP_KW_ABSTRACT},
  {"and", PHP_KW_AND},
  {"as", PHP_KW_AS},
  {"break", PHP_KW_BREAK},
  {"callable", PHP_KW_CALLABLE},
  {"case", PHP_KW_CASE},
  {"catch", PHP_KW_CATCH},
  {"class", PHP_KW_CLASS},
  {"clone", PHP_KW_CLONE},
  {"const", PHP_KW_CONST},
  {"continue", PHP_KW_CONTINUE},
  {"declare", PHP_KW_DECLARE},
  {"default", PHP_KW_DEFAULT},
  {"die", PHP_KW_DIE},
  {"do", PHP_KW_DO},
  {"echo", PHP_KW_ECHO},
  {"else", PHP_KW_ELSE},
  {"elseif", PHP_KW_ELSEIF},
  {"empty", PHP_KW_EMPTY},
  {"enddeclare", PHP_KW_ENDDECLARE},
  {"endfor", PHP_KW_ENDFOR},
  {"endforeach", PHP_KW_ENDFOREACH},
  {"endif", PHP_KW_ENDIF},
  {"endswitch", PHP_KW_ENDSWITCH},
  {"endwhile", PHP_KW_ENDWHILE},
  {"eval", PHP_KW_EVAL},
  {"exit", PHP_KW_EXIT},
  {"extends", PHP_KW_EXTENDS},
  {"final", PHP_KW_FINAL},
  {"for", PHP_KW_FOR},
  {"foreach", PHP_KW_FOREACH},
  {"function", PHP_KW_FUNCTION},
  {"global", PHP_KW_GLOBAL},
  {"goto", PHP_KW_GOTO},
  {"if", PHP_KW_IF},
  {"implements", PHP_KW_IMPLEMENTS},
  {"include", PHP_KW_INCLUDE},
  {"include_once", PHP_KW_INCLUDE_ONCE},
  {"instanceof", PHP_KW_INSTANCEOF},
  {"insteadof", PHP_KW_INSTEADOF},
  {"interface", PHP_KW_INTERFACE},
  {"isset", PHP_KW_ISSET},
  {"list", PHP_KW_LIST},
  {"namespace", PHP_KW_NAMESPACE},
  {"new", PHP_KW_NEW},
  {"or", PHP_KW_OR},
  {"print", PHP_KW_PRINT},
  {"private", PHP_KW_PRIVATE},
  {"protected", PHP_KW_PROTECTED},
  {"public", PHP_KW_PUBLIC},
  {"require", PHP_KW_REQUIRE},
  {"require_once", PHP_KW_REQUIRE_ONCE},
  {"return", PHP_KW_RETURN},
  {"static", PHP_KW_STATIC},
  {"unset", PHP_KW_UNSET},
  {"switch", PHP_KW_SWITCH},
  {"throw", PHP_KW_THROW},
  {"trait", PHP_KW_TRAIT},
  {"try", PHP_KW_TRY},
  {"unset", PHP_KW_UNSET},
  {"use", PHP_KW_USE},
  {"var", PHP_KW_VAR},
  {"while", PHP_KW_WHILE},
  {"xor", PHP_KW_XOR},
  {"unknown", PHP_KW_UNKNOWN},
};

static tKeyword g_Operators[] = {
  {"unknown", PHP_OP_UNKNOWN},
  {".", PHP_OP_MEMBER_ACCESS},
  {",", PHP_OP_LIST},
  {";", PHP_OP_COMMAND_SEPARATOR},
  {"?", PHP_OP_CONDITIONAL},
  {"(", PHP_OP_BRACKET_OPEN},
  {")", PHP_OP_BRACKET_CLOSE},
  {"[", PHP_OP_INDEX_OPEN},
  {"]", PHP_OP_INDEX_CLOSE},
  {"*", PHP_OP_MULTIPLICATION},
  {"++", PHP_OP_INCREMENT},
  {"/", PHP_OP_DIVISION},
  {"+=", PHP_OP_SUM_ASSIGNMENT},
  {"+", PHP_OP_ADDITION},
  {"--", PHP_OP_DECREMENT},
  {"-=", PHP_OP_DIFFERENCE_ASSIGNMENT},
  {"-", PHP_OP_SUBTRACTION},
  {"%", PHP_OP_MODULUS},
  {"%=", PHP_OP_MODULUS_ASSIGNMENT},
  {"==", PHP_OP_EQUAL},
  {"!=", PHP_OP_NOT_EQUAL},
  {"===", PHP_OP_IDENTICAL},
  {"!==", PHP_OP_NOT_IDENTICAL},
  {"=", PHP_OP_ASSIGNMENT},
  {"!", PHP_OP_LOGICAL_NOT},
  {"<=", PHP_OP_SMALLER_OR_EQUAL},
  {"<<", PHP_OP_SHIFT_LEFT},
  {"<", PHP_OP_SMALLER},
  {"<<=", PHP_OP_SHIFT_LEFT_ASSIGNMENT},
  {">=", PHP_OP_BIGGER_OR_EQUAL},
  {">>=", PHP_OP_SHIFT_RIGHT_ASSIGNMENT},
  {">>", PHP_OP_SHIFT_RIGHT}, // 30
  {">", PHP_OP_BIGGER},
  {"&=", PHP_OP_AND_ASSIGNMENT},
  {"&&", PHP_OP_LOGICAL_AND},
  {"&", PHP_OP_AMPERSAND},
  {"|=", PHP_OP_OR_ASSIGNMENT},
  {"||", PHP_OP_LOGICAL_OR},
  {"|", PHP_OP_BITWISE_OR},
  {"^=", PHP_OP_XOR_ASSIGNMENT},
  {"^", PHP_OP_BITWISE_XOR},
  {"~", PHP_OP_COMPLEMENT}, // 40
  {"~=", PHP_OP_COMPLEMENT_ASSIGNMENT},
  {":", PHP_OP_COLON},
  {"*=", PHP_OP_PRODUCT_ASSIGNMENT},
  {"/=", PHP_OP_QUOTIENT_ASSIGNMENT},
  {"`", PHP_OP_BACKTICK},
  {".=", PHP_OP_CONCATENATION_ASSIGNMENT},
  {"->*", PHP_OP_POINTER},
  {"=>", PHP_OP_ASSOCIATION},
  {"$", PHP_OP_VARIABLE},
  {"<<<", PHP_OP_HEREDOC}
};

// cPHPTokenizer

cPHPTokenizer::cPHPTokenizer()
: cTokenizer()
, m_bBlockComment(false)
, m_bHereDocMode(false)
{
  AddKeywords(g_KeyWords, PHP_KW_UNKNOWN);
  AddOperators(g_Operators, PHP_OP_UNKNOWN);
}

cPHPTokenizer::~cPHPTokenizer()
{
}

const char* cPHPTokenizer::HandleBlockComment(const char* strLine, bool bSkipComments)
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

const char* cPHPTokenizer::AppendBlockComment(const char* strLine, bool bSkipComments)
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

const char* cPHPTokenizer::HandleString(const char* strLine, char cDelimiter, int nToken)
{
  std::stringstream strError;
  const char* strEnd = NULL;
  const char* strCrsr = strLine;

  if (*strLine == 'b')
    strCrsr++;

  strEnd = strchr(strCrsr+1, cDelimiter);
  if (strEnd == NULL)
  {
    strError << "ERROR: Missing end of string character " << *strLine << std::endl;
    GetTokenHandler()->HandleError(strError.str().c_str(), GetLine());
    return NULL;
  }
  strCrsr = strEnd;

  int iLen = strEnd - strLine + 1;
  PushToken(nToken, strLine, iLen);
  return strLine + iLen;
}

int cPHPTokenizer::IsKeyword(const char* strLabel)
{
  std::string strBuffer(strLabel);
  std::transform(strBuffer.begin(), strBuffer.end(), strBuffer.begin(), ::tolower);
  return cTokenizer::IsKeyword(strBuffer.c_str());
}

void cPHPTokenizer::PushKeyword(int nKeyword)
{
  switch (nKeyword)
  {
    default:
      cTokenizer::PushKeyword(nKeyword);
      break;
  }
}

const char* cPHPTokenizer::ParseLiteral(const char* strLine)
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

  PushToken(TOKEN_LITERAL, strLine, strCrsr - strLine);
  return strCrsr;
}

const char* cPHPTokenizer::HandleHereDoc(const char* strLine, bool bSkipWhiteSpaces)
{
  PushToken(TOKEN_OPERATOR, PHP_OP_HEREDOC);
  strLine = HandleWhiteSpace(strLine, bSkipWhiteSpaces);
  if (!strLine) 
    return NULL;

  const char* strCrsr = strLine+1;
  while(char c = *strCrsr++)
  {
    if(!isalpha(c) && !isdigit(c) && c != '_')
      break;
  }
  int iLen = strCrsr - strLine - 1;
  PushToken(TOKEN_LABEL, strLine, iLen);
  m_strHereDocLabel.assign(strLine, iLen);
  HandleWhiteSpace(strLine, bSkipWhiteSpaces);
  m_bHereDocMode = true;
  m_strBuffer.clear();
  return NULL;
}

const char* cPHPTokenizer::AppendHereDoc(const char* strLine)
{
  if(strncmp(strLine, m_strHereDocLabel.c_str(), m_strHereDocLabel.length()) == 0)
  {
    PushToken(TOKEN_MULTILINE_STRING, m_strBuffer.c_str());
    m_bHereDocMode = false;
  }
  else
  {
    m_strBuffer.append(strLine);
    m_strBuffer.append("\n");
  }
  return NULL;
}

bool cPHPTokenizer::Parse(const char* strLine, bool bSkipWhiteSpaces, bool bSkipComments)
{
  if (!GetTokenHandler())
    return false;

  IncLine();
  LogLine(strLine);

  if (m_bBlockComment)
  {
    strLine = AppendBlockComment(strLine, bSkipComments);
  }
  else if (m_bHereDocMode)
  {
    AppendHereDoc(strLine);
    return true;
  }
  if (GetLine() > 1)
  {
    if (!bSkipWhiteSpaces)
      PushToken(TOKEN_NEWLINE);
  }

  if (strLine == NULL)
    return false;

  while(char c = *strLine++)
  {
    tToken token;

    switch(c)
    {
      case ' ':
      case '\t':
        strLine = HandleWhiteSpace(strLine-1, bSkipWhiteSpaces);
        break;
      case '{': PushToken(TOKEN_BLOCK_BEGIN); break;
      case '}': PushToken(TOKEN_BLOCK_END); break;
      case '+': 
        switch(*strLine)
        {
          case '+': PushToken(TOKEN_OPERATOR, PHP_OP_INCREMENT); strLine++; break;
          case '=': PushToken(TOKEN_OPERATOR, PHP_OP_SUM_ASSIGNMENT); strLine++; break;
          default: 
            PushToken(TOKEN_OPERATOR, PHP_OP_ADDITION); 
            break;
        }
        break;
      case '-': 
        switch(*strLine)
        {
          case '-': PushToken(TOKEN_OPERATOR, PHP_OP_DECREMENT); strLine++; break;
          case '=': PushToken(TOKEN_OPERATOR, PHP_OP_DIFFERENCE_ASSIGNMENT); strLine++; break;
          case '>': PushToken(TOKEN_OPERATOR, PHP_OP_POINTER); strLine++; break;
          default: 
            PushToken(TOKEN_OPERATOR, PHP_OP_SUBTRACTION); break;
            break;
        }
        break;
      case '*':
        switch(*strLine)
        {
          case '=': PushToken(TOKEN_OPERATOR, PHP_OP_PRODUCT_ASSIGNMENT); strLine++; break;
          default:  PushToken(TOKEN_OPERATOR, PHP_OP_MULTIPLICATION); break;
        }
        break;
      case '/': 
        switch(*strLine)
        {
          case '=': PushToken(TOKEN_OPERATOR, PHP_OP_QUOTIENT_ASSIGNMENT); strLine++; break;
          case '*':
            strLine = HandleBlockComment(strLine-1, bSkipComments);
            if (strLine == NULL)
            {
              return true;
            }
            break;
          case '/': PushToken(TOKEN_LINECOMMENT, strLine+1);
            return true;
          default: PushToken(TOKEN_OPERATOR, PHP_OP_DIVISION); break;
        }
        break;
      case '%':
        switch(*strLine)
        {
          case '=': PushToken(TOKEN_OPERATOR, PHP_OP_MODULUS_ASSIGNMENT); strLine++; break;
          default: PushToken(TOKEN_OPERATOR, PHP_OP_MODULUS); break;
        }
        break;
      case '=':
        switch(*strLine)
        {
          case '>': PushToken(TOKEN_OPERATOR, PHP_OP_ASSOCIATION); strLine++; break;
          case '=':
            strLine++;
            switch(*strLine)
            {
              case '=': PushToken(TOKEN_OPERATOR, PHP_OP_IDENTICAL); strLine++; break;
              default: PushToken(TOKEN_OPERATOR, PHP_OP_EQUAL); strLine++; break;
            }
            break;
          default: PushToken(TOKEN_OPERATOR, PHP_OP_ASSIGNMENT); break;
        }
        break;
      case '!':
        switch(*strLine)
        {
          case '=':
            strLine++;
            switch(*strLine)
            {
              case '=': PushToken(TOKEN_OPERATOR, PHP_OP_NOT_IDENTICAL); strLine++; break;
              default: PushToken(TOKEN_OPERATOR, PHP_OP_NOT_EQUAL); strLine++; break;
            }
            break;
          default: PushToken(TOKEN_OPERATOR, PHP_OP_LOGICAL_NOT); break;
        }
        break;
      case '>':
        switch(*strLine)
        {
          case '>': 
            strLine++;
            switch(*strLine)
            {
              case '=': PushToken(TOKEN_OPERATOR, PHP_OP_SHIFT_RIGHT_ASSIGNMENT); strLine++; break;
              default:  PushToken(TOKEN_OPERATOR, PHP_OP_SHIFT_RIGHT); break;
            }
            break;
          case '=': PushToken(TOKEN_OPERATOR, PHP_OP_BIGGER_OR_EQUAL); strLine++; break;
          default: PushToken(TOKEN_OPERATOR, PHP_OP_BIGGER); break;
        };
        break;
      case '<':
        switch(*strLine)
        {
          case '<': 
            strLine++;
            switch(*strLine)
            {
              case '=': PushToken(TOKEN_OPERATOR, PHP_OP_SHIFT_LEFT_ASSIGNMENT); strLine++; break;
              case '<': 
                strLine = HandleHereDoc(strLine+1, bSkipWhiteSpaces);
                if (strLine == NULL)
                  return true;
                break;
              default: PushToken(TOKEN_OPERATOR, PHP_OP_SHIFT_LEFT); break;
            }
            break;
          case '=': PushToken(TOKEN_OPERATOR, PHP_OP_SMALLER_OR_EQUAL); strLine++; break;
          default: PushToken(TOKEN_OPERATOR, PHP_OP_SMALLER); break;
        };
        break;
      case ':': PushToken(TOKEN_OPERATOR, PHP_OP_COLON); break;
      case '$': PushToken(TOKEN_OPERATOR, PHP_OP_VARIABLE); break;
      case '&':
        switch(*strLine)
        {
          case '&': PushToken(TOKEN_OPERATOR, PHP_OP_LOGICAL_AND); strLine++; break;
          case '=': PushToken(TOKEN_OPERATOR, PHP_OP_AND_ASSIGNMENT); strLine++; break;
          default: PushToken(TOKEN_OPERATOR, PHP_OP_AMPERSAND); break;
        }
        break;
      case '|':
        switch(*strLine)
        {
          case '|': PushToken(TOKEN_OPERATOR, PHP_OP_LOGICAL_OR); strLine++; break;
          case '=': PushToken(TOKEN_OPERATOR, PHP_OP_OR_ASSIGNMENT); strLine++; break;
          default: PushToken(TOKEN_OPERATOR, PHP_OP_BITWISE_OR); break;
        }
        break;
      case '^':
        switch(*strLine)
        {
          case '=': PushToken(TOKEN_OPERATOR, PHP_OP_XOR_ASSIGNMENT); strLine++; break;
          default: PushToken(TOKEN_OPERATOR, PHP_OP_BITWISE_XOR); break;
        }
        break;
      case '~':
        switch(*strLine)
        {
          case '=': PushToken(TOKEN_OPERATOR, PHP_OP_COMPLEMENT_ASSIGNMENT); strLine++; break;
          default: PushToken(TOKEN_OPERATOR, PHP_OP_COMPLEMENT); break;
        }
        break;
      case ',': PushToken(TOKEN_OPERATOR, PHP_OP_LIST); break;
      case ';': PushToken(TOKEN_OPERATOR, PHP_OP_COMMAND_SEPARATOR); break;
      case '?': PushToken(TOKEN_OPERATOR, PHP_OP_CONDITIONAL); break;
      case '#': PushToken(TOKEN_LINECOMMENT, strLine); return true;
      case '.': 
        switch(*strLine)
        {
          case '0': case '1': case '2': case '3': case '4':
          case '5': case '6': case '7': case '8': case '9':
            strLine = ParseLiteral(strLine-1);
            if (strLine == NULL)
              return false;
            break;
          default: PushToken(TOKEN_OPERATOR, PHP_OP_MEMBER_ACCESS); break;
        }
        break;
      case '\'':
        strLine = HandleString(strLine-1, '\'', TOKEN_STRING);
        if (strLine == NULL)
          return true;
        break;
      case '`':
        strLine = HandleString(strLine-1, '`', TOKEN_STRING);
        if (strLine == NULL)
          return true;
        break;
      case '\"':
        strLine = HandleString(strLine-1, '\"', TOKEN_STRING);
        if (strLine == NULL)
          return true;
        break;
      case '(':
        switch(*strLine)
        {
          case '.': PushToken(TOKEN_OPERATOR, PHP_OP_INDEX_OPEN); strLine++; break;
          case '*':
            strLine = HandleBlockComment(strLine, bSkipComments);
            if (strLine == NULL)
              return true;
            break;
          default: PushToken(TOKEN_OPERATOR, PHP_OP_BRACKET_OPEN); break;
        }
        break;
      case ')': PushToken(TOKEN_OPERATOR, PHP_OP_BRACKET_CLOSE); break;
      case '[': PushToken(TOKEN_OPERATOR, PHP_OP_INDEX_OPEN); break;
      case ']': PushToken(TOKEN_OPERATOR, PHP_OP_INDEX_CLOSE); break;
      case 'b':
        switch(*strLine)
        {
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
  }

  return false;
}
