#include "nestinglevel.h"

// cNestingLevel

cNestingLevel::cNestingLevel(
  eNestingLevelType eType,
  bool bOutputAllowed,
  bool bOutputAllowedBefore)
: m_bOutputAllowed(bOutputAllowed)
, m_eType(eType)
, m_bWasTrue(false)
, m_bNeverAllowed(!bOutputAllowedBefore)
{
}

cNestingLevel::cNestingLevel(const cNestingLevel& NestingLevel)
: m_bOutputAllowed(NestingLevel.m_bOutputAllowed)
, m_eType(NestingLevel.m_eType)
, m_bWasTrue(NestingLevel.m_bWasTrue)
, m_bNeverAllowed(NestingLevel.m_bNeverAllowed)
{
}

cNestingLevel::~cNestingLevel()
{
}

bool cNestingLevel::IsOutputAllowed()
{
  return !m_bNeverAllowed && m_bOutputAllowed;
}

cNestingLevel::eNestingLevelType cNestingLevel::GetType()
{
  return m_eType;
}

void cNestingLevel::DoElse()
{
  if (!m_bNeverAllowed)
  {
    // handles else cases also for elif
    // only one block in the expression can be true
    if (m_bOutputAllowed)
    {
      m_bWasTrue = true;
      m_bOutputAllowed = false;
    }
    else
    {
      if (!m_bWasTrue)
      {
        m_bOutputAllowed = true;
      }
    }
  }
  m_eType = cNestingLevel::NLTYPE_ELSE;
}