#include<stdio.h>

int main()
{
  int side1,side2,side3;

  scanf("%d%d%d",&side1,&side2,&side3);
  
 
  if(side1<0 || side2<0 || side3<0)
    printf("Illegal arguments !! \n");
  else
    {
      int triang = 0;
      if(side1 == side2)
        triang = triang+1;

      else
        printf("not equal side1 and side2 \n");
    
      if(side2 == side3)
        triang = triang+2;
      else
        printf("not equal side2 and side3 \n");

      if(side1 == side3)
        triang = triang+3;
      else
        printf("not equal side1 and side3 \n");

      printf("side1=%d, side2=%d, side3=%d, triang = %d\n", side1,side2,side3,triang);

      if(triang == 0)
        {
          if((side1 + side2 < side3) || (side2 + side3 < side1) || (side1 + side2 < side3))
            printf("Illegal arguments !! \n");
          else
            printf("Scalene triangle \n");
        } 
      else
        {
          if(triang > 3)
            printf("Equilateral triangle \n");
          else
            {
              if(triang==1 && side1+side2>side3)
                printf("Isosceles triangle \n");
              else
                {
                  if(triang==2 && side2+side3>side1)
                    printf("Isosceles triangle \n");
                  else
                    {
                      if(triang==3 && side1 + side3 > side2)
                        printf("Isosceles triangle \n");
                      else
                        printf("ILLegal !!! \n");
                    }
                }

            }
        }
 
    }

  return 0;
}
