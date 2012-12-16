#pragma once

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
