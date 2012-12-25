#ifndef TESTPASTOKENHANDLER_H
#define TESTPASTOKENHANDLER_H

#include "testtokenhandler.h"

class cTestPasTokenHandler: public cTestTokenHandler
{
public:
  cTestPasTokenHandler();
  ~cTestPasTokenHandler();

protected:
  void HandleToken(tToken& oToken);

private:
  cPasTokenizer m_Tokenizer;
};

#endif //TESTPASTOKENHANDLER_H