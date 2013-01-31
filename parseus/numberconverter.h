#ifndef NUMBERCONVERTER_H
#define NUMBERCONVERTER_H

enum eNumberType
{
  NUMTYPE_UNKNOWN,
  NUMTYPE_BOOL,
  NUMTYPE_INT8,
  NUMTYPE_UINT8,
  NUMTYPE_INT16,
  NUMTYPE_UINT16,
  NUMTYPE_INT32,
  NUMTYPE_UINT32,
  NUMTYPE_INT64,
  NUMTYPE_UINT64,
  NUMTYPE_FLOAT,
  NUMTYPE_DOUBLE
};

class cNumber
{
public:
  cNumber(): m_Type(NUMTYPE_UNKNOWN), m_uValue(0){}
  cNumber(bool bValue): m_Type(NUMTYPE_BOOL), m_uValue(bValue){}
  cNumber(signed char i8Value): m_Type(NUMTYPE_INT8), m_iValue(i8Value){}
  cNumber(unsigned char u8Value): m_Type(NUMTYPE_UINT8), m_uValue(u8Value){}
  cNumber(signed short i16Value): m_Type(NUMTYPE_INT16), m_iValue(i16Value){}
  cNumber(unsigned short u16Value): m_Type(NUMTYPE_UINT16), m_uValue(u16Value){}
  cNumber(signed long i32Value): m_Type(NUMTYPE_INT32), m_iValue(i32Value){}
  cNumber(unsigned long u32Value): m_Type(NUMTYPE_UINT32), m_uValue(u32Value){}
  cNumber(signed __int64 i64Value): m_Type(NUMTYPE_INT64), m_iValue(i64Value){}
  cNumber(unsigned __int64 u64Value): m_Type(NUMTYPE_UINT64), m_uValue(u64Value){}
  cNumber(float fValue): m_Type(NUMTYPE_FLOAT), m_dValue(fValue){}
  cNumber(double dValue): m_Type(NUMTYPE_DOUBLE), m_dValue(dValue){}

  cNumber& operator=(bool bValue){m_Type = NUMTYPE_BOOL; m_uValue = bValue;}
  cNumber& operator=(signed char i8Value){m_Type = NUMTYPE_INT8; m_iValue = i8Value;}
  cNumber& operator=(unsigned char u8Value){m_Type = NUMTYPE_UINT8; m_uValue = u8Value;}
  cNumber& operator=(signed short i16Value){m_Type = NUMTYPE_INT16; m_iValue = i16Value;}
  cNumber& operator=(unsigned short u16Value){m_Type = NUMTYPE_UINT16; m_uValue = u16Value;}
  cNumber& operator=(signed long i32Value){m_Type = NUMTYPE_INT32; m_iValue = i32Value;}
  cNumber& operator=(unsigned long u32Value){m_Type = NUMTYPE_UINT32; m_uValue = u32Value;}
  cNumber& operator=(signed __int64 i64Value){m_Type = NUMTYPE_INT64; m_iValue = i64Value;}
  cNumber& operator=(unsigned __int64 u64Value){m_Type = NUMTYPE_UINT64; m_uValue = u64Value;}
  cNumber& operator=(float fValue){m_Type = NUMTYPE_FLOAT; m_dValue = fValue;}
  cNumber& operator=(double dValue){m_Type = NUMTYPE_DOUBLE; m_dValue = dValue;}

  eNumberType GetType(){return m_Type;}

  bool AsBool()
  {
    switch(m_Type)
    {
    case NUMTYPE_BOOL: return (bool)m_uValue;
    case NUMTYPE_INT8: return (signed char)m_iValue;
    case NUMTYPE_UINT8: return (unsigned char)m_uValue;
    }
  }

  cNumber& operator+(const cNumber& nbrValue)
  {
    eNumberType nbrType = (m_Type > nbrValue.m_Type) ? m_Type : nbrValue.m_Type;
  }

private:
  eNumberType m_Type;
  union
  {
    signed __int64 m_iValue;
    unsigned __int64 m_uValue;
    double m_dValue;
  };
};



#endif //NUMBERCONVERTER_H