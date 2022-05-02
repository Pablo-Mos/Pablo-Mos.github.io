@ This is how you comment in ARM assembly
	.cpu arm7tdmi		@ GBA's CPU is the ARM7-TDMI
	.text				@ put this where Code goes (int the GBA ROM)
	.align	2			@ word aligned
	.global	drawStuff	@ declare drawStuff global (so main can call it)
	.arch armv4t		@ arm architecture setting for the GBA
	.syntax unified
	.arm				@ arm has two code flavors -- ARM and THUMB
	.fpu softvfp		@ Use software-defined floating point for calculations

VBUFF:  .word   0x06000000 @ TODO 1.1 Fill in the Video Buffer Address (hex or decimal works here)
WHITE:	.word	32767
RED:	.word	31
GREEN: 	.word	992
BLUE:	.word	31744
MYCOLOR:	.word	873	@ TODO 1.2 Pick your own color (replacing zero!)

	.type	drawStuff, %function
drawStuff:
	push	{fp, lr}	@ Store the frame pointer and the link register (r14) on the stack 
	add	fp, sp, #4		@ Set the frame pointer to the stack pointer + 4

	@ TODO 1.3 Remove (or comment out) the top-left pixel drawing -- it just confirms the VBUFFER worked
	@ldr	r3, VBUFF		@ load L2 into r3
	@ldrh r2, WHITE
	@strh r2, [r3]		@ store the half-word in r2 into the half-word pointed to by r3
	@add	r3, r3, #2		@ r3+=2 (next pixel)
	@ldrh	r2, RED
	@strh r2, [r3]
	@add	r3, r3, #2		@ r3+=2 (next pixel)
	@ldrh r2, GREEN
	@strh r2, [r3]
	@add	r3, r3, #2		@ r3+=2 (next pixel)
	@ldrh r2, BLUE
	@strh r2, [r3]
	@add	r3, r3, #2		@ r3+=2 (next pixel)
	@ldrh r2, MYCOLOR
	@strh r2, [r3]
	@ END TODO 1.3

	mov r4, #0			@ loop var (i)
vline1loop:
	mov r3, #0			@ r3 is address of pixel -- we need to calculate it
	add	r3, r3, #22		@ y=22
	add r3, r3, r4		@ y += r4 (i)
	mov r2, #240		@ r2 for offset calc (remember: 240*y + x)
	mul r12, r3, r2		@ y*240 into r12
	add r3, r12, #50	@ Add x=50 back into r3
	mov r12, r3			@ copy so we can multiply
	mov r2, #2			@ set r2 to 2
	mul r3, r12, r2		@ multiply by 2 because of pixel byte size
	ldr r12, VBUFF
	add r3, r3, r12		@ VBUFF + 2*(240*y + x)
	ldrh r2, MYCOLOR		@ Now set [r3] to MYCOLOR using r2
	strh r2, [r3]
	@ TODO: 1.4 i++; (remember r4 is i)
	add r4, r4, #1
	cmp r4, #20			@ Compare i to 20
	@ TODO: 1.5 loop again if i < 20 -- b{condition} LBLNAME
	b vline1loop

@ TODO 2.0 Add a horizontal line at x,y = 50,42 of length 20 using the loop above as reference
@ TODO 3.0 Add a diagonal line to close the triangle

@ TODO 4.0 Draw a rectangle in the size/shape/color of your choosing (not overlapping the triangle and in a _new_ custom color).
@          This rectangle must be filled in -- a double for loop might be helpful here!

@ TODO 5.0 Draw a letter (e.g.: X, Y, Z) in the size/shape/color of your choosing (not overlapping the triangle and in a _new_ custom color).

	sub	sp, fp, #4		@ set the stack pointer to the frame pointer -4
	pop	{fp, lr}		@ restore the frame pointer and the link register from the stack
	bx	lr				@ return to main
