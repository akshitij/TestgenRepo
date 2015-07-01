#include <stdio.h>
#include <stdlib.h>

float dopoly(float x) {

  float mu = 10.0;
  float s;
  int j;
  float pol[100];

  for (j=0; j<100; j++) {
    pol[j] = mu = (mu + 2.0) / 2.0;
  }
  s = 0.0;
  for (j=0; j<100; j++) {
    s = x*s + pol[j];
  }
  return s;
}

main() {
  float x;
  float pu = 0.0;
  int  i, n;
  scanf("%d",&n);
  scanf("%f",&x);
  
  for(i=0; i<n; i++) {
    pu += dopoly(x);
  }
  printf("%f\n",pu);
}
