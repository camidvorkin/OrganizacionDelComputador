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

    matrix_t* result = create_matrix(m1->rows, m2->cols);
    if (!result)return NULL;
    int n = result->rows * result->cols;
    int i = 0;
    for ( ; i < m1->rows ; i++ ) {
        int j = 0;
        for ( ; j < m2->cols; j++) {
            int k = 0;
            double acc = 0;
            for ( ; k < m1->cols; k++) {
                int p1 = i*m1->cols+k;
                int p2 = k*m1->cols+j;
                acc += m1->array[p1] * m2->array[p2]; 
            }
            result->array[i*result->cols + j] = acc;
        }
    }

    return result;
}


void check_fprint(FILE* fp, int copy) {
    fflush(fp);
    if (copy < 0){
        fprintf(stderr,"Error en la copia del archivo resultante\n");
        exit(EXIT_FAILURE);
    }
}
