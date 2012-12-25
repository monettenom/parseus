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

class cStringMem
{
public:
    cStringMem(int nSize = 64 * 1024);
    ~cStringMem();

    void Reset();
    char* Alloc(int nSize);

private:
    char* m_pBlock;
    int m_nCrsr;
    int m_nSize;
};

#endif //STRINGMEM_H