
tTestData sPPExpressionTestData[] =
{
  {
    {
      "#define A (5+5)",
      "#if A*2",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {20}, {}
  },
  {
    {"#if 1", NULL}, // expression
    4, // nbr of tokens
    true, // ignore whitespaces
    {""}, // not used
    {1}, // result
    {} // not used
  },
  {{"#if 1+1", NULL}, 6, true, {""}, {2}, {}},
  {{"#if 4-2", NULL}, 6, true, {""}, {2}, {}},
  {{"#if 1+1+3", NULL}, 8, true, {""}, {5}, {}},
  {{"#if 2+2*3", NULL}, 8, true, {""}, {8}, {}},
  {{"#if (2+2)*3", NULL}, 10, true, {""}, {12}, {}},
  {{"#if (2+2)*(3-1)", NULL}, 14, true, {""}, {8}, {}},
  {{"#if (2+2)/(3-1)", NULL}, 14, true, {""}, {2}, {}},
  {{"#if 2<<2", NULL}, 6, true, {""}, {8}, {}},
  {{"#if 7>>2", NULL}, 6, true, {""}, {1}, {}},
  {{"#if 2<<2>>1", NULL}, 8, true, {""}, {4}, {}},
  {{"#if 1&&1", NULL}, 6, true, {""}, {1}, {}},
  {{"#if 0&&1", NULL}, 6, true, {""}, {0}, {}},
  {{"#if 1&&0", NULL}, 6, true, {""}, {0}, {}},
  {{"#if 1&&1&&1", NULL}, 8, true, {""}, {1}, {}},
  {{"#if 1||1", NULL}, 6, true, {""}, {1}, {}},
  {{"#if 1||0", NULL}, 6, true, {""}, {1}, {}},
  {{"#if 0||1", NULL}, 6, true, {""}, {1}, {}},
  {{"#if 0||0", NULL}, 6, true, {""}, {0}, {}},
  {{"#if 0||0||1", NULL}, 8, true, {""}, {1}, {}},
  {{"#if 1&&1||0&&1", NULL}, 10, true, {""}, {1}, {}},
  {{"#if 1&&0||0&&1", NULL}, 10, true, {""}, {0}, {}},
  {{"#if 1||0&&1||0", NULL}, 10, true, {""}, {1}, {}},
  {{"#if !1", NULL}, 5, true, {""}, {0}, {}},
  {{"#if 1&3", NULL}, 6, true, {""}, {1}, {}},
  {{"#if 5&2", NULL}, 6, true, {""}, {0}, {}},
  {{"#if 7&5&3", NULL}, 8, true, {""}, {1}, {}},
  {{"#if 1^3", NULL}, 6, true, {""}, {2}, {}},
  {{"#if 3^3", NULL}, 6, true, {""}, {0}, {}},
  {{"#if 1^2^4", NULL}, 8, true, {""}, {7}, {}},
  {{"#if 3|6", NULL}, 6, true, {""}, {7}, {}},
  {{"#if 15|(15<<4)", NULL}, 10, true, {""}, {255}, {}},
  {{"#if 3&6|1&5", NULL}, 10, true, {""}, {3}, {}},
  {{"#if 5==3+2", NULL}, 8, true, {""}, {1}, {}},
  {{"#if 2*3==3+2", NULL}, 10, true, {""}, {0}, {}},
  {{"#if 2*3==4+2==7-6", NULL}, 14, true, {""}, {1}, {}},
  {{"#if 1!=2", NULL}, 6, true, {""}, {1}, {}},
  {{"#if -2", NULL}, 5, true, {""}, {-2}, {}},
  {{"#if -2+-1", NULL}, 8, true, {""}, {-3}, {}},
  {{"#if -(2-4)", NULL}, 9, true, {""}, {2}, {}},
  {{"#if 0xa", NULL}, 4, true, {""}, {10}, {}},
  {{"#if 0xFF", NULL}, 4, true, {""}, {255}, {}},
  {{"#if 0xaBcDeF", NULL}, 4, true, {""}, {0xaBcDeF}, {}},
  {{"#if 010", NULL}, 4, true, {""}, {8}, {}},
  {{"#if 0xa*0xa", NULL}, 6, true, {""}, {100}, {}},
  {{"#if 'A'", NULL}, 4, true, {""}, {65}, {}},
  {{"#if 'A'+' '", NULL}, 6, true, {""}, {97}, {}},
  {
    {
      "#define A 1",
      "#if A",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {1}, {}
  },
  {
    {
      "#define A 1",
      "#if A*2",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {2}, {}
  },
  {
    {
      "#define A (5+5)",
      "#if A*2",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {20}, {}
  },
  {
    {
      "#define A(x) (x*x)",
      "#if A(4)",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {16}, {}
  },
  {
    {
      "#define A(x,y) (x*y)",
      "#if A(2,3)",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {6}, {}
  },
  {
    {
      "#define A(a,b,c) (a*b*c)",
      "#if A((1+1),3,(8/2))",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {24}, {}
  },
  {
    {
      "#define A(a) (a*2)",
      "#define B(a) (a*3)",
      "#if A(2)+B(2)",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {10}, {}
  },
  {
    {
      "#define A 100",
      "#define B(a) (a*2)",
      "#if B(A)",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {200}, {}
  },
  {
    {
      "#define A(a) (a*2)",
      "#define X 5",
      "#if A(A(X))",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {20}, {}
  },
  {
    {
      "#if NOT_DEFINED_MACRO",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {0}, {}
  },
  {
    {
      "#define A",
      "#if defined(A)",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {1}, {}
  },
  {
    {
      "#if !defined(UNDEFINED_MACRO)",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {1}, {}
  },
  {
    {
      "#if defined(A) && defined B && !defined(((NOT_DEFINED)))",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {1}, {}
  },
  // stopping entry
  {
    {NULL}, -1, false, {""}, {-1}, {-1}
  }
};


//http://gcc.gnu.org/onlinedocs/gcc-3.0.1/cpp_4.html

