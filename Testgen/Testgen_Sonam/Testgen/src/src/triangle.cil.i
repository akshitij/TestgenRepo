# 1 "src/src/triangle.cil.c"
# 1 "/home/raj/Desktop/RAJ/Testgen_Release/Testgen//"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "src/src/triangle.cil.c"



typedef unsigned long size_t;
typedef long __off_t;
typedef long __off64_t;
struct _IO_FILE;
typedef struct _IO_FILE FILE;
typedef void _IO_lock_t;
struct _IO_marker {
   struct _IO_marker *_next ;
   struct _IO_FILE *_sbuf ;
   int _pos ;
};
struct _IO_FILE {
   int _flags ;
   char *_IO_read_ptr ;
   char *_IO_read_end ;
   char *_IO_read_base ;
   char *_IO_write_base ;
   char *_IO_write_ptr ;
   char *_IO_write_end ;
   char *_IO_buf_base ;
   char *_IO_buf_end ;
   char *_IO_save_base ;
   char *_IO_backup_base ;
   char *_IO_save_end ;
   struct _IO_marker *_markers ;
   struct _IO_FILE *_chain ;
   int _fileno ;
   int _flags2 ;
   __off_t _old_offset ;
   unsigned short _cur_column ;
   signed char _vtable_offset ;
   char _shortbuf[1] ;
   _IO_lock_t *_lock ;
   __off64_t _offset ;
   void *__pad1 ;
   void *__pad2 ;
   void *__pad3 ;
   void *__pad4 ;
   size_t __pad5 ;
   int _mode ;
   char _unused2[(15UL * sizeof(int ) - 4UL * sizeof(void *)) - sizeof(size_t )] ;
};
typedef long ptrdiff_t;
typedef unsigned int uint32_t;
struct UT_hash_handle;
struct UT_hash_bucket {
   struct UT_hash_handle *hh_head ;
   unsigned int count ;
   unsigned int expand_mult ;
};
typedef struct UT_hash_bucket UT_hash_bucket;
struct UT_hash_table {
   UT_hash_bucket *buckets ;
   unsigned int num_buckets ;
   unsigned int log2_num_buckets ;
   unsigned int num_items ;
   struct UT_hash_handle *tail ;
   ptrdiff_t hho ;
   unsigned int ideal_chain_maxlen ;
   unsigned int nonideal_items ;
   unsigned int ineff_expands ;
   unsigned int noexpand ;
   uint32_t signature ;
};
typedef struct UT_hash_table UT_hash_table;
struct UT_hash_handle {
   struct UT_hash_table *tbl ;
   void *prev ;
   void *next ;
   struct UT_hash_handle *hh_prev ;
   struct UT_hash_handle *hh_next ;
   void *key ;
   unsigned int keylen ;
   unsigned int hashv ;
};
typedef struct UT_hash_handle UT_hash_handle;
struct my_struct {
   int sid ;
   char *true_expr ;
   char *false_expr ;
   int trueblk ;
   int falseblk ;
   UT_hash_handle hh ;
};
struct CDGNode {
   int id ;
   int score ;
   int outcome ;
   char *expr ;
   struct CDGNode *trueNodeSet ;
   struct CDGNode *falseNodeSet ;
   struct CDGNode *parent ;
   struct CDGNode *next ;
};
typedef struct CDGNode CDGNode;
struct treeNode {
   int sid ;
   int level ;
   int outcome ;
   char *texp ;
   char *fexp ;
   struct treeNode *fchild ;
   struct treeNode *parent ;
   struct treeNode *next ;
};
struct qnode {
   struct treeNode *levelptr[50] ;
   char *symbolicNames ;
   struct qnode *next ;
};
struct Queue {
   struct qnode *front ;
   struct qnode *rear ;
   int totalElements ;
};
enum TOKENTYPE {
    NOTHING = -1,
    DELIMETER = 0,
    OPERATOR = 1,
    NUMBER = 2,
    POINTER = 3,
    ARRAY1 = 4,
    VARIABLE = 5,
    FUNCTION = 6,
    UNKNOWN = 7
} ;
struct field_values {
   char *sname ;
   void *cval ;
   int address ;
   int type ;
};
struct sym_table {
   char *vname ;
   struct field_values *fval ;
   UT_hash_handle hh ;
};
struct variable_table {
   char *varName ;
   int parameter ;
   UT_hash_handle hh ;
};
struct arrayKey {
   char arrayName[50] ;
   int index ;
};
struct arraySym_table {
   struct arrayKey key ;
   char sname[150] ;
   void *cval ;
   int address ;
   int type ;
   UT_hash_handle hh ;
};
struct ObjectHT {
   char *field ;
   char *symName ;
   void *val ;
   UT_hash_handle hh ;
};
typedef struct ObjectHT ObjectHT;
struct MainHT {
   int key ;
   ObjectHT *val ;
   UT_hash_handle hh ;
};
typedef struct MainHT MainHT;
struct intVartable {
   char *sname ;
   int *value ;
   UT_hash_handle hh ;
};
struct floatVartable {
   char *sname ;
   float *value ;
   UT_hash_handle hh ;
};
enum ObjectType {
    CHAR = 0,
    INT = 1,
    FLOAT = 2,
    ARRAY = 3,
    STRUCT = 4
} ;
typedef enum ObjectType ObjectType;
struct node {
   void *element ;
   struct node *next ;
};
typedef struct node node;
struct __anonstruct_Stack_21 {
   int elementSize ;
   int elementsCnt ;
   node *head ;
};
typedef struct __anonstruct_Stack_21 Stack;
struct CDGPath {
   struct CDGNode *node ;
   struct CDGPath *next ;
};
typedef struct CDGPath CDGPath;
struct CDGContext {
   struct CDGPath *topPaths ;
};
typedef struct CDGContext CDGContext;
#pragma merger("0","src/src/utils.i","-g,-g")
extern struct _IO_FILE *stderr ;
extern int fclose(FILE *__stream ) ;
extern FILE *fopen(char const * __restrict __filename , char const * __restrict __modes ) ;
extern int fprintf(FILE * __restrict __stream , char const * __restrict __format
                   , ...) ;
extern int fputs(char const * __restrict __s , FILE * __restrict __stream ) ;
extern __attribute__((__nothrow__, __noreturn__)) void ( __attribute__((__leaf__)) exit)(int __status ) ;
void printTestCase(char const *filename , char const *testcase )
{
  FILE *fp ;

  {
  fp = fopen((char const * __restrict )filename, (char const * __restrict )"a");
  if ((unsigned long )fp == (unsigned long )((void *)0)) {
    fprintf((FILE * __restrict )stderr, (char const * __restrict )"Cannot open file: %s!",
            filename);
    exit(1);
  }
  fputs((char const * __restrict )testcase, (FILE * __restrict )fp);
  fclose(fp);
  return;
}
}
#pragma merger("0","src/src/sidTable.i","-g,-g")
extern __attribute__((__nothrow__)) void *( __attribute__((__leaf__)) malloc)(size_t __size ) __attribute__((__malloc__)) ;
extern __attribute__((__nothrow__)) void ( __attribute__((__leaf__)) free)(void *__ptr ) ;
extern __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1), __leaf__)) memset)(void *__s ,
                                                                                               int __c ,
                                                                                               size_t __n ) ;
extern __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2), __leaf__)) memcmp)(void const *__s1 ,
                                                                                               void const *__s2 ,
                                                                                               size_t __n ) __attribute__((__pure__)) ;
extern __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1,2), __leaf__)) strcpy)(char * __restrict __dest ,
                                                                                                 char const * __restrict __src ) ;
extern __attribute__((__nothrow__)) size_t ( __attribute__((__nonnull__(1), __leaf__)) strlen)(char const *__s ) __attribute__((__pure__)) ;
int *unrolledCopies ;
void initSID(void) ;
void isCopyOf(int copysid , int orgsid ) ;
void add_condition(int sid , char *exp1 , char *exp2 , int tb , int fb ) ;
struct my_struct *find_condition(int sid ) ;
char *getTrueExpr(int sid ) ;
char *getFalseExpr(int sid ) ;
int countTotalConditions(void) ;
int countCoveredConditions(void) ;
int getBranchInfo(int id , int branch ) ;
void setBranchInfo(int sid , int tblk , int fblk ) ;
void delete_condition(struct my_struct *s ) ;
void delete_allConditions(void) ;
void print_conditions(void) ;
CDGNode *pathNode[100] = { (CDGNode *)((void *)0)};
char *getPrepositionalFormula(char *expr ) ;
int CDG_Module = 0;
struct my_struct *conditions = (struct my_struct *)((void *)0);
void isCopyOf(int copysid , int orgsid )
{


  {
  *(unrolledCopies + copysid) = orgsid;
  return;
}
}
void initUnrolledCopies(void)
{
  int maxCopies ;
  void *tmp ;
  int i ;

  {
  maxCopies = 500;
  tmp = malloc(sizeof(int ) * (unsigned long )maxCopies);
  unrolledCopies = (int *)tmp;
  i = 0;
  while (i < maxCopies) {
    *(unrolledCopies + i) = -1;
    i ++;
  }
  return;
}
}
void initSID(void)
{


  {
  initUnrolledCopies();
  return;
}
}
void add_condition(int sid , char *exp1 , char *exp2 , int tb , int fb )
{
  struct my_struct *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  int tmp ;
  void *tmp___0 ;
  unsigned int _ha_bkt ;
  void *tmp___1 ;
  void *tmp___2 ;
  unsigned int _hj_i___0 ;
  unsigned int _hj_j___0 ;
  unsigned int _hj_k___0 ;
  unsigned char *_hj_key___0 ;
  unsigned int _he_bkt ;
  unsigned int _he_bkt_i ;
  struct UT_hash_handle *_he_thh ;
  struct UT_hash_handle *_he_hh_nxt ;
  UT_hash_bucket *_he_new_buckets ;
  UT_hash_bucket *_he_newbkt ;
  void *tmp___3 ;
  int tmp___4 ;
  size_t tmp___5 ;
  void *tmp___6 ;
  size_t tmp___7 ;
  void *tmp___8 ;

  {
  while (1) {
    s = (struct my_struct *)((void *)0);
    if (conditions) {
      while (1) {
        _hj_key = (unsigned char *)(& sid);
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        _hj_k = (unsigned int )sizeof(int );
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        _hf_hashv = (unsigned int )((unsigned long )_hf_hashv + sizeof(int ));
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((conditions->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct my_struct *)((void *)((char *)((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head - (conditions->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct my_struct *)((void *)0);
        }
        while (s) {
          if ((unsigned long )s->hh.keylen == sizeof(int )) {
            tmp = memcmp((void const *)s->hh.key, (void const *)(& sid), sizeof(int ));
            if (tmp == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct my_struct *)((void *)((char *)s->hh.hh_next - (conditions->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct my_struct *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  if ((unsigned long )s == (unsigned long )((void *)0)) {
    tmp___0 = malloc(sizeof(struct my_struct ));
    s = (struct my_struct *)tmp___0;
    s->sid = sid;
    while (1) {
      s->hh.next = (void *)0;
      s->hh.key = (void *)((char *)(& s->sid));
      s->hh.keylen = (unsigned int )sizeof(int );
      if (! conditions) {
        conditions = s;
        conditions->hh.prev = (void *)0;
        while (1) {
          tmp___1 = malloc(sizeof(UT_hash_table ));
          conditions->hh.tbl = (UT_hash_table *)tmp___1;
          if (! conditions->hh.tbl) {
            exit(-1);
          }
          memset((void *)conditions->hh.tbl, 0, sizeof(UT_hash_table ));
          (conditions->hh.tbl)->tail = & conditions->hh;
          (conditions->hh.tbl)->num_buckets = 32U;
          (conditions->hh.tbl)->log2_num_buckets = 5U;
          (conditions->hh.tbl)->hho = (char *)(& conditions->hh) - (char *)conditions;
          tmp___2 = malloc(32UL * sizeof(struct UT_hash_bucket ));
          (conditions->hh.tbl)->buckets = (UT_hash_bucket *)tmp___2;
          if (! (conditions->hh.tbl)->buckets) {
            exit(-1);
          }
          memset((void *)(conditions->hh.tbl)->buckets, 0, 32UL * sizeof(struct UT_hash_bucket ));
          (conditions->hh.tbl)->signature = 2685476833U;
          break;
        }
      } else {
        ((conditions->hh.tbl)->tail)->next = (void *)s;
        s->hh.prev = (void *)((char *)(conditions->hh.tbl)->tail - (conditions->hh.tbl)->hho);
        (conditions->hh.tbl)->tail = & s->hh;
      }
      ((conditions->hh.tbl)->num_items) ++;
      s->hh.tbl = conditions->hh.tbl;
      while (1) {
        _hj_key___0 = (unsigned char *)(& s->sid);
        s->hh.hashv = 4276993775U;
        _hj_j___0 = 2654435769U;
        _hj_i___0 = _hj_j___0;
        _hj_k___0 = (unsigned int )sizeof(int );
        while (_hj_k___0 >= 12U) {
          _hj_i___0 += (((unsigned int )*(_hj_key___0 + 0) + ((unsigned int )*(_hj_key___0 + 1) << 8)) + ((unsigned int )*(_hj_key___0 + 2) << 16)) + ((unsigned int )*(_hj_key___0 + 3) << 24);
          _hj_j___0 += (((unsigned int )*(_hj_key___0 + 4) + ((unsigned int )*(_hj_key___0 + 5) << 8)) + ((unsigned int )*(_hj_key___0 + 6) << 16)) + ((unsigned int )*(_hj_key___0 + 7) << 24);
          s->hh.hashv += (((unsigned int )*(_hj_key___0 + 8) + ((unsigned int )*(_hj_key___0 + 9) << 8)) + ((unsigned int )*(_hj_key___0 + 10) << 16)) + ((unsigned int )*(_hj_key___0 + 11) << 24);
          while (1) {
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= s->hh.hashv;
            _hj_i___0 ^= s->hh.hashv >> 13;
            _hj_j___0 -= s->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 8;
            s->hh.hashv -= _hj_i___0;
            s->hh.hashv -= _hj_j___0;
            s->hh.hashv ^= _hj_j___0 >> 13;
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= s->hh.hashv;
            _hj_i___0 ^= s->hh.hashv >> 12;
            _hj_j___0 -= s->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 16;
            s->hh.hashv -= _hj_i___0;
            s->hh.hashv -= _hj_j___0;
            s->hh.hashv ^= _hj_j___0 >> 5;
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= s->hh.hashv;
            _hj_i___0 ^= s->hh.hashv >> 3;
            _hj_j___0 -= s->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 10;
            s->hh.hashv -= _hj_i___0;
            s->hh.hashv -= _hj_j___0;
            s->hh.hashv ^= _hj_j___0 >> 15;
            break;
          }
          _hj_key___0 += 12;
          _hj_k___0 -= 12U;
        }
        s->hh.hashv = (unsigned int )((unsigned long )s->hh.hashv + sizeof(int ));
        switch (_hj_k___0) {
        case 11U:
        s->hh.hashv += (unsigned int )*(_hj_key___0 + 10) << 24;
        case 10U:
        s->hh.hashv += (unsigned int )*(_hj_key___0 + 9) << 16;
        case 9U:
        s->hh.hashv += (unsigned int )*(_hj_key___0 + 8) << 8;
        case 8U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 7) << 24;
        case 7U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 6) << 16;
        case 6U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 5) << 8;
        case 5U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 4);
        case 4U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 3) << 24;
        case 3U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 2) << 16;
        case 2U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 1) << 8;
        case 1U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 0);
        }
        while (1) {
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= s->hh.hashv;
          _hj_i___0 ^= s->hh.hashv >> 13;
          _hj_j___0 -= s->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 8;
          s->hh.hashv -= _hj_i___0;
          s->hh.hashv -= _hj_j___0;
          s->hh.hashv ^= _hj_j___0 >> 13;
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= s->hh.hashv;
          _hj_i___0 ^= s->hh.hashv >> 12;
          _hj_j___0 -= s->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 16;
          s->hh.hashv -= _hj_i___0;
          s->hh.hashv -= _hj_j___0;
          s->hh.hashv ^= _hj_j___0 >> 5;
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= s->hh.hashv;
          _hj_i___0 ^= s->hh.hashv >> 3;
          _hj_j___0 -= s->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 10;
          s->hh.hashv -= _hj_i___0;
          s->hh.hashv -= _hj_j___0;
          s->hh.hashv ^= _hj_j___0 >> 15;
          break;
        }
        _ha_bkt = s->hh.hashv & ((conditions->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        (((conditions->hh.tbl)->buckets + _ha_bkt)->count) ++;
        s->hh.hh_next = ((conditions->hh.tbl)->buckets + _ha_bkt)->hh_head;
        s->hh.hh_prev = (struct UT_hash_handle *)((void *)0);
        if (((conditions->hh.tbl)->buckets + _ha_bkt)->hh_head) {
          (((conditions->hh.tbl)->buckets + _ha_bkt)->hh_head)->hh_prev = & s->hh;
        }
        ((conditions->hh.tbl)->buckets + _ha_bkt)->hh_head = & s->hh;
        if (((conditions->hh.tbl)->buckets + _ha_bkt)->count >= (((conditions->hh.tbl)->buckets + _ha_bkt)->expand_mult + 1U) * 10U) {
          if ((s->hh.tbl)->noexpand != 1U) {
            while (1) {
              tmp___3 = malloc((unsigned long )(2U * (s->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
              _he_new_buckets = (UT_hash_bucket *)tmp___3;
              if (! _he_new_buckets) {
                exit(-1);
              }
              memset((void *)_he_new_buckets, 0, (unsigned long )(2U * (s->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
              if ((s->hh.tbl)->num_items & ((s->hh.tbl)->num_buckets * 2U - 1U)) {
                tmp___4 = 1;
              } else {
                tmp___4 = 0;
              }
              (s->hh.tbl)->ideal_chain_maxlen = ((s->hh.tbl)->num_items >> ((s->hh.tbl)->log2_num_buckets + 1U)) + (unsigned int )tmp___4;
              (s->hh.tbl)->nonideal_items = 0U;
              _he_bkt_i = 0U;
              while (_he_bkt_i < (s->hh.tbl)->num_buckets) {
                _he_thh = ((s->hh.tbl)->buckets + _he_bkt_i)->hh_head;
                while (_he_thh) {
                  _he_hh_nxt = _he_thh->hh_next;
                  while (1) {
                    _he_bkt = _he_thh->hashv & ((s->hh.tbl)->num_buckets * 2U - 1U);
                    break;
                  }
                  _he_newbkt = _he_new_buckets + _he_bkt;
                  (_he_newbkt->count) ++;
                  if (_he_newbkt->count > (s->hh.tbl)->ideal_chain_maxlen) {
                    ((s->hh.tbl)->nonideal_items) ++;
                    _he_newbkt->expand_mult = _he_newbkt->count / (s->hh.tbl)->ideal_chain_maxlen;
                  }
                  _he_thh->hh_prev = (struct UT_hash_handle *)((void *)0);
                  _he_thh->hh_next = _he_newbkt->hh_head;
                  if (_he_newbkt->hh_head) {
                    (_he_newbkt->hh_head)->hh_prev = _he_thh;
                  }
                  _he_newbkt->hh_head = _he_thh;
                  _he_thh = _he_hh_nxt;
                }
                _he_bkt_i ++;
              }
              free((void *)(s->hh.tbl)->buckets);
              (s->hh.tbl)->num_buckets *= 2U;
              ((s->hh.tbl)->log2_num_buckets) ++;
              (s->hh.tbl)->buckets = _he_new_buckets;
              if ((s->hh.tbl)->nonideal_items > (s->hh.tbl)->num_items >> 1) {
                ((s->hh.tbl)->ineff_expands) ++;
              } else {
                (s->hh.tbl)->ineff_expands = 0U;
              }
              if ((s->hh.tbl)->ineff_expands > 1U) {
                (s->hh.tbl)->noexpand = 1U;
              }
              break;
            }
          }
        }
        break;
      }
      break;
    }
    tmp___5 = strlen((char const *)exp1);
    tmp___6 = malloc(sizeof(char ) * (tmp___5 + 1UL));
    s->true_expr = (char *)tmp___6;
    tmp___7 = strlen((char const *)exp2);
    tmp___8 = malloc(sizeof(char ) * (tmp___7 + 1UL));
    s->false_expr = (char *)tmp___8;
  }
  strcpy((char * __restrict )s->true_expr, (char const * __restrict )exp1);
  strcpy((char * __restrict )s->false_expr, (char const * __restrict )exp2);
  s->trueblk = tb;
  s->falseblk = fb;
  return;
}
}
struct my_struct *find_condition(int sid )
{
  struct my_struct *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  int tmp ;

  {
  while (1) {
    s = (struct my_struct *)((void *)0);
    if (conditions) {
      while (1) {
        _hj_key = (unsigned char *)(& sid);
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        _hj_k = (unsigned int )sizeof(int );
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        _hf_hashv = (unsigned int )((unsigned long )_hf_hashv + sizeof(int ));
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((conditions->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct my_struct *)((void *)((char *)((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head - (conditions->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct my_struct *)((void *)0);
        }
        while (s) {
          if ((unsigned long )s->hh.keylen == sizeof(int )) {
            tmp = memcmp((void const *)s->hh.key, (void const *)(& sid), sizeof(int ));
            if (tmp == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct my_struct *)((void *)((char *)s->hh.hh_next - (conditions->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct my_struct *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  return (s);
}
}
int getTrueBlockSeen(int sid )
{
  struct my_struct *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  int tmp ;

  {
  while (1) {
    s = (struct my_struct *)((void *)0);
    if (conditions) {
      while (1) {
        _hj_key = (unsigned char *)(& sid);
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        _hj_k = (unsigned int )sizeof(int );
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        _hf_hashv = (unsigned int )((unsigned long )_hf_hashv + sizeof(int ));
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((conditions->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct my_struct *)((void *)((char *)((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head - (conditions->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct my_struct *)((void *)0);
        }
        while (s) {
          if ((unsigned long )s->hh.keylen == sizeof(int )) {
            tmp = memcmp((void const *)s->hh.key, (void const *)(& sid), sizeof(int ));
            if (tmp == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct my_struct *)((void *)((char *)s->hh.hh_next - (conditions->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct my_struct *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  return (s->trueblk);
}
}
int getFalseBlockSeen(int sid )
{
  struct my_struct *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  int tmp ;

  {
  while (1) {
    s = (struct my_struct *)((void *)0);
    if (conditions) {
      while (1) {
        _hj_key = (unsigned char *)(& sid);
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        _hj_k = (unsigned int )sizeof(int );
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        _hf_hashv = (unsigned int )((unsigned long )_hf_hashv + sizeof(int ));
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((conditions->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct my_struct *)((void *)((char *)((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head - (conditions->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct my_struct *)((void *)0);
        }
        while (s) {
          if ((unsigned long )s->hh.keylen == sizeof(int )) {
            tmp = memcmp((void const *)s->hh.key, (void const *)(& sid), sizeof(int ));
            if (tmp == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct my_struct *)((void *)((char *)s->hh.hh_next - (conditions->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct my_struct *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  return (s->falseblk);
}
}
char *getTrueExpr(int sid )
{
  struct my_struct *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  int tmp ;

  {
  while (1) {
    s = (struct my_struct *)((void *)0);
    if (conditions) {
      while (1) {
        _hj_key = (unsigned char *)(& sid);
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        _hj_k = (unsigned int )sizeof(int );
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        _hf_hashv = (unsigned int )((unsigned long )_hf_hashv + sizeof(int ));
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((conditions->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct my_struct *)((void *)((char *)((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head - (conditions->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct my_struct *)((void *)0);
        }
        while (s) {
          if ((unsigned long )s->hh.keylen == sizeof(int )) {
            tmp = memcmp((void const *)s->hh.key, (void const *)(& sid), sizeof(int ));
            if (tmp == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct my_struct *)((void *)((char *)s->hh.hh_next - (conditions->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct my_struct *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  return (s->true_expr);
}
}
char *getFalseExpr(int sid )
{
  struct my_struct *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  int tmp ;

  {
  while (1) {
    s = (struct my_struct *)((void *)0);
    if (conditions) {
      while (1) {
        _hj_key = (unsigned char *)(& sid);
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        _hj_k = (unsigned int )sizeof(int );
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        _hf_hashv = (unsigned int )((unsigned long )_hf_hashv + sizeof(int ));
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((conditions->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct my_struct *)((void *)((char *)((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head - (conditions->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct my_struct *)((void *)0);
        }
        while (s) {
          if ((unsigned long )s->hh.keylen == sizeof(int )) {
            tmp = memcmp((void const *)s->hh.key, (void const *)(& sid), sizeof(int ));
            if (tmp == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct my_struct *)((void *)((char *)s->hh.hh_next - (conditions->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct my_struct *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  return (s->false_expr);
}
}
void setTrueExpr(int sid , char *expr )
{
  char *str ;
  char *t ;
  CDGNode *temp ;
  char *tmp ;
  size_t tmp___0 ;
  void *tmp___1 ;
  struct my_struct *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  int tmp___2 ;
  char *tmp___3 ;
  size_t tmp___4 ;
  void *tmp___5 ;

  {
  if (CDG_Module == 1) {
    temp = pathNode[sid];
    if ((unsigned long )temp != (unsigned long )((void *)0)) {
      if (temp->outcome) {
        t = temp->expr;
        free((void *)t);
        tmp = getPrepositionalFormula(expr);
        str = tmp;
        tmp___0 = strlen((char const *)str);
        tmp___1 = malloc(sizeof(char ) * (tmp___0 + 1UL));
        temp->expr = (char *)tmp___1;
        strcpy((char * __restrict )temp->expr, (char const * __restrict )str);
      }
    }
    return;
  }
  while (1) {
    s = (struct my_struct *)((void *)0);
    if (conditions) {
      while (1) {
        _hj_key = (unsigned char *)(& sid);
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        _hj_k = (unsigned int )sizeof(int );
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        _hf_hashv = (unsigned int )((unsigned long )_hf_hashv + sizeof(int ));
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((conditions->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct my_struct *)((void *)((char *)((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head - (conditions->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct my_struct *)((void *)0);
        }
        while (s) {
          if ((unsigned long )s->hh.keylen == sizeof(int )) {
            tmp___2 = memcmp((void const *)s->hh.key, (void const *)(& sid), sizeof(int ));
            if (tmp___2 == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct my_struct *)((void *)((char *)s->hh.hh_next - (conditions->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct my_struct *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  t = s->true_expr;
  free((void *)t);
  tmp___3 = getPrepositionalFormula(expr);
  str = tmp___3;
  tmp___4 = strlen((char const *)str);
  tmp___5 = malloc(sizeof(char ) * (tmp___4 + 1UL));
  s->true_expr = (char *)tmp___5;
  strcpy((char * __restrict )s->true_expr, (char const * __restrict )str);
  return;
}
}
void setFalseExpr(int sid , char *expr )
{
  char *str ;
  char *t ;
  CDGNode *temp ;
  char *tmp ;
  size_t tmp___0 ;
  void *tmp___1 ;
  struct my_struct *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  int tmp___2 ;
  char *tmp___3 ;
  size_t tmp___4 ;
  void *tmp___5 ;

  {
  if (CDG_Module == 1) {
    temp = pathNode[sid];
    if ((unsigned long )temp != (unsigned long )((void *)0)) {
      if (! temp->outcome) {
        t = temp->expr;
        free((void *)t);
        tmp = getPrepositionalFormula(expr);
        str = tmp;
        tmp___0 = strlen((char const *)str);
        tmp___1 = malloc(sizeof(char ) * (tmp___0 + 1UL));
        temp->expr = (char *)tmp___1;
        strcpy((char * __restrict )temp->expr, (char const * __restrict )str);
      }
    }
    return;
  }
  while (1) {
    s = (struct my_struct *)((void *)0);
    if (conditions) {
      while (1) {
        _hj_key = (unsigned char *)(& sid);
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        _hj_k = (unsigned int )sizeof(int );
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        _hf_hashv = (unsigned int )((unsigned long )_hf_hashv + sizeof(int ));
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((conditions->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct my_struct *)((void *)((char *)((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head - (conditions->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct my_struct *)((void *)0);
        }
        while (s) {
          if ((unsigned long )s->hh.keylen == sizeof(int )) {
            tmp___2 = memcmp((void const *)s->hh.key, (void const *)(& sid), sizeof(int ));
            if (tmp___2 == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct my_struct *)((void *)((char *)s->hh.hh_next - (conditions->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct my_struct *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  t = s->false_expr;
  free((void *)t);
  tmp___3 = getPrepositionalFormula(expr);
  str = tmp___3;
  tmp___4 = strlen((char const *)str);
  tmp___5 = malloc(sizeof(char ) * (tmp___4 + 1UL));
  s->false_expr = (char *)tmp___5;
  strcpy((char * __restrict )s->false_expr, (char const * __restrict )str);
  return;
}
}
int countTotalConditions(void)
{
  int count ;
  unsigned int tmp ;

  {
  if (conditions) {
    tmp = (conditions->hh.tbl)->num_items;
  } else {
    tmp = 0U;
  }
  count = (int )tmp;
  return (count);
}
}
int countCoveredConditions(void)
{
  int count ;
  struct my_struct *s ;

  {
  count = 0;
  s = conditions;
  while ((unsigned long )s != (unsigned long )((void *)0)) {
    if (s->trueblk == 1) {
      if (s->falseblk == 1) {
        count += 2;
      } else {
        goto _L___1;
      }
    } else
    _L___1:
    if (s->trueblk == 1) {
      if (s->falseblk == 0) {
        count ++;
      } else
      if (s->falseblk == -1) {
        count ++;
      } else {
        goto _L___0;
      }
    } else
    _L___0:
    if (s->trueblk == 0) {
      goto _L;
    } else
    if (s->trueblk == -1) {
      _L:
      if (s->falseblk == 1) {
        count ++;
      }
    }
    s = (struct my_struct *)s->hh.next;
  }
  return (count);
}
}
int countOrgTotalConditions(void)
{
  int count ;
  struct my_struct *s ;

  {
  count = 0;
  s = conditions;
  while ((unsigned long )s != (unsigned long )((void *)0)) {
    if (*(unrolledCopies + s->sid) == s->sid) {
      count ++;
    } else
    if (*(unrolledCopies + s->sid) == -1) {
      count ++;
    }
    s = (struct my_struct *)s->hh.next;
  }
  return (count);
}
}
int countOrgCoveredConditions(void)
{
  int count ;
  int state ;
  int sid ;
  int tFlag ;
  int fFlag ;
  struct my_struct *s ;
  struct my_struct *temp ;

  {
  count = 0;
  tFlag = 0;
  fFlag = 0;
  s = conditions;
  while ((unsigned long )s != (unsigned long )((void *)0)) {
    state = 0;
    sid = *(unrolledCopies + s->sid);
    if (-1 != sid) {
      if (s->sid != sid) {
        goto __Cont;
      }
    }
    fFlag = 0;
    tFlag = fFlag;
    if (1 == s->trueblk) {
      tFlag = 1;
    }
    if (1 == s->falseblk) {
      fFlag = 1;
    }
    temp = conditions;
    while ((unsigned long )temp != (unsigned long )((void *)0)) {
      if (*(unrolledCopies + temp->sid) == s->sid) {
        if (temp->trueblk == 1) {
          tFlag = 1;
        }
        if (temp->falseblk == 1) {
          fFlag = 1;
        }
      }
      temp = (struct my_struct *)temp->hh.next;
    }
    if (tFlag) {
      count ++;
    }
    if (fFlag) {
      count ++;
    }
    __Cont:
    s = (struct my_struct *)s->hh.next;
  }
  return (count);
}
}
int getBranchInfo(int id , int branch )
{
  struct my_struct *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  int tmp ;

  {
  while (1) {
    s = (struct my_struct *)((void *)0);
    if (conditions) {
      while (1) {
        _hj_key = (unsigned char *)(& id);
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        _hj_k = (unsigned int )sizeof(int );
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        _hf_hashv = (unsigned int )((unsigned long )_hf_hashv + sizeof(int ));
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((conditions->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct my_struct *)((void *)((char *)((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head - (conditions->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct my_struct *)((void *)0);
        }
        while (s) {
          if ((unsigned long )s->hh.keylen == sizeof(int )) {
            tmp = memcmp((void const *)s->hh.key, (void const *)(& id), sizeof(int ));
            if (tmp == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct my_struct *)((void *)((char *)s->hh.hh_next - (conditions->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct my_struct *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  if (branch) {
    if (s) {
      if (s->trueblk == 0) {
        return (0);
      }
      return (1);
    }
  }
  if (! branch) {
    if (s) {
      if (s->falseblk == 0) {
        return (0);
      }
      return (1);
    }
  }
  return (1);
}
}
void setBranchInfo(int sid , int tblk , int fblk )
{
  struct my_struct *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  int tmp ;

  {
  if (CDG_Module == 1) {
    return;
  }
  while (1) {
    s = (struct my_struct *)((void *)0);
    if (conditions) {
      while (1) {
        _hj_key = (unsigned char *)(& sid);
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        _hj_k = (unsigned int )sizeof(int );
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        _hf_hashv = (unsigned int )((unsigned long )_hf_hashv + sizeof(int ));
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((conditions->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct my_struct *)((void *)((char *)((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head - (conditions->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct my_struct *)((void *)0);
        }
        while (s) {
          if ((unsigned long )s->hh.keylen == sizeof(int )) {
            tmp = memcmp((void const *)s->hh.key, (void const *)(& sid), sizeof(int ));
            if (tmp == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct my_struct *)((void *)((char *)s->hh.hh_next - (conditions->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct my_struct *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  if (tblk) {
    if (s->trueblk != 1) {
      s->trueblk = tblk;
    }
  }
  if (fblk) {
    if (s->falseblk != 1) {
      s->falseblk = fblk;
    }
  }
  return;
}
}
void updateSidForPath(int sid , int outcome )
{
  struct my_struct *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  int tmp ;

  {
  while (1) {
    s = (struct my_struct *)((void *)0);
    if (conditions) {
      while (1) {
        _hj_key = (unsigned char *)(& sid);
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        _hj_k = (unsigned int )sizeof(int );
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        _hf_hashv = (unsigned int )((unsigned long )_hf_hashv + sizeof(int ));
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((conditions->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct my_struct *)((void *)((char *)((conditions->hh.tbl)->buckets + _hf_bkt)->hh_head - (conditions->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct my_struct *)((void *)0);
        }
        while (s) {
          if ((unsigned long )s->hh.keylen == sizeof(int )) {
            tmp = memcmp((void const *)s->hh.key, (void const *)(& sid), sizeof(int ));
            if (tmp == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct my_struct *)((void *)((char *)s->hh.hh_next - (conditions->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct my_struct *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  if (outcome == 1) {
    if (s) {
      if (s->trueblk != 1) {
        s->trueblk = -1;
      } else {
        goto _L___0;
      }
    } else {
      goto _L___0;
    }
  } else
  _L___0:
  if (outcome == 0) {
    if (s) {
      if (s->falseblk != 1) {
        s->falseblk = -1;
      }
    }
  }
  return;
}
}
void delete_condition(struct my_struct *s )
{
  unsigned int _hd_bkt ;
  struct UT_hash_handle *_hd_hh_del ;

  {
  while (1) {
    if ((unsigned long )s->hh.prev == (unsigned long )((void *)0)) {
      if ((unsigned long )s->hh.next == (unsigned long )((void *)0)) {
        free((void *)(conditions->hh.tbl)->buckets);
        free((void *)conditions->hh.tbl);
        conditions = (struct my_struct *)((void *)0);
      } else {
        goto _L;
      }
    } else {
      _L:
      _hd_hh_del = & s->hh;
      if ((unsigned long )s == (unsigned long )((void *)((char *)(conditions->hh.tbl)->tail - (conditions->hh.tbl)->hho))) {
        (conditions->hh.tbl)->tail = (UT_hash_handle *)((ptrdiff_t )s->hh.prev + (conditions->hh.tbl)->hho);
      }
      if (s->hh.prev) {
        ((UT_hash_handle *)((ptrdiff_t )s->hh.prev + (conditions->hh.tbl)->hho))->next = s->hh.next;
      } else {
        while (1) {
          conditions = (struct my_struct *)s->hh.next;
          break;
        }
      }
      if (_hd_hh_del->next) {
        ((UT_hash_handle *)((ptrdiff_t )_hd_hh_del->next + (conditions->hh.tbl)->hho))->prev = _hd_hh_del->prev;
      }
      while (1) {
        _hd_bkt = _hd_hh_del->hashv & ((conditions->hh.tbl)->num_buckets - 1U);
        break;
      }
      (((conditions->hh.tbl)->buckets + _hd_bkt)->count) --;
      if ((unsigned long )((conditions->hh.tbl)->buckets + _hd_bkt)->hh_head == (unsigned long )_hd_hh_del) {
        ((conditions->hh.tbl)->buckets + _hd_bkt)->hh_head = _hd_hh_del->hh_next;
      }
      if (_hd_hh_del->hh_prev) {
        (_hd_hh_del->hh_prev)->hh_next = _hd_hh_del->hh_next;
      }
      if (_hd_hh_del->hh_next) {
        (_hd_hh_del->hh_next)->hh_prev = _hd_hh_del->hh_prev;
      }
      ((conditions->hh.tbl)->num_items) --;
    }
    break;
  }
  free((void *)s);
  return;
}
}
void delete_allConditions(void)
{
  struct my_struct *current_con ;
  struct my_struct *tmp ;
  void *tmp___0 ;
  void *tmp___1 ;
  unsigned int _hd_bkt ;
  struct UT_hash_handle *_hd_hh_del ;

  {
  current_con = conditions;
  if (conditions) {
    tmp___0 = conditions->hh.next;
  } else {
    tmp___0 = (void *)0;
  }
  tmp = (struct my_struct *)tmp___0;
  while (current_con) {
    while (1) {
      if ((unsigned long )current_con->hh.prev == (unsigned long )((void *)0)) {
        if ((unsigned long )current_con->hh.next == (unsigned long )((void *)0)) {
          free((void *)(conditions->hh.tbl)->buckets);
          free((void *)conditions->hh.tbl);
          conditions = (struct my_struct *)((void *)0);
        } else {
          goto _L;
        }
      } else {
        _L:
        _hd_hh_del = & current_con->hh;
        if ((unsigned long )current_con == (unsigned long )((void *)((char *)(conditions->hh.tbl)->tail - (conditions->hh.tbl)->hho))) {
          (conditions->hh.tbl)->tail = (UT_hash_handle *)((ptrdiff_t )current_con->hh.prev + (conditions->hh.tbl)->hho);
        }
        if (current_con->hh.prev) {
          ((UT_hash_handle *)((ptrdiff_t )current_con->hh.prev + (conditions->hh.tbl)->hho))->next = current_con->hh.next;
        } else {
          while (1) {
            conditions = (struct my_struct *)current_con->hh.next;
            break;
          }
        }
        if (_hd_hh_del->next) {
          ((UT_hash_handle *)((ptrdiff_t )_hd_hh_del->next + (conditions->hh.tbl)->hho))->prev = _hd_hh_del->prev;
        }
        while (1) {
          _hd_bkt = _hd_hh_del->hashv & ((conditions->hh.tbl)->num_buckets - 1U);
          break;
        }
        (((conditions->hh.tbl)->buckets + _hd_bkt)->count) --;
        if ((unsigned long )((conditions->hh.tbl)->buckets + _hd_bkt)->hh_head == (unsigned long )_hd_hh_del) {
          ((conditions->hh.tbl)->buckets + _hd_bkt)->hh_head = _hd_hh_del->hh_next;
        }
        if (_hd_hh_del->hh_prev) {
          (_hd_hh_del->hh_prev)->hh_next = _hd_hh_del->hh_next;
        }
        if (_hd_hh_del->hh_next) {
          (_hd_hh_del->hh_next)->hh_prev = _hd_hh_del->hh_prev;
        }
        ((conditions->hh.tbl)->num_items) --;
      }
      break;
    }
    free((void *)current_con);
    current_con = tmp;
    if (tmp) {
      tmp___1 = tmp->hh.next;
    } else {
      tmp___1 = (void *)0;
    }
    tmp = (struct my_struct *)tmp___1;
  }
  return;
}
}
void print_conditions(void)
{


  {
  return;
}
}
#pragma merger("0","src/src/directAndSolve.i","-g,-g")
extern __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) remove)(char const *__filename ) ;
extern int printf(char const * __restrict __format , ...) ;
extern char *fgets(char * __restrict __s , int __n , FILE * __restrict __stream ) ;
extern __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) feof)(FILE *__stream ) ;
extern FILE *popen(char const *__command , char const *__modes ) ;
extern int pclose(FILE *__stream ) ;
extern __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1), __leaf__)) atoi)(char const *__nptr ) __attribute__((__pure__)) ;
extern __attribute__((__nothrow__)) void *( __attribute__((__leaf__)) calloc)(size_t __nmemb ,
                                                                               size_t __size ) __attribute__((__malloc__)) ;
extern __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1,2), __leaf__)) strcat)(char * __restrict __dest ,
                                                                                                 char const * __restrict __src ) ;
extern __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2), __leaf__)) strcmp)(char const *__s1 ,
                                                                                               char const *__s2 ) __attribute__((__pure__)) ;
extern __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(2), __leaf__)) strtok)(char * __restrict __s ,
                                                                                               char const * __restrict __delim ) ;
int getSid(struct treeNode *node ) ;
struct treeNode *getFchild(struct treeNode *node ) ;
struct treeNode *getNodeParent(struct treeNode *node ) ;
struct treeNode *getNextnode(struct treeNode *node ) ;
void clearTreeNodes(void) ;
struct Queue queue ;
void deQueue(void) ;
void emptyQueue(void) ;
enum TOKENTYPE token_type ;
char *getNextTokenFromConstraintSolver(char const *str , int *pos , int length ) ;
extern void getPrint() ;
void constructStringToWriteinFile(char *str1 ) ;
int check_level = 1;
int check_position = 0;
int execution_flag = 0;
int countNoNewConditionAttempts = 0;
float previousRunCoverage = (float )0;
void printFile(char *s )
{
  FILE *fp ;
  FILE *tmp ;

  {
  tmp = fopen((char const * __restrict )"src/src/printTest.smt", (char const * __restrict )"a");
  fp = tmp;
  if ((unsigned long )fp == (unsigned long )((void *)0)) {
    printf((char const * __restrict )"Error opening file!\n");
    exit(1);
  }
  fprintf((FILE * __restrict )fp, (char const * __restrict )"%s", s);
  fclose(fp);
  return;
}
}
void constructStringToWriteinFile(char *str1 )
{
  char *res ;
  char *str ;
  size_t tmp ;
  void *tmp___0 ;

  {
  tmp = strlen((char const *)str1);
  tmp___0 = calloc(tmp + 1UL, sizeof(char ));
  str = (char *)tmp___0;
  strcpy((char * __restrict )str, (char const * __restrict )str1);
  strcat((char * __restrict )str, (char const * __restrict )"\000");
  printFile((char *)":extrafuns (");
  res = strtok((char * __restrict )str, (char const * __restrict )"##");
  while (res) {
    printFile((char *)"(");
    printFile(res);
    printFile((char *)" Int)");
    res = strtok((char * __restrict )((void *)0), (char const * __restrict )"#");
  }
  printFile((char *)")\n");
  free((void *)str);
  return;
}
}
char *getRearPathCondition(void)
{
  char *str ;
  int i ;
  void *tmp ;
  struct treeNode *ptr ;

  {
  i = 1;
  tmp = malloc((size_t )1500);
  str = (char *)tmp;
  ptr = (queue.rear)->levelptr[i];
  strcpy((char * __restrict )str, (char const * __restrict )"");
  while ((unsigned long )ptr != (unsigned long )((void *)0)) {
    if (ptr->outcome) {
      strcat((char * __restrict )str, (char const * __restrict )ptr->texp);
    } else {
      strcat((char * __restrict )str, (char const * __restrict )ptr->fexp);
    }
    strcat((char * __restrict )str, (char const * __restrict )"##");
    ptr = getNextnode(ptr);
    if ((unsigned long )ptr == (unsigned long )((void *)0)) {
      i ++;
      ptr = (queue.rear)->levelptr[i];
    }
  }
  strcat((char * __restrict )str, (char const * __restrict )"\000");
  return (str);
}
}
char *getFrontPathCondition(void)
{
  char *str ;
  int i ;
  void *tmp ;
  struct treeNode *ptr ;

  {
  i = 1;
  tmp = malloc((size_t )1500);
  str = (char *)tmp;
  ptr = (queue.front)->levelptr[i];
  strcpy((char * __restrict )str, (char const * __restrict )"");
  while ((unsigned long )ptr != (unsigned long )((void *)0)) {
    if (ptr->outcome) {
      strcat((char * __restrict )str, (char const * __restrict )ptr->texp);
    } else {
      strcat((char * __restrict )str, (char const * __restrict )ptr->fexp);
    }
    strcat((char * __restrict )str, (char const * __restrict )"##");
    ptr = getNextnode(ptr);
    if ((unsigned long )ptr == (unsigned long )((void *)0)) {
      i ++;
      ptr = (queue.front)->levelptr[i];
    }
  }
  strcat((char * __restrict )str, (char const * __restrict )"\000");
  return (str);
}
}
void writeConditionsToFile(char *str )
{
  char *token ;
  FILE *fp ;
  FILE *tmp ;

  {
  tmp = fopen((char const * __restrict )"src/src/printTest.smt", (char const * __restrict )"a");
  fp = tmp;
  if ((unsigned long )fp == (unsigned long )((void *)0)) {
    printf((char const * __restrict )"Error opening file!\n");
    exit(1);
  }
  token = strtok((char * __restrict )str, (char const * __restrict )"##");
  while ((unsigned long )token != (unsigned long )((void *)0)) {
    strcat((char * __restrict )token, (char const * __restrict )"\000");
    fprintf((FILE * __restrict )fp, (char const * __restrict )"  :assumption %s\n",
            token);
    token = strtok((char * __restrict )((void *)0), (char const * __restrict )"##");
    if ((unsigned long )token == (unsigned long )((void *)0)) {
      fprintf((FILE * __restrict )fp, (char const * __restrict )"%s", " ) ");
    }
  }
  fclose(fp);
  return;
}
}
void updateValBySymbolicName(char *sname , void *value ) ;
int getOutputFromConstraintSolver(void)
{
  char *token ;
  char *save ;
  int i ;
  int len ;
  int value ;
  int negative ;
  FILE *pipe ;
  FILE *tmp ;
  char buffer[100] ;
  char result[10000] ;
  char *tmp___0 ;
  int tmp___1 ;
  size_t tmp___2 ;
  int tmp___3 ;

  {
  i = 0;
  negative = 0;
  tmp = popen("z3 -smt src/src/printTest.smt", "r");
  pipe = tmp;
  if (! pipe) {
    return (0);
  }
  strcpy((char * __restrict )(result), (char const * __restrict )"\000");
  while (1) {
    tmp___1 = feof(pipe);
    if (tmp___1) {
      break;
    }
    tmp___0 = fgets((char * __restrict )(buffer), 1000, (FILE * __restrict )pipe);
    if ((unsigned long )tmp___0 != (unsigned long )((void *)0)) {
      strcat((char * __restrict )(result), (char const * __restrict )(buffer));
    }
  }
  pclose(pipe);
  tmp___2 = strlen((char const *)(result));
  len = (int )tmp___2;
  token = getNextTokenFromConstraintSolver((char const *)(result), & i, len);
  if ((unsigned long )((void *)0) != (unsigned long )token) {
    tmp___3 = strcmp("unsat", (char const *)token);
    if (tmp___3 == 0) {
      return (0);
    }
  }
  while ((unsigned long )token != (unsigned long )((void *)0)) {
    negative = 0;
    switch ((int )token_type) {
    case 1:
    case 0:
    break;
    case 2:
    if ((int )*token == 45) {
      negative = 1;
      value = atoi((char const *)(token + 2));
    } else {
      value = atoi((char const *)token);
    }
    if (negative) {
      value *= -1;
    }
    updateValBySymbolicName(save, & value);
    break;
    case 5:
    save = token;
    break;
    }
    token = getNextTokenFromConstraintSolver((char const *)(& result[i]), & i, len);
  }
  return (1);
}
}
int checkForAllConstants(char const *str ) ;
void writeProgramSVariables(void) ;
void directPathConditions(void)
{
  char *newPathCondition ;
  struct treeNode *curr ;
  struct treeNode *parent ;
  struct treeNode *temp ;
  int atleastOneConditionNotCovered ;
  int i ;
  float percent ;
  float orgPercent ;
  int tmp ;
  int tmp___0 ;
  int tmp___1 ;
  int tmp___2 ;
  FILE *coveragefile ;
  FILE *tmp___3 ;
  char *fpc ;
  char *tmp___4 ;
  int tmp___5 ;
  void *tmp___6 ;
  int tmp___7 ;
  int tmp___8 ;
  int tmp___9 ;
  int tmp___10 ;
  int tmp___11 ;
  int tmp___12 ;
  struct treeNode *tmp___13 ;
  int tmp___14 ;
  int tmp___15 ;
  int tmp___16 ;
  int tmp___17 ;
  int tmp___18 ;
  int tmp___19 ;
  int tmp___20 ;
  int tmp___21 ;
  struct treeNode *tmp___22 ;
  int tmp___23 ;

  {
  atleastOneConditionNotCovered = 0;
  i = 1;
  tmp = countCoveredConditions();
  tmp___0 = countTotalConditions();
  percent = (float )((tmp * 100) / (2 * tmp___0));
  tmp___1 = countOrgCoveredConditions();
  tmp___2 = countOrgTotalConditions();
  orgPercent = (float )((tmp___1 * 100) / (2 * tmp___2));
  printf((char const * __restrict )"COVERAGE = %f....\n", (double )orgPercent);
  tmp___3 = fopen((char const * __restrict )"src/src/coverage.txt", (char const * __restrict )"ab+");
  coveragefile = tmp___3;
  fprintf((FILE * __restrict )coveragefile, (char const * __restrict )"%.1f\n",
          (double )orgPercent);
  if (queue.totalElements == 0) {
    emptyQueue();
    return;
  } else
  if (countNoNewConditionAttempts >= 10) {
    emptyQueue();
    return;
  }
  tmp___4 = getFrontPathCondition();
  fpc = tmp___4;
  fpc = (char *)((void *)0);
  free((void *)fpc);
  tmp___5 = countTotalConditions();
  if (tmp___5) {
    if (execution_flag == 1) {
      if (previousRunCoverage != percent) {
        countNoNewConditionAttempts = 0;
      } else {
        goto _L;
      }
    } else
    _L:
    if (execution_flag == 1) {
      if (previousRunCoverage == percent) {
        countNoNewConditionAttempts ++;
      }
    }
    previousRunCoverage = percent;
  }
  tmp___6 = malloc((size_t )1500);
  newPathCondition = (char *)tmp___6;
  *newPathCondition = (char)0;
  if (check_position >= 1) {
    if ((unsigned long )(queue.front)->levelptr[check_level + 1] == (unsigned long )((void *)0)) {
      deQueue();
      check_level = 1;
      check_position = 0;
      if ((unsigned long )newPathCondition != (unsigned long )((void *)0)) {
        newPathCondition = (char *)((void *)0);
        free((void *)newPathCondition);
      }
      execution_flag = 0;
      directPathConditions();
      return;
    }
  }
  curr = (queue.front)->levelptr[check_level];
  if (check_level == 1) {
    if (check_position == 0) {
      while ((unsigned long )curr != (unsigned long )((void *)0)) {
        if (curr->outcome) {
          tmp___7 = checkForAllConstants(curr->fexp);
          if (! tmp___7) {
            strcat((char * __restrict )newPathCondition, (char const * __restrict )curr->fexp);
            strcat((char * __restrict )newPathCondition, (char const * __restrict )"##");
          }
          tmp___8 = getSid(curr);
          tmp___9 = getBranchInfo(tmp___8, 0);
          if (! tmp___9) {
            atleastOneConditionNotCovered = 1;
          }
        } else {
          tmp___10 = checkForAllConstants(curr->texp);
          if (! tmp___10) {
            strcat((char * __restrict )newPathCondition, (char const * __restrict )curr->texp);
            strcat((char * __restrict )newPathCondition, (char const * __restrict )"##");
          }
          tmp___11 = getSid(curr);
          tmp___12 = getBranchInfo(tmp___11, 1);
          if (! tmp___12) {
            atleastOneConditionNotCovered = 1;
          }
        }
        curr = getNextnode(curr);
      }
      strcat((char * __restrict )newPathCondition, (char const * __restrict )"\000");
      check_position ++;
    } else {
      goto _L___2;
    }
  } else {
    _L___2:
    i = 1;
    while (1) {
      if (i < check_position) {
        if (! ((unsigned long )curr != (unsigned long )((void *)0))) {
          break;
        }
      } else {
        break;
      }
      curr = getNextnode(curr);
      i ++;
    }
    if (i < check_position) {
      goto _L___0;
    } else
    if (i == check_position) {
      if ((unsigned long )curr == (unsigned long )((void *)0)) {
        _L___0:
        check_level ++;
        check_position = 1;
        if ((unsigned long )newPathCondition != (unsigned long )((void *)0)) {
          newPathCondition = (char *)((void *)0);
          free((void *)newPathCondition);
        }
        execution_flag = 0;
        directPathConditions();
        return;
      }
    }
    tmp___13 = getFchild(curr);
    if ((unsigned long )tmp___13 == (unsigned long )((void *)0)) {
      check_position ++;
      if ((unsigned long )newPathCondition != (unsigned long )((void *)0)) {
        newPathCondition = (char *)((void *)0);
        free((void *)newPathCondition);
      }
      execution_flag = 0;
      directPathConditions();
      return;
    }
    parent = curr;
    temp = (queue.front)->levelptr[parent->level + 1];
    while ((temp->parent)->sid != parent->sid) {
      temp = temp->next;
    }
    curr = temp;
    while (1) {
      if ((unsigned long )curr != (unsigned long )((void *)0)) {
        if (! ((curr->parent)->sid == parent->sid)) {
          break;
        }
      } else {
        break;
      }
      if (curr->outcome) {
        tmp___14 = checkForAllConstants(curr->fexp);
        if (! tmp___14) {
          strcat((char * __restrict )newPathCondition, (char const * __restrict )curr->fexp);
          strcat((char * __restrict )newPathCondition, (char const * __restrict )"##");
        }
        tmp___15 = getSid(curr);
        tmp___16 = getBranchInfo(tmp___15, 0);
        if (! tmp___16) {
          atleastOneConditionNotCovered = 1;
        }
      } else {
        tmp___17 = checkForAllConstants(curr->texp);
        if (! tmp___17) {
          strcat((char * __restrict )newPathCondition, (char const * __restrict )curr->texp);
          strcat((char * __restrict )newPathCondition, (char const * __restrict )"##");
        }
        tmp___18 = getSid(curr);
        tmp___19 = getBranchInfo(tmp___18, 1);
        if (! tmp___19) {
          atleastOneConditionNotCovered = 1;
        }
      }
      curr = curr->next;
    }
    curr = parent;
    while ((unsigned long )curr != (unsigned long )((void *)0)) {
      if (curr->outcome) {
        tmp___21 = checkForAllConstants(curr->texp);
        if (tmp___21) {
          goto _L___1;
        } else {
          strcat((char * __restrict )newPathCondition, (char const * __restrict )curr->texp);
          strcat((char * __restrict )newPathCondition, (char const * __restrict )"##");
        }
      } else {
        _L___1:
        tmp___20 = checkForAllConstants(curr->fexp);
        if (! tmp___20) {
          strcat((char * __restrict )newPathCondition, (char const * __restrict )curr->fexp);
          strcat((char * __restrict )newPathCondition, (char const * __restrict )"##");
        }
      }
      curr = getNodeParent(curr);
    }
    curr = (queue.front)->levelptr[check_level];
    tmp___22 = getNextnode(curr);
    if ((unsigned long )tmp___22 == (unsigned long )((void *)0)) {
      check_level ++;
      check_position = 1;
    } else {
      check_position ++;
    }
    strcat((char * __restrict )newPathCondition, (char const * __restrict )"\000");
  }
  if (atleastOneConditionNotCovered == 1) {
    if ((int )*(newPathCondition + 0) != 0) {
      getPrint();
      writeProgramSVariables();
      writeConditionsToFile(newPathCondition);
      tmp___23 = getOutputFromConstraintSolver();
      if (! tmp___23) {
        remove("src/src/printTest.smt");
        newPathCondition = (char *)((void *)0);
        free((void *)newPathCondition);
        execution_flag = 0;
        countNoNewConditionAttempts ++;
        directPathConditions();
        return;
      }
      remove("src/src/printTest.smt");
      execution_flag = 1;
      clearTreeNodes();
    } else {
      goto _L___3;
    }
  } else {
    _L___3:
    if ((unsigned long )newPathCondition != (unsigned long )((void *)0)) {
      newPathCondition = (char *)((void *)0);
      free((void *)newPathCondition);
    }
    countNoNewConditionAttempts ++;
    directPathConditions();
  }
  if ((unsigned long )newPathCondition != (unsigned long )((void *)0)) {
    newPathCondition = (char *)((void *)0);
    free((void *)newPathCondition);
  }
  return;
}
}
#pragma merger("0","src/src/symbolicExec.i","-g,-g")
extern __attribute__((__nothrow__)) void *( __attribute__((__warn_unused_result__,
__leaf__)) realloc)(void *__ptr , size_t __size ) ;
extern __attribute__((__nothrow__)) int sprintf(char * __restrict __s , char const * __restrict __format
                                                 , ...) ;
extern __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1,2), __leaf__)) memcpy)(void * __restrict __dest ,
                                                                                                 void const * __restrict __src ,
                                                                                                 size_t __n ) ;
extern __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1,2), __leaf__)) strstr)(char const *__haystack ,
                                                                                                 char const *__needle ) __attribute__((__pure__)) ;
char *getNextToken(char const *str , int *pos , int length ) ;
char *getAllSymbolicNamesinAPath(char *rhs ) ;
struct field_values *addNewFields(char *sname , void *val , void *address , int type ) ;
void add_entryToSTable(char *vname , char *sname , void *val , void *address , int type ) ;
struct field_values *find_fieldValue(char *key ) ;
char *find_symVal(char *key ) ;
void *find_conVal(char *key ) ;
int find_address(char *key ) ;
void delete_entry(struct sym_table *s ) ;
void delete_allSTableEntry(void) ;
void print_entry(void) ;
void handleAssignmentSymbolically(char *lhs , char *rhs , void *val , void *address ,
                                  int type ) ;
void delete_allVariableTableEntry(void) ;
void addEntryToVariableTable(char *vname , int parameter ) ;
int findParameter(char *key ) ;
struct arraySym_table *arraySTable = (struct arraySym_table *)((void *)0);
char *findArrayRecord(char *aname , int index___0 ) ;
void addToIntTable(char *sname , int *val ) ;
void addToFloatTable(char *sname , float *val ) ;
int updateIntValBySname(char *sname , int value ) ;
int updateFloatValBySname(char *sname , float value ) ;
MainHT *mainHT = (MainHT *)((void *)0);
static int toInt(void *addr )
{


  {
  return ((int )((size_t )addr % 2147483647UL));
}
}
struct sym_table *stable = (struct sym_table *)((void *)0);
struct variable_table *varTable = (struct variable_table *)((void *)0);
struct field_values *addNewFields(char *sname , void *val , void *address , int type )
{
  struct field_values *t ;
  int size ;
  void *tmp ;
  size_t tmp___0 ;
  void *tmp___1 ;
  char *tmp___2 ;
  int tmp___3 ;
  int tmp___4 ;
  char *tmp___5 ;
  int tmp___6 ;
  int tmp___7 ;

  {
  tmp = malloc(sizeof(struct field_values ));
  t = (struct field_values *)tmp;
  tmp___0 = strlen((char const *)sname);
  tmp___1 = calloc(tmp___0 + 1UL, sizeof(char ));
  t->sname = (char *)tmp___1;
  strcpy((char * __restrict )t->sname, (char const * __restrict )sname);
  if (type == 1) {
    size = (int )sizeof(int );
    tmp___2 = strstr((char const *)sname, "structVar");
    if ((unsigned long )tmp___2 == (unsigned long )((void *)0)) {
      tmp___3 = strcmp((char const *)sname, "Constant");
      if (tmp___3 != 0) {
        tmp___4 = strcmp((char const *)sname, "Function");
        if (tmp___4 != 0) {
          addToIntTable(sname, (int *)val);
        }
      }
    }
  } else {
    size = (int )sizeof(float );
    tmp___5 = strstr((char const *)sname, "structVar");
    if ((unsigned long )tmp___5 == (unsigned long )((void *)0)) {
      tmp___6 = strcmp((char const *)sname, "Constant");
      if (tmp___6 != 0) {
        tmp___7 = strcmp((char const *)sname, "Function");
        if (tmp___7 != 0) {
          addToFloatTable(t->sname, (float *)val);
        }
      }
    }
  }
  t->cval = malloc((size_t )size);
  memcpy((void * __restrict )t->cval, (void const * __restrict )val, (size_t )size);
  t->address = toInt(address);
  t->type = type;
  return (t);
}
}
void add_entryToSTable(char *vname , char *sname , void *val , void *address , int type )
{
  struct sym_table *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  size_t tmp ;
  size_t tmp___0 ;
  size_t tmp___1 ;
  int tmp___2 ;
  size_t tmp___3 ;
  void *tmp___4 ;
  size_t tmp___5 ;
  void *tmp___6 ;
  unsigned int _ha_bkt ;
  size_t tmp___7 ;
  void *tmp___8 ;
  void *tmp___9 ;
  unsigned int _hj_i___0 ;
  unsigned int _hj_j___0 ;
  unsigned int _hj_k___0 ;
  unsigned char *_hj_key___0 ;
  size_t tmp___10 ;
  size_t tmp___11 ;
  unsigned int _he_bkt ;
  unsigned int _he_bkt_i ;
  struct UT_hash_handle *_he_thh ;
  struct UT_hash_handle *_he_hh_nxt ;
  UT_hash_bucket *_he_new_buckets ;
  UT_hash_bucket *_he_newbkt ;
  void *tmp___12 ;
  int tmp___13 ;

  {
  while (1) {
    s = (struct sym_table *)((void *)0);
    if (stable) {
      while (1) {
        _hj_key = (unsigned char *)vname;
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        tmp = strlen((char const *)vname);
        _hj_k = (unsigned int )tmp;
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        tmp___0 = strlen((char const *)vname);
        _hf_hashv = (unsigned int )((size_t )_hf_hashv + tmp___0);
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((stable->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((stable->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct sym_table *)((void *)((char *)((stable->hh.tbl)->buckets + _hf_bkt)->hh_head - (stable->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct sym_table *)((void *)0);
        }
        while (s) {
          tmp___3 = strlen((char const *)vname);
          if ((size_t )s->hh.keylen == tmp___3) {
            tmp___1 = strlen((char const *)vname);
            tmp___2 = memcmp((void const *)s->hh.key, (void const *)vname, tmp___1);
            if (tmp___2 == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct sym_table *)((void *)((char *)s->hh.hh_next - (stable->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct sym_table *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  if ((unsigned long )s == (unsigned long )((void *)0)) {
    tmp___4 = malloc(sizeof(struct sym_table ));
    s = (struct sym_table *)tmp___4;
    tmp___5 = strlen((char const *)vname);
    tmp___6 = calloc(tmp___5 + 1UL, sizeof(char ));
    s->vname = (char *)tmp___6;
    strcpy((char * __restrict )s->vname, (char const * __restrict )vname);
    while (1) {
      s->hh.next = (void *)0;
      s->hh.key = (void *)(s->vname + 0);
      tmp___7 = strlen((char const *)s->vname);
      s->hh.keylen = (unsigned int )tmp___7;
      if (! stable) {
        stable = s;
        stable->hh.prev = (void *)0;
        while (1) {
          tmp___8 = malloc(sizeof(UT_hash_table ));
          stable->hh.tbl = (UT_hash_table *)tmp___8;
          if (! stable->hh.tbl) {
            exit(-1);
          }
          memset((void *)stable->hh.tbl, 0, sizeof(UT_hash_table ));
          (stable->hh.tbl)->tail = & stable->hh;
          (stable->hh.tbl)->num_buckets = 32U;
          (stable->hh.tbl)->log2_num_buckets = 5U;
          (stable->hh.tbl)->hho = (char *)(& stable->hh) - (char *)stable;
          tmp___9 = malloc(32UL * sizeof(struct UT_hash_bucket ));
          (stable->hh.tbl)->buckets = (UT_hash_bucket *)tmp___9;
          if (! (stable->hh.tbl)->buckets) {
            exit(-1);
          }
          memset((void *)(stable->hh.tbl)->buckets, 0, 32UL * sizeof(struct UT_hash_bucket ));
          (stable->hh.tbl)->signature = 2685476833U;
          break;
        }
      } else {
        ((stable->hh.tbl)->tail)->next = (void *)s;
        s->hh.prev = (void *)((char *)(stable->hh.tbl)->tail - (stable->hh.tbl)->hho);
        (stable->hh.tbl)->tail = & s->hh;
      }
      ((stable->hh.tbl)->num_items) ++;
      s->hh.tbl = stable->hh.tbl;
      while (1) {
        _hj_key___0 = (unsigned char *)(s->vname + 0);
        s->hh.hashv = 4276993775U;
        _hj_j___0 = 2654435769U;
        _hj_i___0 = _hj_j___0;
        tmp___10 = strlen((char const *)s->vname);
        _hj_k___0 = (unsigned int )tmp___10;
        while (_hj_k___0 >= 12U) {
          _hj_i___0 += (((unsigned int )*(_hj_key___0 + 0) + ((unsigned int )*(_hj_key___0 + 1) << 8)) + ((unsigned int )*(_hj_key___0 + 2) << 16)) + ((unsigned int )*(_hj_key___0 + 3) << 24);
          _hj_j___0 += (((unsigned int )*(_hj_key___0 + 4) + ((unsigned int )*(_hj_key___0 + 5) << 8)) + ((unsigned int )*(_hj_key___0 + 6) << 16)) + ((unsigned int )*(_hj_key___0 + 7) << 24);
          s->hh.hashv += (((unsigned int )*(_hj_key___0 + 8) + ((unsigned int )*(_hj_key___0 + 9) << 8)) + ((unsigned int )*(_hj_key___0 + 10) << 16)) + ((unsigned int )*(_hj_key___0 + 11) << 24);
          while (1) {
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= s->hh.hashv;
            _hj_i___0 ^= s->hh.hashv >> 13;
            _hj_j___0 -= s->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 8;
            s->hh.hashv -= _hj_i___0;
            s->hh.hashv -= _hj_j___0;
            s->hh.hashv ^= _hj_j___0 >> 13;
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= s->hh.hashv;
            _hj_i___0 ^= s->hh.hashv >> 12;
            _hj_j___0 -= s->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 16;
            s->hh.hashv -= _hj_i___0;
            s->hh.hashv -= _hj_j___0;
            s->hh.hashv ^= _hj_j___0 >> 5;
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= s->hh.hashv;
            _hj_i___0 ^= s->hh.hashv >> 3;
            _hj_j___0 -= s->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 10;
            s->hh.hashv -= _hj_i___0;
            s->hh.hashv -= _hj_j___0;
            s->hh.hashv ^= _hj_j___0 >> 15;
            break;
          }
          _hj_key___0 += 12;
          _hj_k___0 -= 12U;
        }
        tmp___11 = strlen((char const *)s->vname);
        s->hh.hashv = (unsigned int )((size_t )s->hh.hashv + tmp___11);
        switch (_hj_k___0) {
        case 11U:
        s->hh.hashv += (unsigned int )*(_hj_key___0 + 10) << 24;
        case 10U:
        s->hh.hashv += (unsigned int )*(_hj_key___0 + 9) << 16;
        case 9U:
        s->hh.hashv += (unsigned int )*(_hj_key___0 + 8) << 8;
        case 8U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 7) << 24;
        case 7U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 6) << 16;
        case 6U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 5) << 8;
        case 5U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 4);
        case 4U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 3) << 24;
        case 3U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 2) << 16;
        case 2U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 1) << 8;
        case 1U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 0);
        }
        while (1) {
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= s->hh.hashv;
          _hj_i___0 ^= s->hh.hashv >> 13;
          _hj_j___0 -= s->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 8;
          s->hh.hashv -= _hj_i___0;
          s->hh.hashv -= _hj_j___0;
          s->hh.hashv ^= _hj_j___0 >> 13;
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= s->hh.hashv;
          _hj_i___0 ^= s->hh.hashv >> 12;
          _hj_j___0 -= s->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 16;
          s->hh.hashv -= _hj_i___0;
          s->hh.hashv -= _hj_j___0;
          s->hh.hashv ^= _hj_j___0 >> 5;
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= s->hh.hashv;
          _hj_i___0 ^= s->hh.hashv >> 3;
          _hj_j___0 -= s->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 10;
          s->hh.hashv -= _hj_i___0;
          s->hh.hashv -= _hj_j___0;
          s->hh.hashv ^= _hj_j___0 >> 15;
          break;
        }
        _ha_bkt = s->hh.hashv & ((stable->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        (((stable->hh.tbl)->buckets + _ha_bkt)->count) ++;
        s->hh.hh_next = ((stable->hh.tbl)->buckets + _ha_bkt)->hh_head;
        s->hh.hh_prev = (struct UT_hash_handle *)((void *)0);
        if (((stable->hh.tbl)->buckets + _ha_bkt)->hh_head) {
          (((stable->hh.tbl)->buckets + _ha_bkt)->hh_head)->hh_prev = & s->hh;
        }
        ((stable->hh.tbl)->buckets + _ha_bkt)->hh_head = & s->hh;
        if (((stable->hh.tbl)->buckets + _ha_bkt)->count >= (((stable->hh.tbl)->buckets + _ha_bkt)->expand_mult + 1U) * 10U) {
          if ((s->hh.tbl)->noexpand != 1U) {
            while (1) {
              tmp___12 = malloc((unsigned long )(2U * (s->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
              _he_new_buckets = (UT_hash_bucket *)tmp___12;
              if (! _he_new_buckets) {
                exit(-1);
              }
              memset((void *)_he_new_buckets, 0, (unsigned long )(2U * (s->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
              if ((s->hh.tbl)->num_items & ((s->hh.tbl)->num_buckets * 2U - 1U)) {
                tmp___13 = 1;
              } else {
                tmp___13 = 0;
              }
              (s->hh.tbl)->ideal_chain_maxlen = ((s->hh.tbl)->num_items >> ((s->hh.tbl)->log2_num_buckets + 1U)) + (unsigned int )tmp___13;
              (s->hh.tbl)->nonideal_items = 0U;
              _he_bkt_i = 0U;
              while (_he_bkt_i < (s->hh.tbl)->num_buckets) {
                _he_thh = ((s->hh.tbl)->buckets + _he_bkt_i)->hh_head;
                while (_he_thh) {
                  _he_hh_nxt = _he_thh->hh_next;
                  while (1) {
                    _he_bkt = _he_thh->hashv & ((s->hh.tbl)->num_buckets * 2U - 1U);
                    break;
                  }
                  _he_newbkt = _he_new_buckets + _he_bkt;
                  (_he_newbkt->count) ++;
                  if (_he_newbkt->count > (s->hh.tbl)->ideal_chain_maxlen) {
                    ((s->hh.tbl)->nonideal_items) ++;
                    _he_newbkt->expand_mult = _he_newbkt->count / (s->hh.tbl)->ideal_chain_maxlen;
                  }
                  _he_thh->hh_prev = (struct UT_hash_handle *)((void *)0);
                  _he_thh->hh_next = _he_newbkt->hh_head;
                  if (_he_newbkt->hh_head) {
                    (_he_newbkt->hh_head)->hh_prev = _he_thh;
                  }
                  _he_newbkt->hh_head = _he_thh;
                  _he_thh = _he_hh_nxt;
                }
                _he_bkt_i ++;
              }
              free((void *)(s->hh.tbl)->buckets);
              (s->hh.tbl)->num_buckets *= 2U;
              ((s->hh.tbl)->log2_num_buckets) ++;
              (s->hh.tbl)->buckets = _he_new_buckets;
              if ((s->hh.tbl)->nonideal_items > (s->hh.tbl)->num_items >> 1) {
                ((s->hh.tbl)->ineff_expands) ++;
              } else {
                (s->hh.tbl)->ineff_expands = 0U;
              }
              if ((s->hh.tbl)->ineff_expands > 1U) {
                (s->hh.tbl)->noexpand = 1U;
              }
              break;
            }
          }
        }
        break;
      }
      break;
    }
  }
  s->fval = addNewFields(sname, val, address, type);
  return;
}
}
void addEntryToVariableTable(char *vname , int parameter )
{
  struct variable_table *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  size_t tmp ;
  size_t tmp___0 ;
  size_t tmp___1 ;
  int tmp___2 ;
  size_t tmp___3 ;
  void *tmp___4 ;
  size_t tmp___5 ;
  void *tmp___6 ;
  unsigned int _ha_bkt ;
  size_t tmp___7 ;
  void *tmp___8 ;
  void *tmp___9 ;
  unsigned int _hj_i___0 ;
  unsigned int _hj_j___0 ;
  unsigned int _hj_k___0 ;
  unsigned char *_hj_key___0 ;
  size_t tmp___10 ;
  size_t tmp___11 ;
  unsigned int _he_bkt ;
  unsigned int _he_bkt_i ;
  struct UT_hash_handle *_he_thh ;
  struct UT_hash_handle *_he_hh_nxt ;
  UT_hash_bucket *_he_new_buckets ;
  UT_hash_bucket *_he_newbkt ;
  void *tmp___12 ;
  int tmp___13 ;

  {
  while (1) {
    s = (struct variable_table *)((void *)0);
    if (varTable) {
      while (1) {
        _hj_key = (unsigned char *)vname;
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        tmp = strlen((char const *)vname);
        _hj_k = (unsigned int )tmp;
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        tmp___0 = strlen((char const *)vname);
        _hf_hashv = (unsigned int )((size_t )_hf_hashv + tmp___0);
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((varTable->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((varTable->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct variable_table *)((void *)((char *)((varTable->hh.tbl)->buckets + _hf_bkt)->hh_head - (varTable->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct variable_table *)((void *)0);
        }
        while (s) {
          tmp___3 = strlen((char const *)vname);
          if ((size_t )s->hh.keylen == tmp___3) {
            tmp___1 = strlen((char const *)vname);
            tmp___2 = memcmp((void const *)s->hh.key, (void const *)vname, tmp___1);
            if (tmp___2 == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct variable_table *)((void *)((char *)s->hh.hh_next - (varTable->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct variable_table *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  if ((unsigned long )s == (unsigned long )((void *)0)) {
    tmp___4 = malloc(sizeof(struct variable_table ));
    s = (struct variable_table *)tmp___4;
    tmp___5 = strlen((char const *)vname);
    tmp___6 = calloc(tmp___5 + 1UL, sizeof(char ));
    s->varName = (char *)tmp___6;
    strcpy((char * __restrict )s->varName, (char const * __restrict )vname);
    while (1) {
      s->hh.next = (void *)0;
      s->hh.key = (void *)(s->varName + 0);
      tmp___7 = strlen((char const *)s->varName);
      s->hh.keylen = (unsigned int )tmp___7;
      if (! varTable) {
        varTable = s;
        varTable->hh.prev = (void *)0;
        while (1) {
          tmp___8 = malloc(sizeof(UT_hash_table ));
          varTable->hh.tbl = (UT_hash_table *)tmp___8;
          if (! varTable->hh.tbl) {
            exit(-1);
          }
          memset((void *)varTable->hh.tbl, 0, sizeof(UT_hash_table ));
          (varTable->hh.tbl)->tail = & varTable->hh;
          (varTable->hh.tbl)->num_buckets = 32U;
          (varTable->hh.tbl)->log2_num_buckets = 5U;
          (varTable->hh.tbl)->hho = (char *)(& varTable->hh) - (char *)varTable;
          tmp___9 = malloc(32UL * sizeof(struct UT_hash_bucket ));
          (varTable->hh.tbl)->buckets = (UT_hash_bucket *)tmp___9;
          if (! (varTable->hh.tbl)->buckets) {
            exit(-1);
          }
          memset((void *)(varTable->hh.tbl)->buckets, 0, 32UL * sizeof(struct UT_hash_bucket ));
          (varTable->hh.tbl)->signature = 2685476833U;
          break;
        }
      } else {
        ((varTable->hh.tbl)->tail)->next = (void *)s;
        s->hh.prev = (void *)((char *)(varTable->hh.tbl)->tail - (varTable->hh.tbl)->hho);
        (varTable->hh.tbl)->tail = & s->hh;
      }
      ((varTable->hh.tbl)->num_items) ++;
      s->hh.tbl = varTable->hh.tbl;
      while (1) {
        _hj_key___0 = (unsigned char *)(s->varName + 0);
        s->hh.hashv = 4276993775U;
        _hj_j___0 = 2654435769U;
        _hj_i___0 = _hj_j___0;
        tmp___10 = strlen((char const *)s->varName);
        _hj_k___0 = (unsigned int )tmp___10;
        while (_hj_k___0 >= 12U) {
          _hj_i___0 += (((unsigned int )*(_hj_key___0 + 0) + ((unsigned int )*(_hj_key___0 + 1) << 8)) + ((unsigned int )*(_hj_key___0 + 2) << 16)) + ((unsigned int )*(_hj_key___0 + 3) << 24);
          _hj_j___0 += (((unsigned int )*(_hj_key___0 + 4) + ((unsigned int )*(_hj_key___0 + 5) << 8)) + ((unsigned int )*(_hj_key___0 + 6) << 16)) + ((unsigned int )*(_hj_key___0 + 7) << 24);
          s->hh.hashv += (((unsigned int )*(_hj_key___0 + 8) + ((unsigned int )*(_hj_key___0 + 9) << 8)) + ((unsigned int )*(_hj_key___0 + 10) << 16)) + ((unsigned int )*(_hj_key___0 + 11) << 24);
          while (1) {
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= s->hh.hashv;
            _hj_i___0 ^= s->hh.hashv >> 13;
            _hj_j___0 -= s->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 8;
            s->hh.hashv -= _hj_i___0;
            s->hh.hashv -= _hj_j___0;
            s->hh.hashv ^= _hj_j___0 >> 13;
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= s->hh.hashv;
            _hj_i___0 ^= s->hh.hashv >> 12;
            _hj_j___0 -= s->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 16;
            s->hh.hashv -= _hj_i___0;
            s->hh.hashv -= _hj_j___0;
            s->hh.hashv ^= _hj_j___0 >> 5;
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= s->hh.hashv;
            _hj_i___0 ^= s->hh.hashv >> 3;
            _hj_j___0 -= s->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 10;
            s->hh.hashv -= _hj_i___0;
            s->hh.hashv -= _hj_j___0;
            s->hh.hashv ^= _hj_j___0 >> 15;
            break;
          }
          _hj_key___0 += 12;
          _hj_k___0 -= 12U;
        }
        tmp___11 = strlen((char const *)s->varName);
        s->hh.hashv = (unsigned int )((size_t )s->hh.hashv + tmp___11);
        switch (_hj_k___0) {
        case 11U:
        s->hh.hashv += (unsigned int )*(_hj_key___0 + 10) << 24;
        case 10U:
        s->hh.hashv += (unsigned int )*(_hj_key___0 + 9) << 16;
        case 9U:
        s->hh.hashv += (unsigned int )*(_hj_key___0 + 8) << 8;
        case 8U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 7) << 24;
        case 7U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 6) << 16;
        case 6U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 5) << 8;
        case 5U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 4);
        case 4U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 3) << 24;
        case 3U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 2) << 16;
        case 2U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 1) << 8;
        case 1U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 0);
        }
        while (1) {
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= s->hh.hashv;
          _hj_i___0 ^= s->hh.hashv >> 13;
          _hj_j___0 -= s->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 8;
          s->hh.hashv -= _hj_i___0;
          s->hh.hashv -= _hj_j___0;
          s->hh.hashv ^= _hj_j___0 >> 13;
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= s->hh.hashv;
          _hj_i___0 ^= s->hh.hashv >> 12;
          _hj_j___0 -= s->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 16;
          s->hh.hashv -= _hj_i___0;
          s->hh.hashv -= _hj_j___0;
          s->hh.hashv ^= _hj_j___0 >> 5;
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= s->hh.hashv;
          _hj_i___0 ^= s->hh.hashv >> 3;
          _hj_j___0 -= s->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 10;
          s->hh.hashv -= _hj_i___0;
          s->hh.hashv -= _hj_j___0;
          s->hh.hashv ^= _hj_j___0 >> 15;
          break;
        }
        _ha_bkt = s->hh.hashv & ((varTable->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        (((varTable->hh.tbl)->buckets + _ha_bkt)->count) ++;
        s->hh.hh_next = ((varTable->hh.tbl)->buckets + _ha_bkt)->hh_head;
        s->hh.hh_prev = (struct UT_hash_handle *)((void *)0);
        if (((varTable->hh.tbl)->buckets + _ha_bkt)->hh_head) {
          (((varTable->hh.tbl)->buckets + _ha_bkt)->hh_head)->hh_prev = & s->hh;
        }
        ((varTable->hh.tbl)->buckets + _ha_bkt)->hh_head = & s->hh;
        if (((varTable->hh.tbl)->buckets + _ha_bkt)->count >= (((varTable->hh.tbl)->buckets + _ha_bkt)->expand_mult + 1U) * 10U) {
          if ((s->hh.tbl)->noexpand != 1U) {
            while (1) {
              tmp___12 = malloc((unsigned long )(2U * (s->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
              _he_new_buckets = (UT_hash_bucket *)tmp___12;
              if (! _he_new_buckets) {
                exit(-1);
              }
              memset((void *)_he_new_buckets, 0, (unsigned long )(2U * (s->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
              if ((s->hh.tbl)->num_items & ((s->hh.tbl)->num_buckets * 2U - 1U)) {
                tmp___13 = 1;
              } else {
                tmp___13 = 0;
              }
              (s->hh.tbl)->ideal_chain_maxlen = ((s->hh.tbl)->num_items >> ((s->hh.tbl)->log2_num_buckets + 1U)) + (unsigned int )tmp___13;
              (s->hh.tbl)->nonideal_items = 0U;
              _he_bkt_i = 0U;
              while (_he_bkt_i < (s->hh.tbl)->num_buckets) {
                _he_thh = ((s->hh.tbl)->buckets + _he_bkt_i)->hh_head;
                while (_he_thh) {
                  _he_hh_nxt = _he_thh->hh_next;
                  while (1) {
                    _he_bkt = _he_thh->hashv & ((s->hh.tbl)->num_buckets * 2U - 1U);
                    break;
                  }
                  _he_newbkt = _he_new_buckets + _he_bkt;
                  (_he_newbkt->count) ++;
                  if (_he_newbkt->count > (s->hh.tbl)->ideal_chain_maxlen) {
                    ((s->hh.tbl)->nonideal_items) ++;
                    _he_newbkt->expand_mult = _he_newbkt->count / (s->hh.tbl)->ideal_chain_maxlen;
                  }
                  _he_thh->hh_prev = (struct UT_hash_handle *)((void *)0);
                  _he_thh->hh_next = _he_newbkt->hh_head;
                  if (_he_newbkt->hh_head) {
                    (_he_newbkt->hh_head)->hh_prev = _he_thh;
                  }
                  _he_newbkt->hh_head = _he_thh;
                  _he_thh = _he_hh_nxt;
                }
                _he_bkt_i ++;
              }
              free((void *)(s->hh.tbl)->buckets);
              (s->hh.tbl)->num_buckets *= 2U;
              ((s->hh.tbl)->log2_num_buckets) ++;
              (s->hh.tbl)->buckets = _he_new_buckets;
              if ((s->hh.tbl)->nonideal_items > (s->hh.tbl)->num_items >> 1) {
                ((s->hh.tbl)->ineff_expands) ++;
              } else {
                (s->hh.tbl)->ineff_expands = 0U;
              }
              if ((s->hh.tbl)->ineff_expands > 1U) {
                (s->hh.tbl)->noexpand = 1U;
              }
              break;
            }
          }
        }
        break;
      }
      break;
    }
    s->parameter = parameter;
  }
  return;
}
}
int findParameter(char *key )
{
  struct variable_table *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  size_t tmp ;
  size_t tmp___0 ;
  size_t tmp___1 ;
  int tmp___2 ;
  size_t tmp___3 ;

  {
  while (1) {
    s = (struct variable_table *)((void *)0);
    if (varTable) {
      while (1) {
        _hj_key = (unsigned char *)key;
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        tmp = strlen((char const *)key);
        _hj_k = (unsigned int )tmp;
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        tmp___0 = strlen((char const *)key);
        _hf_hashv = (unsigned int )((size_t )_hf_hashv + tmp___0);
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((varTable->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((varTable->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct variable_table *)((void *)((char *)((varTable->hh.tbl)->buckets + _hf_bkt)->hh_head - (varTable->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct variable_table *)((void *)0);
        }
        while (s) {
          tmp___3 = strlen((char const *)key);
          if ((size_t )s->hh.keylen == tmp___3) {
            tmp___1 = strlen((char const *)key);
            tmp___2 = memcmp((void const *)s->hh.key, (void const *)key, tmp___1);
            if (tmp___2 == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct variable_table *)((void *)((char *)s->hh.hh_next - (varTable->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct variable_table *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  return (s->parameter);
}
}
struct field_values *find_fieldValue(char *key )
{
  struct sym_table *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  size_t tmp ;
  size_t tmp___0 ;
  size_t tmp___1 ;
  int tmp___2 ;
  size_t tmp___3 ;

  {
  while (1) {
    s = (struct sym_table *)((void *)0);
    if (stable) {
      while (1) {
        _hj_key = (unsigned char *)key;
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        tmp = strlen((char const *)key);
        _hj_k = (unsigned int )tmp;
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        tmp___0 = strlen((char const *)key);
        _hf_hashv = (unsigned int )((size_t )_hf_hashv + tmp___0);
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((stable->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((stable->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct sym_table *)((void *)((char *)((stable->hh.tbl)->buckets + _hf_bkt)->hh_head - (stable->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct sym_table *)((void *)0);
        }
        while (s) {
          tmp___3 = strlen((char const *)key);
          if ((size_t )s->hh.keylen == tmp___3) {
            tmp___1 = strlen((char const *)key);
            tmp___2 = memcmp((void const *)s->hh.key, (void const *)key, tmp___1);
            if (tmp___2 == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct sym_table *)((void *)((char *)s->hh.hh_next - (stable->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct sym_table *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  if ((unsigned long )s == (unsigned long )((void *)0)) {
    return ((struct field_values *)((void *)0));
  }
  return (s->fval);
}
}
char *find_symVal(char *key )
{
  struct field_values *fv ;

  {
  fv = find_fieldValue(key);
  if ((unsigned long )fv == (unsigned long )((void *)0)) {
    return ((char *)((void *)0));
  }
  return (fv->sname);
}
}
void *find_conVal(char *key )
{
  struct field_values *fv ;

  {
  fv = find_fieldValue(key);
  return (fv->cval);
}
}
int find_address(char *key )
{
  struct field_values *fv ;

  {
  fv = find_fieldValue(key);
  return (fv->address);
}
}
void delete_entry(struct sym_table *s )
{
  unsigned int _hd_bkt ;
  struct UT_hash_handle *_hd_hh_del ;

  {
  while (1) {
    if ((unsigned long )s->hh.prev == (unsigned long )((void *)0)) {
      if ((unsigned long )s->hh.next == (unsigned long )((void *)0)) {
        free((void *)(stable->hh.tbl)->buckets);
        free((void *)stable->hh.tbl);
        stable = (struct sym_table *)((void *)0);
      } else {
        goto _L;
      }
    } else {
      _L:
      _hd_hh_del = & s->hh;
      if ((unsigned long )s == (unsigned long )((void *)((char *)(stable->hh.tbl)->tail - (stable->hh.tbl)->hho))) {
        (stable->hh.tbl)->tail = (UT_hash_handle *)((ptrdiff_t )s->hh.prev + (stable->hh.tbl)->hho);
      }
      if (s->hh.prev) {
        ((UT_hash_handle *)((ptrdiff_t )s->hh.prev + (stable->hh.tbl)->hho))->next = s->hh.next;
      } else {
        while (1) {
          stable = (struct sym_table *)s->hh.next;
          break;
        }
      }
      if (_hd_hh_del->next) {
        ((UT_hash_handle *)((ptrdiff_t )_hd_hh_del->next + (stable->hh.tbl)->hho))->prev = _hd_hh_del->prev;
      }
      while (1) {
        _hd_bkt = _hd_hh_del->hashv & ((stable->hh.tbl)->num_buckets - 1U);
        break;
      }
      (((stable->hh.tbl)->buckets + _hd_bkt)->count) --;
      if ((unsigned long )((stable->hh.tbl)->buckets + _hd_bkt)->hh_head == (unsigned long )_hd_hh_del) {
        ((stable->hh.tbl)->buckets + _hd_bkt)->hh_head = _hd_hh_del->hh_next;
      }
      if (_hd_hh_del->hh_prev) {
        (_hd_hh_del->hh_prev)->hh_next = _hd_hh_del->hh_next;
      }
      if (_hd_hh_del->hh_next) {
        (_hd_hh_del->hh_next)->hh_prev = _hd_hh_del->hh_prev;
      }
      ((stable->hh.tbl)->num_items) --;
    }
    break;
  }
  free((void *)s);
  return;
}
}
void delete_allSTableEntry(void)
{
  struct sym_table *current_entry ;
  struct sym_table *tmp ;
  void *tmp___0 ;
  void *tmp___1 ;
  unsigned int _hd_bkt ;
  struct UT_hash_handle *_hd_hh_del ;

  {
  current_entry = stable;
  if (stable) {
    tmp___0 = stable->hh.next;
  } else {
    tmp___0 = (void *)0;
  }
  tmp = (struct sym_table *)tmp___0;
  while (current_entry) {
    while (1) {
      if ((unsigned long )current_entry->hh.prev == (unsigned long )((void *)0)) {
        if ((unsigned long )current_entry->hh.next == (unsigned long )((void *)0)) {
          free((void *)(stable->hh.tbl)->buckets);
          free((void *)stable->hh.tbl);
          stable = (struct sym_table *)((void *)0);
        } else {
          goto _L;
        }
      } else {
        _L:
        _hd_hh_del = & current_entry->hh;
        if ((unsigned long )current_entry == (unsigned long )((void *)((char *)(stable->hh.tbl)->tail - (stable->hh.tbl)->hho))) {
          (stable->hh.tbl)->tail = (UT_hash_handle *)((ptrdiff_t )current_entry->hh.prev + (stable->hh.tbl)->hho);
        }
        if (current_entry->hh.prev) {
          ((UT_hash_handle *)((ptrdiff_t )current_entry->hh.prev + (stable->hh.tbl)->hho))->next = current_entry->hh.next;
        } else {
          while (1) {
            stable = (struct sym_table *)current_entry->hh.next;
            break;
          }
        }
        if (_hd_hh_del->next) {
          ((UT_hash_handle *)((ptrdiff_t )_hd_hh_del->next + (stable->hh.tbl)->hho))->prev = _hd_hh_del->prev;
        }
        while (1) {
          _hd_bkt = _hd_hh_del->hashv & ((stable->hh.tbl)->num_buckets - 1U);
          break;
        }
        (((stable->hh.tbl)->buckets + _hd_bkt)->count) --;
        if ((unsigned long )((stable->hh.tbl)->buckets + _hd_bkt)->hh_head == (unsigned long )_hd_hh_del) {
          ((stable->hh.tbl)->buckets + _hd_bkt)->hh_head = _hd_hh_del->hh_next;
        }
        if (_hd_hh_del->hh_prev) {
          (_hd_hh_del->hh_prev)->hh_next = _hd_hh_del->hh_next;
        }
        if (_hd_hh_del->hh_next) {
          (_hd_hh_del->hh_next)->hh_prev = _hd_hh_del->hh_prev;
        }
        ((stable->hh.tbl)->num_items) --;
      }
      break;
    }
    free((void *)current_entry);
    current_entry = tmp;
    if (tmp) {
      tmp___1 = tmp->hh.next;
    } else {
      tmp___1 = (void *)0;
    }
    tmp = (struct sym_table *)tmp___1;
  }
  return;
}
}
void delete_allVariableTableEntry(void)
{
  struct variable_table *current_entry ;
  struct variable_table *tmp ;
  void *tmp___0 ;
  void *tmp___1 ;
  unsigned int _hd_bkt ;
  struct UT_hash_handle *_hd_hh_del ;

  {
  current_entry = varTable;
  if (varTable) {
    tmp___0 = varTable->hh.next;
  } else {
    tmp___0 = (void *)0;
  }
  tmp = (struct variable_table *)tmp___0;
  while (current_entry) {
    while (1) {
      if ((unsigned long )current_entry->hh.prev == (unsigned long )((void *)0)) {
        if ((unsigned long )current_entry->hh.next == (unsigned long )((void *)0)) {
          free((void *)(varTable->hh.tbl)->buckets);
          free((void *)varTable->hh.tbl);
          varTable = (struct variable_table *)((void *)0);
        } else {
          goto _L;
        }
      } else {
        _L:
        _hd_hh_del = & current_entry->hh;
        if ((unsigned long )current_entry == (unsigned long )((void *)((char *)(varTable->hh.tbl)->tail - (varTable->hh.tbl)->hho))) {
          (varTable->hh.tbl)->tail = (UT_hash_handle *)((ptrdiff_t )current_entry->hh.prev + (varTable->hh.tbl)->hho);
        }
        if (current_entry->hh.prev) {
          ((UT_hash_handle *)((ptrdiff_t )current_entry->hh.prev + (varTable->hh.tbl)->hho))->next = current_entry->hh.next;
        } else {
          while (1) {
            varTable = (struct variable_table *)current_entry->hh.next;
            break;
          }
        }
        if (_hd_hh_del->next) {
          ((UT_hash_handle *)((ptrdiff_t )_hd_hh_del->next + (varTable->hh.tbl)->hho))->prev = _hd_hh_del->prev;
        }
        while (1) {
          _hd_bkt = _hd_hh_del->hashv & ((varTable->hh.tbl)->num_buckets - 1U);
          break;
        }
        (((varTable->hh.tbl)->buckets + _hd_bkt)->count) --;
        if ((unsigned long )((varTable->hh.tbl)->buckets + _hd_bkt)->hh_head == (unsigned long )_hd_hh_del) {
          ((varTable->hh.tbl)->buckets + _hd_bkt)->hh_head = _hd_hh_del->hh_next;
        }
        if (_hd_hh_del->hh_prev) {
          (_hd_hh_del->hh_prev)->hh_next = _hd_hh_del->hh_next;
        }
        if (_hd_hh_del->hh_next) {
          (_hd_hh_del->hh_next)->hh_prev = _hd_hh_del->hh_prev;
        }
        ((varTable->hh.tbl)->num_items) --;
      }
      break;
    }
    free((void *)current_entry);
    current_entry = tmp;
    if (tmp) {
      tmp___1 = tmp->hh.next;
    } else {
      tmp___1 = (void *)0;
    }
    tmp = (struct variable_table *)tmp___1;
  }
  return;
}
}
void print_entry(void)
{
  struct sym_table *s ;
  int tmp ;
  void *tmp___0 ;
  char *tmp___1 ;

  {
  s = stable;
  while ((unsigned long )s != (unsigned long )((void *)0)) {
    tmp = find_address(s->vname);
    tmp___0 = find_conVal(s->vname);
    tmp___1 = find_symVal(s->vname);
    printf((char const * __restrict )"variable name %s: symbolic name: %s concrete value:%d address:%d\n",
           s->vname, tmp___1, *((int *)tmp___0), tmp);
    s = (struct sym_table *)s->hh.next;
  }
  return;
}
}
void updateValBySymbolicName(char *sname , void *value )
{
  struct sym_table *s ;
  struct arraySym_table *s1 ;
  int size ;
  char *tmp ;
  int tmp___0 ;
  int tmp___1 ;
  int tmp___2 ;

  {
  size = (int )sizeof(int );
  s = stable;
  while ((unsigned long )s != (unsigned long )((void *)0)) {
    tmp = find_symVal(s->vname);
    tmp___0 = strcmp((char const *)tmp, (char const *)sname);
    if (tmp___0 == 0) {
      memcpy((void * __restrict )(s->fval)->cval, (void const * __restrict )value,
             (size_t )size);
      if ((s->fval)->type == 1) {
        updateIntValBySname(sname, *((int *)value));
      } else
      if (*((int *)value) < 0) {
        updateFloatValBySname(sname, (float )*((int *)value));
      } else {
        updateFloatValBySname(sname, *((float *)value));
      }
      return;
    }
    s = (struct sym_table *)s->hh.next;
  }
  s1 = arraySTable;
  while ((unsigned long )s1 != (unsigned long )((void *)0)) {
    tmp___1 = strcmp((char const *)(s1->sname), (char const *)sname);
    if (tmp___1 == 0) {
      memcpy((void * __restrict )s1->cval, (void const * __restrict )value, (size_t )size);
      if (s1->type == 1) {
        updateIntValBySname(sname, *((int *)value));
      } else {
        updateFloatValBySname(sname, *((float *)value));
      }
      return;
    }
    s1 = (struct arraySym_table *)s1->hh.next;
  }
  tmp___2 = updateIntValBySname(sname, *((int *)value));
  if (! tmp___2) {
    if (*((int *)value) < 0) {
      updateFloatValBySname(sname, (float )*((int *)value));
    } else {
      updateFloatValBySname(sname, *((float *)value));
    }
  }
  return;
}
}
void *findValBySymbolicName(char *sname )
{
  struct sym_table *s ;
  char *tmp ;
  int tmp___0 ;

  {
  s = stable;
  while ((unsigned long )s != (unsigned long )((void *)0)) {
    tmp = find_symVal(s->vname);
    tmp___0 = strcmp((char const *)tmp, (char const *)sname);
    if (tmp___0 == 0) {
      return ((s->fval)->cval);
    }
    s = (struct sym_table *)s->hh.next;
  }
  return ((void *)0);
}
}
char *getAllSymbolicNamesinAPath(char *rhs )
{
  char *token ;
  char *result ;
  int i ;
  int len ;
  void *tmp ;
  size_t tmp___0 ;
  size_t tmp___1 ;
  size_t tmp___2 ;
  void *tmp___3 ;
  int tmp___4 ;

  {
  i = 0;
  tmp = calloc((size_t )2, sizeof(char ));
  result = (char *)tmp;
  tmp___0 = strlen((char const *)rhs);
  len = (int )tmp___0;
  token = getNextToken((char const *)rhs, & i, len);
  while ((unsigned long )token != (unsigned long )((void *)0)) {
    free((void *)token);
    token = getNextToken((char const *)(rhs + i), & i, len);
    switch ((int )token_type) {
    case 2:
    case 1:
    case 0:
    break;
    case 5:
    tmp___4 = strcmp((char const *)token, "not");
    if (tmp___4 != 0) {
      tmp___1 = strlen((char const *)result);
      tmp___2 = strlen((char const *)token);
      tmp___3 = realloc((void *)result, (((tmp___1 + tmp___2) + 1UL) + 2UL) * sizeof(char ));
      result = (char *)tmp___3;
      strcat((char * __restrict )result, (char const * __restrict )token);
      strcat((char * __restrict )result, (char const * __restrict )"##");
    }
    break;
    }
  }
  strcat((char * __restrict )result, (char const * __restrict )"\000");
  return (result);
}
}
char *getArrayName(char const *str ) ;
void handleAssignmentSymbolically(char *lhs , char *rhs , void *val , void *address ,
                                  int type )
{
  int i ;
  int len ;
  int parameter ;
  int j ;
  int value ;
  char *token ;
  char *result ;
  char *symName ;
  char *temp ;
  char buff[15] ;
  void *tmp ;
  size_t tmp___0 ;
  size_t tmp___1 ;
  size_t tmp___2 ;
  void *tmp___3 ;
  int tmp___4 ;
  int tmp___5 ;
  void *tmp___6 ;
  size_t tmp___7 ;
  size_t tmp___8 ;
  void *tmp___9 ;
  void *tmp___10 ;
  size_t tmp___11 ;
  size_t tmp___12 ;
  void *tmp___13 ;
  size_t tmp___14 ;
  size_t tmp___15 ;
  void *tmp___16 ;
  int tmp___17 ;
  int tmp___18 ;
  int tmp___19 ;
  void *tmp___20 ;
  size_t tmp___21 ;
  size_t tmp___22 ;
  void *tmp___23 ;
  void *tmp___24 ;
  size_t tmp___25 ;
  size_t tmp___26 ;
  void *tmp___27 ;
  size_t tmp___28 ;
  size_t tmp___29 ;
  void *tmp___30 ;
  int tmp___31 ;
  int tmp___32 ;
  void *tmp___33 ;
  size_t tmp___34 ;
  size_t tmp___35 ;
  void *tmp___36 ;
  void *tmp___37 ;
  size_t tmp___38 ;
  size_t tmp___39 ;
  void *tmp___40 ;
  size_t tmp___41 ;
  size_t tmp___42 ;
  void *tmp___43 ;
  int tmp___44 ;
  int tmp___45 ;

  {
  i = 0;
  tmp = calloc((size_t )2, sizeof(char ));
  result = (char *)tmp;
  tmp___0 = strlen((char const *)rhs);
  len = (int )tmp___0;
  token = getNextToken((char const *)rhs, & i, len);
  while ((unsigned long )token != (unsigned long )((void *)0)) {
    switch ((int )token_type) {
    case 2:
    case 1:
    case 0:
    tmp___1 = strlen((char const *)result);
    tmp___2 = strlen((char const *)token);
    tmp___3 = realloc((void *)result, ((tmp___1 + tmp___2) + 1UL) * sizeof(char ));
    result = (char *)tmp___3;
    strcat((char * __restrict )result, (char const * __restrict )token);
    break;
    case 3:
    parameter = findParameter(token);
    j = 0;
    while (j < 2 * parameter + 1) {
      symName = find_symVal(temp);
      if ((unsigned long )symName == (unsigned long )((void *)0)) {
        tmp___4 = findParameter(temp);
        tmp___5 = (int )getArrayName(temp);
        symName = findArrayRecord((char *)tmp___5, tmp___4);
      }
      temp = symName;
      j ++;
    }
    if ((unsigned long )symName != (unsigned long )((void *)0)) {
      tmp___18 = strcmp((char const *)symName, "Constant");
      if (tmp___18 == 0) {
        tmp___6 = findValBySymbolicName(symName);
        value = *((int *)tmp___6);
        sprintf((char * __restrict )(buff), (char const * __restrict )"%d", value);
        tmp___7 = strlen((char const *)result);
        tmp___8 = strlen((char const *)(buff));
        tmp___9 = realloc((void *)result, ((tmp___7 + tmp___8) + 1UL) * sizeof(char ));
        result = (char *)tmp___9;
        strcat((char * __restrict )result, (char const * __restrict )(buff));
      } else {
        tmp___17 = strcmp((char const *)symName, "Function");
        if (tmp___17 == 0) {
          tmp___10 = findValBySymbolicName(symName);
          sprintf((char * __restrict )(buff), (char const * __restrict )"%d",
                  *((int *)tmp___10));
          tmp___11 = strlen((char const *)result);
          tmp___12 = strlen((char const *)(buff));
          tmp___13 = realloc((void *)result, ((tmp___11 + tmp___12) + 1UL) * sizeof(char ));
          result = (char *)tmp___13;
          strcat((char * __restrict )result, (char const * __restrict )(buff));
        } else {
          tmp___14 = strlen((char const *)result);
          tmp___15 = strlen((char const *)symName);
          tmp___16 = realloc((void *)result, ((tmp___14 + tmp___15) + 1UL) * sizeof(char ));
          result = (char *)tmp___16;
          strcat((char * __restrict )result, (char const * __restrict )symName);
        }
      }
    }
    break;
    case 4:
    parameter = findParameter(token);
    tmp___19 = (int )getArrayName(token);
    symName = findArrayRecord((char *)tmp___19, parameter);
    if ((unsigned long )symName != (unsigned long )((void *)0)) {
      tmp___32 = strcmp((char const *)symName, "Constant");
      if (tmp___32 == 0) {
        tmp___20 = findValBySymbolicName(symName);
        sprintf((char * __restrict )(buff), (char const * __restrict )"%d", *((int *)tmp___20));
        tmp___21 = strlen((char const *)result);
        tmp___22 = strlen((char const *)(buff));
        tmp___23 = realloc((void *)result, ((tmp___21 + tmp___22) + 1UL) * sizeof(char ));
        result = (char *)tmp___23;
        strcat((char * __restrict )result, (char const * __restrict )(buff));
      } else {
        tmp___31 = strcmp((char const *)symName, "Function");
        if (tmp___31 == 0) {
          tmp___24 = findValBySymbolicName(symName);
          sprintf((char * __restrict )(buff), (char const * __restrict )"%d",
                  *((int *)tmp___24));
          tmp___25 = strlen((char const *)result);
          tmp___26 = strlen((char const *)(buff));
          tmp___27 = realloc((void *)result, ((tmp___25 + tmp___26) + 1UL) * sizeof(char ));
          result = (char *)tmp___27;
          strcat((char * __restrict )result, (char const * __restrict )(buff));
        } else {
          tmp___28 = strlen((char const *)result);
          tmp___29 = strlen((char const *)symName);
          tmp___30 = realloc((void *)result, ((tmp___28 + tmp___29) + 1UL) * sizeof(char ));
          result = (char *)tmp___30;
          strcat((char * __restrict )result, (char const * __restrict )symName);
        }
      }
    }
    break;
    case 5:
    symName = find_symVal(token);
    if ((unsigned long )symName != (unsigned long )((void *)0)) {
      tmp___45 = strcmp((char const *)symName, "Constant");
      if (tmp___45 == 0) {
        tmp___33 = findValBySymbolicName(symName);
        sprintf((char * __restrict )(buff), (char const * __restrict )"%d", *((int *)tmp___33));
        tmp___34 = strlen((char const *)result);
        tmp___35 = strlen((char const *)(buff));
        tmp___36 = realloc((void *)result, ((tmp___34 + tmp___35) + 1UL) * sizeof(char ));
        result = (char *)tmp___36;
        strcat((char * __restrict )result, (char const * __restrict )(buff));
      } else {
        tmp___44 = strcmp((char const *)symName, "Function");
        if (tmp___44 == 0) {
          tmp___37 = findValBySymbolicName(symName);
          sprintf((char * __restrict )(buff), (char const * __restrict )"%d",
                  *((int *)tmp___37));
          tmp___38 = strlen((char const *)result);
          tmp___39 = strlen((char const *)(buff));
          tmp___40 = realloc((void *)result, ((tmp___38 + tmp___39) + 1UL) * sizeof(char ));
          result = (char *)tmp___40;
          strcat((char * __restrict )result, (char const * __restrict )(buff));
        } else {
          tmp___41 = strlen((char const *)result);
          tmp___42 = strlen((char const *)symName);
          tmp___43 = realloc((void *)result, ((tmp___41 + tmp___42) + 1UL) * sizeof(char ));
          result = (char *)tmp___43;
          strcat((char * __restrict )result, (char const * __restrict )symName);
        }
      }
    }
    break;
    }
    token = getNextToken((char const *)(rhs + i), & i, len);
  }
  strcat((char * __restrict )result, (char const * __restrict )"\000");
  add_entryToSTable(lhs, result, val, address, type);
  delete_allVariableTableEntry();
  return;
}
}
char *getPointerName(char const *str ) ;
char *getPrepositionalFormula(char *expr )
{
  int i ;
  int len ;
  int parameter ;
  int j ;
  char *token ;
  char *result ;
  char *symName ;
  char *temp ;
  char buff[15] ;
  void *tmp ;
  size_t tmp___0 ;
  size_t tmp___1 ;
  size_t tmp___2 ;
  void *tmp___3 ;
  int tmp___4 ;
  int tmp___5 ;
  int tmp___6 ;
  void *tmp___7 ;
  size_t tmp___8 ;
  size_t tmp___9 ;
  void *tmp___10 ;
  void *tmp___11 ;
  size_t tmp___12 ;
  size_t tmp___13 ;
  void *tmp___14 ;
  size_t tmp___15 ;
  size_t tmp___16 ;
  void *tmp___17 ;
  int tmp___18 ;
  int tmp___19 ;
  int tmp___20 ;
  void *tmp___21 ;
  size_t tmp___22 ;
  size_t tmp___23 ;
  void *tmp___24 ;
  void *tmp___25 ;
  size_t tmp___26 ;
  size_t tmp___27 ;
  void *tmp___28 ;
  size_t tmp___29 ;
  size_t tmp___30 ;
  void *tmp___31 ;
  int tmp___32 ;
  int tmp___33 ;
  size_t tmp___34 ;
  size_t tmp___35 ;
  void *tmp___36 ;
  void *tmp___37 ;
  size_t tmp___38 ;
  size_t tmp___39 ;
  void *tmp___40 ;
  void *tmp___41 ;
  size_t tmp___42 ;
  size_t tmp___43 ;
  void *tmp___44 ;
  size_t tmp___45 ;
  size_t tmp___46 ;
  void *tmp___47 ;
  int tmp___48 ;
  int tmp___49 ;
  int tmp___50 ;

  {
  i = 0;
  tmp = calloc((size_t )2, sizeof(char ));
  result = (char *)tmp;
  tmp___0 = strlen((char const *)expr);
  len = (int )tmp___0;
  token = getNextToken((char const *)expr, & i, len);
  while ((unsigned long )token != (unsigned long )((void *)0)) {
    switch ((int )token_type) {
    case 2:
    case 1:
    case 0:
    tmp___1 = strlen((char const *)result);
    tmp___2 = strlen((char const *)token);
    tmp___3 = realloc((void *)result, ((tmp___1 + tmp___2) + 1UL) * sizeof(char ));
    result = (char *)tmp___3;
    strcat((char * __restrict )result, (char const * __restrict )token);
    break;
    case 3:
    parameter = findParameter(token);
    j = 0;
    tmp___4 = (int )getPointerName(token);
    temp = (char *)tmp___4;
    while (j < 2 * parameter + 1) {
      symName = find_symVal(temp);
      if ((unsigned long )symName == (unsigned long )((void *)0)) {
        tmp___5 = findParameter(temp);
        tmp___6 = (int )getArrayName(temp);
        symName = findArrayRecord((char *)tmp___6, tmp___5);
      }
      temp = symName;
      j ++;
    }
    if ((unsigned long )symName != (unsigned long )((void *)0)) {
      tmp___19 = strcmp((char const *)symName, "Constant");
      if (tmp___19 == 0) {
        tmp___7 = findValBySymbolicName(symName);
        sprintf((char * __restrict )(buff), (char const * __restrict )"%d", *((int *)tmp___7));
        tmp___8 = strlen((char const *)result);
        tmp___9 = strlen((char const *)(buff));
        tmp___10 = realloc((void *)result, ((tmp___8 + tmp___9) + 1UL) * sizeof(char ));
        result = (char *)tmp___10;
        strcat((char * __restrict )result, (char const * __restrict )(buff));
      } else {
        tmp___18 = strcmp((char const *)symName, "Function");
        if (tmp___18 == 0) {
          tmp___11 = findValBySymbolicName(symName);
          sprintf((char * __restrict )(buff), (char const * __restrict )"%d",
                  *((int *)tmp___11));
          tmp___12 = strlen((char const *)result);
          tmp___13 = strlen((char const *)(buff));
          tmp___14 = realloc((void *)result, ((tmp___12 + tmp___13) + 1UL) * sizeof(char ));
          result = (char *)tmp___14;
          strcat((char * __restrict )result, (char const * __restrict )(buff));
        } else {
          tmp___15 = strlen((char const *)result);
          tmp___16 = strlen((char const *)symName);
          tmp___17 = realloc((void *)result, ((tmp___15 + tmp___16) + 1UL) * sizeof(char ));
          result = (char *)tmp___17;
          strcat((char * __restrict )result, (char const * __restrict )symName);
        }
      }
    }
    break;
    case 4:
    parameter = findParameter(token);
    tmp___20 = (int )getArrayName(token);
    symName = findArrayRecord((char *)tmp___20, parameter);
    if ((unsigned long )symName != (unsigned long )((void *)0)) {
      tmp___33 = strcmp((char const *)symName, "Constant");
      if (tmp___33 == 0) {
        tmp___21 = findValBySymbolicName(symName);
        sprintf((char * __restrict )(buff), (char const * __restrict )"%d", *((int *)tmp___21));
        tmp___22 = strlen((char const *)result);
        tmp___23 = strlen((char const *)(buff));
        tmp___24 = realloc((void *)result, ((tmp___22 + tmp___23) + 1UL) * sizeof(char ));
        result = (char *)tmp___24;
        strcat((char * __restrict )result, (char const * __restrict )(buff));
      } else {
        tmp___32 = strcmp((char const *)symName, "Function");
        if (tmp___32 == 0) {
          tmp___25 = findValBySymbolicName(symName);
          sprintf((char * __restrict )(buff), (char const * __restrict )"%d",
                  *((int *)tmp___25));
          tmp___26 = strlen((char const *)result);
          tmp___27 = strlen((char const *)(buff));
          tmp___28 = realloc((void *)result, ((tmp___26 + tmp___27) + 1UL) * sizeof(char ));
          result = (char *)tmp___28;
          strcat((char * __restrict )result, (char const * __restrict )(buff));
        } else {
          tmp___29 = strlen((char const *)result);
          tmp___30 = strlen((char const *)symName);
          tmp___31 = realloc((void *)result, ((tmp___29 + tmp___30) + 1UL) * sizeof(char ));
          result = (char *)tmp___31;
          strcat((char * __restrict )result, (char const * __restrict )symName);
        }
      }
    }
    break;
    case 5:
    tmp___50 = strcmp((char const *)token, "not");
    if (tmp___50 == 0) {
      tmp___34 = strlen((char const *)result);
      tmp___35 = strlen((char const *)token);
      tmp___36 = realloc((void *)result, ((tmp___34 + tmp___35) + 1UL) * sizeof(char ));
      result = (char *)tmp___36;
      strcat((char * __restrict )result, (char const * __restrict )token);
    } else {
      symName = find_symVal(token);
      if ((unsigned long )symName != (unsigned long )((void *)0)) {
        tmp___49 = strcmp((char const *)symName, "Constant");
        if (tmp___49 == 0) {
          tmp___37 = findValBySymbolicName(symName);
          sprintf((char * __restrict )(buff), (char const * __restrict )"%d",
                  *((int *)tmp___37));
          tmp___38 = strlen((char const *)result);
          tmp___39 = strlen((char const *)(buff));
          tmp___40 = realloc((void *)result, ((tmp___38 + tmp___39) + 1UL) * sizeof(char ));
          result = (char *)tmp___40;
          strcat((char * __restrict )result, (char const * __restrict )(buff));
        } else {
          tmp___48 = strcmp((char const *)symName, "Function");
          if (tmp___48 == 0) {
            tmp___41 = findValBySymbolicName(symName);
            sprintf((char * __restrict )(buff), (char const * __restrict )"%d",
                    *((int *)tmp___41));
            tmp___42 = strlen((char const *)result);
            tmp___43 = strlen((char const *)(buff));
            tmp___44 = realloc((void *)result, ((tmp___42 + tmp___43) + 1UL) * sizeof(char ));
            result = (char *)tmp___44;
            strcat((char * __restrict )result, (char const * __restrict )(buff));
          } else {
            tmp___45 = strlen((char const *)result);
            tmp___46 = strlen((char const *)symName);
            tmp___47 = realloc((void *)result, ((tmp___45 + tmp___46) + 1UL) * sizeof(char ));
            result = (char *)tmp___47;
            strcat((char * __restrict )result, (char const * __restrict )symName);
          }
        }
      }
    }
    break;
    }
    free((void *)token);
    token = getNextToken((char const *)(expr + i), & i, len);
  }
  strcat((char * __restrict )result, (char const * __restrict )"\000");
  return (result);
}
}
#pragma merger("0","src/src/queue.i","-g,-g")
void enQueue(void) ;
int isQueueEmpty(void) ;
int isNotQueueEmpty(void) ;
void enQueue(void)
{
  int i ;
  struct qnode *newNode___0 ;
  void *tmp ;

  {
  i = 0;
  if (CDG_Module) {
    return;
  }
  tmp = malloc(sizeof(struct qnode ));
  newNode___0 = (struct qnode *)tmp;
  newNode___0->next = (struct qnode *)((void *)0);
  i = 0;
  while (i < 50) {
    newNode___0->levelptr[i] = (struct treeNode *)((void *)0);
    i ++;
  }
  newNode___0->symbolicNames = (char *)((void *)0);
  if ((unsigned long )queue.front == (unsigned long )((void *)0)) {
    queue.front = newNode___0;
    queue.rear = newNode___0;
  } else {
    (queue.rear)->next = newNode___0;
    queue.rear = newNode___0;
  }
  (queue.totalElements) ++;
  return;
}
}
int isQueueEmpty(void)
{


  {
  if ((unsigned long )queue.front == (unsigned long )((void *)0)) {
    if ((unsigned long )queue.rear == (unsigned long )((void *)0)) {
      return (1);
    }
  }
  return (0);
}
}
int isNotQueueEmpty(void)
{
  int tmp ;

  {
  tmp = isQueueEmpty();
  if (tmp) {
    return (0);
  }
  return (1);
}
}
void deQueue(void)
{
  struct qnode *temp ;

  {
  if ((unsigned long )queue.front == (unsigned long )queue.rear) {
    temp = queue.front;
    queue.front = (struct qnode *)((void *)0);
    queue.rear = (struct qnode *)((void *)0);
  } else {
    temp = queue.front;
    queue.front = (queue.front)->next;
  }
  free((void *)temp);
  (queue.totalElements) --;
  return;
}
}
void emptyQueue(void)
{
  int tmp ;

  {
  while (1) {
    tmp = isQueueEmpty();
    if (tmp) {
      break;
    }
    deQueue();
  }
  return;
}
}
#pragma merger("0","src/src/levelTree.i","-g,-g")
int getLevel(struct treeNode *node ) ;
int getNodeOutcome(struct treeNode *node ) ;
struct treeNode *setSid(struct treeNode *node , int sid ) ;
struct treeNode *setLevel(struct treeNode *node , int level ) ;
struct treeNode *setNodeOutcome(struct treeNode *node , int outcome ) ;
struct treeNode *setFchild(struct treeNode *node , struct treeNode *child ) ;
struct treeNode *setNodeParent(struct treeNode *node , struct treeNode *parent ) ;
struct treeNode *setNextnode(struct treeNode *node , struct treeNode *nxt ) ;
struct treeNode *getFirstNodeAtLevel(int level ) ;
void setFirstNodeAtLevel(int level , struct treeNode *node ) ;
int ifFirstChild(struct treeNode *node ) ;
struct treeNode *newtreeNode(int sid , int level , char *texp , char *fexp , int outcome ) ;
void addToTree(int sid , int level , char *texp , char *fexp , int pid , int outcome ) ;
void printLevel(void) ;
struct treeNode *tree_nodes[100] = { (struct treeNode *)((void *)0)};
int getSid(struct treeNode *node )
{


  {
  return (node->sid);
}
}
int getLevel(struct treeNode *node )
{


  {
  return (node->level);
}
}
int getNodeOutcome(struct treeNode *node )
{


  {
  return (node->outcome);
}
}
struct treeNode *getFchild(struct treeNode *node )
{


  {
  return (node->fchild);
}
}
struct treeNode *getNodeParent(struct treeNode *node )
{


  {
  return (node->parent);
}
}
struct treeNode *getNextnode(struct treeNode *node )
{


  {
  return (node->next);
}
}
struct treeNode *setSid(struct treeNode *node , int sid )
{


  {
  node->sid = sid;
  return (node);
}
}
struct treeNode *setLevel(struct treeNode *node , int level )
{


  {
  node->level = level;
  return (node);
}
}
struct treeNode *setNodeOutcome(struct treeNode *node , int outcome )
{


  {
  node->outcome = outcome;
  return (node);
}
}
struct treeNode *setFchild(struct treeNode *node , struct treeNode *child )
{


  {
  node->fchild = child;
  return (node);
}
}
struct treeNode *setNodeParent(struct treeNode *node , struct treeNode *parent )
{


  {
  node->parent = parent;
  return (node);
}
}
struct treeNode *setNextnode(struct treeNode *node , struct treeNode *nxt )
{


  {
  node->next = nxt;
  return (node);
}
}
struct treeNode *getFirstNodeAtLevel(int level )
{


  {
  return ((queue.rear)->levelptr[level]);
}
}
void setFirstNodeAtLevel(int level , struct treeNode *node )
{


  {
  (queue.rear)->levelptr[level] = node;
  return;
}
}
int ifFirstChild(struct treeNode *node )
{
  struct treeNode *tmp ;
  struct treeNode *tmp___0 ;

  {
  tmp = getNodeParent(node);
  tmp___0 = getFchild(tmp);
  if ((unsigned long )tmp___0 == (unsigned long )((void *)0)) {
    return (1);
  }
  return (0);
}
}
struct treeNode *newtreeNode(int sid , int level , char *texp , char *fexp , int outcome )
{
  struct treeNode *new_treeNode ;
  void *tmp ;
  char *tep ;
  char *fep ;
  int tmp___0 ;
  int tmp___1 ;
  size_t tmp___2 ;
  void *tmp___3 ;
  size_t tmp___4 ;
  void *tmp___5 ;

  {
  tmp = malloc(sizeof(struct treeNode ));
  new_treeNode = (struct treeNode *)tmp;
  new_treeNode->sid = sid;
  new_treeNode->level = level;
  new_treeNode->outcome = outcome;
  tmp___0 = (int )getPrepositionalFormula(texp);
  tep = (char *)tmp___0;
  tmp___1 = (int )getPrepositionalFormula(fexp);
  fep = (char *)tmp___1;
  tmp___2 = strlen((char const *)tep);
  tmp___3 = malloc(sizeof(char ) * (tmp___2 + 1UL));
  new_treeNode->texp = (char *)tmp___3;
  tmp___4 = strlen((char const *)fep);
  tmp___5 = malloc(sizeof(char ) * (tmp___4 + 1UL));
  new_treeNode->fexp = (char *)tmp___5;
  strcpy((char * __restrict )new_treeNode->texp, (char const * __restrict )tep);
  strcpy((char * __restrict )new_treeNode->fexp, (char const * __restrict )fep);
  new_treeNode->fchild = (struct treeNode *)((void *)0);
  new_treeNode->parent = (struct treeNode *)((void *)0);
  new_treeNode->next = (struct treeNode *)((void *)0);
  return (new_treeNode);
}
}
void addToTree(int sid , int level , char *texp , char *fexp , int pid , int outcome )
{
  int tmp ;
  struct treeNode *new_treeNode ;
  struct treeNode *tmp___0 ;
  struct treeNode *tmp___1 ;
  struct treeNode *tmp___2 ;
  struct treeNode *tmp___3 ;
  int tmp___4 ;
  struct treeNode *tmp___5 ;

  {
  tmp = isQueueEmpty();
  if (tmp) {
    return;
  }
  tmp___0 = newtreeNode(sid, level, texp, fexp, outcome);
  new_treeNode = tmp___0;
  tmp___2 = getFirstNodeAtLevel(level);
  if ((unsigned long )tmp___2 == (unsigned long )((void *)0)) {
    setFirstNodeAtLevel(level, new_treeNode);
  } else {
    tmp___1 = getFirstNodeAtLevel(level);
    setNextnode(new_treeNode, tmp___1);
    setFirstNodeAtLevel(level, new_treeNode);
  }
  if (level > 1) {
    setNodeParent(new_treeNode, tree_nodes[pid]);
  }
  tmp___5 = getNodeParent(new_treeNode);
  if ((unsigned long )tmp___5 != (unsigned long )((void *)0)) {
    tmp___4 = ifFirstChild(new_treeNode);
    if (tmp___4) {
      tmp___3 = getNodeParent(new_treeNode);
      setFchild(tmp___3, new_treeNode);
    }
  }
  tree_nodes[sid] = new_treeNode;
  return;
}
}
void printLevel(void)
{
  int level ;
  struct treeNode *curr ;
  struct treeNode *tmp ;
  struct treeNode *tmp___0 ;
  struct treeNode *tmp___1 ;

  {
  level = 1;
  tmp = getFirstNodeAtLevel(level);
  curr = tmp;
  while ((unsigned long )curr != (unsigned long )((void *)0)) {
    printf((char const * __restrict )"condition = %d ", curr->sid);
    tmp___0 = getNodeParent(curr);
    if ((unsigned long )tmp___0 != (unsigned long )((void *)0)) {
      printf((char const * __restrict )"parent = %d ", (curr->parent)->sid);
    }
    tmp___1 = getFchild(curr);
    if ((unsigned long )tmp___1 != (unsigned long )((void *)0)) {
      printf((char const * __restrict )"child = %d \n", (curr->fchild)->sid);
    }
    curr = getNextnode(curr);
    if ((unsigned long )curr == (unsigned long )((void *)0)) {
      level ++;
      curr = getFirstNodeAtLevel(level);
      printf((char const * __restrict )"\n");
    }
  }
  return;
}
}
void clearTreeNodes(void)
{
  int i ;

  {
  i = 0;
  while (i < 100) {
    tree_nodes[i] = (struct treeNode *)((void *)0);
    i ++;
  }
  return;
}
}
#pragma merger("0","src/src/stringTokenize.i","-g,-g")
extern __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1), __leaf__)) strchr)(char const *__s ,
                                                                                               int __c ) __attribute__((__pure__)) ;
int isWhiteSpace(char const c ) ;
int isOperator(char const c ) ;
int isNotOperator(char const c ) ;
int isAlpha(char const c ) ;
int isDigitDot(char const c ) ;
int isDigit(char const c ) ;
int isWhiteSpace(char const c )
{
  int tmp ;

  {
  if ((int const )c == 0) {
    return (0);
  }
  if ((int const )c == 32) {
    tmp = 1;
  } else
  if ((int const )c == 9) {
    tmp = 1;
  } else {
    tmp = 0;
  }
  return (tmp);
}
}
int isOperator(char const c )
{
  char *tmp ;

  {
  if ((int const )c == 0) {
    return (0);
  }
  tmp = strchr("&|<>=+-/*%^!", (int )c);
  return ((unsigned long )tmp != (unsigned long )((char *)0));
}
}
int isNotOperator(char const c )
{
  char *tmp ;

  {
  if ((int const )c == 0) {
    return (0);
  }
  tmp = strchr("&|<>=+-/*%^!()", (int )c);
  return ((unsigned long )tmp != (unsigned long )((char *)0));
}
}
extern int ( toupper)() ;
int isAlpha(char const c )
{
  int tmp ;
  char *tmp___0 ;

  {
  if ((int const )c == 0) {
    return (0);
  }
  tmp = toupper((int const )c);
  tmp___0 = strchr("ABCDEFGHIJKLMNOPQRSTUVWXYZ_", tmp);
  return ((unsigned long )tmp___0 != (unsigned long )((char *)0));
}
}
int isDigitDot(char const c )
{
  char *tmp ;

  {
  if ((int const )c == 0) {
    return (0);
  }
  tmp = strchr("0123456789.", (int )c);
  return ((unsigned long )tmp != (unsigned long )((char *)0));
}
}
int isDigit(char const c )
{
  char *tmp ;

  {
  if ((int const )c == 0) {
    return (0);
  }
  tmp = strchr("0123456789", (int )c);
  return ((unsigned long )tmp != (unsigned long )((char *)0));
}
}
char *getNextToken(char const *str , int *pos , int length )
{
  int i ;
  char *res ;
  int countPars ;
  void *tmp ;
  int tmp___0 ;
  int tmp___1 ;
  int tmp___2 ;
  int tmp___3 ;
  int tmp___4 ;
  int tmp___5 ;
  int tmp___6 ;
  int tmp___7 ;
  int tmp___8 ;
  int tmp___9 ;
  int tmp___10 ;

  {
  i = 0;
  countPars = 0;
  tmp = malloc((size_t )(length + 1));
  res = (char *)tmp;
  while (1) {
    tmp___0 = isWhiteSpace(*str);
    if (! tmp___0) {
      break;
    }
    *(res + i) = (char )*str;
    str ++;
    (*pos) ++;
    i ++;
    *(res + i) = (char )'\000';
    token_type = (enum TOKENTYPE )0;
    return (res);
  }
  if ((int const )*str == 35) {
    while ((int const )*str == 35) {
      *(res + i) = (char )*str;
      str ++;
      (*pos) ++;
      i ++;
    }
    *(res + i) = (char )'\000';
    token_type = (enum TOKENTYPE )0;
    return (res);
  }
  while ((int const )*str == 10) {
    str ++;
    (*pos) ++;
  }
  if ((int const )*str == 0) {
    return ((char *)((void *)0));
  }
  if ((int const )*str == 40) {
    goto _L;
  } else
  if ((int const )*str == 41) {
    _L:
    *(res + i) = (char )*str;
    str ++;
    (*pos) ++;
    i ++;
    *(res + i) = (char )'\000';
    token_type = (enum TOKENTYPE )0;
    return (res);
  }
  if ((int const )*str == 42) {
    if ((int const )*(str + 1) == 40) {
      while (1) {
        *(res + i) = (char )*str;
        if ((int const )*str == 41) {
          countPars --;
        }
        str ++;
        if ((int const )*str == 40) {
          countPars ++;
        }
        (*pos) ++;
        i ++;
        token_type = (enum TOKENTYPE )4;
        if (countPars == 0) {
          break;
        }
      }
      *(res + i) = (char )'\000';
      return (res);
    }
  }
  if ((int const )*str == 42) {
    if ((int const )*(str + 1) != 32) {
      while ((int const )*str == 42) {
        *(res + i) = (char )*str;
        str ++;
        (*pos) ++;
        i ++;
      }
      while (1) {
        tmp___1 = isAlpha(*str);
        if (! tmp___1) {
          tmp___2 = isDigit(*str);
          if (! tmp___2) {
            break;
          }
        }
        *(res + i) = (char )*str;
        str ++;
        (*pos) ++;
        i ++;
        token_type = (enum TOKENTYPE )4;
      }
      *(res + i) = (char )'\000';
      return (res);
    }
  }
  if ((int const )*str == 37) {
    *(res + i) = (char )'m';
    i ++;
    *(res + i) = (char )'o';
    i ++;
    *(res + i) = (char )'d';
    i ++;
    *(res + i) = (char )'\000';
    str ++;
    (*pos) ++;
    token_type = (enum TOKENTYPE )1;
    return (res);
  }
  tmp___4 = isOperator(*str);
  if (tmp___4) {
    while (1) {
      tmp___3 = isOperator(*str);
      if (! tmp___3) {
        break;
      }
      *(res + i) = (char )*str;
      str ++;
      (*pos) ++;
      i ++;
      token_type = (enum TOKENTYPE )1;
    }
    *(res + i) = (char )'\000';
    return (res);
  }
  tmp___6 = isDigitDot(*str);
  if (tmp___6) {
    while (1) {
      tmp___5 = isDigitDot(*str);
      if (! tmp___5) {
        break;
      }
      *(res + i) = (char )*str;
      (*pos) ++;
      i ++;
      str ++;
      token_type = (enum TOKENTYPE )2;
    }
    *(res + i) = (char )'\000';
    return (res);
  }
  tmp___10 = isAlpha(*str);
  if (tmp___10) {
    while (1) {
      tmp___7 = isAlpha(*str);
      if (! tmp___7) {
        tmp___8 = isDigit(*str);
        if (! tmp___8) {
          break;
        }
      }
      *(res + i) = (char )*str;
      str ++;
      (*pos) ++;
      i ++;
      token_type = (enum TOKENTYPE )5;
    }
    if ((int const )*str == 40) {
      token_type = (enum TOKENTYPE )6;
      while (1) {
        tmp___9 = isWhiteSpace(*str);
        if (tmp___9) {
          break;
        }
        str ++;
        (*pos) ++;
      }
    } else
    if ((int const )*str == 91) {
      token_type = (enum TOKENTYPE )4;
      while (1) {
        *(res + i) = (char )*str;
        i ++;
        (*pos) ++;
        if ((int const )*str == 93) {
          break;
        }
        str ++;
      }
    } else {
      token_type = (enum TOKENTYPE )5;
    }
    *(res + i) = (char )'\000';
    return (res);
  }
  return ((char *)((void *)0));
}
}
char *getArrayName(char const *str )
{
  int i ;
  char *res ;
  size_t tmp ;
  void *tmp___0 ;
  int tmp___1 ;
  int tmp___2 ;

  {
  i = 0;
  tmp = strlen(str);
  tmp___0 = malloc(tmp);
  res = (char *)tmp___0;
  if ((int const )*str != 42) {
    while ((int const )*str != 91) {
      *(res + i) = (char )*str;
      str ++;
      i ++;
    }
    *(res + i) = (char )'\000';
  } else
  if ((int const )*str == 42) {
    tmp___2 = isAlpha(*(str + 1));
    if (tmp___2) {
      tmp___1 = (int )getPointerName(str);
      return ((char *)tmp___1);
    } else {
      goto _L;
    }
  } else {
    _L:
    str ++;
    str ++;
    while ((int const )*str != 32) {
      *(res + i) = (char )*str;
      str ++;
      i ++;
    }
    *(res + i) = (char )'\000';
  }
  return (res);
}
}
char *getPointerName(char const *str )
{
  int i ;
  char *res ;
  size_t tmp ;
  void *tmp___0 ;

  {
  i = 0;
  tmp = strlen(str);
  tmp___0 = malloc(tmp);
  res = (char *)tmp___0;
  while ((int const )*str == 42) {
    str ++;
  }
  while ((int const )*str != 0) {
    *(res + i) = (char )*str;
    str ++;
    i ++;
  }
  *(res + i) = (char )'\000';
  return (res);
}
}
char *getNextTokenFromConstraintSolver(char const *str , int *pos , int length )
{
  int i ;
  char *res ;
  void *tmp ;
  int tmp___0 ;
  int tmp___1 ;
  int tmp___2 ;
  int tmp___3 ;
  int tmp___4 ;
  int tmp___5 ;
  int tmp___6 ;
  int tmp___7 ;
  int tmp___8 ;

  {
  i = 0;
  tmp = malloc((size_t )(length + 1));
  res = (char *)tmp;
  if ((int const )*str == 45) {
    tmp___0 = isDigitDot(*(str + 2));
    if (tmp___0) {
      while ((int const )*str != 41) {
        *(res + i) = (char )*str;
        (*pos) ++;
        i ++;
        str ++;
        token_type = (enum TOKENTYPE )2;
      }
      *(res + i) = (char )'\000';
      return (res);
    }
  }
  while (1) {
    tmp___1 = isWhiteSpace(*str);
    if (! tmp___1) {
      if (! ((int const )*str == 10)) {
        tmp___2 = isOperator(*str);
        if (! tmp___2) {
          break;
        }
      }
    }
    str ++;
    (*pos) ++;
  }
  if ((int const )*str == 0) {
    free((void *)res);
    return ((char *)((void *)0));
  }
  if ((int const )*str == 40) {
    goto _L;
  } else
  if ((int const )*str == 41) {
    _L:
    *(res + i) = (char )*str;
    str ++;
    (*pos) ++;
    i ++;
    *(res + i) = (char )'\000';
    token_type = (enum TOKENTYPE )0;
    return (res);
  }
  tmp___4 = isDigitDot(*str);
  if (tmp___4) {
    while (1) {
      tmp___3 = isDigitDot(*str);
      if (! tmp___3) {
        break;
      }
      *(res + i) = (char )*str;
      (*pos) ++;
      i ++;
      str ++;
      token_type = (enum TOKENTYPE )2;
    }
    *(res + i) = (char )'\000';
    return (res);
  }
  tmp___8 = isAlpha(*str);
  if (tmp___8) {
    while (1) {
      tmp___5 = isAlpha(*str);
      if (! tmp___5) {
        tmp___6 = isDigit(*str);
        if (! tmp___6) {
          break;
        }
      }
      *(res + i) = (char )*str;
      str ++;
      (*pos) ++;
      i ++;
      token_type = (enum TOKENTYPE )5;
    }
    *(res + i) = (char )'\000';
    if ((int const )*str == 40) {
      token_type = (enum TOKENTYPE )6;
      while (1) {
        tmp___7 = isWhiteSpace(*str);
        if (tmp___7) {
          break;
        }
        str ++;
        (*pos) ++;
      }
    } else {
      token_type = (enum TOKENTYPE )5;
    }
    return (res);
  }
  free((void *)res);
  return ((char *)((void *)0));
}
}
int checkForAllConstants(char const *str )
{
  int tmp ;
  int tmp___0 ;
  int tmp___1 ;
  int tmp___2 ;

  {
  while ((int const )*str != 0) {
    tmp = isWhiteSpace(*str);
    if (tmp) {
      str ++;
    } else {
      tmp___0 = isOperator(*str);
      if (tmp___0) {
        str ++;
      } else {
        tmp___1 = isDigitDot(*str);
        if (tmp___1) {
          str ++;
        } else {
          tmp___2 = isDigit(*str);
          if (tmp___2) {
            str ++;
          } else
          if ((int const )*str == 40) {
            str ++;
          } else
          if ((int const )*str == 41) {
            str ++;
          } else
          if ((int const )*str == 110) {
            if ((int const )*(str + 1) == 111) {
              if ((int const )*(str + 2) == 116) {
                if ((int const )*(str + 3) == 32) {
                  str ++;
                  str ++;
                  str ++;
                } else {
                  goto _L___1;
                }
              } else {
                goto _L___1;
              }
            } else {
              goto _L___1;
            }
          } else
          _L___1:
          if ((int const )*str == 109) {
            if ((int const )*(str + 1) == 111) {
              if ((int const )*(str + 2) == 100) {
                if ((int const )*(str + 3) == 32) {
                  str ++;
                  str ++;
                  str ++;
                } else {
                  return (0);
                }
              } else {
                return (0);
              }
            } else {
              return (0);
            }
          } else {
            return (0);
          }
        }
      }
    }
  }
  return (1);
}
}
#pragma merger("0","src/src/arrayAndPointersSymbolicExec.i","-g,-g")
void add_entryToArraySTable(char *aname , int index___0 , char *sname , void *val ,
                            void *address , int type ) ;
void print_ArrayEntry(void) ;
void deleteArrayTable(void) ;
static int toInt___0(void *addr )
{


  {
  return ((int )((size_t )addr % 2147483647UL));
}
}
void add_entryToArraySTable(char *aname , int index___0 , char *sname , void *val ,
                            void *address , int type )
{
  struct arraySym_table *s ;
  int size ;
  int tmp ;
  int tmp___0 ;
  int tmp___1 ;
  void *tmp___2 ;
  unsigned int _ha_bkt ;
  void *tmp___3 ;
  void *tmp___4 ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  unsigned int _he_bkt ;
  unsigned int _he_bkt_i ;
  struct UT_hash_handle *_he_thh ;
  struct UT_hash_handle *_he_hh_nxt ;
  UT_hash_bucket *_he_new_buckets ;
  UT_hash_bucket *_he_newbkt ;
  void *tmp___5 ;
  int tmp___6 ;

  {
  s = arraySTable;
  while ((unsigned long )s != (unsigned long )((void *)0)) {
    tmp = strcmp((char const *)(s->key.arrayName), (char const *)aname);
    if (tmp == 0) {
      if (s->key.index == index___0) {
        tmp___0 = strcmp((char const *)(s->sname), "Constant");
        if (tmp___0 == 0) {
          strcpy((char * __restrict )(s->sname), (char const * __restrict )sname);
          break;
        }
      }
    }
    tmp___1 = strcmp((char const *)(s->key.arrayName), (char const *)aname);
    if (tmp___1 == 0) {
      if (s->key.index == index___0) {
        return;
      }
    }
    s = (struct arraySym_table *)s->hh.next;
  }
  if ((unsigned long )s == (unsigned long )((void *)0)) {
    tmp___2 = malloc(sizeof(struct arraySym_table ));
    s = (struct arraySym_table *)tmp___2;
    strcpy((char * __restrict )(s->key.arrayName), (char const * __restrict )aname);
    s->key.index = index___0;
    while (1) {
      s->hh.next = (void *)0;
      s->hh.key = (void *)((char *)(& s->key));
      s->hh.keylen = (unsigned int )sizeof(struct arrayKey );
      if (! arraySTable) {
        arraySTable = s;
        arraySTable->hh.prev = (void *)0;
        while (1) {
          tmp___3 = malloc(sizeof(UT_hash_table ));
          arraySTable->hh.tbl = (UT_hash_table *)tmp___3;
          if (! arraySTable->hh.tbl) {
            exit(-1);
          }
          memset((void *)arraySTable->hh.tbl, 0, sizeof(UT_hash_table ));
          (arraySTable->hh.tbl)->tail = & arraySTable->hh;
          (arraySTable->hh.tbl)->num_buckets = 32U;
          (arraySTable->hh.tbl)->log2_num_buckets = 5U;
          (arraySTable->hh.tbl)->hho = (char *)(& arraySTable->hh) - (char *)arraySTable;
          tmp___4 = malloc(32UL * sizeof(struct UT_hash_bucket ));
          (arraySTable->hh.tbl)->buckets = (UT_hash_bucket *)tmp___4;
          if (! (arraySTable->hh.tbl)->buckets) {
            exit(-1);
          }
          memset((void *)(arraySTable->hh.tbl)->buckets, 0, 32UL * sizeof(struct UT_hash_bucket ));
          (arraySTable->hh.tbl)->signature = 2685476833U;
          break;
        }
      } else {
        ((arraySTable->hh.tbl)->tail)->next = (void *)s;
        s->hh.prev = (void *)((char *)(arraySTable->hh.tbl)->tail - (arraySTable->hh.tbl)->hho);
        (arraySTable->hh.tbl)->tail = & s->hh;
      }
      ((arraySTable->hh.tbl)->num_items) ++;
      s->hh.tbl = arraySTable->hh.tbl;
      while (1) {
        _hj_key = (unsigned char *)(& s->key);
        s->hh.hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        _hj_k = (unsigned int )sizeof(struct arrayKey );
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          s->hh.hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= s->hh.hashv;
            _hj_i ^= s->hh.hashv >> 13;
            _hj_j -= s->hh.hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            s->hh.hashv -= _hj_i;
            s->hh.hashv -= _hj_j;
            s->hh.hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= s->hh.hashv;
            _hj_i ^= s->hh.hashv >> 12;
            _hj_j -= s->hh.hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            s->hh.hashv -= _hj_i;
            s->hh.hashv -= _hj_j;
            s->hh.hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= s->hh.hashv;
            _hj_i ^= s->hh.hashv >> 3;
            _hj_j -= s->hh.hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            s->hh.hashv -= _hj_i;
            s->hh.hashv -= _hj_j;
            s->hh.hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        s->hh.hashv = (unsigned int )((unsigned long )s->hh.hashv + sizeof(struct arrayKey ));
        switch (_hj_k) {
        case 11U:
        s->hh.hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        s->hh.hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        s->hh.hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= s->hh.hashv;
          _hj_i ^= s->hh.hashv >> 13;
          _hj_j -= s->hh.hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          s->hh.hashv -= _hj_i;
          s->hh.hashv -= _hj_j;
          s->hh.hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= s->hh.hashv;
          _hj_i ^= s->hh.hashv >> 12;
          _hj_j -= s->hh.hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          s->hh.hashv -= _hj_i;
          s->hh.hashv -= _hj_j;
          s->hh.hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= s->hh.hashv;
          _hj_i ^= s->hh.hashv >> 3;
          _hj_j -= s->hh.hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          s->hh.hashv -= _hj_i;
          s->hh.hashv -= _hj_j;
          s->hh.hashv ^= _hj_j >> 15;
          break;
        }
        _ha_bkt = s->hh.hashv & ((arraySTable->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        (((arraySTable->hh.tbl)->buckets + _ha_bkt)->count) ++;
        s->hh.hh_next = ((arraySTable->hh.tbl)->buckets + _ha_bkt)->hh_head;
        s->hh.hh_prev = (struct UT_hash_handle *)((void *)0);
        if (((arraySTable->hh.tbl)->buckets + _ha_bkt)->hh_head) {
          (((arraySTable->hh.tbl)->buckets + _ha_bkt)->hh_head)->hh_prev = & s->hh;
        }
        ((arraySTable->hh.tbl)->buckets + _ha_bkt)->hh_head = & s->hh;
        if (((arraySTable->hh.tbl)->buckets + _ha_bkt)->count >= (((arraySTable->hh.tbl)->buckets + _ha_bkt)->expand_mult + 1U) * 10U) {
          if ((s->hh.tbl)->noexpand != 1U) {
            while (1) {
              tmp___5 = malloc((unsigned long )(2U * (s->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
              _he_new_buckets = (UT_hash_bucket *)tmp___5;
              if (! _he_new_buckets) {
                exit(-1);
              }
              memset((void *)_he_new_buckets, 0, (unsigned long )(2U * (s->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
              if ((s->hh.tbl)->num_items & ((s->hh.tbl)->num_buckets * 2U - 1U)) {
                tmp___6 = 1;
              } else {
                tmp___6 = 0;
              }
              (s->hh.tbl)->ideal_chain_maxlen = ((s->hh.tbl)->num_items >> ((s->hh.tbl)->log2_num_buckets + 1U)) + (unsigned int )tmp___6;
              (s->hh.tbl)->nonideal_items = 0U;
              _he_bkt_i = 0U;
              while (_he_bkt_i < (s->hh.tbl)->num_buckets) {
                _he_thh = ((s->hh.tbl)->buckets + _he_bkt_i)->hh_head;
                while (_he_thh) {
                  _he_hh_nxt = _he_thh->hh_next;
                  while (1) {
                    _he_bkt = _he_thh->hashv & ((s->hh.tbl)->num_buckets * 2U - 1U);
                    break;
                  }
                  _he_newbkt = _he_new_buckets + _he_bkt;
                  (_he_newbkt->count) ++;
                  if (_he_newbkt->count > (s->hh.tbl)->ideal_chain_maxlen) {
                    ((s->hh.tbl)->nonideal_items) ++;
                    _he_newbkt->expand_mult = _he_newbkt->count / (s->hh.tbl)->ideal_chain_maxlen;
                  }
                  _he_thh->hh_prev = (struct UT_hash_handle *)((void *)0);
                  _he_thh->hh_next = _he_newbkt->hh_head;
                  if (_he_newbkt->hh_head) {
                    (_he_newbkt->hh_head)->hh_prev = _he_thh;
                  }
                  _he_newbkt->hh_head = _he_thh;
                  _he_thh = _he_hh_nxt;
                }
                _he_bkt_i ++;
              }
              free((void *)(s->hh.tbl)->buckets);
              (s->hh.tbl)->num_buckets *= 2U;
              ((s->hh.tbl)->log2_num_buckets) ++;
              (s->hh.tbl)->buckets = _he_new_buckets;
              if ((s->hh.tbl)->nonideal_items > (s->hh.tbl)->num_items >> 1) {
                ((s->hh.tbl)->ineff_expands) ++;
              } else {
                (s->hh.tbl)->ineff_expands = 0U;
              }
              if ((s->hh.tbl)->ineff_expands > 1U) {
                (s->hh.tbl)->noexpand = 1U;
              }
              break;
            }
          }
        }
        break;
      }
      break;
    }
    strcpy((char * __restrict )(s->sname), (char const * __restrict )sname);
  }
  if (type == 1) {
    size = (int )sizeof(int );
    addToIntTable(sname, (int *)val);
  } else {
    size = (int )sizeof(float );
    addToFloatTable(sname, (float *)val);
  }
  s->cval = malloc((size_t )size);
  memcpy((void * __restrict )s->cval, (void const * __restrict )val, (size_t )size);
  s->address = toInt___0(address);
  s->type = type;
  return;
}
}
char *findArrayRecord(char *aname , int index___0 )
{
  struct arraySym_table k ;
  struct arraySym_table *s ;
  int tmp ;

  {
  memset((void *)(& k), 0, sizeof(struct arraySym_table ));
  strcpy((char * __restrict )(k.key.arrayName), (char const * __restrict )aname);
  k.key.index = index___0;
  s = arraySTable;
  while ((unsigned long )s != (unsigned long )((void *)0)) {
    tmp = strcmp((char const *)(s->key.arrayName), (char const *)aname);
    if (tmp == 0) {
      if (s->key.index == index___0) {
        return (s->sname);
      }
    }
    s = (struct arraySym_table *)s->hh.next;
  }
  return ((char *)((void *)0));
}
}
void print_ArrayEntry(void)
{
  struct arraySym_table *s ;

  {
  s = arraySTable;
  while ((unsigned long )s != (unsigned long )((void *)0)) {
    printf((char const * __restrict )"variable name %s: index:%d symbolic name: %s value :%d address=%d\n",
           s->key.arrayName, s->key.index, s->sname, *((int *)s->cval), s->address);
    s = (struct arraySym_table *)s->hh.next;
  }
  return;
}
}
void deleteArrayTable(void)
{
  struct arraySym_table *p ;
  struct arraySym_table *tmp ;
  void *tmp___0 ;
  void *tmp___1 ;
  unsigned int _hd_bkt ;
  struct UT_hash_handle *_hd_hh_del ;

  {
  p = arraySTable;
  if (arraySTable) {
    tmp___0 = arraySTable->hh.next;
  } else {
    tmp___0 = (void *)0;
  }
  tmp = (struct arraySym_table *)tmp___0;
  while (p) {
    while (1) {
      if ((unsigned long )p->hh.prev == (unsigned long )((void *)0)) {
        if ((unsigned long )p->hh.next == (unsigned long )((void *)0)) {
          free((void *)(arraySTable->hh.tbl)->buckets);
          free((void *)arraySTable->hh.tbl);
          arraySTable = (struct arraySym_table *)((void *)0);
        } else {
          goto _L;
        }
      } else {
        _L:
        _hd_hh_del = & p->hh;
        if ((unsigned long )p == (unsigned long )((void *)((char *)(arraySTable->hh.tbl)->tail - (arraySTable->hh.tbl)->hho))) {
          (arraySTable->hh.tbl)->tail = (UT_hash_handle *)((ptrdiff_t )p->hh.prev + (arraySTable->hh.tbl)->hho);
        }
        if (p->hh.prev) {
          ((UT_hash_handle *)((ptrdiff_t )p->hh.prev + (arraySTable->hh.tbl)->hho))->next = p->hh.next;
        } else {
          while (1) {
            arraySTable = (struct arraySym_table *)p->hh.next;
            break;
          }
        }
        if (_hd_hh_del->next) {
          ((UT_hash_handle *)((ptrdiff_t )_hd_hh_del->next + (arraySTable->hh.tbl)->hho))->prev = _hd_hh_del->prev;
        }
        while (1) {
          _hd_bkt = _hd_hh_del->hashv & ((arraySTable->hh.tbl)->num_buckets - 1U);
          break;
        }
        (((arraySTable->hh.tbl)->buckets + _hd_bkt)->count) --;
        if ((unsigned long )((arraySTable->hh.tbl)->buckets + _hd_bkt)->hh_head == (unsigned long )_hd_hh_del) {
          ((arraySTable->hh.tbl)->buckets + _hd_bkt)->hh_head = _hd_hh_del->hh_next;
        }
        if (_hd_hh_del->hh_prev) {
          (_hd_hh_del->hh_prev)->hh_next = _hd_hh_del->hh_next;
        }
        if (_hd_hh_del->hh_next) {
          (_hd_hh_del->hh_next)->hh_prev = _hd_hh_del->hh_prev;
        }
        ((arraySTable->hh.tbl)->num_items) --;
      }
      break;
    }
    free((void *)p);
    p = tmp;
    if (tmp) {
      tmp___1 = tmp->hh.next;
    } else {
      tmp___1 = (void *)0;
    }
    tmp = (struct arraySym_table *)tmp___1;
  }
  return;
}
}
void handleArraySymbolically(char *lhs , int index___0 , char *rhs , void *val , void *address ,
                             int type )
{
  int i ;
  int len ;
  int parameter ;
  int j ;
  int value ;
  char *token ;
  char *result ;
  char *symName ;
  char *temp ;
  char buff[15] ;
  void *tmp ;
  size_t tmp___0 ;
  size_t tmp___1 ;
  size_t tmp___2 ;
  void *tmp___3 ;
  int tmp___4 ;
  int tmp___5 ;
  int tmp___6 ;
  size_t tmp___7 ;
  size_t tmp___8 ;
  void *tmp___9 ;
  int tmp___10 ;
  size_t tmp___11 ;
  size_t tmp___12 ;
  void *tmp___13 ;
  size_t tmp___14 ;
  size_t tmp___15 ;
  void *tmp___16 ;
  int tmp___17 ;
  int tmp___18 ;
  int tmp___19 ;
  int tmp___20 ;
  size_t tmp___21 ;
  size_t tmp___22 ;
  void *tmp___23 ;
  int tmp___24 ;
  size_t tmp___25 ;
  size_t tmp___26 ;
  void *tmp___27 ;
  size_t tmp___28 ;
  size_t tmp___29 ;
  void *tmp___30 ;
  int tmp___31 ;
  int tmp___32 ;
  int tmp___33 ;
  size_t tmp___34 ;
  size_t tmp___35 ;
  void *tmp___36 ;
  int tmp___37 ;
  size_t tmp___38 ;
  size_t tmp___39 ;
  void *tmp___40 ;
  size_t tmp___41 ;
  size_t tmp___42 ;
  void *tmp___43 ;
  int tmp___44 ;
  int tmp___45 ;

  {
  i = 0;
  tmp = calloc((size_t )2, sizeof(char ));
  result = (char *)tmp;
  tmp___0 = strlen((char const *)rhs);
  len = (int )tmp___0;
  token = getNextToken((char const *)rhs, & i, len);
  while ((unsigned long )token != (unsigned long )((void *)0)) {
    switch ((int )token_type) {
    case 2:
    case 1:
    case 0:
    tmp___1 = strlen((char const *)result);
    tmp___2 = strlen((char const *)token);
    tmp___3 = realloc((void *)result, ((tmp___1 + tmp___2) + 1UL) * sizeof(char ));
    result = (char *)tmp___3;
    strcat((char * __restrict )result, (char const * __restrict )token);
    break;
    case 3:
    parameter = findParameter(token);
    j = 0;
    while (j < 2 * parameter + 1) {
      symName = find_symVal(temp);
      if ((unsigned long )symName == (unsigned long )((void *)0)) {
        tmp___4 = findParameter(temp);
        tmp___5 = (int )getArrayName(temp);
        symName = findArrayRecord((char *)tmp___5, tmp___4);
      }
      temp = symName;
      j ++;
    }
    if ((unsigned long )symName != (unsigned long )((void *)0)) {
      tmp___18 = strcmp((char const *)symName, "Constant");
      if (tmp___18 == 0) {
        tmp___6 = (int )findValBySymbolicName(symName);
        value = *((int *)tmp___6);
        sprintf((char * __restrict )(buff), (char const * __restrict )"%d", value);
        tmp___7 = strlen((char const *)result);
        tmp___8 = strlen((char const *)(buff));
        tmp___9 = realloc((void *)result, ((tmp___7 + tmp___8) + 1UL) * sizeof(char ));
        result = (char *)tmp___9;
        strcat((char * __restrict )result, (char const * __restrict )(buff));
      } else {
        tmp___17 = strcmp((char const *)symName, "Function");
        if (tmp___17 == 0) {
          tmp___10 = (int )findValBySymbolicName(symName);
          sprintf((char * __restrict )(buff), (char const * __restrict )"%d",
                  *((int *)tmp___10));
          tmp___11 = strlen((char const *)result);
          tmp___12 = strlen((char const *)(buff));
          tmp___13 = realloc((void *)result, ((tmp___11 + tmp___12) + 1UL) * sizeof(char ));
          result = (char *)tmp___13;
          strcat((char * __restrict )result, (char const * __restrict )(buff));
        } else {
          tmp___14 = strlen((char const *)result);
          tmp___15 = strlen((char const *)symName);
          tmp___16 = realloc((void *)result, ((tmp___14 + tmp___15) + 1UL) * sizeof(char ));
          result = (char *)tmp___16;
          strcat((char * __restrict )result, (char const * __restrict )symName);
        }
      }
    }
    break;
    case 4:
    parameter = findParameter(token);
    tmp___19 = (int )getArrayName(token);
    symName = findArrayRecord((char *)tmp___19, parameter);
    if ((unsigned long )symName != (unsigned long )((void *)0)) {
      tmp___32 = strcmp((char const *)symName, "Constant");
      if (tmp___32 == 0) {
        tmp___20 = (int )findValBySymbolicName(symName);
        sprintf((char * __restrict )(buff), (char const * __restrict )"%d", *((int *)tmp___20));
        tmp___21 = strlen((char const *)result);
        tmp___22 = strlen((char const *)(buff));
        tmp___23 = realloc((void *)result, ((tmp___21 + tmp___22) + 1UL) * sizeof(char ));
        result = (char *)tmp___23;
        strcat((char * __restrict )result, (char const * __restrict )(buff));
      } else {
        tmp___31 = strcmp((char const *)symName, "Function");
        if (tmp___31 == 0) {
          tmp___24 = (int )findValBySymbolicName(symName);
          sprintf((char * __restrict )(buff), (char const * __restrict )"%d",
                  *((int *)tmp___24));
          tmp___25 = strlen((char const *)result);
          tmp___26 = strlen((char const *)(buff));
          tmp___27 = realloc((void *)result, ((tmp___25 + tmp___26) + 1UL) * sizeof(char ));
          result = (char *)tmp___27;
          strcat((char * __restrict )result, (char const * __restrict )(buff));
        } else {
          tmp___28 = strlen((char const *)result);
          tmp___29 = strlen((char const *)symName);
          tmp___30 = realloc((void *)result, ((tmp___28 + tmp___29) + 1UL) * sizeof(char ));
          result = (char *)tmp___30;
          strcat((char * __restrict )result, (char const * __restrict )symName);
        }
      }
    }
    break;
    case 5:
    symName = find_symVal(token);
    if ((unsigned long )symName != (unsigned long )((void *)0)) {
      tmp___45 = strcmp((char const *)symName, "Constant");
      if (tmp___45 == 0) {
        tmp___33 = (int )findValBySymbolicName(symName);
        sprintf((char * __restrict )(buff), (char const * __restrict )"%d", *((int *)tmp___33));
        tmp___34 = strlen((char const *)result);
        tmp___35 = strlen((char const *)(buff));
        tmp___36 = realloc((void *)result, ((tmp___34 + tmp___35) + 1UL) * sizeof(char ));
        result = (char *)tmp___36;
        strcat((char * __restrict )result, (char const * __restrict )(buff));
      } else {
        tmp___44 = strcmp((char const *)symName, "Function");
        if (tmp___44 == 0) {
          tmp___37 = (int )findValBySymbolicName(symName);
          sprintf((char * __restrict )(buff), (char const * __restrict )"%d",
                  *((int *)tmp___37));
          tmp___38 = strlen((char const *)result);
          tmp___39 = strlen((char const *)(buff));
          tmp___40 = realloc((void *)result, ((tmp___38 + tmp___39) + 1UL) * sizeof(char ));
          result = (char *)tmp___40;
          strcat((char * __restrict )result, (char const * __restrict )(buff));
        } else {
          tmp___41 = strlen((char const *)result);
          tmp___42 = strlen((char const *)symName);
          tmp___43 = realloc((void *)result, ((tmp___41 + tmp___42) + 1UL) * sizeof(char ));
          result = (char *)tmp___43;
          strcat((char * __restrict )result, (char const * __restrict )symName);
        }
      }
    }
    break;
    }
    token = getNextToken((char const *)(rhs + i), & i, len);
  }
  strcat((char * __restrict )result, (char const * __restrict )"\000");
  add_entryToArraySTable(lhs, index___0, result, val, address, type);
  delete_allVariableTableEntry();
  return;
}
}
#pragma merger("0","src/src/updateIntegerValues.i","-g,-g")
struct intVartable *itable = (struct intVartable *)((void *)0);
struct floatVartable *ftable = (struct floatVartable *)((void *)0);
void addToIntTable(char *sname , int *val )
{
  struct intVartable *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  size_t tmp ;
  size_t tmp___0 ;
  size_t tmp___1 ;
  int tmp___2 ;
  size_t tmp___3 ;
  void *tmp___4 ;
  size_t tmp___5 ;
  void *tmp___6 ;
  unsigned int _ha_bkt ;
  size_t tmp___7 ;
  void *tmp___8 ;
  void *tmp___9 ;
  unsigned int _hj_i___0 ;
  unsigned int _hj_j___0 ;
  unsigned int _hj_k___0 ;
  unsigned char *_hj_key___0 ;
  size_t tmp___10 ;
  size_t tmp___11 ;
  unsigned int _he_bkt ;
  unsigned int _he_bkt_i ;
  struct UT_hash_handle *_he_thh ;
  struct UT_hash_handle *_he_hh_nxt ;
  UT_hash_bucket *_he_new_buckets ;
  UT_hash_bucket *_he_newbkt ;
  void *tmp___12 ;
  int tmp___13 ;
  void *tmp___14 ;
  size_t tmp___15 ;
  void *tmp___16 ;
  unsigned int _ha_bkt___0 ;
  size_t tmp___17 ;
  void *tmp___18 ;
  void *tmp___19 ;
  unsigned int _hj_i___1 ;
  unsigned int _hj_j___1 ;
  unsigned int _hj_k___1 ;
  unsigned char *_hj_key___1 ;
  size_t tmp___20 ;
  size_t tmp___21 ;
  unsigned int _he_bkt___0 ;
  unsigned int _he_bkt_i___0 ;
  struct UT_hash_handle *_he_thh___0 ;
  struct UT_hash_handle *_he_hh_nxt___0 ;
  UT_hash_bucket *_he_new_buckets___0 ;
  UT_hash_bucket *_he_newbkt___0 ;
  void *tmp___22 ;
  int tmp___23 ;

  {
  while (1) {
    s = (struct intVartable *)((void *)0);
    if (itable) {
      while (1) {
        _hj_key = (unsigned char *)sname;
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        tmp = strlen((char const *)sname);
        _hj_k = (unsigned int )tmp;
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        tmp___0 = strlen((char const *)sname);
        _hf_hashv = (unsigned int )((size_t )_hf_hashv + tmp___0);
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((itable->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((itable->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct intVartable *)((void *)((char *)((itable->hh.tbl)->buckets + _hf_bkt)->hh_head - (itable->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct intVartable *)((void *)0);
        }
        while (s) {
          tmp___3 = strlen((char const *)sname);
          if ((size_t )s->hh.keylen == tmp___3) {
            tmp___1 = strlen((char const *)sname);
            tmp___2 = memcmp((void const *)s->hh.key, (void const *)sname, tmp___1);
            if (tmp___2 == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct intVartable *)((void *)((char *)s->hh.hh_next - (itable->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct intVartable *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  if (CDG_Module == 1) {
    if ((unsigned long )s == (unsigned long )((void *)0)) {
      tmp___4 = malloc(sizeof(struct intVartable ));
      s = (struct intVartable *)tmp___4;
      tmp___5 = strlen((char const *)sname);
      tmp___6 = malloc(sizeof(char ) * (tmp___5 + 1UL));
      s->sname = (char *)tmp___6;
      strcpy((char * __restrict )s->sname, (char const * __restrict )sname);
      while (1) {
        s->hh.next = (void *)0;
        s->hh.key = (void *)(s->sname + 0);
        tmp___7 = strlen((char const *)s->sname);
        s->hh.keylen = (unsigned int )tmp___7;
        if (! itable) {
          itable = s;
          itable->hh.prev = (void *)0;
          while (1) {
            tmp___8 = malloc(sizeof(UT_hash_table ));
            itable->hh.tbl = (UT_hash_table *)tmp___8;
            if (! itable->hh.tbl) {
              exit(-1);
            }
            memset((void *)itable->hh.tbl, 0, sizeof(UT_hash_table ));
            (itable->hh.tbl)->tail = & itable->hh;
            (itable->hh.tbl)->num_buckets = 32U;
            (itable->hh.tbl)->log2_num_buckets = 5U;
            (itable->hh.tbl)->hho = (char *)(& itable->hh) - (char *)itable;
            tmp___9 = malloc(32UL * sizeof(struct UT_hash_bucket ));
            (itable->hh.tbl)->buckets = (UT_hash_bucket *)tmp___9;
            if (! (itable->hh.tbl)->buckets) {
              exit(-1);
            }
            memset((void *)(itable->hh.tbl)->buckets, 0, 32UL * sizeof(struct UT_hash_bucket ));
            (itable->hh.tbl)->signature = 2685476833U;
            break;
          }
        } else {
          ((itable->hh.tbl)->tail)->next = (void *)s;
          s->hh.prev = (void *)((char *)(itable->hh.tbl)->tail - (itable->hh.tbl)->hho);
          (itable->hh.tbl)->tail = & s->hh;
        }
        ((itable->hh.tbl)->num_items) ++;
        s->hh.tbl = itable->hh.tbl;
        while (1) {
          _hj_key___0 = (unsigned char *)(s->sname + 0);
          s->hh.hashv = 4276993775U;
          _hj_j___0 = 2654435769U;
          _hj_i___0 = _hj_j___0;
          tmp___10 = strlen((char const *)s->sname);
          _hj_k___0 = (unsigned int )tmp___10;
          while (_hj_k___0 >= 12U) {
            _hj_i___0 += (((unsigned int )*(_hj_key___0 + 0) + ((unsigned int )*(_hj_key___0 + 1) << 8)) + ((unsigned int )*(_hj_key___0 + 2) << 16)) + ((unsigned int )*(_hj_key___0 + 3) << 24);
            _hj_j___0 += (((unsigned int )*(_hj_key___0 + 4) + ((unsigned int )*(_hj_key___0 + 5) << 8)) + ((unsigned int )*(_hj_key___0 + 6) << 16)) + ((unsigned int )*(_hj_key___0 + 7) << 24);
            s->hh.hashv += (((unsigned int )*(_hj_key___0 + 8) + ((unsigned int )*(_hj_key___0 + 9) << 8)) + ((unsigned int )*(_hj_key___0 + 10) << 16)) + ((unsigned int )*(_hj_key___0 + 11) << 24);
            while (1) {
              _hj_i___0 -= _hj_j___0;
              _hj_i___0 -= s->hh.hashv;
              _hj_i___0 ^= s->hh.hashv >> 13;
              _hj_j___0 -= s->hh.hashv;
              _hj_j___0 -= _hj_i___0;
              _hj_j___0 ^= _hj_i___0 << 8;
              s->hh.hashv -= _hj_i___0;
              s->hh.hashv -= _hj_j___0;
              s->hh.hashv ^= _hj_j___0 >> 13;
              _hj_i___0 -= _hj_j___0;
              _hj_i___0 -= s->hh.hashv;
              _hj_i___0 ^= s->hh.hashv >> 12;
              _hj_j___0 -= s->hh.hashv;
              _hj_j___0 -= _hj_i___0;
              _hj_j___0 ^= _hj_i___0 << 16;
              s->hh.hashv -= _hj_i___0;
              s->hh.hashv -= _hj_j___0;
              s->hh.hashv ^= _hj_j___0 >> 5;
              _hj_i___0 -= _hj_j___0;
              _hj_i___0 -= s->hh.hashv;
              _hj_i___0 ^= s->hh.hashv >> 3;
              _hj_j___0 -= s->hh.hashv;
              _hj_j___0 -= _hj_i___0;
              _hj_j___0 ^= _hj_i___0 << 10;
              s->hh.hashv -= _hj_i___0;
              s->hh.hashv -= _hj_j___0;
              s->hh.hashv ^= _hj_j___0 >> 15;
              break;
            }
            _hj_key___0 += 12;
            _hj_k___0 -= 12U;
          }
          tmp___11 = strlen((char const *)s->sname);
          s->hh.hashv = (unsigned int )((size_t )s->hh.hashv + tmp___11);
          switch (_hj_k___0) {
          case 11U:
          s->hh.hashv += (unsigned int )*(_hj_key___0 + 10) << 24;
          case 10U:
          s->hh.hashv += (unsigned int )*(_hj_key___0 + 9) << 16;
          case 9U:
          s->hh.hashv += (unsigned int )*(_hj_key___0 + 8) << 8;
          case 8U:
          _hj_j___0 += (unsigned int )*(_hj_key___0 + 7) << 24;
          case 7U:
          _hj_j___0 += (unsigned int )*(_hj_key___0 + 6) << 16;
          case 6U:
          _hj_j___0 += (unsigned int )*(_hj_key___0 + 5) << 8;
          case 5U:
          _hj_j___0 += (unsigned int )*(_hj_key___0 + 4);
          case 4U:
          _hj_i___0 += (unsigned int )*(_hj_key___0 + 3) << 24;
          case 3U:
          _hj_i___0 += (unsigned int )*(_hj_key___0 + 2) << 16;
          case 2U:
          _hj_i___0 += (unsigned int )*(_hj_key___0 + 1) << 8;
          case 1U:
          _hj_i___0 += (unsigned int )*(_hj_key___0 + 0);
          }
          while (1) {
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= s->hh.hashv;
            _hj_i___0 ^= s->hh.hashv >> 13;
            _hj_j___0 -= s->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 8;
            s->hh.hashv -= _hj_i___0;
            s->hh.hashv -= _hj_j___0;
            s->hh.hashv ^= _hj_j___0 >> 13;
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= s->hh.hashv;
            _hj_i___0 ^= s->hh.hashv >> 12;
            _hj_j___0 -= s->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 16;
            s->hh.hashv -= _hj_i___0;
            s->hh.hashv -= _hj_j___0;
            s->hh.hashv ^= _hj_j___0 >> 5;
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= s->hh.hashv;
            _hj_i___0 ^= s->hh.hashv >> 3;
            _hj_j___0 -= s->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 10;
            s->hh.hashv -= _hj_i___0;
            s->hh.hashv -= _hj_j___0;
            s->hh.hashv ^= _hj_j___0 >> 15;
            break;
          }
          _ha_bkt = s->hh.hashv & ((itable->hh.tbl)->num_buckets - 1U);
          break;
        }
        while (1) {
          (((itable->hh.tbl)->buckets + _ha_bkt)->count) ++;
          s->hh.hh_next = ((itable->hh.tbl)->buckets + _ha_bkt)->hh_head;
          s->hh.hh_prev = (struct UT_hash_handle *)((void *)0);
          if (((itable->hh.tbl)->buckets + _ha_bkt)->hh_head) {
            (((itable->hh.tbl)->buckets + _ha_bkt)->hh_head)->hh_prev = & s->hh;
          }
          ((itable->hh.tbl)->buckets + _ha_bkt)->hh_head = & s->hh;
          if (((itable->hh.tbl)->buckets + _ha_bkt)->count >= (((itable->hh.tbl)->buckets + _ha_bkt)->expand_mult + 1U) * 10U) {
            if ((s->hh.tbl)->noexpand != 1U) {
              while (1) {
                tmp___12 = malloc((unsigned long )(2U * (s->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
                _he_new_buckets = (UT_hash_bucket *)tmp___12;
                if (! _he_new_buckets) {
                  exit(-1);
                }
                memset((void *)_he_new_buckets, 0, (unsigned long )(2U * (s->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
                if ((s->hh.tbl)->num_items & ((s->hh.tbl)->num_buckets * 2U - 1U)) {
                  tmp___13 = 1;
                } else {
                  tmp___13 = 0;
                }
                (s->hh.tbl)->ideal_chain_maxlen = ((s->hh.tbl)->num_items >> ((s->hh.tbl)->log2_num_buckets + 1U)) + (unsigned int )tmp___13;
                (s->hh.tbl)->nonideal_items = 0U;
                _he_bkt_i = 0U;
                while (_he_bkt_i < (s->hh.tbl)->num_buckets) {
                  _he_thh = ((s->hh.tbl)->buckets + _he_bkt_i)->hh_head;
                  while (_he_thh) {
                    _he_hh_nxt = _he_thh->hh_next;
                    while (1) {
                      _he_bkt = _he_thh->hashv & ((s->hh.tbl)->num_buckets * 2U - 1U);
                      break;
                    }
                    _he_newbkt = _he_new_buckets + _he_bkt;
                    (_he_newbkt->count) ++;
                    if (_he_newbkt->count > (s->hh.tbl)->ideal_chain_maxlen) {
                      ((s->hh.tbl)->nonideal_items) ++;
                      _he_newbkt->expand_mult = _he_newbkt->count / (s->hh.tbl)->ideal_chain_maxlen;
                    }
                    _he_thh->hh_prev = (struct UT_hash_handle *)((void *)0);
                    _he_thh->hh_next = _he_newbkt->hh_head;
                    if (_he_newbkt->hh_head) {
                      (_he_newbkt->hh_head)->hh_prev = _he_thh;
                    }
                    _he_newbkt->hh_head = _he_thh;
                    _he_thh = _he_hh_nxt;
                  }
                  _he_bkt_i ++;
                }
                free((void *)(s->hh.tbl)->buckets);
                (s->hh.tbl)->num_buckets *= 2U;
                ((s->hh.tbl)->log2_num_buckets) ++;
                (s->hh.tbl)->buckets = _he_new_buckets;
                if ((s->hh.tbl)->nonideal_items > (s->hh.tbl)->num_items >> 1) {
                  ((s->hh.tbl)->ineff_expands) ++;
                } else {
                  (s->hh.tbl)->ineff_expands = 0U;
                }
                if ((s->hh.tbl)->ineff_expands > 1U) {
                  (s->hh.tbl)->noexpand = 1U;
                }
                break;
              }
            }
          }
          break;
        }
        break;
      }
      s->value = val;
    }
  } else {
    if ((unsigned long )s == (unsigned long )((void *)0)) {
      tmp___14 = malloc(sizeof(struct intVartable ));
      s = (struct intVartable *)tmp___14;
      tmp___15 = strlen((char const *)sname);
      tmp___16 = malloc(sizeof(char ) * (tmp___15 + 1UL));
      s->sname = (char *)tmp___16;
      strcpy((char * __restrict )s->sname, (char const * __restrict )sname);
      while (1) {
        s->hh.next = (void *)0;
        s->hh.key = (void *)(s->sname + 0);
        tmp___17 = strlen((char const *)s->sname);
        s->hh.keylen = (unsigned int )tmp___17;
        if (! itable) {
          itable = s;
          itable->hh.prev = (void *)0;
          while (1) {
            tmp___18 = malloc(sizeof(UT_hash_table ));
            itable->hh.tbl = (UT_hash_table *)tmp___18;
            if (! itable->hh.tbl) {
              exit(-1);
            }
            memset((void *)itable->hh.tbl, 0, sizeof(UT_hash_table ));
            (itable->hh.tbl)->tail = & itable->hh;
            (itable->hh.tbl)->num_buckets = 32U;
            (itable->hh.tbl)->log2_num_buckets = 5U;
            (itable->hh.tbl)->hho = (char *)(& itable->hh) - (char *)itable;
            tmp___19 = malloc(32UL * sizeof(struct UT_hash_bucket ));
            (itable->hh.tbl)->buckets = (UT_hash_bucket *)tmp___19;
            if (! (itable->hh.tbl)->buckets) {
              exit(-1);
            }
            memset((void *)(itable->hh.tbl)->buckets, 0, 32UL * sizeof(struct UT_hash_bucket ));
            (itable->hh.tbl)->signature = 2685476833U;
            break;
          }
        } else {
          ((itable->hh.tbl)->tail)->next = (void *)s;
          s->hh.prev = (void *)((char *)(itable->hh.tbl)->tail - (itable->hh.tbl)->hho);
          (itable->hh.tbl)->tail = & s->hh;
        }
        ((itable->hh.tbl)->num_items) ++;
        s->hh.tbl = itable->hh.tbl;
        while (1) {
          _hj_key___1 = (unsigned char *)(s->sname + 0);
          s->hh.hashv = 4276993775U;
          _hj_j___1 = 2654435769U;
          _hj_i___1 = _hj_j___1;
          tmp___20 = strlen((char const *)s->sname);
          _hj_k___1 = (unsigned int )tmp___20;
          while (_hj_k___1 >= 12U) {
            _hj_i___1 += (((unsigned int )*(_hj_key___1 + 0) + ((unsigned int )*(_hj_key___1 + 1) << 8)) + ((unsigned int )*(_hj_key___1 + 2) << 16)) + ((unsigned int )*(_hj_key___1 + 3) << 24);
            _hj_j___1 += (((unsigned int )*(_hj_key___1 + 4) + ((unsigned int )*(_hj_key___1 + 5) << 8)) + ((unsigned int )*(_hj_key___1 + 6) << 16)) + ((unsigned int )*(_hj_key___1 + 7) << 24);
            s->hh.hashv += (((unsigned int )*(_hj_key___1 + 8) + ((unsigned int )*(_hj_key___1 + 9) << 8)) + ((unsigned int )*(_hj_key___1 + 10) << 16)) + ((unsigned int )*(_hj_key___1 + 11) << 24);
            while (1) {
              _hj_i___1 -= _hj_j___1;
              _hj_i___1 -= s->hh.hashv;
              _hj_i___1 ^= s->hh.hashv >> 13;
              _hj_j___1 -= s->hh.hashv;
              _hj_j___1 -= _hj_i___1;
              _hj_j___1 ^= _hj_i___1 << 8;
              s->hh.hashv -= _hj_i___1;
              s->hh.hashv -= _hj_j___1;
              s->hh.hashv ^= _hj_j___1 >> 13;
              _hj_i___1 -= _hj_j___1;
              _hj_i___1 -= s->hh.hashv;
              _hj_i___1 ^= s->hh.hashv >> 12;
              _hj_j___1 -= s->hh.hashv;
              _hj_j___1 -= _hj_i___1;
              _hj_j___1 ^= _hj_i___1 << 16;
              s->hh.hashv -= _hj_i___1;
              s->hh.hashv -= _hj_j___1;
              s->hh.hashv ^= _hj_j___1 >> 5;
              _hj_i___1 -= _hj_j___1;
              _hj_i___1 -= s->hh.hashv;
              _hj_i___1 ^= s->hh.hashv >> 3;
              _hj_j___1 -= s->hh.hashv;
              _hj_j___1 -= _hj_i___1;
              _hj_j___1 ^= _hj_i___1 << 10;
              s->hh.hashv -= _hj_i___1;
              s->hh.hashv -= _hj_j___1;
              s->hh.hashv ^= _hj_j___1 >> 15;
              break;
            }
            _hj_key___1 += 12;
            _hj_k___1 -= 12U;
          }
          tmp___21 = strlen((char const *)s->sname);
          s->hh.hashv = (unsigned int )((size_t )s->hh.hashv + tmp___21);
          switch (_hj_k___1) {
          case 11U:
          s->hh.hashv += (unsigned int )*(_hj_key___1 + 10) << 24;
          case 10U:
          s->hh.hashv += (unsigned int )*(_hj_key___1 + 9) << 16;
          case 9U:
          s->hh.hashv += (unsigned int )*(_hj_key___1 + 8) << 8;
          case 8U:
          _hj_j___1 += (unsigned int )*(_hj_key___1 + 7) << 24;
          case 7U:
          _hj_j___1 += (unsigned int )*(_hj_key___1 + 6) << 16;
          case 6U:
          _hj_j___1 += (unsigned int )*(_hj_key___1 + 5) << 8;
          case 5U:
          _hj_j___1 += (unsigned int )*(_hj_key___1 + 4);
          case 4U:
          _hj_i___1 += (unsigned int )*(_hj_key___1 + 3) << 24;
          case 3U:
          _hj_i___1 += (unsigned int )*(_hj_key___1 + 2) << 16;
          case 2U:
          _hj_i___1 += (unsigned int )*(_hj_key___1 + 1) << 8;
          case 1U:
          _hj_i___1 += (unsigned int )*(_hj_key___1 + 0);
          }
          while (1) {
            _hj_i___1 -= _hj_j___1;
            _hj_i___1 -= s->hh.hashv;
            _hj_i___1 ^= s->hh.hashv >> 13;
            _hj_j___1 -= s->hh.hashv;
            _hj_j___1 -= _hj_i___1;
            _hj_j___1 ^= _hj_i___1 << 8;
            s->hh.hashv -= _hj_i___1;
            s->hh.hashv -= _hj_j___1;
            s->hh.hashv ^= _hj_j___1 >> 13;
            _hj_i___1 -= _hj_j___1;
            _hj_i___1 -= s->hh.hashv;
            _hj_i___1 ^= s->hh.hashv >> 12;
            _hj_j___1 -= s->hh.hashv;
            _hj_j___1 -= _hj_i___1;
            _hj_j___1 ^= _hj_i___1 << 16;
            s->hh.hashv -= _hj_i___1;
            s->hh.hashv -= _hj_j___1;
            s->hh.hashv ^= _hj_j___1 >> 5;
            _hj_i___1 -= _hj_j___1;
            _hj_i___1 -= s->hh.hashv;
            _hj_i___1 ^= s->hh.hashv >> 3;
            _hj_j___1 -= s->hh.hashv;
            _hj_j___1 -= _hj_i___1;
            _hj_j___1 ^= _hj_i___1 << 10;
            s->hh.hashv -= _hj_i___1;
            s->hh.hashv -= _hj_j___1;
            s->hh.hashv ^= _hj_j___1 >> 15;
            break;
          }
          _ha_bkt___0 = s->hh.hashv & ((itable->hh.tbl)->num_buckets - 1U);
          break;
        }
        while (1) {
          (((itable->hh.tbl)->buckets + _ha_bkt___0)->count) ++;
          s->hh.hh_next = ((itable->hh.tbl)->buckets + _ha_bkt___0)->hh_head;
          s->hh.hh_prev = (struct UT_hash_handle *)((void *)0);
          if (((itable->hh.tbl)->buckets + _ha_bkt___0)->hh_head) {
            (((itable->hh.tbl)->buckets + _ha_bkt___0)->hh_head)->hh_prev = & s->hh;
          }
          ((itable->hh.tbl)->buckets + _ha_bkt___0)->hh_head = & s->hh;
          if (((itable->hh.tbl)->buckets + _ha_bkt___0)->count >= (((itable->hh.tbl)->buckets + _ha_bkt___0)->expand_mult + 1U) * 10U) {
            if ((s->hh.tbl)->noexpand != 1U) {
              while (1) {
                tmp___22 = malloc((unsigned long )(2U * (s->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
                _he_new_buckets___0 = (UT_hash_bucket *)tmp___22;
                if (! _he_new_buckets___0) {
                  exit(-1);
                }
                memset((void *)_he_new_buckets___0, 0, (unsigned long )(2U * (s->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
                if ((s->hh.tbl)->num_items & ((s->hh.tbl)->num_buckets * 2U - 1U)) {
                  tmp___23 = 1;
                } else {
                  tmp___23 = 0;
                }
                (s->hh.tbl)->ideal_chain_maxlen = ((s->hh.tbl)->num_items >> ((s->hh.tbl)->log2_num_buckets + 1U)) + (unsigned int )tmp___23;
                (s->hh.tbl)->nonideal_items = 0U;
                _he_bkt_i___0 = 0U;
                while (_he_bkt_i___0 < (s->hh.tbl)->num_buckets) {
                  _he_thh___0 = ((s->hh.tbl)->buckets + _he_bkt_i___0)->hh_head;
                  while (_he_thh___0) {
                    _he_hh_nxt___0 = _he_thh___0->hh_next;
                    while (1) {
                      _he_bkt___0 = _he_thh___0->hashv & ((s->hh.tbl)->num_buckets * 2U - 1U);
                      break;
                    }
                    _he_newbkt___0 = _he_new_buckets___0 + _he_bkt___0;
                    (_he_newbkt___0->count) ++;
                    if (_he_newbkt___0->count > (s->hh.tbl)->ideal_chain_maxlen) {
                      ((s->hh.tbl)->nonideal_items) ++;
                      _he_newbkt___0->expand_mult = _he_newbkt___0->count / (s->hh.tbl)->ideal_chain_maxlen;
                    }
                    _he_thh___0->hh_prev = (struct UT_hash_handle *)((void *)0);
                    _he_thh___0->hh_next = _he_newbkt___0->hh_head;
                    if (_he_newbkt___0->hh_head) {
                      (_he_newbkt___0->hh_head)->hh_prev = _he_thh___0;
                    }
                    _he_newbkt___0->hh_head = _he_thh___0;
                    _he_thh___0 = _he_hh_nxt___0;
                  }
                  _he_bkt_i___0 ++;
                }
                free((void *)(s->hh.tbl)->buckets);
                (s->hh.tbl)->num_buckets *= 2U;
                ((s->hh.tbl)->log2_num_buckets) ++;
                (s->hh.tbl)->buckets = _he_new_buckets___0;
                if ((s->hh.tbl)->nonideal_items > (s->hh.tbl)->num_items >> 1) {
                  ((s->hh.tbl)->ineff_expands) ++;
                } else {
                  (s->hh.tbl)->ineff_expands = 0U;
                }
                if ((s->hh.tbl)->ineff_expands > 1U) {
                  (s->hh.tbl)->noexpand = 1U;
                }
                break;
              }
            }
          }
          break;
        }
        break;
      }
    }
    s->value = val;
  }
  return;
}
}
void addToFloatTable(char *sname , float *val )
{
  struct floatVartable *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  size_t tmp ;
  size_t tmp___0 ;
  size_t tmp___1 ;
  int tmp___2 ;
  size_t tmp___3 ;
  void *tmp___4 ;
  size_t tmp___5 ;
  void *tmp___6 ;
  unsigned int _ha_bkt ;
  size_t tmp___7 ;
  void *tmp___8 ;
  void *tmp___9 ;
  unsigned int _hj_i___0 ;
  unsigned int _hj_j___0 ;
  unsigned int _hj_k___0 ;
  unsigned char *_hj_key___0 ;
  size_t tmp___10 ;
  size_t tmp___11 ;
  unsigned int _he_bkt ;
  unsigned int _he_bkt_i ;
  struct UT_hash_handle *_he_thh ;
  struct UT_hash_handle *_he_hh_nxt ;
  UT_hash_bucket *_he_new_buckets ;
  UT_hash_bucket *_he_newbkt ;
  void *tmp___12 ;
  int tmp___13 ;

  {
  while (1) {
    s = (struct floatVartable *)((void *)0);
    if (ftable) {
      while (1) {
        _hj_key = (unsigned char *)sname;
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        tmp = strlen((char const *)sname);
        _hj_k = (unsigned int )tmp;
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        tmp___0 = strlen((char const *)sname);
        _hf_hashv = (unsigned int )((size_t )_hf_hashv + tmp___0);
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((ftable->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((ftable->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct floatVartable *)((void *)((char *)((ftable->hh.tbl)->buckets + _hf_bkt)->hh_head - (ftable->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct floatVartable *)((void *)0);
        }
        while (s) {
          tmp___3 = strlen((char const *)sname);
          if ((size_t )s->hh.keylen == tmp___3) {
            tmp___1 = strlen((char const *)sname);
            tmp___2 = memcmp((void const *)s->hh.key, (void const *)sname, tmp___1);
            if (tmp___2 == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct floatVartable *)((void *)((char *)s->hh.hh_next - (ftable->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct floatVartable *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  if ((unsigned long )s == (unsigned long )((void *)0)) {
    tmp___4 = malloc(sizeof(struct floatVartable ));
    s = (struct floatVartable *)tmp___4;
    tmp___5 = strlen((char const *)sname);
    tmp___6 = malloc(sizeof(char ) * (tmp___5 + 1UL));
    s->sname = (char *)tmp___6;
    strcpy((char * __restrict )s->sname, (char const * __restrict )sname);
    while (1) {
      s->hh.next = (void *)0;
      s->hh.key = (void *)(s->sname + 0);
      tmp___7 = strlen((char const *)s->sname);
      s->hh.keylen = (unsigned int )tmp___7;
      if (! ftable) {
        ftable = s;
        ftable->hh.prev = (void *)0;
        while (1) {
          tmp___8 = malloc(sizeof(UT_hash_table ));
          ftable->hh.tbl = (UT_hash_table *)tmp___8;
          if (! ftable->hh.tbl) {
            exit(-1);
          }
          memset((void *)ftable->hh.tbl, 0, sizeof(UT_hash_table ));
          (ftable->hh.tbl)->tail = & ftable->hh;
          (ftable->hh.tbl)->num_buckets = 32U;
          (ftable->hh.tbl)->log2_num_buckets = 5U;
          (ftable->hh.tbl)->hho = (char *)(& ftable->hh) - (char *)ftable;
          tmp___9 = malloc(32UL * sizeof(struct UT_hash_bucket ));
          (ftable->hh.tbl)->buckets = (UT_hash_bucket *)tmp___9;
          if (! (ftable->hh.tbl)->buckets) {
            exit(-1);
          }
          memset((void *)(ftable->hh.tbl)->buckets, 0, 32UL * sizeof(struct UT_hash_bucket ));
          (ftable->hh.tbl)->signature = 2685476833U;
          break;
        }
      } else {
        ((ftable->hh.tbl)->tail)->next = (void *)s;
        s->hh.prev = (void *)((char *)(ftable->hh.tbl)->tail - (ftable->hh.tbl)->hho);
        (ftable->hh.tbl)->tail = & s->hh;
      }
      ((ftable->hh.tbl)->num_items) ++;
      s->hh.tbl = ftable->hh.tbl;
      while (1) {
        _hj_key___0 = (unsigned char *)(s->sname + 0);
        s->hh.hashv = 4276993775U;
        _hj_j___0 = 2654435769U;
        _hj_i___0 = _hj_j___0;
        tmp___10 = strlen((char const *)s->sname);
        _hj_k___0 = (unsigned int )tmp___10;
        while (_hj_k___0 >= 12U) {
          _hj_i___0 += (((unsigned int )*(_hj_key___0 + 0) + ((unsigned int )*(_hj_key___0 + 1) << 8)) + ((unsigned int )*(_hj_key___0 + 2) << 16)) + ((unsigned int )*(_hj_key___0 + 3) << 24);
          _hj_j___0 += (((unsigned int )*(_hj_key___0 + 4) + ((unsigned int )*(_hj_key___0 + 5) << 8)) + ((unsigned int )*(_hj_key___0 + 6) << 16)) + ((unsigned int )*(_hj_key___0 + 7) << 24);
          s->hh.hashv += (((unsigned int )*(_hj_key___0 + 8) + ((unsigned int )*(_hj_key___0 + 9) << 8)) + ((unsigned int )*(_hj_key___0 + 10) << 16)) + ((unsigned int )*(_hj_key___0 + 11) << 24);
          while (1) {
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= s->hh.hashv;
            _hj_i___0 ^= s->hh.hashv >> 13;
            _hj_j___0 -= s->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 8;
            s->hh.hashv -= _hj_i___0;
            s->hh.hashv -= _hj_j___0;
            s->hh.hashv ^= _hj_j___0 >> 13;
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= s->hh.hashv;
            _hj_i___0 ^= s->hh.hashv >> 12;
            _hj_j___0 -= s->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 16;
            s->hh.hashv -= _hj_i___0;
            s->hh.hashv -= _hj_j___0;
            s->hh.hashv ^= _hj_j___0 >> 5;
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= s->hh.hashv;
            _hj_i___0 ^= s->hh.hashv >> 3;
            _hj_j___0 -= s->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 10;
            s->hh.hashv -= _hj_i___0;
            s->hh.hashv -= _hj_j___0;
            s->hh.hashv ^= _hj_j___0 >> 15;
            break;
          }
          _hj_key___0 += 12;
          _hj_k___0 -= 12U;
        }
        tmp___11 = strlen((char const *)s->sname);
        s->hh.hashv = (unsigned int )((size_t )s->hh.hashv + tmp___11);
        switch (_hj_k___0) {
        case 11U:
        s->hh.hashv += (unsigned int )*(_hj_key___0 + 10) << 24;
        case 10U:
        s->hh.hashv += (unsigned int )*(_hj_key___0 + 9) << 16;
        case 9U:
        s->hh.hashv += (unsigned int )*(_hj_key___0 + 8) << 8;
        case 8U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 7) << 24;
        case 7U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 6) << 16;
        case 6U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 5) << 8;
        case 5U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 4);
        case 4U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 3) << 24;
        case 3U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 2) << 16;
        case 2U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 1) << 8;
        case 1U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 0);
        }
        while (1) {
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= s->hh.hashv;
          _hj_i___0 ^= s->hh.hashv >> 13;
          _hj_j___0 -= s->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 8;
          s->hh.hashv -= _hj_i___0;
          s->hh.hashv -= _hj_j___0;
          s->hh.hashv ^= _hj_j___0 >> 13;
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= s->hh.hashv;
          _hj_i___0 ^= s->hh.hashv >> 12;
          _hj_j___0 -= s->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 16;
          s->hh.hashv -= _hj_i___0;
          s->hh.hashv -= _hj_j___0;
          s->hh.hashv ^= _hj_j___0 >> 5;
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= s->hh.hashv;
          _hj_i___0 ^= s->hh.hashv >> 3;
          _hj_j___0 -= s->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 10;
          s->hh.hashv -= _hj_i___0;
          s->hh.hashv -= _hj_j___0;
          s->hh.hashv ^= _hj_j___0 >> 15;
          break;
        }
        _ha_bkt = s->hh.hashv & ((ftable->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        (((ftable->hh.tbl)->buckets + _ha_bkt)->count) ++;
        s->hh.hh_next = ((ftable->hh.tbl)->buckets + _ha_bkt)->hh_head;
        s->hh.hh_prev = (struct UT_hash_handle *)((void *)0);
        if (((ftable->hh.tbl)->buckets + _ha_bkt)->hh_head) {
          (((ftable->hh.tbl)->buckets + _ha_bkt)->hh_head)->hh_prev = & s->hh;
        }
        ((ftable->hh.tbl)->buckets + _ha_bkt)->hh_head = & s->hh;
        if (((ftable->hh.tbl)->buckets + _ha_bkt)->count >= (((ftable->hh.tbl)->buckets + _ha_bkt)->expand_mult + 1U) * 10U) {
          if ((s->hh.tbl)->noexpand != 1U) {
            while (1) {
              tmp___12 = malloc((unsigned long )(2U * (s->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
              _he_new_buckets = (UT_hash_bucket *)tmp___12;
              if (! _he_new_buckets) {
                exit(-1);
              }
              memset((void *)_he_new_buckets, 0, (unsigned long )(2U * (s->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
              if ((s->hh.tbl)->num_items & ((s->hh.tbl)->num_buckets * 2U - 1U)) {
                tmp___13 = 1;
              } else {
                tmp___13 = 0;
              }
              (s->hh.tbl)->ideal_chain_maxlen = ((s->hh.tbl)->num_items >> ((s->hh.tbl)->log2_num_buckets + 1U)) + (unsigned int )tmp___13;
              (s->hh.tbl)->nonideal_items = 0U;
              _he_bkt_i = 0U;
              while (_he_bkt_i < (s->hh.tbl)->num_buckets) {
                _he_thh = ((s->hh.tbl)->buckets + _he_bkt_i)->hh_head;
                while (_he_thh) {
                  _he_hh_nxt = _he_thh->hh_next;
                  while (1) {
                    _he_bkt = _he_thh->hashv & ((s->hh.tbl)->num_buckets * 2U - 1U);
                    break;
                  }
                  _he_newbkt = _he_new_buckets + _he_bkt;
                  (_he_newbkt->count) ++;
                  if (_he_newbkt->count > (s->hh.tbl)->ideal_chain_maxlen) {
                    ((s->hh.tbl)->nonideal_items) ++;
                    _he_newbkt->expand_mult = _he_newbkt->count / (s->hh.tbl)->ideal_chain_maxlen;
                  }
                  _he_thh->hh_prev = (struct UT_hash_handle *)((void *)0);
                  _he_thh->hh_next = _he_newbkt->hh_head;
                  if (_he_newbkt->hh_head) {
                    (_he_newbkt->hh_head)->hh_prev = _he_thh;
                  }
                  _he_newbkt->hh_head = _he_thh;
                  _he_thh = _he_hh_nxt;
                }
                _he_bkt_i ++;
              }
              free((void *)(s->hh.tbl)->buckets);
              (s->hh.tbl)->num_buckets *= 2U;
              ((s->hh.tbl)->log2_num_buckets) ++;
              (s->hh.tbl)->buckets = _he_new_buckets;
              if ((s->hh.tbl)->nonideal_items > (s->hh.tbl)->num_items >> 1) {
                ((s->hh.tbl)->ineff_expands) ++;
              } else {
                (s->hh.tbl)->ineff_expands = 0U;
              }
              if ((s->hh.tbl)->ineff_expands > 1U) {
                (s->hh.tbl)->noexpand = 1U;
              }
              break;
            }
          }
        }
        break;
      }
      break;
    }
  }
  s->value = val;
  return;
}
}
int updateIntValBySname(char *sname , int value )
{
  struct intVartable *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  size_t tmp ;
  size_t tmp___0 ;
  size_t tmp___1 ;
  int tmp___2 ;
  size_t tmp___3 ;

  {
  while (1) {
    s = (struct intVartable *)((void *)0);
    if (itable) {
      while (1) {
        _hj_key = (unsigned char *)sname;
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        tmp = strlen((char const *)sname);
        _hj_k = (unsigned int )tmp;
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        tmp___0 = strlen((char const *)sname);
        _hf_hashv = (unsigned int )((size_t )_hf_hashv + tmp___0);
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((itable->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((itable->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct intVartable *)((void *)((char *)((itable->hh.tbl)->buckets + _hf_bkt)->hh_head - (itable->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct intVartable *)((void *)0);
        }
        while (s) {
          tmp___3 = strlen((char const *)sname);
          if ((size_t )s->hh.keylen == tmp___3) {
            tmp___1 = strlen((char const *)sname);
            tmp___2 = memcmp((void const *)s->hh.key, (void const *)sname, tmp___1);
            if (tmp___2 == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct intVartable *)((void *)((char *)s->hh.hh_next - (itable->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct intVartable *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  if ((unsigned long )s == (unsigned long )((void *)0)) {
    printf((char const * __restrict )"Its null\n");
    return (0);
  }
  *(s->value) = value;
  return (1);
}
}
int updateFloatValBySname(char *sname , float value )
{
  struct floatVartable *s ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  size_t tmp ;
  size_t tmp___0 ;
  size_t tmp___1 ;
  int tmp___2 ;
  size_t tmp___3 ;

  {
  while (1) {
    s = (struct floatVartable *)((void *)0);
    if (ftable) {
      while (1) {
        _hj_key = (unsigned char *)sname;
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        tmp = strlen((char const *)sname);
        _hj_k = (unsigned int )tmp;
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        tmp___0 = strlen((char const *)sname);
        _hf_hashv = (unsigned int )((size_t )_hf_hashv + tmp___0);
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((ftable->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((ftable->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            s = (struct floatVartable *)((void *)((char *)((ftable->hh.tbl)->buckets + _hf_bkt)->hh_head - (ftable->hh.tbl)->hho));
            break;
          }
        } else {
          s = (struct floatVartable *)((void *)0);
        }
        while (s) {
          tmp___3 = strlen((char const *)sname);
          if ((size_t )s->hh.keylen == tmp___3) {
            tmp___1 = strlen((char const *)sname);
            tmp___2 = memcmp((void const *)s->hh.key, (void const *)sname, tmp___1);
            if (tmp___2 == 0) {
              break;
            }
          }
          if (s->hh.hh_next) {
            while (1) {
              s = (struct floatVartable *)((void *)((char *)s->hh.hh_next - (ftable->hh.tbl)->hho));
              break;
            }
          } else {
            s = (struct floatVartable *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  if ((unsigned long )s == (unsigned long )((void *)0)) {
    return (0);
  }
  *(s->value) = value;
  return (1);
}
}
void deleteTableEntry(void)
{
  struct intVartable *curr ;
  struct intVartable *tmp ;
  struct floatVartable *curr1 ;
  struct floatVartable *tmp1 ;
  void *tmp___0 ;
  void *tmp___1 ;
  unsigned int _hd_bkt ;
  struct UT_hash_handle *_hd_hh_del ;
  void *tmp___2 ;
  void *tmp___3 ;
  unsigned int _hd_bkt___0 ;
  struct UT_hash_handle *_hd_hh_del___0 ;

  {
  curr = itable;
  if (itable) {
    tmp___0 = itable->hh.next;
  } else {
    tmp___0 = (void *)0;
  }
  tmp = (struct intVartable *)tmp___0;
  while (curr) {
    while (1) {
      if ((unsigned long )curr->hh.prev == (unsigned long )((void *)0)) {
        if ((unsigned long )curr->hh.next == (unsigned long )((void *)0)) {
          free((void *)(itable->hh.tbl)->buckets);
          free((void *)itable->hh.tbl);
          itable = (struct intVartable *)((void *)0);
        } else {
          goto _L;
        }
      } else {
        _L:
        _hd_hh_del = & curr->hh;
        if ((unsigned long )curr == (unsigned long )((void *)((char *)(itable->hh.tbl)->tail - (itable->hh.tbl)->hho))) {
          (itable->hh.tbl)->tail = (UT_hash_handle *)((ptrdiff_t )curr->hh.prev + (itable->hh.tbl)->hho);
        }
        if (curr->hh.prev) {
          ((UT_hash_handle *)((ptrdiff_t )curr->hh.prev + (itable->hh.tbl)->hho))->next = curr->hh.next;
        } else {
          while (1) {
            itable = (struct intVartable *)curr->hh.next;
            break;
          }
        }
        if (_hd_hh_del->next) {
          ((UT_hash_handle *)((ptrdiff_t )_hd_hh_del->next + (itable->hh.tbl)->hho))->prev = _hd_hh_del->prev;
        }
        while (1) {
          _hd_bkt = _hd_hh_del->hashv & ((itable->hh.tbl)->num_buckets - 1U);
          break;
        }
        (((itable->hh.tbl)->buckets + _hd_bkt)->count) --;
        if ((unsigned long )((itable->hh.tbl)->buckets + _hd_bkt)->hh_head == (unsigned long )_hd_hh_del) {
          ((itable->hh.tbl)->buckets + _hd_bkt)->hh_head = _hd_hh_del->hh_next;
        }
        if (_hd_hh_del->hh_prev) {
          (_hd_hh_del->hh_prev)->hh_next = _hd_hh_del->hh_next;
        }
        if (_hd_hh_del->hh_next) {
          (_hd_hh_del->hh_next)->hh_prev = _hd_hh_del->hh_prev;
        }
        ((itable->hh.tbl)->num_items) --;
      }
      break;
    }
    free((void *)curr);
    curr = tmp;
    if (tmp) {
      tmp___1 = tmp->hh.next;
    } else {
      tmp___1 = (void *)0;
    }
    tmp = (struct intVartable *)tmp___1;
  }
  curr1 = ftable;
  if (ftable) {
    tmp___2 = ftable->hh.next;
  } else {
    tmp___2 = (void *)0;
  }
  tmp1 = (struct floatVartable *)tmp___2;
  while (curr1) {
    while (1) {
      if ((unsigned long )curr1->hh.prev == (unsigned long )((void *)0)) {
        if ((unsigned long )curr1->hh.next == (unsigned long )((void *)0)) {
          free((void *)(ftable->hh.tbl)->buckets);
          free((void *)ftable->hh.tbl);
          ftable = (struct floatVartable *)((void *)0);
        } else {
          goto _L___0;
        }
      } else {
        _L___0:
        _hd_hh_del___0 = & curr1->hh;
        if ((unsigned long )curr1 == (unsigned long )((void *)((char *)(ftable->hh.tbl)->tail - (ftable->hh.tbl)->hho))) {
          (ftable->hh.tbl)->tail = (UT_hash_handle *)((ptrdiff_t )curr1->hh.prev + (ftable->hh.tbl)->hho);
        }
        if (curr1->hh.prev) {
          ((UT_hash_handle *)((ptrdiff_t )curr1->hh.prev + (ftable->hh.tbl)->hho))->next = curr1->hh.next;
        } else {
          while (1) {
            ftable = (struct floatVartable *)curr1->hh.next;
            break;
          }
        }
        if (_hd_hh_del___0->next) {
          ((UT_hash_handle *)((ptrdiff_t )_hd_hh_del___0->next + (ftable->hh.tbl)->hho))->prev = _hd_hh_del___0->prev;
        }
        while (1) {
          _hd_bkt___0 = _hd_hh_del___0->hashv & ((ftable->hh.tbl)->num_buckets - 1U);
          break;
        }
        (((ftable->hh.tbl)->buckets + _hd_bkt___0)->count) --;
        if ((unsigned long )((ftable->hh.tbl)->buckets + _hd_bkt___0)->hh_head == (unsigned long )_hd_hh_del___0) {
          ((ftable->hh.tbl)->buckets + _hd_bkt___0)->hh_head = _hd_hh_del___0->hh_next;
        }
        if (_hd_hh_del___0->hh_prev) {
          (_hd_hh_del___0->hh_prev)->hh_next = _hd_hh_del___0->hh_next;
        }
        if (_hd_hh_del___0->hh_next) {
          (_hd_hh_del___0->hh_next)->hh_prev = _hd_hh_del___0->hh_prev;
        }
        ((ftable->hh.tbl)->num_items) --;
      }
      break;
    }
    free((void *)curr1);
    curr1 = tmp1;
    if (tmp1) {
      tmp___3 = tmp1->hh.next;
    } else {
      tmp___3 = (void *)0;
    }
    tmp1 = (struct floatVartable *)tmp___3;
  }
  return;
}
}
void writeProgramSVariables(void)
{
  struct intVartable *s ;
  struct floatVartable *s1 ;
  int tmp ;
  int tmp___0 ;
  int tmp___1 ;
  int tmp___2 ;

  {
  printFile(":extrafuns (");
  s = itable;
  while ((unsigned long )s != (unsigned long )((void *)0)) {
    tmp = strcmp((char const *)s->sname, "Function");
    if (tmp == 0) {
      goto __Cont;
    } else {
      tmp___0 = strcmp((char const *)s->sname, "Constant");
      if (tmp___0 == 0) {
        goto __Cont;
      } else
      if ((int )*(s->sname + 0) == 40) {
        goto __Cont;
      }
    }
    printFile("(");
    printFile(s->sname);
    printFile(" Int)");
    __Cont:
    s = (struct intVartable *)s->hh.next;
  }
  s1 = ftable;
  while ((unsigned long )s1 != (unsigned long )((void *)0)) {
    tmp___1 = strcmp((char const *)s1->sname, "Function");
    if (tmp___1 == 0) {
      goto __Cont___0;
    } else {
      tmp___2 = strcmp((char const *)s1->sname, "Constant");
      if (tmp___2 == 0) {
        goto __Cont___0;
      } else
      if ((int )*(s1->sname + 0) == 40) {
        goto __Cont___0;
      } else
      if ((int )*(s1->sname + 0) == 45) {
        goto __Cont___0;
      }
    }
    printFile("(");
    printFile(s1->sname);
    printFile(" Real)");
    __Cont___0:
    s1 = (struct floatVartable *)s1->hh.next;
  }
  printFile(")\n");
  return;
}
}
#pragma merger("0","src/src/flatds.i","-g,-g")
extern __attribute__((__nothrow__, __noreturn__)) void ( __attribute__((__leaf__)) __assert_fail)(char const *__assertion ,
                                                                                                   char const *__file ,
                                                                                                   unsigned int __line ,
                                                                                                   char const *__function ) ;
void *load(void *addr , char *field , int t ) ;
void store(void *addr , char *lField , int t , void *value , char *sname ) ;
char *getSymName(void *addr , char *field ) ;
void setValue(char *symName , int t , void *value ) ;
void *getValue(char *symName ) ;
void UpdateSymName(char *symName , char *sname ) ;
ObjectType getObjectType(int t ) ;
static int toInt___1(void *addr )
{


  {
  return ((int )((size_t )addr % 2147483647UL));
}
}
static int getSizeByType(ObjectType type )
{
  int size ;

  {
  size = 0;
  switch ((unsigned int )type) {
  case 0U:
  size = (int )sizeof(char );
  break;
  case 1U:
  size = (int )sizeof(int );
  break;
  case 2U:
  size = (int )sizeof(float );
  break;
  case 3U:
  break;
  default:
  if ((void *)0) {
    if (! "No size for this type") {
      __assert_fail("((void *)0) && \"No size for this type\"", "src/src/flatds.c",
                    22U, "getSizeByType");
    }
  } else {
    __assert_fail("((void *)0) && \"No size for this type\"", "src/src/flatds.c",
                  22U, "getSizeByType");
  }
  break;
  }
  return (size);
}
}
static ObjectHT *newField(char *baseSymName , char *lField , ObjectType type , void *value ,
                          char *sname )
{
  ObjectHT *o ;
  void *tmp ;
  ObjectHT *objectHT ;
  ObjectHT *t ;
  char base[12] ;
  int size ;
  size_t tmp___0 ;
  void *tmp___1 ;
  size_t tmp___2 ;
  void *tmp___3 ;
  size_t tmp___4 ;
  size_t tmp___5 ;
  void *tmp___6 ;
  void *tmp___7 ;
  size_t tmp___8 ;
  void *tmp___9 ;
  size_t tmp___10 ;
  unsigned int _ha_bkt ;
  size_t tmp___11 ;
  void *tmp___12 ;
  void *tmp___13 ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  size_t tmp___14 ;
  size_t tmp___15 ;
  unsigned int _he_bkt ;
  unsigned int _he_bkt_i ;
  struct UT_hash_handle *_he_thh ;
  struct UT_hash_handle *_he_hh_nxt ;
  UT_hash_bucket *_he_new_buckets ;
  UT_hash_bucket *_he_newbkt ;
  void *tmp___16 ;
  int tmp___17 ;
  size_t tmp___18 ;
  void *tmp___19 ;

  {
  tmp = malloc(sizeof(ObjectHT ));
  o = (ObjectHT *)tmp;
  objectHT = (ObjectHT *)((void *)0);
  base[0] = (char )'b';
  base[1] = (char )'a';
  base[2] = (char )'s';
  base[3] = (char )'e';
  base[4] = (char )'S';
  base[5] = (char )'y';
  base[6] = (char )'m';
  base[7] = (char )'N';
  base[8] = (char )'a';
  base[9] = (char )'m';
  base[10] = (char )'e';
  base[11] = (char )'\000';
  switch ((unsigned int )type) {
  case 0U:
  size = (int )sizeof(char );
  o->val = malloc((size_t )size);
  memcpy((void * __restrict )o->val, (void const * __restrict )value, (size_t )size);
  break;
  case 1U:
  tmp___0 = strlen((char const *)sname);
  tmp___1 = malloc(sizeof(char ) * (tmp___0 + 1UL));
  o->symName = (char *)tmp___1;
  strcpy((char * __restrict )o->symName, (char const * __restrict )sname);
  size = (int )sizeof(int );
  o->val = malloc((size_t )size);
  memcpy((void * __restrict )o->val, (void const * __restrict )value, (size_t )size);
  addToIntTable(o->symName, (int *)value);
  break;
  case 2U:
  tmp___2 = strlen((char const *)sname);
  tmp___3 = malloc(sizeof(char ) * (tmp___2 + 1UL));
  o->symName = (char *)tmp___3;
  strcpy((char * __restrict )o->symName, (char const * __restrict )sname);
  size = (int )sizeof(float );
  o->val = malloc((size_t )size);
  memcpy((void * __restrict )o->val, (void const * __restrict )value, (size_t )size);
  addToFloatTable(o->symName, (float *)value);
  break;
  case 4U:
  case 3U:
  tmp___4 = strlen((char const *)baseSymName);
  tmp___5 = strlen((char const *)lField);
  tmp___6 = malloc(sizeof(char ) * (((tmp___4 + tmp___5) + 1UL) + 1UL));
  o->symName = (char *)tmp___6;
  strcpy((char * __restrict )o->symName, (char const * __restrict )baseSymName);
  strcat((char * __restrict )o->symName, (char const * __restrict )"_");
  strcat((char * __restrict )o->symName, (char const * __restrict )lField);
  tmp___7 = malloc(sizeof(ObjectHT ));
  t = (ObjectHT *)tmp___7;
  tmp___8 = strlen((char const *)(base));
  tmp___9 = malloc(sizeof(char ) * (tmp___8 + 1UL));
  t->field = (char *)tmp___9;
  strcpy((char * __restrict )t->field, (char const * __restrict )(base));
  tmp___10 = strlen((char const *)o->symName);
  t->val = malloc((tmp___10 + 1UL) * sizeof(char ));
  strcpy((char * __restrict )t->val, (char const * __restrict )o->symName);
  while (1) {
    t->hh.next = (void *)0;
    t->hh.key = (void *)(t->field + 0);
    tmp___11 = strlen((char const *)t->field);
    t->hh.keylen = (unsigned int )tmp___11;
    if (! objectHT) {
      objectHT = t;
      objectHT->hh.prev = (void *)0;
      while (1) {
        tmp___12 = malloc(sizeof(UT_hash_table ));
        objectHT->hh.tbl = (UT_hash_table *)tmp___12;
        if (! objectHT->hh.tbl) {
          exit(-1);
        }
        memset((void *)objectHT->hh.tbl, 0, sizeof(UT_hash_table ));
        (objectHT->hh.tbl)->tail = & objectHT->hh;
        (objectHT->hh.tbl)->num_buckets = 32U;
        (objectHT->hh.tbl)->log2_num_buckets = 5U;
        (objectHT->hh.tbl)->hho = (char *)(& objectHT->hh) - (char *)objectHT;
        tmp___13 = malloc(32UL * sizeof(struct UT_hash_bucket ));
        (objectHT->hh.tbl)->buckets = (UT_hash_bucket *)tmp___13;
        if (! (objectHT->hh.tbl)->buckets) {
          exit(-1);
        }
        memset((void *)(objectHT->hh.tbl)->buckets, 0, 32UL * sizeof(struct UT_hash_bucket ));
        (objectHT->hh.tbl)->signature = 2685476833U;
        break;
      }
    } else {
      ((objectHT->hh.tbl)->tail)->next = (void *)t;
      t->hh.prev = (void *)((char *)(objectHT->hh.tbl)->tail - (objectHT->hh.tbl)->hho);
      (objectHT->hh.tbl)->tail = & t->hh;
    }
    ((objectHT->hh.tbl)->num_items) ++;
    t->hh.tbl = objectHT->hh.tbl;
    while (1) {
      _hj_key = (unsigned char *)(t->field + 0);
      t->hh.hashv = 4276993775U;
      _hj_j = 2654435769U;
      _hj_i = _hj_j;
      tmp___14 = strlen((char const *)t->field);
      _hj_k = (unsigned int )tmp___14;
      while (_hj_k >= 12U) {
        _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
        _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
        t->hh.hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= t->hh.hashv;
          _hj_i ^= t->hh.hashv >> 13;
          _hj_j -= t->hh.hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          t->hh.hashv -= _hj_i;
          t->hh.hashv -= _hj_j;
          t->hh.hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= t->hh.hashv;
          _hj_i ^= t->hh.hashv >> 12;
          _hj_j -= t->hh.hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          t->hh.hashv -= _hj_i;
          t->hh.hashv -= _hj_j;
          t->hh.hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= t->hh.hashv;
          _hj_i ^= t->hh.hashv >> 3;
          _hj_j -= t->hh.hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          t->hh.hashv -= _hj_i;
          t->hh.hashv -= _hj_j;
          t->hh.hashv ^= _hj_j >> 15;
          break;
        }
        _hj_key += 12;
        _hj_k -= 12U;
      }
      tmp___15 = strlen((char const *)t->field);
      t->hh.hashv = (unsigned int )((size_t )t->hh.hashv + tmp___15);
      switch (_hj_k) {
      case 11U:
      t->hh.hashv += (unsigned int )*(_hj_key + 10) << 24;
      case 10U:
      t->hh.hashv += (unsigned int )*(_hj_key + 9) << 16;
      case 9U:
      t->hh.hashv += (unsigned int )*(_hj_key + 8) << 8;
      case 8U:
      _hj_j += (unsigned int )*(_hj_key + 7) << 24;
      case 7U:
      _hj_j += (unsigned int )*(_hj_key + 6) << 16;
      case 6U:
      _hj_j += (unsigned int )*(_hj_key + 5) << 8;
      case 5U:
      _hj_j += (unsigned int )*(_hj_key + 4);
      case 4U:
      _hj_i += (unsigned int )*(_hj_key + 3) << 24;
      case 3U:
      _hj_i += (unsigned int )*(_hj_key + 2) << 16;
      case 2U:
      _hj_i += (unsigned int )*(_hj_key + 1) << 8;
      case 1U:
      _hj_i += (unsigned int )*(_hj_key + 0);
      }
      while (1) {
        _hj_i -= _hj_j;
        _hj_i -= t->hh.hashv;
        _hj_i ^= t->hh.hashv >> 13;
        _hj_j -= t->hh.hashv;
        _hj_j -= _hj_i;
        _hj_j ^= _hj_i << 8;
        t->hh.hashv -= _hj_i;
        t->hh.hashv -= _hj_j;
        t->hh.hashv ^= _hj_j >> 13;
        _hj_i -= _hj_j;
        _hj_i -= t->hh.hashv;
        _hj_i ^= t->hh.hashv >> 12;
        _hj_j -= t->hh.hashv;
        _hj_j -= _hj_i;
        _hj_j ^= _hj_i << 16;
        t->hh.hashv -= _hj_i;
        t->hh.hashv -= _hj_j;
        t->hh.hashv ^= _hj_j >> 5;
        _hj_i -= _hj_j;
        _hj_i -= t->hh.hashv;
        _hj_i ^= t->hh.hashv >> 3;
        _hj_j -= t->hh.hashv;
        _hj_j -= _hj_i;
        _hj_j ^= _hj_i << 10;
        t->hh.hashv -= _hj_i;
        t->hh.hashv -= _hj_j;
        t->hh.hashv ^= _hj_j >> 15;
        break;
      }
      _ha_bkt = t->hh.hashv & ((objectHT->hh.tbl)->num_buckets - 1U);
      break;
    }
    while (1) {
      (((objectHT->hh.tbl)->buckets + _ha_bkt)->count) ++;
      t->hh.hh_next = ((objectHT->hh.tbl)->buckets + _ha_bkt)->hh_head;
      t->hh.hh_prev = (struct UT_hash_handle *)((void *)0);
      if (((objectHT->hh.tbl)->buckets + _ha_bkt)->hh_head) {
        (((objectHT->hh.tbl)->buckets + _ha_bkt)->hh_head)->hh_prev = & t->hh;
      }
      ((objectHT->hh.tbl)->buckets + _ha_bkt)->hh_head = & t->hh;
      if (((objectHT->hh.tbl)->buckets + _ha_bkt)->count >= (((objectHT->hh.tbl)->buckets + _ha_bkt)->expand_mult + 1U) * 10U) {
        if ((t->hh.tbl)->noexpand != 1U) {
          while (1) {
            tmp___16 = malloc((unsigned long )(2U * (t->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
            _he_new_buckets = (UT_hash_bucket *)tmp___16;
            if (! _he_new_buckets) {
              exit(-1);
            }
            memset((void *)_he_new_buckets, 0, (unsigned long )(2U * (t->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
            if ((t->hh.tbl)->num_items & ((t->hh.tbl)->num_buckets * 2U - 1U)) {
              tmp___17 = 1;
            } else {
              tmp___17 = 0;
            }
            (t->hh.tbl)->ideal_chain_maxlen = ((t->hh.tbl)->num_items >> ((t->hh.tbl)->log2_num_buckets + 1U)) + (unsigned int )tmp___17;
            (t->hh.tbl)->nonideal_items = 0U;
            _he_bkt_i = 0U;
            while (_he_bkt_i < (t->hh.tbl)->num_buckets) {
              _he_thh = ((t->hh.tbl)->buckets + _he_bkt_i)->hh_head;
              while (_he_thh) {
                _he_hh_nxt = _he_thh->hh_next;
                while (1) {
                  _he_bkt = _he_thh->hashv & ((t->hh.tbl)->num_buckets * 2U - 1U);
                  break;
                }
                _he_newbkt = _he_new_buckets + _he_bkt;
                (_he_newbkt->count) ++;
                if (_he_newbkt->count > (t->hh.tbl)->ideal_chain_maxlen) {
                  ((t->hh.tbl)->nonideal_items) ++;
                  _he_newbkt->expand_mult = _he_newbkt->count / (t->hh.tbl)->ideal_chain_maxlen;
                }
                _he_thh->hh_prev = (struct UT_hash_handle *)((void *)0);
                _he_thh->hh_next = _he_newbkt->hh_head;
                if (_he_newbkt->hh_head) {
                  (_he_newbkt->hh_head)->hh_prev = _he_thh;
                }
                _he_newbkt->hh_head = _he_thh;
                _he_thh = _he_hh_nxt;
              }
              _he_bkt_i ++;
            }
            free((void *)(t->hh.tbl)->buckets);
            (t->hh.tbl)->num_buckets *= 2U;
            ((t->hh.tbl)->log2_num_buckets) ++;
            (t->hh.tbl)->buckets = _he_new_buckets;
            if ((t->hh.tbl)->nonideal_items > (t->hh.tbl)->num_items >> 1) {
              ((t->hh.tbl)->ineff_expands) ++;
            } else {
              (t->hh.tbl)->ineff_expands = 0U;
            }
            if ((t->hh.tbl)->ineff_expands > 1U) {
              (t->hh.tbl)->noexpand = 1U;
            }
            break;
          }
        }
      }
      break;
    }
    break;
  }
  o->val = (void *)objectHT;
  break;
  default:
  break;
  }
  tmp___18 = strlen((char const *)lField);
  tmp___19 = malloc(sizeof(char ) * (tmp___18 + 1UL));
  o->field = (char *)tmp___19;
  strcpy((char * __restrict )o->field, (char const * __restrict )lField);
  return (o);
}
}
static void addField(ObjectHT *objectHT , char *field , ObjectType type , void *value ,
                     char *sname )
{
  char base[12] ;
  ObjectHT *t ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  size_t tmp ;
  size_t tmp___0 ;
  size_t tmp___1 ;
  int tmp___2 ;
  size_t tmp___3 ;
  ObjectHT *o ;
  ObjectHT *tmp___4 ;
  unsigned int _ha_bkt ;
  size_t tmp___5 ;
  void *tmp___6 ;
  void *tmp___7 ;
  unsigned int _hj_i___0 ;
  unsigned int _hj_j___0 ;
  unsigned int _hj_k___0 ;
  unsigned char *_hj_key___0 ;
  size_t tmp___8 ;
  size_t tmp___9 ;
  unsigned int _he_bkt ;
  unsigned int _he_bkt_i ;
  struct UT_hash_handle *_he_thh ;
  struct UT_hash_handle *_he_hh_nxt ;
  UT_hash_bucket *_he_new_buckets ;
  UT_hash_bucket *_he_newbkt ;
  void *tmp___10 ;
  int tmp___11 ;

  {
  base[0] = (char )'b';
  base[1] = (char )'a';
  base[2] = (char )'s';
  base[3] = (char )'e';
  base[4] = (char )'S';
  base[5] = (char )'y';
  base[6] = (char )'m';
  base[7] = (char )'N';
  base[8] = (char )'a';
  base[9] = (char )'m';
  base[10] = (char )'e';
  base[11] = (char )'\000';
  while (1) {
    t = (ObjectHT *)((void *)0);
    if (objectHT) {
      while (1) {
        _hj_key = (unsigned char *)(base);
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        tmp = strlen((char const *)(base));
        _hj_k = (unsigned int )tmp;
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        tmp___0 = strlen((char const *)(base));
        _hf_hashv = (unsigned int )((size_t )_hf_hashv + tmp___0);
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((objectHT->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((objectHT->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            t = (ObjectHT *)((void *)((char *)((objectHT->hh.tbl)->buckets + _hf_bkt)->hh_head - (objectHT->hh.tbl)->hho));
            break;
          }
        } else {
          t = (ObjectHT *)((void *)0);
        }
        while (t) {
          tmp___3 = strlen((char const *)(base));
          if ((size_t )t->hh.keylen == tmp___3) {
            tmp___1 = strlen((char const *)(base));
            tmp___2 = memcmp((void const *)t->hh.key, (void const *)(base), tmp___1);
            if (tmp___2 == 0) {
              break;
            }
          }
          if (t->hh.hh_next) {
            while (1) {
              t = (ObjectHT *)((void *)((char *)t->hh.hh_next - (objectHT->hh.tbl)->hho));
              break;
            }
          } else {
            t = (ObjectHT *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  tmp___4 = newField((char *)t->val, field, type, value, sname);
  o = tmp___4;
  while (1) {
    o->hh.next = (void *)0;
    o->hh.key = (void *)(o->field + 0);
    tmp___5 = strlen((char const *)o->field);
    o->hh.keylen = (unsigned int )tmp___5;
    if (! objectHT) {
      objectHT = o;
      objectHT->hh.prev = (void *)0;
      while (1) {
        tmp___6 = malloc(sizeof(UT_hash_table ));
        objectHT->hh.tbl = (UT_hash_table *)tmp___6;
        if (! objectHT->hh.tbl) {
          exit(-1);
        }
        memset((void *)objectHT->hh.tbl, 0, sizeof(UT_hash_table ));
        (objectHT->hh.tbl)->tail = & objectHT->hh;
        (objectHT->hh.tbl)->num_buckets = 32U;
        (objectHT->hh.tbl)->log2_num_buckets = 5U;
        (objectHT->hh.tbl)->hho = (char *)(& objectHT->hh) - (char *)objectHT;
        tmp___7 = malloc(32UL * sizeof(struct UT_hash_bucket ));
        (objectHT->hh.tbl)->buckets = (UT_hash_bucket *)tmp___7;
        if (! (objectHT->hh.tbl)->buckets) {
          exit(-1);
        }
        memset((void *)(objectHT->hh.tbl)->buckets, 0, 32UL * sizeof(struct UT_hash_bucket ));
        (objectHT->hh.tbl)->signature = 2685476833U;
        break;
      }
    } else {
      ((objectHT->hh.tbl)->tail)->next = (void *)o;
      o->hh.prev = (void *)((char *)(objectHT->hh.tbl)->tail - (objectHT->hh.tbl)->hho);
      (objectHT->hh.tbl)->tail = & o->hh;
    }
    ((objectHT->hh.tbl)->num_items) ++;
    o->hh.tbl = objectHT->hh.tbl;
    while (1) {
      _hj_key___0 = (unsigned char *)(o->field + 0);
      o->hh.hashv = 4276993775U;
      _hj_j___0 = 2654435769U;
      _hj_i___0 = _hj_j___0;
      tmp___8 = strlen((char const *)o->field);
      _hj_k___0 = (unsigned int )tmp___8;
      while (_hj_k___0 >= 12U) {
        _hj_i___0 += (((unsigned int )*(_hj_key___0 + 0) + ((unsigned int )*(_hj_key___0 + 1) << 8)) + ((unsigned int )*(_hj_key___0 + 2) << 16)) + ((unsigned int )*(_hj_key___0 + 3) << 24);
        _hj_j___0 += (((unsigned int )*(_hj_key___0 + 4) + ((unsigned int )*(_hj_key___0 + 5) << 8)) + ((unsigned int )*(_hj_key___0 + 6) << 16)) + ((unsigned int )*(_hj_key___0 + 7) << 24);
        o->hh.hashv += (((unsigned int )*(_hj_key___0 + 8) + ((unsigned int )*(_hj_key___0 + 9) << 8)) + ((unsigned int )*(_hj_key___0 + 10) << 16)) + ((unsigned int )*(_hj_key___0 + 11) << 24);
        while (1) {
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= o->hh.hashv;
          _hj_i___0 ^= o->hh.hashv >> 13;
          _hj_j___0 -= o->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 8;
          o->hh.hashv -= _hj_i___0;
          o->hh.hashv -= _hj_j___0;
          o->hh.hashv ^= _hj_j___0 >> 13;
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= o->hh.hashv;
          _hj_i___0 ^= o->hh.hashv >> 12;
          _hj_j___0 -= o->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 16;
          o->hh.hashv -= _hj_i___0;
          o->hh.hashv -= _hj_j___0;
          o->hh.hashv ^= _hj_j___0 >> 5;
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= o->hh.hashv;
          _hj_i___0 ^= o->hh.hashv >> 3;
          _hj_j___0 -= o->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 10;
          o->hh.hashv -= _hj_i___0;
          o->hh.hashv -= _hj_j___0;
          o->hh.hashv ^= _hj_j___0 >> 15;
          break;
        }
        _hj_key___0 += 12;
        _hj_k___0 -= 12U;
      }
      tmp___9 = strlen((char const *)o->field);
      o->hh.hashv = (unsigned int )((size_t )o->hh.hashv + tmp___9);
      switch (_hj_k___0) {
      case 11U:
      o->hh.hashv += (unsigned int )*(_hj_key___0 + 10) << 24;
      case 10U:
      o->hh.hashv += (unsigned int )*(_hj_key___0 + 9) << 16;
      case 9U:
      o->hh.hashv += (unsigned int )*(_hj_key___0 + 8) << 8;
      case 8U:
      _hj_j___0 += (unsigned int )*(_hj_key___0 + 7) << 24;
      case 7U:
      _hj_j___0 += (unsigned int )*(_hj_key___0 + 6) << 16;
      case 6U:
      _hj_j___0 += (unsigned int )*(_hj_key___0 + 5) << 8;
      case 5U:
      _hj_j___0 += (unsigned int )*(_hj_key___0 + 4);
      case 4U:
      _hj_i___0 += (unsigned int )*(_hj_key___0 + 3) << 24;
      case 3U:
      _hj_i___0 += (unsigned int )*(_hj_key___0 + 2) << 16;
      case 2U:
      _hj_i___0 += (unsigned int )*(_hj_key___0 + 1) << 8;
      case 1U:
      _hj_i___0 += (unsigned int )*(_hj_key___0 + 0);
      }
      while (1) {
        _hj_i___0 -= _hj_j___0;
        _hj_i___0 -= o->hh.hashv;
        _hj_i___0 ^= o->hh.hashv >> 13;
        _hj_j___0 -= o->hh.hashv;
        _hj_j___0 -= _hj_i___0;
        _hj_j___0 ^= _hj_i___0 << 8;
        o->hh.hashv -= _hj_i___0;
        o->hh.hashv -= _hj_j___0;
        o->hh.hashv ^= _hj_j___0 >> 13;
        _hj_i___0 -= _hj_j___0;
        _hj_i___0 -= o->hh.hashv;
        _hj_i___0 ^= o->hh.hashv >> 12;
        _hj_j___0 -= o->hh.hashv;
        _hj_j___0 -= _hj_i___0;
        _hj_j___0 ^= _hj_i___0 << 16;
        o->hh.hashv -= _hj_i___0;
        o->hh.hashv -= _hj_j___0;
        o->hh.hashv ^= _hj_j___0 >> 5;
        _hj_i___0 -= _hj_j___0;
        _hj_i___0 -= o->hh.hashv;
        _hj_i___0 ^= o->hh.hashv >> 3;
        _hj_j___0 -= o->hh.hashv;
        _hj_j___0 -= _hj_i___0;
        _hj_j___0 ^= _hj_i___0 << 10;
        o->hh.hashv -= _hj_i___0;
        o->hh.hashv -= _hj_j___0;
        o->hh.hashv ^= _hj_j___0 >> 15;
        break;
      }
      _ha_bkt = o->hh.hashv & ((objectHT->hh.tbl)->num_buckets - 1U);
      break;
    }
    while (1) {
      (((objectHT->hh.tbl)->buckets + _ha_bkt)->count) ++;
      o->hh.hh_next = ((objectHT->hh.tbl)->buckets + _ha_bkt)->hh_head;
      o->hh.hh_prev = (struct UT_hash_handle *)((void *)0);
      if (((objectHT->hh.tbl)->buckets + _ha_bkt)->hh_head) {
        (((objectHT->hh.tbl)->buckets + _ha_bkt)->hh_head)->hh_prev = & o->hh;
      }
      ((objectHT->hh.tbl)->buckets + _ha_bkt)->hh_head = & o->hh;
      if (((objectHT->hh.tbl)->buckets + _ha_bkt)->count >= (((objectHT->hh.tbl)->buckets + _ha_bkt)->expand_mult + 1U) * 10U) {
        if ((o->hh.tbl)->noexpand != 1U) {
          while (1) {
            tmp___10 = malloc((unsigned long )(2U * (o->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
            _he_new_buckets = (UT_hash_bucket *)tmp___10;
            if (! _he_new_buckets) {
              exit(-1);
            }
            memset((void *)_he_new_buckets, 0, (unsigned long )(2U * (o->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
            if ((o->hh.tbl)->num_items & ((o->hh.tbl)->num_buckets * 2U - 1U)) {
              tmp___11 = 1;
            } else {
              tmp___11 = 0;
            }
            (o->hh.tbl)->ideal_chain_maxlen = ((o->hh.tbl)->num_items >> ((o->hh.tbl)->log2_num_buckets + 1U)) + (unsigned int )tmp___11;
            (o->hh.tbl)->nonideal_items = 0U;
            _he_bkt_i = 0U;
            while (_he_bkt_i < (o->hh.tbl)->num_buckets) {
              _he_thh = ((o->hh.tbl)->buckets + _he_bkt_i)->hh_head;
              while (_he_thh) {
                _he_hh_nxt = _he_thh->hh_next;
                while (1) {
                  _he_bkt = _he_thh->hashv & ((o->hh.tbl)->num_buckets * 2U - 1U);
                  break;
                }
                _he_newbkt = _he_new_buckets + _he_bkt;
                (_he_newbkt->count) ++;
                if (_he_newbkt->count > (o->hh.tbl)->ideal_chain_maxlen) {
                  ((o->hh.tbl)->nonideal_items) ++;
                  _he_newbkt->expand_mult = _he_newbkt->count / (o->hh.tbl)->ideal_chain_maxlen;
                }
                _he_thh->hh_prev = (struct UT_hash_handle *)((void *)0);
                _he_thh->hh_next = _he_newbkt->hh_head;
                if (_he_newbkt->hh_head) {
                  (_he_newbkt->hh_head)->hh_prev = _he_thh;
                }
                _he_newbkt->hh_head = _he_thh;
                _he_thh = _he_hh_nxt;
              }
              _he_bkt_i ++;
            }
            free((void *)(o->hh.tbl)->buckets);
            (o->hh.tbl)->num_buckets *= 2U;
            ((o->hh.tbl)->log2_num_buckets) ++;
            (o->hh.tbl)->buckets = _he_new_buckets;
            if ((o->hh.tbl)->nonideal_items > (o->hh.tbl)->num_items >> 1) {
              ((o->hh.tbl)->ineff_expands) ++;
            } else {
              (o->hh.tbl)->ineff_expands = 0U;
            }
            if ((o->hh.tbl)->ineff_expands > 1U) {
              (o->hh.tbl)->noexpand = 1U;
            }
            break;
          }
        }
      }
      break;
    }
    break;
  }
  return;
}
}
static ObjectHT *newObject(char *field , ObjectType type , void *value )
{
  ObjectHT *objectHT ;
  ObjectHT *t ;
  char baseName[12] ;
  char baseValue[12] ;
  unsigned int tmp ;
  char temp[12] ;
  void *tmp___0 ;
  size_t tmp___1 ;
  void *tmp___2 ;
  unsigned int _ha_bkt ;
  size_t tmp___3 ;
  void *tmp___4 ;
  void *tmp___5 ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  size_t tmp___6 ;
  size_t tmp___7 ;
  unsigned int _he_bkt ;
  unsigned int _he_bkt_i ;
  struct UT_hash_handle *_he_thh ;
  struct UT_hash_handle *_he_hh_nxt ;
  UT_hash_bucket *_he_new_buckets ;
  UT_hash_bucket *_he_newbkt ;
  void *tmp___8 ;
  int tmp___9 ;
  int tmp___10 ;
  size_t tmp___11 ;

  {
  objectHT = (ObjectHT *)((void *)0);
  baseName[0] = (char )'b';
  baseName[1] = (char )'a';
  baseName[2] = (char )'s';
  baseName[3] = (char )'e';
  baseName[4] = (char )'S';
  baseName[5] = (char )'y';
  baseName[6] = (char )'m';
  baseName[7] = (char )'N';
  baseName[8] = (char )'a';
  baseName[9] = (char )'m';
  baseName[10] = (char )'e';
  baseName[11] = (char )'\000';
  baseValue[0] = (char )'_';
  baseValue[1] = (char )'\000';
  tmp = 2U;
  while (! (tmp >= 12U)) {
    baseValue[tmp] = (char)0;
    tmp ++;
  }
  tmp___0 = malloc(sizeof(ObjectHT ));
  t = (ObjectHT *)tmp___0;
  tmp___1 = strlen((char const *)(baseName));
  tmp___2 = malloc(sizeof(char ) * (tmp___1 + 1UL));
  t->field = (char *)tmp___2;
  strcpy((char * __restrict )t->field, (char const * __restrict )(baseName));
  while (1) {
    t->hh.next = (void *)0;
    t->hh.key = (void *)(t->field + 0);
    tmp___3 = strlen((char const *)t->field);
    t->hh.keylen = (unsigned int )tmp___3;
    if (! objectHT) {
      objectHT = t;
      objectHT->hh.prev = (void *)0;
      while (1) {
        tmp___4 = malloc(sizeof(UT_hash_table ));
        objectHT->hh.tbl = (UT_hash_table *)tmp___4;
        if (! objectHT->hh.tbl) {
          exit(-1);
        }
        memset((void *)objectHT->hh.tbl, 0, sizeof(UT_hash_table ));
        (objectHT->hh.tbl)->tail = & objectHT->hh;
        (objectHT->hh.tbl)->num_buckets = 32U;
        (objectHT->hh.tbl)->log2_num_buckets = 5U;
        (objectHT->hh.tbl)->hho = (char *)(& objectHT->hh) - (char *)objectHT;
        tmp___5 = malloc(32UL * sizeof(struct UT_hash_bucket ));
        (objectHT->hh.tbl)->buckets = (UT_hash_bucket *)tmp___5;
        if (! (objectHT->hh.tbl)->buckets) {
          exit(-1);
        }
        memset((void *)(objectHT->hh.tbl)->buckets, 0, 32UL * sizeof(struct UT_hash_bucket ));
        (objectHT->hh.tbl)->signature = 2685476833U;
        break;
      }
    } else {
      ((objectHT->hh.tbl)->tail)->next = (void *)t;
      t->hh.prev = (void *)((char *)(objectHT->hh.tbl)->tail - (objectHT->hh.tbl)->hho);
      (objectHT->hh.tbl)->tail = & t->hh;
    }
    ((objectHT->hh.tbl)->num_items) ++;
    t->hh.tbl = objectHT->hh.tbl;
    while (1) {
      _hj_key = (unsigned char *)(t->field + 0);
      t->hh.hashv = 4276993775U;
      _hj_j = 2654435769U;
      _hj_i = _hj_j;
      tmp___6 = strlen((char const *)t->field);
      _hj_k = (unsigned int )tmp___6;
      while (_hj_k >= 12U) {
        _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
        _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
        t->hh.hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= t->hh.hashv;
          _hj_i ^= t->hh.hashv >> 13;
          _hj_j -= t->hh.hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          t->hh.hashv -= _hj_i;
          t->hh.hashv -= _hj_j;
          t->hh.hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= t->hh.hashv;
          _hj_i ^= t->hh.hashv >> 12;
          _hj_j -= t->hh.hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          t->hh.hashv -= _hj_i;
          t->hh.hashv -= _hj_j;
          t->hh.hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= t->hh.hashv;
          _hj_i ^= t->hh.hashv >> 3;
          _hj_j -= t->hh.hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          t->hh.hashv -= _hj_i;
          t->hh.hashv -= _hj_j;
          t->hh.hashv ^= _hj_j >> 15;
          break;
        }
        _hj_key += 12;
        _hj_k -= 12U;
      }
      tmp___7 = strlen((char const *)t->field);
      t->hh.hashv = (unsigned int )((size_t )t->hh.hashv + tmp___7);
      switch (_hj_k) {
      case 11U:
      t->hh.hashv += (unsigned int )*(_hj_key + 10) << 24;
      case 10U:
      t->hh.hashv += (unsigned int )*(_hj_key + 9) << 16;
      case 9U:
      t->hh.hashv += (unsigned int )*(_hj_key + 8) << 8;
      case 8U:
      _hj_j += (unsigned int )*(_hj_key + 7) << 24;
      case 7U:
      _hj_j += (unsigned int )*(_hj_key + 6) << 16;
      case 6U:
      _hj_j += (unsigned int )*(_hj_key + 5) << 8;
      case 5U:
      _hj_j += (unsigned int )*(_hj_key + 4);
      case 4U:
      _hj_i += (unsigned int )*(_hj_key + 3) << 24;
      case 3U:
      _hj_i += (unsigned int )*(_hj_key + 2) << 16;
      case 2U:
      _hj_i += (unsigned int )*(_hj_key + 1) << 8;
      case 1U:
      _hj_i += (unsigned int )*(_hj_key + 0);
      }
      while (1) {
        _hj_i -= _hj_j;
        _hj_i -= t->hh.hashv;
        _hj_i ^= t->hh.hashv >> 13;
        _hj_j -= t->hh.hashv;
        _hj_j -= _hj_i;
        _hj_j ^= _hj_i << 8;
        t->hh.hashv -= _hj_i;
        t->hh.hashv -= _hj_j;
        t->hh.hashv ^= _hj_j >> 13;
        _hj_i -= _hj_j;
        _hj_i -= t->hh.hashv;
        _hj_i ^= t->hh.hashv >> 12;
        _hj_j -= t->hh.hashv;
        _hj_j -= _hj_i;
        _hj_j ^= _hj_i << 16;
        t->hh.hashv -= _hj_i;
        t->hh.hashv -= _hj_j;
        t->hh.hashv ^= _hj_j >> 5;
        _hj_i -= _hj_j;
        _hj_i -= t->hh.hashv;
        _hj_i ^= t->hh.hashv >> 3;
        _hj_j -= t->hh.hashv;
        _hj_j -= _hj_i;
        _hj_j ^= _hj_i << 10;
        t->hh.hashv -= _hj_i;
        t->hh.hashv -= _hj_j;
        t->hh.hashv ^= _hj_j >> 15;
        break;
      }
      _ha_bkt = t->hh.hashv & ((objectHT->hh.tbl)->num_buckets - 1U);
      break;
    }
    while (1) {
      (((objectHT->hh.tbl)->buckets + _ha_bkt)->count) ++;
      t->hh.hh_next = ((objectHT->hh.tbl)->buckets + _ha_bkt)->hh_head;
      t->hh.hh_prev = (struct UT_hash_handle *)((void *)0);
      if (((objectHT->hh.tbl)->buckets + _ha_bkt)->hh_head) {
        (((objectHT->hh.tbl)->buckets + _ha_bkt)->hh_head)->hh_prev = & t->hh;
      }
      ((objectHT->hh.tbl)->buckets + _ha_bkt)->hh_head = & t->hh;
      if (((objectHT->hh.tbl)->buckets + _ha_bkt)->count >= (((objectHT->hh.tbl)->buckets + _ha_bkt)->expand_mult + 1U) * 10U) {
        if ((t->hh.tbl)->noexpand != 1U) {
          while (1) {
            tmp___8 = malloc((unsigned long )(2U * (t->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
            _he_new_buckets = (UT_hash_bucket *)tmp___8;
            if (! _he_new_buckets) {
              exit(-1);
            }
            memset((void *)_he_new_buckets, 0, (unsigned long )(2U * (t->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
            if ((t->hh.tbl)->num_items & ((t->hh.tbl)->num_buckets * 2U - 1U)) {
              tmp___9 = 1;
            } else {
              tmp___9 = 0;
            }
            (t->hh.tbl)->ideal_chain_maxlen = ((t->hh.tbl)->num_items >> ((t->hh.tbl)->log2_num_buckets + 1U)) + (unsigned int )tmp___9;
            (t->hh.tbl)->nonideal_items = 0U;
            _he_bkt_i = 0U;
            while (_he_bkt_i < (t->hh.tbl)->num_buckets) {
              _he_thh = ((t->hh.tbl)->buckets + _he_bkt_i)->hh_head;
              while (_he_thh) {
                _he_hh_nxt = _he_thh->hh_next;
                while (1) {
                  _he_bkt = _he_thh->hashv & ((t->hh.tbl)->num_buckets * 2U - 1U);
                  break;
                }
                _he_newbkt = _he_new_buckets + _he_bkt;
                (_he_newbkt->count) ++;
                if (_he_newbkt->count > (t->hh.tbl)->ideal_chain_maxlen) {
                  ((t->hh.tbl)->nonideal_items) ++;
                  _he_newbkt->expand_mult = _he_newbkt->count / (t->hh.tbl)->ideal_chain_maxlen;
                }
                _he_thh->hh_prev = (struct UT_hash_handle *)((void *)0);
                _he_thh->hh_next = _he_newbkt->hh_head;
                if (_he_newbkt->hh_head) {
                  (_he_newbkt->hh_head)->hh_prev = _he_thh;
                }
                _he_newbkt->hh_head = _he_thh;
                _he_thh = _he_hh_nxt;
              }
              _he_bkt_i ++;
            }
            free((void *)(t->hh.tbl)->buckets);
            (t->hh.tbl)->num_buckets *= 2U;
            ((t->hh.tbl)->log2_num_buckets) ++;
            (t->hh.tbl)->buckets = _he_new_buckets;
            if ((t->hh.tbl)->nonideal_items > (t->hh.tbl)->num_items >> 1) {
              ((t->hh.tbl)->ineff_expands) ++;
            } else {
              (t->hh.tbl)->ineff_expands = 0U;
            }
            if ((t->hh.tbl)->ineff_expands > 1U) {
              (t->hh.tbl)->noexpand = 1U;
            }
            break;
          }
        }
      }
      break;
    }
    break;
  }
  tmp___10 = toInt___1((void *)objectHT);
  sprintf((char * __restrict )(temp), (char const * __restrict )"%d", tmp___10);
  strcat((char * __restrict )(baseValue), (char const * __restrict )(temp));
  tmp___11 = strlen((char const *)(baseValue));
  t->val = malloc((tmp___11 + 1UL) * sizeof(char ));
  strcpy((char * __restrict )t->val, (char const * __restrict )(baseValue));
  return (objectHT);
}
}
void *load(void *addr , char *field , int t )
{
  MainHT *m ;
  ObjectHT *o ;
  ObjectType type ;
  int x ;
  int tmp ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  int tmp___0 ;
  unsigned int _hf_bkt___0 ;
  unsigned int _hf_hashv___0 ;
  unsigned int _hj_i___0 ;
  unsigned int _hj_j___0 ;
  unsigned int _hj_k___0 ;
  unsigned char *_hj_key___0 ;
  int tmp___1 ;
  unsigned int _hf_bkt___1 ;
  unsigned int _hf_hashv___1 ;
  unsigned int _hj_i___1 ;
  unsigned int _hj_j___1 ;
  unsigned int _hj_k___1 ;
  unsigned char *_hj_key___1 ;
  size_t tmp___2 ;
  size_t tmp___3 ;
  size_t tmp___4 ;
  int tmp___5 ;
  size_t tmp___6 ;

  {
  type = getObjectType(t);
  tmp = toInt___1(addr);
  x = tmp;
  while (1) {
    m = (MainHT *)((void *)0);
    if (mainHT) {
      while (1) {
        _hj_key = (unsigned char *)(& x);
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        _hj_k = (unsigned int )sizeof(int );
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        _hf_hashv = (unsigned int )((unsigned long )_hf_hashv + sizeof(int ));
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((mainHT->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((mainHT->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            m = (MainHT *)((void *)((char *)((mainHT->hh.tbl)->buckets + _hf_bkt)->hh_head - (mainHT->hh.tbl)->hho));
            break;
          }
        } else {
          m = (MainHT *)((void *)0);
        }
        while (m) {
          if ((unsigned long )m->hh.keylen == sizeof(int )) {
            tmp___0 = memcmp((void const *)m->hh.key, (void const *)(& x), sizeof(int ));
            if (tmp___0 == 0) {
              break;
            }
          }
          if (m->hh.hh_next) {
            while (1) {
              m = (MainHT *)((void *)((char *)m->hh.hh_next - (mainHT->hh.tbl)->hho));
              break;
            }
          } else {
            m = (MainHT *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  if ((unsigned long )((void *)0) == (unsigned long )m) {
    store(addr, field, (int )type, (void *)field, (char *)"");
    while (1) {
      m = (MainHT *)((void *)0);
      if (mainHT) {
        while (1) {
          _hj_key___0 = (unsigned char *)(& x);
          _hf_hashv___0 = 4276993775U;
          _hj_j___0 = 2654435769U;
          _hj_i___0 = _hj_j___0;
          _hj_k___0 = (unsigned int )sizeof(int );
          while (_hj_k___0 >= 12U) {
            _hj_i___0 += (((unsigned int )*(_hj_key___0 + 0) + ((unsigned int )*(_hj_key___0 + 1) << 8)) + ((unsigned int )*(_hj_key___0 + 2) << 16)) + ((unsigned int )*(_hj_key___0 + 3) << 24);
            _hj_j___0 += (((unsigned int )*(_hj_key___0 + 4) + ((unsigned int )*(_hj_key___0 + 5) << 8)) + ((unsigned int )*(_hj_key___0 + 6) << 16)) + ((unsigned int )*(_hj_key___0 + 7) << 24);
            _hf_hashv___0 += (((unsigned int )*(_hj_key___0 + 8) + ((unsigned int )*(_hj_key___0 + 9) << 8)) + ((unsigned int )*(_hj_key___0 + 10) << 16)) + ((unsigned int )*(_hj_key___0 + 11) << 24);
            while (1) {
              _hj_i___0 -= _hj_j___0;
              _hj_i___0 -= _hf_hashv___0;
              _hj_i___0 ^= _hf_hashv___0 >> 13;
              _hj_j___0 -= _hf_hashv___0;
              _hj_j___0 -= _hj_i___0;
              _hj_j___0 ^= _hj_i___0 << 8;
              _hf_hashv___0 -= _hj_i___0;
              _hf_hashv___0 -= _hj_j___0;
              _hf_hashv___0 ^= _hj_j___0 >> 13;
              _hj_i___0 -= _hj_j___0;
              _hj_i___0 -= _hf_hashv___0;
              _hj_i___0 ^= _hf_hashv___0 >> 12;
              _hj_j___0 -= _hf_hashv___0;
              _hj_j___0 -= _hj_i___0;
              _hj_j___0 ^= _hj_i___0 << 16;
              _hf_hashv___0 -= _hj_i___0;
              _hf_hashv___0 -= _hj_j___0;
              _hf_hashv___0 ^= _hj_j___0 >> 5;
              _hj_i___0 -= _hj_j___0;
              _hj_i___0 -= _hf_hashv___0;
              _hj_i___0 ^= _hf_hashv___0 >> 3;
              _hj_j___0 -= _hf_hashv___0;
              _hj_j___0 -= _hj_i___0;
              _hj_j___0 ^= _hj_i___0 << 10;
              _hf_hashv___0 -= _hj_i___0;
              _hf_hashv___0 -= _hj_j___0;
              _hf_hashv___0 ^= _hj_j___0 >> 15;
              break;
            }
            _hj_key___0 += 12;
            _hj_k___0 -= 12U;
          }
          _hf_hashv___0 = (unsigned int )((unsigned long )_hf_hashv___0 + sizeof(int ));
          switch (_hj_k___0) {
          case 11U:
          _hf_hashv___0 += (unsigned int )*(_hj_key___0 + 10) << 24;
          case 10U:
          _hf_hashv___0 += (unsigned int )*(_hj_key___0 + 9) << 16;
          case 9U:
          _hf_hashv___0 += (unsigned int )*(_hj_key___0 + 8) << 8;
          case 8U:
          _hj_j___0 += (unsigned int )*(_hj_key___0 + 7) << 24;
          case 7U:
          _hj_j___0 += (unsigned int )*(_hj_key___0 + 6) << 16;
          case 6U:
          _hj_j___0 += (unsigned int )*(_hj_key___0 + 5) << 8;
          case 5U:
          _hj_j___0 += (unsigned int )*(_hj_key___0 + 4);
          case 4U:
          _hj_i___0 += (unsigned int )*(_hj_key___0 + 3) << 24;
          case 3U:
          _hj_i___0 += (unsigned int )*(_hj_key___0 + 2) << 16;
          case 2U:
          _hj_i___0 += (unsigned int )*(_hj_key___0 + 1) << 8;
          case 1U:
          _hj_i___0 += (unsigned int )*(_hj_key___0 + 0);
          }
          while (1) {
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= _hf_hashv___0;
            _hj_i___0 ^= _hf_hashv___0 >> 13;
            _hj_j___0 -= _hf_hashv___0;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 8;
            _hf_hashv___0 -= _hj_i___0;
            _hf_hashv___0 -= _hj_j___0;
            _hf_hashv___0 ^= _hj_j___0 >> 13;
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= _hf_hashv___0;
            _hj_i___0 ^= _hf_hashv___0 >> 12;
            _hj_j___0 -= _hf_hashv___0;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 16;
            _hf_hashv___0 -= _hj_i___0;
            _hf_hashv___0 -= _hj_j___0;
            _hf_hashv___0 ^= _hj_j___0 >> 5;
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= _hf_hashv___0;
            _hj_i___0 ^= _hf_hashv___0 >> 3;
            _hj_j___0 -= _hf_hashv___0;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 10;
            _hf_hashv___0 -= _hj_i___0;
            _hf_hashv___0 -= _hj_j___0;
            _hf_hashv___0 ^= _hj_j___0 >> 15;
            break;
          }
          _hf_bkt___0 = _hf_hashv___0 & ((mainHT->hh.tbl)->num_buckets - 1U);
          break;
        }
        while (1) {
          if (((mainHT->hh.tbl)->buckets + _hf_bkt___0)->hh_head) {
            while (1) {
              m = (MainHT *)((void *)((char *)((mainHT->hh.tbl)->buckets + _hf_bkt___0)->hh_head - (mainHT->hh.tbl)->hho));
              break;
            }
          } else {
            m = (MainHT *)((void *)0);
          }
          while (m) {
            if ((unsigned long )m->hh.keylen == sizeof(int )) {
              tmp___1 = memcmp((void const *)m->hh.key, (void const *)(& x), sizeof(int ));
              if (tmp___1 == 0) {
                break;
              }
            }
            if (m->hh.hh_next) {
              while (1) {
                m = (MainHT *)((void *)((char *)m->hh.hh_next - (mainHT->hh.tbl)->hho));
                break;
              }
            } else {
              m = (MainHT *)((void *)0);
            }
          }
          break;
        }
      }
      break;
    }
  }
  while (1) {
    o = (ObjectHT *)((void *)0);
    if (m->val) {
      while (1) {
        _hj_key___1 = (unsigned char *)field;
        _hf_hashv___1 = 4276993775U;
        _hj_j___1 = 2654435769U;
        _hj_i___1 = _hj_j___1;
        tmp___2 = strlen((char const *)field);
        _hj_k___1 = (unsigned int )tmp___2;
        while (_hj_k___1 >= 12U) {
          _hj_i___1 += (((unsigned int )*(_hj_key___1 + 0) + ((unsigned int )*(_hj_key___1 + 1) << 8)) + ((unsigned int )*(_hj_key___1 + 2) << 16)) + ((unsigned int )*(_hj_key___1 + 3) << 24);
          _hj_j___1 += (((unsigned int )*(_hj_key___1 + 4) + ((unsigned int )*(_hj_key___1 + 5) << 8)) + ((unsigned int )*(_hj_key___1 + 6) << 16)) + ((unsigned int )*(_hj_key___1 + 7) << 24);
          _hf_hashv___1 += (((unsigned int )*(_hj_key___1 + 8) + ((unsigned int )*(_hj_key___1 + 9) << 8)) + ((unsigned int )*(_hj_key___1 + 10) << 16)) + ((unsigned int )*(_hj_key___1 + 11) << 24);
          while (1) {
            _hj_i___1 -= _hj_j___1;
            _hj_i___1 -= _hf_hashv___1;
            _hj_i___1 ^= _hf_hashv___1 >> 13;
            _hj_j___1 -= _hf_hashv___1;
            _hj_j___1 -= _hj_i___1;
            _hj_j___1 ^= _hj_i___1 << 8;
            _hf_hashv___1 -= _hj_i___1;
            _hf_hashv___1 -= _hj_j___1;
            _hf_hashv___1 ^= _hj_j___1 >> 13;
            _hj_i___1 -= _hj_j___1;
            _hj_i___1 -= _hf_hashv___1;
            _hj_i___1 ^= _hf_hashv___1 >> 12;
            _hj_j___1 -= _hf_hashv___1;
            _hj_j___1 -= _hj_i___1;
            _hj_j___1 ^= _hj_i___1 << 16;
            _hf_hashv___1 -= _hj_i___1;
            _hf_hashv___1 -= _hj_j___1;
            _hf_hashv___1 ^= _hj_j___1 >> 5;
            _hj_i___1 -= _hj_j___1;
            _hj_i___1 -= _hf_hashv___1;
            _hj_i___1 ^= _hf_hashv___1 >> 3;
            _hj_j___1 -= _hf_hashv___1;
            _hj_j___1 -= _hj_i___1;
            _hj_j___1 ^= _hj_i___1 << 10;
            _hf_hashv___1 -= _hj_i___1;
            _hf_hashv___1 -= _hj_j___1;
            _hf_hashv___1 ^= _hj_j___1 >> 15;
            break;
          }
          _hj_key___1 += 12;
          _hj_k___1 -= 12U;
        }
        tmp___3 = strlen((char const *)field);
        _hf_hashv___1 = (unsigned int )((size_t )_hf_hashv___1 + tmp___3);
        switch (_hj_k___1) {
        case 11U:
        _hf_hashv___1 += (unsigned int )*(_hj_key___1 + 10) << 24;
        case 10U:
        _hf_hashv___1 += (unsigned int )*(_hj_key___1 + 9) << 16;
        case 9U:
        _hf_hashv___1 += (unsigned int )*(_hj_key___1 + 8) << 8;
        case 8U:
        _hj_j___1 += (unsigned int )*(_hj_key___1 + 7) << 24;
        case 7U:
        _hj_j___1 += (unsigned int )*(_hj_key___1 + 6) << 16;
        case 6U:
        _hj_j___1 += (unsigned int )*(_hj_key___1 + 5) << 8;
        case 5U:
        _hj_j___1 += (unsigned int )*(_hj_key___1 + 4);
        case 4U:
        _hj_i___1 += (unsigned int )*(_hj_key___1 + 3) << 24;
        case 3U:
        _hj_i___1 += (unsigned int )*(_hj_key___1 + 2) << 16;
        case 2U:
        _hj_i___1 += (unsigned int )*(_hj_key___1 + 1) << 8;
        case 1U:
        _hj_i___1 += (unsigned int )*(_hj_key___1 + 0);
        }
        while (1) {
          _hj_i___1 -= _hj_j___1;
          _hj_i___1 -= _hf_hashv___1;
          _hj_i___1 ^= _hf_hashv___1 >> 13;
          _hj_j___1 -= _hf_hashv___1;
          _hj_j___1 -= _hj_i___1;
          _hj_j___1 ^= _hj_i___1 << 8;
          _hf_hashv___1 -= _hj_i___1;
          _hf_hashv___1 -= _hj_j___1;
          _hf_hashv___1 ^= _hj_j___1 >> 13;
          _hj_i___1 -= _hj_j___1;
          _hj_i___1 -= _hf_hashv___1;
          _hj_i___1 ^= _hf_hashv___1 >> 12;
          _hj_j___1 -= _hf_hashv___1;
          _hj_j___1 -= _hj_i___1;
          _hj_j___1 ^= _hj_i___1 << 16;
          _hf_hashv___1 -= _hj_i___1;
          _hf_hashv___1 -= _hj_j___1;
          _hf_hashv___1 ^= _hj_j___1 >> 5;
          _hj_i___1 -= _hj_j___1;
          _hj_i___1 -= _hf_hashv___1;
          _hj_i___1 ^= _hf_hashv___1 >> 3;
          _hj_j___1 -= _hf_hashv___1;
          _hj_j___1 -= _hj_i___1;
          _hj_j___1 ^= _hj_i___1 << 10;
          _hf_hashv___1 -= _hj_i___1;
          _hf_hashv___1 -= _hj_j___1;
          _hf_hashv___1 ^= _hj_j___1 >> 15;
          break;
        }
        _hf_bkt___1 = _hf_hashv___1 & (((m->val)->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if ((((m->val)->hh.tbl)->buckets + _hf_bkt___1)->hh_head) {
          while (1) {
            o = (ObjectHT *)((void *)((char *)(((m->val)->hh.tbl)->buckets + _hf_bkt___1)->hh_head - ((m->val)->hh.tbl)->hho));
            break;
          }
        } else {
          o = (ObjectHT *)((void *)0);
        }
        while (o) {
          tmp___6 = strlen((char const *)field);
          if ((size_t )o->hh.keylen == tmp___6) {
            tmp___4 = strlen((char const *)field);
            tmp___5 = memcmp((void const *)o->hh.key, (void const *)field, tmp___4);
            if (tmp___5 == 0) {
              break;
            }
          }
          if (o->hh.hh_next) {
            while (1) {
              o = (ObjectHT *)((void *)((char *)o->hh.hh_next - ((m->val)->hh.tbl)->hho));
              break;
            }
          } else {
            o = (ObjectHT *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  if (! ((unsigned long )((void *)0) != (unsigned long )o)) {
    __assert_fail("((void *)0) != o", "src/src/flatds.c", 123U, "load");
  }
  return (o->val);
}
}
void store(void *addr , char *lField , int t , void *value , char *sname )
{
  MainHT *m ;
  ObjectType type ;
  int lKey ;
  int tmp ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  int tmp___0 ;
  void *tmp___1 ;
  unsigned int _ha_bkt ;
  void *tmp___2 ;
  void *tmp___3 ;
  unsigned int _hj_i___0 ;
  unsigned int _hj_j___0 ;
  unsigned int _hj_k___0 ;
  unsigned char *_hj_key___0 ;
  unsigned int _he_bkt ;
  unsigned int _he_bkt_i ;
  struct UT_hash_handle *_he_thh ;
  struct UT_hash_handle *_he_hh_nxt ;
  UT_hash_bucket *_he_new_buckets ;
  UT_hash_bucket *_he_newbkt ;
  void *tmp___4 ;
  int tmp___5 ;

  {
  type = getObjectType(t);
  tmp = toInt___1(addr);
  lKey = tmp;
  while (1) {
    m = (MainHT *)((void *)0);
    if (mainHT) {
      while (1) {
        _hj_key = (unsigned char *)(& lKey);
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        _hj_k = (unsigned int )sizeof(int );
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        _hf_hashv = (unsigned int )((unsigned long )_hf_hashv + sizeof(int ));
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((mainHT->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((mainHT->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            m = (MainHT *)((void *)((char *)((mainHT->hh.tbl)->buckets + _hf_bkt)->hh_head - (mainHT->hh.tbl)->hho));
            break;
          }
        } else {
          m = (MainHT *)((void *)0);
        }
        while (m) {
          if ((unsigned long )m->hh.keylen == sizeof(int )) {
            tmp___0 = memcmp((void const *)m->hh.key, (void const *)(& lKey),
                             sizeof(int ));
            if (tmp___0 == 0) {
              break;
            }
          }
          if (m->hh.hh_next) {
            while (1) {
              m = (MainHT *)((void *)((char *)m->hh.hh_next - (mainHT->hh.tbl)->hho));
              break;
            }
          } else {
            m = (MainHT *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  if ((unsigned long )((void *)0) == (unsigned long )m) {
    tmp___1 = malloc(sizeof(MainHT ));
    m = (MainHT *)tmp___1;
    m->key = lKey;
    m->val = newObject(lField, type, value);
    while (1) {
      m->hh.next = (void *)0;
      m->hh.key = (void *)((char *)(& m->key));
      m->hh.keylen = (unsigned int )sizeof(int );
      if (! mainHT) {
        mainHT = m;
        mainHT->hh.prev = (void *)0;
        while (1) {
          tmp___2 = malloc(sizeof(UT_hash_table ));
          mainHT->hh.tbl = (UT_hash_table *)tmp___2;
          if (! mainHT->hh.tbl) {
            exit(-1);
          }
          memset((void *)mainHT->hh.tbl, 0, sizeof(UT_hash_table ));
          (mainHT->hh.tbl)->tail = & mainHT->hh;
          (mainHT->hh.tbl)->num_buckets = 32U;
          (mainHT->hh.tbl)->log2_num_buckets = 5U;
          (mainHT->hh.tbl)->hho = (char *)(& mainHT->hh) - (char *)mainHT;
          tmp___3 = malloc(32UL * sizeof(struct UT_hash_bucket ));
          (mainHT->hh.tbl)->buckets = (UT_hash_bucket *)tmp___3;
          if (! (mainHT->hh.tbl)->buckets) {
            exit(-1);
          }
          memset((void *)(mainHT->hh.tbl)->buckets, 0, 32UL * sizeof(struct UT_hash_bucket ));
          (mainHT->hh.tbl)->signature = 2685476833U;
          break;
        }
      } else {
        ((mainHT->hh.tbl)->tail)->next = (void *)m;
        m->hh.prev = (void *)((char *)(mainHT->hh.tbl)->tail - (mainHT->hh.tbl)->hho);
        (mainHT->hh.tbl)->tail = & m->hh;
      }
      ((mainHT->hh.tbl)->num_items) ++;
      m->hh.tbl = mainHT->hh.tbl;
      while (1) {
        _hj_key___0 = (unsigned char *)(& m->key);
        m->hh.hashv = 4276993775U;
        _hj_j___0 = 2654435769U;
        _hj_i___0 = _hj_j___0;
        _hj_k___0 = (unsigned int )sizeof(int );
        while (_hj_k___0 >= 12U) {
          _hj_i___0 += (((unsigned int )*(_hj_key___0 + 0) + ((unsigned int )*(_hj_key___0 + 1) << 8)) + ((unsigned int )*(_hj_key___0 + 2) << 16)) + ((unsigned int )*(_hj_key___0 + 3) << 24);
          _hj_j___0 += (((unsigned int )*(_hj_key___0 + 4) + ((unsigned int )*(_hj_key___0 + 5) << 8)) + ((unsigned int )*(_hj_key___0 + 6) << 16)) + ((unsigned int )*(_hj_key___0 + 7) << 24);
          m->hh.hashv += (((unsigned int )*(_hj_key___0 + 8) + ((unsigned int )*(_hj_key___0 + 9) << 8)) + ((unsigned int )*(_hj_key___0 + 10) << 16)) + ((unsigned int )*(_hj_key___0 + 11) << 24);
          while (1) {
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= m->hh.hashv;
            _hj_i___0 ^= m->hh.hashv >> 13;
            _hj_j___0 -= m->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 8;
            m->hh.hashv -= _hj_i___0;
            m->hh.hashv -= _hj_j___0;
            m->hh.hashv ^= _hj_j___0 >> 13;
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= m->hh.hashv;
            _hj_i___0 ^= m->hh.hashv >> 12;
            _hj_j___0 -= m->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 16;
            m->hh.hashv -= _hj_i___0;
            m->hh.hashv -= _hj_j___0;
            m->hh.hashv ^= _hj_j___0 >> 5;
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= m->hh.hashv;
            _hj_i___0 ^= m->hh.hashv >> 3;
            _hj_j___0 -= m->hh.hashv;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 10;
            m->hh.hashv -= _hj_i___0;
            m->hh.hashv -= _hj_j___0;
            m->hh.hashv ^= _hj_j___0 >> 15;
            break;
          }
          _hj_key___0 += 12;
          _hj_k___0 -= 12U;
        }
        m->hh.hashv = (unsigned int )((unsigned long )m->hh.hashv + sizeof(int ));
        switch (_hj_k___0) {
        case 11U:
        m->hh.hashv += (unsigned int )*(_hj_key___0 + 10) << 24;
        case 10U:
        m->hh.hashv += (unsigned int )*(_hj_key___0 + 9) << 16;
        case 9U:
        m->hh.hashv += (unsigned int )*(_hj_key___0 + 8) << 8;
        case 8U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 7) << 24;
        case 7U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 6) << 16;
        case 6U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 5) << 8;
        case 5U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 4);
        case 4U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 3) << 24;
        case 3U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 2) << 16;
        case 2U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 1) << 8;
        case 1U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 0);
        }
        while (1) {
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= m->hh.hashv;
          _hj_i___0 ^= m->hh.hashv >> 13;
          _hj_j___0 -= m->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 8;
          m->hh.hashv -= _hj_i___0;
          m->hh.hashv -= _hj_j___0;
          m->hh.hashv ^= _hj_j___0 >> 13;
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= m->hh.hashv;
          _hj_i___0 ^= m->hh.hashv >> 12;
          _hj_j___0 -= m->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 16;
          m->hh.hashv -= _hj_i___0;
          m->hh.hashv -= _hj_j___0;
          m->hh.hashv ^= _hj_j___0 >> 5;
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= m->hh.hashv;
          _hj_i___0 ^= m->hh.hashv >> 3;
          _hj_j___0 -= m->hh.hashv;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 10;
          m->hh.hashv -= _hj_i___0;
          m->hh.hashv -= _hj_j___0;
          m->hh.hashv ^= _hj_j___0 >> 15;
          break;
        }
        _ha_bkt = m->hh.hashv & ((mainHT->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        (((mainHT->hh.tbl)->buckets + _ha_bkt)->count) ++;
        m->hh.hh_next = ((mainHT->hh.tbl)->buckets + _ha_bkt)->hh_head;
        m->hh.hh_prev = (struct UT_hash_handle *)((void *)0);
        if (((mainHT->hh.tbl)->buckets + _ha_bkt)->hh_head) {
          (((mainHT->hh.tbl)->buckets + _ha_bkt)->hh_head)->hh_prev = & m->hh;
        }
        ((mainHT->hh.tbl)->buckets + _ha_bkt)->hh_head = & m->hh;
        if (((mainHT->hh.tbl)->buckets + _ha_bkt)->count >= (((mainHT->hh.tbl)->buckets + _ha_bkt)->expand_mult + 1U) * 10U) {
          if ((m->hh.tbl)->noexpand != 1U) {
            while (1) {
              tmp___4 = malloc((unsigned long )(2U * (m->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
              _he_new_buckets = (UT_hash_bucket *)tmp___4;
              if (! _he_new_buckets) {
                exit(-1);
              }
              memset((void *)_he_new_buckets, 0, (unsigned long )(2U * (m->hh.tbl)->num_buckets) * sizeof(struct UT_hash_bucket ));
              if ((m->hh.tbl)->num_items & ((m->hh.tbl)->num_buckets * 2U - 1U)) {
                tmp___5 = 1;
              } else {
                tmp___5 = 0;
              }
              (m->hh.tbl)->ideal_chain_maxlen = ((m->hh.tbl)->num_items >> ((m->hh.tbl)->log2_num_buckets + 1U)) + (unsigned int )tmp___5;
              (m->hh.tbl)->nonideal_items = 0U;
              _he_bkt_i = 0U;
              while (_he_bkt_i < (m->hh.tbl)->num_buckets) {
                _he_thh = ((m->hh.tbl)->buckets + _he_bkt_i)->hh_head;
                while (_he_thh) {
                  _he_hh_nxt = _he_thh->hh_next;
                  while (1) {
                    _he_bkt = _he_thh->hashv & ((m->hh.tbl)->num_buckets * 2U - 1U);
                    break;
                  }
                  _he_newbkt = _he_new_buckets + _he_bkt;
                  (_he_newbkt->count) ++;
                  if (_he_newbkt->count > (m->hh.tbl)->ideal_chain_maxlen) {
                    ((m->hh.tbl)->nonideal_items) ++;
                    _he_newbkt->expand_mult = _he_newbkt->count / (m->hh.tbl)->ideal_chain_maxlen;
                  }
                  _he_thh->hh_prev = (struct UT_hash_handle *)((void *)0);
                  _he_thh->hh_next = _he_newbkt->hh_head;
                  if (_he_newbkt->hh_head) {
                    (_he_newbkt->hh_head)->hh_prev = _he_thh;
                  }
                  _he_newbkt->hh_head = _he_thh;
                  _he_thh = _he_hh_nxt;
                }
                _he_bkt_i ++;
              }
              free((void *)(m->hh.tbl)->buckets);
              (m->hh.tbl)->num_buckets *= 2U;
              ((m->hh.tbl)->log2_num_buckets) ++;
              (m->hh.tbl)->buckets = _he_new_buckets;
              if ((m->hh.tbl)->nonideal_items > (m->hh.tbl)->num_items >> 1) {
                ((m->hh.tbl)->ineff_expands) ++;
              } else {
                (m->hh.tbl)->ineff_expands = 0U;
              }
              if ((m->hh.tbl)->ineff_expands > 1U) {
                (m->hh.tbl)->noexpand = 1U;
              }
              break;
            }
          }
        }
        break;
      }
      break;
    }
  }
  addField(m->val, lField, type, value, sname);
  return;
}
}
char *getSymName(void *addr , char *field )
{
  MainHT *m ;
  ObjectHT *o ;
  int x ;
  int tmp ;
  unsigned int _hf_bkt ;
  unsigned int _hf_hashv ;
  unsigned int _hj_i ;
  unsigned int _hj_j ;
  unsigned int _hj_k ;
  unsigned char *_hj_key ;
  int tmp___0 ;
  unsigned int _hf_bkt___0 ;
  unsigned int _hf_hashv___0 ;
  unsigned int _hj_i___0 ;
  unsigned int _hj_j___0 ;
  unsigned int _hj_k___0 ;
  unsigned char *_hj_key___0 ;
  size_t tmp___1 ;
  size_t tmp___2 ;
  size_t tmp___3 ;
  int tmp___4 ;
  size_t tmp___5 ;

  {
  tmp = toInt___1(addr);
  x = tmp;
  while (1) {
    m = (MainHT *)((void *)0);
    if (mainHT) {
      while (1) {
        _hj_key = (unsigned char *)(& x);
        _hf_hashv = 4276993775U;
        _hj_j = 2654435769U;
        _hj_i = _hj_j;
        _hj_k = (unsigned int )sizeof(int );
        while (_hj_k >= 12U) {
          _hj_i += (((unsigned int )*(_hj_key + 0) + ((unsigned int )*(_hj_key + 1) << 8)) + ((unsigned int )*(_hj_key + 2) << 16)) + ((unsigned int )*(_hj_key + 3) << 24);
          _hj_j += (((unsigned int )*(_hj_key + 4) + ((unsigned int )*(_hj_key + 5) << 8)) + ((unsigned int )*(_hj_key + 6) << 16)) + ((unsigned int )*(_hj_key + 7) << 24);
          _hf_hashv += (((unsigned int )*(_hj_key + 8) + ((unsigned int )*(_hj_key + 9) << 8)) + ((unsigned int )*(_hj_key + 10) << 16)) + ((unsigned int )*(_hj_key + 11) << 24);
          while (1) {
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 13;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 8;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 13;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 12;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 16;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 5;
            _hj_i -= _hj_j;
            _hj_i -= _hf_hashv;
            _hj_i ^= _hf_hashv >> 3;
            _hj_j -= _hf_hashv;
            _hj_j -= _hj_i;
            _hj_j ^= _hj_i << 10;
            _hf_hashv -= _hj_i;
            _hf_hashv -= _hj_j;
            _hf_hashv ^= _hj_j >> 15;
            break;
          }
          _hj_key += 12;
          _hj_k -= 12U;
        }
        _hf_hashv = (unsigned int )((unsigned long )_hf_hashv + sizeof(int ));
        switch (_hj_k) {
        case 11U:
        _hf_hashv += (unsigned int )*(_hj_key + 10) << 24;
        case 10U:
        _hf_hashv += (unsigned int )*(_hj_key + 9) << 16;
        case 9U:
        _hf_hashv += (unsigned int )*(_hj_key + 8) << 8;
        case 8U:
        _hj_j += (unsigned int )*(_hj_key + 7) << 24;
        case 7U:
        _hj_j += (unsigned int )*(_hj_key + 6) << 16;
        case 6U:
        _hj_j += (unsigned int )*(_hj_key + 5) << 8;
        case 5U:
        _hj_j += (unsigned int )*(_hj_key + 4);
        case 4U:
        _hj_i += (unsigned int )*(_hj_key + 3) << 24;
        case 3U:
        _hj_i += (unsigned int )*(_hj_key + 2) << 16;
        case 2U:
        _hj_i += (unsigned int )*(_hj_key + 1) << 8;
        case 1U:
        _hj_i += (unsigned int )*(_hj_key + 0);
        }
        while (1) {
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 13;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 8;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 13;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 12;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 16;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 5;
          _hj_i -= _hj_j;
          _hj_i -= _hf_hashv;
          _hj_i ^= _hf_hashv >> 3;
          _hj_j -= _hf_hashv;
          _hj_j -= _hj_i;
          _hj_j ^= _hj_i << 10;
          _hf_hashv -= _hj_i;
          _hf_hashv -= _hj_j;
          _hf_hashv ^= _hj_j >> 15;
          break;
        }
        _hf_bkt = _hf_hashv & ((mainHT->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if (((mainHT->hh.tbl)->buckets + _hf_bkt)->hh_head) {
          while (1) {
            m = (MainHT *)((void *)((char *)((mainHT->hh.tbl)->buckets + _hf_bkt)->hh_head - (mainHT->hh.tbl)->hho));
            break;
          }
        } else {
          m = (MainHT *)((void *)0);
        }
        while (m) {
          if ((unsigned long )m->hh.keylen == sizeof(int )) {
            tmp___0 = memcmp((void const *)m->hh.key, (void const *)(& x), sizeof(int ));
            if (tmp___0 == 0) {
              break;
            }
          }
          if (m->hh.hh_next) {
            while (1) {
              m = (MainHT *)((void *)((char *)m->hh.hh_next - (mainHT->hh.tbl)->hho));
              break;
            }
          } else {
            m = (MainHT *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  while (1) {
    o = (ObjectHT *)((void *)0);
    if (m->val) {
      while (1) {
        _hj_key___0 = (unsigned char *)field;
        _hf_hashv___0 = 4276993775U;
        _hj_j___0 = 2654435769U;
        _hj_i___0 = _hj_j___0;
        tmp___1 = strlen((char const *)field);
        _hj_k___0 = (unsigned int )tmp___1;
        while (_hj_k___0 >= 12U) {
          _hj_i___0 += (((unsigned int )*(_hj_key___0 + 0) + ((unsigned int )*(_hj_key___0 + 1) << 8)) + ((unsigned int )*(_hj_key___0 + 2) << 16)) + ((unsigned int )*(_hj_key___0 + 3) << 24);
          _hj_j___0 += (((unsigned int )*(_hj_key___0 + 4) + ((unsigned int )*(_hj_key___0 + 5) << 8)) + ((unsigned int )*(_hj_key___0 + 6) << 16)) + ((unsigned int )*(_hj_key___0 + 7) << 24);
          _hf_hashv___0 += (((unsigned int )*(_hj_key___0 + 8) + ((unsigned int )*(_hj_key___0 + 9) << 8)) + ((unsigned int )*(_hj_key___0 + 10) << 16)) + ((unsigned int )*(_hj_key___0 + 11) << 24);
          while (1) {
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= _hf_hashv___0;
            _hj_i___0 ^= _hf_hashv___0 >> 13;
            _hj_j___0 -= _hf_hashv___0;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 8;
            _hf_hashv___0 -= _hj_i___0;
            _hf_hashv___0 -= _hj_j___0;
            _hf_hashv___0 ^= _hj_j___0 >> 13;
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= _hf_hashv___0;
            _hj_i___0 ^= _hf_hashv___0 >> 12;
            _hj_j___0 -= _hf_hashv___0;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 16;
            _hf_hashv___0 -= _hj_i___0;
            _hf_hashv___0 -= _hj_j___0;
            _hf_hashv___0 ^= _hj_j___0 >> 5;
            _hj_i___0 -= _hj_j___0;
            _hj_i___0 -= _hf_hashv___0;
            _hj_i___0 ^= _hf_hashv___0 >> 3;
            _hj_j___0 -= _hf_hashv___0;
            _hj_j___0 -= _hj_i___0;
            _hj_j___0 ^= _hj_i___0 << 10;
            _hf_hashv___0 -= _hj_i___0;
            _hf_hashv___0 -= _hj_j___0;
            _hf_hashv___0 ^= _hj_j___0 >> 15;
            break;
          }
          _hj_key___0 += 12;
          _hj_k___0 -= 12U;
        }
        tmp___2 = strlen((char const *)field);
        _hf_hashv___0 = (unsigned int )((size_t )_hf_hashv___0 + tmp___2);
        switch (_hj_k___0) {
        case 11U:
        _hf_hashv___0 += (unsigned int )*(_hj_key___0 + 10) << 24;
        case 10U:
        _hf_hashv___0 += (unsigned int )*(_hj_key___0 + 9) << 16;
        case 9U:
        _hf_hashv___0 += (unsigned int )*(_hj_key___0 + 8) << 8;
        case 8U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 7) << 24;
        case 7U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 6) << 16;
        case 6U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 5) << 8;
        case 5U:
        _hj_j___0 += (unsigned int )*(_hj_key___0 + 4);
        case 4U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 3) << 24;
        case 3U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 2) << 16;
        case 2U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 1) << 8;
        case 1U:
        _hj_i___0 += (unsigned int )*(_hj_key___0 + 0);
        }
        while (1) {
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= _hf_hashv___0;
          _hj_i___0 ^= _hf_hashv___0 >> 13;
          _hj_j___0 -= _hf_hashv___0;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 8;
          _hf_hashv___0 -= _hj_i___0;
          _hf_hashv___0 -= _hj_j___0;
          _hf_hashv___0 ^= _hj_j___0 >> 13;
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= _hf_hashv___0;
          _hj_i___0 ^= _hf_hashv___0 >> 12;
          _hj_j___0 -= _hf_hashv___0;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 16;
          _hf_hashv___0 -= _hj_i___0;
          _hf_hashv___0 -= _hj_j___0;
          _hf_hashv___0 ^= _hj_j___0 >> 5;
          _hj_i___0 -= _hj_j___0;
          _hj_i___0 -= _hf_hashv___0;
          _hj_i___0 ^= _hf_hashv___0 >> 3;
          _hj_j___0 -= _hf_hashv___0;
          _hj_j___0 -= _hj_i___0;
          _hj_j___0 ^= _hj_i___0 << 10;
          _hf_hashv___0 -= _hj_i___0;
          _hf_hashv___0 -= _hj_j___0;
          _hf_hashv___0 ^= _hj_j___0 >> 15;
          break;
        }
        _hf_bkt___0 = _hf_hashv___0 & (((m->val)->hh.tbl)->num_buckets - 1U);
        break;
      }
      while (1) {
        if ((((m->val)->hh.tbl)->buckets + _hf_bkt___0)->hh_head) {
          while (1) {
            o = (ObjectHT *)((void *)((char *)(((m->val)->hh.tbl)->buckets + _hf_bkt___0)->hh_head - ((m->val)->hh.tbl)->hho));
            break;
          }
        } else {
          o = (ObjectHT *)((void *)0);
        }
        while (o) {
          tmp___5 = strlen((char const *)field);
          if ((size_t )o->hh.keylen == tmp___5) {
            tmp___3 = strlen((char const *)field);
            tmp___4 = memcmp((void const *)o->hh.key, (void const *)field, tmp___3);
            if (tmp___4 == 0) {
              break;
            }
          }
          if (o->hh.hh_next) {
            while (1) {
              o = (ObjectHT *)((void *)((char *)o->hh.hh_next - ((m->val)->hh.tbl)->hho));
              break;
            }
          } else {
            o = (ObjectHT *)((void *)0);
          }
        }
        break;
      }
    }
    break;
  }
  if (! ((unsigned long )((void *)0) != (unsigned long )o)) {
    __assert_fail("((void *)0) != o", "src/src/flatds.c", 151U, "getSymName");
  }
  return (o->symName);
}
}
ObjectHT *findBySymName(char *symName )
{
  MainHT *mn ;
  MainHT *tmpMn ;
  ObjectHT *object ;
  ObjectHT *tmpObj ;
  void *tmp ;
  void *tmp___0 ;
  void *tmp___1 ;
  void *tmp___2 ;
  int tmp___3 ;

  {
  mn = mainHT;
  if (mainHT) {
    tmp = mainHT->hh.next;
  } else {
    tmp = (void *)0;
  }
  tmpMn = (MainHT *)tmp;
  while (mn) {
    object = mn->val;
    if (mn->val) {
      tmp___1 = (mn->val)->hh.next;
    } else {
      tmp___1 = (void *)0;
    }
    tmpObj = (ObjectHT *)tmp___1;
    while (object) {
      if ((unsigned long )((void *)0) != (unsigned long )object->symName) {
        tmp___3 = strcmp((char const *)object->symName, (char const *)symName);
        if (0 == tmp___3) {
          return (object);
        }
      }
      object = tmpObj;
      if (tmpObj) {
        tmp___2 = tmpObj->hh.next;
      } else {
        tmp___2 = (void *)0;
      }
      tmpObj = (ObjectHT *)tmp___2;
    }
    mn = tmpMn;
    if (tmpMn) {
      tmp___0 = tmpMn->hh.next;
    } else {
      tmp___0 = (void *)0;
    }
    tmpMn = (MainHT *)tmp___0;
  }
  return ((ObjectHT *)0);
}
}
void UpdateSymName(char *symName , char *sname )
{
  MainHT *mn ;
  MainHT *tmpMn ;
  ObjectHT *object ;
  ObjectHT *tmpObj ;
  char *formula ;
  void *tmp ;
  void *tmp___0 ;
  void *tmp___1 ;
  void *tmp___2 ;
  int tmp___3 ;
  size_t tmp___4 ;
  void *tmp___5 ;
  size_t tmp___6 ;
  void *tmp___7 ;
  int tmp___8 ;

  {
  mn = mainHT;
  if (mainHT) {
    tmp = mainHT->hh.next;
  } else {
    tmp = (void *)0;
  }
  tmpMn = (MainHT *)tmp;
  while (mn) {
    object = mn->val;
    if (mn->val) {
      tmp___1 = (mn->val)->hh.next;
    } else {
      tmp___1 = (void *)0;
    }
    tmpObj = (ObjectHT *)tmp___1;
    while (object) {
      tmp___8 = strcmp((char const *)object->symName, (char const *)symName);
      if (0 == tmp___8) {
        tmp___3 = (int )getPrepositionalFormula(sname);
        formula = (char *)tmp___3;
        if ((unsigned long )((void *)0) == (unsigned long )object->symName) {
          tmp___4 = strlen((char const *)formula);
          tmp___5 = malloc(sizeof(char ) * (tmp___4 + 1UL));
          object->symName = (char *)tmp___5;
        } else {
          tmp___6 = strlen((char const *)formula);
          tmp___7 = realloc((void *)object->symName, sizeof(char ) * (tmp___6 + 1UL));
          object->symName = (char *)tmp___7;
        }
        strcpy((char * __restrict )object->symName, (char const * __restrict )formula);
      }
      object = tmpObj;
      if (tmpObj) {
        tmp___2 = tmpObj->hh.next;
      } else {
        tmp___2 = (void *)0;
      }
      tmpObj = (ObjectHT *)tmp___2;
    }
    mn = tmpMn;
    if (tmpMn) {
      tmp___0 = tmpMn->hh.next;
    } else {
      tmp___0 = (void *)0;
    }
    tmpMn = (MainHT *)tmp___0;
  }
  return;
}
}
ObjectType getObjectType(int t )
{
  ObjectType type ;

  {
  switch (t) {
  case 0:
  type = (ObjectType )0;
  break;
  case 1:
  type = (ObjectType )1;
  break;
  case 2:
  type = (ObjectType )2;
  break;
  case 3:
  type = (ObjectType )3;
  break;
  case 4:
  type = (ObjectType )4;
  break;
  }
  return (type);
}
}
void setValue(char *symName , int t , void *value )
{
  ObjectType type ;
  ObjectHT *o ;
  ObjectHT *tmp ;
  int tmp___0 ;

  {
  type = getObjectType(t);
  tmp = findBySymName(symName);
  o = tmp;
  if ((unsigned long )o == (unsigned long )((void *)0)) {
    return;
  }
  tmp___0 = getSizeByType(type);
  memcpy((void * __restrict )o->val, (void const * __restrict )value, (size_t )tmp___0);
  return;
}
}
void *getValue(char *symName )
{
  ObjectHT *o ;
  ObjectHT *tmp ;

  {
  tmp = findBySymName(symName);
  o = tmp;
  return (o->val);
}
}
void delete_allStructTableEntry(void)
{


  {
  while (1) {
    if (mainHT) {
      free((void *)(mainHT->hh.tbl)->buckets);
      free((void *)mainHT->hh.tbl);
      mainHT = (MainHT *)((void *)0);
    }
    break;
  }
  mainHT = (MainHT *)((void *)0);
  return;
}
}
#pragma merger("0","src/src/cdg.i","-g,-g")
Stack *stackNew(int elementSize ) ;
void stackPush(Stack *s , void const *element ) ;
void stackPop(Stack *s , void *element ) ;
int stackIsEmpty(Stack *s ) ;
void stackFree(Stack *s ) ;
CDGNode *newNode(int id , int score , int outcome , char const *expr , CDGNode *trueNodeSet ,
                 CDGNode *falseNodeSet , CDGNode *parent , CDGNode *next ) ;
CDGNode *newBlankNode(void) ;
CDGNode *addDummyNodes(CDGNode *node___0 ) ;
void deleteNode(CDGNode *node___0 ) ;
int getID(CDGNode *node___0 ) ;
CDGNode *setID(CDGNode *node___0 , int id ) ;
int getScore(CDGNode *node___0 ) ;
CDGNode *setScore(CDGNode *node___0 , int score ) ;
int getOutcome(CDGNode *node___0 ) ;
CDGNode *setOutcome(CDGNode *node___0 , int outcome ) ;
char *getExpr(CDGNode *node___0 ) ;
CDGNode *setExpr(CDGNode *node___0 , char const *expr ) ;
CDGNode *getTrueNodeSet(CDGNode *node___0 ) ;
CDGNode *getFalseNodeSet(CDGNode *node___0 ) ;
CDGNode *addTrueNode(CDGNode *node___0 , CDGNode *trueNode ) ;
CDGNode *addFalseNode(CDGNode *node___0 , CDGNode *falseNode ) ;
CDGNode *getParent(CDGNode *node___0 ) ;
CDGNode *setParent(CDGNode *node___0 , CDGNode *parentNode ) ;
CDGNode *getNextNode(CDGNode *node___0 ) ;
CDGNode *setNextNode(CDGNode *node___0 , CDGNode *nextNode ) ;
CDGNode *updateScore(CDGNode *node___0 , int initialize ) ;
CDGNode *updateCDG(CDGNode *root___0 , int initialize ) ;
void coverNodes(CDGNode *root___0 , CDGNode **nodes___0 , int size ) ;
void deleteCDG(CDGNode *root___0 ) ;
CDGNode *getPathNode(CDGPath *path ) ;
CDGPath *getNextPath(CDGPath *path ) ;
CDGPath *getTopPaths(CDGContext *ctx___0 , CDGNode *root___0 , int numberOfPaths ) ;
CDGNode *getFeasibleSatNodes(CDGContext *ctx___0 , int pathRank___0 , CDGNode *list ) ;
int getPathLength(CDGNode *node___0 ) ;
void deletePaths(CDGPath *path ) ;
int max(int a , int b )
{
  int tmp ;

  {
  if (a > b) {
    tmp = a;
  } else {
    tmp = b;
  }
  return (tmp);
}
}
void pushNodeListToStack(Stack *s , CDGNode *node___0 )
{


  {
  if (! ((unsigned long )((void *)0) != (unsigned long )node___0)) {
    __assert_fail("((void *)0) != node", "src/src/cdg.c", 8U, "pushNodeListToStack");
  }
  while (1) {
    stackPush(s, (void const *)(& node___0));
    node___0 = getNextNode(node___0);
    if (! node___0) {
      break;
    }
  }
  return;
}
}
void postOrder(CDGNode *root___0 , Stack *s )
{
  Stack *temp ;
  Stack *tmp ;
  CDGNode *node___0 ;
  CDGNode *tmp___0 ;
  CDGNode *tmp___1 ;
  CDGNode *tmp___2 ;
  CDGNode *tmp___3 ;
  int tmp___4 ;

  {
  if ((unsigned long )((void *)0) == (unsigned long )root___0) {
    return;
  }
  tmp = stackNew((int )sizeof(CDGNode *));
  temp = tmp;
  pushNodeListToStack(temp, root___0);
  while (1) {
    tmp___4 = stackIsEmpty(temp);
    if (tmp___4) {
      break;
    }
    stackPop(temp, (void *)(& node___0));
    tmp___1 = getTrueNodeSet(node___0);
    if (tmp___1) {
      tmp___0 = getTrueNodeSet(node___0);
      pushNodeListToStack(temp, tmp___0);
    }
    tmp___3 = getFalseNodeSet(node___0);
    if (tmp___3) {
      tmp___2 = getFalseNodeSet(node___0);
      pushNodeListToStack(temp, tmp___2);
    }
    stackPush(s, (void const *)(& node___0));
  }
  stackFree(temp);
  return;
}
}
CDGNode *getTrueNodeSet(CDGNode *node___0 )
{


  {
  return (node___0->trueNodeSet);
}
}
CDGNode *setTrueNodeSet(CDGNode *node___0 , CDGNode *trueNodeSet )
{


  {
  node___0->trueNodeSet = trueNodeSet;
  return (node___0);
}
}
CDGNode *getFalseNodeSet(CDGNode *node___0 )
{


  {
  return (node___0->falseNodeSet);
}
}
CDGNode *setFalseNodeSet(CDGNode *node___0 , CDGNode *falseNodeSet )
{


  {
  node___0->falseNodeSet = falseNodeSet;
  return (node___0);
}
}
CDGNode *setNextNode(CDGNode *node___0 , CDGNode *nextNode )
{
  CDGNode *tmp ;

  {
  node___0->next = nextNode;
  if (nextNode) {
    tmp = getParent(node___0);
    setParent(nextNode, tmp);
  }
  return (node___0);
}
}
CDGNode *setTrueNodeSetScore(CDGNode *node___0 , int score )
{
  CDGNode *curr ;

  {
  curr = getTrueNodeSet(node___0);
  while ((unsigned long )curr != (unsigned long )((void *)0)) {
    setScore(curr, score);
    curr = curr->next;
  }
  return (node___0);
}
}
CDGNode *setFalseNodeSetScore(CDGNode *node___0 , int score )
{
  CDGNode *curr ;

  {
  curr = getFalseNodeSet(node___0);
  while ((unsigned long )curr != (unsigned long )((void *)0)) {
    setScore(curr, score);
    curr = curr->next;
  }
  return (node___0);
}
}
CDGNode *getLastNode(CDGNode *node___0 )
{
  CDGNode *curr ;
  CDGNode *tmp ;

  {
  if (! ((unsigned long )((void *)0) != (unsigned long )node___0)) {
    __assert_fail("((void *)0) != node", "src/src/cdg.c", 88U, "getLastNode");
  }
  curr = node___0;
  while (1) {
    tmp = getNextNode(curr);
    if (! tmp) {
      break;
    }
    curr = getNextNode(curr);
  }
  return (curr);
}
}
int isLeaf(CDGNode *node___0 )
{
  CDGNode *tmp ;
  CDGNode *tmp___0 ;

  {
  tmp = getTrueNodeSet(node___0);
  if (tmp) {
    return (0);
  } else {
    tmp___0 = getFalseNodeSet(node___0);
    if (tmp___0) {
      return (0);
    }
  }
  return (1);
}
}
int getConditionalNodeSum(CDGNode *node___0 )
{
  int sum ;
  int tmp ;
  int tmp___0 ;

  {
  sum = 0;
  while ((unsigned long )node___0 != (unsigned long )((void *)0)) {
    tmp___0 = isLeaf(node___0);
    if (! tmp___0) {
      tmp = getScore(node___0);
      sum += tmp;
    }
    node___0 = getNextNode(node___0);
  }
  return (sum);
}
}
int hasUncoveredChild(CDGNode *node___0 , int branch )
{
  CDGNode *temp ;
  int tmp ;
  int tmp___0 ;

  {
  if (branch) {
    temp = getTrueNodeSet(node___0);
  } else {
    temp = getFalseNodeSet(node___0);
  }
  while (temp) {
    tmp = isLeaf(temp);
    if (tmp) {
      tmp___0 = getScore(temp);
      if (0 < tmp___0) {
        return (1);
      }
    }
    temp = getNextNode(temp);
  }
  return (0);
}
}
int hasUncoveredBranch(CDGNode *node___0 , int branch )
{
  CDGNode *tmp ;
  CDGNode *tmp___0 ;
  int tmp___1 ;
  int tmp___2 ;

  {
  if (branch) {
    tmp = getTrueNodeSet(node___0);
    if ((unsigned long )((void *)0) == (unsigned long )tmp) {
      return (0);
    }
  }
  if (0 == branch) {
    tmp___0 = getFalseNodeSet(node___0);
    if ((unsigned long )((void *)0) == (unsigned long )tmp___0) {
      return (0);
    }
  }
  tmp___1 = getID(node___0);
  tmp___2 = getBranchInfo(tmp___1, branch);
  if (0 == tmp___2) {
    return (1);
  }
  return (0);
}
}
int hasConditionalChild(CDGNode *node___0 )
{
  CDGNode *temp ;
  int tmp ;
  int tmp___0 ;

  {
  temp = getTrueNodeSet(node___0);
  while (temp) {
    tmp = isLeaf(temp);
    if (! tmp) {
      return (1);
    }
    temp = getNextNode(temp);
  }
  temp = getFalseNodeSet(node___0);
  while (temp) {
    tmp___0 = isLeaf(temp);
    if (! tmp___0) {
      return (1);
    }
    temp = getNextNode(temp);
  }
  return (0);
}
}
int isConditionalLeaf(CDGNode *node___0 )
{
  int tmp ;
  int tmp___0 ;
  CDGNode *tmp___1 ;
  int tmp___2 ;
  CDGNode *tmp___3 ;
  int tmp___4 ;

  {
  tmp = isLeaf(node___0);
  if (tmp) {
    return (0);
  }
  tmp___0 = hasConditionalChild(node___0);
  if (! tmp___0) {
    return (1);
  }
  tmp___1 = getTrueNodeSet(node___0);
  tmp___2 = getConditionalNodeSum(tmp___1);
  if (0 < tmp___2) {
    return (0);
  }
  tmp___3 = getFalseNodeSet(node___0);
  tmp___4 = getConditionalNodeSum(tmp___3);
  if (0 < tmp___4) {
    return (0);
  }
  return (1);
}
}
CDGNode *resetExpr(CDGNode *node___0 )
{


  {
  if ((unsigned long )((void *)0) != (unsigned long )node___0->expr) {
    free((void *)node___0->expr);
  }
  return (node___0);
}
}
CDGNode *resetTrueNodeSet(CDGNode *node___0 )
{


  {
  node___0->trueNodeSet = (struct CDGNode *)((void *)0);
  return (node___0);
}
}
CDGNode *resetFalseNodeSet(CDGNode *node___0 )
{


  {
  node___0->falseNodeSet = (struct CDGNode *)((void *)0);
  return (node___0);
}
}
CDGNode *resetParent(CDGNode *node___0 )
{


  {
  node___0->parent = (struct CDGNode *)((void *)0);
  return (node___0);
}
}
CDGNode *resetNextNode(CDGNode *node___0 )
{


  {
  node___0->next = (struct CDGNode *)((void *)0);
  return (node___0);
}
}
CDGNode *getMaxScoreConditionNode(CDGNode *node___0 )
{
  CDGNode *out ;
  int tmp ;
  int tmp___0 ;
  int tmp___1 ;
  int tmp___2 ;

  {
  out = (CDGNode *)((void *)0);
  while (1) {
    tmp___1 = isLeaf(node___0);
    if (! tmp___1) {
      tmp___2 = getScore(node___0);
      if (0 < tmp___2) {
        if ((unsigned long )((void *)0) == (unsigned long )out) {
          out = node___0;
        } else {
          tmp = getScore(out);
          tmp___0 = getScore(node___0);
          if (tmp < tmp___0) {
            out = node___0;
          }
        }
      }
    }
    node___0 = getNextNode(node___0);
    if (! ((unsigned long )((void *)0) != (unsigned long )node___0)) {
      break;
    }
  }
  return (out);
}
}
CDGNode *getMaxScoreConditionChildNode(CDGNode *node___0 , int *outcome )
{
  CDGNode *maxTrue ;
  CDGNode *maxFalse ;
  CDGNode *tmp ;
  CDGNode *tmp___0 ;
  CDGNode *tmp___1 ;
  CDGNode *tmp___2 ;
  int tmp___3 ;
  int tmp___4 ;

  {
  maxTrue = (CDGNode *)((void *)0);
  maxFalse = (CDGNode *)((void *)0);
  tmp___0 = getTrueNodeSet(node___0);
  if (tmp___0) {
    tmp = getTrueNodeSet(node___0);
    maxTrue = getMaxScoreConditionNode(tmp);
  }
  tmp___2 = getFalseNodeSet(node___0);
  if (tmp___2) {
    tmp___1 = getFalseNodeSet(node___0);
    maxFalse = getMaxScoreConditionNode(tmp___1);
  }
  if ((unsigned long )((void *)0) == (unsigned long )maxFalse) {
    *outcome = 1;
    return (maxTrue);
  }
  if ((unsigned long )((void *)0) == (unsigned long )maxTrue) {
    *outcome = 0;
    return (maxFalse);
  }
  tmp___3 = getScore(maxTrue);
  tmp___4 = getScore(maxFalse);
  if (tmp___3 < tmp___4) {
    *outcome = 0;
    return (maxFalse);
  }
  *outcome = 1;
  return (maxTrue);
}
}
CDGNode *newNode(int id , int score , int outcome , char const *expr , CDGNode *trueNodeSet ,
                 CDGNode *falseNodeSet , CDGNode *parent , CDGNode *next )
{
  CDGNode *node___0 ;
  void *tmp ;

  {
  tmp = malloc(sizeof(CDGNode ));
  node___0 = (CDGNode *)tmp;
  if (! ((unsigned long )((void *)0) != (unsigned long )node___0)) {
    __assert_fail("((void *)0) != node", "src/src/cdg.c", 233U, "newNode");
  }
  setID(node___0, id);
  setScore(node___0, score);
  setOutcome(node___0, outcome);
  setExpr(node___0, expr);
  setTrueNodeSet(node___0, trueNodeSet);
  setFalseNodeSet(node___0, falseNodeSet);
  setParent(node___0, parent);
  setNextNode(node___0, next);
  return (node___0);
}
}
CDGNode *newBlankNode(void)
{
  CDGNode *tmp ;

  {
  tmp = newNode(-1, 1, 1, (char const *)((void *)0), (CDGNode *)((void *)0), (CDGNode *)((void *)0),
                (CDGNode *)((void *)0), (CDGNode *)((void *)0));
  return (tmp);
}
}
void deleteNode(CDGNode *node___0 )
{


  {
  if (! ((unsigned long )((void *)0) != (unsigned long )node___0)) {
    __assert_fail("((void *)0) != node", "src/src/cdg.c", 250U, "deleteNode");
  }
  free((void *)node___0);
  return;
}
}
void deleteNodeList(CDGNode *node___0 )
{
  CDGNode *next ;

  {
  if (! ((unsigned long )((void *)0) != (unsigned long )node___0)) {
    __assert_fail("((void *)0) != node", "src/src/cdg.c", 260U, "deleteNodeList");
  }
  while (1) {
    next = getNextNode(node___0);
    deleteNode(node___0);
    node___0 = next;
    if (! node___0) {
      break;
    }
  }
  return;
}
}
void deleteCDG(CDGNode *root___0 )
{
  CDGNode *node___0 ;
  Stack *nodeStack ;
  Stack *tmp ;
  int tmp___0 ;

  {
  if ((unsigned long )((void *)0) == (unsigned long )root___0) {
    return;
  }
  tmp = stackNew((int )sizeof(CDGNode *));
  nodeStack = tmp;
  postOrder(root___0, nodeStack);
  while (1) {
    tmp___0 = stackIsEmpty(nodeStack);
    if (tmp___0) {
      break;
    }
    stackPop(nodeStack, (void *)(& node___0));
    deleteNode(node___0);
  }
  stackFree(nodeStack);
  return;
}
}
int getID(CDGNode *node___0 )
{


  {
  return (node___0->id);
}
}
CDGNode *setID(CDGNode *node___0 , int id )
{


  {
  node___0->id = id;
  return (node___0);
}
}
int getScore(CDGNode *node___0 )
{


  {
  return (node___0->score);
}
}
CDGNode *setScore(CDGNode *node___0 , int score )
{


  {
  node___0->score = score;
  return (node___0);
}
}
int getOutcome(CDGNode *node___0 )
{


  {
  return (node___0->outcome);
}
}
CDGNode *setOutcome(CDGNode *node___0 , int outcome )
{


  {
  node___0->outcome = outcome;
  return (node___0);
}
}
char *getExpr(CDGNode *node___0 )
{


  {
  if ((unsigned long )node___0->expr != (unsigned long )((void *)0)) {
    return (node___0->expr);
  }
  return ((char *)((void *)0));
}
}
CDGNode *setExpr(CDGNode *node___0 , char const *expr )
{
  size_t tmp ;
  void *tmp___0 ;

  {
  if ((unsigned long )((void *)0) == (unsigned long )expr) {
    node___0->expr = (char *)((void *)0);
    return (node___0);
  }
  tmp = strlen(expr);
  tmp___0 = malloc(sizeof(char ) * (tmp + 1UL));
  node___0->expr = (char *)tmp___0;
  strcpy((char * __restrict )node___0->expr, (char const * __restrict )expr);
  return (node___0);
}
}
CDGNode *addTrueNode(CDGNode *node___0 , CDGNode *trueNode )
{


  {
  if ((unsigned long )((void *)0) == (unsigned long )trueNode) {
    return (node___0);
  }
  trueNode->next = node___0->trueNodeSet;
  node___0->trueNodeSet = trueNode;
  setParent(trueNode, node___0);
  return (node___0);
}
}
CDGNode *addFalseNode(CDGNode *node___0 , CDGNode *falseNode )
{


  {
  if ((unsigned long )((void *)0) == (unsigned long )falseNode) {
    return (node___0);
  }
  falseNode->next = node___0->falseNodeSet;
  node___0->falseNodeSet = falseNode;
  setParent(falseNode, node___0);
  return (node___0);
}
}
CDGNode *getParent(CDGNode *node___0 )
{


  {
  return (node___0->parent);
}
}
CDGNode *setParent(CDGNode *node___0 , CDGNode *parentNode )
{


  {
  node___0->parent = parentNode;
  return (node___0);
}
}
CDGNode *getNextNode(CDGNode *node___0 )
{


  {
  return (node___0->next);
}
}
CDGNode *updateScore(CDGNode *node___0 , int initialize )
{
  int tmp ;
  CDGNode *tmp___0 ;
  CDGNode *tmp___1 ;
  CDGNode *tmp___2 ;
  int tmp___3 ;
  int tmp___4 ;
  int tmp___5 ;
  int tmp___6 ;
  int tmp___7 ;
  int tmp___8 ;
  CDGNode *tmp___9 ;
  int tmp___10 ;
  CDGNode *tmp___11 ;
  int tmp___12 ;
  CDGNode *tmp___13 ;
  int tmp___14 ;
  int trueScore ;
  CDGNode *tmp___15 ;
  int tmp___16 ;
  int falseScore ;
  CDGNode *tmp___17 ;
  int tmp___18 ;
  int tmp___19 ;
  int tmp___20 ;
  int tmp___21 ;
  int tmp___22 ;

  {
  if (! ((unsigned long )((void *)0) != (unsigned long )node___0)) {
    __assert_fail("((void *)0) != node", "src/src/cdg.c", 360U, "updateScore");
  }
  tmp = isLeaf(node___0);
  if (tmp) {
    return (node___0);
  }
  tmp___14 = isConditionalLeaf(node___0);
  if (tmp___14) {
    if (initialize) {
      tmp___7 = getBranchInfo(node___0->id, 1);
      if (tmp___7) {
        tmp___8 = getBranchInfo(node___0->id, 0);
        if (tmp___8) {
          goto _L___0;
        } else {
          setScore(node___0, 1);
          setTrueNodeSetScore(node___0, 0);
          setFalseNodeSetScore(node___0, 1);
          tmp___0 = setOutcome(node___0, 0);
          return (tmp___0);
        }
      } else {
        _L___0:
        tmp___5 = getBranchInfo(node___0->id, 0);
        if (tmp___5) {
          tmp___6 = getBranchInfo(node___0->id, 1);
          if (tmp___6) {
            goto _L;
          } else {
            setScore(node___0, 1);
            setFalseNodeSetScore(node___0, 0);
            setTrueNodeSetScore(node___0, 1);
            tmp___1 = setOutcome(node___0, 1);
            return (tmp___1);
          }
        } else {
          _L:
          tmp___3 = getBranchInfo(node___0->id, 0);
          if (tmp___3) {
            tmp___4 = getBranchInfo(node___0->id, 1);
            if (tmp___4) {
              setScore(node___0, 0);
              setTrueNodeSetScore(node___0, 0);
              setFalseNodeSetScore(node___0, 0);
              tmp___2 = setOutcome(node___0, 1);
              return (tmp___2);
            }
          }
        }
      }
    } else {
      tmp___10 = hasUncoveredChild(node___0, 1);
      if (tmp___10) {
        setScore(node___0, 1);
        tmp___9 = setOutcome(node___0, 1);
        return (tmp___9);
      }
      tmp___12 = hasUncoveredChild(node___0, 0);
      if (tmp___12) {
        setScore(node___0, 1);
        tmp___11 = setOutcome(node___0, 0);
        return (tmp___11);
      }
    }
    setScore(node___0, 0);
    tmp___13 = setOutcome(node___0, 1);
    return (tmp___13);
  }
  tmp___15 = getTrueNodeSet(node___0);
  tmp___16 = getConditionalNodeSum(tmp___15);
  trueScore = tmp___16;
  tmp___17 = getFalseNodeSet(node___0);
  tmp___18 = getConditionalNodeSum(tmp___17);
  falseScore = tmp___18;
  if (trueScore >= falseScore) {
    if (node___0->id == 0) {
      setScore(node___0, trueScore);
      setOutcome(node___0, 1);
    } else {
      tmp___19 = getBranchInfo(node___0->id, 1);
      if (tmp___19) {
        tmp___20 = getBranchInfo(node___0->id, 0);
        if (tmp___20) {
          setScore(node___0, trueScore);
        } else {
          setScore(node___0, trueScore + 1);
        }
      } else {
        setScore(node___0, trueScore + 1);
      }
      setOutcome(node___0, 1);
    }
  } else
  if (node___0->id == 0) {
    setScore(node___0, falseScore);
    setOutcome(node___0, 0);
  } else {
    tmp___21 = getBranchInfo(node___0->id, 1);
    if (tmp___21) {
      tmp___22 = getBranchInfo(node___0->id, 0);
      if (tmp___22) {
        setScore(node___0, falseScore);
      } else {
        setScore(node___0, falseScore + 1);
      }
    } else {
      setScore(node___0, falseScore + 1);
    }
    setOutcome(node___0, 0);
  }
  return (node___0);
}
}
CDGNode *propagateScoreChange(CDGNode *node___0 )
{
  CDGNode *currNode ;

  {
  currNode = node___0;
  while (currNode) {
    updateScore(currNode, 0);
    currNode = getParent(currNode);
  }
  return (node___0);
}
}
CDGNode *visitAnyOneNode(CDGNode *node___0 )
{
  int tmp ;
  int tmp___0 ;

  {
  if (! ((unsigned long )((void *)0) != (unsigned long )node___0)) {
    __assert_fail("((void *)0) != node", "src/src/cdg.c", 448U, "visitAnyOneNode");
  }
  while (1) {
    tmp = isLeaf(node___0);
    if (tmp) {
      tmp___0 = getScore(node___0);
      if (1 == tmp___0) {
        setScore(node___0, 0);
        return (node___0);
      }
    }
    node___0 = getNextNode(node___0);
    if (! node___0) {
      break;
    }
  }
  return ((CDGNode *)((void *)0));
}
}
CDGNode *visitAnyOneChild(CDGNode *node___0 )
{
  CDGNode *child ;
  CDGNode *tmp ;
  CDGNode *tmp___0 ;
  CDGNode *tmp___1 ;
  CDGNode *tmp___2 ;

  {
  child = (CDGNode *)((void *)0);
  tmp___0 = getFalseNodeSet(node___0);
  if (tmp___0) {
    tmp = getFalseNodeSet(node___0);
    child = visitAnyOneNode(tmp);
  }
  if ((unsigned long )((void *)0) == (unsigned long )child) {
    tmp___2 = getTrueNodeSet(node___0);
    if (tmp___2) {
      tmp___1 = getTrueNodeSet(node___0);
      child = visitAnyOneNode(tmp___1);
    }
  }
  if (! ((unsigned long )((void *)0) != (unsigned long )child)) {
    __assert_fail("((void *)0) != child", "src/src/cdg.c", 468U, "visitAnyOneChild");
  }
  return (child);
}
}
CDGNode *unVisitNode(CDGNode *node___0 )
{
  CDGNode *tmp ;

  {
  tmp = setScore(node___0, 1);
  return (tmp);
}
}
CDGNode *updateCDG(CDGNode *root___0 , int initialize )
{
  int size ;
  Stack *nodeStack ;
  Stack *tmp ;
  CDGNode *node___0 ;
  int tmp___0 ;

  {
  size = (int )sizeof(CDGNode *);
  if (! ((unsigned long )((void *)0) != (unsigned long )root___0)) {
    __assert_fail("((void *)0) != root", "src/src/cdg.c", 479U, "updateCDG");
  }
  tmp = stackNew(size);
  nodeStack = tmp;
  postOrder(root___0, nodeStack);
  while (1) {
    tmp___0 = stackIsEmpty(nodeStack);
    if (tmp___0) {
      break;
    }
    stackPop(nodeStack, (void *)(& node___0));
    updateScore(node___0, initialize);
  }
  stackFree(nodeStack);
  return (root___0);
}
}
void visitChildren(CDGNode *node___0 , int outcome )
{
  CDGNode *children ;
  int tmp ;

  {
  if (outcome) {
    children = getTrueNodeSet(node___0);
  } else {
    children = getFalseNodeSet(node___0);
  }
  while (children) {
    tmp = isLeaf(children);
    if (tmp) {
      setScore(children, 0);
    }
    children = getNextNode(children);
  }
  return;
}
}
void visitIfExists(CDGNode *node___0 , CDGNode **nodes___0 , int size )
{
  int i ;
  int tmp ;
  int tmp___0 ;
  int tmp___1 ;

  {
  i = 0;
  while (i < size) {
    tmp___0 = getID(node___0);
    tmp___1 = getID(*(nodes___0 + i));
    if (tmp___0 == tmp___1) {
      tmp = getOutcome(*(nodes___0 + i));
      visitChildren(node___0, tmp);
      return;
    }
    i ++;
  }
  return;
}
}
void coverNodes(CDGNode *root___0 , CDGNode **nodes___0 , int size )
{
  Stack *nodeStack ;
  Stack *tmp ;
  CDGNode *node___0 ;
  int tmp___0 ;

  {
  if (! ((unsigned long )((void *)0) != (unsigned long )root___0)) {
    __assert_fail("((void *)0) != root", "src/src/cdg.c", 519U, "coverNodes");
  }
  if (0 == size) {
    return;
  }
  tmp = stackNew((int )sizeof(CDGNode *));
  nodeStack = tmp;
  postOrder(root___0, nodeStack);
  while (1) {
    tmp___0 = stackIsEmpty(nodeStack);
    if (tmp___0) {
      break;
    }
    stackPop(nodeStack, (void *)(& node___0));
    visitIfExists(node___0, nodes___0, size);
  }
  updateCDG(root___0, 0);
  return;
}
}
CDGPath *setPathNode(CDGPath *path , CDGNode *node___0 )
{


  {
  if (! ((unsigned long )((void *)0) != (unsigned long )path)) {
    __assert_fail("((void *)0) != path", "src/src/cdg.c", 534U, "setPathNode");
  }
  path->node = node___0;
  return (path);
}
}
CDGPath *setNextPath(CDGPath *path , CDGPath *nextPath )
{


  {
  if (! ((unsigned long )((void *)0) != (unsigned long )path)) {
    __assert_fail("((void *)0) != path", "src/src/cdg.c", 540U, "setNextPath");
  }
  path->next = nextPath;
  return (path);
}
}
CDGPath *newPath(void)
{
  CDGPath *path ;
  void *tmp ;

  {
  tmp = malloc(sizeof(CDGPath ));
  path = (CDGPath *)tmp;
  if (! ((unsigned long )((void *)0) != (unsigned long )path)) {
    __assert_fail("((void *)0) != path", "src/src/cdg.c", 548U, "newPath");
  }
  setPathNode(path, (CDGNode *)((void *)0));
  setNextPath(path, (CDGPath *)((void *)0));
  return (path);
}
}
CDGNode *getPathNode(CDGPath *path )
{


  {
  if (! ((unsigned long )((void *)0) != (unsigned long )path)) {
    __assert_fail("((void *)0) != path", "src/src/cdg.c", 555U, "getPathNode");
  }
  return (path->node);
}
}
CDGPath *getNextPath(CDGPath *path )
{


  {
  if (! ((unsigned long )((void *)0) != (unsigned long )path)) {
    __assert_fail("((void *)0) != path", "src/src/cdg.c", 560U, "getNextPath");
  }
  return (path->next);
}
}
CDGNode *copyToPathNode(CDGNode *pathNode___0 , CDGNode *node___0 )
{
  int tmp ;
  char *tmp___0 ;
  int tmp___1 ;

  {
  if (! ((unsigned long )((void *)0) != (unsigned long )pathNode___0)) {
    __assert_fail("((void *)0) != pathNode", "src/src/cdg.c", 565U, "copyToPathNode");
  }
  tmp = getID(node___0);
  setID(pathNode___0, tmp);
  tmp___0 = getExpr(node___0);
  setExpr(pathNode___0, (char const *)tmp___0);
  tmp___1 = getOutcome(node___0);
  setOutcome(pathNode___0, tmp___1);
  return (pathNode___0);
}
}
CDGNode *pathToList(CDGNode *head )
{
  Stack *nodeStack ;
  Stack *tmp ;
  CDGNode *node___0 ;
  CDGNode *list ;
  CDGNode *tmp___0 ;
  CDGNode *tmp___1 ;
  int tmp___2 ;

  {
  if (! ((unsigned long )((void *)0) != (unsigned long )head)) {
    __assert_fail("((void *)0) != head", "src/src/cdg.c", 573U, "pathToList");
  }
  tmp = stackNew((int )sizeof(CDGNode *));
  nodeStack = tmp;
  list = (CDGNode *)((void *)0);
  postOrder(head, nodeStack);
  while (1) {
    tmp___2 = stackIsEmpty(nodeStack);
    if (tmp___2) {
      break;
    }
    stackPop(nodeStack, (void *)(& node___0));
    tmp___0 = newBlankNode();
    tmp___1 = copyToPathNode(tmp___0, node___0);
    list = setNextNode(tmp___1, list);
  }
  return (list);
}
}
CDGNode *getTopPath(CDGNode *node___0 , Stack *changedNodes , Stack *changedBranches )
{
  CDGNode *pathNode___0 ;
  CDGNode *tmp ;
  CDGNode *temp ;
  int branch ;
  CDGNode *tmp___0 ;
  CDGNode *tmp___1 ;
  int tmp___2 ;
  int tmp___3 ;
  int tmp___4 ;
  CDGNode *tmp___5 ;
  CDGNode *tmp___6 ;
  int tmp___7 ;
  int tmp___8 ;
  int tmp___9 ;
  CDGNode *tmp___10 ;
  CDGNode *tmp___11 ;
  int tmp___12 ;
  int tmp___13 ;
  int tmp___14 ;

  {
  tmp = newBlankNode();
  pathNode___0 = tmp;
  temp = pathNode___0;
  while (node___0) {
    tmp___14 = getScore(node___0);
    if (0 != tmp___14) {
      stackPush(changedNodes, (void const *)(& node___0));
      branch = getOutcome(node___0);
      stackPush(changedBranches, (void const *)(& branch));
      tmp___13 = isLeaf(node___0);
      if (tmp___13) {
        setScore(node___0, 0);
      } else {
        tmp___0 = newBlankNode();
        tmp___1 = copyToPathNode(tmp___0, node___0);
        setNextNode(temp, tmp___1);
        temp = getNextNode(temp);
        tmp___12 = getOutcome(node___0);
        if (tmp___12) {
          tmp___2 = getID(node___0);
          tmp___3 = getBranchInfo(tmp___2, 0);
          tmp___4 = getID(node___0);
          setBranchInfo(tmp___4, 1, tmp___3);
          tmp___5 = getTrueNodeSet(node___0);
          tmp___6 = getTopPath(tmp___5, changedNodes, changedBranches);
          setTrueNodeSet(temp, tmp___6);
        } else {
          tmp___7 = getID(node___0);
          tmp___8 = getBranchInfo(tmp___7, 1);
          tmp___9 = getID(node___0);
          setBranchInfo(tmp___9, tmp___8, 1);
          tmp___10 = getFalseNodeSet(node___0);
          tmp___11 = getTopPath(tmp___10, changedNodes, changedBranches);
          setFalseNodeSet(temp, tmp___11);
        }
      }
    }
    node___0 = getNextNode(node___0);
  }
  if ((unsigned long )temp == (unsigned long )pathNode___0) {
    deleteNode(pathNode___0);
    pathNode___0 = (CDGNode *)((void *)0);
  } else {
    temp = pathNode___0;
    pathNode___0 = getNextNode(pathNode___0);
    deleteNode(temp);
  }
  return (pathNode___0);
}
}
CDGPath *getTopPaths(CDGContext *ctx___0 , CDGNode *root___0 , int numberOfPaths )
{
  CDGPath *pathHead___0 ;
  CDGNode *path ;
  CDGPath *currPath ;
  CDGNode *node___0 ;
  int branch ;
  Stack *changedNodes ;
  Stack *tmp ;
  Stack *changedBranches ;
  Stack *tmp___0 ;
  CDGPath *tmp___1 ;
  CDGPath *tmp___2 ;
  CDGPath *tmp___3 ;
  int tmp___4 ;
  int tmp___5 ;
  int tmp___6 ;
  int tmp___7 ;
  int tmp___8 ;
  int tmp___9 ;
  int tmp___10 ;
  int tmp___11 ;
  int tmp___12 ;
  int tmp___13 ;
  CDGPath *outPathHead ;
  CDGNode *tmp___14 ;
  CDGPath *tmp___15 ;
  CDGNode *tmp___16 ;
  CDGPath *tmp___17 ;
  CDGPath *tmp___18 ;

  {
  pathHead___0 = (CDGPath *)((void *)0);
  tmp = stackNew((int )sizeof(CDGNode *));
  changedNodes = tmp;
  tmp___0 = stackNew((int )sizeof(int ));
  changedBranches = tmp___0;
  while (1) {
    tmp___4 = numberOfPaths;
    numberOfPaths --;
    if (! tmp___4) {
      break;
    }
    path = getTopPath(root___0, changedNodes, changedBranches);
    if ((unsigned long )((void *)0) == (unsigned long )path) {
      break;
    }
    if ((unsigned long )((void *)0) == (unsigned long )pathHead___0) {
      tmp___1 = newPath();
      pathHead___0 = setPathNode(tmp___1, path);
      currPath = pathHead___0;
    } else {
      tmp___2 = newPath();
      tmp___3 = setPathNode(tmp___2, path);
      setNextPath(currPath, tmp___3);
      currPath = getNextPath(currPath);
    }
    updateCDG(root___0, 0);
  }
  while (1) {
    tmp___12 = stackIsEmpty(changedNodes);
    if (tmp___12) {
      break;
    } else {
      tmp___13 = stackIsEmpty(changedBranches);
      if (tmp___13) {
        break;
      }
    }
    stackPop(changedNodes, (void *)(& node___0));
    stackPop(changedBranches, (void *)(& branch));
    tmp___11 = isLeaf(node___0);
    if (tmp___11) {
      setScore(node___0, 1);
    } else
    if (branch) {
      tmp___5 = getID(node___0);
      tmp___6 = getBranchInfo(tmp___5, 0);
      tmp___7 = getID(node___0);
      setBranchInfo(tmp___7, 0, tmp___6);
    } else {
      tmp___8 = getID(node___0);
      tmp___9 = getBranchInfo(tmp___8, 1);
      tmp___10 = getID(node___0);
      setBranchInfo(tmp___10, tmp___9, 0);
    }
  }
  updateCDG(root___0, 0);
  stackFree(changedNodes);
  stackFree(changedBranches);
  ctx___0->topPaths = pathHead___0;
  if ((unsigned long )((void *)0) == (unsigned long )pathHead___0) {
    return ((CDGPath *)((void *)0));
  }
  outPathHead = (CDGPath *)((void *)0);
  currPath = (CDGPath *)((void *)0);
  path = (CDGNode *)((void *)0);
  while ((unsigned long )((void *)0) != (unsigned long )pathHead___0) {
    path = getPathNode(pathHead___0);
    if ((unsigned long )((void *)0) == (unsigned long )outPathHead) {
      tmp___14 = pathToList(path);
      tmp___15 = newPath();
      outPathHead = setPathNode(tmp___15, tmp___14);
      currPath = outPathHead;
    } else {
      tmp___16 = pathToList(path);
      tmp___17 = newPath();
      tmp___18 = setPathNode(tmp___17, tmp___16);
      setNextPath(currPath, tmp___18);
      currPath = getNextPath(currPath);
    }
    pathHead___0 = getNextPath(pathHead___0);
  }
  return (outPathHead);
}
}
void deletePaths(CDGPath *path )
{
  CDGPath *next ;
  CDGNode *tmp ;

  {
  if (! ((unsigned long )((void *)0) != (unsigned long )path)) {
    __assert_fail("((void *)0) != path", "src/src/cdg.c", 686U, "deletePaths");
  }
  while (1) {
    next = getNextPath(path);
    tmp = getPathNode(path);
    deleteNodeList(tmp);
    setNextPath(path, (CDGPath *)((void *)0));
    free((void *)path);
    path = next;
    if (! path) {
      break;
    }
  }
  return;
}
}
CDGNode *addDummyNodes(CDGNode *node___0 )
{
  CDGNode *tmp ;
  CDGNode *tmp___0 ;
  CDGNode *tmp___1 ;
  CDGNode *tmp___2 ;
  int tmp___3 ;
  CDGNode *tmp___4 ;
  CDGNode *tmp___5 ;

  {
  while (node___0) {
    tmp___3 = isLeaf(node___0);
    if (! tmp___3) {
      tmp___2 = getTrueNodeSet(node___0);
      if ((unsigned long )((void *)0) == (unsigned long )tmp___2) {
        tmp = newBlankNode();
        addTrueNode(node___0, tmp);
      } else {
        tmp___1 = getFalseNodeSet(node___0);
        if ((unsigned long )((void *)0) == (unsigned long )tmp___1) {
          tmp___0 = newBlankNode();
          addFalseNode(node___0, tmp___0);
        }
      }
    }
    tmp___4 = getTrueNodeSet(node___0);
    addDummyNodes(tmp___4);
    tmp___5 = getFalseNodeSet(node___0);
    addDummyNodes(tmp___5);
    node___0 = getNextNode(node___0);
  }
  return (node___0);
}
}
CDGNode *findNode(CDGNode *node___0 , int id )
{
  int tmp ;
  CDGNode *temp ;
  CDGNode *tmp___0 ;
  CDGNode *tmp___1 ;

  {
  if ((unsigned long )((void *)0) == (unsigned long )node___0) {
    return ((CDGNode *)((void *)0));
  }
  tmp = getID(node___0);
  if (id == tmp) {
    return (node___0);
  }
  temp = (CDGNode *)((void *)0);
  tmp___0 = getNextNode(node___0);
  tmp___1 = findNode(tmp___0, id);
  return (tmp___1);
}
}
int nodeExists(CDGNode *node___0 , int id )
{
  CDGNode *tmp ;

  {
  tmp = findNode(node___0, id);
  return ((unsigned long )((void *)0) != (unsigned long )tmp);
}
}
CDGNode *buildFeasiblePath(CDGNode *node___0 , CDGNode *list )
{
  int tmp ;
  int tmp___0 ;
  CDGNode *out ;
  CDGNode *tmp___1 ;
  CDGNode *tmp___2 ;
  CDGNode *tmp___3 ;
  CDGNode *tmp___4 ;
  CDGNode *tmp___5 ;
  CDGNode *tmp___6 ;
  CDGNode *tmp___7 ;

  {
  while (1) {
    if (node___0) {
      tmp = getID(node___0);
      tmp___0 = nodeExists(list, tmp);
      if (! (0 == tmp___0)) {
        break;
      }
    } else {
      break;
    }
    node___0 = getNextNode(node___0);
  }
  if ((unsigned long )((void *)0) == (unsigned long )node___0) {
    return ((CDGNode *)((void *)0));
  }
  out = (CDGNode *)((void *)0);
  tmp___1 = newBlankNode();
  out = copyToPathNode(tmp___1, node___0);
  tmp___2 = getTrueNodeSet(node___0);
  tmp___3 = buildFeasiblePath(tmp___2, list);
  setTrueNodeSet(out, tmp___3);
  tmp___4 = getFalseNodeSet(node___0);
  tmp___5 = buildFeasiblePath(tmp___4, list);
  setFalseNodeSet(out, tmp___5);
  tmp___6 = getNextNode(node___0);
  tmp___7 = buildFeasiblePath(tmp___6, list);
  setNextNode(out, tmp___7);
  return (out);
}
}
CDGNode *getFeasiblePath(CDGNode *path , CDGNode *list )
{
  CDGNode *tmp ;

  {
  tmp = buildFeasiblePath(path, list);
  return (tmp);
}
}
CDGNode *getFeasibleSatNodes(CDGContext *ctx___0 , int pathRank___0 , CDGNode *list )
{
  CDGPath *topPath ;
  int tmp ;
  CDGNode *tmp___0 ;
  CDGNode *tmp___1 ;
  CDGNode *tmp___2 ;

  {
  if (! ((unsigned long )((void *)0) != (unsigned long )ctx___0)) {
    __assert_fail("((void *)0) != ctx", "src/src/cdg.c", 755U, "getFeasibleSatNodes");
  }
  if (! ((unsigned long )((void *)0) != (unsigned long )ctx___0->topPaths)) {
    __assert_fail("((void *)0) != (*ctx).topPaths", "src/src/cdg.c", 756U, "getFeasibleSatNodes");
  }
  topPath = ctx___0->topPaths;
  while (1) {
    tmp = pathRank___0;
    pathRank___0 --;
    if (! (0 < tmp)) {
      break;
    }
    topPath = getNextPath(topPath);
  }
  tmp___0 = getPathNode(topPath);
  tmp___1 = getFeasiblePath(tmp___0, list);
  tmp___2 = pathToList(tmp___1);
  return (tmp___2);
}
}
int getPathLength(CDGNode *node___0 )
{
  CDGNode *tmp ;
  int tmp___0 ;

  {
  if ((unsigned long )((void *)0) == (unsigned long )node___0) {
    return (0);
  }
  tmp = getNextNode(node___0);
  tmp___0 = getPathLength(tmp);
  return (1 + tmp___0);
}
}
#pragma merger("0","src/src/cdgWrapper.i","-g,-g")
extern void callInstrumentedFun() ;
CDGNode *nodes[500] = { (CDGNode *)((void *)0)};
CDGNode *root = (CDGNode *)((void *)0);
CDGNode *savePath = (CDGNode *)((void *)0);
CDGContext ctx ;
CDGPath *pathHead ;
CDGPath *newSATPath ;
int pathRank = 0;
float previousCoverage = (float )0;
int countAttempts = 0;
int totalTestCases = 0;
void preOrderCDG(CDGNode *node___0 ) ;
void addtoCDGnode(int id , int pid , int branch ) ;
void setArray(int id , char const *expr ) ;
void printArray(void) ;
int getTestCases(void) ;
void addtoCDGnode(int id , int pid , int branch )
{
  CDGNode *node___0 ;
  CDGNode *par ;

  {
  if ((unsigned long )nodes[pid] == (unsigned long )((void *)0)) {
    par = newBlankNode();
    nodes[pid] = par;
    setID(par, pid);
  } else {
    par = nodes[pid];
  }
  if ((unsigned long )nodes[id] != (unsigned long )((void *)0)) {
    if ((unsigned long )(nodes[id])->parent != (unsigned long )((void *)0)) {
      if (((nodes[id])->parent)->id == pid) {
        return;
      }
    }
  }
  if ((unsigned long )nodes[id] != (unsigned long )((void *)0)) {
    node___0 = nodes[id];
  } else {
    node___0 = newBlankNode();
  }
  setID(node___0, id);
  if (0 == id) {
    root = node___0;
  } else
  if (branch) {
    addTrueNode(nodes[pid], node___0);
  } else {
    addFalseNode(nodes[pid], node___0);
  }
  nodes[id] = node___0;
  return;
}
}
void setArray(int id , char const *expr )
{


  {
  setExpr(nodes[id], expr);
  return;
}
}
void initializeCDG(void)
{


  {
  updateCDG(root, 1);
  return;
}
}
void printArray(void)
{
  CDGNode *node___0 ;

  {
  node___0 = root;
  preOrderCDG(node___0);
  return;
}
}
void preOrderCDG(CDGNode *node___0 )
{
  CDGNode *tmp ;
  CDGNode *tmp___0 ;

  {
  while (node___0) {
    tmp = getTrueNodeSet(node___0);
    preOrderCDG(tmp);
    tmp___0 = getFalseNodeSet(node___0);
    preOrderCDG(tmp___0);
    node___0 = getNextNode(node___0);
  }
  return;
}
}
void printPath(CDGNode *node___0 )
{


  {
  while (node___0) {
    node___0 = getNextNode(node___0);
  }
  return;
}
}
void sortPath(void)
{
  CDGPath *curr ;
  CDGPath *temp ;
  CDGPath *save ;
  CDGPath *next_curr ;
  CDGPath *prev_curr ;
  int l1 ;
  int i ;
  int j ;
  int tmp ;

  {
  curr = newSATPath;
  i = 1;
  prev_curr = newSATPath;
  while ((unsigned long )curr != (unsigned long )((void *)0)) {
    printf((char const * __restrict )"id = %d\n", (curr->node)->id);
    l1 = getPathLength(curr->node);
    j = 0;
    save = newSATPath;
    temp = newSATPath;
    next_curr = curr->next;
    while (1) {
      if (j < i) {
        tmp = getPathLength(temp->node);
        if (! (l1 < tmp)) {
          break;
        }
      } else {
        break;
      }
      save = temp;
      temp = getNextPath(temp);
      j ++;
    }
    if (j == i) {
      prev_curr = curr;
      curr = next_curr;
      i ++;
      continue;
    }
    if ((unsigned long )save == (unsigned long )temp) {
      curr->next = newSATPath;
      newSATPath = curr;
      prev_curr->next = next_curr;
    } else {
      save->next = curr;
      curr->next = temp;
      prev_curr->next = next_curr;
    }
    i ++;
    curr = next_curr;
  }
  curr = newSATPath;
  while ((unsigned long )curr != (unsigned long )((void *)0)) {
    printf((char const * __restrict )"\n\n");
    curr = curr->next;
  }
  return;
}
}
void initializePathNodes(CDGNode *node___0 )
{
  CDGNode *curr ;
  int j ;
  int tmp ;

  {
  j = 0;
  while (j < 100) {
    pathNode[j] = (CDGNode *)((void *)0);
    j ++;
  }
  curr = node___0;
  while ((unsigned long )curr != (unsigned long )((void *)0)) {
    tmp = getID(curr);
    pathNode[tmp] = curr;
    curr = curr->next;
  }
  return;
}
}
int getConditionalOutcome(int id , int expr )
{
  CDGNode *temp ;
  int tmp ;

  {
  if (CDG_Module == 1) {
    temp = pathNode[id];
    if ((unsigned long )temp == (unsigned long )((void *)0)) {
      return (expr);
    }
    tmp = getOutcome(temp);
    return (tmp);
  }
  return (expr);
}
}
int getCDGPaths(void) ;
int startCDG(void)
{
  CDGPath *curr ;
  int tmp ;
  int tmp___0 ;
  int tmp___1 ;
  int tmp___2 ;
  int tmp___3 ;

  {
  if (CDG_Module == 1) {
    return (0);
  }
  tmp = countCoveredConditions();
  tmp___0 = countTotalConditions();
  if (tmp == 2 * tmp___0) {
    return (0);
  }
  if (CDG_Module == 2) {
    return (1);
  }
  if (countAttempts >= 10) {
    return (0);
  }
  tmp___1 = countCoveredConditions();
  tmp___2 = countTotalConditions();
  previousCoverage = (float )((tmp___1 * 100) / (2 * tmp___2));
  CDG_Module = 1;
  print_conditions();
  emptyQueue();
  initializeCDG();
  if ((unsigned long )newSATPath != (unsigned long )((void *)0)) {
    deletePaths(newSATPath);
  }
  newSATPath = (CDGPath *)((void *)0);
  tmp___3 = getCDGPaths();
  if (! tmp___3) {
    return (0);
  }
  curr = newSATPath;
  while ((unsigned long )curr != (unsigned long )((void *)0)) {
    printPath(curr->node);
    curr = curr->next;
  }
  CDG_Module = 2;
  return (1);
}
}
int getMaxFeasible(void) ;
int getCDGPaths(void)
{
  int tmp ;

  {
  pathHead = getTopPaths(& ctx, root, 5);
  if ((unsigned long )pathHead == (unsigned long )((void *)0)) {
    return (0);
  }
  ctx.topPaths = pathHead;
  pathRank = 0;
  while (1) {
    tmp = getMaxFeasible();
    if (! tmp) {
      break;
    }
    pathRank ++;
    delete_allSTableEntry();
    delete_allStructTableEntry();
  }
  deletePaths(pathHead);
  pathHead = (CDGPath *)((void *)0);
  pathRank = 0;
  return (1);
}
}
int getMaxFeasible(void)
{
  CDGPath *currPath ;
  CDGNode *save ;
  CDGNode *curr ;
  CDGNode *temp ;
  CDGPath *pathNode___0 ;
  CDGNode *tmp ;
  CDGNode *new_head ;
  CDGNode *new_curr ;
  char *token ;
  char *condition ;
  int infeasible ;
  int i ;
  void *tmp___0 ;
  int tmp___1 ;
  size_t tmp___2 ;
  size_t tmp___3 ;
  void *tmp___4 ;
  FILE *pipe ;
  FILE *tmp___5 ;
  char buffer[100] ;
  char result[1000] ;
  char *tmp___6 ;
  int tmp___7 ;
  int i___0 ;

  {
  tmp = newBlankNode();
  pathNode___0 = (CDGPath *)tmp;
  i = 0;
  tmp___0 = malloc(2UL * sizeof(char ));
  condition = (char *)tmp___0;
  currPath = pathHead;
  strcpy((char * __restrict )condition, (char const * __restrict )"");
  while (i < pathRank) {
    currPath = currPath->next;
    if ((unsigned long )currPath == (unsigned long )((void *)0)) {
      return (0);
    }
    i ++;
  }
  new_head = newNode((currPath->node)->id, (currPath->node)->score, (currPath->node)->outcome,
                     (char const *)(currPath->node)->expr, (CDGNode *)((void *)0),
                     (CDGNode *)((void *)0), (CDGNode *)((void *)0), (CDGNode *)((void *)0));
  curr = (currPath->node)->next;
  save = currPath->node;
  initializePathNodes(currPath->node);
  callInstrumentedFun();
  while ((unsigned long )curr != (unsigned long )((void *)0)) {
    tmp___1 = checkForAllConstants(curr->expr);
    if (tmp___1) {
      save->next = curr->next;
      temp = curr;
      free((void *)temp);
      curr = save->next;
    } else {
      save = curr;
      curr = curr->next;
    }
  }
  remove("src/src/printTest.smt");
  getPrint();
  curr = (currPath->node)->next;
  while ((unsigned long )curr != (unsigned long )((void *)0)) {
    tmp___2 = strlen((char const *)condition);
    tmp___3 = strlen((char const *)curr->expr);
    tmp___4 = realloc((void *)condition, (((tmp___2 + tmp___3) + 1UL) + 2UL) * sizeof(char ));
    condition = (char *)tmp___4;
    strcat((char * __restrict )condition, (char const * __restrict )curr->expr);
    strcat((char * __restrict )condition, (char const * __restrict )"##");
    curr = curr->next;
  }
  strcat((char * __restrict )condition, (char const * __restrict )"\000");
  writeProgramSVariables();
  writeConditionsToFile(condition);
  tmp___5 = popen("z3/build/maxsat src/src/printTest.smt", "r");
  pipe = tmp___5;
  if (! pipe) {
    return (0);
  }
  strcpy((char * __restrict )(result), (char const * __restrict )"\000");
  while (1) {
    tmp___7 = feof(pipe);
    if (tmp___7) {
      break;
    }
    tmp___6 = fgets((char * __restrict )(buffer), 1000, (FILE * __restrict )pipe);
    if ((unsigned long )tmp___6 != (unsigned long )((void *)0)) {
      strcat((char * __restrict )(result), (char const * __restrict )(buffer));
    }
  }
  pclose(pipe);
  curr = (currPath->node)->next;
  save = new_head;
  if ((int )result[0] != 0) {
    i___0 = 0;
    token = strtok((char * __restrict )(result), (char const * __restrict )" ");
    while ((unsigned long )token != (unsigned long )((void *)0)) {
      infeasible = atoi((char const *)token);
      token = strtok((char * __restrict )((void *)0), (char const * __restrict )" ");
      while (i___0 < infeasible) {
        new_curr = newNode(curr->id, curr->score, curr->outcome, (char const *)curr->expr,
                           (CDGNode *)((void *)0), (CDGNode *)((void *)0), save, (CDGNode *)((void *)0));
        save->next = new_curr;
        save = new_curr;
        curr = curr->next;
        i___0 ++;
      }
      if ((unsigned long )((void *)0) == (unsigned long )curr) {
        break;
      }
      curr = curr->next;
      i___0 ++;
    }
  }
  while ((unsigned long )curr != (unsigned long )((void *)0)) {
    new_curr = newNode(curr->id, curr->score, curr->outcome, (char const *)curr->expr,
                       (CDGNode *)((void *)0), (CDGNode *)((void *)0), save, (CDGNode *)((void *)0));
    save->next = new_curr;
    save = new_curr;
    curr = curr->next;
  }
  pathNode___0->node = getFeasibleSatNodes(& ctx, pathRank, new_head);
  pathNode___0->next = newSATPath;
  newSATPath = pathNode___0;
  free((void *)condition);
  return (1);
}
}
int getTestCases(void)
{
  CDGPath *currPath ;
  CDGNode *curr ;
  float percent ;
  float orgPercent ;
  int atleastOneConditionNotCovered ;
  int i ;
  int tmp ;
  int tmp___0 ;
  int tmp___1 ;
  int tmp___2 ;
  FILE *coveragefile ;
  FILE *tmp___3 ;
  int tmp___4 ;
  int tmp___5 ;
  int tmp___6 ;
  int tmp___7 ;
  FILE *coveragefile___0 ;
  FILE *tmp___8 ;
  FILE *fp ;
  FILE *tmp___9 ;
  int tmp___10 ;
  int tmp___11 ;
  int tmp___12 ;
  int tmp___13 ;
  int tmp___14 ;

  {
  atleastOneConditionNotCovered = 0;
  i = 0;
  currPath = newSATPath;
  tmp = countCoveredConditions();
  tmp___0 = countTotalConditions();
  percent = (float )((tmp * 100) / (2 * tmp___0));
  tmp___1 = countOrgCoveredConditions();
  tmp___2 = countOrgTotalConditions();
  orgPercent = (float )((tmp___1 * 100) / (2 * tmp___2));
  printf((char const * __restrict )"COVERAGE = %f....\n", (double )orgPercent);
  tmp___3 = fopen((char const * __restrict )"src/src/coverage.txt", (char const * __restrict )"ab+");
  coveragefile = tmp___3;
  fprintf((FILE * __restrict )coveragefile, (char const * __restrict )"%.1f\n",
          (double )orgPercent);
  if ((unsigned long )savePath != (unsigned long )((void *)0)) {
    if (previousCoverage == percent) {
      countAttempts ++;
      while ((unsigned long )savePath != (unsigned long )((void *)0)) {
        if (savePath->id == 0) {
          break;
        }
        updateSidForPath(savePath->id, savePath->outcome);
        savePath = savePath->next;
      }
    } else {
      totalTestCases ++;
      countAttempts = 0;
    }
  }
  while (i < pathRank) {
    currPath = currPath->next;
    if ((unsigned long )currPath == (unsigned long )((void *)0)) {
      print_conditions();
      tmp___4 = countCoveredConditions();
      tmp___5 = countTotalConditions();
      percent = (float )((tmp___4 * 100) / (2 * tmp___5));
      tmp___6 = countOrgCoveredConditions();
      tmp___7 = countOrgTotalConditions();
      orgPercent = (float )((tmp___6 * 100) / (2 * tmp___7));
      printf((char const * __restrict )"COVERAGE = %f....\n", (double )orgPercent);
      tmp___8 = fopen((char const * __restrict )"src/src/coverage.txt", (char const * __restrict )"ab+");
      coveragefile___0 = tmp___8;
      fprintf((FILE * __restrict )coveragefile___0, (char const * __restrict )"%.1f\n",
              (double )orgPercent);
      CDG_Module = 0;
      return (0);
    }
    i ++;
  }
  curr = currPath->node;
  savePath = currPath->node;
  remove("src/src/printTest.smt");
  getPrint();
  writeProgramSVariables();
  tmp___9 = fopen((char const * __restrict )"src/src/printTest.smt", (char const * __restrict )"a");
  fp = tmp___9;
  if ((unsigned long )fp == (unsigned long )((void *)0)) {
    printf((char const * __restrict )"Error opening file!\n");
    exit(1);
  }
  while ((unsigned long )curr != (unsigned long )((void *)0)) {
    if (curr->id == 0) {
      break;
    }
    tmp___14 = getOutcome(curr);
    if (tmp___14) {
      tmp___10 = checkForAllConstants(curr->expr);
      if (! tmp___10) {
        fprintf((FILE * __restrict )fp, (char const * __restrict )"  :assumption %s\n",
                curr->expr);
      }
      tmp___11 = getBranchInfo(curr->id, 1);
      if (! tmp___11) {
        atleastOneConditionNotCovered = 1;
      }
    } else {
      tmp___12 = checkForAllConstants(curr->expr);
      if (! tmp___12) {
        fprintf((FILE * __restrict )fp, (char const * __restrict )"  :assumption %s\n",
                curr->expr);
      }
      tmp___13 = getBranchInfo(curr->id, 0);
      if (! tmp___13) {
        atleastOneConditionNotCovered = 1;
      }
    }
    curr = curr->next;
  }
  fprintf((FILE * __restrict )fp, (char const * __restrict )"%s\n", ")");
  fclose(fp);
  if (atleastOneConditionNotCovered) {
    getOutputFromConstraintSolver();
  }
  previousCoverage = percent;
  pathRank ++;
  delete_allSTableEntry();
  delete_allStructTableEntry();
  return (1);
}
}
#pragma merger("0","src/src/stack.i","-g,-g")
int stackSize(Stack *s ) ;
void stackPeek(Stack *s , void *element ) ;
Stack *stackNew(int elementSize )
{
  Stack *s ;
  void *tmp ;

  {
  tmp = malloc(sizeof(Stack ));
  s = (Stack *)tmp;
  s->elementSize = elementSize;
  s->elementsCnt = 0;
  s->head = (node *)((void *)0);
  return (s);
}
}
void stackPush(Stack *s , void const *element )
{
  node *newHead ;
  void *tmp ;

  {
  tmp = malloc(sizeof(node ));
  newHead = (node *)tmp;
  if (! ((unsigned long )((void *)0) != (unsigned long )newHead)) {
    __assert_fail("((void *)0) != newHead", "src/src/stack.c", 15U, "stackPush");
  }
  newHead->element = malloc((size_t )s->elementSize);
  if (! ((unsigned long )((void *)0) != (unsigned long )newHead->element)) {
    __assert_fail("((void *)0) != newHead->element", "src/src/stack.c", 17U, "stackPush");
  }
  memcpy((void * __restrict )newHead->element, (void const * __restrict )element,
         (size_t )s->elementSize);
  newHead->next = s->head;
  s->head = newHead;
  (s->elementsCnt) ++;
  return;
}
}
void stackPop(Stack *s , void *element )
{
  int tmp ;
  node *top ;

  {
  tmp = stackIsEmpty(s);
  if (tmp) {
    __assert_fail("!stackIsEmpty(s)", "src/src/stack.c", 25U, "stackPop");
  }
  top = s->head;
  s->head = (s->head)->next;
  (s->elementsCnt) --;
  memcpy((void * __restrict )element, (void const * __restrict )top->element,
         (size_t )s->elementSize);
  free(top->element);
  free((void *)top);
  return;
}
}
int stackIsEmpty(Stack *s )
{


  {
  if (0 == s->elementsCnt) {
    return (1);
  }
  return (0);
}
}
void stackFree(Stack *s )
{
  node *current ;
  node *next ;

  {
  current = s->head;
  while ((unsigned long )((void *)0) != (unsigned long )current) {
    next = current->next;
    free(current->element);
    free((void *)current);
    current = next;
  }
  s->head = (node *)((void *)0);
  s->elementsCnt = 0;
  return;
}
}
int stackSize(Stack *s )
{


  {
  return (s->elementsCnt);
}
}
void stackPeek(Stack *s , void *element )
{
  int tmp ;

  {
  tmp = stackIsEmpty(s);
  if (tmp) {
    __assert_fail("!stackIsEmpty(s)", "src/src/stack.c", 62U, "stackPeek");
  }
  memcpy((void * __restrict )element, (void const * __restrict )(s->head)->element,
         (size_t )s->elementSize);
  return;
}
}
#pragma merger("0","src/src/triangle.i","-g,-g")
extern int scanf(char const * __restrict __format , ...) __asm__("__isoc99_scanf") ;
void createCDG(void)
{


  {
  addtoCDGnode(0, 0, 0);
  addtoCDGnode(1, 0, 1);
  addtoCDGnode(2, 0, 1);
  setArray(2, "(< side1 0)");
  addtoCDGnode(3, 2, 1);
  addtoCDGnode(4, 2, 0);
  setArray(4, "(< side2 0)");
  addtoCDGnode(42, 0, 1);
  addtoCDGnode(5, 4, 1);
  addtoCDGnode(6, 4, 0);
  setArray(6, "(< side3 0)");
  addtoCDGnode(42, 0, 1);
  addtoCDGnode(7, 6, 1);
  addtoCDGnode(8, 6, 0);
  addtoCDGnode(42, 0, 1);
  addtoCDGnode(9, 6, 0);
  setArray(9, "(= side1 side2)");
  addtoCDGnode(10, 9, 1);
  addtoCDGnode(11, 9, 0);
  addtoCDGnode(12, 6, 0);
  setArray(12, "(= side2 side3)");
  addtoCDGnode(12, 6, 0);
  setArray(12, "(= side2 side3)");
  addtoCDGnode(13, 12, 1);
  addtoCDGnode(14, 12, 0);
  addtoCDGnode(15, 6, 0);
  setArray(15, "(= side1 side3)");
  addtoCDGnode(15, 6, 0);
  setArray(15, "(= side1 side3)");
  addtoCDGnode(16, 15, 1);
  addtoCDGnode(17, 15, 0);
  addtoCDGnode(18, 6, 0);
  addtoCDGnode(18, 6, 0);
  addtoCDGnode(19, 6, 0);
  setArray(19, "(= triang 0)");
  addtoCDGnode(20, 19, 1);
  setArray(20, "(< (+ side1 side2) side3)");
  addtoCDGnode(27, 19, 0);
  setArray(27, "(> triang 3)");
  addtoCDGnode(21, 20, 1);
  addtoCDGnode(22, 20, 0);
  setArray(22, "(< (+ side2 side3) side1)");
  addtoCDGnode(42, 0, 1);
  addtoCDGnode(23, 22, 1);
  addtoCDGnode(24, 22, 0);
  setArray(24, "(< (+ side1 side2) side3)");
  addtoCDGnode(42, 0, 1);
  addtoCDGnode(25, 24, 1);
  addtoCDGnode(26, 24, 0);
  addtoCDGnode(42, 0, 1);
  addtoCDGnode(42, 0, 1);
  addtoCDGnode(28, 27, 1);
  addtoCDGnode(29, 27, 0);
  setArray(29, "(= triang 1)");
  addtoCDGnode(42, 0, 1);
  addtoCDGnode(30, 29, 1);
  setArray(30, "(> (+ side1 side2) side3)");
  addtoCDGnode(33, 29, 0);
  setArray(33, "(= triang 2)");
  addtoCDGnode(31, 30, 1);
  addtoCDGnode(32, 30, 0);
  addtoCDGnode(42, 0, 1);
  addtoCDGnode(33, 30, 0);
  setArray(33, "(= triang 2)");
  addtoCDGnode(34, 33, 1);
  setArray(34, "(> (+ side2 side3) side1)");
  addtoCDGnode(37, 33, 0);
  setArray(37, "(= triang 3)");
  addtoCDGnode(35, 34, 1);
  addtoCDGnode(36, 34, 0);
  addtoCDGnode(42, 0, 1);
  addtoCDGnode(37, 34, 0);
  setArray(37, "(= triang 3)");
  addtoCDGnode(38, 37, 1);
  setArray(38, "(> (+ side1 side3) side2)");
  addtoCDGnode(41, 37, 0);
  addtoCDGnode(39, 38, 1);
  addtoCDGnode(40, 38, 0);
  addtoCDGnode(42, 0, 1);
  addtoCDGnode(42, 0, 1);
  addtoCDGnode(42, 0, 1);
  addtoCDGnode(43, 0, 1);
}
}
void isCopyOfHolder(void)
{


  {

}
}
void createSidTable(void)
{


  {
  add_condition(9, "(= side1 side2)", "(not (= side1 side2))", 0, 0);
  add_condition(12, "(= side2 side3)", "(not (= side2 side3))", 0, 0);
  add_condition(15, "(= side1 side3)", "(not (= side1 side3))", 0, 0);
  add_condition(24, "(< (+ side1 side2) side3)", "(not (< (+ side1 side2) side3))",
                0, 0);
  add_condition(22, "(< (+ side2 side3) side1)", "(not (< (+ side2 side3) side1))",
                0, 0);
  add_condition(20, "(< (+ side1 side2) side3)", "(not (< (+ side1 side2) side3))",
                0, 0);
  add_condition(30, "(> (+ side1 side2) side3)", "(not (> (+ side1 side2) side3))",
                0, 0);
  add_condition(34, "(> (+ side2 side3) side1)", "(not (> (+ side2 side3) side1))",
                0, 0);
  add_condition(38, "(> (+ side1 side3) side2)", "(not (> (+ side1 side3) side2))",
                0, 0);
  add_condition(37, "(= triang 3)", "(not (= triang 3))", 0, 0);
  add_condition(33, "(= triang 2)", "(not (= triang 2))", 0, 0);
  add_condition(29, "(= triang 1)", "(not (= triang 1))", 0, 0);
  add_condition(27, "(> triang 3)", "(not (> triang 3))", 0, 0);
  add_condition(19, "(= triang 0)", "(not (= triang 0))", 0, 0);
  add_condition(6, "(< side3 0)", "(not (< side3 0))", 0, 0);
  add_condition(4, "(< side2 0)", "(not (< side2 0))", 0, 0);
  add_condition(2, "(< side1 0)", "(not (< side1 0))", 0, 0);
}
}
struct arguments {
   int side1 ;
   int side2 ;
   int side3 ;
};
struct arguments argvar ;
int main1(int side1 , int side2 , int side3 )
{
  int triang ;
  int exp_outcome ;
  int overall_outcome ;
  int __cil_tmp7 ;
  char *__cil_tmp8 ;
  char *symName ;
  void *addr ;
  char in[15] ;

  {
  __cil_tmp8 = malloc(100 * sizeof(char ));
  add_entryToSTable("__cil_tmp8", "Function", & __cil_tmp8, & __cil_tmp8, -1);
  sprintf(__cil_tmp8, "\t%d\t%d\t%d\n", side1, side2, side3);
  printTestCase("triangle_main1_1432550377.tc", __cil_tmp8);
  add_entryToSTable("side3", "s2", & side3, & side3, 1);
  add_entryToSTable("side2", "s1", & side2, & side2, 1);
  add_entryToSTable("side1", "s0", & side1, & side1, 1);

  {
  exp_outcome = side1 < 0;
  handleAssignmentSymbolically("exp_outcome", "(< side1 0)", & exp_outcome, & exp_outcome,
                               1);
  overall_outcome = (int )getConditionalOutcome(2, exp_outcome);
  if (overall_outcome) {
    setBranchInfo(2, 1, 0);
    setTrueExpr(2, "(< side1 0)");
    setFalseExpr(2, "(not (< side1 0))");
    addToTree(2, 1, "(< side1 0)", "(not (< side1 0))", 0, 1);
    delete_allVariableTableEntry();
    printf((char const * __restrict )"Illegal arguments !! \n");
  } else {
    setBranchInfo(2, 0, 1);
    setTrueExpr(2, "(< side1 0)");
    setFalseExpr(2, "(not (< side1 0))");
    addToTree(2, 1, "(< side1 0)", "(not (< side1 0))", 0, 0);
    delete_allVariableTableEntry();
    {
    exp_outcome = side2 < 0;
    handleAssignmentSymbolically("exp_outcome", "(< side2 0)", & exp_outcome, & exp_outcome,
                                 1);
    overall_outcome = (int )getConditionalOutcome(4, exp_outcome);
    if (overall_outcome) {
      setBranchInfo(4, 1, 0);
      setTrueExpr(4, "(< side2 0)");
      setFalseExpr(4, "(not (< side2 0))");
      addToTree(4, 2, "(< side2 0)", "(not (< side2 0))", 2, 1);
      delete_allVariableTableEntry();
      printf((char const * __restrict )"Illegal arguments !! \n");
    } else {
      setBranchInfo(4, 0, 1);
      setTrueExpr(4, "(< side2 0)");
      setFalseExpr(4, "(not (< side2 0))");
      addToTree(4, 2, "(< side2 0)", "(not (< side2 0))", 2, 0);
      delete_allVariableTableEntry();
      {
      exp_outcome = side3 < 0;
      handleAssignmentSymbolically("exp_outcome", "(< side3 0)", & exp_outcome, & exp_outcome,
                                   1);
      overall_outcome = (int )getConditionalOutcome(6, exp_outcome);
      if (overall_outcome) {
        setBranchInfo(6, 1, 0);
        setTrueExpr(6, "(< side3 0)");
        setFalseExpr(6, "(not (< side3 0))");
        addToTree(6, 3, "(< side3 0)", "(not (< side3 0))", 4, 1);
        delete_allVariableTableEntry();
        printf((char const * __restrict )"Illegal arguments !! \n");
      } else {
        setBranchInfo(6, 0, 1);
        setTrueExpr(6, "(< side3 0)");
        setFalseExpr(6, "(not (< side3 0))");
        addToTree(6, 3, "(< side3 0)", "(not (< side3 0))", 4, 0);
        delete_allVariableTableEntry();
        triang = 0;
        add_entryToSTable("triang", "Constant", & triang, & triang, 1);
        {
        exp_outcome = side1 == side2;
        handleAssignmentSymbolically("exp_outcome", "(= side1 side2)", & exp_outcome,
                                     & exp_outcome, 1);
        overall_outcome = (int )getConditionalOutcome(9, exp_outcome);
        if (overall_outcome) {
          setBranchInfo(9, 1, 0);
          setTrueExpr(9, "(= side1 side2)");
          setFalseExpr(9, "(not (= side1 side2))");
          addToTree(9, 4, "(= side1 side2)", "(not (= side1 side2))", 6, 1);
          delete_allVariableTableEntry();
          triang ++;
          handleAssignmentSymbolically("triang", "(+ triang 1)", & triang, & triang,
                                       1);
        } else {
          setBranchInfo(9, 0, 1);
          setTrueExpr(9, "(= side1 side2)");
          setFalseExpr(9, "(not (= side1 side2))");
          addToTree(9, 4, "(= side1 side2)", "(not (= side1 side2))", 6, 0);
          delete_allVariableTableEntry();
          printf((char const * __restrict )"not equal side1 and side2 \n");
        }
        }
        {
        exp_outcome = side2 == side3;
        handleAssignmentSymbolically("exp_outcome", "(= side2 side3)", & exp_outcome,
                                     & exp_outcome, 1);
        overall_outcome = (int )getConditionalOutcome(12, exp_outcome);
        if (overall_outcome) {
          setBranchInfo(12, 1, 0);
          setTrueExpr(12, "(= side2 side3)");
          setFalseExpr(12, "(not (= side2 side3))");
          addToTree(12, 4, "(= side2 side3)", "(not (= side2 side3))", 6, 1);
          delete_allVariableTableEntry();
          triang += 2;
          handleAssignmentSymbolically("triang", "(+ triang 2)", & triang, & triang,
                                       1);
        } else {
          setBranchInfo(12, 0, 1);
          setTrueExpr(12, "(= side2 side3)");
          setFalseExpr(12, "(not (= side2 side3))");
          addToTree(12, 4, "(= side2 side3)", "(not (= side2 side3))", 6, 0);
          delete_allVariableTableEntry();
          printf((char const * __restrict )"not equal side2 and side3 \n");
        }
        }
        {
        exp_outcome = side1 == side3;
        handleAssignmentSymbolically("exp_outcome", "(= side1 side3)", & exp_outcome,
                                     & exp_outcome, 1);
        overall_outcome = (int )getConditionalOutcome(15, exp_outcome);
        if (overall_outcome) {
          setBranchInfo(15, 1, 0);
          setTrueExpr(15, "(= side1 side3)");
          setFalseExpr(15, "(not (= side1 side3))");
          addToTree(15, 4, "(= side1 side3)", "(not (= side1 side3))", 6, 1);
          delete_allVariableTableEntry();
          triang += 3;
          handleAssignmentSymbolically("triang", "(+ triang 3)", & triang, & triang,
                                       1);
        } else {
          setBranchInfo(15, 0, 1);
          setTrueExpr(15, "(= side1 side3)");
          setFalseExpr(15, "(not (= side1 side3))");
          addToTree(15, 4, "(= side1 side3)", "(not (= side1 side3))", 6, 0);
          delete_allVariableTableEntry();
          printf((char const * __restrict )"not equal side1 and side3 \n");
        }
        }
        printf((char const * __restrict )"side1=%d, side2=%d, side3=%d, triang = %d\n",
               side1, side2, side3, triang);
        {
        exp_outcome = triang == 0;
        handleAssignmentSymbolically("exp_outcome", "(= triang 0)", & exp_outcome,
                                     & exp_outcome, 1);
        overall_outcome = (int )getConditionalOutcome(19, exp_outcome);
        if (overall_outcome) {
          setBranchInfo(19, 1, 0);
          setTrueExpr(19, "(= triang 0)");
          setFalseExpr(19, "(not (= triang 0))");
          addToTree(19, 4, "(= triang 0)", "(not (= triang 0))", 6, 1);
          delete_allVariableTableEntry();
          {
          exp_outcome = side1 + side2 < side3;
          handleAssignmentSymbolically("exp_outcome", "(< (+ side1 side2) side3)",
                                       & exp_outcome, & exp_outcome, 1);
          overall_outcome = (int )getConditionalOutcome(20, exp_outcome);
          if (overall_outcome) {
            setBranchInfo(20, 1, 0);
            setTrueExpr(20, "(< (+ side1 side2) side3)");
            setFalseExpr(20, "(not (< (+ side1 side2) side3))");
            addToTree(20, 5, "(< (+ side1 side2) side3)", "(not (< (+ side1 side2) side3))",
                      19, 1);
            delete_allVariableTableEntry();
            printf((char const * __restrict )"Illegal arguments !! \n");
          } else {
            setBranchInfo(20, 0, 1);
            setTrueExpr(20, "(< (+ side1 side2) side3)");
            setFalseExpr(20, "(not (< (+ side1 side2) side3))");
            addToTree(20, 5, "(< (+ side1 side2) side3)", "(not (< (+ side1 side2) side3))",
                      19, 0);
            delete_allVariableTableEntry();
            {
            exp_outcome = side2 + side3 < side1;
            handleAssignmentSymbolically("exp_outcome", "(< (+ side2 side3) side1)",
                                         & exp_outcome, & exp_outcome, 1);
            overall_outcome = (int )getConditionalOutcome(22, exp_outcome);
            if (overall_outcome) {
              setBranchInfo(22, 1, 0);
              setTrueExpr(22, "(< (+ side2 side3) side1)");
              setFalseExpr(22, "(not (< (+ side2 side3) side1))");
              addToTree(22, 6, "(< (+ side2 side3) side1)", "(not (< (+ side2 side3) side1))",
                        20, 1);
              delete_allVariableTableEntry();
              printf((char const * __restrict )"Illegal arguments !! \n");
            } else {
              setBranchInfo(22, 0, 1);
              setTrueExpr(22, "(< (+ side2 side3) side1)");
              setFalseExpr(22, "(not (< (+ side2 side3) side1))");
              addToTree(22, 6, "(< (+ side2 side3) side1)", "(not (< (+ side2 side3) side1))",
                        20, 0);
              delete_allVariableTableEntry();
              {
              exp_outcome = side1 + side2 < side3;
              handleAssignmentSymbolically("exp_outcome", "(< (+ side1 side2) side3)",
                                           & exp_outcome, & exp_outcome, 1);
              overall_outcome = (int )getConditionalOutcome(24, exp_outcome);
              if (overall_outcome) {
                setBranchInfo(24, 1, 0);
                setTrueExpr(24, "(< (+ side1 side2) side3)");
                setFalseExpr(24, "(not (< (+ side1 side2) side3))");
                addToTree(24, 7, "(< (+ side1 side2) side3)", "(not (< (+ side1 side2) side3))",
                          22, 1);
                delete_allVariableTableEntry();
                printf((char const * __restrict )"Illegal arguments !! \n");
              } else {
                setBranchInfo(24, 0, 1);
                setTrueExpr(24, "(< (+ side1 side2) side3)");
                setFalseExpr(24, "(not (< (+ side1 side2) side3))");
                addToTree(24, 7, "(< (+ side1 side2) side3)", "(not (< (+ side1 side2) side3))",
                          22, 0);
                delete_allVariableTableEntry();
                printf((char const * __restrict )"Scalene triangle \n");
              }
              }
            }
            }
          }
          }
        } else {
          setBranchInfo(19, 0, 1);
          setTrueExpr(19, "(= triang 0)");
          setFalseExpr(19, "(not (= triang 0))");
          addToTree(19, 4, "(= triang 0)", "(not (= triang 0))", 6, 0);
          delete_allVariableTableEntry();
          {
          exp_outcome = triang > 3;
          handleAssignmentSymbolically("exp_outcome", "(> triang 3)", & exp_outcome,
                                       & exp_outcome, 1);
          overall_outcome = (int )getConditionalOutcome(27, exp_outcome);
          if (overall_outcome) {
            setBranchInfo(27, 1, 0);
            setTrueExpr(27, "(> triang 3)");
            setFalseExpr(27, "(not (> triang 3))");
            addToTree(27, 5, "(> triang 3)", "(not (> triang 3))", 19, 1);
            delete_allVariableTableEntry();
            printf((char const * __restrict )"Equilateral triangle \n");
          } else {
            setBranchInfo(27, 0, 1);
            setTrueExpr(27, "(> triang 3)");
            setFalseExpr(27, "(not (> triang 3))");
            addToTree(27, 5, "(> triang 3)", "(not (> triang 3))", 19, 0);
            delete_allVariableTableEntry();
            {
            exp_outcome = triang == 1;
            handleAssignmentSymbolically("exp_outcome", "(= triang 1)", & exp_outcome,
                                         & exp_outcome, 1);
            overall_outcome = (int )getConditionalOutcome(29, exp_outcome);
            if (overall_outcome) {
              setBranchInfo(29, 1, 0);
              setTrueExpr(29, "(= triang 1)");
              setFalseExpr(29, "(not (= triang 1))");
              addToTree(29, 6, "(= triang 1)", "(not (= triang 1))", 27, 1);
              delete_allVariableTableEntry();
              {
              exp_outcome = side1 + side2 > side3;
              handleAssignmentSymbolically("exp_outcome", "(> (+ side1 side2) side3)",
                                           & exp_outcome, & exp_outcome, 1);
              overall_outcome = (int )getConditionalOutcome(30, exp_outcome);
              if (overall_outcome) {
                setBranchInfo(30, 1, 0);
                setTrueExpr(30, "(> (+ side1 side2) side3)");
                setFalseExpr(30, "(not (> (+ side1 side2) side3))");
                addToTree(30, 7, "(> (+ side1 side2) side3)", "(not (> (+ side1 side2) side3))",
                          29, 1);
                delete_allVariableTableEntry();
                printf((char const * __restrict )"Isosceles triangle \n");
              } else {
                setBranchInfo(30, 0, 1);
                setTrueExpr(30, "(> (+ side1 side2) side3)");
                setFalseExpr(30, "(not (> (+ side1 side2) side3))");
                addToTree(30, 7, "(> (+ side1 side2) side3)", "(not (> (+ side1 side2) side3))",
                          29, 0);
                delete_allVariableTableEntry();
                goto _L___0;
              }
              }
            } else {
              setBranchInfo(29, 0, 1);
              setTrueExpr(29, "(= triang 1)");
              setFalseExpr(29, "(not (= triang 1))");
              addToTree(29, 6, "(= triang 1)", "(not (= triang 1))", 27, 0);
              delete_allVariableTableEntry();
              _L___0:
              {
              exp_outcome = triang == 2;
              handleAssignmentSymbolically("exp_outcome", "(= triang 2)", & exp_outcome,
                                           & exp_outcome, 1);
              overall_outcome = (int )getConditionalOutcome(33, exp_outcome);
              if (overall_outcome) {
                setBranchInfo(33, 1, 0);
                setTrueExpr(33, "(= triang 2)");
                setFalseExpr(33, "(not (= triang 2))");
                addToTree(33, 7, "(= triang 2)", "(not (= triang 2))", 29, 1);
                delete_allVariableTableEntry();
                {
                exp_outcome = side2 + side3 > side1;
                handleAssignmentSymbolically("exp_outcome", "(> (+ side2 side3) side1)",
                                             & exp_outcome, & exp_outcome, 1);
                overall_outcome = (int )getConditionalOutcome(34, exp_outcome);
                if (overall_outcome) {
                  setBranchInfo(34, 1, 0);
                  setTrueExpr(34, "(> (+ side2 side3) side1)");
                  setFalseExpr(34, "(not (> (+ side2 side3) side1))");
                  addToTree(34, 8, "(> (+ side2 side3) side1)", "(not (> (+ side2 side3) side1))",
                            33, 1);
                  delete_allVariableTableEntry();
                  printf((char const * __restrict )"Isosceles triangle \n");
                } else {
                  setBranchInfo(34, 0, 1);
                  setTrueExpr(34, "(> (+ side2 side3) side1)");
                  setFalseExpr(34, "(not (> (+ side2 side3) side1))");
                  addToTree(34, 8, "(> (+ side2 side3) side1)", "(not (> (+ side2 side3) side1))",
                            33, 0);
                  delete_allVariableTableEntry();
                  goto _L;
                }
                }
              } else {
                setBranchInfo(33, 0, 1);
                setTrueExpr(33, "(= triang 2)");
                setFalseExpr(33, "(not (= triang 2))");
                addToTree(33, 7, "(= triang 2)", "(not (= triang 2))", 29, 0);
                delete_allVariableTableEntry();
                _L:
                {
                exp_outcome = triang == 3;
                handleAssignmentSymbolically("exp_outcome", "(= triang 3)", & exp_outcome,
                                             & exp_outcome, 1);
                overall_outcome = (int )getConditionalOutcome(37, exp_outcome);
                if (overall_outcome) {
                  setBranchInfo(37, 1, 0);
                  setTrueExpr(37, "(= triang 3)");
                  setFalseExpr(37, "(not (= triang 3))");
                  addToTree(37, 8, "(= triang 3)", "(not (= triang 3))", 33, 1);
                  delete_allVariableTableEntry();
                  {
                  exp_outcome = side1 + side3 > side2;
                  handleAssignmentSymbolically("exp_outcome", "(> (+ side1 side3) side2)",
                                               & exp_outcome, & exp_outcome, 1);
                  overall_outcome = (int )getConditionalOutcome(38, exp_outcome);
                  if (overall_outcome) {
                    setBranchInfo(38, 1, 0);
                    setTrueExpr(38, "(> (+ side1 side3) side2)");
                    setFalseExpr(38, "(not (> (+ side1 side3) side2))");
                    addToTree(38, 9, "(> (+ side1 side3) side2)", "(not (> (+ side1 side3) side2))",
                              37, 1);
                    delete_allVariableTableEntry();
                    printf((char const * __restrict )"Isosceles triangle \n");
                  } else {
                    setBranchInfo(38, 0, 1);
                    setTrueExpr(38, "(> (+ side1 side3) side2)");
                    setFalseExpr(38, "(not (> (+ side1 side3) side2))");
                    addToTree(38, 9, "(> (+ side1 side3) side2)", "(not (> (+ side1 side3) side2))",
                              37, 0);
                    delete_allVariableTableEntry();
                    printf((char const * __restrict )"ILLegal !!! \n");
                  }
                  }
                } else {
                  setBranchInfo(37, 0, 1);
                  setTrueExpr(37, "(= triang 3)");
                  setFalseExpr(37, "(not (= triang 3))");
                  addToTree(37, 8, "(= triang 3)", "(not (= triang 3))", 33, 0);
                  delete_allVariableTableEntry();
                  printf((char const * __restrict )"ILLegal !!! \n");
                }
                }
              }
              }
            }
            }
          }
          }
        }
        }
      }
      }
    }
    }
  }
  }
  __cil_tmp7 = isNotQueueEmpty();
  if (__cil_tmp7) {
    enQueue();
    directPathConditions();
    delete_allSTableEntry();
    delete_allStructTableEntry();
    main1(side1, side2, side3);
  } else {
    __cil_tmp7 = startCDG();
    add_entryToSTable("__cil_tmp7", "Function", & __cil_tmp7, & __cil_tmp7, 1);
    if (__cil_tmp7) {
      __cil_tmp7 = getTestCases();
      main1(side1, side2, side3);
    }
  }
  return (0);
}
}
void getPrint(void)
{


  {
  printFile("(benchmark res\n  :logic AUFLIA\n");
}
}
void callInstrumentedFun(void)
{


  {
  enQueue();
  main1(argvar.side1, argvar.side2, argvar.side3);
}
}
void main(void)
{
  int side1 ;
  int side2 ;
  int side3 ;
  int temp ;
  int __cil_tmp2 ;
  int __cil_tmp3 ;
  int __cil_tmp4 ;

  {
  __cil_tmp4 = rand();
  argvar.side1 = __cil_tmp4 % 20;
  __cil_tmp3 = rand();
  argvar.side2 = __cil_tmp3 % 20;
  __cil_tmp2 = rand();
  argvar.side3 = __cil_tmp2 % 20;
  initSID();
  isCopyOfHolder();
  createCDG();
  createSidTable();
  callInstrumentedFun();
}
}
