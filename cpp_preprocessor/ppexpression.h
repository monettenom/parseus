#ifndef PPEXPRESSION_H
#define PPEXPRESSION_H

#include "preprocessormacro.h"
#include "macroresolver.h"

class IMacroMap
{
public:
  virtual bool IsDefined(const char* strMacro) = 0;
  virtual cPreprocessorMacro* GetMacro(const char* strMacro) = 0;
};

class cPreprocessorExpression: public ITokenHandler
{
public:
  cPreprocessorExpression(IMacroMap* pMacroMap);
  ~cPreprocessorExpression();

  bool HandleToken(tToken& oToken);
  bool IsReady();
  int Evaluate();
  void Negate();

protected:
  int ParseInteger(const char* strLiteral);
  int GetLiteral();
  int GetUnaryExpression();
  int GetFunctionCallExpression();
  int GetParenthesisExpression();
  int GetFactorExpression();
  int GetSummaryExpression();
  int GetShiftExpression();
  int GetComparisonExpression();
  int GetEqualityExpression();
  int GetBitwiseAndExpression();
  int GetBitwiseXorExpression();
  int GetBitwiseOrExpression();
  int GetLogicalAndExpresssion();
  int GetLogicalOrExpression();
  int GetConditionalExpression();
  int GetCommaExpression();

  int GetParenthesizedMacroExpression();

  void ResolveMacro(tToken& oToken);

  void HandleError(const char* strError, int iLine);
  void LogEntry(const char* strLog);
  int GetTokenCount();

  void PushToken(tToken& oToken);

private:
  enum eMacroState
  {
    eError = -1,
    eInit = 0,
    eName,
    eParam,
    eMacro,
    eReady
  } m_eState;

  tTokenList m_Expression;
  IMacroMap* m_pMacroMap;
  cMacroResolver* m_pMacroResolver;
  tTokenList::const_iterator m_itCursor;
  bool m_bExpectLabel;
  bool m_bNegateResult;
};

#endif // PPEXPRESSION_H