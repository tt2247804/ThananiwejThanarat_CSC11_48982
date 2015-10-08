/*
        Thanarat Thananiwej
        Oct 7th, 2015
        If_Else Statement
*/

.global main
main:
	mov R1, #6	@user input
	cmp R1, #1
	beq csc_11
	cmp R1, #3
	beq csc_11
	cmp R1, #2
	beq csc_5
	cmp R1, #4
	beq csc_5
	cmp R1, #5
	beq cis_1a
	bal other
csc_11:
	mov R0, #11
	bal exit
csc_5:
	mov R0, #5
	bal exit
cis_1a:
	mov R0, #1
	bal exit
other:
	mov R0, #0
	bal exit
exit:
	mov R7, #1
	swi 0

