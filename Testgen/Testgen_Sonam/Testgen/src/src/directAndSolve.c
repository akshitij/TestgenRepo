#include "queue.h"
#include "symbolicExec.h"
#include "sidTable.h"
#include "stringTokenize.h"
#include "directAndSolve.h"


int check_level=1, check_position=0, execution_flag=0, countNoNewConditionAttempts=0;
float previousRunCoverage=0;


void printFile(char *s) {
  FILE *fp = fopen("src/src/printTest.smt", "a");
  if (fp == NULL) {
    printf("Error opening file!\n");
    exit(1);
  }

  fprintf(fp, "%s", s);
  fclose(fp);
}

void constructStringToWriteinFile(char *str1) {

  char *res, *str;

  str = (char *) calloc (strlen(str1) + 1, sizeof(char));
  strcpy(str, str1);
  strcat(str, "\0");

  printFile(":extrafuns (");

  res = strtok(str, "##");
  while (res) {
    printFile("(");
    printFile(res);
    printFile(" Int)");
    res = strtok(NULL, "#");
  }

  printFile(")\n");
  free(str);

}

char *getRearPathCondition() {
  char *str;
  int i = 1;

  str = (char *)malloc(1500);

  struct treeNode *ptr = queue.rear->levelptr[i];

  //printf("total elements in queue: %d\n", queue.totalElements);

  strcpy(str, "");

  while (ptr != NULL) {
    if (ptr->outcome)
      strcat(str, ptr->texp);
    else
      strcat(str, ptr->fexp);

    // printf("inside getRearPathCondition str=%s\n\n",str);

    strcat(str, "##");
    ptr = getNextnode(ptr);

    if (ptr == NULL)		//move to next level
      {
        i++;
        ptr = queue.rear->levelptr[i];
      }
    // else
    //  printf("not null\n");

  }
  strcat(str, "\0");
  return str;
}

char *getFrontPathCondition() {
  char *str;
  int i = 1;

  str = (char *)malloc(1500);

  struct treeNode *ptr = queue.front->levelptr[i];

  strcpy(str, "");

  while (ptr != NULL) {
    if (ptr->outcome)
      strcat(str, ptr->texp);
    else
      strcat(str, ptr->fexp);

    strcat(str, "##");
    ptr = getNextnode(ptr);

    if (ptr == NULL)		//move to next level
      {
        i++;
        ptr = queue.front->levelptr[i];
      }
  }
  strcat(str, "\0");
  return str;
}

void writeConditionsToFile(char *str) {
  char *token;

  FILE *fp = fopen("src/src/printTest.smt", "a");
  if (fp == NULL) {
    printf("Error opening file!\n");
    exit(1);
  }

  token = strtok(str, "##");

  while (token != NULL) {
    strcat(token, "\0");
    fprintf(fp, "  :assumption %s\n", token);

    token = strtok(NULL, "##");

    if (token == NULL)
      fprintf(fp, "%s", " ) ");

  }

  fclose(fp);

}

int getOutputFromConstraintSolver()	//returns 1 for sat and 0 for unsat
{
  char *token, *save;
  int i = 0, len, value, negative = 0;

  //printf("Here\n");

  FILE *pipe = popen("z3 -smt src/src/printTest.smt", "r");
  if (!pipe)
    return 0;
  char buffer[100], result[10000];
  strcpy(result, "\0");
  while (!feof(pipe)) {
    if (fgets(buffer, 1000, pipe) != NULL)
      strcat(result, buffer);

  }
  pclose(pipe);
  //printf("\nResult: \n%s", result);

  len = strlen(result);

  token = getNextTokenFromConstraintSolver(result, &i, len);

  if (NULL != token && strcmp("unsat", token) == 0)
    return 0;

  while (token != NULL) {
    negative = 0;

    switch (token_type) {
    case DELIMETER:
    case OPERATOR:
      break;
    case NUMBER:
      if (*token == '-') {
	negative = 1;
	value = atoi(token + 2);
      }

      else
	value = atoi(token);

      if (negative)
	value = value * -1;

      // printf("save=%s, token=%s value=%d\n",save,token,value);
      updateValBySymbolicName(save, &value);
      break;

    case VARIABLE:
      save = token;
      break;
    }

    token = getNextTokenFromConstraintSolver(&result[i], &i, len);
  }

  return 1;

}

void directPathConditions() {
  char *newPathCondition;
  struct treeNode *curr, *parent, *temp;
  int atleastOneConditionNotCovered = 0, i = 1;
  float percent, orgPercent;
  char *snames;

  //printf("countNoNewConditionAttempts = %d\n",countNoNewConditionAttempts);

  percent =  (countCoveredConditions() * 100)/(2 * countTotalConditions());
  /*printf("\nCOVERAGE = %f....\n",percent);*/
  
  orgPercent =  (countOrgCoveredConditions() * 100)/(2 * countOrgTotalConditions());
  printf("COVERAGE = %f....\n",orgPercent);   
  
  FILE *coveragefile = fopen("src/src/coverage.txt","ab+");
  fprintf(coveragefile, "%.1f\n", orgPercent); 


  if (queue.totalElements == 0 || /*percent >= 80 ||*/ countNoNewConditionAttempts>=10) {
    //printf("All conditions covered...\n");
    emptyQueue();
    return;
  }
  //printf("total elements in queue: %d\n",queue.totalElements);
  char *fpc = getFrontPathCondition();
  // printf(" Path condition = %s\n", fpc);
  fpc = NULL;
  free(fpc);
  //  printf(" path rear condition = %s\n",getRearPathCondition());

  //printf("check level = %d, check position = %d\n", check_level, check_position);

  if(countTotalConditions())
    {
     
      if(execution_flag==1 && previousRunCoverage!=percent)
        countNoNewConditionAttempts=0;

      else if(execution_flag==1 && previousRunCoverage==percent)
        countNoNewConditionAttempts++;

      /*if(percent >= 30 || (execution_flag==1 && previousRunCoverage==percent)) //above this threshold use CDG
        { CDG_Module = 1;
        print_conditions();
        emptyQueue();
        initializeCDG();
        getCDGPaths();
        return;
        }*/
  
      previousRunCoverage=percent;

    }

  // print_conditions();

  newPathCondition = (char *)malloc(1500);
  *newPathCondition = 0;

  //strcpy(newPathCondition, "");

  if (check_position >= 1) {
    if (queue.front->levelptr[check_level + 1] == NULL) {
      //printf("one pc complete\n");
      deQueue();
      check_level = 1;
      check_position = 0;

      if(newPathCondition!=NULL)
        { newPathCondition = NULL;
          free(newPathCondition); }
      execution_flag = 0;
      directPathConditions();
      return;
    }
  }

  curr = queue.front->levelptr[check_level];

  if (check_level == 1 && check_position == 0)	//flip first level
    {
      while (curr != NULL) {
        if (curr->outcome) {
          if (!checkForAllConstants((char *)curr->fexp))
            {strcat(newPathCondition, curr->fexp);      strcat(newPathCondition, "##");}

          if (!getBranchInfo(getSid(curr), 0))
            atleastOneConditionNotCovered = 1;
        } else {
          if (!checkForAllConstants((char *)curr->texp))
            { strcat(newPathCondition, curr->texp);       strcat(newPathCondition, "##");}

          if (!getBranchInfo(getSid(curr), 1))
            atleastOneConditionNotCovered = 1;
        }


        curr = getNextnode(curr);
      }
      strcat(newPathCondition, "\0");
      check_position++;
      //  printf("str=%s\n",newPathCondition);

    }

  else				//check_level and check_position signifies the position of parent treeNode whose next level child has to be considered
    {
      i = 1;
      while (i < check_position && curr != NULL) {
        curr = getNextnode(curr);
        i++;
      }

      if ((i < check_position) || (i == check_position && curr == NULL)) {
        check_level++;
        check_position = 1;

        if(newPathCondition!=NULL){
          newPathCondition = NULL;
          free(newPathCondition);}
        execution_flag = 0;
        directPathConditions();
        return;
      }



      if (getFchild(curr) == NULL) {
        check_position++;

        if(newPathCondition!=NULL){
          newPathCondition = NULL;
          free(newPathCondition); }
        execution_flag = 0;
        directPathConditions();
        return;
      }

      parent = curr;
      temp = queue.front->levelptr[(parent->level + 1)];

      while (temp->parent->sid != parent->sid)
        temp = temp->next;

      curr = temp;

      //printf("curr = %s %d, parent=%d\n",curr->texp,curr->sid,curr->parent->sid);

      while (curr != NULL && curr->parent->sid == parent->sid)	//flip nodes at check_level
        { 
          if (curr->outcome) {
            if (!checkForAllConstants((char *)curr->fexp))
              {strcat(newPathCondition, curr->fexp);      strcat(newPathCondition, "##");}

            if (!getBranchInfo(getSid(curr), 0))
              atleastOneConditionNotCovered = 1;
          } else {
            if (!checkForAllConstants((char *)curr->texp))
              {strcat(newPathCondition, curr->texp);      strcat(newPathCondition, "##");}

            if (!getBranchInfo(getSid(curr), 1))
              atleastOneConditionNotCovered = 1;
          }

          curr = curr->next;
    
        }

      curr = parent;
      while (curr != NULL)	//add all parent nodes
        {
          if (curr->outcome && (!checkForAllConstants((char *)curr->texp)))
            {strcat(newPathCondition, curr->texp);      strcat(newPathCondition, "##");}
          else {
            if (!checkForAllConstants((char *)curr->fexp))
              {strcat(newPathCondition, curr->fexp);       strcat(newPathCondition, "##");}
          }

          curr = getNodeParent(curr);
        }

      curr = queue.front->levelptr[check_level];
      if (getNextnode(curr) == NULL) {
        check_level++;
        check_position = 1;
      } else {
        check_position++;
      }

      strcat(newPathCondition, "\0");
    }				//else end

  if (atleastOneConditionNotCovered == 1 && newPathCondition[0]!='\0') {
    //printf("NEW Condition generated = %s\n", newPathCondition);

    getPrint();
    writeProgramSVariables();
    writeConditionsToFile(newPathCondition);

    if (!getOutputFromConstraintSolver()) {
      remove("src/src/printTest.smt");
      newPathCondition = NULL;
      free(newPathCondition);
      execution_flag = 0;
      countNoNewConditionAttempts++;
      directPathConditions();
      return;
    }
    //print_entry() ;
    remove("src/src/printTest.smt");
    execution_flag = 1;
    clearTreeNodes();
  }

  else {
    //printf("condition already seen find new condition\n");

    if(newPathCondition!=NULL){
      newPathCondition = NULL;
      free(newPathCondition); }
    countNoNewConditionAttempts++;
    directPathConditions();
  }

  if(newPathCondition!=NULL)
    { newPathCondition = NULL; free(newPathCondition);}

}




