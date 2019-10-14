        .file   1 "main.c"
        .section .mdebug.abi32
        .previous
        .abicalls
        .globl  HELP
        .rdata
        .align  2
        .type   HELP, @object
        .size   HELP, 220
HELP:
        .ascii  "Usage:\n"
        .ascii  " \tTP0 -h \n"
        .ascii  "\tTP0 -V\n"
        .ascii  "\tTP0 < in_input_file > out_input_file\n\n"
        .ascii  "Options:\n"
        .ascii  "\t-V, --version Print version and quit.\n"
        .ascii  "\t-h, --help Print this information and quit.\n"
        .ascii  "Examples:\n"
        .ascii  "\tTP0 < in.txt > out.txt\n"
        .ascii  "\tcat in.txt | TP0 > out.txt\n\000"
        .globl  VERSION
        .align  2
        .type   VERSION, @object
        .size   VERSION, 15
VERSION:
        .ascii  "First version\n\000"
        .text
        .align  2
        .globl  asign_values_to_matrix
        .ent    asign_values_to_matrix
asign_values_to_matrix:
        .frame  $fp,24,$31              # vars= 8, regs= 2/0, args= 0, extra= 8
        .mask   0x50000000,-4
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $25
        .set    reorder
        subu    $sp,$sp,24
        .cprestore 0
        sw      $fp,20($sp)
        sw      $28,16($sp)
        move    $fp,$sp
        sw      $4,24($fp)
        sw      $5,28($fp)
        sw      $6,32($fp)
        sw      $0,8($fp)
        lw      $2,32($fp)
        lw      $3,32($fp)
        mult    $2,$3
        mflo    $2
        sw      $2,12($fp)
$L6:
        lw      $2,8($fp)
        lw      $3,12($fp)
        sltu    $2,$2,$3
        bne     $2,$0,$L9
        b       $L5
$L9:
        lw      $4,24($fp)
        lw      $2,8($fp)
        sll     $3,$2,3
        lw      $2,8($4)
        addu    $4,$3,$2
        lw      $2,8($fp)
        sll     $3,$2,3
        lw      $2,28($fp)
        addu    $2,$3,$2
        l.d     $f0,0($2)
        s.d     $f0,0($4)
        lw      $2,8($fp)
        addu    $2,$2,1
        sw      $2,8($fp)
        b       $L6
$L5:
        move    $sp,$fp
        lw      $fp,20($sp)
        addu    $sp,$sp,24
        j       $31
        .end    asign_values_to_matrix
        .size   asign_values_to_matrix, .-asign_values_to_matrix
        .align  2
        .globl  read_line_create
        .ent    read_line_create
read_line_create:
        .frame  $fp,48,$31              # vars= 8, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $25
        .set    reorder
        subu    $sp,$sp,48
        .cprestore 16
        sw      $31,40($sp)
        sw      $fp,36($sp)
        sw      $28,32($sp)
        move    $fp,$sp
        sw      $4,48($fp)
        sw      $5,52($fp)
        li      $4,12                   # 0xc
        la      $25,malloc
        jal     $31,$25
        sw      $2,24($fp)
        lw      $2,24($fp)
        bne     $2,$0,$L11
        sw      $0,28($fp)
        b       $L10
$L11:
        lw      $3,24($fp)
        lw      $2,48($fp)
        sw      $2,0($3)
        lw      $3,24($fp)
        lw      $2,52($fp)
        sw      $2,4($3)
        lw      $4,24($fp)
        lw      $3,48($fp)
        lw      $2,48($fp)
        mult    $3,$2
        mflo    $2
        sll     $3,$2,3
        lw      $2,52($fp)
        addu    $2,$2,$3
        sw      $2,8($4)
        lw      $2,24($fp)
        sw      $2,28($fp)
$L10:
        lw      $2,28($fp)
        move    $sp,$fp
        lw      $31,40($sp)
        lw      $fp,36($sp)
        addu    $sp,$sp,48
        j       $31
        .end    read_line_create
        .size   read_line_create, .-read_line_create
        .align  2
        .globl  read_line_free
        .ent    read_line_free
read_line_free:
        .frame  $fp,40,$31              # vars= 0, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $25
        .set    reorder
        subu    $sp,$sp,40
        .cprestore 16
        sw      $31,32($sp)
        sw      $fp,28($sp)
        sw      $28,24($sp)
        move    $fp,$sp
        sw      $4,40($fp)
        lw      $2,40($fp)
        lw      $4,4($2)
        la      $25,free
        jal     $31,$25
        lw      $4,40($fp)
        la      $25,free
        jal     $31,$25
        move    $sp,$fp
        lw      $31,32($sp)
        lw      $fp,28($sp)
        addu    $sp,$sp,40
        j       $31
        .end    read_line_free
        .size   read_line_free, .-read_line_free
        .rdata
        .align  2
$LC0:
        .ascii  "%lg\000"
        .align  2
$LC1:
        .ascii  "%s | line_no %d\n\000"
        .align  2
$LC2:
        .ascii  "ERROR: No pattern found for double\000"
        .align  2
$LC3:
        .ascii  "%s | %c | line_no %d\n\000"
        .align  2
$LC4:
        .ascii  "ERROR: Not a Number ;)\000"
        .text
        .align  2
        .globl  obtain_matrixes_values
        .ent    obtain_matrixes_values
obtain_matrixes_values:
        .frame  $fp,56,$31              # vars= 16, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $25
        .set    reorder
        subu    $sp,$sp,56
        .cprestore 16
        sw      $31,48($sp)
        sw      $fp,44($sp)
        sw      $28,40($sp)
        move    $fp,$sp
        sw      $4,56($fp)
        sw      $5,60($fp)
        sw      $6,64($fp)
        sw      $7,68($fp)
        sw      $0,28($fp)
$L14:
        lw      $2,28($fp)
        sll     $3,$2,3
        lw      $2,60($fp)
        addu    $2,$3,$2
        lw      $4,56($fp)
        la      $5,$LC0
        move    $6,$2
        la      $25,fscanf
        jal     $31,$25
        sw      $2,24($fp)
        lw      $3,24($fp)
        li      $2,1                    # 0x1
        beq     $3,$2,$L17
        la      $4,$LC1
        la      $5,$LC2
        lw      $6,68($fp)
        la      $25,printf
        jal     $31,$25
        li      $2,-1                   # 0xffffffffffffffff
        sw      $2,32($fp)
        b       $L13
$L17:
        .set    noreorder
        nop
        .set    reorder
$L18:
        lw      $4,56($fp)
        la      $25,getc
        jal     $31,$25
        move    $3,$2
        lw      $2,64($fp)
        sw      $3,0($2)
        lw      $2,0($2)
        bne     $2,$0,$L20
        b       $L19
$L20:
        lw      $2,64($fp)
        lw      $3,0($2)
        li      $2,32                   # 0x20
        beq     $3,$2,$L18
        lw      $2,64($fp)
        lw      $3,0($2)
        li      $2,9                    # 0x9
        beq     $3,$2,$L18
        lw      $2,64($fp)
        lw      $2,0($2)
        slt     $2,$2,48
        bne     $2,$0,$L24
        lw      $2,64($fp)
        lw      $2,0($2)
        slt     $2,$2,58
        beq     $2,$0,$L24
        lw      $2,64($fp)
        lw      $4,0($2)
        lw      $5,56($fp)
        la      $25,ungetc
        jal     $31,$25
        lw      $2,28($fp)
        addu    $2,$2,1
        sw      $2,28($fp)
        b       $L19
$L24:
        lw      $2,64($fp)
        lw      $3,0($2)
        li      $2,10                   # 0xa
        beq     $3,$2,$L19
        lw      $2,64($fp)
        lw      $3,0($2)
        li      $2,-1                   # 0xffffffffffffffff
        beq     $3,$2,$L19
        lw      $2,64($fp)
        la      $4,$LC3
        la      $5,$LC4
        lw      $6,0($2)
        lw      $7,68($fp)
        la      $25,printf
        jal     $31,$25
        li      $2,-1                   # 0xffffffffffffffff
        sw      $2,32($fp)
        b       $L13
$L19:
        lw      $2,64($fp)
        lw      $3,0($2)
        li      $2,10                   # 0xa
        beq     $3,$2,$L15
        lw      $2,64($fp)
        lw      $3,0($2)
        li      $2,-1                   # 0xffffffffffffffff
        beq     $3,$2,$L15
        b       $L14
$L15:
        lw      $2,28($fp)
        addu    $2,$2,1
        sw      $2,32($fp)
$L13:
        lw      $2,32($fp)
        move    $sp,$fp
        lw      $31,48($sp)
        lw      $fp,44($sp)
        addu    $sp,$sp,56
        j       $31
        .end    obtain_matrixes_values
        .size   obtain_matrixes_values, .-obtain_matrixes_values
        .rdata
        .align  2
$LC5:
        .ascii  "%lu\000"
        .align  2
$LC6:
        .ascii  "ERROR: No pattern found for len_matrix\000"
        .align  2
$LC7:
        .ascii  "%s | %lu vs %lu | line_no %d\n\000"
        .align  2
$LC8:
        .ascii  "ERROR: mismatched amount of values\000"
        .text
        .align  2
        .globl  parse_line
        .ent    parse_line
parse_line:
        .frame  $fp,80,$31              # vars= 32, regs= 3/0, args= 24, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $25
        .set    reorder
        subu    $sp,$sp,80
        .cprestore 24
        sw      $31,72($sp)
        sw      $fp,68($sp)
        sw      $28,64($sp)
        move    $fp,$sp
        sw      $4,80($fp)
        sw      $5,84($fp)
        sw      $6,88($fp)
        addu    $2,$fp,36
        lw      $4,80($fp)
        la      $5,$LC5
        move    $6,$2
        la      $25,fscanf
        jal     $31,$25
        sw      $2,32($fp)
        lw      $3,32($fp)
        li      $2,1                    # 0x1
        beq     $3,$2,$L32
        la      $4,$LC1
        la      $5,$LC6
        lw      $6,88($fp)
        la      $25,printf
        jal     $31,$25
        sw      $0,56($fp)
        b       $L31
$L32:
        lw      $3,36($fp)
        lw      $2,36($fp)
        mult    $3,$2
        mflo    $2
        sll     $2,$2,1
        sw      $2,40($fp)
        lw      $2,40($fp)
        sll     $2,$2,3
        move    $4,$2
        la      $25,malloc
        jal     $31,$25
        sw      $2,44($fp)
        lw      $4,80($fp)
        lw      $5,44($fp)
        lw      $6,84($fp)
        lw      $7,88($fp)
        la      $25,obtain_matrixes_values
        jal     $31,$25
        sw      $2,48($fp)
        lw      $3,40($fp)
        lw      $2,48($fp)
        beq     $3,$2,$L34
        lw      $2,88($fp)
        sw      $2,16($sp)
        la      $4,$LC7
        la      $5,$LC8
        lw      $6,40($fp)
        lw      $7,48($fp)
        la      $25,printf
        jal     $31,$25
        sw      $0,56($fp)
        b       $L31
$L34:
        lw      $4,36($fp)
        lw      $5,44($fp)
        la      $25,read_line_create
        jal     $31,$25
        sw      $2,52($fp)
        lw      $2,52($fp)
        bne     $2,$0,$L35
        sw      $0,56($fp)
        b       $L31
$L35:
        lw      $2,52($fp)
        sw      $2,56($fp)
$L31:
        lw      $2,56($fp)
        move    $sp,$fp
        lw      $31,72($sp)
        lw      $fp,68($sp)
        addu    $sp,$sp,80
        j       $31
        .end    parse_line
        .size   parse_line, .-parse_line
        .align  2
        .globl  parse_and_multiply_matrixes
        .ent    parse_and_multiply_matrixes
parse_and_multiply_matrixes:
        .frame  $fp,72,$31              # vars= 32, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $25
        .set    reorder
        subu    $sp,$sp,72
        .cprestore 16
        sw      $31,64($sp)
        sw      $fp,60($sp)
        sw      $28,56($sp)
        move    $fp,$sp
        sw      $4,72($fp)
        sw      $5,76($fp)
        sw      $0,28($fp)
$L37:
        lw      $2,28($fp)
        addu    $2,$2,1
        sw      $2,28($fp)
        lw      $4,72($fp)
        addu    $5,$fp,24
        lw      $6,28($fp)
        la      $25,parse_line
        jal     $31,$25
        sw      $2,32($fp)
        lw      $2,32($fp)
        bne     $2,$0,$L40
        li      $2,-1                   # 0xffffffffffffffff
        sw      $2,52($fp)
        b       $L36
$L40:
        lw      $2,32($fp)
        lw      $2,0($2)
        sw      $2,36($fp)
        lw      $4,36($fp)
        lw      $5,36($fp)
        la      $25,create_matrix
        jal     $31,$25
        sw      $2,40($fp)
        lw      $2,40($fp)
        bne     $2,$0,$L41
        lw      $4,32($fp)
        la      $25,read_line_free
        jal     $31,$25
        li      $2,-2                   # 0xfffffffffffffffe
        sw      $2,52($fp)
        b       $L36
$L41:
        lw      $2,32($fp)
        lw      $4,40($fp)
        lw      $5,4($2)
        lw      $6,36($fp)
        la      $25,asign_values_to_matrix
        jal     $31,$25
        lw      $4,36($fp)
        lw      $5,36($fp)
        la      $25,create_matrix
        jal     $31,$25
        sw      $2,44($fp)
        lw      $2,44($fp)
        bne     $2,$0,$L42
        lw      $4,32($fp)
        la      $25,read_line_free
        jal     $31,$25
        lw      $4,40($fp)
        la      $25,free
        jal     $31,$25
        li      $2,-2                   # 0xfffffffffffffffe
        sw      $2,52($fp)
        b       $L36
$L42:
        lw      $2,32($fp)
        lw      $4,44($fp)
        lw      $5,8($2)
        lw      $6,36($fp)
        la      $25,asign_values_to_matrix
        jal     $31,$25
        lw      $4,40($fp)
        lw      $5,44($fp)
        la      $25,matrix_multiply
        jal     $31,$25
        sw      $2,48($fp)
        lw      $2,48($fp)
        bne     $2,$0,$L43
        lw      $4,32($fp)
        la      $25,read_line_free
        jal     $31,$25
        lw      $4,40($fp)
        la      $25,free
        jal     $31,$25
        lw      $4,44($fp)
        la      $25,free
        jal     $31,$25
        li      $2,-2                   # 0xfffffffffffffffe
        sw      $2,52($fp)
        b       $L36
$L43:
        lw      $4,76($fp)
        lw      $5,48($fp)
        la      $25,print_matrix
        jal     $31,$25
        lw      $4,32($fp)
        la      $25,read_line_free
        jal     $31,$25
        lw      $4,40($fp)
        la      $25,destroy_matrix
        jal     $31,$25
        lw      $4,44($fp)
        la      $25,destroy_matrix
        jal     $31,$25
        lw      $4,48($fp)
        la      $25,destroy_matrix
        jal     $31,$25
        lw      $3,24($fp)
        li      $2,-1                   # 0xffffffffffffffff
        bne     $3,$2,$L37
        sw      $0,52($fp)
$L36:
        lw      $2,52($fp)
        move    $sp,$fp
        lw      $31,64($sp)
        lw      $fp,60($sp)
        addu    $sp,$sp,72
        j       $31
        .end    parse_and_multiply_matrixes
        .size   parse_and_multiply_matrixes, .-parse_and_multiply_matrixes
        .rdata
        .align  2
$LC9:
        .ascii  "-h\000"
        .align  2
$LC10:
        .ascii  "-V\000"
        .align  2
$LC11:
        .ascii  "%s\n\000"
        .align  2
$LC12:
        .ascii  "Error: Cantidad de parametros erronea\000"
        .text
        .align  2
        .globl  verify_argv
        .ent    verify_argv
verify_argv:
        .frame  $fp,48,$31              # vars= 8, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $25
        .set    reorder
        subu    $sp,$sp,48
        .cprestore 16
        sw      $31,40($sp)
        sw      $fp,36($sp)
        sw      $28,32($sp)
        move    $fp,$sp
        sw      $4,48($fp)
        sw      $5,52($fp)
        lw      $2,52($fp)
        addu    $2,$2,4
        lw      $4,0($2)
        la      $5,$LC9
        la      $25,strcmp
        jal     $31,$25
        bne     $2,$0,$L46
        la      $4,__sF+88
        la      $5,HELP
        la      $25,fprintf
        jal     $31,$25
        li      $2,1                    # 0x1
        sw      $2,24($fp)
        b       $L45
$L46:
        lw      $2,52($fp)
        addu    $2,$2,4
        lw      $4,0($2)
        la      $5,$LC10
        la      $25,strcmp
        jal     $31,$25
        bne     $2,$0,$L47
        la      $4,__sF+88
        la      $5,VERSION
        la      $25,fprintf
        jal     $31,$25
        li      $2,1                    # 0x1
        sw      $2,24($fp)
        b       $L45
$L47:
        lw      $3,48($fp)
        li      $2,3                    # 0x3
        beq     $3,$2,$L49
        la      $4,__sF+176
        la      $5,$LC11
        la      $6,$LC12
        la      $25,fprintf
        jal     $31,$25
        li      $2,-1                   # 0xffffffffffffffff
        sw      $2,24($fp)
        b       $L45
$L49:
        sw      $0,24($fp)
$L45:
        lw      $2,24($fp)
        move    $sp,$fp
        lw      $31,40($sp)
        lw      $fp,36($sp)
        addu    $sp,$sp,48
        j       $31
        .end    verify_argv
        .size   verify_argv, .-verify_argv
        .rdata
        .align  2
$LC13:
        .ascii  "r\000"
        .align  2
$LC14:
        .ascii  "File not found: %s\n\000"
        .align  2
$LC15:
        .ascii  "w\000"
        .text
        .align  2
        .globl  main
        .ent    main
main:
        .frame  $fp,56,$31              # vars= 16, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $25
        .set    reorder
        subu    $sp,$sp,56
        .cprestore 16
        sw      $31,48($sp)
        sw      $fp,44($sp)
        sw      $28,40($sp)
        move    $fp,$sp
        sw      $4,56($fp)
        sw      $5,60($fp)
        lw      $4,56($fp)
        lw      $5,60($fp)
        la      $25,verify_argv
        jal     $31,$25
        sw      $2,24($fp)
        lw      $2,24($fp)
        beq     $2,$0,$L51
        lw      $2,24($fp)
        sw      $2,36($fp)
        b       $L50
$L51:
        lw      $2,24($fp)
        bgez    $2,$L52
        lw      $2,24($fp)
        subu    $2,$0,$2
        sw      $2,36($fp)
        b       $L50
$L52:
        lw      $2,60($fp)
        addu    $2,$2,4
        lw      $4,0($2)
        la      $5,$LC13
        la      $25,fopen
        jal     $31,$25
        sw      $2,28($fp)
        lw      $2,28($fp)
        bne     $2,$0,$L54
        lw      $2,60($fp)
        addu    $2,$2,4
        la      $4,__sF+176
        la      $5,$LC14
        lw      $6,0($2)
        la      $25,fprintf
        jal     $31,$25
        li      $2,1                    # 0x1
        sw      $2,36($fp)
        b       $L50
$L54:
        lw      $2,60($fp)
        addu    $2,$2,8
        lw      $4,0($2)
        la      $5,$LC15
        la      $25,fopen
        jal     $31,$25
        sw      $2,32($fp)
        lw      $2,32($fp)
        bne     $2,$0,$L55
        lw      $4,32($fp)
        la      $25,fclose
        jal     $31,$25
        lw      $2,60($fp)
        addu    $2,$2,8
        la      $4,__sF+176
        la      $5,$LC14
        lw      $6,0($2)
        la      $25,fprintf
        jal     $31,$25
        li      $2,1                    # 0x1
        sw      $2,36($fp)
        b       $L50
$L55:
        lw      $4,28($fp)
        lw      $5,32($fp)
        la      $25,parse_and_multiply_matrixes
        jal     $31,$25
        sw      $2,24($fp)
        lw      $2,24($fp)
        bgez    $2,$L56
        lw      $2,24($fp)
        subu    $2,$0,$2
        move    $4,$2
        la      $25,exit
        jal     $31,$25
$L56:
        lw      $4,28($fp)
        la      $25,fclose
        jal     $31,$25
        lw      $4,32($fp)
        la      $25,fclose
        jal     $31,$25
        sw      $0,36($fp)
$L50:
        lw      $2,36($fp)
        move    $sp,$fp
        lw      $31,48($sp)
        lw      $fp,44($sp)
        addu    $sp,$sp,56
        j       $31
        .end    main
        .size   main, .-main
        .ident  "GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
