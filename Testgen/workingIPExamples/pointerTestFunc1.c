#include<stdio.h>
 
void swap(int *num1, int *num2) {
   if(*num1 < *num2){
     int temp;
     temp = *num1;
     *num1 = *num2;
     *num2 = temp;
   }
}
 
int main() {
   int num1, num2;
   scanf("%d", &num1);
   scanf("%d", &num2);
   int *p = &num1;
   int *q = &num2;
   swap(p, q);
   //swap(&num1,&num2);
   
   //int c = num1 + num2;
   int j;
   if(num1 < num2)
      j=1;
   else
      j =-1;
    
   printf("First number  : %d\n", num1);
   printf("Second number : %d\n", num2);
 
   return (0);
}
