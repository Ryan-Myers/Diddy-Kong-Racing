glabel func_8006E770
/* 06F370 8006E770 27BDFFB8 */  addiu $sp, $sp, -0x48
/* 06F374 8006E774 AFB10018 */  sw    $s1, 0x18($sp)
/* 06F378 8006E778 AFB00014 */  sw    $s0, 0x14($sp)
/* 06F37C 8006E77C 00808025 */  move  $s0, $a0
/* 06F380 8006E780 00A08825 */  move  $s1, $a1
/* 06F384 8006E784 AFBF001C */  sw    $ra, 0x1c($sp)
/* 06F388 8006E788 27A5003C */  addiu $a1, $sp, 0x3c
/* 06F38C 8006E78C 0C01AC89 */  jal   func_8006B224
/* 06F390 8006E790 27A40038 */   addiu $a0, $sp, 0x38
/* 06F394 8006E794 0C0078A7 */  jal   func_8001E29C
/* 06F398 8006E798 24040017 */   li    $a0, 23
/* 06F39C 8006E79C 00004025 */  move  $t0, $zero
/* 06F3A0 8006E7A0 240C0003 */  li    $t4, 3
/* 06F3A4 8006E7A4 2409000C */  li    $t1, 12
/* 06F3A8 8006E7A8 8FAE0038 */  lw    $t6, 0x38($sp)
.L8006E7AC:
/* 06F3AC 8006E7AC 00003825 */  move  $a3, $zero
/* 06F3B0 8006E7B0 19C00070 */  blez  $t6, .L8006E974
/* 06F3B4 8006E7B4 322A0001 */   andi  $t2, $s1, 1
/* 06F3B8 8006E7B8 31C30001 */  andi  $v1, $t6, 1
/* 06F3BC 8006E7BC 1060001F */  beqz  $v1, .L8006E83C
/* 06F3C0 8006E7C0 322B0002 */   andi  $t3, $s1, 2
/* 06F3C4 8006E7C4 1140000C */  beqz  $t2, .L8006E7F8
/* 06F3C8 8006E7C8 00081880 */   sll   $v1, $t0, 2
/* 06F3CC 8006E7CC 00037840 */  sll   $t7, $v1, 1
/* 06F3D0 8006E7D0 004F2821 */  addu  $a1, $v0, $t7
/* 06F3D4 8006E7D4 02032021 */  addu  $a0, $s0, $v1
/* 06F3D8 8006E7D8 8C990018 */  lw    $t9, 0x18($a0)
/* 06F3DC 8006E7DC 94B80006 */  lhu   $t8, 6($a1)
/* 06F3E0 8006E7E0 00000000 */  nop   
/* 06F3E4 8006E7E4 A7380000 */  sh    $t8, ($t9)
/* 06F3E8 8006E7E8 8C8E0024 */  lw    $t6, 0x24($a0)
/* 06F3EC 8006E7EC 94AD0004 */  lhu   $t5, 4($a1)
/* 06F3F0 8006E7F0 00000000 */  nop   
/* 06F3F4 8006E7F4 A5CD0000 */  sh    $t5, ($t6)
.L8006E7F8:
/* 06F3F8 8006E7F8 1160000C */  beqz  $t3, .L8006E82C
/* 06F3FC 8006E7FC 00081880 */   sll   $v1, $t0, 2
/* 06F400 8006E800 00037840 */  sll   $t7, $v1, 1
/* 06F404 8006E804 004F2821 */  addu  $a1, $v0, $t7
/* 06F408 8006E808 02032021 */  addu  $a0, $s0, $v1
/* 06F40C 8006E80C 8C990030 */  lw    $t9, 0x30($a0)
/* 06F410 8006E810 94B80002 */  lhu   $t8, 2($a1)
/* 06F414 8006E814 00000000 */  nop   
/* 06F418 8006E818 A7380000 */  sh    $t8, ($t9)
/* 06F41C 8006E81C 8C8E003C */  lw    $t6, 0x3c($a0)
/* 06F420 8006E820 94AD0000 */  lhu   $t5, ($a1)
/* 06F424 8006E824 00000000 */  nop   
/* 06F428 8006E828 A5CD0000 */  sh    $t5, ($t6)
.L8006E82C:
/* 06F42C 8006E82C 8FAF0038 */  lw    $t7, 0x38($sp)
/* 06F430 8006E830 24070001 */  li    $a3, 1
/* 06F434 8006E834 10EF004F */  beq   $a3, $t7, .L8006E974
/* 06F438 8006E838 00000000 */   nop   
.L8006E83C:
/* 06F43C 8006E83C 11400011 */  beqz  $t2, .L8006E884
/* 06F440 8006E840 00000000 */   nop   
/* 06F444 8006E844 00E90019 */  multu $a3, $t1
/* 06F448 8006E848 00081880 */  sll   $v1, $t0, 2
/* 06F44C 8006E84C 02032021 */  addu  $a0, $s0, $v1
/* 06F450 8006E850 8C8F0018 */  lw    $t7, 0x18($a0)
/* 06F454 8006E854 00072840 */  sll   $a1, $a3, 1
/* 06F458 8006E858 0000C012 */  mflo  $t8
/* 06F45C 8006E85C 0303C821 */  addu  $t9, $t8, $v1
/* 06F460 8006E860 00196840 */  sll   $t5, $t9, 1
/* 06F464 8006E864 004D3021 */  addu  $a2, $v0, $t5
/* 06F468 8006E868 94CE0006 */  lhu   $t6, 6($a2)
/* 06F46C 8006E86C 01E5C021 */  addu  $t8, $t7, $a1
/* 06F470 8006E870 A70E0000 */  sh    $t6, ($t8)
/* 06F474 8006E874 8C8D0024 */  lw    $t5, 0x24($a0)
/* 06F478 8006E878 94D90004 */  lhu   $t9, 4($a2)
/* 06F47C 8006E87C 01A57821 */  addu  $t7, $t5, $a1
/* 06F480 8006E880 A5F90000 */  sh    $t9, ($t7)
.L8006E884:
/* 06F484 8006E884 11600011 */  beqz  $t3, .L8006E8CC
/* 06F488 8006E888 00000000 */   nop   
/* 06F48C 8006E88C 00E90019 */  multu $a3, $t1
/* 06F490 8006E890 00081880 */  sll   $v1, $t0, 2
/* 06F494 8006E894 02032021 */  addu  $a0, $s0, $v1
/* 06F498 8006E898 8C8F0030 */  lw    $t7, 0x30($a0)
/* 06F49C 8006E89C 00072840 */  sll   $a1, $a3, 1
/* 06F4A0 8006E8A0 00007012 */  mflo  $t6
/* 06F4A4 8006E8A4 01C3C021 */  addu  $t8, $t6, $v1
/* 06F4A8 8006E8A8 00186840 */  sll   $t5, $t8, 1
/* 06F4AC 8006E8AC 004D3021 */  addu  $a2, $v0, $t5
/* 06F4B0 8006E8B0 94D90002 */  lhu   $t9, 2($a2)
/* 06F4B4 8006E8B4 01E57021 */  addu  $t6, $t7, $a1
/* 06F4B8 8006E8B8 A5D90000 */  sh    $t9, ($t6)
/* 06F4BC 8006E8BC 8C8D003C */  lw    $t5, 0x3c($a0)
/* 06F4C0 8006E8C0 94D80000 */  lhu   $t8, ($a2)
/* 06F4C4 8006E8C4 01A57821 */  addu  $t7, $t5, $a1
/* 06F4C8 8006E8C8 A5F80000 */  sh    $t8, ($t7)
.L8006E8CC:
/* 06F4CC 8006E8CC 11400012 */  beqz  $t2, .L8006E918
/* 06F4D0 8006E8D0 00000000 */   nop   
/* 06F4D4 8006E8D4 00E90019 */  multu $a3, $t1
/* 06F4D8 8006E8D8 00081880 */  sll   $v1, $t0, 2
/* 06F4DC 8006E8DC 02032021 */  addu  $a0, $s0, $v1
/* 06F4E0 8006E8E0 8C8F0018 */  lw    $t7, 0x18($a0)
/* 06F4E4 8006E8E4 00072840 */  sll   $a1, $a3, 1
/* 06F4E8 8006E8E8 0000C812 */  mflo  $t9
/* 06F4EC 8006E8EC 03237021 */  addu  $t6, $t9, $v1
/* 06F4F0 8006E8F0 000E6840 */  sll   $t5, $t6, 1
/* 06F4F4 8006E8F4 004D3021 */  addu  $a2, $v0, $t5
/* 06F4F8 8006E8F8 94D8001E */  lhu   $t8, 0x1e($a2)
/* 06F4FC 8006E8FC 01E5C821 */  addu  $t9, $t7, $a1
/* 06F500 8006E900 A7380002 */  sh    $t8, 2($t9)
/* 06F504 8006E904 8C8D0024 */  lw    $t5, 0x24($a0)
/* 06F508 8006E908 94CE001C */  lhu   $t6, 0x1c($a2)
/* 06F50C 8006E90C 01A57821 */  addu  $t7, $t5, $a1
/* 06F510 8006E910 24C60018 */  addiu $a2, $a2, 0x18
/* 06F514 8006E914 A5EE0002 */  sh    $t6, 2($t7)
.L8006E918:
/* 06F518 8006E918 11600013 */  beqz  $t3, .L8006E968
/* 06F51C 8006E91C 8FAE0038 */   lw    $t6, 0x38($sp)
/* 06F520 8006E920 00E90019 */  multu $a3, $t1
/* 06F524 8006E924 00081880 */  sll   $v1, $t0, 2
/* 06F528 8006E928 02032021 */  addu  $a0, $s0, $v1
/* 06F52C 8006E92C 8C8F0030 */  lw    $t7, 0x30($a0)
/* 06F530 8006E930 00072840 */  sll   $a1, $a3, 1
/* 06F534 8006E934 0000C012 */  mflo  $t8
/* 06F538 8006E938 0303C821 */  addu  $t9, $t8, $v1
/* 06F53C 8006E93C 00196840 */  sll   $t5, $t9, 1
/* 06F540 8006E940 004D3021 */  addu  $a2, $v0, $t5
/* 06F544 8006E944 94CE001A */  lhu   $t6, 0x1a($a2)
/* 06F548 8006E948 01E5C021 */  addu  $t8, $t7, $a1
/* 06F54C 8006E94C A70E0002 */  sh    $t6, 2($t8)
/* 06F550 8006E950 8C8D003C */  lw    $t5, 0x3c($a0)
/* 06F554 8006E954 94D90018 */  lhu   $t9, 0x18($a2)
/* 06F558 8006E958 01A57821 */  addu  $t7, $t5, $a1
/* 06F55C 8006E95C 24C60018 */  addiu $a2, $a2, 0x18
/* 06F560 8006E960 A5F90002 */  sh    $t9, 2($t7)
/* 06F564 8006E964 8FAE0038 */  lw    $t6, 0x38($sp)
.L8006E968:
/* 06F568 8006E968 24E70002 */  addiu $a3, $a3, 2
/* 06F56C 8006E96C 14EEFFB3 */  bne   $a3, $t6, .L8006E83C
/* 06F570 8006E970 00000000 */   nop   
.L8006E974:
/* 06F574 8006E974 25080001 */  addiu $t0, $t0, 1
/* 06F578 8006E978 150CFF8C */  bne   $t0, $t4, .L8006E7AC
/* 06F57C 8006E97C 8FAE0038 */   lw    $t6, 0x38($sp)
/* 06F580 8006E980 8FBF001C */  lw    $ra, 0x1c($sp)
/* 06F584 8006E984 8FB00014 */  lw    $s0, 0x14($sp)
/* 06F588 8006E988 8FB10018 */  lw    $s1, 0x18($sp)
/* 06F58C 8006E98C 03E00008 */  jr    $ra
/* 06F590 8006E990 27BD0048 */   addiu $sp, $sp, 0x48

