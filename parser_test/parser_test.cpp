#include "stdafx.h"
#include "parseus.h"

class cCPPCode
: public ITokenHandler
{
public:
  cCPPCode();
  ~cCPPCode();

  bool HandleToken(tToken& oToken);
  void HandleError(const char* strError, int iLine);
  void LogEntry(const char* strLog);
  int GetTokenCount(){return 0;};

private:
  cLanguageElement* m_pElement;
  std::vector<cLanguageElement*> m_Elements;
};

cCPPCode::cCPPCode()
: m_pElement(NULL)
{
}

cCPPCode::~cCPPCode()
{
}

void cCPPCode::HandleError(const char* strError, int iLine)
{
  LOG("%s: %d", strError, iLine);
}

void cCPPCode::LogEntry(const char* strLog)
{
  LOG(strLog);
}

bool cCPPCode::HandleToken(tToken& oToken)
{
  if (oToken.m_Token == TOKEN_WHITESPACE)
    return true;

  if (m_pElement)
  {
    if (m_pElement->HandleToken(oToken))
    {
      return true;
    }
    else
    {
      m_Elements.push_back(m_pElement);
      m_pElement = NULL;
    }
  }

  m_pElement = cTypeSpecification::IsTypeSpecification(oToken);
  if (m_pElement)
  {
    m_pElement->HandleToken(oToken);
    return true;
  }

  switch(oToken.m_Token)
  {
    case TOKEN_KEYWORD:
    {
      switch(oToken.m_Type)
      {
        case CPP_KW_TYPEDEF:
        {
          m_pElement = new cTypedef;
        }
        break;
      }
    }
    break;
  }
  // extern
  // namespace
  // typedef
  // class
  // (const) void, int, bool, char... (types)
  // enum
  // struct
  // class
  // template
  // __declspec
  // inline, __inline, __forceinline
  // using
  // explicit
  return false;
}










int main(int argc, char* argv[])
{
  cCPPCode cppCode;
  cCPPTokenizer Tokenizer;
  Tokenizer.SetTokenHandler(&cppCode);

  Tokenizer.Parse("const signed int a;");

  //cTestSuite::GetTestSuite()->RunTests();
}
