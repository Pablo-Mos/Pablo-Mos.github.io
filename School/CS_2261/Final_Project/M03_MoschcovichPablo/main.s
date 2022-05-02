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
	.type	showWeapons.part.0, %function
showWeapons.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #17
	mov	r1, #56
	ldr	r3, .L8
	ldr	r2, [r3]
	ldr	r3, .L8+4
	cmp	r2, #5
	strh	r0, [r3, #72]	@ movhi
	strh	r1, [r3, #74]	@ movhi
	beq	.L6
	cmp	r2, #4
	beq	.L7
	cmp	r2, #3
	moveq	r2, #14
	strheq	r2, [r3, #76]	@ movhi
	bx	lr
.L7:
	mov	r2, #13
	strh	r2, [r3, #76]	@ movhi
	bx	lr
.L6:
	mov	r2, #12
	strh	r2, [r3, #76]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	currWeapon
	.word	shadowOAM
	.size	showWeapons.part.0, .-showWeapons.part.0
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #67108864
	mov	r4, #0
	mov	r3, #256
	mov	r1, #7168
	strh	r4, [r0, #18]	@ movhi
	ldr	r5, .L12
	strh	r4, [r0, #16]	@ movhi
	mov	r2, #83886080
	strh	r1, [r0, #8]	@ movhi
	strh	r3, [r0]	@ movhi
	ldr	r1, .L12+4
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1376
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+8
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L12+12
	ldr	r1, .L12+16
	mov	lr, pc
	bx	r5
	ldr	r3, .L12+20
	ldr	ip, .L12+24
	ldrh	r0, [r3, #48]
	ldr	r1, .L12+28
	ldr	r2, .L12+32
	ldr	r3, .L12+36
	str	r4, [ip]
	str	r4, [r2]
	str	r4, [r3]
	strh	r0, [r1]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	bgPal
	.word	bgTiles
	.word	100720640
	.word	bgMap
	.word	67109120
	.word	state
	.word	buttons
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
	ldr	r3, .L15
	ldr	r1, .L15+4
	ldrh	r0, [r3, #48]
	ldr	r3, .L15+8
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L16:
	.align	2
.L15:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #256
	mov	r1, #67108864
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r4, .L19
	strh	r3, [r1]	@ movhi
	mov	r0, #3
	ldr	r1, .L19+4
	mov	lr, pc
	bx	r4
	mov	r3, #3344
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L19+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L19+12
	mov	r0, #3
	ldr	r1, .L19+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L19+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L19+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L20:
	.align	2
.L19:
	.word	DMANow
	.word	instructionsPal
	.word	instructionsTiles
	.word	100720640
	.word	instructionsMap
	.word	hideSprites
	.word	waitForVBlank
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L28
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L21
	ldr	r3, .L28+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L27
.L21:
	pop	{r4, lr}
	bx	lr
.L27:
	pop	{r4, lr}
	b	goToStart
.L29:
	.align	2
.L28:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	instructions, .-instructions
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
	mov	r1, #67108864
	mov	r3, #23552
	push	{r4, r5, r6, lr}
	mov	ip, #4352
	mov	r4, #3
	strh	r3, [r1, #8]	@ movhi
	ldr	r3, .L32
	ldr	r2, .L32+4
	ldrh	r0, [r3]
	ldrh	r3, [r3, #4]
	ldr	r5, .L32+8
	strh	r0, [r1, #18]	@ movhi
	strh	r3, [r1, #16]	@ movhi
	mov	r0, r4
	str	r4, [r2]
	mov	r3, #256
	strh	ip, [r1]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L32+12
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #544
	mov	r2, #100663296
	ldr	r1, .L32+16
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #2048
	ldr	r2, .L32+20
	ldr	r1, .L32+24
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #256
	ldr	r2, .L32+28
	ldr	r1, .L32+32
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r2, .L32+36
	ldr	r1, .L32+40
	mov	r3, #16384
	mov	lr, pc
	bx	r5
	ldr	r3, .L32+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+48
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L32+52
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L33:
	.align	2
.L32:
	.word	.LANCHOR0
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
	push	{r4, lr}
	ldr	r2, .L46
	ldr	r4, .L46+4
	ldr	r0, [r2]
	ldrh	r3, [r4]
	add	r0, r0, #1
	tst	r3, #8
	str	r0, [r2]
	beq	.L35
	ldr	r2, .L46+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L44
.L35:
	tst	r3, #4
	beq	.L34
	ldr	r3, .L46+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L45
.L34:
	pop	{r4, lr}
	bx	lr
.L45:
	pop	{r4, lr}
	b	goToInstructions
.L44:
	ldr	r3, .L46+12
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L46+16
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L35
.L47:
	.align	2
.L46:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
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
	mov	r0, #67108864
	mov	r2, #0
	mov	r3, #256
	mov	r1, #7168
	push	{r4, lr}
	strh	r2, [r0, #18]	@ movhi
	ldr	r4, .L50
	strh	r2, [r0, #16]	@ movhi
	strh	r1, [r0, #8]	@ movhi
	mov	r2, #83886080
	strh	r3, [r0]	@ movhi
	ldr	r1, .L50+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #816
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
	mov	r2, #3
	ldr	r3, .L50+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L51:
	.align	2
.L50:
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
	ldr	r4, .L64
	ldr	r3, .L64+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L53
	ldr	r2, .L64+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L62
.L53:
	tst	r3, #4
	beq	.L52
	ldr	r3, .L64+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L63
.L52:
	pop	{r4, lr}
	bx	lr
.L63:
	pop	{r4, lr}
	b	goToStart
.L62:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L53
.L65:
	.align	2
.L64:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
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
	mov	r0, #67108864
	mov	r2, #0
	mov	r3, #256
	mov	r1, #7168
	push	{r4, lr}
	strh	r2, [r0, #18]	@ movhi
	ldr	r4, .L68
	strh	r2, [r0, #16]	@ movhi
	strh	r1, [r0, #8]	@ movhi
	mov	r2, #83886080
	strh	r3, [r0]	@ movhi
	ldr	r1, .L68+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1008
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L68+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L68+12
	ldr	r1, .L68+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L68+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L68+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L68+28
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L68+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L69:
	.align	2
.L68:
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
	ldr	r3, .L77
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L70
	ldr	r3, .L77+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L76
.L70:
	pop	{r4, lr}
	bx	lr
.L76:
	pop	{r4, lr}
	b	goToStart
.L78:
	.align	2
.L77:
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
	mov	r0, #67108864
	mov	r2, #0
	mov	r3, #256
	mov	r1, #7168
	push	{r4, lr}
	strh	r2, [r0, #18]	@ movhi
	ldr	r4, .L81
	strh	r2, [r0, #16]	@ movhi
	strh	r1, [r0, #8]	@ movhi
	mov	r2, #83886080
	strh	r3, [r0]	@ movhi
	ldr	r1, .L81+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #832
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L81+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L81+12
	ldr	r1, .L81+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L81+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L81+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L81+28
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L81+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L82:
	.align	2
.L81:
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
	ldr	r3, .L85
	ldr	r3, [r3]
	ldr	r2, .L85+4
	ldr	r0, .L85+8
	ldr	r1, .L85+12
	lsl	r3, r3, #7
	add	r3, r3, #148
	strh	r3, [r2, #12]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	bx	lr
.L86:
	.align	2
.L85:
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
	mov	r0, #17
	ldr	r3, .L91
	ldr	r2, .L91+4
	ldr	r3, [r3]
	str	lr, [sp, #-4]!
	ldr	ip, .L91+8
	ldr	lr, .L91+12
	strh	r1, [r2, #20]	@ movhi
	cmp	r3, #9
	add	r1, r1, #15872
	strh	lr, [r2, #16]	@ movhi
	strh	ip, [r2, #18]	@ movhi
	strh	r1, [r2, #26]	@ movhi
	strh	r0, [r2, #24]	@ movhi
	bgt	.L88
	lsl	r3, r3, #6
	add	r3, r3, #28
	strh	r3, [r2, #28]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L88:
	ldr	r1, .L91+16
	smull	lr, ip, r1, r3
	asr	r1, r3, #31
	rsb	r1, r1, ip, asr #2
	add	ip, r1, r1, lsl #2
	sub	r3, r3, ip, lsl #1
	lsl	r3, r3, #6
	ldr	ip, .L91+20
	lsl	r1, r1, #6
	add	r3, r3, #28
	add	r1, r1, #28
	strh	r0, [r2, #32]	@ movhi
	strh	r3, [r2, #36]	@ movhi
	strh	r1, [r2, #28]	@ movhi
	strh	ip, [r2, #34]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L92:
	.align	2
.L91:
	.word	pts
	.word	shadowOAM
	.word	-16214
	.word	16386
	.word	1717986919
	.word	16604
	.size	showScore, .-showScore
	.align	2
	.global	showAmmo
	.syntax unified
	.arm
	.fpu softvfp
	.type	showAmmo, %function
showAmmo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #660
	mov	r0, #4
	ldr	r3, .L97
	ldr	r2, [r3]
	ldr	r3, .L97+4
	str	lr, [sp, #-4]!
	ldr	ip, .L97+8
	ldr	lr, .L97+12
	strh	r1, [r3, #44]	@ movhi
	ldr	r1, .L97+16
	cmp	r2, #9
	strh	lr, [r3, #40]	@ movhi
	strh	ip, [r3, #42]	@ movhi
	strh	r1, [r3, #50]	@ movhi
	strh	r0, [r3, #48]	@ movhi
	bgt	.L94
	mov	r1, #512
	lsl	r2, r2, #6
	add	r2, r2, #28
	strh	r2, [r3, #52]	@ movhi
	strh	r1, [r3, #56]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L94:
	ldr	r1, .L97+20
	smull	lr, ip, r1, r2
	asr	r1, r2, #31
	rsb	r1, r1, ip, asr #2
	add	ip, r1, r1, lsl #2
	sub	r2, r2, ip, lsl #1
	lsl	r2, r2, #6
	ldr	ip, .L97+24
	lsl	r1, r1, #6
	add	r2, r2, #28
	add	r1, r1, #28
	strh	r0, [r3, #56]	@ movhi
	strh	r2, [r3, #60]	@ movhi
	strh	r1, [r3, #52]	@ movhi
	strh	ip, [r3, #58]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L98:
	.align	2
.L97:
	.word	numBullets
	.word	shadowOAM
	.word	-16376
	.word	16388
	.word	16432
	.word	1717986919
	.word	16440
	.size	showAmmo, .-showAmmo
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
	mov	r3, #67108864
	ldr	r2, .L111
	push	{r4, r5, r6, lr}
	ldrh	r1, [r2]
	ldr	r5, .L111+4
	ldrh	r2, [r2, #4]
	strh	r1, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	ldr	r3, [r5]
	ldr	r4, .L111+8
	ldr	r1, .L111+12
	ldr	r0, .L111+16
	lsl	r3, r3, #7
	add	r3, r3, #148
	ldr	r2, .L111+20
	strh	r3, [r4, #12]	@ movhi
	strh	r1, [r4, #10]	@ movhi
	strh	r0, [r4, #8]	@ movhi
	mov	lr, pc
	bx	r2
	bl	showScore
	bl	showAmmo
	mov	r3, #916
	ldr	r2, .L111+24
	ldr	r0, [r2]
	ldr	r1, .L111+28
	ldr	r2, .L111+32
	cmp	r0, #0
	strh	r1, [r4, #64]	@ movhi
	strh	r2, [r4, #66]	@ movhi
	strh	r3, [r4, #68]	@ movhi
	blgt	showWeapons.part.0
.L100:
	ldr	r3, .L111+36
	mov	lr, pc
	bx	r3
	ldr	r4, .L111+40
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L111+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L111+44
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L101
	ldr	r3, .L111+48
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L108
.L101:
	ldr	r3, .L111+52
	ldr	r3, [r3]
	cmp	r3, #9
	bgt	.L109
	ldr	r3, [r5]
	cmp	r3, #0
	ble	.L110
.L99:
	pop	{r4, r5, r6, lr}
	bx	lr
.L109:
	bl	goToWin
	ldr	r3, [r5]
	cmp	r3, #0
	bgt	.L99
.L110:
	pop	{r4, r5, r6, lr}
	b	goToLose
.L108:
	bl	goToPause
	b	.L101
.L112:
	.align	2
.L111:
	.word	.LANCHOR0
	.word	lives
	.word	shadowOAM
	.word	-16214
	.word	16386
	.word	updateGame
	.word	numWeapons
	.word	16402
	.word	-16377
	.word	waitForVBlank
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.word	pts
	.size	game, .-game
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
	ldr	r4, .L125
	ldr	r8, .L125+4
	ldrh	r0, [r4, #48]
	ldr	r5, .L125+8
	ldr	r3, .L125+12
	strh	r0, [r8]	@ movhi
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L125+16
	ldr	fp, .L125+20
	ldr	r10, .L125+24
	ldr	r9, .L125+28
	ldr	r7, .L125+32
.L114:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L115:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L115
.L117:
	.word	.L121
	.word	.L120
	.word	.L119
	.word	.L118
	.word	.L116
	.word	.L116
.L116:
	mov	lr, pc
	bx	r7
	b	.L114
.L118:
	ldr	r3, .L125+36
	mov	lr, pc
	bx	r3
	b	.L114
.L119:
	mov	lr, pc
	bx	r9
	b	.L114
.L120:
	mov	lr, pc
	bx	r10
	b	.L114
.L121:
	mov	lr, pc
	bx	fp
	b	.L114
.L126:
	.align	2
.L125:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	goToStart
	.word	state
	.word	start
	.word	instructions
	.word	game
	.word	win
	.word	pause
	.size	main, .-main
	.text
	.align	2
	.global	showWeapons
	.syntax unified
	.arm
	.fpu softvfp
	.type	showWeapons, %function
showWeapons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #916
	ldr	r3, .L129
	ldr	ip, [r3]
	ldr	r1, .L129+4
	ldr	r3, .L129+8
	ldr	r2, .L129+12
	cmp	ip, #0
	strh	r0, [r3, #68]	@ movhi
	strh	r1, [r3, #64]	@ movhi
	strh	r2, [r3, #66]	@ movhi
	bxle	lr
	b	showWeapons.part.0
.L130:
	.align	2
.L129:
	.word	numWeapons
	.word	16402
	.word	shadowOAM
	.word	-16377
	.size	showWeapons, .-showWeapons
	.comm	shadowOAM,1024,4
	.global	vOff
	.global	hOff
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	numBullets,4,4
	.comm	numWeapons,4,4
	.comm	currWeapon,4,4
	.comm	pts,4,4
	.comm	lives,4,4
	.global	won
	.comm	seed,4,4
	.comm	state,4,4
	.comm	enemyBullets,2400,4
	.comm	bullets,400,4
	.comm	weapon,240,4
	.comm	ammo,400,4
	.comm	coin,240,4
	.comm	enemy,240,4
	.comm	player,80,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	won, %object
	.size	won, 4
won:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
