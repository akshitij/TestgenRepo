#include<stdio.h>
 
void mult(int *a, int *b) {
   *a = (*a * 3) + 1;
   *b = (*b * 4) - 1;
}
 
int main() {
   int num1, num2;
   scanf("%d", &num1);
   scanf("%d", &num2);
   int *p = &num1;
   int *q = &num2;

   mult(p, q);
   
   int j;
   if(num1 == num2)
      j=1;
   else
      j =-1;
    
   printf("First number  : %d\n", num1);
   printf("Second number : %d\n", num2);
 
   return (0);
}
