#include "flatds.h"

static int toInt(void *addr) {
  return (size_t) addr % MAX_INT;
}

static int getSizeByType(ObjectType type) {
  int size = 0;
  switch (type) {
  case CHAR:
    size = sizeof(char);
    break;
  case INT:
    size = sizeof(int);
    break;
  case FLOAT:
    size = sizeof(float);
    break;
  case ARRAY:
    break;
  default:
    assert(NULL && "No size for this type");
    break;
  }
  return size;
}

static ObjectHT *newField(char *baseSymName, char *lField, ObjectType type, void *value,char* sname) {
  ObjectHT *o = (ObjectHT *) malloc(sizeof(ObjectHT));
  ObjectHT *objectHT = NULL, *t;
  char base[12] = "baseSymName";
  int size;
 /* o->symName = (char *)malloc(sizeof(char) * (strlen(baseSymName) + strlen(lField) + 1 + 1));
  strcpy(o->symName, baseSymName);
  strcat(o->symName, "_");
  strcat(o->symName, lField); */
  switch (type) {
  case CHAR:
    size = sizeof(char);
    o->val = malloc(size);
    memcpy(o->val, value, size);
    break;
  case INT:
    o->symName = (char *)malloc(sizeof(char) * (strlen(sname) + 1));
    strcpy(o->symName, sname);
    size = sizeof(int);
    o->val = malloc(size);
    memcpy(o->val, value, size);
   addToIntTable(o->symName, (int *)value);
    break;
  case FLOAT:
    o->symName = (char *)malloc(sizeof(char) * (strlen(sname) + 1));
    strcpy(o->symName, sname);
    size = sizeof(float);
    o->val = malloc(size);
    memcpy(o->val, value, size);
    addToFloatTable(o->symName, (float *)value);
    break;
  case ARRAY:
  case STRUCT:
 o->symName = (char *)malloc(sizeof(char) * (strlen(baseSymName) + strlen(lField) + 1 + 1));
  strcpy(o->symName, baseSymName);
  strcat(o->symName, "_");
  strcat(o->symName, lField);

    t = (ObjectHT *) malloc(sizeof(ObjectHT));
    t->field = (char *)malloc(sizeof(char) * (strlen(base) + 1));
    strcpy(t->field, base);
    t->val = malloc(((strlen(o->symName) + 1) * sizeof(char)));
    strcpy(t->val, o->symName);
    HASH_ADD_STR(objectHT, field, t);
    o->val = objectHT;
    break;
  default:
    break;
  }
  o->field = (char *)malloc(sizeof(char) * (strlen(lField) + 1));
  strcpy(o->field, lField);
  return o;
}

static void addField(ObjectHT * objectHT, char *field, ObjectType type, void *value, char* sname) {
  char base[12] = "baseSymName";
  ObjectHT *t;
  HASH_FIND_STR(objectHT, base, t);
  
 
  ObjectHT *o = newField(t->val, field, type, value, sname);
  HASH_ADD_STR(objectHT, field, o);
  
  
}

static ObjectHT *newObject(char *field, ObjectType type, void *value) {
  ObjectHT *objectHT = NULL, *t;
  char baseName[12] = "baseSymName";
  char baseValue[12] = "_", temp[12];
  t = (ObjectHT *) malloc(sizeof(ObjectHT));
  t->field = (char *)malloc(sizeof(char) * (strlen(baseName) + 1));
  strcpy(t->field, baseName);
  HASH_ADD_STR(objectHT, field, t);
  sprintf(temp, "%d", toInt(objectHT));
  strcat(baseValue, temp);
  t->val = malloc(((strlen(baseValue) + 1) * sizeof(char)));
  strcpy(t->val, baseValue);
  return objectHT;
}

void *load(void *addr, char *field, int t) {
  MainHT *m;
  ObjectHT *o;
  ObjectType type;

  type = getObjectType(t);

  int x = toInt(addr);
  HASH_FIND_INT(mainHT, &x, m);
  if (NULL == m) {
    store(addr, field, type, field, "");	// Passing field as a random parameter
    HASH_FIND_INT(mainHT, &x, m);
  }
  HASH_FIND_STR(m->val, field, o);
  assert(NULL != o);
  return o->val;
}

void store(void *addr, char *lField, int t, void *value, char* sname) {
  MainHT *m;
  ObjectType type;

  type = getObjectType(t);

  int lKey = toInt(addr);
  HASH_FIND_INT(mainHT, &lKey, m);
  if (NULL == m) {
    m = (MainHT *) malloc(sizeof(MainHT));
    m->key = lKey;
    m->val = newObject(lField, type, value);
    HASH_ADD_INT(mainHT, key, m);
   } 
  addField(m->val, lField, type, value, sname);
 
}

char *getSymName(void *addr, char *field) {
  MainHT *m;
  ObjectHT *o;
  int x = toInt(addr);
  HASH_FIND_INT(mainHT, &x, m);
  HASH_FIND_STR(m->val, field, o);
  assert(NULL != o);
  return o->symName;
}

ObjectHT *findBySymName(char *symName) {

  MainHT *mn, *tmpMn;
  ObjectHT *object, *tmpObj;
  HASH_ITER(hh, mainHT, mn, tmpMn) {
    HASH_ITER(hh, mn->val, object, tmpObj) {
      if (NULL != object->symName && 0 == strcmp(object->symName, symName)) {
	return object;
      }
    }
  }
}

void UpdateSymName(char *symName, char *sname) {
  MainHT *mn, *tmpMn;
  ObjectHT *object, *tmpObj;
  char *formula;
  HASH_ITER(hh, mainHT, mn, tmpMn) {
    HASH_ITER(hh, mn->val, object, tmpObj) {
      if (0 == strcmp(object->symName, symName)) {
	formula = getPrepositionalFormula(sname);
	if (NULL == object->symName) {
	  object->symName = (char *)malloc(sizeof(char) * (strlen(formula) + 1));
	} else {
	  object->symName = (char *)realloc(object->symName, sizeof(char) * (strlen(formula) + 1));
	}
	strcpy(object->symName, formula);
      }
    }
  }
}

ObjectType getObjectType(int t) {
  ObjectType type;

  switch (t) {
  case 0:
    type = CHAR;
    break;
  case 1:
    type = INT;
    break;
  case 2:
    type = FLOAT;
    break;
  case 3:
    type = ARRAY;
    break;
  case 4:
    type = STRUCT;
    break;
  }

  return type;
}

void setValue(char *symName, int t, void *value) {

  ObjectType type;
  type = getObjectType(t);

  ObjectHT *o = findBySymName(symName);

  if (o == NULL)
    return;
  memcpy(o->val, value, getSizeByType(type));
}

void *getValue(char *symName) {
  ObjectHT *o = findBySymName(symName);
  return o->val;
}

static void print() {
  MainHT *s;
  ObjectHT *o;
  for (s = mainHT; s != NULL; s = (MainHT *) (s->hh.next)) {
    for (o = s->val; o != NULL; o = (ObjectHT *) (o->hh.next)) {
      printf("%s -- %s -- %d\n", o->field, o->symName, *(int *)o->val);
    }
  }
}


void delete_allStructTableEntry() {
 
   HASH_CLEAR(hh,mainHT);
   mainHT = NULL;
}









