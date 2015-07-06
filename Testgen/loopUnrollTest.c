#include <stdio.h>

int foo(int n){
	int i,c=0;
	for(i=0; i<n; i++){
		c = c + 2;
	}
	return c;
}

int main(){
	int a,b;
	scanf("%d",&a);
	if(a>=0){
		b=1;
	}
	else{
		b=-1;
	}
	return 0;
}
