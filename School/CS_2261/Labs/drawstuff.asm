@ This is how you comment in ARM assembly
	.cpu arm7tdmi		@ GBA's CPU is the ARM7-TDMI
	.text				@ put this where Code goes (int the GBA ROM)
	.align	2			@ word aligned
	.global	drawStuff	@ declare drawStuff global (so main can call it)
	.arch armv4t		@ arm architecture setting for the GBA
	.syntax unified
	.arm				@ arm has two code flavors -- ARM and THUMB
	.fpu softvfp		@ Use software-defined floating point for calculations
@Named variables!
VBUFF:  .word  0x06000000
WHITE:  .word  32767
RED:    .word  31
GREEN:  .word  992
BLUE:   .word  31744

	.type	drawStuff, %function
drawStuff:
	push	{fp, lr}		@ Store the frame pointer and the link register (r14) on the stack 
	add	fp, sp, #4		@ Set the frame pointer to the stack pointer + 4
	ldr	r3, VBUFF		@ load VBUFF into r3
	@ mov r2, #31		@ store red in r2
	@ add r2, r2, #992		@ add green to r2
	@ add r2, r2, #31744	@ add blue to r2
	@ this alternative is equivalent to the 3 lines above (and faster!) -- written by the compiler for me once!
	@ mvn	r2, #32768		@ move and negate (bit-flip) 1000 0000 0000 0000 into r2 -- only can do 1 byte, but it's clever
	@ yet another alternative using a named location in memory
	ldr r2, WHITE
	strh r2, [r3]		@ store the half-word in r2 into the half-word pointed to by r3
	add	r3, r3, #2		@ r3+=2 (next pixel)
	ldr	r2, RED
	strh r2, [r3]
	add	r3, r3, #2		@ r3+=2 (next pixel)
	ldr r2, GREEN
	strh r2, [r3]
	add	r3, r3, #2		@ r3+=2 (next pixel)
	ldr r2, BLUE
	strh r2, [r3]
	sub	sp, fp, #4		@ set the stack pointer to the frame pointer -4
	pop	{fp, lr}		@ restore the frame pointer and the link register from the stack
	bx	lr			@ return to main

