#include "TestRegistry.h"
#include "Test.h"

namespace CppUnit
{
  TestRegistry* TestRegistry::s_registry = NULL;

  TestRegistry& TestRegistry::getRegistry()
  {
    if(!s_registry)
    {
      s_registry = new TestRegistry();
    }
    return *s_registry;
  }

  void TestRegistry::addTest(std::string name, Test *test)
  {
    m_registry_names.push_back(name);
    m_registry_tests.push_back(test);
  }

  const tTestNames& TestRegistry::getAllTestNames () const
  {
    return(m_registry_names);
  }

  const tTestClasses& TestRegistry::getAllTests() const
  {
    return(m_registry_tests);
  }

  tTestClasses TestRegistry::getTest(const std::string& testCase) const
  {
    tTestClasses res;
    tTestClasses::const_iterator test_it;
    tTestNames::const_iterator name_it;
    for(test_it = m_registry_tests.begin(),
        name_it = m_registry_names.begin();
        test_it != m_registry_tests.end();
        ++test_it, ++name_it)
    {
      if ((*name_it) == testCase)
      {
        res.push_back((*test_it));
        break;
      }
    }
    return(res);
  }

  TestRegistry::~TestRegistry()
  {
    for (tTestClasses::iterator it = m_registry_tests.begin();
         it != m_registry_tests.end();
         ++it)
      delete *it;
  }

  TestRegistry::TestRegistry()
  {
  }
}

