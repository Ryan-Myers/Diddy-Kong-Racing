glabel func_8006F43C
/* 07003C 8006F43C 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 070040 8006F440 AFB20020 */  sw    $s2, 0x20($sp)
/* 070044 8006F444 AFB1001C */  sw    $s1, 0x1c($sp)
/* 070048 8006F448 AFB00018 */  sw    $s0, 0x18($sp)
/* 07004C 8006F44C AFBF0024 */  sw    $ra, 0x24($sp)
/* 070050 8006F450 00008825 */  move  $s1, $zero
/* 070054 8006F454 00008025 */  move  $s0, $zero
/* 070058 8006F458 24120004 */  li    $s2, 4
.L8006F45C:
/* 07005C 8006F45C 0C01A94A */  jal   func_8006A528
/* 070060 8006F460 02002025 */   move  $a0, $s0
/* 070064 8006F464 26100001 */  addiu $s0, $s0, 1
/* 070068 8006F468 1612FFFC */  bne   $s0, $s2, .L8006F45C
/* 07006C 8006F46C 02228825 */   or    $s1, $s1, $v0
/* 070070 8006F470 322E1000 */  andi  $t6, $s1, 0x1000
/* 070074 8006F474 11C00004 */  beqz  $t6, .L8006F488
/* 070078 8006F478 3C028012 */   lui   $v0, %hi(D_80123520) # $v0, 0x8012
/* 07007C 8006F47C 240F0001 */  li    $t7, 1
/* 070080 8006F480 3C01800E */  lui   $at, %hi(D_800DFD94) # $at, 0x800e
/* 070084 8006F484 AC2FFD94 */  sw    $t7, %lo(D_800DFD94)($at)
.L8006F488:
/* 070088 8006F488 24423520 */  addiu $v0, %lo(D_80123520) # addiu $v0, $v0, 0x3520
/* 07008C 8006F48C 8C580000 */  lw    $t8, ($v0)
/* 070090 8006F490 2404001A */  li    $a0, 26
/* 070094 8006F494 27190001 */  addiu $t9, $t8, 1
/* 070098 8006F498 2B210008 */  slti  $at, $t9, 8
/* 07009C 8006F49C 14200004 */  bnez  $at, .L8006F4B0
/* 0700A0 8006F4A0 AC590000 */   sw    $t9, ($v0)
/* 0700A4 8006F4A4 24050027 */  li    $a1, 39
/* 0700A8 8006F4A8 0C01B68A */  jal   func_8006DA28
/* 0700AC 8006F4AC 24060002 */   li    $a2, 2
.L8006F4B0:
/* 0700B0 8006F4B0 8FBF0024 */  lw    $ra, 0x24($sp)
/* 0700B4 8006F4B4 8FB00018 */  lw    $s0, 0x18($sp)
/* 0700B8 8006F4B8 8FB1001C */  lw    $s1, 0x1c($sp)
/* 0700BC 8006F4BC 8FB20020 */  lw    $s2, 0x20($sp)
/* 0700C0 8006F4C0 03E00008 */  jr    $ra
/* 0700C4 8006F4C4 27BD0028 */   addiu $sp, $sp, 0x28

