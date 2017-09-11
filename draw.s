	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"draw.c"
	.text
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L5
	mov	r3, #0
.L2:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L2
	bx	lr
.L6:
	.align	2
.L5:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	updateOAM
	.type	updateOAM, %function
updateOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L20
	str	r4, [sp, #-4]!
	ldr	r4, [r3, #8]
	ldr	r1, [r3, #60]
	ldr	r0, [r3, #0]
	ldr	ip, [r3, #48]
	ldr	r2, [r3, #56]
	orr	r1, r4, r1
	ldr	r3, .L20+4
	add	r2, r2, ip, asl #6
	mvn	r0, r0, asl #17
	mvn	r1, r1, asl #17
	mvn	r1, r1, lsr #17
	mov	r2, r2, asl #1
	mvn	r0, r0, lsr #17
	mov	ip, r3
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r0, [r3, #0]	@ movhi
	ldr	r3, .L20+8
	mov	r2, ip
	mov	r1, #1
.L10:
	ldr	r0, [r3, #64]
	cmp	r0, #0
	bne	.L8
	ldr	r0, [r3, #68]
	cmp	r0, #0
	bne	.L8
	ldr	r0, [r3, #8]
	ldrh	r4, [r3, #0]
	orr	r0, r0, #16384
	strh	r0, [r2, #10]	@ movhi
	mov	r0, #384	@ movhi
	strh	r4, [r2, #8]	@ movhi
	strh	r0, [r2, #12]	@ movhi
.L9:
	add	r1, r1, #1
	cmp	r1, #5
	add	r3, r3, #72
	add	r2, r2, #8
	bne	.L10
	ldr	r3, .L20+12
	ldr	r2, [r3, #64]
	cmp	r2, #0
	bne	.L13
	ldr	r2, [r3, #68]
	cmp	r2, #0
	beq	.L18
.L13:
	mov	r0, #512	@ movhi
	strh	r0, [ip, #40]	@ movhi
.L12:
	ldr	r3, [r3, #136]
	cmp	r3, #0
	ldr	r3, .L20+12
	bne	.L16
	ldr	r2, [r3, #140]
	cmp	r2, #0
	beq	.L19
.L16:
	mov	r0, #512	@ movhi
	strh	r0, [ip, #48]	@ movhi
.L7:
	ldmfd	sp!, {r4}
	bx	lr
.L8:
	mov	r4, #512	@ movhi
	strh	r4, [r2, #8]	@ movhi
	b	.L9
.L19:
	ldr	r2, [r3, #80]
	ldrh	r3, [r3, #72]
	orr	r2, r2, #16384
	strh	r2, [ip, #50]	@ movhi
	mov	r2, #512	@ movhi
	strh	r3, [ip, #48]	@ movhi
	strh	r2, [ip, #52]	@ movhi
	b	.L7
.L18:
	ldr	r2, [r3, #8]
	orr	r2, r2, #16384
	strh	r2, [ip, #42]	@ movhi
	ldrh	r2, [r3, #0]
	mov	r4, #512	@ movhi
	strh	r2, [ip, #40]	@ movhi
	strh	r4, [ip, #44]	@ movhi
	b	.L12
.L21:
	.align	2
.L20:
	.word	pooh
	.word	shadowOAM
	.word	honeypots
	.word	bees
	.size	updateOAM, .-updateOAM
	.align	2
	.global	updatePots
	.type	updatePots, %function
updatePots:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L23
	ldr	r3, .L37
	ldr	r3, [r3, #16]
	cmp	r3, #80
	bgt	.L36
.L23:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L28
	ldr	r3, .L37+4
	add	r1, r3, #288
.L27:
	ldr	r2, [r3, #8]
	sub	r2, r2, #1
	str	r2, [r3, #8]
	add	r3, r3, #72
	cmp	r3, r1
	bne	.L27
.L28:
	ldr	r3, .L37+4
	mov	ip, #0
	add	r0, r3, #288
	mov	r1, #1
.L26:
	ldr	r2, [r3, #8]
	sub	r2, r2, #1
	cmp	r2, #239
	movcc	r2, ip
	movcs	r2, r1
	str	r2, [r3, #64]
	add	r3, r3, #72
	cmp	r3, r0
	bne	.L26
	bx	lr
.L36:
	ldr	r3, .L37+4
	add	r1, r3, #288
.L24:
	ldr	r2, [r3, #8]
	add	r2, r2, #1
	str	r2, [r3, #8]
	add	r3, r3, #72
	cmp	r3, r1
	bne	.L24
	b	.L23
.L38:
	.align	2
.L37:
	.word	pooh
	.word	honeypots
	.size	updatePots, .-updatePots
	.global	__aeabi_idivmod
	.align	2
	.global	updateBees
	.type	updateBees, %function
updateBees:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	ldr	r4, .L44
	ldr	r6, .L44+4
	ldr	sl, .L44+8
	ldr	r8, .L44+12
	add	r5, r4, #144
	mov	r7, #240
.L41:
	ldr	r2, [r4, #8]
	ldr	r3, [r4, #28]
	rsb	r3, r3, r2
	cmp	r3, #0
	str	r3, [r4, #8]
	blt	.L43
.L40:
	add	r4, r4, #72
	cmp	r4, r5
	bne	.L41
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L43:
	str	r7, [r4, #8]
	mov	lr, pc
	bx	r6
	ldr	r1, [r4, #36]
	rsb	r1, r1, #160
	mov	lr, pc
	bx	sl
	str	r1, [r4, #0]
	mov	lr, pc
	bx	r6
	smull	r2, r3, r8, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, asl #1
	rsb	r0, r3, r0
	add	r0, r0, #1
	str	r0, [r4, #28]
	b	.L40
.L45:
	.align	2
.L44:
	.word	bees
	.word	rand
	.word	__aeabi_idivmod
	.word	1431655766
	.size	updateBees, .-updateBees
	.ident	"GCC: (devkitARM release 31) 4.5.0"
