#include <stdio.h>

extern int fibonacci(int x);

int main(int argc, char **argv)
{
  int number=0;
  int result=0;
  int counter=10;
//  scanf("%d",&number);
  while(number < counter)
  {  
    result = fibonacci(number++);   
    printf("The fibonacci sequence at %d is: %d\n", number, result);
  }
}

