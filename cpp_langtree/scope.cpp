#include "stdafx.h"

// cScope

cScope::cScope(cScope* pParent)
: cLanguageElement(pParent)
{
  if (pParent) // is null only if it is global scope
    pParent->AddScope(this);
}

cScope::~cScope()
{
  for (tScopeList::iterator it = m_ChildScopes.begin(); it != m_ChildScopes.end(); ++it)
  {
    delete *it;
  }
  m_ChildScopes.clear();
}

bool cScope::IsGlobalScope()
{
  return false;
}

void cScope::AddScope(cScope* pScope)
{
  m_ChildScopes.push_back(pScope);
}

tScopeList& cScope::GetChildScopes()
{
  return m_ChildScopes;
}

