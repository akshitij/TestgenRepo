#include<stdio.h>
 

int mult2(int a,int b){
    return a*b;
} 
 
int main() {
   int num1, num2;
   scanf("%d", &num1);
   scanf("%d", &num2);
   int *p = &num1;
   int *q = &num2;

   int c = mult2(*p, *q);
   
   int j;
   if(c==27)
      j=1;
   else
      j =-1;
    
   printf("First number  : %d\n", num1);
   printf("Second number : %d\n", num2);
   printf("j = %d\n",j);
 
   return (0);
}
