#include "cppunit.h"

#include <typeinfo>
#include <stdexcept>
#include <cmath>
#include <iostream>

namespace CppUnit
{
  /// Create a default TestResult
  TestResult* TestCase::defaultResult()
  {
    return new TestResult;
  }

  /// Check for a failed general assertion 
  void TestCase::assertImplementation(
    bool condition,
    std::string conditionExpression,
    long lineNumber,
    std::string fileName)
  {
    if (!condition)
      throw Exception (conditionExpression, lineNumber, fileName);
  }

  /// Check for a failed equality assertion 
  void TestCase::assertEquals(
    long expected,
    long actual,
    long lineNumber,
    std::string fileName)
  {
    if (expected != actual) 
      assertImplementation (false, notEqualsMessage(expected, actual), lineNumber, fileName); 
  }

  /// Check for a failed equality assertion 
  void TestCase::assertEquals(
    void* expected,
    void* actual,
    long lineNumber,
    std::string fileName)
  {
    if (expected != actual) 
      throw Exception ("pointer not equal", lineNumber, fileName);
  }

  /// Check for a failed equality assertion 
  void TestCase::assertEquals(
    std::string expected,
    std::string actual,
    long lineNumber,
    std::string fileName)
  {
    if (expected != actual) 
      throw Exception ("strings not equal", lineNumber, fileName);
  }

  /// Check for a failed equality assertion
  void TestCase::assertEquals(
    double expected,
    double actual,
    double delta,
    long lineNumber,
    std::string fileName)
  {
    if (fabs (expected - actual) > delta)
      assertImplementation (false, notEqualsMessage(expected, actual), lineNumber, fileName);
  }

  void TestCase::assertPointerNull(
    void* pointer,
    long lineNumber,
    std::string fileName)
  {
    if (pointer != NULL)
      throw Exception ("pointer is not null", lineNumber, fileName);
  }

  void TestCase::assertPointerNotNull(
    void* pointer,
    long lineNumber,
    std::string fileName)
  {
    if (pointer = NULL)
      throw Exception ("pointer is null", lineNumber, fileName);
  }

  void TestCase::fail(
    std::string message,
    long lineNumber,
    std::string fileName)
  {
    throw Exception (message, lineNumber, fileName);
  }

  /// Run the test and catch any exceptions that are triggered by it 
  void TestCase::run(TestResult *result)
  {
    setUpSuite();

    try
    {
      runTest(result);
    }
    catch(Exception e)
    {
      Exception *copy = new Exception (e);
      result->addFailure(this, copy);
    }
    catch(std::exception e)
    {
      result->addError(this, new Exception(e.what()));
    }
    catch (...)
    {
      Exception *e = new Exception("unknown exception");
      result->addError(this, e);
    }

    tearDownSuite();
  }

  /// A default run method 
  void TestCase::run()
  {
  }

  /// All the work for runTest is deferred to subclasses 
  void TestCase::runTest(TestResult* result)
  {
    TestSuite* pSuite = suite();
    if (pSuite)
    {
      pSuite->run(result);
    }
  }

  /// Build a message about a failed equality check 
  std::string TestCase::notEqualsMessage(long expected, long actual)
  {
    return "expected: " + estring (expected) + " but was: " + estring (actual); 
  }

  /// Build a message about a failed equality check 
  std::string TestCase::notEqualsMessage (double expected, double actual)
  {
    return "expected: " + estring (expected) + " but was: " + estring (actual); 
  }

  /// Constructs a test case
  TestCase::TestCase(std::string name)
  : m_name (name)
  , m_pSuite(NULL)
  {
    if(m_name == "")
      return;

    TestRegistry::getRegistry().addTest(m_name, this);
  }

  /// Destructs a test case
  TestCase::~TestCase()
  {
    delete m_pSuite;
    m_pSuite = NULL;
  }

  void TestCase::RegisterTests(TestSuite* pSuite)
  {
  }

  /// Returns a count of all the tests executed
  int TestCase::countTestCases()
  {
    return 1;
  }

  /// Returns the name of the test case
  std::string TestCase::getName() const
  {
    return m_name;
  }

  /// A hook for fixture set up
  void TestCase::setUpTest()
  {
  }

  /// A hook for fixture tear down
  void TestCase::tearDownTest()
  {
  }

  /// A hook for suite set up
  void TestCase::setUpSuite()
  {
  }

  /// A hook for suite tear down
  void TestCase::tearDownSuite()
  {
  }

  /// Returns the name of the test case instance
  std::string TestCase::toString() const
  {
    const type_info& thisClass = typeid(*this);
    return std::string(thisClass.name());
  }

  TestSuite* TestCase::suite()
  {
    if (!m_pSuite)
    {
      m_pSuite = new TestSuite;
      RegisterTests(m_pSuite);
    }
    return m_pSuite;
  }

}
