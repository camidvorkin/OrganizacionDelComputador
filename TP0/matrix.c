#include <errno.h>
#include "matrix.h"

struct matrix {
    size_t rows;
    size_t cols;    
    double* array;
};


matrix_t* create_matrix(size_t rows, size_t cols){
    
    matrix_t* matrix = malloc(sizeof(matrix_t));
    if(!matrix) return NULL;

    matrix->rows = rows;
    matrix->cols = cols;
 
    // scanf stdin para leer los valores?

    return matrix;
}


void destroy_matrix(matrix_t* m){
    free(m->array);
    free(m);
}


int print_matrix(FILE* fp, matrix_t* m){

    for(int i = 0; i < m->rows * m->cols -1 ; i++){
        int copy = fprintf(fp," %f", m->array[i]);
	    fflush(fp);
	    if (copy < 0){
            fprintf(stderr,"Error en la copia del archivo resultante\n");
		    exit(EXIT_FAILURE);
		}
	}
    return 0;
}



matrix_t* matrix_multiply(matrix_t* m1, matrix_t* m2){

    matrix_t* matrix_resultante = create_matrix(m1->rows, m1->cols);
    if(!matrix_resultante) return NULL;

    return matrix_resultante;
}

