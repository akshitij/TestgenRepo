#include <stdio.h>
int foo(int x){
	if(x>2)
		x=3*x;
	else
		x=2*x;
	/*for(;x<5;x++){
		y = x+1;
	}*/
	return x;
}

int main(){
	int i,j;
	scanf("%d",&i);
	/*for(;i<8;){
		i = i+2;
	}*/
	if(i>8888){
		i = i/2;
		if(i<9999){
			j=2;
		}
		else{
			j=3;
		}
	}
	else
		j=1;
	i = foo(i);
	return 0;
}
