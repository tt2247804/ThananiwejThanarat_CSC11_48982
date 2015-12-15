.data

f8: .float 0.0
f9: .float 1.0
f10: .float 5.0
m1: .asciz "Tic-Tac-Toe\n"
m2: .asciz " ___ ___ ___\n"
m3: .asciz "| %c | %c | %c |\n"
m4: .asciz "|___|___|___|\n"
m5: .asciz "| %c | %c | %c |\n"
m6: .asciz "|___|___|___|\n"
m7: .asciz "| %c | %c | %c |\n"
m8: .asciz "|___|___|___|\n"
m9: .asciz "Player 1 = x\n"
m10: .asciz "Player 2 = o\n\n"
m11: .asciz "Please enter your move: "
m12: .asciz "Player %d wins!\n\n"
m13: .asciz "Invalid move!\n\n"
m14: .asciz "It is a draw!\n\n"
m15: .asciz "Best of 5\n"
m16: .asciz "Round %d\n"
m17: .asciz "Scoreboard\n"
m18: .asciz "----------------------\n"
m19: .asciz "Round %d: Draw\n"
m20: .asciz "Round %d: Player %d wins\n"
m21: .asciz "\nWin Rate\n"
m22: .asciz "----------------------\n"
m23: .asciz "Player 1 wins at the rate of %f\n"
m24: .asciz "Player 2 wins at the rate of %f\n"
m25: .asciz "Both players are even.\n"
scan: .asciz "%c"
scan1: .asciz "%d"
read: .word 0
str1: .word 0
str2: .word 0
str3: .word 0
str4: .word 0
str5: .word 0
.balign 4
a: .skip 20
return: .word 0

.text

drawXOBoard:
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

	ldr r0, ad_m1
        bl printf

        ldr r0, ad_m15
        bl printf

        ldr r0, ad_m9
        bl printf

        ldr r0, ad_m10
        bl printf

	mov r11, #0
        ldr r1, ad_str5
        str r11, [r1]
round:
	ldr r11, ad_str5
	ldr r11, [r11]
        cmp r11, #4
        bgt exit

	mov r11, #2
	ldr r1, ad_str3
	str r11, [r1]

	mov r11, #0
        ldr r1, ad_str4
        str r11, [r1]

	ldr r1, ad_str5
	ldr r1, [r1]
	add r1, r1, #1
	ldr r0, ad_m16
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
	ldr r2, ad_str3		 /*Turn*/
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
        ldr r3, ad_str3
        ldr r2, [r3]

	mov r2, #3
	str r2, [r3]

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
	ldr r2, ad_str3
	ldr r2, [r2]
	ldr r3, ad_a
	ldr r1, ad_str5
	ldr r1, [r1]
	mov r11, #4
	mul r1, r1, r11
	str r2, [r3, r1]


	ldr r1, ad_str5
	ldr r11, [r1]
	add r11, r11, #1
	str r11, [r1]
	bal round

exit:
	ldr r0, ad_m17
        bl printf

	ldr r0, ad_m18
        bl printf

	mov r4, #0
	ldr r8, ad_f8
	vldr s8, [r8]
	vldr s9, [r8]
	ldr r9, ad_f9
	vldr s10, [r9]
	ldr r10, ad_f10
	vldr s11, [r10]
	mov r8, #0
	mov r9, #0

table:
	mov r7, r4
	add r7, r7, #1
	mov r5, r4
	mov r6, #4
	mul r5, r5, r6

	ldr r3, ad_a
	ldr r3, [r3, r5]

	cmp r3, #3
	bne tableWin

	ldr r0, ad_m19
	mov r1, r7
        bl printf
	bal exit1

tableWin:
	mov r1, r7
	mov r2, r3

	cmp r2, #1
	bne win2
	add r8, r8, #1
	vadd.f32 s8, s8, s10
	bal printWin
win2:
	add r9, r9, #1
	vadd.f32 s9, s9, s10
printWin:
	ldr r0, ad_m20
        bl printf
exit1:
	add r4, r4, #1
	cmp r4, #5
	blt table

	ldr r0, ad_m21
        bl printf

	ldr r0, ad_m22
        bl printf

	cmp r8, r9
	bgt winRate1

	cmp r8, r9
	blt winRate2

	bal winRate3

winRate1:
	vdiv.f32 s12, s8, s11
	vcvt.f64.f32 d4, s12
	ldr r0, ad_m23
	vmov r2, r3, d4
        bl printf
	bal exitGame
winRate2:
	vdiv.f32 s13, s9, s11
        vcvt.f64.f32 d4, s13
        ldr r0, ad_m24
        vmov r2, r3, d4
        bl printf
	bal exitGame
winRate3:
	ldr r0, ad_m25
	bl printf
exitGame:
        ldr lr, ad_return
        ldr lr, [lr]
        bx lr

ad_f8: .word f8
ad_f9: .word f9
ad_f10: .word f10
ad_a: .word a
ad_m1: .word m1
ad_m9: .word m9
ad_m10: .word m10
ad_m11: .word m11
ad_m12: .word m12
ad_m13: .word m13
ad_m14: .word m14
ad_m15: .word m15
ad_m16: .word m16
ad_m17: .word m17
ad_m18: .word m18
ad_m19: .word m19
ad_m20: .word m20
ad_m21: .word m21
ad_m22: .word m22
ad_m23: .word m23
ad_m24: .word m24
ad_m25: .word m25
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
