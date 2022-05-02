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
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #256
	mov	r1, #7168
	push	{r4, lr}
	mov	r0, #3
	strh	r1, [r2, #8]	@ movhi
	ldr	r4, .L4
	strh	r3, [r2]	@ movhi
	ldr	r1, .L4+4
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r3, #1360
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L4+20
	ldr	ip, .L4+24
	ldrh	lr, [r2, #48]
	ldr	r0, .L4+28
	ldr	r1, .L4+32
	ldr	r2, .L4+36
	strh	lr, [ip]	@ movhi
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	bgPal
	.word	bgTiles
	.word	100720640
	.word	bgMap
	.word	67109120
	.word	buttons
	.word	state
	.word	seed
	.word	pts
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L7
	ldr	r1, .L7+4
	ldrh	r0, [r3, #48]
	ldr	r3, .L7+8
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #67108864
	mov	r4, #3
	mov	r1, #4352
	ldr	r3, .L11
	ldr	r5, .L11+4
	str	r4, [r3]
	mov	r0, r4
	strh	r1, [r2]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L11+8
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #416
	mov	r2, #100663296
	ldr	r1, .L11+12
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L11+16
	ldr	r1, .L11+20
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #256
	ldr	r2, .L11+24
	ldr	r1, .L11+28
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r2, .L11+32
	ldr	r1, .L11+36
	mov	r3, #16384
	mov	lr, pc
	bx	r5
	ldr	r3, .L11+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L11+44
	mov	lr, pc
	bx	r3
	mov	r3, #1
	ldr	r1, .L11+48
	ldr	r2, .L11+52
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	lives
	.word	DMANow
	.word	gameScreenPal
	.word	gameScreenTiles
	.word	100720640
	.word	gameScreenMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	waitForVBlank
	.word	state
	.word	lvl
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L22
	ldr	r2, .L22+4
	ldr	r0, [r3]
	ldrh	r2, [r2]
	add	r0, r0, #1
	tst	r2, #8
	str	r0, [r3]
	bxeq	lr
	ldr	r3, .L22+8
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L22+12
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L22+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame2, %function
goToGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L26
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L26+4
	mov	lr, pc
	bx	r4
	mov	r3, #560
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L26+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L26+12
	ldr	r1, .L26+16
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L26+20
	ldr	r1, .L26+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L26+28
	mov	r0, #3
	ldr	r1, .L26+32
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L26+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L26+40
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L26+44
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L27:
	.align	2
.L26:
	.word	DMANow
	.word	gameScreen2Pal
	.word	gameScreen2Tiles
	.word	100720640
	.word	gameScreen2Map
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	waitForVBlank
	.word	state
	.size	goToGame2, .-goToGame2
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #256
	mov	r1, #67108864
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r4, .L30
	strh	r3, [r1]	@ movhi
	mov	r0, #3
	ldr	r1, .L30+4
	mov	lr, pc
	bx	r4
	mov	r3, #816
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L30+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L30+12
	ldr	r1, .L30+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L30+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L30+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L30+28
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L30+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L31:
	.align	2
.L30:
	.word	DMANow
	.word	pausePal
	.word	pauseTiles
	.word	100720640
	.word	pauseMap
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L46
	ldr	r3, .L46+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L33
	ldr	r2, .L46+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L43
.L33:
	tst	r3, #4
	beq	.L32
	ldr	r3, .L46+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L44
.L32:
	pop	{r4, lr}
	bx	lr
.L43:
	ldr	r3, .L46+12
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L45
	bl	goToGame2
	ldrh	r3, [r4]
	b	.L33
.L44:
	pop	{r4, lr}
	b	goToStart
.L45:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L33
.L47:
	.align	2
.L46:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	lvl
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #256
	mov	r1, #67108864
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r4, .L50
	strh	r3, [r1]	@ movhi
	mov	r0, #3
	ldr	r1, .L50+4
	mov	lr, pc
	bx	r4
	mov	r3, #1008
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L50+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L50+12
	ldr	r1, .L50+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L50+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L50+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L50+28
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L50+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L51:
	.align	2
.L50:
	.word	DMANow
	.word	winPal
	.word	winTiles
	.word	100720640
	.word	winMap
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L59
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L52
	ldr	r3, .L59+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L58
.L52:
	pop	{r4, lr}
	bx	lr
.L58:
	pop	{r4, lr}
	b	goToStart
.L60:
	.align	2
.L59:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #256
	mov	r1, #67108864
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r4, .L63
	strh	r3, [r1]	@ movhi
	mov	r0, #3
	ldr	r1, .L63+4
	mov	lr, pc
	bx	r4
	mov	r3, #832
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L63+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L63+12
	ldr	r1, .L63+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L63+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L63+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L63+28
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L63+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L64:
	.align	2
.L63:
	.word	DMANow
	.word	losePal
	.word	loseTiles
	.word	100720640
	.word	loseMap
	.word	hideSprites
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.align	2
	.global	showLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	showLives, %function
showLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L67
	ldr	r3, [r3]
	ldr	r2, .L67+4
	ldr	r0, .L67+8
	ldr	r1, .L67+12
	lsl	r3, r3, #7
	add	r3, r3, #148
	strh	r3, [r2, #124]	@ movhi
	strh	r0, [r2, #120]	@ movhi
	strh	r1, [r2, #122]	@ movhi
	bx	lr
.L68:
	.align	2
.L67:
	.word	lives
	.word	shadowOAM
	.word	16386
	.word	-16214
	.size	showLives, .-showLives
	.align	2
	.global	showScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	showScore, %function
showScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #724
	mov	r0, #18
	ldr	r3, .L73
	ldr	r2, .L73+4
	ldr	r3, [r3]
	str	lr, [sp, #-4]!
	ldr	ip, .L73+8
	ldr	lr, .L73+12
	strh	r1, [r2, #132]	@ movhi
	ldr	r1, .L73+16
	cmp	r3, #9
	strh	lr, [r2, #128]	@ movhi
	strh	ip, [r2, #130]	@ movhi
	strh	r1, [r2, #138]	@ movhi
	strh	r0, [r2, #136]	@ movhi
	bgt	.L70
	lsl	r3, r3, #6
	add	r3, r3, #28
	strh	r3, [r2, #140]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L70:
	ldr	r1, .L73+20
	smull	lr, ip, r1, r3
	asr	r1, r3, #31
	rsb	r1, r1, ip, asr #2
	add	ip, r1, r1, lsl #2
	sub	r3, r3, ip, lsl #1
	lsl	r3, r3, #6
	ldr	ip, .L73+24
	lsl	r1, r1, #6
	add	r3, r3, #28
	add	r1, r1, #28
	strh	r0, [r2, #144]	@ movhi
	strh	r3, [r2, #148]	@ movhi
	strh	r1, [r2, #140]	@ movhi
	strh	ip, [r2, #146]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L74:
	.align	2
.L73:
	.word	pts
	.word	shadowOAM
	.word	-16214
	.word	16386
	.word	16592
	.word	1717986919
	.word	16599
	.size	showScore, .-showScore
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L89
	ldr	r3, [r5]
	ldr	r4, .L89+4
	ldr	r1, .L89+8
	ldr	r0, .L89+12
	lsl	r3, r3, #7
	add	r3, r3, #148
	strh	r1, [r4, #122]	@ movhi
	ldr	r2, .L89+16
	strh	r3, [r4, #124]	@ movhi
	strh	r0, [r4, #120]	@ movhi
	mov	lr, pc
	bx	r2
	bl	showScore
	ldr	r3, .L89+20
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r4, .L89+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L89+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L76
	ldr	r3, .L89+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L86
.L76:
	ldr	r3, .L89+36
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L87
.L77:
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L88
	pop	{r4, r5, r6, lr}
	bx	lr
.L88:
	pop	{r4, r5, r6, lr}
	b	goToLose
.L87:
	ldr	r3, .L89+40
	mov	lr, pc
	bx	r3
	bl	goToGame2
	b	.L77
.L86:
	bl	goToPause
	b	.L76
.L90:
	.align	2
.L89:
	.word	lives
	.word	shadowOAM
	.word	-16214
	.word	16386
	.word	updateGame
	.word	waitForVBlank
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.word	initGame
	.size	game, .-game
	.align	2
	.global	game2
	.syntax unified
	.arm
	.fpu softvfp
	.type	game2, %function
game2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L105
	ldr	r3, [r5]
	ldr	r4, .L105+4
	ldr	r1, .L105+8
	ldr	r0, .L105+12
	lsl	r3, r3, #7
	add	r3, r3, #148
	strh	r1, [r4, #122]	@ movhi
	ldr	r2, .L105+16
	strh	r3, [r4, #124]	@ movhi
	strh	r0, [r4, #120]	@ movhi
	mov	lr, pc
	bx	r2
	bl	showScore
	ldr	r3, .L105+20
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r4, .L105+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L105+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L92
	ldr	r3, .L105+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L102
.L92:
	ldr	r3, .L105+36
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L103
.L93:
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L104
	pop	{r4, r5, r6, lr}
	bx	lr
.L104:
	pop	{r4, r5, r6, lr}
	b	goToLose
.L103:
	bl	goToWin
	b	.L93
.L102:
	bl	goToPause
	b	.L92
.L106:
	.align	2
.L105:
	.word	lives
	.word	shadowOAM
	.word	-16214
	.word	16386
	.word	updateGame
	.word	waitForVBlank
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.size	game2, .-game2
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
	mov	r2, #0
	push	{r4, r7, fp, lr}
	ldr	r4, .L119
	ldr	r8, .L119+4
	ldrh	r0, [r4, #48]
	ldr	r5, .L119+8
	ldr	r3, .L119+12
	strh	r0, [r8]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L119+16
	ldr	fp, .L119+20
	ldr	r10, .L119+24
	ldr	r9, .L119+28
	ldr	r7, .L119+32
.L108:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L109:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L109
.L111:
	.word	.L115
	.word	.L114
	.word	.L113
	.word	.L112
	.word	.L110
	.word	.L110
.L110:
	mov	lr, pc
	bx	r7
	b	.L108
.L112:
	ldr	r3, .L119+36
	mov	lr, pc
	bx	r3
	b	.L108
.L113:
	mov	lr, pc
	bx	r9
	b	.L108
.L114:
	mov	lr, pc
	bx	r10
	b	.L108
.L115:
	mov	lr, pc
	bx	fp
	b	.L108
.L120:
	.align	2
.L119:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	goToStart
	.word	state
	.word	start
	.word	game
	.word	game2
	.word	win
	.word	pause
	.size	main, .-main
	.comm	shadowOAM,1024,4
	.global	vOff
	.global	hOff
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	pts,4,4
	.comm	lives,4,4
	.comm	lvl,4,4
	.global	won2
	.global	won
	.comm	seed,4,4
	.comm	state,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	won, %object
	.size	won, 4
won:
	.space	4
	.type	won2, %object
	.size	won2, 4
won2:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
