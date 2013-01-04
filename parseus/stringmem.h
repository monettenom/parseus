/*
   Author: Rolf Neumann
     File: stringmem.h
     Date: 24.12.2012
  License: see license.txt
  Purpose: Fast memory manager which just pre-allocates memory
           and returns it bit by bit.
*/

#ifndef STRINGMEM_H
#define STRINGMEM_H

const int STRINGMEMBLOCK_SIZE = 64 * 1024;

class cStringMemBlock
{
public:
  cStringMemBlock(int nSize = STRINGMEMBLOCK_SIZE, cStringMemBlock* pNext = NULL);
  ~cStringMemBlock();

  char* Alloc(int nSize);

private:
  char* m_pBlock;
  int m_nCrsr;
  int m_nSize;
  cStringMemBlock* m_pNext;
};

class cStringMem
{
public:
  cStringMem();
  ~cStringMem();

  void Reset();
  char* Alloc(int nSize);

private:
  cStringMemBlock* m_pBlock;
};

#endif //STRINGMEM_H