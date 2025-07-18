#include "asset_enums.h"
#include "asset_loading.h"
#include "f3ddkr.h"
#include "macros.h"
#include "memory.h"
#include "types.h"
#include "video.h"

#define SCREEN_HEIGHT_PART 6

// Render settings for the screens
Gfx gRdpSetModeScreenAsset[] = {
    gsDPSetCombineMode(G_CC_DECAL_SCALE, G_CC_DECAL_SCALE),
    gsDPSetOtherMode(DKR_OMH_COPY_POINT_NOPERSP, DKR_OML_COMMON | G_RM_NOOP | G_RM_NOOP2),
};

/**
 * Loads a 320x240 RGBA16 image to be displayed on the screen.
 * Returns the address of the screen asset, or 0x80100000 if no screen assets were found.
 * Unused.
 */
UNUSED u32 screenimage_load(s32 screenIndex) {
    u32 someAddr;
    s32 screenTableCount, start, size;
    u32 *screenTable;

    screenTable = asset_table_load(ASSET_SCREENS_TABLE);
    screenTableCount = 0;

    while (screenTable[screenTableCount] != 0xFFFFFFFF) {
        screenTableCount++;
    }

    screenTableCount--;

    // screenTableCount will always be 0 in vanilla DKR,
    // since there are no screen assets in the ROM.
    if (screenTableCount == 0) {
        mempool_free(screenTable);
        return (u32) OS_PHYSICAL_TO_K0(0x100000);
    } else {
        if (screenIndex < 0 || screenIndex >= screenTableCount) {
            rmonPrintf("SCREEN: No out of range!!\n");
            screenIndex = 0;
        }

        start = screenTable[screenIndex];
        size = screenTable[screenIndex + 1] - start;
        someAddr = (u32) mempool_alloc_safe(size, COLOUR_TAG_BLUE);

        asset_load(ASSET_SCREENS, someAddr, start, size);
        mempool_free(screenTable);

        return someAddr;
    }
}

/**
 * Renders a 320x240 RGBA16 screen asset.
 * Unused.
 */
UNUSED void screenimage_draw(Gfx **dList, u8 *screenAddress) {
    s32 y_pos;

    gDkrDmaDisplayList((*dList)++, OS_PHYSICAL_TO_K0(&gRdpSetModeScreenAsset),
                       numberOfGfxCommands(gRdpSetModeScreenAsset));

    // Screen header is 16 bytes.
    screenAddress += 16;

    // Draw each 320x6 RGBA16 slice until the screen image is fully drawn.
    y_pos = 0;
    while (y_pos != SCREEN_HEIGHT) {
        // Load the texture.
        gDPLoadTextureBlockS((*dList)++, OS_K0_TO_PHYSICAL(screenAddress), G_IM_FMT_RGBA, G_IM_SIZ_16b, SCREEN_WIDTH,
                             SCREEN_HEIGHT_PART, 0, G_TX_CLAMP, G_TX_CLAMP, 0, 0, 0, 0);

        // Draw the texture.
        gSPTextureRectangle((*dList)++, 0, y_pos << 2, SCREEN_WIDTH << 2, (y_pos + SCREEN_HEIGHT_PART) << 2,
                            G_TX_RENDERTILE, 0, 0, 1 << 12, 1 << 10);

        // Advance to the next slice.
        screenAddress += SCREEN_WIDTH * SCREEN_HEIGHT_PART * 2;
        y_pos += SCREEN_HEIGHT_PART;
    }
}
