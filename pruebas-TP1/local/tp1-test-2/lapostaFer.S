#include <mips/regdef.h>

	.text
	.align	2
	.globl	matrix_multiply
	.ent	matrix_multiply
	
matrix_multiply:
	.frame	$fp, 40, ra
	.set	noreorder
	.cpload	t9
	.set	reorder
	subu	sp, sp, 40
	.cprestore 0
	sw	$fp, 28(sp)
	move	$fp, sp
	
	# create_matrix
	lw a0, 40(sp)
	lw a1, 44(sp)
	la t9, create_matrix
	jal t9
	
	# In v0 is the value of result
	# now null !!!!
	
	# t0 = i 
	# t1 = j 
	# t2 = k
	# t3 = m1->rows = m2->rows = m1->cols = m2->cols = N
	# t4 = m1->array
	# t5 = m2->array
	# t6 = aux
	# f0 = accum
	# f1 = resul

	# Initialize registers
	
	li t0, 0 # t0 = 0
	li t1, 0 # t1 = 0
	li t2, 0 # t2 = 0
	lw t3, 0(a0) # t3 = m1->rows
	lw t4, 8(a0) # t4 = m1->array
	lw t5, 8(a1) # t5 = m2->array

loop_i:
	beq t0, t3, fin 			# if (i == m1->rows)
	j loop_j
	addiu t0, t0, 1				# i = i + 1		
	
loop_j:
	beq t1, t3, loop_i			# if (j == m2->cols)
	addiu t1, t1, 1				# j = j + 1
	j loop_k
	lw t6,  4(v0) 				# pos = result->cols
	mul t6, t0, t6 				# pos = i * pos
	addu t6, t6, t1             # pos = pos + j
	s.d $f2, 8(v0) 				# matriz_result->array[pos] = resul
	
loop_k:
	beq t2, t3, loop_j 			# if (k == m1->cols)
	addiu t2, t2, 1				# k = k + 1
	mul t6, t0, t3				# aux = i * m1->cols
	addu t6, t6, t2 			# aux = pos + k
	sll t6, t6, 3				# aux = pos * 8 
	addu t6, t6,t4              # aux = aux + m1->array
	l.d $f0, 0(t6)                # accum = m1->array[aux]
	
	mul t6, t2, t3				# aux = k * m1->cols
	addu t6, t6, t1 			# aux = aux = aux + k
	sll t6, t6, 3				# pos = pos * 8 
	addu t6, t6,t5              # aux = aux + m1->array
	l.d $f2, 0(t6)              # resul = m2->array[aux]
	
	mul.d $f2, $f2, $f0         # resul = resul * accum
	j loop_k
	
fin:
	j	matrix_multiply_return

matrix_multiply_return:
	# Destruimos el frame.

	lw ra, 32(sp)
	lw	$fp, 28(sp)
	addiu	sp, sp, 40
	# Retorno
	j	ra
	.end	matrix_multiply
	
