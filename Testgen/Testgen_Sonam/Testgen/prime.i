# 1 "prime.c"
# 1 "/home/akshitij/Desktop/thesis/Testgen/Testgen_Sonam/Testgen//"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "prime.c"






typedef unsigned char bool;
typedef unsigned int uint;

bool divides (uint n, uint m);
bool even (uint n);
bool prime (uint n);
void swap (uint* a, uint* b);

bool divides (uint n, uint m) {
  return (m % n == 0);
}

bool even (uint n) {
  return (divides (2, n));
}

bool prime (uint n) {
  uint i;
  if (even (n))
      return (n == 2);
  for (i = 3; i * i <= n; i += 2) {
      if (divides (i, n))
          return 0;
  }
  return (n > 1);
}

void swap (uint* a, uint* b) {
  uint tmp = *a;
  *a = *b;
  *b = tmp;
}

int main () {
  uint x = 21649;
  uint y = 513239;
  swap (&x, &y);
  return (!(prime(x) && prime(y)));
}
