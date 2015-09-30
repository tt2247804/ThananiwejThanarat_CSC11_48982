/*
        Thanarat Thananiwej
        Sept 29nd, 2015
        division using shift
        R1 -> numerator
        R2 -> denominator
	R3 -> shift counter
        R0 -> remainder
*/
.global main
main:
        mov R1, #88
        mov R2, #5
loop_out:
	mov R3, #-1
loop_in:
	lsl R2, #1
	add R3, R3, #1
	cmp R1, R2
	bgt loop_in
	lsr R2, #1
        subs R1, R1, R2
	lsr R2, R3
	cmp R1, R2
	bgt loop_out
	mov R0, R1
        mov R7, #1
        swi 0

