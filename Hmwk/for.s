/*
        Thanarat Thananiwej
        Oct 7th, 2015
        For loop
*/

.global main
main:
        mov R0, #0
        mov R1, #1
        cmp R1, #10
        ble loop
loop:
        add R0, R0, R1
        add R1, R1, #1
        cmp R1, #10
        ble loop
        mov R7, #1
        swi 0

