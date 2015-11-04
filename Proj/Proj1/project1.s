.data

.balign 4
m1: .asciz " Tic-Tac-Toe\n"

.balign 4
m2: .asciz " ___ ___ ___\n"

.balign 4
m3: .asciz "| %c  | %c  | %c  |\n"

.balign 4
m4: .asciz "|___|___|___|\n"

.balign 4
m5: .asciz "| %c  | %c  | %c  |\n"

.balign 4
m6: .asciz "|___|___|___|\n"

.balign 4
m7: .asciz "| %c  | %c  | %c  |\n"

.balign 4
m8: .asciz "|___|___|___|\n"

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
        bl printf

        ldr r0, ad_m4
        bl printf

        ldr r0, ad_m5
        bl printf

	ldr r0, ad_m6
        bl printf

        ldr r0, ad_m7
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

	bal drawXOBoard
end:
        ldr lr, ad_return
        ldr lr, [lr]
        bx lr

ad_scan: .word scan
ad_read: .word read
ad_return: .word return

.global printf
.global scanf
