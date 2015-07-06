#include <stdio.h>

int cummulative(int x){
	if(x <= 0){
		return 0;
	}
	else{
		return x + cummulative(x-1);
	}

}

int main(){
	int a,c;
	scanf("%d",&a);
	a = cummulative(a);
	if(a < 25){
		c = 1;
	}
	else{
		c = -1;
	}
	printf("%d\n",c);
	return 0;
}
