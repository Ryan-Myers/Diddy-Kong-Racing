.late_rodata
glabel D_800E6930
.double 1.2
glabel D_800E6938
.double 0.8

.text
glabel set_ghost_position_and_rotation
/* 05AA40 80059E40 3C058012 */  lui   $a1, %hi(gCurrentGhostIndex) # $a1, 0x8012
/* 05AA44 80059E44 80A5D59C */  lb    $a1, %lo(gCurrentGhostIndex)($a1)
/* 05AA48 80059E48 27BDFF68 */  addiu $sp, $sp, -0x98
/* 05AA4C 80059E4C 24A50001 */  addiu $a1, $a1, 1
/* 05AA50 80059E50 AFBF001C */  sw    $ra, 0x1c($sp)
/* 05AA54 80059E54 AFB00018 */  sw    $s0, 0x18($sp)
/* 05AA58 80059E58 30AE0001 */  andi  $t6, $a1, 1
/* 05AA5C 80059E5C 00808025 */  move  $s0, $a0
/* 05AA60 80059E60 0C006CEB */  jal   timetrial_staff_ghost_check
/* 05AA64 80059E64 AFAE005C */   sw    $t6, 0x5c($sp)
/* 05AA68 80059E68 8FA5005C */  lw    $a1, 0x5c($sp)
/* 05AA6C 80059E6C 10400002 */  beqz  $v0, .L80059E78
/* 05AA70 80059E70 3C0141F0 */   li    $at, 0x41F00000 # 30.000000
/* 05AA74 80059E74 24050002 */  li    $a1, 2
.L80059E78:
/* 05AA78 80059E78 8E0F0078 */  lw    $t7, 0x78($s0)
/* 05AA7C 80059E7C 3C188000 */  lui   $t8, %hi(osTvType) # $t8, 0x8000
/* 05AA80 80059E80 448F2000 */  mtc1  $t7, $f4
/* 05AA84 80059E84 44813000 */  mtc1  $at, $f6
/* 05AA88 80059E88 46802020 */  cvt.s.w $f0, $f4
/* 05AA8C 80059E8C 8F180300 */  lw    $t8, %lo(osTvType)($t8)
/* 05AA90 80059E90 00057040 */  sll   $t6, $a1, 1
/* 05AA94 80059E94 1700000E */  bnez  $t8, .L80059ED0
/* 05AA98 80059E98 46060083 */   div.s $f2, $f0, $f6
/* 05AA9C 80059E9C 24010002 */  li    $at, 2
/* 05AAA0 80059EA0 14A1000B */  bne   $a1, $at, .L80059ED0
/* 05AAA4 80059EA4 3C01800E */   lui   $at, %hi(D_800E6930 + 4) # $at, 0x800e
/* 05AAA8 80059EA8 C42B6930 */  lwc1  $f11, %lo(D_800E6930)($at)
/* 05AAAC 80059EAC C42A6934 */  lwc1  $f10, %lo(D_800E6930 + 4)($at)
/* 05AAB0 80059EB0 46000221 */  cvt.d.s $f8, $f0
/* 05AAB4 80059EB4 462A4402 */  mul.d $f16, $f8, $f10
/* 05AAB8 80059EB8 3C01403E */  li    $at, 0x403E0000 # 2.968750
/* 05AABC 80059EBC 44819800 */  mtc1  $at, $f19
/* 05AAC0 80059EC0 44809000 */  mtc1  $zero, $f18
/* 05AAC4 80059EC4 00000000 */  nop   
/* 05AAC8 80059EC8 46328103 */  div.d $f4, $f16, $f18
/* 05AACC 80059ECC 462020A0 */  cvt.s.d $f2, $f4
.L80059ED0:
/* 05AAD0 80059ED0 4459F800 */  cfc1  $t9, $31
/* 05AAD4 80059ED4 3C0D8012 */  lui   $t5, %hi(gGhostNodeCount) # $t5, 0x8012
/* 05AAD8 80059ED8 37210003 */  ori   $at, $t9, 3
/* 05AADC 80059EDC 38210002 */  xori  $at, $at, 2
/* 05AAE0 80059EE0 44C1F800 */  ctc1  $at, $31
/* 05AAE4 80059EE4 01AE6821 */  addu  $t5, $t5, $t6
/* 05AAE8 80059EE8 460011A4 */  cvt.w.s $f6, $f2
/* 05AAEC 80059EEC 85ADD5A0 */  lh    $t5, %lo(gGhostNodeCount)($t5)
/* 05AAF0 80059EF0 44033000 */  mfc1  $v1, $f6
/* 05AAF4 80059EF4 25AFFFFE */  addiu $t7, $t5, -2
/* 05AAF8 80059EF8 44D9F800 */  ctc1  $t9, $31
/* 05AAFC 80059EFC 006F082A */  slt   $at, $v1, $t7
/* 05AB00 80059F00 14200003 */  bnez  $at, .L80059F10
/* 05AB04 80059F04 AFA30060 */   sw    $v1, 0x60($sp)
/* 05AB08 80059F08 10000125 */  b     .L8005A3A0
/* 05AB0C 80059F0C 00001025 */   move  $v0, $zero
.L80059F10:
/* 05AB10 80059F10 24010002 */  li    $at, 2
/* 05AB14 80059F14 10A10011 */  beq   $a1, $at, .L80059F5C
/* 05AB18 80059F18 2469FFFF */   addiu $t1, $v1, -1
/* 05AB1C 80059F1C AFA3003C */  sw    $v1, 0x3c($sp)
/* 05AB20 80059F20 AFA5005C */  sw    $a1, 0x5c($sp)
/* 05AB24 80059F24 AFAD004C */  sw    $t5, 0x4c($sp)
/* 05AB28 80059F28 0C01AF62 */  jal   get_current_map_id
/* 05AB2C 80059F2C E7A20094 */   swc1  $f2, 0x94($sp)
/* 05AB30 80059F30 3C188012 */  lui   $t8, %hi(gGhostMapID) # $t8, 0x8012
/* 05AB34 80059F34 8718D5AC */  lh    $t8, %lo(gGhostMapID)($t8)
/* 05AB38 80059F38 8FA3003C */  lw    $v1, 0x3c($sp)
/* 05AB3C 80059F3C 8FA5005C */  lw    $a1, 0x5c($sp)
/* 05AB40 80059F40 8FAD004C */  lw    $t5, 0x4c($sp)
/* 05AB44 80059F44 C7A20094 */  lwc1  $f2, 0x94($sp)
/* 05AB48 80059F48 10580004 */  beq   $v0, $t8, .L80059F5C
/* 05AB4C 80059F4C 2469FFFF */   addiu $t1, $v1, -1
/* 05AB50 80059F50 10000113 */  b     .L8005A3A0
/* 05AB54 80059F54 00001025 */   move  $v0, $zero
/* 05AB58 80059F58 2469FFFF */  addiu $t1, $v1, -1
.L80059F5C:
/* 05AB5C 80059F5C 0005C880 */  sll   $t9, $a1, 2
/* 05AB60 80059F60 3C1F8012 */  lui   $ra, %hi(gGhostData) # $ra, 0x8012
/* 05AB64 80059F64 03F9F821 */  addu  $ra, $ra, $t9
/* 05AB68 80059F68 00097080 */  sll   $t6, $t1, 2
/* 05AB6C 80059F6C 8FFFD590 */  lw    $ra, %lo(gGhostData)($ra)
/* 05AB70 80059F70 01C97023 */  subu  $t6, $t6, $t1
/* 05AB74 80059F74 000E7080 */  sll   $t6, $t6, 2
/* 05AB78 80059F78 27A70084 */  addiu $a3, $sp, 0x84
/* 05AB7C 80059F7C 27A80074 */  addiu $t0, $sp, 0x74
/* 05AB80 80059F80 27A60064 */  addiu $a2, $sp, 0x64
/* 05AB84 80059F84 27AC0074 */  addiu $t4, $sp, 0x74
/* 05AB88 80059F88 240BFFFF */  li    $t3, -1
/* 05AB8C 80059F8C 03EE5021 */  addu  $t2, $ra, $t6
.L80059F90:
/* 05AB90 80059F90 152B001A */  bne   $t1, $t3, .L80059FFC
/* 05AB94 80059F94 01401025 */   move  $v0, $t2
/* 05AB98 80059F98 8443000C */  lh    $v1, 0xc($v0)
/* 05AB9C 80059F9C 84580018 */  lh    $t8, 0x18($v0)
/* 05ABA0 80059FA0 00637821 */  addu  $t7, $v1, $v1
/* 05ABA4 80059FA4 01F8C823 */  subu  $t9, $t7, $t8
/* 05ABA8 80059FA8 44994000 */  mtc1  $t9, $f8
/* 05ABAC 80059FAC 2442000C */  addiu $v0, $v0, 0xc
/* 05ABB0 80059FB0 468042A0 */  cvt.s.w $f10, $f8
/* 05ABB4 80059FB4 E4EA0000 */  swc1  $f10, ($a3)
/* 05ABB8 80059FB8 84440002 */  lh    $a0, 2($v0)
/* 05ABBC 80059FBC 844F000E */  lh    $t7, 0xe($v0)
/* 05ABC0 80059FC0 00847021 */  addu  $t6, $a0, $a0
/* 05ABC4 80059FC4 01CFC023 */  subu  $t8, $t6, $t7
/* 05ABC8 80059FC8 44988000 */  mtc1  $t8, $f16
/* 05ABCC 80059FCC 00000000 */  nop   
/* 05ABD0 80059FD0 468084A0 */  cvt.s.w $f18, $f16
/* 05ABD4 80059FD4 E5120000 */  swc1  $f18, ($t0)
/* 05ABD8 80059FD8 84450004 */  lh    $a1, 4($v0)
/* 05ABDC 80059FDC 844E0010 */  lh    $t6, 0x10($v0)
/* 05ABE0 80059FE0 00A5C821 */  addu  $t9, $a1, $a1
/* 05ABE4 80059FE4 032E7823 */  subu  $t7, $t9, $t6
/* 05ABE8 80059FE8 448F2000 */  mtc1  $t7, $f4
/* 05ABEC 80059FEC 00000000 */  nop   
/* 05ABF0 80059FF0 468021A0 */  cvt.s.w $f6, $f4
/* 05ABF4 80059FF4 1000002F */  b     .L8005A0B4
/* 05ABF8 80059FF8 E4C60000 */   swc1  $f6, ($a2)
.L80059FFC:
/* 05ABFC 80059FFC 012D082A */  slt   $at, $t1, $t5
/* 05AC00 8005A000 1420001A */  bnez  $at, .L8005A06C
/* 05AC04 8005A004 00000000 */   nop   
/* 05AC08 8005A008 84430000 */  lh    $v1, ($v0)
/* 05AC0C 8005A00C 8459FFF4 */  lh    $t9, -0xc($v0)
/* 05AC10 8005A010 0063C021 */  addu  $t8, $v1, $v1
/* 05AC14 8005A014 03197023 */  subu  $t6, $t8, $t9
/* 05AC18 8005A018 448E4000 */  mtc1  $t6, $f8
/* 05AC1C 8005A01C 00000000 */  nop   
/* 05AC20 8005A020 468042A0 */  cvt.s.w $f10, $f8
/* 05AC24 8005A024 E4EA0000 */  swc1  $f10, ($a3)
/* 05AC28 8005A028 84440002 */  lh    $a0, 2($v0)
/* 05AC2C 8005A02C 8458FFF6 */  lh    $t8, -0xa($v0)
/* 05AC30 8005A030 00847821 */  addu  $t7, $a0, $a0
/* 05AC34 8005A034 01F8C823 */  subu  $t9, $t7, $t8
/* 05AC38 8005A038 44998000 */  mtc1  $t9, $f16
/* 05AC3C 8005A03C 00000000 */  nop   
/* 05AC40 8005A040 468084A0 */  cvt.s.w $f18, $f16
/* 05AC44 8005A044 E5120000 */  swc1  $f18, ($t0)
/* 05AC48 8005A048 84450004 */  lh    $a1, 4($v0)
/* 05AC4C 8005A04C 844FFFF8 */  lh    $t7, -8($v0)
/* 05AC50 8005A050 00A57021 */  addu  $t6, $a1, $a1
/* 05AC54 8005A054 01CFC023 */  subu  $t8, $t6, $t7
/* 05AC58 8005A058 44982000 */  mtc1  $t8, $f4
/* 05AC5C 8005A05C 00000000 */  nop   
/* 05AC60 8005A060 468021A0 */  cvt.s.w $f6, $f4
/* 05AC64 8005A064 10000013 */  b     .L8005A0B4
/* 05AC68 8005A068 E4C60000 */   swc1  $f6, ($a2)
.L8005A06C:
/* 05AC6C 8005A06C 84590000 */  lh    $t9, ($v0)
/* 05AC70 8005A070 00000000 */  nop   
/* 05AC74 8005A074 44994000 */  mtc1  $t9, $f8
/* 05AC78 8005A078 00000000 */  nop   
/* 05AC7C 8005A07C 468042A0 */  cvt.s.w $f10, $f8
/* 05AC80 8005A080 E4EA0000 */  swc1  $f10, ($a3)
/* 05AC84 8005A084 844E0002 */  lh    $t6, 2($v0)
/* 05AC88 8005A088 00000000 */  nop   
/* 05AC8C 8005A08C 448E8000 */  mtc1  $t6, $f16
/* 05AC90 8005A090 00000000 */  nop   
/* 05AC94 8005A094 468084A0 */  cvt.s.w $f18, $f16
/* 05AC98 8005A098 E5120000 */  swc1  $f18, ($t0)
/* 05AC9C 8005A09C 844F0004 */  lh    $t7, 4($v0)
/* 05ACA0 8005A0A0 00000000 */  nop   
/* 05ACA4 8005A0A4 448F2000 */  mtc1  $t7, $f4
/* 05ACA8 8005A0A8 00000000 */  nop   
/* 05ACAC 8005A0AC 468021A0 */  cvt.s.w $f6, $f4
/* 05ACB0 8005A0B0 E4C60000 */  swc1  $f6, ($a2)
.L8005A0B4:
/* 05ACB4 8005A0B4 24C60004 */  addiu $a2, $a2, 4
/* 05ACB8 8005A0B8 24E70004 */  addiu $a3, $a3, 4
/* 05ACBC 8005A0BC 25080004 */  addiu $t0, $t0, 4
/* 05ACC0 8005A0C0 25290001 */  addiu $t1, $t1, 1
/* 05ACC4 8005A0C4 14CCFFB2 */  bne   $a2, $t4, .L80059F90
/* 05ACC8 8005A0C8 254A000C */   addiu $t2, $t2, 0xc
/* 05ACCC 8005A0CC 8FB80060 */  lw    $t8, 0x60($sp)
/* 05ACD0 8005A0D0 27A40084 */  addiu $a0, $sp, 0x84
/* 05ACD4 8005A0D4 44984000 */  mtc1  $t8, $f8
/* 05ACD8 8005A0D8 0018C880 */  sll   $t9, $t8, 2
/* 05ACDC 8005A0DC 468042A0 */  cvt.s.w $f10, $f8
/* 05ACE0 8005A0E0 0338C823 */  subu  $t9, $t9, $t8
/* 05ACE4 8005A0E4 0019C880 */  sll   $t9, $t9, 2
/* 05ACE8 8005A0E8 460A1081 */  sub.s $f2, $f2, $f10
/* 05ACEC 8005A0EC 03F91021 */  addu  $v0, $ra, $t9
/* 05ACF0 8005A0F0 44061000 */  mfc1  $a2, $f2
/* 05ACF4 8005A0F4 AFA20048 */  sw    $v0, 0x48($sp)
/* 05ACF8 8005A0F8 E7A20094 */  swc1  $f2, 0x94($sp)
/* 05ACFC 8005A0FC 00002825 */  move  $a1, $zero
/* 05AD00 8005A100 0C008950 */  jal   catmull_rom_interpolation
/* 05AD04 8005A104 AFAD004C */   sw    $t5, 0x4c($sp)
/* 05AD08 8005A108 C7A20094 */  lwc1  $f2, 0x94($sp)
/* 05AD0C 8005A10C E600000C */  swc1  $f0, 0xc($s0)
/* 05AD10 8005A110 44061000 */  mfc1  $a2, $f2
/* 05AD14 8005A114 27A40074 */  addiu $a0, $sp, 0x74
/* 05AD18 8005A118 0C008950 */  jal   catmull_rom_interpolation
/* 05AD1C 8005A11C 00002825 */   move  $a1, $zero
/* 05AD20 8005A120 C7A20094 */  lwc1  $f2, 0x94($sp)
/* 05AD24 8005A124 E6000010 */  swc1  $f0, 0x10($s0)
/* 05AD28 8005A128 44061000 */  mfc1  $a2, $f2
/* 05AD2C 8005A12C 27A40064 */  addiu $a0, $sp, 0x64
/* 05AD30 8005A130 0C008950 */  jal   catmull_rom_interpolation
/* 05AD34 8005A134 00002825 */   move  $a1, $zero
/* 05AD38 8005A138 8FA20048 */  lw    $v0, 0x48($sp)
/* 05AD3C 8005A13C 8FAD004C */  lw    $t5, 0x4c($sp)
/* 05AD40 8005A140 C7A20094 */  lwc1  $f2, 0x94($sp)
/* 05AD44 8005A144 E6000014 */  swc1  $f0, 0x14($s0)
/* 05AD48 8005A148 8444000A */  lh    $a0, 0xa($v0)
/* 05AD4C 8005A14C 2446000C */  addiu $a2, $v0, 0xc
/* 05AD50 8005A150 84CE000A */  lh    $t6, 0xa($a2)
/* 05AD54 8005A154 308FFFFF */  andi  $t7, $a0, 0xffff
/* 05AD58 8005A158 34078001 */  li    $a3, 32769
/* 05AD5C 8005A15C 01CF1823 */  subu  $v1, $t6, $t7
/* 05AD60 8005A160 0067082A */  slt   $at, $v1, $a3
/* 05AD64 8005A164 14200003 */  bnez  $at, .L8005A174
/* 05AD68 8005A168 3C08FFFF */   lui   $t0, (0xFFFF0001 >> 16) # lui $t0, 0xffff
/* 05AD6C 8005A16C 35080001 */  ori   $t0, (0xFFFF0001 & 0xFFFF) # ori $t0, $t0, 1
/* 05AD70 8005A170 00681821 */  addu  $v1, $v1, $t0
.L8005A174:
/* 05AD74 8005A174 3C08FFFF */  lui   $t0, (0xFFFF0001 >> 16) # lui $t0, 0xffff
/* 05AD78 8005A178 28618000 */  slti  $at, $v1, -0x8000
/* 05AD7C 8005A17C 10200003 */  beqz  $at, .L8005A18C
/* 05AD80 8005A180 35080001 */   ori   $t0, (0xFFFF0001 & 0xFFFF) # ori $t0, $t0, 1
/* 05AD84 8005A184 3409FFFF */  li    $t1, 65535
/* 05AD88 8005A188 00691821 */  addu  $v1, $v1, $t1
.L8005A18C:
/* 05AD8C 8005A18C 44838000 */  mtc1  $v1, $f16
/* 05AD90 8005A190 3409FFFF */  li    $t1, 65535
/* 05AD94 8005A194 468084A0 */  cvt.s.w $f18, $f16
/* 05AD98 8005A198 46029102 */  mul.s $f4, $f18, $f2
/* 05AD9C 8005A19C 4459F800 */  cfc1  $t9, $31
/* 05ADA0 8005A1A0 00000000 */  nop   
/* 05ADA4 8005A1A4 37210003 */  ori   $at, $t9, 3
/* 05ADA8 8005A1A8 38210002 */  xori  $at, $at, 2
/* 05ADAC 8005A1AC 44C1F800 */  ctc1  $at, $31
/* 05ADB0 8005A1B0 00000000 */  nop   
/* 05ADB4 8005A1B4 460021A4 */  cvt.w.s $f6, $f4
/* 05ADB8 8005A1B8 440F3000 */  mfc1  $t7, $f6
/* 05ADBC 8005A1BC 44D9F800 */  ctc1  $t9, $31
/* 05ADC0 8005A1C0 008FC821 */  addu  $t9, $a0, $t7
/* 05ADC4 8005A1C4 A6190000 */  sh    $t9, ($s0)
/* 05ADC8 8005A1C8 84450008 */  lh    $a1, 8($v0)
/* 05ADCC 8005A1CC 84D80008 */  lh    $t8, 8($a2)
/* 05ADD0 8005A1D0 30AEFFFF */  andi  $t6, $a1, 0xffff
/* 05ADD4 8005A1D4 030E1823 */  subu  $v1, $t8, $t6
/* 05ADD8 8005A1D8 0067082A */  slt   $at, $v1, $a3
/* 05ADDC 8005A1DC 14200003 */  bnez  $at, .L8005A1EC
/* 05ADE0 8005A1E0 28618000 */   slti  $at, $v1, -0x8000
/* 05ADE4 8005A1E4 00681821 */  addu  $v1, $v1, $t0
/* 05ADE8 8005A1E8 28618000 */  slti  $at, $v1, -0x8000
.L8005A1EC:
/* 05ADEC 8005A1EC 10200002 */  beqz  $at, .L8005A1F8
/* 05ADF0 8005A1F0 00000000 */   nop   
/* 05ADF4 8005A1F4 00691821 */  addu  $v1, $v1, $t1
.L8005A1F8:
/* 05ADF8 8005A1F8 44834000 */  mtc1  $v1, $f8
/* 05ADFC 8005A1FC 00000000 */  nop   
/* 05AE00 8005A200 468042A0 */  cvt.s.w $f10, $f8
/* 05AE04 8005A204 46025402 */  mul.s $f16, $f10, $f2
/* 05AE08 8005A208 444FF800 */  cfc1  $t7, $31
/* 05AE0C 8005A20C 00000000 */  nop   
/* 05AE10 8005A210 35E10003 */  ori   $at, $t7, 3
/* 05AE14 8005A214 38210002 */  xori  $at, $at, 2
/* 05AE18 8005A218 44C1F800 */  ctc1  $at, $31
/* 05AE1C 8005A21C 00000000 */  nop   
/* 05AE20 8005A220 460084A4 */  cvt.w.s $f18, $f16
/* 05AE24 8005A224 440E9000 */  mfc1  $t6, $f18
/* 05AE28 8005A228 44CFF800 */  ctc1  $t7, $31
/* 05AE2C 8005A22C 00AE7821 */  addu  $t7, $a1, $t6
/* 05AE30 8005A230 A60F0002 */  sh    $t7, 2($s0)
/* 05AE34 8005A234 84440006 */  lh    $a0, 6($v0)
/* 05AE38 8005A238 84D90006 */  lh    $t9, 6($a2)
/* 05AE3C 8005A23C 3098FFFF */  andi  $t8, $a0, 0xffff
/* 05AE40 8005A240 03381823 */  subu  $v1, $t9, $t8
/* 05AE44 8005A244 0067082A */  slt   $at, $v1, $a3
/* 05AE48 8005A248 14200003 */  bnez  $at, .L8005A258
/* 05AE4C 8005A24C 28618000 */   slti  $at, $v1, -0x8000
/* 05AE50 8005A250 00681821 */  addu  $v1, $v1, $t0
/* 05AE54 8005A254 28618000 */  slti  $at, $v1, -0x8000
.L8005A258:
/* 05AE58 8005A258 10200002 */  beqz  $at, .L8005A264
/* 05AE5C 8005A25C 00000000 */   nop   
/* 05AE60 8005A260 00691821 */  addu  $v1, $v1, $t1
.L8005A264:
/* 05AE64 8005A264 44832000 */  mtc1  $v1, $f4
/* 05AE68 8005A268 C60C000C */  lwc1  $f12, 0xc($s0)
/* 05AE6C 8005A26C 468021A0 */  cvt.s.w $f6, $f4
/* 05AE70 8005A270 C60E0010 */  lwc1  $f14, 0x10($s0)
/* 05AE74 8005A274 8E060014 */  lw    $a2, 0x14($s0)
/* 05AE78 8005A278 46023202 */  mul.s $f8, $f6, $f2
/* 05AE7C 8005A27C AE000074 */  sw    $zero, 0x74($s0)
/* 05AE80 8005A280 444EF800 */  cfc1  $t6, $31
/* 05AE84 8005A284 00000000 */  nop   
/* 05AE88 8005A288 35C10003 */  ori   $at, $t6, 3
/* 05AE8C 8005A28C 38210002 */  xori  $at, $at, 2
/* 05AE90 8005A290 44C1F800 */  ctc1  $at, $31
/* 05AE94 8005A294 00000000 */  nop   
/* 05AE98 8005A298 460042A4 */  cvt.w.s $f10, $f8
/* 05AE9C 8005A29C 44185000 */  mfc1  $t8, $f10
/* 05AEA0 8005A2A0 44CEF800 */  ctc1  $t6, $31
/* 05AEA4 8005A2A4 00987021 */  addu  $t6, $a0, $t8
/* 05AEA8 8005A2A8 A60E0004 */  sh    $t6, 4($s0)
/* 05AEAC 8005A2AC E7A20094 */  swc1  $f2, 0x94($sp)
/* 05AEB0 8005A2B0 0C00A7C6 */  jal   get_level_segment_index_from_position
/* 05AEB4 8005A2B4 AFAD004C */   sw    $t5, 0x4c($sp)
/* 05AEB8 8005A2B8 8FAD004C */  lw    $t5, 0x4c($sp)
/* 05AEBC 8005A2BC C7A20094 */  lwc1  $f2, 0x94($sp)
/* 05AEC0 8005A2C0 A602002E */  sh    $v0, 0x2e($s0)
/* 05AEC4 8005A2C4 8FAF0060 */  lw    $t7, 0x60($sp)
/* 05AEC8 8005A2C8 3C01800E */  lui   $at, %hi(D_800E6938 + 4) # $at, 0x800e
/* 05AECC 8005A2CC 25F90003 */  addiu $t9, $t7, 3
/* 05AED0 8005A2D0 15B90033 */  bne   $t5, $t9, .L8005A3A0
/* 05AED4 8005A2D4 24020001 */   li    $v0, 1
/* 05AED8 8005A2D8 C42D6938 */  lwc1  $f13, %lo(D_800E6938)($at)
/* 05AEDC 8005A2DC C42C693C */  lwc1  $f12, %lo(D_800E6938 + 4)($at)
/* 05AEE0 8005A2E0 46001021 */  cvt.d.s $f0, $f2
/* 05AEE4 8005A2E4 4620603E */  c.le.d $f12, $f0
/* 05AEE8 8005A2E8 8E020064 */  lw    $v0, 0x64($s0)
/* 05AEEC 8005A2EC 45000003 */  bc1f  .L8005A2FC
/* 05AEF0 8005A2F0 3C014058 */   li    $at, 0x40580000 # 3.375000
/* 05AEF4 8005A2F4 10000029 */  b     .L8005A39C
/* 05AEF8 8005A2F8 A04001F7 */   sb    $zero, 0x1f7($v0)
.L8005A2FC:
/* 05AEFC 8005A2FC 46206401 */  sub.d $f16, $f12, $f0
/* 05AF00 8005A300 44819800 */  mtc1  $at, $f19
/* 05AF04 8005A304 44809000 */  mtc1  $zero, $f18
/* 05AF08 8005A308 240E0001 */  li    $t6, 1
/* 05AF0C 8005A30C 46328102 */  mul.d $f4, $f16, $f18
/* 05AF10 8005A310 3C0141E0 */  li    $at, 0x41E00000 # 28.000000
/* 05AF14 8005A314 4458F800 */  cfc1  $t8, $31
/* 05AF18 8005A318 44CEF800 */  ctc1  $t6, $31
/* 05AF1C 8005A31C 00000000 */  nop   
/* 05AF20 8005A320 462021A4 */  cvt.w.d $f6, $f4
/* 05AF24 8005A324 444EF800 */  cfc1  $t6, $31
/* 05AF28 8005A328 00000000 */  nop   
/* 05AF2C 8005A32C 31CE0078 */  andi  $t6, $t6, 0x78
/* 05AF30 8005A330 11C00013 */  beqz  $t6, .L8005A380
/* 05AF34 8005A334 00000000 */   nop   
/* 05AF38 8005A338 44813800 */  mtc1  $at, $f7
/* 05AF3C 8005A33C 44803000 */  mtc1  $zero, $f6
/* 05AF40 8005A340 240E0001 */  li    $t6, 1
/* 05AF44 8005A344 46262181 */  sub.d $f6, $f4, $f6
/* 05AF48 8005A348 3C018000 */  lui   $at, 0x8000
/* 05AF4C 8005A34C 44CEF800 */  ctc1  $t6, $31
/* 05AF50 8005A350 00000000 */  nop   
/* 05AF54 8005A354 462031A4 */  cvt.w.d $f6, $f6
/* 05AF58 8005A358 444EF800 */  cfc1  $t6, $31
/* 05AF5C 8005A35C 00000000 */  nop   
/* 05AF60 8005A360 31CE0078 */  andi  $t6, $t6, 0x78
/* 05AF64 8005A364 15C00004 */  bnez  $t6, .L8005A378
/* 05AF68 8005A368 00000000 */   nop   
/* 05AF6C 8005A36C 440E3000 */  mfc1  $t6, $f6
/* 05AF70 8005A370 10000007 */  b     .L8005A390
/* 05AF74 8005A374 01C17025 */   or    $t6, $t6, $at
.L8005A378:
/* 05AF78 8005A378 10000005 */  b     .L8005A390
/* 05AF7C 8005A37C 240EFFFF */   li    $t6, -1
.L8005A380:
/* 05AF80 8005A380 440E3000 */  mfc1  $t6, $f6
/* 05AF84 8005A384 00000000 */  nop   
/* 05AF88 8005A388 05C0FFFB */  bltz  $t6, .L8005A378
/* 05AF8C 8005A38C 00000000 */   nop   
.L8005A390:
/* 05AF90 8005A390 44D8F800 */  ctc1  $t8, $31
/* 05AF94 8005A394 A04E01F7 */  sb    $t6, 0x1f7($v0)
/* 05AF98 8005A398 00000000 */  nop   
.L8005A39C:
/* 05AF9C 8005A39C 24020001 */  li    $v0, 1
.L8005A3A0:
/* 05AFA0 8005A3A0 8FBF001C */  lw    $ra, 0x1c($sp)
/* 05AFA4 8005A3A4 8FB00018 */  lw    $s0, 0x18($sp)
/* 05AFA8 8005A3A8 03E00008 */  jr    $ra
/* 05AFAC 8005A3AC 27BD0098 */   addiu $sp, $sp, 0x98

