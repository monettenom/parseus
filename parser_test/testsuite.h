#ifndef TESTSUITE_H
#define TESTSUITE_H

#include <vector>

#define REGISTER_TEST(TestClass) cTestClassRegistrator<TestClass> _registrator;

template<class T>
class cTestClassRegistrator
{
public:
  cTestClassRegistrator()
  : pTester(new T)
  {
    cTestSuite::GetTestSuite()->AddTest(pTester);
  }
  ~cTestClassRegistrator()
  {
    delete pTester;
    pTester = NULL;
  }
private:
  T* pTester;
};

class ITester
{
public:
  virtual int RunTests() = 0;
  virtual int GetTestCount() = 0;
};

class cTestSuite
{
  public:
    cTestSuite();
    virtual ~cTestSuite();

    void AddTest(ITester* pTester);
    void RunTests();

    static cTestSuite* cTestSuite::GetTestSuite();

  private:
    std::vector<ITester*> m_Tests;
};

#endif //TESTSUITE_H