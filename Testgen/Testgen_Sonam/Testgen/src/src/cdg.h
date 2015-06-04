#ifndef CDG_H
#define CDG_H

#include <stdlib.h>
#include "stack.h"


/* CDGNode - Holds info about a CDG Node
 * @id - Statement id for decision statement and block id for others
 * @score - Metric used to represent the number of uncovered branches
 * @outcome - True/False depending upon the outcome to choose (only used when node is part of path)
 * @expr - Predicate of decision statement, NULL for others
 * @trueNodeSet - Set of CDG nodes on the "true" evaluation side of current node
 * @falseNodeSet - Set of CDG nodes on the "false" evaluation side of current node
 * @parent - Parent of current node
 * @next - Next CDG node in the node list */

typedef struct CDGNode {
  int id;
  int score;
  int outcome;
  char* expr;
  struct CDGNode* trueNodeSet;
  struct CDGNode* falseNodeSet;
  struct CDGNode* parent;
  struct CDGNode* next;        
} CDGNode;


CDGNode* pathNode[100] = {NULL};



/* newNode - Creates and initializes a new CDG node to parameters specified and returns the same node */

CDGNode* newNode(int id, int score, int outcome, const char* expr, CDGNode* trueNodeSet, CDGNode* falseNodeSet, CDGNode* parent, CDGNode* next);


/* newBlankNode - Creates and return a new CDG Node with 0 and NULL assigned to
 *           respective members of node */

CDGNode* newBlankNode();

/* addDummyNodes - Attaches dummy nodes to the decision nodes and return the root pointer back
 * @root - root of the tree */

CDGNode* addDummyNodes(CDGNode* root);

/* deleteNode    - Deallocates the memory allocated to node and its members
 *                 Traverses and recursively deallocates memory allocated to
 *                 - trueNodeSet
 *                 - falseNodeSet
 *                 - next */

void deleteNode(CDGNode* node);


/* getID - Returns the basic block id of a CDG node
 * @node - CDG node */

int getID(CDGNode* node);


/* setID - Sets basic block id of CDG node and returns the same CDG node
 * @bid - Basic block id to set */

CDGNode* setID(CDGNode* node, int id);


/* getScore - Returns the score metric of a CDG node
 * @node - CDG Node */

int getScore(CDGNode* node);


/* setScore - Sets the score metric value and returns same CDG node
 * @score - Score to set */

CDGNode* setScore(CDGNode* node, int score);

/* getOutcome - Returns the outcome of a CDG node
 * @node - CDG Node */

int getOutcome(CDGNode* node);


/* setOutcome - Sets the outcome value and returns same CDG node
 * @outcome - Outcome to set */

CDGNode* setOutcome(CDGNode* node, int outcome);


/* getExpr - Returns the predicate if the node represents a decision node else NULL
 * @node - a CDG node */

char* getExpr(CDGNode* node);


/* setExpr - Sets the expr of CDG node and returns the same node
 * @node - a CDG node
 * @expr - expr to set */

CDGNode* setExpr(CDGNode* node, const char* expr);


/* getTrueNodeSet - Return trueNodeSet of a CDG node
 * @node - a CDG node */

CDGNode* getTrueNodeSet(CDGNode* node);


/* getFalseNodeSet - Return falseNodeSet of a CDG node
 * @node - a CDG node */

CDGNode* getFalseNodeSet(CDGNode* node);

/* addTrueNode - Adds a CDG node to the trueNodeSet of a CDG node and returns the
 *               node to whose trueNodeSet the node was added
 * @node - CDG Node to whose trueNodeSet the node is to be added
 * @trueNode - The CDG node to be added */

CDGNode* addTrueNode(CDGNode* node, CDGNode* trueNode);


/* addFalseNode - Adds a CDG node to the falseNodeSet of a CDG node and returns the
 *                node to whose falseNodeSet the node was added
 * @node - CDG Node to whose falseNodeSet the node is to be added
 * @falseNode - The CDG node to be added */

CDGNode* addFalseNode(CDGNode* node, CDGNode* falseNode);


/* getParent - Returns parent node of a CDG node
 * @node - CDG node */

CDGNode* getParent(CDGNode* node);

/* setParent - Sets the parent of a CDG node and returns that node
 * @node - The node whose parent is to be set
 * @parentNode - The parent node */

CDGNode* setParent(CDGNode* node, CDGNode* parentNode);

/* getNextNode - Returns next CDG node in same set of nodes
 * @node - The node whose next node is to be returned */

CDGNode* getNextNode(CDGNode* node);

/* setNextNode - Sets next CDG node of a node
 * @node - The node whose next is to be set */

CDGNode* setNextNode(CDGNode* node, CDGNode* next);

/* updateScore - Sets the score of node to the max of sum of scores of trueNodeSet
 *               and falseNodeSet
 *               This function assumes that scores of all nodes in trueNodeSet and
 *               falseNodeSets are already updated
 *             - Returns the same CDG node 
 * @node - a CDG node 
 * @initialize - if function is called for initialization/updation (1/0) */

CDGNode* updateScore(CDGNode* node, int initialize);

/* updateCDG - Updates the score of all the nodes of a tree rooted at the 'node'
 *             using updateScore function by traversing in bottom-up fashion
 *           - Returns the same CDG node
 * @node - a CDG node
 * @initialize - if function is called for initialization/updation (1/0) */

CDGNode* updateCDG(CDGNode* node, int initialize);

/* coverNodes - Sets score of basic blocks which are immediate child on outcome side of
 *              nodes in the array to 0 .
 * @root - Root of CDG
 * @nodes - Array of CDGNodes. Will have id and outcome set
 * @size - Size of array */

void coverNodes(CDGNode* root, CDGNode* nodes[], int size);

/* deleteCDG - Deletes all the nodes in the CDG
 * @root - Root of CDG */

void deleteCDG(CDGNode* root);

/* CDGPath - List of CDG paths
 * @node - CDG node - This node will only have id, expr and next
 *         everything else will be either NULL or 0
 * @next - Pointer to next CDG Path */

typedef struct CDGPath {
  struct CDGNode* node;
  struct CDGPath* next;
} CDGPath;

/* getPathNode - Returns the head CDG node of a path
 * @path - a CDG path */

CDGNode* getPathNode(CDGPath* path);

/* getNextPath - Returns pointer to the next CDG path
 * @path - a CDG path */

CDGPath* getNextPath(CDGPath* path);

/* CDGContext - Holds the context of a CDG
* @topPaths - Holds recent topPaths calculated on the CDG */

typedef struct CDGContext{
  struct CDGPath* topPaths;
} CDGContext;

/* getTopPaths - Returns list of score-wise top paths of a CDG
* This returned list will contain straight list of the nodes
* and their respective outcome.
* @ctx - CDG Context
* @node - CDG root node
* @numberOfPaths - Maximum number of paths to be returned */

CDGPath* getTopPaths(CDGContext* ctx, CDGNode* node, int numberOfPaths);

/* getFeasiblePath - Returns the longest path possible with given conditions satisfied
* @pathRank - The 0 based-index of the path used from the above topPaths
* @nodeList - List of nodes which were satfisfied (Necessary Params : id, outcome, next ) */

CDGNode* getFeasibleSatNodes(CDGContext* ctx, int pathRank, CDGNode* nodeList);


/* getPathLength - Returns the number of nodes in the path
 * @path - Start node of the path */

int getPathLength(CDGNode* path);


/* deletePaths - Deallocates memory allocated to path list
 * @path - a path head */

void deletePaths(CDGPath* path);


#endif
