# 1 "faculty.c"
# 1 "/home/akshitij/Desktop/thesis/Testgen/Testgen_Sonam/Testgen//"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "faculty.c"





int fac (int n)
{
  if (n == 0)
     return 1;
  else
     return (n * fac (n-1));
}

int main (void)
{
  int i;
  scanf("%d",&i);
  int s = 0;
  int n;

  n = 5;
  for (i = fac(i); i <= n; i++)
      s += fac (i);

  return (s);
}
