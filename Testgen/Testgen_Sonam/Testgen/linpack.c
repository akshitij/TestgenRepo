/*
**
** LINPACK.C        Linpack benchmark, calculates FLOPS.
**                  (FLoating Point Operations Per Second)
**
** Translated to C by Bonnie Toy 5/88
**
** Modified by Will Menninger, 10/93, with these features:
**  (modified on 2/25/94  to fix a problem with daxpy  for
**   unequal increments or equal increments not equal to 1.
**     Jack Dongarra)
**
** - Defaults to double precision.
** - Averages ROLLed and UNROLLed performance.
** - User selectable array sizes.
** - Automatically does enough repetitions to take at least 10 CPU seconds.
** - Prints machine precision.
** - ANSI prototyping.
**
** To compile:  cc -O -o linpack linpack.c -lm
**
**
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include <float.h>

#define DP

#ifdef SP
#define ZERO        0.0
#define ONE         1.0
#define PREC        "Single"
#define BASE10DIG   FLT_DIG


#endif

#ifdef DP
#define ZERO        0
#define ONE         1
#define PREC        "Double"
#define BASE10DIG   DBL_DIG


#endif

int linpack  (int nreps,int arsize);
void matgen   (int *a,int lda,int n,int *b,int *norma);
void dgefa    (int *a,int lda,int n,int *ipvt,int *info,int roll);
void dgesl    (int *a,int lda,int n,int *ipvt,int *b,int job,int roll);
void daxpy_r  (int n,int da,int *dx,int incx,int *dy,int incy);
int ddot_r   (int n,int *dx,int incx,int *dy,int incy);
void dscal_r  (int n,int da,int *dx,int incx);
void daxpy_ur (int n,int da,int *dx,int incx,int *dy,int incy);
int ddot_ur  (int n,int *dx,int incx,int *dy,int incy);
void dscal_ur (int n,int da,int *dx,int incx);
int  idamax(int n,int *dx,int incx);
static int second   (void);

int *mempool;

/*
void main(void)

    {
    char    buf[80];
    int     arsize;
    long    arsize2d,memreq,nreps;
    size_t  malloc_arg;

    //while (1)
      //  {
        printf("Enter array size (q to quit) [200]:  ");
        fgets(buf,79,stdin);
        if (buf[0]=='q' || buf[0]=='Q')
           return;
        if (buf[0]=='\0' || buf[0]=='\n')
            arsize=200;
        else
            arsize=atoi(buf);
        arsize/=2;
        arsize*=2;
        if (arsize<10)
            {
            printf("Too small.\n");
           // continue;
            }
        arsize2d = (long)arsize*(long)arsize;
        memreq=arsize2d*sizeof(int)+(long)arsize*sizeof(int)+(long)arsize*sizeof(int);
        printf("Memory required:  %ldK.\n",(memreq+512L)>>10);
        malloc_arg=(size_t)memreq;
        if (malloc_arg!=memreq || (mempool=malloc(malloc_arg))==NULL)
            {
            printf("Not enough memory available for given array size.\n\n");
           // continue;
            }
        printf("\n\nLINPACK benchmark, %s precision.\n",PREC);
        printf("Machine precision:  %d digits.\n",BASE10DIG);
        printf("Array size %d X %d.\n",arsize,arsize);
        printf("Average rolled and unrolled performance:\n\n");
        printf("    Reps Time(s) DGEFA   DGESL  OVERHEAD    KFLOPS\n");
        printf("----------------------------------------------------\n");
        nreps=1;
        while (linpack(nreps,arsize)<10.)
            nreps*=2;
        free(mempool);
        printf("\n");
      // }
    }


 int linpack(int nreps,int arsize)

    {
    int  *a,*b;
    int   norma,t1,kflops,tdgesl,tdgefa,totalt,toverhead,ops;
    int   *ipvt,n,info,lda;
    int   i,arsize2d;

    lda = arsize;
    n = arsize/2;
    arsize2d = arsize*arsize;
    ops=((2.0*n*n*n)/3.0+2.0*n*n);
    a=(int *)mempool;
    b=a+arsize2d;
    ipvt=(int *)&b[arsize];
    tdgesl=0;
    tdgefa=0;
    totalt=second();
    for (i=0;i<nreps;i++)
        {
        matgen(a,lda,n,b,&norma);
        t1 = second();
        dgefa(a,lda,n,ipvt,&info,1);
        tdgefa += second()-t1;
        t1 = second();
        dgesl(a,lda,n,ipvt,b,0,1);
        tdgesl += second()-t1;
        }
    for (i=0;i<nreps;i++)
        {
        matgen(a,lda,n,b,&norma);
        t1 = second();
        dgefa(a,lda,n,ipvt,&info,0);
        tdgefa += second()-t1;
        t1 = second();
        dgesl(a,lda,n,ipvt,b,0,0);
        tdgesl += second()-t1;
        }
    totalt=second()-totalt;
    if (totalt<0.5 || tdgefa+tdgesl<0.2)
        return(0.);
    kflops=2.*nreps*ops/(1000.*(tdgefa+tdgesl));
    toverhead=totalt-tdgefa-tdgesl;
    if (tdgefa<0.)
        tdgefa=0.;
    if (tdgesl<0.)
        tdgesl=0.;
    if (toverhead<0.)
        toverhead=0.;
    printf("%8d %d %6.2f%% %6.2f%% %6.2f%%  %d\n",
            nreps,totalt,100.*tdgefa/totalt,
            100.*tdgesl/totalt,100.*toverhead/totalt,
            kflops);
    return(totalt);
    }


*/
 void matgen(int *a,int lda,int n,int *b,int *norma)

    {
    int init,i,j;

    init = 1325;
    *norma = 0.0;
    for (j = 0; j < n; j++)
        for (i = 0; i < n; i++)
            {
            init = (int)((long)3125*(long)init % 65536);
            a[lda*j+i] = (init - 32768.0)/16384.0;
            
             if (a[lda*j+i] > *norma)
                *norma = a[lda*j+i] ;
            }
    for (i = 0; i < n; i++)
        b[i] = 0.0;
    for (j = 0; j < n; j++)
        for (i = 0; i < n; i++)
            b[i] = b[i] + a[lda*j+i];
    }



void dgefa(int *a,int lda,int n,int *ipvt,int *info,int roll)

    {
    int t;
    int idamax(),j,k,kp1,l,nm1;

    if (roll>=1)
        {
        *info = 0;
        nm1 = n - 1;
        if (nm1 >=  0)
            for (k = 0; k < nm1; k++)
                {
                kp1 = k + 1;



               l = idamax(n-k,&a[lda*k+k],1) + k;
           
                ipvt[k] = l;


                if (!(a[lda*k+l] == ZERO))
                    {



                    if (!(l == k))
                        {
                        t = a[lda*k+l];
                        a[lda*k+l] = a[lda*k+k];
                        a[lda*k+k] = t;
                        }



                    t = -ONE/a[lda*k+k];
                    dscal_r(n-(k+1),t,&a[lda*k+k+1],1);



                    for (j = kp1; j < n; j++)
                        {
                        t = a[lda*j+l];
                        if (!(l == k))
                            {
                            a[lda*j+l] = a[lda*j+k];
                            a[lda*j+k] = t;
                            }
                        daxpy_r(n-(k+1),t,&a[lda*k+k+1],1,&a[lda*j+k+1],1);
                        }
                    }
                else
                    (*info) = k;
                }
        ipvt[n-1] = n-1;
        if (a[lda*(n-1)+(n-1)] == ZERO)
            (*info) = n-1;
        }
    else
        {
        *info = 0;
        nm1 = n - 1;
        if (nm1 >=  0)
            for (k = 0; k < nm1; k++)
                {
                kp1 = k + 1;



                l = idamax(n-k,&a[lda*k+k],1) + k;
               
                ipvt[k] = l;




                if (!(a[lda*k+l] == ZERO))
                    {



                    if (!(l == k))
                        {
                        t = a[lda*k+l];
                        a[lda*k+l] = a[lda*k+k];
                        a[lda*k+k] = t;
                        }



                    t = -ONE/a[lda*k+k];
                    dscal_ur(n-(k+1),t,&a[lda*k+k+1],1);



                    for (j = kp1; j < n; j++)
                        {
                        t = a[lda*j+l];
                        if (!(l == k))
                            {
                            a[lda*j+l] = a[lda*j+k];
                            a[lda*j+k] = t;
                            }
                        daxpy_ur(n-(k+1),t,&a[lda*k+k+1],1,&a[lda*j+k+1],1);
                        }
                    }
                else
                    (*info) = k;
                }
        ipvt[n-1] = n-1;
        if (a[lda*(n-1)+(n-1)] == ZERO)
            (*info) = n-1;
        }
    }


void dgesl(int *a,int lda,int n,int *ipvt,int *b,int job,int roll)

    {
    int    t;
    int     k,kb,l,nm1;




    if (roll>=1)
        {
        nm1 = n - 1;
        if (job == 0)
            {

            if (nm1 >= 1)
                for (k = 0; k < nm1; k++)
                    {
                    l = ipvt[k];
                    t = b[l];
                    if (!(l == k))
                        {
                        b[l] = b[k];
                        b[k] = t;
                        }
                    daxpy_r(n-(k+1),t,&a[lda*k+k+1],1,&b[k+1],1);
                    }



            for (kb = 0; kb < n; kb++)
                { 
                k = n - (kb + 1);
                b[k] = b[k]/a[lda*k+k];
                t = -b[k];
                daxpy_r(k,t,&a[lda*k+0],1,&b[0],1);
                }
            }

    
        else
            {

            for (k = 0; k < n; k++)
                {
                t = ddot_r(k,&a[lda*k+0],1,&b[0],1);
                b[k] = (b[k] - t)/a[lda*k+k];
                }



            if (nm1 >= 1)
                for (kb = 1; kb < nm1; kb++)
                    {
                    k = n - (kb+1);
                    b[k] = b[k] + ddot_r(n-(k+1),&a[lda*k+k+1],1,&b[k+1],1);
                    l = ipvt[k];
                    if (!(l == k))
                        {
                        t = b[l];
                        b[l] = b[k];
                        b[k] = t;
                        }
                    }
            }
        }
    else
        {
        nm1 = n - 1;
        if (job == 0)
            {

            if (nm1 >= 1)
                for (k = 0; k < nm1; k++)
                    { 
                    l = ipvt[k];
                    t = b[l];
                    if (!(l == k))
                        {
                        b[l] = b[k];
                        b[k] = t;
                        }

                    daxpy_ur(n-(k+1),t,&a[lda*k+k+1],1,&b[k+1],1);

                    }



            for (kb = 0; kb < n; kb++)
                {
                k = n - (kb + 1);
                b[k] = b[k]/a[lda*k+k];
                t = -b[k];
                daxpy_ur(k,t,&a[lda*k+0],1,&b[0],1);
                }
            }
        else
            {




            for (k = 0; k < n; k++)
                {
                t = ddot_ur(k,&a[lda*k+0],1,&b[0],1);
                b[k] = (b[k] - t)/a[lda*k+k];
                }



            if (nm1 >= 1)
                for (kb = 1; kb < nm1; kb++)
                    {
                    k = n - (kb+1);
                    b[k] = b[k] + ddot_ur(n-(k+1),&a[lda*k+k+1],1,&b[k+1],1);
                    l = ipvt[k];
                    if (!(l == k))
                        {
                        t = b[l];
                        b[l] = b[k];
                        b[k] = t;
                        }
                    }
            }
        }
    }



void daxpy_r(int n,int da,int *dx,int icx,int *dy,int icy)

    {
    int i,ix,iy;

    if (n <= 0)
        return;
    if (da == 0)
        return;

     if (icx != 1 || icy != 1)
        {

        ix = 1;
        iy = 1;
        if(icx < 0) ix = (-n+1)*icx + 1;
        if(icy < 0)iy = (-n+1)*icy + 1;
        for (i = 0;i < n; i++)
            {
            dy[iy] = dy[iy] + da*dx[ix];
            ix = ix + icx;
            iy = iy + icy;
            }
        return;
        }



    for (i = 0;i < n; i++)
        dy[i] = dy[i] + da*dx[i];
    }




 int ddot_r(int n,int *dx,int icx,int *dy,int icy)

    {
    int dtemp;
    int i,ix,iy;

    dtemp = ZERO;

    if (n <= 0)
        return(ZERO);

    if (icx != 1 || icy != 1)
        {

        ix = 0;
        iy = 0;
        if (icx < 0) ix = (-n+1)*icx;
        if (icy < 0) iy = (-n+1)*icy;
        for (i = 0;i < n; i++)
            {
            dtemp = dtemp + dx[ix]*dy[iy];
            ix = ix + icx;
            iy = iy + icy;
            }
        return(dtemp);
        }



    for (i=0;i < n; i++)
        dtemp = dtemp + dx[i]*dy[i];
    return(dtemp);
    }



void dscal_r(int n,int da,int *dx,int ic)

    {
    int i,nincx;

    if (n <= 0)
        return;
    if (ic == 1)
        printf("increment is 1\n");
    else
        {



        nincx = n*ic;
        for (i = 0; i < nincx; i = i + ic)
            dx[i] = da*dx[i];
        return;
        }



    for (i = 0; i < n; i++)
        dx[i] = da*dx[i];
    }




void daxpy_ur(int n,int da,int *dx,int icx,int *dy,int icy)

    {
    int i,ix,iy,m;

    if (n <= 0)
        return;
    if (da == 0)
        return;

    if (icx != 1 || icy != 1)
        {
        ix = 1;
        iy = 1;
        if(icx < 0) ix = (-n+1)*icx + 1;
        if(icy < 0)iy = (-n+1)*icy + 1;
        for (i = 0;i < n; i++)
            {
            dy[iy] = dy[iy] + da*dx[ix];
            ix = ix + icx;
            iy = iy + icy;
            }
        return;
        }



    m = n % 4;
    if ( m != 0)
        {
        for (i = 0; i < m; i++)
            dy[i] = dy[i] + da*dx[i];
        if (n < 4)
            return;
        }
    for (i = m; i < n; i = i + 4)
        {
        dy[i] = dy[i] + da*dx[i];
        dy[i+1] = dy[i+1] + da*dx[i+1];
        dy[i+2] = dy[i+2] + da*dx[i+2];
        dy[i+3] = dy[i+3] + da*dx[i+3];
        }
    }



int ddot_ur(int n,int *dx,int icx,int *dy,int icy)

    {
    int dtemp;
    int i,ix,iy,m;

    dtemp = 0;

    if (n <= 0)
        return(ZERO);

    if (!(icx == 1) || !(icy == 1))
        {

        ix = 0;
        iy = 0;
        if (icx < 0) ix = (-n+1)*icx;
        if (icy < 0) iy = (-n+1)*icy;
        for (i = 0;i < n; i++)
            {
            dtemp = dtemp + dx[ix]*dy[iy];
            ix = ix + icx;
            iy = iy + icy;
            }
        return(dtemp);
        }



    m = n % 5;
    if (m != 0)
        {
        for (i = 0; i < m; i++)
            dtemp = dtemp + dx[i]*dy[i];
        if (n < 5)
            return(dtemp);
        }
    for (i = m; i < n; i = i + 5)
        {
        dtemp = dtemp + dx[i]*dy[i] +
        dx[i+1]*dy[i+1] + dx[i+2]*dy[i+2] +
        dx[i+3]*dy[i+3] + dx[i+4]*dy[i+4];
        }
    return(dtemp);
    }


void dscal_ur(int n,int da,int *dx,int icx)

    {
    int i,m,nincx;

    if (n <= 0)
        return;
    if (icx == 1)
      printf("Equals 1\n");
    else
        {

        nincx = n*icx;
        for (i = 0; i < nincx; i = i + icx)
            dx[i] = da*dx[i];
        return;
        }



    m = n % 5;
    if (m != 0)
        {
        for (i = 0; i < m; i++)
            dx[i] = da*dx[i];
        if (n < 5)
            return;
        }
    for (i = m; i < n; i = i + 5)
        {
        dx[i] = da*dx[i];
        dx[i+1] = da*dx[i+1];
        dx[i+2] = da*dx[i+2];
        dx[i+3] = da*dx[i+3];
        dx[i+4] = da*dx[i+4];
        }
    }



int idamax(int n,int *dx,int icx)

    {
    int dmax,temp1;
    int i, ix, itemp;

   printf("n=%d, icx=%d\n",n,icx);

    if (n < 1)
        return(-1);
    if (n ==1 )
        return(0);
    if(icx != 1)
        {

        ix = 1;
        dmax = fabs((double)dx[0]);
        ix = ix + icx;
        for (i = 1; i < n; i++)
            { temp1 =fabs((double)dx[ix]); 
            if(temp1 > dmax)
                {
                itemp = i;
                dmax = fabs((double)dx[ix]);
                }
            ix = ix + icx;
            }
        }
    else
        {

        itemp = 0;
        dmax = fabs((double)dx[0]);
        for (i = 1; i < n; i++)
           { temp1 = fabs((double)dx[i]);
             if(temp1 > dmax)
                {
                itemp = i;
                dmax = fabs((double)dx[i]);
                }
          }
        }
    return (itemp);
    }

static int second(void)

    {
    return ((int)((int)clock()/(int)CLOCKS_PER_SEC));
    } 
