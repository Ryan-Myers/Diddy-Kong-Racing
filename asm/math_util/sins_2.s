glabel coss_2 /* Official name: mathCos */
/* 07148C 8007088C 24844000 */  addiu $a0, $a0, 0x4000
glabel sins_2 /* Official name: mathSin */
/* 071490 80070890 00041440 */  sll   $v0, $a0, 0x11
/* 071494 80070894 04430003 */  bgezl $v0, .L800708A4
/* 071498 80070898 000450C2 */   srl   $t2, $a0, 3
/* 07149C 8007089C 38847FFF */  xori  $a0, $a0, 0x7fff
/* 0714A0 800708A0 000450C2 */  srl   $t2, $a0, 3
.L800708A4:
/* 0714A4 800708A4 3C02800E */  lui   $v0, %hi(gSineTable) # $v0, 0x800e
/* 0714A8 800708A8 314A07FE */  andi  $t2, $t2, 0x7fe
/* 0714AC 800708AC 2442D43C */  addiu $v0, %lo(gSineTable) # addiu $v0, $v0, -0x2bc4
/* 0714B0 800708B0 004A1021 */  addu  $v0, $v0, $t2
/* 0714B4 800708B4 94420000 */  lhu   $v0, ($v0)
/* 0714B8 800708B8 00042400 */  sll   $a0, $a0, 0x10
/* 0714BC 800708BC 04810002 */  bgez  $a0, .L800708C8
/* 0714C0 800708C0 00021040 */   sll   $v0, $v0, 1
/* 0714C4 800708C4 00021023 */  negu  $v0, $v0
.L800708C8:
/* 0714C8 800708C8 03E00008 */  jr    $ra
/* 0714CC 800708CC 00000000 */   nop   
