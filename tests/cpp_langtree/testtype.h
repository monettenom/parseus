#ifndef TEST_TYPE_H
#define TEST_TYPE_H

DECLARE_TEST_SUITE_START(Type);
  DECLARE_TEST_SETUP;
  DECLARE_TEST_TEARDOWN;
  DECLARE_TEST_CASE(TypeQualifierConst);
  DECLARE_TEST_CASE(TypeQualifierVolatile);
  DECLARE_TEST_CASE(TypeQualifierConstVolatile);
  DECLARE_TEST_CASE(TypeQualifierVolatileConst);
  DECLARE_TEST_CASE(TypeQualifierNoMatch);
DECLARE_TEST_SUITE_END;

#endif // TEST_TYPE_H
