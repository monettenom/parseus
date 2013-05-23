#include "cppunit.h"

#include <vector>
#include <iostream>

using namespace CppUnit;

int main(int argc, char** argv)
{
  TextTestResult res;

  std::vector<Test*> tests = TestRegistry::getRegistry().getAllTests();

  for(std::vector<Test*>::iterator it = tests.begin(); it != tests.end(); ++it)
  {
    std::cout  << std::endl << "Running " << (*it)->toString();

    (*it)->run(&res);
  }

  std::cout << res << std::endl;
  
  return 0;
}
