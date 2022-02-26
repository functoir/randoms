/**
 * @file rho.c
 * @author siavava <amittaijoel@outlook.com>
 * @brief The Pollard's rho algorithm. 
 * @version 0.1
 * @date 2022-02-26
 * 
 * @copyright Copyright (c) 2022
 * 
 */

#include <stdio.h>
#include <stdlib.h>

/**
 * @brief gcd function.
 * 
 * @param a first number.
 * @param b second number.
 * @return int value -- the greatest common divisor of the pair.
 */
int gcd(int a, int b) 
{
  int remainder;
  while (b != 0) {
    remainder = a % b;
    a = b;
    b = remainder;
  }
  return a;
}

/**
 * @brief main function.
 * 
 * @param argc: argument count
 * @param argv: argument vector
 * @return int: exit status.
 */
int
main (int argc, char *argv[]) 
{

  if (argc != 2) {
    fprintf(stderr, "Usage: %s <number>\n", argv[0]);
    exit(1);
  }

  int loop = 1, count;
  unsigned long long int number = -1;
  char* excess;

  number = strtol(argv[1], &excess, 10);

  if (number == 0) {
    fprintf(stderr, "Invalid number: %lld\n", number);
    exit(0);
  }
  int x_fixed = 2, x = 2, size = 2;
  unsigned long long int factor;

  do {
    printf("----   loop %4d   ----\n", loop);
    count = size;
    do {
      x = (x * x + 1) % number;
      factor = gcd(abs(x - x_fixed), number);
      printf("count = %4i  x = %6i  factor = %lld\n", size - count + 1, x, factor);
    } while (--count && (factor == 1));
    size *= 2;
    x_fixed = x;
    loop++;
  } while (factor == 1);
  printf("factor is %lld\n", factor);
  return factor == number ? EXIT_FAILURE : EXIT_SUCCESS;
}
