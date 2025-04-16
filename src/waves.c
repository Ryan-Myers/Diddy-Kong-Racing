#include "waves.h"
#include "types.h"
#include "macros.h"
#include <ultra64.h>
#include "memory.h"
#include "textures_sprites.h"
#include "objects.h"
#include "tracks.h"
#include "math_util.h"
#include "PRinternal/viint.h"

/************ .data ************/

f32 *D_800E3040 = NULL;
Vec2s *D_800E3044 = NULL;
s32 *D_800E3048 = NULL;
f32 *D_800E304C[] = { NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL };

Vertex *D_800E3070[2] = { NULL, NULL };
s32 *D_800E3078[2] = { NULL, NULL };
typedef struct unk800E3080 {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4[4];
    u8 pad8[0x10 - 0x8];
} unk800E3080;
// This could also be D_800E3080[2] + D_800E3088[2]
unk800E3080 *D_800E3080[4] = { NULL, NULL, NULL, NULL };

/* Size: 0x10, might just be an array? */
typedef struct unk800E3090 {
    s16 unk0, unk2, unk4, unk6, unk8, unkA, unkC, unkE;
} unk800E3090;

unk800E3090 D_800E3090[4] = {
    { 0x4000, 0x0201, 0, 0, 0, 0, 0, 0 },
    { 0x4001, 0x0203, 0, 0, 0, 0, 0, 0 },
    { 0x4000, 0x0201, 0, 0, 0, 0, 0, 0 },
    { 0x4001, 0x0203, 0, 0, 0, 0, 0, 0 },
};

TextureHeader *D_800E30D0 = NULL;
s32 *D_800E30D4 = NULL;
LevelModel_Alternate *D_800E30D8 = NULL;
s32 D_800E30DC = 0;     // Tracks an index into D_8012A1E8
s16 *D_800E30E0 = NULL; // Points to either D_800E30E8 or D_800E3110
s16 *D_800E30E4 = NULL; // Points to either D_800E30FC or D_800E3144

s16 D_800E30E8[10] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 };

s16 D_800E30FC[10] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 0 };

s16 D_800E3110[26] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 0 };

s16 D_800E3144[26] = { 0, 1, 1, 1, 2, 3, 4, 4, 4, 5, 3, 4, 4, 4, 5, 3, 4, 4, 4, 5, 6, 7, 7, 7, 8, 0 };

u8 *D_800E3178 = NULL;
s32 D_800E317C = 0;
LevelHeader_70 *D_800E3180 = NULL;
unk800E3184 *D_800E3184 = NULL;
s32 D_800E3188 = 0;
s32 D_800E318C = 0;
unk800E3190 *D_800E3190 = NULL;
Object **D_800E3194 = NULL;
Object *gWaveGeneratorObj = NULL;

/*******************************/

/************ .rodata ************/

const char D_800E9160[] = "\nCouldn't find a block to pick wave details from.\nUsing block 0 as default.";
const char D_800E91AC[] = "\n\nBlock may be specified using 'P' on water group node.";
const char D_800E91E4[] = "\nError :: can not remove a wave swell object which doesn't exist !";
const char D_800E9228[] = "\nError :: more than eight swells overlap on column %d.";
const char D_800E9260[] = "\nError :: can not add another wave swell, reached limit of %d.";

/*********************************/

/************ .bss ************/

s32 D_80129FC0;
s32 D_80129FC4;
unk80129FC8 D_80129FC8;
s32 D_8012A018;
f32 D_8012A01C;
f32 D_8012A020;
UNUSED s32 D_8012A024;
Vertex D_8012A028[2][4];
s32 D_8012A078;
TriangleBatchInfo *gWaveBatch;
TextureHeader *gWaveTexture;
s32 D_8012A084;
s32 D_8012A088;
s32 D_8012A08C;
s32 D_8012A090;
s32 D_8012A094;
s32 D_8012A098;
s32 D_8012A09C;
f32 D_8012A0A0;
f32 D_8012A0A4;
s32 gWaveBoundingBoxDiffX;
s32 gWaveBoundingBoxDiffZ;
s32 gWaveBoundingBoxX1;
s32 gWaveBoundingBoxZ1;
f32 D_8012A0B8;
f32 D_8012A0BC;
s32 D_8012A0C0;
s32 D_8012A0C4;
s32 D_8012A0C8;
s32 D_8012A0CC;
s32 D_8012A0D0;
s32 D_8012A0D4;
s32 D_8012A0D8;
s32 D_8012A0DC;
s32 D_8012A0E0;
s32 D_8012A0E8[64];
s16 D_8012A1E8[512];

typedef struct unk8012A5E8 {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s16 unk6;
    s32 unk8;
} unk8012A5E8;

unk8012A5E8 D_8012A5E8[1];
s16 D_8012A5F4;
UNUSED s32 D_8012A5F8;
UNUSED s32 D_8012A5FC;
s16 D_8012A600[144];
f32 gWavePowerBase;
f32 gWaveMagnitude;
s32 gWavePowerDivisor;

/*****************************/

#define FREE_MEM(mem)          \
    tempMem = (s32 *) mem;     \
    if (tempMem != NULL) {     \
        mempool_free(tempMem); \
        mem = NULL;            \
    }
#define FREE_TEX(tex)          \
    tempTex = tex;             \
    if (tempTex != NULL) {     \
        free_texture(tempTex); \
        tex = NULL;            \
    }

void free_waves(void) {
    TextureHeader *tempTex;
    s32 *tempMem;
    FREE_MEM(D_800E3040);
    FREE_MEM(D_800E3044);
    FREE_MEM(D_800E3048);
    FREE_MEM(D_800E304C[0]);
    FREE_MEM(D_800E3070[0]);
    FREE_MEM(D_800E3080[0]);
    FREE_TEX(D_800E30D0);
    FREE_MEM(D_800E30D4);
    FREE_MEM(D_800E30D8);
    FREE_MEM(D_800E3178);
    D_800E3190 = NULL;
    D_800E3194 = NULL;
    D_800E3184 = NULL;
    D_800E3188 = NULL;
}

void wave_init(void) {
    s32 temp;
    s32 allocSize;
    s32 i;

    free_waves();
    D_800E3040 = (f32 *) mempool_alloc_safe(D_80129FC8.unk20 << 2, COLOUR_TAG_CYAN);
    D_800E3044 = (Vec2s *) mempool_alloc_safe((D_80129FC8.unk4 << 2) * D_80129FC8.unk4, COLOUR_TAG_CYAN);
    D_800E3048 = (s32 *) mempool_alloc_safe(((D_80129FC8.unk0 + 1) << 2) * (D_80129FC8.unk0 + 1), COLOUR_TAG_CYAN);
    allocSize = ((D_80129FC8.unk0 + 1) << 2) * (D_80129FC8.unk0 + 1);
    D_800E304C[0] = mempool_alloc_safe(allocSize * ARRAY_COUNT(D_800E304C), COLOUR_TAG_CYAN);
    for (i = 1; i < ARRAY_COUNT(D_800E304C); i++) {
        D_800E304C[i] = (f32 *) (((u32) D_800E304C[0]) + (allocSize * i));
    }
    temp = (D_80129FC8.unk0 + 1);
    allocSize = (temp * 250 * (D_80129FC8.unk0 + 1));
    if (D_8012A078 != 2) {
        D_800E3070[0] = (Vertex *) mempool_alloc_safe(allocSize << 1, COLOUR_TAG_CYAN);
        D_800E3070[1] = (Vertex *) (((u32) D_800E3070[0]) + allocSize);
    } else {
        D_800E3070[0] = (Vertex *) mempool_alloc_safe(allocSize << 2, COLOUR_TAG_CYAN);
        D_800E3070[1] = (Vertex *) (((u32) D_800E3070[0]) + allocSize);
        D_800E3070[2] = (Vertex *) (((u32) D_800E3070[1]) + allocSize);
        D_800E3070[3] = (Vertex *) (((u32) D_800E3070[2]) + allocSize);
    }
    allocSize = (D_80129FC8.unk0 * 32) * D_80129FC8.unk0;
    if (D_8012A078 != 2) {
        D_800E3080[0] = mempool_alloc_safe(allocSize << 1, COLOUR_TAG_CYAN);
        D_800E3080[1] = (unk800E3080 *) (((u32) D_800E3080[0]) + allocSize);
    } else {
        D_800E3080[0] = (unk800E3080 *) mempool_alloc_safe(allocSize << 2, COLOUR_TAG_CYAN);
        D_800E3080[1] = (unk800E3080 *) (((u32) D_800E3080[0]) + allocSize);
        D_800E3080[2] = (unk800E3080 *) (((u32) D_800E3080[1]) + allocSize);
        D_800E3080[3] = (unk800E3080 *) (((u32) D_800E3080[2]) + allocSize);
    }
    D_800E30D0 = load_texture(D_80129FC8.unk2C);
}

void func_800B8134(LevelHeader *header) {
    if (D_8012A078 != 2) {
        D_80129FC8.unk0 = header->unk56;
    } else {
        D_80129FC8.unk0 = 4;
    }
    D_80129FC8.unk4 = header->unk57;
    D_80129FC8.unk8 = header->unk58;
    D_80129FC8.unkC = header->unk5A / 256.0f;
    D_80129FC8.unk10 = header->unk59 << 8;
    D_80129FC8.unk14 = header->unk5C;
    D_80129FC8.unk18 = header->unk5E / 256.0f;
    D_80129FC8.unk1C = header->unk5D << 8;
    D_80129FC8.unk20 = header->unk60 & ~1;
    if (D_8012A078 != 2) {
        D_80129FC8.unk24 = header->unk6E;
    } else {
        D_80129FC8.unk24 = 3;
    }
    D_80129FC8.unk28 = header->unk71;
    D_80129FC8.unk2C = header->unk68 & 0xFFFF;
    D_80129FC8.unk30 = header->unk6A;
    D_80129FC8.unk34 = header->unk6B;
    D_80129FC8.unk38 = header->unk6C;
    D_80129FC8.unk3C = header->unk6D;
    D_80129FC8.magnitude = header->wavePower / 256.0f;
    D_80129FC8.unk44 = header->unk64 / 256.0f;
    D_80129FC8.unk48 = header->unk66 / 256.0f;
    D_80129FC8.unk4C = header->unk70_u8;
}

#ifdef NON_MATCHING
void func_800B82B4(LevelModel *arg0, LevelHeader *arg1, s32 arg2) {
    s32 var_a0;
    s32 var_fp;
    s32 var_s0;
    s32 var_s3;
    s32 var_s5;
    s32 var_s6;
    s32 sp54;
    s32 i;
    s32 sp4C;
    s32 j;
    s32 var_s7;
    Vertex *temp_vtx;
    Vertex *temp_vtx_2;
    Vertex *temp_vtx_3;
    Vertex *temp_vtx_4;
    Vertex *temp_vtx_5;
    s32 var_t0;
    s32 var_v1;
    s32 var_t7;
    s32 var_a1;
    s32 var_t2;

    D_8012A078 = arg2;
    func_800B8134(arg1);
    wave_init();
    func_800BBDDC(arg0, arg1);
    D_8012A0A0 = (f32) gWaveBoundingBoxDiffX;
    D_8012A0A4 = (f32) gWaveBoundingBoxDiffZ;
    D_8012A0B8 = D_8012A0A0 / D_80129FC8.unk0;
    D_8012A0BC = D_8012A0A4 / D_80129FC8.unk0;
    D_8012A084 = 0;
    D_8012A088 = 0;
    D_8012A08C = ((gWaveTexture->width * D_80129FC8.unk30) * 32) / D_80129FC8.unk0;
    D_8012A090 = ((gWaveTexture->height * D_80129FC8.unk34) * 32) / D_80129FC8.unk0;
    D_8012A094 = (gWaveTexture->width * 32) - 1;
    D_8012A098 = (gWaveTexture->height * 32) - 1;
    D_8012A09C = 0;
    var_s6 = D_80129FC8.unk10;
    sp54 = (D_80129FC8.unk8 << 16) / D_80129FC8.unk20;
    var_fp = D_80129FC8.unk1C;
    sp4C = (D_80129FC8.unk14 << 16) / D_80129FC8.unk20;
    D_8012A01C = 10000.0f;
    D_8012A020 = -10000.0f;
    for (var_s7 = 0; var_s7 < D_80129FC8.unk20; var_s7++) {
        D_800E3040[var_s7] = (sins_f(var_s6) * D_80129FC8.unkC) + (sins_f(var_fp) * D_80129FC8.unk18);
        if (D_80129FC8.unk28 != 0) {
            D_800E3040[var_s7] *= 2.0f;
        }
        if (D_800E3040[var_s7] < D_8012A01C) {
            D_8012A01C = D_800E3040[var_s7];
        }
        if (D_8012A020 < D_800E3040[var_s7]) {
            D_8012A020 = D_800E3040[var_s7];
        }
        var_s6 += sp54;
        var_fp += sp4C;
    }
    save_rng_seed();
    set_rng_seed(0x57415646);

    var_s5 = 0;
    for (var_s7 = 0; var_s7 < D_80129FC8.unk4; var_s7++) {
        for (var_s0 = 0; var_s0 < D_80129FC8.unk4; var_s0++) {
            D_800E3044[var_s5].s[0] = get_random_number_from_range(0, D_80129FC8.unk20 - 1);
            D_800E3044[var_s5].s[1] = get_random_number_from_range(0, D_80129FC8.unk20 - 1);
            var_s5++;
        }
    }
    var_s5 = 0;
    var_s7 = 0;
    load_rng_seed();
    if (arg2 != 2) {
        arg2 = 2;
    } else {
        arg2 = 4;
    }
    for (var_s3 = 0; var_s3 < 25; var_s3++) {
        if (0 <= D_80129FC8.unk0) {
            do {
                for (var_s0 = 0; D_80129FC8.unk0 >= var_s0; var_s0++) {
                    for (var_a0 = 0; var_a0 < arg2; var_a0++) {
                        D_800E3070[var_a0][var_s5].x = (var_s0 * D_8012A0B8) + 0.5;
                        D_800E3070[var_a0][var_s5].z = (var_s7 * D_8012A0BC) + 0.5;
                        if (D_80129FC8.unk4C == 0) {
                            D_800E3070[var_a0][var_s5].r = 255;
                            D_800E3070[var_a0][var_s5].g = 255;
                            D_800E3070[var_a0][var_s5].b = 255;
                        } else {
                            D_800E3070[var_a0][var_s5].r = 0;
                            D_800E3070[var_a0][var_s5].g = 0;
                            D_800E3070[var_a0][var_s5].b = 0;
                        }
                        D_800E3070[var_a0][var_s5].a = 255;
                    }
                    var_s5++;
                }
                var_s7++;
            } while (D_80129FC8.unk0 >= var_s7);
            var_s7 = 0;
        }
    }

    var_s5 = 0;
    for (var_s7 = 0; var_s7 < D_80129FC8.unk0; var_s7++) {
        for (var_s0 = 0; var_s0 < D_80129FC8.unk0; var_s0++) {
            for (var_a0 = 0; var_a0 < arg2; var_a0++) {
                D_800E3080[var_a0][var_s5].unk0 = 0x40;
                D_800E3080[var_a0][var_s5].unk1 = var_s0;
                D_800E3080[var_a0][var_s5].unk2 = (var_s0 + D_80129FC8.unk0) + 1;
                D_800E3080[var_a0][var_s5].unk3 = var_s0 + 1;
                var_s5++;
                D_800E3080[var_a0][var_s5].unk0 = 0x40;
                D_800E3080[var_a0][var_s5].unk1 = var_s0 + 1;
                D_800E3080[var_a0][var_s5].unk2 = (var_s0 + D_80129FC8.unk0) + 1;
                D_800E3080[var_a0][var_s5].unk3 = (var_s0 + D_80129FC8.unk0) + 2;
                var_s5--;
            }
            var_s5 += 2;
        }
    }
    func_800BC6C8();

    var_t0 = D_80129FC8.unk0;
    // a1 (D_800E3070[0])
    // v0 (a1 + var_t0)
    // a2 (a1 + var_v1)
    // v0 (a1 + var_v1 + var_t0)
    for (i = 0; i < ARRAY_COUNT(D_800E3070); i++) {
        // @note this should probably be the following for loop (or something like it, anyway)
        // but the change of var_s3 does not work

        // for (j = 0; j < 4; j++) {
        //     if (j == 0) {
        //         var_s3 = 0;
        //     } else if (j == 1) {
        //         var_s3 = var_t0;
        //     } else if (j == 2) {
        //         var_s3 =  var_t0 * (var_t0 + 1);
        //     } else {
        //         var_s3 =  var_t0 * (var_t0 + 1) + var_t0;
        //     }
        //     temp_vtx_2 = &D_800E3070[i][var_s3];
        //     temp_vtx = &D_8012A028[i][j];
        //     temp_vtx->x = D_800E3070[i][var_s3].x;
        //     temp_vtx->y = 0;
        //     temp_vtx->z = D_800E3070[i][var_s3].z;
        //     temp_vtx->r = D_800E3070[i][var_s3].r;
        //     temp_vtx->g = D_800E3070[i][var_s3].g;
        //     temp_vtx->b = D_800E3070[i][var_s3].b;
        //     temp_vtx->a = D_800E3070[i][var_s3].a;
        // }

        temp_vtx_2 = &D_800E3070[i][0];
        temp_vtx = &D_8012A028[i][0];
        temp_vtx->x = temp_vtx_2->x;
        temp_vtx->y = 0;
        temp_vtx->z = temp_vtx_2->z;
        temp_vtx->r = temp_vtx_2->r;
        temp_vtx->g = temp_vtx_2->g;
        temp_vtx->b = temp_vtx_2->b;
        temp_vtx->a = temp_vtx_2->a;

        temp_vtx_3 = &D_800E3070[i][var_t0];
        temp_vtx = &D_8012A028[i][1];
        temp_vtx->x = temp_vtx_3->x;
        temp_vtx->y = 0;
        temp_vtx->z = temp_vtx_3->z;
        temp_vtx->r = temp_vtx_3->r;
        temp_vtx->g = temp_vtx_3->g;
        temp_vtx->b = temp_vtx_3->b;
        temp_vtx->a = temp_vtx_3->a;

        var_t2 = var_t0 + 1;
        var_v1 = (var_t0 + 1) * var_t0;
        temp_vtx_4 = &D_800E3070[i][var_v1];
        temp_vtx = &D_8012A028[i][2];
        temp_vtx->x = temp_vtx_4->x;
        temp_vtx->y = 0;
        temp_vtx->z = temp_vtx_4->z;
        temp_vtx->r = temp_vtx_4->r;
        temp_vtx->g = temp_vtx_4->g;
        temp_vtx->b = temp_vtx_4->b;
        temp_vtx->a = temp_vtx_4->a;

        var_v1 = (var_t0 + 1) * var_t0;
        temp_vtx_5 = &(&D_800E3070[i][var_v1])[var_t0];
        temp_vtx = &D_8012A028[i][3];
        temp_vtx->x = temp_vtx_5->x;
        temp_vtx->y = 0;
        temp_vtx->z = temp_vtx_5->z;
        temp_vtx->r = temp_vtx_5->r;
        temp_vtx->g = temp_vtx_5->g;
        temp_vtx->b = temp_vtx_5->b;
        temp_vtx->a = temp_vtx_5->a;
    }

    func_800BCC70(arg0);
    if (D_80129FC8.unk24 == 3) {
        D_800E30E0 = D_800E30E8;
        D_800E30E4 = D_800E30FC;
    } else {
        D_80129FC8.unk24 = 5;
        D_800E30E0 = D_800E3110;
        D_800E30E4 = D_800E3144;
    }
    D_800E3188 = 0;
    gWavePowerDivisor = 0;
    gWaveGeneratorObj = NULL;
    D_8012A018 = 0;
}
#else
#pragma GLOBAL_ASM("asm/nonmatchings/waves/func_800B82B4.s")
#endif

void func_800B8B8C(void) {
    s32 temp_v0;
    s32 phi_v0;
    s32 i;

    D_800E30DC = 0;
    phi_v0 = 0;

    for (i = 0; i < D_8012A0D8 * D_8012A0DC; i++) {
        temp_v0 = phi_v0 + 1;
        D_800E30D4[i] = 0;
        phi_v0 = temp_v0;
    }
}

#ifdef NON_EQUIVALENT
void func_800B8C04(s32 xPosition, s32 yPosition, s32 zPosition, s32 currentViewport, s32 updateRate) {
    s32 i;
    s32 j;
    s32 k;
    s32 var_t4;
    s32 tempXPosRatio;
    u32 var_t2;
    s32 var_v1;
    s32 xPosRatio;
    s32 zPosRatio;
    s32 var_a0;
    s32 var_t5;
    s32 var_s4;
    s32 var_t9;
    unk8012A5E8 *temp;

    // possible fake:
    xPosRatio = (xPosition - D_8012A0D0) / gWaveBoundingBoxDiffX;
    zPosRatio = (zPosition - D_8012A0D4) / gWaveBoundingBoxDiffZ;
    D_8012A5E8[0].unk0 = -1;
    D_8012A5F4 = -1;

    // This is incorrect because the assembly compares
    // var_v1 != gWavePowerBase
    // however gWavePowerBase is a f32
    // so instead we (for now) set every 6th values in the struct to -1
    // D_8012A600 seems unused anyway though
    for (var_v1 = 0; var_v1 < 144; var_v1 += 24) {
        D_8012A600[var_v1] = -1;
        D_8012A600[var_v1 + 6] = -1;
        D_8012A600[var_v1 + 12] = -1;
        D_8012A600[var_v1 + 18] = -1;
    }

    if (D_80129FC8.unk28 != 0) {
        var_t5 = gWaveBoundingBoxDiffZ;
        var_v1 = 0;
        var_s4 = 0;
        if ((gWaveBoundingBoxDiffX >> 1) < ((xPosition - (xPosRatio * gWaveBoundingBoxDiffX)) - D_8012A0D0)) {
            var_v1 = 8;
        }
        if ((gWaveBoundingBoxDiffZ >> 1) < ((zPosition - (zPosRatio * gWaveBoundingBoxDiffZ)) - D_8012A0D4)) {
            var_s4 = 16;
        }

        for (var_v1 -= (D_80129FC8.unk24 >> 1) * 8; var_v1 < 0; var_v1 += 16) {
            xPosRatio -= 1;
        }

        for (var_s4 -= (D_80129FC8.unk24 >> 1) * 16; var_s4 < 0; var_s4 += 32) {
            zPosRatio -= 1;
        }

        for (i = 0; i < D_80129FC8.unk24; i++) {
            if (zPosRatio >= 0) {
                if (zPosRatio < D_8012A0DC) {
                    var_t5 = var_v1;
                    tempXPosRatio = xPosRatio;
                    var_t2 = (zPosRatio * D_8012A0D8) + xPosRatio;
                    for (j = 0; j < D_80129FC8.unk24; j++) {
                        // clang-format off
                        if (
                            (tempXPosRatio >= 0) &&
                            (tempXPosRatio < D_8012A0D8) &&
                            (D_8012A0E8[zPosRatio] & (1 << tempXPosRatio))
                        ) {
                            // clang-format on
                            var_t4 = var_t5 + var_s4;
                            D_800E30D4[var_t2] |= D_800E30E0[i * D_80129FC8.unk24 + j] << var_t4;
                            for (k = 0; k < D_8012A0E0; k++) {
                                if (var_t2 == (&D_800E30D8[k])->unkC) {
                                    temp = &D_8012A5E8[k];
                                    temp->unk0 = k;
                                    temp->unk2 = var_t4 >> 3;
                                    temp->unk8 = k * D_800E317C;
                                    temp->unk4 = (&D_800E30D8[k])->unk12;
                                    if (var_t5 != 0) {
                                        temp->unk8 = k * D_800E317C + D_80129FC8.unk0;
                                        temp->unk4 += D_80129FC8.unk0;
                                        while (temp->unk4 >= D_80129FC8.unk4) {
                                            temp->unk4 -= D_80129FC8.unk4;
                                        }
                                    }
                                    temp->unk6 = (&D_800E30D8[k])->unk10;
                                    if (var_s4 != 0) {
                                        temp->unk8 += ((D_80129FC8.unk0 * 2) + 1) * D_80129FC8.unk0;
                                        temp->unk6 += D_80129FC8.unk0;
                                        while (temp->unk6 >= D_80129FC8.unk4) {
                                            temp->unk6 -= D_80129FC8.unk4;
                                        }
                                    }
                                    k = 0x7FFF;
                                }
                            }
                        }
                        var_t5 += 8;
                        if (var_t5 > 8) {
                            var_t5 -= 16;
                            tempXPosRatio += 1;
                            var_t2 += 1;
                        }
                    }
                }
            }
            var_s4 += 16;
            if (var_s4 > 16) {
                var_s4 -= 32;
                zPosRatio += 1;
            }
        }
    } else {
        xPosRatio -= D_80129FC8.unk24 >> 1; // a1
        zPosRatio -= D_80129FC8.unk24 >> 1; // s7
        for (i = 0; i < D_80129FC8.unk24; i++, zPosRatio++) {
            if ((zPosRatio >= 0) && (zPosRatio < D_8012A0DC)) {
                tempXPosRatio = xPosRatio;
                var_t2 = (zPosRatio * D_8012A0D8) + tempXPosRatio;
                for (j = 0; j < D_80129FC8.unk24; j++, tempXPosRatio++, var_t2++) {

                    // clang-format off
                    if (
                        (tempXPosRatio >= 0) &&
                        (tempXPosRatio < D_8012A0D8) &&
                        (D_8012A0E8[zPosRatio] & (1 << tempXPosRatio))
                    ) {
                        // clang-format on
                        D_800E30D4[var_t2] = D_800E30E0[i * D_80129FC8.unk24 + j];
                        for (k = 0; k < D_8012A0E0; k++) {
                            if (var_t2 == (&D_800E30D8[k])->unkC) {
                                temp = &D_8012A5E8[k];
                                temp->unk0 = k;
                                temp->unk2 = 0;
                                temp->unk4 = (&D_800E30D8[k])->unk12;
                                temp->unk6 = (&D_800E30D8[k])->unk10;
                                temp->unk8 = k * D_800E317C;
                                k = 0x7FFF;
                            }
                        }
                    }
                }
            }
        }
    }
    func_800BA288(currentViewport, updateRate);
}
#else
#pragma GLOBAL_ASM("asm/nonmatchings/waves/func_800B8C04.s")
#endif

s32 func_800B9228(LevelModelSegment *arg0) {
    s32 v0 = 0;
    s32 result = FALSE;
    while (v0 < D_8012A0E0 && arg0 != D_800E30D8[v0].unk00) {
        v0++;
    };
    if (D_800E30D4[D_800E30D8[v0].unkC]) {
        result = TRUE;
        D_8012A1E8[D_800E30DC++] = v0;
    }
    return result;
}

void func_800B92F4(s32 arg0, s32 arg1) {
    s32 i;
    s32 var_s2;
    s32 j;
    f32 temp_f22;
    f32 var_f20;
    s32 sp98;
    s32 var_v0;
    s32 sp90;
    s32 sp8C;
    s32 sp88;
    s32 sp84;
    s32 var_v1;
    s32 vertexIdx;
    s32 var_s1;
    s32 k;
    Vertex *vertices;
    LevelModel_Alternate *sp6C;

    temp_f22 = (1.0f - D_80129FC8.unk44) / 255.0f;
    sp6C = &D_800E30D8[arg0];
    sp90 = (D_80129FC8.unk0 + 1) * (D_80129FC8.unk0 + 1);
    for (k = 0; D_8012A5E8[k].unk0 != -1; k++) {
        if (arg0 != D_8012A5E8[k].unk0) {
            continue;
        }

        if (D_80129FC8.unk28 != 0) {
            sp98 = (((u32) D_800E30D4[sp6C->unkC] >> (D_8012A5E8[k].unk2 * 8)) & 0xFF) - 1;
            sp8C = (D_8012A5E8[k].unk2 & 1) * D_80129FC8.unk0;
            sp88 = ((D_8012A5E8[k].unk2 & 2) >> 1) * D_80129FC8.unk0;
        } else {
            sp98 = (D_800E30D4[sp6C->unkC] & 0xFF) - 1;
            sp8C = 0;
            sp88 = 0;
        }

        sp84 = D_8012A5E8[k].unk6;
        vertices = &D_800E3070[D_8012A018 + arg1][sp90 * sp98];
        sp98 = D_800E30E4[sp98];
        vertexIdx = 0;
        for (i = 0; i <= D_80129FC8.unk0; i++) {
            var_s1 = D_8012A5E8[k].unk4;
            var_s2 = (sp84 * D_80129FC8.unk4) + var_s1;
            for (j = 0; j <= D_80129FC8.unk0; j++) {
                var_f20 =
                    (D_800E3040[D_800E3044[var_s2].s[0]] + D_800E3040[D_800E3044[var_s2].s[1]]) * D_80129FC8.magnitude;
                if (D_800E3188 > 0) {
                    var_f20 += func_800BEFC4(arg0, j + sp8C, i + sp88);
                }
                var_f20 *= D_800E304C[sp98][vertexIdx];
                var_v0 = D_800E3178[D_8012A5E8[k].unk8];

                // clang-format off
                var_v0 <<= 1; \
                D_8012A5E8[k].unk8++;
                // clang-format on
                if (var_v0 < 0xFF) {
                    var_f20 *= D_80129FC8.unk44 + ((f32) var_v0 * temp_f22);
                }
                var_v0 += (s32) (var_f20 * D_80129FC8.unk48);
                if (var_v0 >= 0x100) {
                    var_v0 = 0xFF;
                } else if (var_v0 < 0) {
                    var_v0 = 0;
                }
                var_v0 += ((0xFF - var_v0) * sp6C->unk14[arg1 >> 1].unk0[D_8012A5E8[k].unk2]) >> 7;
                vertices[vertexIdx].y = var_f20;
                if (var_v0 < 0xC0) {
                    var_v1 = 0xFF;
                } else {
                    var_v1 = ((0xFF - var_v0) * 4) & 0xFF;
                }
                vertices[vertexIdx].r = var_v1;
                vertices[vertexIdx].g = var_v1;
                vertices[vertexIdx].b = var_v1;
                if (var_v0 < 0x40) {
                    var_v1 = (var_v0 * 4) & 0xFF;
                } else {
                    var_v1 = 0xFF;
                }
                vertices[vertexIdx].a = var_v1;
                vertexIdx++;
                var_s1++;
                var_s2++;
                if (var_s1 >= D_80129FC8.unk4) {
                    var_s1 -= D_80129FC8.unk4;
                    var_s2 -= D_80129FC8.unk4;
                }
            }
            sp84++;
            if (sp84 >= D_80129FC8.unk4) {
                sp84 -= D_80129FC8.unk4;
            }
            if (D_80129FC8.unk28 != 0) {
                D_8012A5E8[k].unk8 += D_80129FC8.unk0;
            }
        }
    }
}

void func_800B97A8(s32 arg0, s32 arg1) {
    s32 var_v0;
    f32 temp_f26;
    s32 vertexIdx;
    s32 spA8;
    f32 var_f20;
    s32 spA0;
    s32 sp9C;
    s32 sp98;
    s32 var_a0;
    f32 var_f28;
    s32 var_s1;
    s32 i;
    s32 var_s2;
    s32 j;
    Vertex *vertices;
    LevelModel_Alternate *sp78;
    s32 k;

    k = 0;
    temp_f26 = D_8012A020 * 2.0f - D_8012A01C * 2.0f;
    spA0 = (D_80129FC8.unk0 + 1) * (D_80129FC8.unk0 + 1);
    sp78 = &D_800E30D8[arg0];
    if (temp_f26 <= 0) {
        var_f28 = 0;
    } else {
        var_f28 = 1.0f / temp_f26;
    }

    temp_f26 = D_8012A01C * 2.0f;
    for (; D_8012A5E8[k].unk0 != -1; k++) {
        if (arg0 != D_8012A5E8[k].unk0) {
            continue;
        }

        if (D_80129FC8.unk28 != 0) {
            spA8 = (((u32) D_800E30D4[sp78->unkC] >> (D_8012A5E8[k].unk2 * 8)) & 0xFF) - 1;
            sp9C = (D_8012A5E8[k].unk2 & 1) * D_80129FC8.unk0;
            sp98 = ((s32) (D_8012A5E8[k].unk2 & 2) >> 1) * D_80129FC8.unk0;
        } else {
            spA8 = (D_800E30D4[sp78->unkC] & 0xFF) - 1;
            sp9C = 0;
            sp98 = 0;
        }

        var_a0 = D_8012A5E8[k].unk6;
        vertices = &D_800E3070[D_8012A018 + arg1][spA0 * spA8];
        spA8 = D_800E30E4[spA8];
        i = 0;
        vertexIdx = 0;
        for (; i <= D_80129FC8.unk0; i++) {
            var_s1 = D_8012A5E8[k].unk4;
            var_s2 = (var_a0 * D_80129FC8.unk4) + var_s1;
            for (j = 0; j <= D_80129FC8.unk0; j++) {
                var_f20 =
                    (D_800E3040[D_800E3044[var_s2].s[0]] + D_800E3040[D_800E3044[var_s2].s[1]]) * D_80129FC8.magnitude;
                if (D_800E3188 > 0) {
                    var_f20 += func_800BEFC4(arg0, j + sp9C, i + sp98);
                }
                var_f20 *= D_800E304C[spA8][vertexIdx];
                vertices[vertexIdx].y = var_f20;
                var_f20 = (var_f20 - temp_f26) * var_f28;
                if (var_f20 > 1.0f) {
                    var_f20 = 1.0f;
                } else if (var_f20 < 0) {
                    var_f20 = 0;
                }
                var_v0 = (0 * var_f20);
                var_v0 += 0xFF;
                vertices[vertexIdx].r = var_v0;
                vertices[vertexIdx].g = var_v0;
                vertices[vertexIdx].b = var_v0;
                vertices[vertexIdx].a = 0xFF;
                vertexIdx++;
                var_s1++;
                var_s2++;
                if (var_s1 >= D_80129FC8.unk4) {
                    var_s1 -= D_80129FC8.unk4;
                    var_s2 -= D_80129FC8.unk4;
                }
            }
            var_a0++;
            if (var_a0 >= D_80129FC8.unk4) {
                var_a0 -= D_80129FC8.unk4;
            }
            if (D_80129FC8.unk28 != 0) {
                D_8012A5E8[k].unk8 += D_80129FC8.unk0;
            }
        }
    }
}

#pragma GLOBAL_ASM("asm/nonmatchings/waves/func_800B9C18.s")

void func_800BA288(s32 arg0, s32 arg1) {
    s32 i;
    s32 j;

    arg1 <<= 3;
    for (i = 0; i < D_8012A0E0; i++) {
        if (D_8012A0E8[D_800E30D8[i].unkB] & (1 << D_800E30D8[i].unkA)) {
            if (D_80129FC8.unk28 != 0) {
                for (j = 0; j < 4; j++) {
                    s32 ti = j << 3;
                    if (D_800E30D4[D_800E30D8[i].unkC] & (0xFF << ti)) {
                        if (arg1 < D_800E30D8[i].unk14[arg0].unk0[j]) {
                            D_800E30D8[i].unk14[arg0].unk0[j] -= arg1;
                        } else {
                            D_800E30D8[i].unk14[arg0].unk0[j] = 0;
                        }
                    } else {
                        if (D_800E30D8[i].unk14[arg0].unk0[j] + arg1 < 128) {
                            D_800E30D8[i].unk14[arg0].unk0[j] += arg1;
                        } else {
                            D_800E30D8[i].unk14[arg0].unk0[j] = 128;
                        }
                    }
                }
            } else {
                if (D_800E30D4[D_800E30D8[i].unkC]) {
                    if (arg1 < D_800E30D8[i].unk14[arg0].unk0[0]) {
                        D_800E30D8[i].unk14[arg0].unk0[0] -= arg1;
                    } else {
                        D_800E30D8[i].unk14[arg0].unk0[0] = 0;
                    }
                } else {
                    if (D_800E30D8[i].unk14[arg0].unk0[0] + arg1 < 128) {
                        D_800E30D8[i].unk14[arg0].unk0[0] += arg1;
                    } else {
                        D_800E30D8[i].unk14[arg0].unk0[0] = 128;
                    }
                }
            }
        }
    }
}

// https://decomp.me/scratch/h4uac
#pragma GLOBAL_ASM("asm/nonmatchings/waves/func_800BA4B8.s")
#pragma GLOBAL_ASM("asm/nonmatchings/waves/func_800BA8E4.s")

f32 func_800BB2F4(s32 arg0, f32 arg1, f32 arg2, Vec3f *arg3) {
    f32 spA4;
    f32 spA0;
    f32 var_f12;
    f32 var_f2;
    f32 sp94;
    f32 sp90;
    f32 var_f16;
    f32 arg3X;
    f32 arg3Z;
    f32 arg3Y;
    s32 var_a0;
    f32 sp78;
    s32 var_v0;
    s32 sp70;
    s32 sp6C;
    s32 var_t0;
    s32 var_a3;
    s32 sp60;
    u8 *tempD_800E3178;
    s32 sp58;
    s32 pad;

    if (arg0 < 0 || arg0 >= D_8012A0E0) {
        arg0 = 0;
    }

    sp78 = D_800E30D8[arg0].unk6;

    sp90 = D_8012A0BC;
    sp94 = D_8012A0B8;
    var_f16 = (1.0f - D_80129FC8.unk44) / 127.0f;
    sp58 = arg0 * D_800E317C;

    if (D_80129FC8.unk28 != 0) {
        sp90 *= 0.5f;
        sp94 *= 0.5f;
        sp60 = (D_80129FC8.unk0 * 2) + 1;
    } else {
        sp60 = D_80129FC8.unk0 + 1;
    }

    arg1 -= D_800E30D8[arg0].unk4;
    if (arg1 < 0.0f) {
        arg1 = 0.0f;
    } else if (D_8012A0A0 <= arg1) {
        arg1 = D_8012A0A0 - 1; // needs to be 1 instead of 1.0f
    }

    arg2 -= D_800E30D8[arg0].unk8;
    if (arg2 < 0.0f) {
        arg2 = 0.0f;
    } else if (D_8012A0A4 <= arg2) {
        arg2 = D_8012A0A4 - 1; // needs to be 1 instead of 1.0f
    }

    sp70 = arg1 / sp94;
    sp6C = arg2 / sp90;
    arg1 -= sp70 * sp94;
    arg2 -= sp6C * sp90;

    var_t0 = D_800E30D8[arg0].unk12 + sp70;
    while (var_t0 >= D_80129FC8.unk4) {
        var_t0 -= D_80129FC8.unk4;
    }

    var_a3 = D_800E30D8[arg0].unk10 + sp6C;
    while (var_a3 >= D_80129FC8.unk4) {
        var_a3 -= D_80129FC8.unk4;
    }

    var_v0 = 0;
    if (arg2 != sp90 && arg1 < (((sp90 - arg2) / sp90) * sp94)) {
        var_v0 = 1;
    }

    if (var_v0) {
        var_a0 = (var_a3 * D_80129FC8.unk4) + var_t0;
        spA0 = (D_800E3040[D_800E3044[var_a0].s[0]] + D_800E3040[D_800E3044[var_a0].s[1]]) * D_80129FC8.magnitude;
        var_a0 = sp58 + sp70 + (sp6C * sp60);
        if (D_800E3188 > 0) {
            spA0 += func_800BEFC4(arg0, sp70, sp6C);
        }

        var_v0 = D_800E3178[var_a0];
        if (D_800E3178[var_a0] < 0x7F) {
            spA0 *= D_80129FC8.unk44 + (var_v0 * var_f16);
        }

        var_a0 = (var_a3 + 1) >= D_80129FC8.unk4 ? var_t0 : ((var_a3 + 1) * D_80129FC8.unk4) + var_t0;
        var_f12 = (D_800E3040[D_800E3044[var_a0].s[0]] + D_800E3040[D_800E3044[var_a0].s[1]]) * D_80129FC8.magnitude;
        if (D_800E3188 > 0) {
            var_f12 += func_800BEFC4(arg0, sp70, sp6C + 1);
        }
        var_a0 = sp58 + sp70 + ((sp6C + 1) * sp60);
        var_v0 = D_800E3178[var_a0];
        if (D_800E3178[var_a0] < 0x7F) {
            var_f12 *= D_80129FC8.unk44 + (var_v0 * var_f16);
        }

        var_a0 =
            (var_t0 + 1) >= D_80129FC8.unk4 ? var_a3 * D_80129FC8.unk4 : (var_t0 + 0) + var_a3 * D_80129FC8.unk4 + 1;
        var_f2 = (D_800E3040[D_800E3044[var_a0].s[0]] + D_800E3040[D_800E3044[var_a0].s[1]]) * D_80129FC8.magnitude;
        if (D_800E3188 > 0) {
            var_f2 += func_800BEFC4(arg0, sp70 + 1, sp6C);
        }
        var_a0 = sp58 + sp70 + (sp6C * sp60);
        var_a0 += 1;
        var_v0 = D_800E3178[var_a0];
        if (D_800E3178[var_a0] < 0x7F) {
            var_f2 *= D_80129FC8.unk44 + (var_v0 * var_f16);
        }

        if (D_80129FC8.unk28 != 0) {
            spA0 *= 0.5f;
            var_f12 *= 0.5f;
            var_f2 *= 0.5f;
        }

        spA4 = 0.0f;
        arg3X = (spA0 - var_f2) * sp90;
        arg3Z = sp90 * sp94;
        arg3Y = (spA0 - var_f12) * sp94;
    } else {
        var_a0 =
            (var_t0 + 1) >= D_80129FC8.unk4 ? var_a3 * D_80129FC8.unk4 : (var_t0 + 0) + (var_a3 * D_80129FC8.unk4) + 1;
        spA0 = (D_800E3040[D_800E3044[var_a0].s[0]] + D_800E3040[D_800E3044[var_a0].s[1]]) * D_80129FC8.magnitude;
        if (D_800E3188 > 0) {
            spA0 += func_800BEFC4(arg0, sp70 + 1, sp6C);
        }
        var_a0 = sp58 + sp70 + (sp6C * sp60);
        var_a0 += 1;
        var_v0 = D_800E3178[var_a0];
        if (D_800E3178[var_a0] < 0x7F) {
            spA0 *= D_80129FC8.unk44 + (var_v0 * var_f16);
        }

        var_a0 = (var_a3 + 1) >= D_80129FC8.unk4 ? var_t0 : ((var_a3 + 1) * D_80129FC8.unk4) + var_t0;
        var_f12 = (D_800E3040[D_800E3044[var_a0].s[0]] + D_800E3040[D_800E3044[var_a0].s[1]]) * D_80129FC8.magnitude;
        if (D_800E3188 > 0) {
            var_f12 += func_800BEFC4(arg0, sp70, sp6C + 1);
        }
        var_a0 = sp58 + sp70 + ((sp6C + 1) * sp60);
        var_v0 = (tempD_800E3178 = D_800E3178)[var_a0];
        if (var_v0 < 0x7F) {
            var_f12 *= D_80129FC8.unk44 + (var_v0 * var_f16);
        }

        var_a0 = (var_t0 + 1) >= D_80129FC8.unk4 ? 0 : (var_t0 + 1);
        if ((var_a3 + 1) < D_80129FC8.unk4) {
            var_a0 += (var_a3 + 1) * D_80129FC8.unk4;
        }

        var_f2 = (D_800E3040[D_800E3044[var_a0].s[0]] + D_800E3040[D_800E3044[var_a0].s[1]]) * D_80129FC8.magnitude;
        if (D_800E3188 > 0) {
            var_f2 += func_800BEFC4(arg0, sp70 + 1, sp6C + 1);
        }
        var_a0 = sp58 + sp70 + ((sp6C + 1) * sp60);
        var_a0 += 1;
        var_v0 = D_800E3178[var_a0];
        if (var_v0 < 0x7F) {
            var_f2 *= D_80129FC8.unk44 + (var_v0 * var_f16);
        }

        if (D_80129FC8.unk28 != 0) {
            spA0 *= 0.5f;
            var_f12 *= 0.5f;
            var_f2 *= 0.5f;
        }

        spA4 = sp94;
        arg3X = sp90 * (var_f12 - var_f2);
        arg3Z = sp90 * sp94;
        arg3Y = sp94 * (spA0 - var_f2);
    }

    var_f16 = sqrtf((arg3X * arg3X) + (arg3Z * arg3Z) + (arg3Y * arg3Y));
    if (var_f16 != 0.0 && arg3Z != 0.0) {
        arg3X /= var_f16;
        arg3Z /= var_f16;
        arg3Y /= var_f16;
        sp78 -= (((arg3X * arg1) + (arg3Y * arg2)) - ((spA4 * arg3X) + (spA0 * arg3Z))) / arg3Z;
    }

    if (arg3 != NULL) {
        arg3->x = arg3X;
        arg3->y = arg3Z;
        arg3->z = arg3Y;
    }

    return sp78;
}

void func_800BBDDC(LevelModel *level, LevelHeader *header) {
    func_800BBE08(level, (unk800BBE08_arg1 *) header);
    func_800BBF78(level);
}

// TODO: arg1 should be a LevelHeader
void func_800BBE08(LevelModel *level, unk800BBE08_arg1 *arg1) {
    s16 numSegments;
    s32 j;
    TriangleBatchInfo *curBatch;
    s32 i;
    s32 temp_t6;
    LevelModelSegmentBoundingBox *bb;
    LevelModelSegment *segment;

    numSegments = level->numberOfSegments;
    curBatch = 0;

    for (i = 0; curBatch == 0 && i < numSegments; i++) {
        segment = &level->segments[i];
        for (j = 0; curBatch == 0 && j < segment->numberOfBatches; j++) {
            if ((segment->batches[j].flags & (BATCH_FLAGS_UNK01000000 | BATCH_FLAGS_WATER | BATCH_FLAGS_HIDDEN)) ==
                (BATCH_FLAGS_UNK01000000 | BATCH_FLAGS_WATER)) {
                curBatch = &segment->batches[j];
            }
        }
    }

    if (curBatch == 0) {
        i = 0;
    } else {
        i--;
    }
    bb = &level->segmentsBoundingBoxes[i];
    gWaveBoundingBoxDiffX = bb->x2 - bb->x1;
    gWaveBoundingBoxDiffZ = bb->z2 - bb->z1;
    gWaveBoundingBoxX1 = bb->x1;
    gWaveBoundingBoxZ1 = bb->z1;
    gWaveBatch = curBatch;
    gWaveTexture = level->textures[curBatch->textureIndex].texture;
    temp_t6 = (curBatch->flags & (BATCH_FLAGS_UNK40000000 | BATCH_FLAGS_UNK20000000 | BATCH_FLAGS_UNK10000000)) >> 28;
    if (temp_t6 > 0) {
        D_800E3180 = (LevelHeader_70 *) arg1->unk70[temp_t6];
    } else {
        D_800E3180 = 0;
    }
}

#pragma GLOBAL_ASM("asm/nonmatchings/waves/func_800BBF78.s")
#pragma GLOBAL_ASM("asm/nonmatchings/waves/func_800BC6C8.s")
#pragma GLOBAL_ASM("asm/nonmatchings/waves/func_800BCC70.s")
#pragma GLOBAL_ASM("asm/nonmatchings/waves/func_800BDC80.s")
// https://decomp.me/scratch/2RF3k
#pragma GLOBAL_ASM("asm/nonmatchings/waves/func_800BE654.s")

/**
 * Finds the wave height and returns it for the spinning log object.
 */
f32 log_wave_height(Object_Log *log, s32 updateRate) {
    s32 var_t0;
    f32 y;

    log->unk4 += updateRate;
    while (log->unk4 >= log->unk6) {
        log->unk4 -= log->unk6;
    }
    var_t0 = log->unkE[log->unk4 >> 1];
    if (log->unk4 & 1) {
        if (log->unk4 + 1 >= log->unk6) {
            var_t0 += log->unkE[0];
        } else {
            var_t0 += log->unkE[(log->unk4 >> 1) + 1];
        }
        if (log->unk2 > 0) {
            var_t0 <<= (log->unk2 + 0x1F);
        } else {
            var_t0 >>= 1;
        }
    } else {
        var_t0 <<= log->unk2;
    }
    y = (((f32) var_t0 / 16.0) + (f32) log->unk0);
    y *= D_80129FC8.magnitude;
    y += func_800BEFC4(log->unkC, log->unk8, log->unkA);
    return y;
}

f32 func_800BEFC4(s32 arg0, s32 arg1, s32 arg2) {
    f32 temp_f0;
    f32 temp_f12;
    f32 temp_f20;
    f32 temp_f22;
    f32 temp_f24;
    f32 temp_f26;
    f32 temp_f30;
    f32 var_f0;
    f32 var_f28;
    f32 var_f2;
    u32 var_s0;
    s32 temp_a1;
    s32 var_s3;
    s32 var_v1;
    s32 temp_0;
    unk800E3184 *temp_a3;
    unk800E3190 *temp_s1;

    var_f28 = 0.0f;
    if (D_800E3188 <= 0) {
        return var_f28;
    }
    var_f0 = D_8012A0B8;
    var_v1 = D_80129FC8.unk0;
    var_f2 = D_8012A0BC;
    if (D_80129FC8.unk28 != 0) {
        var_f0 *= 0.5f;
        var_v1 *= 2;
        var_f2 *= 0.5f;
    }
    temp_a1 = ((&D_800E30D8[arg0])->unkA * var_v1) + arg1;
    temp_a3 = &D_800E3184[temp_a1];
    if (temp_a3->unk0[0] != 0xFF) {
        temp_0 = (arg2) + (var_v1 * (&D_800E30D8[arg0])->unkB);
        temp_f30 = D_8012A0D0 + (temp_a1 * var_f0);
        temp_f24 = D_8012A0D4 + (temp_0 * var_f2);
        temp_f26 = 0;
        var_s3 = 0;
        do {
            temp_s1 = &D_800E3190[temp_a3->unk0[var_s3]];
            if ((temp_s1->unk0 <= temp_f24) && (temp_f24 <= temp_s1->unk4)) {
                temp_f20 = temp_f30 - temp_s1->unk8;
                temp_f22 = temp_f24 - temp_s1->unkC;
                temp_f12 = (temp_f20 * temp_f20) + (temp_f22 * temp_f22);
                if (temp_f12 < temp_s1->unk14) {
                    temp_f0 = sqrtf(temp_f12);
                    var_s0 = (u16) temp_s1->unk1A;
                    if (temp_s1->unk31 != 0) {
                        if (temp_f20 < temp_f26) {
                            var_s0 -= (s32) (temp_f20 * temp_s1->unk20);
                        } else {
                            var_s0 += (s32) (temp_f20 * temp_s1->unk20);
                        }
                    } else if (temp_s1->unk32 != 0) {
                        if (temp_f20 < temp_f26) {
                            var_s0 -= (s32) (temp_f22 * temp_s1->unk20);
                        } else {
                            var_s0 += (s32) (temp_f22 * temp_s1->unk20);
                        }
                    } else {
                        var_s0 += (s32) (temp_f0 * temp_s1->unk20);
                    }
                    temp_f20 = coss_f((s16) (s32) ((temp_f0 * 65536.0f) / temp_s1->unk10));
                    var_f28 += temp_s1->unk24 * sins_f(var_s0) * temp_f20;
                }
            }
            var_s3++;
        } while (var_s3 < 8 && temp_a3->unk0[var_s3] != 0xFF);
    }
    return var_f28;
}

void func_800BF3E4(Object *obj) {
    s32 i;
    s32 k;
    s32 j;
    s32 m;
    unk800E3184 *temp_a1;

    if (D_800E3190 != NULL) {

        for (i = 0, m = 0; i < D_800E3188 && m == 0; i++) {
            if (obj == D_800E3194[i]) {
                m = -1;
            }
        }
        if (m != 0) {
            i--;
            for (j = 0; j < D_800E318C; j++) {
                for (k = 0, temp_a1 = &D_800E3184[j]; k < 8 && temp_a1->unk0[k] != 0xFF; k++) {
                    if (i == temp_a1->unk0[k]) {
                        while (k < 7) {
                            temp_a1->unk0[k] = temp_a1->unk0[k + 1];
                            k++;
                        }
                        temp_a1->unk0[k] = 0xFF;
                        k++;
                    }
                }
            }
            D_800E3194[j] = NULL;
            D_800E3188--;
        }
    }
}

void func_800BF524(Object *obj) {
    LevelObjectEntry800BF524 *temp_v0;
    s32 var_v1;

    temp_v0 = (LevelObjectEntry800BF524 *) obj->segment.level_entry;
    var_v1 = 0;
    if (temp_v0->unk10 != 0) {
        var_v1 = 1;
    }
    if (temp_v0->unk11 != 0) {
        var_v1 |= 2;
    }
    func_800BF634(obj, obj->segment.trans.x_position, obj->segment.trans.z_position, (f32) temp_v0->unkA,
                  temp_v0->unk9 << 8, (f32) temp_v0->unk8 / 16.0, (f32) temp_v0->unkE, (f32) temp_v0->unkC / 16.0,
                  var_v1);
}

unk800E3190 *func_800BF634(Object *obj, f32 xPos, f32 zPos, f32 arg3, s32 arg4, f32 arg5, f32 arg6, f32 arg7,
                           s32 arg8) {
    f32 var_f0;
    s32 var_a0;
    s32 var_a0_2;
    s32 j;
    s32 var_a2_2;
    s32 k;
    s32 i;
    unk800E3184 *temp;
    unk800E3190 *result;

    result = NULL;
    if (D_800E3190 != NULL) {
        for (i = 0, var_a0 = 0; i < 32 && var_a0 == 0; i++) {
            if (D_800E3194[i] == NULL) {
                var_a0 = -1;
            }
        }
        i--;
        if (var_a0 != 0) {
            D_800E3194[i] = obj;
            D_800E3188++;
            var_f0 = D_8012A0B8;
            if (D_80129FC8.unk28 != 0) {
                var_f0 /= 2.0f;
            }
            var_a0_2 = (((xPos - arg3) - D_8012A0D0) / var_f0);
            if (var_a0_2 >= D_800E318C) {
                return NULL;
            }
            var_a2_2 = (((xPos + arg3) - D_8012A0D0) / var_f0);
            if (var_a2_2 < 0) {
                return NULL;
            }
            if (var_a0_2 < 0) {
                var_a0_2 = 0;
            }
            if (var_a2_2 >= D_800E318C) {
                var_a2_2 = D_800E318C - 1;
            }

            for (j = var_a0_2; j <= var_a2_2; j++) {
                temp = &D_800E3184[j];
                if (temp->unk0[7] == 0xFF) {
                    k = 0;
                    while (temp->unk0[k] != 0xFF) {
                        k++;
                    }
                    temp->unk0[k] = i;
                }
            }
            result = &D_800E3190[i];
            result->unk0 = zPos - arg3;
            result->unk4 = zPos + arg3;
            result->unk8 = xPos;
            result->unkC = zPos;
            result->unk10 = arg3;
            result->unk18 = i;
            result->unk14 = arg3 * arg3;
            result->unk1A = arg4;
            if (osTvType == OS_TV_TYPE_PAL) {
                result->unk1C = arg5 * 20971.52; //(f64) (0x80000 / 25.0);
            } else {
                result->unk1C = arg5 * 17476.27; //(f64) ((0x80000 / 1.2) / 25.0);
            }
            result->unk20 = 65536.0f / arg6;
            result->unk24 = arg7;
            result->unk28 = arg5;
            result->unk31 = arg8 & 1;
            result->unk32 = arg8 & 2;
            result->unk2C = arg6;
        }
    }
    return result;
}

UNUSED void func_800BF9F8(unk800BF9F8 *arg0, f32 arg1, f32 arg2) {
    UNUSED s32 pad[4];
    s32 sp1C;
    f32 var_f0;
    s32 var_a1;
    s32 i;
    s32 var_a2;
    s32 j;
    s32 iteration;
    s32 temp_v1;
    u8 *var_a2_2;

    if (arg0 != NULL) {
        var_f0 = D_8012A0B8;
        iteration = 0;
        if (D_80129FC8.unk28 != 0) {
            var_f0 *= 0.5f;
        }
        temp_v1 = arg0->unk18;
        while (iteration != 2) {
            var_a1 = TRUE;
            var_a2 = (((arg0->unk8 - arg0->unk10) - D_8012A0D0) / var_f0);
            if (var_a2 >= D_800E318C) {
                var_a1 = FALSE;
            } else if (var_a2 < 0) {
                var_a2 = 0;
            }
            if (var_a1) {
                sp1C = (((arg0->unk8 + arg0->unk10) - D_8012A0D0) / var_f0);
                if (sp1C < 0) {
                    var_a1 = FALSE;
                } else if (sp1C >= D_800E318C) {
                    sp1C = D_800E318C - 1;
                }
            }
            if (var_a1) {
                for (i = var_a2; i <= sp1C; i++) {
                    var_a2_2 = &D_800E3184[i].unk0[0];
                    j = 0;
                    if (iteration != 0) {
                        if (var_a2_2[7] == 0xFF) {
                            while (var_a2_2[0] != 0xFF) {
                                var_a2_2++;
                            }
                            var_a2_2[0] = temp_v1;
                        }
                    } else {
                        while (j < 8) {
                            if (temp_v1 == var_a2_2[j]) {
                                while (j < 7) {
                                    var_a2_2[j] = var_a2_2[j + 1];
                                    j++;
                                }
                                var_a2_2[j] = 0xFF;
                                j++;
                            }
                            j++;
                        }
                    }
                }
            }
            if (iteration == 0) {
                arg0->unk8 += arg1;
                arg0->unkC += arg2;
                arg0->unk0 += arg2;
                arg0->unk4 += arg2;
            }
            iteration++;
        }
    }
}

UNUSED void func_800BFC54(unk800BFC54_arg0 *arg0, f32 arg1, f32 arg2, f32 arg3, f32 arg4) {
    if (arg0 != NULL) {
        arg0->unk10 = (arg0->unk10 + arg1);
        if (arg0->unk10 < 1.0) {
            arg0->unk10 = 1.0f;
        }
        arg0->unk0 = (arg0->unkC - arg0->unk10);
        arg0->unk4 = (arg0->unkC + arg0->unk10);
        arg0->unk28 += arg2;
        if (osTvType == OS_TV_TYPE_PAL) {
            arg0->unk1C = arg0->unk28 * 20971.52; //(f64) (0x80000 / 25.0);
        } else {
            arg0->unk1C = arg0->unk28 * 17476.27; //(f64) ((0x80000 / 1.2) / 25.0);
        }
        arg0->unk2C = (arg0->unk2C + arg3);
        if (arg0->unk2C < 1.0) {
            arg0->unk2C = 1.0f;
        }
        arg0->unk20 = (65536.0f / arg0->unk2C); // 0x10000
        arg0->unk24 = (arg0->unk24 + arg4);
    }
}

void func_800BFE98(s32 arg0) {
    s32 i;

    for (i = 0; i < 32; i++) {
        if (D_800E3194[i] != NULL) {
            D_800E3190[i].unk1A += ((0, D_800E3190[i].unk1C * arg0)) >> 4;
        }
    }
}

/**
 * Wave Power loop func.
 * Waits for racers to pass through, then sets itself as the current baseline for how strong the waves should be.
 */
void obj_loop_wavepower(Object *obj) {
    LevelObjectEntry_WavePower *entry;
    s32 numRacers;
    Object *racerObj;
    Object_Racer *racer;
    Object **racers;
    s32 i;
    f32 diffY;
    f32 diffZ;
    f32 diffX;
    f32 distance;

    if (obj != gWaveGeneratorObj) {
        racers = get_racer_objects(&numRacers);
        if (numRacers > 0) {
            racerObj = NULL;
            for (i = 0; i < numRacers && racerObj == NULL; i++) {
                racer = (Object_Racer *) racers[i]->unk64;
                if (racer->playerIndex == PLAYER_ONE) {
                    racerObj = racers[i];
                }
            }
            if (racerObj != NULL) {
                entry = (LevelObjectEntry_WavePower *) obj->segment.level_entry;
                distance = entry->radius;
                distance *= distance;
                diffX = racerObj->segment.trans.x_position - obj->segment.trans.x_position;
                diffY = racerObj->segment.trans.y_position - obj->segment.trans.y_position;
                diffZ = racerObj->segment.trans.z_position - obj->segment.trans.z_position;
                if ((diffX * diffX) + (diffY * diffY) + (diffZ * diffZ) < distance) {
                    gWavePowerBase = entry->power / 256.0f;
                    gWaveMagnitude = (gWavePowerBase - D_80129FC8.magnitude) / (f32) entry->divisor;
                    gWavePowerDivisor = entry->divisor;
                    gWaveGeneratorObj = obj;
                }
            }
        }
    }
}
