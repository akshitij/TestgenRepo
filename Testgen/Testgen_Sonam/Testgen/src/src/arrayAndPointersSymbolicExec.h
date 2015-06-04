#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include "uthash.h"

struct arrayKey{
     char arrayName[50];
     int index;
};


struct arraySym_table {
    struct arrayKey key;
     char sname[150];
     void* cval;
     int address;
     int type;
    UT_hash_handle hh;      
};


struct arraySym_table *arraySTable = NULL;

void add_entryToArraySTable(char *aname, int index, char *sname, void* val, void* address, int type) ;

char* findArrayRecord(char* aname, int index);

void print_ArrayEntry();

void deleteArrayTable();
