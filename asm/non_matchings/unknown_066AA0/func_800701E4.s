glabel func_800701E4
/* 070DE4 800701E4 27BDFFF8 */  addiu $sp, $sp, -8
/* 070DE8 800701E8 FFBF0000 */  sd    $ra, ($sp)
/* 070DEC 800701EC 00803025 */  move  $a2, $a0
/* 070DF0 800701F0 84AB0000 */  lh    $t3, ($a1)
/* 070DF4 800701F4 84AC0002 */  lh    $t4, 2($a1)
/* 070DF8 800701F8 84AD0004 */  lh    $t5, 4($a1)
/* 070DFC 800701FC 0C01C20C */  jal   func_80070830
/* 070E00 80070200 84C40000 */   lh    $a0, ($a2)
/* 070E04 80070204 00407025 */  move  $t6, $v0
/* 070E08 80070208 0C01C20B */  jal   func_8007082C
/* 070E0C 8007020C 84C40000 */   lh    $a0, ($a2)
/* 070E10 80070210 016E0018 */  mult  $t3, $t6
/* 070E14 80070214 00407825 */  move  $t7, $v0
/* 070E18 80070218 84C40002 */  lh    $a0, 2($a2)
/* 070E1C 8007021C 00004012 */  mflo  $t0
/* 070E20 80070220 00000000 */  nop   
/* 070E24 80070224 00000000 */  nop   
/* 070E28 80070228 018E0018 */  mult  $t4, $t6
/* 070E2C 8007022C 00004812 */  mflo  $t1
/* 070E30 80070230 00000000 */  nop   
/* 070E34 80070234 00000000 */  nop   
/* 070E38 80070238 016F0018 */  mult  $t3, $t7
/* 070E3C 8007023C 00005812 */  mflo  $t3
/* 070E40 80070240 01695822 */  sub   $t3, $t3, $t1
/* 070E44 80070244 000B5C03 */  sra   $t3, $t3, 0x10
/* 070E48 80070248 018F0018 */  mult  $t4, $t7
/* 070E4C 8007024C 00006012 */  mflo  $t4
/* 070E50 80070250 01886020 */  add   $t4, $t4, $t0
/* 070E54 80070254 0C01C20C */  jal   func_80070830
/* 070E58 80070258 000C6403 */   sra   $t4, $t4, 0x10
/* 070E5C 8007025C 00407025 */  move  $t6, $v0
/* 070E60 80070260 0C01C20B */  jal   func_8007082C
/* 070E64 80070264 84C40002 */   lh    $a0, 2($a2)
/* 070E68 80070268 018E0018 */  mult  $t4, $t6
/* 070E6C 8007026C 00407825 */  move  $t7, $v0
/* 070E70 80070270 84C40004 */  lh    $a0, 4($a2)
/* 070E74 80070274 00004012 */  mflo  $t0
/* 070E78 80070278 00000000 */  nop   
/* 070E7C 8007027C 00000000 */  nop   
/* 070E80 80070280 01AE0018 */  mult  $t5, $t6
/* 070E84 80070284 00004812 */  mflo  $t1
/* 070E88 80070288 00000000 */  nop   
/* 070E8C 8007028C 00000000 */  nop   
/* 070E90 80070290 018F0018 */  mult  $t4, $t7
/* 070E94 80070294 00006012 */  mflo  $t4
/* 070E98 80070298 01896022 */  sub   $t4, $t4, $t1
/* 070E9C 8007029C 000C6403 */  sra   $t4, $t4, 0x10
/* 070EA0 800702A0 01AF0018 */  mult  $t5, $t7
/* 070EA4 800702A4 00006812 */  mflo  $t5
/* 070EA8 800702A8 01A86820 */  add   $t5, $t5, $t0
/* 070EAC 800702AC 0C01C20C */  jal   func_80070830
/* 070EB0 800702B0 000D6C03 */   sra   $t5, $t5, 0x10
/* 070EB4 800702B4 00407025 */  move  $t6, $v0
/* 070EB8 800702B8 0C01C20B */  jal   func_8007082C
/* 070EBC 800702BC 84C40004 */   lh    $a0, 4($a2)
/* 070EC0 800702C0 016E0018 */  mult  $t3, $t6
/* 070EC4 800702C4 00407825 */  move  $t7, $v0
/* 070EC8 800702C8 A4AC0002 */  sh    $t4, 2($a1)
/* 070ECC 800702CC 00004012 */  mflo  $t0
/* 070ED0 800702D0 00000000 */  nop   
/* 070ED4 800702D4 00000000 */  nop   
/* 070ED8 800702D8 01AE0018 */  mult  $t5, $t6
/* 070EDC 800702DC 00004812 */  mflo  $t1
/* 070EE0 800702E0 00000000 */  nop   
/* 070EE4 800702E4 00000000 */  nop   
/* 070EE8 800702E8 016F0018 */  mult  $t3, $t7
/* 070EEC 800702EC 00005812 */  mflo  $t3
/* 070EF0 800702F0 01695820 */  add   $t3, $t3, $t1
/* 070EF4 800702F4 000B5C03 */  sra   $t3, $t3, 0x10
/* 070EF8 800702F8 01AF0018 */  mult  $t5, $t7
/* 070EFC 800702FC A4AB0000 */  sh    $t3, ($a1)
/* 070F00 80070300 00006812 */  mflo  $t5
/* 070F04 80070304 01A86822 */  sub   $t5, $t5, $t0
/* 070F08 80070308 000D6C03 */  sra   $t5, $t5, 0x10
/* 070F0C 8007030C A4AD0004 */  sh    $t5, 4($a1)
/* 070F10 80070310 DFBF0000 */  ld    $ra, ($sp)
/* 070F14 80070314 27BD0008 */  addiu $sp, $sp, 8
/* 070F18 80070318 03E00008 */  jr    $ra
/* 070F1C 8007031C 00000000 */   nop   

