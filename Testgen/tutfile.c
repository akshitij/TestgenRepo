#include <stdio.h>
//int a;


int fact(int n){
	if(n==1)
		return 1;
	else
		return n*fact(1);
}

int dec(int x){
	int y=fact(x);
        if(x>0)
	exit (0);
	return x--;
}

int add(int a,int b){
	int c = a+b;
	printf("what");
	while(a<0){
	if(b<0){
		exit(0);
	}
	a = dec(a);
	}
	return c;
}

double sub(double x, double y){
	double c = (x>y) ? x-y : y-x;
	while(x){
		x--;
	}
	add(x,3);
	add(y,4);
	return c;
}

int main(){
	int b=5;
	char x = 'f';
	double f = 0.0;
	//add(b,9);
	sub(2.0,f);
	for(b=0;b<8;b++){
		x++;
	}
	return 0;
}
