/*
        Thanarat Thananiwej
        Sept 22nd, 2015
        conversion areas to r^2
        R1 -> areas
        R2 -> conversion of areas to r^2 1/pi
        R0 -> r^2
*/
.global _start
_start:
        ldr R1, =0x7167         @BP  -8  WD15
        ldr R2, =0x517C         @BP -16  WD16
        mul R0, R2,R1           @BP -24  WD31
        lsr R0, #24             @BP   0  WD 7
        mov R7, #1
        swi 0

