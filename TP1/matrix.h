#ifndef MATRIX_H
#define MATRIX_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

struct matrix {
    size_t rows;
    size_t cols;
    double* array;
};

typedef struct matrix matrix_t;

// Constructor de matrix_t
matrix_t* create_matrix(size_t rows, size_t cols);

// Constructor de matrix_t mymalloc
matrix_t* create(size_t rows, size_t cols);

// Destructor de matrix_t
void destroy_matrix(matrix_t* m);

// Destructor de matrix_t mips myfree
void destroy(matrix_t* m);

// Imprime matrix_t sobre el file pointer fp en el formato solicitado por el enunciado
int print_matrix(FILE* fp, matrix_t* m);

// Multiplica las matrices en m1 y m2
matrix_t* matrix_multiply(matrix_t* m1, matrix_t* m2);


#endif
