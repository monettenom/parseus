#ifndef GLOBALSCOPE_H
#define GLOBALSCOPE_H

class cGlobalScope
: public cNameSpace
{
public:
  cGlobalScope();
  ~cGlobalScope();

  bool IsGlobalScope();

  static cGlobalScope* GetGlobalScope();
  static void FreeGlobalScope();

private:
  static cGlobalScope* s_pGlobalScope;
};

#endif // GLOBALSCOPE_H
