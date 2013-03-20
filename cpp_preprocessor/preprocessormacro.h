#ifndef PREPROCESSOR_MACRO_H
#define PREPROCESSOR_MACRO_H

class cPreprocessorMacro
{
  public:
    cPreprocessorMacro();
    ~cPreprocessorMacro();

    bool HandleToken(tToken& oToken);
    bool IsReady();
    int GetParamCount();
    const char* GetParam(int nIndex);
    const char* GetName(); // return "..." for ellipsis
    tTokenList& GetMacroText();
    void Debug();

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

    std::string m_strName;
    tTokenList m_vParamList;
    tTokenList m_vMacroText;
};

#endif // PREPROCESSOR_MACRO_H