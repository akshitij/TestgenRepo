#include "sidTable.h"
#include "cdg.h"
#include "symbolicExec.h"
#include "directAndSolve.h"

struct my_struct *conditions = NULL;

void isCopyOf(int copysid, int orgsid) {
  unrolledCopies[copysid] = orgsid;
}

void initUnrolledCopies() {
  int maxCopies = 500;
  unrolledCopies = (int *) malloc( sizeof(int) * maxCopies);
  for(int i = 0; i < maxCopies; i++) {
    unrolledCopies[i] = -1;
  }
}

void initSID() {
  initUnrolledCopies();
}

void add_condition(int sid, char *exp1, char *exp2, int tb, int fb) {
  struct my_struct *s;

  HASH_FIND_INT(conditions, &sid, s);
  if (s == NULL) {
    s = (struct my_struct *)malloc(sizeof(struct my_struct));
    s->sid = sid;
    HASH_ADD_INT(conditions, sid, s);
    s->true_expr = (char *)malloc(sizeof(char) * (strlen(exp1) + 1));
    s->false_expr = (char *)malloc(sizeof(char) * (strlen(exp2) + 1));
  }

  strcpy(s->true_expr, exp1);
  strcpy(s->false_expr, exp2);
  s->trueblk = tb;
  s->falseblk = fb;
}

struct my_struct *find_condition(int sid) {
  struct my_struct *s;
  HASH_FIND_INT(conditions, &sid, s);
  return s;
}

int getTrueBlockSeen(int sid) {
  struct my_struct *s;
  HASH_FIND_INT(conditions, &sid, s);
  return s->trueblk;
}

int getFalseBlockSeen(int sid) {
  struct my_struct *s;
  HASH_FIND_INT(conditions, &sid, s);
  return s->falseblk;
}

char *getTrueExpr(int sid) {
  struct my_struct *s;
  HASH_FIND_INT(conditions, &sid, s);
  return s->true_expr;
}

char *getFalseExpr(int sid) {
  struct my_struct *s;
  HASH_FIND_INT(conditions, &sid, s);
  return s->false_expr;
}

void setTrueExpr(int sid, char *expr) {
  char *str, *t;
  if (CDG_Module == 1) {
    CDGNode *temp = pathNode[sid];

    if (temp != NULL && temp->outcome) {
      t = temp->expr;
      free(t);
      str = (char *)getPrepositionalFormula(expr);
      temp->expr = (char *)malloc(sizeof(char) * (strlen(str) + 1));
      strcpy(temp->expr, str);
    }
    return;
  }

  struct my_struct *s;
  HASH_FIND_INT(conditions, &sid, s);
  t = s->true_expr;
  free(t);
  str = (char *)getPrepositionalFormula(expr);
  s->true_expr = (char *)malloc(sizeof(char) * (strlen(str) + 1));
  strcpy(s->true_expr, str);
}

void setFalseExpr(int sid, char *expr) {
  char *str, *t;
  if (CDG_Module == 1) {
    CDGNode *temp = pathNode[sid];

    if (temp != NULL && !temp->outcome) {
      t = temp->expr;
      free(t);
      str = (char *)getPrepositionalFormula(expr);
      temp->expr = (char *)malloc(sizeof(char) * (strlen(str) + 1));
      strcpy(temp->expr, str);
    }
    return;
  }

  struct my_struct *s;
  HASH_FIND_INT(conditions, &sid, s);
  t = s->false_expr;
  free(t);
  str = (char *)getPrepositionalFormula(expr);
  s->false_expr = (char *)malloc(sizeof(char) * (strlen(str) + 1));
  strcpy(s->false_expr, str);
}

int countTotalConditions() {
  int count = HASH_COUNT(conditions);
  return count;
}

int countCoveredConditions() {
  int count = 0;

  struct my_struct *s;

  for (s = conditions; s != NULL; s = s->hh.next) {
    if (s->trueblk == 1 && s->falseblk == 1)
      count = count + 2;
    else if (s->trueblk == 1 && (s->falseblk == 0 || s->falseblk == -1))
      count = count + 1;
    else if ((s->trueblk == 0 || s->trueblk == -1) && s->falseblk == 1)
      count = count + 1;

  }
  return count;
}

int countOrgTotalConditions() {
  int count = 0;

  struct my_struct *s;

  for (s = conditions; s != NULL; s = s->hh.next) {
    if ( unrolledCopies[s->sid] == s->sid || unrolledCopies[s->sid] == -1 ) {
      count++;
    }
  }
  return count;  
}

int countOrgCoveredConditions() {
  int count = 0, state, sid, tFlag = 0, fFlag = 0;

  struct my_struct *s, *sorg, *temp;

  for (s = conditions; s != NULL; s = s->hh.next) {
    state = 0;
    sid = unrolledCopies[s->sid];
    // This means the statement is not orignal conditional stmt
    if ( -1 != sid && s->sid != sid ) continue;
    tFlag = fFlag = 0;
    if ( 1 == s->trueblk ) tFlag = 1;
    if ( 1 == s->falseblk ) fFlag = 1;    
    for(temp = conditions; temp != NULL; temp = temp->hh.next) {
      if ( unrolledCopies[temp->sid] == s->sid ) {
        if ( temp->trueblk == 1) tFlag = 1;
        if ( temp->falseblk == 1) fFlag = 1;        
      }
    }
    if ( tFlag ) count++;
    if ( fFlag ) count++;
  }
  return count;
}

int getBranchInfo(int id, int branch) {
  struct my_struct *s;

  HASH_FIND_INT(conditions, &id, s);
  if (branch && s)
    {
      if(s->trueblk == 0)
       return 0;

      return 1;
    }

  if (!branch && s)
    {
      if(s->falseblk == 0)
        return 0;

      return 1;        
    }
    
  return 1;
}

void setBranchInfo(int sid, int tblk, int fblk) {

  if (CDG_Module == 1)
    return;

  struct my_struct *s;

  HASH_FIND_INT(conditions, &sid, s);
  if (tblk && s->trueblk!=1)
    s->trueblk = tblk;

  if (fblk && s->falseblk!=1)
    s->falseblk = fblk;
}


void updateSidForPath(int sid, int outcome)
{
 struct my_struct *s;

 //printf("sid = %d, outcome = %d\n",sid,outcome);

  HASH_FIND_INT(conditions, &sid, s);
  
  if(outcome == 1 && s && s->trueblk!=1)
    s->trueblk = -1;

 else if(outcome == 0 && s && s->falseblk!=1)
    s->falseblk = -1;
    
}



void delete_condition(struct my_struct *s) {
  HASH_DEL(conditions, s);
  free(s);
}

void delete_allConditions() {
  struct my_struct *current_con, *tmp;

  HASH_ITER(hh, conditions, current_con, tmp) {
    HASH_DEL(conditions, current_con);
    free(current_con);
  }
}

void print_conditions() {
  struct my_struct *s;

  //for (s = conditions; s != NULL; s = (struct my_struct *)(s->hh.next)) {
    //printf("sid %d: true:%d false:%d\n", s->sid, s->trueblk, s->falseblk);
  //}
}
