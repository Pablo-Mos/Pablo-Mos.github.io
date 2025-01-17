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
	mov	r2, #83886080
	ldr	r1, .L4
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	mov	r2, #31744
	mov	r4, #0
	mvn	r1, #32768
	mov	ip, #992
	mov	r0, #31
	ldr	r3, .L4+16
	strh	r2, [r3, #246]	@ movhi
	ldr	r2, .L4+20
	strh	r1, [r3, #252]	@ movhi
	strh	r2, [r3, #254]	@ movhi
	strh	r4, [r3, #244]	@ movhi
	strh	ip, [r3, #248]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	ldr	r1, .L4+32
	ldr	r2, .L4+36
	ldr	r3, .L4+40
	str	r4, [r1]
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	bgPal
	.word	DMANow
	.word	bgBitmap
	.word	drawFullscreenImage4
	.word	83886336
	.word	15855
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	dim
	.word	seed
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
	mov	r3, #67108864
	ldr	r2, .L7
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1044
	.size	initialize, .-initialize
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
	ldr	r4, .L16
	ldr	r3, [r4]
	ldr	r2, .L16+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L16+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L9
	ldr	r3, .L16+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L15
.L9:
	pop	{r4, lr}
	bx	lr
.L15:
	ldr	r0, [r4]
	ldr	r3, .L16+16
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
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	state
	.word	initGame
	.size	start, .-start
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
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L19
	str	r2, [r3]
	bx	lr
.L20:
	.align	2
.L19:
	.word	state
	.size	goToGame, .-goToGame
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"Pause\000"
	.align	2
.LC2:
	.ascii	"press START to resume\000"
	.align	2
.LC3:
	.ascii	"press SELECT to restart\000"
	.text
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
	push	{r4, r5, lr}
	mov	r0, #255
	sub	sp, sp, #12
	ldr	r3, .L23
	mov	lr, pc
	bx	r3
	mov	r4, #250
	mov	r1, #5
	ldr	r5, .L23+4
	mov	r0, r1
	mov	r3, #150
	mov	r2, #230
	str	r4, [sp]
	mov	lr, pc
	bx	r5
	mov	r1, #10
	mov	r3, #255
	mov	r0, r1
	str	r3, [sp]
	mov	r2, #220
	mov	r3, #140
	mov	lr, pc
	bx	r5
	ldr	r5, .L23+8
	mov	r3, r4
	mov	r1, #40
	mov	r0, #110
	ldr	r2, .L23+12
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r1, #70
	mov	r0, #60
	ldr	r2, .L23+16
	mov	lr, pc
	bx	r5
	mov	r1, #90
	mov	r0, #55
	ldr	r2, .L23+20
	mov	r3, r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L23+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+28
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L23+32
	str	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	fillScreen4
	.word	drawRect4
	.word	drawString4
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	waitForVBlank
	.word	flipPage
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
	ldr	r3, .L35
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L26
	ldr	r2, .L35+8
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L26
	mov	r2, #1
	ldr	r3, .L35+12
	str	r2, [r3]
.L25:
	pop	{r4, lr}
	bx	lr
.L26:
	tst	r3, #4
	beq	.L25
	ldr	r3, .L35+8
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L25
	pop	{r4, lr}
	b	goToStart
.L36:
	.align	2
.L35:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"You WON!\000"
	.align	2
.LC5:
	.ascii	"press START to play again\000"
	.text
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
	push	{r4, r5, lr}
	mov	r0, #252
	sub	sp, sp, #12
	ldr	r3, .L39
	mov	lr, pc
	bx	r3
	mov	r4, #250
	mov	r1, #5
	ldr	r5, .L39+4
	mov	r0, r1
	mov	r3, #150
	mov	r2, #230
	str	r4, [sp]
	mov	lr, pc
	bx	r5
	mov	r1, #10
	mov	r3, #252
	mov	r0, r1
	str	r3, [sp]
	mov	r2, #220
	mov	r3, #140
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r5, .L39+8
	mov	r1, #60
	mov	r0, #95
	ldr	r2, .L39+12
	mov	lr, pc
	bx	r5
	mov	r1, #90
	mov	r0, #45
	ldr	r2, .L39+16
	mov	r3, r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L39+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+24
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L39+28
	str	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	fillScreen4
	.word	drawRect4
	.word	drawString4
	.word	.LC4
	.word	.LC5
	.word	waitForVBlank
	.word	flipPage
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
	ldr	r3, .L48
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L41
	ldr	r3, .L48+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L47
.L41:
	pop	{r4, lr}
	bx	lr
.L47:
	pop	{r4, lr}
	b	goToStart
.L49:
	.align	2
.L48:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"You Lost\000"
	.text
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
	push	{r4, r5, lr}
	mov	r0, #253
	sub	sp, sp, #12
	ldr	r3, .L52
	mov	lr, pc
	bx	r3
	mov	r4, #250
	mov	r1, #5
	ldr	r5, .L52+4
	mov	r0, r1
	mov	r3, #150
	mov	r2, #230
	str	r4, [sp]
	mov	lr, pc
	bx	r5
	mov	r1, #10
	mov	r3, #253
	mov	r0, r1
	str	r3, [sp]
	mov	r2, #220
	mov	r3, #140
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r5, .L52+8
	mov	r1, #60
	mov	r0, #95
	ldr	r2, .L52+12
	mov	lr, pc
	bx	r5
	mov	r1, #90
	mov	r0, #45
	ldr	r2, .L52+16
	mov	r3, r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L52+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+24
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L52+28
	str	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	fillScreen4
	.word	drawRect4
	.word	drawString4
	.word	.LC6
	.word	.LC5
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"Evil Fish Remaining: %d\000"
	.align	2
.LC8:
	.ascii	"Go to Shore!\000"
	.text
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
	ldr	r3, .L68
	ldr	r4, .L68+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+8
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	cmp	r2, #0
	ble	.L55
	ldr	r1, .L68+12
	ldr	r3, .L68+16
	ldr	r0, .L68+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L68+24
	ldr	r2, .L68+20
	mov	r3, #254
	mov	r1, #145
	mov	r0, #8
	mov	lr, pc
	bx	r5
	ldr	r2, [r4]
.L55:
	cmp	r2, #0
	beq	.L64
.L56:
	ldr	r3, .L68+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L68+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L57
	ldr	r3, .L68+40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L65
.L57:
	ldr	r4, .L68+44
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L66
.L58:
	cmn	r3, #1
	beq	.L67
	pop	{r4, r5, r6, lr}
	bx	lr
.L64:
	mov	r2, #13
	ldr	r1, .L68+48
	ldr	r3, .L68+52
	ldr	r0, .L68+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L68+24
	mov	r3, #254
	mov	r1, #145
	mov	r0, #8
	ldr	r2, .L68+20
	mov	lr, pc
	bx	r4
	b	.L56
.L67:
	pop	{r4, r5, r6, lr}
	b	goToLose
.L66:
	bl	goToWin
	ldr	r3, [r4]
	b	.L58
.L65:
	bl	goToPause
	b	.L57
.L69:
	.align	2
.L68:
	.word	updateGame
	.word	enemiesRemaining
	.word	drawGame
	.word	.LC7
	.word	sprintf
	.word	buffer
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	gameState
	.word	.LC8
	.word	memcpy
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
	mov	r4, #67108864
	ldr	r2, .L81
	ldr	r3, .L81+4
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r1, #128
	mvn	r2, #170
	mov	r3, #2
	ldr	r6, .L81+8
	ldr	fp, .L81+12
	ldr	r5, .L81+16
	ldr	r10, .L81+20
	ldr	r9, .L81+24
	ldr	r8, .L81+28
	ldr	r7, .L81+32
	strh	r1, [r4, #132]	@ movhi
	strh	r2, [r4, #128]	@ movhi
	strh	r3, [r4, #130]	@ movhi
	add	r4, r4, #256
.L71:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L72:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L72
.L74:
	.word	.L77
	.word	.L76
	.word	.L75
	.word	.L73
	.word	.L73
.L73:
	mov	lr, pc
	bx	r7
	b	.L71
.L75:
	mov	lr, pc
	bx	r8
	b	.L71
.L76:
	mov	lr, pc
	bx	r9
	b	.L71
.L77:
	mov	lr, pc
	bx	r10
	b	.L71
.L82:
	.align	2
.L81:
	.word	1044
	.word	goToStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
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
	.align	2
	.global	soundStuff
	.syntax unified
	.arm
	.fpu softvfp
	.type	soundStuff, %function
soundStuff:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mvn	r1, #170
	mov	r2, #2
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
	.size	soundStuff, .-soundStuff
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	dim,4,4
	.comm	state,4,4
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
