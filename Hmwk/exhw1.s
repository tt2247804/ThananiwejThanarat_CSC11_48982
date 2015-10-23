

.balign 4
message4: .asciz "Display Degree Centigrade to Degree Fahrenheit\n"

.balign 4
message5: .asciz "Fahrenheit Centigrade\n"

.balign 4
message6: .asciz "%d\n"

.balign 4
number_read4: .word 128

.balign 4
return2: .word 0

.text

.global problem1
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

.global printf
