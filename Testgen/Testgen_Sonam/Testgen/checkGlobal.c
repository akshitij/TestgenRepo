#include <stdio.h>
int asdf;
int foo(){
  int j;
  if(asdf > 0)
    j=1;
  else
    j = -1;
  return 0;    
}

int main(){
  int i,j;
  scanf("%d",&i);
  if (i >10)
    j=2;
  else
    foo();
  return 0;  


}
