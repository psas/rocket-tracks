
PWM_TEST.elf:     file format elf32-littlearm

Disassembly of section startup:

00000000 <startup>:
   0:	ea00000f 	b	44 <start>
   4:	e59ff014 	ldr	pc, [pc, #20]	; 20 <_undf>
   8:	e59ff014 	ldr	pc, [pc, #20]	; 24 <_swi>
   c:	e59ff014 	ldr	pc, [pc, #20]	; 28 <_pabt>
  10:	e59ff014 	ldr	pc, [pc, #20]	; 2c <_dabt>
  14:	e1a00000 	nop			(mov r0,r0)
  18:	e51ff120 	ldr	pc, [pc, #-288]	; ffffff00 <__ethram_beg__+0x801fff00>
  1c:	e59ff00c 	ldr	pc, [pc, #12]	; 30 <_fiq>
  20:	00000034 	andeq	r0, r0, r4, lsr r0
  24:	00000dfc 	streqd	r0, [r0], -ip
  28:	00000038 	andeq	r0, r0, r8, lsr r0
  2c:	0000003c 	andeq	r0, r0, ip, lsr r0
  30:	00000040 	andeq	r0, r0, r0, asr #32
  34:	eafffffe 	b	34 <__undf>
  38:	eafffffe 	b	38 <__pabt>
  3c:	eafffffe 	b	3c <__dabt>
  40:	eafffffe 	b	40 <F_BIT>
Disassembly of section prog:

00000044 <start>:
      44:	e59f00b8 	ldr	r0, [pc, #184]	; 104 <IRQ_STACK_SIZE+0x4>
      48:	e321f0db 	msr	CPSR_c, #219	; 0xdb
      4c:	e1a0d000 	mov	sp, r0
      50:	e2400004 	sub	r0, r0, #4	; 0x4
      54:	e321f0d7 	msr	CPSR_c, #215	; 0xd7
      58:	e1a0d000 	mov	sp, r0
      5c:	e2400004 	sub	r0, r0, #4	; 0x4
      60:	e321f0d1 	msr	CPSR_c, #209	; 0xd1
      64:	e1a0d000 	mov	sp, r0
      68:	e2400004 	sub	r0, r0, #4	; 0x4
      6c:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
      70:	e1a0d000 	mov	sp, r0
      74:	e2400c01 	sub	r0, r0, #256	; 0x100
      78:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
      7c:	e1a0d000 	mov	sp, r0
      80:	e2400c01 	sub	r0, r0, #256	; 0x100
      84:	e321f0df 	msr	CPSR_c, #223	; 0xdf
      88:	e1a0d000 	mov	sp, r0
      8c:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
      90:	e3a01000 	mov	r1, #0	; 0x0
      94:	e1a0b001 	mov	fp, r1
      98:	e1a07001 	mov	r7, r1
      9c:	e59f104c 	ldr	r1, [pc, #76]	; f0 <prog+0xac>
      a0:	e59f304c 	ldr	r3, [pc, #76]	; f4 <prog+0xb0>
      a4:	e0533001 	subs	r3, r3, r1
      a8:	0a000003 	beq	bc <.end_clear_loop>
      ac:	e3a02000 	mov	r2, #0	; 0x0

000000b0 <.clear_loop>:
      b0:	e4c12001 	strb	r2, [r1], #1
      b4:	e2533001 	subs	r3, r3, #1	; 0x1
      b8:	cafffffc 	bgt	b0 <.clear_loop>

000000bc <.end_clear_loop>:
      bc:	e59f1034 	ldr	r1, [pc, #52]	; f8 <prog+0xb4>
      c0:	e59f2034 	ldr	r2, [pc, #52]	; fc <prog+0xb8>
      c4:	e59f3034 	ldr	r3, [pc, #52]	; 100 <IRQ_STACK_SIZE>
      c8:	e0533001 	subs	r3, r3, r1
      cc:	0a000003 	beq	e0 <.end_set_loop>

000000d0 <.set_loop>:
      d0:	e4d24001 	ldrb	r4, [r2], #1
      d4:	e4c14001 	strb	r4, [r1], #1
      d8:	e2533001 	subs	r3, r3, #1	; 0x1
      dc:	cafffffb 	bgt	d0 <.set_loop>

000000e0 <.end_set_loop>:
      e0:	e3a00000 	mov	r0, #0	; 0x0
      e4:	e3a01000 	mov	r1, #0	; 0x0
      e8:	eb000006 	bl	108 <main>

000000ec <endless_loop>:
      ec:	eafffffe 	b	ec <endless_loop>
      f0:	40000004 	andmi	r0, r0, r4
      f4:	400000c8 	andmi	r0, r0, r8, asr #1
      f8:	40000000 	andmi	r0, r0, r0
      fc:	00002c58 	andeq	r2, r0, r8, asr ip
     100:	40000002 	andmi	r0, r0, r2
     104:	40007ffc 	strmid	r7, [r0], -ip

00000108 <main>:
     108:	e1a0c00d 	mov	ip, sp
     10c:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
     110:	e24cb004 	sub	fp, ip, #4	; 0x4
     114:	e24dd00c 	sub	sp, sp, #12	; 0xc
     118:	e3a03000 	mov	r3, #0	; 0x0
     11c:	e54b3012 	strb	r3, [fp, #-18]
     120:	e3a03000 	mov	r3, #0	; 0x0
     124:	e54b3011 	strb	r3, [fp, #-17]
     128:	e3a03000 	mov	r3, #0	; 0x0
     12c:	e50b3010 	str	r3, [fp, #-16]
     130:	e3a03000 	mov	r3, #0	; 0x0
     134:	e50b3018 	str	r3, [fp, #-24]
     138:	eb000264 	bl	ad0 <targetInit>
     13c:	eb000a20 	bl	29c4 <pllstart_seventytwomhz>
     140:	e3a00002 	mov	r0, #2	; 0x2
     144:	e3a01000 	mov	r1, #0	; 0x0
     148:	e3a02efa 	mov	r2, #4000	; 0xfa0
     14c:	eb00040f 	bl	1190 <pwmInitSingleEdge>
     150:	e3a00000 	mov	r0, #0	; 0x0
     154:	e3a01000 	mov	r1, #0	; 0x0
     158:	e3a02000 	mov	r2, #0	; 0x0
     15c:	e3a03000 	mov	r3, #0	; 0x0
     160:	eb0004b2 	bl	1430 <pwmSetMatchControlReg>
     164:	e3a00001 	mov	r0, #1	; 0x1
     168:	e3a01000 	mov	r1, #0	; 0x0
     16c:	e3a02000 	mov	r2, #0	; 0x0
     170:	e3a03000 	mov	r3, #0	; 0x0
     174:	eb0004ad 	bl	1430 <pwmSetMatchControlReg>
     178:	e3a00002 	mov	r0, #2	; 0x2
     17c:	e3a01000 	mov	r1, #0	; 0x0
     180:	e3a02000 	mov	r2, #0	; 0x0
     184:	e3a03000 	mov	r3, #0	; 0x0
     188:	eb0004a8 	bl	1430 <pwmSetMatchControlReg>
     18c:	e3a00003 	mov	r0, #3	; 0x3
     190:	e3a01000 	mov	r1, #0	; 0x0
     194:	e3a02000 	mov	r2, #0	; 0x0
     198:	e3a03000 	mov	r3, #0	; 0x0
     19c:	eb0004a3 	bl	1430 <pwmSetMatchControlReg>
     1a0:	e3a00004 	mov	r0, #4	; 0x4
     1a4:	e3a01000 	mov	r1, #0	; 0x0
     1a8:	e3a02000 	mov	r2, #0	; 0x0
     1ac:	e3a03000 	mov	r3, #0	; 0x0
     1b0:	eb00049e 	bl	1430 <pwmSetMatchControlReg>
     1b4:	e3a00005 	mov	r0, #5	; 0x5
     1b8:	e3a01000 	mov	r1, #0	; 0x0
     1bc:	e3a02000 	mov	r2, #0	; 0x0
     1c0:	e3a03000 	mov	r3, #0	; 0x0
     1c4:	eb000499 	bl	1430 <pwmSetMatchControlReg>
     1c8:	e3a00006 	mov	r0, #6	; 0x6
     1cc:	e3a01000 	mov	r1, #0	; 0x0
     1d0:	e3a02000 	mov	r2, #0	; 0x0
     1d4:	e3a03000 	mov	r3, #0	; 0x0
     1d8:	eb000494 	bl	1430 <pwmSetMatchControlReg>
     1dc:	e3a00000 	mov	r0, #0	; 0x0
     1e0:	e3a01001 	mov	r1, #1	; 0x1
     1e4:	eb000503 	bl	15f8 <pwmSetChannelState>
     1e8:	e3a00001 	mov	r0, #1	; 0x1
     1ec:	e3a01001 	mov	r1, #1	; 0x1
     1f0:	eb000500 	bl	15f8 <pwmSetChannelState>
     1f4:	e3a00002 	mov	r0, #2	; 0x2
     1f8:	e3a01001 	mov	r1, #1	; 0x1
     1fc:	eb0004fd 	bl	15f8 <pwmSetChannelState>
     200:	e3a00003 	mov	r0, #3	; 0x3
     204:	e3a01001 	mov	r1, #1	; 0x1
     208:	eb0004fa 	bl	15f8 <pwmSetChannelState>
     20c:	e3a00004 	mov	r0, #4	; 0x4
     210:	e3a01001 	mov	r1, #1	; 0x1
     214:	eb0004f7 	bl	15f8 <pwmSetChannelState>
     218:	e3a00005 	mov	r0, #5	; 0x5
     21c:	e3a01001 	mov	r1, #1	; 0x1
     220:	eb0004f4 	bl	15f8 <pwmSetChannelState>
     224:	e3a00006 	mov	r0, #6	; 0x6
     228:	e3a01001 	mov	r1, #1	; 0x1
     22c:	eb0004f1 	bl	15f8 <pwmSetChannelState>
     230:	e3a00ffa 	mov	r0, #1000	; 0x3e8
     234:	eb00022b 	bl	ae8 <microsecondsToPWMTicks>
     238:	e1a03000 	mov	r3, r0
     23c:	e3a00000 	mov	r0, #0	; 0x0
     240:	e1a01003 	mov	r1, r3
     244:	eb000583 	bl	1858 <pwmSetOnTimeSingleEdge>
     248:	e3a00000 	mov	r0, #0	; 0x0
     24c:	eb000225 	bl	ae8 <microsecondsToPWMTicks>
     250:	e1a03000 	mov	r3, r0
     254:	e3a00002 	mov	r0, #2	; 0x2
     258:	e1a01003 	mov	r1, r3
     25c:	eb00057d 	bl	1858 <pwmSetOnTimeSingleEdge>
     260:	e3a00000 	mov	r0, #0	; 0x0
     264:	eb00021f 	bl	ae8 <microsecondsToPWMTicks>
     268:	e1a03000 	mov	r3, r0
     26c:	e3a00003 	mov	r0, #3	; 0x3
     270:	e1a01003 	mov	r1, r3
     274:	eb000577 	bl	1858 <pwmSetOnTimeSingleEdge>
     278:	e3a00000 	mov	r0, #0	; 0x0
     27c:	eb000219 	bl	ae8 <microsecondsToPWMTicks>
     280:	e1a03000 	mov	r3, r0
     284:	e3a00004 	mov	r0, #4	; 0x4
     288:	e1a01003 	mov	r1, r3
     28c:	eb000571 	bl	1858 <pwmSetOnTimeSingleEdge>
     290:	e3a00000 	mov	r0, #0	; 0x0
     294:	eb000213 	bl	ae8 <microsecondsToPWMTicks>
     298:	e1a03000 	mov	r3, r0
     29c:	e3a00005 	mov	r0, #5	; 0x5
     2a0:	e1a01003 	mov	r1, r3
     2a4:	eb00056b 	bl	1858 <pwmSetOnTimeSingleEdge>
     2a8:	e3a00000 	mov	r0, #0	; 0x0
     2ac:	eb00020d 	bl	ae8 <microsecondsToPWMTicks>
     2b0:	e1a03000 	mov	r3, r0
     2b4:	e3a00006 	mov	r0, #6	; 0x6
     2b8:	e1a01003 	mov	r1, r3
     2bc:	eb000565 	bl	1858 <pwmSetOnTimeSingleEdge>
     2c0:	e3a032ce 	mov	r3, #-536870900	; 0xe000000c
     2c4:	e283390d 	add	r3, r3, #212992	; 0x34000
     2c8:	e3a02000 	mov	r2, #0	; 0x0
     2cc:	e5832000 	str	r2, [r3]
     2d0:	e3a0000f 	mov	r0, #15	; 0xf
     2d4:	e3a01000 	mov	r1, #0	; 0x0
     2d8:	eb00085f 	bl	245c <adc_init_cont>
     2dc:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
     2e0:	e283390d 	add	r3, r3, #212992	; 0x34000
     2e4:	e5933000 	ldr	r3, [r3]
     2e8:	e50b3018 	str	r3, [fp, #-24]
     2ec:	eb000278 	bl	cd4 <initTimer1>
     2f0:	e10f1000 	mrs	r1, CPSR
     2f4:	e3c11080 	bic	r1, r1, #128	; 0x80
     2f8:	e121f001 	msr	CPSR_c, r1
     2fc:	eaffffff 	b	300 <prog+0x2bc>
     300:	e59f25b0 	ldr	r2, [pc, #1456]	; 8b8 <prog+0x874>
     304:	e3a03000 	mov	r3, #0	; 0x0
     308:	e5823000 	str	r3, [r2]
     30c:	ea00000c 	b	344 <prog+0x300>
     310:	e59f35a0 	ldr	r3, [pc, #1440]	; 8b8 <prog+0x874>
     314:	e5932000 	ldr	r2, [r3]
     318:	e3a03a7a 	mov	r3, #499712	; 0x7a000
     31c:	e2833e12 	add	r3, r3, #288	; 0x120
     320:	e1520003 	cmp	r2, r3
     324:	93a03000 	movls	r3, #0	; 0x0
     328:	83a03001 	movhi	r3, #1	; 0x1
     32c:	e20310ff 	and	r1, r3, #255	; 0xff
     330:	e2822001 	add	r2, r2, #1	; 0x1
     334:	e59f357c 	ldr	r3, [pc, #1404]	; 8b8 <prog+0x874>
     338:	e5832000 	str	r2, [r3]
     33c:	e3510000 	cmp	r1, #0	; 0x0
     340:	1a000003 	bne	354 <prog+0x310>
     344:	e59f3570 	ldr	r3, [pc, #1392]	; 8bc <prog+0x878>
     348:	e5d33000 	ldrb	r3, [r3]
     34c:	e3530000 	cmp	r3, #0	; 0x0
     350:	0affffee 	beq	310 <prog+0x2cc>
     354:	e59f2560 	ldr	r2, [pc, #1376]	; 8bc <prog+0x878>
     358:	e3a03000 	mov	r3, #0	; 0x0
     35c:	e5c23000 	strb	r3, [r2]
     360:	e3a00000 	mov	r0, #0	; 0x0
     364:	eb0007dc 	bl	22dc <adc_read>
     368:	e1a03000 	mov	r3, r0
     36c:	e1a02003 	mov	r2, r3
     370:	e59f3548 	ldr	r3, [pc, #1352]	; 8c0 <prog+0x87c>
     374:	e1c320b8 	strh	r2, [r3, #8]
     378:	e3a00001 	mov	r0, #1	; 0x1
     37c:	eb0007d6 	bl	22dc <adc_read>
     380:	e1a03000 	mov	r3, r0
     384:	e1a02003 	mov	r2, r3
     388:	e59f3534 	ldr	r3, [pc, #1332]	; 8c4 <prog+0x880>
     38c:	e1c320b8 	strh	r2, [r3, #8]
     390:	e3a00002 	mov	r0, #2	; 0x2
     394:	eb0007d0 	bl	22dc <adc_read>
     398:	e1a03000 	mov	r3, r0
     39c:	e1a02003 	mov	r2, r3
     3a0:	e59f3518 	ldr	r3, [pc, #1304]	; 8c0 <prog+0x87c>
     3a4:	e1c320b4 	strh	r2, [r3, #4]
     3a8:	e3a00003 	mov	r0, #3	; 0x3
     3ac:	eb0007ca 	bl	22dc <adc_read>
     3b0:	e1a03000 	mov	r3, r0
     3b4:	e1a02003 	mov	r2, r3
     3b8:	e59f3504 	ldr	r3, [pc, #1284]	; 8c4 <prog+0x880>
     3bc:	e1c320b4 	strh	r2, [r3, #4]
     3c0:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     3c4:	e24331af 	sub	r3, r3, #-1073741781	; 0xc000002b
     3c8:	e5933000 	ldr	r3, [r3]
     3cc:	e1a03323 	mov	r3, r3, lsr #6
     3d0:	e20330ff 	and	r3, r3, #255	; 0xff
     3d4:	e2033001 	and	r3, r3, #1	; 0x1
     3d8:	e54b3012 	strb	r3, [fp, #-18]
     3dc:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     3e0:	e24331af 	sub	r3, r3, #-1073741781	; 0xc000002b
     3e4:	e5933000 	ldr	r3, [r3]
     3e8:	e1a034a3 	mov	r3, r3, lsr #9
     3ec:	e20330ff 	and	r3, r3, #255	; 0xff
     3f0:	e2033001 	and	r3, r3, #1	; 0x1
     3f4:	e59f24cc 	ldr	r2, [pc, #1228]	; 8c8 <prog+0x884>
     3f8:	e5c23000 	strb	r3, [r2]
     3fc:	e59f34bc 	ldr	r3, [pc, #1212]	; 8c0 <prog+0x87c>
     400:	e5d33003 	ldrb	r3, [r3, #3]
     404:	e3530000 	cmp	r3, #0	; 0x0
     408:	03a03000 	moveq	r3, #0	; 0x0
     40c:	13a03001 	movne	r3, #1	; 0x1
     410:	e20320ff 	and	r2, r3, #255	; 0xff
     414:	e59f34a4 	ldr	r3, [pc, #1188]	; 8c0 <prog+0x87c>
     418:	e5d33002 	ldrb	r3, [r3, #2]
     41c:	e3530000 	cmp	r3, #0	; 0x0
     420:	03a03000 	moveq	r3, #0	; 0x0
     424:	13a03001 	movne	r3, #1	; 0x1
     428:	e20330ff 	and	r3, r3, #255	; 0xff
     42c:	e1823003 	orr	r3, r2, r3
     430:	e20330ff 	and	r3, r3, #255	; 0xff
     434:	e3530000 	cmp	r3, #0	; 0x0
     438:	0a000003 	beq	44c <prog+0x408>
     43c:	e59f3488 	ldr	r3, [pc, #1160]	; 8cc <prog+0x888>
     440:	e3a02001 	mov	r2, #1	; 0x1
     444:	e5c32000 	strb	r2, [r3]
     448:	ea000002 	b	458 <prog+0x414>
     44c:	e59f3478 	ldr	r3, [pc, #1144]	; 8cc <prog+0x888>
     450:	e3a02002 	mov	r2, #2	; 0x2
     454:	e5c32000 	strb	r2, [r3]
     458:	e59f3464 	ldr	r3, [pc, #1124]	; 8c4 <prog+0x880>
     45c:	e5d33003 	ldrb	r3, [r3, #3]
     460:	e3530000 	cmp	r3, #0	; 0x0
     464:	03a03000 	moveq	r3, #0	; 0x0
     468:	13a03001 	movne	r3, #1	; 0x1
     46c:	e20320ff 	and	r2, r3, #255	; 0xff
     470:	e59f344c 	ldr	r3, [pc, #1100]	; 8c4 <prog+0x880>
     474:	e5d33002 	ldrb	r3, [r3, #2]
     478:	e3530000 	cmp	r3, #0	; 0x0
     47c:	03a03000 	moveq	r3, #0	; 0x0
     480:	13a03001 	movne	r3, #1	; 0x1
     484:	e20330ff 	and	r3, r3, #255	; 0xff
     488:	e1823003 	orr	r3, r2, r3
     48c:	e20330ff 	and	r3, r3, #255	; 0xff
     490:	e3530000 	cmp	r3, #0	; 0x0
     494:	0a000003 	beq	4a8 <prog+0x464>
     498:	e59f3430 	ldr	r3, [pc, #1072]	; 8d0 <prog+0x88c>
     49c:	e3a02001 	mov	r2, #1	; 0x1
     4a0:	e5c32000 	strb	r2, [r3]
     4a4:	ea000002 	b	4b4 <prog+0x470>
     4a8:	e59f3420 	ldr	r3, [pc, #1056]	; 8d0 <prog+0x88c>
     4ac:	e3a02002 	mov	r2, #2	; 0x2
     4b0:	e5c32000 	strb	r2, [r3]
     4b4:	e55b3012 	ldrb	r3, [fp, #-18]
     4b8:	e3530000 	cmp	r3, #0	; 0x0
     4bc:	0a000017 	beq	520 <prog+0x4dc>
     4c0:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     4c4:	e243319f 	sub	r3, r3, #-1073741785	; 0xc0000027
     4c8:	e3a02801 	mov	r2, #65536	; 0x10000
     4cc:	e5832000 	str	r2, [r3]
     4d0:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     4d4:	e243311f 	sub	r3, r3, #-1073741817	; 0xc0000007
     4d8:	e3a02702 	mov	r2, #524288	; 0x80000
     4dc:	e5832000 	str	r2, [r3]
     4e0:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     4e4:	e243310f 	sub	r3, r3, #-1073741821	; 0xc0000003
     4e8:	e3a02402 	mov	r2, #33554432	; 0x2000000
     4ec:	e5832000 	str	r2, [r3]
     4f0:	e59f33d0 	ldr	r3, [pc, #976]	; 8c8 <prog+0x884>
     4f4:	e5d32000 	ldrb	r2, [r3]
     4f8:	e55b3011 	ldrb	r3, [fp, #-17]
     4fc:	e1530002 	cmp	r3, r2
     500:	0a000018 	beq	568 <prog+0x524>
     504:	e59f23b4 	ldr	r2, [pc, #948]	; 8c0 <prog+0x87c>
     508:	e3a03001 	mov	r3, #1	; 0x1
     50c:	e5c23001 	strb	r3, [r2, #1]
     510:	e59f23ac 	ldr	r2, [pc, #940]	; 8c4 <prog+0x880>
     514:	e3a03001 	mov	r3, #1	; 0x1
     518:	e5c23001 	strb	r3, [r2, #1]
     51c:	ea000011 	b	568 <prog+0x524>
     520:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     524:	e243318f 	sub	r3, r3, #-1073741789	; 0xc0000023
     528:	e3a02801 	mov	r2, #65536	; 0x10000
     52c:	e5832000 	str	r2, [r3]
     530:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     534:	e243310f 	sub	r3, r3, #-1073741821	; 0xc0000003
     538:	e3a02702 	mov	r2, #524288	; 0x80000
     53c:	e5832000 	str	r2, [r3]
     540:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     544:	e243311f 	sub	r3, r3, #-1073741817	; 0xc0000007
     548:	e3a02402 	mov	r2, #33554432	; 0x2000000
     54c:	e5832000 	str	r2, [r3]
     550:	e59f2368 	ldr	r2, [pc, #872]	; 8c0 <prog+0x87c>
     554:	e3a03001 	mov	r3, #1	; 0x1
     558:	e5c23001 	strb	r3, [r2, #1]
     55c:	e59f2360 	ldr	r2, [pc, #864]	; 8c4 <prog+0x880>
     560:	e3a03001 	mov	r3, #1	; 0x1
     564:	e5c23001 	strb	r3, [r2, #1]
     568:	e59f3358 	ldr	r3, [pc, #856]	; 8c8 <prog+0x884>
     56c:	e5d33000 	ldrb	r3, [r3]
     570:	e54b3011 	strb	r3, [fp, #-17]
     574:	e59f2344 	ldr	r2, [pc, #836]	; 8c0 <prog+0x87c>
     578:	e3a0300a 	mov	r3, #10	; 0xa
     57c:	e1c232b4 	strh	r3, [r2, #36]
     580:	e59f2338 	ldr	r2, [pc, #824]	; 8c0 <prog+0x87c>
     584:	e3a0300f 	mov	r3, #15	; 0xf
     588:	e1c232b6 	strh	r3, [r2, #38]
     58c:	e59f232c 	ldr	r2, [pc, #812]	; 8c0 <prog+0x87c>
     590:	e3a03000 	mov	r3, #0	; 0x0
     594:	e1c232b8 	strh	r3, [r2, #40]
     598:	e59f2324 	ldr	r2, [pc, #804]	; 8c4 <prog+0x880>
     59c:	e3a03002 	mov	r3, #2	; 0x2
     5a0:	e1c232b4 	strh	r3, [r2, #36]
     5a4:	e59f2318 	ldr	r2, [pc, #792]	; 8c4 <prog+0x880>
     5a8:	e3a03000 	mov	r3, #0	; 0x0
     5ac:	e1c232b6 	strh	r3, [r2, #38]
     5b0:	e59f230c 	ldr	r2, [pc, #780]	; 8c4 <prog+0x880>
     5b4:	e3a03000 	mov	r3, #0	; 0x0
     5b8:	e1c232b8 	strh	r3, [r2, #40]
     5bc:	e59f22fc 	ldr	r2, [pc, #764]	; 8c0 <prog+0x87c>
     5c0:	e3a03f4b 	mov	r3, #300	; 0x12c
     5c4:	e1c232bc 	strh	r3, [r2, #44]
     5c8:	e59f22f0 	ldr	r2, [pc, #752]	; 8c0 <prog+0x87c>
     5cc:	e3a03e32 	mov	r3, #800	; 0x320
     5d0:	e1c233b6 	strh	r3, [r2, #54]
     5d4:	e59f22e4 	ldr	r2, [pc, #740]	; 8c0 <prog+0x87c>
     5d8:	e3a03082 	mov	r3, #130	; 0x82
     5dc:	e1c232ba 	strh	r3, [r2, #42]
     5e0:	e59f22dc 	ldr	r2, [pc, #732]	; 8c4 <prog+0x880>
     5e4:	e3a030fa 	mov	r3, #250	; 0xfa
     5e8:	e1c232bc 	strh	r3, [r2, #44]
     5ec:	e59f22d0 	ldr	r2, [pc, #720]	; 8c4 <prog+0x880>
     5f0:	e3a03e32 	mov	r3, #800	; 0x320
     5f4:	e1c233b6 	strh	r3, [r2, #54]
     5f8:	e59f22c4 	ldr	r2, [pc, #708]	; 8c4 <prog+0x880>
     5fc:	e3a03f4b 	mov	r3, #300	; 0x12c
     600:	e1c232ba 	strh	r3, [r2, #42]
     604:	e59f32bc 	ldr	r3, [pc, #700]	; 8c8 <prog+0x884>
     608:	e5d33000 	ldrb	r3, [r3]
     60c:	e59f22ac 	ldr	r2, [pc, #684]	; 8c0 <prog+0x87c>
     610:	e5c23000 	strb	r3, [r2]
     614:	e59f32ac 	ldr	r3, [pc, #684]	; 8c8 <prog+0x884>
     618:	e5d33000 	ldrb	r3, [r3]
     61c:	e59f22a0 	ldr	r2, [pc, #672]	; 8c4 <prog+0x880>
     620:	e5c23000 	strb	r3, [r2]
     624:	e59f0294 	ldr	r0, [pc, #660]	; 8c0 <prog+0x87c>
     628:	eb000521 	bl	1ab4 <controlLoop>
     62c:	e59f0290 	ldr	r0, [pc, #656]	; 8c4 <prog+0x880>
     630:	eb00051f 	bl	1ab4 <controlLoop>
     634:	e59f3284 	ldr	r3, [pc, #644]	; 8c0 <prog+0x87c>
     638:	e1d330b6 	ldrh	r3, [r3, #6]
     63c:	e1a03803 	mov	r3, r3, lsl #16
     640:	e1a03843 	mov	r3, r3, asr #16
     644:	e3530000 	cmp	r3, #0	; 0x0
     648:	da00001b 	ble	6bc <prog+0x678>
     64c:	e59f326c 	ldr	r3, [pc, #620]	; 8c0 <prog+0x87c>
     650:	e1d330b6 	ldrh	r3, [r3, #6]
     654:	e1a03803 	mov	r3, r3, lsl #16
     658:	e1a02843 	mov	r2, r3, asr #16
     65c:	e1a03002 	mov	r3, r2
     660:	e1a03203 	mov	r3, r3, lsl #4
     664:	e0623003 	rsb	r3, r2, r3
     668:	e1a03283 	mov	r3, r3, lsl #5
     66c:	e0623003 	rsb	r3, r2, r3
     670:	e1a03103 	mov	r3, r3, lsl #2
     674:	e1a02003 	mov	r2, r3
     678:	e59f3254 	ldr	r3, [pc, #596]	; 8d4 <prog+0x890>
     67c:	e0831392 	umull	r1, r3, r2, r3
     680:	e1a03323 	mov	r3, r3, lsr #6
     684:	e50b3010 	str	r3, [fp, #-16]
     688:	e51b0010 	ldr	r0, [fp, #-16]
     68c:	eb000115 	bl	ae8 <microsecondsToPWMTicks>
     690:	e1a03000 	mov	r3, r0
     694:	e3a00005 	mov	r0, #5	; 0x5
     698:	e1a01003 	mov	r1, r3
     69c:	eb00046d 	bl	1858 <pwmSetOnTimeSingleEdge>
     6a0:	e3a00000 	mov	r0, #0	; 0x0
     6a4:	eb00010f 	bl	ae8 <microsecondsToPWMTicks>
     6a8:	e1a03000 	mov	r3, r0
     6ac:	e3a00006 	mov	r0, #6	; 0x6
     6b0:	e1a01003 	mov	r1, r3
     6b4:	eb000467 	bl	1858 <pwmSetOnTimeSingleEdge>
     6b8:	ea00001c 	b	730 <prog+0x6ec>
     6bc:	e59f31fc 	ldr	r3, [pc, #508]	; 8c0 <prog+0x87c>
     6c0:	e1d330b6 	ldrh	r3, [r3, #6]
     6c4:	e1a03803 	mov	r3, r3, lsl #16
     6c8:	e1a02843 	mov	r2, r3, asr #16
     6cc:	e1a03002 	mov	r3, r2
     6d0:	e1a03a83 	mov	r3, r3, lsl #21
     6d4:	e0623003 	rsb	r3, r2, r3
     6d8:	e1a03203 	mov	r3, r3, lsl #4
     6dc:	e0833002 	add	r3, r3, r2
     6e0:	e1a03283 	mov	r3, r3, lsl #5
     6e4:	e0833002 	add	r3, r3, r2
     6e8:	e1a03103 	mov	r3, r3, lsl #2
     6ec:	e1a02003 	mov	r2, r3
     6f0:	e59f31dc 	ldr	r3, [pc, #476]	; 8d4 <prog+0x890>
     6f4:	e0831392 	umull	r1, r3, r2, r3
     6f8:	e1a03323 	mov	r3, r3, lsr #6
     6fc:	e50b3010 	str	r3, [fp, #-16]
     700:	e3a00000 	mov	r0, #0	; 0x0
     704:	eb0000f7 	bl	ae8 <microsecondsToPWMTicks>
     708:	e1a03000 	mov	r3, r0
     70c:	e3a00005 	mov	r0, #5	; 0x5
     710:	e1a01003 	mov	r1, r3
     714:	eb00044f 	bl	1858 <pwmSetOnTimeSingleEdge>
     718:	e51b0010 	ldr	r0, [fp, #-16]
     71c:	eb0000f1 	bl	ae8 <microsecondsToPWMTicks>
     720:	e1a03000 	mov	r3, r0
     724:	e3a00006 	mov	r0, #6	; 0x6
     728:	e1a01003 	mov	r1, r3
     72c:	eb000449 	bl	1858 <pwmSetOnTimeSingleEdge>
     730:	e59f318c 	ldr	r3, [pc, #396]	; 8c4 <prog+0x880>
     734:	e1d330b6 	ldrh	r3, [r3, #6]
     738:	e1a03803 	mov	r3, r3, lsl #16
     73c:	e1a03843 	mov	r3, r3, asr #16
     740:	e3530000 	cmp	r3, #0	; 0x0
     744:	da00001b 	ble	7b8 <prog+0x774>
     748:	e59f3174 	ldr	r3, [pc, #372]	; 8c4 <prog+0x880>
     74c:	e1d330b6 	ldrh	r3, [r3, #6]
     750:	e1a03803 	mov	r3, r3, lsl #16
     754:	e1a02843 	mov	r2, r3, asr #16
     758:	e1a03002 	mov	r3, r2
     75c:	e1a03203 	mov	r3, r3, lsl #4
     760:	e0623003 	rsb	r3, r2, r3
     764:	e1a03283 	mov	r3, r3, lsl #5
     768:	e0623003 	rsb	r3, r2, r3
     76c:	e1a03103 	mov	r3, r3, lsl #2
     770:	e1a02003 	mov	r2, r3
     774:	e59f3158 	ldr	r3, [pc, #344]	; 8d4 <prog+0x890>
     778:	e0831392 	umull	r1, r3, r2, r3
     77c:	e1a03323 	mov	r3, r3, lsr #6
     780:	e50b3010 	str	r3, [fp, #-16]
     784:	e51b0010 	ldr	r0, [fp, #-16]
     788:	eb0000d6 	bl	ae8 <microsecondsToPWMTicks>
     78c:	e1a03000 	mov	r3, r0
     790:	e3a00003 	mov	r0, #3	; 0x3
     794:	e1a01003 	mov	r1, r3
     798:	eb00042e 	bl	1858 <pwmSetOnTimeSingleEdge>
     79c:	e3a00000 	mov	r0, #0	; 0x0
     7a0:	eb0000d0 	bl	ae8 <microsecondsToPWMTicks>
     7a4:	e1a03000 	mov	r3, r0
     7a8:	e3a00002 	mov	r0, #2	; 0x2
     7ac:	e1a01003 	mov	r1, r3
     7b0:	eb000428 	bl	1858 <pwmSetOnTimeSingleEdge>
     7b4:	ea00001c 	b	82c <prog+0x7e8>
     7b8:	e59f3104 	ldr	r3, [pc, #260]	; 8c4 <prog+0x880>
     7bc:	e1d330b6 	ldrh	r3, [r3, #6]
     7c0:	e1a03803 	mov	r3, r3, lsl #16
     7c4:	e1a02843 	mov	r2, r3, asr #16
     7c8:	e1a03002 	mov	r3, r2
     7cc:	e1a03a83 	mov	r3, r3, lsl #21
     7d0:	e0623003 	rsb	r3, r2, r3
     7d4:	e1a03203 	mov	r3, r3, lsl #4
     7d8:	e0833002 	add	r3, r3, r2
     7dc:	e1a03283 	mov	r3, r3, lsl #5
     7e0:	e0833002 	add	r3, r3, r2
     7e4:	e1a03103 	mov	r3, r3, lsl #2
     7e8:	e1a02003 	mov	r2, r3
     7ec:	e59f30e0 	ldr	r3, [pc, #224]	; 8d4 <prog+0x890>
     7f0:	e0831392 	umull	r1, r3, r2, r3
     7f4:	e1a03323 	mov	r3, r3, lsr #6
     7f8:	e50b3010 	str	r3, [fp, #-16]
     7fc:	e3a00000 	mov	r0, #0	; 0x0
     800:	eb0000b8 	bl	ae8 <microsecondsToPWMTicks>
     804:	e1a03000 	mov	r3, r0
     808:	e3a00003 	mov	r0, #3	; 0x3
     80c:	e1a01003 	mov	r1, r3
     810:	eb000410 	bl	1858 <pwmSetOnTimeSingleEdge>
     814:	e51b0010 	ldr	r0, [fp, #-16]
     818:	eb0000b2 	bl	ae8 <microsecondsToPWMTicks>
     81c:	e1a03000 	mov	r3, r0
     820:	e3a00002 	mov	r0, #2	; 0x2
     824:	e1a01003 	mov	r1, r3
     828:	eb00040a 	bl	1858 <pwmSetOnTimeSingleEdge>
     82c:	eb00002b 	bl	8e0 <processLeds>
     830:	e59f30a0 	ldr	r3, [pc, #160]	; 8d8 <prog+0x894>
     834:	e5d33000 	ldrb	r3, [r3]
     838:	e3530012 	cmp	r3, #18	; 0x12
     83c:	9a000016 	bls	89c <prog+0x858>
     840:	e59f2090 	ldr	r2, [pc, #144]	; 8d8 <prog+0x894>
     844:	e3a03000 	mov	r3, #0	; 0x0
     848:	e5c23000 	strb	r3, [r2]
     84c:	e59f3088 	ldr	r3, [pc, #136]	; 8dc <prog+0x898>
     850:	e5d33000 	ldrb	r3, [r3]
     854:	e3530000 	cmp	r3, #0	; 0x0
     858:	0a000007 	beq	87c <prog+0x838>
     85c:	e59f2078 	ldr	r2, [pc, #120]	; 8dc <prog+0x898>
     860:	e3a03000 	mov	r3, #0	; 0x0
     864:	e5c23000 	strb	r3, [r2]
     868:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     86c:	e243318f 	sub	r3, r3, #-1073741789	; 0xc0000023
     870:	e3a02802 	mov	r2, #131072	; 0x20000
     874:	e5832000 	str	r2, [r3]
     878:	eafffea0 	b	300 <prog+0x2bc>
     87c:	e59f2058 	ldr	r2, [pc, #88]	; 8dc <prog+0x898>
     880:	e3a03001 	mov	r3, #1	; 0x1
     884:	e5c23000 	strb	r3, [r2]
     888:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     88c:	e243319f 	sub	r3, r3, #-1073741785	; 0xc0000027
     890:	e3a02802 	mov	r2, #131072	; 0x20000
     894:	e5832000 	str	r2, [r3]
     898:	eafffe98 	b	300 <prog+0x2bc>
     89c:	e59f3034 	ldr	r3, [pc, #52]	; 8d8 <prog+0x894>
     8a0:	e5d33000 	ldrb	r3, [r3]
     8a4:	e2833001 	add	r3, r3, #1	; 0x1
     8a8:	e20330ff 	and	r3, r3, #255	; 0xff
     8ac:	e59f2024 	ldr	r2, [pc, #36]	; 8d8 <prog+0x894>
     8b0:	e5c23000 	strb	r3, [r2]
     8b4:	eafffe91 	b	300 <prog+0x2bc>
     8b8:	40000008 	andmi	r0, r0, r8
     8bc:	40000004 	andmi	r0, r0, r4
     8c0:	40000078 	andmi	r0, r0, r8, ror r0
     8c4:	40000028 	andmi	r0, r0, r8, lsr #32
     8c8:	4000000c 	andmi	r0, r0, ip
     8cc:	40000000 	andmi	r0, r0, r0
     8d0:	40000001 	andmi	r0, r0, r1
     8d4:	10624dd3 	ldrned	r4, [r2], #-211
     8d8:	40000015 	andmi	r0, r0, r5, lsl r0
     8dc:	40000016 	andmi	r0, r0, r6, lsl r0

000008e0 <processLeds>:
     8e0:	e1a0c00d 	mov	ip, sp
     8e4:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
     8e8:	e24cb004 	sub	fp, ip, #4	; 0x4
     8ec:	e24dd008 	sub	sp, sp, #8	; 0x8
     8f0:	e59f31c4 	ldr	r3, [pc, #452]	; abc <prog+0xa78>
     8f4:	e5933000 	ldr	r3, [r3]
     8f8:	e3530032 	cmp	r3, #50	; 0x32
     8fc:	9a00000a 	bls	92c <processLeds+0x4c>
     900:	e59f21b4 	ldr	r2, [pc, #436]	; abc <prog+0xa78>
     904:	e3a03000 	mov	r3, #0	; 0x0
     908:	e5823000 	str	r3, [r2]
     90c:	e59f31ac 	ldr	r3, [pc, #428]	; ac0 <prog+0xa7c>
     910:	e5d33000 	ldrb	r3, [r3]
     914:	e1e03003 	mvn	r3, r3
     918:	e20330ff 	and	r3, r3, #255	; 0xff
     91c:	e20330ff 	and	r3, r3, #255	; 0xff
     920:	e59f2198 	ldr	r2, [pc, #408]	; ac0 <prog+0xa7c>
     924:	e5c23000 	strb	r3, [r2]
     928:	ea000004 	b	940 <processLeds+0x60>
     92c:	e59f3188 	ldr	r3, [pc, #392]	; abc <prog+0xa78>
     930:	e5933000 	ldr	r3, [r3]
     934:	e2832001 	add	r2, r3, #1	; 0x1
     938:	e59f317c 	ldr	r3, [pc, #380]	; abc <prog+0xa78>
     93c:	e5832000 	str	r2, [r3]
     940:	e59f317c 	ldr	r3, [pc, #380]	; ac4 <prog+0xa80>
     944:	e5d33000 	ldrb	r3, [r3]
     948:	e50b3014 	str	r3, [fp, #-20]
     94c:	e51b3014 	ldr	r3, [fp, #-20]
     950:	e3530001 	cmp	r3, #1	; 0x1
     954:	0a00000b 	beq	988 <processLeds+0xa8>
     958:	e51b3014 	ldr	r3, [fp, #-20]
     95c:	e3530002 	cmp	r3, #2	; 0x2
     960:	0a00000d 	beq	99c <processLeds+0xbc>
     964:	e51b3014 	ldr	r3, [fp, #-20]
     968:	e3530000 	cmp	r3, #0	; 0x0
     96c:	0a000000 	beq	974 <processLeds+0x94>
     970:	ea000016 	b	9d0 <processLeds+0xf0>
     974:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     978:	e243310f 	sub	r3, r3, #-1073741821	; 0xc0000003
     97c:	e3a02502 	mov	r2, #8388608	; 0x800000
     980:	e5832000 	str	r2, [r3]
     984:	ea000011 	b	9d0 <processLeds+0xf0>
     988:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     98c:	e243311f 	sub	r3, r3, #-1073741817	; 0xc0000007
     990:	e3a02502 	mov	r2, #8388608	; 0x800000
     994:	e5832000 	str	r2, [r3]
     998:	ea00000c 	b	9d0 <processLeds+0xf0>
     99c:	e59f311c 	ldr	r3, [pc, #284]	; ac0 <prog+0xa7c>
     9a0:	e5d33000 	ldrb	r3, [r3]
     9a4:	e3530000 	cmp	r3, #0	; 0x0
     9a8:	0a000004 	beq	9c0 <processLeds+0xe0>
     9ac:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     9b0:	e243311f 	sub	r3, r3, #-1073741817	; 0xc0000007
     9b4:	e3a02502 	mov	r2, #8388608	; 0x800000
     9b8:	e5832000 	str	r2, [r3]
     9bc:	ea000003 	b	9d0 <processLeds+0xf0>
     9c0:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     9c4:	e243310f 	sub	r3, r3, #-1073741821	; 0xc0000003
     9c8:	e3a02502 	mov	r2, #8388608	; 0x800000
     9cc:	e5832000 	str	r2, [r3]
     9d0:	e59f30f0 	ldr	r3, [pc, #240]	; ac8 <prog+0xa84>
     9d4:	e5d33000 	ldrb	r3, [r3]
     9d8:	e50b3010 	str	r3, [fp, #-16]
     9dc:	e51b3010 	ldr	r3, [fp, #-16]
     9e0:	e3530001 	cmp	r3, #1	; 0x1
     9e4:	0a00000b 	beq	a18 <processLeds+0x138>
     9e8:	e51b3010 	ldr	r3, [fp, #-16]
     9ec:	e3530002 	cmp	r3, #2	; 0x2
     9f0:	0a00000d 	beq	a2c <processLeds+0x14c>
     9f4:	e51b3010 	ldr	r3, [fp, #-16]
     9f8:	e3530000 	cmp	r3, #0	; 0x0
     9fc:	0a000000 	beq	a04 <processLeds+0x124>
     a00:	ea000016 	b	a60 <processLeds+0x180>
     a04:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     a08:	e243310f 	sub	r3, r3, #-1073741821	; 0xc0000003
     a0c:	e3a02401 	mov	r2, #16777216	; 0x1000000
     a10:	e5832000 	str	r2, [r3]
     a14:	ea000011 	b	a60 <processLeds+0x180>
     a18:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     a1c:	e243311f 	sub	r3, r3, #-1073741817	; 0xc0000007
     a20:	e3a02401 	mov	r2, #16777216	; 0x1000000
     a24:	e5832000 	str	r2, [r3]
     a28:	ea00000c 	b	a60 <processLeds+0x180>
     a2c:	e59f308c 	ldr	r3, [pc, #140]	; ac0 <prog+0xa7c>
     a30:	e5d33000 	ldrb	r3, [r3]
     a34:	e3530000 	cmp	r3, #0	; 0x0
     a38:	0a000004 	beq	a50 <processLeds+0x170>
     a3c:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     a40:	e243311f 	sub	r3, r3, #-1073741817	; 0xc0000007
     a44:	e3a02401 	mov	r2, #16777216	; 0x1000000
     a48:	e5832000 	str	r2, [r3]
     a4c:	ea000003 	b	a60 <processLeds+0x180>
     a50:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     a54:	e243310f 	sub	r3, r3, #-1073741821	; 0xc0000003
     a58:	e3a02401 	mov	r2, #16777216	; 0x1000000
     a5c:	e5832000 	str	r2, [r3]
     a60:	e59f3064 	ldr	r3, [pc, #100]	; acc <prog+0xa88>
     a64:	e5d33000 	ldrb	r3, [r3]
     a68:	e3530000 	cmp	r3, #0	; 0x0
     a6c:	0a000008 	beq	a94 <processLeds+0x1b4>
     a70:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     a74:	e243311f 	sub	r3, r3, #-1073741817	; 0xc0000007
     a78:	e3a02301 	mov	r2, #67108864	; 0x4000000
     a7c:	e5832000 	str	r2, [r3]
     a80:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     a84:	e243310f 	sub	r3, r3, #-1073741821	; 0xc0000003
     a88:	e3a02302 	mov	r2, #134217728	; 0x8000000
     a8c:	e5832000 	str	r2, [r3]
     a90:	ea000007 	b	ab4 <processLeds+0x1d4>
     a94:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     a98:	e243310f 	sub	r3, r3, #-1073741821	; 0xc0000003
     a9c:	e3a02301 	mov	r2, #67108864	; 0x4000000
     aa0:	e5832000 	str	r2, [r3]
     aa4:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     aa8:	e243311f 	sub	r3, r3, #-1073741817	; 0xc0000007
     aac:	e3a02302 	mov	r2, #134217728	; 0x8000000
     ab0:	e5832000 	str	r2, [r3]
     ab4:	e24bd00c 	sub	sp, fp, #12	; 0xc
     ab8:	e89da800 	ldmia	sp, {fp, sp, pc}
     abc:	40000010 	andmi	r0, r0, r0, lsl r0
     ac0:	40000014 	andmi	r0, r0, r4, lsl r0
     ac4:	40000000 	andmi	r0, r0, r0
     ac8:	40000001 	andmi	r0, r0, r1
     acc:	4000000c 	andmi	r0, r0, ip

00000ad0 <targetInit>:
     ad0:	e1a0c00d 	mov	ip, sp
     ad4:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
     ad8:	e24cb004 	sub	fp, ip, #4	; 0x4
     adc:	eb00011d 	bl	f58 <targetGPIOResetPins>
     ae0:	eb0000cf 	bl	e24 <targetSetPinsForApplication>
     ae4:	e89da800 	ldmia	sp, {fp, sp, pc}

00000ae8 <microsecondsToPWMTicks>:
     ae8:	e1a0c00d 	mov	ip, sp
     aec:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
     af0:	e24cb004 	sub	fp, ip, #4	; 0x4
     af4:	e24dd008 	sub	sp, sp, #8	; 0x8
     af8:	e50b0014 	str	r0, [fp, #-20]
     afc:	eb0003d0 	bl	1a44 <pwmGetPclk>
     b00:	e1a02000 	mov	r2, r0
     b04:	e59f3020 	ldr	r3, [pc, #32]	; b2c <prog+0xae8>
     b08:	e0831392 	umull	r1, r3, r2, r3
     b0c:	e1a02923 	mov	r2, r3, lsr #18
     b10:	e51b3014 	ldr	r3, [fp, #-20]
     b14:	e0030392 	mul	r3, r2, r3
     b18:	e50b3010 	str	r3, [fp, #-16]
     b1c:	e51b3010 	ldr	r3, [fp, #-16]
     b20:	e1a00003 	mov	r0, r3
     b24:	e24bd00c 	sub	sp, fp, #12	; 0xc
     b28:	e89da800 	ldmia	sp, {fp, sp, pc}
     b2c:	431bde83 	tstmi	fp, #2096	; 0x830

00000b30 <nanosecondsToPWMTicks>:
     b30:	e1a0c00d 	mov	ip, sp
     b34:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
     b38:	e24cb004 	sub	fp, ip, #4	; 0x4
     b3c:	e24dd008 	sub	sp, sp, #8	; 0x8
     b40:	e50b0014 	str	r0, [fp, #-20]
     b44:	eb0003be 	bl	1a44 <pwmGetPclk>
     b48:	e1a02000 	mov	r2, r0
     b4c:	e51b3014 	ldr	r3, [fp, #-20]
     b50:	e0030392 	mul	r3, r2, r3
     b54:	e1a024a3 	mov	r2, r3, lsr #9
     b58:	e3a03911 	mov	r3, #278528	; 0x44000
     b5c:	e2833d2e 	add	r3, r3, #2944	; 0xb80
     b60:	e2833003 	add	r3, r3, #3	; 0x3
     b64:	e0831392 	umull	r1, r3, r2, r3
     b68:	e1a033a3 	mov	r3, r3, lsr #7
     b6c:	e50b3010 	str	r3, [fp, #-16]
     b70:	e51b3010 	ldr	r3, [fp, #-16]
     b74:	e1a00003 	mov	r0, r3
     b78:	e24bd00c 	sub	sp, fp, #12	; 0xc
     b7c:	e89da800 	ldmia	sp, {fp, sp, pc}

00000b80 <install_irq>:
     b80:	e1a0c00d 	mov	ip, sp
     b84:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
     b88:	e24cb004 	sub	fp, ip, #4	; 0x4
     b8c:	e24dd01c 	sub	sp, sp, #28	; 0x1c
     b90:	e50b101c 	str	r1, [fp, #-28]
     b94:	e50b2020 	str	r2, [fp, #-32]
     b98:	e1a02003 	mov	r2, r3
     b9c:	e1a03000 	mov	r3, r0
     ba0:	e54b3018 	strb	r3, [fp, #-24]
     ba4:	e1a03002 	mov	r3, r2
     ba8:	e54b3024 	strb	r3, [fp, #-36]
     bac:	e3e02efe 	mvn	r2, #4064	; 0xfe0
     bb0:	e242200b 	sub	r2, r2, #11	; 0xb
     bb4:	e55b1018 	ldrb	r1, [fp, #-24]
     bb8:	e3a03001 	mov	r3, #1	; 0x1
     bbc:	e1a03113 	mov	r3, r3, lsl r1
     bc0:	e5823000 	str	r3, [r2]
     bc4:	e55b3018 	ldrb	r3, [fp, #-24]
     bc8:	e353001f 	cmp	r3, #31	; 0x1f
     bcc:	9a000002 	bls	bdc <install_irq+0x5c>
     bd0:	e3a03000 	mov	r3, #0	; 0x0
     bd4:	e50b3028 	str	r3, [fp, #-40]
     bd8:	ea00002b 	b	c8c <install_irq+0x10c>
     bdc:	e55b3018 	ldrb	r3, [fp, #-24]
     be0:	e1a03103 	mov	r3, r3, lsl #2
     be4:	e2433c0f 	sub	r3, r3, #3840	; 0xf00
     be8:	e50b3014 	str	r3, [fp, #-20]
     bec:	e55b3018 	ldrb	r3, [fp, #-24]
     bf0:	e1a03103 	mov	r3, r3, lsl #2
     bf4:	e2433c0e 	sub	r3, r3, #3584	; 0xe00
     bf8:	e50b3010 	str	r3, [fp, #-16]
     bfc:	e51b301c 	ldr	r3, [fp, #-28]
     c00:	e1a02003 	mov	r2, r3
     c04:	e51b3014 	ldr	r3, [fp, #-20]
     c08:	e5832000 	str	r2, [r3]
     c0c:	e51b2010 	ldr	r2, [fp, #-16]
     c10:	e51b3020 	ldr	r3, [fp, #-32]
     c14:	e5823000 	str	r3, [r2]
     c18:	e3a02000 	mov	r2, #0	; 0x0
     c1c:	e2422eff 	sub	r2, r2, #4080	; 0xff0
     c20:	e55b1018 	ldrb	r1, [fp, #-24]
     c24:	e3a03001 	mov	r3, #1	; 0x1
     c28:	e1a03113 	mov	r3, r3, lsl r1
     c2c:	e5823000 	str	r3, [r2]
     c30:	e3e01eff 	mvn	r1, #4080	; 0xff0
     c34:	e2411003 	sub	r1, r1, #3	; 0x3
     c38:	e3e03eff 	mvn	r3, #4080	; 0xff0
     c3c:	e2433003 	sub	r3, r3, #3	; 0x3
     c40:	e5930000 	ldr	r0, [r3]
     c44:	e55b2024 	ldrb	r2, [fp, #-36]
     c48:	e55b3018 	ldrb	r3, [fp, #-24]
     c4c:	e1a03312 	mov	r3, r2, lsl r3
     c50:	e1e03003 	mvn	r3, r3
     c54:	e0003003 	and	r3, r0, r3
     c58:	e5813000 	str	r3, [r1]
     c5c:	e3e01eff 	mvn	r1, #4080	; 0xff0
     c60:	e2411003 	sub	r1, r1, #3	; 0x3
     c64:	e3e03eff 	mvn	r3, #4080	; 0xff0
     c68:	e2433003 	sub	r3, r3, #3	; 0x3
     c6c:	e5930000 	ldr	r0, [r3]
     c70:	e55b2024 	ldrb	r2, [fp, #-36]
     c74:	e55b3018 	ldrb	r3, [fp, #-24]
     c78:	e1a03312 	mov	r3, r2, lsl r3
     c7c:	e1803003 	orr	r3, r0, r3
     c80:	e5813000 	str	r3, [r1]
     c84:	e3a03001 	mov	r3, #1	; 0x1
     c88:	e50b3028 	str	r3, [fp, #-40]
     c8c:	e51b3028 	ldr	r3, [fp, #-40]
     c90:	e1a00003 	mov	r0, r3
     c94:	e24bd00c 	sub	sp, fp, #12	; 0xc
     c98:	e89da800 	ldmia	sp, {fp, sp, pc}

00000c9c <TIMER1Handler>:
     c9c:	e24ee004 	sub	lr, lr, #4	; 0x4
     ca0:	e92d500f 	stmdb	sp!, {r0, r1, r2, r3, ip, lr}
     ca4:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
     ca8:	e2833902 	add	r3, r3, #32768	; 0x8000
     cac:	e3a02001 	mov	r2, #1	; 0x1
     cb0:	e5832000 	str	r2, [r3]
     cb4:	e59f2014 	ldr	r2, [pc, #20]	; cd0 <prog+0xc8c>
     cb8:	e3a03001 	mov	r3, #1	; 0x1
     cbc:	e5c23000 	strb	r3, [r2]
     cc0:	e3e020ff 	mvn	r2, #255	; 0xff
     cc4:	e3a03000 	mov	r3, #0	; 0x0
     cc8:	e5823000 	str	r3, [r2]
     ccc:	e8fd900f 	ldmia	sp!, {r0, r1, r2, r3, ip, pc}^
     cd0:	40000004 	andmi	r0, r0, r4

00000cd4 <initTimer1>:
     cd4:	e1a0c00d 	mov	ip, sp
     cd8:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
     cdc:	e24cb004 	sub	fp, ip, #4	; 0x4
     ce0:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
     ce4:	e282297f 	add	r2, r2, #2080768	; 0x1fc000
     ce8:	e28220c4 	add	r2, r2, #196	; 0xc4
     cec:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
     cf0:	e283397f 	add	r3, r3, #2080768	; 0x1fc000
     cf4:	e28330c4 	add	r3, r3, #196	; 0xc4
     cf8:	e5933000 	ldr	r3, [r3]
     cfc:	e3833004 	orr	r3, r3, #4	; 0x4
     d00:	e5823000 	str	r3, [r2]
     d04:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
     d08:	e282297f 	add	r2, r2, #2080768	; 0x1fc000
     d0c:	e2822f6a 	add	r2, r2, #424	; 0x1a8
     d10:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
     d14:	e283397f 	add	r3, r3, #2080768	; 0x1fc000
     d18:	e2833f6a 	add	r3, r3, #424	; 0x1a8
     d1c:	e5933000 	ldr	r3, [r3]
     d20:	e3c33030 	bic	r3, r3, #48	; 0x30
     d24:	e5823000 	str	r3, [r2]
     d28:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
     d2c:	e282297f 	add	r2, r2, #2080768	; 0x1fc000
     d30:	e2822f6a 	add	r2, r2, #424	; 0x1a8
     d34:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
     d38:	e283397f 	add	r3, r3, #2080768	; 0x1fc000
     d3c:	e2833f6a 	add	r3, r3, #424	; 0x1a8
     d40:	e5933000 	ldr	r3, [r3]
     d44:	e5823000 	str	r3, [r2]
     d48:	e3a03902 	mov	r3, #32768	; 0x8000
     d4c:	e283324e 	add	r3, r3, #-536870908	; 0xe0000004
     d50:	e3a02002 	mov	r2, #2	; 0x2
     d54:	e5832000 	str	r2, [r3]
     d58:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
     d5c:	e2833902 	add	r3, r3, #32768	; 0x8000
     d60:	e2833070 	add	r3, r3, #112	; 0x70
     d64:	e3a02000 	mov	r2, #0	; 0x0
     d68:	e5832000 	str	r2, [r3]
     d6c:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
     d70:	e2822902 	add	r2, r2, #32768	; 0x8000
     d74:	e2822018 	add	r2, r2, #24	; 0x18
     d78:	e3a03b23 	mov	r3, #35840	; 0x8c00
     d7c:	e28330a0 	add	r3, r3, #160	; 0xa0
     d80:	e5823000 	str	r3, [r2]
     d84:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
     d88:	e2833902 	add	r3, r3, #32768	; 0x8000
     d8c:	e2833014 	add	r3, r3, #20	; 0x14
     d90:	e3a02003 	mov	r2, #3	; 0x3
     d94:	e5832000 	str	r2, [r3]
     d98:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
     d9c:	e2833902 	add	r3, r3, #32768	; 0x8000
     da0:	e3a02001 	mov	r2, #1	; 0x1
     da4:	e5832000 	str	r2, [r3]
     da8:	e3a00005 	mov	r0, #5	; 0x5
     dac:	e59f101c 	ldr	r1, [pc, #28]	; dd0 <prog+0xd8c>
     db0:	e3a02002 	mov	r2, #2	; 0x2
     db4:	e3a03000 	mov	r3, #0	; 0x0
     db8:	ebffff70 	bl	b80 <install_irq>
     dbc:	e3a03902 	mov	r3, #32768	; 0x8000
     dc0:	e283324e 	add	r3, r3, #-536870908	; 0xe0000004
     dc4:	e3a02001 	mov	r2, #1	; 0x1
     dc8:	e5832000 	str	r2, [r3]
     dcc:	e89da800 	ldmia	sp, {fp, sp, pc}
     dd0:	00000c9c 	muleq	r0, ip, ip

00000dd4 <IRQ_Routine>:
     dd4:	e52dc004 	str	ip, [sp, #-4]!
     dd8:	e1a0c00d 	mov	ip, sp
     ddc:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
     de0:	e24cb004 	sub	fp, ip, #4	; 0x4
     de4:	eafffffe 	b	de4 <IRQ_Routine+0x10>

00000de8 <FIQ_Routine>:
     de8:	e52dc004 	str	ip, [sp, #-4]!
     dec:	e1a0c00d 	mov	ip, sp
     df0:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
     df4:	e24cb004 	sub	fp, ip, #4	; 0x4
     df8:	eafffffe 	b	df8 <FIQ_Routine+0x10>

00000dfc <SWI_Routine>:
     dfc:	e52dc004 	str	ip, [sp, #-4]!
     e00:	e1a0c00d 	mov	ip, sp
     e04:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
     e08:	e24cb004 	sub	fp, ip, #4	; 0x4
     e0c:	eafffffe 	b	e0c <SWI_Routine+0x10>

00000e10 <UNDEF_Routine>:
     e10:	e52dc004 	str	ip, [sp, #-4]!
     e14:	e1a0c00d 	mov	ip, sp
     e18:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
     e1c:	e24cb004 	sub	fp, ip, #4	; 0x4
     e20:	eafffffe 	b	e20 <UNDEF_Routine+0x10>

00000e24 <targetSetPinsForApplication>:
     e24:	e1a0c00d 	mov	ip, sp
     e28:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
     e2c:	e24cb004 	sub	fp, ip, #4	; 0x4
     e30:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
     e34:	e282297f 	add	r2, r2, #2080768	; 0x1fc000
     e38:	e2822e1a 	add	r2, r2, #416	; 0x1a0
     e3c:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
     e40:	e283397f 	add	r3, r3, #2080768	; 0x1fc000
     e44:	e2833e1a 	add	r3, r3, #416	; 0x1a0
     e48:	e5933000 	ldr	r3, [r3]
     e4c:	e3833001 	orr	r3, r3, #1	; 0x1
     e50:	e5823000 	str	r3, [r2]
     e54:	e3e02dff 	mvn	r2, #16320	; 0x3fc0
     e58:	e242217f 	sub	r2, r2, #-1073741793	; 0xc000001f
     e5c:	e3a0353f 	mov	r3, #264241152	; 0xfc00000
     e60:	e2833702 	add	r3, r3, #524288	; 0x80000
     e64:	e5823000 	str	r3, [r2]
     e68:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     e6c:	e243311f 	sub	r3, r3, #-1073741817	; 0xc0000007
     e70:	e3a02792 	mov	r2, #38273024	; 0x2480000
     e74:	e5832000 	str	r2, [r3]
     e78:	e3a02101 	mov	r2, #1073741824	; 0x40000000
     e7c:	e2422901 	sub	r2, r2, #16384	; 0x4000
     e80:	e3a03101 	mov	r3, #1073741824	; 0x40000000
     e84:	e2433901 	sub	r3, r3, #16384	; 0x4000
     e88:	e5933000 	ldr	r3, [r3]
     e8c:	e3c33d0f 	bic	r3, r3, #960	; 0x3c0
     e90:	e5823000 	str	r3, [r2]
     e94:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
     e98:	e282290b 	add	r2, r2, #180224	; 0x2c000
     e9c:	e2822040 	add	r2, r2, #64	; 0x40
     ea0:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
     ea4:	e283390b 	add	r3, r3, #180224	; 0x2c000
     ea8:	e2833040 	add	r3, r3, #64	; 0x40
     eac:	e5933000 	ldr	r3, [r3]
     eb0:	e3833aff 	orr	r3, r3, #1044480	; 0xff000
     eb4:	e5823000 	str	r3, [r2]
     eb8:	e3a02101 	mov	r2, #1073741824	; 0x40000000
     ebc:	e2422901 	sub	r2, r2, #16384	; 0x4000
     ec0:	e3a03101 	mov	r3, #1073741824	; 0x40000000
     ec4:	e2433901 	sub	r3, r3, #16384	; 0x4000
     ec8:	e5933000 	ldr	r3, [r3]
     ecc:	e3833803 	orr	r3, r3, #196608	; 0x30000
     ed0:	e5823000 	str	r3, [r2]
     ed4:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
     ed8:	e243318f 	sub	r3, r3, #-1073741789	; 0xc0000023
     edc:	e3a02803 	mov	r2, #196608	; 0x30000
     ee0:	e5832000 	str	r2, [r3]
     ee4:	e3a02101 	mov	r2, #1073741824	; 0x40000000
     ee8:	e2422901 	sub	r2, r2, #16384	; 0x4000
     eec:	e3a03101 	mov	r3, #1073741824	; 0x40000000
     ef0:	e2433901 	sub	r3, r3, #16384	; 0x4000
     ef4:	e5933000 	ldr	r3, [r3]
     ef8:	e3c3351e 	bic	r3, r3, #125829120	; 0x7800000
     efc:	e5823000 	str	r3, [r2]
     f00:	e3a0324e 	mov	r3, #-536870908	; 0xe0000004
     f04:	e283390b 	add	r3, r3, #180224	; 0x2c000
     f08:	e3a02955 	mov	r2, #1392640	; 0x154000
     f0c:	e5832000 	str	r2, [r3]
     f10:	e3e03dfe 	mvn	r3, #16256	; 0x3f80
     f14:	e243318f 	sub	r3, r3, #-1073741789	; 0xc0000023
     f18:	e3a0200f 	mov	r2, #15	; 0xf
     f1c:	e5832000 	str	r2, [r3]
     f20:	e3a02101 	mov	r2, #1073741824	; 0x40000000
     f24:	e2422dff 	sub	r2, r2, #16320	; 0x3fc0
     f28:	e3a03101 	mov	r3, #1073741824	; 0x40000000
     f2c:	e2433dff 	sub	r3, r3, #16320	; 0x3fc0
     f30:	e5933000 	ldr	r3, [r3]
     f34:	e383303f 	orr	r3, r3, #63	; 0x3f
     f38:	e5823000 	str	r3, [r2]
     f3c:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
     f40:	e282290b 	add	r2, r2, #180224	; 0x2c000
     f44:	e2822010 	add	r2, r2, #16	; 0x10
     f48:	e3a03e55 	mov	r3, #1360	; 0x550
     f4c:	e2833005 	add	r3, r3, #5	; 0x5
     f50:	e5823000 	str	r3, [r2]
     f54:	e89da800 	ldmia	sp, {fp, sp, pc}

00000f58 <targetGPIOResetPins>:
     f58:	e1a0c00d 	mov	ip, sp
     f5c:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
     f60:	e24cb004 	sub	fp, ip, #4	; 0x4
     f64:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
     f68:	e282297f 	add	r2, r2, #2080768	; 0x1fc000
     f6c:	e2822e1a 	add	r2, r2, #416	; 0x1a0
     f70:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
     f74:	e283397f 	add	r3, r3, #2080768	; 0x1fc000
     f78:	e2833e1a 	add	r3, r3, #416	; 0x1a0
     f7c:	e5933000 	ldr	r3, [r3]
     f80:	e3833001 	orr	r3, r3, #1	; 0x1
     f84:	e5823000 	str	r3, [r2]
     f88:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
     f8c:	e283390b 	add	r3, r3, #180224	; 0x2c000
     f90:	e3a02000 	mov	r2, #0	; 0x0
     f94:	e5832000 	str	r2, [r3]
     f98:	e3a0324e 	mov	r3, #-536870908	; 0xe0000004
     f9c:	e283390b 	add	r3, r3, #180224	; 0x2c000
     fa0:	e3a02000 	mov	r2, #0	; 0x0
     fa4:	e5832000 	str	r2, [r3]
     fa8:	e3a0328e 	mov	r3, #-536870904	; 0xe0000008
     fac:	e283390b 	add	r3, r3, #180224	; 0x2c000
     fb0:	e3a02000 	mov	r2, #0	; 0x0
     fb4:	e5832000 	str	r2, [r3]
     fb8:	e3a032ce 	mov	r3, #-536870900	; 0xe000000c
     fbc:	e283390b 	add	r3, r3, #180224	; 0x2c000
     fc0:	e3a02000 	mov	r2, #0	; 0x0
     fc4:	e5832000 	str	r2, [r3]
     fc8:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
     fcc:	e283390b 	add	r3, r3, #180224	; 0x2c000
     fd0:	e2833010 	add	r3, r3, #16	; 0x10
     fd4:	e3a02000 	mov	r2, #0	; 0x0
     fd8:	e5832000 	str	r2, [r3]
     fdc:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
     fe0:	e283390b 	add	r3, r3, #180224	; 0x2c000
     fe4:	e2833014 	add	r3, r3, #20	; 0x14
     fe8:	e3a02000 	mov	r2, #0	; 0x0
     fec:	e5832000 	str	r2, [r3]
     ff0:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
     ff4:	e283390b 	add	r3, r3, #180224	; 0x2c000
     ff8:	e2833018 	add	r3, r3, #24	; 0x18
     ffc:	e3a02000 	mov	r2, #0	; 0x0
    1000:	e5832000 	str	r2, [r3]
    1004:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1008:	e283390b 	add	r3, r3, #180224	; 0x2c000
    100c:	e283301c 	add	r3, r3, #28	; 0x1c
    1010:	e3a02000 	mov	r2, #0	; 0x0
    1014:	e5832000 	str	r2, [r3]
    1018:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    101c:	e283390b 	add	r3, r3, #180224	; 0x2c000
    1020:	e2833020 	add	r3, r3, #32	; 0x20
    1024:	e3a02000 	mov	r2, #0	; 0x0
    1028:	e5832000 	str	r2, [r3]
    102c:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1030:	e283390b 	add	r3, r3, #180224	; 0x2c000
    1034:	e2833024 	add	r3, r3, #36	; 0x24
    1038:	e3a02000 	mov	r2, #0	; 0x0
    103c:	e5832000 	str	r2, [r3]
    1040:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1044:	e283390b 	add	r3, r3, #180224	; 0x2c000
    1048:	e2833028 	add	r3, r3, #40	; 0x28
    104c:	e3a02000 	mov	r2, #0	; 0x0
    1050:	e5832000 	str	r2, [r3]
    1054:	e3a0328e 	mov	r3, #-536870904	; 0xe0000008
    1058:	e283390a 	add	r3, r3, #163840	; 0x28000
    105c:	e3a02000 	mov	r2, #0	; 0x0
    1060:	e5832000 	str	r2, [r3]
    1064:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1068:	e283390a 	add	r3, r3, #163840	; 0x28000
    106c:	e2833018 	add	r3, r3, #24	; 0x18
    1070:	e3a02000 	mov	r2, #0	; 0x0
    1074:	e5832000 	str	r2, [r3]
    1078:	e3a032ce 	mov	r3, #-536870900	; 0xe000000c
    107c:	e283390a 	add	r3, r3, #163840	; 0x28000
    1080:	e3e02000 	mvn	r2, #0	; 0x0
    1084:	e5832000 	str	r2, [r3]
    1088:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    108c:	e283390a 	add	r3, r3, #163840	; 0x28000
    1090:	e283301c 	add	r3, r3, #28	; 0x1c
    1094:	e3e02000 	mvn	r2, #0	; 0x0
    1098:	e5832000 	str	r2, [r3]
    109c:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
    10a0:	e24331bf 	sub	r3, r3, #-1073741777	; 0xc000002f
    10a4:	e3a02000 	mov	r2, #0	; 0x0
    10a8:	e5832000 	str	r2, [r3]
    10ac:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
    10b0:	e243313f 	sub	r3, r3, #-1073741809	; 0xc000000f
    10b4:	e3a02000 	mov	r2, #0	; 0x0
    10b8:	e5832000 	str	r2, [r3]
    10bc:	e3e03dfe 	mvn	r3, #16256	; 0x3f80
    10c0:	e24331bf 	sub	r3, r3, #-1073741777	; 0xc000002f
    10c4:	e3a02000 	mov	r2, #0	; 0x0
    10c8:	e5832000 	str	r2, [r3]
    10cc:	e3e03dfe 	mvn	r3, #16256	; 0x3f80
    10d0:	e243313f 	sub	r3, r3, #-1073741809	; 0xc000000f
    10d4:	e3a02000 	mov	r2, #0	; 0x0
    10d8:	e5832000 	str	r2, [r3]
    10dc:	e3e03dfd 	mvn	r3, #16192	; 0x3f40
    10e0:	e24331bf 	sub	r3, r3, #-1073741777	; 0xc000002f
    10e4:	e3a02000 	mov	r2, #0	; 0x0
    10e8:	e5832000 	str	r2, [r3]
    10ec:	e3a03101 	mov	r3, #1073741824	; 0x40000000
    10f0:	e2433901 	sub	r3, r3, #16384	; 0x4000
    10f4:	e3a02000 	mov	r2, #0	; 0x0
    10f8:	e5832000 	str	r2, [r3]
    10fc:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
    1100:	e243317f 	sub	r3, r3, #-1073741793	; 0xc000001f
    1104:	e3a02000 	mov	r2, #0	; 0x0
    1108:	e5832000 	str	r2, [r3]
    110c:	e3a03101 	mov	r3, #1073741824	; 0x40000000
    1110:	e2433dff 	sub	r3, r3, #16320	; 0x3fc0
    1114:	e3a02000 	mov	r2, #0	; 0x0
    1118:	e5832000 	str	r2, [r3]
    111c:	e3e03dfe 	mvn	r3, #16256	; 0x3f80
    1120:	e243317f 	sub	r3, r3, #-1073741793	; 0xc000001f
    1124:	e3a02000 	mov	r2, #0	; 0x0
    1128:	e5832000 	str	r2, [r3]
    112c:	e3a03101 	mov	r3, #1073741824	; 0x40000000
    1130:	e2433dfe 	sub	r3, r3, #16256	; 0x3f80
    1134:	e3a02000 	mov	r2, #0	; 0x0
    1138:	e5832000 	str	r2, [r3]
    113c:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
    1140:	e243318f 	sub	r3, r3, #-1073741789	; 0xc0000023
    1144:	e3e02000 	mvn	r2, #0	; 0x0
    1148:	e5832000 	str	r2, [r3]
    114c:	e3e03dff 	mvn	r3, #16320	; 0x3fc0
    1150:	e243310f 	sub	r3, r3, #-1073741821	; 0xc0000003
    1154:	e3e02000 	mvn	r2, #0	; 0x0
    1158:	e5832000 	str	r2, [r3]
    115c:	e3e03dfe 	mvn	r3, #16256	; 0x3f80
    1160:	e243318f 	sub	r3, r3, #-1073741789	; 0xc0000023
    1164:	e3e02000 	mvn	r2, #0	; 0x0
    1168:	e5832000 	str	r2, [r3]
    116c:	e3e03dfe 	mvn	r3, #16256	; 0x3f80
    1170:	e243310f 	sub	r3, r3, #-1073741821	; 0xc0000003
    1174:	e3e02000 	mvn	r2, #0	; 0x0
    1178:	e5832000 	str	r2, [r3]
    117c:	e3e03dfd 	mvn	r3, #16192	; 0x3f40
    1180:	e243318f 	sub	r3, r3, #-1073741789	; 0xc0000023
    1184:	e3e02000 	mvn	r2, #0	; 0x0
    1188:	e5832000 	str	r2, [r3]
    118c:	e89da800 	ldmia	sp, {fp, sp, pc}

00001190 <pwmInitSingleEdge>:
    1190:	e1a0c00d 	mov	ip, sp
    1194:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
    1198:	e24cb004 	sub	fp, ip, #4	; 0x4
    119c:	e24dd014 	sub	sp, sp, #20	; 0x14
    11a0:	e50b0018 	str	r0, [fp, #-24]
    11a4:	e50b101c 	str	r1, [fp, #-28]
    11a8:	e50b2020 	str	r2, [fp, #-32]
    11ac:	eb000535 	bl	2688 <pllquery_cclk_mhz>
    11b0:	e1a03000 	mov	r3, r0
    11b4:	e50b3014 	str	r3, [fp, #-20]
    11b8:	e51b3018 	ldr	r3, [fp, #-24]
    11bc:	e3530004 	cmp	r3, #4	; 0x4
    11c0:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
    11c4:	ea00003c 	b	12bc <prog+0x1278>
    11c8:	000011dc 	ldreqd	r1, [r0], -ip
    11cc:	00001214 	andeq	r1, r0, r4, lsl r2
    11d0:	00001250 	andeq	r1, r0, r0, asr r2
    11d4:	000012bc 	streqh	r1, [r0], -ip
    11d8:	00001284 	andeq	r1, r0, r4, lsl #5
    11dc:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    11e0:	e282297f 	add	r2, r2, #2080768	; 0x1fc000
    11e4:	e2822f6a 	add	r2, r2, #424	; 0x1a8
    11e8:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    11ec:	e283397f 	add	r3, r3, #2080768	; 0x1fc000
    11f0:	e2833f6a 	add	r3, r3, #424	; 0x1a8
    11f4:	e5933000 	ldr	r3, [r3]
    11f8:	e3c33a01 	bic	r3, r3, #4096	; 0x1000
    11fc:	e3833a01 	orr	r3, r3, #4096	; 0x1000
    1200:	e5823000 	str	r3, [r2]
    1204:	e59f221c 	ldr	r2, [pc, #540]	; 1428 <prog+0x13e4>
    1208:	e51b3014 	ldr	r3, [fp, #-20]
    120c:	e5823000 	str	r3, [r2]
    1210:	ea000029 	b	12bc <prog+0x1278>
    1214:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    1218:	e282297f 	add	r2, r2, #2080768	; 0x1fc000
    121c:	e2822f6a 	add	r2, r2, #424	; 0x1a8
    1220:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1224:	e283397f 	add	r3, r3, #2080768	; 0x1fc000
    1228:	e2833f6a 	add	r3, r3, #424	; 0x1a8
    122c:	e5933000 	ldr	r3, [r3]
    1230:	e3c33a02 	bic	r3, r3, #8192	; 0x2000
    1234:	e3833a02 	orr	r3, r3, #8192	; 0x2000
    1238:	e5823000 	str	r3, [r2]
    123c:	e51b3014 	ldr	r3, [fp, #-20]
    1240:	e1a020a3 	mov	r2, r3, lsr #1
    1244:	e59f31dc 	ldr	r3, [pc, #476]	; 1428 <prog+0x13e4>
    1248:	e5832000 	str	r2, [r3]
    124c:	ea00001a 	b	12bc <prog+0x1278>
    1250:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    1254:	e282297f 	add	r2, r2, #2080768	; 0x1fc000
    1258:	e2822f6a 	add	r2, r2, #424	; 0x1a8
    125c:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1260:	e283397f 	add	r3, r3, #2080768	; 0x1fc000
    1264:	e2833f6a 	add	r3, r3, #424	; 0x1a8
    1268:	e5933000 	ldr	r3, [r3]
    126c:	e5823000 	str	r3, [r2]
    1270:	e51b3014 	ldr	r3, [fp, #-20]
    1274:	e1a02123 	mov	r2, r3, lsr #2
    1278:	e59f31a8 	ldr	r3, [pc, #424]	; 1428 <prog+0x13e4>
    127c:	e5832000 	str	r2, [r3]
    1280:	ea00000d 	b	12bc <prog+0x1278>
    1284:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    1288:	e282297f 	add	r2, r2, #2080768	; 0x1fc000
    128c:	e2822f6a 	add	r2, r2, #424	; 0x1a8
    1290:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1294:	e283397f 	add	r3, r3, #2080768	; 0x1fc000
    1298:	e2833f6a 	add	r3, r3, #424	; 0x1a8
    129c:	e5933000 	ldr	r3, [r3]
    12a0:	e3c33a03 	bic	r3, r3, #12288	; 0x3000
    12a4:	e3833a03 	orr	r3, r3, #12288	; 0x3000
    12a8:	e5823000 	str	r3, [r2]
    12ac:	e51b3014 	ldr	r3, [fp, #-20]
    12b0:	e1a021a3 	mov	r2, r3, lsr #3
    12b4:	e59f316c 	ldr	r3, [pc, #364]	; 1428 <prog+0x13e4>
    12b8:	e5832000 	str	r2, [r3]
    12bc:	e3a032ce 	mov	r3, #-536870900	; 0xe000000c
    12c0:	e2833906 	add	r3, r3, #98304	; 0x18000
    12c4:	e51b201c 	ldr	r2, [fp, #-28]
    12c8:	e5832000 	str	r2, [r3]
    12cc:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    12d0:	e282297f 	add	r2, r2, #2080768	; 0x1fc000
    12d4:	e28220c4 	add	r2, r2, #196	; 0xc4
    12d8:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    12dc:	e283397f 	add	r3, r3, #2080768	; 0x1fc000
    12e0:	e28330c4 	add	r3, r3, #196	; 0xc4
    12e4:	e5933000 	ldr	r3, [r3]
    12e8:	e3833040 	orr	r3, r3, #64	; 0x40
    12ec:	e5823000 	str	r3, [r2]
    12f0:	e3a03009 	mov	r3, #9	; 0x9
    12f4:	e50b3010 	str	r3, [fp, #-16]
    12f8:	ea00000f 	b	133c <prog+0x12f8>
    12fc:	e3a0120e 	mov	r1, #-536870912	; 0xe0000000
    1300:	e2811906 	add	r1, r1, #98304	; 0x18000
    1304:	e281104c 	add	r1, r1, #76	; 0x4c
    1308:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    130c:	e2833906 	add	r3, r3, #98304	; 0x18000
    1310:	e283304c 	add	r3, r3, #76	; 0x4c
    1314:	e5930000 	ldr	r0, [r3]
    1318:	e3a02001 	mov	r2, #1	; 0x1
    131c:	e51b3010 	ldr	r3, [fp, #-16]
    1320:	e1a03312 	mov	r3, r2, lsl r3
    1324:	e1e03003 	mvn	r3, r3
    1328:	e0003003 	and	r3, r0, r3
    132c:	e5813000 	str	r3, [r1]
    1330:	e51b3010 	ldr	r3, [fp, #-16]
    1334:	e2833001 	add	r3, r3, #1	; 0x1
    1338:	e50b3010 	str	r3, [fp, #-16]
    133c:	e51b3010 	ldr	r3, [fp, #-16]
    1340:	e353000e 	cmp	r3, #14	; 0xe
    1344:	daffffec 	ble	12fc <prog+0x12b8>
    1348:	e3a03002 	mov	r3, #2	; 0x2
    134c:	e50b3010 	str	r3, [fp, #-16]
    1350:	ea00000f 	b	1394 <prog+0x1350>
    1354:	e3a0120e 	mov	r1, #-536870912	; 0xe0000000
    1358:	e2811906 	add	r1, r1, #98304	; 0x18000
    135c:	e281104c 	add	r1, r1, #76	; 0x4c
    1360:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1364:	e2833906 	add	r3, r3, #98304	; 0x18000
    1368:	e283304c 	add	r3, r3, #76	; 0x4c
    136c:	e5930000 	ldr	r0, [r3]
    1370:	e3a02001 	mov	r2, #1	; 0x1
    1374:	e51b3010 	ldr	r3, [fp, #-16]
    1378:	e1a03312 	mov	r3, r2, lsl r3
    137c:	e1e03003 	mvn	r3, r3
    1380:	e0003003 	and	r3, r0, r3
    1384:	e5813000 	str	r3, [r1]
    1388:	e51b3010 	ldr	r3, [fp, #-16]
    138c:	e2833001 	add	r3, r3, #1	; 0x1
    1390:	e50b3010 	str	r3, [fp, #-16]
    1394:	e51b3010 	ldr	r3, [fp, #-16]
    1398:	e3530006 	cmp	r3, #6	; 0x6
    139c:	daffffec 	ble	1354 <prog+0x1310>
    13a0:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    13a4:	e2833906 	add	r3, r3, #98304	; 0x18000
    13a8:	e283304c 	add	r3, r3, #76	; 0x4c
    13ac:	e5932000 	ldr	r2, [r3]
    13b0:	e59f3074 	ldr	r3, [pc, #116]	; 142c <prog+0x13e8>
    13b4:	e5832000 	str	r2, [r3]
    13b8:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    13bc:	e2833906 	add	r3, r3, #98304	; 0x18000
    13c0:	e2833014 	add	r3, r3, #20	; 0x14
    13c4:	e3a02000 	mov	r2, #0	; 0x0
    13c8:	e5832000 	str	r2, [r3]
    13cc:	e3a00000 	mov	r0, #0	; 0x0
    13d0:	e3a01000 	mov	r1, #0	; 0x0
    13d4:	e3a02001 	mov	r2, #1	; 0x1
    13d8:	e3a03000 	mov	r3, #0	; 0x0
    13dc:	eb000013 	bl	1430 <pwmSetMatchControlReg>
    13e0:	e3a00000 	mov	r0, #0	; 0x0
    13e4:	e51b1020 	ldr	r1, [fp, #-32]
    13e8:	eb00011a 	bl	1858 <pwmSetOnTimeSingleEdge>
    13ec:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    13f0:	e2833906 	add	r3, r3, #98304	; 0x18000
    13f4:	e2833070 	add	r3, r3, #112	; 0x70
    13f8:	e3a02000 	mov	r2, #0	; 0x0
    13fc:	e5832000 	str	r2, [r3]
    1400:	e3a0324e 	mov	r3, #-536870908	; 0xe0000004
    1404:	e2833906 	add	r3, r3, #98304	; 0x18000
    1408:	e3a02002 	mov	r2, #2	; 0x2
    140c:	e5832000 	str	r2, [r3]
    1410:	e3a0324e 	mov	r3, #-536870908	; 0xe0000004
    1414:	e2833906 	add	r3, r3, #98304	; 0x18000
    1418:	e3a02009 	mov	r2, #9	; 0x9
    141c:	e5832000 	str	r2, [r3]
    1420:	e24bd00c 	sub	sp, fp, #12	; 0xc
    1424:	e89da800 	ldmia	sp, {fp, sp, pc}
    1428:	40000018 	andmi	r0, r0, r8, lsl r0
    142c:	4000001c 	andmi	r0, r0, ip, lsl r0

00001430 <pwmSetMatchControlReg>:
    1430:	e1a0c00d 	mov	ip, sp
    1434:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
    1438:	e24cb004 	sub	fp, ip, #4	; 0x4
    143c:	e24dd014 	sub	sp, sp, #20	; 0x14
    1440:	e50b0014 	str	r0, [fp, #-20]
    1444:	e1a00003 	mov	r0, r3
    1448:	e1a03001 	mov	r3, r1
    144c:	e54b3018 	strb	r3, [fp, #-24]
    1450:	e1a03002 	mov	r3, r2
    1454:	e54b301c 	strb	r3, [fp, #-28]
    1458:	e1a03000 	mov	r3, r0
    145c:	e54b3020 	strb	r3, [fp, #-32]
    1460:	e3a03001 	mov	r3, #1	; 0x1
    1464:	e54b300d 	strb	r3, [fp, #-13]
    1468:	e51b2014 	ldr	r2, [fp, #-20]
    146c:	e1a03002 	mov	r3, r2
    1470:	e1a03083 	mov	r3, r3, lsl #1
    1474:	e0833002 	add	r3, r3, r2
    1478:	e54b300d 	strb	r3, [fp, #-13]
    147c:	e55b3018 	ldrb	r3, [fp, #-24]
    1480:	e3530000 	cmp	r3, #0	; 0x0
    1484:	0a00000c 	beq	14bc <pwmSetMatchControlReg+0x8c>
    1488:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    148c:	e2822906 	add	r2, r2, #98304	; 0x18000
    1490:	e2822014 	add	r2, r2, #20	; 0x14
    1494:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1498:	e2833906 	add	r3, r3, #98304	; 0x18000
    149c:	e2833014 	add	r3, r3, #20	; 0x14
    14a0:	e5930000 	ldr	r0, [r3]
    14a4:	e55b100d 	ldrb	r1, [fp, #-13]
    14a8:	e3a03001 	mov	r3, #1	; 0x1
    14ac:	e1a03113 	mov	r3, r3, lsl r1
    14b0:	e1803003 	orr	r3, r0, r3
    14b4:	e5823000 	str	r3, [r2]
    14b8:	ea00000c 	b	14f0 <pwmSetMatchControlReg+0xc0>
    14bc:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    14c0:	e2822906 	add	r2, r2, #98304	; 0x18000
    14c4:	e2822014 	add	r2, r2, #20	; 0x14
    14c8:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    14cc:	e2833906 	add	r3, r3, #98304	; 0x18000
    14d0:	e2833014 	add	r3, r3, #20	; 0x14
    14d4:	e5930000 	ldr	r0, [r3]
    14d8:	e55b100d 	ldrb	r1, [fp, #-13]
    14dc:	e3a03001 	mov	r3, #1	; 0x1
    14e0:	e1a03113 	mov	r3, r3, lsl r1
    14e4:	e1e03003 	mvn	r3, r3
    14e8:	e0003003 	and	r3, r0, r3
    14ec:	e5823000 	str	r3, [r2]
    14f0:	e55b300d 	ldrb	r3, [fp, #-13]
    14f4:	e2833001 	add	r3, r3, #1	; 0x1
    14f8:	e54b300d 	strb	r3, [fp, #-13]
    14fc:	e55b301c 	ldrb	r3, [fp, #-28]
    1500:	e3530000 	cmp	r3, #0	; 0x0
    1504:	0a00000c 	beq	153c <pwmSetMatchControlReg+0x10c>
    1508:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    150c:	e2822906 	add	r2, r2, #98304	; 0x18000
    1510:	e2822014 	add	r2, r2, #20	; 0x14
    1514:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1518:	e2833906 	add	r3, r3, #98304	; 0x18000
    151c:	e2833014 	add	r3, r3, #20	; 0x14
    1520:	e5930000 	ldr	r0, [r3]
    1524:	e55b100d 	ldrb	r1, [fp, #-13]
    1528:	e3a03001 	mov	r3, #1	; 0x1
    152c:	e1a03113 	mov	r3, r3, lsl r1
    1530:	e1803003 	orr	r3, r0, r3
    1534:	e5823000 	str	r3, [r2]
    1538:	ea00000c 	b	1570 <pwmSetMatchControlReg+0x140>
    153c:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    1540:	e2822906 	add	r2, r2, #98304	; 0x18000
    1544:	e2822014 	add	r2, r2, #20	; 0x14
    1548:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    154c:	e2833906 	add	r3, r3, #98304	; 0x18000
    1550:	e2833014 	add	r3, r3, #20	; 0x14
    1554:	e5930000 	ldr	r0, [r3]
    1558:	e55b100d 	ldrb	r1, [fp, #-13]
    155c:	e3a03001 	mov	r3, #1	; 0x1
    1560:	e1a03113 	mov	r3, r3, lsl r1
    1564:	e1e03003 	mvn	r3, r3
    1568:	e0003003 	and	r3, r0, r3
    156c:	e5823000 	str	r3, [r2]
    1570:	e55b300d 	ldrb	r3, [fp, #-13]
    1574:	e2833001 	add	r3, r3, #1	; 0x1
    1578:	e54b300d 	strb	r3, [fp, #-13]
    157c:	e55b3020 	ldrb	r3, [fp, #-32]
    1580:	e3530000 	cmp	r3, #0	; 0x0
    1584:	0a00000c 	beq	15bc <pwmSetMatchControlReg+0x18c>
    1588:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    158c:	e2822906 	add	r2, r2, #98304	; 0x18000
    1590:	e2822014 	add	r2, r2, #20	; 0x14
    1594:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1598:	e2833906 	add	r3, r3, #98304	; 0x18000
    159c:	e2833014 	add	r3, r3, #20	; 0x14
    15a0:	e5930000 	ldr	r0, [r3]
    15a4:	e55b100d 	ldrb	r1, [fp, #-13]
    15a8:	e3a03001 	mov	r3, #1	; 0x1
    15ac:	e1a03113 	mov	r3, r3, lsl r1
    15b0:	e1803003 	orr	r3, r0, r3
    15b4:	e5823000 	str	r3, [r2]
    15b8:	ea00000c 	b	15f0 <pwmSetMatchControlReg+0x1c0>
    15bc:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    15c0:	e2822906 	add	r2, r2, #98304	; 0x18000
    15c4:	e2822014 	add	r2, r2, #20	; 0x14
    15c8:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    15cc:	e2833906 	add	r3, r3, #98304	; 0x18000
    15d0:	e2833014 	add	r3, r3, #20	; 0x14
    15d4:	e5930000 	ldr	r0, [r3]
    15d8:	e55b100d 	ldrb	r1, [fp, #-13]
    15dc:	e3a03001 	mov	r3, #1	; 0x1
    15e0:	e1a03113 	mov	r3, r3, lsl r1
    15e4:	e1e03003 	mvn	r3, r3
    15e8:	e0003003 	and	r3, r0, r3
    15ec:	e5823000 	str	r3, [r2]
    15f0:	e24bd00c 	sub	sp, fp, #12	; 0xc
    15f4:	e89da800 	ldmia	sp, {fp, sp, pc}

000015f8 <pwmSetChannelState>:
    15f8:	e1a0c00d 	mov	ip, sp
    15fc:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
    1600:	e24cb004 	sub	fp, ip, #4	; 0x4
    1604:	e24dd008 	sub	sp, sp, #8	; 0x8
    1608:	e50b0010 	str	r0, [fp, #-16]
    160c:	e1a03001 	mov	r3, r1
    1610:	e54b3014 	strb	r3, [fp, #-20]
    1614:	e51b3010 	ldr	r3, [fp, #-16]
    1618:	e3530006 	cmp	r3, #6	; 0x6
    161c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
    1620:	ea000083 	b	1834 <prog+0x17f0>
    1624:	00001834 	andeq	r1, r0, r4, lsr r8
    1628:	00001640 	andeq	r1, r0, r0, asr #12
    162c:	00001694 	muleq	r0, r4, r6
    1630:	000016e8 	andeq	r1, r0, r8, ror #13
    1634:	0000173c 	andeq	r1, r0, ip, lsr r7
    1638:	00001790 	muleq	r0, r0, r7
    163c:	000017e4 	andeq	r1, r0, r4, ror #15
    1640:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    1644:	e2822906 	add	r2, r2, #98304	; 0x18000
    1648:	e282204c 	add	r2, r2, #76	; 0x4c
    164c:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1650:	e2833906 	add	r3, r3, #98304	; 0x18000
    1654:	e283304c 	add	r3, r3, #76	; 0x4c
    1658:	e5933000 	ldr	r3, [r3]
    165c:	e3c33c02 	bic	r3, r3, #512	; 0x200
    1660:	e5823000 	str	r3, [r2]
    1664:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    1668:	e2822906 	add	r2, r2, #98304	; 0x18000
    166c:	e282204c 	add	r2, r2, #76	; 0x4c
    1670:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1674:	e2833906 	add	r3, r3, #98304	; 0x18000
    1678:	e283304c 	add	r3, r3, #76	; 0x4c
    167c:	e5931000 	ldr	r1, [r3]
    1680:	e55b3014 	ldrb	r3, [fp, #-20]
    1684:	e1a03483 	mov	r3, r3, lsl #9
    1688:	e1813003 	orr	r3, r1, r3
    168c:	e5823000 	str	r3, [r2]
    1690:	ea000067 	b	1834 <prog+0x17f0>
    1694:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    1698:	e2822906 	add	r2, r2, #98304	; 0x18000
    169c:	e282204c 	add	r2, r2, #76	; 0x4c
    16a0:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    16a4:	e2833906 	add	r3, r3, #98304	; 0x18000
    16a8:	e283304c 	add	r3, r3, #76	; 0x4c
    16ac:	e5933000 	ldr	r3, [r3]
    16b0:	e3c33b01 	bic	r3, r3, #1024	; 0x400
    16b4:	e5823000 	str	r3, [r2]
    16b8:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    16bc:	e2822906 	add	r2, r2, #98304	; 0x18000
    16c0:	e282204c 	add	r2, r2, #76	; 0x4c
    16c4:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    16c8:	e2833906 	add	r3, r3, #98304	; 0x18000
    16cc:	e283304c 	add	r3, r3, #76	; 0x4c
    16d0:	e5931000 	ldr	r1, [r3]
    16d4:	e55b3014 	ldrb	r3, [fp, #-20]
    16d8:	e1a03503 	mov	r3, r3, lsl #10
    16dc:	e1813003 	orr	r3, r1, r3
    16e0:	e5823000 	str	r3, [r2]
    16e4:	ea000052 	b	1834 <prog+0x17f0>
    16e8:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    16ec:	e2822906 	add	r2, r2, #98304	; 0x18000
    16f0:	e282204c 	add	r2, r2, #76	; 0x4c
    16f4:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    16f8:	e2833906 	add	r3, r3, #98304	; 0x18000
    16fc:	e283304c 	add	r3, r3, #76	; 0x4c
    1700:	e5933000 	ldr	r3, [r3]
    1704:	e3c33b02 	bic	r3, r3, #2048	; 0x800
    1708:	e5823000 	str	r3, [r2]
    170c:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    1710:	e2822906 	add	r2, r2, #98304	; 0x18000
    1714:	e282204c 	add	r2, r2, #76	; 0x4c
    1718:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    171c:	e2833906 	add	r3, r3, #98304	; 0x18000
    1720:	e283304c 	add	r3, r3, #76	; 0x4c
    1724:	e5931000 	ldr	r1, [r3]
    1728:	e55b3014 	ldrb	r3, [fp, #-20]
    172c:	e1a03583 	mov	r3, r3, lsl #11
    1730:	e1813003 	orr	r3, r1, r3
    1734:	e5823000 	str	r3, [r2]
    1738:	ea00003d 	b	1834 <prog+0x17f0>
    173c:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    1740:	e2822906 	add	r2, r2, #98304	; 0x18000
    1744:	e282204c 	add	r2, r2, #76	; 0x4c
    1748:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    174c:	e2833906 	add	r3, r3, #98304	; 0x18000
    1750:	e283304c 	add	r3, r3, #76	; 0x4c
    1754:	e5933000 	ldr	r3, [r3]
    1758:	e3c33a01 	bic	r3, r3, #4096	; 0x1000
    175c:	e5823000 	str	r3, [r2]
    1760:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    1764:	e2822906 	add	r2, r2, #98304	; 0x18000
    1768:	e282204c 	add	r2, r2, #76	; 0x4c
    176c:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1770:	e2833906 	add	r3, r3, #98304	; 0x18000
    1774:	e283304c 	add	r3, r3, #76	; 0x4c
    1778:	e5931000 	ldr	r1, [r3]
    177c:	e55b3014 	ldrb	r3, [fp, #-20]
    1780:	e1a03603 	mov	r3, r3, lsl #12
    1784:	e1813003 	orr	r3, r1, r3
    1788:	e5823000 	str	r3, [r2]
    178c:	ea000028 	b	1834 <prog+0x17f0>
    1790:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    1794:	e2822906 	add	r2, r2, #98304	; 0x18000
    1798:	e282204c 	add	r2, r2, #76	; 0x4c
    179c:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    17a0:	e2833906 	add	r3, r3, #98304	; 0x18000
    17a4:	e283304c 	add	r3, r3, #76	; 0x4c
    17a8:	e5933000 	ldr	r3, [r3]
    17ac:	e3c33a02 	bic	r3, r3, #8192	; 0x2000
    17b0:	e5823000 	str	r3, [r2]
    17b4:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    17b8:	e2822906 	add	r2, r2, #98304	; 0x18000
    17bc:	e282204c 	add	r2, r2, #76	; 0x4c
    17c0:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    17c4:	e2833906 	add	r3, r3, #98304	; 0x18000
    17c8:	e283304c 	add	r3, r3, #76	; 0x4c
    17cc:	e5931000 	ldr	r1, [r3]
    17d0:	e55b3014 	ldrb	r3, [fp, #-20]
    17d4:	e1a03683 	mov	r3, r3, lsl #13
    17d8:	e1813003 	orr	r3, r1, r3
    17dc:	e5823000 	str	r3, [r2]
    17e0:	ea000013 	b	1834 <prog+0x17f0>
    17e4:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    17e8:	e2822906 	add	r2, r2, #98304	; 0x18000
    17ec:	e282204c 	add	r2, r2, #76	; 0x4c
    17f0:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    17f4:	e2833906 	add	r3, r3, #98304	; 0x18000
    17f8:	e283304c 	add	r3, r3, #76	; 0x4c
    17fc:	e5933000 	ldr	r3, [r3]
    1800:	e3c33901 	bic	r3, r3, #16384	; 0x4000
    1804:	e5823000 	str	r3, [r2]
    1808:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    180c:	e2822906 	add	r2, r2, #98304	; 0x18000
    1810:	e282204c 	add	r2, r2, #76	; 0x4c
    1814:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1818:	e2833906 	add	r3, r3, #98304	; 0x18000
    181c:	e283304c 	add	r3, r3, #76	; 0x4c
    1820:	e5931000 	ldr	r1, [r3]
    1824:	e55b3014 	ldrb	r3, [fp, #-20]
    1828:	e1a03703 	mov	r3, r3, lsl #14
    182c:	e1813003 	orr	r3, r1, r3
    1830:	e5823000 	str	r3, [r2]
    1834:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1838:	e2833906 	add	r3, r3, #98304	; 0x18000
    183c:	e283304c 	add	r3, r3, #76	; 0x4c
    1840:	e5932000 	ldr	r2, [r3]
    1844:	e59f3008 	ldr	r3, [pc, #8]	; 1854 <prog+0x1810>
    1848:	e5832000 	str	r2, [r3]
    184c:	e24bd00c 	sub	sp, fp, #12	; 0xc
    1850:	e89da800 	ldmia	sp, {fp, sp, pc}
    1854:	4000001c 	andmi	r0, r0, ip, lsl r0

00001858 <pwmSetOnTimeSingleEdge>:
    1858:	e1a0c00d 	mov	ip, sp
    185c:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
    1860:	e24cb004 	sub	fp, ip, #4	; 0x4
    1864:	e24dd008 	sub	sp, sp, #8	; 0x8
    1868:	e50b0010 	str	r0, [fp, #-16]
    186c:	e50b1014 	str	r1, [fp, #-20]
    1870:	e51b3010 	ldr	r3, [fp, #-16]
    1874:	e3530006 	cmp	r3, #6	; 0x6
    1878:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
    187c:	ea00006e 	b	1a3c <prog+0x19f8>
    1880:	0000189c 	muleq	r0, ip, r8
    1884:	000018d8 	ldreqd	r1, [r0], -r8
    1888:	00001914 	andeq	r1, r0, r4, lsl r9
    188c:	00001950 	andeq	r1, r0, r0, asr r9
    1890:	0000198c 	andeq	r1, r0, ip, lsl #19
    1894:	000019c8 	andeq	r1, r0, r8, asr #19
    1898:	00001a04 	andeq	r1, r0, r4, lsl #20
    189c:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    18a0:	e2833906 	add	r3, r3, #98304	; 0x18000
    18a4:	e2833018 	add	r3, r3, #24	; 0x18
    18a8:	e51b2014 	ldr	r2, [fp, #-20]
    18ac:	e5832000 	str	r2, [r3]
    18b0:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    18b4:	e2822906 	add	r2, r2, #98304	; 0x18000
    18b8:	e2822050 	add	r2, r2, #80	; 0x50
    18bc:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    18c0:	e2833906 	add	r3, r3, #98304	; 0x18000
    18c4:	e2833050 	add	r3, r3, #80	; 0x50
    18c8:	e5933000 	ldr	r3, [r3]
    18cc:	e3833001 	orr	r3, r3, #1	; 0x1
    18d0:	e5823000 	str	r3, [r2]
    18d4:	ea000058 	b	1a3c <prog+0x19f8>
    18d8:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    18dc:	e2833906 	add	r3, r3, #98304	; 0x18000
    18e0:	e283301c 	add	r3, r3, #28	; 0x1c
    18e4:	e51b2014 	ldr	r2, [fp, #-20]
    18e8:	e5832000 	str	r2, [r3]
    18ec:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    18f0:	e2822906 	add	r2, r2, #98304	; 0x18000
    18f4:	e2822050 	add	r2, r2, #80	; 0x50
    18f8:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    18fc:	e2833906 	add	r3, r3, #98304	; 0x18000
    1900:	e2833050 	add	r3, r3, #80	; 0x50
    1904:	e5933000 	ldr	r3, [r3]
    1908:	e3833002 	orr	r3, r3, #2	; 0x2
    190c:	e5823000 	str	r3, [r2]
    1910:	ea000049 	b	1a3c <prog+0x19f8>
    1914:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1918:	e2833906 	add	r3, r3, #98304	; 0x18000
    191c:	e2833020 	add	r3, r3, #32	; 0x20
    1920:	e51b2014 	ldr	r2, [fp, #-20]
    1924:	e5832000 	str	r2, [r3]
    1928:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    192c:	e2822906 	add	r2, r2, #98304	; 0x18000
    1930:	e2822050 	add	r2, r2, #80	; 0x50
    1934:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1938:	e2833906 	add	r3, r3, #98304	; 0x18000
    193c:	e2833050 	add	r3, r3, #80	; 0x50
    1940:	e5933000 	ldr	r3, [r3]
    1944:	e3833004 	orr	r3, r3, #4	; 0x4
    1948:	e5823000 	str	r3, [r2]
    194c:	ea00003a 	b	1a3c <prog+0x19f8>
    1950:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1954:	e2833906 	add	r3, r3, #98304	; 0x18000
    1958:	e2833024 	add	r3, r3, #36	; 0x24
    195c:	e51b2014 	ldr	r2, [fp, #-20]
    1960:	e5832000 	str	r2, [r3]
    1964:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    1968:	e2822906 	add	r2, r2, #98304	; 0x18000
    196c:	e2822050 	add	r2, r2, #80	; 0x50
    1970:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1974:	e2833906 	add	r3, r3, #98304	; 0x18000
    1978:	e2833050 	add	r3, r3, #80	; 0x50
    197c:	e5933000 	ldr	r3, [r3]
    1980:	e3833008 	orr	r3, r3, #8	; 0x8
    1984:	e5823000 	str	r3, [r2]
    1988:	ea00002b 	b	1a3c <prog+0x19f8>
    198c:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1990:	e2833906 	add	r3, r3, #98304	; 0x18000
    1994:	e2833040 	add	r3, r3, #64	; 0x40
    1998:	e51b2014 	ldr	r2, [fp, #-20]
    199c:	e5832000 	str	r2, [r3]
    19a0:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    19a4:	e2822906 	add	r2, r2, #98304	; 0x18000
    19a8:	e2822050 	add	r2, r2, #80	; 0x50
    19ac:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    19b0:	e2833906 	add	r3, r3, #98304	; 0x18000
    19b4:	e2833050 	add	r3, r3, #80	; 0x50
    19b8:	e5933000 	ldr	r3, [r3]
    19bc:	e3833010 	orr	r3, r3, #16	; 0x10
    19c0:	e5823000 	str	r3, [r2]
    19c4:	ea00001c 	b	1a3c <prog+0x19f8>
    19c8:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    19cc:	e2833906 	add	r3, r3, #98304	; 0x18000
    19d0:	e2833044 	add	r3, r3, #68	; 0x44
    19d4:	e51b2014 	ldr	r2, [fp, #-20]
    19d8:	e5832000 	str	r2, [r3]
    19dc:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    19e0:	e2822906 	add	r2, r2, #98304	; 0x18000
    19e4:	e2822050 	add	r2, r2, #80	; 0x50
    19e8:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    19ec:	e2833906 	add	r3, r3, #98304	; 0x18000
    19f0:	e2833050 	add	r3, r3, #80	; 0x50
    19f4:	e5933000 	ldr	r3, [r3]
    19f8:	e3833020 	orr	r3, r3, #32	; 0x20
    19fc:	e5823000 	str	r3, [r2]
    1a00:	ea00000d 	b	1a3c <prog+0x19f8>
    1a04:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1a08:	e2833906 	add	r3, r3, #98304	; 0x18000
    1a0c:	e2833048 	add	r3, r3, #72	; 0x48
    1a10:	e51b2014 	ldr	r2, [fp, #-20]
    1a14:	e5832000 	str	r2, [r3]
    1a18:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    1a1c:	e2822906 	add	r2, r2, #98304	; 0x18000
    1a20:	e2822050 	add	r2, r2, #80	; 0x50
    1a24:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1a28:	e2833906 	add	r3, r3, #98304	; 0x18000
    1a2c:	e2833050 	add	r3, r3, #80	; 0x50
    1a30:	e5933000 	ldr	r3, [r3]
    1a34:	e3833040 	orr	r3, r3, #64	; 0x40
    1a38:	e5823000 	str	r3, [r2]
    1a3c:	e24bd00c 	sub	sp, fp, #12	; 0xc
    1a40:	e89da800 	ldmia	sp, {fp, sp, pc}

00001a44 <pwmGetPclk>:
    1a44:	e1a0c00d 	mov	ip, sp
    1a48:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
    1a4c:	e24cb004 	sub	fp, ip, #4	; 0x4
    1a50:	e59f3008 	ldr	r3, [pc, #8]	; 1a60 <prog+0x1a1c>
    1a54:	e5933000 	ldr	r3, [r3]
    1a58:	e1a00003 	mov	r0, r3
    1a5c:	e89da800 	ldmia	sp, {fp, sp, pc}
    1a60:	40000018 	andmi	r0, r0, r8, lsl r0

00001a64 <pwmDisableAll>:
    1a64:	e1a0c00d 	mov	ip, sp
    1a68:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
    1a6c:	e24cb004 	sub	fp, ip, #4	; 0x4
    1a70:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1a74:	e2833906 	add	r3, r3, #98304	; 0x18000
    1a78:	e283304c 	add	r3, r3, #76	; 0x4c
    1a7c:	e3a02000 	mov	r2, #0	; 0x0
    1a80:	e5832000 	str	r2, [r3]
    1a84:	e89da800 	ldmia	sp, {fp, sp, pc}

00001a88 <pwmReEnableAll>:
    1a88:	e1a0c00d 	mov	ip, sp
    1a8c:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
    1a90:	e24cb004 	sub	fp, ip, #4	; 0x4
    1a94:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    1a98:	e2833906 	add	r3, r3, #98304	; 0x18000
    1a9c:	e283304c 	add	r3, r3, #76	; 0x4c
    1aa0:	e59f2008 	ldr	r2, [pc, #8]	; 1ab0 <prog+0x1a6c>
    1aa4:	e5922000 	ldr	r2, [r2]
    1aa8:	e5832000 	str	r2, [r3]
    1aac:	e89da800 	ldmia	sp, {fp, sp, pc}
    1ab0:	4000001c 	andmi	r0, r0, ip, lsl r0

00001ab4 <controlLoop>:
    1ab4:	e1a0c00d 	mov	ip, sp
    1ab8:	e92dd810 	stmdb	sp!, {r4, fp, ip, lr, pc}
    1abc:	e24cb004 	sub	fp, ip, #4	; 0x4
    1ac0:	e24dd00c 	sub	sp, sp, #12	; 0xc
    1ac4:	e50b001c 	str	r0, [fp, #-28]
    1ac8:	e3a03c02 	mov	r3, #512	; 0x200
    1acc:	e14b31b6 	strh	r3, [fp, #-22]
    1ad0:	e3a03c01 	mov	r3, #256	; 0x100
    1ad4:	e14b31b4 	strh	r3, [fp, #-20]
    1ad8:	e3a03014 	mov	r3, #20	; 0x14
    1adc:	e14b31b2 	strh	r3, [fp, #-18]
    1ae0:	e51b301c 	ldr	r3, [fp, #-28]
    1ae4:	e1d330b8 	ldrh	r3, [r3, #8]
    1ae8:	e2433f7f 	sub	r3, r3, #508	; 0x1fc
    1aec:	e2433003 	sub	r3, r3, #3	; 0x3
    1af0:	e1a03803 	mov	r3, r3, lsl #16
    1af4:	e1a03823 	mov	r3, r3, lsr #16
    1af8:	e1a02003 	mov	r2, r3
    1afc:	e51b301c 	ldr	r3, [fp, #-28]
    1b00:	e1c321b0 	strh	r2, [r3, #16]
    1b04:	e51b301c 	ldr	r3, [fp, #-28]
    1b08:	e5d33000 	ldrb	r3, [r3]
    1b0c:	e3530000 	cmp	r3, #0	; 0x0
    1b10:	0a000011 	beq	1b5c <controlLoop+0xa8>
    1b14:	e51b301c 	ldr	r3, [fp, #-28]
    1b18:	e1d330b4 	ldrh	r3, [r3, #4]
    1b1c:	e2433f7f 	sub	r3, r3, #508	; 0x1fc
    1b20:	e2433003 	sub	r3, r3, #3	; 0x3
    1b24:	e1a03803 	mov	r3, r3, lsl #16
    1b28:	e1a03823 	mov	r3, r3, lsr #16
    1b2c:	e1a02003 	mov	r2, r3
    1b30:	e51b301c 	ldr	r3, [fp, #-28]
    1b34:	e1c320be 	strh	r2, [r3, #14]
    1b38:	e51b301c 	ldr	r3, [fp, #-28]
    1b3c:	e1d331b0 	ldrh	r3, [r3, #16]
    1b40:	e1a03803 	mov	r3, r3, lsl #16
    1b44:	e1a02843 	mov	r2, r3, asr #16
    1b48:	e15b31b6 	ldrh	r3, [fp, #-22]
    1b4c:	e0020293 	mul	r2, r3, r2
    1b50:	e51b301c 	ldr	r3, [fp, #-28]
    1b54:	e5832030 	str	r2, [r3, #48]
    1b58:	ea00009c 	b	1dd0 <controlLoop+0x31c>
    1b5c:	e51b301c 	ldr	r3, [fp, #-28]
    1b60:	e1d330b4 	ldrh	r3, [r3, #4]
    1b64:	e2433f7f 	sub	r3, r3, #508	; 0x1fc
    1b68:	e2433003 	sub	r3, r3, #3	; 0x3
    1b6c:	e1a03803 	mov	r3, r3, lsl #16
    1b70:	e1a03823 	mov	r3, r3, lsr #16
    1b74:	e1a02003 	mov	r2, r3
    1b78:	e51b301c 	ldr	r3, [fp, #-28]
    1b7c:	e1c323b4 	strh	r2, [r3, #52]
    1b80:	e51b301c 	ldr	r3, [fp, #-28]
    1b84:	e1d333b4 	ldrh	r3, [r3, #52]
    1b88:	e1a03803 	mov	r3, r3, lsl #16
    1b8c:	e1a02843 	mov	r2, r3, asr #16
    1b90:	e15b31b2 	ldrh	r3, [fp, #-18]
    1b94:	e1520003 	cmp	r2, r3
    1b98:	da00000b 	ble	1bcc <controlLoop+0x118>
    1b9c:	e51b301c 	ldr	r3, [fp, #-28]
    1ba0:	e1d333b4 	ldrh	r3, [r3, #52]
    1ba4:	e1a03803 	mov	r3, r3, lsl #16
    1ba8:	e1a02823 	mov	r2, r3, lsr #16
    1bac:	e15b31b2 	ldrh	r3, [fp, #-18]
    1bb0:	e0633002 	rsb	r3, r3, r2
    1bb4:	e1a03803 	mov	r3, r3, lsl #16
    1bb8:	e1a03823 	mov	r3, r3, lsr #16
    1bbc:	e1a02003 	mov	r2, r3
    1bc0:	e51b301c 	ldr	r3, [fp, #-28]
    1bc4:	e1c323b4 	strh	r2, [r3, #52]
    1bc8:	ea000016 	b	1c28 <controlLoop+0x174>
    1bcc:	e51b301c 	ldr	r3, [fp, #-28]
    1bd0:	e1d333b4 	ldrh	r3, [r3, #52]
    1bd4:	e1a03803 	mov	r3, r3, lsl #16
    1bd8:	e1a02843 	mov	r2, r3, asr #16
    1bdc:	e15b31b2 	ldrh	r3, [fp, #-18]
    1be0:	e2633000 	rsb	r3, r3, #0	; 0x0
    1be4:	e1520003 	cmp	r2, r3
    1be8:	aa00000b 	bge	1c1c <controlLoop+0x168>
    1bec:	e51b301c 	ldr	r3, [fp, #-28]
    1bf0:	e1d333b4 	ldrh	r3, [r3, #52]
    1bf4:	e1a03803 	mov	r3, r3, lsl #16
    1bf8:	e1a02823 	mov	r2, r3, lsr #16
    1bfc:	e15b31b2 	ldrh	r3, [fp, #-18]
    1c00:	e0823003 	add	r3, r2, r3
    1c04:	e1a03803 	mov	r3, r3, lsl #16
    1c08:	e1a03823 	mov	r3, r3, lsr #16
    1c0c:	e1a02003 	mov	r2, r3
    1c10:	e51b301c 	ldr	r3, [fp, #-28]
    1c14:	e1c323b4 	strh	r2, [r3, #52]
    1c18:	ea000002 	b	1c28 <controlLoop+0x174>
    1c1c:	e51b301c 	ldr	r3, [fp, #-28]
    1c20:	e3a02000 	mov	r2, #0	; 0x0
    1c24:	e1c323b4 	strh	r2, [r3, #52]
    1c28:	e51b301c 	ldr	r3, [fp, #-28]
    1c2c:	e5932030 	ldr	r2, [r3, #48]
    1c30:	e51b301c 	ldr	r3, [fp, #-28]
    1c34:	e1d333b4 	ldrh	r3, [r3, #52]
    1c38:	e1a03803 	mov	r3, r3, lsl #16
    1c3c:	e1a03843 	mov	r3, r3, asr #16
    1c40:	e0822003 	add	r2, r2, r3
    1c44:	e51b301c 	ldr	r3, [fp, #-28]
    1c48:	e5832030 	str	r2, [r3, #48]
    1c4c:	e51b301c 	ldr	r3, [fp, #-28]
    1c50:	e1d333b4 	ldrh	r3, [r3, #52]
    1c54:	e1a03803 	mov	r3, r3, lsl #16
    1c58:	e1a03843 	mov	r3, r3, asr #16
    1c5c:	e3530000 	cmp	r3, #0	; 0x0
    1c60:	da000013 	ble	1cb4 <controlLoop+0x200>
    1c64:	e51b301c 	ldr	r3, [fp, #-28]
    1c68:	e5934030 	ldr	r4, [r3, #48]
    1c6c:	e51b301c 	ldr	r3, [fp, #-28]
    1c70:	e1d333b4 	ldrh	r3, [r3, #52]
    1c74:	e1a03803 	mov	r3, r3, lsl #16
    1c78:	e1a02843 	mov	r2, r3, asr #16
    1c7c:	e51b301c 	ldr	r3, [fp, #-28]
    1c80:	e1d333b4 	ldrh	r3, [r3, #52]
    1c84:	e1a03803 	mov	r3, r3, lsl #16
    1c88:	e1a03843 	mov	r3, r3, asr #16
    1c8c:	e0030392 	mul	r3, r2, r3
    1c90:	e15b21b4 	ldrh	r2, [fp, #-20]
    1c94:	e1a00003 	mov	r0, r3
    1c98:	e1a01002 	mov	r1, r2
    1c9c:	eb00039c 	bl	2b14 <__aeabi_idiv>
    1ca0:	e1a03000 	mov	r3, r0
    1ca4:	e0842003 	add	r2, r4, r3
    1ca8:	e51b301c 	ldr	r3, [fp, #-28]
    1cac:	e5832030 	str	r2, [r3, #48]
    1cb0:	ea000012 	b	1d00 <controlLoop+0x24c>
    1cb4:	e51b301c 	ldr	r3, [fp, #-28]
    1cb8:	e5934030 	ldr	r4, [r3, #48]
    1cbc:	e51b301c 	ldr	r3, [fp, #-28]
    1cc0:	e1d333b4 	ldrh	r3, [r3, #52]
    1cc4:	e1a03803 	mov	r3, r3, lsl #16
    1cc8:	e1a02843 	mov	r2, r3, asr #16
    1ccc:	e51b301c 	ldr	r3, [fp, #-28]
    1cd0:	e1d333b4 	ldrh	r3, [r3, #52]
    1cd4:	e1a03803 	mov	r3, r3, lsl #16
    1cd8:	e1a03843 	mov	r3, r3, asr #16
    1cdc:	e0030392 	mul	r3, r2, r3
    1ce0:	e15b21b4 	ldrh	r2, [fp, #-20]
    1ce4:	e1a00003 	mov	r0, r3
    1ce8:	e1a01002 	mov	r1, r2
    1cec:	eb000388 	bl	2b14 <__aeabi_idiv>
    1cf0:	e1a03000 	mov	r3, r0
    1cf4:	e0632004 	rsb	r2, r3, r4
    1cf8:	e51b301c 	ldr	r3, [fp, #-28]
    1cfc:	e5832030 	str	r2, [r3, #48]
    1d00:	e51b301c 	ldr	r3, [fp, #-28]
    1d04:	e5931030 	ldr	r1, [r3, #48]
    1d08:	e51b301c 	ldr	r3, [fp, #-28]
    1d0c:	e1d333b6 	ldrh	r3, [r3, #54]
    1d10:	e2433f7f 	sub	r3, r3, #508	; 0x1fc
    1d14:	e2433003 	sub	r3, r3, #3	; 0x3
    1d18:	e15b21b6 	ldrh	r2, [fp, #-22]
    1d1c:	e0030392 	mul	r3, r2, r3
    1d20:	e1510003 	cmp	r1, r3
    1d24:	da000008 	ble	1d4c <controlLoop+0x298>
    1d28:	e51b301c 	ldr	r3, [fp, #-28]
    1d2c:	e1d333b6 	ldrh	r3, [r3, #54]
    1d30:	e2433f7f 	sub	r3, r3, #508	; 0x1fc
    1d34:	e2433003 	sub	r3, r3, #3	; 0x3
    1d38:	e15b21b6 	ldrh	r2, [fp, #-22]
    1d3c:	e0020293 	mul	r2, r3, r2
    1d40:	e51b301c 	ldr	r3, [fp, #-28]
    1d44:	e5832030 	str	r2, [r3, #48]
    1d48:	ea000015 	b	1da4 <controlLoop+0x2f0>
    1d4c:	e51b301c 	ldr	r3, [fp, #-28]
    1d50:	e5931030 	ldr	r1, [r3, #48]
    1d54:	e51b301c 	ldr	r3, [fp, #-28]
    1d58:	e1d332ba 	ldrh	r3, [r3, #42]
    1d5c:	e2432f7f 	sub	r2, r3, #508	; 0x1fc
    1d60:	e2422003 	sub	r2, r2, #3	; 0x3
    1d64:	e15b31b6 	ldrh	r3, [fp, #-22]
    1d68:	e1a03803 	mov	r3, r3, lsl #16
    1d6c:	e1a03843 	mov	r3, r3, asr #16
    1d70:	e0030392 	mul	r3, r2, r3
    1d74:	e1510003 	cmp	r1, r3
    1d78:	aa000009 	bge	1da4 <controlLoop+0x2f0>
    1d7c:	e51b301c 	ldr	r3, [fp, #-28]
    1d80:	e1d332ba 	ldrh	r3, [r3, #42]
    1d84:	e2432f7f 	sub	r2, r3, #508	; 0x1fc
    1d88:	e2422003 	sub	r2, r2, #3	; 0x3
    1d8c:	e15b31b6 	ldrh	r3, [fp, #-22]
    1d90:	e1a03803 	mov	r3, r3, lsl #16
    1d94:	e1a03843 	mov	r3, r3, asr #16
    1d98:	e0020293 	mul	r2, r3, r2
    1d9c:	e51b301c 	ldr	r3, [fp, #-28]
    1da0:	e5832030 	str	r2, [r3, #48]
    1da4:	e51b301c 	ldr	r3, [fp, #-28]
    1da8:	e5933030 	ldr	r3, [r3, #48]
    1dac:	e15b21b6 	ldrh	r2, [fp, #-22]
    1db0:	e1a00003 	mov	r0, r3
    1db4:	e1a01002 	mov	r1, r2
    1db8:	eb000355 	bl	2b14 <__aeabi_idiv>
    1dbc:	e1a03000 	mov	r3, r0
    1dc0:	e1a03803 	mov	r3, r3, lsl #16
    1dc4:	e1a02823 	mov	r2, r3, lsr #16
    1dc8:	e51b301c 	ldr	r3, [fp, #-28]
    1dcc:	e1c320be 	strh	r2, [r3, #14]
    1dd0:	e51b301c 	ldr	r3, [fp, #-28]
    1dd4:	e1d331b0 	ldrh	r3, [r3, #16]
    1dd8:	e1a03803 	mov	r3, r3, lsl #16
    1ddc:	e1a02823 	mov	r2, r3, lsr #16
    1de0:	e51b301c 	ldr	r3, [fp, #-28]
    1de4:	e1d330be 	ldrh	r3, [r3, #14]
    1de8:	e1a03803 	mov	r3, r3, lsl #16
    1dec:	e1a03823 	mov	r3, r3, lsr #16
    1df0:	e0633002 	rsb	r3, r3, r2
    1df4:	e1a03803 	mov	r3, r3, lsl #16
    1df8:	e1a03823 	mov	r3, r3, lsr #16
    1dfc:	e1a02003 	mov	r2, r3
    1e00:	e51b301c 	ldr	r3, [fp, #-28]
    1e04:	e1c321b2 	strh	r2, [r3, #18]
    1e08:	e51b301c 	ldr	r3, [fp, #-28]
    1e0c:	e1d331b2 	ldrh	r3, [r3, #18]
    1e10:	e1a03803 	mov	r3, r3, lsl #16
    1e14:	e1a02843 	mov	r2, r3, asr #16
    1e18:	e51b301c 	ldr	r3, [fp, #-28]
    1e1c:	e1d332b4 	ldrh	r3, [r3, #36]
    1e20:	e0020293 	mul	r2, r3, r2
    1e24:	e51b301c 	ldr	r3, [fp, #-28]
    1e28:	e5832014 	str	r2, [r3, #20]
    1e2c:	e51b301c 	ldr	r3, [fp, #-28]
    1e30:	e5931020 	ldr	r1, [r3, #32]
    1e34:	e51b301c 	ldr	r3, [fp, #-28]
    1e38:	e1d331b2 	ldrh	r3, [r3, #18]
    1e3c:	e1a03803 	mov	r3, r3, lsl #16
    1e40:	e1a02843 	mov	r2, r3, asr #16
    1e44:	e51b301c 	ldr	r3, [fp, #-28]
    1e48:	e1d332b6 	ldrh	r3, [r3, #38]
    1e4c:	e0030392 	mul	r3, r2, r3
    1e50:	e0812003 	add	r2, r1, r3
    1e54:	e51b301c 	ldr	r3, [fp, #-28]
    1e58:	e5832020 	str	r2, [r3, #32]
    1e5c:	e51b301c 	ldr	r3, [fp, #-28]
    1e60:	e5932020 	ldr	r2, [r3, #32]
    1e64:	e51b301c 	ldr	r3, [fp, #-28]
    1e68:	e1d332bc 	ldrh	r3, [r3, #44]
    1e6c:	e1a03403 	mov	r3, r3, lsl #8
    1e70:	e1520003 	cmp	r2, r3
    1e74:	da000005 	ble	1e90 <controlLoop+0x3dc>
    1e78:	e51b301c 	ldr	r3, [fp, #-28]
    1e7c:	e1d332bc 	ldrh	r3, [r3, #44]
    1e80:	e1a02403 	mov	r2, r3, lsl #8
    1e84:	e51b301c 	ldr	r3, [fp, #-28]
    1e88:	e5832020 	str	r2, [r3, #32]
    1e8c:	ea000014 	b	1ee4 <controlLoop+0x430>
    1e90:	e51b301c 	ldr	r3, [fp, #-28]
    1e94:	e5931020 	ldr	r1, [r3, #32]
    1e98:	e51b301c 	ldr	r3, [fp, #-28]
    1e9c:	e1d332bc 	ldrh	r3, [r3, #44]
    1ea0:	e1a02003 	mov	r2, r3
    1ea4:	e1a03002 	mov	r3, r2
    1ea8:	e1a03c03 	mov	r3, r3, lsl #24
    1eac:	e0623003 	rsb	r3, r2, r3
    1eb0:	e1a03403 	mov	r3, r3, lsl #8
    1eb4:	e1510003 	cmp	r1, r3
    1eb8:	aa000009 	bge	1ee4 <controlLoop+0x430>
    1ebc:	e51b301c 	ldr	r3, [fp, #-28]
    1ec0:	e1d332bc 	ldrh	r3, [r3, #44]
    1ec4:	e1a02003 	mov	r2, r3
    1ec8:	e1a03002 	mov	r3, r2
    1ecc:	e1a03c03 	mov	r3, r3, lsl #24
    1ed0:	e0623003 	rsb	r3, r2, r3
    1ed4:	e1a03403 	mov	r3, r3, lsl #8
    1ed8:	e1a02003 	mov	r2, r3
    1edc:	e51b301c 	ldr	r3, [fp, #-28]
    1ee0:	e5832020 	str	r2, [r3, #32]
    1ee4:	e51b301c 	ldr	r3, [fp, #-28]
    1ee8:	e5933020 	ldr	r3, [r3, #32]
    1eec:	e28320ff 	add	r2, r3, #255	; 0xff
    1ef0:	e3530000 	cmp	r3, #0	; 0x0
    1ef4:	b1a03002 	movlt	r3, r2
    1ef8:	e1a03443 	mov	r3, r3, asr #8
    1efc:	e1a02003 	mov	r2, r3
    1f00:	e51b301c 	ldr	r3, [fp, #-28]
    1f04:	e5832018 	str	r2, [r3, #24]
    1f08:	e51b301c 	ldr	r3, [fp, #-28]
    1f0c:	e1d331b2 	ldrh	r3, [r3, #18]
    1f10:	e1a03803 	mov	r3, r3, lsl #16
    1f14:	e1a02843 	mov	r2, r3, asr #16
    1f18:	e51b301c 	ldr	r3, [fp, #-28]
    1f1c:	e1d330bc 	ldrh	r3, [r3, #12]
    1f20:	e0632002 	rsb	r2, r3, r2
    1f24:	e51b301c 	ldr	r3, [fp, #-28]
    1f28:	e1d332b8 	ldrh	r3, [r3, #40]
    1f2c:	e0010293 	mul	r1, r3, r2
    1f30:	e59f3378 	ldr	r3, [pc, #888]	; 22b0 <prog+0x226c>
    1f34:	e0c32391 	smull	r2, r3, r1, r3
    1f38:	e1a02143 	mov	r2, r3, asr #2
    1f3c:	e1a03fc1 	mov	r3, r1, asr #31
    1f40:	e0632002 	rsb	r2, r3, r2
    1f44:	e51b301c 	ldr	r3, [fp, #-28]
    1f48:	e583201c 	str	r2, [r3, #28]
    1f4c:	e51b301c 	ldr	r3, [fp, #-28]
    1f50:	e593201c 	ldr	r2, [r3, #28]
    1f54:	e51b301c 	ldr	r3, [fp, #-28]
    1f58:	e1d332bc 	ldrh	r3, [r3, #44]
    1f5c:	e1520003 	cmp	r2, r3
    1f60:	da000005 	ble	1f7c <controlLoop+0x4c8>
    1f64:	e51b301c 	ldr	r3, [fp, #-28]
    1f68:	e1d332bc 	ldrh	r3, [r3, #44]
    1f6c:	e1a02003 	mov	r2, r3
    1f70:	e51b301c 	ldr	r3, [fp, #-28]
    1f74:	e583201c 	str	r2, [r3, #28]
    1f78:	ea00000b 	b	1fac <controlLoop+0x4f8>
    1f7c:	e51b301c 	ldr	r3, [fp, #-28]
    1f80:	e593201c 	ldr	r2, [r3, #28]
    1f84:	e51b301c 	ldr	r3, [fp, #-28]
    1f88:	e1d332bc 	ldrh	r3, [r3, #44]
    1f8c:	e2633000 	rsb	r3, r3, #0	; 0x0
    1f90:	e1520003 	cmp	r2, r3
    1f94:	aa000004 	bge	1fac <controlLoop+0x4f8>
    1f98:	e51b301c 	ldr	r3, [fp, #-28]
    1f9c:	e1d332bc 	ldrh	r3, [r3, #44]
    1fa0:	e2632000 	rsb	r2, r3, #0	; 0x0
    1fa4:	e51b301c 	ldr	r3, [fp, #-28]
    1fa8:	e583201c 	str	r2, [r3, #28]
    1fac:	e51b301c 	ldr	r3, [fp, #-28]
    1fb0:	e1d331b2 	ldrh	r3, [r3, #18]
    1fb4:	e1a03803 	mov	r3, r3, lsl #16
    1fb8:	e1a02823 	mov	r2, r3, lsr #16
    1fbc:	e51b301c 	ldr	r3, [fp, #-28]
    1fc0:	e1c320bc 	strh	r2, [r3, #12]
    1fc4:	e51b301c 	ldr	r3, [fp, #-28]
    1fc8:	e5933014 	ldr	r3, [r3, #20]
    1fcc:	e1a03803 	mov	r3, r3, lsl #16
    1fd0:	e1a02823 	mov	r2, r3, lsr #16
    1fd4:	e51b301c 	ldr	r3, [fp, #-28]
    1fd8:	e1c320b6 	strh	r2, [r3, #6]
    1fdc:	e51b301c 	ldr	r3, [fp, #-28]
    1fe0:	e1d330b6 	ldrh	r3, [r3, #6]
    1fe4:	e1a03803 	mov	r3, r3, lsl #16
    1fe8:	e1a02823 	mov	r2, r3, lsr #16
    1fec:	e51b301c 	ldr	r3, [fp, #-28]
    1ff0:	e5933018 	ldr	r3, [r3, #24]
    1ff4:	e1a03803 	mov	r3, r3, lsl #16
    1ff8:	e1a03823 	mov	r3, r3, lsr #16
    1ffc:	e0823003 	add	r3, r2, r3
    2000:	e1a03803 	mov	r3, r3, lsl #16
    2004:	e1a03823 	mov	r3, r3, lsr #16
    2008:	e1a02003 	mov	r2, r3
    200c:	e51b301c 	ldr	r3, [fp, #-28]
    2010:	e1c320b6 	strh	r2, [r3, #6]
    2014:	e51b301c 	ldr	r3, [fp, #-28]
    2018:	e1d330b6 	ldrh	r3, [r3, #6]
    201c:	e1a03803 	mov	r3, r3, lsl #16
    2020:	e1a02823 	mov	r2, r3, lsr #16
    2024:	e51b301c 	ldr	r3, [fp, #-28]
    2028:	e593301c 	ldr	r3, [r3, #28]
    202c:	e1a03803 	mov	r3, r3, lsl #16
    2030:	e1a03823 	mov	r3, r3, lsr #16
    2034:	e0823003 	add	r3, r2, r3
    2038:	e1a03803 	mov	r3, r3, lsl #16
    203c:	e1a03823 	mov	r3, r3, lsr #16
    2040:	e1a02003 	mov	r2, r3
    2044:	e51b301c 	ldr	r3, [fp, #-28]
    2048:	e1c320b6 	strh	r2, [r3, #6]
    204c:	e51b301c 	ldr	r3, [fp, #-28]
    2050:	e1d330b6 	ldrh	r3, [r3, #6]
    2054:	e1a03803 	mov	r3, r3, lsl #16
    2058:	e1a02843 	mov	r2, r3, asr #16
    205c:	e51b301c 	ldr	r3, [fp, #-28]
    2060:	e1d332bc 	ldrh	r3, [r3, #44]
    2064:	e1520003 	cmp	r2, r3
    2068:	da000005 	ble	2084 <controlLoop+0x5d0>
    206c:	e51b301c 	ldr	r3, [fp, #-28]
    2070:	e1d332bc 	ldrh	r3, [r3, #44]
    2074:	e1a02003 	mov	r2, r3
    2078:	e51b301c 	ldr	r3, [fp, #-28]
    207c:	e1c320b6 	strh	r2, [r3, #6]
    2080:	ea00000f 	b	20c4 <controlLoop+0x610>
    2084:	e51b301c 	ldr	r3, [fp, #-28]
    2088:	e1d330b6 	ldrh	r3, [r3, #6]
    208c:	e1a03803 	mov	r3, r3, lsl #16
    2090:	e1a02843 	mov	r2, r3, asr #16
    2094:	e51b301c 	ldr	r3, [fp, #-28]
    2098:	e1d332bc 	ldrh	r3, [r3, #44]
    209c:	e2633000 	rsb	r3, r3, #0	; 0x0
    20a0:	e1520003 	cmp	r2, r3
    20a4:	aa000006 	bge	20c4 <controlLoop+0x610>
    20a8:	e51b301c 	ldr	r3, [fp, #-28]
    20ac:	e1d332bc 	ldrh	r3, [r3, #44]
    20b0:	e2633000 	rsb	r3, r3, #0	; 0x0
    20b4:	e1a03803 	mov	r3, r3, lsl #16
    20b8:	e1a02823 	mov	r2, r3, lsr #16
    20bc:	e51b301c 	ldr	r3, [fp, #-28]
    20c0:	e1c320b6 	strh	r2, [r3, #6]
    20c4:	e51b301c 	ldr	r3, [fp, #-28]
    20c8:	e1d330b8 	ldrh	r3, [r3, #8]
    20cc:	e3530004 	cmp	r3, #4	; 0x4
    20d0:	8a000003 	bhi	20e4 <controlLoop+0x630>
    20d4:	e51b301c 	ldr	r3, [fp, #-28]
    20d8:	e3a02000 	mov	r2, #0	; 0x0
    20dc:	e1c320b6 	strh	r2, [r3, #6]
    20e0:	ea00001e 	b	2160 <controlLoop+0x6ac>
    20e4:	e51b301c 	ldr	r3, [fp, #-28]
    20e8:	e1d320b8 	ldrh	r2, [r3, #8]
    20ec:	e51b301c 	ldr	r3, [fp, #-28]
    20f0:	e1d333b6 	ldrh	r3, [r3, #54]
    20f4:	e1520003 	cmp	r2, r3
    20f8:	9a000009 	bls	2124 <controlLoop+0x670>
    20fc:	e51b301c 	ldr	r3, [fp, #-28]
    2100:	e1d330b6 	ldrh	r3, [r3, #6]
    2104:	e1a03803 	mov	r3, r3, lsl #16
    2108:	e1a03843 	mov	r3, r3, asr #16
    210c:	e3530000 	cmp	r3, #0	; 0x0
    2110:	aa000003 	bge	2124 <controlLoop+0x670>
    2114:	e51b301c 	ldr	r3, [fp, #-28]
    2118:	e3a02000 	mov	r2, #0	; 0x0
    211c:	e1c320b6 	strh	r2, [r3, #6]
    2120:	ea00000e 	b	2160 <controlLoop+0x6ac>
    2124:	e51b301c 	ldr	r3, [fp, #-28]
    2128:	e1d320b8 	ldrh	r2, [r3, #8]
    212c:	e51b301c 	ldr	r3, [fp, #-28]
    2130:	e1d332ba 	ldrh	r3, [r3, #42]
    2134:	e1520003 	cmp	r2, r3
    2138:	2a000008 	bcs	2160 <controlLoop+0x6ac>
    213c:	e51b301c 	ldr	r3, [fp, #-28]
    2140:	e1d330b6 	ldrh	r3, [r3, #6]
    2144:	e1a03803 	mov	r3, r3, lsl #16
    2148:	e1a03843 	mov	r3, r3, asr #16
    214c:	e3530000 	cmp	r3, #0	; 0x0
    2150:	da000002 	ble	2160 <controlLoop+0x6ac>
    2154:	e51b301c 	ldr	r3, [fp, #-28]
    2158:	e3a02000 	mov	r2, #0	; 0x0
    215c:	e1c320b6 	strh	r2, [r3, #6]
    2160:	e51b201c 	ldr	r2, [fp, #-28]
    2164:	e3a03000 	mov	r3, #0	; 0x0
    2168:	e5c23002 	strb	r3, [r2, #2]
    216c:	e51b201c 	ldr	r2, [fp, #-28]
    2170:	e3a03000 	mov	r3, #0	; 0x0
    2174:	e5c23003 	strb	r3, [r2, #3]
    2178:	e51b301c 	ldr	r3, [fp, #-28]
    217c:	e5d33000 	ldrb	r3, [r3]
    2180:	e3530000 	cmp	r3, #0	; 0x0
    2184:	0a00000f 	beq	21c8 <controlLoop+0x714>
    2188:	e51b301c 	ldr	r3, [fp, #-28]
    218c:	e1d331b2 	ldrh	r3, [r3, #18]
    2190:	e1a03803 	mov	r3, r3, lsl #16
    2194:	e1a03843 	mov	r3, r3, asr #16
    2198:	e3530004 	cmp	r3, #4	; 0x4
    219c:	ca00001c 	bgt	2214 <controlLoop+0x760>
    21a0:	e51b301c 	ldr	r3, [fp, #-28]
    21a4:	e1d331b2 	ldrh	r3, [r3, #18]
    21a8:	e1a03803 	mov	r3, r3, lsl #16
    21ac:	e1a03843 	mov	r3, r3, asr #16
    21b0:	e3730005 	cmn	r3, #5	; 0x5
    21b4:	da000016 	ble	2214 <controlLoop+0x760>
    21b8:	e51b301c 	ldr	r3, [fp, #-28]
    21bc:	e3a02001 	mov	r2, #1	; 0x1
    21c0:	e5c32002 	strb	r2, [r3, #2]
    21c4:	ea000012 	b	2214 <controlLoop+0x760>
    21c8:	e51b301c 	ldr	r3, [fp, #-28]
    21cc:	e1d333b4 	ldrh	r3, [r3, #52]
    21d0:	e3530000 	cmp	r3, #0	; 0x0
    21d4:	1a00000e 	bne	2214 <controlLoop+0x760>
    21d8:	e51b301c 	ldr	r3, [fp, #-28]
    21dc:	e1d331b2 	ldrh	r3, [r3, #18]
    21e0:	e1a03803 	mov	r3, r3, lsl #16
    21e4:	e1a03843 	mov	r3, r3, asr #16
    21e8:	e3530004 	cmp	r3, #4	; 0x4
    21ec:	ca000008 	bgt	2214 <controlLoop+0x760>
    21f0:	e51b301c 	ldr	r3, [fp, #-28]
    21f4:	e1d331b2 	ldrh	r3, [r3, #18]
    21f8:	e1a03803 	mov	r3, r3, lsl #16
    21fc:	e1a03843 	mov	r3, r3, asr #16
    2200:	e3730005 	cmn	r3, #5	; 0x5
    2204:	da000002 	ble	2214 <controlLoop+0x760>
    2208:	e51b301c 	ldr	r3, [fp, #-28]
    220c:	e3a02001 	mov	r2, #1	; 0x1
    2210:	e5c32003 	strb	r2, [r3, #3]
    2214:	e51b301c 	ldr	r3, [fp, #-28]
    2218:	e5d33001 	ldrb	r3, [r3, #1]
    221c:	e3530000 	cmp	r3, #0	; 0x0
    2220:	0a000020 	beq	22a8 <controlLoop+0x7f4>
    2224:	e51b201c 	ldr	r2, [fp, #-28]
    2228:	e3a03000 	mov	r3, #0	; 0x0
    222c:	e1c230b6 	strh	r3, [r2, #6]
    2230:	e51b301c 	ldr	r3, [fp, #-28]
    2234:	e1d331b0 	ldrh	r3, [r3, #16]
    2238:	e1a03803 	mov	r3, r3, lsl #16
    223c:	e1a02843 	mov	r2, r3, asr #16
    2240:	e15b31b6 	ldrh	r3, [fp, #-22]
    2244:	e0020293 	mul	r2, r3, r2
    2248:	e51b301c 	ldr	r3, [fp, #-28]
    224c:	e5832030 	str	r2, [r3, #48]
    2250:	e51b201c 	ldr	r2, [fp, #-28]
    2254:	e3a03000 	mov	r3, #0	; 0x0
    2258:	e5823020 	str	r3, [r2, #32]
    225c:	e51b301c 	ldr	r3, [fp, #-28]
    2260:	e5d33002 	ldrb	r3, [r3, #2]
    2264:	e3530000 	cmp	r3, #0	; 0x0
    2268:	03a03000 	moveq	r3, #0	; 0x0
    226c:	13a03001 	movne	r3, #1	; 0x1
    2270:	e20320ff 	and	r2, r3, #255	; 0xff
    2274:	e51b301c 	ldr	r3, [fp, #-28]
    2278:	e5d33003 	ldrb	r3, [r3, #3]
    227c:	e3530000 	cmp	r3, #0	; 0x0
    2280:	03a03000 	moveq	r3, #0	; 0x0
    2284:	13a03001 	movne	r3, #1	; 0x1
    2288:	e20330ff 	and	r3, r3, #255	; 0xff
    228c:	e1823003 	orr	r3, r2, r3
    2290:	e20330ff 	and	r3, r3, #255	; 0xff
    2294:	e3530000 	cmp	r3, #0	; 0x0
    2298:	0a000002 	beq	22a8 <controlLoop+0x7f4>
    229c:	e51b301c 	ldr	r3, [fp, #-28]
    22a0:	e3a02000 	mov	r2, #0	; 0x0
    22a4:	e5c32001 	strb	r2, [r3, #1]
    22a8:	e24bd010 	sub	sp, fp, #16	; 0x10
    22ac:	e89da810 	ldmia	sp, {r4, fp, sp, pc}
    22b0:	66666667 	strvsbt	r6, [r6], -r7, ror #12

000022b4 <adc_disable>:
    22b4:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    22b8:	e282190d 	add	r1, r2, #212992	; 0x34000
    22bc:	e5913000 	ldr	r3, [r1]
    22c0:	e3c33602 	bic	r3, r3, #2097152	; 0x200000
    22c4:	e5813000 	str	r3, [r1]
    22c8:	e282297f 	add	r2, r2, #2080768	; 0x1fc000
    22cc:	e59230c4 	ldr	r3, [r2, #196]
    22d0:	e3c33a01 	bic	r3, r3, #4096	; 0x1000
    22d4:	e58230c4 	str	r3, [r2, #196]
    22d8:	e12fff1e 	bx	lr

000022dc <adc_read>:
    22dc:	e3500007 	cmp	r0, #7	; 0x7
    22e0:	979ff100 	ldrls	pc, [pc, r0, lsl #2]
    22e4:	ea00005a 	b	2454 <prog+0x2410>
    22e8:	00002308 	andeq	r2, r0, r8, lsl #6
    22ec:	00002420 	andeq	r2, r0, r0, lsr #8
    22f0:	000023ec 	andeq	r2, r0, ip, ror #7
    22f4:	000023b8 	streqh	r2, [r0], -r8
    22f8:	00002384 	andeq	r2, r0, r4, lsl #7
    22fc:	00002454 	andeq	r2, r0, r4, asr r4
    2300:	00002350 	andeq	r2, r0, r0, asr r3
    2304:	0000232c 	andeq	r2, r0, ip, lsr #6
    2308:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    230c:	e283390d 	add	r3, r3, #212992	; 0x34000
    2310:	e5931010 	ldr	r1, [r3, #16]
    2314:	e5932010 	ldr	r2, [r3, #16]
    2318:	e3520000 	cmp	r2, #0	; 0x0
    231c:	aafffff9 	bge	2308 <prog+0x22c4>
    2320:	e1a03801 	mov	r3, r1, lsl #16
    2324:	e1a00b23 	mov	r0, r3, lsr #22
    2328:	e12fff1e 	bx	lr
    232c:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    2330:	e283390d 	add	r3, r3, #212992	; 0x34000
    2334:	e593102c 	ldr	r1, [r3, #44]
    2338:	e593202c 	ldr	r2, [r3, #44]
    233c:	e3520000 	cmp	r2, #0	; 0x0
    2340:	aafffff9 	bge	232c <prog+0x22e8>
    2344:	e1a03801 	mov	r3, r1, lsl #16
    2348:	e1a00b23 	mov	r0, r3, lsr #22
    234c:	e12fff1e 	bx	lr
    2350:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    2354:	e283390d 	add	r3, r3, #212992	; 0x34000
    2358:	e5931028 	ldr	r1, [r3, #40]
    235c:	e5932028 	ldr	r2, [r3, #40]
    2360:	e3520000 	cmp	r2, #0	; 0x0
    2364:	baffffed 	blt	2320 <prog+0x22dc>
    2368:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    236c:	e283390d 	add	r3, r3, #212992	; 0x34000
    2370:	e5931028 	ldr	r1, [r3, #40]
    2374:	e5932028 	ldr	r2, [r3, #40]
    2378:	e3520000 	cmp	r2, #0	; 0x0
    237c:	aafffff3 	bge	2350 <prog+0x230c>
    2380:	eaffffe6 	b	2320 <prog+0x22dc>
    2384:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    2388:	e283390d 	add	r3, r3, #212992	; 0x34000
    238c:	e5931020 	ldr	r1, [r3, #32]
    2390:	e5932020 	ldr	r2, [r3, #32]
    2394:	e3520000 	cmp	r2, #0	; 0x0
    2398:	baffffe0 	blt	2320 <prog+0x22dc>
    239c:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    23a0:	e283390d 	add	r3, r3, #212992	; 0x34000
    23a4:	e5931020 	ldr	r1, [r3, #32]
    23a8:	e5932020 	ldr	r2, [r3, #32]
    23ac:	e3520000 	cmp	r2, #0	; 0x0
    23b0:	aafffff3 	bge	2384 <prog+0x2340>
    23b4:	eaffffd9 	b	2320 <prog+0x22dc>
    23b8:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    23bc:	e283390d 	add	r3, r3, #212992	; 0x34000
    23c0:	e593101c 	ldr	r1, [r3, #28]
    23c4:	e593201c 	ldr	r2, [r3, #28]
    23c8:	e3520000 	cmp	r2, #0	; 0x0
    23cc:	baffffd3 	blt	2320 <prog+0x22dc>
    23d0:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    23d4:	e283390d 	add	r3, r3, #212992	; 0x34000
    23d8:	e593101c 	ldr	r1, [r3, #28]
    23dc:	e593201c 	ldr	r2, [r3, #28]
    23e0:	e3520000 	cmp	r2, #0	; 0x0
    23e4:	aafffff3 	bge	23b8 <prog+0x2374>
    23e8:	eaffffcc 	b	2320 <prog+0x22dc>
    23ec:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    23f0:	e283390d 	add	r3, r3, #212992	; 0x34000
    23f4:	e5931018 	ldr	r1, [r3, #24]
    23f8:	e5932014 	ldr	r2, [r3, #20]
    23fc:	e3520000 	cmp	r2, #0	; 0x0
    2400:	baffffc6 	blt	2320 <prog+0x22dc>
    2404:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    2408:	e283390d 	add	r3, r3, #212992	; 0x34000
    240c:	e5931018 	ldr	r1, [r3, #24]
    2410:	e5932014 	ldr	r2, [r3, #20]
    2414:	e3520000 	cmp	r2, #0	; 0x0
    2418:	aafffff3 	bge	23ec <prog+0x23a8>
    241c:	eaffffbf 	b	2320 <prog+0x22dc>
    2420:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    2424:	e283390d 	add	r3, r3, #212992	; 0x34000
    2428:	e5931014 	ldr	r1, [r3, #20]
    242c:	e5932014 	ldr	r2, [r3, #20]
    2430:	e3520000 	cmp	r2, #0	; 0x0
    2434:	baffffb9 	blt	2320 <prog+0x22dc>
    2438:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    243c:	e283390d 	add	r3, r3, #212992	; 0x34000
    2440:	e5931014 	ldr	r1, [r3, #20]
    2444:	e5932014 	ldr	r2, [r3, #20]
    2448:	e3520000 	cmp	r2, #0	; 0x0
    244c:	aafffff3 	bge	2420 <prog+0x23dc>
    2450:	eaffffb2 	b	2320 <prog+0x22dc>
    2454:	e3a00000 	mov	r0, #0	; 0x0
    2458:	e12fff1e 	bx	lr

0000245c <adc_init_cont>:
    245c:	e92d4010 	stmdb	sp!, {r4, lr}
    2460:	e20040ff 	and	r4, r0, #255	; 0xff
    2464:	e3510004 	cmp	r1, #4	; 0x4
    2468:	979ff101 	ldrls	pc, [pc, r1, lsl #2]
    246c:	ea000046 	b	258c <prog+0x2548>
    2470:	00002534 	andeq	r2, r0, r4, lsr r5
    2474:	00002518 	andeq	r2, r0, r8, lsl r5
    2478:	00002500 	andeq	r2, r0, r0, lsl #10
    247c:	0000258c 	andeq	r2, r0, ip, lsl #11
    2480:	00002484 	andeq	r2, r0, r4, lsl #9
    2484:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    2488:	e282297f 	add	r2, r2, #2080768	; 0x1fc000
    248c:	e59231a8 	ldr	r3, [r2, #424]
    2490:	e3833403 	orr	r3, r3, #50331648	; 0x3000000
    2494:	e58231a8 	str	r3, [r2, #424]
    2498:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    249c:	e282297f 	add	r2, r2, #2080768	; 0x1fc000
    24a0:	e59230c4 	ldr	r3, [r2, #196]
    24a4:	e3833a01 	orr	r3, r3, #4096	; 0x1000
    24a8:	e58230c4 	str	r3, [r2, #196]
    24ac:	e3a0120e 	mov	r1, #-536870912	; 0xe0000000
    24b0:	e281190d 	add	r1, r1, #212992	; 0x34000
    24b4:	e5913000 	ldr	r3, [r1]
    24b8:	e3833602 	orr	r3, r3, #2097152	; 0x200000
    24bc:	e5813000 	str	r3, [r1]
    24c0:	eb000070 	bl	2688 <pllquery_cclk_mhz>
    24c4:	e3a037e5 	mov	r3, #60030976	; 0x3940000
    24c8:	e2433c79 	sub	r3, r3, #30976	; 0x7900
    24cc:	e1500003 	cmp	r0, r3
    24d0:	0a00002b 	beq	2584 <prog+0x2540>
    24d4:	e3a03511 	mov	r3, #71303168	; 0x4400000
    24d8:	e2833aaa 	add	r3, r3, #696320	; 0xaa000
    24dc:	e2833c02 	add	r3, r3, #512	; 0x200
    24e0:	e1500003 	cmp	r0, r3
    24e4:	0a00001a 	beq	2554 <prog+0x2510>
    24e8:	e3a037b7 	mov	r3, #47972352	; 0x2dc0000
    24ec:	e2833b1b 	add	r3, r3, #27648	; 0x6c00
    24f0:	e1500003 	cmp	r0, r3
    24f4:	03a00c0a 	moveq	r0, #2560	; 0xa00
    24f8:	0a000016 	beq	2558 <prog+0x2514>
    24fc:	eafffffe 	b	24fc <prog+0x24b8>
    2500:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    2504:	e282297f 	add	r2, r2, #2080768	; 0x1fc000
    2508:	e59231a8 	ldr	r3, [r2, #424]
    250c:	e3c33403 	bic	r3, r3, #50331648	; 0x3000000
    2510:	e58231a8 	str	r3, [r2, #424]
    2514:	eaffffdf 	b	2498 <prog+0x2454>
    2518:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    251c:	e282297f 	add	r2, r2, #2080768	; 0x1fc000
    2520:	e59231a8 	ldr	r3, [r2, #424]
    2524:	e3c33403 	bic	r3, r3, #50331648	; 0x3000000
    2528:	e3833402 	orr	r3, r3, #33554432	; 0x2000000
    252c:	e58231a8 	str	r3, [r2, #424]
    2530:	eaffffd8 	b	2498 <prog+0x2454>
    2534:	eb000023 	bl	25c8 <mam_enable>
    2538:	e3a0220e 	mov	r2, #-536870912	; 0xe0000000
    253c:	e282297f 	add	r2, r2, #2080768	; 0x1fc000
    2540:	e59231a8 	ldr	r3, [r2, #424]
    2544:	e3c33403 	bic	r3, r3, #50331648	; 0x3000000
    2548:	e3833401 	orr	r3, r3, #16777216	; 0x1000000
    254c:	e58231a8 	str	r3, [r2, #424]
    2550:	eaffffd0 	b	2498 <prog+0x2454>
    2554:	e3a00a01 	mov	r0, #4096	; 0x1000
    2558:	e3a0120e 	mov	r1, #-536870912	; 0xe0000000
    255c:	e281190d 	add	r1, r1, #212992	; 0x34000
    2560:	e5912000 	ldr	r2, [r1]
    2564:	e3c2246f 	bic	r2, r2, #1862270976	; 0x6f000000
    2568:	e5812000 	str	r2, [r1]
    256c:	e5913000 	ldr	r3, [r1]
    2570:	e3833801 	orr	r3, r3, #65536	; 0x10000
    2574:	e1833004 	orr	r3, r3, r4
    2578:	e1833000 	orr	r3, r3, r0
    257c:	e5813000 	str	r3, [r1]
    2580:	e8bd8010 	ldmia	sp!, {r4, pc}
    2584:	e3a00c0d 	mov	r0, #3328	; 0xd00
    2588:	eafffff2 	b	2558 <prog+0x2514>
    258c:	eafffffe 	b	258c <prog+0x2548>

00002590 <mam_disable>:
    2590:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    2594:	e283397f 	add	r3, r3, #2080768	; 0x1fc000
    2598:	e3a02000 	mov	r2, #0	; 0x0
    259c:	e3a01007 	mov	r1, #7	; 0x7
    25a0:	e5832000 	str	r2, [r3]
    25a4:	e5831004 	str	r1, [r3, #4]
    25a8:	e12fff1e 	bx	lr

000025ac <mam_enable_custom>:
    25ac:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    25b0:	e283397f 	add	r3, r3, #2080768	; 0x1fc000
    25b4:	e2000003 	and	r0, r0, #3	; 0x3
    25b8:	e2011007 	and	r1, r1, #7	; 0x7
    25bc:	e5830000 	str	r0, [r3]
    25c0:	e5831004 	str	r1, [r3, #4]
    25c4:	e12fff1e 	bx	lr

000025c8 <mam_enable>:
    25c8:	e52de004 	str	lr, [sp, #-4]!
    25cc:	eb00002d 	bl	2688 <pllquery_cclk_mhz>
    25d0:	e3a037b7 	mov	r3, #47972352	; 0x2dc0000
    25d4:	e2833b1b 	add	r3, r3, #27648	; 0x6c00
    25d8:	e3a0120e 	mov	r1, #-536870912	; 0xe0000000
    25dc:	e281197f 	add	r1, r1, #2080768	; 0x1fc000
    25e0:	e1500003 	cmp	r0, r3
    25e4:	e3a02007 	mov	r2, #7	; 0x7
    25e8:	e3a03000 	mov	r3, #0	; 0x0
    25ec:	e5813000 	str	r3, [r1]
    25f0:	e5812004 	str	r2, [r1, #4]
    25f4:	0a00001a 	beq	2664 <mam_enable+0x9c>
    25f8:	9a00000f 	bls	263c <mam_enable+0x74>
    25fc:	e3a037e5 	mov	r3, #60030976	; 0x3940000
    2600:	e2433c79 	sub	r3, r3, #30976	; 0x7900
    2604:	e1500003 	cmp	r0, r3
    2608:	0a000015 	beq	2664 <mam_enable+0x9c>
    260c:	e3a03511 	mov	r3, #71303168	; 0x4400000
    2610:	e2833aaa 	add	r3, r3, #696320	; 0xaa000
    2614:	e2833c02 	add	r3, r3, #512	; 0x200
    2618:	e1500003 	cmp	r0, r3
    261c:	0a00000b 	beq	2650 <mam_enable+0x88>
    2620:	e3a0320e 	mov	r3, #-536870912	; 0xe0000000
    2624:	e283397f 	add	r3, r3, #2080768	; 0x1fc000
    2628:	e3a02000 	mov	r2, #0	; 0x0
    262c:	e3a01007 	mov	r1, #7	; 0x7
    2630:	e5832000 	str	r2, [r3]
    2634:	e5831004 	str	r1, [r3, #4]
    2638:	e49df004 	ldr	pc, [sp], #4
    263c:	e1500003 	cmp	r0, r3
    2640:	05810000 	streq	r0, [r1]
    2644:	05812004 	streq	r2, [r1, #4]
    2648:	049df004 	ldreq	pc, [sp], #4
    264c:	eafffff3 	b	2620 <mam_enable+0x58>
    2650:	e3a03002 	mov	r3, #2	; 0x2
    2654:	e3a02004 	mov	r2, #4	; 0x4
    2658:	e5813000 	str	r3, [r1]
    265c:	e5812004 	str	r2, [r1, #4]
    2660:	e49df004 	ldr	pc, [sp], #4
    2664:	e3a03002 	mov	r3, #2	; 0x2
    2668:	e3a02003 	mov	r2, #3	; 0x3
    266c:	e5813000 	str	r3, [r1]
    2670:	e5812004 	str	r2, [r1, #4]
    2674:	e49df004 	ldr	pc, [sp], #4

00002678 <pllquery_fcco_mhz>:
    2678:	e59f3004 	ldr	r3, [pc, #4]	; 2684 <prog+0x2640>
    267c:	e5930004 	ldr	r0, [r3, #4]
    2680:	e12fff1e 	bx	lr
    2684:	40000020 	andmi	r0, r0, r0, lsr #32

00002688 <pllquery_cclk_mhz>:
    2688:	e59f3004 	ldr	r3, [pc, #4]	; 2694 <prog+0x2650>
    268c:	e5930000 	ldr	r0, [r3]
    2690:	e12fff1e 	bx	lr
    2694:	40000020 	andmi	r0, r0, r0, lsr #32

00002698 <pllfeed>:
    2698:	e3e00000 	mvn	r0, #0	; 0x0
    269c:	e510cfef 	ldr	ip, [r0, #-4079]
    26a0:	e3a0120e 	mov	r1, #-536870912	; 0xe0000000
    26a4:	e281197f 	add	r1, r1, #2080768	; 0x1fc000
    26a8:	e3e03055 	mvn	r3, #85	; 0x55
    26ac:	e3a02055 	mov	r2, #85	; 0x55
    26b0:	e5000feb 	str	r0, [r0, #-4075]
    26b4:	e5c1308c 	strb	r3, [r1, #140]
    26b8:	e5c1208c 	strb	r2, [r1, #140]
    26bc:	e500cfef 	str	ip, [r0, #-4079]
    26c0:	e12fff1e 	bx	lr

000026c4 <pllstop>:
    26c4:	e52de004 	str	lr, [sp, #-4]!
    26c8:	e3a0e20e 	mov	lr, #-536870912	; 0xe0000000
    26cc:	e28ee97f 	add	lr, lr, #2080768	; 0x1fc000
    26d0:	e59e2088 	ldr	r2, [lr, #136]
    26d4:	e59e3088 	ldr	r3, [lr, #136]
    26d8:	e3130402 	tst	r3, #33554432	; 0x2000000
    26dc:	049df004 	ldreq	pc, [sp], #4
    26e0:	e5de3080 	ldrb	r3, [lr, #128]
    26e4:	e20330fd 	and	r3, r3, #253	; 0xfd
    26e8:	e5ce3080 	strb	r3, [lr, #128]
    26ec:	e3e02000 	mvn	r2, #0	; 0x0
    26f0:	e5121fef 	ldr	r1, [r2, #-4079]
    26f4:	e3e00055 	mvn	r0, #85	; 0x55
    26f8:	e3a0c055 	mov	ip, #85	; 0x55
    26fc:	e5022feb 	str	r2, [r2, #-4075]
    2700:	e5ce008c 	strb	r0, [lr, #140]
    2704:	e5cec08c 	strb	ip, [lr, #140]
    2708:	e5021fef 	str	r1, [r2, #-4079]
    270c:	e5de3080 	ldrb	r3, [lr, #128]
    2710:	e20330fe 	and	r3, r3, #254	; 0xfe
    2714:	e5ce3080 	strb	r3, [lr, #128]
    2718:	e5121fef 	ldr	r1, [r2, #-4079]
    271c:	e5022feb 	str	r2, [r2, #-4075]
    2720:	e5ce008c 	strb	r0, [lr, #140]
    2724:	e5cec08c 	strb	ip, [lr, #140]
    2728:	e5021fef 	str	r1, [r2, #-4079]
    272c:	e49df004 	ldr	pc, [sp], #4

00002730 <pllstart_fourtyeightmhz>:
    2730:	e92d4030 	stmdb	sp!, {r4, r5, lr}
    2734:	e3a0e20e 	mov	lr, #-536870912	; 0xe0000000
    2738:	e28ee97f 	add	lr, lr, #2080768	; 0x1fc000
    273c:	e59e2088 	ldr	r2, [lr, #136]
    2740:	e59e3088 	ldr	r3, [lr, #136]
    2744:	e3130402 	tst	r3, #33554432	; 0x2000000
    2748:	0a000012 	beq	2798 <pllstart_fourtyeightmhz+0x68>
    274c:	e5de3080 	ldrb	r3, [lr, #128]
    2750:	e20330fd 	and	r3, r3, #253	; 0xfd
    2754:	e5ce3080 	strb	r3, [lr, #128]
    2758:	e3e02000 	mvn	r2, #0	; 0x0
    275c:	e5121fef 	ldr	r1, [r2, #-4079]
    2760:	e3e00055 	mvn	r0, #85	; 0x55
    2764:	e3a0c055 	mov	ip, #85	; 0x55
    2768:	e5022feb 	str	r2, [r2, #-4075]
    276c:	e5ce008c 	strb	r0, [lr, #140]
    2770:	e5cec08c 	strb	ip, [lr, #140]
    2774:	e5021fef 	str	r1, [r2, #-4079]
    2778:	e5de3080 	ldrb	r3, [lr, #128]
    277c:	e20330fe 	and	r3, r3, #254	; 0xfe
    2780:	e5ce3080 	strb	r3, [lr, #128]
    2784:	e5121fef 	ldr	r1, [r2, #-4079]
    2788:	e5022feb 	str	r2, [r2, #-4075]
    278c:	e5ce008c 	strb	r0, [lr, #140]
    2790:	e5cec08c 	strb	ip, [lr, #140]
    2794:	e5021fef 	str	r1, [r2, #-4079]
    2798:	e59e31a0 	ldr	r3, [lr, #416]
    279c:	e3833020 	orr	r3, r3, #32	; 0x20
    27a0:	e58e31a0 	str	r3, [lr, #416]
    27a4:	e3a0e20e 	mov	lr, #-536870912	; 0xe0000000
    27a8:	e28ee97f 	add	lr, lr, #2080768	; 0x1fc000
    27ac:	e59e31a0 	ldr	r3, [lr, #416]
    27b0:	e3130040 	tst	r3, #64	; 0x40
    27b4:	0afffffa 	beq	27a4 <pllstart_fourtyeightmhz+0x74>
    27b8:	e3a03001 	mov	r3, #1	; 0x1
    27bc:	e3a02013 	mov	r2, #19	; 0x13
    27c0:	e58e310c 	str	r3, [lr, #268]
    27c4:	e58e2084 	str	r2, [lr, #132]
    27c8:	e3e01000 	mvn	r1, #0	; 0x0
    27cc:	e5112fef 	ldr	r2, [r1, #-4079]
    27d0:	e3e00055 	mvn	r0, #85	; 0x55
    27d4:	e3a0c055 	mov	ip, #85	; 0x55
    27d8:	e5011feb 	str	r1, [r1, #-4075]
    27dc:	e5ce008c 	strb	r0, [lr, #140]
    27e0:	e5cec08c 	strb	ip, [lr, #140]
    27e4:	e5012fef 	str	r2, [r1, #-4079]
    27e8:	e5de3080 	ldrb	r3, [lr, #128]
    27ec:	e3833001 	orr	r3, r3, #1	; 0x1
    27f0:	e5ce3080 	strb	r3, [lr, #128]
    27f4:	e5112fef 	ldr	r2, [r1, #-4079]
    27f8:	e3a03009 	mov	r3, #9	; 0x9
    27fc:	e5011feb 	str	r1, [r1, #-4075]
    2800:	e5ce008c 	strb	r0, [lr, #140]
    2804:	e5cec08c 	strb	ip, [lr, #140]
    2808:	e5012fef 	str	r2, [r1, #-4079]
    280c:	e58e3104 	str	r3, [lr, #260]
    2810:	e58e3108 	str	r3, [lr, #264]
    2814:	e3a0520e 	mov	r5, #-536870912	; 0xe0000000
    2818:	e285597f 	add	r5, r5, #2080768	; 0x1fc000
    281c:	e5953088 	ldr	r3, [r5, #136]
    2820:	e3130301 	tst	r3, #67108864	; 0x4000000
    2824:	0afffffa 	beq	2814 <pllstart_fourtyeightmhz+0xe4>
    2828:	e5d53080 	ldrb	r3, [r5, #128]
    282c:	e3833003 	orr	r3, r3, #3	; 0x3
    2830:	e5c53080 	strb	r3, [r5, #128]
    2834:	e3e0c000 	mvn	ip, #0	; 0x0
    2838:	e3a01572 	mov	r1, #478150656	; 0x1c800000
    283c:	e51c4fef 	ldr	r4, [ip, #-4079]
    2840:	e59fe02c 	ldr	lr, [pc, #44]	; 2874 <prog+0x2830>
    2844:	e2811707 	add	r1, r1, #1835008	; 0x1c0000
    2848:	e3a007b7 	mov	r0, #47972352	; 0x2dc0000
    284c:	e2800b1b 	add	r0, r0, #27648	; 0x6c00
    2850:	e2811b0e 	add	r1, r1, #14336	; 0x3800
    2854:	e3e03055 	mvn	r3, #85	; 0x55
    2858:	e3a02055 	mov	r2, #85	; 0x55
    285c:	e50ccfeb 	str	ip, [ip, #-4075]
    2860:	e5c5308c 	strb	r3, [r5, #140]
    2864:	e5c5208c 	strb	r2, [r5, #140]
    2868:	e50c4fef 	str	r4, [ip, #-4079]
    286c:	e88e0003 	stmia	lr, {r0, r1}
    2870:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
    2874:	40000020 	andmi	r0, r0, r0, lsr #32

00002878 <pllstart_sixtymhz>:
    2878:	e92d4030 	stmdb	sp!, {r4, r5, lr}
    287c:	e3a0e20e 	mov	lr, #-536870912	; 0xe0000000
    2880:	e28ee97f 	add	lr, lr, #2080768	; 0x1fc000
    2884:	e59e2088 	ldr	r2, [lr, #136]
    2888:	e59e3088 	ldr	r3, [lr, #136]
    288c:	e3130402 	tst	r3, #33554432	; 0x2000000
    2890:	0a000012 	beq	28e0 <pllstart_sixtymhz+0x68>
    2894:	e5de3080 	ldrb	r3, [lr, #128]
    2898:	e20330fd 	and	r3, r3, #253	; 0xfd
    289c:	e5ce3080 	strb	r3, [lr, #128]
    28a0:	e3e02000 	mvn	r2, #0	; 0x0
    28a4:	e5121fef 	ldr	r1, [r2, #-4079]
    28a8:	e3e00055 	mvn	r0, #85	; 0x55
    28ac:	e3a0c055 	mov	ip, #85	; 0x55
    28b0:	e5022feb 	str	r2, [r2, #-4075]
    28b4:	e5ce008c 	strb	r0, [lr, #140]
    28b8:	e5cec08c 	strb	ip, [lr, #140]
    28bc:	e5021fef 	str	r1, [r2, #-4079]
    28c0:	e5de3080 	ldrb	r3, [lr, #128]
    28c4:	e20330fe 	and	r3, r3, #254	; 0xfe
    28c8:	e5ce3080 	strb	r3, [lr, #128]
    28cc:	e5121fef 	ldr	r1, [r2, #-4079]
    28d0:	e5022feb 	str	r2, [r2, #-4075]
    28d4:	e5ce008c 	strb	r0, [lr, #140]
    28d8:	e5cec08c 	strb	ip, [lr, #140]
    28dc:	e5021fef 	str	r1, [r2, #-4079]
    28e0:	e59e31a0 	ldr	r3, [lr, #416]
    28e4:	e3833020 	orr	r3, r3, #32	; 0x20
    28e8:	e58e31a0 	str	r3, [lr, #416]
    28ec:	e3a0e20e 	mov	lr, #-536870912	; 0xe0000000
    28f0:	e28ee97f 	add	lr, lr, #2080768	; 0x1fc000
    28f4:	e59e31a0 	ldr	r3, [lr, #416]
    28f8:	e3130040 	tst	r3, #64	; 0x40
    28fc:	0afffffa 	beq	28ec <pllstart_sixtymhz+0x74>
    2900:	e3a03001 	mov	r3, #1	; 0x1
    2904:	e3a02013 	mov	r2, #19	; 0x13
    2908:	e58e310c 	str	r3, [lr, #268]
    290c:	e58e2084 	str	r2, [lr, #132]
    2910:	e3e01000 	mvn	r1, #0	; 0x0
    2914:	e5112fef 	ldr	r2, [r1, #-4079]
    2918:	e3e00055 	mvn	r0, #85	; 0x55
    291c:	e3a0c055 	mov	ip, #85	; 0x55
    2920:	e5011feb 	str	r1, [r1, #-4075]
    2924:	e5ce008c 	strb	r0, [lr, #140]
    2928:	e5cec08c 	strb	ip, [lr, #140]
    292c:	e5012fef 	str	r2, [r1, #-4079]
    2930:	e5de3080 	ldrb	r3, [lr, #128]
    2934:	e3833001 	orr	r3, r3, #1	; 0x1
    2938:	e5ce3080 	strb	r3, [lr, #128]
    293c:	e5112fef 	ldr	r2, [r1, #-4079]
    2940:	e3a03007 	mov	r3, #7	; 0x7
    2944:	e5011feb 	str	r1, [r1, #-4075]
    2948:	e5ce008c 	strb	r0, [lr, #140]
    294c:	e5cec08c 	strb	ip, [lr, #140]
    2950:	e5012fef 	str	r2, [r1, #-4079]
    2954:	e3a02009 	mov	r2, #9	; 0x9
    2958:	e58e3104 	str	r3, [lr, #260]
    295c:	e58e2108 	str	r2, [lr, #264]
    2960:	e3a0520e 	mov	r5, #-536870912	; 0xe0000000
    2964:	e285597f 	add	r5, r5, #2080768	; 0x1fc000
    2968:	e5953088 	ldr	r3, [r5, #136]
    296c:	e3130301 	tst	r3, #67108864	; 0x4000000
    2970:	0afffffa 	beq	2960 <pllstart_sixtymhz+0xe8>
    2974:	e5d53080 	ldrb	r3, [r5, #128]
    2978:	e3833003 	orr	r3, r3, #3	; 0x3
    297c:	e5c53080 	strb	r3, [r5, #128]
    2980:	e3e0c000 	mvn	ip, #0	; 0x0
    2984:	e3a01572 	mov	r1, #478150656	; 0x1c800000
    2988:	e51c4fef 	ldr	r4, [ip, #-4079]
    298c:	e59fe02c 	ldr	lr, [pc, #44]	; 29c0 <prog+0x297c>
    2990:	e2811707 	add	r1, r1, #1835008	; 0x1c0000
    2994:	e3a007e5 	mov	r0, #60030976	; 0x3940000
    2998:	e2400c79 	sub	r0, r0, #30976	; 0x7900
    299c:	e2811b0e 	add	r1, r1, #14336	; 0x3800
    29a0:	e3e03055 	mvn	r3, #85	; 0x55
    29a4:	e3a02055 	mov	r2, #85	; 0x55
    29a8:	e50ccfeb 	str	ip, [ip, #-4075]
    29ac:	e5c5308c 	strb	r3, [r5, #140]
    29b0:	e5c5208c 	strb	r2, [r5, #140]
    29b4:	e50c4fef 	str	r4, [ip, #-4079]
    29b8:	e88e0003 	stmia	lr, {r0, r1}
    29bc:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
    29c0:	40000020 	andmi	r0, r0, r0, lsr #32

000029c4 <pllstart_seventytwomhz>:
    29c4:	e92d4030 	stmdb	sp!, {r4, r5, lr}
    29c8:	e3a0e20e 	mov	lr, #-536870912	; 0xe0000000
    29cc:	e28ee97f 	add	lr, lr, #2080768	; 0x1fc000
    29d0:	e59e2088 	ldr	r2, [lr, #136]
    29d4:	e59e3088 	ldr	r3, [lr, #136]
    29d8:	e3130402 	tst	r3, #33554432	; 0x2000000
    29dc:	0a000012 	beq	2a2c <pllstart_seventytwomhz+0x68>
    29e0:	e5de3080 	ldrb	r3, [lr, #128]
    29e4:	e20330fd 	and	r3, r3, #253	; 0xfd
    29e8:	e5ce3080 	strb	r3, [lr, #128]
    29ec:	e3e02000 	mvn	r2, #0	; 0x0
    29f0:	e5121fef 	ldr	r1, [r2, #-4079]
    29f4:	e3e00055 	mvn	r0, #85	; 0x55
    29f8:	e3a0c055 	mov	ip, #85	; 0x55
    29fc:	e5022feb 	str	r2, [r2, #-4075]
    2a00:	e5ce008c 	strb	r0, [lr, #140]
    2a04:	e5cec08c 	strb	ip, [lr, #140]
    2a08:	e5021fef 	str	r1, [r2, #-4079]
    2a0c:	e5de3080 	ldrb	r3, [lr, #128]
    2a10:	e20330fe 	and	r3, r3, #254	; 0xfe
    2a14:	e5ce3080 	strb	r3, [lr, #128]
    2a18:	e5121fef 	ldr	r1, [r2, #-4079]
    2a1c:	e5022feb 	str	r2, [r2, #-4075]
    2a20:	e5ce008c 	strb	r0, [lr, #140]
    2a24:	e5cec08c 	strb	ip, [lr, #140]
    2a28:	e5021fef 	str	r1, [r2, #-4079]
    2a2c:	e59e31a0 	ldr	r3, [lr, #416]
    2a30:	e3833020 	orr	r3, r3, #32	; 0x20
    2a34:	e58e31a0 	str	r3, [lr, #416]
    2a38:	e3a0e20e 	mov	lr, #-536870912	; 0xe0000000
    2a3c:	e28ee97f 	add	lr, lr, #2080768	; 0x1fc000
    2a40:	e59e31a0 	ldr	r3, [lr, #416]
    2a44:	e3130040 	tst	r3, #64	; 0x40
    2a48:	0afffffa 	beq	2a38 <pllstart_seventytwomhz+0x74>
    2a4c:	e3a03001 	mov	r3, #1	; 0x1
    2a50:	e3a0200b 	mov	r2, #11	; 0xb
    2a54:	e58e310c 	str	r3, [lr, #268]
    2a58:	e58e2084 	str	r2, [lr, #132]
    2a5c:	e3e01000 	mvn	r1, #0	; 0x0
    2a60:	e5112fef 	ldr	r2, [r1, #-4079]
    2a64:	e3e00055 	mvn	r0, #85	; 0x55
    2a68:	e3a0c055 	mov	ip, #85	; 0x55
    2a6c:	e5011feb 	str	r1, [r1, #-4075]
    2a70:	e5ce008c 	strb	r0, [lr, #140]
    2a74:	e5cec08c 	strb	ip, [lr, #140]
    2a78:	e5012fef 	str	r2, [r1, #-4079]
    2a7c:	e5de3080 	ldrb	r3, [lr, #128]
    2a80:	e3833001 	orr	r3, r3, #1	; 0x1
    2a84:	e5ce3080 	strb	r3, [lr, #128]
    2a88:	e5112fef 	ldr	r2, [r1, #-4079]
    2a8c:	e3a03003 	mov	r3, #3	; 0x3
    2a90:	e5011feb 	str	r1, [r1, #-4075]
    2a94:	e5ce008c 	strb	r0, [lr, #140]
    2a98:	e5cec08c 	strb	ip, [lr, #140]
    2a9c:	e5012fef 	str	r2, [r1, #-4079]
    2aa0:	e3a02005 	mov	r2, #5	; 0x5
    2aa4:	e58e3104 	str	r3, [lr, #260]
    2aa8:	e58e2108 	str	r2, [lr, #264]
    2aac:	e3a0520e 	mov	r5, #-536870912	; 0xe0000000
    2ab0:	e285597f 	add	r5, r5, #2080768	; 0x1fc000
    2ab4:	e5953088 	ldr	r3, [r5, #136]
    2ab8:	e3130301 	tst	r3, #67108864	; 0x4000000
    2abc:	0afffffa 	beq	2aac <pllstart_seventytwomhz+0xe8>
    2ac0:	e5d53080 	ldrb	r3, [r5, #128]
    2ac4:	e3833003 	orr	r3, r3, #3	; 0x3
    2ac8:	e5c53080 	strb	r3, [r5, #128]
    2acc:	e3e0c000 	mvn	ip, #0	; 0x0
    2ad0:	e3a00511 	mov	r0, #71303168	; 0x4400000
    2ad4:	e3a01411 	mov	r1, #285212672	; 0x11000000
    2ad8:	e51c4fef 	ldr	r4, [ip, #-4079]
    2adc:	e59fe02c 	ldr	lr, [pc, #44]	; 2b10 <prog+0x2acc>
    2ae0:	e2800aaa 	add	r0, r0, #696320	; 0xaa000
    2ae4:	e28119aa 	add	r1, r1, #2785280	; 0x2a8000
    2ae8:	e2800c02 	add	r0, r0, #512	; 0x200
    2aec:	e2811b02 	add	r1, r1, #2048	; 0x800
    2af0:	e3e03055 	mvn	r3, #85	; 0x55
    2af4:	e3a02055 	mov	r2, #85	; 0x55
    2af8:	e50ccfeb 	str	ip, [ip, #-4075]
    2afc:	e5c5308c 	strb	r3, [r5, #140]
    2b00:	e5c5208c 	strb	r2, [r5, #140]
    2b04:	e50c4fef 	str	r4, [ip, #-4079]
    2b08:	e88e0003 	stmia	lr, {r0, r1}
    2b0c:	e8bd8030 	ldmia	sp!, {r4, r5, pc}
    2b10:	40000020 	andmi	r0, r0, r0, lsr #32

00002b14 <__aeabi_idiv>:
    2b14:	e3510000 	cmp	r1, #0	; 0x0
    2b18:	e020c001 	eor	ip, r0, r1
    2b1c:	0a000042 	beq	2c2c <__aeabi_idiv+0x118>
    2b20:	42611000 	rsbmi	r1, r1, #0	; 0x0
    2b24:	e2512001 	subs	r2, r1, #1	; 0x1
    2b28:	0a000027 	beq	2bcc <__aeabi_idiv+0xb8>
    2b2c:	e1b03000 	movs	r3, r0
    2b30:	42603000 	rsbmi	r3, r0, #0	; 0x0
    2b34:	e1530001 	cmp	r3, r1
    2b38:	9a000026 	bls	2bd8 <__aeabi_idiv+0xc4>
    2b3c:	e1110002 	tst	r1, r2
    2b40:	0a000028 	beq	2be8 <__aeabi_idiv+0xd4>
    2b44:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    2b48:	01a01181 	moveq	r1, r1, lsl #3
    2b4c:	03a02008 	moveq	r2, #8	; 0x8
    2b50:	13a02001 	movne	r2, #1	; 0x1
    2b54:	e3510201 	cmp	r1, #268435456	; 0x10000000
    2b58:	31510003 	cmpcc	r1, r3
    2b5c:	31a01201 	movcc	r1, r1, lsl #4
    2b60:	31a02202 	movcc	r2, r2, lsl #4
    2b64:	3afffffa 	bcc	2b54 <__aeabi_idiv+0x40>
    2b68:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    2b6c:	31510003 	cmpcc	r1, r3
    2b70:	31a01081 	movcc	r1, r1, lsl #1
    2b74:	31a02082 	movcc	r2, r2, lsl #1
    2b78:	3afffffa 	bcc	2b68 <__aeabi_idiv+0x54>
    2b7c:	e3a00000 	mov	r0, #0	; 0x0
    2b80:	e1530001 	cmp	r3, r1
    2b84:	20433001 	subcs	r3, r3, r1
    2b88:	21800002 	orrcs	r0, r0, r2
    2b8c:	e15300a1 	cmp	r3, r1, lsr #1
    2b90:	204330a1 	subcs	r3, r3, r1, lsr #1
    2b94:	218000a2 	orrcs	r0, r0, r2, lsr #1
    2b98:	e1530121 	cmp	r3, r1, lsr #2
    2b9c:	20433121 	subcs	r3, r3, r1, lsr #2
    2ba0:	21800122 	orrcs	r0, r0, r2, lsr #2
    2ba4:	e15301a1 	cmp	r3, r1, lsr #3
    2ba8:	204331a1 	subcs	r3, r3, r1, lsr #3
    2bac:	218001a2 	orrcs	r0, r0, r2, lsr #3
    2bb0:	e3530000 	cmp	r3, #0	; 0x0
    2bb4:	11b02222 	movnes	r2, r2, lsr #4
    2bb8:	11a01221 	movne	r1, r1, lsr #4
    2bbc:	1affffef 	bne	2b80 <__aeabi_idiv+0x6c>
    2bc0:	e35c0000 	cmp	ip, #0	; 0x0
    2bc4:	42600000 	rsbmi	r0, r0, #0	; 0x0
    2bc8:	e12fff1e 	bx	lr
    2bcc:	e13c0000 	teq	ip, r0
    2bd0:	42600000 	rsbmi	r0, r0, #0	; 0x0
    2bd4:	e12fff1e 	bx	lr
    2bd8:	33a00000 	movcc	r0, #0	; 0x0
    2bdc:	01a00fcc 	moveq	r0, ip, asr #31
    2be0:	03800001 	orreq	r0, r0, #1	; 0x1
    2be4:	e12fff1e 	bx	lr
    2be8:	e3510801 	cmp	r1, #65536	; 0x10000
    2bec:	21a01821 	movcs	r1, r1, lsr #16
    2bf0:	23a02010 	movcs	r2, #16	; 0x10
    2bf4:	33a02000 	movcc	r2, #0	; 0x0
    2bf8:	e3510c01 	cmp	r1, #256	; 0x100
    2bfc:	21a01421 	movcs	r1, r1, lsr #8
    2c00:	22822008 	addcs	r2, r2, #8	; 0x8
    2c04:	e3510010 	cmp	r1, #16	; 0x10
    2c08:	21a01221 	movcs	r1, r1, lsr #4
    2c0c:	22822004 	addcs	r2, r2, #4	; 0x4
    2c10:	e3510004 	cmp	r1, #4	; 0x4
    2c14:	82822003 	addhi	r2, r2, #3	; 0x3
    2c18:	908220a1 	addls	r2, r2, r1, lsr #1
    2c1c:	e35c0000 	cmp	ip, #0	; 0x0
    2c20:	e1a00233 	mov	r0, r3, lsr r2
    2c24:	42600000 	rsbmi	r0, r0, #0	; 0x0
    2c28:	e12fff1e 	bx	lr
    2c2c:	e52de008 	str	lr, [sp, #-8]!
    2c30:	eb000007 	bl	2c54 <__aeabi_idiv0>
    2c34:	e3a00000 	mov	r0, #0	; 0x0
    2c38:	e49df008 	ldr	pc, [sp], #8

00002c3c <__aeabi_idivmod>:
    2c3c:	e92d4003 	stmdb	sp!, {r0, r1, lr}
    2c40:	ebffffb3 	bl	2b14 <__aeabi_idiv>
    2c44:	e8bd4006 	ldmia	sp!, {r1, r2, lr}
    2c48:	e0030092 	mul	r3, r2, r0
    2c4c:	e0411003 	sub	r1, r1, r3
    2c50:	e12fff1e 	bx	lr

00002c54 <__aeabi_idiv0>:
    2c54:	e12fff1e 	bx	lr
