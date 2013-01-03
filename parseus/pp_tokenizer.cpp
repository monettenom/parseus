#include "stdafx.h"
#include "pp_tokenizer.h"

static const char* g_OperatorString[PP_OP_MAX] = {
  "PP_OP_UNKNOWN"
  "PP_OP_PREPROC",
  "PP_OP_PREPROC_END",
  "PP_OP_BRACKET_OPEN",
  "PP_OP_BRACKET_CLOSE",
  "PP_OP_COMMA",
  "PP_OP_ELLIPSIS",
  "PP_OP_STRINGIFICATION",
  "PP_OP_CONCATENATION",
  "PP_OP_ADDITION",
  "PP_OP_SUBTRACTION",
  "PP_OP_MULTIPLICATION",
  "PP_OP_DIVISION",
  "PP_OP_MODULUS",
  "PP_OP_LOGICAL_AND",
  "PP_OP_LOGICAL_OR",
  "PP_OP_LOGICAL_NOT",
  "PP_OP_BITWISE_AND",
  "PP_OP_BITWISE_OR",
  "PP_OP_BITWISE_XOR",
  "PP_OP_BITWISE_NOT",
  "PP_OP_SHL",
  "PP_OP_SHR",
  "PP_OP_EQUAL",
  "PP_OP_NOT_EQUAL",
  "PP_OP_SMALLER",
  "PP_OP_SMALLER_OR_EQUAL",
  "PP_OP_BIGGER",
  "PP_OP_BIGGER_OR_EQUAL",
};

static tKeyword g_KeyWords[] = {
  {"", PP_KW_NULL},
  {"include", PP_KW_INCLUDE},
  {"include_next", PP_KW_INCLUDE_NEXT},
  {"import", PP_KW_IMPORT},
  {"define", PP_KW_DEFINE},
  {"undef", PP_KW_UNDEF},
  {"ifdef", PP_KW_IFDEF},
  {"ifndef", PP_KW_IFNDEF},
  {"if", PP_KW_IF},
  {"defined", PP_KW_DEFINED},
  {"else", PP_KW_ELSE},
  {"elif", PP_KW_ELIF},
  {"endif", PP_KW_ENDIF},
  {"error", PP_KW_ERROR},
  {"warning", PP_KW_WARNING},
  {"line", PP_KW_LINE},
  {"pragma", PP_KW_PRAGMA},
  {"ident", PP_KW_IDENT},
  {"sccs", PP_KW_SCCS},
  {"assert", PP_KW_ASSERT},
  {"unassert", PP_KW_UNASSERT},
  {"unknown", PP_KW_UNKNOWN}
};

static tKeyword g_Operators[] = {
  {"#", PP_OP_PREPROC},
  {"(", PP_OP_BRACKET_OPEN},
  {")", PP_OP_BRACKET_CLOSE},
  {",", PP_OP_COMMA},
  {"...", PP_OP_ELLIPSIS},
  {"#", PP_OP_STRINGIFICATION},
  {"##", PP_OP_CONCATENATION},
  {"+", PP_OP_ADDITION},
  {"-", PP_OP_SUBTRACTION},
  {"*", PP_OP_MULTIPLICATION},
  {"/", PP_OP_DIVISION},
  {"%", PP_OP_MODULUS},
  {"&&", PP_OP_LOGICAL_AND},
  {"||", PP_OP_LOGICAL_OR},
  {"!", PP_OP_LOGICAL_NOT},
  {"&", PP_OP_BITWISE_AND},
  {"|", PP_OP_BITWISE_OR},
  {"^", PP_OP_BITWISE_XOR},
  {"~", PP_OP_BITWISE_NOT},
  {"<<", PP_OP_SHL},
  {">>", PP_OP_SHR},
  {"==", PP_OP_EQUAL},
  {"!=", PP_OP_NOT_EQUAL},
  {"<", PP_OP_SMALLER},
  {"<=", PP_OP_SMALLER_OR_EQUAL},
  {">", PP_OP_BIGGER},
  {">=", PP_OP_BIGGER_OR_EQUAL},
  {"unknown", PP_OP_UNKNOWN}
};

// cPreProcessor

cPPTokenizer::cPPTokenizer()
: cTokenizer()
, m_bBlockComment(false)
, m_bMultiLineString(false)
, m_bPreProcMode(false)
, m_bInclude(false)
{
  AddKeywords(g_KeyWords, PP_KW_UNKNOWN);
  AddOperators(g_Operators, PP_OP_UNKNOWN);
}

cPPTokenizer::~cPPTokenizer()
{
}

const char* cPPTokenizer::HandleBlockComment(const char* strLine)
{
  tToken token;
  strLine += 2;
  const char* strEnd = strstr(strLine, "*/");
  if (strEnd == NULL)
  {
    m_bBlockComment = true;
    return NULL;
  }
  else if(strLine == strEnd)
  {
    return strEnd + 2;
  }
  else
  {
    m_bBlockComment = false;
    return strEnd + 2;
  }
}

const char* cPPTokenizer::AppendBlockComment(const char* strLine)
{
  const char* strEnd = strstr(strLine, "*/");
  if (strEnd == NULL)
  {
    return NULL;
  }

  m_bBlockComment = false;
  m_strBuffer.clear();

  return strEnd + 2;
}

const char* cPPTokenizer::HandleString(const char* strLine, char cDelimiter, int nToken)
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
            m_strBuffer.assign(strLine, iLen);
            m_bMultiLineString = true;
            return strLine + iLen + 1;
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

const char* cPPTokenizer::AppendString(const char* strLine)
{
  const char* strEnd = strstr(strLine, "\"");
  if (strEnd == NULL)
  {
    int nLen = strlen(strLine);
    if (strLine[nLen-1] == '\\')
    {
      m_strBuffer.append(strLine, nLen-1);
    }
    else
    {
      GetTokenHandler()->HandleError("Newline in constant", GetLine());
    }
    return NULL;
  }

  m_strBuffer.append(strLine, strEnd - strLine + 1);
  PushToken(TOKEN_STRING, m_strBuffer.c_str());
  m_bMultiLineString = false;
  m_strBuffer.clear();

  return strEnd + 1;
}

void cPPTokenizer::PushKeyword(int nKeyword)
{
  if (!m_bPreProcMode)
  {
    PushToken(TOKEN_LABEL, GetKeywordString(nKeyword));
  }
  else
  {
    m_bInclude = (nKeyword == PP_KW_INCLUDE);
    cTokenizer::PushKeyword(nKeyword);
  }
}

bool cPPTokenizer::PushPreProcEnd()
{
  // inside a block comment or strings, the state of the preprocessor mode is not changed!
  if (m_bBlockComment || m_bMultiLineString)
  {
    return true;
  }

  if (m_bPreProcMode)
  {
    m_bPreProcMode = false;
    PushToken(TOKEN_OPERATOR, PP_OP_PREPROC_END);
  }
  return true;
}

const char* cPPTokenizer::ParseLiteral(const char* strLine)
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

const char* cPPTokenizer::HandleWhiteSpace(const char* strLine, bool bSkipWhiteSpaces)
{
  const char* strCrsr = strLine;
  char c = *strCrsr;
  while(c && (c == ' ' || c == '\t'))
  {
    c = *(++strCrsr);
  }
  if (!bSkipWhiteSpaces && strCrsr[1] != '\0')
    PushToken(TOKEN_WHITESPACE, " ");
  return strCrsr;
}

void cPPTokenizer::PushTokenIfPreProcMode(int nToken, int nType, const char* strText)
{
  if (m_bPreProcMode)
  {
    PushToken(nToken, nType);
  }
  else
  {
    if (strlen(strText) > 1)
    {
      PushToken(TOKEN_TEXT, strText);
    }
    else
    {
      PushToken(TOKEN_CHAR, strText[0]);
    }
  }
}

bool cPPTokenizer::Parse(const char* strLine, bool bSkipWhiteSpaces, bool bSkipComments)
{
  bool bSlashFound = false;
  char c;

  if (!GetTokenHandler())
    return false;

  IncLine();
  LogLine(strLine);

  if (m_bBlockComment)
  {
    strLine = AppendBlockComment(strLine);
  }
  else if (m_bMultiLineString)
  {
    strLine = AppendString(strLine);
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
        strLine = HandleWhiteSpace(strLine-1, bSkipWhiteSpaces);
        break;

      case '#':
        if (m_bPreProcMode) 
        {
          switch(*strLine)
          {
            case '#': PushToken(TOKEN_OPERATOR, PP_OP_CONCATENATION); strLine++; break;
            default:
              PushToken(TOKEN_OPERATOR, PP_OP_STRINGIFICATION); 
              break;
          }
        }
        else
        {
          PushToken(TOKEN_OPERATOR, PP_OP_PREPROC);
          m_bPreProcMode = true;
        }
        break;

      case ',': PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_COMMA, ","); break;
      case '(': PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_BRACKET_OPEN, "("); break;
      case ')': PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_BRACKET_CLOSE, ")"); break;
      case '+': PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_ADDITION, "+"); break;
      case '-': PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_SUBTRACTION, "-"); break;
      case '*': PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_MULTIPLICATION, "*"); break;
      case '%':
        switch(*strLine)
        {
          case '>': PushToken(TOKEN_CHAR, '}'); strLine++; break;
          case ':': PushToken(TOKEN_CHAR, '#'); strLine++; break;
          default: PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_MODULUS, "%"); break;
        }
        break;
      case '~': PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_BITWISE_NOT, "~"); break;
      case '^': PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_BITWISE_XOR, "^"); break;
      case '!':
        switch(*strLine)
        {
          case '=': PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_NOT_EQUAL, "!="); strLine++; break;
          default: PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_LOGICAL_NOT, "!"); break;
        }
        break;
      case '&':
        switch(*strLine)
        {
          case '&': PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_LOGICAL_AND, "&&"); strLine++; break;
          default: PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_BITWISE_AND, "&"); break;
        }
        break;
      case '|':
        switch(*strLine)
        {
          case '|': PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_LOGICAL_OR, "||"); strLine++; break;
          default: PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_BITWISE_OR, "|"); break;
        }
        break;
      case '=': 
        if (*strLine == '=')
        {
          PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_EQUAL, "==");
          strLine++;
        }
        else
        {
          PushToken(TOKEN_CHAR, '=');
        }
        break;
      case '.':
        if (strLine[0] == '.' && strLine[1] == '.')
        {
          strLine += 2;
          PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_ELLIPSIS, "...");
        }
        else
        {
          switch(*strLine)
          {
            case '0': case '1': case '2': case '3': case '4':
            case '5': case '6': case '7': case '8': case '9':
              strLine = ParseLiteral(strLine-1);
              if (strLine == NULL)
                return PushPreProcEnd();
              break;
            default:
              PushToken(TOKEN_CHAR, '.');
              break;
          }
        }
        break;
      case ':':
        switch(*strLine)
        {
          case '>': PushToken(TOKEN_CHAR, ']'); strLine++; break;
          default: PushToken(TOKEN_CHAR, ':'); break;
        }
        break;
      case '/':
        switch(*strLine)
        {
          case '/':
            // line comments are removed
            return PushPreProcEnd();
          case '*':
            strLine = HandleBlockComment(strLine-2);
            if (strLine == NULL)
              return PushPreProcEnd();
            break;

          default: PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_DIVISION, "/"); break;
        }
        break;

        case '\"':
          strLine = HandleString(strLine-1, '\"', TOKEN_STRING);
          if (strLine == NULL)
            return PushPreProcEnd();
          break;
        case '>':
          switch(*strLine)
          {
            case '>': PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_SHR, ">>"); strLine++; break;
            case '=': PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_BIGGER_OR_EQUAL, ">="); strLine++; break;
            default: PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_BIGGER, ">"); break;
          }
          break;
        case '<':
          if (m_bInclude)
          {
            strLine = HandleString(strLine-1, '>', TOKEN_STRING);
            m_bInclude = false;
            if (strLine == NULL)
              return PushPreProcEnd();
          }
          else
          {
            switch(*strLine)
            {
              case '<': PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_SHL, "<<"); strLine++; break;
              case '=': PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_SMALLER_OR_EQUAL, "<="); strLine++; break;
              case '%': PushToken(TOKEN_CHAR, '{'); strLine++; break;
              case ':': PushToken(TOKEN_CHAR, '['); strLine++; break;
              default: PushTokenIfPreProcMode(TOKEN_OPERATOR, PP_OP_SMALLER, "<"); break;
            }
            break;
          }
          break;

        case '\\':
          // check whether a line concatenation takes place
          if(*strLine == '\0')
          {
            return true;
          }
          break;

      case '?':
        switch(*strLine)
        {
          case '?':
            strLine++;
            switch(*strLine)
            {
              case '<': PushToken(TOKEN_CHAR, '{'); strLine++; break;
              case '>': PushToken(TOKEN_CHAR, '}'); strLine++; break;
              case '(': PushToken(TOKEN_CHAR, '['); strLine++; break;
              case ')': PushToken(TOKEN_CHAR, ']'); strLine++; break;
              case '\'': PushToken(TOKEN_CHAR, '^'); strLine++; break;
              case '!':  PushToken(TOKEN_CHAR, '|'); strLine++; break;
              case '-': PushToken(TOKEN_CHAR, '~'); strLine++; break;
              case '=': PushToken(TOKEN_CHAR, '#'); strLine++; break;
              case '/': PushToken(TOKEN_CHAR, '\\'); strLine++; break;
              default: PushToken(TOKEN_TEXT, "??"); break;
            }
            break;
          default: PushToken(TOKEN_CHAR, '?'); break;
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
          PushToken(TOKEN_CHAR, c);
        }
        break;
    }
  }

  return PushPreProcEnd();
}
