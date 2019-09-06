#include <errno.h>
#include "matrix.h"


void check_fprint(FILE* fp, int copy);


matrix_t* create_matrix(size_t rows, size_t cols){
    
    matrix_t* matrix = malloc(sizeof(matrix_t));
    if (!matrix) return NULL;

    matrix->rows = rows;
    matrix->cols = cols;
 
    int n = rows*cols;
    matrix->array = malloc(sizeof(double)* n);
    if (!matrix->array) {
        free(matrix);
        return NULL;
    }

    return matrix;
}


void destroy_matrix(matrix_t* m){
    free(m->array);
    free(m);
}


int print_matrix(FILE* fp, matrix_t* m){


    int i = 0 ;
    int n = m->rows * m->cols;
    int copy;

    copy = fprintf(fp, "%d", n);
    check_fprint(fp, copy);

    for (; i < n ; i++) {
        copy = fprintf(fp," %f", m->array[i]);
	    check_fprint(fp, copy);
	}

    copy = fprintf(fp, "\n");
    check_fprint(fp, copy);

    return 0;
}

matrix_t* matrix_multiply(matrix_t* m1, matrix_t* m2){

    matrix_t* matrix_resultante = create_matrix(m1->rows, m1->cols);
    if(!matrix_resultante) return NULL;

    return matrix_resultante;
}


void check_fprint(FILE* fp, int copy) {
    fflush(fp);
    if (copy < 0){
        fprintf(stderr,"Error en la copia del archivo resultante\n");
        exit(EXIT_FAILURE);
    }
}

