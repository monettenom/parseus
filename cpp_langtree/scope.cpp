#include "stdafx.h"

// cScope
cScope::cScope()
: m_ParentScope(NULL)
{

}

cScope::~cScope()
{

}

bool cScope::IsGlobalScope()
{
  return false;
}

cScope* cScope::GetGlobalScope()
{
  static cGlobalScope* s_pGlobalScope = NULL;
  if (s_pGlobalScope)
    return s_pGlobalScope;
  return s_pGlobalScope = new cGlobalScope();
}

// cGlobalScope

cGlobalScope::cGlobalScope()
{

}

cGlobalScope::~cGlobalScope()
{

}

bool cGlobalScope::IsGlobalScope()
{
  return true;
}
