#pragma once

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
