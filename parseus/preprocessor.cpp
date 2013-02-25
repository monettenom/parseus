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
, m_bStringify(false)
, m_pCurrentMacro(NULL)
, m_pMacroResolver(NULL)
, m_pExpression(NULL)
, m_pPragmaHandler(NULL)
, m_pCodeHandler(pCodeHandler)
, m_pLineMacro(NULL)
, m_pFileMacro(NULL)
{
  LOG("");
  m_Tokenizer.SetTokenHandler(this);
  Reset();
}

cPreProcessor::~cPreProcessor()
{
  delete m_pLineMacro;
  m_pLineMacro = NULL;
  delete m_pFileMacro;
  m_pFileMacro = NULL;
}

void cPreProcessor::Reset()
{
  m_bPreProc = false;
  m_bInclude = false;
  m_bUndefNext = false;
  m_bStringify = false;
  delete m_pCurrentMacro;
  m_pCurrentMacro = NULL;
  delete m_pMacroResolver;
  m_pMacroResolver = NULL;
  delete m_pExpression;
  m_pExpression = NULL;
  delete m_pPragmaHandler;
  m_pPragmaHandler = NULL;
  while(!m_ConditionStack.empty())
    m_ConditionStack.pop();
  while(!m_FileInfoStack.empty())
    m_FileInfoStack.pop();
  m_ConditionStack.push(cNestingLevel(cNestingLevel::NLTYPE_NONE, true));
  m_FileInfoStack.push(tFileInfo("",1));
  m_MacroMap.clear();
  m_pLineMacro = NULL;
  m_pFileMacro = NULL;
  SetLineMacro(0);
  SetFileMacro("no file");
}

void cPreProcessor::HandleError(const char* strError, int iLine)
{
  std::cout << strError << " in line: " << iLine << std::endl;
}

void cPreProcessor::LogEntry(const char* strLog)
{
  //std::cout << strLog << std::endl;
}

void cPreProcessor::SetLineMacro(int iLine)
{
  std::stringstream strNumber;
  strNumber << iLine;

  if (!m_pLineMacro)
  {
    m_pLineMacro = new cPreprocessorMacro;
    m_pLineMacro->HandleToken(tToken(TOKEN_LABEL, "__LINE__"));
    m_pLineMacro->HandleToken(tToken(TOKEN_LITERAL, strNumber.str().c_str()));
    m_pLineMacro->HandleToken(tToken(TOKEN_OPERATOR, PP_OP_PREPROC_END));
    m_MacroMap.insert(std::pair<std::string,cPreprocessorMacro*>("__LINE__", m_pLineMacro));
  }
  else
  {
    m_pLineMacro->GetMacroText()[0] = tToken(TOKEN_LITERAL, strNumber.str().c_str());
  }
}

void cPreProcessor::SetFileMacro(const char* strFile)
{
  std::stringstream strText;
  strText << "\"" << strFile << "\"";

  if (!m_pFileMacro)
  {
    m_pFileMacro = new cPreprocessorMacro;
    m_pFileMacro->HandleToken(tToken(TOKEN_LABEL, "__FILE__"));
    m_pFileMacro->HandleToken(tToken(TOKEN_STRING, strText.str().c_str()));
    m_pFileMacro->HandleToken(tToken(TOKEN_OPERATOR, PP_OP_PREPROC_END));
    m_MacroMap.insert(std::pair<std::string,cPreprocessorMacro*>("__FILE__", m_pFileMacro));
  }
  else
  {
    m_pFileMacro->GetMacroText()[0] = tToken(TOKEN_STRING, strText.str().c_str());
  }
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
    m_FileInfoStack.push(tFileInfo(strFile,1));
    SetFileMacro(m_FileInfoStack.top().m_strFile.c_str());
    while (input.good())
    {
      getline (input, line);
      LOG("%s:%d", m_FileInfoStack.top().m_strFile.c_str(), m_FileInfoStack.top().m_iLine);
      Parse(line.c_str());
    }
    input.close();
    m_FileInfoStack.pop();
    SetFileMacro(m_FileInfoStack.top().m_strFile.c_str());
    return true;
  }
  else
  {
    LOG("Unable to open file '%s'", strFile);
    return false;
  }
}

bool cPreProcessor::Parse(const char* strLine, bool bSkipWhiteSpaces, bool bSkipComments)
{
  SetLineMacro(m_FileInfoStack.top().m_iLine);
  bool bResult = m_Tokenizer.Parse(strLine, bSkipWhiteSpaces, bSkipComments);
  m_FileInfoStack.top().m_iLine++;
  return bResult;
}

bool cPreProcessor::FileExists(const char* strFile)
{
  std::fstream input(strFile);
  return input.good();
}

bool cPreProcessor::FindInclude(tIncludeList& vIncludes, const char* strFile, std::string& strPath)
{
  for (tIncludeList::const_iterator it = vIncludes.begin(); it != vIncludes.end(); ++it)
  {
    strPath = *it;
    strPath.append(strFile);

    if (FileExists(strPath.c_str()))
      return true;
  }
  strPath.clear();
  return false;
}

void cPreProcessor::Include(const char* strFile)
{
  LOG("Include: %s", strFile);
  std::string strName;
  strName.assign(strFile+1, strlen(strFile)-2);
  std::string strPath;

  switch (strFile[0])
  {
    case '<':
      if (FindInclude(m_vStdIncludes, strName.c_str(), strPath))
        break;
      // if this include was not found, try with project includes
    case '\"':
      FindInclude(m_vPrjIncludes, strName.c_str(), strPath);
      break;
    default:
      break;
  }

  if (strPath.empty())
  {
    if (FileExists(strName.c_str()))
      strPath = strName;
  }

  m_bInclude = false;
  if (!strPath.empty())
  {
    Process(strPath.c_str());
  }
  else
  {
    LOG("File not found: %s\n", strName.c_str());
  }
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
    LOG("Error: Nesting Error. Endif without if");
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
  LOG("Macro not found!");
  return NULL;
}

bool cPreProcessor::IsOutputAllowed()
{
  return m_ConditionStack.top().IsOutputAllowed();
}

void cPreProcessor::HandleMacro(tToken& oToken)
{
  LOG("HandleMacro");
  if (!m_pCurrentMacro->HandleToken(oToken))
  {
    LOG("Error while handling preprocessor macro!");
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
      LOG("Error: already defined");
    }
    m_pCurrentMacro = NULL;
    m_bPreProc = false;
  }
}

void cPreProcessor::ResolveMacro(tToken& oToken)
{
  LOG("ResolveMacro");
  if (!m_pMacroResolver->HandleToken(oToken))
  {
    LOG("Error while resolving macro!");
    delete m_pMacroResolver;
    m_pMacroResolver = NULL;
  }
  else if(m_pMacroResolver->IsReady())
  {
    LOG("Macro resolved.");
    cMacroResolver* pMacroResolver = m_pMacroResolver;
    m_pMacroResolver = NULL;
    if (IsOutputAllowed())
      pMacroResolver->ExpandMacro(this);
    delete pMacroResolver;
  }
}

void cPreProcessor::HandleExpression(tToken& oToken)
{
  LOG("HandleExpression");
  if (!m_pExpression->HandleToken(oToken))
  {
    delete m_pExpression;
    m_pExpression = NULL;
  }
  else if (m_pExpression->IsReady())
  {
    int iResult = m_pExpression->Evaluate();
    bool bFlag = IsOutputAllowed() && (iResult != 0);
    LOG("Expression result: %d", iResult);
    m_ConditionStack.push(cNestingLevel(cNestingLevel::NLTYPE_IF, bFlag));
    delete m_pExpression;
    m_pExpression = NULL;
  }
}

void cPreProcessor::HandlePragma(tToken& oToken)
{
  LOG("HandlePragma");
  if (!m_pPragmaHandler->HandleToken(oToken))
  {
    delete m_pPragmaHandler;
    m_pPragmaHandler = NULL;
  }
  else if (m_pPragmaHandler->IsReady())
  {
    LOG("Pragma: %d", m_pPragmaHandler->GetPragma());
    LOG("ParamCount: %d", m_pPragmaHandler->GetParams().size());
    delete m_pPragmaHandler;
    m_pPragmaHandler = NULL;
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
  m_Tokenizer.LogToken(oToken);
  if (m_pCurrentMacro)
  {
    HandleMacro(oToken);
    return true;
  }
  if (m_pMacroResolver)
  {
    // if it is a simple macro, process the current macro
    // after resolve
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
  if (m_pExpression)
  {
    HandleExpression(oToken);
    return true;
  }

  if (m_pPragmaHandler)
  {
    HandlePragma(oToken);
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
        case PP_OP_CONCATENATION:
          // just ignore
          // since only text will be outputted the 
          // both tokens (before and after) will be printed
          // without whitespace
          break;
        case PP_OP_STRINGIFICATION:
          m_bStringify = true;
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
        case PP_KW_PRAGMA:
          m_pPragmaHandler = new cPragmaHandler;
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
      if (m_bStringify)
      {
        OutputCode('\"');
        OutputCode(oToken.m_strName);
        OutputCode('\"');
      }
      else if (m_bUndefNext)
      {
        Undef(oToken.m_strName);
        m_bUndefNext = false;
      }
      else if (IsDefined(oToken.m_strName))
      {
        {
          LOG("Install MacroHandler");
          m_pMacroResolver = new cMacroResolver(GetMacro(oToken.m_strName));
        }
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
