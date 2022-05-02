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
	ldr	r3, .L23
	ldrh	r3, [r3, #48]
	ands	r2, r3, #64
	mvneq	r1, #0
	movne	r1, #0
	push	{r4, r5, r6, lr}
	ldr	r3, [r0, #28]
	cmp	r3, #1
	mov	r4, r0
	str	r1, [r0, #32]
	sub	sp, sp, #16
	beq	.L19
	cmn	r3, #1
	beq	.L20
	ldr	r0, [r0]
	ldr	r1, [r4, #16]
	ldr	ip, [r4, #8]
	add	r1, r0, r1
	sub	r1, r1, ip
	cmp	r1, #0
	movlt	r1, #0
	subge	r0, r0, ip
	strge	r0, [r4]
	strlt	r1, [r4, #24]
	cmp	r3, #0
	bne	.L4
.L8:
	ldr	r5, .L23+4
	ldr	r3, [r5, #44]
	cmp	r3, #0
	bne	.L21
.L1:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	ldr	r1, [r0, #4]
	ldr	r3, [r0, #20]
	ldr	r0, [r0, #12]
	add	r3, r1, r3
	sub	r3, r3, r0
	cmp	r3, #0
	subge	r1, r1, r0
	strge	r1, [r4, #4]
	blt	.L3
.L4:
	cmp	r2, #0
	bne	.L8
.L22:
	ldr	r2, .L23+8
	ldr	r3, [r4]
	ldr	r2, [r2, #8]
	ldr	r5, .L23+4
	add	r3, r3, r2
	str	r3, [r4]
	ldr	r3, [r5, #44]
	cmp	r3, #0
	beq	.L1
.L21:
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	ldr	r6, .L23+12
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #16]
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L1
	mov	r2, #0
	ldr	r1, .L23+16
	ldr	r3, [r1]
	add	r3, r3, #1
	str	r2, [r5, #44]
	str	r3, [r1]
	str	r2, [r4, #24]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L19:
	ldr	r3, [r0, #4]
	ldr	r1, [r0, #12]
	add	r3, r3, r1
	cmp	r3, #239
	strle	r3, [r0, #4]
	ble	.L4
.L3:
	mov	r3, #0
	cmp	r2, #0
	str	r3, [r4, #24]
	bne	.L8
	b	.L22
.L24:
	.align	2
.L23:
	.word	67109120
	.word	enemy
	.word	player
	.word	collision
	.word	pts
	.size	updateBullet.part.0, .-updateBullet.part.0
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
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	ip, #1
	mov	r6, #32
	mov	r7, #3
	mov	fp, #208
	mov	r10, #112
	mov	r9, #20
	ldr	r1, .L29
	str	r2, [r1]
	ldr	r1, .L29+4
	str	r2, [r1]
	ldr	r1, .L29+8
	str	r2, [r1]
	ldr	r1, .L29+12
	str	r2, [r1]
	ldr	r1, .L29+16
	str	r2, [r1]
	ldr	r1, .L29+20
	str	r2, [r1]
	ldr	r1, .L29+24
	str	r2, [r1]
	ldr	r1, .L29+28
	str	r2, [r1]
	ldr	r1, .L29+32
	stm	r1, {r10, fp}
	str	r2, [r1, #24]
	str	r2, [r1, #36]
	str	ip, [r1, #12]
	str	ip, [r1, #8]
	str	ip, [r1, #28]
	str	r6, [r1, #16]
	str	r6, [r1, #20]
	str	r7, [r1, #40]
	str	r9, [r1, #48]
	ldr	r1, .L29+36
	mov	r8, #103
	str	ip, [r1, #12]
	str	ip, [r1, #8]
	str	ip, [r1, #28]
	str	ip, [r1, #44]
	mov	ip, #8
	mov	r0, r7
	mov	r5, #5
	mov	r4, #13
	mvn	lr, #4
	str	r2, [r1, #24]
	str	r2, [r1, #36]
	mov	r3, r2
	ldr	r2, .L29+40
	str	r7, [r1, #40]
	str	r6, [r1, #16]
	str	r6, [r1, #20]
	str	r8, [r1, #4]
	str	ip, [r1]
	add	r1, r2, #180
.L26:
	str	r5, [r2, #16]
	str	r4, [r2, #20]
	str	lr, [r2]
	str	r3, [r2, #4]
	str	r0, [r2, #8]
	str	r0, [r2, #12]
	str	r3, [r2, #24]
	str	r3, [r2, #32]
	add	r2, r2, #36
	cmp	r2, r1
	bne	.L26
	mov	r5, #12
	mov	r4, #15
	mov	lr, #64
	mov	ip, #120
	mov	r0, #2
	mov	r1, #1
	ldr	r2, .L29+44
	str	r5, [r2, #16]
	str	r4, [r2, #20]
	str	lr, [r2]
	str	r3, [r2, #24]
	str	r3, [r2, #36]
	str	r3, [r2, #28]
	str	ip, [r2, #4]
	str	r0, [r2, #40]
	str	r1, [r2, #44]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	won
	.word	timer
	.word	numGuns
	.word	hasGun
	.word	jumpCount
	.word	jumped
	.word	fallen
	.word	shootUp
	.word	player
	.word	enemy
	.word	bullets
	.word	gun
	.size	initGame, .-initGame
	.align	2
	.global	initGuns
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGuns, %function
initGuns:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r5, #12
	mov	r4, #15
	mov	lr, #64
	mov	ip, #120
	mov	r0, #2
	mov	r1, #1
	ldr	r3, .L33
	str	r5, [r3, #16]
	str	r4, [r3, #20]
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #28]
	pop	{r4, r5, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	gun
	.size	initGuns, .-initGuns
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
	push	{r4, r5, lr}
	mov	r1, #1
	mov	r0, #32
	mov	lr, #112
	mov	ip, #3
	mov	r2, #0
	mov	r5, #208
	mov	r4, #20
	ldr	r3, .L37
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	lr, [r3]
	str	ip, [r3, #40]
	ldr	lr, .L37+4
	ldr	ip, .L37+8
	ldr	r0, .L37+12
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	r1, [r3, #28]
	ldr	r1, .L37+16
	str	r5, [r3, #4]
	str	r4, [r3, #48]
	str	r2, [lr]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [ip]
	str	r2, [r0]
	str	r2, [r1]
	pop	{r4, r5, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	player
	.word	jumpCount
	.word	jumped
	.word	fallen
	.word	shootUp
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy, %function
initEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #1
	mov	r0, #32
	mov	r4, #103
	mov	lr, #8
	mov	r1, #0
	mov	ip, #3
	ldr	r3, .L41
	str	r4, [r3, #4]
	str	lr, [r3]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	ip, [r3, #40]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #28]
	str	r2, [r3, #44]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	pop	{r4, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	enemy
	.size	initEnemy, .-initEnemy
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
	push	{r4, lr}
	mvn	ip, #4
	mov	r4, #5
	mov	lr, #13
	mov	r2, #0
	mov	r1, #3
	ldr	r3, .L47
	add	r0, r3, #180
.L44:
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #32]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L44
	pop	{r4, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	updateGun
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGun, %function
updateGun:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L60
	ldr	r3, [r4, #24]
	ldr	r1, .L60+4
	ldr	r2, .L60+8
	add	r3, r3, #1
	mla	r2, r3, r2, r1
	ldr	r1, .L60+12
	cmp	r2, r1
	str	r3, [r4, #24]
	sub	sp, sp, #20
	bhi	.L50
	add	r2, r4, #36
	ldm	r2, {r2, r3}
	sub	r3, r3, #1
	cmp	r2, r3
	movge	r3, #0
	addlt	r2, r2, #1
	strlt	r2, [r4, #36]
	strge	r3, [r4, #36]
.L50:
	ldr	r0, .L60+16
	ldr	ip, [r4, #16]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r0]
	ldr	r5, [r4, #20]
	ldr	r0, [r0, #4]
	ldr	lr, [r4]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	str	r5, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r5, .L60+20
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldr	r3, [r4, #44]
	beq	.L52
	cmp	r3, #0
	bne	.L59
.L53:
	mov	r2, #512
	ldr	r3, .L60+24
	strh	r2, [r3, #24]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L59:
	mov	r2, #1
	mov	r1, #0
	ldr	r3, .L60+28
	str	r1, [r4, #44]
	str	r2, [r3]
	b	.L53
.L52:
	cmp	r3, #1
	bne	.L53
	ldr	r2, [r4, #4]
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r3, [r4, #36]
	ldr	r1, .L60+24
	ldr	r0, [r4]
	lsl	r3, r3, #7
	add	r3, r3, #24
	strh	r2, [r1, #26]	@ movhi
	strh	r0, [r1, #24]	@ movhi
	strh	r3, [r1, #28]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	gun
	.word	47721858
	.word	-1527099483
	.word	95443716
	.word	player
	.word	collision
	.word	shadowOAM
	.word	hasGun
	.size	updateGun, .-updateGun
	.global	__aeabi_idivmod
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L71
	ldr	r4, [r5, #24]
	rsb	r3, r4, r4, lsl #3
	add	r3, r3, r3, lsl #6
	add	r3, r4, r3, lsl #3
	ldr	r2, .L71+4
	rsb	r3, r3, r3, lsl #15
	ldr	r1, .L71+8
	add	r3, r4, r3, lsl #3
	add	r2, r3, r2
	cmp	r1, r2, ror #3
	sub	sp, sp, #16
	bcc	.L63
	ldr	r0, [r5, #36]
	ldr	r3, .L71+12
	ldr	r1, [r5, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r5, #36]
.L63:
	ldr	r3, [r5, #44]
	add	r4, r4, #1
	cmp	r3, #0
	str	r4, [r5, #24]
	bne	.L70
	mov	r2, #512
	ldr	r3, .L71+16
	strh	r2, [r3, #16]	@ movhi
.L62:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L70:
	ldr	r3, [r5, #4]
	mvn	r1, r3, lsl #17
	mvn	r1, r1, lsr #17
	ldr	ip, [r5, #36]
	ldr	r4, [r5]
	ldr	r2, [r5, #20]
	ldr	r6, [r5, #16]
	ldr	lr, .L71+16
	str	r3, [sp, #4]
	str	r4, [sp]
	str	r6, [sp, #12]
	str	r2, [sp, #8]
	ldr	r0, .L71+20
	lsl	ip, ip, #7
	add	ip, ip, #16
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	strh	r1, [lr, #18]	@ movhi
	strh	ip, [lr, #20]	@ movhi
	ldm	r0, {r0, r1}
	ldr	r5, .L71+24
	strh	r4, [lr, #16]	@ movhi
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L62
	ldr	r2, .L71+28
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L72:
	.align	2
.L71:
	.word	enemy
	.word	238609288
	.word	59652322
	.word	__aeabi_idivmod
	.word	shadowOAM
	.word	player
	.word	collision
	.word	lives
	.size	updateEnemy, .-updateEnemy
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
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L94
	mov	r2, r0
	ldr	r1, [r2, #24]
	cmp	r1, #0
	mov	r3, #0
	beq	.L92
.L76:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bxeq	lr
	ldr	r1, [r2, #24]
	cmp	r1, #0
	bne	.L76
.L92:
	ldr	r2, .L94+4
	ldr	ip, [r2]
	ldr	r2, .L94+8
	cmp	ip, #0
	push	{r4, r5, r6, r7, lr}
	ldr	ip, [r2, #4]
	ldr	lr, [r2]
	beq	.L77
	mov	r6, #13
	mov	r5, #5
	add	r4, r3, r3, lsl #3
	add	r2, r0, r4, lsl #2
	str	ip, [r2, #4]
	ldr	ip, [r2, #20]
	sub	lr, lr, ip
	str	lr, [r0, r4, lsl #2]
	str	r1, [r2, #28]
	str	r6, [r2, #16]
	str	r5, [r2, #20]
	lsl	r2, r3, #3
.L78:
	mov	r1, #1
	add	r3, r2, r3
	add	r0, r0, r3, lsl #2
	str	r1, [r0, #24]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L77:
	ldr	r1, [r2, #28]
	cmp	r1, #1
	beq	.L79
	cmp	r1, #2
	beq	.L93
.L80:
	mov	r7, #1
	mov	r6, #5
	mov	r5, #13
	ldr	r1, [r2, #20]
	add	r4, r3, r3, lsl #3
	ldr	r2, [r2, #16]
	add	r1, r1, r1, lsr #31
	add	r1, lr, r1, asr r7
	add	lr, r0, r4, lsl #2
	add	ip, ip, r2
	ldr	r2, [lr, #20]
	add	r2, r2, r2, lsr #31
	sub	r2, ip, r2, asr r7
	sub	r1, r1, #3
	str	r2, [lr, #4]
	str	r1, [r0, r4, lsl #2]
	str	r7, [lr, #28]
	str	r6, [lr, #16]
	str	r5, [lr, #20]
	lsl	r2, r3, #3
	b	.L78
.L93:
	ldr	r1, [r2, #32]
	cmp	r1, #1
	bne	.L80
.L79:
	mvn	r5, #0
	mov	r4, #5
	mov	r1, #13
	ldr	r2, [r2, #20]
	add	r2, r2, r2, lsr #31
	add	r2, lr, r2, asr #1
	add	r6, r3, r3, lsl #3
	add	lr, r0, r6, lsl #2
	sub	r2, r2, #3
	str	r2, [r0, r6, lsl #2]
	ldr	r2, [lr, #20]
	add	r2, r2, r2, lsr #31
	sub	ip, ip, r2, asr #1
	str	ip, [lr, #4]
	str	r5, [lr, #28]
	str	r4, [lr, #16]
	str	r1, [lr, #20]
	lsl	r2, r3, #3
	b	.L78
.L95:
	.align	2
.L94:
	.word	bullets
	.word	shootUp
	.word	player
	.size	fireBullet, .-fireBullet
	.align	2
	.global	drawBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullets, %function
drawBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #512
	mov	r7, #22
	mov	r6, #20
	ldr	r3, .L103
	ldr	r2, .L103+4
	ldr	r4, .L103+8
	ldr	lr, .L103+12
	add	ip, r3, #180
.L100:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	strheq	r5, [r2, #152]	@ movhi
	beq	.L99
	ldr	r1, [r3, #28]
	ldr	r0, [r3, #4]
	cmp	r1, #0
	ldrb	r1, [r3]	@ zero_extendqisi2
	and	r0, r0, r4
	orr	r8, r1, #16384
	orr	r1, r1, lr
	strhne	r8, [r2, #152]	@ movhi
	strhne	r0, [r2, #154]	@ movhi
	strhne	r6, [r2, #156]	@ movhi
	strheq	r1, [r2, #152]	@ movhi
	strheq	r0, [r2, #154]	@ movhi
	strheq	r7, [r2, #156]	@ movhi
.L99:
	add	r3, r3, #36
	cmp	ip, r3
	add	r2, r2, #8
	bne	.L100
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L104:
	.align	2
.L103:
	.word	bullets
	.word	shadowOAM
	.word	511
	.word	-32768
	.size	drawBullets, .-drawBullets
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L153
	ldr	r2, [r4, #4]
	mvn	r1, r2, lsl #17
	mvn	r1, r1, lsr #17
	ldr	ip, .L153+4
	ldr	r0, [ip]
	ldr	r5, .L153+8
	ldr	r3, [r4]
	cmp	r0, #0
	strh	r1, [r5, #2]	@ movhi
	strh	r3, [r5]	@ movhi
	sub	sp, sp, #16
	beq	.L106
	ldr	r1, [r4, #32]
	cmp	r1, #0
	bne	.L149
.L107:
	mov	r1, #384
	strh	r1, [r5, #4]	@ movhi
.L109:
	ldr	r1, .L153+12
	ldr	r1, [r1]
	tst	r1, #1
	bne	.L105
	ldr	r0, .L153+16
	ldr	lr, .L153+20
	ldr	r1, [r0]
	ldr	r5, [lr]
	add	r1, r1, #1
	cmp	r1, r5
	sub	r5, r3, #2
	str	r1, [r0]
	str	r5, [r4]
	beq	.L112
	ldr	r1, [lr, #4]
	sub	r3, r3, #3
	add	r2, r1, r2
	rsb	r3, r3, r3, lsl #4
	ldrb	r1, [r2, r3, lsl #4]	@ zero_extendqisi2
	cmp	r1, #0
	add	r2, r2, r3, lsl #4
	beq	.L112
	ldr	r3, [r4, #16]
	add	r1, r3, r3, lsr #31
	ldrb	r1, [r2, r1, asr #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L112
	add	r2, r2, r3
	ldrb	r3, [r2, #-1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L105
.L112:
	mov	r1, #0
	mov	r2, #1
	ldr	r3, .L153+24
	str	r1, [ip]
	str	r2, [r3]
.L105:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L149:
	ldr	r0, [r4, #28]
	cmp	r0, #0
	beq	.L107
	cmp	r0, #1
	cmpne	r1, #1
	moveq	r1, #388
	strheq	r1, [r5, #4]	@ movhi
	b	.L109
.L106:
	ldr	r1, [r4, #16]
	ldr	r6, .L153+20
	ldr	lr, [r4, #8]
	ldr	ip, [r4, #20]
	str	r0, [sp, #8]
	add	r3, r3, #2
	ldr	r0, [r6, #4]
	stm	sp, {r1, ip}
	str	lr, [sp, #12]
	mov	r1, #240
	ldr	r6, .L153+28
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L150
	ldr	r2, .L153+24
	ldr	r3, [r2]
	cmp	r3, #0
	ldr	r3, [r4, #32]
	beq	.L115
	cmp	r3, #0
	bne	.L151
.L116:
	mov	r3, #384
	strh	r3, [r5, #4]	@ movhi
.L118:
	ldr	r3, .L153+12
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L105
	ldr	r1, .L153+16
	ldr	r3, [r1]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r1]
	streq	r3, [r2]
	b	.L105
.L150:
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L115:
	cmp	r3, #0
	ldr	r2, [r4, #28]
	beq	.L152
	cmp	r3, #1
	bne	.L121
	cmp	r2, #1
	beq	.L122
	mov	r3, #4
	strh	r3, [r5, #4]	@ movhi
	b	.L105
.L152:
	cmp	r2, #0
	bne	.L148
.L120:
	ldr	r3, [r4, #36]
	lsl	r3, r3, #7
	strh	r3, [r5, #4]	@ movhi
	b	.L105
.L151:
	ldr	r1, [r4, #28]
	cmp	r1, #0
	beq	.L116
	cmp	r1, #1
	cmpne	r3, #1
	moveq	r3, #388
	strheq	r3, [r5, #4]	@ movhi
	b	.L118
.L121:
	cmp	r2, #0
	beq	.L120
.L122:
	ldr	r3, [r4, #36]
	lsl	r3, r3, #7
	add	r3, r3, #4
.L148:
	strh	r3, [r5, #4]	@ movhi
	b	.L105
.L154:
	.align	2
.L153:
	.word	player
	.word	jumped
	.word	shadowOAM
	.word	timer
	.word	jumpCount
	.word	.LANCHOR0
	.word	fallen
	.word	collisionCheck
	.size	drawPlayer, .-drawPlayer
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
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L206
	ldr	r3, [r3]
	ldr	r4, .L206+4
	cmp	r3, #0
	sub	sp, sp, #20
	ldr	r3, [r4, #48]
	bne	.L156
	ldr	r5, .L206+8
	add	r3, r3, #1
.L157:
	ldr	r2, [r4, #28]
	cmp	r2, #2
	str	r3, [r4, #48]
	movne	r3, #2
	strne	r3, [r4, #28]
	ldr	r3, [r4, #24]
	strne	r2, [r4, #32]
	ands	r3, r3, #3
	bne	.L162
	add	r1, r4, #36
	ldm	r1, {r1, r2}
	sub	r2, r2, #1
	cmp	r1, r2
	addlt	r1, r1, #1
	strlt	r1, [r4, #36]
	strge	r3, [r4, #36]
.L162:
	ldr	r3, .L206+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	bne	.L164
	ldr	r2, [r4, #4]
	cmp	r2, #0
	bgt	.L203
.L164:
	ldr	r3, .L206+12
	ldrh	r3, [r3, #48]
	ands	r6, r3, #16
	beq	.L204
.L165:
	ldrh	r3, [r5]
	tst	r3, #2
	beq	.L168
	ldr	r3, .L206+16
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L168
.L169:
	ldr	r5, .L206+20
	ldr	r2, .L206+24
	ldr	r3, [r5]
	ldr	r2, [r2]
	orrs	r3, r3, r2
	beq	.L205
.L170:
	ldr	r3, .L206+12
	ldrh	r3, [r3, #48]
	lsr	r3, r3, #6
	ldr	r2, .L206+28
	eor	r3, r3, #1
	and	r3, r3, #1
	str	r3, [r2]
	bl	drawPlayer
	ldr	r3, [r4, #28]
	cmp	r3, #2
	ldrne	r3, [r4, #24]
	addne	r3, r3, #1
	strne	r3, [r4, #24]
	ldr	r3, [r5]
	cmp	r3, #0
	bne	.L155
	ldr	r0, [r4]
	ldr	r2, [r4, #20]
	ldr	r3, .L206+32
	add	r2, r0, r2
	ldr	r3, [r3, #4]
	ldr	r1, [r4, #4]
	rsb	r2, r2, r2, lsl #4
	add	r3, r3, r2, lsl #4
	ldrb	r2, [r3, r1]	@ zero_extendqisi2
	cmp	r2, #0
	add	r3, r3, r1
	beq	.L155
	ldr	r2, [r4, #16]
	add	r1, r2, r2, lsr #31
	ldrb	r1, [r3, r1, asr #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L155
	add	r3, r3, r2
	ldrb	r3, [r3, #-1]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r0, r0, #1
	strne	r0, [r4]
.L155:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L168:
	ldr	r3, .L206+12
	ldrh	r3, [r3, #48]
	tst	r3, #2
	beq	.L169
	ldr	r5, .L206+20
	b	.L170
.L204:
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #16]
	add	r1, r2, r3
	cmp	r1, #240
	bgt	.L165
	ldr	r1, [r4, #20]
	str	r3, [sp]
	ldr	ip, [r4, #12]
	str	r6, [sp, #12]
	ldr	r0, .L206+32
	ldr	r3, [r4]
	ldr	r0, [r0, #4]
	ldr	r7, .L206+36
	stmib	sp, {r1, ip}
	mov	r1, #240
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r4, #4]
	ldrne	r2, [r4, #12]
	addne	r3, r3, r2
	strne	r6, [r4, #28]
	strne	r3, [r4, #4]
	b	.L165
.L203:
	ldr	r1, [r4, #12]
	add	ip, r4, #16
	rsb	r1, r1, #0
	ldm	ip, {ip, lr}
	ldr	r0, .L206+32
	str	r3, [sp, #12]
	str	r1, [sp, #8]
	ldr	r3, [r4]
	ldr	r0, [r0, #4]
	mov	r1, #240
	stm	sp, {ip, lr}
	ldr	r6, .L206+36
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L164
	mov	r2, #1
	ldr	r3, [r4, #4]
	ldr	r1, [r4, #12]
	sub	r3, r3, r1
	str	r3, [r4, #4]
	str	r2, [r4, #28]
	b	.L165
.L156:
	ldr	r5, .L206+8
	ldrh	r2, [r5]
	tst	r2, #1
	beq	.L202
	ldr	r2, .L206+16
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L202
	cmp	r3, #9
	bgt	.L160
.L202:
	add	r3, r3, #1
	b	.L157
.L205:
	mov	r0, #1
	mvn	r1, #0
	ldr	r2, .L206+40
	str	r0, [r5]
	str	r1, [r4, #8]
	str	r3, [r2]
	b	.L170
.L160:
	bl	fireBullet
	mov	r3, #1
	b	.L157
.L207:
	.align	2
.L206:
	.word	hasGun
	.word	player
	.word	oldButtons
	.word	67109120
	.word	buttons
	.word	jumped
	.word	fallen
	.word	shootUp
	.word	.LANCHOR0
	.word	collisionCheck
	.word	jumpCount
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
	bl	updateEnemy
	ldr	r4, .L216
	add	r5, r4, #180
.L210:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	movne	r0, r4
	blne	updateBullet.part.0
.L209:
	add	r4, r4, #36
	cmp	r4, r5
	bne	.L210
	bl	drawBullets
	bl	updateGun
	ldr	lr, .L216+4
	ldr	ip, [lr]
	ldr	r4, .L216+8
	add	ip, ip, #1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L216+12
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L217:
	.align	2
.L216:
	.word	bullets
	.word	timer
	.word	DMANow
	.word	shadowOAM
	.size	updateGame, .-updateGame
	.global	collisionMap
	.comm	bullets,180,4
	.comm	gun,112,4
	.comm	enemy,56,4
	.comm	player,56,4
	.comm	shadowOAM,1024,4
	.global	maxJump
	.comm	shootUp,4,4
	.comm	hasGun,4,4
	.comm	numGuns,4,4
	.comm	pts,4,4
	.comm	lives,4,4
	.comm	jumpCount,4,4
	.comm	fallen,4,4
	.comm	won,4,4
	.comm	jumped,4,4
	.comm	timer,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	maxJump, %object
	.size	maxJump, 4
maxJump:
	.word	15
	.type	collisionMap, %object
	.size	collisionMap, 4
collisionMap:
	.word	collisionMapBitmap
	.ident	"GCC: (devkitARM release 53) 9.1.0"
