glabel menu_options_loop
/* 084F5C 8008435C 3C038012 */  lui   $v1, %hi(D_801263BC) # $v1, 0x8012
/* 084F60 80084360 246363BC */  addiu $v1, %lo(D_801263BC) # addiu $v1, $v1, 0x63bc
/* 084F64 80084364 8C6E0000 */  lw    $t6, ($v1)
/* 084F68 80084368 3C09800E */  lui   $t1, %hi(D_800DF47C) # $t1, 0x800e
/* 084F6C 8008436C 2529F47C */  addiu $t1, %lo(D_800DF47C) # addiu $t1, $t1, -0xb84
/* 084F70 80084370 8D220000 */  lw    $v0, ($t1)
/* 084F74 80084374 01C47821 */  addu  $t7, $t6, $a0
/* 084F78 80084378 27BDFFB8 */  addiu $sp, $sp, -0x48
/* 084F7C 8008437C 31F8003F */  andi  $t8, $t7, 0x3f
/* 084F80 80084380 AFBF0014 */  sw    $ra, 0x14($sp)
/* 084F84 80084384 10400009 */  beqz  $v0, .L800843AC
/* 084F88 80084388 AC780000 */   sw    $t8, ($v1)
/* 084F8C 8008438C 18400005 */  blez  $v0, .L800843A4
/* 084F90 80084390 00445023 */   subu  $t2, $v0, $a0
/* 084F94 80084394 0044C821 */  addu  $t9, $v0, $a0
/* 084F98 80084398 AD390000 */  sw    $t9, ($t1)
/* 084F9C 8008439C 10000003 */  b     .L800843AC
/* 084FA0 800843A0 03201025 */   move  $v0, $t9
.L800843A4:
/* 084FA4 800843A4 AD2A0000 */  sw    $t2, ($t1)
/* 084FA8 800843A8 01401025 */  move  $v0, $t2
.L800843AC:
/* 084FAC 800843AC 2841FFED */  slti  $at, $v0, -0x13
/* 084FB0 800843B0 14200007 */  bnez  $at, .L800843D0
/* 084FB4 800843B4 28410023 */   slti  $at, $v0, 0x23
/* 084FB8 800843B8 10200005 */  beqz  $at, .L800843D0
/* 084FBC 800843BC 00000000 */   nop   
/* 084FC0 800843C0 0C02106E */  jal   func_800841B8
/* 084FC4 800843C4 00000000 */   nop   
/* 084FC8 800843C8 3C09800E */  lui   $t1, %hi(D_800DF47C) # $t1, 0x800e
/* 084FCC 800843CC 2529F47C */  addiu $t1, %lo(D_800DF47C) # addiu $t1, $t1, -0xb84
.L800843D0:
/* 084FD0 800843D0 3C0B8012 */  lui   $t3, %hi(D_801263C4) # $t3, 0x8012
/* 084FD4 800843D4 8D6B63C4 */  lw    $t3, %lo(D_801263C4)($t3)
/* 084FD8 800843D8 00003025 */  move  $a2, $zero
/* 084FDC 800843DC 00003825 */  move  $a3, $zero
/* 084FE0 800843E0 15600021 */  bnez  $t3, .L80084468
/* 084FE4 800843E4 00004025 */   move  $t0, $zero
/* 084FE8 800843E8 8D2C0000 */  lw    $t4, ($t1)
/* 084FEC 800843EC 00002025 */  move  $a0, $zero
/* 084FF0 800843F0 1580001D */  bnez  $t4, .L80084468
/* 084FF4 800843F4 3C038012 */   lui   $v1, %hi(D_8012645C) # $v1, 0x8012
/* 084FF8 800843F8 3C058012 */  lui   $a1, %hi(D_80126464) # $a1, 0x8012
/* 084FFC 800843FC 24A56464 */  addiu $a1, %lo(D_80126464) # addiu $a1, $a1, 0x6464
/* 085000 80084400 2463645C */  addiu $v1, %lo(D_8012645C) # addiu $v1, $v1, 0x645c
.L80084404:
/* 085004 80084404 AFA30020 */  sw    $v1, 0x20($sp)
/* 085008 80084408 AFA40040 */  sw    $a0, 0x40($sp)
/* 08500C 8008440C AFA5001C */  sw    $a1, 0x1c($sp)
/* 085010 80084410 AFA60044 */  sw    $a2, 0x44($sp)
/* 085014 80084414 AFA70038 */  sw    $a3, 0x38($sp)
/* 085018 80084418 0C01A955 */  jal   func_8006A554
/* 08501C 8008441C AFA80034 */   sw    $t0, 0x34($sp)
/* 085020 80084420 8FA30020 */  lw    $v1, 0x20($sp)
/* 085024 80084424 8FA5001C */  lw    $a1, 0x1c($sp)
/* 085028 80084428 8FA40040 */  lw    $a0, 0x40($sp)
/* 08502C 8008442C 8FA60044 */  lw    $a2, 0x44($sp)
/* 085030 80084430 8FA70038 */  lw    $a3, 0x38($sp)
/* 085034 80084434 8FA80034 */  lw    $t0, 0x34($sp)
/* 085038 80084438 806D0000 */  lb    $t5, ($v1)
/* 08503C 8008443C 80AE0000 */  lb    $t6, ($a1)
/* 085040 80084440 24010004 */  li    $at, 4
/* 085044 80084444 24840001 */  addiu $a0, $a0, 1
/* 085048 80084448 24630001 */  addiu $v1, $v1, 1
/* 08504C 8008444C 24A50001 */  addiu $a1, $a1, 1
/* 085050 80084450 00C23025 */  or    $a2, $a2, $v0
/* 085054 80084454 00ED3821 */  addu  $a3, $a3, $t5
/* 085058 80084458 1481FFEA */  bne   $a0, $at, .L80084404
/* 08505C 8008445C 010E4021 */   addu  $t0, $t0, $t6
/* 085060 80084460 3C09800E */  lui   $t1, %hi(D_800DF47C) # $t1, 0x800e
/* 085064 80084464 2529F47C */  addiu $t1, %lo(D_800DF47C) # addiu $t1, $t1, -0xb84
.L80084468:
/* 085068 80084468 30CF4000 */  andi  $t7, $a2, 0x4000
/* 08506C 8008446C 15E00008 */  bnez  $t7, .L80084490
/* 085070 80084470 30C39000 */   andi  $v1, $a2, 0x9000
/* 085074 80084474 10600016 */  beqz  $v1, .L800844D0
/* 085078 80084478 3C06800E */   lui   $a2, %hi(D_800DF460) # $a2, 0x800e
/* 08507C 8008447C 24C6F460 */  addiu $a2, %lo(D_800DF460) # addiu $a2, $a2, -0xba0
/* 085080 80084480 8CD80000 */  lw    $t8, ($a2)
/* 085084 80084484 24010005 */  li    $at, 5
/* 085088 80084488 17010011 */  bne   $t8, $at, .L800844D0
/* 08508C 8008448C 00000000 */   nop   
.L80084490:
/* 085090 80084490 0C000326 */  jal   func_80000C98
/* 085094 80084494 2404FF80 */   li    $a0, -128
/* 085098 80084498 2419FFFF */  li    $t9, -1
/* 08509C 8008449C 3C01800E */  lui   $at, %hi(D_800DF47C) # $at, 0x800e
/* 0850A0 800844A0 3C04800E */  lui   $a0, %hi(D_800DF774) # $a0, 0x800e
/* 0850A4 800844A4 AC39F47C */  sw    $t9, %lo(D_800DF47C)($at)
/* 0850A8 800844A8 0C030076 */  jal   func_800C01D8
/* 0850AC 800844AC 2484F774 */   addiu $a0, %lo(D_800DF774) # addiu $a0, $a0, -0x88c
/* 0850B0 800844B0 24040241 */  li    $a0, 577
/* 0850B4 800844B4 0C000741 */  jal   func_80001D04
/* 0850B8 800844B8 00002825 */   move  $a1, $zero
/* 0850BC 800844BC 3C09800E */  lui   $t1, %hi(D_800DF47C) # $t1, 0x800e
/* 0850C0 800844C0 3C06800E */  lui   $a2, %hi(D_800DF460) # $a2, 0x800e
/* 0850C4 800844C4 24C6F460 */  addiu $a2, %lo(D_800DF460) # addiu $a2, $a2, -0xba0
/* 0850C8 800844C8 1000006B */  b     .L80084678
/* 0850CC 800844CC 2529F47C */   addiu $t1, %lo(D_800DF47C) # addiu $t1, $t1, -0xb84
.L800844D0:
/* 0850D0 800844D0 3C06800E */  lui   $a2, %hi(D_800DF460) # $a2, 0x800e
/* 0850D4 800844D4 24C6F460 */  addiu $a2, %lo(D_800DF460) # addiu $a2, $a2, -0xba0
/* 0850D8 800844D8 8CC20000 */  lw    $v0, ($a2)
/* 0850DC 800844DC 1060000C */  beqz  $v1, .L80084510
/* 0850E0 800844E0 28410002 */   slti  $at, $v0, 2
/* 0850E4 800844E4 1420000A */  bnez  $at, .L80084510
/* 0850E8 800844E8 240A001F */   li    $t2, 31
/* 0850EC 800844EC AD2A0000 */  sw    $t2, ($t1)
/* 0850F0 800844F0 240400EF */  li    $a0, 239
/* 0850F4 800844F4 0C000741 */  jal   func_80001D04
/* 0850F8 800844F8 00002825 */   move  $a1, $zero
/* 0850FC 800844FC 3C09800E */  lui   $t1, %hi(D_800DF47C) # $t1, 0x800e
/* 085100 80084500 3C06800E */  lui   $a2, %hi(D_800DF460) # $a2, 0x800e
/* 085104 80084504 24C6F460 */  addiu $a2, %lo(D_800DF460) # addiu $a2, $a2, -0xba0
/* 085108 80084508 1000005B */  b     .L80084678
/* 08510C 8008450C 2529F47C */   addiu $t1, %lo(D_800DF47C) # addiu $t1, $t1, -0xb84
.L80084510:
/* 085110 80084510 14400018 */  bnez  $v0, .L80084574
/* 085114 80084514 24010001 */   li    $at, 1
/* 085118 80084518 10E00016 */  beqz  $a3, .L80084574
/* 08511C 8008451C 00000000 */   nop   
/* 085120 80084520 0C027AC8 */  jal   get_language
/* 085124 80084524 00000000 */   nop   
/* 085128 80084528 000267C3 */  sra   $t4, $v0, 0x1f
/* 08512C 8008452C 15800007 */  bnez  $t4, .L8008454C
/* 085130 80084530 00000000 */   nop   
/* 085134 80084534 14400005 */  bnez  $v0, .L8008454C
/* 085138 80084538 00000000 */   nop   
/* 08513C 8008453C 0C027AE5 */  jal   set_language
/* 085140 80084540 24040002 */   li    $a0, 2
/* 085144 80084544 10000004 */  b     .L80084558
/* 085148 80084548 240400EB */   li    $a0, 235
.L8008454C:
/* 08514C 8008454C 0C027AE5 */  jal   set_language
/* 085150 80084550 00002025 */   move  $a0, $zero
/* 085154 80084554 240400EB */  li    $a0, 235
.L80084558:
/* 085158 80084558 0C000741 */  jal   func_80001D04
/* 08515C 8008455C 00002825 */   move  $a1, $zero
/* 085160 80084560 3C09800E */  lui   $t1, %hi(D_800DF47C) # $t1, 0x800e
/* 085164 80084564 3C06800E */  lui   $a2, %hi(D_800DF460) # $a2, 0x800e
/* 085168 80084568 24C6F460 */  addiu $a2, %lo(D_800DF460) # addiu $a2, $a2, -0xba0
/* 08516C 8008456C 10000042 */  b     .L80084678
/* 085170 80084570 2529F47C */   addiu $t1, %lo(D_800DF47C) # addiu $t1, $t1, -0xb84
.L80084574:
/* 085174 80084574 14410028 */  bne   $v0, $at, .L80084618
/* 085178 80084578 00000000 */   nop   
/* 08517C 8008457C 10E00026 */  beqz  $a3, .L80084618
/* 085180 80084580 3C0F8012 */   lui   $t7, %hi(D_80126448+4) # $t7, 0x8012
/* 085184 80084584 8DEF644C */  lw    $t7, %lo(D_80126448+4)($t7)
/* 085188 80084588 3C010200 */  lui   $at, 0x200
/* 08518C 8008458C 01E1C824 */  and   $t9, $t7, $at
/* 085190 80084590 1320000F */  beqz  $t9, .L800845D0
/* 085194 80084594 240400EB */   li    $a0, 235
/* 085198 80084598 240400EB */  li    $a0, 235
/* 08519C 8008459C 0C000741 */  jal   func_80001D04
/* 0851A0 800845A0 00002825 */   move  $a1, $zero
/* 0851A4 800845A4 24040000 */  li    $a0, 0
/* 0851A8 800845A8 0C027AAF */  jal   func_8009EABC
/* 0851AC 800845AC 3C050200 */   lui   $a1, 0x200
/* 0851B0 800845B0 0C030ABD */  jal   func_800C2AF4
/* 0851B4 800845B4 00002025 */   move  $a0, $zero
/* 0851B8 800845B8 3C0B800E */  lui   $t3, %hi(D_800DF4A0) # $t3, 0x800e
/* 0851BC 800845BC 8D6BF4A0 */  lw    $t3, %lo(D_800DF4A0)($t3)
/* 0851C0 800845C0 3C01800E */  lui   $at, %hi(D_800DFA10+4) # $at, 0x800e
/* 0851C4 800845C4 8D6A02DC */  lw    $t2, 0x2dc($t3)
/* 0851C8 800845C8 1000000E */  b     .L80084604
/* 0851CC 800845CC AC2AFA14 */   sw    $t2, %lo(D_800DFA10+4)($at)
.L800845D0:
/* 0851D0 800845D0 0C000741 */  jal   func_80001D04
/* 0851D4 800845D4 00002825 */   move  $a1, $zero
/* 0851D8 800845D8 24040000 */  li    $a0, 0
/* 0851DC 800845DC 0C027A9E */  jal   func_8009EA78
/* 0851E0 800845E0 3C050200 */   lui   $a1, 0x200
/* 0851E4 800845E4 0C030ABD */  jal   func_800C2AF4
/* 0851E8 800845E8 24040001 */   li    $a0, 1
/* 0851EC 800845EC 3C0C800E */  lui   $t4, %hi(D_800DF4A0) # $t4, 0x800e
/* 0851F0 800845F0 8D8CF4A0 */  lw    $t4, %lo(D_800DF4A0)($t4)
/* 0851F4 800845F4 3C01800E */  lui   $at, %hi(D_800DFA10+4) # $at, 0x800e
/* 0851F8 800845F8 8D8D02D8 */  lw    $t5, 0x2d8($t4)
/* 0851FC 800845FC 00000000 */  nop   
/* 085200 80084600 AC2DFA14 */  sw    $t5, %lo(D_800DFA10+4)($at)
.L80084604:
/* 085204 80084604 3C09800E */  lui   $t1, %hi(D_800DF47C) # $t1, 0x800e
/* 085208 80084608 3C06800E */  lui   $a2, %hi(D_800DF460) # $a2, 0x800e
/* 08520C 8008460C 24C6F460 */  addiu $a2, %lo(D_800DF460) # addiu $a2, $a2, -0xba0
/* 085210 80084610 10000019 */  b     .L80084678
/* 085214 80084614 2529F47C */   addiu $t1, %lo(D_800DF47C) # addiu $t1, $t1, -0xb84
.L80084618:
/* 085218 80084618 05010008 */  bgez  $t0, .L8008463C
/* 08521C 8008461C 00401825 */   move  $v1, $v0
/* 085220 80084620 244E0001 */  addiu $t6, $v0, 1
/* 085224 80084624 29C10006 */  slti  $at, $t6, 6
/* 085228 80084628 ACCE0000 */  sw    $t6, ($a2)
/* 08522C 8008462C 14200003 */  bnez  $at, .L8008463C
/* 085230 80084630 01C01025 */   move  $v0, $t6
/* 085234 80084634 24020005 */  li    $v0, 5
/* 085238 80084638 ACC20000 */  sw    $v0, ($a2)
.L8008463C:
/* 08523C 8008463C 19000006 */  blez  $t0, .L80084658
/* 085240 80084640 2458FFFF */   addiu $t8, $v0, -1
/* 085244 80084644 ACD80000 */  sw    $t8, ($a2)
/* 085248 80084648 07010003 */  bgez  $t8, .L80084658
/* 08524C 8008464C 03001025 */   move  $v0, $t8
/* 085250 80084650 ACC00000 */  sw    $zero, ($a2)
/* 085254 80084654 00001025 */  move  $v0, $zero
.L80084658:
/* 085258 80084658 10620007 */  beq   $v1, $v0, .L80084678
/* 08525C 8008465C 240400EB */   li    $a0, 235
/* 085260 80084660 0C000741 */  jal   func_80001D04
/* 085264 80084664 00002825 */   move  $a1, $zero
/* 085268 80084668 3C09800E */  lui   $t1, %hi(D_800DF47C) # $t1, 0x800e
/* 08526C 8008466C 3C06800E */  lui   $a2, %hi(D_800DF460) # $a2, 0x800e
/* 085270 80084670 24C6F460 */  addiu $a2, %lo(D_800DF460) # addiu $a2, $a2, -0xba0
/* 085274 80084674 2529F47C */  addiu $t1, %lo(D_800DF47C) # addiu $t1, $t1, -0xb84
.L80084678:
/* 085278 80084678 8D220000 */  lw    $v0, ($t1)
/* 08527C 8008467C 00000000 */  nop   
/* 085280 80084680 2841001F */  slti  $at, $v0, 0x1f
/* 085284 80084684 1420001B */  bnez  $at, .L800846F4
/* 085288 80084688 2841FFE2 */   slti  $at, $v0, -0x1e
/* 08528C 8008468C 8CC20000 */  lw    $v0, ($a2)
/* 085290 80084690 24010002 */  li    $at, 2
/* 085294 80084694 14410008 */  bne   $v0, $at, .L800846B8
/* 085298 80084698 24010003 */   li    $at, 3
/* 08529C 8008469C 0C0211CD */  jal   func_80084734
/* 0852A0 800846A0 00000000 */   nop   
/* 0852A4 800846A4 0C0204F4 */  jal   menu_init
/* 0852A8 800846A8 2404000D */   li    $a0, 13
/* 0852AC 800846AC 1000001D */  b     .L80084724
/* 0852B0 800846B0 00001025 */   move  $v0, $zero
/* 0852B4 800846B4 24010003 */  li    $at, 3
.L800846B8:
/* 0852B8 800846B8 14410007 */  bne   $v0, $at, .L800846D8
/* 0852BC 800846BC 00000000 */   nop   
/* 0852C0 800846C0 0C0211CD */  jal   func_80084734
/* 0852C4 800846C4 00000000 */   nop   
/* 0852C8 800846C8 0C0204F4 */  jal   menu_init
/* 0852CC 800846CC 2404000E */   li    $a0, 14
/* 0852D0 800846D0 10000014 */  b     .L80084724
/* 0852D4 800846D4 00001025 */   move  $v0, $zero
.L800846D8:
/* 0852D8 800846D8 0C0211CD */  jal   func_80084734
/* 0852DC 800846DC 00000000 */   nop   
/* 0852E0 800846E0 0C0204F4 */  jal   menu_init
/* 0852E4 800846E4 2404000A */   li    $a0, 10
/* 0852E8 800846E8 1000000E */  b     .L80084724
/* 0852EC 800846EC 00001025 */   move  $v0, $zero
/* 0852F0 800846F0 2841FFE2 */  slti  $at, $v0, -0x1e
.L800846F4:
/* 0852F4 800846F4 10200009 */  beqz  $at, .L8008471C
/* 0852F8 800846F8 00001025 */   move  $v0, $zero
/* 0852FC 800846FC 0C0002CA */  jal   func_80000B28
/* 085300 80084700 00000000 */   nop   
/* 085304 80084704 0C0211CD */  jal   func_80084734
/* 085308 80084708 00000000 */   nop   
/* 08530C 8008470C 0C0204F4 */  jal   menu_init
/* 085310 80084710 00002025 */   move  $a0, $zero
/* 085314 80084714 10000003 */  b     .L80084724
/* 085318 80084718 00001025 */   move  $v0, $zero
.L8008471C:
/* 08531C 8008471C 3C018012 */  lui   $at, %hi(D_801263C4) # $at, 0x8012
/* 085320 80084720 AC2063C4 */  sw    $zero, %lo(D_801263C4)($at)
.L80084724:
/* 085324 80084724 8FBF0014 */  lw    $ra, 0x14($sp)
/* 085328 80084728 27BD0048 */  addiu $sp, $sp, 0x48
/* 08532C 8008472C 03E00008 */  jr    $ra
/* 085330 80084730 00000000 */   nop   

