#include "cpp_tokenizer.h"
#include "specifier.h"

// cTypeModifier

cTypeModifier::cTypeModifier()
: m_eStorage(STORAGE_NONE)
, m_eModifier(MOD_NONE)
, m_eSign(SIGN_NONE)
, m_bConst(false)
{
}

cTypeModifier::~cTypeModifier()
{
}

eStorage cTypeModifier::GetStorageType() const
{
  return m_eStorage;
}

void cTypeModifier::SetStorageType(eStorage Storage)
{
  m_eStorage = Storage;
}

eModifier cTypeModifier::GetModifier() const
{
  return m_eModifier;
}

void cTypeModifier::SetModifier(eModifier Modifier)
{
  m_eModifier = Modifier;
}

eSign cTypeModifier::GetSign() const
{
  return m_eSign;
}

void cTypeModifier::SetSign(eSign Sign)
{
  m_eSign = Sign;
}

bool cTypeModifier::IsConst() const
{
  return m_bConst;
}

void cTypeModifier::SetConst()
{
  m_bConst = true;
}

// cTypeSpecification

cTypeSpecification::cTypeSpecification()
{
}

cTypeSpecification::~cTypeSpecification()
{
}

const char* cTypeSpecification::GetName() const
{
  return m_strName.c_str();
}

cTypeModifier& cTypeSpecification::GetModifier()
{
  return m_Modifier;
}

bool cTypeSpecification::HandleToken(tToken& oToken)
{
  switch(oToken.m_Token)
  {
    case TOKEN_KEYWORD:
    {
      switch(oToken.m_Type)
      {
        case CPP_KW_TYPE_CONST: m_Modifier.SetConst(); break;

        case CPP_KW_AUTO: m_Modifier.SetStorageType(STORAGE_AUTO); break;
        case CPP_KW_STATIC: m_Modifier.SetStorageType(STORAGE_STATIC); break;
        case CPP_KW_MUTABLE: m_Modifier.SetStorageType(STORAGE_MUTABLE); break;
        case CPP_KW_VOLATILE: m_Modifier.SetStorageType(STORAGE_VOLATILE); break;
        case CPP_KW_REGISTER: m_Modifier.SetStorageType(STORAGE_REGISTER); break;

        case CPP_KW_TYPE_SIGNED: m_Modifier.SetSign(SIGN_SIGNED); break;
        case CPP_KW_TYPE_UNSIGNED: m_Modifier.SetSign(SIGN_UNSIGNED); break;

        case CPP_KW_TYPE_VOID: m_strName.assign("void"); break;
        case CPP_KW_TYPE_BOOL: m_strName.assign("bool"); break;
        case CPP_KW_TYPE_CHAR: m_strName.assign("char"); break;
        case CPP_KW_TYPE_SHORT: 
          m_Modifier.SetModifier(MOD_SHORT); 
          m_strName.assign("int"); 
          break;
        case CPP_KW_TYPE_INT: 
          m_strName.assign("int"); 
          break;
        case CPP_KW_TYPE_LONG: 
          if (m_Modifier.GetModifier() == MOD_LONG)
          {
            m_Modifier.SetModifier(MOD_LONG_LONG);
          }
          m_strName.assign("int");
          break;
        case CPP_KW_TYPE_FLOAT: 
          m_strName.assign("float"); 
          break;
        case CPP_KW_TYPE_DOUBLE: 
          m_strName.assign("double"); 
          break;
        default:
          return false;
      }
    }
    break;
    default:
      return false;
  }
  return true;
}

cTypeSpecification* cTypeSpecification::IsTypeSpecification(tToken& oToken)
{
  switch(oToken.m_Token)
  {
    case TOKEN_KEYWORD:
    {
      switch(oToken.m_Type)
      {
        case CPP_KW_TYPE_CONST:

        case CPP_KW_AUTO:
        case CPP_KW_STATIC:
        case CPP_KW_MUTABLE:
        case CPP_KW_VOLATILE:
        case CPP_KW_REGISTER:

        case CPP_KW_TYPE_SIGNED:
        case CPP_KW_TYPE_UNSIGNED:

        case CPP_KW_TYPE_VOID:
        case CPP_KW_TYPE_BOOL:
        case CPP_KW_TYPE_CHAR:
        case CPP_KW_TYPE_SHORT:
        case CPP_KW_TYPE_INT:
        case CPP_KW_TYPE_LONG:
        case CPP_KW_TYPE_FLOAT:
        case CPP_KW_TYPE_DOUBLE:
        {
          return new cTypeSpecification;
        }
        break;
      }
    }
  }
  return NULL;
}

// cTypedef

cTypedef::cTypedef()
: m_pSpecification(NULL)
, m_pElement(NULL)
{

}

cTypedef::~cTypedef()
{

}

bool cTypedef::HandleToken(tToken& oToken)
{
  if (m_pElement)
  {
    if (m_pElement->HandleToken(oToken))
    {
      return true;
    }
    else
    {
      m_pSpecification = dynamic_cast<cTypeSpecification*>(m_pElement);
      m_pElement = NULL;
    }
  }
  return false;
}


