#include <mips/regdef.h>
#include <sys/syscall.h>

        .text
        .globl main

main:

        # stack frame creation

        subu    $sp, $sp, 32

        sw      $ra, 20($sp)

        sw      $fp, 16($sp)

        addiu   $fp, $sp, 28



        la      $a0, str1

        li      $v0, 4          # print_str syscall

        syscall



        # stack frame unwinding

        lw      $ra, 20($sp)

        lw      $fp, 16($sp)

        addiu   $sp, $sp, 32

        jr      $ra             # return to caller





        .data

str1:   .asciiz "Hello world\n"
