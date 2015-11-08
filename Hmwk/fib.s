.data

.balign 4
m1: .asciz "Please enter a term in the sequence: "

.balign 4
m2: .asciz "The value is %d.\n"

.balign 4
scan: .asciz "%d"

.balign 4
read: .word 0

.text

fib:
	push	{r4, r6, lr}
	add	r6, sp, #8
	sub	sp, sp, #12

	str	r0, [r6, #-16]
	cmp	r0, #2
	bgt	loop

	mov	r0, #1
	bl	end
loop:
	ldr	r0, [r6, #-16]
	sub	r0, r0, #1
	bl	fib

	mov	r4, r0
	ldr	r0, [r6, #-16]
	sub	r0, r0, #2
	bl	fib

	add	r0, r4, r0
end:
	sub	sp, r6, #8
	pop	{r4, r6, pc}

.global	main
main:
	push	{r5, lr}
	mov	r5, sp
	sub	sp, sp, #8

	ldr	r0, ad_m1
	bl 	printf

	ldr	r0, ad_scan
	ldr	r1, ad_read
	bl	scanf
	ldr	r0, ad_read
	ldr	r0, [r0]
	bl	fib

	mov	r1, r0
	ldr	r0, ad_m2
	bl	printf

	mov	sp, r5
	pop	{r5, pc}

ad_m1: .word m1
ad_m2: .word m2
ad_scan: .word scan
ad_read: .word read

.global printf
.global scanf
