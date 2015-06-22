/* MDH WCET BENCHMARK SUITE. */

/* Changes:
 * JG 2005/12/08: Prototypes added, and changed exit to return in main.
 */

typedef  unsigned char  bool;
typedef  unsigned int   uint;

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
  if (even (n))
      return (n == 2);
  for (i = 3; i * i <= n; i += 2) { 
      if (_divides (i, n)) /* ai: loop here min 0 max 357 end; */
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
  int x =  21649;
  int y = 513239;
  swap (&x, &y);
  return (!(prime(x) && prime(y)));
}


