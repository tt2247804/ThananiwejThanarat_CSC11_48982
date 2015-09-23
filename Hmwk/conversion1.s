/*
	Thanarat Thananiwej
	Sept 22nd, 2015
	conversion months to years
	R1 -> months
	R2 -> conversion of months to years 1/12
	R0 -> years
*/
.global _start
_start:
	mov R1, #88		@BP   0	 WD 7
	ldr R2, =0x155556	@BP -24	 WD24
	mul R0, R2,R1		@BP -24	 WD31
	lsr R0, #24		@BP   0  WD 7
	mov R7, #1
	swi 0
 
