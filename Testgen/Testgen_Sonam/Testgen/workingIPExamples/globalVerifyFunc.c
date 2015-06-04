#include <stdio.h>
int a;

void foo(){
	a = 3*a;
}

int main(){
	int b;
	scanf("%d",&a);
	foo();
	if(a == 51)
		b=1;
	else
		b=2;
	return 0;
}
