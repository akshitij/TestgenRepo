#include <stdio.h>
int foo(int x){
	printf("x = %d\n",x);
	int y;
	y = 10 * x;
	/*if(x>2)
		x=2*x;
	else
		x=3*x;*/
	y = (y>100) ? 99:y;
	return y;
}



int main(){
	int i,j,k;
	scanf("%d",&i);
	/*for(;i<8;){
		i = i+2;
	}*/
	if(i <= 2){
		//i = i/2;
		/*if(i>0){
			j=2;
		}
		else{
			j=3;
		}*/
		j=3;
	}
	else
	//i = foo(i);
	k = i*10;
	if(k>100){
		j=4;	
	}
	else
		j=9;
	return 0;
}
