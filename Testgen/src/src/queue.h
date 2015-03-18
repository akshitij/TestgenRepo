#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "levelTree.h"

struct qnode
{
  struct treeNode* levelptr[50];
  char *symbolicNames;
  struct qnode* next;  
};

struct Queue
{
  struct qnode* front;
  struct qnode* rear;
  int totalElements;
};

struct Queue queue;

void enQueue();

void deQueue();

int isQueueEmpty();

void emptyQueue();

int isNotQueueEmpty();



