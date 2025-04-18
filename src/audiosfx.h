#ifndef _AUDIOSFX_H_
#define _AUDIOSFX_H_

#include "types.h"
#include "macros.h"
#include "audio_internal.h"
#include "asset_enums.h"
#include <ultra64.h>
#include "sched.h"
#include "structs.h"

#define AL_SNDP_PLAY_EVT (1 << 0)
#define AL_SNDP_STOP_EVT (1 << 1)
#define AL_SNDP_PAN_EVT (1 << 2)
#define AL_SNDP_VOL_EVT (1 << 3)
#define AL_SNDP_PITCH_EVT (1 << 4)
#define AL_SNDP_API_EVT (1 << 5)
#define AL_SNDP_DECAY_EVT (1 << 6)
#define AL_SNDP_END_EVT (1 << 7)
#define AL_SNDP_FX_EVT (1 << 8)
#define AL_SNDP_UNK_9_EVT (1 << 9)
#define AL_SNDP_UNK_10_EVT (1 << 10)
#define AL_SNDP_UNK_11_EVT (1 << 11)

typedef struct ALUnkStruct {
  /* 0x00 */ struct ALSoundState *next;
  /* 0x04 */ struct ALSoundState *prev;
  /* 0x08 */ struct ALSoundState *unk8;
} ALUnkStruct;

// typedef struct {
//     u8 pad[0x36];
//     u8 priority;
//     u8 pad37[0x7];
//     u8 flags;
//     u8 state;
// } AlMsgUnk400Type_Unk0;

typedef struct unk80004384 {
  /* 0x00 */ struct ALSoundState *next;
  /* 0x04 */ struct ALSoundState *prev;
  /* 0x08 */ struct ALSoundState *unk8;
  /* 0x0C */ ALVoice     voice;
  /* 0x28 */ f32 unk28;
  /* 0x2C */ f32 unk2C;
  /* 0x30 */ s32 unk30;
  /* 0x34 */ s16 unk34;
  /* 0x36 */ u8 unk36;
  /* 0x38 */ s32 unk38;
  /* 0x3C */ u8 unk3C;
  /* 0x3C */ u8 unk3D;
  /* 0x3C */ u8 unk3E;
  /* 0x3F */ u8 unk3F;
} unk80004384; // ALSoundState based?

typedef struct unk800DC6BC_40 {
    ALLink node;
    u8 pad0C[0x38];
} unk800DC6BC_40; //ALSoundState

typedef struct ALLink_unk8000418C {
    u8 pad0[5];
    s8 unk5;
} ALLink_unk8000418C;

typedef struct ALEvent_unk8000418C {
 s16 type;
 ALVoiceState *unk4;
 s32 unk8;
 u8 pad[4]; // Not sure how big this is supposed to be.
} ALEvent_unk8000418C;

/* Unknown Size */
typedef struct unk800DC6BC {
    ALPlayer        node;
    ALEventQueue    evtq;
    ALEvent         nextEvent;
    ALSynth        *drvr;
    u32             unk3C;
    unk800DC6BC_40 *unk40;
    s32             soundChannelsMax;
    s32             soundChannels;
    s32             frameTime;
    ALMicroTime     nextDelta;
    ALMicroTime     curTime;
} unk800DC6BC; //ALSndPlayer

typedef union {
    ALEvent msg;

    struct{
        s16 type;
        SoundMask *state;
        u32 param;
    }snd_event;

} ALEvent2;

typedef union {

    ALEvent             msg;

    struct {
        s16             type;
        ALSoundState    *state;
    } common;
    
    struct {
        s16             type;
        ALSoundState    *state;
        s16             vol;
    } vol;
    
    struct {
        s16             type;
        ALSoundState    *state;
        f32             pitch;
    } pitch;
    
    struct {
        s16             type;
        ALSoundState    *state;
        ALPan           pan;
    } pan;
    
    struct {
        s16             type;
        ALSoundState    *state;
        u8              mix;
    } fx;
    
} ALSndpEvent;

typedef struct audioMgrConfig_s{
    u32 unk00;
    u32 unk04;
    u32 maxChannels;
    ALHeap *hp;
    u16  unk10; // Heap Size?
} audioMgrConfig;

typedef struct AudQueueCustom {
    ALEventQueue alQ;
    struct TempAud *next;
    u8 unk0[0x26];
    u8 unk3E;
} AudQueueCustom;

extern void *alHeapDBAlloc(u8 *file, s32 line, ALHeap *hp, s32 num, s32 size); //lib/src/al
extern void alEvtqNew(ALEventQueue *evtq, ALEventListItem *items, s32 itemCount); //lib/src/unknown_0C9C90.c
extern ALMicroTime alEvtqNextEvent(ALEventQueue *evtq, ALEvent *evt); //lib/src/unknown_0C9C90.c
extern void alSynAddPlayer(ALSynth *drvr, ALPlayer *client); //lib/src/unknown_0C9C90.c
extern void alEvtqPostEvent(ALEventQueue *evtq, ALEvent *evt, ALMicroTime delta); //lib/src/unknown_0C9C90.c Non Matching

void set_sfx_volume_slider(u32 volume);
s32 get_sfx_volume_slider(void);
void set_sound_channel_count(s32 numChannels);
void alSndPNew(audioMgrConfig *c);
ALMicroTime  _sndpVoiceHandler(void *node);
void func_8000410C(ALSoundState *state);
u16 func_800042CC(u16 *lastAllocListIndex, u16 *lastFreeListIndex);
void func_80004604(ALSoundState *sndp, u8 priority);
s32 func_80004638(ALBank *bnk, s16 sndIndx, SoundMask *soundMask);
void sound_stop_all(void);
void sound_event_update(s32 soundMask, s16 type, u32 volume);
u16 get_sound_channel_volume(u8 channel);
void set_sound_channel_volume(u8 channel, u16 volume);
void func_8000418C(ALVoiceState *voiceState);
void func_800048D8(u8 event);
INCONSISTENT void sound_stop();
ALSound *func_80004384(UNUSED ALBank *arg0, ALSound *arg1);

// Non Matching
void func_80004520(ALSoundState *);
s32 func_80004668(ALBank *bnk, s16 sndIndx, u8, SoundMask *soundMask);
void _handleEvent(unk800DC6BC *sndp, ALSndpEvent *event);

#endif
