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
	sw      $fp, 28(sp) # salvo fp
        sw      ra, 32(sp) # salvo ra
	move	$fp, sp
	
	# save a0, a1
        sw a0, 40(sp)
        sw a1, 44(sp)

        # create_matrix
        lw a0, 0(a0)
        lw a1, 4(a1)
	la t9, create_matrix
	jal t9
	
	# In v0 is the value of result
	# now null !!!!
	

	li t0, 0 				 # i = 0
loop_i:
	lw a0, 40(sp)
        lw t4, 0(a0)            # t4 = m1->cols
	beq t0, t4, after_loop_i # if (i == m1->rows)

	lw a0, 40(sp)
        lw a1, 44(sp)

	li t1, 0 				 # j = 0
	j loop_j
	
loop_j:
	lw t4, 4(a1)		 # t4: m2->cols
	beq t1, t4, after_loop_j # if (j == m2->cols)
	li t2, 0 # k = 0
	li.d $f0, 0 # acc = 0

	j loop_k

loop_k:
	lw t4, 4(a0) 		# t4 = m1->cols
	beq t2, t4, after_loop_k 	# if (k == m1->cols)
	
	lw t4, 4(a0) 		# t4 = m1->cols
	mul t6, t0, t4
	addu t6, t6, t2 	# p1 = i*m1->cols + k
	sll t6, t6, 3		# Multiplying by 8 because of doubles

	lw t4, 8(a0)		# t4 = m1->array
	addu t4, t4, t6	
	l.d $f2, 0(t4)		# f1: m1->array[p1]
	

	lw t4, 4(a0) 		# t4 = m1->cols
	mul t6, t2, t4		#
	addu t6, t6, t1 	# t6: p2
	sll t6, t6, 3

	lw t4, 8(a1)		# t4 = m2->array
	addu t4, t4, t6
	l.d $f4, 0(t4)		# f2: m2->array[p2]

	mul.d $f2, $f4, $f2
	add.d $f0, $f0, $f2	# acc += m1->array[p1] * m2->array[p2]

	addiu t2, t2, 1
	j loop_k


after_loop_i:	
	j	matrix_multiply_return

after_loop_j:
	addiu t0, t0, 1
	j loop_i
	
after_loop_k:
	lw t4, 4(v0) 		# t4 = result->cols
	mul t6, t0, t4
	add t6, t6, t1		# t6: i*result->cols + j
	sll t6, t6, 3		# Multiplying by 8 (sizeof(double))

	lw t4, 8(v0)		# t7: result->array
	add t4, t4, t6

	s.d $f0, 0(t4)			# !!!! right order?

	addiu t1, t1, 1
	j loop_j
	
matrix_multiply_return:
	# Destruimos el frame.
	#
	lw      ra, 32(sp)
	lw	$fp, 28(sp)
	addu	sp, sp, 40

	# Retorno.
	#
	j	ra
	.end	matrix_multiply
	
