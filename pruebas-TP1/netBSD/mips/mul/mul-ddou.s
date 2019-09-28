	.file	1 "mul-ddou.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	func
	.ent	func
func:
	.frame	$fp,24,$31		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$28,16($sp)
	move	$fp,$sp

	s.d	$f12,24($fp)
	s.d	$f14,32($fp)
	l.d	$f2,24($fp)
	l.d	$f0,32($fp)
	mul.d	$f0,$f2,$f0
	s.d	$f0,8($fp)
	l.d	$f0,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$31
	.end	func
	.size	func, .-func
	.rdata
	.align	3
$LC0:
	.word	0
	.word	1073741824
	.align	3
$LC1:
	.word	0
	.word	1074266112
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,64,$31		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$31,56($sp)
	sw	$fp,52($sp)
	sw	$28,48($sp)
	move	$fp,$sp
	sw	$4,64($fp)
	sw	$5,68($fp)
	l.d	$f0,$LC0
	s.d	$f0,24($fp)
	l.d	$f0,$LC1
	s.d	$f0,32($fp)
	l.d	$f12,24($fp)
	l.d	$f14,32($fp)
	la	$25,func
	jal	$31,$25
	s.d	$f0,40($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$31,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$31
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
