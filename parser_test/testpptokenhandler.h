#ifndef TESTPPTOKENHANDLER_H
#define TESTPPTOKENHANDLER_H

#include "testtokenhandler.h"

class cTestPPTokenHandler: public cTestTokenHandler
{
public:
  cTestPPTokenHandler();
  ~cTestPPTokenHandler();

protected:
  void HandleToken(tToken& oToken);

private:
  cPPTokenizer m_Tokenizer;
};

#endif //TESTPPTOKENHANDLER_H