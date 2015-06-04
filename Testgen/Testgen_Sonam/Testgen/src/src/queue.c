#include "queue.h"

extern int CDG_Module;

void enQueue() {
  int i = 0;

// printf("inside enqueue\n");

  if (CDG_Module)
    return;

// printf("queuing\n");

  struct qnode *newNode = (struct qnode *)malloc(sizeof(struct qnode));
  newNode->next = NULL;
  for (i = 0; i < 50; i++)
    newNode->levelptr[i] = NULL;
  newNode->symbolicNames = NULL;

  if (queue.front == NULL)	//if first node
  {
    queue.front = newNode;
    queue.rear = newNode;
  }

  else {
    queue.rear->next = newNode;
    queue.rear = newNode;
  }
  queue.totalElements++;

}

int isQueueEmpty() {
  if (queue.front == NULL && queue.rear == NULL)
    return 1;

  return 0;
}

int isNotQueueEmpty() {
  if (isQueueEmpty())
    return 0;

  return 1;
}

void deQueue() {
  struct qnode *temp;

  if (queue.front == queue.rear)	//only one element left
  {
    temp = queue.front;
    queue.front = NULL;
    queue.rear = NULL;
  }

  else {
    temp = queue.front;
    queue.front = queue.front->next;
  }

  free(temp);
  queue.totalElements--;
}

void emptyQueue() {
  struct qnode *temp;

  while (!isQueueEmpty()) {
    deQueue();
  }
}
