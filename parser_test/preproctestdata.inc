
tTestData sPreprocessorTestData[] =
{
  {
    {
      "#define A 1", 
      "#if A==1",
      "x",
      "#endif",
      NULL
    },
    1,
    true,
    {"x"},
    {TOKEN_LABEL, -1},
    {CPP_OP_UNKNOWN}
  },
  {
    {
      "#ifdef A",
      "x",
      "#endif",
      NULL
    },
    1,
    true,
    {"x"},
    {TOKEN_LABEL, -1},
    {CPP_OP_UNKNOWN}
  },  
  {
    {
      "#ifndef NOT_DEFINED",
      "x",
      "#endif",
      NULL
    },
    1,
    true,
    {"x"},
    {TOKEN_LABEL, -1},
    {CPP_OP_UNKNOWN}
  },  
  // stopping entry
  {
    {NULL}, -1, false, {""}, {-1}, {-1}
  }
};

