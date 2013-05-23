#include "stdafx.h"

// cNamedScope

cNamedScope::cNamedScope(const char* strName, cScope* pParent)
: cScope(pParent)
, m_strName(strName)
{
}

cNamedScope::~cNamedScope()
{
}

const char* cNamedScope::GetName()
{
  return m_strName.c_str();
}


