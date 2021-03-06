
tTestData sPreprocessorTestData[] =
{
  // 23 __LINE__ in include
  {
    {
      ">test.h",
      "#ifndef TEST_H",
      "#define TEST_H",
      "//comment",
      "__LINE__;",
      "#endif",
      "<",
      "#include \"test.h\"",
      "__LINE__;",
      "-test.h",
      NULL
    }, 4, true, 
    {"4", "", "2", ""}, 
    {TOKEN_LITERAL, TOKEN_OPERATOR, TOKEN_LITERAL, TOKEN_OPERATOR, -1}, 
    {CPP_OP_UNKNOWN, CPP_OP_COMMAND_END, CPP_OP_UNKNOWN, CPP_OP_COMMAND_END}
  },
  // 1 ifdef
  {
    {
      "#define A",
      "#ifdef A",
      "ok",
      "#endif",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {CPP_OP_UNKNOWN}
  },
  // 2 if
  {
    {
      "#define A 1",
      "#if A==1",
      "ok",
      "#endif",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {CPP_OP_UNKNOWN}
  },
  // 3 ifndef
  {
    {
      "#ifndef NOT_DEFINED",
      "ok",
      "#endif",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {CPP_OP_UNKNOWN}
  },
  // 4 defined
  {
    {
      "#define A",
      "#if defined A",
      "ok",
      "#endif",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {CPP_OP_UNKNOWN}
  },
  // 5 ifdef/else/endif
  {
    {
      "#ifdef NOT_DEFINED",
      "not ok",
      "#else",
      "ok",
      "#endif",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {CPP_OP_UNKNOWN}
  },
  // 6 if defined()/else/endif
  {
    {
      "#if defined(NOT_DEFINED)",
      "not ok",
      "#else",
      "ok",
      "#endif",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {CPP_OP_UNKNOWN}
  },
  // 7 conditional define
  {
    {
      "#if defined(NOT_DEFINED)",
      "#define B",
      "#endif",
      "#ifndef B",
      "ok",
      "#endif",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {CPP_OP_UNKNOWN}
  },
  // 8 conditional undef
  {
    {
      "#define B",
      "#undef B",
      "#ifndef B",
      "ok",
      "#endif",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {CPP_OP_UNKNOWN}
  },
  // 9 nested ifdef
  {
    {
      "#define A",
      "#define B",
      "#ifdef A",
      "#ifdef B",
      "ok",
      "#endif",
      "#endif",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {CPP_OP_UNKNOWN}
  },
  // 10 nested ifdef with else
  {
    {
      "#define A",
      "#ifdef A",
      "#ifdef B",
      "not ok",
      "#else",
      "ok",
      "#endif",
      "#endif",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {CPP_OP_UNKNOWN}
  },
  // 11 elif
  {
    {
      "#define A",
      "#if defined(A)",
      "ok",
      "#elif B",
      "not ok",
      "#else",
      "not ok",
      "#endif",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {CPP_OP_UNKNOWN}
  },
  // 12 elif
  {
    {
      "#define A 3",
      "#if A==1",
      "not ok",
      "#elif A==2",
      "not ok",
      "#elif A==3",
      "ok",
      "#else",
      "not ok",
      "#endif",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {CPP_OP_UNKNOWN}
  },
  // 13 elif
  {
    {
      "#define A",
      "#define B",
      "#ifdef A",
      "# ifndef B",
      "not ok",
      "# else",
      "ok",
      "# endif",
      "#else",
      "not ok",
      "#endif",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {CPP_OP_UNKNOWN}
  },
  // 14
  {
    {
      "#ifndef A",
      "#define A 1",
      "#endif",
      "#ifdef A",
      "#undef A",
      "#define A 2",
      "#endif",
      "#if A==2",
      "ok",
      "#endif",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {CPP_OP_UNKNOWN}
  },
  // 15
  {
    {
      "#define A ok",
      "A;",
      NULL
    }, 2, true, {"ok"}, {TOKEN_LABEL, TOKEN_OPERATOR, -1}, {CPP_OP_UNKNOWN, CPP_OP_COMMAND_END}
  },
  // 16 concatenation
  {
    {
      "#define A(x,y) x##y",
      "A(o,k);",
      NULL
    }, 2, true, {"ok",""}, {TOKEN_LABEL, TOKEN_OPERATOR, -1}, {CPP_OP_UNKNOWN, CPP_OP_COMMAND_END}
  },
  // 17 stringification
  {
    {
      "#define A(x) #x",
      "A(ok);",
      NULL
    }, 2, true, {"\"ok\"",""}, {TOKEN_STRING, TOKEN_OPERATOR, -1}, {CPP_OP_UNKNOWN, CPP_OP_COMMAND_END}
  },
  // 18 include
  {
    {
      ">test.h",
      "#ifndef TEST_H",
      "#define TEST_H",
      "ok",
      "#endif",
      "<",
      "#include \"test.h\"",
      "-test.h",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {CPP_OP_UNKNOWN}
  },
  // 19 include same file twice
  {
    {
      ">test.h",
      "#ifndef TEST_H",
      "#define TEST_H",
      "ok",
      "#endif",
      "<",
      "#include \"test.h\"",
      "#include \"test.h\"",
      "-test.h",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {CPP_OP_UNKNOWN}
  },
  // 20 nested include
  {
    {
      ">test.h",
      "#ifndef TEST_H",
      "#define TEST_H",
      "ok",
      "#endif",
      "<",
      ">test2.h",
      "#include \"test.h\"",
      "<",
      "#include \"test2.h\"",
      "#ifdef TEST_H",
      "ok",
      "#endif",
      "-test.h",
      "-test2.h",
      NULL
    }, 2, true, {"ok", "ok"}, {TOKEN_LABEL, TOKEN_LABEL, -1}, {CPP_OP_UNKNOWN, CPP_OP_UNKNOWN}
  },
  // 21 __LINE__
  {
    {
      "__LINE__;",
      "__LINE__;",
      NULL
    }, 4, true, 
    {"1", "", "2", ""}, 
    {TOKEN_LITERAL, TOKEN_OPERATOR, TOKEN_LITERAL, TOKEN_OPERATOR, -1}, 
    {CPP_OP_UNKNOWN, CPP_OP_COMMAND_END, CPP_OP_UNKNOWN, CPP_OP_COMMAND_END}
  },
  // 22 __FILE__
  {
    {
      ">test.h",
      "__FILE__;",
      "<",
      "#include \"test.h\"",
      "-test.h",
      NULL
    }, 2, true, 
    {"\"test.h\"", ""}, 
    {TOKEN_STRING, TOKEN_OPERATOR, -1}, 
    {CPP_OP_UNKNOWN, CPP_OP_COMMAND_END}
  },
  // 23 __LINE__ in include
  {
    {
      ">test.h",
      "#ifndef TEST_H",
      "#define TEST_H",
      "//comment",
      "__LINE__;",
      "#endif",
      "<",
      "#include \"test.h\"",
      "__LINE__;",
      "-test.h",
      NULL
    }, 4, true, 
    {"4", "", "2", ""}, 
    {TOKEN_LITERAL, TOKEN_OPERATOR, TOKEN_LITERAL, TOKEN_OPERATOR, -1}, 
    {CPP_OP_UNKNOWN, CPP_OP_COMMAND_END, CPP_OP_UNKNOWN, CPP_OP_COMMAND_END}
  },
  // 24 pragma once
  {
    {
      ">test.h",
      "#pragma once",
      "ok;",
      "<",
      "#include \"test.h\"",
      "#include \"test.h\"",
      "-test.h",
      NULL
    }, 2, true, {"ok",""}, {TOKEN_LABEL, TOKEN_OPERATOR, -1}, {CPP_OP_UNKNOWN, CPP_OP_COMMAND_END}
  },
  // 25 #warning
  {
    {
      "#warning ok",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {PP_OP_UNKNOWN}
  },
  // 26 #error
  {
    {
      "#error ok",
      NULL
    }, 1, true, {"ok"}, {TOKEN_LABEL, -1}, {PP_OP_UNKNOWN}
  },
  // 27 #pragma with multi line parameter
  {
    {
      "#pragma warning(\"This is a long \\",
      "message!\")",
      NULL
    }, 0, true, {""}, {-1}, {PP_OP_UNKNOWN}
  },
  // 28 pragma once enclosed by #ifdef
  {
    {
      ">test.h",
      "#ifndef XXX",
      "#pragma once",
      "#endif",
      "ok;",
      "<",
      "#include \"test.h\"",
      "#include \"test.h\"",
      "-test.h",
      NULL
    }, 2, true, {"ok",""}, {TOKEN_LABEL, TOKEN_OPERATOR, -1}, {CPP_OP_UNKNOWN, CPP_OP_COMMAND_END}
  },
  // 29 nested ifdefs
  {
    {
      "#define X",
      "#ifdef A",
      "#ifdef X",
      "#define B",
      "#endif",
      "#else",
      "#define C",
      "#endif",
      "#ifdef B",
      "error;",
      "#endif",
      "#ifdef C",
      "ok;",
      "#endif",
      NULL
    }, 2, true, {"ok",""}, {TOKEN_LABEL, TOKEN_OPERATOR, -1}, {CPP_OP_UNKNOWN, CPP_OP_COMMAND_END}
  },
  // 30 nested else, output after last endif should be active
  {
    {
      "#ifdef A",
      "error;",
      "#else",
      "#ifdef B",
      "error;",
      "#else",
      "ok;",
      "#endif",
      "#endif",
      "ok;",
      NULL
    }, 4, true, {"ok","","ok",""}, {TOKEN_LABEL, TOKEN_OPERATOR, TOKEN_LABEL, TOKEN_OPERATOR, -1}, {CPP_OP_UNKNOWN, CPP_OP_COMMAND_END, CPP_OP_UNKNOWN, CPP_OP_COMMAND_END}
  },
  // 31 nested else, different if types, output after last endif should be active
  {
    {
      "#ifndef A",
      "#if !defined(A)",
      "#if B",
      "error;",
      "#else",
      "ok;",
      "#endif",
      "#endif",
      "#else",
      "#endif",
      "ok;",
      NULL
    }, 4, true, {"ok","","ok",""}, {TOKEN_LABEL, TOKEN_OPERATOR, TOKEN_LABEL, TOKEN_OPERATOR, -1}, {CPP_OP_UNKNOWN, CPP_OP_COMMAND_END, CPP_OP_UNKNOWN, CPP_OP_COMMAND_END}
  },
  // 32 pragma once in ifdefs
  {
    {
      ">test.h",
      "#if _MSC_VER > 1000",
      "#pragma once",
      "#endif",
      "<",
      "#define _MSC_VER 1400",
      "#include \"test.h\"",
      "ok;",
      "-test.h",
      NULL
    }, 2, true, {"ok",""}, {TOKEN_LABEL, TOKEN_OPERATOR, -1}, {CPP_OP_UNKNOWN, CPP_OP_COMMAND_END}
  },
  // 33 nested defines
  {
    {
      "#define Z 2",
      "#define Y Z",
      "#define X(n) ((n))",
      "#define RESULT X(Y)",
      "RESULT;",
      NULL
    },
    6,
    true,
    {"", "", "2", "", "", ""},
    {TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_LITERAL, TOKEN_OPERATOR, TOKEN_OPERATOR, TOKEN_OPERATOR, -1},
    {CPP_OP_BRACKET_OPEN, CPP_OP_BRACKET_OPEN, CPP_OP_UNKNOWN, CPP_OP_BRACKET_CLOSE, CPP_OP_BRACKET_CLOSE, CPP_OP_COMMAND_END}
  },
  // 34 __pragma
  {
    {
      "#define __pragma(x)",
      "__pragma(warning(disable: 5432));",
      NULL
    },
    1,
    true,
    {""},
    {TOKEN_OPERATOR, -1},
    {CPP_OP_COMMAND_END}
  },
  // 35 multiline define using block comments
  {
    {
      "#define TEST(x,y) (x /*",
      "*/ == y)",
      "TEST(1, 2);",
      NULL
    },
    6,
    true,
    {"", "1", "", "2", "", ""},
    {TOKEN_OPERATOR, TOKEN_LITERAL, TOKEN_OPERATOR, TOKEN_LITERAL, TOKEN_OPERATOR, TOKEN_OPERATOR, -1},
    {CPP_OP_BRACKET_OPEN, CPP_OP_UNKNOWN, CPP_OP_EQUAL, CPP_OP_UNKNOWN, CPP_OP_BRACKET_CLOSE, CPP_OP_COMMAND_END}
  },
  // stopping entry
  {
    {NULL}, -1, false, {""}, {-1}, {-1}
  }
};

