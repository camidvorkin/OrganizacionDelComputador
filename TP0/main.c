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

int cantidad_numeros(FILE* in){
	int dimension;
	int dim_status = fscanf(in,"%d ",&dimension);
	//printf("status: %d\tdimension: %d\n", dim_status,dimension);
	if(dim_status == -1){
		return -1;
	}
	return pow( dimension, 2) * 2;
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
	
    archivo_entrada = fopen(argv[1],"r");
    archivo_salida = fopen(argv[2], "w"); 
    
    if (!archivo_entrada || !archivo_salida){
		fprintf(stderr, "File not found \n"); 
		return 1;
	}
	
	int cant_num,status,leidos = 0;
	//deberia ser de double para pasar a la matriz
    float cadena[1024];
    char temp;
    cant_num = cantidad_numeros(archivo_entrada);
	if(cant_num == -1){
		fprintf(stderr, "Error: Archivo vacio. \n"); 
		return 1;
	}
    while(true){
		//printf("leidos: %d  cant: %d\n",leidos,cant_num);
		status = fscanf(archivo_entrada,"%g%c",&cadena[leidos],&temp);
		//printf("LEER ACA\n");
		//printf("numero: (%g)\n",cadena[leidos]); 
		//printf("caracter: (%c)\n",temp);
		//printf("status: (%d)\n",status);
		leidos++;
		if(status == 2 && temp == '\n' && leidos == cant_num){
			printf("ENCONTRO TODA LA MATRIZ BIEN\n");
			for(int i = 0; i < cant_num; i++) {
				printf("%f\t",cadena[i]);
			}
			printf("\n");
			leidos = 0;
			cant_num = cantidad_numeros(archivo_entrada);
			if(cant_num == -1){
				printf("FIN\n");
				return 0;
			}
			continue;
		}
		if(status != 2 && temp != '\n'){
			fprintf(stderr, "Error: Caracter invalido. \n"); 
			return 1;
		}
		if(temp == '\n'){
			if(leidos == cant_num || leidos==0){
				printf("todo bien\n");
				return 0;
			}
			else{
				fprintf(stderr, "Error: Archivo invalido. \n"); 
				return 1;
			}
		}
		if(leidos > cant_num){
			fprintf(stderr, "Error: Mas numeros que los permitidos. \n"); 
			return 1;
		}
		//printf("leidos: %d  status: %d\n",leidos,status);
	}

        // Separar double
        // matrix_t* matrixA = create_matrix(dimension,dimension);
        // Crear matriz B
        // Multiplicar matrices
        // Imprimir en archivo salida/archivo error
		

    fclose(archivo_entrada);
    fclose(archivo_salida); 
    return 0;
}
