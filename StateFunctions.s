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
	.file	"StateFunctions.c"
	.text
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L19
	stmfd	sp!, {r4, r5}
	ldr	r2, [r3, #44]
	add	ip, r3, #20
	ldmia	ip, {r1, ip}
	add	r1, r1, ip
	cmp	r2, #2
	ldr	r0, [r3, #0]
	strne	r2, [r3, #48]
	str	r1, [r3, #24]
	ldr	r2, [r3, #40]
	ldr	r1, .L19+4
	str	r0, [r3, #4]
	smull	r0, r1, r2, r1
	mov	r0, r2, asr #31
	rsb	r1, r0, r1, asr #2
	add	r1, r1, r1, asl #2
	mov	ip, #2
	subs	r2, r2, r1, asl #1
	ldr	r0, .L19
	str	ip, [r3, #44]
	bne	.L3
	ldr	r1, [r0, #56]
	cmp	r1, #8
	addne	r1, r1, #1
	str	r2, [r0, #40]
	streq	r2, [r0, #56]
	strne	r1, [r0, #56]
.L3:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #32
	bne	.L5
	ldr	r2, [r3, #16]
	mov	r1, #0
	cmp	r2, #80
	str	r1, [r3, #44]
	bgt	.L16
.L5:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #16
	bne	.L6
	ldr	r2, .L19+8
	ldr	r1, [r3, #16]
	ldr	r0, [r2, #0]
	add	r1, r1, #1
	add	r0, r0, #1
	mov	ip, #1
	str	ip, [r3, #44]
	str	r0, [r2, #0]
	str	r1, [r3, #16]
.L6:
	ldr	r2, .L19+12
	ldr	r2, [r2, #0]
	tst	r2, #64
	beq	.L7
	ldr	r2, .L19+16
	ldr	r2, [r2, #0]
	tst	r2, #64
	beq	.L17
.L7:
	ldr	r2, [r3, #24]
	ldr	r1, .L19
	cmp	r2, #0
	ldrlt	r0, [r1, #0]
	blt	.L8
	ldr	r0, [r1, #0]
	ldr	r4, [r1, #36]
	ldr	r5, [r1, #16]
	add	r4, r0, r4
	ldr	ip, .L19+20
	add	r4, r5, r4, asl #9
	add	r5, ip, r4, asl #1
	ldrh	r5, [r5, #2]
	cmp	r5, #0
	bne	.L18
.L10:
	mov	r2, #0
	str	r2, [r3, #24]
.L8:
	add	r2, r0, r2
	cmp	r2, #130
	ldr	r1, .L19
	str	r2, [r3, #0]
	movgt	r2, #130
	strgt	r2, [r1, #0]
	bgt	.L12
	cmp	r2, #0
	movlt	r2, #0
	strlt	r2, [r1, #0]
.L12:
	ldr	r3, [r3, #44]
	cmp	r3, #2
	ldr	r3, .L19
	ldrne	r2, [r3, #40]
	moveq	r2, #0
	addne	r2, r2, #1
	streq	r2, [r3, #56]
	strne	r2, [r3, #40]
	ldmfd	sp!, {r4, r5}
	bx	lr
.L18:
	ldr	r1, [r1, #32]
	add	r4, r4, r1
	add	ip, ip, r4, asl #1
	ldrh	r1, [ip, #2]
	cmp	r1, #0
	bne	.L8
	b	.L10
.L17:
	mvn	r2, #9
	str	r2, [r3, #24]
	ldr	r0, [r3, #0]
	b	.L8
.L16:
	ldr	r1, .L19+8
	ldr	r0, [r1, #0]
	sub	r0, r0, #1
	str	r0, [r1, #0]
	ldr	r1, .L19
	sub	r2, r2, #1
	str	r2, [r1, #16]
	b	.L5
.L20:
	.align	2
.L19:
	.word	pooh
	.word	1717986919
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	CollisionMapBitmap
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	story1
	.type	story1, %function
story1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r4, #67108864
	mov	r3, #512	@ movhi
	strh	r3, [r4, #0]	@ movhi
	mov	r3, #6016	@ movhi
	ldr	r0, .L23
	strh	r3, [r4, #10]	@ movhi
	ldr	r3, .L23+4
	mov	lr, pc
	bx	r3
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L23+8
	add	r2, r2, #47104
	mov	r3, #1024
	ldr	r5, .L23+12
	mov	lr, pc
	bx	r5
	mov	r3, #18944
	add	r3, r3, #160
	mov	r0, #3
	ldr	r1, .L23+16
	mov	r2, #100663296
	mov	lr, pc
	bx	r5
	ldr	r3, .L23+20
	ldr	r3, [r3, #0]
	tst	r3, #8
	mov	r3, #0	@ movhi
	strh	r3, [r4, #20]	@ movhi
	strh	r3, [r4, #22]	@ movhi
	beq	.L21
	ldr	r3, .L23+24
	ldr	r3, [r3, #0]
	tst	r3, #8
	ldreq	r3, .L23+28
	moveq	r2, #2
	streq	r2, [r3, #0]
.L21:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	Story1Pal
	.word	loadPalette
	.word	Story1Map
	.word	DMANow
	.word	Story1Tiles
	.word	oldButtons
	.word	buttons
	.word	state
	.size	story1, .-story1
	.align	2
	.global	instructions
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r2, #512	@ movhi
	mov	r4, #67108864
	mov	r3, #6528	@ movhi
	ldr	r0, .L40
	strh	r2, [r4, #0]	@ movhi
	strh	r3, [r4, #10]	@ movhi
	ldr	r3, .L40+4
	mov	lr, pc
	bx	r3
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L40+8
	add	r2, r2, #51200
	mov	r3, #1024
	ldr	r5, .L40+12
	mov	lr, pc
	bx	r5
	mov	r3, #18944
	mov	r2, #100663296
	add	r3, r3, #160
	mov	r0, #3
	ldr	r1, .L40+16
	mov	lr, pc
	bx	r5
	ldr	r3, .L40+20
	ldr	r3, [r3, #0]
	mov	r2, #0	@ movhi
	tst	r3, #1
	strh	r2, [r4, #20]	@ movhi
	strh	r2, [r4, #22]	@ movhi
	beq	.L26
	ldr	r2, .L40+24
	ldr	r2, [r2, #0]
	tst	r2, #1
	ldreq	r2, .L40+28
	ldreq	r1, [r2, #0]
	addeq	r1, r1, #1
	streq	r1, [r2, #0]
.L26:
	tst	r3, #2
	beq	.L27
	ldr	r2, .L40+24
	ldr	r2, [r2, #0]
	tst	r2, #2
	bne	.L27
.L28:
	ldr	r2, .L40+28
	mov	r1, #0
	str	r1, [r2, #0]
.L35:
	tst	r3, #8
	beq	.L25
	ldr	r3, .L40+24
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L37
.L25:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L27:
	tst	r3, #4
	beq	.L29
	ldr	r2, .L40+24
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L28
.L29:
	tst	r3, #16
	bne	.L38
.L30:
	tst	r3, #32
	beq	.L31
	ldr	r2, .L40+24
	ldr	r2, [r2, #0]
	tst	r2, #32
	beq	.L28
.L31:
	tst	r3, #64
	beq	.L32
	ldr	r2, .L40+24
	ldr	r2, [r2, #0]
	tst	r2, #64
	beq	.L28
.L32:
	tst	r3, #128
	bne	.L39
.L33:
	tst	r3, #256
	beq	.L34
	ldr	r2, .L40+24
	ldr	r2, [r2, #0]
	tst	r2, #256
	beq	.L28
.L34:
	tst	r3, #512
	beq	.L35
	ldr	r2, .L40+24
	ldr	r2, [r2, #0]
	tst	r2, #512
	bne	.L35
	b	.L28
.L38:
	ldr	r2, .L40+24
	ldr	r2, [r2, #0]
	tst	r2, #16
	beq	.L28
	b	.L30
.L37:
	ldr	r3, .L40+32
	mov	r2, #3
	str	r2, [r3, #0]
	ldr	r3, .L40+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+52
	mov	lr, pc
	bx	r3
	mov	r1, #483328
	mov	r2, #11008
	ldr	r0, .L40+56
	sub	r1, r1, #213
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L40+60
	mov	lr, pc
	bx	ip
	b	.L25
.L39:
	ldr	r2, .L40+24
	ldr	r2, [r2, #0]
	tst	r2, #128
	beq	.L28
	b	.L33
.L41:
	.align	2
.L40:
	.word	InstructionsPal
	.word	loadPalette
	.word	InstructionsMap
	.word	DMANow
	.word	InstructionsTiles
	.word	oldButtons
	.word	buttons
	.word	cheatState
	.word	state
	.word	initGame
	.word	initPlayer
	.word	initHoneyPots
	.word	initBees
	.word	stopSound
	.word	GameSound
	.word	playSoundA
	.size	instructions, .-instructions
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L46
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L43
	ldr	r3, .L46+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L45
.L43:
	ldr	r3, .L46+8
	ldrh	r1, [r3, #0]
	ldr	r3, .L46+12
	ldrh	r2, [r3, #0]
	mov	r3, #67108864
	strh	r1, [r3, #20]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	bl	updatePlayer
	ldr	r3, .L46+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+28
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ldrne	r3, .L46+32
	movne	lr, pc
	bxne	r3
.L44:
	ldr	r3, .L46+36
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L46+40
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L46+44
	mov	lr, pc
	bx	ip
	ldr	r3, .L46+48
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L45:
	ldr	r3, .L46+52
	mov	lr, pc
	bx	r3
	b	.L43
.L47:
	.align	2
.L46:
	.word	oldButtons
	.word	buttons
	.word	hOff
	.word	vOff
	.word	updatePots
	.word	updateBees
	.word	honeyPotCollision
	.word	cheatState
	.word	beeCollision
	.word	updateOAM
	.word	shadowOAM
	.word	DMANow
	.word	waitForVblank
	.word	initPause
	.size	updateGame, .-updateGame
	.align	2
	.global	updateStart
	.type	updateStart, %function
updateStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L50
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L49
	ldr	r3, .L50+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	ldreq	r3, .L50+8
	moveq	r2, #1
	streq	r2, [r3, #0]
.L49:
	ldr	r3, .L50+12
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	waitForVblank
	.size	updateStart, .-updateStart
	.align	2
	.global	updatePause
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L57
	ldr	r3, [r4, #0]
	tst	r3, #4
	beq	.L53
	ldr	r2, .L57+4
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L55
.L53:
	tst	r3, #8
	beq	.L54
	ldr	r3, .L57+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L56
.L54:
	ldr	r3, .L57+8
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	bx	lr
.L56:
	ldr	r3, .L57+12
	mov	lr, pc
	bx	r3
	b	.L54
.L55:
	ldr	r3, .L57+16
	mov	r2, #3
	str	r2, [r3, #0]
	ldr	r3, .L57+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+24
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	b	.L53
.L58:
	.align	2
.L57:
	.word	oldButtons
	.word	buttons
	.word	waitForVblank
	.word	initStart
	.word	state
	.word	initGame
	.word	unpauseSound
	.size	updatePause, .-updatePause
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r4, #67108864
	mov	r3, #512	@ movhi
	strh	r3, [r4, #0]	@ movhi
	mov	r3, #6528	@ movhi
	ldr	r0, .L62
	strh	r3, [r4, #10]	@ movhi
	ldr	r3, .L62+4
	mov	lr, pc
	bx	r3
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L62+8
	add	r2, r2, #51200
	mov	r3, #1024
	ldr	r5, .L62+12
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	add	r3, r3, #96
	mov	r0, #3
	ldr	r1, .L62+16
	mov	r2, #100663296
	mov	lr, pc
	bx	r5
	ldr	r3, .L62+20
	ldr	r3, [r3, #0]
	tst	r3, #8
	mov	r3, #0	@ movhi
	strh	r3, [r4, #22]	@ movhi
	strh	r3, [r4, #20]	@ movhi
	beq	.L59
	ldr	r3, .L62+24
	ldr	r4, [r3, #0]
	ands	r4, r4, #8
	beq	.L61
.L59:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L61:
	ldr	r3, .L62+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+32
	str	r4, [r3, #0]
	b	.L59
.L63:
	.align	2
.L62:
	.word	WinScreenPal
	.word	loadPalette
	.word	WinScreenMap
	.word	DMANow
	.word	WinScreenTiles
	.word	oldButtons
	.word	buttons
	.word	initStart
	.word	state
	.size	win, .-win
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r4, #67108864
	mov	r3, #512	@ movhi
	strh	r3, [r4, #0]	@ movhi
	mov	r3, #6528	@ movhi
	ldr	r0, .L67
	strh	r3, [r4, #10]	@ movhi
	ldr	r3, .L67+4
	mov	lr, pc
	bx	r3
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L67+8
	add	r2, r2, #51200
	mov	r3, #1024
	ldr	r5, .L67+12
	mov	lr, pc
	bx	r5
	mov	r3, #17664
	add	r3, r3, #64
	mov	r0, #3
	ldr	r1, .L67+16
	mov	r2, #100663296
	mov	lr, pc
	bx	r5
	ldr	r3, .L67+20
	ldr	r3, [r3, #0]
	tst	r3, #8
	mov	r3, #0	@ movhi
	strh	r3, [r4, #22]	@ movhi
	strh	r3, [r4, #20]	@ movhi
	beq	.L64
	ldr	r3, .L67+24
	ldr	r4, [r3, #0]
	ands	r4, r4, #8
	beq	.L66
.L64:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L66:
	ldr	r3, .L67+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+32
	str	r4, [r3, #0]
	b	.L64
.L68:
	.align	2
.L67:
	.word	LoseScreenPal
	.word	loadPalette
	.word	LoseScreenMap
	.word	DMANow
	.word	LoseScreenTiles
	.word	oldButtons
	.word	buttons
	.word	initStart
	.word	state
	.size	lose, .-lose
	.ident	"GCC: (devkitARM release 31) 4.5.0"
