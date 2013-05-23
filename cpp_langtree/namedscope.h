#ifndef NAMEDSCOPE_H
#define NAMEDSCOPE_H

class cNamedScope
: public cScope
{
public:
  cNamedScope(const char* strName = "", cScope* pParent = NULL);
  ~cNamedScope();

  const char* GetName();

private:
  std::string m_strName;
};

#endif // NAMEDSCOPE_H
