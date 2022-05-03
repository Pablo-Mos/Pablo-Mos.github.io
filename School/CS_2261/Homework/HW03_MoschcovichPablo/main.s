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
	.ascii	"Welcome to WAVE CRASHER!\000"
	.align	2
.LC1:
	.ascii	"choose a difficulty\000"
	.align	2
.LC2:
	.ascii	"& press START to begin\000"
	.align	2
.LC3:
	.ascii	"Easy\000"
	.align	2
.LC4:
	.ascii	"Medium\000"
	.align	2
.LC5:
	.ascii	"Hard\000"
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
	push	{r4, r5, r6, r7, lr}
	mov	r6, #0
	sub	sp, sp, #12
	ldr	r7, .L10
	ldr	r0, .L10+4
	ldr	r3, .L10+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L10+12
	mov	r3, #34
	mov	r2, #164
	mov	r1, #25
	mov	r0, #38
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #30
	mov	r2, #160
	mov	r1, #27
	mov	r0, #40
	str	r7, [sp]
	mov	lr, pc
	bx	r5
	ldr	r4, .L10+16
	mov	r3, r6
	mov	r1, #37
	mov	r0, #47
	ldr	r2, .L10+20
	mov	lr, pc
	bx	r4
	mov	r3, r7
	mov	r1, #80
	mov	r0, #65
	ldr	r2, .L10+24
	mov	lr, pc
	bx	r4
	mov	r3, r7
	mov	r1, #90
	mov	r0, #55
	ldr	r2, .L10+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L10+32
	ldr	r3, [r3]
	cmp	r3, #10
	beq	.L8
	cmp	r3, #5
	mov	r1, #120
	mov	r3, r6
	mov	r0, #45
	ldr	r2, .L10+36
	beq	.L9
	mov	lr, pc
	bx	r4
	mov	r3, r6
	mov	r1, #120
	mov	r0, #100
	ldr	r2, .L10+40
	mov	lr, pc
	bx	r4
	mov	r1, #120
	mov	r0, #170
	ldr	r3, .L10+44
	ldr	r2, .L10+48
	mov	lr, pc
	bx	r4
.L3:
	mov	r4, #0
	mov	r3, #4
	mov	r1, r4
	mov	r0, r4
	mov	r2, #240
	str	r4, [sp]
	mov	lr, pc
	bx	r5
	mov	r1, r4
	mov	r0, r4
	mov	r3, #160
	mov	r2, #4
	str	r4, [sp]
	mov	lr, pc
	bx	r5
	ldr	r6, .L10
	mov	r0, r4
	mov	r3, #4
	mov	r2, #240
	mov	r1, #156
	str	r4, [sp]
	mov	lr, pc
	bx	r5
	mov	r1, r4
	mov	r3, #160
	mov	r2, #4
	mov	r0, #236
	str	r4, [sp]
	mov	lr, pc
	bx	r5
	mov	r1, r4
	mov	r0, r4
	mov	r3, #2
	mov	r2, #240
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	mov	r1, r4
	mov	r0, r4
	mov	r3, #160
	mov	r2, #2
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #2
	mov	r2, #240
	mov	r1, #158
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	mov	r1, r4
	mov	r3, #160
	mov	r2, #2
	mov	r0, #238
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	ldr	r0, .L10+52
	ldr	r1, .L10+56
	ldr	r2, .L10+60
	ldr	r3, .L10+64
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r2]
	str	r4, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L9:
	mov	lr, pc
	bx	r4
	ldr	r3, .L10+44
.L6:
	mov	r1, #120
	mov	r0, #100
	ldr	r2, .L10+40
	mov	lr, pc
	bx	r4
	mov	r3, r6
	mov	r1, #120
	mov	r0, #170
	ldr	r2, .L10+48
	mov	lr, pc
	bx	r4
	b	.L3
.L8:
	ldr	r3, .L10+44
	mov	r1, #120
	mov	r0, #45
	ldr	r2, .L10+36
	mov	lr, pc
	bx	r4
	mov	r3, r6
	b	.L6
.L11:
	.align	2
.L10:
	.word	32352
	.word	31904
	.word	fillScreen
	.word	drawRect
	.word	drawString
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LANCHOR0
	.word	.LC3
	.word	.LC4
	.word	32767
	.word	.LC5
	.word	state
	.word	dead
	.word	pts
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
	ldr	r2, .L13
	strh	r2, [r3]	@ movhi
	b	goToStart
.L14:
	.align	2
.L13:
	.word	1027
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L47
	ldr	r3, [r4]
	ldr	r5, .L47+4
	ldr	r2, .L47+8
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldrh	r2, [r5]
	tst	r2, #8
	beq	.L16
	ldr	r3, .L47+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L40
.L16:
	tst	r2, #16
	beq	.L17
	ldr	r3, .L47+12
	ldrh	r3, [r3]
	ands	r3, r3, #16
	beq	.L41
.L17:
	tst	r2, #32
	beq	.L15
	ldr	r3, .L47+12
	ldrh	r3, [r3]
	ands	r4, r3, #32
	bne	.L15
	ldr	r6, .L47+16
	ldr	r5, [r6]
	cmp	r5, #5
	beq	.L42
	cmp	r5, #0
	beq	.L43
	cmp	r5, #10
	beq	.L44
.L15:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L41:
	ldr	r6, .L47+16
	ldr	r4, [r6]
	cmp	r4, #10
	beq	.L45
	cmp	r4, #5
	beq	.L46
	cmp	r4, #0
	bne	.L17
	mov	r1, #120
	mov	r0, #45
	ldr	r3, .L47+20
	ldr	r2, .L47+24
	ldr	r7, .L47+28
	mov	lr, pc
	bx	r7
	mov	r3, r4
	ldr	r2, .L47+32
	mov	r1, #120
	mov	r0, #170
	mov	lr, pc
	bx	r7
	mov	r3, #10
	ldrh	r2, [r5]
	str	r3, [r6]
	b	.L17
.L40:
	ldr	r0, [r4]
	ldr	r3, .L47+36
	mov	lr, pc
	bx	r3
	mov	r0, #10240
	ldr	r3, .L47+40
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L47+44
	ldr	r3, .L47+48
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldrh	r2, [r5]
	b	.L16
.L43:
	mov	r1, #120
	mov	r0, #100
	ldr	r3, .L47+20
	ldr	r2, .L47+52
	ldr	r4, .L47+28
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #120
	mov	r0, #170
	ldr	r2, .L47+32
	mov	lr, pc
	bx	r4
	ldr	r3, [r6]
	add	r3, r3, #5
	str	r3, [r6]
	b	.L15
.L45:
	mov	r1, #120
	mov	r0, #45
	ldr	r2, .L47+24
	ldr	r4, .L47+28
	mov	lr, pc
	bx	r4
	mov	r1, #120
	mov	r0, #100
	ldr	r3, .L47+20
	ldr	r2, .L47+52
.L39:
	mov	lr, pc
	bx	r4
	ldr	r3, [r6]
	sub	r3, r3, #5
	ldrh	r2, [r5]
	str	r3, [r6]
	b	.L17
.L42:
	mov	r1, #120
	mov	r0, #45
	ldr	r3, .L47+20
	ldr	r2, .L47+24
	ldr	r5, .L47+28
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r1, #120
	mov	r0, #100
	ldr	r2, .L47+52
	mov	lr, pc
	bx	r5
	ldr	r3, [r6]
	add	r3, r3, #5
	str	r3, [r6]
	b	.L15
.L46:
	mov	r1, #120
	mov	r0, #100
	ldr	r2, .L47+52
	ldr	r4, .L47+28
	mov	lr, pc
	bx	r4
	mov	r1, #120
	mov	r0, #170
	ldr	r3, .L47+20
	ldr	r2, .L47+32
	b	.L39
.L44:
	mov	r3, r4
	mov	r1, #120
	mov	r0, #45
	ldr	r2, .L47+24
	ldr	r5, .L47+28
	mov	lr, pc
	bx	r5
	mov	r1, #120
	mov	r0, #170
	ldr	r3, .L47+20
	ldr	r2, .L47+32
	mov	lr, pc
	bx	r5
	str	r4, [r6]
	b	.L15
.L48:
	.align	2
.L47:
	.word	seed
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	.LANCHOR0
	.word	32767
	.word	.LC3
	.word	drawString
	.word	.LC5
	.word	srand
	.word	fillScreen
	.word	state
	.word	initGame
	.word	.LC4
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
	push	{r4, lr}
	ldr	r3, .L51
	mov	r0, #10240
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L51+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L52:
	.align	2
.L51:
	.word	fillScreen
	.word	state
	.size	goToGame, .-goToGame
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"Pause\000"
	.align	2
.LC7:
	.ascii	"press START to resume\000"
	.align	2
.LC8:
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
	push	{r4, lr}
	ldr	r0, .L55
	ldr	r3, .L55+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L55+8
	mov	r3, #0
	mov	r1, #40
	mov	r0, #110
	ldr	r2, .L55+12
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #70
	mov	r0, #60
	ldr	r2, .L55+16
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L55+20
	mov	r1, #90
	mov	r0, #55
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L55+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L56:
	.align	2
.L55:
	.word	21140
	.word	fillScreen
	.word	drawString
	.word	.LC6
	.word	.LC7
	.word	.LC8
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
	ldr	r3, .L69
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+4
	ldrh	r3, [r3]
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
.L67:
	ldr	r3, .L69+12
	mov	r0, #10240
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L69+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L68:
	pop	{r4, lr}
	b	goToStart
.L70:
	.align	2
.L69:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	state
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"You WON!\000"
	.align	2
.LC10:
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
	push	{r4, lr}
	mov	r0, #992
	ldr	r3, .L73
	mov	lr, pc
	bx	r3
	ldr	r4, .L73+4
	mov	r3, #0
	mov	r1, #60
	mov	r0, #95
	ldr	r2, .L73+8
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L73+12
	mov	r1, #90
	mov	r0, #45
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L73+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L74:
	.align	2
.L73:
	.word	fillScreen
	.word	drawString
	.word	.LC9
	.word	.LC10
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
	b	goToStart
.L83:
	.align	2
.L82:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC11:
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
	push	{r4, lr}
	mov	r0, #31
	ldr	r3, .L86
	mov	lr, pc
	bx	r3
	ldr	r4, .L86+4
	mov	r3, #0
	mov	r1, #60
	mov	r0, #95
	ldr	r2, .L86+8
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L86+12
	mov	r1, #90
	mov	r0, #45
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L86+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L87:
	.align	2
.L86:
	.word	fillScreen
	.word	drawString
	.word	.LC11
	.word	.LC10
	.word	state
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
	ldr	r3, .L99
	mov	lr, pc
	bx	r3
	ldr	r3, .L99+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L99+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L99+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L89
	ldr	r3, .L99+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L96
.L89:
	ldr	r3, .L99+20
	ldr	r2, .L99+24
	ldr	r3, [r3]
	ldr	r2, [r2]
	rsb	r3, r3, #15
	cmp	r3, r2
	beq	.L97
	ldr	r3, .L99+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L98
	pop	{r4, lr}
	bx	lr
.L98:
	pop	{r4, lr}
	b	goToLose
.L96:
	pop	{r4, lr}
	b	goToPause
.L97:
	pop	{r4, lr}
	b	goToWin
.L100:
	.align	2
.L99:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.word	pts
	.word	dead
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
	mov	r2, #67108864
	ldr	r1, .L112
	push	{r4, r7, fp, lr}
	ldr	r3, .L112+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L112+8
	ldr	fp, .L112+12
	ldr	r5, .L112+16
	ldr	r10, .L112+20
	ldr	r9, .L112+24
	ldr	r8, .L112+28
	ldr	r7, .L112+32
	ldr	r4, .L112+36
.L102:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L103:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L103
.L105:
	.word	.L108
	.word	.L107
	.word	.L106
	.word	.L104
	.word	.L104
.L104:
	mov	lr, pc
	bx	r7
	b	.L102
.L106:
	mov	lr, pc
	bx	r8
	b	.L102
.L107:
	mov	lr, pc
	bx	r9
	b	.L102
.L108:
	mov	lr, pc
	bx	r10
	b	.L102
.L113:
	.align	2
.L112:
	.word	1027
	.word	goToStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
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
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.global	dif
	.comm	seed,4,4
	.comm	dead,4,4
	.comm	state,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	dif, %object
	.size	dif, 4
dif:
	.word	10
	.ident	"GCC: (devkitARM release 53) 9.1.0"
