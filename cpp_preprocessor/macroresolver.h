#ifndef MACRO_RESOLVER_H
#define MACRO_RESOLVER_H

typedef std::map<std::string, tTokenList> tParamMap;
typedef std::pair<std::string, tTokenList> tParamMapEntry;

class cMacroResolver
{
public:
  cMacroResolver(cPreprocessorMacro* pMacro);
  ~cMacroResolver();

  bool HandleToken(tToken& oToken);
  bool IsReady();
  bool ExpandMacro(ITokenHandler* pHandler);
  cPreprocessorMacro* GetMacro(){return m_pMacro;}

protected:
  void FinishParam();
  void InsertParamText(ITokenHandler* pHandler, tTokenList& tokenList);
  bool IsParam(const char* strLabel);
  void CallTokenHandler(ITokenHandler* pHandler, tToken& oToken);

private:
  enum eResolveState
  {
    eError = -1,
    eInit = 0,
    eParam,
    eMacro,
    eReady
  } m_eState;

  cPreprocessorMacro* m_pMacro;
  tParamMap m_Params;
  tParamMap::iterator m_itCurrentParam;
  tTokenList m_Output;
  int m_nBracketDepth;
  int m_nParamIndex;
  bool m_bEllipsis;
};

#endif // MACRO_RESOLVER_H