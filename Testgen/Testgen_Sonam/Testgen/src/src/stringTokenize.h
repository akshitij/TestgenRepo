#include<stdio.h>
#include<string.h>

enum TOKENTYPE {
    NOTHING = -1, 
    DELIMETER,
    OPERATOR,
    NUMBER,
    POINTER,
    ARRAY1, 
    VARIABLE, 
    FUNCTION, 
    UNKNOWN};

enum TOKENTYPE token_type;

int isWhiteSpace(const char c);

int isOperator(const char c);

int isNotOperator(const char c);

int isAlpha(const char c);

int isDigitDot(const char c);

int isDigit(const char c);

char* getNextToken(const char* str, int *pos, int length);

char* getNextTokenFromConstraintSolver(const char* str, int *pos, int length);
