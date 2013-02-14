#ifndef TESTPREPROCESSOR_H
#define TESTPREPROCESSOR_H

#include "testtokenhandler.h"
#include "preprocessor.h"

class cTestPreprocessor
: public cTestTokenHandler
, public ICodeHandler
{
public:
  cTestPreprocessor();
  ~cTestPreprocessor();

  void HandleCode(char strCode);
  void HandleCode(const char* strCode);
  bool Test(tTestData* pTestData);

protected:
  bool HandleToken(tToken& oToken);

private:
  std::stringstream m_strLine;
  cCPPTokenizer m_Tokenizer;
  cPreProcessor m_Preprocessor;
};

#endif //TESTPREPROCESSOR_H