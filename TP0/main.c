#define _POSIX_C_SOURCE 200809L
#include <getopt.h>
#include "matrix.h"

const char HELP[] = "Usage:\n \ttp0 -h \n\ttp0 -V\n\ttp0 < in_input_file > out_input_file\n\nOptions:\n\t-V, --version Print version and quit.\n\t-h, --help Print this information and quit.\nExamples:\n\ttp0 < in.txt > out.txt\n\tcat in.txt | tp0 > out.txt" ;
const char VERSION[] = "XXXXXXXXXXXXXXXXXXXXXXXx\n"; // Buscar version
static struct option long_options[] = {
    {"version",  no_argument, 0,  0 }, 
    {"help",  no_argument, 0,  0 }
};        


struct read_line {
	int len_matrix;
	double *matrix_a_values;
	double *matrix_b_values;
} typedef read_line_t;

void asign_values_to_matrix(matrix_t* matrix, double values[], int n) {
	int i = 0;
	int final_n = n*n;
	for (; i < final_n; i++) {
		matrix->array[i] = values[i];      
	}
}

void print_array(double* arr, int n) {
	int i = 0;
	for (; i < n; i++) {
 		printf("%f ", arr[i]);
	}
	printf("\n");
}


int yyy(FILE* input_file, double* values, int* p_c, int line_no) {

	int r, i, len_matrix;

	i = 0;
	while (true) {
	    // probar pasarlo abajo
	    r = fscanf(input_file, "%lg", &values[i]);

	    if (r != 1) {
	    	printf("%s | line_no %d\n", "ERROR: No pattern found for double", line_no);
	    	return -1;
	    }

		int amount_of_values = len_matrix * len_matrix * 2; 
	    double* matrix_values = malloc(sizeof(double) * amount_of_values);


	    // !!!! printf("fscaneado: %f\n", matrix_values[i]);
	    while ((*p_c = getc(input_file))) {
	    	// !!!! printf("%d - %c\n", c, c);
	    	if (*p_c == ' ' || *p_c == '\t') {
	    		continue;
	    	} else if (*p_c >= 48 && *p_c <= 57) {
	    		ungetc(*p_c, input_file);
	    		i++;
	    		break;
	    	} else if (*p_c == '\n' || *p_c == -1) {
	    		break;
	    	} else {
	    		printf("%s | %c | line_no %d\n", "ERROR: Not a Number ;)", *p_c, line_no);
	    		return -1;
	    	}
	    }

	    if (*p_c == '\n' || *p_c == -1) {
	    	break;
	    }
	}

	return i+1;
}

read_line_t* zzz(FILE* input_file, int* p_c, int line_no) {

	int r, len_matrix;

	r = fscanf(input_file, "%d", &len_matrix);

	if (r != 1) {
	   	printf("%s | line_no %d\n", "ERROR: No pattern found for len_matrix", line_no);
	   	return NULL;
 	}

	int amount_of_values = len_matrix * len_matrix * 2; 
	double* matrix_values = malloc(sizeof(double) * amount_of_values);

	int amount_of_values_read = yyy(input_file, matrix_values, p_c, line_no);
	if (amount_of_values < 0) {
		return NULL;
	}
	    
	// There are no more numbers after the required ones.
	if (amount_of_values != amount_of_values_read) {
	   	printf("%s | %d vs %d | line_no %d\n", "ERROR: mismatched amount of values", amount_of_values, amount_of_values_read, line_no);
	   	return NULL;
	}

	read_line_t* read_line = malloc(sizeof(read_line_t));
	if (!read_line) return NULL;

	read_line->len_matrix = len_matrix;
	read_line->matrix_a_values = matrix_values;
	read_line->matrix_b_values = matrix_values + (len_matrix*len_matrix);

	return read_line;
}

int parse_and_multiply_matrixes(FILE* input_file, FILE* output_file) {

	int len_matrix;
    int c;
    int r;

    int line_no = 0;
    while (true) {
    	line_no += 1;

	    read_line_t* read_line = zzz(input_file, &c, line_no);
	    if (!read_line) {
	    	return -1;
	    }

	    int len_matrix = read_line->len_matrix;

    	matrix_t* matrix_a = create_matrix(len_matrix, len_matrix);
    	asign_values_to_matrix(matrix_a, read_line->matrix_a_values, len_matrix);

    	matrix_t* matrix_b = create_matrix(len_matrix, len_matrix);
    	asign_values_to_matrix(matrix_b, read_line->matrix_b_values, len_matrix);

    	// !!!! cambiar a out
    	print_matrix(output_file, matrix_a);
		print_matrix(output_file, matrix_b);
		print_matrix(output_file, matrix_multiply(matrix_a, matrix_b));

	    if (c == -1) {
	    	break;
	    }
    }

    return 0;
}


int verify_argv(int argc, char * argv []) {

	int opt;

    while ((opt = getopt_long(argc, argv, "Vha:i:o:", long_options, 0)) != -1) { 

    	switch (opt) {
    		case 'h':
    			fprintf(stdout, HELP);
    			return 0;

    		case 'V':
    			fprintf(stdout, VERSION);
    			return 0;
            
            case '0':
                abort();
    	}
    }
    
    if (argc != 3) {
        fprintf(stderr, "%s\n", "Error: Cantidad de parametros erronea");
	    return 1;
    }

    return 0;
}


int main(int argc, char * argv []) {

    int r;
    if ((r = verify_argv(argc, argv)) != 0) {
    	return r;
    }
	
    FILE* input_file = fopen(argv[1],"r");
    FILE* output_file = fopen(argv[2], "w"); 
    
    if (!input_file || !output_file) {
    	fprintf(stderr, "File not found \n"); 
    	return 1;
    }

    r = parse_and_multiply_matrixes(input_file, output_file);
    if (r < 0) {
    	exit(1);
    }
		
    // !!!! printf("%s\n", "ENDED NICELY");

    fclose(input_file);
    fclose(output_file); 
    return 0;
}
