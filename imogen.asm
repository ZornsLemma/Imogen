; Constants
crtc_cursor_start                       = 10
crtc_interlace_delay                    = 8
crtc_screen_start_high                  = 12
crtc_screen_start_low                   = 13
crtc_vert_displayed                     = 6
crtc_vert_sync_pos                      = 7
first_level_letter                      = 65
game_area_height_cells                  = 24
game_area_width_cells                   = 40
jmp_indirect_opcode                     = 108
jsr_opcode                              = 32
last_level_letter                       = 81
load_address                            = 14592
opcode_jmp                              = 76
osbyte_opt                              = 139
osbyte_read_write_escape_break_effect   = 200
osbyte_tv                               = 144
osbyte_vsync                            = 19
osfile                                  = 65501
osword_read_char                        = 10
relocate_address                        = 4608
screen_start                            = 25088
vdu_disable                             = 21
vdu_goto_xy                             = 31
vdu_set_mode                            = 22

; Memory locations
l0000                                               = &0000
l0001                                               = &0001
l0002                                               = &0002
l0003                                               = &0003
l0004                                               = &0004
password_characters_entered                         = &0005
desired_room_index                                  = &0030
desired_level                                       = &0031
width_in_cells                                      = &003c
height_in_cells                                     = &003d
value_to_write_to_collision_map                     = &003e
source_sprite_memory_low                            = &0040
source_sprite_memory_high                           = &0041
previous_room_index                                 = &0050
previous_level                                      = &0051
developer_mode_sideways_ram_is_set_up_flag          = &005b
l0070                                               = &0070
l0071                                               = &0071
l0072                                               = &0072
l0073                                               = &0073
l0074                                               = &0074
l0076                                               = &0076
l0080                                               = &0080
l0081                                               = &0081
l0082                                               = &0082
l0086                                               = &0086
l0087                                               = &0087
l0088                                               = &0088
show_dialog_box                                     = &040a
remove_dialog                                       = &0453
level_progress_table                                = &09ef
string_input_buffer                                 = &0a90
eight_entry_table2                                  = &0aa9
developer_flags                                     = &1103
initialise_level                                    = &1140
draw_rope                                           = &1db9
write_value_to_a_rectangle_of_cells_in_collision_map = &1e44
write_a_single_value_to_cell_in_collision_map       = &1ebb
draw_sprite_a_at_cell_xy                            = &1f4c
draw_sprite_a_at_cell_xy_and_write_to_collision_map = &1f57
set_object_position_from_cell_xy                    = &1f5d
set_object_position_from_current_sprite_position    = &1f6d
play_landing_sound                                  = &23a9
something59_TODO                                    = &2894
something55_TODO                                    = &28e2
insert_character_menu_item_into_toolbar             = &2b87
find_or_create_menu_slot_for_A                      = &2bbd
remove_item_from_toolbar_menu                       = &2be0
print_encrypted_string_at_yx_centred                = &37f3
wait_one_second_then_check_keys                     = &388d
check_cursor_left_right_and_space                   = &3a8f
level_data                                          = &3ad5
level_init_after_load_handler_ptr                   = &3ad7
second_level_handler_ptr                            = &3ad9
level_name_ptr                                      = &3adb
level_header_data                                   = &3adf
auxcode                                             = &53c0
check_password                                      = &53c0
crtc_address_register                               = &fe00
crtc_address_write                                  = &fe01
oswrch                                              = &ffee
osword                                              = &fff1
osbyte                                              = &fff4
oscli                                               = &fff7

    org &1200

.relocate
.pydis_start
    lda #0                                                            ; 1200: a9 00       ..
    sta l0070                                                         ; 1202: 85 70       .p
    sta l0072                                                         ; 1204: 85 72       .r
    lda #>relocate_address                                            ; 1206: a9 12       ..
    sta l0071                                                         ; 1208: 85 71       .q
    lda #>load_address                                                ; 120a: a9 39       .9
    sta l0073                                                         ; 120c: 85 73       .s
    ldy #0                                                            ; 120e: a0 00       ..
; &1210 referenced 2 times by &1215, &121f
.relocate_loop
    lda (l0072),y                                                     ; 1210: b1 72       .r
    sta (l0070),y                                                     ; 1212: 91 70       .p
    iny                                                               ; 1214: c8          .
    bne relocate_loop                                                 ; 1215: d0 f9       ..
    inc l0071                                                         ; 1217: e6 71       .q
    inc l0073                                                         ; 1219: e6 73       .s
    lda l0073                                                         ; 121b: a5 73       .s
    cmp #>(load_address + (pydis_end - pydis_start))                  ; 121d: c9 43       .C
    bne relocate_loop                                                 ; 121f: d0 ef       ..
    jmp post_relocate_init                                            ; 1221: 4c 34 12    L4.

    equb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0               ; 1224: 00 00 00... ...

; &1234 referenced 1 time by &1221
.post_relocate_init
    lda #osbyte_opt                                                   ; 1234: a9 8b       ..
    ldx #0                                                            ; 1236: a2 00       ..
    ldy #0                                                            ; 1238: a0 00       ..
    jsr osbyte                                                        ; 123a: 20 f4 ff     ..            ; *OPT 0,0: Reset all options for current filing system
; Redundant LDX/LDY here; drive_0_command is not actually used.
    ldx #<drive_0_command                                             ; 123d: a2 8d       ..
    ldy #>drive_0_command                                             ; 123f: a0 13       ..
    ldx #<dir_dollar_command                                          ; 1241: a2 95       ..
    ldy #>dir_dollar_command                                          ; 1243: a0 13       ..
    jsr oscli                                                         ; 1245: 20 f7 ff     ..
    lda #osbyte_read_write_escape_break_effect                        ; 1248: a9 c8       ..
    ldx #1                                                            ; 124a: a2 01       ..
    ldy #0                                                            ; 124c: a0 00       ..
    jsr osbyte                                                        ; 124e: 20 f4 ff     ..            ; Write Disable ESCAPE action, set normal BREAK action, value X=1
; Set up a reduced-height mode 4 screen with 24 character lines starting at address
; &6200, respecting the user's current vertical shift as set by *TV.
    lda #osbyte_tv                                                    ; 1251: a9 90       ..
    ldx #0                                                            ; 1253: a2 00       ..
    ldy #0                                                            ; 1255: a0 00       ..
    jsr osbyte                                                        ; 1257: 20 f4 ff     ..            ; *TV 0,0 turn interlace on
    stx l0070                                                         ; 125a: 86 70       .p             ; X is the previous screen shift setting
    jsr osbyte                                                        ; 125c: 20 f4 ff     ..
    lda #vdu_set_mode                                                 ; 125f: a9 16       ..
    jsr oswrch                                                        ; 1261: 20 ee ff     ..            ; Write character 22
    lda #4                                                            ; 1264: a9 04       ..
    jsr oswrch                                                        ; 1266: 20 ee ff     ..            ; Write character 4
    lda #crtc_cursor_start                                            ; 1269: a9 0a       ..
    sta crtc_address_register                                         ; 126b: 8d 00 fe    ...
    lda #&20 ; ' '                                                    ; 126e: a9 20       .
    sta crtc_address_write                                            ; 1270: 8d 01 fe    ...
    lda #&23 ; '#'                                                    ; 1273: a9 23       .#
    clc                                                               ; 1275: 18          .
    adc l0070                                                         ; 1276: 65 70       ep
    sec                                                               ; 1278: 38          8
    sbc #6                                                            ; 1279: e9 06       ..
    tax                                                               ; 127b: aa          .
    lda #crtc_vert_sync_pos                                           ; 127c: a9 07       ..
    sta crtc_address_register                                         ; 127e: 8d 00 fe    ...
    stx crtc_address_write                                            ; 1281: 8e 01 fe    ...
    lda #crtc_screen_start_low                                        ; 1284: a9 0d       ..
    sta crtc_address_register                                         ; 1286: 8d 00 fe    ...
    lda #<(screen_start DIV 8)                                        ; 1289: a9 40       .@
    sta crtc_address_write                                            ; 128b: 8d 01 fe    ...
    lda #crtc_screen_start_high                                       ; 128e: a9 0c       ..
    sta crtc_address_register                                         ; 1290: 8d 00 fe    ...
    lda #>(screen_start DIV 8)                                        ; 1293: a9 0c       ..
    sta crtc_address_write                                            ; 1295: 8d 01 fe    ...
    lda #crtc_vert_displayed                                          ; 1298: a9 06       ..
    sta crtc_address_register                                         ; 129a: 8d 00 fe    ...
    lda #game_area_height_cells                                       ; 129d: a9 18       ..
    sta crtc_address_write                                            ; 129f: 8d 01 fe    ...
    lda #crtc_interlace_delay                                         ; 12a2: a9 08       ..
    sta crtc_address_register                                         ; 12a4: 8d 00 fe    ...
    lda #0                                                            ; 12a7: a9 00       ..
    sta crtc_address_write                                            ; 12a9: 8d 01 fe    ...
    lda #&14                                                          ; 12ac: a9 14       ..
    jsr sub_c139b                                                     ; 12ae: 20 9b 13     ..
    ldx #8                                                            ; 12b1: a2 08       ..
    ldy #&80                                                          ; 12b3: a0 80       ..
    sty l0074                                                         ; 12b5: 84 74       .t
    lda #&e8                                                          ; 12b7: a9 e8       ..
    sec                                                               ; 12b9: 38          8
.sub_c12ba
something23_TODO = sub_c12ba+1
    sbc l0074                                                         ; 12ba: e5 74       .t
    sta l0070                                                         ; 12bc: 85 70       .p
    lda #&13                                                          ; 12be: a9 13       ..
    sbc #0                                                            ; 12c0: e9 00       ..
    sta l0071                                                         ; 12c2: 85 71       .q
    lda #&40 ; '@'                                                    ; 12c4: a9 40       .@
    sec                                                               ; 12c6: 38          8
    sbc l0074                                                         ; 12c7: e5 74       .t
    sta l0072                                                         ; 12c9: 85 72       .r
    lda #&68 ; 'h'                                                    ; 12cb: a9 68       .h
    sbc #0                                                            ; 12cd: e9 00       ..
    sta l0073                                                         ; 12cf: 85 73       .s
; &12d1 referenced 2 times by &12d6, &12dd
.c12d1
    lda (l0070),y                                                     ; 12d1: b1 70       .p
    sta (l0072),y                                                     ; 12d3: 91 72       .r
    iny                                                               ; 12d5: c8          .
    bne c12d1                                                         ; 12d6: d0 f9       ..
    inc l0071                                                         ; 12d8: e6 71       .q
.something24_TODO
    inc l0073                                                         ; 12da: e6 73       .s
    dex                                                               ; 12dc: ca          .
    bne c12d1                                                         ; 12dd: d0 f2       ..
    lda #vdu_goto_xy                                                  ; 12df: a9 1f       ..
    jsr oswrch                                                        ; 12e1: 20 ee ff     ..            ; Write character 31
    lda #6                                                            ; 12e4: a9 06       ..
    jsr oswrch                                                        ; 12e6: 20 ee ff     ..            ; Write character 6
    lda #&15                                                          ; 12e9: a9 15       ..
    jsr oswrch                                                        ; 12eb: 20 ee ff     ..            ; Write character 21
    ldy #0                                                            ; 12ee: a0 00       ..
; &12f0 referenced 1 time by &12fb
.loop_c12f0
    lda written_by_string,y                                           ; 12f0: b9 a9 13    ...
    cmp #&0d                                                          ; 12f3: c9 0d       ..
    beq c12fe                                                         ; 12f5: f0 07       ..
    jsr sub_c134d                                                     ; 12f7: 20 4d 13     M.
    iny                                                               ; 12fa: c8          .
    jmp loop_c12f0                                                    ; 12fb: 4c f0 12    L..

; &12fe referenced 1 time by &12f5
.c12fe
    lda #vdu_goto_xy                                                  ; 12fe: a9 1f       ..
    jsr oswrch                                                        ; 1300: 20 ee ff     ..            ; Write character 31
    lda #3                                                            ; 1303: a9 03       ..
    jsr oswrch                                                        ; 1305: 20 ee ff     ..            ; Write character 3
    lda #&17                                                          ; 1308: a9 17       ..
    jsr oswrch                                                        ; 130a: 20 ee ff     ..            ; Write character 23
    ldy #0                                                            ; 130d: a0 00       ..
; &130f referenced 1 time by &131a
.loop_c130f
    lda copyright_string,y                                            ; 130f: b9 c5 13    ...
    cmp #&0d                                                          ; 1312: c9 0d       ..
    beq c131d                                                         ; 1314: f0 07       ..
    jsr sub_c134d                                                     ; 1316: 20 4d 13     M.
    iny                                                               ; 1319: c8          .
    jmp loop_c130f                                                    ; 131a: 4c 0f 13    L..

; &131d referenced 1 time by &1314
.c131d
    lda #vdu_disable                                                  ; 131d: a9 15       ..
    jsr oswrch                                                        ; 131f: 20 ee ff     ..            ; Write character 21
; Obfuscated code to load the 'G' file and transfer control to its execution address,
; relying on the fact that OSFILE &FF will have filled in the execution address at &76
; after loading the file.
    lda #jsr_opcode                                                   ; 1322: a9 20       .
    sta l0000                                                         ; 1324: 85 00       ..
    lda #<osfile                                                      ; 1326: a9 dd       ..
    sta l0001                                                         ; 1328: 85 01       ..
.sub_c132a
some_data_shared_between_g_and_dataA = sub_c132a+1
    lda #>osfile                                                      ; 132a: a9 ff       ..
    sta l0002                                                         ; 132c: 85 02       ..
    lda #jmp_indirect_opcode                                          ; 132e: a9 6c       .l
    sta l0003                                                         ; 1330: 85 03       ..
    lda #&76 ; 'v'                                                    ; 1332: a9 76       .v
    sta l0004                                                         ; 1334: 85 04       ..
    lda #0                                                            ; 1336: a9 00       ..
    sta password_characters_entered                                   ; 1338: 85 05       ..
    lda #<osfile_load_filename                                        ; 133a: a9 a7       ..
    sta l0070                                                         ; 133c: 85 70       .p
    lda #>osfile_load_filename                                        ; 133e: a9 13       ..
    sta l0071                                                         ; 1340: 85 71       .q
; Set A=&FF for OSFILE to load a file. We also store this at &76, which is byte 6 of
; the control block, telling OSFILE to load at the file's own load address.
    lda #&ff                                                          ; 1342: a9 ff       ..
    sta l0076                                                         ; 1344: 85 76       .v
    ldx #&70 ; 'p'                                                    ; 1346: a2 70       .p
    ldy #0                                                            ; 1348: a0 00       ..
    jmp l0000                                                         ; 134a: 4c 00 00    L..

; &134d referenced 2 times by &12f7, &1316
.sub_c134d
    cmp #&21 ; '!'                                                    ; 134d: c9 21       .!
    bcc c138a                                                         ; 134f: 90 39       .9
    cmp #&7f                                                          ; 1351: c9 7f       ..
    bcs c138a                                                         ; 1353: b0 35       .5
    sta l0080                                                         ; 1355: 85 80       ..
    txa                                                               ; 1357: 8a          .
    pha                                                               ; 1358: 48          H
    tya                                                               ; 1359: 98          .
    pha                                                               ; 135a: 48          H
    lda #osword_read_char                                             ; 135b: a9 0a       ..
    ldx #<(l0080)                                                     ; 135d: a2 80       ..
    ldy #>(l0080)                                                     ; 135f: a0 00       ..
    jsr osword                                                        ; 1361: 20 f1 ff     ..            ; Read character definition
    lsr l0081                                                         ; 1364: 46 81       F.
    lsr l0082                                                         ; 1366: 46 82       F.
    asl l0086                                                         ; 1368: 06 86       ..
    asl l0087                                                         ; 136a: 06 87       ..
    asl l0088                                                         ; 136c: 06 88       ..
    lda #&17                                                          ; 136e: a9 17       ..
    jsr oswrch                                                        ; 1370: 20 ee ff     ..            ; Write character 23
    lda #&ff                                                          ; 1373: a9 ff       ..
    jsr oswrch                                                        ; 1375: 20 ee ff     ..            ; Write character 255
    ldx #0                                                            ; 1378: a2 00       ..
; &137a referenced 1 time by &1382
.loop_c137a
    lda l0081,x                                                       ; 137a: b5 81       ..
    jsr oswrch                                                        ; 137c: 20 ee ff     ..            ; Write character
    inx                                                               ; 137f: e8          .
    cpx #8                                                            ; 1380: e0 08       ..
    bcc loop_c137a                                                    ; 1382: 90 f6       ..
    pla                                                               ; 1384: 68          h
    tay                                                               ; 1385: a8          .
    pla                                                               ; 1386: 68          h
    tax                                                               ; 1387: aa          .
    lda #&ff                                                          ; 1388: a9 ff       ..
; &138a referenced 2 times by &134f, &1353
.c138a
    jmp oswrch                                                        ; 138a: 4c ee ff    L..            ; Write character 255

.drive_0_command
    equs "DRIVE 0"                                                    ; 138d: 44 52 49... DRI
    equb &0d                                                          ; 1394: 0d          .
.dir_dollar_command
    equs "DIR $"                                                      ; 1395: 44 49 52... DIR
    equb &0d                                                          ; 139a: 0d          .

; &139b referenced 1 time by &12ae
.sub_c139b
    sta l0070                                                         ; 139b: 85 70       .p
; &139d referenced 1 time by &13a4
.loop_c139d
    lda #osbyte_vsync                                                 ; 139d: a9 13       ..
    jsr osbyte                                                        ; 139f: 20 f4 ff     ..            ; Wait for vertical sync
    dec l0070                                                         ; 13a2: c6 70       .p
    bne loop_c139d                                                    ; 13a4: d0 f7       ..
    rts                                                               ; 13a6: 60          `

.osfile_load_filename
    equs "G", &0d                                                     ; 13a7: 47 0d       G.
; &13a9 referenced 1 time by &12f0
.written_by_string
    equs "Written by Michael St Aubyn"                                ; 13a9: 57 72 69... Wri
    equb &0d                                                          ; 13c4: 0d          .
; &13c5 referenced 1 time by &130f
.copyright_string
    equs "Copyright Micro Power Limited 1986"                         ; 13c5: 43 6f 70... Cop
    equb &0d                                                          ; 13e7: 0d          .
.TODO1
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 13e8: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 13f4: 00 00 00... ...
    equb   1,   1,   1,   0,   0,   0,   0,   0, &ff, &ff, &ff, &1f   ; 1400: 01 01 01... ...
    equb &0f, &0f, &1f, &1f, &ff, &ff, &ff, &fc, &f0, &e0, &e0, &e0   ; 140c: 0f 0f 1f... ...
    equb &c0, &c0, &c0,   0,   0,   0,   0,   0,   1,   1,   1,   0   ; 1418: c0 c0 c0... ...
    equb   0,   0,   0,   0, &ff, &ff, &ff, &1f, &0f, &1f, &1f, &1f   ; 1424: 00 00 00... ...
    equb &f0, &f0, &f0, &f0, &f0, &f0, &f0, &f0,   0,   0,   0,   0   ; 1430: f0 f0 f0... ...
    equb   0,   0,   0,   0,   0,   0,   0,   1,   1,   3,   7,   7   ; 143c: 00 00 00... ...
    equb &7f, &ff, &ff, &ff, &ff, &fe, &fe, &fe, &fc, &fc, &fc, &c0   ; 1448: 7f ff ff... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1454: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   1,   3,   7,   1, &0f, &3f, &7f   ; 1460: 00 00 00... ...
    equb &ff, &fc, &fc, &f8, &ff, &ff, &ff, &c1,   0,   0,   0,   0   ; 146c: ff fc fc... ...
    equb &c0, &f0, &f8, &fc, &fe, &7e, &7f, &3f,   0,   0,   0,   0   ; 1478: c0 f0 f8... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1484: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   1,   0,   3, &0f, &1f   ; 1490: 00 00 00... ...
    equb &3f, &7f, &ff, &fe, &7f, &ff, &ff, &f0, &c0,   0,   0,   0   ; 149c: 3f 7f ff... ?..
    equb &f0, &fc, &fe, &3f, &0f,   7,   3,   1                       ; 14a8: f0 fc fe... ...
    equs "8xx"                                                        ; 14b0: 38 78 78    8xx
    equb &f8, &f8, &f0, &f0, &f0,   0,   0,   0,   0,   0,   0,   0   ; 14b3: f8 f8 f0... ...
    equb   0, &0f, &0f, &0f,   0,   0,   0,   0,   0, &ff, &ff, &ff   ; 14bf: 00 0f 0f... ...
    equb &ff, &7f, &7f, &ff, &ff, &ff, &ff, &ff, &e0, &80,   0,   0   ; 14cb: ff 7f 7f... ...
    equb   0, &ff, &ff, &ff, &0f,   3,   1,   1,   0, &f8, &f8, &f8   ; 14d7: 00 ff ff... ...
    equb &f8, &f8, &f0, &f0, &f0,   0,   0,   0,   0,   0,   0,   0   ; 14e3: f8 f8 f0... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0, &ff, &ff, &ff   ; 14ef: 00 00 00... ...
    equb &0f,   7, &0f, &0f, &0e, &f8, &f8, &fc, &fc, &fc, &fe, &fe   ; 14fb: 0f 07 0f... ...
    equb &fe,   0,   0,   0,   0,   0,   0,   0,   0                  ; 1507: fe 00 00... ...
    equs "???"                                                        ; 1510: 3f 3f 3f    ???
    equb   3,   1,   1,   1,   1, &ff, &ff, &ff, &fc, &f0, &e0, &c0   ; 1513: 03 01 01... ...
    equb &c0, &80, &80, &80,   0,   0,   0,   0,   0,   0,   0,   0   ; 151f: c0 80 80... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 152b: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1537: 00 00 00... ...
    equb   0,   0,   0,   0,   0, &1f                                 ; 1543: 00 00 00... ...
    equs "????"                                                       ; 1549: 3f 3f 3f... ???
    equb &7f, &7f, &7f, &c0, &c0, &c0, &80, &80, &80, &80,   0,   0   ; 154d: 7f 7f 7f... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1559: 00 00 00... ...
    equb   0,   0,   0, &1f                                           ; 1565: 00 00 00... ...
    equs "???"                                                        ; 1569: 3f 3f 3f    ???
    equb &7f, &7b, &73, &f3, &f0, &f8, &f8, &f8, &f8, &f8, &f8, &f8   ; 156c: 7f 7b 73... .{s
    equb   0,   0,   0,   0,   0,   0,   0,   0, &0f, &1f, &1f, &3f   ; 1578: 00 00 00... ...
    equb &3f, &7f, &ff, &f7, &fc, &fc, &fc, &f8, &f8, &f8, &f8, &f0   ; 1584: 3f 7f ff... ?..
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1590: 00 00 00... ...
    equb   0,   0,   0,   0,   7, &0f, &1f, &1f, &3f, &3f, &7f, &7f   ; 159c: 00 00 00... ...
    equb &f0, &f0, &e0, &c0, &c0, &80, &80, &80,   0,   0,   0,   0   ; 15a8: f0 f0 e0... ...
    equb   0,   0,   0,   0                                           ; 15b4: 00 00 00... ...
    equs "????????"                                                   ; 15b8: 3f 3f 3f... ???
    equb   0, &80, &80, &80, &80, &80, &80, &80,   0,   0,   0,   0   ; 15c0: 00 80 80... ...
    equb   0,   0,   0,   0,   1,   3,   7,   7, &0f, &0f, &1f, &1f   ; 15cc: 00 00 00... ...
    equb &fc, &fc, &f8, &f0, &f0, &e0, &e0, &e0,   0,   0,   0,   0   ; 15d8: fc fc f8... ...
    equb   0,   0,   0,   0,   1,   0,   0,   0,   0,   0,   0,   0   ; 15e4: 00 00 00... ...
    equb &f0, &f0, &f0, &e0, &e0, &e0, &e0,   0,   0,   0,   0,   0   ; 15f0: f0 f0 f0... ...
    equb   0,   0,   0,   0,   0,   1,   1,   1,   1,   3,   3,   3   ; 15fc: 00 00 00... ...
    equb &fe, &fe, &fe, &fc, &fc, &fc, &fc, &f8,   0,   0,   0,   0   ; 1608: fe fe fe... ...
    equb   3,   7,   7, &0f,   0,   0,   0,   0, &80, &80, &80, &80   ; 1614: 03 07 07... ...
    equb &f0, &f0, &f0, &e0, &e0, &e0, &e0,   0,   0,   0,   0,   0   ; 1620: f0 f0 f0... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 162c: 00 00 00... ...
    equb &0e, &1e, &1e, &1c                                           ; 1638: 0e 1e 1e... ...
    equs "<<8x"                                                       ; 163c: 3c 3c 38... <<8
    equb &ff, &ff, &7f, &7f, &7f                                      ; 1640: ff ff 7f... ...
    equs "???"                                                        ; 1645: 3f 3f 3f    ???
    equb   0,   0,   0, &80, &80, &80, &c0, &c0,   3,   3,   3,   7   ; 1648: 00 00 00... ...
    equb   7,   7, &0f, &0f, &c0, &c0, &80, &80, &80,   0,   0,   0   ; 1654: 07 07 0f... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1660: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 166c: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1678: 00 00 00... ...
    equb   1,   1,   1,   3, &ff, &ff, &fe, &fe, &fe, &fe, &fc, &fc   ; 1684: 01 01 01... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1690: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   1,   1,   1,   3,   3   ; 169c: 00 00 00... ...
    equb &f3, &e3, &e3, &e3, &e3, &c3, &c3, &c3, &f8, &f8, &f8, &f8   ; 16a8: f3 e3 e3... ...
    equb &f8, &f8, &f8, &f8,   1,   1,   3,   7,   7, &0f, &0f, &1e   ; 16b4: f8 f8 f8... ...
    equb &ef, &ef, &cf, &cf, &9f, &1f, &1f, &3f, &f0, &f0, &e0, &e0   ; 16c0: ef ef cf... ...
    equb &e0, &e0, &c0, &c0,   0,   0,   0,   0,   0,   0,   0,   0   ; 16cc: e0 e0 c0... ...
    equb   0,   0,   0,   0,   1,   1,   1,   1, &7f, &ff, &ff, &fe   ; 16d8: 00 00 00... ...
    equb &fe, &fe, &fc, &fc,   0,   0,   0,   0,   0,   0,   0,   0   ; 16e4: fe fe fc... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0, &3f, &3f, &7f, &7f   ; 16f0: 00 00 00... ...
    equb &7f, &7f, &ff, &ff, &80, &80, &80, &80,   0,   0,   0,   0   ; 16fc: 7f 7f ff... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0, &1f                  ; 1708: 00 00 00... ...
    equs "???"                                                        ; 1711: 3f 3f 3f    ???
    equb &7f, &7f, &7f, &7f, &c0, &c0, &c0, &80, &80, &80,   0,   0   ; 1714: 7f 7f 7f... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1720: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 172c: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   7,   7,   7,   7   ; 1738: 00 00 00... ...
    equb &0f, &0f, &0f, &1f, &f8, &f8, &f0, &f0, &ff, &ff, &ff, &e0   ; 1744: 0f 0f 0f... ...
    equb &0f, &1f, &3f, &ff, &fe, &fe, &fe, &fe,   0,   0,   0,   0   ; 1750: 0f 1f 3f... ..?
    equb   0                                                          ; 175c: 00          .
.pending_toolbar_colour
    equb 0                                                            ; 175d: 00          .
.toolbar_colour
    equb 0                                                            ; 175e: 00          .
.pending_gameplay_area_colour
    equb 0                                                            ; 175f: 00          .
.gameplay_area_colour
    equb 0, 0, 0, 0, 0                                                ; 1760: 00 00 00... ...
.use_colour_flag
    equb 0                                                            ; 1765: 00          .
.set_toolbar_and_gameplay_area_colours
    equb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1         ; 1766: 00 00 00... ...
    equs "xpp"                                                        ; 1778: 78 70 70    xpp
    equb &f0, &f0, &e0, &e0, &e0, &1f, &1f, &1f, &0f, &0f, &0f,   7   ; 177b: f0 f0 e0... ...
    equb   7, &c0, &e0, &e0, &e0, &f0, &f0, &f0, &f8, &0e, &0e, &1e   ; 1787: 07 c0 e0... ...
    equb &1e, &1c                                                     ; 1793: 1e 1c       ..
    equs "<<8"                                                        ; 1795: 3c 3c 38    <<8
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1798: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 17a4: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 17b0: 00 00 00... ...
    equb   0,   0,   0,   0,   3,   3,   3,   7,   7,   7, &0f, &0f   ; 17bc: 00 00 00... ...
    equb &fc, &f8, &f8, &f8, &f8, &f0, &f0, &f0,   0,   0,   0,   0   ; 17c8: fc f8 f8... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 17d4: 00 00 00... ...
    equb   3,   7,   7,   7,   7, &0f, &0f, &0e, &83, &83, &83,   3   ; 17e0: 03 07 07... ...
    equb   3,   3,   3,   1, &f8, &f8, &f8, &fc, &fc, &fd, &fd, &ff   ; 17ec: 03 03 03... ...
    equs "><x"                                                        ; 17f8: 3e 3c 78    ><x
    equb &f8, &f0, &e0, &e0, &c0                                      ; 17fb: f8 f0 e0... ...
    equs "???"                                                        ; 1800: 3f 3f 3f    ???
    equb &7f, &7f, &7f, &ff, &ff, &c0, &80, &80, &80, &80,   0,   0   ; 1803: 7f 7f 7f... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   3,   3,   3   ; 180f: 00 00 00... ...
    equb   3,   3,   3,   3,   3, &fc, &fc, &f8, &f8, &f8, &f8, &f8   ; 181b: 03 03 03... ...
    equb &f8,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   1   ; 1827: f8 00 00... ...
    equb   1,   1,   3,   3,   7, &fe, &fe, &fe, &fe, &fc, &fc, &fc   ; 1833: 01 01 03... ...
    equb &f8,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 183f: f8 00 00... ...
    equb   0,   0,   0,   0,   0, &ff, &ff, &fe, &fe, &fe, &fe, &fe   ; 184b: 00 00 00... ...
    equb &fe,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1857: fe 00 00... ...
    equb   0                                                          ; 1863: 00          .
    equs "???"                                                        ; 1864: 3f 3f 3f    ???
    equb   3,   0,   0,   0,   0, &ff, &ff, &ff, &ff,   0,   0,   0   ; 1867: 03 00 00... ...
    equb   0, &f8, &f8, &f8, &80,   0,   0,   0,   0,   0,   0,   0   ; 1873: 00 f8 f8... ...
    equb   0, &1f, &1f, &1f                                           ; 187f: 00 1f 1f... ...
    equs "???"                                                        ; 1883: 3f 3f 3f    ???
    equb &7f, &7f, &e0, &c0, &c0, &c0, &c0, &80, &80, &80             ; 1886: 7f 7f e0... ...
    equs "|<<<888"                                                    ; 1890: 7c 3c 3c... |<<
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1897: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 18a3: 00 00 00... ...
    equb   0,   1,   3,   3,   3,   3,   7,   7,   7, &c0, &c0, &c0   ; 18af: 00 01 03... ...
    equb &80, &80, &80, &80,   0,   7,   3,   3,   3,   1,   1,   1   ; 18bb: 80 80 80... ...
    equb   0, &f8, &f8, &fc, &fc, &fc, &fe, &fe, &ff                  ; 18c7: 00 f8 f8... ...
    equs "8xxp"                                                       ; 18d0: 38 78 78... 8xx
    equb &f0, &f0, &e0, &e0,   0,   0,   0,   0,   0,   0,   0,   0   ; 18d4: f0 f0 e0... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 18e0: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 18ec: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0, &0f, &0f, &1f, &1f   ; 18f8: 00 00 00... ...
    equb &1f                                                          ; 1904: 1f          .
    equs "???"                                                        ; 1905: 3f 3f 3f    ???
    equb &e0, &e0, &e0, &e0, &c0, &c0, &c0, &80,   0,   0,   0,   0   ; 1908: e0 e0 e0... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1914: 00 00 00... ...
    equb &1e, &1e, &1c                                                ; 1920: 1e 1e 1c    ...
    equs "<<88x"                                                      ; 1923: 3c 3c 38... <<8
    equb   1,   1,   1,   1,   1,   1,   1,   1, &ff, &ff, &ff, &ff   ; 1928: 01 01 01... ...
    equb &fe, &fe, &fc, &f8, &c0, &80,   1,   1,   1,   3,   3,   3   ; 1934: fe fe fc... ...
    equb &fe, &fe, &fe, &fe, &fc, &fc, &fc, &f8,   0,   0,   0,   0   ; 1940: fe fe fe... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 194c: 00 00 00... ...
    equb   3,   3,   3,   3,   1,   1,   1,   0, &f8, &f8, &f8, &f8   ; 1958: 03 03 03... ...
    equb &f8, &fc                                                     ; 1964: f8 fc       ..
.jmp_yx
    equb &fc, &fe,   0,   0,   0,   0,   0,   0,   0,   0,   7, &0f   ; 1966: fc fe 00... ...
    equb &0f, &1f, &1f, &3f, &7f, &7f, &f8, &f0, &f0, &e0, &c0, &c0   ; 1972: 0f 1f 1f... ...
    equb &80,   0,   0,   0,   0,   0,   0,   0,   0,   0             ; 197e: 80 00 00... ...
.initialise_brazier_and_fire
    equb   0,   0,   0,   0,   0,   0,   0,   0, &fe, &fe, &fe, &fe   ; 1988: 00 00 00... ...
    equb &7e, &7f, &7f, &3f,   0,   0,   0,   0,   0,   0,   0, &80   ; 1994: 7e 7f 7f... ~..
    equb   1,   3,   3,   7,   7, &0f, &1f, &1f, &fe, &fc, &f8, &f0   ; 19a0: 01 03 03... ...
    equb &f0, &e0, &e0, &c0,   0,   0,   0,   0,   0,   0,   0,   0   ; 19ac: f0 e0 e0... ...
    equb   0,   0,   0,   0,   0,   1,   1,   1, &7f, &7f, &ff, &ff   ; 19b8: 00 00 00... ...
    equb &fe, &fe, &fe, &fc,   0,   0,   0,   0,   0,   0,   0,   0   ; 19c4: fe fe fe... ...
    equb   0,   0,   0,   0,   1,   1,   3, &0f                       ; 19d0: 00 00 00... ...
    equs "8xx"                                                        ; 19d8: 38 78 78    8xx
    equb &f8, &f0, &f0, &e0, &e0,   0,   0,   0,   0,   0,   0,   0   ; 19db: f8 f0 f0... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0, &0f, &0f, &0e   ; 19e7: 00 00 00... ...
    equb &1e, &1e, &1c, &1c, &3c,   0,   0,   0,   0,   0,   0,   0   ; 19f3: 1e 1e 1c... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0, &ff, &ff, &7f   ; 19ff: 00 00 00... ...
    equb &7f, &7f                                                     ; 1a0b: 7f 7f       ..
    equs "???"                                                        ; 1a0d: 3f 3f 3f    ???
.something14_TODO
    equb &e0, &c0, &c0, &c0, &c0, &80, &80, &80,   0,   0,   0,   0   ; 1a10: e0 c0 c0... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1a1c: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1a28: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   1, &1f, &1f, &1f,   0,   0,   0   ; 1a34: 00 00 00... ...
    equb &7f, &ff, &ff, &ff, &ff,   0,   0,   0, &80, &c0, &fc, &fc   ; 1a40: 7f ff ff... ...
    equb &fc,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1a4c: fc 00 00... ...
    equb   0,   1, &1f, &1f, &1f,   0,   0,   0, &78, &fe, &ff, &ff   ; 1a58: 00 01 1f... ...
    equb &ff,   0,   0,   0,   1,   1, &c1, &c1, &c1,   0,   0,   0   ; 1a64: ff 00 00... ...
    equb &f8, &f0, &e1, &e1, &c1,   0,   0,   0,   7, &1f, &ff, &ff   ; 1a70: f8 f0 e1... ...
    equb &ff,   0,   0,   0, &f8, &fc, &ff, &ff, &ff,   0,   0,   0   ; 1a7c: ff 00 00... ...
    equb   0,   0, &c0, &c0, &c0,   0,   0,   0,   0,   0,   0,   0   ; 1a88: 00 00 c0... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1a94: 00 00 00... ...
    equb &fe, &7f, &3f, &0f,   3,   0,   0,   0,   0,   3, &ff, &ff   ; 1aa0: fe 7f 3f... ..?
    equb &ff,   0,   0,   0, &fe, &fc, &f8, &e0,   0,   0,   0,   0   ; 1aac: ff 00 00... ...
    equb   0,   0                                                     ; 1ab8: 00 00       ..
.current_room_index
    equb 0                                                            ; 1aba: 00          .
.copy_rectangle_of_memory_to_screen
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1abb: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0, &3f, &1f, &0f   ; 1ac7: 00 00 00... ...
    equb   3,   0,   0,   0,   0, &c0, &f0, &ff, &ff, &7f,   0,   0   ; 1ad3: 03 00 00... ...
    equb   0, &3f, &ff, &fe, &f8, &c0,   0,   0,   0, &80,   0,   0   ; 1adf: 00 3f ff... .?.
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1aeb: 00 00 00... ...
    equb   0,   3, &0f, &ff, &ff, &ff,   0,   0,   0, &fc, &fe, &ff   ; 1af7: 00 03 0f... ...
    equb &ff, &ff,   0,   0,   0,   0,   1, &ff, &ff, &ff,   0,   0   ; 1b03: ff ff 00... ...
    equb   0, &1f, &ff, &ff, &ff, &ff,   0,   0,   0, &e0, &c0, &c0   ; 1b0f: 00 1f ff... ...
    equb &80, &80,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1b1b: 80 80 00... ...
    equb   0,   0,   0, &0f, &0f, &0f,   0,   0,   0, &3c, &ff, &ff   ; 1b27: 00 00 00... ...
    equb &ff, &ff,   0,   0,   0,   0,   0, &e0, &e0, &e0,   0,   0   ; 1b33: ff ff 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0, &1f, &1f, &1f   ; 1b3f: 00 00 00... ...
    equb &0e, &0e,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1b4b: 0e 0e 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1b57: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1b63: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1b6f: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 1b7b: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0                  ; 1b87: 00 00 00... ...
.draw_floor_walls_and_ceiling_around_solid_rock
    equb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ; 1b90: 00 00 00... ...
    equb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ; 1ba4: 00 00 00... ...
    equb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ; 1bb8: 00 00 00... ...
    equb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ; 1bcc: 00 00 00... ...
    equb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ; 1be0: 00 00 00... ...
    equb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0                           ; 1bf4: 00 00 00... ...
.pydis_end

; Label references by decreasing frequency:
;     oswrch:                       13
;     l0070:                         9
;     crtc_address_register:         6
;     crtc_address_write:            6
;     l0071:                         5
;     l0073:                         5
;     osbyte:                        5
;     l0072:                         4
;     l0074:                         3
;     l0000:                         2
;     l0081:                         2
;     relocate_loop:                 2
;     c12d1:                         2
;     sub_c134d:                     2
;     c138a:                         2
;     l0001:                         1
;     l0002:                         1
;     l0003:                         1
;     l0004:                         1
;     password_characters_entered:   1
;     l0076:                         1
;     l0080:                         1
;     l0082:                         1
;     l0086:                         1
;     l0087:                         1
;     l0088:                         1
;     post_relocate_init:            1
;     loop_c12f0:                    1
;     c12fe:                         1
;     loop_c130f:                    1
;     c131d:                         1
;     loop_c137a:                    1
;     sub_c139b:                     1
;     loop_c139d:                    1
;     written_by_string:             1
;     copyright_string:              1
;     osword:                        1
;     oscli:                         1

; Automatically generated labels:
;     c12d1
;     c12fe
;     c131d
;     c138a
;     l0000
;     l0001
;     l0002
;     l0003
;     l0004
;     l0070
;     l0071
;     l0072
;     l0073
;     l0074
;     l0076
;     l0080
;     l0081
;     l0082
;     l0086
;     l0087
;     l0088
;     loop_c12f0
;     loop_c130f
;     loop_c137a
;     loop_c139d
;     sub_c12ba
;     sub_c132a
;     sub_c134d
;     sub_c139b
    assert <(l0080) == &80
    assert <(screen_start DIV 8) == &40
    assert <dir_dollar_command == &95
    assert <drive_0_command == &8d
    assert <osfile == &dd
    assert <osfile_load_filename == &a7
    assert >(l0080) == &00
    assert >(load_address + (pydis_end - pydis_start)) == &43
    assert >(screen_start DIV 8) == &0c
    assert >dir_dollar_command == &13
    assert >drive_0_command == &13
    assert >load_address == &39
    assert >osfile == &ff
    assert >osfile_load_filename == &13
    assert >relocate_address == &12
    assert crtc_cursor_start == &0a
    assert crtc_interlace_delay == &08
    assert crtc_screen_start_high == &0c
    assert crtc_screen_start_low == &0d
    assert crtc_vert_displayed == &06
    assert crtc_vert_sync_pos == &07
    assert game_area_height_cells == &18
    assert jmp_indirect_opcode == &6c
    assert jsr_opcode == &20
    assert osbyte_opt == &8b
    assert osbyte_read_write_escape_break_effect == &c8
    assert osbyte_tv == &90
    assert osbyte_vsync == &13
    assert osword_read_char == &0a
    assert vdu_disable == &15
    assert vdu_goto_xy == &1f
    assert vdu_set_mode == &16

save pydis_start, pydis_end
