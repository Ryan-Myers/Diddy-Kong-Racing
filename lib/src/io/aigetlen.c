/* The comment below is needed for this file to be picked up by generate_ld */
/* RAM_POS: 0x800C8E20 */
#include "PR/rcp.h"

// TODO: this comes from a header
#ident "$Revision: 1.17 $"

/**
 * Returns the number of bytes remaining in a currently ongoing audio DMA.
 *
 * Note that audio DMA is double-buffered, a DMA can be queued while another is in-progress. This only returns
 * information about the currently in-progress DMA.
 */
u32 osAiGetLength(void) {
    return IO_READ(AI_LEN_REG);
}
