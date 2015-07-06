#include <stdio.h>
void foo2(int c[], int m,int l){
	c[l] = c[l]*3 + 1;
}

int foo1(int b[], int n){
	n=10;
	int j,k=5;
	printf("----------------------------------EXECUTION START------------------------\n");
	foo2(b,n,k);
	if(b[k] == 7)
		j=1;
	else
		j=-1;
	printf("j = %d\n",j);
	return 0;
}
	
