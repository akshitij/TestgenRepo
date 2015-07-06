#include <stdio.h>
int foo(int a[],int n){
	int i=0;
	for(i=0; i<n; i++)
		a[i] = (3 * a[i]) + 1;
}

int main(){
	int b[10];
	int i,size,j;
	printf("----------------------------------EXECUTION START------------------------\n");
	scanf("%d",&size);
	for(i=0;i<size;i++)
		scanf("%d",&b[i]);
	foo(b,size);
	/*for(i=0;i<size;i++)
		printf("%d ",b[i]);
	printf("\n");*/
	if(b[1] == 13)
		j=1;
	else
		j=-1;
	printf("j = %d\n",j);
	return 0;
}
	
