        .file   1 "matrix.c"
        .section .mdebug.abi32
        .previous
        .abicalls
        .text
        .align  2
        .globl  create_matrix
        .ent    create_matrix
create_matrix:
        .frame  $fp,56,$31              # vars= 16, regs= 4/0, args= 16, extra= 8
        .mask   0xd0010000,-4
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $25
        .set    reorder
        subu    $sp,$sp,56
        .cprestore 16
        sw      $31,52($sp)
        sw      $fp,48($sp)
        sw      $28,44($sp)
        sw      $16,40($sp)
        move    $fp,$sp
        sw      $4,56($fp)
        sw      $5,60($fp)
        li      $4,12                   # 0xc
        la      $25,malloc
        jal     $31,$25
        sw      $2,24($fp)
        lw      $2,24($fp)
        bne     $2,$0,$L18
        sw      $0,32($fp)
        b       $L17
$L18:
        lw      $3,24($fp)
        lw      $2,56($fp)
        sw      $2,0($3)
        lw      $3,24($fp)
        lw      $2,60($fp)
        sw      $2,4($3)
        lw      $3,56($fp)
        lw      $2,60($fp)
        mult    $3,$2
        mflo    $2
        sw      $2,28($fp)
        lw      $16,24($fp)
        lw      $2,28($fp)
        sll     $2,$2,3
        move    $4,$2
        la      $25,malloc
        jal     $31,$25
        sw      $2,8($16)
        lw      $2,24($fp)
        lw      $2,8($2)
        bne     $2,$0,$L19
        lw      $4,24($fp)
        la      $25,free
        jal     $31,$25
        sw      $0,32($fp)
        b       $L17
$L19:
        lw      $2,24($fp)
        sw      $2,32($fp)
$L17:
        lw      $2,32($fp)
        move    $sp,$fp
        lw      $31,52($sp)
        lw      $fp,48($sp)
        lw      $16,40($sp)
        addu    $sp,$sp,56
        j       $31
        .end    create_matrix
        .size   create_matrix, .-create_matrix
        .align  2
        .globl  destroy_matrix
        .ent    destroy_matrix
destroy_matrix:
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
        lw      $4,8($2)
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
        .end    destroy_matrix
        .size   destroy_matrix, .-destroy_matrix
        .rdata
        .align  2
$LC0:
        .ascii  "%ld\000"
        .align  2
$LC1:
        .ascii  " %f\000"
        .align  2
$LC2:
        .ascii  "\n\000"
        .text
        .align  2
        .globl  print_matrix
        .ent    print_matrix
print_matrix:
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
        sw      $0,24($fp)
        lw      $2,60($fp)
        lw      $3,60($fp)
        lw      $4,0($2)
        lw      $2,4($3)
        mult    $4,$2
        mflo    $2
        sw      $2,28($fp)
        lw      $4,56($fp)
        la      $5,$LC0
        lw      $6,28($fp)
        la      $25,fprintf
        jal     $31,$25
        sw      $2,32($fp)
        lw      $4,56($fp)
        lw      $5,32($fp)
        la      $25,check_fprint
        jal     $31,$25
$L22:
        lw      $2,24($fp)
        lw      $3,28($fp)
        sltu    $2,$2,$3
        bne     $2,$0,$L25
        b       $L23
$L25:
        lw      $4,60($fp)
        lw      $2,24($fp)
        sll     $3,$2,3
        lw      $2,8($4)
        addu    $2,$3,$2
        lw      $4,56($fp)
        la      $5,$LC1
        lw      $6,0($2)
        lw      $7,4($2)
        la      $25,fprintf
        jal     $31,$25
        sw      $2,32($fp)
        lw      $4,56($fp)
        lw      $5,32($fp)
        la      $25,check_fprint
        jal     $31,$25
        lw      $2,24($fp)
        addu    $2,$2,1
        sw      $2,24($fp)
        b       $L22
$L23:
        lw      $4,56($fp)
        la      $5,$LC2
        la      $25,fprintf
        jal     $31,$25
        sw      $2,32($fp)
        lw      $4,56($fp)
        lw      $5,32($fp)
        la      $25,check_fprint
        jal     $31,$25
        move    $2,$0
        move    $sp,$fp
        lw      $31,48($sp)
        lw      $fp,44($sp)
        addu    $sp,$sp,56
        j       $31
        .end    print_matrix
        .size   print_matrix, .-print_matrix
        .rdata
        .align  2
$LC3:
        .ascii  "Error en la copia del archivo resultante\n\000"
        .text
        .align  2
        .globl  check_fprint
        .ent    check_fprint
check_fprint:
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
        sw      $5,44($fp)
        lw      $4,40($fp)
        la      $25,fflush
        jal     $31,$25
        lw      $2,44($fp)
        bgez    $2,$L26
        la      $4,__sF+176
        la      $5,$LC3
        la      $25,fprintf
        jal     $31,$25
        li      $4,1                    # 0x1
        la      $25,exit
        jal     $31,$25
$L26:
        move    $sp,$fp
        lw      $31,32($sp)
        lw      $fp,28($sp)
        addu    $sp,$sp,40
        j       $31
        .end    check_fprint
        .size   check_fprint, .-check_fprint
        .ident  "GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
