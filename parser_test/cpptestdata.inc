
tTestData sCPPTestData[] = 
{
  // types
  {
    {"bool char short int long float double wchar_t signed unsigned", NULL},
    10,
    true,
    {""},
    {TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, 
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, -1},
    {CPP_KW_TYPE_BOOL, CPP_KW_TYPE_CHAR, CPP_KW_TYPE_SHORT, CPP_KW_TYPE_INT, CPP_KW_TYPE_LONG, 
     CPP_KW_TYPE_FLOAT, CPP_KW_TYPE_DOUBLE, CPP_KW_TYPE_WCHAR_T, CPP_KW_TYPE_SIGNED, CPP_KW_TYPE_UNSIGNED}
  },
  // keywords
  {
    {"asm auto break case catch class const const_cast continue default delete do dynamic_cast else enum explicit export",
    "extern false for friend goto if inline mutable namespace new operator private protected public register",
    "reinterpret_cast return sizeof static static_cast struct switch template this throw true try typedef typeid typename",
    "union using virtual void volatile while", NULL}, 
    53,
    true,
    {""},
    {TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, 
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, 
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, 
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, 
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, 
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, 
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, 
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, -1},
    {CPP_KW_ASM, CPP_KW_AUTO, CPP_KW_BREAK, CPP_KW_CASE, CPP_KW_CATCH, CPP_KW_CLASS, CPP_KW_TYPE_CONST, CPP_KW_CONST_CAST, CPP_KW_CONTINUE,
     CPP_KW_DEFAULT, CPP_KW_DELETE, CPP_KW_DO, CPP_KW_DYNAMIC_CAST, CPP_KW_ELSE, CPP_KW_ENUM, CPP_KW_EXPLICIT, CPP_KW_EXPORT,
     CPP_KW_EXTERN, CPP_KW_FALSE, CPP_KW_FOR, CPP_KW_FRIEND, CPP_KW_GOTO, CPP_KW_IF, CPP_KW_INLINE, CPP_KW_MUTABLE, CPP_KW_NAMESPACE,
     CPP_KW_NEW, CPP_KW_OPERATOR, CPP_KW_PRIVATE, CPP_KW_PROTECTED, CPP_KW_PUBLIC, CPP_KW_REGISTER, 
     CPP_KW_REINTERPRET_CAST, CPP_KW_RETURN, CPP_KW_SIZEOF, CPP_KW_STATIC, CPP_KW_STATIC_CAST, CPP_KW_STRUCT, CPP_KW_SWITCH, CPP_KW_TEMPLATE,
     CPP_KW_THIS, CPP_KW_THROW, CPP_KW_TRUE, CPP_KW_TRY, CPP_KW_TYPEDEF, CPP_KW_TYPEID, CPP_KW_TYPENAME, 
     CPP_KW_UNION, CPP_KW_USING, CPP_KW_VIRTUAL, CPP_KW_TYPE_VOID, CPP_KW_VOLATILE, CPP_KW_WHILE}
  },
  // keywords C++11
  {
    {"alignas alignof char16_t char32_t constexpr decltype noexcept final nullptr override static_assert thread_local", NULL},
    12,
    true,
    {""},
    {TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD,
    TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD},
    {CPP_KW_11_ALIGNAS, CPP_KW_11_ALIGNOF, CPP_KW_11_CHAR16_T, CPP_KW_11_CHAR32_T, CPP_KW_11_CONSTEXPR, CPP_KW_11_DECLTYPE, 
     CPP_KW_11_NOEXCEPT, CPP_KW_11_FINAL, CPP_KW_11_NULLPTR, CPP_KW_11_OVERRIDE, CPP_KW_11_STATIC_ASSERT, CPP_KW_11_THREAD_LOCAL}
  },
  // assignment operators
  {
    {"= += -= *= /= %= &= |= ^= <<= >>=", NULL},
    11,
    true,
    {""},
    {TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR},
    {CPP_OP_ASSIGNMENT, CPP_OP_SUM_ASSIGNMENT, CPP_OP_DIFFERENCE_ASSIGNMENT, CPP_OP_PRODUCT_ASSIGNMENT, CPP_OP_QUOTIENT_ASSIGNMENT,
     CPP_OP_REMAINDER_ASSIGNMENT, CPP_OP_AND_ASSIGNMENT, CPP_OP_OR_ASSIGNMENT, CPP_OP_XOR_ASSIGNMENT, CPP_OP_SHIFT_LEFT_ASSIGNMENT,
     CPP_OP_SHIFT_RIGHT_ASSIGNMENT
    }
  },
  // arithmetic operators
  {
    {"+ - * / % ~ & | ^ << >> ++ --", NULL},
    13,
    true,
    {""},
    {TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR,
    TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR},
    {CPP_OP_ADDITION, CPP_OP_SUBTRACTION, CPP_OP_ASTERISK, CPP_OP_DIVIDE, CPP_OP_MODULUS, CPP_OP_COMPLEMENT, CPP_OP_BITWISE_AND, 
     CPP_OP_BITWISE_OR, CPP_OP_BITWISE_XOR, CPP_OP_SHIFT_LEFT, CPP_OP_SHIFT_RIGHT, CPP_OP_INCREMENT, CPP_OP_DECREMENT}
  },
  // logical and comparison operators
  {
    {"! && || == != < > <= >=", NULL},
    9,
    true,
    {""},
    {TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, 
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR},
    {CPP_OP_LOGICAL_NOT, CPP_OP_LOGICAL_AND, CPP_OP_LOGICAL_OR, CPP_OP_EQUAL, CPP_OP_NOT_EQUAL, 
     CPP_OP_SMALLER, CPP_OP_BIGGER, CPP_OP_SMALLER_OR_EQUAL, CPP_OP_BIGGER_OR_EQUAL}
  },
  // member access operators
  {
    {"[] -> . ->* .* ::", NULL},
    7,
    true,
    {""},
    {TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, 
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR},
    {CPP_OP_INDEX_OPEN, CPP_OP_INDEX_CLOSE, CPP_OP_POINTER, CPP_OP_MEMBER_ACCESS, 
     CPP_OP_POINTER_DEREFERNCE, CPP_OP_MEMBER_ACCESS_DEREFERENCE, CPP_OP_SCOPE}
  },
  // misc operators
  {
    {"?: ... , (){}", NULL}, 
    8, 
    true,
    {""},
    {TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_BLOCK_BEGIN, TOKEN_BLOCK_END},
    {CPP_OP_CONDITIONAL, CPP_OP_COLON, CPP_OP_ELLIPSIS, CPP_OP_LIST, CPP_OP_BRACKET_OPEN, CPP_OP_BRACKET_CLOSE, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN}
  },
  // integer literals with type suffix
  {
    {"1 2l 3u 4ul 5ll 6ull 2L 3U 4UL 5LL 6ULL", NULL}, 
    11,
    true,
    {"1", "2l", "3u", "4ul", "5ll", "6ull", "2L", "3U", "4UL", "5LL", "6ULL"},
    {TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL,
     TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL},
    {CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, 
     CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN}
  },
  // octal and hexadecimal
  {
    {"01 -07 0x1 0xabcd 0xFEDCBA", NULL}, 
    6,
    true,
    {"01", "", "07", "0x1", "0xabcd", "0xFEDCBA"},
    {TOKEN_LITERAL, TOKEN_OPERATOR, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL},
    {CPP_OP_UNKNOWN, CPP_OP_SUBTRACTION, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN}
  },
  // floating point numbers
  {
    {"1.23456e-65 .1E4f 58. 4e2 1.6e-19 6.02e23f 3.14159L", NULL}, 
    7,
    true,
    {"1.23456e-65", ".1E4f", "58.", "4e2", "1.6e-19", "6.02e23f", "3.14159L"},
    {TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL},
    {CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN}
  },
  // string literals
  {
    {"\"test\" \"two\nlines\" L\"wide chars\"",
     "\"multi\\",
     "line\"",
     "\"multiwrap 1st line\\",
     "second line\\",
     "third line\"",
     "\"\"",
     NULL},
    6,
    true,
    {"\"test\"", "\"two\nlines\"", "L\"wide chars\"", "\"multi\\\nline\"",
     "\"multiwrap 1st line\\\nsecond line\\\nthird line\"", "\"\""},
    {TOKEN_STRING, TOKEN_STRING, TOKEN_STRING, TOKEN_MULTILINE_STRING,
     TOKEN_MULTILINE_STRING, TOKEN_STRING},
    {CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN,
     CPP_OP_UNKNOWN}
  },
  // character literals
  {
    {"'a''b''\n' '\x20'", NULL}, 
    4,
    true,
    {"'a'", "'b'", "'\n'", "'\x20'"},
    {TOKEN_CHAR, TOKEN_CHAR, TOKEN_CHAR, TOKEN_CHAR},
    {CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN}
  },
  // preprocessor
  {
    {"#define xyz(a) fc(a)", 
     "#define wrap(x) 1st line \\",
     "second line",
     "#define multiwrap(x) 1st line \\",
     "second line \\",
     "third line",
      NULL}, 
    3,
    true,
    {"define xyz(a) fc(a)", "define wrap(x) 1st line \\\nsecond line",
     "define multiwrap(x) 1st line \\\nsecond line \\\nthird line"},
    {TOKEN_PREPROC, TOKEN_PREPROC, TOKEN_PREPROC},
    {CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN}
  },
  // Comments
  {
    {"//comment",
     "// comment //",
     "/*block comment*/",
     "///*block comment*/",
     "/*block comment",
     "two lines*/",
     "/*block comment",
     "three",
     "lines*/",
     "/*block comment*/ //line comment",
     "/**/ //", "/*", "*/",
     NULL},
    11,
    true,
    {"comment", " comment //", "block comment", "/*block comment*/", "block comment\ntwo lines",
     "block comment\nthree\nlines", "block comment", "line comment", "", "", "\n"},
    {TOKEN_LINECOMMENT, TOKEN_LINECOMMENT, TOKEN_COMMENT, TOKEN_LINECOMMENT, TOKEN_COMMENT, TOKEN_COMMENT,
     TOKEN_COMMENT, TOKEN_LINECOMMENT, TOKEN_COMMENT, TOKEN_LINECOMMENT, TOKEN_COMMENT},
    {CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, 
     CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN, CPP_OP_UNKNOWN}
  },
  // empty line
  {
    {"", NULL}, 0, false, {""}, {-1}, {-1}
  },
  // stopping entry
  {
    {NULL}, -1, false, {""}, {-1}, {-1}
  }
};
