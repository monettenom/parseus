#ifndef SPECIFIER_H
#define SPECIFIER_H

enum eStorage
{
  STORAGE_NONE,
  STORAGE_AUTO,
  STORAGE_STATIC,
  STORAGE_REGISTER,
  STORAGE_VOLATILE,
  STORAGE_MUTABLE
};

enum eModifier
{
  MOD_NONE,
  MOD_SHORT,
  MOD_LONG,
  MOD_LONG_LONG,
};

enum eSign
{
  SIGN_NONE,
  SIGN_SIGNED,
  SIGN_UNSIGNED,
};

class cTypeModifier
{
public:
  cTypeModifier();
  virtual ~cTypeModifier();

  eStorage GetStorageType() const;
  void SetStorageType(eStorage Storage);

  eModifier GetModifier() const;
  void SetModifier(eModifier Modifier);

  eSign GetSign() const;
  void SetSign(eSign Sign);

  bool IsConst() const;
  void SetConst();

private:
  eStorage m_eStorage;
  eModifier m_eModifier;
  eSign m_eSign;
  bool m_bConst;
};

class cLanguageElement
{
public:
  virtual bool HandleToken(tToken& oToken) = 0;
};

class cTypeSpecification
: public cLanguageElement
{
public:
  cTypeSpecification();
  virtual ~cTypeSpecification();

  bool HandleToken(tToken& oToken);

  const char* GetName() const;
  cTypeModifier& GetModifier();

  static cTypeSpecification* IsTypeSpecification(tToken& oToken);

private:
  cTypeModifier m_Modifier;
  std::string m_strName;
};

class cTypedef
: public cLanguageElement
{
public:
  cTypedef();
  virtual ~cTypedef();

  bool HandleToken(tToken& oToken);
private:
  cLanguageElement* m_pElement;
  cTypeSpecification* m_pSpecification;
};


#endif // SPECIFIER_H
