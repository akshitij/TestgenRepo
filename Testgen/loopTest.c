int foo(int a){
	int s = 0,y = 0;
	for(y=0; y<a; y++){
		s = s + y;
	}
	return s;
}

int main(){
	int b;
	for(b=0;b<8;b++){
		b++;
	}
	foo(2);
	return 0;
}
