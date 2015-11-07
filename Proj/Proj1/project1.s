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
m11: .asciz "Please enter your move: "

.balign 4
m12: .asciz "Play %d wins!\n"

.balign 4
scan: .asciz "%c"

.balign 4
scan1: .asciz "%d"

.balign 4
read: .word 0

.balign 4
str1: .word 0

.balign 4
str2: .word 0

.balign 4
str3: .word 0

.balign 4
str4: .word 0

.balign 4
str5: .word 0

.balign 4
return: .word 0

.text

drawXOBoard:
	ldr r0, ad_m1
        bl printf

        ldr r0, ad_m2
        bl printf

	mov r1, r4
	mov r2, r5
	mov r3, r6
        ldr r0, ad_m3
        bl printf

        ldr r0, ad_m4
        bl printf

	mov r1, r7
	mov r2, r8
	mov r3, r9
        ldr r0, ad_m5
        bl printf

	ldr r0, ad_m6
        bl printf

	mov r1, r10
	ldr r2, ad_str1
	ldr r2, [r2]
	ldr r3, ad_str2
	ldr r3, [r3]
        ldr r0, ad_m7
        bl printf

        ldr r0, ad_m8
        bl printf

	bal play

ad_m1: .word m1
ad_m2: .word m2
ad_m3: .word m3
ad_m4: .word m4
ad_m5: .word m5
ad_m6: .word m6
ad_m7: .word m7
ad_m8: .word m8

checkWin:
	cmp r4, r5
	bne case1
	cmp r5, r6
	beq true
case1:
	cmp r7, r8
	bne case2
	cmp r8, r9
	beq true
case2:
	ldr r2, ad_str1
        ldr r2, [r2]
        ldr r3, ad_str2
        ldr r3, [r3]
	cmp r10, r2
        bne case3
        cmp r2, r3
        beq true
case3:
	cmp r4, r7
	bne case4
	cmp r7, r10
	beq true
case4:
	cmp r5, r8
	bne case5
	cmp r8, r2
	beq true
case5:
	cmp r6, r9
	bne case6
	cmp r9, r3
	beq true
case6:
	cmp r4, r8
	bne case7
	cmp r8, r3
	beq true
case7:
	cmp r6, r8
	bne case8
	cmp r8, r10
	beq true
case8:
	bal false
true:
	mov r1, #1
	bal paint
false:
	mov r1, #0
	bal paint

.global main, end
main:
	ldr r1, ad_return
        str lr, [r1]

	mov r11, #2
	ldr r1, ad_str3
	str r11, [r1]

	mov r11, #0
        ldr r1, ad_str4
        str r11, [r1]

	ldr r0, ad_m9
        bl printf

	ldr r0, ad_m10
        bl printf

	mov r4, #49
        mov r5, #50
        mov r6, #51
	mov r7, #52
        mov r8, #53
        mov r9, #54
	mov r10, #55
        mov r11, #56
	ldr r1, ad_str1
	str r11, [r1]
	mov r11, #57
	ldr r1, ad_str2
	str r11, [r1]
	mov r1, #0	/*Turn*/
paint:
	cmp r1, #1
	beq win
	bal drawXOBoard
play:
	ldr r2, ad_str3
	ldr r2, [r2]
	cmp r2, #1
	beq switch
	mov r2, #1
	bal store
switch:
	mov r2, #2
store:
	ldr r1, ad_str3
	str r2, [r1]

	ldr r0, ad_m11
        bl printf

        ldr r0, ad_scan1
        ldr r1, ad_read
        bl scanf
        ldr r0, ad_read
        ldr r0, [r0]	/*Position*/

	ldr r2, ad_str3
        ldr r2, [r2]
	cmp r2, #1
	beq mark
mark:
	cmp r0, #1
	bne position1
	cmp r4, #49
	bne invalid
	mov r4, #120
	bal drawXOBoard
position1:
	cmp r0, #2
        bne position2
        cmp r5, #50
        bne invalid
        mov r5, #120
	bal drawXOBoard
position2:
	cmp r0, #3
        bne position3
        cmp r6, #51
        bne invalid
        mov r6, #120
	bal drawXOBoard
position3:
	cmp r0, #4
        bne position4
        cmp r7, #52
        bne invalid
        mov r7, #120
	bal drawXOBoard
position4:
	cmp r0, #5
        bne position5
        cmp r8, #53
        bne invalid
        mov r8, #120
	bal drawXOBoard
position5:
	cmp r0, #6
        bne position6
        cmp r9, #54
        bne invalid
        mov r9, #120
	bal drawXOBoard
position6:
	cmp r0, #7
        bne position7
        cmp r10, #55
        bne invalid
        mov r10, #120
	bal drawXOBoard
position7:
	ldr r11, ad_str1
        ldr r11, [r11]

	cmp r0, #8
        bne position8
        cmp r11, #56
        bne invalid

	mov r11, #120
        ldr r3, ad_str1
        str r11, [r3]

	bal drawXOBoard
position8:
        ldr r11, ad_str2
        ldr r11, [r11]

	cmp r0, #9
        bne invalid
        cmp r11, #57
        bne invalid

	mov r11, #120
	ldr r3, ad_str2
	str r11, [r3]

	bal drawXOBoard
invalid:
	bal end


win:
	ldr r0, ad_m12
        bl printf
end:
        ldr lr, ad_return
        ldr lr, [lr]
        bx lr

ad_m9: .word m9
ad_m10: .word m10
ad_m11: .word m11
ad_m12: .word m12
ad_scan: .word scan
ad_scan1: .word scan1
ad_read: .word read
ad_str1: .word str1
ad_str2: .word str2
ad_str3: .word str3
ad_str4: .word str4
ad_str5: .word str5
ad_return: .word return

.global printf
.global scanf
