.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.30.0 */

leaf __osSetFpcCsr
cfc1       $v0, $31
ctc1       $a0, $31
jr         $ra
nop
.end __osSetFpcCsr
