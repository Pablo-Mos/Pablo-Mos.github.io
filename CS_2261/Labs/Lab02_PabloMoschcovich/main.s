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
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #31744
	push	{r4, r5, r6, lr}
	mov	r1, #992
	mvn	lr, #64512
	mvn	r0, #32768
	ldr	ip, .L4
	strh	ip, [r3]	@ movhi
	ldr	r3, .L4+4
	ldr	ip, .L4+8
	ldrh	ip, [ip, #48]
	strh	r2, [r3]	@ movhi
	ldr	ip, .L4+12
	ldr	r2, .L4+16
	ldr	r3, .L4+20
	strh	lr, [ip]	@ movhi
	strh	r1, [r2]	@ movhi
	ldr	ip, .L4+24
	ldr	lr, .L4+28
	ldr	r2, .L4+32
	strh	r0, [r3]	@ movhi
	add	r1, r1, #31744
	ldr	r3, .L4+36
	add	r0, r0, #65536
	strh	lr, [ip]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #30
	mov	r4, #180
	mov	lr, #100
	mov	ip, #15
	mov	r0, #73
	mov	r1, #113
	mov	r2, #1
	ldr	r5, .L4+40
	str	r3, [r5]
	ldr	r5, .L4+44
	str	r3, [r5]
	ldr	r5, .L4+48
	str	r3, [r5]
	ldr	r5, .L4+52
	str	r3, [r5]
	ldr	r5, .L4+56
	str	r3, [r5]
	ldr	r5, .L4+60
	str	r3, [r5]
	ldr	r3, .L4+64
	str	r4, [r3]
	ldr	r3, .L4+68
	str	r4, [r3]
	ldr	r3, .L4+72
	str	lr, [r3]
	ldr	r3, .L4+76
	str	lr, [r3]
	ldr	r3, .L4+80
	ldr	lr, .L4+84
	str	ip, [r3]
	ldr	r4, .L4+88
	ldr	r3, .L4+92
	str	ip, [lr]
	str	r0, [r3]
	ldr	lr, .L4+96
	str	r0, [r4]
	ldr	ip, .L4+100
	ldr	r0, .L4+104
	ldr	r3, .L4+108
	str	r1, [lr]
	str	r1, [ip]
	str	r2, [r0]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	pColor
	.word	67109120
	.word	c2Color
	.word	c3Color
	.word	bgColor
	.word	c1Color
	.word	31775
	.word	c4Color
	.word	fillScreen
	.word	cHeight
	.word	cWidth
	.word	c1Row
	.word	c1Col
	.word	c2Row
	.word	c4Col
	.word	c2Col
	.word	c3Col
	.word	c3Row
	.word	c4Row
	.word	pWidth
	.word	pHeight
	.word	pRow
	.word	pOldRow
	.word	pCol
	.word	pOldCol
	.word	pRDel
	.word	pCDel
	.size	initialize, .-initialize
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Player has moved!\000"
	.align	2
.LC1:
	.ascii	"Current Position: (%d, %d)\000"
	.text
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L45
	ldrh	r3, [r3]
	tst	r3, #1
	sub	sp, sp, #20
	beq	.L7
	ldr	r2, .L45+4
	ldrh	r2, [r2]
	ands	r2, r2, #1
	ldreq	r1, .L45+8
	strheq	r2, [r1]	@ movhi
.L7:
	tst	r3, #2
	beq	.L8
	ldr	r3, .L45+4
	ldrh	r3, [r3]
	tst	r3, #2
	moveq	r2, #31744
	ldreq	r3, .L45+8
	strheq	r2, [r3]	@ movhi
.L8:
	ldr	r5, .L45+12
	ldr	r0, [r5]
	cmp	r0, #0
	movlt	r3, #0
	ldrlt	r2, .L45+16
	strlt	r0, [r2]
	movlt	r0, r3
	ldr	r6, .L45+20
	ldr	r2, [r6]
	strlt	r3, [r5]
	add	r3, r2, r0
	cmp	r3, #240
	ldr	r4, .L45+24
	ldrgt	r3, .L45+16
	ldr	r1, [r4]
	strgt	r0, [r3]
	rsbgt	r0, r2, #240
	strgt	r0, [r5]
	cmp	r1, #0
	movlt	r3, #0
	ldrlt	r10, .L45+28
	strlt	r1, [r10]
	movlt	r1, r3
	ldr	r7, .L45+32
	strlt	r3, [r4]
	ldr	r3, [r7]
	add	ip, r3, r1
	ldrge	r10, .L45+28
	cmp	ip, #160
	ldr	ip, .L45+36
	ldrh	lr, [ip, #48]
	strgt	r1, [r10]
	rsbgt	r1, r3, #160
	strgt	r1, [r4]
	tst	lr, #64
	subeq	r1, r1, #1
	streq	r1, [r4]
	beq	.L14
	ldrh	lr, [ip, #48]
	tst	lr, #128
	addeq	r1, r1, #1
	streq	r1, [r4]
	bne	.L44
.L14:
	ldr	r9, .L45+40
	ldr	r8, .L45+44
	ldr	fp, [r9]
	ldr	lr, .L45+48
	ldr	ip, .L45+52
	ldr	lr, [lr]
	ldr	ip, [ip]
	str	fp, [sp, #12]
	ldr	fp, [r8]
	str	lr, [sp, #4]
	str	ip, [sp]
	str	fp, [sp, #8]
	ldr	fp, .L45+56
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldrne	r2, .L45+60
	ldrne	r3, .L45+8
	ldrhne	r2, [r2]
	strhne	r2, [r3]	@ movhi
	ldr	r2, .L45+64
	ldr	r3, .L45+68
	ldr	r0, [r2]
	ldr	r1, [r3]
	ldr	r2, [r9]
	ldr	r3, [r8]
	str	r0, [sp, #4]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	str	r1, [sp]
	ldr	r2, [r6]
	ldr	r3, [r7]
	ldr	r1, [r4]
	ldr	r0, [r5]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldrne	r2, .L45+72
	ldrne	r3, .L45+8
	ldrhne	r2, [r2]
	strhne	r2, [r3]	@ movhi
	ldr	r2, .L45+76
	ldr	r3, .L45+80
	ldr	r0, [r2]
	ldr	r1, [r3]
	ldr	r2, [r9]
	ldr	r3, [r8]
	str	r0, [sp, #4]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	str	r1, [sp]
	ldr	r2, [r6]
	ldr	r3, [r7]
	ldr	r1, [r4]
	ldr	r0, [r5]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldrne	r2, .L45+84
	ldrne	r3, .L45+8
	ldrhne	r2, [r2]
	ldr	r0, .L45+88
	ldr	r1, .L45+92
	strhne	r2, [r3]	@ movhi
	ldr	r0, [r0]
	ldr	r1, [r1]
	ldr	r2, [r9]
	ldr	r3, [r8]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	str	r0, [sp, #4]
	str	r1, [sp]
	ldr	r2, [r6]
	ldr	r3, [r7]
	ldr	r1, [r4]
	ldr	r0, [r5]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldrne	r2, .L45+96
	ldrne	r3, .L45+8
	ldrhne	r2, [r2]
	strhne	r2, [r3]	@ movhi
	ldr	r2, [r10]
	ldr	r3, [r4]
	cmp	r2, r3
	bne	.L21
	ldr	r2, .L45+16
	ldr	r3, [r5]
	ldr	r2, [r2]
	cmp	r2, r3
	beq	.L6
.L21:
	ldr	r0, .L45+100
	ldr	r3, .L45+104
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	mov	r0, #4
	ldr	r2, [r5]
	ldr	r1, .L45+108
	ldr	r4, .L45+112
	mov	lr, pc
	bx	r4
.L6:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L44:
	ldrh	lr, [ip, #48]
	tst	lr, #32
	subeq	r0, r0, #1
	streq	r0, [r5]
	beq	.L14
	ldrh	ip, [ip, #48]
	tst	ip, #16
	addeq	r0, r0, #1
	streq	r0, [r5]
	b	.L14
.L46:
	.align	2
.L45:
	.word	oldButtons
	.word	buttons
	.word	pColor
	.word	pCol
	.word	pOldCol
	.word	pWidth
	.word	pRow
	.word	pOldRow
	.word	pHeight
	.word	67109120
	.word	cHeight
	.word	cWidth
	.word	c1Row
	.word	c1Col
	.word	collision
	.word	c1Color
	.word	c2Row
	.word	c2Col
	.word	c2Color
	.word	c3Row
	.word	c3Col
	.word	c3Color
	.word	c4Row
	.word	c4Col
	.word	c4Color
	.word	.LC0
	.word	mgba_printf
	.word	.LC1
	.word	mgba_printf_level
	.size	update, .-update
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L53
	ldrh	r3, [r3, #48]
	ldr	r6, .L53+4
	ldr	r5, .L53+8
	tst	r3, #4
	ldr	r2, [r6]
	ldr	r3, [r5]
	sub	sp, sp, #8
	bne	.L51
	ldr	r10, .L53+12
	ldr	r9, .L53+16
	ldr	r4, .L53+20
.L48:
	ldr	r1, .L53+24
	ldr	r8, .L53+28
	ldrh	r1, [r1]
	ldr	r7, .L53+32
	str	r1, [sp]
	ldr	r0, [r7]
	ldr	r1, [r8]
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+36
	ldrh	r3, [r3]
	ldr	r6, .L53+40
	str	r3, [sp]
	ldr	r5, .L53+44
	ldr	r1, .L53+48
	ldr	r0, .L53+52
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+56
	ldrh	r3, [r3]
	ldr	r1, .L53+60
	str	r3, [sp]
	ldr	r0, .L53+64
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+68
	ldrh	r3, [r3]
	ldr	r1, .L53+72
	str	r3, [sp]
	ldr	r0, .L53+76
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+80
	ldrh	ip, [r3]
	ldr	r2, [r5]
	ldr	r3, [r6]
	ldr	r1, .L53+84
	str	ip, [sp]
	ldr	r0, .L53+88
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r2, [r8]
	ldr	r3, [r7]
	str	r2, [r10]
	str	r3, [r9]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L51:
	ldr	r1, .L53+92
	ldr	r10, .L53+12
	ldrh	r1, [r1]
	ldr	r9, .L53+16
	str	r1, [sp]
	ldr	r0, [r9]
	ldr	r1, [r10]
	ldr	r4, .L53+20
	mov	lr, pc
	bx	r4
	ldr	r2, [r6]
	ldr	r3, [r5]
	b	.L48
.L54:
	.align	2
.L53:
	.word	67109120
	.word	pWidth
	.word	pHeight
	.word	pOldRow
	.word	pOldCol
	.word	drawRect
	.word	pColor
	.word	pRow
	.word	pCol
	.word	c1Color
	.word	cHeight
	.word	cWidth
	.word	c1Row
	.word	c1Col
	.word	c2Color
	.word	c2Row
	.word	c2Col
	.word	c3Color
	.word	c3Row
	.word	c3Col
	.word	c4Color
	.word	c4Row
	.word	c4Col
	.word	bgColor
	.size	draw, .-draw
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"Debugging Initialized\000"
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
	push	{r7, lr}
	ldr	r3, .L58
	mov	lr, pc
	bx	r3
	ldr	r0, .L58+4
	ldr	r3, .L58+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+12
	mov	lr, pc
	bx	r3
	ldr	r9, .L58+16
	ldr	r4, .L58+20
	ldr	r8, .L58+24
	ldr	r7, .L58+28
	ldr	r6, .L58+32
	ldr	r5, .L58+36
.L56:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	b	.L56
.L59:
	.align	2
.L58:
	.word	mgba_open
	.word	.LC2
	.word	mgba_printf
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	67109120
	.size	main, .-main
	.comm	pColor,2,2
	.comm	pWidth,4,4
	.comm	pHeight,4,4
	.comm	pCDel,4,4
	.comm	pRDel,4,4
	.comm	pOldCol,4,4
	.comm	pOldRow,4,4
	.comm	pCol,4,4
	.comm	pRow,4,4
	.comm	c4Color,2,2
	.comm	c4Col,4,4
	.comm	c4Row,4,4
	.comm	c3Color,2,2
	.comm	c3Col,4,4
	.comm	c3Row,4,4
	.comm	c2Color,2,2
	.comm	c2Col,4,4
	.comm	c2Row,4,4
	.comm	c1Color,2,2
	.comm	c1Col,4,4
	.comm	c1Row,4,4
	.comm	cWidth,4,4
	.comm	cHeight,4,4
	.comm	bgColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
