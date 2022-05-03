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
	.global	frame1
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame1, %function
frame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r0, #64512
	ldr	r3, .L44
	ldr	ip, [r3]
	add	r1, ip, #33792
	add	r2, ip, #38656
	push	{r4, r5, r6, r7, lr}
	add	r1, r1, #78
	add	lr, r2, #14
.L2:
	sub	r3, r1, #20
.L3:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L3
	add	r1, r3, #480
	cmp	lr, r1
	bne	.L2
	mov	r1, #0
	ldr	r0, .L44+4
	add	r3, ip, #32768
	add	lr, ip, #34816
	strh	r0, [lr, #8]	@ movhi
	strh	r0, [lr, #10]	@ movhi
	add	lr, r3, #2528
	strh	r0, [lr, #8]	@ movhi
	strh	r0, [lr, #10]	@ movhi
	add	lr, r3, #2032
	strh	r0, [lr, #12]	@ movhi
	add	r4, ip, #36864
	strh	r0, [lr, #14]	@ movhi
	add	lr, r3, #2512
	strh	r0, [lr, #12]	@ movhi
	add	r3, r3, #3968
	strh	r0, [lr, #14]	@ movhi
	add	r0, r4, #352
	add	r4, r4, #356
	strh	r1, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	strh	r1, [r4]	@ movhi
	strh	r1, [r4, #2]	@ movhi
	mov	r4, #31
	add	lr, ip, #48128
	add	r0, lr, #152
	add	r1, r2, #24
.L5:
	sub	r3, r1, #40
.L6:
	strh	r4, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L6
	add	r1, r1, #480
	cmp	r0, r1
	bne	.L5
	mov	r4, #31
	add	r5, ip, #40960
	add	r6, r5, #140
	add	r1, r2, #44
.L9:
	sub	r3, r1, #20
.L8:
	strh	r4, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L8
	add	r1, r3, #480
	cmp	r1, r6
	bne	.L9
	mov	r6, #31
	add	r1, ip, #38400
	add	r4, r1, #240
	add	r7, r5, #80
.L10:
	sub	r3, r4, #20
.L11:
	strh	r6, [r3], #2	@ movhi
	cmp	r4, r3
	bne	.L11
	add	r4, r4, #480
	cmp	r7, r4
	bne	.L10
	mvn	r4, #64512
	add	r2, r2, #54
	add	r6, r5, #150
.L14:
	sub	r3, r2, #10
.L13:
	strh	r4, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L13
	add	r2, r2, #480
	cmp	r6, r2
	bne	.L14
	add	r2, r1, #220
	mvn	r1, #64512
	add	r5, r5, #60
.L15:
	sub	r3, r2, #10
.L16:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L16
	add	r2, r2, #480
	cmp	r5, r2
	bne	.L15
	mov	r4, #31744
	add	r2, ip, #52992
	add	lr, lr, #122
	add	r1, r2, #58
.L19:
	sub	r3, lr, #10
.L18:
	strh	r4, [r3], #2	@ movhi
	cmp	lr, r3
	bne	.L18
	add	lr, lr, #480
	cmp	lr, r1
	bne	.L19
	mov	lr, #31744
	add	r2, r2, #88
.L20:
	sub	r3, r0, #10
.L21:
	strh	lr, [r3], #2	@ movhi
	cmp	r0, r3
	bne	.L21
	add	r0, r0, #480
	cmp	r2, r0
	bne	.L20
	mvn	r0, #32768
	add	ip, ip, #55296
	add	lr, ip, #184
.L24:
	sub	r3, r2, #10
.L23:
	strh	r0, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L23
	add	r2, r2, #480
	cmp	lr, r2
	bne	.L24
	mvn	r2, #32768
	add	r0, ip, #154
.L25:
	sub	r3, r1, #10
.L26:
	strh	r2, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L26
	add	r1, r1, #480
	cmp	r0, r1
	bne	.L25
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	.LANCHOR0
	.word	32736
	.size	frame1, .-frame1
	.align	2
	.global	frame1DEL
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame1DEL, %function
frame1DEL:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r4, #0
	ldr	r3, .L88
	ldr	ip, [r3]
	add	r1, ip, #33792
	add	r2, ip, #38656
	add	r1, r1, #78
	add	r0, r2, #14
.L47:
	sub	r3, r1, #20
.L48:
	strh	r4, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L48
	add	r1, r3, #480
	cmp	r0, r1
	bne	.L47
	add	r3, ip, #32768
	add	r0, ip, #34816
	strh	r4, [r0, #8]	@ movhi
	add	lr, r3, #2528
	strh	r4, [r0, #10]	@ movhi
	add	r1, ip, #36864
	add	r0, r3, #2032
	strh	r4, [lr, #8]	@ movhi
	strh	r4, [lr, #10]	@ movhi
	strh	r4, [r0, #12]	@ movhi
	add	lr, r3, #2512
	strh	r4, [r0, #14]	@ movhi
	add	r3, r3, #3968
	add	r0, r1, #352
	add	r1, r1, #356
	strh	r4, [lr, #12]	@ movhi
	strh	r4, [lr, #14]	@ movhi
	strh	r4, [r3]	@ movhi
	strh	r4, [r3, #2]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	strh	r4, [r3, #6]	@ movhi
	strh	r4, [r0]	@ movhi
	strh	r4, [r0, #2]	@ movhi
	strh	r4, [r1]	@ movhi
	strh	r4, [r1, #2]	@ movhi
	mov	r4, #0
	add	lr, ip, #48128
	add	r0, lr, #152
	add	r1, r2, #24
.L50:
	sub	r3, r1, #40
.L51:
	strh	r4, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L51
	add	r1, r1, #480
	cmp	r0, r1
	bne	.L50
	mov	r4, #0
	add	r5, ip, #40960
	add	r6, r5, #140
	add	r1, r2, #44
.L54:
	sub	r3, r1, #20
.L53:
	strh	r4, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L53
	add	r1, r3, #480
	cmp	r1, r6
	bne	.L54
	mov	r6, #0
	add	r1, ip, #38400
	add	r4, r1, #240
	add	r7, r5, #80
.L55:
	sub	r3, r4, #20
.L56:
	strh	r6, [r3], #2	@ movhi
	cmp	r4, r3
	bne	.L56
	add	r4, r4, #480
	cmp	r7, r4
	bne	.L55
	mov	r4, #0
	add	r2, r2, #54
	add	r6, r5, #150
.L59:
	sub	r3, r2, #10
.L58:
	strh	r4, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L58
	add	r2, r2, #480
	cmp	r6, r2
	bne	.L59
	add	r2, r1, #220
	mov	r1, #0
	add	r5, r5, #60
.L60:
	sub	r3, r2, #10
.L61:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L61
	add	r2, r2, #480
	cmp	r5, r2
	bne	.L60
	mov	r4, #0
	add	r2, ip, #52992
	add	lr, lr, #122
	add	r1, r2, #58
.L64:
	sub	r3, lr, #10
.L63:
	strh	r4, [r3], #2	@ movhi
	cmp	lr, r3
	bne	.L63
	add	lr, lr, #480
	cmp	lr, r1
	bne	.L64
	mov	lr, #0
	add	r2, r2, #88
.L65:
	sub	r3, r0, #10
.L66:
	strh	lr, [r3], #2	@ movhi
	cmp	r0, r3
	bne	.L66
	add	r0, r0, #480
	cmp	r2, r0
	bne	.L65
	mov	r0, #0
	add	ip, ip, #55296
	add	lr, ip, #184
.L69:
	sub	r3, r2, #10
.L68:
	strh	r0, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L68
	add	r2, r2, #480
	cmp	lr, r2
	bne	.L69
	mov	r2, #0
	add	r0, ip, #154
.L70:
	sub	r3, r1, #10
.L71:
	strh	r2, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L71
	add	r1, r1, #480
	cmp	r0, r1
	bne	.L70
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	.LANCHOR0
	.size	frame1DEL, .-frame1DEL
	.align	2
	.global	frame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame2, %function
frame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r1, #64512
	ldr	r3, .L132
	push	{r4, r5, r6, lr}
	ldr	lr, [r3]
	add	r2, lr, #33792
	add	r5, lr, #38656
	add	r2, r2, #68
	add	r0, r5, #4
.L91:
	sub	r3, r2, #20
.L92:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L92
	add	r2, r3, #480
	cmp	r0, r2
	bne	.L91
	mov	r1, #0
	ldr	r2, .L132+4
	add	r3, lr, #32768
	add	r4, r3, #2032
	add	ip, r3, #2512
	add	r6, r3, #2016
	strh	r2, [r4, #10]	@ movhi
	add	r0, lr, #36864
	strh	r2, [r4, #12]	@ movhi
	strh	r2, [ip, #10]	@ movhi
	strh	r2, [ip, #12]	@ movhi
	strh	r2, [r6, #14]	@ movhi
	strh	r2, [r4]	@ movhi
	add	r4, r3, #2496
	strh	r2, [r4, #14]	@ movhi
	add	r3, r3, #3952
	strh	r2, [ip]	@ movhi
	add	r6, r0, #336
	add	r2, r0, #340
	add	r4, r0, #344
	strh	r1, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	r1, [r6, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	r1, [r4]	@ movhi
	mov	r1, #31
	add	ip, lr, #48128
	add	r0, ip, #142
	add	r2, r5, #14
.L94:
	sub	r3, r2, #40
.L95:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L95
	add	r2, r2, #480
	cmp	r0, r2
	bne	.L94
	add	r5, r5, #34
	mov	r2, r5
	mov	r1, #31
	add	r4, lr, #40960
	add	r6, r4, #130
.L98:
	sub	r3, r2, #20
.L97:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L97
	add	r2, r3, #480
	cmp	r2, r6
	bne	.L98
	mov	r1, #31
	add	r6, lr, #38400
	add	r4, r4, #70
	add	r2, r6, #230
.L99:
	sub	r3, r2, #20
.L100:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L100
	add	r2, r2, #480
	cmp	r4, r2
	bne	.L99
	mvn	r4, #64512
	add	r2, lr, #36096
	add	r1, r2, #194
.L103:
	sub	r3, r1, #10
.L102:
	strh	r4, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L102
	add	r1, r1, #480
	cmp	r5, r1
	bne	.L103
	mvn	r1, #64512
	add	r2, r2, #124
	add	r6, r6, #220
.L104:
	sub	r3, r2, #10
.L105:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L105
	add	r2, r2, #480
	cmp	r6, r2
	bne	.L104
	mov	r4, #31744
	add	r2, lr, #52992
	add	ip, ip, #112
	add	r1, r2, #48
.L108:
	sub	r3, ip, #10
.L107:
	strh	r4, [r3], #2	@ movhi
	cmp	ip, r3
	bne	.L107
	add	ip, ip, #480
	cmp	ip, r1
	bne	.L108
	mov	ip, #31744
	add	r2, r2, #78
.L109:
	sub	r3, r0, #10
.L110:
	strh	ip, [r3], #2	@ movhi
	cmp	r0, r3
	bne	.L110
	add	r0, r0, #480
	cmp	r2, r0
	bne	.L109
	mvn	r0, #32768
	add	lr, lr, #55296
	add	ip, lr, #174
.L113:
	sub	r3, r2, #16
.L112:
	strh	r0, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L112
	add	r2, r2, #480
	cmp	ip, r2
	bne	.L113
	mvn	r2, #32768
	add	r0, lr, #144
.L114:
	sub	r3, r1, #16
.L115:
	strh	r2, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L115
	add	r1, r1, #480
	cmp	r0, r1
	bne	.L114
	pop	{r4, r5, r6, lr}
	bx	lr
.L133:
	.align	2
.L132:
	.word	.LANCHOR0
	.word	32736
	.size	frame2, .-frame2
	.align	2
	.global	frame2DEL
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame2DEL, %function
frame2DEL:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	ldr	r3, .L176
	push	{r4, r5, r6, r7, lr}
	ldr	lr, [r3]
	add	r2, lr, #33792
	add	r5, lr, #38656
	add	r2, r2, #68
	add	r0, r5, #4
.L135:
	sub	r3, r2, #20
.L136:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L136
	add	r2, r3, #480
	cmp	r0, r2
	bne	.L135
	add	r3, lr, #32768
	add	ip, r3, #2032
	add	r0, r3, #2512
	add	r4, r3, #2016
	strh	r1, [ip, #10]	@ movhi
	add	r2, lr, #36864
	strh	r1, [ip, #12]	@ movhi
	strh	r1, [r0, #10]	@ movhi
	strh	r1, [r0, #12]	@ movhi
	strh	r1, [r4, #14]	@ movhi
	add	r4, r3, #2496
	strh	r1, [ip]	@ movhi
	add	r3, r3, #3952
	strh	r1, [r4, #14]	@ movhi
	add	r6, r2, #340
	add	r7, r2, #336
	add	r4, r2, #344
	strh	r1, [r0]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	r1, [r7, #2]	@ movhi
	strh	r1, [r6]	@ movhi
	strh	r1, [r6, #2]	@ movhi
	strh	r1, [r4]	@ movhi
	mov	r1, #0
	add	ip, lr, #48128
	add	r0, ip, #142
	add	r2, r5, #14
.L138:
	sub	r3, r2, #40
.L139:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L139
	add	r2, r2, #480
	cmp	r0, r2
	bne	.L138
	add	r5, r5, #34
	mov	r2, r5
	mov	r1, #0
	add	r4, lr, #40960
	add	r6, r4, #130
.L142:
	sub	r3, r2, #20
.L141:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L141
	add	r2, r3, #480
	cmp	r2, r6
	bne	.L142
	mov	r1, #0
	add	r6, lr, #38400
	add	r4, r4, #70
	add	r2, r6, #230
.L143:
	sub	r3, r2, #20
.L144:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L144
	add	r2, r2, #480
	cmp	r4, r2
	bne	.L143
	mov	r4, #0
	add	r2, lr, #36096
	add	r1, r2, #194
.L147:
	sub	r3, r1, #10
.L146:
	strh	r4, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L146
	add	r1, r1, #480
	cmp	r5, r1
	bne	.L147
	mov	r1, #0
	add	r2, r2, #124
	add	r6, r6, #220
.L148:
	sub	r3, r2, #10
.L149:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L149
	add	r2, r2, #480
	cmp	r6, r2
	bne	.L148
	mov	r4, #0
	add	r2, lr, #52992
	add	ip, ip, #112
	add	r1, r2, #48
.L152:
	sub	r3, ip, #10
.L151:
	strh	r4, [r3], #2	@ movhi
	cmp	ip, r3
	bne	.L151
	add	ip, ip, #480
	cmp	ip, r1
	bne	.L152
	mov	ip, #0
	add	r2, r2, #78
.L153:
	sub	r3, r0, #10
.L154:
	strh	ip, [r3], #2	@ movhi
	cmp	r0, r3
	bne	.L154
	add	r0, r0, #480
	cmp	r2, r0
	bne	.L153
	mov	r0, #0
	add	lr, lr, #55296
	add	ip, lr, #174
.L157:
	sub	r3, r2, #16
.L156:
	strh	r0, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L156
	add	r2, r2, #480
	cmp	ip, r2
	bne	.L157
	mov	r2, #0
	add	r0, lr, #144
.L158:
	sub	r3, r1, #16
.L159:
	strh	r2, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L159
	add	r1, r1, #480
	cmp	r0, r1
	bne	.L158
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L177:
	.align	2
.L176:
	.word	.LANCHOR0
	.size	frame2DEL, .-frame2DEL
	.align	2
	.global	frame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame3, %function
frame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r1, #64512
	ldr	r3, .L220
	ldr	ip, [r3]
	push	{r4, r5, r6, lr}
	add	r4, ip, #24064
	add	r6, ip, #28928
	add	r2, r4, #206
	add	r0, r6, #142
.L179:
	sub	r3, r2, #20
.L180:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L180
	add	r2, r3, #480
	cmp	r0, r2
	bne	.L179
	mov	r2, #0
	ldr	r1, .L220+4
	add	r3, ip, #24576
	add	r0, r3, #648
	add	lr, r3, #1120
	strh	r1, [r0]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	strh	r1, [lr, #8]	@ movhi
	add	r0, r3, #636
	strh	r1, [lr, #10]	@ movhi
	add	lr, r3, #1104
	strh	r1, [r0]	@ movhi
	add	r3, r3, #3040
	strh	r1, [r0, #2]	@ movhi
	strh	r1, [lr, #12]	@ movhi
	add	r0, ip, #27136
	strh	r1, [lr, #14]	@ movhi
	add	lr, r6, #152
	strh	r2, [r0]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	strh	r2, [r0, #6]	@ movhi
	strh	r2, [r3]	@ movhi
	mov	r0, #31
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	mov	r2, lr
	add	r1, ip, #38656
	add	r1, r1, #24
.L182:
	sub	r3, r2, #40
.L183:
	strh	r0, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L183
	add	r2, r2, #480
	cmp	r1, r2
	bne	.L182
	add	r5, r4, #186
	mov	r2, r5
	mov	r0, #31
	add	r6, r6, #122
.L186:
	sub	r3, r2, #10
.L185:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L185
	add	r2, r3, #480
	cmp	r2, r6
	bne	.L186
	add	r4, r4, #216
	mov	r2, r4
	mov	r0, #31
.L187:
	sub	r3, r2, #10
.L188:
	strh	r0, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L188
	add	r2, r2, #480
	cmp	lr, r2
	bne	.L187
	mvn	lr, #64512
	add	r2, ip, #21760
	add	r0, r2, #90
.L191:
	sub	r3, r0, #10
.L190:
	strh	lr, [r3], #2	@ movhi
	cmp	r0, r3
	bne	.L190
	add	r0, r0, #480
	cmp	r5, r0
	bne	.L191
	mvn	r0, #64512
	add	r2, r2, #120
.L192:
	sub	r3, r2, #10
.L193:
	strh	r0, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L193
	add	r2, r2, #480
	cmp	r4, r2
	bne	.L192
	mov	r4, #31744
	add	lr, ip, #38400
	add	r2, ip, #43264
	add	lr, lr, #250
	add	r0, r2, #186
.L196:
	sub	r3, lr, #10
.L195:
	strh	r4, [r3], #2	@ movhi
	cmp	lr, r3
	bne	.L195
	add	lr, lr, #480
	cmp	lr, r0
	bne	.L196
	mov	lr, #31744
	add	r2, r2, #216
.L197:
	sub	r3, r1, #10
.L198:
	strh	lr, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L198
	add	r1, r1, #480
	cmp	r2, r1
	bne	.L197
	mvn	r1, #32768
	add	ip, ip, #45824
	add	lr, ip, #56
.L201:
	sub	r3, r2, #10
.L200:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L200
	add	r2, r2, #480
	cmp	lr, r2
	bne	.L201
	mvn	r2, #32768
	add	r1, ip, #26
.L202:
	sub	r3, r0, #10
.L203:
	strh	r2, [r3], #2	@ movhi
	cmp	r0, r3
	bne	.L203
	add	r0, r0, #480
	cmp	r1, r0
	bne	.L202
	pop	{r4, r5, r6, lr}
	bx	lr
.L221:
	.align	2
.L220:
	.word	.LANCHOR0
	.word	32736
	.size	frame3, .-frame3
	.align	2
	.global	frame3DEL
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame3DEL, %function
frame3DEL:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	ldr	r3, .L264
	ldr	ip, [r3]
	push	{r4, r5, r6, lr}
	add	r4, ip, #24064
	add	r6, ip, #28928
	add	r2, r4, #206
	add	r1, r6, #142
.L223:
	sub	r3, r2, #20
.L224:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L224
	add	r2, r3, #480
	cmp	r1, r2
	bne	.L223
	add	r3, ip, #24576
	add	r1, r3, #648
	add	r2, r3, #1120
	add	lr, r3, #636
	strh	r0, [r1]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	add	r1, r3, #1104
	strh	r0, [r2, #10]	@ movhi
	add	r3, r3, #3040
	strh	r0, [lr]	@ movhi
	add	r2, ip, #27136
	strh	r0, [lr, #2]	@ movhi
	add	lr, r6, #152
	strh	r0, [r1, #12]	@ movhi
	strh	r0, [r1, #14]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	strh	r0, [r2, #6]	@ movhi
	strh	r0, [r3]	@ movhi
	mov	r2, lr
	strh	r0, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r0, [r3, #6]	@ movhi
	mov	r0, #0
	add	r1, ip, #38656
	add	r1, r1, #24
.L226:
	sub	r3, r2, #40
.L227:
	strh	r0, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L227
	add	r2, r2, #480
	cmp	r1, r2
	bne	.L226
	add	r5, r4, #186
	mov	r2, r5
	mov	r0, #0
	add	r6, r6, #122
.L230:
	sub	r3, r2, #10
.L229:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L229
	add	r2, r3, #480
	cmp	r2, r6
	bne	.L230
	add	r4, r4, #216
	mov	r2, r4
	mov	r0, #0
.L231:
	sub	r3, r2, #10
.L232:
	strh	r0, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L232
	add	r2, r2, #480
	cmp	lr, r2
	bne	.L231
	mov	lr, #0
	add	r2, ip, #21760
	add	r0, r2, #90
.L235:
	sub	r3, r0, #10
.L234:
	strh	lr, [r3], #2	@ movhi
	cmp	r0, r3
	bne	.L234
	add	r0, r0, #480
	cmp	r5, r0
	bne	.L235
	mov	r0, #0
	add	r2, r2, #120
.L236:
	sub	r3, r2, #10
.L237:
	strh	r0, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L237
	add	r2, r2, #480
	cmp	r4, r2
	bne	.L236
	mov	r4, #0
	add	lr, ip, #38400
	add	r2, ip, #43264
	add	lr, lr, #250
	add	r0, r2, #186
.L240:
	sub	r3, lr, #10
.L239:
	strh	r4, [r3], #2	@ movhi
	cmp	lr, r3
	bne	.L239
	add	lr, lr, #480
	cmp	lr, r0
	bne	.L240
	mov	lr, #0
	add	r2, r2, #216
.L241:
	sub	r3, r1, #10
.L242:
	strh	lr, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L242
	add	r1, r1, #480
	cmp	r2, r1
	bne	.L241
	mov	r1, #0
	add	ip, ip, #45824
	add	lr, ip, #56
.L245:
	sub	r3, r2, #10
.L244:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L244
	add	r2, r2, #480
	cmp	lr, r2
	bne	.L245
	mov	r2, #0
	add	r1, ip, #26
.L246:
	sub	r3, r0, #10
.L247:
	strh	r2, [r3], #2	@ movhi
	cmp	r0, r3
	bne	.L247
	add	r0, r0, #480
	cmp	r1, r0
	bne	.L246
	pop	{r4, r5, r6, lr}
	bx	lr
.L265:
	.align	2
.L264:
	.word	.LANCHOR0
	.size	frame3DEL, .-frame3DEL
	.align	2
	.global	frame4
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame4, %function
frame4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r1, #64512
	ldr	r3, .L308
	ldr	ip, [r3]
	push	{r4, r5, r6, lr}
	add	r2, ip, #33792
	add	r5, ip, #38656
	add	r2, r2, #88
	add	r0, r5, #24
.L267:
	sub	r3, r2, #20
.L268:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L268
	add	r2, r3, #480
	cmp	r0, r2
	bne	.L267
	mov	r0, #0
	ldr	r2, .L308+4
	add	r3, ip, #32768
	add	lr, r3, #2064
	strh	r2, [lr, #6]	@ movhi
	strh	r2, [lr, #8]	@ movhi
	add	lr, r3, #2544
	strh	r2, [lr, #6]	@ movhi
	strh	r2, [lr, #8]	@ movhi
	add	lr, ip, #34816
	strh	r2, [lr, #10]	@ movhi
	strh	r2, [lr, #12]	@ movhi
	add	lr, r3, #2528
	strh	r2, [lr, #10]	@ movhi
	add	r1, ip, #36864
	strh	r2, [lr, #12]	@ movhi
	add	lr, r3, #3968
	strh	r0, [lr, #14]	@ movhi
	add	r3, r3, #3984
	add	r4, r1, #368
	add	lr, r1, #372
	add	r6, r1, #364
	strh	r0, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r0, [r6, #2]	@ movhi
	strh	r0, [r4]	@ movhi
	strh	r0, [r4, #2]	@ movhi
	strh	r0, [lr]	@ movhi
	mov	lr, #31
	add	r1, ip, #48128
	add	r2, r1, #162
	add	r0, r5, #34
.L270:
	sub	r3, r0, #40
.L271:
	strh	lr, [r3], #2	@ movhi
	cmp	r0, r3
	bne	.L271
	add	r0, r0, #480
	cmp	r2, r0
	bne	.L270
	add	r5, r5, #54
	mov	r0, r5
	mov	lr, #31
	add	r4, ip, #40960
	add	r6, r4, #150
.L274:
	sub	r3, r0, #20
.L273:
	strh	lr, [r3], #2	@ movhi
	cmp	r3, r0
	bne	.L273
	add	r0, r3, #480
	cmp	r0, r6
	bne	.L274
	mov	lr, #31
	add	r6, ip, #38400
	add	r4, r4, #90
	add	r0, r6, #250
.L275:
	sub	r3, r0, #20
.L276:
	strh	lr, [r3], #2	@ movhi
	cmp	r0, r3
	bne	.L276
	add	r0, r0, #480
	cmp	r4, r0
	bne	.L275
	mvn	r4, #64512
	add	r0, ip, #36096
	add	lr, r0, #214
.L279:
	sub	r3, lr, #10
.L278:
	strh	r4, [r3], #2	@ movhi
	cmp	lr, r3
	bne	.L278
	add	lr, lr, #480
	cmp	r5, lr
	bne	.L279
	mvn	lr, #64512
	add	r0, r0, #144
	add	r6, r6, #240
.L280:
	sub	r3, r0, #10
.L281:
	strh	lr, [r3], #2	@ movhi
	cmp	r0, r3
	bne	.L281
	add	r0, r0, #480
	cmp	r6, r0
	bne	.L280
	mov	lr, #31744
	add	r0, ip, #52992
	add	r1, r1, #132
	add	r4, r0, #68
.L284:
	sub	r3, r1, #10
.L283:
	strh	lr, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L283
	add	r1, r1, #480
	cmp	r1, r4
	bne	.L284
	mov	r1, #31744
	add	lr, r0, #98
.L285:
	sub	r3, r2, #10
.L286:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L286
	add	r2, r2, #480
	cmp	lr, r2
	bne	.L285
	mvn	r1, #32768
	add	ip, ip, #55296
	add	lr, ip, #200
	add	r2, r0, #104
.L289:
	sub	r3, r2, #16
.L288:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L288
	add	r2, r2, #480
	cmp	lr, r2
	bne	.L289
	mvn	r1, #32768
	add	r2, r0, #74
	add	r0, ip, #170
.L290:
	sub	r3, r2, #16
.L291:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L291
	add	r2, r2, #480
	cmp	r0, r2
	bne	.L290
	pop	{r4, r5, r6, lr}
	bx	lr
.L309:
	.align	2
.L308:
	.word	.LANCHOR0
	.word	32736
	.size	frame4, .-frame4
	.align	2
	.global	frame4DEL
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame4DEL, %function
frame4DEL:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	ldr	r3, .L352
	ldr	ip, [r3]
	push	{r4, r5, r6, lr}
	add	r2, ip, #33792
	add	r5, ip, #38656
	add	r2, r2, #88
	add	r1, r5, #24
.L311:
	sub	r3, r2, #20
.L312:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L312
	add	r2, r3, #480
	cmp	r1, r2
	bne	.L311
	add	r3, ip, #32768
	add	r1, r3, #2064
	add	lr, r3, #2544
	strh	r0, [r1, #6]	@ movhi
	add	r2, ip, #36864
	strh	r0, [r1, #8]	@ movhi
	strh	r0, [lr, #6]	@ movhi
	add	r1, ip, #34816
	strh	r0, [lr, #8]	@ movhi
	add	lr, r3, #2528
	strh	r0, [r1, #10]	@ movhi
	add	r4, r2, #368
	strh	r0, [r1, #12]	@ movhi
	add	r6, r2, #364
	strh	r0, [lr, #10]	@ movhi
	add	r1, r3, #3968
	strh	r0, [lr, #12]	@ movhi
	add	r3, r3, #3984
	add	lr, r2, #372
	strh	r0, [r1, #14]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r0, [r6, #2]	@ movhi
	strh	r0, [r4]	@ movhi
	strh	r0, [r4, #2]	@ movhi
	strh	r0, [lr]	@ movhi
	mov	lr, #0
	add	r1, ip, #48128
	add	r2, r1, #162
	add	r0, r5, #34
.L314:
	sub	r3, r0, #40
.L315:
	strh	lr, [r3], #2	@ movhi
	cmp	r0, r3
	bne	.L315
	add	r0, r0, #480
	cmp	r2, r0
	bne	.L314
	add	r5, r5, #54
	mov	r0, r5
	mov	lr, #0
	add	r4, ip, #40960
	add	r6, r4, #150
.L318:
	sub	r3, r0, #20
.L317:
	strh	lr, [r3], #2	@ movhi
	cmp	r3, r0
	bne	.L317
	add	r0, r3, #480
	cmp	r0, r6
	bne	.L318
	mov	lr, #0
	add	r6, ip, #38400
	add	r4, r4, #90
	add	r0, r6, #250
.L319:
	sub	r3, r0, #20
.L320:
	strh	lr, [r3], #2	@ movhi
	cmp	r0, r3
	bne	.L320
	add	r0, r0, #480
	cmp	r4, r0
	bne	.L319
	mov	r4, #0
	add	r0, ip, #36096
	add	lr, r0, #214
.L323:
	sub	r3, lr, #10
.L322:
	strh	r4, [r3], #2	@ movhi
	cmp	lr, r3
	bne	.L322
	add	lr, lr, #480
	cmp	r5, lr
	bne	.L323
	mov	lr, #0
	add	r0, r0, #144
	add	r6, r6, #240
.L324:
	sub	r3, r0, #10
.L325:
	strh	lr, [r3], #2	@ movhi
	cmp	r0, r3
	bne	.L325
	add	r0, r0, #480
	cmp	r6, r0
	bne	.L324
	mov	lr, #0
	add	r0, ip, #52992
	add	r1, r1, #132
	add	r4, r0, #68
.L328:
	sub	r3, r1, #10
.L327:
	strh	lr, [r3], #2	@ movhi
	cmp	r1, r3
	bne	.L327
	add	r1, r1, #480
	cmp	r1, r4
	bne	.L328
	mov	r1, #0
	add	lr, r0, #98
.L329:
	sub	r3, r2, #10
.L330:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L330
	add	r2, r2, #480
	cmp	lr, r2
	bne	.L329
	mov	r1, #0
	add	ip, ip, #55296
	add	lr, ip, #200
	add	r2, r0, #104
.L333:
	sub	r3, r2, #16
.L332:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L332
	add	r2, r2, #480
	cmp	lr, r2
	bne	.L333
	mov	r1, #0
	add	r2, r0, #74
	add	r0, ip, #170
.L334:
	sub	r3, r2, #16
.L335:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L335
	add	r2, r2, #480
	cmp	r0, r2
	bne	.L334
	pop	{r4, r5, r6, lr}
	bx	lr
.L353:
	.align	2
.L352:
	.word	.LANCHOR0
	.size	frame4DEL, .-frame4DEL
	.align	2
	.global	drawCurrFrame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCurrFrame, %function
drawCurrFrame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	push	{r4, lr}
.L355:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L355
	mov	r2, #67108864
.L356:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L356
	ldr	r2, .L369
	ldr	r3, [r2]
	cmp	r3, #3
	movgt	r3, #0
	strgt	r3, [r2]
	ble	.L366
.L358:
	bl	frame2DEL
	bl	frame3DEL
	bl	frame4DEL
	pop	{r4, lr}
	b	frame1
.L366:
	cmp	r3, #0
	movlt	r3, #3
	strlt	r3, [r2]
	blt	.L360
	beq	.L358
	cmp	r3, #1
	beq	.L367
	cmp	r3, #2
	beq	.L368
.L360:
	bl	frame1DEL
	bl	frame2DEL
	bl	frame3DEL
	pop	{r4, lr}
	b	frame4
.L367:
	bl	frame1DEL
	bl	frame3DEL
	bl	frame4DEL
	pop	{r4, lr}
	b	frame2
.L368:
	bl	frame1DEL
	bl	frame2DEL
	bl	frame4DEL
	pop	{r4, lr}
	b	frame3
.L370:
	.align	2
.L369:
	.word	.LANCHOR1
	.size	drawCurrFrame, .-drawCurrFrame
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
	ldr	r2, .L383
	ldr	r4, .L383+4
	ldr	r8, .L383+8
	push	{r7, lr}
	ldr	r6, .L383+12
	strh	r2, [r3]	@ movhi
	mov	lr, pc
	bx	r6
	ldr	r7, .L383+16
	ldrh	r2, [r4]
	ldr	r1, [r8]
	ldr	r5, .L383+20
	b	.L372
.L382:
	tst	r3, #1
	add	r0, r1, #1
	bne	.L373
	str	r0, [r8]
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	ldr	r1, [r8]
.L374:
	mov	r2, r3
.L372:
	strh	r2, [r7]	@ movhi
	ldrh	r3, [r5, #48]
	tst	r2, #1
	strh	r3, [r4]	@ movhi
	bne	.L382
.L373:
	tst	r2, #2
	beq	.L374
	tst	r3, #2
	bne	.L374
	sub	r1, r1, #1
	str	r1, [r8]
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	ldr	r1, [r8]
	b	.L374
.L384:
	.align	2
.L383:
	.word	1027
	.word	buttons
	.word	.LANCHOR1
	.word	drawCurrFrame
	.word	oldButtons
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	setPixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L386
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L387:
	.align	2
.L386:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L389:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L389
	mov	r2, #67108864
.L390:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L390
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	drawRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	subs	lr, r3, #0
	ldrh	ip, [sp, #8]
	ble	.L394
	ldr	r3, .L402
	rsb	r1, r1, r1, lsl #4
	add	r0, r0, r1, lsl #4
	ldr	r1, [r3]
	add	r3, r0, r2
	mov	r0, #0
	rsb	r4, r2, r2, lsl #31
	add	r1, r1, r3, lsl #1
	lsl	r4, r4, #1
.L396:
	cmp	r2, #0
	addgt	r3, r1, r4
	ble	.L399
.L397:
	strh	ip, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L397
.L399:
	add	r0, r0, #1
	cmp	lr, r0
	add	r1, r1, #480
	bne	.L396
.L394:
	pop	{r4, lr}
	bx	lr
.L403:
	.align	2
.L402:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.global	c
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	c, %object
	.size	c, 4
c:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
