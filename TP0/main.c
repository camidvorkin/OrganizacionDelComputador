#define _POSIX_C_SOURCE 200809L
#include <getopt.h>
#include "matrix.h"
#include <math.h>
#include <stdio.h>

const char HELP[] = "Usage:\n \ttp0 -h \n\ttp0 -V\n\ttp0 < in_file > out_file\n\nOptions:\n\t-V, --version Print version and quit.\n\t-h, --help Print this information and quit.\nExamples:\n\ttp0 < in.txt > out.txt\n\tcat in.txt | tp0 > out.txt" ;
const char VERSION[] = "XXXXXXXXXXXXXXXXXXXXXXXx\n"; // Buscar version
static struct option long_options[] = {
    {"version",  no_argument, 0,  0 }, 
    {"help",  no_argument, 0,  0 }
};        


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
	
    archivo_entrada = fopen(argv[1],"r");
    archivo_salida = fopen(argv[2], "w"); 
    
    if (!archivo_entrada || !archivo_salida){
		fprintf(stderr, "File not found \n"); 
		return 1;
	}
	
	int dimension,cant_num,status,leidos = 0;
	//deberia ser de double para pasar a la matriz
    float cadena[1024];
    char temp;
    fscanf(archivo_entrada,"%d ",&dimension);
    printf("dimension: %d\n", dimension);
    cant_num = pow( dimension, 2) * 2;
    while(true){
		if(leidos > cant_num){
			fprintf(stderr, "Error: Archivo invalido. \n"); 
			return 1;
		}
		status = fscanf(archivo_entrada,"%g",&cadena[leidos]);
		fscanf (archivo_entrada, "%c" , &temp);
		printf("caracter: (%c)",temp);
		if(temp == '\n' && leidos != cant_num){
			fprintf(stderr, "Error: Archivo invalido. \n"); 
			return 1;
		}
		if((status == EOF && leidos != cant_num) || status == 0){
			fprintf(stderr, "Error: Archivo invalido. \n"); 
			return 1;	
		}
		leidos++;
		printf("leidos: %d  status: %d\n",leidos,status);
	}
	
	for(int i = 0; i < cant_num; i++) {
		printf("%f\t",cadena[i]);
	}
	printf("\n");
	printf("listo\n");

        // Separar double
        // matrix_t* matrixA = create_matrix(dimension,dimension);
        // Crear matriz B
        // Multiplicar matrices
        // Imprimir en archivo salida/archivo error
		

    fclose(archivo_entrada);
    fclose(archivo_salida); 
    return 0;
}
