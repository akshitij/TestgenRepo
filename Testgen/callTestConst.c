#include <stdio.h>

int foo(int n){
	int res;
	res = 1;
	return res;
}

int main(){
	int a,b;
	scanf("%d",&a);
	//b = foo(a) should give 100% but wont because of unorganised pathSymbol pass, have setup call env first
	//a = foo(a);
	b = foo(a);
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
