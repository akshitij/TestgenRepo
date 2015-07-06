#include <stdio.h>
int main(){
  int *p;
  int i,j;
  scanf("%d",&i);
  p = &i;
  *p = i * 3;
  printf("%d ",*p);
  if (*p == 12)
    j=1;
  else
    j=-1;
  printf("%d\n",j);
  return 0;
}
