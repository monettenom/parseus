#include "stdafx.h"

// cMacroHandler

cMacroHandler::cMacroHandler()
: m_pStats(NULL)
{
  SetPreprocessorStatistics(NULL);
}

cMacroHandler::~cMacroHandler()
{
  m_pStats = NULL;
}

void cMacroHandler::Reset()
{
  while(!m_FileInfoStack.empty())
  {
    PopFileInfo();
  }
  PushFileInfo("", 1);
  m_MacroMap.clear();
}

void cMacroHandler::SetPreprocessorStatistics(IPreProcessorStatistics* pStats)
{
  static cPreProcessorStatisticsDummy s_DummyStats;
  if (pStats != NULL)
    m_pStats = pStats;
  else
    m_pStats = &s_DummyStats;
}

cPreprocessorMacro* cMacroHandler::GetMacro(const char* strMacro)
{
  tMacroMap::const_iterator it = m_MacroMap.find(strMacro);
  if (it != m_MacroMap.end())
  {
    return it->second;
  }
  LOG("Macro '%s' not found!", strMacro);
  return NULL;
}

void cMacroHandler::Undef(const char* strMacro)
{
  tMacroMap::iterator it = m_MacroMap.find(strMacro);
  if (it != m_MacroMap.end())
  {
    delete it->second;
    m_MacroMap.erase(it);
  }
}

bool cMacroHandler::IsDefined(const char* strMacro)
{
  return GetMacro(strMacro) != NULL;
}

cPreprocessorMacro* cMacroHandler::InsertMacro(cPreprocessorMacro* pMacro)
{
  tMacroMap::iterator it = m_MacroMap.find(pMacro->GetName());
  if (it == m_MacroMap.end())
  {
    const char* strMacro = pMacro->GetName();
    LOG("Define macro %s", strMacro);
    Stats()->AddDefine(strMacro, GetFileInfo());
    m_MacroMap.insert(tMacroMapEntry(strMacro, pMacro));
    return pMacro;
  }
  else
  {
    LOG("Error: already defined");
    return NULL;
  }
}

cPreprocessorMacro* cMacroHandler::InsertMacro(const char* strMacro, int nToken, const char* strText)
{
  Undef(strMacro);

  LOG("Define macro %s, type: %d, text: %s", strMacro, nToken, (strText != NULL) ? strText : "NULL");
  Stats()->AddDefine(strMacro, GetFileInfo());
  cPreprocessorMacro* pMacro = new cPreprocessorMacro;
  pMacro->HandleToken(tToken(TOKEN_LABEL, strMacro));
  if (strText != NULL)
    pMacro->HandleToken(tToken(nToken, strText));
  pMacro->HandleToken(tToken(TOKEN_OPERATOR, PP_OP_PREPROC_END));
  m_MacroMap.insert(std::pair<std::string,cPreprocessorMacro*>(strMacro, pMacro));
  return pMacro;
}

cPreprocessorMacro* cMacroHandler::Define(const char* strMacro, int nValue)
{
  std::stringstream stream;
  stream << nValue;
  return InsertMacro(strMacro, TOKEN_LITERAL, stream.str().c_str());
}

cPreprocessorMacro* cMacroHandler::Define(const char* strMacro, const char* strText)
{
  return InsertMacro(strMacro, TOKEN_STRING, strText);
}

void cMacroHandler::LogMacros()
{
  for (tMacroMap::iterator it = m_MacroMap.begin(); it != m_MacroMap.end(); ++it)
  {
    LOG(
      "Macro: '%s', Params: %d, Tokens: %d", 
      it->first.c_str(),
      it->second->GetParamCount(),
      it->second->GetMacroText().size()
    );
  }
}

int cMacroHandler::GetCurrentLine() const
{
  return m_FileInfoStack.top().GetLine();
}

const char* cMacroHandler::GetCurrentFile() const
{
  return m_FileInfoStack.top().GetFile();
}

void cMacroHandler::IncCurrentLine()
{
  m_FileInfoStack.top().IncLine();
}

void cMacroHandler::PushFileInfo(const char* strFile, int iLine)
{
  m_FileInfoStack.push(cFileInfo(strFile, iLine));
}

void cMacroHandler::PopFileInfo()
{
  m_FileInfoStack.pop();
}

const cFileInfo& cMacroHandler::GetFileInfo()
{
  return m_FileInfoStack.top();
}

IPreProcessorStatistics* cMacroHandler::Stats()
{
  return m_pStats;
}
