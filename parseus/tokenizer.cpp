#include "stdafx.h"

// tToken

cStringMem* tToken::s_pStringMem = NULL;

void tToken::SetStringMem(cStringMem* pStringMem)
{
    s_pStringMem = pStringMem;
}

tToken::tToken()
: m_Token(TOKEN_UNKNOWN)
, m_strName(NULL)
, m_bNameSet(false)
{
}

tToken::tToken(const tToken& token)
{
    m_Token = token.m_Token;
    m_strName = token.m_strName;
    m_bNameSet = token.m_bNameSet;
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
    m_bNameSet = true;
}

void tToken::SetName(const char* strName)
{
    int iLen = strlen(strName)+1;
    m_strName = s_pStringMem->Alloc(iLen);
    if (!m_strName)
        return;
    strcpy_s(m_strName, iLen, strName);
    m_bNameSet = true;
};

tToken& tToken::operator=(const tToken& token)
{
    m_Token = token.m_Token;
    m_strName = token.m_strName;
    m_bNameSet = token.m_bNameSet;
    return *this;
}