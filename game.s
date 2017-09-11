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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L2
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+4
	mov	r4, #16
	mov	r1, #0
	mov	r2, #1
	mov	ip, #130
	mov	r0, #120
	str	r4, [r3, #32]
	mov	r4, #32
	str	r4, [r3, #36]
	str	r1, [r3, #24]
	str	r2, [r3, #28]
	str	ip, [r3, #0]
	str	r0, [r3, #8]
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r2, [r3, #20]
	str	r1, [r3, #40]
	str	r1, [r3, #56]
	str	r2, [r3, #44]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	hideSprites
	.word	pooh
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initHoneyPots
	.type	initHoneyPots, %function
initHoneyPots:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L8
	mov	r0, #16
	mov	r3, r2
	add	ip, r2, #288
	mov	r1, #0
.L5:
	str	r0, [r3, #36]
	str	r0, [r3, #32]
	str	r1, [r3, #64]
	str	r1, [r3, #68]
	add	r3, r3, #72
	cmp	r3, ip
	bne	.L5
	mov	r3, #104
	str	r3, [r2, #0]
	mov	r3, #90
	str	r3, [r2, #8]
	mov	r3, #54
	str	r3, [r2, #72]
	mov	r3, #84
	str	r3, [r2, #80]
	mov	r3, #74
	str	r3, [r2, #144]
	mov	r3, #205
	str	r3, [r2, #152]
	mov	r3, #34
	str	r3, [r2, #216]
	mov	r3, #320
	str	r3, [r2, #224]
	bx	lr
.L9:
	.align	2
.L8:
	.word	honeypots
	.size	initHoneyPots, .-initHoneyPots
	.align	2
	.global	initBees
	.type	initBees, %function
initBees:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	mov	r2, #16
	str	r2, [r3, #36]
	str	r2, [r3, #32]
	str	r2, [r3, #108]
	str	r2, [r3, #104]
	mov	r2, #130
	str	r2, [r3, #0]
	mov	r2, #1
	str	r2, [r3, #28]
	mov	r2, #84
	mov	r0, #0
	mov	r1, #240
	str	r2, [r3, #72]
	mov	r2, #2
	str	r0, [r3, #64]
	str	r0, [r3, #136]
	str	r1, [r3, #8]
	str	r1, [r3, #80]
	str	r2, [r3, #100]
	bx	lr
.L12:
	.align	2
.L11:
	.word	bees
	.size	initBees, .-initBees
	.align	2
	.global	honeyPotCollision
	.type	honeyPotCollision, %function
honeyPotCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r4, .L23
	ldr	r5, .L23+4
	ldr	r8, .L23+8
	ldr	sl, .L23+12
	add	r6, r4, #288
	mov	r7, r5
	mov	r9, #1
.L19:
	ldr	r2, [r4, #0]
	ldr	r3, [r5, #8]
	cmp	r2, r3
	blt	.L14
	ldr	r1, [r7, #32]
	add	r1, r3, r1
	cmp	r2, r1
	bgt	.L14
.L15:
	ldr	r2, [r4, #-8]
	ldr	r3, [r5, #0]
	cmp	r2, r3
	blt	.L17
	ldr	r1, [r7, #36]
	add	r1, r3, r1
	cmp	r2, r1
	bgt	.L17
	ldr	r3, [r4, #60]
	cmp	r3, #0
	beq	.L22
.L16:
	add	r4, r4, #72
	cmp	r4, r6
	bne	.L19
	ldr	r3, [r8, #0]
	cmp	r3, #3
	ble	.L13
	ldr	r3, .L23+16
	mov	r2, #6
	str	r2, [r3, #0]
	ldr	r3, .L23+20
	mov	lr, pc
	bx	r3
	mov	r1, #18176
	mov	r2, #11008
	ldr	r0, .L23+24
	add	r1, r1, #26
	add	r2, r2, #17
	mov	r3, #0
	ldr	ip, .L23+12
	mov	lr, pc
	bx	ip
.L13:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L17:
	ldr	r1, [r4, #28]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L16
	ldr	r1, [r5, #36]
	add	r3, r3, r1
	cmp	r2, r3
	bgt	.L16
	ldr	r3, [r4, #60]
	cmp	r3, #0
	bne	.L16
.L22:
	mov	r1, #11712
	mov	r2, #11008
	ldr	r0, .L23+28
	add	r1, r1, #46
	add	r2, r2, #17
	mov	lr, pc
	bx	sl
	ldr	r3, [r8, #0]
	add	r3, r3, #1
	str	r3, [r8, #0]
	str	r9, [r4, #60]
	b	.L16
.L14:
	ldr	r1, [r4, #24]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L16
	ldr	r1, [r5, #32]
	add	r3, r3, r1
	cmp	r2, r3
	bgt	.L16
	b	.L15
.L24:
	.align	2
.L23:
	.word	honeypots+8
	.word	pooh
	.word	points
	.word	playSoundB
	.word	state
	.word	stopSound
	.word	WinSound
	.word	HoneyPotSound
	.size	honeyPotCollision, .-honeyPotCollision
	.align	2
	.global	beeCollision
	.type	beeCollision, %function
beeCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L33
	ldr	r5, .L33+4
	ldr	r8, .L33+8
	ldr	sl, .L33+12
	ldr	r9, .L33+16
	add	r6, r4, #144
	mov	r7, r5
	mov	fp, #5
.L31:
	ldr	r3, [r4, #0]
	ldr	r2, [r5, #8]
	cmp	r3, r2
	add	r1, r3, #4
	blt	.L26
	ldr	r0, [r7, #32]
	add	r0, r2, r0
	cmp	r1, r0
	bge	.L26
.L27:
	ldr	r3, [r4, #-8]
	ldr	r2, [r5, #0]
	cmp	r3, r2
	add	r1, r3, #4
	blt	.L29
	ldr	r0, [r7, #36]
	add	r0, r2, r0
	cmp	r1, r0
	bge	.L29
.L30:
	str	fp, [r8, #0]
	mov	lr, pc
	bx	sl
	mov	r1, #12992
	mov	r2, #11008
	ldr	r0, .L33+20
	add	r1, r1, #43
	add	r2, r2, #17
	mov	r3, #0
	mov	lr, pc
	bx	r9
.L28:
	add	r4, r4, #72
	cmp	r4, r6
	bne	.L31
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L29:
	ldr	r1, [r4, #28]
	add	r3, r3, r1
	cmp	r2, r3
	bgt	.L28
	ldr	r1, [r5, #36]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L28
	b	.L30
.L26:
	ldr	r1, [r4, #24]
	add	r3, r3, r1
	sub	r1, r3, #4
	cmp	r2, r1
	sub	r3, r3, #5
	bge	.L28
	ldr	r1, [r5, #32]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L28
	b	.L27
.L34:
	.align	2
.L33:
	.word	bees+8
	.word	pooh
	.word	state
	.word	stopSound
	.word	playSoundB
	.word	LoseSound
	.size	beeCollision, .-beeCollision
	.ident	"GCC: (devkitARM release 31) 4.5.0"
