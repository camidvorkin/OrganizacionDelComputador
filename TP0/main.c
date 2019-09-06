#define _POSIX_C_SOURCE 200809L
#include <getopt.h>
#include "matrix.h"

const char HELP[] = "Usage:\n \ttp0 -h \n\ttp0 -V\n\ttp0 < in_input_file > out_input_file\n\nOptions:\n\t-V, --version Print version and quit.\n\t-h, --help Print this information and quit.\nExamples:\n\ttp0 < in.txt > out.txt\n\tcat in.txt | tp0 > out.txt" ;
const char VERSION[] = "XXXXXXXXXXXXXXXXXXXXXXXx\n"; // Buscar version
static struct option long_options[] = {
    {"version",  no_argument, 0,  0 }, 
    {"help",  no_argument, 0,  0 }
};        


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

char * generate_values_format(int n) {

	int len_format = n * 3 + 1;

	char *format = malloc(sizeof(char) * len_format);
	int i = 0;
	for (; i < n; i++) {
		format[i*3] = '%';
		format[i*3+1] = 'g';
		format[i*3+2] = ' ';
	}
	format[len_format - 1] = '\0';

	return format;
}


void xxx(FILE* input_file, FILE* output_file) {
	
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

    int rr;
    if ((rr = verify_argv(argc, argv)) != 0) {
    	return rr;
    }
	
    FILE* input_file = fopen(argv[1],"r");
    FILE* output_file = fopen(argv[2], "w"); 
    
    if (!input_file || !output_file) {
    	fprintf(stderr, "File not found \n"); 
    	return 1;
    }
		
    int len_matrix;
    int c;
    int r;

    int line_no = 0;
    while (true) {
    	line_no += 1;
	    r = fscanf(input_file, "%d", &len_matrix);

	    if (r != 1) {
	    	printf("%s | line_no %d\n", "ERROR: No pattern found for len_matrix", line_no);
	    	break;
	    }

	    int amount_of_values = len_matrix * len_matrix * 2; 
	    double* matrix_values = malloc(sizeof(double) * amount_of_values);

	    int i = 0;
	    while (true) {
	    	// probar pasarlo abajo
	    	r = fscanf(input_file, "%lg", &matrix_values[i]);

	    	if (r != 1) {
	    		printf("%s | line_no %d\n", "ERROR: No pattern found for double", line_no);
	    		break;
	    	}

	    	// !!!! printf("fscaneado: %f\n", matrix_values[i]);

	    	while ((c = getc(input_file))) {
	    		// !!!! printf("%d - %c\n", c, c);
	    		if (c == ' ' || c == '\t') {
	    			continue;
	    		} else if (c >= 48 && c <= 57) {
	    			ungetc(c, input_file);
	    			i++;
	    			break;
	    		} else if (c == '\n' || c == -1) {
	    			break;
	    		} else {
	    			printf("%s | %c | line_no %d\n", "ERROR: Not a Number ;)", c, line_no);
	    			// printf("%s: %c\n", "ERROR not read all walala", c);
	    			break;
	    		}
	    	}

	    	if (c == '\n' || c == -1) {
	    		break;
	    	}
	    }

	    // There are no more numbers after the required ones.
	    if (amount_of_values != i+1) {
	    	printf("%s | %d vs %d | line_no %d\n", "ERROR: mismatched amount of values", amount_of_values, i, line_no);
	    }

    	matrix_t* matrix_a = create_matrix(len_matrix, len_matrix);
    	asign_values_to_matrix(matrix_a, matrix_values, len_matrix);

    	matrix_t* matrix_b = create_matrix(len_matrix, len_matrix);
    	asign_values_to_matrix(matrix_b, matrix_values+ (amount_of_values/2), len_matrix);

    	// !!!! cambiar a out
    	print_matrix(stdout, matrix_a);
		print_matrix(stdout, matrix_b);

/*

		
	    if (c == '\n') {
	    	print_array(matrix_values, amount_of_values);
	    	continue;
	    }



	    while ((c = getc(input_file))) {
	    	if (c == ' ' || c == '\t') {
	    		continue;
	    	} else if (c == '\n' || c == -1) {
	    		break;
	    	} else {
	    		printf("%s | %d - %c | line_no %d\n", "ERROR: Found non good character after parsing correctly", c, c, line_no);
	    		break;
	    	}
	    }
*/
    	print_array(matrix_values, amount_of_values);

	    if (c == -1) {
	    	break;
	    }




    }


    printf("%s\n", "ENDED NICELY");




    fclose(input_file);
    fclose(output_file); 
    return 0;
}
