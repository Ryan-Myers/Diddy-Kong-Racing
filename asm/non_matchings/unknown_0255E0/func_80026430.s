.late_rodata
glabel D_800E5E78
.double 300.0
glabel D_800E5E80
.double -300.0
glabel D_800E5E88
.double -300.0

.text
glabel func_80026430
/* 027030 80026430 27BDFEF0 */  addiu $sp, $sp, -0x110
/* 027034 80026434 3C0E8012 */  lui   $t6, %hi(D_8011D49E) # $t6, 0x8012
/* 027038 80026438 3C0F8012 */  lui   $t7, %hi(D_8011D4BA) # $t7, 0x8012
/* 02703C 8002643C 85EFD4BA */  lh    $t7, %lo(D_8011D4BA)($t7)
/* 027040 80026440 85CED49E */  lh    $t6, %lo(D_8011D49E)($t6)
/* 027044 80026444 E7BC003C */  swc1  $f28, 0x3c($sp)
/* 027048 80026448 E7BA0034 */  swc1  $f26, 0x34($sp)
/* 02704C 8002644C E7B8002C */  swc1  $f24, 0x2c($sp)
/* 027050 80026450 4486C000 */  mtc1  $a2, $f24
/* 027054 80026454 4485D000 */  mtc1  $a1, $f26
/* 027058 80026458 4487E000 */  mtc1  $a3, $f28
/* 02705C 8002645C AFB60060 */  sw    $s6, 0x60($sp)
/* 027060 80026460 01CF082A */  slt   $at, $t6, $t7
/* 027064 80026464 0080B025 */  move  $s6, $a0
/* 027068 80026468 AFBF006C */  sw    $ra, 0x6c($sp)
/* 02706C 8002646C AFBE0068 */  sw    $fp, 0x68($sp)
/* 027070 80026470 AFB70064 */  sw    $s7, 0x64($sp)
/* 027074 80026474 AFB5005C */  sw    $s5, 0x5c($sp)
/* 027078 80026478 AFB40058 */  sw    $s4, 0x58($sp)
/* 02707C 8002647C AFB30054 */  sw    $s3, 0x54($sp)
/* 027080 80026480 AFB20050 */  sw    $s2, 0x50($sp)
/* 027084 80026484 AFB1004C */  sw    $s1, 0x4c($sp)
/* 027088 80026488 AFB00048 */  sw    $s0, 0x48($sp)
/* 02708C 8002648C E7BF0040 */  swc1  $f31, 0x40($sp)
/* 027090 80026490 E7BE0044 */  swc1  $f30, 0x44($sp)
/* 027094 80026494 E7BD0038 */  swc1  $f29, 0x38($sp)
/* 027098 80026498 E7BB0030 */  swc1  $f27, 0x30($sp)
/* 02709C 8002649C E7B90028 */  swc1  $f25, 0x28($sp)
/* 0270A0 800264A0 E7B70020 */  swc1  $f23, 0x20($sp)
/* 0270A4 800264A4 E7B60024 */  swc1  $f22, 0x24($sp)
/* 0270A8 800264A8 E7B50018 */  swc1  $f21, 0x18($sp)
/* 0270AC 800264AC 102001C1 */  beqz  $at, .L80026BB4
/* 0270B0 800264B0 E7B4001C */   swc1  $f20, 0x1c($sp)
/* 0270B4 800264B4 A7A0010E */  sh    $zero, 0x10e($sp)
/* 0270B8 800264B8 84840020 */  lh    $a0, 0x20($a0)
/* 0270BC 800264BC 3C01800E */  lui   $at, %hi(D_800E5E78 + 4) # $at, 0x800e
/* 0270C0 800264C0 188001BC */  blez  $a0, .L80026BB4
/* 0270C4 800264C4 27BE00B8 */   addiu $fp, $sp, 0xb8
/* 0270C8 800264C8 C43F5E78 */  lwc1  $f31, %lo(D_800E5E78)($at)
/* 0270CC 800264CC C43E5E7C */  lwc1  $f30, %lo(D_800E5E78 + 4)($at)
/* 0270D0 800264D0 4480A800 */  mtc1  $zero, $f21
/* 0270D4 800264D4 4480A000 */  mtc1  $zero, $f20
/* 0270D8 800264D8 27B500D0 */  addiu $s5, $sp, 0xd0
/* 0270DC 800264DC 27B400DC */  addiu $s4, $sp, 0xdc
/* 0270E0 800264E0 27B300E8 */  addiu $s3, $sp, 0xe8
/* 0270E4 800264E4 27B200F8 */  addiu $s2, $sp, 0xf8
/* 0270E8 800264E8 27B100C4 */  addiu $s1, $sp, 0xc4
/* 0270EC 800264EC 241F0001 */  li    $ra, 1
/* 0270F0 800264F0 27AD00A8 */  addiu $t5, $sp, 0xa8
/* 0270F4 800264F4 27AC00A0 */  addiu $t4, $sp, 0xa0
/* 0270F8 800264F8 27AB00B0 */  addiu $t3, $sp, 0xb0
/* 0270FC 800264FC 240A000A */  li    $t2, 10
.L80026500:
/* 027100 80026500 87B9010E */  lh    $t9, 0x10e($sp)
/* 027104 80026504 8ED8000C */  lw    $t8, 0xc($s6)
/* 027108 80026508 00197080 */  sll   $t6, $t9, 2
/* 02710C 8002650C 01D97023 */  subu  $t6, $t6, $t9
/* 027110 80026510 000E7080 */  sll   $t6, $t6, 2
/* 027114 80026514 030E1021 */  addu  $v0, $t8, $t6
/* 027118 80026518 844F0010 */  lh    $t7, 0x10($v0)
/* 02711C 8002651C 84430004 */  lh    $v1, 4($v0)
/* 027120 80026520 84490002 */  lh    $t1, 2($v0)
/* 027124 80026524 A7AF0108 */  sh    $t7, 0x108($sp)
/* 027128 80026528 8C590008 */  lw    $t9, 8($v0)
/* 02712C 8002652C 87AF0108 */  lh    $t7, 0x108($sp)
/* 027130 80026530 33380300 */  andi  $t8, $t9, 0x300
/* 027134 80026534 13000004 */  beqz  $t8, .L80026548
/* 027138 80026538 0003BC00 */   sll   $s7, $v1, 0x10
/* 02713C 8002653C 87A30108 */  lh    $v1, 0x108($sp)
/* 027140 80026540 00000000 */  nop   
/* 027144 80026544 0003BC00 */  sll   $s7, $v1, 0x10
.L80026548:
/* 027148 80026548 00177403 */  sra   $t6, $s7, 0x10
/* 02714C 8002654C 006F082A */  slt   $at, $v1, $t7
/* 027150 80026550 10200190 */  beqz  $at, .L80026B94
/* 027154 80026554 01C0B825 */   move  $s7, $t6
.L80026558:
/* 027158 80026558 8ED90004 */  lw    $t9, 4($s6)
/* 02715C 8002655C 0017C100 */  sll   $t8, $s7, 4
/* 027160 80026560 03387021 */  addu  $t6, $t9, $t8
/* 027164 80026564 91CF0000 */  lbu   $t7, ($t6)
/* 027168 80026568 00004025 */  move  $t0, $zero
/* 02716C 8002656C 31F90040 */  andi  $t9, $t7, 0x40
/* 027170 80026570 1720017F */  bnez  $t9, .L80026B70
/* 027174 80026574 00003825 */   move  $a3, $zero
.L80026578:
/* 027178 80026578 8ED80004 */  lw    $t8, 4($s6)
/* 02717C 8002657C 00177100 */  sll   $t6, $s7, 4
/* 027180 80026580 030E7821 */  addu  $t7, $t8, $t6
/* 027184 80026584 01E7C821 */  addu  $t9, $t7, $a3
/* 027188 80026588 93380001 */  lbu   $t8, 1($t9)
/* 02718C 8002658C 8ED90000 */  lw    $t9, ($s6)
/* 027190 80026590 03097021 */  addu  $t6, $t8, $t1
/* 027194 80026594 01CA0019 */  multu $t6, $t2
/* 027198 80026598 00071080 */  sll   $v0, $a3, 2
/* 02719C 8002659C 02622021 */  addu  $a0, $s3, $v0
/* 0271A0 800265A0 02A22821 */  addu  $a1, $s5, $v0
/* 0271A4 800265A4 02473021 */  addu  $a2, $s2, $a3
/* 0271A8 800265A8 24E70001 */  addiu $a3, $a3, 1
/* 0271AC 800265AC 00007812 */  mflo  $t7
/* 0271B0 800265B0 01F91821 */  addu  $v1, $t7, $t9
/* 0271B4 800265B4 84780000 */  lh    $t8, ($v1)
/* 0271B8 800265B8 02827821 */  addu  $t7, $s4, $v0
/* 0271BC 800265BC 44982000 */  mtc1  $t8, $f4
/* 0271C0 800265C0 0222C021 */  addu  $t8, $s1, $v0
/* 0271C4 800265C4 468021A0 */  cvt.s.w $f6, $f4
/* 0271C8 800265C8 E4860000 */  swc1  $f6, ($a0)
/* 0271CC 800265CC 846E0002 */  lh    $t6, 2($v1)
/* 0271D0 800265D0 00000000 */  nop   
/* 0271D4 800265D4 448E4000 */  mtc1  $t6, $f8
/* 0271D8 800265D8 00007025 */  move  $t6, $zero
/* 0271DC 800265DC 468042A0 */  cvt.s.w $f10, $f8
/* 0271E0 800265E0 E5EA0000 */  swc1  $f10, ($t7)
/* 0271E4 800265E4 84790004 */  lh    $t9, 4($v1)
/* 0271E8 800265E8 00000000 */  nop   
/* 0271EC 800265EC 44992000 */  mtc1  $t9, $f4
/* 0271F0 800265F0 00000000 */  nop   
/* 0271F4 800265F4 468021A0 */  cvt.s.w $f6, $f4
/* 0271F8 800265F8 C4840000 */  lwc1  $f4, ($a0)
/* 0271FC 800265FC E4A60000 */  swc1  $f6, ($a1)
/* 027200 80026600 C4A80000 */  lwc1  $f8, ($a1)
/* 027204 80026604 00000000 */  nop   
/* 027208 80026608 46184282 */  mul.s $f10, $f8, $f24
/* 02720C 8002660C 00000000 */  nop   
/* 027210 80026610 4604D182 */  mul.s $f6, $f26, $f4
/* 027214 80026614 46065200 */  add.s $f8, $f10, $f6
/* 027218 80026618 461C4000 */  add.s $f0, $f8, $f28
/* 02721C 8002661C 46000121 */  cvt.d.s $f4, $f0
/* 027220 80026620 4634203E */  c.le.d $f4, $f20
/* 027224 80026624 E7000000 */  swc1  $f0, ($t8)
/* 027228 80026628 45000002 */  bc1f  .L80026634
/* 02722C 8002662C 00000000 */   nop   
/* 027230 80026630 240E0001 */  li    $t6, 1
.L80026634:
/* 027234 80026634 A0CE0000 */  sb    $t6, ($a2)
/* 027238 80026638 80CF0000 */  lb    $t7, ($a2)
/* 02723C 8002663C 0000C825 */  move  $t9, $zero
/* 027240 80026640 448F5000 */  mtc1  $t7, $f10
/* 027244 80026644 00077C00 */  sll   $t7, $a3, 0x10
/* 027248 80026648 468051A1 */  cvt.d.w $f6, $f10
/* 02724C 8002664C 000F3C03 */  sra   $a3, $t7, 0x10
/* 027250 80026650 28E10003 */  slti  $at, $a3, 3
/* 027254 80026654 4634303E */  c.le.d $f6, $f20
/* 027258 80026658 00000000 */  nop   
/* 02725C 8002665C 45000002 */  bc1f  .L80026668
/* 027260 80026660 00000000 */   nop   
/* 027264 80026664 24190001 */  li    $t9, 1
.L80026668:
/* 027268 80026668 01194021 */  addu  $t0, $t0, $t9
/* 02726C 8002666C 0008C400 */  sll   $t8, $t0, 0x10
/* 027270 80026670 00187403 */  sra   $t6, $t8, 0x10
/* 027274 80026674 1420FFC0 */  bnez  $at, .L80026578
/* 027278 80026678 01C04025 */   move  $t0, $t6
/* 02727C 8002667C 11DF0002 */  beq   $t6, $ra, .L80026688
/* 027280 80026680 24010002 */   li    $at, 2
/* 027284 80026684 15C1013A */  bne   $t6, $at, .L80026B70
.L80026688:
/* 027288 80026688 3C018012 */   lui   $at, %hi(D_8011D4A4) # $at, 0x8012
/* 02728C 8002668C C428D4A4 */  lwc1  $f8, %lo(D_8011D4A4)($at)
/* 027290 80026690 3C018012 */  lui   $at, %hi(D_8011D4A0) # $at, 0x8012
/* 027294 80026694 C424D4A0 */  lwc1  $f4, %lo(D_8011D4A0)($at)
/* 027298 80026698 3C018012 */  lui   $at, %hi(D_8011D4A8) # $at, 0x8012
/* 02729C 8002669C C436D4A8 */  lwc1  $f22, %lo(D_8011D4A8)($at)
/* 0272A0 800266A0 00008025 */  move  $s0, $zero
/* 0272A4 800266A4 00003825 */  move  $a3, $zero
/* 0272A8 800266A8 E7A80098 */  swc1  $f8, 0x98($sp)
/* 0272AC 800266AC E7A40094 */  swc1  $f4, 0x94($sp)
.L800266B0:
/* 0272B0 800266B0 24E60001 */  addiu $a2, $a3, 1
/* 0272B4 800266B4 00067400 */  sll   $t6, $a2, 0x10
/* 0272B8 800266B8 00062C00 */  sll   $a1, $a2, 0x10
/* 0272BC 800266BC 000E7C03 */  sra   $t7, $t6, 0x10
/* 0272C0 800266C0 0005C403 */  sra   $t8, $a1, 0x10
/* 0272C4 800266C4 29E10003 */  slti  $at, $t7, 3
/* 0272C8 800266C8 14200002 */  bnez  $at, .L800266D4
/* 0272CC 800266CC 03002825 */   move  $a1, $t8
/* 0272D0 800266D0 00002825 */  move  $a1, $zero
.L800266D4:
/* 0272D4 800266D4 0245C821 */  addu  $t9, $s2, $a1
/* 0272D8 800266D8 02477021 */  addu  $t6, $s2, $a3
/* 0272DC 800266DC 81CF0000 */  lb    $t7, ($t6)
/* 0272E0 800266E0 83380000 */  lb    $t8, ($t9)
/* 0272E4 800266E4 00071080 */  sll   $v0, $a3, 2
/* 0272E8 800266E8 130F0028 */  beq   $t8, $t7, .L8002678C
/* 0272EC 800266EC 02227021 */   addu  $t6, $s1, $v0
/* 0272F0 800266F0 00051880 */  sll   $v1, $a1, 2
/* 0272F4 800266F4 0223C021 */  addu  $t8, $s1, $v1
/* 0272F8 800266F8 C70A0000 */  lwc1  $f10, ($t8)
/* 0272FC 800266FC C5D20000 */  lwc1  $f18, ($t6)
/* 027300 80026700 0263C821 */  addu  $t9, $s3, $v1
/* 027304 80026704 460A9181 */  sub.s $f6, $f18, $f10
/* 027308 80026708 02627821 */  addu  $t7, $s3, $v0
/* 02730C 8002670C 46069403 */  div.s $f16, $f18, $f6
/* 027310 80026710 C5E20000 */  lwc1  $f2, ($t7)
/* 027314 80026714 C7280000 */  lwc1  $f8, ($t9)
/* 027318 80026718 00102080 */  sll   $a0, $s0, 2
/* 02731C 8002671C 46024101 */  sub.s $f4, $f8, $f2
/* 027320 80026720 01647021 */  addu  $t6, $t3, $a0
/* 027324 80026724 02837821 */  addu  $t7, $s4, $v1
/* 027328 80026728 0282C021 */  addu  $t8, $s4, $v0
/* 02732C 8002672C 03C4C821 */  addu  $t9, $fp, $a0
/* 027330 80026730 26100001 */  addiu $s0, $s0, 1
/* 027334 80026734 46102282 */  mul.s $f10, $f4, $f16
/* 027338 80026738 46025180 */  add.s $f6, $f10, $f2
/* 02733C 8002673C E5C60000 */  swc1  $f6, ($t6)
/* 027340 80026740 C5E80000 */  lwc1  $f8, ($t7)
/* 027344 80026744 C70C0000 */  lwc1  $f12, ($t8)
/* 027348 80026748 01847021 */  addu  $t6, $t4, $a0
/* 02734C 8002674C 460C4101 */  sub.s $f4, $f8, $f12
/* 027350 80026750 02A2C021 */  addu  $t8, $s5, $v0
/* 027354 80026754 46102282 */  mul.s $f10, $f4, $f16
/* 027358 80026758 02A37821 */  addu  $t7, $s5, $v1
/* 02735C 8002675C 460C5380 */  add.s $f14, $f10, $f12
/* 027360 80026760 E72E0000 */  swc1  $f14, ($t9)
/* 027364 80026764 E5CE0000 */  swc1  $f14, ($t6)
/* 027368 80026768 C5E60000 */  lwc1  $f6, ($t7)
/* 02736C 8002676C C7000000 */  lwc1  $f0, ($t8)
/* 027370 80026770 01A4C821 */  addu  $t9, $t5, $a0
/* 027374 80026774 46003201 */  sub.s $f8, $f6, $f0
/* 027378 80026778 00107400 */  sll   $t6, $s0, 0x10
/* 02737C 8002677C 46104102 */  mul.s $f4, $f8, $f16
/* 027380 80026780 000E8403 */  sra   $s0, $t6, 0x10
/* 027384 80026784 46002280 */  add.s $f10, $f4, $f0
/* 027388 80026788 E72A0000 */  swc1  $f10, ($t9)
.L8002678C:
/* 02738C 8002678C 00063C00 */  sll   $a3, $a2, 0x10
/* 027390 80026790 00077C03 */  sra   $t7, $a3, 0x10
/* 027394 80026794 29E10003 */  slti  $at, $t7, 3
/* 027398 80026798 1420FFC5 */  bnez  $at, .L800266B0
/* 02739C 8002679C 01E03825 */   move  $a3, $t7
/* 0273A0 800267A0 C7AE0098 */  lwc1  $f14, 0x98($sp)
/* 0273A4 800267A4 C7A600A8 */  lwc1  $f6, 0xa8($sp)
/* 0273A8 800267A8 C7A00094 */  lwc1  $f0, 0x94($sp)
/* 0273AC 800267AC 460E3202 */  mul.s $f8, $f6, $f14
/* 0273B0 800267B0 C7A400B0 */  lwc1  $f4, 0xb0($sp)
/* 0273B4 800267B4 3C01800E */  lui   $at, %hi(D_800E5E80 + 4) # $at, 0x800e
/* 0273B8 800267B8 00008025 */  move  $s0, $zero
/* 0273BC 800267BC 46040282 */  mul.s $f10, $f0, $f4
/* 0273C0 800267C0 C7A400AC */  lwc1  $f4, 0xac($sp)
/* 0273C4 800267C4 00001025 */  move  $v0, $zero
/* 0273C8 800267C8 00001825 */  move  $v1, $zero
/* 0273CC 800267CC 460A4180 */  add.s $f6, $f8, $f10
/* 0273D0 800267D0 C7AA00B4 */  lwc1  $f10, 0xb4($sp)
/* 0273D4 800267D4 460E2202 */  mul.s $f8, $f4, $f14
/* 0273D8 800267D8 46163080 */  add.s $f2, $f6, $f22
/* 0273DC 800267DC C4295E80 */  lwc1  $f9, %lo(D_800E5E80)($at)
/* 0273E0 800267E0 E7A200C4 */  swc1  $f2, 0xc4($sp)
/* 0273E4 800267E4 460A0182 */  mul.s $f6, $f0, $f10
/* 0273E8 800267E8 C7AA00C4 */  lwc1  $f10, 0xc4($sp)
/* 0273EC 800267EC 46064100 */  add.s $f4, $f8, $f6
/* 0273F0 800267F0 C4285E84 */  lwc1  $f8, %lo(D_800E5E80 + 4)($at)
/* 0273F4 800267F4 46005021 */  cvt.d.s $f0, $f10
/* 0273F8 800267F8 4628003C */  c.lt.d $f0, $f8
/* 0273FC 800267FC 46162300 */  add.s $f12, $f4, $f22
/* 027400 80026800 45000004 */  bc1f  .L80026814
/* 027404 80026804 E7AC00C8 */   swc1  $f12, 0xc8($sp)
/* 027408 80026808 001F1600 */  sll   $v0, $ra, 0x18
/* 02740C 8002680C 0002CE03 */  sra   $t9, $v0, 0x18
/* 027410 80026810 03201025 */  move  $v0, $t9
.L80026814:
/* 027414 80026814 4620F03C */  c.lt.d $f30, $f0
/* 027418 80026818 C7A600C8 */  lwc1  $f6, 0xc8($sp)
/* 02741C 8002681C 45000004 */  bc1f  .L80026830
/* 027420 80026820 3C01800E */   lui   $at, %hi(D_800E5E88 + 4) # $at, 0x800e
/* 027424 80026824 344E0002 */  ori   $t6, $v0, 2
/* 027428 80026828 000EC600 */  sll   $t8, $t6, 0x18
/* 02742C 8002682C 00181603 */  sra   $v0, $t8, 0x18
.L80026830:
/* 027430 80026830 C4255E88 */  lwc1  $f5, %lo(D_800E5E88)($at)
/* 027434 80026834 C4245E8C */  lwc1  $f4, %lo(D_800E5E88 + 4)($at)
/* 027438 80026838 46003021 */  cvt.d.s $f0, $f6
/* 02743C 8002683C 4624003C */  c.lt.d $f0, $f4
/* 027440 80026840 00000000 */  nop   
/* 027444 80026844 45000004 */  bc1f  .L80026858
/* 027448 80026848 00000000 */   nop   
/* 02744C 8002684C 001F1E00 */  sll   $v1, $ra, 0x18
/* 027450 80026850 0003CE03 */  sra   $t9, $v1, 0x18
/* 027454 80026854 03201825 */  move  $v1, $t9
.L80026858:
/* 027458 80026858 4620F03C */  c.lt.d $f30, $f0
/* 02745C 8002685C 346E0002 */  ori   $t6, $v1, 2
/* 027460 80026860 45000002 */  bc1f  .L8002686C
/* 027464 80026864 000EC600 */   sll   $t8, $t6, 0x18
/* 027468 80026868 00181E03 */  sra   $v1, $t8, 0x18
.L8002686C:
/* 02746C 8002686C 0062C825 */  or    $t9, $v1, $v0
/* 027470 80026870 17200007 */  bnez  $t9, .L80026890
/* 027474 80026874 00000000 */   nop   
/* 027478 80026878 001F8400 */  sll   $s0, $ra, 0x10
/* 02747C 8002687C 00107403 */  sra   $t6, $s0, 0x10
/* 027480 80026880 01C08025 */  move  $s0, $t6
/* 027484 80026884 A3A300F9 */  sb    $v1, 0xf9($sp)
/* 027488 80026888 10000050 */  b     .L800269CC
/* 02748C 8002688C A3A200F8 */   sb    $v0, 0xf8($sp)
.L80026890:
/* 027490 80026890 A3A200F8 */  sb    $v0, 0xf8($sp)
/* 027494 80026894 1062004D */  beq   $v1, $v0, .L800269CC
/* 027498 80026898 A3A300F9 */   sb    $v1, 0xf9($sp)
/* 02749C 8002689C C7AA00C8 */  lwc1  $f10, 0xc8($sp)
/* 0274A0 800268A0 C7A800C4 */  lwc1  $f8, 0xc4($sp)
/* 0274A4 800268A4 00003825 */  move  $a3, $zero
/* 0274A8 800268A8 4608503C */  c.lt.s $f10, $f8
/* 0274AC 800268AC 001F8400 */  sll   $s0, $ra, 0x10
/* 0274B0 800268B0 45000005 */  bc1f  .L800268C8
/* 0274B4 800268B4 0247C821 */   addu  $t9, $s2, $a3
/* 0274B8 800268B8 001F3C00 */  sll   $a3, $ra, 0x10
/* 0274BC 800268BC 00077C03 */  sra   $t7, $a3, 0x10
/* 0274C0 800268C0 01E03825 */  move  $a3, $t7
/* 0274C4 800268C4 0247C821 */  addu  $t9, $s2, $a3
.L800268C8:
/* 0274C8 800268C8 832E0000 */  lb    $t6, ($t9)
/* 0274CC 800268CC 00071080 */  sll   $v0, $a3, 2
/* 0274D0 800268D0 17EE001D */  bne   $ra, $t6, .L80026948
/* 0274D4 800268D4 03E73023 */   subu  $a2, $ra, $a3
/* 0274D8 800268D8 03E72823 */  subu  $a1, $ra, $a3
/* 0274DC 800268DC 0005C400 */  sll   $t8, $a1, 0x10
/* 0274E0 800268E0 02221821 */  addu  $v1, $s1, $v0
/* 0274E4 800268E4 C4720000 */  lwc1  $f18, ($v1)
/* 0274E8 800268E8 00187C03 */  sra   $t7, $t8, 0x10
/* 0274EC 800268EC 000FC880 */  sll   $t9, $t7, 2
/* 0274F0 800268F0 02397021 */  addu  $t6, $s1, $t9
/* 0274F4 800268F4 46009187 */  neg.s $f6, $f18
/* 0274F8 800268F8 C5C80000 */  lwc1  $f8, ($t6)
/* 0274FC 800268FC 46003121 */  cvt.d.s $f4, $f6
/* 027500 80026900 463E2281 */  sub.d $f10, $f4, $f30
/* 027504 80026904 03D9C021 */  addu  $t8, $fp, $t9
/* 027508 80026908 46124181 */  sub.s $f6, $f8, $f18
/* 02750C 8002690C 03C22021 */  addu  $a0, $fp, $v0
/* 027510 80026910 46003121 */  cvt.d.s $f4, $f6
/* 027514 80026914 00000000 */  nop   
/* 027518 80026918 46245203 */  div.d $f8, $f10, $f4
/* 02751C 8002691C C7060000 */  lwc1  $f6, ($t8)
/* 027520 80026920 C4800000 */  lwc1  $f0, ($a0)
/* 027524 80026924 3C01C396 */  li    $at, 0xC3960000 # -300.000000
/* 027528 80026928 46003281 */  sub.s $f10, $f6, $f0
/* 02752C 8002692C 44813000 */  mtc1  $at, $f6
/* 027530 80026930 00000000 */  nop   
/* 027534 80026934 E4660000 */  swc1  $f6, ($v1)
/* 027538 80026938 46204420 */  cvt.s.d $f16, $f8
/* 02753C 8002693C 46105102 */  mul.s $f4, $f10, $f16
/* 027540 80026940 46002200 */  add.s $f8, $f4, $f0
/* 027544 80026944 E4880000 */  swc1  $f8, ($a0)
.L80026948:
/* 027548 80026948 00067C00 */  sll   $t7, $a2, 0x10
/* 02754C 8002694C 000FCC03 */  sra   $t9, $t7, 0x10
/* 027550 80026950 02597021 */  addu  $t6, $s2, $t9
/* 027554 80026954 81D80000 */  lb    $t8, ($t6)
/* 027558 80026958 24010002 */  li    $at, 2
/* 02755C 8002695C 1701001A */  bne   $t8, $at, .L800269C8
/* 027560 80026960 00107403 */   sra   $t6, $s0, 0x10
/* 027564 80026964 00192880 */  sll   $a1, $t9, 2
/* 027568 80026968 02251821 */  addu  $v1, $s1, $a1
/* 02756C 8002696C 00071080 */  sll   $v0, $a3, 2
/* 027570 80026970 C4600000 */  lwc1  $f0, ($v1)
/* 027574 80026974 02227821 */  addu  $t7, $s1, $v0
/* 027578 80026978 C5E80000 */  lwc1  $f8, ($t7)
/* 02757C 8002697C 460002A1 */  cvt.d.s $f10, $f0
/* 027580 80026980 463E5101 */  sub.d $f4, $f10, $f30
/* 027584 80026984 03C2C821 */  addu  $t9, $fp, $v0
/* 027588 80026988 46080181 */  sub.s $f6, $f0, $f8
/* 02758C 8002698C 03C52021 */  addu  $a0, $fp, $a1
/* 027590 80026990 460032A1 */  cvt.d.s $f10, $f6
/* 027594 80026994 00000000 */  nop   
/* 027598 80026998 462A2203 */  div.d $f8, $f4, $f10
/* 02759C 8002699C C7260000 */  lwc1  $f6, ($t9)
/* 0275A0 800269A0 C4820000 */  lwc1  $f2, ($a0)
/* 0275A4 800269A4 3C014396 */  li    $at, 0x43960000 # 300.000000
/* 0275A8 800269A8 46023101 */  sub.s $f4, $f6, $f2
/* 0275AC 800269AC 44813000 */  mtc1  $at, $f6
/* 0275B0 800269B0 00000000 */  nop   
/* 0275B4 800269B4 E4660000 */  swc1  $f6, ($v1)
/* 0275B8 800269B8 46204420 */  cvt.s.d $f16, $f8
/* 0275BC 800269BC 46102282 */  mul.s $f10, $f4, $f16
/* 0275C0 800269C0 46025200 */  add.s $f8, $f10, $f2
/* 0275C4 800269C4 E4880000 */  swc1  $f8, ($a0)
.L800269C8:
/* 0275C8 800269C8 01C08025 */  move  $s0, $t6
.L800269CC:
/* 0275CC 800269CC 12000068 */  beqz  $s0, .L80026B70
/* 0275D0 800269D0 001778C0 */   sll   $t7, $s7, 3
/* 0275D4 800269D4 8ED80014 */  lw    $t8, 0x14($s6)
/* 0275D8 800269D8 C7A400B0 */  lwc1  $f4, 0xb0($sp)
/* 0275DC 800269DC 030FC821 */  addu  $t9, $t8, $t7
/* 0275E0 800269E0 972E0000 */  lhu   $t6, ($t9)
/* 0275E4 800269E4 8ED90018 */  lw    $t9, 0x18($s6)
/* 0275E8 800269E8 000EC480 */  sll   $t8, $t6, 0x12
/* 0275EC 800269EC 00187C03 */  sra   $t7, $t8, 0x10
/* 0275F0 800269F0 C7AA0094 */  lwc1  $f10, 0x94($sp)
/* 0275F4 800269F4 000F7080 */  sll   $t6, $t7, 2
/* 0275F8 800269F8 032E1021 */  addu  $v0, $t9, $t6
/* 0275FC 800269FC C4460000 */  lwc1  $f6, ($v0)
/* 027600 80026A00 460A2200 */  add.s $f8, $f4, $f10
/* 027604 80026A04 C7A400B8 */  lwc1  $f4, 0xb8($sp)
/* 027608 80026A08 46083402 */  mul.s $f16, $f6, $f8
/* 02760C 80026A0C C4400004 */  lwc1  $f0, 4($v0)
/* 027610 80026A10 C7A80098 */  lwc1  $f8, 0x98($sp)
/* 027614 80026A14 C7A600A8 */  lwc1  $f6, 0xa8($sp)
/* 027618 80026A18 46002282 */  mul.s $f10, $f4, $f0
/* 02761C 80026A1C 46083100 */  add.s $f4, $f6, $f8
/* 027620 80026A20 C448000C */  lwc1  $f8, 0xc($v0)
/* 027624 80026A24 00001825 */  move  $v1, $zero
/* 027628 80026A28 460A8400 */  add.s $f16, $f16, $f10
/* 02762C 80026A2C C44A0008 */  lwc1  $f10, 8($v0)
/* 027630 80026A30 00000000 */  nop   
/* 027634 80026A34 460A2182 */  mul.s $f6, $f4, $f10
/* 027638 80026A38 44805000 */  mtc1  $zero, $f10
/* 02763C 80026A3C 46068400 */  add.s $f16, $f16, $f6
/* 027640 80026A40 C7A600C4 */  lwc1  $f6, 0xc4($sp)
/* 027644 80026A44 46088400 */  add.s $f16, $f16, $f8
/* 027648 80026A48 C7A800C8 */  lwc1  $f8, 0xc8($sp)
/* 02764C 80026A4C 46008121 */  cvt.d.s $f4, $f16
/* 027650 80026A50 4624A03C */  c.lt.d $f20, $f4
/* 027654 80026A54 00000000 */  nop   
/* 027658 80026A58 45000003 */  bc1f  .L80026A68
/* 02765C 80026A5C 0003C080 */   sll   $t8, $v1, 2
/* 027660 80026A60 24030001 */  li    $v1, 1
/* 027664 80026A64 0003C080 */  sll   $t8, $v1, 2
.L80026A68:
/* 027668 80026A68 460A003C */  c.lt.s $f0, $f10
/* 02766C 80026A6C 00188400 */  sll   $s0, $t8, 0x10
/* 027670 80026A70 00107C03 */  sra   $t7, $s0, 0x10
/* 027674 80026A74 45000005 */  bc1f  .L80026A8C
/* 027678 80026A78 01E08025 */   move  $s0, $t7
/* 02767C 80026A7C 0300C825 */  move  $t9, $t8
/* 027680 80026A80 372E0001 */  ori   $t6, $t9, 1
/* 027684 80026A84 000EC400 */  sll   $t8, $t6, 0x10
/* 027688 80026A88 00188403 */  sra   $s0, $t8, 0x10
.L80026A8C:
/* 02768C 80026A8C 46083032 */  c.eq.s $f6, $f8
/* 027690 80026A90 36190008 */  ori   $t9, $s0, 8
/* 027694 80026A94 45000002 */  bc1f  .L80026AA0
/* 027698 80026A98 00197400 */   sll   $t6, $t9, 0x10
/* 02769C 80026A9C 000E8403 */  sra   $s0, $t6, 0x10
.L80026AA0:
/* 0276A0 80026AA0 444FF800 */  cfc1  $t7, $31
/* 0276A4 80026AA4 C7A400C4 */  lwc1  $f4, 0xc4($sp)
/* 0276A8 80026AA8 35E10003 */  ori   $at, $t7, 3
/* 0276AC 80026AAC 38210002 */  xori  $at, $at, 2
/* 0276B0 80026AB0 44C1F800 */  ctc1  $at, $31
/* 0276B4 80026AB4 C7A600B8 */  lwc1  $f6, 0xb8($sp)
/* 0276B8 80026AB8 460022A4 */  cvt.w.s $f10, $f4
/* 0276BC 80026ABC 02003025 */  move  $a2, $s0
/* 0276C0 80026AC0 44CFF800 */  ctc1  $t7, $31
/* 0276C4 80026AC4 44045000 */  mfc1  $a0, $f10
/* 0276C8 80026AC8 A7A9010A */  sh    $t1, 0x10a($sp)
/* 0276CC 80026ACC 4458F800 */  cfc1  $t8, $31
/* 0276D0 80026AD0 0004CC00 */  sll   $t9, $a0, 0x10
/* 0276D4 80026AD4 37010003 */  ori   $at, $t8, 3
/* 0276D8 80026AD8 38210002 */  xori  $at, $at, 2
/* 0276DC 80026ADC 44C1F800 */  ctc1  $at, $31
/* 0276E0 80026AE0 00192403 */  sra   $a0, $t9, 0x10
/* 0276E4 80026AE4 46003224 */  cvt.w.s $f8, $f6
/* 0276E8 80026AE8 44054000 */  mfc1  $a1, $f8
/* 0276EC 80026AEC 44D8F800 */  ctc1  $t8, $31
/* 0276F0 80026AF0 00057C00 */  sll   $t7, $a1, 0x10
/* 0276F4 80026AF4 0C009B05 */  jal   func_80026C14
/* 0276F8 80026AF8 000F2C03 */   sra   $a1, $t7, 0x10
/* 0276FC 80026AFC 444EF800 */  cfc1  $t6, $31
/* 027700 80026B00 C7A400C8 */  lwc1  $f4, 0xc8($sp)
/* 027704 80026B04 35C10003 */  ori   $at, $t6, 3
/* 027708 80026B08 38210002 */  xori  $at, $at, 2
/* 02770C 80026B0C 44C1F800 */  ctc1  $at, $31
/* 027710 80026B10 C7A600BC */  lwc1  $f6, 0xbc($sp)
/* 027714 80026B14 460022A4 */  cvt.w.s $f10, $f4
/* 027718 80026B18 02003025 */  move  $a2, $s0
/* 02771C 80026B1C 44CEF800 */  ctc1  $t6, $31
/* 027720 80026B20 44045000 */  mfc1  $a0, $f10
/* 027724 80026B24 00000000 */  nop   
/* 027728 80026B28 4459F800 */  cfc1  $t9, $31
/* 02772C 80026B2C 0004C400 */  sll   $t8, $a0, 0x10
/* 027730 80026B30 37210003 */  ori   $at, $t9, 3
/* 027734 80026B34 38210002 */  xori  $at, $at, 2
/* 027738 80026B38 44C1F800 */  ctc1  $at, $31
/* 02773C 80026B3C 00182403 */  sra   $a0, $t8, 0x10
/* 027740 80026B40 46003224 */  cvt.w.s $f8, $f6
/* 027744 80026B44 44054000 */  mfc1  $a1, $f8
/* 027748 80026B48 44D9F800 */  ctc1  $t9, $31
/* 02774C 80026B4C 00057400 */  sll   $t6, $a1, 0x10
/* 027750 80026B50 0C009B05 */  jal   func_80026C14
/* 027754 80026B54 000E2C03 */   sra   $a1, $t6, 0x10
/* 027758 80026B58 87A9010A */  lh    $t1, 0x10a($sp)
/* 02775C 80026B5C 240A000A */  li    $t2, 10
/* 027760 80026B60 27AB00B0 */  addiu $t3, $sp, 0xb0
/* 027764 80026B64 27AC00A0 */  addiu $t4, $sp, 0xa0
/* 027768 80026B68 27AD00A8 */  addiu $t5, $sp, 0xa8
/* 02776C 80026B6C 241F0001 */  li    $ra, 1
.L80026B70:
/* 027770 80026B70 26F70001 */  addiu $s7, $s7, 1
/* 027774 80026B74 87AE0108 */  lh    $t6, 0x108($sp)
/* 027778 80026B78 00177C00 */  sll   $t7, $s7, 0x10
/* 02777C 80026B7C 000FBC03 */  sra   $s7, $t7, 0x10
/* 027780 80026B80 02EE082A */  slt   $at, $s7, $t6
/* 027784 80026B84 1420FE74 */  bnez  $at, .L80026558
/* 027788 80026B88 00000000 */   nop   
/* 02778C 80026B8C 86C40020 */  lh    $a0, 0x20($s6)
/* 027790 80026B90 00000000 */  nop   
.L80026B94:
/* 027794 80026B94 87A2010E */  lh    $v0, 0x10e($sp)
/* 027798 80026B98 00000000 */  nop   
/* 02779C 80026B9C 24420001 */  addiu $v0, $v0, 1
/* 0277A0 80026BA0 0002C400 */  sll   $t8, $v0, 0x10
/* 0277A4 80026BA4 00187C03 */  sra   $t7, $t8, 0x10
/* 0277A8 80026BA8 01E4082A */  slt   $at, $t7, $a0
/* 0277AC 80026BAC 1420FE54 */  bnez  $at, .L80026500
/* 0277B0 80026BB0 A7AF010E */   sh    $t7, 0x10e($sp)
.L80026BB4:
/* 0277B4 80026BB4 8FBF006C */  lw    $ra, 0x6c($sp)
/* 0277B8 80026BB8 C7B50018 */  lwc1  $f21, 0x18($sp)
/* 0277BC 80026BBC C7B4001C */  lwc1  $f20, 0x1c($sp)
/* 0277C0 80026BC0 C7B70020 */  lwc1  $f23, 0x20($sp)
/* 0277C4 80026BC4 C7B60024 */  lwc1  $f22, 0x24($sp)
/* 0277C8 80026BC8 C7B90028 */  lwc1  $f25, 0x28($sp)
/* 0277CC 80026BCC C7B8002C */  lwc1  $f24, 0x2c($sp)
/* 0277D0 80026BD0 C7BB0030 */  lwc1  $f27, 0x30($sp)
/* 0277D4 80026BD4 C7BA0034 */  lwc1  $f26, 0x34($sp)
/* 0277D8 80026BD8 C7BD0038 */  lwc1  $f29, 0x38($sp)
/* 0277DC 80026BDC C7BC003C */  lwc1  $f28, 0x3c($sp)
/* 0277E0 80026BE0 C7BF0040 */  lwc1  $f31, 0x40($sp)
/* 0277E4 80026BE4 C7BE0044 */  lwc1  $f30, 0x44($sp)
/* 0277E8 80026BE8 8FB00048 */  lw    $s0, 0x48($sp)
/* 0277EC 80026BEC 8FB1004C */  lw    $s1, 0x4c($sp)
/* 0277F0 80026BF0 8FB20050 */  lw    $s2, 0x50($sp)
/* 0277F4 80026BF4 8FB30054 */  lw    $s3, 0x54($sp)
/* 0277F8 80026BF8 8FB40058 */  lw    $s4, 0x58($sp)
/* 0277FC 80026BFC 8FB5005C */  lw    $s5, 0x5c($sp)
/* 027800 80026C00 8FB60060 */  lw    $s6, 0x60($sp)
/* 027804 80026C04 8FB70064 */  lw    $s7, 0x64($sp)
/* 027808 80026C08 8FBE0068 */  lw    $fp, 0x68($sp)
/* 02780C 80026C0C 03E00008 */  jr    $ra
/* 027810 80026C10 27BD0110 */   addiu $sp, $sp, 0x110

