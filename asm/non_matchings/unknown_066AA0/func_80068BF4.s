glabel func_80068BF4
/* 0697F4 80068BF4 27BDFF20 */  addiu $sp, $sp, -0xe0
/* 0697F8 80068BF8 8FAE00F0 */  lw    $t6, 0xf0($sp)
/* 0697FC 80068BFC AFB1001C */  sw    $s1, 0x1c($sp)
/* 069800 80068C00 AFB00018 */  sw    $s0, 0x18($sp)
/* 069804 80068C04 00E08025 */  move  $s0, $a3
/* 069808 80068C08 00808825 */  move  $s1, $a0
/* 06980C 80068C0C AFBF002C */  sw    $ra, 0x2c($sp)
/* 069810 80068C10 AFB40028 */  sw    $s4, 0x28($sp)
/* 069814 80068C14 AFB30024 */  sw    $s3, 0x24($sp)
/* 069818 80068C18 AFB20020 */  sw    $s2, 0x20($sp)
/* 06981C 80068C1C 11C000DA */  beqz  $t6, .L80068F88
/* 069820 80068C20 AFA500E4 */   sw    $a1, 0xe4($sp)
/* 069824 80068C24 444FF800 */  cfc1  $t7, $31
/* 069828 80068C28 C4E4000C */  lwc1  $f4, 0xc($a3)
/* 06982C 80068C2C 35E10003 */  ori   $at, $t7, 3
/* 069830 80068C30 38210002 */  xori  $at, $at, 2
/* 069834 80068C34 44C1F800 */  ctc1  $at, $31
/* 069838 80068C38 8CC30000 */  lw    $v1, ($a2)
/* 06983C 80068C3C 460021A4 */  cvt.w.s $f6, $f4
/* 069840 80068C40 240500FF */  li    $a1, 255
/* 069844 80068C44 44CFF800 */  ctc1  $t7, $31
/* 069848 80068C48 44183000 */  mfc1  $t8, $f6
/* 06984C 80068C4C 3C088000 */  lui   $t0, 0x8000
/* 069850 80068C50 4459F800 */  cfc1  $t9, $31
/* 069854 80068C54 A4780000 */  sh    $t8, ($v1)
/* 069858 80068C58 37210003 */  ori   $at, $t9, 3
/* 06985C 80068C5C 38210002 */  xori  $at, $at, 2
/* 069860 80068C60 44C1F800 */  ctc1  $at, $31
/* 069864 80068C64 C4E80010 */  lwc1  $f8, 0x10($a3)
/* 069868 80068C68 3C148012 */  lui   $s4, %hi(D_80120D1C) # $s4, 0x8012
/* 06986C 80068C6C 460042A4 */  cvt.w.s $f10, $f8
/* 069870 80068C70 26940D1C */  addiu $s4, %lo(D_80120D1C) # addiu $s4, $s4, 0xd1c
/* 069874 80068C74 44D9F800 */  ctc1  $t9, $31
/* 069878 80068C78 44095000 */  mfc1  $t1, $f10
/* 06987C 80068C7C 3C128012 */  lui   $s2, %hi(D_80120CF0) # $s2, 0x8012
/* 069880 80068C80 444AF800 */  cfc1  $t2, $31
/* 069884 80068C84 A4690002 */  sh    $t1, 2($v1)
/* 069888 80068C88 35410003 */  ori   $at, $t2, 3
/* 06988C 80068C8C 38210002 */  xori  $at, $at, 2
/* 069890 80068C90 44C1F800 */  ctc1  $at, $31
/* 069894 80068C94 C4F00014 */  lwc1  $f16, 0x14($a3)
/* 069898 80068C98 A0650006 */  sb    $a1, 6($v1)
/* 06989C 80068C9C 460084A4 */  cvt.w.s $f18, $f16
/* 0698A0 80068CA0 A0650007 */  sb    $a1, 7($v1)
/* 0698A4 80068CA4 440B9000 */  mfc1  $t3, $f18
/* 0698A8 80068CA8 A0650008 */  sb    $a1, 8($v1)
/* 0698AC 80068CAC A0650009 */  sb    $a1, 9($v1)
/* 0698B0 80068CB0 A46B0004 */  sh    $t3, 4($v1)
/* 0698B4 80068CB4 8C820000 */  lw    $v0, ($a0)
/* 0698B8 80068CB8 3C010400 */  lui   $at, 0x400
/* 0698BC 80068CBC 244C0008 */  addiu $t4, $v0, 8
/* 0698C0 80068CC0 AE2C0000 */  sw    $t4, ($s1)
/* 0698C4 80068CC4 8CCD0000 */  lw    $t5, ($a2)
/* 0698C8 80068CC8 44CAF800 */  ctc1  $t2, $31
/* 0698CC 80068CCC 01A87821 */  addu  $t7, $t5, $t0
/* 0698D0 80068CD0 31F80006 */  andi  $t8, $t7, 6
/* 0698D4 80068CD4 0018CC00 */  sll   $t9, $t8, 0x10
/* 0698D8 80068CD8 03214825 */  or    $t1, $t9, $at
/* 0698DC 80068CDC 352A001A */  ori   $t2, $t1, 0x1a
/* 0698E0 80068CE0 AC4A0000 */  sw    $t2, ($v0)
/* 0698E4 80068CE4 8CCB0000 */  lw    $t3, ($a2)
/* 0698E8 80068CE8 26520CF0 */  addiu $s2, %lo(D_80120CF0) # addiu $s2, $s2, 0xcf0
/* 0698EC 80068CEC 01686021 */  addu  $t4, $t3, $t0
/* 0698F0 80068CF0 AC4C0004 */  sw    $t4, 4($v0)
/* 0698F4 80068CF4 8CCD0000 */  lw    $t5, ($a2)
/* 0698F8 80068CF8 3C0C8012 */  lui   $t4, %hi(D_80120CE4) # $t4, 0x8012
/* 0698FC 80068CFC 25AE000A */  addiu $t6, $t5, 0xa
/* 069900 80068D00 ACCE0000 */  sw    $t6, ($a2)
/* 069904 80068D04 8E8F0000 */  lw    $t7, ($s4)
/* 069908 80068D08 84F30018 */  lh    $s3, 0x18($a3)
/* 06990C 80068D0C 25F80001 */  addiu $t8, $t7, 1
/* 069910 80068D10 AE980000 */  sw    $t8, ($s4)
/* 069914 80068D14 84F90000 */  lh    $t9, ($a3)
/* 069918 80068D18 3C0E8012 */  lui   $t6, 0x8012
/* 06991C 80068D1C 00194823 */  negu  $t1, $t9
/* 069920 80068D20 A6490000 */  sh    $t1, ($s2)
/* 069924 80068D24 84EA0002 */  lh    $t2, 2($a3)
/* 069928 80068D28 44800000 */  mtc1  $zero, $f0
/* 06992C 80068D2C 000A5823 */  negu  $t3, $t2
/* 069930 80068D30 A64B0002 */  sh    $t3, 2($s2)
/* 069934 80068D34 8D8C0CE4 */  lw    $t4, %lo(D_80120CE4)($t4)
/* 069938 80068D38 84EF0004 */  lh    $t7, 4($a3)
/* 06993C 80068D3C 000C6900 */  sll   $t5, $t4, 4
/* 069940 80068D40 01AC6821 */  addu  $t5, $t5, $t4
/* 069944 80068D44 000D6880 */  sll   $t5, $t5, 2
/* 069948 80068D48 01CD7021 */  addu  $t6, $t6, $t5
/* 06994C 80068D4C 85CE0AC4 */  lh    $t6, 0xac4($t6)
/* 069950 80068D50 3C198012 */  lui   $t9, %hi(D_80120D15) # $t9, 0x8012
/* 069954 80068D54 01CFC021 */  addu  $t8, $t6, $t7
/* 069958 80068D58 A6580004 */  sh    $t8, 4($s2)
/* 06995C 80068D5C E640000C */  swc1  $f0, 0xc($s2)
/* 069960 80068D60 E6400010 */  swc1  $f0, 0x10($s2)
/* 069964 80068D64 E6400014 */  swc1  $f0, 0x14($s2)
/* 069968 80068D68 83390D15 */  lb    $t9, %lo(D_80120D15)($t9)
/* 06996C 80068D6C 3C048012 */  lui   $a0, 0x8012
/* 069970 80068D70 13200015 */  beqz  $t9, .L80068DC8
/* 069974 80068D74 00000000 */   nop   
/* 069978 80068D78 C4E00008 */  lwc1  $f0, 8($a3)
/* 06997C 80068D7C 3C073F80 */  lui   $a3, 0x3f80
/* 069980 80068D80 44050000 */  mfc1  $a1, $f0
/* 069984 80068D84 44060000 */  mfc1  $a2, $f0
/* 069988 80068D88 0C01C18E */  jal   func_80070638
/* 06998C 80068D8C 27A40050 */   addiu $a0, $sp, 0x50
/* 069990 80068D90 3C078012 */  lui   $a3, %hi(D_80126174) # $a3, 0x8012
/* 069994 80068D94 27B00090 */  addiu $s0, $sp, 0x90
/* 069998 80068D98 8CE76174 */  lw    $a3, %lo(D_80126174)($a3)
/* 06999C 80068D9C 02002025 */  move  $a0, $s0
/* 0699A0 80068DA0 00002825 */  move  $a1, $zero
/* 0699A4 80068DA4 0C01C04C */  jal   func_80070130
/* 0699A8 80068DA8 3C063F80 */   lui   $a2, 0x3f80
/* 0699AC 80068DAC 3C068012 */  lui   $a2, %hi(D_80121060) # $a2, 0x8012
/* 0699B0 80068DB0 24C61060 */  addiu $a2, %lo(D_80121060) # addiu $a2, $a2, 0x1060
/* 0699B4 80068DB4 02002025 */  move  $a0, $s0
/* 0699B8 80068DB8 0C01BDDA */  jal   func_8006F768
/* 0699BC 80068DBC 27A50050 */   addiu $a1, $sp, 0x50
/* 0699C0 80068DC0 10000009 */  b     .L80068DE8
/* 0699C4 80068DC4 02002025 */   move  $a0, $s0
.L80068DC8:
/* 0699C8 80068DC8 C6000008 */  lwc1  $f0, 8($s0)
/* 0699CC 80068DCC 24841060 */  addiu $a0, $a0, 0x1060
/* 0699D0 80068DD0 44050000 */  mfc1  $a1, $f0
/* 0699D4 80068DD4 44060000 */  mfc1  $a2, $f0
/* 0699D8 80068DD8 0C01C18E */  jal   func_80070638
/* 0699DC 80068DDC 3C073F80 */   lui   $a3, 0x3f80
/* 0699E0 80068DE0 27B00090 */  addiu $s0, $sp, 0x90
/* 0699E4 80068DE4 02002025 */  move  $a0, $s0
.L80068DE8:
/* 0699E8 80068DE8 0C01BF9D */  jal   func_8006FE74
/* 0699EC 80068DEC 02402825 */   move  $a1, $s2
/* 0699F0 80068DF0 8E890000 */  lw    $t1, ($s4)
/* 0699F4 80068DF4 3C128012 */  lui   $s2, %hi(D_80120D70) # $s2, 0x8012
/* 0699F8 80068DF8 26520D70 */  addiu $s2, %lo(D_80120D70) # addiu $s2, $s2, 0xd70
/* 0699FC 80068DFC 00095080 */  sll   $t2, $t1, 2
/* 069A00 80068E00 024A5821 */  addu  $t3, $s2, $t2
/* 069A04 80068E04 8D660000 */  lw    $a2, ($t3)
/* 069A08 80068E08 3C048012 */  lui   $a0, %hi(D_80121060) # $a0, 0x8012
/* 069A0C 80068E0C 24841060 */  addiu $a0, %lo(D_80121060) # addiu $a0, $a0, 0x1060
/* 069A10 80068E10 0C01BDDA */  jal   func_8006F768
/* 069A14 80068E14 02002825 */   move  $a1, $s0
/* 069A18 80068E18 8E8C0000 */  lw    $t4, ($s4)
/* 069A1C 80068E1C 8FAF00E4 */  lw    $t7, 0xe4($sp)
/* 069A20 80068E20 000C6880 */  sll   $t5, $t4, 2
/* 069A24 80068E24 024D7021 */  addu  $t6, $s2, $t5
/* 069A28 80068E28 8DC40000 */  lw    $a0, ($t6)
/* 069A2C 80068E2C 8DE50000 */  lw    $a1, ($t7)
/* 069A30 80068E30 0C01BE1C */  jal   func_8006F870
/* 069A34 80068E34 00000000 */   nop   
/* 069A38 80068E38 8FA500E4 */  lw    $a1, 0xe4($sp)
/* 069A3C 80068E3C 8E990000 */  lw    $t9, ($s4)
/* 069A40 80068E40 8CB80000 */  lw    $t8, ($a1)
/* 069A44 80068E44 3C018012 */  lui   $at, 0x8012
/* 069A48 80068E48 00194880 */  sll   $t1, $t9, 2
/* 069A4C 80068E4C 00290821 */  addu  $at, $at, $t1
/* 069A50 80068E50 AC380D88 */  sw    $t8, 0xd88($at)
/* 069A54 80068E54 8E220000 */  lw    $v0, ($s1)
/* 069A58 80068E58 3C0B0180 */  lui   $t3, (0x01800040 >> 16) # lui $t3, 0x180
/* 069A5C 80068E5C 244A0008 */  addiu $t2, $v0, 8
/* 069A60 80068E60 AE2A0000 */  sw    $t2, ($s1)
/* 069A64 80068E64 356B0040 */  ori   $t3, (0x01800040 & 0xFFFF) # ori $t3, $t3, 0x40
/* 069A68 80068E68 AC4B0000 */  sw    $t3, ($v0)
/* 069A6C 80068E6C 8CAC0000 */  lw    $t4, ($a1)
/* 069A70 80068E70 3C018000 */  lui   $at, 0x8000
/* 069A74 80068E74 01816821 */  addu  $t5, $t4, $at
/* 069A78 80068E78 AC4D0004 */  sw    $t5, 4($v0)
/* 069A7C 80068E7C 8CAE0000 */  lw    $t6, ($a1)
/* 069A80 80068E80 3C10BC00 */  lui   $s0, (0xBC000002 >> 16) # lui $s0, 0xbc00
/* 069A84 80068E84 25CF0040 */  addiu $t7, $t6, 0x40
/* 069A88 80068E88 ACAF0000 */  sw    $t7, ($a1)
/* 069A8C 80068E8C 8E220000 */  lw    $v0, ($s1)
/* 069A90 80068E90 36100002 */  ori   $s0, (0xBC000002 & 0xFFFF) # ori $s0, $s0, 2
/* 069A94 80068E94 24590008 */  addiu $t9, $v0, 8
/* 069A98 80068E98 AE390000 */  sw    $t9, ($s1)
/* 069A9C 80068E9C 24180001 */  li    $t8, 1
/* 069AA0 80068EA0 3C098012 */  lui   $t1, %hi(D_80120D0C) # $t1, 0x8012
/* 069AA4 80068EA4 AC580004 */  sw    $t8, 4($v0)
/* 069AA8 80068EA8 AC500000 */  sw    $s0, ($v0)
/* 069AAC 80068EAC 8D290D0C */  lw    $t1, %lo(D_80120D0C)($t1)
/* 069AB0 80068EB0 8FAE00F0 */  lw    $t6, 0xf0($sp)
/* 069AB4 80068EB4 15200009 */  bnez  $t1, .L80068EDC
/* 069AB8 80068EB8 02202025 */   move  $a0, $s1
/* 069ABC 80068EBC 8FAB00F0 */  lw    $t3, 0xf0($sp)
/* 069AC0 80068EC0 326A00FF */  andi  $t2, $s3, 0xff
/* 069AC4 80068EC4 856C0000 */  lh    $t4, ($t3)
/* 069AC8 80068EC8 00000000 */  nop   
/* 069ACC 80068ECC 014C0019 */  multu $t2, $t4
/* 069AD0 80068ED0 00009812 */  mflo  $s3
/* 069AD4 80068ED4 00136A03 */  sra   $t5, $s3, 8
/* 069AD8 80068ED8 01A09825 */  move  $s3, $t5
.L80068EDC:
/* 069ADC 80068EDC 85CF0006 */  lh    $t7, 6($t6)
/* 069AE0 80068EE0 8FB900F4 */  lw    $t9, 0xf4($sp)
/* 069AE4 80068EE4 0C01EFCD */  jal   func_8007BF34
/* 069AE8 80068EE8 01F92825 */   or    $a1, $t7, $t9
/* 069AEC 80068EEC 8FB800F0 */  lw    $t8, 0xf0($sp)
/* 069AF0 80068EF0 00000000 */  nop   
/* 069AF4 80068EF4 87020000 */  lh    $v0, ($t8)
/* 069AF8 80068EF8 00000000 */  nop   
/* 069AFC 80068EFC 0262082A */  slt   $at, $s3, $v0
/* 069B00 80068F00 14200002 */  bnez  $at, .L80068F0C
/* 069B04 80068F04 00000000 */   nop   
/* 069B08 80068F08 2453FFFF */  addiu $s3, $v0, -1
.L80068F0C:
/* 069B0C 80068F0C 8E220000 */  lw    $v0, ($s1)
/* 069B10 80068F10 3C0B0600 */  lui   $t3, 0x600
/* 069B14 80068F14 24490008 */  addiu $t1, $v0, 8
/* 069B18 80068F18 AE290000 */  sw    $t1, ($s1)
/* 069B1C 80068F1C AC4B0000 */  sw    $t3, ($v0)
/* 069B20 80068F20 8FAA00F0 */  lw    $t2, 0xf0($sp)
/* 069B24 80068F24 00136080 */  sll   $t4, $s3, 2
/* 069B28 80068F28 014C6821 */  addu  $t5, $t2, $t4
/* 069B2C 80068F2C 8DAE000C */  lw    $t6, 0xc($t5)
/* 069B30 80068F30 3C0BBC00 */  lui   $t3, (0xBC00000A >> 16) # lui $t3, 0xbc00
/* 069B34 80068F34 AC4E0004 */  sw    $t6, 4($v0)
/* 069B38 80068F38 8E8F0000 */  lw    $t7, ($s4)
/* 069B3C 80068F3C 356B000A */  ori   $t3, (0xBC00000A & 0xFFFF) # ori $t3, $t3, 0xa
/* 069B40 80068F40 25F9FFFF */  addiu $t9, $t7, -1
/* 069B44 80068F44 17200003 */  bnez  $t9, .L80068F54
/* 069B48 80068F48 AE990000 */   sw    $t9, ($s4)
/* 069B4C 80068F4C 10000002 */  b     .L80068F58
/* 069B50 80068F50 00009825 */   move  $s3, $zero
.L80068F54:
/* 069B54 80068F54 24130001 */  li    $s3, 1
.L80068F58:
/* 069B58 80068F58 8E220000 */  lw    $v0, ($s1)
/* 069B5C 80068F5C 00135180 */  sll   $t2, $s3, 6
/* 069B60 80068F60 24490008 */  addiu $t1, $v0, 8
/* 069B64 80068F64 AE290000 */  sw    $t1, ($s1)
/* 069B68 80068F68 AC4A0004 */  sw    $t2, 4($v0)
/* 069B6C 80068F6C AC4B0000 */  sw    $t3, ($v0)
/* 069B70 80068F70 8E220000 */  lw    $v0, ($s1)
/* 069B74 80068F74 00000000 */  nop   
/* 069B78 80068F78 244C0008 */  addiu $t4, $v0, 8
/* 069B7C 80068F7C AE2C0000 */  sw    $t4, ($s1)
/* 069B80 80068F80 AC400004 */  sw    $zero, 4($v0)
/* 069B84 80068F84 AC500000 */  sw    $s0, ($v0)
.L80068F88:
/* 069B88 80068F88 8FBF002C */  lw    $ra, 0x2c($sp)
/* 069B8C 80068F8C 8FB00018 */  lw    $s0, 0x18($sp)
/* 069B90 80068F90 8FB1001C */  lw    $s1, 0x1c($sp)
/* 069B94 80068F94 8FB20020 */  lw    $s2, 0x20($sp)
/* 069B98 80068F98 8FB30024 */  lw    $s3, 0x24($sp)
/* 069B9C 80068F9C 8FB40028 */  lw    $s4, 0x28($sp)
/* 069BA0 80068FA0 03E00008 */  jr    $ra
/* 069BA4 80068FA4 27BD00E0 */   addiu $sp, $sp, 0xe0

