.data

.balign 4
m1: .asciz "Tic-Tac-Toe\n"

.balign 4
m2: .asciz " ___ ___ ___\n"

.balign 4
m3: .asciz "| %c | %c | %c |\n"

.balign 4
m4: .asciz "|___|___|___|\n"

.balign 4
m5: .asciz "| %c | %c | %c |\n"

.balign 4
m6: .asciz "|___|___|___|\n"

.balign 4
m7: .asciz "| %c | %c | %c |\n"

.balign 4
m8: .asciz "|___|___|___|\n"

.balign 4
m9: .asciz "Player 1 = x.\n"

.balign 4
m10: .asciz "Player 2 = o.\n\n"

.balign 4
scan: .asciz "%c"

.balign 4
read: .word 0

.balign 4
return: .word 0 

.text

drawXOBoard:
	ldr r0, ad_m1
        bl printf

        ldr r0, ad_m2
        bl printf

        ldr r0, ad_m3
	mov r1, #49
	mov r2, #50
	mov r3, #51
        bl printf

        ldr r0, ad_m4
        bl printf

        ldr r0, ad_m5
	mov r1, #52
	mov r2, #53
	mov r3, #54
        bl printf

	ldr r0, ad_m6
        bl printf

        ldr r0, ad_m7
        mov r1, #55
	mov r2, #56
	mov r3, #57
        bl printf

        ldr r0, ad_m8
        bl printf

	bal end

ad_m1: .word m1
ad_m2: .word m2
ad_m3: .word m3
ad_m4: .word m4
ad_m5: .word m5
ad_m6: .word m6
ad_m7: .word m7
ad_m8: .word m8

.global main, end
main:
	ldr r1, ad_return
        str lr, [r1]

	ldr r0, ad_m9
        bl printf

	ldr r0, ad_m10
        bl printf

	bal drawXOBoard
end:
        ldr lr, ad_return
        ldr lr, [lr]
        bx lr

ad_m9: .word m9
ad_m10: .word m10
ad_scan: .word scan
ad_read: .word read
ad_return: .word return

.global printf
.global scanf
