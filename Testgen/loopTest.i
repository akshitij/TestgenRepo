# 1 "loopTest.c"
# 1 "/home/akshitij/Desktop/thesis/Testgen//"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "loopTest.c"
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

 return 0;
}
