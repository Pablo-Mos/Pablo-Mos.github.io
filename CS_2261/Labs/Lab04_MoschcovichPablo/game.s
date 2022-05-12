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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall.part.0, %function
updateBall.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r2, [r0]
	cmp	r2, #0
	ldr	ip, [r0, #16]
	sub	sp, sp, #16
	ble	.L2
	ldr	r3, [r0, #24]
	add	r3, r2, r3
	cmp	r3, #120
	bgt	.L2
.L3:
	ldr	r3, [r0, #4]
	cmp	r3, #0
	ldr	r1, [r0, #20]
	ble	.L4
	ldr	lr, [r0, #28]
	add	lr, r3, lr
	cmp	lr, #239
	bgt	.L4
.L5:
	add	r2, r2, ip
	add	r3, r3, r1
	ldr	r5, .L22
	stm	r0, {r2, r3}
	ldr	r6, .L22+4
	ldr	r9, .L22+8
	ldr	r10, .L22+12
	add	r8, r5, #200
.L6:
	mov	r7, #0
	ldr	r4, .L22+16
.L10:
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L8
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L21
.L8:
	add	r4, r4, #44
	cmp	r6, r4
	bne	.L10
	add	r5, r5, #40
	cmp	r5, r8
	bne	.L6
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L4:
	rsb	r1, r1, #0
	str	r1, [r0, #20]
	b	.L5
.L2:
	rsb	ip, ip, #0
	str	ip, [r0, #16]
	b	.L3
.L21:
	add	r0, r4, #24
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r5, #24]
	ldr	r3, [r5, #20]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	ldrne	r3, [r10]
	subne	r3, r3, #1
	strne	r7, [r5, #32]
	strne	r7, [r4, #36]
	strne	r3, [r10]
	b	.L8
.L23:
	.align	2
.L22:
	.word	bullets
	.word	balls+220
	.word	collision
	.word	ballsRemaining
	.word	balls
	.size	updateBall.part.0, .-updateBall.part.0
	.align	2
	.global	drawBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBar, %function
drawBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L26
	sub	sp, sp, #8
	str	r2, [sp]
	mov	r3, #3
	mov	r2, #240
	mov	r1, #120
	mov	r0, #0
	ldr	r4, .L26+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	26577
	.word	drawRect
	.size	drawBar, .-drawBar
	.align	2
	.global	initCannon
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCannon, %function
initCannon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #140
	mov	r5, #1
	mov	r4, #10
	mov	lr, #5
	mov	r2, #118
	mvn	ip, #49664
	mov	r0, #20
	ldr	r3, .L30
	str	r5, [r3, #16]
	str	r4, [r3, #20]
	str	lr, [r3, #24]
	str	r1, [r3]
	str	r1, [r3, #8]
	strh	ip, [r3, #28]	@ movhi
	str	r0, [r3, #32]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	pop	{r4, r5, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	cannon
	.size	initCannon, .-initCannon
	.align	2
	.global	drawCannon
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCannon, %function
drawCannon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, lr}
	ldr	r4, .L34
	sub	sp, sp, #12
	str	r3, [sp]
	ldr	r2, [r4, #24]
	ldr	r3, [r4, #20]
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	ldr	r5, .L34+4
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #20]
	str	r2, [sp]
	ldr	r1, [r4]
	ldr	r2, [r4, #24]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	cannon
	.word	drawRect
	.size	drawCannon, .-drawCannon
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r2, #0
	mov	r7, #2
	mov	r6, #1
	mvn	r5, #1
	mvn	r4, #2
	mvn	lr, #32768
	ldr	r1, .L40
	ldr	r3, .L40+4
	ldr	ip, [r1]
	ldr	r0, [r1, #4]
	add	r1, r3, #200
.L37:
	str	r7, [r3, #20]
	str	r6, [r3, #24]
	str	r5, [r3]
	str	r0, [r3, #12]
	str	r4, [r3, #16]
	strh	lr, [r3, #28]	@ movhi
	str	r2, [r3, #32]
	stmib	r3, {r2, ip}
	add	r3, r3, #40
	cmp	r3, r1
	bne	.L37
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	cannon
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L53
	mov	r2, r0
	ldr	r1, [r2, #32]
	cmp	r1, #0
	mov	r3, #0
	beq	.L52
.L43:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #40
	bxeq	lr
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L43
.L52:
	push	{r4, r5, r6, lr}
	mov	r5, #1
	ldr	r4, .L53+4
	add	r3, r3, r3, lsl #2
	ldr	r2, [r4, #24]
	ldr	r6, [r4]
	add	ip, r0, r3, lsl #3
	add	lr, r2, r2, lsr #31
	str	r6, [r0, r3, lsl #3]
	ldr	r2, [r4, #4]
	ldr	r3, [ip, #24]
	add	r2, r2, lr, asr r5
	add	r3, r3, r3, lsr #31
	add	r3, r2, r3, asr r5
	str	r5, [ip, #32]
	str	r1, [ip, #36]
	str	r3, [ip, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	bullets
	.word	cannon
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updateCannon
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCannon, %function
updateCannon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L66
	ldrh	r3, [r3, #48]
	tst	r3, #32
	push	{r4, lr}
	ldr	r4, .L66+4
	bne	.L56
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	cmp	r3, r2
	subge	r3, r3, r2
	strge	r3, [r4, #4]
	blt	.L56
.L57:
	ldr	r3, .L66+8
	ldrh	r3, [r3]
	tst	r3, #2
	ldr	r3, [r4, #32]
	beq	.L65
	ldr	r2, .L66+12
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L60
.L65:
	add	r3, r3, #1
.L59:
	str	r3, [r4, #32]
	pop	{r4, lr}
	bx	lr
.L56:
	ldr	r3, .L66
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L57
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #16]
	ldr	r3, [r4, #24]
	rsb	r0, r1, #240
	add	r3, r2, r3
	cmp	r3, r0
	addle	r2, r2, r1
	strle	r2, [r4, #4]
	b	.L57
.L60:
	cmp	r3, #19
	ble	.L65
	bl	fireBullet
	mov	r3, #1
	b	.L59
.L67:
	.align	2
.L66:
	.word	67109120
	.word	cannon
	.word	oldButtons
	.word	buttons
	.size	updateCannon, .-updateCannon
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
	push	{r4, r5, r6, lr}
	bl	updateCannon
	mov	r0, #0
	ldr	r3, .L81
	add	r1, r3, #200
.L72:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L70
	ldr	r2, [r3]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3]
	strlt	r0, [r3, #32]
.L70:
	add	r3, r3, #40
	cmp	r3, r1
	bne	.L72
	ldr	r4, .L81+4
	add	r5, r4, #220
.L74:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	movne	r0, r4
	blne	updateBall.part.0
.L73:
	add	r4, r4, #44
	cmp	r4, r5
	bne	.L74
	pop	{r4, r5, r6, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	bullets
	.word	balls
	.size	updateGame, .-updateGame
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0]
	movlt	r3, #0
	strlt	r3, [r0, #32]
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #32]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L91
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L92
.L89:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L92:
	str	r3, [sp]
	ldr	r5, .L93
	ldr	r3, [r0, #20]
	ldr	r2, [r0, #24]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L89
.L91:
	mov	r2, #0
	ldr	r3, [r0, #20]
	str	r2, [sp]
	ldr	r5, .L93
	ldr	r2, [r0, #24]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #20]
	str	r2, [sp]
	ldr	r2, [r4, #24]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	b	.L89
.L94:
	.align	2
.L93:
	.word	drawRect
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBalls, %function
initBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L99
	ldr	r5, .L99+4
	ldr	r9, .L99+8
	ldr	r8, .L99+12
	ldr	r7, .L99+16
	add	r6, r4, #220
.L96:
	mov	r3, #10
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r9, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r0, r0, r3, lsl #1
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	mov	r2, #1
	mov	r1, #0
	smull	r3, ip, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl r2
	ldr	r3, [r4]
	add	r0, r0, #10
	strh	r7, [r4, #32]	@ movhi
	str	r0, [r4, #4]
	str	r0, [r4, #12]
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	str	r2, [r4, #36]
	str	r1, [r4, #40]
	str	r3, [r4, #8]
	add	r4, r4, #44
	cmp	r4, r6
	bne	.L96
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L100:
	.align	2
.L99:
	.word	balls
	.word	rand
	.word	156180629
	.word	2114445439
	.word	18367
	.size	initBalls, .-initBalls
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #140
	ldr	r2, .L105
	mov	r6, r8
	str	r8, [r2]
	str	r8, [r2, #8]
	mvn	r8, #49664
	mov	r9, #1
	mov	r7, #118
	strh	r8, [r2, #28]	@ movhi
	mov	fp, #10
	mov	r10, #5
	mov	r8, #20
	mov	r4, r9
	mov	lr, #2
	mvn	ip, #1
	mov	r3, #0
	mvn	r0, #2
	mvn	r1, #32768
	str	r7, [r2, #4]
	str	r7, [r2, #12]
	mov	r5, r7
	ldr	r7, .L105+4
	str	fp, [r2, #20]
	str	r10, [r2, #24]
	str	r8, [r2, #32]
	str	r9, [r2, #16]
	add	r2, r7, #200
.L102:
	str	lr, [r7, #20]
	str	r4, [r7, #24]
	str	ip, [r7]
	str	r5, [r7, #12]
	str	r0, [r7, #16]
	strh	r1, [r7, #28]	@ movhi
	str	r3, [r7, #32]
	stmib	r7, {r3, r6}
	add	r7, r7, #40
	cmp	r7, r2
	bne	.L102
	bl	initBalls
	mov	r2, #5
	ldr	r3, .L105+8
	str	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L106:
	.align	2
.L105:
	.word	cannon
	.word	bullets
	.word	ballsRemaining
	.size	initGame, .-initGame
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	b	updateBall.part.0
	.size	updateBall, .-updateBall
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
	push	{r4, r5, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L113
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L114
.L111:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L114:
	str	r3, [sp]
	ldr	r5, .L115
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L111
.L113:
	mov	r2, #0
	ldr	r3, [r0, #24]
	str	r2, [sp]
	ldr	r5, .L115
	ldr	r2, [r0, #28]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	b	.L111
.L116:
	.align	2
.L115:
	.word	drawRect
	.size	drawBall, .-drawBall
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #12
	bl	drawCannon
	ldr	r3, .L119
	ldr	r5, .L119+4
	mov	r2, #240
	mov	r1, #120
	str	r3, [sp]
	mov	r0, #0
	mov	r3, #3
	ldr	r4, .L119+8
	mov	lr, pc
	bx	r4
	mov	r0, r5
	bl	drawBullet
	add	r0, r5, #40
	bl	drawBullet
	add	r0, r5, #80
	ldr	r4, .L119+12
	bl	drawBullet
	add	r0, r5, #120
	bl	drawBullet
	add	r0, r5, #160
	bl	drawBullet
	mov	r0, r4
	bl	drawBall
	add	r0, r4, #44
	bl	drawBall
	add	r0, r4, #88
	bl	drawBall
	add	r0, r4, #132
	bl	drawBall
	add	r0, r4, #176
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	drawBall
.L120:
	.align	2
.L119:
	.word	26577
	.word	bullets
	.word	drawRect
	.word	balls
	.size	drawGame, .-drawGame
	.comm	ballsRemaining,4,4
	.comm	balls,220,4
	.comm	bullets,200,4
	.comm	cannon,36,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
