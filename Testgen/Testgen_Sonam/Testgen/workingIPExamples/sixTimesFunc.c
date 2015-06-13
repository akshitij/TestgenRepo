#include <stdio.h>
int inc(int x){
	x = x + 1;
	return x;
}

int mult(int y){
	y = 6 * y;
	y = inc(y);
	return y;
}

int main(){
	int a,b;
	scanf("%d",&a);
	a = mult(a);
	if(a == 31)
		b=1;
	else
		b=2;
	return 0;
}
