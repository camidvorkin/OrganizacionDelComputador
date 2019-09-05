#define _POSIX_C_SOURCE 200809L
#include <getopt.h>
#include "matrix.h"

const char HELP[] = "Usage:\n \ttp0 -h \n\ttp0 -V\n\ttp0 < in_input_file > out_input_file\n\nOptions:\n\t-V, --version Print version and quit.\n\t-h, --help Print this information and quit.\nExamples:\n\ttp0 < in.txt > out.txt\n\tcat in.txt | tp0 > out.txt" ;
const char VERSION[] = "XXXXXXXXXXXXXXXXXXXXXXXx\n"; // Buscar version
static struct option long_options[] = {
    {"version",  no_argument, 0,  0 }, 
    {"help",  no_argument, 0,  0 }
};        

/*
void asign_values_matrix(int n, int start, char linea[]) {
	int i = 0;
	int j = 0;
	int last_number = start;
	for (; i < n; i++) {
 		for (; j < n; j++) {
			matrix.array[i][j] = linea[(i+j) * 2 + inicio];
		}       
	}
}
*/

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

int main(int argc, char * argv []){
	
    int opt;
    FILE* archivo_entrada = stdin;
    FILE* archivo_salida = stdout;

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
    
    if(argc != 3){
        fprintf(stderr, "%s\n", "Error: Cantidad de parametros erronea");
	    return 1;
    }
	
    /*
    archivo_entrada = fopen(argv[1],"r");
    archivo_salida = fopen(argv[2], "w"); 
    if (!archivo_entrada || !archivo_salida){fprintf(stderr, "File not found \n"); return 1;}
		
    char * linea = NULL;
    size_t cant = 0;
    ssize_t leidos;
    double dimension;
    while ((leidos = getline (&linea, &cant, archivo_entrada) > 0)){
        fscanf(archivo_entrada, "%le", &dimension);
	linea[strlen(linea)-1] = '\0';
        int dimension = atoi(linea[0]);



        // Separar double
        matrix_t* matrixA = create_matrix(dimension, dimension);
        matrix_t* matrixB = create_matrix(dimension, dimension);


	

	int i = 0;
	int j = 0;
	for (; i < dimension; i++) {
		for (; j < dimension; j++) {
			matrix.array[i][j] = linea[(i+j) * 2 + 2];
		}
	}

        // Crear matriz B
        // Multiplicar matrices
        // Imprimir en archivo salida/archivo error

    }
    */

    FILE *input_file = fopen(argv[1], "r");

    int len_matrix;
    int i, r, amount_of_floats;
    float *matrix_values;
    fscanf(input_file, "%d", &len_matrix);
    amount_of_floats = len_matrix * len_matrix * 2;
    printf("aof: %d\n", amount_of_floats);
    matrix_values = malloc(sizeof(float) * amount_of_floats);  
    char *format = generate_values_format(2);
    puts(format);
    fscanf(input_file, "%g %g", matrix_values);
    printf("exito\n");

    char * x;
    i = 0;
    // "%[^\n]\n"
    for (; i < amount_of_floats; i++) {
	
	    /*
	 r = fscanf(input_file, "%g %[^\n] \n", &matrix_values[i], (char *) x);
	 if (r != 1) {
		 printf("!!!! error\n");
	 }
	 r = fscanf(input_file, "\n");
	 printf("%d\n", r);
	 */
    }


    i = 0;
    for (; i < amount_of_floats; i++) {
	    printf("%f\n", matrix_values[i]);
    }
   
    
    fclose(archivo_entrada);
    fclose(archivo_salida); 
    return 0;
}
