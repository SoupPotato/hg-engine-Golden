.nds
.thumb

.include "armips/include/battlescriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"

DisguiseMsg equ 1351
IceFaceShatterMsg equ 1354

.create "build/move/battle_sub_seq/1_332", 0

disguiseIceFaceFormChange: // a001_332
    ifmonstat IF_NOTMASK, BATTLER_xFF, MON_DATA_STATUS_2, 0x1000000, _0044
    setstatus2effect BATTLER_xFF, 0xF
    waitmessage
    cmd_C4 BATTLER_xFF
    waitmessage
    setstatus2effect BATTLER_xFF, 0x10
    waitmessage
_0044:
    playse BATTLER_xFF, 0x7BC
    mosaic BATTLER_xFF, 0x8, 0x1
    waitmessage
    changeform BATTLER_xFF
    playse BATTLER_xFF, 0x7C0
    mosaic BATTLER_xFF, 0x0, 0x1
    waitmessage
    ifmonstat IF_EQUAL, BATTLER_xFF, MON_DATA_ABILITY, ABILITY_ICE_FACE, printEiscue
printMimikyu:
    printmessage DisguiseMsg, TAG_NICK, BATTLER_xFF, "NaN", "NaN", "NaN", "NaN", "NaN"
    waitmessage
    wait 0x1E
    changemondatabyvar VAR_OP_GET_RESULT, BATTLER_xFF, 0x30, VAR_HP_TEMP
    damagediv VAR_HP_TEMP, 8
    changevar VAR_OP_MUL, VAR_HP_TEMP, -1
    changevar VAR_OP_SETMASK, VAR_SERVER_STATUS1, 0x40
    jumptosubseq 2
    goto afterPrint
printEiscue:
    printmessage IceFaceShatterMsg, TAG_NICK, BATTLER_xFF, "NaN", "NaN", "NaN", "NaN", "NaN"
    waitmessage
    wait 0x1E
afterPrint:
    endscript

.close