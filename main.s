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
	.file	"main.c"
	.text
	.align	2
	.global	initStart
	.type	initStart, %function
initStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L2
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r3, #512	@ movhi
	strh	r3, [r5, #0]	@ movhi
	mov	r3, #6528	@ movhi
	ldr	r0, .L2+4
	strh	r3, [r5, #10]	@ movhi
	mov	r6, #100663296
	ldr	r3, .L2+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L2+12
	add	r2, r6, #51200
	mov	r0, #3
	ldr	r1, .L2+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #18176
	mov	r2, r6
	mov	r0, #3
	ldr	r1, .L2+20
	add	r3, r3, #192
	mov	lr, pc
	bx	r4
	ldr	ip, .L2+24
	mov	r4, #0
	strh	r4, [r5, #20]	@ movhi
	str	r4, [ip, #0]
	strh	r4, [r5, #22]	@ movhi
	str	r4, [ip, #4]
	ldr	ip, .L2+28
	mov	r1, #561152
	mov	r2, #11008
	mov	r3, #1
	str	r4, [ip, #0]
	ldr	r0, .L2+32
	add	r1, r1, #308
	add	r2, r2, #17
	ldr	ip, .L2+36
	mov	lr, pc
	bx	ip
	ldr	r3, .L2+40
	str	r4, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	hideSprites
	.word	StartScreenPal
	.word	loadPalette
	.word	DMANow
	.word	StartScreenMap
	.word	StartScreenTiles
	.word	.LANCHOR0
	.word	state
	.word	WinnieTitleSong
	.word	playSoundA
	.word	cheatState
	.size	initStart, .-initStart
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bl	initStart
	ldr	r3, .L19
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L19+8
	ldr	r7, .L19+12
	ldr	r6, .L19+16
	ldr	fp, .L19+20
	ldr	r9, .L19+24
	ldr	sl, .L19+28
	ldr	r8, .L19+32
	mov	r5, #67108864
.L17:
	ldr	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L6:
	str	r3, [r6, #0]
	ldr	r3, [r5, #304]
	str	r3, [r4, #0]
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L6
.L14:
	.word	.L7
	.word	.L8
	.word	.L9
	.word	.L10
	.word	.L11
	.word	.L12
	.word	.L13
.L13:
	mov	lr, pc
	bx	sl
	b	.L17
.L12:
	mov	lr, pc
	bx	r8
	b	.L17
.L11:
	mov	lr, pc
	bx	r9
	b	.L17
.L10:
	mov	lr, pc
	bx	fp
	b	.L17
.L9:
	ldr	r3, .L19+36
	mov	lr, pc
	bx	r3
	b	.L17
.L8:
	ldr	r3, .L19+40
	mov	lr, pc
	bx	r3
	b	.L17
.L7:
	ldr	r3, .L19+44
	mov	lr, pc
	bx	r3
	b	.L17
.L20:
	.align	2
.L19:
	.word	setupSounds
	.word	setupInterrupts
	.word	buttons
	.word	state
	.word	oldButtons
	.word	updateGame
	.word	updatePause
	.word	win
	.word	lose
	.word	instructions
	.word	story1
	.word	updateStart
	.size	main, .-main
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r1, #6912	@ movhi
	mov	r3, #67108864
	mov	r2, #22784
	strh	r1, [r3, #8]	@ movhi
	add	r2, r2, #4
	mov	r1, #4864	@ movhi
	mov	r5, #100663296
	strh	r1, [r3, #0]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r0, .L22
	ldr	r3, .L22+4
	ldr	r4, .L22+8
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L22+12
	add	r2, r5, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L22+16
	mov	r2, r5
	mov	r3, #4736
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L22+20
	add	r2, r5, #51200
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r3, #9664
	mov	r0, #3
	ldr	r1, .L22+24
	add	r2, r5, #16384
	add	r3, r3, #16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L22+28
	add	r2, r5, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	ldr	r1, .L22+32
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L22+36
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r0, r3
	ldr	r3, .L22+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+52
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	FrontLayerPal
	.word	loadPalette
	.word	DMANow
	.word	FrontLayerMap
	.word	FrontLayerTiles
	.word	GameScreenMap
	.word	GameScreenTiles
	.word	PoohBearSpritesTiles
	.word	PoohBearSpritesPal
	.word	points
	.word	time
	.word	srand
	.word	hideSprites
	.word	state
	.size	initGame, .-initGame
	.align	2
	.global	initPause
	.type	initPause, %function
initPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r2, #256	@ movhi
	mov	r3, #67108864
	strh	r2, [r3, #0]	@ movhi
	mov	r2, #6400	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r0, .L25
	mov	r5, #100663296
	ldr	r3, .L25+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L25+8
	mov	r0, #3
	ldr	r1, .L25+12
	add	r2, r5, #51200
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r2, r5
	mov	r0, #3
	ldr	r1, .L25+16
	mov	r3, #3824
	mov	lr, pc
	bx	r4
	ldr	r3, .L25+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+24
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	PauseScreenPal
	.word	loadPalette
	.word	DMANow
	.word	PauseScreenMap
	.word	PauseScreenTiles
	.word	pauseSound
	.word	state
	.size	initPause, .-initPause
	.global	hOff
	.global	vOff
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	shadowOAM,1024,4
	.comm	pooh,72,4
	.comm	honeypots,288,4
	.comm	bees,144,4
	.comm	points,4,4
	.comm	state,4,4
	.comm	cheatState,4,4
	.comm	soundA,32,4
	.comm	soundB,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
