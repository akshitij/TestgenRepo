#include <stdio.h>

int foo(int n){
  int i;
  for(i=0; i<n ; i++){
    n = n-1;
  }
  return n;
}

int main(){
  int a,b,i;
  scanf("%d",&a);
  a = foo(a);
  if(a > 5)
    b=1;
  else
    b=-1;
  return 0;
}
