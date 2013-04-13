#ifndef CPPUNIT_ESTRING_H
#define CPPUNIT_ESTRING_H

#include <sstream>

namespace CppUnit {

  /// Create a string from a const char pointer
  inline std::string estring(const char *cstring)
  { return std::string (cstring); }
  
  /// Create a string from a string (for uniformities' sake)
  inline std::string estring(std::string& expandedString)
  { return expandedString; }

  /// Create a string from an int
  inline std::string estring(int number)
  { std::stringstream buffer; buffer << number; return buffer.str(); }

  /// Create a string from a long
  inline std::string estring(long number)
  { std::stringstream buffer; buffer << number; return buffer.str(); }

  /// Create a string from a double
  inline std::string estring(double number)
  { std::stringstream buffer; buffer << number; return buffer.str(); }

} // namespace CppUnit

#endif // CPPUNIT_ESTRING_H
