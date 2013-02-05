#ifndef TESTPHPTOKENHANDLER_H
#define TESTPHPTOKENHANDLER_H

#include "testtokenhandler.h"

class cTestPhpTokenHandler: public cTestTokenHandler
{
public:
  cTestPhpTokenHandler();
  ~cTestPhpTokenHandler();

protected:
  bool HandleToken(tToken& oToken);

private:
  cPHPTokenizer m_Tokenizer;
};

#endif //TESTPHPTOKENHANDLER_H