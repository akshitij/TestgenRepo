#include <stdio.h>
int foo(int x){
	int y;
	if(x>2)
		y=2;
	else
		y=4;
	/*for(;x<5;x++){
		y = x+1;
	}*/
	return y;
}

int main(){
	int i;
	scanf("%d",&i);
	for(;i<8;i++){
		i = i+2;
	}
	foo(2);
	return 0;
}
