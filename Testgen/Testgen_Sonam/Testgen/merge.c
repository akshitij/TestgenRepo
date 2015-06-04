#include<stdio.h>

void merge(n1,n2)
{
 int a[30],b[30],c[30],i,j,k;

  i=0;j=0;k=0;  /* merging starts */

 while(i < n1 && j < n2)
 {
  if(a[i] <= b[j])
   {
   c[k]=a[i];
   i++;k++;
   }
  else
   {
   c[k]=b[j];
   k++;j++;
   }
 }

 /* Some elements in array 'a' are still remaining
    where as the array 'b' is exhausted */

 while(i < n1)
  {
  c[k]=a[i];
  i++;k++;
  }

 /* some elements in array b are still remaining
    whereas the array 'a' is exhausted */

 while(j < n2)
  {
  c[k]=b[j];
  k++;j++;
  }

 /* Displaying elements of array 'c' 

        printf("nMerged array is :");

        for(i=0;i 〈 n1+n2;i++)
           printf("n %d",c[i]);
getch();*/

}
