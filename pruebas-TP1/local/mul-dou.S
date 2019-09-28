# 02-holamundo.S - ver 02-holamundo.c.  #
# $Date: 2008/04/21 17:24:06 $

#include <mips/regdef.h>

        .text
        .align  2
        .globl  mul_dou
        .ent    mul_dou
        
mul_dou:
        .frame  $fp, 24, ra
        .set    noreorder
        .cpload t9
        .set    reorder
        subu    sp, sp, 24
        .cprestore 0
        sw      $fp, 4(sp)
        move    $fp, sp
        
        # Use v0 for the result.
        #
        #li     v0, 0
        #mul.d  f0, f12, f14
        #vj     mul_dou_return

        s.d     $f12,24($fp)
        s.d     $f14,32($fp)
        l.d     $f2,24($fp)
        l.d     $f0,32($fp)
        mul.d   $f0,$f2,$f0
        s.d     $f0,8($fp)
        l.d     $f0,8($fp)

mul_dou_return:
        # Destruimos el frame.
        #
        lw      $fp, 4(sp)
        addu    sp, sp, 24

        # Retorno.
        #
        j       ra
        .end    mul_dou
