/*
        Thanarat Thananiwej
        Sept 28nd, 2015
	division using subtraction
        R1 -> numerator
        R2 -> denominator
        R0 -> remainder
*/
.global _start
_start:
        mov R1, #88
        mov R2, #5
_subtract:
        subs R1, R1, R2
	cmp R1, R2
	bge _subtract
	mov R0, R1
        mov R7, #1
        swi 0
