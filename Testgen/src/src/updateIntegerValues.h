#include<stdio.h>
#include<ctype.h>
#include "uthash.h"


struct intVartable {
    char *sname;
    int *value;
    UT_hash_handle hh;      
};


struct floatVartable {
    char *sname;
    float *value;     //index for array, indirection for pointers
    UT_hash_handle hh;      
};


void addToIntTable(char *sname, int *val);

void addToFloatTable(char *sname, float *val);

int updateIntValBySname(char* sname, int value);

int updateFloatValBySname(char* sname, float value);
