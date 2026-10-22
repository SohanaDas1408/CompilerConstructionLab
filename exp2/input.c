// This is a sample C program for Experiment 2
/* 
   Compiler Construction Lab
   Demonstration of token counter
*/
#include <stdio.h>

int main() {
    int count = 10;
    float sum = 0.0;

    // Loop to calculate sum
    for (int i = 0; i < count; i++) {
        sum += i;
    }

    /* Print result */
    printf("Sum is %f\n", sum);
    return 0;
}
