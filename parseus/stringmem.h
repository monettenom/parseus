#pragma once

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