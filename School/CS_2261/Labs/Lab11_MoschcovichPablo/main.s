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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw.part.0, %function
draw.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	push	{r4, lr}
	sub	sp, sp, #8
	ldr	r3, .L10
	ldr	r2, .L10+4
	mov	r0, #3
	ldr	r4, .L10+8
	add	r1, sp, #6
	strh	ip, [sp, #6]	@ movhi
	mov	lr, pc
	bx	r4
	ldr	r3, .L10+12
	ldr	r3, [r3]
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L2
	mov	ip, #1
	ldr	r0, .L10+4
.L3:
	ldr	r1, [r2, #12]
	ldmib	r2, {r2, r3}
	add	r3, r3, r1, lsl #5
	lsl	r3, r3, #1
	cmp	r2, #0
	strh	ip, [r0, r3]	@ movhi
	bne	.L3
.L2:
	mov	r0, #1
	ldr	r2, .L10+16
	ldm	r2, {r2, r3}
	ldr	r1, .L10+20
	lsl	r3, r3, #3
	lsl	r2, r2, #3
	strh	r3, [r1]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	16778240
	.word	100726784
	.word	DMANow
	.word	snakeList
	.word	food
	.word	shadowOAM
	.size	draw.part.0, .-draw.part.0
	.align	2
	.global	checkForLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkForLose, %function
checkForLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L19
	ldr	r3, [r3]
	ldr	r3, [r3]
	add	r2, r3, #8
	ldm	r2, {r2, r3}
	cmp	r3, #19
	cmpls	r2, #31
	bls	.L18
.L13:
	push	{r4, r5, lr}
	mov	r4, #1
	sub	sp, sp, #12
	mov	r0, #3
	ldr	r3, .L19+4
	ldr	r2, .L19+8
	ldr	r5, .L19+12
	add	r1, sp, #6
	strh	r4, [sp, #6]	@ movhi
	mov	lr, pc
	bx	r5
	ldr	r3, .L19+16
	str	r4, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L18:
	add	r2, r2, r3, lsl #5
	ldr	r3, .L19+8
	lsl	r2, r2, #1
	ldrh	r3, [r3, r2]
	cmp	r3, #1
	bxne	lr
	b	.L13
.L20:
	.align	2
.L19:
	.word	snakeList
	.word	16778240
	.word	100726784
	.word	DMANow
	.word	.LANCHOR0
	.size	checkForLose, .-checkForLose
	.align	2
	.global	spawnFood
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnFood, %function
spawnFood:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L24
	ldr	r3, [r4, #8]
	cmp	r3, #0
	bne	.L21
	ldr	r5, .L24+4
	mov	lr, pc
	bx	r5
	ldr	r2, .L24+8
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #1
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	mov	r1, #1
	ldr	r3, .L24+12
	smull	ip, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	stmib	r4, {r0, r1}
.L21:
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	food
	.word	rand
	.word	-2004318071
	.word	1717986919
	.size	spawnFood, .-spawnFood
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #7936
	push	{r4, r5, r6, lr}
	mov	r5, #0
	ldr	ip, .L28
	sub	sp, sp, #40
	strh	r3, [r2]	@ movhi
	ldr	r4, .L28+4
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #32
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L28+8
	str	r5, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L28+12
	mov	lr, pc
	bx	r4
	mov	r3, #32
	mov	r0, #3
	ldr	r2, .L28+16
	ldr	r1, .L28+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L28+24
	ldr	r1, .L28+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L28+32
	ldr	r2, .L28+36
	ldrh	r1, [r3, #48]
	ldr	r0, .L28+40
	ldr	r3, .L28+44
	mov	r6, #10
	strh	r1, [r2]	@ movhi
	strh	r5, [r0]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #20
	ldr	r5, .L28+48
	ldr	r4, .L28+52
	mov	r1, r3
	mov	r2, r6
	stm	sp, {r3, r6}
	str	r0, [r5]
	mov	lr, pc
	bx	r4
	mov	r3, #19
	mov	r2, r6
	mov	r1, r3
	str	r3, [sp, #8]
	ldr	r0, [r5]
	str	r6, [sp, #12]
	mov	lr, pc
	bx	r4
	mov	r3, #18
	mov	r2, r6
	mov	r1, r3
	str	r3, [sp, #16]
	ldr	r0, [r5]
	str	r6, [sp, #20]
	mov	lr, pc
	bx	r4
	mov	r3, #17
	mov	r2, r6
	mov	r1, r3
	str	r3, [sp, #24]
	ldr	r0, [r5]
	str	r6, [sp, #28]
	mov	lr, pc
	bx	r4
	mov	r3, #16
	str	r6, [sp, #36]
	str	r3, [sp, #32]
	add	r3, sp, #40
	ldmdb	r3, {r1, r2}
	ldr	r0, [r5]
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L28+56
	str	r2, [r3]
	add	sp, sp, #40
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	spawnFood
.L29:
	.align	2
.L28:
	.word	.LANCHOR0
	.word	DMANow
	.word	tilesTiles
	.word	tilesPal
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	create_list
	.word	snakeList
	.word	push_front
	.word	direction
	.size	initialize, .-initialize
	.align	2
	.global	checkForFood
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkForFood, %function
checkForFood:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L35
	ldr	r0, [r3]
	ldr	ip, .L35+4
	ldr	r3, [r0]
	ldr	r1, [ip]
	ldr	r2, [r3, #8]
	cmp	r1, r2
	ldr	r2, [r3, #12]
	bxne	lr
	ldr	r3, [ip, #4]
	cmp	r3, r2
	bxne	lr
	push	{r4, lr}
	mov	lr, #0
	ldr	r3, [r0, #4]
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	ldr	r3, .L35+8
	str	lr, [ip, #8]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	spawnFood
.L36:
	.align	2
.L35:
	.word	snakeList
	.word	food
	.word	push_back
	.size	checkForFood, .-checkForFood
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
	ldr	r3, .L69
	ldrh	r3, [r3]
	tst	r3, #32
	push	{r4, lr}
	beq	.L38
	ldr	r2, .L69+4
	ldrh	r2, [r2]
	tst	r2, #32
	moveq	r1, #3
	ldreq	r2, .L69+8
	streq	r1, [r2]
.L38:
	tst	r3, #16
	beq	.L39
	ldr	r2, .L69+4
	ldrh	r2, [r2]
	tst	r2, #16
	moveq	r1, #1
	ldreq	r2, .L69+8
	streq	r1, [r2]
.L39:
	tst	r3, #64
	beq	.L40
	ldr	r2, .L69+4
	ldrh	r2, [r2]
	ands	r2, r2, #64
	ldreq	r1, .L69+8
	streq	r2, [r1]
.L40:
	tst	r3, #128
	beq	.L41
	ldr	r2, .L69+4
	ldrh	r2, [r2]
	tst	r2, #128
	moveq	r1, #2
	ldreq	r2, .L69+8
	streq	r1, [r2]
.L41:
	tst	r3, #4
	beq	.L42
	ldr	r3, .L69+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L68
.L42:
	ldr	r2, .L69+12
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #9
	bgt	.L43
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L43:
	mov	r1, #0
	ldr	r4, .L69+16
	ldr	r3, .L69+20
	ldr	r0, [r4]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+8
	ldr	r3, [r3]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L45
.L47:
	.word	.L50
	.word	.L49
	.word	.L48
	.word	.L46
.L46:
	ldr	r3, [r4]
	ldr	r2, [r3]
	ldr	r3, [r2, #8]
	sub	r3, r3, #1
	str	r3, [r2, #8]
.L45:
	bl	checkForFood
	pop	{r4, lr}
	b	checkForLose
.L68:
	ldr	r3, .L69+16
	ldr	r0, [r3]
	ldr	r3, [r0, #4]
	add	r1, r3, #8
	ldm	r1, {r1, r2}
	ldr	r3, .L69+24
	mov	lr, pc
	bx	r3
	b	.L42
.L48:
	ldr	r3, [r4]
	ldr	r2, [r3]
	ldr	r3, [r2, #12]
	add	r3, r3, #1
	str	r3, [r2, #12]
	b	.L45
.L49:
	ldr	r3, [r4]
	ldr	r2, [r3]
	ldr	r3, [r2, #8]
	add	r3, r3, #1
	str	r3, [r2, #8]
	b	.L45
.L50:
	ldr	r3, [r4]
	ldr	r2, [r3]
	ldr	r3, [r2, #12]
	sub	r3, r3, #1
	str	r3, [r2, #12]
	b	.L45
.L70:
	.align	2
.L69:
	.word	oldButtons
	.word	buttons
	.word	direction
	.word	skipFrames
	.word	snakeList
	.word	updateNodePositions
	.word	push_back
	.size	update, .-update
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
	ldr	r5, .L85
	push	{r4, r7, fp, lr}
	ldr	r9, .L85+4
	mov	lr, pc
	bx	r9
	ldr	r4, .L85+8
	ldr	r3, [r5]
	ldr	r7, .L85+12
	ldr	r6, .L85+16
	ldr	r8, .L85+20
	ldr	r10, .L85+24
	ldr	fp, .L85+28
	b	.L79
.L83:
	ldrh	r2, [r4]
.L74:
	strh	r2, [r10]	@ movhi
	ldrh	r2, [fp, #48]
	strh	r2, [r4]	@ movhi
.L79:
	cmp	r3, #0
	beq	.L72
	cmp	r3, #1
	bne	.L83
	ldrh	r3, [r10]
	tst	r3, #8
	ldrh	r3, [r4]
	bne	.L76
.L82:
	strh	r3, [r10]	@ movhi
	ldrh	r3, [fp, #48]
	strh	r3, [r4]	@ movhi
	ldrh	r3, [r10]
	tst	r3, #8
	ldrh	r3, [r4]
	beq	.L82
.L76:
	tst	r3, #8
	bne	.L82
	mov	lr, pc
	bx	r9
	ldrh	r2, [r4]
	ldr	r3, [r5]
	b	.L74
.L72:
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	ldr	r3, [r5]
	cmp	r3, #0
	bne	.L83
	mov	lr, pc
	bx	r8
	ldrh	r2, [r4]
	ldr	r3, [r5]
	b	.L74
.L86:
	.align	2
.L85:
	.word	.LANCHOR0
	.word	initialize
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw.part.0
	.word	oldButtons
	.word	67109120
	.size	main, .-main
	.text
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
	@ link register save eliminated.
	ldr	r3, .L89
	ldr	r3, [r3]
	cmp	r3, #0
	bxne	lr
	b	draw.part.0
.L90:
	.align	2
.L89:
	.word	.LANCHOR0
	.size	draw, .-draw
	.comm	food,12,4
	.global	state
	.comm	skipFrames,4,4
	.comm	direction,4,4
	.comm	snakeList,4,4
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	state, %object
	.size	state, 4
state:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
