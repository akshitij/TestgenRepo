#include <stdio.h>
int foo(){
	static int a;
	int b=2;
	//scanf("%d",&a);
	if(a>10){
		b=1;
	}
	else{
		a=78;
		/*if(a<4)
			b=3;
		/*else
			exit(0);*/
	}
	return 0;
}
int main(){
	return foo();
}

