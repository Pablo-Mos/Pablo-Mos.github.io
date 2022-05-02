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
	.global	displayTime
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	displayTime, %function
displayTime:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r7, #136
	ldr	r3, .L4
	ldr	r5, [r3]
	ldr	r3, .L4+4
	ldr	r1, .L4+8
	ldr	r0, [r3]
	ldr	r3, .L4+12
	ldr	r2, [r3]
	smull	r3, r6, r1, r5
	mov	ip, #320
	mov	lr, #138
	smull	r3, r4, r1, r0
	smull	r3, r1, r2, r1
	asr	r3, r5, #31
	rsb	r3, r3, r6, asr #2
	add	r6, r3, r3, lsl #2
	lsl	r3, r3, #16
	sub	r5, r5, r6, lsl #1
	asr	r3, r3, #16
	ldr	r6, .L4+16
	lsl	r3, r3, #1
	ldrh	r8, [r6, r3]
	asr	r9, r0, #31
	ldr	r3, .L4+20
	lsl	r5, r5, #1
	ldrh	r5, [r6, r5]
	rsb	r4, r9, r4, asr #2
	strh	r7, [r3, #20]	@ movhi
	lsl	r7, r4, #16
	add	r4, r4, r4, lsl #2
	strh	r5, [r3, #12]	@ movhi
	strh	r8, [r3, #4]	@ movhi
	asr	r9, r2, #31
	sub	r0, r0, r4, lsl #1
	asr	r7, r7, #16
	rsb	r1, r9, r1, asr #2
	lsl	r7, r7, #1
	lsl	r0, r0, #1
	ldrh	r4, [r6, r7]
	ldrh	r7, [r6, r0]
	lsl	r0, r1, #16
	add	r1, r1, r1, lsl #2
	sub	r2, r2, r1, lsl #1
	lsl	r2, r2, #1
	asr	r0, r0, #16
	ldrh	r1, [r6, r2]
	lsl	r0, r0, #1
	ldr	r2, .L4+24
	ldrh	r8, [r6, r0]
	ldr	r0, .L4+28
	strh	r2, [r3, #10]	@ movhi
	add	r2, r2, #48
	ldr	r5, .L4+32
	strh	r4, [r3, #28]	@ movhi
	strh	r0, [r3, #18]	@ movhi
	strh	r2, [r3, #26]	@ movhi
	ldr	r4, .L4+36
	add	r0, r0, #48
	add	r2, r2, #64
	strh	r0, [r3, #34]	@ movhi
	strh	r2, [r3, #42]	@ movhi
	add	r0, r0, #80
	add	r2, r2, #168
	strh	r5, [r3, #2]	@ movhi
	strh	r7, [r3, #36]	@ movhi
	strh	lr, [r3, #44]	@ movhi
	strh	r4, [r3, #50]	@ movhi
	strh	r8, [r3, #52]	@ movhi
	strh	r0, [r3, #58]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	strh	ip, [r3, #24]	@ movhi
	strh	ip, [r3, #32]	@ movhi
	strh	ip, [r3, #48]	@ movhi
	strh	ip, [r3, #56]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #40]	@ movhi
	strh	r1, [r3, #60]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	time_m
	.word	time_s
	.word	1717986919
	.word	time_cs
	.word	.LANCHOR0
	.word	shadowOAM
	.word	-32728
	.word	-32696
	.word	-32760
	.word	-32600
	.size	displayTime, .-displayTime
	.align	2
	.global	interruptHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	ldr	r2, .L38
	ldrh	r1, [r2, #2]
	tst	r1, #8
	push	{r4, lr}
	strh	r3, [r2, #8]	@ movhi
	beq	.L8
	ldr	r1, .L38+4
	ldr	r2, [r1]
	add	r2, r2, #1
	cmp	r2, #99
	movle	r3, r2
	str	r3, [r1]
.L8:
	ldr	r3, .L38
	ldrh	r3, [r3, #2]
	tst	r3, #16
	beq	.L12
	ldr	r2, .L38+8
	ldr	r3, [r2]
	add	r1, r3, #1
	cmp	r1, #59
	subgt	r3, r3, #59
	strle	r1, [r2]
	strgt	r3, [r2]
.L12:
	ldr	r3, .L38
	ldrh	r3, [r3, #2]
	tst	r3, #32
	ldrne	r2, .L38+12
	ldrne	r3, [r2]
	addne	r3, r3, #1
	strne	r3, [r2]
	ldr	r3, .L38
	ldrh	r3, [r3, #2]
	tst	r3, #1
	bne	.L36
.L16:
	ldr	r3, .L38
	ldrh	r3, [r3, #2]
	tst	r3, #4096
	beq	.L17
	ldr	r3, .L38+16
	ldrh	r3, [r3, #48]
	tst	r3, #1
	moveq	r2, #83886080
	ldrheq	r3, [r2]
	addeq	r3, r3, #17
	strheq	r3, [r2]	@ movhi
.L17:
	ldr	r3, .L38
	ldrh	r3, [r3, #2]
	tst	r3, #4096
	beq	.L18
	ldr	r2, .L38+16
	ldrh	r3, [r2, #48]
	ands	r3, r3, #8
	beq	.L37
.L18:
	ldr	r3, .L38
	ldrh	r3, [r3, #2]
	tst	r3, #4096
	beq	.L19
	ldr	r2, .L38+16
	ldrh	r3, [r2, #48]
	ands	r3, r3, #4
	strheq	r3, [r2, #2]	@ movhi
	strheq	r3, [r2, #6]	@ movhi
	strheq	r3, [r2, #10]	@ movhi
.L19:
	mov	r1, #1
	ldr	r3, .L38
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L37:
	mov	r1, #195
	mov	r0, #196
	ldr	r4, .L38+12
	ldr	lr, .L38+8
	ldr	ip, .L38+4
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	strh	r3, [r2, #10]	@ movhi
	str	r3, [r4]
	str	r3, [lr]
	str	r3, [ip]
	strh	r1, [r2, #2]	@ movhi
	strh	r1, [r2, #6]	@ movhi
	strh	r0, [r2, #10]	@ movhi
	b	.L18
.L36:
	bl	displayTime
	ldr	r4, .L38+20
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L38+24
	mov	lr, pc
	bx	r4
	b	.L16
.L39:
	.align	2
.L38:
	.word	67109376
	.word	time_cs
	.word	time_s
	.word	time_m
	.word	67109120
	.word	DMANow
	.word	shadowOAM
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	enableTimerInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	enableTimerInterrupts, %function
enableTimerInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r1, #195
	mvn	r5, #163
	mov	r4, #49152
	mov	lr, #56
	mvn	ip, #59
	mov	r0, #196
	ldr	r3, .L42
	strh	r2, [r3, #2]	@ movhi
	strh	r5, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	ldr	r1, .L42+4
	strh	r2, [r3, #10]	@ movhi
	strh	lr, [r1]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	pop	{r4, r5, lr}
	strh	r0, [r3, #10]	@ movhi
	bx	lr
.L43:
	.align	2
.L42:
	.word	67109120
	.word	67109376
	.size	enableTimerInterrupts, .-enableTimerInterrupts
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #0
	mov	r2, #195
	mvn	r6, #163
	mov	lr, #49152
	mov	r0, #67108864
	mvn	r5, #59
	mov	r4, #196
	mov	ip, #1
	ldr	r3, .L46
	strh	r1, [r3, #2]	@ movhi
	strh	r6, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	ldrh	r2, [r0, #4]
	ldr	lr, .L46+4
	orr	r2, r2, #8
	strh	r1, [r3, #10]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	ldr	r1, .L46+8
	strh	r5, [r3, #8]	@ movhi
	ldr	r2, .L46+12
	strh	r4, [r3, #10]	@ movhi
	ldr	r0, .L46+16
	strh	lr, [r3, #50]	@ movhi
	ldr	r3, .L46+20
	strh	ip, [r2, #8]	@ movhi
	strh	r0, [r2]	@ movhi
	pop	{r4, r5, r6, lr}
	str	r3, [r1, #4092]
	bx	lr
.L47:
	.align	2
.L46:
	.word	67109120
	.word	16397
	.word	50360320
	.word	67109376
	.word	4153
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
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
	push	{r4, lr}
	mov	r1, #4352
	mov	r4, #256
	mov	r2, #67108864
	ldr	r3, .L51
	strh	r1, [r2]	@ movhi
	ldr	r2, .L51+4
	strh	r4, [r3, #6]	@ movhi
	strh	r4, [r3, #30]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L51+8
	mov	lr, pc
	bx	r3
	mov	r3, r4
	mov	r0, #3
	ldr	r2, .L51+12
	ldr	r1, .L51+16
	ldr	r4, .L51+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L51+24
	ldr	r1, .L51+28
	mov	lr, pc
	bx	r4
.L49:
	.syntax divided
@ 14 "main.c" 1
	swi 0x04 << 15
@ 0 "" 2
	.arm
	.syntax unified
	b	.L49
.L52:
	.align	2
.L51:
	.word	shadowOAM
	.word	hideSprites
	.word	setupInterrupts
	.word	83886592
	.word	digitsPal
	.word	DMANow
	.word	100728832
	.word	digitsTiles
	.size	main, .-main
	.global	digit_to_sprite_tile_index
	.comm	time_cs,4,4
	.comm	time_s,4,4
	.comm	time_m,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	digit_to_sprite_tile_index, %object
	.size	digit_to_sprite_tile_index, 20
digit_to_sprite_tile_index:
	.short	132
	.short	0
	.short	4
	.short	8
	.short	12
	.short	16
	.short	20
	.short	24
	.short	28
	.short	128
	.ident	"GCC: (devkitARM release 53) 9.1.0"
