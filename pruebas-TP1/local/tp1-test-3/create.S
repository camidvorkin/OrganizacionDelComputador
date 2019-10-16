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
        sw a0, 32(sp)
        sw a1, 36(sp)
        
        # size of matrix = 12
        li a0, 12
        la t9, mymalloc
        jal t9
        
        # If malloc returns NULL, return NULL 
        beqz v0, create_return
        
        # save v0
        sw v0, 24(sp)
        
        lw t0, 0(v0)            # t0: result->rows
        lw t1, 32(sp)			# recupero rows
        sw t1, 0(t0)			# result->rows = rows
        
        lw t0, 4(v0)            # t0: result->cols
        lw t2, 36(sp)			# recupero cols
        sw t2, 0(t0)			# result->cols = cols
        
		mul t2, t1,t2 			# t2 = cols * rows = dimension
		mul a0, t2, 4 			# a0 = dimension * sizeof(double)
		
		la t9, mymalloc
        jal t9
        
        # If malloc returns NULL, free and return NULL 
        beqz v0, create_free_return
        
        lw t0, 24(sp)			# recupero result
        sw v0, 8(t0)            # result->array = array
        move v0, t0				# coloco en vo = result

        j create_return
        		
create_free_return:
		lw a0, 24(sp)
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
		
