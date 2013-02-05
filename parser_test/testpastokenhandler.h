#ifndef TESTPASTOKENHANDLER_H
#define TESTPASTOKENHANDLER_H

#include "testtokenhandler.h"

class cTestPasTokenHandler: public cTestTokenHandler
{
public:
  cTestPasTokenHandler();
  ~cTestPasTokenHandler();

protected:
  bool HandleToken(tToken& oToken);

private:
  cPasTokenizer m_Tokenizer;
};

#endif //TESTPASTOKENHANDLER_H