#include <stdio.h>
int foo(int x){
	int y,i=0;
	for(i=0;i<x;i++){
		y = y + i;
	}	
	return y;
}

int main(){
	int i,j,k;
	scanf("%d",&i);
	k = i*10;
	for(;k<100;k=k+10){
		j=j+i;
	}
	return 0;
}
