// codebeau.cpp : Defines the entry point for the console application.
#include "stdafx.h"
#include "cpp_tokenprinter.h"
#include "time.h"
#include <sstream>

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
    "alignas alignof char16_t char32_t constexpr decltype noexcept final nullptr override static_assert thread_local",
    12,
    true,
    {""},
    {TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD,
    TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD},
    {KW_11_ALIGNAS, KW_11_ALIGNOF, KW_11_CHAR16_T, KW_11_CHAR32_T, KW_11_CONSTEXPR, KW_11_DECLTYPE, 
     KW_11_NOEXCEPT, KW_11_FINAL, KW_11_NULLPTR, KW_11_OVERRIDE, KW_11_STATIC_ASSERT, KW_11_THREAD_LOCAL}
  },
  // assignment operators
  {
    "= += -= *= /= %= &= |= ^= <<= >>=",
    11,
    true,
    {""},
    {TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR},
    {OP_ASSIGNMENT, OP_SUM_ASSIGNMENT, OP_DIFFERENCE_ASSIGNMENT, OP_PRODUCT_ASSIGNMENT, OP_QUOTIENT_ASSIGNMENT,
     OP_REMAINDER_ASSIGNMENT, OP_AND_ASSIGNMENT, OP_OR_ASSIGNMENT, OP_XOR_ASSIGNMENT, OP_SHIFT_LEFT_ASSIGNMENT,
     OP_SHIFT_RIGHT_ASSIGNMENT
    }
  },
  // arithmetic operators
  {
    "+ - * / % ~ & | ^ << >> ++ --",
    13,
    true,
    {""},
    {TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR,
    TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR},
    {OP_ADDITION, OP_SUBTRACTION, OP_ASTERISK, OP_DIVIDE, OP_MODULUS, OP_COMPLEMENT, OP_BITWISE_AND, 
     OP_BITWISE_OR, OP_BITWISE_XOR, OP_SHIFT_LEFT, OP_SHIFT_RIGHT, OP_INCREMENT, OP_DECREMENT}
  },
  // logical and comparison operators
  {
    "! && || == != < > <= >=",
    9,
    true,
    {""},
    {TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, 
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR},
    {OP_LOGICAL_NOT, OP_LOGICAL_AND, OP_LOGICAL_OR, OP_EQUAL, OP_NOT_EQUAL, 
     OP_SMALLER, OP_BIGGER, OP_SMALLER_OR_EQUAL, OP_BIGGER_OR_EQUAL}
  },
  // member access operators
  {
    "[] -> . ->* .* ::",
    7,
    true,
    {""},
    {TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, 
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR},
    {OP_INDEX_OPEN, OP_INDEX_CLOSE, OP_POINTER, OP_MEMBER_ACCESS, 
     OP_POINTER_DEREFERNCE, OP_MEMBER_ACCESS_DEREFERENCE, OP_SCOPE}
  },
  // misc operators
  {
    "?: ... , (){}",
    8, 
    true,
    {""},
    {TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_BLOCK_BEGIN, TOKEN_BLOCK_END},
    {OP_CONDITIONAL, OP_COLON, OP_ELLIPSIS, OP_LIST, OP_BRACKET_OPEN, OP_BRACKET_CLOSE, OP_UNKNOWN, OP_UNKNOWN}
  },
  // alternative operators
  {
    "and and_eq bitand bitor compl not not_eq or or_eq xor xor_eq",
    11,
    true,
    {""},
    //TODO: Token should be better TOKEN_OPERATOR
    {TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD,
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD},
    {OP_LOGICAL_AND, OP_AND_ASSIGNMENT, OP_BITWISE_AND, OP_BITWISE_OR, OP_COMPLEMENT, OP_LOGICAL_NOT,
     OP_NOT_EQUAL, OP_LOGICAL_OR, OP_OR_ASSIGNMENT, OP_BITWISE_XOR, OP_XOR_ASSIGNMENT}
  },
  // integer literals with type suffix
  {
    "1 2l 3u 4ul 5ll 6ull 2L 3U 4UL 5LL 6ULL",
    11,
    true,
    {"1", "2l", "3u", "4ul", "5ll", "6ull", "2L", "3U", "4UL", "5LL", "6ULL"},
    {TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL,
     TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL},
    {OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, 
     OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN}
  },
  // octal and hexadecimal
  {
    "01 -07 0x1 0xabcd 0xFEDCBA",
    6,
    true,
    {"01", "", "07", "0x1", "0xabcd", "0xFEDCBA"},
    {TOKEN_LITERAL, TOKEN_OPERATOR, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL},
    {OP_UNKNOWN, OP_SUBTRACTION, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN}
  },
  // floating point numbers
  {
    "1.23456e-65 .1E4f 58. 4e2 1.6e-19 6.02e23f 3.14159L",
    7,
    true,
    {"1.23456e-65", ".1E4f", "58.", "4e2", "1.6e-19", "6.02e23f", "3.14159L"},
    {TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL},
    {OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN}
  },
  // string literals
  {
    "\"test\" \"two\nlines\" L\"wide chars\"",
    3,
    true,
    {"\"test\"", "\"two\nlines\"", "L\"wide chars\""},
    {TOKEN_STRING, TOKEN_STRING, TOKEN_STRING},
    {OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN}
  },
  // character literals
  {
    "'a''b''\n' '\x20'",
    4,
    true,
    {"'a'", "'b'", "'\n'", "'\x20'"},
    {TOKEN_CHAR, TOKEN_CHAR, TOKEN_CHAR, TOKEN_CHAR},
    {OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN}
  },
  // preprocessor
  {
    "#define xyz(a) fc(a)",
    1,
    true,
    {"define xyz(a) fc(a)"},
    {TOKEN_PREPROC},
    {OP_UNKNOWN}
  },
  // digraphs
  {
    "<% %> <: :> %:define x y",
    5,
    true,
    {"", "", "", "", "define x y"},
    {TOKEN_BLOCK_BEGIN, TOKEN_BLOCK_END, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_PREPROC},
    {OP_UNKNOWN, OP_UNKNOWN, OP_INDEX_OPEN, OP_INDEX_CLOSE, OP_UNKNOWN}
  },
  // trigraphs
  {
    "??< ??> ??( ??) ??' ??! ??- ??=", // '??/' is equivalent to \ and must be handled like this
    8,
    true,
    {"", "", "", "", "", "", "", ""},
    {TOKEN_BLOCK_BEGIN, TOKEN_BLOCK_END, TOKEN_OPERATOR, TOKEN_OPERATOR, 
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_PREPROC},
    {OP_UNKNOWN, OP_UNKNOWN, OP_INDEX_OPEN, OP_INDEX_CLOSE, 
     OP_BITWISE_XOR, OP_BITWISE_OR, OP_COMPLEMENT, OP_UNKNOWN}
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
    stringstream strMessage;
    strMessage << "Token mismatch! Expected: " << m_Tokenizer.GetTokenString(m_pTestData->m_pTokenList[m_nTokenCount]) << 
                                   " result: " << m_Tokenizer.GetTokenString(oToken.m_Token);
    HandleError(strMessage.str().c_str(), m_nTokenCount);
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

      case TOKEN_PREPROC:
      case TOKEN_WHITESPACE:
      case TOKEN_LITERAL:
      case TOKEN_LABEL:
      case TOKEN_COMMENT:
      case TOKEN_LINECOMMENT:
      case TOKEN_STRING:
      case TOKEN_CHAR:
      case TOKEN_NUMBER:
      case TOKEN_MULTILINE_STRING:
      {
        if (strcmp(oToken.m_strName, m_pTestData->m_pNameList[m_nTokenCount]) != 0)
        {
          stringstream strMessage;
          strMessage << "expected: \"" << m_pTestData->m_pNameList[m_nTokenCount] << "\", result: \"" << oToken.m_strName << "\"";
          HandleError(strMessage.str().c_str(), m_nTokenCount);
          m_bResult = false;
        }
      }
      break;

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
  std::cout << strLog << std::endl;
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
  int nTokenCount = 0;
  int nResult = 0;
  for (int nTestCase = 0; sTestData[nTestCase].m_nExpectedTokens != -1; nTestCase++)
  {
    std::stringstream strLog;
    strLog << "Running test case " << (nTestCase + 1);
    LogEntry(strLog.str().c_str());
    nResult += Test(&sTestData[nTestCase]) ? 0 : 1;
    nTokenCount += sTestData[nTestCase].m_nExpectedTokens;
  }

  std::stringstream strLog;
  strLog << "Tokens checked: " << nTokenCount;
  LogEntry(strLog.str().c_str());

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
