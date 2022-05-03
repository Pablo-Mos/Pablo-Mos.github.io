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
	.global	drawFood
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFood, %function
drawFood:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #2
	ldr	r4, .L4
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	drawCircle
	.word	32736
	.size	drawFood, .-drawFood
	.align	2
	.global	delFood
	.syntax unified
	.arm
	.fpu softvfp
	.type	delFood, %function
delFood:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #0
	ldr	r4, .L8
	mov	r2, #2
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	drawCircle
	.size	delFood, .-delFood
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #31
	ldr	r4, .L12
	mov	r2, #5
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	drawCircle
	.size	drawBall, .-drawBall
	.align	2
	.global	delBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	delBall, %function
delBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #0
	ldr	r4, .L16
	mov	r2, #5
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	drawCircle
	.size	delBall, .-delBall
	.align	2
	.global	drawChar1
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar1, %function
drawChar1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #10
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	ip, .L20
	sub	sp, sp, #12
	ldr	r4, .L20+4
	mov	r6, r0
	mov	r5, r1
	str	ip, [sp]
	mov	r2, r3
	add	r1, r1, #50
	add	r0, r0, #5
	mov	lr, pc
	bx	r4
	mov	r8, #0
	mov	r3, #2
	add	fp, r5, #52
	add	r10, r6, #12
	mov	r0, r10
	mov	r1, fp
	mov	r2, r3
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #1
	ldr	r7, .L20+8
	mov	r1, fp
	mov	r0, r10
	mov	r2, r3
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #2
	add	r9, r6, #6
	mov	r1, fp
	mov	r0, r9
	mov	r2, r3
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #1
	ldr	r8, .L20+12
	mov	r1, fp
	mov	r0, r9
	add	fp, r5, #46
	mov	r2, r3
	str	r7, [sp]
	ldr	r7, .L20+16
	mov	lr, pc
	bx	r4
	mov	r0, r10
	mov	r1, fp
	mov	r3, #4
	mov	r2, #2
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r1, fp
	mov	r0, r9
	mov	r3, #4
	mov	r2, #2
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #0
	add	r10, r6, #8
	mov	r0, r10
	str	r3, [sp]
	add	r1, r5, #56
	mov	r3, #2
	mov	r2, #4
	mov	lr, pc
	bx	r4
	mov	r3, #20
	ldr	ip, .L20
	add	fp, r5, #60
	str	ip, [sp]
	mov	r1, fp
	mov	r0, r6
	mov	r2, r3
	mov	lr, pc
	bx	r4
	mov	r3, #8
	mov	r0, r9
	mov	r2, r3
	add	r1, r5, #65
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #4
	mov	r0, r10
	mov	r2, r3
	add	r1, r5, #67
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	add	r9, r6, #15
	mov	r1, fp
	mov	r0, r6
	mov	r3, #10
	mov	r2, #5
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r1, fp
	mov	r0, r9
	mov	r3, #10
	mov	r2, #5
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	add	r10, r5, #70
	mov	r1, r10
	mov	r0, r6
	mov	r2, r3
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r1, r10
	mov	r0, r9
	mov	r2, r3
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	add	r10, r5, #80
	mov	r1, r10
	mov	r0, r6
	mov	r2, r3
	add	r5, r5, #85
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r0, r6
	mov	r1, r5
	mov	r3, #2
	mov	r2, #5
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r1, r10
	mov	r0, r9
	mov	r2, r3
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r1, r5
	mov	r0, r9
	mov	r3, #2
	mov	r2, #5
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	21140
	.word	drawRect
	.word	32767
	.word	32089
	.word	16735
	.size	drawChar1, .-drawChar1
	.align	2
	.global	delChar1
	.syntax unified
	.arm
	.fpu softvfp
	.type	delChar1, %function
delChar1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #10
	mov	r7, #0
	mov	r5, r1
	mov	r4, r0
	sub	sp, sp, #8
	ldr	r6, .L24
	add	r8, r5, #46
	mov	r2, r3
	str	r7, [sp]
	add	r1, r1, #50
	add	r0, r0, #5
	mov	lr, pc
	bx	r6
	mov	r1, r8
	add	r0, r4, #12
	mov	r3, #4
	mov	r2, #2
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	mov	r1, r8
	add	r0, r4, #6
	mov	r3, #4
	mov	r2, #2
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	mov	r3, #20
	mov	r0, r4
	mov	r2, r3
	add	r1, r5, #60
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	mov	r3, #5
	add	r8, r5, #80
	mov	r1, r8
	mov	r0, r4
	mov	r2, r3
	add	r5, r5, #85
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	mov	r1, r5
	mov	r0, r4
	mov	r3, #2
	mov	r2, #5
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	mov	r3, #5
	add	r4, r4, #15
	mov	r1, r8
	mov	r0, r4
	mov	r2, r3
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	mov	r1, r5
	mov	r0, r4
	mov	r3, #2
	mov	r2, #5
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	drawRect
	.size	delChar1, .-delChar1
	.align	2
	.global	drawChar2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar2, %function
drawChar2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #10
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	ip, .L28
	sub	sp, sp, #12
	ldr	r4, .L28+4
	mov	r6, r0
	mov	r5, r1
	str	ip, [sp]
	mov	r2, r3
	add	r1, r1, #50
	add	r0, r0, #5
	mov	lr, pc
	bx	r4
	mov	r8, #0
	mov	r3, #2
	add	fp, r5, #52
	add	r10, r6, #12
	mov	r0, r10
	mov	r1, fp
	mov	r2, r3
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #1
	ldr	r7, .L28+8
	mov	r1, fp
	mov	r0, r10
	mov	r2, r3
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #2
	add	r9, r6, #6
	mov	r1, fp
	mov	r0, r9
	mov	r2, r3
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #1
	ldr	r8, .L28+12
	mov	r1, fp
	mov	r0, r9
	add	fp, r5, #42
	mov	r2, r3
	str	r7, [sp]
	ldr	r7, .L28+16
	mov	lr, pc
	bx	r4
	mov	r0, r10
	mov	r1, fp
	mov	r3, #8
	mov	r2, #2
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r1, fp
	mov	r0, r9
	mov	r3, #8
	mov	r2, #2
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #0
	add	r10, r6, #8
	mov	r0, r10
	str	r3, [sp]
	add	r1, r5, #56
	mov	r3, #2
	mov	r2, #4
	mov	lr, pc
	bx	r4
	mov	r3, #20
	ldr	ip, .L28
	add	fp, r5, #60
	str	ip, [sp]
	mov	r1, fp
	mov	r0, r6
	mov	r2, r3
	mov	lr, pc
	bx	r4
	mov	r3, #8
	mov	r0, r9
	mov	r2, r3
	add	r1, r5, #65
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #4
	mov	r0, r10
	mov	r2, r3
	add	r1, r5, #67
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	add	r9, r6, #15
	mov	r1, fp
	mov	r0, r6
	mov	r3, #15
	mov	r2, #5
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r1, fp
	mov	r0, r9
	mov	r3, #15
	mov	r2, #5
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	add	r10, r5, #75
	mov	r1, r10
	mov	r0, r6
	mov	r2, r3
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r1, r10
	mov	r0, r9
	mov	r2, r3
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	add	r10, r5, #80
	mov	r1, r10
	mov	r0, r6
	mov	r2, r3
	add	r5, r5, #85
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r0, r6
	mov	r1, r5
	mov	r3, #2
	mov	r2, #5
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r1, r10
	mov	r0, r9
	mov	r2, r3
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r1, r5
	mov	r0, r9
	mov	r3, #2
	mov	r2, #5
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	21140
	.word	drawRect
	.word	32767
	.word	32089
	.word	16735
	.size	drawChar2, .-drawChar2
	.align	2
	.global	delChar2
	.syntax unified
	.arm
	.fpu softvfp
	.type	delChar2, %function
delChar2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r3, #10
	mov	r7, #0
	mov	r5, r1
	mov	r4, r0
	sub	sp, sp, #12
	ldr	r6, .L32
	add	r9, r5, #42
	mov	r2, r3
	str	r7, [sp]
	add	r1, r1, #50
	add	r0, r0, #5
	mov	lr, pc
	bx	r6
	add	r8, r4, #6
	mov	r1, r9
	add	r0, r4, #12
	mov	r3, #8
	mov	r2, #2
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	mov	r1, r9
	mov	r0, r8
	mov	r3, #8
	mov	r2, #2
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	mov	r3, #20
	mov	r0, r4
	mov	r2, r3
	add	r1, r5, #60
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	mov	r3, #8
	mov	r0, r8
	mov	r2, r3
	add	r1, r5, #65
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	mov	r3, #4
	add	r1, r5, #67
	mov	r2, r3
	add	r0, r4, #8
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	mov	r3, #5
	add	r8, r5, #80
	mov	r1, r8
	mov	r0, r4
	mov	r2, r3
	add	r5, r5, #85
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	mov	r1, r5
	mov	r0, r4
	mov	r3, #2
	mov	r2, #5
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	mov	r3, #5
	add	r4, r4, #15
	mov	r1, r8
	mov	r0, r4
	mov	r2, r3
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	mov	r1, r5
	mov	r0, r4
	mov	r3, #2
	mov	r2, #5
	str	r7, [sp]
	mov	lr, pc
	bx	r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	drawRect
	.size	delChar2, .-delChar2
	.align	2
	.global	drawChar3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar3, %function
drawChar3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #10
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	ip, .L36
	sub	sp, sp, #12
	ldr	r4, .L36+4
	mov	r6, r0
	mov	r5, r1
	str	ip, [sp]
	mov	r2, r3
	add	r1, r1, #50
	add	r0, r0, #5
	mov	lr, pc
	bx	r4
	mov	r8, #0
	mov	r3, #2
	add	fp, r5, #52
	add	r10, r6, #12
	mov	r0, r10
	mov	r1, fp
	mov	r2, r3
	str	r8, [sp]
	mov	r7, #31
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r1, fp
	mov	r0, r10
	mov	r2, r3
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #2
	add	r9, r6, #6
	mov	r1, fp
	mov	r0, r9
	mov	r2, r3
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #1
	ldr	r8, .L36+8
	mov	r1, fp
	mov	r0, r9
	add	fp, r5, #34
	mov	r2, r3
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	mov	r0, r10
	mov	r1, fp
	mov	r3, #16
	mov	r2, #2
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r1, fp
	mov	r0, r9
	mov	r3, #16
	mov	r2, #2
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #0
	add	r10, r6, #8
	mov	r0, r10
	str	r3, [sp]
	add	r1, r5, #56
	mov	r3, #2
	mov	r2, #4
	mov	lr, pc
	bx	r4
	mov	r3, #20
	ldr	ip, .L36
	add	fp, r5, #60
	str	ip, [sp]
	mov	r1, fp
	mov	r0, r6
	mov	r2, r3
	mov	lr, pc
	bx	r4
	mov	r3, #8
	mov	r0, r9
	mov	r2, r3
	add	r1, r5, #65
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #4
	mov	r0, r10
	mov	r2, r3
	add	r1, r5, #67
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	add	r9, r6, #15
	mov	r1, fp
	mov	r0, r6
	mov	r3, #15
	mov	r2, #5
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	add	r10, r5, #75
	mov	r1, fp
	mov	r0, r9
	mov	r3, #15
	mov	r2, #5
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r1, r10
	mov	r0, r6
	mov	r3, #10
	mov	r2, #5
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	mov	r1, r10
	mov	r0, r9
	mov	r3, #10
	mov	r2, #5
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	add	r10, r5, #80
	mov	r1, r10
	mov	r0, r6
	mov	r2, r3
	add	r5, r5, #85
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r0, r6
	mov	r1, r5
	mov	r3, #2
	mov	r2, #5
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r1, r10
	mov	r0, r9
	mov	r2, r3
	str	r8, [sp]
	mov	lr, pc
	bx	r4
	mov	r1, r5
	mov	r0, r9
	mov	r3, #2
	mov	r2, #5
	str	r7, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	21140
	.word	drawRect
	.word	32089
	.size	drawChar3, .-drawChar3
	.align	2
	.global	delChar3
	.syntax unified
	.arm
	.fpu softvfp
	.type	delChar3, %function
delChar3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r3, #10
	mov	r5, #0
	mov	r6, r1
	mov	r7, r0
	sub	sp, sp, #8
	ldr	r4, .L40
	add	r8, r6, #34
	mov	r2, r3
	str	r5, [sp]
	add	r1, r1, #50
	add	r0, r0, #5
	mov	lr, pc
	bx	r4
	mov	r1, r8
	add	r0, r7, #12
	mov	r3, #16
	mov	r2, #2
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r1, r8
	add	r0, r7, #6
	mov	r3, #16
	mov	r2, #2
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #20
	add	r9, r6, #60
	mov	r1, r9
	mov	r0, r7
	mov	r2, r3
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	add	r8, r7, #15
	mov	r1, r9
	mov	r0, r7
	mov	r3, #15
	mov	r2, #5
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	add	r10, r6, #75
	mov	r1, r9
	mov	r0, r8
	mov	r3, #15
	mov	r2, #5
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r1, r10
	mov	r0, r7
	mov	r3, #10
	mov	r2, #5
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r1, r10
	mov	r0, r8
	mov	r3, #10
	mov	r2, #5
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	add	r9, r6, #80
	mov	r1, r9
	mov	r0, r7
	mov	r2, r3
	add	r6, r6, #85
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r0, r7
	mov	r1, r6
	mov	r3, #2
	mov	r2, #5
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r1, r9
	mov	r0, r8
	mov	r2, r3
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r1, r6
	mov	r0, r8
	mov	r3, #2
	mov	r2, #5
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	drawRect
	.size	delChar3, .-delChar3
	.align	2
	.global	drawBase
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBase, %function
drawBase:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L44
	sub	sp, sp, #8
	str	r2, [sp]
	ldr	r4, .L44+4
	mov	r3, #10
	mov	r2, #240
	mov	r1, #150
	mov	r0, #0
	mov	lr, pc
	bx	r4
	mov	r2, #992
	mov	r3, #5
	str	r2, [sp]
	mov	r1, #145
	mov	r2, #240
	mov	r0, #0
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	6518
	.word	drawRect
	.size	drawBase, .-drawBase
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	push	{r4, r5, r6, lr}
	mov	r5, #0
	ldr	r2, .L48
	ldr	r1, .L48+4
	strh	r2, [r3]	@ movhi
	ldr	r2, .L48+8
	mov	r0, r5
	ldr	r3, .L48+12
	ldrh	r1, [r1, #48]
	strh	r5, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	bl	drawBase
	mov	r2, #120
	ldr	r4, .L48+16
	ldr	r3, .L48+20
	ldr	r1, .L48+24
	stmib	r3, {r2, r5}
	str	r5, [r3]
	str	r2, [r3, #12]
	str	r2, [r4]
	mov	lr, pc
	bx	r1
	mov	ip, #58
	mov	r1, #110
	ldr	r3, .L48+28
	smull	lr, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	ldr	r2, .L48+32
	str	r5, [r2]
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	ldr	r2, [r4]
	ldr	r5, .L48+36
	str	r2, [r4, #8]
	ldr	lr, .L48+40
	sub	r0, r0, r3, lsl #2
	ldr	r2, .L48+44
	ldr	r3, .L48+48
	add	r0, r0, #5
	str	r0, [r4, #4]
	str	r0, [r4, #12]
	str	ip, [r5]
	str	ip, [lr]
	str	r1, [r2]
	str	r1, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	1027
	.word	67109120
	.word	bgColor
	.word	fillScreen
	.word	food
	.word	ball
	.word	rand
	.word	156180629
	.word	lvl
	.word	tRow
	.word	tOldRow
	.word	tCol
	.word	tOldCol
	.size	initialize, .-initialize
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L75
	ldrh	r2, [r3, #48]
	ldr	r4, .L75+4
	tst	r2, #32
	ldr	r0, [r4]
	sub	sp, sp, #16
	beq	.L70
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L71
.L52:
	cmp	r0, #0
	blt	.L72
.L53:
	cmp	r0, #220
	movgt	r2, #219
	ldrgt	r3, .L75+8
	strgt	r2, [r4]
	strgt	r0, [r3]
.L54:
	ldr	r5, .L75+12
	ldr	r1, [r5]
	add	r1, r1, #1
	cmp	r1, #139
	str	r1, [r5]
	bgt	.L55
	ldr	r0, [r5, #4]
	sub	r0, r0, #5
.L56:
	mov	r3, #10
	ldr	r2, .L75+16
	ldr	r8, .L75+20
	ldr	ip, [r2]
	ldr	r2, [r8]
	ldr	lr, [r4]
	add	ip, ip, #41
	add	r2, r2, #40
	stmib	sp, {r2, r3, ip}
	str	lr, [sp]
	mov	r2, r3
	ldr	r6, .L75+24
	sub	r1, r1, #5
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L68
	ldr	r7, .L75+28
.L57:
	mov	lr, #41
	mov	ip, #10
	mov	r3, #4
	ldr	r1, [r8]
	ldr	r2, [r4]
	add	r1, r1, #35
	str	r1, [sp, #4]
	ldr	r5, .L75+32
	add	r2, r2, #5
	ldr	r1, [r5]
	str	r2, [sp]
	ldr	r0, [r5, #4]
	mov	r2, r3
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	sub	r1, r1, #2
	sub	r0, r0, #2
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L73
.L58:
	ldr	r3, [r7]
	cmp	r3, #3
	beq	.L74
.L50:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L71:
	add	r0, r0, #1
	ldr	r3, .L75+36
	str	r0, [r4]
	mov	lr, pc
	bx	r3
	ldr	r0, [r4]
	cmp	r0, #0
	bge	.L53
.L72:
	mov	r2, #0
	ldr	r3, .L75+8
	str	r2, [r4]
	str	r0, [r3]
	b	.L54
.L74:
	ldr	r3, .L75+40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L50
	ldr	r3, .L75+44
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L50
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	initialize
.L55:
	mov	r2, #0
	ldr	r3, .L75+48
	str	r2, [r5]
	mov	lr, pc
	bx	r3
	mov	r3, r0
	ldr	r0, .L75+52
	smull	r2, r0, r3, r0
	asr	r2, r3, #31
	rsb	r0, r2, r0, asr #3
	rsb	r2, r0, r0, lsl #3
	rsb	r0, r0, r2, lsl #3
	sub	r0, r3, r0, lsl #2
	add	r3, r0, #5
	str	r3, [r5, #4]
	ldr	r1, [r5]
	b	.L56
.L70:
	sub	r0, r0, #1
	ldr	r3, .L75+36
	str	r0, [r4]
	mov	lr, pc
	bx	r3
	ldr	r0, [r4]
	b	.L52
.L73:
	ldr	r3, [r7]
	ldr	r2, .L75+48
	add	r3, r3, #1
	str	r3, [r7]
	mov	lr, pc
	bx	r2
	ldr	ip, .L75+52
	smull	r2, r3, ip, r0
	asr	ip, r0, #31
	rsb	ip, ip, r3, asr #3
	rsb	r3, ip, ip, lsl #3
	rsb	ip, ip, r3, lsl #3
	sub	r0, r0, ip, lsl #2
	add	ip, r0, #5
	mov	r3, #0
	mov	r2, #2
	ldr	r1, [r5, #8]
	ldr	r0, [r5, #12]
	ldr	r4, .L75+56
	str	ip, [r5, #4]
	mov	lr, pc
	bx	r4
	b	.L58
.L68:
	mov	r3, #0
	ldr	r2, .L75+8
	ldr	r1, .L75+60
	ldr	r7, .L75+28
	ldr	r1, [r1]
	ldr	r0, [r2]
	str	r3, [r5]
	str	r3, [r7]
	bl	delChar3
	b	.L57
.L76:
	.align	2
.L75:
	.word	67109120
	.word	tCol
	.word	tOldCol
	.word	ball
	.word	.LANCHOR0
	.word	tRow
	.word	collision
	.word	lvl
	.word	food
	.word	srand
	.word	oldButtons
	.word	buttons
	.word	rand
	.word	156180629
	.word	drawCircle
	.word	tOldRow
	.size	update, .-update
	.align	2
	.global	endScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	endScreen, %function
endScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r0, #0
	ldr	r3, .L81
	mov	lr, pc
	bx	r3
	mov	r8, #11
	ldr	r4, .L81+4
	ldr	r7, .L81+8
	ldr	r6, .L81+12
	ldr	r5, .L81+16
.L78:
	mov	lr, pc
	bx	r4
	mov	r9, r0
	mov	lr, pc
	bx	r4
	mov	r1, r0
	smull	r3, r2, r5, r9
	smull	r3, ip, r6, r0
	add	r0, r2, r9
	asr	r3, r1, #31
	asr	r2, r9, #31
	rsb	r3, r3, ip, asr #6
	rsb	r2, r2, r0, asr #7
	rsb	r2, r2, r2, lsl #4
	add	r3, r3, r3, lsl #2
	sub	r1, r1, r3, lsl #5
	sub	r0, r9, r2, lsl #4
	ldr	r3, .L81+20
	mov	r2, #1
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r4
	mov	r9, r0
	mov	lr, pc
	bx	r4
	mov	r1, r0
	smull	r3, r2, r5, r9
	smull	r3, ip, r6, r0
	add	r0, r2, r9
	asr	r3, r1, #31
	asr	r2, r9, #31
	rsb	r3, r3, ip, asr #6
	rsb	r2, r2, r0, asr #7
	rsb	r2, r2, r2, lsl #4
	add	r3, r3, r3, lsl #2
	sub	r1, r1, r3, lsl #5
	sub	r0, r9, r2, lsl #4
	mov	r3, #992
	mov	r2, #1
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r4
	mov	r9, r0
	mov	lr, pc
	bx	r4
	mov	r1, r0
	smull	r3, r2, r5, r9
	smull	r3, ip, r6, r0
	add	r0, r2, r9
	asr	r3, r1, #31
	asr	r2, r9, #31
	rsb	r3, r3, ip, asr #6
	rsb	r2, r2, r0, asr #7
	rsb	r2, r2, r2, lsl #4
	add	r3, r3, r3, lsl #2
	sub	r1, r1, r3, lsl #5
	sub	r0, r9, r2, lsl #4
	ldr	r3, .L81+24
	mov	r2, #1
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r4
	mov	r9, r0
	mov	lr, pc
	bx	r4
	mov	r1, r0
	smull	r3, r2, r5, r9
	smull	r3, ip, r6, r0
	add	r0, r2, r9
	asr	r3, r1, #31
	asr	r2, r9, #31
	rsb	r3, r3, ip, asr #6
	rsb	r2, r2, r0, asr #7
	rsb	r2, r2, r2, lsl #4
	add	r3, r3, r3, lsl #2
	sub	r1, r1, r3, lsl #5
	sub	r0, r9, r2, lsl #4
	ldr	r3, .L81+28
	mov	r2, #1
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r4
	mov	r9, r0
	mov	lr, pc
	bx	r4
	mov	r1, r0
	smull	r3, r2, r5, r9
	smull	r3, ip, r6, r0
	add	r0, r2, r9
	asr	r3, r1, #31
	asr	r2, r9, #31
	rsb	r3, r3, ip, asr #6
	rsb	r2, r2, r0, asr #7
	rsb	r2, r2, r2, lsl #4
	add	r3, r3, r3, lsl #2
	sub	r1, r1, r3, lsl #5
	sub	r0, r9, r2, lsl #4
	mov	r3, #31
	mov	r2, #1
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r4
	mov	r9, r0
	mov	lr, pc
	bx	r4
	mov	r1, r0
	smull	r3, r2, r5, r9
	smull	r3, ip, r6, r0
	add	r0, r2, r9
	asr	r3, r1, #31
	asr	r2, r9, #31
	rsb	r2, r2, r0, asr #7
	rsb	r3, r3, ip, asr #6
	rsb	r2, r2, r2, lsl #4
	add	r3, r3, r3, lsl #2
	sub	r0, r9, r2, lsl #4
	sub	r1, r1, r3, lsl #5
	mov	r2, #1
	mov	r3, #31
	mov	lr, pc
	bx	r7
	subs	r8, r8, #1
	bne	.L78
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	fillScreen
	.word	rand
	.word	drawCircle
	.word	1717986919
	.word	-2004318071
	.word	31775
	.word	32736
	.word	1023
	.size	endScreen, .-endScreen
	.align	2
	.global	drawStars
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStars, %function
drawStars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r5, .L85
	mov	lr, pc
	bx	r5
	mov	r6, r0
	mov	lr, pc
	bx	r5
	ldr	r9, .L85+4
	ldr	r4, .L85+8
	smull	r3, ip, r9, r0
	smull	r2, r3, r4, r6
	add	r1, ip, r0
	asr	ip, r0, #31
	add	r2, r3, r6
	rsb	ip, ip, r1, asr #7
	asr	r3, r6, #31
	ldr	r7, .L85+12
	rsb	r3, r3, r2, asr #7
	add	ip, ip, ip, lsl #2
	rsb	r3, r3, r3, lsl #4
	rsb	ip, ip, ip, lsl #3
	sub	r1, r0, ip, lsl #2
	mov	r2, r7
	sub	r0, r6, r3, lsl #4
	ldr	r8, .L85+16
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r5
	mov	r6, r0
	mov	lr, pc
	bx	r5
	smull	r3, r9, r0, r9
	smull	r3, r2, r4, r6
	add	r9, r9, r0
	asr	r3, r0, #31
	add	r1, r2, r6
	rsb	r3, r3, r9, asr #7
	asr	r2, r6, #31
	rsb	r2, r2, r1, asr #7
	add	r3, r3, r3, lsl #2
	rsb	ip, r2, r2, lsl #4
	rsb	r3, r3, r3, lsl #3
	sub	r1, r0, r3, lsl #2
	mov	r2, r7
	sub	r0, r6, ip, lsl #4
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r5
	mov	r6, r0
	mov	lr, pc
	bx	r5
	ldr	r7, .L85+20
	smull	r2, r3, r7, r0
	smull	r1, r2, r4, r6
	add	r1, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #7
	add	r1, r2, r6
	asr	r2, r6, #31
	rsb	r2, r2, r1, asr #7
	add	r3, r3, r3, lsl #3
	rsb	r3, r3, r3, lsl #4
	rsb	r2, r2, r2, lsl #4
	sub	r1, r0, r3
	mov	r3, #0
	sub	r0, r6, r2, lsl #4
	mov	r2, #10
	ldr	r6, .L85+24
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	r8, r0
	mov	lr, pc
	bx	r5
	smull	r3, r7, r0, r7
	smull	r3, r4, r8, r4
	add	r7, r7, r0
	asr	r3, r0, #31
	asr	r2, r8, #31
	add	r4, r4, r8
	rsb	r3, r3, r7, asr #7
	rsb	r4, r2, r4, asr #7
	add	r3, r3, r3, lsl #3
	rsb	r3, r3, r3, lsl #4
	rsb	r4, r4, r4, lsl #4
	sub	r1, r0, r3
	mov	r2, #10
	sub	r0, r8, r4, lsl #4
	mov	r3, #0
	mov	lr, pc
	bx	r6
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	rand
	.word	-368140053
	.word	-2004318071
	.word	32767
	.word	setPixel
	.word	-222702007
	.word	drawCircle
	.size	drawStars, .-drawStars
	.align	2
	.global	activeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	activeGame, %function
activeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L89
	ldr	r4, .L89+4
	ldr	r5, .L89+8
	ldr	r1, [r3]
	ldr	r0, [r3, #4]
	mov	r2, #2
	ldr	r3, .L89+12
	mov	lr, pc
	bx	r5
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	mov	r3, #0
	mov	r2, #5
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	r3, #31
	mov	r2, #5
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	b	drawStars
.L90:
	.align	2
.L89:
	.word	food
	.word	ball
	.word	drawCircle
	.word	32736
	.size	activeGame, .-activeGame
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L100
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	beq	.L97
	cmp	r3, #1
	beq	.L98
	cmp	r3, #2
	beq	.L99
	bl	endScreen
	ldr	r5, .L100+4
	ldr	r4, .L100+8
	ldr	r7, .L100+12
	ldr	r6, .L100+16
.L93:
	ldr	r3, .L100+20
	ldr	r2, .L100+24
	ldr	r0, [r7]
	ldr	r1, [r6]
	ldm	r2, {ip, lr}
	str	r0, [r5]
	str	r1, [r4]
	ldr	r0, [r3, #4]
	ldr	r1, [r3]
	str	lr, [r2, #12]
	str	ip, [r2, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #8]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L97:
	ldr	r5, .L100+4
	ldr	r4, .L100+8
	ldr	r2, .L100+28
	ldr	r7, .L100+12
	ldr	r6, .L100+16
	ldr	r1, [r5]
	ldr	r0, [r4]
	str	r3, [r2]
	bl	delChar1
	bl	activeGame
	ldr	r1, [r7]
	ldr	r0, [r6]
	bl	drawChar1
	b	.L93
.L99:
	bl	activeGame
	mov	r2, #12
	ldr	r5, .L100+4
	ldr	r4, .L100+8
	ldr	r3, .L100+28
	ldr	r7, .L100+12
	ldr	r6, .L100+16
	ldr	r1, [r5]
	ldr	r0, [r4]
	str	r2, [r3]
	bl	delChar3
	ldr	r1, [r7]
	ldr	r0, [r6]
	bl	drawChar3
	b	.L93
.L98:
	bl	activeGame
	mov	r2, #4
	ldr	r5, .L100+4
	ldr	r4, .L100+8
	ldr	r3, .L100+28
	ldr	r7, .L100+12
	ldr	r6, .L100+16
	ldr	r1, [r5]
	ldr	r0, [r4]
	str	r2, [r3]
	bl	delChar2
	ldr	r1, [r7]
	ldr	r0, [r6]
	bl	drawChar2
	b	.L93
.L101:
	.align	2
.L100:
	.word	lvl
	.word	tOldRow
	.word	tOldCol
	.word	tRow
	.word	tCol
	.word	ball
	.word	food
	.word	.LANCHOR0
	.size	draw, .-draw
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, lr}
	ldr	r3, .L105
	mov	lr, pc
	bx	r3
	ldr	r9, .L105+4
	ldr	r4, .L105+8
	ldr	r8, .L105+12
	ldr	r7, .L105+16
	ldr	r6, .L105+20
	ldr	r5, .L105+24
.L103:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	b	.L103
.L106:
	.align	2
.L105:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.size	main, .-main
	.comm	tOldCol,4,4
	.comm	tOldRow,4,4
	.comm	tCol,4,4
	.comm	tRow,4,4
	.comm	bgColor,2,2
	.comm	food,16,4
	.comm	ball,16,4
	.global	tHeight
	.comm	lvl,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	tHeight, %object
	.size	tHeight, 4
tHeight:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
