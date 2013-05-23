#ifndef TYPEQUALIFIER_H
#define TYPEQUALIFIER_H

class cTypeQualifier
: public cLanguageElement
{
public:
  enum eType
  {
    TYPE_UNKNOWN,
    TYPE_CONST,
    TYPE_VOLATILE,
    TYPE_CONST_VOLATILE,
  };

public:
  cTypeQualifier(cScope* pParent = NULL);
  virtual ~cTypeQualifier();

  eType GetType();
  void SetType(eType oType);
  virtual bool HandleToken(tToken& oToken);

private:
  eType m_Type;
};

#endif // TYPEQUALIFIER_H
