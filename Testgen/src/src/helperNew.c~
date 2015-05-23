#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "uthash.h"

extern int programFlag = 0;
extern void* ret_ConValue = NULL;
extern char* ret_SymValue = NULL;

typedef struct functionArgument{
     char funcName[100];
     int type;// 1 for int ; 2 for real
     char vname[50];
     void* val;
     char apname[50];
     int isConstant; 
}funcArg;

typedef struct {
    char** vars;
    int noOfVars;
    char funcName[100];
    int occurence;    
}funcVars;

typedef struct {
    char vname[50];
    char vname_occ[55];
     UT_hash_handle hh;    
}vnameHash;

vnameHash* vnames = NULL;
int stackInitFlag = 0;
void *symStack = NULL; 
int i=0;
char** varNames = NULL;

void add_vnameHash(char* key, char* value) {
    vnameHash* v;
    HASH_FIND_STR(vnames, key, v);
    if(v==NULL){
	v = (vnameHash*)malloc(sizeof(vnameHash));
	strcpy(v->vname_occ,value);
	strcpy(v->vname,key);
        HASH_ADD_STR(vnames, vname, v);
    }
    else{
    	HASH_DEL( vnames, v);
    	v = (vnameHash*)malloc(sizeof(vnameHash));
	strcpy(v->vname_occ,value);
	strcpy(v->vname,key);
        HASH_ADD_STR(vnames, vname, v);
    }
}

char* get_vnameHash(char* key){
	vnameHash* v;
        HASH_FIND_STR(vnames, key, v);
        if(v != NULL){
        	return v->vname_occ;
        }
}

void del_vnameHash(char* key){
	vnameHash* v;
        HASH_FIND_STR(vnames, key, v);
        if(v != NULL){
        	int occ;
        	char find = '_';
        	const char *ptr = strrchr(v->vname_occ, find);
		if(ptr) {	
   			int i = strlen(v->vname_occ);
		        int s = ptr - v->vname_occ + 1;
    			char *occStr = (char*) malloc(sizeof(char)*(i-s+1));
  	  		strncpy(occStr, v->vname_occ + s, i-s);
  	  		occ = atoi(occStr);
			if(occ == 0){
				HASH_DEL( vnames, v);
				printf("Old Hash: %s\n", v->vname_occ);
			}
			else{
				printf("Old Hash: %s\n", v->vname_occ);
				occ--;
				char* newVarname_occ = (char*) malloc(sizeof(char)*(s+5));
				strncpy(newVarname_occ, v->vname_occ, s);
				char tmp[5];
				sprintf(tmp,"%d",occ);
				strcat(newVarname_occ,tmp);
				HASH_DEL( vnames, v);
				vnameHash* vnew = (vnameHash*)malloc(sizeof(vnameHash));
				strcpy(vnew->vname_occ,newVarname_occ);
				strcpy(vnew->vname,key);
				printf("New Hash: %s\n", vnew->vname_occ);
        			HASH_ADD_STR(vnames, vname, vnew);
			}
		}
        }
}

funcArg* getArgument(char* argString, char* foo){
    //printf("getArgument\n");
    int i;double d;char c;
    char s[] = ",";
    char *token;
    char *copy = strdup(argString);
    copy++;
    copy[strlen(copy)-1] = 0;
    
    funcArg* argument = (funcArg*) malloc(sizeof(funcArg));
    strcpy(argument->funcName,foo); 

    token = strtok(copy, s);
    if(strcmp(token,"int") == 0)
    	argument->type = 1;
    else{
    	if(strcmp(token,"double") == 0 || strcmp(token,"float")==0)
    		argument->type = 2;
    	else
    		argument->type = 3;
    }
    
    token = strtok(NULL, s);
    strcpy(argument->vname,token);
    
    token = strtok(NULL, s);
    if(strcmp(token,"constant") == 0)
	argument->isConstant = 1;    	
    else
    	argument->isConstant = 0;

    token = strtok(NULL, s);
    if(argument->isConstant){
    	if(argument->type == 1){
    		i=atoi(token);
    		argument->val = &i;
	}
    	if(argument->type == 2){
    		d=atof(token);
    		argument->val = &d;
    	}
    	if(argument->type == 3){
    		c = *token;
    		argument->val = &c;
    	}
    }
    else
    	strcpy(argument->apname,token);
    
    return argument;
}


int getOccurence(char* funcName){
	//printf("getOccurence\n");
	if(symStack == NULL){
		return 0;
	}
	void* backup = stackNew(sizeof(funcVars*));
	int occ = 0;
	while(!(stackIsEmpty(symStack))){
		funcVars* pk = (funcVars*) malloc (sizeof(funcVars));
		stackPeek(symStack, &pk);
		if(strcmp(pk->funcName,funcName) == 0){
			occ = pk->occurence;
			break;			
		}
		else{
			stackPop(symStack, (&pk));
			stackPush(backup, (&pk));
		}
	}
	while(!(stackIsEmpty(backup))){
		funcVars* b = (funcVars*) malloc (sizeof(funcVars));
		stackPop(backup, (&b));
		stackPush(symStack, (&b));
	}
	return occ;
}

void populateSTable(funcArg* a){
	//printf("populateSTable\n");
	char tmp[5];
	sprintf(tmp, "_%d", getOccurence(a->funcName));
	char key[55];
	strcpy(key,a->vname);
	strcat(key,tmp);
	if(a->isConstant == 1){
		add_entryToSTable(key,"Constant",a->val,a->val,a->type);
		printf("%s Constant\n", key);
	}
	else{
		char* sym;
		void* val;
		if(symStack == NULL || stackSize(symStack) == 0){
			sym = find_symVal(a->apname);
			val = find_conVal(a->apname);
		}
		else{
			sym = find_symVal(get_vnameHash(a->apname));
			val = find_conVal(get_vnameHash(a->apname));
		}
		add_entryToSTable(key,sym,val,val,a->type);
		//add_vnameHash(a->vname, key);
		printf("%s %s\n", key, sym);
	}
	add_vnameHash(a->vname, key);
}


void funcEntry(char* format, char* args, char* funcName) {
	printf("funcEntry: %s \"%s\" \n", funcName, args);
	int size=0;
	varNames = (char**) malloc(10 * sizeof(char*));
	char s[] = " ";
	char *token;
	char *copy = strdup(args);
	char* tmp = copy;
	int count = 1;
	while (*tmp != '\0') {
		if (*tmp++ == ' ')
			count++;
	}
	char** tokens = (char**) malloc(sizeof(char*) * count);
	token = strtok(copy, s);
	int i = 0;
	while (token != NULL) {
		*(tokens + i) = token;
		token = strtok(NULL, s);
		i++;
	}
	for (i = 0; i < count; i++) {
		funcArg *a = getArgument(*(tokens + i), funcName);
		varNames[size++] = a->vname;
		populateSTable(a);
	}

	funcVars* fv = (funcVars*) malloc (sizeof(funcVars));
	fv->vars = varNames;
	fv->noOfVars = size;
	strcpy(fv->funcName,funcName);
	fv->occurence = getOccurence(funcName)+1;

	if(stackInitFlag){
		stackPush(symStack, (&fv));
	}
	else{
		symStack = stackNew(sizeof(funcVars*));
		stackPush(symStack, (&fv));
		stackInitFlag=1;
	}
	size=0;
    	i=0;
	free(copy);
	printf("Stack depth %d\n", stackSize(symStack));
}


void symAssignFunctionReturn(char* varname){
	deleteEntryUsingVar(varname);
	add_entryToSTable(varname,ret_SymValue,ret_ConValue,ret_ConValue,1);
}

void funcExit(char* AssignLval){
    printf("AssignLval: \"%s\" \n",AssignLval);
    symAssignFunctionReturn(AssignLval);
    funcVars* fv = (funcVars*) malloc (sizeof(funcVars));
    stackPop(symStack, (&fv));
    int j;
    for(j=0; j < fv->noOfVars; j++){
    	deleteEntryUsingVar(fv->vars[j]);
    	del_vnameHash(fv->vars[j]);
    }
    //free(fv);
    printf("Stack depth %d\n", stackSize(symStack));
    
}

void testgen_exit(){
    programFlag = 1;
    return;
}

void mapConcolicValues (char* retVarName){
	ret_ConValue = NULL;
	ret_SymValue = (char *)malloc(100*sizeof(char));
	ret_SymValue = find_symVal(retVarName);
	ret_ConValue = find_conVal(retVarName);
	if(ret_SymValue == NULL){
		printf("symValue for variable \"%s\" not found\n", retVarName);
	}
	else{
		printf("symValue for variable \"%s\" is \"%s\"\n",retVarName,ret_SymValue);
		printf("ConValue for variable \"%s\" is \"%d\"\n",retVarName,*((int *)(ret_ConValue)));
	}
	return;
}


/*void callFunc(int arg1, int arg2, int (*origFunc)(int,int)){
  int c = origFunc(arg1,arg2);
  printf("CallFunc called with arguments (%d, %d)\n",arg1,arg2);
  printf("Output generated by origFunc %d\n", c);
  }*/

/*
int main(){
    char str[] = "(double,x,constant,2.000000) (double,y,variable,f)";
    //char* tmp = str;
    funcEntry("",str,"");
    return(0);
}
*/
