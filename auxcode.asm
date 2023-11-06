; Constants
fixed_eor_key   = 203
vdu_cr          = 13
vdu_lf          = 10

; Memory locations
l0005               = $05
l0070               = $70
l0071               = $71
l0072               = $72
l040a               = $040a
l0453               = $0453
string_input_buffer = $0a90
l1966               = $1966
l37f3               = $37f3
l388d               = $388d
oswrch              = $ffee

    * = $53c0

; TODO: This is comparing an eor-encrypted string - probably a level 'password' -
; against the string buffer. Not quite clear yet how this matches against multiple
; correct passwords.
pydis_start
    ldy #0                                                            ; 53c0: a0 00       ..
    sty l0005                                                         ; 53c2: 84 05       ..
    sty l0072                                                         ; 53c4: 84 72       .r
    lda #<level_name_ptr_table                                        ; 53c6: a9 4f       .O
    sta l0070                                                         ; 53c8: 85 70       .p
    lda #>level_name_ptr_table                                        ; 53ca: a9 54       .T
    sta l0071                                                         ; 53cc: 85 71       .q
c53ce
    lda (l0070),y                                                     ; 53ce: b1 70       .p
    eor #$cb                                                          ; 53d0: 49 cb       I.
    cmp string_input_buffer,y                                         ; 53d2: d9 90 0a    ...
    bne c5414                                                         ; 53d5: d0 3d       .=
    iny                                                               ; 53d7: c8          .
    cmp #vdu_cr                                                       ; 53d8: c9 0d       ..
    bne c53ce                                                         ; 53da: d0 f2       ..
    lda (l0070),y                                                     ; 53dc: b1 70       .p
    tax                                                               ; 53de: aa          .
    iny                                                               ; 53df: c8          .
    lda (l0070),y                                                     ; 53e0: b1 70       .p
    tay                                                               ; 53e2: a8          .
; TODO: At this point we have the level pointer for the successfully matched password
; in YX
    lda l0072                                                         ; 53e3: a5 72       .r
    pha                                                               ; 53e5: 48          H
    txa                                                               ; 53e6: 8a          .
    pha                                                               ; 53e7: 48          H
    tya                                                               ; 53e8: 98          .
    pha                                                               ; 53e9: 48          H
    jsr l040a                                                         ; 53ea: 20 0a 04     ..
    lda #$0a                                                          ; 53ed: a9 0a       ..
    jsr oswrch                                                        ; 53ef: 20 ee ff     ..            ; Write character 10
    ldx #7                                                            ; 53f2: a2 07       ..
    ldy #$54 ; 'T'                                                    ; 53f4: a0 54       .T
    jsr l37f3                                                         ; 53f6: 20 f3 37     .7
    jsr l388d                                                         ; 53f9: 20 8d 38     .8
    jsr l0453                                                         ; 53fc: 20 53 04     S.
    pla                                                               ; 53ff: 68          h
    tay                                                               ; 5400: a8          .
    pla                                                               ; 5401: 68          h
    tax                                                               ; 5402: aa          .
    pla                                                               ; 5403: 68          h
    jmp l1966                                                         ; 5404: 4c 66 19    Lf.

    !byte $8a, $a8, $a8, $ae, $bb, $bf, $ae, $af, $c6                 ; 5407: 8a a8 a8... ...

loop_c5410
    lda (l0070),y                                                     ; 5410: b1 70       .p
    eor #fixed_eor_key                                                ; 5412: 49 cb       I.
c5414
    iny                                                               ; 5414: c8          .
    cmp #vdu_cr                                                       ; 5415: c9 0d       ..
    bne loop_c5410                                                    ; 5417: d0 f7       ..
    iny                                                               ; 5419: c8          .
    tya                                                               ; 541a: 98          .
    adc l0070                                                         ; 541b: 65 70       ep
    sta l0070                                                         ; 541d: 85 70       .p
    lda l0071                                                         ; 541f: a5 71       .q
    adc #0                                                            ; 5421: 69 00       i.
    sta l0071                                                         ; 5423: 85 71       .q
    inc l0072                                                         ; 5425: e6 72       .r
    ldy #0                                                            ; 5427: a0 00       ..
    lda (l0070),y                                                     ; 5429: b1 70       .p
    eor #fixed_eor_key                                                ; 542b: 49 cb       I.
    bne c53ce                                                         ; 542d: d0 9f       ..
    jsr l040a                                                         ; 542f: 20 0a 04     ..
    lda #vdu_lf                                                       ; 5432: a9 0a       ..
    jsr oswrch                                                        ; 5434: 20 ee ff     ..            ; Write character 10
    ldx #<unknown_encrypted_string                                    ; 5437: a2 46       .F
    ldy #>unknown_encrypted_string                                    ; 5439: a0 54       .T
    jsr l37f3                                                         ; 543b: 20 f3 37     .7
    jsr l388d                                                         ; 543e: 20 8d 38     .8
    lda #0                                                            ; 5441: a9 00       ..
    jmp c544e                                                         ; 5443: 4c 4e 54    LNT

; 'Unknown\r' EOR-encrypted with $cb
unknown_encrypted_string
    !byte $9e, $a5, $a0, $a5, $a4, $bc, $a5, $c6                      ; 5446: 9e a5 a0... ...

c544e
    rts                                                               ; 544e: 60          `

; TODO: Needs properly decoding, but this EOR-$CB encrypted data starts:
; SAXOPHOBIA\r^\x9e
; TIME-FLIES\r^\x9e
; So it looks like this is a table of level names, probably CR-terminated with a 16-bit
; pointer following each. '^' is $5e. Actually I suspect the pointers should *not* be
; EOR-ed, just the text. Note that \r EOR $cb is $c6, so it's easy-ish to pick the
; pointers out of the raw data by eye.
level_name_ptr_table
    !byte $98, $8a, $93, $84, $9b, $83, $84, $89, $82, $8a, $c6       ; 544f: 98 8a 93... ...            ;  ; EOR-encrypted: 'SAXOPHOBIA'
    !word $5595                                                       ; 545a: 95 55       .U
    !byte $9f, $82, $86, $8e, $e6, $8d, $87, $82, $8e, $98, $c6       ; 545c: 9f 82 86... ...            ;  ; EOR-encrypted: 'TIME-FLIES'
    !word $5595                                                       ; 5467: 95 55       .U
    !byte $8d, $82, $99, $8e, $e6, $9c, $84, $99, $80, $98, $c6       ; 5469: 8d 82 99... ...            ;  ; EOR-encrypted: 'FIRE-WORKS'
    !word $5595                                                       ; 5474: 95 55       .U
    !byte $8c, $85, $9e, $e6, $9b, $99, $84, $89, $87, $8e, $86, $c6  ; 5476: 8c 85 9e... ...            ;  ; EOR-encrypted: 'GNU-PROBLEM'
    !word $5595                                                       ; 5482: 95 55       .U
    !byte $8f, $9e, $88, $80, $e6, $8e, $8c, $8c, $e6, $89, $87, $9e  ; 5484: 8f 9e 88... ...            ;  ; EOR-encrypted: 'DUCK-EGG-BLUES'
    !byte $8e, $98, $c6                                               ; 5490: 8e 98 c6    ...
    !word $5595                                                       ; 5493: 95 55       .U
    !byte $8d, $84, $87, $87, $84, $9c, $e6, $86, $8e, $c6            ; 5495: 8d 84 87... ...            ;  ; EOR-encrypted: 'FOLLOW-ME'
    !word $5595                                                       ; 549f: 95 55       .U
    !byte $89, $8a, $87, $87, $84, $84, $85, $8a, $88, $92, $c6       ; 54a1: 89 8a 87... ...            ;  ; EOR-encrypted: 'BALLOONACY'
    !word $5595                                                       ; 54ac: 95 55       .U
    !byte $8a, $9b, $9b, $87, $8e, $98, $84, $9e, $99, $88, $8e, $c6  ; 54ae: 8a 9b 9b... ...            ;  ; EOR-encrypted: 'APPLESOURCE'
    !word $5595                                                       ; 54ba: 95 55       .U
    !byte $98, $8e, $8e, $e6, $98, $9c, $84, $99, $8f, $c6            ; 54bc: 98 8e 8e... ...            ;  ; EOR-encrypted: 'SEE-SWORD'
    !word $5595                                                       ; 54c6: 95 55       .U
    !byte $89, $8a, $89, $89, $84, $84, $85, $8a, $88, $92, $c6       ; 54c8: 89 8a 89... ...            ;  ; EOR-encrypted: 'BABBOONACY'
    !word $5595                                                       ; 54d3: 95 55       .U
    !byte $8f, $99, $82, $9b, $9b, $82, $85, $8c, $e6, $98, $9f, $9e  ; 54d5: 8f 99 82... ...            ;  ; EOR-encrypted: 'DRIPPING-STUFF'
    !byte $8d, $8d, $c6                                               ; 54e1: 8d 8d c6    ...
    !word $5595                                                       ; 54e4: 95 55       .U
    !byte $9c, $83, $82, $9b, $e6, $82, $9f, $c6                      ; 54e6: 9c 83 82... ...            ;  ; EOR-encrypted: 'WHIP-IT'
    !word $5595                                                       ; 54ee: 95 55       .U
    !byte $83, $8a, $86, $98, $9f, $8e, $99, $e6, $81, $8a, $86, $c6  ; 54f0: 83 8a 86... ...            ;  ; EOR-encrypted: 'HAMSTER-JAM'
    !word $5595                                                       ; 54fc: 95 55       .U
    !byte $9b, $8a, $9d, $87, $84, $9d, $e6, $9c, $8a, $98, $e6, $83  ; 54fe: 9b 8a 9d... ...            ;  ; EOR-encrypted: 'PAVLOV-WAS-HERE'
    !byte $8e, $99, $8e, $c6                                          ; 550a: 8e 99 8e... ...
    !word $5595                                                       ; 550e: 95 55       .U
    !byte $8f, $84, $9c, $85, $e6, $8a, $85, $8f, $e6, $84, $9e, $9f  ; 5510: 8f 84 9c... ...            ;  ; EOR-encrypted: 'DOWN-AND-OUT'
    !byte $c6                                                         ; 551c: c6          .
    !word $5595                                                       ; 551d: 95 55       .U
    !byte $9f, $8e, $85, $8f, $8e, $99, $e6, $83, $84, $84, $80, $98  ; 551f: 9f 8e 85... ...            ;  ; EOR-encrypted: 'TENDER-HOOKS'
    !byte $c6                                                         ; 552b: c6          .
    !word $5595                                                       ; 552c: 95 55       .U
    !byte $8e, $9b, $82, $87, $84, $8c, $9e, $8e, $c6, $9b, $55, $8f  ; 552e: 8e 9b 82... ...
    !byte $9e, $86, $9b, $c6, $42, $56, $86, $84, $85, $84, $c6, $ea  ; 553a: 9e 86 9b... ...
    !byte $55, $88, $84, $87, $84, $9e, $99, $c6,   3, $56, $9a, $9e  ; 5546: 55 88 84... U..
    !byte $82, $9f, $c6, $aa, $55, $85, $84, $99, $86, $8a, $87, $e6  ; 5552: 82 9f c6... ...
    !byte $86, $84, $8f, $8e, $c6, $af, $55, $99, $8e, $9d, $82, $8e  ; 555e: 86 84 8f... ...
    !byte $9c, $e6, $86, $84, $8f, $8e, $c6, $b4, $55, $9f, $8e, $98  ; 556a: 9c e6 86... ...
    !byte $9f, $e6, $86, $84, $8f, $8e, $c6, $b9, $55, $8f, $8e, $89  ; 5576: 9f e6 86... ...
    !byte $9e, $8c, $e6, $86, $84, $8f, $8e, $c6, $be, $55, $8c, $82  ; 5582: 9e 8c e6... ...
    !byte $86, $86, $8e, $c6, $1c, $56, $cb, $18                      ; 558e: 86 86 8e... ...
    !text "iALNT"                                                     ; 5596: 69 41 4c... iAL
    !byte $a2, $51, $ad,   3, $11, $29,   2, $d0,   2, $a2,   1, $8a  ; 559b: a2 51 ad... .Q.
    !text "LNT"                                                       ; 55a7: 4c 4e 54    LNT
    !byte $a9, $ff                                                    ; 55aa: a9 ff       ..
    !text "LNT"                                                       ; 55ac: 4c 4e 54    LNT
    !byte $a9,   0, $4c, $c0, $55, $a9,   2, $4c, $c0, $55, $a9,   3  ; 55af: a9 00 4c... ..L
    !byte $4c, $c0, $55, $a9, $83, $8d,   3, $11, $a2,   0, $a0,   3  ; 55bb: 4c c0 55... L.U
    !byte $29,   1, $f0,   8, $a5, $5b, $f0,   4, $a2, $4c, $a0,   1  ; 55c7: 29 01 f0... )..
    !byte $98, $48, $a9, $f7, $a0,   0, $20, $f4, $ff, $68, $aa, $a9  ; 55d3: 98 48 a9... .H.
    !byte $c8, $a0,   0, $20, $f4, $ff, $a9,   1                      ; 55df: c8 a0 00... ...
    !text "LNT"                                                       ; 55e7: 4c 4e 54    LNT
    !byte $a9,   0, $8d, $65, $17, $20, $66, $17, $ad, $5d, $17, $8d  ; 55ea: a9 00 8d... ...
    !byte $5e, $17, $ad, $5f, $17, $8d, $60, $17, $a9,   1            ; 55f6: 5e 17 ad... ^..
    !text "LNT"                                                       ; 5600: 4c 4e 54    LNT
    !byte $a9, $ff, $8d, $65, $17, $20, $66, $17, $ad, $5d, $17, $8d  ; 5603: a9 ff 8d... ...
    !byte $5e, $17, $ad, $5f, $17, $8d, $60, $17, $a9,   1            ; 560f: 5e 17 ad... ^..
    !text "LNT"                                                       ; 5619: 4c 4e 54    LNT
    !byte $ad,   3, $11, $29,   1, $f0, $12, $a0, $0f, $b9, $ef,   9  ; 561c: ad 03 11... ...
    !byte   9, $80, $99, $ef,   9, $88, $10, $f5, $a9, $21, $20, $bd  ; 5628: 09 80 99... ...
    !byte $2b, $a9,   1                                               ; 5634: 2b a9 01    +..
    !text "LNT"                                                       ; 5637: 4c 4e 54    LNT
    !byte   1,   2,   4,   8, $10, $20, $40, $80, $ad,   3, $11, $29  ; 563a: 01 02 04... ...
    !byte   2, $d0,   5, $a9,   1                                     ; 5646: 02 d0 05... ...
    !text "LNT"                                                       ; 564b: 4c 4e 54    LNT
    !byte $a9,   2, $20, $ee, $ff, $a9,   1, $20, $ee, $ff, $a9, $1b  ; 564e: a9 02 20... ..
    !byte $20, $ee, $ff, $a9,   1, $20, $ee, $ff, $a9, $40, $20, $ee  ; 565a: 20 ee ff...  ..
    !byte $ff, $a9,   1, $20, $ee, $ff, $a9, $0a, $20, $ee, $ff, $a9  ; 5666: ff a9 01... ...
    !byte   1, $20, $ee, $ff, $a9, $1b, $20, $ee, $ff, $a9,   1, $20  ; 5672: 01 20 ee... . .
    !byte $ee, $ff, $a9, $6c, $20, $ee, $ff, $a9,   1, $20, $ee, $ff  ; 567e: ee ff a9... ...
    !byte $a9, $11, $20, $ee, $ff, $a9,   1, $20, $ee, $ff, $a9, $1b  ; 568a: a9 11 20... ..
    !byte $20, $ee, $ff, $a9,   1, $20, $ee, $ff, $a9, $41, $20, $ee  ; 5696: 20 ee ff...  ..
    !byte $ff, $a9,   1, $20, $ee, $ff, $a9,   8, $20, $ee, $ff, $a9  ; 56a2: ff a9 01... ...
    !byte $c0, $85, $70, $a9, $5b, $85, $71, $a9, $ff, $85, $74, $a9  ; 56ae: c0 85 70... ..p
    !byte   1, $20, $ee, $ff, $a9, $1b, $20, $ee, $ff, $a9,   1, $20  ; 56ba: 01 20 ee... . .
    !byte $ee, $ff, $a9, $2a, $20, $ee, $ff, $a9,   1, $20, $ee, $ff  ; 56c6: ee ff a9... ...
    !byte $a9,   5, $20, $ee, $ff, $a9,   1, $20, $ee, $ff, $a9, $40  ; 56d2: a9 05 20... ..
    !byte $20, $ee, $ff, $a9,   1, $20, $ee, $ff, $20, $ee, $ff, $a9  ; 56de: 20 ee ff...  ..
    !byte $28, $85, $72, $d0,   3, $18, $90, $c7, $a2,   7, $a0,   0  ; 56ea: 28 85 72... (.r
    !byte $84, $73,   6, $73, $b1                                     ; 56f6: 84 73 06... .s.
    !text "p=:V"                                                      ; 56fb: 70 3d 3a... p=:
    !byte $d0,   2, $e6, $73, $c8, $c0,   8, $d0, $f0, $a9,   1, $20  ; 56ff: d0 02 e6... ...
    !byte $ee, $ff, $a5                                               ; 570b: ee ff a5    ...
    !text "sEt "                                                      ; 570e: 73 45 74... sEt
    !byte $ee, $ff, $ca, $10, $dd, $18, $a5, $70, $69,   8, $85, $70  ; 5712: ee ff ca... ...
    !byte $90, $0c, $e6, $71, $a5, $71, $c5, $4c, $d0,   4, $a9,   0  ; 571e: 90 0c e6... ...
    !byte $85, $74, $c6, $72, $d0, $c2, $a9,   1, $20, $ee, $ff, $a9  ; 572a: 85 74 c6... .t.
    !byte $0a, $20, $ee, $ff, $a5, $71, $c9, $80, $90, $af, $a9,   1  ; 5736: 0a 20 ee... . .
    !byte $20, $ee, $ff, $a9, $0a, $20, $ee, $ff, $a9,   1, $20, $ee  ; 5742: 20 ee ff...  ..
    !byte $ff, $a9, $1b, $20, $ee, $ff, $a9,   1, $20, $ee, $ff, $a9  ; 574e: ff a9 1b... ...
    !byte $40, $20, $ee, $ff, $a0, $0c, $a9,   1, $20, $ee, $ff, $a9  ; 575a: 40 20 ee... @ .
    !byte $0a, $20, $ee, $ff, $88, $d0, $f3, $a9,   1, $20, $ee, $ff  ; 5766: 0a 20 ee... . .
    !byte $a9,   7, $20, $ee, $ff, $a9,   3, $20, $ee, $ff, $a9, $0f  ; 5772: a9 07 20... ..
    !byte $a2,   1, $20, $f4, $ff, $20, $8f, $3a, $a9,   1            ; 577e: a2 01 20... ..
    !text "LNT"                                                       ; 5788: 4c 4e 54    LNT
pydis_end

; Automatically generated labels:
;     c53ce
;     c5414
;     c544e
;     l0005
;     l0070
;     l0071
;     l0072
;     l040a
;     l0453
;     l1966
;     l37f3
;     l388d
;     loop_c5410
!if (<level_name_ptr_table) != $4f {
    !error "Assertion failed: <level_name_ptr_table == $4f"
}
!if (<unknown_encrypted_string) != $46 {
    !error "Assertion failed: <unknown_encrypted_string == $46"
}
!if (>level_name_ptr_table) != $54 {
    !error "Assertion failed: >level_name_ptr_table == $54"
}
!if (>unknown_encrypted_string) != $54 {
    !error "Assertion failed: >unknown_encrypted_string == $54"
}
!if (fixed_eor_key) != $cb {
    !error "Assertion failed: fixed_eor_key == $cb"
}
!if (vdu_cr) != $0d {
    !error "Assertion failed: vdu_cr == $0d"
}
!if (vdu_lf) != $0a {
    !error "Assertion failed: vdu_lf == $0a"
}
