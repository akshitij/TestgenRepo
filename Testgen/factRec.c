#include <stdio.h>

int fact(int x,int y){
	if(y <= 1){
		return 1;
	}
	else{
		return x * fact(x-1,y-1);
	}

}

int main(){
	int a,b=3,c;
	scanf("%d",&a);
	a = fact(a,b);
	if(a == 20){
		c = 1;
	}
	else{
		c = -1;
	}
	printf("%d\n",c);
	return 0;
}
