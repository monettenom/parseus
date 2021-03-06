#ifndef TESTPPTOKENHANDLER_H
#define TESTPPTOKENHANDLER_H

class cTestPPTokenHandler: public cTestTokenHandler
{
public:
  cTestPPTokenHandler();
  ~cTestPPTokenHandler();

protected:
  bool HandleToken(tToken& oToken);

private:
  cPPTokenizer m_Tokenizer;
};

#endif //TESTPPTOKENHANDLER_H