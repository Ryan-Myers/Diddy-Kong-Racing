glabel func_8007957C
/* 07A17C 8007957C 03E00008 */  jr    $ra
/* 07A180 80079580 24820040 */   addiu $v0, $a0, 0x40

/* 07A184 80079584 3C01800E */  lui   $at, %hi(D_800DE740) # $at, 0x800e
/* 07A188 80079588 C424E740 */  lwc1  $f4, %lo(D_800DE740)($at)
/* 07A18C 8007958C 3C01800E */  lui   $at, %hi(D_800DE748) # $at, 0x800e
/* 07A190 80079590 E4840000 */  swc1  $f4, ($a0)
/* 07A194 80079594 C426E748 */  lwc1  $f6, %lo(D_800DE748)($at)
/* 07A198 80079598 3C01800E */  lui   $at, %hi(D_800DE74C) # $at, 0x800e
/* 07A19C 8007959C E4A60000 */  swc1  $f6, ($a1)
/* 07A1A0 800795A0 C428E74C */  lwc1  $f8, %lo(D_800DE74C)($at)
/* 07A1A4 800795A4 03E00008 */  jr    $ra
/* 07A1A8 800795A8 E4C80000 */   swc1  $f8, ($a2)
