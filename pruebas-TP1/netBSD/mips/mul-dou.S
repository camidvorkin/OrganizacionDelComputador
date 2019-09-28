# 02-holamundo.S - ver 02-holamundo.c.  #
# $Date: 2008/04/21 17:24:06 $

#include <mips/regdef.h>

	.text
	.align	2
	.globl	mul_dou
	.ent	mul_dou
	
mul_dou:
	.frame	$fp, 24, ra
	.set	noreorder
	.cpload	t9
	.set	reorder
	subu	sp, sp, 24
	.cprestore 0
	sw	$fp, 4(sp)
	move	$fp, sp
	
	# Use v0 for the result.
	#
	mul.d	$f0, $f12, $f14
	j	mul_dou_return


mul_dou_return:
	# Destruimos el frame.
	#
	lw	$fp, 4(sp)
	addu	sp, sp, 24

	# Retorno.
	#
	j	ra
	.end	mul_dou
	

