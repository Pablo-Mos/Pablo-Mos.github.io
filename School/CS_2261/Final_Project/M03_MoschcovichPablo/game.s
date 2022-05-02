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
	ldr	r3, .L31
	ldrh	r2, [r3, #48]
	tst	r2, #64
	mvneq	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	streq	r3, [r0, #76]
	sub	sp, sp, #16
	beq	.L3
	ldrh	r3, [r3, #48]
	tst	r3, #128
	moveq	r3, #1
	movne	r3, #0
	str	r3, [r0, #76]
.L3:
	ldr	r3, [r5, #52]
	cmp	r3, #1
	ldr	r1, [r5]
	beq	.L27
	cmn	r3, #1
	beq	.L28
	ldr	r2, [r5, #20]
	ldr	r0, [r5, #8]
	add	r2, r1, r2
	sub	r2, r2, r0
	cmp	r2, #0
	movlt	r2, #0
	subge	r1, r1, r0
	strge	r1, [r5]
	strlt	r2, [r5, #44]
	cmp	r3, #0
	bne	.L29
.L12:
	mov	r8, #0
	ldr	r4, .L31+4
	ldr	r7, .L31+8
	add	r6, r4, #240
.L16:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L30
.L14:
	add	r4, r4, #80
	cmp	r4, r6
	bne	.L16
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L28:
	add	r0, r5, #12
	ldm	r0, {r0, r3}
	ldr	r2, [r5, #4]
	add	r3, r2, r3
	sub	r3, r3, r0
	cmp	r3, #0
	subge	r2, r2, r0
	strge	r2, [r5, #4]
	blt	.L9
.L17:
	ldr	r3, [r5, #76]
	add	r1, r3, r1
	str	r1, [r5]
	b	.L12
.L27:
	ldr	r3, [r5, #4]
	ldr	r2, [r5, #12]
	add	r3, r3, r2
	cmp	r3, #512
	strlt	r3, [r5, #4]
	blt	.L17
.L9:
	mov	r3, #0
	str	r3, [r5, #44]
	ldr	r3, [r5, #76]
	add	r1, r3, r1
	str	r1, [r5]
	b	.L12
.L30:
	add	r0, r5, #16
	ldm	r0, {r0, r1}
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	strne	r8, [r5, #44]
	ldrne	r3, [r4, #60]
	subne	r3, r3, #1
	strne	r3, [r4, #60]
	b	.L14
.L29:
	ldr	r1, [r5]
	b	.L17
.L32:
	.align	2
.L31:
	.word	67109120
	.word	enemy
	.word	collision
	.size	updateBullet.part.0, .-updateBullet.part.0
	.align	2
	.global	initWeapons
	.syntax unified
	.arm
	.fpu softvfp
	.type	initWeapons, %function
initWeapons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	ip, .L49
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r0, r2
	mov	r3, ip
	mov	r8, #12
	mov	r7, #15
	mov	r6, #10
	mov	r4, #2
	mov	lr, #1
	mov	r5, #9
	mov	fp, #19
	ldr	r10, .L49+4
.L40:
	cmp	r2, #0
	moveq	r1, #3
	streq	r1, [ip, #56]
	beq	.L35
	cmp	r2, #1
	moveq	r1, #4
	streq	r1, [ip, #136]
	beq	.L37
	mov	r1, #5
	str	r1, [ip, #216]
	ldr	r1, [r3, #56]
	cmp	r1, #5
	beq	.L38
	bgt	.L39
	cmp	r1, #3
	beq	.L35
	cmp	r1, #4
	beq	.L37
.L39:
	add	r2, r2, #1
	cmp	r2, #3
	add	r3, r3, #80
	bne	.L40
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L38:
	str	r1, [r3, #16]
	mov	r1, #20
	mov	r9, #170
	str	r1, [r3, #20]
	mov	r1, #100
	str	r0, [r3, #24]
	stm	r3, {r1, r9}
	str	r0, [r3, #36]
	str	r4, [r3, #40]
	str	r0, [r3, #28]
	str	lr, [r3, #44]
	b	.L39
.L37:
	mov	r9, #60
	mov	r1, #65
	str	r5, [r3, #16]
	str	fp, [r3, #20]
	str	r0, [r3, #24]
	str	r0, [r3, #36]
	str	r4, [r3, #40]
	str	r0, [r3, #28]
	str	lr, [r3, #44]
	str	r9, [r3]
	str	r1, [r3, #4]
	b	.L39
.L35:
	stm	r3, {r6, r10}
	str	r8, [r3, #16]
	str	r7, [r3, #20]
	str	r0, [r3, #24]
	str	r0, [r3, #36]
	str	r4, [r3, #40]
	str	r0, [r3, #28]
	str	lr, [r3, #44]
	b	.L39
.L50:
	.align	2
.L49:
	.word	weapon
	.word	330
	.size	initWeapons, .-initWeapons
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
	mov	r4, #20
	mov	r2, #0
	mov	lr, #32
	mov	r5, #3
	ldr	r3, .L53
	ldr	ip, [r3]
	ldr	r3, .L53+4
	ldr	r0, [r3]
	ldr	r3, .L53+8
	add	ip, ip, #64
	add	r0, r0, #104
	str	ip, [r3]
	str	r4, [r3, #48]
	str	r0, [r3, #4]
	ldr	r4, .L53+12
	ldr	ip, .L53+16
	ldr	r0, .L53+20
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	r1, [r3, #28]
	ldr	r1, .L53+24
	str	r5, [r3, #40]
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	r2, [r4]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #64]
	str	r2, [ip]
	str	r2, [r0]
	str	r2, [r1]
	pop	{r4, r5, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	vOff
	.word	hOff
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
	mov	r2, #1
	mov	r0, #0
	ldr	r3, .L63
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	ip, #32
	mov	r4, #4
	mov	r7, #165
	mov	lr, #3
	str	r0, [r3, #24]
	str	r0, [r3, #36]
	str	r0, [r3, #68]
	mov	r1, r0
	mov	r6, #2
	mov	r0, r2
	mov	r5, #20
	mov	r9, #452
	mov	r8, #219
	str	r7, [r3]
	str	r2, [r3, #56]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #4]
	str	r2, [r3, #28]
	str	r2, [r3, #44]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	lr, [r3, #40]
	str	r4, [r3, #60]
	str	r4, [r3, #72]
	add	r3, r3, #80
.L56:
	cmp	r0, #1
	movne	r4, #8
	movne	r7, #85
	stmeq	r3, {r8, r9}
	stmne	r3, {r4, r7}
	cmp	r0, #2
	str	r1, [r3, #56]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	r2, [r3, #28]
	str	lr, [r3, #40]
	str	r2, [r3, #44]
	str	r6, [r3, #60]
	str	r1, [r3, #68]
	str	r5, [r3, #72]
	add	r3, r3, #80
	movne	r0, #2
	bne	.L56
.L55:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	enemy
	.size	initEnemy, .-initEnemy
	.align	2
	.global	initCoins
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCoins, %function
initCoins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r0, #7
	mov	r5, #224
	mov	r7, #2
	mov	r6, #392
	mov	r2, r1
	mov	r4, #0
	mov	lr, #16
	mov	ip, #14
	mov	r9, #10
	mov	r8, #165
	ldr	r3, .L73
	stm	r3, {r5, r6}
	str	r1, [r3, #44]
	str	r7, [r3, #56]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	add	r5, r5, #198
	add	r3, r3, #80
.L66:
	cmp	r2, #1
	movne	r0, #15
	streq	r5, [r3, #4]
	stmne	r3, {r0, r8}
	streq	r9, [r3]
	cmp	r2, #2
	str	r4, [r3, #56]
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	str	r1, [r3, #44]
	add	r3, r3, #80
	movne	r2, #2
	bne	.L66
.L65:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	coin
	.size	initCoins, .-initCoins
	.align	2
	.global	initAmmo
	.syntax unified
	.arm
	.fpu softvfp
	.type	initAmmo, %function
initAmmo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #5
	push	{r4, r5, r6, r7, r8, lr}
	mov	r1, #6
	mov	r2, #1
	mov	ip, #220
	mov	r8, #35
	mov	r7, #30
	mov	r6, #50
	mov	r5, #500
	mov	r4, #130
	mov	lr, #70
	ldr	r3, .L77
	str	r0, [r3, #16]
	str	r0, [r3, #96]
	str	r0, [r3, #176]
	str	r0, [r3, #256]
	str	r0, [r3, #336]
	ldr	r0, .L77+4
	stm	r3, {r7, r8}
	str	r6, [r3, #164]
	str	r5, [r3, #244]
	str	r4, [r3, #240]
	str	lr, [r3, #320]
	str	r0, [r3, #324]
	str	r1, [r3, #20]
	str	r1, [r3, #100]
	str	r1, [r3, #180]
	str	r1, [r3, #260]
	str	r1, [r3, #340]
	str	r2, [r3, #44]
	str	r2, [r3, #124]
	str	r2, [r3, #204]
	str	r2, [r3, #284]
	str	r2, [r3, #364]
	str	ip, [r3, #84]
	str	ip, [r3, #80]
	str	ip, [r3, #160]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	ammo
	.word	290
	.size	initAmmo, .-initAmmo
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
	push	{r4, r5, r6, lr}
	mov	r4, #0
	mov	r2, #15
	ldr	r5, .L85
	ldr	lr, .L85+4
	ldr	ip, .L85+8
	ldr	r0, .L85+12
	ldr	r1, .L85+16
	ldr	r3, .L85+20
	str	r4, [r5]
	str	r4, [lr]
	str	r4, [ip]
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r3]
	ldr	r5, .L85+24
	ldr	lr, .L85+28
	ldr	ip, .L85+32
	ldr	r0, .L85+36
	ldr	r1, .L85+40
	ldr	r3, .L85+44
	str	r4, [r5]
	str	r4, [lr]
	str	r4, [ip]
	ldr	lr, .L85+48
	ldr	ip, .L85+52
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r3]
	ldr	r1, .L85+56
	ldr	r3, .L85+60
	ldr	r0, .L85+64
	ldr	r5, .L85+68
	str	r2, [r3]
	str	r4, [lr]
	str	r4, [ip]
	str	r4, [r1]
	str	r4, [r5]
	str	r4, [r0]
	bl	initPlayer
	bl	initEnemy
	mov	lr, #5
	mov	ip, #13
	mvn	r0, #4
	mov	r2, #3
	ldr	r3, .L85+72
	add	r1, r3, #400
.L80:
	str	lr, [r3, #20]
	str	ip, [r3, #16]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r4, [r3, #44]
	str	r4, [r3, #76]
	stm	r3, {r0, r4}
	add	r3, r3, #80
	cmp	r3, r1
	bne	.L80
	mov	r4, #5
	mov	lr, #13
	mvn	ip, #4
	mov	r2, #0
	mov	r0, #1
	ldr	r3, .L85+76
	add	r1, r3, #2400
.L81:
	str	r4, [r3, #20]
	str	lr, [r3, #16]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #12]
	str	r2, [r3, #44]
	add	r3, r3, #80
	cmp	r3, r1
	bne	.L81
	bl	initWeapons
	bl	initCoins
	pop	{r4, r5, r6, lr}
	b	initAmmo
.L86:
	.align	2
.L85:
	.word	vOff
	.word	hOff
	.word	won
	.word	timer
	.word	hasGun
	.word	hasKnife
	.word	hasShield
	.word	shielding
	.word	shieldingFrames
	.word	collTimer
	.word	ovrEnemyColl
	.word	stabbing
	.word	successfulStab
	.word	numWeapons
	.word	numBullets
	.word	maxJump
	.word	currWeapon
	.word	stabbingFrames
	.word	bullets
	.word	enemyBullets
	.size	initGame, .-initGame
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
	ldr	r3, .L91
	add	r0, r3, #400
.L88:
	str	r4, [r3, #20]
	str	lr, [r3, #16]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #44]
	str	r2, [r3, #76]
	add	r3, r3, #80
	cmp	r3, r0
	bne	.L88
	pop	{r4, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	initBulletsEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBulletsEnemy, %function
initBulletsEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mvn	ip, #4
	mov	r4, #5
	mov	lr, #13
	mov	r2, #0
	mov	r0, #1
	ldr	r3, .L97
	add	r1, r3, #2400
.L94:
	str	r4, [r3, #20]
	str	lr, [r3, #16]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #12]
	str	r2, [r3, #44]
	add	r3, r3, #80
	cmp	r3, r1
	bne	.L94
	pop	{r4, lr}
	bx	lr
.L98:
	.align	2
.L97:
	.word	enemyBullets
	.size	initBulletsEnemy, .-initBulletsEnemy
	.align	2
	.global	updateWeapon
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateWeapon, %function
updateWeapon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L123
	mov	r10, #0
	mov	r4, r5
	ldr	r6, .L123+4
	ldr	r8, .L123+8
	ldr	r9, .L123+12
	ldr	fp, .L123+16
	sub	sp, sp, #20
	add	r7, r5, #240
.L106:
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r6]
	ldr	r0, [r6, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L101
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L101
	ldr	r3, [r9]
	add	r3, r3, #1
	cmp	r3, #1
	ldreq	r2, .L123+20
	str	r3, [r9]
	ldr	r3, [r4, #56]
	streq	r3, [r2]
	cmp	r3, #3
	moveq	r3, #1
	str	r10, [r4, #44]
	streq	r3, [fp]
	beq	.L101
	cmp	r3, #4
	beq	.L120
	cmp	r3, #5
	moveq	r3, #1
	ldreq	r2, .L123+24
	streq	r3, [r2]
.L101:
	add	r4, r4, #80
	cmp	r4, r7
	bne	.L106
.L122:
	mov	ip, #512
	mov	fp, #264
	mov	r10, #136
	mov	r9, #8
	ldr	r3, .L123+28
	ldr	r2, .L123+32
	ldrh	r6, [r3]
	ldrh	r8, [r2]
	ldr	r3, .L123+36
	ldr	r4, .L123+40
	ldr	lr, .L123+44
.L111:
	ldr	r2, [r5, #44]
	cmp	r2, #1
	strhne	ip, [r3, #80]	@ movhi
	beq	.L121
.L109:
	add	r5, r5, #80
	cmp	r5, r7
	add	r3, r3, #8
	bne	.L111
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L121:
	ldm	r5, {r1, r2}
	ldr	r0, [r5, #56]
	sub	r2, r2, r6
	and	r2, r2, r4
	sub	r1, r1, r8
	orr	r2, r2, lr
	and	r1, r1, #255
	cmp	r0, #3
	strh	r2, [r3, #82]	@ movhi
	strh	r1, [r3, #80]	@ movhi
	strheq	r9, [r3, #84]	@ movhi
	beq	.L109
	cmp	r0, #4
	strheq	r10, [r3, #84]	@ movhi
	beq	.L109
	cmp	r0, #5
	strheq	fp, [r3, #84]	@ movhi
	b	.L109
.L120:
	mov	r3, #1
	ldr	r2, .L123+48
	add	r4, r4, #80
	cmp	r4, r7
	str	r3, [r2]
	bne	.L106
	b	.L122
.L124:
	.align	2
.L123:
	.word	weapon
	.word	player
	.word	collision
	.word	numWeapons
	.word	hasGun
	.word	currWeapon
	.word	hasShield
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	511
	.word	-32768
	.word	hasKnife
	.size	updateWeapon, .-updateWeapon
	.align	2
	.global	updateCoins
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCoins, %function
updateCoins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L138
	ldr	r5, .L138+4
	ldr	r9, .L138+8
	ldr	r6, .L138+12
	ldr	r8, .L138+16
	ldr	fp, .L138+20
	ldr	r10, .L138+24
	sub	sp, sp, #20
	add	r7, r4, #240
.L134:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	moveq	r3, #512
	strheq	r3, [r5, #128]	@ movhi
	beq	.L130
	ldr	r2, [r4]
	ldr	r3, [r9]
	ldr	r0, [r4, #56]
	sub	r3, r2, r3
	and	r3, r3, #255
	cmp	r0, #0
	strh	r3, [r5, #128]	@ movhi
	ldr	r1, [r4, #4]
	bne	.L127
	mov	r0, #24
	ldr	r3, [r10]
	sub	r3, r1, r3
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	strh	r3, [r5, #130]	@ movhi
	strh	r0, [r5, #132]	@ movhi
.L128:
	add	r0, r4, #16
	ldm	r0, {r0, r3}
	str	r1, [sp, #4]
	str	r2, [sp]
	str	r0, [sp, #12]
	str	r3, [sp, #8]
	ldr	r2, [r6, #20]
	ldr	r3, [r6, #16]
	ldm	r6, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L130
	mov	r2, #0
	ldr	r3, [r4, #56]
	cmp	r3, r2
	str	r2, [r4, #44]
	bne	.L131
	ldr	r3, [fp]
	add	r3, r3, #1
	str	r3, [fp]
.L130:
	add	r4, r4, #80
	cmp	r4, r7
	add	r5, r5, #8
	bne	.L134
.L137:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L127:
	cmp	r0, #2
	bne	.L128
	mov	r0, #23
	ldr	r3, [r10]
	sub	r3, r1, r3
	lsl	r3, r3, r0
	lsr	r3, r3, r0
	strh	r3, [r5, #130]	@ movhi
	strh	r0, [r5, #132]	@ movhi
	b	.L128
.L131:
	cmp	r3, #2
	bne	.L130
	ldr	r2, .L138+28
	ldr	r3, [r2]
	cmp	r3, #2
	addle	r3, r3, #1
	strle	r3, [r2]
	ldr	r3, [fp]
	add	r4, r4, #80
	add	r3, r3, #5
	cmp	r4, r7
	str	r3, [fp]
	add	r5, r5, #8
	bne	.L134
	b	.L137
.L139:
	.align	2
.L138:
	.word	coin
	.word	shadowOAM
	.word	vOff
	.word	player
	.word	collision
	.word	pts
	.word	hOff
	.word	lives
	.size	updateCoins, .-updateCoins
	.align	2
	.global	updateAmmo
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAmmo, %function
updateAmmo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L152
	ldr	r5, .L152+4
	ldr	fp, .L152+8
	ldr	r10, .L152+12
	ldr	r9, .L152+16
	ldr	r7, .L152+20
	ldr	r8, .L152+24
	sub	sp, sp, #20
	add	r6, r4, #400
.L145:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	moveq	r3, #512
	strheq	r3, [r5, #152]	@ movhi
	beq	.L143
	mov	r0, #30
	ldr	r2, [r4]
	ldr	ip, [fp]
	sub	ip, r2, ip
	and	ip, ip, #255
	ldr	r1, [r4, #4]
	ldr	r3, [r10]
	strh	ip, [r5, #152]	@ movhi
	ldr	ip, [r7]
	sub	r3, r1, r3
	and	r3, r3, r9
	cmp	ip, #94
	strh	r3, [r5, #154]	@ movhi
	strh	r0, [r5, #156]	@ movhi
	ble	.L151
.L143:
	add	r4, r4, #80
	cmp	r4, r6
	add	r5, r5, #8
	bne	.L145
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L151:
	add	r0, r4, #16
	ldm	r0, {r0, r3}
	ldr	ip, .L152+28
	str	r1, [sp, #4]
	str	r2, [sp]
	str	r0, [sp, #12]
	ldr	r2, [r8, #20]
	str	r3, [sp, #8]
	ldm	r8, {r0, r1}
	ldr	r3, [r8, #16]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r2, #0
	ldrne	r3, [r7]
	addne	r3, r3, #5
	strne	r3, [r7]
	strne	r2, [r4, #44]
	b	.L143
.L153:
	.align	2
.L152:
	.word	ammo
	.word	shadowOAM
	.word	vOff
	.word	hOff
	.word	511
	.word	numBullets
	.word	player
	.word	collision
	.size	updateAmmo, .-updateAmmo
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
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bxeq	lr
	b	updateBullet.part.0
	.size	updateBullet, .-updateBullet
	.align	2
	.global	updateBulletEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBulletEnemy, %function
updateBulletEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, lr}
	ldr	r2, [r0, #52]
	cmp	r2, #1
	mov	r4, r0
	ldr	r3, [r0, #4]
	ldr	r1, [r0, #16]
	sub	sp, sp, #20
	beq	.L171
	cmn	r2, #1
	beq	.L172
.L161:
	ldr	lr, [r4, #20]
	ldr	ip, [r4]
	ldr	r0, .L173
	str	r1, [sp, #12]
	str	r3, [sp, #4]
	ldr	r5, .L173+4
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	ldm	r0, {r0, r1}
	str	lr, [sp, #8]
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L156
	mov	r3, #0
	ldr	r2, .L173+8
	ldr	r2, [r2]
	cmp	r2, r3
	ldreq	r2, .L173+12
	str	r3, [r4, #44]
	ldreq	r3, [r2]
	subeq	r3, r3, #1
	streq	r3, [r2]
.L156:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L171:
	ldr	r0, .L173+16
	ldr	r2, [r4, #12]
	ldr	r0, [r0]
	add	r2, r3, r2
	add	r0, r0, #239
	cmp	r2, r0
	movle	r3, r2
	strle	r2, [r4, #4]
	ble	.L161
.L162:
	mov	r2, #0
	str	r2, [r4, #44]
	b	.L161
.L172:
	ldr	r2, .L173+16
	ldr	r0, [r0, #12]
	ldr	ip, [r2]
	add	r2, r3, r1
	sub	r2, r2, r0
	cmp	r2, ip
	subge	r3, r3, r0
	strge	r3, [r4, #4]
	bge	.L161
	b	.L162
.L174:
	.align	2
.L173:
	.word	player
	.word	collision
	.word	shielding
	.word	lives
	.word	hOff
	.size	updateBulletEnemy, .-updateBulletEnemy
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
	push	{r4, r5, r6, r7, lr}
	ldr	r0, .L190
	mov	lr, #1
	mov	r3, #0
	mov	r2, r0
	ldr	ip, .L190+4
	ldr	r1, [ip]
	sub	r1, r1, #1
	str	r1, [ip]
	ldr	ip, .L190+8
	str	lr, [ip, #64]
.L182:
	ldr	r1, [r2, #44]
	cmp	r1, #0
	beq	.L188
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #80
	bne	.L182
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L188:
	ldr	r2, .L190+12
	ldr	r2, [r2]
	cmp	r2, #0
	ldr	lr, [ip]
	ldr	r2, [ip, #4]
	beq	.L177
	mov	r6, #13
	mov	r5, #5
	add	r4, r3, r3, lsl #2
	add	ip, r0, r4, lsl #4
	str	r2, [ip, #4]
	ldr	r2, [ip, #16]
	sub	lr, lr, r2
	str	r1, [ip, #52]
	str	lr, [r0, r4, lsl #4]
	str	r6, [ip, #20]
	str	r5, [ip, #16]
	lsl	r2, r3, #2
.L178:
	mov	r1, #1
	add	r3, r2, r3
	add	r0, r0, r3, lsl #4
	str	r1, [r0, #44]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L177:
	ldr	r1, [ip, #28]
	cmp	r1, #1
	beq	.L179
	cmp	r1, #2
	beq	.L189
.L180:
	mov	r7, #1
	mov	r6, #5
	mov	r5, #13
	ldr	r1, [ip, #20]
	ldr	ip, [ip, #16]
	add	r4, r3, r3, lsl #2
	add	r2, r2, ip
	add	r1, r1, r1, lsr #31
	add	ip, r0, r4, lsl #4
	add	r1, lr, r1, asr r7
	ldr	lr, [ip, #16]
	add	lr, lr, lr, lsr #31
	sub	r2, r2, lr, asr r7
	sub	r1, r1, #3
	str	r2, [ip, #4]
	str	r1, [r0, r4, lsl #4]
	str	r7, [ip, #52]
	str	r6, [ip, #20]
	str	r5, [ip, #16]
	lsl	r2, r3, #2
	b	.L178
.L189:
	ldr	r1, [ip, #32]
	cmp	r1, #1
	bne	.L180
.L179:
	mvn	r6, #0
	mov	r5, #5
	mov	r4, #13
	ldr	r1, [ip, #20]
	add	r1, r1, r1, lsr #31
	add	r1, lr, r1, asr #1
	add	lr, r3, r3, lsl #2
	add	ip, r0, lr, lsl #4
	sub	r1, r1, #3
	str	r1, [r0, lr, lsl #4]
	ldr	r1, [ip, #16]
	add	r1, r1, r1, lsr #31
	sub	r2, r2, r1, asr #1
	str	r2, [ip, #4]
	str	r6, [ip, #52]
	str	r5, [ip, #20]
	str	r4, [ip, #16]
	lsl	r2, r3, #2
	b	.L178
.L191:
	.align	2
.L190:
	.word	bullets
	.word	numBullets
	.word	player
	.word	shootUp
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, #512
	mov	r8, #22
	mov	r7, #20
	ldr	r1, .L199
	ldr	r2, .L199+4
	ldr	r3, .L199+8
	ldrh	r5, [r1]
	ldrh	r4, [r2]
	ldr	r1, .L199+12
	ldr	lr, .L199+16
	ldr	ip, .L199+20
	add	r0, r3, #400
.L196:
	ldr	r2, [r3, #44]
	cmp	r2, #0
	strheq	r6, [r1, #192]	@ movhi
	beq	.L195
	ldm	r3, {r2, r9}
	ldr	r10, [r3, #52]
	sub	r2, r2, r5
	and	r2, r2, #255
	sub	r9, r9, r4
	cmp	r10, #0
	and	r9, r9, lr
	orr	r10, r2, #16384
	orr	r2, r2, ip
	strhne	r10, [r1, #192]	@ movhi
	strhne	r9, [r1, #194]	@ movhi
	strhne	r7, [r1, #196]	@ movhi
	strheq	r2, [r1, #192]	@ movhi
	strheq	r9, [r1, #194]	@ movhi
	strheq	r8, [r1, #196]	@ movhi
.L195:
	add	r3, r3, #80
	cmp	r3, r0
	add	r1, r1, #8
	bne	.L196
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L200:
	.align	2
.L199:
	.word	vOff
	.word	hOff
	.word	bullets
	.word	shadowOAM
	.word	511
	.word	-32768
	.size	drawBullets, .-drawBullets
	.align	2
	.global	drawBulletsEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBulletsEnemy, %function
drawBulletsEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r7, #512
	mov	r6, #20
	ldr	r2, .L207
	ldr	r1, .L207+4
	ldr	r3, .L207+8
	ldrh	r4, [r2]
	ldrh	r5, [r1]
	ldr	r2, .L207+12
	ldr	lr, .L207+16
	add	ip, r3, #2400
.L204:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	strheq	r7, [r2, #232]	@ movhi
	beq	.L203
	ldr	r1, [r3]
	ldr	r0, [r3, #4]
	sub	r1, r1, r5
	and	r1, r1, #255
	sub	r0, r0, r4
	orr	r1, r1, #16384
	and	r0, r0, lr
	strh	r6, [r2, #236]	@ movhi
	strh	r1, [r2, #232]	@ movhi
	strh	r0, [r2, #234]	@ movhi
.L203:
	add	r3, r3, #80
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L204
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L208:
	.align	2
.L207:
	.word	hOff
	.word	vOff
	.word	enemyBullets
	.word	shadowOAM
	.word	511
	.size	drawBulletsEnemy, .-drawBulletsEnemy
	.align	2
	.global	fireBulletEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBulletEnemy, %function
fireBulletEnemy:
	@ Function supports interworking.
	@ args = 80, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, r5, lr}
	ldr	r4, .L222
	mov	ip, #0
	mov	lr, r4
	add	r5, sp, #8
	stmib	r5, {r0, r1, r2, r3}
	ldr	r2, [sp, #56]
.L213:
	ldr	r3, [lr, #44]
	cmp	r3, #0
	bne	.L210
	cmp	r2, #0
	bne	.L221
.L210:
	add	ip, ip, #1
	cmp	ip, #30
	add	lr, lr, #80
	bne	.L213
	pop	{r4, r5, lr}
	add	sp, sp, #16
	bx	lr
.L221:
	mov	r0, #1
	ldr	r2, [sp, #64]
	mov	r5, #5
	mov	lr, #13
	cmn	r2, #1
	movne	r2, #1
	ldr	r1, [sp, #32]
	ldr	r3, [sp, #12]
	add	r1, r1, r1, lsr #31
	add	r3, r3, r1, asr r0
	add	ip, ip, ip, lsl #2
	sub	r3, r3, #3
	str	r3, [r4, ip, lsl #4]
	add	ip, r4, ip, lsl #4
	ldr	r3, [sp, #16]
	str	r5, [ip, #20]
	str	lr, [ip, #16]
	pop	{r4, r5, lr}
	str	r3, [ip, #4]
	str	r2, [ip, #52]
	str	r0, [ip, #44]
	add	sp, sp, #16
	bx	lr
.L223:
	.align	2
.L222:
	.word	enemyBullets
	.size	fireBulletEnemy, .-fireBulletEnemy
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
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, r3
	ldr	r2, .L281
	ldr	r4, .L281+4
	ldr	r5, .L281+8
	str	r3, [r2]
	ldr	r10, .L281+12
	ldr	r9, .L281+16
	ldr	r7, .L281+20
	ldr	r8, .L281+24
	sub	sp, sp, #68
.L252:
	ldr	r3, [r10]
	cmp	r3, #0
	ldr	r3, [r4, #44]
	bne	.L225
	cmp	r3, #0
	beq	.L227
	ldr	r3, .L281+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L228
.L232:
	ldr	r3, [r4, #60]
	cmp	r3, #0
	bgt	.L227
	mov	r2, #0
	ldr	r1, .L281+32
	ldr	r3, [r1]
	add	r3, r3, #1
	str	r3, [r1]
	str	r2, [r4, #44]
.L227:
	ldr	r2, [r4, #68]
	cmp	r2, #0
	ldr	r3, [r9]
	ble	.L277
.L233:
	ldr	r1, [r4, #72]
	cmp	r2, r1
	blt	.L236
	mvn	ip, #0
	smull	r0, r1, r8, r3
	asr	r0, r3, #31
	rsb	r1, r0, r1, asr #3
	add	r1, r1, r1, lsl #2
	cmp	r3, r1, lsl #2
	str	ip, [r4, #52]
	ldr	r1, [r4, #56]
	bne	.L238
	cmp	r1, #1
	bne	.L276
.L239:
	ldr	r1, .L281+36
	ldr	ip, .L281+40
	mla	ip, r3, ip, r1
	mov	r1, ip
	ldr	ip, .L281+44
	cmp	ip, r1, ror #2
	bcc	.L240
.L276:
	mov	ip, sp
	ldr	r3, .L281+4
	add	fp, r6, r6, lsl #2
	add	fp, r3, fp, lsl #4
	add	lr, fp, #16
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldm	fp, {r0, r1, r2, r3}
	bl	fireBulletEnemy
	ldr	r3, [r9]
.L236:
	smull	r2, r1, r8, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #1
	add	r2, r2, r2, lsl #2
	cmp	r3, r2
	bne	.L242
	ldr	r3, [r4, #52]
	cmp	r3, #1
	ldr	r2, [r4, #68]
	beq	.L253
.L243:
	ldr	r3, [r4, #4]
	sub	r2, r2, #1
	sub	r3, r3, #1
	str	r2, [r4, #68]
	str	r3, [r4, #4]
.L242:
	ldr	fp, [r4, #24]
	rsb	r3, fp, fp, lsl #3
	add	r3, r3, r3, lsl #6
	add	r3, fp, r3, lsl #3
	ldr	r2, .L281+48
	rsb	r3, r3, r3, lsl #15
	ldr	r1, .L281+52
	add	r3, fp, r3, lsl #3
	add	r2, r3, r2
	cmp	r1, r2, ror #3
	bcc	.L244
	ldr	r0, [r4, #36]
	ldr	r3, .L281+56
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L244:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	moveq	r3, #512
	add	fp, fp, #1
	str	fp, [r4, #24]
	strheq	r3, [r5, #104]	@ movhi
	beq	.L248
	ldr	r3, .L281+60
	ldr	r1, [r4, #4]
	ldr	r3, [r3]
	sub	r3, r1, r3
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, .L281+64
	ldr	r0, [r4]
	ldr	r2, [r2]
	ldr	ip, [r4, #56]
	sub	r2, r0, r2
	and	r2, r2, #255
	cmp	ip, #0
	strh	r3, [r5, #106]	@ movhi
	strh	r2, [r5, #104]	@ movhi
	bne	.L246
	ldr	r3, [r4, #36]
	lsl	r3, r3, #7
	add	r3, r3, #16
	strh	r3, [r5, #108]	@ movhi
.L247:
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	ip, .L281+68
	stm	sp, {r0, r1}
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #16]
	ldm	r7, {r0, r1}
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L248
	ldr	r0, .L281+72
	ldr	r2, [r0]
	cmp	r2, #3
	mov	ip, #1
	moveq	r2, #2
	ldr	r3, .L281
	ldr	r1, .L281+76
	str	ip, [r3]
	streq	r2, [r0]
	ldr	r3, [r1]
	beq	.L250
	cmp	r2, #2
	beq	.L278
	cmp	r2, #1
	beq	.L279
.L250:
	add	r3, r3, #1
	str	r3, [r1]
.L248:
	add	r6, r6, #1
	cmp	r6, #3
	add	r4, r4, #80
	add	r5, r5, #8
	bne	.L252
	add	sp, sp, #68
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L228:
	ldr	r3, [r7, #4]
	add	r0, r7, #16
	ldm	r0, {r0, r1}
	ldr	r2, [r7]
	add	r3, r3, #5
	str	r3, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	ldr	ip, .L281+68
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L280
.L231:
	mov	r2, #1
	ldr	r3, [r4, #60]
	sub	r3, r3, #1
	str	r3, [r4, #60]
	str	r2, [r10]
.L275:
	ldr	r3, [r4, #44]
.L225:
	cmp	r3, #0
	bne	.L232
	ldr	r2, [r4, #68]
	cmp	r2, #0
	ldr	r3, [r9]
	bgt	.L233
.L277:
	mov	ip, #1
	smull	r0, r1, r8, r3
	asr	r0, r3, #31
	rsb	r1, r0, r1, asr #3
	add	r1, r1, r1, lsl #2
	cmp	r3, r1, lsl #2
	str	ip, [r4, #52]
	ldr	r1, [r4, #56]
	bne	.L234
	cmp	r1, ip
	bne	.L276
.L235:
	ldr	r1, .L281+36
	ldr	ip, .L281+40
	mla	ip, r3, ip, r1
	mov	r1, ip
	ldr	ip, .L281+44
	cmp	ip, r1, ror #2
	bcc	.L237
	b	.L276
.L246:
	cmp	ip, #1
	ldreq	r3, [r4, #36]
	lsleq	r3, r3, #7
	addeq	r3, r3, #400
	strheq	r3, [r5, #108]	@ movhi
	b	.L247
.L234:
	cmp	r1, #1
	beq	.L235
.L237:
	smull	ip, r1, r8, r3
	rsb	r0, r0, r1, asr #1
	add	r0, r0, r0, lsl #2
	cmp	r3, r0
	bne	.L242
.L253:
	ldr	r3, [r4, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	str	r2, [r4, #68]
	str	r3, [r4, #4]
	b	.L242
.L238:
	cmp	r1, #1
	beq	.L239
.L240:
	smull	ip, r1, r8, r3
	rsb	r0, r0, r1, asr #1
	add	r0, r0, r0, lsl #2
	cmp	r3, r0
	bne	.L242
	b	.L243
.L279:
	ldr	r2, .L281+36
	ldr	ip, .L281+40
	mla	ip, r3, ip, r2
	mov	r2, ip
	ldr	ip, .L281+44
	cmp	ip, r2, ror #2
	movcs	r2, #0
	strcs	r2, [r0]
	b	.L250
.L280:
	ldr	r3, [r7, #4]
	add	r0, r7, #16
	ldm	r0, {r0, r1}
	ldr	r2, [r7]
	sub	r3, r3, #5
	str	r3, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	ldr	ip, .L281+68
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L231
	b	.L275
.L278:
	ldr	r2, .L281+36
	ldr	lr, .L281+40
	mla	lr, r3, lr, r2
	mov	r2, lr
	ldr	lr, .L281+44
	cmp	lr, r2, ror #2
	strcs	ip, [r0]
	b	.L250
.L282:
	.align	2
.L281:
	.word	ovrEnemyColl
	.word	enemy
	.word	shadowOAM
	.word	successfulStab
	.word	timer
	.word	player
	.word	1717986919
	.word	stabbing
	.word	pts
	.word	85899344
	.word	-1030792151
	.word	42949672
	.word	238609288
	.word	59652322
	.word	__aeabi_idivmod
	.word	hOff
	.word	vOff
	.word	collision
	.word	lives
	.word	collTimer
	.size	updateEnemy, .-updateEnemy
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
	ldr	r3, .L359
	ldr	r4, .L359+4
	ldr	r1, [r3]
	ldr	r2, [r4, #4]
	sub	r1, r2, r1
	lsl	r1, r1, #23
	lsr	r1, r1, #23
	mvn	r1, r1, lsl #17
	mvn	r1, r1, lsr #17
	ldr	r3, .L359+8
	ldr	lr, .L359+12
	ldr	r0, [r3]
	ldr	r3, [r4]
	ldr	ip, [lr]
	ldr	r5, .L359+16
	sub	r0, r3, r0
	and	r0, r0, #255
	cmp	ip, #0
	strh	r1, [r5, #2]	@ movhi
	strh	r0, [r5]	@ movhi
	sub	sp, sp, #16
	beq	.L284
	ldr	r1, [r4, #32]
	cmp	r1, #0
	bne	.L355
.L285:
	mov	r1, #384
	strh	r1, [r5, #4]	@ movhi
.L287:
	ldr	r1, .L359+20
	ldr	r1, [r1]
	tst	r1, #1
	bne	.L283
	ldr	r0, .L359+24
	ldr	ip, .L359+28
	ldr	r1, [r0]
	ldr	ip, [ip]
	add	r1, r1, #1
	cmp	r1, ip
	sub	ip, r3, #2
	str	r1, [r0]
	str	ip, [r4]
	beq	.L290
	ldr	r1, .L359+32
	ldr	r1, [r1]
	sub	r3, r3, #3
	add	r2, r1, r2
	ldrb	r1, [r2, r3, lsl #9]	@ zero_extendqisi2
	cmp	r1, #0
	add	r2, r2, r3, lsl #9
	beq	.L290
	ldr	r3, [r4, #16]
	add	r1, r3, r3, lsr #31
	ldrb	r1, [r2, r1, asr #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L290
	add	r2, r2, r3
	ldrb	r3, [r2, #-1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L283
.L290:
	mov	r1, #0
	mov	r2, #1
	ldr	r3, .L359+36
	str	r1, [lr]
	str	r2, [r3]
.L283:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L355:
	ldr	r0, [r4, #28]
	cmp	r0, #0
	beq	.L285
	cmp	r0, #1
	cmpne	r1, #1
	moveq	r1, #388
	strheq	r1, [r5, #4]	@ movhi
	b	.L287
.L284:
	ldr	r6, [r4, #8]
	ldr	r1, [r4, #16]
	ldr	lr, [r4, #20]
	str	ip, [sp, #8]
	ldr	r0, .L359+32
	add	r3, r3, #2
	ldr	r0, [r0]
	stm	sp, {r1, lr}
	str	r6, [sp, #12]
	mov	r1, #512
	ldr	r6, .L359+40
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L356
	ldr	r2, .L359+36
	ldr	r3, [r2]
	cmp	r3, #0
	ldr	r3, [r4, #32]
	beq	.L293
	cmp	r3, #0
	bne	.L357
.L294:
	mov	r3, #384
	strh	r3, [r5, #4]	@ movhi
.L296:
	ldr	r3, .L359+20
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L283
	ldr	r1, .L359+24
	ldr	r3, [r1]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r1]
	streq	r3, [r2]
	b	.L283
.L356:
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L293:
	ldr	r2, .L359+44
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L358
	ldr	r2, .L359+48
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L300
	cmp	r3, #0
	beq	.L301
	ldr	r2, [r4, #28]
	cmp	r2, #0
	beq	.L301
	cmp	r2, #1
	cmpne	r3, #1
	moveq	r3, #772
	strheq	r3, [r5, #4]	@ movhi
	b	.L283
.L358:
	cmp	r3, #0
	beq	.L298
	ldr	r2, [r4, #28]
	cmp	r2, #0
	beq	.L298
	cmp	r2, #1
	cmpne	r3, #1
	moveq	r3, #516
	strheq	r3, [r5, #4]	@ movhi
	b	.L283
.L357:
	ldr	r1, [r4, #28]
	cmp	r1, #0
	beq	.L294
	cmp	r1, #1
	cmpne	r3, #1
	moveq	r3, #388
	strheq	r3, [r5, #4]	@ movhi
	b	.L296
.L298:
	mov	r3, #512
	strh	r3, [r5, #4]	@ movhi
	b	.L283
.L300:
	ldr	r2, [r4, #64]
	cmp	r2, #0
	beq	.L303
	cmp	r3, #0
	beq	.L304
	ldr	r2, [r4, #28]
	cmp	r2, #0
	beq	.L304
	cmp	r3, #1
	cmpne	r2, #1
	moveq	r3, #644
	strheq	r3, [r5, #4]	@ movhi
	b	.L283
.L301:
	mov	r3, #768
	strh	r3, [r5, #4]	@ movhi
	b	.L283
.L303:
	cmp	r3, #0
	ldr	r2, [r4, #28]
	bne	.L306
	cmp	r2, #0
	bne	.L354
.L307:
	ldr	r3, [r4, #36]
	lsl	r3, r3, #7
	strh	r3, [r5, #4]	@ movhi
	b	.L283
.L304:
	mov	r3, #640
	strh	r3, [r5, #4]	@ movhi
	b	.L283
.L306:
	cmp	r3, #1
	bne	.L308
	cmp	r2, #1
	beq	.L309
	mov	r3, #4
	strh	r3, [r5, #4]	@ movhi
	b	.L283
.L308:
	cmp	r2, #0
	beq	.L307
	cmp	r2, #1
	bne	.L283
.L309:
	ldr	r3, [r4, #36]
	lsl	r3, r3, #7
	add	r3, r3, #4
.L354:
	strh	r3, [r5, #4]	@ movhi
	b	.L283
.L360:
	.align	2
.L359:
	.word	hOff
	.word	player
	.word	vOff
	.word	jumped
	.word	shadowOAM
	.word	timer
	.word	jumpCount
	.word	maxJump
	.word	.LANCHOR0
	.word	fallen
	.word	collisionCheck
	.word	stabbing
	.word	shielding
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	updateCamera
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCamera, %function
updateCamera:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L364
	ldr	r3, [r3]
	cmp	r3, #128
	movgt	r2, #96
	movle	r2, #0
	ldr	r3, .L364+4
	str	r2, [r3]
	bx	lr
.L365:
	.align	2
.L364:
	.word	player
	.word	vOff
	.size	updateCamera, .-updateCamera
	.align	2
	.global	switchWeapons
	.syntax unified
	.arm
	.fpu softvfp
	.type	switchWeapons, %function
switchWeapons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L382
	ldr	r3, [r2]
	cmp	r3, #5
	beq	.L380
	cmp	r3, #4
	beq	.L381
	cmp	r3, #3
	bxne	lr
	ldr	r3, .L382+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L372
	ldr	r3, .L382+8
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
.L373:
	mov	r3, #4
	str	r3, [r2]
	bx	lr
.L381:
	ldr	r3, .L382+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L371
	ldr	r3, .L382+4
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
.L372:
	mov	r3, #5
	str	r3, [r2]
	bx	lr
.L380:
	ldr	r3, .L382+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L373
	ldr	r3, .L382+12
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
.L371:
	mov	r3, #3
	str	r3, [r2]
	bx	lr
.L383:
	.align	2
.L382:
	.word	currWeapon
	.word	hasShield
	.word	hasKnife
	.word	hasGun
	.size	switchWeapons, .-switchWeapons
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
	ldr	r5, .L458
	ldrh	r3, [r5]
	tst	r3, #4
	sub	sp, sp, #20
	beq	.L385
	ldr	r3, .L458+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L453
.L385:
	ldr	r3, .L458+8
	ldr	r3, [r3]
	cmp	r3, #0
	moveq	r2, #100
	ldreq	r3, .L458+12
	streq	r2, [r3]
	ldr	r3, .L458+16
	ldr	r1, .L458+20
	ldr	r2, .L458+24
	ldr	r3, [r3]
	mla	r3, r1, r3, r2
	ldr	r2, .L458+28
	cmp	r3, r2
	movls	r3, #0
	ldrls	r2, .L458+32
	ldr	r6, .L458+36
	ldrls	r4, .L458+40
	ldrhi	r4, .L458+40
	ldrls	r1, .L458+44
	strls	r3, [r2]
	ldr	r2, [r6]
	strls	r3, [r1]
	strls	r3, [r4, #64]
	ldr	r3, [r4, #48]
	cmp	r2, #3
	addne	r3, r3, #1
	beq	.L454
.L389:
	cmp	r2, #4
	str	r3, [r4, #48]
	beq	.L455
	cmp	r2, #5
	bne	.L451
	ldrh	r3, [r5]
	tst	r3, #1
	beq	.L397
	ldr	r3, .L458+4
	ldrh	r3, [r3]
	tst	r3, #1
	moveq	r3, #1
	bne	.L397
.L396:
	ldr	r2, [r4, #28]
	ldr	r1, .L458+48
	cmp	r2, #2
	str	r3, [r1]
	movne	r3, #2
	strne	r3, [r4, #28]
	ldr	r3, [r4, #24]
	strne	r2, [r4, #32]
	ands	r3, r3, #3
	bne	.L399
	add	r1, r4, #36
	ldm	r1, {r1, r2}
	sub	r2, r2, #1
	cmp	r1, r2
	addlt	r1, r1, #1
	strlt	r1, [r4, #36]
	strge	r3, [r4, #36]
.L399:
	ldr	r3, .L458+52
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	bne	.L401
	ldr	r2, [r4, #4]
	cmp	r2, #0
	bgt	.L456
.L401:
	ldr	r3, .L458+52
	ldrh	r3, [r3, #48]
	ands	r6, r3, #16
	bne	.L403
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #16]
	add	r1, r2, r3
	cmp	r1, #512
	ble	.L457
.L403:
	ldrh	r3, [r5]
	tst	r3, #2
	beq	.L405
	ldr	r3, .L458+4
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L405
.L406:
	ldr	r5, .L458+56
	ldr	r2, .L458+60
	ldr	r3, [r5]
	ldr	r2, [r2]
	orrs	r3, r3, r2
	bne	.L407
	mov	r0, #1
	mvn	r1, #0
	ldr	r2, .L458+64
	str	r0, [r5]
	str	r1, [r4, #8]
	str	r3, [r2]
.L407:
	ldr	r3, .L458+52
	ldrh	r3, [r3, #48]
	lsr	r3, r3, #6
	ldr	r2, .L458+68
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
	bne	.L384
	ldr	r3, .L458+72
	ldr	r0, [r4]
	ldr	r2, [r4, #20]
	ldr	r3, [r3]
	ldr	r1, [r4, #4]
	add	r2, r0, r2
	add	r3, r3, r2, lsl #9
	ldrb	r2, [r3, r1]	@ zero_extendqisi2
	cmp	r2, #0
	add	r3, r3, r1
	beq	.L384
	ldr	r2, [r4, #16]
	add	r1, r2, r2, lsr #31
	ldrb	r1, [r3, r1, asr #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L384
	add	r3, r3, r2
	ldrb	r3, [r3, #-1]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r0, r0, #1
	strne	r0, [r4]
.L384:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L455:
	ldrh	r3, [r5]
	ands	r3, r3, #1
	beq	.L396
	ldr	r3, .L458+4
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L451
	mov	r1, #1
	ldr	r2, .L458+44
	str	r1, [r2]
	b	.L396
.L453:
	ldr	r3, .L458+76
	ldr	r3, [r3]
	cmp	r3, #1
	ble	.L385
	bl	switchWeapons
	b	.L385
.L397:
	ldr	r3, .L458+52
	ldrh	r3, [r3, #48]
	and	r3, r3, #1
	rsb	r3, r3, #1
	b	.L396
.L405:
	ldr	r3, .L458+52
	ldrh	r3, [r3, #48]
	tst	r3, #2
	beq	.L406
	ldr	r5, .L458+56
	b	.L407
.L454:
	ldrh	r2, [r5]
	tst	r2, #1
	beq	.L452
	ldr	r2, .L458+4
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L452
	cmp	r3, #9
	bgt	.L393
.L452:
	add	r3, r3, #1
	str	r3, [r4, #48]
.L451:
	mov	r3, #0
	b	.L396
.L456:
	ldr	r1, [r4, #12]
	add	ip, r4, #16
	rsb	r1, r1, #0
	ldm	ip, {ip, lr}
	ldr	r0, .L458+72
	str	r3, [sp, #12]
	str	r1, [sp, #8]
	ldr	r3, [r4]
	ldr	r0, [r0]
	mov	r1, #512
	stm	sp, {ip, lr}
	ldr	r6, .L458+80
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L401
	mov	r0, #1
	ldr	r1, .L458+84
	ldr	r3, [r4, #4]
	ldr	r2, [r1]
	ldr	ip, [r4, #12]
	cmp	r2, #0
	sub	r3, r3, ip
	str	r3, [r4, #4]
	str	r0, [r4, #28]
	ble	.L403
	sub	r3, r3, r2
	cmp	r3, #120
	suble	r2, r2, #1
	strle	r2, [r1]
	b	.L403
.L457:
	ldr	r1, [r4, #20]
	str	r3, [sp]
	ldr	ip, [r4, #12]
	str	r6, [sp, #12]
	ldr	r0, .L458+72
	ldr	r3, [r4]
	ldr	r0, [r0]
	ldr	r7, .L458+80
	stmib	sp, {r1, ip}
	mov	r1, #512
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L403
	ldr	r1, .L458+84
	ldr	r3, [r4, #4]
	ldr	r2, [r1]
	ldr	r0, [r4, #12]
	cmp	r2, #272
	add	r3, r3, r0
	str	r6, [r4, #28]
	str	r3, [r4, #4]
	bge	.L403
	sub	r3, r3, r2
	cmp	r3, #119
	addgt	r2, r2, #1
	strgt	r2, [r1]
	b	.L403
.L393:
	ldr	r2, .L458+88
	ldr	r2, [r2]
	cmp	r2, #0
	ble	.L452
	bl	fireBullet
	mov	r3, #1
	ldr	r2, [r6]
	b	.L389
.L459:
	.align	2
.L458:
	.word	oldButtons
	.word	buttons
	.word	ovrEnemyColl
	.word	collTimer
	.word	timer
	.word	-1527099483
	.word	47721858
	.word	95443716
	.word	successfulStab
	.word	currWeapon
	.word	player
	.word	stabbing
	.word	shielding
	.word	67109120
	.word	jumped
	.word	fallen
	.word	jumpCount
	.word	shootUp
	.word	.LANCHOR0
	.word	numWeapons
	.word	collisionCheck
	.word	hOff
	.word	numBullets
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
	ldr	r3, .L472
	ldr	r3, [r3]
	cmp	r3, #128
	movgt	r2, #96
	movle	r2, #0
	ldr	r3, .L472+4
	push	{r4, r5, r6, lr}
	str	r2, [r3]
	bl	updatePlayer
	bl	updateEnemy
	bl	updateCoins
	bl	updateAmmo
	ldr	r4, .L472+8
	add	r5, r4, #400
.L463:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	movne	r0, r4
	blne	updateBullet.part.0
.L462:
	add	r4, r4, #80
	cmp	r4, r5
	bne	.L463
	ldr	r4, .L472+12
	add	r5, r4, #2400
.L464:
	mov	r0, r4
	add	r4, r4, #80
	bl	updateBulletEnemy
	cmp	r5, r4
	bne	.L464
	bl	drawBullets
	bl	drawBulletsEnemy
	bl	updateWeapon
	ldr	lr, .L472+16
	ldr	ip, [lr]
	ldr	r4, .L472+20
	add	ip, ip, #1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L472+24
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L473:
	.align	2
.L472:
	.word	player
	.word	vOff
	.word	bullets
	.word	enemyBullets
	.word	timer
	.word	DMANow
	.word	shadowOAM
	.size	updateGame, .-updateGame
	.global	collisionMap
	.comm	numBullets,4,4
	.comm	numWeapons,4,4
	.comm	currWeapon,4,4
	.comm	shieldingFrames,4,4
	.comm	shielding,4,4
	.comm	successfulStab,4,4
	.comm	stabbingFrames,4,4
	.comm	stabbing,4,4
	.comm	ovrEnemyColl,4,4
	.comm	maxJump,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	collTimer,4,4
	.comm	shootUp,4,4
	.comm	hasShield,4,4
	.comm	hasKnife,4,4
	.comm	hasGun,4,4
	.comm	pts,4,4
	.comm	lives,4,4
	.comm	jumpCount,4,4
	.comm	fallen,4,4
	.comm	won,4,4
	.comm	jumped,4,4
	.comm	timer,4,4
	.comm	shadowOAM,1024,4
	.comm	enemyBullets,2400,4
	.comm	bullets,400,4
	.comm	weapon,240,4
	.comm	ammo,400,4
	.comm	coin,240,4
	.comm	enemy,240,4
	.comm	player,80,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	collisionMap, %object
	.size	collisionMap, 4
collisionMap:
	.word	collisionMapBitmap
	.ident	"GCC: (devkitARM release 53) 9.1.0"
