glabel func_800C5050
/* 0C5C50 800C5050 1880000E */  blez  $a0, .L800C508C
/* 0C5C54 800C5054 28810008 */   slti  $at, $a0, 8
/* 0C5C58 800C5058 1020000C */  beqz  $at, .L800C508C
/* 0C5C5C 800C505C 00047080 */   sll   $t6, $a0, 2
/* 0C5C60 800C5060 3C0F8013 */  lui   $t7, %hi(D_8012A7E8) # $t7, 0x8013
/* 0C5C64 800C5064 8DEFA7E8 */  lw    $t7, %lo(D_8012A7E8)($t7)
/* 0C5C68 800C5068 01C47021 */  addu  $t6, $t6, $a0
/* 0C5C6C 800C506C 000E70C0 */  sll   $t6, $t6, 3
/* 0C5C70 800C5070 01CF1021 */  addu  $v0, $t6, $t7
/* 0C5C74 800C5074 A0450018 */  sb    $a1, 0x18($v0)
/* 0C5C78 800C5078 A0460019 */  sb    $a2, 0x19($v0)
/* 0C5C7C 800C507C A047001A */  sb    $a3, 0x1a($v0)
/* 0C5C80 800C5080 8FB80010 */  lw    $t8, 0x10($sp)
/* 0C5C84 800C5084 00000000 */  nop   
/* 0C5C88 800C5088 A058001B */  sb    $t8, 0x1b($v0)
.L800C508C:
/* 0C5C8C 800C508C 03E00008 */  jr    $ra
/* 0C5C90 800C5090 00000000 */   nop   

/* 0C5C94 800C5094 1880000E */  blez  $a0, .L800C50D0
/* 0C5C98 800C5098 28810008 */   slti  $at, $a0, 8
/* 0C5C9C 800C509C 1020000C */  beqz  $at, .L800C50D0
/* 0C5CA0 800C50A0 00047080 */   sll   $t6, $a0, 2
/* 0C5CA4 800C50A4 3C0F8013 */  lui   $t7, %hi(D_8012A7E8) # $t7, 0x8013
/* 0C5CA8 800C50A8 8DEFA7E8 */  lw    $t7, %lo(D_8012A7E8)($t7)
/* 0C5CAC 800C50AC 01C47021 */  addu  $t6, $t6, $a0
/* 0C5CB0 800C50B0 000E70C0 */  sll   $t6, $t6, 3
/* 0C5CB4 800C50B4 01CF1021 */  addu  $v0, $t6, $t7
/* 0C5CB8 800C50B8 84580020 */  lh    $t8, 0x20($v0)
/* 0C5CBC 800C50BC 84480022 */  lh    $t0, 0x22($v0)
/* 0C5CC0 800C50C0 0305C821 */  addu  $t9, $t8, $a1
/* 0C5CC4 800C50C4 01064821 */  addu  $t1, $t0, $a2
/* 0C5CC8 800C50C8 A4590020 */  sh    $t9, 0x20($v0)
/* 0C5CCC 800C50CC A4490022 */  sh    $t1, 0x22($v0)
.L800C50D0:
/* 0C5CD0 800C50D0 03E00008 */  jr    $ra
/* 0C5CD4 800C50D4 00000000 */   nop   

/* 0C5CD8 800C50D8 1880000A */  blez  $a0, .L800C5104
/* 0C5CDC 800C50DC 28810008 */   slti  $at, $a0, 8
/* 0C5CE0 800C50E0 10200008 */  beqz  $at, .L800C5104
/* 0C5CE4 800C50E4 00047080 */   sll   $t6, $a0, 2
/* 0C5CE8 800C50E8 3C0F8013 */  lui   $t7, %hi(D_8012A7E8) # $t7, 0x8013
/* 0C5CEC 800C50EC 8DEFA7E8 */  lw    $t7, %lo(D_8012A7E8)($t7)
/* 0C5CF0 800C50F0 01C47021 */  addu  $t6, $t6, $a0
/* 0C5CF4 800C50F4 000E70C0 */  sll   $t6, $t6, 3
/* 0C5CF8 800C50F8 01CF1021 */  addu  $v0, $t6, $t7
/* 0C5CFC 800C50FC A4400020 */  sh    $zero, 0x20($v0)
/* 0C5D00 800C5100 A4400022 */  sh    $zero, 0x22($v0)
.L800C5104:
/* 0C5D04 800C5104 03E00008 */  jr    $ra
/* 0C5D08 800C5108 00000000 */   nop   

/* 0C5D0C 800C510C 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 0C5D10 800C5110 3C0E8013 */  lui   $t6, %hi(D_8012A7E8) # $t6, 0x8013
/* 0C5D14 800C5114 00047880 */  sll   $t7, $a0, 2
/* 0C5D18 800C5118 8DCEA7E8 */  lw    $t6, %lo(D_8012A7E8)($t6)
/* 0C5D1C 800C511C AFA7002C */  sw    $a3, 0x2c($sp)
/* 0C5D20 800C5120 01E47821 */  addu  $t7, $t7, $a0
/* 0C5D24 800C5124 AFA60028 */  sw    $a2, 0x28($sp)
/* 0C5D28 800C5128 000F78C0 */  sll   $t7, $t7, 3
/* 0C5D2C 800C512C AFBF001C */  sw    $ra, 0x1c($sp)
/* 0C5D30 800C5130 AFA50024 */  sw    $a1, 0x24($sp)
/* 0C5D34 800C5134 01CF1021 */  addu  $v0, $t6, $t7
/* 0C5D38 800C5138 00A03825 */  move  $a3, $a1
/* 0C5D3C 800C513C 8FB80028 */  lw    $t8, 0x28($sp)
/* 0C5D40 800C5140 8FB9002C */  lw    $t9, 0x2c($sp)
/* 0C5D44 800C5144 84450000 */  lh    $a1, ($v0)
/* 0C5D48 800C5148 84460002 */  lh    $a2, 2($v0)
/* 0C5D4C 800C514C AFB80010 */  sw    $t8, 0x10($sp)
/* 0C5D50 800C5150 0C03145A */  jal   func_800C5168
/* 0C5D54 800C5154 AFB90014 */   sw    $t9, 0x14($sp)
/* 0C5D58 800C5158 8FBF001C */  lw    $ra, 0x1c($sp)
/* 0C5D5C 800C515C 27BD0020 */  addiu $sp, $sp, 0x20
/* 0C5D60 800C5160 03E00008 */  jr    $ra
/* 0C5D64 800C5164 00000000 */   nop   
