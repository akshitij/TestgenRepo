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
    int structure; 
}funcArg;

typedef struct {
    char** vars;
    char** locals;
    int noOfVars;
    int noOfLocals;
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
int noInsertionInTables = 0;
int stackInitFlag2 = 0;
void *symStack = NULL; 
void *didFuncEntryExecute = NULL;
int i=0;
char** varNames = NULL;
char** localNames = NULL;
int currentOccurence = -1;

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
    else
	return NULL;
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
    if(strcmp(token,"int") == 0 || strcmp(token,"int *") == 0)
    	argument->type = 1;
    else{
    	if(strcmp(token,"double") == 0 || strcmp(token,"float")==0 || strcmp(token,"float *") == 0 || strcmp(token,"double *") == 0)
	    argument->type = 2;
    	else
	    argument->type = 3;
    }
    
    token = strtok(NULL, s);
    strcpy(argument->vname,token);
    
    token = strtok(NULL, s);
    if(strcmp(token,"constant") == 0)
	argument->structure = 1;    	
    else{
    	if(strcmp(token,"pointer") == 0) 
    		argument->structure = 2;
    	else{
    		if(strcmp(token,"array") == 0)
    			argument->structure = 3;
    		else
    			argument->structure = 0;
    	}			
    }
    token = strtok(NULL, s);
    if(argument->structure == 1){
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
    sprintf(tmp, "_%d", currentOccurence);
    char key[55];
    strcpy(key,a->vname);
    strcat(key,tmp);
    if(a->structure == 1){
	add_entryToSTable(key,"Constant",a->val,a->val,a->type);
	printf("%s Constant\n", key);
	add_vnameHash(a->vname, key);
    }
    else{
	if(a->structure == 0 || a->structure == 2){
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
		printf("%s %s %d\n", key, sym, *(int*)val);
	        add_vnameHash(a->vname, key);
    	}
    	else{
    		if(symStack == NULL || stackSize(symStack) == 0){
    			add_vnameHash(a->vname, a->apname);		
    		}
    		else{
    			add_vnameHash(a->vname, get_vnameHash(a->apname));
    		}
    	}
    }
}

void populateSTableWithLocals(char *localVarName){
    char tmp[5];
    sprintf(tmp, "_%d", currentOccurence);
    char key[55];
    strcpy(key,localVarName);
    strcat(key,tmp);
    createEmptyEntryInSTable(key);
    add_vnameHash(localVarName,key);
}

void funcEntry(char* args, char* locals, char* funcName) {
    
    //to avoid entries in itables/ftables
    noInsertionInTables = 1;
    //...........................//
     
    printf("funcEntry: %s \"%s\" \n", funcName, args);
    int size=0,localSize = 0;
    currentOccurence = getOccurence(funcName);
    printf("entry occurence of %s : %d\n", funcName,currentOccurence);
	
    if(currentOccurence < 2){//bound on recursion

	//---------------------KEEP TRACK IF FuncEntry EXECUTED (Recursion Bound)	
        
        int* flag = (int *)malloc(sizeof(int));
        *flag = 1;

        if(stackInitFlag2){
            stackPush(didFuncEntryExecute, (&flag));
	}
	else{
	    didFuncEntryExecute = stackNew(sizeof(int*));
	    stackPush(didFuncEntryExecute, (&flag));
	    stackInitFlag2=1;
	}
	printf("Pushed \"%d\" in didFuncEntryExecute\n", 1);
	
	//---------------------HANDLE FORMALS OF "funcName"
	
	
	if(strcmp(args,"") != 0){ //handle functions with no arguments
	    char s[] = "#";
	    char *token2;
	    char *copy = strdup(args);
	    char* tmp = copy;
	    int count = 1;
	    while (*tmp != '\0') {
		if (*tmp++ == '#')
		    count++;
	    }
	    varNames = (char**) malloc(count * sizeof(char*));
	    char** tokens = (char**) malloc(sizeof(char*) * count);
	    token2 = strtok(copy, s);
	    int i = 0;
	    while (token2 != NULL) {
		*(tokens + i) = token2;
		token2 = strtok(NULL, s);
		i++;
	    }
	    for (i = 0; i < count; i++) {
		funcArg *a = getArgument(*(tokens + i), funcName);
		varNames[size++] = a->vname;
		populateSTable(a);
	    }
	    free(copy);
	}
	
	//------------------------HANDLE LOCALS
	
	
	if(strcmp(locals,"") != 0){ //handle functions with no locals
	    char s[] = " ";
	    char *token;
	    char *copy = strdup(locals);
	    char* tmp = copy;
	    int count = 1;
	    while (*tmp != '\0') {
		if (*tmp++ == ' ')
		    count++;
	    }
	    localNames = (char**) malloc(count * sizeof(char*));
	    char** tokens = (char**) malloc(sizeof(char*) * count);
	    token = strtok(copy, s);
	    int i = 0;
	    while (token != NULL) {
		*(tokens + i) = token;
		token = strtok(NULL, s);
		i++;
	    }
	    for (i = 0; i < count; i++) {
		char* tmp = (char*)malloc(50*sizeof(char));
		strcpy(tmp, *(tokens + i));
		localNames[localSize++] = tmp;
		populateSTableWithLocals(tmp);
		//populateSTable(a);
	    }
	    free(copy);
	}


	//-----------------------HANDLE STACK_PUSH
	
	funcVars* fv = (funcVars*) malloc (sizeof(funcVars));
	fv->vars = varNames;
	fv->noOfVars = size;
	strcpy(fv->funcName,funcName);
	fv->noOfLocals = localSize;
	fv->locals = localNames;
	fv->occurence = currentOccurence+1;
	
	if(stackInitFlag){
	    stackPush(symStack, (&fv));
	}
	else{
	    symStack = stackNew(sizeof(funcVars*));
	    stackPush(symStack, (&fv));
	    stackInitFlag=1;
	}
	localSize = 0;
	size=0;
    	i=0;
	printf("Stack depth %d\n", stackSize(symStack));
    }
    else{
        int* flag = (int *)malloc(sizeof(int));
        *flag = 0;
        stackPush(didFuncEntryExecute, (&flag));
        printf("Recursive depth exceeded, nothing pushed, proceeding with concolic execution...\n");
        printf("Pushed \"%d\" in didFuncEntryExecute\n", 0);
    }
    
    //to avoid entries in itables/ftables
    noInsertionInTables = 0;
    //...........................//
}


void funcExit(){
        int* execFlag = (int *)malloc(sizeof(int));
        stackPop(didFuncEntryExecute, (&execFlag));
       	printf("execFlag of funcEntry : %d\n", *execFlag);
        if(*execFlag == 1){ 
	    	printf("funcEntry executed\n");
	    	printf("retSymVal : %s\n",ret_SymValue);
	    	if(ret_ConValue == NULL){
		  	printf("no return concrete value\n");
		}
	        else{
	    		printf("retConVal \"%d\"\n",*((int *)(ret_ConValue)));
	        }
	    	funcVars* fv = (funcVars*) malloc (sizeof(funcVars));
	    	stackPop(symStack, (&fv));
	    	int j;
	   	for(j=0; j < fv->noOfVars; j++){
			deleteEntryUsingVar(fv->vars[j]);
			deleteEntryUsingVar(get_vnameHash(fv->vars[j]));
			del_vnameHash(fv->vars[j]);
	    	}
	    	int k;
	    	for(k=0; k < fv->noOfLocals; k++){
			deleteEntryUsingVar(get_vnameHash(fv->locals[k]));
			del_vnameHash(fv->locals[k]);
	    	}
	    	//free(fv);
	    	printf("Stack depth %d\n", stackSize(symStack));
	}
	else
    	    printf("funcEntry did not execute.....must be concolic\n");
}

int getExecutionFlag(){
    if(didFuncEntryExecute == NULL || stackIsEmpty(didFuncEntryExecute)){
        return 1;
    }
    else{
        int* execFlag = (int *)malloc(sizeof(int));
        stackPeek(didFuncEntryExecute,&execFlag);
        return *execFlag;
    }
}

void testgen_exit(){
    programFlag = 1;
    return;
}

void mapConcolicValues (char* retVarName, void* concValue){
    ret_ConValue = NULL;
    ret_SymValue = (char *)malloc(100*sizeof(char));
    if(getExecutionFlag() == 1){
	char* vn;
	vn = get_vnameHash(retVarName);
	if(vn == NULL){
	    ret_SymValue = find_symVal(retVarName);
	    ret_ConValue = find_conVal(retVarName);
	}
	else{
	    ret_SymValue = find_symVal(vn);
	    ret_ConValue = find_conVal(vn);
	}
	if(ret_SymValue == NULL){
	    printf("symValue for variable \"%s\" not found\n", retVarName);
	}
	else{
	    printf("symValue for variable \"%s\" is \"%s\"\n",retVarName,ret_SymValue);
	    if(ret_ConValue == NULL){
	    	printf("no return concrete value\n");
	    }
	    else{
	    	printf("ConValue for variable \"%s\" is \"%d\"\n",retVarName,*((int *)(ret_ConValue)));
	    }
	}
    }
    else{
	//strcpy(ret_SymValue,"Constant");
	strcpy(ret_SymValue,"Constant");
	ret_ConValue = concValue;
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
