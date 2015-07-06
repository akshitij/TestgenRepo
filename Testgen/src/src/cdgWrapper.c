#include <stdio.h>
#include "updateIntegerValues.h"
#include "directAndSolve.h"
#include "sidTable.h"
#include "cdg.h"

#define MAX_NODES  500

CDGNode *nodes[MAX_NODES] = { NULL };	//Holds all the nodes in the tree

CDGNode *root = NULL;

CDGNode *savePath = NULL;
CDGContext ctx;
CDGPath *pathHead;
CDGPath *newSATPath;
int pathRank = 0;

float previousCoverage = 0;
int countAttempts = 0;
int totalTestCases = 0;


void preOrderCDG(CDGNode *);
void addtoCDGnode(int, int, int);
void setArray();
void printArray();
void createCDG(void);
int getTestCases();
void getMaxSatPaths();

// branch variable tell on which branch of parent the node is to be attached 
void addtoCDGnode(int id, int pid, int branch) {
  CDGNode *node, *par;

  if (nodes[pid] == NULL) {
    par = newBlankNode();
    nodes[pid] = par;
    setID(par, pid);
  } else
    par = nodes[pid];

  if (nodes[id] != NULL && nodes[id]->parent != NULL && nodes[id]->parent->id == pid) {
    return;
  }

  if (nodes[id] != NULL)
    node = nodes[id];
  else
    node = newBlankNode();

  //printf("Adding %d->%d\n",pid,id);

  setID(node, id);
  if (0 == id) {
    root = node;
  } else {
    if (branch) {
      addTrueNode(nodes[pid], node);
    } else {
      addFalseNode(nodes[pid], node);
    }
  }
  nodes[id] = node;
}

void setArray(int id, const char *expr) {
  setExpr(nodes[id], expr);
}

void initializeCDG() {
  updateCDG(root, 1);
  //printf("CDG initialized...\n");
  //printArray();
}

void printArray() {
  CDGNode *node = root;
  preOrderCDG(node);
}

void preOrderCDG(CDGNode * node) {
  while (node) {
    //if (0 == getID(node))
      //printf("ID: %d, PID: 0, Score: %d, outcome: %d\n", getID(node), getScore(node), getOutcome(node));
    //else
      //printf("ID: %d, PID: %d, Score: %d, outcome: %d\n", getID(node), getID(getParent(node)), getScore(node), getOutcome(node));
    preOrderCDG(getTrueNodeSet(node));
    preOrderCDG(getFalseNodeSet(node));
    node = getNextNode(node);
  }
}

void printPath(CDGNode * node) {

  while (node) {
    //printf("ID: %d, Outcome: %d, expr: %s\n", getID(node), getOutcome(node), node->expr);
    /* if(getOutcome(node))
       printPath(getTrueNodeSet(node));
       else
       printPath(getFalseNodeSet(node)); */

    node = getNextNode(node);
  }
}

void sortPath() {
  CDGPath *curr, *temp, *save, *next_curr, *prev_curr;
  int l1, i, j;

  curr = newSATPath;
  i = 1;
  prev_curr = newSATPath;

  while (curr != NULL) {

    printf("id = %d\n",curr->node->id);
    l1 = getPathLength(curr->node);

    j = 0;
    save = newSATPath;
    temp = newSATPath;

    next_curr = curr->next;

    while ((j < i) && (l1 < getPathLength(temp->node))) {
      save = temp;
      temp = getNextPath(temp);
      j++;
    }

    if (j == i) {
      prev_curr = curr;
      curr = next_curr;
      i++;
      continue;
    }

    if (save == temp) {
      curr->next = newSATPath;
      newSATPath = curr;
      prev_curr->next = next_curr;
    } else {
      save->next = curr;
      curr->next = temp;
      prev_curr->next = next_curr;
    }

    i++;
    curr = next_curr;
  }

  
  //printf("\n After sorting paths... \n");
     curr = newSATPath;

     while(curr != NULL)
     {
       //printPath(curr->node);
       printf("\n\n");
       curr = curr->next;
     } 
}

void initializePathNodes(CDGNode * node) {
  CDGNode *curr;
  int j;

  for (j = 0; j < 100; j++)
    pathNode[j] = NULL;

  curr = node;

  while (curr != NULL) {
    pathNode[getID(curr)] = curr;
    curr = curr->next;
  }

}

int getConditionalOutcome(int id, int expr) {
  CDGNode *temp;


  if (CDG_Module == 1) {
    temp = pathNode[id];

    if (temp == NULL)
      return expr;

 
    return getOutcome(temp);
  }

  //printf("return value = %d\n",expr);
  return expr;
}


int startCDG()
{
  CDGPath* curr;


  
  if(CDG_Module == 1)
    return 0;

   if(countCoveredConditions() == (2 * countTotalConditions()))
     return 0;

  if(CDG_Module == 2)
    return 1;

  if(countAttempts >= 10)
      {
        //printf("countAttempts = %d\n",countAttempts);
        return 0;
      }  

  previousCoverage =   (countCoveredConditions() * 100) / (2 * countTotalConditions());

   /*if(previousCoverage >= 80)
       return 0;*/


     CDG_Module = 1;
    print_conditions();
     emptyQueue();
     initializeCDG();
  
     //preOrderCDG(root);

     if(newSATPath != NULL)
     deletePaths(newSATPath);

     newSATPath = NULL;

     if(!getCDGPaths())
     {
       //printf("NO Paths left\n");
       return 0;
     }


     curr = newSATPath;
     while(curr != NULL)
      {     
        printPath(curr->node);
        //printf("\n\n");
        curr = curr->next;
      }
     
     
     CDG_Module = 2;
    
    // print_conditions();
     return 1;
  
}


int getCDGPaths() {
  //preOrderCDG(root);


  pathHead = getTopPaths(&ctx, root, 5);

  if(pathHead == NULL)
     return 0;

  ctx.topPaths = pathHead;
  //deleteCDG(root);
  //printf("CDG deleted\n");

  //printf("Got paths\n");
  pathRank = 0;
  while (getMaxFeasible())
   { pathRank++;
     delete_allSTableEntry();
     delete_allStructTableEntry();
   }

  deletePaths(pathHead);
  pathHead = NULL;
  //sortPath();
  pathRank = 0;

  return 1;

}

int getMaxFeasible() {
  CDGPath *currPath;
  CDGNode *save, *curr,*temp;
  CDGPath *pathNode = newBlankNode();
  CDGNode *new_head;
  CDGNode *new_curr;

  char *token, *condition;
  int infeasible, i = 0;


  condition = (char *)malloc(2 * sizeof(char));
  currPath = pathHead;
  strcpy(condition, "");


 // printf("Inside maxfeasible, pathrank = %d\n",pathRank);


  while (i < pathRank) {
    currPath = currPath->next;
    if (currPath == NULL)
      return 0;
    i++;
  }

  new_head = newNode(currPath->node->id, currPath->node->score, currPath->node->outcome, currPath->node->expr, NULL, NULL, NULL, NULL);


  curr = currPath->node->next;
  save = currPath->node;

  //printf("\nActual path......\n");
  //printPath(currPath->node);

  initializePathNodes(currPath->node);
  callInstrumentedFun();

  while(curr != NULL)
  {
    if (checkForAllConstants((char *)curr->expr))
      {save->next = curr->next;
       temp = curr;
       free(temp);
       curr = save->next;
      }

    else
     {
       save = curr;
       curr = curr->next;
     }

  }

 //printf("\nchanged path......\n");
 // printPath(currPath->node);



  //printf("Got symbolic variables\n");

  remove("src/src/printTest.smt");
  getPrint();

  curr = currPath->node->next;
  while (curr != NULL) {
      condition = realloc(condition, (strlen(condition) + strlen(curr->expr) + 1 + 2) * sizeof(char));
      strcat(condition, curr->expr);
      strcat(condition, "##");
    
    curr = curr->next;
  }

  strcat(condition, "\0");

  //constructStringToWriteinFile((char*)getAllSymbolicNamesinAPath(condition));

  //printf("condition= %s\n", condition);
  writeProgramSVariables();
  writeConditionsToFile(condition);

  FILE *pipe = popen("z3/build/maxsat src/src/printTest.smt", "r");
  if (!pipe)
    return 0;
  char buffer[100], result[1000];
  strcpy(result, "\0");
  while (!feof(pipe)) {
    if (fgets(buffer, 1000, pipe) != NULL)
      strcat(result, buffer);

  }
  pclose(pipe);
  //printf("\nResult: \n%s", result);

  curr = currPath->node->next;
  save = new_head;

  if (result[0] != '\0') {
    int i = 0;

    token = strtok(result, " ");
    while (token != NULL) {
      infeasible = atoi(token);
      token = strtok(NULL, " ");

      
     while (i < infeasible) {
	new_curr = newNode(curr->id, curr->score, curr->outcome, curr->expr, NULL, NULL, save, NULL);
	save->next = new_curr;
	save = new_curr;
	curr = curr->next;
         i++;
      }
      if (NULL == curr)
	break;
      curr = curr->next;
       
      i++;
    }
  }
  //append rest of nodes
  while (curr != NULL) {
    new_curr = newNode(curr->id, curr->score, curr->outcome, curr->expr, NULL, NULL, save, NULL);
    save->next = new_curr;
    save = new_curr;
    curr = curr->next;
  }

  /* pathNode->node = new_head;
     pathNode->next = newSATPath;
     newSATPath = pathNode;

     printf("\nAfter MAxSAT Printing path......\n");
     printPath(new_head); */

  pathNode->node = getFeasibleSatNodes(&ctx, pathRank, new_head);
  pathNode->next = newSATPath;
  newSATPath = pathNode;

 // printf("\nAfter feasible Printing path......\n");
 // printPath(pathNode->node);
 
  
  free(condition);
  return 1;
}




int getTestCases() {
  CDGPath *currPath;
  CDGNode *curr;
  float percent, orgPercent;
  int atleastOneConditionNotCovered = 0, i = 0;
  

   currPath = newSATPath;

   percent = (countCoveredConditions() * 100) / (2 * countTotalConditions());
   /*printf("\nCOVERAGE = %f....\n", percent);*/

   orgPercent =  (countOrgCoveredConditions() * 100)/(2 * countOrgTotalConditions());
   printf("COVERAGE = %f....\n",orgPercent); 
  
   FILE *coveragefile = fopen("src/src/coverage.txt", "ab+");
   fprintf(coveragefile, "%.1f\n", orgPercent);

/*if(percent >= 80)
   {CDG_Module=0;countAttempts=11; return 0;}*/

if(savePath != NULL)
 {
  if( previousCoverage == percent)
    {countAttempts++;

     while(savePath != NULL)
      {
        if(savePath->id == 0)
          break;

        updateSidForPath(savePath->id, savePath->outcome);
        savePath = savePath->next;
      } 

    }
 else
    {totalTestCases++; countAttempts = 0;}

 }




  while (i < pathRank) {
    currPath = currPath->next;

    if (currPath == NULL) {
      print_conditions();

      percent = (countCoveredConditions() * 100) / (2 * countTotalConditions());
      /*printf("\nCOVERAGE = %f....\n", percent);*/

      orgPercent =  (countOrgCoveredConditions() * 100)/(2 * countOrgTotalConditions());
      printf("COVERAGE = %f....\n",orgPercent); 
      
      FILE *coveragefile = fopen("src/src/coverage.txt", "ab+");
      fprintf(coveragefile, "%.1f\n", orgPercent);       
      //printf("Total test cases = %d\n",totalTestCases);
      CDG_Module = 0;
      return 0;
    }
    i++;
  }
  //  print_conditions();


  curr = currPath->node;
  savePath = currPath->node;

  remove("src/src/printTest.smt");
  getPrint();
  writeProgramSVariables();

  FILE *fp = fopen("src/src/printTest.smt", "a");
  if (fp == NULL) {
    printf("Error opening file!\n");
    exit(1);
  }

  /*  FILE *fp1 = fopen("output.csv", "a");
     if (fp1 == NULL)
     {
     printf("Error opening file!\n");
     exit(1);
     } */

  //printf("CDG Path constraint: ");

  while (curr != NULL) {
    if (curr->id == 0)
      break;

    if (getOutcome(curr)) {
      if (!checkForAllConstants((char *)curr->expr)) {
	fprintf(fp, "  :assumption %s\n", curr->expr);
	//printf("%s##", curr->expr);
      }

      if (!getBranchInfo(curr->id, 1))
	atleastOneConditionNotCovered = 1;
    } else {
      if (!checkForAllConstants((char *)curr->expr)) {
	fprintf(fp, "  :assumption %s\n", curr->expr);
	//printf("%s##", curr->expr);
      }

      if (!getBranchInfo(curr->id, 0))
	atleastOneConditionNotCovered = 1;
    }

    curr = curr->next;
  }

  //printf("\n");
  fprintf(fp, "%s\n", ")");
  fclose(fp);

  if (atleastOneConditionNotCovered) {
    getOutputFromConstraintSolver();

  }

 

  

  previousCoverage = percent;
  pathRank++;  
  delete_allSTableEntry();
  delete_allStructTableEntry();
  return 1;

}




