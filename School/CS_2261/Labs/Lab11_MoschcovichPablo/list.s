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
	.file	"list.c"
	.text
	.align	2
	.global	create_list
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	create_list, %function
create_list:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L8
	push	{r4, lr}
	mov	r0, #8
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	movne	r3, #0
	strne	r3, [r0]
	strne	r3, [r0, #4]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	malloc
	.size	create_list, .-create_list
	.align	2
	.global	push_front
	.syntax unified
	.arm
	.fpu softvfp
	.type	push_front, %function
push_front:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	sub	sp, sp, #8
	add	r3, sp, #8
	stmdb	r3, {r1, r2}
	mov	r4, r0
	ldr	r3, .L18
	mov	r0, #16
	ldr	r6, [sp]
	ldr	r5, [sp, #4]
	mov	lr, pc
	bx	r3
	subs	r3, r0, #0
	movne	r2, #0
	strne	r2, [r3, #4]
	strne	r2, [r3]
	ldr	r2, [r4]
	strne	r6, [r3, #8]
	strne	r5, [r3, #12]
	cmp	r2, #0
	strne	r2, [r3, #4]
	streq	r3, [r4, #4]
	strne	r3, [r2]
	str	r3, [r4]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	malloc
	.size	push_front, .-push_front
	.align	2
	.global	push_back
	.syntax unified
	.arm
	.fpu softvfp
	.type	push_back, %function
push_back:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	sub	sp, sp, #8
	add	r3, sp, #8
	stmdb	r3, {r1, r2}
	mov	r4, r0
	ldr	r3, .L28
	mov	r0, #16
	ldr	r6, [sp]
	ldr	r5, [sp, #4]
	mov	lr, pc
	bx	r3
	subs	r3, r0, #0
	movne	r2, #0
	strne	r2, [r3]
	strne	r2, [r3, #4]
	ldr	r2, [r4]
	strne	r6, [r3, #8]
	strne	r5, [r3, #12]
	cmp	r2, #0
	ldrne	r2, [r4, #4]
	streq	r3, [r4]
	strne	r2, [r3]
	strne	r3, [r2, #4]
	str	r3, [r4, #4]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	malloc
	.size	push_back, .-push_back
	.align	2
	.global	pop_front
	.syntax unified
	.arm
	.fpu softvfp
	.type	pop_front, %function
pop_front:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r0, [r1]
	cmp	r0, #0
	streq	r0, [r4]
	streq	r0, [r4, #4]
	beq	.L30
	ldr	r3, [r0, #4]
	cmp	r3, #0
	movne	r2, #0
	add	r5, r0, #8
	ldm	r5, {r5, r6}
	str	r3, [r1]
	streq	r3, [r1, #4]
	strne	r2, [r3]
	ldr	r3, .L36
	mov	lr, pc
	bx	r3
	stm	r4, {r5, r6}
.L30:
	mov	r0, r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	free
	.size	pop_front, .-pop_front
	.align	2
	.global	pop_back
	.syntax unified
	.arm
	.fpu softvfp
	.type	pop_back, %function
pop_back:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r1]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	beq	.L39
	ldr	r0, [r1, #4]
	cmp	r0, #0
	beq	.L39
	ldr	r3, [r0]
	cmp	r3, #0
	movne	r2, #0
	add	r5, r0, #8
	ldm	r5, {r5, r6}
	str	r3, [r1, #4]
	streq	r3, [r1]
	strne	r2, [r3, #4]
	ldr	r3, .L48
	mov	lr, pc
	bx	r3
	mov	r0, r4
	stm	r4, {r5, r6}
	pop	{r4, r5, r6, lr}
	bx	lr
.L39:
	mov	r3, #0
	mov	r0, r4
	str	r3, [r4]
	str	r3, [r4, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	free
	.size	pop_back, .-pop_back
	.align	2
	.global	size
	.syntax unified
	.arm
	.fpu softvfp
	.type	size, %function
size:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L53
	mov	r0, #0
.L52:
	ldr	r3, [r3, #4]
	cmp	r3, #0
	add	r0, r0, #1
	bne	.L52
	bx	lr
.L53:
	mov	r0, r3
	bx	lr
	.size	size, .-size
	.align	2
	.global	empty_list
	.syntax unified
	.arm
	.fpu softvfp
	.type	empty_list, %function
empty_list:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	mov	r4, r0
	sub	sp, sp, #8
.L58:
	mov	r1, r4
	mov	r0, sp
	bl	pop_front
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L58
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
	.size	empty_list, .-empty_list
	.align	2
	.global	updateNodePositions
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateNodePositions, %function
updateNodePositions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #4]
	cmp	r2, #0
	bxeq	lr
.L68:
	ldr	r3, [r2]
	cmp	r3, #0
	bxeq	lr
	add	r0, r3, #8
	ldm	r0, {r0, r1}
	add	ip, r2, #8
	stm	ip, {r0, r1}
	mov	r2, r3
	b	.L68
	.size	updateNodePositions, .-updateNodePositions
	.ident	"GCC: (devkitARM release 53) 9.1.0"
