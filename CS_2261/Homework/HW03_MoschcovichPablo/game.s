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
	.type	updateWave.part.0, %function
updateWave.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, r0
	push	{r4, lr}
	ldr	r0, [r0, #4]
	cmp	r0, #0
	ldr	r2, [r1, #24]
	ldr	ip, [r1, #16]
	sub	sp, sp, #16
	ble	.L2
	add	r3, r0, r2
	cmp	r3, #239
	ble	.L3
.L2:
	rsb	ip, ip, #0
	str	ip, [r1, #16]
.L3:
	ldr	r3, .L10
	ldr	r4, [r3, #24]
	add	r0, r0, ip
	ldr	lr, [r3, #28]
	str	r0, [r1, #4]
	str	r4, [sp, #12]
	ldr	ip, [r3]
	ldr	r3, [r3, #4]
	stm	sp, {r3, ip, lr}
	ldr	r4, .L10+4
	ldr	r3, [r1, #20]
	ldr	r1, [r1]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L10+8
	strne	r2, [r3]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	player
	.word	collision
	.word	dead
	.size	updateWave.part.0, .-updateWave.part.0
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #80
	mov	r0, #120
	mov	r1, #1
	mov	r2, #5
	str	lr, [sp, #-4]!
	ldr	r3, .L14
	ldr	lr, .L14+4
	str	ip, [r3]
	strh	lr, [r3, #32]	@ movhi
	str	ip, [r3, #8]
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	ldr	lr, [sp], #4
	bx	lr
.L15:
	.align	2
.L14:
	.word	player
	.word	351
	.size	initPlayer, .-initPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L21
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L17
	ldr	r3, .L21+4
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #20]
	cmp	r2, r1
	subge	r2, r2, r1
	strge	r2, [r3, #4]
.L17:
	ldr	r3, .L21
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L18
	ldr	r3, .L21+4
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #20]
	ldr	r2, [r3, #28]
	rsb	ip, r0, #240
	add	r2, r1, r2
	cmp	r2, ip
	addle	r1, r1, r0
	strle	r1, [r3, #4]
.L18:
	ldr	r3, .L21
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L19
	ldr	r3, .L21+4
	ldr	r1, [r3]
	ldr	r0, [r3, #16]
	ldr	r2, [r3, #24]
	rsb	ip, r0, #160
	add	r2, r1, r2
	cmp	r2, ip
	addle	r1, r1, r0
	strle	r1, [r3]
.L19:
	ldr	r3, .L21
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bxne	lr
	ldr	r3, .L21+4
	ldr	r2, [r3]
	ldr	r1, [r3, #16]
	cmp	r2, r1
	subge	r2, r2, r1
	strge	r2, [r3]
	bx	lr
.L22:
	.align	2
.L21:
	.word	67109120
	.word	player
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #10240
	push	{r4, r5, r6, lr}
	ldr	r4, .L25
	sub	sp, sp, #8
	ldr	r6, .L25+4
	str	r3, [sp]
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r6
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r1, [r4]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	ldr	r5, .L25+8
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	r3, #1
	mov	r2, #3
	str	r5, [sp]
	add	r1, r1, #3
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	r2, r5
	ldr	r6, .L25+12
	add	r1, r1, #1
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	r2, r5
	add	r1, r1, #1
	add	r0, r0, #3
	mov	lr, pc
	bx	r6
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	player
	.word	drawRect
	.word	1023
	.word	setPixel
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initWaves
	.syntax unified
	.arm
	.fpu softvfp
	.type	initWaves, %function
initWaves:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L49
	mov	r5, #0
	mov	r4, r6
	ldr	r7, .L49+4
	ldr	fp, .L49+8
	ldr	r8, .L49+12
	ldr	r9, .L49+16
	ldr	r10, .L49+20
.L37:
	mov	r2, #10
	mov	r3, #2
	cmp	r5, #0
	str	r2, [r4, #20]
	str	r3, [r4, #24]
	beq	.L45
	cmp	r5, #1
	beq	.L46
	cmp	r5, #2
	beq	.L47
	cmp	r5, #3
	beq	.L48
	mov	lr, pc
	bx	r7
	smull	r3, r2, r9, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #120
	str	r0, [r6, #160]
	ldr	r3, [r4]
	ands	r3, r3, #1
	ldr	r1, [fp]
	ldr	r0, [fp, #4]
	beq	.L35
.L39:
	ldr	r3, [r4, #24]
	rsb	r3, r3, #238
.L35:
	mvn	ip, #1
	tst	r5, #1
	ldr	r2, .L49+24
	moveq	r2, r8
	str	r3, [r4, #4]
	str	r1, [r4, #8]
	str	r0, [r4, #12]
	str	ip, [r4, #16]
.L36:
	mov	r1, #1
	mov	r3, #0
	add	r5, r5, r1
	cmp	r5, #5
	strh	r2, [r4, #28]	@ movhi
	str	r1, [r4, #32]
	str	r3, [r4, #36]
	add	r4, r4, #40
	bne	.L37
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L45:
	mov	lr, pc
	bx	r7
	smull	r3, r2, r10, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #3
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3
	str	r0, [r6]
.L29:
	ldr	r3, [r4]
	ands	r3, r3, #1
	ldr	r1, [fp]
	ldr	r0, [fp, #4]
	bne	.L39
	mvn	r2, #1
	str	r3, [r4, #4]
	str	r2, [r4, #16]
	str	r1, [r4, #8]
	mov	r2, r8
	str	r0, [r4, #12]
	b	.L36
.L48:
	mov	lr, pc
	bx	r7
	smull	r3, r2, r10, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #90
	str	r0, [r6, #120]
.L31:
	ldr	r3, [r4]
	ands	r3, r3, #1
	ldr	r1, [fp]
	ldr	r0, [fp, #4]
	bne	.L39
	mvn	r2, #1
	str	r3, [r4, #4]
	str	r2, [r4, #16]
	str	r1, [r4, #8]
	str	r0, [r4, #12]
	ldr	r2, .L49+24
	b	.L36
.L46:
	mov	lr, pc
	bx	r7
	smull	r3, r2, r9, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #3
	add	r0, r0, #15
	str	r0, [r6, #40]
	b	.L31
.L47:
	mov	lr, pc
	bx	r7
	smull	r3, r2, r9, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #3
	add	r0, r0, #55
	str	r0, [r6, #80]
	b	.L29
.L50:
	.align	2
.L49:
	.word	waves
	.word	rand
	.word	player
	.word	32544
	.word	1717986919
	.word	-2004318071
	.word	32352
	.size	initWaves, .-initWaves
	.align	2
	.global	updateWave
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateWave, %function
updateWave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	updateWave.part.0
	.size	updateWave, .-updateWave
	.align	2
	.global	drawWave
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWave, %function
drawWave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #32]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L57
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L58
.L55:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L58:
	mov	r2, #10240
	ldr	r3, [r0, #20]
	str	r2, [sp]
	ldr	r5, .L59
	ldr	r2, [r0, #24]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L55
.L57:
	mov	r2, #10240
	ldr	r3, [r0, #20]
	str	r2, [sp]
	ldr	r5, .L59
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
	b	.L55
.L60:
	.align	2
.L59:
	.word	drawRect
	.size	drawWave, .-drawWave
	.global	__aeabi_idivmod
	.align	2
	.global	initFoods
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFoods, %function
initFoods:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r9, .L66
	ldr	r3, [r9]
	rsb	r3, r3, #15
	cmp	r3, #0
	ble	.L61
	mov	r5, #0
	mov	fp, #3
	mov	r10, #992
	ldr	r4, .L66+4
	ldr	r8, .L66+8
	ldr	r7, .L66+12
	ldr	r6, .L66+16
.L63:
	str	fp, [r4, #16]
	str	fp, [r4, #20]
	mov	lr, pc
	bx	r8
	ldr	r1, [r4, #16]
	rsb	r1, r1, #159
	mov	lr, pc
	bx	r7
	str	r1, [r4]
	mov	lr, pc
	bx	r8
	ldr	r1, [r4, #20]
	rsb	r1, r1, #239
	mov	lr, pc
	bx	r7
	mov	r0, #0
	mov	r2, #1
	ldr	r3, [r9]
	add	r5, r5, #1
	rsb	r3, r3, #15
	ldr	ip, [r6]
	cmp	r3, r5
	ldr	r3, [r6, #4]
	str	r1, [r4, #4]
	strh	r10, [r4, #24]	@ movhi
	str	r2, [r4, #28]
	str	r0, [r4, #32]
	str	ip, [r4, #8]
	str	r3, [r4, #12]
	add	r4, r4, #36
	bgt	.L63
.L61:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	dif
	.word	foods
	.word	rand
	.word	__aeabi_idivmod
	.word	player
	.size	initFoods, .-initFoods
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
	mov	ip, #80
	mov	r0, #120
	mov	r1, #1
	mov	r2, #5
	push	{r4, lr}
	ldr	r3, .L70
	ldr	lr, .L70+4
	str	ip, [r3]
	strh	lr, [r3, #32]	@ movhi
	str	ip, [r3, #8]
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	bl	initWaves
	pop	{r4, lr}
	b	initFoods
.L71:
	.align	2
.L70:
	.word	player
	.word	351
	.size	initGame, .-initGame
	.align	2
	.global	updateFood
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFood, %function
updateFood:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	ldr	r3, [r0, #28]
	cmp	r3, #0
	ldr	r0, [r0, #4]
	ldr	r1, [r5]
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #16]
	sub	sp, sp, #16
	bne	.L73
	ldr	r7, .L92
	ldr	r8, .L92+4
.L76:
	ldr	r4, .L92+8
	ldr	r6, .L92+12
	ldr	r10, .L92+16
	ldr	r9, .L92+20
.L74:
	ldr	lr, [r4, #20]
	ldr	ip, [r4, #24]
	str	lr, [sp, #12]
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	add	r4, r4, #40
	bne	.L89
	cmp	r4, r7
	add	r6, r6, #36
	beq	.L90
.L80:
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #16]
	b	.L74
.L89:
	mov	lr, pc
	bx	r10
	ldr	r1, [r6, #16]
	rsb	r1, r1, #159
	mov	lr, pc
	bx	r9
	str	r1, [r5]
	mov	lr, pc
	bx	r10
	ldr	r1, [r6, #20]
	rsb	r1, r1, #239
	mov	lr, pc
	bx	r9
	cmp	r4, r7
	str	r1, [r5, #4]
	add	r6, r6, #36
	bne	.L80
.L90:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L73:
	ldr	ip, .L92+24
	ldr	lr, [ip, #24]
	ldr	r4, [ip, #28]
	str	lr, [sp, #12]
	ldr	lr, [ip]
	ldr	ip, [ip, #4]
	ldr	r8, .L92+4
	stm	sp, {ip, lr}
	str	r4, [sp, #8]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L91
	mov	r0, #0
	ldr	r1, .L92+28
	ldr	r2, [r1]
	ldr	r3, .L92+8
	add	r2, r2, #1
	str	r2, [r1]
	str	r0, [r5, #28]
	add	r7, r3, #200
.L78:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	ldrne	r2, [r3, #20]
	addne	r2, r2, #5
	strne	r2, [r3, #20]
	add	r3, r3, #40
	cmp	r3, r7
	bne	.L78
	ldr	r0, [r5, #4]
	ldr	r1, [r5]
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #16]
	b	.L76
.L91:
	ldr	r0, [r5, #4]
	ldr	r1, [r5]
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #16]
	ldr	r7, .L92
	b	.L76
.L93:
	.align	2
.L92:
	.word	waves+200
	.word	collision
	.word	waves
	.word	foods
	.word	rand
	.word	__aeabi_idivmod
	.word	player
	.word	pts
	.size	updateFood, .-updateFood
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
	bl	updatePlayer
	ldr	r4, .L105
	add	r5, r4, #200
.L96:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	movne	r0, r4
	blne	updateWave.part.0
.L95:
	add	r4, r4, #40
	cmp	r4, r5
	bne	.L96
	ldr	r6, .L105+4
	ldr	r3, [r6]
	rsb	r3, r3, #15
	cmp	r3, #0
	ble	.L94
	mov	r5, #0
	ldr	r4, .L105+8
.L98:
	mov	r0, r4
	bl	updateFood
	ldr	r3, [r6]
	add	r5, r5, #1
	rsb	r3, r3, #15
	cmp	r3, r5
	add	r4, r4, #36
	bgt	.L98
.L94:
	pop	{r4, r5, r6, lr}
	bx	lr
.L106:
	.align	2
.L105:
	.word	waves
	.word	dif
	.word	foods
	.size	updateGame, .-updateGame
	.align	2
	.global	drawFood
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFood, %function
drawFood:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #28]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L111
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L112
.L109:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L112:
	mov	r2, #10240
	ldr	r3, [r0, #16]
	str	r2, [sp]
	ldr	r5, .L113
	ldr	r2, [r0, #20]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #32]
	b	.L109
.L111:
	mov	r2, #10240
	ldr	r3, [r0, #16]
	str	r2, [sp]
	ldr	r5, .L113
	ldr	r2, [r0, #20]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #24]
	ldr	r3, [r4, #16]
	str	r2, [sp]
	ldr	r2, [r4, #20]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	r2, #640
	ldr	r3, .L113+4
	add	r1, r1, #1
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	b	.L109
.L114:
	.align	2
.L113:
	.word	drawRect
	.word	setPixel
	.size	drawFood, .-drawFood
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
	push	{r4, r5, r6, lr}
	bl	drawPlayer
	ldr	r0, .L120
	bl	drawWave
	ldr	r0, .L120+4
	bl	drawWave
	ldr	r0, .L120+8
	bl	drawWave
	ldr	r6, .L120+12
	ldr	r0, .L120+16
	bl	drawWave
	ldr	r0, .L120+20
	bl	drawWave
	ldr	r3, [r6]
	rsb	r3, r3, #15
	cmp	r3, #0
	ble	.L116
	mov	r5, #0
	ldr	r4, .L120+24
.L117:
	mov	r0, r4
	bl	drawFood
	ldr	r3, [r6]
	add	r5, r5, #1
	rsb	r3, r3, #15
	cmp	r3, r5
	add	r4, r4, #36
	bgt	.L117
.L116:
	ldr	r6, .L120+28
	mov	lr, pc
	bx	r6
	mov	r4, r0
	mov	lr, pc
	bx	r6
	ldr	r3, .L120+32
	ldr	r5, .L120+36
	smull	r2, r3, r0, r3
	smull	r1, r2, r5, r4
	add	r1, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #7
	add	r1, r2, r4
	asr	r2, r4, #31
	rsb	r2, r2, r1, asr #7
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #3
	rsb	r2, r2, r2, lsl #4
	sub	r1, r0, r3, lsl #2
	ldr	r3, .L120+40
	sub	r0, r4, r2, lsl #4
	ldr	r2, .L120+44
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r6
	mov	r4, r0
	mov	lr, pc
	bx	r6
	mov	r1, r0
	ldr	r3, .L120+48
	smull	r2, r3, r0, r3
	smull	r0, r2, r5, r4
	add	ip, r3, r1
	asr	r3, r1, #31
	add	r0, r2, r4
	rsb	r3, r3, ip, asr #7
	asr	r2, r4, #31
	rsb	r2, r2, r0, asr #7
	add	r3, r3, r3, lsl #3
	rsb	r2, r2, r2, lsl #4
	rsb	r3, r3, r3, lsl #4
	sub	r0, r4, r2, lsl #4
	sub	r1, r1, r3
	ldr	r4, .L120+52
	mov	r3, #10240
	mov	r2, #10
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L121:
	.align	2
.L120:
	.word	waves
	.word	waves+40
	.word	waves+80
	.word	dif
	.word	waves+120
	.word	waves+160
	.word	foods
	.word	rand
	.word	-368140053
	.word	-2004318071
	.word	setPixel
	.word	31904
	.word	-222702007
	.word	drawCircle
	.size	drawGame, .-drawGame
	.comm	dif,4,4
	.comm	dead,4,4
	.comm	pts,4,4
	.comm	foods,540,4
	.comm	waves,200,4
	.comm	player,36,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
