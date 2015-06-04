#include "stack.h"

Stack* stackNew(int elementSize) {
  Stack *s = (Stack*)malloc(sizeof(Stack));
  s->elementSize = elementSize;
  s->elementsCnt = 0;
  s->head = NULL;

 return s;
}

void stackPush(Stack *s, const void *element) {
  node *newHead;
  newHead = (node *) malloc(sizeof(node));
  assert(NULL != newHead);
  newHead->element = malloc(s->elementSize);
  assert(NULL != newHead->element);  
  memcpy(newHead->element, element, s->elementSize);
  newHead->next = s->head;
  s->head = newHead;
  s->elementsCnt++;
}

void stackPop(Stack *s, void *element) {
  assert(!stackIsEmpty(s));
  node *top;
  top = s->head;
  s->head = s->head->next;    
  s->elementsCnt--;  
  memcpy(element, top->element, s->elementSize);
  free(top->element);
  free(top);
}

int stackIsEmpty(Stack *s) {
  if (0 == s->elementsCnt) {
    return 1;
  }
  return 0;
}

void stackFree(Stack *s) {
  int i;
  node *current;
  node *next;  
  current = s->head;
  while ( NULL != current ) {
    next = current->next;
    free(current->element);
    free(current);
    current = next;
  }
  s->head = NULL;
  s->elementsCnt = 0;
}

int stackSize(Stack *s) {
  return s->elementsCnt;
}

void stackPeek(Stack *s, void *element) {
  assert(!stackIsEmpty(s));
  memcpy(element, s->head->element, s->elementSize);  
}
