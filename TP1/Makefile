# Constantes globales para la compilacion
EXEC1 = tp1 
CC = gcc
OBJ = matrix-TP0.o
OBJ-MIPS = matrix.o
CFLAGS = -g -Wall
#CFLAGS += -g -std=c99 -Wall -Wconversion -Wno-sign-conversion 
#CFLAGS += -Wshadow -Wpointer-arith -Wunreachable-code
#CFLAGS += -Wbad-function-cast -Werror -pedantic


#Instruccion que se va a ejecutar por default

all: $(EXEC1)

#El default que se compila tiene dependencia a los objetos OBJ
#El comando compila los OBJ con CC y CFLAGS resultando el EXEC

	
$(EXEC1): $(OBJ) main.c
	$(CC) $(CFLAGS) $(OBJ) main.c -s -o $(EXEC1)


#Todos los objetos definidos en "OBJ=" con dependencia a los archivos .c y .h van a compilarse de la misma manera

%.o: %.c %.h 
	$(CC) $(CFLAGS) -c $<

#Todos los objetos definidos en "OBJ=" con dependencia a los archivos .c y .h van a compilarse de la misma manera

mips: $(OBJ-MIPS) main.c
	$(CC) $(CFLAGS) main.c matrix.c multiply.S create.S mymalloc.S -o $(EXEC1)


#Borra todos los archivos .o del directorio
clean:
	rm *.o *.s $(EXEC1)

test-successful: $(EXEC1)
	./$(EXEC1) < ejemplo-varios.txt > out
	less out

test-failure: $(EXEC1)
	./$(EXEC1) < ejemplo-fallos.txt > out
	less out

test-successful-mips: $(mips)
	./$(EXEC1) < ejemplo-varios.txt > out
	less out

test-failure-mips: $(mips)
	./$(EXEC1) < ejemplo-fallos.txt > out
	less out

valgrind: $(EXEC1)
	valgrind ./$(EXEC1) < ejemplo-varios.txt > out
	less out

#Make compila unicamente los elementos que se hayan modificado recientemente
	
