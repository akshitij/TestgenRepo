# 1 "structTest1.c"
# 1 "/home/akshitij/Desktop/thesis/Testgen/Testgen_Sonam/Testgen//"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "structTest1.c"
typedef struct Node{
  int a;
  int b[10];
}node;

node n;

int main(){
  int i,j;
  n.a = 3*n.a;
  if(n.a == 6){
    j=1;
  }
  else
    j=-1;
  return 0;
}