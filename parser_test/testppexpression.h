#ifndef TESTPPEXPRESSION_H
#define TESTPPEXPRESSION_H

#include "testtokenhandler.h"
#include "ppexpression.h"

class cTestPPExpression: public cTestTokenHandler, IMacroMap
{
public:
  cTestPPExpression();
  ~cTestPPExpression();

protected:
  void HandleToken(tToken& oToken);

  bool IsDefined(const char* strMacro);
  cPreprocessorMacro* GetMacro(const char* strMacro);

private:
  cPreprocessorExpression* m_pExpression;
  cPPTokenizer m_Tokenizer;
};

#endif //TESTPPEXPRESSION_H