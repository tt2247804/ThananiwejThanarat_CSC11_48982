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
	mov R3, #6              @BP   0  WD 3
	mul R1, R3,R3		@BP   0  WD 6
        ldr R2, =0x3243F4       @BP -20  WD24
        mul R0, R2,R1           @BP -20  WD30
        lsr R0, #20             @BP   0  WD10
        mov R7, #1
        swi 0

