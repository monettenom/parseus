#ifndef CPPUNIT_TESTREGISTRY_H
#define CPPUNIT_TESTREGISTRY_H


#include <vector>
#include <string>


namespace CppUnit
{
  class Test;

  /** This class is used to register tests and testcases.
   *
   *  It implements a registry to place the test cases into.
   *  The test cases can then register themselves.
   *
   */

  typedef std::vector<std::string> tTestNames;
  typedef std::vector<Test*> tTestClasses;

  class TestRegistry
  {
    public:
      static TestRegistry& getRegistry();

      ~TestRegistry();

      const tTestNames& getAllTestNames() const;
      const tTestClasses& getAllTests() const;
      tTestClasses getTest(const std::string& name) const;
      void addTest(std::string name, Test* test);

    private:
      TestRegistry();

      tTestNames m_registry_names;
      tTestClasses m_registry_tests;
      static TestRegistry* s_registry;
  };
} // namespace CppUnit

#endif // CPPUNIT_TESTREGISTRY_H

