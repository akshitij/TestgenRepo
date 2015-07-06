#include <stdio.h>

int foo(int n){
	int res;
	if(n < 0){
		res = n * -1;
	}
	else{
		res = n;
	}		
	return res;
}

int main(){
	int a,b;
	scanf("%d",&a);
	//b = foo(a) should give 100%
	a = foo(a);
	if(a>=0){
		if(a >= 10){
			b=10;
		}
		else{
			b=9;
		}
	}
	else{
		b=-1;
	}
	return 0;
}
