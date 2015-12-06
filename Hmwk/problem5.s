.data

m1: .asciz "Terminal Velocity is %d ft/sec.\n"

m2: .asciz "Dynamic Pressure is %d lb/ft^2.\n"

m3: .asciz "Timing is %d loops.\n"

return: .word 0

.text

.global main
main:
	ldr r1, ad_return
	str lr, [r1]

	ldr r4, =0x23D7
	ldr r5, =0x19EB
	ldr r6, =0x8
	ldr r7, =0x9B3
	ldr r8, =0x32
	mov r9, #8

	mul r1, r8, r7
	lsr r1, #10
	mul r2, r4, r4
	lsr r2, #20
	mul r2, r2, r6
	lsr r2, #4
	mul r3, r9, r5
	lsl r3, #6

	mul r2, r1, r2

	mov r0, #0
timing:
	sub r3, r3, r2
	add r0, r0, #1
	cmp r3, r2
	bge timing

	lsl r0, #4

	mov r1, r0
	lsr r1, #1
	mov r2, r1
	mov r3, #0

babylonian:
	mov r1, r2
	mov r9, #0
	mov r10, r0
loop:
	sub r10, r10, r1
	add r9, r9, #1
	cmp r10, r1
	bge loop

	add r2, r1, r9
	lsr r2, #1
	add r4, r2, #1
	cmp r4, r1
	bge break
	add r3, r3, #1
	bal babylonian

break:
	mul r0, r7, r1
	mul r0, r0, r1
	lsr r0, #21
	mov r4, r0
	mov r5, r1
	mov r6, r3

	ldr r0, ad_m1
	mov r1, r5
	bl printf

	ldr r0, ad_m2
	mov r1, r4
	bl printf

	ldr r0, ad_m3
	mov r1, r6
	bl printf

	ldr lr, ad_return
	ldr lr, [lr]
	bx lr
ad_m1: .word m1
ad_m2: .word m2
ad_m3: .word m3
ad_return: .word return

.global printf
