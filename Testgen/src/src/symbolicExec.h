#include<stdio.h>
#include<ctype.h>
#include "uthash.h"

struct field_values{
     char* sname;
     void* cval;
     int address;
     int type; // 1 for int ; 2 for real
};


struct sym_table {
    char* vname;
    struct field_values *fval;
    UT_hash_handle hh;      
};


struct variable_table {
    char* varName;
    int parameter;     //index for array, indirection for pointers
    UT_hash_handle hh;      
};


char* getAllSymbolicNamesinAPath();

struct field_values* addNewFields(char* sname, void* val, void* address, int type);

void add_entryToSTable(char *vname, char *sname, void* val, void* address, int type);

struct field_values* find_fieldValue(char* key);

char* find_symVal(char* key);

void* find_conVal(char* key);

int find_address(char* key);

void delete_entry(struct sym_table *s) ;

void delete_allSTableEntry();

void print_entry();

void handleAssignmentSymbolically(char *lhs, char *rhs, void *val, void *address, int type);

char* getPrepositionalFormula(char *expr);

void delete_allVariableTableEntry();

void addEntryToVariableTable(char* vname , int parameter);

int findParameter(char* key);


