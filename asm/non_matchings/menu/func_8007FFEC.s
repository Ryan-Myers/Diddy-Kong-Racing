glabel func_8007FFEC
/* 080BEC 8007FFEC 3C068012 */  lui   $a2, %hi(gMenuGeometry) # $a2, 0x8012
/* 080BF0 8007FFF0 24C66C2C */  addiu $a2, %lo(gMenuGeometry) # addiu $a2, $a2, 0x6c2c
/* 080BF4 8007FFF4 8CCE0000 */  lw    $t6, ($a2)
/* 080BF8 8007FFF8 27BDFFB0 */  addiu $sp, $sp, -0x50
/* 080BFC 8007FFFC AFB00018 */  sw    $s0, 0x18($sp)
/* 080C00 80080000 00808025 */  move  $s0, $a0
/* 080C04 80080004 11C00003 */  beqz  $t6, .L80080014
/* 080C08 80080008 AFBF001C */   sw    $ra, 0x1c($sp)
/* 080C0C 8008000C 0C01FFE2 */  jal   menu_button_free
/* 080C10 80080010 00000000 */   nop   
.L80080014:
/* 080C14 80080014 2409000A */  li    $t1, 10
/* 080C18 80080018 02090019 */  multu $s0, $t1
/* 080C1C 8008001C 00106880 */  sll   $t5, $s0, 2
/* 080C20 80080020 01B06821 */  addu  $t5, $t5, $s0
/* 080C24 80080024 000D6880 */  sll   $t5, $t5, 2
/* 080C28 80080028 000D7880 */  sll   $t7, $t5, 2
/* 080C2C 8008002C 01ED7821 */  addu  $t7, $t7, $t5
/* 080C30 80080030 24020020 */  li    $v0, 32
/* 080C34 80080034 3C01800E */  lui   $at, %hi(gWoodPanelTexScaleU) # $at, 0x800e
/* 080C38 80080038 000F6840 */  sll   $t5, $t7, 1
/* 080C3C 8008003C AC221DC0 */  sw    $v0, %lo(gWoodPanelTexScaleU)($at)
/* 080C40 80080040 3C01800E */  lui   $at, %hi(gWoodPanelTexScaleV) # $at, 0x800e
/* 080C44 80080044 00106140 */  sll   $t4, $s0, 5
/* 080C48 80080048 00001812 */  mflo  $v1
/* 080C4C 8008004C 0003C100 */  sll   $t8, $v1, 4
/* 080C50 80080050 01B8C821 */  addu  $t9, $t5, $t8
/* 080C54 80080054 00197040 */  sll   $t6, $t9, 1
/* 080C58 80080058 AC221DC4 */  sw    $v0, %lo(gWoodPanelTexScaleV)($at)
/* 080C5C 8008005C 01CC2021 */  addu  $a0, $t6, $t4
/* 080C60 80080060 03001825 */  move  $v1, $t8
/* 080C64 80080064 AFB80020 */  sw    $t8, 0x20($sp)
/* 080C68 80080068 AFAC0028 */  sw    $t4, 0x28($sp)
/* 080C6C 8008006C AFAD0024 */  sw    $t5, 0x24($sp)
/* 080C70 80080070 0C01C327 */  jal   mempool_alloc_safe
/* 080C74 80080074 2405FFFF */   li    $a1, -1
/* 080C78 80080078 8FA30020 */  lw    $v1, 0x20($sp)
/* 080C7C 8008007C 3C07800E */  lui   $a3, %hi(gWoodPanelTriangles) # $a3, 0x800e
/* 080C80 80080080 24E71DAC */  addiu $a3, %lo(gWoodPanelTriangles) # addiu $a3, $a3, 0x1dac
/* 080C84 80080084 ACE20000 */  sw    $v0, ($a3)
/* 080C88 80080088 3C01800E */  lui   $at, %hi(gWoodPanelTriangles+4) # $at, 0x800e
/* 080C8C 8008008C 0043C021 */  addu  $t8, $v0, $v1
/* 080C90 80080090 AC381DB0 */  sw    $t8, %lo(gWoodPanelTriangles+4)($at)
/* 080C94 80080094 8CF90004 */  lw    $t9, 4($a3)
/* 080C98 80080098 3C068012 */  lui   $a2, %hi(gMenuGeometry) # $a2, 0x8012
/* 080C9C 8008009C 3C018012 */  lui   $at, %hi(gMenuGeometry) # $at, 0x8012
/* 080CA0 800800A0 03237021 */  addu  $t6, $t9, $v1
/* 080CA4 800800A4 24C66C2C */  addiu $a2, %lo(gMenuGeometry) # addiu $a2, $a2, 0x6c2c
/* 080CA8 800800A8 AC2E6C2C */  sw    $t6, %lo(gMenuGeometry)($at)
/* 080CAC 800800AC 8FAC0028 */  lw    $t4, 0x28($sp)
/* 080CB0 800800B0 8CCF0000 */  lw    $t7, ($a2)
/* 080CB4 800800B4 3C08800E */  lui   $t0, %hi(gWoodPanelVertices) # $t0, 0x800e
/* 080CB8 800800B8 3C01800E */  lui   $at, %hi(gWoodPanelVertices+4) # $at, 0x800e
/* 080CBC 800800BC 01ECC021 */  addu  $t8, $t7, $t4
/* 080CC0 800800C0 25081DA4 */  addiu $t0, %lo(gWoodPanelVertices) # addiu $t0, $t0, 0x1da4
/* 080CC4 800800C4 AC381DA4 */  sw    $t8, %lo(gWoodPanelVertices)($at)
/* 080CC8 800800C8 8FAD0024 */  lw    $t5, 0x24($sp)
/* 080CCC 800800CC 8D190000 */  lw    $t9, ($t0)
/* 080CD0 800800D0 2409000A */  li    $t1, 10
/* 080CD4 800800D4 032D7021 */  addu  $t6, $t9, $t5
/* 080CD8 800800D8 AC2E1DA8 */  sw    $t6, %lo(gWoodPanelVertices+4)($at)
/* 080CDC 800800DC 00005025 */  move  $t2, $zero
/* 080CE0 800800E0 00002825 */  move  $a1, $zero
/* 080CE4 800800E4 1A0000C8 */  blez  $s0, .L80080408
/* 080CE8 800800E8 00005825 */   move  $t3, $zero
/* 080CEC 800800EC 32040003 */  andi  $a0, $s0, 3
/* 080CF0 800800F0 1080002C */  beqz  $a0, .L800801A4
/* 080CF4 800800F4 00806025 */   move  $t4, $a0
/* 080CF8 800800F8 00001825 */  move  $v1, $zero
/* 080CFC 800800FC 000318C0 */  sll   $v1, $v1, 3
/* 080D00 80080100 00001140 */  sll   $v0, $zero, 5
.L80080104:
/* 080D04 80080104 8D0F0000 */  lw    $t7, ($t0)
/* 080D08 80080108 8CD90000 */  lw    $t9, ($a2)
/* 080D0C 8008010C 01E3C021 */  addu  $t8, $t7, $v1
/* 080D10 80080110 03227021 */  addu  $t6, $t9, $v0
/* 080D14 80080114 ADD80000 */  sw    $t8, ($t6)
/* 080D18 80080118 8CD80000 */  lw    $t8, ($a2)
/* 080D1C 8008011C 8D0F0004 */  lw    $t7, 4($t0)
/* 080D20 80080120 03027021 */  addu  $t6, $t8, $v0
/* 080D24 80080124 01E3C821 */  addu  $t9, $t7, $v1
/* 080D28 80080128 ADD90004 */  sw    $t9, 4($t6)
/* 080D2C 8008012C 8CD90000 */  lw    $t9, ($a2)
/* 080D30 80080130 8CEF0000 */  lw    $t7, ($a3)
/* 080D34 80080134 00052100 */  sll   $a0, $a1, 4
/* 080D38 80080138 03227021 */  addu  $t6, $t9, $v0
/* 080D3C 8008013C 01E4C021 */  addu  $t8, $t7, $a0
/* 080D40 80080140 ADD80008 */  sw    $t8, 8($t6)
/* 080D44 80080144 8CD80000 */  lw    $t8, ($a2)
/* 080D48 80080148 8CEF0004 */  lw    $t7, 4($a3)
/* 080D4C 8008014C 03027021 */  addu  $t6, $t8, $v0
/* 080D50 80080150 01E4C821 */  addu  $t9, $t7, $a0
/* 080D54 80080154 ADD9000C */  sw    $t9, 0xc($t6)
/* 080D58 80080158 8CCF0000 */  lw    $t7, ($a2)
/* 080D5C 8008015C 256B0001 */  addiu $t3, $t3, 1
/* 080D60 80080160 01E2C021 */  addu  $t8, $t7, $v0
/* 080D64 80080164 AF000010 */  sw    $zero, 0x10($t8)
/* 080D68 80080168 8CD90000 */  lw    $t9, ($a2)
/* 080D6C 8008016C 24A5000A */  addiu $a1, $a1, 0xa
/* 080D70 80080170 03227021 */  addu  $t6, $t9, $v0
/* 080D74 80080174 ADC00014 */  sw    $zero, 0x14($t6)
/* 080D78 80080178 8CCF0000 */  lw    $t7, ($a2)
/* 080D7C 8008017C 246300C8 */  addiu $v1, $v1, 0xc8
/* 080D80 80080180 01E2C021 */  addu  $t8, $t7, $v0
/* 080D84 80080184 AF000018 */  sw    $zero, 0x18($t8)
/* 080D88 80080188 8CD90000 */  lw    $t9, ($a2)
/* 080D8C 8008018C 254A0014 */  addiu $t2, $t2, 0x14
/* 080D90 80080190 03227021 */  addu  $t6, $t9, $v0
/* 080D94 80080194 ADC0001C */  sw    $zero, 0x1c($t6)
/* 080D98 80080198 158BFFDA */  bne   $t4, $t3, .L80080104
/* 080D9C 8008019C 24420020 */   addiu $v0, $v0, 0x20
/* 080DA0 800801A0 11700098 */  beq   $t3, $s0, .L80080404
.L800801A4:
/* 080DA4 800801A4 000A1880 */   sll   $v1, $t2, 2
/* 080DA8 800801A8 006A1821 */  addu  $v1, $v1, $t2
/* 080DAC 800801AC 00031840 */  sll   $v1, $v1, 1
/* 080DB0 800801B0 000B1140 */  sll   $v0, $t3, 5
/* 080DB4 800801B4 00106140 */  sll   $t4, $s0, 5
.L800801B8:
/* 080DB8 800801B8 8D0F0000 */  lw    $t7, ($t0)
/* 080DBC 800801BC 8CD90000 */  lw    $t9, ($a2)
/* 080DC0 800801C0 01E3C021 */  addu  $t8, $t7, $v1
/* 080DC4 800801C4 03227021 */  addu  $t6, $t9, $v0
/* 080DC8 800801C8 ADD80000 */  sw    $t8, ($t6)
/* 080DCC 800801CC 8CD80000 */  lw    $t8, ($a2)
/* 080DD0 800801D0 8D0F0004 */  lw    $t7, 4($t0)
/* 080DD4 800801D4 03027021 */  addu  $t6, $t8, $v0
/* 080DD8 800801D8 01E3C821 */  addu  $t9, $t7, $v1
/* 080DDC 800801DC ADD90004 */  sw    $t9, 4($t6)
/* 080DE0 800801E0 8CD90000 */  lw    $t9, ($a2)
/* 080DE4 800801E4 8CEF0000 */  lw    $t7, ($a3)
/* 080DE8 800801E8 00052100 */  sll   $a0, $a1, 4
/* 080DEC 800801EC 03227021 */  addu  $t6, $t9, $v0
/* 080DF0 800801F0 01E4C021 */  addu  $t8, $t7, $a0
/* 080DF4 800801F4 ADD80008 */  sw    $t8, 8($t6)
/* 080DF8 800801F8 8CD80000 */  lw    $t8, ($a2)
/* 080DFC 800801FC 8CEF0004 */  lw    $t7, 4($a3)
/* 080E00 80080200 03027021 */  addu  $t6, $t8, $v0
/* 080E04 80080204 01E4C821 */  addu  $t9, $t7, $a0
/* 080E08 80080208 ADD9000C */  sw    $t9, 0xc($t6)
/* 080E0C 8008020C 8CCF0000 */  lw    $t7, ($a2)
/* 080E10 80080210 246300C8 */  addiu $v1, $v1, 0xc8
/* 080E14 80080214 01E2C021 */  addu  $t8, $t7, $v0
/* 080E18 80080218 AF000010 */  sw    $zero, 0x10($t8)
/* 080E1C 8008021C 8CD90000 */  lw    $t9, ($a2)
/* 080E20 80080220 24A5000A */  addiu $a1, $a1, 0xa
/* 080E24 80080224 03227021 */  addu  $t6, $t9, $v0
/* 080E28 80080228 ADC00014 */  sw    $zero, 0x14($t6)
/* 080E2C 8008022C 8CCF0000 */  lw    $t7, ($a2)
/* 080E30 80080230 00052100 */  sll   $a0, $a1, 4
/* 080E34 80080234 01E2C021 */  addu  $t8, $t7, $v0
/* 080E38 80080238 AF000018 */  sw    $zero, 0x18($t8)
/* 080E3C 8008023C 8CD90000 */  lw    $t9, ($a2)
/* 080E40 80080240 24A5000A */  addiu $a1, $a1, 0xa
/* 080E44 80080244 03227021 */  addu  $t6, $t9, $v0
/* 080E48 80080248 ADC0001C */  sw    $zero, 0x1c($t6)
/* 080E4C 8008024C 8CD90000 */  lw    $t9, ($a2)
/* 080E50 80080250 8D0F0000 */  lw    $t7, ($t0)
/* 080E54 80080254 03227021 */  addu  $t6, $t9, $v0
/* 080E58 80080258 01E3C021 */  addu  $t8, $t7, $v1
/* 080E5C 8008025C ADD80020 */  sw    $t8, 0x20($t6)
/* 080E60 80080260 8CD80000 */  lw    $t8, ($a2)
/* 080E64 80080264 8D0F0004 */  lw    $t7, 4($t0)
/* 080E68 80080268 03027021 */  addu  $t6, $t8, $v0
/* 080E6C 8008026C 01E3C821 */  addu  $t9, $t7, $v1
/* 080E70 80080270 ADD90024 */  sw    $t9, 0x24($t6)
/* 080E74 80080274 8CD90000 */  lw    $t9, ($a2)
/* 080E78 80080278 8CEF0000 */  lw    $t7, ($a3)
/* 080E7C 8008027C 03227021 */  addu  $t6, $t9, $v0
/* 080E80 80080280 01E4C021 */  addu  $t8, $t7, $a0
/* 080E84 80080284 ADD80028 */  sw    $t8, 0x28($t6)
/* 080E88 80080288 8CD80000 */  lw    $t8, ($a2)
/* 080E8C 8008028C 8CEF0004 */  lw    $t7, 4($a3)
/* 080E90 80080290 03027021 */  addu  $t6, $t8, $v0
/* 080E94 80080294 01E4C821 */  addu  $t9, $t7, $a0
/* 080E98 80080298 ADD9002C */  sw    $t9, 0x2c($t6)
/* 080E9C 8008029C 8CCF0000 */  lw    $t7, ($a2)
/* 080EA0 800802A0 246300C8 */  addiu $v1, $v1, 0xc8
/* 080EA4 800802A4 01E2C021 */  addu  $t8, $t7, $v0
/* 080EA8 800802A8 AF000030 */  sw    $zero, 0x30($t8)
/* 080EAC 800802AC 8CD90000 */  lw    $t9, ($a2)
/* 080EB0 800802B0 00052100 */  sll   $a0, $a1, 4
/* 080EB4 800802B4 03227021 */  addu  $t6, $t9, $v0
/* 080EB8 800802B8 ADC00034 */  sw    $zero, 0x34($t6)
/* 080EBC 800802BC 8CCF0000 */  lw    $t7, ($a2)
/* 080EC0 800802C0 24A5000A */  addiu $a1, $a1, 0xa
/* 080EC4 800802C4 01E2C021 */  addu  $t8, $t7, $v0
/* 080EC8 800802C8 AF000038 */  sw    $zero, 0x38($t8)
/* 080ECC 800802CC 8CD90000 */  lw    $t9, ($a2)
/* 080ED0 800802D0 00000000 */  nop   
/* 080ED4 800802D4 03227021 */  addu  $t6, $t9, $v0
/* 080ED8 800802D8 ADC0003C */  sw    $zero, 0x3c($t6)
/* 080EDC 800802DC 8CD90000 */  lw    $t9, ($a2)
/* 080EE0 800802E0 8D0F0000 */  lw    $t7, ($t0)
/* 080EE4 800802E4 03227021 */  addu  $t6, $t9, $v0
/* 080EE8 800802E8 01E3C021 */  addu  $t8, $t7, $v1
/* 080EEC 800802EC ADD80040 */  sw    $t8, 0x40($t6)
/* 080EF0 800802F0 8CD80000 */  lw    $t8, ($a2)
/* 080EF4 800802F4 8D0F0004 */  lw    $t7, 4($t0)
/* 080EF8 800802F8 03027021 */  addu  $t6, $t8, $v0
/* 080EFC 800802FC 01E3C821 */  addu  $t9, $t7, $v1
/* 080F00 80080300 ADD90044 */  sw    $t9, 0x44($t6)
/* 080F04 80080304 8CD90000 */  lw    $t9, ($a2)
/* 080F08 80080308 8CEF0000 */  lw    $t7, ($a3)
/* 080F0C 8008030C 03227021 */  addu  $t6, $t9, $v0
/* 080F10 80080310 01E4C021 */  addu  $t8, $t7, $a0
/* 080F14 80080314 ADD80048 */  sw    $t8, 0x48($t6)
/* 080F18 80080318 8CD80000 */  lw    $t8, ($a2)
/* 080F1C 8008031C 8CEF0004 */  lw    $t7, 4($a3)
/* 080F20 80080320 03027021 */  addu  $t6, $t8, $v0
/* 080F24 80080324 01E4C821 */  addu  $t9, $t7, $a0
/* 080F28 80080328 ADD9004C */  sw    $t9, 0x4c($t6)
/* 080F2C 8008032C 8CCF0000 */  lw    $t7, ($a2)
/* 080F30 80080330 246300C8 */  addiu $v1, $v1, 0xc8
/* 080F34 80080334 01E2C021 */  addu  $t8, $t7, $v0
/* 080F38 80080338 AF000050 */  sw    $zero, 0x50($t8)
/* 080F3C 8008033C 8CD90000 */  lw    $t9, ($a2)
/* 080F40 80080340 00052100 */  sll   $a0, $a1, 4
/* 080F44 80080344 03227021 */  addu  $t6, $t9, $v0
/* 080F48 80080348 ADC00054 */  sw    $zero, 0x54($t6)
/* 080F4C 8008034C 8CCF0000 */  lw    $t7, ($a2)
/* 080F50 80080350 24A5000A */  addiu $a1, $a1, 0xa
/* 080F54 80080354 01E2C021 */  addu  $t8, $t7, $v0
/* 080F58 80080358 AF000058 */  sw    $zero, 0x58($t8)
/* 080F5C 8008035C 8CD90000 */  lw    $t9, ($a2)
/* 080F60 80080360 00000000 */  nop   
/* 080F64 80080364 03227021 */  addu  $t6, $t9, $v0
/* 080F68 80080368 ADC0005C */  sw    $zero, 0x5c($t6)
/* 080F6C 8008036C 8CD90000 */  lw    $t9, ($a2)
/* 080F70 80080370 8D0F0000 */  lw    $t7, ($t0)
/* 080F74 80080374 03227021 */  addu  $t6, $t9, $v0
/* 080F78 80080378 01E3C021 */  addu  $t8, $t7, $v1
/* 080F7C 8008037C ADD80060 */  sw    $t8, 0x60($t6)
/* 080F80 80080380 8CD80000 */  lw    $t8, ($a2)
/* 080F84 80080384 8D0F0004 */  lw    $t7, 4($t0)
/* 080F88 80080388 03027021 */  addu  $t6, $t8, $v0
/* 080F8C 8008038C 01E3C821 */  addu  $t9, $t7, $v1
/* 080F90 80080390 ADD90064 */  sw    $t9, 0x64($t6)
/* 080F94 80080394 8CD90000 */  lw    $t9, ($a2)
/* 080F98 80080398 8CEF0000 */  lw    $t7, ($a3)
/* 080F9C 8008039C 03227021 */  addu  $t6, $t9, $v0
/* 080FA0 800803A0 01E4C021 */  addu  $t8, $t7, $a0
/* 080FA4 800803A4 ADD80068 */  sw    $t8, 0x68($t6)
/* 080FA8 800803A8 8CD80000 */  lw    $t8, ($a2)
/* 080FAC 800803AC 8CEF0004 */  lw    $t7, 4($a3)
/* 080FB0 800803B0 03027021 */  addu  $t6, $t8, $v0
/* 080FB4 800803B4 01E4C821 */  addu  $t9, $t7, $a0
/* 080FB8 800803B8 ADD9006C */  sw    $t9, 0x6c($t6)
/* 080FBC 800803BC 8CCF0000 */  lw    $t7, ($a2)
/* 080FC0 800803C0 246300C8 */  addiu $v1, $v1, 0xc8
/* 080FC4 800803C4 01E2C021 */  addu  $t8, $t7, $v0
/* 080FC8 800803C8 AF000070 */  sw    $zero, 0x70($t8)
/* 080FCC 800803CC 8CD90000 */  lw    $t9, ($a2)
/* 080FD0 800803D0 00000000 */  nop   
/* 080FD4 800803D4 03227021 */  addu  $t6, $t9, $v0
/* 080FD8 800803D8 ADC00074 */  sw    $zero, 0x74($t6)
/* 080FDC 800803DC 8CCF0000 */  lw    $t7, ($a2)
/* 080FE0 800803E0 00000000 */  nop   
/* 080FE4 800803E4 01E2C021 */  addu  $t8, $t7, $v0
/* 080FE8 800803E8 AF000078 */  sw    $zero, 0x78($t8)
/* 080FEC 800803EC 8CD90000 */  lw    $t9, ($a2)
/* 080FF0 800803F0 00000000 */  nop   
/* 080FF4 800803F4 03227021 */  addu  $t6, $t9, $v0
/* 080FF8 800803F8 24420080 */  addiu $v0, $v0, 0x80
/* 080FFC 800803FC 144CFF6E */  bne   $v0, $t4, .L800801B8
/* 081000 80080400 ADC0007C */   sw    $zero, 0x7c($t6)
.L80080404:
/* 081004 80080404 00005825 */  move  $t3, $zero
.L80080408:
/* 081008 80080408 1A00003A */  blez  $s0, .L800804F4
/* 08100C 8008040C 3C01800E */   lui   $at, %hi(gMenuTrisFlip) # $at, 0x800e
/* 081010 80080410 3C06800E */  lui   $a2, %hi(gMenuTrisFlip) # $a2, 0x800e
/* 081014 80080414 24C61DB4 */  addiu $a2, %lo(gMenuTrisFlip) # addiu $a2, $a2, 0x1db4
/* 081018 80080418 00001825 */  move  $v1, $zero
/* 08101C 8008041C 24050040 */  li    $a1, 64
.L80080420:
/* 081020 80080420 3C04800E */  lui   $a0, %hi(gWoodPanelsIndices) # $a0, 0x800e
/* 081024 80080424 24841CD0 */  addiu $a0, %lo(gWoodPanelsIndices) # addiu $a0, $a0, 0x1cd0
/* 081028 80080428 00003825 */  move  $a3, $zero
.L8008042C:
/* 08102C 8008042C 3C02800E */  lui   $v0, %hi(gWoodPanelTriangles) # $v0, 0x800e
/* 081030 80080430 24421DAC */  addiu $v0, %lo(gWoodPanelTriangles) # addiu $v0, $v0, 0x1dac
.L80080434:
/* 081034 80080434 8C4F0000 */  lw    $t7, ($v0)
/* 081038 80080438 24420004 */  addiu $v0, $v0, 4
/* 08103C 8008043C 01E3C021 */  addu  $t8, $t7, $v1
/* 081040 80080440 A3050000 */  sb    $a1, ($t8)
/* 081044 80080444 8C4EFFFC */  lw    $t6, -4($v0)
/* 081048 80080448 90990000 */  lbu   $t9, ($a0)
/* 08104C 8008044C 01C37821 */  addu  $t7, $t6, $v1
/* 081050 80080450 A1F90001 */  sb    $t9, 1($t7)
/* 081054 80080454 8C4EFFFC */  lw    $t6, -4($v0)
/* 081058 80080458 90980001 */  lbu   $t8, 1($a0)
/* 08105C 8008045C 01C3C821 */  addu  $t9, $t6, $v1
/* 081060 80080460 A3380002 */  sb    $t8, 2($t9)
/* 081064 80080464 8C4EFFFC */  lw    $t6, -4($v0)
/* 081068 80080468 908F0002 */  lbu   $t7, 2($a0)
/* 08106C 8008046C 01C3C021 */  addu  $t8, $t6, $v1
/* 081070 80080470 A30F0003 */  sb    $t7, 3($t8)
/* 081074 80080474 8C59FFFC */  lw    $t9, -4($v0)
/* 081078 80080478 00000000 */  nop   
/* 08107C 8008047C 03237021 */  addu  $t6, $t9, $v1
/* 081080 80080480 A5C00004 */  sh    $zero, 4($t6)
/* 081084 80080484 8C4FFFFC */  lw    $t7, -4($v0)
/* 081088 80080488 00000000 */  nop   
/* 08108C 8008048C 01E3C021 */  addu  $t8, $t7, $v1
/* 081090 80080490 A7000006 */  sh    $zero, 6($t8)
/* 081094 80080494 8C59FFFC */  lw    $t9, -4($v0)
/* 081098 80080498 00000000 */  nop   
/* 08109C 8008049C 03237021 */  addu  $t6, $t9, $v1
/* 0810A0 800804A0 A5C00008 */  sh    $zero, 8($t6)
/* 0810A4 800804A4 8C4FFFFC */  lw    $t7, -4($v0)
/* 0810A8 800804A8 00000000 */  nop   
/* 0810AC 800804AC 01E3C021 */  addu  $t8, $t7, $v1
/* 0810B0 800804B0 A700000A */  sh    $zero, 0xa($t8)
/* 0810B4 800804B4 8C59FFFC */  lw    $t9, -4($v0)
/* 0810B8 800804B8 00000000 */  nop   
/* 0810BC 800804BC 03237021 */  addu  $t6, $t9, $v1
/* 0810C0 800804C0 A5C0000C */  sh    $zero, 0xc($t6)
/* 0810C4 800804C4 8C4FFFFC */  lw    $t7, -4($v0)
/* 0810C8 800804C8 00000000 */  nop   
/* 0810CC 800804CC 01E3C021 */  addu  $t8, $t7, $v1
/* 0810D0 800804D0 1446FFD8 */  bne   $v0, $a2, .L80080434
/* 0810D4 800804D4 A700000E */   sh    $zero, 0xe($t8)
/* 0810D8 800804D8 24E70001 */  addiu $a3, $a3, 1
/* 0810DC 800804DC 24630010 */  addiu $v1, $v1, 0x10
/* 0810E0 800804E0 14E9FFD2 */  bne   $a3, $t1, .L8008042C
/* 0810E4 800804E4 24840003 */   addiu $a0, $a0, 3
/* 0810E8 800804E8 256B0001 */  addiu $t3, $t3, 1
/* 0810EC 800804EC 1570FFCC */  bne   $t3, $s0, .L80080420
/* 0810F0 800804F0 00000000 */   nop   
.L800804F4:
/* 0810F4 800804F4 AC201DB4 */  sw    $zero, %lo(gMenuTrisFlip)($at)
/* 0810F8 800804F8 3C01800E */  lui   $at, %hi(gWoodPanelCount) # $at, 0x800e
/* 0810FC 800804FC AC201DB8 */  sw    $zero, %lo(gWoodPanelCount)($at)
/* 081100 80080500 3C01800E */  lui   $at, %hi(gWoodPanelAllocCount) # $at, 0x800e
/* 081104 80080504 8FBF001C */  lw    $ra, 0x1c($sp)
/* 081108 80080508 AC301DBC */  sw    $s0, %lo(gWoodPanelAllocCount)($at)
/* 08110C 8008050C 8FB00018 */  lw    $s0, 0x18($sp)
/* 081110 80080510 03E00008 */  jr    $ra
/* 081114 80080514 27BD0050 */   addiu $sp, $sp, 0x50

