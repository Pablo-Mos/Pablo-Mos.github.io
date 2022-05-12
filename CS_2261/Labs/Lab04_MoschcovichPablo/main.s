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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"press SELECT to play\000"
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
	ldr	r0, .L4
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	mov	r1, #50
	mov	r3, #0
	ldr	r2, .L4+8
	ldr	r4, .L4+12
	mov	r0, r1
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	24319
	.word	fillScreen
	.word	.LC0
	.word	drawString
	.word	state
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
	.word	1027
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState.part.0, %function
winState.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L12:
	.align	2
.L11:
	.word	buttons
	.size	winState.part.0, .-winState.part.0
	.set	loseState.part.0,winState.part.0
	.align	2
	.global	startState
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState, %function
startState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L20
	ldr	r4, .L20+4
	ldrh	r2, [r2]
	ldr	r3, [r4]
	tst	r2, #4
	add	r3, r3, #1
	str	r3, [r4]
	beq	.L13
	ldr	r3, .L20+8
	ldrh	r0, [r3]
	ands	r0, r0, #4
	beq	.L19
.L13:
	pop	{r4, lr}
	bx	lr
.L19:
	ldr	r3, .L20+12
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L20+16
	ldr	r0, [r4]
	ldr	r3, .L20+20
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	oldButtons
	.word	seed
	.word	buttons
	.word	fillScreen
	.word	state
	.word	srand
	.word	initGame
	.size	startState, .-startState
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
	push	{r4, lr}
	ldr	r3, .L24
	mov	r0, #0
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L24+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	fillScreen
	.word	state
	.size	goToGame, .-goToGame
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"paused\000"
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
	push	{r4, lr}
	mov	r0, #31744
	ldr	r3, .L28
	mov	lr, pc
	bx	r3
	mov	r1, #50
	mov	r3, #0
	ldr	r2, .L28+4
	ldr	r4, .L28+8
	mov	r0, r1
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L28+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L29:
	.align	2
.L28:
	.word	fillScreen
	.word	.LC1
	.word	drawString
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState, %function
pauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L42
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L31
	ldr	r2, .L42+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L40
.L31:
	tst	r3, #4
	beq	.L30
	ldr	r3, .L42+4
	ldrh	r0, [r3]
	ands	r0, r0, #4
	beq	.L41
.L30:
	pop	{r4, lr}
	bx	lr
.L41:
	ldr	r3, .L42+8
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L42+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L40:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L31
.L43:
	.align	2
.L42:
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	state
	.size	pauseState, .-pauseState
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"you win!\000"
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
	push	{r4, lr}
	mov	r0, #992
	ldr	r3, .L46
	mov	lr, pc
	bx	r3
	mov	r1, #50
	mov	r3, #0
	ldr	r2, .L46+4
	ldr	r4, .L46+8
	mov	r0, r1
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L46+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L47:
	.align	2
.L46:
	.word	fillScreen
	.word	.LC2
	.word	drawString
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	winState
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState, %function
winState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L50
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	b	winState.part.0
.L51:
	.align	2
.L50:
	.word	oldButtons
	.size	winState, .-winState
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"you lose!\000"
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
	push	{r4, lr}
	mov	r0, #31
	ldr	r3, .L54
	mov	lr, pc
	bx	r3
	mov	r1, #50
	mov	r3, #0
	ldr	r2, .L54+4
	ldr	r4, .L54+8
	mov	r0, r1
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L54+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L55:
	.align	2
.L54:
	.word	fillScreen
	.word	.LC3
	.word	drawString
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L70
	mov	lr, pc
	bx	r3
	ldr	r4, .L70+4
	ldr	r3, .L70+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+12
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L57
	ldr	r3, .L70+16
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L67
.L57:
	ldr	r3, .L70+20
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L68
.L58:
	ldrh	r3, [r4]
	tst	r3, #1
	beq	.L56
	ldr	r3, .L70+16
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L69
.L56:
	pop	{r4, lr}
	bx	lr
.L68:
	bl	goToWin
	b	.L58
.L69:
	pop	{r4, lr}
	b	goToLose
.L67:
	bl	goToPause
	b	.L57
.L71:
	.align	2
.L70:
	.word	updateGame
	.word	oldButtons
	.word	waitForVBlank
	.word	drawGame
	.word	buttons
	.word	ballsRemaining
	.size	gameState, .-gameState
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
	mov	r3, #67108864
	ldr	r2, .L86
	ldr	r6, .L86+4
	ldr	r10, .L86+8
	push	{r4, r7, fp, lr}
	strh	r2, [r3]	@ movhi
	ldr	r3, .L86+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L86+16
	ldr	r2, [r6]
	ldrh	r0, [r10]
	ldr	r9, .L86+20
	ldr	r8, .L86+24
	ldr	r7, .L86+28
	ldr	fp, .L86+32
	ldr	r4, .L86+36
.L74:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r10]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L82
.L76:
	.word	.L80
	.word	.L79
	.word	.L78
	.word	.L77
	.word	.L75
.L75:
	tst	r0, #4
	beq	.L82
	ldr	r3, .L86+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L74
.L77:
	tst	r0, #4
	beq	.L82
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L74
.L78:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L74
.L79:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L74
.L80:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L74
.L82:
	mov	r0, r3
	b	.L74
.L87:
	.align	2
.L86:
	.word	1027
	.word	state
	.word	buttons
	.word	goToStart
	.word	oldButtons
	.word	startState
	.word	gameState
	.word	pauseState
	.word	winState.part.0
	.word	67109120
	.word	loseState.part.0
	.size	main, .-main
	.text
	.align	2
	.global	loseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseState, %function
loseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	winState
	.size	loseState, .-loseState
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
