#include <stdio.h>   
#include <stdlib.h>  
#include <string.h>  
#include "uthash.h"

struct my_struct {
    int sid;                   
    char *true_expr;
    char *false_expr;
    int trueblk;
    int falseblk;
    UT_hash_handle hh;       
};

int *unrolledCopies;

void initSID();

void isCopyOf(int copysid, int orgsid);

void add_condition(int sid, char *exp1, char* exp2, int tb, int fb);

struct my_struct *find_condition(int sid) ;

char* getTrueExpr(int sid);

char* getFalseExpr(int sid) ;

int countTotalConditions();

int countCoveredConditions();

int getBranchInfo(int id, int branch);

void setBranchInfo(int sid, int tblk,int fblk);

void delete_condition(struct my_struct *s);

void delete_allConditions();

void print_conditions();




