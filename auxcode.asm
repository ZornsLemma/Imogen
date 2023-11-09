; Constants
first_level_letter                             = 65
fixed_eor_key                                  = 203
last_level_letter                              = 81
osbyte_flush_buffer_class                      = 15
osbyte_read_write_escape_break_effect          = 200
osbyte_read_write_first_byte_break_intercept   = 247
vdu_cr                                         = 13
vdu_lf                                         = 10

; Memory locations
l0005                                   = $05
desired_room_index                      = $30
desired_level                           = $31
l004c                                   = $4c
previous_level                          = $51
l005b                                   = $5b
l0070                                   = $70
l0071                                   = $71
l0072                                   = $72
l0073                                   = $73
l0074                                   = $74
l040a                                   = $040a
l0453                                   = $0453
l09ef                                   = $09ef
string_input_buffer                     = $0a90
developer_flags                         = $1103
initialise_level                        = $1140
something23_TODO                        = $12bb
something24_TODO                        = $12da
some_data_shared_between_g_and_dataA    = $132b
pending_toolbar_colour                  = $175d
toolbar_colour                          = $175e
pending_gameplay_area_colour            = $175f
gameplay_area_colour                    = $1760
use_colour_flag                         = $1765
l1766                                   = $1766
l1966                                   = $1966
something13_TODO                        = $1988
something14_TODO                        = $1a10
current_room_index                      = $1aba
something51_TODO                        = $1abb
something26_TODO                        = $1b90
something53_TODO                        = $1db9
something54_TODO                        = $1e44
something60_TODO                        = $1ebb
draw_sprite_a_at_character_xy           = $1f4c
something52_TODO                        = $1f57
something58_TODO                        = $1f5d
something57_TODO                        = $1f6d
something61_TODO                        = $23a9
something59_TODO                        = $2894
something55_TODO                        = $28e2
insert_character_menu_item_into_toolbar = $2b87
find_or_create_menu_slot_for_A          = $2bbd
remove_item_from_toolbar_menu           = $2be0
l37f3                                   = $37f3
l388d                                   = $388d
l3a8f                                   = $3a8f
level_data                              = $3ad5
level_init_after_load_handler_ptr       = $3ad7
second_level_handler_ptr                = $3ad9
level_name_ptr                          = $3adb
level_header_data                       = $3adf
oswrch                                  = $ffee
osbyte                                  = $fff4

    * = $53c0

; Check a password entered by the user at string_buffer against the list of EOR-
; encrypted paswords at level_name_ptr_table and invoke the corresponding handler if a
; match is found. Otherwise generate an error.
auxcode
check_password
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
    bne this_entry_doesnt_match                                       ; 53d5: d0 3d       .=
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

skip_rest_of_entry
    lda (l0070),y                                                     ; 5410: b1 70       .p
    eor #fixed_eor_key                                                ; 5412: 49 cb       I.
this_entry_doesnt_match
    iny                                                               ; 5414: c8          .
    cmp #vdu_cr                                                       ; 5415: c9 0d       ..
    bne skip_rest_of_entry                                            ; 5417: d0 f7       ..
    iny                                                               ; 5419: c8          .
    tya                                                               ; 541a: 98          .
    adc l0070                                                         ; 541b: 65 70       ep             ; effectively adds l0070+1 as cmp # above set Z and thus C: TODO: correct?
    sta l0070                                                         ; 541d: 85 70       .p
    lda l0071                                                         ; 541f: a5 71       .q
    adc #0                                                            ; 5421: 69 00       i.
    sta l0071                                                         ; 5423: 85 71       .q
    inc l0072                                                         ; 5425: e6 72       .r
    ldy #0                                                            ; 5427: a0 00       ..
    lda (l0070),y                                                     ; 5429: b1 70       .p
    eor #fixed_eor_key                                                ; 542b: 49 cb       I.
    bne c53ce                                                         ; 542d: d0 9f       ..
; None of the passwords in the table matched.
    jsr l040a                                                         ; 542f: 20 0a 04     ..
    lda #vdu_lf                                                       ; 5432: a9 0a       ..
    jsr oswrch                                                        ; 5434: 20 ee ff     ..            ; Write character 10
    ldx #<unknown_encrypted_string                                    ; 5437: a2 46       .F
    ldy #>unknown_encrypted_string                                    ; 5439: a0 54       .T
    jsr l37f3                                                         ; 543b: 20 f3 37     .7
    jsr l388d                                                         ; 543e: 20 8d 38     .8
    lda #0                                                            ; 5441: a9 00       ..
    jmp return1                                                       ; 5443: 4c 4e 54    LNT

; 'Unknown\r' EOR-encrypted with $cb
unknown_encrypted_string
    !byte $9e, $a5, $a0, $a5, $a4, $bc, $a5, $c6                      ; 5446: 9e a5 a0... ...

return1
    rts                                                               ; 544e: 60          `

level_name_ptr_table
    !byte $98, $8a, $93, $84, $9b, $83, $84, $89, $82, $8a, $c6       ; 544f: 98 8a 93... ...            ; EOR-encrypted string: 'SAXOPHOBIA'
    !word normal_level_handler                                        ; 545a: 95 55       .U
    !byte $9f, $82, $86, $8e, $e6, $8d, $87, $82, $8e, $98, $c6       ; 545c: 9f 82 86... ...            ; EOR-encrypted string: 'TIME-FLIES'
    !word normal_level_handler                                        ; 5467: 95 55       .U
    !byte $8d, $82, $99, $8e, $e6, $9c, $84, $99, $80, $98, $c6       ; 5469: 8d 82 99... ...            ; EOR-encrypted string: 'FIRE-WORKS'
    !word normal_level_handler                                        ; 5474: 95 55       .U
    !byte $8c, $85, $9e, $e6, $9b, $99, $84, $89, $87, $8e, $86, $c6  ; 5476: 8c 85 9e... ...            ; EOR-encrypted string: 'GNU-PROBLEM'
    !word normal_level_handler                                        ; 5482: 95 55       .U
    !byte $8f, $9e, $88, $80, $e6, $8e, $8c, $8c, $e6, $89, $87, $9e  ; 5484: 8f 9e 88... ...            ; EOR-encrypted string: 'DUCK-EGG-BLUES'
    !byte $8e, $98, $c6                                               ; 5490: 8e 98 c6    ...
    !word normal_level_handler                                        ; 5493: 95 55       .U
    !byte $8d, $84, $87, $87, $84, $9c, $e6, $86, $8e, $c6            ; 5495: 8d 84 87... ...            ; EOR-encrypted string: 'FOLLOW-ME'
    !word normal_level_handler                                        ; 549f: 95 55       .U
    !byte $89, $8a, $87, $87, $84, $84, $85, $8a, $88, $92, $c6       ; 54a1: 89 8a 87... ...            ; EOR-encrypted string: 'BALLOONACY'
    !word normal_level_handler                                        ; 54ac: 95 55       .U
    !byte $8a, $9b, $9b, $87, $8e, $98, $84, $9e, $99, $88, $8e, $c6  ; 54ae: 8a 9b 9b... ...            ; EOR-encrypted string: 'APPLESOURCE'
    !word normal_level_handler                                        ; 54ba: 95 55       .U
    !byte $98, $8e, $8e, $e6, $98, $9c, $84, $99, $8f, $c6            ; 54bc: 98 8e 8e... ...            ; EOR-encrypted string: 'SEE-SWORD'
    !word normal_level_handler                                        ; 54c6: 95 55       .U
    !byte $89, $8a, $89, $89, $84, $84, $85, $8a, $88, $92, $c6       ; 54c8: 89 8a 89... ...            ; EOR-encrypted string: 'BABBOONACY'
    !word normal_level_handler                                        ; 54d3: 95 55       .U
    !byte $8f, $99, $82, $9b, $9b, $82, $85, $8c, $e6, $98, $9f, $9e  ; 54d5: 8f 99 82... ...            ; EOR-encrypted string: 'DRIPPING-STUFF'
    !byte $8d, $8d, $c6                                               ; 54e1: 8d 8d c6    ...
    !word normal_level_handler                                        ; 54e4: 95 55       .U
    !byte $9c, $83, $82, $9b, $e6, $82, $9f, $c6                      ; 54e6: 9c 83 82... ...            ; EOR-encrypted string: 'WHIP-IT'
    !word normal_level_handler                                        ; 54ee: 95 55       .U
    !byte $83, $8a, $86, $98, $9f, $8e, $99, $e6, $81, $8a, $86, $c6  ; 54f0: 83 8a 86... ...            ; EOR-encrypted string: 'HAMSTER-JAM'
    !word normal_level_handler                                        ; 54fc: 95 55       .U
    !byte $9b, $8a, $9d, $87, $84, $9d, $e6, $9c, $8a, $98, $e6, $83  ; 54fe: 9b 8a 9d... ...            ; EOR-encrypted string: 'PAVLOV-WAS-HERE'
    !byte $8e, $99, $8e, $c6                                          ; 550a: 8e 99 8e... ...
    !word normal_level_handler                                        ; 550e: 95 55       .U
    !byte $8f, $84, $9c, $85, $e6, $8a, $85, $8f, $e6, $84, $9e, $9f  ; 5510: 8f 84 9c... ...            ; EOR-encrypted string: 'DOWN-AND-OUT'
    !byte $c6                                                         ; 551c: c6          .
    !word normal_level_handler                                        ; 551d: 95 55       .U
    !byte $9f, $8e, $85, $8f, $8e, $99, $e6, $83, $84, $84, $80, $98  ; 551f: 9f 8e 85... ...            ; EOR-encrypted string: 'TENDER-HOOKS'
    !byte $c6                                                         ; 552b: c6          .
    !word normal_level_handler                                        ; 552c: 95 55       .U
; TODO: Some intriguing secret passwords here. Now I see this, I have a vague
; recollection of The Micro User or Acorn User printing some/all of these, but still
; cool to find them for myself. :-)
    !byte $8e, $9b, $82, $87, $84, $8c, $9e, $8e, $c6                 ; 552e: 8e 9b 82... ...            ; EOR-encrypted string: 'EPILOGUE'
    !word epilogue_handler                                            ; 5537: 9b 55       .U
    !byte $8f, $9e, $86, $9b, $c6                                     ; 5539: 8f 9e 86... ...            ; EOR-encrypted string: 'DUMP'
    !word dump_handler                                                ; 553e: 42 56       BV
    !byte $86, $84, $85, $84, $c6                                     ; 5540: 86 84 85... ...            ; EOR-encrypted string: 'MONO'
    !word mono_handler                                                ; 5545: ea 55       .U
    !byte $88, $84, $87, $84, $9e, $99, $c6                           ; 5547: 88 84 87... ...            ; EOR-encrypted string: 'COLOUR'
    !word colour_handler                                              ; 554e: 03 56       .V
    !byte $9a, $9e, $82, $9f, $c6                                     ; 5550: 9a 9e 82... ...            ; EOR-encrypted string: 'QUIT'
    !word quit_handler                                                ; 5555: aa 55       .U
    !byte $85, $84, $99, $86, $8a, $87, $e6, $86, $84, $8f, $8e, $c6  ; 5557: 85 84 99... ...            ; EOR-encrypted string: 'NORMAL-MODE'
    !word normal_mode_handler                                         ; 5563: af 55       .U
    !byte $99, $8e, $9d, $82, $8e, $9c, $e6, $86, $84, $8f, $8e, $c6  ; 5565: 99 8e 9d... ...            ; EOR-encrypted string: 'REVIEW-MODE'
    !word review_mode_handler                                         ; 5571: b4 55       .U
    !byte $9f, $8e, $98, $9f, $e6, $86, $84, $8f, $8e, $c6            ; 5573: 9f 8e 98... ...            ; EOR-encrypted string: 'TEST-MODE'
    !word test_mode_handler                                           ; 557d: b9 55       .U
    !byte $8f, $8e, $89, $9e, $8c, $e6, $86, $84, $8f, $8e, $c6       ; 557f: 8f 8e 89... ...            ; EOR-encrypted string: 'DEBUG-MODE'
    !word debug_mode_handler                                          ; 558a: be 55       .U
    !byte $8c, $82, $86, $86, $8e, $c6                                ; 558c: 8c 82 86... ...            ; EOR-encrypted string: 'GIMME'
    !word gimme_handler                                               ; 5592: 1c 56       .V
    !byte $cb                                                         ; 5594: cb          .              ; 0 EOR $CB marks the end of the table

normal_level_handler
    clc                                                               ; 5595: 18          .
    adc #first_level_letter                                           ; 5596: 69 41       iA
    jmp return1                                                       ; 5598: 4c 4e 54    LNT

epilogue_handler
    ldx #last_level_letter                                            ; 559b: a2 51       .Q
    lda developer_flags                                               ; 559d: ad 03 11    ...
    and #2                                                            ; 55a0: 29 02       ).
    bne c55a6                                                         ; 55a2: d0 02       ..
    ldx #1                                                            ; 55a4: a2 01       ..
c55a6
    txa                                                               ; 55a6: 8a          .
    jmp return1                                                       ; 55a7: 4c 4e 54    LNT

quit_handler
    lda #$ff                                                          ; 55aa: a9 ff       ..
    jmp return1                                                       ; 55ac: 4c 4e 54    LNT

normal_mode_handler
    lda #0                                                            ; 55af: a9 00       ..
    jmp c55c0                                                         ; 55b1: 4c c0 55    L.U

review_mode_handler
    lda #2                                                            ; 55b4: a9 02       ..
    jmp c55c0                                                         ; 55b6: 4c c0 55    L.U

test_mode_handler
    lda #3                                                            ; 55b9: a9 03       ..
    jmp c55c0                                                         ; 55bb: 4c c0 55    L.U

debug_mode_handler
    lda #$83                                                          ; 55be: a9 83       ..
c55c0
    sta developer_flags                                               ; 55c0: 8d 03 11    ...
    ldx #0                                                            ; 55c3: a2 00       ..
    ldy #3                                                            ; 55c5: a0 03       ..
    and #1                                                            ; 55c7: 29 01       ).
    beq c55d3                                                         ; 55c9: f0 08       ..
    lda l005b                                                         ; 55cb: a5 5b       .[
    beq c55d3                                                         ; 55cd: f0 04       ..
    ldx #$4c ; 'L'                                                    ; 55cf: a2 4c       .L
    ldy #1                                                            ; 55d1: a0 01       ..
c55d3
    tya                                                               ; 55d3: 98          .
    pha                                                               ; 55d4: 48          H
    lda #osbyte_read_write_first_byte_break_intercept                 ; 55d5: a9 f7       ..
    ldy #0                                                            ; 55d7: a0 00       ..
    jsr osbyte                                                        ; 55d9: 20 f4 ff     ..            ; Write reset intercept code (opcode), value X=76
    pla                                                               ; 55dc: 68          h
    tax                                                               ; 55dd: aa          .
    lda #osbyte_read_write_escape_break_effect                        ; 55de: a9 c8       ..
    ldy #0                                                            ; 55e0: a0 00       ..
    jsr osbyte                                                        ; 55e2: 20 f4 ff     ..            ; Write ESCAPE+BREAK effects
    lda #1                                                            ; 55e5: a9 01       ..
    jmp return1                                                       ; 55e7: 4c 4e 54    LNT

mono_handler
    lda #0                                                            ; 55ea: a9 00       ..
    sta use_colour_flag                                               ; 55ec: 8d 65 17    .e.
    jsr l1766                                                         ; 55ef: 20 66 17     f.
    lda pending_toolbar_colour                                        ; 55f2: ad 5d 17    .].
    sta toolbar_colour                                                ; 55f5: 8d 5e 17    .^.
    lda pending_gameplay_area_colour                                  ; 55f8: ad 5f 17    ._.
    sta gameplay_area_colour                                          ; 55fb: 8d 60 17    .`.
    lda #1                                                            ; 55fe: a9 01       ..
    jmp return1                                                       ; 5600: 4c 4e 54    LNT

colour_handler
    lda #$ff                                                          ; 5603: a9 ff       ..
    sta use_colour_flag                                               ; 5605: 8d 65 17    .e.
    jsr l1766                                                         ; 5608: 20 66 17     f.
    lda pending_toolbar_colour                                        ; 560b: ad 5d 17    .].
    sta toolbar_colour                                                ; 560e: 8d 5e 17    .^.
    lda pending_gameplay_area_colour                                  ; 5611: ad 5f 17    ._.
    sta gameplay_area_colour                                          ; 5614: 8d 60 17    .`.
    lda #1                                                            ; 5617: a9 01       ..
    jmp return1                                                       ; 5619: 4c 4e 54    LNT

gimme_handler
    lda developer_flags                                               ; 561c: ad 03 11    ...
    and #1                                                            ; 561f: 29 01       ).
    beq c5635                                                         ; 5621: f0 12       ..
    ldy #$0f                                                          ; 5623: a0 0f       ..
loop_c5625
    lda l09ef,y                                                       ; 5625: b9 ef 09    ...
    ora #$80                                                          ; 5628: 09 80       ..
    sta l09ef,y                                                       ; 562a: 99 ef 09    ...
    dey                                                               ; 562d: 88          .
    bpl loop_c5625                                                    ; 562e: 10 f5       ..
    lda #$21 ; '!'                                                    ; 5630: a9 21       .!
    jsr find_or_create_menu_slot_for_A                                ; 5632: 20 bd 2b     .+
c5635
    lda #1                                                            ; 5635: a9 01       ..
    jmp return1                                                       ; 5637: 4c 4e 54    LNT

power_of_2_table
    !byte $01, $02, $04, $08, $10, $20, $40, $80                      ; 563a: 01 02 04... ...

; TODO: Presumably a screen dump routine for Epson-compatible printers
dump_handler
    lda developer_flags                                               ; 5642: ad 03 11    ...
    and #2                                                            ; 5645: 29 02       ).
    bne c564e                                                         ; 5647: d0 05       ..
    lda #1                                                            ; 5649: a9 01       ..
    jmp return1                                                       ; 564b: 4c 4e 54    LNT

c564e
    lda #2                                                            ; 564e: a9 02       ..
    jsr oswrch                                                        ; 5650: 20 ee ff     ..            ; Write character 2
    lda #1                                                            ; 5653: a9 01       ..
    jsr oswrch                                                        ; 5655: 20 ee ff     ..            ; Write character 1
    lda #$1b                                                          ; 5658: a9 1b       ..
    jsr oswrch                                                        ; 565a: 20 ee ff     ..            ; Write character 27
    lda #1                                                            ; 565d: a9 01       ..
    jsr oswrch                                                        ; 565f: 20 ee ff     ..            ; Write character 1
    lda #$40 ; '@'                                                    ; 5662: a9 40       .@
    jsr oswrch                                                        ; 5664: 20 ee ff     ..            ; Write character 64
    lda #1                                                            ; 5667: a9 01       ..
    jsr oswrch                                                        ; 5669: 20 ee ff     ..            ; Write character 1
    lda #$0a                                                          ; 566c: a9 0a       ..
    jsr oswrch                                                        ; 566e: 20 ee ff     ..            ; Write character 10
    lda #1                                                            ; 5671: a9 01       ..
    jsr oswrch                                                        ; 5673: 20 ee ff     ..            ; Write character 1
    lda #$1b                                                          ; 5676: a9 1b       ..
    jsr oswrch                                                        ; 5678: 20 ee ff     ..            ; Write character 27
    lda #1                                                            ; 567b: a9 01       ..
    jsr oswrch                                                        ; 567d: 20 ee ff     ..            ; Write character 1
    lda #$6c ; 'l'                                                    ; 5680: a9 6c       .l
    jsr oswrch                                                        ; 5682: 20 ee ff     ..            ; Write character 108
    lda #1                                                            ; 5685: a9 01       ..
    jsr oswrch                                                        ; 5687: 20 ee ff     ..            ; Write character 1
    lda #$11                                                          ; 568a: a9 11       ..
    jsr oswrch                                                        ; 568c: 20 ee ff     ..            ; Write character 17
    lda #1                                                            ; 568f: a9 01       ..
    jsr oswrch                                                        ; 5691: 20 ee ff     ..            ; Write character 1
    lda #$1b                                                          ; 5694: a9 1b       ..
    jsr oswrch                                                        ; 5696: 20 ee ff     ..            ; Write character 27
    lda #1                                                            ; 5699: a9 01       ..
    jsr oswrch                                                        ; 569b: 20 ee ff     ..            ; Write character 1
    lda #$41 ; 'A'                                                    ; 569e: a9 41       .A
    jsr oswrch                                                        ; 56a0: 20 ee ff     ..            ; Write character 65
    lda #1                                                            ; 56a3: a9 01       ..
    jsr oswrch                                                        ; 56a5: 20 ee ff     ..            ; Write character 1
    lda #8                                                            ; 56a8: a9 08       ..
    jsr oswrch                                                        ; 56aa: 20 ee ff     ..            ; Write character 8
    lda #$c0                                                          ; 56ad: a9 c0       ..
    sta l0070                                                         ; 56af: 85 70       .p
    lda #$5b ; '['                                                    ; 56b1: a9 5b       .[
    sta l0071                                                         ; 56b3: 85 71       .q
    lda #$ff                                                          ; 56b5: a9 ff       ..
    sta l0074                                                         ; 56b7: 85 74       .t
c56b9
    lda #1                                                            ; 56b9: a9 01       ..
    jsr oswrch                                                        ; 56bb: 20 ee ff     ..            ; Write character 1
    lda #$1b                                                          ; 56be: a9 1b       ..
    jsr oswrch                                                        ; 56c0: 20 ee ff     ..            ; Write character 27
    lda #1                                                            ; 56c3: a9 01       ..
    jsr oswrch                                                        ; 56c5: 20 ee ff     ..            ; Write character 1
    lda #$2a ; '*'                                                    ; 56c8: a9 2a       .*
    jsr oswrch                                                        ; 56ca: 20 ee ff     ..            ; Write character 42
    lda #1                                                            ; 56cd: a9 01       ..
    jsr oswrch                                                        ; 56cf: 20 ee ff     ..            ; Write character 1
    lda #5                                                            ; 56d2: a9 05       ..
    jsr oswrch                                                        ; 56d4: 20 ee ff     ..            ; Write character 5
    lda #1                                                            ; 56d7: a9 01       ..
    jsr oswrch                                                        ; 56d9: 20 ee ff     ..            ; Write character 1
    lda #$40 ; '@'                                                    ; 56dc: a9 40       .@
    jsr oswrch                                                        ; 56de: 20 ee ff     ..            ; Write character 64
    lda #1                                                            ; 56e1: a9 01       ..
    jsr oswrch                                                        ; 56e3: 20 ee ff     ..            ; Write character 1
    jsr oswrch                                                        ; 56e6: 20 ee ff     ..            ; Write character
    lda #$28 ; '('                                                    ; 56e9: a9 28       .(
    sta l0072                                                         ; 56eb: 85 72       .r
    bne c56f2                                                         ; 56ed: d0 03       ..
c56ef
    clc                                                               ; 56ef: 18          .
    bcc c56b9                                                         ; 56f0: 90 c7       ..
c56f2
    ldx #7                                                            ; 56f2: a2 07       ..
c56f4
    ldy #0                                                            ; 56f4: a0 00       ..
    sty l0073                                                         ; 56f6: 84 73       .s
loop_c56f8
    asl l0073                                                         ; 56f8: 06 73       .s
    lda (l0070),y                                                     ; 56fa: b1 70       .p
    and power_of_2_table,x                                            ; 56fc: 3d 3a 56    =:V
    bne c5703                                                         ; 56ff: d0 02       ..
    inc l0073                                                         ; 5701: e6 73       .s
c5703
    iny                                                               ; 5703: c8          .
    cpy #8                                                            ; 5704: c0 08       ..
    bne loop_c56f8                                                    ; 5706: d0 f0       ..
    lda #1                                                            ; 5708: a9 01       ..
    jsr oswrch                                                        ; 570a: 20 ee ff     ..            ; Write character 1
    lda l0073                                                         ; 570d: a5 73       .s
    eor l0074                                                         ; 570f: 45 74       Et
    jsr oswrch                                                        ; 5711: 20 ee ff     ..            ; Write character
    dex                                                               ; 5714: ca          .
    bpl c56f4                                                         ; 5715: 10 dd       ..
    clc                                                               ; 5717: 18          .
    lda l0070                                                         ; 5718: a5 70       .p
    adc #8                                                            ; 571a: 69 08       i.
    sta l0070                                                         ; 571c: 85 70       .p
    bcc c572c                                                         ; 571e: 90 0c       ..
    inc l0071                                                         ; 5720: e6 71       .q
    lda l0071                                                         ; 5722: a5 71       .q
    cmp l004c                                                         ; 5724: c5 4c       .L
    bne c572c                                                         ; 5726: d0 04       ..
    lda #0                                                            ; 5728: a9 00       ..
    sta l0074                                                         ; 572a: 85 74       .t
c572c
    dec l0072                                                         ; 572c: c6 72       .r
    bne c56f2                                                         ; 572e: d0 c2       ..
    lda #1                                                            ; 5730: a9 01       ..
    jsr oswrch                                                        ; 5732: 20 ee ff     ..            ; Write character 1
    lda #$0a                                                          ; 5735: a9 0a       ..
    jsr oswrch                                                        ; 5737: 20 ee ff     ..            ; Write character 10
    lda l0071                                                         ; 573a: a5 71       .q
    cmp #$80                                                          ; 573c: c9 80       ..
    bcc c56ef                                                         ; 573e: 90 af       ..
    lda #1                                                            ; 5740: a9 01       ..
    jsr oswrch                                                        ; 5742: 20 ee ff     ..            ; Write character 1
    lda #$0a                                                          ; 5745: a9 0a       ..
    jsr oswrch                                                        ; 5747: 20 ee ff     ..            ; Write character 10
    lda #1                                                            ; 574a: a9 01       ..
    jsr oswrch                                                        ; 574c: 20 ee ff     ..            ; Write character 1
    lda #$1b                                                          ; 574f: a9 1b       ..
    jsr oswrch                                                        ; 5751: 20 ee ff     ..            ; Write character 27
    lda #1                                                            ; 5754: a9 01       ..
    jsr oswrch                                                        ; 5756: 20 ee ff     ..            ; Write character 1
    lda #$40 ; '@'                                                    ; 5759: a9 40       .@
    jsr oswrch                                                        ; 575b: 20 ee ff     ..            ; Write character 64
    ldy #$0c                                                          ; 575e: a0 0c       ..
loop_c5760
    lda #1                                                            ; 5760: a9 01       ..
    jsr oswrch                                                        ; 5762: 20 ee ff     ..            ; Write character 1
    lda #$0a                                                          ; 5765: a9 0a       ..
    jsr oswrch                                                        ; 5767: 20 ee ff     ..            ; Write character 10
    dey                                                               ; 576a: 88          .
    bne loop_c5760                                                    ; 576b: d0 f3       ..
    lda #1                                                            ; 576d: a9 01       ..
    jsr oswrch                                                        ; 576f: 20 ee ff     ..            ; Write character 1
    lda #7                                                            ; 5772: a9 07       ..
    jsr oswrch                                                        ; 5774: 20 ee ff     ..            ; Write character 7
    lda #3                                                            ; 5777: a9 03       ..
    jsr oswrch                                                        ; 5779: 20 ee ff     ..            ; Write character 3
    lda #osbyte_flush_buffer_class                                    ; 577c: a9 0f       ..
    ldx #1                                                            ; 577e: a2 01       ..
    jsr osbyte                                                        ; 5780: 20 f4 ff     ..            ; Flush input buffers (X non-zero)
    jsr l3a8f                                                         ; 5783: 20 8f 3a     .:
    lda #1                                                            ; 5786: a9 01       ..
    jmp return1                                                       ; 5788: 4c 4e 54    LNT

pydis_end

; Automatically generated labels:
;     c53ce
;     c55a6
;     c55c0
;     c55d3
;     c5635
;     c564e
;     c56b9
;     c56ef
;     c56f2
;     c56f4
;     c5703
;     c572c
;     l0005
;     l004c
;     l005b
;     l0070
;     l0071
;     l0072
;     l0073
;     l0074
;     l040a
;     l0453
;     l09ef
;     l1766
;     l1966
;     l37f3
;     l388d
;     l3a8f
;     loop_c5625
;     loop_c56f8
;     loop_c5760
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
!if (colour_handler) != $5603 {
    !error "Assertion failed: colour_handler == $5603"
}
!if (debug_mode_handler) != $55be {
    !error "Assertion failed: debug_mode_handler == $55be"
}
!if (dump_handler) != $5642 {
    !error "Assertion failed: dump_handler == $5642"
}
!if (epilogue_handler) != $559b {
    !error "Assertion failed: epilogue_handler == $559b"
}
!if (first_level_letter) != $41 {
    !error "Assertion failed: first_level_letter == $41"
}
!if (fixed_eor_key) != $cb {
    !error "Assertion failed: fixed_eor_key == $cb"
}
!if (gimme_handler) != $561c {
    !error "Assertion failed: gimme_handler == $561c"
}
!if (last_level_letter) != $51 {
    !error "Assertion failed: last_level_letter == $51"
}
!if (mono_handler) != $55ea {
    !error "Assertion failed: mono_handler == $55ea"
}
!if (normal_level_handler) != $5595 {
    !error "Assertion failed: normal_level_handler == $5595"
}
!if (normal_mode_handler) != $55af {
    !error "Assertion failed: normal_mode_handler == $55af"
}
!if (osbyte_flush_buffer_class) != $0f {
    !error "Assertion failed: osbyte_flush_buffer_class == $0f"
}
!if (osbyte_read_write_escape_break_effect) != $c8 {
    !error "Assertion failed: osbyte_read_write_escape_break_effect == $c8"
}
!if (osbyte_read_write_first_byte_break_intercept) != $f7 {
    !error "Assertion failed: osbyte_read_write_first_byte_break_intercept == $f7"
}
!if (quit_handler) != $55aa {
    !error "Assertion failed: quit_handler == $55aa"
}
!if (review_mode_handler) != $55b4 {
    !error "Assertion failed: review_mode_handler == $55b4"
}
!if (test_mode_handler) != $55b9 {
    !error "Assertion failed: test_mode_handler == $55b9"
}
!if (vdu_cr) != $0d {
    !error "Assertion failed: vdu_cr == $0d"
}
!if (vdu_lf) != $0a {
    !error "Assertion failed: vdu_lf == $0a"
}
