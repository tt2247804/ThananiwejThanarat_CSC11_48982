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
m12: .asciz "Player %d wins!\n"

.balign 4
m13: .asciz "Invalid move!\n\n"

.balign 4
m14: .asciz "It is a draw!\n"

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

	cmp r11, #99
	beq check
	cmp r11, #98
	beq check1
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
	cmp r11, #97
	beq draw1
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
	mov r1, #0
paint:
	cmp r1, #1
	beq win
	bal drawXOBoard
play:
	ldr r2, ad_str3		/*Turn*/
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
        ldr r0, [r0]		/*Position*/

	ldr r2, ad_str3
        ldr r2, [r2]
	cmp r2, #1
	beq start_x
	cmp r2, #2
	beq start_o
start_x:
	cmp r0, #1
	bne position1_x
	cmp r4, #49
	bne invalid
	mov r4, #120
	bal draw
position1_x:
	cmp r0, #2
        bne position2_x
        cmp r5, #50
        bne invalid
        mov r5, #120
	bal draw
position2_x:
	cmp r0, #3
        bne position3_x
        cmp r6, #51
        bne invalid
        mov r6, #120
	bal draw
position3_x:
	cmp r0, #4
        bne position4_x
        cmp r7, #52
        bne invalid
        mov r7, #120
	bal draw
position4_x:
	cmp r0, #5
        bne position5_x
        cmp r8, #53
        bne invalid
        mov r8, #120
	bal draw
position5_x:
	cmp r0, #6
        bne position6_x
        cmp r9, #54
        bne invalid
        mov r9, #120
	bal draw
position6_x:
	cmp r0, #7
        bne position7_x
        cmp r10, #55
        bne invalid
        mov r10, #120
	bal draw
position7_x:
	ldr r11, ad_str1
        ldr r11, [r11]

	cmp r0, #8
        bne position8_x
        cmp r11, #56
        bne invalid

	mov r11, #120
        ldr r3, ad_str1
        str r11, [r3]

	bal draw
position8_x:
        ldr r11, ad_str2
        ldr r11, [r11]

	cmp r0, #9
        bne invalid
        cmp r11, #57
        bne invalid

	mov r11, #120
	ldr r3, ad_str2
	str r11, [r3]

	bal draw
start_o:
        cmp r0, #1
        bne position1_o
        cmp r4, #49
        bne invalid
        mov r4, #111
        bal draw
position1_o:
        cmp r0, #2
        bne position2_o
        cmp r5, #50
        bne invalid
        mov r5, #111
        bal draw
position2_o:
        cmp r0, #3
        bne position3_o
        cmp r6, #51
        bne invalid
        mov r6, #111
        bal draw
position3_o:
        cmp r0, #4
        bne position4_o
        cmp r7, #52
        bne invalid
        mov r7, #111
        bal draw
position4_o:
        cmp r0, #5
        bne position5_o
        cmp r8, #53
        bne invalid
        mov r8, #111
        bal draw
position5_o:
        cmp r0, #6
        bne position6_o
        cmp r9, #54
        bne invalid
        mov r9, #111
        bal draw
position6_o:
        cmp r0, #7
        bne position7_o
        cmp r10, #55
        bne invalid
        mov r10, #111
        bal draw
position7_o:
        ldr r11, ad_str1
        ldr r11, [r11]

        cmp r0, #8
        bne position8_o
        cmp r11, #56
        bne invalid

        mov r11, #111
        ldr r3, ad_str1
        str r11, [r3]

        bal draw
position8_o:
        ldr r11, ad_str2
        ldr r11, [r11]

        cmp r0, #9
        bne invalid
        cmp r11, #57
        bne invalid

        mov r11, #111
        ldr r3, ad_str2
        str r11, [r3]

        bal draw
draw:
	ldr r11, ad_str4
	ldr r11, [r11]
	add r11, r11, #1
	ldr r3, ad_str4
	str r11, [r3]
	cmp r11, #9
	bne checkWin
	mov r11, #97
	bal checkWin
draw1:
	mov r11, #98
	bal drawXOBoard
check1:
	ldr r0, ad_m14
        bl printf

	bal end
invalid:
	ldr r0, ad_m13
        bl printf

	ldr r3, ad_str4
	ldr r3, [r3]
	sub r3, r3, #1
	ldr r2, ad_str4
	str r3, [r2]

        ldr r2, ad_str3
        ldr r2, [r2]
        cmp r2, #1
        beq switch1
        mov r2, #1
        bal store1
switch1:
        mov r2, #2
store1:
        ldr r1, ad_str3
        str r2, [r1]

	bal draw

win:
	mov r11, #99
	bal drawXOBoard
check:
	ldr r0, ad_m12
	ldr r1, ad_str3
	ldr r1, [r1]
        bl printf
end:
        ldr lr, ad_return
        ldr lr, [lr]
        bx lr

ad_m9: .word m9
ad_m10: .word m10
ad_m11: .word m11
ad_m12: .word m12
ad_m13: .word m13
ad_m14: .word m14
ad_scan: .word scan
ad_scan1: .word scan1
ad_read: .word read
ad_str1: .word str1
ad_str2: .word str2
ad_str3: .word str3
ad_str4: .word str4
ad_return: .word return

.global printf
.global scanf
