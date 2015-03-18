#include<stdio.h>
#include<stdlib.h>
#include<string.h>

/* treeNode - Holds info about the nesting level of conditions in form of a tree for each test run
 * @sid - Statement id for decision statements
 * @level - Defines the nesting level of decision statement
 * @outcome - Outcome of decision statement 1/0 for true/false respectively
 * @fchild - Points to first child node in terms of nesting
 * @parent - Parent of current node
 * @next - Next tree node at the same level */

struct treeNode
{
  int sid;
  int level;
  int outcome;
  char* texp;
  char* fexp;
  struct treeNode *fchild;
  struct treeNode *parent;
  struct treeNode *next;
};

/* getSid - Returns the statement id of a tree node
 * @node - tree node */
int getSid(struct treeNode* node);

/* getLevel - Returns the nesting level of a tree node
 * @node - tree node */
int getLevel(struct treeNode* node);

/* getOutcome - Returns the outcome of a tree node
 * @node - tree node */
int getNodeOutcome(struct treeNode* node);

/* getFchild - Returns the first child of a tree node ie, at next nesting level
 * @node - tree node */
struct treeNode* getFchild(struct treeNode* node);

/* getParent - Returns the parent of a tree node
 * @node - tree node */
struct treeNode* getNodeParent(struct treeNode* node);

/* getNextnode - Returns the next node at the same level of a tree node
 * @node - tree node */
struct treeNode* getNextnode(struct treeNode* node);


/* setSid - sets the statement id of a tree node
 * @node - tree node 
 * @sid - statement id */
struct treeNode* setSid(struct treeNode* node, int sid);

/* setLevel - sets the level of a tree node
 * @node - tree node 
 * @level - level */
struct treeNode* setLevel(struct treeNode* node , int level);

/* setOutcome - sets the outcome of a tree node
 * @node - tree node 
 * @outcome - outcome of node */
struct treeNode* setNodeOutcome(struct treeNode* node, int outcome);

/* setFchild - sets the first child of a tree node
 * @node - tree node 
 * @child - child node */
struct treeNode* setFchild(struct treeNode* node ,struct treeNode* child);

/* setParent - sets the parent of a tree node
 * @node - tree node 
 * @parent - parent node */
struct treeNode* setNodeParent(struct treeNode* node, struct treeNode* parent);

/* setNextnode - sets the next node of a tree node
 * @node - tree node 
 * @nxt - next node */
struct treeNode* setNextnode(struct treeNode* node, struct treeNode* nxt);


/* getFirstNodeAtLevel - gets first node at a particular level for a testrun
 * @level - nesting level  */
struct treeNode* getFirstNodeAtLevel(int level);

/* setFirstNodeAtLevel - sets first node at a particular level for a testrun
 * @level - nesting level 
 * @node - tree node */
void setFirstNodeAtLevel(int level, struct treeNode* node);

/* ifFirstChild - checks if a node is first child
 * @node - tree node */
int ifFirstChild(struct treeNode* node);

/* newtreeNode - 
 * @sid - statement id 
 * @level - nesting level
 * @condition - predicate of conditional node */
struct treeNode* newtreeNode(int sid, int level,char* texp, char* fexp, int outcome);

/* addToTree - add a node to the tree
 * @sid - statement id
 * @level - nesting level
 * @pid - id of parent
 * @outcome - outcome*/
void addToTree(int sid, int level, char* texp, char* fexp, int pid, int outcome);

/* printing complete level tree */
void printLevel();

void clearTreeNodes();


