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
	.global	initWeapons
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initWeapons, %function
initWeapons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r0, .L18
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r1, r2
	mov	r3, r0
	mov	r4, #7
	mov	r6, #5
	mov	r8, #232
	mov	r7, #220
	mov	lr, #2
	mov	ip, #1
	mov	r5, #4
	mov	r10, #14
.L8:
	cmp	r2, #0
	streq	r5, [r0, #56]
	beq	.L3
	cmp	r2, #1
	streq	r6, [r0, #148]
	beq	.L5
	mov	r9, #6
	str	r9, [r0, #240]
	ldr	r9, [r3, #56]
	cmp	r9, #6
	beq	.L6
	bgt	.L7
	cmp	r9, #4
	beq	.L3
	cmp	r9, #5
	beq	.L5
.L7:
	add	r2, r2, #1
	cmp	r2, #3
	add	r3, r3, #92
	bne	.L8
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L6:
	mov	r9, #60
	mov	fp, #8
	str	r9, [r3]
	mov	r9, #65
	str	r4, [r3, #16]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	lr, [r3, #40]
	str	r1, [r3, #28]
	str	ip, [r3, #44]
	str	fp, [r3, #20]
	str	r9, [r3, #4]
	b	.L7
.L5:
	mov	r9, #272
	str	r5, [r3, #16]
	str	r4, [r3, #20]
	str	r10, [r3]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	lr, [r3, #40]
	str	r1, [r3, #28]
	str	ip, [r3, #44]
	str	r9, [r3, #4]
	b	.L7
.L3:
	str	r4, [r3, #16]
	str	r6, [r3, #20]
	str	r8, [r3]
	str	r7, [r3, #4]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	lr, [r3, #40]
	str	r1, [r3, #28]
	str	ip, [r3, #44]
	b	.L7
.L19:
	.align	2
.L18:
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
	ldr	r3, .L22
	ldr	r0, [r3]
	ldr	r3, .L22+4
	add	r0, r0, #86
	str	r0, [r3]
	str	lr, [r3, #40]
	str	ip, [r3, #48]
	ldr	lr, .L22+8
	ldr	ip, .L22+12
	ldr	r0, .L22+16
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	r1, [r3, #28]
	ldr	r1, .L22+20
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
.L23:
	.align	2
.L22:
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
	mov	r1, #8
	ldr	r3, .L25
	ldr	r2, .L25+4
	str	ip, [r3, #16]
	stm	r3, {r1, r2}
	str	r0, [r3, #20]
	bx	lr
.L26:
	.align	2
.L25:
	.word	key
	.word	1010
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
	ldr	r3, .L28
	stm	r3, {r1, r2}
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	bx	lr
.L29:
	.align	2
.L28:
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
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r1, .L101
	ldr	r0, [r1, #280]
	sub	sp, sp, #132
	str	r0, [sp, #116]
	ldr	r0, [r1, #276]
	str	r0, [sp, #124]
	ldr	r0, [r1, #188]
	str	r0, [sp, #96]
	ldr	r0, [r1, #184]
	str	r0, [sp, #104]
	ldr	r0, [r1, #96]
	str	r0, [sp, #68]
	ldr	r0, [r1, #92]
	str	r0, [sp, #76]
	ldr	r0, [r1, #4]
	str	r0, [sp]
	ldr	r0, [r1, #1016]
	str	r0, [sp, #32]
	ldr	r0, [r1, #1012]
	str	r0, [sp, #40]
	ldr	r0, [r1, #924]
	str	r2, [sp, #120]
	str	r2, [sp, #100]
	str	r2, [sp, #72]
	str	r2, [sp, #4]
	str	r2, [sp, #36]
	str	r2, [sp, #84]
	str	r2, [sp, #52]
	str	r2, [sp, #24]
	str	r2, [sp, #92]
	str	r2, [sp, #44]
	str	r2, [sp, #8]
	ldr	r9, [r1]
	str	r0, [sp, #80]
	ldr	r0, [r1, #920]
	str	r0, [sp, #88]
	ldr	r0, [r1, #832]
	str	r0, [sp, #48]
	ldr	r0, [r1, #828]
	str	r0, [sp, #56]
	ldr	r0, [r1, #740]
	str	r0, [sp, #20]
	ldr	r0, [r1, #736]
	str	r0, [sp, #28]
	ldr	r0, [r1, #648]
	str	r0, [sp, #108]
	ldr	r0, [r1, #644]
	str	r0, [sp, #112]
	ldr	r0, [r1, #556]
	str	r0, [sp, #60]
	ldr	r0, [r1, #552]
	str	r0, [sp, #64]
	ldr	r0, [r1, #464]
	str	r0, [sp, #12]
	ldr	r0, [r1, #460]
	add	r7, r1, #368
	mov	r5, r1
	mov	r3, r1
	mov	r6, r2
	mov	ip, #10
	mov	lr, #23
	str	r0, [sp, #16]
	ldm	r7, {r7, r8}
	b	.L37
.L31:
	mov	r1, #0
	mov	r0, #1
	mov	fp, #20
	mov	r10, #3
	mov	r4, #4
	cmp	r2, r1
	str	ip, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3, #84]
	str	r0, [r3, #12]
	str	r0, [r3, #8]
	str	r0, [r3, #28]
	str	r0, [r3, #44]
	str	fp, [r3, #48]
	str	r1, [r3, #76]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	r1, [r3, #68]
	str	r1, [r3, #80]
	str	r10, [r3, #40]
	str	r4, [r3, #60]
	beq	.L58
	cmp	r2, r0
	beq	.L59
	cmp	r2, #2
	beq	.L60
	cmp	r2, r10
	beq	.L61
	cmp	r2, #11
	beq	.L36
.L50:
	add	r2, r2, #1
	add	r3, r3, #92
.L37:
	cmp	r2, #3
	movle	r1, #1
	movgt	r1, #0
	str	r1, [r3, #56]
	ble	.L31
	mov	r1, #1
	mov	r4, #20
	mov	r0, #0
	cmp	r2, #4
	str	ip, [r3, #16]
	str	lr, [r3, #20]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	r4, [r3, #48]
	str	r0, [r3, #76]
	beq	.L51
	cmp	r2, #5
	beq	.L52
	cmp	r2, #6
	beq	.L53
	cmp	r2, #7
	beq	.L54
	cmp	r2, #8
	beq	.L55
	cmp	r2, #9
	beq	.L56
	cmp	r2, #10
	bne	.L99
	str	r1, [sp, #84]
	mov	r1, #221
	str	r1, [sp, #88]
	ldr	r1, .L101+4
	str	r1, [sp, #80]
.L33:
	mov	r1, #0
	mov	r0, #1
	mov	fp, #3
	mov	r10, #2
	mov	r4, #24
	cmp	r2, #11
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	r1, [r3, #80]
	str	r1, [r3, #68]
	str	r0, [r3, #28]
	str	r0, [r3, #44]
	str	fp, [r3, #40]
	str	r10, [r3, #60]
	str	r4, [r3, #84]
	bne	.L50
.L36:
	ldr	r3, [sp, #8]
	cmp	r6, #0
	strne	r8, [r5, #372]
	strne	r7, [r5, #368]
	cmp	r3, #0
	ldrne	r3, [sp, #12]
	strne	r3, [r5, #464]
	ldrne	r3, [sp, #16]
	strne	r3, [r5, #460]
	ldr	r3, [sp, #44]
	cmp	r3, #0
	ldrne	r3, [sp, #60]
	strne	r3, [r5, #556]
	ldrne	r3, [sp, #64]
	strne	r3, [r5, #552]
	ldr	r3, [sp, #92]
	cmp	r3, #0
	ldrne	r3, [sp, #108]
	strne	r3, [r5, #648]
	ldrne	r3, [sp, #112]
	strne	r3, [r5, #644]
	ldr	r3, [sp, #24]
	cmp	r3, #0
	ldrne	r3, [sp, #20]
	strne	r3, [r5, #740]
	ldrne	r3, [sp, #28]
	strne	r3, [r5, #736]
	ldr	r3, [sp, #52]
	cmp	r3, #0
	ldrne	r3, [sp, #48]
	strne	r3, [r5, #832]
	ldrne	r3, [sp, #56]
	strne	r3, [r5, #828]
	ldr	r3, [sp, #84]
	cmp	r3, #0
	ldrne	r3, [sp, #80]
	strne	r3, [r5, #924]
	ldrne	r3, [sp, #88]
	strne	r3, [r5, #920]
	ldr	r3, [sp, #36]
	cmp	r3, #0
	ldrne	r3, [sp, #32]
	strne	r3, [r5, #1016]
	ldrne	r3, [sp, #40]
	strne	r3, [r5, #1012]
	ldr	r3, [sp, #4]
	cmp	r3, #0
	ldrne	r3, [sp]
	strne	r3, [r5, #4]
	ldr	r3, [sp, #72]
	strne	r9, [r5]
	cmp	r3, #0
	ldrne	r3, [sp, #68]
	strne	r3, [r5, #96]
	ldrne	r3, [sp, #76]
	strne	r3, [r5, #92]
	ldr	r3, [sp, #100]
	cmp	r3, #0
	ldrne	r3, [sp, #96]
	strne	r3, [r5, #188]
	ldrne	r3, [sp, #104]
	strne	r3, [r5, #184]
	ldr	r3, [sp, #120]
	cmp	r3, #0
	bne	.L100
.L30:
	add	sp, sp, #132
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L58:
	mov	r1, #97
	mov	r9, #204
	str	r0, [sp, #4]
	str	r1, [sp]
	b	.L50
.L55:
	str	r1, [sp, #24]
	mov	r1, #77
	str	r1, [sp, #28]
	add	r1, r1, #520
	str	r1, [sp, #20]
	b	.L33
.L51:
	mov	r6, r1
	mov	r7, #9
	mov	r8, #60
	b	.L33
.L52:
	str	r1, [sp, #8]
	mov	r1, #53
	str	r1, [sp, #16]
	mov	r1, #106
	str	r1, [sp, #12]
	b	.L33
.L56:
	str	r1, [sp, #52]
	mov	r1, #37
	str	r1, [sp, #56]
	mov	r1, #860
	str	r1, [sp, #48]
	b	.L33
.L59:
	mov	r1, #188
	str	r1, [sp, #76]
	add	r1, r1, #175
	str	r2, [sp, #72]
	str	r1, [sp, #68]
	b	.L50
.L53:
	str	r1, [sp, #44]
	mov	r1, #69
	str	r1, [sp, #64]
	add	r1, r1, #416
	str	r1, [sp, #60]
	b	.L33
.L60:
	mov	r1, #56
	str	r1, [sp, #104]
	ldr	r1, .L101+8
	str	r0, [sp, #100]
	str	r1, [sp, #96]
	b	.L50
.L99:
	cmp	r2, #11
	ldr	r1, [sp, #40]
	moveq	r1, #173
	str	r1, [sp, #40]
	ldr	r1, [sp, #36]
	moveq	r1, #1
	str	r1, [sp, #36]
	ldr	r1, [sp, #32]
	moveq	r1, #548
	str	r1, [sp, #32]
	b	.L33
.L54:
	str	r1, [sp, #92]
	mov	r1, #113
	str	r1, [sp, #112]
	add	r1, r1, #241
	str	r1, [sp, #108]
	b	.L33
.L61:
	mov	r1, #180
	str	r1, [sp, #124]
	ldr	r1, .L101+12
	str	r0, [sp, #120]
	str	r1, [sp, #116]
	b	.L50
.L100:
	ldr	r3, [sp, #116]
	str	r3, [r5, #280]
	ldr	r3, [sp, #124]
	str	r3, [r5, #276]
	b	.L30
.L102:
	.align	2
.L101:
	.word	enemy
	.word	678
	.word	731
	.word	787
	.size	initEnemy, .-initEnemy
	.align	2
	.global	initCoins
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCoins, %function
initCoins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	ip, .L175
	ldr	r7, [ip, #1016]
	sub	sp, sp, #132
	str	r7, [sp, #56]
	ldr	r7, [ip, #1012]
	str	r7, [sp, #64]
	ldr	r7, [ip, #924]
	str	r7, [sp, #116]
	ldr	r7, [ip, #920]
	str	r7, [sp, #124]
	ldr	r7, [ip, #832]
	str	r7, [sp, #104]
	ldr	r7, [ip, #828]
	mov	fp, r1
	str	r7, [sp, #112]
	mov	r3, r1
	ldr	r7, [ip, #740]
	mov	r5, r1
	mov	r4, #12
	mov	lr, #16
	mov	r0, #1
	str	r7, [sp, #92]
	ldr	r7, [ip, #736]
	str	r7, [sp, #100]
	ldr	r7, [ip, #648]
	str	r7, [sp, #80]
	ldr	r7, [ip, #644]
	str	r7, [sp, #88]
	ldr	r7, [ip, #556]
	str	r1, [sp, #12]
	str	r1, [sp, #24]
	str	r1, [sp, #60]
	str	r1, [sp, #120]
	str	r1, [sp, #108]
	str	r1, [sp, #96]
	str	r1, [sp, #84]
	str	r1, [sp, #72]
	str	r1, [sp, #44]
	str	r1, [sp, #32]
	str	r7, [sp, #68]
	ldr	r7, [ip, #552]
	str	r7, [sp, #76]
	ldr	r7, [ip, #464]
	str	r7, [sp, #48]
	ldr	r7, [ip, #460]
	str	r7, [sp, #52]
	ldr	r7, [ip, #372]
	str	r7, [sp, #36]
	ldr	r7, [ip, #368]
	str	r7, [sp, #40]
	ldr	r7, [ip, #280]
	str	r7, [sp, #4]
	ldr	r7, [ip, #276]
	str	r7, [sp]
	ldr	r7, [ip, #96]
	str	r7, [sp, #8]
	ldr	r7, [ip, #92]
	mov	r6, ip
	mov	r2, ip
	ldr	r8, [ip, #188]
	ldr	r10, [ip, #184]
	str	r7, [sp, #16]
	ldr	r7, [ip, #4]
	ldr	ip, [ip]
	str	r7, [sp, #20]
	str	ip, [sp, #28]
	ldr	r9, .L175+4
.L110:
	cmp	r3, #1
	ble	.L171
	cmp	r3, #2
	beq	.L172
	cmp	r3, #3
	str	r5, [r2, #56]
	str	r4, [r2, #16]
	str	lr, [r2, #20]
	beq	.L124
	cmp	r3, #4
	beq	.L125
	cmp	r3, #5
	beq	.L126
	cmp	r3, #6
	beq	.L127
	cmp	r3, #7
	beq	.L128
	cmp	r3, #8
	beq	.L129
	cmp	r3, #9
	beq	.L130
	cmp	r3, #10
	beq	.L173
	mov	ip, #120
	str	ip, [sp, #64]
	mov	ip, #1
	str	ip, [sp, #60]
	mov	ip, #1000
	str	ip, [sp, #56]
	b	.L105
.L171:
	mov	ip, #7
	mov	r7, #2
	cmp	r3, #0
	str	r7, [r2, #56]
	str	ip, [r2, #16]
	str	ip, [r2, #20]
	beq	.L174
	mov	ip, #135
	str	ip, [sp, #16]
	mov	ip, #1
	str	ip, [sp, #12]
	mov	ip, #760
	str	ip, [sp, #8]
.L105:
	str	r0, [r2, #44]
.L108:
	add	r3, r3, #1
	cmp	r3, #12
	add	r2, r2, #92
	bne	.L110
	cmp	fp, #0
	ldrne	r3, [sp, #4]
	strne	r3, [r6, #280]
	ldrne	r3, [sp]
	strne	r3, [r6, #276]
	ldr	r3, [sp, #32]
	cmp	r3, #0
	ldrne	r3, [sp, #36]
	strne	r3, [r6, #372]
	ldrne	r3, [sp, #40]
	strne	r3, [r6, #368]
	ldr	r3, [sp, #44]
	cmp	r3, #0
	ldrne	r3, [sp, #48]
	strne	r3, [r6, #464]
	ldrne	r3, [sp, #52]
	strne	r3, [r6, #460]
	ldr	r3, [sp, #72]
	cmp	r3, #0
	ldrne	r3, [sp, #68]
	strne	r3, [r6, #556]
	ldrne	r3, [sp, #76]
	strne	r3, [r6, #552]
	ldr	r3, [sp, #84]
	cmp	r3, #0
	ldrne	r3, [sp, #80]
	strne	r3, [r6, #648]
	ldrne	r3, [sp, #88]
	strne	r3, [r6, #644]
	ldr	r3, [sp, #96]
	cmp	r3, #0
	ldrne	r3, [sp, #92]
	strne	r3, [r6, #740]
	ldrne	r3, [sp, #100]
	strne	r3, [r6, #736]
	ldr	r3, [sp, #108]
	cmp	r3, #0
	ldrne	r3, [sp, #104]
	strne	r3, [r6, #832]
	ldrne	r3, [sp, #112]
	strne	r3, [r6, #828]
	ldr	r3, [sp, #120]
	cmp	r3, #0
	ldrne	r3, [sp, #116]
	strne	r3, [r6, #924]
	ldrne	r3, [sp, #124]
	strne	r3, [r6, #920]
	ldr	r3, [sp, #60]
	cmp	r3, #0
	ldrne	r3, [sp, #56]
	strne	r3, [r6, #1016]
	ldrne	r3, [sp, #64]
	strne	r3, [r6, #1012]
	ldr	r3, [sp, #24]
	cmp	r3, #0
	ldrne	r3, [sp, #20]
	strne	r3, [r6, #4]
	ldrne	r3, [sp, #28]
	strne	r3, [r6]
	ldr	r3, [sp, #12]
	cmp	r3, #0
	ldrne	r3, [sp, #8]
	strne	r3, [r6, #96]
	ldrne	r3, [sp, #16]
	strne	r3, [r6, #92]
	cmp	r1, #0
	strne	r8, [r6, #188]
	strne	r10, [r6, #184]
	add	sp, sp, #132
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L172:
	mov	r1, #7
	mov	ip, #3
	mov	r10, #14
	str	ip, [r6, #240]
	mov	r8, r9
	str	r1, [r2, #16]
	str	r1, [r2, #20]
	str	r0, [r2, #44]
	mov	r1, #1
	b	.L108
.L124:
	mov	ip, #130
	str	ip, [sp]
	mov	ip, #260
	mov	fp, #1
	str	ip, [sp, #4]
	b	.L105
.L174:
	mov	ip, #180
	str	ip, [sp, #28]
	mov	ip, #1
	str	ip, [sp, #24]
	mov	ip, #9
	str	ip, [sp, #20]
	b	.L105
.L125:
	mov	ip, #20
	str	ip, [sp, #40]
	mov	ip, #1
	str	ip, [sp, #32]
	mov	ip, #210
	str	ip, [sp, #36]
	b	.L105
.L126:
	mov	ip, #22
	str	ip, [sp, #52]
	mov	ip, #1
	str	ip, [sp, #44]
	mov	ip, #340
	str	ip, [sp, #48]
	b	.L105
.L127:
	mov	ip, #225
	str	ip, [sp, #76]
	mov	ip, #1
	str	ip, [sp, #72]
	ldr	ip, .L175+8
	str	ip, [sp, #68]
	b	.L105
.L128:
	mov	ip, #105
	str	ip, [sp, #88]
	mov	ip, #1
	str	ip, [sp, #84]
	ldr	ip, .L175+12
	str	ip, [sp, #80]
	b	.L105
.L173:
	mov	ip, #220
	str	ip, [sp, #124]
	mov	ip, #1
	str	ip, [sp, #120]
	mov	ip, #920
	str	ip, [sp, #116]
	b	.L105
.L129:
	mov	ip, #230
	str	ip, [sp, #100]
	mov	ip, #1
	str	ip, [sp, #96]
	mov	ip, #620
	str	ip, [sp, #92]
	b	.L105
.L130:
	mov	ip, #7
	str	ip, [sp, #112]
	mov	ip, #1
	str	ip, [sp, #108]
	add	ip, ip, #684
	str	ip, [sp, #104]
	b	.L105
.L176:
	.align	2
.L175:
	.word	coin
	.word	518
	.word	402
	.word	491
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
	mov	r1, #6
	mov	r2, #1
	ldr	r3, .L179
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	str	r0, [r3, #16]
	str	r0, [r3, #108]
	str	r0, [r3, #200]
	str	r0, [r3, #292]
	str	r0, [r3, #384]
	str	r0, [r3, #476]
	str	r0, [r3, #568]
	str	r0, [r3, #660]
	str	r0, [r3, #752]
	str	r0, [r3, #844]
	str	r0, [r3, #936]
	str	r1, [r3, #20]
	str	r1, [r3, #112]
	str	r1, [r3, #204]
	str	r1, [r3, #296]
	str	r1, [r3, #388]
	str	r1, [r3, #480]
	str	r1, [r3, #572]
	str	r1, [r3, #664]
	str	r1, [r3, #756]
	str	r1, [r3, #848]
	str	r1, [r3, #940]
	str	r2, [r3, #44]
	str	r2, [r3, #136]
	str	r2, [r3, #228]
	str	r2, [r3, #320]
	str	r2, [r3, #412]
	str	r2, [r3, #504]
	str	r2, [r3, #596]
	str	r2, [r3, #688]
	str	r2, [r3, #780]
	str	r2, [r3, #872]
	str	r2, [r3, #964]
	str	r2, [r3, #1056]
	str	r2, [r3, #1148]
	str	r2, [r3, #1240]
	str	r2, [r3, #1332]
	mov	r2, #110
	str	r2, [r3, #280]
	mov	r2, #180
	str	r1, [r3, #1032]
	str	r1, [r3, #1124]
	str	r1, [r3, #1216]
	str	r1, [r3, #1308]
	mov	r1, #20
	str	r2, [r3, #276]
	mov	r2, #90
	str	r1, [r3, #460]
	mov	r1, #150
	str	r2, [r3, #368]
	ldr	r2, .L179+4
	str	r2, [r3, #464]
	mov	r2, #170
	mov	fp, #10
	mov	r10, #60
	mov	r9, #144
	mov	r8, #130
	mov	r7, #234
	mov	r6, #70
	mov	r5, #235
	mov	ip, #320
	str	r1, [r3, #644]
	mov	r1, #120
	str	r2, [r3, #552]
	ldr	r2, .L179+8
	str	r2, [r3, #648]
	add	r2, r2, #48
	str	r2, [r3, #740]
	add	r2, r2, #252
	str	r2, [r3, #832]
	sub	r2, r2, #153
	stm	r3, {r10, fp}
	str	r0, [r3, #1028]
	str	r0, [r3, #1120]
	str	r0, [r3, #1212]
	str	r0, [r3, #1304]
	str	r9, [r3, #96]
	str	r8, [r3, #92]
	str	r7, [r3, #188]
	str	r6, [r3, #184]
	str	r1, [r3, #736]
	str	r5, [r3, #828]
	str	ip, [r3, #372]
	str	ip, [r3, #556]
	str	r2, [r3, #924]
	mov	r2, #14
	mov	r1, #232
	str	r2, [r3, #920]
	mov	r2, #860
	mov	r4, #128
	mov	lr, #160
	mov	r0, #22
	str	r2, [r3, #1016]
	str	r1, [r3, #1012]
	sub	r2, r2, #74
	ldr	r1, .L179+12
	str	r2, [r3, #1108]
	sub	r2, r2, #148
	str	r4, [r3, #1196]
	str	lr, [r3, #1288]
	str	r0, [r3, #1104]
	str	r1, [r3, #1200]
	str	r2, [r3, #1292]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L180:
	.align	2
.L179:
	.word	ammo
	.word	427
	.word	495
	.word	895
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
	ldr	r3, .L187
	ldr	r3, [r3]
	subs	r3, r3, r4
	movne	r3, #1
	mov	r2, #20
	ldr	lr, .L187+4
	ldr	ip, .L187+8
	ldr	r0, .L187+12
	ldr	r1, .L187+16
	str	r3, [lr]
	str	r4, [ip]
	str	r4, [r0]
	str	r4, [r1]
	ldr	r5, .L187+20
	ldr	lr, .L187+24
	ldr	ip, .L187+28
	ldr	r0, .L187+32
	ldr	r1, .L187+36
	ldr	r3, .L187+40
	str	r4, [r5]
	str	r4, [lr]
	str	r4, [ip]
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r3]
	ldr	r5, .L187+44
	ldr	lr, .L187+48
	ldr	ip, .L187+52
	ldr	r0, .L187+56
	ldr	r1, .L187+60
	ldr	r3, .L187+64
	str	r4, [r5]
	str	r4, [lr]
	str	r4, [ip]
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r3]
	ldr	r5, .L187+68
	ldr	lr, .L187+72
	ldr	ip, .L187+76
	ldr	r0, .L187+80
	ldr	r1, .L187+84
	ldr	r3, .L187+88
	str	r4, [r5]
	str	r4, [lr]
	str	r4, [ip]
	ldr	lr, .L187+92
	ldr	ip, .L187+96
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r3]
	ldr	r1, .L187+100
	ldr	r3, .L187+104
	ldr	r0, .L187+108
	ldr	r6, .L187+112
	ldr	r5, .L187+116
	str	r2, [r3]
	str	r4, [lr]
	str	r4, [ip]
	str	r4, [r1]
	str	r4, [r6]
	str	r4, [r5]
	str	r4, [r0]
	bl	initPlayer
	bl	initEnemy
	mov	lr, #5
	mov	ip, #13
	mvn	r0, #4
	mov	r2, #3
	ldr	r3, .L187+120
	add	r1, r3, #460
.L182:
	str	lr, [r3, #20]
	str	ip, [r3, #16]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r4, [r3, #44]
	str	r4, [r3, #88]
	stm	r3, {r0, r4}
	add	r3, r3, #92
	cmp	r3, r1
	bne	.L182
	mov	lr, #5
	mov	r4, #13
	mvn	ip, #4
	mov	r2, #0
	mov	r0, #1
	ldr	r3, .L187+124
	add	r1, r3, #2752
	add	r1, r1, #8
.L183:
	str	lr, [r3, #20]
	str	r4, [r3, #16]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #12]
	str	r2, [r3, #44]
	add	r3, r3, #92
	cmp	r3, r1
	bne	.L183
	bl	initWeapons
	bl	initCoins
	bl	initAmmo
	mov	lr, #8
	mov	r5, #7
	mov	ip, #16
	mov	r0, #32
	mov	r1, #184
	mov	r2, #1008
	ldr	r3, .L187+128
	str	lr, [r3]
	ldr	lr, .L187+132
	str	r5, [r3, #16]
	str	r4, [r3, #20]
	str	lr, [r3, #4]
	ldr	r3, .L187+136
	pop	{r4, r5, r6, lr}
	stm	r3, {r1, r2}
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	bx	lr
.L188:
	.align	2
.L187:
	.word	hasCheat
	.word	hasIce
	.word	playerhOff
	.word	hasKey
	.word	keyFall
	.word	shotFrames
	.word	vOff
	.word	hOff
	.word	hOff2
	.word	won
	.word	timer
	.word	timer2
	.word	timerAniCounter
	.word	timerCurFrame
	.word	hasGun
	.word	hasKnife
	.word	hasShield
	.word	hitFrames
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
	.word	iceFrames
	.word	stabbingFrames
	.word	bullets
	.word	enemyBullets
	.word	key
	.word	1010
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
	ldr	r3, .L193
	add	r0, r3, #460
.L190:
	str	r4, [r3, #20]
	str	lr, [r3, #16]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #44]
	str	r2, [r3, #88]
	add	r3, r3, #92
	cmp	r3, r0
	bne	.L190
	pop	{r4, lr}
	bx	lr
.L194:
	.align	2
.L193:
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
	ldr	r3, .L199
	add	r1, r3, #2752
	add	r1, r1, #8
.L196:
	str	r4, [r3, #20]
	str	lr, [r3, #16]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #12]
	str	r2, [r3, #44]
	add	r3, r3, #92
	cmp	r3, r1
	bne	.L196
	pop	{r4, lr}
	bx	lr
.L200:
	.align	2
.L199:
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
	ldr	r5, .L228
	mov	r4, r5
	ldr	r6, .L228+4
	ldr	r9, .L228+8
	ldr	r8, .L228+12
	ldr	r10, .L228+16
	ldr	fp, .L228+20
	sub	sp, sp, #20
	add	r7, r5, #276
.L209:
	ldr	r2, [r4, #24]
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r8, r3
	cmp	r8, r3, ror #1
	bcc	.L202
	ldr	r3, [r4, #36]
	adds	r3, r3, #1
	and	r3, r3, #1
	rsbmi	r3, r3, #0
	str	r3, [r4, #36]
.L202:
	add	r0, r4, #16
	ldm	r0, {r0, lr}
	ldm	r4, {r1, r3}
	str	lr, [sp, #12]
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	str	r3, [sp]
	add	ip, r2, #1
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r6]
	ldr	r0, [r6, #4]
	str	ip, [r4, #24]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L204
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L204
	mov	r2, #0
	ldr	r3, [r10]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r10]
	str	r2, [r4, #44]
	ldr	r3, [r4, #56]
	ldreq	r2, .L228+24
	streq	r3, [r2]
	cmp	r3, #4
	moveq	r3, #1
	streq	r3, [fp]
	beq	.L204
	cmp	r3, #5
	beq	.L223
	cmp	r3, #6
	moveq	r3, #1
	ldreq	r2, .L228+28
	streq	r3, [r2]
.L204:
	add	r4, r4, #92
	cmp	r4, r7
	bne	.L209
.L227:
	mov	r0, #512
	ldr	r3, .L228+32
	ldr	r1, .L228+36
	ldr	r3, [r3]
	ldr	r2, .L228+40
	ldr	r1, [r1]
	sub	r3, r3, #24
	ldr	ip, [r2]
	add	r1, r1, r3, lsl #8
	lsl	r6, r1, #16
	lsl	r4, ip, #16
	ldr	r3, .L228+44
	ldr	r8, .L228+48
	lsr	r6, r6, #16
	lsr	r4, r4, #16
.L214:
	ldr	r2, [r5, #44]
	cmp	r2, #1
	beq	.L224
.L210:
	strh	r0, [r3, #168]	@ movhi
.L212:
	add	r5, r5, #92
	cmp	r5, r7
	add	r3, r3, #8
	bne	.L214
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L224:
	ldr	lr, [r5]
	ldr	r2, [r5, #20]
	add	r2, lr, r2
	sub	r2, r2, ip
	cmp	r2, #0
	blt	.L210
	sub	r2, lr, ip
	cmp	r2, #160
	bgt	.L210
	ldr	r9, [r5, #4]
	ldr	r2, [r5, #16]
	add	r2, r9, r2
	sub	r2, r2, r1
	cmp	r2, #0
	blt	.L210
	sub	r2, r9, r1
	cmp	r2, #240
	bgt	.L210
	ldr	r2, [r5, #56]
	sub	lr, lr, r4
	sub	r9, r9, r6
	and	lr, lr, #255
	and	r9, r9, r8
	cmp	r2, #4
	strh	lr, [r3, #168]	@ movhi
	strh	r9, [r3, #170]	@ movhi
	beq	.L225
	cmp	r2, #5
	beq	.L226
	cmp	r2, #6
	ldreq	r2, [r5, #36]
	lsleq	r2, r2, #5
	addeq	r2, r2, #84
	strheq	r2, [r3, #172]	@ movhi
	b	.L212
.L223:
	mov	r3, #1
	ldr	r2, .L228+52
	add	r4, r4, #92
	cmp	r4, r7
	str	r3, [r2]
	bne	.L209
	b	.L227
.L225:
	ldr	r2, [r5, #36]
	lsl	r2, r2, #5
	add	r2, r2, #86
	strh	r2, [r3, #172]	@ movhi
	b	.L212
.L226:
	ldr	r2, [r5, #36]
	lsl	r2, r2, #5
	add	r2, r2, #85
	strh	r2, [r3, #172]	@ movhi
	b	.L212
.L229:
	.align	2
.L228:
	.word	weapon
	.word	player
	.word	collision
	.word	143165576
	.word	numWeapons
	.word	hasGun
	.word	currWeapon
	.word	hasShield
	.word	screenBlock2
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	511
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
	ldr	r4, .L253
	ldr	r5, .L253+4
	ldr	r8, .L253+8
	ldr	r9, .L253+12
	ldr	r7, .L253+16
	sub	sp, sp, #20
	add	r6, r4, #1104
.L242:
	ldr	r2, [r4, #56]
	cmp	r2, #0
	ldr	r0, [r4, #24]
	bne	.L231
	ldr	r3, .L253+20
	smull	r1, r3, r0, r3
	asr	r1, r0, #31
	rsb	r3, r1, r3, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r0, r3, lsl #2
	bne	.L232
	ldr	r3, [r4, #36]
	add	r3, r3, #1
	rsbs	r1, r3, #0
	and	r1, r1, #3
	and	r3, r3, #3
	rsbpl	r3, r1, #0
	str	r3, [r4, #36]
.L232:
	ldr	r3, [r8]
	smull	r1, ip, r7, r3
	asr	r1, r3, #31
	rsb	r1, r1, ip, asr #3
	add	r1, r1, r1, lsl #3
	sub	r1, r3, r1, lsl #2
	cmp	r1, #11
	cmple	r2, #2
	moveq	r3, #1
	movne	r3, #0
	ldr	r1, [r4, #44]
	add	r0, r0, #1
	cmp	r1, #0
	str	r0, [r4, #24]
	str	r3, [r4, #88]
	beq	.L233
	ldr	r1, .L253+24
	ldr	ip, [r4]
	ldr	r0, [r4, #20]
	ldr	r1, [r1]
	add	r0, ip, r0
	sub	r0, r0, r1
	cmp	r0, #0
	blt	.L233
	sub	r1, ip, r1
	cmp	r1, #160
	bgt	.L233
	ldr	lr, .L253+28
	ldr	lr, [lr]
	mov	fp, lr
	ldr	r0, .L253+32
	ldr	r0, [r0]
	ldr	lr, [r4, #4]
	ldr	r10, [r4, #16]
	sub	r0, r0, #24
	add	r0, fp, r0, lsl #8
	add	fp, lr, r10
	sub	fp, fp, r0
	cmp	fp, #0
	blt	.L233
	sub	r0, lr, r0
	cmp	r0, #240
	bgt	.L233
	add	r3, r1, r3
	and	r3, r3, #255
	cmp	r2, #0
	strh	r3, [r5]	@ movhi
	bne	.L234
	ldr	r3, [r4, #36]
	lsl	r0, r0, #23
	lsr	r0, r0, #23
	lsl	r3, r3, #6
	orr	r0, r0, #16384
	add	r3, r3, #24
	strh	r0, [r5, #2]	@ movhi
	strh	r3, [r5, #4]	@ movhi
.L235:
	add	fp, r4, #16
	ldm	fp, {fp, lr}
	ldr	r0, .L253+36
	str	ip, [sp]
	ldr	ip, [r4, #4]
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	ldm	r0, {r0, r1}
	str	fp, [sp, #12]
	str	lr, [sp, #8]
	str	ip, [sp, #4]
	ldr	fp, .L253+40
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	beq	.L238
	mov	r3, #0
	ldr	r2, [r4, #56]
	cmp	r2, r3
	str	r3, [r4, #44]
	beq	.L248
	cmp	r2, #2
	beq	.L249
	cmp	r2, #3
	beq	.L250
.L238:
	add	r4, r4, #92
	cmp	r4, r6
	add	r5, r5, #8
	bne	.L242
.L251:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L233:
	mov	r3, #512
	add	r4, r4, #92
	cmp	r4, r6
	strh	r3, [r5]	@ movhi
	add	r5, r5, #8
	bne	.L242
	b	.L251
.L231:
	add	r3, r0, r0, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r9, r3
	cmp	r9, r3, ror #1
	bcc	.L232
	ldr	r3, [r4, #36]
	adds	r3, r3, #1
	and	r3, r3, #1
	rsbmi	r3, r3, #0
	str	r3, [r4, #36]
	b	.L232
.L234:
	cmp	r2, #2
	beq	.L252
	cmp	r2, #3
	bne	.L235
	ldr	r3, [r4, #36]
	lsl	r0, r0, #23
	lsr	r0, r0, #23
	lsl	r3, r3, #6
	orr	r0, r0, #16384
	add	r3, r3, #18
	strh	r0, [r5, #2]	@ movhi
	strh	r3, [r5, #4]	@ movhi
	b	.L235
.L252:
	ldr	r3, [r4, #36]
	lsl	r0, r0, #23
	lsl	r3, r3, #5
	lsr	r0, r0, #23
	add	r3, r3, #23
	strh	r0, [r5, #2]	@ movhi
	strh	r3, [r5, #4]	@ movhi
	b	.L235
.L248:
	ldr	ip, .L253+44
	ldr	r3, [ip]
	ldr	r1, .L253+48
	add	r3, r3, #1
	str	r3, [ip]
	ldr	r1, [r1]
	ldr	r0, .L253+52
	ldr	r3, .L253+56
	add	r4, r4, #92
	mov	lr, pc
	bx	r3
	cmp	r4, r6
	add	r5, r5, #8
	bne	.L242
	b	.L251
.L250:
	ldr	r1, .L253+60
	mov	r2, r3
	ldr	r1, [r1]
	ldr	r3, .L253+56
	ldr	r0, .L253+64
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L253+68
	str	r2, [r3]
	b	.L238
.L249:
	ldr	r1, .L253+72
	mov	r2, r3
	ldr	r1, [r1]
	ldr	r3, .L253+56
	ldr	r0, .L253+76
	mov	lr, pc
	bx	r3
	ldr	r2, .L253+80
	ldr	r3, [r2]
	cmp	r3, #2
	addle	r3, r3, #1
	strle	r3, [r2]
	b	.L238
.L254:
	.align	2
.L253:
	.word	coin
	.word	shadowOAM+288
	.word	timer
	.word	143165576
	.word	954437177
	.word	1717986919
	.word	vOff
	.word	hOff
	.word	screenBlock2
	.word	player
	.word	collision
	.word	pts
	.word	coinSound_length
	.word	coinSound_data
	.word	playSoundB
	.word	iceSound_length
	.word	iceSound_data
	.word	hasIce
	.word	lifeSound_length
	.word	lifeSound_data
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
	ldr	r4, .L273
	add	r6, r4, #1376
	ldr	r5, .L273+4
	ldr	r8, .L273+8
	ldr	r7, .L273+12
	ldr	r9, .L273+16
	sub	sp, sp, #20
	add	r6, r6, #4
	b	.L261
.L272:
	ldr	r1, [r4]
	ldr	r0, [r4, #20]
	ldr	r3, [r9]
	add	r2, r1, r0
	sub	r2, r2, r3
	cmp	r2, #0
	blt	.L257
	sub	r3, r1, r3
	cmp	r3, #160
	bgt	.L257
	ldr	r2, .L273+20
	ldr	ip, .L273+24
	ldr	r2, [r2]
	ldr	lr, [ip]
	ldr	fp, [r4, #16]
	ldr	ip, [r4, #4]
	sub	r2, r2, #24
	add	r2, lr, r2, lsl #8
	add	lr, ip, fp
	sub	lr, lr, r2
	cmp	lr, #0
	blt	.L257
	sub	r2, ip, r2
	cmp	r2, #240
	bgt	.L257
	ldr	r10, .L273+28
	ldr	lr, [r4, #36]
	ldr	r10, [r10]
	lsl	r2, r2, #23
	lsl	lr, lr, #5
	lsr	r2, r2, #23
	and	r3, r3, #255
	add	lr, lr, #22
	cmp	r10, #94
	strh	r2, [r5, #2]	@ movhi
	strh	r3, [r5]	@ movhi
	strh	lr, [r5, #4]	@ movhi
	ble	.L270
.L259:
	add	r4, r4, #92
	cmp	r4, r6
	add	r5, r5, #8
	beq	.L271
.L261:
	ldr	r2, [r4, #24]
	rsb	r3, r2, r2, lsl #3
	add	r3, r3, r3, lsl #6
	add	r3, r2, r3, lsl #3
	rsb	r3, r3, r3, lsl #15
	add	r3, r2, r3, lsl #3
	add	r3, r3, r8
	cmp	r7, r3, ror #2
	bcc	.L256
	ldr	r3, [r4, #36]
	adds	r3, r3, #1
	and	r3, r3, #1
	rsbmi	r3, r3, #0
	str	r3, [r4, #36]
.L256:
	ldr	r3, [r4, #44]
	add	r2, r2, #1
	cmp	r3, #0
	str	r2, [r4, #24]
	bne	.L272
.L257:
	mov	r3, #512
	add	r4, r4, #92
	cmp	r4, r6
	strh	r3, [r5]	@ movhi
	add	r5, r5, #8
	bne	.L261
.L271:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L270:
	stm	sp, {r1, ip}
	str	fp, [sp, #12]
	ldr	lr, .L273+32
	str	r0, [sp, #8]
	ldr	fp, .L273+36
	ldr	r3, [lr, #16]
	ldr	r2, [lr, #20]
	ldm	lr, {r0, r1}
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	beq	.L259
	mov	r2, #0
	ldr	ip, .L273+28
	ldr	r3, [ip]
	ldr	r1, .L273+40
	add	r3, r3, #5
	str	r3, [ip]
	ldr	r1, [r1]
	ldr	r0, .L273+44
	ldr	r3, .L273+48
	str	r2, [r4, #44]
	mov	lr, pc
	bx	r3
	b	.L259
.L274:
	.align	2
.L273:
	.word	ammo
	.word	shadowOAM+384
	.word	238609292
	.word	119304646
	.word	vOff
	.word	screenBlock2
	.word	hOff
	.word	numBullets
	.word	player
	.word	collision
	.word	ammoSound_length
	.word	ammoSound_data
	.word	playSoundB
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
	ldr	r3, .L288
	ldr	r1, .L288+4
	ldr	r2, [r3, #24]
	smull	ip, r0, r1, r2
	push	{r4, r5, r6, lr}
	asr	r1, r2, #31
	rsb	r1, r1, r0, asr #3
	add	r1, r1, r1, lsl #2
	cmp	r2, r1, lsl #2
	sub	sp, sp, #16
	bne	.L276
	ldr	r1, [r3, #36]
	adds	r1, r1, #1
	and	r1, r1, #1
	rsbmi	r1, r1, #0
	str	r1, [r3, #36]
.L276:
	ldr	r1, .L288+8
	ldr	r1, [r1]
	add	r2, r2, #1
	cmp	r1, #0
	str	r2, [r3, #24]
	ldr	ip, [r3]
	ldr	r5, [r3, #20]
	beq	.L277
	rsb	r2, r5, #80
	cmp	r2, ip
	addgt	ip, ip, #1
	strgt	ip, [r3]
.L277:
	ldr	r4, .L288+12
	ldr	r2, [r4]
	cmp	r2, #0
	ldr	lr, [r3, #4]
	bne	.L278
	ldr	r2, .L288+16
	ldr	r2, [r2]
	sub	r2, ip, r2
	and	r2, r2, #255
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, .L288+20
	ldr	r1, [r1]
	ldr	r0, [r3, #36]
	sub	r1, lr, r1
	ldr	r6, .L288+24
	lsl	r1, r1, #23
	lsl	r0, r0, #6
	lsr	r1, r1, #23
	add	r0, r0, #26
	strh	r2, [r6]	@ movhi
	strh	r1, [r6, #2]	@ movhi
	strh	r0, [r6, #4]	@ movhi
.L279:
	ldr	r3, [r3, #16]
	stm	sp, {ip, lr}
	str	r5, [sp, #8]
	str	r3, [sp, #12]
	ldr	r0, .L288+28
	ldr	r5, .L288+32
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
.L278:
	mov	r1, #512
	ldr	r2, .L288+24
	strh	r1, [r2]	@ movhi
	b	.L279
.L289:
	.align	2
.L288:
	.word	key
	.word	1717986919
	.word	keyFall
	.word	hasKey
	.word	vOff
	.word	hOff
	.word	shadowOAM+784
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
	ldr	ip, .L300
	ldr	r1, .L300+4
	ldr	r0, [ip, #24]
	smull	r2, r3, r1, r0
	push	{r4, r5, lr}
	asr	r2, r0, #31
	rsb	r2, r2, r3, asr #2
	add	r2, r2, r2, lsl #2
	cmp	r0, r2, lsl #1
	ldr	r3, [ip, #36]
	sub	sp, sp, #20
	bne	.L291
	add	r2, r3, #1
	smull	r3, r1, r2, r1
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #1
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3
	str	r3, [ip, #36]
.L291:
	ldr	r2, .L300+8
	ldr	r1, .L300+12
	ldr	r5, .L300+16
	ldr	r2, [r2]
	ldr	lr, [ip, #4]
	ldr	r5, [r5]
	ldr	r1, [r1]
	ldr	r4, [ip]
	sub	r2, lr, r2
	add	r0, r0, #1
	sub	r1, r4, r1
	lsl	r2, r2, #23
	cmp	r5, #0
	ldr	r5, .L300+20
	str	r0, [ip, #24]
	lsl	r3, r3, #7
	ldr	r0, .L300+24
	and	r1, r1, #255
	lsr	r2, r2, #23
	add	r3, r3, #16
	orr	r1, r1, r5
	orr	r2, r2, r5
	strh	r3, [r0, #4]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	bne	.L299
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L299:
	add	lr, lr, #5
	add	r5, ip, #16
	ldm	r5, {r5, ip}
	stm	sp, {r4, lr}
	ldr	r0, .L300+28
	ldr	r4, .L300+32
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	ldm	r0, {r0, r1}
	str	r5, [sp, #12]
	str	ip, [sp, #8]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L300+36
	strne	r2, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L301:
	.align	2
.L300:
	.word	door
	.word	1717986919
	.word	hOff
	.word	vOff
	.word	hasKey
	.word	-32768
	.word	shadowOAM+792
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
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, .L339
	ldrh	r2, [r3, #48]
	tst	r2, #64
	mvneq	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	streq	r3, [r0, #88]
	sub	sp, sp, #16
	beq	.L306
	ldrh	r3, [r3, #48]
	tst	r3, #128
	moveq	r3, #1
	movne	r3, #0
	str	r3, [r0, #88]
.L306:
	ldr	r3, [r5, #52]
	cmp	r3, #1
	ldr	r1, [r5, #4]
	ldr	ip, [r5, #16]
	ldr	r2, [r5]
	ldr	r0, [r5, #20]
	beq	.L336
	cmn	r3, #1
	beq	.L337
	ldr	r4, [r5, #8]
	add	lr, r2, r0
	sub	lr, lr, r4
	cmp	lr, #0
	movlt	lr, #0
	subge	r2, r2, r4
	strge	r2, [r5]
	strlt	lr, [r5, #44]
	cmp	r3, #0
	bne	.L320
.L315:
	ldr	r4, .L339+4
	ldr	r7, .L339+8
	ldr	r10, .L339+12
	ldr	r9, .L339+16
	ldr	r8, .L339+20
	add	r6, r4, #1104
	b	.L318
.L316:
	add	r4, r4, #92
	cmp	r6, r4
	beq	.L338
.L318:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L316
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
	bne	.L317
.L335:
	add	r4, r4, #92
	cmp	r6, r4
	ldr	r2, [r5]
	ldr	r1, [r5, #4]
	ldr	r0, [r5, #20]
	ldr	ip, [r5, #16]
	bne	.L318
.L338:
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
	beq	.L302
	mov	r3, #0
	mov	r0, #1
	ldr	r2, .L339+24
	ldr	r1, .L339+28
	str	r3, [r2, #2296]
	str	r3, [r2, #2300]
	str	r3, [r5, #44]
	str	r0, [r1]
.L302:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L317:
	mov	r2, #0
	mov	ip, #30
	str	r2, [r5, #44]
	ldr	r3, [r4, #60]
	sub	r3, r3, #1
	mov	r0, r9
	ldr	r1, [r10]
	str	r3, [r4, #60]
	str	ip, [r4, #76]
	mov	lr, pc
	bx	r8
	b	.L335
.L336:
	ldr	r3, [r5, #12]
	add	r3, r1, r3
	cmp	r3, #1024
	movlt	r1, r3
	strlt	r3, [r5, #4]
	blt	.L320
.L312:
	mov	r3, #0
	str	r3, [r5, #44]
.L320:
	ldr	r3, [r5, #88]
	add	r2, r2, r3
	str	r2, [r5]
	b	.L315
.L337:
	ldr	lr, [r5, #12]
	add	r3, r1, ip
	sub	r3, r3, lr
	cmp	r3, #0
	subge	r1, r1, lr
	strge	r1, [r5, #4]
	bge	.L320
	b	.L312
.L340:
	.align	2
.L339:
	.word	67109120
	.word	enemy
	.word	collision
	.word	enemyHit_length
	.word	enemyHit_data
	.word	playSoundB
	.word	100716544
	.word	keyFall
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
	beq	.L356
	cmn	r2, #1
	beq	.L357
.L346:
	ldr	lr, [r4, #20]
	ldr	ip, [r4]
	ldr	r0, .L359
	str	r1, [sp, #12]
	str	r3, [sp, #4]
	ldr	r5, .L359+4
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	ldm	r0, {r0, r1}
	str	lr, [sp, #8]
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L341
	mov	r3, #0
	ldr	r2, .L359+8
	ldr	r2, [r2]
	cmp	r2, r3
	str	r3, [r4, #44]
	beq	.L358
.L341:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L356:
	ldr	r2, .L359+12
	ldr	r2, [r2]
	ldr	r0, [r0, #12]
	add	r2, r2, #1020
	add	r0, r3, r0
	add	r2, r2, #3
	cmp	r0, r2
	movle	r3, r0
	strle	r0, [r4, #4]
	ble	.L346
.L347:
	mov	r2, #0
	str	r2, [r4, #44]
	b	.L346
.L358:
	mov	lr, #30
	ldr	r0, .L359+16
	ldr	r3, [r0]
	ldr	r1, .L359+20
	ldr	ip, .L359+24
	sub	r3, r3, #1
	str	r3, [r0]
	ldr	r1, [r1]
	ldr	r0, .L359+28
	ldr	r3, .L359+32
	str	lr, [ip]
	mov	lr, pc
	bx	r3
	b	.L341
.L357:
	ldr	r2, .L359+12
	ldr	r0, [r0, #12]
	ldr	ip, [r2]
	add	r2, r3, r1
	sub	r2, r2, r0
	cmp	r2, ip
	subge	r3, r3, r0
	strge	r3, [r4, #4]
	bge	.L346
	b	.L347
.L360:
	.align	2
.L359:
	.word	player
	.word	collision
	.word	shielding
	.word	hOff
	.word	lives
	.word	playerHurt_length
	.word	hitFrames
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
	ldr	r0, .L376
	mov	lr, #1
	mov	r3, #0
	mov	r2, r0
	ldr	ip, .L376+4
	ldr	r1, [ip]
	sub	r1, r1, #1
	str	r1, [ip]
	ldr	ip, .L376+8
	str	lr, [ip, #64]
.L368:
	ldr	r1, [r2, #44]
	cmp	r1, #0
	beq	.L374
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #92
	bne	.L368
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L374:
	ldr	r2, .L376+12
	ldr	r2, [r2]
	cmp	r2, #0
	ldr	lr, [ip]
	ldr	r2, [ip, #4]
	beq	.L363
	mov	r6, #13
	mov	r5, #5
	add	r4, r3, r3, lsl #1
	rsb	r4, r3, r4, lsl #3
	add	ip, r0, r4, lsl #2
	str	r2, [ip, #4]
	ldr	r2, [ip, #16]
	sub	lr, lr, r2
	str	r1, [ip, #52]
	str	lr, [r0, r4, lsl #2]
	str	r6, [ip, #20]
	str	r5, [ip, #16]
	lsl	r2, r3, #1
.L364:
	mov	r1, #1
	add	r2, r2, r3
	rsb	r3, r3, r2, lsl #3
	add	r3, r0, r3, lsl #2
	str	r1, [r3, #44]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L363:
	ldr	r1, [ip, #28]
	cmp	r1, #1
	beq	.L365
	cmp	r1, #2
	beq	.L375
.L366:
	mov	r7, #1
	mov	r6, #5
	mov	r5, #13
	ldr	r1, [ip, #20]
	add	r4, r3, r3, lsl r7
	ldr	ip, [ip, #16]
	rsb	r4, r3, r4, lsl #3
	add	r2, r2, ip
	add	r1, r1, r1, lsr #31
	add	ip, r0, r4, lsl #2
	add	r1, lr, r1, asr r7
	ldr	lr, [ip, #16]
	add	lr, lr, lr, lsr #31
	sub	r2, r2, lr, asr r7
	sub	r1, r1, #3
	str	r2, [ip, #4]
	str	r1, [r0, r4, lsl #2]
	str	r7, [ip, #52]
	str	r6, [ip, #20]
	str	r5, [ip, #16]
	lsl	r2, r3, r7
	b	.L364
.L375:
	ldr	r1, [ip, #32]
	cmp	r1, #1
	bne	.L366
.L365:
	mvn	r6, #0
	mov	r5, #5
	mov	r4, #13
	ldr	r1, [ip, #20]
	add	r7, r3, r3, lsl #1
	add	r1, r1, r1, lsr #31
	rsb	r7, r3, r7, lsl #3
	add	r1, lr, r1, asr #1
	add	ip, r0, r7, lsl #2
	sub	r1, r1, #3
	str	r1, [r0, r7, lsl #2]
	ldr	r1, [ip, #16]
	add	r1, r1, r1, lsr #31
	sub	r2, r2, r1, asr #1
	str	r2, [ip, #4]
	str	r6, [ip, #52]
	str	r5, [ip, #20]
	str	r4, [ip, #16]
	lsl	r2, r3, #1
	b	.L364
.L377:
	.align	2
.L376:
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #512
	mov	fp, #52
	ldr	r3, .L389
	ldr	r1, .L389+4
	ldr	r2, .L389+8
	ldr	r3, [r3]
	ldr	r4, [r1]
	ldr	ip, [r2]
	sub	r3, r3, #24
	add	r4, r4, r3, lsl #8
	ldr	r3, .L389+12
	lsl	r8, r4, #16
	lsl	r7, ip, #16
	ldr	r2, .L389+16
	ldr	r10, .L389+20
	lsr	r8, r8, #16
	lsr	r7, r7, #16
	add	r5, r3, #460
.L382:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	beq	.L379
	ldr	r0, [r3]
	ldr	r1, [r3, #20]
	add	r1, r0, r1
	sub	r1, r1, ip
	cmp	r1, #0
	sub	lr, r0, ip
	blt	.L379
	cmp	lr, #160
	bgt	.L379
	ldr	lr, [r3, #4]
	ldr	r1, [r3, #16]
	add	r1, lr, r1
	sub	r1, r1, r4
	cmp	r1, #0
	sub	r9, lr, r4
	blt	.L379
	cmp	r9, #240
	sub	r0, r0, r7
	sub	lr, lr, r8
	ble	.L388
.L379:
	strh	r6, [r2]	@ movhi
.L381:
	add	r3, r3, #92
	cmp	r5, r3
	add	r2, r2, #8
	bne	.L382
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L388:
	ldr	r1, [r3, #52]
	cmp	r1, #0
	movne	r1, #20	@ movhi
	and	r0, r0, #255
	and	lr, lr, r10
	strh	r0, [r2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strhne	r1, [r2, #4]	@ movhi
	strheq	fp, [r2, #4]	@ movhi
	b	.L381
.L390:
	.align	2
.L389:
	.word	screenBlock2
	.word	hOff
	.word	vOff
	.word	bullets
	.word	shadowOAM+504
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
	ldr	r3, .L403
	ldr	r1, .L403+4
	ldr	r2, [r3]
	ldr	r3, .L403+8
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, [r1]
	ldr	lr, [r3]
	sub	r2, r2, #24
	ldr	r3, .L403+12
	add	r4, r4, r2, lsl #8
	lsl	r10, r4, #16
	lsl	r9, lr, #16
	add	r5, r3, #2752
	mov	r6, #512
	mov	r7, #0
	ldr	r1, .L403+16
	ldr	fp, .L403+20
	lsr	r10, r10, #16
	lsr	r9, r9, #16
	add	r5, r5, #8
	b	.L396
.L402:
	cmp	ip, #160
	bgt	.L392
	ldr	r2, [r3, #4]
	ldr	r8, [r3, #16]
	add	r8, r2, r8
	sub	r8, r8, r4
	cmp	r8, #0
	sub	ip, r2, r4
	blt	.L392
	sub	r0, r0, r9
	sub	r2, r2, r10
	cmp	ip, #240
	and	r0, r0, #255
	and	r2, r2, fp
	bgt	.L392
	ldr	ip, [r3, #44]
	cmp	ip, #0
	strhne	r2, [r1, #2]	@ movhi
	movne	r2, #21	@ movhi
	strhne	r0, [r1]	@ movhi
	strhne	r2, [r1, #4]	@ movhi
	beq	.L394
	add	r3, r3, #92
	cmp	r3, r5
	add	r1, r1, #8
	beq	.L401
.L396:
	ldr	r0, [r3]
	ldr	r2, [r3, #20]
	add	r2, r0, r2
	sub	r2, r2, lr
	cmp	r2, #0
	sub	ip, r0, lr
	bge	.L402
.L392:
	str	r7, [r3, #44]
.L394:
	add	r3, r3, #92
	cmp	r3, r5
	strh	r6, [r1]	@ movhi
	add	r1, r1, #8
	bne	.L396
.L401:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L404:
	.align	2
.L403:
	.word	screenBlock2
	.word	hOff
	.word	vOff
	.word	enemyBullets
	.word	shadowOAM+544
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
	@ args = 92, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	push	{r4, r5, lr}
	ldr	r4, .L418
	mov	ip, #0
	mov	lr, r4
	add	r5, sp, #8
	stmib	r5, {r0, r1, r2, r3}
	ldr	r2, [sp, #56]
.L409:
	ldr	r3, [lr, #44]
	cmp	r3, #0
	bne	.L406
	cmp	r2, #0
	bne	.L417
.L406:
	add	ip, ip, #1
	cmp	ip, #30
	add	lr, lr, #92
	bne	.L409
	pop	{r4, r5, lr}
	add	sp, sp, #16
	bx	lr
.L417:
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
	add	r1, ip, ip, lsl r0
	rsb	ip, ip, r1, lsl #3
	sub	r3, r3, #3
	str	r3, [r4, ip, lsl #2]
	add	ip, r4, ip, lsl #2
	ldr	r3, [sp, #16]
	str	r5, [ip, #20]
	str	lr, [ip, #16]
	pop	{r4, r5, lr}
	str	r3, [ip, #4]
	str	r2, [ip, #52]
	str	r0, [ip, #44]
	add	sp, sp, #16
	bx	lr
.L419:
	.align	2
.L418:
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
	ldr	r2, .L490
	ldr	r4, .L490+4
	ldr	r5, .L490+8
	str	r3, [r2]
	ldr	r8, .L490+12
	ldr	r7, .L490+16
	ldr	r10, .L490+20
	ldr	r9, .L490+24
	sub	sp, sp, #84
.L458:
	ldr	r3, [r8]
	cmp	r3, #0
	ldr	r3, [r4, #44]
	bne	.L421
	cmp	r3, #0
	beq	.L423
	ldr	r3, .L490+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L424
.L429:
	ldr	r3, [r4, #60]
	cmp	r3, #0
	bgt	.L423
	mov	r2, #0
	ldr	r1, .L490+32
	ldr	r3, [r1]
	add	r3, r3, #1
	str	r3, [r1]
	str	r2, [r4, #44]
.L423:
	ldr	r3, [r4, #80]
	cmp	r3, #0
	ble	.L484
.L430:
	ldr	r2, [r4, #84]
	cmp	r3, r2
	blt	.L432
	mov	r3, #1
	mvn	r2, #0
	str	r3, [r4, #64]
	str	r2, [r4, #52]
	str	r3, [r4, #68]
.L431:
	ldr	r3, [r4, #72]
	add	r3, r3, #1
	cmp	r3, #35
	str	r3, [r4, #72]
	movgt	r3, #0
	strgt	r3, [r4, #68]
	ldr	r3, [r4, #64]
	cmp	r3, #0
	ldr	r2, [r7]
	ldr	r3, [r4, #48]
	beq	.L460
	cmp	r2, #0
	beq	.L436
	ldr	r0, [r10]
	ldr	ip, .L490+36
	smull	r1, ip, r0, ip
	asr	r1, r0, #31
	rsb	r1, r1, ip, asr #2
	add	r1, r1, r1, lsl #2
	add	r3, r3, #1
	cmp	r0, r1, lsl #1
	str	r3, [r4, #48]
	bne	.L438
.L437:
	ldr	fp, [r4, #24]
.L443:
	ldr	r3, [r4, #44]
	add	fp, fp, #1
	cmp	r3, #0
	str	fp, [r4, #24]
	beq	.L444
	ldr	r1, .L490+40
	ldr	r0, [r4]
	ldr	r3, [r4, #20]
	ldr	r1, [r1]
	add	r3, r0, r3
	sub	r3, r3, r1
	cmp	r3, #0
	blt	.L444
	sub	r3, r0, r1
	cmp	r3, #160
	bgt	.L444
	ldr	r1, .L490+44
	ldr	ip, .L490+48
	ldr	r1, [r1]
	ldr	fp, [ip]
	ldr	lr, [r4, #4]
	ldr	ip, [r4, #16]
	sub	r1, r1, #24
	add	r1, fp, r1, lsl #8
	add	ip, lr, ip
	sub	ip, ip, r1
	cmp	ip, #0
	blt	.L444
	sub	lr, lr, r1
	cmp	lr, #240
	bgt	.L444
	and	r3, r3, #255
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r4, #76]
	cmp	ip, #0
	strh	r3, [r5, #192]	@ movhi
	ble	.L445
	mov	r3, #67108864
	mov	lr, #4352
	strh	lr, [r3, #76]	@ movhi
	ldrh	r3, [r5, #192]
	sub	ip, ip, #1
	orr	r3, r3, #4096
	str	ip, [r4, #76]
	strh	r3, [r5, #192]	@ movhi
.L445:
	ldr	r3, [r4, #4]
	sub	r1, r3, r1
	lsl	r1, r1, #23
	lsr	r1, r1, #23
	mvn	r1, r1, lsl #17
	mvn	r1, r1, lsr #17
	ldr	ip, [r4, #68]
	cmp	ip, #0
	strh	r1, [r5, #194]	@ movhi
	beq	.L446
	ldr	r1, .L490+52
	ldr	r1, [r1]
	orrs	r2, r2, r1
	bne	.L446
	ldr	r3, [r4, #56]
	cmp	r3, #0
	ldr	r3, [r4, #52]
	bne	.L447
	cmp	r3, #1
	moveq	r3, #392
	movne	r3, #396
	strh	r3, [r5, #196]	@ movhi
	b	.L449
.L446:
	ldr	r2, [r4, #56]
	cmp	r2, #0
	bne	.L451
	ldr	r2, [r4, #52]
	cmp	r2, #1
	ldr	r2, [r4, #36]
	lsl	r2, r2, #7
	addeq	r2, r2, #8
	addne	r2, r2, #12
	strh	r2, [r5, #196]	@ movhi
.L453:
	add	r1, r4, #16
	ldm	r1, {r1, r2}
	ldr	ip, .L490+56
	stm	sp, {r0, r3}
	str	r1, [sp, #12]
	str	r2, [sp, #8]
	ldr	r3, [r9, #16]
	ldr	r2, [r9, #20]
	ldm	r9, {r0, r1}
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L449
	mov	r2, #1
	ldr	r0, .L490+60
	ldr	r1, [r0]
	ldr	r3, .L490
	cmp	r1, #3
	str	r2, [r3]
	beq	.L485
	ldr	fp, .L490+64
	cmp	r1, #2
	ldr	r3, [fp]
	beq	.L486
	cmp	r1, #1
	beq	.L487
.L456:
	add	r3, r3, #1
	str	r3, [fp]
	b	.L449
.L444:
	mov	r3, #512
	strh	r3, [r5, #192]	@ movhi
.L449:
	add	r6, r6, #1
	cmp	r6, #12
	add	r4, r4, #92
	add	r5, r5, #8
	bne	.L458
	add	sp, sp, #84
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L424:
	ldr	r3, [r9, #4]
	add	r0, r9, #16
	ldm	r0, {r0, r1}
	ldr	r2, [r9]
	add	r3, r3, #7
	str	r3, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	ldr	fp, .L490+56
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	bne	.L427
	ldr	r3, [r9, #4]
	add	r0, r9, #16
	ldm	r0, {r0, r1}
	ldr	r2, [r9]
	sub	r3, r3, #7
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
	bne	.L427
.L482:
	ldr	r3, [r4, #44]
.L421:
	cmp	r3, #0
	bne	.L429
.L489:
	ldr	r3, [r4, #80]
	cmp	r3, #0
	bgt	.L430
.L484:
	mov	r3, #1
	str	r3, [r4, #52]
	str	r3, [r4, #64]
	str	r3, [r4, #68]
	b	.L431
.L432:
	mov	r2, #0
	ldr	r3, [r4, #68]
	cmp	r3, r2
	str	r2, [r4, #64]
	bne	.L431
	str	r3, [r4, #72]
	ldr	r2, [r7]
	ldr	r3, [r4, #48]
.L460:
	add	r3, r3, #1
.L435:
	ldr	r0, [r10]
	ldr	ip, .L490+36
	smull	r1, ip, r0, ip
	asr	r1, r0, #31
	rsb	r1, r1, ip, asr #2
	add	r1, r1, r1, lsl #2
	cmp	r0, r1, lsl #1
	str	r3, [r4, #48]
	bne	.L438
	cmp	r2, #0
	bne	.L437
.L440:
	ldr	r3, [r4, #52]
	cmp	r3, #1
	beq	.L488
	cmn	r3, #1
	bne	.L442
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #80]
	sub	r2, r2, #1
	sub	r3, r3, #1
	str	r2, [r4, #4]
	str	r3, [r4, #80]
.L442:
	ldr	fp, [r4, #24]
	rsb	r3, fp, fp, lsl #3
	add	r3, r3, r3, lsl #6
	add	r3, fp, r3, lsl #3
	ldr	r2, .L490+68
	rsb	r3, r3, r3, lsl #15
	add	r3, fp, r3, lsl #3
	add	r3, r3, r2
	cmp	r2, r3, ror #1
	movcc	r2, #0
	bcc	.L443
.L459:
	ldr	r0, [r4, #36]
	ldr	r3, .L490+72
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r2, #0
	str	r1, [r4, #36]
	b	.L443
.L436:
	cmp	r3, #9
	bgt	.L439
	ldr	r0, [r10]
	ldr	ip, .L490+36
	smull	r1, ip, r0, ip
	asr	r1, r0, #31
	rsb	r1, r1, ip, asr #2
	add	r1, r1, r1, lsl #2
	add	r3, r3, #1
	cmp	r0, r1, lsl #1
	str	r3, [r4, #48]
	beq	.L440
.L438:
	ldr	fp, [r4, #24]
	ldr	r1, .L490+76
	smull	r3, r1, fp, r1
	asr	r3, fp, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #3
	sub	r3, fp, r3, lsl #1
	orrs	r3, r3, r2
	bne	.L443
	b	.L459
.L488:
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #80]
	add	r2, r2, #1
	add	r3, r3, #1
	str	r2, [r4, #4]
	str	r3, [r4, #80]
	b	.L442
.L427:
	mov	ip, #30
	ldr	r3, [r4, #60]
	ldr	r2, .L490+80
	sub	r3, r3, #1
	ldr	r1, [r2]
	ldr	r0, .L490+84
	mov	r2, #0
	str	r3, [r4, #60]
	str	ip, [r4, #76]
	ldr	r3, .L490+88
	mov	lr, pc
	bx	r3
	mov	ip, #1
	ldr	r3, [r9, #4]
	add	r0, r9, #16
	ldm	r0, {r0, r1}
	ldr	r2, [r9]
	add	r3, r3, #5
	str	r3, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp]
	ldr	r3, [r4, #16]
	str	ip, [r8]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	ldr	ip, .L490+56
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r3, [r4, #4]
	beq	.L428
	add	r3, r3, #10
	str	r3, [r4, #4]
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L429
	b	.L489
.L439:
	ldr	r3, .L490+4
	add	fp, r6, r6, lsl #1
	rsb	fp, r6, fp, lsl #3
	add	fp, r3, fp, lsl #2
	mov	r2, #76
	ldr	r3, .L490+92
	add	r1, fp, #16
	mov	r0, sp
	mov	lr, pc
	bx	r3
	ldm	fp, {r0, r1, r2, r3}
	bl	fireBulletEnemy
	mov	r3, #1
	ldr	r2, [r7]
	b	.L435
.L451:
	cmp	r2, #1
	bne	.L453
	ldr	r2, [r4, #52]
	cmp	r2, #1
	ldr	r2, [r4, #36]
	lsl	r2, r2, #7
	addeq	r2, r2, #520
	addne	r2, r2, #524
	strh	r2, [r5, #196]	@ movhi
	b	.L453
.L428:
	sub	r3, r3, #10
	str	r3, [r4, #4]
	b	.L482
.L487:
	ldr	r1, .L490+96
	ldr	r2, .L490+100
	mla	r2, r3, r2, r1
	ldr	r1, .L490+104
	cmp	r1, r2, ror #2
	bcc	.L456
	mov	r2, #0
	ldr	r1, .L490+108
	mov	ip, #30
	ldr	r3, .L490+112
	ldr	r1, [r1]
	str	r2, [r0]
	b	.L483
.L486:
	ldr	ip, .L490+96
	ldr	r1, .L490+100
	mla	r1, r3, r1, ip
	ldr	ip, .L490+104
	cmp	ip, r1, ror #2
	bcc	.L456
	str	r2, [r0]
	mov	ip, #30
	mov	r2, #0
	ldr	r1, .L490+108
	ldr	r3, .L490+112
	ldr	r1, [r1]
.L483:
	str	ip, [r3]
	ldr	r0, .L490+116
	ldr	r3, .L490+88
	mov	lr, pc
	bx	r3
	ldr	r3, [fp]
	b	.L456
.L485:
	mov	r2, #2
	mov	ip, #30
	ldr	r3, .L490+112
	ldr	r1, .L490+108
	ldr	fp, .L490+64
	str	r2, [r0]
	str	ip, [r3]
	mov	r2, #0
	ldr	r3, .L490+88
	ldr	r1, [r1]
	ldr	r0, .L490+116
	mov	lr, pc
	bx	r3
	ldr	r3, [fp]
	b	.L456
.L447:
	cmp	r3, #1
	moveq	r3, #904
	movne	r3, #908
	strh	r3, [r5, #196]	@ movhi
	b	.L449
.L491:
	.align	2
.L490:
	.word	ovrEnemyColl
	.word	enemy
	.word	shadowOAM
	.word	successfulStab
	.word	hasIce
	.word	timer
	.word	player
	.word	stabbing
	.word	pts
	.word	1717986919
	.word	vOff
	.word	screenBlock2
	.word	hOff
	.word	hasCheat
	.word	collision
	.word	lives
	.word	collTimer
	.word	238609294
	.word	__aeabi_idivmod
	.word	954437177
	.word	enemyHit_length
	.word	enemyHit_data
	.word	playSoundB
	.word	memcpy
	.word	85899344
	.word	-1030792151
	.word	42949672
	.word	playerHurt_length
	.word	hitFrames
	.word	playerHurt_data
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
	ldr	r2, .L571
	ldr	r4, .L571+4
	ldr	r2, [r2]
	ldr	r3, [r4]
	sub	r2, r3, r2
	and	r2, r2, #255
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r0, .L571+8
	ldr	r1, [r0]
	ldr	r5, .L571+12
	cmp	r1, #0
	strh	r2, [r5]	@ movhi
	sub	sp, sp, #16
	ble	.L493
	mov	r2, #67108864
	mov	ip, #4352
	strh	ip, [r2, #76]	@ movhi
	ldrh	r2, [r5]
	sub	r1, r1, #1
	orr	r2, r2, #4096
	str	r1, [r0]
	strh	r2, [r5]	@ movhi
.L493:
	ldr	r1, .L571+16
	ldr	r2, [r4, #4]
	ldr	r1, [r1]
	sub	r1, r2, r1
	lsl	r1, r1, #23
	lsr	r1, r1, #23
	mvn	r1, r1, lsl #17
	mvn	r1, r1, lsr #17
	ldr	ip, .L571+20
	ldr	r0, [ip]
	cmp	r0, #0
	strh	r1, [r5, #2]	@ movhi
	beq	.L494
	ldr	r1, [r4, #32]
	cmp	r1, #0
	bne	.L567
.L495:
	mov	r1, #384
	strh	r1, [r5, #4]	@ movhi
.L497:
	ldr	r1, .L571+24
	ldr	r1, [r1]
	tst	r1, #1
	bne	.L492
	ldr	r0, .L571+28
	ldr	lr, .L571+32
	ldr	r1, [r0]
	ldr	lr, [lr]
	add	r1, r1, #1
	cmp	r1, lr
	sub	lr, r3, #2
	str	r1, [r0]
	str	lr, [r4]
	beq	.L500
	ldr	r1, .L571+36
	ldr	r1, [r1]
	sub	r3, r3, #3
	add	r2, r1, r2
	ldrb	r1, [r2, r3, lsl #10]	@ zero_extendqisi2
	cmp	r1, #0
	add	r2, r2, r3, lsl #10
	beq	.L500
	ldr	r3, [r4, #16]
	add	r1, r3, r3, lsr #31
	ldrb	r1, [r2, r1, asr #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L500
	add	r2, r2, r3
	ldrb	r3, [r2, #-1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L492
.L500:
	mov	r1, #0
	mov	r2, #1
	ldr	r3, .L571+40
	str	r1, [ip]
	str	r2, [r3]
.L492:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L567:
	ldr	r0, [r4, #28]
	cmp	r0, #0
	beq	.L495
	cmp	r0, #1
	cmpne	r1, #1
	moveq	r1, #388
	strheq	r1, [r5, #4]	@ movhi
	b	.L497
.L494:
	ldr	r1, [r4, #16]
	ldr	r6, .L571+36
	ldr	lr, [r4, #8]
	ldr	ip, [r4, #20]
	str	r0, [sp, #8]
	add	r3, r3, #2
	ldr	r0, [r6]
	stm	sp, {r1, ip}
	str	lr, [sp, #12]
	mov	r1, #1024
	ldr	r6, .L571+44
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L568
	ldr	r2, .L571+40
	ldr	r3, [r2]
	cmp	r3, #0
	ldr	r3, [r4, #32]
	beq	.L503
	cmp	r3, #0
	bne	.L569
.L504:
	mov	r3, #384
	strh	r3, [r5, #4]	@ movhi
.L506:
	ldr	r1, .L571+28
	ldr	r3, [r1]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r1]
	streq	r3, [r2]
	b	.L492
.L568:
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L503:
	ldr	r2, .L571+48
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L570
	ldr	r2, .L571+52
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L510
	cmp	r3, #0
	beq	.L511
	ldr	r2, [r4, #28]
	cmp	r2, #0
	beq	.L511
	cmp	r2, #1
	cmpne	r3, #1
	moveq	r3, #772
	strheq	r3, [r5, #4]	@ movhi
	b	.L492
.L570:
	cmp	r3, #0
	beq	.L508
	ldr	r2, [r4, #28]
	cmp	r2, #0
	beq	.L508
	cmp	r2, #1
	cmpne	r3, #1
	moveq	r3, #516
	strheq	r3, [r5, #4]	@ movhi
	b	.L492
.L569:
	ldr	r1, [r4, #28]
	cmp	r1, #0
	beq	.L504
	cmp	r1, #1
	cmpne	r3, #1
	moveq	r3, #388
	strheq	r3, [r5, #4]	@ movhi
	b	.L506
.L508:
	mov	r3, #512
	strh	r3, [r5, #4]	@ movhi
	b	.L492
.L510:
	ldr	r2, [r4, #64]
	cmp	r2, #0
	beq	.L513
	cmp	r3, #0
	beq	.L514
	ldr	r2, [r4, #28]
	cmp	r2, #0
	beq	.L514
	cmp	r2, #1
	cmpne	r3, #1
	bne	.L492
	ldr	r3, .L571+56
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #900
	movne	r3, #644
	strh	r3, [r5, #4]	@ movhi
	b	.L492
.L511:
	mov	r3, #768
	strh	r3, [r5, #4]	@ movhi
	b	.L492
.L513:
	cmp	r3, #0
	ldr	r2, [r4, #28]
	bne	.L518
	cmp	r2, #0
	bne	.L566
.L519:
	ldr	r3, [r4, #36]
	lsl	r3, r3, #7
	strh	r3, [r5, #4]	@ movhi
	b	.L492
.L514:
	ldr	r3, .L571+56
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #896
	movne	r3, #640
	strh	r3, [r5, #4]	@ movhi
	b	.L492
.L518:
	cmp	r3, #1
	bne	.L520
	cmp	r2, #1
	beq	.L521
	mov	r3, #4
	strh	r3, [r5, #4]	@ movhi
	b	.L492
.L520:
	cmp	r2, #0
	beq	.L519
	cmp	r2, #1
	bne	.L492
.L521:
	ldr	r3, [r4, #36]
	lsl	r3, r3, #7
	add	r3, r3, #4
.L566:
	strh	r3, [r5, #4]	@ movhi
	b	.L492
.L572:
	.align	2
.L571:
	.word	vOff
	.word	player
	.word	hitFrames
	.word	shadowOAM
	.word	playerhOff
	.word	jumped
	.word	timer
	.word	jumpCount
	.word	maxJump
	.word	.LANCHOR0
	.word	fallen
	.word	collisionCheck
	.word	stabbing
	.word	shielding
	.word	67109120
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
	ldr	r3, .L576
	ldr	r3, [r3]
	cmp	r3, #144
	movgt	r2, #96
	movle	r2, #0
	ldr	r3, .L576+4
	str	r2, [r3]
	bx	lr
.L577:
	.align	2
.L576:
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
	ldr	r2, .L594
	ldr	r3, [r2]
	cmp	r3, #6
	beq	.L592
	cmp	r3, #5
	beq	.L593
	cmp	r3, #4
	bxne	lr
	ldr	r3, .L594+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L584
	ldr	r3, .L594+8
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
.L585:
	mov	r3, #5
	str	r3, [r2]
	bx	lr
.L593:
	ldr	r3, .L594+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L583
	ldr	r3, .L594+4
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
.L584:
	mov	r3, #6
	str	r3, [r2]
	bx	lr
.L592:
	ldr	r3, .L594+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L585
	ldr	r3, .L594+12
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
.L583:
	mov	r3, #4
	str	r3, [r2]
	bx	lr
.L595:
	.align	2
.L594:
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
	ldr	r6, .L686
	ldrh	r3, [r6]
	tst	r3, #4
	sub	sp, sp, #20
	beq	.L597
	ldr	r3, .L686+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L678
.L597:
	ldr	r3, .L686+8
	ldr	r3, [r3]
	cmp	r3, #0
	moveq	r2, #100
	ldreq	r3, .L686+12
	streq	r2, [r3]
	ldr	r3, .L686+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L599
	ldr	r2, .L686+20
	ldr	r3, [r2]
	cmp	r3, #9
	ble	.L679
.L599:
	mov	r3, #0
	ldr	r2, .L686+24
	ldr	r5, .L686+28
	str	r3, [r2]
	str	r3, [r5]
.L600:
	ldr	r4, .L686+32
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L601
	ldr	r0, .L686+36
	ldr	r2, [r0]
	add	r2, r2, #1
	rsb	r3, r2, r2, lsl #3
	add	r3, r3, r3, lsl #6
	add	r3, r2, r3, lsl #3
	ldr	r1, .L686+40
	rsb	r3, r3, r3, lsl #15
	add	r3, r2, r3, lsl #3
	add	r1, r3, r1
	ldr	r3, .L686+44
	cmp	r3, r1, ror #2
	str	r2, [r0]
	bcs	.L630
.L602:
	ldr	r7, .L686+48
	ldr	r2, [r7]
	ldr	r3, [r4, #48]
	cmp	r2, #4
	ldrh	r1, [r6]
	addne	r3, r3, #1
	beq	.L680
.L604:
	cmp	r2, #5
	str	r3, [r4, #48]
	beq	.L681
	cmp	r2, #6
	bne	.L676
	tst	r1, #1
	beq	.L612
	ldr	r3, .L686+4
	ldrh	r3, [r3]
	tst	r3, #1
	moveq	r3, #1
	bne	.L612
.L611:
	ldr	r2, [r4, #28]
	ldr	r0, .L686+52
	cmp	r2, #2
	str	r3, [r0]
	movne	r3, #2
	strne	r2, [r4, #32]
	strne	r3, [r4, #28]
	ldr	r2, [r4, #24]
	ldr	r3, .L686+56
	smull	r0, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	subs	r3, r2, r3, lsl #1
	bne	.L614
	add	r0, r4, #36
	ldm	r0, {r0, r2}
	sub	r2, r2, #1
	cmp	r0, r2
	addlt	r0, r0, #1
	strlt	r0, [r4, #36]
	strge	r3, [r4, #36]
.L614:
	tst	r1, #2
	beq	.L616
	ldr	r3, .L686+4
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L616
.L617:
	ldr	r5, .L686+60
	ldr	r3, .L686+64
	ldr	r2, [r5]
	ldr	r6, [r3]
	orrs	r6, r2, r6
	beq	.L682
.L618:
	ldr	r3, .L686+68
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	bne	.L619
	ldr	r2, [r4, #4]
	cmp	r2, #0
	bgt	.L683
.L619:
	ldr	r3, .L686+68
	ldrh	r3, [r3, #48]
	ands	r6, r3, #16
	bne	.L622
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #16]
	ldr	r1, .L686+72
	add	r0, r2, r3
	cmp	r0, r1
	ble	.L684
.L622:
	ldr	r3, .L686+68
	ldrh	r3, [r3, #48]
	lsr	r3, r3, #6
	ldr	r2, .L686+76
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
	bne	.L596
	ldr	r3, .L686+80
	ldr	r0, [r4]
	ldr	r2, [r4, #20]
	ldr	r3, [r3]
	ldr	r1, [r4, #4]
	add	r2, r0, r2
	add	r3, r3, r2, lsl #10
	ldrb	r2, [r3, r1]	@ zero_extendqisi2
	cmp	r2, #0
	add	r3, r3, r1
	beq	.L596
	ldr	r2, [r4, #16]
	add	r1, r2, r2, lsr #31
	ldrb	r1, [r3, r1, asr #1]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L596
	add	r3, r3, r2
	ldrb	r3, [r3, #-1]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r0, r0, #1
	strne	r0, [r4]
.L596:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L601:
	ldr	r2, .L686+36
	str	r3, [r2]
.L630:
	mov	r3, #0
	str	r3, [r4, #64]
	b	.L602
.L681:
	ands	r3, r1, #1
	beq	.L611
	ldr	r3, .L686+4
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L676
	mov	r0, #1
	ldr	r2, .L686+20
	str	r0, [r5]
	str	r3, [r2]
	b	.L611
.L679:
	mov	r1, #1
	ldr	r5, .L686+28
	add	r3, r3, r1
	str	r3, [r2]
	str	r1, [r5]
	b	.L600
.L678:
	ldr	r3, .L686+84
	ldr	r3, [r3]
	cmp	r3, #1
	ble	.L597
	bl	switchWeapons
	b	.L597
.L612:
	ldr	r3, .L686+68
	ldrh	r3, [r3, #48]
	and	r3, r3, #1
	rsb	r3, r3, #1
	b	.L611
.L616:
	ldr	r3, .L686+68
	ldrh	r3, [r3, #48]
	tst	r3, #2
	beq	.L617
	ldr	r5, .L686+60
	b	.L618
.L680:
	tst	r1, #1
	beq	.L677
	ldr	r2, .L686+4
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L677
	cmp	r3, #9
	bgt	.L608
.L677:
	add	r3, r3, #1
	str	r3, [r4, #48]
.L676:
	mov	r3, #0
	b	.L611
.L683:
	ldr	r1, [r4, #12]
	add	ip, r4, #16
	rsb	r1, r1, #0
	ldm	ip, {ip, lr}
	ldr	r0, .L686+80
	str	r3, [sp, #12]
	str	r1, [sp, #8]
	ldr	r3, [r4]
	ldr	r0, [r0]
	mov	r1, #1024
	stm	sp, {ip, lr}
	ldr	r6, .L686+88
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L619
	mov	r2, #1
	ldr	r3, .L686+92
	ldr	r0, [r4, #12]
	ldr	r1, [r3]
	ldr	r3, [r4, #4]
	cmp	r1, #24
	sub	r3, r3, r0
	str	r3, [r4, #4]
	str	r2, [r4, #28]
	bgt	.L620
	ldr	r1, .L686+96
	ldr	ip, [r1]
	cmp	ip, #0
	ble	.L622
	ldr	lr, .L686+100
	ldr	r2, [lr]
	sub	r3, r3, r2
	cmp	r3, #120
	bgt	.L629
.L628:
	sub	ip, ip, #1
	sub	r2, r2, r0
	str	ip, [r1]
	str	r2, [lr]
	b	.L622
.L684:
	ldr	r1, [r4, #20]
	str	r3, [sp]
	ldr	ip, [r4, #12]
	str	r6, [sp, #12]
	ldr	r0, .L686+80
	ldr	r3, [r4]
	ldr	r0, [r0]
	ldr	r7, .L686+88
	stmib	sp, {r1, ip}
	mov	r1, #1024
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L622
	ldr	r3, .L686+92
	ldr	r0, [r4, #12]
	ldr	ip, [r3]
	ldr	r3, [r4, #4]
	ldr	r1, .L686+96
	add	r3, r0, r3
	cmp	ip, #26
	str	r6, [r4, #28]
	str	r3, [r4, #4]
	ldr	r2, [r1]
	ble	.L624
	cmp	r2, #31
	bgt	.L622
.L625:
	ldr	r6, .L686+100
	ldr	lr, [r6]
	sub	r3, r3, lr
	cmp	r3, #119
	ble	.L622
	cmp	ip, #26
	cmpeq	lr, #272
	addne	r2, r2, #1
	addne	r0, r0, lr
	strne	r2, [r1]
	strne	r0, [r6]
	b	.L622
.L682:
	ldr	r3, .L686+104
	mov	r2, r6
	ldr	r1, [r3]
	ldr	r0, .L686+108
	ldr	r3, .L686+112
	mov	lr, pc
	bx	r3
	mov	r1, #1
	mvn	r2, #0
	ldr	r3, .L686+116
	str	r1, [r5]
	str	r2, [r4, #8]
	str	r6, [r3]
	b	.L618
.L620:
	ldr	lr, .L686+100
	ldr	r2, [lr]
	sub	r3, r3, r2
	cmp	r3, #120
	ble	.L685
.L629:
	cmp	r3, #632
	bgt	.L622
	ldr	r1, .L686+96
	ldr	r3, [r1]
	sub	r2, r2, r0
	sub	r3, r3, #1
	str	r2, [lr]
	str	r3, [r1]
	b	.L622
.L608:
	ldr	r2, .L686+120
	ldr	r2, [r2]
	cmp	r2, #0
	ble	.L677
	bl	fireBullet
	mov	r3, #1
	ldr	r2, [r7]
	ldrh	r1, [r6]
	b	.L604
.L624:
	cmp	r2, #784
	bgt	.L622
	b	.L625
.L685:
	ldr	r1, .L686+96
	ldr	ip, [r1]
	b	.L628
.L687:
	.align	2
.L686:
	.word	oldButtons
	.word	buttons
	.word	ovrEnemyColl
	.word	collTimer
	.word	hasKnife
	.word	stabbingFrames
	.word	successfulStab
	.word	stabbing
	.word	player
	.word	shotFrames
	.word	238609292
	.word	119304646
	.word	currWeapon
	.word	shielding
	.word	715827883
	.word	jumped
	.word	fallen
	.word	67109120
	.word	1018
	.word	shootUp
	.word	.LANCHOR0
	.word	numWeapons
	.word	collisionCheck
	.word	screenBlock2
	.word	hOff
	.word	playerhOff
	.word	jumpSound_length
	.word	jumpSound_data
	.word	playSoundB
	.word	jumpCount
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
	ldr	r1, .L701
	ldr	r2, .L701+4
	ldr	r3, [r1]
	cmp	r3, #0
	ldr	r3, [r2]
	addne	r3, r3, #1
	push	{r4, r5, r6, lr}
	strne	r3, [r2]
	ldr	r2, .L701+8
	cmp	r3, r2
	ble	.L690
	ldr	r3, .L701+12
	ldr	r3, [r3]
	cmp	r3, #0
	streq	r3, [r1]
.L690:
	ldr	r1, .L701+16
	ldr	r0, .L701+20
	ldr	r2, [r1, #16]
	ldr	r3, [r0]
	rsb	r2, r2, #512
	cmp	r2, r3
	sublt	r3, r3, #512
	strlt	r3, [r0]
	blt	.L692
	cmp	r3, #0
	addlt	r3, r3, #512
	strlt	r3, [r0]
.L692:
	ldr	r3, [r1]
	cmp	r3, #144
	movgt	r2, #96
	movle	r2, #0
	ldr	r3, .L701+24
	str	r2, [r3]
	bl	updatePlayer
	bl	updateEnemy
	bl	updateCoins
	bl	updateAmmo
	bl	updateKey
	bl	updateDoor
	ldr	r0, .L701+28
	bl	updateBullet
	ldr	r0, .L701+32
	bl	updateBullet
	ldr	r0, .L701+36
	bl	updateBullet
	ldr	r0, .L701+40
	bl	updateBullet
	ldr	r0, .L701+44
	bl	updateBullet
	ldr	r4, .L701+48
	add	r5, r4, #2752
	add	r5, r5, #8
.L694:
	mov	r0, r4
	add	r4, r4, #92
	bl	updateBulletEnemy
	cmp	r4, r5
	bne	.L694
	bl	drawBullets
	bl	drawBulletsEnemy
	bl	updateWeapon
	ldr	r0, .L701+52
	ldr	lr, .L701+56
	ldr	r1, [r0]
	ldr	ip, [lr]
	add	r1, r1, #1
	str	r1, [r0]
	ldr	r4, .L701+60
	add	ip, ip, #1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L701+64
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L702:
	.align	2
.L701:
	.word	hasIce
	.word	iceFrames
	.word	1499
	.word	hasCheat
	.word	player
	.word	playerhOff
	.word	vOff
	.word	bullets
	.word	bullets+92
	.word	bullets+184
	.word	bullets+276
	.word	bullets+368
	.word	enemyBullets
	.word	timer
	.word	timer2
	.word	DMANow
	.word	shadowOAM
	.size	updateGame, .-updateGame
	.align	2
	.global	pHoff
	.syntax unified
	.arm
	.fpu softvfp
	.type	pHoff, %function
pHoff:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L704
	ldr	r2, .L704+4
	ldr	r3, [r3]
	ldr	r0, [r2]
	sub	r3, r3, #24
	add	r0, r0, r3, lsl #8
	bx	lr
.L705:
	.align	2
.L704:
	.word	screenBlock2
	.word	hOff
	.size	pHoff, .-pHoff
	.align	2
	.global	onScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	onScreen, %function
onScreen:
	@ Function supports interworking.
	@ args = 92, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
	sub	ip, sp, #4
	stmib	ip, {r0, r1, r2, r3}
	ldr	r1, .L712
	ldr	r2, [sp]
	ldr	r3, [sp, #20]
	ldr	r1, [r1]
	add	r3, r2, r3
	sub	r3, r3, r1
	cmp	r3, #0
	blt	.L710
	sub	r2, r2, r1
	cmp	r2, #160
	bgt	.L710
	ldr	r2, .L712+4
	ldr	r3, .L712+8
	ldr	r1, [r2]
	ldr	r0, [sp, #4]
	ldr	r2, [r3]
	ldr	r3, [sp, #16]
	sub	r1, r1, #24
	add	r2, r2, r1, lsl #8
	add	r3, r0, r3
	sub	r3, r3, r2
	cmp	r3, #0
	blt	.L710
	sub	r0, r0, r2
	cmp	r0, #240
	movgt	r0, #0
	movle	r0, #1
	add	sp, sp, #16
	bx	lr
.L710:
	mov	r0, #0
	add	sp, sp, #16
	bx	lr
.L713:
	.align	2
.L712:
	.word	vOff
	.word	screenBlock2
	.word	hOff
	.size	onScreen, .-onScreen
	.global	collisionMap
	.comm	timerCurFrame,4,4
	.comm	timerAniCounter,4,4
	.comm	iceFrames,4,4
	.comm	keyFall,4,4
	.comm	hasKey,4,4
	.comm	screenBlock2,4,4
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
	.comm	hitFrames,4,4
	.comm	maxJump,4,4
	.comm	vOff,4,4
	.comm	hOff2,4,4
	.comm	hOff,4,4
	.comm	collTimer,4,4
	.comm	shootUp,4,4
	.comm	hasShield,4,4
	.comm	hasKnife,4,4
	.comm	shotFrames,4,4
	.comm	hasGun,4,4
	.comm	pts,4,4
	.comm	lives,4,4
	.comm	jumpCount,4,4
	.comm	hasIce,4,4
	.comm	fallen,4,4
	.comm	hasCheat,4,4
	.comm	won,4,4
	.comm	jumped,4,4
	.comm	timer2,4,4
	.comm	timer,4,4
	.comm	shadowOAM,1024,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	enemyBullets,2760,4
	.comm	bullets,460,4
	.comm	weapon,276,4
	.comm	ammo,1380,4
	.comm	coin,1104,4
	.comm	enemy,1104,4
	.comm	door,92,4
	.comm	key,92,4
	.comm	player,92,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	collisionMap, %object
	.size	collisionMap, 4
collisionMap:
	.word	collisionMapBitmap
	.ident	"GCC: (devkitARM release 53) 9.1.0"
