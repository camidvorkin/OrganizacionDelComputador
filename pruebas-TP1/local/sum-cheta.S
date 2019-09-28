
# 02-holamundo.S - ver 02-holamundo.c.
#
# $Date: 2008/04/21 17:24:06 $

#include <mips/regdef.h>

	.text
	.align	2
	.globl	sum
	.ent	sum
	
sum:
	.frame	$fp, 16, ra
	.set	noreorder
	.cpload	t9
	.set	reorder
	subu	sp, sp, 16
	.cprestore 0
	sw	$fp, 4(sp)
	move	$fp, sp
	
	# Use v0 for the result.
	#
	lw t0, 0(a0)
	lw t1, 4(a0)
	addu	v0, t0, t1
	subu t3, t1, t0
	sw t3, 8(a0)
	j	sum_return

sum_return:
	# Destruimos el frame.
	#
	lw	$fp, 4(sp)
	addu	sp, sp, 16

	# Retorno.
	#
	j	ra
	.end	sum
	
