#include <stdio.h>
void foo2(int c[], int m){
	c[0] = c[0]*3 + 1;
}

int foo1(int b[], int n){
	n=1;
	int j;
	printf("----------------------------------EXECUTION START------------------------\n");
	foo2(b,n);
	if(b[0] == 7)
		j=1;
	else
		j=-1;
	printf("j = %d\n",j);
	return 0;
}
	
