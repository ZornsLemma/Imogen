; Constants
first_level_letter   = 65
last_level_letter    = 81

; Memory locations
l001d                       = $1d
l0030                       = $30
l0031                       = $31
l003a                       = $3a
l003b                       = $3b
l003c                       = $3c
l003d                       = $3d
l003e                       = $3e
l0040                       = $40
l0041                       = $41
l0042                       = $42
l0051                       = $51
l0052                       = $52
l0070                       = $70
l0950                       = $0950
l0954                       = $0954
l0966                       = $0966
l097c                       = $097c
l0980                       = $0980
l0992                       = $0992
l09a8                       = $09a8
l09aa                       = $09aa
l09ab                       = $09ab
l09ac                       = $09ac
l09be                       = $09be
l09ff                       = $09ff
l0a00                       = $0a00
l0a01                       = $0a01
l0a02                       = $0a02
l0a03                       = $0a03
l0a04                       = $0a04
l0a6f                       = $0a6f
l0a70                       = $0a70
l0a71                       = $0a71
l0a72                       = $0a72
l0a73                       = $0a73
string_input_buffer         = $0a90
l1103                       = $1103
l1140                       = $1140
l12bb                       = $12bb
l12da                       = $12da
l132b                       = $132b
pending_toolbar_colour      = $175d
toolbar_colour              = $175e
pending_gameplay_area_colour = $175f
gameplay_area_colour        = $1760
use_colour_flag             = $1765
l1988                       = $1988
l1a10                       = $1a10
l1aba                       = $1aba
l1abb                       = $1abb
l1b90                       = $1b90
l1db9                       = $1db9
l1e44                       = $1e44
l1ebb                       = $1ebb
l1f4c                       = $1f4c
l1f57                       = $1f57
l1f5d                       = $1f5d
l1f6d                       = $1f6d
l23a9                       = $23a9
l2433                       = $2433
l24d0                       = $24d0
l24d1                       = $24d1
l2551                       = $2551
l2894                       = $2894
l28e2                       = $28e2
l2bbd                       = $2bbd
l2eb6                       = $2eb6
l2ee9                       = $2ee9
l2eee                       = $2eee
l2ef3                       = $2ef3
l38ac                       = $38ac
l38ae                       = $38ae
l38c2                       = $38c2
l38d8                       = $38d8
l38f6                       = $38f6
l395e                       = $395e
l396f                       = $396f
l3970                       = $3970
auxcode                     = $53c0
check_password              = $53c0

    * = $3ad5

level_data
pydis_start
    !byte $d1,   9                                                    ; 3ad5: d1 09       ..
level_init_after_load_handler_ptr
second_level_handler_ptr = level_init_after_load_handler_ptr+2
third_level_handler_ptr = level_init_after_load_handler_ptr+4
    !word level_init_after_load_handler                               ; 3ad7: f2 3a       .:
    !word          second_level_handler                               ; 3ad9: 17 3b       .;
    !word           third_level_handler                               ; 3adb: e7 3a       .:
    !byte 0, 1                                                        ; 3add: 00 01       ..
    !word fourth_level_handler                                        ; 3adf: 27 3b       ';
    !byte $3d, $3d, $d7                                               ; 3ae1: 3d 3d d7    ==.
    !text "?MB"                                                       ; 3ae4: 3f 4d 42    ?MB

third_level_handler
    tya                                                               ; 3ae7: 98          .
    txa                                                               ; 3ae8: 8a          .
    !byte $93, $84, $9b, $83, $84, $89, $82, $8a, $c6                 ; 3ae9: 93 84 9b... ...

level_init_after_load_handler
    lda l0031                                                         ; 3af2: a5 31       .1
    cmp l0051                                                         ; 3af4: c5 51       .Q
    beq c3b0e                                                         ; 3af6: f0 16       ..
    lda l1103                                                         ; 3af8: ad 03 11    ...
    bpl c3b04                                                         ; 3afb: 10 07       ..
    lda #$d3                                                          ; 3afd: a9 d3       ..
    jsr l2bbd                                                         ; 3aff: 20 bd 2b     .+
    lda #$ff                                                          ; 3b02: a9 ff       ..
; $3b04 referenced 1 time by $3afb
c3b04
    lda l0a00                                                         ; 3b04: ad 00 0a    ...
    beq c3b0e                                                         ; 3b07: f0 05       ..
    lda #$d3                                                          ; 3b09: a9 d3       ..
    jsr l2bbd                                                         ; 3b0b: 20 bd 2b     .+
; $3b0e referenced 2 times by $3af6, $3b07
c3b0e
    lda #$86                                                          ; 3b0e: a9 86       ..
    sta l0040                                                         ; 3b10: 85 40       .@
    lda #$44 ; 'D'                                                    ; 3b12: a9 44       .D
    sta l0041                                                         ; 3b14: 85 41       .A
    rts                                                               ; 3b16: 60          `

second_level_handler
    jsr sub_c3be4                                                     ; 3b17: 20 e4 3b     .;
    jsr sub_c3dfc                                                     ; 3b1a: 20 fc 3d     .=
    jsr sub_c407f                                                     ; 3b1d: 20 7f 40     .@
    jsr sub_c3f02                                                     ; 3b20: 20 02 3f     .?
    jsr sub_c42f8                                                     ; 3b23: 20 f8 42     .B
    rts                                                               ; 3b26: 60          `

fourth_level_handler
    !byte $14, $16                                                    ; 3b27: 14 16       ..

some_code1
    ldx #0                                                            ; 3b29: a2 00       ..
    ldy #0                                                            ; 3b2b: a0 00       ..
    lda #$ff                                                          ; 3b2d: a9 ff       ..
    sta l003c                                                         ; 3b2f: 85 3c       .<
    lda #2                                                            ; 3b31: a9 02       ..
    sta l003d                                                         ; 3b33: 85 3d       .=
    jsr l1abb                                                         ; 3b35: 20 bb 1a     ..
    ldy #2                                                            ; 3b38: a0 02       ..
    lda #4                                                            ; 3b3a: a9 04       ..
    sta l003c                                                         ; 3b3c: 85 3c       .<
    dec l003d                                                         ; 3b3e: c6 3d       .=
    jsr l1abb                                                         ; 3b40: 20 bb 1a     ..
    iny                                                               ; 3b43: c8          .
    dec l003c                                                         ; 3b44: c6 3c       .<
    lda #$13                                                          ; 3b46: a9 13       ..
    sta l003d                                                         ; 3b48: 85 3d       .=
    jsr l1abb                                                         ; 3b4a: 20 bb 1a     ..
    ldy #$16                                                          ; 3b4d: a0 16       ..
    lda #$ff                                                          ; 3b4f: a9 ff       ..
    sta l003c                                                         ; 3b51: 85 3c       .<
    jsr l1abb                                                         ; 3b53: 20 bb 1a     ..
    ldx #$22 ; '"'                                                    ; 3b56: a2 22       ."
    ldy #7                                                            ; 3b58: a0 07       ..
    lda #6                                                            ; 3b5a: a9 06       ..
    sta l003c                                                         ; 3b5c: 85 3c       .<
    lda #2                                                            ; 3b5e: a9 02       ..
    sta l003d                                                         ; 3b60: 85 3d       .=
    jsr l1abb                                                         ; 3b62: 20 bb 1a     ..
    ldx #$25 ; '%'                                                    ; 3b65: a2 25       .%
    ldy #9                                                            ; 3b67: a0 09       ..
    lda #$0d                                                          ; 3b69: a9 0d       ..
    sta l003d                                                         ; 3b6b: 85 3d       .=
    jsr l1abb                                                         ; 3b6d: 20 bb 1a     ..
    ldx #$0e                                                          ; 3b70: a2 0e       ..
    ldy #$0b                                                          ; 3b72: a0 0b       ..
    lda #3                                                            ; 3b74: a9 03       ..
    sta l003c                                                         ; 3b76: 85 3c       .<
    lda #2                                                            ; 3b78: a9 02       ..
    sta l003d                                                         ; 3b7a: 85 3d       .=
    jsr l1abb                                                         ; 3b7c: 20 bb 1a     ..
    ldx #$18                                                          ; 3b7f: a2 18       ..
    jsr l1abb                                                         ; 3b81: 20 bb 1a     ..
    jsr l1b90                                                         ; 3b84: 20 90 1b     ..
    lda #3                                                            ; 3b87: a9 03       ..
    sta l003c                                                         ; 3b89: 85 3c       .<
    lda #2                                                            ; 3b8b: a9 02       ..
    sta l003d                                                         ; 3b8d: 85 3d       .=
    lda #$de                                                          ; 3b8f: a9 de       ..
    ldx #3                                                            ; 3b91: a2 03       ..
    ldy #$14                                                          ; 3b93: a0 14       ..
    jsr l1f57                                                         ; 3b95: 20 57 1f     W.
    ldx #6                                                            ; 3b98: a2 06       ..
    jsr l1f57                                                         ; 3b9a: 20 57 1f     W.
    ldx #9                                                            ; 3b9d: a2 09       ..
    jsr l1f57                                                         ; 3b9f: 20 57 1f     W.
    ldx #3                                                            ; 3ba2: a2 03       ..
    ldy #$12                                                          ; 3ba4: a0 12       ..
    jsr l1f57                                                         ; 3ba6: 20 57 1f     W.
    ldx #6                                                            ; 3ba9: a2 06       ..
    jsr l1f57                                                         ; 3bab: 20 57 1f     W.
    ldx #$0a                                                          ; 3bae: a2 0a       ..
    ldy #2                                                            ; 3bb0: a0 02       ..
    lda #$0a                                                          ; 3bb2: a9 0a       ..
    jsr l1db9                                                         ; 3bb4: 20 b9 1d     ..
    ldx #$1e                                                          ; 3bb7: a2 1e       ..
    jsr l1db9                                                         ; 3bb9: 20 b9 1d     ..
    ldx #$14                                                          ; 3bbc: a2 14       ..
    lda #$10                                                          ; 3bbe: a9 10       ..
    jsr l1db9                                                         ; 3bc0: 20 b9 1d     ..
    ldx #$0f                                                          ; 3bc3: a2 0f       ..
    ldy #$0d                                                          ; 3bc5: a0 0d       ..
    lda #5                                                            ; 3bc7: a9 05       ..
    jsr l1db9                                                         ; 3bc9: 20 b9 1d     ..
    ldx #$19                                                          ; 3bcc: a2 19       ..
    jsr l1db9                                                         ; 3bce: 20 b9 1d     ..
    jsr l12bb                                                         ; 3bd1: 20 bb 12     ..
; $3bd4 referenced 1 time by $3bdb
loop_c3bd4
    jsr l12da                                                         ; 3bd4: 20 da 12     ..
    sta l0070                                                         ; 3bd7: 85 70       .p
    and #4                                                            ; 3bd9: 29 04       ).
    beq loop_c3bd4                                                    ; 3bdb: f0 f7       ..
    ldx #1                                                            ; 3bdd: a2 01       ..
    ldy l0031                                                         ; 3bdf: a4 31       .1
    jsr l1140                                                         ; 3be1: 20 40 11     @.
; $3be4 referenced 1 time by $3b17
sub_c3be4
    lda l132b                                                         ; 3be4: ad 2b 13    .+.
    bne c3bec                                                         ; 3be7: d0 03       ..
    jmp c3c77                                                         ; 3be9: 4c 77 3c    Lw<

; $3bec referenced 1 time by $3be7
c3bec
    lda l0031                                                         ; 3bec: a5 31       .1
    cmp l0051                                                         ; 3bee: c5 51       .Q
    beq c3bf7                                                         ; 3bf0: f0 05       ..
    lda #0                                                            ; 3bf2: a9 00       ..
    sta l0a6f                                                         ; 3bf4: 8d 6f 0a    .o.
; $3bf7 referenced 1 time by $3bf0
c3bf7
    lda l0030                                                         ; 3bf7: a5 30       .0
    cmp #0                                                            ; 3bf9: c9 00       ..
    bne c3c74                                                         ; 3bfb: d0 77       .w
    ldx #$60 ; '`'                                                    ; 3bfd: a2 60       .`
    ldy #$44 ; 'D'                                                    ; 3bff: a0 44       .D
    jsr l395e                                                         ; 3c01: 20 5e 39     ^9
    lda #2                                                            ; 3c04: a9 02       ..
    sta l003c                                                         ; 3c06: 85 3c       .<
    sta l003d                                                         ; 3c08: 85 3d       .=
    lda #3                                                            ; 3c0a: a9 03       ..
    sta l003e                                                         ; 3c0c: 85 3e       .>
    ldx #$10                                                          ; 3c0e: a2 10       ..
    ldy #$0b                                                          ; 3c10: a0 0b       ..
    lda #$fe                                                          ; 3c12: a9 fe       ..
    sta l003b                                                         ; 3c14: 85 3b       .;
    lda #$c8                                                          ; 3c16: a9 c8       ..
    jsr l1f4c                                                         ; 3c18: 20 4c 1f     L.
    dex                                                               ; 3c1b: ca          .
    dey                                                               ; 3c1c: 88          .
    dey                                                               ; 3c1d: 88          .
    jsr l1e44                                                         ; 3c1e: 20 44 1e     D.
    ldx #2                                                            ; 3c21: a2 02       ..
    jsr l1f6d                                                         ; 3c23: 20 6d 1f     m.
    lda #$cd                                                          ; 3c26: a9 cd       ..
    sta l38ac,x                                                       ; 3c28: 9d ac 38    ..8
    lda #$c0                                                          ; 3c2b: a9 c0       ..
    sta l38c2,x                                                       ; 3c2d: 9d c2 38    ..8
    lda #$ff                                                          ; 3c30: a9 ff       ..
    sta l001d                                                         ; 3c32: 85 1d       ..
    ldx #$19                                                          ; 3c34: a2 19       ..
    ldy #$0b                                                          ; 3c36: a0 0b       ..
    lda #$fe                                                          ; 3c38: a9 fe       ..
    sta l003b                                                         ; 3c3a: 85 3b       .;
    lda #$c8                                                          ; 3c3c: a9 c8       ..
    jsr l1f4c                                                         ; 3c3e: 20 4c 1f     L.
    dex                                                               ; 3c41: ca          .
    dey                                                               ; 3c42: 88          .
    dey                                                               ; 3c43: 88          .
    jsr l1e44                                                         ; 3c44: 20 44 1e     D.
    ldx #3                                                            ; 3c47: a2 03       ..
    jsr l1f6d                                                         ; 3c49: 20 6d 1f     m.
    lda #$ff                                                          ; 3c4c: a9 ff       ..
    sta l09be,x                                                       ; 3c4e: 9d be 09    ...
    lda #$ce                                                          ; 3c51: a9 ce       ..
    sta l38ac,x                                                       ; 3c53: 9d ac 38    ..8
    lda #$c0                                                          ; 3c56: a9 c0       ..
    sta l38c2,x                                                       ; 3c58: 9d c2 38    ..8
    ldx #4                                                            ; 3c5b: a2 04       ..
    lda #0                                                            ; 3c5d: a9 00       ..
    sta l0966,x                                                       ; 3c5f: 9d 66 09    .f.
    sta l0992,x                                                       ; 3c62: 9d 92 09    ...
    lda #1                                                            ; 3c65: a9 01       ..
    sta l09be,x                                                       ; 3c67: 9d be 09    ...
    lda #$cc                                                          ; 3c6a: a9 cc       ..
    sta l38ac,x                                                       ; 3c6c: 9d ac 38    ..8
    lda #$40 ; '@'                                                    ; 3c6f: a9 40       .@
    sta l38c2,x                                                       ; 3c71: 9d c2 38    ..8
; $3c74 referenced 1 time by $3bfb
c3c74
    jmp c3ca8                                                         ; 3c74: 4c a8 3c    L.<

; $3c77 referenced 1 time by $3be9
c3c77
    ldy l0a6f                                                         ; 3c77: ac 6f 0a    .o.
    iny                                                               ; 3c7a: c8          .
    cpy #$1e                                                          ; 3c7b: c0 1e       ..
    bcc c3c81                                                         ; 3c7d: 90 02       ..
    ldy #0                                                            ; 3c7f: a0 00       ..
; $3c81 referenced 1 time by $3c7d
c3c81
    sty l0a6f                                                         ; 3c81: 8c 6f 0a    .o.
    lda l0030                                                         ; 3c84: a5 30       .0
    cmp #0                                                            ; 3c86: c9 00       ..
    bne c3ca8                                                         ; 3c88: d0 1e       ..
    tya                                                               ; 3c8a: 98          .
    beq c3c91                                                         ; 3c8b: f0 04       ..
    cpy #$0f                                                          ; 3c8d: c0 0f       ..
    bne c3ca8                                                         ; 3c8f: d0 17       ..
; $3c91 referenced 1 time by $3c8b
c3c91
    lda #0                                                            ; 3c91: a9 00       ..
    ldx #$7e ; '~'                                                    ; 3c93: a2 7e       .~
    ldy #$44 ; 'D'                                                    ; 3c95: a0 44       .D
    jsr l38f6                                                         ; 3c97: 20 f6 38     .8
    ldx #$76 ; 'v'                                                    ; 3c9a: a2 76       .v
    ldy #$44 ; 'D'                                                    ; 3c9c: a0 44       .D
    jsr l38f6                                                         ; 3c9e: 20 f6 38     .8
    ldx #$6e ; 'n'                                                    ; 3ca1: a2 6e       .n
    ldy #$44 ; 'D'                                                    ; 3ca3: a0 44       .D
    jsr l38f6                                                         ; 3ca5: 20 f6 38     .8
; $3ca8 referenced 3 times by $3c74, $3c88, $3c8f
c3ca8
    lda l0030                                                         ; 3ca8: a5 30       .0
    cmp #0                                                            ; 3caa: c9 00       ..
    bne c3d20                                                         ; 3cac: d0 72       .r
    lda l0a6f                                                         ; 3cae: ad 6f 0a    .o.
    cmp #8                                                            ; 3cb1: c9 08       ..
    bcs c3cb9                                                         ; 3cb3: b0 04       ..
    ldy #0                                                            ; 3cb5: a0 00       ..
    beq c3cc3                                                         ; 3cb7: f0 0a       ..
; $3cb9 referenced 1 time by $3cb3
c3cb9
    cmp #$0f                                                          ; 3cb9: c9 0f       ..
    bcs c3cd9                                                         ; 3cbb: b0 1c       ..
    sec                                                               ; 3cbd: 38          8
    sbc #8                                                            ; 3cbe: e9 08       ..
    asl                                                               ; 3cc0: 0a          .
    asl                                                               ; 3cc1: 0a          .
    tay                                                               ; 3cc2: a8          .
; $3cc3 referenced 1 time by $3cb7
c3cc3
    lda some_data1,y                                                  ; 3cc3: b9 21 3d    .!=
    sta l09aa                                                         ; 3cc6: 8d aa 09    ...
    iny                                                               ; 3cc9: c8          .
    lda some_data1,y                                                  ; 3cca: b9 21 3d    .!=
    sta l09ab                                                         ; 3ccd: 8d ab 09    ...
    lda #$88                                                          ; 3cd0: a9 88       ..
    clc                                                               ; 3cd2: 18          .
    iny                                                               ; 3cd3: c8          .
    adc some_data1,y                                                  ; 3cd4: 79 21 3d    y!=
    bne c3cfb                                                         ; 3cd7: d0 22       ."
; $3cd9 referenced 1 time by $3cbb
c3cd9
    cmp #$17                                                          ; 3cd9: c9 17       ..
    bcs c3ce1                                                         ; 3cdb: b0 04       ..
    ldy #0                                                            ; 3cdd: a0 00       ..
    beq c3ce7                                                         ; 3cdf: f0 06       ..
; $3ce1 referenced 1 time by $3cdb
c3ce1
    sec                                                               ; 3ce1: 38          8
    sbc #$17                                                          ; 3ce2: e9 17       ..
    asl                                                               ; 3ce4: 0a          .
    asl                                                               ; 3ce5: 0a          .
    tay                                                               ; 3ce6: a8          .
; $3ce7 referenced 1 time by $3cdf
c3ce7
    lda some_data1,y                                                  ; 3ce7: b9 21 3d    .!=
    sta l09ab                                                         ; 3cea: 8d ab 09    ...
    iny                                                               ; 3ced: c8          .
    lda some_data1,y                                                  ; 3cee: b9 21 3d    .!=
    sta l09aa                                                         ; 3cf1: 8d aa 09    ...
    lda #$c0                                                          ; 3cf4: a9 c0       ..
    sec                                                               ; 3cf6: 38          8
    iny                                                               ; 3cf7: c8          .
    sbc some_data1,y                                                  ; 3cf8: f9 21 3d    .!=
; $3cfb referenced 1 time by $3cd7
c3cfb
    sta l0954                                                         ; 3cfb: 8d 54 09    .T.
    lda #$53 ; 'S'                                                    ; 3cfe: a9 53       .S
    sec                                                               ; 3d00: 38          8
    iny                                                               ; 3d01: c8          .
    sbc some_data1,y                                                  ; 3d02: f9 21 3d    .!=
    sta l0980                                                         ; 3d05: 8d 80 09    ...
    lda #$cb                                                          ; 3d08: a9 cb       ..
    sta l09ac                                                         ; 3d0a: 8d ac 09    ...
    lda l132b                                                         ; 3d0d: ad 2b 13    .+.
    bne c3d20                                                         ; 3d10: d0 0e       ..
    ldx #0                                                            ; 3d12: a2 00       ..
    ldy #4                                                            ; 3d14: a0 04       ..
    jsr l28e2                                                         ; 3d16: 20 e2 28     .(
    beq c3d20                                                         ; 3d19: f0 05       ..
    lda #$80                                                          ; 3d1b: a9 80       ..
    sta l2433                                                         ; 3d1d: 8d 33 24    .3$
; $3d20 referenced 3 times by $3cac, $3d10, $3d19
c3d20
    rts                                                               ; 3d20: 60          `

; $3d21 referenced 7 times by $3cc3, $3cca, $3cd4, $3ce7, $3cee, $3cf8, $3d02
some_data1
    !byte $d4, $c9,   0,   0, $ca, $c9,   8,   6, $ca, $c9, $10, $0a  ; 3d21: d4 c9 00... ...
    !byte $ca, $d5, $18, $0c, $d5, $ca, $20, $0c, $c9, $ca, $28, $0a  ; 3d2d: ca d5 18... ...
    !byte $c9, $ca, $30,   6,   9,   7, $a2,   0, $a0,   0, $a9, $ff  ; 3d39: c9 ca 30... ..0
    !byte $85, $3c, $a9,   2, $85, $3d, $20, $bb, $1a, $a0,   7, $a9  ; 3d45: 85 3c a9... .<.
    !byte $11, $85, $3c, $20, $bb, $1a, $a2, $17, $20, $bb, $1a, $a2  ; 3d51: 11 85 3c... ..<
    !byte   0, $a0, $16, $20, $bb, $1a, $a2, $17, $20, $bb, $1a, $a2  ; 3d5d: 00 a0 16... ...
    !byte   0, $a0,   9, $a9,   4, $85, $3c, $c6, $3d, $20, $bb, $1a  ; 3d69: 00 a0 09... ...
    !byte $a2, $0d, $20, $bb, $1a, $a2, $17, $20, $bb, $1a, $a2, $24  ; 3d75: a2 0d 20... ..
    !byte $20, $bb, $1a, $a2,   0, $c8, $c6, $3c, $a9, $0c, $85, $3d  ; 3d81: 20 bb 1a...  ..
    !byte $20, $bb, $1a, $a2, $0e, $20, $bb, $1a, $a2, $17, $20, $bb  ; 3d8d: 20 bb 1a...  ..
    !byte $1a, $a2, $25, $a9,   3, $85, $3d, $20, $bb, $1a, $a0, $12  ; 3d99: 1a a2 25... ..%
    !byte $e6, $3d, $20, $bb, $1a, $20, $90, $1b, $a9,   3, $85, $3c  ; 3da5: e6 3d 20... .=
    !byte $a9,   2, $85, $3d, $a9, $de, $a2, $1a, $a0, $14, $20, $57  ; 3db1: a9 02 85... ...
    !byte $1f, $a2                                                    ; 3dbd: 1f a2       ..
    !text '"', " W"                                                   ; 3dbf: 22 20 57    " W
    !byte $1f, $a0, $12, $20, $57, $1f, $a2,   7, $a0, $14, $20, $57  ; 3dc2: 1f a0 12... ...
    !byte $1f, $20, $bb, $12, $20, $da, $12, $85, $70, $29,   1, $f0  ; 3dce: 1f 20 bb... . .
    !byte   7, $a2,   0, $a4                                          ; 3dda: 07 a2 00... ...
    !text "1L@"                                                       ; 3dde: 31 4c 40    1L@
    !byte $11, $a5, $70, $29,   2, $f0,   7, $a2,   2, $a4            ; 3de1: 11 a5 70... ..p
    !text "1L@"                                                       ; 3deb: 31 4c 40    1L@
    !byte $11, $a5, $70, $29,   4, $f0, $dd, $a2,   3, $a4            ; 3dee: 11 a5 70... ..p
    !text "1L@"                                                       ; 3df8: 31 4c 40    1L@
    !byte $11                                                         ; 3dfb: 11          .

; $3dfc referenced 1 time by $3b1a
sub_c3dfc
    lda l132b                                                         ; 3dfc: ad 2b 13    .+.
    beq c3e6c                                                         ; 3dff: f0 6b       .k
    lda l0051                                                         ; 3e01: a5 51       .Q
    cmp l0031                                                         ; 3e03: c5 31       .1
    beq c3e11                                                         ; 3e05: f0 0a       ..
    lda l09ff                                                         ; 3e07: ad ff 09    ...
    beq c3e11                                                         ; 3e0a: f0 05       ..
    lda #$ff                                                          ; 3e0c: a9 ff       ..
    sta l09ff                                                         ; 3e0e: 8d ff 09    ...
; $3e11 referenced 2 times by $3e05, $3e0a
c3e11
    lda l0030                                                         ; 3e11: a5 30       .0
    cmp #1                                                            ; 3e13: c9 01       ..
    bne c3e69                                                         ; 3e15: d0 52       .R
    ldx #$2c ; ','                                                    ; 3e17: a2 2c       .,
    ldy #$44 ; 'D'                                                    ; 3e19: a0 44       .D
    jsr l395e                                                         ; 3e1b: 20 5e 39     ^9
    ldx #$11                                                          ; 3e1e: a2 11       ..
    ldy #7                                                            ; 3e20: a0 07       ..
    lda #2                                                            ; 3e22: a9 02       ..
    jsr l1f5d                                                         ; 3e24: 20 5d 1f     ].
    tax                                                               ; 3e27: aa          .
    lda #1                                                            ; 3e28: a9 01       ..
    sta l09be,x                                                       ; 3e2a: 9d be 09    ...
    ldx #$17                                                          ; 3e2d: a2 17       ..
    lda #3                                                            ; 3e2f: a9 03       ..
    jsr l1f5d                                                         ; 3e31: 20 5d 1f     ].
    tax                                                               ; 3e34: aa          .
    lda #$ff                                                          ; 3e35: a9 ff       ..
    sta l09be,x                                                       ; 3e37: 9d be 09    ...
    lda #3                                                            ; 3e3a: a9 03       ..
    sta l003e                                                         ; 3e3c: 85 3e       .>
    lda l09ff                                                         ; 3e3e: ad ff 09    ...
    bne c3e55                                                         ; 3e41: d0 12       ..
    ldx #$11                                                          ; 3e43: a2 11       ..
    ldy #7                                                            ; 3e45: a0 07       ..
    lda #6                                                            ; 3e47: a9 06       ..
    sta l003c                                                         ; 3e49: 85 3c       .<
    lda #1                                                            ; 3e4b: a9 01       ..
    sta l003d                                                         ; 3e4d: 85 3d       .=
    jsr l1e44                                                         ; 3e4f: 20 44 1e     D.
    jmp c3e69                                                         ; 3e52: 4c 69 3e    Li>

; $3e55 referenced 1 time by $3e41
c3e55
    ldx #$11                                                          ; 3e55: a2 11       ..
    ldy #8                                                            ; 3e57: a0 08       ..
    lda #1                                                            ; 3e59: a9 01       ..
    sta l003c                                                         ; 3e5b: 85 3c       .<
    lda #2                                                            ; 3e5d: a9 02       ..
    sta l003d                                                         ; 3e5f: 85 3d       .=
    jsr l1e44                                                         ; 3e61: 20 44 1e     D.
    ldx #$16                                                          ; 3e64: a2 16       ..
    jsr l1e44                                                         ; 3e66: 20 44 1e     D.
; $3e69 referenced 2 times by $3e15, $3e52
c3e69
    jmp c3ed7                                                         ; 3e69: 4c d7 3e    L.>

; $3e6c referenced 1 time by $3dff
c3e6c
    ldy l09ff                                                         ; 3e6c: ac ff 09    ...
    bmi c3ed7                                                         ; 3e6f: 30 66       0f
    bne c3ec1                                                         ; 3e71: d0 4e       .N
    lda l0030                                                         ; 3e73: a5 30       .0
    cmp #1                                                            ; 3e75: c9 01       ..
    bne c3ed7                                                         ; 3e77: d0 5e       .^
    lda l0052                                                         ; 3e79: a5 52       .R
    beq c3ed7                                                         ; 3e7b: f0 5a       .Z
    lda l0966                                                         ; 3e7d: ad 66 09    .f.
    bne c3ed7                                                         ; 3e80: d0 55       .U
    lda l0950                                                         ; 3e82: ad 50 09    .P.
    cmp #$88                                                          ; 3e85: c9 88       ..
    bcc c3ed7                                                         ; 3e87: 90 4e       .N
    cmp #$b8                                                          ; 3e89: c9 b8       ..
    bcs c3ed7                                                         ; 3e8b: b0 4a       .J
    lda #2                                                            ; 3e8d: a9 02       ..
    sta l2551                                                         ; 3e8f: 8d 51 25    .Q%
    lda #$0b                                                          ; 3e92: a9 0b       ..
    jsr l2894                                                         ; 3e94: 20 94 28     .(
    beq c3ed7                                                         ; 3e97: f0 3e       .>
    ldx #$11                                                          ; 3e99: a2 11       ..
    ldy #7                                                            ; 3e9b: a0 07       ..
    lda #6                                                            ; 3e9d: a9 06       ..
    sta l003c                                                         ; 3e9f: 85 3c       .<
    lda #1                                                            ; 3ea1: a9 01       ..
    sta l003d                                                         ; 3ea3: 85 3d       .=
    lda #0                                                            ; 3ea5: a9 00       ..
    sta l003e                                                         ; 3ea7: 85 3e       .>
    jsr l1e44                                                         ; 3ea9: 20 44 1e     D.
    iny                                                               ; 3eac: c8          .
    lda #1                                                            ; 3ead: a9 01       ..
    sta l003c                                                         ; 3eaf: 85 3c       .<
    lda #2                                                            ; 3eb1: a9 02       ..
    sta l003d                                                         ; 3eb3: 85 3d       .=
    lda #3                                                            ; 3eb5: a9 03       ..
    sta l003e                                                         ; 3eb7: 85 3e       .>
    jsr l1e44                                                         ; 3eb9: 20 44 1e     D.
    ldx #$16                                                          ; 3ebc: a2 16       ..
    jsr l1e44                                                         ; 3ebe: 20 44 1e     D.
; $3ec1 referenced 1 time by $3e71
c3ec1
    ldy l09ff                                                         ; 3ec1: ac ff 09    ...
    iny                                                               ; 3ec4: c8          .
    cpy #2                                                            ; 3ec5: c0 02       ..
    bcc c3ed4                                                         ; 3ec7: 90 0b       ..
    lda l0030                                                         ; 3ec9: a5 30       .0
    cmp #1                                                            ; 3ecb: c9 01       ..
    bne c3ed2                                                         ; 3ecd: d0 03       ..
    jsr sub_c3ef1                                                     ; 3ecf: 20 f1 3e     .>
; $3ed2 referenced 1 time by $3ecd
c3ed2
    ldy #$ff                                                          ; 3ed2: a0 ff       ..
; $3ed4 referenced 1 time by $3ec7
c3ed4
    sty l09ff                                                         ; 3ed4: 8c ff 09    ...
; $3ed7 referenced 8 times by $3e69, $3e6f, $3e77, $3e7b, $3e80, $3e87, $3e8b, $3e97
c3ed7
    lda l0030                                                         ; 3ed7: a5 30       .0
    cmp #1                                                            ; 3ed9: c9 01       ..
    bne c3eed                                                         ; 3edb: d0 10       ..
    ldy l09ff                                                         ; 3edd: ac ff 09    ...
    bpl c3ee4                                                         ; 3ee0: 10 02       ..
    ldy #2                                                            ; 3ee2: a0 02       ..
; $3ee4 referenced 1 time by $3ee0
c3ee4
    lda l3eee,y                                                       ; 3ee4: b9 ee 3e    ..>
    sta l09aa                                                         ; 3ee7: 8d aa 09    ...
    sta l09ab                                                         ; 3eea: 8d ab 09    ...
; $3eed referenced 1 time by $3edb
c3eed
    rts                                                               ; 3eed: 60          `

; $3eee referenced 1 time by $3ee4
l3eee
    !byte $cf, $d0, $d1                                               ; 3eee: cf d0 d1    ...

; $3ef1 referenced 2 times by $3ecf, $41d6
sub_c3ef1
    lda #0                                                            ; 3ef1: a9 00       ..
    ldx #$42 ; 'B'                                                    ; 3ef3: a2 42       .B
    ldy #$44 ; 'D'                                                    ; 3ef5: a0 44       .D
    jsr l38f6                                                         ; 3ef7: 20 f6 38     .8
    ldx #$3a ; ':'                                                    ; 3efa: a2 3a       .:
    ldy #$44 ; 'D'                                                    ; 3efc: a0 44       .D
    jsr l38f6                                                         ; 3efe: 20 f6 38     .8
    rts                                                               ; 3f01: 60          `

; $3f02 referenced 1 time by $3b20
sub_c3f02
    lda #1                                                            ; 3f02: a9 01       ..
    sta l1aba                                                         ; 3f04: 8d ba 1a    ...
    lda #5                                                            ; 3f07: a9 05       ..
    ldx #$1a                                                          ; 3f09: a2 1a       ..
    ldy #$0e                                                          ; 3f0b: a0 0e       ..
    jsr l1988                                                         ; 3f0d: 20 88 19     ..
    lda l132b                                                         ; 3f10: ad 2b 13    .+.
    beq c3f52                                                         ; 3f13: f0 3d       .=
    lda #$d3                                                          ; 3f15: a9 d3       ..
    sta l2ee9                                                         ; 3f17: 8d e9 2e    ...
    lda #$d2                                                          ; 3f1a: a9 d2       ..
    sta l2eee                                                         ; 3f1c: 8d ee 2e    ...
    sta l2ef3                                                         ; 3f1f: 8d f3 2e    ...
    ldx #$16                                                          ; 3f22: a2 16       ..
    ldy #$44 ; 'D'                                                    ; 3f24: a0 44       .D
    jsr l395e                                                         ; 3f26: 20 5e 39     ^9
    lda l0030                                                         ; 3f29: a5 30       .0
    cmp #1                                                            ; 3f2b: c9 01       ..
    bne c3f51                                                         ; 3f2d: d0 22       ."
    lda l0a00                                                         ; 3f2f: ad 00 0a    ...
    bne c3f51                                                         ; 3f32: d0 1d       ..
    ldx #$1b                                                          ; 3f34: a2 1b       ..
    ldy #$12                                                          ; 3f36: a0 12       ..
    lda #7                                                            ; 3f38: a9 07       ..
    sta l003b                                                         ; 3f3a: 85 3b       .;
    lda #4                                                            ; 3f3c: a9 04       ..
    jsr l1f5d                                                         ; 3f3e: 20 5d 1f     ].
    tax                                                               ; 3f41: aa          .
    lda #1                                                            ; 3f42: a9 01       ..
    sta l09be,x                                                       ; 3f44: 9d be 09    ...
    lda #$cc                                                          ; 3f47: a9 cc       ..
    sta l38ac,x                                                       ; 3f49: 9d ac 38    ..8
    lda #$d2                                                          ; 3f4c: a9 d2       ..
    sta l09a8,x                                                       ; 3f4e: 9d a8 09    ...
; $3f51 referenced 2 times by $3f2d, $3f32
c3f51
    rts                                                               ; 3f51: 60          `

; $3f52 referenced 1 time by $3f13
c3f52
    lda l2eb6                                                         ; 3f52: ad b6 2e    ...
    cmp #$d3                                                          ; 3f55: c9 d3       ..
    bne c3f62                                                         ; 3f57: d0 09       ..
    lda #0                                                            ; 3f59: a9 00       ..
    ldx #$24 ; '$'                                                    ; 3f5b: a2 24       .$
    ldy #$44 ; 'D'                                                    ; 3f5d: a0 44       .D
    jsr l38f6                                                         ; 3f5f: 20 f6 38     .8
; $3f62 referenced 1 time by $3f57
c3f62
    lda l0030                                                         ; 3f62: a5 30       .0
    cmp #1                                                            ; 3f64: c9 01       ..
    bne c3f8a                                                         ; 3f66: d0 22       ."
    lda l0a00                                                         ; 3f68: ad 00 0a    ...
    bne c3f8a                                                         ; 3f6b: d0 1d       ..
    lda #$d2                                                          ; 3f6d: a9 d2       ..
    sta l09ac                                                         ; 3f6f: 8d ac 09    ...
    ldx #$0b                                                          ; 3f72: a2 0b       ..
    ldy #4                                                            ; 3f74: a0 04       ..
    jsr l28e2                                                         ; 3f76: 20 e2 28     .(
    beq c3f8a                                                         ; 3f79: f0 0f       ..
    lda #$d3                                                          ; 3f7b: a9 d3       ..
    jsr l2bbd                                                         ; 3f7d: 20 bd 2b     .+
    lda #0                                                            ; 3f80: a9 00       ..
    sta l09ac                                                         ; 3f82: 8d ac 09    ...
    lda #$ff                                                          ; 3f85: a9 ff       ..
    sta l0a00                                                         ; 3f87: 8d 00 0a    ...
; $3f8a referenced 3 times by $3f66, $3f6b, $3f79
c3f8a
    rts                                                               ; 3f8a: 60          `

; $3f8b referenced 4 times by $3ffa, $3fff, $4004, $4009
some_code2
    stx l3fd5                                                         ; 3f8b: 8e d5 3f    ..?
    sty l3fd6                                                         ; 3f8e: 8c d6 3f    ..?
    inx                                                               ; 3f91: e8          .
    inx                                                               ; 3f92: e8          .
    lda #5                                                            ; 3f93: a9 05       ..
    sta l003c                                                         ; 3f95: 85 3c       .<
    lda #1                                                            ; 3f97: a9 01       ..
    sta l003d                                                         ; 3f99: 85 3d       .=
    jsr l1abb                                                         ; 3f9b: 20 bb 1a     ..
    dex                                                               ; 3f9e: ca          .
    iny                                                               ; 3f9f: c8          .
    lda #7                                                            ; 3fa0: a9 07       ..
    sta l003c                                                         ; 3fa2: 85 3c       .<
    jsr l1abb                                                         ; 3fa4: 20 bb 1a     ..
    dex                                                               ; 3fa7: ca          .
    iny                                                               ; 3fa8: c8          .
    lda #9                                                            ; 3fa9: a9 09       ..
    sta l003c                                                         ; 3fab: 85 3c       .<
    lda #5                                                            ; 3fad: a9 05       ..
    sta l003d                                                         ; 3faf: 85 3d       .=
    jsr l1abb                                                         ; 3fb1: 20 bb 1a     ..
    inx                                                               ; 3fb4: e8          .
    tya                                                               ; 3fb5: 98          .
    clc                                                               ; 3fb6: 18          .
    adc #5                                                            ; 3fb7: 69 05       i.
    tay                                                               ; 3fb9: a8          .
    lda #7                                                            ; 3fba: a9 07       ..
    sta l003c                                                         ; 3fbc: 85 3c       .<
    lda #1                                                            ; 3fbe: a9 01       ..
    sta l003d                                                         ; 3fc0: 85 3d       .=
    jsr l1abb                                                         ; 3fc2: 20 bb 1a     ..
    inx                                                               ; 3fc5: e8          .
    iny                                                               ; 3fc6: c8          .
    lda #5                                                            ; 3fc7: a9 05       ..
    sta l003c                                                         ; 3fc9: 85 3c       .<
    jsr l1abb                                                         ; 3fcb: 20 bb 1a     ..
    ldx l3fd5                                                         ; 3fce: ae d5 3f    ..?
    ldy l3fd6                                                         ; 3fd1: ac d6 3f    ..?
    rts                                                               ; 3fd4: 60          `

; $3fd5 referenced 2 times by $3f8b, $3fce
l3fd5
    !byte 0                                                           ; 3fd5: 00          .
; $3fd6 referenced 2 times by $3f8e, $3fd1
l3fd6
    !byte   0, $14,   9                                               ; 3fd6: 00 14 09    ...

some_code3
    ldx #0                                                            ; 3fd9: a2 00       ..
    ldy #0                                                            ; 3fdb: a0 00       ..
    lda #$ff                                                          ; 3fdd: a9 ff       ..
    sta l003c                                                         ; 3fdf: 85 3c       .<
    sta l003d                                                         ; 3fe1: 85 3d       .=
    jsr l1abb                                                         ; 3fe3: 20 bb 1a     ..
    lda #$a9                                                          ; 3fe6: a9 a9       ..
    sta l0040                                                         ; 3fe8: 85 40       .@
    lda #$0a                                                          ; 3fea: a9 0a       ..
    sta l0041                                                         ; 3fec: 85 41       .A
    lda #0                                                            ; 3fee: a9 00       ..
    sta l003e                                                         ; 3ff0: 85 3e       .>
    lda #1                                                            ; 3ff2: a9 01       ..
    sta l0042                                                         ; 3ff4: 85 42       .B
    ldx #3                                                            ; 3ff6: a2 03       ..
    ldy #2                                                            ; 3ff8: a0 02       ..
    jsr some_code2                                                    ; 3ffa: 20 8b 3f     .?
    ldx #$1c                                                          ; 3ffd: a2 1c       ..
    jsr some_code2                                                    ; 3fff: 20 8b 3f     .?
    ldy #$0d                                                          ; 4002: a0 0d       ..
    jsr some_code2                                                    ; 4004: 20 8b 3f     .?
    ldx #3                                                            ; 4007: a2 03       ..
    jsr some_code2                                                    ; 4009: 20 8b 3f     .?
    ldx #$11                                                          ; 400c: a2 11       ..
    ldy #0                                                            ; 400e: a0 00       ..
    lda #6                                                            ; 4010: a9 06       ..
    sta l003c                                                         ; 4012: 85 3c       .<
    lda #4                                                            ; 4014: a9 04       ..
    sta l003d                                                         ; 4016: 85 3d       .=
    jsr l1abb                                                         ; 4018: 20 bb 1a     ..
    ldx #$0c                                                          ; 401b: a2 0c       ..
    ldy #4                                                            ; 401d: a0 04       ..
    lda #$10                                                          ; 401f: a9 10       ..
    sta l003c                                                         ; 4021: 85 3c       .<
    lda #5                                                            ; 4023: a9 05       ..
    sta l003d                                                         ; 4025: 85 3d       .=
    jsr l1abb                                                         ; 4027: 20 bb 1a     ..
    ldy #$0f                                                          ; 402a: a0 0f       ..
    jsr l1abb                                                         ; 402c: 20 bb 1a     ..
    ldx #$1e                                                          ; 402f: a2 1e       ..
    ldy #$0b                                                          ; 4031: a0 0b       ..
    lda #5                                                            ; 4033: a9 05       ..
    sta l003c                                                         ; 4035: 85 3c       .<
    lda #2                                                            ; 4037: a9 02       ..
    sta l003d                                                         ; 4039: 85 3d       .=
    jsr l1abb                                                         ; 403b: 20 bb 1a     ..
    jsr l1b90                                                         ; 403e: 20 90 1b     ..
    jsr l12bb                                                         ; 4041: 20 bb 12     ..
; $4044 referenced 1 time by $4049
loop_c4044
    jsr l12da                                                         ; 4044: 20 da 12     ..
    and #8                                                            ; 4047: 29 08       ).
    beq loop_c4044                                                    ; 4049: f0 f9       ..
    ldx #1                                                            ; 404b: a2 01       ..
    ldy l0031                                                         ; 404d: a4 31       .1
    jmp l1140                                                         ; 404f: 4c 40 11    L@.

; $4052 referenced 2 times by $40ef, $4240
some_data2
    !byte $d6, $d7, $d8, $d9,   0, $dd, $dd, $dd, $dd, $dd, $dd, $dd  ; 4052: d6 d7 d8... ...
    !byte $dd, $ff, $da, $da, $da, $da, $da, $da, $da, $da, $da, $da  ; 405e: dd ff da... ...
    !byte   0, $db, $db, $db, $db, $db, $db, $db, $db, $ff, $d9, $d9  ; 406a: 00 db db... ...
    !byte $d9, $d9, $d9, $d9, $d9, $d9,   0, $dc,   0                 ; 4076: d9 d9 d9... ...

; $407f referenced 1 time by $3b1d
sub_c407f
    lda #2                                                            ; 407f: a9 02       ..
    sta l1aba                                                         ; 4081: 8d ba 1a    ...
    lda #3                                                            ; 4084: a9 03       ..
    ldx #3                                                            ; 4086: a2 03       ..
    ldy #$11                                                          ; 4088: a0 11       ..
    ldx #7                                                            ; 408a: a2 07       ..
    lda #4                                                            ; 408c: a9 04       ..
    sta l003a                                                         ; 408e: 85 3a       .:
    ldy #$16                                                          ; 4090: a0 16       ..
    lda #5                                                            ; 4092: a9 05       ..
    jsr l1a10                                                         ; 4094: 20 10 1a     ..
    lda l132b                                                         ; 4097: ad 2b 13    .+.
    beq c40e4                                                         ; 409a: f0 48       .H
    lda l0031                                                         ; 409c: a5 31       .1
    cmp l0051                                                         ; 409e: c5 51       .Q
    beq c40c1                                                         ; 40a0: f0 1f       ..
    ldy #$2b ; '+'                                                    ; 40a2: a0 2b       .+
    lda l0a04                                                         ; 40a4: ad 04 0a    ...
    ldx l0a03                                                         ; 40a7: ae 03 0a    ...
    bne c40b2                                                         ; 40aa: d0 06       ..
    ldy #0                                                            ; 40ac: a0 00       ..
    lda #1                                                            ; 40ae: a9 01       ..
    ldx #$a0                                                          ; 40b0: a2 a0       ..
; $40b2 referenced 1 time by $40aa
c40b2
    sty l0a72                                                         ; 40b2: 8c 72 0a    .r.
    sty l0a73                                                         ; 40b5: 8c 73 0a    .s.
    sta l0a04                                                         ; 40b8: 8d 04 0a    ...
    sta l0a71                                                         ; 40bb: 8d 71 0a    .q.
    stx l0a70                                                         ; 40be: 8e 70 0a    .p.
; $40c1 referenced 1 time by $40a0
c40c1
    lda l0030                                                         ; 40c1: a5 30       .0
    cmp #2                                                            ; 40c3: c9 02       ..
    bne c40e0                                                         ; 40c5: d0 19       ..
    ldx #$2c ; ','                                                    ; 40c7: a2 2c       .,
    ldy #$44 ; 'D'                                                    ; 40c9: a0 44       .D
    jsr l395e                                                         ; 40cb: 20 5e 39     ^9
    ldx #0                                                            ; 40ce: a2 00       ..
    ldy #$14                                                          ; 40d0: a0 14       ..
    lda #$fe                                                          ; 40d2: a9 fe       ..
    sta l003b                                                         ; 40d4: 85 3b       .;
    lda #2                                                            ; 40d6: a9 02       ..
    jsr l1f5d                                                         ; 40d8: 20 5d 1f     ].
    lda #$cc                                                          ; 40db: a9 cc       ..
    sta l38ae                                                         ; 40dd: 8d ae 38    ..8
; $40e0 referenced 1 time by $40c5
c40e0
    jmp c41d9                                                         ; 40e0: 4c d9 41    L.A

; $40e3 referenced 2 times by $4106, $410e
l40e3
    !byte 0                                                           ; 40e3: 00          .

; $40e4 referenced 1 time by $409a
c40e4
    ldy l0a73                                                         ; 40e4: ac 73 0a    .s.
    cpy #$2b ; '+'                                                    ; 40e7: c0 2b       .+
    bne c40ee                                                         ; 40e9: d0 03       ..
    jmp c41d9                                                         ; 40eb: 4c d9 41    L.A

; $40ee referenced 1 time by $40e9
c40ee
    iny                                                               ; 40ee: c8          .
    lda some_data2,y                                                  ; 40ef: b9 52 40    .R@
    bne c40f7                                                         ; 40f2: d0 03       ..
    ldy l0a72                                                         ; 40f4: ac 72 0a    .r.
; $40f7 referenced 1 time by $40f2
c40f7
    lda l0030                                                         ; 40f7: a5 30       .0
    cmp #2                                                            ; 40f9: c9 02       ..
    bne c412e                                                         ; 40fb: d0 31       .1
    lda l0a72                                                         ; 40fd: ad 72 0a    .r.
    cmp #$2b ; '+'                                                    ; 4100: c9 2b       .+
    beq c412b                                                         ; 4102: f0 27       .'
    ldx #0                                                            ; 4104: a2 00       ..
    sty l40e3                                                         ; 4106: 8c e3 40    ..@
    ldy #2                                                            ; 4109: a0 02       ..
    jsr l28e2                                                         ; 410b: 20 e2 28     .(
    ldy l40e3                                                         ; 410e: ac e3 40    ..@
    ora #0                                                            ; 4111: 09 00       ..
    beq c412e                                                         ; 4113: f0 19       ..
    lda #6                                                            ; 4115: a9 06       ..
    sta l2433                                                         ; 4117: 8d 33 24    .3$
    lda #0                                                            ; 411a: a9 00       ..
    sta l2eb6                                                         ; 411c: 8d b6 2e    ...
    lda #1                                                            ; 411f: a9 01       ..
    sta l0a04                                                         ; 4121: 8d 04 0a    ...
    ldy #$22 ; '"'                                                    ; 4124: a0 22       ."
    lda #5                                                            ; 4126: a9 05       ..
    sta l0a72                                                         ; 4128: 8d 72 0a    .r.
; $412b referenced 1 time by $4102
c412b
    jmp c41ae                                                         ; 412b: 4c ae 41    L.A

; $412e referenced 2 times by $40fb, $4113
c412e
    cpy #$21 ; '!'                                                    ; 412e: c0 21       .!
    bne c4137                                                         ; 4130: d0 05       ..
    ldy #5                                                            ; 4132: a0 05       ..
    sty l0a72                                                         ; 4134: 8c 72 0a    .r.
; $4137 referenced 1 time by $4130
c4137
    lda l0030                                                         ; 4137: a5 30       .0
    cmp #2                                                            ; 4139: c9 02       ..
    bne c415e                                                         ; 413b: d0 21       .!
    lda l2eb6                                                         ; 413d: ad b6 2e    ...
    cmp #$d3                                                          ; 4140: c9 d3       ..
    bne c415e                                                         ; 4142: d0 1a       ..
    ldy #$0e                                                          ; 4144: a0 0e       ..
    lda #$19                                                          ; 4146: a9 19       ..
    sta l0a72                                                         ; 4148: 8d 72 0a    .r.
    lda l097c                                                         ; 414b: ad 7c 09    .|.
    cmp #$a0                                                          ; 414e: c9 a0       ..
    bcs c41ae                                                         ; 4150: b0 5c       .\
    cmp #$78 ; 'x'                                                    ; 4152: c9 78       .x
    bcc c41ae                                                         ; 4154: 90 58       .X
    lda #$2b ; '+'                                                    ; 4156: a9 2b       .+
    sta l0a72                                                         ; 4158: 8d 72 0a    .r.
    jmp c41ae                                                         ; 415b: 4c ae 41    L.A

; $415e referenced 2 times by $413b, $4142
c415e
    cpy #$0d                                                          ; 415e: c0 0d       ..
    bne c4167                                                         ; 4160: d0 05       ..
    ldy #0                                                            ; 4162: a0 00       ..
    sty l0a72                                                         ; 4164: 8c 72 0a    .r.
; $4167 referenced 1 time by $4160
c4167
    lda l0a72                                                         ; 4167: ad 72 0a    .r.
    cmp #0                                                            ; 416a: c9 00       ..
    bne c41ae                                                         ; 416c: d0 40       .@
    lda l0a71                                                         ; 416e: ad 71 0a    .q.
    sta l0a04                                                         ; 4171: 8d 04 0a    ...
    lda l0a70                                                         ; 4174: ad 70 0a    .p.
    ldx l0a71                                                         ; 4177: ae 71 0a    .q.
    bmi c4184                                                         ; 417a: 30 08       0.
    cmp #$d4                                                          ; 417c: c9 d4       ..
    beq c418c                                                         ; 417e: f0 0c       ..
    bcc c419f                                                         ; 4180: 90 1d       ..
    bcs c4194                                                         ; 4182: b0 10       ..
; $4184 referenced 1 time by $417a
c4184
    cmp #$6c ; 'l'                                                    ; 4184: c9 6c       .l
    beq c418c                                                         ; 4186: f0 04       ..
    bcs c419f                                                         ; 4188: b0 15       ..
    bcc c4194                                                         ; 418a: 90 08       ..
; $418c referenced 2 times by $417e, $4186
c418c
    ldy #5                                                            ; 418c: a0 05       ..
    sty l0a72                                                         ; 418e: 8c 72 0a    .r.
    jmp c419f                                                         ; 4191: 4c 9f 41    L.A

; $4194 referenced 2 times by $4182, $418a
c4194
    lda l0a71                                                         ; 4194: ad 71 0a    .q.
    eor #$fe                                                          ; 4197: 49 fe       I.
    sta l0a71                                                         ; 4199: 8d 71 0a    .q.
    sta l0a04                                                         ; 419c: 8d 04 0a    ...
; $419f referenced 3 times by $4180, $4188, $4191
c419f
    lda l0a71                                                         ; 419f: ad 71 0a    .q.
    asl                                                               ; 41a2: 0a          .
    asl                                                               ; 41a3: 0a          .
    clc                                                               ; 41a4: 18          .
    adc l0a70                                                         ; 41a5: 6d 70 0a    mp.
    sta l0a70                                                         ; 41a8: 8d 70 0a    .p.
    jmp c41c9                                                         ; 41ab: 4c c9 41    L.A

; $41ae referenced 5 times by $412b, $4150, $4154, $415b, $416c
c41ae
    lda l0a04                                                         ; 41ae: ad 04 0a    ...
    bmi c41c1                                                         ; 41b1: 30 0e       0.
    lda l0a70                                                         ; 41b3: ad 70 0a    .p.
    clc                                                               ; 41b6: 18          .
    adc #4                                                            ; 41b7: 69 04       i.
    and #$f8                                                          ; 41b9: 29 f8       ).
    sta l0a70                                                         ; 41bb: 8d 70 0a    .p.
    jmp c41c9                                                         ; 41be: 4c c9 41    L.A

; $41c1 referenced 1 time by $41b1
c41c1
    lda l0a70                                                         ; 41c1: ad 70 0a    .p.
    and #$f8                                                          ; 41c4: 29 f8       ).
    sta l0a70                                                         ; 41c6: 8d 70 0a    .p.
; $41c9 referenced 2 times by $41ab, $41be
c41c9
    sty l0a73                                                         ; 41c9: 8c 73 0a    .s.
    lda l0030                                                         ; 41cc: a5 30       .0
    cmp #2                                                            ; 41ce: c9 02       ..
    bne c41d9                                                         ; 41d0: d0 07       ..
    cpy #$2b ; '+'                                                    ; 41d2: c0 2b       .+
    bne c41d9                                                         ; 41d4: d0 03       ..
    jsr sub_c3ef1                                                     ; 41d6: 20 f1 3e     .>
; $41d9 referenced 4 times by $40e0, $40eb, $41d0, $41d4
c41d9
    lda l0030                                                         ; 41d9: a5 30       .0
    cmp #2                                                            ; 41db: c9 02       ..
    bne c424c                                                         ; 41dd: d0 6d       .m
    lda l0a72                                                         ; 41df: ad 72 0a    .r.
    cmp #$2b ; '+'                                                    ; 41e2: c9 2b       .+
    bne c4235                                                         ; 41e4: d0 4f       .O
    lda l0a70                                                         ; 41e6: ad 70 0a    .p.
    sta l0a03                                                         ; 41e9: 8d 03 0a    ...
    lsr                                                               ; 41ec: 4a          J
    lsr                                                               ; 41ed: 4a          J
    lsr                                                               ; 41ee: 4a          J
    tax                                                               ; 41ef: aa          .
    lda l0a73                                                         ; 41f0: ad 73 0a    .s.
    cmp #$2b ; '+'                                                    ; 41f3: c9 2b       .+
    beq c420c                                                         ; 41f5: f0 15       ..
    dex                                                               ; 41f7: ca          .
    ldy #$11                                                          ; 41f8: a0 11       ..
    lda #2                                                            ; 41fa: a9 02       ..
    sta l003c                                                         ; 41fc: 85 3c       .<
    lda #3                                                            ; 41fe: a9 03       ..
    sta l003d                                                         ; 4200: 85 3d       .=
    lda #3                                                            ; 4202: a9 03       ..
    sta l003e                                                         ; 4204: 85 3e       .>
    jsr l1e44                                                         ; 4206: 20 44 1e     D.
    jmp c4235                                                         ; 4209: 4c 35 42    L5B

; $420c referenced 1 time by $41f5
c420c
    dex                                                               ; 420c: ca          .
    ldy #$11                                                          ; 420d: a0 11       ..
    lda #2                                                            ; 420f: a9 02       ..
    sta l003c                                                         ; 4211: 85 3c       .<
    lda #3                                                            ; 4213: a9 03       ..
    sta l003d                                                         ; 4215: 85 3d       .=
    lda #0                                                            ; 4217: a9 00       ..
    sta l003e                                                         ; 4219: 85 3e       .>
    jsr l1e44                                                         ; 421b: 20 44 1e     D.
    lda l0a04                                                         ; 421e: ad 04 0a    ...
    bmi c4224                                                         ; 4221: 30 01       0.
    dex                                                               ; 4223: ca          .
; $4224 referenced 1 time by $4221
c4224
    ldy #$13                                                          ; 4224: a0 13       ..
    lda #3                                                            ; 4226: a9 03       ..
    sta l003c                                                         ; 4228: 85 3c       .<
    lda #1                                                            ; 422a: a9 01       ..
    sta l003d                                                         ; 422c: 85 3d       .=
    lda #3                                                            ; 422e: a9 03       ..
    sta l003e                                                         ; 4230: 85 3e       .>
    jsr l1e44                                                         ; 4232: 20 44 1e     D.
; $4235 referenced 2 times by $41e4, $4209
c4235
    ldx #2                                                            ; 4235: a2 02       ..
    lda l0a70                                                         ; 4237: ad 70 0a    .p.
    sta l0950,x                                                       ; 423a: 9d 50 09    .P.
    ldy l0a73                                                         ; 423d: ac 73 0a    .s.
    lda some_data2,y                                                  ; 4240: b9 52 40    .R@
    sta l09a8,x                                                       ; 4243: 9d a8 09    ...
    lda l0a04                                                         ; 4246: ad 04 0a    ...
    sta l09be,x                                                       ; 4249: 9d be 09    ...
; $424c referenced 1 time by $41dd
c424c
    rts                                                               ; 424c: 60          `

    !byte $14,   7                                                    ; 424d: 14 07       ..

some_code4
    ldx #0                                                            ; 424f: a2 00       ..
    ldy #0                                                            ; 4251: a0 00       ..
    lda #$ff                                                          ; 4253: a9 ff       ..
    sta l003c                                                         ; 4255: 85 3c       .<
    lda #2                                                            ; 4257: a9 02       ..
    sta l003d                                                         ; 4259: 85 3d       .=
    jsr l1abb                                                         ; 425b: 20 bb 1a     ..
    ldx #$24 ; '$'                                                    ; 425e: a2 24       .$
    ldy #2                                                            ; 4260: a0 02       ..
    dec l003d                                                         ; 4262: c6 3d       .=
    jsr l1abb                                                         ; 4264: 20 bb 1a     ..
    inx                                                               ; 4267: e8          .
    iny                                                               ; 4268: c8          .
    lda #$0f                                                          ; 4269: a9 0f       ..
    sta l003d                                                         ; 426b: 85 3d       .=
    jsr l1abb                                                         ; 426d: 20 bb 1a     ..
    ldx #0                                                            ; 4270: a2 00       ..
    ldy #$12                                                          ; 4272: a0 12       ..
    lda #5                                                            ; 4274: a9 05       ..
    sta l003c                                                         ; 4276: 85 3c       .<
    lda #3                                                            ; 4278: a9 03       ..
    sta l003d                                                         ; 427a: 85 3d       .=
    jsr l1abb                                                         ; 427c: 20 bb 1a     ..
    ldx #$1e                                                          ; 427f: a2 1e       ..
    lda #$ff                                                          ; 4281: a9 ff       ..
    sta l003c                                                         ; 4283: 85 3c       .<
    jsr l1abb                                                         ; 4285: 20 bb 1a     ..
    ldx #0                                                            ; 4288: a2 00       ..
    ldy #$15                                                          ; 428a: a0 15       ..
    lda #$0a                                                          ; 428c: a9 0a       ..
    sta l003c                                                         ; 428e: 85 3c       .<
    lda #1                                                            ; 4290: a9 01       ..
    sta l003d                                                         ; 4292: 85 3d       .=
    jsr l1abb                                                         ; 4294: 20 bb 1a     ..
    ldx #$19                                                          ; 4297: a2 19       ..
    lda #$ff                                                          ; 4299: a9 ff       ..
    sta l003c                                                         ; 429b: 85 3c       .<
    jsr l1abb                                                         ; 429d: 20 bb 1a     ..
    ldx #0                                                            ; 42a0: a2 00       ..
    iny                                                               ; 42a2: c8          .
    inc l003d                                                         ; 42a3: e6 3d       .=
    jsr l1abb                                                         ; 42a5: 20 bb 1a     ..
    ldx #$0a                                                          ; 42a8: a2 0a       ..
    ldy #7                                                            ; 42aa: a0 07       ..
    lda #$14                                                          ; 42ac: a9 14       ..
    sta l003c                                                         ; 42ae: 85 3c       .<
    lda #2                                                            ; 42b0: a9 02       ..
    sta l003d                                                         ; 42b2: 85 3d       .=
    jsr l1abb                                                         ; 42b4: 20 bb 1a     ..
    ldx #0                                                            ; 42b7: a2 00       ..
    lda #5                                                            ; 42b9: a9 05       ..
    sta l003c                                                         ; 42bb: 85 3c       .<
    jsr l1abb                                                         ; 42bd: 20 bb 1a     ..
    ldy #9                                                            ; 42c0: a0 09       ..
    lda #3                                                            ; 42c2: a9 03       ..
    sta l003c                                                         ; 42c4: 85 3c       .<
    lda #4                                                            ; 42c6: a9 04       ..
    sta l003d                                                         ; 42c8: 85 3d       .=
    jsr l1abb                                                         ; 42ca: 20 bb 1a     ..
    jsr l1b90                                                         ; 42cd: 20 90 1b     ..
    ldx #$14                                                          ; 42d0: a2 14       ..
    ldy #$0c                                                          ; 42d2: a0 0c       ..
    lda #$3b ; ';'                                                    ; 42d4: a9 3b       .;
    jsr l1f4c                                                         ; 42d6: 20 4c 1f     L.
    lda #3                                                            ; 42d9: a9 03       ..
    jsr l1ebb                                                         ; 42db: 20 bb 1e     ..
    ldx #$21 ; '!'                                                    ; 42de: a2 21       .!
    ldy #2                                                            ; 42e0: a0 02       ..
    lda #$0e                                                          ; 42e2: a9 0e       ..
    jsr l1db9                                                         ; 42e4: 20 b9 1d     ..
    jsr l12bb                                                         ; 42e7: 20 bb 12     ..
; $42ea referenced 1 time by $42ef
loop_c42ea
    jsr l12da                                                         ; 42ea: 20 da 12     ..
    and #1                                                            ; 42ed: 29 01       ).
    beq loop_c42ea                                                    ; 42ef: f0 f9       ..
    ldx #1                                                            ; 42f1: a2 01       ..
    ldy l0031                                                         ; 42f3: a4 31       .1
    jmp l1140                                                         ; 42f5: 4c 40 11    L@.

; $42f8 referenced 1 time by $3b23
sub_c42f8
    lda #3                                                            ; 42f8: a9 03       ..
    sta l1aba                                                         ; 42fa: 8d ba 1a    ...
    lda #3                                                            ; 42fd: a9 03       ..
    ldx #$14                                                          ; 42ff: a2 14       ..
    ldy #$0c                                                          ; 4301: a0 0c       ..
    jsr l1988                                                         ; 4303: 20 88 19     ..
    lda #4                                                            ; 4306: a9 04       ..
    inx                                                               ; 4308: e8          .
    jsr l1988                                                         ; 4309: 20 88 19     ..
    lda l132b                                                         ; 430c: ad 2b 13    .+.
    beq c4358                                                         ; 430f: f0 47       .G
    lda l0051                                                         ; 4311: a5 51       .Q
    cmp l0031                                                         ; 4313: c5 31       .1
    beq c4339                                                         ; 4315: f0 22       ."
    lda l0a01                                                         ; 4317: ad 01 0a    ...
    beq c432f                                                         ; 431a: f0 13       ..
    lda l0a02                                                         ; 431c: ad 02 0a    ...
    beq c4339                                                         ; 431f: f0 18       ..
    bpl c432f                                                         ; 4321: 10 0c       ..
    lda #$0a                                                          ; 4323: a9 0a       ..
    sta l0a01                                                         ; 4325: 8d 01 0a    ...
    lda #0                                                            ; 4328: a9 00       ..
    sta l0a02                                                         ; 432a: 8d 02 0a    ...
    beq c4339                                                         ; 432d: f0 0a       ..
; $432f referenced 2 times by $431a, $4321
c432f
    lda #$16                                                          ; 432f: a9 16       ..
    sta l0a01                                                         ; 4331: 8d 01 0a    ...
    lda #0                                                            ; 4334: a9 00       ..
    sta l0a02                                                         ; 4336: 8d 02 0a    ...
; $4339 referenced 3 times by $4315, $431f, $432d
c4339
    lda l0030                                                         ; 4339: a5 30       .0
    cmp #3                                                            ; 433b: c9 03       ..
    bne c4352                                                         ; 433d: d0 13       ..
    ldx #$4a ; 'J'                                                    ; 433f: a2 4a       .J
    ldy #$44 ; 'D'                                                    ; 4341: a0 44       .D
    jsr l395e                                                         ; 4343: 20 5e 39     ^9
    ldx #2                                                            ; 4346: a2 02       ..
    lda #$de                                                          ; 4348: a9 de       ..
    sta l09a8,x                                                       ; 434a: 9d a8 09    ...
    lda #$cc                                                          ; 434d: a9 cc       ..
    sta l38ac,x                                                       ; 434f: 9d ac 38    ..8
; $4352 referenced 1 time by $433d
c4352
    jmp c43f6                                                         ; 4352: 4c f6 43    L.C

; $4355 referenced 5 times by $4361, $436f, $437d, $438b, $4399
c4355
    jmp c4415                                                         ; 4355: 4c 15 44    L.D

; $4358 referenced 1 time by $430f
c4358
    lda l0a02                                                         ; 4358: ad 02 0a    ...
    bne c43a0                                                         ; 435b: d0 43       .C
    lda l0030                                                         ; 435d: a5 30       .0
    cmp #3                                                            ; 435f: c9 03       ..
    bne c4355                                                         ; 4361: d0 f2       ..
    lda l0a01                                                         ; 4363: ad 01 0a    ...
    cmp #$16                                                          ; 4366: c9 16       ..
    beq c4386                                                         ; 4368: f0 1c       ..
    lda l38d8                                                         ; 436a: ad d8 38    ..8
    and #4                                                            ; 436d: 29 04       ).
    beq c4355                                                         ; 436f: f0 e4       ..
    lda #1                                                            ; 4371: a9 01       ..
    sta l24d1                                                         ; 4373: 8d d1 24    ..$
    ldx #0                                                            ; 4376: a2 00       ..
    ldy #2                                                            ; 4378: a0 02       ..
    jsr l28e2                                                         ; 437a: 20 e2 28     .(
    beq c4355                                                         ; 437d: f0 d6       ..
    lda #1                                                            ; 437f: a9 01       ..
    sta l0a02                                                         ; 4381: 8d 02 0a    ...
    bne c43a0                                                         ; 4384: d0 1a       ..
; $4386 referenced 1 time by $4368
c4386
    lda l38d8                                                         ; 4386: ad d8 38    ..8
    and #1                                                            ; 4389: 29 01       ).
    beq c4355                                                         ; 438b: f0 c8       ..
    lda #$ff                                                          ; 438d: a9 ff       ..
    sta l24d0                                                         ; 438f: 8d d0 24    ..$
    ldx #0                                                            ; 4392: a2 00       ..
    ldy #2                                                            ; 4394: a0 02       ..
    jsr l28e2                                                         ; 4396: 20 e2 28     .(
    beq c4355                                                         ; 4399: f0 ba       ..
    lda #$ff                                                          ; 439b: a9 ff       ..
    sta l0a02                                                         ; 439d: 8d 02 0a    ...
; $43a0 referenced 2 times by $435b, $4384
c43a0
    lda l0a01                                                         ; 43a0: ad 01 0a    ...
    sta l0070                                                         ; 43a3: 85 70       .p
    clc                                                               ; 43a5: 18          .
    adc l0a02                                                         ; 43a6: 6d 02 0a    m..
    sta l0a01                                                         ; 43a9: 8d 01 0a    ...
    cmp #$0a                                                          ; 43ac: c9 0a       ..
    beq c43b4                                                         ; 43ae: f0 04       ..
    cmp #$16                                                          ; 43b0: c9 16       ..
    bne c43d4                                                         ; 43b2: d0 20       .
; $43b4 referenced 1 time by $43ae
c43b4
    lda #0                                                            ; 43b4: a9 00       ..
    sta l0a02                                                         ; 43b6: 8d 02 0a    ...
    lda l0030                                                         ; 43b9: a5 30       .0
    cmp #3                                                            ; 43bb: c9 03       ..
    bne c4415                                                         ; 43bd: d0 56       .V
    lda l396f                                                         ; 43bf: ad 6f 39    .o9
    cmp #$81                                                          ; 43c2: c9 81       ..
    bcs c43ce                                                         ; 43c4: b0 08       ..
    lda #0                                                            ; 43c6: a9 00       ..
    sta l396f                                                         ; 43c8: 8d 6f 39    .o9
    sta l3970                                                         ; 43cb: 8d 70 39    .p9
; $43ce referenced 1 time by $43c4
c43ce
    jsr l23a9                                                         ; 43ce: 20 a9 23     .#
    jmp c43e3                                                         ; 43d1: 4c e3 43    L.C

; $43d4 referenced 1 time by $43b2
c43d4
    lda l0030                                                         ; 43d4: a5 30       .0
    cmp #3                                                            ; 43d6: c9 03       ..
    bne c4415                                                         ; 43d8: d0 3b       .;
    lda #$80                                                          ; 43da: a9 80       ..
    ldx #$58 ; 'X'                                                    ; 43dc: a2 58       .X
    ldy #$44 ; 'D'                                                    ; 43de: a0 44       .D
    jsr l38f6                                                         ; 43e0: 20 f6 38     .8
; $43e3 referenced 1 time by $43d1
c43e3
    ldx l0070                                                         ; 43e3: a6 70       .p
    ldy #$14                                                          ; 43e5: a0 14       ..
    lda #3                                                            ; 43e7: a9 03       ..
    sta l003c                                                         ; 43e9: 85 3c       .<
    lda #2                                                            ; 43eb: a9 02       ..
    sta l003d                                                         ; 43ed: 85 3d       .=
    lda #0                                                            ; 43ef: a9 00       ..
    sta l003e                                                         ; 43f1: 85 3e       .>
    jsr l1e44                                                         ; 43f3: 20 44 1e     D.
; $43f6 referenced 1 time by $4352
c43f6
    lda l0030                                                         ; 43f6: a5 30       .0
    cmp #3                                                            ; 43f8: c9 03       ..
    bne c4415                                                         ; 43fa: d0 19       ..
    ldx l0a01                                                         ; 43fc: ae 01 0a    ...
    ldy #$14                                                          ; 43ff: a0 14       ..
    lda #3                                                            ; 4401: a9 03       ..
    sta l003c                                                         ; 4403: 85 3c       .<
    lda #2                                                            ; 4405: a9 02       ..
    sta l003d                                                         ; 4407: 85 3d       .=
    lda #3                                                            ; 4409: a9 03       ..
    sta l003e                                                         ; 440b: 85 3e       .>
    jsr l1e44                                                         ; 440d: 20 44 1e     D.
    lda #2                                                            ; 4410: a9 02       ..
    jsr l1f5d                                                         ; 4412: 20 5d 1f     ].
; $4415 referenced 4 times by $4355, $43bd, $43d8, $43fa
c4415
    rts                                                               ; 4415: 60          `

    !byte   5,   1,   0,   0,   0,   0,   0,   0, $14,   0, $ff, $f6  ; 4416: 05 01 00... ...
    !byte $64,   0, $13,   0,   5,   0,   0,   0,   4,   0,   6,   1  ; 4422: 64 00 13... d..
    !byte   0,   0,   0,   0,   0,   0, $50,   0,   0, $fa, $73,   0  ; 442e: 00 00 00... ...
    !byte $10,   0,   6,   0,   7,   0,   1,   0, $11,   0,   0,   0  ; 443a: 10 00 06... ...
    !byte $d2,   0,   1,   0,   6,   1,   0,   0,   0,   0,   0,   0  ; 4446: d2 00 01... ...
    !byte $0a,   0,   0, $d8, $28,   0, $10,   0,   6,   0,   4,   0  ; 4452: 0a 00 00... ...
    !byte   4,   0,   6,   1,   0,   0,   0,   0,   0,   0, $1e, $ce  ; 445e: 04 00 06... ...
    !byte $ce, $9c, $64,   0, $10,   0,   6,   0,   7,   0,   1,   0  ; 446a: ce 9c 64... ..d
    !byte $11,   0,   0,   0, $be,   0,   1,   0, $10,   0,   0,   0  ; 4476: 11 00 00... ...
    !byte   0,   0,   0,   0, $10, $20, $40, $83,   4,   8, $10, $10  ; 4482: 00 00 00... ...
    !byte   8,   4,   2,   1, $80, $40, $20, $10,   8,   4,   2,   1  ; 448e: 08 04 02... ...
inverse_power_of_2_table
    !byte $80, $40, $20, $10, $08, $04, $02, $01                      ; 449a: 80 40 20... .@
    !byte $80, $40, $20, $10, $2e,   0, $79,   0, $86,   0, $98,   0  ; 44a2: 80 40 20... .@
    !byte $c7,   0, $53,   1, $67,   1, $7b,   1, $c1,   1, $1e,   2  ; 44ae: c7 00 53... ..S
    !byte $4d,   2, $71,   2, $9d,   2, $aa,   2, $b9,   2, $0f,   3  ; 44ba: 4d 02 71... M.q
    !byte $68,   3, $be,   3, $1d,   4, $72,   4, $e0,   4, $32,   5  ; 44c6: 68 03 be... h..
    !byte $86,   5, $f0,   0, $18, $14, $a3, $84, $c5                 ; 44d2: 86 05 f0... ...
    !text "1111N"                                                     ; 44db: 31 31 31... 111
    !byte $13, $85, $3a, $13, $a1,   0,   3, $a1                      ; 44e0: 13 85 3a... ..:
    !text "UT8UUT "                                                   ; 44e8: 55 54 38... UT8
    !byte $e1                                                         ; 44ef: e1          .
    !text "UUU"                                                       ; 44f0: 55 55 55    UUU
    !byte $14, $c5                                                    ; 44f3: 14 c5       ..
    !text "UUUT"                                                      ; 44f5: 55 55 55... UUU
    !byte $c5, $55, $55, $15, $50, $c5, $55, $55, $14, $55, $31,   5  ; 44f9: c5 55 55... .UU
    !byte $55, $15                                                    ; 4505: 55 15       U.
    !text "ULEUEQ"                                                    ; 4507: 55 4c 45... ULE
    !byte $0c, $45, $55,   5, $54, $e0, $15                           ; 450d: 0c 45 55... .EU
    !text "AT8@"                                                      ; 4514: 41 54 38... AT8
    !byte   8, $50, $e1, $2a, $a8, $3a, $30,   0, $fb,   8,   5, $87  ; 4518: 08 50 e1... .P.
    !byte $84, $c5, $38, $3e, $84, $e1, $4e, $83,   0, $fa,   9,   6  ; 4524: 84 c5 38... ..8
    !byte $94, $c5, $38, $53, $a1, $4e, $80, $e1, $38, $53, $a1, $4e  ; 4530: 94 c5 38... ..8
    !byte $a0, $c0, $f9,   0, $0e, $0d, $aa, $80, $ea,   5, $43, $a1  ; 453c: a0 c0 f9... ...
    !byte $55, $53, $85, $55, $54, $e1                                ; 4548: 55 53 85... US.
    !text "UU1UUS"                                                    ; 454e: 55 55 31... UU1
    !byte $15                                                         ; 4554: 15          .
    !text "UU1UUS"                                                    ; 4555: 55 55 31... UU1
    !byte $15                                                         ; 455b: 15          .
    !text "UU8UUN"                                                    ; 455c: 55 55 38... UU8
    !byte   5, $55, $43, $a0, $15,   3, $a8,   0, $0e, $aa,   3,   0  ; 4562: 05 55 43... .UC
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 456e: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 457a: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4586: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4592: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 459e: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45aa: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45b6: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45c2: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45ce: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45da: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45e6: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45f2: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45fe: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 460a: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, $ff  ; 4616: 00 00 00... ...
    !byte   3, $18, $0a, $aa, $a0                                     ; 4622: 03 18 0a... ...
    !text "1ET"                                                       ; 4627: 31 45 54    1ET
    !byte $c5, $15, $53, $14                                          ; 462a: c5 15 53... ..S
    !text "ELQ"                                                       ; 462e: 45 4c 51    ELQ
    !byte $15, $31, $45, $14, $c4, $54, $53, $14                      ; 4631: 15 31 45... .1E
    !text "QLQ"                                                       ; 4639: 51 4c 51    QLQ
    !byte $15                                                         ; 463c: 15          .
    !text "0DT"                                                       ; 463d: 30 44 54    0DT
    !byte $c5, $11, $13, $14                                          ; 4640: c5 11 13... ...
    !text "TLQQ1ED"                                                   ; 4644: 54 4c 51... TLQ
    !byte $c5, $44, $53, $14                                          ; 464b: c5 44 53... .DS
    !text "QLQE1ET"                                                   ; 464f: 51 4c 51... QLQ
    !byte $c4, $15, $13, $14                                          ; 4656: c4 15 13... ...
    !text "DLQ"                                                       ; 465a: 44 4c 51    DLQ
    !byte $11                                                         ; 465d: 11          .
    !text "1ET"                                                       ; 465e: 31 45 54    1ET
    !byte $c5, $15, $53, $80,   0, $30,   0, $11, $14, $17, $aa, $aa  ; 4661: c5 15 53... ..S
    !byte $aa, $aa, $11, $3a, $aa, $aa, $aa, $a0,   3, $aa, $aa, $aa  ; 466d: aa aa 11... ...
    !byte $a0, $55, $4e, $aa, $aa, $aa, $14, $45, $4e, $aa, $aa, $a8  ; 4679: a0 55 4e... .UN
    !byte $55,   0, $3a, $aa, $aa, $85, $51, $54, $ea, $aa, $a8, $55  ; 4685: 55 00 3a... U.:
    !byte $11, $4e, $aa, $aa, $15,   4, $53, $aa, $aa,   5, $45, $13  ; 4691: 11 4e aa... .N.
    !byte $aa, $a8, $55, $10, $4e, $aa, $85, $51, $14, $ea, $a1       ; 469d: aa a8 55... ..U
    !text "TT:"                                                       ; 46a8: 54 54 3a    TT:
    !byte $a1, $54, $10, $3a, $85, $51, $44, $e8, $55, $15, $4e, $15  ; 46ab: a1 54 10... .T.
    !byte   5, $43, $15, $44, $43, $15, $11, $4e, $11, $54, $e8,   0  ; 46b7: 05 43 15... .C.
    !byte $30,   0, $17,   6, $1c, $aa, $aa, $aa, $aa, $aa, $a1, $13  ; 46c3: 30 00 17... 0..
    !byte $80,   0,   0,   0,   0,   0,   3, $15                      ; 46cf: 80 00 00... ...
    !text "UUQUET"                                                    ; 46d7: 55 55 51... UUQ
    !byte $c5                                                         ; 46dd: c5          .
    !text "UUUUQU1U"                                                  ; 46de: 55 55 55... UUU
    !byte $15                                                         ; 46e6: 15          .
    !text "UTTEN"                                                     ; 46e7: 55 54 54... UTT
    !byte   0,   0,   0,   0,   0,   0, $0c, $ff,   7, $0a, $0f, $a0  ; 46ec: 00 00 00... ...
    !text "8T1UB"                                                     ; 46f8: 38 54 31... 8T1
    !byte $a8, $c5, $55, $50, $84, $e1, $51, $55,   4, $e8, $54, $15  ; 46fd: a8 c5 55... ..U
    !byte $54, $ea, $15,   1, $53, $a8, $54, $a0, $3a, $15, $53, $a8  ; 4709: 54 ea 15... T..
    !byte   0, $c0,   5, $10, $0a, $0f,   0,   1, $11, $13,   5       ; 4715: 00 c0 05... ...
    !text "@DG"                                                       ; 4720: 40 44 47    @DG
    !byte $15, $54,   1,   3, $15, $55, $40, $13,   5, $45, $54, $13  ; 4723: 15 54 01... .T.
    !text "APUS"                                                      ; 472f: 41 50 55... APU
    !byte $10, $54,   5                                               ; 4733: 10 54 05    .T.
    !text "C@T"                                                       ; 4736: 43 40 54    C@T
    !byte   0,   7, $11, $55, $11, $13, $40,   0,   4, $47, $ff, $fb  ; 4739: 00 07 11... ...
    !byte   9,   5, $8e, $1c, $53, $83, $fa, $13, $85, $3a, $0c,   0  ; 4745: 09 05 8e... ...
    !byte $fa,   9,   5, $93, $13, $14, $e1                           ; 4751: fa 09 05... ...
    !text ":8N"                                                       ; 4758: 3a 38 4e    :8N
    !byte $14, $e8, $4e, $a3, $f7,   0, $12, $15, $aa, $aa, $aa, $a0  ; 475b: 14 e8 4e... ..N
    !byte $0e, $aa, $aa, $aa, $15, $4e, $80, $a0                      ; 4767: 0e aa aa... ...
    !text "(US"                                                       ; 476f: 28 55 53    (US
    !byte $85                                                         ; 4772: 85          .
    !text "APUT"                                                      ; 4773: 41 50 55... APU
    !byte $c5, $51, $55, $14                                          ; 4777: c5 51 55... .QU
    !text "ULD"                                                       ; 477b: 55 4c 44    ULD
    !byte $10, $55, $15, $54, $e0,   5, $15, $45, $15, $4e, $85,   5  ; 477e: 10 55 15... .U.
    !byte $54, $15, $53, $81                                          ; 478a: 54 15 53... T.S
    !text "UUE"                                                       ; 478e: 55 55 45    UUE
    !byte $14, $c5, $55, $55, $14, $54, $c5                           ; 4791: 14 c5 55... ..U
    !text "UUEC"                                                      ; 4798: 55 55 45... UUE
    !byte $11, $51, $54, $80, $c4, $15, $54, $c4, $85, $51, $38, $a8  ; 479c: 11 51 54... .QT
    !byte   1, $53, $aa, $aa, $81, $3a, $aa, $a8, $53, $aa, $aa, $a0  ; 47a8: 01 53 aa... .S.
    !byte $c0, $f7,   0, $13, $16, $aa, $aa, $aa, $a8,   3, $aa, $aa  ; 47b4: c0 f7 00... ...
    !byte $aa, $a1, $54, $ea, $aa, $80, $a1, $55, $4e, $8a, $a1       ; 47c0: aa a1 54... ..T
    !text "PUT"                                                       ; 47cb: 50 55 54    PUT
    !byte $e1                                                         ; 47ce: e1          .
    !text " UE"                                                       ; 47cf: 20 55 45     UE
    !byte $15, $53, $15, $11                                          ; 47d2: 15 53 15... .S.
    !text "UQULUQ"                                                    ; 47d6: 55 51 55... UQU
    !byte $15, $14, $55, $31, $15, $44, $54, $15, $53, $10            ; 47dc: 15 14 55... ..U
    !text "QEQE1"                                                     ; 47e6: 51 45 51... QEQ
    !byte 5                                                           ; 47eb: 05          .
    !text "AQEN!UU"                                                   ; 47ec: 41 51 45... AQE
    !byte $15, $0e, $a1, $51, $54, $80, $ea, $85, $55, $3a, $84, $55  ; 47f3: 15 0e a1... ...
    !byte $3a, $15,   0, $4e, $85, $28, $53, $a8, $52, $83, $aa, $14  ; 47ff: 3a 15 00... :..
    !byte $ea, $a0, $c0, $f7,   0, $12, $15, $aa, $aa, $aa, $a0, $0e  ; 480b: ea a0 c0... ...
    !byte $aa, $aa, $aa, $15, $4e, $80, $a0                           ; 4817: aa aa aa... ...
    !text "(US"                                                       ; 481e: 28 55 53    (US
    !byte $85                                                         ; 4821: 85          .
    !text "APUT"                                                      ; 4822: 41 50 55... APU
    !byte $c5, $51, $55, $14                                          ; 4826: c5 51 55... .QU
    !text "ULD"                                                       ; 482a: 55 4c 44    ULD
    !byte $10, $55, $15, $54, $e0, $45, $15, $45, $15, $4e, $85,   5  ; 482d: 10 55 15... .U.
    !byte $54, $15, $53, $80                                          ; 4839: 54 15 53... T.S
    !text "UUE"                                                       ; 483d: 55 55 45    UUE
    !byte $14, $c4, $55, $55, $14, $54, $c4                           ; 4840: 14 c4 55... ..U
    !text "UUEC"                                                      ; 4847: 55 55 45... UUE
    !byte $11, $51, $54, $80, $c4, $15, $54, $c4, $85, $51, $38, $a8  ; 484b: 11 51 54... .QT
    !byte   1, $53, $aa, $aa, $81, $3a, $aa, $a8, $53, $aa, $aa, $a0  ; 4857: 01 53 aa... .S.
    !byte $c0, $f7,   0, $13, $16, $aa, $a0, $aa, $a8,   3, $aa, $85  ; 4863: c0 f7 00... ...
    !byte $2a, $a1, $54, $ea, $85,   0, $a1, $55, $4e, $8a, $15       ; 486f: 2a a1 54... *.T
    !text "PUT"                                                       ; 487a: 50 55 54    PUT
    !byte $e1,   0,   5, $45, $15, $53, $15                           ; 487d: e1 00 05... ...
    !text "EEQULTUU"                                                  ; 4884: 45 45 51... EEQ
    !byte $14, $55, $31, $11, $55, $54, $15, $53, $10                 ; 488c: 14 55 31... .U1
    !text "UUQE1"                                                     ; 4895: 55 55 51... UUQ
    !byte 5                                                           ; 489a: 05          .
    !text "UQEN!UU"                                                   ; 489b: 55 51 45... UQE
    !byte $15, $0e, $a1, $51, $54, $80, $ea, $85, $55, $13, $a8       ; 48a2: 15 0e a1... ...
    !text "UQS"                                                       ; 48ad: 55 51 53    UQS
    !byte $a1, $50,   8, $14, $e8, $52, $aa, $a1, $3a, $85, $2a, $a1  ; 48b0: a1 50 08... .P.
    !byte $4e, $a8, $52, $aa, $0e, $aa, $0c, $f7,   0, $11, $16, $aa  ; 48bc: 4e a8 52... N.R
    !byte $aa, $aa, $a8,   3, $aa, $aa, $aa, $a1, $54, $ea, $aa, $80  ; 48c8: aa aa a8... ...
    !byte $a1, $55, $4e, $0a,   1                                     ; 48d4: a1 55 4e... .UN
    !text "PUT"                                                       ; 48d9: 50 55 54    PUT
    !byte $c5,   4                                                    ; 48dc: c5 04       ..
    !text "UEUS"                                                      ; 48de: 55 45 55... UEU
    !byte $15                                                         ; 48e2: 15          .
    !text "QUUALUQ"                                                   ; 48e3: 51 55 55... QUU
    !byte $15                                                         ; 48ea: 15          .
    !text "EU1"                                                       ; 48eb: 45 55 31    EU1
    !byte $15                                                         ; 48ee: 15          .
    !text "DUT"                                                       ; 48ef: 44 55 54    DUT
    !byte $13, $10                                                    ; 48f2: 13 10       ..
    !text "QEUU8EAQUN"                                                ; 48f4: 51 45 55... QEU
    !byte $11, $55, $55, $15, $0e, $11, $51, $54, $80, $e8, $85, $55  ; 48fe: 11 55 55... .UU
    !byte $3a, $a8, $55, $13, $aa, $a0,   5, $3a, $aa, $a1, $4e, $aa  ; 490a: 3a a8 55... :.U
    !byte $aa, $0c, $f3,   0, $17, $16, $aa, $aa, $a3, $aa, $aa, $84  ; 4916: aa 0c f3... ...
    !byte $ea, $aa, $a1, $4e, $aa, $aa, $14, $ea, $aa,   5, $2a,   0  ; 4922: ea aa a1... ...
    !byte $ea, $a8, $54, $a8, $55, $3a, $aa, $15                      ; 492e: ea a8 54... ..T
    !text "HUS"                                                       ; 4936: 48 55 53    HUS
    !byte $82, $80, $54, $14                                          ; 4939: 82 80 54... ..T
    !text "U1AQQ"                                                     ; 493d: 55 31 41... U1A
    !byte $15, $54, $c5                                               ; 4942: 15 54 c5    .T.
    !text "UUTQS"                                                     ; 4945: 55 55 54... UUT
    !byte $15                                                         ; 494a: 15          .
    !text "UUQULEUUE"                                                 ; 494b: 55 55 51... UUQ
    !byte $14, $c4, $15                                               ; 4954: 14 c4 15    ...
    !text "UTUN"                                                      ; 4957: 55 54 55... UTU
    !byte $11                                                         ; 495b: 11          .
    !text "UTQS"                                                      ; 495c: 55 54 51... UTQ
    !byte $84                                                         ; 4960: 84          .
    !text "UUEC"                                                      ; 4961: 55 55 45... UUE
    !byte $84                                                         ; 4965: 84          .
    !text "TU :!UC"                                                   ; 4966: 54 55 20... TU
    !byte $aa, $85, $51, $4e, $aa, $80, $15, $4e, $aa, $aa, $80, $53  ; 496d: aa 85 51... ..Q
    !byte $aa, $aa, $aa, $84, $ea, $aa, $aa, $a1, $3a, $aa, $aa, $aa  ; 4979: aa aa aa... ...
    !byte $30, $ef,   1, $1a, $0e, $aa, $83, $a8, $14, $3a, $15, $54  ; 4985: 30 ef 01... 0..
    !byte $e1, $55, $54, $e1, $54, $44, $e1                           ; 4991: e1 55 54... .UT
    !text "TE8UUN"                                                    ; 4998: 54 45 38... TE8
    !byte $15, $55, $53, $a1, $40, $14, $ea, $11, $14, $e8, $54, $53  ; 499e: 15 55 53... .US
    !byte $85, $55,   0, $c5                                          ; 49aa: 85 55 00... .U.
    !text "UQLUUE1P"                                                  ; 49ae: 55 51 4c... UQL
    !byte $15, $44, $c5, $55, $15, $0e, $14, $11, $13, $80, $51, $54  ; 49b6: 15 44 c5... .D.
    !byte $e1                                                         ; 49c2: e1          .
    !text "UU:"                                                       ; 49c3: 55 55 3a    UU:
    !byte $15, $55, $3a, $15, $54, $e1, $54, $0e, $15, $14, $e8, $54  ; 49c6: 15 55 3a... .U:
    !byte $53, $a8, $14, $3a, $a8, $30, $f7,   0, $11, $16, $aa, $a0  ; 49d2: 53 a8 14... S..
    !byte $aa, $a8,   3, $aa, $85, $2a, $a1, $54, $ea, $85,   0, $a1  ; 49de: aa a8 03... ...
    !byte $55, $4e, $0a, $15                                          ; 49ea: 55 4e 0a... UN.
    !text "PUT"                                                       ; 49ee: 50 55 54    PUT
    !byte $c5,   4,   5                                               ; 49f1: c5 04 05    ...
    !text "EUS"                                                       ; 49f4: 45 55 53    EUS
    !byte $15                                                         ; 49f7: 15          .
    !text "UEQELUUU"                                                  ; 49f8: 55 45 51... UEQ
    !byte $15, $55, $31, $15, $55, $54, $14, $53, $10                 ; 4a00: 15 55 31... .U1
    !text "UUQU8EUQUN"                                                ; 4a09: 55 55 51... UUQ
    !byte $11, $55, $55, $15, $0e, $11, $51, $54, $80, $e8, $85, $55  ; 4a13: 11 55 55... .UU
    !byte $3a, $a8, $55, $3a, $aa,   0, $3a, $aa, $85, $3a, $aa, $a0  ; 4a1f: 3a a8 55... :.U
    !byte $c0,   0, $0e, $18, $15, $aa, $aa, $aa,   0,   0, $ea, $aa  ; 4a2b: c0 00 0e... ...
    !byte $aa, $14, $55, $4e,   0,   0,   1, $45, $54, $c5, $55, $55  ; 4a37: aa 14 55... ..U
    !byte $14                                                         ; 4a43: 14          .
    !text "ELDDA"                                                     ; 4a44: 45 4c 44... ELD
    !byte $14, $44, $e0,   0,   0, $14, $44, $4e, $a1, $55,   0, $45  ; 4a49: 14 44 e0... .D.
    !byte $44, $ea, $80,   0, $14, $55, $4e, $aa, $aa, $a1, $45, $14  ; 4a55: 44 ea 80... D..
    !byte $ea, $aa, $aa, $14, $51, $4e, $aa, $aa, $a0, $44, $54, $ea  ; 4a61: ea aa aa... ...
    !byte $aa, $aa, $14, $45, $4e, $aa, $aa, $a1, $44, $44, $ea, $aa  ; 4a6d: aa aa 14... ...
    !byte $aa, $14, $54, $4e, $aa, $aa, $a1, $45, $44, $ea, $aa, $aa  ; 4a79: aa 14 54... ..T
    !byte $10, $44, $4e, $a8,   0,   1, $44, $54, $ea, $15, $50, $14  ; 4a85: 10 44 4e... .DN
    !byte $45, $4e,   0,   0,   1, $15, $14, $c5, $55, $55, $14       ; 4a91: 45 4e 00... EN.
    !text "QLDDAET"                                                   ; 4a9c: 51 4c 44... QLD
    !byte $e0,   0,   0, $14, $45, $4e, $aa, $aa, $a1, $45, $54, $ea  ; 4aa3: e0 00 00... ...
    !byte $aa, $aa, $80,   0, $30                                     ; 4aaf: aa aa 80... ...
pydis_end

; Label references by decreasing frequency:
;     l003c:       34
;     l003d:       32
;     l1abb:       29
;     l0030:       19
;     l1e44:       13
;     l0a72:       11
;     l003e:       10
;     l0a70:       10
;     l0031:        8
;     l0a02:        8
;     l0a04:        8
;     c3ed7:        8
;     l09ff:        7
;     l0a01:        7
;     l38f6:        7
;     some_data1:   7
;     l09be:        6
;     l0a71:        6
;     l132b:        6
;     l1db9:        6
;     l0051:        5
;     l0a73:        5
;     l1f57:        5
;     l1f5d:        5
;     l28e2:        5
;     l38ac:        5
;     l395e:        5
;     c41ae:        5
;     c4355:        5
;     l003b:        4
;     l0a00:        4
;     l0a6f:        4
;     some_code2:   4
;     c41d9:        4
;     c4415:        4
;     l0070:        3
;     l09a8:        3
;     l09aa:        3
;     l09ab:        3
;     l09ac:        3
;     l1140:        3
;     l12bb:        3
;     l12da:        3
;     l1988:        3
;     l1aba:        3
;     l1b90:        3
;     l1f4c:        3
;     l2bbd:        3
;     l2eb6:        3
;     l38c2:        3
;     c3ca8:        3
;     c3d20:        3
;     c3f8a:        3
;     c419f:        3
;     c4339:        3
;     l0040:        2
;     l0041:        2
;     l0950:        2
;     l0966:        2
;     l0a03:        2
;     l1f6d:        2
;     l2433:        2
;     l38d8:        2
;     l396f:        2
;     c3b0e:        2
;     c3e11:        2
;     c3e69:        2
;     sub_c3ef1:    2
;     c3f51:        2
;     l3fd5:        2
;     l3fd6:        2
;     some_data2:   2
;     l40e3:        2
;     c412e:        2
;     c415e:        2
;     c418c:        2
;     c4194:        2
;     c41c9:        2
;     c4235:        2
;     c432f:        2
;     c43a0:        2
;     l001d:        1
;     l003a:        1
;     l0042:        1
;     l0052:        1
;     l0954:        1
;     l097c:        1
;     l0980:        1
;     l0992:        1
;     l1103:        1
;     l1a10:        1
;     l1ebb:        1
;     l23a9:        1
;     l24d0:        1
;     l24d1:        1
;     l2551:        1
;     l2894:        1
;     l2ee9:        1
;     l2eee:        1
;     l2ef3:        1
;     l38ae:        1
;     l3970:        1
;     c3b04:        1
;     loop_c3bd4:   1
;     sub_c3be4:    1
;     c3bec:        1
;     c3bf7:        1
;     c3c74:        1
;     c3c77:        1
;     c3c81:        1
;     c3c91:        1
;     c3cb9:        1
;     c3cc3:        1
;     c3cd9:        1
;     c3ce1:        1
;     c3ce7:        1
;     c3cfb:        1
;     sub_c3dfc:    1
;     c3e55:        1
;     c3e6c:        1
;     c3ec1:        1
;     c3ed2:        1
;     c3ed4:        1
;     c3ee4:        1
;     c3eed:        1
;     l3eee:        1
;     sub_c3f02:    1
;     c3f52:        1
;     c3f62:        1
;     loop_c4044:   1
;     sub_c407f:    1
;     c40b2:        1
;     c40c1:        1
;     c40e0:        1
;     c40e4:        1
;     c40ee:        1
;     c40f7:        1
;     c412b:        1
;     c4137:        1
;     c4167:        1
;     c4184:        1
;     c41c1:        1
;     c420c:        1
;     c4224:        1
;     c424c:        1
;     loop_c42ea:   1
;     sub_c42f8:    1
;     c4352:        1
;     c4358:        1
;     c4386:        1
;     c43b4:        1
;     c43ce:        1
;     c43d4:        1
;     c43e3:        1
;     c43f6:        1

; Automatically generated labels:
;     c3b04
;     c3b0e
;     c3bec
;     c3bf7
;     c3c74
;     c3c77
;     c3c81
;     c3c91
;     c3ca8
;     c3cb9
;     c3cc3
;     c3cd9
;     c3ce1
;     c3ce7
;     c3cfb
;     c3d20
;     c3e11
;     c3e55
;     c3e69
;     c3e6c
;     c3ec1
;     c3ed2
;     c3ed4
;     c3ed7
;     c3ee4
;     c3eed
;     c3f51
;     c3f52
;     c3f62
;     c3f8a
;     c40b2
;     c40c1
;     c40e0
;     c40e4
;     c40ee
;     c40f7
;     c412b
;     c412e
;     c4137
;     c415e
;     c4167
;     c4184
;     c418c
;     c4194
;     c419f
;     c41ae
;     c41c1
;     c41c9
;     c41d9
;     c420c
;     c4224
;     c4235
;     c424c
;     c432f
;     c4339
;     c4352
;     c4355
;     c4358
;     c4386
;     c43a0
;     c43b4
;     c43ce
;     c43d4
;     c43e3
;     c43f6
;     c4415
;     l001d
;     l0030
;     l0031
;     l003a
;     l003b
;     l003c
;     l003d
;     l003e
;     l0040
;     l0041
;     l0042
;     l0051
;     l0052
;     l0070
;     l0950
;     l0954
;     l0966
;     l097c
;     l0980
;     l0992
;     l09a8
;     l09aa
;     l09ab
;     l09ac
;     l09be
;     l09ff
;     l0a00
;     l0a01
;     l0a02
;     l0a03
;     l0a04
;     l0a6f
;     l0a70
;     l0a71
;     l0a72
;     l0a73
;     l1103
;     l1140
;     l12bb
;     l12da
;     l132b
;     l1988
;     l1a10
;     l1aba
;     l1abb
;     l1b90
;     l1db9
;     l1e44
;     l1ebb
;     l1f4c
;     l1f57
;     l1f5d
;     l1f6d
;     l23a9
;     l2433
;     l24d0
;     l24d1
;     l2551
;     l2894
;     l28e2
;     l2bbd
;     l2eb6
;     l2ee9
;     l2eee
;     l2ef3
;     l38ac
;     l38ae
;     l38c2
;     l38d8
;     l38f6
;     l395e
;     l396f
;     l3970
;     l3eee
;     l3fd5
;     l3fd6
;     l40e3
;     loop_c3bd4
;     loop_c4044
;     loop_c42ea
;     sub_c3be4
;     sub_c3dfc
;     sub_c3ef1
;     sub_c3f02
;     sub_c407f
;     sub_c42f8
!if (fourth_level_handler) != $3b27 {
    !error "Assertion failed: fourth_level_handler == $3b27"
}
!if (level_init_after_load_handler) != $3af2 {
    !error "Assertion failed: level_init_after_load_handler == $3af2"
}
!if (second_level_handler) != $3b17 {
    !error "Assertion failed: second_level_handler == $3b17"
}
!if (third_level_handler) != $3ae7 {
    !error "Assertion failed: third_level_handler == $3ae7"
}
