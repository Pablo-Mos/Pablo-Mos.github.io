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
	ldr	r3, .L34
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
	ldr	r1, [r5, #4]
	ldr	ip, [r5, #16]
	ldr	r2, [r5]
	ldr	r0, [r5, #20]
	beq	.L31
	cmn	r3, #1
	beq	.L32
	ldr	r4, [r5, #8]
	add	lr, r2, r0
	sub	lr, lr, r4
	cmp	lr, #0
	movlt	lr, #0
	subge	r2, r2, r4
	strge	r2, [r5]
	strlt	lr, [r5, #44]
	cmp	r3, #0
	bne	.L17
.L12:
	mov	r8, #0
	ldr	r4, .L34+4
	ldr	r7, .L34+8
	add	r6, r4, #320
.L15:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L33
.L13:
	add	r4, r4, #80
	cmp	r6, r4
	bne	.L15
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	str	r2, [sp]
	mov	r3, #32
	mov	r2, #8
	mov	r1, #992
	mov	r0, #24
	str	ip, [sp, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L1
	mov	r3, #0
	mov	r1, #1
	ldr	ip, .L34+12
	ldr	r0, .L34+16
	ldr	r2, .L34+20
	strh	r3, [ip, #250]	@ movhi
	str	r3, [r0, #2300]
	str	r3, [r5, #44]
	str	r1, [r2]
.L1:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L32:
	ldr	lr, [r5, #12]
	add	r3, r1, ip
	sub	r3, r3, lr
	cmp	r3, #0
	subge	r1, r1, lr
	strge	r1, [r5, #4]
	blt	.L9
.L17:
	ldr	r3, [r5, #76]
	add	r2, r2, r3
	str	r2, [r5]
	b	.L12
.L31:
	ldr	r3, [r5, #12]
	add	r3, r1, r3
	cmp	r3, #1024
	movlt	r1, r3
	strlt	r3, [r5, #4]
	blt	.L17
.L9:
	mov	r3, #0
	str	r3, [r5, #44]
	ldr	r3, [r5, #76]
	add	r2, r2, r3
	str	r2, [r5]
	b	.L12
.L33:
	str	ip, [sp, #12]
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	str	r2, [sp]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	strne	r8, [r5, #44]
	ldrne	r3, [r4, #60]
	subne	r3, r3, #1
	strne	r3, [r4, #60]
	ldr	r2, [r5]
	ldr	r1, [r5, #4]
	ldr	r0, [r5, #20]
	ldr	ip, [r5, #16]
	b	.L13
.L35:
	.align	2
.L34:
	.word	67109120
	.word	enemy
	.word	collision
	.word	100726784
	.word	100724736
	.word	keyFall
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
	ldr	r0, .L52
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r1, r2
	mov	r3, r0
	mov	r5, #7
	mov	ip, #5
	mov	r8, #232
	mov	r7, #220
	mov	r4, #2
	mov	lr, #1
	mov	r6, #4
	mov	r10, #60
.L43:
	cmp	r2, #0
	moveq	r9, #3
	streq	r9, [r0, #56]
	beq	.L38
	cmp	r2, #1
	streq	r6, [r0, #136]
	beq	.L40
	str	ip, [r0, #216]
	ldr	r9, [r3, #56]
	cmp	r9, #5
	beq	.L41
	bgt	.L42
	cmp	r9, #3
	beq	.L38
	cmp	r9, #4
	beq	.L40
.L42:
	add	r2, r2, #1
	cmp	r2, #3
	add	r3, r3, #80
	bne	.L43
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L41:
	mov	r9, #100
	mov	fp, #8
	str	r9, [r3]
	mov	r9, #170
	str	r5, [r3, #16]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	r4, [r3, #40]
	str	r1, [r3, #28]
	str	lr, [r3, #44]
	str	fp, [r3, #20]
	str	r9, [r3, #4]
	b	.L42
.L40:
	mov	r9, #65
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	r10, [r3]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	r4, [r3, #40]
	str	r1, [r3, #28]
	str	lr, [r3, #44]
	str	r9, [r3, #4]
	b	.L42
.L38:
	str	r5, [r3, #16]
	str	ip, [r3, #20]
	str	r8, [r3]
	str	r7, [r3, #4]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	r4, [r3, #40]
	str	r1, [r3, #28]
	str	lr, [r3, #44]
	b	.L42
.L53:
	.align	2
.L52:
	.word	weapon
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
	push	{r4, r5, r6, lr}
	mov	r1, #1
	mov	lr, #3
	mov	ip, #20
	mov	r2, #0
	mov	r6, #9
	mov	r5, #22
	mov	r4, #5
	ldr	r3, .L56
	ldr	r0, [r3]
	ldr	r3, .L56+4
	add	r0, r0, #86
	str	r0, [r3]
	str	lr, [r3, #40]
	str	ip, [r3, #48]
	ldr	lr, .L56+8
	ldr	ip, .L56+12
	ldr	r0, .L56+16
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	r1, [r3, #28]
	ldr	r1, .L56+20
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	r4, [r3, #4]
	str	r2, [lr]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #64]
	str	r2, [ip]
	str	r2, [r0]
	str	r2, [r1]
	pop	{r4, r5, r6, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	vOff
	.word	player
	.word	jumpCount
	.word	jumped
	.word	fallen
	.word	shootUp
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initKey
	.syntax unified
	.arm
	.fpu softvfp
	.type	initKey, %function
initKey:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #7
	mov	r0, #13
	mov	r1, #5
	mov	r2, #1012
	ldr	r3, .L59
	stm	r3, {r1, r2}
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	bx	lr
.L60:
	.align	2
.L59:
	.word	key
	.size	initKey, .-initKey
	.align	2
	.global	initDoor
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDoor, %function
initDoor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #16
	mov	r0, #32
	mov	r1, #184
	mov	r2, #1008
	ldr	r3, .L62
	stm	r3, {r1, r2}
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	bx	lr
.L63:
	.align	2
.L62:
	.word	door
	.size	initDoor, .-initDoor
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
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L74
	mov	r0, r2
	mov	r3, r5
	mov	lr, #10
	mov	ip, #23
	mov	r1, #1
	mov	r4, #3
	mov	r8, #2
	mov	r7, #20
	mov	fp, #57
.L71:
	cmp	r2, #0
	bne	.L65
	mov	r6, #4
	mov	r10, #97
	mov	r9, #204
	str	r1, [r5, #56]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #68]
	mov	r2, #1
	stm	r3, {r9, r10}
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	r1, [r3, #28]
	str	r4, [r3, #40]
	str	r1, [r3, #44]
	str	r6, [r3, #60]
	str	r6, [r3, #72]
	add	r3, r3, #80
.L65:
	cmp	r2, #1
	str	r0, [r3, #56]
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	beq	.L73
	cmp	r2, #2
	moveq	r9, #106
	moveq	r6, #53
	ldrne	r6, .L74+4
	streq	r9, [r5, #164]
	streq	r6, [r5, #160]
	strne	r6, [r5, #244]
	strne	fp, [r5, #240]
.L68:
	add	r2, r2, #1
	cmp	r2, #4
	str	r0, [r3, #24]
	str	r0, [r3, #36]
	str	r1, [r3, #28]
	str	r4, [r3, #40]
	str	r1, [r3, #44]
	str	r8, [r3, #60]
	str	r0, [r3, #68]
	str	r7, [r3, #72]
	add	r3, r3, #80
	bne	.L71
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L73:
	mov	r9, #60
	mov	r6, #9
	str	r9, [r5, #84]
	str	r6, [r5, #80]
	b	.L68
.L75:
	.align	2
.L74:
	.word	enemy
	.word	485
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	ip, #7
	mov	r6, #2
	mov	r5, #9
	mov	r4, #180
	mov	r2, r1
	mov	lr, #0
	mov	r0, #16
	mov	r10, #210
	mov	r9, #20
	mov	r8, #220
	mov	r7, #130
	ldr	r3, .L84
	stm	r3, {r4, r5}
	str	r1, [r3, #44]
	str	r6, [r3, #56]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	add	r3, r3, #80
.L77:
	cmp	r2, #1
	stmne	r3, {r7, r8}
	stmeq	r3, {r9, r10}
	cmp	r2, #2
	str	lr, [r3, #56]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #44]
	add	r3, r3, #80
	movne	r2, #2
	bne	.L77
.L76:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L85:
	.align	2
.L84:
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r0, #5
	mov	r1, #6
	mov	r2, #1
	mov	lr, #110
	mov	r9, #10
	mov	r8, #60
	mov	r7, #130
	mov	r6, #70
	mov	r5, #180
	mov	r4, #15
	mov	ip, #230
	ldr	r3, .L88
	stm	r3, {r8, r9}
	str	r0, [r3, #16]
	str	r0, [r3, #96]
	str	r0, [r3, #176]
	str	r0, [r3, #256]
	str	r0, [r3, #336]
	str	r7, [r3, #84]
	str	r6, [r3, #160]
	str	r5, [r3, #240]
	str	r4, [r3, #324]
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
	str	lr, [r3, #80]
	str	lr, [r3, #244]
	str	ip, [r3, #164]
	str	ip, [r3, #320]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	ammo
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
	mov	r2, #20
	ldr	r0, .L96
	ldr	r1, .L96+4
	ldr	r3, .L96+8
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r3]
	ldr	r5, .L96+12
	ldr	lr, .L96+16
	ldr	ip, .L96+20
	ldr	r0, .L96+24
	ldr	r1, .L96+28
	ldr	r3, .L96+32
	str	r4, [r5]
	str	r4, [lr]
	str	r4, [ip]
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r3]
	ldr	r5, .L96+36
	ldr	lr, .L96+40
	ldr	ip, .L96+44
	ldr	r0, .L96+48
	ldr	r1, .L96+52
	ldr	r3, .L96+56
	str	r4, [r5]
	str	r4, [lr]
	str	r4, [ip]
	ldr	lr, .L96+60
	ldr	ip, .L96+64
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r3]
	ldr	r1, .L96+68
	ldr	r3, .L96+72
	ldr	r0, .L96+76
	ldr	r5, .L96+80
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
	ldr	r3, .L96+84
	add	r1, r3, #400
.L91:
	str	lr, [r3, #20]
	str	ip, [r3, #16]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r4, [r3, #44]
	str	r4, [r3, #76]
	stm	r3, {r0, r4}
	add	r3, r3, #80
	cmp	r3, r1
	bne	.L91
	mov	r4, #5
	mov	r5, #13
	mvn	ip, #4
	mov	r2, #0
	mov	r0, #1
	ldr	r3, .L96+88
	add	r1, r3, #2400
.L92:
	str	r4, [r3, #20]
	str	r5, [r3, #16]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #12]
	str	r2, [r3, #44]
	add	r3, r3, #80
	cmp	r3, r1
	bne	.L92
	bl	initWeapons
	mov	r6, #7
	bl	initCoins
	bl	initAmmo
	mov	lr, #1012
	mov	ip, #16
	mov	r0, #32
	mov	r1, #184
	mov	r2, #1008
	ldr	r3, .L96+92
	stm	r3, {r4, lr}
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	ldr	r3, .L96+96
	pop	{r4, r5, r6, lr}
	stm	r3, {r1, r2}
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	bx	lr
.L97:
	.align	2
.L96:
	.word	playerhOff
	.word	hasKey
	.word	keyFall
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
	.word	key
	.word	door
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
	ldr	r3, .L102
	add	r0, r3, #400
.L99:
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
	bne	.L99
	pop	{r4, lr}
	bx	lr
.L103:
	.align	2
.L102:
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
	ldr	r3, .L108
	add	r1, r3, #2400
.L105:
	str	r4, [r3, #20]
	str	lr, [r3, #16]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #12]
	str	r2, [r3, #44]
	add	r3, r3, #80
	cmp	r3, r1
	bne	.L105
	pop	{r4, lr}
	bx	lr
.L109:
	.align	2
.L108:
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
	ldr	r5, .L135
	mov	r9, #0
	mov	r4, r5
	ldr	r6, .L135+4
	ldr	r7, .L135+8
	ldr	r8, .L135+12
	ldr	r10, .L135+16
	sub	sp, sp, #20
	add	fp, r5, #240
.L117:
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
	bx	r7
	cmp	r0, #0
	beq	.L112
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L112
	ldr	r3, [r8]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r8]
	ldr	r3, [r4, #56]
	streq	r3, [r10]
	cmp	r3, #3
	str	r9, [r4, #44]
	beq	.L131
	cmp	r3, #4
	beq	.L132
	cmp	r3, #5
	moveq	r3, #1
	ldreq	r2, .L135+20
	streq	r3, [r2]
.L112:
	add	r4, r4, #80
	cmp	r4, fp
	bne	.L117
.L134:
	mov	r2, #512
	mov	r10, #86
	ldr	r3, .L135+24
	ldr	ip, .L135+28
	ldr	r0, [r3]
	ldr	lr, .L135+32
	ldr	r3, .L135+36
	lsl	r1, r0, #16
	ldrh	r9, [r3]
	ldr	ip, [ip]
	ldr	r6, [lr]
	ldr	r3, .L135+40
	ldr	r8, .L135+44
	lsr	r1, r1, #16
.L122:
	ldr	lr, [r5, #44]
	cmp	lr, #1
	beq	.L133
.L118:
	strh	r2, [r3, #120]	@ movhi
.L120:
	add	r5, r5, #80
	cmp	r5, fp
	add	r3, r3, #8
	bne	.L122
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L133:
	cmp	ip, #28
	bne	.L118
	ldr	r4, [r5]
	ldr	lr, [r5, #20]
	add	lr, r4, lr
	sub	lr, lr, r0
	cmp	lr, #0
	blt	.L118
	sub	lr, r4, r0
	cmp	lr, #160
	bgt	.L118
	ldr	r7, [r5, #4]
	ldr	lr, [r5, #16]
	add	lr, r7, lr
	sub	lr, lr, r6
	cmp	lr, #0
	blt	.L118
	sub	lr, r7, r6
	cmp	lr, #240
	bgt	.L118
	ldr	lr, [r5, #56]
	sub	r4, r4, r1
	sub	r7, r7, r9
	and	r4, r4, #255
	and	r7, r7, r8
	cmp	lr, #3
	strh	r4, [r3, #120]	@ movhi
	strh	r7, [r3, #122]	@ movhi
	strheq	r10, [r3, #124]	@ movhi
	beq	.L120
	cmp	lr, #4
	moveq	lr, #85	@ movhi
	strheq	lr, [r3, #124]	@ movhi
	beq	.L120
	cmp	lr, #5
	moveq	lr, #84	@ movhi
	strheq	lr, [r3, #124]	@ movhi
	b	.L120
.L131:
	mov	r3, #1
	ldr	r2, .L135+48
	add	r4, r4, #80
	cmp	r4, fp
	str	r3, [r2]
	bne	.L117
	b	.L134
.L132:
	mov	r3, #1
	ldr	r2, .L135+52
	add	r4, r4, #80
	cmp	r4, fp
	str	r3, [r2]
	bne	.L117
	b	.L134
.L136:
	.align	2
.L135:
	.word	weapon
	.word	player
	.word	collision
	.word	numWeapons
	.word	currWeapon
	.word	hasShield
	.word	vOff
	.word	screenBlock
	.word	playerhOff
	.word	hOff
	.word	shadowOAM
	.word	511
	.word	hasGun
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
	ldr	r4, .L153
	ldr	r5, .L153+4
	ldr	r7, .L153+8
	ldr	r8, .L153+12
	ldr	r10, .L153+16
	ldr	r9, .L153+20
	ldr	fp, .L153+24
	sub	sp, sp, #20
	add	r6, r4, #240
.L146:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L138
	ldr	r3, [r7]
	cmp	r3, #28
	bne	.L138
	ldr	r1, [r4]
	ldr	r3, [r4, #20]
	ldr	r2, [r8]
	add	r3, r1, r3
	sub	r3, r3, r2
	cmp	r3, #0
	blt	.L138
	sub	r3, r1, r2
	cmp	r3, #160
	bgt	.L138
	ldr	ip, [r4, #4]
	ldr	r2, [r4, #16]
	ldr	r0, [r10]
	add	r2, ip, r2
	sub	r2, r2, r0
	cmp	r2, #0
	blt	.L138
	sub	r0, ip, r0
	cmp	r0, #240
	bgt	.L138
	ldr	r2, [r4, #56]
	and	r3, r3, #255
	cmp	r2, #0
	strh	r3, [r5, #176]	@ movhi
	bne	.L139
	mov	r2, #24
	ldr	r3, .L153+28
	ldr	r3, [r3]
	sub	r3, ip, r3
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	strh	r3, [r5, #178]	@ movhi
	strh	r2, [r5, #180]	@ movhi
.L140:
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	stm	sp, {r1, ip}
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	ldr	r2, [r9, #20]
	ldr	r3, [r9, #16]
	ldm	r9, {r0, r1}
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	beq	.L142
	mov	r2, #0
	ldr	r3, [r4, #56]
	cmp	r3, r2
	str	r2, [r4, #44]
	beq	.L152
	cmp	r3, #2
	bne	.L142
	ldr	r2, .L153+32
	ldr	r3, [r2]
	cmp	r3, #2
	addle	r3, r3, #1
	strle	r3, [r2]
	ldr	r2, .L153+36
	ldr	r3, [r2]
	add	r3, r3, #5
	str	r3, [r2]
	b	.L142
.L138:
	mov	r3, #512
	strh	r3, [r5, #176]	@ movhi
.L142:
	add	r4, r4, #80
	cmp	r4, r6
	add	r5, r5, #8
	bne	.L146
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L139:
	cmp	r2, #2
	bne	.L140
	mov	r2, #23
	ldr	r3, .L153+28
	ldr	r3, [r3]
	sub	r3, ip, r3
	lsl	r3, r3, r2
	lsr	r3, r3, r2
	strh	r3, [r5, #178]	@ movhi
	strh	r2, [r5, #180]	@ movhi
	b	.L140
.L152:
	ldr	r2, .L153+36
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	b	.L142
.L154:
	.align	2
.L153:
	.word	coin
	.word	shadowOAM
	.word	screenBlock
	.word	vOff
	.word	playerhOff
	.word	player
	.word	collision
	.word	hOff
	.word	lives
	.word	pts
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
	ldr	r4, .L169
	ldr	r5, .L169+4
	ldr	r7, .L169+8
	ldr	r8, .L169+12
	ldr	r9, .L169+16
	ldr	r10, .L169+20
	sub	sp, sp, #20
	add	r6, r4, #400
.L160:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L156
	ldr	r3, [r7]
	cmp	r3, #28
	bne	.L156
	ldr	r1, [r4]
	ldr	r0, [r4, #20]
	ldr	r2, [r8]
	add	r3, r1, r0
	sub	r3, r3, r2
	cmp	r3, #0
	blt	.L156
	sub	r2, r1, r2
	cmp	r2, #160
	bgt	.L156
	ldr	ip, [r4, #4]
	ldr	lr, [r4, #16]
	ldr	r3, [r9]
	add	fp, ip, lr
	sub	fp, fp, r3
	cmp	fp, #0
	blt	.L156
	sub	r3, ip, r3
	cmp	r3, #240
	bgt	.L156
	mov	fp, #22
	ldr	r3, .L169+24
	ldr	r3, [r3]
	and	r2, r2, #255
	strh	r2, [r5, #200]	@ movhi
	sub	r3, ip, r3
	ldr	r2, [r10]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	cmp	r2, #94
	strh	r3, [r5, #202]	@ movhi
	strh	fp, [r5, #204]	@ movhi
	bgt	.L158
	ldr	r3, .L169+28
	mov	r2, r3
	stm	sp, {r1, ip}
	mov	r1, r2
	str	r0, [sp, #8]
	mov	r0, r1
	str	lr, [sp, #12]
	ldr	fp, .L169+32
	ldr	r3, [r3, #16]
	ldr	r2, [r2, #20]
	ldr	r1, [r1, #4]
	ldr	r0, [r0]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	beq	.L158
	mov	r2, #0
	ldr	r3, [r10]
	add	r3, r3, #5
	str	r3, [r10]
	str	r2, [r4, #44]
	b	.L158
.L156:
	mov	r3, #512
	strh	r3, [r5, #200]	@ movhi
.L158:
	add	r4, r4, #80
	cmp	r4, r6
	add	r5, r5, #8
	bne	.L160
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L170:
	.align	2
.L169:
	.word	ammo
	.word	shadowOAM
	.word	screenBlock
	.word	vOff
	.word	playerhOff
	.word	numBullets
	.word	hOff
	.word	player
	.word	collision
	.size	updateAmmo, .-updateAmmo
	.align	2
	.global	updateKey
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateKey, %function
updateKey:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L183
	ldr	r2, [r3]
	ldr	r3, .L183+4
	cmp	r2, #0
	ldr	ip, [r3]
	ldr	r5, [r3, #20]
	sub	sp, sp, #16
	beq	.L172
	rsb	r2, r5, #80
	cmp	r2, ip
	addgt	ip, ip, #1
	strgt	ip, [r3]
.L172:
	ldr	r4, .L183+8
	ldr	r2, [r4]
	cmp	r2, #0
	ldr	lr, [r3, #4]
	bne	.L173
	ldr	r2, .L183+12
	ldr	r2, [r2]
	sub	r2, ip, r2
	and	r2, r2, #255
	mvn	r2, r2, lsl #17
	mov	r6, #26
	mvn	r2, r2, lsr #17
	ldr	r1, .L183+16
	ldr	r1, [r1]
	sub	r1, lr, r1
	ldr	r0, .L183+20
	lsl	r1, r1, #23
	lsr	r1, r1, #23
	strh	r2, [r0]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	strh	r6, [r0, #4]	@ movhi
.L174:
	ldr	r3, [r3, #16]
	stm	sp, {ip, lr}
	str	r5, [sp, #8]
	str	r3, [sp, #12]
	ldr	r0, .L183+24
	ldr	r5, .L183+28
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r3, #1
	strne	r3, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L173:
	mov	r1, #512
	ldr	r2, .L183+20
	strh	r1, [r2]	@ movhi
	b	.L174
.L184:
	.align	2
.L183:
	.word	keyFall
	.word	key
	.word	hasKey
	.word	vOff
	.word	hOff
	.word	shadowOAM+520
	.word	player
	.word	collision
	.size	updateKey, .-updateKey
	.align	2
	.global	updateDoor
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDoor, %function
updateDoor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #116
	ldr	r0, .L194
	ldr	r3, .L194+4
	ldr	r2, .L194+8
	ldr	r4, [r0, #4]
	ldr	r3, [r3]
	ldr	r1, .L194+12
	ldr	r2, [r2]
	ldr	lr, [r0]
	sub	r3, r4, r3
	ldr	r6, [r1]
	ldr	ip, .L194+16
	lsl	r3, r3, #23
	sub	r2, lr, r2
	ldr	r1, .L194+20
	lsr	r3, r3, #23
	and	r2, r2, #255
	orr	r3, r3, ip
	orr	r2, r2, ip
	cmp	r6, #0
	strh	r3, [r1, #2]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	r5, [r1, #4]	@ movhi
	sub	sp, sp, #16
	bne	.L193
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L193:
	ldr	r6, [r0, #16]
	ldr	r5, [r0, #20]
	ldr	ip, .L194+24
	str	r4, [sp, #4]
	str	lr, [sp]
	ldr	r4, .L194+28
	ldr	r3, [ip, #16]
	ldr	r2, [ip, #20]
	ldm	ip, {r0, r1}
	str	r6, [sp, #12]
	str	r5, [sp, #8]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L194+32
	strne	r2, [r3]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L195:
	.align	2
.L194:
	.word	door
	.word	hOff
	.word	vOff
	.word	hasKey
	.word	-32768
	.word	shadowOAM+528
	.word	player
	.word	collision
	.word	won
	.size	updateDoor, .-updateDoor
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
	beq	.L213
	cmn	r2, #1
	beq	.L214
.L203:
	ldr	lr, [r4, #20]
	ldr	ip, [r4]
	ldr	r0, .L216
	str	r1, [sp, #12]
	str	r3, [sp, #4]
	ldr	r5, .L216+4
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	ldm	r0, {r0, r1}
	str	lr, [sp, #8]
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L198
	mov	r3, #0
	ldr	r2, .L216+8
	ldr	r2, [r2]
	cmp	r2, r3
	str	r3, [r4, #44]
	beq	.L215
.L198:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L213:
	ldr	r2, .L216+12
	ldr	r2, [r2]
	ldr	r0, [r0, #12]
	add	r2, r2, #1020
	add	r0, r3, r0
	add	r2, r2, #3
	cmp	r0, r2
	movle	r3, r0
	strle	r0, [r4, #4]
	ble	.L203
.L204:
	mov	r2, #0
	str	r2, [r4, #44]
	b	.L203
.L215:
	ldr	ip, .L216+16
	ldr	r1, .L216+20
	ldr	r3, [ip]
	ldr	r1, [r1]
	sub	r3, r3, #1
	ldr	r0, .L216+24
	ldr	r4, .L216+28
	str	r3, [ip]
	mov	lr, pc
	bx	r4
	b	.L198
.L214:
	ldr	r2, .L216+12
	ldr	r0, [r0, #12]
	ldr	ip, [r2]
	add	r2, r3, r1
	sub	r2, r2, r0
	cmp	r2, ip
	subge	r3, r3, r0
	strge	r3, [r4, #4]
	bge	.L203
	b	.L204
.L217:
	.align	2
.L216:
	.word	player
	.word	collision
	.word	shielding
	.word	hOff
	.word	lives
	.word	playerHurt_length
	.word	playerHurt_data
	.word	playSoundB
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
	ldr	r0, .L233
	mov	lr, #1
	mov	r3, #0
	mov	r2, r0
	ldr	ip, .L233+4
	ldr	r1, [ip]
	sub	r1, r1, #1
	str	r1, [ip]
	ldr	ip, .L233+8
	str	lr, [ip, #64]
.L225:
	ldr	r1, [r2, #44]
	cmp	r1, #0
	beq	.L231
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #80
	bne	.L225
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L231:
	ldr	r2, .L233+12
	ldr	r2, [r2]
	cmp	r2, #0
	ldr	lr, [ip]
	ldr	r2, [ip, #4]
	beq	.L220
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
.L221:
	mov	r1, #1
	add	r3, r2, r3
	add	r0, r0, r3, lsl #4
	str	r1, [r0, #44]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L220:
	ldr	r1, [ip, #28]
	cmp	r1, #1
	beq	.L222
	cmp	r1, #2
	beq	.L232
.L223:
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
	b	.L221
.L232:
	ldr	r1, [ip, #32]
	cmp	r1, #1
	bne	.L223
.L222:
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
	b	.L221
.L234:
	.align	2
.L233:
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r6, #512
	mov	r8, #52
	mov	r7, #20
	ldr	r2, .L242
	ldr	r1, .L242+4
	ldr	r3, .L242+8
	ldrh	r4, [r2]
	ldrh	r5, [r1]
	ldr	r2, .L242+12
	ldr	lr, .L242+16
	add	ip, r3, #400
.L239:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	strheq	r6, [r2, #240]	@ movhi
	beq	.L238
	ldm	r3, {r0, r1}
	ldr	r9, [r3, #52]
	sub	r0, r0, r5
	sub	r1, r1, r4
	cmp	r9, #0
	and	r0, r0, #255
	and	r1, r1, lr
	strh	r0, [r2, #240]	@ movhi
	strh	r1, [r2, #242]	@ movhi
	strhne	r7, [r2, #244]	@ movhi
	strheq	r8, [r2, #244]	@ movhi
.L238:
	add	r3, r3, #80
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L239
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L243:
	.align	2
.L242:
	.word	hOff
	.word	vOff
	.word	bullets
	.word	shadowOAM
	.word	511
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
	ldr	r3, .L256
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, [r3]
	ldr	r2, .L256+4
	ldr	r0, .L256+8
	ldr	r1, .L256+12
	ldr	r3, .L256+16
	lsl	r9, r6, #16
	ldrh	r10, [r2]
	mov	r4, #512
	mov	r5, #0
	mov	fp, #21
	ldr	lr, [r0]
	ldr	r8, [r1]
	ldr	r2, .L256+20
	lsr	r9, r9, #16
	add	ip, r3, #2400
	b	.L249
.L255:
	ldr	r0, [r3]
	ldr	r1, [r3, #20]
	add	r1, r0, r1
	sub	r1, r1, r6
	cmp	r1, #0
	blt	.L245
	sub	r1, r0, r6
	cmp	r1, #160
	bgt	.L245
	ldr	r7, [r3, #4]
	ldr	r1, [r3, #16]
	add	r1, r7, r1
	sub	r1, r1, r8
	cmp	r1, #0
	blt	.L245
	sub	r1, r7, r8
	cmp	r1, #240
	bgt	.L245
	ldr	r1, [r3, #44]
	cmp	r1, #0
	beq	.L247
	sub	r7, r7, r10
	sub	r0, r0, r9
	lsl	r7, r7, #23
	add	r3, r3, #80
	and	r0, r0, #255
	lsr	r7, r7, #23
	cmp	r3, ip
	strh	r0, [r2]	@ movhi
	strh	r7, [r2, #2]	@ movhi
	strh	fp, [r2, #4]	@ movhi
	add	r2, r2, #8
	beq	.L254
.L249:
	cmp	lr, #28
	beq	.L255
.L245:
	str	r5, [r3, #44]
.L247:
	add	r3, r3, #80
	cmp	r3, ip
	strh	r4, [r2]	@ movhi
	add	r2, r2, #8
	bne	.L249
.L254:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L257:
	.align	2
.L256:
	.word	vOff
	.word	hOff
	.word	screenBlock
	.word	playerhOff
	.word	enemyBullets
	.word	shadowOAM+280
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
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L271
	mov	ip, #0
	mov	lr, r4
	ldr	r5, .L271+4
	ldr	r6, .L271+8
	ldr	r5, [r5]
	smull	r7, r6, r5, r6
	add	r7, sp, #16
	stmib	r7, {r0, r1, r2, r3}
	asr	r2, r5, #31
	rsb	r2, r2, r6, asr #3
	add	r2, r2, r2, lsl #2
	ldr	r1, [sp, #64]
	sub	r2, r5, r2, lsl #2
.L262:
	ldr	r3, [lr, #44]
	orrs	r3, r2, r3
	bne	.L259
	cmp	r1, #0
	bne	.L270
.L259:
	add	ip, ip, #1
	cmp	ip, #30
	add	lr, lr, #80
	bne	.L262
	pop	{r4, r5, r6, r7, lr}
	add	sp, sp, #16
	bx	lr
.L270:
	mov	r0, #1
	ldr	r2, [sp, #72]
	mov	r5, #5
	mov	lr, #13
	cmn	r2, #1
	movne	r2, #1
	ldr	r1, [sp, #40]
	ldr	r3, [sp, #20]
	add	r1, r1, r1, lsr #31
	add	r3, r3, r1, asr r0
	add	ip, ip, ip, lsl #2
	sub	r3, r3, #3
	str	r3, [r4, ip, lsl #4]
	add	ip, r4, ip, lsl #4
	ldr	r3, [sp, #24]
	str	r5, [ip, #20]
	str	lr, [ip, #16]
	pop	{r4, r5, r6, r7, lr}
	str	r3, [ip, #4]
	str	r2, [ip, #52]
	str	r0, [ip, #44]
	add	sp, sp, #16
	bx	lr
.L272:
	.align	2
.L271:
	.word	enemyBullets
	.word	timer
	.word	1717986919
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
	mov	r5, r3
	ldr	r2, .L324
	ldr	r4, .L324+4
	ldr	r6, .L324+8
	str	r3, [r2]
	ldr	r8, .L324+12
	ldr	r9, .L324+16
	ldr	r10, .L324+20
	ldr	r7, .L324+24
	sub	sp, sp, #68
.L302:
	ldr	r3, [r8]
	cmp	r3, #0
	ldr	r3, [r4, #44]
	bne	.L274
	cmp	r3, #0
	beq	.L276
	ldr	r3, .L324+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L277
.L282:
	ldr	r3, [r4, #60]
	cmp	r3, #0
	bgt	.L276
	mov	r2, #0
	ldr	r1, .L324+32
	ldr	r3, [r1]
	add	r3, r3, #1
	str	r3, [r1]
	str	r2, [r4, #44]
.L276:
	ldr	r3, [r4, #68]
	cmp	r3, #0
	ble	.L317
.L283:
	ldr	r2, [r4, #72]
	cmp	r3, r2
	movlt	r3, #0
	strlt	r3, [r4, #64]
	blt	.L303
	mvn	r2, #0
	mov	r3, #1
	str	r2, [r4, #52]
	str	r3, [r4, #64]
.L284:
	mov	ip, sp
	ldr	r3, .L324+4
	add	fp, r5, r5, lsl #2
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
.L303:
	ldr	r2, [r9]
	ldr	r1, .L324+36
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #1
	bne	.L286
	ldr	r3, [r4, #52]
	ldr	r2, [r4, #68]
	cmp	r3, #1
	ldr	r3, [r4, #4]
	addeq	r2, r2, #1
	addeq	r3, r3, #1
	subne	r3, r3, #1
	subne	r2, r2, #1
	str	r3, [r4, #4]
	str	r2, [r4, #68]
.L286:
	ldr	fp, [r4, #24]
	rsb	r3, fp, fp, lsl #3
	add	r3, r3, r3, lsl #6
	add	r3, fp, r3, lsl #3
	rsb	r3, r3, r3, lsl #15
	add	r3, fp, r3, lsl #3
	add	r3, r3, r7
	cmp	r7, r3, ror #1
	bcc	.L288
	ldr	r0, [r4, #36]
	ldr	r3, .L324+40
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L288:
	ldr	r3, [r4, #44]
	add	fp, fp, #1
	cmp	r3, #0
	str	fp, [r4, #24]
	beq	.L289
	ldr	r3, .L324+44
	ldr	r3, [r3]
	cmp	r3, #28
	bne	.L289
	ldr	r2, .L324+48
	ldr	r1, [r4]
	ldr	r3, [r4, #20]
	ldr	r2, [r2]
	add	r3, r1, r3
	sub	r3, r3, r2
	cmp	r3, #0
	blt	.L289
	sub	r3, r1, r2
	cmp	r3, #160
	bgt	.L289
	ldr	r0, .L324+52
	ldr	ip, [r4, #4]
	ldr	r2, [r4, #16]
	ldr	r0, [r0]
	add	r2, ip, r2
	sub	r2, r2, r0
	cmp	r2, #0
	blt	.L289
	sub	r0, ip, r0
	cmp	r0, #240
	movgt	r0, #0
	movle	r0, #1
	cmp	r5, #3
	moveq	r0, #0
	cmp	r0, #0
	bne	.L318
.L289:
	mov	r3, #512
	strh	r3, [r6, #144]	@ movhi
.L293:
	add	r5, r5, #1
	cmp	r5, #4
	add	r4, r4, #80
	add	r6, r6, #8
	bne	.L302
	add	sp, sp, #68
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L277:
	ldr	r3, [r10, #4]
	add	r0, r10, #16
	ldm	r0, {r0, r1}
	ldr	r2, [r10]
	add	r3, r3, #5
	str	r3, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	ldr	fp, .L324+56
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	bne	.L280
	ldr	r3, [r10, #4]
	add	r0, r10, #16
	ldm	r0, {r0, r1}
	ldr	r2, [r10]
	sub	r3, r3, #5
	str	r3, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	bne	.L280
.L316:
	ldr	r3, [r4, #44]
.L274:
	cmp	r3, #0
	bne	.L282
.L319:
	ldr	r3, [r4, #68]
	cmp	r3, #0
	bgt	.L283
.L317:
	mov	r3, #1
	str	r3, [r4, #52]
	str	r3, [r4, #64]
	b	.L284
.L280:
	mov	ip, #1
	ldr	r3, [r10, #4]
	ldr	r0, [r4, #60]
	add	r3, r3, #5
	add	r1, r10, #16
	ldm	r1, {r1, r2}
	str	r3, [sp, #4]
	ldr	r3, [r10]
	sub	r0, r0, #1
	str	r1, [sp, #12]
	str	r2, [sp, #8]
	str	r3, [sp]
	str	r0, [r4, #60]
	ldr	r3, [r4, #16]
	str	ip, [r8]
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #4]
	ldr	r0, [r4]
	ldr	ip, .L324+56
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r3, [r4, #4]
	beq	.L281
	add	r3, r3, #10
	str	r3, [r4, #4]
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L282
	b	.L319
.L318:
	ldr	r2, .L324+60
	ldr	r2, [r2]
	sub	r2, ip, r2
	ldr	lr, .L324+64
	ldr	r0, [r4, #64]
	lsl	r2, r2, #23
	and	r3, r3, #255
	lsr	r2, r2, #23
	orr	r3, r3, lr
	orr	r2, r2, lr
	cmp	r0, #0
	strh	r3, [r6, #144]	@ movhi
	strh	r2, [r6, #146]	@ movhi
	ldr	r3, [r4, #56]
	beq	.L290
	cmp	r3, #0
	ldr	r3, [r4, #52]
	bne	.L291
	cmp	r3, #1
	moveq	r3, #392
	movne	r3, #396
	strh	r3, [r6, #148]	@ movhi
	b	.L293
.L281:
	sub	r3, r3, #10
	str	r3, [r4, #4]
	b	.L316
.L290:
	cmp	r3, #0
	beq	.L320
	cmp	r3, #1
	bne	.L297
	ldr	r3, [r4, #52]
	cmp	r3, #1
	ldr	r3, [r4, #36]
	lsl	r3, r3, #7
	addeq	r3, r3, #520
	addne	r3, r3, #524
	strh	r3, [r6, #148]	@ movhi
.L297:
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	stm	sp, {r1, ip}
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	ldr	r2, [r10, #20]
	ldr	r3, [r10, #16]
	ldm	r10, {r0, r1}
	ldr	ip, .L324+56
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L293
	mov	lr, #1
	ldr	ip, .L324+68
	ldr	r2, [ip]
	ldr	r3, .L324
	cmp	r2, #3
	str	lr, [r3]
	beq	.L321
	ldr	fp, .L324+72
	cmp	r2, #2
	ldr	r3, [fp]
	beq	.L322
	cmp	r2, #1
	beq	.L323
.L300:
	add	r3, r3, #1
	str	r3, [fp]
	b	.L293
.L320:
	ldr	r3, [r4, #52]
	cmp	r3, #1
	ldr	r3, [r4, #36]
	lsl	r3, r3, #7
	addeq	r3, r3, #8
	addne	r3, r3, #12
	strh	r3, [r6, #148]	@ movhi
	b	.L297
.L291:
	cmp	r3, #1
	moveq	r3, #904
	movne	r3, #908
	strh	r3, [r6, #148]	@ movhi
	b	.L293
.L322:
	ldr	r1, .L324+76
	ldr	r2, .L324+80
	mla	r2, r3, r2, r1
	ldr	r1, .L324+84
	cmp	r1, r2, ror #2
	bcc	.L300
	ldr	r3, .L324+88
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L324+92
	ldr	r3, .L324+96
	str	lr, [ip]
	mov	lr, pc
	bx	r3
	ldr	r3, [fp]
	b	.L300
.L323:
	ldr	r1, .L324+76
	ldr	r2, .L324+80
	mla	r2, r3, r2, r1
	ldr	r1, .L324+84
	cmp	r1, r2, ror #2
	bcc	.L300
	mov	r2, #0
	ldr	r3, .L324+88
	ldr	r0, .L324+92
	ldr	r1, [r3]
	ldr	r3, .L324+96
	str	r2, [ip]
	mov	lr, pc
	bx	r3
	ldr	r3, [fp]
	b	.L300
.L321:
	mov	r3, #2
	ldr	r2, .L324+88
	ldr	fp, .L324+72
	ldr	r1, [r2]
	str	r3, [ip]
	mov	r2, #0
	ldr	r3, .L324+96
	ldr	r0, .L324+92
	mov	lr, pc
	bx	r3
	ldr	r3, [fp]
	b	.L300
.L325:
	.align	2
.L324:
	.word	ovrEnemyColl
	.word	enemy
	.word	shadowOAM
	.word	successfulStab
	.word	timer
	.word	player
	.word	238609294
	.word	stabbing
	.word	pts
	.word	1717986919
	.word	__aeabi_idivmod
	.word	screenBlock
	.word	vOff
	.word	playerhOff
	.word	collision
	.word	hOff
	.word	-32768
	.word	lives
	.word	collTimer
	.word	85899344
	.word	-1030792151
	.word	42949672
	.word	playerHurt_length
	.word	playerHurt_data
	.word	playSoundB
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
	ldr	r1, .L402
	ldr	r4, .L402+4
	ldr	r3, .L402+8
	ldr	r2, [r4, #4]
	ldr	r1, [r1]
	ldr	r0, [r3]
	ldr	r3, [r4]
	sub	r1, r2, r1
	ldr	ip, .L402+12
	ldr	lr, .L402+16
	lsl	r1, r1, #23
	sub	r0, r3, r0
	lsr	r1, r1, #23
	and	r0, r0, #255
	orr	r1, r1, ip
	orr	r0, r0, ip
	ldr	ip, [lr]
	ldr	r5, .L402+20
	cmp	ip, #0
	strh	r1, [r5, #2]	@ movhi
	strh	r0, [r5]	@ movhi
	sub	sp, sp, #16
	beq	.L327
	ldr	r1, [r4, #32]
	cmp	r1, #0
	bne	.L398
.L328:
	mov	r1, #384
	strh	r1, [r5, #4]	@ movhi
.L330:
	ldr	r1, .L402+24
	ldr	r1, [r1]
	tst	r1, #1
	bne	.L326
	ldr	r0, .L402+28
	ldr	ip, .L402+32
	ldr	r1, [r0]
	ldr	ip, [ip]
	add	r1, r1, #1
	cmp	r1, ip
	sub	ip, r3, #2
	str	r1, [r0]
	str	ip, [r4]
	beq	.L333
	ldr	r1, .L402+36
	ldr	r1, [r1]
	sub	r3, r3, #3
	add	r2, r1, r2
	ldrb	r1, [r2, r3, lsl #10]	@ zero_extendqisi2
	cmp	r1, #0
	add	r2, r2, r3, lsl #10
	beq	.L333
	ldr	r3, [r4, #16]
	add	r1, r3, r3, lsr #31
	ldrb	r1, [r2, r1, asr #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L333
	add	r2, r2, r3
	ldrb	r3, [r2, #-1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L326
.L333:
	mov	r1, #0
	mov	r2, #1
	ldr	r3, .L402+40
	str	r1, [lr]
	str	r2, [r3]
.L326:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L398:
	ldr	r0, [r4, #28]
	cmp	r0, #0
	beq	.L328
	cmp	r0, #1
	cmpne	r1, #1
	moveq	r1, #388
	strheq	r1, [r5, #4]	@ movhi
	b	.L330
.L327:
	ldr	r6, [r4, #8]
	ldr	r1, [r4, #16]
	ldr	lr, [r4, #20]
	str	ip, [sp, #8]
	ldr	r0, .L402+36
	add	r3, r3, #2
	ldr	r0, [r0]
	stm	sp, {r1, lr}
	str	r6, [sp, #12]
	mov	r1, #1024
	ldr	r6, .L402+44
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L399
	ldr	r2, .L402+40
	ldr	r3, [r2]
	cmp	r3, #0
	ldr	r3, [r4, #32]
	beq	.L336
	cmp	r3, #0
	bne	.L400
.L337:
	mov	r3, #384
	strh	r3, [r5, #4]	@ movhi
.L339:
	ldr	r1, .L402+28
	ldr	r3, [r1]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r1]
	streq	r3, [r2]
	b	.L326
.L399:
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L336:
	ldr	r2, .L402+48
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L401
	ldr	r2, .L402+52
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L343
	cmp	r3, #0
	beq	.L344
	ldr	r2, [r4, #28]
	cmp	r2, #0
	beq	.L344
	cmp	r2, #1
	cmpne	r3, #1
	moveq	r3, #772
	strheq	r3, [r5, #4]	@ movhi
	b	.L326
.L401:
	cmp	r3, #0
	beq	.L341
	ldr	r2, [r4, #28]
	cmp	r2, #0
	beq	.L341
	cmp	r2, #1
	cmpne	r3, #1
	moveq	r3, #516
	strheq	r3, [r5, #4]	@ movhi
	b	.L326
.L400:
	ldr	r1, [r4, #28]
	cmp	r1, #0
	beq	.L337
	cmp	r1, #1
	cmpne	r3, #1
	moveq	r3, #388
	strheq	r3, [r5, #4]	@ movhi
	b	.L339
.L341:
	mov	r3, #512
	strh	r3, [r5, #4]	@ movhi
	b	.L326
.L343:
	ldr	r2, [r4, #64]
	cmp	r2, #0
	beq	.L346
	cmp	r3, #0
	beq	.L347
	ldr	r2, [r4, #28]
	cmp	r2, #0
	beq	.L347
	cmp	r3, #1
	cmpne	r2, #1
	moveq	r3, #644
	strheq	r3, [r5, #4]	@ movhi
	b	.L326
.L344:
	mov	r3, #768
	strh	r3, [r5, #4]	@ movhi
	b	.L326
.L346:
	cmp	r3, #0
	ldr	r2, [r4, #28]
	bne	.L349
	cmp	r2, #0
	bne	.L397
.L350:
	ldr	r3, [r4, #36]
	lsl	r3, r3, #7
	strh	r3, [r5, #4]	@ movhi
	b	.L326
.L347:
	mov	r3, #640
	strh	r3, [r5, #4]	@ movhi
	b	.L326
.L349:
	cmp	r3, #1
	bne	.L351
	cmp	r2, #1
	beq	.L352
	mov	r3, #4
	strh	r3, [r5, #4]	@ movhi
	b	.L326
.L351:
	cmp	r2, #0
	beq	.L350
	cmp	r2, #1
	bne	.L326
.L352:
	ldr	r3, [r4, #36]
	lsl	r3, r3, #7
	add	r3, r3, #4
.L397:
	strh	r3, [r5, #4]	@ movhi
	b	.L326
.L403:
	.align	2
.L402:
	.word	playerhOff
	.word	player
	.word	vOff
	.word	-32768
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
	ldr	r3, .L407
	ldr	r3, [r3]
	cmp	r3, #144
	movgt	r2, #96
	movle	r2, #0
	ldr	r3, .L407+4
	str	r2, [r3]
	bx	lr
.L408:
	.align	2
.L407:
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
	ldr	r2, .L425
	ldr	r3, [r2]
	cmp	r3, #5
	beq	.L423
	cmp	r3, #4
	beq	.L424
	cmp	r3, #3
	bxne	lr
	ldr	r3, .L425+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L415
	ldr	r3, .L425+8
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
.L416:
	mov	r3, #4
	str	r3, [r2]
	bx	lr
.L424:
	ldr	r3, .L425+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L414
	ldr	r3, .L425+4
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
.L415:
	mov	r3, #5
	str	r3, [r2]
	bx	lr
.L423:
	ldr	r3, .L425+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L416
	ldr	r3, .L425+12
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
.L414:
	mov	r3, #3
	str	r3, [r2]
	bx	lr
.L426:
	.align	2
.L425:
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
	ldr	r6, .L516
	ldrh	r3, [r6]
	tst	r3, #4
	sub	sp, sp, #20
	beq	.L428
	ldr	r3, .L516+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L509
.L428:
	ldr	r3, .L516+8
	ldr	r3, [r3]
	cmp	r3, #0
	moveq	r2, #100
	ldreq	r3, .L516+12
	streq	r2, [r3]
	ldr	r3, .L516+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L430
	ldr	r2, .L516+20
	ldr	r3, [r2]
	cmp	r3, #9
	ble	.L510
.L430:
	mov	r3, #0
	ldr	r2, .L516+24
	ldr	r5, .L516+28
	str	r3, [r2]
	str	r3, [r5]
.L431:
	ldr	r3, .L516+32
	ldr	r1, .L516+36
	ldr	r2, .L516+40
	ldr	r3, [r3]
	mla	r3, r1, r3, r2
	ldr	r2, .L516+44
	cmp	r3, r2
	movls	r3, #0
	ldr	r7, .L516+48
	ldrls	r4, .L516+52
	ldrhi	r4, .L516+52
	ldr	r2, [r7]
	strls	r3, [r4, #64]
	ldr	r3, [r4, #48]
	cmp	r2, #3
	ldrh	r1, [r6]
	addne	r3, r3, #1
	beq	.L511
.L434:
	cmp	r2, #4
	str	r3, [r4, #48]
	beq	.L512
	cmp	r2, #5
	bne	.L507
	tst	r1, #1
	beq	.L442
	ldr	r3, .L516+4
	ldrh	r3, [r3]
	tst	r3, #1
	moveq	r3, #1
	bne	.L442
.L441:
	ldr	r2, [r4, #28]
	ldr	r0, .L516+56
	cmp	r2, #2
	str	r3, [r0]
	movne	r3, #2
	strne	r2, [r4, #32]
	strne	r3, [r4, #28]
	ldr	r2, [r4, #24]
	ldr	r3, .L516+60
	smull	r0, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	subs	r3, r2, r3, lsl #1
	bne	.L444
	add	r0, r4, #36
	ldm	r0, {r0, r2}
	sub	r2, r2, #1
	cmp	r0, r2
	addlt	r0, r0, #1
	strlt	r0, [r4, #36]
	strge	r3, [r4, #36]
.L444:
	tst	r1, #2
	beq	.L446
	ldr	r3, .L516+4
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L446
.L447:
	ldr	r5, .L516+64
	ldr	r2, .L516+68
	ldr	r3, [r5]
	ldr	r2, [r2]
	orrs	r3, r3, r2
	bne	.L448
	mov	r0, #1
	mvn	r1, #0
	ldr	r2, .L516+72
	str	r0, [r5]
	str	r1, [r4, #8]
	str	r3, [r2]
.L448:
	ldr	r3, .L516+76
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	bne	.L449
	ldr	r2, [r4, #4]
	cmp	r2, #0
	bgt	.L513
.L449:
	ldr	r3, .L516+76
	ldrh	r3, [r3, #48]
	ands	r6, r3, #16
	bne	.L452
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #16]
	ldr	r1, .L516+80
	add	r0, r2, r3
	cmp	r0, r1
	ble	.L514
.L452:
	ldr	r3, .L516+76
	ldrh	r3, [r3, #48]
	lsr	r3, r3, #6
	ldr	r2, .L516+84
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
	bne	.L427
	ldr	r3, .L516+88
	ldr	r0, [r4]
	ldr	r2, [r4, #20]
	ldr	r3, [r3]
	ldr	r1, [r4, #4]
	add	r2, r0, r2
	add	r3, r3, r2, lsl #10
	ldrb	r2, [r3, r1]	@ zero_extendqisi2
	cmp	r2, #0
	add	r3, r3, r1
	beq	.L427
	ldr	r2, [r4, #16]
	add	r1, r2, r2, lsr #31
	ldrb	r1, [r3, r1, asr #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L427
	add	r3, r3, r2
	ldrb	r3, [r3, #-1]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r0, r0, #1
	strne	r0, [r4]
.L427:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L512:
	ands	r3, r1, #1
	beq	.L441
	ldr	r3, .L516+4
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L507
	mov	r0, #1
	ldr	r2, .L516+20
	str	r0, [r5]
	str	r3, [r2]
	b	.L441
.L510:
	mov	r1, #1
	ldr	r5, .L516+28
	add	r3, r3, r1
	str	r3, [r2]
	str	r1, [r5]
	b	.L431
.L509:
	ldr	r3, .L516+92
	ldr	r3, [r3]
	cmp	r3, #1
	ble	.L428
	bl	switchWeapons
	b	.L428
.L442:
	ldr	r3, .L516+76
	ldrh	r3, [r3, #48]
	and	r3, r3, #1
	rsb	r3, r3, #1
	b	.L441
.L446:
	ldr	r3, .L516+76
	ldrh	r3, [r3, #48]
	tst	r3, #2
	beq	.L447
	ldr	r5, .L516+64
	b	.L448
.L511:
	tst	r1, #1
	beq	.L508
	ldr	r2, .L516+4
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L508
	cmp	r3, #9
	bgt	.L438
.L508:
	add	r3, r3, #1
	str	r3, [r4, #48]
.L507:
	mov	r3, #0
	b	.L441
.L513:
	ldr	r1, [r4, #12]
	add	ip, r4, #16
	rsb	r1, r1, #0
	ldm	ip, {ip, lr}
	ldr	r0, .L516+88
	str	r3, [sp, #12]
	str	r1, [sp, #8]
	ldr	r3, [r4]
	ldr	r0, [r0]
	mov	r1, #1024
	stm	sp, {ip, lr}
	ldr	r6, .L516+96
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L449
	mov	r2, #1
	ldr	r3, .L516+100
	ldr	r0, [r4, #12]
	ldr	r1, [r3]
	ldr	r3, [r4, #4]
	cmp	r1, #28
	sub	r3, r3, r0
	str	r3, [r4, #4]
	str	r2, [r4, #28]
	bgt	.L450
	ldr	r1, .L516+104
	ldr	ip, [r1]
	cmp	ip, #0
	ble	.L452
	ldr	lr, .L516+108
	ldr	r2, [lr]
	sub	r3, r3, r2
	cmp	r3, #120
	bgt	.L459
.L458:
	sub	ip, ip, #1
	sub	r2, r2, r0
	str	ip, [r1]
	str	r2, [lr]
	b	.L452
.L514:
	ldr	r1, [r4, #20]
	str	r3, [sp]
	ldr	ip, [r4, #12]
	str	r6, [sp, #12]
	ldr	r0, .L516+88
	ldr	r3, [r4]
	ldr	r0, [r0]
	ldr	r7, .L516+96
	stmib	sp, {r1, ip}
	mov	r1, #1024
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L452
	ldr	r3, .L516+100
	ldr	r0, [r4, #12]
	ldr	ip, [r3]
	ldr	r3, [r4, #4]
	ldr	r1, .L516+104
	add	r3, r0, r3
	cmp	ip, #30
	str	r6, [r4, #28]
	str	r3, [r4, #4]
	ldr	r2, [r1]
	ble	.L454
	cmp	r2, #31
	bgt	.L452
.L455:
	ldr	r6, .L516+108
	ldr	lr, [r6]
	sub	r3, r3, lr
	cmp	r3, #119
	ble	.L452
	cmp	lr, #272
	cmpeq	ip, #30
	addne	r2, r2, #1
	addne	r0, r0, lr
	strne	r2, [r1]
	strne	r0, [r6]
	b	.L452
.L450:
	ldr	lr, .L516+108
	ldr	r2, [lr]
	sub	r3, r3, r2
	cmp	r3, #120
	ble	.L515
.L459:
	cmp	r3, #632
	bgt	.L452
	ldr	r1, .L516+104
	ldr	r3, [r1]
	sub	r2, r2, r0
	sub	r3, r3, #1
	str	r2, [lr]
	str	r3, [r1]
	b	.L452
.L438:
	ldr	r2, .L516+112
	ldr	r2, [r2]
	cmp	r2, #0
	ble	.L508
	bl	fireBullet
	mov	r3, #1
	ldr	r2, [r7]
	ldrh	r1, [r6]
	b	.L434
.L454:
	cmp	r2, #784
	bgt	.L452
	b	.L455
.L515:
	ldr	r1, .L516+104
	ldr	ip, [r1]
	b	.L458
.L517:
	.align	2
.L516:
	.word	oldButtons
	.word	buttons
	.word	ovrEnemyColl
	.word	collTimer
	.word	hasKnife
	.word	stabbingFrames
	.word	successfulStab
	.word	stabbing
	.word	timer
	.word	-1527099483
	.word	47721858
	.word	95443716
	.word	currWeapon
	.word	player
	.word	shielding
	.word	715827883
	.word	jumped
	.word	fallen
	.word	jumpCount
	.word	67109120
	.word	1018
	.word	shootUp
	.word	.LANCHOR0
	.word	numWeapons
	.word	collisionCheck
	.word	screenBlock
	.word	hOff
	.word	playerhOff
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
	ldr	r1, .L532
	ldr	r0, .L532+4
	ldr	r2, [r1, #16]
	ldr	r3, [r0]
	rsb	r2, r2, #512
	cmp	r2, r3
	sublt	r3, r3, #512
	push	{r4, r5, r6, lr}
	strlt	r3, [r0]
	blt	.L520
	cmp	r3, #0
	addlt	r3, r3, #512
	strlt	r3, [r0]
.L520:
	ldr	r3, [r1]
	cmp	r3, #144
	movgt	r2, #96
	movle	r2, #0
	ldr	r3, .L532+8
	str	r2, [r3]
	bl	updatePlayer
	bl	updateEnemy
	bl	updateCoins
	bl	updateAmmo
	bl	updateKey
	bl	updateDoor
	ldr	r4, .L532+12
	add	r5, r4, #400
.L523:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	movne	r0, r4
	blne	updateBullet.part.0
.L522:
	add	r4, r4, #80
	cmp	r4, r5
	bne	.L523
	ldr	r4, .L532+16
	add	r5, r4, #2400
.L524:
	mov	r0, r4
	add	r4, r4, #80
	bl	updateBulletEnemy
	cmp	r4, r5
	bne	.L524
	bl	drawBullets
	bl	drawBulletsEnemy
	bl	updateWeapon
	ldr	lr, .L532+20
	ldr	ip, [lr]
	ldr	r4, .L532+24
	add	ip, ip, #1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L532+28
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L533:
	.align	2
.L532:
	.word	player
	.word	playerhOff
	.word	vOff
	.word	bullets
	.word	enemyBullets
	.word	timer
	.word	DMANow
	.word	shadowOAM
	.size	updateGame, .-updateGame
	.align	2
	.global	onScreen1
	.syntax unified
	.arm
	.fpu softvfp
	.type	onScreen1, %function
onScreen1:
	@ Function supports interworking.
	@ args = 80, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L541
	ldr	ip, [ip]
	sub	sp, sp, #16
	cmp	ip, #28
	sub	ip, sp, #4
	stmib	ip, {r0, r1, r2, r3}
	bne	.L539
	ldr	r1, .L541+4
	ldr	r2, [sp]
	ldr	r3, [sp, #20]
	ldr	r1, [r1]
	add	r3, r2, r3
	sub	r3, r3, r1
	cmp	r3, #0
	blt	.L539
	sub	r2, r2, r1
	cmp	r2, #160
	bgt	.L539
	ldr	r2, .L541+8
	ldr	r0, [sp, #4]
	ldr	r3, [sp, #16]
	ldr	r2, [r2]
	add	r3, r0, r3
	sub	r3, r3, r2
	cmp	r3, #0
	blt	.L539
	sub	r0, r0, r2
	cmp	r0, #240
	movgt	r0, #0
	movle	r0, #1
	add	sp, sp, #16
	bx	lr
.L539:
	mov	r0, #0
	add	sp, sp, #16
	bx	lr
.L542:
	.align	2
.L541:
	.word	screenBlock
	.word	vOff
	.word	playerhOff
	.size	onScreen1, .-onScreen1
	.align	2
	.global	onScreen2
	.syntax unified
	.arm
	.fpu softvfp
	.type	onScreen2, %function
onScreen2:
	@ Function supports interworking.
	@ args = 80, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L550
	ldr	ip, [ip]
	sub	sp, sp, #16
	cmp	ip, #29
	sub	ip, sp, #4
	stmib	ip, {r0, r1, r2, r3}
	bne	.L548
	ldr	r1, .L550+4
	ldr	r2, [sp]
	ldr	r3, [sp, #20]
	ldr	r1, [r1]
	add	r3, r2, r3
	sub	r3, r3, r1
	cmp	r3, #0
	blt	.L548
	sub	r2, r2, r1
	cmp	r2, #160
	bgt	.L548
	ldr	r2, .L550+8
	ldr	r0, [sp, #4]
	ldr	r3, [sp, #16]
	ldr	r2, [r2]
	add	r3, r0, r3
	sub	r3, r3, r2
	cmp	r3, #0
	blt	.L548
	sub	r0, r0, r2
	cmp	r0, #240
	movgt	r0, #0
	movle	r0, #1
	add	sp, sp, #16
	bx	lr
.L548:
	mov	r0, #0
	add	sp, sp, #16
	bx	lr
.L551:
	.align	2
.L550:
	.word	screenBlock
	.word	vOff
	.word	playerhOff
	.size	onScreen2, .-onScreen2
	.global	collisionMap
	.comm	keyFall,4,4
	.comm	hasKey,4,4
	.comm	screenBlock,4,4
	.comm	playerhOff,4,4
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
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	enemyBullets,2400,4
	.comm	bullets,400,4
	.comm	weapon,240,4
	.comm	ammo,400,4
	.comm	coin,240,4
	.comm	enemy,320,4
	.comm	door,80,4
	.comm	key,80,4
	.comm	player,80,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	collisionMap, %object
	.size	collisionMap, 4
collisionMap:
	.word	collisionMapBitmap
	.ident	"GCC: (devkitARM release 53) 9.1.0"
