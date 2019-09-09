# Constantes globales para la compilacion
EXEC1 = main.c 
CC = gcc
OBJ = matrix.o
CFLAGS = -g -std=c99 -Wall -Wconversion -Wno-sign-conversion 
CFLAGS += -Wshadow -Wpointer-arith -Wunreachable-code
CFLAGS += -Wbad-function-cast -Werror -pedantic


#Instruccion que se va a ejecutar por default

all: $(EXEC1)

#El default que se compila tiene dependencia a los objetos OBJ
#El comando compila los OBJ con CC y CFLAGS resultando el EXEC

	
$(EXEC1): $(OBJ)
	$(CC) $(CFLAGS) main.c -o -s  $(EXEC1)


#Todos los objetos definidos en "OBJ=" con dependencia a los archivos .c y .h van a compilarse de la misma manera

%.o: %.c %.h 
	$(CC) $(CFLAGS) -c $<
	
#Borra todos los archivos .o del directorio
clean:
	rm *.o $(EXEC1)

#Make compila unicamente los elementos que se hayan modificado recientemente
	
