# 1 "prime3.c"
# 1 "/home/akshitij/Desktop/thesis/Testgen/Testgen_Sonam/Testgen//"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "prime3.c"






typedef unsigned char bool;
typedef unsigned int uint;

int _divides (int n, int m);
int even (int n);
int prime (int n);
void swap (int* a, int* b);

int _divides (int n, int m) {
  return (m % n == 0);
}

int even (int n) {
  return (_divides (2, n));
}

int prime (int n) {
  int i;
  if (n%2==0)
      return (n == 2);
  for (i = 3; i * i <= n; i += 2) {
      if (n%i==0)
          return 0;
  }
  return (n > 1);
}

void swap (int* a, int* b) {
  int tmp = *a;
  *a = *b;
  *b = tmp;
}

int main () {
  int x = 21649;
  int y = 513239;
  swap (&x, &y);
  return (!(prime(x) && prime(y)));
}
