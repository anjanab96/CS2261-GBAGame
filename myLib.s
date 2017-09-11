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
	.file	"myLib.c"
	.text
	.align	2
	.global	loadMap
	.type	loadMap, %function
loadMap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, fp}
	mov	ip, r1, asl #1
	add	ip, ip, #14
	mov	r4, sp
	mov	ip, ip, lsr #3
	sub	r4, r4, ip, asl #3
	add	fp, sp, #12
	cmp	r1, #0
	mov	sp, r4
	mov	r5, sp
	beq	.L2
	mov	r2, r2, asl #28
	mov	ip, #0
	mov	r6, r2, lsr #16
	mov	r2, ip
.L3:
	ldrh	r4, [r0, ip]
	add	r2, r2, #1
	mov	r4, r4, asl #20
	orr	r4, r6, r4, lsr #20
	cmp	r2, r1
	strh	r4, [r5, ip]	@ movhi
	add	ip, ip, #2
	blt	.L3
.L2:
	ldr	r2, .L6
	ldr	r0, [r2, #0]
	mov	r3, r3, asl #11
	add	r2, r0, #36
	add	r3, r3, #100663296
	orr	r1, r1, #-2147483648
	str	r5, [r0, #36]
	str	r3, [r2, #4]
	str	r1, [r2, #8]
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, r6, fp}
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LANCHOR0
	.size	loadMap, .-loadMap
	.align	2
	.global	setPixel3
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L9
	rsb	r0, r0, r0, asl #4
	add	r0, r1, r0, asl #4
	ldr	r3, [r3, #4]
	mov	r0, r0, asl #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	drawRect3
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	sub	sp, sp, #12
	ldrh	ip, [sp, #16]
	cmp	r2, #0
	strh	ip, [sp, #6]	@ movhi
	ble	.L11
	ldr	ip, .L15
	rsb	r0, r0, r0, asl #4
	ldmia	ip, {r4, ip}	@ phole ldm
	add	r1, r1, r0, asl #4
	add	r1, ip, r1, asl #1
	add	r0, r4, #36
	mov	ip, #0
	orr	r4, r3, #-2130706432
	add	r3, sp, #6
.L13:
	add	ip, ip, #1
	cmp	ip, r2
	str	r3, [r0, #0]
	str	r1, [r0, #4]
	str	r4, [r0, #8]
	add	r1, r1, #480
	bne	.L13
.L11:
	add	sp, sp, #12
	ldmfd	sp!, {r4}
	bx	lr
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawImage3
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6}
	cmp	r3, #0
	ldr	r4, [sp, #12]
	ble	.L17
	ldr	r5, .L21
	rsb	r1, r1, r1, asl #4
	ldr	ip, [r5, #0]
	ldr	r6, [r5, #4]
	add	r1, r2, r1, asl #4
	orr	r5, r4, #-2147483648
	add	ip, ip, #36
	mov	r4, r4, asl #1
	add	r1, r6, r1, asl #1
	mov	r2, #0
.L19:
	add	r2, r2, #1
	cmp	r2, r3
	str	r0, [ip, #0]
	str	r1, [ip, #4]
	add	r0, r0, r4
	str	r5, [ip, #8]
	add	r1, r1, #480
	bne	.L19
.L17:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L22:
	.align	2
.L21:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	fillScreen3
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L24
	sub	sp, sp, #8
	add	r3, sp, #8
	ldr	r2, [r1, #0]
	strh	r0, [r3, #-2]!	@ movhi
	ldr	ip, [r1, #4]
	mov	r1, #-2130706432
	add	r0, r2, #36
	add	r1, r1, #38400
	str	r3, [r2, #36]
	str	ip, [r0, #4]
	str	r1, [r0, #8]
	add	sp, sp, #8
	bx	lr
.L25:
	.align	2
.L24:
	.word	.LANCHOR0
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	setPixel4
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, asl #4
	add	r3, r1, r0, asl #4
	ldr	r0, .L29
	add	r3, r3, r3, lsr #31
	ldr	ip, [r0, #4]
	bic	r3, r3, #1
	tst	r1, #1
	ldrh	r1, [ip, r3]
	andne	r1, r1, #255
	biceq	r1, r1, #255
	orrne	r2, r1, r2, asl #8
	orreq	r2, r2, r1
	strneh	r2, [ip, r3]	@ movhi
	streqh	r2, [ip, r3]	@ movhi
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #36
	ldrb	r4, [sp, #72]	@ zero_extendqisi2
	cmp	r2, #0
	str	r2, [sp, #0]
	orr	r2, r4, r4, asl #8
	str	r4, [sp, #8]
	str	r1, [sp, #12]
	strh	r2, [sp, #30]	@ movhi
	ble	.L31
	ldr	r4, [sp, #12]
	add	r8, r1, #1
	rsb	r5, r0, r0, asl #4
	add	ip, r3, r3, lsr #31
	add	r2, r1, r1, lsr #31
	mov	r5, r5, asl #3
	mov	ip, ip, asr #1
	add	r8, r8, r8, lsr #31
	add	r8, r5, r8, asr #1
	sub	r1, ip, #1
	add	r5, r5, r2, asr #1
	sub	r2, r4, #1
	mov	r8, r8, asl #1
	orr	ip, ip, #-2130706432
	orr	r1, r1, #-2130706432
	add	r2, r2, r3
	and	r9, r4, #1
	ldr	sl, .L39
	str	ip, [sp, #4]
	str	r1, [sp, #20]
	mov	r6, r0
	mov	r5, r5, asl #1
	mov	r7, r8
	mov	r4, #0
	and	fp, r3, #1
	str	r2, [sp, #16]
	b	.L36
.L33:
	ldr	r1, [sl, #4]
	ldr	r2, [sl, #0]
	ldr	r0, [sp, #4]
	add	r3, r2, #36
	add	r1, r1, r5
	add	ip, sp, #30
	cmp	fp, #0
	str	ip, [r2, #36]
	str	r1, [r3, #4]
	str	r0, [r3, #8]
	bne	.L38
.L35:
	ldr	r1, [sp, #0]
	add	r4, r4, #1
	cmp	r1, r4
	add	r8, r8, #240
	add	r6, r6, #1
	add	r5, r5, #240
	add	r7, r7, #240
	ble	.L31
.L36:
	cmp	r9, #0
	beq	.L33
	mov	r0, r6
	ldr	r1, [sp, #12]
	ldr	r2, [sp, #8]
	bl	setPixel4
	cmp	fp, #0
	beq	.L34
	ldr	r1, [sl, #4]
	ldr	r2, [sl, #0]
	add	r1, r1, r7
	add	r3, r2, #36
	add	ip, sp, #30
	str	ip, [r2, #36]
	str	r1, [r3, #4]
	ldr	r1, [sp, #0]
	ldr	r0, [sp, #4]
	add	r4, r4, #1
	cmp	r1, r4
	str	r0, [r3, #8]
	add	r8, r8, #240
	add	r6, r6, #1
	add	r5, r5, #240
	add	r7, r7, #240
	bgt	.L36
.L31:
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L38:
	mov	r0, r6
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #8]
	bl	setPixel4
	b	.L35
.L34:
	ldmia	sl, {r1, r2}	@ phole ldm
	add	r3, r1, #36
	add	r2, r2, r8
	add	ip, sp, #30
	str	ip, [r1, #36]
	str	r2, [r3, #4]
	ldr	r2, [sp, #20]
	mov	r0, r6
	str	r2, [r3, #8]
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #8]
	bl	setPixel4
	b	.L35
.L40:
	.align	2
.L39:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L42
	sub	sp, sp, #8
	add	r3, sp, #8
	ldr	r2, [r1, #0]
	orr	r0, r0, r0, asl #8
	strh	r0, [r3, #-2]!	@ movhi
	ldr	ip, [r1, #4]
	mov	r1, #-2130706432
	add	r0, r2, #36
	add	r1, r1, #19200
	str	r3, [r2, #36]
	str	ip, [r0, #4]
	str	r1, [r0, #8]
	add	sp, sp, #8
	bx	lr
.L43:
	.align	2
.L42:
	.word	.LANCHOR0
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawBackgroundImage4
	.type	drawBackgroundImage4, %function
drawBackgroundImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L45
	ldmia	r3, {r1, ip}	@ phole ldm
	mov	r3, #-2147483648
	add	r2, r1, #36
	add	r3, r3, #19200
	str	r0, [r1, #36]
	str	ip, [r2, #4]
	str	r3, [r2, #8]
	bx	lr
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
	.size	drawBackgroundImage4, .-drawBackgroundImage4
	.align	2
	.global	drawImage4
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	cmp	r3, #0
	ldr	r7, [sp, #24]
	ble	.L47
	ldr	r5, .L51
	add	r8, r7, r7, lsr #31
	ldr	r4, [r5, #0]
	rsb	r1, r1, r1, asl #4
	mov	r8, r8, asr #1
	mov	ip, #0
	ldr	sl, [r5, #4]
	add	r2, r2, r1, asl #4
	add	r4, r4, #36
	orr	r8, r8, #-2147483648
	mov	r1, ip
.L49:
	add	r6, ip, ip, lsr #31
	add	r5, r2, r2, lsr #31
	bic	r6, r6, #1
	bic	r5, r5, #1
	add	r1, r1, #1
	add	r6, r0, r6
	add	r5, sl, r5
	cmp	r1, r3
	str	r6, [r4, #0]
	add	ip, ip, r7
	str	r5, [r4, #4]
	add	r2, r2, #240
	str	r8, [r4, #8]
	bne	.L49
.L47:
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L52:
	.align	2
.L51:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L54
	ldr	r1, [r3, #0]
	mov	r3, #-2147483648
	add	r2, r1, #36
	str	r0, [r1, #36]
	add	r3, r3, #256
	mov	r1, #83886080
	str	r1, [r2, #4]
	str	r3, [r2, #8]
	bx	lr
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.size	loadPalette, .-loadPalette
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L57
	str	r4, [sp, #-4]!
	ldr	ip, [ip, #0]
	add	r0, r0, r0, asl #1
	add	r4, ip, r0, asl #2
	orr	r3, r3, #-2147483648
	str	r1, [ip, r0, asl #2]
	str	r2, [r4, #4]
	str	r3, [r4, #8]
	ldmfd	sp!, {r4}
	bx	lr
.L58:
	.align	2
.L57:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	waitForVblank
	.type	waitForVblank, %function
waitForVblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L60:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L60
	mov	r2, #67108864
.L62:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L62
	bx	lr
	.size	waitForVblank, .-waitForVblank
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r2, [r3, #0]
	tst	r2, #16
	ldrne	r1, .L68
	ldreq	r1, .L68
	ldrne	r0, [r1, #8]
	ldreq	r0, [r1, #12]
	bicne	r2, r2, #16
	orreq	r2, r2, #16
	strneh	r2, [r3, #0]	@ movhi
	streqh	r2, [r3, #0]	@ movhi
	strne	r0, [r1, #4]
	streq	r0, [r1, #4]
	bx	lr
.L69:
	.align	2
.L68:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.global	videoBuffer
	.global	frontBuffer
	.global	backBuffer
	.global	dma
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	backBuffer, %object
	.size	backBuffer, 4
backBuffer:
	.word	100704256
	.type	frontBuffer, %object
	.size	frontBuffer, 4
frontBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 31) 4.5.0"
