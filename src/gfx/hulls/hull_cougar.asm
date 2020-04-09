; Elite C64 disassembly / Elite : Harmless, cc-by-nc-sa 2018-2020,
; see LICENSE.txt. "Elite" is copyright / trademark David Braben & Ian Bell,
; All Rights Reserved. <github.com/Kroc/elite-harmless>
;===============================================================================
; $20: cougar
;-------------------------------------------------------------------------------
hull_index           .set hull_index + 1
hull_cougar_index      := hull_index

.segment        "HULL_TABLE"                                            ;$D000..
;===============================================================================
        .addr   hull_cougar                                             ;$D03E/F

.segment        "HULL_TYPE"                                             ;$D042..
;===============================================================================
        .byte   $20                                                     ;$D061

.segment        "HULL_KILL_LO"                                          ;$D063..
;===============================================================================
        .byte   $55                                                     ;$D082

.segment        "HULL_KILL_HI"                                          ;$D084..
;===============================================================================
        .byte   $05                                                     ;$D0A3

.segment        "HULL_DATA"                                             ;$D0A5..
;===============================================================================
.proc   hull_cougar                                                     ;$ED2B
        ;-----------------------------------------------------------------------
        .byte                  $03, $24, $13, $86, $ea                  ;$ED2B
        .byte   $69, $00, $2a, $72, $19, $00, $00, $18                  ;$ED30
        .byte   $22, $fc, $28, $00, $00, $02, $34, $00
        .byte   $05, $43, $1f, $02, $44, $14, $00, $28                  ;$ED40
        .byte   $9f, $01, $22, $28, $00, $28, $bf, $01
        .byte   $55, $00, $0e, $28, $3e, $04, $55, $00                  ;$ED50
        .byte   $0e, $28, $7e, $12, $35, $14, $00, $28
        .byte   $1f, $23, $44, $28, $00, $28, $3f, $34                  ;$ED60
        .byte   $55, $24, $00, $38, $9f, $01, $11, $3c
        .byte   $00, $14, $bf, $01, $11, $24, $00, $38                  ;$ED70
        .byte   $1f, $34, $44, $3c, $00, $14, $3f, $34
        .byte   $44, $00, $07, $23, $12, $00, $44, $00                  ;$ED80
        .byte   $08, $19, $14, $00, $44, $0c, $02, $2d
        .byte   $94, $00, $00, $0c, $02, $2d, $14, $44                  ;$ED90
        .byte   $44, $0a, $06, $28, $b4, $55, $55, $0a
        .byte   $06, $28, $f4, $55, $55, $0a, $06, $28                  ;$EDA0
        .byte   $74, $55, $55, $0a, $06, $28, $34, $55
        .byte   $55, $1f, $02, $00, $04, $1f, $01, $04                  ;$EDB0
        .byte   $1c, $1f, $01, $1c, $20, $1f, $01, $20
        .byte   $08, $1e, $05, $08, $0c, $1e, $45, $0c                  ;$EDC0
        .byte   $18, $1e, $15, $08, $10, $1e, $35, $10
        .byte   $18, $1f, $34, $18, $28, $1f, $34, $28                  ;$EDD0
        .byte   $24, $1f, $34, $24, $14, $1f, $24, $14
        .byte   $00, $1b, $04, $00, $0c, $1b, $12, $04                  ;$EDE0
        .byte   $10, $1b, $23, $14, $10, $1a, $01, $04
        .byte   $08, $1a, $34, $14, $18, $14, $00, $30                  ;$EDF0
        .byte   $34, $12, $00, $34, $2c, $12, $44, $2c
        .byte   $38, $14, $44, $38, $30, $12, $55, $3c                  ;$EE00
        .byte   $40, $14, $55, $40, $48, $12, $55, $48
        .byte   $44, $14, $55, $44, $3c, $9f, $10, $2e                  ;$EE10
        .byte   $04, $df, $10, $2e, $04, $5f, $00, $1b
        .byte   $05, $5f, $10, $2e, $04, $1f, $10, $2e                  ;$EE20
        .byte   $04, $3e, $00, $00, $a0

.endproc