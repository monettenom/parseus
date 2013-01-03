#include "stdafx.h"

const char* g_TokenString[TOKEN_MAX] = {
  "TOKEN_UNKNOWN",
  "TOKEN_COMMENT",
  "TOKEN_LINECOMMENT",
  "TOKEN_NEWLINE",
  "TOKEN_WHITESPACE",
  "TOKEN_PREPROC",
  "TOKEN_LABEL",
  "TOKEN_LITERAL",
  "TOKEN_STRING",
  "TOKEN_MULTILINE_STRING",
  "TOKEN_CHAR",
  "TOKEN_OPERATOR",
  "TOKEN_BLOCK_BEGIN",
  "TOKEN_BLOCK_END",
  "TOKEN_KEYWORD",
  "TOKEN_TEXT"
};

// tToken

cStringMem* tToken::s_pStringMem = NULL;

void tToken::SetStringMem(cStringMem* pStringMem)
{
  s_pStringMem = pStringMem;
}

tToken::tToken()
: m_Token(TOKEN_UNKNOWN)
, m_strName(NULL)
{
}

tToken::tToken(const tToken& token)
{
  m_Token = token.m_Token;
  m_strName = token.m_strName;
}

tToken::~tToken()
{
  m_strName = NULL;
}

void tToken::SetName(const char* strName, int iLen)
{
  m_strName = s_pStringMem->Alloc(iLen+1);
  if (!m_strName)
    return;
  strncpy_s(m_strName, iLen+1, strName, iLen);
  m_strName[iLen] = '\0';
}

void tToken::SetName(const char* strName)
{
  int iLen = strlen(strName)+1;
  m_strName = s_pStringMem->Alloc(iLen);
  if (!m_strName)
    return;
  strcpy_s(m_strName, iLen, strName);
};

tToken& tToken::operator=(const tToken& token)
{
  m_Token = token.m_Token;
  m_strName = token.m_strName;
  return *this;
}

// cTokenizer

cTokenizer::cTokenizer()
: m_pTokenHandler(NULL)
, m_iLine(0)
, m_nUnkownKeyword(0)
, m_nUnknownOperator(0)
{
  m_pStringMem = new cStringMem(1 << 18);
  tToken::SetStringMem(m_pStringMem);
}

cTokenizer::~cTokenizer()
{
  delete m_pStringMem;
  m_pStringMem = NULL;
}

int cTokenizer::GetLine() const
{
  return m_iLine;
}

int cTokenizer::IncLine(int nOffset)
{
  return ++m_iLine;
}

void cTokenizer::LogLine(const char* strLine)
{
  std::stringstream strLog;
  strLog << m_iLine << ": |" << strLine << "|";
  GetTokenHandler()->LogEntry(strLog.str().c_str());
}

void cTokenizer::SetTokenHandler(ITokenHandler* pTokenHandler)
{
  m_pTokenHandler = pTokenHandler;
}

ITokenHandler* cTokenizer::GetTokenHandler()
{
  return m_pTokenHandler;
}

void cTokenizer::Reset()
{
  if (m_pStringMem)
    m_pStringMem->Reset();
  m_iLine = 0;
}

void cTokenizer::PushToken(tToken& token)
{
  m_pTokenHandler->HandleToken(token);
}

void cTokenizer::PushToken(int nToken)
{
  tToken token;
  token.m_Token = nToken;
  PushToken(token);
}

void cTokenizer::PushToken(int nTokenType, int nOpType)
{
  tToken token;
  token.m_Token = nTokenType;
  token.m_Type = nOpType;
  PushToken(token);
}

void cTokenizer::PushToken(int nTokenType, const char* strName, int iLen)
{
  tToken token;
  token.m_Token = nTokenType;
  if (iLen == 0)
  {
    token.SetName(strName);
  }
  else
  {
    token.SetName(strName, iLen);
  }
  PushToken(token);
}

void cTokenizer::PushToken(int nTokenType, char cChar)
{
  tToken token;
  token.m_Token = nTokenType;
  token.m_cChar = cChar;
  PushToken(token);
}

const char* cTokenizer::HandleWhiteSpace(const char* strLine, bool bSkipWhiteSpaces)
{
  const char* strCrsr = strLine;
  char c = *strCrsr;
  while(c && (c == ' ' || c == '\t'))
  {
    c = *(++strCrsr);
  }
  if (!bSkipWhiteSpaces)
    PushToken(TOKEN_WHITESPACE, strLine, strCrsr - strLine);
  return strCrsr;
}

void cTokenizer::AddKeywords(tKeyword* pKeywords, int nUnknown)
{
  m_nUnkownKeyword = nUnknown;
  tKeyword* pCrsr = pKeywords;
  while (pCrsr->m_Type != m_nUnkownKeyword)
  {
    m_Keywords.insert(std::pair<std::string, int>(pCrsr->m_strKeyword, pCrsr->m_Type));
    m_KeywordStrings.insert(std::pair<int, std::string>(pCrsr->m_Type, pCrsr->m_strKeyword));
    pCrsr++;
  }
}

void cTokenizer::AddOperators(tKeyword* pOperators, int nUnknown)
{
  m_nUnknownOperator = nUnknown;
  tKeyword* pCrsr = pOperators;
  while (pCrsr->m_Type != m_nUnknownOperator)
  {
    m_Operators.insert(std::pair<std::string, int>(pCrsr->m_strKeyword, pCrsr->m_Type));
    m_OperatorStrings.insert(std::pair<int, std::string>(pCrsr->m_Type, pCrsr->m_strKeyword));
    pCrsr++;
  }
}

int cTokenizer::IsKeyword(const char* strLabel)
{
  tKeywordMap::iterator it = m_Keywords.find(std::string(strLabel));
  if (it != m_Keywords.end())
  {
    return it->second;
  }
  return m_nUnkownKeyword;
}

void cTokenizer::PushKeyword(int nKeyword)
{
  PushToken(TOKEN_KEYWORD, nKeyword);
}

const char* cTokenizer::ParseLabel(const char* strLine)
{
  std::string strBuffer;
  const char* strCrsr = strLine+1;

  while(char c = *strCrsr++)
  {
    if(!isalpha(c) && !isdigit(c) && c != '_')
      break;
  }

  int iLen = strCrsr - strLine - 1;
  strBuffer.assign(strLine, iLen);

  int kw = IsKeyword(strBuffer.c_str());
  if (kw != m_nUnkownKeyword)
  {
    PushKeyword(kw);
  }
  else
  {
    PushToken(TOKEN_LABEL, strLine, iLen);
  }
  return strCrsr-1;
}

const char* cTokenizer::GetTokenString(int nToken)
{
  if (nToken >= 0 && nToken < TOKEN_MAX)
  {
    return g_TokenString[nToken];
  }
  return "unknown";
}

const char* cTokenizer::GetKeywordString(int type)
{
  tKeywordStringMap::iterator it = m_KeywordStrings.find(type);
  if (it != m_KeywordStrings.end())
  {
    return it->second.c_str();
  }
  return "unknown";
}

const char* cTokenizer::GetOperatorString(int type)
{
  tKeywordStringMap::iterator it = m_OperatorStrings.find(type);
  if (it != m_OperatorStrings.end())
  {
    return it->second.c_str();
  }
  return "unknown";
}

