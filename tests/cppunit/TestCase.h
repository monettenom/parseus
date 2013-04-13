#ifndef CPPUNIT_TESTCASE_H
#define CPPUNIT_TESTCASE_H

#include <string>

#include "Test.h"
#include "Exception.h"

namespace CppUnit
{
  class TestSuite;
  class TestResult;

  /**
   * A test case defines the fixture to run multiple tests. To define a test case
   * do the following:
   * - implement a subclass of TestCase 
   * - define instance variables that store the state of the fixture
   * - initialize the fixture state by overriding setUp
   * - clean-up after a test by overriding tearDown.
   *
   * Each test runs in its own fixture so there
   * can be no side effects among test runs.
   * Here is an example:
   * 
   * \code
   * class MathTest : public TestCase {
   *     protected: int m_value1;
   *     protected: int m_value2;
   *
   *     public: MathTest (string name)
   *                 : TestCase (name) {
   *     }
   *
   *     protected: void setUp () {
   *         m_value1 = 2;
   *         m_value2 = 3;
   *     }
   * }
   * \endcode
   *
   * For each test implement a method which interacts
   * with the fixture. Verify the expected results with assertions specified
   * by calling assert on the expression you want to test:
   * 
   * \code
   *    protected: void testAdd () {
   *        int result = value1 + value2;
   *        assert (result == 5);
   *    }
   * \endcode
   * 
   * Once the methods are defined you can run them. To do this, use
   * a TestCaller.
   *
   * \code
   * Test *test = new TestCaller<MathTest>("testAdd", MathTest::testAdd);
   * test->run ();
   * \endcode
   *
   *
   * The tests to be run can be collected into a TestSuite. CppUnit provides
   * different test runners which can run a test suite and collect the results.
   * The test runners expect a static method suite as the entry
   * point to get a test to run.
   * 
   * \code
   * public: static MathTest::suite () {
   *      TestSuite *suiteOfTests = new TestSuite;
   *      suiteOfTests->addTest(new TestCaller<MathTest>(
   *                              "testAdd", testAdd));
   *      suiteOfTests->addTest(new TestCaller<MathTest>(
   *                              "testDivideByZero", testDivideByZero));
   *      return suiteOfTests;
   *  }
   * \endcode
   * 
   * Note that the caller of suite assumes lifetime control
   * for the returned suite.
   *
   * \see TestResult
   * \see TestSuite 
   * \see TestCaller
   *
   */

  class TestCase
  : public Test
  {
    public:
      TestCase(std::string Name);
      ~TestCase();

      virtual void run(TestResult *result);
      virtual void run();
      virtual int countTestCases();
      std::string getName() const;
      std::string toString() const;
      TestSuite* suite();

      virtual void setUpSuite();
      virtual void tearDownSuite();
      virtual void setUpTest();
      virtual void tearDownTest();

    protected:
      virtual void RegisterTests(TestSuite* pSuite);
      virtual void runTest(TestResult* result);

      TestResult *defaultResult();

      static void assertImplementation(
        bool condition,
        std::string conditionExpression = "",
        long lineNumber = Exception::UNKNOWNLINENUMBER,
        std::string fileName = Exception::UNKNOWNFILENAME);

      static void assertEquals(
        long expected,
        long actual,
        long lineNumber = Exception::UNKNOWNLINENUMBER,
        std::string fileName = Exception::UNKNOWNFILENAME);

      static void assertEquals(
        double expected,
        double actual,
        double delta = 0.0000001,
        long lineNumber = Exception::UNKNOWNLINENUMBER,
        std::string fileName = Exception::UNKNOWNFILENAME);

      static void assertPointerNull(
        void* pointer,
        long lineNumber = Exception::UNKNOWNLINENUMBER,
        std::string fileName = Exception::UNKNOWNFILENAME);

      static void assertPointerNotNull(
        void* pointer,
        long lineNumber = Exception::UNKNOWNLINENUMBER,
        std::string fileName = Exception::UNKNOWNFILENAME);

      static void fail(
        std::string message,
        long lineNumber = Exception::UNKNOWNLINENUMBER,
        std::string fileName = Exception::UNKNOWNFILENAME);

      static std::string notEqualsMessage(
        long expected,
        long actual);

      static std::string notEqualsMessage(
        double expected,
        double actual);
    
    private:
      TestCase(const TestCase& other);
      TestCase& operator= (const TestCase& other);

    private:
      const std::string m_name;
      TestSuite* m_pSuite;
  };


} // namespace CppUnit

#endif // CPPUNIT_TESTCASE_H 
