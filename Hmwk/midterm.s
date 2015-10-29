.data

.balign 4
m1: .asciz "Menu\n"

.balign 4
m2: .asciz "Problem 1\n"

.balign 4
m3: .asciz "Problem 2\n"

.balign 4
m4: .asciz "Problem 3\n"

.balign 4
m5: .asciz "Please select one of the problems:"

.balign 4
m6: .asciz "Please enter the total hours worked:"

.balign 4
m7: .asciz "Please enter the rate of pay:"

.balign 4
m8: .asciz "Hours cannot be less than 1.\n"

.balign 4
m9: .asciz "The gross pay is $%d.\n"

.balign 4
m10: .asciz "Only 60 hours maxinum per week.\n"

.balign 4
m11: .asciz "Please enter the preferred package:"

.balign 4
m12: .asciz "Please enter the hours:"

.balign 4
m13: .asciz "The monthly charge is $%d.\n"

.balign 4
m14: .asciz "Please select package a, b, or c.\n"

.balign 4
m15: .asciz "Generating the Fibonacci sequence...\n"

.balign 4
m16: .asciz "Please enter a term in the sequence:"

.balign 4
m17: .asciz "Term is starting at 1.\n"

.balign 4
m18: .asciz "The value in term %d is %d.\n"

.balign 4
scan: .asciz "%d"

.balign 4
scan1: .asciz "%c"

.balign 4
read: .word 0

.balign 4
return: .word 0

.text

problem1:
	ldr r0, ad_m6
	bl printf

	ldr r0, ad_scan
        ldr r1, ad_read
        bl scanf
        ldr r0, ad_read
        ldr r0, [r0]
	mov r4, r0

	ldr r0, ad_m7
        bl printf

	ldr r0, ad_scan
        ldr r1, ad_read
        bl scanf
        ldr r0, ad_read
        ldr r0, [r0]
	mov r5, r0

	cmp r4, #0
	ble case1_1

	cmp r4, #40
	ble case2_1

	cmp r4, #50
	ble case3_1

	cmp r4, #60
	ble case4_1

	bal case5_1

case1_1:
	ldr r0, ad_m8
        bl printf
	bal end

case2_1:
	mul r1, r4, r5
	ldr r0, ad_m9
        bl printf
        bal end

case3_1:
	sub r1, r4, #40
	mul r1, r1, r5
	mov r2, #2
	mul r1, r1, r2
	mov r2, #40
	mul r2, r2, r5
	add r1, r1, r2
	ldr r0, ad_m9
        bl printf
	bal end

case4_1:
	sub r1, r4, #50
        mul r1, r1, r5
        mov r2, #3
        mul r1, r1, r2
	mov r2, #20
	mul r2, r2, r5
        mov r3, #40
        mul r3, r3, r5
        add r1, r1, r2
	add r1, r1, r3
        ldr r0, ad_m9
        bl printf
        bal end

case5_1:
	ldr r0, ad_m10
        bl printf
        bal end

ad_m6: .word m6
ad_m7: .word m7
ad_m8: .word m8
ad_m9: .word m9
ad_m10: .word m10

problem2:
	ldr r0, ad_m11
        bl printf

	ldr r0, ad_scan1
        ldr r1, ad_read
        bl scanf
        ldr r0, ad_read
        ldr r0, [r0]
	mov r4, r0

	ldr r0, ad_scan1
        ldr r1, ad_read
        bl scanf
        ldr r0, ad_read
        ldr r0, [r0]
        mov r4, r0

	ldr r0, ad_m12
        bl printf

	ldr r0, ad_scan
        ldr r1, ad_read
        bl scanf
        ldr r0, ad_read
        ldr r0, [r0]
	mov r5, r0

	cmp r4, #97
	beq caseA

	cmp r4, #98
	beq caseB

	cmp r4, #99
	beq caseC

	bal others

caseA:
	cmp r5, #0
        ble caseA_1

	cmp r5, #11
        ble caseA_2

	cmp r5, #22
        ble caseA_3

	bal A
caseA_1:
	ldr r0, ad_m8
        bl printf
	bal end
caseA_2:
	mov r1, #30
	ldr r0, ad_m13
        bl printf
	bal end
caseA_3:
	sub r3, r5, #11
	mov r2, #3
	mul r1, r2, r3
	add r1, r1, #30
	ldr r0, ad_m13
        bl printf
        bal end
A:
	sub r3, r5, #22
        mov r2, #6
        mul r1, r2, r3
        add r1, r1, #63
        ldr r0, ad_m13
        bl printf
        bal end

caseB:
        cmp r5, #0
        ble caseB_1

        cmp r5, #22
        ble caseB_2

        cmp r5, #44
        ble caseB_3

        bal B
caseB_1:
        ldr r0, ad_m8
        bl printf
        bal end
caseB_2:
        mov r1, #35
        ldr r0, ad_m13
        bl printf
        bal end
caseB_3:
        sub r3, r5, #22
        mov r2, #2
        mul r1, r2, r3
        add r1, r1, #35
        ldr r0, ad_m13
        bl printf
        bal end
B:
        sub r3, r5, #44
        mov r2, #4
        mul r1, r2, r3
        add r1, r1, #79
        ldr r0, ad_m13
        bl printf
        bal end

caseC:
        cmp r5, #0
        ble caseC_1

        cmp r5, #33
        ble caseC_2

        cmp r5, #66
        ble caseC_3

        bal C
caseC_1:
        ldr r0, ad_m8
        bl printf
        bal end
caseC_2:
        mov r1, #40
        ldr r0, ad_m13
        bl printf
        bal end
caseC_3:
        sub r3, r5, #33
        mov r2, #1
        mul r1, r2, r3
        add r1, r1, #40
        ldr r0, ad_m13
        bl printf
        bal end
C:
        sub r3, r5, #66
        mov r2, #2
        mul r1, r2, r3
        add r1, r1, #73
        ldr r0, ad_m13
        bl printf
        bal end

others:
	ldr r0, ad_m14
        bl printf
	bal end

ad_m11: .word m11
ad_m12: .word m12
ad_m13: .word m13
ad_m14: .word m14
ad_scan1: .word scan1

problem3:
	ldr r0, ad_m15
        bl printf

	ldr r0, ad_m16
        bl printf

	ldr r0, ad_scan
        ldr r1, ad_read
        bl scanf
        ldr r0, ad_read
        ldr r0, [r0]
        mov r4, r0

	cmp r4, #0
	ble case1_3

	bal case2_3

case1_3:
	ldr r0, ad_m17
        bl printf
	bal end

case2_3:
	mov r1, #0
	mov r2, #1
	mov r3, #2
	cmp r3, r4
	ble loop
loop:
	add r5, r1, r2
	mov r1, r2
	mov r2, r5
	add r3, r3, #1
	cmp r3, r4
	ble loop
	mov r1, r4
	ldr r0, ad_m18
        bl printf
	bal end

ad_m15: .word m15
ad_m16: .word m16
ad_m17: .word m17
ad_m18: .word m18

.global main, end
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
rein:
	ldr r0, ad_m5
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

	bal rein
end:
	ldr lr, ad_return
	ldr lr, [lr]
	bx lr

ad_m1: .word m1
ad_m2: .word m2
ad_m3: .word m3
ad_m4: .word m4
ad_m5: .word m5
ad_scan: .word scan
ad_read: .word read
ad_return: .word return

.global printf
.global scanf
