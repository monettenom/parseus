#ifndef NAMESPACE_H
#define NAMESPACE_H

class cNameSpace;
typedef std::map<std::string, cNameSpace*> tNameSpaceMap;
typedef std::map<std::string, cClass*> tClassMap;

class cNameSpace
: public cNamedScope
{
public:
  cNameSpace(const char* strName = "", cScope* pParent = NULL);
  ~cNameSpace();

  void AddNameSpace(cNameSpace* pNameSpace);
  cNameSpace* GetNameSpace(const char* strName);
  tNameSpaceMap& GetNameSpaces();

  void AddClass(cClass* pClass);
  cClass* GetClass(const char* strName);
  tClassMap& GetClasses();

private:
  tNameSpaceMap m_NameSpaces;
  tClassMap m_Classes;
};

#endif // NAMESPACE_H
