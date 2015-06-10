#include <stdio.h>

int func(int x,int y){
  if(y <= 1){
    return 1;
  }
  else{
    return x * func(x-1,y);
  }
}

int main(){
  int a = 5,b=3;
  int c = func(a+b,a-b);
  printf("%d\n",c);
  return 0;
}

