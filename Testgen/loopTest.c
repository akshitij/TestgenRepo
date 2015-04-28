int foo(int b2){
	int c,b2=0;
	for(b2=0;b2<8;b2++){
		c = b2++;
	}
	return c;
}

int main(){
	int c,b;
	scanf("%d",&b);
	for(b=0;b<8;b++){
		c = b++;
	}
	//foo(2);
	return 0;
}
