#include "queue.h"

struct treeNode *tree_nodes[100] = { NULL };

int getSid(struct treeNode *node) {
  return node->sid;
}

int getLevel(struct treeNode *node) {
  return node->level;
}

int getNodeOutcome(struct treeNode *node) {
  return node->outcome;
}

struct treeNode *getFchild(struct treeNode *node) {
  return node->fchild;
}

struct treeNode *getNodeParent(struct treeNode *node) {
  return node->parent;
}

struct treeNode *getNextnode(struct treeNode *node) {
  return node->next;
}

struct treeNode *setSid(struct treeNode *node, int sid) {
  node->sid = sid;
  return node;
}

struct treeNode *setLevel(struct treeNode *node, int level) {
  node->level = level;
  return node;
}

struct treeNode *setNodeOutcome(struct treeNode *node, int outcome) {
  node->outcome = outcome;
  return node;
}

struct treeNode *setFchild(struct treeNode *node, struct treeNode *child) {
  node->fchild = child;
  return node;
}

struct treeNode *setNodeParent(struct treeNode *node, struct treeNode *parent) {
  node->parent = parent;
  return node;
}

struct treeNode *setNextnode(struct treeNode *node, struct treeNode *nxt) {
  node->next = nxt;
  return node;
}

struct treeNode *getFirstNodeAtLevel(int level) {
  return queue.rear->levelptr[level];
}

void setFirstNodeAtLevel(int level, struct treeNode *node) {
  queue.rear->levelptr[level] = node;
}

int ifFirstChild(struct treeNode *node) {
  if (getFchild(getNodeParent(node)) == NULL)
    return 1;

  return 0;
}

struct treeNode *newtreeNode(int sid, int level, char *texp, char *fexp, int outcome) {

  struct treeNode *new_treeNode = (struct treeNode *)malloc(sizeof(struct treeNode));

  new_treeNode->sid = sid;
  new_treeNode->level = level;
  new_treeNode->outcome = outcome;
  char *tep, *fep;
  tep = getPrepositionalFormula(texp);
  fep = getPrepositionalFormula(fexp);
  new_treeNode->texp = (char *)malloc(sizeof(char) * (strlen(tep) + 1));
  new_treeNode->fexp = (char *)malloc(sizeof(char) * (strlen(fep) + 1));
  strcpy(new_treeNode->texp, tep);
  strcpy(new_treeNode->fexp, fep);
  new_treeNode->fchild = NULL;
  new_treeNode->parent = NULL;
  new_treeNode->next = NULL;

  return new_treeNode;
}

void addToTree(int sid, int level, char *texp, char *fexp, int pid, int outcome) {

  if (isQueueEmpty())
    return;

  struct treeNode *new_treeNode = newtreeNode(sid, level, texp, fexp, outcome);

  // printf("inside add to tree sid=%d, level=%d\n", sid, level);

  if (getFirstNodeAtLevel(level) == NULL)
    setFirstNodeAtLevel(level, new_treeNode);
  else {
    setNextnode(new_treeNode, getFirstNodeAtLevel(level));
    setFirstNodeAtLevel(level, new_treeNode);
  }

  if (level > 1)		//setting parent pointer
    setNodeParent(new_treeNode, tree_nodes[pid]);

  if (getNodeParent(new_treeNode) != NULL) {
    if (ifFirstChild(new_treeNode))	// setting pointer as first child of parent
      setFchild(getNodeParent(new_treeNode), new_treeNode);
  }

  tree_nodes[sid] = new_treeNode;

  //printf("inside add to tree sid=%d, level=%d, parent = %d\n", new_treeNode->sid, level,pid);
}

void printLevel() {
  int level = 1;

  struct treeNode *curr = getFirstNodeAtLevel(level);

  while (curr != NULL) {
    printf("condition = %d ", curr->sid);
    if (getNodeParent(curr) != NULL)
      printf("parent = %d ", curr->parent->sid);

    if (getFchild(curr) != NULL)
      printf("child = %d \n", curr->fchild->sid);

    curr = getNextnode(curr);
    if (curr == NULL) {
      level++;
      curr = getFirstNodeAtLevel(level);
      printf("\n");
    }
  }

}

void clearTreeNodes() {
  int i;

  for (i = 0; i < 100; i++)
    tree_nodes[i] = NULL;
}
