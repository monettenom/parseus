#ifndef NESTINGLEVEL_H
#define NESTINGLEVEL_H

class cNestingLevel
{
public:
  enum eNestingLevelType
  {
    NLTYPE_NONE,
    NLTYPE_IF,
    NLTYPE_ELSE,
    NLTYPE_INCLUDE,
  };

public:
  cNestingLevel(
    eNestingLevelType eType = NLTYPE_NONE, 
    bool bOutputAllowed = true,
    bool bOutputAllowedBefore = true);
  cNestingLevel(const cNestingLevel& NestingLevel);
  ~cNestingLevel();

  bool IsOutputAllowed();
  eNestingLevelType GetType();
  void DoElse();

private:
  bool m_bOutputAllowed;
  bool m_bNeverAllowed;
  bool m_bWasTrue;
  eNestingLevelType m_eType;
};

#endif
