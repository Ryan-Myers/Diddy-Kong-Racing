glabel func_8006807C
/* 068C7C 8006807C 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 068C80 80068080 AFA40018 */  sw    $a0, 0x18($sp)
/* 068C84 80068084 AFA5001C */  sw    $a1, 0x1c($sp)
/* 068C88 80068088 AFBF0014 */  sw    $ra, 0x14($sp)
/* 068C8C 8006808C 3C05800E */  lui   $a1, %hi(D_800DD288) # $a1, 0x800e
/* 068C90 80068090 3C048012 */  lui   $a0, %hi(D_80121060) # $a0, 0x8012
/* 068C94 80068094 24841060 */  addiu $a0, %lo(D_80121060) # addiu $a0, $a0, 0x1060
/* 068C98 80068098 0C01BF9D */  jal   func_8006FE74
/* 068C9C 8006809C 24A5D288 */   addiu $a1, %lo(D_800DD288) # addiu $a1, $a1, -0x2d78
/* 068CA0 800680A0 3C048012 */  lui   $a0, %hi(D_80121060) # $a0, 0x8012
/* 068CA4 800680A4 3C058012 */  lui   $a1, %hi(D_80120EE0) # $a1, 0x8012
/* 068CA8 800680A8 3C068012 */  lui   $a2, %hi(D_80120F20) # $a2, 0x8012
/* 068CAC 800680AC 24C60F20 */  addiu $a2, %lo(D_80120F20) # addiu $a2, $a2, 0xf20
/* 068CB0 800680B0 24A50EE0 */  addiu $a1, %lo(D_80120EE0) # addiu $a1, $a1, 0xee0
/* 068CB4 800680B4 0C01BDDA */  jal   func_8006F768
/* 068CB8 800680B8 24841060 */   addiu $a0, %lo(D_80121060) # addiu $a0, $a0, 0x1060
/* 068CBC 800680BC 3C048012 */  lui   $a0, %hi(D_80120D70) # $a0, 0x8012
/* 068CC0 800680C0 8C840D70 */  lw    $a0, %lo(D_80120D70)($a0)
/* 068CC4 800680C4 3C05800E */  lui   $a1, %hi(D_800DD2A0) # $a1, 0x800e
/* 068CC8 800680C8 0C01BF9D */  jal   func_8006FE74
/* 068CCC 800680CC 24A5D2A0 */   addiu $a1, %lo(D_800DD2A0) # addiu $a1, $a1, -0x2d60
/* 068CD0 800680D0 3C048012 */  lui   $a0, %hi(D_80120D70) # $a0, 0x8012
/* 068CD4 800680D4 8C840D70 */  lw    $a0, %lo(D_80120D70)($a0)
/* 068CD8 800680D8 3C058012 */  lui   $a1, %hi(D_80120F20) # $a1, 0x8012
/* 068CDC 800680DC 3C068012 */  lui   $a2, %hi(D_80121060) # $a2, 0x8012
/* 068CE0 800680E0 24C61060 */  addiu $a2, %lo(D_80121060) # addiu $a2, $a2, 0x1060
/* 068CE4 800680E4 0C01BDDA */  jal   func_8006F768
/* 068CE8 800680E8 24A50F20 */   addiu $a1, %lo(D_80120F20) # addiu $a1, $a1, 0xf20
/* 068CEC 800680EC 8FAE001C */  lw    $t6, 0x1c($sp)
/* 068CF0 800680F0 3C048012 */  lui   $a0, %hi(D_80121060) # $a0, 0x8012
/* 068CF4 800680F4 8DC50000 */  lw    $a1, ($t6)
/* 068CF8 800680F8 0C01BE1C */  jal   func_8006F870
/* 068CFC 800680FC 24841060 */   addiu $a0, %lo(D_80121060) # addiu $a0, $a0, 0x1060
/* 068D00 80068100 8FA50018 */  lw    $a1, 0x18($sp)
/* 068D04 80068104 8FA4001C */  lw    $a0, 0x1c($sp)
/* 068D08 80068108 8CA30000 */  lw    $v1, ($a1)
/* 068D0C 8006810C 3C180100 */  lui   $t8, (0x01000040 >> 16) # lui $t8, 0x100
/* 068D10 80068110 246F0008 */  addiu $t7, $v1, 8
/* 068D14 80068114 37180040 */  ori   $t8, (0x01000040 & 0xFFFF) # ori $t8, $t8, 0x40
/* 068D18 80068118 ACAF0000 */  sw    $t7, ($a1)
/* 068D1C 8006811C AC780000 */  sw    $t8, ($v1)
/* 068D20 80068120 8C990000 */  lw    $t9, ($a0)
/* 068D24 80068124 3C018000 */  lui   $at, 0x8000
/* 068D28 80068128 03214021 */  addu  $t0, $t9, $at
/* 068D2C 8006812C AC680004 */  sw    $t0, 4($v1)
/* 068D30 80068130 8C890000 */  lw    $t1, ($a0)
/* 068D34 80068134 3C018012 */  lui   $at, %hi(D_80120D1C) # $at, 0x8012
/* 068D38 80068138 252A0040 */  addiu $t2, $t1, 0x40
/* 068D3C 8006813C AC8A0000 */  sw    $t2, ($a0)
/* 068D40 80068140 8FBF0014 */  lw    $ra, 0x14($sp)
/* 068D44 80068144 AC200D1C */  sw    $zero, %lo(D_80120D1C)($at)
/* 068D48 80068148 3C018012 */  lui   $at, %hi(D_80120D08) # $at, 0x8012
/* 068D4C 8006814C AC200D08 */  sw    $zero, %lo(D_80120D08)($at)
/* 068D50 80068150 03E00008 */  jr    $ra
/* 068D54 80068154 27BD0018 */   addiu $sp, $sp, 0x18
