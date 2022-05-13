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
	mov	r3, #8064
	mov	r1, #512
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2, #10]	@ movhi
	ldr	r4, .L4
	strh	r1, [r2]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #7488
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
	mov	r1, #3
	ldr	r2, .L4+20
	ldr	ip, .L4+24
	ldrh	lr, [r2, #48]
	ldr	r0, .L4+28
	ldr	r2, .L4+32
	strh	lr, [ip]	@ movhi
	str	r3, [r0]
	ldr	lr, .L4+36
	str	r3, [r2]
	ldr	ip, .L4+40
	ldr	r0, .L4+44
	ldr	r2, .L4+48
	str	r3, [lr]
	str	r3, [ip]
	str	r3, [r0]
	str	r1, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startScreenPal
	.word	startScreenTiles
	.word	100726784
	.word	startScreenMap
	.word	67109120
	.word	buttons
	.word	state
	.word	seed
	.word	pts
	.word	won
	.word	hasCheat
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
	ldr	r3, .L8
	mov	r2, #1
	ldr	r1, [r3]
	push	{r4, lr}
	ldr	r0, .L8+4
	ldr	r3, .L8+8
	mov	lr, pc
	bx	r3
	mov	r1, #24
	mov	ip, #28
	mov	r2, #0
	ldr	r3, .L8+12
	ldr	r0, .L8+16
	str	r1, [r3]
	ldr	r3, .L8+20
	str	ip, [r0]
	ldr	r1, .L8+24
	ldrh	r0, [r3, #48]
	ldr	r3, .L8+28
	pop	{r4, lr}
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L9:
	.align	2
.L8:
	.word	startSong_length
	.word	startSong_data
	.word	playSoundA
	.word	screenBlock2
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
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+4
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L12+8
	ldr	r3, .L12+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+16
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L12+20
	ldr	r3, .L12+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	stopSound
	.word	clickSound_length
	.word	clickSound_data
	.word	playSoundB
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
	mov	r2, #67108864
	mov	r1, #512
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L16
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L16+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L16+8
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	ldr	r2, .L16+16
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L16+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L16+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L16+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	DMANow
	.word	instructionsScreenPal
	.word	13536
	.word	instructionsScreenTiles
	.word	100726784
	.word	instructionsScreenMap
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
	ldr	r3, .L25
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L18
	ldr	r3, .L25+8
	ldrh	r2, [r3]
	ands	r4, r2, #4
	beq	.L24
.L18:
	pop	{r4, lr}
	bx	lr
.L24:
	bl	goToStart
	ldr	r3, .L25+12
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L25+16
	ldr	r3, .L25+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	clickSound_length
	.word	clickSound_data
	.word	playSoundB
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
	mov	ip, #5376
	ldr	r3, .L29
	ldr	r1, .L29+4
	push	{r4, lr}
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	ldr	r3, [r1]
	lsl	r3, r3, #24
	orr	r3, r3, #1073741824
	lsr	r3, r3, #16
	strh	r3, [r0, #12]	@ movhi
	ldr	r3, .L29+8
	ldr	r2, .L29+12
	ldr	r3, [r3]
	ldr	r1, [r2, #8]
	lsl	r3, r3, #24
	orr	r3, r3, #1073741824
	orr	r3, r3, #262144
	add	r1, r1, r1, lsr #31
	lsr	r3, r3, #16
	asr	r1, r1, #1
	ldrh	lr, [r2]
	strh	r3, [r0, #8]	@ movhi
	lsl	r1, r1, #16
	ldrh	r3, [r2, #4]
	lsr	r1, r1, #16
	strh	lr, [r0, #18]	@ movhi
	ldr	r4, .L29+16
	strh	r3, [r0, #16]	@ movhi
	mov	r2, #83886080
	strh	lr, [r0, #26]	@ movhi
	mov	r3, #256
	strh	r1, [r0, #24]	@ movhi
	strh	ip, [r0]	@ movhi
	ldr	r1, .L29+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #4048
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L29+24
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L29+28
	ldr	r1, .L29+32
	mov	lr, pc
	bx	r4
	mov	r3, #128
	mov	r0, #3
	ldr	r2, .L29+36
	ldr	r1, .L29+40
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L29+44
	ldr	r1, .L29+48
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L29+52
	ldr	r1, .L29+56
	mov	lr, pc
	bx	r4
	ldr	r2, .L29+60
	mov	r0, #3
	ldr	r1, .L29+64
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L29+68
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+72
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L29+76
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L30:
	.align	2
.L29:
	.word	67109120
	.word	screenBlock
	.word	screenBlock2
	.word	.LANCHOR0
	.word	DMANow
	.word	gameScreenPal
	.word	gameScreenTiles
	.word	100720640
	.word	gameScreenMap
	.word	100679680
	.word	gameScreen2Tiles
	.word	100712448
	.word	gameScreen2Map
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
	ldr	r2, .L47
	ldr	r5, .L47+4
	ldr	r0, [r2]
	ldrh	r3, [r5]
	add	r0, r0, #1
	tst	r3, #8
	str	r0, [r2]
	beq	.L32
	ldr	r2, .L47+8
	ldrh	r2, [r2]
	ands	r4, r2, #8
	beq	.L45
.L32:
	tst	r3, #4
	beq	.L33
	ldr	r2, .L47+8
	ldrh	r2, [r2]
	ands	r2, r2, #4
	beq	.L46
.L33:
	tst	r3, #64
	beq	.L31
	ldr	r3, .L47+8
	ldrh	r3, [r3]
	tst	r3, #64
	moveq	r2, #1
	ldreq	r3, .L47+12
	streq	r2, [r3]
.L31:
	pop	{r4, r5, r6, lr}
	bx	lr
.L46:
	ldr	r3, .L47+16
	ldr	r0, .L47+20
	ldr	r1, [r3]
	ldr	r3, .L47+24
	mov	lr, pc
	bx	r3
	bl	goToInstructions
	ldrh	r3, [r5]
	b	.L33
.L45:
	ldr	r3, .L47+28
	mov	lr, pc
	bx	r3
	mov	r0, #28
	mov	r2, #24
	ldr	r1, .L47+32
	ldr	r3, .L47+36
	str	r0, [r1]
	str	r2, [r3]
	bl	goToGame
	ldr	r3, .L47+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+16
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L47+20
	ldr	r3, .L47+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+44
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L47+48
	ldr	r3, .L47+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+56
	mov	lr, pc
	bx	r3
	mov	r2, #195
	mov	ip, #3
	ldr	r3, .L47+60
	ldr	r0, .L47+64
	ldr	r1, .L47+68
	strh	r4, [r3, #10]	@ movhi
	strh	r4, [r3, #14]	@ movhi
	str	ip, [r0]
	str	r4, [r1]
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	ldrh	r3, [r5]
	b	.L32
.L48:
	.align	2
.L47:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	hasCheat
	.word	clickSound_length
	.word	clickSound_data
	.word	playSoundB
	.word	srand
	.word	screenBlock
	.word	screenBlock2
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
	push	{r4, r5, r6, lr}
	mov	ip, #8064
	mov	r1, #0
	mov	r0, #67108864
	mov	r5, #512
	ldr	r2, .L51
	ldr	r4, .L51+4
	strh	r1, [r2, #2]	@ movhi
	mov	r3, #256
	strh	r1, [r2, #6]	@ movhi
	strh	ip, [r0, #10]	@ movhi
	mov	r2, #83886080
	strh	r5, [r0]	@ movhi
	ldr	r1, .L51+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L51+12
	ldr	r1, .L51+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L51+20
	ldr	r1, .L51+24
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L51+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L51+32
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L51+36
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L52:
	.align	2
.L51:
	.word	67109120
	.word	DMANow
	.word	pauseScreenPal
	.word	6304
	.word	pauseScreenTiles
	.word	100726784
	.word	pauseScreenMap
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L65
	ldr	r3, .L65+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L54
	ldr	r2, .L65+8
	ldrh	r2, [r2]
	ands	r5, r2, #8
	beq	.L63
.L54:
	tst	r3, #4
	beq	.L53
	ldr	r3, .L65+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L64
.L53:
	pop	{r4, r5, r6, lr}
	bx	lr
.L64:
	pop	{r4, r5, r6, lr}
	b	pause.part.0
.L63:
	bl	goToGame
	ldr	r3, .L65+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+16
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L65+20
	ldr	r3, .L65+24
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L54
.L66:
	.align	2
.L65:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	unpauseSound
	.word	clickSound_length
	.word	clickSound_data
	.word	playSoundB
	.size	pause, .-pause
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
	ldr	r3, .L74
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L67
	ldr	r3, .L74+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L73
.L67:
	pop	{r4, lr}
	bx	lr
.L73:
	pop	{r4, lr}
	b	win.part.0
.L75:
	.align	2
.L74:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
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
	ldr	r3, .L78
	ldr	r3, [r3]
	ldr	r2, .L78+4
	ldr	r0, .L78+8
	ldr	r1, .L78+12
	lsl	r3, r3, #5
	add	r3, r3, #148
	strh	r3, [r2, #12]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	bx	lr
.L79:
	.align	2
.L78:
	.word	lives
	.word	shadowOAM
	.word	16389
	.word	16589
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
	push	{r4, r5, r6, r7, lr}
	mov	ip, #179
	mov	r6, #3
	mov	r5, #154
	mov	r4, #175
	mov	lr, #668
	mov	r0, #187
	ldr	r2, .L82
	ldr	r3, .L82+4
	ldr	r2, [r2]
	smull	r7, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r1, r3, r3, lsl #2
	sub	r1, r2, r1, lsl #1
	lsl	r2, r3, #6
	ldr	r3, .L82+8
	add	r2, r2, #28
	strh	r2, [r3, #36]	@ movhi
	lsl	r1, r1, #6
	ldr	r2, .L82+12
	add	r1, r1, #28
	strh	r1, [r3, #44]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r1, .L82+16
	ldr	r2, .L82+20
	strh	r6, [r3, #16]	@ movhi
	strh	r5, [r3, #20]	@ movhi
	strh	r4, [r3, #26]	@ movhi
	strh	lr, [r3, #28]	@ movhi
	strh	r1, [r3, #24]	@ movhi
	strh	ip, [r3, #34]	@ movhi
	strh	r0, [r3, #42]	@ movhi
	strh	r2, [r3, #32]	@ movhi
	strh	r2, [r3, #40]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L83:
	.align	2
.L82:
	.word	pts
	.word	1717986919
	.word	shadowOAM
	.word	16547
	.word	-32763
	.word	-32764
	.size	showScore, .-showScore
	.align	2
	.global	showScoreEnd
	.syntax unified
	.arm
	.fpu softvfp
	.type	showScoreEnd, %function
showScoreEnd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r6, #78
	mov	r5, #154
	mov	r4, #146
	mov	lr, #668
	mov	ip, #150
	mov	r0, #158
	ldr	r3, .L86
	ldr	r2, .L86+4
	ldr	r3, [r3]
	smull	r7, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #2
	add	r1, r2, r2, lsl #2
	sub	r1, r3, r1, lsl #1
	ldr	r3, .L86+8
	lsl	r1, r1, #6
	add	r7, r3, #996
	add	r1, r1, #28
	lsl	r2, r2, #6
	strh	r1, [r7]	@ movhi
	add	r2, r2, #28
	add	r1, r3, #1020
	strh	r2, [r1]	@ movhi
	ldr	r1, .L86+12
	add	r2, r3, #1000
	strh	r6, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	add	r2, r3, #1004
	ldr	r1, .L86+16
	strh	r5, [r2]	@ movhi
	add	r2, r3, #1008
	strh	r1, [r2]	@ movhi
	strh	r4, [r2, #2]	@ movhi
	add	r1, r3, #1012
	ldr	r2, .L86+20
	strh	lr, [r1]	@ movhi
	add	r1, r3, #1016
	add	r3, r3, #992
	strh	ip, [r1, #2]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L87:
	.align	2
.L86:
	.word	pts
	.word	1717986919
	.word	shadowOAM
	.word	16518
	.word	-32688
	.word	-32689
	.size	showScoreEnd, .-showScoreEnd
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
	mov	r2, #67108864
	mov	r3, #8064
	mov	r1, #4608
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2, #10]	@ movhi
	ldr	r4, .L92
	strh	r1, [r2]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L92+4
	mov	lr, pc
	bx	r4
	mov	r3, #5376
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L92+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r1, .L92+12
	mov	r0, #3
	ldr	r2, .L92+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L92+20
	add	r1, r3, #992
.L89:
	ldrh	r2, [r3]
	orr	r2, r2, #512
	strh	r2, [r3], #8	@ movhi
	cmp	r3, r1
	bne	.L89
	bl	showScoreEnd
	mov	r0, #3
	mov	r2, #117440512
	ldr	r1, .L92+20
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L92+24
	mov	lr, pc
	bx	r3
	mov	r1, #4
	ldr	r2, .L92+28
	ldr	r3, .L92+32
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+36
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L92+40
	ldr	r3, .L92+44
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L93:
	.align	2
.L92:
	.word	DMANow
	.word	winScreenPal
	.word	winScreenTiles
	.word	winScreenMap
	.word	100726784
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.word	stopSound
	.word	winSong_length
	.word	winSong_data
	.word	playSoundA
	.size	goToWin, .-goToWin
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
	mov	r2, #67108864
	mov	r3, #8064
	mov	r1, #4608
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2, #10]	@ movhi
	ldr	r4, .L98
	strh	r1, [r2]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L98+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L98+8
	ldr	r1, .L98+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r1, .L98+16
	mov	r0, #3
	ldr	r2, .L98+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L98+24
	add	r1, r3, #992
.L95:
	ldrh	r2, [r3]
	orr	r2, r2, #512
	strh	r2, [r3], #8	@ movhi
	cmp	r3, r1
	bne	.L95
	bl	showScoreEnd
	mov	r0, #3
	mov	r2, #117440512
	ldr	r1, .L98+24
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L98+28
	mov	lr, pc
	bx	r3
	mov	r1, #5
	ldr	r2, .L98+32
	ldr	r3, .L98+36
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L98+40
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L98+44
	ldr	r3, .L98+48
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L99:
	.align	2
.L98:
	.word	DMANow
	.word	loseScreenPal
	.word	4896
	.word	loseScreenTiles
	.word	loseScreenMap
	.word	100726784
	.word	shadowOAM
	.word	waitForVBlank
	.word	state
	.word	stopSound
	.word	loseSong_length
	.word	loseSong_data
	.word	playSoundA
	.size	goToLose, .-goToLose
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
	mov	r0, #28
	push	{r4, r5, r6, r7, r8, lr}
	mov	ip, #20
	mov	r7, #5
	mov	r6, #8
	mov	r5, #54
	mov	r4, #16
	mov	lr, #668
	ldr	r2, .L102
	ldr	r3, .L102+4
	ldr	r2, [r2]
	smull	r8, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r1, r3, r3, lsl #2
	sub	r1, r2, r1, lsl #1
	lsl	r1, r1, #6
	lsl	r2, r3, #6
	ldr	r3, .L102+8
	add	r1, r1, r0
	add	r2, r2, r0
	strh	r1, [r3, #76]	@ movhi
	strh	r2, [r3, #68]	@ movhi
	ldr	r1, .L102+12
	ldr	r2, .L102+16
	strh	r7, [r3, #48]	@ movhi
	strh	r6, [r3, #50]	@ movhi
	strh	r5, [r3, #52]	@ movhi
	strh	r4, [r3, #58]	@ movhi
	strh	lr, [r3, #60]	@ movhi
	strh	r1, [r3, #56]	@ movhi
	strh	ip, [r3, #66]	@ movhi
	strh	r0, [r3, #74]	@ movhi
	strh	r2, [r3, #64]	@ movhi
	strh	r2, [r3, #72]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L103:
	.align	2
.L102:
	.word	numBullets
	.word	1717986919
	.word	shadowOAM
	.word	-32763
	.word	-32764
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
	ldr	r3, .L111
	ldr	r2, [r3]
	cmp	r2, #6
	push	{r4, r5, lr}
	beq	.L110
	mov	r1, #512
	ldr	r3, .L111+4
	cmp	r2, #5
	strh	r1, [r3, #80]	@ movhi
	bne	.L107
	mov	r0, #58
	mov	r1, #117
	strh	r2, [r3, #88]	@ movhi
	strh	r0, [r3, #90]	@ movhi
	strh	r1, [r3, #92]	@ movhi
.L106:
	mov	r2, #512
	strh	r2, [r3, #96]	@ movhi
.L108:
	mov	r2, #5
	mov	r5, #48
	mov	r4, #148
	mov	lr, #58
	mov	ip, #149
	mov	r0, #65
	mov	r1, #150
	strh	r5, [r3, #106]	@ movhi
	strh	r4, [r3, #108]	@ movhi
	strh	lr, [r3, #114]	@ movhi
	strh	r2, [r3, #104]	@ movhi
	strh	r2, [r3, #112]	@ movhi
	strh	r2, [r3, #120]	@ movhi
	strh	ip, [r3, #116]	@ movhi
	strh	r0, [r3, #122]	@ movhi
	strh	r1, [r3, #124]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L107:
	cmp	r2, #4
	strh	r1, [r3, #88]	@ movhi
	bne	.L106
	mov	r0, #5
	mov	r1, #65
	mov	r2, #118
	strh	r0, [r3, #96]	@ movhi
	strh	r1, [r3, #98]	@ movhi
	strh	r2, [r3, #100]	@ movhi
	b	.L108
.L110:
	mov	ip, #5
	mov	r0, #48
	mov	r1, #116
	mov	r2, #512
	ldr	r3, .L111+4
	strh	ip, [r3, #80]	@ movhi
	strh	r0, [r3, #82]	@ movhi
	strh	r1, [r3, #84]	@ movhi
	strh	r2, [r3, #88]	@ movhi
	b	.L106
.L112:
	.align	2
.L111:
	.word	currWeapon
	.word	shadowOAM
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	lr, .L116
	ldr	r2, .L116+4
	ldr	ip, [lr]
	smull	r4, r0, r2, ip
	ldr	r1, .L116+8
	ldr	r3, .L116+12
	ldr	r5, [r1]
	ldr	r4, [r3]
	smull	r1, r3, r2, r5
	smull	r1, r2, r4, r2
	asr	r1, ip, #31
	rsb	r1, r1, r0, asr #2
	ldr	r0, .L116+16
	ldr	r0, [r0]
	add	r1, r1, r1, lsl #2
	sub	r1, ip, r1, lsl #1
	and	r0, r0, #1
	orrs	r1, r0, r1
	asr	r0, r5, #31
	asr	r1, r4, #31
	rsb	r2, r1, r2, asr #2
	rsb	r3, r0, r3, asr #2
	ldr	r6, .L116+20
	add	r0, r2, r2, lsl #2
	add	r3, r3, r3, lsl #2
	mov	r1, r2
	sub	r3, r5, r3, lsl #1
	sub	r2, r4, r0, lsl #1
	ldr	r0, [r6]
	bne	.L114
	add	r0, r0, #1
	rsbs	r4, r0, #0
	and	r4, r4, #7
	and	r0, r0, #7
	rsbpl	r0, r4, #0
	str	r0, [r6]
.L114:
	mov	r5, #28
	mov	r9, #145
	mov	r8, #16
	mov	r7, #24
	mov	r6, #668
	mov	r4, #36
	lsl	r3, r3, #6
	add	r10, r3, r5
	lsl	r1, r1, #6
	ldr	r3, .L116+24
	lsl	r2, r2, #6
	add	fp, r1, r5
	add	r2, r2, r5
	add	r1, ip, #1
	str	r1, [lr]
	strh	r2, [r3, #164]	@ movhi
	ldr	r1, .L116+28
	ldr	r2, .L116+32
	lsl	r0, r0, #6
	add	r0, r0, #30
	strh	r10, [r3, #140]	@ movhi
	strh	fp, [r3, #156]	@ movhi
	strh	r9, [r3, #128]	@ movhi
	strh	r8, [r3, #138]	@ movhi
	strh	r7, [r3, #146]	@ movhi
	strh	r6, [r3, #148]	@ movhi
	strh	r5, [r3, #154]	@ movhi
	strh	r4, [r3, #162]	@ movhi
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #130]	@ movhi
	strh	r2, [r3, #136]	@ movhi
	strh	r2, [r3, #144]	@ movhi
	strh	r2, [r3, #152]	@ movhi
	strh	r2, [r3, #160]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L117:
	.align	2
.L116:
	.word	timerAniCounter
	.word	1717986919
	.word	time_m
	.word	time_s
	.word	timer
	.word	timerCurFrame
	.word	shadowOAM
	.word	16388
	.word	-32623
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
	ldr	r0, .L138
	ldr	r2, [r0, #4]
	cmp	r2, #256
	push	{r4, r5, r6, lr}
	ble	.L119
	ldr	ip, .L138+4
	ldr	r3, [ip]
	cmp	r3, #25
	ble	.L134
.L120:
	ldr	r3, [r0, #8]
	cmp	r3, #256
	ble	.L121
	ldr	lr, .L138+8
	ldr	r1, [lr]
	cmp	r1, #29
	ble	.L135
.L122:
	mov	r1, #67108864
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	ldrh	r0, [r0]
	ldr	r5, .L138+12
	lsl	r3, r3, #16
	lsl	r2, r2, #16
	lsr	r3, r3, #16
	lsr	r2, r2, #16
	strh	r0, [r1, #18]	@ movhi
	strh	r2, [r1, #16]	@ movhi
	strh	r0, [r1, #26]	@ movhi
	strh	r3, [r1, #24]	@ movhi
	ldr	r3, [r5]
	ldr	r1, .L138+16
	ldr	r2, .L138+20
	ldr	r4, .L138+24
	lsl	r3, r3, #5
	add	r3, r3, #148
	strh	r1, [r4, #8]	@ movhi
	strh	r2, [r4, #10]	@ movhi
	strh	r3, [r4, #12]	@ movhi
	bl	showTime
	ldr	r3, .L138+28
	mov	lr, pc
	bx	r3
	bl	showScore
	bl	showAmmo
	bl	showWeapons
	ldr	r3, .L138+32
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r4, .L138+36
	mov	lr, pc
	bx	r4
	ldr	r3, .L138+40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L123
	ldr	r3, .L138+44
	ldrh	r2, [r3]
	ands	r4, r2, #8
	beq	.L136
.L123:
	ldr	r3, .L138+48
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L137
.L124:
	ldr	r3, [r5]
	cmp	r3, #0
	ble	.L125
	ldr	r2, .L138+52
	ldr	r3, .L138+56
	ldr	r2, [r2]
	ldr	r3, [r3]
	orrs	r3, r2, r3
	bne	.L118
.L125:
	pop	{r4, r5, r6, lr}
	b	goToLose
.L118:
	pop	{r4, r5, r6, lr}
	bx	lr
.L121:
	cmp	r3, #0
	bge	.L122
	ldr	lr, .L138+8
	ldr	r1, [lr]
	cmp	r1, #28
	ble	.L122
	mov	r4, #67108864
	sub	r1, r1, #1
	lsl	ip, r1, #24
	orr	ip, ip, #1073741824
	lsr	ip, ip, #16
	add	r3, r3, #256
	str	r1, [lr]
	str	r3, [r0, #8]
	strh	ip, [r4, #12]	@ movhi
	b	.L122
.L119:
	cmp	r2, #0
	bge	.L120
	ldr	ip, .L138+4
	ldr	r3, [ip]
	cmp	r3, #24
	ble	.L120
	mov	lr, #67108864
	sub	r3, r3, #1
	lsl	r1, r3, #24
	orr	r1, r1, #1073741824
	orr	r1, r1, #262144
	lsr	r1, r1, #16
	add	r2, r2, #256
	str	r3, [ip]
	str	r2, [r0, #4]
	strh	r1, [lr, #8]	@ movhi
	b	.L120
.L135:
	mov	r4, #67108864
	add	r1, r1, #1
	lsl	ip, r1, #24
	orr	ip, ip, #1073741824
	lsr	ip, ip, #16
	sub	r3, r3, #256
	str	r1, [lr]
	str	r3, [r0, #8]
	strh	ip, [r4, #12]	@ movhi
	b	.L122
.L134:
	mov	lr, #67108864
	add	r1, r3, #1
	lsl	r3, r1, #24
	orr	r3, r3, #1073741824
	orr	r3, r3, #262144
	lsr	r3, r3, #16
	sub	r2, r2, #256
	str	r1, [ip]
	str	r2, [r0, #4]
	strh	r3, [lr, #8]	@ movhi
	b	.L120
.L137:
	bl	goToWin
	b	.L124
.L136:
	bl	goToPause
	ldr	r3, .L138+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L138+64
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L138+68
	ldr	r3, .L138+72
	mov	lr, pc
	bx	r3
	b	.L123
.L139:
	.align	2
.L138:
	.word	.LANCHOR0
	.word	screenBlock2
	.word	screenBlock
	.word	lives
	.word	16389
	.word	16589
	.word	shadowOAM
	.word	updateGame
	.word	waitForVBlank
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.word	won
	.word	time_m
	.word	time_s
	.word	pauseSound
	.word	clickSound_length
	.word	clickSound_data
	.word	playSoundB
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
	ldr	r3, .L152
	mov	lr, pc
	bx	r3
	ldr	r3, .L152+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L152+8
	mov	lr, pc
	bx	r3
	ldr	r6, .L152+12
	ldr	r8, .L152+16
	ldr	r5, .L152+20
	ldr	fp, .L152+24
	ldr	r10, .L152+28
	ldr	r9, .L152+32
	ldr	r7, .L152+36
	ldr	r4, .L152+40
.L141:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L142:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L142
.L144:
	.word	.L148
	.word	.L147
	.word	.L146
	.word	.L145
	.word	.L143
	.word	.L143
.L143:
	mov	lr, pc
	bx	r7
	b	.L141
.L145:
	ldr	r3, .L152+44
	mov	lr, pc
	bx	r3
	b	.L141
.L146:
	mov	lr, pc
	bx	r9
	b	.L141
.L147:
	mov	lr, pc
	bx	r10
	b	.L141
.L148:
	mov	lr, pc
	bx	fp
	b	.L141
.L153:
	.align	2
.L152:
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
	.global	hOff2
	.global	hOff
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	timerCurFrame,4,4
	.comm	timerAniCounter,4,4
	.comm	timer,4,4
	.comm	time_s,4,4
	.comm	time_m,4,4
	.comm	screenBlock2,4,4
	.comm	screenBlock,4,4
	.comm	numBullets,4,4
	.comm	numWeapons,4,4
	.comm	currWeapon,4,4
	.comm	hitFrames,4,4
	.comm	pts,4,4
	.comm	hasCheat,4,4
	.comm	lives,4,4
	.comm	won,4,4
	.comm	seed,4,4
	.comm	state,4,4
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
	.type	hOff2, %object
	.size	hOff2, 4
hOff2:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
