#include "stdafx.h"

// cPreProcessor

cPreProcessor::cPreProcessor(ICodeHandler* pCodeHandler)
: m_bPreProc(false)
, m_bInclude(false)
, m_bUndefNext(false)
, m_bStringify(false)
, m_bLogMessage(false)
, m_pCurrentMacro(NULL)
, m_pMacroResolver(NULL)
, m_pExpression(NULL)
, m_pPragmaHandler(NULL)
, m_pCodeHandler(pCodeHandler)
, m_pLineMacro(NULL)
, m_pFileMacro(NULL)
, m_pBreakPoint(NULL)
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
  LOG("");
  cMacroHandler::Reset();
  m_bPreProc = false;
  m_bInclude = false;
  m_bUndefNext = false;
  m_bStringify = false;
  m_bLogMessage = false;
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
  m_ConditionStack.push(cNestingLevel(cNestingLevel::NLTYPE_NONE, true, true));
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
    m_pLineMacro = Define("__LINE__", strNumber.str().c_str());
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
    m_pFileMacro = Define("__FILE__", strText.str().c_str());
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

void cPreProcessor::SetBreakPointFile()
{
  if (m_pBreakPoint)
  {
    m_pBreakPoint->CheckFile(GetCurrentFile());
  }
}

bool cPreProcessor::IsBreakPointHit()
{
  return
    m_pBreakPoint &&
    IsOutputAllowed() &&
    m_pBreakPoint->CheckLine(GetCurrentLine());
}

bool cPreProcessor::Process(const char* strFile)
{
  std::string line;
  std::ifstream input(strFile);
  
  if (input.is_open())
  {
    unsigned int nConditions = m_ConditionStack.size();
    LOG("ConditionStack before include! (top: %d, detph: %d)", IsOutputAllowed(), m_ConditionStack.size());

    PushFileInfo(strFile, 1);
    SetFileMacro(GetCurrentFile());

    SetBreakPointFile();

    while (input.good())
    {
      getline (input, line);
      LOG("%s:%d", GetCurrentFile(), GetCurrentLine());

      if (IsBreakPointHit())
      {
        TRIGGER_BREAKPOINT;
      }

      if (!Parse(line.c_str()))
        break;
    }

    HandleToken(tToken(TOKEN_NEWLINE, PP_OP_UNKNOWN));
    input.close();

    PopFileInfo();
    SetFileMacro(GetCurrentFile());
    SetBreakPointFile();

    // This loop is necessary to clean up stack after pragma once
    while (m_ConditionStack.size() > nConditions)
    {
      LOG("ConditionStack has too much entries! (top: %d, depth: %d)", IsOutputAllowed(), m_ConditionStack.size());
      m_ConditionStack.pop();
    }
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
  SetLineMacro(GetCurrentLine());
  Stats()->AddSource(strLine, GetFileInfo());
  bool bResult = m_Tokenizer.Parse(strLine, bSkipWhiteSpaces, bSkipComments);
  IncCurrentLine();
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

  if (!IsOutputAllowed())
  {
    LOG("Ignored.");
    return;
  }

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
    Stats()->AddInclude(strPath.c_str(), GetFileInfo());
    Process(strPath.c_str());
  }
  else
  {
    LOG("File not found: %s\n", strName.c_str());
  }
}

void cPreProcessor::Endif()
{
  if (m_ConditionStack.size() > 1)
  {
    m_ConditionStack.pop();
    LOG("ConditionStack after endif! (top: %d, depth: %d)", IsOutputAllowed(), m_ConditionStack.size());
  }
  else
  {
    LOG("Error: Nesting Error. Endif without if");
  }
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
    if (!IsOutputAllowed() || InsertMacro(m_pCurrentMacro) == NULL)
    {
      delete m_pCurrentMacro;
      LOG("Ignored.");
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
    cMacroResolver* pMacroResolver = m_pMacroResolver;
    m_pMacroResolver = NULL;
    if (IsOutputAllowed())
    {
      Stats()->UseDefine(pMacroResolver->GetMacro()->GetName(), GetFileInfo());
      pMacroResolver->ExpandMacro(this);
      LOG("Macro expanded");
    }
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
    bool bFlag = (iResult != 0);
    LOG("Expression result: %d", iResult);
    m_ConditionStack.push(cNestingLevel(cNestingLevel::NLTYPE_IF, bFlag, IsOutputAllowed()));
    LOG("ConditionStack after expression! (top: %d, depth: %d)", IsOutputAllowed(), m_ConditionStack.size());
    delete m_pExpression;
    m_pExpression = NULL;
  }
}

void cPreProcessor::MakeMacroFromPath(std::string& strPath)
{
  for(std::string::iterator it = strPath.begin(); it != strPath.end(); ++it)
  {
    switch(*it)
    {
      case '.':
      case ' ':
      case '/':
      case '\\':
      case '(':
      case ')':
      case ':':
        *it = '_';
        break;
    }
  }
  std::transform(strPath.begin(), strPath.end(), strPath.begin(), ::toupper);
}

void cPreProcessor::ProcessPragma(cPragmaHandler* pPragmaHandler)
{
  LOG("Pragma: %d", pPragmaHandler->GetPragma());
  LOG("ParamCount: %d", pPragmaHandler->GetParams().size());

  if (!IsOutputAllowed())
  {
    LOG("Pragma ignored.");
    return;
  }

  switch (pPragmaHandler->GetPragma())
  {
    case PP_PRAGMA_ONCE:
    {
      std::string strFile = GetCurrentFile();
      LOG("Pragma once: %s", strFile.c_str());
      MakeMacroFromPath(strFile);
      LOG("Generated Macro: %s", strFile.c_str());
      if (IsDefined(strFile.c_str()))
      {
        LOG("Already exists. Stop parsing this file!");
        m_Tokenizer.Stop();
      }
      else
      {
        LOG("Not defined. Continue.");
        Define(strFile.c_str());
      }
    }
    break;
    default:
      LOG("Pragma not implemented (%d)!", pPragmaHandler->GetPragma());
      break;
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
    ProcessPragma(m_pPragmaHandler);
    delete m_pPragmaHandler;
    m_pPragmaHandler = NULL;
  }
}

void cPreProcessor::OutputCode(const char* strCode)
{
  if (IsOutputAllowed())
  {
    LOG("OutputCode: '%s'", strCode);
    m_strLine << strCode;
  }
}

void cPreProcessor::OutputCode(char cCode)
{
  if (IsOutputAllowed())
  {
    LOG("OutputCode: '%c'", cCode);
    if (cCode == '\n')
    {
      if (GetCurrentLine() > 0)
      {
        m_pCodeHandler->HandleCode(m_strLine.str().c_str(), GetFileInfo());
      }
      m_strLine.str(std::string());
    }
    else
    {
      m_strLine << cCode;
    }
  }
}

bool cPreProcessor::HandleMacroResolver(tToken& oToken)
{
  if (!m_pMacroResolver)
    return true;

  // if it is a simple macro which doesn't expand another macro, 
  // process the current macro after resolve
  if (!m_pMacroResolver->IsReady())
  {
    ResolveMacro(oToken);
    return false;
  }
  else
  {
    LOG("Process simple Token");
    ResolveMacro(oToken);
    if (m_pMacroResolver)
    {
      HandleToken(oToken);
      return false;
    }
    LOG("Continue processing token");
  }
  return true;
}

bool cPreProcessor::HandleToken(tToken& oToken)
{
  m_Tokenizer.LogToken(oToken);
  if (m_pCurrentMacro)
  {
    HandleMacro(oToken);
    return true;
  }

  if (!HandleMacroResolver(oToken))
    return true;

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
            LOG("ConditionStack elif! (top: %d, depth: %d)", IsOutputAllowed(), m_ConditionStack.size());
            m_pExpression = new cPreprocessorExpression(this);
          }
          else
          {
            LOG("ConditionStack before DoElse! (top: %d, depth: %d)", IsOutputAllowed(), m_ConditionStack.size());
            m_ConditionStack.top().DoElse();
            LOG("ConditionStack after DoElse! (top: %d, depth: %d)", IsOutputAllowed(), m_ConditionStack.size());
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
          LOG("ConditionStack before DoElse! (top: %d, depth: %d)", IsOutputAllowed(), m_ConditionStack.size());
          m_ConditionStack.top().DoElse();
          LOG("ConditionStack after DoElse! (top: %d, depth: %d)", IsOutputAllowed(), m_ConditionStack.size());
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
        case PP_KW_ERROR:
        case PP_KW_WARNING:
          m_bLogMessage = true;
          break;
      }
    }
    break;

    case TOKEN_STRING:
    {
      if (m_bInclude)
      {
        m_bInclude = false;
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

    case TOKEN_TEXT:
    case TOKEN_LITERAL:
    case TOKEN_WHITESPACE:
      OutputCode(oToken.m_strName);
      break;

    case TOKEN_NEWLINE:
      OutputCode('\n');
      break;
  }
  return false;
}

void cPreProcessor::SetBreakPoint(cBreakPoint* pBreakPoint)
{
  m_pBreakPoint = pBreakPoint;
}


