glabel func_8003E630
/* 03F230 8003E630 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 03F234 8003E634 AFBF0014 */  sw    $ra, 0x14($sp)
/* 03F238 8003E638 8C820064 */  lw    $v0, 0x64($a0)
/* 03F23C 8003E63C 00000000 */  nop   
/* 03F240 8003E640 904E0018 */  lbu   $t6, 0x18($v0)
/* 03F244 8003E644 00000000 */  nop   
/* 03F248 8003E648 2DC1000C */  sltiu $at, $t6, 0xc
/* 03F24C 8003E64C 1020000D */  beqz  $at, .L8003E684
/* 03F250 8003E650 000E7080 */   sll   $t6, $t6, 2
/* 03F254 8003E654 3C01800E */  lui   $at, 0x800e
/* 03F258 8003E658 002E0821 */  addu  $at, $at, $t6
/* 03F25C 8003E65C 8C2E61C0 */  lw    $t6, 0x61c0($at)
/* 03F260 8003E660 00000000 */  nop   
/* 03F264 8003E664 01C00008 */  jr    $t6
/* 03F268 8003E668 00000000 */   nop   
/* 03F26C 8003E66C 0C00F9A5 */  jal   func_8003E694
/* 03F270 8003E670 00000000 */   nop   
/* 03F274 8003E674 10000004 */  b     .L8003E688
/* 03F278 8003E678 8FBF0014 */   lw    $ra, 0x14($sp)
/* 03F27C 8003E67C 0C00FCBA */  jal   func_8003F2E8
/* 03F280 8003E680 00000000 */   nop   
.L8003E684:
/* 03F284 8003E684 8FBF0014 */  lw    $ra, 0x14($sp)
.L8003E688:
/* 03F288 8003E688 27BD0018 */  addiu $sp, $sp, 0x18
/* 03F28C 8003E68C 03E00008 */  jr    $ra
/* 03F290 8003E690 00000000 */   nop   
