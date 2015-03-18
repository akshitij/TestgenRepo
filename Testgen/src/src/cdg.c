#include "cdg.h"

int max(int a, int b) {
  return a > b ? a : b;
}

void pushNodeListToStack(Stack * s, CDGNode * node) {
  assert(NULL != node);

  do {
    stackPush(s, &node);
    node = getNextNode(node);
  } while (node);
}

void postOrder(CDGNode * root, Stack * s) {
  if (NULL == root)
    return;
  Stack *temp = stackNew(sizeof(CDGNode *));;
  CDGNode *node;
  CDGNode *listNode;
  pushNodeListToStack(temp, root);
  while (!stackIsEmpty(temp)) {
    stackPop(temp, &node);
    if (getTrueNodeSet(node)) {
      pushNodeListToStack(temp, getTrueNodeSet(node));
    }
    if (getFalseNodeSet(node)) {
      pushNodeListToStack(temp, getFalseNodeSet(node));
    }
    stackPush(s, &node);
  }
  stackFree(temp);
}

CDGNode *getTrueNodeSet(CDGNode * node) {
  return node->trueNodeSet;
}

CDGNode *setTrueNodeSet(CDGNode * node, CDGNode * trueNodeSet) {
  node->trueNodeSet = trueNodeSet;
  return node;
}

CDGNode *getFalseNodeSet(CDGNode * node) {
  return node->falseNodeSet;
}

CDGNode *setFalseNodeSet(CDGNode * node, CDGNode * falseNodeSet) {
  node->falseNodeSet = falseNodeSet;
  return node;
}

CDGNode *setNextNode(CDGNode * node, CDGNode * nextNode) {
  node->next = nextNode;
  if (nextNode)
    setParent(nextNode, getParent(node));
  return node;
}

CDGNode *setTrueNodeSetScore(CDGNode * node, int score) {

  CDGNode *curr;
  curr = getTrueNodeSet(node);

  while (curr != NULL) {
    setScore(curr, score);
    curr = curr->next;
  }

  return node;
}

CDGNode *setFalseNodeSetScore(CDGNode * node, int score) {

  CDGNode *curr;
  curr = getFalseNodeSet(node);

  while (curr != NULL) {
    setScore(curr, score);
    curr = curr->next;
  }

  return node;
}

CDGNode *getLastNode(CDGNode * node) {
  assert(NULL != node);
  CDGNode *curr = node;
  while (getNextNode(curr)) {
    curr = getNextNode(curr);
  }
  return curr;
}

int isLeaf(CDGNode * node) {
  if (getTrueNodeSet(node) || getFalseNodeSet(node))
    return 0;
  return 1;
}

int getConditionalNodeSum(CDGNode * node) {
  int sum = 0;
  while (node != NULL) {
    if (!isLeaf(node)) {
      sum += getScore(node);
    }
    node = getNextNode(node);
  }
  return sum;
}

int hasUncoveredChild(CDGNode * node, int branch) {
  CDGNode *temp;
  if (branch)
    temp = getTrueNodeSet(node);
  else
    temp = getFalseNodeSet(node);
  while (temp) {
    if (isLeaf(temp) && 0 < getScore(temp))
      return 1;
    temp = getNextNode(temp);
  }
  return 0;
}

int hasUncoveredBranch(CDGNode * node, int branch) {
  if (branch && NULL == getTrueNodeSet(node))
    return 0;
  if (0 == branch && NULL == getFalseNodeSet(node))
    return 0;
  if (0 == getBranchInfo(getID(node), branch))
    return 1;
  return 0;
}

int hasConditionalChild(CDGNode * node) {
  CDGNode *temp;
  temp = getTrueNodeSet(node);
  while (temp) {
    if (!isLeaf(temp))
      return 1;
    temp = getNextNode(temp);
  }
  temp = getFalseNodeSet(node);
  while (temp) {
    if (!isLeaf(temp))
      return 1;
    temp = getNextNode(temp);
  }
  return 0;
}

int isConditionalLeaf(CDGNode * node) {
  if (isLeaf(node))
    return 0;
  if (!hasConditionalChild(node))
    return 1;
  if (0 < getConditionalNodeSum(getTrueNodeSet(node)))
    return 0;
  if (0 < getConditionalNodeSum(getFalseNodeSet(node)))
    return 0;
  return 1;
}

CDGNode *resetExpr(CDGNode * node) {
  if (NULL != node->expr)
    free(node->expr);
  return node;
}

CDGNode *resetTrueNodeSet(CDGNode * node) {
  node->trueNodeSet = NULL;
  return node;
}

CDGNode *resetFalseNodeSet(CDGNode * node) {
  node->falseNodeSet = NULL;
  return node;
}

CDGNode *resetParent(CDGNode * node) {
  node->parent = NULL;
  return node;
}

CDGNode *resetNextNode(CDGNode * node) {
  node->next = NULL;
  return node;
}

CDGNode *getMaxScoreConditionNode(CDGNode * node) {
  CDGNode *out = NULL;
  do {
    if (!isLeaf(node) && 0 < getScore(node)) {
      if ((NULL == out) || (getScore(out) < getScore(node))) {
	out = node;
      }
    }
    node = getNextNode(node);
  } while (NULL != node);
  return out;
}

CDGNode *getMaxScoreConditionChildNode(CDGNode * node, int *outcome) {
  CDGNode *maxTrue = NULL;
  CDGNode *maxFalse = NULL;
  if (getTrueNodeSet(node)) {
    maxTrue = getMaxScoreConditionNode(getTrueNodeSet(node));
  }
  if (getFalseNodeSet(node)) {
    maxFalse = getMaxScoreConditionNode(getFalseNodeSet(node));
  }
  if (NULL == maxFalse) {
    *outcome = 1;
    return maxTrue;
  }
  if (NULL == maxTrue) {
    *outcome = 0;
    return maxFalse;
  }
  if (getScore(maxTrue) < getScore(maxFalse)) {
    *outcome = 0;
    return maxFalse;
  }
  *outcome = 1;
  return maxTrue;
}

CDGNode *newNode(int id, int score, int outcome, const char *expr, CDGNode * trueNodeSet, CDGNode * falseNodeSet, CDGNode * parent, CDGNode * next) {
  CDGNode *node;
  node = (CDGNode *) malloc(sizeof(CDGNode));
  assert(NULL != node);
  setID(node, id);
  setScore(node, score);
  setOutcome(node, outcome);
  setExpr(node, expr);
  setTrueNodeSet(node, trueNodeSet);
  setFalseNodeSet(node, falseNodeSet);
  setParent(node, parent);
  setNextNode(node, next);
  return node;
}

CDGNode *newBlankNode() {
  return newNode(-1, 1, 1, NULL, NULL, NULL, NULL, NULL);
}

void deleteNode(CDGNode * node) {
  assert(NULL != node);
  /* resetExpr(node);
     resetTrueNodeSet(node);
     resetFalseNodeSet(node);
     resetParent(node);
     resetNextNode(node); */
  free(node);
}

void deleteNodeList(CDGNode * node) {
  assert(NULL != node);
  CDGNode *next;
  do {
    next = getNextNode(node);
    deleteNode(node);
    node = next;
  } while (node);
}

void deleteCDG(CDGNode * root) {
  if (NULL == root)
    return;
  CDGNode *node;
  Stack *nodeStack = stackNew(sizeof(CDGNode *));
  postOrder(root, nodeStack);
  while (!stackIsEmpty(nodeStack)) {
    stackPop(nodeStack, &node);
    deleteNode(node);
  }
  stackFree(nodeStack);
}

int getID(CDGNode * node) {
  return node->id;
}

CDGNode *setID(CDGNode * node, int id) {
  node->id = id;
  return node;
}

int getScore(CDGNode * node) {
  return node->score;
}

CDGNode *setScore(CDGNode * node, int score) {

  node->score = score;
  return node;
}

int getOutcome(CDGNode * node) {
  return node->outcome;
}

CDGNode *setOutcome(CDGNode * node, int outcome) {
  node->outcome = outcome;
  return node;
}

char *getExpr(CDGNode * node) {

  if (node->expr != NULL)
    return node->expr;

  return NULL;
}

CDGNode *setExpr(CDGNode * node, const char *expr) {
  if (NULL == expr) {
    node->expr = NULL;
    return node;
  }
  node->expr = (char *)malloc(sizeof(char) * (strlen(expr) + 1));
  strcpy(node->expr, expr);
  return node;
}

CDGNode *addTrueNode(CDGNode * node, CDGNode * trueNode) {
  if (NULL == trueNode)
    return node;
  trueNode->next = node->trueNodeSet;
  node->trueNodeSet = trueNode;
  setParent(trueNode, node);
  return node;
}

CDGNode *addFalseNode(CDGNode * node, CDGNode * falseNode) {
  if (NULL == falseNode)
    return node;
  falseNode->next = node->falseNodeSet;
  node->falseNodeSet = falseNode;
  setParent(falseNode, node);
  return node;
}

CDGNode *getParent(CDGNode * node) {
  return node->parent;
}

CDGNode *setParent(CDGNode * node, CDGNode * parentNode) {
  node->parent = parentNode;
  return node;
}

CDGNode *getNextNode(CDGNode * node) {
  return node->next;
}

CDGNode *updateScore(CDGNode * node, int initialize) {
  assert(NULL != node);

  if (isLeaf(node))
    return node;
  if (isConditionalLeaf(node)) {

    if (initialize) {
      if (getBranchInfo(node->id, 1) && !getBranchInfo(node->id, 0)) {
	setScore(node, 1);
	setTrueNodeSetScore(node, 0);
        setFalseNodeSetScore(node, 1);
	return setOutcome(node, 0);
      } else if (getBranchInfo(node->id, 0) && !getBranchInfo(node->id, 1)) {
	setScore(node, 1);
	setFalseNodeSetScore(node, 0);
        setTrueNodeSetScore(node, 1);
	return setOutcome(node, 1);
      } else if (getBranchInfo(node->id, 0) && getBranchInfo(node->id, 1)) {
	setScore(node, 0);
	setTrueNodeSetScore(node, 0);
	setFalseNodeSetScore(node, 0);
	return setOutcome(node, 1);
      }

    }

    else {
      if (hasUncoveredChild(node, 1)) {
	setScore(node, 1);
	return setOutcome(node, 1);
      }
      if (hasUncoveredChild(node, 0)) {
	setScore(node, 1);
	return setOutcome(node, 0);
      }

    }
    setScore(node, 0);
    return setOutcome(node, 1);
  }
  int trueScore = getConditionalNodeSum(getTrueNodeSet(node));
  int falseScore = getConditionalNodeSum(getFalseNodeSet(node));
  if (trueScore >= falseScore) {

    if (node->id == 0) {
      setScore(node, trueScore);
      setOutcome(node, 1);
    }

    else {
      if (getBranchInfo(node->id, 1) && getBranchInfo(node->id, 0))
	setScore(node, trueScore);
      else
	setScore(node, trueScore + 1);

      setOutcome(node, 1);
    }
  }

  else {
    if (node->id == 0) {
      setScore(node, falseScore);
      setOutcome(node, 0);
    } else {
      if (getBranchInfo(node->id, 1) && getBranchInfo(node->id, 0))
	setScore(node, falseScore);
      else
	setScore(node, falseScore+1);
      setOutcome(node, 0);
    }
  }
  return node;
}


CDGNode *propagateScoreChange(CDGNode * node) {
  CDGNode *currNode;
  currNode = node;
  while (currNode) {
    updateScore(currNode, 0);
    currNode = getParent(currNode);
  }
  return node;
}



CDGNode *visitAnyOneNode(CDGNode * node) {
  assert(NULL != node);
  do {
    if (isLeaf(node) && 1 == getScore(node)) {
      setScore(node, 0);
      return node;
    }
    node = getNextNode(node);
  } while (node);
  return NULL;
}

CDGNode *visitAnyOneChild(CDGNode * node) {
  CDGNode *child = NULL;
  if (getFalseNodeSet(node)) {
    child = visitAnyOneNode(getFalseNodeSet(node));
  }
  if (NULL == child && getTrueNodeSet(node)) {
    child = visitAnyOneNode(getTrueNodeSet(node));
  }

  assert(NULL != child);
  return child;
}

CDGNode *unVisitNode(CDGNode * node) {
  return setScore(node, 1);
}

CDGNode *updateCDG(CDGNode * root, int initialize) {
  int size = sizeof(CDGNode *);

  assert(NULL != root);
  Stack *nodeStack = stackNew(size);
  CDGNode *node;
  postOrder(root, nodeStack);
  while (!stackIsEmpty(nodeStack)) {
    stackPop(nodeStack, &node);
    updateScore(node, initialize);
  }
  stackFree(nodeStack);
  return root;
}

void visitChildren(CDGNode * node, int outcome) {
  CDGNode *children;
  if (outcome) {
    children = getTrueNodeSet(node);
  } else {
    children = getFalseNodeSet(node);
  }
  while (children) {
    if (isLeaf(children)) {
      setScore(children, 0);
    }
    children = getNextNode(children);
  }
  return;
}

void visitIfExists(CDGNode * node, CDGNode * nodes[], int size) {
  int i;
  for (i = 0; i < size; i++) {
    if (getID(node) == getID(nodes[i])) {
      visitChildren(node, getOutcome(nodes[i]));
      return;
    }
  }
  return;
}

void coverNodes(CDGNode * root, CDGNode * nodes[], int size) {
  assert(NULL != root);
  if (0 == size)
    return;
  Stack *nodeStack = stackNew(sizeof(CDGNode *));
  CDGNode *node;
  postOrder(root, nodeStack);
  while (!stackIsEmpty(nodeStack)) {
    stackPop(nodeStack, &node);
    visitIfExists(node, nodes, size);
  }
  updateCDG(root, 0);
  return;
}

CDGPath *setPathNode(CDGPath * path, CDGNode * node) {
  assert(NULL != path);
  path->node = node;
  return path;
}

CDGPath *setNextPath(CDGPath * path, CDGPath * nextPath) {
  assert(NULL != path);
  path->next = nextPath;
  return path;
}

CDGPath *newPath() {
  CDGPath *path;
  path = (CDGPath *) malloc(sizeof(CDGPath));
  assert(NULL != path);
  setPathNode(path, NULL);
  setNextPath(path, NULL);
  return path;
}

CDGNode *getPathNode(CDGPath * path) {
  assert(NULL != path);
  return path->node;
}

CDGPath *getNextPath(CDGPath * path) {
  assert(NULL != path);
  return path->next;
}

CDGNode *copyToPathNode(CDGNode * pathNode, CDGNode * node) {
  assert(NULL != pathNode);
  setID(pathNode, getID(node));
  setExpr(pathNode, getExpr(node));
  setOutcome(pathNode, getOutcome(node));
  return pathNode;
}

CDGNode *pathToList(CDGNode * head) {
  assert(NULL != head);
  Stack *nodeStack = stackNew(sizeof(CDGNode *));
  CDGNode *node;
  CDGNode *list = NULL;
  postOrder(head, nodeStack);
  while (!stackIsEmpty(nodeStack)) {
    stackPop(nodeStack, &node);
    list = setNextNode(copyToPathNode(newBlankNode(), node), list);
  }
  return list;
}

CDGNode *getTopPath(CDGNode * node, Stack * changedNodes, Stack * changedBranches) {
  CDGNode *pathNode = newBlankNode();
  CDGNode *temp = pathNode;
  int branch;
  while (node) {
    if (0 != getScore(node)) {
      stackPush(changedNodes, &node);
      branch = getOutcome(node);
      stackPush(changedBranches, &branch);
      if (isLeaf(node)) {
	setScore(node, 0);
      } else {
	setNextNode(temp, copyToPathNode(newBlankNode(), node));
	temp = getNextNode(temp);
	if (getOutcome(node)) {
	  setBranchInfo(getID(node), 1, getBranchInfo(getID(node), 0));
	  setTrueNodeSet(temp, getTopPath(getTrueNodeSet(node), changedNodes, changedBranches));
	} else {
	  setBranchInfo(getID(node), getBranchInfo(getID(node), 1), 1);
	  setFalseNodeSet(temp, getTopPath(getFalseNodeSet(node), changedNodes, changedBranches));
	}
      }
    }
    node = getNextNode(node);
  }
  if (temp == pathNode) {
    deleteNode(pathNode);
    pathNode = NULL;
  } else {
    temp = pathNode;
    pathNode = getNextNode(pathNode);
    deleteNode(temp);
  }
  return pathNode;
}

CDGPath *getTopPaths(CDGContext * ctx, CDGNode * root, int numberOfPaths) {
  CDGPath *pathHead = NULL;
  CDGNode *path;
  CDGPath *currPath;
  CDGNode *node;
  int branch;
  Stack *changedNodes = stackNew(sizeof(CDGNode *));
  Stack *changedBranches = stackNew(sizeof(int));
  while (numberOfPaths--) {
    path = getTopPath(root, changedNodes, changedBranches);
    if (NULL == path)
      break;
    if (NULL == pathHead) {
      pathHead = setPathNode(newPath(), path);
      currPath = pathHead;
    } else {
      setNextPath(currPath, setPathNode(newPath(), path));
      currPath = getNextPath(currPath);
    }
    updateCDG(root, 0);
  }
  while (!stackIsEmpty(changedNodes) && !stackIsEmpty(changedBranches)) {
    stackPop(changedNodes, &node);
    stackPop(changedBranches, &branch);
    if (isLeaf(node)) {
      setScore(node, 1);
    } else {
      if (branch)
	setBranchInfo(getID(node), 0, getBranchInfo(getID(node), 0));
      else
	setBranchInfo(getID(node), getBranchInfo(getID(node), 1), 0);
    }

  }
  updateCDG(root, 0);
  stackFree(changedNodes);
  stackFree(changedBranches);

  /* Updating context */
  (*ctx).topPaths = pathHead;

  /* Ensuring atleast one path was found */
  if (NULL == pathHead)
    return NULL;

  /* Creating list of nodes from complicated path form */
  CDGPath *outPathHead = NULL;
  currPath = NULL;
  path = NULL;
  while (NULL != pathHead) {
    path = getPathNode(pathHead);
    if (NULL == outPathHead) {
      outPathHead = setPathNode(newPath(), pathToList(path));
      currPath = outPathHead;
    } else {
      setNextPath(currPath, setPathNode(newPath(), pathToList(path)));
      currPath = getNextPath(currPath);
    }
    pathHead = getNextPath(pathHead);
  }

  return outPathHead;
}

void deletePaths(CDGPath * path) {
  assert(NULL != path);
  CDGPath *next;
  do {
    next = getNextPath(path);
    deleteNodeList(getPathNode(path));
    setNextPath(path, NULL);
    free(path);
    path = next;
  } while (path);
}

CDGNode *addDummyNodes(CDGNode * node) {
  while (node) {
    if (!isLeaf(node)) {
      if (NULL == getTrueNodeSet(node)) {
	addTrueNode(node, newBlankNode());
      } else if (NULL == getFalseNodeSet(node)) {
	addFalseNode(node, newBlankNode());
      }
    }
    addDummyNodes(getTrueNodeSet(node));
    addDummyNodes(getFalseNodeSet(node));
    node = getNextNode(node);
  }
  return node;
}

CDGNode *findNode(CDGNode * node, int id) {
  if (NULL == node)
    return NULL;
  if (id == getID(node))
    return node;

  CDGNode *temp = NULL;
  /* temp = findNode(getTrueNodeSet(node),id);
   * 
   * if ( temp ) return temp;
   * 
   * temp = findNode(getFalseNodeSet(node), id);
   * if ( temp ) return temp; */
  return findNode(getNextNode(node), id);
}

int nodeExists(CDGNode * node, int id) {
  return NULL != findNode(node, id);
}

CDGNode *buildFeasiblePath(CDGNode * node, CDGNode * list) {
  while (node && 0 == nodeExists(list, getID(node))) {
    node = getNextNode(node);
  }

  if (NULL == node)
    return NULL;

  CDGNode *out = NULL;
  out = copyToPathNode(newBlankNode(), node);
  setTrueNodeSet(out, buildFeasiblePath(getTrueNodeSet(node), list));
  setFalseNodeSet(out, buildFeasiblePath(getFalseNodeSet(node), list));
  setNextNode(out, buildFeasiblePath(getNextNode(node), list));

  return out;
}

CDGNode *getFeasiblePath(CDGNode * path, CDGNode * list) {
  return buildFeasiblePath(path, list);
}

CDGNode *getFeasibleSatNodes(CDGContext * ctx, int pathRank, CDGNode * list) {
  assert(NULL != ctx);
  assert(NULL != (*ctx).topPaths);
  CDGPath *topPath = (*ctx).topPaths;
  while (0 < pathRank--) {
    topPath = getNextPath(topPath);
  }
  return pathToList(getFeasiblePath(getPathNode(topPath), list));
}

int getPathLength(CDGNode * node) {
  if (NULL == node)
    return 0;
  return 1 + getPathLength(getNextNode(node));
}

/*int getPathLength(CDGNode* node) {
  if ( NULL == node ) return 0;
  return 1 + getPathLength(getTrueNodeSet(node)) + getPathLength(getFalseNodeSet(node)) + getPathLength(getNextNode(node));
 }*/
