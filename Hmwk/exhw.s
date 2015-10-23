.data

.balign 4
message1: .asciz "Input beginning and end of temperature range\n"

.balign 4
message2: .asciz "If range is degree Centigrade input 1\n"

.balign 4
message3: .asciz "If range is degree Fahrenheit input 2\n"

.balign 4
message4: .asciz "Display Degree Centigrade to Degree Fahrenheit\n"

.balign 4
message5: .asciz "Fahrenheit Centigrade\n"

.balign 4
message6: .asciz "%d\n"

.balign 4
scan_pattern1: .asciz "%d"

.balign 4
scan_pattern2: .asciz "%d"

.balign 4
scan_pattern3: .asciz "%d"

.balign 4
number_read1: .word 0

.balign 4
number_read2: .word 0

.balign 4
number_read3: .word 0

.balign 4
number_read4: .word 128

.balign 4
number_read5: .word 128

.balign 4
return1: .word 0

.balign 4
return2: .word 0

.text

problem1:
	@ldr r1, address_of_return2
	@str lr, [r1]

	ldr r0, address_of_message4
	bl printf

	ldr r0, address_of_message5
	bl printf

	mov r0, #0
	mov r6, r4
	cmp r6, r5
	ble loop1
loop1:
	ldr r2, = 0x1ccc
	mul r0, r2, r6
	lsr r0, #12
	add r0, r0, #32

	mov r2, r0
        ldr r1, address_of_number_read4
        mov r1, r0

	ldr r0, address_of_message6
	bl printf

	add r6, r6, #1
	cmp r6, r5
	ble loop1

	@ldr lr, address_of_return2
	@ldr lr, [r1]
	@bx lr
	bal end

address_of_message4: .word message4
address_of_message5: .word message5
address_of_message6: .word message6
address_of_return2: .word return2
address_of_number_read4: .word number_read4

problem2:
        @ldr r1, address_of_return2
        @str lr, [r1]

        ldr r0, address_of_message4
        bl printf

        ldr r0, address_of_message5
        bl printf

        mov r0, #0
        mov r6, r4
        cmp r6, r5
        ble loop2
loop2:
	mov r6, r4
        ldr r2, = 0x83E9
	sub r6, #32
        mul r0, r2, r6
        lsr r0, #16

        mov r2, r0
        ldr r1, address_of_number_read5
        mov r1, r0

        ldr r0, address_of_message6
        bl printf

        add r4, r4, #1
        cmp r4, r5
        ble loop2

        @ldr lr, address_of_return2
        @ldr lr, [r1]
        @bx lr
        bal end

@address_of_message4: .word message4
@address_of_message5: .word message5
@address_of_message6: .word message6
@address_of_return2: .word return2
address_of_number_read5: .word number_read5


.global main, end
main:
	ldr r1, address_of_return1
	str lr, [r1]
rein:
	ldr r0, address_of_message1
	bl printf

	ldr r0, address_of_scan_pattern1
	ldr r1, address_of_number_read1
	bl scanf
	ldr r0, address_of_number_read1
	ldr r0, [r0]
	mov r4, r0

	ldr r0, address_of_scan_pattern2
	ldr r1, address_of_number_read2
	bl scanf
	ldr r0, address_of_number_read2
	ldr r0, [r0]
	mov r5, r0

	ldr r0, address_of_message2
	bl printf

	ldr r0, address_of_message3
	bl printf

	ldr r0, address_of_scan_pattern3
	ldr r1, address_of_number_read3
	bl scanf

	ldr r0, address_of_number_read3
	ldr r1, [r0]

	cmp r1, #1
	beq problem1

	cmp r1, #2
	beq problem2

	bal rein
end:
	ldr lr, address_of_return1
	ldr lr, [lr]
	bx lr

address_of_message1: .word message1
address_of_message2: .word message2
address_of_message3: .word message3
address_of_scan_pattern1: .word scan_pattern1
address_of_scan_pattern2: .word scan_pattern2
address_of_scan_pattern3: .word scan_pattern3
address_of_number_read1: .word number_read1
address_of_number_read2: .word number_read2
address_of_number_read3: .word number_read3
address_of_return1: .word return1

.global printf
.global scanf
