@ This is how you comment in ARM assembly
	.cpu arm7tdmi		@ GBA's CPU is the ARM7-TDMI
	.text				@ put this where Code goes (int the GBA ROM)
	.align	2			@ word aligned
	.global	drawStuff2	@ declare drawStuff global (so main can call it)
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
BLACK:  .word  0

	.type	drawStuff2, %function
drawStuff2:
	push	{fp, lr}		@ Store the frame pointer and the link register (r14) on the stack 
	add	fp, sp, #4		@ Set the frame pointer to the stack pointer + 4
	ldr	r3, VBUFF		@ load VBUFF into r3

  mov r0, #0     @ setting up initial variable y = 0
loop:
	cmp r0, #160       @ checking if y==160   for (int i=0; i<160; i++)
	beq end            @ proceeding to the end if y==160

	@ loop contents
	mov r1, #0         @ x = 0

	innerloop:
	  cmp r1, #240
		beq endinnerloop

		add r2, r1, r0		@ r2 = x+y
		and r2, r2, #1    @ r2 = x & 1
		cmp r2, #1        @ r2 == 1
		beq ifodd
	ifeven:
		ldr	r2, RED
		mov r12, #240    @ r12 = 240
		mul r12, r0, r12 @ r12 = y * r12 (240)
		add	r12, r12, r1 @ r12 = r12 + x
		lsl r12, #1      @ r12 *= 2 
		add r12, r12, r3 @ r12 += VBUFF
		strh r2, [r12]   @ *r12 = r2
		b iterateinnerloop
	ifodd:
		ldr	r2, BLACK
		mov r12, #240    @ r12 = 240
		mul r12, r0, r12 @ r12 = y * r12 (240)
		add	r12, r12, r1 @ r12 = r12 + x
		lsl r12, #1      @ r12 *= 2 
		add r12, r12, r3 @ r12 += VBUFF
		strh r2, [r12]   @ *r12 = r2
	iterateinnerloop:
	  add r1, r1, #1   @ x++
	  b innerloop             @ repeating the loop	  
	endinnerloop:
		add r0, r0, #1     @ increasing a by 1 if the jump to the end did not occur
		b loop
end:
	bx lr              @ THE END

	sub	sp, fp, #4		@ set the stack pointer to the frame pointer -4
	pop	{fp, lr}		@ restore the frame pointer and the link register from the stack
	bx	lr			@ return to main

