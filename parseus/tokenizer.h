#pragma once

struct tKeyword
{
    const char* m_strKeyword;
    int m_Type;
};

struct tToken
{
    int m_Token;

    union
    {
        char* m_strName;
        int m_Type;
        char m_cChar;
    };

    bool m_bIsCopy;
    bool m_bNameSet;

    tToken();
    tToken(const tToken& token);
    ~tToken();

    void SetName(const char* strName);
    void SetName(const char* strName, int iLen);
    tToken& operator=(const tToken& token);

    static void SetStringMem(cStringMem* pStringMem);
    static cStringMem* s_pStringMem;
};

class ITokenizer
{
public:
    virtual const char* GetKeywordString(int nKeyword) = 0;
    virtual const char* GetOperatorString(int type) = 0;
    virtual void Reset() = 0;
};

class ITokenHandler
{
public:
    virtual void HandleToken(tToken& oToken) = 0;
    virtual void HandleError(const char* strError, int iLine) = 0;
    virtual void LogEntry(const char* strLog) = 0;
    virtual int GetTokenCount() = 0;
};

