# 1 "sqrtwcet.c"
# 1 "/home/akshitij/Desktop/thesis/Testgen/Testgen_Sonam/Testgen//"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "sqrtwcet.c"
# 52 "sqrtwcet.c"
float fabs(float x)
{
   if (x < 0)
      return -x;
   else
      return x;
}

float sqrtfcn(float val)
{
   float x = val/10;

   float dx;

   double diff;
   double min_tol = 0.00001;

   int i, flag;

   flag = 0;
   if (val == 0 )
      x = 0;
   else {
      for (i=1;i<20;i++)
      {
         if (!flag) {
            dx = (val - (x*x)) / (2.0 * x);
            x = x + dx;
            diff = val - (x*x);
            if (fabs(diff) <= min_tol)
               flag = 1;
         }
         else {}

      }
   }
   return (x);
}
