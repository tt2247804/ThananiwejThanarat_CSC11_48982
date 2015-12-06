.data

f8: .float 0.14

f9: .float 0.10125

f10: .float 0.5

f11: .float 0.0023679

f12: .float 3.1415927

f13: .float 8.0

f14: .float 2.0

f15: .float 0.5

f16: .float 0.000001

m1: .asciz "Terminal Velocity is %f ft/sec.\n"

m2: .asciz "Dynamic Pressure is %f lb/ft^2.\n"

m3: .asciz "Timing is %d loops.\n"

return: .word 0

.text

.global main
main:
        ldr r1, ad_return
        str lr, [r1]

	ldr r1, ad_f8
	vldr s8, [r1]

	ldr r2, ad_f9
	vldr s9, [r2]

	ldr r3, ad_f10
	vldr s10, [r3]

	ldr r4, ad_f11
	vldr s11, [r4]

	ldr r5, ad_f12
	vldr s12, [r5]

	ldr r6, ad_f13
	vldr s30, [r6]

	vmul.f32 s16, s9, s30
	vmul.f32 s17, s12, s11
	vmul.f32 s17, s17, s8
	vmul.f32 s17, s17, s8
	vmul.f32 s17, s17, s10

	vdiv.f32 s15, s16, s17

	/* BABYLONIAN SQRT */
	ldr r7, ad_f14
	vldr s29, [r7]

	ldr r8, ad_f15
	vldr s28, [r8]

	ldr r9, ad_f16
	vldr s27, [r9]

	vdiv.f32 s18, s15, s29
	vmov s19, s18

	mov r4, #0
babylonian:
	vmov s18, s19
	vdiv.f32 s19, s15, s18
	vadd.f32 s19, s19, s18
	vmul.f32 s19, s19, s28
	vadd.f32 s21, s19, s27

	vcmp.f32 S21, S18
	vmrs APSR_nzcv, FPSCR
	bge break
	add r4, r4, #1
	bal babylonian

break:
	vmov s13, s18
	vmul.f32 s14, s11, s13
	vmul.f32 s14, s14, s13
	vdiv.f32 s14, s14, s29

	vcvt.f64.f32 d4, s13
	ldr r0, ad_m1
	vmov r2, r3, d4
	bl printf

	vcvt.f64.f32 d4, s14
	ldr r0, ad_m2
	vmov r2, r3, d4
	bl printf

	ldr r0, ad_m3
	mov r1, r4
	bl printf

        ldr lr, ad_return
        ldr lr, [lr]
        bx lr
ad_f8: .word f8
ad_f9: .word f9
ad_f10: .word f10
ad_f11: .word f11
ad_f12: .word f12
ad_f13: .word f13
ad_f14: .word f14
ad_f15: .word f15
ad_f16: .word f16
ad_m1: .word m1
ad_m2: .word m2
ad_m3: .word m3
ad_return: .word return

.global printf
