.data

message1: .asciz "Please enter a term in the sequence: "
message2: .asciz "The value is %d.\n"
format: .asciz "%d"
read: .word 0

.text

fib:
	push	{r4, r6, lr}
	add	r6, sp, #8
	sub	sp, sp, #12

	str	r0, [r6, #-16]
	cmp	r0, #2
	bgt	loop_stack

	mov	r0, #1
	bl	return_fib
loop_stack:
	ldr	r0, [r6, #-16]
	sub	r0, r0, #1
	bl	fib

	mov	r4, r0
	ldr	r0, [r6, #-16]
	sub	r0, r0, #2
	bl	fib

	add	r0, r4, r0
return_fib:
	sub	sp, r6, #8
	pop	{r4, r6, pc}

.global	main
main:
	push	{r5, lr}
	mov	r5, sp
	sub	sp, sp, #8

	ldr	r0, ad_message1
	bl 	printf

	ldr	r0, ad_format
	ldr	r1, ad_read
	bl	scanf
	ldr	r0, ad_read
	ldr	r0, [r0]
	bl	fib

	mov	r1, r0
	ldr	r0, ad_message2
	bl	printf

	mov	sp, r5
	pop	{r5, pc}

ad_message1: .word message1
ad_message2: .word message2
ad_format: .word format
ad_read: .word read

.global printf
.global scanf
