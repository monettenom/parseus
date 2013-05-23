#include "TestSuite.h"
#include "TestResult.h"

namespace CppUnit
{
  /// Deletes all tests in the suite.
  void TestSuite::deleteContents()
  {
    for (std::vector<TestCase*>::iterator it = m_tests.begin ();
         it != m_tests.end();
         ++it)
      delete *it;
  }

  /// Runs the tests and collects their result in a TestResult.
  void TestSuite::run(TestResult *result)
  {
    for (std::vector<TestCase*>::iterator it = m_tests.begin();
         it != m_tests.end();
         ++it)
    {
      if (result->shouldStop())
        break;

      result->startTest(this);

      TestCase *test = *it;
      test->setUpTest();
      test->run();
      test->tearDownTest();

      result->endTest(this);
    }
  }

  /// Counts the number of test cases that will be run by this test.
  int TestSuite::countTestCases()
  {
    int count = 0;

    for (std::vector<TestCase*>::iterator it = m_tests.begin ();
         it != m_tests.end ();
         ++it)
      count += (*it)->countTestCases ();

    return count;
  }

  /// Default constructor
  TestSuite::TestSuite(std::string name)
  : m_name (name)
  {
  }

  /// Destructor
  TestSuite::~TestSuite()
  {
    deleteContents();
  }

  /// Adds a test to the suite. 
  void TestSuite::addTest(TestCase* test)
  {
    m_tests.push_back(test);
  }

  /// Returns a string representation of the test suite.
  std::string TestSuite::toString() const
  {
    return "suite " + getName();
  }

  /// Returns the name of the test suite.
  std::string TestSuite::getName() const
  {
    return m_name; 
  }
}
