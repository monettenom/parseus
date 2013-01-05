#ifndef TESTSTRINGMEM_H
#define TESTSTRINGMEM_H

class cTestStringMem: public ITester
{
public:
  cTestStringMem();
  virtual ~cTestStringMem();

  int RunTests();
  int GetTestCount();
};

#endif // TESTSTRINGMEM_H