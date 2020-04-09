; Elite C64 disassembly / Elite : Harmless, cc-by-nc-sa 2018-2020,
; see LICENSE.txt. "Elite" is copyright / trademark David Braben & Ian Bell,
; All Rights Reserved. <github.com/Kroc/elite-harmless>
;===============================================================================
; $13: krait
;-------------------------------------------------------------------------------
hull_index           .set hull_index + 1
hull_krait_index       := hull_index

.segment        "HULL_TABLE"                                            ;$D000..
;===============================================================================
        .addr   hull_krait                                              ;$D024/5

.segment        "HULL_TYPE"                                             ;$D042..
;===============================================================================
        .byte   $8c                                                     ;$D054

.segment        "HULL_KILL_LO"                                          ;$D063..
;===============================================================================
        .byte   $55                                                     ;$D075

.segment        "HULL_KILL_HI"                                          ;$D084..
;===============================================================================
        .byte   $00                                                     ;$D096

.segment        "HULL_DATA"                                             ;$D0A5..
;===============================================================================
.proc   hull_krait                                                      ;$E0BB
        ;-----------------------------------------------------------------------
        .byte   $01, $10, $0e, $7a, $ce                                 ;$E0BB
        .byte   $59, $00, $12, $66, $15, $64, $00, $18                  ;$E0C0
        .byte   $14, $50, $1e, $00, $00, $01, $10, $00
        .byte   $00, $60, $1f, $01, $23, $00, $12, $30                  ;$E0D0
        .byte   $3f, $03, $45, $00, $12, $30, $7f, $12
        .byte   $45, $5a, $00, $03, $3f, $01, $44, $5a                  ;$E0E0
        .byte   $00, $03, $bf, $23, $55, $5a, $00, $57
        .byte   $1e, $01, $11, $5a, $00, $57, $9e, $23                  ;$E0F0
        .byte   $33, $00, $05, $35, $09, $00, $33, $00
        .byte   $07, $26, $06, $00, $33, $12, $07, $13                  ;$E100
        .byte   $89, $33, $33, $12, $07, $13, $09, $00
        .byte   $00, $12, $0b, $27, $28, $44, $44, $12                  ;$E110
        .byte   $0b, $27, $68, $44, $44, $24, $00, $1e
        .byte   $28, $44, $44, $12, $0b, $27, $a8, $55                  ;$E120
        .byte   $55, $12, $0b, $27, $e8, $55, $55, $24
        .byte   $00, $1e, $a8, $55, $55, $1f, $03, $00                  ;$E130
        .byte   $04, $1f, $12, $00, $08, $1f, $01, $00
        .byte   $0c, $1f, $23, $00, $10, $1f, $35, $04                  ;$E140
        .byte   $10, $1f, $25, $10, $08, $1f, $14, $08
        .byte   $0c, $1f, $04, $0c, $04, $1e, $01, $0c                  ;$E150
        .byte   $14, $1e, $23, $10, $18, $08, $45, $04
        .byte   $08, $09, $00, $1c, $28, $06, $00, $20                  ;$E160
        .byte   $28, $09, $33, $1c, $24, $06, $33, $20
        .byte   $24, $08, $44, $2c, $34, $08, $44, $34                  ;$E170
        .byte   $30, $07, $44, $30, $2c, $07, $55, $38
        .byte   $3c, $08, $55, $3c, $40, $08, $55, $40                  ;$E180
        .byte   $38, $1f, $03, $18, $03, $5f, $03, $18
        .byte   $03, $df, $03, $18, $03, $9f, $03, $18                  ;$E190
        .byte   $03, $3f, $26, $00, $4d, $bf, $26, $00
        .byte   $4d                                                     ;$E1A0

.endproc