#include <stdio.h>

int main(){
	float a,b;
	scanf("%f",&a);
	printf("a = %f\n",a);
	a = a*3.3;
	if(a >= 15){
		b = 1.1;
	}
	else{
		b=-1.1;
	}
	return 0;
}
