#include <stdio.h>

int fact(int n){
	if(n<=1){
		return 1;
	}
	else{
		return n * fact(n-1);
	}

}

int main(){
	int a,b;
	scanf("%d",&a);
	a = fact(a);
	if(a == 24){
		b = 1;
	}
	else{
		b=-1;
	}
	return 0;
}
