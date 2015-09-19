/*
        Thanarat Thananiwej
        Sept 19th, 2015
        Second Program
	Learning how to add       
*/
.global _start
_start:
        mov R0, #65
	mov R1, #32
	add R0, R0, R1 @ RO=R0+R1
	mov R7, #1
	swi 0

