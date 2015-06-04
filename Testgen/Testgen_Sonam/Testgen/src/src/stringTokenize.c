#include "stringTokenize.h"
#include<stdlib.h>

int isWhiteSpace(const char c) {
  if (c == 0)
    return 0;
  return c == 32 || c == 9;
}

int isOperator(const char c) {
  if (c == 0)
    return 0;
  return strchr("&|<>=+-/*%^!", c) != 0;
}

int isNotOperator(const char c) {
  if (c == 0)
    return 0;
  return strchr("&|<>=+-/*%^!()", c) != 0;
}

int isAlpha(const char c) {
  if (c == 0)
    return 0;
  return strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZ_", toupper(c)) != 0;
}

int isDigitDot(const char c) {
  if (c == 0)
    return 0;
  return strchr("0123456789.", c) != 0;
}

int isDigit(const char c) {
  if (c == 0)
    return 0;
  return strchr("0123456789", c) != 0;
}

char *getNextToken(const char *str, int *pos, int length) {
  int i = 0;
  char *res;
  int countPars = 0;
  res = (char *)malloc(length + 1);

  while (isWhiteSpace(*str)) {
    res[i] = *str;
    str++;
    (*pos)++;
    i++;
    res[i] = '\0';
    token_type = DELIMETER;
    return res;
  }

  if (*str == '#') {
    while (*str == '#') {
      res[i] = *str;
      str++;
      (*pos)++;
      i++;
    }
    res[i] = '\0';
    token_type = DELIMETER;
    return res;
  }

  while (*str == '\n') {
    str++;
    (*pos)++;
  }

  if (*str == '\0') {
    return NULL;
  }

  if (*str == '(' || *str == ')') {

    res[i] = *str;
    str++;
    (*pos)++;
    i++;
    res[i] = '\0';
    token_type = DELIMETER;
    return res;
  }

  if (*str == '*' && *(str + 1) == '(' )	//check if variable is Array accesed as pointer
    {
      while (1) {
        res[i] = *str;

     if(*str == ')')
           countPars--;


        str++;

       if(*str == '(')
          countPars++;
       
        (*pos)++;
        i++;
        token_type = ARRAY1;
        if (countPars == 0)
          break;
      }
      res[i] = '\0';

      return res;
    }

  if (*str == '*' && *(str + 1) != ' ')	//check if variable is pointer
    {
      while (*str == '*') {
        res[i] = *str;
        str++;
        (*pos)++;
        i++;
      }

      while (isAlpha(*str) || isDigit(*str)) {
        res[i] = *str;
        str++;
        (*pos)++;
        i++;
        token_type = ARRAY1;
      }
      res[i] = '\0';

      return res;
    }

  if (*str == '%') {
    res[i] = 'm';
    i++;
    res[i] = 'o';
    i++;
    res[i] = 'd';
    i++;
    res[i] = '\0';
    str++;
    (*pos)++;
    token_type = OPERATOR;
    return res;
  }

  if (isOperator(*str)) {
    while (isOperator(*str)) {
      res[i] = *str;
      str++;
      (*pos)++;
      i++;
      token_type = OPERATOR;
    }
    res[i] = '\0';
    return res;
  }

  if (isDigitDot(*str)) {
    while (isDigitDot(*str)) {
      res[i] = *str;
      (*pos)++;
      i++;
      str++;
      token_type = NUMBER;
    }

    res[i] = '\0';
    return res;
  }

  if (isAlpha(*str)) {
    while (isAlpha(*str) || isDigit(*str)) {
      res[i] = *str;
      str++;
      (*pos)++;
      i++;
      token_type = VARIABLE;
    }

    if (*str == '(') {
      token_type = FUNCTION;
      while (!isWhiteSpace(*str)) {
        str++;
        (*pos)++;
      }
    }

    else if (*str == '[') {
      token_type = ARRAY1;
      while (1) {
        res[i] = *str;
        i++;
        (*pos)++;

        if (*str == ']')
          break;

        str++;

      }

    }

    else {
      token_type = VARIABLE;
    }

    res[i] = '\0';
    return res;
  }

  return NULL;
}

char *getArrayName(const char *str) {
  int i = 0;
  char *res;

  res = (char *)malloc(strlen(str));

  if (*str != '*') {
    while (*str != '[') {
      res[i] = *str;
      str++;
      i++;
    }

    res[i] = '\0';
  }

 else if(*str=='*' && isAlpha(*(str+1)))
     return getPointerName(str);

  else {
    str++;
    str++;

    while (*str != ' ') {
      res[i] = *str;
      str++;
      i++;
    }

    res[i] = '\0';

  }

  return res;
}

char *getPointerName(const char *str) {

  int i = 0;
  char *res;

  res = (char *)malloc(strlen(str));

  while (*str == '*')
    str++;

  while (*str != '\0') {
    res[i] = *str;
    str++;
    i++;
  }

  res[i] = '\0';
  return res;

}

char *getNextTokenFromConstraintSolver(const char *str, int *pos, int length) {
  int i = 0;
  char *res;
  res = (char *)malloc(length + 1);

  if (*str == '-' && isDigitDot(*(str + 2))) {
    while (*str != ')') {
      res[i] = *str;
      (*pos)++;
      i++;
      str++;
      token_type = NUMBER;
    }

    res[i] = '\0';
    return res;

  }

  while (isWhiteSpace(*str) || (*str == '\n') || (isOperator(*str))) {
    str++;
    (*pos)++;
  }

  if (*str == '\0') {
    free(res);
    return NULL;
  }

  if (*str == '(' || *str == ')') {

    res[i] = *str;
    str++;
    (*pos)++;
    i++;
    res[i] = '\0';
    token_type = DELIMETER;
    return res;
  }

  if (isDigitDot(*str)) {
    while (isDigitDot(*str)) {
      res[i] = *str;
      (*pos)++;
      i++;
      str++;
      token_type = NUMBER;
    }

    res[i] = '\0';
    return res;
  }

  if (isAlpha(*str)) {
    while (isAlpha(*str) || isDigit(*str)) {
      res[i] = *str;
      str++;
      (*pos)++;
      i++;
      token_type = VARIABLE;
    }
    res[i] = '\0';

    if (*str == '(') {
      token_type = FUNCTION;
      while (!isWhiteSpace(*str)) {
        str++;
        (*pos)++;
      }
    } else {
      token_type = VARIABLE;
    }
    return res;
  }
  free(res);
  return NULL;
}

int checkForAllConstants(const char *str) {

  while (*str != '\0') {
    if (isWhiteSpace(*str) || isOperator(*str) || isDigitDot(*str) || isDigit(*str) || *str == '(' || *str == ')')
      str++;

    else {
      if ((*str == 'n' && *(str + 1) == 'o' && *(str + 2) == 't' && *(str + 3) == ' ') || (*str == 'm' && *(str + 1) == 'o' && *(str + 2) == 'd' && *(str + 3) == ' ')) {
        str++;
        str++;
        str++;
      } else
        return 0;
    }
  }

  return 1;

}

/*
  char* getAllSymbolicNamesinAPath(char* rhs)
  {
  char *token, *result;
  int i = 0,len;

  result = (char*)malloc(200);
  len = strlen(rhs); 
  token = getNextToken(rhs, &i, len);

  while(token != NULL) 
  {
  token = getNextToken(&rhs[i], &i, len);

  printf("i=%d, token=%s\n",i,token);

  switch(token_type)
  {
  case DELIMETER :
  case OPERATOR :
  case NUMBER : break;
  case VARIABLE:  if(strcmp(token,"not") != 0)
  {strcat(result,token); strcat(result,"##");} break;
  }  

  }
  strcat(result,"\0");
  return result;
  }

  /*
  int main()
  {
  char expr[100];
  char *res;
  int i = 0,len;

  printf("Enter an expression:");
  gets(expr);
  len = strlen(expr);

  printf("result = %s\n", getAllSymbolicNamesinAPath(expr));

  /* res = getNextToken(expr, &i, len);
  while(res != NULL)
  { 
  printf("Token: %s i=%d\n", res,i);
  res = getNextToken(&expr[i], &i, len);
  }

  printf("array name: %s\n", getArrayName("a[i+5]"));
  printf("pointer name: %s\n", getPointerName("**p"));

  printf("result = %d\n", checkForAllConstants(expr));

  return 0;
  } 

*/
