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
	.global	checkIfRowIsFilled
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkIfRowIsFilled, %function
checkIfRowIsFilled:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	lsl	r1, r0, #5
	ldr	ip, .L7
	add	r3, r1, #1
	add	r1, r1, #13
.L3:
	lsl	r2, r3, #1
	ldrh	r0, [ip, r2]
	cmp	r0, #0
	add	r3, r3, #1
	bxeq	lr
	cmp	r3, r1
	bne	.L3
	mov	r0, #1
	bx	lr
.L8:
	.align	2
.L7:
	.word	100694016
	.size	checkIfRowIsFilled, .-checkIfRowIsFilled
	.align	2
	.global	clearRow
	.syntax unified
	.arm
	.fpu softvfp
	.type	clearRow, %function
clearRow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r3, .L16
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L16+4
	ldr	r3, .L16+8
	mov	lr, pc
	bx	r3
	cmp	r4, #0
	ble	.L9
	sub	r4, r4, #1
	lsl	r4, r4, #5
	ldr	r1, .L16+12
	add	r5, r4, #32
	add	ip, r4, #13
.L12:
	mov	r3, r4
	sub	lr, r5, r4
.L11:
	lsl	r2, r3, #1
	ldrh	r0, [r1, r2]
	add	r2, lr, r3
	add	r3, r3, #1
	lsl	r2, r2, #1
	cmp	r3, ip
	strh	r0, [r1, r2]	@ movhi
	bne	.L11
	sub	r4, r4, #32
	cmn	r4, #32
	sub	r5, r5, #32
	sub	ip, ip, #32
	bne	.L12
.L9:
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	rowClearSound_length
	.word	rowClearSound_data
	.word	playSoundB
	.word	100694016
	.size	clearRow, .-clearRow
	.align	2
	.global	addPiecesToBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	addPiecesToBackground, %function
addPiecesToBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #0
	ldr	r1, .L28
	ldr	r3, .L28+4
	ldr	r2, .L28+8
	ldr	ip, .L28+12
	ldr	r1, [r1]
	ldr	r3, [r3]
	ldr	r0, .L28+16
	ldr	r2, [r2]
	ldr	ip, [ip]
	add	r3, r3, r1, lsl #2
	ldr	r4, .L28+20
	add	r0, r0, r3, lsl #6
	add	ip, ip, r2, lsl #5
.L19:
	mov	r3, #0
.L21:
	ldr	r2, [r0, r3, lsl #4]
	cmp	r2, #0
	addne	r1, ip, r3, lsl #5
	lslne	r1, r1, #1
	add	r3, r3, #1
	strhne	r2, [r4, r1]	@ movhi
	cmp	r3, #4
	bne	.L21
	add	lr, lr, #1
	cmp	lr, #4
	add	ip, ip, #1
	add	r0, r0, #4
	bne	.L19
	pop	{r4, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	currentTetreminoType
	.word	currentTetreminoRotation
	.word	currentTetreminoRow
	.word	currentTetreminoCol
	.word	collisionMaps
	.word	100694016
	.size	addPiecesToBackground, .-addPiecesToBackground
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePieces.part.0, %function
updatePieces.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r0, r2
	mov	r4, r2
	ldr	r5, .L47
	ldr	r7, .L47+4
	ldr	r8, .L47+8
	ldr	r6, .L47+12
	ldr	r10, [r5]
	ldr	lr, [r8]
	ldr	r9, [r7]
	ldr	r3, [r6]
	ldr	r1, .L47+16
	ldr	ip, .L47+20
	add	r3, r3, lr, lsl #2
	add	r9, r9, r10, lsl #5
	str	r2, [r1]
	ldr	lr, .L47+24
	add	r9, r9, #32
	add	ip, ip, r3, lsl #6
	add	fp, r10, #1
.L31:
	mov	r3, #0
	add	r2, r9, r4
.L33:
	lsl	r1, r2, #1
	ldrh	r1, [lr, r1]
	cmp	r1, #0
	beq	.L32
	ldr	r1, [ip, r3, lsl #4]
	cmp	r1, #0
	movne	r0, #1
.L32:
	add	r3, r3, #1
	cmp	r3, #4
	add	r2, r2, #32
	bne	.L33
	add	r4, r4, #1
	cmp	r4, #4
	add	ip, ip, #4
	bne	.L31
	cmp	r0, #1
	strne	fp, [r5]
	beq	.L45
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L45:
	cmp	r10, #0
	beq	.L46
.L36:
	bl	addPiecesToBackground
	ldr	r3, .L47+28
	mov	lr, pc
	bx	r3
	mov	r1, #0
	mov	ip, #5
	ldr	r2, .L47+32
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #2
	rsb	r3, r3, r3, lsl #3
	sub	r0, r0, r3
	str	r0, [r8]
	str	ip, [r7]
	str	r1, [r5]
	str	r1, [r6]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L46:
	ldr	r3, .L47+36
	mov	lr, pc
	bx	r3
	b	.L36
.L48:
	.align	2
.L47:
	.word	currentTetreminoRow
	.word	currentTetreminoCol
	.word	currentTetreminoType
	.word	currentTetreminoRotation
	.word	.LANCHOR0
	.word	collisionMaps
	.word	100694016
	.word	rand
	.word	-1840700269
	.word	goToLose
	.size	updatePieces.part.0, .-updatePieces.part.0
	.align	2
	.global	checkForRowClear
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkForRowClear, %function
checkForRowClear:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #13
	mov	r6, #0
	ldr	r5, .L62
	ldr	r8, .L62+4
	ldr	r7, .L62+8
.L50:
	sub	r3, r4, #12
.L53:
	lsl	r2, r3, #1
	ldrh	r2, [r5, r2]
	cmp	r2, #0
	add	r3, r3, #1
	beq	.L52
	cmp	r3, r4
	bne	.L53
	mov	r0, r6
	bl	clearRow
	ldr	r3, [r8, #4]
	add	r3, r3, #1
	cmp	r3, #4
	str	r3, [r8, #4]
	bgt	.L61
.L52:
	add	r6, r6, #1
	cmp	r6, #19
	add	r4, r4, #32
	bne	.L50
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L61:
	mov	lr, pc
	bx	r7
	b	.L52
.L63:
	.align	2
.L62:
	.word	100694016
	.word	.LANCHOR0
	.word	goToWin
	.size	checkForRowClear, .-checkForRowClear
	.align	2
	.global	rotatePiecesCCW
	.syntax unified
	.arm
	.fpu softvfp
	.type	rotatePiecesCCW, %function
rotatePiecesCCW:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	push	{r4, r5, r6, r7, lr}
	ldr	r7, .L78
	ldr	r5, [r7]
	subs	r5, r5, #1
	movmi	r5, #3
	mov	r4, r0
	ldr	r3, .L78+4
	ldr	r2, .L78+8
	ldr	r1, .L78+12
	ldr	r3, [r3]
	ldr	ip, .L78+16
	ldr	r2, [r2]
	ldr	r6, [r1]
	add	r3, r5, r3, lsl #2
	ldr	lr, .L78+20
	add	ip, ip, r3, lsl #6
	add	r6, r6, r2, lsl #5
.L66:
	mov	r3, #0
	add	r2, r4, r6
.L68:
	lsl	r1, r2, #1
	ldrh	r1, [lr, r1]
	cmp	r1, #0
	beq	.L67
	ldr	r1, [ip, r3, lsl #4]
	cmp	r1, #0
	movne	r0, #1
.L67:
	add	r3, r3, #1
	cmp	r3, #4
	add	r2, r2, #32
	bne	.L68
	add	r4, r4, #1
	cmp	r4, #4
	add	ip, ip, #4
	bne	.L66
	cmp	r0, #0
	streq	r5, [r7]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	currentTetreminoRotation
	.word	currentTetreminoType
	.word	currentTetreminoRow
	.word	currentTetreminoCol
	.word	collisionMaps
	.word	100694016
	.size	rotatePiecesCCW, .-rotatePiecesCCW
	.align	2
	.global	rotatePiecesCW
	.syntax unified
	.arm
	.fpu softvfp
	.type	rotatePiecesCW, %function
rotatePiecesCW:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	push	{r4, r5, r6, r7, lr}
	mov	r4, r0
	ldr	r7, .L93
	ldr	r5, [r7]
	ldr	r3, .L93+4
	add	r5, r5, #1
	subs	r2, r0, r5
	ldr	lr, .L93+8
	ldr	r1, .L93+12
	and	r2, r2, #3
	ldr	r3, [r3]
	and	r5, r5, #3
	ldr	ip, .L93+16
	rsbpl	r5, r2, #0
	ldr	r6, [r1]
	ldr	r2, [lr]
	add	r3, r5, r3, lsl #2
	ldr	lr, .L93+20
	add	ip, ip, r3, lsl #6
	add	r6, r6, r2, lsl #5
.L81:
	mov	r3, #0
	add	r2, r4, r6
.L83:
	lsl	r1, r2, #1
	ldrh	r1, [lr, r1]
	cmp	r1, #0
	beq	.L82
	ldr	r1, [ip, r3, lsl #4]
	cmp	r1, #0
	movne	r0, #1
.L82:
	add	r3, r3, #1
	cmp	r3, #4
	add	r2, r2, #32
	bne	.L83
	add	r4, r4, #1
	cmp	r4, #4
	add	ip, ip, #4
	bne	.L81
	cmp	r0, #0
	streq	r5, [r7]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	currentTetreminoRotation
	.word	currentTetreminoType
	.word	currentTetreminoRow
	.word	currentTetreminoCol
	.word	collisionMaps
	.word	100694016
	.size	rotatePiecesCW, .-rotatePiecesCW
	.align	2
	.global	updatePieces
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePieces, %function
updatePieces:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L100
	ldr	r3, [r2]
	cmp	r3, #9
	bgt	updatePieces.part.0
.L99:
	add	r3, r3, #1
	str	r3, [r2]
	bx	lr
.L101:
	.align	2
.L100:
	.word	.LANCHOR0
	.size	updatePieces, .-updatePieces
	.align	2
	.global	updatePieceSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePieceSprites, %function
updatePieceSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	ldr	r1, .L112
	ldr	r3, .L112+4
	ldr	ip, [r1]
	ldr	r3, [r3]
	ldr	r1, .L112+8
	add	r3, r3, ip, lsl #2
	add	r6, ip, #1
	add	ip, r1, r3, lsl #6
	mov	r1, r5
	ldr	r2, .L112+12
	ldr	r0, .L112+16
	ldr	r2, [r2]
	lsl	r6, r6, #16
	lsl	r2, r2, #19
	ldrh	r8, [r0]
	ldr	r4, .L112+20
	lsr	r6, r6, #16
	lsr	r2, r2, #16
.L103:
	mov	r3, #0
.L105:
	ldr	r0, [ip, r3, lsl #4]
	cmp	r0, #0
	beq	.L104
	add	r0, r8, r3
	add	lr, r4, r1, lsl #3
	lsl	r7, r1, #3
	lsl	r0, r0, #3
	strh	r0, [r4, r7]	@ movhi
	strh	r2, [lr, #2]	@ movhi
	strh	r6, [lr, #4]	@ movhi
	add	r1, r1, #1
.L104:
	add	r3, r3, #1
	cmp	r3, #4
	bne	.L105
	add	r2, r2, #8
	add	r5, r5, #1
	lsl	r2, r2, #16
	cmp	r5, #4
	lsr	r2, r2, #16
	add	ip, ip, #4
	bne	.L103
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L113:
	.align	2
.L112:
	.word	currentTetreminoType
	.word	currentTetreminoRotation
	.word	collisionMaps
	.word	currentTetreminoCol
	.word	currentTetreminoRow
	.word	shadowOAM
	.size	updatePieceSprites, .-updatePieceSprites
	.align	2
	.global	checkForCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkForCollision, %function
checkForCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #0
	ldr	r4, .L126
	add	r4, r4, r0, lsl #6
	mov	r0, r5
	ldr	r6, .L126+4
	add	r2, r1, r2, lsl #5
.L115:
	mov	r3, #0
	add	ip, r5, r2
.L117:
	lsl	lr, ip, #1
	ldrh	lr, [r6, lr]
	cmp	lr, #0
	beq	.L116
	ldr	lr, [r4, r3, lsl #4]
	cmp	lr, #0
	movne	r0, #1
.L116:
	add	r3, r3, #1
	cmp	r3, #4
	add	ip, ip, #32
	bne	.L117
	add	r5, r5, #1
	cmp	r5, #4
	add	r4, r4, #4
	bne	.L115
	pop	{r4, r5, r6, lr}
	bx	lr
.L127:
	.align	2
.L126:
	.word	collisionMaps
	.word	100694016
	.size	checkForCollision, .-checkForCollision
	.align	2
	.global	spawnTetremino
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnTetremino, %function
spawnTetremino:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L130
	mov	lr, pc
	bx	r3
	mov	lr, #5
	mov	r1, #0
	ldr	r2, .L130+4
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #2
	rsb	r3, r3, r3, lsl #3
	ldr	r4, .L130+8
	sub	r0, r0, r3
	ldr	ip, .L130+12
	ldr	r2, .L130+16
	ldr	r3, .L130+20
	str	r0, [r4]
	str	lr, [ip]
	str	r1, [r2]
	str	r1, [r3]
	pop	{r4, lr}
	bx	lr
.L131:
	.align	2
.L130:
	.word	rand
	.word	-1840700269
	.word	currentTetreminoType
	.word	currentTetreminoCol
	.word	currentTetreminoRow
	.word	currentTetreminoRotation
	.size	spawnTetremino, .-spawnTetremino
	.align	2
	.global	startGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	startGame, %function
startGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, lr}
	ldr	r5, .L136
	ldr	r4, [r5]
	ldr	r3, .L136+4
	cmp	r4, r2
	str	r2, [r3, #4]
	beq	.L135
	pop	{r4, r5, r6, lr}
	bx	lr
.L135:
	ldr	r3, .L136+8
	mov	lr, pc
	bx	r3
	mov	r1, #5
	ldr	r3, .L136+12
	smull	r2, r3, r0, r3
	add	r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	rsb	r3, r3, r3, lsl #3
	sub	r0, r0, r3
	ldr	ip, .L136+16
	ldr	r2, .L136+20
	ldr	r3, .L136+24
	str	r4, [r5]
	str	r4, [r3]
	str	r0, [ip]
	str	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L137:
	.align	2
.L136:
	.word	currentTetreminoRow
	.word	.LANCHOR0
	.word	rand
	.word	-1840700269
	.word	currentTetreminoType
	.word	currentTetreminoCol
	.word	currentTetreminoRotation
	.size	startGame, .-startGame
	.align	2
	.global	setupGameboard
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupGameboard, %function
setupGameboard:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, lr}
	ldr	r2, .L158
	add	r0, r2, #2048
.L139:
	sub	r3, r2, #64
.L140:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L140
	add	r2, r3, #64
	cmp	r2, r0
	bne	.L139
	ldr	r2, .L158+4
	ldr	r1, .L158+8
	sub	r3, r2, #1280
.L142:
	strh	r1, [r3], #64	@ movhi
	cmp	r3, r2
	bne	.L142
	ldr	r3, .L158+12
	ldr	r1, .L158+8
.L143:
	strh	r1, [r3, #26]	@ movhi
	add	r3, r3, #64
	cmp	r3, r2
	bne	.L143
	ldr	r3, .L158+12
	ldr	r1, .L158+8
.L144:
	strh	r1, [r3, #58]	@ movhi
	add	r3, r3, #64
	cmp	r3, r2
	bne	.L144
	ldr	r3, .L158+16
	ldr	r1, .L158+8
	add	r2, r3, #60
.L145:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L145
	ldr	r3, .L158+20
	ldr	r1, .L158+8
	add	r2, r3, #34
.L146:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L146
	ldr	r2, .L158+24
	ldr	r1, .L158+28
	add	r0, r2, #30
.L147:
	sub	r3, r2, #1152
.L148:
	strh	r1, [r3, #64]!	@ movhi
	cmp	r3, r2
	bne	.L148
	add	r2, r3, #2
	cmp	r2, r0
	bne	.L147
	ldr	r4, .L158+32
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L158+36
	ldr	r1, .L158+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L159:
	.align	2
.L158:
	.word	gameboard+62
	.word	gameboard+1280
	.word	4104
	.word	gameboard
	.word	gameboard+1214
	.word	gameboard+24
	.word	gameboard+1180
	.word	4105
	.word	DMANow
	.word	100694016
	.size	setupGameboard, .-setupGameboard
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L205
	ldrh	r3, [r4]
	tst	r3, #2
	beq	.L161
	ldr	r2, .L205+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L203
.L161:
	tst	r3, #1
	beq	.L162
	ldr	r3, .L205+4
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L204
.L162:
	ldr	r2, .L205+8
	ldr	r3, [r2]
	cmp	r3, #9
	addle	r3, r3, #1
	strle	r3, [r2]
	blgt	updatePieces.part.0
.L164:
	bl	checkForRowClear
	ldrh	r6, [r4]
	tst	r6, #32
	beq	.L165
	ldr	r3, .L205+4
	ldrh	r1, [r3]
	ands	r1, r1, #32
	bne	.L165
	mov	r5, r1
	ldr	lr, .L205+12
	ldr	r0, .L205+16
	ldr	r2, .L205+20
	ldr	r3, .L205+24
	ldr	r7, [lr]
	ldr	r9, [r0]
	ldr	r2, [r2]
	ldr	r3, [r3]
	ldr	ip, .L205+28
	add	r9, r7, r9, lsl #5
	add	r3, r3, r2, lsl #2
	ldr	r4, .L205+32
	sub	r9, r9, #1
	add	ip, ip, r3, lsl #6
	sub	r8, r7, #1
.L166:
	mov	r3, #0
	add	r2, r9, r5
.L168:
	lsl	r0, r2, #1
	ldrh	r0, [r4, r0]
	cmp	r0, #0
	beq	.L167
	ldr	r0, [ip, r3, lsl #4]
	cmp	r0, #0
	movne	r1, #1
.L167:
	add	r3, r3, #1
	cmp	r3, #4
	add	r2, r2, #32
	bne	.L168
	add	r5, r5, #1
	cmp	r5, #4
	add	ip, ip, #4
	bne	.L166
	eor	r1, r1, #1
	cmp	r7, #0
	movle	r1, #0
	andgt	r1, r1, #1
	cmp	r1, #0
	strne	r8, [lr]
.L165:
	tst	r6, #16
	beq	.L160
	ldr	r3, .L205+4
	ldrh	r0, [r3]
	ands	r0, r0, #16
	bne	.L160
	mov	r5, r0
	ldr	ip, .L205+16
	ldr	lr, .L205+12
	ldr	r1, .L205+20
	ldr	r2, .L205+24
	ldr	r3, [lr]
	ldr	r6, [ip]
	ldr	r1, [r1]
	ldr	r2, [r2]
	ldr	ip, .L205+28
	add	r6, r3, r6, lsl #5
	add	r2, r2, r1, lsl #2
	ldr	r4, .L205+32
	add	r6, r6, #1
	add	r7, r3, #1
	add	ip, ip, r2, lsl #6
.L171:
	mov	r3, #0
	add	r2, r6, r5
.L173:
	lsl	r1, r2, #1
	ldrh	r1, [r4, r1]
	cmp	r1, #0
	beq	.L172
	ldr	r1, [ip, r3, lsl #4]
	cmp	r1, #0
	movne	r0, #1
.L172:
	add	r3, r3, #1
	cmp	r3, #4
	add	r2, r2, #32
	bne	.L173
	add	r5, r5, #1
	cmp	r5, #4
	add	ip, ip, #4
	bne	.L171
	cmp	r0, #0
	streq	r7, [lr]
.L160:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L204:
	bl	rotatePiecesCCW
	b	.L162
.L203:
	bl	rotatePiecesCW
	ldrh	r3, [r4]
	b	.L161
.L206:
	.align	2
.L205:
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.word	currentTetreminoCol
	.word	currentTetreminoRow
	.word	currentTetreminoType
	.word	currentTetreminoRotation
	.word	collisionMaps
	.word	100694016
	.size	updateGame, .-updateGame
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	bl	updatePieceSprites
	mov	r3, #160
	mov	lr, #40
	mov	r0, #3
	mov	r8, #48
	mov	r2, #56
	mov	r7, #64
	mov	ip, #72
	mov	r5, #168
	mov	r4, #176
	ldr	r1, .L209
	add	r6, r1, #640
	strh	lr, [r6]	@ movhi
	strh	r3, [r6, #2]	@ movhi
	add	r6, r1, #644
	strh	r0, [r6]	@ movhi
	add	r6, r1, #652
	strh	r0, [r6]	@ movhi
	add	r6, r1, #660
	strh	r0, [r6]	@ movhi
	add	r6, r1, #668
	strh	r0, [r6]	@ movhi
	add	r6, r1, #676
	strh	r0, [r6]	@ movhi
	add	r6, r1, #684
	strh	r0, [r6]	@ movhi
	add	r6, r1, #692
	strh	r0, [r6]	@ movhi
	add	r6, r1, #700
	strh	r0, [r6]	@ movhi
	add	r6, r1, #708
	strh	r0, [r6]	@ movhi
	add	r6, r1, #716
	strh	r0, [r6]	@ movhi
	add	r6, r1, #648
	strh	r3, [r6, #2]	@ movhi
	strh	r8, [r6]	@ movhi
	add	r6, r1, #656
	strh	r3, [r6, #2]	@ movhi
	strh	r2, [r6]	@ movhi
	add	r6, r1, #664
	strh	r3, [r6, #2]	@ movhi
	strh	r7, [r6]	@ movhi
	add	r6, r1, #672
	strh	r3, [r6, #2]	@ movhi
	strh	ip, [r6]	@ movhi
	add	r7, r1, #688
	add	r6, r1, #696
	strh	lr, [r7]	@ movhi
	strh	r5, [r7, #2]	@ movhi
	add	r8, r1, #680
	strh	lr, [r6]	@ movhi
	strh	r4, [r6, #2]	@ movhi
	add	r7, r1, #704
	add	r6, r1, #712
	strh	lr, [r8]	@ movhi
	strh	r3, [r8, #2]	@ movhi
	add	lr, r1, #720
	strh	r2, [r7]	@ movhi
	strh	r3, [r7, #2]	@ movhi
	strh	r2, [r6]	@ movhi
	strh	r5, [r6, #2]	@ movhi
	add	r7, r1, #724
	add	r6, r1, #728
	strh	r2, [lr]	@ movhi
	strh	r4, [lr, #2]	@ movhi
	add	r2, r1, #736
	strh	r0, [r7]	@ movhi
	add	lr, r1, #744
	strh	r3, [r6, #2]	@ movhi
	strh	ip, [r6]	@ movhi
	add	r8, r1, #732
	add	r7, r1, #740
	add	r6, r1, #748
	strh	r0, [r8]	@ movhi
	mov	r3, #512
	strh	r5, [r2, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	ldr	r5, .L209+4
	strh	r0, [r7]	@ movhi
	mov	r2, #117440512
	strh	ip, [lr]	@ movhi
	strh	r4, [lr, #2]	@ movhi
	strh	r0, [r6]	@ movhi
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L210:
	.align	2
.L209:
	.word	shadowOAM
	.word	DMANow
	.size	drawGame, .-drawGame
	.global	skipFrames
	.global	linesCleared
	.comm	currentTetreminoRow,4,4
	.comm	currentTetreminoCol,4,4
	.comm	currentTetreminoRotation,4,4
	.comm	currentTetreminoType,4,4
	.comm	gameboard,2048,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	skipFrames, %object
	.size	skipFrames, 4
skipFrames:
	.space	4
	.type	linesCleared, %object
	.size	linesCleared, 4
linesCleared:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
