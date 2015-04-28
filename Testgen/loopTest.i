# 1 "loopTest.c"
# 1 "/home/akshitij/Desktop/thesis/Testgen//"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "loopTest.c"
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

 return 0;
}
