
tTestData sPPTestData[] =
{
  // keywords
  {
    {"#include include_next import define undef ifdef ifndef if defined else",
     "#elif endif error warning line pragma ident sccs assert unassert",
     NULL},
    24,
    true,
    {""},
    {TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD,
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD,
     TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_OPERATOR, -1},
    {PP_OP_PREPROC, PP_KW_INCLUDE, PP_KW_INCLUDE_NEXT, PP_KW_IMPORT, PP_KW_DEFINE, PP_KW_UNDEF,
     PP_KW_IFDEF, PP_KW_IFNDEF, PP_KW_IF, PP_KW_DEFINED, PP_KW_ELSE, PP_OP_PREPROC_END,
     PP_OP_PREPROC, PP_KW_ELIF, PP_KW_ENDIF, PP_KW_ERROR, PP_KW_WARNING, PP_KW_LINE,
     PP_KW_PRAGMA, PP_KW_IDENT, PP_KW_SCCS, PP_KW_ASSERT, PP_KW_UNASSERT, PP_OP_PREPROC_END}
  },
  // operators
  {
    {"# # ( , ) ## ...",
     "# + - * / % ! && || & | ^ ~ == != < <= > >= << >>",
     NULL},
    30,
    true,
    {""},
    {TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_OPERATOR,
     -1},
    {PP_OP_PREPROC, PP_OP_STRINGIFICATION, PP_OP_BRACKET_OPEN, PP_OP_COMMA, PP_OP_BRACKET_CLOSE,
     PP_OP_CONCATENATION, PP_OP_ELLIPSIS, PP_OP_PREPROC_END,
     PP_OP_PREPROC, PP_OP_ADDITION, PP_OP_SUBTRACTION, PP_OP_MULTIPLICATION, PP_OP_DIVISION,
     PP_OP_MODULUS, PP_OP_LOGICAL_NOT, PP_OP_LOGICAL_AND, PP_OP_LOGICAL_OR, PP_OP_BITWISE_AND,
     PP_OP_BITWISE_OR, PP_OP_BITWISE_XOR, PP_OP_BITWISE_NOT, PP_OP_EQUAL, PP_OP_NOT_EQUAL,
     PP_OP_SMALLER, PP_OP_SMALLER_OR_EQUAL, PP_OP_BIGGER, PP_OP_BIGGER_OR_EQUAL, PP_OP_SHL,
     PP_OP_SHR, PP_OP_PREPROC_END
    }
  },
  // object-like macro
  {
    {"#define MAX 1024",
     " #define MAX 1024",
     "# define MAX 1024",
     NULL},
    23,
    false,
    {"", "", " ", "MAX", " ", "1024", "", 
     " ", "", "", " ", "MAX", " ", "1024", "",
     "", " ", "", " ", "MAX", " ", "1024", ""
    },
    {TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_WHITESPACE, TOKEN_LABEL, TOKEN_WHITESPACE, TOKEN_LITERAL, TOKEN_OPERATOR,
     TOKEN_WHITESPACE, TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_WHITESPACE, TOKEN_LABEL, TOKEN_WHITESPACE, TOKEN_LITERAL, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_WHITESPACE, TOKEN_KEYWORD, TOKEN_WHITESPACE, TOKEN_LABEL, TOKEN_WHITESPACE, TOKEN_LITERAL, TOKEN_OPERATOR,
     -1},
    {PP_OP_PREPROC, PP_KW_DEFINE, PP_KW_UNKNOWN, PP_KW_UNKNOWN, PP_KW_UNKNOWN, PP_KW_UNKNOWN, PP_OP_PREPROC_END,
     PP_KW_UNKNOWN, PP_OP_PREPROC, PP_KW_DEFINE, PP_KW_UNKNOWN, PP_KW_UNKNOWN, PP_KW_UNKNOWN, PP_KW_UNKNOWN, PP_OP_PREPROC_END,
     PP_OP_PREPROC, PP_KW_UNKNOWN, PP_KW_DEFINE, PP_KW_UNKNOWN, PP_KW_UNKNOWN, PP_KW_UNKNOWN, PP_KW_UNKNOWN, PP_OP_PREPROC_END
    }
  },
  // line comment 1
  {
    {"// #define MAX 1024", NULL}, 0, false, {""}, {}, {}
  },
  // line comment 2
  {
    {"#define MAX 1024 // any comment", NULL},
    5,
    true,
    {"", "", "MAX", "1024", ""},
    {TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_LABEL, TOKEN_LITERAL, TOKEN_OPERATOR},
    {PP_OP_PREPROC, PP_KW_DEFINE, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_PREPROC_END}
  },
  // wrapped line comment
  {
    {"#define a 1 //wrap\\", "line", NULL},
    5,
    true,
    {"", "", "a", "1", ""},
    {TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_LABEL, TOKEN_LITERAL, TOKEN_OPERATOR, -1},
    {PP_OP_PREPROC, PP_KW_DEFINE, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_PREPROC_END}
  },
  // block comment within a line
  {
    {"#define MAX (1<</*shl*/10)/*1024*/",
     NULL},
     9,
     true,
     {"", "", "MAX", "", "1", "", "10", "", ""},
     {TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_LABEL, TOKEN_OPERATOR, TOKEN_LITERAL,
      TOKEN_OPERATOR, TOKEN_LITERAL, TOKEN_OPERATOR, TOKEN_OPERATOR, -1},
     {PP_OP_PREPROC, PP_KW_DEFINE, PP_OP_UNKNOWN, PP_OP_BRACKET_OPEN, PP_OP_UNKNOWN,
      PP_OP_SHL, PP_OP_UNKNOWN, PP_OP_BRACKET_CLOSE, PP_OP_PREPROC_END}
  },
  // block comment multiple lines
  {
    {"#define MAX /* this is",
     "a multiline comment",
     "*/ 1024", 
     NULL},
     5,
     true,
     {"", "", "MAX", "1024", ""},
     {TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_LABEL, TOKEN_LITERAL, TOKEN_OPERATOR},
     {PP_OP_PREPROC, PP_KW_DEFINE, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_PREPROC_END}
  },
  // multiline commands
  {
    {"#define MAX\\", "1024"},
    5,
    true,
    {"", "", "MAX", "1024", ""},
    {TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_LABEL, TOKEN_LITERAL, TOKEN_OPERATOR},
    {PP_OP_PREPROC, PP_KW_DEFINE, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_PREPROC_END}
  },
  // whitespace reduction
  {
    {"#  define  MAX\t1024\t ",
     NULL},
    8,
    false,
    {"", " ", "", " ", "MAX", " ", "1024", ""},
    {TOKEN_OPERATOR, TOKEN_WHITESPACE, TOKEN_KEYWORD, TOKEN_WHITESPACE, TOKEN_LABEL, TOKEN_WHITESPACE, TOKEN_LITERAL, TOKEN_OPERATOR},
    {PP_OP_PREPROC, PP_KW_UNKNOWN, PP_KW_DEFINE, PP_KW_UNKNOWN, PP_KW_UNKNOWN, PP_KW_UNKNOWN, PP_KW_UNKNOWN, PP_OP_PREPROC_END}
  },
  // normal code
  {
    {"int a=1;",
     "int define();",
     NULL},
     12,
     false,
     {"int", " ", "a", "=", "1", ";",
      "int", " ", "define", "(", ")", ";"},
     {TOKEN_LABEL, TOKEN_WHITESPACE, TOKEN_LABEL, TOKEN_CHAR, TOKEN_LITERAL, TOKEN_CHAR,
      TOKEN_LABEL, TOKEN_WHITESPACE, TOKEN_LABEL, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_CHAR, -1},
     {PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN,
      PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_BRACKET_OPEN, PP_OP_BRACKET_CLOSE, PP_OP_UNKNOWN}
  },
  // strings and multiline strings
  {
    {"\"test\"",
     "\"multi\\","line\"",
     "\"multi\\","line\\","string\"",
     "'c'", "'\"'",
     NULL},
     5,
     true,
     {"\"test\"", "\"multiline\"", "\"multilinestring\"", "'c'", "'\"'"},
     {TOKEN_STRING, TOKEN_STRING, TOKEN_STRING, TOKEN_STRING, TOKEN_STRING},
     {PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN}
  },
  // include
  {
    {"#include \"test.h\"",
     "#include <test>",
     "#include SYSTEM_H",
     "#define SYSTEM_H <system.h>",
     NULL},
     21,
     true,
     {"", "", "\"test.h\"", "",
      "", "", "<test>", "",
      "", "", "SYSTEM_H", "",
      "", "", "SYSTEM_H", "", "system", ".", "h", "", ""},
     {TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_STRING, TOKEN_OPERATOR,
      TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_STRING, TOKEN_OPERATOR,
      TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_LABEL, TOKEN_OPERATOR,
      TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_LABEL, TOKEN_OPERATOR, TOKEN_LABEL, TOKEN_CHAR, TOKEN_LABEL, TOKEN_OPERATOR, TOKEN_OPERATOR, -1},
     {PP_OP_PREPROC, PP_KW_INCLUDE, PP_OP_UNKNOWN, PP_OP_PREPROC_END,
      PP_OP_PREPROC, PP_KW_INCLUDE, PP_OP_UNKNOWN, PP_OP_PREPROC_END,
      PP_OP_PREPROC, PP_KW_INCLUDE, PP_OP_UNKNOWN, PP_OP_PREPROC_END,
      PP_OP_PREPROC, PP_KW_DEFINE, PP_OP_UNKNOWN, PP_OP_SMALLER, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_BIGGER, PP_OP_PREPROC_END}
  },
  // function-like macros
  {
    {"#define inc(a) a++", NULL},
    10,
    true,
    {"", "", "inc", "", "a", "", "a", "", "", ""},
    {TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_LABEL, TOKEN_OPERATOR, TOKEN_LABEL, TOKEN_OPERATOR, TOKEN_LABEL, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR},
    {PP_OP_PREPROC, PP_KW_DEFINE, PP_OP_UNKNOWN, PP_OP_BRACKET_OPEN, PP_OP_UNKNOWN, PP_OP_BRACKET_CLOSE, PP_OP_UNKNOWN, PP_OP_ADDITION, PP_OP_ADDITION, PP_OP_PREPROC_END}
  },
  // more complex function like macro
  {
    {"#define make_list(varname, type, ...) type varname[] = {__VA_ARGS__, (type)-1}",
     NULL},
    25,
    true,
    {"", "", "make_list", "", "varname", "", "type", "", "", "", "type", "varname", "[", "]", "=", "{", "__VA_ARGS__", "", "", "type", "", "-", "1", "}", ""},
    {TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_LABEL, TOKEN_OPERATOR, TOKEN_LABEL, TOKEN_OPERATOR, TOKEN_LABEL,
     TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_LABEL, TOKEN_LABEL, TOKEN_CHAR, TOKEN_CHAR,
     TOKEN_CHAR, TOKEN_CHAR, TOKEN_LABEL, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_LABEL, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_LITERAL, TOKEN_CHAR, TOKEN_OPERATOR, -1},
    {PP_OP_PREPROC, PP_KW_DEFINE, PP_OP_UNKNOWN, PP_OP_BRACKET_OPEN, PP_OP_UNKNOWN, PP_OP_COMMA, PP_OP_UNKNOWN,
     PP_OP_COMMA, PP_OP_ELLIPSIS, PP_OP_BRACKET_CLOSE, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN,
     PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_COMMA, PP_OP_BRACKET_OPEN, PP_OP_UNKNOWN, PP_OP_BRACKET_CLOSE,
     PP_OP_SUBTRACTION, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_PREPROC_END}
  },
  // stringification
  {
    {"#define MK_STRING(string) #string", NULL},
    9,
    true,
    {"", "", "MK_STRING", "", "string", "", "", "string", ""},
    {TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_LABEL, TOKEN_OPERATOR, TOKEN_LABEL, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_LABEL, TOKEN_OPERATOR, -1},
    {PP_OP_PREPROC, PP_KW_DEFINE, PP_OP_UNKNOWN, PP_OP_BRACKET_OPEN, PP_OP_UNKNOWN, PP_OP_BRACKET_CLOSE,
     PP_OP_STRINGIFICATION, PP_OP_UNKNOWN, PP_OP_PREPROC_END}
  },
  // concatenation
  {
    {"#define CONCAT(a, b) a##b", NULL},
    12,
    true,
    {"", "", "CONCAT", "", "a", "", "b", "", "a", "", "b", ""},
    {TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_LABEL, TOKEN_OPERATOR, TOKEN_LABEL, TOKEN_OPERATOR, TOKEN_LABEL, TOKEN_OPERATOR,
     TOKEN_LABEL, TOKEN_OPERATOR, TOKEN_LABEL, TOKEN_OPERATOR},
    {PP_OP_PREPROC, PP_KW_DEFINE, PP_OP_UNKNOWN, PP_OP_BRACKET_OPEN, PP_OP_UNKNOWN, PP_OP_COMMA, PP_OP_UNKNOWN, PP_OP_BRACKET_CLOSE,
     PP_OP_UNKNOWN, PP_OP_CONCATENATION, PP_OP_UNKNOWN, PP_OP_PREPROC_END}
  },
  // conditionals
  {
    {"#ifdef MACRO", "#ifndef MACRO", "#endif",
     NULL},
    11,
    true,
    {"", "", "MACRO", "",
     "", "", "MACRO", "",
     "", "", ""},
    {TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_LABEL, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_LABEL, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_OPERATOR, -1},
    {PP_OP_PREPROC, PP_KW_IFDEF, PP_OP_UNKNOWN, PP_OP_PREPROC_END,
     PP_OP_PREPROC, PP_KW_IFNDEF, PP_OP_UNKNOWN, PP_OP_PREPROC_END,
     PP_OP_PREPROC, PP_KW_ENDIF, PP_OP_PREPROC_END}
  },
  // defined and expression
  {
    {"#if defined(X) || defined(Y)",
     NULL},
    12,
    true,
    {"", "", "", "", "X", "", "", "", "", "Y", "", ""},
    {TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_KEYWORD, TOKEN_OPERATOR, TOKEN_LABEL, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_OPERATOR, TOKEN_LABEL, TOKEN_OPERATOR, TOKEN_OPERATOR,
     -1},
    {PP_OP_PREPROC, PP_KW_IF, PP_KW_DEFINED, PP_OP_BRACKET_OPEN, PP_OP_UNKNOWN, PP_OP_BRACKET_CLOSE,
     PP_OP_LOGICAL_OR, PP_KW_DEFINED, PP_OP_BRACKET_OPEN, PP_OP_UNKNOWN, PP_OP_BRACKET_CLOSE, PP_OP_PREPROC_END}
  },
  // line
  {
    {"#line 20 \"vector\"", NULL},
    5,
    true,
    {"", "", "20", "\"vector\"", ""},
    {TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_LITERAL, TOKEN_STRING, TOKEN_OPERATOR},
    {PP_OP_PREPROC, PP_KW_LINE, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_PREPROC_END}
  },
  // diagnostics
  {
    {"#error \"error\"",
     "#warning \"warning\"",
     NULL},
    8,
    true,
    {"", "", "\"error\"", "",
     "", "", "\"warning\"", "",},
    {TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_STRING, TOKEN_OPERATOR,
     TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_STRING, TOKEN_OPERATOR,
     -1},
    {PP_OP_PREPROC, PP_KW_ERROR, PP_OP_UNKNOWN, PP_OP_PREPROC_END,
     PP_OP_PREPROC, PP_KW_WARNING, PP_OP_UNKNOWN, PP_OP_PREPROC_END}
  },
  // digraphs
  {
    {"<% %> <: :> %:", NULL},
    5,
    true,
    {"{", "}", "[", "]", "#"},
    {TOKEN_CHAR, TOKEN_CHAR, TOKEN_CHAR, TOKEN_CHAR, TOKEN_CHAR, -1},
    {PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN}
  },
  // trigraphs
  {
    {"??""<"" ??"">"" ??""("" ??"")"" ??""'"" ??""!"" ??""-"" ??""="" ??""/ ?? ?", NULL},
    11,
    true,
    {"{", "}", "[", "]", "^", "|", "~", "#", "\\", "??", "?"},
    {TOKEN_CHAR, TOKEN_CHAR, TOKEN_CHAR, TOKEN_CHAR, TOKEN_CHAR, TOKEN_CHAR, TOKEN_CHAR,
     TOKEN_CHAR, TOKEN_CHAR, TOKEN_TEXT, TOKEN_CHAR, -1},
    {PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN,
     PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN, PP_OP_UNKNOWN}
  },
  // expressions (bug: "1+1" results in "1+" "1"
  {
    {"#if 1+1", NULL},
    6,
    true,
    {"", "", "1", "", "1", ""},
    {TOKEN_OPERATOR, TOKEN_KEYWORD, TOKEN_LITERAL, TOKEN_OPERATOR, TOKEN_LITERAL, TOKEN_OPERATOR, -1},
    {PP_OP_PREPROC, PP_KW_IF, PP_OP_UNKNOWN, PP_OP_ADDITION, PP_OP_UNKNOWN, PP_OP_PREPROC_END}
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


