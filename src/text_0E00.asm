; "Elite" C64 disassembly / "Elite DX", cc0 2018, see LICENSE.txt
; "Elite" is copyright / trademark David Braben & Ian Bell, All Rights Reserved
; <github.com/Kroc/EliteDX>
;===============================================================================

; this is the 'key' used to scramble / unscramble the message token symbols
.export MSG_XOR := $57

.enum   msg_pairs
        AB               =$D8
        OU              ;=$D9
        SE              ;=$DA
        IT              ;=$DB
        IL              ;=$DC
        ET              ;=$DD
        ST              ;=$DE
        ON              ;=$DF
        LO              ;=$E0
        NU              ;=$E1
        TH              ;=$E2
        NO              ;=$E3

        AL              ;=$E4
        LE              ;=$E5
        XE              ;=$E6
        GE              ;=$E7
        ZA              ;=$E8
        CE              ;=$E9
        BI              ;=$EA
        SO              ;=$EB
        US              ;=$EC
        ES              ;=$ED
        AR              ;=$EE
        MA              ;=$EF
        IN              ;=$F0
        DI              ;=$F1
        RE              ;=$F2
        A_              ;=$F3
        ER              ;=$F4
        AT              ;=$F5
        EN              ;=$F6
        BE              ;=$F7
        RA              ;=$F8
        LA              ;=$F9
        VE              ;=$FA
        TI              ;=$FB
        ED              ;=$FC
        OR              ;=$FD
        QU              ;=$FE
        AN              ;=$FF
        ;;TE
        ;;IS
        ;;RI
        ;;ON
.endenum

_AB             = msg_pairs::AB ^ MSG_XOR ;=$8F
_OU             = msg_pairs::OU ^ MSG_XOR ;=$8E
_SE             = msg_pairs::SE ^ MSG_XOR ;=$8D
_IT             = msg_pairs::IT ^ MSG_XOR ;=$8C
_IL             = msg_pairs::IL ^ MSG_XOR ;=$8B
_ET             = msg_pairs::ET ^ MSG_XOR ;=$8A
_ST             = msg_pairs::ST ^ MSG_XOR ;=$89
_ON             = msg_pairs::ON ^ MSG_XOR ;=$88
_LO             = msg_pairs::LO ^ MSG_XOR ;=$B7
_NU             = msg_pairs::NU ^ MSG_XOR ;=$B6
_TH             = msg_pairs::TH ^ MSG_XOR ;=$B5
_NO             = msg_pairs::NO ^ MSG_XOR ;=$B4

_AL             = msg_pairs::AL ^ MSG_XOR ;=$B3
_LE             = msg_pairs::LE ^ MSG_XOR ;=$B2
_XE             = msg_pairs::XE ^ MSG_XOR ;=$B1
_GE             = msg_pairs::GE ^ MSG_XOR ;=$B0
_ZA             = msg_pairs::ZA ^ MSG_XOR ;=$BF -- unused here
_CE             = msg_pairs::CE ^ MSG_XOR ;=$BE
_BI             = msg_pairs::BI ^ MSG_XOR ;=$BD
_SO             = msg_pairs::SO ^ MSG_XOR ;=$BC
_US             = msg_pairs::US ^ MSG_XOR ;=$BB
_ES             = msg_pairs::ES ^ MSG_XOR ;=$BA
_AR             = msg_pairs::AR ^ MSG_XOR ;=$B9
_MA             = msg_pairs::MA ^ MSG_XOR ;=$B8
_IN             = msg_pairs::IN ^ MSG_XOR ;=$A7
_DI             = msg_pairs::DI ^ MSG_XOR ;=$A6
_RE             = msg_pairs::RE ^ MSG_XOR ;=$A5
__A             = msg_pairs::A_ ^ MSG_XOR ;=$A4
_ER             = msg_pairs::ER ^ MSG_XOR ;=$A3
_AT             = msg_pairs::AT ^ MSG_XOR ;=$A2
_EN             = msg_pairs::EN ^ MSG_XOR ;=$A1
_BE             = msg_pairs::BE ^ MSG_XOR ;=$A0
_RA             = msg_pairs::RA ^ MSG_XOR ;=$AF
_LA             = msg_pairs::LA ^ MSG_XOR ;=$AE
_VE             = msg_pairs::VE ^ MSG_XOR ;=$AD
_TI             = msg_pairs::TI ^ MSG_XOR ;=$AC
_ED             = msg_pairs::ED ^ MSG_XOR ;=$AB
_OR             = msg_pairs::OR ^ MSG_XOR ;=$AA
_QU             = msg_pairs::QU ^ MSG_XOR ;=$A9
_AN             = msg_pairs::AN ^ MSG_XOR ;=$A8

__end           = $00 ^ MSG_XOR ;=$57
__              = $20 ^ MSG_XOR ;=$77
_DOT            = $2E ^ MSG_XOR ;=$79
_A              = $41 ^ MSG_XOR ;=$16
_B              = $42 ^ MSG_XOR ;=$15
_C              = $43 ^ MSG_XOR ;=$14
_D              = $44 ^ MSG_XOR ;=$13
_E              = $45 ^ MSG_XOR ;=$12
_F              = $46 ^ MSG_XOR ;=$11
_G              = $47 ^ MSG_XOR ;=$10
_H              = $48 ^ MSG_XOR ;=$1F
_I              = $49 ^ MSG_XOR ;=$1E
_J              = $4a ^ MSG_XOR ;=$1D
_K              = $4b ^ MSG_XOR ;=$1C
_L              = $4c ^ MSG_XOR ;=$1B
_M              = $4d ^ MSG_XOR ;=$1A
_N              = $4e ^ MSG_XOR ;=$19
_O              = $4f ^ MSG_XOR ;=$18
_P              = $50 ^ MSG_XOR ;=$07
_Q              = $51 ^ MSG_XOR ;=$06
_R              = $52 ^ MSG_XOR ;=$05
_S              = $53 ^ MSG_XOR ;=$04
_T              = $54 ^ MSG_XOR ;=$03
_U              = $55 ^ MSG_XOR ;=$02
_V              = $56 ^ MSG_XOR ;=$01
_W              = $57 ^ MSG_XOR ;=$00
_X              = $58 ^ MSG_XOR ;=$0F
_Y              = $59 ^ MSG_XOR ;=$0E
_Z              = $5a ^ MSG_XOR ;=$0D
_HYPHEN         = $2d ^ MSG_XOR ;=$7A
_COLON          = $3a ^ MSG_XOR ;=$6D

; format tokens -- function varies
_F01_           = $01 ^ MSG_XOR ;=$56
_F02_           = $02 ^ MSG_XOR ;=$55
_F03_           = $03 ^ MSG_XOR ;=$54
_F04_           = $04 ^ MSG_XOR ;=$53
_F05_           = $05 ^ MSG_XOR ;=$52
_F06_           = $06 ^ MSG_XOR ;=$51
_F07_           = $07 ^ MSG_XOR ;=$50
_F08_           = $08 ^ MSG_XOR ;=$5F
_F09_           = $09 ^ MSG_XOR ;=$5E
_F0A_           = $0A ^ MSG_XOR ;=$5D
_F0B_           = $0B ^ MSG_XOR ;=$5C
_F0C_           = $0C ^ MSG_XOR ;=$5B
_F0D_           = $0D ^ MSG_XOR ;=$5A
_F0E_           = $0E ^ MSG_XOR ;=$59
_F0F_           = $0F ^ MSG_XOR ;=$58
_F10_           = $10 ^ MSG_XOR ;=$47
_F11_           = $11 ^ MSG_XOR ;=$46
_F12_           = $12 ^ MSG_XOR ;=$45
_F13_           = $13 ^ MSG_XOR ;=$44
_F14_           = $14 ^ MSG_XOR ;=$43
_F15_           = $15 ^ MSG_XOR ;=$42
_F16_           = $16 ^ MSG_XOR ;=$41
_F17_           = $17 ^ MSG_XOR ;=$40
_F18_           = $18 ^ MSG_XOR ;=$4F
_F19_           = $19 ^ MSG_XOR ;=$4E
_F1A_           = $1A ^ MSG_XOR ;=$4D
_F1B_           = $1B ^ MSG_XOR ;=$4C
_F1C_           = $1C ^ MSG_XOR ;=$4B
_F1D_           = $1D ^ MSG_XOR ;=$4A
_F1E_           = $1E ^ MSG_XOR ;=$49
_F1F_           = $1F ^ MSG_XOR ;=$48

;===============================================================================

_msg_index     .set 0

.macro  .define_msg     msg_id
        
        .local  _value
        _value  .set 0

        _value .set _msg_index ^ MSG_XOR
        
        .ident(msg_id) = _value

        ; define an export for the index-number of the message;
        ; this is how the outside world will specify the message to print
        .export .ident(.concat("MSG", msg_id)) = _msg_index

        .if _msg_index >= $81 && _msg_index <= $d6
                .out .sprintf(": $%0.2x: MSG%s", _value, msg_id)
        .endif

        ; move to the next index number:
        ; doing this afterwards ensures that there is an index 0
        _msg_index .set _msg_index + 1
.endmacro

.define .skip_msg       _msg_index .set _msg_index + 1

;===============================================================================

.segment        "TEXT_0E00"

_0e00:
.export _0e00
        ; 0.
        .byte   __end
        .skip_msg

        ; 1.
        .byte   _F09_, _F0B_, _F01_, _F08_, __, _F1E_, __
        .byte   _A, _C, _CE, _S, _S, __, _M, _E
        .byte   _NU, $80, _F0A_, _F02_, $66, _DOT, __, _95
        .byte   $80, $65, _DOT, __, _S, _A, _VE, __
        .byte   _COMMANDER, __, _F04_, $80, $64, _DOT, __, _C
        .byte   _H, _AN, _GE, _TO, _F1F_, $80, $63, _DOT
        .byte   __, _D, _E, _F, _A, _U, _L, _T
        .byte   __, _F01_, _J, _A, _M, _E, _S, _O
        .byte   _N, _F02_, $80, $62, _DOT, __, _E, _X
        .byte   _IT, $80, __end
        .define_msg "_01"
        
        ; 2.
        .byte   _DI, _S, _K, __end
        .define_msg "_DISK"
        
        ; 3.
        .byte   _T, _A, _P, _E, __end
        .define_msg "_TAPE"
        
        ; 4.
        .byte   _C, _O, _M, _P, _E, _TI, _TI, _ON, __
        .byte   _NU, _M, _B, _ER, _COLON, __end
        .define_msg "_COMPETITION_NUMBER"
        
        ; 5.
        .byte   _B0, $3a, _IS, $39, _B1, __end
        .define_msg "_05"
        
        ; 6.
        .byte   __, __, _95, __, _F01_, $7f, _Y
        .byte   $78, _N, $7e, $68, _F02_, _F0C_, _F0C_, __end
        .define_msg "_06"

        ; 7.
        .byte   _P, _RE, _S, _S, __, _S, _P, _A, _CE, __
        .byte   _OR, __, _F, _I, _RE, $7b, _COMMANDER, _DOT
        .byte   _F0C_, _F0C_, __end
        .define_msg "_07"
        
        ; 8.
        .byte   _COMMANDER, $70, _S, _C8, __end
        .define_msg "_08"
        
        ; 9.
        .byte   _F0C_, _F01_, _IL, _LE, _G, _AL
        .byte   __, _E, _L, _I, _T, _E, __, _I
        .byte   _I, __, _F, _I, _LE, __end
        .define_msg "_09"
        
        ; 10.
        .byte   _F17_, _F0E_
        .byte   _F02_, _G, _RE, _ET, _IN, _G, _S, $82
        .byte   _AND_, _F13_, _I, __, _BE, _G, _A_, _M
        .byte   _O, _M, _EN, _T, __, _O, _F, __
        .byte   _YOU, _R, __, _V, _AL, _U, _AB, _LE
        .byte   __, _TI, _M, _E, _CC, _W, _E, __
        .byte   _W, _OU, _L, _D, __, _L, _I, _K
        .byte   _E, __, _YOU, _TO, _D, _O, _A_, _L
        .byte   _IT, _T, _LE, __, _J, _O, _B, __
        .byte   _F, _OR, __, _US, _CC, _THE, _SHIP, __
        .byte   _YOU, __, _SE, _E, __, _H, _E, _RE
        .byte   _IS, _A, _NEW, _M, _O, _D, _E, _L
        .byte   $7b, __, _THE, _F13_, _C, _ON, _ST, _R
        .byte   _I, _C, _T, _OR, $7b, __, _E, _QU
        .byte   _I, _P, _ED_, _W, _I, _TH, _A_, _T
        .byte   _O, _P, __, _SE, _C, _R, _ET, _NEW
        .byte   _S, _H, _I, _E, _L, _D, __, _G
        .byte   _EN, _ER, _AT, _OR, _CC, _U, _N, _F
        .byte   _OR, _T, _U, _N, _AT, _E, _L, _Y
        .byte   __, _IT, $70, _S, __, _BE, _EN, __
        .byte   _ST, _O, _L, _EN, _CC, _F16_, _IT, __
        .byte   _W, _EN, _T, __, _M, _I, _S, _S
        .byte   _ING_, _F, _R, _O, _M, __, _OU, _R
        .byte   __, _SHIP, __, _Y, _AR, _D, __, _ON
        .byte   __, _F13_, _XE, _ER, __, _F, _I, _VE
        .byte   __, _M, _ON, _TH, _S, __, _A, _G
        .byte   _O, _AND_, _F1C_, _CC, _YOU, _R, __, _M
        .byte   _I, _S, _S, _I, _ON, $7b, __, _S
        .byte   _H, _OU, _L, _D, __, _YOU, __, _D
        .byte   _E, _C, _I, _D, _E, _TO, _A, _C
        .byte   _CE, _P, _T, __, _IT, $7b, __, _I
        .byte   _S, _TO, _SE, _E, _K, _AND_, _D, _ES
        .byte   _T, _R, _O, _Y, __, _THIS, _SHIP, _CC
        .byte   _YOU, __, _A, _RE, __, _C, _A, _U
        .byte   _TI, _ON, _ED_, _TH, _AT, __, _ON, _L
        .byte   _Y, __, _F06_, $22, _F05_, _S, __, _W
        .byte   _IL, _L, __, _P, _EN, _ET, _RA, _T
        .byte   _E, __, _THE, _N, _E, _W, __, _S
        .byte   _H, _I, _E, _L, _D, _S, _AND_, _TH
        .byte   _AT, __, _THE, _F13_, _C, _ON, _ST, _R
        .byte   _I, _C, _T, _OR, _IS, _F, _IT, _T
        .byte   _ED_, _W, _I, _TH, __, _AN, __, _F06_
        .byte   $3b, _F05_, _B1, _F02_, _F08_, _G, _O, _O
        .byte   _D, __, _L, _U, _C, _K, $7b, __
        .byte   _COMMANDER, _D4, _F16_, __end
        .define_msg "_0A"
        
        ; 11.
        .byte   _F19_, _F09_, _F17_, _F0E_
        .byte   _F02_, __, __, _AT, _T, _EN, _TI, _ON
        .byte   $82, _DOT, __, _F13_, _W, _E, __, _H
        .byte   _A, _VE, __, _N, _E, _ED_, _O, _F
        .byte   __, _YOU, _R, __, _SE, _R, _V, _I
        .byte   _C, _ES, __, _A, _G, _A, _IN, _CC
        .byte   _I, _F, __, _YOU, __, _W, _OU, _L
        .byte   _D, __, _BE, __, _SO, __, _G, _O
        .byte   _O, _D, __, _A, _S, _TO, _G, _O
        .byte   _TO, _F13_, _CE, _ER, _DI, __, _YOU, __
        .byte   _W, _IL, _L, __, _BE, __, _B, _R
        .byte   _I, _E, _F, _ED, _CC, _I, _F, __
        .byte   _S, _U, _C, _CE, _S, _S, _F, _U
        .byte   _L, $7b, __, _YOU, __, _W, _IL, _L
        .byte   __, _BE, __, _W, _E, _L, _L, __
        .byte   _RE, _W, _AR, _D, _ED, _D4, _F18_, __end
        .define_msg "_0B"

        ; 12.
        .byte   $7f, _F13_, _C, $7e, _C5, __, $66, $6e
        .byte   $6f, $62, __end
        .define_msg "_0C"
        
        ; 13.
        .byte   _B, _Y, _C5, __end
        .define_msg "_0D"

        ; 14.
        .byte   _F15_, _PLANET, _C8, _F1A_, __end
        .define_msg "_0E"

        ; 15.
        .byte   _F19_, _F09_, _F17_, _F0E_
        .byte   _F02_, __, __, _C, _ON, _G, _RA, _T
        .byte   _U, _LA, _TI, _ON, _S, __, _COMMANDER, $76
        .byte   _F0C_, _F0C_, _TH, _ER, _E, _F0D_, __, _W
        .byte   _IL, _L, __, _AL, _W, _A, _Y, _S
        .byte   __, _BE, _A_, _P, _LA, _CE, __, _F
        .byte   _OR, __, _YOU, __, _IN, _D3, _CC, _AN
        .byte   _D, __, _MA, _Y, _BE, __, _SO, _ON
        .byte   _ER, __, _TH, _AN, __, _YOU, __, _TH
        .byte   _IN, _K, _DOT, _DOT, _D4, _F18_, __end
        .define_msg "_0F"

        ; 16.
        .byte   _F, _AB, _LE, _D, __end
        .define_msg "_FABLED"

        ; 17.
        .byte   _NO, _T, _AB, _LE, __end
        .define_msg "_NOTABLE"

        ; 18.
        .byte   _W, _E, _L, _L, __, _K, _NO, _W, _N, __end
        .define_msg "_WELL_KNOWN"

        ; 19.
        .byte   _F, _A, _M, _O, _US, __end
        .define_msg "_FAMOUS"

        ; 20.
        .byte   _NO, _T, _ED, __end
        .define_msg "_NOTED"

        ; 21.
        .byte   _VE, _R, _Y, __end
        .define_msg "_VERY"

        ; 22.
        .byte   _M, _IL, _D, _L, _Y, __end
        .define_msg "_MILDLY"

        ; 23.
        .byte   _M, _O, _ST, __end
        .define_msg "_MOST"

        ; 24.
        .byte   _RE, _A, _S, _ON, _AB, _L, _Y, __end
        .define_msg "_REASONABLY"

        ; 25.
        .byte   __end
        .skip_msg
        
        ; 26.
        .byte   _ANCIENT, __end
        .define_msg "_1A"

        ; 27.
        .byte   $25, __end
        .define_msg "_1B"

        ; 28.
        .byte   _G, _RE, _AT, __end
        .define_msg "_GREAT"
        
        ; 29.
        .byte   _V, _A, _ST, __end
        .define_msg "_VAST"

        ; 30.
        .byte   _P, _IN, _K, __end
        .define_msg "_PINK"
        
        ; 31.
        .byte   _F02_, $20, __, $21
        .byte   _F0D_, __, _PLANT, _A, _TI, _ON, _S, __end
        .define_msg "_1F"

        ; 32.
        .byte   _MOUNTAIN, _S, __end
        .define_msg "_20"

        ; 33.
        .byte   $22, __end
        .define_msg "_21"
        
        ; 34.
        .byte   $d7, __, _F, _OR, _ES, _T, _S, __end
        .define_msg "_22"
        
        ; 35.
        .byte   _O, _CE, _AN, _S, __end
        .define_msg "_OCEANS"
        
        ; 36.
        .byte   _S, _H, _Y, _N, _ES, _S, __end
        .define_msg "_SHYNESS"
        
        ; 37.
        .byte   _S, _IL, _L, _IN, _ES, _S, __end
        .define_msg "_SILLINESS"
        
        ; 38.
        .byte   _MA, _T, _ING_, _T, _RA, _DI, _TI, _ON, _S, __end
        .define_msg "_26"
        
        ; 39.
        .byte   _LO, _AT, _H, _ING_, _O, _F, __, $33, __end
        .define_msg "_27"
        
        ; 40.
        .byte   _LO, _VE, __, _F, _OR, __, $33, __end
        .define_msg "_28"
        
        ; 41.
        .byte   _F, _O, _O, _D, __, _B, _LE, _N, _D, _ER, _S, __end
        .define_msg "_FOOD_BLENDERS"
        
        ; 42.
        .byte   _T, _OU, _R, _I, _ST, _S, __end
        .define_msg "_TOURISTS"
        
        ; 43.
        .byte   _P, _O, _ET, _R, _Y, __end
        .define_msg "_POETRY"
        
        ; 44.
        .byte   _DI, _S, _C, _O, _S, __end
        .define_msg "_DISCOS"
        
        ; 45.
        .byte   $3b, __end
        .define_msg "_2D"
        
        ; 46.
        .byte   _W, _AL, _K, _ING_, _TREE, __end
        .define_msg "_2E"
        
        ; 47.
        .byte   _C, _RA, _B, __end
        .define_msg "_CRAB"
        
        ; 48.
        .byte   _B, _AT, __end
        .define_msg "_BAT"
        
        ; 49.
        .byte   _LO, _B, _ST, __end
        .define_msg "_LOBST"
        
        ; 50.
        .byte   _F12_, __end
        .define_msg "_32"
        
        ; 51.
        .byte   _BE, _S, _ET, __end
        .define_msg "_BESET"
        
        ; 52.
        .byte   _P, _LA, _G, _U, _ED, __end
        .define_msg "_PLAGUED"
        
        ; 53.
        .byte   _RA, _V, _A, _G, _ED, __end
        .define_msg "_RAVAGED"
        
        ; 54.
        .byte   _C, _U, _R, _S, _ED, __end
        .define_msg "_CURSED"
        
        ; 55.
        .byte   _S, _C, _OU, _R, _G, _ED, __end
        .define_msg "_SCOURGED"
        
        ; 56.
        .byte   $26, __, _C, _I, _V, _IL, __, _W, _AR, __end
        .define_msg "_38"
        
        ; 57.
        .byte   $3f, __, $08, __, $37, _S, __end
        .define_msg "_39"
        
        ; 58.
        .byte   _A, __, $3f, __, _DI, _SE, _A, _SE, __end
        .define_msg "_3A"
        
        ; 59.
        .byte   $26, __, _E, _AR, _TH, _QU, _A, _K, _ES, __end
        .define_msg "_3B"
        
        ; 60.
        .byte   $26, __, _SO, _LA, _R, __, _A, _C
        .byte   _TI, _V, _IT, _Y, __end
        .define_msg "_3C"
        
        ; 61.
        .byte   _ITS, $0a, __, $09, __end
        .define_msg "_3D"
        
        ; 62.
        .byte   _THE, _F11_, __, $08, __, $37, __end
        .define_msg "_3E"
        
        ; 63.
        .byte   _ITS, _INHABITANT, _S, $70, __, $35, __, $34, __end
        .define_msg "_3F"
        
        ; 64.
        .byte   _F02_, $2d, _F0D_, __end
        .define_msg "_40"
        
        ; 65.
        .byte   _ITS, $3c, __, $3b, __end
        .define_msg "_41"
        
        ; 66.
        .byte   _J, _U, _I, _CE, __end
        .define_msg "_JUICE"
        
        ; 67.
        .byte   _B, _RA, _N, _D, _Y, __end
        .define_msg "_BRANDY"
        
        ; 68.
        .byte   _W, _AT, _ER, __end
        .define_msg "_WATER"
        
        ; 69.
        .byte   _B, _RE, _W, __end
        .define_msg "_BREW"
        
        ; 70.
        .byte   _G, _AR, _G, _LE, __, _B, _LA, _ST, _ER, _S, __end
        .define_msg "_GARGLE_BLASTERS"
        
        ; 71.
        .byte   _F12_, __end
        .define_msg "_47"
        
        ; 72.
        .byte   _F11_, __, $37, __end
        .define_msg "_48"
        
        ; 73.
        .byte   _F11_, __, _F12_, __end
        .define_msg "_49"
        
        ; 74.
        .byte   _F11_, __, $3f, __end
        .define_msg "_4A"
        
        ; 75.
        .byte   $3f, __, _F12_, __end
        .define_msg "_4B"
        
        ; 76.
        .byte   _F, _AB, _U, _LO, _US, __end
        .define_msg "_FABULOUS"
        
        ; 77.
        .byte   _E, _X, _O, _TI, _C, __end
        .define_msg "_EXOTIC"
        
        ; 78.
        .byte   _H, _O, _O, _P, _Y, __end
        .define_msg "_HOOPY"
        
        ; 79.
        .byte   _U, _NU, _S, _U, _AL, __end
        ;.define_msg "_UNUSUAL"
        .skip_msg
        
        ; 80.
        .byte   _E, _X, _C, _IT, _IN, _G, __end
        .define_msg "_EXCITING"
        
        ; 81.
        .byte   _C, _U, _I, _S, _IN, _E, __end
        .define_msg "_CUISINE"
        
        ; 82.
        .byte   _N, _I, _G, _H, _T, __, _L, _I, _F, _E, __end
        .define_msg "_NIGHT_LIFE"
        
        ; 83.
        .byte   _C, _A, _S, _I, _NO, _S, __end
        .define_msg "_CASINOS"
        
        ; 84.
        .byte   _S, _IT, __, _C, _O, _M, _S, __end
        .define_msg "_SIT_COMS"
        
        ; 85.
        .byte   _F02_, $2d, _F0D_, __end
        .define_msg "_55"
        
        ; 86.
        .byte   _F03_, __end
        .define_msg "_56"
        
        ; 87.
        .byte   _THE, _PLANET, __, _F03_, __end
        .define_msg "_57"
        
        ; 88.
        .byte   _THE, _WORLD, __, _F03_, __end
        .define_msg "_58"
        
        ; 89.
        .byte   _THIS, _PLANET, __end
        .define_msg "_59"
        
        ; 90.
        .byte   _THIS, _WORLD, __end
        .define_msg "_5A"
        
        ; 91.
        .byte   _S, _ON, __, _O, _F, _A_, _B, _IT, _C, _H, __end
        .define_msg "_SON_OF_A_BITCH"
        
        ; 92.
        .byte   _S, _C, _OU, _N, _D, _RE, _L, __end
        .define_msg "_SCOUNDRELL"
        
        ; 93.
        .byte   _B, _LA, _C, _K, _G, _U, _AR, _D, __end
        .define_msg "_BLACKGUARD"
        
        ; 94.
        .byte   _R, _O, _G, _U, _E, __end
        .define_msg "_ROGUE"
        
        ; 95.
        .byte   _W, _H, _OR, _ES, _ON
        .byte   __, _BE, _ET, _LE, __, _H, _E, _A
        .byte   _D, _ED_, _F, _LA, _P, __, _E, _AR
        .byte   $70, _D, __, _K, _N, _A, _VE, __end
        .define_msg "_5F"
        
        ; 96.
        .byte   _N, __, _U, _N, _RE, _MA, _R, _K
        .byte   _AB, _LE, __end
        .define_msg "_60"
        
        ; 97.
        .byte   __, _B, _OR, _IN, _G, __end
        .define_msg "_BORING"
        
        ; 98.
        .byte   __, _D, _U, _L, _L, __end
        .define_msg "_DULL"
        
        ; 99.
        .byte   __, _T, _E, _DI, _O, _US, __end
        .define_msg "_TEDIOUS"
        
        ; 100.
        .byte   __, _RE, _V, _O, _L, _T, _IN, _G, __end
        .define_msg "_REVOLTING"
        
        ; 101.
        .byte   _PLANET, __end
        .define_msg "_65"
        
        ; 102.
        .byte   _WORLD, __end
        .define_msg "_66"
        
        ; 103.
        .byte   _P, _LA, _CE, __end
        .define_msg "_PLACE"
        
        ; 104.
        .byte   _L, _IT, _T, _LE, __, _PLANET, __end
        .define_msg "_LITTLE_PLANET"
        
        ; 105.
        .byte   _D, _U, _M, _P, __end
        .define_msg "_DUMP"
        
        ; 106.
        .byte   _I, __, _H, _E, _AR
        .byte   _A_, $25, __, _LO, _O, _K, _ING_, _SHIP
        .byte   __, _A, _P, _P, _E, _AR, _ED_, _AT
        .byte   _ERRIUS, __end
        .define_msg "_6A"
        
        ; 107.
        .byte   _Y, _E, _A, _H, $7b, __
        .byte   _I, __, _H, _E, _AR, _A_, $25, __
        .byte   _SHIP, __, _LE, _F, _T, _ERRIUS, _A_, __
        .byte   _W, _H, _I, _LE, __, _B, _A, _C
        .byte   _K, __end
        .define_msg "_6B"
        
        ; 108.
        .byte   _G, _ET, __, _YOU, _R, __
        .byte   _I, _R, _ON, __, _A, _S, _S, __
        .byte   _O, _V, _ER, __, _T, _O, _ERRIUS, __end
        .define_msg "_6C"
        
        ; 109.
        .byte   _SO, _M, _E, __, $24, _NEW, _SHIP, __
        .byte   _W, _A, _S, __, _SE, _EN, __, _AT
        .byte   _ERRIUS, __end
        .define_msg "_6D"
        
        ; 110.
        .byte   _T, _R, _Y, _ERRIUS, __end
        .define_msg "_6E"
        
        ; 111.
        .byte   __, _C, _U, _D, _D, _L, _Y, __end
        .define_msg "_CUDDLY"
        
        ; 112.
        .byte   __, _C, _U, _T, _E, __end
        .define_msg "_CUTE"
        
        ; 113.
        .byte   __, _F, _U, _R, _R, _Y, __end
        .define_msg "_FURRY"
        
        ; 114.
        .byte   __, _F, _R, _I, _EN, _D, _L, _Y, __end
        .define_msg "_FRIENDLY"
        
        ; 115.
        .byte   _W, _A, _S, _P, __end
        .define_msg "_WASP"
        
        ; 116.
        .byte   _M, _O, _TH, __end
        .define_msg "_MOTH"
        
        ; 117.
        .byte   _G, _R, _U, _B, __end
        .define_msg "_GRUB"
        
        ; 118.
        .byte   _AN, _T, __end
        .define_msg "_ANT"
        
        ; 119.
        .byte   _F12_, __end
        .define_msg "_77"
        
        ; 120.
        .byte   _P, _O, _ET, __end
        .define_msg "_POET"
        
        ; 121.
        .byte   _AR, _T, _S, __, _G, _RA, _D, _U, _AT, _E, __end
        .define_msg "_ARTS_GRADUATE"
        
        ; 122.
        .byte   _Y, _A, _K, __end
        .define_msg "_YAK"
        
        ; 123.
        .byte   _S, _N, _A, _IL, __end
        .define_msg "_SNAIL"
        
        ; 124.
        .byte   _S, _L, _U, _G, __end
        .define_msg "_SLUG"
        
        ; 125.
        .byte   _T, _R, _O, _P, _I, _C, _AL, __end
        .define_msg "_TROPICAL"
        
        ; 126.
        .byte   _D, _EN, _SE, __end
        .define_msg "_DENSE"
        
        ; 127.
        .byte   _RA, _IN, __end
        .define_msg "_RAIN"
        
        ; 128.
        .byte   _I, _M, _P, _EN, _ET, _RA, _B, _LE, __end
        .define_msg "_IMPENETRABLE"
        
        ; message indicies $81..$D6 are expandable via msgtokens $81..$D6
        ;-----------------------------------------------------------------------

        ; 129.
        .byte   _E, _X, _U, _BE, _RA, _N, _T, __end
        .define_msg "_EXUBERANT"
        
        ; 130.
        .byte   _F, _U, _N, _N, _Y, __end
        .define_msg "_FUNNY"
        
        ; 131.
        .byte   _W, _E, _I, _R, _D, __end
        .define_msg "_WEIRD"
        
        ; 132.
        .byte   _U, _NU, _S, _U, _AL, __end
        .define_msg "_UNUSUAL"
        
        ; 133.
        .byte   _ST, _RA, _N, _GE, __end
        .define_msg "_STRANGE"
        
        ; 134.
        .byte   _P, _E, _C, _U, _L, _I, _AR, __end
        .define_msg "_PECULIAR"
        
        ; 135.
        .byte   _F, _RE, _QU, _EN, _T, __end
        .define_msg "_FREQUENT"
        
        ; 136.
        .byte   _O, _C, _C, _A, _S, _I, _ON, _AL, __end
        .define_msg "_OCCASIONAL"
        
        ; 137.
        .byte   _U, _N, _P, _RE, _DI, _C, _T, _AB, _LE, __end
        .define_msg "_UNPREDICTABLE"
        
        ; 138.
        .byte   _D, _RE, _A, _D, _F, _U, _L, __end
        .define_msg "_DREADFUL"
        
        ; 139.
        .byte   _DEADLY, __end
        .define_msg "_8B"

        ; 140.
        .byte   $0b, __, $0c, __, _F, _OR, __, $32, __end
        .define_msg "_8C"
        
        ; 141.
        .byte   _8C, _AND_, $32, __end
        .define_msg "_8D"
        
        ; 142.
        .byte   $31, __, _B, _Y, __, $30, __end
        .define_msg "_8E"
        
        ; 143.
        .byte   _8C, __, _B, _U, _T, __, _8E, __end
        .define_msg "_8F"
        
        ; 144.
        .byte   __, _A, $38, __, $27, __end
        .define_msg "_90"
        
        ; 145.
        .byte   _P, _L, _AN, _ET, __end
        .define_msg "_PLANET"
        
        ; 146.
        .byte   _W, _OR, _L, _D, __end
        .define_msg "_WORLD"
        
        ; 147.
        .byte   _TH, _E, __, __end
        .define_msg "_THE"
        
        ; 148.
        .byte   _TH, _I, _S, __, __end
        .define_msg "_THIS"
        
        ; 149.
        .byte   _LO, _A, _D, _NEW, _COMMANDER, __end
        .define_msg "_95"
        
        ; 150.
        .byte   _F09_, _F0B_, _F01_, _F08_, __end
        .define_msg "_96"
        
        ; 151.
        .byte   _D, _R, _I, _VE, __end
        .define_msg "_DRIVE"
        
        ; 152.
        .byte   __, _C, _AT, _A, _LO, _G, _U, _E, __end
        .define_msg "_CATALOGUE"
        
        ; 153.
        .byte   _I, _AN, __end
        .define_msg "_IAN"
        
        ; 154.
        .byte   _F13_, _C, _O, _M, _M, _AN, _D, _ER, __end
        .define_msg "_COMMANDER"
        
        ; 155.
        .byte   $3f, __end
        .define_msg "_9B"
        
        ; 156.
        .byte   _M, _OU, _N, _T, _A, _IN, __end
        .define_msg "_MOUNTAIN"
        
        ; 157.
        .byte   _ED, _I, _B, _LE, __end
        .define_msg "_EDIBLE"
        
        ; 158.
        .byte   _T, _RE, _E, __end
        .define_msg "_TREE"
        
        ; 159.
        .byte   _S, _P, _O, _T, _T, _ED, __end
        .define_msg "_SPOTTED"
        
        ; 160.
        .byte   $2f, __end
        .define_msg "_A0"
        
        ; 161.
        .byte   $2e, __end
        .define_msg "_A1"
        
        ; 162.
        .byte   $36, _O, _I, _D, __end
        .define_msg "_A2"
        
        ; 163.
        .byte   $28, __end
        .define_msg "_A3"
        
        ; 164.
        .byte   $29, __end
        .define_msg "_A4"
        
        ; 165.
        .byte   _AN, _C, _I, _EN, _T, __end
        .define_msg "_ANCIENT"
        
        ; 166.
        .byte   _E, _X, _CE, _P, _TI, _ON, _AL, __end
        .define_msg "_EXCEPTIONAL"
        
        ; 167.
        .byte   _E, _C, _CE, _N, _T, _R, _I, _C, __end
        .define_msg "_ECCENTRIC"
        
        ; 168.
        .byte   _IN, _G, _RA, _IN, _ED, __end
        .define_msg "_INGRAINED"
        
        ; 169.
        .byte   $25, __end
        .define_msg "_A9"
        
        ; 170.
        .byte   _K, _IL, _L, _ER, __end
        .define_msg "_KILLER"
        
        ; 171.
        .byte   _D, _E, _A, _D, _L, _Y, __end
        .define_msg "_DEADLY"
        
        ; 172.
        .byte   _E, _V, _IL, __end
        .define_msg "_EVIL"
        
        ; 173.
        .byte   _LE, _TH, _AL, __end
        .define_msg "_LETHAL"
        
        ; 174.
        .byte   _V, _I, _C, _I, _O, _US, __end
        .define_msg "_VICIOUS"
        
        ; 175.
        .byte   _IT, _S, __, __end
        .define_msg "_ITS"
        
        ; 176.
        .byte   _F0D_, _F0E_, _F13_, __end
        .define_msg "_B0"
        
        ; 177.
        .byte   _DOT, _F0C_, _F0F_, __end
        .define_msg "_B1"
        
        ; 178.
        .byte   __, _AN, _D, __, __end
        .define_msg "_AND_"
        
        ; 179.
        .byte   _Y, _OU, __end
        .define_msg "_YOU"
        
        ; 180.
        .byte   _P, _AR, _K, _ING_, _M, _ET, _ER, _S, __end
        .define_msg "_B4"
        
        ; 181.
        .byte   _D, _US, _T, __, _C, _LO, _U, _D, _S, __end
        .define_msg "_DUST_CLOUDS"
        
        ; 182.
        .byte   _I, _CE, __, _BE, _R, _G, _S, __end
        .define_msg "_ICE_BERGS"
        
        ; 183.
        .byte   _R, _O, _C, _K, __, _F, _OR, _MA, _TI, _ON, _S, __end
        .define_msg "_ROCK_FORMATIONS"
        
        ; 184.
        .byte   _V, _O, _L, _C, _A, _NO, _ES, __end
        .define_msg "_VOLCANOES"
        
        ; 185.
        .byte   _P, _L, _AN, _T, __end
        .define_msg "_PLANT"
        
        ; 186.
        .byte   _T, _U, _L, _I, _P, __end
        .define_msg "_TULIP"
        
        ; 187.
        .byte   _B, _AN, _AN, _A, __end
        .define_msg "_BANANA"
        
        ; 188.
        .byte   _C, _OR, _N, __end
        .define_msg "_CORN"
        
        ; 189.
        .byte   _F12_, _W, _E, _ED, __end
        .define_msg "_WEED"
        
        ; 190.
        .byte   _F12_, __end
        .define_msg "_BE_"
        
        ; 191.
        .byte   _F11_, __, _F12_, __end
        .define_msg "_BF"
        
        ; 192.
        .byte   _F11_, __, $3f, __end
        .define_msg "_C0"
        
        ; 193.
        .byte   _IN, _H, _A, _BI, _T, _AN, _T, __end
        .define_msg "_INHABITANT"
        
        ; 194.
        .byte   _BF, __end
        .define_msg "_C2"
        
        ; 195.
        .byte   _IN, _G, __, __end
        .define_msg "_ING_"
        
        ; 196.
        .byte   _ED, __, __end
        .define_msg "_ED_"
        
        ; 197.
        .byte   __, _D, _DOT, _B, _RA, _BE, _N, __
        .byte   $71, __, _I, _DOT, _BE, _L, _L, __end
        .define_msg "_C5"
        
        ; 198.
        .byte   __, _L, _IT, _T, _LE, __, _T, _R
        .byte   _U, _M, _B, _LE, __end
        .define_msg "_LITTLE_TRUMBLE"
        
        ; 199.
        .byte   _F19_, _F09_, _F1D_
        .byte   _F0E_, _F13_, _G, _O, _O, _D, _F0D_, __
        .byte   _D, _A, _Y, __, _COMMANDER, __, _F04_, $7b
        .byte   __, _AL, _LO, _W, __, _M, _E, _TO
        .byte   _IN, _T, _R, _O, _D, _U, _CE, __
        .byte   _M, _Y, _SE, _L, _F, _DOT, __, _F13_
        .byte   _I, __, _A, _M, _F02_, __, _THE, _M
        .byte   _ER, _C, _H, _AN, _T, __, _P, _R
        .byte   _IN, _CE, __, _O, _F, __, _TH, _R
        .byte   _U, _N, _F0D_, _AND_, _F13_, _I, __, _F
        .byte   _IN, _D, __, _M, _Y, _SE, _L, _F
        .byte   __, _F, _OR, _CE, _D, _TO, _SE, _L
        .byte   _L, __, _M, _Y, __, _M, _O, _ST
        .byte   __, _T, _RE, _A, _S, _U, _R, _ED
        .byte   __, _P, _O, _S, _S, _ES, _S, _I
        .byte   _ON, _CC, _I, __, _A, _M, __, _O
        .byte   _F, _F, _ER, _ING_, _Y, _OU, $7b, __
        .byte   _F, _OR, __, _THE, _P, _A, _L, _T
        .byte   _R, _Y, __, _S, _U, _M, __, _O
        .byte   _F, __, _J, _U, _ST, __, $62, $67
        .byte   $67, $67, _F13_, _C, _F13_, _R, __, _THE
        .byte   _RA, _RE, _ST, __, _TH, _ING_, __, _IN
        .byte   __, _THE, _F02_, _K, _NO, _W, _N, __
        .byte   _U, _N, _I, _VE, _R, _SE, _CC, _F0D_
        .byte   _W, _IL, _L, __, _Y, _OU, __, _T
        .byte   _A, _K, _E, __, _IT, _F01_, $7f, _Y
        .byte   $78, _N, $7e, $68, _F0C_, _F0F_, _F01_, _F08_
        .byte   __end
        .define_msg "_C7"
        
        ; 200.
        .byte   __, _N, _A, _M, _E, $68, __
        .byte   __end
        .define_msg "_C8"
        
        ; 201.
        .byte   __, _T, _O, __, __end
        .define_msg "_TO"
        
        ; 202.
        .byte   __, _I, _S, __, __end
        .define_msg "_IS"
        
        ; 203.
        .byte   _W, _A, _S, __, _LA
        .byte   _ST, __, _SE, _EN, __, _AT, __, _F13_
        .byte   __end
        .define_msg "_CB"
        
        ; 204.
        .byte   _DOT, _F0C_, __, _F13_, __end
        .define_msg "_CC"
        
        ; 205.
        .byte   _D, _O, _C, _K, _ED, __end
        .define_msg "_DOCKED"
        
        ; 206.
        .byte   _F01_, $7f, _Y, $78, _N, $7e, $68, __end
        .define_msg "_CE_"
        
        ; 207.
        .byte   _S, _H, _I, _P, __end
        .define_msg "_SHIP"
        
        ; 208.
        .byte   __, _A, __, __end
        .define_msg "_A_"
        
        ; 209.
        .byte   __, _ER, _R, _I, _US, __end
        .define_msg "_ERRIUS"
        
        ; 210.
        .byte   __, _N, _E, _W, __, __end
        .define_msg "_NEW"
        
        ; 211.
        .byte   _F02_, __, _H, _ER, __, _MA, _J
        .byte   _ES, _T, _Y, $70, _S, __, _S, _P
        .byte   _A, _CE, __, _N, _A, _V, _Y, _F0D_
        .byte   __end
        .define_msg "_D3"
        
        ; 212.
        .byte   _B1, _F08_, _F01_, __, __, _M, _ES
        .byte   _S, _A, _GE, __, _EN, _D, _S, __end
        .define_msg "_D4"
        
        ; 213.
        .byte   __, _COMMANDER, __, _F04_, $7b, __, _I, __
        .byte   _F0D_, _A, _M, _F02_, __, _C, _A, _P
        .byte   _T, _A, _IN, __, _F1B_, __, _F0D_, _O
        .byte   _F, _D3, __end
        .define_msg "_D5"
        
        ; 214.
        .byte   __end
        .skip_msg

        ;-----------------------------------------------------------------------
        
        ; 215.
        .byte   _F0F_, __, _U, _N, _K, _NO, _W, _N, __, _PLANET, __end
        .define_msg "_D7"
        
        ; 216.
        .byte   _F09_, _F08_, _F17_, _F01_, __, _IN, _C, _O, _M
        .byte   _ING_, _M, _ES, _S, _A, _GE, __end
        .define_msg "_D8"
        
        ; 217.
        .byte   _C, _U, _R, _R, _U, _TH, _ER, _S, __end
        .define_msg "_CURRUTHERS"
        
        ; 218.
        .byte   _F, _O, _S, _D, _Y, _K, _E, __
        .byte   _S, _M, _Y, _TH, _E, __end
        .define_msg "_FOSDYKE_SMYTHE"
        
        ; 219.
        .byte   _F, _OR, _T, _ES, _QU, _E, __end
        .define_msg "_FORTESQUE"
        
        ; 220.
        .byte   _CB, _RE, _ES, _DI, _CE, __end
        .define_msg "_DC"
        
        ; 221.
        .byte   _I, _S, __, _BE, _L
        .byte   _I, _E, _V, _ED, _TO, _H, _A, _VE
        .byte   __, _J, _U, _M, _P, _ED, _TO, _THIS
        .byte   _G, _AL, _A, _X, _Y, __end
        .define_msg "_DD"
        
        ; 222.
        .byte   _F19_, _F09_
        .byte   _F1D_, _F0E_, _F02_, _G, _O, _O, _D, __
        .byte   _D, _A, _Y, __, _COMMANDER, __, _F04_, _CC
        .byte   _I, _F0D_, __, _A, _M, __, _F13_, _A
        .byte   _G, _EN, _T, __, _F13_, _B, _LA, _K
        .byte   _E, __, _O, _F, __, _F13_, _N, _A
        .byte   _V, _AL, __, _F13_, _IN, _T, _E, _L
        .byte   _LE, _G, _EN, _CE, _CC, _A, _S, __
        .byte   _YOU, __, _K, _NO, _W, $7b, __, _THE
        .byte   _F13_, _N, _A, _V, _Y, __, _H, _A
        .byte   _VE, __, _BE, _EN, __, _K, _E, _E
        .byte   _P, _ING_, _THE, _F13_, _TH, _AR, _G, _O
        .byte   _I, _D, _S, __, _O, _F, _F, __
        .byte   _YOU, _R, __, _A, _S, _S, __, _OU
        .byte   _T, __, _IN, __, _D, _E, _E, _P
        .byte   __, _S, _P, _A, _CE, __, _F, _OR
        .byte   __, _MA, _N, _Y, __, _Y, _E, _AR
        .byte   _S, __, _NO, _W, _DOT, __, _F13_, _W
        .byte   _E, _L, _L, __, _THE, _S, _IT, _U
        .byte   _A, _TI, _ON, __, _H, _A, _S, __
        .byte   _C, _H, _AN, _G, _ED, _CC, _OU, _R
        .byte   __, _B, _O, _Y, _S, __, _AR, _E
        .byte   __, _RE, _A, _D, _Y, __, _F, _OR
        .byte   _A_, _P, _U, _S, _H, __, _R, _I
        .byte   _G, _H, _T, _TO, _THE, _H, _O, _M
        .byte   _E, __, _S, _Y, _S, _T, _E, _M
        .byte   __, _O, _F, __, _TH, _O, _SE, __
        .byte   _M, _U, _R, _D, _ER, _ER, _S, _CC
        .byte   _F18_, _F09_, _F1D_, _I, _F0D_, __, _H, _A
        .byte   _VE, __, _O, _B, _T, _A, _IN, _ED_
        .byte   _THE, _D, _E, _F, _EN, _CE, __, _P
        .byte   _LA, _N, _S, __, _F, _OR, __, _TH
        .byte   _E, _I, _R, __, _F13_, _H, _I, _VE
        .byte   __, _F13_, _W, _OR, _L, _D, _S, _CC
        .byte   _THE, _BE, _ET, _LE, _S, __, _K, _NO
        .byte   _W, __, _W, _E, $70, _VE, __, _G
        .byte   _O, _T, __, _SO, _M, _E, _TH, _ING_
        .byte   _B, _U, _T, __, _NO, _T, __, _W
        .byte   _H, _AT, _CC, _I, _F, __, _F13_, _I
        .byte   __, _T, _RA, _N, _S, _M, _IT, __
        .byte   _THE, _P, _LA, _N, _S, _TO, _OU, _R
        .byte   __, _B, _A, _SE, __, _ON, __, _F13_
        .byte   _BI, _RE, _RA, __, _TH, _E, _Y, $70
        .byte   _L, _L, __, _IN, _T, _ER, _CE, _P
        .byte   _T, __, _THE, _T, _R, _AN, _S, _M
        .byte   _I, _S, _S, _I, _ON, _DOT, __, _F13_
        .byte   _I, __, _N, _E, _ED, _A_, _SHIP, _TO
        .byte   _MA, _K, _E, __, _THE, _R, _U, _N
        .byte   _CC, _YOU, $70, _RE, __, _E, _LE, _C
        .byte   _T, _ED, _CC, _THE, _P, _LA, _N, _S
        .byte   __, _A, _RE, __, _U, _N, _I, _P
        .byte   _U, _L, _SE, __, _C, _O, _D, _ED_
        .byte   _W, _I, _TH, _IN, __, _THIS, _T, _R
        .byte   _AN, _S, _M, _I, _S, _S, _I, _ON
        .byte   _CC, _F08_, _YOU, __, _W, _IL, _L, __
        .byte   _BE, __, _P, _A, _I, _D, _CC, __
        .byte   __, __, __, _F13_, _G, _O, _O, _D
        .byte   __, _L, _U, _C, _K, __, _COMMANDER, _D4
        .byte   _F18_, __end
        .define_msg "_DE"
        
        ; 223.
        .byte   _F19_, _F09_, _F1D_, _F08_, _F0E_, _F0D_
        .byte   _F13_, _W, _E, _L, _L, __, _D, _ON
        .byte   _E, __, _COMMANDER, _CC, _YOU, __, _H, _A
        .byte   _VE, __, _SE, _R, _V, _ED_, _U, _S
        .byte   __, _W, _E, _L, _L, _AND_, _W, _E
        .byte   __, _S, _H, _AL, _L, __, _RE, _M
        .byte   _E, _M, _B, _ER, _CC, _W, _E, __
        .byte   _D, _I, _D, __, _NO, _T, __, _E
        .byte   _X, _P, _E, _C, _T, __, _THE, _F13_
        .byte   _TH, _AR, _G, _O, _I, _D, _S, _TO
        .byte   _F, _IN, _D, __, _OU, _T, __, _A
        .byte   _B, _OU, _T, __, _YOU, _CC, _F, _OR
        .byte   __, _THE, _M, _O, _M, _EN, _T, __
        .byte   _P, _LE, _A, _SE, __, _A, _C, _CE
        .byte   _P, _T, __, _THIS, _F13_, _N, _A, _V
        .byte   _Y, __, _F06_, $25, _F05_, __, _A, _S
        .byte   __, _P, _A, _Y, _M, _EN, _T, _D4
        .byte   _F18_, __end
        .define_msg "_DF"
        
        ; 224.
        .byte   _A, _RE, __, _YOU, __, _S
        .byte   _U, _RE, $68, __end
        .define_msg "_E0"
        
        ; 225.
        .byte   _S, _H, _RE, _W, __end
        .define_msg "_SHREW"
        
        ; 226.
        .byte   _BE, _A, _ST, __end
        .define_msg "_BEAST"
        
        ; 227.
        .byte   _B, _I, _S, _ON, __end
        .define_msg "_BISON"
        
        ; 228.
        .byte   _S, _N, _A, _K, _E, __end
        .define_msg "_SNAKE"
        
        ; 229.
        .byte   _W, _O, _L, _F, __end
        .define_msg "_WOLF"
        
        ; 230.
        .byte   _LE, _O, _P, _AR, _D, __end
        .define_msg "_LEOPARD"
        
        ; 231.
        .byte   _C, _AT, __end
        .define_msg "_CAT"
        
        ; 232.
        .byte   _M, _ON, _K, _E, _Y, __end
        .define_msg "_MONKEY"
        
        ; 233.
        .byte   _G, _O, _AT, __end
        .define_msg "_GOAT"
        
        ; 234.
        .byte   _F, _I, _S, _H, __end
        .define_msg "_FISH"
        
        ; 235.
        .byte   $3d, __, $3e, __end
        .define_msg "_EB"
        
        ; 236.
        .byte   _F11_, __, $2f, __, $2c, __end
        .define_msg "_EC"
        
        ; 237.
        .byte   _ITS, $3c, __, $2e, __, $2c, __end
        .skip_msg
        
        ; 238.
        .byte   $2b, __, $2a, __end
        .define_msg "_EE"
        
        ; 239.
        .byte   $3d, __, $3e, __end
        .define_msg "_EF"
        
        ; 240.
        .byte   _M, _E, _AT, __end
        .define_msg "_MEAT"
        
        ; 241.
        .byte   _C, _U, _T, _L, _ET, __end
        .define_msg "_CUTLET"
        
        ; 242.
        .byte   _ST, _E, _A, _K, __end
        .define_msg "_STEAK"
        
        ; 243.
        .byte   _B, _U, _R, _G, _ER, _S, __end
        .define_msg "_BURGERS"
        
        ; 244.
        .byte   _SO, _U, _P, __end
        .define_msg "_SOUP"
        
        ; 245.
        .byte   _I, _CE, __end
        .define_msg "_ICE"
        
        ; 246.
        .byte   _M, _U, _D, __end
        .define_msg "_MUD"
        
        ; 247.
        .byte   _Z, _ER, _O, _HYPHEN, _F13_, _G, __end
        .define_msg "_F7"
        
        ; 248.
        .byte   _V, _A, _C, _U, _U, _M, __end
        .define_msg "_VACUUM"
        
        ; 249.
        .byte   _F11_, __, _U, _L, _T, _RA, __end
        .define_msg "_F9"
        
        ; 250.
        .byte   _H, _O, _C, _K, _E, _Y, __end
        .define_msg "_HOCKEY"
        
        ; 251.
        .byte   _C, _R, _I, _C, _K, _ET, __end
        .define_msg "_CRICKET"
        
        ; 252.
        .byte   _K, _AR, _AT, _E, __end
        .define_msg "_KARATE"
        
        ; 253.
        .byte   _P, _O, _LO, __end
        .define_msg "_POLO"
        
        ; 254.
        .byte   _T, _EN, _N, _I, _S, __end
        .define_msg "_TENNIS"
        
        ; 255.
        .byte   _F0C_, _F1E_, __, _ER, _R, _OR
        .define_msg "_FF"

;-------------------------------------------------------------------------------

_1a27:
.export _1a27
        .byte   __end
        .byte   $d3, $96, $24, $1c, $fd, $4f, $35, $76
        .byte   $64, $20, $44, $a4, $dc, $6a, $10, $a2
        .byte   $03, $6b, $1a, $c0, $b8, $05, $65, $c1
        .byte   $29
        
_1a41:
.export _1a41
        .byte        $01, $80, $00, $00, $00, $01, $01                  
        .byte   $01, $01, $82, $01, $01, $01, $01, $01
        .byte   $01, $01, $01, $01, $01, $01, $01, $01
        .byte   $02, $01, $82, $90
        
;-------------------------------------------------------------------------------

_1a5c:
.export _1a5c
        ; 0.
        .byte   __end
        
        ; 1.
        .byte   _THE, _C, _O
        .byte   _LO, _N, _I, _ST, _S, __, _H, _E
        .byte   _RE, __, _H, _A, _VE, __, _V, _I
        .byte   _O, _L, _AT, _ED, _F02_, __, _IN, _T
        .byte   _ER, _G, _AL, _A, _C, _TI, _C, __
        .byte   _C, _LO, _N, _ING_, _P, _R, _O, _T
        .byte   _O, _C, _O, _L, _F0D_, _AND_, _S, _H
        .byte   _OU, _L, _D, __, _BE, __, _A, _V
        .byte   _O, _I, _D, _ED, __end
        
        ; 2.
        .byte   _THE, _C, _ON
        .byte   _ST, _R, _I, _C, _T, _OR, __, _CB
        .byte   _RE, _ES, _DI, _CE, $7b, __, _COMMANDER, __end

        ; 3.
        .byte   _A, __, $25, __, _LO, _O, _K, _ING_
        .byte   _SHIP, __, _LE, _F, _T, __, _H, _E
        .byte   _RE, _A_, _W, _H, _I, _LE, __, _B
        .byte   _A, _C, _K, _DOT, __, _L, _O, _O
        .byte   _K, _ED_, _B, _OU, _N, _D, __, _F
        .byte   _OR, __, _AR, _E, _XE, __end
        
        ; 4.
        .byte   _Y, _E
        .byte   _P, $7b, _A_, $25, _NEW, _SHIP, __, _H
        .byte   _A, _D, _A_, _G, _AL, _A, _C, _TI
        .byte   _C, __, _H, _Y, _P, _ER, _D, _R
        .byte   _I, _VE, __, _F, _IT, _T, _ED_, _H
        .byte   _E, _RE, _DOT, __, _US, _ED_, _IT, __
        .byte   _T, _O, _O, __end
        
        ; 5.
        .byte   _THIS, __, $25, __
        .byte   _SHIP, __, _D, _E, _H, _Y, _P, _ED_
        .byte   _H, _E, _RE, __, _F, _R, _O, _M
        .byte   __, _NO, _W, _H, _E, _RE, $7b, __
        .byte   _S, _U, _N, __, _S, _K, _I, _M
        .byte   _M, _ED, _AND_, _J, _U, _M, _P, _ED
        .byte   _DOT, __, _I, __, _H, _E, _AR, __
        .byte   _IT, __, _W, _EN, _T, _TO, _IN, _BI
        .byte   _BE, __end
        
        ; 6.
        .byte   $24, __, _SHIP, __, _W, _EN
        .byte   _T, __, _F, _OR, __, _M, _E, __
        .byte   _AT, __, _A, _US, _AR, _DOT, __, _M
        .byte   _Y, __, _LA, _S, _ER, _S, __, _D
        .byte   _I, _D, _N, $70, _T, __, _E, _V
        .byte   _EN, __, _S, _C, _RA, _T, _C, _H
        .byte   __, _THE, $24, __end
        
        ; 7.
        .byte   _O, _H, __, _D
        .byte   _E, _AR, __, _M, _E, __, _Y, _ES
        .byte   _DOT, _A_, _F, _R, _I, _G, _H, _T
        .byte   _F, _U, _L, __, _R, _O, _G, _U
        .byte   _E, __, _W, _I, _TH, __, _W, _H
        .byte   _AT, __, _I, __, _BE, _L, _I, _E
        .byte   _VE, __, _YOU, __, _P, _E, _O, _P
        .byte   _LE, __, _C, _AL, _L, _A_, _LE, _A
        .byte   _D, __, _P, _O, _ST, _ER, _I, _OR
        .byte   __, _S, _H, _O, _T, __, _U, _P
        .byte   __, _LO, _T, _S, __, _O, _F, __
        .byte   _TH, _O, _SE, __, _BE, _A, _ST, _L
        .byte   _Y, __, _P, _I, _RA, _T, _ES, _AND_
        .byte   _W, _EN, _T, _TO, _US, _LE, _R, _I
        .byte   __end
        
        ; 8.
        .byte   _YOU, __, _C, _AN, __, _T, _A
        .byte   _C, _K, _LE, __, _THE, $3f, __, $24
        .byte   __, _I, _F, __, _YOU, __, _L, _I
        .byte   _K, _E, _DOT, __, _H, _E, $70, _S
        .byte   __, _AT, __, _OR, _AR, _RA, __end
        
        ; 9.
        .byte   _F01_
        .byte   _C, _O, _M, _ING_, _SO, _ON, _COLON, __
        .byte   _E, _L, _IT, _E, __, _I, _I, __end
        
        .byte   $23, __end      ; 10.
        .byte   $23, __end      ; 11.
        .byte   $23, __end      ; 12.
        .byte   $23, __end      ; 13.
        .byte   $23, __end      ; 14.
        .byte   $23, __end      ; 15.
        .byte   $23, __end      ; 16.
        .byte   $23, __end      ; 17.
        .byte   $23, __end      ; 18.
        .byte   $23, __end      ; 19.
        .byte   $23, __end      ; 20.
        .byte   $23, __end      ; 21.
        .byte   $23, __end      ; 22.
        
        ; 23.
        .byte   _B, _O, _Y, __, _A, _RE
        .byte   __, _YOU, __, _IN, __, _THE, _W, _R
        .byte   _ON, _G, __, _G, _AL, _A, _X, _Y
        .byte   $76, __end
        
        ; 24.
        .byte   _TH, _ER, _E, $70, _S, _A_
        .byte   _RE, _AL, __, $24, __, _P, _I, _RA
        .byte   _T, _E, __, _OU, _T, __, _TH, _ER
        .byte   _E, __end
        
        ; 25.
        .byte   _THE, _INHABITANT, _S, __, _O, _F
        .byte   __, $3a, __, _A, _RE, __, _SO, __
        .byte   _A, _MA, _Z, _IN, _G, _L, _Y, __
        .byte   _P, _R, _I, _M, _I, _TI, _VE, __
        .byte   _TH, _AT, __, _TH, _E, _Y, __, _ST
        .byte   _IL, _L, __, _TH, _IN, _K, __, _F13_
        .byte   $7d, $7d, $7d, $7d, $7d, __, $7d, $7d
        .byte   $7d, $7d, $7d, $7d, _IS, __, $64, _D
        .byte   __end
        
        ; 26.
        .byte   _F01_, _W, _E, _L, _C, _O, _M
        .byte   _E, __, _T, _O, __, _T, _H, _E
        .byte   __, _S, _E, _V, _E, _N, _T, _E
        .byte   _E, _N, _T, _H, __, _G, _A, _L
        .byte   _A, _X, _Y, $76, __end
        
        ; 27.
        .byte   $3a, _F1B_, _F13_
        .byte   _F16_, _F0F_, _F0F_, $31, $2b, $31, $3a, _F16_
        .byte   _F13_, _F14_, $23, $30, $3a, _F04_, _F03_, _F16_
        .byte   _F0F_, _F0F_, $31, $35, $2b, $31, $3a, _F1D_
        .byte   _F1A_, _F07_, _F1B_, _F1B_, $35, $33, _Z, $21
        .byte   _HYPHEN, $3d, $2e, _F1B_, _F1B_, $35, $32, $20
        .byte   _F1B_, _F13_, _F16_, _F0F_, _F0F_, $31, $3a, _F04_

;$1D00

;===============================================================================

.segment        "TEXT_PDESC"

; I believe these are a series of expansion-tokens that act as templates
; for planet descriptions

_3eac:
.export _3eac
        .byte   $10             ; msg token $5B
        .byte   $15             ; msg token $5C
        .byte   $1a             ; msg token $5D
        .byte   $1f             ; msg token $5E
        .byte   $9b             ; msg token $5F
        .byte   $a0             ; msg token $60
        .byte   $2e             ; msg token $61
        .byte   $a5             ; msg token $62
        .byte   $24             ; msg token $63
        .byte   $29             ; msg token $64
        .byte   $3d             ; msg token $65
        .byte   $33             ; msg token $66
        .byte   $38             ; msg token $67
        .byte   $aa             ; msg token $68
        .byte   _F15_           ; msg token $69
        .byte   _F10_           ; msg token $6A
        .byte   _F1B_           ; msg token $6B
        .byte   _F06_           ; msg token $6C
        .byte   _F01_           ; msg token $6D
        .byte   $8c             ; msg token $6E
        .byte   $60             ; msg token $6F
        .byte   $65             ; msg token $70
        .byte   _A_             ; msg token $71
        .byte   $82             ; msg token $72
        .byte   _F0C_           ; msg token $73
        .byte   $6a             ; msg token $74
        .byte   $b4             ; msg token $75
        .byte   $b9             ; msg token $76
        .byte   $be             ; msg token $77
        .byte   $e1             ; msg token $78
        .byte   $e6             ; msg token $79
        .byte   $eb             ; msg token $7A
        .byte   $f0             ; msg token $7B
        .byte   $f5             ; msg token $7C
        .byte   $fa             ; msg token $7D
        .byte   $73             ; msg token $7E
        .byte   $78             ; msg token $7F
        .byte   $7d             ; msg token $80

;$3ED2