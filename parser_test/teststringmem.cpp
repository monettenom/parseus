#include "stdafx.h"
#include "teststringmem.h"

cTestStringMem::cTestStringMem()
{
}

cTestStringMem::~cTestStringMem()
{
}

int cTestStringMem::GetTestCount()
{
  return 1;
}

int cTestStringMem::RunTests()
{
  cStringMem oStringMem;

  for (int i = 0; i < STRINGMEMBLOCK_SIZE; i++)
  {
    char* strBuffer = oStringMem.Alloc(4);
    if (strBuffer == NULL)
      return 1;
  }

  oStringMem.Reset();

  for (int i = 0; i < STRINGMEMBLOCK_SIZE; i++)
  {
    char* strBuffer = oStringMem.Alloc(4);
    if (strBuffer == NULL)
      return 1;
  }

  return 0;
}
