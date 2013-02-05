#pragma once

class cCPPTokenPrinter: public ITokenHandler
{
public:
    cCPPTokenPrinter();
    ~cCPPTokenPrinter();

    bool HandleToken(tToken& oToken);
    void HandleError(const char* strError, int iLine);
    void LogEntry(const char* strLog);
    void Parse(const char* strInFile, const char* strOutFile);
    int GetTokenCount();

private:
    cCPPTokenizer m_Tokenizer;
    std::ofstream m_fOut;
    int m_iTokenCount;
};