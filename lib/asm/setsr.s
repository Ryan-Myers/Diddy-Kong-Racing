/* The comment below is needed for this file to be picked up by generate_ld */
/* RAM_POS: 0x800D4560 */

.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.30.0 */

/* Handwritten function */
glabel __osSetSR
/* D5160 800D4560 40846000 */  mtc0       $a0, $12 /* handwritten instruction */
/* D5164 800D4564 00000000 */  nop
/* D5168 800D4568 03E00008 */  jr         $ra
/* D516C 800D456C 00000000 */   nop
