/*
        Thanarat Thananiwej
        Sept 29nd, 2015
        division using shift
        R1 -> numerator
        R2 -> denominator
        R3 -> shift counter
	R4 -> loop counter
        R0 -> counter
*/
.global main
main:
	mov R0, #0
        mov R1, #88
        mov R2, #5
loop_out:
        mov R3, #-1
	mov R4, #1
loop_in:
        lsl R2, #1
        add R3, R3, #1
	lsl R4, #1
        cmp R1, R2
        bgt loop_in
        lsr R2, #1
	lsr R4, #1
        subs R1, R1, R2
        lsr R2, R3
	add R0, R0, R4
        cmp R1, R2
        bgt loop_out
        mov R7, #1
        swi 0

