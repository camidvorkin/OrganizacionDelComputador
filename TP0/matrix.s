	.file	"matrix.c"
	.text
	.globl	create_matrix
	.type	create_matrix, @function
create_matrix:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-24(%rbp), %rax
	imulq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L4
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
	jmp	.L3
.L4:
	movq	-16(%rbp), %rax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	create_matrix, .-create_matrix
	.globl	destroy_matrix
	.type	destroy_matrix, @function
destroy_matrix:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	destroy_matrix, .-destroy_matrix
	.section	.rodata
.LC0:
	.string	"%ld"
.LC1:
	.string	" %f"
.LC2:
	.string	"\n"
	.text
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	$0, -16(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rdx
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	imulq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-40(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	check_fprint
	jmp	.L7
.L8:
	movq	-48(%rbp), %rax
	movq	16(%rax), %rax
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, -56(%rbp)
	movsd	-56(%rbp), %xmm0
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	check_fprint
	addq	$1, -16(%rbp)
.L7:
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jb	.L8
	movq	-40(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	check_fprint
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	print_matrix, .-print_matrix
	.globl	matrix_multiply
	.type	matrix_multiply, @function
matrix_multiply:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_matrix
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L11
	movl	$0, %eax
	jmp	.L12
.L11:
	movq	$0, -56(%rbp)
	jmp	.L13
.L18:
	movq	$0, -48(%rbp)
	jmp	.L14
.L17:
	movq	$0, -40(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -32(%rbp)
	jmp	.L15
.L16:
	movq	-72(%rbp), %rax
	movq	8(%rax), %rax
	imulq	-56(%rbp), %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movq	-72(%rbp), %rax
	movq	8(%rax), %rax
	imulq	-40(%rbp), %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-72(%rbp), %rax
	movq	16(%rax), %rax
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movq	-80(%rbp), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-32(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	addq	$1, -40(%rbp)
.L15:
	movq	-72(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, -40(%rbp)
	jb	.L16
	movq	-24(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	imulq	-56(%rbp), %rax
	movq	%rax, %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	salq	$3, %rax
	addq	%rdx, %rax
	movsd	-32(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -48(%rbp)
.L14:
	movq	-80(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, -48(%rbp)
	jb	.L17
	addq	$1, -56(%rbp)
.L13:
	movq	-72(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -56(%rbp)
	jb	.L18
	movq	-24(%rbp), %rax
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	matrix_multiply, .-matrix_multiply
	.section	.rodata
	.align 8
.LC4:
	.string	"Error en la copia del archivo resultante\n"
	.text
	.globl	check_fprint
	.type	check_fprint, @function
check_fprint:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	cmpl	$0, -12(%rbp)
	jns	.L21
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$41, %edx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L21:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	check_fprint, .-check_fprint
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
