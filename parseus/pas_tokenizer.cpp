#include "stdafx.h"
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
  "OP_COLON",
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
  {"string", PAS_KW_STRING},
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
  {":", PAS_OP_COLON},
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
, m_bMultiLineString(false)
, m_bConcatPreProc(false)
{
  AddKeywords(g_KeyWords, PAS_KW_UNKNOWN);
  AddOperators(g_Operators, PAS_OP_UNKNOWN);
}

cPasTokenizer::~cPasTokenizer()
{
}

const char* cPasTokenizer::HandleWhiteSpace(const char* strLine, bool bSkipWhiteSpaces)
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

const char* cPasTokenizer::HandleString(const char* strLine)
{
  std::stringstream strError;
  const char* strEnd = NULL;
  const char* strCrsr = strLine;

  if (*strLine == 'l' || *strLine == 'L')
    strCrsr++;

  strEnd = strchr(strCrsr+1, '\'');
  if (strEnd == NULL)
  {
    strError << "ERROR: Missing end of string character " << *strLine << std::endl;
    GetTokenHandler()->HandleError(strError.str().c_str(), GetLine());
    return NULL;
  }
  strCrsr = strEnd;

  int iLen = strEnd - strLine + 1;
  PushToken(TOKEN_STRING, strLine, iLen);
  return strLine + iLen;
}

bool cPasTokenizer::Parse(const char* strLine, bool bSkipWhiteSpaces, bool bSkipComments)
{
  if (!GetTokenHandler())
    return false;

  IncLine();
  LogLine(strLine);

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
        strLine = HandleWhiteSpace(strLine, bSkipWhiteSpaces);
        break;
    }
  }

  return false;
}
