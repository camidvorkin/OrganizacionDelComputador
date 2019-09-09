.file   1 "main.c"
        .section .mdebug.abi32
        .previous
        .abicalls
        .globl  HELP
        .rdata
        .align  2
        .type   HELP, @object
        .size   HELP, 219
HELP:
        .ascii  "Usage:\n"
        .ascii  " \ttp0 -h \n"
        .ascii  "\ttp0 -V\n"
        .ascii  "\ttp0 < in_input_file > out_input_file\n\n"
        .ascii  "Options:\n"
        .ascii  "\t-V, --version Print version and quit.\n"
        .ascii  "\t-h, --help Print this information and quit.\n"
        .ascii  "Examples:\n"
        .ascii  "\ttp0 < in.txt > out.txt\n"
        .ascii  "\tcat in.txt | tp0 > out.txt\000"
        .globl  VERSION
        .align  2
        .type   VERSION, @object
        .size   VERSION, 26
VERSION:
        .ascii  "XXXXXXXXXXXXXXXXXXXXXXXx\n\000"
        .text
        .align  2
        .globl  asign_values_to_matrix
        .ent    asign_values_to_matrix
asign_values_to_matrix:
        .frame  $fp,24,$ra              # vars= 8, regs= 2/0, args= 0, extra= 8
        .mask   0x50000000,-4
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,24
        .cprestore 0
        sw      $fp,20($sp)
        sw      $gp,16($sp)
        move    $fp,$sp
        sw      $a0,24($fp)
        sw      $a1,28($fp)
        sw      $a2,32($fp)
        sw      $zero,8($fp)
        lw      $v0,32($fp)
        lw      $v1,32($fp)
        mult    $v0,$v1
        mflo    $v0
        sw      $v0,12($fp)
$L6:
        lw      $v0,8($fp)
        lw      $v1,12($fp)
        sltu    $v0,$v0,$v1
        bne     $v0,$zero,$L9
        b       $L5
$L9:
        lw      $a0,24($fp)
        lw      $v0,8($fp)
        sll     $v1,$v0,3
        lw      $v0,8($a0)
        addu    $a0,$v1,$v0
        lw      $v0,8($fp)
        sll     $v1,$v0,3
        lw      $v0,28($fp)
        addu    $v0,$v1,$v0
        l.d     $f0,0($v0)
        s.d     $f0,0($a0)
        lw      $v0,8($fp)
        addu    $v0,$v0,1
        sw      $v0,8($fp)
        b       $L6
$L5:
        move    $sp,$fp
        lw      $fp,20($sp)
        addu    $sp,$sp,24
        j       $ra
        .end    asign_values_to_matrix
        .size   asign_values_to_matrix, .-asign_values_to_matrix
        .rdata
        .align  2
$LC0:
        .ascii  "%f \000"
        .align  2
$LC1:
        .ascii  "\n\000"
        .text
        .align  2
        .globl  print_array
        .ent    print_array
print_array:
        .frame  $fp,48,$ra              # vars= 8, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,48
        .cprestore 16
        sw      $ra,40($sp)
        sw      $fp,36($sp)
        sw      $gp,32($sp)
        move    $fp,$sp
        sw      $a0,48($fp)
        sw      $a1,52($fp)
        sw      $zero,24($fp)
$L11:
        lw      $v0,24($fp)
        lw      $v1,52($fp)
        sltu    $v0,$v0,$v1
        bne     $v0,$zero,$L14
        b       $L12
$L14:
        lw      $v0,24($fp)
        sll     $v1,$v0,3
        lw      $v0,48($fp)
        addu    $v0,$v1,$v0
        la      $a0,$LC0
        lw      $a2,0($v0)
        lw      $a3,4($v0)
        la      $t9,printf
        jal     $ra,$t9
        lw      $v0,24($fp)
        addu    $v0,$v0,1
        sw      $v0,24($fp)
        b       $L11
$L12:
        la      $a0,$LC1
        la      $t9,printf
        jal     $ra,$t9
        move    $sp,$fp
        lw      $ra,40($sp)
        lw      $fp,36($sp)
        addu    $sp,$sp,48
        j       $ra
        .end    print_array
        .size   print_array, .-print_array
        .rdata
        .align  2
$LC2:
        .ascii  "%lg\000"
        .align  2
$LC3:
        .ascii  "%s | line_no %d\n\000"
        .align  2
$LC4:
        .ascii  "ERROR: No pattern found for double\000"
        .align  2
$LC5:
        .ascii  "%s | %c | line_no %d\n\000"
        .align  2
$LC6:
        .ascii  "ERROR: Not a Number ;)\000"
        .text
        .align  2
        .globl  obtain_matrixes_values
        .ent    obtain_matrixes_values
obtain_matrixes_values:
        .frame  $fp,56,$ra              # vars= 16, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,56
        .cprestore 16
        sw      $ra,48($sp)
        sw      $fp,44($sp)
        sw      $gp,40($sp)
        move    $fp,$sp
        sw      $a0,56($fp)
        sw      $a1,60($fp)
        sw      $a2,64($fp)
        sw      $a3,68($fp)
        sw      $zero,28($fp)
$L16:
        lw      $v0,28($fp)
        sll     $v1,$v0,3
        lw      $v0,60($fp)
        addu    $v0,$v1,$v0
        lw      $a0,56($fp)
        la      $a1,$LC2
        move    $a2,$v0
        la      $t9,fscanf
        jal     $ra,$t9
        sw      $v0,24($fp)
        lw      $v1,24($fp)
        li      $v0,1                   # 0x1
        beq     $v1,$v0,$L19
        la      $a0,$LC3
        la      $a1,$LC4
        lw      $a2,68($fp)
        la      $t9,printf
        jal     $ra,$t9
        li      $v0,-1                  # 0xffffffffffffffff
        sw      $v0,32($fp)
        b       $L15
$L19:
        .set    noreorder
        nop
        .set    reorder
$L20:
        lw      $a0,56($fp)
        la      $t9,getc
        jal     $ra,$t9
        move    $v1,$v0
        lw      $v0,64($fp)
        sw      $v1,0($v0)
        lw      $v0,0($v0)
        bne     $v0,$zero,$L22
        b       $L21
$L22:
        lw      $v0,64($fp)
        lw      $v1,0($v0)
        li      $v0,32                  # 0x20
        beq     $v1,$v0,$L20
        lw      $v0,64($fp)
        lw      $v1,0($v0)
        li      $v0,9                   # 0x9
        beq     $v1,$v0,$L20
        lw      $v0,64($fp)
        lw      $v0,0($v0)
        slt     $v0,$v0,48
        bne     $v0,$zero,$L26
        lw      $v0,64($fp)
        lw      $v0,0($v0)
        slt     $v0,$v0,58
        beq     $v0,$zero,$L26
        lw      $v0,64($fp)
        lw      $a0,0($v0)
        lw      $a1,56($fp)
        la      $t9,ungetc
        jal     $ra,$t9
        lw      $v0,28($fp)
        addu    $v0,$v0,1
        sw      $v0,28($fp)
        b       $L21
$L26:
        lw      $v0,64($fp)
        lw      $v1,0($v0)
        li      $v0,10                  # 0xa
        beq     $v1,$v0,$L21
        lw      $v0,64($fp)
        lw      $v1,0($v0)
        li      $v0,-1                  # 0xffffffffffffffff
        beq     $v1,$v0,$L21
        lw      $v0,64($fp)
        la      $a0,$LC5
        la      $a1,$LC6
        lw      $a2,0($v0)
        lw      $a3,68($fp)
        la      $t9,printf
        jal     $ra,$t9
        li      $v0,-1                  # 0xffffffffffffffff
        sw      $v0,32($fp)
        b       $L15
$L21:
        lw      $v0,64($fp)
        lw      $v1,0($v0)
        li      $v0,10                  # 0xa
        beq     $v1,$v0,$L17
        lw      $v0,64($fp)
        lw      $v1,0($v0)
        li      $v0,-1                  # 0xffffffffffffffff
        beq     $v1,$v0,$L17
        b       $L16
$L17:
        lw      $v0,28($fp)
        addu    $v0,$v0,1
        sw      $v0,32($fp)
$L15:
        lw      $v0,32($fp)
        move    $sp,$fp
        lw      $ra,48($sp)
        lw      $fp,44($sp)
        addu    $sp,$sp,56
        j       $ra
        .end    obtain_matrixes_values
        .size   obtain_matrixes_values, .-obtain_matrixes_values
        .rdata
        .align  2
$LC7:
        .ascii  "%ul\000"
        .align  2
$LC8:
        .ascii  "ERROR: No pattern found for len_matrix\000"
        .align  2
$LC9:
        .ascii  "%s | %ul vs %ul | line_no %d\n\000"
        .align  2
$LC10:
        .ascii  "ERROR: mismatched amount of values\000"
        .text
        .align  2
        .globl  parse_line
        .ent    parse_line
parse_line:
        .frame  $fp,80,$ra              # vars= 32, regs= 3/0, args= 24, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,80
        .cprestore 24
        sw      $ra,72($sp)
        sw      $fp,68($sp)
        sw      $gp,64($sp)
        move    $fp,$sp
        sw      $a0,80($fp)
        sw      $a1,84($fp)
        sw      $a2,88($fp)
        addu    $v0,$fp,36
        lw      $a0,80($fp)
        la      $a1,$LC7
        move    $a2,$v0
        la      $t9,fscanf
        jal     $ra,$t9
        sw      $v0,32($fp)
        lw      $v1,32($fp)
        li      $v0,1                   # 0x1
        beq     $v1,$v0,$L34
        la      $a0,$LC3
        la      $a1,$LC8
        lw      $a2,88($fp)
        la      $t9,printf
        jal     $ra,$t9
        sw      $zero,56($fp)
        b       $L33
$L34:
        lw      $v1,36($fp)
        lw      $v0,36($fp)
        mult    $v1,$v0
        mflo    $v0
        sll     $v0,$v0,1
        sw      $v0,40($fp)
        lw      $v0,40($fp)
        sll     $v0,$v0,3
        move    $a0,$v0
        la      $t9,malloc
        jal     $ra,$t9
        sw      $v0,44($fp)
        lw      $a0,80($fp)
        lw      $a1,44($fp)
        lw      $a2,84($fp)
        lw      $a3,88($fp)
        la      $t9,obtain_matrixes_values
        jal     $ra,$t9
        sw      $v0,48($fp)
        lw      $v1,40($fp)
        lw      $v0,48($fp)
        beq     $v1,$v0,$L36
        lw      $v0,88($fp)
        sw      $v0,16($sp)
        la      $a0,$LC9
        la      $a1,$LC10
        lw      $a2,40($fp)
        lw      $a3,48($fp)
        la      $t9,printf
        jal     $ra,$t9
        sw      $zero,56($fp)
        b       $L33
$L36:
        li      $a0,12                  # 0xc
        la      $t9,malloc
        jal     $ra,$t9
        sw      $v0,52($fp)
        lw      $v0,52($fp)
        bne     $v0,$zero,$L37
        sw      $zero,56($fp)
        b       $L33
$L37:
        lw      $v1,52($fp)
        lw      $v0,36($fp)
        sw      $v0,0($v1)
        lw      $v1,52($fp)
        lw      $v0,44($fp)
        sw      $v0,4($v1)
        lw      $a0,52($fp)
        lw      $v1,36($fp)
        lw      $v0,36($fp)
        mult    $v1,$v0
        mflo    $v0
        sll     $v1,$v0,3
        lw      $v0,44($fp)
        addu    $v0,$v0,$v1
        sw      $v0,8($a0)
        lw      $v0,52($fp)
        sw      $v0,56($fp)
$L33:
        lw      $v0,56($fp)
        move    $sp,$fp
        lw      $ra,72($sp)
        lw      $fp,68($sp)
        addu    $sp,$sp,80
        j       $ra
        .end    parse_line
        .size   parse_line, .-parse_line
        .align  2
        .globl  parse_and_multiply_matrixes
        .ent    parse_and_multiply_matrixes
parse_and_multiply_matrixes:
        .frame  $fp,72,$ra              # vars= 32, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,72
        .cprestore 16
        sw      $ra,64($sp)
        sw      $fp,60($sp)
        sw      $gp,56($sp)
        move    $fp,$sp
        sw      $a0,72($fp)
        sw      $a1,76($fp)
        sw      $zero,28($fp)
$L39:
        lw      $v0,28($fp)
        addu    $v0,$v0,1
        sw      $v0,28($fp)
        lw      $a0,72($fp)
        addu    $a1,$fp,24
        lw      $a2,28($fp)
        la      $t9,parse_line
        jal     $ra,$t9
        sw      $v0,32($fp)
        lw      $v0,32($fp)
        bne     $v0,$zero,$L42
        li      $v0,-1                  # 0xffffffffffffffff
        sw      $v0,48($fp)
        b       $L38
$L42:
        lw      $v0,32($fp)
        lw      $v0,0($v0)
        sw      $v0,36($fp)
        lw      $a0,36($fp)
        lw      $a1,36($fp)
        la      $t9,create_matrix
        jal     $ra,$t9
        sw      $v0,40($fp)
        lw      $v0,32($fp)
        lw      $a0,40($fp)
        lw      $a1,4($v0)
        lw      $a2,36($fp)
        la      $t9,asign_values_to_matrix
        jal     $ra,$t9
        lw      $a0,36($fp)
        lw      $a1,36($fp)
        la      $t9,create_matrix
        jal     $ra,$t9
        sw      $v0,44($fp)
        lw      $v0,32($fp)
        lw      $a0,44($fp)
        lw      $a1,8($v0)
        lw      $a2,36($fp)
        la      $t9,asign_values_to_matrix
        jal     $ra,$t9
        lw      $a0,76($fp)
        lw      $a1,40($fp)
        la      $t9,print_matrix
        jal     $ra,$t9
        lw      $a0,76($fp)
        lw      $a1,44($fp)
        la      $t9,print_matrix
        jal     $ra,$t9
        lw      $a0,40($fp)
        lw      $a1,44($fp)
        la      $t9,matrix_multiply
        jal     $ra,$t9
        lw      $a0,76($fp)
        move    $a1,$v0
        la      $t9,print_matrix
        jal     $ra,$t9
        lw      $v1,24($fp)
        li      $v0,-1                  # 0xffffffffffffffff
        bne     $v1,$v0,$L39
        sw      $zero,48($fp)
$L38:
        lw      $v0,48($fp)
        move    $sp,$fp
        lw      $ra,64($sp)
        lw      $fp,60($sp)
        addu    $sp,$sp,72
        j       $ra
        .end    parse_and_multiply_matrixes
        .size   parse_and_multiply_matrixes, .-parse_and_multiply_matrixes
        .rdata
        .align  2
$LC11:
        .ascii  "-h\000"
        .align  2
$LC12:
        .ascii  "-V\000"
        .align  2
$LC13:
        .ascii  "%s\n\000"
        .align  2
$LC14:
        .ascii  "Error: Cantidad de parametros erronea\000"
        .text
        .align  2
        .globl  verify_argv
        .ent    verify_argv
verify_argv:
        .frame  $fp,48,$ra              # vars= 8, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,48
        .cprestore 16
        sw      $ra,40($sp)
        sw      $fp,36($sp)
        sw      $gp,32($sp)
        move    $fp,$sp
        sw      $a0,48($fp)
        sw      $a1,52($fp)
        lw      $v0,52($fp)
        addu    $v0,$v0,4
        lw      $a0,0($v0)
        la      $a1,$LC11
        la      $t9,strcmp
        jal     $ra,$t9
        bne     $v0,$zero,$L45
        la      $a0,__sF+88
        la      $a1,HELP
        la      $t9,fprintf
        jal     $ra,$t9
        li      $v0,1                   # 0x1
        sw      $v0,24($fp)
        b       $L44
$L45:
        lw      $v0,52($fp)
        addu    $v0,$v0,4
        lw      $a0,0($v0)
        la      $a1,$LC11
        la      $t9,strcmp
        jal     $ra,$t9
        bne     $v0,$zero,$L46
        la      $a0,__sF+88
        la      $a1,$LC12
        la      $t9,fprintf
        jal     $ra,$t9
        li      $v0,1                   # 0x1
        sw      $v0,24($fp)
        b       $L44
$L46:
        lw      $v1,48($fp)
        li      $v0,3                   # 0x3
        beq     $v1,$v0,$L48
        la      $a0,__sF+176
        la      $a1,$LC13
        la      $a2,$LC14
        la      $t9,fprintf
        jal     $ra,$t9
        li      $v0,-1                  # 0xffffffffffffffff
        sw      $v0,24($fp)
        b       $L44
$L48:
        sw      $zero,24($fp)
$L44:
        lw      $v0,24($fp)
        move    $sp,$fp
        lw      $ra,40($sp)
        lw      $fp,36($sp)
        addu    $sp,$sp,48
        j       $ra
        .end    verify_argv
        .size   verify_argv, .-verify_argv
        .rdata
        .align  2
$LC15:
        .ascii  "r\000"
        .align  2
$LC16:
        .ascii  "w\000"
        .align  2
$LC17:
        .ascii  "File not found \n\000"
        .text
        .align  2
        .globl  main
        .ent    main
main:
        .frame  $fp,56,$ra              # vars= 16, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,56
        .cprestore 16
        sw      $ra,48($sp)
        sw      $fp,44($sp)
        sw      $gp,40($sp)
        move    $fp,$sp
        sw      $a0,56($fp)
        sw      $a1,60($fp)
        lw      $a0,56($fp)
        lw      $a1,60($fp)
        la      $t9,verify_argv
        jal     $ra,$t9
        sw      $v0,24($fp)
        lw      $v0,24($fp)
        beq     $v0,$zero,$L50
        lw      $v0,24($fp)
        sw      $v0,36($fp)
        b       $L49
$L50:
        lw      $v0,24($fp)
        bgez    $v0,$L51
        lw      $v0,24($fp)
        subu    $v0,$zero,$v0
        sw      $v0,36($fp)
        b       $L49
$L51:
        lw      $v0,60($fp)
        addu    $v0,$v0,4
        lw      $a0,0($v0)
        la      $a1,$LC15
        la      $t9,fopen
        jal     $ra,$t9
        sw      $v0,28($fp)
        lw      $v0,60($fp)
        addu    $v0,$v0,8
        lw      $a0,0($v0)
        la      $a1,$LC16
        la      $t9,fopen
        jal     $ra,$t9
        sw      $v0,32($fp)
        lw      $v0,28($fp)
        beq     $v0,$zero,$L54
        lw      $v0,32($fp)
        bne     $v0,$zero,$L53
$L54:
        la      $a0,__sF+176
        la      $a1,$LC17
        la      $t9,fprintf
        jal     $ra,$t9
        li      $v0,1                   # 0x1
        sw      $v0,36($fp)
        b       $L49
$L53:
        lw      $a0,28($fp)
        lw      $a1,32($fp)
        la      $t9,parse_and_multiply_matrixes
        jal     $ra,$t9
        sw      $v0,24($fp)
        lw      $v0,24($fp)
        bgez    $v0,$L55
        li      $a0,1                   # 0x1
        la      $t9,exit
        jal     $ra,$t9
$L55:
        lw      $a0,28($fp)
        la      $t9,fclose
        jal     $ra,$t9
        lw      $a0,32($fp)
        la      $t9,fclose
        jal     $ra,$t9
        sw      $zero,36($fp)
$L49:
        lw      $v0,36($fp)
        move    $sp,$fp
        lw      $ra,48($sp)
        lw      $fp,44($sp)
        addu    $sp,$sp,56
        j       $ra
        .end    main
        .size   main, .-main
        .ident  "GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"

