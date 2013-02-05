#include "stdafx.h"
#include "cpp_tokenprinter.h"

using namespace std;

cCPPTokenPrinter::cCPPTokenPrinter()
: m_iTokenCount(0)
{
  m_Tokenizer.SetTokenHandler(this);
}

cCPPTokenPrinter::~cCPPTokenPrinter()
{
}

void cCPPTokenPrinter::Parse(const char* strInFile, const char* strOutFile)
{
  const int MAX_LINE_LEN = 1024;
  char strLine[MAX_LINE_LEN];

  m_Tokenizer.Reset();
  m_iTokenCount = 0;

  std::ifstream fIn;
  fIn.open(strInFile, ios::in);
  m_fOut.open(strOutFile, ios::out|ios::binary);

  while(!fIn.eof())
  {
    fIn.getline(strLine, MAX_LINE_LEN);
    m_Tokenizer.Parse(strLine);
  }
  fIn.close();
  m_fOut.close();
}

bool cCPPTokenPrinter::HandleToken(tToken& oToken)
{
  switch(oToken.m_Token)
  {
    case TOKEN_PREPROC:
      m_fOut << '#';
    case TOKEN_LINECOMMENT:
    case TOKEN_COMMENT: 
    case TOKEN_WHITESPACE:
      m_fOut.write(oToken.m_strName, strlen(oToken.m_strName));
      break;
    case TOKEN_LABEL:
    case TOKEN_LITERAL:
    case TOKEN_STRING:
    case TOKEN_MULTILINE_STRING:
    case TOKEN_CHAR:
      m_fOut << oToken.m_strName;
      break;
    case TOKEN_NEWLINE:
      m_fOut << '\n';
      break;
    case TOKEN_BLOCK_BEGIN:
      m_fOut << '{';
      break;
    case TOKEN_BLOCK_END:
      m_fOut << '}';
      break;
    case TOKEN_OPERATOR:
      m_fOut << m_Tokenizer.GetOperatorString(oToken.m_Type);
      break;
    case TOKEN_KEYWORD:
      m_fOut << m_Tokenizer.GetKeywordString(oToken.m_Type);
      break;
  }
  m_iTokenCount++;
  return true;
}

void cCPPTokenPrinter::HandleError(const char* strError, int iLine)
{
  std::cerr << "ERROR: " << strError << " in line " << iLine << std::endl;
}

void cCPPTokenPrinter::LogEntry(const char* strLog)
{
  //std::cout << strLog << std::endl;
}

int cCPPTokenPrinter::GetTokenCount()
{
  return m_iTokenCount;
}
