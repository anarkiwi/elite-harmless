; Elite C64 disassembly / Elite : Harmless, cc-by-nc-sa 2018-2019,
; see LICENSE.txt. "Elite" is copyright / trademark David Braben & Ian Bell,
; All Rights Reserved. <github.com/Kroc/elite-harmless>
;===============================================================================

; "code_init.asm" : contains intialisation code

.include        "c64.asm"

.zeropage

ZP_COPY_TO      := $18
ZP_COPY_FROM    := $1a

.segment        "CODE_INIT"

init:
;===============================================================================
.export init

        ; change the address of STOP key routine from $F6ED, to $FFED:
        ; the SCREEN routine which returns row/col count, i.e. does
        ; nothing of use -- this effectively disables the STOP key
        lda # $ff
        sta $0329

        ; disable interrupts:
        ; (we'll be configuring screen & sprites)
        sei
        
        ; switch the I/O area on:
        lda CPU_CONTROL         ; get the current processor port value
        and # %11111000         ; reset bottom 3 bits, top 5 unchanged 
        ora # MEM_IO_ONLY       ; switch I/O on, BASIC & KERNAL ROM off
        sta CPU_CONTROL

        lda CIA2_PORTA_DDR      ; read Port A ($DD00) data-direction register
        ora # %00000011         ; set bits 0/1 to R+W, all others read-only
        sta CIA2_PORTA_DDR

        ; set the VIC-II to get screen / sprite
        ; data from the zone $4000-$7FFF
.import ELITE_VIC_DD00:direct

        lda CIA2_PORTA          ; read the serial bus / VIC-II bank state
        and # %11111100         ; keep current value except bits 0-1 (VIC bank)
        ora # ELITE_VIC_DD00    ; set bits 0-1 to %10: bank 1, $4000..$8000
        sta CIA2_PORTA

        ; enable interrupts and non-maskable interrupts generated by the A/B
        ; system timers. the bottom two bits control CIA timers A & B, and
        ; writes to $DC0D control normal interrupts, and writes to $DD0D
        ; control non-maskable interrupts
        lda # CIA::TIMER_A | CIA::TIMER_B        ;=%00000011
        sta CIA1_INTERRUPT      ; interrupt control / status register
        sta CIA2_INTERRUPT      ; non-maskable interrupt register

        ; set up VIC-II memory:
        ; NOTE: during loading, the bitmap screen is not set at the same
        ;       location as it will be when the game begins?
        ;
        ; %1000xxxx = set text/colour screen to VIC+$2000,
        ;             colour map    @ $6000..$6400
        ; %xxxx000x = set character set to VIC+$0000
        ;             bitmap screen @ $4000..$6000
        ; %xxxxxxx1 = N/A! (but included in the original source)
        ;
.import ELITE_TXTSCR_D018:direct

        lda # ELITE_TXTSCR_D018 | %00000001
        sta VIC_MEMORY

        lda # BLACK
        sta VIC_BORDER          ; set border colour black
        lda # BLACK
        sta VIC_BACKGROUND      ; set background colour black

        ; set up the bitmap screen:
        ; - bit 0-2: vertical scroll offset (set to 3, why?)
        ; - bit   3: 25 rows
        ; - bit   4: screen on
        ; - bit   5: bitmap mode on
        ; - bit 6-7: extended mode off / raster interrupt off
        lda # 3 | screen_ctl1::rows \
                | screen_ctl1::display \
                | screen_ctl1::bitmap
        sta VIC_SCREEN_CTL1

        ; further screen setup:
        ; - bit 0-2: horizontal scroll (0)
        ; - bit   3: 38 columns (borders inset)
        ; - bit   4: multi-color mode off
        lda # %11000000         ; undocumented bits? default?
        sta VIC_SCREEN_CTL2

        ; disable all sprites
        lda # %00000000
        sta VIC_SPRITE_ENABLE

        ; set sprite 2 colour to brown
        lda # BROWN
        sta VIC_SPRITE2_COLOR
        ; set sprite 3 colour to medium-grey
        lda # GREY
        sta VIC_SPRITE3_COLOR
        ; set sprite 4 colour to blue
        lda # BLUE
        sta VIC_SPRITE4_COLOR
        ; set sprite 5 colour to white
        lda # WHITE
        sta VIC_SPRITE5_COLOR
        ; set sprite 6 colour to green
        lda # GREEN
        sta VIC_SPRITE6_COLOR
        ; set sprite 7 colour to brown
        lda # BROWN
        sta VIC_SPRITE7_COLOR

        ; set sprite multi-colour 1 to orange
        lda # ORANGE
        sta VIC_SPRITE_EXTRA1
        ; set sprite multi-colour 2 to yellow
        lda # YELLOW
        sta VIC_SPRITE_EXTRA2

        ; set all sprites to single-colour
        ; (the Trumbles™ are actually multi-colour,
        ;  so this must be changed at some point)
        lda # %00000000
        sta VIC_SPRITE_MULTICOLOR

        ; set all sprites to double-width, double-height
        lda # %11111111
        sta VIC_SPRITE_DBLHEIGHT
        sta VIC_SPRITE_DBLWIDTH

        ; set sprites' X 8th bit to 0;
        ; i.e all X-positions are < 256
        lda # $00
        sta VIC_SPRITES_X

        ; roughly centre sprite 0 on screen
        ; (crosshair?)
        ldx # 161
        ldy # 101
        stx VIC_SPRITE0_X
        sty VIC_SPRITE0_Y
        
        ; setup (but don't display) the trumbles
        lda # 18
        ldy # 12
        sta VIC_SPRITE1_X
        sty VIC_SPRITE1_Y
        asl                     ; double x-position (=36)
        sta VIC_SPRITE2_X
        sty VIC_SPRITE2_Y
        asl                     ; double x-position (=72)
        sta VIC_SPRITE3_X
        sty VIC_SPRITE3_Y
        asl                     ; double x-position (=144)
        sta VIC_SPRITE4_X
        sty VIC_SPRITE4_Y
        lda # 14
        sta VIC_SPRITE5_X
        sty VIC_SPRITE5_Y
        asl                     ; double x-position (=28)
        sta VIC_SPRITE6_X
        sty VIC_SPRITE6_Y
        asl                     ; double x-position (=56)
        sta VIC_SPRITE7_X
        sty VIC_SPRITE7_Y

        ; set sprite priority: only sprite 1 is behind screen
        lda # %0000010
        sta VIC_SPRITE_PRIORITY

        ; erase $6000-$6800 (the two colour maps)
        ;-----------------------------------------------------------------------

        lda # $00
        sta ZP_COPY_TO+0
        tay 
        ldx #> $6000

        lda # $10               ;(white on black?)
_76e8:  stx ZP_COPY_TO+1
:       sta [ZP_COPY_TO], y
        iny 
        bne :-
        ldx ZP_COPY_TO+1
        inx 
        cpx #> $6800
        bne _76e8

        ; copy 279 bytes of data to $66D0-$67E7
        ;-----------------------------------------------------------------------

.import __HUD_SCRCOLOR_LOAD__   ;=$783A

        lda #< $66d0
        sta ZP_COPY_TO+0
        lda #> $66d0
        sta ZP_COPY_TO+1
        lda #< __HUD_SCRCOLOR_LOAD__
        sta ZP_COPY_FROM+0
        lda #> __HUD_SCRCOLOR_LOAD__
        jsr _7827

        ; set the screen-colours for the menu-screen:
        ; (high-resolution section only, no HUD)
        ;-----------------------------------------------------------------------

.import ELITE_MENUSCR_COLOR_ADDR

        lda #< ELITE_MENUSCR_COLOR_ADDR
        sta ZP_COPY_TO+0
        lda #> ELITE_MENUSCR_COLOR_ADDR
        sta ZP_COPY_TO+1

        ldx # 25                ; 25-rows

        ; colour the borders yellow down the sides of the view-port:

        ; yellow fore / black back colour
_7711:  lda # .color_nybbles( YELLOW, BLACK )
        ldy # 36                ; set the colour on column 37
        sta [ZP_COPY_TO], y
        ldy # 3                 ; set the colour on column 4
        sta [ZP_COPY_TO], y
        dey

        ; colour the area outside the viewport black
        lda # .color_nybbles( BLACK, BLACK )
:       sta [ZP_COPY_TO], y     ; set columns 2, 1 & 0 to black
        dey 
        bpl :-

        ldy # 37                ; begin at column 38
        sta [ZP_COPY_TO], y     ; set column 38 black
        iny 
        sta [ZP_COPY_TO], y     ; and column 39
        iny 
        sta [ZP_COPY_TO], y     ; and column 40
    
        ; move to the next row
        ; (add 40 columns)
        lda ZP_COPY_TO+0
        clc 
        adc # 40
        sta ZP_COPY_TO+0
        bcc :+
        inc ZP_COPY_TO+1
:       dex                     ; repeat for 25 rows
        bne _7711

        ; set the screen-colours for the high-resolution
        ; bitmap portion of the main flight-screen
        ;-----------------------------------------------------------------------

.import ELITE_MAINSCR_COLOR_ADDR

        lda #< ELITE_MAINSCR_COLOR_ADDR
        sta ZP_COPY_TO+0
        lda #> ELITE_MAINSCR_COLOR_ADDR
        sta ZP_COPY_TO+1

        ldx # $12               ; 18 rows

_7745:  lda # .color_nybbles( YELLOW, BLACK )
        ldy # 36
        sta [ZP_COPY_TO], y
        ldy # 3
        sta [ZP_COPY_TO], y
        dey 
        lda # $00

_7752:  sta [ZP_COPY_TO], y
        dey 
        bpl _7752
        ldy # $25
        sta [ZP_COPY_TO], y
        iny 
        sta [ZP_COPY_TO], y
        iny 
        sta [ZP_COPY_TO], y
        lda ZP_COPY_TO+0
        clc 
        adc # 40
        sta ZP_COPY_TO+0
        bcc _776c
        inc ZP_COPY_TO+1
_776c:
        dex 
        bne _7745

        ; set yellow colour across the bottom row of the menu-screen
        ; write $70 from $63E4 to $63C4
        lda # .color_nybbles( YELLOW, BLACK )
        ldy # $1f               ; we'll write 31 chars (colour-cells)
:       sta ELITE_MENUSCR_COLOR_ADDR + (24 * 40) + 4, y
        dey 
        bpl :-

        ; set screen colours for the mult-colour bitmap
        ;-----------------------------------------------------------------------

        ; set $D800-$DC00 (colour RAM) to black
        lda # BLACK
        sta ZP_COPY_TO+0
        tay 
        ldx #> $d800
        stx ZP_COPY_TO+1

        ldx # $04               ; 4 x 256 = 1'024 bytes
_7784:  sta [ZP_COPY_TO], y
        iny 
        bne _7784
        inc ZP_COPY_TO+1
        dex 
        bne _7784

        ; colour the HUD:
        ;-----------------------------------------------------------------------
        ; copy 279? bytes from $795A to $DADA
        ; multi-colour bitmap colour nybbles

.import __HUD_COLORRAM_LOAD__

        lda #< $dad0
        sta ZP_COPY_TO+0
        lda #> $dad0
        sta ZP_COPY_TO+1
        lda #< __HUD_COLORRAM_LOAD__
        sta ZP_COPY_FROM+0
        lda #> __HUD_COLORRAM_LOAD__
        jsr _7827

        ; write $07 to $D802-$D824

        ldy # $22
        lda # $07
_77a3:  sta $d802, y
        dey 
        bne _77a3

        ; sprite indicies
        lda # $a0
        sta $63f8
        sta $67f8
        lda # $a4
        sta $63f9
        sta $67f9
        lda # $a5
        sta $63fa
        sta $67fa
        sta $63fc
        sta $67fc
        sta $63fe
        sta $67fe
        lda # $a6
        sta $63fb
        sta $67fb
        sta $63fd
        sta $67fd
        sta $63ff
        sta $67ff

        ; clear the bitmap screen:
        ;-----------------------------------------------------------------------
        ; erase $4000-$6000

.import ELITE_BITMAP_ADDR

        lda # $00
        sta ZP_COPY_TO+0
        tay 
        ldx #> ELITE_BITMAP_ADDR

_76d8:  stx ZP_COPY_TO+1
:       sta [ZP_COPY_TO], y
        iny 
        bne :-
        ldx ZP_COPY_TO+1
        inx 
        cpx # $60
        bne _76d8

        ;-----------------------------------------------------------------------

        lda CPU_CONTROL         ; get processor port state
        and # %11111000         ; retain everything except bits 0-2 
        ora # MEM_IO_KERNAL     ; I/O & KERNAL ON, BASIC OFF
        sta CPU_CONTROL

        cli 

        ;-----------------------------------------------------------------------

.import init_mem
.import _8863
        
        ; NOTE: calling `init_mem` clears variable storage from $0400..$0700
        ; *THIS VERY CODE IS WITHIN THAT REGION* -- ergo, we cannot return
        ; from a subroutine here but will still need to send execution to
        ; `_88b3` after clearing variable storage. we do this by pushing the
        ; address we want to jump to (`_88b3`) on to the stack and then jump
        ; (*NOT* `jsr`) to the subroutine. when it hits `rts`, execution will
        ; move to the address we inserted into the stack!
        ;
        lda #> (_8863 - 1)
        pha 
        lda #< (_8863 - 1)
        pha 

        jmp init_mem

.proc   copy_bytes
        ;=======================================================================
        ; copies bytes from one address to another in 256 byte blocks
        ;
        ; $18/$19 = pointer to address to copy to
        ;     $1a = low-byte of address to copy from
        ;       A = high-byte of address to copy from (gets placed into $1b)
        ;       X = number of 265-byte blocks to copy

        sta ZP_COPY_FROM+1
        ldy # $00

:       lda [ZP_COPY_FROM], y
        sta [ZP_COPY_TO], y
        dey 
        bne :-
        inc ZP_COPY_FROM+1
        inc ZP_COPY_TO+1
        dex 
        bne :-
        rts

.endproc

.proc   _7827
        ;=======================================================================
        ; copy 256-bytes using current parameters
        ldx # $01
        jsr copy_bytes

        ; copy a further 22 bytes
        ldy # $17
        ldx # $01
:       lda [ZP_COPY_FROM], y
        sta [ZP_COPY_TO], y
        dey 
        bpl :-
        ldx # $00
        rts

.endproc