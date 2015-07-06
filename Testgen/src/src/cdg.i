# 1 "src/src/cdg.c"
# 1 "/home/akshitij/Desktop/Testgen_Sonam/Testgen//"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "src/src/cdg.c"
# 1 "src/src/cdg.h" 1



# 1 "/usr/include/stdlib.h" 1 3 4
# 24 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 374 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 385 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 386 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 375 "/usr/include/features.h" 2 3 4
# 398 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 399 "/usr/include/features.h" 2 3 4
# 25 "/usr/include/stdlib.h" 2 3 4







# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 212 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 324 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 3 4
typedef int wchar_t;
# 33 "/usr/include/stdlib.h" 2 3 4








# 1 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 1 3 4
# 50 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 3 4
typedef enum
{
  P_ALL,
  P_PID,
  P_PGID
} idtype_t;
# 42 "/usr/include/stdlib.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 1 3 4
# 64 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 36 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/endian.h" 1 3 4
# 37 "/usr/include/endian.h" 2 3 4
# 60 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;







typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
# 121 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/typesizes.h" 1 3 4
# 122 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;
# 28 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 29 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4






# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h" 1 3 4
# 36 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4
# 44 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
static __inline unsigned int
__bswap_32 (unsigned int __bsx)
{
  return __builtin_bswap32 (__bsx);
}
# 108 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{
  return __builtin_bswap64 (__bsx);
}
# 61 "/usr/include/endian.h" 2 3 4
# 65 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 2 3 4

union wait
  {
    int w_status;
    struct
      {

 unsigned int __w_termsig:7;
 unsigned int __w_coredump:1;
 unsigned int __w_retcode:8;
 unsigned int:16;







      } __wait_terminated;
    struct
      {

 unsigned int __w_stopval:8;
 unsigned int __w_stopsig:8;
 unsigned int:16;






      } __wait_stopped;
  };
# 43 "/usr/include/stdlib.h" 2 3 4
# 67 "/usr/include/stdlib.h" 3 4
typedef union
  {
    union wait *__uptr;
    int *__iptr;
  } __WAIT_STATUS __attribute__ ((__transparent_union__));
# 95 "/usr/include/stdlib.h" 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;







__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;


# 139 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , __leaf__)) ;




extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

# 305 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) __attribute__ ((__nothrow__ , __leaf__)) ;


extern long int a64l (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;




# 1 "/usr/include/x86_64-linux-gnu/sys/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4






typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;




typedef __loff_t loff_t;



typedef __ino_t ino_t;
# 60 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;
# 98 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __pid_t pid_t;





typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;
# 132 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/time.h" 1 3 4
# 57 "/usr/include/time.h" 3 4


typedef __clock_t clock_t;



# 73 "/usr/include/time.h" 3 4


typedef __time_t time_t;



# 91 "/usr/include/time.h" 3 4
typedef __clockid_t clockid_t;
# 103 "/usr/include/time.h" 3 4
typedef __timer_t timer_t;
# 133 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4
# 146 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 147 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
# 194 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));


typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));
# 219 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/select.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/select.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/select.h" 2 3 4
# 31 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/sigset.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/sigset.h" 3 4
typedef int __sig_atomic_t;




typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;
# 34 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4



typedef __sigset_t sigset_t;





# 1 "/usr/include/time.h" 1 3 4
# 120 "/usr/include/time.h" 3 4
struct timespec
  {
    __time_t tv_sec;
    __syscall_slong_t tv_nsec;
  };
# 44 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/time.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/bits/time.h" 3 4
struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
# 46 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4


typedef __suseconds_t suseconds_t;





typedef long int __fd_mask;
# 64 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef struct
  {






    __fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];


  } fd_set;






typedef __fd_mask fd_mask;
# 96 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4

# 106 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 118 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);
# 131 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4

# 220 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 3 4


__extension__
extern unsigned int gnu_dev_major (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
            unsigned int __minor)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 58 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 3 4

# 223 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4





typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 270 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 2 3 4
# 60 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
typedef unsigned long int pthread_t;


union pthread_attr_t
{
  char __size[56];
  long int __align;
};

typedef union pthread_attr_t pthread_attr_t;





typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
# 90 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;

    unsigned int __nusers;



    int __kind;

    short __spins;
    short __elision;
    __pthread_list_t __list;
# 124 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
  } __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;





typedef union
{

  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;
    int __writer;
    int __shared;
    unsigned long int __pad1;
    unsigned long int __pad2;


    unsigned int __flags;

  } __data;
# 211 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 271 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



# 315 "/usr/include/stdlib.h" 2 3 4






extern long int random (void) __attribute__ ((__nothrow__ , __leaf__));


extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));






extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));




extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ , __leaf__));







extern double drand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) __attribute__ ((__nothrow__ , __leaf__));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    __extension__ unsigned long long int __a;

  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));









extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;










extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));




extern void cfree (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));



# 1 "/usr/include/alloca.h" 1 3 4
# 24 "/usr/include/alloca.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 25 "/usr/include/alloca.h" 2 3 4







extern void *alloca (size_t __size) __attribute__ ((__nothrow__ , __leaf__));






# 493 "/usr/include/stdlib.h" 2 3 4





extern void *valloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 513 "/usr/include/stdlib.h" 3 4


extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 530 "/usr/include/stdlib.h" 3 4





extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));













extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));






extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;

# 578 "/usr/include/stdlib.h" 3 4
extern int putenv (char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int setenv (const char *__name, const char *__value, int __replace)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern int clearenv (void) __attribute__ ((__nothrow__ , __leaf__));
# 606 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 620 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 642 "/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
# 663 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 712 "/usr/include/stdlib.h" 3 4





extern int system (const char *__command) ;

# 734 "/usr/include/stdlib.h" 3 4
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__ , __leaf__)) ;






typedef int (*__compar_fn_t) (const void *, const void *);
# 752 "/usr/include/stdlib.h" 3 4



extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;







extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
# 775 "/usr/include/stdlib.h" 3 4
extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;



__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;







extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;




__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;

# 812 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));






extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__));



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__));








extern int rpmatch (const char *__response) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 899 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3))) ;
# 951 "/usr/include/stdlib.h" 3 4
extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h" 1 3 4
# 956 "/usr/include/stdlib.h" 2 3 4
# 968 "/usr/include/stdlib.h" 3 4

# 5 "src/src/cdg.h" 2
# 1 "src/src/stack.h" 1




# 1 "/usr/include/string.h" 1 3 4
# 27 "/usr/include/string.h" 3 4





# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 33 "/usr/include/string.h" 2 3 4
# 44 "/usr/include/string.h" 3 4


extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));






extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));





extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 96 "/usr/include/string.h" 3 4
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 127 "/usr/include/string.h" 3 4


extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));






# 1 "/usr/include/xlocale.h" 1 3 4
# 27 "/usr/include/xlocale.h" 3 4
typedef struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
} *__locale_t;


typedef __locale_t locale_t;
# 164 "/usr/include/string.h" 2 3 4


extern int strcoll_l (const char *__s1, const char *__s2, __locale_t __l)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    __locale_t __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));





extern char *strdup (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 211 "/usr/include/string.h" 3 4

# 236 "/usr/include/string.h" 3 4
extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 263 "/usr/include/string.h" 3 4
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 282 "/usr/include/string.h" 3 4



extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 315 "/usr/include/string.h" 3 4
extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 342 "/usr/include/string.h" 3 4
extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
# 397 "/usr/include/string.h" 3 4


extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern size_t strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));

# 427 "/usr/include/string.h" 3 4
extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ ("" "__xpg_strerror_r") __attribute__ ((__nothrow__ , __leaf__))

                        __attribute__ ((__nonnull__ (2)));
# 445 "/usr/include/string.h" 3 4
extern char *strerror_l (int __errnum, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));





extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern void bcopy (const void *__src, void *__dest, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 489 "/usr/include/string.h" 3 4
extern char *index (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 517 "/usr/include/string.h" 3 4
extern char *rindex (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern int ffs (int __i) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 534 "/usr/include/string.h" 3 4
extern int strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 557 "/usr/include/string.h" 3 4
extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__));


extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
# 644 "/usr/include/string.h" 3 4

# 6 "src/src/stack.h" 2
# 1 "/usr/include/assert.h" 1 3 4
# 66 "/usr/include/assert.h" 3 4



extern void __assert_fail (const char *__assertion, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));


extern void __assert_perror_fail (int __errnum, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));




extern void __assert (const char *__assertion, const char *__file, int __line)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



# 7 "src/src/stack.h" 2

typedef struct node{
  void *element;
  struct node *next;
} node;

typedef struct {
  int elementSize;
  int elementsCnt;
  node *head;
} Stack;






Stack* stackNew(int element_size);






void stackPush(Stack *s, const void *element);






void stackPop(Stack *s, void *element);





int stackIsEmpty(Stack *s);





void stackFree(Stack *s);





int stackSize(Stack *s);






void stackPeek(Stack *s, void *element);
# 6 "src/src/cdg.h" 2
# 18 "src/src/cdg.h"
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


CDGNode* pathNode[100] = {((void *)0)};





CDGNode* newNode(int id, int score, int outcome, const char* expr, CDGNode* trueNodeSet, CDGNode* falseNodeSet, CDGNode* parent, CDGNode* next);





CDGNode* newBlankNode();




CDGNode* addDummyNodes(CDGNode* root);







void deleteNode(CDGNode* node);





int getID(CDGNode* node);





CDGNode* setID(CDGNode* node, int id);





int getScore(CDGNode* node);





CDGNode* setScore(CDGNode* node, int score);




int getOutcome(CDGNode* node);





CDGNode* setOutcome(CDGNode* node, int outcome);





char* getExpr(CDGNode* node);






CDGNode* setExpr(CDGNode* node, const char* expr);





CDGNode* getTrueNodeSet(CDGNode* node);





CDGNode* getFalseNodeSet(CDGNode* node);






CDGNode* addTrueNode(CDGNode* node, CDGNode* trueNode);







CDGNode* addFalseNode(CDGNode* node, CDGNode* falseNode);





CDGNode* getParent(CDGNode* node);





CDGNode* setParent(CDGNode* node, CDGNode* parentNode);




CDGNode* getNextNode(CDGNode* node);




CDGNode* setNextNode(CDGNode* node, CDGNode* next);
# 162 "src/src/cdg.h"
CDGNode* updateScore(CDGNode* node, int initialize);







CDGNode* updateCDG(CDGNode* node, int initialize);







void coverNodes(CDGNode* root, CDGNode* nodes[], int size);




void deleteCDG(CDGNode* root);






typedef struct CDGPath {
  struct CDGNode* node;
  struct CDGPath* next;
} CDGPath;




CDGNode* getPathNode(CDGPath* path);




CDGPath* getNextPath(CDGPath* path);




typedef struct CDGContext{
  struct CDGPath* topPaths;
} CDGContext;
# 219 "src/src/cdg.h"
CDGPath* getTopPaths(CDGContext* ctx, CDGNode* node, int numberOfPaths);





CDGNode* getFeasibleSatNodes(CDGContext* ctx, int pathRank, CDGNode* nodeList);





int getPathLength(CDGNode* path);





void deletePaths(CDGPath* path);
# 2 "src/src/cdg.c" 2

int max(int a, int b) {
  return a > b ? a : b;
}

void pushNodeListToStack(Stack * s, CDGNode * node) {
  ((((void *)0) != node) ? (void) (0) : __assert_fail ("((void *)0) != node", "src/src/cdg.c", 8, __PRETTY_FUNCTION__));

  do {
    stackPush(s, &node);
    node = getNextNode(node);
  } while (node);
}

void postOrder(CDGNode * root, Stack * s) {
  if (((void *)0) == root)
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

  while (curr != ((void *)0)) {
    setScore(curr, score);
    curr = curr->next;
  }

  return node;
}

CDGNode *setFalseNodeSetScore(CDGNode * node, int score) {

  CDGNode *curr;
  curr = getFalseNodeSet(node);

  while (curr != ((void *)0)) {
    setScore(curr, score);
    curr = curr->next;
  }

  return node;
}

CDGNode *getLastNode(CDGNode * node) {
  ((((void *)0) != node) ? (void) (0) : __assert_fail ("((void *)0) != node", "src/src/cdg.c", 88, __PRETTY_FUNCTION__));
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
  while (node != ((void *)0)) {
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
  if (branch && ((void *)0) == getTrueNodeSet(node))
    return 0;
  if (0 == branch && ((void *)0) == getFalseNodeSet(node))
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
  if (((void *)0) != node->expr)
    free(node->expr);
  return node;
}

CDGNode *resetTrueNodeSet(CDGNode * node) {
  node->trueNodeSet = ((void *)0);
  return node;
}

CDGNode *resetFalseNodeSet(CDGNode * node) {
  node->falseNodeSet = ((void *)0);
  return node;
}

CDGNode *resetParent(CDGNode * node) {
  node->parent = ((void *)0);
  return node;
}

CDGNode *resetNextNode(CDGNode * node) {
  node->next = ((void *)0);
  return node;
}

CDGNode *getMaxScoreConditionNode(CDGNode * node) {
  CDGNode *out = ((void *)0);
  do {
    if (!isLeaf(node) && 0 < getScore(node)) {
      if ((((void *)0) == out) || (getScore(out) < getScore(node))) {
 out = node;
      }
    }
    node = getNextNode(node);
  } while (((void *)0) != node);
  return out;
}

CDGNode *getMaxScoreConditionChildNode(CDGNode * node, int *outcome) {
  CDGNode *maxTrue = ((void *)0);
  CDGNode *maxFalse = ((void *)0);
  if (getTrueNodeSet(node)) {
    maxTrue = getMaxScoreConditionNode(getTrueNodeSet(node));
  }
  if (getFalseNodeSet(node)) {
    maxFalse = getMaxScoreConditionNode(getFalseNodeSet(node));
  }
  if (((void *)0) == maxFalse) {
    *outcome = 1;
    return maxTrue;
  }
  if (((void *)0) == maxTrue) {
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
  ((((void *)0) != node) ? (void) (0) : __assert_fail ("((void *)0) != node", "src/src/cdg.c", 233, __PRETTY_FUNCTION__));
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
  return newNode(-1, 1, 1, ((void *)0), ((void *)0), ((void *)0), ((void *)0), ((void *)0));
}

void deleteNode(CDGNode * node) {
  ((((void *)0) != node) ? (void) (0) : __assert_fail ("((void *)0) != node", "src/src/cdg.c", 250, __PRETTY_FUNCTION__));





  free(node);
}

void deleteNodeList(CDGNode * node) {
  ((((void *)0) != node) ? (void) (0) : __assert_fail ("((void *)0) != node", "src/src/cdg.c", 260, __PRETTY_FUNCTION__));
  CDGNode *next;
  do {
    next = getNextNode(node);
    deleteNode(node);
    node = next;
  } while (node);
}

void deleteCDG(CDGNode * root) {
  if (((void *)0) == root)
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

  if (node->expr != ((void *)0))
    return node->expr;

  return ((void *)0);
}

CDGNode *setExpr(CDGNode * node, const char *expr) {
  if (((void *)0) == expr) {
    node->expr = ((void *)0);
    return node;
  }
  node->expr = (char *)malloc(sizeof(char) * (strlen(expr) + 1));
  strcpy(node->expr, expr);
  return node;
}

CDGNode *addTrueNode(CDGNode * node, CDGNode * trueNode) {
  if (((void *)0) == trueNode)
    return node;
  trueNode->next = node->trueNodeSet;
  node->trueNodeSet = trueNode;
  setParent(trueNode, node);
  return node;
}

CDGNode *addFalseNode(CDGNode * node, CDGNode * falseNode) {
  if (((void *)0) == falseNode)
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
  ((((void *)0) != node) ? (void) (0) : __assert_fail ("((void *)0) != node", "src/src/cdg.c", 360, __PRETTY_FUNCTION__));

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
  ((((void *)0) != node) ? (void) (0) : __assert_fail ("((void *)0) != node", "src/src/cdg.c", 448, __PRETTY_FUNCTION__));
  do {
    if (isLeaf(node) && 1 == getScore(node)) {
      setScore(node, 0);
      return node;
    }
    node = getNextNode(node);
  } while (node);
  return ((void *)0);
}

CDGNode *visitAnyOneChild(CDGNode * node) {
  CDGNode *child = ((void *)0);
  if (getFalseNodeSet(node)) {
    child = visitAnyOneNode(getFalseNodeSet(node));
  }
  if (((void *)0) == child && getTrueNodeSet(node)) {
    child = visitAnyOneNode(getTrueNodeSet(node));
  }

  ((((void *)0) != child) ? (void) (0) : __assert_fail ("((void *)0) != child", "src/src/cdg.c", 468, __PRETTY_FUNCTION__));
  return child;
}

CDGNode *unVisitNode(CDGNode * node) {
  return setScore(node, 1);
}

CDGNode *updateCDG(CDGNode * root, int initialize) {
  int size = sizeof(CDGNode *);

  ((((void *)0) != root) ? (void) (0) : __assert_fail ("((void *)0) != root", "src/src/cdg.c", 479, __PRETTY_FUNCTION__));
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
  ((((void *)0) != root) ? (void) (0) : __assert_fail ("((void *)0) != root", "src/src/cdg.c", 519, __PRETTY_FUNCTION__));
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
  ((((void *)0) != path) ? (void) (0) : __assert_fail ("((void *)0) != path", "src/src/cdg.c", 534, __PRETTY_FUNCTION__));
  path->node = node;
  return path;
}

CDGPath *setNextPath(CDGPath * path, CDGPath * nextPath) {
  ((((void *)0) != path) ? (void) (0) : __assert_fail ("((void *)0) != path", "src/src/cdg.c", 540, __PRETTY_FUNCTION__));
  path->next = nextPath;
  return path;
}

CDGPath *newPath() {
  CDGPath *path;
  path = (CDGPath *) malloc(sizeof(CDGPath));
  ((((void *)0) != path) ? (void) (0) : __assert_fail ("((void *)0) != path", "src/src/cdg.c", 548, __PRETTY_FUNCTION__));
  setPathNode(path, ((void *)0));
  setNextPath(path, ((void *)0));
  return path;
}

CDGNode *getPathNode(CDGPath * path) {
  ((((void *)0) != path) ? (void) (0) : __assert_fail ("((void *)0) != path", "src/src/cdg.c", 555, __PRETTY_FUNCTION__));
  return path->node;
}

CDGPath *getNextPath(CDGPath * path) {
  ((((void *)0) != path) ? (void) (0) : __assert_fail ("((void *)0) != path", "src/src/cdg.c", 560, __PRETTY_FUNCTION__));
  return path->next;
}

CDGNode *copyToPathNode(CDGNode * pathNode, CDGNode * node) {
  ((((void *)0) != pathNode) ? (void) (0) : __assert_fail ("((void *)0) != pathNode", "src/src/cdg.c", 565, __PRETTY_FUNCTION__));
  setID(pathNode, getID(node));
  setExpr(pathNode, getExpr(node));
  setOutcome(pathNode, getOutcome(node));
  return pathNode;
}

CDGNode *pathToList(CDGNode * head) {
  ((((void *)0) != head) ? (void) (0) : __assert_fail ("((void *)0) != head", "src/src/cdg.c", 573, __PRETTY_FUNCTION__));
  Stack *nodeStack = stackNew(sizeof(CDGNode *));
  CDGNode *node;
  CDGNode *list = ((void *)0);
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
    pathNode = ((void *)0);
  } else {
    temp = pathNode;
    pathNode = getNextNode(pathNode);
    deleteNode(temp);
  }
  return pathNode;
}

CDGPath *getTopPaths(CDGContext * ctx, CDGNode * root, int numberOfPaths) {
  CDGPath *pathHead = ((void *)0);
  CDGNode *path;
  CDGPath *currPath;
  CDGNode *node;
  int branch;
  Stack *changedNodes = stackNew(sizeof(CDGNode *));
  Stack *changedBranches = stackNew(sizeof(int));
  while (numberOfPaths--) {
    path = getTopPath(root, changedNodes, changedBranches);
    if (((void *)0) == path)
      break;
    if (((void *)0) == pathHead) {
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


  (*ctx).topPaths = pathHead;


  if (((void *)0) == pathHead)
    return ((void *)0);


  CDGPath *outPathHead = ((void *)0);
  currPath = ((void *)0);
  path = ((void *)0);
  while (((void *)0) != pathHead) {
    path = getPathNode(pathHead);
    if (((void *)0) == outPathHead) {
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
  ((((void *)0) != path) ? (void) (0) : __assert_fail ("((void *)0) != path", "src/src/cdg.c", 686, __PRETTY_FUNCTION__));
  CDGPath *next;
  do {
    next = getNextPath(path);
    deleteNodeList(getPathNode(path));
    setNextPath(path, ((void *)0));
    free(path);
    path = next;
  } while (path);
}

CDGNode *addDummyNodes(CDGNode * node) {
  while (node) {
    if (!isLeaf(node)) {
      if (((void *)0) == getTrueNodeSet(node)) {
 addTrueNode(node, newBlankNode());
      } else if (((void *)0) == getFalseNodeSet(node)) {
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
  if (((void *)0) == node)
    return ((void *)0);
  if (id == getID(node))
    return node;

  CDGNode *temp = ((void *)0);






  return findNode(getNextNode(node), id);
}

int nodeExists(CDGNode * node, int id) {
  return ((void *)0) != findNode(node, id);
}

CDGNode *buildFeasiblePath(CDGNode * node, CDGNode * list) {
  while (node && 0 == nodeExists(list, getID(node))) {
    node = getNextNode(node);
  }

  if (((void *)0) == node)
    return ((void *)0);

  CDGNode *out = ((void *)0);
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
  ((((void *)0) != ctx) ? (void) (0) : __assert_fail ("((void *)0) != ctx", "src/src/cdg.c", 755, __PRETTY_FUNCTION__));
  ((((void *)0) != (*ctx).topPaths) ? (void) (0) : __assert_fail ("((void *)0) != (*ctx).topPaths", "src/src/cdg.c", 756, __PRETTY_FUNCTION__));
  CDGPath *topPath = (*ctx).topPaths;
  while (0 < pathRank--) {
    topPath = getNextPath(topPath);
  }
  return pathToList(getFeasiblePath(getPathNode(topPath), list));
}

int getPathLength(CDGNode * node) {
  if (((void *)0) == node)
    return 0;
  return 1 + getPathLength(getNextNode(node));
}
