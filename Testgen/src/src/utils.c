#include<stdio.h>

void printTestCase(const char* filename, const char* testcase) {
  FILE* fp;
  if((fp = fopen(filename, "a"))==NULL) {
    fprintf(stderr, "Cannot open file: %s!", filename);
    exit(1);
  }
  fputs(testcase, fp);
  fclose(fp);
}
