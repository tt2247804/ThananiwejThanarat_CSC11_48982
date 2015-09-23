/*
        Thanarat Thananiwej
        Sept 22nd, 2015
        conversion radius to areas
        R1 -> radius^2
        R3 -> radius
        R2 -> conversion of radius to areas pi
        R0 -> areas
*/
.global _start
_start:
        ldr R3, =0x0068         @BP -4   WD8
        mul R1, R3,R3           @BP -8   WD16
        ldr R2, =0x3244         @BP -12  WD16
        mul R0, R2,R1           @BP -20  WD32
        lsr R0, #20             @BP   0  WD12
        mov R7, #1
        swi 0

