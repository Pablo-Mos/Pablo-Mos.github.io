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
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	push	{r4, lr}
	ldr	r1, .L4
	ldr	r3, .L4+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	initializeKitties
	.size	initialize, .-initialize
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L15
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L15+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	ldr	r3, .L15+8
	push	{r4, lr}
	ldm	r3, {r0, r1}
	ldr	ip, [r3, #32]
	add	r2, r3, #32
	ldrh	r4, [r3, #36]
	stm	r2, {r0, r1}
	add	r0, r3, #8
	ldm	r0, {r0, r1}
	ldr	lr, [r3, #24]
	str	ip, [r3]
	ldrh	ip, [r3, #28]
	add	r2, r3, #24
	strh	r4, [r3, #4]	@ movhi
	str	lr, [r3, #8]
	stm	r2, {r0, r1}
	strh	ip, [r3, #12]	@ movhi
	pop	{r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	oldButtons
	.word	buttons
	.word	kitties
	.size	updateGame, .-updateGame
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L20
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L20+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r5, .L20+8
	ldr	fp, .L20+12
	ldr	r10, .L20+16
	ldr	r4, .L20+20
	add	r9, r5, #8
	add	r8, r5, #16
	add	r7, r5, #24
	add	r6, r5, #32
.L18:
	ldrh	r3, [r10]
	strh	r3, [fp]	@ movhi
	ldr	r3, .L20+24
	ldrh	r3, [r3, #48]
	strh	r3, [r10]	@ movhi
	ldr	r3, .L20+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+32
	mov	lr, pc
	bx	r3
	mov	r0, r5
	mov	r1, #0
	mov	lr, pc
	bx	r4
	mov	r0, r9
	mov	r1, #1
	mov	lr, pc
	bx	r4
	mov	r0, r8
	mov	r1, #2
	mov	lr, pc
	bx	r4
	mov	r0, r7
	mov	r1, #3
	mov	lr, pc
	bx	r4
	mov	r1, #4
	mov	r0, r6
	mov	lr, pc
	bx	r4
	b	.L18
.L21:
	.align	2
.L20:
	.word	1027
	.word	initializeKitties
	.word	kitties
	.word	oldButtons
	.word	buttons
	.word	drawKitty
	.word	67109120
	.word	updateGame
	.word	waitForVBlank
	.size	main, .-main
	.text
	.align	2
	.global	reverseKitties
	.syntax unified
	.arm
	.fpu softvfp
	.type	reverseKitties, %function
reverseKitties:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L24
	push	{r4, lr}
	ldm	r3, {r0, r1}
	ldr	ip, [r3, #32]
	add	r2, r3, #32
	ldrh	r4, [r3, #36]
	stm	r2, {r0, r1}
	add	r0, r3, #8
	ldm	r0, {r0, r1}
	ldr	lr, [r3, #24]
	str	ip, [r3]
	ldrh	ip, [r3, #28]
	add	r2, r3, #24
	strh	r4, [r3, #4]	@ movhi
	str	lr, [r3, #8]
	stm	r2, {r0, r1}
	strh	ip, [r3, #12]	@ movhi
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	kitties
	.size	reverseKitties, .-reverseKitties
	.align	2
	.global	swapKitties
	.syntax unified
	.arm
	.fpu softvfp
	.type	swapKitties, %function
swapKitties:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r1
	mov	r2, r0
	str	lr, [sp, #-4]!
	ldrh	ip, [r0, #4]
	ldr	lr, [r0]
	ldm	r1, {r0, r1}
	stm	r2, {r0, r1}
	str	lr, [r3]
	strh	ip, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
	.size	swapKitties, .-swapKitties
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	kitties,40,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
