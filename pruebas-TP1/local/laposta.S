# 02-holamundo.S - ver 02-holamundo.c.
#
# $Date: 2019/04/21 18:24:06 $

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
	
	# Initialize registers
	lw t10, 8(a0) # t10 = m1->array


	li t0, 0 # i = 0
loop_i:
	beq t0, t5, xxx # if (i == m1->rows)
	addiu t0, t0, 1
	li t1, 0 # j = 0
	j loop_j
	
loop_j:
	beq t1, t6, yyy # if (j == m2->cols)
	addiu t1, t1, 1
	li t2, 0 # k = 0
	lf f0, 0 # acc = 0
	j loop_z

loop_z
	beq t2, t3, zzz 	# if (k == m1->cols)
	
	mul t6, t0, t4
	addu t6, t6, t2 	# p1 = i*m1->cols + k
	addu t12, t10, t6	
	l# t12: m1->array[p1]
	
	mul t7, t2, t4
	addu t7, t7, t1 	# p1 = k*m1->cols + j
	
	

	
	

	
	
	li	v0, 0
	addu	v0, a0, a1
	j	matrix_multiply_return

matrix_multiply_return:
	# Destruimos el frame.
	#
	lw	$fp, 28(sp)
	addu	sp, sp, 40

	# Retorno.
	#
	j	ra
	.end	matrix_multiply
	
