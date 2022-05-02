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
	push	{r4, lr}
	mov	lr, #0
	ldr	r3, .L4
	ldr	ip, .L4+4
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	str	lr, [ip]
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #256
	mov	r1, #1792
	strh	r3, [r2]	@ movhi
	ldr	r4, .L4+16
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L4+24
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	startSong_length
	.word	state
	.word	startSong_data
	.word	playSoundA
	.word	DMANow
	.word	main_menuPal
	.word	5712
	.word	main_menuTiles
	.word	100677632
	.word	main_menuMap
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L8
	ldr	r4, .L8+4
	mov	r1, r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L8+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L8+12
	ldr	r1, .L8+16
	mov	lr, pc
	bx	r4
	mov	r1, r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L8+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #4352
	mov	r0, #7936
	mov	r1, #0
	strh	r2, [r3]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	ldr	r2, .L8+24
	ldr	r0, .L8+28
	ldrh	ip, [r2, #48]
	ldr	r2, .L8+32
	ldr	r3, .L8+36
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+40
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	tetreminosTiles
	.word	DMANow
	.word	100679680
	.word	83886592
	.word	tetreminosPal
	.word	100728832
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L13:
	.align	2
.L12:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	lose.part.0,win.part.0
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
	mov	r2, #67108864
	mov	r3, #4352
	ldr	r1, .L16
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L16+4
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #256
	ldr	r1, .L16+8
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	ldr	r2, .L16+12
	ldr	r3, .L16+16
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L16+20
	ldr	r3, .L16+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	3844
	.word	DMANow
	.word	tetreminosPal
	.word	.LANCHOR0
	.word	srand
	.word	state
	.word	startGame
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
	ldr	r2, .L34
	ldr	r1, .L34+4
	ldr	r3, [r2]
	ldrh	r1, [r1]
	add	r3, r3, #1
	tst	r1, #8
	str	r3, [r2]
	beq	.L19
	ldr	r3, .L34+8
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L19
.L20:
	push	{r4, lr}
	ldr	r3, .L34+12
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L34+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+20
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L34+24
	ldr	r3, .L34+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L19:
	tst	r1, #4
	bxeq	lr
	ldr	r3, .L34+8
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	.L20
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	setupGameboard
	.word	stopSound
	.word	gameSong_length
	.word	gameSong_data
	.word	playSoundA
	.size	start, .-start
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause.part.0, %function
pause.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L42
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	bl	goToGame
	ldr	r3, .L42+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	buttons
	.word	unpauseSound
	.size	pause.part.0, .-pause.part.0
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
	mov	ip, #2
	mov	r1, #67108864
	mov	r3, #256
	mov	r0, #1792
	push	{r4, lr}
	ldr	r2, .L46
	ldr	r4, .L46+4
	str	ip, [r2]
	strh	r3, [r1]	@ movhi
	mov	r2, #83886080
	strh	r0, [r1, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L46+8
	mov	lr, pc
	bx	r4
	mov	r3, #208
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L46+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L46+16
	ldr	r1, .L46+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	state
	.word	DMANow
	.word	pausePal
	.word	pauseTiles
	.word	100677632
	.word	pauseMap
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
	@ link register save eliminated.
	ldr	r3, .L50
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	pause.part.0
.L51:
	.align	2
.L50:
	.word	oldButtons
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
	push	{r4, r5, r6, lr}
	mov	ip, #1792
	mov	r4, #3
	mov	r1, #67108864
	mov	r3, #256
	ldr	r2, .L54
	ldr	r5, .L54+4
	str	r4, [r2]
	mov	r0, r4
	strh	r3, [r1]	@ movhi
	mov	r2, #83886080
	strh	ip, [r1, #8]	@ movhi
	ldr	r1, .L54+8
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #384
	mov	r2, #100663296
	ldr	r1, .L54+12
	mov	lr, pc
	bx	r5
	mov	r0, r4
	ldr	r2, .L54+16
	ldr	r1, .L54+20
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	ldr	r3, .L54+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+28
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L54+32
	ldr	r3, .L54+36
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	state
	.word	DMANow
	.word	winPal
	.word	winTiles
	.word	100677632
	.word	winMap
	.word	stopSound
	.word	winSong_length
	.word	winSong_data
	.word	playSoundA
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
	@ link register save eliminated.
	ldr	r3, .L58
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L59:
	.align	2
.L58:
	.word	oldButtons
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
	mov	ip, #4
	mov	r1, #67108864
	mov	r3, #256
	mov	r0, #1792
	ldr	r2, .L62
	push	{r4, lr}
	str	ip, [r2]
	ldr	r4, .L62+4
	strh	r3, [r1]	@ movhi
	mov	r2, #83886080
	strh	r0, [r1, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L62+8
	mov	lr, pc
	bx	r4
	mov	r3, #416
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L62+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L62+16
	ldr	r1, .L62+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L62+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+28
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L62+32
	ldr	r3, .L62+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	state
	.word	DMANow
	.word	losePal
	.word	loseTiles
	.word	100677632
	.word	loseMap
	.word	stopSound
	.word	loseSong_length
	.word	loseSong_data
	.word	playSoundA
	.size	goToLose, .-goToLose
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
	push	{r4, lr}
	ldr	r4, .L81
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L65
	ldr	r2, .L81+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L78
.L65:
	tst	r3, #256
	beq	.L66
	ldr	r2, .L81+4
	ldrh	r2, [r2]
	tst	r2, #256
	beq	.L79
.L66:
	tst	r3, #512
	beq	.L67
	ldr	r3, .L81+4
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L80
.L67:
	ldr	r3, .L81+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L80:
	bl	goToLose
	b	.L67
.L78:
	bl	goToPause
	ldr	r3, .L81+20
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L65
.L79:
	bl	goToWin
	ldrh	r3, [r4]
	b	.L66
.L82:
	.align	2
.L81:
	.word	oldButtons
	.word	buttons
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
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
	ldr	r6, .L98
	ldr	r9, .L98+4
	push	{r4, r7, fp, lr}
	ldr	r3, .L98+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L98+12
	ldr	r2, [r6]
	ldrh	r0, [r9]
	ldr	r8, .L98+16
	ldr	r7, .L98+20
	ldr	fp, .L98+24
	ldr	r10, .L98+28
	ldr	r4, .L98+32
.L85:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r9]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L93
.L87:
	.word	.L91
	.word	.L90
	.word	.L89
	.word	.L88
	.word	.L86
.L86:
	tst	r0, #8
	beq	.L93
	ldr	r3, .L98+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r9]
	b	.L85
.L88:
	tst	r0, #8
	beq	.L93
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [r9]
	b	.L85
.L89:
	tst	r0, #8
	beq	.L93
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r9]
	b	.L85
.L90:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [r9]
	b	.L85
.L91:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r9]
	b	.L85
.L93:
	mov	r0, r3
	b	.L85
.L99:
	.align	2
.L98:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	game
	.word	pause.part.0
	.word	win.part.0
	.word	67109120
	.word	lose.part.0
	.size	main, .-main
	.text
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
	.global	seed
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	seed, %object
	.size	seed, 4
seed:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
