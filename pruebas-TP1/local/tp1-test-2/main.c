#define _POSIX_C_SOURCE 200809L
#include "matrix.h"

#define OPT_HELP "-h"
#define OPT_VERSION "-V"

const char HELP[] = "Usage:\n \tTP0 -h \n\tTP0 -V\n\tTP0 < in_input_file > out_input_file\n\nOptions:\n\t-V, --version Print version and quit.\n\t-h, --help Print this information and quit.\nExamples:\n\tTP0 < in.txt > out.txt\n\tcat in.txt | TP0 > out.txt\n" ;
const char VERSION[] = "First version\n";


struct read_line {
	size_t len_matrix;
	double *matrix_a_values;
	double *matrix_b_values;
} typedef read_line_t;


void asign_values_to_matrix(matrix_t* matrix, double values[], size_t n) {
	size_t i = 0;
	size_t final_n = n*n;
	for (; i < final_n; i++) {
		matrix->array[i] = values[i];      
	}
}

read_line_t* read_line_create(size_t len_matrix, double* matrixes_values) {
	read_line_t* read_line = malloc(sizeof(read_line_t));
	if (!read_line) return NULL;

	read_line->len_matrix = len_matrix;
	read_line->matrix_a_values = matrixes_values;
	read_line->matrix_b_values = matrixes_values + (len_matrix*len_matrix);

	return read_line;
}

void read_line_free(read_line_t* read_line) {
	free(read_line->matrix_a_values);
	free(read_line);
}


size_t obtain_matrixes_values(FILE* input_file, double* values, int* p_c, int line_no) {

	int r;
	size_t i;

	i = 0;
	while (true) {
	    r = fscanf(input_file, "%lg", &values[i]);

	    if (r != 1) {
	    	printf("%s | line_no %d\n", "ERROR: No pattern found for double", line_no);
	    	return -1;
	    }

	    while ((*p_c = getc(input_file))) {
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

read_line_t* parse_line(FILE* input_file, int* p_c, int line_no) {

	int r;
	size_t len_matrix;

	r = fscanf(input_file, "%lu", &len_matrix);

	if (r != 1) {
	   	printf("%s | line_no %d\n", "ERROR: No pattern found for len_matrix", line_no);
	   	return NULL;
 	}

	size_t amount_of_values = len_matrix * len_matrix * 2; 
	double* matrixes_values = malloc(sizeof(double) * amount_of_values);

	size_t amount_of_values_read = obtain_matrixes_values(input_file, matrixes_values, p_c, line_no);
	if (amount_of_values < 0) {
		return NULL;
	}
	    
	// There are no more numbers after the required ones.
	if (amount_of_values != amount_of_values_read) {
	   	printf("%s | %lu vs %lu | line_no %d\n", "ERROR: mismatched amount of values", amount_of_values, amount_of_values_read, line_no);
	   	return NULL;
	}

	read_line_t* read_line = read_line_create(len_matrix, matrixes_values);
	if (!read_line) return NULL;

	return read_line;
}

int parse_and_multiply_matrixes(FILE* input_file, FILE* output_file) {

    int c;

    int line_no = 0;
    while (true) {
    	line_no += 1;

	    read_line_t* read_line = parse_line(input_file, &c, line_no);
	    if (!read_line) {
	    	return -1;
	    }

	    size_t len_matrix = read_line->len_matrix;

    	matrix_t* matrix_a = create_matrix(len_matrix, len_matrix);
    	if (!matrix_a) {
    		read_line_free(read_line);
    		return -2;
    	}
    	asign_values_to_matrix(matrix_a, read_line->matrix_a_values, len_matrix);

    	matrix_t* matrix_b = create_matrix(len_matrix, len_matrix);
    	if (!matrix_b) {
    		read_line_free(read_line);
    		free(matrix_a);
    		return -2;
    	}
    	asign_values_to_matrix(matrix_b, read_line->matrix_b_values, len_matrix);

    	matrix_t* matrix_c = matrix_multiply(matrix_a, matrix_b);
    	if (!matrix_c) {
    		read_line_free(read_line);
    		free(matrix_a);
    		free(matrix_b);
    		return -2;
    	}
		print_matrix(output_file, matrix_c);

		read_line_free(read_line);
		destroy_matrix(matrix_a);
    	destroy_matrix(matrix_b);
    	destroy_matrix(matrix_c);
    		
    	// Stop when EOF reached.
	    if (c == -1) {
	    	break;
	    }
    }

    return 0;
}


int verify_argv(int argc, char * argv []) {
	
	if (!strcmp(argv[1], OPT_HELP)) {
		fprintf(stdout, HELP);
    	return 1;
	} else if (!strcmp(argv[1], OPT_VERSION)) {
		fprintf(stdout, VERSION);
    	return 1;
	}
	if (argc != 3) {
        fprintf(stderr, "%s\n", "Error: Cantidad de parametros erronea");
	    return -1;
    }
    return 0;
}


int main(int argc, char * argv []) {

    int r;
    if ((r = verify_argv(argc, argv)) != 0) {
    	return r;
    } else if (r < 0) {
    	return -r;
    }
	
    FILE* input_file = fopen(argv[1],"r");
    if (!input_file) {
    	fprintf(stderr, "File not found: %s\n", argv[1]); 
    	return 1;
    }

    FILE* output_file = fopen(argv[2], "w"); 
    if (!output_file) {
    	fclose(output_file);
    	fprintf(stderr, "File not found: %s\n", argv[2]); 
    	return 1;
    }

    r = parse_and_multiply_matrixes(input_file, output_file);
    if (r < 0) {
    	exit(-r);
    }

    fclose(input_file);
    fclose(output_file);
    return 0;
}
