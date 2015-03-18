#ifndef STACK_H
#define STACK_H

#include <stdlib.h> /* malloc */
#include <string.h> /* memcpy */
#include <assert.h>

typedef struct node{
  void *element;
  struct node *next;  
} node;

typedef struct {
  int elementSize;
  int elementsCnt;
  node *head;
} Stack;


/* stack_new - Allocates space and initialized the stack
 * @element_size - size of a single element of the stack */


Stack* stackNew(int element_size);


/* stack_push - Pushes element to the top of the stack
 * @element - Address of the element to be pushed */


void stackPush(Stack *s, const void *element);


/* stack_pop - Pops the element from the top of the stack and frees the memory
 * @element - Address where the data is to be copied */


void stackPop(Stack *s, void *element);


/* stack_is_empty - Returns 1 is stack is empty 0 otherwise */


int stackIsEmpty(Stack *s);


/* stack_free - Frees the memory allocated to all the elements of the stack */


void stackFree(Stack *s);


/* stack_size - Returns the total number of elements present in the stack */


int stackSize(Stack *s);


/* stack_size - Returns the element at the top of the stack without removing it
 * @element - Address where the top element is to be copied */


void stackPeek(Stack *s, void *element);

#endif
