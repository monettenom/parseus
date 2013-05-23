#include "cppunit.h"
#include "testtype.h"
#include "cpp_langtreelib.h"

IMPLEMENT_TEST_SUITE_START(Type);
REGISTER_TEST_CASE(Type, TypeQualifierConst);
REGISTER_TEST_CASE(Type, TypeQualifierVolatile);
REGISTER_TEST_CASE(Type, TypeQualifierConstVolatile);
REGISTER_TEST_CASE(Type, TypeQualifierVolatileConst);
REGISTER_TEST_CASE(Type, TypeQualifierNoMatch);
IMPLEMENT_TEST_SUITE_END;

IMPLEMENT_TEST_SETUP(Type)
{
}

IMPLEMENT_TEST_TEARDOWN(Type)
{
}

IMPLEMENT_TEST_CASE(Type, TypeQualifierConst)
{
  tToken oToken(TOKEN_KEYWORD, CPP_KW_TYPE_CONST);
  cTypeQualifier* pTypeQualifier = new cTypeQualifier;

  TEST_EQUALS(cTypeQualifier::TYPE_UNKNOWN, pTypeQualifier->GetType());
  TEST(pTypeQualifier->HandleToken(oToken));
  TEST_EQUALS(cTypeQualifier::TYPE_CONST, pTypeQualifier->GetType());

  delete pTypeQualifier;
}

IMPLEMENT_TEST_CASE(Type, TypeQualifierVolatile)
{
  tToken oToken(TOKEN_KEYWORD, CPP_KW_VOLATILE);
  cTypeQualifier* pTypeQualifier = new cTypeQualifier;

  TEST_EQUALS(cTypeQualifier::TYPE_UNKNOWN, pTypeQualifier->GetType());
  TEST(pTypeQualifier->HandleToken(oToken));
  TEST_EQUALS(cTypeQualifier::TYPE_VOLATILE, pTypeQualifier->GetType());

  delete pTypeQualifier;
}

IMPLEMENT_TEST_CASE(Type, TypeQualifierConstVolatile)
{
  tToken oToken(TOKEN_KEYWORD, CPP_KW_TYPE_CONST);
  cTypeQualifier* pTypeQualifier = new cTypeQualifier;

  TEST_EQUALS(cTypeQualifier::TYPE_UNKNOWN, pTypeQualifier->GetType());
  TEST(pTypeQualifier->HandleToken(oToken));
  TEST_EQUALS(cTypeQualifier::TYPE_CONST, pTypeQualifier->GetType());

  oToken = tToken(TOKEN_KEYWORD, CPP_KW_VOLATILE);
  TEST(pTypeQualifier->HandleToken(oToken));
  TEST_EQUALS(cTypeQualifier::TYPE_CONST_VOLATILE, pTypeQualifier->GetType());

  delete pTypeQualifier;
}

IMPLEMENT_TEST_CASE(Type, TypeQualifierVolatileConst)
{
  tToken oToken(TOKEN_KEYWORD, CPP_KW_VOLATILE);
  cTypeQualifier* pTypeQualifier = new cTypeQualifier;

  TEST_EQUALS(cTypeQualifier::TYPE_UNKNOWN, pTypeQualifier->GetType());
  TEST(pTypeQualifier->HandleToken(oToken));
  TEST_EQUALS(cTypeQualifier::TYPE_VOLATILE, pTypeQualifier->GetType());

  oToken = tToken(TOKEN_KEYWORD, CPP_KW_TYPE_CONST);
  TEST(pTypeQualifier->HandleToken(oToken));
  TEST_EQUALS(cTypeQualifier::TYPE_CONST_VOLATILE, pTypeQualifier->GetType());

  delete pTypeQualifier;
}

IMPLEMENT_TEST_CASE(Type, TypeQualifierNoMatch)
{
  tToken oToken(TOKEN_KEYWORD, CPP_KW_TYPE_INT);
  cTypeQualifier* pTypeQualifier = new cTypeQualifier;

  TEST_EQUALS(cTypeQualifier::TYPE_UNKNOWN, pTypeQualifier->GetType());
  TEST(!pTypeQualifier->HandleToken(oToken));
  TEST_EQUALS(cTypeQualifier::TYPE_UNKNOWN, pTypeQualifier->GetType());

  delete pTypeQualifier;
}


