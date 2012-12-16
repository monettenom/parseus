
tTestData sPasTestData[] = 
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
  // stopping entry
  {
    {NULL}, -1, false, {""}, {-1}, {-1}
  }
};
