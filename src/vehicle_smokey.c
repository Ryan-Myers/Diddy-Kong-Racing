#include "vehicle_misc.h"

#include "audio.h"
#include "audio_spatial.h"
#include "camera.h"
#include "macros.h"
#include "math_util.h"
#include "object_functions.h"
#include "objects.h"
#include "particles.h"
#include "racer.h"
#include "types.h"

/************ .data ************/

// The highest index that ever seems to be read from this table is 6.
u16 gSmokeyVoiceTable[16] = {
    SOUND_VOICE_BOSS_LAUGH2,
    SOUND_VOICE_TRICKY_HM,
    SOUND_VOICE_TRICKY_HMMM,
    SOUND_VOICE_WIZPIG_HA,
    SOUND_VOICE_WIZPIG_H2,
    SOUND_VOICE_SMOKEY_EH,
    SOUND_VOICE_SMOKEY_HEH,
    SOUND_VOICE_SMOKEY_HAH, // Never read from this point?
    SOUND_VOICE_SMOKEY_LAUGH,
    SOUND_VOICE_SMOKEY_HM,
    SOUND_VOICE_SMOKEY_HM2,
    SOUND_VOICE_CONKER_YEHAHA,
    SOUND_VOICE_TIMBER_WOW,
    SOUND_WHOOSH2,
    SOUND_NONE,
    SOUND_NONE,
};

/*******************************/

/************ .bss ************/

s8 gSmokeyCutsceneTimer;
s8 gSmokeyStartBoost;

/******************************/

enum SmokeyAnimations {
    ANIM_SMOKEY_IDLE,
    ANIM_SMOKEY_RUN,
    ANIM_SMOKEY_WALK,
    ANIM_SMOKEY_LAND,
    ANIM_SMOKEY_FLY,
    ANIM_SMOKEY_DAMAGE
};

/**
 * Top level function for updating the "Smokey" vehicle as seen in the Dragon Forest boss stage.
 * Also controls the pteradactyl found in Dino domain, from when it had a larger role ingame.
 */
void update_smokey(s32 updateRate, f32 updateRateF, Object *obj, Object_Racer *racer, u32 *input, s32 *stickMag,
                   s32 *startTimer) {
    s16 animID;
    s16 animFrame;
    s16 tempHeadAngle;
    f32 diffX;
    f32 diffZ;
    ObjectModel *objModel;
    ModelInstance *modInst;
    s32 headAngleRange;
    f32 animVelocity;
    UNUSED s32 pad;
    s16 stepFrame;
    Object *firstRacerObj;

    set_boss_voice_clip_offset(gSmokeyVoiceTable);
    animID = obj->animationID;
    animFrame = obj->animFrame;
    tempHeadAngle = racer->headAngle;
    if (racer->velocity < 0.3 && -0.3 < racer->velocity) {
        *stickMag = 0;
    }
    if (racer->raceFinished == TRUE && func_80023568()) {
        func_80021400(130);
        racer->raceFinished++;
    }
    headAngleRange = *startTimer;
    if (headAngleRange == 100) {
        gSmokeyCutsceneTimer = 0;
    }
    if (racer->playerIndex == PLAYER_COMPUTER && *startTimer != 100) {
        *startTimer -= 60;
        if (*startTimer < 0) {
            if (gSmokeyStartBoost == FALSE) {
                play_random_boss_sound(BOSS_SOUND_POSITIVE);
                racer->boostTimer = 10;
            }
            gSmokeyStartBoost = TRUE;
            *startTimer = 0;
            *input |= A_BUTTON;
        } else {
            gSmokeyStartBoost = FALSE;
        }
    }
    racer->vehicleID = VEHICLE_SMOKEY;
    func_80049794(updateRate, updateRateF, obj, racer);
    racer->vehicleID = racer->vehicleIDPrev;
    *startTimer = headAngleRange;
    obj->particleEmittersEnabled = OBJ_EMIT_NONE;
    racer->headAngle = tempHeadAngle;
    obj->animationID = animID;
    obj->animFrame = animFrame;
    if (racer->attackType != ATTACK_NONE && obj->animationID != ANIM_SMOKEY_DAMAGE) {
        play_random_boss_sound(BOSS_SOUND_NEGATIVE);
        sound_play(SOUND_EXPLOSION, NULL);
        set_camera_shake(12.0f);
        obj->animationID = ANIM_SMOKEY_DAMAGE;
        obj->x_velocity *= 0.27;
        obj->z_velocity *= 0.27;
        racer->animationSpeed = 0.0f;
        obj->y_velocity += 4.0;
    }
    racer->attackType = ATTACK_NONE;
    if (racer->approachTarget != 0) {
        diffX = obj->x_velocity * obj->x_velocity;
        diffZ = obj->z_velocity * obj->z_velocity;
        racer->velocity = -sqrtf((diffX * diffX) + (diffZ * diffZ));
        if (racer->velocity > -0.5) {
            racer->velocity = 0.0f;
            obj->x_velocity = 0.0f;
            obj->y_velocity = 0.0f;
            obj->z_velocity = 0.0f;
        }
    }
    modInst = obj->modelInstances[0];
    objModel = modInst->objModel;
    diffX = (objModel->animations[obj->animationID].animLength * 16) - 17;
    animVelocity = (racer->velocity * updateRateF) * 0.45;
    if (animVelocity <= 0.0) {
        if (animVelocity > -2.0) {
            animVelocity = -2.0f;
        }
    } else if (animVelocity < 2.0) {
        animVelocity = 2.0f;
    }
    switch (obj->animationID) {
        case 0:
            racer->unk1CD = 0;
            racer->animationSpeed += 1.0 * updateRateF;
            break;
        case 1:
            if (racer->unk1CD == 2) {
                racer->animationSpeed += animVelocity;
            } else {
                racer->animationSpeed -= animVelocity;
            }
            break;
        case 2:
            racer->unk1CD = 2;
            racer->animationSpeed -= animVelocity;
            break;
        case 3:
            if (racer->unk1CD == 4) {
                racer->animationSpeed -= 2.0 * updateRateF;
            } else {
                racer->animationSpeed += 2.0 * updateRateF;
            }
            break;
        case 4:
            racer->unk1CD = 4;
            racer->animationSpeed += 2.0 * updateRateF;
            break;
        case 5:
            racer->animationSpeed += 2.0 * updateRateF;
            break;
        default:
            break;
    }
    while (diffX <= racer->animationSpeed) {
        racer->animationSpeed -= diffX;
        modInst->animationID = -1;
    }
    while (racer->animationSpeed <= 0.0f) {
        racer->animationSpeed += diffX;
        modInst->animationID = -1;
    }
    if (obj->animationID == ANIM_SMOKEY_WALK && racer->groundedWheels == 0 && racer->velocity < -6.5) {
        obj->animationID = ANIM_SMOKEY_LAND;
        racer->animationSpeed = 0.0f;
    }
    if (modInst->animationID == -1 || obj->animationID == ANIM_SMOKEY_IDLE) {
        if (obj->animationID == ANIM_SMOKEY_DAMAGE) {
            obj->animationID = racer->unk1CD;
            racer->animationSpeed = 0.0f;
        } else if (obj->animationID == ANIM_SMOKEY_RUN) {
            if (racer->unk1CD == 0) {
                obj->animationID = ANIM_SMOKEY_WALK;
            } else {
                obj->animationID = ANIM_SMOKEY_IDLE;
            }
        } else if (obj->animationID == ANIM_SMOKEY_LAND) {
            if (racer->unk1CD == 4) {
                obj->animationID = ANIM_SMOKEY_WALK;
            } else {
                obj->animationID = ANIM_SMOKEY_FLY;
            }
        } else if (-0.1 < racer->velocity && racer->velocity < 0.1) {
            if (obj->animationID == ANIM_SMOKEY_WALK) {
                obj->animationID = ANIM_SMOKEY_RUN;
                racer->animationSpeed = (objModel->animations[obj->animationID].animLength * 16) - 17;
            } else {
                obj->animationID = ANIM_SMOKEY_IDLE;
            }
        } else {
            if (obj->animationID == ANIM_SMOKEY_IDLE) {
                obj->animationID = ANIM_SMOKEY_RUN;
                racer->animationSpeed = 0.0f;
            }
            if (obj->animationID == ANIM_SMOKEY_FLY && racer->groundedWheels && racer->velocity > -6.0) {
                obj->animationID = ANIM_SMOKEY_LAND;
                racer->animationSpeed = (objModel->animations[obj->animationID].animLength * 16) - 17;
            }
        }
    }
    animFrame = obj->animFrame;
    obj->animFrame = racer->animationSpeed;
    stepFrame = obj->animFrame >> 4;
    obj->particleEmittersEnabled = OBJ_EMIT_NONE;
    if (obj->animationID != ANIM_SMOKEY_RUN && obj->animationID != 2) {
        animFrame >>= 4;
        stepFrame = 1;
        if (obj->animationID == ANIM_SMOKEY_IDLE) {
            stepFrame = 3;
        }
        if (animFrame == stepFrame && stepFrame + 1 == obj->animFrame >> 4) {
            audspat_play_sound_at_position(SOUND_UNK_223, obj->trans.x_position, obj->trans.y_position,
                                           obj->trans.z_position, AUDIO_POINT_FLAG_ONE_TIME_TRIGGER, NULL);
        }
    }
    if (racer->vehicleIDPrev == VEHICLE_SMOKEY && racer->playerIndex == PLAYER_COMPUTER && func_80023568()) {
        spawn_boss_hazard(obj, racer, 100.0f, ASSET_OBJECT_ID_FIREBALL, SOUND_VOICE_TRICKY_HM);
    }
    obj_spawn_particle(obj, updateRate);
    fade_when_near_camera(obj, racer, 40);
    firstRacerObj = get_racer_object(PLAYER_ONE);
    diffX = firstRacerObj->trans.x_position - obj->trans.x_position;
    diffZ = firstRacerObj->trans.z_position - obj->trans.z_position;
    if (sqrtf((diffX * diffX) + (diffZ * diffZ)) < 700.0) {
        headAngleRange = (arctan2_f(diffX, diffZ) - (obj->trans.rotation.y_rotation & 0xFFFF)) + 0x8000;
        if (headAngleRange > 0x8000) {
            headAngleRange -= 0xFFFF;
        }
        if (headAngleRange < -0x8000) {
            headAngleRange += 0xFFFF;
        }
        if (headAngleRange > 0xC00) {
            headAngleRange = 0xC00;
        }
        if (headAngleRange < -0xC00) {
            headAngleRange = -0xC00;
        }
        racer->headAngleTarget = headAngleRange;
    }
    if (obj->animationID >= ANIM_SMOKEY_WALK) {
        if ((racer->miscAnimCounter & 0x1F) < 10) {
            racer->headAngleTarget >>= 1;
        }
    }
    racer = firstRacerObj->racer;
    if (obj == firstRacerObj->interactObj->obj && firstRacerObj->interactObj->flags & INTERACT_FLAGS_PUSHING &&
        obj->animationID == ANIM_SMOKEY_RUN) {
        racer->attackType = ATTACK_SQUISHED;
    }
    if (racer->raceFinished != FALSE) {
        if (gSmokeyCutsceneTimer == 0) {
            gSmokeyCutsceneTimer = 1;
            racer_boss_finish(racer, &gSmokeyCutsceneTimer);
        }
    }
}

/**
 * Compare distance to any boss hazard triggers found throughout the course.
 * When close enough to one, spawn a hazard, set by the caller of the function.
 */
void spawn_boss_hazard(Object *obj, Object_Racer *racer, f32 offset, s32 objectID, s32 soundID) {
    Object **objList;
    s32 objListID;
    s32 objListCount;
    LevelObjectEntry *entry;
    Object *tempObj;
    Object *newObj;
    s32 i;
    LevelObjectEntryCommon spawnObj;
    f32 diffX;
    f32 diffZ;
    f32 diffY;

    objList = objGetObjList(&objListID, &objListCount);
    spawnObj.objectID = objectID;
    spawnObj.size = (((objectID & 0x100) & 0xFFFF) >> 1) | 8;
    spawnObj.x = obj->trans.x_position - (racer->ox1 * offset);
    spawnObj.y = obj->trans.y_position - (racer->oy1 * offset);
    spawnObj.z = obj->trans.z_position - (racer->oz1 * offset);

    for (i = 0; i < objListCount; i++) {
        tempObj = objList[i];
        if (tempObj->behaviorId == BHV_BOSS_HAZARD_TRIGGER) {
            entry = tempObj->level_entry;
            if ((s8) entry->animation.z_rotation == racer->lap + 1 || (s8) entry->animation.z_rotation == 0) {
                diffX = tempObj->trans.x_position - obj->trans.x_position;
                diffY = tempObj->trans.y_position - obj->trans.y_position;
                diffZ = tempObj->trans.z_position - obj->trans.z_position;
                if (sqrtf((diffX * diffX) + (diffY * diffY) + (diffZ * diffZ)) <
                    (f32) ((s8) entry->animation.x_rotation & 0xFF) * 4.0) {
                    if (tempObj->properties.common.unk0 == 0) {
                        tempObj->properties.common.unk0 = 1;
                        newObj = spawn_object(&spawnObj, OBJECT_SPAWN_UNK01);
                        if (newObj != NULL) {
                            newObj->level_entry = NULL;
                            newObj->x_velocity = obj->x_velocity;
                            newObj->y_velocity = obj->y_velocity;
                            newObj->z_velocity = obj->z_velocity;
                            newObj->properties.fireball.obj = tempObj;
                            newObj->properties.fireball.timer = (s8) entry->animation.y_rotation * 60;
                            newObj->animFrame = rand_range(0, 255);
                            audspat_play_sound_at_position(soundID, newObj->trans.x_position, newObj->trans.y_position,
                                                           newObj->trans.z_position, AUDIO_POINT_FLAG_ONE_TIME_TRIGGER,
                                                           NULL);
                        }
                    }
                } else {
                    tempObj->properties.common.unk0 = 0;
                }
            }
        }
    }
}
