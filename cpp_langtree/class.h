#ifndef CLASS_H
#define CLASS_H

class cClass
: public cNamedScope
{
public:
  cClass(const char* strName = "", cScope* pParent = NULL);
  ~cClass();
};

#endif // CLASS_H
