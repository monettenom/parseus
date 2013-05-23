#include "stdafx.h"

// cNameSpace

cNameSpace::cNameSpace(const char* strName, cScope* pParent)
: cNamedScope(strName, pParent)
{
}

cNameSpace::~cNameSpace()
{
}

void cNameSpace::AddNameSpace(cNameSpace* pNameSpace)
{
  m_NameSpaces.insert(std::pair<std::string, cNameSpace*>(std::string(pNameSpace->GetName()), pNameSpace));
}

cNameSpace* cNameSpace::GetNameSpace(const char* strName)
{
  tNameSpaceMap::iterator it = m_NameSpaces.find(strName);
  if (it == m_NameSpaces.end())
    return NULL;
  return it->second;
}

tNameSpaceMap& cNameSpace::GetNameSpaces()
{
  return m_NameSpaces;
}

void cNameSpace::AddClass(cClass* pClass)
{
  m_Classes.insert(std::pair<std::string, cClass*>(std::string(pClass->GetName()), pClass));
}

cClass* cNameSpace::GetClass(const char* strName)
{
  tClassMap::iterator it = m_Classes.find(strName);
  if (it == m_Classes.end())
    return NULL;
  return it->second;
}

tClassMap& cNameSpace::GetClasses()
{
  return m_Classes;
}
