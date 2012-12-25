#ifndef TESTCPPTOKENHANDLER_H
#define TESTCPPTOKENHANDLER_H

#include "testtokenhandler.h"

class cTestCPPTokenHandler: public cTestTokenHandler
{
public:
  cTestCPPTokenHandler();
  ~cTestCPPTokenHandler();

protected:
  void HandleToken(tToken& oToken);

private:
  cCPPTokenizer m_Tokenizer;
};

#endif //TESTCPPTOKENHANDLER_H