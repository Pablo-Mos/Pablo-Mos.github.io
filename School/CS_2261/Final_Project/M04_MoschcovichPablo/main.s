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
	moveq	r2, #89
	strheq	r2, [r3, #76]	@ movhi
	bx	lr
.L7:
	mov	r2, #88
	strh	r2, [r3, #76]	@ movhi
	bx	lr
.L6:
	mov	r2, #87
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
	mov	r2, #3
	ldr	r3, .L12+20
	ldr	r1, .L12+24
	ldrh	lr, [r3, #48]
	ldr	r3, .L12+28
	str	r4, [r1]
	strh	lr, [r3]	@ movhi
	ldr	ip, .L12+32
	ldr	r0, .L12+36
	ldr	r1, .L12+40
	ldr	r3, .L12+44
	str	r4, [ip]
	str	r4, [r0]
	str	r4, [r1]
	str	r2, [r3]
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
	.word	won
	.word	lives
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
	ldr	r3, .L16
	mov	r2, #1
	ldr	r1, [r3]
	push	{r4, lr}
	ldr	r0, .L16+4
	ldr	r3, .L16+8
	mov	lr, pc
	bx	r3
	mov	r0, #28
	mov	r2, #0
	ldr	r1, .L16+12
	ldr	r3, .L16+16
	str	r0, [r1]
	ldrh	r0, [r3, #48]
	ldr	r1, .L16+20
	ldr	r3, .L16+24
	pop	{r4, lr}
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L17:
	.align	2
.L16:
	.word	startSong_length
	.word	startSong_data
	.word	playSoundA
	.word	screenBlock
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause.part.0, %function
pause.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	goToStart
	ldr	r3, .L20
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+4
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L20+8
	ldr	r3, .L20+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	stopSound
	.word	startSong_length
	.word	startSong_data
	.word	playSoundA
	.size	pause.part.0, .-pause.part.0
	.set	win.part.0,pause.part.0
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
	ldr	r4, .L24
	strh	r3, [r1]	@ movhi
	mov	r0, #3
	ldr	r1, .L24+4
	mov	lr, pc
	bx	r4
	mov	r3, #3664
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L24+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L24+12
	mov	r0, #3
	ldr	r1, .L24+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L24+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L24+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L24+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
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
	ldr	r3, .L33
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L26
	ldr	r3, .L33+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L32
.L26:
	pop	{r4, lr}
	bx	lr
.L32:
	pop	{r4, lr}
	b	goToStart
.L34:
	.align	2
.L33:
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
	mov	r2, #195
	mov	r0, #67108864
	mov	r1, #23552
	mov	ip, #4352
	ldr	r3, .L37
	push	{r4, lr}
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	ldr	r3, .L37+4
	strh	r1, [r0, #8]	@ movhi
	ldrh	r2, [r3]
	ldrh	r1, [r3, #4]
	ldr	r4, .L37+8
	strh	r2, [r0, #18]	@ movhi
	mov	r3, #256
	strh	r1, [r0, #16]	@ movhi
	mov	r2, #83886080
	strh	ip, [r0]	@ movhi
	ldr	r1, .L37+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #4080
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L37+16
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L37+20
	ldr	r1, .L37+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L37+28
	ldr	r1, .L37+32
	mov	lr, pc
	bx	r4
	ldr	r2, .L37+36
	mov	r0, #3
	ldr	r1, .L37+40
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L37+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L37+48
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L37+52
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L38:
	.align	2
.L37:
	.word	67109120
	.word	.LANCHOR0
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
	push	{r4, r5, r6, lr}
	ldr	r2, .L51
	ldr	r5, .L51+4
	ldr	r0, [r2]
	ldrh	r3, [r5]
	add	r0, r0, #1
	tst	r3, #8
	str	r0, [r2]
	beq	.L40
	ldr	r2, .L51+8
	ldrh	r2, [r2]
	ands	r4, r2, #8
	beq	.L49
.L40:
	tst	r3, #4
	beq	.L39
	ldr	r3, .L51+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L50
.L39:
	pop	{r4, r5, r6, lr}
	bx	lr
.L50:
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L49:
	ldr	r3, .L51+12
	mov	lr, pc
	bx	r3
	mov	r2, #28
	ldr	r3, .L51+16
	str	r2, [r3]
	bl	goToGame
	ldr	r3, .L51+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L51+24
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L51+28
	ldr	r3, .L51+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L51+36
	mov	lr, pc
	bx	r3
	mov	r2, #195
	ldr	r3, .L51+40
	ldr	r0, .L51+44
	ldr	r1, .L51+48
	strh	r4, [r3, #2]	@ movhi
	strh	r4, [r3, #6]	@ movhi
	str	r4, [r0]
	str	r4, [r1]
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	ldrh	r3, [r5]
	b	.L40
.L52:
	.align	2
.L51:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	screenBlock
	.word	stopSound
	.word	gameSong_length
	.word	gameSong_data
	.word	playSoundA
	.word	initGame
	.word	67109120
	.word	time_m
	.word	time_s
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
	mov	ip, #7168
	mov	r2, #0
	mov	r0, #67108864
	mov	r3, #256
	ldr	r1, .L55
	push	{r4, lr}
	strh	r2, [r1, #2]	@ movhi
	ldr	r4, .L55+4
	strh	r2, [r1, #6]	@ movhi
	strh	r2, [r0, #18]	@ movhi
	ldr	r1, .L55+8
	strh	r2, [r0, #16]	@ movhi
	strh	ip, [r0, #8]	@ movhi
	mov	r2, #83886080
	strh	r3, [r0]	@ movhi
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L55+12
	ldr	r1, .L55+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L55+20
	ldr	r1, .L55+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L55+28
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L55+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L55+36
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L55+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L56:
	.align	2
.L55:
	.word	67109120
	.word	DMANow
	.word	pausePal
	.word	8688
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
	ldr	r4, .L69
	ldr	r3, .L69+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L58
	ldr	r2, .L69+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L67
.L58:
	tst	r3, #4
	beq	.L57
	ldr	r3, .L69+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L68
.L57:
	pop	{r4, lr}
	bx	lr
.L68:
	pop	{r4, lr}
	b	pause.part.0
.L67:
	bl	goToGame
	ldr	r3, .L69+12
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L58
.L70:
	.align	2
.L69:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	unpauseSound
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
	ldr	r4, .L73
	strh	r2, [r0, #16]	@ movhi
	strh	r1, [r0, #8]	@ movhi
	mov	r2, #83886080
	strh	r3, [r0]	@ movhi
	ldr	r1, .L73+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1008
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L73+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L73+12
	ldr	r1, .L73+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L73+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L73+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L73+28
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L73+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L74:
	.align	2
.L73:
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
	ldr	r3, .L82
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L82+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L75
	ldr	r3, .L82+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L81
.L75:
	pop	{r4, lr}
	bx	lr
.L81:
	pop	{r4, lr}
	b	win.part.0
.L83:
	.align	2
.L82:
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
	ldr	r4, .L86
	strh	r2, [r0, #16]	@ movhi
	strh	r1, [r0, #8]	@ movhi
	mov	r2, #83886080
	strh	r3, [r0]	@ movhi
	ldr	r1, .L86+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #832
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L86+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L86+12
	ldr	r1, .L86+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L86+20
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L86+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L86+28
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L86+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L87:
	.align	2
.L86:
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
	ldr	r3, .L90
	ldr	r3, [r3]
	ldr	r2, .L90+4
	ldr	r0, .L90+8
	ldr	r1, .L90+12
	lsl	r3, r3, #7
	add	r3, r3, #148
	strh	r3, [r2, #12]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	bx	lr
.L91:
	.align	2
.L90:
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
	mov	r0, #724
	mov	r1, #212
	ldr	r3, .L96
	ldr	r2, .L96+4
	ldr	r3, [r3]
	push	{r4, lr}
	ldr	ip, .L96+8
	ldr	lr, .L96+12
	strh	r0, [r2, #20]	@ movhi
	ldr	r0, .L96+16
	cmp	r3, #9
	strh	lr, [r2, #16]	@ movhi
	strh	ip, [r2, #18]	@ movhi
	strh	r1, [r2, #26]	@ movhi
	strh	r0, [r2, #24]	@ movhi
	bgt	.L93
	lsl	r3, r3, #6
	add	r3, r3, #28
	strh	r3, [r2, #28]	@ movhi
	pop	{r4, lr}
	bx	lr
.L93:
	mov	lr, #220
	ldr	r1, .L96+20
	smull	r4, ip, r1, r3
	asr	r1, r3, #31
	rsb	r1, r1, ip, asr #2
	add	ip, r1, r1, lsl #2
	sub	r3, r3, ip, lsl #1
	lsl	r3, r3, #6
	lsl	r1, r1, #6
	add	r3, r3, #28
	add	r1, r1, #28
	strh	lr, [r2, #34]	@ movhi
	strh	r0, [r2, #32]	@ movhi
	strh	r3, [r2, #36]	@ movhi
	strh	r1, [r2, #28]	@ movhi
	pop	{r4, lr}
	bx	lr
.L97:
	.align	2
.L96:
	.word	pts
	.word	shadowOAM
	.word	-16214
	.word	16386
	.word	-32751
	.word	1717986919
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
	mov	r0, #660
	mov	r1, #48
	ldr	r3, .L102
	ldr	r2, [r3]
	ldr	r3, .L102+4
	push	{r4, lr}
	ldr	ip, .L102+8
	ldr	lr, .L102+12
	strh	r0, [r3, #44]	@ movhi
	ldr	r0, .L102+16
	cmp	r2, #9
	strh	lr, [r3, #40]	@ movhi
	strh	ip, [r3, #42]	@ movhi
	strh	r1, [r3, #50]	@ movhi
	strh	r0, [r3, #48]	@ movhi
	bgt	.L99
	mov	r1, #512
	lsl	r2, r2, #6
	add	r2, r2, #28
	strh	r2, [r3, #52]	@ movhi
	strh	r1, [r3, #56]	@ movhi
	pop	{r4, lr}
	bx	lr
.L99:
	mov	lr, #56
	ldr	r1, .L102+20
	smull	r4, ip, r1, r2
	asr	r1, r2, #31
	rsb	r1, r1, ip, asr #2
	add	ip, r1, r1, lsl #2
	sub	r2, r2, ip, lsl #1
	lsl	r2, r2, #6
	lsl	r1, r1, #6
	add	r2, r2, #28
	add	r1, r1, #28
	strh	lr, [r3, #58]	@ movhi
	strh	r0, [r3, #56]	@ movhi
	strh	r2, [r3, #60]	@ movhi
	strh	r1, [r3, #52]	@ movhi
	pop	{r4, lr}
	bx	lr
.L103:
	.align	2
.L102:
	.word	numBullets
	.word	shadowOAM
	.word	-16376
	.word	16388
	.word	-32764
	.word	1717986919
	.size	showAmmo, .-showAmmo
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
	ldr	r3, .L106
	ldr	ip, [r3]
	ldr	r1, .L106+4
	ldr	r3, .L106+8
	ldr	r2, .L106+12
	cmp	ip, #0
	strh	r0, [r3, #68]	@ movhi
	strh	r1, [r3, #64]	@ movhi
	strh	r2, [r3, #66]	@ movhi
	bxle	lr
	b	showWeapons.part.0
.L107:
	.align	2
.L106:
	.word	numWeapons
	.word	16402
	.word	shadowOAM
	.word	-16377
	.size	showWeapons, .-showWeapons
	.align	2
	.global	showTime
	.syntax unified
	.arm
	.fpu softvfp
	.type	showTime, %function
showTime:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	lr, #28
	mov	r8, #145
	mov	r7, #90
	mov	r6, #16
	mov	r5, #24
	mov	r4, #668
	mov	ip, #36
	ldr	r3, .L110
	ldr	r0, .L110+4
	ldr	r2, [r3]
	smull	r3, r9, r0, r2
	ldr	r3, .L110+8
	ldr	r1, [r3]
	smull	r3, r0, r1, r0
	asr	r3, r2, #31
	rsb	r3, r3, r9, asr #2
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, lsl #1
	lsl	r2, r3, #6
	ldr	r3, .L110+12
	add	r2, r2, lr
	strh	r2, [r3, #92]	@ movhi
	asr	r2, r1, #31
	rsb	r0, r2, r0, asr #2
	add	r2, r0, r0, lsl #2
	sub	r1, r1, r2, lsl #1
	strh	r8, [r3, #80]	@ movhi
	ldr	r2, .L110+16
	ldr	r8, .L110+20
	lsl	r0, r0, #6
	lsl	r1, r1, #6
	add	r0, r0, lr
	add	r1, r1, lr
	strh	r7, [r3, #84]	@ movhi
	strh	r8, [r3, #82]	@ movhi
	strh	r6, [r3, #90]	@ movhi
	strh	r5, [r3, #98]	@ movhi
	strh	r4, [r3, #100]	@ movhi
	strh	lr, [r3, #106]	@ movhi
	strh	r0, [r3, #108]	@ movhi
	strh	r1, [r3, #116]	@ movhi
	strh	ip, [r3, #114]	@ movhi
	strh	r2, [r3, #88]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	strh	r2, [r3, #104]	@ movhi
	strh	r2, [r3, #112]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L111:
	.align	2
.L110:
	.word	time_m
	.word	1717986919
	.word	time_s
	.word	shadowOAM
	.word	-32623
	.word	16388
	.size	showTime, .-showTime
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
	ldr	r2, .L130
	ldr	r3, [r2, #4]
	cmp	r3, #256
	push	{r4, r5, r6, lr}
	ble	.L113
	ldr	ip, .L130+4
	ldr	r1, [ip]
	cmp	r1, #29
	ble	.L127
.L114:
	mov	r1, #67108864
	ldrh	r2, [r2]
	ldr	r5, .L130+8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r2, [r1, #18]	@ movhi
	strh	r3, [r1, #16]	@ movhi
	ldr	r3, [r5]
	ldr	r4, .L130+12
	ldr	r1, .L130+16
	ldr	r2, .L130+20
	lsl	r3, r3, #7
	add	r3, r3, #148
	strh	r1, [r4, #8]	@ movhi
	strh	r2, [r4, #10]	@ movhi
	strh	r3, [r4, #12]	@ movhi
	bl	showTime
	ldr	r3, .L130+24
	mov	lr, pc
	bx	r3
	bl	showScore
	bl	showAmmo
	mov	r3, #916
	ldr	r2, .L130+28
	ldr	r0, [r2]
	ldr	r1, .L130+32
	ldr	r2, .L130+36
	cmp	r0, #0
	strh	r1, [r4, #64]	@ movhi
	strh	r2, [r4, #66]	@ movhi
	strh	r3, [r4, #68]	@ movhi
	blgt	showWeapons.part.0
.L115:
	ldr	r3, .L130+40
	mov	lr, pc
	bx	r3
	ldr	r4, .L130+44
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L130+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L130+48
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L116
	ldr	r3, .L130+52
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L128
.L116:
	ldr	r3, .L130+56
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L129
.L117:
	ldr	r3, [r5]
	cmp	r3, #0
	ble	.L118
	ldr	r3, .L130+60
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L112
.L118:
	pop	{r4, r5, r6, lr}
	b	goToLose
.L113:
	cmp	r3, #0
	bge	.L114
	ldr	ip, .L130+4
	ldr	r1, [ip]
	cmp	r1, #28
	ble	.L114
	mov	lr, #67108864
	sub	r1, r1, #1
	lsl	r0, r1, #24
	orr	r0, r0, #1073741824
	lsr	r0, r0, #16
	add	r3, r3, #256
	str	r1, [ip]
	str	r3, [r2, #4]
	strh	r0, [lr, #8]	@ movhi
	b	.L114
.L112:
	pop	{r4, r5, r6, lr}
	bx	lr
.L127:
	mov	lr, #67108864
	add	r1, r1, #1
	lsl	r0, r1, #24
	orr	r0, r0, #1073741824
	lsr	r0, r0, #16
	sub	r3, r3, #256
	str	r1, [ip]
	str	r3, [r2, #4]
	strh	r0, [lr, #8]	@ movhi
	b	.L114
.L129:
	bl	goToWin
	b	.L117
.L128:
	bl	goToPause
	ldr	r3, .L130+64
	mov	lr, pc
	bx	r3
	b	.L116
.L131:
	.align	2
.L130:
	.word	.LANCHOR0
	.word	screenBlock
	.word	lives
	.word	shadowOAM
	.word	16386
	.word	-16214
	.word	updateGame
	.word	numWeapons
	.word	16402
	.word	-16377
	.word	waitForVBlank
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.word	won
	.word	time_m
	.word	pauseSound
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L144
	mov	lr, pc
	bx	r3
	ldr	r3, .L144+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L144+8
	mov	lr, pc
	bx	r3
	ldr	r6, .L144+12
	ldr	r8, .L144+16
	ldr	r5, .L144+20
	ldr	fp, .L144+24
	ldr	r10, .L144+28
	ldr	r9, .L144+32
	ldr	r7, .L144+36
	ldr	r4, .L144+40
.L133:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L134:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L134
.L136:
	.word	.L140
	.word	.L139
	.word	.L138
	.word	.L137
	.word	.L135
	.word	.L135
.L135:
	mov	lr, pc
	bx	r7
	b	.L133
.L137:
	ldr	r3, .L144+44
	mov	lr, pc
	bx	r3
	b	.L133
.L138:
	mov	lr, pc
	bx	r9
	b	.L133
.L139:
	mov	lr, pc
	bx	r10
	b	.L133
.L140:
	mov	lr, pc
	bx	fp
	b	.L133
.L145:
	.align	2
.L144:
	.word	setupSounds
	.word	setupInterrupts
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	win
	.word	67109120
	.word	pause
	.size	main, .-main
	.comm	shadowOAM,1024,4
	.global	vOff
	.global	hOff
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	time_s,4,4
	.comm	time_m,4,4
	.comm	screenBlock,4,4
	.comm	numBullets,4,4
	.comm	numWeapons,4,4
	.comm	currWeapon,4,4
	.comm	pts,4,4
	.comm	lives,4,4
	.comm	won,4,4
	.comm	seed,4,4
	.comm	state,4,4
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
	.ident	"GCC: (devkitARM release 53) 9.1.0"
