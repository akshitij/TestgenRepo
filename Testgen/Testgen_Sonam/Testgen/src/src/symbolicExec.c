#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include "stringTokenize.h"
#include "symbolicExec.h"
#include "arrayAndPointersSymbolicExec.h"
#include "updateIntegerValues.h"
#include "directAndSolve.h"
#include "flatds.h"
#include "queue.h"
#include "ipaRecursive.c"

#define MAX_INT 2147483647

static int toInt(void *addr) {
  return (size_t) addr % MAX_INT;
}

struct sym_table *stable = NULL;
struct variable_table *varTable = NULL;

struct field_values *addNewFields(char *sname, void *val, void *address, int type) {
  struct field_values *t;
  int size;

  t = (struct field_values *)malloc(sizeof(struct field_values));
  t->sname = (char *)calloc((strlen(sname) + 1), sizeof(char));
  strcpy(t->sname, sname);


  if (type == 1) {
    size = sizeof(int);

    if (strstr(sname,"structVar")==NULL && strcmp(sname,"Constant")!=0 && strcmp(sname,"Function")!=0)
         addToIntTable(sname, (int *)val);
      
  } else {
    size = sizeof(float);


    if (strstr(sname,"structVar")==NULL && strcmp(sname,"Constant")!=0 && strcmp(sname,"Function")!=0)
    addToFloatTable(t->sname, (float *)val);
  }

  t->cval = malloc(size);
  memcpy(t->cval, val, size);
  t->address = toInt(address);
  t->type = type;

  return t;
}

void createEmptyEntryInSTable(char *vname) {
  struct sym_table *s;

  HASH_FIND_STR(stable, vname, s);
  if (s == NULL) {
    s = (struct sym_table *)malloc(sizeof(struct sym_table));
    s->vname = (char *)calloc((strlen(vname) + 1), sizeof(char));
    strcpy(s->vname, vname);
    HASH_ADD_STR(stable, vname, s);


}
  //s->fval = addNewFields(sname, val, address, type);
}

void add_entryToSTable(char *vname, char *sname, void *val, void *address, int type) {
  if(getExecutionFlag() == 1){
  struct sym_table *s;
  
  char* hash_vn = get_vnameHash(vname);
  if(hash_vn != NULL){
    HASH_FIND_STR(stable, hash_vn, s);
  }
  else{
    HASH_FIND_STR(stable, vname, s);
  }
  
  //HASH_FIND_STR(stable, vname, s);
  if (s == NULL) {
    s = (struct sym_table *)malloc(sizeof(struct sym_table));
    s->vname = (char *)calloc((strlen(vname) + 1), sizeof(char));
    strcpy(s->vname, vname);
    HASH_ADD_STR(stable, vname, s);


  }
  s->fval = addNewFields(sname, val, address, type);
  // printf("Added: %s for %s in symbol table\n", s->vname, sname);
  }
}

void addEntryToVariableTable(char *vname, int parameter) {

  struct variable_table *s;

  HASH_FIND_STR(varTable, vname, s);
  if (s == NULL) {
    s = (struct variable_table *)malloc(sizeof(struct variable_table));
    s->varName = (char *)calloc((strlen(vname) + 1), sizeof(char));
    strcpy(s->varName, vname);
    HASH_ADD_STR(varTable, varName, s);

    s->parameter = parameter;

   // printf("Added: %d for %s in variable table\n", s->parameter, s->varName);

  }
}

int findParameter(char *key) {
  struct variable_table *s;
  HASH_FIND_STR(varTable, key, s);
  if(s==NULL){
    printf("pointer parameter entry not found....check addEntryToVariableTable statement\n");
    return 1; //denoting *ptr
  }
  return s->parameter;
}

struct field_values *find_fieldValue(char *key) {
  struct sym_table *s;
  HASH_FIND_STR(stable, key, s);

  if (s == NULL)
    return NULL;

  return s->fval;
}

char *find_symVal(char *key) {
  struct field_values *fv;

  fv = find_fieldValue(key);
  if (fv == NULL)
    return NULL;

  return fv->sname;
}

void *find_conVal(char *key) {
  struct field_values *fv;
  
  char* hash_vn = get_vnameHash(key);
  if(hash_vn != NULL){
    fv = find_fieldValue(hash_vn);
  }
  else{
    fv = find_fieldValue(key);
  }
  
  //fv = find_fieldValue(key);
  return fv->cval;
}

int find_address(char *key) {
  struct field_values *fv;

  fv = find_fieldValue(key);
  return fv->address;
}

void delete_entry(struct sym_table *s) {
  HASH_DEL(stable, s);
  free(s);
}

void delete_allSTableEntry() {
  struct sym_table *current_entry, *tmp;

  HASH_ITER(hh, stable, current_entry, tmp) {
    HASH_DEL(stable, current_entry);
    free(current_entry);
  }
}

void delete_allVariableTableEntry() {
  struct variable_table *current_entry, *tmp;

  HASH_ITER(hh, varTable, current_entry, tmp) {
    HASH_DEL(varTable, current_entry);
    free(current_entry);
  }
}

void print_entry() {
  struct sym_table *s;

  for (s = stable; s != NULL; s = (struct sym_table *)(s->hh.next)) {

    printf("variable name %s: symbolic name: %s concrete value:%d address:%d\n", s->vname, find_symVal(s->vname), *((int *)find_conVal(s->vname)),
           find_address(s->vname));
  }
}

void updateValBySymbolicName(char *sname, void *value) {
  struct sym_table *s;
  struct arraySym_table *s1;

  int size, i;
  size = sizeof(int);

//printf("sname = %s, value = %d\n", sname ,(*(int*)value));

  for (s = stable; s != NULL; s = (struct sym_table *)(s->hh.next)) {
    printf("var = %s, sname = %s, value = %d\n",s->vname, find_symVal(s->vname) ,(*(int*)s->fval->cval));
    if (strcmp(find_symVal(s->vname), sname) == 0) {
      memcpy(s->fval->cval, value, size);
      if (s->fval->type == 1)
        updateIntValBySname(sname, (*(int *)value));
      else
       { 
          if((*(int*)value) < 0)
          { updateFloatValBySname(sname, (*(int *)value));}
         else
          updateFloatValBySname(sname, (*(float *)value));}
      return;
    }
  }

  for (s1 = arraySTable; s1 != NULL; s1 = (struct arraySym_table *)(s1->hh.next)) {
    if (strcmp(s1->sname, sname) == 0) {
      memcpy(s1->cval, value, size);
      // printf("type = %d\n", s1->type);
      if (s1->type == 1)
        updateIntValBySname(sname, (*(int *)value));
      else
        updateFloatValBySname(sname, (*(float *)value));
       // printf("sname = %s, value=%d\n", s1->sname, *((int*)s1->cval));
      return;

    }
  }

  //setValue(sname, 1, value);
  if (!updateIntValBySname(sname, (*(int *)value)))
   {  if((*(int*)value) < 0)
          { updateFloatValBySname(sname, (*(int *)value));}
     else
     updateFloatValBySname(sname, (*(int *)value));
   }
}

void *findValBySymbolicName(char *sname) {
  struct sym_table *s;

  //printf("sname = %s, value = %d\n", sname ,(*(int*)value));

  for (s = stable; s != NULL; s = (struct sym_table *)(s->hh.next)) {
    if (strcmp(find_symVal(s->vname), sname) == 0) {
      return s->fval->cval;
    }
  }
}

void deleteEntryUsingVar(char* key){
  struct sym_table *s;
  HASH_FIND_STR( stable, key, s ); 
  if(s == NULL)
    return NULL;
  HASH_DEL( stable, s );  
  free(s);
}

char *getAllSymbolicNamesinAPath(char *rhs) {
  char *token, *result, *temp;
  int i = 0, len;

  result = (char *)calloc(2, sizeof(char));
  len = strlen(rhs);
  token = getNextToken(rhs, &i, len);
  //strcpy(result, "");
  //result = "";

  while (token != NULL) {
    //printf("token=%s\n",token);
    free(token);
    token = getNextToken(&rhs[i], &i, len);

    switch (token_type) {
    case DELIMETER:
    case OPERATOR:
    case NUMBER:
      break;
    case VARIABLE:
      if (strcmp(token, "not") != 0) {
        result = realloc(result, (strlen(result) + strlen(token) + 1 + 2) * sizeof(char));
        strcat(result, token);
        strcat(result, "##");
      }
      break;
    }
  }
  strcat(result, "\0");

  //printf("result=%s\n",result);
  return result;
}

void handleAssignmentSymbolically(char *lhs, char *rhs, void *val, void *address, int type) {
  if(getExecutionFlag() == 1){
  int i = 0, len, parameter, j, value;
  char *token, *result, *symName, *temp, *arrName, *vname_occ;
  char buff[15];

  result = (char *)calloc(2, sizeof(char));

  len = strlen(rhs);
  token = getNextToken(rhs, &i, len);
  //strcpy(result, "");
  // strcpy(result, token);
  // token = getNextToken(&rhs[i], &i, len);

  while (token != NULL) {
    switch (token_type) {
    case DELIMETER:
    case OPERATOR:
    case NUMBER:
      result = realloc(result, (strlen(result) + strlen(token) + 1) * sizeof(char));
      strcat(result, token);
      break;

    case POINTER:
      parameter = findParameter(token);
      temp = getPointerName(token);
      j = 0;

      while (j < (2 * parameter + 1)) {
        //symName = find_symVal(temp);
        
        vname_occ = get_vnameHash(temp);
        if(vname_occ == NULL){
          symName = find_symVal(temp);
        }
        else{
          symName = find_symVal(vname_occ);
        }
        
        if (symName == NULL)
          symName = findArrayRecord((char *)getArrayName(temp), findParameter(temp));

        temp = symName;
        j++;
      }
      if (symName != NULL) {
        if (strcmp(symName, "Constant") == 0) {
          value = (*(int *)findValBySymbolicName(symName));
          sprintf(buff, "%d", value);
          result = realloc(result, (strlen(result) + strlen(buff) + 1) * sizeof(char));
          strcat(result, buff);
        } else if (strcmp(symName, "Function") == 0) {
          sprintf(buff, "%d", (*(int *)findValBySymbolicName(symName)));
          result = realloc(result, (strlen(result) + strlen(buff) + 1) * sizeof(char));
          strcat(result, buff);
        } else {
          result = realloc(result, (strlen(result) + strlen(symName) + 1) * sizeof(char));
          strcat(result, symName);
        }

      }
      break;

    case ARRAY1:

      parameter = findParameter(token);
      //printf("parameter found for array: %d\n", parameter);
      arrName = (char *)getArrayName(token);
      vname_occ = get_vnameHash(arrName);
      if(vname_occ == NULL){
        symName = findArrayRecord(arrName, parameter);
      }
      else{
        symName = findArrayRecord(vname_occ, parameter);
      }
      //printf("symName=%s\n",symName);
      if (symName != NULL) {
        if (strcmp(symName, "Constant") == 0) {
          sprintf(buff, "%d", (*(int *)findValBySymbolicName(symName)));
          result = realloc(result, (strlen(result) + strlen(buff) + 1) * sizeof(char));
          strcat(result, buff);
        } else if (strcmp(symName, "Function") == 0) {
          sprintf(buff, "%d", (*(int *)findValBySymbolicName(symName)));
          result = realloc(result, (strlen(result) + strlen(buff) + 1) * sizeof(char));
          strcat(result, buff);
        } else {
          result = realloc(result, (strlen(result) + strlen(symName) + 1) * sizeof(char));
          strcat(result, symName);
        }
      }
      /*
      else{
        //parameter = findParameter(token);
        parameter = 1;
        temp = (char *)getPointerName(token);
        j = 0;
        while (j < (2 * parameter + 1)) {
          symName = find_symVal(temp);
          if (symName == NULL)
            symName = findArrayRecord((char *)getArrayName(temp), findParameter(temp));
          temp = symName;
          j++;
        }
        if (symName != NULL) {
          if (strcmp(symName, "Constant") == 0) {
            sprintf(buff, "%d", (*(int *)findValBySymbolicName(symName)));
            result = realloc(result, (strlen(result) + strlen(buff) + 1) * sizeof(char));
            strcat(result, buff);
          }else if (strcmp(symName, "Function") == 0) {
              sprintf(buff, "%d", (*(int *)findValBySymbolicName(symName)));
              result = realloc(result, (strlen(result) + strlen(buff) + 1) * sizeof(char));
              strcat(result, buff);
            } else {
                result = realloc(result, (strlen(result) + strlen(symName) + 1) * sizeof(char));
                strcat(result, symName);
          }
        }
      }
      */
      break;

    case VARIABLE:
      vname_occ = get_vnameHash(token);
      if(vname_occ == NULL){
        symName = find_symVal(token);
      }
      else{
        symName = find_symVal(vname_occ);
      }
      //printf("%s ",symName);
      if (symName != NULL) {
        if (strcmp(symName, "Constant") == 0) {
          //This will return same value for all Constant variables ....see example constantFunc.c
          //sprintf(buff, "%d", (*(int *)findValBySymbolicName(symName)));
          sprintf(buff, "%d", (*(int *)find_conVal(token)));
          result = realloc(result, (strlen(result) + strlen(buff) + 1) * sizeof(char));
          strcat(result, buff);
        } else if (strcmp(symName, "Function") == 0) {
          sprintf(buff, "%d", (*(int *)findValBySymbolicName(symName)));
          result = realloc(result, (strlen(result) + strlen(buff) + 1) * sizeof(char));
          strcat(result, buff);
        } else {
          result = realloc(result, (strlen(result) + strlen(symName) + 1) * sizeof(char));
          strcat(result, symName);
        }
      }

      break;
    }

    token = getNextToken(&rhs[i], &i, len);
  }

  strcat(result, "\0");
  
  int j2 = 0, k, len2 = strlen(lhs);
  char* temp2;
  char *symName2;
  char new_lhs[100];
  strcpy(new_lhs,lhs);
  char *token2 = getNextToken(lhs, &j2, len2);
  if(token2 != NULL){
    switch (token_type) {
      case POINTER: //pointer as variable "*p" as "p"
        parameter = findParameter(token2); //entry is for "*p" not "p"
        temp2 = getPointerName(token2);
        k = 0;
        while (k < (2 * parameter)) {
          //symName = find_symVal(temp);
        
          vname_occ = get_vnameHash(temp2);
          if(vname_occ == NULL){
            symName2 = find_symVal(temp2);
          }
          else{
            symName2 = find_symVal(vname_occ);
          }
        
          if (symName2 == NULL)
            symName2 = findArrayRecord((char *)getArrayName(temp2), findParameter(temp2));
          temp2 = symName2;
          k++;
        }
        strcpy(new_lhs,symName2);
        break;
    }
  }  

  //printf("result=%s\n",result);
  char* lhs_vn = get_vnameHash(new_lhs);
  if (lhs_vn != NULL){
  	printf("add_entryToSTable(%s,%s)\n",lhs_vn,result);
  	add_entryToSTable(lhs_vn, result, val, address, type);
  }
  else{
  	printf("add_entryToSTable(%s,%s)\n",new_lhs,result);
  	add_entryToSTable(new_lhs, result, val, address, type);
  }
  delete_allVariableTableEntry();
  }
}

char *getPrepositionalFormula(char *expr) {
  int i = 0, len, parameter, j;
  char *token, *result, *symName, *temp;
  char buff[15];

  result = (char *)calloc(2, sizeof(char));

 // printf("Expr = %s\n", expr);

  len = strlen(expr);
  token = getNextToken(expr, &i, len);
  //strcpy(result, token);
  // token = getNextToken(&expr[i], &i, len);
  //strcpy(result, "");

  while (token != NULL) {

      //printf("token=%s, type=%d\n",token,token_type);
    switch (token_type) {
    case DELIMETER:
    case OPERATOR:
    case NUMBER:
      result = realloc(result, (strlen(result) + strlen(token) + 1) * sizeof(char));
      strcat(result, token);
      break;

    case POINTER: 
      parameter = findParameter(token);
      j = 0;
      temp = (char *)getPointerName(token);

      while (j < (2 * parameter + 1)) {
        symName = find_symVal(temp);
        if (symName == NULL)
          symName = findArrayRecord((char *)getArrayName(temp), findParameter(temp));

        temp = symName;
        j++;
      }

      if (symName != NULL) {
        if (strcmp(symName, "Constant") == 0) {
          sprintf(buff, "%d", (*(int *)findValBySymbolicName(symName)));
          result = realloc(result, (strlen(result) + strlen(buff) + 1) * sizeof(char));
          strcat(result, buff);
        } else if (strcmp(symName, "Function") == 0) {
          sprintf(buff, "%d", (*(int *)findValBySymbolicName(symName)));
          result = realloc(result, (strlen(result) + strlen(buff) + 1) * sizeof(char));
          strcat(result, buff);
        } else {
          result = realloc(result, (strlen(result) + strlen(symName) + 1) * sizeof(char));
          strcat(result, symName);
        }
      }

      break;

    case ARRAY1:
      //printf("token=%s\n",token);
      parameter = findParameter(token);
     // printf("parameter found for array: %d\n", parameter);
      symName = findArrayRecord((char *)getArrayName(token), parameter);

       //printf("symName=%s\n",symName);
      if (symName != NULL) {
        if (strcmp(symName, "Constant") == 0) {
          sprintf(buff, "%d", (*(int *)findValBySymbolicName(symName)));
          result = realloc(result, (strlen(result) + strlen(buff) + 1) * sizeof(char));
          strcat(result, buff);
        } else if (strcmp(symName, "Function") == 0) {
          sprintf(buff, "%d", (*(int *)findValBySymbolicName(symName)));
          result = realloc(result, (strlen(result) + strlen(buff) + 1) * sizeof(char));
          strcat(result, buff);
        } else {
          result = realloc(result, (strlen(result) + strlen(symName) + 1) * sizeof(char));
          strcat(result, symName);
        }
      }
      /*
      else{
        //parameter = findParameter(token);
        parameter = 1;
        temp = (char *)getPointerName(token);
        j = 0;
        while (j < (2 * parameter + 1)) {
          symName = find_symVal(temp);
          if (symName == NULL)
            symName = findArrayRecord((char *)getArrayName(temp), findParameter(temp));
          temp = symName;
          j++;
        }
        if (symName != NULL) {
          if (strcmp(symName, "Constant") == 0) {
            sprintf(buff, "%d", (*(int *)findValBySymbolicName(symName)));
            result = realloc(result, (strlen(result) + strlen(buff) + 1) * sizeof(char));
            strcat(result, buff);
          }else if (strcmp(symName, "Function") == 0) {
              sprintf(buff, "%d", (*(int *)findValBySymbolicName(symName)));
              result = realloc(result, (strlen(result) + strlen(buff) + 1) * sizeof(char));
              strcat(result, buff);
            } else {
                result = realloc(result, (strlen(result) + strlen(symName) + 1) * sizeof(char));
                strcat(result, symName);
          }
        }
      }
      */
      break;

    case VARIABLE:
      if (strcmp(token, "not") == 0) {
        result = realloc(result, (strlen(result) + strlen(token) + 1) * sizeof(char));
        strcat(result, token);
      } else {
        symName = find_symVal(token);
       // printf("token=%s, sname=%s\n", token,symName);
        if (symName != NULL) {
          if (strcmp(symName, "Constant") == 0) {
            sprintf(buff, "%d", (*(int *)findValBySymbolicName(symName)));
            result = realloc(result, (strlen(result) + strlen(buff) + 1) * sizeof(char));
            strcat(result, buff);
          } else if (strcmp(symName, "Function") == 0) {
            sprintf(buff, "%d", (*(int *)findValBySymbolicName(symName)));
            result = realloc(result, (strlen(result) + strlen(buff) + 1) * sizeof(char));
            strcat(result, buff);
          } else {
            result = realloc(result, (strlen(result) + strlen(symName) + 1) * sizeof(char));
            strcat(result, symName);
          }
        }

      }

      break;
    }
    free(token);
    token = getNextToken(&expr[i], &i, len);
  }

  strcat(result, "\0");
//printf("Prep result = %s\n",result);
  printf("PrepositionalFormula = %s\n",result);
  return result;
}

/*void copyValues()
  {
  argvar.max = *((int*)find_conVal("max"));
  argvar.a = *((int*)find_conVal("a"));
  argvar.b = *((int*)find_conVal("b"));
  argvar.c = *((int*)find_conVal("c"));
  }*/

/*
  int main()
  {
  int a=12,b=44,c=55;
  int d;

  add_entryToSTable("a", "s0", &a, &a, 1);
  add_entryToSTable("b", "s1", &b, &b, 1);
  add_entryToSTable("c", "s2", &c, &c, 1);

  print_entry() ;

  d = (a+b) * c;
  handleAssignmentSymbolically("d", "(* (+ a b) c)",&d ,&d, 1);

  printf("\n\n");
  print_entry() ;

  printf("prep:%s\n", getPrepositionalFormula("(== (% d a ) 0)"));

  return 0;
  }*/
