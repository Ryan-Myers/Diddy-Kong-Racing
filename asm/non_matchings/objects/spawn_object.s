.late_rodata
glabel jpt_800E51B4
.word L8000ECD8, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000ED98, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000ECF4, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000ED10, L8000EDE0, L8000EDE0, L8000EDE0, L8000ED40, L8000EDE0, L8000EDE0, L8000EDE0, L8000EDE0, L8000ED54

.text
glabel spawn_object
/* 00F654 8000EA54 27BDFF98 */  addiu $sp, $sp, -0x68
/* 00F658 8000EA58 AFBF0024 */  sw    $ra, 0x24($sp)
/* 00F65C 8000EA5C AFB30020 */  sw    $s3, 0x20($sp)
/* 00F660 8000EA60 AFB2001C */  sw    $s2, 0x1c($sp)
/* 00F664 8000EA64 AFB10018 */  sw    $s1, 0x18($sp)
/* 00F668 8000EA68 AFB00014 */  sw    $s0, 0x14($sp)
/* 00F66C 8000EA6C AFA40068 */  sw    $a0, 0x68($sp)
/* 00F670 8000EA70 0C01BAA4 */  jal   get_settings
/* 00F674 8000EA74 AFA5006C */   sw    $a1, 0x6c($sp)
/* 00F678 8000EA78 8FA30068 */  lw    $v1, 0x68($sp)
/* 00F67C 8000EA7C 00408825 */  move  $s1, $v0
/* 00F680 8000EA80 906F0001 */  lbu   $t7, 1($v1)
/* 00F684 8000EA84 906E0000 */  lbu   $t6, ($v1)
/* 00F688 8000EA88 31F80080 */  andi  $t8, $t7, 0x80
/* 00F68C 8000EA8C 0018C840 */  sll   $t9, $t8, 1
/* 00F690 8000EA90 01D92825 */  or    $a1, $t6, $t9
/* 00F694 8000EA94 AFA50064 */  sw    $a1, 0x64($sp)
/* 00F698 8000EA98 0C02DDAE */  jal   update_object_stack_trace
/* 00F69C 8000EA9C 00002025 */   move  $a0, $zero
/* 00F6A0 8000EAA0 8FA3006C */  lw    $v1, 0x6c($sp)
/* 00F6A4 8000EAA4 3C0F8012 */  lui   $t7, %hi(gAssetsObjectHeadersTableLength) # $t7, 0x8012
/* 00F6A8 8000EAA8 30680002 */  andi  $t0, $v1, 2
/* 00F6AC 8000EAAC 11000004 */  beqz  $t0, .L8000EAC0
/* 00F6B0 8000EAB0 01001825 */   move  $v1, $t0
/* 00F6B4 8000EAB4 87A40066 */  lh    $a0, 0x66($sp)
/* 00F6B8 8000EAB8 10000009 */  b     .L8000EAE0
/* 00F6BC 8000EABC 00000000 */   nop   
.L8000EAC0:
/* 00F6C0 8000EAC0 8FAA0064 */  lw    $t2, 0x64($sp)
/* 00F6C4 8000EAC4 3C098012 */  lui   $t1, %hi(gAssetsLvlObjTranslationTable) # $t1, 0x8012
/* 00F6C8 8000EAC8 8D29AEB8 */  lw    $t1, %lo(gAssetsLvlObjTranslationTable)($t1)
/* 00F6CC 8000EACC 000A5840 */  sll   $t3, $t2, 1
/* 00F6D0 8000EAD0 012B6021 */  addu  $t4, $t1, $t3
/* 00F6D4 8000EAD4 85840000 */  lh    $a0, ($t4)
/* 00F6D8 8000EAD8 00000000 */  nop   
/* 00F6DC 8000EADC A7A4004E */  sh    $a0, 0x4e($sp)
.L8000EAE0:
/* 00F6E0 8000EAE0 8DEFAD68 */  lw    $t7, %lo(gAssetsObjectHeadersTableLength)($t7)
/* 00F6E4 8000EAE4 00008025 */  move  $s0, $zero
/* 00F6E8 8000EAE8 008F082A */  slt   $at, $a0, $t7
/* 00F6EC 8000EAEC 14200002 */  bnez  $at, .L8000EAF8
/* 00F6F0 8000EAF0 3C028012 */   lui   $v0, %hi(gSpawnObjectHeap) # $v0, 0x8012
/* 00F6F4 8000EAF4 00002025 */  move  $a0, $zero
.L8000EAF8:
/* 00F6F8 8000EAF8 2442AD58 */  addiu $v0, %lo(gSpawnObjectHeap) # addiu $v0, $v0, -0x52a8
.L8000EAFC:
/* 00F6FC 8000EAFC 8C580000 */  lw    $t8, ($v0)
/* 00F700 8000EB00 00000000 */  nop   
/* 00F704 8000EB04 03107021 */  addu  $t6, $t8, $s0
/* 00F708 8000EB08 26100004 */  addiu $s0, $s0, 4
/* 00F70C 8000EB0C 2A010800 */  slti  $at, $s0, 0x800
/* 00F710 8000EB10 1420FFFA */  bnez  $at, .L8000EAFC
/* 00F714 8000EB14 ADC00000 */   sw    $zero, ($t6)
/* 00F718 8000EB18 8C520000 */  lw    $s2, ($v0)
/* 00F71C 8000EB1C 24190002 */  li    $t9, 2
/* 00F720 8000EB20 A6590006 */  sh    $t9, 6($s2)
/* 00F724 8000EB24 A7A4004E */  sh    $a0, 0x4e($sp)
/* 00F728 8000EB28 0C0031C6 */  jal   load_object_header
/* 00F72C 8000EB2C AFA3002C */   sw    $v1, 0x2c($sp)
/* 00F730 8000EB30 14400003 */  bnez  $v0, .L8000EB40
/* 00F734 8000EB34 AE420040 */   sw    $v0, 0x40($s2)
/* 00F738 8000EB38 100002BC */  b     .L8000F62C
/* 00F73C 8000EB3C 00001025 */   move  $v0, $zero
.L8000EB40:
/* 00F740 8000EB40 8E500040 */  lw    $s0, 0x40($s2)
/* 00F744 8000EB44 00000000 */  nop   
/* 00F748 8000EB48 96080030 */  lhu   $t0, 0x30($s0)
/* 00F74C 8000EB4C 00000000 */  nop   
/* 00F750 8000EB50 310A0080 */  andi  $t2, $t0, 0x80
/* 00F754 8000EB54 11400005 */  beqz  $t2, .L8000EB6C
/* 00F758 8000EB58 00000000 */   nop   
/* 00F75C 8000EB5C 86490006 */  lh    $t1, 6($s2)
/* 00F760 8000EB60 8E500040 */  lw    $s0, 0x40($s2)
/* 00F764 8000EB64 352B0080 */  ori   $t3, $t1, 0x80
/* 00F768 8000EB68 A64B0006 */  sh    $t3, 6($s2)
.L8000EB6C:
/* 00F76C 8000EB6C 820C0054 */  lb    $t4, 0x54($s0)
/* 00F770 8000EB70 24010063 */  li    $at, 99
/* 00F774 8000EB74 1581000B */  bne   $t4, $at, .L8000EBA4
/* 00F778 8000EB78 8FA20068 */   lw    $v0, 0x68($sp)
/* 00F77C 8000EB7C 8E2D0010 */  lw    $t5, 0x10($s1)
/* 00F780 8000EB80 00002025 */  move  $a0, $zero
/* 00F784 8000EB84 31AF0001 */  andi  $t7, $t5, 1
/* 00F788 8000EB88 11E00006 */  beqz  $t7, .L8000EBA4
/* 00F78C 8000EB8C 8FA20068 */   lw    $v0, 0x68($sp)
/* 00F790 8000EB90 0C02DDAE */  jal   update_object_stack_trace
/* 00F794 8000EB94 2405FFFF */   li    $a1, -1
/* 00F798 8000EB98 100002A4 */  b     .L8000F62C
/* 00F79C 8000EB9C 00001025 */   move  $v0, $zero
/* 00F7A0 8000EBA0 8FA20068 */  lw    $v0, 0x68($sp)
.L8000EBA4:
/* 00F7A4 8000EBA4 00000000 */  nop   
/* 00F7A8 8000EBA8 84580002 */  lh    $t8, 2($v0)
/* 00F7AC 8000EBAC 00000000 */  nop   
/* 00F7B0 8000EBB0 44982000 */  mtc1  $t8, $f4
/* 00F7B4 8000EBB4 00000000 */  nop   
/* 00F7B8 8000EBB8 468021A0 */  cvt.s.w $f6, $f4
/* 00F7BC 8000EBBC E646000C */  swc1  $f6, 0xc($s2)
/* 00F7C0 8000EBC0 844E0004 */  lh    $t6, 4($v0)
/* 00F7C4 8000EBC4 C64C000C */  lwc1  $f12, 0xc($s2)
/* 00F7C8 8000EBC8 448E4000 */  mtc1  $t6, $f8
/* 00F7CC 8000EBCC 00000000 */  nop   
/* 00F7D0 8000EBD0 468042A0 */  cvt.s.w $f10, $f8
/* 00F7D4 8000EBD4 E64A0010 */  swc1  $f10, 0x10($s2)
/* 00F7D8 8000EBD8 84590006 */  lh    $t9, 6($v0)
/* 00F7DC 8000EBDC C64E0010 */  lwc1  $f14, 0x10($s2)
/* 00F7E0 8000EBE0 44998000 */  mtc1  $t9, $f16
/* 00F7E4 8000EBE4 00000000 */  nop   
/* 00F7E8 8000EBE8 468084A0 */  cvt.s.w $f18, $f16
/* 00F7EC 8000EBEC E6520014 */  swc1  $f18, 0x14($s2)
/* 00F7F0 8000EBF0 8E460014 */  lw    $a2, 0x14($s2)
/* 00F7F4 8000EBF4 0C00A7C6 */  jal   get_level_segment_index_from_position
/* 00F7F8 8000EBF8 00000000 */   nop   
/* 00F7FC 8000EBFC A642002E */  sh    $v0, 0x2e($s2)
/* 00F800 8000EC00 87A8004E */  lh    $t0, 0x4e($sp)
/* 00F804 8000EC04 00000000 */  nop   
/* 00F808 8000EC08 A648002C */  sh    $t0, 0x2c($s2)
/* 00F80C 8000EC0C 8FAA0068 */  lw    $t2, 0x68($sp)
/* 00F810 8000EC10 00000000 */  nop   
/* 00F814 8000EC14 AE4A003C */  sw    $t2, 0x3c($s2)
/* 00F818 8000EC18 8FA90064 */  lw    $t1, 0x64($sp)
/* 00F81C 8000EC1C 00000000 */  nop   
/* 00F820 8000EC20 A649004A */  sh    $t1, 0x4a($s2)
/* 00F824 8000EC24 87A40066 */  lh    $a0, 0x66($sp)
/* 00F828 8000EC28 0C00916D */  jal   func_800245B4
/* 00F82C 8000EC2C 00000000 */   nop   
/* 00F830 8000EC30 8E500040 */  lw    $s0, 0x40($s2)
/* 00F834 8000EC34 240C00FF */  li    $t4, 255
/* 00F838 8000EC38 C604000C */  lwc1  $f4, 0xc($s0)
/* 00F83C 8000EC3C 00000000 */  nop   
/* 00F840 8000EC40 E6440008 */  swc1  $f4, 8($s2)
/* 00F844 8000EC44 860B0050 */  lh    $t3, 0x50($s0)
/* 00F848 8000EC48 C64A0008 */  lwc1  $f10, 8($s2)
/* 00F84C 8000EC4C 448B3000 */  mtc1  $t3, $f6
/* 00F850 8000EC50 A24C0039 */  sb    $t4, 0x39($s2)
/* 00F854 8000EC54 46803220 */  cvt.s.w $f8, $f6
/* 00F858 8000EC58 460A4402 */  mul.s $f16, $f8, $f10
/* 00F85C 8000EC5C E6500034 */  swc1  $f16, 0x34($s2)
/* 00F860 8000EC60 82040054 */  lb    $a0, 0x54($s0)
/* 00F864 8000EC64 0C008F8C */  jal   obj_init_property_flags
/* 00F868 8000EC68 00000000 */   nop   
/* 00F86C 8000EC6C AFA20050 */  sw    $v0, 0x50($sp)
/* 00F870 8000EC70 8E500040 */  lw    $s0, 0x40($s2)
/* 00F874 8000EC74 8FA7006C */  lw    $a3, 0x6c($sp)
/* 00F878 8000EC78 820D0052 */  lb    $t5, 0x52($s0)
/* 00F87C 8000EC7C 264E0080 */  addiu $t6, $s2, 0x80
/* 00F880 8000EC80 25AF0001 */  addiu $t7, $t5, 1
/* 00F884 8000EC84 A20F0052 */  sb    $t7, 0x52($s0)
/* 00F888 8000EC88 8E500040 */  lw    $s0, 0x40($s2)
/* 00F88C 8000EC8C 30F90010 */  andi  $t9, $a3, 0x10
/* 00F890 8000EC90 82180053 */  lb    $t8, 0x53($s0)
/* 00F894 8000EC94 82130055 */  lb    $s3, 0x55($s0)
/* 00F898 8000EC98 AFB80064 */  sw    $t8, 0x64($sp)
/* 00F89C 8000EC9C 13200002 */  beqz  $t9, .L8000ECA8
/* 00F8A0 8000ECA0 AE4E0068 */   sw    $t6, 0x68($s2)
/* 00F8A4 8000ECA4 24130001 */  li    $s3, 1
.L8000ECA8:
/* 00F8A8 8000ECA8 82080054 */  lb    $t0, 0x54($s0)
/* 00F8AC 8000ECAC 00003025 */  move  $a2, $zero
/* 00F8B0 8000ECB0 250AFFC2 */  addiu $t2, $t0, -0x3e
/* 00F8B4 8000ECB4 2D410027 */  sltiu $at, $t2, 0x27
/* 00F8B8 8000ECB8 10200049 */  beqz  $at, .L8000EDE0
/* 00F8BC 8000ECBC 000A5080 */   sll   $t2, $t2, 2
/* 00F8C0 8000ECC0 3C01800E */  lui   $at, %hi(jpt_800E51B4) # $at, 0x800e
/* 00F8C4 8000ECC4 002A0821 */  addu  $at, $at, $t2
/* 00F8C8 8000ECC8 8C2A51B4 */  lw    $t2, %lo(jpt_800E51B4)($at)
/* 00F8CC 8000ECCC 00000000 */  nop   
/* 00F8D0 8000ECD0 01400008 */  jr    $t2
/* 00F8D4 8000ECD4 00000000 */   nop   
glabel L8000ECD8
/* 00F8D8 8000ECD8 24040007 */  li    $a0, 7
/* 00F8DC 8000ECDC 0C01867D */  jal   func_800619F4
/* 00F8E0 8000ECE0 AFA6005C */   sw    $a2, 0x5c($sp)
/* 00F8E4 8000ECE4 8FA6005C */  lw    $a2, 0x5c($sp)
/* 00F8E8 8000ECE8 8FA7006C */  lw    $a3, 0x6c($sp)
/* 00F8EC 8000ECEC 1000003D */  b     .L8000EDE4
/* 00F8F0 8000ECF0 8FAF002C */   lw    $t7, 0x2c($sp)
glabel L8000ECF4
/* 00F8F4 8000ECF4 0C02708A */  jal   get_character_id_from_slot
/* 00F8F8 8000ECF8 00002025 */   move  $a0, $zero
/* 00F8FC 8000ECFC A242003A */  sb    $v0, 0x3a($s2)
/* 00F900 8000ED00 8FA7006C */  lw    $a3, 0x6c($sp)
/* 00F904 8000ED04 00403025 */  move  $a2, $v0
/* 00F908 8000ED08 10000035 */  b     .L8000EDE0
/* 00F90C 8000ED0C 24530001 */   addiu $s3, $v0, 1
glabel L8000ED10
/* 00F910 8000ED10 922B0048 */  lbu   $t3, 0x48($s1)
/* 00F914 8000ED14 9629000E */  lhu   $t1, 0xe($s1)
/* 00F918 8000ED18 256CFFFF */  addiu $t4, $t3, -1
/* 00F91C 8000ED1C 000C6840 */  sll   $t5, $t4, 1
/* 00F920 8000ED20 01A93007 */  srav  $a2, $t1, $t5
/* 00F924 8000ED24 30CF0003 */  andi  $t7, $a2, 3
/* 00F928 8000ED28 11E0002D */  beqz  $t7, .L8000EDE0
/* 00F92C 8000ED2C 01E03025 */   move  $a2, $t7
/* 00F930 8000ED30 25E6FFFF */  addiu $a2, $t7, -1
/* 00F934 8000ED34 24D30001 */  addiu $s3, $a2, 1
/* 00F938 8000ED38 10000029 */  b     .L8000EDE0
/* 00F93C 8000ED3C A246003A */   sb    $a2, 0x3a($s2)
glabel L8000ED40
/* 00F940 8000ED40 92260017 */  lbu   $a2, 0x17($s1)
/* 00F944 8000ED44 00000000 */  nop   
/* 00F948 8000ED48 24D30001 */  addiu $s3, $a2, 1
/* 00F94C 8000ED4C 10000024 */  b     .L8000EDE0
/* 00F950 8000ED50 A246003A */   sb    $a2, 0x3a($s2)
glabel L8000ED54
/* 00F954 8000ED54 9638000E */  lhu   $t8, 0xe($s1)
/* 00F958 8000ED58 00009825 */  move  $s3, $zero
/* 00F95C 8000ED5C 24020003 */  li    $v0, 3
/* 00F960 8000ED60 AFB80064 */  sw    $t8, 0x64($sp)
.L8000ED64:
/* 00F964 8000ED64 8FAE0064 */  lw    $t6, 0x64($sp)
/* 00F968 8000ED68 8FA80064 */  lw    $t0, 0x64($sp)
/* 00F96C 8000ED6C 31D90003 */  andi  $t9, $t6, 3
/* 00F970 8000ED70 14590002 */  bne   $v0, $t9, .L8000ED7C
/* 00F974 8000ED74 00085083 */   sra   $t2, $t0, 2
/* 00F978 8000ED78 24C60001 */  addiu $a2, $a2, 1
.L8000ED7C:
/* 00F97C 8000ED7C 26730001 */  addiu $s3, $s3, 1
/* 00F980 8000ED80 2A610004 */  slti  $at, $s3, 4
/* 00F984 8000ED84 1420FFF7 */  bnez  $at, .L8000ED64
/* 00F988 8000ED88 AFAA0064 */   sw    $t2, 0x64($sp)
/* 00F98C 8000ED8C A246003A */  sb    $a2, 0x3a($s2)
/* 00F990 8000ED90 10000013 */  b     .L8000EDE0
/* 00F994 8000ED94 24D30001 */   addiu $s3, $a2, 1
glabel L8000ED98
/* 00F998 8000ED98 24130001 */  li    $s3, 1
/* 00F99C 8000ED9C 0C027B1C */  jal   is_in_adventure_two
/* 00F9A0 8000EDA0 AFA6005C */   sw    $a2, 0x5c($sp)
/* 00F9A4 8000EDA4 8FA6005C */  lw    $a2, 0x5c($sp)
/* 00F9A8 8000EDA8 10400008 */  beqz  $v0, .L8000EDCC
/* 00F9AC 8000EDAC 00000000 */   nop   
/* 00F9B0 8000EDB0 8E4B0040 */  lw    $t3, 0x40($s2)
/* 00F9B4 8000EDB4 00000000 */  nop   
/* 00F9B8 8000EDB8 8D620010 */  lw    $v0, 0x10($t3)
/* 00F9BC 8000EDBC 00000000 */  nop   
/* 00F9C0 8000EDC0 8C4C0004 */  lw    $t4, 4($v0)
/* 00F9C4 8000EDC4 00000000 */  nop   
/* 00F9C8 8000EDC8 AC4C0000 */  sw    $t4, ($v0)
.L8000EDCC:
/* 00F9CC 8000EDCC 8E4D0040 */  lw    $t5, 0x40($s2)
/* 00F9D0 8000EDD0 24090001 */  li    $t1, 1
/* 00F9D4 8000EDD4 A1A90055 */  sb    $t1, 0x55($t5)
/* 00F9D8 8000EDD8 8FA7006C */  lw    $a3, 0x6c($sp)
/* 00F9DC 8000EDDC 00000000 */  nop   
.L8000EDE0:
glabel L8000EDE0
/* 00F9E0 8000EDE0 8FAF002C */  lw    $t7, 0x2c($sp)
.L8000EDE4:
/* 00F9E4 8000EDE4 00000000 */  nop   
/* 00F9E8 8000EDE8 15E0004B */  bnez  $t7, .L8000EF18
/* 00F9EC 8000EDEC 8FB80064 */   lw    $t8, 0x64($sp)
/* 00F9F0 8000EDF0 8642004A */  lh    $v0, 0x4a($s2)
/* 00F9F4 8000EDF4 24010019 */  li    $at, 25
/* 00F9F8 8000EDF8 10410016 */  beq   $v0, $at, .L8000EE54
/* 00F9FC 8000EDFC 240100CB */   li    $at, 203
/* 00FA00 8000EE00 14410045 */  bne   $v0, $at, .L8000EF18
/* 00FA04 8000EE04 8FB80064 */   lw    $t8, 0x64($sp)
/* 00FA08 8000EE08 24130001 */  li    $s3, 1
/* 00FA0C 8000EE0C 0C027B1C */  jal   is_in_adventure_two
/* 00FA10 8000EE10 AFA6005C */   sw    $a2, 0x5c($sp)
/* 00FA14 8000EE14 8FA6005C */  lw    $a2, 0x5c($sp)
/* 00FA18 8000EE18 10400008 */  beqz  $v0, .L8000EE3C
/* 00FA1C 8000EE1C 00000000 */   nop   
/* 00FA20 8000EE20 8E580040 */  lw    $t8, 0x40($s2)
/* 00FA24 8000EE24 00000000 */  nop   
/* 00FA28 8000EE28 8F020010 */  lw    $v0, 0x10($t8)
/* 00FA2C 8000EE2C 00000000 */  nop   
/* 00FA30 8000EE30 8C4E0004 */  lw    $t6, 4($v0)
/* 00FA34 8000EE34 00000000 */  nop   
/* 00FA38 8000EE38 AC4E0000 */  sw    $t6, ($v0)
.L8000EE3C:
/* 00FA3C 8000EE3C 8E480040 */  lw    $t0, 0x40($s2)
/* 00FA40 8000EE40 24190001 */  li    $t9, 1
/* 00FA44 8000EE44 A1190055 */  sb    $t9, 0x55($t0)
/* 00FA48 8000EE48 8FA7006C */  lw    $a3, 0x6c($sp)
/* 00FA4C 8000EE4C 10000032 */  b     .L8000EF18
/* 00FA50 8000EE50 8FB80064 */   lw    $t8, 0x64($sp)
.L8000EE54:
/* 00FA54 8000EE54 0C027B1C */  jal   is_in_adventure_two
/* 00FA58 8000EE58 00000000 */   nop   
/* 00FA5C 8000EE5C 10400028 */  beqz  $v0, .L8000EF00
/* 00FA60 8000EE60 24130005 */   li    $s3, 5
/* 00FA64 8000EE64 8E4A0040 */  lw    $t2, 0x40($s2)
/* 00FA68 8000EE68 24060001 */  li    $a2, 1
/* 00FA6C 8000EE6C 8D420010 */  lw    $v0, 0x10($t2)
/* 00FA70 8000EE70 00068080 */  sll   $s0, $a2, 2
/* 00FA74 8000EE74 8C4B0014 */  lw    $t3, 0x14($v0)
/* 00FA78 8000EE78 00000000 */  nop   
/* 00FA7C 8000EE7C AC4B0000 */  sw    $t3, ($v0)
/* 00FA80 8000EE80 8E4C0040 */  lw    $t4, 0x40($s2)
/* 00FA84 8000EE84 00000000 */  nop   
/* 00FA88 8000EE88 8D890010 */  lw    $t1, 0x10($t4)
/* 00FA8C 8000EE8C 00000000 */  nop   
/* 00FA90 8000EE90 01301021 */  addu  $v0, $t1, $s0
/* 00FA94 8000EE94 8C4D0014 */  lw    $t5, 0x14($v0)
/* 00FA98 8000EE98 00000000 */  nop   
/* 00FA9C 8000EE9C AC4D0000 */  sw    $t5, ($v0)
/* 00FAA0 8000EEA0 8E4F0040 */  lw    $t7, 0x40($s2)
/* 00FAA4 8000EEA4 00000000 */  nop   
/* 00FAA8 8000EEA8 8DF80010 */  lw    $t8, 0x10($t7)
/* 00FAAC 8000EEAC 00000000 */  nop   
/* 00FAB0 8000EEB0 03101021 */  addu  $v0, $t8, $s0
/* 00FAB4 8000EEB4 8C4E0018 */  lw    $t6, 0x18($v0)
/* 00FAB8 8000EEB8 00000000 */  nop   
/* 00FABC 8000EEBC AC4E0004 */  sw    $t6, 4($v0)
/* 00FAC0 8000EEC0 8E590040 */  lw    $t9, 0x40($s2)
/* 00FAC4 8000EEC4 00000000 */  nop   
/* 00FAC8 8000EEC8 8F280010 */  lw    $t0, 0x10($t9)
/* 00FACC 8000EECC 00000000 */  nop   
/* 00FAD0 8000EED0 01101021 */  addu  $v0, $t0, $s0
/* 00FAD4 8000EED4 8C4A001C */  lw    $t2, 0x1c($v0)
/* 00FAD8 8000EED8 00000000 */  nop   
/* 00FADC 8000EEDC AC4A0008 */  sw    $t2, 8($v0)
/* 00FAE0 8000EEE0 8E4B0040 */  lw    $t3, 0x40($s2)
/* 00FAE4 8000EEE4 00000000 */  nop   
/* 00FAE8 8000EEE8 8D6C0010 */  lw    $t4, 0x10($t3)
/* 00FAEC 8000EEEC 00000000 */  nop   
/* 00FAF0 8000EEF0 01901021 */  addu  $v0, $t4, $s0
/* 00FAF4 8000EEF4 8C490020 */  lw    $t1, 0x20($v0)
/* 00FAF8 8000EEF8 00000000 */  nop   
/* 00FAFC 8000EEFC AC49000C */  sw    $t1, 0xc($v0)
.L8000EF00:
/* 00FB00 8000EF00 8E4F0040 */  lw    $t7, 0x40($s2)
/* 00FB04 8000EF04 240D0005 */  li    $t5, 5
/* 00FB08 8000EF08 A1ED0055 */  sb    $t5, 0x55($t7)
/* 00FB0C 8000EF0C 8FA7006C */  lw    $a3, 0x6c($sp)
/* 00FB10 8000EF10 00003025 */  move  $a2, $zero
/* 00FB14 8000EF14 8FB80064 */  lw    $t8, 0x64($sp)
.L8000EF18:
/* 00FB18 8000EF18 8FAB0064 */  lw    $t3, 0x64($sp)
/* 00FB1C 8000EF1C 17000033 */  bnez  $t8, .L8000EFEC
/* 00FB20 8000EF20 00001825 */   move  $v1, $zero
/* 00FB24 8000EF24 00D3082A */  slt   $at, $a2, $s3
/* 00FB28 8000EF28 10200066 */  beqz  $at, .L8000F0C4
/* 00FB2C 8000EF2C 00068080 */   sll   $s0, $a2, 2
.L8000EF30:
/* 00FB30 8000EF30 14C00009 */  bnez  $a2, .L8000EF58
/* 00FB34 8000EF34 24D10001 */   addiu $s1, $a2, 1
/* 00FB38 8000EF38 30EE0004 */  andi  $t6, $a3, 4
/* 00FB3C 8000EF3C 11C00007 */  beqz  $t6, .L8000EF5C
/* 00FB40 8000EF40 24010001 */   li    $at, 1
/* 00FB44 8000EF44 8E590068 */  lw    $t9, 0x68($s2)
/* 00FB48 8000EF48 00000000 */  nop   
/* 00FB4C 8000EF4C 03304021 */  addu  $t0, $t9, $s0
/* 00FB50 8000EF50 1000001F */  b     .L8000EFD0
/* 00FB54 8000EF54 AD000000 */   sw    $zero, ($t0)
.L8000EF58:
/* 00FB58 8000EF58 24010001 */  li    $at, 1
.L8000EF5C:
/* 00FB5C 8000EF5C 14C10008 */  bne   $a2, $at, .L8000EF80
/* 00FB60 8000EF60 30EA0008 */   andi  $t2, $a3, 8
/* 00FB64 8000EF64 11400006 */  beqz  $t2, .L8000EF80
/* 00FB68 8000EF68 00000000 */   nop   
/* 00FB6C 8000EF6C 8E4B0068 */  lw    $t3, 0x68($s2)
/* 00FB70 8000EF70 00000000 */  nop   
/* 00FB74 8000EF74 01706021 */  addu  $t4, $t3, $s0
/* 00FB78 8000EF78 10000015 */  b     .L8000EFD0
/* 00FB7C 8000EF7C AD800000 */   sw    $zero, ($t4)
.L8000EF80:
/* 00FB80 8000EF80 8E490040 */  lw    $t1, 0x40($s2)
/* 00FB84 8000EF84 8FA50050 */  lw    $a1, 0x50($sp)
/* 00FB88 8000EF88 8D2D0010 */  lw    $t5, 0x10($t1)
/* 00FB8C 8000EF8C 00000000 */  nop   
/* 00FB90 8000EF90 01B07821 */  addu  $t7, $t5, $s0
/* 00FB94 8000EF94 8DE40000 */  lw    $a0, ($t7)
/* 00FB98 8000EF98 0C017E67 */  jal   object_model_init
/* 00FB9C 8000EF9C A3A30037 */   sb    $v1, 0x37($sp)
/* 00FBA0 8000EFA0 8E580068 */  lw    $t8, 0x68($s2)
/* 00FBA4 8000EFA4 83A30037 */  lb    $v1, 0x37($sp)
/* 00FBA8 8000EFA8 03107021 */  addu  $t6, $t8, $s0
/* 00FBAC 8000EFAC ADC20000 */  sw    $v0, ($t6)
/* 00FBB0 8000EFB0 8E590068 */  lw    $t9, 0x68($s2)
/* 00FBB4 8000EFB4 00000000 */  nop   
/* 00FBB8 8000EFB8 03304021 */  addu  $t0, $t9, $s0
/* 00FBBC 8000EFBC 8D0A0000 */  lw    $t2, ($t0)
/* 00FBC0 8000EFC0 00000000 */  nop   
/* 00FBC4 8000EFC4 15400003 */  bnez  $t2, .L8000EFD4
/* 00FBC8 8000EFC8 8FA7006C */   lw    $a3, 0x6c($sp)
/* 00FBCC 8000EFCC 24030001 */  li    $v1, 1
.L8000EFD0:
/* 00FBD0 8000EFD0 8FA7006C */  lw    $a3, 0x6c($sp)
.L8000EFD4:
/* 00FBD4 8000EFD4 0233082A */  slt   $at, $s1, $s3
/* 00FBD8 8000EFD8 02203025 */  move  $a2, $s1
/* 00FBDC 8000EFDC 1420FFD4 */  bnez  $at, .L8000EF30
/* 00FBE0 8000EFE0 26100004 */   addiu $s0, $s0, 4
/* 00FBE4 8000EFE4 10000037 */  b     .L8000F0C4
/* 00FBE8 8000EFE8 00000000 */   nop   
.L8000EFEC:
/* 00FBEC 8000EFEC 24010004 */  li    $at, 4
/* 00FBF0 8000EFF0 1561001B */  bne   $t3, $at, .L8000F060
/* 00FBF4 8000EFF4 00D3082A */   slt   $at, $a2, $s3
/* 00FBF8 8000EFF8 10200032 */  beqz  $at, .L8000F0C4
/* 00FBFC 8000EFFC 00068080 */   sll   $s0, $a2, 2
.L8000F000:
/* 00FC00 8000F000 8E4C0040 */  lw    $t4, 0x40($s2)
/* 00FC04 8000F004 24D10001 */  addiu $s1, $a2, 1
/* 00FC08 8000F008 8D890010 */  lw    $t1, 0x10($t4)
/* 00FC0C 8000F00C 00000000 */  nop   
/* 00FC10 8000F010 01306821 */  addu  $t5, $t1, $s0
/* 00FC14 8000F014 8DA40000 */  lw    $a0, ($t5)
/* 00FC18 8000F018 0C01EB9D */  jal   load_texture
/* 00FC1C 8000F01C A3A30037 */   sb    $v1, 0x37($sp)
/* 00FC20 8000F020 8E4F0068 */  lw    $t7, 0x68($s2)
/* 00FC24 8000F024 83A30037 */  lb    $v1, 0x37($sp)
/* 00FC28 8000F028 01F0C021 */  addu  $t8, $t7, $s0
/* 00FC2C 8000F02C AF020000 */  sw    $v0, ($t8)
/* 00FC30 8000F030 8E4E0068 */  lw    $t6, 0x68($s2)
/* 00FC34 8000F034 02203025 */  move  $a2, $s1
/* 00FC38 8000F038 01D0C821 */  addu  $t9, $t6, $s0
/* 00FC3C 8000F03C 8F280000 */  lw    $t0, ($t9)
/* 00FC40 8000F040 0233082A */  slt   $at, $s1, $s3
/* 00FC44 8000F044 15000002 */  bnez  $t0, .L8000F050
/* 00FC48 8000F048 00000000 */   nop   
/* 00FC4C 8000F04C 24030001 */  li    $v1, 1
.L8000F050:
/* 00FC50 8000F050 1420FFEB */  bnez  $at, .L8000F000
/* 00FC54 8000F054 26100004 */   addiu $s0, $s0, 4
/* 00FC58 8000F058 1000001A */  b     .L8000F0C4
/* 00FC5C 8000F05C 00000000 */   nop   
.L8000F060:
/* 00FC60 8000F060 00D3082A */  slt   $at, $a2, $s3
/* 00FC64 8000F064 10200017 */  beqz  $at, .L8000F0C4
/* 00FC68 8000F068 00068080 */   sll   $s0, $a2, 2
.L8000F06C:
/* 00FC6C 8000F06C 8E4A0040 */  lw    $t2, 0x40($s2)
/* 00FC70 8000F070 2405000A */  li    $a1, 10
/* 00FC74 8000F074 8D4B0010 */  lw    $t3, 0x10($t2)
/* 00FC78 8000F078 24D10001 */  addiu $s1, $a2, 1
/* 00FC7C 8000F07C 01706021 */  addu  $t4, $t3, $s0
/* 00FC80 8000F080 8D840000 */  lw    $a0, ($t4)
/* 00FC84 8000F084 0C01F04B */  jal   func_8007C12C
/* 00FC88 8000F088 A3A30037 */   sb    $v1, 0x37($sp)
/* 00FC8C 8000F08C 8E490068 */  lw    $t1, 0x68($s2)
/* 00FC90 8000F090 83A30037 */  lb    $v1, 0x37($sp)
/* 00FC94 8000F094 01306821 */  addu  $t5, $t1, $s0
/* 00FC98 8000F098 ADA20000 */  sw    $v0, ($t5)
/* 00FC9C 8000F09C 8E4F0068 */  lw    $t7, 0x68($s2)
/* 00FCA0 8000F0A0 02203025 */  move  $a2, $s1
/* 00FCA4 8000F0A4 01F0C021 */  addu  $t8, $t7, $s0
/* 00FCA8 8000F0A8 8F0E0000 */  lw    $t6, ($t8)
/* 00FCAC 8000F0AC 0233082A */  slt   $at, $s1, $s3
/* 00FCB0 8000F0B0 15C00002 */  bnez  $t6, .L8000F0BC
/* 00FCB4 8000F0B4 00000000 */   nop   
/* 00FCB8 8000F0B8 24030001 */  li    $v1, 1
.L8000F0BC:
/* 00FCBC 8000F0BC 1420FFEB */  bnez  $at, .L8000F06C
/* 00FCC0 8000F0C0 26100004 */   addiu $s0, $s0, 4
.L8000F0C4:
/* 00FCC4 8000F0C4 10600009 */  beqz  $v1, .L8000F0EC
/* 00FCC8 8000F0C8 02402025 */   move  $a0, $s2
/* 00FCCC 8000F0CC 8FA60064 */  lw    $a2, 0x64($sp)
/* 00FCD0 8000F0D0 0C003D92 */  jal   objFreeAssets
/* 00FCD4 8000F0D4 02602825 */   move  $a1, $s3
/* 00FCD8 8000F0D8 87A4004E */  lh    $a0, 0x4e($sp)
/* 00FCDC 8000F0DC 0C003211 */  jal   try_free_object_header
/* 00FCE0 8000F0E0 00000000 */   nop   
/* 00FCE4 8000F0E4 10000151 */  b     .L8000F62C
/* 00FCE8 8000F0E8 00001025 */   move  $v0, $zero
.L8000F0EC:
/* 00FCEC 8000F0EC 8E480040 */  lw    $t0, 0x40($s2)
/* 00FCF0 8000F0F0 8E590068 */  lw    $t9, 0x68($s2)
/* 00FCF4 8000F0F4 810A0055 */  lb    $t2, 0x55($t0)
/* 00FCF8 8000F0F8 02402025 */  move  $a0, $s2
/* 00FCFC 8000F0FC 000A5880 */  sll   $t3, $t2, 2
/* 00FD00 8000F100 032B2821 */  addu  $a1, $t9, $t3
/* 00FD04 8000F104 0C008D77 */  jal   get_object_property_size
/* 00FD08 8000F108 AFA50048 */   sw    $a1, 0x48($sp)
/* 00FD0C 8000F10C 8FAC0050 */  lw    $t4, 0x50($sp)
/* 00FD10 8000F110 3C018012 */  lui   $at, %hi(D_8011AE50) # $at, 0x8012
/* 00FD14 8000F114 8FA60048 */  lw    $a2, 0x48($sp)
/* 00FD18 8000F118 AC20AE50 */  sw    $zero, %lo(D_8011AE50)($at)
/* 00FD1C 8000F11C 3C018012 */  lui   $at, %hi(D_8011AE54) # $at, 0x8012
/* 00FD20 8000F120 31890001 */  andi  $t1, $t4, 1
/* 00FD24 8000F124 AC20AE54 */  sw    $zero, %lo(D_8011AE54)($at)
/* 00FD28 8000F128 11200008 */  beqz  $t1, .L8000F14C
/* 00FD2C 8000F12C 00C23021 */   addu  $a2, $a2, $v0
/* 00FD30 8000F130 02402025 */  move  $a0, $s2
/* 00FD34 8000F134 00C02825 */  move  $a1, $a2
/* 00FD38 8000F138 0C003DFB */  jal   init_object_shading
/* 00FD3C 8000F13C AFA60048 */   sw    $a2, 0x48($sp)
/* 00FD40 8000F140 8FA60048 */  lw    $a2, 0x48($sp)
/* 00FD44 8000F144 00000000 */  nop   
/* 00FD48 8000F148 00C23021 */  addu  $a2, $a2, $v0
.L8000F14C:
/* 00FD4C 8000F14C 8FAD0050 */  lw    $t5, 0x50($sp)
/* 00FD50 8000F150 02402025 */  move  $a0, $s2
/* 00FD54 8000F154 31AF0002 */  andi  $t7, $t5, 2
/* 00FD58 8000F158 11E0000F */  beqz  $t7, .L8000F198
/* 00FD5C 8000F15C 00C02825 */   move  $a1, $a2
/* 00FD60 8000F160 0C003EF3 */  jal   init_object_shadow
/* 00FD64 8000F164 AFA60048 */   sw    $a2, 0x48($sp)
/* 00FD68 8000F168 8FA60048 */  lw    $a2, 0x48($sp)
/* 00FD6C 8000F16C 1440000A */  bnez  $v0, .L8000F198
/* 00FD70 8000F170 00C23021 */   addu  $a2, $a2, $v0
/* 00FD74 8000F174 8FA60064 */  lw    $a2, 0x64($sp)
/* 00FD78 8000F178 02402025 */  move  $a0, $s2
/* 00FD7C 8000F17C 0C003D92 */  jal   objFreeAssets
/* 00FD80 8000F180 02602825 */   move  $a1, $s3
/* 00FD84 8000F184 87A4004E */  lh    $a0, 0x4e($sp)
/* 00FD88 8000F188 0C003211 */  jal   try_free_object_header
/* 00FD8C 8000F18C 00000000 */   nop   
/* 00FD90 8000F190 10000126 */  b     .L8000F62C
/* 00FD94 8000F194 00001025 */   move  $v0, $zero
.L8000F198:
/* 00FD98 8000F198 8FB80050 */  lw    $t8, 0x50($sp)
/* 00FD9C 8000F19C 02402025 */  move  $a0, $s2
/* 00FDA0 8000F1A0 330E0004 */  andi  $t6, $t8, 4
/* 00FDA4 8000F1A4 11C00016 */  beqz  $t6, .L8000F200
/* 00FDA8 8000F1A8 00C02825 */   move  $a1, $a2
/* 00FDAC 8000F1AC 0C003F1B */  jal   init_object_water_effect
/* 00FDB0 8000F1B0 AFA60048 */   sw    $a2, 0x48($sp)
/* 00FDB4 8000F1B4 8FA60048 */  lw    $a2, 0x48($sp)
/* 00FDB8 8000F1B8 14400011 */  bnez  $v0, .L8000F200
/* 00FDBC 8000F1BC 00C23021 */   addu  $a2, $a2, $v0
/* 00FDC0 8000F1C0 3C028012 */  lui   $v0, %hi(D_8011AE50) # $v0, 0x8012
/* 00FDC4 8000F1C4 8C42AE50 */  lw    $v0, %lo(D_8011AE50)($v0)
/* 00FDC8 8000F1C8 00000000 */  nop   
/* 00FDCC 8000F1CC 10400004 */  beqz  $v0, .L8000F1E0
/* 00FDD0 8000F1D0 8FA60064 */   lw    $a2, 0x64($sp)
/* 00FDD4 8000F1D4 0C01ECAF */  jal   free_texture
/* 00FDD8 8000F1D8 00402025 */   move  $a0, $v0
/* 00FDDC 8000F1DC 8FA60064 */  lw    $a2, 0x64($sp)
.L8000F1E0:
/* 00FDE0 8000F1E0 02402025 */  move  $a0, $s2
/* 00FDE4 8000F1E4 0C003D92 */  jal   objFreeAssets
/* 00FDE8 8000F1E8 02602825 */   move  $a1, $s3
/* 00FDEC 8000F1EC 87A4004E */  lh    $a0, 0x4e($sp)
/* 00FDF0 8000F1F0 0C003211 */  jal   try_free_object_header
/* 00FDF4 8000F1F4 00000000 */   nop   
/* 00FDF8 8000F1F8 1000010C */  b     .L8000F62C
/* 00FDFC 8000F1FC 00001025 */   move  $v0, $zero
.L8000F200:
/* 00FE00 8000F200 8FA80050 */  lw    $t0, 0x50($sp)
/* 00FE04 8000F204 02402025 */  move  $a0, $s2
/* 00FE08 8000F208 310A0010 */  andi  $t2, $t0, 0x10
/* 00FE0C 8000F20C 11400006 */  beqz  $t2, .L8000F228
/* 00FE10 8000F210 00C02825 */   move  $a1, $a2
/* 00FE14 8000F214 0C003F48 */  jal   init_object_interaction_data
/* 00FE18 8000F218 AFA60048 */   sw    $a2, 0x48($sp)
/* 00FE1C 8000F21C 8FA60048 */  lw    $a2, 0x48($sp)
/* 00FE20 8000F220 00000000 */  nop   
/* 00FE24 8000F224 00C23021 */  addu  $a2, $a2, $v0
.L8000F228:
/* 00FE28 8000F228 8FB90050 */  lw    $t9, 0x50($sp)
/* 00FE2C 8000F22C 02402025 */  move  $a0, $s2
/* 00FE30 8000F230 332B0020 */  andi  $t3, $t9, 0x20
/* 00FE34 8000F234 11600006 */  beqz  $t3, .L8000F250
/* 00FE38 8000F238 00C02825 */   move  $a1, $a2
/* 00FE3C 8000F23C 0C003F4D */  jal   func_8000FD34
/* 00FE40 8000F240 AFA60048 */   sw    $a2, 0x48($sp)
/* 00FE44 8000F244 8FA60048 */  lw    $a2, 0x48($sp)
/* 00FE48 8000F248 00000000 */  nop   
/* 00FE4C 8000F24C 00C23021 */  addu  $a2, $a2, $v0
.L8000F250:
/* 00FE50 8000F250 8E500040 */  lw    $s0, 0x40($s2)
/* 00FE54 8000F254 02402025 */  move  $a0, $s2
/* 00FE58 8000F258 82020056 */  lb    $v0, 0x56($s0)
/* 00FE5C 8000F25C 00000000 */  nop   
/* 00FE60 8000F260 18400006 */  blez  $v0, .L8000F27C
/* 00FE64 8000F264 2841000A */   slti  $at, $v0, 0xa
/* 00FE68 8000F268 10200004 */  beqz  $at, .L8000F27C
/* 00FE6C 8000F26C 00000000 */   nop   
/* 00FE70 8000F270 AE460060 */  sw    $a2, 0x60($s2)
/* 00FE74 8000F274 8E500040 */  lw    $s0, 0x40($s2)
/* 00FE78 8000F278 24C60030 */  addiu $a2, $a2, 0x30
.L8000F27C:
/* 00FE7C 8000F27C 820C0057 */  lb    $t4, 0x57($s0)
/* 00FE80 8000F280 00C02825 */  move  $a1, $a2
/* 00FE84 8000F284 19800006 */  blez  $t4, .L8000F2A0
/* 00FE88 8000F288 00000000 */   nop   
/* 00FE8C 8000F28C 0C003EB1 */  jal   obj_init_emitter
/* 00FE90 8000F290 AFA60048 */   sw    $a2, 0x48($sp)
/* 00FE94 8000F294 8FA60048 */  lw    $a2, 0x48($sp)
/* 00FE98 8000F298 8E500040 */  lw    $s0, 0x40($s2)
/* 00FE9C 8000F29C 00C23021 */  addu  $a2, $a2, $v0
.L8000F2A0:
/* 00FEA0 8000F2A0 8209005A */  lb    $t1, 0x5a($s0)
/* 00FEA4 8000F2A4 3C048012 */  lui   $a0, %hi(gObjectMemoryPool) # $a0, 0x8012
/* 00FEA8 8000F2A8 19200007 */  blez  $t1, .L8000F2C8
/* 00FEAC 8000F2AC 00D22823 */   subu  $a1, $a2, $s2
/* 00FEB0 8000F2B0 AE460070 */  sw    $a2, 0x70($s2)
/* 00FEB4 8000F2B4 820D005A */  lb    $t5, 0x5a($s0)
/* 00FEB8 8000F2B8 00000000 */  nop   
/* 00FEBC 8000F2BC 000D7880 */  sll   $t7, $t5, 2
/* 00FEC0 8000F2C0 00CF3021 */  addu  $a2, $a2, $t7
/* 00FEC4 8000F2C4 00D22823 */  subu  $a1, $a2, $s2
.L8000F2C8:
/* 00FEC8 8000F2C8 8C84AE68 */  lw    $a0, %lo(gObjectMemoryPool)($a0)
/* 00FECC 8000F2CC 00A08825 */  move  $s1, $a1
/* 00FED0 8000F2D0 0C01C3A4 */  jal   allocate_from_pool_containing_slots
/* 00FED4 8000F2D4 02408025 */   move  $s0, $s2
/* 00FED8 8000F2D8 14400018 */  bnez  $v0, .L8000F33C
/* 00FEDC 8000F2DC 00409025 */   move  $s2, $v0
/* 00FEE0 8000F2E0 3C028012 */  lui   $v0, %hi(D_8011AE50) # $v0, 0x8012
/* 00FEE4 8000F2E4 8C42AE50 */  lw    $v0, %lo(D_8011AE50)($v0)
/* 00FEE8 8000F2E8 00000000 */  nop   
/* 00FEEC 8000F2EC 10400003 */  beqz  $v0, .L8000F2FC
/* 00FEF0 8000F2F0 00000000 */   nop   
/* 00FEF4 8000F2F4 0C01ECAF */  jal   free_texture
/* 00FEF8 8000F2F8 00402025 */   move  $a0, $v0
.L8000F2FC:
/* 00FEFC 8000F2FC 3C028012 */  lui   $v0, %hi(D_8011AE54) # $v0, 0x8012
/* 00FF00 8000F300 8C42AE54 */  lw    $v0, %lo(D_8011AE54)($v0)
/* 00FF04 8000F304 00000000 */  nop   
/* 00FF08 8000F308 10400004 */  beqz  $v0, .L8000F31C
/* 00FF0C 8000F30C 8FA60064 */   lw    $a2, 0x64($sp)
/* 00FF10 8000F310 0C01ECAF */  jal   free_texture
/* 00FF14 8000F314 00402025 */   move  $a0, $v0
/* 00FF18 8000F318 8FA60064 */  lw    $a2, 0x64($sp)
.L8000F31C:
/* 00FF1C 8000F31C 02002025 */  move  $a0, $s0
/* 00FF20 8000F320 0C003D92 */  jal   objFreeAssets
/* 00FF24 8000F324 02602825 */   move  $a1, $s3
/* 00FF28 8000F328 87A4004E */  lh    $a0, 0x4e($sp)
/* 00FF2C 8000F32C 0C003211 */  jal   try_free_object_header
/* 00FF30 8000F330 00000000 */   nop   
/* 00FF34 8000F334 100000BD */  b     .L8000F62C
/* 00FF38 8000F338 00001025 */   move  $v0, $zero
.L8000F33C:
/* 00FF3C 8000F33C 3238000F */  andi  $t8, $s1, 0xf
/* 00FF40 8000F340 13000004 */  beqz  $t8, .L8000F354
/* 00FF44 8000F344 00003025 */   move  $a2, $zero
/* 00FF48 8000F348 2401FFF0 */  li    $at, -16
/* 00FF4C 8000F34C 02217024 */  and   $t6, $s1, $at
/* 00FF50 8000F350 25D10010 */  addiu $s1, $t6, 0x10
.L8000F354:
/* 00FF54 8000F354 00114083 */  sra   $t0, $s1, 2
/* 00FF58 8000F358 1900000D */  blez  $t0, .L8000F390
/* 00FF5C 8000F35C 00068080 */   sll   $s0, $a2, 2
/* 00FF60 8000F360 3C058012 */  lui   $a1, %hi(gSpawnObjectHeap) # $a1, 0x8012
/* 00FF64 8000F364 24A5AD58 */  addiu $a1, %lo(gSpawnObjectHeap) # addiu $a1, $a1, -0x52a8
/* 00FF68 8000F368 00501821 */  addu  $v1, $v0, $s0
/* 00FF6C 8000F36C 00082080 */  sll   $a0, $t0, 2
.L8000F370:
/* 00FF70 8000F370 8CAA0000 */  lw    $t2, ($a1)
/* 00FF74 8000F374 24630004 */  addiu $v1, $v1, 4
/* 00FF78 8000F378 0150C821 */  addu  $t9, $t2, $s0
/* 00FF7C 8000F37C 8F2B0000 */  lw    $t3, ($t9)
/* 00FF80 8000F380 26100004 */  addiu $s0, $s0, 4
/* 00FF84 8000F384 0204082A */  slt   $at, $s0, $a0
/* 00FF88 8000F388 1420FFF9 */  bnez  $at, .L8000F370
/* 00FF8C 8000F38C AC6BFFFC */   sw    $t3, -4($v1)
.L8000F390:
/* 00FF90 8000F390 8C430058 */  lw    $v1, 0x58($v0)
/* 00FF94 8000F394 3C058012 */  lui   $a1, %hi(gSpawnObjectHeap) # $a1, 0x8012
/* 00FF98 8000F398 10600005 */  beqz  $v1, .L8000F3B0
/* 00FF9C 8000F39C 24A5AD58 */   addiu $a1, %lo(gSpawnObjectHeap) # addiu $a1, $a1, -0x52a8
/* 00FFA0 8000F3A0 8CA90000 */  lw    $t1, ($a1)
/* 00FFA4 8000F3A4 00436021 */  addu  $t4, $v0, $v1
/* 00FFA8 8000F3A8 01896823 */  subu  $t5, $t4, $t1
/* 00FFAC 8000F3AC AC4D0058 */  sw    $t5, 0x58($v0)
.L8000F3B0:
/* 00FFB0 8000F3B0 8C430050 */  lw    $v1, 0x50($v0)
/* 00FFB4 8000F3B4 02402025 */  move  $a0, $s2
/* 00FFB8 8000F3B8 10600005 */  beqz  $v1, .L8000F3D0
/* 00FFBC 8000F3BC 00003025 */   move  $a2, $zero
/* 00FFC0 8000F3C0 8CB80000 */  lw    $t8, ($a1)
/* 00FFC4 8000F3C4 00437821 */  addu  $t7, $v0, $v1
/* 00FFC8 8000F3C8 01F87023 */  subu  $t6, $t7, $t8
/* 00FFCC 8000F3CC AC4E0050 */  sw    $t6, 0x50($v0)
.L8000F3D0:
/* 00FFD0 8000F3D0 8C430054 */  lw    $v1, 0x54($v0)
/* 00FFD4 8000F3D4 00000000 */  nop   
/* 00FFD8 8000F3D8 10600005 */  beqz  $v1, .L8000F3F0
/* 00FFDC 8000F3DC 00000000 */   nop   
/* 00FFE0 8000F3E0 8CAA0000 */  lw    $t2, ($a1)
/* 00FFE4 8000F3E4 00434021 */  addu  $t0, $v0, $v1
/* 00FFE8 8000F3E8 010AC823 */  subu  $t9, $t0, $t2
/* 00FFEC 8000F3EC AC590054 */  sw    $t9, 0x54($v0)
.L8000F3F0:
/* 00FFF0 8000F3F0 8C430064 */  lw    $v1, 0x64($v0)
/* 00FFF4 8000F3F4 00000000 */  nop   
/* 00FFF8 8000F3F8 10600005 */  beqz  $v1, .L8000F410
/* 00FFFC 8000F3FC 00000000 */   nop   
/* 010000 8000F400 8CAC0000 */  lw    $t4, ($a1)
/* 010004 8000F404 00435821 */  addu  $t3, $v0, $v1
/* 010008 8000F408 016C4823 */  subu  $t1, $t3, $t4
/* 01000C 8000F40C AC490064 */  sw    $t1, 0x64($v0)
.L8000F410:
/* 010010 8000F410 8C43004C */  lw    $v1, 0x4c($v0)
/* 010014 8000F414 00000000 */  nop   
/* 010018 8000F418 10600005 */  beqz  $v1, .L8000F430
/* 01001C 8000F41C 00000000 */   nop   
/* 010020 8000F420 8CAF0000 */  lw    $t7, ($a1)
/* 010024 8000F424 00436821 */  addu  $t5, $v0, $v1
/* 010028 8000F428 01AFC023 */  subu  $t8, $t5, $t7
/* 01002C 8000F42C AC58004C */  sw    $t8, 0x4c($v0)
.L8000F430:
/* 010030 8000F430 8C43005C */  lw    $v1, 0x5c($v0)
/* 010034 8000F434 00000000 */  nop   
/* 010038 8000F438 10600005 */  beqz  $v1, .L8000F450
/* 01003C 8000F43C 00000000 */   nop   
/* 010040 8000F440 8CA80000 */  lw    $t0, ($a1)
/* 010044 8000F444 00437021 */  addu  $t6, $v0, $v1
/* 010048 8000F448 01C85023 */  subu  $t2, $t6, $t0
/* 01004C 8000F44C AC4A005C */  sw    $t2, 0x5c($v0)
.L8000F450:
/* 010050 8000F450 8C430060 */  lw    $v1, 0x60($v0)
/* 010054 8000F454 3C108012 */  lui   $s0, %hi(gObjectCount) # $s0, 0x8012
/* 010058 8000F458 10600005 */  beqz  $v1, .L8000F470
/* 01005C 8000F45C 2610AE5C */   addiu $s0, %lo(gObjectCount) # addiu $s0, $s0, -0x51a4
/* 010060 8000F460 8CAB0000 */  lw    $t3, ($a1)
/* 010064 8000F464 0043C821 */  addu  $t9, $v0, $v1
/* 010068 8000F468 032B6023 */  subu  $t4, $t9, $t3
/* 01006C 8000F46C AC4C0060 */  sw    $t4, 0x60($v0)
.L8000F470:
/* 010070 8000F470 8C430040 */  lw    $v1, 0x40($v0)
/* 010074 8000F474 00000000 */  nop   
/* 010078 8000F478 80690057 */  lb    $t1, 0x57($v1)
/* 01007C 8000F47C 00000000 */  nop   
/* 010080 8000F480 19200007 */  blez  $t1, .L8000F4A0
/* 010084 8000F484 00000000 */   nop   
/* 010088 8000F488 8C4D006C */  lw    $t5, 0x6c($v0)
/* 01008C 8000F48C 8CB80000 */  lw    $t8, ($a1)
/* 010090 8000F490 004D7821 */  addu  $t7, $v0, $t5
/* 010094 8000F494 01F87023 */  subu  $t6, $t7, $t8
/* 010098 8000F498 8C430040 */  lw    $v1, 0x40($v0)
/* 01009C 8000F49C AC4E006C */  sw    $t6, 0x6c($v0)
.L8000F4A0:
/* 0100A0 8000F4A0 8068005A */  lb    $t0, 0x5a($v1)
/* 0100A4 8000F4A4 24490080 */  addiu $t1, $v0, 0x80
/* 0100A8 8000F4A8 19000006 */  blez  $t0, .L8000F4C4
/* 0100AC 8000F4AC 3C0F8012 */   lui   $t7, %hi(gObjPtrList) # $t7, 0x8012
/* 0100B0 8000F4B0 8C4A0070 */  lw    $t2, 0x70($v0)
/* 0100B4 8000F4B4 8CAB0000 */  lw    $t3, ($a1)
/* 0100B8 8000F4B8 004AC821 */  addu  $t9, $v0, $t2
/* 0100BC 8000F4BC 032B6023 */  subu  $t4, $t9, $t3
/* 0100C0 8000F4C0 AC4C0070 */  sw    $t4, 0x70($v0)
.L8000F4C4:
/* 0100C4 8000F4C4 AC490068 */  sw    $t1, 0x68($v0)
/* 0100C8 8000F4C8 8FB1006C */  lw    $s1, 0x6c($sp)
/* 0100CC 8000F4CC 00000000 */  nop   
/* 0100D0 8000F4D0 322D0001 */  andi  $t5, $s1, 1
/* 0100D4 8000F4D4 11A0000A */  beqz  $t5, .L8000F500
/* 0100D8 8000F4D8 01A08825 */   move  $s1, $t5
/* 0100DC 8000F4DC 8E180000 */  lw    $t8, ($s0)
/* 0100E0 8000F4E0 8DEFAE58 */  lw    $t7, %lo(gObjPtrList)($t7)
/* 0100E4 8000F4E4 00187080 */  sll   $t6, $t8, 2
/* 0100E8 8000F4E8 01EE4021 */  addu  $t0, $t7, $t6
/* 0100EC 8000F4EC AD020000 */  sw    $v0, ($t0)
/* 0100F0 8000F4F0 8E0A0000 */  lw    $t2, ($s0)
/* 0100F4 8000F4F4 00000000 */  nop   
/* 0100F8 8000F4F8 25590001 */  addiu $t9, $t2, 1
/* 0100FC 8000F4FC AE190000 */  sw    $t9, ($s0)
.L8000F500:
/* 010100 8000F500 3C108012 */  lui   $s0, %hi(gObjectCount) # $s0, 0x8012
/* 010104 8000F504 8FA50068 */  lw    $a1, 0x68($sp)
/* 010108 8000F508 0C008E2F */  jal   run_object_init_func
/* 01010C 8000F50C 2610AE5C */   addiu $s0, %lo(gObjectCount) # addiu $s0, $s0, -0x51a4
/* 010110 8000F510 8E42004C */  lw    $v0, 0x4c($s2)
/* 010114 8000F514 00000000 */  nop   
/* 010118 8000F518 1040000C */  beqz  $v0, .L8000F54C
/* 01011C 8000F51C 00000000 */   nop   
/* 010120 8000F520 C652000C */  lwc1  $f18, 0xc($s2)
/* 010124 8000F524 00000000 */  nop   
/* 010128 8000F528 E4520004 */  swc1  $f18, 4($v0)
/* 01012C 8000F52C 8E4B004C */  lw    $t3, 0x4c($s2)
/* 010130 8000F530 C6440010 */  lwc1  $f4, 0x10($s2)
/* 010134 8000F534 00000000 */  nop   
/* 010138 8000F538 E5640008 */  swc1  $f4, 8($t3)
/* 01013C 8000F53C 8E4C004C */  lw    $t4, 0x4c($s2)
/* 010140 8000F540 C6460014 */  lwc1  $f6, 0x14($s2)
/* 010144 8000F544 00000000 */  nop   
/* 010148 8000F548 E586000C */  swc1  $f6, 0xc($t4)
.L8000F54C:
/* 01014C 8000F54C 8E490040 */  lw    $t1, 0x40($s2)
/* 010150 8000F550 00000000 */  nop   
/* 010154 8000F554 81220056 */  lb    $v0, 0x56($t1)
/* 010158 8000F558 00000000 */  nop   
/* 01015C 8000F55C 18400025 */  blez  $v0, .L8000F5F4
/* 010160 8000F560 2841000A */   slti  $at, $v0, 0xa
/* 010164 8000F564 10200023 */  beqz  $at, .L8000F5F4
/* 010168 8000F568 00000000 */   nop   
/* 01016C 8000F56C 0C003E67 */  jal   func_8000F99C
/* 010170 8000F570 02402025 */   move  $a0, $s2
/* 010174 8000F574 1040001F */  beqz  $v0, .L8000F5F4
/* 010178 8000F578 3C028012 */   lui   $v0, %hi(D_8011AE50) # $v0, 0x8012
/* 01017C 8000F57C 8C42AE50 */  lw    $v0, %lo(D_8011AE50)($v0)
/* 010180 8000F580 00000000 */  nop   
/* 010184 8000F584 10400003 */  beqz  $v0, .L8000F594
/* 010188 8000F588 00000000 */   nop   
/* 01018C 8000F58C 0C01ECAF */  jal   free_texture
/* 010190 8000F590 00402025 */   move  $a0, $v0
.L8000F594:
/* 010194 8000F594 3C028012 */  lui   $v0, %hi(D_8011AE54) # $v0, 0x8012
/* 010198 8000F598 8C42AE54 */  lw    $v0, %lo(D_8011AE54)($v0)
/* 01019C 8000F59C 00000000 */  nop   
/* 0101A0 8000F5A0 10400004 */  beqz  $v0, .L8000F5B4
/* 0101A4 8000F5A4 8FA60064 */   lw    $a2, 0x64($sp)
/* 0101A8 8000F5A8 0C01ECAF */  jal   free_texture
/* 0101AC 8000F5AC 00402025 */   move  $a0, $v0
/* 0101B0 8000F5B0 8FA60064 */  lw    $a2, 0x64($sp)
.L8000F5B4:
/* 0101B4 8000F5B4 02402025 */  move  $a0, $s2
/* 0101B8 8000F5B8 0C003D92 */  jal   objFreeAssets
/* 0101BC 8000F5BC 02602825 */   move  $a1, $s3
/* 0101C0 8000F5C0 87A4004E */  lh    $a0, 0x4e($sp)
/* 0101C4 8000F5C4 0C003211 */  jal   try_free_object_header
/* 0101C8 8000F5C8 00000000 */   nop   
/* 0101CC 8000F5CC 0C01C450 */  jal   free_from_memory_pool
/* 0101D0 8000F5D0 02402025 */   move  $a0, $s2
/* 0101D4 8000F5D4 12200005 */  beqz  $s1, .L8000F5EC
/* 0101D8 8000F5D8 00000000 */   nop   
/* 0101DC 8000F5DC 8E0D0000 */  lw    $t5, ($s0)
/* 0101E0 8000F5E0 00000000 */  nop   
/* 0101E4 8000F5E4 25B8FFFF */  addiu $t8, $t5, -1
/* 0101E8 8000F5E8 AE180000 */  sw    $t8, ($s0)
.L8000F5EC:
/* 0101EC 8000F5EC 1000000F */  b     .L8000F62C
/* 0101F0 8000F5F0 00001025 */   move  $v0, $zero
.L8000F5F4:
/* 0101F4 8000F5F4 8E4F0040 */  lw    $t7, 0x40($s2)
/* 0101F8 8000F5F8 00000000 */  nop   
/* 0101FC 8000F5FC 81EE005A */  lb    $t6, 0x5a($t7)
/* 010200 8000F600 00000000 */  nop   
/* 010204 8000F604 19C00003 */  blez  $t6, .L8000F614
/* 010208 8000F608 00000000 */   nop   
/* 01020C 8000F60C 0C003DD6 */  jal   light_setup_light_sources
/* 010210 8000F610 02402025 */   move  $a0, $s2
.L8000F614:
/* 010214 8000F614 0C01867D */  jal   func_800619F4
/* 010218 8000F618 00002025 */   move  $a0, $zero
/* 01021C 8000F61C 00002025 */  move  $a0, $zero
/* 010220 8000F620 0C02DDAE */  jal   update_object_stack_trace
/* 010224 8000F624 2405FFFF */   li    $a1, -1
/* 010228 8000F628 02401025 */  move  $v0, $s2
.L8000F62C:
/* 01022C 8000F62C 8FBF0024 */  lw    $ra, 0x24($sp)
/* 010230 8000F630 8FB00014 */  lw    $s0, 0x14($sp)
/* 010234 8000F634 8FB10018 */  lw    $s1, 0x18($sp)
/* 010238 8000F638 8FB2001C */  lw    $s2, 0x1c($sp)
/* 01023C 8000F63C 8FB30020 */  lw    $s3, 0x20($sp)
/* 010240 8000F640 03E00008 */  jr    $ra
/* 010244 8000F644 27BD0068 */   addiu $sp, $sp, 0x68

