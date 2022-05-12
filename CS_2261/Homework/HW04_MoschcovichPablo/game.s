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
	.type	updateBullet.part.0, %function
updateBullet.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #8]
	ldr	r2, [r0]
	sub	r3, r3, #1
	add	r3, r3, r2
	cmp	r3, #0
	ble	.L2
	ldr	r3, [r0, #4]
	cmp	r3, #0
	ble	.L2
	ldr	r1, [r0, #12]
	add	r1, r3, r1
	cmp	r1, #160
	bgt	.L2
	ldr	ip, [r0, #16]
	ldr	r1, [r0, #20]
	add	r2, ip, r2
	add	r3, r1, r3
	stm	r0, {r2, r3}
	bx	lr
.L2:
	mov	r3, #0
	str	r3, [r0, #24]
	bx	lr
	.size	updateBullet.part.0, .-updateBullet.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy.part.0, %function
updateEnemy.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, [r0]
	ldr	r7, .L26
	cmp	r4, #1
	mov	r5, r0
	ldr	r2, [r0, #8]
	ldr	r3, [r7]
	ldr	r0, [r0, #16]
	sub	sp, sp, #20
	ble	.L6
	add	r1, r4, r2
	cmp	r1, #25
	movgt	ip, #0
	movle	ip, #1
	add	r1, r1, r3
	cmp	r1, #239
	movle	r1, ip
	orrgt	r1, ip, #1
	cmp	r1, #0
	beq	.L7
.L6:
	rsb	r0, r0, #0
	str	r0, [r5, #16]
.L7:
	ldr	lr, [r5, #4]
	cmp	lr, #1
	ldr	ip, [r5, #12]
	ldr	r1, [r5, #20]
	ble	.L8
	add	r6, lr, ip
	add	r6, r6, r3
	cmp	r6, #161
	bgt	.L8
.L9:
	add	r0, r4, r0
	ldr	r4, .L26+4
	add	r1, lr, r1
	add	r2, r2, r3
	stm	r5, {r0, r1}
	ldr	r8, .L26+8
	ldr	r9, .L26+12
	ldr	fp, .L26+16
	ldr	r10, .L26+20
	add	r3, r3, ip
	add	r6, r4, #256
	b	.L12
.L10:
	add	r4, r4, #32
	cmp	r4, r6
	beq	.L25
.L12:
	ldr	ip, [r4, #24]
	cmp	ip, #0
	beq	.L10
	add	ip, r4, #8
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r4, #4]
	str	ip, [sp, #8]
	ldr	ip, [r4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L11
	ldr	r3, [r7]
	ldr	r2, [r5, #8]
	ldr	ip, [r5, #12]
	add	r4, r4, #32
	cmp	r4, r6
	add	r2, r2, r3
	ldm	r5, {r0, r1}
	add	r3, r3, ip
	bne	.L12
.L25:
	ldr	ip, .L26+24
	add	r4, ip, #8
	ldm	r4, {r4, lr}
	str	lr, [sp, #12]
	ldm	ip, {ip, lr}
	str	r4, [sp, #8]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L5
	mov	r3, #67108864
	mvn	ip, #0
	ldr	r0, .L26+28
	ldr	r1, .L26+32
	ldr	r2, .L26+36
	str	ip, [r0]
	strh	r1, [r3, #104]	@ movhi
	strh	r2, [r3, #108]	@ movhi
.L5:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L8:
	rsb	r1, r1, #0
	str	r1, [r5, #20]
	b	.L9
.L11:
	mov	r3, #0
	mov	lr, #67108864
	str	r3, [r5, #24]
	str	r3, [r4, #24]
	ldr	r1, [r9]
	ldr	r3, [r7]
	add	r2, r5, #8
	ldm	r2, {r2, ip}
	add	r3, r3, #3
	sub	r1, r1, #1
	str	r1, [r9]
	str	r3, [r7]
	ldr	r0, [r5]
	add	r2, r3, r2
	strh	fp, [lr, #104]	@ movhi
	ldr	r1, [r5, #4]
	strh	r10, [lr, #108]	@ movhi
	add	r3, r3, ip
	b	.L10
.L27:
	.align	2
.L26:
	.word	dim
	.word	bullets
	.word	collision
	.word	enemiesRemaining
	.word	-2176
	.word	-14601
	.word	player
	.word	gameState
	.word	-22656
	.word	-14734
	.size	updateEnemy.part.0, .-updateEnemy.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy.part.0, %function
drawEnemy.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #252
	push	{r4, lr}
	ldr	r2, .L30
	ldr	r3, [r0, #12]
	ldr	r2, [r2]
	ldr	r1, [r0, #8]
	sub	sp, sp, #8
	add	r3, r2, r3
	ldr	r4, .L30+4
	add	r2, r2, r1
	ldm	r0, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	dim
	.word	drawRect4
	.size	drawEnemy.part.0, .-drawEnemy.part.0
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
	str	lr, [sp, #-4]!
	mov	r0, #12
	mov	lr, #70
	mov	r1, #1
	mov	ip, #15
	ldr	r3, .L34
	ldr	r2, [r3, #8]
	rsb	r2, r2, #224
	stm	r3, {r2, lr}
	str	ip, [r3, #24]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L35:
	.align	2
.L34:
	.word	player
	.size	initPlayer, .-initPlayer
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
	push	{r4, lr}
	ldr	ip, .L38
	ldr	r0, .L38+4
	sub	sp, sp, #8
	ldm	r0, {r0, r1, r2, r3}
	ldr	r4, .L38+8
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	shipBitmap
	.word	player
	.word	drawImage4
	.size	drawPlayer, .-drawPlayer
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
	push	{r4, r5, r6, r7, lr}
	mov	r0, #251
	sub	sp, sp, #12
	ldr	r3, .L56
	mov	lr, pc
	bx	r3
	mov	r1, #0
	mov	r3, #250
	ldr	r4, .L56+4
	mov	r0, r1
	mov	r2, #16
	str	r3, [sp]
	ldr	r6, .L56+8
	mov	r3, #160
	mov	lr, pc
	bx	r6
	mov	r7, #254
	bl	drawPlayer
	add	r5, r4, #256
	b	.L42
.L41:
	add	r4, r4, #32
	cmp	r4, r5
	beq	.L54
.L42:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L41
	str	r7, [sp]
	ldm	r4, {r0, r1, r2, r3}
	add	r4, r4, #32
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L42
.L54:
	ldr	r4, .L56+12
	add	r5, r4, #140
.L44:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L55
.L43:
	add	r4, r4, #28
	cmp	r4, r5
	bne	.L44
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L55:
	mov	r0, r4
	bl	drawEnemy.part.0
	b	.L43
.L57:
	.align	2
.L56:
	.word	fillScreen4
	.word	bullets
	.word	drawRect4
	.word	enemies
	.size	drawGame, .-drawGame
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
	push	{r4, r5, r6, lr}
	mov	r2, #0
	mov	r6, #3
	mov	r5, #1
	mvn	r4, #1
	mov	lr, #254
	ldr	r1, .L62
	ldr	r3, .L62+4
	ldr	ip, [r1]
	ldr	r0, [r1, #4]
	add	r1, r3, #256
.L59:
	str	ip, [r3]
	str	r5, [r3, #12]
	str	r4, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	strh	lr, [r3, #28]	@ movhi
	stmib	r3, {r0, r6}
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L59
	pop	{r4, r5, r6, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	player
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
	mov	r3, #0
	ldr	r1, .L74
	b	.L67
.L65:
	add	r3, r3, #1
	cmp	r3, #8
	bxeq	lr
.L67:
	ldr	r2, [r1, r3, lsl #5]
	cmp	r2, #0
	lsl	r2, r3, #5
	bne	.L65
	push	{r4, r5, lr}
	mov	r5, #1
	ldr	lr, .L74+4
	ldr	r4, .L74+8
	ldr	r1, [lr, #12]
	add	r2, r4, r2
	ldr	r0, [lr, #4]
	ldr	ip, [r2, #12]
	add	r1, r1, r1, lsr #31
	add	r1, r0, r1, asr r5
	add	ip, ip, ip, lsr #31
	ldr	r0, [lr]
	sub	r1, r1, ip, asr r5
	str	r0, [r4, r3, lsl #5]
	str	r5, [r2, #24]
	str	r1, [r2, #4]
	pop	{r4, r5, lr}
	bx	lr
.L75:
	.align	2
.L74:
	.word	bullets+24
	.word	player
	.word	bullets
	.size	fireBullet, .-fireBullet
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
	ldr	r3, .L115
	ldrh	r3, [r3]
	tst	r3, #16
	push	{r4, lr}
	bne	.L106
	ldr	r4, .L115+4
.L77:
	ldr	r2, .L115+8
	ldrh	r2, [r2, #48]
	tst	r2, #16
	beq	.L111
.L79:
	tst	r3, #32
	beq	.L80
	ldr	r2, .L115+12
	ldrh	r2, [r2]
	tst	r2, #32
	bne	.L80
	ldr	r2, [r4]
	cmp	r2, #0
	ble	.L81
	ldr	r1, [r4, #16]
	sub	r2, r2, r1
	str	r2, [r4]
.L80:
	ldr	r2, .L115+8
	ldrh	r2, [r2, #48]
	tst	r2, #32
	beq	.L112
.L82:
	tst	r3, #64
	beq	.L83
	ldr	r2, .L115+12
	ldrh	r2, [r2]
	tst	r2, #64
	bne	.L83
	ldr	r2, [r4, #4]
	cmp	r2, #0
	ble	.L84
	ldr	r1, [r4, #20]
	sub	r2, r2, r1
	str	r2, [r4, #4]
.L83:
	ldr	r2, .L115+8
	ldrh	r2, [r2, #48]
	tst	r2, #64
	beq	.L113
.L85:
	tst	r3, #128
	beq	.L86
	ldr	r2, .L115+12
	ldrh	r2, [r2]
	tst	r2, #128
	bne	.L86
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #12]
	add	r2, r1, r2
	cmp	r2, #160
	bgt	.L87
	ldr	r2, [r4, #20]
	add	r1, r2, r1
	str	r1, [r4, #4]
.L86:
	ldr	r2, .L115+8
	ldrh	r2, [r2, #48]
	tst	r2, #128
	beq	.L114
.L88:
	tst	r3, #2
	ldr	r3, [r4, #24]
	beq	.L110
	ldr	r2, .L115+12
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L91
.L110:
	add	r3, r3, #1
.L90:
	ldr	r2, [r4]
	cmp	r2, #2
	bgt	.L93
	ldr	r2, .L115+16
	ldr	r2, [r2]
	cmp	r2, #0
	moveq	r1, #1
	ldreq	r2, .L115+20
	streq	r1, [r2]
.L93:
	str	r3, [r4, #24]
	pop	{r4, lr}
	bx	lr
.L113:
	ldr	r2, [r4, #4]
	cmp	r2, #0
	ldrgt	r1, [r4, #20]
	subgt	r2, r2, r1
	strgt	r2, [r4, #4]
	b	.L85
.L112:
	ldr	r2, [r4]
	cmp	r2, #0
	ldrgt	r1, [r4, #16]
	subgt	r2, r2, r1
	strgt	r2, [r4]
	b	.L82
.L111:
	ldr	r1, [r4]
	ldr	r2, [r4, #8]
	add	r2, r1, r2
	cmp	r2, #240
	ldrle	r2, [r4, #16]
	addle	r1, r2, r1
	strle	r1, [r4]
	b	.L79
.L114:
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #12]
	add	r2, r1, r2
	cmp	r2, #160
	ldrle	r2, [r4, #20]
	addle	r1, r2, r1
	strle	r1, [r4, #4]
	b	.L88
.L91:
	cmp	r3, #14
	ble	.L110
	bl	fireBullet
	mov	r3, #1
	b	.L90
.L106:
	ldr	r2, .L115+12
	ldrh	r2, [r2]
	tst	r2, #16
	ldr	r4, .L115+4
	bne	.L77
	ldr	r1, [r4]
	ldr	r2, [r4, #8]
	add	r2, r1, r2
	cmp	r2, #240
	bgt	.L78
	ldr	r2, [r4, #16]
	add	r1, r2, r1
	str	r1, [r4]
	b	.L77
.L87:
	ldr	r2, .L115+8
	ldrh	r2, [r2, #48]
	b	.L88
.L78:
	ldr	r2, .L115+8
	ldrh	r2, [r2, #48]
	b	.L79
.L84:
	ldr	r2, .L115+8
	ldrh	r2, [r2, #48]
	b	.L85
.L81:
	ldr	r2, .L115+8
	ldrh	r2, [r2, #48]
	b	.L82
.L116:
	.align	2
.L115:
	.word	oldButtons
	.word	player
	.word	67109120
	.word	buttons
	.word	enemiesRemaining
	.word	gameState
	.size	updatePlayer, .-updatePlayer
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
	ldr	r0, .L131
	add	r4, r0, #256
.L119:
	ldr	r3, [r0, #24]
	cmp	r3, #0
	blne	updateBullet.part.0
.L118:
	add	r0, r0, #32
	cmp	r0, r4
	bne	.L119
	ldr	r4, .L131+4
	add	r5, r4, #140
.L121:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	movne	r0, r4
	blne	updateEnemy.part.0
.L120:
	add	r4, r4, #28
	cmp	r5, r4
	bne	.L121
	pop	{r4, r5, r6, lr}
	bx	lr
.L132:
	.align	2
.L131:
	.word	bullets
	.word	enemies
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
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateBullet.part.0
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
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	mov	r2, #254
	push	{r4, lr}
	sub	sp, sp, #8
	ldr	r3, [r0, #12]
	str	r2, [sp]
	ldr	r4, .L144
	ldm	r0, {r0, r1, r2}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L145:
	.align	2
.L144:
	.word	drawRect4
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #10
	ldr	r4, .L150
	ldr	r5, .L150+4
	ldr	r8, .L150+8
	ldr	r7, .L150+12
	add	r6, r4, #140
.L147:
	mov	lr, pc
	bx	r5
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #16
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	mov	r1, #2
	mov	r2, #1
	smull	r3, ip, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #5
	add	r3, r3, r3, lsl r1
	add	r3, r3, r3, lsl r1
	sub	r0, r0, r3, lsl r1
	add	r0, r0, #12
	str	r9, [r4, #8]
	str	r9, [r4, #12]
	str	r0, [r4, #4]
	str	r2, [r4, #16]
	str	r2, [r4, #24]
	str	r1, [r4, #20]
	add	r4, r4, #28
	cmp	r4, r6
	bne	.L147
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L151:
	.align	2
.L150:
	.word	enemies
	.word	rand
	.word	2114445439
	.word	1374389535
	.size	initEnemies, .-initEnemies
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #1
	mov	r8, #70
	mov	r2, #15
	mov	r3, #12
	mov	r6, r8
	mov	r5, r7
	mov	lr, #3
	mvn	ip, #1
	mov	r4, #0
	mov	r0, #254
	ldr	r1, .L156
	str	r2, [r1, #24]
	ldr	r2, [r1, #8]
	str	r3, [r1, #12]
	str	r3, [r1, #8]
	ldr	r3, .L156+4
	rsb	r2, r2, #224
	stm	r1, {r2, r8}
	str	r7, [r1, #16]
	str	r7, [r1, #20]
	add	r1, r3, #256
.L153:
	str	r5, [r3, #12]
	str	ip, [r3, #16]
	str	r4, [r3, #20]
	str	r4, [r3, #24]
	strh	r0, [r3, #28]	@ movhi
	stm	r3, {r2, r6, lr}
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L153
	bl	initEnemies
	mov	r0, #5
	ldr	r1, .L156+8
	ldr	lr, .L156+12
	ldr	ip, .L156+16
	str	r0, [r1]
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L156+20
	ldr	r5, .L156+24
	str	r4, [lr]
	str	r4, [ip]
	mov	lr, pc
	bx	r5
	mov	lr, #31744
	mov	ip, #992
	mov	r0, #31
	mvn	r1, #32768
	ldr	r3, .L156+28
	ldr	r2, .L156+32
	strh	lr, [r3, #246]	@ movhi
	strh	r4, [r3, #244]	@ movhi
	strh	ip, [r3, #248]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	strh	r1, [r3, #252]	@ movhi
	strh	r2, [r3, #254]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L157:
	.align	2
.L156:
	.word	player
	.word	bullets
	.word	enemiesRemaining
	.word	gameState
	.word	dim
	.word	shipPal
	.word	DMANow
	.word	83886336
	.word	15855
	.size	initGame, .-initGame
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateEnemy.part.0
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	b	drawEnemy.part.0
	.size	drawEnemy, .-drawEnemy
	.comm	dim,4,4
	.comm	gameState,4,4
	.comm	enemiesRemaining,4,4
	.comm	enemies,140,4
	.comm	bullets,256,4
	.comm	player,28,4
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
