#include "stdafx.h"

cStringMem::cStringMem(int nSize)
: m_nSize(nSize) 
, m_nCrsr(0)
, m_pBlock(NULL)
{
    m_pBlock = new char[nSize];
    memset(m_pBlock, 0, nSize);
}

cStringMem::~cStringMem()
{
    delete[] m_pBlock;
    m_pBlock = NULL;
}

void cStringMem::Reset()
{
    m_nCrsr = 0;
}

char* cStringMem::Alloc(int nSize)
{
    if (m_nCrsr + nSize > m_nSize)
    {
        std::cerr << "Out of String Buffer Memory!" << std::endl;
        return NULL;
    }

    char* pResult = m_pBlock + m_nCrsr;
    m_nCrsr += nSize;
    return pResult;
}

