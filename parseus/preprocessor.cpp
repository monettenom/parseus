#include "stdafx.h"
#include "preprocessormacro.h"
#include "macroresolver.h"
#include "ppexpression.h"
#include "preprocessor.h"

cNestingLevel::cNestingLevel(cNestingLevel::eNestingLevelType eType, bool bOutputAllowed)
: m_bOutputAllowed(bOutputAllowed)
, m_eType(eType)
, m_bWasTrue(false)
{

}

cNestingLevel::cNestingLevel(const cNestingLevel& NestingLevel)
: m_bOutputAllowed(NestingLevel.m_bOutputAllowed)
, m_eType(NestingLevel.m_eType)
, m_bWasTrue(NestingLevel.m_bWasTrue)
{
}

cNestingLevel::~cNestingLevel()
{
}

bool cNestingLevel::IsOutputAllowed()
{
  return m_bOutputAllowed;
}

cNestingLevel::eNestingLevelType cNestingLevel::GetType()
{
  return m_eType;
}

void cNestingLevel::DoElse()
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
  m_eType = cNestingLevel::NLTYPE_ELSE;
}

cPreProcessor::cPreProcessor(ICodeHandler* pCodeHandler)
: m_bPreProc(false)
, m_bInclude(false)
, m_bUndefNext(false)
, m_pCurrentMacro(NULL)
, m_pMacroResolver(NULL)
, m_pExpression(NULL)
, m_pCodeHandler(pCodeHandler)
{
  m_Tokenizer.SetTokenHandler(this);
  m_ConditionStack.push(cNestingLevel(cNestingLevel::NLTYPE_NONE, true));
}

cPreProcessor::~cPreProcessor()
{

}

void cPreProcessor::Reset()
{
  m_bPreProc = false;
  m_bInclude = false;
  m_bUndefNext = false;
  delete m_pCurrentMacro;
  m_pCurrentMacro = NULL;
  delete m_pMacroResolver;
  m_pMacroResolver = NULL;
  delete m_pExpression;
  m_pExpression = NULL;
  while(!m_ConditionStack.empty())
    m_ConditionStack.pop();
  m_ConditionStack.push(cNestingLevel(cNestingLevel::NLTYPE_NONE, true));
  m_MacroMap.clear();
}

void cPreProcessor::HandleError(const char* strError, int iLine)
{
  std::cout << strError << " in line: " << iLine << std::endl;
}

void cPreProcessor::LogEntry(const char* strLog)
{
  //std::cout << strLog << std::endl;
}

void cPreProcessor::AddStandardInclude(const char* strPath)
{
  std::string strEntry(strPath);
  switch (strPath[strEntry.length()-1])
  {
    case '\\':
    case '/':
      break;
    default:
      strEntry.append("/");
      break;
  }
  m_vStdIncludes.push_back(strEntry);
}

void cPreProcessor::AddProjectInclude(const char* strPath)
{
  std::string strEntry(strPath);
  switch (strPath[strEntry.length()-1])
  {
  case '\\':
  case '/':
    break;
  default:
    strEntry.append("/");
    break;
  }
  m_vPrjIncludes.push_back(strEntry);
}

bool cPreProcessor::Process(const char* strFile)
{
  std::string line;
  std::ifstream input(strFile);
  if (input.is_open())
  {
    while (input.good())
    {
      getline (input, line);
      Parse(line.c_str());
    }
    input.close();
    return true;
  }
  else
  {
    std::cout << "Unable to open file '" << strFile << "'" << std::endl;
    return false;
  }
}

bool cPreProcessor::Parse(const char* strLine, bool bSkipWhiteSpaces, bool bSkipComments)
{
  return m_Tokenizer.Parse(strLine, bSkipWhiteSpaces, bSkipComments);
}

bool cPreProcessor::FindInclude(tIncludeList& vIncludes, const char* strFile, std::string& strPath)
{
  for (tIncludeList::const_iterator it = vIncludes.begin(); it != vIncludes.end(); ++it)
  {
    strPath = *it;
    strPath.append(strFile);

    std::fstream input(strPath.c_str());
    if (input.good())
      return true;
  }
  strPath.clear();
  return false;
}

void cPreProcessor::Include(const char* strFile)
{
  std::cout << "Include: " << strFile << std::endl;
  std::string strName;
  strName.assign(strFile+1, strlen(strFile)-2);
  std::string strPath;

  switch (strFile[0])
  {
    case '<':
      if (FindInclude(m_vStdIncludes, strName.c_str(), strPath))
        break;
    case '\"':
      FindInclude(m_vPrjIncludes, strName.c_str(), strPath);
        break;
    default:
      break;
  }

  if (!strPath.empty())
  {
    //Process(strPath.c_str());
  }
}

bool cPreProcessor::IsDefined(const char* strMacro)
{
  return GetMacro(strMacro) != NULL;
}

void cPreProcessor::Undef(const char* strMacro)
{
  m_MacroMap.erase(strMacro);
}

void cPreProcessor::Endif()
{
  if (m_ConditionStack.size() > 1)
  {
    m_ConditionStack.pop();
  }
  else
  {
    //Nesting Error. Endif without ifxx
  }
}

cPreprocessorMacro* cPreProcessor::GetMacro(const char* strMacro)
{
  tMacroMap::const_iterator it = m_MacroMap.find(strMacro);
  if (it != m_MacroMap.end())
    return it->second;
  else
    return NULL;
}

bool cPreProcessor::IsOutputAllowed()
{
  return m_ConditionStack.top().IsOutputAllowed();
}

void cPreProcessor::HandleMacro(tToken& oToken)
{
  if (!m_pCurrentMacro->HandleToken(oToken))
  {
    std::cout << "Error while handling preprocessor macro!" << std::endl;
    delete m_pCurrentMacro;
    m_pCurrentMacro = NULL;
    m_bPreProc = false;
  }
  else if (m_pCurrentMacro->IsReady())
  {
    tMacroMap::iterator it = m_MacroMap.find(m_pCurrentMacro->GetName());
    if (IsOutputAllowed() && (it == m_MacroMap.end()))
    {
      m_MacroMap.insert(tMacroMapEntry(m_pCurrentMacro->GetName(), m_pCurrentMacro));
    }
    else
    {
      // error: already defined
    }
    m_pCurrentMacro = NULL;
    m_bPreProc = false;
  }
}

void cPreProcessor::ResolveMacro(tToken& oToken)
{
  if (!m_pMacroResolver->HandleToken(oToken))
  {
    //std::cout << "Error while resolving macro!" << std::endl;
    delete m_pMacroResolver;
    m_pMacroResolver = NULL;
  }
  else if(m_pMacroResolver->IsReady())
  {
    //std::cout << "Macro resolved." << std::endl;
    cMacroResolver* pMacroResolver = m_pMacroResolver;
    m_pMacroResolver = NULL;
    if (IsOutputAllowed())
      pMacroResolver->ExpandMacro(this);
    delete pMacroResolver;
  }
}

void cPreProcessor::HandleExpression(tToken& oToken)
{
  if (!m_pExpression->HandleToken(oToken))
  {
    delete m_pExpression;
    m_pExpression = NULL;
  }
  else if (m_pExpression->IsReady())
  {
    int iResult = m_pExpression->Evaluate();
    bool bFlag = IsOutputAllowed() && (iResult != 0);
    printf("Expression result: %d\n", iResult);
    m_ConditionStack.push(cNestingLevel(cNestingLevel::NLTYPE_IF, bFlag));
    delete m_pExpression;
    m_pExpression = NULL;
  }
}

void cPreProcessor::OutputCode(const char* strCode)
{
  if (IsOutputAllowed())
  {
    m_pCodeHandler->HandleCode(strCode);
  }
}

void cPreProcessor::OutputCode(char cCode)
{
  if (IsOutputAllowed())
  {
    m_pCodeHandler->HandleCode(cCode);
  }
}

bool cPreProcessor::HandleToken(tToken& oToken)
{
  //printf("[%d] ", m_ConditionStack.top().IsOutputAllowed());
  //m_Tokenizer.PrintToken(oToken);
  if (m_pCurrentMacro)
  {
    //printf("HandleMacro\n");
    HandleMacro(oToken);
    return true;
  }
  if (m_pMacroResolver)
  {
    //printf("ResolveMacro\n");
    ResolveMacro(oToken);
    return true;
  }
  if (m_pExpression)
  {
    //printf("HandleExpression\n");
    HandleExpression(oToken);
    return true;
  }

  switch(oToken.m_Token)
  {
    case TOKEN_OPERATOR:
    {
      switch(oToken.m_Type)
      {
        case PP_OP_PREPROC: 
          m_bPreProc = true; 
          break;
        case PP_OP_PREPROC_END: 
          m_bPreProc = false;
          m_bInclude = false;
          break;
        default:
          OutputCode(m_Tokenizer.GetOperatorString(oToken.m_Type));
          break;
      }
    }
    break;

    case TOKEN_KEYWORD:
    {
      switch(oToken.m_Type)
      {
        case PP_KW_INCLUDE: 
          m_bInclude = true;
          std::cout << "include" << std::endl;
          break;
        case PP_KW_IF:
          m_pExpression = new cPreprocessorExpression(this);
          break;
        case PP_KW_ELIF:
          if (!IsOutputAllowed())
          {
            m_ConditionStack.pop();
            m_pExpression = new cPreprocessorExpression(this);
          }
          else
          {
            m_ConditionStack.top().DoElse();
          }
          break;
        case PP_KW_IFDEF:
          m_pExpression = new cPreprocessorExpression(this);
          m_pExpression->HandleToken(tToken(TOKEN_KEYWORD, PP_KW_DEFINED));
          break;
        case PP_KW_IFNDEF:
          m_pExpression = new cPreprocessorExpression(this);
          m_pExpression->Negate();
          m_pExpression->HandleToken(tToken(TOKEN_KEYWORD, PP_KW_DEFINED));
          break;
        case PP_KW_ENDIF:
          Endif();
          break;
        case PP_KW_ELSE:
          m_ConditionStack.top().DoElse();
          break;
          m_pExpression = new cPreprocessorExpression(this);
          break;
        case PP_KW_DEFINE:
          m_pCurrentMacro = new cPreprocessorMacro;
          break;
        case PP_KW_UNDEF:
          m_bUndefNext = true;
          break;
      }
    }
    break;

    case TOKEN_STRING:
    {
      if (m_bInclude)
      {
        Include(oToken.m_strName);
      }
      else
      {
        OutputCode(oToken.m_strName);
      }
    }
    break;

    case TOKEN_CHAR:
    {
      OutputCode(oToken.m_cChar);
    }
    break;

    case TOKEN_TEXT:
    {
      OutputCode(oToken.m_strName);
    }
    break;

    case TOKEN_LABEL:
    {
      if (m_bUndefNext)
      {
        Undef(oToken.m_strName);
        m_bUndefNext = false;
      }
      else if (IsDefined(oToken.m_strName))
      {
        {
          m_pMacroResolver = new cMacroResolver(GetMacro(oToken.m_strName));
        }
        //std::cout << "Macro: " << oToken.m_strName << std::endl;
      }
      else
      {
        OutputCode(oToken.m_strName);
      }
    }
    break;

    case TOKEN_LITERAL:
      OutputCode(oToken.m_strName);
      break;

    case TOKEN_WHITESPACE:
      OutputCode(oToken.m_strName);
      break;

    case TOKEN_NEWLINE:
      m_pCodeHandler->HandleCode('\n');
      break;
  }
  return false;
}
