#include "stdafx.h"
#include "pp_tokenizer.h"
#include "ppexpression.h"

cPreprocessorExpression::cPreprocessorExpression(IMacroMap* pMacroMap)
: m_eState(eInit)
, m_pMacroMap(pMacroMap)
, m_pMacroResolver(NULL)
, m_bExpectLabel(false)
, m_bNegateResult(false)
{
}

cPreprocessorExpression::~cPreprocessorExpression()
{
}

void cPreprocessorExpression::ResolveMacro(tToken& oToken)
{
  if (!m_pMacroResolver->HandleToken(oToken))
  {
    //std::cout << "Error while resolving macro!" << std::endl;
    delete m_pMacroResolver;
    m_pMacroResolver = NULL;
  }
  if (m_pMacroResolver->IsReady())
  {
    //std::cout << "Macro resolved." << std::endl;
    cMacroResolver* pMacroResolver = m_pMacroResolver;
    m_pMacroResolver = NULL;
    pMacroResolver->ExpandMacro(this);
    delete pMacroResolver;
  }
}

void cPreprocessorExpression::HandleError(const char* strError, int iLine)
{

}

void cPreprocessorExpression::LogEntry(const char* strLog)
{

}

int cPreprocessorExpression::GetTokenCount()
{
  return 0;
}

void cPreprocessorExpression::Negate()
{
  m_bNegateResult = true;
}

void cPreprocessorExpression::PushToken(tToken& oToken)
{
  if (m_bExpectLabel && 
      oToken.m_Token != TOKEN_LABEL && 
      !oToken.IsToken(TOKEN_OPERATOR, PP_OP_BRACKET_OPEN))
  {
    //printf("Token expected!\n");
    m_eState = eError;
  }
  else
  {
    m_Expression.push_back(oToken);
  }
}

bool cPreprocessorExpression::HandleToken(tToken& oToken)
{
  if (m_pMacroResolver)
  {
    if (!m_pMacroResolver->IsReady())
    {
      ResolveMacro(oToken);
      return true;
    }
    else
    {
      ResolveMacro(oToken);
    }
  }

  switch (oToken.m_Token)
  {
    case TOKEN_WHITESPACE:
      //printf("WHITESPACE: '%s'\n", oToken.m_strName);
      break;
    case TOKEN_NEWLINE:
      //printf("NEWLINE\n");
      break;
    case TOKEN_LITERAL:
      //printf("LITERAL: %s\n", oToken.m_strName);
      PushToken(oToken);
      break;
    case TOKEN_KEYWORD:
      if (oToken.m_Type == PP_KW_DEFINED)
      {
        //printf("KEYWORD: defined\n", oToken.m_Type);
        PushToken(oToken);
        m_bExpectLabel = true;
      }
      else
      {
        //printf("Unexpected KEYWORD: %d\n", oToken.m_Type);
        m_eState = eError;
      }
      break;
    case TOKEN_STRING:
      if (oToken.m_strName[0] == '\'')
      {
        //printf("CHAR: %s (%d)\n", oToken.m_strName, oToken.m_strName[1]);
        PushToken(oToken);
      }
      break;
    case TOKEN_LABEL:
      if (m_bExpectLabel)
      {
        //printf("LABEL: %s\n", oToken.m_strName);
        m_bExpectLabel = false;
        PushToken(oToken);
      }
      else if(m_pMacroMap->IsDefined(oToken.m_strName))
      {
        //printf("MACRO: %s\n", oToken.m_strName);
        m_pMacroResolver = new cMacroResolver(m_pMacroMap->GetMacro(oToken.m_strName));
      }
      else
      {
        tToken ZeroToken;
        ZeroToken.m_Token = TOKEN_LITERAL;
        ZeroToken.SetName("0");
        //printf("Undefined Macro: %s\n", oToken.m_strName);
        PushToken(ZeroToken);
      }
      break;
    case TOKEN_OPERATOR:
      if (oToken.m_Type == PP_OP_PREPROC_END)
      {
        m_eState = eReady;
      }
      else
      {
        //printf("OPERATOR: %d\n", oToken.m_Type);
        PushToken(oToken);
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

int cPreprocessorExpression::ParseInteger(const char* strLiteral)
{
  int iResult = 0;
  int iBase = 10;
  int iOffset = 0;

  while (strLiteral[iOffset])
  {
    switch(strLiteral[iOffset])
    {
      case '0':
        if (iOffset == 0)
        {
          iBase = 8;
        }
        else
        {
          iResult = iResult * iBase;
        }
        break;

      case 'x':
        if (iOffset == 1)
        {
          iBase = 16;
        }
        else
        {
          return iResult;
        }
        break;

      case '1': case '2': case '3':
      case '4': case '5': case '6':
      case '7': case '8': case '9':
        if (iBase == 8 && strLiteral[iOffset] >= '8')
        {
          // Error: Ungültige Ziffer '8/9' für Basis '8'
          break;
        }
        else
        {
          iResult = iResult * iBase + (strLiteral[iOffset] - '0');
        }
        break;
      case 'a': case 'b': case 'c':
      case 'd': case 'e': case 'f':
        iResult = iResult * iBase + (strLiteral[iOffset] - 'a' + 10);
        break;
      case 'A': case 'B': case 'C':
      case 'D': case 'E': case 'F':
        iResult = iResult * iBase + (strLiteral[iOffset] - 'A' + 10);
        break;
      default:
        break;
    }
    iOffset++;
  }
  return iResult;
}

int cPreprocessorExpression::GetLiteral()
{
  int iResult = 0;
  if (m_itCursor != m_Expression.end())
  {
    switch (m_itCursor->m_Token)
    {
      case TOKEN_LITERAL:
        iResult = ParseInteger(m_itCursor->m_strName);
        m_itCursor++;
        return iResult;
      case TOKEN_STRING:
        iResult = m_itCursor->m_strName[1];
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

int cPreprocessorExpression::GetParenthesizedMacroExpression()
{
  int iResult = 0;

  if (m_itCursor == m_Expression.end())
  {
    // Error: 
    return iResult;
  }

  if (m_itCursor->IsToken(TOKEN_OPERATOR, PP_OP_BRACKET_OPEN))
  {
    m_itCursor++;
    iResult = GetParenthesizedMacroExpression();
    if (m_itCursor->IsToken(TOKEN_OPERATOR, PP_OP_BRACKET_CLOSE))
    {
      m_itCursor++;
    }
    else
    {
      //Error
      return 0;
    }
  }
  else if (m_itCursor->IsToken(TOKEN_LABEL))
  {
    iResult = m_pMacroMap->IsDefined(m_itCursor->m_strName) ? 1 : 0;
    m_itCursor++;
  }
  else
  {
    //Error
    return 0;
  }

  return iResult;
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
    return GetParenthesizedMacroExpression();
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

int cPreprocessorExpression::Evaluate()
{
  m_itCursor = m_Expression.begin();

  int iResult = GetCommaExpression();
  if (m_bNegateResult)
    return iResult ? false : true;
  return iResult;
}
