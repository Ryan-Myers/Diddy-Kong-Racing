glabel arctan2_f
/* 071350 80070750 3C01437F */  li    $at, 0x437F0000 # 255.000000
/* 071354 80070754 44810000 */  mtc1  $at, $f0
/* 071358 80070758 00000000 */  nop   
/* 07135C 8007075C 46006302 */  mul.s $f12, $f12, $f0
/* 071360 80070760 00000000 */  nop   
/* 071364 80070764 46007382 */  mul.s $f14, $f14, $f0
/* 071368 80070768 46006324 */  cvt.w.s $f12, $f12
/* 07136C 8007076C 460073A4 */  cvt.w.s $f14, $f14
/* 071370 80070770 44046000 */  mfc1  $a0, $f12
/* 071374 80070774 44057000 */  mfc1  $a1, $f14
/* 071378 80070778 0801C19B */  j     atan2s # Does not do a jr in this func, but lets the jumped to function do it.
/* 07137C 8007077C 00000000 */   nop   
