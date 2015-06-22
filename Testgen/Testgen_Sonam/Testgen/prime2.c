/* C program to check whether a number is prime or not. */

#include <stdio.h>

int _divides (int n, int m) {
  return (m % n == 0);
}

int main()
{
  int n, i, flag=0;
  printf("Enter a positive integer: ");
  scanf("%d",&n);
  for(i=2;i<=n/2;++i)
  {
      int d = _divides(i,n);
	      if(d==0)
      {
          flag=1;
          //break;
      }
  }
  if (flag==0)
      printf("%d is a prime number.\n",n);
  else
      printf("%d is not a prime number.\n",n);
  return 0;
}
