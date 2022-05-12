	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"lab5Lib.c"
	.text
	.align	2
	.global	setPixel3
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	setPixel4
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	add	r3, r0, r0, lsr #31
	ldr	lr, .L9
	rsb	ip, r1, r1, lsl #4
	asr	r1, r3, #1
	add	r1, r1, ip, lsl #3
	ldr	ip, [lr]
	lsl	r1, r1, #1
	ldrh	r3, [ip, r1]
	tst	r0, #1
	andne	r3, r3, #255
	biceq	r3, r3, #255
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r1]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	ip, r3, #0
	bxle	lr
	push	{r4, r5, lr}
	mov	lr, #0
	ldr	r5, .L20
	add	ip, r1, ip
	ldr	r3, [r5]
	rsb	r1, r1, r1, lsl #4
	rsb	ip, ip, ip, lsl #4
	add	r4, r0, r1, lsl #4
	add	ip, r0, ip, lsl #4
	ldr	r1, [r5, #4]
	orr	r0, r2, #-2130706432
	add	r2, r3, ip, lsl #1
	add	r3, r3, r4, lsl #1
.L13:
	add	ip, sp, #12
	str	lr, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r2
	str	r0, [r1, #44]
	bne	.L13
	pop	{r4, r5, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #36
	ldrb	lr, [sp, #72]	@ zero_extendqisi2
	ldrb	ip, [sp, #72]	@ zero_extendqisi2
	subs	fp, r3, #0
	orr	ip, ip, lr, lsl #8
	strh	ip, [sp, #30]	@ movhi
	ble	.L22
	mov	ip, #0
	sub	r8, r2, #1
	add	r8, r8, r0
	ldr	lr, .L43
	add	r5, r8, r8, lsr #31
	rsb	r1, r1, r1, lsl #4
	add	r7, r0, #1
	asr	r6, r5, #1
	lsl	r3, r1, #3
	add	r7, r7, r7, lsr #31
	ldr	r1, [lr]
	add	r4, r0, r0, lsr #31
	add	r3, r3, r5, asr #1
	rsb	r7, r6, r7, asr #1
	asr	r9, r2, #1
	rsb	r5, r6, r6, lsl #31
	add	r3, r1, r3, lsl #1
	rsb	r6, r6, r4, asr #1
	lsl	r1, r7, #1
	ldr	lr, [lr, #4]
	sub	r10, r9, #1
	str	r1, [sp, #12]
	lsl	r1, r6, #1
	str	r1, [sp, #8]
	orr	r1, r10, #-2130706432
	str	lr, [sp, #20]
	str	r1, [sp, #16]
	cmp	r2, ip
	orr	r1, r9, #-2130706432
	and	lr, r2, #1
	str	r1, [sp, #4]
	and	r8, r8, #1
	ldr	r1, [sp, #20]
	lsl	r5, r5, #1
	bic	r4, r4, #1
	and	r0, r0, #1
	rsblt	lr, lr, #0
	add	r10, sp, #30
	b	.L35
.L41:
	cmp	r2, #1
	ble	.L25
	ldr	r6, [sp, #8]
	add	r6, r3, r6
	str	r0, [r1, #44]
	str	r10, [r1, #36]
	str	r6, [r1, #40]
	ldr	r6, [sp, #4]
	str	r6, [r1, #44]
.L25:
	cmp	lr, #1
	beq	.L33
.L27:
	add	ip, ip, #1
	cmp	fp, ip
	add	r3, r3, #240
	beq	.L22
.L35:
	cmp	r0, #0
	beq	.L41
	add	r7, r3, r5
	ldrb	r6, [r7, r4]	@ zero_extendqisi2
	ldrb	r9, [sp, #72]	@ zero_extendqisi2
	cmp	lr, #1
	orr	r6, r6, r9, lsl #8
	strh	r6, [r7, r4]	@ movhi
	beq	.L42
	cmp	r2, #2
	ble	.L33
	mov	r7, #0
	ldr	r6, [sp, #12]
	add	r6, r3, r6
	str	r7, [r1, #44]
	str	r10, [r1, #36]
	str	r6, [r1, #40]
	ldr	r6, [sp, #16]
	str	r6, [r1, #44]
.L33:
	ldrh	r6, [r3]
	ldrb	r7, [sp, #72]	@ zero_extendqisi2
	cmp	r8, #0
	andne	r6, r6, #255
	biceq	r6, r6, #255
	and	r7, r7, #255
	add	ip, ip, #1
	orrne	r6, r6, r7, lsl #8
	orreq	r6, r6, r7
	cmp	fp, ip
	strh	r6, [r3]	@ movhi
	add	r3, r3, #240
	bne	.L35
.L22:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L42:
	cmp	r2, #1
	ble	.L27
	mov	r7, #0
	ldr	r6, [sp, #12]
	add	r6, r3, r6
	str	r7, [r1, #44]
	str	r10, [r1, #36]
	str	r6, [r1, #40]
	ldr	r6, [sp, #4]
	str	r6, [r1, #44]
	b	.L27
.L44:
	.align	2
.L43:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	strh	r0, [sp, #6]	@ movhi
	ldr	r2, .L47
	ldrh	lr, [sp, #6]
	ldm	r2, {r1, r3}
	ldr	r2, .L47+4
	add	r0, sp, #14
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L48:
	.align	2
.L47:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldr	r1, .L51
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	ldm	r1, {r0, r3}
	ldr	r1, .L51+4
	orr	r2, r2, ip, lsl #8
	add	ip, sp, #14
	strh	r2, [sp, #14]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L52:
	.align	2
.L51:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	subs	lr, r3, #0
	ble	.L53
	mov	r4, #0
	ldr	r6, .L59
	add	lr, r1, lr
	ldr	r3, [r6]
	rsb	r1, r1, r1, lsl #4
	rsb	lr, lr, lr, lsl #4
	add	r5, r0, r1, lsl #4
	add	lr, r0, lr, lsl #4
	ldr	ip, [sp, #16]
	ldr	r1, [r6, #4]
	add	r0, r3, lr, lsl #1
	orr	lr, r2, #-2147483648
	add	r3, r3, r5, lsl #1
	lsl	r2, r2, #1
.L55:
	str	r4, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r0
	str	lr, [r1, #44]
	add	ip, ip, r2
	bne	.L55
.L53:
	pop	{r4, r5, r6, lr}
	bx	lr
.L60:
	.align	2
.L59:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	bxle	lr
	push	{r4, r5, r6, r7, lr}
	mov	r4, #0
	ldr	r7, .L69
	add	r2, r2, r2, lsr #31
	add	r3, r1, r3
	asr	lr, r2, #1
	rsb	r5, r1, r1, lsl #4
	rsb	r3, r3, r3, lsl #4
	ldr	ip, [sp, #20]
	ldr	r6, [r7]
	ldr	r2, [r7, #4]
	add	r1, r0, r3, lsl #4
	add	r0, r0, r5, lsl #4
	orr	r5, lr, #-2147483648
	lsl	lr, lr, #1
.L63:
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	add	r0, r0, #240
	add	r3, r6, r3
	cmp	r0, r1
	str	r4, [r2, #44]
	str	ip, [r2, #36]
	str	r3, [r2, #40]
	add	ip, ip, lr
	str	r5, [r2, #44]
	bne	.L63
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L70:
	.align	2
.L69:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage3, %function
drawFullscreenImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L72
	ldr	r1, .L72+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L73:
	.align	2
.L72:
	.word	.LANCHOR0
	.word	-2147445248
	.size	drawFullscreenImage3, .-drawFullscreenImage3
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L75
	ldr	r1, .L75+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L76:
	.align	2
.L75:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L78:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L78
	mov	r2, #67108864
.L79:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L79
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	ldrh	r3, [r1]
	tst	r3, #16
	ldr	r2, .L86
	moveq	r2, #100663296
	ldr	r0, .L86+4
	eor	r3, r3, #16
	str	r2, [r0]
	strh	r3, [r1]	@ movhi
	bx	lr
.L87:
	.align	2
.L86:
	.word	100704256
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L90
	ldr	lr, [ip, #4]
	add	r0, r0, r0, lsl #1
	add	ip, lr, r0, lsl #2
	orr	r3, r3, #-2147483648
	lsl	r0, r0, #2
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L91:
	.align	2
.L90:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	sub	ip, ip, #1
	cmp	ip, r1
	ble	.L96
	add	r1, r1, r3
	sub	r1, r1, #1
	cmp	r1, lr
	bgt	.L98
.L96:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L98:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	sub	r3, r3, #1
	cmp	r3, r0
	ble	.L96
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 53) 9.1.0"
