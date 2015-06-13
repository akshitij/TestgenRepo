#include <stdio.h>
int a;
void foo(){
	if(a < 0){
		a = a * -1;
	}
	else{
		a = a * 1;
	}		
	//return n;
}

int main(){
	int b;
	scanf("%d",&a);
	//a should be positive
	foo();
	if(a >= 55){
		b = 1;
	}
	else{
		b=-1;
	}
	return 0;
}
