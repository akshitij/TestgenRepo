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
	if(a>=0){
		b=1;
	}
	else{
		b=-1;
	}
	return 0;
}
