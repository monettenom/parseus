#include "stdafx.h"
#include "pp_tokenizer.h"
#include "ppexpression.h"

cPreprocessorExpression::cPreprocessorExpression()
: m_eState(eInit)
, m_pMacroMap(NULL)
{
}

cPreprocessorExpression::~cPreprocessorExpression()
{
}

bool cPreprocessorExpression::HandleToken(tToken& oToken)
{
  switch (oToken.m_Token)
  {
    case TOKEN_WHITESPACE:
    case TOKEN_NEWLINE:
      break;
    case TOKEN_LITERAL:
    case TOKEN_LABEL:
      m_Expression.push_back(oToken);
      break;
    case TOKEN_OPERATOR:
      if (oToken.m_Type == PP_OP_PREPROC_END)
      {
        m_eState = eReady;
      }
      else
      {
        m_Expression.push_back(oToken);
      }
      break;
    default:
      m_eState = eError;
      return false;
  }
  return true;
}

bool cPreprocessorExpression::IsReady()
{
  return m_eState == eReady;
}

/*
http://en.wikipedia.org/wiki/Order_of_operations
*/

int cPreprocessorExpression::GetLiteral()
{
  int iResult = 0;
  if (m_itCursor != m_Expression.end())
  {
    switch (m_itCursor->m_Token)
    {
      case TOKEN_LITERAL:
        iResult = atoi(m_itCursor->m_strName);
        m_itCursor++;
        return iResult;
      default:
        break;
    }
  }

  // Error: literal expected!
  return 0;
}

int cPreprocessorExpression::GetUnaryExpression()
{
  if (m_itCursor == m_Expression.end())
  {
    // Error: 
    return 0;
  }

  switch (m_itCursor->m_Token)
  {
    case TOKEN_OPERATOR:
      switch (m_itCursor->m_Type)
      {
        case PP_OP_ADDITION:
          m_itCursor++;
          return GetParenthesisExpression();
        case PP_OP_SUBTRACTION:
          m_itCursor++;
          return -GetParenthesisExpression();
        case PP_OP_LOGICAL_NOT:
          m_itCursor++;
          return (GetParenthesisExpression() == 0) ? 1 : 0;
        default:
          // Error: Literal expected
          return 0;
      }
      break;
    default:
      return GetLiteral();
  }
}

int cPreprocessorExpression::GetFunctionCallExpression()
{
  if (m_itCursor == m_Expression.end())
  {
    // Error: 
    return 0;
  }

  if (m_itCursor->IsToken(TOKEN_KEYWORD, PP_KW_DEFINED))
  {
    m_itCursor++;
    return GetParenthesisExpression();
  }

  return GetUnaryExpression();
}

int cPreprocessorExpression::GetParenthesisExpression()
{
  if (m_itCursor == m_Expression.end())
  {
    // Error: 
    return 0;
  }

  if (m_itCursor->IsToken(TOKEN_OPERATOR, PP_OP_BRACKET_OPEN))
  {
    m_itCursor++;
    int iValue = GetCommaExpression();
    if (!m_itCursor->IsToken(TOKEN_OPERATOR, PP_OP_BRACKET_CLOSE))
    {
      // error: bracket close expected
      return 0;
    }
    m_itCursor++;
    return iValue;
  }
  else
  {
    return GetFunctionCallExpression();
  }
}

int cPreprocessorExpression::GetFactorExpression()
{
  int iValue = GetParenthesisExpression();
  while ((m_itCursor != m_Expression.end()) &&
    (m_itCursor->m_Token == TOKEN_OPERATOR))
  {
    switch (m_itCursor->m_Type)
    {
      case PP_OP_MULTIPLICATION: 
        m_itCursor++;
        iValue *= GetParenthesisExpression();
        break;
      case PP_OP_DIVISION:
        m_itCursor++;
        iValue /= GetParenthesisExpression();
        break;
      case PP_OP_MODULUS:
        m_itCursor++;
        iValue %= GetParenthesisExpression();
        break;
      default:
        return iValue;
    }
  }
  return iValue;
}

int cPreprocessorExpression::GetSummaryExpression()
{
  int iValue = GetFactorExpression();
  while ((m_itCursor != m_Expression.end()) &&
    (m_itCursor->m_Token == TOKEN_OPERATOR))
  {
    switch (m_itCursor->m_Type)
    {
      case PP_OP_ADDITION: 
        m_itCursor++;
        iValue += GetFactorExpression();
        break;
      case PP_OP_SUBTRACTION:
        m_itCursor++;
        iValue -= GetFactorExpression();
        break;
      default:
        return iValue;
    }
  }
  return iValue;
}

int cPreprocessorExpression::GetShiftExpression()
{
  int iValue = GetSummaryExpression();
  while ((m_itCursor != m_Expression.end()) &&
    (m_itCursor->m_Token == TOKEN_OPERATOR))
  {
    switch (m_itCursor->m_Type)
    {
      case PP_OP_SHL:
        m_itCursor++;
        iValue <<= GetSummaryExpression();
        break;
      case PP_OP_SHR:
        m_itCursor++;
        iValue >>= GetSummaryExpression();
        break;
      default:
        return iValue;
    }
  }
  return iValue;
}

int cPreprocessorExpression::GetComparisonExpression()
{
  int iValue = GetShiftExpression();
  while ((m_itCursor != m_Expression.end()) &&
    (m_itCursor->m_Token == TOKEN_OPERATOR))
  {
    switch (m_itCursor->m_Type)
    {
      case PP_OP_SMALLER:
        m_itCursor++;
        iValue = iValue < GetShiftExpression();
        break;
      case PP_OP_SMALLER_OR_EQUAL:
        m_itCursor++;
        iValue = iValue <= GetShiftExpression();
        break;
      case PP_OP_BIGGER:
        m_itCursor++;
        iValue = iValue > GetShiftExpression();
        break;
      case PP_OP_BIGGER_OR_EQUAL:
        m_itCursor++;
        iValue = iValue >= GetShiftExpression();
        break;
      default:
        return iValue;
    }
  }
  return iValue;
}

int cPreprocessorExpression::GetEqualityExpression()
{
  int iValue = GetComparisonExpression();
  while ((m_itCursor != m_Expression.end()) &&
    (m_itCursor->m_Token == TOKEN_OPERATOR))
  {
    switch (m_itCursor->m_Type)
    {
      case PP_OP_EQUAL:
        m_itCursor++;
        iValue = iValue == GetComparisonExpression();
        break;
      case PP_OP_NOT_EQUAL:
        m_itCursor++;
        iValue = iValue != GetComparisonExpression();
        break;
      default:
        return iValue;
    }
  }
  return iValue;
}

int cPreprocessorExpression::GetBitwiseAndExpression()
{
  int iValue = GetEqualityExpression();
  while ((m_itCursor != m_Expression.end()) &&
     (m_itCursor->IsToken(TOKEN_OPERATOR, PP_OP_BITWISE_AND)))
  {
    m_itCursor++;
    iValue &= GetEqualityExpression();
  }
  return iValue;
}

int cPreprocessorExpression::GetBitwiseXorExpression()
{
  int iValue = GetBitwiseAndExpression();
  while ((m_itCursor != m_Expression.end()) &&
     (m_itCursor->IsToken(TOKEN_OPERATOR, PP_OP_BITWISE_XOR)))
  {
    m_itCursor++;
    iValue ^= GetBitwiseAndExpression();
  }
  return iValue;
}

int cPreprocessorExpression::GetBitwiseOrExpression()
{
  int iValue = GetBitwiseXorExpression();
  while ((m_itCursor != m_Expression.end()) &&
     (m_itCursor->IsToken(TOKEN_OPERATOR, PP_OP_BITWISE_OR)))
  {
    m_itCursor++;
    iValue |= GetBitwiseXorExpression();
  }
  return iValue;
}

int cPreprocessorExpression::GetLogicalAndExpresssion()
{
  int iValue = GetBitwiseOrExpression();
  while ((m_itCursor != m_Expression.end()) &&
     (m_itCursor->IsToken(TOKEN_OPERATOR, PP_OP_LOGICAL_AND)))
  {
    m_itCursor++;
    iValue = iValue && GetBitwiseOrExpression();
  }
  return iValue;
}

int cPreprocessorExpression::GetLogicalOrExpression()
{
  int iValue = GetLogicalAndExpresssion();

  while ((m_itCursor != m_Expression.end()) &&
    (m_itCursor->IsToken(TOKEN_OPERATOR, PP_OP_LOGICAL_OR)))
  {
    m_itCursor++;
    iValue = iValue || GetLogicalAndExpresssion();
  }
  return iValue;
}

int cPreprocessorExpression::GetConditionalExpression()
{
  int iValue = GetLogicalOrExpression();

  if ((m_itCursor != m_Expression.end()) &&
     (m_itCursor->IsToken(TOKEN_OPERATOR, PP_OP_CONDITIONAL)))
  {
    m_itCursor++;
    int iValue2 = GetLogicalOrExpression();
    if (!m_itCursor->IsToken(TOKEN_OPERATOR, PP_OP_CONDITIONAL_ELSE))
    {
      // error: ':' expected
      return 0;
    }
    m_itCursor++;
    int iValue3 = GetLogicalOrExpression();
    return iValue ? iValue2 : iValue3;
  }
  return iValue;
}

int cPreprocessorExpression::GetCommaExpression()
{
  int iValue = GetConditionalExpression();
  while (
    (m_itCursor != m_Expression.end()) &&
    (m_itCursor->IsToken(TOKEN_OPERATOR, PP_OP_COMMA))
    )
  {
    m_itCursor++;
    GetConditionalExpression();
  }
  return iValue;
}

int cPreprocessorExpression::Evaluate(IMacroMap* pMacroMap)
{
  m_pMacroMap = pMacroMap;
  m_itCursor = m_Expression.begin();

  return GetCommaExpression();
}
