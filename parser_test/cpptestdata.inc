
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
    {KW_TYPE_BOOL, KW_TYPE_CHAR, KW_TYPE_SHORT, KW_TYPE_INT, KW_TYPE_LONG, 
     KW_TYPE_FLOAT, KW_TYPE_DOUBLE, KW_TYPE_WCHAR_T, KW_TYPE_SIGNED, KW_TYPE_UNSIGNED}
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
    {KW_ASM, KW_AUTO, KW_BREAK, KW_CASE, KW_CATCH, KW_CLASS, KW_TYPE_CONST, KW_CONST_CAST, KW_CONTINUE,
     KW_DEFAULT, KW_DELETE, KW_DO, KW_DYNAMIC_CAST, KW_ELSE, KW_ENUM, KW_EXPLICIT, KW_EXPORT,
     KW_EXTERN, KW_FALSE, KW_FOR, KW_FRIEND, KW_GOTO, KW_IF, KW_INLINE, KW_MUTABLE, KW_NAMESPACE,
     KW_NEW, KW_OPERATOR, KW_PRIVATE, KW_PROTECTED, KW_PUBLIC, KW_REGISTER, 
     KW_REINTERPRET_CAST, KW_RETURN, KW_SIZEOF, KW_STATIC, KW_STATIC_CAST, KW_STRUCT, KW_SWITCH, KW_TEMPLATE,
     KW_THIS, KW_THROW, KW_TRUE, KW_TRY, KW_TYPEDEF, KW_TYPEID, KW_TYPENAME, 
     KW_UNION, KW_USING, KW_VIRTUAL, KW_TYPE_VOID, KW_VOLATILE, KW_WHILE}
  },
  // keywords C++11
  {
    {"alignas alignof char16_t char32_t constexpr decltype noexcept final nullptr override static_assert thread_local", NULL},
    12,
    true,
    {""},
    {TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD,
    TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD},
    {KW_11_ALIGNAS, KW_11_ALIGNOF, KW_11_CHAR16_T, KW_11_CHAR32_T, KW_11_CONSTEXPR, KW_11_DECLTYPE, 
     KW_11_NOEXCEPT, KW_11_FINAL, KW_11_NULLPTR, KW_11_OVERRIDE, KW_11_STATIC_ASSERT, KW_11_THREAD_LOCAL}
  },
  // assignment operators
  {
    {"= += -= *= /= %= &= |= ^= <<= >>=", NULL},
    11,
    true,
    {""},
    {TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR},
    {OP_ASSIGNMENT, OP_SUM_ASSIGNMENT, OP_DIFFERENCE_ASSIGNMENT, OP_PRODUCT_ASSIGNMENT, OP_QUOTIENT_ASSIGNMENT,
     OP_REMAINDER_ASSIGNMENT, OP_AND_ASSIGNMENT, OP_OR_ASSIGNMENT, OP_XOR_ASSIGNMENT, OP_SHIFT_LEFT_ASSIGNMENT,
     OP_SHIFT_RIGHT_ASSIGNMENT
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
    {OP_ADDITION, OP_SUBTRACTION, OP_ASTERISK, OP_DIVIDE, OP_MODULUS, OP_COMPLEMENT, OP_BITWISE_AND, 
     OP_BITWISE_OR, OP_BITWISE_XOR, OP_SHIFT_LEFT, OP_SHIFT_RIGHT, OP_INCREMENT, OP_DECREMENT}
  },
  // logical and comparison operators
  {
    {"! && || == != < > <= >=", NULL},
    9,
    true,
    {""},
    {TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, 
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR},
    {OP_LOGICAL_NOT, OP_LOGICAL_AND, OP_LOGICAL_OR, OP_EQUAL, OP_NOT_EQUAL, 
     OP_SMALLER, OP_BIGGER, OP_SMALLER_OR_EQUAL, OP_BIGGER_OR_EQUAL}
  },
  // member access operators
  {
    {"[] -> . ->* .* ::", NULL},
    7,
    true,
    {""},
    {TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, 
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR},
    {OP_INDEX_OPEN, OP_INDEX_CLOSE, OP_POINTER, OP_MEMBER_ACCESS, 
     OP_POINTER_DEREFERNCE, OP_MEMBER_ACCESS_DEREFERENCE, OP_SCOPE}
  },
  // misc operators
  {
    {"?: ... , (){}", NULL}, 
    8, 
    true,
    {""},
    {TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_BLOCK_BEGIN, TOKEN_BLOCK_END},
    {OP_CONDITIONAL, OP_COLON, OP_ELLIPSIS, OP_LIST, OP_BRACKET_OPEN, OP_BRACKET_CLOSE, OP_UNKNOWN, OP_UNKNOWN}
  },
  // alternative operators
  {
    {"and and_eq bitand bitor compl not not_eq or or_eq xor xor_eq", NULL}, 
    11,
    true,
    {""},
    {TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR},
    {OP_LOGICAL_AND, OP_AND_ASSIGNMENT, OP_BITWISE_AND, OP_BITWISE_OR, OP_COMPLEMENT, OP_LOGICAL_NOT,
     OP_NOT_EQUAL, OP_LOGICAL_OR, OP_OR_ASSIGNMENT, OP_BITWISE_XOR, OP_XOR_ASSIGNMENT}
  },
  // integer literals with type suffix
  {
    {"1 2l 3u 4ul 5ll 6ull 2L 3U 4UL 5LL 6ULL", NULL}, 
    11,
    true,
    {"1", "2l", "3u", "4ul", "5ll", "6ull", "2L", "3U", "4UL", "5LL", "6ULL"},
    {TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL,
     TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL},
    {OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, 
     OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN}
  },
  // octal and hexadecimal
  {
    {"01 -07 0x1 0xabcd 0xFEDCBA", NULL}, 
    6,
    true,
    {"01", "", "07", "0x1", "0xabcd", "0xFEDCBA"},
    {TOKEN_LITERAL, TOKEN_OPERATOR, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL},
    {OP_UNKNOWN, OP_SUBTRACTION, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN}
  },
  // floating point numbers
  {
    {"1.23456e-65 .1E4f 58. 4e2 1.6e-19 6.02e23f 3.14159L", NULL}, 
    7,
    true,
    {"1.23456e-65", ".1E4f", "58.", "4e2", "1.6e-19", "6.02e23f", "3.14159L"},
    {TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL, TOKEN_LITERAL},
    {OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN}
  },
  // string literals
  {
    {"\"test\" \"two\nlines\" L\"wide chars\"", 
     "\"multi\\",
     "line\"",
     "\"digraph-""?""?""/",
     "test\"",
     "\"multiwrap 1st line\\",
     "second line\\",
     "third line\"",
     NULL}, 
    6,
    true,
    {"\"test\"", "\"two\nlines\"", "L\"wide chars\"", "\"multi\\\nline\"", "\"digraph-""?""?""/""\ntest\"",
     "\"multiwrap 1st line\\\nsecond line\\\nthird line\""},
    {TOKEN_STRING, TOKEN_STRING, TOKEN_STRING, TOKEN_MULTILINE_STRING, TOKEN_MULTILINE_STRING, TOKEN_MULTILINE_STRING},
    {OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN}
  },
  // character literals
  {
    {"'a''b''\n' '\x20'", NULL}, 
    4,
    true,
    {"'a'", "'b'", "'\n'", "'\x20'"},
    {TOKEN_CHAR, TOKEN_CHAR, TOKEN_CHAR, TOKEN_CHAR},
    {OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN}
  },
  // preprocessor
  {
    {"#define xyz(a) fc(a)", 
     "#define wrap(x) 1st line \\",
     "second line",
     "#define multiwrap(x) 1st line \\",
     "second line ""?""?""/",
     "third line",
      NULL}, 
    3,
    true,
    {"define xyz(a) fc(a)", "define wrap(x) 1st line \\\nsecond line",
     "define multiwrap(x) 1st line \\\nsecond line ""?""?""/""\nthird line"},
    {TOKEN_PREPROC, TOKEN_PREPROC, TOKEN_PREPROC},
    {OP_UNKNOWN, OP_UNKNOWN, OP_UNKNOWN}
  },
  // digraphs
  {
    {"<% %> <: :> %:define x y", NULL}, 
    5,
    true,
    {"", "", "", "", "define x y"},
    {TOKEN_BLOCK_BEGIN, TOKEN_BLOCK_END, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_PREPROC},
    {OP_UNKNOWN, OP_UNKNOWN, OP_INDEX_OPEN, OP_INDEX_CLOSE, OP_UNKNOWN}
  },
  // trigraphs
  {
    {"??< ??> ??( ??) ??' ??! ??- ??=", // '??/' is equivalent to \ and is tested with macros and strings
      NULL},
    8,
    true,
    {"", "", "", "", "", "", "", ""},
    {TOKEN_BLOCK_BEGIN, TOKEN_BLOCK_END, TOKEN_OPERATOR, TOKEN_OPERATOR, 
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_PREPROC},
    {OP_UNKNOWN, OP_UNKNOWN, OP_INDEX_OPEN, OP_INDEX_CLOSE, 
     OP_BITWISE_XOR, OP_BITWISE_OR, OP_COMPLEMENT, OP_UNKNOWN}
  },
  // stopping entry
  {
    {NULL}, -1, false, {""}, {-1}, {-1}
  }
};
