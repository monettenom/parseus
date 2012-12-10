#pragma once

#include "tokenizer.h"

struct tTestData
{
  const char* m_strCode[128];
  const int m_nExpectedTokens;
  const bool m_bIgnoreWhitespace;
  const char* m_pNameList[128];
  const int m_pTokenList[128];
  const int m_pTokenTypeList[128];
};

class cTestTokenHandler: public ITokenHandler
{

};