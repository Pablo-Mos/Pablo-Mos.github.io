	.cpu arm7tdmi			@ What CPU we're using
	.eabi_attribute 20, 1	@ A bunch of cryptic CPU-related setup for the assembler 
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"		@ metadata
	.text					@ this belongs in the area of memory for code (the ROM)
	.section	.text.startup,"ax",%progbits	@ this code belongs where the program start goes
	.align	2				@ align on 2^N byte boundaries -- word aligned on the GBA
	.global	main			@ main is global
	.arch armv4t			@ which ARM architecture
	.syntax unified			@ Which ARM syntax variant we're using
	.arm					@ 32-bit code, not THUMB
	.fpu softvfp			@ software - virtual floating point unit
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0x04000000		@ set R2 to the display controller's address
	ldr	r1, .L5				@ Load the mode 4 with BG2 enabled value into r1
	push	{r4, lr}		@ Push r4 and the link register onto the stack (in case we mess with them?)
	ldr	r3, .L5+4			@ Load drawStuff address into r3
	strh	r1, [r2]		@ Put the half-word of r1 into the place pointed to by r2 (*REG_DISPCNT = 1027)
	mov	lr, pc				@ store the program counter in the link register (we're about to call a function)
	bx	r3					@ jump into drawStuff
.L2:
	b	.L2					@ while 1!
	.align	2
.L5:
	.word	1027			@ MODE3 | BG2_ENABLED
	.word	drawStuff		@ It exists _somewhere_ and the linker will fill this in for us later
	.size	main, .-main
	.ident	"GCC: (devkitARM release 49) 8.1.0"
