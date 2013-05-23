#include "stdafx.h"

// cGlobalScope

cGlobalScope* cGlobalScope::s_pGlobalScope = NULL;

cGlobalScope::cGlobalScope()
: cNameSpace("", NULL)
{
}

cGlobalScope::~cGlobalScope()
{
}

bool cGlobalScope::IsGlobalScope()
{
  return true;
}

cGlobalScope* cGlobalScope::GetGlobalScope()
{
  if (s_pGlobalScope)
    return s_pGlobalScope;
  return s_pGlobalScope = new cGlobalScope();
}

void cGlobalScope::FreeGlobalScope()
{
  delete s_pGlobalScope;
  s_pGlobalScope = NULL;
}
