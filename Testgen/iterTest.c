#include <stdio.h>

int main(){
  int a,b,i;
  scanf("%d",&a);
  for(i=0; i<a ; i++){
    a = a-1;
  }
  if(a > 5)
    b=1;
  else
    b=-1;
  return 0;
}
