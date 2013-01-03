#include "stdafx.h"
#include <algorithm>
#include "pas_tokenizer.h"

static const char* g_OperatorString[PAS_OP_MAX] = {
  "OP_UNKNOWN",
  "OP_ADDITION",
  "OP_SUBTRACTION",
  "OP_MULTIPLICATION",
  "OP_DIVISION",
  "OP_ASSIGNMENT",
  "OP_EQUAL",
  "OP_NOT_EQUAL",
  "OP_SMALLER",
  "OP_SMALLER_OR_EQUAL",
  "OP_BIGGER",
  "OP_BIGGER_OR_EQUAL",
  "OP_DEREFERENCE",
  "OP_ADDRESS",
  "OP_MEMBER_ACCESS",
  "OP_LIST",
  "OP_COMMAND_SEPARATOR",
  "OP_RANGE",
  "OP_ISTYPE",
  "OP_BRACKET_OPEN",
  "OP_BRACKET_CLOSE",
  "OP_INDEX_OPEN",
  "OP_INDEX_CLOSE",
  "OP_AMPERSAND"
};

static tKeyword g_KeyWords[] = {
  {"ansichar", PAS_KW_TYPE_ANSICHAR},
  {"ansistring", PAS_KW_TYPE_ANSISTRING},
  {"array", PAS_KW_TYPE_ARRAY},
  {"boolean", PAS_KW_TYPE_BOOLEAN},
  {"byte", PAS_KW_TYPE_BYTE},
  {"bytebool", PAS_KW_TYPE_BYTEBOOL},
  {"cardinal", PAS_KW_TYPE_CARDINAL},
  {"char", PAS_KW_TYPE_CHAR},
  {"comp", PAS_KW_TYPE_COMP},
  {"currency", PAS_KW_TYPE_CURRENCY},
  {"double", PAS_KW_TYPE_DOUBLE},
  {"extended", PAS_KW_TYPE_EXTENDED},
  {"int64", PAS_KW_TYPE_INT64},
  {"integer", PAS_KW_TYPE_INTEGER},
  {"longbool", PAS_KW_TYPE_LONGBOOL},
  {"longint", PAS_KW_TYPE_LONGINT},
  {"longword", PAS_KW_TYPE_LONGWORD},
  {"olevariant", PAS_KW_TYPE_OLEVARIANT},
  {"pointer", PAS_KW_TYPE_POINTER},
  {"rawbytestring", PAS_KW_TYPE_RAWBYTESTRING},
  {"real", PAS_KW_TYPE_REAL},
  {"real48", PAS_KW_TYPE_REAL48},
  {"record", PAS_KW_TYPE_RECORD},
  {"shortint", PAS_KW_TYPE_SHORTINT},
  {"shortstring", PAS_KW_TYPE_SHORTSTRING},
  {"single", PAS_KW_TYPE_SINGLE},
  {"smallint", PAS_KW_TYPE_SMALLINT},
  {"string", PAS_KW_TYPE_STRING},
  {"uint64", PAS_KW_TYPE_UINT64},
  {"unicodestring", PAS_KW_TYPE_UNICODESTRING},
  {"variant", PAS_KW_TYPE_VARIANT},
  {"widechar", PAS_KW_TYPE_WIDECHAR},
  {"widestring", PAS_KW_TYPE_WIDESTRING},
  {"word", PAS_KW_TYPE_WORD},
  {"wordbool", PAS_KW_TYPE_WORDBOOL},
  {"absolute", PAS_KW_ABSOLUTE},
  {"abstract", PAS_KW_ABSTRACT},
  {"add", PAS_KW_ADD},
  {"and", PAS_KW_AND},
  {"as", PAS_KW_AS},
  {"asm", PAS_KW_ASM},
  {"assembler", PAS_KW_ASSEMBLER},
  {"at", PAS_KW_AT},
  {"automated", PAS_KW_AUTOMATED},
  {"begin", PAS_KW_BEGIN},
  {"case", PAS_KW_CASE},
  {"cdecl", PAS_KW_CDECL},
  {"class", PAS_KW_CLASS},
  {"const", PAS_KW_CONST},
  {"constructor", PAS_KW_CONSTRUCTOR},
  {"contains", PAS_KW_CONTAINS},
  {"default", PAS_KW_DEFAULT},
  {"deprecated", PAS_KW_DEPRECATED},
  {"destructor", PAS_KW_DESTRUCTOR},
  {"dispid", PAS_KW_DISPID},
  {"dispinterface", PAS_KW_DISPINTERFACE},
  {"div", PAS_KW_DIV},
  {"do", PAS_KW_DO},
  {"downto", PAS_KW_DOWNTO},
  {"dynamic", PAS_KW_DYNAMIC},
  {"else", PAS_KW_ELSE},
  {"end", PAS_KW_END},
  {"except", PAS_KW_EXCEPT},
  {"export", PAS_KW_EXPORT},
  {"exports", PAS_KW_EXPORTS},
  {"external", PAS_KW_EXTERNAL},
  {"false", PAS_KW_FALSE},
  {"file", PAS_KW_FILE},
  {"final", PAS_KW_FINAL},
  {"finalization", PAS_KW_FINALIZATION},
  {"finally", PAS_KW_FINALLY},
  {"for", PAS_KW_FOR},
  {"forward", PAS_KW_FORWARD},
  {"function", PAS_KW_FUNCTION},
  {"goto", PAS_KW_GOTO},
  {"helper", PAS_KW_HELPER},
  {"if", PAS_KW_IF},
  {"implementation", PAS_KW_IMPLEMENTATION},
  {"implements", PAS_KW_IMPLEMENTS},
  {"in", PAS_KW_IN},
  {"index", PAS_KW_INDEX},
  {"inherited", PAS_KW_INHERITED},
  {"initialization", PAS_KW_INITIALIZATION},
  {"inline", PAS_KW_INLINE},
  {"interface", PAS_KW_INTERFACE},
  {"is", PAS_KW_IS},
  {"label", PAS_KW_LABEL},
  {"library", PAS_KW_LIBRARY},
  {"local", PAS_KW_LOCAL},
  {"message", PAS_KW_MESSAGE},
  {"mod", PAS_KW_MOD},
  {"name", PAS_KW_NAME},
  {"near", PAS_KW_NEAR},
  {"nil", PAS_KW_NIL},
  {"nodefault", PAS_KW_NODEFAULT},
  {"not", PAS_KW_NOT},
  {"of", PAS_KW_OF},
  {"on", PAS_KW_ON},
  {"operator", PAS_KW_OPERATOR},
  {"or", PAS_KW_OR},
  {"out", PAS_KW_OUT},
  {"overload", PAS_KW_OVERLOAD},
  {"override", PAS_KW_OVERRIDE},
  {"package", PAS_KW_PACKAGE},
  {"packed", PAS_KW_PACKED},
  {"pascal", PAS_KW_PASCAL},
  {"platform", PAS_KW_PLATFORM},
  {"pointermath", PAS_KW_POINTERMATH},
  {"private", PAS_KW_PRIVATE},
  {"procedure", PAS_KW_PROCEDURE},
  {"program", PAS_KW_PROGRAM},
  {"property", PAS_KW_PROPERTY},
  {"protected", PAS_KW_PROTECTED},
  {"public", PAS_KW_PUBLIC},
  {"published", PAS_KW_PUBLISHED},
  {"raise", PAS_KW_RAISE},
  {"read", PAS_KW_READ},
  {"readonly", PAS_KW_READONLY},
  {"register", PAS_KW_REGISTER},
  {"reintroduce", PAS_KW_REINTRODUCE},
  {"remove", PAS_KW_REMOVE},
  {"repeat", PAS_KW_REPEAT},
  {"requires", PAS_KW_REQUIRES},
  {"resident", PAS_KW_RESIDENT},
  {"resourcestring", PAS_KW_RESOURCESTRING},
  {"result", PAS_KW_RESULT},
  {"savecall", PAS_KW_SAFECALL},
  {"scopedenums", PAS_KW_SCOPEDENUMS},
  {"sealed", PAS_KW_SEALED},
  {"set", PAS_KW_SET},
  {"shl", PAS_KW_SHL},
  {"shr", PAS_KW_SHR},
  {"static", PAS_KW_STATIC},
  {"stdcall", PAS_KW_STDCALL},
  {"stored", PAS_KW_STORED},
  {"strict", PAS_KW_STRICT},
  {"then", PAS_KW_THEN},
  {"threadvar", PAS_KW_THREADVAR},
  {"to", PAS_KW_TO},
  {"true", PAS_KW_TRUE},
  {"try", PAS_KW_TRY},
  {"type", PAS_KW_TYPE},
  {"unit", PAS_KW_UNIT},
  {"unsafe", PAS_KW_UNSAFE},
  {"until", PAS_KW_UNTIL},
  {"uses", PAS_KW_USES},
  {"var", PAS_KW_VAR},
  {"varargs", PAS_KW_VARARGS},
  {"virtual", PAS_KW_VIRTUAL},
  {"while", PAS_KW_WHILE},
  {"with", PAS_KW_WITH},
  {"write", PAS_KW_WRITE},
  {"writeonly", PAS_KW_WRITEONLY},
  {"xor", PAS_KW_XOR},
  {"true", PAS_KW_TRUE},
  {"false", PAS_KW_FALSE},
  {"unkown", PAS_KW_UNKNOWN}
};

static tKeyword g_Operators[] = {
  {"unknown", PAS_OP_UNKNOWN},
  {"+", PAS_OP_ADDITION},
  {"-", PAS_OP_SUBTRACTION},
  {"*", PAS_OP_MULTIPLICATION},
  {"/", PAS_OP_DIVISION},
  {":=", PAS_OP_ASSIGNMENT},
  {"=", PAS_OP_EQUAL},
  {"!=", PAS_OP_NOT_EQUAL},
  {"<", PAS_OP_SMALLER},
  {"<=", PAS_OP_SMALLER_OR_EQUAL},
  {">", PAS_OP_BIGGER},
  {">=", PAS_OP_BIGGER_OR_EQUAL},
  {"^", PAS_OP_DEREFERENCE},
  {"@", PAS_OP_ADDRESS},
  {".", PAS_OP_MEMBER_ACCESS},
  {",", PAS_OP_LIST},
  {";", PAS_OP_COMMAND_SEPARATOR},
  {"..", PAS_OP_RANGE},
  {":", PAS_OP_ISTYPE},
  {"(", PAS_OP_BRACKET_OPEN},
  {")", PAS_OP_BRACKET_CLOSE},
  {"[", PAS_OP_INDEX_OPEN},
  {"]", PAS_OP_INDEX_CLOSE},
  {"&", PAS_OP_AMPERSAND}
};

// cPasTokenizer

cPasTokenizer::cPasTokenizer()
: cTokenizer()
, m_bBlockComment(false)
{
  AddKeywords(g_KeyWords, PAS_KW_UNKNOWN);
  AddOperators(g_Operators, PAS_OP_UNKNOWN);
}

cPasTokenizer::~cPasTokenizer()
{
}

const char* cPasTokenizer::HandleBlockComment(const char* strLine, bool bSkipComments)
{
  tToken token;
  int nOffset = 1;
  const char* strEnd = strchr(strLine, '}');
  const char* strEnd2 = strstr(strLine, "*)");
  if (((strEnd == NULL && strEnd2 != NULL)) || ((strEnd2 != NULL) && (strEnd2 < strEnd)))
  {
    strLine++;
    strEnd = strEnd2;
    nOffset = 2;
  }

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
    return strEnd + nOffset;
  }
  else
  {
    if (!bSkipComments)
      PushToken(TOKEN_COMMENT, strLine, strEnd - strLine);
    m_bBlockComment = false;
    m_strBuffer.clear();
    return strEnd + nOffset;
  }
}

const char* cPasTokenizer::AppendBlockComment(const char* strLine, bool bSkipComments)
{
  m_strBuffer.append("\n");

  const char* strEnd = strchr(strLine, '}');
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

  return strEnd + 1;
}

const char* cPasTokenizer::HandleString(const char* strLine)
{
  static char strBuffer[256];
  const char* strEnd = NULL;
  const char* strCrsr = strLine;
  strBuffer[0] = '\0';

  while (true)
  {
    strEnd = strchr(strCrsr+1, '\'');
    if (strEnd == NULL)
    {
      std::stringstream strError;
      strError << "ERROR: Missing end of string character " << *strLine << std::endl;
      GetTokenHandler()->HandleError(strError.str().c_str(), GetLine());
      return NULL;
    }
    strncat(strBuffer, strCrsr, strEnd-strCrsr+1);
    if (*(strEnd+1) == '\'')
    {
      strEnd++;
    }
    else
    {
      break;
    }
    strCrsr = strEnd;
  };
  PushToken(TOKEN_STRING, strBuffer, 0);
  return strEnd+1;
}

int cPasTokenizer::IsKeyword(const char* strLabel)
{
  std::string strBuffer(strLabel);
  std::transform(strBuffer.begin(), strBuffer.end(), strBuffer.begin(), ::tolower);
  return cTokenizer::IsKeyword(strBuffer.c_str());
}

void cPasTokenizer::PushKeyword(int nKeyword)
{
  switch (nKeyword)
  {
    case PAS_KW_BEGIN:
      PushToken(TOKEN_BLOCK_BEGIN);
      break;
    case PAS_KW_END:
      PushToken(TOKEN_BLOCK_END);
      break;
    default:
      cTokenizer::PushKeyword(nKeyword);
      break;
  }
}

const char* cPasTokenizer::ParseLiteral(const char* strLine, int nToken)
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
    case '$':
      if ((pos == 0) || ((pos == 1) && (*strLine == '#'))) // $ only at position 0 or position 1 if first char was #
      {
        bHex = true;
      }
      else
      {
        strCrsr--;
        bContinue = false;
        bFloating = true; // no . in hex numbers
      }
      break;
    case '#':
      if (pos == 0) // $ only at position 0
      {
        bFloating = true; // no . in char codes
      }
      else
      {
        strCrsr--;
        bContinue = false;
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

  PushToken(nToken, strLine, strCrsr - strLine);
  return strCrsr;
}

bool cPasTokenizer::Parse(const char* strLine, bool bSkipWhiteSpaces, bool bSkipComments)
{
  if (!GetTokenHandler())
    return false;

  IncLine();
  LogLine(strLine);

  if (m_bBlockComment)
  {
    strLine = AppendBlockComment(strLine, bSkipComments);
  }
  else if (GetLine() > 1)
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
      case '{':
        strLine = HandleBlockComment(strLine, bSkipComments);
        if (strLine == NULL)
        {
          return true;
        }
        break;
      case '+': PushToken(TOKEN_OPERATOR, PAS_OP_ADDITION); break;
      case '-': PushToken(TOKEN_OPERATOR, PAS_OP_SUBTRACTION); break;
      case '*': PushToken(TOKEN_OPERATOR, PAS_OP_MULTIPLICATION); break;
      case '/': 
        switch(*strLine)
        {
          case '/': PushToken(TOKEN_LINECOMMENT, strLine+1);
            return true;
          default: PushToken(TOKEN_OPERATOR, PAS_OP_DIVISION); break;
        }
        break;
      case '=': PushToken(TOKEN_OPERATOR, PAS_OP_EQUAL); break;
      case '>':
        switch(*strLine)
        {
          case '=': PushToken(TOKEN_OPERATOR, PAS_OP_BIGGER_OR_EQUAL); strLine++; break;
          default: PushToken(TOKEN_OPERATOR, PAS_OP_BIGGER); break;
        };
        break;
      case '<':
        switch(*strLine)
        {
          case '=': PushToken(TOKEN_OPERATOR, PAS_OP_SMALLER_OR_EQUAL); strLine++; break;
          case '>': PushToken(TOKEN_OPERATOR, PAS_OP_NOT_EQUAL); strLine++; break;
          default: PushToken(TOKEN_OPERATOR, PAS_OP_SMALLER); break;
        };
        break;
      case ':':
        switch(*strLine)
        {
          case '=': PushToken(TOKEN_OPERATOR, PAS_OP_ASSIGNMENT); strLine++; break;
          default: PushToken(TOKEN_OPERATOR, PAS_OP_ISTYPE); break;
        };
        break;
      case '^': PushToken(TOKEN_OPERATOR, PAS_OP_DEREFERENCE); break;
      case '@': PushToken(TOKEN_OPERATOR, PAS_OP_ADDRESS); break;
      case '&': PushToken(TOKEN_OPERATOR, PAS_OP_AMPERSAND); break;
      case ',': PushToken(TOKEN_OPERATOR, PAS_OP_LIST); break;
      case ';': PushToken(TOKEN_OPERATOR, PAS_OP_COMMAND_SEPARATOR); break;
      case '#': 
        strLine = ParseLiteral(strLine-1, TOKEN_CHAR);
        if (strLine == NULL)
          return false;
        break;
      case '$':
        strLine = ParseLiteral(strLine-1, TOKEN_LITERAL);
        if (strLine == NULL)
          return false;
        break;
      case '.': 
        switch(*strLine)
        {
          case '$':
          case '0': case '1': case '2': case '3': case '4':
          case '5': case '6': case '7': case '8': case '9':
            strLine = ParseLiteral(strLine-1, TOKEN_LITERAL);
            if (strLine == NULL)
              return false;
            break;
          case '.': PushToken(TOKEN_OPERATOR, PAS_OP_RANGE); strLine++; break;
          case ')': PushToken(TOKEN_OPERATOR, PAS_OP_INDEX_CLOSE); strLine++; break;
          default: PushToken(TOKEN_OPERATOR, PAS_OP_MEMBER_ACCESS); break;
        }
        break;
      case '\'':
        strLine = HandleString(strLine-1);
        if (strLine == NULL)
          return true;
        break;
      case '(':
        switch(*strLine)
        {
          case '.': PushToken(TOKEN_OPERATOR, PAS_OP_INDEX_OPEN); strLine++; break;
          case '*':
            strLine = HandleBlockComment(strLine, bSkipComments);
            if (strLine == NULL)
            {
              return true;
            }
            break;
          default: PushToken(TOKEN_OPERATOR, PAS_OP_BRACKET_OPEN); break;
        }
        break;
      case ')': PushToken(TOKEN_OPERATOR, PAS_OP_BRACKET_CLOSE); break;
      case '[': PushToken(TOKEN_OPERATOR, PAS_OP_INDEX_OPEN); break;
      case ']': PushToken(TOKEN_OPERATOR, PAS_OP_INDEX_CLOSE); break;

      default:
        if (isalpha(c) || c == '_')
        {
          strLine = ParseLabel(strLine-1);
        }
        else if (isdigit(c))
        {
          strLine = ParseLiteral(strLine-1, TOKEN_LITERAL);
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
