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
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	ip, #32
	mov	r3, #0
	mov	r6, #31
	mov	r4, #3
	mov	r0, #110
	mov	fp, #208
	mov	r9, #2
	mov	r5, #24
	mov	lr, #14
	mov	r10, #108
	mov	r8, #12
	mov	r7, #15
	ldr	r2, .L9
	str	r1, [r2]
	ldr	r2, .L9+4
	stm	r2, {r0, fp}
	str	ip, [r2, #16]
	str	r6, [r2, #20]
	str	r4, [r2, #48]
	str	r1, [r2, #12]
	str	r1, [r2, #8]
	str	r1, [r2, #32]
	str	r3, [r2, #24]
	str	r3, [r2, #40]
	str	r3, [r2, #56]
	ldr	r2, .L9+8
	str	r3, [r2]
	ldr	r2, .L9+12
	str	r3, [r2]
	ldr	r2, .L9+16
	str	r3, [r2]
	ldr	r2, .L9+20
	ldr	r0, .L9+24
	str	r3, [r2]
	ldr	r2, .L9+28
	str	r6, [r0, #20]
	str	r3, [r2]
	ldr	r6, .L9+32
	ldr	r2, .L9+36
	str	r3, [r6]
	str	r1, [r0, #12]
	str	r1, [r0, #8]
	str	r1, [r0, #32]
	str	r10, [r0, #4]
	str	r9, [r0, #48]
	str	r3, [r0, #24]
	str	r3, [r0, #40]
	str	r5, [r0, #16]
	str	lr, [r0]
	str	r3, [r2]
	ldr	r6, .L9+40
	ldr	r2, .L9+44
	ldr	r0, .L9+48
	str	r3, [r6]
	str	ip, [r2, #16]
	str	ip, [r2, #20]
	ldr	r0, [r0]
	str	r4, [r2, #48]
	ldr	r4, .L9+52
	cmp	r0, r9
	str	r1, [r2, #12]
	str	r1, [r2, #8]
	str	r5, [r2, #4]
	str	lr, [r2]
	str	r3, [r2, #24]
	str	r3, [r2, #40]
	str	r1, [r2, #32]
	str	r8, [r4, #16]
	str	r7, [r4, #20]
	beq	.L8
	mov	r2, #64
	ldr	r3, .L9+56
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	ldr	r2, .L9+60
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #3
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #40
	str	r0, [r4, #4]
.L3:
	mov	r3, #0
	mov	r6, #1
	mov	r0, #2
	mov	r1, #9
	mov	lr, #56
	mov	ip, #37
	mov	r2, r3
	str	r3, [r4, #24]
	str	r3, [r4, #40]
	str	r3, [r4, #32]
	ldr	r3, .L9+64
	str	r6, [r4, #52]
	mov	r5, r0
	str	r0, [r4, #48]
	add	r0, r3, #240
.L4:
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	lr, [r3, #4]
	str	r2, [r3, #52]
	str	ip, [r3]
	str	r2, [r3, #24]
	str	r2, [r3, #40]
	str	r5, [r3, #48]
	str	r2, [r3, #32]
	add	r3, r3, #60
	cmp	r3, r0
	bne	.L4
	ldr	r3, .L9+68
	str	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L8:
	mov	r2, #112
	ldr	r3, .L9+56
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	ldr	r3, .L9+72
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl r9
	sub	r0, r0, r3, lsl #3
	add	r0, r0, #45
	str	r0, [r4, #4]
	b	.L3
.L10:
	.align	2
.L9:
	.word	canTurn
	.word	mario
	.word	won2
	.word	jumpCount
	.word	jumped
	.word	fallen
	.word	princess
	.word	numHammers
	.word	cheat
	.word	overBarrel
	.word	won
	.word	dk
	.word	lvl
	.word	hammer
	.word	rand
	.word	-368140053
	.word	barrel
	.word	timer
	.word	1717986919
	.size	initGame, .-initGame
	.align	2
	.global	idleMario
	.syntax unified
	.arm
	.fpu softvfp
	.type	idleMario, %function
idleMario:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L50
	ldr	ip, [r3, #4]
	mvn	r1, ip, lsl #17
	mvn	r1, r1, lsr #17
	push	{r4, r5, r6, r7, lr}
	ldr	lr, [r3, #36]
	ldr	r0, .L50+4
	ldr	r2, [r3]
	cmp	lr, #0
	strh	r1, [r0, #2]	@ movhi
	strh	r2, [r0]	@ movhi
	bne	.L12
	ldr	r1, .L50+8
	ldr	lr, [r1]
	cmp	lr, #0
	beq	.L13
	mov	r4, #384
	ldr	lr, [r3, #28]
	ands	lr, lr, #3
	strh	r4, [r0, #4]	@ movhi
	beq	.L45
.L14:
	cmp	r2, #62
	beq	.L46
.L29:
	cmp	r2, #14
	beq	.L47
.L11:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L13:
	ldr	r1, .L50+12
	ldr	lr, [r1]
	cmp	lr, #0
	beq	.L15
	mov	lr, #384
	ldr	r4, [r3, #28]
	tst	r4, #3
	strh	lr, [r0, #4]	@ movhi
	bne	.L14
.L44:
	ldr	lr, .L50+16
	ldr	r0, [lr]
	sub	r0, r0, #1
	add	r2, r2, #2
	cmp	r0, #0
	str	r2, [r3]
	str	r0, [lr]
	streq	r0, [r1]
	b	.L14
.L12:
	cmp	lr, #1
	beq	.L48
	cmp	lr, #2
	bne	.L14
	ldr	r1, [r3, #20]
	rsb	lr, r1, #141
	cmp	r2, lr
	beq	.L21
	rsb	r4, r1, #93
	cmp	r2, r4
	beq	.L21
	rsb	r4, r1, #45
	cmp	r2, r4
	movne	r5, #0
	ldrne	r4, .L50+20
	strne	r5, [r4]
.L21:
	ldr	r4, .L50+8
	ldr	r5, [r4]
	cmp	r5, #0
	beq	.L22
	mov	r6, #388
	ldr	r5, [r3, #28]
	ands	r5, r5, #3
	strh	r6, [r0, #4]	@ movhi
	bne	.L23
	ldr	r7, .L50+16
	ldr	r6, [r7]
	add	r6, r6, #1
	sub	r2, r2, #2
	cmp	r6, #8
	str	r2, [r3]
	str	r6, [r7]
	moveq	r6, #1
	streq	r5, [r4]
	ldreq	r4, .L50+12
	streq	r6, [r4]
.L23:
	cmp	lr, r2
	beq	.L24
	rsb	lr, r1, #93
	cmp	lr, r2
	beq	.L24
	rsb	r1, r1, #45
	cmp	r1, r2
	bne	.L14
.L24:
	mov	r1, #1
	ldr	r4, .L50+20
	ldr	lr, .L50+24
	cmp	ip, #40
	str	r1, [r4]
	ldr	lr, [lr]
	ble	.L25
	cmp	lr, #0
	str	r1, [r3, #36]
	moveq	r1, #4
	ldrne	r1, [r3, #44]
	lslne	r1, r1, #7
	addne	r1, r1, #516
	cmp	r2, #62
	strh	r1, [r0, #4]	@ movhi
	bne	.L29
	b	.L31
.L46:
	sub	r1, ip, #7
	cmp	r1, #10
	bls	.L30
.L31:
	ldr	r2, [r3, #16]
	rsb	r1, r2, #150
	cmp	ip, r1
	ble	.L11
	rsb	r2, r2, #162
	cmp	ip, r2
	bge	.L11
	mov	r2, #62
.L30:
	ldr	r1, .L50+28
	ldrh	r1, [r1, #48]
	tst	r1, #128
	bne	.L11
	mov	r1, #2
	add	r2, r2, #28
	str	r2, [r3]
	str	r1, [r3, #32]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L47:
	ldr	r1, [r3, #16]
	rsb	r0, r1, #222
	cmp	ip, r0
	ble	.L11
	rsb	r1, r1, #234
	cmp	ip, r1
	blt	.L30
	b	.L11
.L45:
	ldr	r4, .L50+16
	ldr	r0, [r4]
	add	r0, r0, #1
	sub	r2, r2, #2
	cmp	r0, #8
	str	r2, [r3]
	str	r0, [r4]
	moveq	r0, #1
	streq	lr, [r1]
	ldreq	r1, .L50+12
	streq	r0, [r1]
	b	.L14
.L15:
	ldr	r1, .L50+24
	ldr	r1, [r1]
	cmp	r1, #0
	beq	.L42
.L40:
	ldr	r1, [r3, #44]
	add	r1, r1, #4
	lsl	r1, r1, #7
	strh	r1, [r0, #4]	@ movhi
	b	.L14
.L48:
	ldr	r1, .L50+8
	ldr	r4, [r1]
	cmp	r4, #0
	beq	.L18
	mov	r5, #388
	ldr	r4, [r3, #28]
	ands	r4, r4, #3
	strh	r5, [r0, #4]	@ movhi
	bne	.L14
	ldr	r5, .L50+16
	ldr	r0, [r5]
	add	r0, r0, #1
	sub	r2, r2, #2
	cmp	r0, #8
	str	r2, [r3]
	str	r0, [r5]
	ldreq	r0, .L50+12
	streq	r4, [r1]
	streq	lr, [r0]
	b	.L14
.L18:
	ldr	r1, .L50+12
	ldr	lr, [r1]
	cmp	lr, #0
	bne	.L49
	ldr	r1, .L50+24
	ldr	r1, [r1]
	cmp	r1, #0
	beq	.L20
	ldr	r1, [r3, #44]
	lsl	r1, r1, #7
	add	r1, r1, #516
	strh	r1, [r0, #4]	@ movhi
	b	.L14
.L20:
	mov	r1, #4
.L42:
	strh	r1, [r0, #4]	@ movhi
	b	.L14
.L22:
	ldr	r4, .L50+12
	ldr	r5, [r4]
	cmp	r5, #0
	beq	.L23
	mov	r5, #388
	ldr	r6, [r3, #28]
	tst	r6, #3
	strh	r5, [r0, #4]	@ movhi
	bne	.L23
	ldr	r6, .L50+16
	ldr	r5, [r6]
	sub	r5, r5, #1
	add	r2, r2, #2
	cmp	r5, #0
	str	r2, [r3]
	str	r5, [r6]
	streq	r5, [r4]
	b	.L23
.L49:
	mov	lr, #388
	ldr	r4, [r3, #28]
	tst	r4, #3
	strh	lr, [r0, #4]	@ movhi
	bne	.L14
	b	.L44
.L25:
	mov	r1, #0
	cmp	lr, r1
	str	r1, [r3, #36]
	strheq	lr, [r0, #4]	@ movhi
	beq	.L14
	b	.L40
.L51:
	.align	2
.L50:
	.word	mario
	.word	shadowOAM
	.word	jumped
	.word	fallen
	.word	jumpCount
	.word	canTurn
	.word	cheat
	.word	67109120
	.size	idleMario, .-idleMario
	.align	2
	.global	rightMario
	.syntax unified
	.arm
	.fpu softvfp
	.type	rightMario, %function
rightMario:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L64
	ldr	r0, [r3, #4]
	mvn	r1, r0, lsl #17
	mvn	r1, r1, lsr #17
	push	{r4, lr}
	ldr	lr, .L64+4
	ldr	r4, [lr]
	ldr	r2, .L64+8
	ldr	ip, [r3]
	cmp	r4, #0
	strh	r1, [r2, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	beq	.L53
	mov	r4, #384
	ldr	r1, [r3, #28]
	ands	r1, r1, #3
	strh	r4, [r2, #4]	@ movhi
	beq	.L62
.L55:
	ldr	r2, .L64+12
	ldr	r1, [r2]
	sub	r2, r0, #69
	cmp	r2, #42
	cmpls	r1, #2
	beq	.L63
.L59:
	ldr	r2, [r3, #12]
	add	r0, r2, r0
	str	r0, [r3, #4]
.L52:
	pop	{r4, lr}
	bx	lr
.L53:
	ldr	r1, .L64+16
	ldr	lr, [r1]
	cmp	lr, #0
	beq	.L57
	mov	lr, #384
	ldr	r4, [r3, #28]
	tst	r4, #3
	strh	lr, [r2, #4]	@ movhi
	bne	.L55
	ldr	lr, .L64+20
	ldr	r2, [lr]
	sub	r2, r2, #1
	add	ip, ip, #2
	cmp	r2, #0
	str	ip, [r3]
	str	r2, [lr]
	streq	r2, [r1]
	b	.L55
.L57:
	ldr	r1, .L64+24
	ldr	r1, [r1]
	cmp	r1, #0
	ldrne	r1, [r3, #44]
	ldreq	r1, [r3, #40]
	addne	r1, r1, #4
	lsl	r1, r1, #7
	strh	r1, [r2, #4]	@ movhi
	b	.L55
.L62:
	ldr	r4, .L64+20
	ldr	r2, [r4]
	add	r2, r2, #1
	sub	ip, ip, #2
	cmp	r2, #8
	str	ip, [r3]
	str	r2, [r4]
	moveq	ip, #1
	ldreq	r2, .L64+16
	streq	r1, [lr]
	streq	ip, [r2]
	b	.L55
.L63:
	ldr	r2, [r3]
	cmp	r2, #63
	bgt	.L52
	b	.L59
.L65:
	.align	2
.L64:
	.word	mario
	.word	jumped
	.word	shadowOAM
	.word	lvl
	.word	fallen
	.word	jumpCount
	.word	cheat
	.size	rightMario, .-rightMario
	.align	2
	.global	leftMario
	.syntax unified
	.arm
	.fpu softvfp
	.type	leftMario, %function
leftMario:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L78
	ldr	r2, [r3, #4]
	mvn	r0, r2, lsl #17
	mvn	r0, r0, lsr #17
	push	{r4, lr}
	ldr	lr, .L78+4
	ldr	r4, [lr]
	ldr	r1, .L78+8
	ldr	ip, [r3]
	cmp	r4, #0
	strh	r0, [r1, #2]	@ movhi
	strh	ip, [r1]	@ movhi
	beq	.L67
	mov	r4, #388
	ldr	r0, [r3, #28]
	ands	r0, r0, #3
	strh	r4, [r1, #4]	@ movhi
	beq	.L76
.L69:
	ldr	r1, .L78+12
	ldr	r0, [r1]
	sub	r1, r2, #70
	cmp	r1, #42
	cmpls	r0, #2
	beq	.L77
.L73:
	ldr	r1, [r3, #12]
	sub	r2, r2, r1
	str	r2, [r3, #4]
.L66:
	pop	{r4, lr}
	bx	lr
.L67:
	ldr	r0, .L78+16
	ldr	lr, [r0]
	cmp	lr, #0
	beq	.L71
	mov	lr, #388
	ldr	r4, [r3, #28]
	tst	r4, #3
	strh	lr, [r1, #4]	@ movhi
	bne	.L69
	ldr	lr, .L78+20
	ldr	r1, [lr]
	sub	r1, r1, #1
	add	ip, ip, #2
	cmp	r1, #0
	str	ip, [r3]
	str	r1, [lr]
	streq	r1, [r0]
	b	.L69
.L71:
	ldr	r0, .L78+24
	ldr	r0, [r0]
	cmp	r0, #0
	ldrne	r0, [r3, #44]
	ldreq	r0, [r3, #40]
	lslne	r0, r0, #7
	lsleq	r0, r0, #7
	addne	r0, r0, #516
	addeq	r0, r0, #4
	strh	r0, [r1, #4]	@ movhi
	b	.L69
.L76:
	ldr	r4, .L78+20
	ldr	r1, [r4]
	add	r1, r1, #1
	sub	ip, ip, #2
	cmp	r1, #8
	str	ip, [r3]
	str	r1, [r4]
	moveq	ip, #1
	ldreq	r1, .L78+16
	streq	r0, [lr]
	streq	ip, [r1]
	b	.L69
.L77:
	ldr	r1, [r3]
	cmp	r1, #63
	bgt	.L66
	b	.L73
.L79:
	.align	2
.L78:
	.word	mario
	.word	jumped
	.word	shadowOAM
	.word	lvl
	.word	fallen
	.word	jumpCount
	.word	cheat
	.size	leftMario, .-leftMario
	.align	2
	.global	climbMario
	.syntax unified
	.arm
	.fpu softvfp
	.type	climbMario, %function
climbMario:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L86
	ldr	r2, .L86+4
	ldrh	r3, [r3, #48]
	ldr	r1, [r2, #8]
	tst	r3, #64
	ldr	r3, [r2]
	subeq	r3, r3, r1
	addne	r3, r3, r1
	cmp	r3, #42
	cmpne	r3, #90
	moveq	r0, #1
	ldreq	r1, .L86+8
	str	lr, [sp, #-4]!
	streq	r0, [r1]
	ldr	r1, [r2, #4]
	mvn	r1, r1, lsl #17
	moveq	lr, #3
	moveq	ip, #0
	mvn	r1, r1, lsr #17
	subeq	r3, r3, #28
	streq	lr, [r2, #32]
	strne	r3, [r2]
	streq	r3, [r2]
	streq	ip, [r2, #36]
	ldr	r2, [r2, #40]
	ldr	r0, .L86+12
	lsl	r2, r2, #7
	add	r2, r2, #8
	strh	r1, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	strh	r3, [r0]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L87:
	.align	2
.L86:
	.word	67109120
	.word	mario
	.word	canTurn
	.word	shadowOAM
	.size	climbMario, .-climbMario
	.align	2
	.global	updatePrincess
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePrincess, %function
updatePrincess:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L99
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	ldm	r4, {r2, r3}
	sub	sp, sp, #20
	ldr	r0, .L99+4
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r5, .L99+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L89
	ldr	r3, .L99+12
	ldr	r2, [r3]
	cmp	r2, #1
	beq	.L98
	mov	r2, #1
	ldr	r3, .L99+16
	str	r2, [r3]
.L89:
	ldr	r2, [r4, #24]
	ldr	r3, .L99+20
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #1
	sub	r3, r2, r3, lsl #3
	cmp	r3, #11
	movgt	r3, #1
	movle	r3, #0
	ldr	r1, [r4]
	strle	r3, [r4, #40]
	addgt	r1, r1, r3
	strgt	r3, [r4, #40]
	ldr	r3, [r4, #4]
	mvn	r3, r3, lsl #17
	movle	ip, #12
	movgt	ip, #140
	mvn	r3, r3, lsr #17
	ldr	r0, .L99+24
	suble	r1, r1, #1
	add	r2, r2, #1
	strle	r1, [r4]
	strgt	r1, [r4]
	str	r2, [r4, #24]
	strh	r3, [r0, #10]	@ movhi
	strh	r1, [r0, #8]	@ movhi
	strh	ip, [r0, #12]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L98:
	ldr	r1, .L99+28
	ldr	r2, [r1]
	mov	r0, #2
	cmp	r2, #98
	addle	r2, r2, #1
	strle	r2, [r1]
	mov	r2, #1
	str	r0, [r3]
	ldr	r3, .L99+32
	str	r2, [r3]
	b	.L89
.L100:
	.align	2
.L99:
	.word	princess
	.word	mario
	.word	collision
	.word	lvl
	.word	won2
	.word	715827883
	.word	shadowOAM
	.word	pts
	.word	won
	.size	updatePrincess, .-updatePrincess
	.global	__aeabi_idivmod
	.align	2
	.global	updateDK
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDK, %function
updateDK:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L109
	ldr	r4, .L109+4
	ldr	r6, [r5, #24]
	smull	r2, r3, r4, r6
	asr	r4, r6, #31
	rsb	r4, r4, r3, asr #4
	add	r4, r4, r4, lsl #3
	subs	r4, r6, r4, lsl #3
	ldr	r1, [r5, #40]
	bne	.L102
	add	r0, r1, #1
	ldr	r3, .L109+8
	ldr	r1, [r5, #48]
	mov	lr, pc
	bx	r3
	cmp	r1, #2
	str	r1, [r5, #40]
	beq	.L107
.L102:
	ldr	r2, [r5, #4]
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r0, .L109+12
	ldr	ip, [r5]
	lsl	r1, r1, #7
	add	r3, r6, #1
	add	r1, r1, #16
	str	r3, [r5, #24]
	strh	r1, [r0, #20]	@ movhi
	strh	ip, [r0, #16]	@ movhi
	strh	r2, [r0, #18]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L107:
	ldr	r0, .L109+16
	mov	r3, r0
.L104:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	beq	.L108
	add	r4, r4, #1
	cmp	r4, #4
	add	r3, r3, #60
	bne	.L104
	b	.L102
.L108:
	mov	ip, #37
	mov	r2, #1
	mov	r3, #56
	rsb	r4, r4, r4, lsl #4
	str	ip, [r0, r4, lsl #2]
	add	r4, r0, r4, lsl #2
	str	r2, [r4, #52]
	str	r3, [r4, #4]
	b	.L102
.L110:
	.align	2
.L109:
	.word	dk
	.word	954437177
	.word	__aeabi_idivmod
	.word	shadowOAM
	.word	barrel
	.size	updateDK, .-updateDK
	.align	2
	.global	updateHammer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHammer, %function
updateHammer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L128
	ldr	r3, [r4, #24]
	ldr	r1, .L128+4
	ldr	r2, .L128+8
	add	r3, r3, #1
	mla	r2, r3, r2, r1
	ldr	r1, .L128+12
	cmp	r2, r1
	str	r3, [r4, #24]
	sub	sp, sp, #16
	bhi	.L112
	ldr	r3, [r4, #48]
	ldr	r2, [r4, #40]
	sub	r3, r3, #1
	cmp	r2, r3
	movge	r3, #0
	addlt	r2, r2, #1
	strlt	r2, [r4, #40]
	strge	r3, [r4, #40]
.L112:
	ldr	r5, .L128+16
	ldr	ip, [r4, #16]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r6, [r4, #20]
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	r6, .L128+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L114
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L126
.L115:
	mov	r2, #512
	ldr	r3, .L128+24
	strh	r2, [r3, #24]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L126:
	mov	r1, #1
	ldr	r3, .L128+28
	ldr	r3, [r3]
	ldr	r2, .L128+32
	cmp	r3, r1
	str	r1, [r2]
	bne	.L116
	ldr	r6, .L128+36
	ldr	r3, [r6]
	cmp	r3, #0
	bgt	.L117
	mov	r2, #112
	ldr	r3, .L128+40
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	mov	r1, #400
	ldr	r2, .L128+44
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	rsb	r3, r3, r3, lsl #4
	ldr	r2, [r6]
	sub	r3, r0, r3, lsl #3
	add	r3, r3, #50
	add	r2, r2, #1
	str	r3, [r4, #4]
	str	r2, [r6]
	str	r1, [r5, #56]
.L114:
	ldr	r3, [r4, #52]
	cmp	r3, #1
	bne	.L115
	ldr	r2, [r4, #4]
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r3, [r4, #40]
	ldr	r1, .L128+24
	ldr	r0, [r4]
	lsl	r3, r3, #7
	add	r3, r3, #24
	strh	r2, [r1, #26]	@ movhi
	strh	r0, [r1, #24]	@ movhi
	strh	r3, [r1, #28]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L116:
	cmp	r3, #2
	beq	.L127
.L117:
	mov	r2, #0
	mov	r3, #400
	str	r2, [r4, #52]
	str	r3, [r5, #56]
	b	.L115
.L127:
	ldr	r6, .L128+36
	ldr	r3, [r6]
	cmp	r3, #0
	bgt	.L117
	mov	r2, #64
	ldr	r3, .L128+40
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	mov	r1, #400
	ldr	r2, .L128+48
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	add	r3, r3, r3, lsl #2
	ldr	r2, [r6]
	rsb	r3, r3, r3, lsl #3
	sub	r3, r0, r3, lsl #2
	add	r3, r3, #60
	add	r2, r2, #1
	str	r3, [r4, #4]
	str	r2, [r6]
	str	r1, [r5, #56]
	b	.L114
.L129:
	.align	2
.L128:
	.word	hammer
	.word	47721858
	.word	-1527099483
	.word	95443716
	.word	mario
	.word	collision
	.word	shadowOAM
	.word	lvl
	.word	cheat
	.word	numHammers
	.word	rand
	.word	-2004318071
	.word	-368140053
	.size	updateHammer, .-updateHammer
	.align	2
	.global	updateBarrel
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBarrel, %function
updateBarrel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L151
	ldr	r5, .L151+4
	ldr	r10, .L151+8
	ldr	r6, .L151+12
	ldr	r9, .L151+16
	ldr	r8, .L151+20
	ldr	fp, .L151+24
	sub	sp, sp, #20
	add	r7, r4, #240
.L145:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	moveq	r3, #512
	strheq	r3, [r5, #40]	@ movhi
	beq	.L144
	ldr	r2, [r4, #24]
	add	r2, r2, #1
	smull	r3, r1, r10, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #2
	str	r2, [r4, #24]
	bne	.L132
	ldr	r2, [r4, #48]
	ldr	r1, [r4, #40]
	sub	r2, r2, #1
	cmp	r1, r2
	addlt	r1, r1, #1
	strlt	r1, [r4, #40]
	strge	r3, [r4, #40]
.L132:
	ldr	r3, [r4]
	cmp	r3, #133
	cmpne	r3, #37
	ldr	r2, [r4, #4]
	movne	r1, r2
	ldr	r0, [r4, #16]
	addeq	r1, r2, #1
	rsb	ip, r0, #240
	moveq	r2, r1
	streq	r1, [r4, #4]
	cmp	r3, #99
	cmple	ip, r1
	beq	.L136
	cmp	r1, #0
	bne	.L137
.L136:
	add	r3, r3, #1
	str	r3, [r4]
.L137:
	cmp	r3, #85
	subeq	r2, r1, #1
	streq	r2, [r4, #4]
	cmp	r2, #239
	movgt	r1, #0
	strgt	r1, [r4, #52]
	ldr	r1, [r4, #20]
	stm	sp, {r2, r3}
	str	r0, [sp, #8]
	str	r1, [sp, #12]
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r6]
	ldr	r0, [r6, #4]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L142
	ldr	r3, [fp]
	cmp	r3, #0
	beq	.L142
	mov	r2, #0
	ldr	r1, .L151+28
	ldr	r3, [r1]
	cmp	r3, #98
	addle	r3, r3, #1
	str	r2, [r4, #52]
	strle	r3, [r1]
.L142:
	ldr	r3, [r4, #40]
	lsl	r3, r3, #7
	add	r3, r3, #20
	ldr	r2, [r4, #4]
	strh	r3, [r5, #44]	@ movhi
	ldr	r3, [r4]
	orr	r2, r2, r8
	strh	r2, [r5, #42]	@ movhi
	strh	r3, [r5, #40]	@ movhi
.L144:
	add	r4, r4, #60
	cmp	r4, r7
	add	r5, r5, #8
	bne	.L145
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L152:
	.align	2
.L151:
	.word	barrel
	.word	shadowOAM
	.word	1717986919
	.word	mario
	.word	collision
	.word	-32768
	.word	cheat
	.word	pts
	.size	updateBarrel, .-updateBarrel
	.align	2
	.global	ladderPosUP
	.syntax unified
	.arm
	.fpu softvfp
	.type	ladderPosUP, %function
ladderPosUP:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L163
	ldr	r3, [r2, #4]
	sub	r1, r3, #7
	cmp	r1, #10
	bhi	.L154
	ldr	r1, [r2]
	sub	r1, r1, #91
	cmp	r1, #20
	bls	.L158
.L154:
	ldr	r1, [r2, #16]
	rsb	r0, r1, #222
	cmp	r3, r0
	ble	.L156
	rsb	r0, r1, #234
	cmp	r3, r0
	bge	.L156
	ldr	r0, [r2]
	sub	r0, r0, #43
	cmp	r0, #20
	bls	.L158
.L156:
	ldr	r0, .L163+4
	ldr	r0, [r0]
	cmp	r0, #2
	beq	.L162
.L161:
	mov	r0, #0
	bx	lr
.L162:
	rsb	r0, r1, #150
	cmp	r3, r0
	ble	.L161
	rsb	r1, r1, #162
	cmp	r3, r1
	bge	.L161
	ldr	r0, [r2]
	sub	r0, r0, #91
	cmp	r0, #20
	movhi	r0, #0
	movls	r0, #1
	bx	lr
.L158:
	mov	r0, #1
	bx	lr
.L164:
	.align	2
.L163:
	.word	mario
	.word	lvl
	.size	ladderPosUP, .-ladderPosUP
	.align	2
	.global	ladderPosDOWN
	.syntax unified
	.arm
	.fpu softvfp
	.type	ladderPosDOWN, %function
ladderPosDOWN:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L175
	ldr	r3, [r2, #4]
	sub	r1, r3, #7
	cmp	r1, #10
	bhi	.L166
	ldr	r1, [r2]
	sub	r1, r1, #90
	cmp	r1, #19
	bls	.L170
.L166:
	ldr	r1, [r2, #16]
	rsb	r0, r1, #222
	cmp	r3, r0
	ble	.L168
	rsb	r0, r1, #234
	cmp	r3, r0
	bge	.L168
	ldr	r0, [r2]
	sub	r0, r0, #42
	cmp	r0, #19
	bls	.L170
.L168:
	ldr	r0, .L175+4
	ldr	r0, [r0]
	cmp	r0, #2
	beq	.L174
.L173:
	mov	r0, #0
	bx	lr
.L174:
	rsb	r0, r1, #150
	cmp	r3, r0
	ble	.L173
	rsb	r1, r1, #162
	cmp	r3, r1
	bge	.L173
	ldr	r0, [r2]
	sub	r0, r0, #90
	cmp	r0, #19
	movhi	r0, #0
	movls	r0, #1
	bx	lr
.L170:
	mov	r0, #1
	bx	lr
.L176:
	.align	2
.L175:
	.word	mario
	.word	lvl
	.size	ladderPosDOWN, .-ladderPosDOWN
	.align	2
	.global	oBcheck
	.syntax unified
	.arm
	.fpu softvfp
	.type	oBcheck, %function
oBcheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L197
	ldr	r2, .L197+4
	ldr	r3, [r3]
	ldr	r2, [r2]
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	lr, .L197+8
	orrs	r3, r3, r2
	streq	r3, [lr]
	bne	.L196
.L179:
	mov	r5, #0
	mov	r7, r5
	ldr	r2, .L197+12
	ldr	r6, .L197+16
	ldr	r4, [r2]
	ldr	r3, .L197+20
	ldr	r0, [r2, #4]
	ldr	r9, [r6]
	add	r8, r4, #49
	add	ip, r3, #240
.L182:
	ldr	r2, [r3, #4]
	add	r1, r2, #4
	cmp	r0, r1
	sub	r2, r2, #4
	bgt	.L181
	cmp	r0, r2
	blt	.L181
	ldr	r2, [r3]
	cmp	r4, r2
	bge	.L181
	cmp	r2, r8
	bgt	.L181
	cmp	r9, #98
	bgt	.L181
	ldr	r2, [r3, #52]
	cmp	r2, #0
	movne	r5, #1
	movne	r7, r5
	addne	r9, r9, r5
.L181:
	add	r3, r3, #60
	cmp	r3, ip
	bne	.L182
	cmp	r7, #0
	strne	r9, [r6]
	strne	r5, [lr]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L196:
	ldr	r3, [lr]
	cmp	r3, #0
	beq	.L179
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L198:
	.align	2
.L197:
	.word	fallen
	.word	jumped
	.word	overBarrel
	.word	mario
	.word	pts
	.word	barrel
	.size	oBcheck, .-oBcheck
	.align	2
	.global	updateMario
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMario, %function
updateMario:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, .L292
	ldr	r3, [r4, #32]
	cmp	r3, #2
	sub	sp, sp, #20
	beq	.L200
	ldr	r2, [r4, #36]
	cmp	r2, #2
	bne	.L287
.L201:
	ldr	r2, [r4, #56]
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r4, #56]
	cmp	r3, #3
	bne	.L229
.L203:
	ldr	r3, [r4, #24]
	ands	r3, r3, #3
	bne	.L204
	ldr	r2, [r4, #48]
	ldr	r1, [r4, #40]
	sub	r2, r2, #1
	cmp	r1, r2
	addlt	r1, r1, #1
	strlt	r1, [r4, #40]
	strge	r3, [r4, #40]
.L204:
	ldr	r3, [r4, #28]
	ldr	r2, .L292+4
	smull	r0, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, lsl #1
	sub	r3, r3, r2, lsl #3
	cmp	r3, #11
	movle	r3, #0
	movgt	r3, #1
	ldr	r2, .L292+8
	ldrh	r1, [r2, #48]
	ldr	r2, .L292+12
	tst	r1, #64
	str	r3, [r4, #44]
	ldrh	r5, [r2]
	beq	.L206
	tst	r5, #64
	beq	.L207
	ldr	r3, .L292+16
	ldrh	r3, [r3]
	tst	r3, #64
	bne	.L207
.L206:
	bl	ladderPosUP
	cmp	r0, #0
	beq	.L207
	ldr	r3, .L292+20
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L207
.L208:
	mov	r2, #0
	mov	r1, #2
	str	r2, [r3]
	ldr	r3, .L292+8
	ldrh	r3, [r3, #48]
	ldr	r0, .L292+24
	str	r1, [r4, #32]
	str	r1, [r4, #48]
	ldr	r1, .L292+28
	tst	r3, #32
	str	r2, [r0]
	str	r2, [r1]
	beq	.L288
.L212:
	ldr	r3, .L292+8
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	bne	.L213
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #16]
	add	r2, r2, r1
	cmp	r2, #240
	ble	.L289
.L213:
	tst	r5, #2
	beq	.L214
	ldr	r3, .L292+16
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L214
.L215:
	ldr	r1, .L292+24
	ldr	r2, .L292+28
	ldr	r3, [r1]
	ldr	r2, [r2]
	orrs	r3, r3, r2
	beq	.L290
.L216:
	ldr	r5, .L292+32
	ldr	r7, .L292+36
	ldr	r9, .L292+40
	ldr	r8, .L292+44
	add	r6, r5, #240
.L220:
	ldr	r3, [r5, #52]
	cmp	r3, #0
	bne	.L291
.L218:
	add	r5, r5, #60
	cmp	r6, r5
	bne	.L220
	ldr	r3, [r4, #32]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L221
.L223:
	.word	.L226
	.word	.L225
	.word	.L224
	.word	.L222
.L200:
	ldr	r2, [r4, #56]
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r4, #56]
.L229:
	mov	r2, #3
	str	r3, [r4, #36]
	str	r2, [r4, #32]
	b	.L203
.L207:
	ldr	r3, .L292+8
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L209
	tst	r5, #128
	beq	.L210
	ldr	r3, .L292+16
	ldrh	r3, [r3]
	tst	r3, #128
	beq	.L209
.L210:
	mov	r3, #3
	str	r3, [r4, #48]
	ldr	r3, .L292+8
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L212
.L288:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L212
	ldr	r3, .L292+48
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L212
	ldr	r3, [r4, #36]
	cmp	r3, #2
	movne	r3, #1
	strne	r3, [r4, #32]
	b	.L212
.L209:
	bl	ladderPosDOWN
	cmp	r0, #0
	beq	.L210
	ldr	r3, .L292+20
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L210
	b	.L208
.L214:
	ldr	r3, .L292+8
	ldrh	r3, [r3, #48]
	tst	r3, #2
	bne	.L216
	b	.L215
.L291:
	add	r0, r5, #16
	ldm	r5, {r1, r3}
	ldm	r0, {r0, ip}
	ldr	r2, [r4, #16]
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	str	r3, [sp]
	str	ip, [sp, #12]
	ldr	r3, [r4, #20]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	sub	r2, r2, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L218
	ldr	r3, [r9]
	cmp	r3, #0
	ldreq	r2, [r8]
	subeq	r2, r2, #1
	streq	r3, [r5, #52]
	streq	r2, [r8]
	b	.L218
.L226:
	bl	rightMario
	ldr	r3, [r4, #32]
.L227:
	cmp	r3, #3
	beq	.L228
.L221:
	ldr	r3, [r4, #24]
	add	r3, r3, #1
	str	r3, [r4, #24]
.L228:
	ldr	r3, [r4, #28]
	add	r3, r3, #1
	str	r3, [r4, #28]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L287:
	bl	oBcheck
	ldr	r3, [r4, #32]
	b	.L201
.L289:
	ldr	r2, .L292+48
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L213
	ldr	r2, [r4, #36]
	cmp	r2, #2
	strne	r3, [r4, #32]
	b	.L213
.L224:
	bl	climbMario
	ldr	r3, [r4, #32]
	b	.L227
.L225:
	bl	leftMario
	ldr	r3, [r4, #32]
	b	.L227
.L222:
	bl	idleMario
	ldr	r3, [r4, #32]
	b	.L227
.L290:
	ldr	r2, .L292+48
	ldr	r2, [r2]
	cmp	r2, #0
	movne	r0, #1
	ldrne	r2, .L292+20
	strne	r0, [r1]
	strne	r3, [r2]
	b	.L216
.L293:
	.align	2
.L292:
	.word	mario
	.word	715827883
	.word	67109120
	.word	oldButtons
	.word	buttons
	.word	jumpCount
	.word	jumped
	.word	fallen
	.word	barrel
	.word	collision
	.word	cheat
	.word	lives
	.word	canTurn
	.size	updateMario, .-updateMario
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
	push	{r4, lr}
	bl	updateMario
	bl	updatePrincess
	bl	updateDK
	bl	updateHammer
	bl	updateBarrel
	ldr	r2, .L297
	ldr	r1, .L297+4
	ldr	r3, [r2]
	ldr	r1, [r1, #56]
	add	r3, r3, #1
	cmp	r1, #0
	str	r3, [r2]
	ldreq	r3, .L297+8
	ldr	r4, .L297+12
	streq	r1, [r3]
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L297+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L298:
	.align	2
.L297:
	.word	timer
	.word	mario
	.word	cheat
	.word	DMANow
	.word	shadowOAM
	.size	updateGame, .-updateGame
	.comm	barrel,240,4
	.comm	hammer,120,4
	.comm	dk,60,4
	.comm	princess,60,4
	.comm	mario,60,4
	.comm	shadowOAM,1024,4
	.comm	overBarrel,4,4
	.comm	numHammers,4,4
	.comm	pts,4,4
	.comm	lives,4,4
	.comm	canTurn,4,4
	.comm	jumpCount,4,4
	.comm	fallen,4,4
	.comm	lvl,4,4
	.comm	won2,4,4
	.comm	won,4,4
	.comm	cheat,4,4
	.comm	jumped,4,4
	.comm	timer,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
