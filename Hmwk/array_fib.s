.data

.balign 4
a: .skip 180

.balign 4
m1: .asciz "Generating the Fibonacci sequence...\n"

.balign 4
m2: .asciz "Please enter a term in the sequence: "

.balign 4
m3: .asciz "Term is starting at 1.\n"

.balign 4
m4: .asciz "%d\n"

.balign 4
scan: .asciz "%d"

.balign 4
read: .word 0

.balign 4
return: .word 0

.text

.global main
main:
	ldr r1, ad_return
	str lr, [r1]

	ldr r6, ad_a
	mov r7, #4
	mov r8, #0
	mov r2, #1
	str r2, [r6]

	ldr r0, ad_m1
        bl printf

	ldr r0, ad_m2
        bl printf

	ldr r0, ad_scan
        ldr r1, ad_read
        bl scanf

        ldr r0, ad_read
        ldr r0, [r0]

	cmp r0, #45
	bgt error

	cmp r0, #1
	beq first

        mov r4, r0
	cmp r4, #0
	ble validation
	bal init
validation:
	ldr r0, ad_m3
        bl printf
	bal end
init:
	mov r1, #0
	mov r2, #1
	mov r3, #2
	cmp r3, r4
	ble loop
loop:
	add r5, r1, r2
	mov r1, r2
	mov r2, r5

	str r2, [r6, r7]
	add r7, r7, #4

	add r3, r3, #1
	cmp r3, r4
	ble loop
output:
	ldr r1, [r6, r8]
	add r8, r8, #4

	@mov r1, r4
	@mov r1, r2
	ldr r0, ad_m4
        bl printf
	cmp r8, r7
	blt output
	bal end
first:
	mov r1, #1
	ldr r0, ad_m4
        bl printf
	bal end
error:
	mov r1, #0
	ldr r0, ad_m4
        bl printf

end:
	ldr lr, ad_return
	ldr lr, [lr]
	bx lr

ad_m1: .word m1
ad_m2: .word m2
ad_m3: .word m3
ad_m4: .word m4
ad_a: .word a
ad_scan: .word scan
ad_read: .word read
ad_return: .word return

.global printf
.global scanf
