#include <mips/regdef.h>
#include <sys/syscall.h>

        .text
        .align  2
        .globl  create
        .ent    create

create:
		.frame  $fp, 32, ra
        .set    noreorder
        .cpload t9
        .set    reorder
        subu    sp, sp, 32
        .cprestore 0
        sw      $fp, 16(sp) # salvo fp
        sw      ra, 20(sp)  # salvo ra
        move    $fp, sp

        # save a0, a1
        sw a0, 32(sp)			#guardo las rows n° -> primer parametro
        sw a1, 36(sp)			#guardo las cols n° -> segundo parametro
        
        # size of matrix = 12
        li a0, 12
        la t9, mymalloc 		 # pido memoria de 12 bytes
        jal t9
        
        # If malloc returns NULL, return NULL 
        beqz v0, create_return
        
        # save v0
        sw v0, 24(sp)			# guardo la direccion que apunta al comienzo de los 12 bytes
        
        lw t0, 32(sp)			# recupero rows
        sw t0, 0(v0)			# guardo la cantidad de rows en results (primeros 4 bytes de la direccion reservada)  result->rows = rows
        
        lw t1, 36(sp)			# recupero cols
        sw t1, 4(v0)			# guardo la cantidad de cols en results (segundos 4 bytes de la direccion reservada) result->cols = cols
        
		mul t1, t0,t1 			# t1 = cols * rows = dimension = elementos del array
		mul a0, t1, 8 			# a0 = dimension * sizeof(double) guardo el tamaño de memoria para el array
		
		la t9, mymalloc			# pido memoria  8 bytes * cant elementos del array
        jal t9
        
        # If malloc returns NULL, free and return NULL 
        beqz v0, create_return
        
        lw t0, 24(sp)			# recupero result, guardo su direccion en t0
        sw v0, 8(t0)            # guardo la direccion que apunta a los bytes del array en la matriz, result->array = array
        move v0, t0				# coloco en vo la direccion que apunta a la matriz para devolverla

        j create_return
        		
create_free_return:
		lw a0, 24(sp)  			# recupero result, guardo su direccion en a0 para pasarsela al myfree
		la t9, myfree
		jal t9     
		j create_return
			
create_return:
		# Destruimos el frame.
        lw      ra, 20(sp)			# recupero ra
        lw      $fp, 16(sp)			# recupero fp
        addu    sp, sp, 32

        # Retorno.
        j       ra
        .end    create
        .rdata
        .align 2
		
