#include "stdafx.h"

cStringMemBlock::cStringMemBlock(int nSize, cStringMemBlock* pNext)
: m_nSize(nSize) 
, m_nCrsr(0)
, m_pBlock(NULL)
, m_pNext(pNext)
{
  LOG("Initial allocated: %d", nSize);
  m_pBlock = new char[nSize];
  memset(m_pBlock, 0, nSize);
}

cStringMemBlock::~cStringMemBlock()
{
  delete m_pNext;
  m_pNext = NULL;
  delete m_pBlock;
  m_pBlock = NULL;
}

char* cStringMemBlock::Alloc(int nSize)
{
  if (m_nCrsr + nSize > m_nSize)
  {
    return NULL;
  }

  char* pResult = m_pBlock + m_nCrsr;
  m_nCrsr += nSize;
  return pResult;
}

cStringMem::cStringMem()
: m_pBlock(NULL)
{
  m_pBlock = new cStringMemBlock(STRINGMEMBLOCK_SIZE);
}

cStringMem::~cStringMem()
{
  delete m_pBlock;
  m_pBlock = NULL;
}

void cStringMem::Reset()
{
  delete m_pBlock;
  m_pBlock = new cStringMemBlock(STRINGMEMBLOCK_SIZE);
}

char* cStringMem::Alloc(int nSize)
{
  char* pResult = m_pBlock->Alloc(nSize);
  if (pResult == NULL)
  {
    LOG("More memory allocated: %d", STRINGMEMBLOCK_SIZE);
    m_pBlock = new cStringMemBlock(STRINGMEMBLOCK_SIZE, m_pBlock);
    pResult = m_pBlock->Alloc(nSize);
  }
  return pResult;
}
