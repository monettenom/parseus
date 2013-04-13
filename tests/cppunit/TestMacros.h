#ifndef CPPUNIT_TEST_MACROS_H
#define CPPUNIT_TEST_MACROS_H

#define TEST_SUITE_CLASS(suite_name) cTest##suite_name
#define TEST_METHOD(test_name) test##test_name

// macros for header
#define DECLARE_TEST_SUITE_START(suite_name)\
class TEST_SUITE_CLASS(suite_name)\
  : public CppUnit::TestCase\
    {\
    public:\
    TEST_SUITE_CLASS(suite_name)(std::string strName);\
    ~TEST_SUITE_CLASS(suite_name)();\
    void RegisterTests(CppUnit::TestSuite* pSuite)

#define DECLARE_TEST_SUITE_END };

#define DECLARE_TEST_CASE(test_name)\
  static void TEST_METHOD(test_name)()

#define DECLARE_SETUP_SUITE void setUpSuite()
#define DECLARE_TEARDOWN_SUITE void tearDownSuite()
#define DECLARE_SETUP_TEST void setUpTest()
#define DECLARE_TEARDOWN_TEST void tearDownTest()

// macros for implementation

#define IMPLEMENT_TEST_SUITE_START(suite_name)\
  using namespace CppUnit;\
  static TEST_SUITE_CLASS(suite_name) test##suite_name(#suite_name);\
  TEST_SUITE_CLASS(suite_name)::TEST_SUITE_CLASS(suite_name)(std::string strName)\
  : TestCase(strName)\
  {\
  setUpSuite();\
  }\
  TEST_SUITE_CLASS(suite_name)::~TEST_SUITE_CLASS(suite_name)()\
  {\
  tearDownSuite();\
  }\
  void TEST_SUITE_CLASS(suite_name)::RegisterTests(TestSuite* pSuite)\
  {

#define IMPLEMENT_TEST_SUITE_END }

#define REGISTER_TEST(test_name) pSuite->addTest(new TestCaller<cTestScope>(#test_name, &TEST_METHOD(test_name)))

#define IMPLEMENT_SETUP_SUITE(suite_name) void TEST_SUITE_CLASS(suite_name)::setUpSuite()
#define IMPLEMENT_TEARDOWN_SUITE(suite_name) void TEST_SUITE_CLASS(suite_name)::tearDownSuite()
#define IMPLEMENT_SETUP_TEST(suite_name) void TEST_SUITE_CLASS(suite_name)::setUpTest()
#define IMPLEMENT_TEARDOWN_TEST(suite_name) void TEST_SUITE_CLASS(suite_name)::tearDownTest()

#define IMPLEMENT_TEST_CASE(suite_name, test_name) void TEST_SUITE_CLASS(suite_name)::TEST_METHOD(test_name)()

// test macros

#define TEST(condition)\
  assertImplementation(condition, #condition, __LINE__, __FILE__)

#define TEST_EQUALS(expected, actual)\
  assertEquals(expected, actual, __LINE__, __FILE__)

#define TEST_NULL(pointer)\
  assertPointerNull(pointer, __LINE__, __FILE__)

#define TEST_NOT_NULL(pointer)\
  assertPointerNotNull(pointer, __LINE__, __FILE__)

#define TEST_FAIL(message)\
  fail(message, __LINE__, __FILE__)

#endif // CPPUNIT_TEST_MACROS_H

