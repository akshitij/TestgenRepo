# 1 "src/src/ipNonRec.c"
# 1 "/home/akshitij/Desktop/thesis/Testgen/Testgen_Sonam/Testgen//"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "src/src/ipNonRec.c"
# 1 "/usr/include/stdio.h" 1 3 4
# 27 "/usr/include/stdio.h" 3 4
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
# 28 "/usr/include/stdio.h" 2 3 4





# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 212 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 34 "/usr/include/stdio.h" 2 3 4

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
# 36 "/usr/include/stdio.h" 2 3 4
# 44 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 64 "/usr/include/stdio.h" 3 4
typedef struct _IO_FILE __FILE;
# 74 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/libio.h" 1 3 4
# 31 "/usr/include/libio.h" 3 4
# 1 "/usr/include/_G_config.h" 1 3 4
# 15 "/usr/include/_G_config.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 16 "/usr/include/_G_config.h" 2 3 4




# 1 "/usr/include/wchar.h" 1 3 4
# 82 "/usr/include/wchar.h" 3 4
typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value;
} __mbstate_t;
# 21 "/usr/include/_G_config.h" 2 3 4
typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 32 "/usr/include/libio.h" 2 3 4
# 49 "/usr/include/libio.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 50 "/usr/include/libio.h" 2 3 4
# 144 "/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;
# 154 "/usr/include/libio.h" 3 4
typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
# 177 "/usr/include/libio.h" 3 4
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
# 245 "/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
# 293 "/usr/include/libio.h" 3 4
  __off64_t _offset;
# 302 "/usr/include/libio.h" 3 4
  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;
  size_t __pad5;

  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
# 338 "/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);
# 390 "/usr/include/libio.h" 3 4
extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
# 434 "/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));

extern int _IO_peekc_locked (_IO_FILE *__fp);





extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 464 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 75 "/usr/include/stdio.h" 2 3 4




typedef __gnuc_va_list va_list;
# 90 "/usr/include/stdio.h" 3 4
typedef __off_t off_t;
# 102 "/usr/include/stdio.h" 3 4
typedef __ssize_t ssize_t;







typedef _G_fpos_t fpos_t;




# 164 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h" 1 3 4
# 165 "/usr/include/stdio.h" 2 3 4



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;







extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __leaf__));

extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ , __leaf__));




extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) __attribute__ ((__nothrow__ , __leaf__));








extern FILE *tmpfile (void) ;
# 209 "/usr/include/stdio.h" 3 4
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;





extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;
# 227 "/usr/include/stdio.h" 3 4
extern char *tempnam (const char *__dir, const char *__pfx)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;








extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

# 252 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 266 "/usr/include/stdio.h" 3 4






extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes) ;




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 295 "/usr/include/stdio.h" 3 4

# 306 "/usr/include/stdio.h" 3 4
extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ , __leaf__)) ;
# 319 "/usr/include/stdio.h" 3 4
extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ , __leaf__)) ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ , __leaf__)) ;






extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));





extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ , __leaf__));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));








extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));





extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));

# 412 "/usr/include/stdio.h" 3 4
extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));








extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));
# 443 "/usr/include/stdio.h" 3 4
extern int fscanf (FILE *__restrict __stream, const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf")

                               ;
extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf")
                              ;
extern int sscanf (const char *__restrict __s, const char *__restrict __format, ...) __asm__ ("" "__isoc99_sscanf") __attribute__ ((__nothrow__ , __leaf__))

                      ;
# 463 "/usr/include/stdio.h" 3 4








extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 494 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")

     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (const char *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf") __attribute__ ((__nothrow__ , __leaf__))



     __attribute__ ((__format__ (__scanf__, 2, 0)));
# 522 "/usr/include/stdio.h" 3 4









extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);

# 550 "/usr/include/stdio.h" 3 4
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 561 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);











extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);

# 594 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);








extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;
# 638 "/usr/include/stdio.h" 3 4
extern char *gets (char *__s) __attribute__ ((__deprecated__));


# 665 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,
          FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,
        FILE *__restrict __stream) ;







extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,
       FILE *__restrict __stream) ;








extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);

# 737 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);








extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);

# 773 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) ;
# 792 "/usr/include/stdio.h" 3 4






extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, const fpos_t *__pos);
# 815 "/usr/include/stdio.h" 3 4

# 824 "/usr/include/stdio.h" 3 4


extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;




extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;








extern void perror (const char *__s);






# 1 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern const char *const sys_errlist[];
# 854 "/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
# 873 "/usr/include/stdio.h" 3 4
extern FILE *popen (const char *__command, const char *__modes) ;





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) __attribute__ ((__nothrow__ , __leaf__));
# 913 "/usr/include/stdio.h" 3 4
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
# 943 "/usr/include/stdio.h" 3 4

# 2 "src/src/ipNonRec.c" 2
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

# 3 "src/src/ipNonRec.c" 2
# 1 "/usr/include/stdlib.h" 1 3 4
# 32 "/usr/include/stdlib.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
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
# 28 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
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
# 98 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __pid_t pid_t;





typedef __id_t id_t;
# 115 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
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

# 4 "src/src/ipNonRec.c" 2
# 1 "src/src/uthash.h" 1
# 28 "src/src/uthash.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 1 3 4
# 147 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stddef.h" 3 4
typedef long int ptrdiff_t;
# 29 "src/src/uthash.h" 2
# 64 "src/src/uthash.h"
# 1 "/usr/include/inttypes.h" 1 3 4
# 27 "/usr/include/inttypes.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdint.h" 1 3 4
# 9 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdint.h" 3 4
# 1 "/usr/include/stdint.h" 1 3 4
# 26 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wchar.h" 1 3 4
# 27 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/stdint.h" 2 3 4
# 48 "/usr/include/stdint.h" 3 4
typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;

typedef unsigned int uint32_t;



typedef unsigned long int uint64_t;
# 65 "/usr/include/stdint.h" 3 4
typedef signed char int_least8_t;
typedef short int int_least16_t;
typedef int int_least32_t;

typedef long int int_least64_t;






typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;

typedef unsigned long int uint_least64_t;
# 90 "/usr/include/stdint.h" 3 4
typedef signed char int_fast8_t;

typedef long int int_fast16_t;
typedef long int int_fast32_t;
typedef long int int_fast64_t;
# 103 "/usr/include/stdint.h" 3 4
typedef unsigned char uint_fast8_t;

typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long int uint_fast64_t;
# 119 "/usr/include/stdint.h" 3 4
typedef long int intptr_t;


typedef unsigned long int uintptr_t;
# 134 "/usr/include/stdint.h" 3 4
typedef long int intmax_t;
typedef unsigned long int uintmax_t;
# 10 "/usr/lib/gcc/x86_64-linux-gnu/4.8/include/stdint.h" 2 3 4
# 28 "/usr/include/inttypes.h" 2 3 4






typedef int __gwchar_t;
# 266 "/usr/include/inttypes.h" 3 4





typedef struct
  {
    long int quot;
    long int rem;
  } imaxdiv_t;
# 290 "/usr/include/inttypes.h" 3 4
extern intmax_t imaxabs (intmax_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern imaxdiv_t imaxdiv (intmax_t __numer, intmax_t __denom)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern intmax_t strtoimax (const char *__restrict __nptr,
      char **__restrict __endptr, int __base) __attribute__ ((__nothrow__ , __leaf__));


extern uintmax_t strtoumax (const char *__restrict __nptr,
       char ** __restrict __endptr, int __base) __attribute__ ((__nothrow__ , __leaf__));


extern intmax_t wcstoimax (const __gwchar_t *__restrict __nptr,
      __gwchar_t **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__));


extern uintmax_t wcstoumax (const __gwchar_t *__restrict __nptr,
       __gwchar_t ** __restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__));
# 432 "/usr/include/inttypes.h" 3 4

# 65 "src/src/uthash.h" 2
# 878 "src/src/uthash.h"
typedef struct UT_hash_bucket {
   struct UT_hash_handle *hh_head;
   unsigned count;
# 894 "src/src/uthash.h"
   unsigned expand_mult;

} UT_hash_bucket;





typedef struct UT_hash_table {
   UT_hash_bucket *buckets;
   unsigned num_buckets, log2_num_buckets;
   unsigned num_items;
   struct UT_hash_handle *tail;
   ptrdiff_t hho;



   unsigned ideal_chain_maxlen;




   unsigned nonideal_items;







   unsigned ineff_expands, noexpand;

   uint32_t signature;






} UT_hash_table;

typedef struct UT_hash_handle {
   struct UT_hash_table *tbl;
   void *prev;
   void *next;
   struct UT_hash_handle *hh_prev;
   struct UT_hash_handle *hh_next;
   void *key;
   unsigned keylen;
   unsigned hashv;
} UT_hash_handle;
# 5 "src/src/ipNonRec.c" 2

extern int programFlag = 0;
extern void* ret_ConValue = ((void *)0);
extern char* ret_SymValue = ((void *)0);

typedef struct functionArgument{
     char funcName[100];
     int type;
     char vname[50];
     void* val;
     char apname[50];
     int isConstant;
}funcArg;

typedef struct {
    char** vars;
    int noOfVars;
    char funcName[100];

}funcVars;

typedef struct {
    char vname[50];
    char vname_occ[55];
     UT_hash_handle hh;
}vnameHash;

vnameHash* vnames = ((void *)0);
int stackInitFlag = 0;
void *symStack = ((void *)0);
int i=0;
char** varNames = ((void *)0);

void add_vnameHash(char* key, char* value) {
    vnameHash* v;
    do { unsigned _hf_bkt,_hf_hashv; v=((void *)0); if (vnames) { do { unsigned _hj_i,_hj_j,_hj_k; unsigned char *_hj_key=(unsigned char*)(key); _hf_hashv = 0xfeedbeef; _hj_i = _hj_j = 0x9e3779b9; _hj_k = (unsigned)(strlen(key)); while (_hj_k >= 12) { _hj_i += (_hj_key[0] + ( (unsigned)_hj_key[1] << 8 ) + ( (unsigned)_hj_key[2] << 16 ) + ( (unsigned)_hj_key[3] << 24 ) ); _hj_j += (_hj_key[4] + ( (unsigned)_hj_key[5] << 8 ) + ( (unsigned)_hj_key[6] << 16 ) + ( (unsigned)_hj_key[7] << 24 ) ); _hf_hashv += (_hj_key[8] + ( (unsigned)_hj_key[9] << 8 ) + ( (unsigned)_hj_key[10] << 16 ) + ( (unsigned)_hj_key[11] << 24 ) ); do { _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 13 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 8 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 13 ); _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 12 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 16 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 5 ); _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 3 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 10 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 15 ); } while (0); _hj_key += 12; _hj_k -= 12; } _hf_hashv += strlen(key); switch ( _hj_k ) { case 11: _hf_hashv += ( (unsigned)_hj_key[10] << 24 ); case 10: _hf_hashv += ( (unsigned)_hj_key[9] << 16 ); case 9: _hf_hashv += ( (unsigned)_hj_key[8] << 8 ); case 8: _hj_j += ( (unsigned)_hj_key[7] << 24 ); case 7: _hj_j += ( (unsigned)_hj_key[6] << 16 ); case 6: _hj_j += ( (unsigned)_hj_key[5] << 8 ); case 5: _hj_j += _hj_key[4]; case 4: _hj_i += ( (unsigned)_hj_key[3] << 24 ); case 3: _hj_i += ( (unsigned)_hj_key[2] << 16 ); case 2: _hj_i += ( (unsigned)_hj_key[1] << 8 ); case 1: _hj_i += _hj_key[0]; } do { _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 13 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 8 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 13 ); _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 12 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 16 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 5 ); _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 3 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 10 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 15 ); } while (0); _hf_bkt = _hf_hashv & ((vnames)->hh.tbl->num_buckets-1); } while(0); if ((1)) { do { if ((vnames)->hh.tbl->buckets[ _hf_bkt ].hh_head) do { (v) = (__typeof(v))(((void*)(((char*)((vnames)->hh.tbl->buckets[ _hf_bkt ].hh_head)) - (((vnames)->hh.tbl)->hho)))); } while(0); else v=((void *)0); while (v) { if ((v)->hh.keylen == strlen(key)) { if ((memcmp((v)->hh.key,key,strlen(key))) == 0) break; } if ((v)->hh.hh_next) do { (v) = (__typeof(v))(((void*)(((char*)((v)->hh.hh_next)) - (((vnames)->hh.tbl)->hho)))); } while(0); else v = ((void *)0); } } while(0); } } } while (0);
    if(v==((void *)0)){
 v = (vnameHash*)malloc(sizeof(vnameHash));
 strcpy(v->vname_occ,value);
 strcpy(v->vname,key);
        do { unsigned _ha_bkt; (v)->hh.next = ((void *)0); (v)->hh.key = (char*)(&((v)->vname[0])); (v)->hh.keylen = (unsigned)(strlen(v->vname)); if (!(vnames)) { vnames = (v); (vnames)->hh.prev = ((void *)0); do { (vnames)->hh.tbl = (UT_hash_table*)malloc(sizeof(UT_hash_table)); if (!((vnames)->hh.tbl)) { exit(-1); } memset((vnames)->hh.tbl, 0, sizeof(UT_hash_table)); (vnames)->hh.tbl->tail = &((vnames)->hh); (vnames)->hh.tbl->num_buckets = 32; (vnames)->hh.tbl->log2_num_buckets = 5; (vnames)->hh.tbl->hho = (char*)(&(vnames)->hh) - (char*)(vnames); (vnames)->hh.tbl->buckets = (UT_hash_bucket*)malloc(32*sizeof(struct UT_hash_bucket)); if (! (vnames)->hh.tbl->buckets) { exit(-1); } memset((vnames)->hh.tbl->buckets, 0, 32*sizeof(struct UT_hash_bucket)); ; (vnames)->hh.tbl->signature = 0xa0111fe1; } while(0); } else { (vnames)->hh.tbl->tail->next = (v); (v)->hh.prev = ((void*)(((char*)((vnames)->hh.tbl->tail)) - (((vnames)->hh.tbl)->hho))); (vnames)->hh.tbl->tail = &((v)->hh); } (vnames)->hh.tbl->num_items++; (v)->hh.tbl = (vnames)->hh.tbl; do { unsigned _hj_i,_hj_j,_hj_k; unsigned char *_hj_key=(unsigned char*)(&((v)->vname[0])); (v)->hh.hashv = 0xfeedbeef; _hj_i = _hj_j = 0x9e3779b9; _hj_k = (unsigned)(strlen(v->vname)); while (_hj_k >= 12) { _hj_i += (_hj_key[0] + ( (unsigned)_hj_key[1] << 8 ) + ( (unsigned)_hj_key[2] << 16 ) + ( (unsigned)_hj_key[3] << 24 ) ); _hj_j += (_hj_key[4] + ( (unsigned)_hj_key[5] << 8 ) + ( (unsigned)_hj_key[6] << 16 ) + ( (unsigned)_hj_key[7] << 24 ) ); (v)->hh.hashv += (_hj_key[8] + ( (unsigned)_hj_key[9] << 8 ) + ( (unsigned)_hj_key[10] << 16 ) + ( (unsigned)_hj_key[11] << 24 ) ); do { _hj_i -= _hj_j; _hj_i -= (v)->hh.hashv; _hj_i ^= ( (v)->hh.hashv >> 13 ); _hj_j -= (v)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 8 ); (v)->hh.hashv -= _hj_i; (v)->hh.hashv -= _hj_j; (v)->hh.hashv ^= ( _hj_j >> 13 ); _hj_i -= _hj_j; _hj_i -= (v)->hh.hashv; _hj_i ^= ( (v)->hh.hashv >> 12 ); _hj_j -= (v)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 16 ); (v)->hh.hashv -= _hj_i; (v)->hh.hashv -= _hj_j; (v)->hh.hashv ^= ( _hj_j >> 5 ); _hj_i -= _hj_j; _hj_i -= (v)->hh.hashv; _hj_i ^= ( (v)->hh.hashv >> 3 ); _hj_j -= (v)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 10 ); (v)->hh.hashv -= _hj_i; (v)->hh.hashv -= _hj_j; (v)->hh.hashv ^= ( _hj_j >> 15 ); } while (0); _hj_key += 12; _hj_k -= 12; } (v)->hh.hashv += strlen(v->vname); switch ( _hj_k ) { case 11: (v)->hh.hashv += ( (unsigned)_hj_key[10] << 24 ); case 10: (v)->hh.hashv += ( (unsigned)_hj_key[9] << 16 ); case 9: (v)->hh.hashv += ( (unsigned)_hj_key[8] << 8 ); case 8: _hj_j += ( (unsigned)_hj_key[7] << 24 ); case 7: _hj_j += ( (unsigned)_hj_key[6] << 16 ); case 6: _hj_j += ( (unsigned)_hj_key[5] << 8 ); case 5: _hj_j += _hj_key[4]; case 4: _hj_i += ( (unsigned)_hj_key[3] << 24 ); case 3: _hj_i += ( (unsigned)_hj_key[2] << 16 ); case 2: _hj_i += ( (unsigned)_hj_key[1] << 8 ); case 1: _hj_i += _hj_key[0]; } do { _hj_i -= _hj_j; _hj_i -= (v)->hh.hashv; _hj_i ^= ( (v)->hh.hashv >> 13 ); _hj_j -= (v)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 8 ); (v)->hh.hashv -= _hj_i; (v)->hh.hashv -= _hj_j; (v)->hh.hashv ^= ( _hj_j >> 13 ); _hj_i -= _hj_j; _hj_i -= (v)->hh.hashv; _hj_i ^= ( (v)->hh.hashv >> 12 ); _hj_j -= (v)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 16 ); (v)->hh.hashv -= _hj_i; (v)->hh.hashv -= _hj_j; (v)->hh.hashv ^= ( _hj_j >> 5 ); _hj_i -= _hj_j; _hj_i -= (v)->hh.hashv; _hj_i ^= ( (v)->hh.hashv >> 3 ); _hj_j -= (v)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 10 ); (v)->hh.hashv -= _hj_i; (v)->hh.hashv -= _hj_j; (v)->hh.hashv ^= ( _hj_j >> 15 ); } while (0); _ha_bkt = (v)->hh.hashv & ((vnames)->hh.tbl->num_buckets-1); } while(0); do { (vnames)->hh.tbl->buckets[_ha_bkt].count++; (&(v)->hh)->hh_next = (vnames)->hh.tbl->buckets[_ha_bkt].hh_head; (&(v)->hh)->hh_prev = ((void *)0); if ((vnames)->hh.tbl->buckets[_ha_bkt].hh_head) { ((vnames)->hh.tbl->buckets[_ha_bkt]).hh_head->hh_prev = (&(v)->hh); } ((vnames)->hh.tbl->buckets[_ha_bkt]).hh_head=&(v)->hh; if ((vnames)->hh.tbl->buckets[_ha_bkt].count >= (((vnames)->hh.tbl->buckets[_ha_bkt].expand_mult+1) * 10) && (&(v)->hh)->tbl->noexpand != 1) { do { unsigned _he_bkt; unsigned _he_bkt_i; struct UT_hash_handle *_he_thh, *_he_hh_nxt; UT_hash_bucket *_he_new_buckets, *_he_newbkt; _he_new_buckets = (UT_hash_bucket*)malloc(2 * (&(v)->hh)->tbl->num_buckets * sizeof(struct UT_hash_bucket)); if (!_he_new_buckets) { exit(-1); } memset(_he_new_buckets, 0, 2 * (&(v)->hh)->tbl->num_buckets * sizeof(struct UT_hash_bucket)); (&(v)->hh)->tbl->ideal_chain_maxlen = ((&(v)->hh)->tbl->num_items >> ((&(v)->hh)->tbl->log2_num_buckets+1)) + (((&(v)->hh)->tbl->num_items & (((&(v)->hh)->tbl->num_buckets*2)-1)) ? 1 : 0); (&(v)->hh)->tbl->nonideal_items = 0; for(_he_bkt_i = 0; _he_bkt_i < (&(v)->hh)->tbl->num_buckets; _he_bkt_i++) { _he_thh = (&(v)->hh)->tbl->buckets[ _he_bkt_i ].hh_head; while (_he_thh) { _he_hh_nxt = _he_thh->hh_next; do { _he_bkt = ((_he_thh->hashv) & (((&(v)->hh)->tbl->num_buckets*2) - 1)); } while(0); _he_newbkt = &(_he_new_buckets[ _he_bkt ]); if (++(_he_newbkt->count) > (&(v)->hh)->tbl->ideal_chain_maxlen) { (&(v)->hh)->tbl->nonideal_items++; _he_newbkt->expand_mult = _he_newbkt->count / (&(v)->hh)->tbl->ideal_chain_maxlen; } _he_thh->hh_prev = ((void *)0); _he_thh->hh_next = _he_newbkt->hh_head; if (_he_newbkt->hh_head) _he_newbkt->hh_head->hh_prev = _he_thh; _he_newbkt->hh_head = _he_thh; _he_thh = _he_hh_nxt; } } free((&(v)->hh)->tbl->buckets); (&(v)->hh)->tbl->num_buckets *= 2; (&(v)->hh)->tbl->log2_num_buckets++; (&(v)->hh)->tbl->buckets = _he_new_buckets; (&(v)->hh)->tbl->ineff_expands = ((&(v)->hh)->tbl->nonideal_items > ((&(v)->hh)->tbl->num_items >> 1)) ? ((&(v)->hh)->tbl->ineff_expands+1) : 0; if ((&(v)->hh)->tbl->ineff_expands > 1) { (&(v)->hh)->tbl->noexpand=1; ; } ; } while(0); } } while(0); ; ; ; } while(0);
    }
    else{
     do { unsigned _hd_bkt; struct UT_hash_handle *_hd_hh_del; if ( ((v)->hh.prev == ((void *)0)) && ((v)->hh.next == ((void *)0)) ) { free((vnames)->hh.tbl->buckets); ; free((vnames)->hh.tbl); vnames = ((void *)0); } else { _hd_hh_del = &((v)->hh); if ((v) == ((void*)(((char*)((vnames)->hh.tbl->tail)) - (((vnames)->hh.tbl)->hho)))) { (vnames)->hh.tbl->tail = (UT_hash_handle*)((ptrdiff_t)((v)->hh.prev) + (vnames)->hh.tbl->hho); } if ((v)->hh.prev) { ((UT_hash_handle*)((ptrdiff_t)((v)->hh.prev) + (vnames)->hh.tbl->hho))->next = (v)->hh.next; } else { do { (vnames) = (__typeof(vnames))((v)->hh.next); } while(0); } if (_hd_hh_del->next) { ((UT_hash_handle*)((ptrdiff_t)_hd_hh_del->next + (vnames)->hh.tbl->hho))->prev = _hd_hh_del->prev; } do { _hd_bkt = ((_hd_hh_del->hashv) & (((vnames)->hh.tbl->num_buckets) - 1)); } while(0); ((vnames)->hh.tbl->buckets[_hd_bkt]).count--; if (((vnames)->hh.tbl->buckets[_hd_bkt]).hh_head == _hd_hh_del) { ((vnames)->hh.tbl->buckets[_hd_bkt]).hh_head = _hd_hh_del->hh_next; } if (_hd_hh_del->hh_prev) { _hd_hh_del->hh_prev->hh_next = _hd_hh_del->hh_next; } if (_hd_hh_del->hh_next) { _hd_hh_del->hh_next->hh_prev = _hd_hh_del->hh_prev; }; (vnames)->hh.tbl->num_items--; } ; } while (0);
     v = (vnameHash*)malloc(sizeof(vnameHash));
 strcpy(v->vname_occ,value);
 strcpy(v->vname,key);
        do { unsigned _ha_bkt; (v)->hh.next = ((void *)0); (v)->hh.key = (char*)(&((v)->vname[0])); (v)->hh.keylen = (unsigned)(strlen(v->vname)); if (!(vnames)) { vnames = (v); (vnames)->hh.prev = ((void *)0); do { (vnames)->hh.tbl = (UT_hash_table*)malloc(sizeof(UT_hash_table)); if (!((vnames)->hh.tbl)) { exit(-1); } memset((vnames)->hh.tbl, 0, sizeof(UT_hash_table)); (vnames)->hh.tbl->tail = &((vnames)->hh); (vnames)->hh.tbl->num_buckets = 32; (vnames)->hh.tbl->log2_num_buckets = 5; (vnames)->hh.tbl->hho = (char*)(&(vnames)->hh) - (char*)(vnames); (vnames)->hh.tbl->buckets = (UT_hash_bucket*)malloc(32*sizeof(struct UT_hash_bucket)); if (! (vnames)->hh.tbl->buckets) { exit(-1); } memset((vnames)->hh.tbl->buckets, 0, 32*sizeof(struct UT_hash_bucket)); ; (vnames)->hh.tbl->signature = 0xa0111fe1; } while(0); } else { (vnames)->hh.tbl->tail->next = (v); (v)->hh.prev = ((void*)(((char*)((vnames)->hh.tbl->tail)) - (((vnames)->hh.tbl)->hho))); (vnames)->hh.tbl->tail = &((v)->hh); } (vnames)->hh.tbl->num_items++; (v)->hh.tbl = (vnames)->hh.tbl; do { unsigned _hj_i,_hj_j,_hj_k; unsigned char *_hj_key=(unsigned char*)(&((v)->vname[0])); (v)->hh.hashv = 0xfeedbeef; _hj_i = _hj_j = 0x9e3779b9; _hj_k = (unsigned)(strlen(v->vname)); while (_hj_k >= 12) { _hj_i += (_hj_key[0] + ( (unsigned)_hj_key[1] << 8 ) + ( (unsigned)_hj_key[2] << 16 ) + ( (unsigned)_hj_key[3] << 24 ) ); _hj_j += (_hj_key[4] + ( (unsigned)_hj_key[5] << 8 ) + ( (unsigned)_hj_key[6] << 16 ) + ( (unsigned)_hj_key[7] << 24 ) ); (v)->hh.hashv += (_hj_key[8] + ( (unsigned)_hj_key[9] << 8 ) + ( (unsigned)_hj_key[10] << 16 ) + ( (unsigned)_hj_key[11] << 24 ) ); do { _hj_i -= _hj_j; _hj_i -= (v)->hh.hashv; _hj_i ^= ( (v)->hh.hashv >> 13 ); _hj_j -= (v)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 8 ); (v)->hh.hashv -= _hj_i; (v)->hh.hashv -= _hj_j; (v)->hh.hashv ^= ( _hj_j >> 13 ); _hj_i -= _hj_j; _hj_i -= (v)->hh.hashv; _hj_i ^= ( (v)->hh.hashv >> 12 ); _hj_j -= (v)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 16 ); (v)->hh.hashv -= _hj_i; (v)->hh.hashv -= _hj_j; (v)->hh.hashv ^= ( _hj_j >> 5 ); _hj_i -= _hj_j; _hj_i -= (v)->hh.hashv; _hj_i ^= ( (v)->hh.hashv >> 3 ); _hj_j -= (v)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 10 ); (v)->hh.hashv -= _hj_i; (v)->hh.hashv -= _hj_j; (v)->hh.hashv ^= ( _hj_j >> 15 ); } while (0); _hj_key += 12; _hj_k -= 12; } (v)->hh.hashv += strlen(v->vname); switch ( _hj_k ) { case 11: (v)->hh.hashv += ( (unsigned)_hj_key[10] << 24 ); case 10: (v)->hh.hashv += ( (unsigned)_hj_key[9] << 16 ); case 9: (v)->hh.hashv += ( (unsigned)_hj_key[8] << 8 ); case 8: _hj_j += ( (unsigned)_hj_key[7] << 24 ); case 7: _hj_j += ( (unsigned)_hj_key[6] << 16 ); case 6: _hj_j += ( (unsigned)_hj_key[5] << 8 ); case 5: _hj_j += _hj_key[4]; case 4: _hj_i += ( (unsigned)_hj_key[3] << 24 ); case 3: _hj_i += ( (unsigned)_hj_key[2] << 16 ); case 2: _hj_i += ( (unsigned)_hj_key[1] << 8 ); case 1: _hj_i += _hj_key[0]; } do { _hj_i -= _hj_j; _hj_i -= (v)->hh.hashv; _hj_i ^= ( (v)->hh.hashv >> 13 ); _hj_j -= (v)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 8 ); (v)->hh.hashv -= _hj_i; (v)->hh.hashv -= _hj_j; (v)->hh.hashv ^= ( _hj_j >> 13 ); _hj_i -= _hj_j; _hj_i -= (v)->hh.hashv; _hj_i ^= ( (v)->hh.hashv >> 12 ); _hj_j -= (v)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 16 ); (v)->hh.hashv -= _hj_i; (v)->hh.hashv -= _hj_j; (v)->hh.hashv ^= ( _hj_j >> 5 ); _hj_i -= _hj_j; _hj_i -= (v)->hh.hashv; _hj_i ^= ( (v)->hh.hashv >> 3 ); _hj_j -= (v)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 10 ); (v)->hh.hashv -= _hj_i; (v)->hh.hashv -= _hj_j; (v)->hh.hashv ^= ( _hj_j >> 15 ); } while (0); _ha_bkt = (v)->hh.hashv & ((vnames)->hh.tbl->num_buckets-1); } while(0); do { (vnames)->hh.tbl->buckets[_ha_bkt].count++; (&(v)->hh)->hh_next = (vnames)->hh.tbl->buckets[_ha_bkt].hh_head; (&(v)->hh)->hh_prev = ((void *)0); if ((vnames)->hh.tbl->buckets[_ha_bkt].hh_head) { ((vnames)->hh.tbl->buckets[_ha_bkt]).hh_head->hh_prev = (&(v)->hh); } ((vnames)->hh.tbl->buckets[_ha_bkt]).hh_head=&(v)->hh; if ((vnames)->hh.tbl->buckets[_ha_bkt].count >= (((vnames)->hh.tbl->buckets[_ha_bkt].expand_mult+1) * 10) && (&(v)->hh)->tbl->noexpand != 1) { do { unsigned _he_bkt; unsigned _he_bkt_i; struct UT_hash_handle *_he_thh, *_he_hh_nxt; UT_hash_bucket *_he_new_buckets, *_he_newbkt; _he_new_buckets = (UT_hash_bucket*)malloc(2 * (&(v)->hh)->tbl->num_buckets * sizeof(struct UT_hash_bucket)); if (!_he_new_buckets) { exit(-1); } memset(_he_new_buckets, 0, 2 * (&(v)->hh)->tbl->num_buckets * sizeof(struct UT_hash_bucket)); (&(v)->hh)->tbl->ideal_chain_maxlen = ((&(v)->hh)->tbl->num_items >> ((&(v)->hh)->tbl->log2_num_buckets+1)) + (((&(v)->hh)->tbl->num_items & (((&(v)->hh)->tbl->num_buckets*2)-1)) ? 1 : 0); (&(v)->hh)->tbl->nonideal_items = 0; for(_he_bkt_i = 0; _he_bkt_i < (&(v)->hh)->tbl->num_buckets; _he_bkt_i++) { _he_thh = (&(v)->hh)->tbl->buckets[ _he_bkt_i ].hh_head; while (_he_thh) { _he_hh_nxt = _he_thh->hh_next; do { _he_bkt = ((_he_thh->hashv) & (((&(v)->hh)->tbl->num_buckets*2) - 1)); } while(0); _he_newbkt = &(_he_new_buckets[ _he_bkt ]); if (++(_he_newbkt->count) > (&(v)->hh)->tbl->ideal_chain_maxlen) { (&(v)->hh)->tbl->nonideal_items++; _he_newbkt->expand_mult = _he_newbkt->count / (&(v)->hh)->tbl->ideal_chain_maxlen; } _he_thh->hh_prev = ((void *)0); _he_thh->hh_next = _he_newbkt->hh_head; if (_he_newbkt->hh_head) _he_newbkt->hh_head->hh_prev = _he_thh; _he_newbkt->hh_head = _he_thh; _he_thh = _he_hh_nxt; } } free((&(v)->hh)->tbl->buckets); (&(v)->hh)->tbl->num_buckets *= 2; (&(v)->hh)->tbl->log2_num_buckets++; (&(v)->hh)->tbl->buckets = _he_new_buckets; (&(v)->hh)->tbl->ineff_expands = ((&(v)->hh)->tbl->nonideal_items > ((&(v)->hh)->tbl->num_items >> 1)) ? ((&(v)->hh)->tbl->ineff_expands+1) : 0; if ((&(v)->hh)->tbl->ineff_expands > 1) { (&(v)->hh)->tbl->noexpand=1; ; } ; } while(0); } } while(0); ; ; ; } while(0);
    }
}

char* get_vnameHash(char* key){
 vnameHash* v;
        do { unsigned _hf_bkt,_hf_hashv; v=((void *)0); if (vnames) { do { unsigned _hj_i,_hj_j,_hj_k; unsigned char *_hj_key=(unsigned char*)(key); _hf_hashv = 0xfeedbeef; _hj_i = _hj_j = 0x9e3779b9; _hj_k = (unsigned)(strlen(key)); while (_hj_k >= 12) { _hj_i += (_hj_key[0] + ( (unsigned)_hj_key[1] << 8 ) + ( (unsigned)_hj_key[2] << 16 ) + ( (unsigned)_hj_key[3] << 24 ) ); _hj_j += (_hj_key[4] + ( (unsigned)_hj_key[5] << 8 ) + ( (unsigned)_hj_key[6] << 16 ) + ( (unsigned)_hj_key[7] << 24 ) ); _hf_hashv += (_hj_key[8] + ( (unsigned)_hj_key[9] << 8 ) + ( (unsigned)_hj_key[10] << 16 ) + ( (unsigned)_hj_key[11] << 24 ) ); do { _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 13 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 8 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 13 ); _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 12 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 16 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 5 ); _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 3 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 10 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 15 ); } while (0); _hj_key += 12; _hj_k -= 12; } _hf_hashv += strlen(key); switch ( _hj_k ) { case 11: _hf_hashv += ( (unsigned)_hj_key[10] << 24 ); case 10: _hf_hashv += ( (unsigned)_hj_key[9] << 16 ); case 9: _hf_hashv += ( (unsigned)_hj_key[8] << 8 ); case 8: _hj_j += ( (unsigned)_hj_key[7] << 24 ); case 7: _hj_j += ( (unsigned)_hj_key[6] << 16 ); case 6: _hj_j += ( (unsigned)_hj_key[5] << 8 ); case 5: _hj_j += _hj_key[4]; case 4: _hj_i += ( (unsigned)_hj_key[3] << 24 ); case 3: _hj_i += ( (unsigned)_hj_key[2] << 16 ); case 2: _hj_i += ( (unsigned)_hj_key[1] << 8 ); case 1: _hj_i += _hj_key[0]; } do { _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 13 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 8 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 13 ); _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 12 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 16 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 5 ); _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 3 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 10 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 15 ); } while (0); _hf_bkt = _hf_hashv & ((vnames)->hh.tbl->num_buckets-1); } while(0); if ((1)) { do { if ((vnames)->hh.tbl->buckets[ _hf_bkt ].hh_head) do { (v) = (__typeof(v))(((void*)(((char*)((vnames)->hh.tbl->buckets[ _hf_bkt ].hh_head)) - (((vnames)->hh.tbl)->hho)))); } while(0); else v=((void *)0); while (v) { if ((v)->hh.keylen == strlen(key)) { if ((memcmp((v)->hh.key,key,strlen(key))) == 0) break; } if ((v)->hh.hh_next) do { (v) = (__typeof(v))(((void*)(((char*)((v)->hh.hh_next)) - (((vnames)->hh.tbl)->hho)))); } while(0); else v = ((void *)0); } } while(0); } } } while (0);
        if(v != ((void *)0)){
         return v->vname_occ;
        }
}

void del_vnameHash(char* key){
 vnameHash* v;
        do { unsigned _hf_bkt,_hf_hashv; v=((void *)0); if (vnames) { do { unsigned _hj_i,_hj_j,_hj_k; unsigned char *_hj_key=(unsigned char*)(key); _hf_hashv = 0xfeedbeef; _hj_i = _hj_j = 0x9e3779b9; _hj_k = (unsigned)(strlen(key)); while (_hj_k >= 12) { _hj_i += (_hj_key[0] + ( (unsigned)_hj_key[1] << 8 ) + ( (unsigned)_hj_key[2] << 16 ) + ( (unsigned)_hj_key[3] << 24 ) ); _hj_j += (_hj_key[4] + ( (unsigned)_hj_key[5] << 8 ) + ( (unsigned)_hj_key[6] << 16 ) + ( (unsigned)_hj_key[7] << 24 ) ); _hf_hashv += (_hj_key[8] + ( (unsigned)_hj_key[9] << 8 ) + ( (unsigned)_hj_key[10] << 16 ) + ( (unsigned)_hj_key[11] << 24 ) ); do { _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 13 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 8 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 13 ); _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 12 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 16 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 5 ); _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 3 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 10 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 15 ); } while (0); _hj_key += 12; _hj_k -= 12; } _hf_hashv += strlen(key); switch ( _hj_k ) { case 11: _hf_hashv += ( (unsigned)_hj_key[10] << 24 ); case 10: _hf_hashv += ( (unsigned)_hj_key[9] << 16 ); case 9: _hf_hashv += ( (unsigned)_hj_key[8] << 8 ); case 8: _hj_j += ( (unsigned)_hj_key[7] << 24 ); case 7: _hj_j += ( (unsigned)_hj_key[6] << 16 ); case 6: _hj_j += ( (unsigned)_hj_key[5] << 8 ); case 5: _hj_j += _hj_key[4]; case 4: _hj_i += ( (unsigned)_hj_key[3] << 24 ); case 3: _hj_i += ( (unsigned)_hj_key[2] << 16 ); case 2: _hj_i += ( (unsigned)_hj_key[1] << 8 ); case 1: _hj_i += _hj_key[0]; } do { _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 13 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 8 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 13 ); _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 12 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 16 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 5 ); _hj_i -= _hj_j; _hj_i -= _hf_hashv; _hj_i ^= ( _hf_hashv >> 3 ); _hj_j -= _hf_hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 10 ); _hf_hashv -= _hj_i; _hf_hashv -= _hj_j; _hf_hashv ^= ( _hj_j >> 15 ); } while (0); _hf_bkt = _hf_hashv & ((vnames)->hh.tbl->num_buckets-1); } while(0); if ((1)) { do { if ((vnames)->hh.tbl->buckets[ _hf_bkt ].hh_head) do { (v) = (__typeof(v))(((void*)(((char*)((vnames)->hh.tbl->buckets[ _hf_bkt ].hh_head)) - (((vnames)->hh.tbl)->hho)))); } while(0); else v=((void *)0); while (v) { if ((v)->hh.keylen == strlen(key)) { if ((memcmp((v)->hh.key,key,strlen(key))) == 0) break; } if ((v)->hh.hh_next) do { (v) = (__typeof(v))(((void*)(((char*)((v)->hh.hh_next)) - (((vnames)->hh.tbl)->hho)))); } while(0); else v = ((void *)0); } } while(0); } } } while (0);
        if(v != ((void *)0)){
         int occ;
         char find = '_';
         const char *ptr = strrchr(v->vname_occ, find);
  if(ptr) {
      int i = strlen(v->vname_occ);
          int s = ptr - v->vname_occ + 1;
       char *occStr = (char*) malloc(sizeof(char)*(i-s+1));
       strncpy(occStr, v->vname_occ + s, i-s);
       occ = atoi(occStr);
   if(occ == 0){
    do { unsigned _hd_bkt; struct UT_hash_handle *_hd_hh_del; if ( ((v)->hh.prev == ((void *)0)) && ((v)->hh.next == ((void *)0)) ) { free((vnames)->hh.tbl->buckets); ; free((vnames)->hh.tbl); vnames = ((void *)0); } else { _hd_hh_del = &((v)->hh); if ((v) == ((void*)(((char*)((vnames)->hh.tbl->tail)) - (((vnames)->hh.tbl)->hho)))) { (vnames)->hh.tbl->tail = (UT_hash_handle*)((ptrdiff_t)((v)->hh.prev) + (vnames)->hh.tbl->hho); } if ((v)->hh.prev) { ((UT_hash_handle*)((ptrdiff_t)((v)->hh.prev) + (vnames)->hh.tbl->hho))->next = (v)->hh.next; } else { do { (vnames) = (__typeof(vnames))((v)->hh.next); } while(0); } if (_hd_hh_del->next) { ((UT_hash_handle*)((ptrdiff_t)_hd_hh_del->next + (vnames)->hh.tbl->hho))->prev = _hd_hh_del->prev; } do { _hd_bkt = ((_hd_hh_del->hashv) & (((vnames)->hh.tbl->num_buckets) - 1)); } while(0); ((vnames)->hh.tbl->buckets[_hd_bkt]).count--; if (((vnames)->hh.tbl->buckets[_hd_bkt]).hh_head == _hd_hh_del) { ((vnames)->hh.tbl->buckets[_hd_bkt]).hh_head = _hd_hh_del->hh_next; } if (_hd_hh_del->hh_prev) { _hd_hh_del->hh_prev->hh_next = _hd_hh_del->hh_next; } if (_hd_hh_del->hh_next) { _hd_hh_del->hh_next->hh_prev = _hd_hh_del->hh_prev; }; (vnames)->hh.tbl->num_items--; } ; } while (0);
    printf("Old Hash: %s\n", v->vname_occ);
   }
   else{
    printf("Old Hash: %s\n", v->vname_occ);
    occ--;
    char* newVarname_occ = (char*) malloc(sizeof(char)*(s+5));
    strncpy(newVarname_occ, v->vname_occ, s);
    char tmp[5];
    sprintf(tmp,"%d",occ);
    strcat(newVarname_occ,tmp);
    do { unsigned _hd_bkt; struct UT_hash_handle *_hd_hh_del; if ( ((v)->hh.prev == ((void *)0)) && ((v)->hh.next == ((void *)0)) ) { free((vnames)->hh.tbl->buckets); ; free((vnames)->hh.tbl); vnames = ((void *)0); } else { _hd_hh_del = &((v)->hh); if ((v) == ((void*)(((char*)((vnames)->hh.tbl->tail)) - (((vnames)->hh.tbl)->hho)))) { (vnames)->hh.tbl->tail = (UT_hash_handle*)((ptrdiff_t)((v)->hh.prev) + (vnames)->hh.tbl->hho); } if ((v)->hh.prev) { ((UT_hash_handle*)((ptrdiff_t)((v)->hh.prev) + (vnames)->hh.tbl->hho))->next = (v)->hh.next; } else { do { (vnames) = (__typeof(vnames))((v)->hh.next); } while(0); } if (_hd_hh_del->next) { ((UT_hash_handle*)((ptrdiff_t)_hd_hh_del->next + (vnames)->hh.tbl->hho))->prev = _hd_hh_del->prev; } do { _hd_bkt = ((_hd_hh_del->hashv) & (((vnames)->hh.tbl->num_buckets) - 1)); } while(0); ((vnames)->hh.tbl->buckets[_hd_bkt]).count--; if (((vnames)->hh.tbl->buckets[_hd_bkt]).hh_head == _hd_hh_del) { ((vnames)->hh.tbl->buckets[_hd_bkt]).hh_head = _hd_hh_del->hh_next; } if (_hd_hh_del->hh_prev) { _hd_hh_del->hh_prev->hh_next = _hd_hh_del->hh_next; } if (_hd_hh_del->hh_next) { _hd_hh_del->hh_next->hh_prev = _hd_hh_del->hh_prev; }; (vnames)->hh.tbl->num_items--; } ; } while (0);
    vnameHash* vnew = (vnameHash*)malloc(sizeof(vnameHash));
    strcpy(vnew->vname_occ,newVarname_occ);
    strcpy(vnew->vname,key);
    printf("New Hash: %s\n", vnew->vname_occ);
           do { unsigned _ha_bkt; (vnew)->hh.next = ((void *)0); (vnew)->hh.key = (char*)(&((vnew)->vname[0])); (vnew)->hh.keylen = (unsigned)(strlen(vnew->vname)); if (!(vnames)) { vnames = (vnew); (vnames)->hh.prev = ((void *)0); do { (vnames)->hh.tbl = (UT_hash_table*)malloc(sizeof(UT_hash_table)); if (!((vnames)->hh.tbl)) { exit(-1); } memset((vnames)->hh.tbl, 0, sizeof(UT_hash_table)); (vnames)->hh.tbl->tail = &((vnames)->hh); (vnames)->hh.tbl->num_buckets = 32; (vnames)->hh.tbl->log2_num_buckets = 5; (vnames)->hh.tbl->hho = (char*)(&(vnames)->hh) - (char*)(vnames); (vnames)->hh.tbl->buckets = (UT_hash_bucket*)malloc(32*sizeof(struct UT_hash_bucket)); if (! (vnames)->hh.tbl->buckets) { exit(-1); } memset((vnames)->hh.tbl->buckets, 0, 32*sizeof(struct UT_hash_bucket)); ; (vnames)->hh.tbl->signature = 0xa0111fe1; } while(0); } else { (vnames)->hh.tbl->tail->next = (vnew); (vnew)->hh.prev = ((void*)(((char*)((vnames)->hh.tbl->tail)) - (((vnames)->hh.tbl)->hho))); (vnames)->hh.tbl->tail = &((vnew)->hh); } (vnames)->hh.tbl->num_items++; (vnew)->hh.tbl = (vnames)->hh.tbl; do { unsigned _hj_i,_hj_j,_hj_k; unsigned char *_hj_key=(unsigned char*)(&((vnew)->vname[0])); (vnew)->hh.hashv = 0xfeedbeef; _hj_i = _hj_j = 0x9e3779b9; _hj_k = (unsigned)(strlen(vnew->vname)); while (_hj_k >= 12) { _hj_i += (_hj_key[0] + ( (unsigned)_hj_key[1] << 8 ) + ( (unsigned)_hj_key[2] << 16 ) + ( (unsigned)_hj_key[3] << 24 ) ); _hj_j += (_hj_key[4] + ( (unsigned)_hj_key[5] << 8 ) + ( (unsigned)_hj_key[6] << 16 ) + ( (unsigned)_hj_key[7] << 24 ) ); (vnew)->hh.hashv += (_hj_key[8] + ( (unsigned)_hj_key[9] << 8 ) + ( (unsigned)_hj_key[10] << 16 ) + ( (unsigned)_hj_key[11] << 24 ) ); do { _hj_i -= _hj_j; _hj_i -= (vnew)->hh.hashv; _hj_i ^= ( (vnew)->hh.hashv >> 13 ); _hj_j -= (vnew)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 8 ); (vnew)->hh.hashv -= _hj_i; (vnew)->hh.hashv -= _hj_j; (vnew)->hh.hashv ^= ( _hj_j >> 13 ); _hj_i -= _hj_j; _hj_i -= (vnew)->hh.hashv; _hj_i ^= ( (vnew)->hh.hashv >> 12 ); _hj_j -= (vnew)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 16 ); (vnew)->hh.hashv -= _hj_i; (vnew)->hh.hashv -= _hj_j; (vnew)->hh.hashv ^= ( _hj_j >> 5 ); _hj_i -= _hj_j; _hj_i -= (vnew)->hh.hashv; _hj_i ^= ( (vnew)->hh.hashv >> 3 ); _hj_j -= (vnew)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 10 ); (vnew)->hh.hashv -= _hj_i; (vnew)->hh.hashv -= _hj_j; (vnew)->hh.hashv ^= ( _hj_j >> 15 ); } while (0); _hj_key += 12; _hj_k -= 12; } (vnew)->hh.hashv += strlen(vnew->vname); switch ( _hj_k ) { case 11: (vnew)->hh.hashv += ( (unsigned)_hj_key[10] << 24 ); case 10: (vnew)->hh.hashv += ( (unsigned)_hj_key[9] << 16 ); case 9: (vnew)->hh.hashv += ( (unsigned)_hj_key[8] << 8 ); case 8: _hj_j += ( (unsigned)_hj_key[7] << 24 ); case 7: _hj_j += ( (unsigned)_hj_key[6] << 16 ); case 6: _hj_j += ( (unsigned)_hj_key[5] << 8 ); case 5: _hj_j += _hj_key[4]; case 4: _hj_i += ( (unsigned)_hj_key[3] << 24 ); case 3: _hj_i += ( (unsigned)_hj_key[2] << 16 ); case 2: _hj_i += ( (unsigned)_hj_key[1] << 8 ); case 1: _hj_i += _hj_key[0]; } do { _hj_i -= _hj_j; _hj_i -= (vnew)->hh.hashv; _hj_i ^= ( (vnew)->hh.hashv >> 13 ); _hj_j -= (vnew)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 8 ); (vnew)->hh.hashv -= _hj_i; (vnew)->hh.hashv -= _hj_j; (vnew)->hh.hashv ^= ( _hj_j >> 13 ); _hj_i -= _hj_j; _hj_i -= (vnew)->hh.hashv; _hj_i ^= ( (vnew)->hh.hashv >> 12 ); _hj_j -= (vnew)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 16 ); (vnew)->hh.hashv -= _hj_i; (vnew)->hh.hashv -= _hj_j; (vnew)->hh.hashv ^= ( _hj_j >> 5 ); _hj_i -= _hj_j; _hj_i -= (vnew)->hh.hashv; _hj_i ^= ( (vnew)->hh.hashv >> 3 ); _hj_j -= (vnew)->hh.hashv; _hj_j -= _hj_i; _hj_j ^= ( _hj_i << 10 ); (vnew)->hh.hashv -= _hj_i; (vnew)->hh.hashv -= _hj_j; (vnew)->hh.hashv ^= ( _hj_j >> 15 ); } while (0); _ha_bkt = (vnew)->hh.hashv & ((vnames)->hh.tbl->num_buckets-1); } while(0); do { (vnames)->hh.tbl->buckets[_ha_bkt].count++; (&(vnew)->hh)->hh_next = (vnames)->hh.tbl->buckets[_ha_bkt].hh_head; (&(vnew)->hh)->hh_prev = ((void *)0); if ((vnames)->hh.tbl->buckets[_ha_bkt].hh_head) { ((vnames)->hh.tbl->buckets[_ha_bkt]).hh_head->hh_prev = (&(vnew)->hh); } ((vnames)->hh.tbl->buckets[_ha_bkt]).hh_head=&(vnew)->hh; if ((vnames)->hh.tbl->buckets[_ha_bkt].count >= (((vnames)->hh.tbl->buckets[_ha_bkt].expand_mult+1) * 10) && (&(vnew)->hh)->tbl->noexpand != 1) { do { unsigned _he_bkt; unsigned _he_bkt_i; struct UT_hash_handle *_he_thh, *_he_hh_nxt; UT_hash_bucket *_he_new_buckets, *_he_newbkt; _he_new_buckets = (UT_hash_bucket*)malloc(2 * (&(vnew)->hh)->tbl->num_buckets * sizeof(struct UT_hash_bucket)); if (!_he_new_buckets) { exit(-1); } memset(_he_new_buckets, 0, 2 * (&(vnew)->hh)->tbl->num_buckets * sizeof(struct UT_hash_bucket)); (&(vnew)->hh)->tbl->ideal_chain_maxlen = ((&(vnew)->hh)->tbl->num_items >> ((&(vnew)->hh)->tbl->log2_num_buckets+1)) + (((&(vnew)->hh)->tbl->num_items & (((&(vnew)->hh)->tbl->num_buckets*2)-1)) ? 1 : 0); (&(vnew)->hh)->tbl->nonideal_items = 0; for(_he_bkt_i = 0; _he_bkt_i < (&(vnew)->hh)->tbl->num_buckets; _he_bkt_i++) { _he_thh = (&(vnew)->hh)->tbl->buckets[ _he_bkt_i ].hh_head; while (_he_thh) { _he_hh_nxt = _he_thh->hh_next; do { _he_bkt = ((_he_thh->hashv) & (((&(vnew)->hh)->tbl->num_buckets*2) - 1)); } while(0); _he_newbkt = &(_he_new_buckets[ _he_bkt ]); if (++(_he_newbkt->count) > (&(vnew)->hh)->tbl->ideal_chain_maxlen) { (&(vnew)->hh)->tbl->nonideal_items++; _he_newbkt->expand_mult = _he_newbkt->count / (&(vnew)->hh)->tbl->ideal_chain_maxlen; } _he_thh->hh_prev = ((void *)0); _he_thh->hh_next = _he_newbkt->hh_head; if (_he_newbkt->hh_head) _he_newbkt->hh_head->hh_prev = _he_thh; _he_newbkt->hh_head = _he_thh; _he_thh = _he_hh_nxt; } } free((&(vnew)->hh)->tbl->buckets); (&(vnew)->hh)->tbl->num_buckets *= 2; (&(vnew)->hh)->tbl->log2_num_buckets++; (&(vnew)->hh)->tbl->buckets = _he_new_buckets; (&(vnew)->hh)->tbl->ineff_expands = ((&(vnew)->hh)->tbl->nonideal_items > ((&(vnew)->hh)->tbl->num_items >> 1)) ? ((&(vnew)->hh)->tbl->ineff_expands+1) : 0; if ((&(vnew)->hh)->tbl->ineff_expands > 1) { (&(vnew)->hh)->tbl->noexpand=1; ; } ; } while(0); } } while(0); ; ; ; } while(0);
   }
  }
        }
}

funcArg* getArgument(char* argString, char* foo){

    int i;double d;char c;
    char s[] = ",";
    char *token;
    char *copy = strdup(argString);
    copy++;
    copy[strlen(copy)-1] = 0;

    funcArg* argument = (funcArg*) malloc(sizeof(funcArg));
    strcpy(argument->funcName,foo);

    token = strtok(copy, s);
    if(strcmp(token,"int") == 0)
     argument->type = 1;
    else{
     if(strcmp(token,"double") == 0 || strcmp(token,"float")==0)
      argument->type = 2;
     else
      argument->type = 3;
    }

    token = strtok(((void *)0), s);
    strcpy(argument->vname,token);

    token = strtok(((void *)0), s);
    if(strcmp(token,"constant") == 0)
 argument->isConstant = 1;
    else
     argument->isConstant = 0;

    token = strtok(((void *)0), s);
    if(argument->isConstant){
     if(argument->type == 1){
      i=atoi(token);
      argument->val = &i;
 }
     if(argument->type == 2){
      d=atof(token);
      argument->val = &d;
     }
     if(argument->type == 3){
      c = *token;
      argument->val = &c;
     }
    }
    else
     strcpy(argument->apname,token);

    return argument;
}


void populateSTable(funcArg* a){

 char key[50];
 strcpy(key,a->vname);
 if(a->isConstant == 1){
  add_entryToSTable(key,"Constant",a->val,a->val,a->type);
  printf("%s Constant\n", key);
 }
 else{
  char* sym;
  void* val;
  sym = find_symVal(a->apname);
  val = find_conVal(a->apname);
  add_entryToSTable(key,sym,val,val,a->type);
  printf("%s %s\n", key, sym);
 }
}


void funcEntry(char* format, char* args, char* funcName) {
 printf("funcEntry: %s \"%s\" \n", funcName, args);
 int size=0;
 varNames = (char**) malloc(10 * sizeof(char*));
 if(strcmp(args,"") != 0){
  char s[] = " ";
  char *token;
  char *copy = strdup(args);
  char* tmp = copy;
  int count = 1;
  while (*tmp != '\0') {
   if (*tmp++ == ' ')
    count++;
  }
  char** tokens = (char**) malloc(sizeof(char*) * count);
  token = strtok(copy, s);
  int i = 0;
  while (token != ((void *)0)) {
   *(tokens + i) = token;
   token = strtok(((void *)0), s);
   i++;
  }
  for (i = 0; i < count; i++) {
   funcArg *a = getArgument(*(tokens + i), funcName);
   varNames[size++] = a->vname;
   populateSTable(a);
  }
  free(copy);
 }
 funcVars* fv = (funcVars*) malloc (sizeof(funcVars));
 fv->vars = varNames;
 fv->noOfVars = size;
 strcpy(fv->funcName,funcName);

 if(stackInitFlag){
  stackPush(symStack, (&fv));
 }
 else{
  symStack = stackNew(sizeof(funcVars*));
  stackPush(symStack, (&fv));
  stackInitFlag=1;
 }
 size=0;
     i=0;
 printf("Stack depth %d\n", stackSize(symStack));
}


void symAssignFunctionReturn(char* varname){
 deleteEntryUsingVar(varname);
 add_entryToSTable(varname,ret_SymValue,ret_ConValue,ret_ConValue,1);
}

void funcExit(){


    funcVars* fv = (funcVars*) malloc (sizeof(funcVars));
    stackPop(symStack, (&fv));
    int j;
    for(j=0; j < fv->noOfVars; j++){
     deleteEntryUsingVar(fv->vars[j]);
    }

    printf("Stack depth %d\n", stackSize(symStack));

}

void testgen_exit(){
    programFlag = 1;
    return;
}

void mapConcolicValues (char* retVarName){
 ret_ConValue = ((void *)0);
 ret_SymValue = (char *)malloc(100*sizeof(char));
 ret_SymValue = find_symVal(retVarName);
 ret_ConValue = find_conVal(retVarName);
 if(ret_SymValue == ((void *)0)){
  printf("symValue for variable \"%s\" not found\n", retVarName);
 }
 else{
  printf("symValue for variable \"%s\" is \"%s\"\n",retVarName,ret_SymValue);
  printf("ConValue for variable \"%s\" is \"%d\"\n",retVarName,*((int *)(ret_ConValue)));
 }
 return;
}
