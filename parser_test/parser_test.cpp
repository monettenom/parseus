// codebeau.cpp : Defines the entry point for the console application.
#include "stdafx.h"
#include "cpp_tokenprinter.h"
#include "time.h"

using namespace std;

int main(int argc, char* argv[])
{
  clock_t tStart = clock();
  int iTokens = 0;

  cCPPTokenPrinter tokenHandler;
  tokenHandler.Parse("test.cpp", "result.cpp");
  iTokens += tokenHandler.GetTokenCount();

  clock_t tTime = clock() - tStart;
  if (tTime == 0) tTime = 1;
  printf("time: %dms\n", tTime);
  printf("tokens: %d\n", iTokens);
  printf("tokens/ms: %d\n", iTokens / tTime);
  printf("us/token: %.4f\n", 1000.0f / ((float)iTokens / (float)tTime));

  return 0;
}
