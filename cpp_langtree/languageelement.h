#ifndef LANGUAGEELEMENT_H
#define LANGUAGEELEMENT_H

class cScope;

class cLanguageElement
{
public:
  cLanguageElement(cScope* pParent = NULL);
  virtual ~cLanguageElement();

  cScope* GetParentScope();

  virtual bool HandleToken(tToken& oToken);

private:
  cScope* m_pParentScope;
};

#endif // LANGUAGEELEMENT_H
