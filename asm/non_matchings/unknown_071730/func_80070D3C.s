glabel func_80070D3C
/* 07193C 80070D3C 27BDFFC0 */  addiu $sp, $sp, -0x40
/* 071940 80070D40 AFBF0024 */  sw    $ra, 0x24($sp)
/* 071944 80070D44 AFB10020 */  sw    $s1, 0x20($sp)
/* 071948 80070D48 00A08825 */  move  $s1, $a1
/* 07194C 80070D4C AFB0001C */  sw    $s0, 0x1c($sp)
/* 071950 80070D50 AFA40040 */  sw    $a0, 0x40($sp)
/* 071954 80070D54 0C01BD44 */  jal   func_8006F510
/* 071958 80070D58 AFA60048 */   sw    $a2, 0x48($sp)
/* 07195C 80070D5C 8FAE0040 */  lw    $t6, 0x40($sp)
/* 071960 80070D60 3C188012 */  lui   $t8, %hi(D_80123580) # $t8, 0x8012
/* 071964 80070D64 AFA20028 */  sw    $v0, 0x28($sp)
/* 071968 80070D68 27183580 */  addiu $t8, %lo(D_80123580) # addiu $t8, $t8, 0x3580
/* 07196C 80070D6C 000E7900 */  sll   $t7, $t6, 4
/* 071970 80070D70 01F81021 */  addu  $v0, $t7, $t8
/* 071974 80070D74 8C590004 */  lw    $t9, 4($v0)
/* 071978 80070D78 8C4B0000 */  lw    $t3, ($v0)
/* 07197C 80070D7C 272A0001 */  addiu $t2, $t9, 1
/* 071980 80070D80 154B0006 */  bne   $t2, $t3, .L80070D9C
/* 071984 80070D84 322C000F */   andi  $t4, $s1, 0xf
/* 071988 80070D88 8FA40028 */  lw    $a0, 0x28($sp)
/* 07198C 80070D8C 0C01BD4F */  jal   func_8006F53C
/* 071990 80070D90 00000000 */   nop   
/* 071994 80070D94 10000039 */  b     .L80070E7C
/* 071998 80070D98 00001025 */   move  $v0, $zero
.L80070D9C:
/* 07199C 80070D9C 11800004 */  beqz  $t4, .L80070DB0
/* 0719A0 80070DA0 2410FFFF */   li    $s0, -1
/* 0719A4 80070DA4 2401FFF0 */  li    $at, -16
/* 0719A8 80070DA8 02216824 */  and   $t5, $s1, $at
/* 0719AC 80070DAC 25B10010 */  addiu $s1, $t5, 0x10
.L80070DB0:
/* 0719B0 80070DB0 3C067FFF */  lui   $a2, (0x7FFFFFFF >> 16) # lui $a2, 0x7fff
/* 0719B4 80070DB4 8C490008 */  lw    $t1, 8($v0)
/* 0719B8 80070DB8 34C6FFFF */  ori   $a2, (0x7FFFFFFF & 0xFFFF) # ori $a2, $a2, 0xffff
/* 0719BC 80070DBC 00002025 */  move  $a0, $zero
/* 0719C0 80070DC0 24080014 */  li    $t0, 20
/* 0719C4 80070DC4 2407FFFF */  li    $a3, -1
.L80070DC8:
/* 0719C8 80070DC8 00880019 */  multu $a0, $t0
/* 0719CC 80070DCC 00007012 */  mflo  $t6
/* 0719D0 80070DD0 01C91021 */  addu  $v0, $t6, $t1
/* 0719D4 80070DD4 844F0008 */  lh    $t7, 8($v0)
/* 0719D8 80070DD8 00402825 */  move  $a1, $v0
/* 0719DC 80070DDC 15E0000A */  bnez  $t7, .L80070E08
/* 0719E0 80070DE0 00000000 */   nop   
/* 0719E4 80070DE4 8C430004 */  lw    $v1, 4($v0)
/* 0719E8 80070DE8 00000000 */  nop   
/* 0719EC 80070DEC 0071082A */  slt   $at, $v1, $s1
/* 0719F0 80070DF0 14200005 */  bnez  $at, .L80070E08
/* 0719F4 80070DF4 0066082A */   slt   $at, $v1, $a2
/* 0719F8 80070DF8 10200003 */  beqz  $at, .L80070E08
/* 0719FC 80070DFC 00000000 */   nop   
/* 071A00 80070E00 00603025 */  move  $a2, $v1
/* 071A04 80070E04 00808025 */  move  $s0, $a0
.L80070E08:
/* 071A08 80070E08 84A4000C */  lh    $a0, 0xc($a1)
/* 071A0C 80070E0C 00000000 */  nop   
/* 071A10 80070E10 1487FFED */  bne   $a0, $a3, .L80070DC8
/* 071A14 80070E14 00000000 */   nop   
/* 071A18 80070E18 12070014 */  beq   $s0, $a3, .L80070E6C
/* 071A1C 80070E1C 02002825 */   move  $a1, $s0
/* 071A20 80070E20 8FB80048 */  lw    $t8, 0x48($sp)
/* 071A24 80070E24 8FA40040 */  lw    $a0, 0x40($sp)
/* 071A28 80070E28 02203025 */  move  $a2, $s1
/* 071A2C 80070E2C 24070001 */  li    $a3, 1
/* 071A30 80070E30 AFA00010 */  sw    $zero, 0x10($sp)
/* 071A34 80070E34 AFA9002C */  sw    $t1, 0x2c($sp)
/* 071A38 80070E38 0C01C5E3 */  jal   func_8007178C
/* 071A3C 80070E3C AFB80014 */   sw    $t8, 0x14($sp)
/* 071A40 80070E40 8FA40028 */  lw    $a0, 0x28($sp)
/* 071A44 80070E44 0C01BD4F */  jal   func_8006F53C
/* 071A48 80070E48 00000000 */   nop   
/* 071A4C 80070E4C 24080014 */  li    $t0, 20
/* 071A50 80070E50 02080019 */  multu $s0, $t0
/* 071A54 80070E54 8FA9002C */  lw    $t1, 0x2c($sp)
/* 071A58 80070E58 0000C812 */  mflo  $t9
/* 071A5C 80070E5C 03295021 */  addu  $t2, $t9, $t1
/* 071A60 80070E60 8D420000 */  lw    $v0, ($t2)
/* 071A64 80070E64 10000006 */  b     .L80070E80
/* 071A68 80070E68 8FBF0024 */   lw    $ra, 0x24($sp)
.L80070E6C:
/* 071A6C 80070E6C 8FA40028 */  lw    $a0, 0x28($sp)
/* 071A70 80070E70 0C01BD4F */  jal   func_8006F53C
/* 071A74 80070E74 00000000 */   nop   
/* 071A78 80070E78 00001025 */  move  $v0, $zero
.L80070E7C:
/* 071A7C 80070E7C 8FBF0024 */  lw    $ra, 0x24($sp)
.L80070E80:
/* 071A80 80070E80 8FB0001C */  lw    $s0, 0x1c($sp)
/* 071A84 80070E84 8FB10020 */  lw    $s1, 0x20($sp)
/* 071A88 80070E88 03E00008 */  jr    $ra
/* 071A8C 80070E8C 27BD0040 */   addiu $sp, $sp, 0x40
