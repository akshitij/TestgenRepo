#include "arrayAndPointersSymbolicExec.h"
#include "stringTokenize.h"
#include "symbolicExec.h"

#define MAX_INT 2147483647

static int toInt(void* addr) {
  return (size_t) addr % MAX_INT;
}



void add_entryToArraySTable(char *aname, int index, char *sname, void* val, void* address, int type) {
    struct arraySym_table *s, r;
    int size;

   // strcpy(r.key.arrayName, aname);
   // r.key.index = index;

   // HASH_FIND(hh, arraySTable, &r.key, sizeof(struct arrayKey), s); 
   // printf("aname=%s, index=%d, sname=%s\n",aname,index,sname);

    for(s=arraySTable; s != NULL; s=(struct arraySym_table*)(s->hh.next)) 
    {
        if(strcmp(s->key.arrayName, aname)==0 && s->key.index==index && strcmp(s->sname,"Constant")==0)
          { strcpy(s->sname,sname);
          break;}
     
        if(strcmp(s->key.arrayName, aname)==0 && s->key.index==index)
           return;

    }


  if(s == NULL)
     { s = (struct arraySym_table *)malloc(sizeof(struct arraySym_table));
      strcpy(s->key.arrayName, aname);
      s->key.index = index;
      HASH_ADD(hh, arraySTable, key, sizeof(struct arrayKey), s);
  

       strcpy(s->sname,sname);}


  //printf("aname=%s, index=%d, sname=%s\n",s->key.arrayName,s->key.index,s->sname);
   if(type == 1)
  { size = sizeof(int);  addToIntTable(sname, (int *)val);}
  else
  { size = sizeof(float);   addToFloatTable(sname, (float *)val); }
  
  s->cval = malloc(size);
  memcpy(s->cval, val, size);
  s->address = toInt(address); 
  s->type = type;

}


char* findArrayRecord(char* aname, int index)
{
  struct arraySym_table k;
  struct arraySym_table *s;

  memset(&k, 0, sizeof(struct arraySym_table));

  strcpy(k.key.arrayName, aname);
  k.key.index = index;

 // HASH_FIND(hh, arraySTable, &k.key, sizeof(struct arrayKey), s); 
  //printf("aname=%s, index=%d\n",aname,index);

 for(s=arraySTable; s != NULL; s=(struct arraySym_table*)(s->hh.next)) 
    {
        if(strcmp(s->key.arrayName, aname)==0 && s->key.index==index)
          return s->sname;
    }


   return NULL;
}


void print_ArrayEntry() {
    struct arraySym_table *s;
   
    for(s=arraySTable; s != NULL; s=(struct arraySym_table*)(s->hh.next)) {
       
    printf("variable name %s: index:%d symbolic name: %s value :%d address=%d\n", s->key.arrayName, s->key.index, s->sname, *((int*)s->cval), s->address);
    }
}

void deleteArrayTable()
{
    struct arraySym_table *p, *tmp;

    HASH_ITER(hh, arraySTable, p, tmp) {
      HASH_DEL(arraySTable, p);
      free(p);
    }
   
}



void handleArraySymbolically(char *lhs, int index, char *rhs, void *val, void *address, int type) {
  int i = 0, len, parameter, j, value;
  char *token, *result, *symName, *temp;
  char buff[15];

  result = (char *)calloc(2, sizeof(char));

  //printf("rhs = %s\n",rhs);

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

      break;

    case VARIABLE:
      symName = find_symVal(token);

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
    }

    token = getNextToken(&rhs[i], &i, len);
  }

  strcat(result, "\0");

  //printf("result=%s\n",result);

  add_entryToArraySTable(lhs, index, result, val, address, type) ;
  delete_allVariableTableEntry();
}








/*
int main() 
{
   int a[10];

   a[3] = 3;
   a[4] = 4;
   a[5] = 5;
   a[6] = 6;

   add_entryToArraySTable("a", 3, "a_3", &a[3], &a[3], 1);
   add_entryToArraySTable("a", 4, "a_4", &a[4], &a[4], 1);
   add_entryToArraySTable("a", 5, "a_5", &a[5], &a[5], 1);
   add_entryToArraySTable("a", 6, "a_6", &a[6], &a[6], 1);

  print_ArrayEntry();

  printf("\n\n");
  findArrayRecord("a",5);

  deleteArrayTable();

  print_ArrayEntry();
  
}

*/







