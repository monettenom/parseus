#include "stdafx.h"

// cTypeQualifier

cTypeQualifier::cTypeQualifier(cScope* pParent)
: cLanguageElement(pParent)
, m_Type(TYPE_UNKNOWN)
{
}

cTypeQualifier::~cTypeQualifier()
{
}

cTypeQualifier::eType cTypeQualifier::GetType()
{
  return m_Type;
}

void cTypeQualifier::SetType(eType oType)
{
  switch (oType)
  {
    case TYPE_VOLATILE:
    case TYPE_CONST:
      switch (m_Type)
      {
        case TYPE_VOLATILE:
        case TYPE_CONST:
          m_Type = TYPE_CONST_VOLATILE;
          break;
        default:
          m_Type = oType;
          break;
      }
      break;
    default:
      m_Type = oType;
      break;
  }
}

bool cTypeQualifier::HandleToken(tToken& oToken)
{
  if (oToken.IsToken(TOKEN_KEYWORD))
  {
    switch(oToken.m_Type)
    {
      case CPP_KW_TYPE_CONST:
        SetType(TYPE_CONST);
        return true;
      case CPP_KW_VOLATILE:
        SetType(TYPE_VOLATILE);
        return true;
    }
  }
  return false;
}

