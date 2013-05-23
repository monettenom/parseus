#ifndef SCOPE_H
#define SCOPE_H

typedef std::vector<cScope*> tScopeList;

class cScope
: public cLanguageElement
{
public:
  cScope(cScope* pParent = NULL);
  virtual ~cScope();

  virtual bool IsGlobalScope();

  void AddScope(cScope* pScope);
  tScopeList& GetChildScopes();

private:
  tScopeList m_ChildScopes;
};

#endif // SCOPE_H
