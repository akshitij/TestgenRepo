#ifndef FLATDS_H
#define FLATDS_H
#include <stdio.h>
#include <string.h> /* strcpy */
#include <stdlib.h> /* malloc */
#include <assert.h>
#include "uthash.h"

#define MAX_INT 2147483647

typedef enum ObjectType {
  CHAR,
  INT,
  FLOAT,
  ARRAY,
  STRUCT
} ObjectType;

typedef struct ObjectHT {
  char *field;
  char *symName;
  void* val;
  UT_hash_handle hh;
} ObjectHT;

typedef struct MainHT {
  int key;
  ObjectHT* val;
  UT_hash_handle hh;
} MainHT;


MainHT *mainHT = NULL;

/* load - Returns a pointer to field of given object
* @addr - Address of the object
* @field - Field to get
* @type - Type of the field */
void *load(void *addr, char *field, int t);

/* store - stores value of a field of given object
* @addr - Address of the object
* @field - Field to get
* @type - Type of the field
* @value - valud of the field */
void store(void* addr, char* field, int type, void* value, char* sname);

/* getSymName - Returns symbolic name of a field of given object
* @addr - Address of the object
* @field - Field to get */
char* getSymName(void* addr, char* field);

/* setValue - sets value of a field of object using symbolic name
* @symName - Symbolic name of the field
* @type - Type of the field
* @value - valud of the field */
void setValue(char* symName, int type, void* value);

/* getValue - Returns value of a field of object using symbolic name
* @symName - Symbolic name of the field */
void* getValue(char* symName);


void UpdateSymName(char* symName, char* sname);

ObjectType getObjectType(int t);

#endif

 


