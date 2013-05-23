#include "cppunit.h"
#include "testscope.h"
#include "cpp_langtreelib.h"

IMPLEMENT_TEST_SUITE_START(Scope);
REGISTER_TEST_CASE(Scope, GlobalScope);
REGISTER_TEST_CASE(Scope, ParentScope);
REGISTER_TEST_CASE(Scope, ChildScopes);
REGISTER_TEST_CASE(Scope, NameSpace);
REGISTER_TEST_CASE(Scope, Class);
IMPLEMENT_TEST_SUITE_END;

IMPLEMENT_TEST_SETUP(Scope)
{
}

IMPLEMENT_TEST_TEARDOWN(Scope)
{
  cGlobalScope::FreeGlobalScope();
}

IMPLEMENT_TEST_CASE(Scope, GlobalScope)
{
  cScope* pScope = cGlobalScope::GetGlobalScope();
  TEST_NOT_NULL(pScope);
  TEST(pScope->IsGlobalScope());
}

IMPLEMENT_TEST_CASE(Scope, ParentScope)
{
  cScope* pScope = new cScope(cGlobalScope::GetGlobalScope());

  TEST_NOT_NULL(pScope);
  TEST_NOT_NULL(pScope->GetParentScope());
  TEST(pScope->GetParentScope()->IsGlobalScope());

  cScope* pScope2 = new cScope(pScope);

  TEST_NOT_NULL(pScope2);
  TEST_NOT_NULL(pScope2->GetParentScope());
  TEST(pScope2->GetParentScope() != pScope->GetParentScope());
  TEST_EQUALS(pScope2->GetParentScope(), pScope);
}

IMPLEMENT_TEST_CASE(Scope, ChildScopes)
{
  cScope* pScope = new cScope(cGlobalScope::GetGlobalScope());
  tScopeList& ChildScopes = cGlobalScope::GetGlobalScope()->GetChildScopes();
  TEST_EQUALS(1, ChildScopes.size());

  cScope* pScope2 = new cScope(cGlobalScope::GetGlobalScope());
  TEST_EQUALS(2, ChildScopes.size());

  cScope* pScope3 = new cScope(pScope);
  TEST_EQUALS(1, pScope->GetChildScopes().size());
  TEST_EQUALS(0, pScope2->GetChildScopes().size());
  TEST_EQUALS(0, pScope3->GetChildScopes().size());
}

IMPLEMENT_TEST_CASE(Scope, NameSpace)
{
  cGlobalScope* pGlobalScope = cGlobalScope::GetGlobalScope();

  TEST_NOT_NULL(pGlobalScope);
  TEST_EQUALS("", pGlobalScope->GetName());

  cNameSpace* pNameSpace = new cNameSpace("Test", cGlobalScope::GetGlobalScope());
  TEST_EQUALS("Test", pNameSpace->GetName());

  tScopeList& ChildScopes = cGlobalScope::GetGlobalScope()->GetChildScopes();
  TEST_EQUALS(1, ChildScopes.size());

  pNameSpace->AddNameSpace(new cNameSpace("TestNameSpace", pNameSpace));
  TEST_EQUALS(1, pNameSpace->GetChildScopes().size());
  TEST_EQUALS(1, pNameSpace->GetNameSpaces().size());

  cNameSpace* pTestNameSpace = pNameSpace->GetNameSpace("TestNameSpace");
  TEST_NOT_NULL(pTestNameSpace);
  TEST_EQUALS("TestNameSpace", pTestNameSpace->GetName());
}

IMPLEMENT_TEST_CASE(Scope, Class)
{
  cGlobalScope* pGlobalScope = cGlobalScope::GetGlobalScope();
  cClass* pClass = new cClass("cTest", pGlobalScope);
  TEST_EQUALS("cTest", pClass->GetName());
  TEST_EQUALS(pGlobalScope, pClass->GetParentScope());
  pGlobalScope->AddClass(pClass);
  TEST_EQUALS(pGlobalScope->GetClass("cTest"), pClass);
  pGlobalScope->AddClass(new cClass("cClass", pGlobalScope));
  TEST_EQUALS(pGlobalScope->GetClass("cTest"), pClass);
  TEST_NOT_NULL(pGlobalScope->GetClass("cClass"));
}