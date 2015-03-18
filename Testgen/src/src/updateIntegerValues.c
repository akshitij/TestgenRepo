#include "updateIntegerValues.h"
#include "directAndSolve.h"
#include "arrayAndPointersSymbolicExec.h"

struct intVartable *itable = NULL;
struct floatVartable *ftable = NULL;

void addToIntTable(char *sname, int *val) {
 
  struct intVartable *s;

  HASH_FIND_STR(itable, sname, s);

 if(CDG_Module==1){
  if (s == NULL) {
    s = (struct intVartable *)malloc(sizeof(struct intVartable));
    s->sname = (char *)malloc(sizeof(char) * (strlen(sname) + 1));
    strcpy(s->sname, sname);
    HASH_ADD_STR(itable, sname, s);
  
  s->value = val;
 }
}

else
 {
  if (s == NULL) {
    s = (struct intVartable *)malloc(sizeof(struct intVartable));
    s->sname = (char *)malloc(sizeof(char) * (strlen(sname) + 1));
    strcpy(s->sname, sname);
    HASH_ADD_STR(itable, sname, s);
  
 }
  s->value = val;

 }


//printf("Added to int table: %s val: %d\n", sname,(s->value));

}

void addToFloatTable(char *sname, float *val) {
  struct floatVartable *s;

  HASH_FIND_STR(ftable, sname, s);
  if (s == NULL) {
    s = (struct floatVartable *)malloc(sizeof(struct floatVartable));
    s->sname = (char *)malloc(sizeof(char) * (strlen(sname) + 1));
    strcpy(s->sname, sname);
    HASH_ADD_STR(ftable, sname, s);
  }
  s->value = val;
//printf("Added to float table: %s \n", sname);
}

int updateIntValBySname(char *sname, int value) {
  struct intVartable *s;

  //printf("updating actual values for: %s %d \n",sname,value);

  HASH_FIND_STR(itable, sname, s);

  if (s == NULL)
    {printf("Its null\n"); return 0;}

  *(s->value) = value;
// printf("updated actual values for: %s %d \n",sname, (s->value));
  return 1;

}

int updateFloatValBySname(char *sname, float value) {
  struct floatVartable *s;


  HASH_FIND_STR(ftable, sname, s);
  if (s == NULL)
     return 0;

  *(s->value) = value;
  //printf("updated actual values for: %s %f %d\n",sname,*(s->value),s->value);
  return 1;
}


void deleteTableEntry() {
struct intVartable *curr, *tmp;
struct floatVartable *curr1, *tmp1;

  HASH_ITER(hh, itable, curr, tmp) {
    HASH_DEL(itable, curr);
    free(curr);
  }

 HASH_ITER(hh, ftable, curr1, tmp1) {
    HASH_DEL(ftable, curr1);
    free(curr1);
  }

}




void writeProgramSVariables() {
  struct intVartable *s;
  struct floatVartable *s1;
  struct arraySym_table *a;
  printFile(":extrafuns (");

  for (s = itable; s != NULL; s = (struct intVartable *)(s->hh.next)) {
    if (strcmp(s->sname, "Function") == 0 || strcmp(s->sname, "Constant") == 0 || s->sname[0] == '(')
      continue;

    printFile("(");
    printFile(s->sname); //printf("s->sname %s \n",s->sname);
    printFile(" Int)");
  }

  for (s1 = ftable; s1 != NULL; s1 = (struct floatVartable *)(s1->hh.next)) {

    if (strcmp(s1->sname, "Function") == 0 || strcmp(s1->sname, "Constant") == 0 || s1->sname[0] == '(' || s1->sname[0] == '-')
      continue;

    printFile("(");
    printFile(s1->sname);//printf("s1->sname %s\n",s1->sname);
    printFile(" Real)");
  }

  /*   for(a=arraySTable; a != NULL; a=(struct arraySym_table*)(a->hh.next))
     {
     if(a->type == 1)
     {printFile("(");
     printFile(a->sname);
     printFile(" Int)");}

     else
     {printFile("(");
     printFile(a->sname);
     printFile(" Int)");}

     } */

  printFile(")\n");
}
