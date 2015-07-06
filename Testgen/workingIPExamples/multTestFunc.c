#include <stdio.h>
/*int inc(int x){
	x = x + 1;
	return x;
}
*/
int mult(int x, int y){
	int z;
	z = x * y;
	return z;
}

int main(){
	int a,b,c,d;
	scanf("%d",&a);
	scanf("%d",&b);
	c = mult(a,b);
	if(c >= 0)
		d=1;
	else
		d=2;
	return 0;
}
