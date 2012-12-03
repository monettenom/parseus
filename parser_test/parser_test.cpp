// codebeau.cpp : Defines the entry point for the console application.
#include "stdafx.h"
#include "cpp_tokenprinter.h"
#include "time.h"

using namespace std;

struct tTestData
{
  const char* m_strCode;
  const int m_nExpectedTokens;
  const bool m_bIgnoreWhitespace;
  const char* m_pNameList[128];
  const int m_pTokenList[128];
  const int m_pTokenTypeList[128];
};

tTestData sTestData[] = 
{
  // types
  {
    "bool char short int long float double wchar_t signed unsigned", 
      10,
      true,
    {""},
    {TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, 
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, -1},
    {KW_TYPE_BOOL, KW_TYPE_CHAR, KW_TYPE_SHORT, KW_TYPE_INT, KW_TYPE_LONG, 
     KW_TYPE_FLOAT, KW_TYPE_DOUBLE, KW_TYPE_WCHAR_T, KW_TYPE_SIGNED, KW_TYPE_UNSIGNED}
  },
  // keywords
  {
    "asm auto break case catch class const const_cast continue default delete do dynamic_cast else enum explicit export "
    "extern false for friend goto if inline mutable namespace new operator private protected public register "
    "reinterpret_cast return sizeof static static_cast struct switch template this throw true try typedef typeid typename "
    "union using virtual void volatile while", 
      53,
      true,
    {""},
    {TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, 
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, 
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, 
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, 
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, 
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, 
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, 
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, -1},
    {KW_ASM, KW_AUTO, KW_BREAK, KW_CASE, KW_CATCH, KW_CLASS, KW_TYPE_CONST, KW_CONST_CAST, KW_CONTINUE,
     KW_DEFAULT, KW_DELETE, KW_DO, KW_DYNAMIC_CAST, KW_ELSE, KW_ENUM, KW_EXPLICIT, KW_EXPORT,
     KW_EXTERN, KW_FALSE, KW_FOR, KW_FRIEND, KW_GOTO, KW_IF, KW_INLINE, KW_MUTABLE, KW_NAMESPACE,
     KW_NEW, KW_OPERATOR, KW_PRIVATE, KW_PROTECTED, KW_PUBLIC, KW_REGISTER, 
     KW_REINTERPRET_CAST, KW_RETURN, KW_SIZEOF, KW_STATIC, KW_STATIC_CAST, KW_STRUCT, KW_SWITCH, KW_TEMPLATE,
     KW_THIS, KW_THROW, KW_TRUE, KW_TRY, KW_TYPEDEF, KW_TYPEID, KW_TYPENAME, 
     KW_UNION, KW_USING, KW_VIRTUAL, KW_TYPE_VOID, KW_VOLATILE, KW_WHILE}
  },
  // keywords C++11
  {
    "alignas alignof char16_t char32_t constexpr decltype noexcept nullptr static_assert thread_local",
    10,
    true,
    {""},
    {TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD,
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD},
    {KW_11_ALIGNAS, KW_11_ALIGNOF, KW_11_CHAR16_T, KW_11_CHAR32_T, KW_11_CONSTEXPR, 
     KW_11_DECLTYPE, KW_11_NOEXCEPT, KW_11_NULLPTR, KW_11_STATIC_ASSERT, KW_11_THREAD_LOCAL}
  },
  {
    "int a = 1;", 
      8,
      false,
    {"", " ", "a", " ", "", " ", "1", ""},
    {TOKEN_KEYWORD, TOKEN_WHITESPACE, TOKEN_LABEL, TOKEN_WHITESPACE, TOKEN_OPERATOR, TOKEN_WHITESPACE, TOKEN_LITERAL, TOKEN_OPERATOR, -1},
    {KW_TYPE_INT, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_ASSIGNMENT, OP_UNKNOWN, OP_UNKNOWN, OP_COMMAND_END}
  },
  {
    "", -1, false, {""}, {-1}, {-1}
  }
};

class cTestCPPTokenizer: public ITokenHandler
{
public:
  cTestCPPTokenizer();
  ~cTestCPPTokenizer();

  int RunTests();
  int GetTestCount(){ return m_nTestCount; }

protected:
  void HandleToken(tToken& oToken);
  void HandleError(const char* strError, int iLine);
  void LogEntry(const char* strLog);
  int GetTokenCount();

  bool Test(tTestData* pTestData);
  void InitTest(tTestData* pTestData);

private:
  cCPPTokenizer m_Tokenizer;
  tTestData* m_pTestData;
  bool m_bResult;
  int m_nTokenCount;
  int m_nTestCount;
};

cTestCPPTokenizer::cTestCPPTokenizer()
: m_Tokenizer(1<<20)
, m_pTestData(NULL)
, m_bResult(false)
, m_nTestCount(0)
, m_nTokenCount(0)
{
  m_Tokenizer.SetTokenHandler(this);
}

cTestCPPTokenizer::~cTestCPPTokenizer()
{

}

void cTestCPPTokenizer::HandleToken(tToken& oToken)
{
  if (!m_bResult)
    return;

  // will be sent every new line if there was a line before
  if (oToken.m_Token == TOKEN_NEWLINE)
    return;

  if (m_pTestData->m_bIgnoreWhitespace && oToken.m_Token == TOKEN_WHITESPACE)
    return;

  if (oToken.m_Token != m_pTestData->m_pTokenList[m_nTokenCount])
  {
    m_bResult = false;
    HandleError("Token mismatch", m_nTokenCount);
  }
  else
  {
    switch(oToken.m_Token)
    {
      case TOKEN_KEYWORD:
      case TOKEN_OPERATOR:
      {
        if (oToken.m_Type != m_pTestData->m_pTokenTypeList[m_nTokenCount])
        {
          m_bResult = false;
          HandleError("keyword or operator expected", m_nTokenCount);
        }
      }
      break;

      case TOKEN_WHITESPACE:
      case TOKEN_LITERAL:
      case TOKEN_LABEL:
      case TOKEN_COMMENT:
      case TOKEN_LINECOMMENT:
      case TOKEN_STRING:
      case TOKEN_NUMBER:
      case TOKEN_MULTILINE_STRING:
      {
        if (strcmp(oToken.m_strName, m_pTestData->m_pNameList[m_nTokenCount]) != 0)
          m_bResult = false;
      }
      break;

      case TOKEN_CHAR:
      case TOKEN_BLOCK_BEGIN:
      case TOKEN_BLOCK_END:
      break;

    }
  }
  m_nTokenCount++;
}

void cTestCPPTokenizer::HandleError(const char* strError, int iLine)
{
  m_bResult = false;
  std::cout << strError << " index " << iLine << std::endl;
}

void cTestCPPTokenizer::LogEntry(const char* strLog)
{
}

int cTestCPPTokenizer::GetTokenCount()
{
  return 0;
}

void cTestCPPTokenizer::InitTest(tTestData* pTestData)
{
  m_nTokenCount = 0;
  m_pTestData = pTestData;
  m_bResult = true;
}

bool cTestCPPTokenizer::Test(tTestData* pTestData)
{
  m_nTestCount++;
  InitTest(pTestData);
  m_Tokenizer.Parse(pTestData->m_strCode); 
  return m_bResult && pTestData->m_nExpectedTokens == m_nTokenCount;
}

int cTestCPPTokenizer::RunTests()
{
  int m_nTestCount = 0;
  int nResult = 0;
  for (int nTestCase = 0; sTestData[nTestCase].m_nExpectedTokens != -1; nTestCase++)
  {
    nResult += Test(&sTestData[nTestCase]) ? 0 : 1;
  }
  return nResult;
}

int main(int argc, char* argv[])
{
  cTestCPPTokenizer tester;
  int nFailed = tester.RunTests(); 
  int nTests = tester.GetTestCount();
  std::cout << nFailed << " of " << nTests << " failed!" << std::endl;

  return 0;
}
