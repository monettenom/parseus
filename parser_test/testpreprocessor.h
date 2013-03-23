#ifndef TESTPREPROCESSOR_H
#define TESTPREPROCESSOR_H

class cTestPreprocessor
: public cTestTokenHandler
, public ICodeHandler
{
public:
  cTestPreprocessor();
  ~cTestPreprocessor();

  void HandleCode(const char* strLine, const cFileInfo& FileInfo);
  bool Test(tTestData* pTestData);

protected:
  bool HandleToken(tToken& oToken);
  int CreateInclude(const char** strLines, int iStartIndex);

private:
  std::stringstream m_strLine;
  cCPPTokenizer m_Tokenizer;
  cPreProcessor m_Preprocessor;
};

#endif //TESTPREPROCESSOR_H