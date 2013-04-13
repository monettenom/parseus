#ifndef SCOPE_H
#define SCOPE_H

class cScope;

std::vector<cScope*> tScopeList;
std::map<std::string, cScope*> tNamespaceList;

class cScope
{
public:
  cScope();
  virtual ~cScope();

  bool IsGlobalScope();
  static cScope* GetGlobalScope();

private:
  cScope* m_ParentScope;
};

class cGlobalScope
: public cScope
{
public:
  cGlobalScope();
  ~cGlobalScope();

  bool IsGlobalScope();

};



#endif // SCOPE_H
