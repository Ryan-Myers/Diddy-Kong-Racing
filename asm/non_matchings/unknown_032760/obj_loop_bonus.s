glabel obj_loop_bonus
/* 03BD74 8003B174 27BDFF70 */  addiu $sp, $sp, -0x90
/* 03BD78 8003B178 AFBF0054 */  sw    $ra, 0x54($sp)
/* 03BD7C 8003B17C AFB60050 */  sw    $s6, 0x50($sp)
/* 03BD80 8003B180 AFB5004C */  sw    $s5, 0x4c($sp)
/* 03BD84 8003B184 AFB40048 */  sw    $s4, 0x48($sp)
/* 03BD88 8003B188 AFB30044 */  sw    $s3, 0x44($sp)
/* 03BD8C 8003B18C AFB20040 */  sw    $s2, 0x40($sp)
/* 03BD90 8003B190 AFB1003C */  sw    $s1, 0x3c($sp)
/* 03BD94 8003B194 AFB00038 */  sw    $s0, 0x38($sp)
/* 03BD98 8003B198 E7B90030 */  swc1  $f25, 0x30($sp)
/* 03BD9C 8003B19C E7B80034 */  swc1  $f24, 0x34($sp)
/* 03BDA0 8003B1A0 E7B70028 */  swc1  $f23, 0x28($sp)
/* 03BDA4 8003B1A4 E7B6002C */  swc1  $f22, 0x2c($sp)
/* 03BDA8 8003B1A8 E7B50020 */  swc1  $f21, 0x20($sp)
/* 03BDAC 8003B1AC E7B40024 */  swc1  $f20, 0x24($sp)
/* 03BDB0 8003B1B0 AFA50094 */  sw    $a1, 0x94($sp)
/* 03BDB4 8003B1B4 8C940064 */  lw    $s4, 0x64($a0)
/* 03BDB8 8003B1B8 8C8E004C */  lw    $t6, 0x4c($a0)
/* 03BDBC 8003B1BC 8E820010 */  lw    $v0, 0x10($s4)
/* 03BDC0 8003B1C0 91CF0013 */  lbu   $t7, 0x13($t6)
/* 03BDC4 8003B1C4 0080A825 */  move  $s5, $a0
/* 03BDC8 8003B1C8 01E2082A */  slt   $at, $t7, $v0
/* 03BDCC 8003B1CC 10200056 */  beqz  $at, .L8003B328
/* 03BDD0 8003B1D0 27A40084 */   addiu $a0, $sp, 0x84
/* 03BDD4 8003B1D4 44822000 */  mtc1  $v0, $f4
/* 03BDD8 8003B1D8 0C006E9D */  jal   get_object_struct_array
/* 03BDDC 8003B1DC 468025A0 */   cvt.s.w $f22, $f4
/* 03BDE0 8003B1E0 8FB80084 */  lw    $t8, 0x84($sp)
/* 03BDE4 8003B1E4 00009025 */  move  $s2, $zero
/* 03BDE8 8003B1E8 1B00004F */  blez  $t8, .L8003B328
/* 03BDEC 8003B1EC 3C013FE0 */   li    $at, 0x3FE00000 # 1.750000
/* 03BDF0 8003B1F0 44814800 */  mtc1  $at, $f9
/* 03BDF4 8003B1F4 44804000 */  mtc1  $zero, $f8
/* 03BDF8 8003B1F8 4600B1A1 */  cvt.d.s $f6, $f22
/* 03BDFC 8003B1FC 46283282 */  mul.d $f10, $f6, $f8
/* 03BE00 8003B200 4480C000 */  mtc1  $zero, $f24
/* 03BE04 8003B204 00409825 */  move  $s3, $v0
/* 03BE08 8003B208 2416000A */  li    $s6, 10
/* 03BE0C 8003B20C 46205520 */  cvt.s.d $f20, $f10
.L8003B210:
/* 03BE10 8003B210 8E700000 */  lw    $s0, ($s3)
/* 03BE14 8003B214 C6B20010 */  lwc1  $f18, 0x10($s5)
/* 03BE18 8003B218 C6100010 */  lwc1  $f16, 0x10($s0)
/* 03BE1C 8003B21C 8E110064 */  lw    $s1, 0x64($s0)
/* 03BE20 8003B220 46128381 */  sub.s $f14, $f16, $f18
/* 03BE24 8003B224 4614703C */  c.lt.s $f14, $f20
/* 03BE28 8003B228 00000000 */  nop   
/* 03BE2C 8003B22C 4500003A */  bc1f  .L8003B318
/* 03BE30 8003B230 8FAA0084 */   lw    $t2, 0x84($sp)
/* 03BE34 8003B234 4600A107 */  neg.s $f4, $f20
/* 03BE38 8003B238 460E203C */  c.lt.s $f4, $f14
/* 03BE3C 8003B23C 00000000 */  nop   
/* 03BE40 8003B240 45000035 */  bc1f  .L8003B318
/* 03BE44 8003B244 8FAA0084 */   lw    $t2, 0x84($sp)
/* 03BE48 8003B248 C606000C */  lwc1  $f6, 0xc($s0)
/* 03BE4C 8003B24C C6A8000C */  lwc1  $f8, 0xc($s5)
/* 03BE50 8003B250 C60A0014 */  lwc1  $f10, 0x14($s0)
/* 03BE54 8003B254 46083001 */  sub.s $f0, $f6, $f8
/* 03BE58 8003B258 C6B00014 */  lwc1  $f16, 0x14($s5)
/* 03BE5C 8003B25C 46000482 */  mul.s $f18, $f0, $f0
/* 03BE60 8003B260 46105081 */  sub.s $f2, $f10, $f16
/* 03BE64 8003B264 460E7102 */  mul.s $f4, $f14, $f14
/* 03BE68 8003B268 00000000 */  nop   
/* 03BE6C 8003B26C 46021202 */  mul.s $f8, $f2, $f2
/* 03BE70 8003B270 46049180 */  add.s $f6, $f18, $f4
/* 03BE74 8003B274 0C0326B4 */  jal   sqrtf
/* 03BE78 8003B278 46083300 */   add.s $f12, $f6, $f8
/* 03BE7C 8003B27C 4616003C */  c.lt.s $f0, $f22
/* 03BE80 8003B280 00000000 */  nop   
/* 03BE84 8003B284 45000024 */  bc1f  .L8003B318
/* 03BE88 8003B288 8FAA0084 */   lw    $t2, 0x84($sp)
/* 03BE8C 8003B28C C68A0000 */  lwc1  $f10, ($s4)
/* 03BE90 8003B290 C610000C */  lwc1  $f16, 0xc($s0)
/* 03BE94 8003B294 C6840008 */  lwc1  $f4, 8($s4)
/* 03BE98 8003B298 46105482 */  mul.s $f18, $f10, $f16
/* 03BE9C 8003B29C C6060014 */  lwc1  $f6, 0x14($s0)
/* 03BEA0 8003B2A0 C690000C */  lwc1  $f16, 0xc($s4)
/* 03BEA4 8003B2A4 46062202 */  mul.s $f8, $f4, $f6
/* 03BEA8 8003B2A8 46089280 */  add.s $f10, $f18, $f8
/* 03BEAC 8003B2AC 46105000 */  add.s $f0, $f10, $f16
/* 03BEB0 8003B2B0 4618003C */  c.lt.s $f0, $f24
/* 03BEB4 8003B2B4 00000000 */  nop   
/* 03BEB8 8003B2B8 45000017 */  bc1f  .L8003B318
/* 03BEBC 8003B2BC 8FAA0084 */   lw    $t2, 0x84($sp)
/* 03BEC0 8003B2C0 82390185 */  lb    $t9, 0x185($s1)
/* 03BEC4 8003B2C4 24040022 */  li    $a0, 34
/* 03BEC8 8003B2C8 2B21000A */  slti  $at, $t9, 0xa
/* 03BECC 8003B2CC 10200011 */  beqz  $at, .L8003B314
/* 03BED0 8003B2D0 24080004 */   li    $t0, 4
/* 03BED4 8003B2D4 A2360185 */  sb    $s6, 0x185($s1)
/* 03BED8 8003B2D8 8E070014 */  lw    $a3, 0x14($s0)
/* 03BEDC 8003B2DC 8E060010 */  lw    $a2, 0x10($s0)
/* 03BEE0 8003B2E0 8E05000C */  lw    $a1, 0xc($s0)
/* 03BEE4 8003B2E4 AFA00014 */  sw    $zero, 0x14($sp)
/* 03BEE8 8003B2E8 0C002556 */  jal   func_80009558
/* 03BEEC 8003B2EC AFA80010 */   sw    $t0, 0x10($sp)
/* 03BEF0 8003B2F0 82240003 */  lb    $a0, 3($s1)
/* 03BEF4 8003B2F4 8E05000C */  lw    $a1, 0xc($s0)
/* 03BEF8 8003B2F8 2484007B */  addiu $a0, $a0, 0x7b
/* 03BEFC 8003B2FC 3089FFFF */  andi  $t1, $a0, 0xffff
/* 03BF00 8003B300 8E060010 */  lw    $a2, 0x10($s0)
/* 03BF04 8003B304 8E070014 */  lw    $a3, 0x14($s0)
/* 03BF08 8003B308 AFA00010 */  sw    $zero, 0x10($sp)
/* 03BF0C 8003B30C 0C0007AA */  jal   func_80001EA8
/* 03BF10 8003B310 01202025 */   move  $a0, $t1
.L8003B314:
/* 03BF14 8003B314 8FAA0084 */  lw    $t2, 0x84($sp)
.L8003B318:
/* 03BF18 8003B318 26520001 */  addiu $s2, $s2, 1
/* 03BF1C 8003B31C 024A082A */  slt   $at, $s2, $t2
/* 03BF20 8003B320 1420FFBB */  bnez  $at, .L8003B210
/* 03BF24 8003B324 26730004 */   addiu $s3, $s3, 4
.L8003B328:
/* 03BF28 8003B328 8FBF0054 */  lw    $ra, 0x54($sp)
/* 03BF2C 8003B32C C7B50020 */  lwc1  $f21, 0x20($sp)
/* 03BF30 8003B330 C7B40024 */  lwc1  $f20, 0x24($sp)
/* 03BF34 8003B334 C7B70028 */  lwc1  $f23, 0x28($sp)
/* 03BF38 8003B338 C7B6002C */  lwc1  $f22, 0x2c($sp)
/* 03BF3C 8003B33C C7B90030 */  lwc1  $f25, 0x30($sp)
/* 03BF40 8003B340 C7B80034 */  lwc1  $f24, 0x34($sp)
/* 03BF44 8003B344 8FB00038 */  lw    $s0, 0x38($sp)
/* 03BF48 8003B348 8FB1003C */  lw    $s1, 0x3c($sp)
/* 03BF4C 8003B34C 8FB20040 */  lw    $s2, 0x40($sp)
/* 03BF50 8003B350 8FB30044 */  lw    $s3, 0x44($sp)
/* 03BF54 8003B354 8FB40048 */  lw    $s4, 0x48($sp)
/* 03BF58 8003B358 8FB5004C */  lw    $s5, 0x4c($sp)
/* 03BF5C 8003B35C 8FB60050 */  lw    $s6, 0x50($sp)
/* 03BF60 8003B360 03E00008 */  jr    $ra
/* 03BF64 8003B364 27BD0090 */   addiu $sp, $sp, 0x90
