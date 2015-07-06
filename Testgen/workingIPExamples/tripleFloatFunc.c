#include <stdio.h>
float foo(float n){
	n = n*3.3;
	return n;
}

int main(){
	float a,b;
	scanf("%f",&a);
	a = foo(a);
	if(a >= 15.5){
		b = 1.1;
	}
	else{
		b=-1.1;
	}
	return 0;
}
