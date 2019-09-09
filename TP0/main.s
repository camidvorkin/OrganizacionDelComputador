	.file	"main.c"
	.text
	.globl	HELP
	.section	.rodata
	.align 32
	.type	HELP, @object
	.size	HELP, 219
HELP:
	.string	"Usage:\n \ttp0 -h \n\ttp0 -V\n\ttp0 < in_input_file > out_input_file\n\nOptions:\n\t-V, --version Print version and quit.\n\t-h, --help Print this information and quit.\nExamples:\n\ttp0 < in.txt > out.txt\n\tcat in.txt | tp0 > out.txt"
	.globl	VERSION
	.align 16
	.type	VERSION, @object
	.size	VERSION, 26
VERSION:
	.string	"XXXXXXXXXXXXXXXXXXXXXXXx\n"
	.text
	.globl	asign_values_to_matrix
	.type	asign_values_to_matrix, @function
asign_values_to_matrix:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	$0, -16(%rbp)
	movq	-40(%rbp), %rax
	imulq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L2
.L3:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	-16(%rbp), %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -16(%rbp)
.L2:
	movq	-16(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jb	.L3
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	asign_values_to_matrix, .-asign_values_to_matrix
	.section	.rodata
.LC0:
	.string	"%f "
	.text
	.globl	print_array
	.type	print_array, @function
print_array:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L5
.L6:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	leaq	.LC0(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	addq	$1, -8(%rbp)
.L5:
	movl	-28(%rbp), %eax
	cltq
	cmpq	%rax, -8(%rbp)
	jb	.L6
	movl	$10, %edi
	call	putchar@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	print_array, .-print_array
	.section	.rodata
.LC1:
	.string	"%lg"
	.align 8
.LC2:
	.string	"ERROR: No pattern found for double"
.LC3:
	.string	"%s | line_no %d\n"
.LC4:
	.string	"ERROR: Not a Number ;)"
.LC5:
	.string	"%s | %c | line_no %d\n"
	.text
	.globl	obtain_matrixes_values
	.type	obtain_matrixes_values, @function
obtain_matrixes_values:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	%ecx, -44(%rbp)
	movq	$0, -8(%rbp)
.L17:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movl	%eax, -12(%rbp)
	cmpl	$1, -12(%rbp)
	je	.L10
	movl	-44(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	$-1, %rax
	jmp	.L9
.L15:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$32, %eax
	je	.L10
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$9, %eax
	jne	.L12
	jmp	.L10
.L12:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$47, %eax
	jle	.L13
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$57, %eax
	jg	.L13
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	ungetc@PLT
	addq	$1, -8(%rbp)
	jmp	.L14
.L13:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$10, %eax
	je	.L14
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$-1, %eax
	je	.L14
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	movl	-44(%rbp), %edx
	movl	%edx, %ecx
	movl	%eax, %edx
	leaq	.LC4(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	$-1, %rax
	jmp	.L9
.L10:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_IO_getc@PLT
	movl	%eax, %edx
	movq	-40(%rbp), %rax
	movl	%edx, (%rax)
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L15
.L14:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$10, %eax
	je	.L16
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$-1, %eax
	je	.L16
	jmp	.L17
.L16:
	movq	-8(%rbp), %rax
	addq	$1, %rax
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	obtain_matrixes_values, .-obtain_matrixes_values
	.section	.rodata
.LC6:
	.string	"%ld"
	.align 8
.LC7:
	.string	"ERROR: No pattern found for len_matrix"
	.align 8
.LC8:
	.string	"ERROR: mismatched amount of values"
.LC9:
	.string	"%s | %ld vs %ld | line_no %d\n"
	.text
	.globl	parse_line
	.type	parse_line, @function
parse_line:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movl	%edx, -84(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-48(%rbp), %rdx
	movq	-72(%rbp), %rax
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	movl	%eax, -52(%rbp)
	cmpl	$1, -52(%rbp)
	je	.L19
	movl	-84(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC7(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	jmp	.L23
.L19:
	movq	-48(%rbp), %rdx
	movq	-48(%rbp), %rax
	imulq	%rdx, %rax
	addq	%rax, %rax
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	movl	-84(%rbp), %ecx
	movq	-80(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	obtain_matrixes_values
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	cmpq	-24(%rbp), %rax
	je	.L21
	movl	-84(%rbp), %ecx
	movq	-24(%rbp), %rdx
	movq	-40(%rbp), %rax
	movl	%ecx, %r8d
	movq	%rdx, %rcx
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rsi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	jmp	.L23
.L21:
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L22
	movl	$0, %eax
	jmp	.L23
.L22:
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-48(%rbp), %rdx
	movq	-48(%rbp), %rax
	imulq	%rdx, %rax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-16(%rbp), %rax
.L23:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	parse_line, .-parse_line
	.globl	parse_and_multiply_matrixes
	.type	parse_and_multiply_matrixes, @function
parse_and_multiply_matrixes:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -44(%rbp)
.L30:
	addl	$1, -44(%rbp)
	movl	-44(%rbp), %edx
	leaq	-48(%rbp), %rcx
	movq	-56(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	parse_line
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L26
	movl	$-1, %eax
	jmp	.L31
.L26:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_matrix@PLT
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	8(%rax), %rcx
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	asign_values_to_matrix
	movq	-32(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	create_matrix@PLT
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	16(%rax), %rcx
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	asign_values_to_matrix
	movq	-24(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	print_matrix@PLT
	movq	-16(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	print_matrix@PLT
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	matrix_multiply@PLT
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	print_matrix@PLT
	movl	-48(%rbp), %eax
	cmpl	$-1, %eax
	je	.L34
	jmp	.L30
.L34:
	nop
	movl	$0, %eax
.L31:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L32
	call	__stack_chk_fail@PLT
.L32:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	parse_and_multiply_matrixes, .-parse_and_multiply_matrixes
	.section	.rodata
.LC10:
	.string	"-h"
.LC11:
	.string	"-V"
	.align 8
.LC12:
	.string	"Error: Cantidad de parametros erronea"
.LC13:
	.string	"%s\n"
	.text
	.globl	verify_argv
	.type	verify_argv, @function
verify_argv:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L36
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$218, %edx
	movl	$1, %esi
	leaq	HELP(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %eax
	jmp	.L37
.L36:
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L38
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$2, %edx
	movl	$1, %esi
	leaq	.LC11(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %eax
	jmp	.L37
.L38:
	cmpl	$3, -4(%rbp)
	je	.L39
	movq	stderr(%rip), %rax
	leaq	.LC12(%rip), %rdx
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$-1, %eax
	jmp	.L37
.L39:
	movl	$0, %eax
.L37:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	verify_argv, .-verify_argv
	.section	.rodata
.LC14:
	.string	"r"
.LC15:
	.string	"w"
.LC16:
	.string	"File not found \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-48(%rbp), %rdx
	movl	-36(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	verify_argv
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	je	.L41
	movl	-20(%rbp), %eax
	jmp	.L42
.L41:
	cmpl	$0, -20(%rbp)
	jns	.L43
	movl	-20(%rbp), %eax
	negl	%eax
	jmp	.L42
.L43:
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	movq	-48(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC15(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L44
	cmpq	$0, -8(%rbp)
	jne	.L45
.L44:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC16(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %eax
	jmp	.L42
.L45:
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	parse_and_multiply_matrixes
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	jns	.L46
	movl	$1, %edi
	call	exit@PLT
.L46:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, %eax
.L42:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
