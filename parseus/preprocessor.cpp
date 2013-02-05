#include "stdafx.h"
#include "preprocessormacro.h"
#include "macroresolver.h"
#include "ppexpression.h"
#include "preprocessor.h"

cPreProcessor::cPreProcessor()
: m_bPreProc(false)
, m_bInclude(false)
, m_pCurrentMacro(NULL)
, m_pMacroResolver(NULL)
, m_pExpression(NULL)
{
  m_Tokenizer.SetTokenHandler(this);
  m_ConditionStack.push(true);
}

cPreProcessor::~cPreProcessor()
{

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
      m_Tokenizer.Parse(line.c_str());
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

bool cPreProcessor::FindInclude(tIncludeList& vIncludes, const char* strFile, std::string& strPath)
{
  for(tIncludeList::const_iterator it = vIncludes.begin(); it != vIncludes.end(); ++it)
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

cPreprocessorMacro* cPreProcessor::GetMacro(const char* strMacro)
{
  tMacroMap::const_iterator it = m_MacroMap.find(strMacro);
  if (it != m_MacroMap.end())
    return it->second;
  else
    return NULL;
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
    //std::cout << "Macro finished: " << m_pCurrentMacro->GetName() << std::endl;
    m_MacroMap.insert(tMacroMapEntry(m_pCurrentMacro->GetName(), m_pCurrentMacro));
    m_pCurrentMacro->Debug();
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
    m_ConditionStack.push(iResult != 0);
    delete m_pExpression;
    m_pExpression = NULL;
  }
}

void cPreProcessor::OutputCode(const char* strCode)
{
  if (m_ConditionStack.top())
  {
    std::cout << strCode;
  }
}

void cPreProcessor::OutputCode(char cCode)
{
  if (m_ConditionStack.top())
  {
    std::cout << cCode;
  }
}

bool cPreProcessor::HandleToken(tToken& oToken)
{
  if (m_pCurrentMacro)
  {
    HandleMacro(oToken);
    return true;
  }
  if (m_pMacroResolver)
  {
    ResolveMacro(oToken);
    return true;
  }
  if (m_pExpression)
  {
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
          //std::cout << "Preproc" << std::endl; 
          break;
        case PP_OP_PREPROC_END: 
          m_bPreProc = false;
          m_bInclude = false;
          //std::cout << "Preproc End" << std::endl; 
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
        case PP_KW_ENDIF:
          m_ConditionStack.pop();
          break;
        case PP_KW_DEFINE:
          m_pCurrentMacro = new cPreprocessorMacro;
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
      if (IsDefined(oToken.m_strName))
      {
        m_pMacroResolver = new cMacroResolver(GetMacro(oToken.m_strName));
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
      OutputCode('\n');
      break;
  }
  return false;
}
