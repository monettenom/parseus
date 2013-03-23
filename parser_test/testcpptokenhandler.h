#ifndef TESTCPPTOKENHANDLER_H
#define TESTCPPTOKENHANDLER_H

class cTestCPPTokenHandler: public cTestTokenHandler
{
public:
  cTestCPPTokenHandler();
  ~cTestCPPTokenHandler();

protected:
  bool HandleToken(tToken& oToken);

private:
  cCPPTokenizer m_Tokenizer;
};

#endif //TESTCPPTOKENHANDLER_H