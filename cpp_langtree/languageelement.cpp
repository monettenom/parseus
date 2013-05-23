#include "stdafx.h"

// cLanguageElement

cLanguageElement::cLanguageElement(cScope* pParent)
: m_pParentScope(pParent)
{
}

cLanguageElement::~cLanguageElement()
{
}

cScope* cLanguageElement::GetParentScope()
{
  return m_pParentScope;
}

bool cLanguageElement::HandleToken(tToken& oToken)
{
  return false;
}