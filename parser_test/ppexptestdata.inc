
tTestData sPPExpressionTestData[] =
{
  {
    {
      "#define C (5+5)",
      "#if C*2",
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
  { {"#if 1+1", NULL}, 6, true, {""}, {2}, {}},
  { {"#if 4-2", NULL}, 6, true, {""}, {2}, {}},
  { {"#if 1+1+3", NULL}, 8, true, {""}, {5}, {}},
  { {"#if 2+2*3", NULL}, 8, true, {""}, {8}, {}},
  { {"#if (2+2)*3", NULL}, 10, true, {""}, {12}, {}},
  { {"#if (2+2)*(3-1)", NULL}, 14, true, {""}, {8}, {}},
  { {"#if (2+2)/(3-1)", NULL}, 14, true, {""}, {2}, {}},
  { {"#if 2<<2", NULL}, 6, true, {""}, {8}, {}},
  { {"#if 7>>2", NULL}, 6, true, {""}, {1}, {}},
  { {"#if 2<<2>>1", NULL}, 8, true, {""}, {4}, {}},
  { {"#if 1&&1", NULL}, 6, true, {""}, {1}, {}},
  { {"#if 0&&1", NULL}, 6, true, {""}, {0}, {}},
  { {"#if 1&&0", NULL}, 6, true, {""}, {0}, {}},
  { {"#if 1&&1&&1", NULL}, 8, true, {""}, {1}, {}},
  { {"#if 1||1", NULL}, 6, true, {""}, {1}, {}},
  { {"#if 1||0", NULL}, 6, true, {""}, {1}, {}},
  { {"#if 0||1", NULL}, 6, true, {""}, {1}, {}},
  { {"#if 0||0", NULL}, 6, true, {""}, {0}, {}},
  { {"#if 0||0||1", NULL}, 8, true, {""}, {1}, {}},
  { {"#if 1&&1||0&&1", NULL}, 10, true, {""}, {1}, {}},
  { {"#if 1&&0||0&&1", NULL}, 10, true, {""}, {0}, {}},
  { {"#if 1||0&&1||0", NULL}, 10, true, {""}, {1}, {}},
  { {"#if !1", NULL}, 5, true, {""}, {0}, {}},
  { {"#if 1&3", NULL}, 6, true, {""}, {1}, {}},
  { {"#if 5&2", NULL}, 6, true, {""}, {0}, {}},
  { {"#if 7&5&3", NULL}, 8, true, {""}, {1}, {}},
  { {"#if 1^3", NULL}, 6, true, {""}, {2}, {}},
  { {"#if 3^3", NULL}, 6, true, {""}, {0}, {}},
  { {"#if 1^2^4", NULL}, 8, true, {""}, {7}, {}},
  { {"#if 3|6", NULL}, 6, true, {""}, {7}, {}},
  { {"#if 15|(15<<4)", NULL}, 10, true, {""}, {255}, {}},
  { {"#if 3&6|1&5", NULL}, 10, true, {""}, {3}, {}},
  { {"#if 5==3+2", NULL}, 8, true, {""}, {1}, {}},
  { {"#if 2*3==3+2", NULL}, 10, true, {""}, {0}, {}},
  { {"#if 2*3==4+2==7-6", NULL}, 14, true, {""}, {1}, {}},
  { {"#if 1!=2", NULL}, 6, true, {""}, {1}, {}},
  { {"#if -2", NULL}, 5, true, {""}, {-2}, {}},
  { {"#if -2+-1", NULL}, 8, true, {""}, {-3}, {}},
  { {"#if -(2-4)", NULL}, 9, true, {""}, {2}, {}},
  {
    {
      "#define A 1",
      "#if A",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {1}, {}
  },
  {
    {
      "#define B 1",
      "#if B*2",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {2}, {}
  },
  {
    {
      "#define C (5+5)",
      "#if C*2",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {20}, {}
  },
  {
    {
      "#define D(x) (x*x)",
      "#if D(4)",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {16}, {}
  },
  {
    {
      "#define E(x,y) (x*y)",
      "#if E(2,3)",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {6}, {}
  },
  {
    {
      "#define F(a,b,c) (a*b*c)",
      "#if F((1+1),3,(8/2))",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {24}, {}
  },
  {
    {
      "#define G(a) (a*2)",
      "#define H(a) (a*2)",
      "#if G(2)+H(3)",
      NULL
    }, IGNORE_TOKEN_COUNT, true, {""}, {10}, {}
  },  
  // stopping entry
  {
    {NULL}, -1, false, {""}, {-1}, {-1}
  }
};


