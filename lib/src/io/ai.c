/* The comment below is needed for this file to be picked up by generate_ld */
/* RAM_POS: 0x800D3670 */

#include "PR/os_internal.h"
#include "PR/rcp.h"

// TODO: this comes from a header
#ident "$Revision: 1.17 $"

s32 __osAiDeviceBusy(void) {
    register s32 status = IO_READ(AI_STATUS_REG);

    if (status & AI_STATUS_FIFO_FULL) {
        return TRUE;
    } else {
        return FALSE;
    }
}
