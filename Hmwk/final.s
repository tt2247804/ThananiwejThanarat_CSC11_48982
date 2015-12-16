.data

.balign 4
fv: .skip 80
f8: .float 100.0
f9: .float 1.0
f10: .float 0.0
f11: .float 0.073
f12: .float 0.876
m1: .asciz "Menu\n"
m2: .asciz "Problem 1\n"
m3: .asciz "Problem 2\n"
m4: .asciz "Problem 3\n"
m5: .asciz "Problem 4\n"
m6: .asciz "Please select one of the problems: "
m7: .asciz "Guess the Number\n"
m8: .asciz "I have a number between 1 and 100.\n"
m9: .asciz "Can you guess my number?\n"
m10: .asciz "You will be given a maximum of 10 guesses.\n"
m11: .asciz "Please type your first guess.\n"
m12: .asciz "Too high. Try again.\n"
m13: .asciz "Too low. Try again.\n"
m14: .asciz "Congratulation, You guessed the number!\n"
m15: .asciz "Too many tries.\n"
m16: .asciz "Would you like to play again(y or n)?\n"
m17: .asciz "Thanks for playing.\n"
m18: .asciz "Calculate the Future Value\n"
m19: .asciz "Please enter the number of years(1-20): "
m20: .asciz "Please enter the interest rate(5-10%): "
m21: .asciz "Please enter the present value($1000-$5000): "
m22: .asciz "The Future Value for year 1 to %d\n"
m23: .asciz "%f\n"
m24: .asciz "Calculate the quadratic equation\n"
m25: .asciz "ax^2+bx\n"
m26: .asciz "a = 0.073 and b = 0.876\n"
m27: .asciz "Please enter the value of x(0-255): "
m28: .asciz "The result = %d\n"
m29: .asciz "The result = %f\n"
scan: .asciz "%d"
scan1: .asciz "%c"
read: .word 0
read1: .word 0
return: .word 0

.text

problem1:
	mov r0, #0
	bl time
	bl srand

	bl rand
	mov r1, r0, ASR #1
	mov r2, #1000
mod:
	subs r1, r1, r2
	cmp r1, r2
	bge mod

	add r1, #1
	mov r6, r1

	ldr r0, ad_m7
	bl printf

	ldr r0, ad_m8
        bl printf

	ldr r0, ad_m9
        bl printf

	ldr r0, ad_m10
        bl printf

	ldr r0, ad_m11
        bl printf

	mov r4, #0
input:
	add r4, r4, #1

	ldr r0, ad_scan
        ldr r1, ad_read
        bl scanf

	cmp r4, #10
        bgt tooMany

        ldr r0, ad_read
        ldr r0, [r0]

	cmp r0, r6
	bgt high

	cmp r0, r6
	blt low

	cmp r0, r6
	beq equal

high:
	ldr r0, ad_m12
        bl printf

	bal input
low:
	ldr r0, ad_m13
        bl printf

	bal input
equal:
	ldr r0, ad_m14
        bl printf

	bal replay
tooMany:
	ldr r0, ad_m15
        bl printf
replay:
	ldr r0, ad_m16
        bl printf
newLine:
	ldr r0, ad_scan1
        ldr r1, ad_read1
        bl scanf

        ldr r0, ad_read1
        ldr r0, [r0]

	cmp r0, #10
	beq newLine

	cmp r0, #121
	beq problem1

	ldr r0, ad_m17
        bl printf

	bal exit

ad_m7: .word m7
ad_m8: .word m8
ad_m9: .word m9
ad_m10: .word m10
ad_m11: .word m11
ad_m12: .word m12
ad_m13: .word m13
ad_m14: .word m14
ad_m15: .word m15
ad_m16: .word m16
ad_m17: .word m17
ad_scan1: .word scan1
ad_read1: .word read1

problem2:
	ldr r0, ad_m18
        bl printf

	ldr r0, ad_m19
        bl printf

	ldr r0, ad_scan
        ldr r1, ad_read
        bl scanf

        ldr r0, ad_read
        ldr r0, [r0]
	mov r4, r0		/*years*/

	ldr r0, ad_m20
        bl printf

	ldr r0, ad_scan
        ldr r1, ad_read
        bl scanf

        ldr r0, ad_read
        ldr r0, [r0]
	mov r5, r0		/*rate*/

	ldr r0, ad_m21
        bl printf

	ldr r0, ad_scan
        ldr r1, ad_read
        bl scanf

        ldr r0, ad_read
        ldr r0, [r0]
	mov r6, r0		/*pv*/

	vmov s0, r5
	vcvt.f32.s32 s8, s0
	ldr r0, ad_f8
	vldr s9, [r0]

	vdiv.f32 s10, s8, s9	/*i*/

	ldr r0, ad_m22
	mov r1, r4
        bl printf

	ldr r8, ad_fv

	vmov s0, r6
        vcvt.f32.s32 s14, s0	/*float pv*/

	mov r7, #0		/*n*/
p2out:
	cmp r7, r4
	blt p2loop
	bal exit
p2loop:
	ldr r0, ad_f9
	vldr s11, [r0]
	vadd.f32 s12, s11, s10	/*i+1*/

	add r11, r7, #1		/*n+1*/

	mov r5, #2
	vmov s13, s12
power:
	cmp r5, r11
	bgt assign

	vmul.f32 s13, s13, s12
	add r5, r5, #1
	bal power

assign:
	vmul.f32 s13, s13, s14
	mov r9, #4
	mul r10, r7, r9
	vstr s13, [r8, r10]

	vcvt.f64.f32 d0, s13
	ldr r0, ad_m23
	vmov r2, r3, d0
	bl printf

	add r7, r7, #1
	bal p2out

ad_m18: .word m18
ad_m19: .word m19
ad_m20: .word m20
ad_m21: .word m21
ad_m22: .word m22
ad_m23: .word m23
ad_fv: .word fv
ad_f8: .word f8
ad_f9: .word f9

problem3:
	ldr r4, =0x000012B0
	ldr r5, =0x0000E042

	ldr r0, ad_m24
        bl printf

	ldr r0, ad_m25
        bl printf

	ldr r0, ad_m26
        bl printf

	ldr r0, ad_m27
        bl printf

	ldr r0, ad_scan
        ldr r1, ad_read
        bl scanf

        ldr r0, ad_read
        ldr r0, [r0]

	mov r6, r0
	mul r7, r6, r6
	mul r8, r4, r7
	mul r9, r5, r6

	add r1, r8, r9
	lsr r1, #16

	ldr r0, ad_m28
        bl printf

	bal exit

ad_m24: .word m24
ad_m25: .word m25
ad_m26: .word m26
ad_m27: .word m27
ad_m28: .word m28

problem4:
	ldr r0, ad_f11
	vldr s8, [r0]
	ldr r0, ad_f12
	vldr s9, [r0]

	ldr r0, ad_m24
        bl printf

        ldr r0, ad_m25
        bl printf

        ldr r0, ad_m26
        bl printf

        ldr r0, ad_m27
        bl printf

        ldr r0, ad_scan
        ldr r1, ad_read
        bl scanf

        ldr r0, ad_read
        ldr r0, [r0]

	mov r4, r0
	vmov s0, r4
        vcvt.f32.s32 s10, s0
	vmul.f32 s11, s10, s10
	vmul.f32 s12, s8, s11
	vmul.f32 s13, s9, s10

	vadd.f32 s14, s12, s13

	vcvt.f64.f32 d0, s14
        ldr r0, ad_m29
        vmov r2, r3, d0
        bl printf

	bal exit

ad_f11: .word f11
ad_f12: .word f12
ad_m29: .word m29

.global main, exit
main:
	ldr r1, ad_return
	str lr, [r1]

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
rein:
	ldr r0, ad_m6
        bl printf

	ldr r0, ad_scan
	ldr r1, ad_read
	bl scanf

	ldr r0, ad_read
	ldr r0, [r0]

	cmp r0, #1
	beq problem1

	cmp r0, #2
	beq problem2

	cmp r0, #3
	beq problem3

	cmp r0, #4
        beq problem4

	bal rein
exit:
	ldr lr, ad_return
	ldr lr, [lr]
	bx lr

ad_m1: .word m1
ad_m2: .word m2
ad_m3: .word m3
ad_m4: .word m4
ad_m5: .word m5
ad_m6: .word m6
ad_scan: .word scan
ad_read: .word read
ad_return: .word return

.global printf
.global scanf
.global time
.global srand
.global rand
