.data

.balign 4
message6: .asciz "%d\n"

.balign 4
number_read: .word 128

.text

.global main
main:
	mov r0, #0
        mov r6, #6
        cmp r6, #9
        ble loop1
loop1:
        ldr r2, = 0x1ccc
        mul r0, r2, r6
        lsr r0, #12
        add r0, r0, #32

	mov r2, r0 			/* r2 ← r0 */
	ldr r1, address_of_number_read 	/* r1 ← &number_read */
	mov r1, r0

        ldr r0, address_of_message6
        bl printf

        add r6, r6, #1
        cmp r6, #9
        ble loop1

        @ldr lr, address_of_return2
        @ldr lr, [r1]
        @bx lr
        @bal end
loopy:
	bal loopy
address_of_message6: .word message6
address_of_number_read: .word number_read
.global printf
