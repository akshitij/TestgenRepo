#include <stdio.h>

int foo(int n){
	n = 3*n;
	return n;
}

int main(){
	int a,b;
	scanf("%d",&a);
	a = foo(a);
	if(a == 45){
		b = 1;
	}
	else{
		b=-1;
	}
	return 0;
}
