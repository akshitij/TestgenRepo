#include<stdio.h>


int b(int A[], int l, int r, int key)
{
    int m;
   
    while( l <= r )
    {
        m = l + (r-l)/2;
      
        if( A[m] == key ) 
            return m;
 
        if( A[m] < key ) 
            l = m + 1;
        else
            r = m - 1;
    }
 
    return -1;
}














