glabel func_8006F918
/* 070518 8006F918 3C04800E */  lui   $a0, %hi(D_800DD434) # $a0, 0x800e
/* 07051C 8006F91C 8C84D434 */  lw    $a0, %lo(D_800DD434)($a0)
/* 070520 8006F920 3C01800E */  lui   $at, 0x800e
/* 070524 8006F924 03E00008 */  jr    $ra
/* 070528 8006F928 AC24D438 */   sw    $a0, -0x2bc8($at)

