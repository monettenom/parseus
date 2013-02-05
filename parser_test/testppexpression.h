#ifndef TESTPPEXPRESSION_H
#define TESTPPEXPRESSION_H

#include "testtokenhandler.h"
#include "ppexpression.h"

typedef std::map<std::string, cPreprocessorMacro*> tMacroMap;
typedef std::pair<std::string, cPreprocessorMacro*> tMacroMapEntry;

class cTestPPExpression: public cTestTokenHandler, IMacroMap
{
public:
  cTestPPExpression();
  ~cTestPPExpression();

protected:
  bool HandleToken(tToken& oToken);
  void HandleExpression(tToken& oToken);

  bool IsDefined(const char* strMacro);
  cPreprocessorMacro* GetMacro(const char* strMacro);
  void HandleMacro(tToken& oToken);

private:
  cPreprocessorExpression* m_pExpression;
  cPPTokenizer m_Tokenizer;
  cPreprocessorMacro* m_pCurrentMacro;
  tMacroMap m_MacroMap;
};

#endif //TESTPPEXPRESSION_H