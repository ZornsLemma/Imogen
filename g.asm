; Constants
buffer_sound_channel_0                          = 4
crtc_cursor_start                               = 10
crtc_interlace_delay                            = 8
crtc_screen_start_high                          = 12
crtc_screen_start_low                           = 13
crtc_vert_displayed                             = 6
crtc_vert_sync_pos                              = 7
osbyte_close_spool_exec                         = 119
osbyte_flush_buffer                             = 21
osbyte_flush_buffer_class                       = 15
osbyte_inkey                                    = 129
osbyte_opt                                      = 139
osbyte_read_vdu_status                          = 117
osbyte_read_write_escape_break_effect           = 200
osbyte_read_write_first_byte_break_intercept    = 247
osbyte_read_write_second_byte_break_intercept   = 248
osbyte_read_write_third_byte_break_intercept    = 249
osbyte_reset_soft_keys                          = 18
osbyte_select_adc_channels                      = 16
osbyte_set_cursor_editing                       = 4
osbyte_set_printer_ignore                       = 6
osbyte_tv                                       = 144
osbyte_vsync                                    = 19
osfile_load                                     = 255
osfile_read_catalogue_info                      = 5
osword_envelope                                 = 8
osword_read_char                                = 10
osword_sound                                    = 7
screen_width_minus_one                          = 39
vdu_bell                                        = 7
vdu_cr                                          = 13
vdu_define_character                            = 23
vdu_define_text_window                          = 28
vdu_enable                                      = 6
vdu_goto_xy                                     = 31
vdu_set_graphics_colour                         = 18
vdu_set_mode                                    = 22
vdu_set_text_colour                             = 17

; Memory locations
l0000                   = $00
l0002                   = $02
l0003                   = $03
l0004                   = $04
l0005                   = $05
l0006                   = $06
l0007                   = $07
l0008                   = $08
l0009                   = $09
l000a                   = $0a
l0014                   = $14
l0015                   = $15
l0016                   = $16
l0018                   = $18
l0019                   = $19
l001a                   = $1a
l001b                   = $1b
l001d                   = $1d
l0020                   = $20
l0025                   = $25
l0026                   = $26
l0027                   = $27
l0028                   = $28
l0029                   = $29
l002a                   = $2a
l002b                   = $2b
l002c                   = $2c
l002d                   = $2d
l002e                   = $2e
l0030                   = $30
l0031                   = $31
currently_loaded_level  = $37
l0039                   = $39
l003a                   = $3a
l003b                   = $3b
l003c                   = $3c
l003d                   = $3d
l003e                   = $3e
l003f                   = $3f
l0040                   = $40
l0041                   = $41
l0042                   = $42
l0043                   = $43
l0044                   = $44
l0045                   = $45
l0046                   = $46
l0048                   = $48
l0049                   = $49
l004a                   = $4a
l004b                   = $4b
l004c                   = $4c
l004d                   = $4d
l0050                   = $50
l0051                   = $51
l0052                   = $52
l0053                   = $53
l0054                   = $54
l0055                   = $55
l0058                   = $58
l0059                   = $59
l005a                   = $5a
l005b                   = $5b
l005c                   = $5c
l005d                   = $5d
l005e                   = $5e
l005f                   = $5f
l0060                   = $60
l0061                   = $61
l0062                   = $62
l0063                   = $63
l0064                   = $64
l0065                   = $65
l0066                   = $66
l0067                   = $67
l0068                   = $68
l0070                   = $70
l0071                   = $71
l0072                   = $72
l0073                   = $73
l0074                   = $74
l0075                   = $75
l0076                   = $76
l0077                   = $77
l0078                   = $78
l0079                   = $79
l007a                   = $7a
l007b                   = $7b
l007c                   = $7c
l007d                   = $7d
l007e                   = $7e
l007f                   = $7f
l0080                   = $80
l0081                   = $81
l0082                   = $82
l0083                   = $83
l0084                   = $84
l0085                   = $85
l0086                   = $86
l0087                   = $87
l0088                   = $88
romsel_copy             = $f4
l00fc                   = $fc
l0100                   = $0100
l010b                   = $010b
l0116                   = $0116
l0121                   = $0121
l0122                   = $0122
l0123                   = $0123
l0124                   = $0124
l0125                   = $0125
l0126                   = $0126
l0127                   = $0127
l0128                   = $0128
l0129                   = $0129
l012a                   = $012a
l012b                   = $012b
l012c                   = $012c
l012d                   = $012d
l012e                   = $012e
brkv                    = $0202
irq1v                   = $0204
l0287                   = $0287
l0950                   = $0950
l0951                   = $0951
l095b                   = $095b
l0966                   = $0966
l0967                   = $0967
l0971                   = $0971
l097c                   = $097c
l097d                   = $097d
l0987                   = $0987
l0992                   = $0992
l0993                   = $0993
l099d                   = $099d
l09a8                   = $09a8
l09a9                   = $09a9
l09b3                   = $09b3
l09b4                   = $09b4
l09be                   = $09be
l09bf                   = $09bf
l09c9                   = $09c9
l09d4                   = $09d4
l09d5                   = $09d5
l09df                   = $09df
l09ea                   = $09ea
l09eb                   = $09eb
l09ec                   = $09ec
l09ed                   = $09ed
l09ee                   = $09ee
l09ef                   = $09ef
l0a6f                   = $0a6f
l0a7e                   = $0a7e
l0a7f                   = $0a7f
l0a80                   = $0a80
l0a90                   = $0a90
l0aa1                   = $0aa1
l0aa9                   = $0aa9
l0ab1                   = $0ab1
l0ab2                   = $0ab2
l0ab3                   = $0ab3
l0ab4                   = $0ab4
l0ab5                   = $0ab5
l0ab6                   = $0ab6
l0b00                   = $0b00
l3b09                   = $3b09
c3c2c                   = $3c2c
l53c0                   = $53c0
l8000                   = $8000
lbe00                   = $be00
lbf00                   = $bf00
crtc_address_register   = $fe00
crtc_address_write      = $fe01
video_ula_palette       = $fe21
romsel                  = $fe30
system_via_t1c_l        = $fe44
system_via_t1c_h        = $fe45
system_via_t1l_l        = $fe46
system_via_t1l_h        = $fe47
system_via_t2c_l        = $fe48
system_via_t2c_h        = $fe49
system_via_acr          = $fe4b
system_via_ifr          = $fe4d
system_via_ier          = $fe4e
user_via_t1c_l          = $fe64
user_via_t1c_h          = $fe65
user_via_t2c_l          = $fe68
user_via_t2c_h          = $fe69
user_via_ier            = $fe6e
osfile                  = $ffdd
oswrch                  = $ffee
osword                  = $fff1
osbyte                  = $fff4
oscli                   = $fff7

    * = $1234

; $1234 referenced 11 times by $1291, $17e5, $180e, $2a4b, $2aa9, $367a, $3698, $3c8f, $3e8a, $3f2a, $3f6f
pydis_start

!pseudopc $1103 {
; $1234 referenced 11 times by $1291, $17e5, $180e, $2a4b, $2aa9, $367a, $3698, $3c8f, $3e8a, $3f2a, $3f6f
copy_protection_flag
    !byte 0                                                           ; 1234: 00          .   :1103[1]
; $1235 referenced 4 times by $17c0, $2a38, $3e52, $3e58
l1104
    !byte $47                                                         ; 1235: 47          G   :1104[1]
; $1236 referenced 2 times by $17c6, $2a3b
l1105
    !byte $11                                                         ; 1236: 11          .   :1105[1]
; $1237 referenced 1 time by $0400
l1106
    !byte $0b                                                         ; 1237: 0b          .   :1106[1]
; $1238 referenced 1 time by $0403
l1107
    !byte $1d                                                         ; 1238: 1d          .   :1107[1]
; $1239 referenced 1 time by $17cc
l1108
    !byte $10                                                         ; 1239: 10          .   :1108[1]
; $123a referenced 1 time by $17d2
l1109
    !byte $27                                                         ; 123a: 27          '   :1109[1]
; $123b referenced 3 times by $0c02, $11f0, $1728
l110a
    !byte 0                                                           ; 123b: 00          .   :110a[1]
; $123c referenced 2 times by $0c3c, $3e17
l110b
    !byte 0                                                           ; 123c: 00          .   :110b[1]

; $123d referenced 2 times by $36f3, $3f5b
c110c
    jsr something5_TODO                                               ; 123d: 20 b7 0a     .. :110c[1]
    lda #$ff                                                          ; 1240: a9 ff       ..  :110f[1]
    sta l0031                                                         ; 1242: 85 31       .1  :1111[1]
    lda #osbyte_flush_buffer_class                                    ; 1244: a9 0f       ..  :1113[1]
    ldx #0                                                            ; 1246: a2 00       ..  :1115[1]
    jsr osbyte                                                        ; 1248: 20 f4 ff     .. :1117[1]   ; Flush all buffers (X=0)
    lda #$30 ; '0'                                                    ; 124b: a9 30       .0  :111a[1]
    sta l09ec                                                         ; 124d: 8d ec 09    ... :111c[1]
    lda #$35 ; '5'                                                    ; 1250: a9 35       .5  :111f[1]
    sta l09ed                                                         ; 1252: 8d ed 09    ... :1121[1]
    lda #$31 ; '1'                                                    ; 1255: a9 31       .1  :1124[1]
    sta l09ee                                                         ; 1257: 8d ee 09    ... :1126[1]
    ldx #0                                                            ; 125a: a2 00       ..  :1129[1]
    ldy l0a7f                                                         ; 125c: ac 7f 0a    ... :112b[1]
    cpy #$52 ; 'R'                                                    ; 125f: c0 52       .R  :112e[1]
    bne c1140                                                         ; 1261: d0 0e       ..  :1130[1]
    inc l005f                                                         ; 1263: e6 5f       ._  :1132[1]
    lda l005f                                                         ; 1265: a5 5f       ._  :1134[1]
    and #3                                                            ; 1267: 29 03       ).  :1136[1]
    asl                                                               ; 1269: 0a          .   :1138[1]
    asl                                                               ; 126a: 0a          .   :1139[1]
    adc #$41 ; 'A'                                                    ; 126b: 69 41       iA  :113a[1]
    tay                                                               ; 126d: a8          .   :113c[1]
    jsr something8_TODO                                               ; 126e: 20 ef 0a     .. :113d[1]
; $1271 referenced 3 times by $1130, $36f0, $39f1
c1140
    lda l0030                                                         ; 1271: a5 30       .0  :1140[1]
    sta l0050                                                         ; 1273: 85 50       .P  :1142[1]
    lda l0031                                                         ; 1275: a5 31       .1  :1144[1]
    sta l0051                                                         ; 1277: 85 51       .Q  :1146[1]
    stx l0030                                                         ; 1279: 86 30       .0  :1148[1]
    sty l0031                                                         ; 127b: 84 31       .1  :114a[1]
    sty l09ea                                                         ; 127d: 8c ea 09    ... :114c[1]
; $1280 referenced 1 time by $116e
loop_c114f
    lda l0031                                                         ; 1280: a5 31       .1  :114f[1]
    cmp currently_loaded_level                                        ; 1282: c5 37       .7  :1151[1]
    beq level_already_loaded                                          ; 1284: f0 20       .   :1153[1]
    sta data_filename_variable_letter                                 ; 1286: 8d 76 12    .v. :1155[1]
    lda #<data_filename                                               ; 1289: a9 72       .r  :1158[1]
    sta l0070                                                         ; 128b: 85 70       .p  :115a[1]
    lda #>data_filename                                               ; 128d: a9 12       ..  :115c[1]
    sta l0071                                                         ; 128f: 85 71       .q  :115e[1]
    ldx #<level_data                                                  ; 1291: a2 d5       ..  :1160[1]
    ldy #>level_data                                                  ; 1293: a0 3a       .:  :1162[1]
    lda #osfile_load                                                  ; 1295: a9 ff       ..  :1164[1]
    jsr osfile_wrapper                                                ; 1297: 20 dc 16     .. :1166[1]
    beq c1171                                                         ; 129a: f0 06       ..  :1169[1]
    jsr sub_c3617                                                     ; 129c: 20 17 36     .6 :116b[1]
    jmp loop_c114f                                                    ; 129f: 4c 4f 11    LO. :116e[1]

; $12a2 referenced 1 time by $1169
c1171
    lda l0031                                                         ; 12a2: a5 31       .1  :1171[1]
    sta currently_loaded_level                                        ; 12a4: 85 37       .7  :1173[1]
; $12a6 referenced 1 time by $1153
level_already_loaded
    lda #osbyte_flush_buffer_class                                    ; 12a6: a9 0f       ..  :1175[1]
    ldx #0                                                            ; 12a8: a2 00       ..  :1177[1]
    jsr osbyte                                                        ; 12aa: 20 f4 ff     .. :1179[1]   ; Flush all buffers (X=0)
    lda #0                                                            ; 12ad: a9 00       ..  :117c[1]
    sta l09b3                                                         ; 12af: 8d b3 09    ... :117e[1]
    sta l09b4                                                         ; 12b2: 8d b4 09    ... :1181[1]
    ldy #2                                                            ; 12b5: a0 02       ..  :1184[1]
; $12b7 referenced 1 time by $11aa
c1186
    lda #0                                                            ; 12b7: a9 00       ..  :1186[1]
    sta l09a8,y                                                       ; 12b9: 99 a8 09    ... :1188[1]
    sta l09b3,y                                                       ; 12bc: 99 b3 09    ... :118b[1]
    sta l0950,y                                                       ; 12bf: 99 50 09    .P. :118e[1]
    sta l0966,y                                                       ; 12c2: 99 66 09    .f. :1191[1]
    sta l097c,y                                                       ; 12c5: 99 7c 09    .|. :1194[1]
    sta l0992,y                                                       ; 12c8: 99 92 09    ... :1197[1]
    lda #1                                                            ; 12cb: a9 01       ..  :119a[1]
    sta l09be,y                                                       ; 12cd: 99 be 09    ... :119c[1]
    lda #$ff                                                          ; 12d0: a9 ff       ..  :119f[1]
    sta l38ac,y                                                       ; 12d2: 99 ac 38    ..8 :11a1[1]
    sta l38c2,y                                                       ; 12d5: 99 c2 38    ..8 :11a4[1]
    iny                                                               ; 12d8: c8          .   :11a7[1]
    cpy #$0b                                                          ; 12d9: c0 0b       ..  :11a8[1]
    bcc c1186                                                         ; 12db: 90 da       ..  :11aa[1]
    lda l0031                                                         ; 12dd: a5 31       .1  :11ac[1]
    cmp l0051                                                         ; 12df: c5 51       .Q  :11ae[1]
    beq c1209                                                         ; 12e1: f0 57       .W  :11b0[1]
    lda #0                                                            ; 12e3: a9 00       ..  :11b2[1]
    sta l2433                                                         ; 12e5: 8d 33 24    .3$ :11b4[1]
    sta l0048                                                         ; 12e8: 85 48       .H  :11b7[1]
    sta l004d                                                         ; 12ea: 85 4d       .M  :11b9[1]
    sta l09a8                                                         ; 12ec: 8d a8 09    ... :11bb[1]
    sta l0052                                                         ; 12ef: 85 52       .R  :11be[1]
    sta l2eb6                                                         ; 12f1: 8d b6 2e    ... :11c0[1]
    sta l2eb7                                                         ; 12f4: 8d b7 2e    ... :11c3[1]
    sta l09d5                                                         ; 12f7: 8d d5 09    ... :11c6[1]
    sta l09a9                                                         ; 12fa: 8d a9 09    ... :11c9[1]
    lda #4                                                            ; 12fd: a9 04       ..  :11cc[1]
    sta l09df                                                         ; 12ff: 8d df 09    ... :11ce[1]
    sta l09d4                                                         ; 1302: 8d d4 09    ... :11d1[1]
    lda #1                                                            ; 1305: a9 01       ..  :11d4[1]
    sta l09be                                                         ; 1307: 8d be 09    ... :11d6[1]
    lda #0                                                            ; 130a: a9 00       ..  :11d9[1]
    ldy #$0f                                                          ; 130c: a0 0f       ..  :11db[1]
; $130e referenced 1 time by $11e1
loop_c11dd
    sta l0a6f,y                                                       ; 130e: 99 6f 0a    .o. :11dd[1]
    dey                                                               ; 1311: 88          .   :11e0[1]
    bpl loop_c11dd                                                    ; 1312: 10 fa       ..  :11e1[1]
    jsr sub_c1278                                                     ; 1314: 20 78 12     x. :11e3[1]
    lda #$d3                                                          ; 1317: a9 d3       ..  :11e6[1]
    sta l0ab3                                                         ; 1319: 8d b3 0a    ... :11e8[1]
    lda #$16                                                          ; 131c: a9 16       ..  :11eb[1]
    sta l0ab4                                                         ; 131e: 8d b4 0a    ... :11ed[1]
    lda l110a                                                         ; 1321: ad 0a 11    ... :11f0[1]
    bne c11f8                                                         ; 1324: d0 03       ..  :11f3[1]
    jsr something3_TODO                                               ; 1326: 20 00 0c     .. :11f5[1]
; $1329 referenced 1 time by $11f3
c11f8
    lda #0                                                            ; 1329: a9 00       ..  :11f8[1]
    sta l175e                                                         ; 132b: 8d 5e 17    .^. :11fa[1]
    sta l1760                                                         ; 132e: 8d 60 17    .`. :11fd[1]
    jsr sub_c2980                                                     ; 1331: 20 80 29     .) :1200[1]
    jsr sub_c29a1                                                     ; 1334: 20 a1 29     .) :1203[1]
    jsr something9_TODO                                               ; 1337: 20 31 01     1. :1206[1]
; $133a referenced 1 time by $11b0
c1209
    jsr sub_c1766                                                     ; 133a: 20 66 17     f. :1209[1]
    lda #0                                                            ; 133d: a9 00       ..  :120c[1]
    sta l31d7                                                         ; 133f: 8d d7 31    ..1 :120e[1]
    ldx #3                                                            ; 1342: a2 03       ..  :1211[1]
; $1344 referenced 1 time by $1217
loop_c1213
    sta l396f,x                                                       ; 1344: 9d 6f 39    .o9 :1213[1]
    dex                                                               ; 1347: ca          .   :1216[1]
    bpl loop_c1213                                                    ; 1348: 10 fa       ..  :1217[1]
    ldx c3ad7                                                         ; 134a: ae d7 3a    ..: :1219[1]
    ldy l3ad8                                                         ; 134d: ac d8 3a    ..: :121c[1]
    jsr c1966                                                         ; 1350: 20 66 19     f. :121f[1]
    lda l0031                                                         ; 1353: a5 31       .1  :1222[1]
    sec                                                               ; 1355: 38          8   :1224[1]
    sbc #$41 ; 'A'                                                    ; 1356: e9 41       .A  :1225[1]
    tax                                                               ; 1358: aa          .   :1227[1]
    lda l09ef,x                                                       ; 1359: bd ef 09    ... :1228[1]
    and #$80                                                          ; 135c: 29 80       ).  :122b[1]
    beq pydis_start                                                   ; 135e: f0 05       ..  :122d[1]
    lda #$21 ; '!'                                                    ; 1360: a9 21       .!  :122f[1]
    jsr sub_c2bbd                                                     ; 1362: 20 bd 2b     .+ :1231[1]
; $1365 referenced 1 time by $122d
    lda #3                                                            ; 1365: a9 03       ..  :1234[1]
    sta l003e                                                         ; 1367: 85 3e       .>  :1236[1]
    lda #0                                                            ; 1369: a9 00       ..  :1238[1]
    sta l0042                                                         ; 136b: 85 42       .B  :123a[1]
    sta l1760                                                         ; 136d: 8d 60 17    .`. :123c[1]
    jsr sub_c29a1                                                     ; 1370: 20 a1 29     .) :123f[1]
    jsr sub_c1df4                                                     ; 1373: 20 f4 1d     .. :1242[1]
    lda #0                                                            ; 1376: a9 00       ..  :1245[1]
    sta l0004                                                         ; 1378: 85 04       ..  :1247[1]
    lda l0031                                                         ; 137a: a5 31       .1  :1249[1]
    sec                                                               ; 137c: 38          8   :124b[1]
    sbc #$41 ; 'A'                                                    ; 137d: e9 41       .A  :124c[1]
    tax                                                               ; 137f: aa          .   :124e[1]
    lda l09ef,x                                                       ; 1380: bd ef 09    ... :124f[1]
    and #$f8                                                          ; 1383: 29 f8       ).  :1252[1]
    ora l0030                                                         ; 1385: 05 30       .0  :1254[1]
    ora #$40 ; '@'                                                    ; 1387: 09 40       .@  :1256[1]
    sta l09ef,x                                                       ; 1389: 9d ef 09    ... :1258[1]
    lda l0030                                                         ; 138c: a5 30       .0  :125b[1]
    asl                                                               ; 138e: 0a          .   :125d[1]
    tay                                                               ; 138f: a8          .   :125e[1]
    ldx l3adf,y                                                       ; 1390: be df 3a    ..: :125f[1]
    lda c3ae0,y                                                       ; 1393: b9 e0 3a    ..: :1262[1]
    tay                                                               ; 1396: a8          .   :1265[1]
    txa                                                               ; 1397: 8a          .   :1266[1]
    clc                                                               ; 1398: 18          .   :1267[1]
    adc #2                                                            ; 1399: 69 02       i.  :1268[1]
    tax                                                               ; 139b: aa          .   :126a[1]
    tya                                                               ; 139c: 98          .   :126b[1]
    adc #0                                                            ; 139d: 69 00       i.  :126c[1]
    tay                                                               ; 139f: a8          .   :126e[1]
    jmp c1966                                                         ; 13a0: 4c 66 19    Lf. :126f[1]

data_filename
    !text "data"                                                      ; 13a3: 64 61 74... dat :1272[1]
; $13a7 referenced 1 time by $1155
data_filename_variable_letter
    !text "A", $0d                                                    ; 13a7: 41 0d       A.  :1276[1]

; $13a9 referenced 1 time by $11e3
sub_c1278
    lda l0031                                                         ; 13a9: a5 31       .1  :1278[1]
    sec                                                               ; 13ab: 38          8   :127a[1]
    sbc #$41 ; 'A'                                                    ; 13ac: e9 41       .A  :127b[1]
    tax                                                               ; 13ae: aa          .   :127d[1]
    lda l09ef,x                                                       ; 13af: bd ef 09    ... :127e[1]
    and #7                                                            ; 13b2: 29 07       ).  :1281[1]
    sta l0030                                                         ; 13b4: 85 30       .0  :1283[1]
    lda l09ef,x                                                       ; 13b6: bd ef 09    ... :1285[1]
    and #$40 ; '@'                                                    ; 13b9: 29 40       )@  :1288[1]
    bne c129b                                                         ; 13bb: d0 0f       ..  :128a[1]
    lda c3add                                                         ; 13bd: ad dd 3a    ..: :128c[1]
    sta l0030                                                         ; 13c0: 85 30       .0  :128f[1]
    lda copy_protection_flag                                          ; 13c2: ad 03 11    ... :1291[1]
    bpl c129b                                                         ; 13c5: 10 05       ..  :1294[1]
    lda l3ade                                                         ; 13c7: ad de 3a    ..: :1296[1]
    sta l0030                                                         ; 13ca: 85 30       .0  :1299[1]
; $13cc referenced 2 times by $128a, $1294
c129b
    lda l0030                                                         ; 13cc: a5 30       .0  :129b[1]
    asl                                                               ; 13ce: 0a          .   :129d[1]
    tay                                                               ; 13cf: a8          .   :129e[1]
    lda l3adf,y                                                       ; 13d0: b9 df 3a    ..: :129f[1]
    sta l0070                                                         ; 13d3: 85 70       .p  :12a2[1]
    lda c3ae0,y                                                       ; 13d5: b9 e0 3a    ..: :12a4[1]
    sta l0071                                                         ; 13d8: 85 71       .q  :12a7[1]
    ldy #0                                                            ; 13da: a0 00       ..  :12a9[1]
    lda (l0070),y                                                     ; 13dc: b1 70       .p  :12ab[1]
    tax                                                               ; 13de: aa          .   :12ad[1]
    iny                                                               ; 13df: c8          .   :12ae[1]
    lda (l0070),y                                                     ; 13e0: b1 70       .p  :12af[1]
    tay                                                               ; 13e2: a8          .   :12b1[1]
    lda #0                                                            ; 13e3: a9 00       ..  :12b2[1]
    sta l003b                                                         ; 13e5: 85 3b       .;  :12b4[1]
    lda #0                                                            ; 13e7: a9 00       ..  :12b6[1]
    jmp c1f5d                                                         ; 13e9: 4c 5d 1f    L]. :12b8[1]

    !byte $a9, $ff, $8d, $2b, $13, $ae, $d9, $3a, $ac, $da            ; 13ec: a9 ff 8d... ... :12bb[1]
    !text ": f"                                                       ; 13f6: 3a 20 66    : f :12c5[1]
    !byte $19, $a9,   0, $8d, $2b, $13, $a5, $31, $c5, $51, $f0,   5  ; 13f9: 19 a9 00... ... :12c8[1]
    !byte $a9,   4                                                    ; 1405: a9 04       ..  :12d4[1]
    !text " 7#` "                                                     ; 1407: 20 37 23...  7# :12d6[1]
    !byte $d7, $1f, $ad, $60, $17, $d0, $1a, $ad, $5d, $17, $8d, $5e  ; 140c: d7 1f ad... ... :12db[1]
    !byte $17, $ad, $5f, $17, $8d, $60, $17, $20, $8c, $17, $a9,   0  ; 1418: 17 ad 5f... .._ :12e7[1]
    !byte $8d, $8b, $17, $20, $8f, $3a, $20, $a2, $3a, $ad, $8b, $17  ; 1424: 8d 8b 17... ... :12f3[1]
    !byte $c9,   4, $b0,   3, $20, $8c, $17                           ; 1430: c9 04 b0... ... :12ff[1]
    !text " 8* "                                                      ; 1437: 20 38 2a...  8* :1306[1]
    !byte $1e, $13, $20, $a2, $3a, $20, $cd, $22, $ae, $d9, $3a, $ac  ; 143b: 1e 13 20... ..  :130a[1]
    !byte $da                                                         ; 1447: da          .   :1316[1]
    !text ": f"                                                       ; 1448: 3a 20 66    : f :1317[1]
    !byte $19, $4c, $c3, $18, $ad, $8b, $17, $c9,   5, $90, $f9, $a9  ; 144b: 19 4c c3... .L. :131a[1]
    !byte   0, $8d, $8b, $17, $60                                     ; 1457: 00 8d 8b... ... :1326[1]
; $145c referenced 2 times by $198f, $1a37
l132b
    !byte 0                                                           ; 145c: 00          .   :132b[1]

; $145d referenced 5 times by $1394, $13a3, $2439, $24d7, $3f0f
set_yx_based_on_a
    ldx #$11                                                          ; 145d: a2 11       ..  :132c[1]
    ldy #$0b                                                          ; 145f: a0 0b       ..  :132e[1]
    cmp #$c7                                                          ; 1461: c9 c7       ..  :1330[1]
    beq c1376                                                         ; 1463: f0 42       .B  :1332[1]
    ldx #$93                                                          ; 1465: a2 93       ..  :1334[1]
    ldy #$0b                                                          ; 1467: a0 0b       ..  :1336[1]
    cmp #$c6                                                          ; 1469: c9 c6       ..  :1338[1]
    beq c1376                                                         ; 146b: f0 3a       .:  :133a[1]
    ldx #$c5                                                          ; 146d: a2 c5       ..  :133c[1]
    ldy #$0b                                                          ; 146f: a0 0b       ..  :133e[1]
    cmp #$c5                                                          ; 1471: c9 c5       ..  :1340[1]
    beq c1376                                                         ; 1473: f0 32       .2  :1342[1]
    ldx l0054                                                         ; 1475: a6 54       .T  :1344[1]
    ldy l0055                                                         ; 1477: a4 55       .U  :1346[1]
    cmp #$c8                                                          ; 1479: c9 c8       ..  :1348[1]
    bcc c135d                                                         ; 147b: 90 11       ..  :134a[1]
    sbc #$c8                                                          ; 147d: e9 c8       ..  :134c[1]
    pha                                                               ; 147f: 48          H   :134e[1]
    lda #<level_data                                                  ; 1480: a9 d5       ..  :134f[1]
    clc                                                               ; 1482: 18          .   :1351[1]
    adc level_data                                                    ; 1483: 6d d5 3a    m.: :1352[1]
    tax                                                               ; 1486: aa          .   :1355[1]
    lda #>level_data                                                  ; 1487: a9 3a       .:  :1356[1]
    adc level_data + 1                                                ; 1489: 6d d6 3a    m.: :1358[1]
    tay                                                               ; 148c: a8          .   :135b[1]
    pla                                                               ; 148d: 68          h   :135c[1]
; $148e referenced 1 time by $134a
c135d
    stx l0058                                                         ; 148e: 86 58       .X  :135d[1]
    sty l0059                                                         ; 1490: 84 59       .Y  :135f[1]
    asl                                                               ; 1492: 0a          .   :1361[1]
    tay                                                               ; 1493: a8          .   :1362[1]
    lda l0059                                                         ; 1494: a5 59       .Y  :1363[1]
    sta l005a                                                         ; 1496: 85 5a       .Z  :1365[1]
    adc #0                                                            ; 1498: 69 00       i.  :1367[1]
    sta l0059                                                         ; 149a: 85 59       .Y  :1369[1]
    lda (l0058),y                                                     ; 149c: b1 58       .X  :136b[1]
    adc l0058                                                         ; 149e: 65 58       eX  :136d[1]
    tax                                                               ; 14a0: aa          .   :136f[1]
    iny                                                               ; 14a1: c8          .   :1370[1]
    lda (l0058),y                                                     ; 14a2: b1 58       .X  :1371[1]
    adc l005a                                                         ; 14a4: 65 5a       eZ  :1373[1]
    tay                                                               ; 14a6: a8          .   :1375[1]
; $14a7 referenced 3 times by $1332, $133a, $1342
c1376
    rts                                                               ; 14a7: 60          `   :1376[1]

; $14a8 referenced 2 times by $1519, $160e
power_of_2_table
    !byte $01, $02, $04, $08, $10, $20, $40, $80                      ; 14a8: 01 02 04... ... :1377[1]

; $14b0 referenced 4 times by $1424, $153d, $162c, $16d0
c137f
    lda #0                                                            ; 14b0: a9 00       ..  :137f[1]
    sta l0015                                                         ; 14b2: 85 15       ..  :1381[1]
    lda #1                                                            ; 14b4: a9 01       ..  :1383[1]
    sta l001d                                                         ; 14b6: 85 1d       ..  :1385[1]
    pla                                                               ; 14b8: 68          h   :1387[1]
    tay                                                               ; 14b9: a8          .   :1388[1]
    pla                                                               ; 14ba: 68          h   :1389[1]
    tax                                                               ; 14bb: aa          .   :138a[1]
    pla                                                               ; 14bc: 68          h   :138b[1]
    rts                                                               ; 14bd: 60          `   :138c[1]

; $14be referenced 11 times by $1f51, $2194, $21d0, $21fc, $2a01, $2a0c, $2a2d, $2b30, $2c2f, $2c35, $2c3a
sub_c138d
    pha                                                               ; 14be: 48          H   :138d[1]
    txa                                                               ; 14bf: 8a          .   :138e[1]
    pha                                                               ; 14c0: 48          H   :138f[1]
    tya                                                               ; 14c1: 98          .   :1390[1]
    pha                                                               ; 14c2: 48          H   :1391[1]
    lda l0016                                                         ; 14c3: a5 16       ..  :1392[1]
    jsr set_yx_based_on_a                                             ; 14c5: 20 2c 13     ,. :1394[1]
    stx l0070                                                         ; 14c8: 86 70       .p  :1397[1]
    sty l0071                                                         ; 14ca: 84 71       .q  :1399[1]
    lda l0015                                                         ; 14cc: a5 15       ..  :139b[1]
    and #1                                                            ; 14ce: 29 01       ).  :139d[1]
    beq c13b5                                                         ; 14d0: f0 14       ..  :139f[1]
    lda l0014                                                         ; 14d2: a5 14       ..  :13a1[1]
    jsr set_yx_based_on_a                                             ; 14d4: 20 2c 13     ,. :13a3[1]
    stx l007e                                                         ; 14d7: 86 7e       .~  :13a6[1]
    sty l007f                                                         ; 14d9: 84 7f       ..  :13a8[1]
    ldy #3                                                            ; 14db: a0 03       ..  :13aa[1]
; $14dd referenced 1 time by $13b1
loop_c13ac
    lda (l0070),y                                                     ; 14dd: b1 70       .p  :13ac[1]
    sta (l007e),y                                                     ; 14df: 91 7e       .~  :13ae[1]
    dey                                                               ; 14e1: 88          .   :13b0[1]
    bpl loop_c13ac                                                    ; 14e2: 10 f9       ..  :13b1[1]
    sty l0080                                                         ; 14e4: 84 80       ..  :13b3[1]
; $14e6 referenced 1 time by $139f
c13b5
    ldy #0                                                            ; 14e6: a0 00       ..  :13b5[1]
    lda (l0070),y                                                     ; 14e8: b1 70       .p  :13b7[1]
    ldx l001d                                                         ; 14ea: a6 1d       ..  :13b9[1]
    bpl c13bf                                                         ; 14ec: 10 02       ..  :13bb[1]
    eor #$ff                                                          ; 14ee: 49 ff       I.  :13bd[1]
; $14f0 referenced 1 time by $13bb
c13bf
    ldx #0                                                            ; 14f0: a2 00       ..  :13bf[1]
    ora #0                                                            ; 14f2: 09 00       ..  :13c1[1]
    bpl c13c6                                                         ; 14f4: 10 01       ..  :13c3[1]
    dex                                                               ; 14f6: ca          .   :13c5[1]
; $14f7 referenced 1 time by $13c3
c13c6
    clc                                                               ; 14f7: 18          .   :13c6[1]
    adc l0018                                                         ; 14f8: 65 18       e.  :13c7[1]
    sta l0074                                                         ; 14fa: 85 74       .t  :13c9[1]
    txa                                                               ; 14fc: 8a          .   :13cb[1]
    adc l0019                                                         ; 14fd: 65 19       e.  :13cc[1]
    sta l0075                                                         ; 14ff: 85 75       .u  :13ce[1]
    ldx #0                                                            ; 1501: a2 00       ..  :13d0[1]
    iny                                                               ; 1503: c8          .   :13d2[1]
    lda (l0070),y                                                     ; 1504: b1 70       .p  :13d3[1]
    bpl c13d8                                                         ; 1506: 10 01       ..  :13d5[1]
    dex                                                               ; 1508: ca          .   :13d7[1]
; $1509 referenced 1 time by $13d5
c13d8
    clc                                                               ; 1509: 18          .   :13d8[1]
    adc l001a                                                         ; 150a: 65 1a       e.  :13d9[1]
    sta l0076                                                         ; 150c: 85 76       .v  :13db[1]
    txa                                                               ; 150e: 8a          .   :13dd[1]
    adc l001b                                                         ; 150f: 65 1b       e.  :13de[1]
    sta l0077                                                         ; 1511: 85 77       .w  :13e0[1]
    iny                                                               ; 1513: c8          .   :13e2[1]
    lda (l0070),y                                                     ; 1514: b1 70       .p  :13e3[1]
    sta l0081                                                         ; 1516: 85 81       ..  :13e5[1]
    ldy #4                                                            ; 1518: a0 04       ..  :13e7[1]
    lda (l0070),y                                                     ; 151a: b1 70       .p  :13e9[1]
    sta l007d                                                         ; 151c: 85 7d       .}  :13eb[1]
    sty l0079                                                         ; 151e: 84 79       .y  :13ed[1]
    lda #4                                                            ; 1520: a9 04       ..  :13ef[1]
    sta l0087                                                         ; 1522: 85 87       ..  :13f1[1]
    jsr sub_c162f                                                     ; 1524: 20 2f 16     /. :13f3[1]
    lda l0077                                                         ; 1527: a5 77       .w  :13f6[1]
    sta l0073                                                         ; 1529: 85 73       .s  :13f8[1]
    lda l0076                                                         ; 152b: a5 76       .v  :13fa[1]
    and #$f8                                                          ; 152d: 29 f8       ).  :13fc[1]
    asl                                                               ; 152f: 0a          .   :13fe[1]
    rol l0073                                                         ; 1530: 26 73       &s  :13ff[1]
    asl                                                               ; 1532: 0a          .   :1401[1]
    rol l0073                                                         ; 1533: 26 73       &s  :1402[1]
    asl                                                               ; 1535: 0a          .   :1404[1]
    rol l0073                                                         ; 1536: 26 73       &s  :1405[1]
    sta l0072                                                         ; 1538: 85 72       .r  :1407[1]
    ldx l0073                                                         ; 153a: a6 73       .s  :1409[1]
    asl                                                               ; 153c: 0a          .   :140b[1]
    rol l0073                                                         ; 153d: 26 73       &s  :140c[1]
    asl                                                               ; 153f: 0a          .   :140e[1]
    rol l0073                                                         ; 1540: 26 73       &s  :140f[1]
    lda l0074                                                         ; 1542: a5 74       .t  :1411[1]
    and #$f8                                                          ; 1544: 29 f8       ).  :1413[1]
    clc                                                               ; 1546: 18          .   :1415[1]
    adc l0072                                                         ; 1547: 65 72       er  :1416[1]
    sta l0072                                                         ; 1549: 85 72       .r  :1418[1]
    sta l007b                                                         ; 154b: 85 7b       .{  :141a[1]
    txa                                                               ; 154d: 8a          .   :141c[1]
    adc l0073                                                         ; 154e: 65 73       es  :141d[1]
    clc                                                               ; 1550: 18          .   :141f[1]
    adc l0075                                                         ; 1551: 65 75       eu  :1420[1]
    bpl c1427                                                         ; 1553: 10 03       ..  :1422[1]
    jmp c137f                                                         ; 1555: 4c 7f 13    L.. :1424[1]

; $1558 referenced 1 time by $1422
c1427
    clc                                                               ; 1558: 18          .   :1427[1]
    adc l004c                                                         ; 1559: 65 4c       eL  :1428[1]
    sta l0073                                                         ; 155b: 85 73       .s  :142a[1]
    sta l007c                                                         ; 155d: 85 7c       .|  :142c[1]
    lda l0074                                                         ; 155f: a5 74       .t  :142e[1]
    and #7                                                            ; 1561: 29 07       ).  :1430[1]
    eor #7                                                            ; 1563: 49 07       I.  :1432[1]
    tay                                                               ; 1565: a8          .   :1434[1]
    lda l0076                                                         ; 1566: a5 76       .v  :1435[1]
    and #7                                                            ; 1568: 29 07       ).  :1437[1]
    sta l0084                                                         ; 156a: 85 84       ..  :1439[1]
    ldx l0087                                                         ; 156c: a6 87       ..  :143b[1]
    lda l0015                                                         ; 156e: a5 15       ..  :143d[1]
    and #1                                                            ; 1570: 29 01       ).  :143f[1]
    beq c1446                                                         ; 1572: f0 03       ..  :1441[1]
    jmp c160c                                                         ; 1574: 4c 0c 16    L.. :1443[1]

; $1577 referenced 1 time by $1441
c1446
    lda l0015                                                         ; 1577: a5 15       ..  :1446[1]
    and #6                                                            ; 1579: 29 06       ).  :1448[1]
    beq c146e                                                         ; 157b: f0 22       ."  :144a[1]
    and #4                                                            ; 157d: 29 04       ).  :144c[1]
    bne c1466                                                         ; 157f: d0 16       ..  :144e[1]
    lda #$18                                                          ; 1581: a9 18       ..  :1450[1]
    sta c1486                                                         ; 1583: 8d 86 14    ... :1452[1]
    lda #$4c ; 'L'                                                    ; 1586: a9 4c       .L  :1455[1]
    sta l1487                                                         ; 1588: 8d 87 14    ... :1457[1]
    lda #$98                                                          ; 158b: a9 98       ..  :145a[1]
    sta c1488                                                         ; 158d: 8d 88 14    ... :145c[1]
    lda #$14                                                          ; 1590: a9 14       ..  :145f[1]
    sta l1489                                                         ; 1592: 8d 89 14    ... :1461[1]
    bne c146e                                                         ; 1595: d0 08       ..  :1464[1]
; $1597 referenced 1 time by $144e
c1466
    lda #$38 ; '8'                                                    ; 1597: a9 38       .8  :1466[1]
    sta c1486                                                         ; 1599: 8d 86 14    ... :1468[1]
    sta l1487                                                         ; 159c: 8d 87 14    ... :146b[1]
; $159f referenced 2 times by $144a, $1464
c146e
    jmp c1517                                                         ; 159f: 4c 17 15    L.. :146e[1]

; $15a2 referenced 1 time by $1480
loop_c1471
    asl l007d                                                         ; 15a2: 06 7d       .}  :1471[1]
    clc                                                               ; 15a4: 18          .   :1473[1]
    jmp c149c                                                         ; 15a5: 4c 9c 14    L.. :1474[1]

; $15a8 referenced 2 times by $14b1, $14b5
c1477
    lda #0                                                            ; 15a8: a9 00       ..  :1477[1]
    sta l0088                                                         ; 15aa: 85 88       ..  :1479[1]
    jmp c14b7                                                         ; 15ac: 4c b7 14    L.. :147b[1]

; $15af referenced 1 time by $14ca
c147e
    lda l0088                                                         ; 15af: a5 88       ..  :147e[1]
    beq loop_c1471                                                    ; 15b1: f0 ef       ..  :1480[1]
    lda (l0072),y                                                     ; 15b3: b1 72       .r  :1482[1]
    asl l007d                                                         ; 15b5: 06 7d       .}  :1484[1]
; $15b7 referenced 3 times by $1452, $1468, $152b
c1486
l1487 = c1486+1
    bcc c1498                                                         ; 15b7: 90 10       ..  :1486[1]
; $15b8 referenced 3 times by $1457, $146b, $1530
; $15b9 referenced 2 times by $145c, $1535
c1488
l1489 = c1488+1
    ora l0082                                                         ; 15b9: 05 82       ..  :1488[1]
; $15ba referenced 2 times by $1461, $153a
    sta (l0072),y                                                     ; 15bb: 91 72       .r  :148a[1]
    dey                                                               ; 15bd: 88          .   :148c[1]
    bpl c14b7                                                         ; 15be: 10 28       .(  :148d[1]
    ldy #7                                                            ; 15c0: a0 07       ..  :148f[1]
    lda l0072                                                         ; 15c2: a5 72       .r  :1491[1]
    sbc #$40 ; '@'                                                    ; 15c4: e9 40       .@  :1493[1]
    jmp c14a5                                                         ; 15c6: 4c a5 14    L.. :1495[1]

; $15c9 referenced 1 time by $1486
c1498
    and l0083                                                         ; 15c9: 25 83       %.  :1498[1]
    sta (l0072),y                                                     ; 15cb: 91 72       .r  :149a[1]
; $15cd referenced 2 times by $1474, $14ce
c149c
    dey                                                               ; 15cd: 88          .   :149c[1]
    bpl c14b7                                                         ; 15ce: 10 18       ..  :149d[1]
    ldy #7                                                            ; 15d0: a0 07       ..  :149f[1]
    lda l0072                                                         ; 15d2: a5 72       .r  :14a1[1]
    sbc #$3f ; '?'                                                    ; 15d4: e9 3f       .?  :14a3[1]
; $15d6 referenced 1 time by $1495
c14a5
    sta l0072                                                         ; 15d6: 85 72       .r  :14a5[1]
    lda l0073                                                         ; 15d8: a5 73       .s  :14a7[1]
    sbc #1                                                            ; 15da: e9 01       ..  :14a9[1]
    sta l0073                                                         ; 15dc: 85 73       .s  :14ab[1]
; $15de referenced 1 time by $1526
c14ad
    sta l0088                                                         ; 15de: 85 88       ..  :14ad[1]
    cmp #$80                                                          ; 15e0: c9 80       ..  :14af[1]
    bcs c1477                                                         ; 15e2: b0 c4       ..  :14b1[1]
    cmp l004c                                                         ; 15e4: c5 4c       .L  :14b3[1]
    bcc c1477                                                         ; 15e6: 90 c0       ..  :14b5[1]
; $15e8 referenced 3 times by $147b, $148d, $149d
c14b7
    dex                                                               ; 15e8: ca          .   :14b7[1]
    bpl c14c8                                                         ; 15e9: 10 0e       ..  :14b8[1]
    sty l007a                                                         ; 15eb: 84 7a       .z  :14ba[1]
    inc l0079                                                         ; 15ed: e6 79       .y  :14bc[1]
    ldy l0079                                                         ; 15ef: a4 79       .y  :14be[1]
    lda (l0070),y                                                     ; 15f1: b1 70       .p  :14c0[1]
    sta l007d                                                         ; 15f3: 85 7d       .}  :14c2[1]
    ldx #3                                                            ; 15f5: a2 03       ..  :14c4[1]
    ldy l007a                                                         ; 15f7: a4 7a       .z  :14c6[1]
; $15f9 referenced 1 time by $14b8
c14c8
    asl l007d                                                         ; 15f9: 06 7d       .}  :14c8[1]
    bcc c147e                                                         ; 15fb: 90 b2       ..  :14ca[1]
    asl l007d                                                         ; 15fd: 06 7d       .}  :14cc[1]
    bcc c149c                                                         ; 15ff: 90 cc       ..  :14ce[1]
    dec l0081                                                         ; 1601: c6 81       ..  :14d0[1]
    beq c1529                                                         ; 1603: f0 55       .U  :14d2[1]
    lda l007c                                                         ; 1605: a5 7c       .|  :14d4[1]
    sta l0073                                                         ; 1607: 85 73       .s  :14d6[1]
    lda l007b                                                         ; 1609: a5 7b       .{  :14d8[1]
    sta l0072                                                         ; 160b: 85 72       .r  :14da[1]
    ldy l001d                                                         ; 160d: a4 1d       ..  :14dc[1]
    bmi c14fe                                                         ; 160f: 30 1e       0.  :14de[1]
    ldy l0078                                                         ; 1611: a4 78       .x  :14e0[1]
    dey                                                               ; 1613: 88          .   :14e2[1]
    bpl c1517                                                         ; 1614: 10 32       .2  :14e3[1]
    inc l0085                                                         ; 1616: e6 85       ..  :14e5[1]
    ldy l0085                                                         ; 1618: a4 85       ..  :14e7[1]
    cpy #$28 ; '('                                                    ; 161a: c0 28       .(  :14e9[1]
    bcs c1529                                                         ; 161c: b0 3c       .<  :14eb[1]
    ldy #7                                                            ; 161e: a0 07       ..  :14ed[1]
    adc #8                                                            ; 1620: 69 08       i.  :14ef[1]
    sta l007b                                                         ; 1622: 85 7b       .{  :14f1[1]
    sta l0072                                                         ; 1624: 85 72       .r  :14f3[1]
    bcc c1517                                                         ; 1626: 90 20       .   :14f5[1]
    inc l007c                                                         ; 1628: e6 7c       .|  :14f7[1]
    inc l0073                                                         ; 162a: e6 73       .s  :14f9[1]
    jmp c1517                                                         ; 162c: 4c 17 15    L.. :14fb[1]

; $162f referenced 1 time by $14de
c14fe
    ldy l0078                                                         ; 162f: a4 78       .x  :14fe[1]
    iny                                                               ; 1631: c8          .   :1500[1]
    cpy #8                                                            ; 1632: c0 08       ..  :1501[1]
    bcc c1517                                                         ; 1634: 90 12       ..  :1503[1]
    dec l0085                                                         ; 1636: c6 85       ..  :1505[1]
    bmi c1529                                                         ; 1638: 30 20       0   :1507[1]
    ldy #0                                                            ; 163a: a0 00       ..  :1509[1]
    sbc #8                                                            ; 163c: e9 08       ..  :150b[1]
    sta l007b                                                         ; 163e: 85 7b       .{  :150d[1]
    sta l0072                                                         ; 1640: 85 72       .r  :150f[1]
    bcs c1517                                                         ; 1642: b0 04       ..  :1511[1]
    dec l007c                                                         ; 1644: c6 7c       .|  :1513[1]
    dec l0073                                                         ; 1646: c6 73       .s  :1515[1]
; $1648 referenced 6 times by $146e, $14e3, $14f5, $14fb, $1503, $1511
c1517
    sty l0078                                                         ; 1648: 84 78       .x  :1517[1]
    lda power_of_2_table,y                                            ; 164a: b9 77 13    .w. :1519[1]
    sta l0082                                                         ; 164d: 85 82       ..  :151c[1]
    eor #$ff                                                          ; 164f: 49 ff       I.  :151e[1]
    sta l0083                                                         ; 1651: 85 83       ..  :1520[1]
    ldy l0084                                                         ; 1653: a4 84       ..  :1522[1]
    lda l0073                                                         ; 1655: a5 73       .s  :1524[1]
    jmp c14ad                                                         ; 1657: 4c ad 14    L.. :1526[1]

; $165a referenced 3 times by $14d2, $14eb, $1507
c1529
    lda #$90                                                          ; 165a: a9 90       ..  :1529[1]
    sta c1486                                                         ; 165c: 8d 86 14    ... :152b[1]
    lda #$10                                                          ; 165f: a9 10       ..  :152e[1]
    sta l1487                                                         ; 1661: 8d 87 14    ... :1530[1]
    lda #5                                                            ; 1664: a9 05       ..  :1533[1]
    sta c1488                                                         ; 1666: 8d 88 14    ... :1535[1]
    lda #$82                                                          ; 1669: a9 82       ..  :1538[1]
    sta l1489                                                         ; 166b: 8d 89 14    ... :153a[1]
    jmp c137f                                                         ; 166e: 4c 7f 13    L.. :153d[1]

; $1671 referenced 1 time by $1553
loop_c1540
    asl l007d                                                         ; 1671: 06 7d       .}  :1540[1]
    sec                                                               ; 1673: 38          8   :1542[1]
    rol l0080                                                         ; 1674: 26 80       &.  :1543[1]
    asl l0080                                                         ; 1676: 06 80       ..  :1545[1]
    jmp c1568                                                         ; 1678: 4c 68 15    Lh. :1547[1]

; $167b referenced 2 times by $158d, $1591
c154a
    lda #0                                                            ; 167b: a9 00       ..  :154a[1]
    sta l0088                                                         ; 167d: 85 88       ..  :154c[1]
    jmp c1593                                                         ; 167f: 4c 93 15    L.. :154e[1]

; $1682 referenced 1 time by $15ad
c1551
    lda l0088                                                         ; 1682: a5 88       ..  :1551[1]
    beq loop_c1540                                                    ; 1684: f0 eb       ..  :1553[1]
    asl l0080                                                         ; 1686: 06 80       ..  :1555[1]
    lda (l0072),y                                                     ; 1688: b1 72       .r  :1557[1]
    bit l0082                                                         ; 168a: 24 82       $.  :1559[1]
    bne c155e                                                         ; 168c: d0 01       ..  :155b[1]
    clc                                                               ; 168e: 18          .   :155d[1]
; $168f referenced 1 time by $155b
c155e
    rol l0080                                                         ; 168f: 26 80       &.  :155e[1]
    asl l007d                                                         ; 1691: 06 7d       .}  :1560[1]
    bcc c1574                                                         ; 1693: 90 10       ..  :1562[1]
    ora l0082                                                         ; 1695: 05 82       ..  :1564[1]
    sta (l0072),y                                                     ; 1697: 91 72       .r  :1566[1]
; $1699 referenced 1 time by $1547
c1568
    dey                                                               ; 1699: 88          .   :1568[1]
    bpl c1593                                                         ; 169a: 10 28       .(  :1569[1]
    ldy #7                                                            ; 169c: a0 07       ..  :156b[1]
    lda l0072                                                         ; 169e: a5 72       .r  :156d[1]
    sbc #$40 ; '@'                                                    ; 16a0: e9 40       .@  :156f[1]
    jmp c1581                                                         ; 16a2: 4c 81 15    L.. :1571[1]

; $16a5 referenced 1 time by $1562
c1574
    and l0083                                                         ; 16a5: 25 83       %.  :1574[1]
    sta (l0072),y                                                     ; 16a7: 91 72       .r  :1576[1]
    dey                                                               ; 16a9: 88          .   :1578[1]
    bpl c1593                                                         ; 16aa: 10 18       ..  :1579[1]
    ldy #7                                                            ; 16ac: a0 07       ..  :157b[1]
    lda l0072                                                         ; 16ae: a5 72       .r  :157d[1]
    sbc #$3f ; '?'                                                    ; 16b0: e9 3f       .?  :157f[1]
; $16b2 referenced 2 times by $1571, $15c0
c1581
    sta l0072                                                         ; 16b2: 85 72       .r  :1581[1]
    lda l0073                                                         ; 16b4: a5 73       .s  :1583[1]
    sbc #1                                                            ; 16b6: e9 01       ..  :1585[1]
    sta l0073                                                         ; 16b8: 85 73       .s  :1587[1]
; $16ba referenced 1 time by $161b
c1589
    sta l0088                                                         ; 16ba: 85 88       ..  :1589[1]
    cmp #$80                                                          ; 16bc: c9 80       ..  :158b[1]
    bcs c154a                                                         ; 16be: b0 bb       ..  :158d[1]
    cmp l004c                                                         ; 16c0: c5 4c       .L  :158f[1]
    bcc c154a                                                         ; 16c2: 90 b7       ..  :1591[1]
; $16c4 referenced 4 times by $154e, $1569, $1579, $15b8
c1593
    dex                                                               ; 16c4: ca          .   :1593[1]
    bpl c15ab                                                         ; 16c5: 10 15       ..  :1594[1]
    sty l007a                                                         ; 16c7: 84 7a       .z  :1596[1]
    ldy l0079                                                         ; 16c9: a4 79       .y  :1598[1]
    lda l0080                                                         ; 16cb: a5 80       ..  :159a[1]
    sta (l007e),y                                                     ; 16cd: 91 7e       .~  :159c[1]
    iny                                                               ; 16cf: c8          .   :159e[1]
    sty l0079                                                         ; 16d0: 84 79       .y  :159f[1]
    lda (l0070),y                                                     ; 16d2: b1 70       .p  :15a1[1]
    sta l007d                                                         ; 16d4: 85 7d       .}  :15a3[1]
    stx l0080                                                         ; 16d6: 86 80       ..  :15a5[1]
    ldx #3                                                            ; 16d8: a2 03       ..  :15a7[1]
    ldy l007a                                                         ; 16da: a4 7a       .z  :15a9[1]
; $16dc referenced 1 time by $1594
c15ab
    asl l007d                                                         ; 16dc: 06 7d       .}  :15ab[1]
    bcc c1551                                                         ; 16de: 90 a2       ..  :15ad[1]
    rol l0080                                                         ; 16e0: 26 80       &.  :15af[1]
    asl l007d                                                         ; 16e2: 06 7d       .}  :15b1[1]
    bcs c15c3                                                         ; 16e4: b0 0e       ..  :15b3[1]
    rol l0080                                                         ; 16e6: 26 80       &.  :15b5[1]
    dey                                                               ; 16e8: 88          .   :15b7[1]
    bpl c1593                                                         ; 16e9: 10 d9       ..  :15b8[1]
    ldy #7                                                            ; 16eb: a0 07       ..  :15ba[1]
    lda l0072                                                         ; 16ed: a5 72       .r  :15bc[1]
    sbc #$40 ; '@'                                                    ; 16ef: e9 40       .@  :15be[1]
    jmp c1581                                                         ; 16f1: 4c 81 15    L.. :15c0[1]

; $16f4 referenced 1 time by $15b3
c15c3
    rol l0080                                                         ; 16f4: 26 80       &.  :15c3[1]
    dec l0081                                                         ; 16f6: c6 81       ..  :15c5[1]
    beq c161e                                                         ; 16f8: f0 55       .U  :15c7[1]
    lda l007c                                                         ; 16fa: a5 7c       .|  :15c9[1]
    sta l0073                                                         ; 16fc: 85 73       .s  :15cb[1]
    lda l007b                                                         ; 16fe: a5 7b       .{  :15cd[1]
    sta l0072                                                         ; 1700: 85 72       .r  :15cf[1]
    ldy l001d                                                         ; 1702: a4 1d       ..  :15d1[1]
    bmi c15f3                                                         ; 1704: 30 1e       0.  :15d3[1]
    ldy l0078                                                         ; 1706: a4 78       .x  :15d5[1]
    dey                                                               ; 1708: 88          .   :15d7[1]
    bpl c160c                                                         ; 1709: 10 32       .2  :15d8[1]
    inc l0085                                                         ; 170b: e6 85       ..  :15da[1]
    ldy l0085                                                         ; 170d: a4 85       ..  :15dc[1]
    cpy #$28 ; '('                                                    ; 170f: c0 28       .(  :15de[1]
    bcs c161e                                                         ; 1711: b0 3c       .<  :15e0[1]
    ldy #7                                                            ; 1713: a0 07       ..  :15e2[1]
    adc #8                                                            ; 1715: 69 08       i.  :15e4[1]
    sta l007b                                                         ; 1717: 85 7b       .{  :15e6[1]
    sta l0072                                                         ; 1719: 85 72       .r  :15e8[1]
    bcc c160c                                                         ; 171b: 90 20       .   :15ea[1]
    inc l007c                                                         ; 171d: e6 7c       .|  :15ec[1]
    inc l0073                                                         ; 171f: e6 73       .s  :15ee[1]
    jmp c160c                                                         ; 1721: 4c 0c 16    L.. :15f0[1]

; $1724 referenced 1 time by $15d3
c15f3
    ldy l0078                                                         ; 1724: a4 78       .x  :15f3[1]
    iny                                                               ; 1726: c8          .   :15f5[1]
    cpy #8                                                            ; 1727: c0 08       ..  :15f6[1]
    bcc c160c                                                         ; 1729: 90 12       ..  :15f8[1]
    dec l0085                                                         ; 172b: c6 85       ..  :15fa[1]
    bmi c161e                                                         ; 172d: 30 20       0   :15fc[1]
    ldy #0                                                            ; 172f: a0 00       ..  :15fe[1]
    sbc #8                                                            ; 1731: e9 08       ..  :1600[1]
    sta l007b                                                         ; 1733: 85 7b       .{  :1602[1]
    sta l0072                                                         ; 1735: 85 72       .r  :1604[1]
    bcs c160c                                                         ; 1737: b0 04       ..  :1606[1]
    dec l007c                                                         ; 1739: c6 7c       .|  :1608[1]
    dec l0073                                                         ; 173b: c6 73       .s  :160a[1]
; $173d referenced 6 times by $1443, $15d8, $15ea, $15f0, $15f8, $1606
c160c
    sty l0078                                                         ; 173d: 84 78       .x  :160c[1]
    lda power_of_2_table,y                                            ; 173f: b9 77 13    .w. :160e[1]
    sta l0082                                                         ; 1742: 85 82       ..  :1611[1]
    eor #$ff                                                          ; 1744: 49 ff       I.  :1613[1]
    sta l0083                                                         ; 1746: 85 83       ..  :1615[1]
    ldy l0084                                                         ; 1748: a4 84       ..  :1617[1]
    lda l0073                                                         ; 174a: a5 73       .s  :1619[1]
    jmp c1589                                                         ; 174c: 4c 89 15    L.. :161b[1]

; $174f referenced 3 times by $15c7, $15e0, $15fc
c161e
    lda l0080                                                         ; 174f: a5 80       ..  :161e[1]
    dex                                                               ; 1751: ca          .   :1620[1]
    bmi c1628                                                         ; 1752: 30 05       0.  :1621[1]
; $1754 referenced 1 time by $1626
loop_c1623
    asl                                                               ; 1754: 0a          .   :1623[1]
    asl                                                               ; 1755: 0a          .   :1624[1]
    dex                                                               ; 1756: ca          .   :1625[1]
    bpl loop_c1623                                                    ; 1757: 10 fb       ..  :1626[1]
; $1759 referenced 1 time by $1621
c1628
    ldy l0079                                                         ; 1759: a4 79       .y  :1628[1]
    sta (l007e),y                                                     ; 175b: 91 7e       .~  :162a[1]
    jmp c137f                                                         ; 175d: 4c 7f 13    L.. :162c[1]

; $1760 referenced 1 time by $13f3
sub_c162f
    ldy l0075                                                         ; 1760: a4 75       .u  :162f[1]
    iny                                                               ; 1762: c8          .   :1631[1]
    cpy #3                                                            ; 1763: c0 03       ..  :1632[1]
    bcs c163d                                                         ; 1765: b0 07       ..  :1634[1]
    ldy l0077                                                         ; 1767: a4 77       .w  :1636[1]
    iny                                                               ; 1769: c8          .   :1638[1]
    cpy #3                                                            ; 176a: c0 03       ..  :1639[1]
    bcc c1640                                                         ; 176c: 90 03       ..  :163b[1]
; $176e referenced 1 time by $1634
c163d
    jmp c16ce                                                         ; 176e: 4c ce 16    L.. :163d[1]

; $1771 referenced 1 time by $163b
c1640
    lda l0074                                                         ; 1771: a5 74       .t  :1640[1]
    sta l0085                                                         ; 1773: 85 85       ..  :1642[1]
    lda l0075                                                         ; 1775: a5 75       .u  :1644[1]
    lsr                                                               ; 1777: 4a          J   :1646[1]
    ror l0085                                                         ; 1778: 66 85       f.  :1647[1]
    lsr                                                               ; 177a: 4a          J   :1649[1]
    ror l0085                                                         ; 177b: 66 85       f.  :164a[1]
    lsr                                                               ; 177d: 4a          J   :164c[1]
    ror l0085                                                         ; 177e: 66 85       f.  :164d[1]
    lda l001d                                                         ; 1780: a5 1d       ..  :164f[1]
    bmi c1670                                                         ; 1782: 30 1d       0.  :1651[1]
    lda l0085                                                         ; 1784: a5 85       ..  :1653[1]
    bmi c165e                                                         ; 1786: 30 07       0.  :1655[1]
    cmp #$28 ; '('                                                    ; 1788: c9 28       .(  :1657[1]
    bcc c16cd                                                         ; 178a: 90 72       .r  :1659[1]
    jmp c16ce                                                         ; 178c: 4c ce 16    L.. :165b[1]

; $178f referenced 1 time by $1655
c165e
    lda #0                                                            ; 178f: a9 00       ..  :165e[1]
    sec                                                               ; 1791: 38          8   :1660[1]
    sbc l0074                                                         ; 1792: e5 74       .t  :1661[1]
    sta l0086                                                         ; 1794: 85 86       ..  :1663[1]
    lda #0                                                            ; 1796: a9 00       ..  :1665[1]
    sta l0074                                                         ; 1798: 85 74       .t  :1667[1]
    sta l0075                                                         ; 179a: 85 75       .u  :1669[1]
    sta l0085                                                         ; 179c: 85 85       ..  :166b[1]
    jmp c168a                                                         ; 179e: 4c 8a 16    L.. :166d[1]

; $17a1 referenced 1 time by $1651
c1670
    lda l0085                                                         ; 17a1: a5 85       ..  :1670[1]
    bmi c16ce                                                         ; 17a3: 30 5a       0Z  :1672[1]
    cmp #$28 ; '('                                                    ; 17a5: c9 28       .(  :1674[1]
    bcc c16cd                                                         ; 17a7: 90 55       .U  :1676[1]
    lda l0074                                                         ; 17a9: a5 74       .t  :1678[1]
    sbc #$3f ; '?'                                                    ; 17ab: e9 3f       .?  :167a[1]
    sta l0086                                                         ; 17ad: 85 86       ..  :167c[1]
    lda #$3f ; '?'                                                    ; 17af: a9 3f       .?  :167e[1]
    sta l0074                                                         ; 17b1: 85 74       .t  :1680[1]
    lda #1                                                            ; 17b3: a9 01       ..  :1682[1]
    sta l0075                                                         ; 17b5: 85 75       .u  :1684[1]
    lda #$27 ; '''                                                    ; 17b7: a9 27       .'  :1686[1]
    sta l0085                                                         ; 17b9: 85 85       ..  :1688[1]
; $17bb referenced 1 time by $166d
c168a
    lda l0086                                                         ; 17bb: a5 86       ..  :168a[1]
    cmp l0081                                                         ; 17bd: c5 81       ..  :168c[1]
    bcs c16ce                                                         ; 17bf: b0 3e       .>  :168e[1]
    lda l007d                                                         ; 17c1: a5 7d       .}  :1690[1]
    ldx l0087                                                         ; 17c3: a6 87       ..  :1692[1]
    ldy l0079                                                         ; 17c5: a4 79       .y  :1694[1]
; $17c7 referenced 3 times by $16b2, $16bc, $16c5
c1696
    dex                                                               ; 17c7: ca          .   :1696[1]
    bpl c16aa                                                         ; 17c8: 10 11       ..  :1697[1]
    lda l0015                                                         ; 17ca: a5 15       ..  :1699[1]
    and #1                                                            ; 17cc: 29 01       ).  :169b[1]
    beq c16a5                                                         ; 17ce: f0 06       ..  :169d[1]
    lda l0080                                                         ; 17d0: a5 80       ..  :169f[1]
    sta (l007e),y                                                     ; 17d2: 91 7e       .~  :16a1[1]
    stx l0080                                                         ; 17d4: 86 80       ..  :16a3[1]
; $17d6 referenced 1 time by $169d
c16a5
    iny                                                               ; 17d6: c8          .   :16a5[1]
    lda (l0070),y                                                     ; 17d7: b1 70       .p  :16a6[1]
    ldx #3                                                            ; 17d9: a2 03       ..  :16a8[1]
; $17db referenced 1 time by $1697
c16aa
    asl                                                               ; 17db: 0a          .   :16aa[1]
    bcs c16b5                                                         ; 17dc: b0 08       ..  :16ab[1]
    rol l0080                                                         ; 17de: 26 80       &.  :16ad[1]
    asl                                                               ; 17e0: 0a          .   :16af[1]
    rol l0080                                                         ; 17e1: 26 80       &.  :16b0[1]
    jmp c1696                                                         ; 17e3: 4c 96 16    L.. :16b2[1]

; $17e6 referenced 1 time by $16ab
c16b5
    rol l0080                                                         ; 17e6: 26 80       &.  :16b5[1]
    asl                                                               ; 17e8: 0a          .   :16b7[1]
    bcs c16bf                                                         ; 17e9: b0 05       ..  :16b8[1]
    rol l0080                                                         ; 17eb: 26 80       &.  :16ba[1]
    jmp c1696                                                         ; 17ed: 4c 96 16    L.. :16bc[1]

; $17f0 referenced 1 time by $16b8
c16bf
    rol l0080                                                         ; 17f0: 26 80       &.  :16bf[1]
    dec l0081                                                         ; 17f2: c6 81       ..  :16c1[1]
    dec l0086                                                         ; 17f4: c6 86       ..  :16c3[1]
    bne c1696                                                         ; 17f6: d0 cf       ..  :16c5[1]
    sta l007d                                                         ; 17f8: 85 7d       .}  :16c7[1]
    stx l0087                                                         ; 17fa: 86 87       ..  :16c9[1]
    sty l0079                                                         ; 17fc: 84 79       .y  :16cb[1]
; $17fe referenced 2 times by $1659, $1676
c16cd
    rts                                                               ; 17fe: 60          `   :16cd[1]

; $17ff referenced 4 times by $163d, $165b, $1672, $168e
c16ce
    pla                                                               ; 17ff: 68          h   :16ce[1]
    pla                                                               ; 1800: 68          h   :16cf[1]
    jmp c137f                                                         ; 1801: 4c 7f 13    L.. :16d0[1]

    !byte $a0,   0, $b1, $fd, $85,   2, $4c, $13, $17                 ; 1804: a0 00 b1... ... :16d3[1]

; $180d referenced 7 times by $1166, $197d, $3585, $35c3, $36b6, $3e69, $3e9b
osfile_wrapper
    stx l0072                                                         ; 180d: 86 72       .r  :16dc[1]
    sty l0073                                                         ; 180f: 84 73       .s  :16de[1]
    ldx #0                                                            ; 1811: a2 00       ..  :16e0[1]
    stx l0074                                                         ; 1813: 86 74       .t  :16e2[1]
    stx l0075                                                         ; 1815: 86 75       .u  :16e4[1]
    stx l0078                                                         ; 1817: 86 78       .x  :16e6[1]
    stx l0079                                                         ; 1819: 86 79       .y  :16e8[1]
    stx l007c                                                         ; 181b: 86 7c       .|  :16ea[1]
    stx l007d                                                         ; 181d: 86 7d       .}  :16ec[1]
    stx l0080                                                         ; 181f: 86 80       ..  :16ee[1]
    stx l0081                                                         ; 1821: 86 81       ..  :16f0[1]
    tay                                                               ; 1823: a8          .   :16f2[1]
    beq c16f7                                                         ; 1824: f0 02       ..  :16f3[1]
    stx l0076                                                         ; 1826: 86 76       .v  :16f5[1]
; $1828 referenced 1 time by $16f3
c16f7
    ldx #0                                                            ; 1828: a2 00       ..  :16f7[1]
    stx l0002                                                         ; 182a: 86 02       ..  :16f9[1]
    tsx                                                               ; 182c: ba          .   :16fb[1]
    stx l0003                                                         ; 182d: 86 03       ..  :16fc[1]
    sei                                                               ; 182f: 78          x   :16fe[1]
    ldx l0ab3                                                         ; 1830: ae b3 0a    ... :16ff[1]
    stx brkv                                                          ; 1833: 8e 02 02    ... :1702[1]
    ldx l0ab4                                                         ; 1836: ae b4 0a    ... :1705[1]
    stx brkv+1                                                        ; 1839: 8e 03 02    ... :1708[1]
    cli                                                               ; 183c: 58          X   :170b[1]
    ldx #<(l0070)                                                     ; 183d: a2 70       .p  :170c[1]
    ldy #>(l0070)                                                     ; 183f: a0 00       ..  :170e[1]
    jsr osfile                                                        ; 1841: 20 dd ff     .. :1710[1]
    sei                                                               ; 1844: 78          x   :1713[1]
    ldx l0ab1                                                         ; 1845: ae b1 0a    ... :1714[1]
    stx brkv                                                          ; 1848: 8e 02 02    ... :1717[1]
    ldx l0ab2                                                         ; 184b: ae b2 0a    ... :171a[1]
    stx brkv+1                                                        ; 184e: 8e 03 02    ... :171d[1]
    cli                                                               ; 1851: 58          X   :1720[1]
    ldx l0003                                                         ; 1852: a6 03       ..  :1721[1]
    txs                                                               ; 1854: 9a          .   :1723[1]
    lda l0002                                                         ; 1855: a5 02       ..  :1724[1]
    beq c174c                                                         ; 1857: f0 24       .$  :1726[1]
; $1859 referenced 1 time by $3598
sub_c1728
    lda l110a                                                         ; 1859: ad 0a 11    ... :1728[1]
    beq c174c                                                         ; 185c: f0 1f       ..  :172b[1]
    lda #vdu_bell                                                     ; 185e: a9 07       ..  :172d[1]
    jsr oswrch                                                        ; 1860: 20 ee ff     .. :172f[1]   ; Write character 7
    lda #$12                                                          ; 1863: a9 12       ..  :1732[1]
    sta l0409                                                         ; 1865: 8d 09 04    ... :1734[1]
    jsr sub_c040a                                                     ; 1868: 20 0a 04     .. :1737[1]
    lda #$0a                                                          ; 186b: a9 0a       ..  :173a[1]
    jsr oswrch                                                        ; 186d: 20 ee ff     .. :173c[1]   ; Write character 10
    ldx #$52 ; 'R'                                                    ; 1870: a2 52       .R  :173f[1]
    ldy #$17                                                          ; 1872: a0 17       ..  :1741[1]
    jsr sub_c37f3                                                     ; 1874: 20 f3 37     .7 :1743[1]
    jsr sub_c388d                                                     ; 1877: 20 8d 38     .8 :1746[1]
    jsr sub_c388d                                                     ; 187a: 20 8d 38     .8 :1749[1]
; $187d referenced 2 times by $1726, $172b
c174c
    jsr c3a8f                                                         ; 187d: 20 8f 3a     .: :174c[1]
    lda l0002                                                         ; 1880: a5 02       ..  :174f[1]
    rts                                                               ; 1882: 60          `   :1751[1]

    !byte $8f, $a2, $b8, $a0, $eb, $ae, $b9, $b9, $a4, $b9, $c6       ; 1883: 8f a2 b8... ... :1752[1]
; $188e referenced 3 times by $0c05, $1768, $1782
l175d
    !byte 0                                                           ; 188e: 00          .   :175d[1]
; $188f referenced 3 times by $0c08, $11fa, $17df
l175e
    !byte 0                                                           ; 188f: 00          .   :175e[1]
; $1890 referenced 3 times by $0c0b, $176b, $1787
l175f
    !byte 0                                                           ; 1890: 00          .   :175f[1]
; $1891 referenced 4 times by $0c0e, $11fd, $123c, $1808
l1760
    !byte 0                                                           ; 1891: 00          .   :1760[1]
; $1892 referenced 1 time by $177f
l1761
    !byte 3, 2, 7, 1                                                  ; 1892: 03 02 07... ... :1761[1]
; $1896 referenced 1 time by $176e
l1765
    !byte $ff                                                         ; 1896: ff          .   :1765[1]

; $1897 referenced 1 time by $1209
sub_c1766
    lda #7                                                            ; 1897: a9 07       ..  :1766[1]
    sta l175d                                                         ; 1899: 8d 5d 17    .]. :1768[1]
    sta l175f                                                         ; 189c: 8d 5f 17    ._. :176b[1]
    lda l1765                                                         ; 189f: ad 65 17    .e. :176e[1]
    beq c178a                                                         ; 18a2: f0 17       ..  :1771[1]
    ldy l0031                                                         ; 18a4: a4 31       .1  :1773[1]
    jsr something7_TODO                                               ; 18a6: 20 d4 0a     .. :1775[1]
    tya                                                               ; 18a9: 98          .   :1778[1]
    sec                                                               ; 18aa: 38          8   :1779[1]
    sbc #$41 ; 'A'                                                    ; 18ab: e9 41       .A  :177a[1]
    and #3                                                            ; 18ad: 29 03       ).  :177c[1]
    tax                                                               ; 18af: aa          .   :177e[1]
    lda l1761,x                                                       ; 18b0: bd 61 17    .a. :177f[1]
    sta l175d                                                         ; 18b3: 8d 5d 17    .]. :1782[1]
    lda #6                                                            ; 18b6: a9 06       ..  :1785[1]
    sta l175f                                                         ; 18b8: 8d 5f 17    ._. :1787[1]
; $18bb referenced 1 time by $1771
c178a
    rts                                                               ; 18bb: 60          `   :178a[1]

; $18bc referenced 3 times by $17f6, $388f, $3892
l178b
    !byte 0                                                           ; 18bc: 00          .   :178b[1]

; $18bd referenced 4 times by $0c31, $0c34, $1839, $2ab7
sub_c178c
    lda #osbyte_vsync                                                 ; 18bd: a9 13       ..  :178c[1]
    jmp osbyte                                                        ; 18bf: 4c f4 ff    L.. :178e[1]   ; Wait for vertical sync

; $18c2 referenced 2 times by $0406, $2a3e
c1791
    txa                                                               ; 18c2: 8a          .   :1791[1]
    clc                                                               ; 18c3: 18          .   :1792[1]
    adc #$ff                                                          ; 18c4: 69 ff       i.  :1793[1]
    tya                                                               ; 18c6: 98          .   :1795[1]
    adc #0                                                            ; 18c7: 69 00       i.  :1796[1]
    eor #$ff                                                          ; 18c9: 49 ff       I.  :1798[1]
; $18cb referenced 1 time by $179d
loop_c179a
    cmp system_via_t2c_h                                              ; 18cb: cd 49 fe    .I. :179a[1]
    bcc loop_c179a                                                    ; 18ce: 90 fb       ..  :179d[1]
    rts                                                               ; 18d0: 60          `   :179f[1]

something10_TODO
    pha                                                               ; 18d1: 48          H   :17a0[1]
    lda l00fc                                                         ; 18d2: a5 fc       ..  :17a1[1]
    pha                                                               ; 18d4: 48          H   :17a3[1]
    txa                                                               ; 18d5: 8a          .   :17a4[1]
    pha                                                               ; 18d6: 48          H   :17a5[1]
    tya                                                               ; 18d7: 98          .   :17a6[1]
    pha                                                               ; 18d8: 48          H   :17a7[1]
    jsr sub_c17b9                                                     ; 18d9: 20 b9 17     .. :17a8[1]
    jsr sub_c17fa                                                     ; 18dc: 20 fa 17     .. :17ab[1]
    pla                                                               ; 18df: 68          h   :17ae[1]
    tay                                                               ; 18e0: a8          .   :17af[1]
    pla                                                               ; 18e1: 68          h   :17b0[1]
    tax                                                               ; 18e2: aa          .   :17b1[1]
    pla                                                               ; 18e3: 68          h   :17b2[1]
    sta l00fc                                                         ; 18e4: 85 fc       ..  :17b3[1]
    pla                                                               ; 18e6: 68          h   :17b5[1]
    jmp (l0ab5)                                                       ; 18e7: 6c b5 0a    l.. :17b6[1]

; $18ea referenced 1 time by $17a8
sub_c17b9
    lda #2                                                            ; 18ea: a9 02       ..  :17b9[1]
    bit system_via_ifr                                                ; 18ec: 2c 4d fe    ,M. :17bb[1]
    beq c17f9                                                         ; 18ef: f0 39       .9  :17be[1]
    lda l1104                                                         ; 18f1: ad 04 11    ... :17c0[1]
    sta system_via_t1c_l                                              ; 18f4: 8d 44 fe    .D. :17c3[1]
    lda l1105                                                         ; 18f7: ad 05 11    ... :17c6[1]
    sta system_via_t1c_h                                              ; 18fa: 8d 45 fe    .E. :17c9[1]
    lda l1108                                                         ; 18fd: ad 08 11    ... :17cc[1]
    sta system_via_t1l_l                                              ; 1900: 8d 46 fe    .F. :17cf[1]
    lda l1109                                                         ; 1903: ad 09 11    ... :17d2[1]
    sta system_via_t1l_h                                              ; 1906: 8d 47 fe    .G. :17d5[1]
    lda #$ff                                                          ; 1909: a9 ff       ..  :17d8[1]
    sta system_via_t2c_h                                              ; 190b: 8d 49 fe    .I. :17da[1]
    ldx #1                                                            ; 190e: a2 01       ..  :17dd[1]
    ldy l175e                                                         ; 1910: ac 5e 17    .^. :17df[1]
    jsr sub_c1825                                                     ; 1913: 20 25 18     %. :17e2[1]
    lda copy_protection_flag                                          ; 1916: ad 03 11    ... :17e5[1]
    bpl c17f1                                                         ; 1919: 10 07       ..  :17e8[1]
    ldx #0                                                            ; 191b: a2 00       ..  :17ea[1]
    ldy #5                                                            ; 191d: a0 05       ..  :17ec[1]
    jsr sub_c1825                                                     ; 191f: 20 25 18     %. :17ee[1]
; $1922 referenced 1 time by $17e8
c17f1
    lda #0                                                            ; 1922: a9 00       ..  :17f1[1]
    sta l1824                                                         ; 1924: 8d 24 18    .$. :17f3[1]
    inc l178b                                                         ; 1927: ee 8b 17    ... :17f6[1]
; $192a referenced 1 time by $17be
c17f9
    rts                                                               ; 192a: 60          `   :17f9[1]

; $192b referenced 1 time by $17ab
sub_c17fa
    lda #$40 ; '@'                                                    ; 192b: a9 40       .@  :17fa[1]
    bit system_via_ifr                                                ; 192d: 2c 4d fe    ,M. :17fc[1]
    beq c1823                                                         ; 1930: f0 22       ."  :17ff[1]
    lda l1824                                                         ; 1932: ad 24 18    .$. :1801[1]
    bne c1823                                                         ; 1935: d0 1d       ..  :1804[1]
    ldx #1                                                            ; 1937: a2 01       ..  :1806[1]
    ldy l1760                                                         ; 1939: ac 60 17    .`. :1808[1]
    jsr sub_c1825                                                     ; 193c: 20 25 18     %. :180b[1]
    lda copy_protection_flag                                          ; 193f: ad 03 11    ... :180e[1]
    bpl c181a                                                         ; 1942: 10 07       ..  :1811[1]
    ldx #0                                                            ; 1944: a2 00       ..  :1813[1]
    ldy #0                                                            ; 1946: a0 00       ..  :1815[1]
    jsr sub_c1825                                                     ; 1948: 20 25 18     %. :1817[1]
; $194b referenced 1 time by $1811
c181a
    inc l1824                                                         ; 194b: ee 24 18    .$. :181a[1]
    jsr sub_c3a12                                                     ; 194e: 20 12 3a     .: :181d[1]
    jsr sub_c3a47                                                     ; 1951: 20 47 3a     G: :1820[1]
; $1954 referenced 2 times by $17ff, $1804
c1823
    rts                                                               ; 1954: 60          `   :1823[1]

; $1955 referenced 3 times by $17f3, $1801, $181a
l1824
    !byte 0                                                           ; 1955: 00          .   :1824[1]

; $1956 referenced 4 times by $17e2, $17ee, $180b, $1817
sub_c1825
    txa                                                               ; 1956: 8a          .   :1825[1]
    lsr                                                               ; 1957: 4a          J   :1826[1]
    php                                                               ; 1958: 08          .   :1827[1]
    tya                                                               ; 1959: 98          .   :1828[1]
    eor #7                                                            ; 195a: 49 07       I.  :1829[1]
    asl                                                               ; 195c: 0a          .   :182b[1]
    plp                                                               ; 195d: 28          (   :182c[1]
    ror                                                               ; 195e: 6a          j   :182d[1]
    ldx #7                                                            ; 195f: a2 07       ..  :182e[1]
; $1961 referenced 1 time by $1836
loop_c1830
    sta video_ula_palette                                             ; 1961: 8d 21 fe    .!. :1830[1]
    adc #$10                                                          ; 1964: 69 10       i.  :1833[1]
    dex                                                               ; 1966: ca          .   :1835[1]
    bpl loop_c1830                                                    ; 1967: 10 f8       ..  :1836[1]
    rts                                                               ; 1969: 60          `   :1838[1]

; $196a referenced 1 time by $2a5d
something11_TODO
    jsr sub_c178c                                                     ; 196a: 20 8c 17     .. :1839[1]
    jsr some_data_low_TODO                                            ; 196d: 20 00 04     .. :183c[1]
    jsr sub_c1845                                                     ; 1970: 20 45 18     E. :183f[1]
    jmp something3_TODO                                               ; 1973: 4c 00 0c    L.. :1842[1]

; TODO: Is this code deliberately trashing the code at something3_TODO? I can't think
; of any genuine reason for the game to copy anything from ROM into RAM.
; $1976 referenced 1 time by $183f
sub_c1845
    sei                                                               ; 1976: 78          x   :1845[1]
    lda #$0c                                                          ; 1977: a9 0c       ..  :1846[1]
    sta romsel                                                        ; 1979: 8d 30 fe    .0. :1848[1]
    ldy #0                                                            ; 197c: a0 00       ..  :184b[1]
; $197e referenced 1 time by $185a
loop_c184d
    lda lbe00,y                                                       ; 197e: b9 00 be    ... :184d[1]
    sta something3_TODO,y                                             ; 1981: 99 00 0c    ... :1850[1]
    lda lbf00,y                                                       ; 1984: b9 00 bf    ... :1853[1]
    sta l0b00,y                                                       ; 1987: 99 00 0b    ... :1856[1]
    iny                                                               ; 198a: c8          .   :1859[1]
    bne loop_c184d                                                    ; 198b: d0 f1       ..  :185a[1]
    lda romsel_copy                                                   ; 198d: a5 f4       ..  :185c[1]
    sta romsel                                                        ; 198f: 8d 30 fe    .0. :185e[1]
    cli                                                               ; 1992: 58          X   :1861[1]
    sty l0287                                                         ; 1993: 8c 87 02    ... :1862[1]
    rts                                                               ; 1996: 60          `   :1865[1]

; $1997 referenced 4 times by $0154, $3748, $37a2, $37da
sub_c1866
    cmp #$21 ; '!'                                                    ; 1997: c9 21       .!  :1866[1]
    bcc c18a3                                                         ; 1999: 90 39       .9  :1868[1]
    cmp #$7f                                                          ; 199b: c9 7f       ..  :186a[1]
    bcs c18a3                                                         ; 199d: b0 35       .5  :186c[1]
    sta l0060                                                         ; 199f: 85 60       .`  :186e[1]
    txa                                                               ; 19a1: 8a          .   :1870[1]
    pha                                                               ; 19a2: 48          H   :1871[1]
    tya                                                               ; 19a3: 98          .   :1872[1]
    pha                                                               ; 19a4: 48          H   :1873[1]
    lda #osword_read_char                                             ; 19a5: a9 0a       ..  :1874[1]
    ldx #<(l0060)                                                     ; 19a7: a2 60       .`  :1876[1]
    ldy #>(l0060)                                                     ; 19a9: a0 00       ..  :1878[1]
    jsr osword                                                        ; 19ab: 20 f1 ff     .. :187a[1]   ; Read character definition
    lsr l0061                                                         ; 19ae: 46 61       Fa  :187d[1]
    lsr l0062                                                         ; 19b0: 46 62       Fb  :187f[1]
    asl l0066                                                         ; 19b2: 06 66       .f  :1881[1]
    asl l0067                                                         ; 19b4: 06 67       .g  :1883[1]
    asl l0068                                                         ; 19b6: 06 68       .h  :1885[1]
    lda #$17                                                          ; 19b8: a9 17       ..  :1887[1]
    jsr oswrch                                                        ; 19ba: 20 ee ff     .. :1889[1]   ; Write character 23
    lda #$ff                                                          ; 19bd: a9 ff       ..  :188c[1]
    jsr oswrch                                                        ; 19bf: 20 ee ff     .. :188e[1]   ; Write character 255
    ldx #0                                                            ; 19c2: a2 00       ..  :1891[1]
; $19c4 referenced 1 time by $189b
loop_c1893
    lda l0061,x                                                       ; 19c4: b5 61       .a  :1893[1]
    jsr oswrch                                                        ; 19c6: 20 ee ff     .. :1895[1]   ; Write character
    inx                                                               ; 19c9: e8          .   :1898[1]
    cpx #8                                                            ; 19ca: e0 08       ..  :1899[1]
    bcc loop_c1893                                                    ; 19cc: 90 f6       ..  :189b[1]
    pla                                                               ; 19ce: 68          h   :189d[1]
    tay                                                               ; 19cf: a8          .   :189e[1]
    pla                                                               ; 19d0: 68          h   :189f[1]
    tax                                                               ; 19d1: aa          .   :18a0[1]
    lda #$ff                                                          ; 19d2: a9 ff       ..  :18a1[1]
; $19d4 referenced 2 times by $1868, $186c
c18a3
    jmp oswrch                                                        ; 19d4: 4c ee ff    L.. :18a3[1]   ; Write character 255

; $19d7 referenced 3 times by $19dc, $1af2, $3f56
mix_a_with_state
    sta l0039                                                         ; 19d7: 85 39       .9  :18a6[1]
    pha                                                               ; 19d9: 48          H   :18a8[1]
; $19da referenced 1 time by $18bd
loop_c18a9
    lda l0008                                                         ; 19da: a5 08       ..  :18a9[1]
    lsr                                                               ; 19dc: 4a          J   :18ab[1]
    lsr                                                               ; 19dd: 4a          J   :18ac[1]
    lsr                                                               ; 19de: 4a          J   :18ad[1]
    eor l000a                                                         ; 19df: 45 0a       E.  :18ae[1]
    ror                                                               ; 19e1: 6a          j   :18b0[1]
    rol l0006                                                         ; 19e2: 26 06       &.  :18b1[1]
    rol l0007                                                         ; 19e4: 26 07       &.  :18b3[1]
    rol l0008                                                         ; 19e6: 26 08       &.  :18b5[1]
    rol l0009                                                         ; 19e8: 26 09       &.  :18b7[1]
    rol l000a                                                         ; 19ea: 26 0a       &.  :18b9[1]
    lsr l0039                                                         ; 19ec: 46 39       F9  :18bb[1]
    bne loop_c18a9                                                    ; 19ee: d0 ea       ..  :18bd[1]
    pla                                                               ; 19f0: 68          h   :18bf[1]
    and l0006                                                         ; 19f1: 25 06       %.  :18c0[1]
    rts                                                               ; 19f3: 60          `   :18c2[1]

something12_TODO
    lda l0966                                                         ; 19f4: ad 66 09    .f. :18c3[1]
    bmi c1909                                                         ; 19f7: 30 41       0A  :18c6[1]
    beq c18d1                                                         ; 19f9: f0 07       ..  :18c8[1]
    lda l0950                                                         ; 19fb: ad 50 09    .P. :18ca[1]
    cmp #$40 ; '@'                                                    ; 19fe: c9 40       .@  :18cd[1]
    bcs c191f                                                         ; 1a00: b0 4e       .N  :18cf[1]
; $1a02 referenced 1 time by $18c8
c18d1
    lda l097c                                                         ; 1a02: ad 7c 09    .|. :18d1[1]
    sec                                                               ; 1a05: 38          8   :18d4[1]
    sbc l0987                                                         ; 1a06: ed 87 09    ... :18d5[1]
    beq c1906                                                         ; 1a09: f0 2c       .,  :18d8[1]
    lda l0992                                                         ; 1a0b: ad 92 09    ... :18da[1]
    sbc l099d                                                         ; 1a0e: ed 9d 09    ... :18dd[1]
    sta l0070                                                         ; 1a11: 85 70       .p  :18e0[1]
    ldx #0                                                            ; 1a13: a2 00       ..  :18e2[1]
    jsr sub_c24d2                                                     ; 1a15: 20 d2 24     .$ :18e4[1]
    lda l0074                                                         ; 1a18: a5 74       .t  :18e7[1]
    clc                                                               ; 1a1a: 18          .   :18e9[1]
    adc l0076                                                         ; 1a1b: 65 76       ev  :18ea[1]
    sta l007a                                                         ; 1a1d: 85 7a       .z  :18ec[1]
    lda l0075                                                         ; 1a1f: a5 75       .u  :18ee[1]
    adc l0077                                                         ; 1a21: 65 77       ew  :18f0[1]
    lsr                                                               ; 1a23: 4a          J   :18f2[1]
    ror l007a                                                         ; 1a24: 66 7a       fz  :18f3[1]
    lsr                                                               ; 1a26: 4a          J   :18f5[1]
    ror l007a                                                         ; 1a27: 66 7a       fz  :18f6[1]
    lsr                                                               ; 1a29: 4a          J   :18f8[1]
    ror l007a                                                         ; 1a2a: 66 7a       fz  :18f9[1]
    lsr                                                               ; 1a2c: 4a          J   :18fb[1]
    ror l007a                                                         ; 1a2d: 66 7a       fz  :18fc[1]
    lda l007a                                                         ; 1a2f: a5 7a       .z  :18fe[1]
    bmi c1937                                                         ; 1a31: 30 35       05  :1900[1]
    cmp #$18                                                          ; 1a33: c9 18       ..  :1902[1]
    bcs c1951                                                         ; 1a35: b0 4b       .K  :1904[1]
; $1a37 referenced 3 times by $18d8, $1939, $1953
c1906
    lda #0                                                            ; 1a37: a9 00       ..  :1906[1]
    rts                                                               ; 1a39: 60          `   :1908[1]

; $1a3a referenced 1 time by $18c6
c1909
    ldx #1                                                            ; 1a3a: a2 01       ..  :1909[1]
; $1a3c referenced 1 time by $191a
loop_c190b
    lda l0950,x                                                       ; 1a3c: bd 50 09    .P. :190b[1]
    clc                                                               ; 1a3f: 18          .   :190e[1]
    adc #$40 ; '@'                                                    ; 1a40: 69 40       i@  :190f[1]
    sta l0950,x                                                       ; 1a42: 9d 50 09    .P. :1911[1]
    lda #1                                                            ; 1a45: a9 01       ..  :1914[1]
    sta l0966,x                                                       ; 1a47: 9d 66 09    .f. :1916[1]
    dex                                                               ; 1a4a: ca          .   :1919[1]
    bpl loop_c190b                                                    ; 1a4b: 10 ef       ..  :191a[1]
    lda #1                                                            ; 1a4d: a9 01       ..  :191c[1]
    rts                                                               ; 1a4f: 60          `   :191e[1]

; $1a50 referenced 1 time by $18cf
c191f
    ldx #1                                                            ; 1a50: a2 01       ..  :191f[1]
; $1a52 referenced 1 time by $1932
loop_c1921
    lda l0950,x                                                       ; 1a52: bd 50 09    .P. :1921[1]
    sec                                                               ; 1a55: 38          8   :1924[1]
    sbc #$40 ; '@'                                                    ; 1a56: e9 40       .@  :1925[1]
    sta l0950,x                                                       ; 1a58: 9d 50 09    .P. :1927[1]
    lda #0                                                            ; 1a5b: a9 00       ..  :192a[1]
    sbc #0                                                            ; 1a5d: e9 00       ..  :192c[1]
    sta l0966,x                                                       ; 1a5f: 9d 66 09    .f. :192e[1]
    dex                                                               ; 1a62: ca          .   :1931[1]
    bpl loop_c1921                                                    ; 1a63: 10 ed       ..  :1932[1]
    lda #4                                                            ; 1a65: a9 04       ..  :1934[1]
    rts                                                               ; 1a67: 60          `   :1936[1]

; $1a68 referenced 1 time by $1900
c1937
    lda l0070                                                         ; 1a68: a5 70       .p  :1937[1]
    bpl c1906                                                         ; 1a6a: 10 cb       ..  :1939[1]
    ldx #1                                                            ; 1a6c: a2 01       ..  :193b[1]
; $1a6e referenced 1 time by $194c
loop_c193d
    lda l097c,x                                                       ; 1a6e: bd 7c 09    .|. :193d[1]
    clc                                                               ; 1a71: 18          .   :1940[1]
    adc #$c0                                                          ; 1a72: 69 c0       i.  :1941[1]
    sta l097c,x                                                       ; 1a74: 9d 7c 09    .|. :1943[1]
    lda #0                                                            ; 1a77: a9 00       ..  :1946[1]
    sta l0992,x                                                       ; 1a79: 9d 92 09    ... :1948[1]
    dex                                                               ; 1a7c: ca          .   :194b[1]
    bpl loop_c193d                                                    ; 1a7d: 10 ef       ..  :194c[1]
    lda #8                                                            ; 1a7f: a9 08       ..  :194e[1]
    rts                                                               ; 1a81: 60          `   :1950[1]

; $1a82 referenced 1 time by $1904
c1951
    lda l0070                                                         ; 1a82: a5 70       .p  :1951[1]
    bmi c1906                                                         ; 1a84: 30 b1       0.  :1953[1]
    ldx #1                                                            ; 1a86: a2 01       ..  :1955[1]
; $1a88 referenced 1 time by $1961
loop_c1957
    lda l097c,x                                                       ; 1a88: bd 7c 09    .|. :1957[1]
    sec                                                               ; 1a8b: 38          8   :195a[1]
    sbc #$c0                                                          ; 1a8c: e9 c0       ..  :195b[1]
    sta l097c,x                                                       ; 1a8e: 9d 7c 09    .|. :195d[1]
    dex                                                               ; 1a91: ca          .   :1960[1]
    bpl loop_c1957                                                    ; 1a92: 10 f4       ..  :1961[1]
    lda #2                                                            ; 1a94: a9 02       ..  :1963[1]
    rts                                                               ; 1a96: 60          `   :1965[1]

; $1a97 referenced 2 times by $121f, $126f
c1966
    stx l196d                                                         ; 1a97: 8e 6d 19    .m. :1966[1]
    sty l196e                                                         ; 1a9a: 8c 6e 19    .n. :1969[1]
sub_c196c
l196d = sub_c196c+1
l196e = sub_c196c+2
    jmp l0000                                                         ; 1a9d: 4c 00 00    L.. :196c[1]

; $1a9e referenced 1 time by $1966
; $1a9f referenced 1 time by $1969
; $1aa0 referenced 2 times by $36c7, $3e79
load_sprdata_to_addr_at_l0054
    lda #<sprdata_filename                                            ; 1aa0: a9 80       ..  :196f[1]
    sta l0070                                                         ; 1aa2: 85 70       .p  :1971[1]
    lda #>sprdata_filename                                            ; 1aa4: a9 19       ..  :1973[1]
    sta l0071                                                         ; 1aa6: 85 71       .q  :1975[1]
    ldx l0054                                                         ; 1aa8: a6 54       .T  :1977[1]
    ldy l0055                                                         ; 1aaa: a4 55       .U  :1979[1]
    lda #osfile_load                                                  ; 1aac: a9 ff       ..  :197b[1]
    jmp osfile_wrapper                                                ; 1aae: 4c dc 16    L.. :197d[1]

sprdata_filename
    !text "sprdata", $0d                                              ; 1ab1: 73 70 72... spr :1980[1]

something13_TODO
    sta l1a0f                                                         ; 1ab9: 8d 0f 1a    ... :1988[1]
    txa                                                               ; 1abc: 8a          .   :198b[1]
    pha                                                               ; 1abd: 48          H   :198c[1]
    tya                                                               ; 1abe: 98          .   :198d[1]
    pha                                                               ; 1abf: 48          H   :198e[1]
    lda l132b                                                         ; 1ac0: ad 2b 13    .+. :198f[1]
    beq c19e5                                                         ; 1ac3: f0 51       .Q  :1992[1]
    lda l0030                                                         ; 1ac5: a5 30       .0  :1994[1]
    cmp l1aba                                                         ; 1ac7: cd ba 1a    ... :1996[1]
    bne c19e2                                                         ; 1aca: d0 47       .G  :1999[1]
    jsr sub_c1efa                                                     ; 1acc: 20 fa 1e     .. :199b[1]
    cmp #3                                                            ; 1acf: c9 03       ..  :199e[1]
    beq c19b9                                                         ; 1ad1: f0 17       ..  :19a0[1]
    lda #3                                                            ; 1ad3: a9 03       ..  :19a2[1]
    jsr sub_c1ebb                                                     ; 1ad5: 20 bb 1e     .. :19a4[1]
    iny                                                               ; 1ad8: c8          .   :19a7[1]
    lda #$3a ; ':'                                                    ; 1ad9: a9 3a       .:  :19a8[1]
    jsr sub_c1f4c                                                     ; 1adb: 20 4c 1f     L. :19aa[1]
    dey                                                               ; 1ade: 88          .   :19ad[1]
    inx                                                               ; 1adf: e8          .   :19ae[1]
    lda l1a0f                                                         ; 1ae0: ad 0f 1a    ... :19af[1]
    jsr c1f5d                                                         ; 1ae3: 20 5d 1f     ]. :19b2[1]
    lda #1                                                            ; 1ae6: a9 01       ..  :19b5[1]
    bne c19d4                                                         ; 1ae8: d0 1b       ..  :19b7[1]
; $1aea referenced 1 time by $19a0
c19b9
    dex                                                               ; 1aea: ca          .   :19b9[1]
    lda #3                                                            ; 1aeb: a9 03       ..  :19ba[1]
    jsr sub_c1ebb                                                     ; 1aed: 20 bb 1e     .. :19bc[1]
    inx                                                               ; 1af0: e8          .   :19bf[1]
    lda #$ff                                                          ; 1af1: a9 ff       ..  :19c0[1]
    sta l001d                                                         ; 1af3: 85 1d       ..  :19c2[1]
    iny                                                               ; 1af5: c8          .   :19c4[1]
    lda #$3a ; ':'                                                    ; 1af6: a9 3a       .:  :19c5[1]
    jsr sub_c1f4c                                                     ; 1af8: 20 4c 1f     L. :19c7[1]
    dey                                                               ; 1afb: 88          .   :19ca[1]
    dex                                                               ; 1afc: ca          .   :19cb[1]
    lda l1a0f                                                         ; 1afd: ad 0f 1a    ... :19cc[1]
    jsr c1f5d                                                         ; 1b00: 20 5d 1f     ]. :19cf[1]
    lda #$ff                                                          ; 1b03: a9 ff       ..  :19d2[1]
; $1b05 referenced 1 time by $19b7
c19d4
    ldx l1a0f                                                         ; 1b05: ae 0f 1a    ... :19d4[1]
    sta l09be,x                                                       ; 1b08: 9d be 09    ... :19d7[1]
    lda #7                                                            ; 1b0b: a9 07       ..  :19da[1]
    jsr mix_a_with_state                                              ; 1b0d: 20 a6 18     .. :19dc[1]
    sta l09d4,x                                                       ; 1b10: 9d d4 09    ... :19df[1]
; $1b13 referenced 1 time by $1999
c19e2
    jmp c19f2                                                         ; 1b13: 4c f2 19    L.. :19e2[1]

; $1b16 referenced 1 time by $1992
c19e5
    lda l0030                                                         ; 1b16: a5 30       .0  :19e5[1]
    cmp l1aba                                                         ; 1b18: cd ba 1a    ... :19e7[1]
    bne c19f2                                                         ; 1b1b: d0 06       ..  :19ea[1]
    ldx l1a0f                                                         ; 1b1d: ae 0f 1a    ... :19ec[1]
    inc l09d4,x                                                       ; 1b20: fe d4 09    ... :19ef[1]
; $1b23 referenced 2 times by $19e2, $19ea
c19f2
    lda l0030                                                         ; 1b23: a5 30       .0  :19f2[1]
    cmp l1aba                                                         ; 1b25: cd ba 1a    ... :19f4[1]
    bne c1a07                                                         ; 1b28: d0 0e       ..  :19f7[1]
    ldx l1a0f                                                         ; 1b2a: ae 0f 1a    ... :19f9[1]
    lda l09d4,x                                                       ; 1b2d: bd d4 09    ... :19fc[1]
    and #7                                                            ; 1b30: 29 07       ).  :19ff[1]
    clc                                                               ; 1b32: 18          .   :1a01[1]
    adc #$3c ; '<'                                                    ; 1b33: 69 3c       i<  :1a02[1]
    sta l09a8,x                                                       ; 1b35: 9d a8 09    ... :1a04[1]
; $1b38 referenced 1 time by $19f7
c1a07
    pla                                                               ; 1b38: 68          h   :1a07[1]
    tay                                                               ; 1b39: a8          .   :1a08[1]
    pla                                                               ; 1b3a: 68          h   :1a09[1]
    tax                                                               ; 1b3b: aa          .   :1a0a[1]
    lda l1a0f                                                         ; 1b3c: ad 0f 1a    ... :1a0b[1]
    rts                                                               ; 1b3f: 60          `   :1a0e[1]

; $1b40 referenced 7 times by $1988, $19af, $19cc, $19d4, $19ec, $19f9, $1a0b
l1a0f
    !byte 0                                                           ; 1b40: 00          .   :1a0f[1]

something14_TODO
    sta l1aae                                                         ; 1b41: 8d ae 1a    ... :1a10[1]
    stx l1aaf                                                         ; 1b44: 8e af 1a    ... :1a13[1]
    sty l1ab0                                                         ; 1b47: 8c b0 1a    ... :1a16[1]
    inc l1ab1                                                         ; 1b4a: ee b1 1a    ... :1a19[1]
    lda l1ab1                                                         ; 1b4d: ad b1 1a    ... :1a1c[1]
    and #7                                                            ; 1b50: 29 07       ).  :1a1f[1]
    tay                                                               ; 1b52: a8          .   :1a21[1]
    lda l1ab2,y                                                       ; 1b53: b9 b2 1a    ... :1a22[1]
    sta l2eed                                                         ; 1b56: 8d ed 2e    ... :1a25[1]
    sta l2ef2                                                         ; 1b59: 8d f2 2e    ... :1a28[1]
    lda #$21 ; '!'                                                    ; 1b5c: a9 21       .!  :1a2b[1]
    sta l2ee8                                                         ; 1b5e: 8d e8 2e    ... :1a2d[1]
    lda l0030                                                         ; 1b61: a5 30       .0  :1a30[1]
    cmp l1aba                                                         ; 1b63: cd ba 1a    ... :1a32[1]
    bne c1a9e                                                         ; 1b66: d0 67       .g  :1a35[1]
    lda l132b                                                         ; 1b68: ad 2b 13    .+. :1a37[1]
    bne c1a59                                                         ; 1b6b: d0 1d       ..  :1a3a[1]
    ldx l1aae                                                         ; 1b6d: ae ae 1a    ... :1a3c[1]
    ldy #$0b                                                          ; 1b70: a0 0b       ..  :1a3f[1]
    jsr sub_c28e2                                                     ; 1b72: 20 e2 28     .( :1a41[1]
    beq c1a59                                                         ; 1b75: f0 13       ..  :1a44[1]
    lda l0031                                                         ; 1b77: a5 31       .1  :1a46[1]
    sec                                                               ; 1b79: 38          8   :1a48[1]
    sbc #$41 ; 'A'                                                    ; 1b7a: e9 41       .A  :1a49[1]
    tay                                                               ; 1b7c: a8          .   :1a4b[1]
    lda l09ef,y                                                       ; 1b7d: b9 ef 09    ... :1a4c[1]
    ora #$80                                                          ; 1b80: 09 80       ..  :1a4f[1]
    sta l09ef,y                                                       ; 1b82: 99 ef 09    ... :1a51[1]
    lda #$21 ; '!'                                                    ; 1b85: a9 21       .!  :1a54[1]
    jsr sub_c2bbd                                                     ; 1b87: 20 bd 2b     .+ :1a56[1]
; $1b8a referenced 2 times by $1a3a, $1a44
c1a59
    ldx l1aae                                                         ; 1b8a: ae ae 1a    ... :1a59[1]
    lda #$c5                                                          ; 1b8d: a9 c5       ..  :1a5c[1]
    sta l38ac,x                                                       ; 1b8f: 9d ac 38    ..8 :1a5e[1]
    lda #0                                                            ; 1b92: a9 00       ..  :1a61[1]
    sta l09a8,x                                                       ; 1b94: 9d a8 09    ... :1a63[1]
    lda l0031                                                         ; 1b97: a5 31       .1  :1a66[1]
    sec                                                               ; 1b99: 38          8   :1a68[1]
    sbc #$41 ; 'A'                                                    ; 1b9a: e9 41       .A  :1a69[1]
    tay                                                               ; 1b9c: a8          .   :1a6b[1]
    lda l09ef,y                                                       ; 1b9d: b9 ef 09    ... :1a6c[1]
    and #$80                                                          ; 1ba0: 29 80       ).  :1a6f[1]
    bne c1a9e                                                         ; 1ba2: d0 2b       .+  :1a71[1]
    lda #1                                                            ; 1ba4: a9 01       ..  :1a73[1]
    sta l09be,x                                                       ; 1ba6: 9d be 09    ... :1a75[1]
    lda l1ab1                                                         ; 1ba9: ad b1 1a    ... :1a78[1]
    and #7                                                            ; 1bac: 29 07       ).  :1a7b[1]
    tay                                                               ; 1bae: a8          .   :1a7d[1]
    cpy #5                                                            ; 1baf: c0 05       ..  :1a7e[1]
    bcc c1a8f                                                         ; 1bb1: 90 0d       ..  :1a80[1]
    lda #$ff                                                          ; 1bb3: a9 ff       ..  :1a82[1]
    sta l09be,x                                                       ; 1bb5: 9d be 09    ... :1a84[1]
    inc l003a                                                         ; 1bb8: e6 3a       .:  :1a87[1]
    tya                                                               ; 1bba: 98          .   :1a89[1]
    sbc #8                                                            ; 1bbb: e9 08       ..  :1a8a[1]
    eor #$ff                                                          ; 1bbd: 49 ff       I.  :1a8c[1]
    sec                                                               ; 1bbf: 38          8   :1a8e[1]
; $1bc0 referenced 1 time by $1a80
c1a8f
    adc #$22 ; '"'                                                    ; 1bc0: 69 22       i"  :1a8f[1]
    sta l09a8,x                                                       ; 1bc2: 9d a8 09    ... :1a91[1]
    txa                                                               ; 1bc5: 8a          .   :1a94[1]
    ldx l1aaf                                                         ; 1bc6: ae af 1a    ... :1a95[1]
    ldy l1ab0                                                         ; 1bc9: ac b0 1a    ... :1a98[1]
    jsr c1f5d                                                         ; 1bcc: 20 5d 1f     ]. :1a9b[1]
; $1bcf referenced 2 times by $1a35, $1a71
c1a9e
    lda #0                                                            ; 1bcf: a9 00       ..  :1a9e[1]
    sta l003a                                                         ; 1bd1: 85 3a       .:  :1aa0[1]
    sta l003b                                                         ; 1bd3: 85 3b       .;  :1aa2[1]
    lda l1aae                                                         ; 1bd5: ad ae 1a    ... :1aa4[1]
    ldx l1aaf                                                         ; 1bd8: ae af 1a    ... :1aa7[1]
    ldy l1ab0                                                         ; 1bdb: ac b0 1a    ... :1aaa[1]
    rts                                                               ; 1bde: 60          `   :1aad[1]

; $1bdf referenced 4 times by $1a10, $1a3c, $1a59, $1aa4
l1aae
    !byte 0                                                           ; 1bdf: 00          .   :1aae[1]
; $1be0 referenced 3 times by $1a13, $1a95, $1aa7
l1aaf
    !byte 0                                                           ; 1be0: 00          .   :1aaf[1]
; $1be1 referenced 3 times by $1a16, $1a98, $1aaa
l1ab0
    !byte 0                                                           ; 1be1: 00          .   :1ab0[1]
; $1be2 referenced 3 times by $1a19, $1a1c, $1a78
l1ab1
    !byte 0                                                           ; 1be2: 00          .   :1ab1[1]
; $1be3 referenced 1 time by $1a22
l1ab2
    !text "'()*+*)("                                                  ; 1be3: 27 28 29... '() :1ab2[1]
; $1beb referenced 4 times by $1996, $19e7, $19f4, $1a32
l1aba
    !byte 0                                                           ; 1beb: 00          .   :1aba[1]

; $1bec referenced 2 times by $0434, $0512
c1abb
    pha                                                               ; 1bec: 48          H   :1abb[1]
    sty l007d                                                         ; 1bed: 84 7d       .}  :1abc[1]
    jsr sub_c1e17                                                     ; 1bef: 20 17 1e     .. :1abe[1]
    jsr sub_c1b66                                                     ; 1bf2: 20 66 1b     f. :1ac1[1]
    lda l0076                                                         ; 1bf5: a5 76       .v  :1ac4[1]
    sta l0074                                                         ; 1bf7: 85 74       .t  :1ac6[1]
    lda l0077                                                         ; 1bf9: a5 77       .w  :1ac8[1]
    sta l0075                                                         ; 1bfb: 85 75       .u  :1aca[1]
    ldx l0040                                                         ; 1bfd: a6 40       .@  :1acc[1]
    ldy l0041                                                         ; 1bff: a4 41       .A  :1ace[1]
    stx l0078                                                         ; 1c01: 86 78       .x  :1ad0[1]
    sty l0079                                                         ; 1c03: 84 79       .y  :1ad2[1]
    stx l007a                                                         ; 1c05: 86 7a       .z  :1ad4[1]
    sty l007b                                                         ; 1c07: 84 7b       .{  :1ad6[1]
    clc                                                               ; 1c09: 18          .   :1ad8[1]
    lda #0                                                            ; 1c0a: a9 00       ..  :1ad9[1]
    sta l007e                                                         ; 1c0c: 85 7e       .~  :1adb[1]
; $1c0e referenced 1 time by $1b57
c1add
    ldx l0072                                                         ; 1c0e: a6 72       .r  :1add[1]
    lda l0070                                                         ; 1c10: a5 70       .p  :1adf[1]
    sta l007c                                                         ; 1c12: 85 7c       .|  :1ae1[1]
; $1c14 referenced 2 times by $1b3a, $1b3f
c1ae3
    ldy #7                                                            ; 1c14: a0 07       ..  :1ae3[1]
    lda l0042                                                         ; 1c16: a5 42       .B  :1ae5[1]
    beq c1b0c                                                         ; 1c18: f0 23       .#  :1ae7[1]
    bmi c1af8                                                         ; 1c1a: 30 0d       0.  :1ae9[1]
    cmp #1                                                            ; 1c1c: c9 01       ..  :1aeb[1]
    clc                                                               ; 1c1e: 18          .   :1aed[1]
    beq c1b28                                                         ; 1c1f: f0 38       .8  :1aee[1]
    sbc #0                                                            ; 1c21: e9 00       ..  :1af0[1]
    jsr mix_a_with_state                                              ; 1c23: 20 a6 18     .. :1af2[1]
    jmp c1b14                                                         ; 1c26: 4c 14 1b    L.. :1af5[1]

; $1c29 referenced 1 time by $1ae9
c1af8
    and #$7f                                                          ; 1c29: 29 7f       ).  :1af8[1]
    sec                                                               ; 1c2b: 38          8   :1afa[1]
    sbc #1                                                            ; 1c2c: e9 01       ..  :1afb[1]
    cmp l007e                                                         ; 1c2e: c5 7e       .~  :1afd[1]
    lda l007e                                                         ; 1c30: a5 7e       .~  :1aff[1]
    inc l007e                                                         ; 1c32: e6 7e       .~  :1b01[1]
    bcs c1b14                                                         ; 1c34: b0 0f       ..  :1b03[1]
    lda #0                                                            ; 1c36: a9 00       ..  :1b05[1]
    sta l007e                                                         ; 1c38: 85 7e       .~  :1b07[1]
    jmp c1b14                                                         ; 1c3a: 4c 14 1b    L.. :1b09[1]

; $1c3d referenced 1 time by $1ae7
c1b0c
    lda l007c                                                         ; 1c3d: a5 7c       .|  :1b0c[1]
    lsr                                                               ; 1c3f: 4a          J   :1b0e[1]
    lda l007d                                                         ; 1c40: a5 7d       .}  :1b0f[1]
    rol                                                               ; 1c42: 2a          *   :1b11[1]
    and #3                                                            ; 1c43: 29 03       ).  :1b12[1]
; $1c45 referenced 3 times by $1af5, $1b03, $1b09
c1b14
    asl                                                               ; 1c45: 0a          .   :1b14[1]
    asl                                                               ; 1c46: 0a          .   :1b15[1]
    rol l007b                                                         ; 1c47: 26 7b       &{  :1b16[1]
    asl                                                               ; 1c49: 0a          .   :1b18[1]
    rol l007b                                                         ; 1c4a: 26 7b       &{  :1b19[1]
    clc                                                               ; 1c4c: 18          .   :1b1b[1]
    adc l0078                                                         ; 1c4d: 65 78       ex  :1b1c[1]
    sta l007a                                                         ; 1c4f: 85 7a       .z  :1b1e[1]
    lda l007b                                                         ; 1c51: a5 7b       .{  :1b20[1]
    and #3                                                            ; 1c53: 29 03       ).  :1b22[1]
    adc l0079                                                         ; 1c55: 65 79       ey  :1b24[1]
    sta l007b                                                         ; 1c57: 85 7b       .{  :1b26[1]
; $1c59 referenced 2 times by $1aee, $1b2d
c1b28
    lda (l007a),y                                                     ; 1c59: b1 7a       .z  :1b28[1]
    sta (l0076),y                                                     ; 1c5b: 91 76       .v  :1b2a[1]
    dey                                                               ; 1c5d: 88          .   :1b2c[1]
    bpl c1b28                                                         ; 1c5e: 10 f9       ..  :1b2d[1]
    inc l007c                                                         ; 1c60: e6 7c       .|  :1b2f[1]
    dex                                                               ; 1c62: ca          .   :1b31[1]
    beq c1b41                                                         ; 1c63: f0 0d       ..  :1b32[1]
    lda l0076                                                         ; 1c65: a5 76       .v  :1b34[1]
    adc #8                                                            ; 1c67: 69 08       i.  :1b36[1]
    sta l0076                                                         ; 1c69: 85 76       .v  :1b38[1]
    bcc c1ae3                                                         ; 1c6b: 90 a7       ..  :1b3a[1]
    inc l0077                                                         ; 1c6d: e6 77       .w  :1b3c[1]
    clc                                                               ; 1c6f: 18          .   :1b3e[1]
    bcc c1ae3                                                         ; 1c70: 90 a2       ..  :1b3f[1]
; $1c72 referenced 1 time by $1b32
c1b41
    inc l007d                                                         ; 1c72: e6 7d       .}  :1b41[1]
    dec l0073                                                         ; 1c74: c6 73       .s  :1b43[1]
    beq c1b59                                                         ; 1c76: f0 12       ..  :1b45[1]
    lda l0074                                                         ; 1c78: a5 74       .t  :1b47[1]
    adc #$40 ; '@'                                                    ; 1c7a: 69 40       i@  :1b49[1]
    sta l0074                                                         ; 1c7c: 85 74       .t  :1b4b[1]
    sta l0076                                                         ; 1c7e: 85 76       .v  :1b4d[1]
    lda l0075                                                         ; 1c80: a5 75       .u  :1b4f[1]
    adc #1                                                            ; 1c82: 69 01       i.  :1b51[1]
    sta l0075                                                         ; 1c84: 85 75       .u  :1b53[1]
    sta l0077                                                         ; 1c86: 85 77       .w  :1b55[1]
    bcc c1add                                                         ; 1c88: 90 84       ..  :1b57[1]
; $1c8a referenced 1 time by $1b45
c1b59
    ldx l0070                                                         ; 1c8a: a6 70       .p  :1b59[1]
    ldy l0071                                                         ; 1c8c: a4 71       .q  :1b5b[1]
    lda l003e                                                         ; 1c8e: a5 3e       .>  :1b5d[1]
    bmi c1b64                                                         ; 1c90: 30 03       0.  :1b5f[1]
    jsr sub_c1e44                                                     ; 1c92: 20 44 1e     D. :1b61[1]
; $1c95 referenced 1 time by $1b5f
c1b64
    pla                                                               ; 1c95: 68          h   :1b64[1]
    rts                                                               ; 1c96: 60          `   :1b65[1]

; $1c97 referenced 4 times by $1ac1, $1bcd, $1c15, $1d0f
sub_c1b66
    lda #0                                                            ; 1c97: a9 00       ..  :1b66[1]
    sta l0076                                                         ; 1c99: 85 76       .v  :1b68[1]
    sty l0077                                                         ; 1c9b: 84 77       .w  :1b6a[1]
    tya                                                               ; 1c9d: 98          .   :1b6c[1]
    lsr                                                               ; 1c9e: 4a          J   :1b6d[1]
    ror l0076                                                         ; 1c9f: 66 76       fv  :1b6e[1]
    lsr                                                               ; 1ca1: 4a          J   :1b70[1]
    ror l0076                                                         ; 1ca2: 66 76       fv  :1b71[1]
    adc l0077                                                         ; 1ca4: 65 77       ew  :1b73[1]
    tay                                                               ; 1ca6: a8          .   :1b75[1]
    txa                                                               ; 1ca7: 8a          .   :1b76[1]
    asl                                                               ; 1ca8: 0a          .   :1b77[1]
    asl                                                               ; 1ca9: 0a          .   :1b78[1]
    asl                                                               ; 1caa: 0a          .   :1b79[1]
    bcc c1b7e                                                         ; 1cab: 90 02       ..  :1b7a[1]
    iny                                                               ; 1cad: c8          .   :1b7c[1]
    clc                                                               ; 1cae: 18          .   :1b7d[1]
; $1caf referenced 1 time by $1b7a
c1b7e
    adc l0076                                                         ; 1caf: 65 76       ev  :1b7e[1]
    sta l0076                                                         ; 1cb1: 85 76       .v  :1b80[1]
    tya                                                               ; 1cb3: 98          .   :1b82[1]
    adc l004c                                                         ; 1cb4: 65 4c       eL  :1b83[1]
    ldy l0077                                                         ; 1cb6: a4 77       .w  :1b85[1]
    sta l0077                                                         ; 1cb8: 85 77       .w  :1b87[1]
    rts                                                               ; 1cba: 60          `   :1b89[1]

; $1cbb referenced 1 time by $1ba6
something15_TODO
    jmp c1c3b                                                         ; 1cbb: 4c 3b 1c    L;. :1b8a[1]

; $1cbe referenced 1 time by $1baf
c1b8d
    jmp c1c9d                                                         ; 1cbe: 4c 9d 1c    L.. :1b8d[1]

    !byte $a9,   3, $85, $44, $a0, $17                                ; 1cc1: a9 03 85... ... :1b90[1]

; $1cc7 referenced 1 time by $1bc7
c1b96
    ldx #$27 ; '''                                                    ; 1cc7: a2 27       .'  :1b96[1]
; $1cc9 referenced 1 time by $1bc4
c1b98
    jsr sub_c1efa                                                     ; 1cc9: 20 fa 1e     .. :1b98[1]
    cmp #3                                                            ; 1ccc: c9 03       ..  :1b9b[1]
    bne c1bc3                                                         ; 1cce: d0 24       .$  :1b9d[1]
    inx                                                               ; 1cd0: e8          .   :1b9f[1]
    jsr sub_c1efa                                                     ; 1cd1: 20 fa 1e     .. :1ba0[1]
    dex                                                               ; 1cd4: ca          .   :1ba3[1]
    cmp #3                                                            ; 1cd5: c9 03       ..  :1ba4[1]
    bne something15_TODO                                              ; 1cd7: d0 e2       ..  :1ba6[1]
    dex                                                               ; 1cd9: ca          .   :1ba8[1]
    jsr sub_c1efa                                                     ; 1cda: 20 fa 1e     .. :1ba9[1]
    inx                                                               ; 1cdd: e8          .   :1bac[1]
    cmp #3                                                            ; 1cde: c9 03       ..  :1bad[1]
    bne c1b8d                                                         ; 1ce0: d0 dc       ..  :1baf[1]
    dey                                                               ; 1ce2: 88          .   :1bb1[1]
    jsr sub_c1efa                                                     ; 1ce3: 20 fa 1e     .. :1bb2[1]
    iny                                                               ; 1ce6: c8          .   :1bb5[1]
    cmp #3                                                            ; 1ce7: c9 03       ..  :1bb6[1]
    bne c1bca                                                         ; 1ce9: d0 10       ..  :1bb8[1]
    iny                                                               ; 1ceb: c8          .   :1bba[1]
    jsr sub_c1efa                                                     ; 1cec: 20 fa 1e     .. :1bbb[1]
    dey                                                               ; 1cef: 88          .   :1bbe[1]
    cmp #3                                                            ; 1cf0: c9 03       ..  :1bbf[1]
    bne c1c15                                                         ; 1cf2: d0 52       .R  :1bc1[1]
; $1cf4 referenced 5 times by $1b9d, $1c12, $1c38, $1c9a, $1cf0
c1bc3
    dex                                                               ; 1cf4: ca          .   :1bc3[1]
    bpl c1b98                                                         ; 1cf5: 10 d2       ..  :1bc4[1]
    dey                                                               ; 1cf7: 88          .   :1bc6[1]
    bpl c1b96                                                         ; 1cf8: 10 cd       ..  :1bc7[1]
    rts                                                               ; 1cfa: 60          `   :1bc9[1]

; $1cfb referenced 1 time by $1bb8
c1bca
    sty l0071                                                         ; 1cfb: 84 71       .q  :1bca[1]
    dey                                                               ; 1cfd: 88          .   :1bcc[1]
    jsr sub_c1b66                                                     ; 1cfe: 20 66 1b     f. :1bcd[1]
    txa                                                               ; 1d01: 8a          .   :1bd0[1]
    and #3                                                            ; 1d02: 29 03       ).  :1bd1[1]
    asl                                                               ; 1d04: 0a          .   :1bd3[1]
    asl                                                               ; 1d05: 0a          .   :1bd4[1]
    asl                                                               ; 1d06: 0a          .   :1bd5[1]
    asl                                                               ; 1d07: 0a          .   :1bd6[1]
    clc                                                               ; 1d08: 18          .   :1bd7[1]
    adc #$19                                                          ; 1d09: 69 19       i.  :1bd8[1]
    sta l007a                                                         ; 1d0b: 85 7a       .z  :1bda[1]
    lda #0                                                            ; 1d0d: a9 00       ..  :1bdc[1]
    adc #$1d                                                          ; 1d0f: 69 1d       i.  :1bde[1]
    sta l007b                                                         ; 1d11: 85 7b       .{  :1be0[1]
    ldy #7                                                            ; 1d13: a0 07       ..  :1be2[1]
; $1d15 referenced 1 time by $1beb
loop_c1be4
    lda (l007a),y                                                     ; 1d15: b1 7a       .z  :1be4[1]
    sta (l0076),y                                                     ; 1d17: 91 76       .v  :1be6[1]
    dey                                                               ; 1d19: 88          .   :1be8[1]
    cpy #2                                                            ; 1d1a: c0 02       ..  :1be9[1]
    bcs loop_c1be4                                                    ; 1d1c: b0 f7       ..  :1beb[1]
    lda l007a                                                         ; 1d1e: a5 7a       .z  :1bed[1]
    clc                                                               ; 1d20: 18          .   :1bef[1]
    adc #8                                                            ; 1d21: 69 08       i.  :1bf0[1]
    sta l007a                                                         ; 1d23: 85 7a       .z  :1bf2[1]
    lda l007b                                                         ; 1d25: a5 7b       .{  :1bf4[1]
    adc #0                                                            ; 1d27: 69 00       i.  :1bf6[1]
    sta l007b                                                         ; 1d29: 85 7b       .{  :1bf8[1]
    lda l0076                                                         ; 1d2b: a5 76       .v  :1bfa[1]
    clc                                                               ; 1d2d: 18          .   :1bfc[1]
    adc #$40 ; '@'                                                    ; 1d2e: 69 40       i@  :1bfd[1]
    sta l0076                                                         ; 1d30: 85 76       .v  :1bff[1]
    lda l0077                                                         ; 1d32: a5 77       .w  :1c01[1]
    adc #1                                                            ; 1d34: 69 01       i.  :1c03[1]
    sta l0077                                                         ; 1d36: 85 77       .w  :1c05[1]
    ldy #5                                                            ; 1d38: a0 05       ..  :1c07[1]
; $1d3a referenced 1 time by $1c0e
loop_c1c09
    lda (l007a),y                                                     ; 1d3a: b1 7a       .z  :1c09[1]
    sta (l0076),y                                                     ; 1d3c: 91 76       .v  :1c0b[1]
    dey                                                               ; 1d3e: 88          .   :1c0d[1]
    bpl loop_c1c09                                                    ; 1d3f: 10 f9       ..  :1c0e[1]
    ldy l0071                                                         ; 1d41: a4 71       .q  :1c10[1]
    jmp c1bc3                                                         ; 1d43: 4c c3 1b    L.. :1c12[1]

; $1d46 referenced 1 time by $1bc1
c1c15
    jsr sub_c1b66                                                     ; 1d46: 20 66 1b     f. :1c15[1]
    txa                                                               ; 1d49: 8a          .   :1c18[1]
    and #3                                                            ; 1d4a: 29 03       ).  :1c19[1]
    asl                                                               ; 1d4c: 0a          .   :1c1b[1]
    asl                                                               ; 1d4d: 0a          .   :1c1c[1]
    asl                                                               ; 1d4e: 0a          .   :1c1d[1]
    clc                                                               ; 1d4f: 18          .   :1c1e[1]
    adc #$59 ; 'Y'                                                    ; 1d50: 69 59       iY  :1c1f[1]
    sta l007a                                                         ; 1d52: 85 7a       .z  :1c21[1]
    lda #0                                                            ; 1d54: a9 00       ..  :1c23[1]
    adc #$1d                                                          ; 1d56: 69 1d       i.  :1c25[1]
    sta l007b                                                         ; 1d58: 85 7b       .{  :1c27[1]
    sty l0071                                                         ; 1d5a: 84 71       .q  :1c29[1]
    ldy #7                                                            ; 1d5c: a0 07       ..  :1c2b[1]
; $1d5e referenced 1 time by $1c34
loop_c1c2d
    lda (l007a),y                                                     ; 1d5e: b1 7a       .z  :1c2d[1]
    sta (l0076),y                                                     ; 1d60: 91 76       .v  :1c2f[1]
    dey                                                               ; 1d62: 88          .   :1c31[1]
    cpy #2                                                            ; 1d63: c0 02       ..  :1c32[1]
    bcs loop_c1c2d                                                    ; 1d65: b0 f7       ..  :1c34[1]
    ldy l0071                                                         ; 1d67: a4 71       .q  :1c36[1]
    jmp c1bc3                                                         ; 1d69: 4c c3 1b    L.. :1c38[1]

; $1d6c referenced 1 time by $1b8a
c1c3b
    jsr sub_c1cf3                                                     ; 1d6c: 20 f3 1c     .. :1c3b[1]
    beq c1c4e                                                         ; 1d6f: f0 0e       ..  :1c3e[1]
    inx                                                               ; 1d71: e8          .   :1c40[1]
    lda #$ff                                                          ; 1d72: a9 ff       ..  :1c41[1]
    sta l001d                                                         ; 1d74: 85 1d       ..  :1c43[1]
    lda l0016                                                         ; 1d76: a5 16       ..  :1c45[1]
    jsr sub_c1f4c                                                     ; 1d78: 20 4c 1f     L. :1c47[1]
    dex                                                               ; 1d7b: ca          .   :1c4a[1]
    jmp c1c6e                                                         ; 1d7c: 4c 6e 1c    Ln. :1c4b[1]

; $1d7f referenced 1 time by $1c3e
c1c4e
    tya                                                               ; 1d7f: 98          .   :1c4e[1]
    and #3                                                            ; 1d80: 29 03       ).  :1c4f[1]
    asl                                                               ; 1d82: 0a          .   :1c51[1]
    asl                                                               ; 1d83: 0a          .   :1c52[1]
    asl                                                               ; 1d84: 0a          .   :1c53[1]
    clc                                                               ; 1d85: 18          .   :1c54[1]
    adc #$99                                                          ; 1d86: 69 99       i.  :1c55[1]
    sta l007a                                                         ; 1d88: 85 7a       .z  :1c57[1]
    lda #0                                                            ; 1d8a: a9 00       ..  :1c59[1]
    adc #$1d                                                          ; 1d8c: 69 1d       i.  :1c5b[1]
    sta l007b                                                         ; 1d8e: 85 7b       .{  :1c5d[1]
    ldy #7                                                            ; 1d90: a0 07       ..  :1c5f[1]
; $1d92 referenced 1 time by $1c6a
loop_c1c61
    lda (l0076),y                                                     ; 1d92: b1 76       .v  :1c61[1]
    and #$c0                                                          ; 1d94: 29 c0       ).  :1c63[1]
    ora (l007a),y                                                     ; 1d96: 11 7a       .z  :1c65[1]
    sta (l0076),y                                                     ; 1d98: 91 76       .v  :1c67[1]
    dey                                                               ; 1d9a: 88          .   :1c69[1]
    bpl loop_c1c61                                                    ; 1d9b: 10 f5       ..  :1c6a[1]
    ldy l0071                                                         ; 1d9d: a4 71       .q  :1c6c[1]
; $1d9f referenced 1 time by $1c4b
c1c6e
    inx                                                               ; 1d9f: e8          .   :1c6e[1]
    dey                                                               ; 1da0: 88          .   :1c6f[1]
    bmi c1c82                                                         ; 1da1: 30 10       0.  :1c70[1]
    jsr sub_c1efa                                                     ; 1da3: 20 fa 1e     .. :1c72[1]
    cmp #3                                                            ; 1da6: c9 03       ..  :1c75[1]
    bne c1c82                                                         ; 1da8: d0 09       ..  :1c77[1]
    lda #$ff                                                          ; 1daa: a9 ff       ..  :1c79[1]
    sta l001d                                                         ; 1dac: 85 1d       ..  :1c7b[1]
    lda #$2f ; '/'                                                    ; 1dae: a9 2f       ./  :1c7d[1]
    jsr sub_c1f4c                                                     ; 1db0: 20 4c 1f     L. :1c7f[1]
; $1db3 referenced 2 times by $1c70, $1c77
c1c82
    iny                                                               ; 1db3: c8          .   :1c82[1]
    iny                                                               ; 1db4: c8          .   :1c83[1]
    cpy #$18                                                          ; 1db5: c0 18       ..  :1c84[1]
    bcs c1c98                                                         ; 1db7: b0 10       ..  :1c86[1]
    jsr sub_c1efa                                                     ; 1db9: 20 fa 1e     .. :1c88[1]
    cmp #3                                                            ; 1dbc: c9 03       ..  :1c8b[1]
    bne c1c98                                                         ; 1dbe: d0 09       ..  :1c8d[1]
    lda #$ff                                                          ; 1dc0: a9 ff       ..  :1c8f[1]
    sta l001d                                                         ; 1dc2: 85 1d       ..  :1c91[1]
    lda #$2e ; '.'                                                    ; 1dc4: a9 2e       ..  :1c93[1]
    jsr sub_c1f4c                                                     ; 1dc6: 20 4c 1f     L. :1c95[1]
; $1dc9 referenced 2 times by $1c86, $1c8d
c1c98
    dex                                                               ; 1dc9: ca          .   :1c98[1]
    dey                                                               ; 1dca: 88          .   :1c99[1]
    jmp c1bc3                                                         ; 1dcb: 4c c3 1b    L.. :1c9a[1]

; $1dce referenced 1 time by $1b8d
c1c9d
    jsr sub_c1cf3                                                     ; 1dce: 20 f3 1c     .. :1c9d[1]
    beq c1ca8                                                         ; 1dd1: f0 06       ..  :1ca0[1]
    jsr sub_c1f4c                                                     ; 1dd3: 20 4c 1f     L. :1ca2[1]
    jmp c1cc8                                                         ; 1dd6: 4c c8 1c    L.. :1ca5[1]

; $1dd9 referenced 1 time by $1ca0
c1ca8
    tya                                                               ; 1dd9: 98          .   :1ca8[1]
    and #3                                                            ; 1dda: 29 03       ).  :1ca9[1]
    asl                                                               ; 1ddc: 0a          .   :1cab[1]
    asl                                                               ; 1ddd: 0a          .   :1cac[1]
    asl                                                               ; 1dde: 0a          .   :1cad[1]
    clc                                                               ; 1ddf: 18          .   :1cae[1]
    adc #$79 ; 'y'                                                    ; 1de0: 69 79       iy  :1caf[1]
    sta l007a                                                         ; 1de2: 85 7a       .z  :1cb1[1]
    lda #0                                                            ; 1de4: a9 00       ..  :1cb3[1]
    adc #$1d                                                          ; 1de6: 69 1d       i.  :1cb5[1]
    sta l007b                                                         ; 1de8: 85 7b       .{  :1cb7[1]
    ldy #7                                                            ; 1dea: a0 07       ..  :1cb9[1]
; $1dec referenced 1 time by $1cc4
loop_c1cbb
    lda (l0076),y                                                     ; 1dec: b1 76       .v  :1cbb[1]
    and #3                                                            ; 1dee: 29 03       ).  :1cbd[1]
    ora (l007a),y                                                     ; 1df0: 11 7a       .z  :1cbf[1]
    sta (l0076),y                                                     ; 1df2: 91 76       .v  :1cc1[1]
    dey                                                               ; 1df4: 88          .   :1cc3[1]
    bpl loop_c1cbb                                                    ; 1df5: 10 f5       ..  :1cc4[1]
    ldy l0071                                                         ; 1df7: a4 71       .q  :1cc6[1]
; $1df9 referenced 1 time by $1ca5
c1cc8
    dex                                                               ; 1df9: ca          .   :1cc8[1]
    dey                                                               ; 1dfa: 88          .   :1cc9[1]
    bmi c1cda                                                         ; 1dfb: 30 0e       0.  :1cca[1]
    jsr sub_c1efa                                                     ; 1dfd: 20 fa 1e     .. :1ccc[1]
    cmp #3                                                            ; 1e00: c9 03       ..  :1ccf[1]
    bne c1cda                                                         ; 1e02: d0 07       ..  :1cd1[1]
    lda #$2f ; '/'                                                    ; 1e04: a9 2f       ./  :1cd3[1]
    inx                                                               ; 1e06: e8          .   :1cd5[1]
    jsr sub_c1f4c                                                     ; 1e07: 20 4c 1f     L. :1cd6[1]
    dex                                                               ; 1e0a: ca          .   :1cd9[1]
; $1e0b referenced 2 times by $1cca, $1cd1
c1cda
    iny                                                               ; 1e0b: c8          .   :1cda[1]
    iny                                                               ; 1e0c: c8          .   :1cdb[1]
    cpy #$18                                                          ; 1e0d: c0 18       ..  :1cdc[1]
    bcs c1cee                                                         ; 1e0f: b0 0e       ..  :1cde[1]
    jsr sub_c1efa                                                     ; 1e11: 20 fa 1e     .. :1ce0[1]
    cmp #3                                                            ; 1e14: c9 03       ..  :1ce3[1]
    bne c1cee                                                         ; 1e16: d0 07       ..  :1ce5[1]
    lda #$2e ; '.'                                                    ; 1e18: a9 2e       ..  :1ce7[1]
    inx                                                               ; 1e1a: e8          .   :1ce9[1]
    jsr sub_c1f4c                                                     ; 1e1b: 20 4c 1f     L. :1cea[1]
    dex                                                               ; 1e1e: ca          .   :1ced[1]
; $1e1f referenced 2 times by $1cde, $1ce5
c1cee
    inx                                                               ; 1e1f: e8          .   :1cee[1]
    dey                                                               ; 1e20: 88          .   :1cef[1]
    jmp c1bc3                                                         ; 1e21: 4c c3 1b    L.. :1cf0[1]

; $1e24 referenced 2 times by $1c3b, $1c9d
sub_c1cf3
    lda #$2c ; ','                                                    ; 1e24: a9 2c       .,  :1cf3[1]
    sta l0016                                                         ; 1e26: 85 16       ..  :1cf5[1]
    dey                                                               ; 1e28: 88          .   :1cf7[1]
    jsr sub_c1efa                                                     ; 1e29: 20 fa 1e     .. :1cf8[1]
    iny                                                               ; 1e2c: c8          .   :1cfb[1]
    cmp #3                                                            ; 1e2d: c9 03       ..  :1cfc[1]
    bne c1d16                                                         ; 1e2f: d0 16       ..  :1cfe[1]
    lda #$2d ; '-'                                                    ; 1e31: a9 2d       .-  :1d00[1]
    sta l0016                                                         ; 1e33: 85 16       ..  :1d02[1]
    iny                                                               ; 1e35: c8          .   :1d04[1]
    jsr sub_c1efa                                                     ; 1e36: 20 fa 1e     .. :1d05[1]
    dey                                                               ; 1e39: 88          .   :1d08[1]
    cmp #3                                                            ; 1e3a: c9 03       ..  :1d09[1]
    bne c1d16                                                         ; 1e3c: d0 09       ..  :1d0b[1]
    sty l0071                                                         ; 1e3e: 84 71       .q  :1d0d[1]
    jsr sub_c1b66                                                     ; 1e40: 20 66 1b     f. :1d0f[1]
    lda #0                                                            ; 1e43: a9 00       ..  :1d12[1]
    sta l0016                                                         ; 1e45: 85 16       ..  :1d14[1]
; $1e47 referenced 2 times by $1cfe, $1d0b
c1d16
    lda l0016                                                         ; 1e47: a5 16       ..  :1d16[1]
    rts                                                               ; 1e49: 60          `   :1d18[1]

    !byte   0,   0,   0, $ff, $b7, $ff, $fd, $ef,   0, $ff, $fd, $df  ; 1e4a: 00 00 00... ... :1d19[1]
    !byte $f3,   0,   0,   0,   0,   0, $0c, $f3, $bf, $fd, $ef, $ff  ; 1e56: f3 00 00... ... :1d25[1]
    !byte   0, $ff, $fb, $bf, $ff,   0,   0,   0,   0,   0,   0, $ff  ; 1e62: 00 ff fb... ... :1d31[1]
    !byte $bd, $ff, $df, $fb,   4, $ef, $ff, $db, $ff,   0,   0,   0  ; 1e6e: bd ff df... ... :1d3d[1]
    !byte   0,   0, $20, $df, $f7, $bd, $ef, $ff,   2, $fd, $bf, $fb  ; 1e7a: 00 00 20... ..  :1d49[1]
    !byte $ef,   0,   0,   0,   0,   0,   0, $df, $fd, $bf, $f7,   8  ; 1e86: ef 00 00... ... :1d55[1]
    !byte   0,   0,   0, $ff, $fb, $df, $f7,   0,   0,   0,   0, $bf  ; 1e92: 00 00 00... ... :1d61[1]
    !byte $f7, $df, $f9,   6,   0,   0,   0, $ef, $fb, $bf, $ff,   0  ; 1e9e: f7 df f9... ... :1d6d[1]
    !text "xXppXxhxxhxXx"                                             ; 1eaa: 78 58 70... xXp :1d79[1]
    !byte $b8                                                         ; 1eb7: b8          .   :1d86[1]
    !text "hxxXxhxpXxhxx"                                             ; 1eb8: 68 78 78... hxx :1d87[1]
    !byte $b8, $a8                                                    ; 1ec5: b8 a8       ..  :1d94[1]
    !text "xXx"                                                       ; 1ec7: 78 58 78    xXx :1d96[1]
    !byte $1e, $1a, $0e, $0e, $1a, $1e, $16, $1e, $1e, $16, $1e, $1a  ; 1eca: 1e 1a 0e... ... :1d99[1]
    !byte $1e, $1d, $16, $1e, $1e, $1a, $1e, $16, $1e, $0e, $1a, $1e  ; 1ed6: 1e 1d 16... ... :1da5[1]
    !byte $16, $1e, $1e, $1d, $15, $1e, $1a, $1e, $85, $56, $48, $98  ; 1ee2: 16 1e 1e... ... :1db1[1]
    !byte $48, $f0,   9, $a9, $0b, $20, $4c, $1f, $a9,   3, $d0, $11  ; 1eee: 48 f0 09... H.. :1dbd[1]
    !byte $a5, $56, $c9,   1, $f0, $17, $98, $29,   3, $18            ; 1efa: a5 56 c9... .V. :1dc9[1]
    !text "iU L"                                                      ; 1f04: 69 55 20... iU  :1dd3[1]
    !byte $1f, $a9,   2, $20, $bb, $1e, $c6, $56, $c8, $c0, $18, $90  ; 1f08: 1f a9 02... ... :1dd7[1]
    !byte $e5, $b0, $0a, $a9, $0a, $20, $4c, $1f, $a9,   2, $20, $bb  ; 1f14: e5 b0 0a... ... :1de3[1]
    !byte $1e, $68, $a8, $68, $60                                     ; 1f20: 1e 68 a8... .h. :1def[1]

; TODO: Is this code deliberately trashing the code at something3_TODO?
; $1f25 referenced 1 time by $1242
sub_c1df4
    lda #0                                                            ; 1f25: a9 00       ..  :1df4[1]
    tay                                                               ; 1f27: a8          .   :1df6[1]
; $1f28 referenced 1 time by $1dfd
loop_c1df7
    sta something3_TODO,y                                             ; 1f28: 99 00 0c    ... :1df7[1]
    iny                                                               ; 1f2b: c8          .   :1dfa[1]
    cpy #$f0                                                          ; 1f2c: c0 f0       ..  :1dfb[1]
    bne loop_c1df7                                                    ; 1f2e: d0 f8       ..  :1dfd[1]
    ldy #0                                                            ; 1f30: a0 00       ..  :1dff[1]
    sty l0070                                                         ; 1f32: 84 70       .p  :1e01[1]
    ldx #$62 ; 'b'                                                    ; 1f34: a2 62       .b  :1e03[1]
    stx l0071                                                         ; 1f36: 86 71       .q  :1e05[1]
    lda #$ff                                                          ; 1f38: a9 ff       ..  :1e07[1]
    ldx #$80                                                          ; 1f3a: a2 80       ..  :1e09[1]
; $1f3c referenced 2 times by $1e0e, $1e14
c1e0b
    sta (l0070),y                                                     ; 1f3c: 91 70       .p  :1e0b[1]
    iny                                                               ; 1f3e: c8          .   :1e0d[1]
    bne c1e0b                                                         ; 1f3f: d0 fb       ..  :1e0e[1]
    inc l0071                                                         ; 1f41: e6 71       .q  :1e10[1]
    cpx l0071                                                         ; 1f43: e4 71       .q  :1e12[1]
    bne c1e0b                                                         ; 1f45: d0 f5       ..  :1e14[1]
    rts                                                               ; 1f47: 60          `   :1e16[1]

; $1f48 referenced 2 times by $1abe, $1e50
sub_c1e17
    stx l0070                                                         ; 1f48: 86 70       .p  :1e17[1]
    sty l0071                                                         ; 1f4a: 84 71       .q  :1e19[1]
    lda l003c                                                         ; 1f4c: a5 3c       .<  :1e1b[1]
    sta l0072                                                         ; 1f4e: 85 72       .r  :1e1d[1]
    lda l003d                                                         ; 1f50: a5 3d       .=  :1e1f[1]
    sta l0073                                                         ; 1f52: 85 73       .s  :1e21[1]
    txa                                                               ; 1f54: 8a          .   :1e23[1]
    clc                                                               ; 1f55: 18          .   :1e24[1]
    adc l003c                                                         ; 1f56: 65 3c       e<  :1e25[1]
    bcs c1e2d                                                         ; 1f58: b0 04       ..  :1e27[1]
    cmp #$29 ; ')'                                                    ; 1f5a: c9 29       .)  :1e29[1]
    bcc c1e33                                                         ; 1f5c: 90 06       ..  :1e2b[1]
; $1f5e referenced 1 time by $1e27
c1e2d
    lda #$28 ; '('                                                    ; 1f5e: a9 28       .(  :1e2d[1]
    sbc l0070                                                         ; 1f60: e5 70       .p  :1e2f[1]
    sta l0072                                                         ; 1f62: 85 72       .r  :1e31[1]
; $1f64 referenced 1 time by $1e2b
c1e33
    tya                                                               ; 1f64: 98          .   :1e33[1]
    clc                                                               ; 1f65: 18          .   :1e34[1]
    adc l003d                                                         ; 1f66: 65 3d       e=  :1e35[1]
    bcs c1e3d                                                         ; 1f68: b0 04       ..  :1e37[1]
    cmp #$19                                                          ; 1f6a: c9 19       ..  :1e39[1]
    bcc c1e43                                                         ; 1f6c: 90 06       ..  :1e3b[1]
; $1f6e referenced 1 time by $1e37
c1e3d
    lda #$18                                                          ; 1f6e: a9 18       ..  :1e3d[1]
    sbc l0071                                                         ; 1f70: e5 71       .q  :1e3f[1]
    sta l0073                                                         ; 1f72: 85 73       .s  :1e41[1]
; $1f74 referenced 1 time by $1e3b
c1e43
    rts                                                               ; 1f74: 60          `   :1e43[1]

; $1f75 referenced 1 time by $1b61
sub_c1e44
    pha                                                               ; 1f75: 48          H   :1e44[1]
    lda l003e                                                         ; 1f76: a5 3e       .>  :1e45[1]
    cmp #4                                                            ; 1f78: c9 04       ..  :1e47[1]
    bcc c1e4e                                                         ; 1f7a: 90 03       ..  :1e49[1]
    jmp c1ea5                                                         ; 1f7c: 4c a5 1e    L.. :1e4b[1]

; $1f7f referenced 1 time by $1e49
c1e4e
    sta l0049                                                         ; 1f7f: 85 49       .I  :1e4e[1]
    jsr sub_c1e17                                                     ; 1f81: 20 17 1e     .. :1e50[1]
    tya                                                               ; 1f84: 98          .   :1e53[1]
    asl                                                               ; 1f85: 0a          .   :1e54[1]
    sta l004a                                                         ; 1f86: 85 4a       .J  :1e55[1]
    asl                                                               ; 1f88: 0a          .   :1e57[1]
    asl                                                               ; 1f89: 0a          .   :1e58[1]
    adc l004a                                                         ; 1f8a: 65 4a       eJ  :1e59[1]
    sta l004a                                                         ; 1f8c: 85 4a       .J  :1e5b[1]
    txa                                                               ; 1f8e: 8a          .   :1e5d[1]
    lsr                                                               ; 1f8f: 4a          J   :1e5e[1]
    lsr                                                               ; 1f90: 4a          J   :1e5f[1]
    clc                                                               ; 1f91: 18          .   :1e60[1]
    adc l004a                                                         ; 1f92: 65 4a       eJ  :1e61[1]
    tay                                                               ; 1f94: a8          .   :1e63[1]
    txa                                                               ; 1f95: 8a          .   :1e64[1]
    and #3                                                            ; 1f96: 29 03       ).  :1e65[1]
    eor #3                                                            ; 1f98: 49 03       I.  :1e67[1]
    tax                                                               ; 1f9a: aa          .   :1e69[1]
; $1f9b referenced 1 time by $1e9d
c1e6a
    lda l0073                                                         ; 1f9b: a5 73       .s  :1e6a[1]
    sta l004b                                                         ; 1f9d: 85 4b       .K  :1e6c[1]
    stx l0074                                                         ; 1f9f: 86 74       .t  :1e6e[1]
    lda l0049                                                         ; 1fa1: a5 49       .I  :1e70[1]
    asl                                                               ; 1fa3: 0a          .   :1e72[1]
    asl                                                               ; 1fa4: 0a          .   :1e73[1]
    ora l0074                                                         ; 1fa5: 05 74       .t  :1e74[1]
    tax                                                               ; 1fa7: aa          .   :1e76[1]
    lda l1eab,x                                                       ; 1fa8: bd ab 1e    ... :1e77[1]
    ldx l0074                                                         ; 1fab: a6 74       .t  :1e7a[1]
    sta l0074                                                         ; 1fad: 85 74       .t  :1e7c[1]
    sty l0075                                                         ; 1faf: 84 75       .u  :1e7e[1]
; TODO: What's going on with the modification to something3_TODO here? Is it copy
; protection/obfuscation or is there something else going on?
; $1fb1 referenced 1 time by $1e91
loop_c1e80
    lda something3_TODO,y                                             ; 1fb1: b9 00 0c    ... :1e80[1]
    and l1ea7,x                                                       ; 1fb4: 3d a7 1e    =.. :1e83[1]
    ora l0074                                                         ; 1fb7: 05 74       .t  :1e86[1]
    sta something3_TODO,y                                             ; 1fb9: 99 00 0c    ... :1e88[1]
    tya                                                               ; 1fbc: 98          .   :1e8b[1]
    adc #$0a                                                          ; 1fbd: 69 0a       i.  :1e8c[1]
    tay                                                               ; 1fbf: a8          .   :1e8e[1]
    dec l004b                                                         ; 1fc0: c6 4b       .K  :1e8f[1]
    bne loop_c1e80                                                    ; 1fc2: d0 ed       ..  :1e91[1]
    ldy l0075                                                         ; 1fc4: a4 75       .u  :1e93[1]
    dex                                                               ; 1fc6: ca          .   :1e95[1]
    bpl c1e9b                                                         ; 1fc7: 10 03       ..  :1e96[1]
    ldx #3                                                            ; 1fc9: a2 03       ..  :1e98[1]
    iny                                                               ; 1fcb: c8          .   :1e9a[1]
; $1fcc referenced 1 time by $1e96
c1e9b
    dec l0072                                                         ; 1fcc: c6 72       .r  :1e9b[1]
    bne c1e6a                                                         ; 1fce: d0 cb       ..  :1e9d[1]
    lda l0049                                                         ; 1fd0: a5 49       .I  :1e9f[1]
    ldx l0070                                                         ; 1fd2: a6 70       .p  :1ea1[1]
    ldy l0071                                                         ; 1fd4: a4 71       .q  :1ea3[1]
; $1fd6 referenced 1 time by $1e4b
c1ea5
    pla                                                               ; 1fd6: 68          h   :1ea5[1]
    rts                                                               ; 1fd7: 60          `   :1ea6[1]

; $1fd8 referenced 2 times by $1e83, $1eeb
l1ea7
    !byte $3f, $cf, $f3, $fc                                          ; 1fd8: 3f cf f3... ?.. :1ea7[1]
; $1fdc referenced 2 times by $1e77, $1ee1
l1eab
    !byte   0,   0,   0,   0, $40, $10,   4,   1, $80, $20,   8,   2  ; 1fdc: 00 00 00... ... :1eab[1]
    !byte $c0, $30, $0c,   3                                          ; 1fe8: c0 30 0c... .0. :1eb7[1]

; TODO: What's going on with the modification to something3_TODO here? Is it copy
; protection/obfuscation or is there something else going on?
; $1fec referenced 2 times by $19a4, $19bc
sub_c1ebb
    and #3                                                            ; 1fec: 29 03       ).  :1ebb[1]
    sta l0049                                                         ; 1fee: 85 49       .I  :1ebd[1]
    txa                                                               ; 1ff0: 8a          .   :1ebf[1]
    pha                                                               ; 1ff1: 48          H   :1ec0[1]
    tya                                                               ; 1ff2: 98          .   :1ec1[1]
    pha                                                               ; 1ff3: 48          H   :1ec2[1]
    asl                                                               ; 1ff4: 0a          .   :1ec3[1]
    sta l004a                                                         ; 1ff5: 85 4a       .J  :1ec4[1]
    asl                                                               ; 1ff7: 0a          .   :1ec6[1]
    asl                                                               ; 1ff8: 0a          .   :1ec7[1]
    adc l004a                                                         ; 1ff9: 65 4a       eJ  :1ec8[1]
    sta l004a                                                         ; 1ffb: 85 4a       .J  :1eca[1]
    txa                                                               ; 1ffd: 8a          .   :1ecc[1]
    lsr                                                               ; 1ffe: 4a          J   :1ecd[1]
    lsr                                                               ; 1fff: 4a          J   :1ece[1]
    clc                                                               ; 2000: 18          .   :1ecf[1]
    adc l004a                                                         ; 2001: 65 4a       eJ  :1ed0[1]
    tay                                                               ; 2003: a8          .   :1ed2[1]
    txa                                                               ; 2004: 8a          .   :1ed3[1]
    and #3                                                            ; 2005: 29 03       ).  :1ed4[1]
    eor #3                                                            ; 2007: 49 03       I.  :1ed6[1]
    sta l004a                                                         ; 2009: 85 4a       .J  :1ed8[1]
    lda l0049                                                         ; 200b: a5 49       .I  :1eda[1]
    asl                                                               ; 200d: 0a          .   :1edc[1]
    asl                                                               ; 200e: 0a          .   :1edd[1]
    ora l004a                                                         ; 200f: 05 4a       .J  :1ede[1]
    tax                                                               ; 2011: aa          .   :1ee0[1]
    lda l1eab,x                                                       ; 2012: bd ab 1e    ... :1ee1[1]
    ldx l004a                                                         ; 2015: a6 4a       .J  :1ee4[1]
    sta l004a                                                         ; 2017: 85 4a       .J  :1ee6[1]
    lda something3_TODO,y                                             ; 2019: b9 00 0c    ... :1ee8[1]
    and l1ea7,x                                                       ; 201c: 3d a7 1e    =.. :1eeb[1]
    ora l004a                                                         ; 201f: 05 4a       .J  :1eee[1]
    sta something3_TODO,y                                             ; 2021: 99 00 0c    ... :1ef0[1]
    pla                                                               ; 2024: 68          h   :1ef3[1]
    tay                                                               ; 2025: a8          .   :1ef4[1]
    pla                                                               ; 2026: 68          h   :1ef5[1]
    tax                                                               ; 2027: aa          .   :1ef6[1]
    lda l0049                                                         ; 2028: a5 49       .I  :1ef7[1]
    rts                                                               ; 202a: 60          `   :1ef9[1]

; $202b referenced 18 times by $199b, $1b98, $1ba0, $1ba9, $1bb2, $1bbb, $1c72, $1c88, $1ccc, $1ce0, $1cf8, $1d05, $2668, $2684, $26f3, $270f, $287e, $33d6
sub_c1efa
    cpx #$28 ; '('                                                    ; 202b: e0 28       .(  :1efa[1]
    bcs c1f2d                                                         ; 202d: b0 2f       ./  :1efc[1]
    cpy #$18                                                          ; 202f: c0 18       ..  :1efe[1]
    bcs c1f2d                                                         ; 2031: b0 2b       .+  :1f00[1]
    stx l004a                                                         ; 2033: 86 4a       .J  :1f02[1]
    sty l004b                                                         ; 2035: 84 4b       .K  :1f04[1]
; $2037 referenced 4 times by $1f39, $1f3f, $1f46, $1f4a
c1f06
    tya                                                               ; 2037: 98          .   :1f06[1]
    asl                                                               ; 2038: 0a          .   :1f07[1]
    sta l0049                                                         ; 2039: 85 49       .I  :1f08[1]
    asl                                                               ; 203b: 0a          .   :1f0a[1]
    asl                                                               ; 203c: 0a          .   :1f0b[1]
    adc l0049                                                         ; 203d: 65 49       eI  :1f0c[1]
    sta l0049                                                         ; 203f: 85 49       .I  :1f0e[1]
    txa                                                               ; 2041: 8a          .   :1f10[1]
    lsr                                                               ; 2042: 4a          J   :1f11[1]
    lsr                                                               ; 2043: 4a          J   :1f12[1]
    clc                                                               ; 2044: 18          .   :1f13[1]
    adc l0049                                                         ; 2045: 65 49       eI  :1f14[1]
    tay                                                               ; 2047: a8          .   :1f16[1]
    txa                                                               ; 2048: 8a          .   :1f17[1]
    and #3                                                            ; 2049: 29 03       ).  :1f18[1]
    tax                                                               ; 204b: aa          .   :1f1a[1]
    lda something3_TODO,y                                             ; 204c: b9 00 0c    ... :1f1b[1]
    jmp c1f23                                                         ; 204f: 4c 23 1f    L#. :1f1e[1]

; $2052 referenced 1 time by $1f24
loop_c1f21
    lsr                                                               ; 2052: 4a          J   :1f21[1]
    lsr                                                               ; 2053: 4a          J   :1f22[1]
; $2054 referenced 1 time by $1f1e
c1f23
    dex                                                               ; 2054: ca          .   :1f23[1]
    bpl loop_c1f21                                                    ; 2055: 10 fb       ..  :1f24[1]
    ldx l004a                                                         ; 2057: a6 4a       .J  :1f26[1]
    ldy l004b                                                         ; 2059: a4 4b       .K  :1f28[1]
    and #3                                                            ; 205b: 29 03       ).  :1f2a[1]
; $205d referenced 1 time by $1f2f
loop_c1f2c
    rts                                                               ; 205d: 60          `   :1f2c[1]

; $205e referenced 2 times by $1efc, $1f00
c1f2d
    lda l0044                                                         ; 205e: a5 44       .D  :1f2d[1]
    bpl loop_c1f2c                                                    ; 2060: 10 fb       ..  :1f2f[1]
    stx l004a                                                         ; 2062: 86 4a       .J  :1f31[1]
    sty l004b                                                         ; 2064: 84 4b       .K  :1f33[1]
    ldx #0                                                            ; 2066: a2 00       ..  :1f35[1]
    lda l004a                                                         ; 2068: a5 4a       .J  :1f37[1]
    bmi c1f06                                                         ; 206a: 30 cb       0.  :1f39[1]
    ldx #$27 ; '''                                                    ; 206c: a2 27       .'  :1f3b[1]
    cmp #$28 ; '('                                                    ; 206e: c9 28       .(  :1f3d[1]
    bcs c1f06                                                         ; 2070: b0 c5       ..  :1f3f[1]
    tax                                                               ; 2072: aa          .   :1f41[1]
    ldy #0                                                            ; 2073: a0 00       ..  :1f42[1]
    lda l004b                                                         ; 2075: a5 4b       .K  :1f44[1]
    bmi c1f06                                                         ; 2077: 30 be       0.  :1f46[1]
    ldy #$17                                                          ; 2079: a0 17       ..  :1f48[1]
    bne c1f06                                                         ; 207b: d0 ba       ..  :1f4a[1]
; $207d referenced 9 times by $19aa, $19c7, $1c47, $1c7f, $1c95, $1ca2, $1cd6, $1cea, $3f48
sub_c1f4c
    sta l0016                                                         ; 207d: 85 16       ..  :1f4c[1]
    jsr sub_c1f84                                                     ; 207f: 20 84 1f     .. :1f4e[1]
    jsr sub_c138d                                                     ; 2082: 20 8d 13     .. :1f51[1]
    lda l0016                                                         ; 2085: a5 16       ..  :1f54[1]
    rts                                                               ; 2087: 60          `   :1f56[1]

    !byte $20, $4c, $1f, $4c, $44, $1e                                ; 2088: 20 4c 1f...  L. :1f57[1]

; $208e referenced 4 times by $12b8, $19b2, $19cf, $1a9b
c1f5d
    jsr sub_c1f84                                                     ; 208e: 20 84 1f     .. :1f5d[1]
    stx l1f6c                                                         ; 2091: 8e 6c 1f    .l. :1f60[1]
    tax                                                               ; 2094: aa          .   :1f63[1]
    jsr sub_c1f6d                                                     ; 2095: 20 6d 1f     m. :1f64[1]
    txa                                                               ; 2098: 8a          .   :1f67[1]
    ldx l1f6c                                                         ; 2099: ae 6c 1f    .l. :1f68[1]
    rts                                                               ; 209c: 60          `   :1f6b[1]

; $209d referenced 2 times by $1f60, $1f68
l1f6c
    !byte 0                                                           ; 209d: 00          .   :1f6c[1]

; $209e referenced 1 time by $1f64
sub_c1f6d
    pha                                                               ; 209e: 48          H   :1f6d[1]
    lda l0018                                                         ; 209f: a5 18       ..  :1f6e[1]
    sta l0950,x                                                       ; 20a1: 9d 50 09    .P. :1f70[1]
    lda l0019                                                         ; 20a4: a5 19       ..  :1f73[1]
    sta l0966,x                                                       ; 20a6: 9d 66 09    .f. :1f75[1]
    lda l001a                                                         ; 20a9: a5 1a       ..  :1f78[1]
    sta l097c,x                                                       ; 20ab: 9d 7c 09    .|. :1f7a[1]
    lda l001b                                                         ; 20ae: a5 1b       ..  :1f7d[1]
    sta l0992,x                                                       ; 20b0: 9d 92 09    ... :1f7f[1]
    pla                                                               ; 20b3: 68          h   :1f82[1]
    rts                                                               ; 20b4: 60          `   :1f83[1]

; $20b5 referenced 2 times by $1f4e, $1f5d
sub_c1f84
    pha                                                               ; 20b5: 48          H   :1f84[1]
    txa                                                               ; 20b6: 8a          .   :1f85[1]
    pha                                                               ; 20b7: 48          H   :1f86[1]
    tya                                                               ; 20b8: 98          .   :1f87[1]
    pha                                                               ; 20b9: 48          H   :1f88[1]
    txa                                                               ; 20ba: 8a          .   :1f89[1]
    asl                                                               ; 20bb: 0a          .   :1f8a[1]
    asl                                                               ; 20bc: 0a          .   :1f8b[1]
    asl                                                               ; 20bd: 0a          .   :1f8c[1]
    sta l0018                                                         ; 20be: 85 18       ..  :1f8d[1]
    txa                                                               ; 20c0: 8a          .   :1f8f[1]
    and #$80                                                          ; 20c1: 29 80       ).  :1f90[1]
    beq c1f96                                                         ; 20c3: f0 02       ..  :1f92[1]
    lda #$ff                                                          ; 20c5: a9 ff       ..  :1f94[1]
; $20c7 referenced 1 time by $1f92
c1f96
    rol                                                               ; 20c7: 2a          *   :1f96[1]
    sta l0019                                                         ; 20c8: 85 19       ..  :1f97[1]
    ldx #0                                                            ; 20ca: a2 00       ..  :1f99[1]
    lda l003a                                                         ; 20cc: a5 3a       .:  :1f9b[1]
    bpl c1fa0                                                         ; 20ce: 10 01       ..  :1f9d[1]
    dex                                                               ; 20d0: ca          .   :1f9f[1]
; $20d1 referenced 1 time by $1f9d
c1fa0
    clc                                                               ; 20d1: 18          .   :1fa0[1]
    adc l0018                                                         ; 20d2: 65 18       e.  :1fa1[1]
    sta l0018                                                         ; 20d4: 85 18       ..  :1fa3[1]
    txa                                                               ; 20d6: 8a          .   :1fa5[1]
    adc l0019                                                         ; 20d7: 65 19       e.  :1fa6[1]
    sta l0019                                                         ; 20d9: 85 19       ..  :1fa8[1]
    tya                                                               ; 20db: 98          .   :1faa[1]
    asl                                                               ; 20dc: 0a          .   :1fab[1]
    asl                                                               ; 20dd: 0a          .   :1fac[1]
    asl                                                               ; 20de: 0a          .   :1fad[1]
    sta l001a                                                         ; 20df: 85 1a       ..  :1fae[1]
    tya                                                               ; 20e1: 98          .   :1fb0[1]
    and #$80                                                          ; 20e2: 29 80       ).  :1fb1[1]
    beq c1fb7                                                         ; 20e4: f0 02       ..  :1fb3[1]
    lda #$ff                                                          ; 20e6: a9 ff       ..  :1fb5[1]
; $20e8 referenced 1 time by $1fb3
c1fb7
    rol                                                               ; 20e8: 2a          *   :1fb7[1]
    sta l001b                                                         ; 20e9: 85 1b       ..  :1fb8[1]
    ldy #0                                                            ; 20eb: a0 00       ..  :1fba[1]
    lda l003b                                                         ; 20ed: a5 3b       .;  :1fbc[1]
    bpl c1fc1                                                         ; 20ef: 10 01       ..  :1fbe[1]
    dey                                                               ; 20f1: 88          .   :1fc0[1]
; $20f2 referenced 1 time by $1fbe
c1fc1
    clc                                                               ; 20f2: 18          .   :1fc1[1]
    adc l001a                                                         ; 20f3: 65 1a       e.  :1fc2[1]
    sta l001a                                                         ; 20f5: 85 1a       ..  :1fc4[1]
    tya                                                               ; 20f7: 98          .   :1fc6[1]
    adc l001b                                                         ; 20f8: 65 1b       e.  :1fc7[1]
    sta l001b                                                         ; 20fa: 85 1b       ..  :1fc9[1]
    lda #0                                                            ; 20fc: a9 00       ..  :1fcb[1]
    sta l003a                                                         ; 20fe: 85 3a       .:  :1fcd[1]
    sta l003b                                                         ; 2100: 85 3b       .;  :1fcf[1]
    pla                                                               ; 2102: 68          h   :1fd1[1]
    tay                                                               ; 2103: a8          .   :1fd2[1]
    pla                                                               ; 2104: 68          h   :1fd3[1]
    tax                                                               ; 2105: aa          .   :1fd4[1]
    pla                                                               ; 2106: 68          h   :1fd5[1]
    rts                                                               ; 2107: 60          `   :1fd6[1]

something16_TODO
    lda l0052                                                         ; 2108: a5 52       .R  :1fd7[1]
    pha                                                               ; 210a: 48          H   :1fd9[1]
    lda #0                                                            ; 210b: a9 00       ..  :1fda[1]
    sta l0052                                                         ; 210d: 85 52       .R  :1fdc[1]
    lda #0                                                            ; 210f: a9 00       ..  :1fde[1]
    tax                                                               ; 2111: aa          .   :1fe0[1]
; $2112 referenced 1 time by $1fe7
loop_c1fe1
    sta l0116,x                                                       ; 2112: 9d 16 01    ... :1fe1[1]
    inx                                                               ; 2115: e8          .   :1fe4[1]
    cpx #$0b                                                          ; 2116: e0 0b       ..  :1fe5[1]
    bcc loop_c1fe1                                                    ; 2118: 90 f8       ..  :1fe7[1]
; $211a referenced 2 times by $202f, $20f4
c1fe9
    ldx #0                                                            ; 211a: a2 00       ..  :1fe9[1]
    stx l0062                                                         ; 211c: 86 62       .b  :1feb[1]
    stx l0063                                                         ; 211e: 86 63       .c  :1fed[1]
    lda #$ff                                                          ; 2120: a9 ff       ..  :1fef[1]
    sta l0060                                                         ; 2122: 85 60       .`  :1ff1[1]
    stx l0061                                                         ; 2124: 86 61       .a  :1ff3[1]
; $2126 referenced 1 time by $2010
loop_c1ff5
    lda l0116,x                                                       ; 2126: bd 16 01    ... :1ff5[1]
    bne c200d                                                         ; 2129: d0 13       ..  :1ff8[1]
    lda l09a8,x                                                       ; 212b: bd a8 09    ... :1ffa[1]
    ora l09b3,x                                                       ; 212e: 1d b3 09    ... :1ffd[1]
    beq c200d                                                         ; 2131: f0 0b       ..  :2000[1]
    lda l38c2,x                                                       ; 2133: bd c2 38    ..8 :2002[1]
    cmp l0061                                                         ; 2136: c5 61       .a  :2005[1]
    bcc c200d                                                         ; 2138: 90 04       ..  :2007[1]
    sta l0061                                                         ; 213a: 85 61       .a  :2009[1]
    stx l0060                                                         ; 213c: 86 60       .`  :200b[1]
; $213e referenced 3 times by $1ff8, $2000, $2007
c200d
    inx                                                               ; 213e: e8          .   :200d[1]
    cpx #$0b                                                          ; 213f: e0 0b       ..  :200e[1]
    bcc loop_c1ff5                                                    ; 2141: 90 e3       ..  :2010[1]
    ldx l0060                                                         ; 2143: a6 60       .`  :2012[1]
    bpl c2027                                                         ; 2145: 10 11       ..  :2014[1]
    ldx #$0a                                                          ; 2147: a2 0a       ..  :2016[1]
; $2149 referenced 1 time by $2021
loop_c2018
    lda l0116,x                                                       ; 2149: bd 16 01    ... :2018[1]
    bne c2020                                                         ; 214c: d0 03       ..  :201b[1]
    jsr sub_c20f7                                                     ; 214e: 20 f7 20     .  :201d[1]
; $2151 referenced 1 time by $201b
c2020
    dex                                                               ; 2151: ca          .   :2020[1]
    bpl loop_c2018                                                    ; 2152: 10 f5       ..  :2021[1]
    pla                                                               ; 2154: 68          h   :2023[1]
    sta l0052                                                         ; 2155: 85 52       .R  :2024[1]
    rts                                                               ; 2157: 60          `   :2026[1]

; $2158 referenced 1 time by $2014
c2027
    lda #$ff                                                          ; 2158: a9 ff       ..  :2027[1]
    sta l0116,x                                                       ; 215a: 9d 16 01    ... :2029[1]
    jsr sub_c211e                                                     ; 215d: 20 1e 21     .! :202c[1]
    beq c1fe9                                                         ; 2160: f0 b8       ..  :202f[1]
    txa                                                               ; 2162: 8a          .   :2031[1]
    ldx l0062                                                         ; 2163: a6 62       .b  :2032[1]
    sta l0100,x                                                       ; 2165: 9d 00 01    ... :2034[1]
    inc l0062                                                         ; 2168: e6 62       .b  :2037[1]
; $216a referenced 1 time by $2098
c2039
    ldx l0063                                                         ; 216a: a6 63       .c  :2039[1]
    ldy l0100,x                                                       ; 216c: bc 00 01    ... :203b[1]
    sty l0060                                                         ; 216f: 84 60       .`  :203e[1]
    lda l38c2,y                                                       ; 2171: b9 c2 38    ..8 :2040[1]
    sta l0061                                                         ; 2174: 85 61       .a  :2043[1]
    ldx #0                                                            ; 2176: a2 00       ..  :2045[1]
; $2178 referenced 1 time by $2090
c2047
    txa                                                               ; 2178: 8a          .   :2047[1]
    ldy #0                                                            ; 2179: a0 00       ..  :2048[1]
; $217b referenced 1 time by $2052
loop_c204a
    cmp l0100,y                                                       ; 217b: d9 00 01    ... :204a[1]
    beq c208d                                                         ; 217e: f0 3e       .>  :204d[1]
    iny                                                               ; 2180: c8          .   :204f[1]
    cpy l0062                                                         ; 2181: c4 62       .b  :2050[1]
    bcc loop_c204a                                                    ; 2183: 90 f6       ..  :2052[1]
    lda l38c2,x                                                       ; 2185: bd c2 38    ..8 :2054[1]
    cmp l0061                                                         ; 2188: c5 61       .a  :2057[1]
    bcc c2061                                                         ; 218a: 90 06       ..  :2059[1]
    bne c208d                                                         ; 218c: d0 30       .0  :205b[1]
    cpx l0060                                                         ; 218e: e4 60       .`  :205d[1]
    bcs c208d                                                         ; 2190: b0 2c       .,  :205f[1]
; $2192 referenced 1 time by $2059
c2061
    stx l0064                                                         ; 2192: 86 64       .d  :2061[1]
    txa                                                               ; 2194: 8a          .   :2063[1]
    clc                                                               ; 2195: 18          .   :2064[1]
    adc #$0b                                                          ; 2196: 69 0b       i.  :2065[1]
    tax                                                               ; 2198: aa          .   :2067[1]
    ldy l0060                                                         ; 2199: a4 60       .`  :2068[1]
    jsr sub_c28e2                                                     ; 219b: 20 e2 28     .( :206a[1]
    bne c207d                                                         ; 219e: d0 0e       ..  :206d[1]
    tya                                                               ; 21a0: 98          .   :206f[1]
    clc                                                               ; 21a1: 18          .   :2070[1]
    adc #$0b                                                          ; 21a2: 69 0b       i.  :2071[1]
    tay                                                               ; 21a4: a8          .   :2073[1]
    jsr sub_c28e2                                                     ; 21a5: 20 e2 28     .( :2074[1]
    ldx l0064                                                         ; 21a8: a6 64       .d  :2077[1]
    ora #0                                                            ; 21aa: 09 00       ..  :2079[1]
    beq c208d                                                         ; 21ac: f0 10       ..  :207b[1]
; $21ae referenced 1 time by $206d
c207d
    ldx l0064                                                         ; 21ae: a6 64       .d  :207d[1]
    lda #$ff                                                          ; 21b0: a9 ff       ..  :207f[1]
    sta l0116,x                                                       ; 21b2: 9d 16 01    ... :2081[1]
    txa                                                               ; 21b5: 8a          .   :2084[1]
    ldx l0062                                                         ; 21b6: a6 62       .b  :2085[1]
    sta l0100,x                                                       ; 21b8: 9d 00 01    ... :2087[1]
    inc l0062                                                         ; 21bb: e6 62       .b  :208a[1]
    tax                                                               ; 21bd: aa          .   :208c[1]
; $21be referenced 4 times by $204d, $205b, $205f, $207b
c208d
    inx                                                               ; 21be: e8          .   :208d[1]
    cpx #$0b                                                          ; 21bf: e0 0b       ..  :208e[1]
    bcc c2047                                                         ; 21c1: 90 b5       ..  :2090[1]
    inc l0063                                                         ; 21c3: e6 63       .c  :2092[1]
    lda l0063                                                         ; 21c5: a5 63       .c  :2094[1]
    cmp l0062                                                         ; 21c7: c5 62       .b  :2096[1]
    bcc c2039                                                         ; 21c9: 90 9f       ..  :2098[1]
    lda #0                                                            ; 21cb: a9 00       ..  :209a[1]
    sta l0063                                                         ; 21cd: 85 63       .c  :209c[1]
; $21cf referenced 1 time by $20d6
c209e
    lda #$ff                                                          ; 21cf: a9 ff       ..  :209e[1]
    sta l0060                                                         ; 21d1: 85 60       .`  :20a0[1]
    sta l0061                                                         ; 21d3: 85 61       .a  :20a2[1]
    ldx #0                                                            ; 21d5: a2 00       ..  :20a4[1]
; $21d7 referenced 1 time by $20c1
loop_c20a6
    ldy l0100,x                                                       ; 21d7: bc 00 01    ... :20a6[1]
    bmi c20be                                                         ; 21da: 30 13       0.  :20a9[1]
    lda l38c2,y                                                       ; 21dc: b9 c2 38    ..8 :20ab[1]
    cmp l0061                                                         ; 21df: c5 61       .a  :20ae[1]
    bcc c20b8                                                         ; 21e1: 90 06       ..  :20b0[1]
    bne c20be                                                         ; 21e3: d0 0a       ..  :20b2[1]
    cpy l0060                                                         ; 21e5: c4 60       .`  :20b4[1]
    bcs c20be                                                         ; 21e7: b0 06       ..  :20b6[1]
; $21e9 referenced 1 time by $20b0
c20b8
    sty l0060                                                         ; 21e9: 84 60       .`  :20b8[1]
    sta l0061                                                         ; 21eb: 85 61       .a  :20ba[1]
    stx l0064                                                         ; 21ed: 86 64       .d  :20bc[1]
; $21ef referenced 3 times by $20a9, $20b2, $20b6
c20be
    inx                                                               ; 21ef: e8          .   :20be[1]
    cpx l0062                                                         ; 21f0: e4 62       .b  :20bf[1]
    bcc loop_c20a6                                                    ; 21f2: 90 e3       ..  :20c1[1]
    ldx l0064                                                         ; 21f4: a6 64       .d  :20c3[1]
    lda #$ff                                                          ; 21f6: a9 ff       ..  :20c5[1]
    sta l0100,x                                                       ; 21f8: 9d 00 01    ... :20c7[1]
    ldx l0063                                                         ; 21fb: a6 63       .c  :20ca[1]
    lda l0060                                                         ; 21fd: a5 60       .`  :20cc[1]
    sta l010b,x                                                       ; 21ff: 9d 0b 01    ... :20ce[1]
    inx                                                               ; 2202: e8          .   :20d1[1]
    stx l0063                                                         ; 2203: 86 63       .c  :20d2[1]
    cpx l0062                                                         ; 2205: e4 62       .b  :20d4[1]
    bcc c209e                                                         ; 2207: 90 c6       ..  :20d6[1]
    ldy #0                                                            ; 2209: a0 00       ..  :20d8[1]
; $220b referenced 1 time by $20e4
loop_c20da
    lda l010b,y                                                       ; 220b: b9 0b 01    ... :20da[1]
    tax                                                               ; 220e: aa          .   :20dd[1]
    jsr sub_c2157                                                     ; 220f: 20 57 21     W! :20de[1]
    iny                                                               ; 2212: c8          .   :20e1[1]
    cpy l0062                                                         ; 2213: c4 62       .b  :20e2[1]
    bcc loop_c20da                                                    ; 2215: 90 f4       ..  :20e4[1]
    dey                                                               ; 2217: 88          .   :20e6[1]
; $2218 referenced 1 time by $20f2
loop_c20e7
    lda l010b,y                                                       ; 2218: b9 0b 01    ... :20e7[1]
    tax                                                               ; 221b: aa          .   :20ea[1]
    jsr sub_c219a                                                     ; 221c: 20 9a 21     .! :20eb[1]
    jsr sub_c20f7                                                     ; 221f: 20 f7 20     .  :20ee[1]
    dey                                                               ; 2222: 88          .   :20f1[1]
    bpl loop_c20e7                                                    ; 2223: 10 f3       ..  :20f2[1]
    jmp c1fe9                                                         ; 2225: 4c e9 1f    L.. :20f4[1]

; $2228 referenced 2 times by $201d, $20ee
sub_c20f7
    pha                                                               ; 2228: 48          H   :20f7[1]
    lda l0950,x                                                       ; 2229: bd 50 09    .P. :20f8[1]
    sta l095b,x                                                       ; 222c: 9d 5b 09    .[. :20fb[1]
    lda l0966,x                                                       ; 222f: bd 66 09    .f. :20fe[1]
    sta l0971,x                                                       ; 2232: 9d 71 09    .q. :2101[1]
    lda l097c,x                                                       ; 2235: bd 7c 09    .|. :2104[1]
    sta l0987,x                                                       ; 2238: 9d 87 09    ... :2107[1]
    lda l0992,x                                                       ; 223b: bd 92 09    ... :210a[1]
    sta l099d,x                                                       ; 223e: 9d 9d 09    ... :210d[1]
    lda l09a8,x                                                       ; 2241: bd a8 09    ... :2110[1]
    sta l09b3,x                                                       ; 2244: 9d b3 09    ... :2113[1]
    lda l09be,x                                                       ; 2247: bd be 09    ... :2116[1]
    sta l09c9,x                                                       ; 224a: 9d c9 09    ... :2119[1]
    pla                                                               ; 224d: 68          h   :211c[1]
    rts                                                               ; 224e: 60          `   :211d[1]

; $224f referenced 2 times by $202c, $21e1
sub_c211e
    lda #$ff                                                          ; 224f: a9 ff       ..  :211e[1]
    pha                                                               ; 2251: 48          H   :2120[1]
    lda l0950,x                                                       ; 2252: bd 50 09    .P. :2121[1]
    cmp l095b,x                                                       ; 2255: dd 5b 09    .[. :2124[1]
    bne c2155                                                         ; 2258: d0 2c       .,  :2127[1]
    lda l0966,x                                                       ; 225a: bd 66 09    .f. :2129[1]
    cmp l0971,x                                                       ; 225d: dd 71 09    .q. :212c[1]
    bne c2155                                                         ; 2260: d0 24       .$  :212f[1]
    lda l097c,x                                                       ; 2262: bd 7c 09    .|. :2131[1]
    cmp l0987,x                                                       ; 2265: dd 87 09    ... :2134[1]
    bne c2155                                                         ; 2268: d0 1c       ..  :2137[1]
    lda l0992,x                                                       ; 226a: bd 92 09    ... :2139[1]
    cmp l099d,x                                                       ; 226d: dd 9d 09    ... :213c[1]
    bne c2155                                                         ; 2270: d0 14       ..  :213f[1]
    lda l09a8,x                                                       ; 2272: bd a8 09    ... :2141[1]
    cmp l09b3,x                                                       ; 2275: dd b3 09    ... :2144[1]
    bne c2155                                                         ; 2278: d0 0c       ..  :2147[1]
    lda l09be,x                                                       ; 227a: bd be 09    ... :2149[1]
    cmp l09c9,x                                                       ; 227d: dd c9 09    ... :214c[1]
    bne c2155                                                         ; 2280: d0 04       ..  :214f[1]
    pla                                                               ; 2282: 68          h   :2151[1]
    lda #0                                                            ; 2283: a9 00       ..  :2152[1]
    pha                                                               ; 2285: 48          H   :2154[1]
; $2286 referenced 6 times by $2127, $212f, $2137, $213f, $2147, $214f
c2155
    pla                                                               ; 2286: 68          h   :2155[1]
    rts                                                               ; 2287: 60          `   :2156[1]

; $2288 referenced 1 time by $20de
sub_c2157
    tya                                                               ; 2288: 98          .   :2157[1]
    pha                                                               ; 2289: 48          H   :2158[1]
    lda l09b3,x                                                       ; 228a: bd b3 09    ... :2159[1]
    beq c2197                                                         ; 228d: f0 39       .9  :215c[1]
    lda l095b,x                                                       ; 228f: bd 5b 09    .[. :215e[1]
    sta l0018                                                         ; 2292: 85 18       ..  :2161[1]
    lda l0971,x                                                       ; 2294: bd 71 09    .q. :2163[1]
    sta l0019                                                         ; 2297: 85 19       ..  :2166[1]
    lda l0987,x                                                       ; 2299: bd 87 09    ... :2168[1]
    sta l001a                                                         ; 229c: 85 1a       ..  :216b[1]
    lda l099d,x                                                       ; 229e: bd 9d 09    ... :216d[1]
    sta l001b                                                         ; 22a1: 85 1b       ..  :2170[1]
    lda l09c9,x                                                       ; 22a3: bd c9 09    ... :2172[1]
    sta l001d                                                         ; 22a6: 85 1d       ..  :2175[1]
    lda l38ac,x                                                       ; 22a8: bd ac 38    ..8 :2177[1]
    beq c2184                                                         ; 22ab: f0 08       ..  :217a[1]
    cmp #$ff                                                          ; 22ad: c9 ff       ..  :217c[1]
    beq c218b                                                         ; 22af: f0 0b       ..  :217e[1]
    ldy #0                                                            ; 22b1: a0 00       ..  :2180[1]
    beq c2190                                                         ; 22b3: f0 0c       ..  :2182[1]
; $22b5 referenced 1 time by $217a
c2184
    lda l09b3,x                                                       ; 22b5: bd b3 09    ... :2184[1]
    ldy #2                                                            ; 22b8: a0 02       ..  :2187[1]
    bne c2190                                                         ; 22ba: d0 05       ..  :2189[1]
; $22bc referenced 1 time by $217e
c218b
    lda l09b3,x                                                       ; 22bc: bd b3 09    ... :218b[1]
    ldy #4                                                            ; 22bf: a0 04       ..  :218e[1]
; $22c1 referenced 2 times by $2182, $2189
c2190
    sta l0016                                                         ; 22c1: 85 16       ..  :2190[1]
    sty l0015                                                         ; 22c3: 84 15       ..  :2192[1]
    jsr sub_c138d                                                     ; 22c5: 20 8d 13     .. :2194[1]
; $22c8 referenced 1 time by $215c
c2197
    pla                                                               ; 22c8: 68          h   :2197[1]
    tay                                                               ; 22c9: a8          .   :2198[1]
    rts                                                               ; 22ca: 60          `   :2199[1]

; $22cb referenced 1 time by $20eb
sub_c219a
    lda l09a8,x                                                       ; 22cb: bd a8 09    ... :219a[1]
    beq c21ff                                                         ; 22ce: f0 60       .`  :219d[1]
    lda l0950,x                                                       ; 22d0: bd 50 09    .P. :219f[1]
    sta l0018                                                         ; 22d3: 85 18       ..  :21a2[1]
    lda l0966,x                                                       ; 22d5: bd 66 09    .f. :21a4[1]
    sta l0019                                                         ; 22d8: 85 19       ..  :21a7[1]
    lda l097c,x                                                       ; 22da: bd 7c 09    .|. :21a9[1]
    sta l001a                                                         ; 22dd: 85 1a       ..  :21ac[1]
    lda l0992,x                                                       ; 22df: bd 92 09    ... :21ae[1]
    sta l001b                                                         ; 22e2: 85 1b       ..  :21b1[1]
    lda l09be,x                                                       ; 22e4: bd be 09    ... :21b3[1]
    sta l001d                                                         ; 22e7: 85 1d       ..  :21b6[1]
    lda l09a8,x                                                       ; 22e9: bd a8 09    ... :21b8[1]
    sta l0016                                                         ; 22ec: 85 16       ..  :21bb[1]
    lda #0                                                            ; 22ee: a9 00       ..  :21bd[1]
    sta l0015                                                         ; 22f0: 85 15       ..  :21bf[1]
    lda l38ac,x                                                       ; 22f2: bd ac 38    ..8 :21c1[1]
    beq c21d0                                                         ; 22f5: f0 0a       ..  :21c4[1]
    cmp #$ff                                                          ; 22f7: c9 ff       ..  :21c6[1]
    beq c21d0                                                         ; 22f9: f0 06       ..  :21c8[1]
    sta l0014                                                         ; 22fb: 85 14       ..  :21ca[1]
    lda #3                                                            ; 22fd: a9 03       ..  :21cc[1]
    sta l0015                                                         ; 22ff: 85 15       ..  :21ce[1]
; $2301 referenced 2 times by $21c4, $21c8
c21d0
    jsr sub_c138d                                                     ; 2301: 20 8d 13     .. :21d0[1]
    cpx #1                                                            ; 2304: e0 01       ..  :21d3[1]
    bne c21ff                                                         ; 2306: d0 28       .(  :21d5[1]
    lda l0048                                                         ; 2308: a5 48       .H  :21d7[1]
    cmp #4                                                            ; 230a: c9 04       ..  :21d9[1]
    bne c21ff                                                         ; 230c: d0 22       ."  :21db[1]
    stx l0065                                                         ; 230e: 86 65       .e  :21dd[1]
    ldx #0                                                            ; 2310: a2 00       ..  :21df[1]
    jsr sub_c211e                                                     ; 2312: 20 1e 21     .! :21e1[1]
    ldx l0065                                                         ; 2315: a6 65       .e  :21e4[1]
    ora #0                                                            ; 2317: 09 00       ..  :21e6[1]
    beq c21ef                                                         ; 2319: f0 05       ..  :21e8[1]
    lda l0116                                                         ; 231b: ad 16 01    ... :21ea[1]
    beq c21ff                                                         ; 231e: f0 10       ..  :21ed[1]
; $2320 referenced 1 time by $21e8
c21ef
    lda l09be,x                                                       ; 2320: bd be 09    ... :21ef[1]
    sta l001d                                                         ; 2323: 85 1d       ..  :21f2[1]
    lda #0                                                            ; 2325: a9 00       ..  :21f4[1]
    sta l0015                                                         ; 2327: 85 15       ..  :21f6[1]
    lda #$37 ; '7'                                                    ; 2329: a9 37       .7  :21f8[1]
    sta l0016                                                         ; 232b: 85 16       ..  :21fa[1]
    jsr sub_c138d                                                     ; 232d: 20 8d 13     .. :21fc[1]
; $2330 referenced 4 times by $219d, $21d5, $21db, $21ed
c21ff
    rts                                                               ; 2330: 60          `   :21ff[1]

; $2331 referenced 3 times by $2e89, $30ad, $333e
something17_TODO
    stx l0070                                                         ; 2331: 86 70       .p  :2200[1]
    sty l0071                                                         ; 2333: 84 71       .q  :2202[1]
    tay                                                               ; 2335: a8          .   :2204[1]
    lda (l0070),y                                                     ; 2336: b1 70       .p  :2205[1]
    sta l09a8                                                         ; 2338: 8d a8 09    ... :2207[1]
    iny                                                               ; 233b: c8          .   :220a[1]
    lda l2433                                                         ; 233c: ad 33 24    .3$ :220b[1]
    bne c2231                                                         ; 233f: d0 21       .!  :220e[1]
    lda (l0070),y                                                     ; 2341: b1 70       .p  :2210[1]
    ldx l09be                                                         ; 2343: ae be 09    ... :2212[1]
    bpl c221c                                                         ; 2346: 10 05       ..  :2215[1]
    eor #$ff                                                          ; 2348: 49 ff       I.  :2217[1]
    clc                                                               ; 234a: 18          .   :2219[1]
    adc #1                                                            ; 234b: 69 01       i.  :221a[1]
; $234d referenced 1 time by $2215
c221c
    ldx #0                                                            ; 234d: a2 00       ..  :221c[1]
    ora #0                                                            ; 234f: 09 00       ..  :221e[1]
    bpl c2223                                                         ; 2351: 10 01       ..  :2220[1]
    dex                                                               ; 2353: ca          .   :2222[1]
; $2354 referenced 1 time by $2220
c2223
    clc                                                               ; 2354: 18          .   :2223[1]
    adc l0950                                                         ; 2355: 6d 50 09    mP. :2224[1]
    sta l0950                                                         ; 2358: 8d 50 09    .P. :2227[1]
    txa                                                               ; 235b: 8a          .   :222a[1]
    adc l0966                                                         ; 235c: 6d 66 09    mf. :222b[1]
    sta l0966                                                         ; 235f: 8d 66 09    .f. :222e[1]
; $2362 referenced 1 time by $220e
c2231
    iny                                                               ; 2362: c8          .   :2231[1]
    ldx #0                                                            ; 2363: a2 00       ..  :2232[1]
    lda (l0070),y                                                     ; 2365: b1 70       .p  :2234[1]
    bpl c2239                                                         ; 2367: 10 01       ..  :2236[1]
    dex                                                               ; 2369: ca          .   :2238[1]
; $236a referenced 1 time by $2236
c2239
    clc                                                               ; 236a: 18          .   :2239[1]
    adc l097c                                                         ; 236b: 6d 7c 09    m|. :223a[1]
    sta l097c                                                         ; 236e: 8d 7c 09    .|. :223d[1]
    txa                                                               ; 2371: 8a          .   :2240[1]
    adc l0992                                                         ; 2372: 6d 92 09    m.. :2241[1]
    sta l0992                                                         ; 2375: 8d 92 09    ... :2244[1]
    rts                                                               ; 2378: 60          `   :2247[1]

; $2379 referenced 3 times by $2ec2, $30d9, $336a
something18_TODO
    stx l0072                                                         ; 2379: 86 72       .r  :2248[1]
    sty l0073                                                         ; 237b: 84 73       .s  :224a[1]
    ldy #0                                                            ; 237d: a0 00       ..  :224c[1]
    ora #0                                                            ; 237f: 09 00       ..  :224e[1]
    bpl c2267                                                         ; 2381: 10 15       ..  :2250[1]
    and #$7f                                                          ; 2383: 29 7f       ).  :2252[1]
    tay                                                               ; 2385: a8          .   :2254[1]
    lda (l0070),y                                                     ; 2386: b1 70       .p  :2255[1]
    cpy #$7f                                                          ; 2388: c0 7f       ..  :2257[1]
    bne c2267                                                         ; 238a: d0 0c       ..  :2259[1]
    ldy l09d5                                                         ; 238c: ac d5 09    ... :225b[1]
    iny                                                               ; 238f: c8          .   :225e[1]
    lda (l0070),y                                                     ; 2390: b1 70       .p  :225f[1]
    bne c2267                                                         ; 2392: d0 04       ..  :2261[1]
    ldy #0                                                            ; 2394: a0 00       ..  :2263[1]
    lda (l0070),y                                                     ; 2396: b1 70       .p  :2265[1]
; $2398 referenced 3 times by $2250, $2259, $2261
c2267
    sty l09d5                                                         ; 2398: 8c d5 09    ... :2267[1]
    sta l09a9                                                         ; 239b: 8d a9 09    ... :226a[1]
    lda l09be                                                         ; 239e: ad be 09    ... :226d[1]
    sta l09bf                                                         ; 23a1: 8d bf 09    ... :2270[1]
    lda l09a8                                                         ; 23a4: ad a8 09    ... :2273[1]
    jsr sub_c22ae                                                     ; 23a7: 20 ae 22     ." :2276[1]
    txa                                                               ; 23aa: 8a          .   :2279[1]
    ldx l09be                                                         ; 23ab: ae be 09    ... :227a[1]
    bpl c2284                                                         ; 23ae: 10 05       ..  :227d[1]
    eor #$ff                                                          ; 23b0: 49 ff       I.  :227f[1]
    clc                                                               ; 23b2: 18          .   :2281[1]
    adc #1                                                            ; 23b3: 69 01       i.  :2282[1]
; $23b5 referenced 1 time by $227d
c2284
    ldx #0                                                            ; 23b5: a2 00       ..  :2284[1]
    ora #0                                                            ; 23b7: 09 00       ..  :2286[1]
    bpl c228b                                                         ; 23b9: 10 01       ..  :2288[1]
    dex                                                               ; 23bb: ca          .   :228a[1]
; $23bc referenced 1 time by $2288
c228b
    clc                                                               ; 23bc: 18          .   :228b[1]
    adc l0950                                                         ; 23bd: 6d 50 09    mP. :228c[1]
    sta l0951                                                         ; 23c0: 8d 51 09    .Q. :228f[1]
    txa                                                               ; 23c3: 8a          .   :2292[1]
    adc l0966                                                         ; 23c4: 6d 66 09    mf. :2293[1]
    sta l0967                                                         ; 23c7: 8d 67 09    .g. :2296[1]
    ldx #0                                                            ; 23ca: a2 00       ..  :2299[1]
    tya                                                               ; 23cc: 98          .   :229b[1]
    bpl c229f                                                         ; 23cd: 10 01       ..  :229c[1]
    dex                                                               ; 23cf: ca          .   :229e[1]
; $23d0 referenced 1 time by $229c
c229f
    clc                                                               ; 23d0: 18          .   :229f[1]
    adc l097c                                                         ; 23d1: 6d 7c 09    m|. :22a0[1]
    sta l097d                                                         ; 23d4: 8d 7d 09    .}. :22a3[1]
    txa                                                               ; 23d7: 8a          .   :22a6[1]
    adc l0992                                                         ; 23d8: 6d 92 09    m.. :22a7[1]
    sta l0993                                                         ; 23db: 8d 93 09    ... :22aa[1]
    rts                                                               ; 23de: 60          `   :22ad[1]

; $23df referenced 1 time by $2276
sub_c22ae
    sta l0074                                                         ; 23df: 85 74       .t  :22ae[1]
    ldy #0                                                            ; 23e1: a0 00       ..  :22b0[1]
    beq c22bb                                                         ; 23e3: f0 07       ..  :22b2[1]
; $23e5 referenced 1 time by $22bd
loop_c22b4
    cmp l0074                                                         ; 23e5: c5 74       .t  :22b4[1]
    beq c22c4                                                         ; 23e7: f0 0c       ..  :22b6[1]
    iny                                                               ; 23e9: c8          .   :22b8[1]
    iny                                                               ; 23ea: c8          .   :22b9[1]
    iny                                                               ; 23eb: c8          .   :22ba[1]
; $23ec referenced 1 time by $22b2
c22bb
    lda (l0072),y                                                     ; 23ec: b1 72       .r  :22bb[1]
    bne loop_c22b4                                                    ; 23ee: d0 f5       ..  :22bd[1]
    ldx #0                                                            ; 23f0: a2 00       ..  :22bf[1]
    ldy #0                                                            ; 23f2: a0 00       ..  :22c1[1]
    rts                                                               ; 23f4: 60          `   :22c3[1]

; $23f5 referenced 1 time by $22b6
c22c4
    iny                                                               ; 23f5: c8          .   :22c4[1]
    lda (l0072),y                                                     ; 23f6: b1 72       .r  :22c5[1]
    tax                                                               ; 23f8: aa          .   :22c7[1]
    iny                                                               ; 23f9: c8          .   :22c8[1]
    lda (l0072),y                                                     ; 23fa: b1 72       .r  :22c9[1]
    tay                                                               ; 23fc: a8          .   :22cb[1]
    rts                                                               ; 23fd: 60          `   :22cc[1]

; $23fe referenced 2 times by $2322, $39be
something19_TODO
    lda l0048                                                         ; 23fe: a5 48       .H  :22cd[1]
    beq c22e0                                                         ; 2400: f0 0f       ..  :22cf[1]
    cmp #4                                                            ; 2402: c9 04       ..  :22d1[1]
    beq c22e3                                                         ; 2404: f0 0e       ..  :22d3[1]
    cmp #5                                                            ; 2406: c9 05       ..  :22d5[1]
    beq c22e6                                                         ; 2408: f0 0d       ..  :22d7[1]
    cmp #6                                                            ; 240a: c9 06       ..  :22d9[1]
    beq c22e9                                                         ; 240c: f0 0c       ..  :22db[1]
    jmp c22ec                                                         ; 240e: 4c ec 22    L." :22dd[1]

; $2411 referenced 1 time by $22cf
c22e0
    jmp c3986                                                         ; 2411: 4c 86 39    L.9 :22e0[1]

; $2414 referenced 1 time by $22d3
c22e3
    jmp c2d87                                                         ; 2414: 4c 87 2d    L.- :22e3[1]

; $2417 referenced 1 time by $22d7
c22e6
    jmp c2fc8                                                         ; 2417: 4c c8 2f    L./ :22e6[1]

; $241a referenced 1 time by $22db
c22e9
    jmp c31d8                                                         ; 241a: 4c d8 31    L.1 :22e9[1]

; $241d referenced 1 time by $22dd
c22ec
    rts                                                               ; 241d: 60          `   :22ec[1]

; $241e referenced 5 times by $230c, $232b, $2d89, $2fca, $31da
l22ed
    !byte 0                                                           ; 241e: 00          .   :22ed[1]

; $241f referenced 3 times by $2d92, $2fd3, $31e3
sub_c22ee
    stx l0070                                                         ; 241f: 86 70       .p  :22ee[1]
    sty l0071                                                         ; 2421: 84 71       .q  :22f0[1]
    clc                                                               ; 2423: 18          .   :22f2[1]
    adc l09d4                                                         ; 2424: 6d d4 09    m.. :22f3[1]
    tay                                                               ; 2427: a8          .   :22f6[1]
    lda (l0070),y                                                     ; 2428: b1 70       .p  :22f7[1]
    bne c22fe                                                         ; 242a: d0 03       ..  :22f9[1]
    ldy l09df                                                         ; 242c: ac df 09    ... :22fb[1]
; $242f referenced 1 time by $22f9
c22fe
    lda l09df                                                         ; 242f: ad df 09    ... :22fe[1]
    bne c2309                                                         ; 2432: d0 06       ..  :2301[1]
    tya                                                               ; 2434: 98          .   :2303[1]
    bne c2331                                                         ; 2435: d0 2b       .+  :2304[1]
    jsr sub_c2358                                                     ; 2437: 20 58 23     X# :2306[1]
; $243a referenced 1 time by $2301
c2309
    lda l09df                                                         ; 243a: ad df 09    ... :2309[1]
    cmp l22ed                                                         ; 243d: cd ed 22    .." :230c[1]
    bne c2325                                                         ; 2440: d0 14       ..  :230f[1]
    cpy l09df                                                         ; 2442: cc df 09    ... :2311[1]
    bne c2331                                                         ; 2445: d0 1b       ..  :2314[1]
    lda #0                                                            ; 2447: a9 00       ..  :2316[1]
    sta l09df                                                         ; 2449: 8d df 09    ... :2318[1]
    sta l09d4                                                         ; 244c: 8d d4 09    ... :231b[1]
    sta l0048                                                         ; 244f: 85 48       .H  :231e[1]
    pla                                                               ; 2451: 68          h   :2320[1]
    pla                                                               ; 2452: 68          h   :2321[1]
    jmp something19_TODO                                              ; 2453: 4c cd 22    L." :2322[1]

; $2456 referenced 1 time by $230f
c2325
    lda l0048                                                         ; 2456: a5 48       .H  :2325[1]
    cmp l004d                                                         ; 2458: c5 4d       .M  :2327[1]
    beq c2334                                                         ; 245a: f0 09       ..  :2329[1]
    ldy l22ed                                                         ; 245c: ac ed 22    .." :232b[1]
    sty l09df                                                         ; 245f: 8c df 09    ... :232e[1]
; $2462 referenced 2 times by $2304, $2314
c2331
    lda #$ff                                                          ; 2462: a9 ff       ..  :2331[1]
    rts                                                               ; 2464: 60          `   :2333[1]

; $2465 referenced 1 time by $2329
c2334
    lda #0                                                            ; 2465: a9 00       ..  :2334[1]
    rts                                                               ; 2467: 60          `   :2336[1]

; $2468 referenced 2 times by $2b61, $2e3c
sub_c2337
    sta l004d                                                         ; 2468: 85 4d       .M  :2337[1]
    lda #0                                                            ; 246a: a9 00       ..  :2339[1]
    sta l2433                                                         ; 246c: 8d 33 24    .3$ :233b[1]
    sta l0052                                                         ; 246f: 85 52       .R  :233e[1]
    lda l0029                                                         ; 2471: a5 29       .)  :2340[1]
    cmp l296d                                                         ; 2473: cd 6d 29    .m) :2342[1]
    bcc c2357                                                         ; 2476: 90 10       ..  :2345[1]
    lda #$ff                                                          ; 2478: a9 ff       ..  :2347[1]
    ldx #$d0                                                          ; 247a: a2 d0       ..  :2349[1]
    ldy #$38 ; '8'                                                    ; 247c: a0 38       .8  :234b[1]
    jsr sub_c38f6                                                     ; 247e: 20 f6 38     .8 :234d[1]
    ldx #$ba                                                          ; 2481: a2 ba       ..  :2350[1]
    ldy #$38 ; '8'                                                    ; 2483: a0 38       .8  :2352[1]
    jsr sub_c38f6                                                     ; 2485: 20 f6 38     .8 :2354[1]
; $2488 referenced 1 time by $2345
c2357
    rts                                                               ; 2488: 60          `   :2357[1]

; $2489 referenced 2 times by $2306, $39c9
sub_c2358
    lda #osbyte_flush_buffer                                          ; 2489: a9 15       ..  :2358[1]
    ldx #buffer_sound_channel_0                                       ; 248b: a2 04       ..  :235a[1]
    jsr osbyte                                                        ; 248d: 20 f4 ff     .. :235c[1]   ; Flush sound channel 0 (X=4)
    lda #0                                                            ; 2490: a9 00       ..  :235f[1]
    sta l396f                                                         ; 2492: 8d 6f 39    .o9 :2361[1]
    sta l3970                                                         ; 2495: 8d 70 39    .p9 :2364[1]
    sta l2433                                                         ; 2498: 8d 33 24    .3$ :2367[1]
    rts                                                               ; 249b: 60          `   :236a[1]

; $249c referenced 1 time by $2656
sub_c236b
    lda l09a8                                                         ; 249c: ad a8 09    ... :236b[1]
    and l09b3                                                         ; 249f: 2d b3 09    -.. :236e[1]
    beq c23a8                                                         ; 24a2: f0 35       .5  :2371[1]
    lda #2                                                            ; 24a4: a9 02       ..  :2373[1]
    sta l2551                                                         ; 24a6: 8d 51 25    .Q% :2375[1]
    lda #0                                                            ; 24a9: a9 00       ..  :2378[1]
    jsr sub_c2894                                                     ; 24ab: 20 94 28     .( :237a[1]
    beq c23a8                                                         ; 24ae: f0 29       .)  :237d[1]
    lda l0987                                                         ; 24b0: ad 87 09    ... :237f[1]
    sec                                                               ; 24b3: 38          8   :2382[1]
    sbc l097c                                                         ; 24b4: ed 7c 09    .|. :2383[1]
    beq c2392                                                         ; 24b7: f0 0a       ..  :2386[1]
    lda l099d                                                         ; 24b9: ad 9d 09    ... :2388[1]
    sbc l0992                                                         ; 24bc: ed 92 09    ... :238b[1]
    bmi c23a5                                                         ; 24bf: 30 15       0.  :238e[1]
    bpl c23a8                                                         ; 24c1: 10 16       ..  :2390[1]
; $24c3 referenced 1 time by $2386
c2392
    lda l38d8                                                         ; 24c3: ad d8 38    ..8 :2392[1]
    and #2                                                            ; 24c6: 29 02       ).  :2395[1]
    beq c23a8                                                         ; 24c8: f0 0f       ..  :2397[1]
    lda #2                                                            ; 24ca: a9 02       ..  :2399[1]
    sta l2551                                                         ; 24cc: 8d 51 25    .Q% :239b[1]
    lda #$0b                                                          ; 24cf: a9 0b       ..  :239e[1]
    jsr sub_c2894                                                     ; 24d1: 20 94 28     .( :23a0[1]
    bne c23a8                                                         ; 24d4: d0 03       ..  :23a3[1]
; $24d6 referenced 1 time by $238e
c23a5
    jsr sub_c23a9                                                     ; 24d6: 20 a9 23     .# :23a5[1]
; $24d9 referenced 5 times by $2371, $237d, $2390, $2397, $23a3
c23a8
    rts                                                               ; 24d9: 60          `   :23a8[1]

; $24da referenced 1 time by $23a5
sub_c23a9
    pha                                                               ; 24da: 48          H   :23a9[1]
    txa                                                               ; 24db: 8a          .   :23aa[1]
    pha                                                               ; 24dc: 48          H   :23ab[1]
    tya                                                               ; 24dd: 98          .   :23ac[1]
    pha                                                               ; 24de: 48          H   :23ad[1]
    lda #0                                                            ; 24df: a9 00       ..  :23ae[1]
    ldx #$ee                                                          ; 24e1: a2 ee       ..  :23b0[1]
    ldy #$38 ; '8'                                                    ; 24e3: a0 38       .8  :23b2[1]
    jsr sub_c38f6                                                     ; 24e5: 20 f6 38     .8 :23b4[1]
    ldx #$e6                                                          ; 24e8: a2 e6       ..  :23b7[1]
    ldy #$38 ; '8'                                                    ; 24ea: a0 38       .8  :23b9[1]
    jsr sub_c38f6                                                     ; 24ec: 20 f6 38     .8 :23bb[1]
    pla                                                               ; 24ef: 68          h   :23be[1]
    tay                                                               ; 24f0: a8          .   :23bf[1]
    pla                                                               ; 24f1: 68          h   :23c0[1]
    tax                                                               ; 24f2: aa          .   :23c1[1]
    pla                                                               ; 24f3: 68          h   :23c2[1]
    rts                                                               ; 24f4: 60          `   :23c3[1]

; $24f5 referenced 3 times by $2da6, $2fe7, $31f7
sub_c23c4
    txa                                                               ; 24f5: 8a          .   :23c4[1]
    pha                                                               ; 24f6: 48          H   :23c5[1]
    tya                                                               ; 24f7: 98          .   :23c6[1]
    pha                                                               ; 24f8: 48          H   :23c7[1]
    lda #0                                                            ; 24f9: a9 00       ..  :23c8[1]
    jsr sub_c2770                                                     ; 24fb: 20 70 27     p' :23ca[1]
    lda l2433                                                         ; 24fe: ad 33 24    .3$ :23cd[1]
    beq c242b                                                         ; 2501: f0 59       .Y  :23d0[1]
    cmp #$80                                                          ; 2503: c9 80       ..  :23d2[1]
    beq c241a                                                         ; 2505: f0 44       .D  :23d4[1]
    lda l2433                                                         ; 2507: ad 33 24    .3$ :23d6[1]
    bmi c23e2                                                         ; 250a: 30 07       0.  :23d9[1]
    inc l24d1                                                         ; 250c: ee d1 24    ..$ :23db[1]
    ldy #0                                                            ; 250f: a0 00       ..  :23de[1]
    beq c23e7                                                         ; 2511: f0 05       ..  :23e0[1]
; $2513 referenced 1 time by $23d9
c23e2
    dec l24d0                                                         ; 2513: ce d0 24    ..$ :23e2[1]
    ldy #$ff                                                          ; 2516: a0 ff       ..  :23e5[1]
; $2518 referenced 1 time by $23e0
c23e7
    lda #1                                                            ; 2518: a9 01       ..  :23e7[1]
    sta l2551                                                         ; 251a: 8d 51 25    .Q% :23e9[1]
    lda #0                                                            ; 251d: a9 00       ..  :23ec[1]
    jsr sub_c2894                                                     ; 251f: 20 94 28     .( :23ee[1]
    beq c23fa                                                         ; 2522: f0 07       ..  :23f1[1]
    lda #$80                                                          ; 2524: a9 80       ..  :23f3[1]
    sta l2433                                                         ; 2526: 8d 33 24    .3$ :23f5[1]
    bne c241a                                                         ; 2529: d0 20       .   :23f8[1]
; $252b referenced 1 time by $23f1
c23fa
    lda l288f                                                         ; 252b: ad 8f 28    ..( :23fa[1]
    beq c2404                                                         ; 252e: f0 05       ..  :23fd[1]
    lda #0                                                            ; 2530: a9 00       ..  :23ff[1]
    sta l09df                                                         ; 2532: 8d df 09    ... :2401[1]
; $2535 referenced 1 time by $23fd
c2404
    ldx #1                                                            ; 2535: a2 01       ..  :2404[1]
; $2537 referenced 1 time by $2418
loop_c2406
    lda l2433                                                         ; 2537: ad 33 24    .3$ :2406[1]
    clc                                                               ; 253a: 18          .   :2409[1]
    adc l0950,x                                                       ; 253b: 7d 50 09    }P. :240a[1]
    sta l0950,x                                                       ; 253e: 9d 50 09    .P. :240d[1]
    tya                                                               ; 2541: 98          .   :2410[1]
    adc l0966,x                                                       ; 2542: 7d 66 09    }f. :2411[1]
    sta l0966,x                                                       ; 2545: 9d 66 09    .f. :2414[1]
    dex                                                               ; 2548: ca          .   :2417[1]
    bpl loop_c2406                                                    ; 2549: 10 ec       ..  :2418[1]
; $254b referenced 2 times by $23d4, $23f8
c241a
    lda l2433                                                         ; 254b: ad 33 24    .3$ :241a[1]
    cmp #$80                                                          ; 254e: c9 80       ..  :241d[1]
    bne c242b                                                         ; 2550: d0 0a       ..  :241f[1]
    lda l288f                                                         ; 2552: ad 8f 28    ..( :2421[1]
    beq c242b                                                         ; 2555: f0 05       ..  :2424[1]
    lda #0                                                            ; 2557: a9 00       ..  :2426[1]
    sta l2433                                                         ; 2559: 8d 33 24    .3$ :2428[1]
; $255c referenced 3 times by $23d0, $241f, $2424
c242b
    pla                                                               ; 255c: 68          h   :242b[1]
    tay                                                               ; 255d: a8          .   :242c[1]
    pla                                                               ; 255e: 68          h   :242d[1]
    tax                                                               ; 255f: aa          .   :242e[1]
    lda l2433                                                         ; 2560: ad 33 24    .3$ :242f[1]
    rts                                                               ; 2563: 60          `   :2432[1]

; $2564 referenced 13 times by $11b4, $220b, $233b, $2367, $23cd, $23d6, $23f5, $2406, $241a, $2428, $242f, $2de1, $3041
l2433
    !byte 0                                                           ; 2564: 00          .   :2433[1]

; $2565 referenced 3 times by $257d, $25e7, $27a8
sub_c2434
    txa                                                               ; 2565: 8a          .   :2434[1]
    pha                                                               ; 2566: 48          H   :2435[1]
    lda l09a8,x                                                       ; 2567: bd a8 09    ... :2436[1]
    jsr set_yx_based_on_a                                             ; 256a: 20 2c 13     ,. :2439[1]
    stx l0080                                                         ; 256d: 86 80       ..  :243c[1]
    sty l0081                                                         ; 256f: 84 81       ..  :243e[1]
    pla                                                               ; 2571: 68          h   :2440[1]
    tax                                                               ; 2572: aa          .   :2441[1]
    ldy #0                                                            ; 2573: a0 00       ..  :2442[1]
    lda (l0080),y                                                     ; 2575: b1 80       ..  :2444[1]
    ldy l09be,x                                                       ; 2577: bc be 09    ... :2446[1]
    bpl c244d                                                         ; 257a: 10 02       ..  :2449[1]
    eor #$ff                                                          ; 257c: 49 ff       I.  :244b[1]
; $257e referenced 1 time by $2449
c244d
    ldy #0                                                            ; 257e: a0 00       ..  :244d[1]
    ora #0                                                            ; 2580: 09 00       ..  :244f[1]
    bpl c2454                                                         ; 2582: 10 01       ..  :2451[1]
    dey                                                               ; 2584: 88          .   :2453[1]
; $2585 referenced 1 time by $2451
c2454
    clc                                                               ; 2585: 18          .   :2454[1]
    adc l0950,x                                                       ; 2586: 7d 50 09    }P. :2455[1]
    sta l0070                                                         ; 2589: 85 70       .p  :2458[1]
    tya                                                               ; 258b: 98          .   :245a[1]
    adc l0966,x                                                       ; 258c: 7d 66 09    }f. :245b[1]
    sta l0071                                                         ; 258f: 85 71       .q  :245e[1]
    ldy #2                                                            ; 2591: a0 02       ..  :2460[1]
    lda (l0080),y                                                     ; 2593: b1 80       ..  :2462[1]
    sec                                                               ; 2595: 38          8   :2464[1]
    sbc #1                                                            ; 2596: e9 01       ..  :2465[1]
    ldy l09be,x                                                       ; 2598: bc be 09    ... :2467[1]
    bmi c247a                                                         ; 259b: 30 0e       0.  :246a[1]
    clc                                                               ; 259d: 18          .   :246c[1]
    adc l0070                                                         ; 259e: 65 70       ep  :246d[1]
    sta l0072                                                         ; 25a0: 85 72       .r  :246f[1]
    lda #0                                                            ; 25a2: a9 00       ..  :2471[1]
    adc l0071                                                         ; 25a4: 65 71       eq  :2473[1]
    sta l0073                                                         ; 25a6: 85 73       .s  :2475[1]
    jmp c248d                                                         ; 25a8: 4c 8d 24    L.$ :2477[1]

; $25ab referenced 1 time by $246a
c247a
    sta l0073                                                         ; 25ab: 85 73       .s  :247a[1]
    lda l0070                                                         ; 25ad: a5 70       .p  :247c[1]
    sta l0072                                                         ; 25af: 85 72       .r  :247e[1]
    sec                                                               ; 25b1: 38          8   :2480[1]
    sbc l0073                                                         ; 25b2: e5 73       .s  :2481[1]
    sta l0070                                                         ; 25b4: 85 70       .p  :2483[1]
    lda l0071                                                         ; 25b6: a5 71       .q  :2485[1]
    sta l0073                                                         ; 25b8: 85 73       .s  :2487[1]
    sbc #0                                                            ; 25ba: e9 00       ..  :2489[1]
    sta l0071                                                         ; 25bc: 85 71       .q  :248b[1]
; $25be referenced 1 time by $2477
c248d
    ldy #0                                                            ; 25be: a0 00       ..  :248d[1]
    lda l24d0                                                         ; 25c0: ad d0 24    ..$ :248f[1]
    bpl c2495                                                         ; 25c3: 10 01       ..  :2492[1]
    dey                                                               ; 25c5: 88          .   :2494[1]
; $25c6 referenced 1 time by $2492
c2495
    clc                                                               ; 25c6: 18          .   :2495[1]
    adc l0070                                                         ; 25c7: 65 70       ep  :2496[1]
    sta l0070                                                         ; 25c9: 85 70       .p  :2498[1]
    sta l0078                                                         ; 25cb: 85 78       .x  :249a[1]
    tya                                                               ; 25cd: 98          .   :249c[1]
    adc l0071                                                         ; 25ce: 65 71       eq  :249d[1]
    sta l0071                                                         ; 25d0: 85 71       .q  :249f[1]
    lsr                                                               ; 25d2: 4a          J   :24a1[1]
    ror l0078                                                         ; 25d3: 66 78       fx  :24a2[1]
    lsr                                                               ; 25d5: 4a          J   :24a4[1]
    ror l0078                                                         ; 25d6: 66 78       fx  :24a5[1]
    lsr                                                               ; 25d8: 4a          J   :24a7[1]
    ror l0078                                                         ; 25d9: 66 78       fx  :24a8[1]
    ldy #0                                                            ; 25db: a0 00       ..  :24aa[1]
    lda l24d1                                                         ; 25dd: ad d1 24    ..$ :24ac[1]
    bpl c24b2                                                         ; 25e0: 10 01       ..  :24af[1]
    dey                                                               ; 25e2: 88          .   :24b1[1]
; $25e3 referenced 1 time by $24af
c24b2
    clc                                                               ; 25e3: 18          .   :24b2[1]
    adc l0072                                                         ; 25e4: 65 72       er  :24b3[1]
    sta l0072                                                         ; 25e6: 85 72       .r  :24b5[1]
    sta l0079                                                         ; 25e8: 85 79       .y  :24b7[1]
    tya                                                               ; 25ea: 98          .   :24b9[1]
    adc l0073                                                         ; 25eb: 65 73       es  :24ba[1]
    sta l0073                                                         ; 25ed: 85 73       .s  :24bc[1]
    lsr                                                               ; 25ef: 4a          J   :24be[1]
    ror l0079                                                         ; 25f0: 66 79       fy  :24bf[1]
    lsr                                                               ; 25f2: 4a          J   :24c1[1]
    ror l0079                                                         ; 25f3: 66 79       fy  :24c2[1]
    lsr                                                               ; 25f5: 4a          J   :24c4[1]
    ror l0079                                                         ; 25f6: 66 79       fy  :24c5[1]
    lda #0                                                            ; 25f8: a9 00       ..  :24c7[1]
    sta l24d0                                                         ; 25fa: 8d d0 24    ..$ :24c9[1]
    sta l24d1                                                         ; 25fd: 8d d1 24    ..$ :24cc[1]
    rts                                                               ; 2600: 60          `   :24cf[1]

; $2601 referenced 7 times by $23e2, $248f, $24c9, $25d8, $25df, $25ef, $2950
l24d0
    !byte 0                                                           ; 2601: 00          .   :24d0[1]
; $2602 referenced 7 times by $23db, $24ac, $24cc, $25db, $25e3, $25eb, $294d
l24d1
    !byte 0                                                           ; 2602: 00          .   :24d1[1]

; $2603 referenced 9 times by $18e4, $2611, $262d, $2646, $2780, $28a1, $28f8, $290b, $3374
sub_c24d2
    txa                                                               ; 2603: 8a          .   :24d2[1]
    pha                                                               ; 2604: 48          H   :24d3[1]
    lda l09a8,x                                                       ; 2605: bd a8 09    ... :24d4[1]
    jsr set_yx_based_on_a                                             ; 2608: 20 2c 13     ,. :24d7[1]
    stx l0080                                                         ; 260b: 86 80       ..  :24da[1]
    sty l0081                                                         ; 260d: 84 81       ..  :24dc[1]
    pla                                                               ; 260f: 68          h   :24de[1]
    tax                                                               ; 2610: aa          .   :24df[1]
    ldy #1                                                            ; 2611: a0 01       ..  :24e0[1]
    lda (l0080),y                                                     ; 2613: b1 80       ..  :24e2[1]
    ldy #0                                                            ; 2615: a0 00       ..  :24e4[1]
    ora #0                                                            ; 2617: 09 00       ..  :24e6[1]
    bpl c24eb                                                         ; 2619: 10 01       ..  :24e8[1]
    dey                                                               ; 261b: 88          .   :24ea[1]
; $261c referenced 1 time by $24e8
c24eb
    clc                                                               ; 261c: 18          .   :24eb[1]
    adc l097c,x                                                       ; 261d: 7d 7c 09    }|. :24ec[1]
    sta l0076                                                         ; 2620: 85 76       .v  :24ef[1]
    tya                                                               ; 2622: 98          .   :24f1[1]
    adc l0992,x                                                       ; 2623: 7d 92 09    }.. :24f2[1]
    sta l0077                                                         ; 2626: 85 77       .w  :24f5[1]
    ldy #3                                                            ; 2628: a0 03       ..  :24f7[1]
    lda (l0080),y                                                     ; 262a: b1 80       ..  :24f9[1]
    sec                                                               ; 262c: 38          8   :24fb[1]
    sbc #1                                                            ; 262d: e9 01       ..  :24fc[1]
    sta l0074                                                         ; 262f: 85 74       .t  :24fe[1]
    lda l0076                                                         ; 2631: a5 76       .v  :2500[1]
    sec                                                               ; 2633: 38          8   :2502[1]
    sbc l0074                                                         ; 2634: e5 74       .t  :2503[1]
    sta l0074                                                         ; 2636: 85 74       .t  :2505[1]
    lda l0077                                                         ; 2638: a5 77       .w  :2507[1]
    sbc #0                                                            ; 263a: e9 00       ..  :2509[1]
    sta l0075                                                         ; 263c: 85 75       .u  :250b[1]
    ldy #0                                                            ; 263e: a0 00       ..  :250d[1]
    lda l2550                                                         ; 2640: ad 50 25    .P% :250f[1]
    bpl c2515                                                         ; 2643: 10 01       ..  :2512[1]
    dey                                                               ; 2645: 88          .   :2514[1]
; $2646 referenced 1 time by $2512
c2515
    clc                                                               ; 2646: 18          .   :2515[1]
    adc l0074                                                         ; 2647: 65 74       et  :2516[1]
    sta l0074                                                         ; 2649: 85 74       .t  :2518[1]
    sta l007a                                                         ; 264b: 85 7a       .z  :251a[1]
    tya                                                               ; 264d: 98          .   :251c[1]
    adc l0075                                                         ; 264e: 65 75       eu  :251d[1]
    sta l0075                                                         ; 2650: 85 75       .u  :251f[1]
    lsr                                                               ; 2652: 4a          J   :2521[1]
    ror l007a                                                         ; 2653: 66 7a       fz  :2522[1]
    lsr                                                               ; 2655: 4a          J   :2524[1]
    ror l007a                                                         ; 2656: 66 7a       fz  :2525[1]
    lsr                                                               ; 2658: 4a          J   :2527[1]
    ror l007a                                                         ; 2659: 66 7a       fz  :2528[1]
    ldy #0                                                            ; 265b: a0 00       ..  :252a[1]
    lda l2551                                                         ; 265d: ad 51 25    .Q% :252c[1]
    bpl c2532                                                         ; 2660: 10 01       ..  :252f[1]
    dey                                                               ; 2662: 88          .   :2531[1]
; $2663 referenced 1 time by $252f
c2532
    clc                                                               ; 2663: 18          .   :2532[1]
    adc l0076                                                         ; 2664: 65 76       ev  :2533[1]
    sta l0076                                                         ; 2666: 85 76       .v  :2535[1]
    sta l007b                                                         ; 2668: 85 7b       .{  :2537[1]
    tya                                                               ; 266a: 98          .   :2539[1]
    adc l0077                                                         ; 266b: 65 77       ew  :253a[1]
    sta l0077                                                         ; 266d: 85 77       .w  :253c[1]
    lsr                                                               ; 266f: 4a          J   :253e[1]
    ror l007b                                                         ; 2670: 66 7b       f{  :253f[1]
    lsr                                                               ; 2672: 4a          J   :2541[1]
    ror l007b                                                         ; 2673: 66 7b       f{  :2542[1]
    lsr                                                               ; 2675: 4a          J   :2544[1]
    ror l007b                                                         ; 2676: 66 7b       f{  :2545[1]
    lda #0                                                            ; 2678: a9 00       ..  :2547[1]
    sta l2550                                                         ; 267a: 8d 50 25    .P% :2549[1]
    sta l2551                                                         ; 267d: 8d 51 25    .Q% :254c[1]
    rts                                                               ; 2680: 60          `   :254f[1]

; $2681 referenced 9 times by $250f, $2549, $2947, $2db2, $2ff3, $3015, $322e, $327d, $3294
l2550
    !byte 0                                                           ; 2681: 00          .   :2550[1]
; $2682 referenced 10 times by $2375, $239b, $23e9, $252c, $254c, $2603, $2628, $263e, $277d, $294a
l2551
    !byte 0                                                           ; 2682: 00          .   :2551[1]

; $2683 referenced 1 time by $25f2
c2552
    cpx #0                                                            ; 2683: e0 00       ..  :2552[1]
    beq c255a                                                         ; 2685: f0 04       ..  :2554[1]
    cpx #$0b                                                          ; 2687: e0 0b       ..  :2556[1]
    bne c25d6                                                         ; 2689: d0 7c       .|  :2558[1]
; $268b referenced 1 time by $2554
c255a
    lda l0052                                                         ; 268b: a5 52       .R  :255a[1]
    beq c25d6                                                         ; 268d: f0 78       .x  :255c[1]
    inx                                                               ; 268f: e8          .   :255e[1]
    lda l09a8,x                                                       ; 2690: bd a8 09    ... :255f[1]
    dex                                                               ; 2693: ca          .   :2562[1]
    ora #0                                                            ; 2694: 09 00       ..  :2563[1]
    beq c25d6                                                         ; 2696: f0 6f       .o  :2565[1]
    inx                                                               ; 2698: e8          .   :2567[1]
    ldy #3                                                            ; 2699: a0 03       ..  :2568[1]
; $269b referenced 1 time by $2571
loop_c256a
    lda l0070,y                                                       ; 269b: b9 70 00    .p. :256a[1]
    sta l0129,y                                                       ; 269e: 99 29 01    .). :256d[1]
    dey                                                               ; 26a1: 88          .   :2570[1]
    bpl loop_c256a                                                    ; 26a2: 10 f7       ..  :2571[1]
    lda l0078                                                         ; 26a4: a5 78       .x  :2573[1]
    sta l012d                                                         ; 26a6: 8d 2d 01    .-. :2575[1]
    lda l0079                                                         ; 26a9: a5 79       .y  :2578[1]
    sta l012e                                                         ; 26ab: 8d 2e 01    ... :257a[1]
    jsr sub_c2434                                                     ; 26ae: 20 34 24     4$ :257d[1]
    lda l09be,x                                                       ; 26b1: bd be 09    ... :2580[1]
    bpl c25a4                                                         ; 26b4: 10 1f       ..  :2583[1]
    lda l0070                                                         ; 26b6: a5 70       .p  :2585[1]
    sec                                                               ; 26b8: 38          8   :2587[1]
    sbc l0129                                                         ; 26b9: ed 29 01    .). :2588[1]
    lda l0071                                                         ; 26bc: a5 71       .q  :258b[1]
    sbc l012a                                                         ; 26be: ed 2a 01    .*. :258d[1]
    bpl c25c0                                                         ; 26c1: 10 2e       ..  :2590[1]
    lda l0070                                                         ; 26c3: a5 70       .p  :2592[1]
    sta l0129                                                         ; 26c5: 8d 29 01    .). :2594[1]
    lda l0071                                                         ; 26c8: a5 71       .q  :2597[1]
    sta l012a                                                         ; 26ca: 8d 2a 01    .*. :2599[1]
    lda l0078                                                         ; 26cd: a5 78       .x  :259c[1]
    sta l012d                                                         ; 26cf: 8d 2d 01    .-. :259e[1]
    jmp c25c0                                                         ; 26d2: 4c c0 25    L.% :25a1[1]

; $26d5 referenced 1 time by $2583
c25a4
    lda l012b                                                         ; 26d5: ad 2b 01    .+. :25a4[1]
    sec                                                               ; 26d8: 38          8   :25a7[1]
    sbc l0072                                                         ; 26d9: e5 72       .r  :25a8[1]
    lda l012c                                                         ; 26db: ad 2c 01    .,. :25aa[1]
    sbc l0073                                                         ; 26de: e5 73       .s  :25ad[1]
    bpl c25c0                                                         ; 26e0: 10 0f       ..  :25af[1]
    lda l0072                                                         ; 26e2: a5 72       .r  :25b1[1]
    sta l012b                                                         ; 26e4: 8d 2b 01    .+. :25b3[1]
    lda l0073                                                         ; 26e7: a5 73       .s  :25b6[1]
    sta l012c                                                         ; 26e9: 8d 2c 01    .,. :25b8[1]
    lda l0079                                                         ; 26ec: a5 79       .y  :25bb[1]
    sta l012e                                                         ; 26ee: 8d 2e 01    ... :25bd[1]
; $26f1 referenced 3 times by $2590, $25a1, $25af
c25c0
    ldy #3                                                            ; 26f1: a0 03       ..  :25c0[1]
; $26f3 referenced 1 time by $25c9
loop_c25c2
    lda l0129,y                                                       ; 26f3: b9 29 01    .). :25c2[1]
    sta l0070,y                                                       ; 26f6: 99 70 00    .p. :25c5[1]
    dey                                                               ; 26f9: 88          .   :25c8[1]
    bpl loop_c25c2                                                    ; 26fa: 10 f7       ..  :25c9[1]
    lda l012d                                                         ; 26fc: ad 2d 01    .-. :25cb[1]
    sta l0078                                                         ; 26ff: 85 78       .x  :25ce[1]
    lda l012e                                                         ; 2701: ad 2e 01    ... :25d0[1]
    sta l0079                                                         ; 2704: 85 79       .y  :25d3[1]
    dex                                                               ; 2706: ca          .   :25d5[1]
; $2707 referenced 3 times by $2558, $255c, $2565
c25d6
    lda #0                                                            ; 2707: a9 00       ..  :25d6[1]
    sta l24d0                                                         ; 2709: 8d d0 24    ..$ :25d8[1]
    sta l24d1                                                         ; 270c: 8d d1 24    ..$ :25db[1]
    rts                                                               ; 270f: 60          `   :25de[1]

; $2710 referenced 7 times by $2608, $2623, $2643, $2778, $289e, $28f5, $2908
sub_c25df
    lda l24d0                                                         ; 2710: ad d0 24    ..$ :25df[1]
    pha                                                               ; 2713: 48          H   :25e2[1]
    lda l24d1                                                         ; 2714: ad d1 24    ..$ :25e3[1]
    pha                                                               ; 2717: 48          H   :25e6[1]
    jsr sub_c2434                                                     ; 2718: 20 34 24     4$ :25e7[1]
    pla                                                               ; 271b: 68          h   :25ea[1]
    sta l24d1                                                         ; 271c: 8d d1 24    ..$ :25eb[1]
    pla                                                               ; 271f: 68          h   :25ee[1]
    sta l24d0                                                         ; 2720: 8d d0 24    ..$ :25ef[1]
    jmp c2552                                                         ; 2723: 4c 52 25    LR% :25f2[1]

; $2726 referenced 4 times by $2e79, $2e91, $30b2, $3343
sub_c25f5
    sta l0053                                                         ; 2726: 85 53       .S  :25f5[1]
    tax                                                               ; 2728: aa          .   :25f7[1]
    lda #0                                                            ; 2729: a9 00       ..  :25f8[1]
    sta l38d8,x                                                       ; 272b: 9d d8 38    ..8 :25fa[1]
    lda #$ff                                                          ; 272e: a9 ff       ..  :25fd[1]
    sta l0044                                                         ; 2730: 85 44       .D  :25ff[1]
    lda #1                                                            ; 2732: a9 01       ..  :2601[1]
    sta l2551                                                         ; 2734: 8d 51 25    .Q% :2603[1]
    ldx l0053                                                         ; 2737: a6 53       .S  :2606[1]
    jsr sub_c25df                                                     ; 2739: 20 df 25     .% :2608[1]
    lda l0053                                                         ; 273c: a5 53       .S  :260b[1]
    clc                                                               ; 273e: 18          .   :260d[1]
    adc #$0b                                                          ; 273f: 69 0b       i.  :260e[1]
    tax                                                               ; 2741: aa          .   :2610[1]
    jsr sub_c24d2                                                     ; 2742: 20 d2 24     .$ :2611[1]
    jsr sub_c265a                                                     ; 2745: 20 5a 26     Z& :2614[1]
    lda l007c                                                         ; 2748: a5 7c       .|  :2617[1]
    ora l007d                                                         ; 274a: 05 7d       .}  :2619[1]
    beq c2626                                                         ; 274c: f0 09       ..  :261b[1]
    lda l0053                                                         ; 274e: a5 53       .S  :261d[1]
    clc                                                               ; 2750: 18          .   :261f[1]
    adc #$0b                                                          ; 2751: 69 0b       i.  :2620[1]
    tax                                                               ; 2753: aa          .   :2622[1]
    jsr sub_c25df                                                     ; 2754: 20 df 25     .% :2623[1]
; $2757 referenced 1 time by $261b
c2626
    lda #1                                                            ; 2757: a9 01       ..  :2626[1]
    sta l2551                                                         ; 2759: 8d 51 25    .Q% :2628[1]
    ldx l0053                                                         ; 275c: a6 53       .S  :262b[1]
    jsr sub_c24d2                                                     ; 275e: 20 d2 24     .$ :262d[1]
    jsr sub_c26e5                                                     ; 2761: 20 e5 26     .& :2630[1]
    jsr sub_c271e                                                     ; 2764: 20 1e 27     .' :2633[1]
    lda l007c                                                         ; 2767: a5 7c       .|  :2636[1]
    ora l007d                                                         ; 2769: 05 7d       .}  :2638[1]
    beq c264f                                                         ; 276b: f0 13       ..  :263a[1]
    lda #1                                                            ; 276d: a9 01       ..  :263c[1]
    sta l2551                                                         ; 276f: 8d 51 25    .Q% :263e[1]
    ldx l0053                                                         ; 2772: a6 53       .S  :2641[1]
    jsr sub_c25df                                                     ; 2774: 20 df 25     .% :2643[1]
    jsr sub_c24d2                                                     ; 2777: 20 d2 24     .$ :2646[1]
    jsr sub_c265a                                                     ; 277a: 20 5a 26     Z& :2649[1]
    jsr sub_c2693                                                     ; 277d: 20 93 26     .& :264c[1]
; $2780 referenced 1 time by $263a
c264f
    lda l0053                                                         ; 2780: a5 53       .S  :264f[1]
    bne c2659                                                         ; 2782: d0 06       ..  :2651[1]
    jsr sub_c2eb8                                                     ; 2784: 20 b8 2e     .. :2653[1]
    jsr sub_c236b                                                     ; 2787: 20 6b 23     k# :2656[1]
; $278a referenced 1 time by $2651
c2659
    rts                                                               ; 278a: 60          `   :2659[1]

; $278b referenced 3 times by $2614, $2649, $28a9
sub_c265a
    lda #$ff                                                          ; 278b: a9 ff       ..  :265a[1]
    sta l007c                                                         ; 278d: 85 7c       .|  :265c[1]
    ldx l0078                                                         ; 278f: a6 78       .x  :265e[1]
    ldy l007b                                                         ; 2791: a4 7b       .{  :2660[1]
    tya                                                               ; 2793: 98          .   :2662[1]
    sec                                                               ; 2794: 38          8   :2663[1]
    sbc l007a                                                         ; 2795: e5 7a       .z  :2664[1]
    sta l0080                                                         ; 2797: 85 80       ..  :2666[1]
; $2799 referenced 1 time by $2672
loop_c2668
    jsr sub_c1efa                                                     ; 2799: 20 fa 1e     .. :2668[1]
    cmp #3                                                            ; 279c: c9 03       ..  :266b[1]
    beq c2676                                                         ; 279e: f0 07       ..  :266d[1]
    dey                                                               ; 27a0: 88          .   :266f[1]
    dec l0080                                                         ; 27a1: c6 80       ..  :2670[1]
    bpl loop_c2668                                                    ; 27a3: 10 f4       ..  :2672[1]
    inc l007c                                                         ; 27a5: e6 7c       .|  :2674[1]
; $27a7 referenced 1 time by $266d
c2676
    lda #$ff                                                          ; 27a7: a9 ff       ..  :2676[1]
    sta l007d                                                         ; 27a9: 85 7d       .}  :2678[1]
    ldx l0079                                                         ; 27ab: a6 79       .y  :267a[1]
    ldy l007b                                                         ; 27ad: a4 7b       .{  :267c[1]
    tya                                                               ; 27af: 98          .   :267e[1]
    sec                                                               ; 27b0: 38          8   :267f[1]
    sbc l007a                                                         ; 27b1: e5 7a       .z  :2680[1]
    sta l0080                                                         ; 27b3: 85 80       ..  :2682[1]
; $27b5 referenced 1 time by $268e
loop_c2684
    jsr sub_c1efa                                                     ; 27b5: 20 fa 1e     .. :2684[1]
    cmp #3                                                            ; 27b8: c9 03       ..  :2687[1]
    beq c2692                                                         ; 27ba: f0 07       ..  :2689[1]
    dey                                                               ; 27bc: 88          .   :268b[1]
    dec l0080                                                         ; 27bd: c6 80       ..  :268c[1]
    bpl loop_c2684                                                    ; 27bf: 10 f4       ..  :268e[1]
    inc l007d                                                         ; 27c1: e6 7d       .}  :2690[1]
; $27c3 referenced 1 time by $2689
c2692
    rts                                                               ; 27c3: 60          `   :2692[1]

; $27c4 referenced 1 time by $264c
sub_c2693
    ldx l0053                                                         ; 27c4: a6 53       .S  :2693[1]
    lda l007c                                                         ; 27c6: a5 7c       .|  :2695[1]
    cmp l007d                                                         ; 27c8: c5 7d       .}  :2697[1]
    beq c26e4                                                         ; 27ca: f0 49       .I  :2699[1]
    bcc c26c2                                                         ; 27cc: 90 25       .%  :269b[1]
    lda l0070                                                         ; 27ce: a5 70       .p  :269d[1]
    and #7                                                            ; 27d0: 29 07       ).  :269f[1]
    sta l0080                                                         ; 27d2: 85 80       ..  :26a1[1]
    lda #8                                                            ; 27d4: a9 08       ..  :26a3[1]
    sec                                                               ; 27d6: 38          8   :26a5[1]
    sbc l0080                                                         ; 27d7: e5 80       ..  :26a6[1]
    clc                                                               ; 27d9: 18          .   :26a8[1]
    adc l0950,x                                                       ; 27da: 7d 50 09    }P. :26a9[1]
    sta l0950,x                                                       ; 27dd: 9d 50 09    .P. :26ac[1]
    lda #0                                                            ; 27e0: a9 00       ..  :26af[1]
    adc l0966,x                                                       ; 27e2: 7d 66 09    }f. :26b1[1]
    sta l0966,x                                                       ; 27e5: 9d 66 09    .f. :26b4[1]
    lda l38d8,x                                                       ; 27e8: bd d8 38    ..8 :26b7[1]
    ora #1                                                            ; 27eb: 09 01       ..  :26ba[1]
    sta l38d8,x                                                       ; 27ed: 9d d8 38    ..8 :26bc[1]
    jmp c26e4                                                         ; 27f0: 4c e4 26    L.& :26bf[1]

; $27f3 referenced 1 time by $269b
c26c2
    lda l0072                                                         ; 27f3: a5 72       .r  :26c2[1]
    and #7                                                            ; 27f5: 29 07       ).  :26c4[1]
    clc                                                               ; 27f7: 18          .   :26c6[1]
    adc #1                                                            ; 27f8: 69 01       i.  :26c7[1]
    sta l0080                                                         ; 27fa: 85 80       ..  :26c9[1]
    lda l0950,x                                                       ; 27fc: bd 50 09    .P. :26cb[1]
    sec                                                               ; 27ff: 38          8   :26ce[1]
    sbc l0080                                                         ; 2800: e5 80       ..  :26cf[1]
    sta l0950,x                                                       ; 2802: 9d 50 09    .P. :26d1[1]
    lda l0966,x                                                       ; 2805: bd 66 09    .f. :26d4[1]
    sbc #0                                                            ; 2808: e9 00       ..  :26d7[1]
    sta l0966,x                                                       ; 280a: 9d 66 09    .f. :26d9[1]
    lda l38d8,x                                                       ; 280d: bd d8 38    ..8 :26dc[1]
    ora #4                                                            ; 2810: 09 04       ..  :26df[1]
    sta l38d8,x                                                       ; 2812: 9d d8 38    ..8 :26e1[1]
; $2815 referenced 2 times by $2699, $26bf
c26e4
    rts                                                               ; 2815: 60          `   :26e4[1]

; $2816 referenced 3 times by $2630, $2787, $28ac
sub_c26e5
    lda #$ff                                                          ; 2816: a9 ff       ..  :26e5[1]
    sta l007e                                                         ; 2818: 85 7e       .~  :26e7[1]
    ldy l007a                                                         ; 281a: a4 7a       .z  :26e9[1]
    ldx l0079                                                         ; 281c: a6 79       .y  :26eb[1]
    txa                                                               ; 281e: 8a          .   :26ed[1]
    sec                                                               ; 281f: 38          8   :26ee[1]
    sbc l0078                                                         ; 2820: e5 78       .x  :26ef[1]
    sta l0080                                                         ; 2822: 85 80       ..  :26f1[1]
; $2824 referenced 1 time by $26fd
loop_c26f3
    jsr sub_c1efa                                                     ; 2824: 20 fa 1e     .. :26f3[1]
    cmp #3                                                            ; 2827: c9 03       ..  :26f6[1]
    beq c2701                                                         ; 2829: f0 07       ..  :26f8[1]
    dex                                                               ; 282b: ca          .   :26fa[1]
    dec l0080                                                         ; 282c: c6 80       ..  :26fb[1]
    bpl loop_c26f3                                                    ; 282e: 10 f4       ..  :26fd[1]
    inc l007e                                                         ; 2830: e6 7e       .~  :26ff[1]
; $2832 referenced 1 time by $26f8
c2701
    lda #$ff                                                          ; 2832: a9 ff       ..  :2701[1]
    sta l007f                                                         ; 2834: 85 7f       ..  :2703[1]
    ldy l007b                                                         ; 2836: a4 7b       .{  :2705[1]
    ldx l0079                                                         ; 2838: a6 79       .y  :2707[1]
    txa                                                               ; 283a: 8a          .   :2709[1]
    sec                                                               ; 283b: 38          8   :270a[1]
    sbc l0078                                                         ; 283c: e5 78       .x  :270b[1]
    sta l0080                                                         ; 283e: 85 80       ..  :270d[1]
; $2840 referenced 1 time by $2719
loop_c270f
    jsr sub_c1efa                                                     ; 2840: 20 fa 1e     .. :270f[1]
    cmp #3                                                            ; 2843: c9 03       ..  :2712[1]
    beq c271d                                                         ; 2845: f0 07       ..  :2714[1]
    dex                                                               ; 2847: ca          .   :2716[1]
    dec l0080                                                         ; 2848: c6 80       ..  :2717[1]
    bpl loop_c270f                                                    ; 284a: 10 f4       ..  :2719[1]
    inc l007f                                                         ; 284c: e6 7f       ..  :271b[1]
; $284e referenced 1 time by $2714
c271d
    rts                                                               ; 284e: 60          `   :271d[1]

; $284f referenced 1 time by $2633
sub_c271e
    ldx l0053                                                         ; 284f: a6 53       .S  :271e[1]
    lda l007e                                                         ; 2851: a5 7e       .~  :2720[1]
    cmp l007f                                                         ; 2853: c5 7f       ..  :2722[1]
    beq c276f                                                         ; 2855: f0 49       .I  :2724[1]
    bcc c274d                                                         ; 2857: 90 25       .%  :2726[1]
    lda l0074                                                         ; 2859: a5 74       .t  :2728[1]
    and #7                                                            ; 285b: 29 07       ).  :272a[1]
    sta l0080                                                         ; 285d: 85 80       ..  :272c[1]
    lda #8                                                            ; 285f: a9 08       ..  :272e[1]
    sec                                                               ; 2861: 38          8   :2730[1]
    sbc l0080                                                         ; 2862: e5 80       ..  :2731[1]
    clc                                                               ; 2864: 18          .   :2733[1]
    adc l097c,x                                                       ; 2865: 7d 7c 09    }|. :2734[1]
    sta l097c,x                                                       ; 2868: 9d 7c 09    .|. :2737[1]
    lda #0                                                            ; 286b: a9 00       ..  :273a[1]
    adc l0992,x                                                       ; 286d: 7d 92 09    }.. :273c[1]
    sta l0992,x                                                       ; 2870: 9d 92 09    ... :273f[1]
    lda l38d8,x                                                       ; 2873: bd d8 38    ..8 :2742[1]
    ora #8                                                            ; 2876: 09 08       ..  :2745[1]
    sta l38d8,x                                                       ; 2878: 9d d8 38    ..8 :2747[1]
    jmp c276f                                                         ; 287b: 4c 6f 27    Lo' :274a[1]

; $287e referenced 1 time by $2726
c274d
    lda l0076                                                         ; 287e: a5 76       .v  :274d[1]
    and #7                                                            ; 2880: 29 07       ).  :274f[1]
    clc                                                               ; 2882: 18          .   :2751[1]
    adc #1                                                            ; 2883: 69 01       i.  :2752[1]
    sta l0080                                                         ; 2885: 85 80       ..  :2754[1]
    lda l097c,x                                                       ; 2887: bd 7c 09    .|. :2756[1]
    sec                                                               ; 288a: 38          8   :2759[1]
    sbc l0080                                                         ; 288b: e5 80       ..  :275a[1]
    sta l097c,x                                                       ; 288d: 9d 7c 09    .|. :275c[1]
    lda l0992,x                                                       ; 2890: bd 92 09    ... :275f[1]
    sbc #0                                                            ; 2893: e9 00       ..  :2762[1]
    sta l0992,x                                                       ; 2895: 9d 92 09    ... :2764[1]
    lda l38d8,x                                                       ; 2898: bd d8 38    ..8 :2767[1]
    ora #2                                                            ; 289b: 09 02       ..  :276a[1]
    sta l38d8,x                                                       ; 289d: 9d d8 38    ..8 :276c[1]
; $28a0 referenced 2 times by $2724, $274a
c276f
    rts                                                               ; 28a0: 60          `   :276f[1]

; $28a1 referenced 1 time by $23ca
sub_c2770
    sta l0053                                                         ; 28a1: 85 53       .S  :2770[1]
    txa                                                               ; 28a3: 8a          .   :2772[1]
    pha                                                               ; 28a4: 48          H   :2773[1]
    tya                                                               ; 28a5: 98          .   :2774[1]
    pha                                                               ; 28a6: 48          H   :2775[1]
    ldx l0053                                                         ; 28a7: a6 53       .S  :2776[1]
    jsr sub_c25df                                                     ; 28a9: 20 df 25     .% :2778[1]
    lda #2                                                            ; 28ac: a9 02       ..  :277b[1]
    sta l2551                                                         ; 28ae: 8d 51 25    .Q% :277d[1]
    jsr sub_c24d2                                                     ; 28b1: 20 d2 24     .$ :2780[1]
    lda #$ff                                                          ; 28b4: a9 ff       ..  :2783[1]
    sta l0044                                                         ; 28b6: 85 44       .D  :2785[1]
    jsr sub_c26e5                                                     ; 28b8: 20 e5 26     .& :2787[1]
    lda #0                                                            ; 28bb: a9 00       ..  :278a[1]
    sta l2890                                                         ; 28bd: 8d 90 28    ..( :278c[1]
    sta l2891                                                         ; 28c0: 8d 91 28    ..( :278f[1]
    lda l007f                                                         ; 28c3: a5 7f       ..  :2792[1]
    sta l288f                                                         ; 28c5: 8d 8f 28    ..( :2794[1]
    bne c279c                                                         ; 28c8: d0 03       ..  :2797[1]
    jmp c2851                                                         ; 28ca: 4c 51 28    LQ( :2799[1]

; $28cd referenced 1 time by $2797
c279c
    lda l0078                                                         ; 28cd: a5 78       .x  :279c[1]
    sta l0121                                                         ; 28cf: 8d 21 01    .!. :279e[1]
    lda l0079                                                         ; 28d2: a5 79       .y  :27a1[1]
    sta l0122                                                         ; 28d4: 8d 22 01    .". :27a3[1]
    ldx l0053                                                         ; 28d7: a6 53       .S  :27a6[1]
    jsr sub_c2434                                                     ; 28d9: 20 34 24     4$ :27a8[1]
    lda l0072                                                         ; 28dc: a5 72       .r  :27ab[1]
    clc                                                               ; 28de: 18          .   :27ad[1]
    adc #1                                                            ; 28df: 69 01       i.  :27ae[1]
    sta l0072                                                         ; 28e1: 85 72       .r  :27b0[1]
    lda l0073                                                         ; 28e3: a5 73       .s  :27b2[1]
    adc #0                                                            ; 28e5: 69 00       i.  :27b4[1]
    sta l0073                                                         ; 28e7: 85 73       .s  :27b6[1]
    lda l0070                                                         ; 28e9: a5 70       .p  :27b8[1]
    clc                                                               ; 28eb: 18          .   :27ba[1]
    adc l0072                                                         ; 28ec: 65 72       er  :27bb[1]
    sta l2892                                                         ; 28ee: 8d 92 28    ..( :27bd[1]
    lda l0071                                                         ; 28f1: a5 71       .q  :27c0[1]
    adc l0073                                                         ; 28f3: 65 73       es  :27c2[1]
    sta l2893                                                         ; 28f5: 8d 93 28    ..( :27c4[1]
    lda l0121                                                         ; 28f8: ad 21 01    .!. :27c7[1]
    sta l0078                                                         ; 28fb: 85 78       .x  :27ca[1]
    lda l0122                                                         ; 28fd: ad 22 01    .". :27cc[1]
    sta l0079                                                         ; 2900: 85 79       .y  :27cf[1]
    ldy l007b                                                         ; 2902: a4 7b       .{  :27d1[1]
    asl l0070                                                         ; 2904: 06 70       .p  :27d3[1]
    rol l0071                                                         ; 2906: 26 71       &q  :27d5[1]
    lda l2892                                                         ; 2908: ad 92 28    ..( :27d7[1]
    clc                                                               ; 290b: 18          .   :27da[1]
    adc l0070                                                         ; 290c: 65 70       ep  :27db[1]
    sta l007a                                                         ; 290e: 85 7a       .z  :27dd[1]
    lda l2893                                                         ; 2910: ad 93 28    ..( :27df[1]
    adc l0071                                                         ; 2913: 65 71       eq  :27e2[1]
    lsr                                                               ; 2915: 4a          J   :27e4[1]
    ror l007a                                                         ; 2916: 66 7a       fz  :27e5[1]
    lsr                                                               ; 2918: 4a          J   :27e7[1]
    ror l007a                                                         ; 2919: 66 7a       fz  :27e8[1]
    tax                                                               ; 291b: aa          .   :27ea[1]
    lda l007a                                                         ; 291c: a5 7a       .z  :27eb[1]
    sbc #0                                                            ; 291e: e9 00       ..  :27ed[1]
    sta l007a                                                         ; 2920: 85 7a       .z  :27ef[1]
    txa                                                               ; 2922: 8a          .   :27f1[1]
    sbc #0                                                            ; 2923: e9 00       ..  :27f2[1]
    jsr sub_c2859                                                     ; 2925: 20 59 28     Y( :27f4[1]
    bne c27fe                                                         ; 2928: d0 05       ..  :27f7[1]
    dec l2890                                                         ; 292a: ce 90 28    ..( :27f9[1]
    bne c281d                                                         ; 292d: d0 1f       ..  :27fc[1]
; $292f referenced 1 time by $27f7
c27fe
    asl l0072                                                         ; 292f: 06 72       .r  :27fe[1]
    rol l0073                                                         ; 2931: 26 73       &s  :2800[1]
    lda l2892                                                         ; 2933: ad 92 28    ..( :2802[1]
    clc                                                               ; 2936: 18          .   :2805[1]
    adc l0072                                                         ; 2937: 65 72       er  :2806[1]
    sta l007a                                                         ; 2939: 85 7a       .z  :2808[1]
    lda l2893                                                         ; 293b: ad 93 28    ..( :280a[1]
    adc l0073                                                         ; 293e: 65 73       es  :280d[1]
    lsr                                                               ; 2940: 4a          J   :280f[1]
    ror l007a                                                         ; 2941: 66 7a       fz  :2810[1]
    lsr                                                               ; 2943: 4a          J   :2812[1]
    ror l007a                                                         ; 2944: 66 7a       fz  :2813[1]
    jsr sub_c286d                                                     ; 2946: 20 6d 28     m( :2815[1]
    bne c2851                                                         ; 2949: d0 37       .7  :2818[1]
    inc l2890                                                         ; 294b: ee 90 28    ..( :281a[1]
; $294e referenced 1 time by $27fc
c281d
    lda l0053                                                         ; 294e: a5 53       .S  :281d[1]
    beq c2825                                                         ; 2950: f0 04       ..  :281f[1]
    cmp #$0b                                                          ; 2952: c9 0b       ..  :2821[1]
    bne c2851                                                         ; 2954: d0 2c       .,  :2823[1]
; $2956 referenced 1 time by $281f
c2825
    lsr l2893                                                         ; 2956: 4e 93 28    N.( :2825[1]
    ror l2892                                                         ; 2959: 6e 92 28    n.( :2828[1]
    lda l2892                                                         ; 295c: ad 92 28    ..( :282b[1]
    sbc #0                                                            ; 295f: e9 00       ..  :282e[1]
    sta l007a                                                         ; 2961: 85 7a       .z  :2830[1]
    lda l2893                                                         ; 2963: ad 93 28    ..( :2832[1]
    sbc #0                                                            ; 2966: e9 00       ..  :2835[1]
    jsr sub_c2859                                                     ; 2968: 20 59 28     Y( :2837[1]
    bne c2841                                                         ; 296b: d0 05       ..  :283a[1]
    dec l2891                                                         ; 296d: ce 91 28    ..( :283c[1]
    bne c2851                                                         ; 2970: d0 10       ..  :283f[1]
; $2972 referenced 1 time by $283a
c2841
    lda l2892                                                         ; 2972: ad 92 28    ..( :2841[1]
    sta l007a                                                         ; 2975: 85 7a       .z  :2844[1]
    lda l2893                                                         ; 2977: ad 93 28    ..( :2846[1]
    jsr sub_c286d                                                     ; 297a: 20 6d 28     m( :2849[1]
    bne c2851                                                         ; 297d: d0 03       ..  :284c[1]
    inc l2891                                                         ; 297f: ee 91 28    ..( :284e[1]
; $2982 referenced 5 times by $2799, $2818, $2823, $283f, $284c
c2851
    pla                                                               ; 2982: 68          h   :2851[1]
    tay                                                               ; 2983: a8          .   :2852[1]
    pla                                                               ; 2984: 68          h   :2853[1]
    tax                                                               ; 2985: aa          .   :2854[1]
    lda l288f                                                         ; 2986: ad 8f 28    ..( :2855[1]
    rts                                                               ; 2989: 60          `   :2858[1]

; $298a referenced 2 times by $27f4, $2837
sub_c2859
    lsr                                                               ; 298a: 4a          J   :2859[1]
    ror l007a                                                         ; 298b: 66 7a       fz  :285a[1]
    lsr                                                               ; 298d: 4a          J   :285c[1]
    ror l007a                                                         ; 298e: 66 7a       fz  :285d[1]
    lsr                                                               ; 2990: 4a          J   :285f[1]
    ror l007a                                                         ; 2991: 66 7a       fz  :2860[1]
    ldx l007a                                                         ; 2993: a6 7a       .z  :2862[1]
    txa                                                               ; 2995: 8a          .   :2864[1]
    sec                                                               ; 2996: 38          8   :2865[1]
    sbc l0078                                                         ; 2997: e5 78       .x  :2866[1]
    sta l0080                                                         ; 2999: 85 80       ..  :2868[1]
    jmp c287e                                                         ; 299b: 4c 7e 28    L~( :286a[1]

; $299e referenced 2 times by $2815, $2849
sub_c286d
    lsr                                                               ; 299e: 4a          J   :286d[1]
    ror l007a                                                         ; 299f: 66 7a       fz  :286e[1]
    lsr                                                               ; 29a1: 4a          J   :2870[1]
    ror l007a                                                         ; 29a2: 66 7a       fz  :2871[1]
    lsr                                                               ; 29a4: 4a          J   :2873[1]
    ror l007a                                                         ; 29a5: 66 7a       fz  :2874[1]
    ldx l0079                                                         ; 29a7: a6 79       .y  :2876[1]
    txa                                                               ; 29a9: 8a          .   :2878[1]
    sec                                                               ; 29aa: 38          8   :2879[1]
    sbc l007a                                                         ; 29ab: e5 7a       .z  :287a[1]
    sta l0080                                                         ; 29ad: 85 80       ..  :287c[1]
; $29af referenced 2 times by $286a, $2888
c287e
    jsr sub_c1efa                                                     ; 29af: 20 fa 1e     .. :287e[1]
    cmp #3                                                            ; 29b2: c9 03       ..  :2881[1]
    beq c288c                                                         ; 29b4: f0 07       ..  :2883[1]
    dex                                                               ; 29b6: ca          .   :2885[1]
    dec l0080                                                         ; 29b7: c6 80       ..  :2886[1]
    bpl c287e                                                         ; 29b9: 10 f4       ..  :2888[1]
    lda #0                                                            ; 29bb: a9 00       ..  :288a[1]
; $29bd referenced 1 time by $2883
c288c
    ora #0                                                            ; 29bd: 09 00       ..  :288c[1]
    rts                                                               ; 29bf: 60          `   :288e[1]

; $29c0 referenced 8 times by $23fa, $2421, $2794, $2855, $2dca, $302a, $3258, $32ac
l288f
    !byte 0                                                           ; 29c0: 00          .   :288f[1]
; $29c1 referenced 6 times by $278c, $27f9, $281a, $2e4c, $3092, $331e
l2890
    !byte 0                                                           ; 29c1: 00          .   :2890[1]
; $29c2 referenced 3 times by $278f, $283c, $284e
l2891
    !byte 0                                                           ; 29c2: 00          .   :2891[1]
; $29c3 referenced 6 times by $27bd, $27d7, $2802, $2828, $282b, $2841
l2892
    !byte 0                                                           ; 29c3: 00          .   :2892[1]
; $29c4 referenced 6 times by $27c4, $27df, $280a, $2825, $2832, $2846
l2893
    !byte 0                                                           ; 29c4: 00          .   :2893[1]

; $29c5 referenced 9 times by $237a, $23a0, $23ee, $2db7, $2ff8, $301a, $3233, $3282, $3299
sub_c2894
    sta l295b                                                         ; 29c5: 8d 5b 29    .[) :2894[1]
    txa                                                               ; 29c8: 8a          .   :2897[1]
    pha                                                               ; 29c9: 48          H   :2898[1]
    tya                                                               ; 29ca: 98          .   :2899[1]
    pha                                                               ; 29cb: 48          H   :289a[1]
    ldx l295b                                                         ; 29cc: ae 5b 29    .[) :289b[1]
    jsr sub_c25df                                                     ; 29cf: 20 df 25     .% :289e[1]
    jsr sub_c24d2                                                     ; 29d2: 20 d2 24     .$ :28a1[1]
    lda l28e1                                                         ; 29d5: ad e1 28    ..( :28a4[1]
    sta l0044                                                         ; 29d8: 85 44       .D  :28a7[1]
    jsr sub_c265a                                                     ; 29da: 20 5a 26     Z& :28a9[1]
    jsr sub_c26e5                                                     ; 29dd: 20 e5 26     .& :28ac[1]
    lda l007c                                                         ; 29e0: a5 7c       .|  :28af[1]
    and #1                                                            ; 29e2: 29 01       ).  :28b1[1]
    sta l295b                                                         ; 29e4: 8d 5b 29    .[) :28b3[1]
    lda l007d                                                         ; 29e7: a5 7d       .}  :28b6[1]
    and #4                                                            ; 29e9: 29 04       ).  :28b8[1]
    ora l295b                                                         ; 29eb: 0d 5b 29    .[) :28ba[1]
    sta l295b                                                         ; 29ee: 8d 5b 29    .[) :28bd[1]
    lda l007e                                                         ; 29f1: a5 7e       .~  :28c0[1]
    and #8                                                            ; 29f3: 29 08       ).  :28c2[1]
    ora l295b                                                         ; 29f5: 0d 5b 29    .[) :28c4[1]
    sta l295b                                                         ; 29f8: 8d 5b 29    .[) :28c7[1]
    lda l007f                                                         ; 29fb: a5 7f       ..  :28ca[1]
    and #2                                                            ; 29fd: 29 02       ).  :28cc[1]
    ora l295b                                                         ; 29ff: 0d 5b 29    .[) :28ce[1]
    sta l295b                                                         ; 2a02: 8d 5b 29    .[) :28d1[1]
    lda #0                                                            ; 2a05: a9 00       ..  :28d4[1]
    sta l28e1                                                         ; 2a07: 8d e1 28    ..( :28d6[1]
    pla                                                               ; 2a0a: 68          h   :28d9[1]
    tay                                                               ; 2a0b: a8          .   :28da[1]
    pla                                                               ; 2a0c: 68          h   :28db[1]
    tax                                                               ; 2a0d: aa          .   :28dc[1]
    lda l295b                                                         ; 2a0e: ad 5b 29    .[) :28dd[1]
    rts                                                               ; 2a11: 60          `   :28e0[1]

; $2a12 referenced 2 times by $28a4, $28d6
l28e1
    !byte 0                                                           ; 2a12: 00          .   :28e1[1]

; $2a13 referenced 3 times by $1a41, $206a, $2074
sub_c28e2
    txa                                                               ; 2a13: 8a          .   :28e2[1]
    pha                                                               ; 2a14: 48          H   :28e3[1]
    tya                                                               ; 2a15: 98          .   :28e4[1]
    pha                                                               ; 2a16: 48          H   :28e5[1]
    lda #0                                                            ; 2a17: a9 00       ..  :28e6[1]
    sta l295b                                                         ; 2a19: 8d 5b 29    .[) :28e8[1]
    lda l09a8,x                                                       ; 2a1c: bd a8 09    ... :28eb[1]
    beq c2945                                                         ; 2a1f: f0 55       .U  :28ee[1]
    lda l09a8,y                                                       ; 2a21: b9 a8 09    ... :28f0[1]
    beq c2945                                                         ; 2a24: f0 50       .P  :28f3[1]
    jsr sub_c25df                                                     ; 2a26: 20 df 25     .% :28f5[1]
    jsr sub_c24d2                                                     ; 2a29: 20 d2 24     .$ :28f8[1]
    ldx #7                                                            ; 2a2c: a2 07       ..  :28fb[1]
; $2a2e referenced 1 time by $2903
loop_c28fd
    lda l0070,x                                                       ; 2a2e: b5 70       .p  :28fd[1]
    sta l0121,x                                                       ; 2a30: 9d 21 01    .!. :28ff[1]
    dex                                                               ; 2a33: ca          .   :2902[1]
    bpl loop_c28fd                                                    ; 2a34: 10 f8       ..  :2903[1]
    pla                                                               ; 2a36: 68          h   :2905[1]
    pha                                                               ; 2a37: 48          H   :2906[1]
    tax                                                               ; 2a38: aa          .   :2907[1]
    jsr sub_c25df                                                     ; 2a39: 20 df 25     .% :2908[1]
    jsr sub_c24d2                                                     ; 2a3c: 20 d2 24     .$ :290b[1]
    lda l0123                                                         ; 2a3f: ad 23 01    .#. :290e[1]
    sec                                                               ; 2a42: 38          8   :2911[1]
    sbc l0070                                                         ; 2a43: e5 70       .p  :2912[1]
    lda l0124                                                         ; 2a45: ad 24 01    .$. :2914[1]
    sbc l0071                                                         ; 2a48: e5 71       .q  :2917[1]
    bmi c2945                                                         ; 2a4a: 30 2a       0*  :2919[1]
    lda l0072                                                         ; 2a4c: a5 72       .r  :291b[1]
    sec                                                               ; 2a4e: 38          8   :291d[1]
    sbc l0121                                                         ; 2a4f: ed 21 01    .!. :291e[1]
    lda l0073                                                         ; 2a52: a5 73       .s  :2921[1]
    sbc l0122                                                         ; 2a54: ed 22 01    .". :2923[1]
    bmi c2945                                                         ; 2a57: 30 1d       0.  :2926[1]
    lda l0127                                                         ; 2a59: ad 27 01    .'. :2928[1]
    sec                                                               ; 2a5c: 38          8   :292b[1]
    sbc l0074                                                         ; 2a5d: e5 74       .t  :292c[1]
    lda l0128                                                         ; 2a5f: ad 28 01    .(. :292e[1]
    sbc l0075                                                         ; 2a62: e5 75       .u  :2931[1]
    bmi c2945                                                         ; 2a64: 30 10       0.  :2933[1]
    lda l0076                                                         ; 2a66: a5 76       .v  :2935[1]
    sec                                                               ; 2a68: 38          8   :2937[1]
    sbc l0125                                                         ; 2a69: ed 25 01    .%. :2938[1]
    lda l0077                                                         ; 2a6c: a5 77       .w  :293b[1]
    sbc l0126                                                         ; 2a6e: ed 26 01    .&. :293d[1]
    bmi c2945                                                         ; 2a71: 30 03       0.  :2940[1]
    dec l295b                                                         ; 2a73: ce 5b 29    .[) :2942[1]
; $2a76 referenced 6 times by $28ee, $28f3, $2919, $2926, $2933, $2940
c2945
    lda #0                                                            ; 2a76: a9 00       ..  :2945[1]
    sta l2550                                                         ; 2a78: 8d 50 25    .P% :2947[1]
    sta l2551                                                         ; 2a7b: 8d 51 25    .Q% :294a[1]
    sta l24d1                                                         ; 2a7e: 8d d1 24    ..$ :294d[1]
    sta l24d0                                                         ; 2a81: 8d d0 24    ..$ :2950[1]
    pla                                                               ; 2a84: 68          h   :2953[1]
    tay                                                               ; 2a85: a8          .   :2954[1]
    pla                                                               ; 2a86: 68          h   :2955[1]
    tax                                                               ; 2a87: aa          .   :2956[1]
    lda l295b                                                         ; 2a88: ad 5b 29    .[) :2957[1]
    rts                                                               ; 2a8b: 60          `   :295a[1]

; $2a8c referenced 14 times by $2894, $289b, $28b3, $28ba, $28bd, $28c4, $28c7, $28ce, $28d1, $28dd, $28e8, $2942, $2957, $2ba4
l295b
    !byte 0                                                           ; 2a8c: 00          .   :295b[1]
; $2a8d referenced 20 times by $2988, $29aa, $29cb, $2ae2, $2b52, $2b7b, $2b90, $2b9f, $2ba7, $2bb5, $2bc6, $2bd8, $2be9, $2bfa, $2c04, $2c23, $2c75, $2c81, $344d, $3666
l295c
    !byte 3                                                           ; 2a8d: 03          .   :295c[1]
; $2a8e referenced 1 time by $2bf7
l295d
    !byte 2, 8, 7, 0, 5, 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0              ; 2a8e: 02 08 07... ... :295d[1]
; $2a9e referenced 8 times by $2342, $2998, $2a83, $2a8a, $2acf, $2add, $2b39, $2b8d
l296d
    !byte 5                                                           ; 2a9e: 05          .   :296d[1]
; $2a9f referenced 8 times by $2982, $2b3e, $2b67, $2b98, $2bab, $2bb0, $2bc3, $2be6
l296e
    !byte 9                                                           ; 2a9f: 09          .   :296e[1]
; $2aa0 referenced 2 times by $29ad, $2c26
l296f
    !byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0           ; 2aa0: 00 00 00... ... :296f[1]

; $2ab1 referenced 2 times by $1200, $3f35
sub_c2980
    ldx #9                                                            ; 2ab1: a2 09       ..  :2980[1]
    stx l296e                                                         ; 2ab3: 8e 6e 29    .n) :2982[1]
    dex                                                               ; 2ab6: ca          .   :2985[1]
    lda #0                                                            ; 2ab7: a9 00       ..  :2986[1]
; $2ab9 referenced 1 time by $298e
loop_c2988
    sta l295c,x                                                       ; 2ab9: 9d 5c 29    .\) :2988[1]
    inx                                                               ; 2abc: e8          .   :298b[1]
    cpx #$11                                                          ; 2abd: e0 11       ..  :298c[1]
    bcc loop_c2988                                                    ; 2abf: 90 f8       ..  :298e[1]
    ldx #3                                                            ; 2ac1: a2 03       ..  :2990[1]
; $2ac3 referenced 1 time by $2996
loop_c2992
    sta l2ee9,x                                                       ; 2ac3: 9d e9 2e    ... :2992[1]
    dex                                                               ; 2ac6: ca          .   :2995[1]
    bpl loop_c2992                                                    ; 2ac7: 10 fa       ..  :2996[1]
    lda l296d                                                         ; 2ac9: ad 6d 29    .m) :2998[1]
    clc                                                               ; 2acc: 18          .   :299b[1]
    adc #2                                                            ; 2acd: 69 02       i.  :299c[1]
    sta l0029                                                         ; 2acf: 85 29       .)  :299e[1]
    rts                                                               ; 2ad1: 60          `   :29a0[1]

; $2ad2 referenced 3 times by $1203, $123f, $2a41
sub_c29a1
    jsr sub_c29a8                                                     ; 2ad2: 20 a8 29     .) :29a1[1]
    jsr sub_c29de                                                     ; 2ad5: 20 de 29     .) :29a4[1]
    rts                                                               ; 2ad8: 60          `   :29a7[1]

; $2ad9 referenced 2 times by $29a1, $3f38
sub_c29a8
    ldx #0                                                            ; 2ad9: a2 00       ..  :29a8[1]
; $2adb referenced 1 time by $29da
c29aa
    lda l295c,x                                                       ; 2adb: bd 5c 29    .\) :29aa[1]
    cmp l296f,x                                                       ; 2ade: dd 6f 29    .o) :29ad[1]
    beq c29d7                                                         ; 2ae1: f0 25       .%  :29b0[1]
    lda #0                                                            ; 2ae3: a9 00       ..  :29b2[1]
    sta l29dd                                                         ; 2ae5: 8d dd 29    ..) :29b4[1]
    cpx l002e                                                         ; 2ae8: e4 2e       ..  :29b7[1]
    bne c29c1                                                         ; 2aea: d0 06       ..  :29b9[1]
    dec l29dd                                                         ; 2aec: ce dd 29    ..) :29bb[1]
    jsr sub_c29eb                                                     ; 2aef: 20 eb 29     .) :29be[1]
; $2af2 referenced 1 time by $29b9
c29c1
    jsr sub_c2c0c                                                     ; 2af2: 20 0c 2c     ., :29c1[1]
    lda l29dd                                                         ; 2af5: ad dd 29    ..) :29c4[1]
    beq c29d7                                                         ; 2af8: f0 0e       ..  :29c7[1]
; $2afa referenced 1 time by $29d2
loop_c29c9
    ldy l0029                                                         ; 2afa: a4 29       .)  :29c9[1]
    lda l295c,y                                                       ; 2afc: b9 5c 29    .\) :29cb[1]
    bne c29d4                                                         ; 2aff: d0 04       ..  :29ce[1]
    dec l0029                                                         ; 2b01: c6 29       .)  :29d0[1]
    bne loop_c29c9                                                    ; 2b03: d0 f5       ..  :29d2[1]
; $2b05 referenced 1 time by $29ce
c29d4
    jsr sub_c2a17                                                     ; 2b05: 20 17 2a     .* :29d4[1]
; $2b08 referenced 2 times by $29b0, $29c7
c29d7
    inx                                                               ; 2b08: e8          .   :29d7[1]
    cpx #$11                                                          ; 2b09: e0 11       ..  :29d8[1]
    bcc c29aa                                                         ; 2b0b: 90 ce       ..  :29da[1]
    rts                                                               ; 2b0d: 60          `   :29dc[1]

; $2b0e referenced 3 times by $29b4, $29bb, $29c4
l29dd
    !byte 0                                                           ; 2b0e: 00          .   :29dd[1]

; $2b0f referenced 2 times by $29a4, $2c88
sub_c29de
    lda l0029                                                         ; 2b0f: a5 29       .)  :29de[1]
    cmp l002e                                                         ; 2b11: c5 2e       ..  :29e0[1]
    beq c29ea                                                         ; 2b13: f0 06       ..  :29e2[1]
    jsr sub_c29eb                                                     ; 2b15: 20 eb 29     .) :29e4[1]
    jsr sub_c2a17                                                     ; 2b18: 20 17 2a     .* :29e7[1]
; $2b1b referenced 1 time by $29e2
c29ea
    rts                                                               ; 2b1b: 60          `   :29ea[1]

; $2b1c referenced 2 times by $29be, $29e4
sub_c29eb
    ldx l002e                                                         ; 2b1c: a6 2e       ..  :29eb[1]
    bmi c2a12                                                         ; 2b1e: 30 23       0#  :29ed[1]
    lda l004c                                                         ; 2b20: a5 4c       .L  :29ef[1]
    pha                                                               ; 2b22: 48          H   :29f1[1]
    lda #$58 ; 'X'                                                    ; 2b23: a9 58       .X  :29f2[1]
    sta l004c                                                         ; 2b25: 85 4c       .L  :29f4[1]
    jsr sub_c2c46                                                     ; 2b27: 20 46 2c     F, :29f6[1]
    lda #$1d                                                          ; 2b2a: a9 1d       ..  :29f9[1]
    sta l0016                                                         ; 2b2c: 85 16       ..  :29fb[1]
    lda #2                                                            ; 2b2e: a9 02       ..  :29fd[1]
    sta l0015                                                         ; 2b30: 85 15       ..  :29ff[1]
    jsr sub_c138d                                                     ; 2b32: 20 8d 13     .. :2a01[1]
    lda #$1e                                                          ; 2b35: a9 1e       ..  :2a04[1]
    sta l0016                                                         ; 2b37: 85 16       ..  :2a06[1]
    lda #0                                                            ; 2b39: a9 00       ..  :2a08[1]
    sta l0015                                                         ; 2b3b: 85 15       ..  :2a0a[1]
    jsr sub_c138d                                                     ; 2b3d: 20 8d 13     .. :2a0c[1]
    pla                                                               ; 2b40: 68          h   :2a0f[1]
    sta l004c                                                         ; 2b41: 85 4c       .L  :2a10[1]
; $2b43 referenced 1 time by $29ed
c2a12
    lda #$ff                                                          ; 2b43: a9 ff       ..  :2a12[1]
    sta l002e                                                         ; 2b45: 85 2e       ..  :2a14[1]
    rts                                                               ; 2b47: 60          `   :2a16[1]

; $2b48 referenced 2 times by $29d4, $29e7
sub_c2a17
    ldx l0029                                                         ; 2b48: a6 29       .)  :2a17[1]
    bmi c2a33                                                         ; 2b4a: 30 18       0.  :2a19[1]
    lda l004c                                                         ; 2b4c: a5 4c       .L  :2a1b[1]
    pha                                                               ; 2b4e: 48          H   :2a1d[1]
    lda #$58 ; 'X'                                                    ; 2b4f: a9 58       .X  :2a1e[1]
    sta l004c                                                         ; 2b51: 85 4c       .L  :2a20[1]
    jsr sub_c2c46                                                     ; 2b53: 20 46 2c     F, :2a22[1]
    lda #$1d                                                          ; 2b56: a9 1d       ..  :2a25[1]
    sta l0016                                                         ; 2b58: 85 16       ..  :2a27[1]
    lda #0                                                            ; 2b5a: a9 00       ..  :2a29[1]
    sta l0015                                                         ; 2b5c: 85 15       ..  :2a2b[1]
    jsr sub_c138d                                                     ; 2b5e: 20 8d 13     .. :2a2d[1]
    pla                                                               ; 2b61: 68          h   :2a30[1]
    sta l004c                                                         ; 2b62: 85 4c       .L  :2a31[1]
; $2b64 referenced 1 time by $2a19
c2a33
    lda l0029                                                         ; 2b64: a5 29       .)  :2a33[1]
    sta l002e                                                         ; 2b66: 85 2e       ..  :2a35[1]
    rts                                                               ; 2b68: 60          `   :2a37[1]

; $2b69 referenced 1 time by $2aba
something20_TODO
    ldx l1104                                                         ; 2b69: ae 04 11    ... :2a38[1]
    ldy l1105                                                         ; 2b6c: ac 05 11    ... :2a3b[1]
    jsr c1791                                                         ; 2b6f: 20 91 17     .. :2a3e[1]
    jsr sub_c29a1                                                     ; 2b72: 20 a1 29     .) :2a41[1]
    jsr c3a8f                                                         ; 2b75: 20 8f 3a     .: :2a44[1]
    lda l005b                                                         ; 2b78: a5 5b       .[  :2a47[1]
    beq c2a60                                                         ; 2b7a: f0 15       ..  :2a49[1]
    lda copy_protection_flag                                          ; 2b7c: ad 03 11    ... :2a4b[1]
    and #1                                                            ; 2b7f: 29 01       ).  :2a4e[1]
    beq c2a60                                                         ; 2b81: f0 0e       ..  :2a50[1]
    ldx #$8f                                                          ; 2b83: a2 8f       ..  :2a52[1]
    jsr sub_c3acc                                                     ; 2b85: 20 cc 3a     .: :2a54[1]
    beq c2a60                                                         ; 2b88: f0 07       ..  :2a57[1]
    pla                                                               ; 2b8a: 68          h   :2a59[1]
    pla                                                               ; 2b8b: 68          h   :2a5a[1]
    pla                                                               ; 2b8c: 68          h   :2a5b[1]
    pla                                                               ; 2b8d: 68          h   :2a5c[1]
    jmp something11_TODO                                              ; 2b8e: 4c 39 18    L9. :2a5d[1]

; $2b91 referenced 3 times by $2a49, $2a50, $2a57
c2a60
    lda l0029                                                         ; 2b91: a5 29       .)  :2a60[1]
    sta l0025                                                         ; 2b93: 85 25       .%  :2a62[1]
    jsr sub_c2c67                                                     ; 2b95: 20 67 2c     g, :2a64[1]
    lda l0029                                                         ; 2b98: a5 29       .)  :2a67[1]
    cmp l0025                                                         ; 2b9a: c5 25       .%  :2a69[1]
    beq c2a73                                                         ; 2b9c: f0 06       ..  :2a6b[1]
    jsr something_TODO                                                ; 2b9e: 20 53 04     S. :2a6d[1]
    jmp c2a81                                                         ; 2ba1: 4c 81 2a    L.* :2a70[1]

; $2ba4 referenced 1 time by $2a6b
c2a73
    lda l3aa0                                                         ; 2ba4: ad a0 3a    ..: :2a73[1]
    beq c2a81                                                         ; 2ba7: f0 09       ..  :2a76[1]
    jsr sub_c2adb                                                     ; 2ba9: 20 db 2a     .* :2a78[1]
    jsr sub_c2b37                                                     ; 2bac: 20 37 2b     7+ :2a7b[1]
    jsr sub_c2b65                                                     ; 2baf: 20 65 2b     e+ :2a7e[1]
; $2bb2 referenced 2 times by $2a70, $2a76
c2a81
    lda l0029                                                         ; 2bb2: a5 29       .)  :2a81[1]
    cmp l296d                                                         ; 2bb4: cd 6d 29    .m) :2a83[1]
    bcs c2acd                                                         ; 2bb7: b0 45       .E  :2a86[1]
    lda l0025                                                         ; 2bb9: a5 25       .%  :2a88[1]
    cmp l296d                                                         ; 2bbb: cd 6d 29    .m) :2a8a[1]
    bcc c2aa0                                                         ; 2bbe: 90 11       ..  :2a8d[1]
    lda #osbyte_flush_buffer_class                                    ; 2bc0: a9 0f       ..  :2a8f[1]
    ldx #0                                                            ; 2bc2: a2 00       ..  :2a91[1]
    jsr osbyte                                                        ; 2bc4: 20 f4 ff     .. :2a93[1]   ; Flush all buffers (X=0)
    ldx #3                                                            ; 2bc7: a2 03       ..  :2a96[1]
    lda #0                                                            ; 2bc9: a9 00       ..  :2a98[1]
; $2bcb referenced 1 time by $2a9e
loop_c2a9a
    sta l396f,x                                                       ; 2bcb: 9d 6f 39    .o9 :2a9a[1]
    dex                                                               ; 2bce: ca          .   :2a9d[1]
    bpl loop_c2a9a                                                    ; 2bcf: 10 fa       ..  :2a9e[1]
; $2bd1 referenced 1 time by $2a8d
c2aa0
    jsr some_data_low_TODO                                            ; 2bd1: 20 00 04     .. :2aa0[1]
    jsr sub_c3664                                                     ; 2bd4: 20 64 36     d6 :2aa3[1]
    jsr sub_c344b                                                     ; 2bd7: 20 4b 34     K4 :2aa6[1]
    lda copy_protection_flag                                          ; 2bda: ad 03 11    ... :2aa9[1]
    and #1                                                            ; 2bdd: 29 01       ).  :2aac[1]
    beq c2ab7                                                         ; 2bdf: f0 07       ..  :2aae[1]
    ldx #$ff                                                          ; 2be1: a2 ff       ..  :2ab0[1]
    jsr sub_c3acc                                                     ; 2be3: 20 cc 3a     .: :2ab2[1]
    bne c2abd                                                         ; 2be6: d0 06       ..  :2ab5[1]
; $2be8 referenced 1 time by $2aae
c2ab7
    jsr sub_c178c                                                     ; 2be8: 20 8c 17     .. :2ab7[1]
    jmp something20_TODO                                              ; 2beb: 4c 38 2a    L8* :2aba[1]

; $2bee referenced 1 time by $2ab5
c2abd
    jsr sub_c3aa2                                                     ; 2bee: 20 a2 3a     .: :2abd[1]
    ldx #$80                                                          ; 2bf1: a2 80       ..  :2ac0[1]
    ldy #0                                                            ; 2bf3: a0 00       ..  :2ac2[1]
; $2bf5 referenced 2 times by $2ac5, $2ac8
c2ac4
    dey                                                               ; 2bf5: 88          .   :2ac4[1]
    bne c2ac4                                                         ; 2bf6: d0 fd       ..  :2ac5[1]
    dex                                                               ; 2bf8: ca          .   :2ac7[1]
    bne c2ac4                                                         ; 2bf9: d0 fa       ..  :2ac8[1]
    jmp c2ada                                                         ; 2bfb: 4c da 2a    L.* :2aca[1]

; $2bfe referenced 1 time by $2a86
c2acd
    lda l0025                                                         ; 2bfe: a5 25       .%  :2acd[1]
    cmp l296d                                                         ; 2c00: cd 6d 29    .m) :2acf[1]
    bcs c2ada                                                         ; 2c03: b0 06       ..  :2ad2[1]
    jsr sub_c3aa2                                                     ; 2c05: 20 a2 3a     .: :2ad4[1]
    jsr sub_c3a12                                                     ; 2c08: 20 12 3a     .: :2ad7[1]
; $2c0b referenced 2 times by $2aca, $2ad2
c2ada
    rts                                                               ; 2c0b: 60          `   :2ada[1]

; $2c0c referenced 1 time by $2a78
sub_c2adb
    ldx l0029                                                         ; 2c0c: a6 29       .)  :2adb[1]
    cpx l296d                                                         ; 2c0e: ec 6d 29    .m) :2add[1]
    bcs c2af5                                                         ; 2c11: b0 13       ..  :2ae0[1]
    lda l295c,x                                                       ; 2c13: bd 5c 29    .\) :2ae2[1]
    cmp #7                                                            ; 2c16: c9 07       ..  :2ae5[1]
    beq c2af6                                                         ; 2c18: f0 0d       ..  :2ae7[1]
    cmp #8                                                            ; 2c1a: c9 08       ..  :2ae9[1]
    beq c2af9                                                         ; 2c1c: f0 0c       ..  :2aeb[1]
    cmp #2                                                            ; 2c1e: c9 02       ..  :2aed[1]
    beq c2aff                                                         ; 2c20: f0 0e       ..  :2aef[1]
    cmp #3                                                            ; 2c22: c9 03       ..  :2af1[1]
    beq c2afc                                                         ; 2c24: f0 07       ..  :2af3[1]
; $2c26 referenced 1 time by $2ae0
c2af5
    rts                                                               ; 2c26: 60          `   :2af5[1]

; $2c27 referenced 1 time by $2ae7
c2af6
    jmp c377e                                                         ; 2c27: 4c 7e 37    L~7 :2af6[1]

; $2c2a referenced 1 time by $2aeb
c2af9
    jmp c3636                                                         ; 2c2a: 4c 36 36    L66 :2af9[1]

; $2c2d referenced 1 time by $2af3
c2afc
    jmp c3404                                                         ; 2c2d: 4c 04 34    L.4 :2afc[1]

; $2c30 referenced 1 time by $2aef
c2aff
    jsr sub_c2c46                                                     ; 2c30: 20 46 2c     F, :2aff[1]
    lda l3966                                                         ; 2c33: ad 66 39    .f9 :2b02[1]
    pha                                                               ; 2c36: 48          H   :2b05[1]
    lda #$ff                                                          ; 2c37: a9 ff       ..  :2b06[1]
    sta l3966                                                         ; 2c39: 8d 66 39    .f9 :2b08[1]
    lda #0                                                            ; 2c3c: a9 00       ..  :2b0b[1]
    ldx #$a4                                                          ; 2c3e: a2 a4       ..  :2b0d[1]
    ldy #$38 ; '8'                                                    ; 2c40: a0 38       .8  :2b0f[1]
    jsr sub_c38f6                                                     ; 2c42: 20 f6 38     .8 :2b11[1]
    pla                                                               ; 2c45: 68          h   :2b14[1]
    eor #$ff                                                          ; 2c46: 49 ff       I.  :2b15[1]
    sta l3966                                                         ; 2c48: 8d 66 39    .f9 :2b17[1]
    lda #$1f                                                          ; 2c4b: a9 1f       ..  :2b1a[1]
    sta l0016                                                         ; 2c4d: 85 16       ..  :2b1c[1]
    lda l004c                                                         ; 2c4f: a5 4c       .L  :2b1e[1]
    pha                                                               ; 2c51: 48          H   :2b20[1]
    lda #$58 ; 'X'                                                    ; 2c52: a9 58       .X  :2b21[1]
    sta l004c                                                         ; 2c54: 85 4c       .L  :2b23[1]
    lda #0                                                            ; 2c56: a9 00       ..  :2b25[1]
    ldx l3966                                                         ; 2c58: ae 66 39    .f9 :2b27[1]
    bne c2b2e                                                         ; 2c5b: d0 02       ..  :2b2a[1]
    lda #2                                                            ; 2c5d: a9 02       ..  :2b2c[1]
; $2c5f referenced 1 time by $2b2a
c2b2e
    sta l0015                                                         ; 2c5f: 85 15       ..  :2b2e[1]
    jsr sub_c138d                                                     ; 2c61: 20 8d 13     .. :2b30[1]
    pla                                                               ; 2c64: 68          h   :2b33[1]
    sta l004c                                                         ; 2c65: 85 4c       .L  :2b34[1]
    rts                                                               ; 2c67: 60          `   :2b36[1]

; $2c68 referenced 1 time by $2a7b
sub_c2b37
    ldx l0029                                                         ; 2c68: a6 29       .)  :2b37[1]
    cpx l296d                                                         ; 2c6a: ec 6d 29    .m) :2b39[1]
    bcc c2b64                                                         ; 2c6d: 90 26       .&  :2b3c[1]
    cpx l296e                                                         ; 2c6f: ec 6e 29    .n) :2b3e[1]
    bcs c2b64                                                         ; 2c72: b0 21       .!  :2b41[1]
    lda l0048                                                         ; 2c74: a5 48       .H  :2b43[1]
    cmp l004d                                                         ; 2c76: c5 4d       .M  :2b45[1]
    bne c2b64                                                         ; 2c78: d0 1b       ..  :2b47[1]
    lda l09df                                                         ; 2c7a: ad df 09    ... :2b49[1]
    beq c2b64                                                         ; 2c7d: f0 16       ..  :2b4c[1]
    lda #0                                                            ; 2c7f: a9 00       ..  :2b4e[1]
    sta l0052                                                         ; 2c81: 85 52       .R  :2b50[1]
    lda l295c,x                                                       ; 2c83: bd 5c 29    .\) :2b52[1]
    cmp l0048                                                         ; 2c86: c5 48       .H  :2b55[1]
    beq c2b64                                                         ; 2c88: f0 0b       ..  :2b57[1]
    jsr sub_c2c8c                                                     ; 2c8a: 20 8c 2c     ., :2b59[1]
    bcc c2b64                                                         ; 2c8d: 90 06       ..  :2b5c[1]
    jsr something9_TODO                                               ; 2c8f: 20 31 01     1. :2b5e[1]
    jsr sub_c2337                                                     ; 2c92: 20 37 23     7# :2b61[1]
; $2c95 referenced 6 times by $2b3c, $2b41, $2b47, $2b4c, $2b57, $2b5c
c2b64
    rts                                                               ; 2c95: 60          `   :2b64[1]

; $2c96 referenced 1 time by $2a7e
sub_c2b65
    ldx l0029                                                         ; 2c96: a6 29       .)  :2b65[1]
    cpx l296e                                                         ; 2c98: ec 6e 29    .n) :2b67[1]
    bcc c2b86                                                         ; 2c9b: 90 1a       ..  :2b6a[1]
    lda l0048                                                         ; 2c9d: a5 48       .H  :2b6c[1]
    cmp #4                                                            ; 2c9f: c9 04       ..  :2b6e[1]
    bne c2b86                                                         ; 2ca1: d0 14       ..  :2b70[1]
    cmp l004d                                                         ; 2ca3: c5 4d       .M  :2b72[1]
    bne c2b86                                                         ; 2ca5: d0 10       ..  :2b74[1]
    lda l09df                                                         ; 2ca7: ad df 09    ... :2b76[1]
    beq c2b86                                                         ; 2caa: f0 0b       ..  :2b79[1]
    lda l295c,x                                                       ; 2cac: bd 5c 29    .\) :2b7b[1]
    cmp l0052                                                         ; 2caf: c5 52       .R  :2b7e[1]
    bne c2b84                                                         ; 2cb1: d0 02       ..  :2b80[1]
    lda #0                                                            ; 2cb3: a9 00       ..  :2b82[1]
; $2cb5 referenced 1 time by $2b80
c2b84
    sta l0052                                                         ; 2cb5: 85 52       .R  :2b84[1]
; $2cb7 referenced 4 times by $2b6a, $2b70, $2b74, $2b79
c2b86
    rts                                                               ; 2cb7: 60          `   :2b86[1]

something21_TODO
    sta l0070                                                         ; 2cb8: 85 70       .p  :2b87[1]
    lda #0                                                            ; 2cba: a9 00       ..  :2b89[1]
    sta l0071                                                         ; 2cbc: 85 71       .q  :2b8b[1]
    ldx l296d                                                         ; 2cbe: ae 6d 29    .m) :2b8d[1]
; $2cc1 referenced 1 time by $2b9b
loop_c2b90
    lda l295c,x                                                       ; 2cc1: bd 5c 29    .\) :2b90[1]
    cmp l0070                                                         ; 2cc4: c5 70       .p  :2b93[1]
    beq c2bba                                                         ; 2cc6: f0 23       .#  :2b95[1]
    inx                                                               ; 2cc8: e8          .   :2b97[1]
    cpx l296e                                                         ; 2cc9: ec 6e 29    .n) :2b98[1]
    bcc loop_c2b90                                                    ; 2ccc: 90 f3       ..  :2b9b[1]
    ldx #$10                                                          ; 2cce: a2 10       ..  :2b9d[1]
    lda l295c,x                                                       ; 2cd0: bd 5c 29    .\) :2b9f[1]
    bne c2bba                                                         ; 2cd3: d0 16       ..  :2ba2[1]
; $2cd5 referenced 1 time by $2bae
loop_c2ba4
    lda l295b,x                                                       ; 2cd5: bd 5b 29    .[) :2ba4[1]
    sta l295c,x                                                       ; 2cd8: 9d 5c 29    .\) :2ba7[1]
    dex                                                               ; 2cdb: ca          .   :2baa[1]
    cpx l296e                                                         ; 2cdc: ec 6e 29    .n) :2bab[1]
    bcs loop_c2ba4                                                    ; 2cdf: b0 f4       ..  :2bae[1]
    inc l296e                                                         ; 2ce1: ee 6e 29    .n) :2bb0[1]
    lda l0070                                                         ; 2ce4: a5 70       .p  :2bb3[1]
    sta l295c,x                                                       ; 2ce6: 9d 5c 29    .\) :2bb5[1]
    dec l0071                                                         ; 2ce9: c6 71       .q  :2bb8[1]
; $2ceb referenced 2 times by $2b95, $2ba2
c2bba
    lda l0071                                                         ; 2ceb: a5 71       .q  :2bba[1]
    rts                                                               ; 2ced: 60          `   :2bbc[1]

; $2cee referenced 2 times by $1231, $1a56
sub_c2bbd
    sta l0070                                                         ; 2cee: 85 70       .p  :2bbd[1]
    lda #0                                                            ; 2cf0: a9 00       ..  :2bbf[1]
    sta l0071                                                         ; 2cf2: 85 71       .q  :2bc1[1]
    ldx l296e                                                         ; 2cf4: ae 6e 29    .n) :2bc3[1]
; $2cf7 referenced 1 time by $2bd2
loop_c2bc6
    lda l295c,x                                                       ; 2cf7: bd 5c 29    .\) :2bc6[1]
    beq c2bd6                                                         ; 2cfa: f0 0b       ..  :2bc9[1]
    cmp l0070                                                         ; 2cfc: c5 70       .p  :2bcb[1]
    beq c2bdd                                                         ; 2cfe: f0 0e       ..  :2bcd[1]
    inx                                                               ; 2d00: e8          .   :2bcf[1]
    cpx #$11                                                          ; 2d01: e0 11       ..  :2bd0[1]
    bcc loop_c2bc6                                                    ; 2d03: 90 f2       ..  :2bd2[1]
    bcs c2bdd                                                         ; 2d05: b0 07       ..  :2bd4[1]
; $2d07 referenced 1 time by $2bc9
c2bd6
    lda l0070                                                         ; 2d07: a5 70       .p  :2bd6[1]
    sta l295c,x                                                       ; 2d09: 9d 5c 29    .\) :2bd8[1]
    dec l0071                                                         ; 2d0c: c6 71       .q  :2bdb[1]
; $2d0e referenced 2 times by $2bcd, $2bd4
c2bdd
    lda l0071                                                         ; 2d0e: a5 71       .q  :2bdd[1]
    rts                                                               ; 2d10: 60          `   :2bdf[1]

something22_TODO
    sta l0070                                                         ; 2d11: 85 70       .p  :2be0[1]
    lda #0                                                            ; 2d13: a9 00       ..  :2be2[1]
    sta l0071                                                         ; 2d15: 85 71       .q  :2be4[1]
    ldx l296e                                                         ; 2d17: ae 6e 29    .n) :2be6[1]
; $2d1a referenced 1 time by $2bf3
loop_c2be9
    lda l295c,x                                                       ; 2d1a: bd 5c 29    .\) :2be9[1]
    cmp l0070                                                         ; 2d1d: c5 70       .p  :2bec[1]
    beq c2bf7                                                         ; 2d1f: f0 07       ..  :2bee[1]
    inx                                                               ; 2d21: e8          .   :2bf0[1]
    cpx #$11                                                          ; 2d22: e0 11       ..  :2bf1[1]
    bcc loop_c2be9                                                    ; 2d24: 90 f4       ..  :2bf3[1]
    bcs c2c09                                                         ; 2d26: b0 12       ..  :2bf5[1]
; $2d28 referenced 2 times by $2bee, $2c00
c2bf7
    lda l295d,x                                                       ; 2d28: bd 5d 29    .]) :2bf7[1]
    sta l295c,x                                                       ; 2d2b: 9d 5c 29    .\) :2bfa[1]
    inx                                                               ; 2d2e: e8          .   :2bfd[1]
    cpx #$10                                                          ; 2d2f: e0 10       ..  :2bfe[1]
    bcc c2bf7                                                         ; 2d31: 90 f5       ..  :2c00[1]
    lda #0                                                            ; 2d33: a9 00       ..  :2c02[1]
    sta l295c,x                                                       ; 2d35: 9d 5c 29    .\) :2c04[1]
    dec l0071                                                         ; 2d38: c6 71       .q  :2c07[1]
; $2d3a referenced 1 time by $2bf5
c2c09
    lda l0071                                                         ; 2d3a: a5 71       .q  :2c09[1]
    rts                                                               ; 2d3c: 60          `   :2c0b[1]

; $2d3d referenced 1 time by $29c1
sub_c2c0c
    pha                                                               ; 2d3d: 48          H   :2c0c[1]
    txa                                                               ; 2d3e: 8a          .   :2c0d[1]
    pha                                                               ; 2d3f: 48          H   :2c0e[1]
    tya                                                               ; 2d40: 98          .   :2c0f[1]
    pha                                                               ; 2d41: 48          H   :2c10[1]
    lda l004c                                                         ; 2d42: a5 4c       .L  :2c11[1]
    pha                                                               ; 2d44: 48          H   :2c13[1]
    lda #$58 ; 'X'                                                    ; 2d45: a9 58       .X  :2c14[1]
    sta l004c                                                         ; 2d47: 85 4c       .L  :2c16[1]
    jsr sub_c2c46                                                     ; 2d49: 20 46 2c     F, :2c18[1]
    lda #0                                                            ; 2d4c: a9 00       ..  :2c1b[1]
    sta l0015                                                         ; 2d4e: 85 15       ..  :2c1d[1]
    lda #1                                                            ; 2d50: a9 01       ..  :2c1f[1]
    sta l0016                                                         ; 2d52: 85 16       ..  :2c21[1]
    lda l295c,x                                                       ; 2d54: bd 5c 29    .\) :2c23[1]
    sta l296f,x                                                       ; 2d57: 9d 6f 29    .o) :2c26[1]
    bne c2c35                                                         ; 2d5a: d0 0a       ..  :2c29[1]
    lda #2                                                            ; 2d5c: a9 02       ..  :2c2b[1]
    sta l0015                                                         ; 2d5e: 85 15       ..  :2c2d[1]
    jsr sub_c138d                                                     ; 2d60: 20 8d 13     .. :2c2f[1]
    jmp c2c3d                                                         ; 2d63: 4c 3d 2c    L=, :2c32[1]

; $2d66 referenced 1 time by $2c29
c2c35
    jsr sub_c138d                                                     ; 2d66: 20 8d 13     .. :2c35[1]
    sta l0016                                                         ; 2d69: 85 16       ..  :2c38[1]
    jsr sub_c138d                                                     ; 2d6b: 20 8d 13     .. :2c3a[1]
; $2d6e referenced 1 time by $2c32
c2c3d
    pla                                                               ; 2d6e: 68          h   :2c3d[1]
    sta l004c                                                         ; 2d6f: 85 4c       .L  :2c3e[1]
    pla                                                               ; 2d71: 68          h   :2c40[1]
    tay                                                               ; 2d72: a8          .   :2c41[1]
    pla                                                               ; 2d73: 68          h   :2c42[1]
    tax                                                               ; 2d74: aa          .   :2c43[1]
    pla                                                               ; 2d75: 68          h   :2c44[1]
    rts                                                               ; 2d76: 60          `   :2c45[1]

; $2d77 referenced 4 times by $29f6, $2a22, $2aff, $2c18
sub_c2c46
    txa                                                               ; 2d77: 8a          .   :2c46[1]
    pha                                                               ; 2d78: 48          H   :2c47[1]
    lda #$25 ; '%'                                                    ; 2d79: a9 25       .%  :2c48[1]
    sta l001a                                                         ; 2d7b: 85 1a       ..  :2c4a[1]
    lda #0                                                            ; 2d7d: a9 00       ..  :2c4c[1]
    sta l0019                                                         ; 2d7f: 85 19       ..  :2c4e[1]
    sta l001b                                                         ; 2d81: 85 1b       ..  :2c50[1]
    lda #0                                                            ; 2d83: a9 00       ..  :2c52[1]
    cpx #0                                                            ; 2d85: e0 00       ..  :2c54[1]
    beq c2c62                                                         ; 2d87: f0 0a       ..  :2c56[1]
; $2d89 referenced 1 time by $2c60
loop_c2c58
    clc                                                               ; 2d89: 18          .   :2c58[1]
    adc #$14                                                          ; 2d8a: 69 14       i.  :2c59[1]
    bcc c2c5f                                                         ; 2d8c: 90 02       ..  :2c5b[1]
    inc l0019                                                         ; 2d8e: e6 19       ..  :2c5d[1]
; $2d90 referenced 1 time by $2c5b
c2c5f
    dex                                                               ; 2d90: ca          .   :2c5f[1]
    bne loop_c2c58                                                    ; 2d91: d0 f6       ..  :2c60[1]
; $2d93 referenced 1 time by $2c56
c2c62
    sta l0018                                                         ; 2d93: 85 18       ..  :2c62[1]
    pla                                                               ; 2d95: 68          h   :2c64[1]
    tax                                                               ; 2d96: aa          .   :2c65[1]
    rts                                                               ; 2d97: 60          `   :2c66[1]

; $2d98 referenced 1 time by $2a64
sub_c2c67
    ldx l0029                                                         ; 2d98: a6 29       .)  :2c67[1]
    lda l3aa1                                                         ; 2d9a: ad a1 3a    ..: :2c69[1]
    beq c2c88                                                         ; 2d9d: f0 1a       ..  :2c6c[1]
    bmi c2c7e                                                         ; 2d9f: 30 0e       0.  :2c6e[1]
; $2da1 referenced 1 time by $2c78
loop_c2c70
    inx                                                               ; 2da1: e8          .   :2c70[1]
    cpx #$11                                                          ; 2da2: e0 11       ..  :2c71[1]
    bcs c2c88                                                         ; 2da4: b0 13       ..  :2c73[1]
    lda l295c,x                                                       ; 2da6: bd 5c 29    .\) :2c75[1]
    beq loop_c2c70                                                    ; 2da9: f0 f6       ..  :2c78[1]
    stx l0029                                                         ; 2dab: 86 29       .)  :2c7a[1]
    bne c2c88                                                         ; 2dad: d0 0a       ..  :2c7c[1]
; $2daf referenced 2 times by $2c6e, $2c84
c2c7e
    dex                                                               ; 2daf: ca          .   :2c7e[1]
    bmi c2c88                                                         ; 2db0: 30 07       0.  :2c7f[1]
    lda l295c,x                                                       ; 2db2: bd 5c 29    .\) :2c81[1]
    beq c2c7e                                                         ; 2db5: f0 f8       ..  :2c84[1]
    stx l0029                                                         ; 2db7: 86 29       .)  :2c86[1]
; $2db9 referenced 4 times by $2c6c, $2c73, $2c7c, $2c7f
c2c88
    jsr sub_c29de                                                     ; 2db9: 20 de 29     .) :2c88[1]
    rts                                                               ; 2dbc: 60          `   :2c8b[1]

; $2dbd referenced 1 time by $2b59
sub_c2c8c
    pha                                                               ; 2dbd: 48          H   :2c8c[1]
    lda l09ec                                                         ; 2dbe: ad ec 09    ... :2c8d[1]
    clc                                                               ; 2dc1: 18          .   :2c90[1]
    adc l09ed                                                         ; 2dc2: 6d ed 09    m.. :2c91[1]
    cmp #$50 ; 'P'                                                    ; 2dc5: c9 50       .P  :2c94[1]
    clc                                                               ; 2dc7: 18          .   :2c96[1]
    beq c2cd5                                                         ; 2dc8: f0 3c       .<  :2c97[1]
    dec l09ec                                                         ; 2dca: ce ec 09    ... :2c99[1]
    lda l09ec                                                         ; 2dcd: ad ec 09    ... :2c9c[1]
    cmp #$30 ; '0'                                                    ; 2dd0: c9 30       .0  :2c9f[1]
    bcs c2cd4                                                         ; 2dd2: b0 31       .1  :2ca1[1]
    lda #$39 ; '9'                                                    ; 2dd4: a9 39       .9  :2ca3[1]
    sta l09ec                                                         ; 2dd6: 8d ec 09    ... :2ca5[1]
    dec l09ed                                                         ; 2dd9: ce ed 09    ... :2ca8[1]
    lda l09ed                                                         ; 2ddc: ad ed 09    ... :2cab[1]
    cmp #$30 ; '0'                                                    ; 2ddf: c9 30       .0  :2cae[1]
    beq c2cca                                                         ; 2de1: f0 18       ..  :2cb0[1]
    bcs c2cd4                                                         ; 2de3: b0 20       .   :2cb2[1]
    lda #$39 ; '9'                                                    ; 2de5: a9 39       .9  :2cb4[1]
    sta l09ed                                                         ; 2de7: 8d ed 09    ... :2cb6[1]
    dec l09ee                                                         ; 2dea: ce ee 09    ... :2cb9[1]
    lda l09ee                                                         ; 2ded: ad ee 09    ... :2cbc[1]
    cmp #$30 ; '0'                                                    ; 2df0: c9 30       .0  :2cbf[1]
    bne c2cd4                                                         ; 2df2: d0 11       ..  :2cc1[1]
    lda #$20 ; ' '                                                    ; 2df4: a9 20       .   :2cc3[1]
    sta l09ee                                                         ; 2df6: 8d ee 09    ... :2cc5[1]
    bne c2cd4                                                         ; 2df9: d0 0a       ..  :2cc8[1]
; $2dfb referenced 1 time by $2cb0
c2cca
    lda l09ee                                                         ; 2dfb: ad ee 09    ... :2cca[1]
    cmp #$20 ; ' '                                                    ; 2dfe: c9 20       .   :2ccd[1]
    bne c2cd4                                                         ; 2e00: d0 03       ..  :2ccf[1]
    sta l09ed                                                         ; 2e02: 8d ed 09    ... :2cd1[1]
; $2e05 referenced 5 times by $2ca1, $2cb2, $2cc1, $2cc8, $2ccf
c2cd4
    sec                                                               ; 2e05: 38          8   :2cd4[1]
; $2e06 referenced 1 time by $2c97
c2cd5
    pla                                                               ; 2e06: 68          h   :2cd5[1]
    rts                                                               ; 2e07: 60          `   :2cd6[1]

    !byte $30,   2, $f8, $31,   4, $f7, $32,   2, $f8, $33,   0, $f7  ; 2e08: 30 02 f8... 0.. :2cd7[1]
    !byte $34,   3, $f5, $36,   2, $f7, $35,   4, $f6,   0            ; 2e14: 34 03 f5... 4.. :2ce3[1]
; $2e1e referenced 1 time by $2e6e
l2ced
    !byte   0,   0,   0, $39,   0,   0, $39,   0,   0, $38,   0,   0  ; 2e1e: 00 00 00... ... :2ced[1]
    !byte $38,   0,   0, $34,   0,   0, $34,   0,   0,   0, $34,   0  ; 2e2a: 38 00 00... 8.. :2cf9[1]
    !byte   0, $34,   0,   0, $38,   0,   0, $38,   0,   0, $39,   0  ; 2e36: 00 34 00... .4. :2d05[1]
    !byte   0, $39,   0,   0,   0, $30,   4,   0, $31,   4,   0, $32  ; 2e42: 00 39 00... .9. :2d11[1]
    !byte   4,   0, $33,   4,   0,   0, $33,   0,   0, $33,   2,   0  ; 2e4e: 04 00 33... ..3 :2d1d[1]
    !byte   0, $36,   4,   0,   0, $36,   0,   0,   0, $35,   0,   0  ; 2e5a: 00 36 04... .6. :2d29[1]
    !byte   0, $34,   6, $fc, $34,   6, $fd, $34,   5, $fe, $34,   5  ; 2e66: 00 34 06... .4. :2d35[1]
    !byte $ff, $34,   4,   0,   0, $34,   4,   1, $34,   3,   2, $34  ; 2e72: ff 34 04... .4. :2d41[1]
    !byte   3,   3, $34,   2,   4, $34,   2,   5, $34,   1,   6,   0  ; 2e7e: 03 03 34... ..4 :2d4d[1]
    !byte $34,   4,   2, $34,   3,   3, $34,   2,   4, $34,   1,   5  ; 2e8a: 34 04 02... 4.. :2d59[1]
    !byte   0, $34, $fc,   2, $34, $fd,   3, $34, $fe,   4, $34, $ff  ; 2e96: 00 34 fc... .4. :2d65[1]
    !byte   5,   0, $34,   0,   1, $34,   0,   2, $34,   0,   3, $34  ; 2ea2: 05 00 34... ..4 :2d71[1]
    !byte   0,   4, $34,   0,   5,   0, $34,   0,   7,   0            ; 2eae: 00 04 34... ..4 :2d7d[1]

; $2eb8 referenced 2 times by $22e3, $2e3f
c2d87
    lda #$16                                                          ; 2eb8: a9 16       ..  :2d87[1]
    sta l22ed                                                         ; 2eba: 8d ed 22    .." :2d89[1]
    ldx #$ed                                                          ; 2ebd: a2 ed       ..  :2d8c[1]
    ldy #$2c ; ','                                                    ; 2ebf: a0 2c       .,  :2d8e[1]
    lda #3                                                            ; 2ec1: a9 03       ..  :2d90[1]
    jsr sub_c22ee                                                     ; 2ec3: 20 ee 22     ." :2d92[1]
    bne c2dc0                                                         ; 2ec6: d0 29       .)  :2d95[1]
    cpy #$39 ; '9'                                                    ; 2ec8: c0 39       .9  :2d97[1]
    bne c2da6                                                         ; 2eca: d0 0b       ..  :2d99[1]
    lda l09be                                                         ; 2ecc: ad be 09    ... :2d9b[1]
    eor #$fe                                                          ; 2ecf: 49 fe       I.  :2d9e[1]
    sta l09be                                                         ; 2ed1: 8d be 09    ... :2da0[1]
    jmp c2e5f                                                         ; 2ed4: 4c 5f 2e    L_. :2da3[1]

; $2ed7 referenced 1 time by $2d99
c2da6
    jsr sub_c23c4                                                     ; 2ed7: 20 c4 23     .# :2da6[1]
    bne c2de4                                                         ; 2eda: d0 39       .9  :2da9[1]
    lda l09df                                                         ; 2edc: ad df 09    ... :2dab[1]
    cmp #$49 ; 'I'                                                    ; 2edf: c9 49       .I  :2dae[1]
    bne c2dca                                                         ; 2ee1: d0 18       ..  :2db0[1]
    dec l2550                                                         ; 2ee3: ce 50 25    .P% :2db2[1]
    lda #0                                                            ; 2ee6: a9 00       ..  :2db5[1]
    jsr sub_c2894                                                     ; 2ee8: 20 94 28     .( :2db7[1]
    bne c2dc3                                                         ; 2eeb: d0 07       ..  :2dba[1]
    cpy #$49 ; 'I'                                                    ; 2eed: c0 49       .I  :2dbc[1]
    beq c2dc3                                                         ; 2eef: f0 03       ..  :2dbe[1]
; $2ef1 referenced 2 times by $2d95, $2de9
c2dc0
    jmp c2e5f                                                         ; 2ef1: 4c 5f 2e    L_. :2dc0[1]

; $2ef4 referenced 2 times by $2dba, $2dbe
c2dc3
    lda #$96                                                          ; 2ef4: a9 96       ..  :2dc3[1]
    sta l09df                                                         ; 2ef6: 8d df 09    ... :2dc5[1]
    ldy #$59 ; 'Y'                                                    ; 2ef9: a0 59       .Y  :2dc8[1]
; $2efb referenced 1 time by $2db0
c2dca
    lda l288f                                                         ; 2efb: ad 8f 28    ..( :2dca[1]
    bne c2df3                                                         ; 2efe: d0 24       .$  :2dcd[1]
    lda l09df                                                         ; 2f00: ad df 09    ... :2dcf[1]
    cmp #$96                                                          ; 2f03: c9 96       ..  :2dd2[1]
    bne c2de4                                                         ; 2f05: d0 0e       ..  :2dd4[1]
    lda #4                                                            ; 2f07: a9 04       ..  :2dd6[1]
    ora #1                                                            ; 2f09: 09 01       ..  :2dd8[1]
    and l38d8                                                         ; 2f0b: 2d d8 38    -.8 :2dda[1]
    beq c2de4                                                         ; 2f0e: f0 05       ..  :2ddd[1]
    lda #$80                                                          ; 2f10: a9 80       ..  :2ddf[1]
    sta l2433                                                         ; 2f12: 8d 33 24    .3$ :2de1[1]
; $2f15 referenced 3 times by $2da9, $2dd4, $2ddd
c2de4
    lda #$96                                                          ; 2f15: a9 96       ..  :2de4[1]
    cmp l09df                                                         ; 2f17: cd df 09    ... :2de6[1]
    beq c2dc0                                                         ; 2f1a: f0 d5       ..  :2de9[1]
    sta l09df                                                         ; 2f1c: 8d df 09    ... :2deb[1]
    ldy #$86                                                          ; 2f1f: a0 86       ..  :2dee[1]
    jmp c2e5f                                                         ; 2f21: 4c 5f 2e    L_. :2df0[1]

; $2f24 referenced 1 time by $2dcd
c2df3
    ldx l3ac9                                                         ; 2f24: ae c9 3a    ..: :2df3[1]
    beq c2e1b                                                         ; 2f27: f0 23       .#  :2df6[1]
    lda #$36 ; '6'                                                    ; 2f29: a9 36       .6  :2df8[1]
    cpx l09be                                                         ; 2f2b: ec be 09    ... :2dfa[1]
    bne c2e0f                                                         ; 2f2e: d0 10       ..  :2dfd[1]
    lda #$29 ; ')'                                                    ; 2f30: a9 29       .)  :2dff[1]
    ldx l3ac7                                                         ; 2f32: ae c7 3a    ..: :2e01[1]
    beq c2e0f                                                         ; 2f35: f0 09       ..  :2e04[1]
    ldx l09df                                                         ; 2f37: ae df 09    ... :2e06[1]
    cpx #$96                                                          ; 2f3a: e0 96       ..  :2e09[1]
    beq c2e0f                                                         ; 2f3c: f0 02       ..  :2e0b[1]
    lda #$49 ; 'I'                                                    ; 2f3e: a9 49       .I  :2e0d[1]
; $2f40 referenced 3 times by $2dfd, $2e04, $2e0b
c2e0f
    cmp l09df                                                         ; 2f40: cd df 09    ... :2e0f[1]
    beq c2e44                                                         ; 2f43: f0 30       .0  :2e12[1]
    sta l09df                                                         ; 2f45: 8d df 09    ... :2e14[1]
    tay                                                               ; 2f48: a8          .   :2e17[1]
    jmp c2e44                                                         ; 2f49: 4c 44 2e    LD. :2e18[1]

; $2f4c referenced 1 time by $2df6
c2e1b
    lda l09df                                                         ; 2f4c: ad df 09    ... :2e1b[1]
    ldy #$41 ; 'A'                                                    ; 2f4f: a0 41       .A  :2e1e[1]
    sty l09df                                                         ; 2f51: 8c df 09    ... :2e20[1]
    cmp #$29 ; ')'                                                    ; 2f54: c9 29       .)  :2e23[1]
    beq c2e42                                                         ; 2f56: f0 1b       ..  :2e25[1]
    cmp #$36 ; '6'                                                    ; 2f58: c9 36       .6  :2e27[1]
    beq c2e42                                                         ; 2f5a: f0 17       ..  :2e29[1]
    lda l3ac7                                                         ; 2f5c: ad c7 3a    ..: :2e2b[1]
    beq c2e44                                                         ; 2f5f: f0 14       ..  :2e2e[1]
    lda l0052                                                         ; 2f61: a5 52       .R  :2e30[1]
    beq c2e44                                                         ; 2f63: f0 10       ..  :2e32[1]
    ldy #$45 ; 'E'                                                    ; 2f65: a0 45       .E  :2e34[1]
    cmp #$21 ; '!'                                                    ; 2f67: c9 21       .!  :2e36[1]
    bne c2e44                                                         ; 2f69: d0 0a       ..  :2e38[1]
    lda #0                                                            ; 2f6b: a9 00       ..  :2e3a[1]
    jsr sub_c2337                                                     ; 2f6d: 20 37 23     7# :2e3c[1]
    jmp c2d87                                                         ; 2f70: 4c 87 2d    L.- :2e3f[1]

; $2f73 referenced 2 times by $2e25, $2e29
c2e42
    ldy #$3d ; '='                                                    ; 2f73: a0 3d       .=  :2e42[1]
; $2f75 referenced 5 times by $2e12, $2e18, $2e2e, $2e32, $2e38
c2e44
    ldx #0                                                            ; 2f75: a2 00       ..  :2e44[1]
    lda l3ac9                                                         ; 2f77: ad c9 3a    ..: :2e46[1]
    beq c2e4c                                                         ; 2f7a: f0 01       ..  :2e49[1]
    inx                                                               ; 2f7c: e8          .   :2e4b[1]
; $2f7d referenced 1 time by $2e49
c2e4c
    lda l2890,x                                                       ; 2f7d: bd 90 28    ..( :2e4c[1]
    beq c2e5f                                                         ; 2f80: f0 0e       ..  :2e4f[1]
    ldy #$96                                                          ; 2f82: a0 96       ..  :2e51[1]
    sty l09df                                                         ; 2f84: 8c df 09    ... :2e53[1]
    ldy #$6c ; 'l'                                                    ; 2f87: a0 6c       .l  :2e56[1]
    cmp l09be                                                         ; 2f89: cd be 09    ... :2e58[1]
    beq c2e5f                                                         ; 2f8c: f0 02       ..  :2e5b[1]
    ldy #$79 ; 'y'                                                    ; 2f8e: a0 79       .y  :2e5d[1]
; $2f90 referenced 5 times by $2da3, $2dc0, $2df0, $2e4f, $2e5b
c2e5f
    sty l09d4                                                         ; 2f90: 8c d4 09    ... :2e5f[1]
    lda #0                                                            ; 2f93: a9 00       ..  :2e62[1]
    sta l2eb5                                                         ; 2f95: 8d b5 2e    ... :2e64[1]
    lda l0052                                                         ; 2f98: a5 52       .R  :2e67[1]
    beq c2e82                                                         ; 2f9a: f0 17       ..  :2e69[1]
    ldy l09d4                                                         ; 2f9c: ac d4 09    ... :2e6b[1]
    lda l2ced,y                                                       ; 2f9f: b9 ed 2c    .., :2e6e[1]
    sta l09a8                                                         ; 2fa2: 8d a8 09    ... :2e71[1]
    jsr sub_c2eb8                                                     ; 2fa5: 20 b8 2e     .. :2e74[1]
    lda #0                                                            ; 2fa8: a9 00       ..  :2e77[1]
    jsr sub_c25f5                                                     ; 2faa: 20 f5 25     .% :2e79[1]
    lda l38d8                                                         ; 2fad: ad d8 38    ..8 :2e7c[1]
    sta l2eb5                                                         ; 2fb0: 8d b5 2e    ... :2e7f[1]
; $2fb3 referenced 1 time by $2e69
c2e82
    lda l09d4                                                         ; 2fb3: ad d4 09    ... :2e82[1]
    ldx #$ed                                                          ; 2fb6: a2 ed       ..  :2e85[1]
    ldy #$2c ; ','                                                    ; 2fb8: a0 2c       .,  :2e87[1]
    jsr something17_TODO                                              ; 2fba: 20 00 22     ." :2e89[1]
    jsr sub_c2eb8                                                     ; 2fbd: 20 b8 2e     .. :2e8c[1]
    lda #0                                                            ; 2fc0: a9 00       ..  :2e8f[1]
    jsr sub_c25f5                                                     ; 2fc2: 20 f5 25     .% :2e91[1]
    lda l38d8                                                         ; 2fc5: ad d8 38    ..8 :2e94[1]
    ora l2eb5                                                         ; 2fc8: 0d b5 2e    ... :2e97[1]
    sta l38d8                                                         ; 2fcb: 8d d8 38    ..8 :2e9a[1]
    lda l2eb6                                                         ; 2fce: ad b6 2e    ... :2e9d[1]
    sta l2eb7                                                         ; 2fd1: 8d b7 2e    ... :2ea0[1]
    ldx #0                                                            ; 2fd4: a2 00       ..  :2ea3[1]
    lda l09a8                                                         ; 2fd6: ad a8 09    ... :2ea5[1]
    cmp #$35 ; '5'                                                    ; 2fd9: c9 35       .5  :2ea8[1]
    bne c2eb1                                                         ; 2fdb: d0 05       ..  :2eaa[1]
    lda l0052                                                         ; 2fdd: a5 52       .R  :2eac[1]
    beq c2eb1                                                         ; 2fdf: f0 01       ..  :2eae[1]
    tax                                                               ; 2fe1: aa          .   :2eb0[1]
; $2fe2 referenced 2 times by $2eaa, $2eae
c2eb1
    stx l2eb6                                                         ; 2fe2: 8e b6 2e    ... :2eb1[1]
    rts                                                               ; 2fe5: 60          `   :2eb4[1]

; $2fe6 referenced 3 times by $2e64, $2e7f, $2e97
l2eb5
    !byte 0                                                           ; 2fe6: 00          .   :2eb5[1]
; $2fe7 referenced 3 times by $11c0, $2e9d, $2eb1
l2eb6
    !byte 0                                                           ; 2fe7: 00          .   :2eb6[1]
; $2fe8 referenced 2 times by $11c3, $2ea0
l2eb7
    !byte 0                                                           ; 2fe8: 00          .   :2eb7[1]

; $2fe9 referenced 3 times by $2653, $2e74, $2e8c
sub_c2eb8
    ldx l0052                                                         ; 2fe9: a6 52       .R  :2eb8[1]
    beq c2ee4                                                         ; 2feb: f0 28       .(  :2eba[1]
    ldx #$d7                                                          ; 2fed: a2 d7       ..  :2ebc[1]
    ldy #$2c ; ','                                                    ; 2fef: a0 2c       .,  :2ebe[1]
    lda #0                                                            ; 2ff1: a9 00       ..  :2ec0[1]
    jsr something18_TODO                                              ; 2ff3: 20 48 22     H" :2ec2[1]
    lda l0052                                                         ; 2ff6: a5 52       .R  :2ec5[1]
    ldy #0                                                            ; 2ff8: a0 00       ..  :2ec7[1]
; $2ffa referenced 1 time by $2ed1
loop_c2ec9
    cmp l2ee8,y                                                       ; 2ffa: d9 e8 2e    ... :2ec9[1]
    beq c2ed7                                                         ; 2ffd: f0 09       ..  :2ecc[1]
    iny                                                               ; 2fff: c8          .   :2ece[1]
    cpy #4                                                            ; 3000: c0 04       ..  :2ecf[1]
    bcc loop_c2ec9                                                    ; 3002: 90 f6       ..  :2ed1[1]
    ldx #0                                                            ; 3004: a2 00       ..  :2ed3[1]
    beq c2ee4                                                         ; 3006: f0 0d       ..  :2ed5[1]
; $3008 referenced 1 time by $2ecc
c2ed7
    ldx l2ef2,y                                                       ; 3008: be f2 2e    ... :2ed7[1]
    lda l09a8                                                         ; 300b: ad a8 09    ... :2eda[1]
    cmp #$35 ; '5'                                                    ; 300e: c9 35       .5  :2edd[1]
    beq c2ee4                                                         ; 3010: f0 03       ..  :2edf[1]
    ldx l2eed,y                                                       ; 3012: be ed 2e    ... :2ee1[1]
; $3015 referenced 3 times by $2eba, $2ed5, $2edf
c2ee4
    stx l09a9                                                         ; 3015: 8e a9 09    ... :2ee4[1]
    rts                                                               ; 3018: 60          `   :2ee7[1]

; $3019 referenced 2 times by $1a2d, $2ec9
l2ee8
    !byte 0                                                           ; 3019: 00          .   :2ee8[1]
; $301a referenced 1 time by $2992
l2ee9
    !byte 0, 0, 0, 0                                                  ; 301a: 00 00 00... ... :2ee9[1]
; $301e referenced 2 times by $1a25, $2ee1
l2eed
    !byte 0, 0, 0, 0, 0                                               ; 301e: 00 00 00... ... :2eed[1]
; $3023 referenced 2 times by $1a28, $2ed7
l2ef2
    !byte   0,   0,   0,   0,   0, $12, $13, $14, $15, $16, $17, $18  ; 3023: 00 00 00... ... :2ef2[1]
    !byte $19,   0, $0c, $f9, $f6, $0d, $f9, $f5, $0e, $f9, $f6, $0f  ; 302f: 19 00 0c... ... :2efe[1]
    !byte $f9, $f5, $0f, $f9, $f5, $1c, $f9, $f5, $1a, $f9, $f6,   0  ; 303b: f9 f5 0f... ... :2f0a[1]
    !byte   0,   0,   0, $11,   0,   0, $11,   0,   0, $10,   0,   0  ; 3047: 00 00 00... ... :2f16[1]
    !byte $10,   0,   0, $0f,   0,   0, $0f,   0,   0,   0, $0f,   0  ; 3053: 10 00 00... ... :2f22[1]
    !byte   0, $0f,   0,   0, $10,   0,   0, $10,   0,   0, $11,   0  ; 305f: 00 0f 00... ... :2f2e[1]
    !byte   0, $11,   0,   0,   0, $0c,   4,   0, $0d,   4,   0, $0e  ; 306b: 00 11 00... ... :2f3a[1]
    !byte   4,   0, $0f,   4,   0,   0, $0f,   0,   0, $0f,   2,   0  ; 3077: 04 00 0f... ... :2f46[1]
    !byte   0, $1c,   4,   0,   0, $1c,   0,   0,   0, $1a,   6, $fb  ; 3083: 00 1c 04... ... :2f52[1]
    !byte $1a,   6, $fc, $1a,   5, $fc, $1a,   5, $fd, $1a,   5, $fe  ; 308f: 1a 06 fc... ... :2f5e[1]
    !byte $1a,   5, $ff,   0, $1a,   5,   0, $1a,   5,   0,   0, $0f  ; 309b: 1a 05 ff... ... :2f6a[1]
    !byte   5,   1, $0f,   5,   2, $0f,   4,   3, $0f,   4,   4, $0f  ; 30a7: 05 01 0f... ... :2f76[1]
    !byte   4,   4, $0f,   4,   5, $0f,   3,   5, $0f,   3,   5, $0f  ; 30b3: 04 04 0f... ... :2f82[1]
    !byte   2,   6, $0f,   2,   6, $0f,   1,   6, $0f,   1,   6,   0  ; 30bf: 02 06 0f... ... :2f8e[1]
    !byte $0f,   4,   2, $0f,   3,   3, $0f,   2,   4, $0f,   1,   5  ; 30cb: 0f 04 02... ... :2f9a[1]
    !byte   0, $0f, $fc,   2, $0f, $fd,   3, $0f, $fe,   4, $0f, $ff  ; 30d7: 00 0f fc... ... :2fa6[1]
    !byte   5,   0, $0f,   0,   1, $0f,   0,   2, $0f,   0,   3, $0f  ; 30e3: 05 00 0f... ... :2fb2[1]
    !byte   0,   4, $0f,   0,   5,   0, $0f,   0,   7,   0            ; 30ef: 00 04 0f... ... :2fbe[1]

; $30f9 referenced 1 time by $22e6
c2fc8
    lda #$16                                                          ; 30f9: a9 16       ..  :2fc8[1]
    sta l22ed                                                         ; 30fb: 8d ed 22    .." :2fca[1]
    ldx #$16                                                          ; 30fe: a2 16       ..  :2fcd[1]
    ldy #$2f ; '/'                                                    ; 3100: a0 2f       ./  :2fcf[1]
    lda #3                                                            ; 3102: a9 03       ..  :2fd1[1]
    jsr sub_c22ee                                                     ; 3104: 20 ee 22     ." :2fd3[1]
    bne c300e                                                         ; 3107: d0 36       .6  :2fd6[1]
    cpy #$39 ; '9'                                                    ; 3109: c0 39       .9  :2fd8[1]
    bne c2fe7                                                         ; 310b: d0 0b       ..  :2fda[1]
    lda l09be                                                         ; 310d: ad be 09    ... :2fdc[1]
    eor #$fe                                                          ; 3110: 49 fe       I.  :2fdf[1]
    sta l09be                                                         ; 3112: 8d be 09    ... :2fe1[1]
    jmp c30a5                                                         ; 3115: 4c a5 30    L.0 :2fe4[1]

; $3118 referenced 1 time by $2fda
c2fe7
    jsr sub_c23c4                                                     ; 3118: 20 c4 23     .# :2fe7[1]
    bne c3044                                                         ; 311b: d0 58       .X  :2fea[1]
    lda l09df                                                         ; 311d: ad df 09    ... :2fec[1]
    cmp #$45 ; 'E'                                                    ; 3120: c9 45       .E  :2fef[1]
    bne c3011                                                         ; 3122: d0 1e       ..  :2ff1[1]
    dec l2550                                                         ; 3124: ce 50 25    .P% :2ff3[1]
    lda #0                                                            ; 3127: a9 00       ..  :2ff6[1]
    jsr sub_c2894                                                     ; 3129: 20 94 28     .( :2ff8[1]
    bne c3023                                                         ; 312c: d0 26       .&  :2ffb[1]
    cpy #$45 ; 'E'                                                    ; 312e: c0 45       .E  :2ffd[1]
    bne c300e                                                         ; 3130: d0 0d       ..  :2fff[1]
    lda l3ac9                                                         ; 3132: ad c9 3a    ..: :3001[1]
    cmp l09be                                                         ; 3135: cd be 09    ... :3004[1]
    bne c3023                                                         ; 3138: d0 1a       ..  :3007[1]
    ldy #$58 ; 'X'                                                    ; 313a: a0 58       .X  :3009[1]
    sty l09df                                                         ; 313c: 8c df 09    ... :300b[1]
; $313f referenced 4 times by $2fd6, $2fff, $3021, $3049
c300e
    jmp c30a5                                                         ; 313f: 4c a5 30    L.0 :300e[1]

; $3142 referenced 1 time by $2ff1
c3011
    cmp #$58 ; 'X'                                                    ; 3142: c9 58       .X  :3011[1]
    bne c302a                                                         ; 3144: d0 15       ..  :3013[1]
    dec l2550                                                         ; 3146: ce 50 25    .P% :3015[1]
    lda #0                                                            ; 3149: a9 00       ..  :3018[1]
    jsr sub_c2894                                                     ; 314b: 20 94 28     .( :301a[1]
    bne c3023                                                         ; 314e: d0 04       ..  :301d[1]
    cpy #$58 ; 'X'                                                    ; 3150: c0 58       .X  :301f[1]
    bne c300e                                                         ; 3152: d0 eb       ..  :3021[1]
; $3154 referenced 3 times by $2ffb, $3007, $301d
c3023
    lda #$ae                                                          ; 3154: a9 ae       ..  :3023[1]
    sta l09df                                                         ; 3156: 8d df 09    ... :3025[1]
    ldy #$5f ; '_'                                                    ; 3159: a0 5f       ._  :3028[1]
; $315b referenced 1 time by $3013
c302a
    lda l288f                                                         ; 315b: ad 8f 28    ..( :302a[1]
    bne c3053                                                         ; 315e: d0 24       .$  :302d[1]
    lda l09df                                                         ; 3160: ad df 09    ... :302f[1]
    cmp #$ae                                                          ; 3163: c9 ae       ..  :3032[1]
    bne c3044                                                         ; 3165: d0 0e       ..  :3034[1]
    lda #4                                                            ; 3167: a9 04       ..  :3036[1]
    ora #1                                                            ; 3169: 09 01       ..  :3038[1]
    and l38d8                                                         ; 316b: 2d d8 38    -.8 :303a[1]
    beq c3044                                                         ; 316e: f0 05       ..  :303d[1]
    lda #$80                                                          ; 3170: a9 80       ..  :303f[1]
    sta l2433                                                         ; 3172: 8d 33 24    .3$ :3041[1]
; $3175 referenced 3 times by $2fea, $3034, $303d
c3044
    lda #$ae                                                          ; 3175: a9 ae       ..  :3044[1]
    cmp l09df                                                         ; 3177: cd df 09    ... :3046[1]
    beq c300e                                                         ; 317a: f0 c3       ..  :3049[1]
    sta l09df                                                         ; 317c: 8d df 09    ... :304b[1]
    ldy #$9e                                                          ; 317f: a0 9e       ..  :304e[1]
    jmp c30a5                                                         ; 3181: 4c a5 30    L.0 :3050[1]

; $3184 referenced 1 time by $302d
c3053
    ldx l3ac9                                                         ; 3184: ae c9 3a    ..: :3053[1]
    beq c3074                                                         ; 3187: f0 1c       ..  :3056[1]
    lda #$36 ; '6'                                                    ; 3189: a9 36       .6  :3058[1]
    cpx l09be                                                         ; 318b: ec be 09    ... :305a[1]
    bne c3068                                                         ; 318e: d0 09       ..  :305d[1]
    lda #$29 ; ')'                                                    ; 3190: a9 29       .)  :305f[1]
    ldx l3ac7                                                         ; 3192: ae c7 3a    ..: :3061[1]
    beq c3068                                                         ; 3195: f0 02       ..  :3064[1]
    lda #$45 ; 'E'                                                    ; 3197: a9 45       .E  :3066[1]
; $3199 referenced 2 times by $305d, $3064
c3068
    cmp l09df                                                         ; 3199: cd df 09    ... :3068[1]
    beq c308a                                                         ; 319c: f0 1d       ..  :306b[1]
    sta l09df                                                         ; 319e: 8d df 09    ... :306d[1]
    tay                                                               ; 31a1: a8          .   :3070[1]
    jmp c308a                                                         ; 31a2: 4c 8a 30    L.0 :3071[1]

; $31a5 referenced 1 time by $3056
c3074
    lda l09df                                                         ; 31a5: ad df 09    ... :3074[1]
    cmp #$41 ; 'A'                                                    ; 31a8: c9 41       .A  :3077[1]
    beq c308a                                                         ; 31aa: f0 0f       ..  :3079[1]
    ldy #$41 ; 'A'                                                    ; 31ac: a0 41       .A  :307b[1]
    sty l09df                                                         ; 31ae: 8c df 09    ... :307d[1]
    cmp #$29 ; ')'                                                    ; 31b1: c9 29       .)  :3080[1]
    beq c3088                                                         ; 31b3: f0 04       ..  :3082[1]
    cmp #$36 ; '6'                                                    ; 31b5: c9 36       .6  :3084[1]
    bne c308a                                                         ; 31b7: d0 02       ..  :3086[1]
; $31b9 referenced 1 time by $3082
c3088
    ldy #$3d ; '='                                                    ; 31b9: a0 3d       .=  :3088[1]
; $31bb referenced 4 times by $306b, $3071, $3079, $3086
c308a
    ldx #0                                                            ; 31bb: a2 00       ..  :308a[1]
    lda l3ac9                                                         ; 31bd: ad c9 3a    ..: :308c[1]
    beq c3092                                                         ; 31c0: f0 01       ..  :308f[1]
    inx                                                               ; 31c2: e8          .   :3091[1]
; $31c3 referenced 1 time by $308f
c3092
    lda l2890,x                                                       ; 31c3: bd 90 28    ..( :3092[1]
    beq c30a5                                                         ; 31c6: f0 0e       ..  :3095[1]
    ldy #$ae                                                          ; 31c8: a0 ae       ..  :3097[1]
    sty l09df                                                         ; 31ca: 8c df 09    ... :3099[1]
    ldy #$84                                                          ; 31cd: a0 84       ..  :309c[1]
    cmp l09be                                                         ; 31cf: cd be 09    ... :309e[1]
    beq c30a5                                                         ; 31d2: f0 02       ..  :30a1[1]
    ldy #$91                                                          ; 31d4: a0 91       ..  :30a3[1]
; $31d6 referenced 5 times by $2fe4, $300e, $3050, $3095, $30a1
c30a5
    sty l09d4                                                         ; 31d6: 8c d4 09    ... :30a5[1]
    tya                                                               ; 31d9: 98          .   :30a8[1]
    ldx #$16                                                          ; 31da: a2 16       ..  :30a9[1]
    ldy #$2f ; '/'                                                    ; 31dc: a0 2f       ./  :30ab[1]
    jsr something17_TODO                                              ; 31de: 20 00 22     ." :30ad[1]
    lda #0                                                            ; 31e1: a9 00       ..  :30b0[1]
    jsr sub_c25f5                                                     ; 31e3: 20 f5 25     .% :30b2[1]
    lda #$f7                                                          ; 31e6: a9 f7       ..  :30b5[1]
    sta l0070                                                         ; 31e8: 85 70       .p  :30b7[1]
    lda #$2e ; '.'                                                    ; 31ea: a9 2e       ..  :30b9[1]
    sta l0071                                                         ; 31ec: 85 71       .q  :30bb[1]
    lda #$ff                                                          ; 31ee: a9 ff       ..  :30bd[1]
    ldx l09df                                                         ; 31f0: ae df 09    ... :30bf[1]
    cpx #0                                                            ; 31f3: e0 00       ..  :30c2[1]
    beq c30ca                                                         ; 31f5: f0 04       ..  :30c4[1]
    cpx #$16                                                          ; 31f7: e0 16       ..  :30c6[1]
    bne c30d5                                                         ; 31f9: d0 0b       ..  :30c8[1]
; $31fb referenced 1 time by $30c4
c30ca
    lda #0                                                            ; 31fb: a9 00       ..  :30ca[1]
    ldx l09a8                                                         ; 31fd: ae a8 09    ... :30cc[1]
    cpx #$0f                                                          ; 3200: e0 0f       ..  :30cf[1]
    bne c30d5                                                         ; 3202: d0 02       ..  :30d1[1]
    lda #$81                                                          ; 3204: a9 81       ..  :30d3[1]
; $3206 referenced 2 times by $30c8, $30d1
c30d5
    ldx #0                                                            ; 3206: a2 00       ..  :30d5[1]
    ldy #$2f ; '/'                                                    ; 3208: a0 2f       ./  :30d7[1]
    jsr something18_TODO                                              ; 320a: 20 48 22     H" :30d9[1]
    rts                                                               ; 320d: 60          `   :30dc[1]

    !text "FGHIJKLM"                                                  ; 320e: 46 47 48... FGH :30dd[1]
    !byte   0, $52, $f7, $f9, $4e, $f7, $fa, $4f, $f7, $f9, $50, $f7  ; 3216: 00 52 f7... .R. :30e5[1]
    !byte $fa, $51, $f7, $f9, $51, $f7, $f9, $53, $f7, $fa, $54, $f8  ; 3222: fa 51 f7... .Q. :30f1[1]
    !byte $fa,   0,   0,   0,   0, $45,   0,   0, $45,   0,   0, $44  ; 322e: fa 00 00... ... :30fd[1]
    !byte   0,   0, $44,   0,   0, $51,   0,   0, $51,   0,   0,   0  ; 323a: 00 00 44... ..D :3109[1]
    !byte $51,   0,   0, $51,   0,   0, $44,   0,   0, $44,   0,   0  ; 3246: 51 00 00... Q.. :3115[1]
    !byte $45,   0,   0, $45,   0,   0,   0, $4e,   4,   0, $4f,   4  ; 3252: 45 00 00... E.. :3121[1]
    !byte   0, $50,   4,   0, $51,   4,   0,   0, $51,   0,   0, $51  ; 325e: 00 50 04... .P. :312d[1]
    !byte   2,   0,   0, $52,   4,   0,   0, $52,   0,   0,   0, $53  ; 326a: 02 00 00... ... :3139[1]
    !byte   0,   0,   0, $53,   0,   6,   0, $53,   0, $fc,   0, $54  ; 3276: 00 00 00... ... :3145[1]
    !byte   0, $fc, $53,   0, $fc,   0, $51,   7,   0, $51,   7,   1  ; 3282: 00 fc 53... ..S :3151[1]
    !byte $51,   6,   1, $51,   6,   2, $51,   4,   2, $51,   4,   3  ; 328e: 51 06 01... Q.. :315d[1]
    !byte $51,   3,   4, $51,   2,   4, $51,   2,   4, $51,   1,   5  ; 329a: 51 03 04... Q.. :3169[1]
    !byte $51,   1,   6,   0, $51,   0, $fc, $51,   0, $fd, $51,   0  ; 32a6: 51 01 06... Q.. :3175[1]
    !byte $fe, $51,   0, $ff,   0, $51,   6, $fc, $51,   6, $fe, $51  ; 32b2: fe 51 00... .Q. :3181[1]
    !byte   5, $fe, $51,   5, $ff, $51,   4,   0,   0, $51,   4,   1  ; 32be: 05 fe 51... ..Q :318d[1]
    !byte $51,   3,   2, $51,   3,   3, $51,   2,   4, $51,   2,   5  ; 32ca: 51 03 02... Q.. :3199[1]
    !byte $51,   1,   6,   0, $51,   4,   2, $51,   3,   3, $51,   2  ; 32d6: 51 01 06... Q.. :31a5[1]
    !byte   4, $51,   1,   5,   0, $51, $fc,   2, $51, $fd,   3, $51  ; 32e2: 04 51 01... .Q. :31b1[1]
    !byte $fe,   4, $51, $ff,   5,   0, $51,   0,   1, $51,   0,   2  ; 32ee: fe 04 51... ..Q :31bd[1]
    !byte $51,   0,   3, $51,   0,   4, $51,   0,   5,   0, $51,   0  ; 32fa: 51 00 03... Q.. :31c9[1]
    !byte   7,   0                                                    ; 3306: 07 00       ..  :31d5[1]
; $3308 referenced 3 times by $120e, $323a, $3333
l31d7
    !byte 0                                                           ; 3308: 00          .   :31d7[1]

; $3309 referenced 1 time by $22e9
c31d8
    lda #$16                                                          ; 3309: a9 16       ..  :31d8[1]
    sta l22ed                                                         ; 330b: 8d ed 22    .." :31da[1]
    ldx #$ff                                                          ; 330e: a2 ff       ..  :31dd[1]
    ldy #$30 ; '0'                                                    ; 3310: a0 30       .0  :31df[1]
    lda #3                                                            ; 3312: a9 03       ..  :31e1[1]
    jsr sub_c22ee                                                     ; 3314: 20 ee 22     ." :31e3[1]
    bne c31f4                                                         ; 3317: d0 0c       ..  :31e6[1]
    cpy #$39 ; '9'                                                    ; 3319: c0 39       .9  :31e8[1]
    bne c31f7                                                         ; 331b: d0 0b       ..  :31ea[1]
    lda l09be                                                         ; 331d: ad be 09    ... :31ec[1]
    eor #$fe                                                          ; 3320: 49 fe       I.  :31ef[1]
    sta l09be                                                         ; 3322: 8d be 09    ... :31f1[1]
; $3325 referenced 1 time by $31e6
c31f4
    jmp c3331                                                         ; 3325: 4c 31 33    L13 :31f4[1]

; $3328 referenced 1 time by $31ea
c31f7
    jsr sub_c23c4                                                     ; 3328: 20 c4 23     .# :31f7[1]
    beq c31ff                                                         ; 332b: f0 03       ..  :31fa[1]
    jmp c32b1                                                         ; 332d: 4c b1 32    L.2 :31fc[1]

; $3330 referenced 1 time by $31fa
c31ff
    lda l09df                                                         ; 3330: ad df 09    ... :31ff[1]
    cmp #$51 ; 'Q'                                                    ; 3333: c9 51       .Q  :3202[1]
    beq c3222                                                         ; 3335: f0 1c       ..  :3204[1]
    cmp #$49 ; 'I'                                                    ; 3337: c9 49       .I  :3206[1]
    beq c3222                                                         ; 3339: f0 18       ..  :3208[1]
    cmp #$45 ; 'E'                                                    ; 333b: c9 45       .E  :320a[1]
    beq c3222                                                         ; 333d: f0 14       ..  :320c[1]
    lda l3ac7                                                         ; 333f: ad c7 3a    ..: :320e[1]
    beq c3276                                                         ; 3342: f0 63       .c  :3211[1]
    jsr sub_c336e                                                     ; 3344: 20 6e 33     n3 :3213[1]
    beq c3276                                                         ; 3347: f0 5e       .^  :3216[1]
    lda #$51 ; 'Q'                                                    ; 3349: a9 51       .Q  :3218[1]
    sta l09df                                                         ; 334b: 8d df 09    ... :321a[1]
    ldy #$4d ; 'M'                                                    ; 334e: a0 4d       .M  :321d[1]
    jmp c3331                                                         ; 3350: 4c 31 33    L13 :321f[1]

; $3353 referenced 3 times by $3204, $3208, $320c
c3222
    ldx #$d4                                                          ; 3353: a2 d4       ..  :3222[1]
    jsr sub_c336e                                                     ; 3355: 20 6e 33     n3 :3224[1]
    beq c325f                                                         ; 3358: f0 36       .6  :3227[1]
    lda l3ac7                                                         ; 335a: ad c7 3a    ..: :3229[1]
    beq c324c                                                         ; 335d: f0 1e       ..  :322c[1]
    dec l2550                                                         ; 335f: ce 50 25    .P% :322e[1]
    lda #0                                                            ; 3362: a9 00       ..  :3231[1]
    jsr sub_c2894                                                     ; 3364: 20 94 28     .( :3233[1]
    bne c3247                                                         ; 3367: d0 0f       ..  :3236[1]
    ldx #$51 ; 'Q'                                                    ; 3369: a2 51       .Q  :3238[1]
    lda l31d7                                                         ; 336b: ad d7 31    ..1 :323a[1]
    bne c3247                                                         ; 336e: d0 08       ..  :323d[1]
    lda l3aca                                                         ; 3370: ad ca 3a    ..: :323f[1]
    ora l3acb                                                         ; 3373: 0d cb 3a    ..: :3242[1]
    beq c3269                                                         ; 3376: f0 22       ."  :3245[1]
; $3378 referenced 2 times by $3236, $323d
c3247
    ldx #$45 ; 'E'                                                    ; 3378: a2 45       .E  :3247[1]
    jmp c3269                                                         ; 337a: 4c 69 32    Li2 :3249[1]

; $337d referenced 1 time by $322c
c324c
    ldx #$58 ; 'X'                                                    ; 337d: a2 58       .X  :324c[1]
    lda l3ac9                                                         ; 337f: ad c9 3a    ..: :324e[1]
    cmp l09be                                                         ; 3382: cd be 09    ... :3251[1]
    beq c325f                                                         ; 3385: f0 09       ..  :3254[1]
    ldx #$49 ; 'I'                                                    ; 3387: a2 49       .I  :3256[1]
    lda l288f                                                         ; 3389: ad 8f 28    ..( :3258[1]
    beq c3269                                                         ; 338c: f0 0c       ..  :325b[1]
    bne c3276                                                         ; 338e: d0 17       ..  :325d[1]
; $3390 referenced 2 times by $3227, $3254
c325f
    lda #$d4                                                          ; 3390: a9 d4       ..  :325f[1]
    sta l09df                                                         ; 3392: 8d df 09    ... :3261[1]
    txa                                                               ; 3395: 8a          .   :3264[1]
    tay                                                               ; 3396: a8          .   :3265[1]
    jmp c3276                                                         ; 3397: 4c 76 32    Lv2 :3266[1]

; $339a referenced 3 times by $3245, $3249, $325b
c3269
    cpx l09df                                                         ; 339a: ec df 09    ... :3269[1]
    beq c3273                                                         ; 339d: f0 05       ..  :326c[1]
    txa                                                               ; 339f: 8a          .   :326e[1]
    tay                                                               ; 33a0: a8          .   :326f[1]
    sty l09df                                                         ; 33a1: 8c df 09    ... :3270[1]
; $33a4 referenced 4 times by $326c, $328b, $32b6, $32c2
c3273
    jmp c3331                                                         ; 33a4: 4c 31 33    L13 :3273[1]

; $33a7 referenced 4 times by $3211, $3216, $325d, $3266
c3276
    lda l09df                                                         ; 33a7: ad df 09    ... :3276[1]
    cmp #$7a ; 'z'                                                    ; 33aa: c9 7a       .z  :3279[1]
    bne c328d                                                         ; 33ac: d0 10       ..  :327b[1]
    dec l2550                                                         ; 33ae: ce 50 25    .P% :327d[1]
    lda #0                                                            ; 33b1: a9 00       ..  :3280[1]
    jsr sub_c2894                                                     ; 33b3: 20 94 28     .( :3282[1]
    bne c32ac                                                         ; 33b6: d0 25       .%  :3285[1]
    cpy #$7a ; 'z'                                                    ; 33b8: c0 7a       .z  :3287[1]
    beq c32ac                                                         ; 33ba: f0 21       .!  :3289[1]
    bne c3273                                                         ; 33bc: d0 e6       ..  :328b[1]
; $33be referenced 1 time by $327b
c328d
    lda l09df                                                         ; 33be: ad df 09    ... :328d[1]
    cmp #$87                                                          ; 33c1: c9 87       ..  :3290[1]
    bne c32ac                                                         ; 33c3: d0 18       ..  :3292[1]
    dec l2550                                                         ; 33c5: ce 50 25    .P% :3294[1]
    lda #0                                                            ; 33c8: a9 00       ..  :3297[1]
    jsr sub_c2894                                                     ; 33ca: 20 94 28     .( :3299[1]
    bne c32a5                                                         ; 33cd: d0 07       ..  :329c[1]
    cpy #$87                                                          ; 33cf: c0 87       ..  :329e[1]
    beq c32a5                                                         ; 33d1: f0 03       ..  :32a0[1]
    jmp c3331                                                         ; 33d3: 4c 31 33    L13 :32a2[1]

; $33d6 referenced 2 times by $329c, $32a0
c32a5
    lda #$d4                                                          ; 33d6: a9 d4       ..  :32a5[1]
    sta l09df                                                         ; 33d8: 8d df 09    ... :32a7[1]
    ldy #$97                                                          ; 33db: a0 97       ..  :32aa[1]
; $33dd referenced 3 times by $3285, $3289, $3292
c32ac
    lda l288f                                                         ; 33dd: ad 8f 28    ..( :32ac[1]
    bne c32c8                                                         ; 33e0: d0 17       ..  :32af[1]
; $33e2 referenced 1 time by $31fc
c32b1
    lda #$d4                                                          ; 33e2: a9 d4       ..  :32b1[1]
    cmp l09df                                                         ; 33e4: cd df 09    ... :32b3[1]
    beq c3273                                                         ; 33e7: f0 bb       ..  :32b6[1]
    ldx l09df                                                         ; 33e9: ae df 09    ... :32b8[1]
    sta l09df                                                         ; 33ec: 8d df 09    ... :32bb[1]
    ldy #$c4                                                          ; 33ef: a0 c4       ..  :32be[1]
    cpx #$49 ; 'I'                                                    ; 33f1: e0 49       .I  :32c0[1]
    bne c3273                                                         ; 33f3: d0 af       ..  :32c2[1]
    tay                                                               ; 33f5: a8          .   :32c4[1]
    jmp c3331                                                         ; 33f6: 4c 31 33    L13 :32c5[1]

; $33f9 referenced 1 time by $32af
c32c8
    ldx l3ac9                                                         ; 33f9: ae c9 3a    ..: :32c8[1]
    bne c32de                                                         ; 33fc: d0 11       ..  :32cb[1]
    lda l3ac7                                                         ; 33fe: ad c7 3a    ..: :32cd[1]
    beq c3301                                                         ; 3401: f0 2f       ./  :32d0[1]
    lda l09df                                                         ; 3403: ad df 09    ... :32d2[1]
    cmp #$d4                                                          ; 3406: c9 d4       ..  :32d5[1]
    beq c3301                                                         ; 3408: f0 28       .(  :32d7[1]
    lda #$7a ; 'z'                                                    ; 340a: a9 7a       .z  :32d9[1]
    jmp c32f5                                                         ; 340c: 4c f5 32    L.2 :32db[1]

; $340f referenced 1 time by $32cb
c32de
    lda #$36 ; '6'                                                    ; 340f: a9 36       .6  :32de[1]
    cpx l09be                                                         ; 3411: ec be 09    ... :32e0[1]
    bne c32f5                                                         ; 3414: d0 10       ..  :32e3[1]
    lda #$29 ; ')'                                                    ; 3416: a9 29       .)  :32e5[1]
    ldx l3ac7                                                         ; 3418: ae c7 3a    ..: :32e7[1]
    beq c32f5                                                         ; 341b: f0 09       ..  :32ea[1]
    ldx l09df                                                         ; 341d: ae df 09    ... :32ec[1]
    cpx #$d4                                                          ; 3420: e0 d4       ..  :32ef[1]
    beq c32f5                                                         ; 3422: f0 02       ..  :32f1[1]
    lda #$87                                                          ; 3424: a9 87       ..  :32f3[1]
; $3426 referenced 4 times by $32db, $32e3, $32ea, $32f1
c32f5
    cmp l09df                                                         ; 3426: cd df 09    ... :32f5[1]
    beq c3316                                                         ; 3429: f0 1c       ..  :32f8[1]
    sta l09df                                                         ; 342b: 8d df 09    ... :32fa[1]
    tay                                                               ; 342e: a8          .   :32fd[1]
    jmp c3316                                                         ; 342f: 4c 16 33    L.3 :32fe[1]

; $3432 referenced 2 times by $32d0, $32d7
c3301
    lda l09df                                                         ; 3432: ad df 09    ... :3301[1]
    ldy #$41 ; 'A'                                                    ; 3435: a0 41       .A  :3304[1]
    sty l09df                                                         ; 3437: 8c df 09    ... :3306[1]
    cmp #$29 ; ')'                                                    ; 343a: c9 29       .)  :3309[1]
    beq c3311                                                         ; 343c: f0 04       ..  :330b[1]
    cmp #$36 ; '6'                                                    ; 343e: c9 36       .6  :330d[1]
    bne c3316                                                         ; 3440: d0 05       ..  :330f[1]
; $3442 referenced 1 time by $330b
c3311
    ldy #$3d ; '='                                                    ; 3442: a0 3d       .=  :3311[1]
    jmp c3316                                                         ; 3444: 4c 16 33    L.3 :3313[1]

; $3447 referenced 4 times by $32f8, $32fe, $330f, $3313
c3316
    ldx #0                                                            ; 3447: a2 00       ..  :3316[1]
    lda l3ac9                                                         ; 3449: ad c9 3a    ..: :3318[1]
    beq c331e                                                         ; 344c: f0 01       ..  :331b[1]
    inx                                                               ; 344e: e8          .   :331d[1]
; $344f referenced 1 time by $331b
c331e
    lda l2890,x                                                       ; 344f: bd 90 28    ..( :331e[1]
    beq c3331                                                         ; 3452: f0 0e       ..  :3321[1]
    ldy #$d4                                                          ; 3454: a0 d4       ..  :3323[1]
    sty l09df                                                         ; 3456: 8c df 09    ... :3325[1]
    ldy #$aa                                                          ; 3459: a0 aa       ..  :3328[1]
    cmp l09be                                                         ; 345b: cd be 09    ... :332a[1]
    beq c3331                                                         ; 345e: f0 02       ..  :332d[1]
    ldy #$b7                                                          ; 3460: a0 b7       ..  :332f[1]
; $3462 referenced 7 times by $31f4, $321f, $3273, $32a2, $32c5, $3321, $332d
c3331
    lda #0                                                            ; 3462: a9 00       ..  :3331[1]
    sta l31d7                                                         ; 3464: 8d d7 31    ..1 :3333[1]
    sty l09d4                                                         ; 3467: 8c d4 09    ... :3336[1]
    tya                                                               ; 346a: 98          .   :3339[1]
    ldx #$ff                                                          ; 346b: a2 ff       ..  :333a[1]
    ldy #$30 ; '0'                                                    ; 346d: a0 30       .0  :333c[1]
    jsr something17_TODO                                              ; 346f: 20 00 22     ." :333e[1]
    lda #0                                                            ; 3472: a9 00       ..  :3341[1]
    jsr sub_c25f5                                                     ; 3474: 20 f5 25     .% :3343[1]
    lda #$dd                                                          ; 3477: a9 dd       ..  :3346[1]
    sta l0070                                                         ; 3479: 85 70       .p  :3348[1]
    lda #$30 ; '0'                                                    ; 347b: a9 30       .0  :334a[1]
    sta l0071                                                         ; 347d: 85 71       .q  :334c[1]
    lda #$ff                                                          ; 347f: a9 ff       ..  :334e[1]
    ldx l09df                                                         ; 3481: ae df 09    ... :3350[1]
    cpx #0                                                            ; 3484: e0 00       ..  :3353[1]
    beq c335b                                                         ; 3486: f0 04       ..  :3355[1]
    cpx #$16                                                          ; 3488: e0 16       ..  :3357[1]
    bne c3366                                                         ; 348a: d0 0b       ..  :3359[1]
; $348c referenced 1 time by $3355
c335b
    lda #0                                                            ; 348c: a9 00       ..  :335b[1]
    ldx l09a8                                                         ; 348e: ae a8 09    ... :335d[1]
    cpx #$51 ; 'Q'                                                    ; 3491: e0 51       .Q  :3360[1]
    bne c3366                                                         ; 3493: d0 02       ..  :3362[1]
    lda #$87                                                          ; 3495: a9 87       ..  :3364[1]
; $3497 referenced 2 times by $3359, $3362
c3366
    ldx #$e6                                                          ; 3497: a2 e6       ..  :3366[1]
    ldy #$30 ; '0'                                                    ; 3499: a0 30       .0  :3368[1]
    jsr something18_TODO                                              ; 349b: 20 48 22     H" :336a[1]
    rts                                                               ; 349e: 60          `   :336d[1]

; $349f referenced 2 times by $3213, $3224
sub_c336e
    txa                                                               ; 349f: 8a          .   :336e[1]
    pha                                                               ; 34a0: 48          H   :336f[1]
    tya                                                               ; 34a1: 98          .   :3370[1]
    pha                                                               ; 34a2: 48          H   :3371[1]
    ldx #0                                                            ; 34a3: a2 00       ..  :3372[1]
    jsr sub_c24d2                                                     ; 34a5: 20 d2 24     .$ :3374[1]
    lda l0074                                                         ; 34a8: a5 74       .t  :3377[1]
    clc                                                               ; 34aa: 18          .   :3379[1]
    adc l0076                                                         ; 34ab: 65 76       ev  :337a[1]
    sta l0071                                                         ; 34ad: 85 71       .q  :337c[1]
    lda l0075                                                         ; 34af: a5 75       .u  :337e[1]
    adc l0077                                                         ; 34b1: 65 77       ew  :3380[1]
    ror                                                               ; 34b3: 6a          j   :3382[1]
    ror l0071                                                         ; 34b4: 66 71       fq  :3383[1]
    lsr                                                               ; 34b6: 4a          J   :3385[1]
    ror l0071                                                         ; 34b7: 66 71       fq  :3386[1]
    lsr                                                               ; 34b9: 4a          J   :3388[1]
    ror l0071                                                         ; 34ba: 66 71       fq  :3389[1]
    lsr                                                               ; 34bc: 4a          J   :338b[1]
    ror l0071                                                         ; 34bd: 66 71       fq  :338c[1]
    ldy l0071                                                         ; 34bf: a4 71       .q  :338e[1]
    lda #$ff                                                          ; 34c1: a9 ff       ..  :3390[1]
    sta l0044                                                         ; 34c3: 85 44       .D  :3392[1]
    lda #5                                                            ; 34c5: a9 05       ..  :3394[1]
    sta l3403                                                         ; 34c7: 8d 03 34    ..4 :3396[1]
; $34ca referenced 1 time by $33e7
c3399
    lda l09be                                                         ; 34ca: ad be 09    ... :3399[1]
    bmi c33b5                                                         ; 34cd: 30 17       0.  :339c[1]
    lda l0950                                                         ; 34cf: ad 50 09    .P. :339e[1]
    clc                                                               ; 34d2: 18          .   :33a1[1]
    adc l3403                                                         ; 34d3: 6d 03 34    m.4 :33a2[1]
    sta l0070                                                         ; 34d6: 85 70       .p  :33a5[1]
    and #$f8                                                          ; 34d8: 29 f8       ).  :33a7[1]
    sta l0072                                                         ; 34da: 85 72       .r  :33a9[1]
    lda l0966                                                         ; 34dc: ad 66 09    .f. :33ab[1]
    adc #0                                                            ; 34df: 69 00       i.  :33ae[1]
    sta l0073                                                         ; 34e1: 85 73       .s  :33b0[1]
    jmp c33cb                                                         ; 34e3: 4c cb 33    L.3 :33b2[1]

; $34e6 referenced 1 time by $339c
c33b5
    lda l0950                                                         ; 34e6: ad 50 09    .P. :33b5[1]
    sec                                                               ; 34e9: 38          8   :33b8[1]
    sbc l3403                                                         ; 34ea: ed 03 34    ..4 :33b9[1]
    sta l0070                                                         ; 34ed: 85 70       .p  :33bc[1]
    and #$f8                                                          ; 34ef: 29 f8       ).  :33be[1]
    ora #7                                                            ; 34f1: 09 07       ..  :33c0[1]
    sta l0072                                                         ; 34f3: 85 72       .r  :33c2[1]
    lda l0966                                                         ; 34f5: ad 66 09    .f. :33c4[1]
    sbc #0                                                            ; 34f8: e9 00       ..  :33c7[1]
    sta l0073                                                         ; 34fa: 85 73       .s  :33c9[1]
; $34fc referenced 1 time by $33b2
c33cb
    lsr                                                               ; 34fc: 4a          J   :33cb[1]
    ror l0070                                                         ; 34fd: 66 70       fp  :33cc[1]
    lsr                                                               ; 34ff: 4a          J   :33ce[1]
    ror l0070                                                         ; 3500: 66 70       fp  :33cf[1]
    lsr                                                               ; 3502: 4a          J   :33d1[1]
    ror l0070                                                         ; 3503: 66 70       fp  :33d2[1]
    ldx l0070                                                         ; 3505: a6 70       .p  :33d4[1]
    jsr sub_c1efa                                                     ; 3507: 20 fa 1e     .. :33d6[1]
    cmp #2                                                            ; 350a: c9 02       ..  :33d9[1]
    beq c33ea                                                         ; 350c: f0 0d       ..  :33db[1]
    lda #2                                                            ; 350e: a9 02       ..  :33dd[1]
    cmp l3403                                                         ; 3510: cd 03 34    ..4 :33df[1]
    beq c33f8                                                         ; 3513: f0 14       ..  :33e2[1]
    sta l3403                                                         ; 3515: 8d 03 34    ..4 :33e4[1]
    jmp c3399                                                         ; 3518: 4c 99 33    L.3 :33e7[1]

; $351b referenced 1 time by $33db
c33ea
    lda l0072                                                         ; 351b: a5 72       .r  :33ea[1]
    sta l0950                                                         ; 351d: 8d 50 09    .P. :33ec[1]
    lda l0073                                                         ; 3520: a5 73       .s  :33ef[1]
    sta l0966                                                         ; 3522: 8d 66 09    .f. :33f1[1]
    lda #$ff                                                          ; 3525: a9 ff       ..  :33f4[1]
    bne c33fa                                                         ; 3527: d0 02       ..  :33f6[1]
; $3529 referenced 1 time by $33e2
c33f8
    lda #0                                                            ; 3529: a9 00       ..  :33f8[1]
; $352b referenced 1 time by $33f6
c33fa
    sta l0070                                                         ; 352b: 85 70       .p  :33fa[1]
    pla                                                               ; 352d: 68          h   :33fc[1]
    tay                                                               ; 352e: a8          .   :33fd[1]
    pla                                                               ; 352f: 68          h   :33fe[1]
    tax                                                               ; 3530: aa          .   :33ff[1]
    lda l0070                                                         ; 3531: a5 70       .p  :3400[1]
    rts                                                               ; 3533: 60          `   :3402[1]

; $3534 referenced 5 times by $3396, $33a2, $33b9, $33df, $33e4
l3403
    !byte 0                                                           ; 3534: 00          .   :3403[1]

; $3535 referenced 1 time by $2afc
c3404
    lda #$12                                                          ; 3535: a9 12       ..  :3404[1]
    sta l0409                                                         ; 3537: 8d 09 04    ... :3406[1]
    lda l0004                                                         ; 353a: a5 04       ..  :3409[1]
    bne c3428                                                         ; 353c: d0 1b       ..  :340b[1]
; $353e referenced 1 time by $359b
c340d
    jsr sub_c040a                                                     ; 353e: 20 0a 04     .. :340d[1]
    lda #1                                                            ; 3541: a9 01       ..  :3410[1]
    sta l0004                                                         ; 3543: 85 04       ..  :3412[1]
    ldx #$2b ; '+'                                                    ; 3545: a2 2b       .+  :3414[1]
    ldy #$34 ; '4'                                                    ; 3547: a0 34       .4  :3416[1]
    jsr c381c                                                         ; 3549: 20 1c 38     .8 :3418[1]
    jsr sub_c3850                                                     ; 354c: 20 50 38     P8 :341b[1]
    ldx #$3b ; ';'                                                    ; 354f: a2 3b       .;  :341e[1]
    ldy #$34 ; '4'                                                    ; 3551: a0 34       .4  :3420[1]
    jsr c381c                                                         ; 3553: 20 1c 38     .8 :3422[1]
    jmp c3872                                                         ; 3556: 4c 72 38    Lr8 :3425[1]

; $3559 referenced 1 time by $340b
c3428
    jmp something_TODO                                                ; 3559: 4c 53 04    LS. :3428[1]

    !byte $9b, $b9, $ae, $b8, $b8, $eb, $98, $eb, $bf, $a4, $eb, $b8  ; 355c: 9b b9 ae... ... :342b[1]
    !byte $aa, $bd, $ae, $c6, $9b, $b9, $ae, $b8, $b8, $eb, $87, $eb  ; 3568: aa bd ae... ... :3437[1]
    !byte $bf, $a4, $eb, $a7, $a4, $aa, $af, $c6                      ; 3574: bf a4 eb... ... :3443[1]

; $357c referenced 1 time by $2aa6
sub_c344b
    ldy l0029                                                         ; 357c: a4 29       .)  :344b[1]
    lda l295c,y                                                       ; 357e: b9 5c 29    .\) :344d[1]
    cmp #3                                                            ; 3581: c9 03       ..  :3450[1]
    bne c3496                                                         ; 3583: d0 42       .B  :3452[1]
    lda l0004                                                         ; 3585: a5 04       ..  :3454[1]
    beq c3496                                                         ; 3587: f0 3e       .>  :3456[1]
    cmp #1                                                            ; 3589: c9 01       ..  :3458[1]
    beq c346a                                                         ; 358b: f0 0e       ..  :345a[1]
    cmp #2                                                            ; 358d: c9 02       ..  :345c[1]
    beq c34a7                                                         ; 358f: f0 47       .G  :345e[1]
    cmp #3                                                            ; 3591: c9 03       ..  :3460[1]
    beq c3467                                                         ; 3593: f0 03       ..  :3462[1]
    jmp c3557                                                         ; 3595: 4c 57 35    LW5 :3464[1]

; $3598 referenced 1 time by $3462
c3467
    jmp c3501                                                         ; 3598: 4c 01 35    L.5 :3467[1]

; $359b referenced 1 time by $345a
c346a
    lda #0                                                            ; 359b: a9 00       ..  :346a[1]
    sta l3497                                                         ; 359d: 8d 97 34    ..4 :346c[1]
    jsr inkey                                                         ; 35a0: 20 7c 38     |8 :346f[1]
    and #$df                                                          ; 35a3: 29 df       ).  :3472[1]
    cmp #$53 ; 'S'                                                    ; 35a5: c9 53       .S  :3474[1]
    beq c347f                                                         ; 35a7: f0 07       ..  :3476[1]
    cmp #$4c ; 'L'                                                    ; 35a9: c9 4c       .L  :3478[1]
    bne c3496                                                         ; 35ab: d0 1a       ..  :347a[1]
    dec l3497                                                         ; 35ad: ce 97 34    ..4 :347c[1]
; $35b0 referenced 1 time by $3476
c347f
    jsr sub_c040a                                                     ; 35b0: 20 0a 04     .. :347f[1]
    lda #2                                                            ; 35b3: a9 02       ..  :3482[1]
    sta l0004                                                         ; 35b5: 85 04       ..  :3484[1]
    ldx #$98                                                          ; 35b7: a2 98       ..  :3486[1]
    ldy #$34 ; '4'                                                    ; 35b9: a0 34       .4  :3488[1]
    jsr c381c                                                         ; 35bb: 20 1c 38     .8 :348a[1]
    jsr sub_c3850                                                     ; 35be: 20 50 38     P8 :348d[1]
    jsr sub_c385d                                                     ; 35c1: 20 5d 38     ]8 :3490[1]
    jmp c3872                                                         ; 35c4: 4c 72 38    Lr8 :3493[1]

; $35c7 referenced 4 times by $3452, $3456, $347a, $34ae
c3496
    rts                                                               ; 35c7: 60          `   :3496[1]

; $35c8 referenced 6 times by $346c, $347c, $356a, $357e, $35c0, $35e5
l3497
    !byte   0, $8e, $a5, $bf, $ae, $b9, $eb, $ad, $a2, $a7, $ae, $a5  ; 35c8: 00 8e a5... ... :3497[1]
    !byte $aa, $a6, $ae, $c6                                          ; 35d4: aa a6 ae... ... :34a3[1]

; $35d8 referenced 1 time by $345e
c34a7
    lda #7                                                            ; 35d8: a9 07       ..  :34a7[1]
    jsr sub_c36fc                                                     ; 35da: 20 fc 36     .6 :34a9[1]
    ldy l0005                                                         ; 35dd: a4 05       ..  :34ac[1]
    beq c3496                                                         ; 35df: f0 e6       ..  :34ae[1]
    ldy #6                                                            ; 35e1: a0 06       ..  :34b0[1]
; $35e3 referenced 1 time by $34b9
loop_c34b2
    lda l0a90,y                                                       ; 35e3: b9 90 0a    ... :34b2[1]
    sta l34db,y                                                       ; 35e6: 99 db 34    ..4 :34b5[1]
    dey                                                               ; 35e9: 88          .   :34b8[1]
    bpl loop_c34b2                                                    ; 35ea: 10 f7       ..  :34b9[1]
    jsr sub_c040a                                                     ; 35ec: 20 0a 04     .. :34bb[1]
    lda #3                                                            ; 35ef: a9 03       ..  :34be[1]
    sta l0004                                                         ; 35f1: 85 04       ..  :34c0[1]
    ldx #$e3                                                          ; 35f3: a2 e3       ..  :34c2[1]
    ldy #$34 ; '4'                                                    ; 35f5: a0 34       .4  :34c4[1]
    jsr c381c                                                         ; 35f7: 20 1c 38     .8 :34c6[1]
    jsr sub_c3850                                                     ; 35fa: 20 50 38     P8 :34c9[1]
    ldx #$f0                                                          ; 35fd: a2 f0       ..  :34cc[1]
    ldy #$34 ; '4'                                                    ; 35ff: a0 34       .4  :34ce[1]
    jsr c381c                                                         ; 3601: 20 1c 38     .8 :34d0[1]
    jmp c3872                                                         ; 3604: 4c 72 38    Lr8 :34d3[1]

    !byte $3a                                                         ; 3607: 3a          :   :34d6[1]
; $3608 referenced 2 times by $3516, $35d5
l34d7
    !text "0.I."                                                      ; 3608: 30 2e 49... 0.I :34d7[1]
; $360c referenced 1 time by $34b5
l34db
    !text "......."                                                   ; 360c: 2e 2e 2e... ... :34db[1]
    !byte $0d, $9c, $a3, $a2, $a8, $a3, $eb, $af, $b9, $a2, $bd, $ae  ; 3613: 0d 9c a3... ... :34e2[1]
    !byte $f4, $c6, $9b, $b9, $ae, $b8, $b8, $eb, $fb, $e7, $fa, $e7  ; 361f: f4 c6 9b... ... :34ee[1]
    !byte $f9, $eb, $a4, $b9, $eb, $f8, $c6                           ; 362b: f9 eb a4... ... :34fa[1]

; $3632 referenced 1 time by $3467
c3501
    jsr inkey                                                         ; 3632: 20 7c 38     |8 :3501[1]
    cmp #$34 ; '4'                                                    ; 3635: c9 34       .4  :3504[1]
    bcs c3534                                                         ; 3637: b0 2c       .,  :3506[1]
    cmp #$30 ; '0'                                                    ; 3639: c9 30       .0  :3508[1]
    bcs c3516                                                         ; 363b: b0 0a       ..  :350a[1]
    cmp #$24 ; '$'                                                    ; 363d: c9 24       .$  :350c[1]
    bcs c3534                                                         ; 363f: b0 24       .$  :350e[1]
    cmp #$21 ; '!'                                                    ; 3641: c9 21       .!  :3510[1]
    bcc c3534                                                         ; 3643: 90 20       .   :3512[1]
    adc #$0f                                                          ; 3645: 69 0f       i.  :3514[1]
; $3647 referenced 1 time by $350a
c3516
    sta l34d7                                                         ; 3647: 8d d7 34    ..4 :3516[1]
    jsr sub_c040a                                                     ; 364a: 20 0a 04     .. :3519[1]
    lda #4                                                            ; 364d: a9 04       ..  :351c[1]
    sta l0004                                                         ; 364f: 85 04       ..  :351e[1]
    ldx #$35 ; '5'                                                    ; 3651: a2 35       .5  :3520[1]
    ldy #$35 ; '5'                                                    ; 3653: a0 35       .5  :3522[1]
    jsr c381c                                                         ; 3655: 20 1c 38     .8 :3524[1]
    jsr sub_c3850                                                     ; 3658: 20 50 38     P8 :3527[1]
    ldx #$46 ; 'F'                                                    ; 365b: a2 46       .F  :352a[1]
    ldy #$35 ; '5'                                                    ; 365d: a0 35       .5  :352c[1]
    jsr c381c                                                         ; 365f: 20 1c 38     .8 :352e[1]
    jmp c3872                                                         ; 3662: 4c 72 38    Lr8 :3531[1]

; $3665 referenced 4 times by $3506, $350e, $3512, $355c
c3534
    rts                                                               ; 3665: 60          `   :3534[1]

    !byte $82, $a5, $b8, $ae, $b9, $bf, $eb, $b8, $aa, $bd, $ae, $eb  ; 3666: 82 a5 b8... ... :3535[1]
    !byte $af, $a2, $b8, $a0, $c6, $aa, $a5, $af, $eb, $bb, $b9, $ae  ; 3672: af a2 b8... ... :3541[1]
    !byte $b8, $b8, $eb, $99, $8e, $9f, $9e, $99, $85, $c6            ; 367e: b8 b8 eb... ... :354d[1]

; $3688 referenced 1 time by $3464
c3557
    jsr inkey                                                         ; 3688: 20 7c 38     |8 :3557[1]
    cmp #$0d                                                          ; 368b: c9 0d       ..  :355a[1]
    bne c3534                                                         ; 368d: d0 d6       ..  :355c[1]
    jsr sub_c040a                                                     ; 368f: 20 0a 04     .. :355e[1]
    lda #$0a                                                          ; 3692: a9 0a       ..  :3561[1]
    jsr oswrch                                                        ; 3694: 20 ee ff     .. :3563[1]   ; Write character 10
    ldx #$f7                                                          ; 3697: a2 f7       ..  :3566[1]
    ldy #$35 ; '5'                                                    ; 3699: a0 35       .5  :3568[1]
    lda l3497                                                         ; 369b: ad 97 34    ..4 :356a[1]
    beq c3573                                                         ; 369e: f0 04       ..  :356d[1]
    ldx #$fe                                                          ; 36a0: a2 fe       ..  :356f[1]
    ldy #$35 ; '5'                                                    ; 36a2: a0 35       .5  :3571[1]
; $36a4 referenced 1 time by $356d
c3573
    jsr sub_c37f3                                                     ; 36a4: 20 f3 37     .7 :3573[1]
    lda #$d6                                                          ; 36a7: a9 d6       ..  :3576[1]
    sta l0070                                                         ; 36a9: 85 70       .p  :3578[1]
    lda #$34 ; '4'                                                    ; 36ab: a9 34       .4  :357a[1]
    sta l0071                                                         ; 36ad: 85 71       .q  :357c[1]
    lda l3497                                                         ; 36af: ad 97 34    ..4 :357e[1]
    beq c359e                                                         ; 36b2: f0 1b       ..  :3581[1]
    lda #5                                                            ; 36b4: a9 05       ..  :3583[1]
    jsr osfile_wrapper                                                ; 36b6: 20 dc 16     .. :3585[1]
    bne c359b                                                         ; 36b9: d0 11       ..  :3588[1]
    lda l007b                                                         ; 36bb: a5 7b       .{  :358a[1]
    ora l007c                                                         ; 36bd: 05 7c       .|  :358c[1]
    ora l007d                                                         ; 36bf: 05 7d       .}  :358e[1]
    bne c3598                                                         ; 36c1: d0 06       ..  :3590[1]
    lda l007a                                                         ; 36c3: a5 7a       .z  :3592[1]
    cmp #$85                                                          ; 36c5: c9 85       ..  :3594[1]
    beq c35bc                                                         ; 36c7: f0 24       .$  :3596[1]
; $36c9 referenced 1 time by $3590
c3598
    jsr sub_c1728                                                     ; 36c9: 20 28 17     (. :3598[1]
; $36cc referenced 2 times by $3588, $35c6
c359b
    jmp c340d                                                         ; 36cc: 4c 0d 34    L.4 :359b[1]

; $36cf referenced 1 time by $3581
c359e
    jsr something6_TODO                                               ; 36cf: 20 c3 0a     .. :359e[1]
    sta l09eb                                                         ; 36d2: 8d eb 09    ... :35a1[1]
    ldx #0                                                            ; 36d5: a2 00       ..  :35a4[1]
    ldy #0                                                            ; 36d7: a0 00       ..  :35a6[1]
    stx l0076                                                         ; 36d9: 86 76       .v  :35a8[1]
    stx l0077                                                         ; 36db: 86 77       .w  :35aa[1]
    lda #$ea                                                          ; 36dd: a9 ea       ..  :35ac[1]
    sta l007a                                                         ; 36df: 85 7a       .z  :35ae[1]
    lda #9                                                            ; 36e1: a9 09       ..  :35b0[1]
    sta l007b                                                         ; 36e3: 85 7b       .{  :35b2[1]
    lda #$6f ; 'o'                                                    ; 36e5: a9 6f       .o  :35b4[1]
    sta l007e                                                         ; 36e7: 85 7e       .~  :35b6[1]
    lda #$0a                                                          ; 36e9: a9 0a       ..  :35b8[1]
    sta l007f                                                         ; 36eb: 85 7f       ..  :35ba[1]
; $36ed referenced 1 time by $3596
c35bc
    ldx #$ea                                                          ; 36ed: a2 ea       ..  :35bc[1]
    ldy #9                                                            ; 36ef: a0 09       ..  :35be[1]
    lda l3497                                                         ; 36f1: ad 97 34    ..4 :35c0[1]
    jsr osfile_wrapper                                                ; 36f4: 20 dc 16     .. :35c3[1]
    bne c359b                                                         ; 36f7: d0 d3       ..  :35c6[1]
    jsr something6_TODO                                               ; 36f9: 20 c3 0a     .. :35c8[1]
    cmp l09eb                                                         ; 36fc: cd eb 09    ... :35cb[1]
    beq c35d5                                                         ; 36ff: f0 05       ..  :35ce[1]
    lda #$ff                                                          ; 3701: a9 ff       ..  :35d0[1]
    sta l09ea                                                         ; 3703: 8d ea 09    ... :35d2[1]
; $3706 referenced 1 time by $35ce
c35d5
    lda l34d7                                                         ; 3706: ad d7 34    ..4 :35d5[1]
    sec                                                               ; 3709: 38          8   :35d8[1]
    sbc #$30 ; '0'                                                    ; 370a: e9 30       .0  :35d9[1]
    and #1                                                            ; 370c: 29 01       ).  :35db[1]
    bne c35e2                                                         ; 370e: d0 03       ..  :35dd[1]
    jsr sub_c3617                                                     ; 3710: 20 17 36     .6 :35df[1]
; $3713 referenced 1 time by $35dd
c35e2
    jsr c3a8f                                                         ; 3713: 20 8f 3a     .: :35e2[1]
    lda l3497                                                         ; 3716: ad 97 34    ..4 :35e5[1]
    bne c35ed                                                         ; 3719: d0 03       ..  :35e8[1]
    jmp something_TODO                                                ; 371b: 4c 53 04    LS. :35ea[1]

; $371e referenced 1 time by $35e8
c35ed
    lda #$ff                                                          ; 371e: a9 ff       ..  :35ed[1]
    sta l0031                                                         ; 3720: 85 31       .1  :35ef[1]
    lda l09ea                                                         ; 3722: ad ea 09    ... :35f1[1]
    jmp c36db                                                         ; 3725: 4c db 36    L.6 :35f4[1]

    !byte $98, $aa, $bd, $a2, $a5, $ac, $c6, $87, $a4, $aa, $af, $a2  ; 3728: 98 aa bd... ... :35f7[1]
    !byte $a5, $ac, $c6, $82, $a5, $b8, $ae, $b9, $bf, $eb, $ac, $aa  ; 3734: a5 ac c6... ... :3603[1]
    !byte $a6, $ae, $eb, $af, $a2, $b8, $a0, $c6                      ; 3740: a6 ae eb... ... :360f[1]

; $3748 referenced 4 times by $116b, $35df, $36bb, $36cc
sub_c3617
    jsr sub_c040a                                                     ; 3748: 20 0a 04     .. :3617[1]
    ldx #6                                                            ; 374b: a2 06       ..  :361a[1]
    ldy #$36 ; '6'                                                    ; 374d: a0 36       .6  :361c[1]
    jsr c381c                                                         ; 374f: 20 1c 38     .8 :361e[1]
    jsr sub_c3850                                                     ; 3752: 20 50 38     P8 :3621[1]
    ldx #$46 ; 'F'                                                    ; 3755: a2 46       .F  :3624[1]
    ldy #$35 ; '5'                                                    ; 3757: a0 35       .5  :3626[1]
    jsr c381c                                                         ; 3759: 20 1c 38     .8 :3628[1]
    jsr c3872                                                         ; 375c: 20 72 38     r8 :362b[1]
; $375f referenced 1 time by $3633
wait_for_return
    jsr inkey                                                         ; 375f: 20 7c 38     |8 :362e[1]
    cmp #vdu_cr                                                       ; 3762: c9 0d       ..  :3631[1]
    bne wait_for_return                                               ; 3764: d0 f9       ..  :3633[1]
    rts                                                               ; 3766: 60          `   :3635[1]

; $3767 referenced 1 time by $2af9
c3636
    lda #$12                                                          ; 3767: a9 12       ..  :3636[1]
    sta l0409                                                         ; 3769: 8d 09 04    ... :3638[1]
    lda l0004                                                         ; 376c: a5 04       ..  :363b[1]
    bne c3652                                                         ; 376e: d0 13       ..  :363d[1]
; $3770 referenced 1 time by $36d7
c363f
    jsr sub_c040a                                                     ; 3770: 20 0a 04     .. :363f[1]
    ldx #$55 ; 'U'                                                    ; 3773: a2 55       .U  :3642[1]
    ldy #$36 ; '6'                                                    ; 3775: a0 36       .6  :3644[1]
    jsr c381c                                                         ; 3777: 20 1c 38     .8 :3646[1]
    jsr sub_c3850                                                     ; 377a: 20 50 38     P8 :3649[1]
    jsr sub_c385d                                                     ; 377d: 20 5d 38     ]8 :364c[1]
    jmp c3872                                                         ; 3780: 4c 72 38    Lr8 :364f[1]

; $3783 referenced 1 time by $363d
c3652
    jmp something_TODO                                                ; 3783: 4c 53 04    LS. :3652[1]

    !byte $8e, $a5, $bf, $ae, $b9, $eb, $bb, $aa, $b8, $b8, $bc, $a4  ; 3786: 8e a5 bf... ... :3655[1]
    !byte $b9, $af, $c6                                               ; 3792: b9 af c6    ... :3661[1]

; $3795 referenced 1 time by $2aa3
sub_c3664
    ldy l0029                                                         ; 3795: a4 29       .)  :3664[1]
    lda l295c,y                                                       ; 3797: b9 5c 29    .\) :3666[1]
    cmp #8                                                            ; 379a: c9 08       ..  :3669[1]
    bne c36a7                                                         ; 379c: d0 3a       .:  :366b[1]
    lda l0004                                                         ; 379e: a5 04       ..  :366d[1]
    beq c36a7                                                         ; 37a0: f0 36       .6  :366f[1]
    lda #$10                                                          ; 37a2: a9 10       ..  :3671[1]
    jsr sub_c36fc                                                     ; 37a4: 20 fc 36     .6 :3673[1]
    ldy l0005                                                         ; 37a7: a4 05       ..  :3676[1]
    beq c3698                                                         ; 37a9: f0 1e       ..  :3678[1]
    lda copy_protection_flag                                          ; 37ab: ad 03 11    ... :367a[1]
    and #1                                                            ; 37ae: 29 01       ).  :367d[1]
    beq c36a8                                                         ; 37b0: f0 27       .'  :367f[1]
    cpy #2                                                            ; 37b2: c0 02       ..  :3681[1]
    bne c36a8                                                         ; 37b4: d0 23       .#  :3683[1]
    lda l0a90                                                         ; 37b6: ad 90 0a    ... :3685[1]
    cmp #$41 ; 'A'                                                    ; 37b9: c9 41       .A  :3688[1]
    bcc c36a8                                                         ; 37bb: 90 1c       ..  :368a[1]
    cmp #$52 ; 'R'                                                    ; 37bd: c9 52       .R  :368c[1]
    bcs c36a8                                                         ; 37bf: b0 18       ..  :368e[1]
    pha                                                               ; 37c1: 48          H   :3690[1]
    jsr something_TODO                                                ; 37c2: 20 53 04     S. :3691[1]
    pla                                                               ; 37c5: 68          h   :3694[1]
    jmp c36db                                                         ; 37c6: 4c db 36    L.6 :3695[1]

; $37c9 referenced 1 time by $3678
c3698
    lda copy_protection_flag                                          ; 37c9: ad 03 11    ... :3698[1]
    and #1                                                            ; 37cc: 29 01       ).  :369b[1]
    beq c36a7                                                         ; 37ce: f0 08       ..  :369d[1]
    jsr something_TODO                                                ; 37d0: 20 53 04     S. :369f[1]
    lda #$ff                                                          ; 37d3: a9 ff       ..  :36a2[1]
    jmp c36db                                                         ; 37d5: 4c db 36    L.6 :36a4[1]

; $37d8 referenced 3 times by $366b, $366f, $369d
c36a7
    rts                                                               ; 37d8: 60          `   :36a7[1]

; $37d9 referenced 5 times by $367f, $3683, $368a, $368e, $36be
c36a8
    lda #$9c                                                          ; 37d9: a9 9c       ..  :36a8[1]
    sta l0070                                                         ; 37db: 85 70       .p  :36aa[1]
    lda #$38 ; '8'                                                    ; 37dd: a9 38       .8  :36ac[1]
    sta l0071                                                         ; 37df: 85 71       .q  :36ae[1]
    ldx #$c0                                                          ; 37e1: a2 c0       ..  :36b0[1]
    ldy #$53 ; 'S'                                                    ; 37e3: a0 53       .S  :36b2[1]
    lda #$ff                                                          ; 37e5: a9 ff       ..  :36b4[1]
    jsr osfile_wrapper                                                ; 37e7: 20 dc 16     .. :36b6[1]
    beq c36c1                                                         ; 37ea: f0 06       ..  :36b9[1]
    jsr sub_c3617                                                     ; 37ec: 20 17 36     .6 :36bb[1]
    jmp c36a8                                                         ; 37ef: 4c a8 36    L.6 :36be[1]

; $37f2 referenced 1 time by $36b9
c36c1
    jsr l53c0                                                         ; 37f2: 20 c0 53     .S :36c1[1]
    sta l36da                                                         ; 37f5: 8d da 36    ..6 :36c4[1]
; $37f8 referenced 1 time by $36cf
loop_c36c7
    jsr load_sprdata_to_addr_at_l0054                                 ; 37f8: 20 6f 19     o. :36c7[1]
    beq c36d2                                                         ; 37fb: f0 06       ..  :36ca[1]
    jsr sub_c3617                                                     ; 37fd: 20 17 36     .6 :36cc[1]
    jmp loop_c36c7                                                    ; 3800: 4c c7 36    L.6 :36cf[1]

; $3803 referenced 1 time by $36ca
c36d2
    lda l36da                                                         ; 3803: ad da 36    ..6 :36d2[1]
    bne c36db                                                         ; 3806: d0 04       ..  :36d5[1]
    jmp c363f                                                         ; 3808: 4c 3f 36    L?6 :36d7[1]

; $380b referenced 2 times by $36c4, $36d2
l36da
    !byte 0                                                           ; 380b: 00          .   :36da[1]

; $380c referenced 4 times by $35f4, $3695, $36a4, $36d5
c36db
    cmp #1                                                            ; 380c: c9 01       ..  :36db[1]
    beq c36f6                                                         ; 380e: f0 17       ..  :36dd[1]
    cmp l0031                                                         ; 3810: c5 31       .1  :36df[1]
    beq c36f6                                                         ; 3812: f0 13       ..  :36e1[1]
    tay                                                               ; 3814: a8          .   :36e3[1]
    pla                                                               ; 3815: 68          h   :36e4[1]
    pla                                                               ; 3816: 68          h   :36e5[1]
    pla                                                               ; 3817: 68          h   :36e6[1]
    pla                                                               ; 3818: 68          h   :36e7[1]
    pla                                                               ; 3819: 68          h   :36e8[1]
    pla                                                               ; 381a: 68          h   :36e9[1]
    cpy #$ff                                                          ; 381b: c0 ff       ..  :36ea[1]
    beq c36f3                                                         ; 381d: f0 05       ..  :36ec[1]
    ldx #0                                                            ; 381f: a2 00       ..  :36ee[1]
    jmp c1140                                                         ; 3821: 4c 40 11    L@. :36f0[1]

; $3824 referenced 1 time by $36ec
c36f3
    jmp c110c                                                         ; 3824: 4c 0c 11    L.. :36f3[1]

; $3827 referenced 2 times by $36dd, $36e1
c36f6
    jmp something_TODO                                                ; 3827: 4c 53 04    LS. :36f6[1]

; $382a referenced 1 time by $3716
loop_c36f9
    jmp c377a                                                         ; 382a: 4c 7a 37    Lz7 :36f9[1]

; $382d referenced 2 times by $34a9, $3673
sub_c36fc
    sta l377d                                                         ; 382d: 8d 7d 37    .}7 :36fc[1]
    jsr inkey                                                         ; 3830: 20 7c 38     |8 :36ff[1]
    ldy l0005                                                         ; 3833: a4 05       ..  :3702[1]
    cmp #$0d                                                          ; 3835: c9 0d       ..  :3704[1]
    beq c376b                                                         ; 3837: f0 63       .c  :3706[1]
    cmp #$7f                                                          ; 3839: c9 7f       ..  :3708[1]
    beq c3750                                                         ; 383b: f0 44       .D  :370a[1]
    cmp #$2d ; '-'                                                    ; 383d: c9 2d       .-  :370c[1]
    beq c3734                                                         ; 383f: f0 24       .$  :370e[1]
    cmp #$3d ; '='                                                    ; 3841: c9 3d       .=  :3710[1]
    beq c3734                                                         ; 3843: f0 20       .   :3712[1]
    cmp #$21 ; '!'                                                    ; 3845: c9 21       .!  :3714[1]
    bcc loop_c36f9                                                    ; 3847: 90 e1       ..  :3716[1]
    cmp #$2a ; '*'                                                    ; 3849: c9 2a       .*  :3718[1]
    bcs c3720                                                         ; 384b: b0 04       ..  :371a[1]
    adc #$10                                                          ; 384d: 69 10       i.  :371c[1]
    bne c3736                                                         ; 384f: d0 16       ..  :371e[1]
; $3851 referenced 1 time by $371a
c3720
    cmp #$30 ; '0'                                                    ; 3851: c9 30       .0  :3720[1]
    bcc c377a                                                         ; 3853: 90 56       .V  :3722[1]
    cmp #$3a ; ':'                                                    ; 3855: c9 3a       .:  :3724[1]
    bcc c3736                                                         ; 3857: 90 0e       ..  :3726[1]
    and #$df                                                          ; 3859: 29 df       ).  :3728[1]
    cmp #$41 ; 'A'                                                    ; 385b: c9 41       .A  :372a[1]
    bcc c377a                                                         ; 385d: 90 4c       .L  :372c[1]
    cmp #$5b ; '['                                                    ; 385f: c9 5b       .[  :372e[1]
    bcc c3736                                                         ; 3861: 90 04       ..  :3730[1]
    bcs c377a                                                         ; 3863: b0 46       .F  :3732[1]
; $3865 referenced 2 times by $370e, $3712
c3734
    lda #$2d ; '-'                                                    ; 3865: a9 2d       .-  :3734[1]
; $3867 referenced 3 times by $371e, $3726, $3730
c3736
    cpy l377d                                                         ; 3867: cc 7d 37    .}7 :3736[1]
    bcs c377a                                                         ; 386a: b0 3f       .?  :3739[1]
    iny                                                               ; 386c: c8          .   :373b[1]
    cpy l377d                                                         ; 386d: cc 7d 37    .}7 :373c[1]
    bne c3744                                                         ; 3870: d0 03       ..  :373f[1]
    jsr sub_c3863                                                     ; 3872: 20 63 38     c8 :3741[1]
; $3875 referenced 1 time by $373f
c3744
    dey                                                               ; 3875: 88          .   :3744[1]
    sta l0a90,y                                                       ; 3876: 99 90 0a    ... :3745[1]
    jsr sub_c1866                                                     ; 3879: 20 66 18     f. :3748[1]
    inc l0005                                                         ; 387c: e6 05       ..  :374b[1]
    jmp c377a                                                         ; 387e: 4c 7a 37    Lz7 :374d[1]

; $3881 referenced 1 time by $370a
c3750
    cpy #0                                                            ; 3881: c0 00       ..  :3750[1]
    beq c377a                                                         ; 3883: f0 26       .&  :3752[1]
    lda #8                                                            ; 3885: a9 08       ..  :3754[1]
    jsr oswrch                                                        ; 3887: 20 ee ff     .. :3756[1]   ; Write character 8
    lda #$20 ; ' '                                                    ; 388a: a9 20       .   :3759[1]
    jsr oswrch                                                        ; 388c: 20 ee ff     .. :375b[1]   ; Write character 32
    lda #8                                                            ; 388f: a9 08       ..  :375e[1]
    jsr oswrch                                                        ; 3891: 20 ee ff     .. :3760[1]   ; Write character 8
    dec l0005                                                         ; 3894: c6 05       ..  :3763[1]
    jsr sub_c385d                                                     ; 3896: 20 5d 38     ]8 :3765[1]
    jmp c377a                                                         ; 3899: 4c 7a 37    Lz7 :3768[1]

; $389c referenced 1 time by $3706
c376b
    cpy #0                                                            ; 389c: c0 00       ..  :376b[1]
    beq c377c                                                         ; 389e: f0 0d       ..  :376d[1]
    sta l0a90,y                                                       ; 38a0: 99 90 0a    ... :376f[1]
    inc l0005                                                         ; 38a3: e6 05       ..  :3772[1]
    jsr sub_c3863                                                     ; 38a5: 20 63 38     c8 :3774[1]
    jmp c377c                                                         ; 38a8: 4c 7c 37    L|7 :3777[1]

; $38ab referenced 8 times by $36f9, $3722, $372c, $3732, $3739, $374d, $3752, $3768
c377a
    pla                                                               ; 38ab: 68          h   :377a[1]
    pla                                                               ; 38ac: 68          h   :377b[1]
; $38ad referenced 2 times by $376d, $3777
c377c
    rts                                                               ; 38ad: 60          `   :377c[1]

; $38ae referenced 3 times by $36fc, $3736, $373c
l377d
    !byte 0                                                           ; 38ae: 00          .   :377d[1]

; $38af referenced 1 time by $2af6
c377e
    lda #$11                                                          ; 38af: a9 11       ..  :377e[1]
    sta l0409                                                         ; 38b1: 8d 09 04    ... :3780[1]
    lda l0004                                                         ; 38b4: a5 04       ..  :3783[1]
    beq c378e                                                         ; 38b6: f0 07       ..  :3785[1]
    cmp #1                                                            ; 38b8: c9 01       ..  :3787[1]
    beq c37ba                                                         ; 38ba: f0 2f       ./  :3789[1]
    jmp something_TODO                                                ; 38bc: 4c 53 04    LS. :378b[1]

; $38bf referenced 1 time by $3785
c378e
    jsr sub_c040a                                                     ; 38bf: 20 0a 04     .. :378e[1]
    lda #1                                                            ; 38c2: a9 01       ..  :3791[1]
    sta l0004                                                         ; 38c4: 85 04       ..  :3793[1]
    ldx #$b1                                                          ; 38c6: a2 b1       ..  :3795[1]
    ldy #$37 ; '7'                                                    ; 38c8: a0 37       .7  :3797[1]
    jsr c381c                                                         ; 38ca: 20 1c 38     .8 :3799[1]
    ldy l0031                                                         ; 38cd: a4 31       .1  :379c[1]
    jsr something7_TODO                                               ; 38cf: 20 d4 0a     .. :379e[1]
    tya                                                               ; 38d2: 98          .   :37a1[1]
    jsr sub_c1866                                                     ; 38d3: 20 66 18     f. :37a2[1]
    jsr sub_c3850                                                     ; 38d6: 20 50 38     P8 :37a5[1]
    ldx c3adb                                                         ; 38d9: ae db 3a    ..: :37a8[1]
    ldy l3adc                                                         ; 38dc: ac dc 3a    ..: :37ab[1]
    jmp c381c                                                         ; 38df: 4c 1c 38    L.8 :37ae[1]

    !byte $98, $ae, $a8, $bf, $a2, $a4, $a5, $eb, $c6                 ; 38e2: 98 ae a8... ... :37b1[1]

; $38eb referenced 1 time by $3789
c37ba
    jsr sub_c040a                                                     ; 38eb: 20 0a 04     .. :37ba[1]
    lda #2                                                            ; 38ee: a9 02       ..  :37bd[1]
    sta l0004                                                         ; 38f0: 85 04       ..  :37bf[1]
    ldx #$41 ; 'A'                                                    ; 38f2: a2 41       .A  :37c1[1]
; $38f4 referenced 2 times by $37ea, $37ef
c37c3
    txa                                                               ; 38f4: 8a          .   :37c3[1]
    tay                                                               ; 38f5: a8          .   :37c4[1]
    jsr something8_TODO                                               ; 38f6: 20 ef 0a     .. :37c5[1]
    tya                                                               ; 38f9: 98          .   :37c8[1]
    sec                                                               ; 38fa: 38          8   :37c9[1]
    sbc #$41 ; 'A'                                                    ; 38fb: e9 41       .A  :37ca[1]
    tay                                                               ; 38fd: a8          .   :37cc[1]
    lda l09ef,y                                                       ; 38fe: b9 ef 09    ... :37cd[1]
    and #$80                                                          ; 3901: 29 80       ).  :37d0[1]
    tay                                                               ; 3903: a8          .   :37d2[1]
    txa                                                               ; 3904: 8a          .   :37d3[1]
    cpy #0                                                            ; 3905: c0 00       ..  :37d4[1]
    beq c37da                                                         ; 3907: f0 02       ..  :37d6[1]
    lda #$fe                                                          ; 3909: a9 fe       ..  :37d8[1]
; $390b referenced 1 time by $37d6
c37da
    jsr sub_c1866                                                     ; 390b: 20 66 18     f. :37da[1]
    cpx #$50 ; 'P'                                                    ; 390e: e0 50       .P  :37dd[1]
    beq c37f2                                                         ; 3910: f0 11       ..  :37df[1]
    lda #9                                                            ; 3912: a9 09       ..  :37e1[1]
    jsr oswrch                                                        ; 3914: 20 ee ff     .. :37e3[1]   ; Write character 9
    txa                                                               ; 3917: 8a          .   :37e6[1]
    inx                                                               ; 3918: e8          .   :37e7[1]
    cmp #$48 ; 'H'                                                    ; 3919: c9 48       .H  :37e8[1]
    bne c37c3                                                         ; 391b: d0 d7       ..  :37ea[1]
    jsr sub_c3850                                                     ; 391d: 20 50 38     P8 :37ec[1]
    jmp c37c3                                                         ; 3920: 4c c3 37    L.7 :37ef[1]

; $3923 referenced 1 time by $37df
c37f2
    rts                                                               ; 3923: 60          `   :37f2[1]

; $3924 referenced 2 times by $1743, $3573
sub_c37f3
    stx l0070                                                         ; 3924: 86 70       .p  :37f3[1]
    sty l0071                                                         ; 3926: 84 71       .q  :37f5[1]
    ldy #0                                                            ; 3928: a0 00       ..  :37f7[1]
; $392a referenced 1 time by $3802
loop_c37f9
    lda (l0070),y                                                     ; 392a: b1 70       .p  :37f9[1]
    eor l0045                                                         ; 392c: 45 45       EE  :37fb[1]
    cmp #$0d                                                          ; 392e: c9 0d       ..  :37fd[1]
    beq c3804                                                         ; 3930: f0 03       ..  :37ff[1]
    iny                                                               ; 3932: c8          .   :3801[1]
    bne loop_c37f9                                                    ; 3933: d0 f5       ..  :3802[1]
; $3935 referenced 1 time by $37ff
c3804
    sty l0070                                                         ; 3935: 84 70       .p  :3804[1]
    lda l0409                                                         ; 3937: ad 09 04    ... :3806[1]
    sec                                                               ; 393a: 38          8   :3809[1]
    sbc #2                                                            ; 393b: e9 02       ..  :380a[1]
    sbc l0070                                                         ; 393d: e5 70       .p  :380c[1]
    lsr                                                               ; 393f: 4a          J   :380e[1]
    tay                                                               ; 3940: a8          .   :380f[1]
    beq c381a                                                         ; 3941: f0 08       ..  :3810[1]
    lda #$20 ; ' '                                                    ; 3943: a9 20       .   :3812[1]
; $3945 referenced 1 time by $3818
loop_c3814
    jsr oswrch                                                        ; 3945: 20 ee ff     .. :3814[1]   ; Write character 32
    dey                                                               ; 3948: 88          .   :3817[1]
    bne loop_c3814                                                    ; 3949: d0 fa       ..  :3818[1]
; $394b referenced 1 time by $3810
c381a
    ldy l0071                                                         ; 394b: a4 71       .q  :381a[1]
; $394d referenced 12 times by $3418, $3422, $348a, $34c6, $34d0, $3524, $352e, $361e, $3628, $3646, $3799, $37ae
c381c
    stx l0070                                                         ; 394d: 86 70       .p  :381c[1]
    sty l0071                                                         ; 394f: 84 71       .q  :381e[1]
    lda #$66 ; 'f'                                                    ; 3951: a9 66       .f  :3820[1]
    sta l384e                                                         ; 3953: 8d 4e 38    .N8 :3822[1]
    lda #$18                                                          ; 3956: a9 18       ..  :3825[1]
    sta l384f                                                         ; 3958: 8d 4f 38    .O8 :3827[1]
    lda l0043                                                         ; 395b: a5 43       .C  :382a[1]
    bne c3838                                                         ; 395d: d0 0a       ..  :382c[1]
    lda #$ee                                                          ; 395f: a9 ee       ..  :382e[1]
    sta l384e                                                         ; 3961: 8d 4e 38    .N8 :3830[1]
    lda #$ff                                                          ; 3964: a9 ff       ..  :3833[1]
    sta l384f                                                         ; 3966: 8d 4f 38    .O8 :3835[1]
; $3969 referenced 1 time by $382c
c3838
    ldy #0                                                            ; 3969: a0 00       ..  :3838[1]
; $396b referenced 1 time by $3846
loop_c383a
    lda (l0070),y                                                     ; 396b: b1 70       .p  :383a[1]
    eor l0045                                                         ; 396d: 45 45       EE  :383c[1]
    cmp #$0d                                                          ; 396f: c9 0d       ..  :383e[1]
    beq c3848                                                         ; 3971: f0 06       ..  :3840[1]
    jsr sub_c384d                                                     ; 3973: 20 4d 38     M8 :3842[1]
    iny                                                               ; 3976: c8          .   :3845[1]
    bne loop_c383a                                                    ; 3977: d0 f2       ..  :3846[1]
; $3979 referenced 1 time by $3840
c3848
    lda #$cb                                                          ; 3979: a9 cb       ..  :3848[1]
    sta l0045                                                         ; 397b: 85 45       .E  :384a[1]
    rts                                                               ; 397d: 60          `   :384c[1]

; $397e referenced 1 time by $3842
sub_c384d
l384e = sub_c384d+1
l384f = sub_c384d+2
    jmp oswrch                                                        ; 397e: 4c ee ff    L.. :384d[1]   ; Write character

; $397f referenced 2 times by $3822, $3830
; $3980 referenced 2 times by $3827, $3835
; $3981 referenced 8 times by $341b, $348d, $34c9, $3527, $3621, $3649, $37a5, $37ec
sub_c3850
    lda #$0a                                                          ; 3981: a9 0a       ..  :3850[1]
    jsr oswrch                                                        ; 3983: 20 ee ff     .. :3852[1]   ; Write character 10
    jsr oswrch                                                        ; 3986: 20 ee ff     .. :3855[1]   ; Write character
    lda #$0d                                                          ; 3989: a9 0d       ..  :3858[1]
    jmp oswrch                                                        ; 398b: 4c ee ff    L.. :385a[1]   ; Write character 13

; $398e referenced 3 times by $3490, $364c, $3765
sub_c385d
    pha                                                               ; 398e: 48          H   :385d[1]
    lda #$67 ; 'g'                                                    ; 398f: a9 67       .g  :385e[1]
    pha                                                               ; 3991: 48          H   :3860[1]
    bne c3867                                                         ; 3992: d0 04       ..  :3861[1]
; $3994 referenced 4 times by $0411, $045a, $3741, $3774
sub_c3863
    pha                                                               ; 3994: 48          H   :3863[1]
    lda #$20 ; ' '                                                    ; 3995: a9 20       .   :3864[1]
    pha                                                               ; 3997: 48          H   :3866[1]
; $3998 referenced 1 time by $3861
c3867
    lda #crtc_cursor_start                                            ; 3998: a9 0a       ..  :3867[1]
    sta crtc_address_register                                         ; 399a: 8d 00 fe    ... :3869[1]
    pla                                                               ; 399d: 68          h   :386c[1]
    sta crtc_address_write                                            ; 399e: 8d 01 fe    ... :386d[1]
    pla                                                               ; 39a1: 68          h   :3870[1]
    rts                                                               ; 39a2: 60          `   :3871[1]

; $39a3 referenced 6 times by $3425, $3493, $34d3, $3531, $362b, $364f
c3872
    ldx #0                                                            ; 39a3: a2 00       ..  :3872[1]
    stx l0005                                                         ; 39a5: 86 05       ..  :3874[1]
    lda #osbyte_flush_buffer_class                                    ; 39a7: a9 0f       ..  :3876[1]
    inx                                                               ; 39a9: e8          .   :3878[1]
    jmp osbyte                                                        ; 39aa: 4c f4 ff    L.. :3879[1]   ; Flush all buffers (X=0), or just input buffers (X non-zero)

; $39ad referenced 5 times by $346f, $3501, $3557, $362e, $36ff
inkey
    lda #osbyte_inkey                                                 ; 39ad: a9 81       ..  :387c[1]
    ldx #0                                                            ; 39af: a2 00       ..  :387e[1]
    ldy #0                                                            ; 39b1: a0 00       ..  :3880[1]
    jsr osbyte                                                        ; 39b3: 20 f4 ff     .. :3882[1]   ; Wait for a key press within 0 centiseconds
    tya                                                               ; 39b6: 98          .   :3885[1]   ; Y is zero if key pressed; $ff if no key pressed; $1b if ESCAPE pressed
    bne c388a                                                         ; 39b7: d0 02       ..  :3886[1]
; X is the ASCII value of the key pressed (assuming Y=0)
    txa                                                               ; 39b9: 8a          .   :3888[1]
    rts                                                               ; 39ba: 60          `   :3889[1]

; $39bb referenced 1 time by $3886
c388a
    lda #0                                                            ; 39bb: a9 00       ..  :388a[1]
    rts                                                               ; 39bd: 60          `   :388c[1]

; $39be referenced 2 times by $1746, $1749
sub_c388d
    lda #0                                                            ; 39be: a9 00       ..  :388d[1]
    sta l178b                                                         ; 39c0: 8d 8b 17    ... :388f[1]
; $39c3 referenced 1 time by $3897
loop_c3892
    lda l178b                                                         ; 39c3: ad 8b 17    ... :3892[1]
    cmp #$32 ; '2'                                                    ; 39c6: c9 32       .2  :3895[1]
    bcc loop_c3892                                                    ; 39c8: 90 f9       ..  :3897[1]
    jmp c3a8f                                                         ; 39ca: 4c 8f 3a    L.: :3899[1]

    !text "auxcode"                                                   ; 39cd: 61 75 78... aux :389c[1]
    !byte $0d, $10,   0, $f4, $ff,   2,   0,   1,   0                 ; 39d4: 0d 10 00... ... :38a3[1]
; $39dd referenced 5 times by $11a1, $1a5e, $2177, $21c1, $3d63
l38ac
    !byte 1                                                           ; 39dd: 01          .   :38ac[1]
; $39de referenced 1 time by $3d68
l38ad
    !byte   3,   0,   0,   0,   0,   0,   0,   3,   0,   0,   0, $40  ; 39de: 03 00 00... ... :38ad[1]
    !byte   0, $10,   0,   1,   0,   7,   0, $64,   0                 ; 39ea: 00 10 00... ... :38b9[1]
; $39f3 referenced 6 times by $11a4, $2002, $2040, $2054, $20ab, $3d6d
l38c2
    !byte 2                                                           ; 39f3: 02          .   :38c2[1]
; $39f4 referenced 1 time by $3d72
l38c3
    !byte $86,   1,   3,   5, $0a, $0a, $10,   0,   0,   0,   0,   0  ; 39f4: 86 01 03... ... :38c3[1]
    !byte   0, $11,   0,   2,   0, $b4,   0, $64,   0                 ; 3a00: 00 11 00... ... :38cf[1]
; $3a09 referenced 15 times by $2392, $25fa, $26b7, $26bc, $26dc, $26e1, $2742, $2747, $2767, $276c, $2dda, $2e7c, $2e94, $2e9a, $303a
l38d8
    !byte   3,   1,   0,   0,   0,   0,   0,   0, $64,   0,   0, $f8  ; 3a09: 03 01 00... ... :38d8[1]
    !byte $7e,   0, $10,   0,   3,   0,   3,   0,   1,   0, $11,   0  ; 3a15: 7e 00 10... ~.. :38e4[1]
    !byte   0,   0, $28,   0,   1,   0                                ; 3a21: 00 00 28... ..( :38f0[1]

; $3a27 referenced 5 times by $234d, $2354, $23b4, $23bb, $2b11
sub_c38f6
    sta l3973                                                         ; 3a27: 8d 73 39    .s9 :38f6[1]
    lda l0070                                                         ; 3a2a: a5 70       .p  :38f9[1]
    pha                                                               ; 3a2c: 48          H   :38fb[1]
    lda l0071                                                         ; 3a2d: a5 71       .q  :38fc[1]
    pha                                                               ; 3a2f: 48          H   :38fe[1]
    stx l0070                                                         ; 3a30: 86 70       .p  :38ff[1]
    sty l0071                                                         ; 3a32: 84 71       .q  :3901[1]
    lda l3966                                                         ; 3a34: ad 66 39    .f9 :3903[1]
    beq c3954                                                         ; 3a37: f0 4c       .L  :3906[1]
    ldy #0                                                            ; 3a39: a0 00       ..  :3908[1]
    lda (l0070),y                                                     ; 3a3b: b1 70       .p  :390a[1]
    and #$f0                                                          ; 3a3d: 29 f0       ).  :390c[1]
    beq c393c                                                         ; 3a3f: f0 2c       .,  :390e[1]
    lda (l0070),y                                                     ; 3a41: b1 70       .p  :3910[1]
    and #3                                                            ; 3a43: 29 03       ).  :3912[1]
    tax                                                               ; 3a45: aa          .   :3914[1]
    lda l3973                                                         ; 3a46: ad 73 39    .s9 :3915[1]
    cmp l396f,x                                                       ; 3a49: dd 6f 39    .o9 :3918[1]
    bcc c3954                                                         ; 3a4c: 90 37       .7  :391b[1]
    sta l396f,x                                                       ; 3a4e: 9d 6f 39    .o9 :391d[1]
    cpx #2                                                            ; 3a51: e0 02       ..  :3920[1]
    bcs c394b                                                         ; 3a53: b0 27       .'  :3922[1]
    lda l0070                                                         ; 3a55: a5 70       .p  :3924[1]
    cmp l3967,x                                                       ; 3a57: dd 67 39    .g9 :3926[1]
    bne c3932                                                         ; 3a5a: d0 07       ..  :3929[1]
    lda l0071                                                         ; 3a5c: a5 71       .q  :392b[1]
    cmp l396b,x                                                       ; 3a5e: dd 6b 39    .k9 :392d[1]
    beq c394b                                                         ; 3a61: f0 19       ..  :3930[1]
; $3a63 referenced 1 time by $3929
c3932
    txa                                                               ; 3a63: 8a          .   :3932[1]
    clc                                                               ; 3a64: 18          .   :3933[1]
    adc #4                                                            ; 3a65: 69 04       i.  :3934[1]
    tax                                                               ; 3a67: aa          .   :3936[1]
    lda #osbyte_flush_buffer                                          ; 3a68: a9 15       ..  :3937[1]
    jsr osbyte                                                        ; 3a6a: 20 f4 ff     .. :3939[1]   ; Flush specific buffer X
; $3a6d referenced 1 time by $390e
c393c
    lda (l0070),y                                                     ; 3a6d: b1 70       .p  :393c[1]
    and #3                                                            ; 3a6f: 29 03       ).  :393e[1]
    tax                                                               ; 3a71: aa          .   :3940[1]
    lda l0070                                                         ; 3a72: a5 70       .p  :3941[1]
    sta l3967,x                                                       ; 3a74: 9d 67 39    .g9 :3943[1]
    lda l0071                                                         ; 3a77: a5 71       .q  :3946[1]
    sta l396b,x                                                       ; 3a79: 9d 6b 39    .k9 :3948[1]
; $3a7c referenced 2 times by $3922, $3930
c394b
    ldx l0070                                                         ; 3a7c: a6 70       .p  :394b[1]
    ldy l0071                                                         ; 3a7e: a4 71       .q  :394d[1]
    lda #osword_sound                                                 ; 3a80: a9 07       ..  :394f[1]
    jsr osword                                                        ; 3a82: 20 f1 ff     .. :3951[1]   ; SOUND command
; $3a85 referenced 2 times by $3906, $391b
c3954
    pla                                                               ; 3a85: 68          h   :3954[1]
    sta l0071                                                         ; 3a86: 85 71       .q  :3955[1]
    pla                                                               ; 3a88: 68          h   :3957[1]
    sta l0070                                                         ; 3a89: 85 70       .p  :3958[1]
    lda l3973                                                         ; 3a8b: ad 73 39    .s9 :395a[1]
    rts                                                               ; 3a8e: 60          `   :395d[1]

; $3a8f referenced 3 times by $3d41, $3d48, $3d4f
define_envelope
    pha                                                               ; 3a8f: 48          H   :395e[1]
    lda #osword_envelope                                              ; 3a90: a9 08       ..  :395f[1]
    jsr osword                                                        ; 3a92: 20 f1 ff     .. :3961[1]   ; ENVELOPE command
    pla                                                               ; 3a95: 68          h   :3964[1]
    rts                                                               ; 3a96: 60          `   :3965[1]

; $3a97 referenced 5 times by $2b02, $2b08, $2b17, $2b27, $3903
l3966
    !byte $ff                                                         ; 3a97: ff          .   :3966[1]
; $3a98 referenced 2 times by $3926, $3943
l3967
    !byte 0, 0, 0, 0                                                  ; 3a98: 00 00 00... ... :3967[1]
; $3a9c referenced 2 times by $392d, $3948
l396b
    !byte 0, 0, 0, 0                                                  ; 3a9c: 00 00 00... ... :396b[1]
; $3aa0 referenced 5 times by $1213, $2361, $2a9a, $3918, $391d
l396f
    !byte 0                                                           ; 3aa0: 00          .   :396f[1]
; $3aa1 referenced 1 time by $2364
l3970
    !byte 0, 0, 0                                                     ; 3aa1: 00 00 00    ... :3970[1]
; $3aa4 referenced 3 times by $38f6, $3915, $395a
l3973
    !byte 0                                                           ; 3aa4: 00          .   :3973[1]
; $3aa5 referenced 2 times by $398d, $3a0b
l3974
    !byte   0, $20, $20, $ff,   0                                     ; 3aa5: 00 20 20... .   :3974[1]
    !text "&%$#", '"'                                                 ; 3aaa: 26 25 24... &%$ :3979[1]
    !byte $ff                                                         ; 3aaf: ff          .   :397e[1]
    !text '"', "#$%&"                                                 ; 3ab0: 22 23 24... "#$ :397f[1]
    !byte   0, $ff                                                    ; 3ab5: 00 ff       ..  :3984[1]

; $3ab7 referenced 1 time by $22e0
c3986
    lda l09d4                                                         ; 3ab7: ad d4 09    ... :3986[1]
    clc                                                               ; 3aba: 18          .   :3989[1]
    adc #1                                                            ; 3abb: 69 01       i.  :398a[1]
    tay                                                               ; 3abd: a8          .   :398c[1]
    lda l3974,y                                                       ; 3abe: b9 74 39    .t9 :398d[1]
    cmp #$ff                                                          ; 3ac1: c9 ff       ..  :3990[1]
    bne c3997                                                         ; 3ac3: d0 03       ..  :3992[1]
    ldy l09df                                                         ; 3ac5: ac df 09    ... :3994[1]
; $3ac8 referenced 1 time by $3992
c3997
    lda l09df                                                         ; 3ac8: ad df 09    ... :3997[1]
    bne c39c1                                                         ; 3acb: d0 25       .%  :399a[1]
    tya                                                               ; 3acd: 98          .   :399c[1]
    bne c3a08                                                         ; 3ace: d0 69       .i  :399d[1]
    lda l004d                                                         ; 3ad0: a5 4d       .M  :399f[1]
    sta l0048                                                         ; 3ad2: 85 48       .H  :39a1[1]
    bne c39b6                                                         ; 3ad4: d0 11       ..  :39a3[1]
    ldy #$0b                                                          ; 3ad6: a0 0b       ..  :39a5[1]
    sty l09df                                                         ; 3ad8: 8c df 09    ... :39a7[1]

    lda l097c                                                         ; 3adb: ad 7c 09    .|. :39aa[1]
    clc                                                               ; 3ade: 18          .   :39ad[1]
    adc #2                                                            ; 3adf: 69 02       i.  :39ae[1]
    sta l097c                                                         ; 3ae1: 8d 7c 09    .|. :39b0[1]
    jmp c3a08                                                         ; 3ae4: 4c 08 3a    L.: :39b3[1]

; $3ae7 referenced 1 time by $39a3
c39b6
    lda #0                                                            ; 3ae7: a9 00       ..  :39b6[1]
    sta l09df                                                         ; 3ae9: 8d df 09    ... :39b8[1]
    sta l09d4                                                         ; 3aec: 8d d4 09    ... :39bb[1]
    jmp something19_TODO                                              ; 3aef: 4c cd 22    L." :39be[1]

; $3af2 referenced 1 time by $399a
c39c1
    cmp #$0b                                                          ; 3af2: c9 0b       ..  :39c1[1]
    bne c39f4                                                         ; 3af4: d0 2f       ./  :39c3[1]
    cpy #$0b                                                          ; 3af6: c0 0b       ..  :39c5[1]
    bne c3a08                                                         ; 3af8: d0 3f       .?  :39c7[1]
    jsr sub_c2358                                                     ; 3afa: 20 58 23     X# :39c9[1]
    pla                                                               ; 3afd: 68          h   :39cc[1]
    pla                                                               ; 3afe: 68          h   :39cd[1]
    pla                                                               ; 3aff: 68          h   :39ce[1]
    pla                                                               ; 3b00: 68          h   :39cf[1]
    ldy #$0f                                                          ; 3b01: a0 0f       ..  :39d0[1]
; $3b03 referenced 1 time by $39da
loop_c39d2
    lda l09ef,y                                                       ; 3b03: b9 ef 09    ... :39d2[1]
    and #$80                                                          ; 3b06: 29 80       ).  :39d5[1]
    beq c39e0                                                         ; 3b08: f0 07       ..  :39d7[1]
; $3b09 referenced 1 time by $3af7
    dey                                                               ; 3b0a: 88          .   :39d9[1]
    bpl loop_c39d2                                                    ; 3b0b: 10 f6       ..  :39da[1]
    ldy #$51 ; 'Q'                                                    ; 3b0d: a0 51       .Q  :39dc[1]
    bne c39ec                                                         ; 3b0f: d0 0c       ..  :39de[1]
; $3b11 referenced 1 time by $39d7
c39e0
    ldy l0031                                                         ; 3b11: a4 31       .1  :39e0[1]
    jsr something7_TODO                                               ; 3b13: 20 d4 0a     .. :39e2[1]
    iny                                                               ; 3b16: c8          .   :39e5[1]
    cpy #$51 ; 'Q'                                                    ; 3b17: c0 51       .Q  :39e6[1]
    bcc c39ec                                                         ; 3b19: 90 02       ..  :39e8[1]
    ldy #$41 ; 'A'                                                    ; 3b1b: a0 41       .A  :39ea[1]
; $3b1d referenced 2 times by $39de, $39e8
c39ec
    ldx #0                                                            ; 3b1d: a2 00       ..  :39ec[1]
    jsr something8_TODO                                               ; 3b1f: 20 ef 0a     .. :39ee[1]
    jmp c1140                                                         ; 3b22: 4c 40 11    L@. :39f1[1]

; $3b25 referenced 1 time by $39c3
c39f4
    cpy #4                                                            ; 3b25: c0 04       ..  :39f4[1]
    bne c3a08                                                         ; 3b27: d0 10       ..  :39f6[1]
    lda #0                                                            ; 3b29: a9 00       ..  :39f8[1]
    sta l09df                                                         ; 3b2b: 8d df 09    ... :39fa[1]
    ldy #1                                                            ; 3b2e: a0 01       ..  :39fd[1]
    lda l097c                                                         ; 3b30: ad 7c 09    .|. :39ff[1]
    sec                                                               ; 3b33: 38          8   :3a02[1]
    sbc #2                                                            ; 3b34: e9 02       ..  :3a03[1]
    sta l097c                                                         ; 3b36: 8d 7c 09    .|. :3a05[1]
; $3b39 referenced 4 times by $399d, $39b3, $39c7, $39f6
c3a08
    sty l09d4                                                         ; 3b39: 8c d4 09    ... :3a08[1]
    lda l3974,y                                                       ; 3b3c: b9 74 39    .t9 :3a0b[1]
    sta l09a8                                                         ; 3b3f: 8d a8 09    ... :3a0e[1]
    rts                                                               ; 3b42: 60          `   :3a11[1]

; $3b43 referenced 2 times by $181d, $2ad7
sub_c3a12
    ldx #$b6                                                          ; 3b43: a2 b6       ..  :3a12[1]
    jsr sub_c3acc                                                     ; 3b45: 20 cc 3a     .: :3a14[1]
    ora l0046                                                         ; 3b48: 05 46       .F  :3a17[1]
    sta l0046                                                         ; 3b4a: 85 46       .F  :3a19[1]
    ldx #$9e                                                          ; 3b4c: a2 9e       ..  :3a1b[1]
    jsr sub_c3acc                                                     ; 3b4e: 20 cc 3a     .: :3a1d[1]
    sta l3a8d                                                         ; 3b51: 8d 8d 3a    ..: :3a20[1]
    ora l002c                                                         ; 3b54: 05 2c       .,  :3a23[1]
    sta l002c                                                         ; 3b56: 85 2c       .,  :3a25[1]
    ldx #$bd                                                          ; 3b58: a2 bd       ..  :3a27[1]
    jsr sub_c3acc                                                     ; 3b5a: 20 cc 3a     .: :3a29[1]
    pha                                                               ; 3b5d: 48          H   :3a2c[1]
    ora l002d                                                         ; 3b5e: 05 2d       .-  :3a2d[1]
    sta l002d                                                         ; 3b60: 85 2d       .-  :3a2f[1]
    pla                                                               ; 3b62: 68          h   :3a31[1]
    ldx #0                                                            ; 3b63: a2 00       ..  :3a32[1]
    eor l3a8d                                                         ; 3b65: 4d 8d 3a    M.: :3a34[1]
    beq c3a41                                                         ; 3b68: f0 08       ..  :3a37[1]
    dex                                                               ; 3b6a: ca          .   :3a39[1]
    lda l3a8d                                                         ; 3b6b: ad 8d 3a    ..: :3a3a[1]
    bmi c3a41                                                         ; 3b6e: 30 02       0.  :3a3d[1]
    ldx #1                                                            ; 3b70: a2 01       ..  :3a3f[1]
; $3b72 referenced 2 times by $3a37, $3a3d
c3a41
    txa                                                               ; 3b72: 8a          .   :3a41[1]
    ora l0020                                                         ; 3b73: 05 20       .   :3a42[1]
    sta l0020                                                         ; 3b75: 85 20       .   :3a44[1]
    rts                                                               ; 3b77: 60          `   :3a46[1]

; $3b78 referenced 1 time by $1820
sub_c3a47
    ldx #$9d                                                          ; 3b78: a2 9d       ..  :3a47[1]
    jsr sub_c3acc                                                     ; 3b7a: 20 cc 3a     .: :3a49[1]
    cmp l002b                                                         ; 3b7d: c5 2b       .+  :3a4c[1]
    sta l002b                                                         ; 3b7f: 85 2b       .+  :3a4e[1]
    bne c3a54                                                         ; 3b81: d0 02       ..  :3a50[1]
    lda #0                                                            ; 3b83: a9 00       ..  :3a52[1]
; $3b85 referenced 1 time by $3a50
c3a54
    ora l002a                                                         ; 3b85: 05 2a       .*  :3a54[1]
    sta l002a                                                         ; 3b87: 85 2a       .*  :3a56[1]
    ldx #$e6                                                          ; 3b89: a2 e6       ..  :3a58[1]
    jsr sub_c3acc                                                     ; 3b8b: 20 cc 3a     .: :3a5a[1]
    sta l3a8d                                                         ; 3b8e: 8d 8d 3a    ..: :3a5d[1]
    ldx #$86                                                          ; 3b91: a2 86       ..  :3a60[1]
    jsr sub_c3acc                                                     ; 3b93: 20 cc 3a     .: :3a62[1]
    cmp l3a8d                                                         ; 3b96: cd 8d 3a    ..: :3a65[1]
    beq c3a73                                                         ; 3b99: f0 09       ..  :3a68[1]
    lda l3a8d                                                         ; 3b9b: ad 8d 3a    ..: :3a6a[1]
    bmi c3a75                                                         ; 3b9e: 30 06       0.  :3a6d[1]
    lda #1                                                            ; 3ba0: a9 01       ..  :3a6f[1]
    bpl c3a75                                                         ; 3ba2: 10 02       ..  :3a71[1]
; $3ba4 referenced 1 time by $3a68
c3a73
    lda #0                                                            ; 3ba4: a9 00       ..  :3a73[1]
; $3ba6 referenced 2 times by $3a6d, $3a71
c3a75
    cmp l0027                                                         ; 3ba6: c5 27       .'  :3a75[1]
    sta l0027                                                         ; 3ba8: 85 27       .'  :3a77[1]
    bne c3a83                                                         ; 3baa: d0 08       ..  :3a79[1]
    lda #0                                                            ; 3bac: a9 00       ..  :3a7b[1]
    dec l0026                                                         ; 3bae: c6 26       .&  :3a7d[1]
    bpl c3a88                                                         ; 3bb0: 10 07       ..  :3a7f[1]
    lda l0027                                                         ; 3bb2: a5 27       .'  :3a81[1]
; $3bb4 referenced 1 time by $3a79
c3a83
    ldx l3a8e                                                         ; 3bb4: ae 8e 3a    ..: :3a83[1]
    stx l0026                                                         ; 3bb7: 86 26       .&  :3a86[1]
; $3bb9 referenced 1 time by $3a7f
c3a88
    ora l0028                                                         ; 3bb9: 05 28       .(  :3a88[1]
    sta l0028                                                         ; 3bbb: 85 28       .(  :3a8a[1]
    rts                                                               ; 3bbd: 60          `   :3a8c[1]

; $3bbe referenced 6 times by $3a20, $3a34, $3a3a, $3a5d, $3a65, $3a6a
l3a8d
    !byte 0                                                           ; 3bbe: 00          .   :3a8d[1]
; $3bbf referenced 1 time by $3a83
l3a8e
    !byte $10                                                         ; 3bbf: 10          .   :3a8e[1]

; $3bc0 referenced 4 times by $174c, $2a44, $35e2, $3899
c3a8f
    lda l002a                                                         ; 3bc0: a5 2a       .*  :3a8f[1]
    sta l3aa0                                                         ; 3bc2: 8d a0 3a    ..: :3a91[1]
    lda l0028                                                         ; 3bc5: a5 28       .(  :3a94[1]
    sta l3aa1                                                         ; 3bc7: 8d a1 3a    ..: :3a96[1]
    lda #0                                                            ; 3bca: a9 00       ..  :3a99[1]
    sta l002a                                                         ; 3bcc: 85 2a       .*  :3a9b[1]
    sta l0028                                                         ; 3bce: 85 28       .(  :3a9d[1]
    rts                                                               ; 3bd0: 60          `   :3a9f[1]

; $3bd1 referenced 2 times by $2a73, $3a91
l3aa0
    !byte 0                                                           ; 3bd1: 00          .   :3aa0[1]
; $3bd2 referenced 2 times by $2c69, $3a96
l3aa1
    !byte 0                                                           ; 3bd2: 00          .   :3aa1[1]

; $3bd3 referenced 2 times by $2abd, $2ad4
sub_c3aa2
    lda l3ac7                                                         ; 3bd3: ad c7 3a    ..: :3aa2[1]
    sta l3ac8                                                         ; 3bd6: 8d c8 3a    ..: :3aa5[1]
    lda l0046                                                         ; 3bd9: a5 46       .F  :3aa8[1]
    sta l3ac7                                                         ; 3bdb: 8d c7 3a    ..: :3aaa[1]
    lda l0020                                                         ; 3bde: a5 20       .   :3aad[1]
    sta l3ac9                                                         ; 3be0: 8d c9 3a    ..: :3aaf[1]
    lda l002c                                                         ; 3be3: a5 2c       .,  :3ab2[1]
    sta l3aca                                                         ; 3be5: 8d ca 3a    ..: :3ab4[1]
    lda l002d                                                         ; 3be8: a5 2d       .-  :3ab7[1]
    sta l3acb                                                         ; 3bea: 8d cb 3a    ..: :3ab9[1]
    lda #0                                                            ; 3bed: a9 00       ..  :3abc[1]
    sta l0046                                                         ; 3bef: 85 46       .F  :3abe[1]
    sta l0020                                                         ; 3bf1: 85 20       .   :3ac0[1]
    sta l002c                                                         ; 3bf3: 85 2c       .,  :3ac2[1]
    sta l002d                                                         ; 3bf5: 85 2d       .-  :3ac4[1]
    rts                                                               ; 3bf7: 60          `   :3ac6[1]

; $3bf8 referenced 9 times by $2e01, $2e2b, $3061, $320e, $3229, $32cd, $32e7, $3aa2, $3aaa
l3ac7
    !byte 0                                                           ; 3bf8: 00          .   :3ac7[1]
; $3bf9 referenced 1 time by $3aa5
l3ac8
    !byte 0                                                           ; 3bf9: 00          .   :3ac8[1]
; $3bfa referenced 9 times by $2df3, $2e46, $3001, $3053, $308c, $324e, $32c8, $3318, $3aaf
l3ac9
    !byte 0                                                           ; 3bfa: 00          .   :3ac9[1]
; $3bfb referenced 2 times by $323f, $3ab4
l3aca
    !byte 0                                                           ; 3bfb: 00          .   :3aca[1]
; $3bfc referenced 2 times by $3242, $3ab9
l3acb
    !byte 0                                                           ; 3bfc: 00          .   :3acb[1]

; $3bfd referenced 8 times by $2a54, $2ab2, $3a14, $3a1d, $3a29, $3a49, $3a5a, $3a62
sub_c3acc
    ldy #$ff                                                          ; 3bfd: a0 ff       ..  :3acc[1]
    lda #osbyte_inkey                                                 ; 3bff: a9 81       ..  :3ace[1]
    jsr osbyte                                                        ; 3c01: 20 f4 ff     .. :3ad0[1]   ; Read a specific key (or read machine type)
    txa                                                               ; 3c04: 8a          .   :3ad3[1]
    rts                                                               ; 3c05: 60          `   :3ad4[1]

; The loader will have executed VDU 21 to disable VDU output. Record the current
; disable state before re-enabling it, so we can check it later as part of a copy
; protection scheme.
; This initialisation code gets overwritten by level data later on.
; $3c06 referenced 1 time by $1352
level_data
execution_start
    lda #osbyte_read_vdu_status                                       ; 3c06: a9 75       .u  :3ad5[1]
; $3c07 referenced 1 time by $1358
; $3c08 referenced 1 time by $1219
c3ad7
l3ad8 = c3ad7+1
    jsr osbyte                                                        ; 3c08: 20 f4 ff     .. :3ad7[1]   ; Read VDU status byte
; $3c09 referenced 1 time by $121c
    ; X is VDU status byte:
    ;     bit 0=printer output enabled by a VDU 2
    ;     bit 1=scrolling disabled (cursor editing)
    ;     bit 2=paged scrolling selected
    ;     bit 3=software scrolling selected (text window)
    ;     bit 4=shadow mode selected
    ;     bit 5=text at graphics cursor (VDU 5)
    ;     bit 6=two cursor editing mode
    ;     bit 7=screen disabled via VDU 21
    txa                                                               ; 3c0b: 8a          .   :3ada[1]
; $3c0c referenced 1 time by $37a8
c3adb
l3adc = c3adb+1
    and #$80                                                          ; 3c0c: 29 80       ).  :3adb[1]
; $3c0d referenced 1 time by $37ab
; $3c0e referenced 1 time by $128c
c3add
l3ade = c3add+1
l3adf = c3add+2
    sta initial_screen_disabled_flag                                  ; 3c0e: 8d 6e 3f    .n? :3add[1]
; $3c0f referenced 1 time by $1296
; $3c10 referenced 2 times by $125f, $129f
; $3c11 referenced 2 times by $1262, $12a4
c3ae0
    lda #vdu_enable                                                   ; 3c11: a9 06       ..  :3ae0[1]
    jsr oswrch                                                        ; 3c13: 20 ee ff     .. :3ae2[1]   ; Write character 6
; Copy 512 bytes from &40FF to &400. TODO: I THINK?
    lda #<some_data_high_copy_TODO                                    ; 3c16: a9 ff       ..  :3ae5[1]
    sta l0070                                                         ; 3c18: 85 70       .p  :3ae7[1]
    lda #>some_data_high_copy_TODO                                    ; 3c1a: a9 40       .@  :3ae9[1]
    sta l0071                                                         ; 3c1c: 85 71       .q  :3aeb[1]
    lda #<some_data_low_TODO                                          ; 3c1e: a9 00       ..  :3aed[1]
    sta l0072                                                         ; 3c20: 85 72       .r  :3aef[1]
    lda #>some_data_low_TODO                                          ; 3c22: a9 04       ..  :3af1[1]
    sta l0073                                                         ; 3c24: 85 73       .s  :3af3[1]
    ldx #2                                                            ; 3c26: a2 02       ..  :3af5[1]
    beq l3b09                                                         ; 3c28: f0 10       ..  :3af7[1]   ; TODO: branch never taken?
    ldy #0                                                            ; 3c2a: a0 00       ..  :3af9[1]
; $3c2c referenced 2 times by $3b00, $3c38
c3afb
    lda (l0070),y                                                     ; 3c2c: b1 70       .p  :3afb[1]
    sta (l0072),y                                                     ; 3c2e: 91 72       .r  :3afd[1]
    iny                                                               ; 3c30: c8          .   :3aff[1]
    bne c3afb                                                         ; 3c31: d0 f9       ..  :3b00[1]
    !byte $e6                                                         ; 3c33: e6          .   :3b02[1]
}

    !byte $71                                                         ; 3c34: 71          q

    inc l0073                                                         ; 3c35: e6 73       .s
    dex                                                               ; 3c37: ca          .
    bne c3c2c                                                         ; 3c38: d0 f2       ..
; Copy &2A00 bytes from &1234 to &1103. TODO: I think? If this is right, label this up
; nicely and use constants etc later. TODO: I have a suspicion this is done more for
; obfuscation than any real requirement - surely we could have just loaded at &1103 in
; the first place? I suspect some routines - eg &16DC? - have 'real' versions and
; 'trap' versions to cause confusion. This is just speculation at this point.
    lda #$34 ; '4'                                                    ; 3c3a: a9 34       .4
    sta l0070                                                         ; 3c3c: 85 70       .p
    lda #$12                                                          ; 3c3e: a9 12       ..
    sta l0071                                                         ; 3c40: 85 71       .q
    lda #3                                                            ; 3c42: a9 03       ..
    sta l0072                                                         ; 3c44: 85 72       .r
    lda #$11                                                          ; 3c46: a9 11       ..
    sta l0073                                                         ; 3c48: 85 73       .s
    lda l0071                                                         ; 3c4a: a5 71       .q
    cmp l0073                                                         ; 3c4c: c5 73       .s
    bne c3c56                                                         ; 3c4e: d0 06       ..             ; TODO: branch always taken?
    lda l0070                                                         ; 3c50: a5 70       .p
    cmp l0072                                                         ; 3c52: c5 72       .r
    beq c3c6a                                                         ; 3c54: f0 14       ..
; $3c56 referenced 1 time by $3c4e
c3c56
    ldx #$2a ; '*'                                                    ; 3c56: a2 2a       .*
    beq c3c6a                                                         ; 3c58: f0 10       ..             ; TODO: branch never taken?
    ldy #0                                                            ; 3c5a: a0 00       ..
; $3c5c referenced 2 times by $3c61, $3c68
c3c5c
    lda (l0070),y                                                     ; 3c5c: b1 70       .p
    sta (l0072),y                                                     ; 3c5e: 91 72       .r
    iny                                                               ; 3c60: c8          .
    bne c3c5c                                                         ; 3c61: d0 f9       ..
    inc l0071                                                         ; 3c63: e6 71       .q
    inc l0073                                                         ; 3c65: e6 73       .s
    dex                                                               ; 3c67: ca          .
    bne c3c5c                                                         ; 3c68: d0 f2       ..
; $3c6a referenced 2 times by $3c54, $3c58
c3c6a
    ldx #0                                                            ; 3c6a: a2 00       ..
; $3c6c referenced 1 time by $3c75
loop_c3c6c
    lda something5_high_copy_start,x                                  ; 3c6c: bd 88 40    ..@
    sta something5_TODO,x                                             ; 3c6f: 9d b7 0a    ...
    inx                                                               ; 3c72: e8          .
    cpx #something5_high_copy_end - something5_high_copy_start        ; 3c73: e0 48       .H
    bcc loop_c3c6c                                                    ; 3c75: 90 f5       ..
    ldy #0                                                            ; 3c77: a0 00       ..
; $3c79 referenced 1 time by $3c80
loop_c3c79
    lda something3_high_copy_start,y                                  ; 3c79: b9 cb 3f    ..?
    sta something3_TODO,y                                             ; 3c7c: 99 00 0c    ...
    iny                                                               ; 3c7f: c8          .
    bne loop_c3c79                                                    ; 3c80: d0 f7       ..
    ldy #0                                                            ; 3c82: a0 00       ..
; $3c84 referenced 1 time by $3c8d
loop_c3c84
    lda something5_high_copy_end,y                                    ; 3c84: b9 d0 40    ..@
    sta something9_TODO,y                                             ; 3c87: 99 31 01    .1.
    iny                                                               ; 3c8a: c8          .
    cpy #something9_high_copy_end - something9_high_copy_start        ; 3c8b: c0 2f       ./
    bne loop_c3c84                                                    ; 3c8d: d0 f5       ..
    lda copy_protection_flag                                          ; 3c8f: ad 03 11    ...
    and #8                                                            ; 3c92: 29 08       ).
    beq c3c9b                                                         ; 3c94: f0 05       ..
    lda #$32 ; '2'                                                    ; 3c96: a9 32       .2
    sta l3f05                                                         ; 3c98: 8d 05 3f    ..?
; $3c9b referenced 1 time by $3c94
c3c9b
    ldx #<(drive_0_command)                                           ; 3c9b: a2 ff       ..
    ldy #>(drive_0_command)                                           ; 3c9d: a0 3e       .>
    jsr oscli                                                         ; 3c9f: 20 f7 ff     ..
    ldx #<(dir_dollar_command)                                        ; 3ca2: a2 07       ..
    ldy #>(dir_dollar_command)                                        ; 3ca4: a0 3f       .?
    jsr oscli                                                         ; 3ca6: 20 f7 ff     ..
    lda #osbyte_close_spool_exec                                      ; 3ca9: a9 77       .w
    jsr osbyte                                                        ; 3cab: 20 f4 ff     ..            ; Close any *SPOOL and *EXEC files
    lda #osbyte_read_write_escape_break_effect                        ; 3cae: a9 c8       ..
    ldx #3                                                            ; 3cb0: a2 03       ..
    ldy #0                                                            ; 3cb2: a0 00       ..
    jsr osbyte                                                        ; 3cb4: 20 f4 ff     ..            ; Write Disable ESCAPE action, clear memory on BREAK, value X=3
    lda #osbyte_read_write_first_byte_break_intercept                 ; 3cb7: a9 f7       ..
    ldx #0                                                            ; 3cb9: a2 00       ..
    ldy #0                                                            ; 3cbb: a0 00       ..
    jsr osbyte                                                        ; 3cbd: 20 f4 ff     ..            ; Write reset intercept code (opcode), value X=0
    lda #osbyte_opt                                                   ; 3cc0: a9 8b       ..
    ldx #0                                                            ; 3cc2: a2 00       ..
    ldy #0                                                            ; 3cc4: a0 00       ..
    jsr osbyte                                                        ; 3cc6: 20 f4 ff     ..            ; *OPT 0,0: Reset all options for current filing system
    lda #osbyte_set_cursor_editing                                    ; 3cc9: a9 04       ..
    ldx #1                                                            ; 3ccb: a2 01       ..
    ldy #0                                                            ; 3ccd: a0 00       ..
    jsr osbyte                                                        ; 3ccf: 20 f4 ff     ..            ; Disable cursor editing (edit keys give ASCII 135-139) (X=1)
    lda brkv                                                          ; 3cd2: ad 02 02    ...
    sta l0ab1                                                         ; 3cd5: 8d b1 0a    ...
    sta l0ab3                                                         ; 3cd8: 8d b3 0a    ...
    lda brkv+1                                                        ; 3cdb: ad 03 02    ...
    sta l0ab2                                                         ; 3cde: 8d b2 0a    ...
    sta l0ab4                                                         ; 3ce1: 8d b4 0a    ...
    lda irq1v                                                         ; 3ce4: ad 04 02    ...
    sta l0ab5                                                         ; 3ce7: 8d b5 0a    ...
    lda irq1v+1                                                       ; 3cea: ad 05 02    ...
    sta l0ab6                                                         ; 3ced: 8d b6 0a    ...
    lda #vdu_define_character                                         ; 3cf0: a9 17       ..
    jsr oswrch                                                        ; 3cf2: 20 ee ff     ..            ; Write character 23
    lda #$fe                                                          ; 3cf5: a9 fe       ..
    jsr oswrch                                                        ; 3cf7: 20 ee ff     ..            ; Write character 254
    ldx #0                                                            ; 3cfa: a2 00       ..
; $3cfc referenced 1 time by $3d05
loop_c3cfc
    lda character_fe_bitmap,x                                         ; 3cfc: bd 66 3f    .f?
    jsr oswrch                                                        ; 3cff: 20 ee ff     ..            ; Write character
    inx                                                               ; 3d02: e8          .
    cpx #8                                                            ; 3d03: e0 08       ..
    bcc loop_c3cfc                                                    ; 3d05: 90 f5       ..
    lda #osbyte_set_printer_ignore                                    ; 3d07: a9 06       ..
    ldx #0                                                            ; 3d09: a2 00       ..
    jsr osbyte                                                        ; 3d0b: 20 f4 ff     ..            ; Set printer ignore character to X=0
    lda #$fe                                                          ; 3d0e: a9 fe       ..
    sta currently_loaded_level                                        ; 3d10: 85 37       .7
    lda #0                                                            ; 3d12: a9 00       ..
    sta l0004                                                         ; 3d14: 85 04       ..
    lda #$ff                                                          ; 3d16: a9 ff       ..
    sta l002e                                                         ; 3d18: 85 2e       ..
    lda #$20 ; ' '                                                    ; 3d1a: a9 20       .
    sta l005c                                                         ; 3d1c: 85 5c       .\
    sta l005d                                                         ; 3d1e: 85 5d       .]
    sta l005e                                                         ; 3d20: 85 5e       .^
    lda #$cb                                                          ; 3d22: a9 cb       ..
    sta l0045                                                         ; 3d24: 85 45       .E
    lda #$ff                                                          ; 3d26: a9 ff       ..
    sta l0043                                                         ; 3d28: 85 43       .C
    lda #0                                                            ; 3d2a: a9 00       ..
    sta l003a                                                         ; 3d2c: 85 3a       .:
    sta l003b                                                         ; 3d2e: 85 3b       .;
    sta l0015                                                         ; 3d30: 85 15       ..
    lda #1                                                            ; 3d32: a9 01       ..
    sta l001d                                                         ; 3d34: 85 1d       ..
    lda #osbyte_select_adc_channels                                   ; 3d36: a9 10       ..
    ldx #0                                                            ; 3d38: a2 00       ..
    jsr osbyte                                                        ; 3d3a: 20 f4 ff     ..            ; Disable ADC channel sampling (X=0)
    ldx #$ac                                                          ; 3d3d: a2 ac       ..
    ldy #$38 ; '8'                                                    ; 3d3f: a0 38       .8
    jsr define_envelope                                               ; 3d41: 20 5e 39     ^9
    ldx #$c2                                                          ; 3d44: a2 c2       ..
    ldy #$38 ; '8'                                                    ; 3d46: a0 38       .8
    jsr define_envelope                                               ; 3d48: 20 5e 39     ^9
    ldx #$d8                                                          ; 3d4b: a2 d8       ..
    ldy #$38 ; '8'                                                    ; 3d4d: a0 38       .8
    jsr define_envelope                                               ; 3d4f: 20 5e 39     ^9
    ldy #7                                                            ; 3d52: a0 07       ..
; $3d54 referenced 1 time by $3d5f
loop_c3d54
    lda #0                                                            ; 3d54: a9 00       ..
    sta l0aa1,y                                                       ; 3d56: 99 a1 0a    ...
    lda #$ff                                                          ; 3d59: a9 ff       ..
    sta l0aa9,y                                                       ; 3d5b: 99 a9 0a    ...
    dey                                                               ; 3d5e: 88          .
    bpl loop_c3d54                                                    ; 3d5f: 10 f3       ..
    lda #$c7                                                          ; 3d61: a9 c7       ..
    sta l38ac                                                         ; 3d63: 8d ac 38    ..8
    lda #$c6                                                          ; 3d66: a9 c6       ..
    sta l38ad                                                         ; 3d68: 8d ad 38    ..8
    lda #$80                                                          ; 3d6b: a9 80       ..
    sta l38c2                                                         ; 3d6d: 8d c2 38    ..8
    lda #$7f                                                          ; 3d70: a9 7f       ..
    sta l38c3                                                         ; 3d72: 8d c3 38    ..8
    lda user_via_t1c_l                                                ; 3d75: ad 64 fe    .d.
    sta l0006                                                         ; 3d78: 85 06       ..
    lda user_via_t1c_h                                                ; 3d7a: ad 65 fe    .e.
    sta l0007                                                         ; 3d7d: 85 07       ..
    lda user_via_t2c_l                                                ; 3d7f: ad 68 fe    .h.
    sta l0008                                                         ; 3d82: 85 08       ..
    lda user_via_t2c_h                                                ; 3d84: ad 69 fe    .i.
    sta l0009                                                         ; 3d87: 85 09       ..
    lda #1                                                            ; 3d89: a9 01       ..
    sta l000a                                                         ; 3d8b: 85 0a       ..
    lda #$62 ; 'b'                                                    ; 3d8d: a9 62       .b
    sta l004c                                                         ; 3d8f: 85 4c       .L
; Presumably as part of a copy protection scheme, we check to see if VDU output was
; disabled (VDU 21) when we first started to execute, before we re-enabled output (VDU
; 6) ourselves.
    lda initial_screen_disabled_flag                                  ; 3d91: ad 6e 3f    .n?
    bne initial_screen_disabled_flag_ok                               ; 3d94: d0 0d       ..
; VDU output wasn't disabled when we started to execute. Do some stuff (TODO: what?) to
; break things.
    lda #vdu_set_mode                                                 ; 3d96: a9 16       ..
    jsr oswrch                                                        ; 3d98: 20 ee ff     ..            ; Write character 22
    lda #4                                                            ; 3d9b: a9 04       ..
    jsr oswrch                                                        ; 3d9d: 20 ee ff     ..            ; Write character 4
    jmp c3db9                                                         ; 3da0: 4c b9 3d    L.=

; $3da3 referenced 1 time by $3d94
initial_screen_disabled_flag_ok
    lda #0                                                            ; 3da3: a9 00       ..
    sta l0070                                                         ; 3da5: 85 70       .p
    tay                                                               ; 3da7: a8          .
    ldx #$5b ; '['                                                    ; 3da8: a2 5b       .[
    stx l0071                                                         ; 3daa: 86 71       .q
    ldx l004c                                                         ; 3dac: a6 4c       .L
; $3dae referenced 2 times by $3db1, $3db7
c3dae
    sta (l0070),y                                                     ; 3dae: 91 70       .p
    iny                                                               ; 3db0: c8          .
    bne c3dae                                                         ; 3db1: d0 fb       ..
    inc l0071                                                         ; 3db3: e6 71       .q
    cpx l0071                                                         ; 3db5: e4 71       .q
    bne c3dae                                                         ; 3db7: d0 f5       ..
; TODO: A lot of this code looks - I haven't checked yet - similar to initialisation
; code in the IMOGEN file. It should be annotated but I won't bother yet as it may be I
; can copy this from the IMOGEN code. Is it possible that what I thought was copy
; protection regarding VDU 21 status is in fact just a way to make the G file self-
; contained if it's run directly from the command line during development, instead of
; from IMOGEN?
; $3db9 referenced 1 time by $3da0
c3db9
    lda #vdu_define_text_window                                       ; 3db9: a9 1c       ..
    jsr oswrch                                                        ; 3dbb: 20 ee ff     ..            ; Write character 28
    lda #1                                                            ; 3dbe: a9 01       ..
    jsr oswrch                                                        ; 3dc0: 20 ee ff     ..            ; Write character 1
    lda #$1f                                                          ; 3dc3: a9 1f       ..
    jsr oswrch                                                        ; 3dc5: 20 ee ff     ..            ; Write character 31
    lda #screen_width_minus_one                                       ; 3dc8: a9 27       .'
    jsr oswrch                                                        ; 3dca: 20 ee ff     ..            ; Write character 39
    lda #0                                                            ; 3dcd: a9 00       ..
    jsr oswrch                                                        ; 3dcf: 20 ee ff     ..            ; Write character 0
    lda #vdu_set_text_colour                                          ; 3dd2: a9 11       ..
    jsr oswrch                                                        ; 3dd4: 20 ee ff     ..            ; Write character 17
    lda #$81                                                          ; 3dd7: a9 81       ..
    jsr oswrch                                                        ; 3dd9: 20 ee ff     ..            ; Write character 129
    lda #vdu_set_text_colour                                          ; 3ddc: a9 11       ..
    jsr oswrch                                                        ; 3dde: 20 ee ff     ..            ; Write character 17
    lda #0                                                            ; 3de1: a9 00       ..
    jsr oswrch                                                        ; 3de3: 20 ee ff     ..            ; Write character 0
    lda #vdu_set_graphics_colour                                      ; 3de6: a9 12       ..
    jsr oswrch                                                        ; 3de8: 20 ee ff     ..            ; Write character 18
    lda #0                                                            ; 3deb: a9 00       ..
    jsr oswrch                                                        ; 3ded: 20 ee ff     ..            ; Write character 0
    jsr oswrch                                                        ; 3df0: 20 ee ff     ..            ; Write character
    ldx #0                                                            ; 3df3: a2 00       ..
    ldy #0                                                            ; 3df5: a0 00       ..
    lda #osbyte_tv                                                    ; 3df7: a9 90       ..
    jsr osbyte                                                        ; 3df9: 20 f4 ff     ..            ; *TV 0,0 turn interlace on
    stx l0070                                                         ; 3dfc: 86 70       .p             ; X is the previous screen shift setting
    jsr osbyte                                                        ; 3dfe: 20 f4 ff     ..
    lda #crtc_cursor_start                                            ; 3e01: a9 0a       ..
    sta crtc_address_register                                         ; 3e03: 8d 00 fe    ...
    lda #$20 ; ' '                                                    ; 3e06: a9 20       .
    sta crtc_address_write                                            ; 3e08: 8d 01 fe    ...
    lda #$0b                                                          ; 3e0b: a9 0b       ..
    lda #0                                                            ; 3e0d: a9 00       ..
    lda #$23 ; '#'                                                    ; 3e0f: a9 23       .#
    clc                                                               ; 3e11: 18          .
    adc l0070                                                         ; 3e12: 65 70       ep
    sec                                                               ; 3e14: 38          8
    sbc #1                                                            ; 3e15: e9 01       ..
    sta l110b                                                         ; 3e17: 8d 0b 11    ...
    sec                                                               ; 3e1a: 38          8
    sbc #5                                                            ; 3e1b: e9 05       ..
    tax                                                               ; 3e1d: aa          .
    lda #crtc_vert_sync_pos                                           ; 3e1e: a9 07       ..
    sta crtc_address_register                                         ; 3e20: 8d 00 fe    ...
    stx crtc_address_write                                            ; 3e23: 8e 01 fe    ...
    lda #crtc_screen_start_low                                        ; 3e26: a9 0d       ..
    sta crtc_address_register                                         ; 3e28: 8d 00 fe    ...
    lda #$40 ; '@'                                                    ; 3e2b: a9 40       .@
    sta crtc_address_write                                            ; 3e2d: 8d 01 fe    ...
    lda #crtc_screen_start_high                                       ; 3e30: a9 0c       ..
    sta crtc_address_register                                         ; 3e32: 8d 00 fe    ...
    lda #$0c                                                          ; 3e35: a9 0c       ..
    sta crtc_address_write                                            ; 3e37: 8d 01 fe    ...
    lda #crtc_vert_displayed                                          ; 3e3a: a9 06       ..
    sta crtc_address_register                                         ; 3e3c: 8d 00 fe    ...
    lda #$18                                                          ; 3e3f: a9 18       ..
    sta crtc_address_write                                            ; 3e41: 8d 01 fe    ...
    lda #crtc_interlace_delay                                         ; 3e44: a9 08       ..
    sta crtc_address_register                                         ; 3e46: 8d 00 fe    ...
    lda #0                                                            ; 3e49: a9 00       ..
    sta crtc_address_write                                            ; 3e4b: 8d 01 fe    ...
    asl l0070                                                         ; 3e4e: 06 70       .p
    ldy #3                                                            ; 3e50: a0 03       ..
; $3e52 referenced 1 time by $3e5d
loop_c3e52
    lda l1104,y                                                       ; 3e52: b9 04 11    ...
    sec                                                               ; 3e55: 38          8
    sbc l0070                                                         ; 3e56: e5 70       .p
    sta l1104,y                                                       ; 3e58: 99 04 11    ...
    dey                                                               ; 3e5b: 88          .
    dey                                                               ; 3e5c: 88          .
    bpl loop_c3e52                                                    ; 3e5d: 10 f3       ..
    lda #<sprdata_filename                                            ; 3e5f: a9 80       ..
    sta l0070                                                         ; 3e61: 85 70       .p
    lda #>sprdata_filename                                            ; 3e63: a9 19       ..
    sta l0071                                                         ; 3e65: 85 71       .q
    lda #osfile_read_catalogue_info                                   ; 3e67: a9 05       ..
    jsr osfile_wrapper                                                ; 3e69: 20 dc 16     ..
; Load 'sprdata' file into memory so it ends just below $5bc0. TODO: use named constant
    lda #$c0                                                          ; 3e6c: a9 c0       ..
    sec                                                               ; 3e6e: 38          8
    sbc l007a                                                         ; 3e6f: e5 7a       .z
    sta l0054                                                         ; 3e71: 85 54       .T
    lda #$5b ; '['                                                    ; 3e73: a9 5b       .[
    sbc l007b                                                         ; 3e75: e5 7b       .{
    sta l0055                                                         ; 3e77: 85 55       .U
    jsr load_sprdata_to_addr_at_l0054                                 ; 3e79: 20 6f 19     o.
    lda l0054                                                         ; 3e7c: a5 54       .T
    pha                                                               ; 3e7e: 48          H
    lda l0055                                                         ; 3e7f: a5 55       .U
    pha                                                               ; 3e81: 48          H
; Load 'icodata' file into memory at icodata
    ldx #<icodata                                                     ; 3e82: a2 ff       ..
    stx l0054                                                         ; 3e84: 86 54       .T
    ldy #>icodata                                                     ; 3e86: a0 40       .@
    sty l0055                                                         ; 3e88: 84 55       .U
    lda copy_protection_flag                                          ; 3e8a: ad 03 11    ...
    and #4                                                            ; 3e8d: 29 04       ).
    bne read_icodata_using_osword_7f                                  ; 3e8f: d0 10       ..
    lda #<icodata_filename                                            ; 3e91: a9 5e       .^
    sta l0070                                                         ; 3e93: 85 70       .p
    lda #>icodata_filename                                            ; 3e95: a9 3f       .?
    sta l0071                                                         ; 3e97: 85 71       .q
    lda #osfile_load                                                  ; 3e99: a9 ff       ..
    jsr osfile_wrapper                                                ; 3e9b: 20 dc 16     ..
    jmp c3f0d                                                         ; 3e9e: 4c 0d 3f    L.?

; $3ea1 referenced 2 times by $3e8f, $3ebe
read_icodata_using_osword_7f
    lda #$27 ; '''                                                    ; 3ea1: a9 27       .'
    jsr seek_track_a                                                  ; 3ea3: 20 c9 3e     .>
    lda #$7f                                                          ; 3ea6: a9 7f       ..
    jsr set_track_special_register_to_a                               ; 3ea8: 20 d5 3e     .>
    lda #$7f                                                          ; 3eab: a9 7f       ..
    ldx #<(osword_7f_block_read)                                      ; 3ead: a2 f4       ..
    ldy #>(osword_7f_block_read)                                      ; 3eaf: a0 3e       .>
    jsr osword                                                        ; 3eb1: 20 f1 ff     ..            ; Single track single density FDC command (see https://beebwiki.mdfs.net/OSWORDs)
    lda osword_7f_read_result                                         ; 3eb4: ad fe 3e    ..>
    beq c3ec1                                                         ; 3eb7: f0 08       ..
    lda #0                                                            ; 3eb9: a9 00       ..
    jsr seek_track_a                                                  ; 3ebb: 20 c9 3e     .>
    jmp read_icodata_using_osword_7f                                  ; 3ebe: 4c a1 3e    L.>

; $3ec1 referenced 1 time by $3eb7
c3ec1
    lda #$27 ; '''                                                    ; 3ec1: a9 27       .'
    jsr set_track_special_register_to_a                               ; 3ec3: 20 d5 3e     .>
    jmp c3f0d                                                         ; 3ec6: 4c 0d 3f    L.?

; $3ec9 referenced 2 times by $3ea3, $3ebb
seek_track_a
    sta osword_7f_block_seek_track                                    ; 3ec9: 8d e8 3e    ..>
    lda #$7f                                                          ; 3ecc: a9 7f       ..
    ldx #<(osword_7f_block_seek)                                      ; 3ece: a2 e1       ..
    ldy #>(osword_7f_block_seek)                                      ; 3ed0: a0 3e       .>
    jmp osword                                                        ; 3ed2: 4c f1 ff    L..            ; Single track single density FDC command (see https://beebwiki.mdfs.net/OSWORDs)

; $3ed5 referenced 2 times by $3ea8, $3ec3
set_track_special_register_to_a
    sta osword_7f_block_write_special_register_track                  ; 3ed5: 8d f2 3e    ..>
    lda #$7f                                                          ; 3ed8: a9 7f       ..
    ldx #<(osword_7f_block_write_special_register)                    ; 3eda: a2 ea       ..
    ldy #>(osword_7f_block_write_special_register)                    ; 3edc: a0 3e       .>
    jmp osword                                                        ; 3ede: 4c f1 ff    L..            ; Single track single density FDC command (see https://beebwiki.mdfs.net/OSWORDs)

osword_7f_block_seek
    !byte 0                                                           ; 3ee1: 00          .              ; drive
    !word $ffff,     0                                                ; 3ee2: ff ff 00... ...            ; data address
    !byte 1                                                           ; 3ee6: 01          .              ; number of parameters
    !byte $69                                                         ; 3ee7: 69          i              ; command ($69=seek)
; $3ee8 referenced 1 time by $3ec9
osword_7f_block_seek_track
    !byte 0                                                           ; 3ee8: 00          .
osword_7f_seek_result
    !byte 0                                                           ; 3ee9: 00          .
osword_7f_block_write_special_register
    !byte 0                                                           ; 3eea: 00          .              ; drive
    !word $ffff,     0                                                ; 3eeb: ff ff 00... ...            ; data address
    !byte 2                                                           ; 3eef: 02          .              ; number of parameters
    !byte $7a                                                         ; 3ef0: 7a          z              ; command ($7a=write special register)
    !byte $12                                                         ; 3ef1: 12          .              ; special register ($12=track)
; $3ef2 referenced 1 time by $3ed5
osword_7f_block_write_special_register_track
    !byte 0                                                           ; 3ef2: 00          .
osword_7f_write_special_register_result
    !byte 0                                                           ; 3ef3: 00          .
; TODO: I think the track and sector values in this block are logical tracks and rely
; on the previous step operation, but I'm not sure. I suspect this is done entirely for
; obfuscation and has been converted to file operations in this version, but I haven't
; actually checked that.
osword_7f_block_read
    !byte 0                                                           ; 3ef4: 00          .              ; drive
    !word icodata,       0                                            ; 3ef5: ff 40 00... .@.            ; data address
    !byte 3                                                           ; 3ef9: 03          .              ; number of parameters
    !byte $53                                                         ; 3efa: 53          S              ; command ($53=read data)
    !byte $7f                                                         ; 3efb: 7f          .              ; track
    !byte $7d                                                         ; 3efc: 7d          }              ; sector
    !byte $23                                                         ; 3efd: 23          #              ; size+count ($23=3 256 byte sectors)
; $3efe referenced 1 time by $3eb4
osword_7f_read_result
    !byte 0                                                           ; 3efe: 00          .
drive_0_command
    !text "DRIVE "                                                    ; 3eff: 44 52 49... DRI
; $3f05 referenced 1 time by $3c98
l3f05
    !byte $30, $0d                                                    ; 3f05: 30 0d       0.
dir_dollar_command
    !text "DIR $"                                                     ; 3f07: 44 49 52... DIR
    !byte $0d                                                         ; 3f0c: 0d          .

; $3f0d referenced 2 times by $3e9e, $3ec6
c3f0d
    lda #0                                                            ; 3f0d: a9 00       ..
    jsr set_yx_based_on_a                                             ; 3f0f: 20 2c 13     ,.
    stx l0070                                                         ; 3f12: 86 70       .p
    sty l0071                                                         ; 3f14: 84 71       .q
    ldy #$11                                                          ; 3f16: a0 11       ..
; $3f18 referenced 1 time by $3f1e
loop_c3f18
    lda (l0070),y                                                     ; 3f18: b1 70       .p
    sta l0a7e,y                                                       ; 3f1a: 99 7e 0a    .~.
    dey                                                               ; 3f1d: 88          .
    bne loop_c3f18                                                    ; 3f1e: d0 f8       ..
    lda (l0070),y                                                     ; 3f20: b1 70       .p
    and #$40 ; '@'                                                    ; 3f22: 29 40       )@
    beq c3f2d                                                         ; 3f24: f0 07       ..
    lda (l0070),y                                                     ; 3f26: b1 70       .p
    and #$bf                                                          ; 3f28: 29 bf       ).
    sta copy_protection_flag                                          ; 3f2a: 8d 03 11    ...
; $3f2d referenced 1 time by $3f24
c3f2d
    jsr sub_c3f6f                                                     ; 3f2d: 20 6f 3f     o?
    lda #osbyte_reset_soft_keys                                       ; 3f30: a9 12       ..
    jsr osbyte                                                        ; 3f32: 20 f4 ff     ..            ; Reset function keys
    jsr sub_c2980                                                     ; 3f35: 20 80 29     .)
    jsr sub_c29a8                                                     ; 3f38: 20 a8 29     .)
    lda l004c                                                         ; 3f3b: a5 4c       .L
    pha                                                               ; 3f3d: 48          H
    lda #$58 ; 'X'                                                    ; 3f3e: a9 58       .X
    sta l004c                                                         ; 3f40: 85 4c       .L
    ldx #$24 ; '$'                                                    ; 3f42: a2 24       .$
    ldy #6                                                            ; 3f44: a0 06       ..
    lda #9                                                            ; 3f46: a9 09       ..
    jsr sub_c1f4c                                                     ; 3f48: 20 4c 1f     L.
    pla                                                               ; 3f4b: 68          h
    sta l004c                                                         ; 3f4c: 85 4c       .L
    pla                                                               ; 3f4e: 68          h
    sta l0055                                                         ; 3f4f: 85 55       .U
    pla                                                               ; 3f51: 68          h
    sta l0054                                                         ; 3f52: 85 54       .T
    lda #3                                                            ; 3f54: a9 03       ..
    jsr mix_a_with_state                                              ; 3f56: 20 a6 18     ..
    sta l005f                                                         ; 3f59: 85 5f       ._
    jmp c110c                                                         ; 3f5b: 4c 0c 11    L..

icodata_filename
    !text "icodata", $0d                                              ; 3f5e: 69 63 6f... ico
; $3f66 referenced 1 time by $3cfc
character_fe_bitmap
    !byte %....#...                                                   ; 3f66: 08          .
    !byte %...#.#..                                                   ; 3f67: 14          .
    !byte %..#...#.                                                   ; 3f68: 22          "
    !byte %.#.....#                                                   ; 3f69: 41          A
    !byte %..#...#.                                                   ; 3f6a: 22          "
    !byte %...#.#..                                                   ; 3f6b: 14          .
    !byte %....#...                                                   ; 3f6c: 08          .
    !byte %........                                                   ; 3f6d: 00          .
; $3f6e referenced 2 times by $3add, $3d91
initial_screen_disabled_flag
    !byte 0                                                           ; 3f6e: 00          .

; $3f6f referenced 1 time by $3f2d
sub_c3f6f
    lda copy_protection_flag                                          ; 3f6f: ad 03 11    ...
    and #1                                                            ; 3f72: 29 01       ).
    sta l005b                                                         ; 3f74: 85 5b       .[
    beq c3fba                                                         ; 3f76: f0 42       .B
; TODO: I suspect the following code is copy protection related - writing data to the
; sideways ROM region feels wrong.
    ldy #$0f                                                          ; 3f78: a0 0f       ..
    sei                                                               ; 3f7a: 78          x
; $3f7b referenced 1 time by $3f82
loop_c3f7b
    lda l3fbb,y                                                       ; 3f7b: b9 bb 3f    ..?
    sta l8000,y                                                       ; 3f7e: 99 00 80    ...
    dey                                                               ; 3f81: 88          .
    bpl loop_c3f7b                                                    ; 3f82: 10 f7       ..
    cli                                                               ; 3f84: 58          X
    ldy #0                                                            ; 3f85: a0 00       ..
; $3f87 referenced 1 time by $3f94
loop_c3f87
    lda something4_TODO,y                                             ; 3f87: b9 2c 40    .,@
    sta lbe00,y                                                       ; 3f8a: 99 00 be    ...
    lda l0b00,y                                                       ; 3f8d: b9 00 0b    ...
    sta lbf00,y                                                       ; 3f90: 99 00 bf    ...
    iny                                                               ; 3f93: c8          .
    bne loop_c3f87                                                    ; 3f94: d0 f1       ..
    lda #osbyte_read_write_escape_break_effect                        ; 3f96: a9 c8       ..
    ldx #1                                                            ; 3f98: a2 01       ..
    ldy #0                                                            ; 3f9a: a0 00       ..
    jsr osbyte                                                        ; 3f9c: 20 f4 ff     ..            ; Write Disable ESCAPE action, set normal BREAK action, value X=1
    lda #osbyte_read_write_first_byte_break_intercept                 ; 3f9f: a9 f7       ..
    ldx #$4c ; 'L'                                                    ; 3fa1: a2 4c       .L
    ldy #0                                                            ; 3fa3: a0 00       ..
    jsr osbyte                                                        ; 3fa5: 20 f4 ff     ..            ; Write reset intercept code (opcode), value X=76
    lda #osbyte_read_write_second_byte_break_intercept                ; 3fa8: a9 f8       ..
    ldx #$45 ; 'E'                                                    ; 3faa: a2 45       .E
    ldy #0                                                            ; 3fac: a0 00       ..
    jsr osbyte                                                        ; 3fae: 20 f4 ff     ..            ; Write reset intercept code (operand low), value X=69
    lda #osbyte_read_write_third_byte_break_intercept                 ; 3fb1: a9 f9       ..
    ldx #$18                                                          ; 3fb3: a2 18       ..
    ldy #0                                                            ; 3fb5: a0 00       ..
    jsr osbyte                                                        ; 3fb7: 20 f4 ff     ..            ; Write reset intercept code (operand high), value X=24
; $3fba referenced 1 time by $3f76
c3fba
    rts                                                               ; 3fba: 60          `

; $3fbb referenced 1 time by $3f7b
l3fbb
    !byte $4c,   8, $80, $4c,   8, $80,   0, $0a, $60,   0,   0,   0  ; 3fbb: 4c 08 80... L..
    !byte   0,   0,   0,   0                                          ; 3fc7: 00 00 00... ...
; $3fcb referenced 11 times by $11f5, $1842, $1850, $1df7, $1e80, $1e88, $1ee8, $1ef0, $1f1b, $3c79, $3c7c
something3_high_copy_start
; $3fcb referenced 11 times by $11f5, $1842, $1850, $1df7, $1e80, $1e88, $1ee8, $1ef0, $1f1b, $3c79, $3c7c

!pseudopc $0c00 {
; $3fcb referenced 11 times by $11f5, $1842, $1850, $1df7, $1e80, $1e88, $1ee8, $1ef0, $1f1b, $3c79, $3c7c
something3_TODO
    lda #$ff                                                          ; 3fcb: a9 ff       ..  :0c00[4]
    sta l110a                                                         ; 3fcd: 8d 0a 11    ... :0c02[4]
    lda l175d                                                         ; 3fd0: ad 5d 17    .]. :0c05[4]
    sta l175e                                                         ; 3fd3: 8d 5e 17    .^. :0c08[4]
    lda l175f                                                         ; 3fd6: ad 5f 17    ._. :0c0b[4]
    sta l1760                                                         ; 3fd9: 8d 60 17    .`. :0c0e[4]
    sei                                                               ; 3fdc: 78          x   :0c11[4]
    lda #$7f                                                          ; 3fdd: a9 7f       ..  :0c12[4]
    sta user_via_ier                                                  ; 3fdf: 8d 6e fe    .n. :0c14[4]
    lda #$c0                                                          ; 3fe2: a9 c0       ..  :0c17[4]
    sta system_via_acr                                                ; 3fe4: 8d 4b fe    .K. :0c19[4]
    lda #$ff                                                          ; 3fe7: a9 ff       ..  :0c1c[4]
    sta system_via_t2c_l                                              ; 3fe9: 8d 48 fe    .H. :0c1e[4]
    lda #$3c ; '<'                                                    ; 3fec: a9 3c       .<  :0c21[4]
    sta system_via_ier                                                ; 3fee: 8d 4e fe    .N. :0c23[4]
    lda #$a0                                                          ; 3ff1: a9 a0       ..  :0c26[4]
    sta irq1v                                                         ; 3ff3: 8d 04 02    ... :0c28[4]
    lda #$17                                                          ; 3ff6: a9 17       ..  :0c2b[4]
    sta irq1v+1                                                       ; 3ff8: 8d 05 02    ... :0c2d[4]
    cli                                                               ; 3ffb: 58          X   :0c30[4]
    jsr sub_c178c                                                     ; 3ffc: 20 8c 17     .. :0c31[4]
    jsr sub_c178c                                                     ; 3fff: 20 8c 17     .. :0c34[4]
    lda #crtc_vert_sync_pos                                           ; 4002: a9 07       ..  :0c37[4]
    sta crtc_address_register                                         ; 4004: 8d 00 fe    ... :0c39[4]
    lda l110b                                                         ; 4007: ad 0b 11    ... :0c3c[4]
    sta crtc_address_write                                            ; 400a: 8d 01 fe    ... :0c3f[4]
    lda #crtc_screen_start_low                                        ; 400d: a9 0d       ..  :0c42[4]
    sta crtc_address_register                                         ; 400f: 8d 00 fe    ... :0c44[4]
    lda #$78 ; 'x'                                                    ; 4012: a9 78       .x  :0c47[4]
    sta crtc_address_write                                            ; 4014: 8d 01 fe    ... :0c49[4]
    lda #crtc_screen_start_high                                       ; 4017: a9 0c       ..  :0c4c[4]
    sta crtc_address_register                                         ; 4019: 8d 00 fe    ... :0c4e[4]
    lda #$0b                                                          ; 401c: a9 0b       ..  :0c51[4]
    sta crtc_address_write                                            ; 401e: 8d 01 fe    ... :0c53[4]
    lda #crtc_vert_displayed                                          ; 4021: a9 06       ..  :0c56[4]
    sta crtc_address_register                                         ; 4023: 8d 00 fe    ... :0c58[4]
    lda #$1d                                                          ; 4026: a9 1d       ..  :0c5b[4]
    sta crtc_address_write                                            ; 4028: 8d 01 fe    ... :0c5d[4]
    rts                                                               ; 402b: 60          `   :0c60[4]

; $402c referenced 1 time by $3f87
}

; $402c referenced 1 time by $3f87
something4_TODO
; $402c referenced 1 time by $3f87
    sei                                                               ; 402c: 78          x
    lda l0ab5                                                         ; 402d: ad b5 0a    ...
    sta irq1v                                                         ; 4030: 8d 04 02    ...
    lda l0ab6                                                         ; 4033: ad b6 0a    ...
    sta irq1v+1                                                       ; 4036: 8d 05 02    ...
    cli                                                               ; 4039: 58          X
    lda #3                                                            ; 403a: a9 03       ..
    jsr oswrch                                                        ; 403c: 20 ee ff     ..            ; Write character 3
    lda #$16                                                          ; 403f: a9 16       ..
    jsr oswrch                                                        ; 4041: 20 ee ff     ..            ; Write character 22
    lda #7                                                            ; 4044: a9 07       ..
    jsr oswrch                                                        ; 4046: 20 ee ff     ..            ; Write character 7
    lda #osbyte_set_cursor_editing                                    ; 4049: a9 04       ..
    ldx #0                                                            ; 404b: a2 00       ..
    ldy #0                                                            ; 404d: a0 00       ..
    jsr osbyte                                                        ; 404f: 20 f4 ff     ..            ; Enable cursor editing (X=0)
    lda #osbyte_read_write_escape_break_effect                        ; 4052: a9 c8       ..
    ldx #0                                                            ; 4054: a2 00       ..
    ldy #0                                                            ; 4056: a0 00       ..
    jsr osbyte                                                        ; 4058: 20 f4 ff     ..            ; Write Set normal ESCAPE action, set normal BREAK action, value X=0
    lda #osbyte_flush_buffer_class                                    ; 405b: a9 0f       ..
    ldx #0                                                            ; 405d: a2 00       ..
    jsr osbyte                                                        ; 405f: 20 f4 ff     ..            ; Flush all buffers (X=0)
    lda #0                                                            ; 4062: a9 00       ..
    sta l0287                                                         ; 4064: 8d 87 02    ...
    pla                                                               ; 4067: 68          h
    pla                                                               ; 4068: 68          h
    lda #$42 ; 'B'                                                    ; 4069: a9 42       .B
    sta l0070                                                         ; 406b: 85 70       .p
    lda #$41 ; 'A'                                                    ; 406d: a9 41       .A
    sta l0071                                                         ; 406f: 85 71       .q
    lda #$53 ; 'S'                                                    ; 4071: a9 53       .S
    sta l0072                                                         ; 4073: 85 72       .r
    lda #$49 ; 'I'                                                    ; 4075: a9 49       .I
    sta l0073                                                         ; 4077: 85 73       .s
    lda #$43 ; 'C'                                                    ; 4079: a9 43       .C
    sta l0074                                                         ; 407b: 85 74       .t
    lda #$0d                                                          ; 407d: a9 0d       ..
    sta l0075                                                         ; 407f: 85 75       .u
    ldx #<(l0070)                                                     ; 4081: a2 70       .p
    ldy #>(l0070)                                                     ; 4083: a0 00       ..
    jmp oscli                                                         ; 4085: 4c f7 ff    L..

; $4088 referenced 3 times by $110c, $3c6c, $3c6f
something5_high_copy_start
; $4088 referenced 3 times by $110c, $3c6c, $3c6f

!pseudopc $0ab7 {
; $4088 referenced 3 times by $110c, $3c6c, $3c6f
something5_TODO
    lda #0                                                            ; 4088: a9 00       ..  :0ab7[5]
    tax                                                               ; 408a: aa          .   :0ab9[5]
; $408b referenced 1 time by $0ac0
loop_c0aba
    sta l09ef,x                                                       ; 408b: 9d ef 09    ... :0aba[5]
    inx                                                               ; 408e: e8          .   :0abd[5]
    cpx #$80                                                          ; 408f: e0 80       ..  :0abe[5]
    bcc loop_c0aba                                                    ; 4091: 90 f8       ..  :0ac0[5]
    rts                                                               ; 4093: 60          `   :0ac2[5]

; $4094 referenced 2 times by $359e, $35c8
something6_TODO
    lda #0                                                            ; 4094: a9 00       ..  :0ac3[5]
    tax                                                               ; 4096: aa          .   :0ac5[5]
; $4097 referenced 1 time by $0acc
loop_c0ac6
    eor l09ef,x                                                       ; 4097: 5d ef 09    ].. :0ac6[5]
    inx                                                               ; 409a: e8          .   :0ac9[5]
    cpx #$80                                                          ; 409b: e0 80       ..  :0aca[5]
    bcc loop_c0ac6                                                    ; 409d: 90 f8       ..  :0acc[5]
    eor l09ea                                                         ; 409f: 4d ea 09    M.. :0ace[5]
    eor #$ff                                                          ; 40a2: 49 ff       I.  :0ad1[5]
    rts                                                               ; 40a4: 60          `   :0ad3[5]

; $40a5 referenced 3 times by $1775, $379e, $39e2
something7_TODO
    cpy #$51 ; 'Q'                                                    ; 40a5: c0 51       .Q  :0ad4[5]
    beq c0afe                                                         ; 40a7: f0 26       .&  :0ad6[5]
    pha                                                               ; 40a9: 48          H   :0ad8[5]
    txa                                                               ; 40aa: 8a          .   :0ad9[5]
    pha                                                               ; 40ab: 48          H   :0ada[5]
    tya                                                               ; 40ac: 98          .   :0adb[5]
    ldx #$0f                                                          ; 40ad: a2 0f       ..  :0adc[5]
; $40af referenced 1 time by $0ae4
loop_c0ade
    cmp l0a80,x                                                       ; 40af: dd 80 0a    ... :0ade[5]
    beq c0ae6                                                         ; 40b2: f0 03       ..  :0ae1[5]
    dex                                                               ; 40b4: ca          .   :0ae3[5]
    bpl loop_c0ade                                                    ; 40b5: 10 f8       ..  :0ae4[5]
; $40b7 referenced 1 time by $0ae1
c0ae6
    txa                                                               ; 40b7: 8a          .   :0ae6[5]
    clc                                                               ; 40b8: 18          .   :0ae7[5]
    adc #$41 ; 'A'                                                    ; 40b9: 69 41       iA  :0ae8[5]
    tay                                                               ; 40bb: a8          .   :0aea[5]
    pla                                                               ; 40bc: 68          h   :0aeb[5]
    tax                                                               ; 40bd: aa          .   :0aec[5]
    pla                                                               ; 40be: 68          h   :0aed[5]
    rts                                                               ; 40bf: 60          `   :0aee[5]

; $40c0 referenced 3 times by $113d, $37c5, $39ee
something8_TODO
    cpy #$51 ; 'Q'                                                    ; 40c0: c0 51       .Q  :0aef[5]
    beq c0afe                                                         ; 40c2: f0 0b       ..  :0af1[5]
    pha                                                               ; 40c4: 48          H   :0af3[5]
    tya                                                               ; 40c5: 98          .   :0af4[5]
    sec                                                               ; 40c6: 38          8   :0af5[5]
    sbc #$41 ; 'A'                                                    ; 40c7: e9 41       .A  :0af6[5]
    tay                                                               ; 40c9: a8          .   :0af8[5]
    lda l0a80,y                                                       ; 40ca: b9 80 0a    ... :0af9[5]
    tay                                                               ; 40cd: a8          .   :0afc[5]
    pla                                                               ; 40ce: 68          h   :0afd[5]
; $40cf referenced 2 times by $0ad6, $0af1
c0afe
    rts                                                               ; 40cf: 60          `   :0afe[5]

; $40d0 referenced 4 times by $1206, $2b5e, $3c84, $3c87
}

; $40d0 referenced 4 times by $1206, $2b5e, $3c84, $3c87
something5_high_copy_end
something9_high_copy_start
; $40d0 referenced 4 times by $1206, $2b5e, $3c84, $3c87

!pseudopc $0131 {
; $40d0 referenced 4 times by $1206, $2b5e, $3c84, $3c87
something9_TODO
    pha                                                               ; 40d0: 48          H   :0131[3]
    txa                                                               ; 40d1: 8a          .   :0132[3]
    pha                                                               ; 40d2: 48          H   :0133[3]
    ldx #2                                                            ; 40d3: a2 02       ..  :0134[3]
; $40d5 referenced 1 time by $015a
c0136
    lda l09ec,x                                                       ; 40d5: bd ec 09    ... :0136[3]
    cmp l005c,x                                                       ; 40d8: d5 5c       .\  :0139[3]
    beq c0157                                                         ; 40da: f0 1a       ..  :013b[3]
    sta l005c,x                                                       ; 40dc: 95 5c       .\  :013d[3]
    lda #vdu_goto_xy                                                  ; 40de: a9 1f       ..  :013f[3]
    jsr oswrch                                                        ; 40e0: 20 ee ff     .. :0141[3]   ; Write character 31
    txa                                                               ; 40e3: 8a          .   :0144[3]
    eor #$ff                                                          ; 40e4: 49 ff       I.  :0145[3]
    sec                                                               ; 40e6: 38          8   :0147[3]
    adc #$25 ; '%'                                                    ; 40e7: 69 25       i%  :0148[3]
    jsr oswrch                                                        ; 40e9: 20 ee ff     .. :014a[3]   ; Write character
    lda #6                                                            ; 40ec: a9 06       ..  :014d[3]
    jsr oswrch                                                        ; 40ee: 20 ee ff     .. :014f[3]   ; Write character 6
    lda l005c,x                                                       ; 40f1: b5 5c       .\  :0152[3]
    jsr sub_c1866                                                     ; 40f3: 20 66 18     f. :0154[3]
; $40f6 referenced 1 time by $013b
c0157
    dex                                                               ; 40f6: ca          .   :0157[3]
    cpx #$ff                                                          ; 40f7: e0 ff       ..  :0158[3]
    bne c0136                                                         ; 40f9: d0 da       ..  :015a[3]
    pla                                                               ; 40fb: 68          h   :015c[3]
    tax                                                               ; 40fc: aa          .   :015d[3]
    pla                                                               ; 40fd: 68          h   :015e[3]
    rts                                                               ; 40fe: 60          `   :015f[3]

; $40ff referenced 4 times by $040a, $0457, $183c, $2aa0
}

; $40ff referenced 4 times by $040a, $0457, $183c, $2aa0
some_data_high_copy_TODO
icodata
something9_high_copy_end
; $40ff referenced 4 times by $040a, $0457, $183c, $2aa0

!pseudopc $0400 {
; $40ff referenced 4 times by $040a, $0457, $183c, $2aa0
some_data_low_TODO
    ldx l1106                                                         ; 40ff: ae 06 11    ... :0400[2]
    ldy l1107                                                         ; 4102: ac 07 11    ... :0403[2]
    jmp c1791                                                         ; 4105: 4c 91 17    L.. :0406[2]

; $4108 referenced 9 times by $0428, $048d, $04e3, $0509, $1734, $3406, $3638, $3780, $3806
l0409
    !byte $12                                                         ; 4108: 12          .   :0409[2]

; $4109 referenced 10 times by $1737, $340d, $347f, $34bb, $3519, $355e, $3617, $363f, $378e, $37ba
sub_c040a
    jsr some_data_low_TODO                                            ; 4109: 20 00 04     .. :040a[2]
    lda l0004                                                         ; 410c: a5 04       ..  :040d[2]
    beq c043a                                                         ; 410e: f0 29       .)  :040f[2]
    jsr sub_c3863                                                     ; 4110: 20 63 38     c8 :0411[2]
    ldx #$ff                                                          ; 4113: a2 ff       ..  :0414[2]
    stx l003e                                                         ; 4115: 86 3e       .>  :0416[2]
    inx                                                               ; 4117: e8          .   :0418[2]
    stx l003f                                                         ; 4118: 86 3f       .?  :0419[2]
    lda #$a9                                                          ; 411a: a9 a9       ..  :041b[2]
    sta l0040                                                         ; 411c: 85 40       .@  :041d[2]
    lda #$0a                                                          ; 411e: a9 0a       ..  :041f[2]
    sta l0041                                                         ; 4120: 85 41       .A  :0421[2]
    inx                                                               ; 4122: e8          .   :0423[2]
    stx l0042                                                         ; 4123: 86 42       .B  :0424[2]
    ldy #1                                                            ; 4125: a0 01       ..  :0426[2]
    lda l0409                                                         ; 4127: ad 09 04    ... :0428[2]
    sec                                                               ; 412a: 38          8   :042b[2]
    sbc #2                                                            ; 412b: e9 02       ..  :042c[2]
    sta l003c                                                         ; 412d: 85 3c       .<  :042e[2]
    lda #3                                                            ; 412f: a9 03       ..  :0430[2]
    sta l003d                                                         ; 4131: 85 3d       .=  :0432[2]
    jsr c1abb                                                         ; 4133: 20 bb 1a     .. :0434[2]
    jmp c0444                                                         ; 4136: 4c 44 04    LD. :0437[2]

; $4139 referenced 1 time by $040f
c043a
    lda #$ff                                                          ; 4139: a9 ff       ..  :043a[2]
    sta l0004                                                         ; 413b: 85 04       ..  :043c[2]
    jsr sub_c0474                                                     ; 413d: 20 74 04     t. :043e[2]
    jsr sub_c04cb                                                     ; 4140: 20 cb 04     .. :0441[2]
; $4143 referenced 1 time by $0437
c0444
    lda #vdu_goto_xy                                                  ; 4143: a9 1f       ..  :0444[2]
    jsr oswrch                                                        ; 4145: 20 ee ff     .. :0446[2]   ; Write character 31
    lda #0                                                            ; 4148: a9 00       ..  :0449[2]
    jsr oswrch                                                        ; 414a: 20 ee ff     .. :044b[2]   ; Write character 0
    lda #9                                                            ; 414d: a9 09       ..  :044e[2]
    jmp oswrch                                                        ; 414f: 4c ee ff    L.. :0450[2]   ; Write character 9

; $4152 referenced 8 times by $2a6d, $3428, $35ea, $3652, $3691, $369f, $36f6, $378b
something_TODO
    lda l0004                                                         ; 4152: a5 04       ..  :0453[2]
    beq c0473                                                         ; 4154: f0 1c       ..  :0455[2]
    jsr some_data_low_TODO                                            ; 4156: 20 00 04     .. :0457[2]
    jsr sub_c3863                                                     ; 4159: 20 63 38     c8 :045a[2]
    ldx #$ff                                                          ; 415c: a2 ff       ..  :045d[2]
    stx l003e                                                         ; 415e: 86 3e       .>  :045f[2]
    stx l0042                                                         ; 4160: 86 42       .B  :0461[2]
    inx                                                               ; 4162: e8          .   :0463[2]
    stx l0004                                                         ; 4163: 86 04       ..  :0464[2]
    stx l003f                                                         ; 4165: 86 3f       .?  :0466[2]
    lda #$30 ; '0'                                                    ; 4167: a9 30       .0  :0468[2]
    sta l0040                                                         ; 4169: 85 40       .@  :046a[2]
    lda #5                                                            ; 416b: a9 05       ..  :046c[2]
    sta l0041                                                         ; 416d: 85 41       .A  :046e[2]
    jmp c0505                                                         ; 416f: 4c 05 05    L.. :0470[2]

; $4172 referenced 1 time by $0455
c0473
    rts                                                               ; 4172: 60          `   :0473[2]

; $4173 referenced 1 time by $043e
sub_c0474
    lda #0                                                            ; 4173: a9 00       ..  :0474[2]
    sta l0074                                                         ; 4175: 85 74       .t  :0476[2]
    sta l0076                                                         ; 4177: 85 76       .v  :0478[2]
    lda l004c                                                         ; 4179: a5 4c       .L  :047a[2]
    sta l0075                                                         ; 417b: 85 75       .u  :047c[2]
    sta l0077                                                         ; 417d: 85 77       .w  :047e[2]
    lda #$30 ; '0'                                                    ; 417f: a9 30       .0  :0480[2]
    sta l007a                                                         ; 4181: 85 7a       .z  :0482[2]
    lda #5                                                            ; 4183: a9 05       ..  :0484[2]
    sta l007b                                                         ; 4185: 85 7b       .{  :0486[2]
    clc                                                               ; 4187: 18          .   :0488[2]
    lda #5                                                            ; 4188: a9 05       ..  :0489[2]
    sta l0073                                                         ; 418a: 85 73       .s  :048b[2]
; $418c referenced 1 time by $04c8
c048d
    ldx l0409                                                         ; 418c: ae 09 04    ... :048d[2]
; $418f referenced 2 times by $04ad, $04b2
c0490
    ldy #7                                                            ; 418f: a0 07       ..  :0490[2]
; $4191 referenced 1 time by $0497
loop_c0492
    lda (l0076),y                                                     ; 4191: b1 76       .v  :0492[2]
    sta (l007a),y                                                     ; 4193: 91 7a       .z  :0494[2]
    dey                                                               ; 4195: 88          .   :0496[2]
    bpl loop_c0492                                                    ; 4196: 10 f9       ..  :0497[2]
    lda l007a                                                         ; 4198: a5 7a       .z  :0499[2]
    adc #8                                                            ; 419a: 69 08       i.  :049b[2]
    sta l007a                                                         ; 419c: 85 7a       .z  :049d[2]
    bcc c04a4                                                         ; 419e: 90 03       ..  :049f[2]
    inc l007b                                                         ; 41a0: e6 7b       .{  :04a1[2]
    clc                                                               ; 41a2: 18          .   :04a3[2]
; $41a3 referenced 1 time by $049f
c04a4
    dex                                                               ; 41a3: ca          .   :04a4[2]
    beq c04b4                                                         ; 41a4: f0 0d       ..  :04a5[2]
    lda l0076                                                         ; 41a6: a5 76       .v  :04a7[2]
    adc #8                                                            ; 41a8: 69 08       i.  :04a9[2]
    sta l0076                                                         ; 41aa: 85 76       .v  :04ab[2]
    bcc c0490                                                         ; 41ac: 90 e1       ..  :04ad[2]
    inc l0077                                                         ; 41ae: e6 77       .w  :04af[2]
    clc                                                               ; 41b0: 18          .   :04b1[2]
    bcc c0490                                                         ; 41b1: 90 dc       ..  :04b2[2]
; $41b3 referenced 1 time by $04a5
c04b4
    dec l0073                                                         ; 41b3: c6 73       .s  :04b4[2]
    beq c04ca                                                         ; 41b5: f0 12       ..  :04b6[2]
    lda l0074                                                         ; 41b7: a5 74       .t  :04b8[2]
    adc #$40 ; '@'                                                    ; 41b9: 69 40       i@  :04ba[2]
    sta l0074                                                         ; 41bb: 85 74       .t  :04bc[2]
    sta l0076                                                         ; 41bd: 85 76       .v  :04be[2]
    lda l0075                                                         ; 41bf: a5 75       .u  :04c0[2]
    adc #1                                                            ; 41c1: 69 01       i.  :04c2[2]
    sta l0075                                                         ; 41c3: 85 75       .u  :04c4[2]
    sta l0077                                                         ; 41c5: 85 77       .w  :04c6[2]
    bcc c048d                                                         ; 41c7: 90 c3       ..  :04c8[2]
; $41c9 referenced 1 time by $04b6
c04ca
    rts                                                               ; 41c9: 60          `   :04ca[2]

; $41ca referenced 1 time by $0441
sub_c04cb
    ldx #$ff                                                          ; 41ca: a2 ff       ..  :04cb[2]
    stx l003e                                                         ; 41cc: 86 3e       .>  :04cd[2]
    inx                                                               ; 41ce: e8          .   :04cf[2]
    stx l003f                                                         ; 41cf: 86 3f       .?  :04d0[2]
    stx l0518                                                         ; 41d1: 8e 18 05    ... :04d2[2]
    lda #$a9                                                          ; 41d4: a9 a9       ..  :04d5[2]
    sta l0040                                                         ; 41d6: 85 40       .@  :04d7[2]
    lda #$0a                                                          ; 41d8: a9 0a       ..  :04d9[2]
    sta l0041                                                         ; 41da: 85 41       .A  :04db[2]
    inx                                                               ; 41dc: e8          .   :04dd[2]
    stx l0042                                                         ; 41dd: 86 42       .B  :04de[2]
    jsr c0505                                                         ; 41df: 20 05 05     .. :04e0[2]
    lda l0409                                                         ; 41e2: ad 09 04    ... :04e3[2]
    asl                                                               ; 41e5: 0a          .   :04e6[2]
    asl                                                               ; 41e6: 0a          .   :04e7[2]
    asl                                                               ; 41e7: 0a          .   :04e8[2]
    sec                                                               ; 41e8: 38          8   :04e9[2]
    sbc #1                                                            ; 41e9: e9 01       ..  :04ea[2]
    asl                                                               ; 41eb: 0a          .   :04ec[2]
    rol l0518                                                         ; 41ec: 2e 18 05    ... :04ed[2]
    asl                                                               ; 41ef: 0a          .   :04f0[2]
    sta l0517                                                         ; 41f0: 8d 17 05    ... :04f1[2]
    rol l0518                                                         ; 41f3: 2e 18 05    ... :04f4[2]
    ldy #0                                                            ; 41f6: a0 00       ..  :04f7[2]
; $41f8 referenced 1 time by $0502
loop_c04f9
    lda l0515,y                                                       ; 41f8: b9 15 05    ... :04f9[2]
    jsr oswrch                                                        ; 41fb: 20 ee ff     .. :04fc[2]   ; Write character
    iny                                                               ; 41fe: c8          .   :04ff[2]
    cpy #$12                                                          ; 41ff: c0 12       ..  :0500[2]
    bcc loop_c04f9                                                    ; 4201: 90 f5       ..  :0502[2]
    rts                                                               ; 4203: 60          `   :0504[2]

; $4204 referenced 2 times by $0470, $04e0
c0505
    ldx #0                                                            ; 4204: a2 00       ..  :0505[2]
    ldy #0                                                            ; 4206: a0 00       ..  :0507[2]
    lda l0409                                                         ; 4208: ad 09 04    ... :0509[2]
    sta l003c                                                         ; 420b: 85 3c       .<  :050c[2]
    lda #5                                                            ; 420d: a9 05       ..  :050e[2]
    sta l003d                                                         ; 420f: 85 3d       .=  :0510[2]
    jmp c1abb                                                         ; 4211: 4c bb 1a    L.. :0512[2]

; $4214 referenced 1 time by $04f9
l0515
    !byte $19,   4                                                    ; 4214: 19 04       ..  :0515[2]
; $4216 referenced 1 time by $04f1
l0517
    !byte 0                                                           ; 4216: 00          .   :0517[2]
; $4217 referenced 3 times by $04d2, $04ed, $04f4
l0518
    !byte   0, $fc,   2, $19,   1,   0,   0, $64, $ff, $19,   5,   0  ; 4217: 00 fc 02... ... :0518[2]
    !byte   0, $60,   2                                               ; 4223: 00 60 02    .`. :0524[2]
}

pydis_end

; Label references by decreasing frequency:
;     l0070:                                        102
;     l0071:                                         72
;     l09df:                                         57
;     l007a:                                         56
;     l0072:                                         53
;     l0073:                                         52
;     l0080:                                         44
;     oswrch:                                        44
;     l0076:                                         37
;     l0074:                                         32
;     l007b:                                         31
;     l09be:                                         30
;     osbyte:                                        27
;     l0079:                                         24
;     l007d:                                         24
;     l09a8:                                         24
;     l0077:                                         23
;     l0950:                                         23
;     l097c:                                         23
;     l004c:                                         22
;     l0075:                                         22
;     l0078:                                         22
;     l0966:                                         21
;     sub_c2a8d:                                     20
;     l0029:                                         18
;     l007c:                                         18
;     l202b:                                         18
;     l0004:                                         17
;     l0016:                                         17
;     l004a:                                         17
;     l0015:                                         16
;     l0031:                                         16
;     l0992:                                         16
;     l007e:                                         15
;     l3a09:                                         15
;     l0052:                                         14
;     l0085:                                         14
;     l09d4:                                         14
;     l2a8c:                                         14
;     l001d:                                         13
;     l0053:                                         13
;     l2564:                                         13
;     l0030:                                         12
;     l09ef:                                         12
;     sub_c394d:                                     12
;     l0060:                                         11
;     l0062:                                         11
;     pydis_start:                                   11
;     sub_c14be:                                     11
;     something3_high_copy_start:                    11
;     crtc_address_register:                         11
;     crtc_address_write:                            11
;     l0049:                                         10
;     l0061:                                         10
;     sub_c2682:                                     10
;     sub_c4109:                                     10
;     l0019:                                          9
;     l0048:                                          9
;     l09b3:                                          9
;     c207d:                                          9
;     sub_c2603:                                      9
;     l2681:                                          9
;     l29c5:                                          9
;     l3bf8:                                          9
;     l3bfa:                                          9
;     l4108:                                          9
;     l0018:                                          8
;     l001a:                                          8
;     l001b:                                          8
;     l0081:                                          8
;     l29c0:                                          8
;     sub_c2a9e:                                      8
;     l2a9f:                                          8
;     l38ab:                                          8
;     l3981:                                          8
;     sub_c3bfd:                                      8
;     c4152:                                          8
;     l0005:                                          7
;     l0063:                                          7
;     l007f:                                          7
;     l180d:                                          7
;     l1b40:                                          7
;     sub_c2601:                                      7
;     l2602:                                          7
;     l2710:                                          7
;     sub_c3462:                                      7
;     l002e:                                          6
;     l003e:                                          6
;     l004b:                                          6
;     l004d:                                          6
;     l0054:                                          6
;     l0055:                                          6
;     l0088:                                          6
;     l0100:                                          6
;     l0116:                                          6
;     l09ec:                                          6
;     l09ed:                                          6
;     l1648:                                          6
;     l173d:                                          6
;     sub_c2286:                                      6
;     c29c1:                                          6
;     l29c3:                                          6
;     sub_c29c4:                                      6
;     sub_c2a76:                                      6
;     l2c95:                                          6
;     sub_c35c8:                                      6
;     sub_c39a3:                                      6
;     l39f3:                                          6
;     l3bbe:                                          6
;     osword:                                         6
;     l003a:                                          5
;     l003b:                                          5
;     l0042:                                          5
;     l0044:                                          5
;     l0064:                                          5
;     l0082:                                          5
;     l0987:                                          5
;     l099d:                                          5
;     l09ee:                                          5
;     l145d:                                          5
;     l1cf4:                                          5
;     l241e:                                          5
;     l24d9:                                          5
;     sub_c2982:                                      5
;     l2e05:                                          5
;     l2f75:                                          5
;     l2f90:                                          5
;     l31d6:                                          5
;     c3534:                                          5
;     l37d9:                                          5
;     sub_c39ad:                                      5
;     l39dd:                                          5
;     sub_c3a27:                                      5
;     l3a97:                                          5
;     l3aa0:                                          5
;     l0020:                                          4
;     l0025:                                          4
;     l0028:                                          4
;     l002a:                                          4
;     l002c:                                          4
;     l002d:                                          4
;     l003c:                                          4
;     l003d:                                          4
;     l0040:                                          4
;     l0041:                                          4
;     l0045:                                          4
;     l0046:                                          4
;     l0058:                                          4
;     l005c:                                          4
;     l0083:                                          4
;     l0086:                                          4
;     l0087:                                          4
;     l0121:                                          4
;     l0129:                                          4
;     l09ea:                                          4
;     l0a90:                                          4
;     l1235:                                          4
;     l14b0:                                          4
;     l16c4:                                          4
;     sub_c17ff:                                      4
;     sub_c1891:                                      4
;     sub_c18bd:                                      4
;     l1956:                                          4
;     l1997:                                          4
;     l1bdf:                                          4
;     sub_c1beb:                                      4
;     l1c97:                                          4
;     sub_c2037:                                      4
;     sub_c208e:                                      4
;     l21be:                                          4
;     l2330:                                          4
;     sub_c2726:                                      4
;     l2cb7:                                          4
;     l2d77:                                          4
;     l2db9:                                          4
;     l313f:                                          4
;     l31bb:                                          4
;     l33a4:                                          4
;     sub_c33a7:                                      4
;     l3426:                                          4
;     l3447:                                          4
;     l35c7:                                          4
;     l3665:                                          4
;     sub_c3748:                                      4
;     sub_c380c:                                      4
;     sub_c3994:                                      4
;     c3b39:                                          4
;     c3bc0:                                          4
;     something5_high_copy_end:                       4
;     some_data_high_copy_TODO:                       4
;     l0002:                                          3
;     l0006:                                          3
;     l0008:                                          3
;     l000a:                                          3
;     l0027:                                          3
;     currently_loaded_level:                         3
;     l003f:                                          3
;     l0059:                                          3
;     l005f:                                          3
;     l0084:                                          3
;     l010b:                                          3
;     l0122:                                          3
;     l012d:                                          3
;     l012e:                                          3
;     brkv:                                           3
;     brkv+1:                                         3
;     irq1v:                                          3
;     irq1v+1:                                        3
;     l095b:                                          3
;     l0971:                                          3
;     l09a9:                                          3
;     l09c9:                                          3
;     l09d5:                                          3
;     l0ab3:                                          3
;     l0ab4:                                          3
;     l0ab5:                                          3
;     l123b:                                          3
;     l1271:                                          3
;     sub_c14a7:                                      3
;     sub_c15b7:                                      3
;     sub_c15b8:                                      3
;     sub_c15e8:                                      3
;     l165a:                                          3
;     sub_c174f:                                      3
;     l17c7:                                          3
;     sub_c188e:                                      3
;     l188f:                                          3
;     l1890:                                          3
;     l18bc:                                          3
;     sub_c1955:                                      3
;     sub_c19d7:                                      3
;     sub_c1a37:                                      3
;     sub_c1be0:                                      3
;     l1be1:                                          3
;     sub_c1be2:                                      3
;     sub_c1c45:                                      3
;     l213e:                                          3
;     c21ef:                                          3
;     c2331:                                          3
;     l2379:                                          3
;     l2398:                                          3
;     sub_c241f:                                      3
;     sub_c24f5:                                      3
;     sub_c255c:                                      3
;     sub_c2565:                                      3
;     sub_c26f1:                                      3
;     sub_c2707:                                      3
;     l278b:                                          3
;     l2816:                                          3
;     l29c2:                                          3
;     l2a13:                                          3
;     sub_c2ad2:                                      3
;     l2b0e:                                          3
;     l2b91:                                          3
;     l2f15:                                          3
;     l2f40:                                          3
;     l2fe6:                                          3
;     c2fe7:                                          3
;     l2fe9:                                          3
;     sub_c3015:                                      3
;     l3154:                                          3
;     l3175:                                          3
;     l3308:                                          3
;     sub_c3353:                                      3
;     l339a:                                          3
;     sub_c33dd:                                      3
;     sub_c37d8:                                      3
;     c3867:                                          3
;     l38ae:                                          3
;     l398e:                                          3
;     c3a8f:                                          3
;     l3aa4:                                          3
;     something5_high_copy_start:                     3
;     sub_c40a5:                                      3
;     sub_c40c0:                                      3
;     l4217:                                          3
;     oscli:                                          3
;     l0003:                                          2
;     l0007:                                          2
;     l0009:                                          2
;     l0014:                                          2
;     l0026:                                          2
;     l002b:                                          2
;     l0039:                                          2
;     l0043:                                          2
;     l0051:                                          2
;     l005a:                                          2
;     l005b:                                          2
;     l0065:                                          2
;     l00fc:                                          2
;     l012a:                                          2
;     l012b:                                          2
;     l012c:                                          2
;     l0287:                                          2
;     l09eb:                                          2
;     l0a80:                                          2
;     l0ab1:                                          2
;     l0ab2:                                          2
;     l0ab6:                                          2
;     l0b00:                                          2
;     sub_c1236:                                      2
;     sub_c123c:                                      2
;     l123d:                                          2
;     sub_c13cc:                                      2
;     sub_c145c:                                      2
;     l14a8:                                          2
;     sub_c159f:                                      2
;     l15a8:                                          2
;     l15b9:                                          2
;     sub_c15ba:                                      2
;     sub_c15cd:                                      2
;     l167b:                                          2
;     sub_c16b2:                                      2
;     l17fe:                                          2
;     sub_c187d:                                      2
;     sub_c18c2:                                      2
;     l1954:                                          2
;     c19d4:                                          2
;     l1a97:                                          2
;     sub_c1aa0:                                      2
;     l1b23:                                          2
;     something15_TODO:                               2
;     l1bcf:                                          2
;     l1bec:                                          2
;     l1c14:                                          2
;     sub_c1c59:                                      2
;     l1db3:                                          2
;     l1dc9:                                          2
;     c1e0b:                                          2
;     sub_c1e1f:                                      2
;     sub_c1e24:                                      2
;     sub_c1e47:                                      2
;     l1f3c:                                          2
;     sub_c1f48:                                      2
;     l1fd8:                                          2
;     sub_c1fdc:                                      2
;     l1fec:                                          2
;     l205e:                                          2
;     l209d:                                          2
;     l20b5:                                          2
;     l211a:                                          2
;     l2228:                                          2
;     l224f:                                          2
;     sub_c22c1:                                      2
;     sub_c2301:                                      2
;     l23fe:                                          2
;     sub_c2462:                                      2
;     l2468:                                          2
;     sub_c2489:                                      2
;     l254b:                                          2
;     sub_c2815:                                      2
;     l28a0:                                          2
;     l298a:                                          2
;     sub_c299e:                                      2
;     l29af:                                          2
;     c2a12:                                          2
;     c2aa0:                                          2
;     l2ab1:                                          2
;     l2ad9:                                          2
;     sub_c2b08:                                      2
;     sub_c2b0f:                                      2
;     sub_c2b1c:                                      2
;     l2b48:                                          2
;     l2bb2:                                          2
;     sub_c2bf5:                                      2
;     sub_c2c0b:                                      2
;     l2ceb:                                          2
;     l2cee:                                          2
;     l2d0e:                                          2
;     l2d28:                                          2
;     l2daf:                                          2
;     sub_c2eb8:                                      2
;     l2ef1:                                          2
;     l2ef4:                                          2
;     l2f73:                                          2
;     l2fe2:                                          2
;     l2fe8:                                          2
;     l3019:                                          2
;     l301e:                                          2
;     c3023:                                          2
;     l3199:                                          2
;     sub_c3206:                                      2
;     l3378:                                          2
;     sub_c3390:                                      2
;     sub_c33d6:                                      2
;     l3432:                                          2
;     l3497:                                          2
;     l349f:                                          2
;     l3608:                                          2
;     sub_c36cc:                                      2
;     l380b:                                          2
;     sub_c3827:                                      2
;     l382d:                                          2
;     l3865:                                          2
;     l38ad:                                          2
;     l38f4:                                          2
;     sub_c3924:                                      2
;     l397f:                                          2
;     l3980:                                          2
;     sub_c39be:                                      2
;     l3a7c:                                          2
;     l3a85:                                          2
;     l3a98:                                          2
;     l3a9c:                                          2
;     sub_c3aa5:                                      2
;     c3b1d:                                          2
;     sub_c3b43:                                      2
;     c3b72:                                          2
;     c3ba6:                                          2
;     l3bd1:                                          2
;     l3bd2:                                          2
;     sub_c3bd3:                                      2
;     l3bfb:                                          2
;     l3bfc:                                          2
;     l3c10:                                          2
;     c3c11:                                          2
;     c3c2c:                                          2
;     c3c5c:                                          2
;     c3c6a:                                          2
;     c3dae:                                          2
;     read_icodata_using_osword_7f:                   2
;     seek_track_a:                                   2
;     set_track_special_register_to_a:                2
;     c3f0d:                                          2
;     initial_screen_disabled_flag:                   2
;     sub_c4094:                                      2
;     c40cf:                                          2
;     c418f:                                          2
;     c4204:                                          2
;     lbe00:                                          2
;     lbf00:                                          2
;     romsel:                                         2
;     system_via_t2c_h:                               2
;     system_via_ifr:                                 2
;     l0000:                                          1
;     l0050:                                          1
;     l005d:                                          1
;     l005e:                                          1
;     l0066:                                          1
;     l0067:                                          1
;     l0068:                                          1
;     romsel_copy:                                    1
;     l0123:                                          1
;     l0124:                                          1
;     l0125:                                          1
;     l0126:                                          1
;     l0127:                                          1
;     l0128:                                          1
;     l0951:                                          1
;     l0967:                                          1
;     l097d:                                          1
;     l0993:                                          1
;     l09b4:                                          1
;     l09bf:                                          1
;     l0a6f:                                          1
;     l0a7e:                                          1
;     l0a7f:                                          1
;     l0aa1:                                          1
;     l0aa9:                                          1
;     l1237:                                          1
;     sub_c1238:                                      1
;     l1239:                                          1
;     sub_c123a:                                      1
;     l1280:                                          1
;     sub_c12a2:                                      1
;     l12a6:                                          1
;     l12b7:                                          1
;     l130e:                                          1
;     l1329:                                          1
;     sub_c133a:                                      1
;     sub_c1344:                                      1
;     sub_c1365:                                      1
;     l13a7:                                          1
;     l13a9:                                          1
;     l148e:                                          1
;     l14dd:                                          1
;     l14e6:                                          1
;     l14f0:                                          1
;     sub_c14f7:                                      1
;     sub_c1509:                                      1
;     l1558:                                          1
;     l1577:                                          1
;     l1597:                                          1
;     l15a2:                                          1
;     sub_c15af:                                      1
;     sub_c15c9:                                      1
;     l15d6:                                          1
;     sub_c15de:                                      1
;     l15f9:                                          1
;     sub_c162f:                                      1
;     l1671:                                          1
;     sub_c1682:                                      1
;     l168f:                                          1
;     sub_c1699:                                      1
;     c16a5:                                          1
;     sub_c16ba:                                      1
;     osfile_wrapper:                                 1
;     l16f4:                                          1
;     sub_c1724:                                      1
;     l1754:                                          1
;     l1759:                                          1
;     l1760:                                          1
;     sub_c176e:                                      1
;     sub_c1771:                                      1
;     l178f:                                          1
;     sub_c17a1:                                      1
;     sub_c17bb:                                      1
;     l17d6:                                          1
;     l17db:                                          1
;     l17e6:                                          1
;     l17f0:                                          1
;     sub_c1828:                                      1
;     sub_c1859:                                      1
;     l1892:                                          1
;     l1896:                                          1
;     l1897:                                          1
;     sub_c18bb:                                      1
;     l18cb:                                          1
;     sub_c18ea:                                      1
;     l1922:                                          1
;     sub_c192a:                                      1
;     l192b:                                          1
;     sub_c194b:                                      1
;     sub_c1961:                                      1
;     l196a:                                          1
;     l1976:                                          1
;     l197e:                                          1
;     sub_c19c4:                                      1
;     sub_c19da:                                      1
;     sub_c1a02:                                      1
;     sub_c1a3a:                                      1
;     sub_c1a3c:                                      1
;     l1a50:                                          1
;     l1a52:                                          1
;     sub_c1a68:                                      1
;     l1a6e:                                          1
;     sub_c1a82:                                      1
;     l1a88:                                          1
;     c1a9e:                                          1
;     l1a9f:                                          1
;     l1aea:                                          1
;     sub_c1b05:                                      1
;     l1b13:                                          1
;     sub_c1b16:                                      1
;     sub_c1b38:                                      1
;     l1bc0:                                          1
;     l1be3:                                          1
;     sub_c1c0e:                                      1
;     sub_c1c29:                                      1
;     l1c3d:                                          1
;     sub_c1c72:                                      1
;     l1c8a:                                          1
;     sub_c1c95:                                      1
;     sub_c1caf:                                      1
;     loop_c1cbb:                                     1
;     l1cbe:                                          1
;     l1cc7:                                          1
;     sub_c1cc9:                                      1
;     sub_c1cfb:                                      1
;     l1d15:                                          1
;     l1d3a:                                          1
;     l1d46:                                          1
;     l1d5e:                                          1
;     l1d6c:                                          1
;     l1d7f:                                          1
;     l1d92:                                          1
;     l1d9f:                                          1
;     l1dce:                                          1
;     l1dd9:                                          1
;     l1dec:                                          1
;     l1df9:                                          1
;     l1f25:                                          1
;     sub_c1f28:                                      1
;     l1f5e:                                          1
;     sub_c1f64:                                      1
;     sub_c1f6e:                                      1
;     l1f74:                                          1
;     sub_c1f75:                                      1
;     sub_c1f7f:                                      1
;     sub_c1f9b:                                      1
;     sub_c1fb1:                                      1
;     l1fcc:                                          1
;     sub_c1fd6:                                      1
;     sub_c2052:                                      1
;     sub_c2054:                                      1
;     sub_c205d:                                      1
;     c209e:                                          1
;     sub_c20c7:                                      1
;     sub_c20d1:                                      1
;     l20e8:                                          1
;     sub_c20f2:                                      1
;     l2112:                                          1
;     l2126:                                          1
;     sub_c2149:                                      1
;     sub_c2151:                                      1
;     sub_c2158:                                      1
;     l216a:                                          1
;     l2178:                                          1
;     l217b:                                          1
;     sub_c2192:                                      1
;     sub_c21ae:                                      1
;     l21cf:                                          1
;     sub_c21d7:                                      1
;     l21e9:                                          1
;     sub_c220b:                                      1
;     l2218:                                          1
;     sub_c2288:                                      1
;     l22b5:                                          1
;     l22bc:                                          1
;     sub_c22c8:                                      1
;     sub_c22cb:                                      1
;     sub_c2320:                                      1
;     sub_c234d:                                      1
;     sub_c2354:                                      1
;     l2362:                                          1
;     sub_c236a:                                      1
;     l23b5:                                          1
;     l23bc:                                          1
;     sub_c23d0:                                      1
;     l23df:                                          1
;     sub_c23e5:                                      1
;     sub_c23ec:                                      1
;     sub_c23f5:                                      1
;     sub_c2411:                                      1
;     sub_c2414:                                      1
;     sub_c2417:                                      1
;     c241a:                                          1
;     sub_c241d:                                      1
;     sub_c242f:                                      1
;     l243a:                                          1
;     l2456:                                          1
;     sub_c2465:                                      1
;     l2488:                                          1
;     sub_c249c:                                      1
;     l24c3:                                          1
;     l24d6:                                          1
;     sub_c24da:                                      1
;     l2513:                                          1
;     sub_c2518:                                      1
;     l252b:                                          1
;     sub_c2535:                                      1
;     sub_c2537:                                      1
;     l257e:                                          1
;     sub_c2585:                                      1
;     l25ab:                                          1
;     l25be:                                          1
;     l25c6:                                          1
;     sub_c25e3:                                      1
;     l261c:                                          1
;     sub_c2646:                                      1
;     sub_c2663:                                      1
;     l2683:                                          1
;     sub_c268b:                                      1
;     sub_c269b:                                      1
;     l26d5:                                          1
;     loop_c26f3:                                     1
;     l2757:                                          1
;     sub_c2780:                                      1
;     sub_c278a:                                      1
;     sub_c2799:                                      1
;     l27a7:                                          1
;     l27b5:                                          1
;     l27c3:                                          1
;     sub_c27c4:                                      1
;     l27f3:                                          1
;     l2824:                                          1
;     sub_c2832:                                      1
;     l2840:                                          1
;     sub_c284e:                                      1
;     l284f:                                          1
;     c287e:                                          1
;     sub_c28a1:                                      1
;     l28cd:                                          1
;     l292f:                                          1
;     l294e:                                          1
;     sub_c2956:                                      1
;     l2972:                                          1
;     l29bd:                                          1
;     l2a2e:                                          1
;     l2a8e:                                          1
;     l2ab9:                                          1
;     l2ac3:                                          1
;     sub_c2adb:                                      1
;     l2af2:                                          1
;     l2afa:                                          1
;     sub_c2b05:                                      1
;     l2b1b:                                          1
;     sub_c2b43:                                      1
;     c2b64:                                          1
;     l2b69:                                          1
;     loop_c2ba4:                                     1
;     sub_c2bcb:                                      1
;     l2bd1:                                          1
;     l2be8:                                          1
;     sub_c2bee:                                      1
;     sub_c2bfe:                                      1
;     sub_c2c0c:                                      1
;     sub_c2c26:                                      1
;     l2c27:                                          1
;     l2c2a:                                          1
;     sub_c2c2d:                                      1
;     l2c30:                                          1
;     c2c5f:                                          1
;     l2c68:                                          1
;     sub_c2c96:                                      1
;     l2cb5:                                          1
;     sub_c2cc1:                                      1
;     c2cd5:                                          1
;     l2cf7:                                          1
;     l2d07:                                          1
;     l2d1a:                                          1
;     l2d3a:                                          1
;     l2d3d:                                          1
;     l2d66:                                          1
;     l2d6e:                                          1
;     sub_c2d89:                                      1
;     sub_c2d90:                                      1
;     l2d93:                                          1
;     l2d98:                                          1
;     l2da1:                                          1
;     l2dbd:                                          1
;     l2dfb:                                          1
;     sub_c2e06:                                      1
;     sub_c2e1e:                                      1
;     c2ed7:                                          1
;     l2efb:                                          1
;     l2f24:                                          1
;     l2f4c:                                          1
;     l2f7d:                                          1
;     l2fb3:                                          1
;     l2ffa:                                          1
;     l3008:                                          1
;     sub_c301a:                                      1
;     l30f9:                                          1
;     l3118:                                          1
;     l3142:                                          1
;     l315b:                                          1
;     l3184:                                          1
;     l31a5:                                          1
;     l31b9:                                          1
;     l31c3:                                          1
;     l31fb:                                          1
;     sub_c3309:                                      1
;     sub_c3325:                                      1
;     sub_c3328:                                      1
;     l3330:                                          1
;     l337d:                                          1
;     sub_c33be:                                      1
;     sub_c33e2:                                      1
;     l33f9:                                          1
;     l340f:                                          1
;     l3442:                                          1
;     l344f:                                          1
;     l348c:                                          1
;     l34ca:                                          1
;     l34e6:                                          1
;     l34fc:                                          1
;     l351b:                                          1
;     l3529:                                          1
;     l352b:                                          1
;     l3535:                                          1
;     l353e:                                          1
;     l3559:                                          1
;     sub_c357c:                                      1
;     c3598:                                          1
;     c359b:                                          1
;     sub_c35b0:                                      1
;     sub_c35d8:                                      1
;     l35e3:                                          1
;     l360c:                                          1
;     l3632:                                          1
;     l3647:                                          1
;     sub_c3688:                                      1
;     sub_c36a4:                                      1
;     l36c9:                                          1
;     sub_c36cf:                                      1
;     l36ed:                                          1
;     sub_c3706:                                      1
;     l3713:                                          1
;     sub_c371e:                                      1
;     l375f:                                          1
;     l3767:                                          1
;     l3770:                                          1
;     sub_c3783:                                      1
;     sub_c3795:                                      1
;     sub_c37c9:                                      1
;     c37f2:                                          1
;     l37f8:                                          1
;     l3803:                                          1
;     l3824:                                          1
;     sub_c382a:                                      1
;     l3851:                                          1
;     l3875:                                          1
;     l3881:                                          1
;     l389c:                                          1
;     l38af:                                          1
;     l38bf:                                          1
;     l38eb:                                          1
;     l390b:                                          1
;     l3923:                                          1
;     l392a:                                          1
;     l3935:                                          1
;     l3945:                                          1
;     c394b:                                          1
;     l3969:                                          1
;     l396b:                                          1
;     l3979:                                          1
;     l397e:                                          1
;     l3998:                                          1
;     sub_c39bb:                                      1
;     sub_c39c3:                                      1
;     sub_c39de:                                      1
;     c39f4:                                          1
;     l3a63:                                          1
;     sub_c3a6d:                                      1
;     l3aa1:                                          1
;     sub_c3ab7:                                      1
;     l3ac8:                                          1
;     sub_c3ae7:                                      1
;     l3af2:                                          1
;     c3b03:                                          1
;     l3b09:                                          1
;     c3b11:                                          1
;     c3b25:                                          1
;     sub_c3b78:                                      1
;     c3b85:                                          1
;     c3ba4:                                          1
;     c3bb4:                                          1
;     c3bb9:                                          1
;     l3bbf:                                          1
;     l3bf9:                                          1
;     c3c06:                                          1
;     l3c07:                                          1
;     c3c08:                                          1
;     l3c09:                                          1
;     c3c0c:                                          1
;     l3c0d:                                          1
;     c3c0e:                                          1
;     l3c0f:                                          1
;     c3c56:                                          1
;     loop_c3c6c:                                     1
;     loop_c3c79:                                     1
;     loop_c3c84:                                     1
;     c3c9b:                                          1
;     loop_c3cfc:                                     1
;     loop_c3d54:                                     1
;     initial_screen_disabled_flag_ok:                1
;     c3db9:                                          1
;     loop_c3e52:                                     1
;     c3ec1:                                          1
;     osword_7f_block_seek_track:                     1
;     osword_7f_block_write_special_register_track:   1
;     osword_7f_read_result:                          1
;     l3f05:                                          1
;     loop_c3f18:                                     1
;     c3f2d:                                          1
;     character_fe_bitmap:                            1
;     sub_c3f6f:                                      1
;     loop_c3f7b:                                     1
;     loop_c3f87:                                     1
;     c3fba:                                          1
;     l3fbb:                                          1
;     something4_TODO:                                1
;     c408b:                                          1
;     c4097:                                          1
;     c40af:                                          1
;     c40b7:                                          1
;     c40d5:                                          1
;     c40f6:                                          1
;     c4139:                                          1
;     c4143:                                          1
;     c4172:                                          1
;     sub_c4173:                                      1
;     c418c:                                          1
;     c4191:                                          1
;     c41a3:                                          1
;     c41b3:                                          1
;     c41c9:                                          1
;     sub_c41ca:                                      1
;     c41f8:                                          1
;     l4214:                                          1
;     l4216:                                          1
;     l53c0:                                          1
;     l8000:                                          1
;     video_ula_palette:                              1
;     system_via_t1c_l:                               1
;     system_via_t1c_h:                               1
;     system_via_t1l_l:                               1
;     system_via_t1l_h:                               1
;     system_via_t2c_l:                               1
;     system_via_acr:                                 1
;     system_via_ier:                                 1
;     user_via_t1c_l:                                 1
;     user_via_t1c_h:                                 1
;     user_via_t2c_l:                                 1
;     user_via_t2c_h:                                 1
;     user_via_ier:                                   1
;     osfile:                                         1

; Automatically generated labels:
;     c0136
;     c0157
;     c043a
;     c0444
;     c0473
;     c048d
;     c0490
;     c04a4
;     c04b4
;     c04ca
;     c0505
;     c0ae6
;     c0afe
;     c110c
;     c1140
;     c1171
;     c1186
;     c11f8
;     c1209
;     c129b
;     c135d
;     c1376
;     c137f
;     c13b5
;     c13bf
;     c13c6
;     c13d8
;     c1427
;     c1446
;     c1466
;     c146e
;     c1477
;     c147e
;     c1486
;     c1488
;     c1498
;     c149c
;     c14a5
;     c14ad
;     c14b7
;     c14c8
;     c14fe
;     c1517
;     c1529
;     c154a
;     c1551
;     c155e
;     c1568
;     c1574
;     c1581
;     c1589
;     c1593
;     c15ab
;     c15c3
;     c15f3
;     c160c
;     c161e
;     c1628
;     c163d
;     c1640
;     c165e
;     c1670
;     c168a
;     c1696
;     c16a5
;     c16aa
;     c16b5
;     c16bf
;     c16cd
;     c16ce
;     c16f7
;     c174c
;     c178a
;     c1791
;     c17f1
;     c17f9
;     c181a
;     c1823
;     c18a3
;     c18d1
;     c1906
;     c1909
;     c191f
;     c1937
;     c1951
;     c1966
;     c19b9
;     c19d4
;     c19e2
;     c19e5
;     c19f2
;     c1a07
;     c1a59
;     c1a8f
;     c1a9e
;     c1abb
;     c1add
;     c1ae3
;     c1af8
;     c1b0c
;     c1b14
;     c1b28
;     c1b41
;     c1b59
;     c1b64
;     c1b7e
;     c1b8d
;     c1b96
;     c1b98
;     c1bc3
;     c1bca
;     c1c15
;     c1c3b
;     c1c4e
;     c1c6e
;     c1c82
;     c1c98
;     c1c9d
;     c1ca8
;     c1cc8
;     c1cda
;     c1cee
;     c1d16
;     c1e0b
;     c1e2d
;     c1e33
;     c1e3d
;     c1e43
;     c1e4e
;     c1e6a
;     c1e9b
;     c1ea5
;     c1f06
;     c1f23
;     c1f2d
;     c1f5d
;     c1f96
;     c1fa0
;     c1fb7
;     c1fc1
;     c1fe9
;     c200d
;     c2020
;     c2027
;     c2039
;     c2047
;     c2061
;     c207d
;     c208d
;     c209e
;     c20b8
;     c20be
;     c2155
;     c2184
;     c218b
;     c2190
;     c2197
;     c21d0
;     c21ef
;     c21ff
;     c221c
;     c2223
;     c2231
;     c2239
;     c2267
;     c2284
;     c228b
;     c229f
;     c22bb
;     c22c4
;     c22e0
;     c22e3
;     c22e6
;     c22e9
;     c22ec
;     c22fe
;     c2309
;     c2325
;     c2331
;     c2334
;     c2357
;     c2392
;     c23a5
;     c23a8
;     c23e2
;     c23e7
;     c23fa
;     c2404
;     c241a
;     c242b
;     c244d
;     c2454
;     c247a
;     c248d
;     c2495
;     c24b2
;     c24eb
;     c2515
;     c2532
;     c2552
;     c255a
;     c25a4
;     c25c0
;     c25d6
;     c2626
;     c264f
;     c2659
;     c2676
;     c2692
;     c26c2
;     c26e4
;     c2701
;     c271d
;     c274d
;     c276f
;     c279c
;     c27fe
;     c281d
;     c2825
;     c2841
;     c2851
;     c287e
;     c288c
;     c2945
;     c29aa
;     c29c1
;     c29d4
;     c29d7
;     c29ea
;     c2a12
;     c2a33
;     c2a60
;     c2a73
;     c2a81
;     c2aa0
;     c2ab7
;     c2abd
;     c2ac4
;     c2acd
;     c2ada
;     c2af5
;     c2af6
;     c2af9
;     c2afc
;     c2aff
;     c2b2e
;     c2b64
;     c2b84
;     c2b86
;     c2bba
;     c2bd6
;     c2bdd
;     c2bf7
;     c2c09
;     c2c35
;     c2c3d
;     c2c5f
;     c2c62
;     c2c7e
;     c2c88
;     c2cca
;     c2cd4
;     c2cd5
;     c2d87
;     c2da6
;     c2dc0
;     c2dc3
;     c2dca
;     c2de4
;     c2df3
;     c2e0f
;     c2e1b
;     c2e42
;     c2e44
;     c2e4c
;     c2e5f
;     c2e82
;     c2eb1
;     c2ed7
;     c2ee4
;     c2fc8
;     c2fe7
;     c300e
;     c3011
;     c3023
;     c302a
;     c3044
;     c3053
;     c3068
;     c3074
;     c3088
;     c308a
;     c3092
;     c30a5
;     c30ca
;     c30d5
;     c31d8
;     c31f4
;     c31f7
;     c31ff
;     c3222
;     c3247
;     c324c
;     c325f
;     c3269
;     c3273
;     c3276
;     c328d
;     c32a5
;     c32ac
;     c32b1
;     c32c8
;     c32de
;     c32f5
;     c3301
;     c3311
;     c3316
;     c331e
;     c3331
;     c335b
;     c3366
;     c3399
;     c33b5
;     c33cb
;     c33ea
;     c33f8
;     c33fa
;     c3404
;     c340d
;     c3428
;     c3467
;     c346a
;     c347f
;     c3496
;     c34a7
;     c3501
;     c3516
;     c3534
;     c3557
;     c3573
;     c3598
;     c359b
;     c359e
;     c35bc
;     c35d5
;     c35e2
;     c35ed
;     c3636
;     c363f
;     c3652
;     c3698
;     c36a7
;     c36a8
;     c36c1
;     c36d2
;     c36db
;     c36f3
;     c36f6
;     c3720
;     c3734
;     c3736
;     c3744
;     c3750
;     c376b
;     c377a
;     c377c
;     c377e
;     c378e
;     c37ba
;     c37c3
;     c37da
;     c37f2
;     c3804
;     c381a
;     c381c
;     c3838
;     c3848
;     c3867
;     c3872
;     c388a
;     c3932
;     c393c
;     c394b
;     c3954
;     c3986
;     c3997
;     c39b6
;     c39c1
;     c39e0
;     c39ec
;     c39f4
;     c3a08
;     c3a41
;     c3a54
;     c3a73
;     c3a75
;     c3a83
;     c3a88
;     c3a8f
;     c3ad7
;     c3adb
;     c3add
;     c3ae0
;     c3afb
;     c3b03
;     c3b11
;     c3b1d
;     c3b25
;     c3b39
;     c3b72
;     c3b85
;     c3ba4
;     c3ba6
;     c3bb4
;     c3bb9
;     c3bc0
;     c3c06
;     c3c08
;     c3c0c
;     c3c0e
;     c3c11
;     c3c2c
;     c3c56
;     c3c5c
;     c3c6a
;     c3c9b
;     c3dae
;     c3db9
;     c3ec1
;     c3f0d
;     c3f2d
;     c3fba
;     c408b
;     c4097
;     c40af
;     c40b7
;     c40cf
;     c40d5
;     c40f6
;     c4139
;     c4143
;     c4152
;     c4172
;     c418c
;     c418f
;     c4191
;     c41a3
;     c41b3
;     c41c9
;     c41f8
;     c4204
;     l0000
;     l0002
;     l0003
;     l0004
;     l0005
;     l0006
;     l0007
;     l0008
;     l0009
;     l000a
;     l0014
;     l0015
;     l0016
;     l0018
;     l0019
;     l001a
;     l001b
;     l001d
;     l0020
;     l0025
;     l0026
;     l0027
;     l0028
;     l0029
;     l002a
;     l002b
;     l002c
;     l002d
;     l002e
;     l0030
;     l0031
;     l0039
;     l003a
;     l003b
;     l003c
;     l003d
;     l003e
;     l003f
;     l0040
;     l0041
;     l0042
;     l0043
;     l0044
;     l0045
;     l0046
;     l0048
;     l0049
;     l004a
;     l004b
;     l004c
;     l004d
;     l0050
;     l0051
;     l0052
;     l0053
;     l0054
;     l0055
;     l0058
;     l0059
;     l005a
;     l005b
;     l005c
;     l005d
;     l005e
;     l005f
;     l0060
;     l0061
;     l0062
;     l0063
;     l0064
;     l0065
;     l0066
;     l0067
;     l0068
;     l0070
;     l0071
;     l0072
;     l0073
;     l0074
;     l0075
;     l0076
;     l0077
;     l0078
;     l0079
;     l007a
;     l007b
;     l007c
;     l007d
;     l007e
;     l007f
;     l0080
;     l0081
;     l0082
;     l0083
;     l0084
;     l0085
;     l0086
;     l0087
;     l0088
;     l00fc
;     l0100
;     l010b
;     l0116
;     l0121
;     l0122
;     l0123
;     l0124
;     l0125
;     l0126
;     l0127
;     l0128
;     l0129
;     l012a
;     l012b
;     l012c
;     l012d
;     l012e
;     l0287
;     l0409
;     l0515
;     l0517
;     l0518
;     l0950
;     l0951
;     l095b
;     l0966
;     l0967
;     l0971
;     l097c
;     l097d
;     l0987
;     l0992
;     l0993
;     l099d
;     l09a8
;     l09a9
;     l09b3
;     l09b4
;     l09be
;     l09bf
;     l09c9
;     l09d4
;     l09d5
;     l09df
;     l09ea
;     l09eb
;     l09ec
;     l09ed
;     l09ee
;     l09ef
;     l0a6f
;     l0a7e
;     l0a7f
;     l0a80
;     l0a90
;     l0aa1
;     l0aa9
;     l0ab1
;     l0ab2
;     l0ab3
;     l0ab4
;     l0ab5
;     l0ab6
;     l0b00
;     l1104
;     l1105
;     l1106
;     l1107
;     l1108
;     l1109
;     l110a
;     l110b
;     l1235
;     l1237
;     l1239
;     l123b
;     l123d
;     l1271
;     l1280
;     l12a6
;     l12b7
;     l130e
;     l1329
;     l132b
;     l13a7
;     l13a9
;     l145d
;     l1487
;     l1489
;     l148e
;     l14a8
;     l14b0
;     l14dd
;     l14e6
;     l14f0
;     l1558
;     l1577
;     l1597
;     l15a2
;     l15a8
;     l15b9
;     l15d6
;     l15f9
;     l1648
;     l165a
;     l1671
;     l167b
;     l168f
;     l16c4
;     l16f4
;     l173d
;     l1754
;     l1759
;     l175d
;     l175e
;     l175f
;     l1760
;     l1761
;     l1765
;     l178b
;     l178f
;     l17c7
;     l17d6
;     l17db
;     l17e6
;     l17f0
;     l17fe
;     l180d
;     l1824
;     l188f
;     l1890
;     l1892
;     l1896
;     l1897
;     l18bc
;     l18cb
;     l1922
;     l192b
;     l1954
;     l1956
;     l196a
;     l196d
;     l196e
;     l1976
;     l197e
;     l1997
;     l1a0f
;     l1a50
;     l1a52
;     l1a6e
;     l1a88
;     l1a97
;     l1a9f
;     l1aae
;     l1aaf
;     l1ab0
;     l1ab1
;     l1ab2
;     l1aba
;     l1aea
;     l1b13
;     l1b23
;     l1b40
;     l1bc0
;     l1bcf
;     l1bdf
;     l1be1
;     l1be3
;     l1bec
;     l1c14
;     l1c3d
;     l1c8a
;     l1c97
;     l1cbe
;     l1cc7
;     l1cf4
;     l1d15
;     l1d3a
;     l1d46
;     l1d5e
;     l1d6c
;     l1d7f
;     l1d92
;     l1d9f
;     l1db3
;     l1dc9
;     l1dce
;     l1dd9
;     l1dec
;     l1df9
;     l1ea7
;     l1eab
;     l1f25
;     l1f3c
;     l1f5e
;     l1f6c
;     l1f74
;     l1fcc
;     l1fd8
;     l1fec
;     l202b
;     l205e
;     l209d
;     l20b5
;     l20e8
;     l2112
;     l211a
;     l2126
;     l213e
;     l216a
;     l2178
;     l217b
;     l21be
;     l21cf
;     l21e9
;     l2218
;     l2228
;     l224f
;     l22b5
;     l22bc
;     l22ed
;     l2330
;     l2362
;     l2379
;     l2398
;     l23b5
;     l23bc
;     l23df
;     l23fe
;     l241e
;     l2433
;     l243a
;     l2456
;     l2468
;     l2488
;     l24c3
;     l24d0
;     l24d1
;     l24d6
;     l24d9
;     l2513
;     l252b
;     l254b
;     l2550
;     l2551
;     l2564
;     l257e
;     l25ab
;     l25be
;     l25c6
;     l2602
;     l261c
;     l2681
;     l2683
;     l26d5
;     l2710
;     l2757
;     l278b
;     l27a7
;     l27b5
;     l27c3
;     l27f3
;     l2816
;     l2824
;     l2840
;     l284f
;     l288f
;     l2890
;     l2891
;     l2892
;     l2893
;     l28a0
;     l28cd
;     l28e1
;     l292f
;     l294e
;     l295b
;     l295c
;     l295d
;     l296d
;     l296e
;     l296f
;     l2972
;     l298a
;     l29af
;     l29bd
;     l29c0
;     l29c2
;     l29c3
;     l29c5
;     l29dd
;     l2a13
;     l2a2e
;     l2a8c
;     l2a8e
;     l2a9f
;     l2ab1
;     l2ab9
;     l2ac3
;     l2ad9
;     l2af2
;     l2afa
;     l2b0e
;     l2b1b
;     l2b48
;     l2b69
;     l2b91
;     l2bb2
;     l2bd1
;     l2be8
;     l2c27
;     l2c2a
;     l2c30
;     l2c68
;     l2c95
;     l2cb5
;     l2cb7
;     l2ceb
;     l2ced
;     l2cee
;     l2cf7
;     l2d07
;     l2d0e
;     l2d1a
;     l2d28
;     l2d3a
;     l2d3d
;     l2d66
;     l2d6e
;     l2d77
;     l2d93
;     l2d98
;     l2da1
;     l2daf
;     l2db9
;     l2dbd
;     l2dfb
;     l2e05
;     l2eb5
;     l2eb6
;     l2eb7
;     l2ee8
;     l2ee9
;     l2eed
;     l2ef1
;     l2ef2
;     l2ef4
;     l2efb
;     l2f15
;     l2f24
;     l2f40
;     l2f4c
;     l2f73
;     l2f75
;     l2f7d
;     l2f90
;     l2fb3
;     l2fe2
;     l2fe6
;     l2fe8
;     l2fe9
;     l2ffa
;     l3008
;     l3019
;     l301e
;     l30f9
;     l3118
;     l313f
;     l3142
;     l3154
;     l315b
;     l3175
;     l3184
;     l3199
;     l31a5
;     l31b9
;     l31bb
;     l31c3
;     l31d6
;     l31d7
;     l31fb
;     l3308
;     l3330
;     l3378
;     l337d
;     l339a
;     l33a4
;     l33f9
;     l3403
;     l340f
;     l3426
;     l3432
;     l3442
;     l3447
;     l344f
;     l348c
;     l3497
;     l349f
;     l34ca
;     l34d7
;     l34db
;     l34e6
;     l34fc
;     l351b
;     l3529
;     l352b
;     l3535
;     l353e
;     l3559
;     l35c7
;     l35e3
;     l3608
;     l360c
;     l3632
;     l3647
;     l3665
;     l36c9
;     l36da
;     l36ed
;     l3713
;     l375f
;     l3767
;     l3770
;     l377d
;     l37d9
;     l37f8
;     l3803
;     l380b
;     l3824
;     l382d
;     l384e
;     l384f
;     l3851
;     l3865
;     l3875
;     l3881
;     l389c
;     l38ab
;     l38ac
;     l38ad
;     l38ae
;     l38af
;     l38bf
;     l38c2
;     l38c3
;     l38d8
;     l38eb
;     l38f4
;     l390b
;     l3923
;     l392a
;     l3935
;     l3945
;     l3966
;     l3967
;     l3969
;     l396b
;     l396f
;     l3970
;     l3973
;     l3974
;     l3979
;     l397e
;     l397f
;     l3980
;     l3981
;     l398e
;     l3998
;     l39dd
;     l39f3
;     l3a09
;     l3a63
;     l3a7c
;     l3a85
;     l3a8d
;     l3a8e
;     l3a97
;     l3a98
;     l3a9c
;     l3aa0
;     l3aa1
;     l3aa4
;     l3ac7
;     l3ac8
;     l3ac9
;     l3aca
;     l3acb
;     l3ad8
;     l3adc
;     l3ade
;     l3adf
;     l3af2
;     l3b09
;     l3bbe
;     l3bbf
;     l3bd1
;     l3bd2
;     l3bf8
;     l3bf9
;     l3bfa
;     l3bfb
;     l3bfc
;     l3c07
;     l3c09
;     l3c0d
;     l3c0f
;     l3c10
;     l3f05
;     l3fbb
;     l4108
;     l4214
;     l4216
;     l4217
;     l53c0
;     l8000
;     lbe00
;     lbf00
;     loop_c0492
;     loop_c04f9
;     loop_c0aba
;     loop_c0ac6
;     loop_c0ade
;     loop_c114f
;     loop_c11dd
;     loop_c1213
;     loop_c13ac
;     loop_c1471
;     loop_c1540
;     loop_c1623
;     loop_c179a
;     loop_c1830
;     loop_c184d
;     loop_c1893
;     loop_c18a9
;     loop_c190b
;     loop_c1921
;     loop_c193d
;     loop_c1957
;     loop_c1be4
;     loop_c1c09
;     loop_c1c2d
;     loop_c1c61
;     loop_c1cbb
;     loop_c1df7
;     loop_c1e80
;     loop_c1f21
;     loop_c1f2c
;     loop_c1fe1
;     loop_c1ff5
;     loop_c2018
;     loop_c204a
;     loop_c20a6
;     loop_c20da
;     loop_c20e7
;     loop_c22b4
;     loop_c2406
;     loop_c256a
;     loop_c25c2
;     loop_c2668
;     loop_c2684
;     loop_c26f3
;     loop_c270f
;     loop_c28fd
;     loop_c2988
;     loop_c2992
;     loop_c29c9
;     loop_c2a9a
;     loop_c2b90
;     loop_c2ba4
;     loop_c2bc6
;     loop_c2be9
;     loop_c2c58
;     loop_c2c70
;     loop_c2ec9
;     loop_c34b2
;     loop_c36c7
;     loop_c36f9
;     loop_c37f9
;     loop_c3814
;     loop_c383a
;     loop_c3892
;     loop_c39d2
;     loop_c3c6c
;     loop_c3c79
;     loop_c3c84
;     loop_c3cfc
;     loop_c3d54
;     loop_c3e52
;     loop_c3f18
;     loop_c3f7b
;     loop_c3f87
;     sub_c040a
;     sub_c0474
;     sub_c04cb
;     sub_c1236
;     sub_c1238
;     sub_c123a
;     sub_c123c
;     sub_c1278
;     sub_c12a2
;     sub_c133a
;     sub_c1344
;     sub_c1365
;     sub_c138d
;     sub_c13cc
;     sub_c145c
;     sub_c14a7
;     sub_c14be
;     sub_c14f7
;     sub_c1509
;     sub_c159f
;     sub_c15af
;     sub_c15b7
;     sub_c15b8
;     sub_c15ba
;     sub_c15c9
;     sub_c15cd
;     sub_c15de
;     sub_c15e8
;     sub_c162f
;     sub_c1682
;     sub_c1699
;     sub_c16b2
;     sub_c16ba
;     sub_c1724
;     sub_c1728
;     sub_c174f
;     sub_c1766
;     sub_c176e
;     sub_c1771
;     sub_c178c
;     sub_c17a1
;     sub_c17b9
;     sub_c17bb
;     sub_c17fa
;     sub_c17ff
;     sub_c1825
;     sub_c1828
;     sub_c1845
;     sub_c1859
;     sub_c1866
;     sub_c187d
;     sub_c188e
;     sub_c1891
;     sub_c18bb
;     sub_c18bd
;     sub_c18c2
;     sub_c18ea
;     sub_c192a
;     sub_c194b
;     sub_c1955
;     sub_c1961
;     sub_c196c
;     sub_c19c4
;     sub_c19d7
;     sub_c19da
;     sub_c1a02
;     sub_c1a37
;     sub_c1a3a
;     sub_c1a3c
;     sub_c1a68
;     sub_c1a82
;     sub_c1aa0
;     sub_c1b05
;     sub_c1b16
;     sub_c1b38
;     sub_c1b66
;     sub_c1be0
;     sub_c1be2
;     sub_c1beb
;     sub_c1c0e
;     sub_c1c29
;     sub_c1c45
;     sub_c1c59
;     sub_c1c72
;     sub_c1c95
;     sub_c1caf
;     sub_c1cc9
;     sub_c1cf3
;     sub_c1cfb
;     sub_c1df4
;     sub_c1e17
;     sub_c1e1f
;     sub_c1e24
;     sub_c1e44
;     sub_c1e47
;     sub_c1ebb
;     sub_c1efa
;     sub_c1f28
;     sub_c1f48
;     sub_c1f4c
;     sub_c1f64
;     sub_c1f6d
;     sub_c1f6e
;     sub_c1f75
;     sub_c1f7f
;     sub_c1f84
;     sub_c1f9b
;     sub_c1fb1
;     sub_c1fd6
;     sub_c1fdc
;     sub_c2037
;     sub_c2052
;     sub_c2054
;     sub_c205d
;     sub_c208e
;     sub_c20c7
;     sub_c20d1
;     sub_c20f2
;     sub_c20f7
;     sub_c211e
;     sub_c2149
;     sub_c2151
;     sub_c2157
;     sub_c2158
;     sub_c2192
;     sub_c219a
;     sub_c21ae
;     sub_c21d7
;     sub_c220b
;     sub_c2286
;     sub_c2288
;     sub_c22ae
;     sub_c22c1
;     sub_c22c8
;     sub_c22cb
;     sub_c22ee
;     sub_c2301
;     sub_c2320
;     sub_c2337
;     sub_c234d
;     sub_c2354
;     sub_c2358
;     sub_c236a
;     sub_c236b
;     sub_c23a9
;     sub_c23c4
;     sub_c23d0
;     sub_c23e5
;     sub_c23ec
;     sub_c23f5
;     sub_c2411
;     sub_c2414
;     sub_c2417
;     sub_c241d
;     sub_c241f
;     sub_c242f
;     sub_c2434
;     sub_c2462
;     sub_c2465
;     sub_c2489
;     sub_c249c
;     sub_c24d2
;     sub_c24da
;     sub_c24f5
;     sub_c2518
;     sub_c2535
;     sub_c2537
;     sub_c255c
;     sub_c2565
;     sub_c2585
;     sub_c25df
;     sub_c25e3
;     sub_c25f5
;     sub_c2601
;     sub_c2603
;     sub_c2646
;     sub_c265a
;     sub_c2663
;     sub_c2682
;     sub_c268b
;     sub_c2693
;     sub_c269b
;     sub_c26e5
;     sub_c26f1
;     sub_c2707
;     sub_c271e
;     sub_c2726
;     sub_c2770
;     sub_c2780
;     sub_c278a
;     sub_c2799
;     sub_c27c4
;     sub_c2815
;     sub_c2832
;     sub_c284e
;     sub_c2859
;     sub_c286d
;     sub_c2894
;     sub_c28a1
;     sub_c28e2
;     sub_c2956
;     sub_c2980
;     sub_c2982
;     sub_c299e
;     sub_c29a1
;     sub_c29a8
;     sub_c29c4
;     sub_c29de
;     sub_c29eb
;     sub_c2a17
;     sub_c2a76
;     sub_c2a8d
;     sub_c2a9e
;     sub_c2ad2
;     sub_c2adb
;     sub_c2b05
;     sub_c2b08
;     sub_c2b0f
;     sub_c2b1c
;     sub_c2b37
;     sub_c2b43
;     sub_c2b65
;     sub_c2bbd
;     sub_c2bcb
;     sub_c2bee
;     sub_c2bf5
;     sub_c2bfe
;     sub_c2c0b
;     sub_c2c0c
;     sub_c2c26
;     sub_c2c2d
;     sub_c2c46
;     sub_c2c67
;     sub_c2c8c
;     sub_c2c96
;     sub_c2cc1
;     sub_c2d89
;     sub_c2d90
;     sub_c2e06
;     sub_c2e1e
;     sub_c2eb8
;     sub_c3015
;     sub_c301a
;     sub_c3206
;     sub_c3309
;     sub_c3325
;     sub_c3328
;     sub_c3353
;     sub_c336e
;     sub_c3390
;     sub_c33a7
;     sub_c33be
;     sub_c33d6
;     sub_c33dd
;     sub_c33e2
;     sub_c344b
;     sub_c3462
;     sub_c357c
;     sub_c35b0
;     sub_c35c8
;     sub_c35d8
;     sub_c3617
;     sub_c3664
;     sub_c3688
;     sub_c36a4
;     sub_c36cc
;     sub_c36cf
;     sub_c36fc
;     sub_c3706
;     sub_c371e
;     sub_c3748
;     sub_c3783
;     sub_c3795
;     sub_c37c9
;     sub_c37d8
;     sub_c37f3
;     sub_c380c
;     sub_c3827
;     sub_c382a
;     sub_c384d
;     sub_c3850
;     sub_c385d
;     sub_c3863
;     sub_c388d
;     sub_c38f6
;     sub_c3924
;     sub_c394d
;     sub_c3994
;     sub_c39a3
;     sub_c39ad
;     sub_c39bb
;     sub_c39be
;     sub_c39c3
;     sub_c39de
;     sub_c3a12
;     sub_c3a27
;     sub_c3a47
;     sub_c3a6d
;     sub_c3aa2
;     sub_c3aa5
;     sub_c3ab7
;     sub_c3acc
;     sub_c3ae7
;     sub_c3b43
;     sub_c3b78
;     sub_c3bd3
;     sub_c3bfd
;     sub_c3f6f
;     sub_c4094
;     sub_c40a5
;     sub_c40c0
;     sub_c4109
;     sub_c4173
;     sub_c41ca
!if (<(dir_dollar_command)) != $07 {
    !error "Assertion failed: <(dir_dollar_command) == $07"
}
!if (<(drive_0_command)) != $ff {
    !error "Assertion failed: <(drive_0_command) == $ff"
}
!if (<(l0060)) != $60 {
    !error "Assertion failed: <(l0060) == $60"
}
!if (<(l0070)) != $70 {
    !error "Assertion failed: <(l0070) == $70"
}
!if (<(osword_7f_block_read)) != $f4 {
    !error "Assertion failed: <(osword_7f_block_read) == $f4"
}
!if (<(osword_7f_block_seek)) != $e1 {
    !error "Assertion failed: <(osword_7f_block_seek) == $e1"
}
!if (<(osword_7f_block_write_special_register)) != $ea {
    !error "Assertion failed: <(osword_7f_block_write_special_register) == $ea"
}
!if (<data_filename) != $72 {
    !error "Assertion failed: <data_filename == $72"
}
!if (<icodata) != $ff {
    !error "Assertion failed: <icodata == $ff"
}
!if (<icodata_filename) != $5e {
    !error "Assertion failed: <icodata_filename == $5e"
}
!if (<level_data) != $d5 {
    !error "Assertion failed: <level_data == $d5"
}
!if (<some_data_high_copy_TODO) != $ff {
    !error "Assertion failed: <some_data_high_copy_TODO == $ff"
}
!if (<some_data_low_TODO) != $00 {
    !error "Assertion failed: <some_data_low_TODO == $00"
}
!if (<sprdata_filename) != $80 {
    !error "Assertion failed: <sprdata_filename == $80"
}
!if (>(dir_dollar_command)) != $3f {
    !error "Assertion failed: >(dir_dollar_command) == $3f"
}
!if (>(drive_0_command)) != $3e {
    !error "Assertion failed: >(drive_0_command) == $3e"
}
!if (>(l0060)) != $00 {
    !error "Assertion failed: >(l0060) == $00"
}
!if (>(l0070)) != $00 {
    !error "Assertion failed: >(l0070) == $00"
}
!if (>(osword_7f_block_read)) != $3e {
    !error "Assertion failed: >(osword_7f_block_read) == $3e"
}
!if (>(osword_7f_block_seek)) != $3e {
    !error "Assertion failed: >(osword_7f_block_seek) == $3e"
}
!if (>(osword_7f_block_write_special_register)) != $3e {
    !error "Assertion failed: >(osword_7f_block_write_special_register) == $3e"
}
!if (>data_filename) != $12 {
    !error "Assertion failed: >data_filename == $12"
}
!if (>icodata) != $40 {
    !error "Assertion failed: >icodata == $40"
}
!if (>icodata_filename) != $3f {
    !error "Assertion failed: >icodata_filename == $3f"
}
!if (>level_data) != $3a {
    !error "Assertion failed: >level_data == $3a"
}
!if (>some_data_high_copy_TODO) != $40 {
    !error "Assertion failed: >some_data_high_copy_TODO == $40"
}
!if (>some_data_low_TODO) != $04 {
    !error "Assertion failed: >some_data_low_TODO == $04"
}
!if (>sprdata_filename) != $19 {
    !error "Assertion failed: >sprdata_filename == $19"
}
!if (buffer_sound_channel_0) != $04 {
    !error "Assertion failed: buffer_sound_channel_0 == $04"
}
!if (crtc_cursor_start) != $0a {
    !error "Assertion failed: crtc_cursor_start == $0a"
}
!if (crtc_interlace_delay) != $08 {
    !error "Assertion failed: crtc_interlace_delay == $08"
}
!if (crtc_screen_start_high) != $0c {
    !error "Assertion failed: crtc_screen_start_high == $0c"
}
!if (crtc_screen_start_low) != $0d {
    !error "Assertion failed: crtc_screen_start_low == $0d"
}
!if (crtc_vert_displayed) != $06 {
    !error "Assertion failed: crtc_vert_displayed == $06"
}
!if (crtc_vert_sync_pos) != $07 {
    !error "Assertion failed: crtc_vert_sync_pos == $07"
}
!if (icodata) != $40ff {
    !error "Assertion failed: icodata == $40ff"
}
!if (osbyte_close_spool_exec) != $77 {
    !error "Assertion failed: osbyte_close_spool_exec == $77"
}
!if (osbyte_flush_buffer) != $15 {
    !error "Assertion failed: osbyte_flush_buffer == $15"
}
!if (osbyte_flush_buffer_class) != $0f {
    !error "Assertion failed: osbyte_flush_buffer_class == $0f"
}
!if (osbyte_inkey) != $81 {
    !error "Assertion failed: osbyte_inkey == $81"
}
!if (osbyte_opt) != $8b {
    !error "Assertion failed: osbyte_opt == $8b"
}
!if (osbyte_read_vdu_status) != $75 {
    !error "Assertion failed: osbyte_read_vdu_status == $75"
}
!if (osbyte_read_write_escape_break_effect) != $c8 {
    !error "Assertion failed: osbyte_read_write_escape_break_effect == $c8"
}
!if (osbyte_read_write_first_byte_break_intercept) != $f7 {
    !error "Assertion failed: osbyte_read_write_first_byte_break_intercept == $f7"
}
!if (osbyte_read_write_second_byte_break_intercept) != $f8 {
    !error "Assertion failed: osbyte_read_write_second_byte_break_intercept == $f8"
}
!if (osbyte_read_write_third_byte_break_intercept) != $f9 {
    !error "Assertion failed: osbyte_read_write_third_byte_break_intercept == $f9"
}
!if (osbyte_reset_soft_keys) != $12 {
    !error "Assertion failed: osbyte_reset_soft_keys == $12"
}
!if (osbyte_select_adc_channels) != $10 {
    !error "Assertion failed: osbyte_select_adc_channels == $10"
}
!if (osbyte_set_cursor_editing) != $04 {
    !error "Assertion failed: osbyte_set_cursor_editing == $04"
}
!if (osbyte_set_printer_ignore) != $06 {
    !error "Assertion failed: osbyte_set_printer_ignore == $06"
}
!if (osbyte_tv) != $90 {
    !error "Assertion failed: osbyte_tv == $90"
}
!if (osbyte_vsync) != $13 {
    !error "Assertion failed: osbyte_vsync == $13"
}
!if (osfile_load) != $ff {
    !error "Assertion failed: osfile_load == $ff"
}
!if (osfile_read_catalogue_info) != $05 {
    !error "Assertion failed: osfile_read_catalogue_info == $05"
}
!if (osword_envelope) != $08 {
    !error "Assertion failed: osword_envelope == $08"
}
!if (osword_read_char) != $0a {
    !error "Assertion failed: osword_read_char == $0a"
}
!if (osword_sound) != $07 {
    !error "Assertion failed: osword_sound == $07"
}
!if (screen_width_minus_one) != $27 {
    !error "Assertion failed: screen_width_minus_one == $27"
}
!if (something5_high_copy_end - something5_high_copy_start) != $48 {
    !error "Assertion failed: something5_high_copy_end - something5_high_copy_start == $48"
}
!if (something9_high_copy_end - something9_high_copy_start) != $2f {
    !error "Assertion failed: something9_high_copy_end - something9_high_copy_start == $2f"
}
!if (vdu_bell) != $07 {
    !error "Assertion failed: vdu_bell == $07"
}
!if (vdu_cr) != $0d {
    !error "Assertion failed: vdu_cr == $0d"
}
!if (vdu_define_character) != $17 {
    !error "Assertion failed: vdu_define_character == $17"
}
!if (vdu_define_text_window) != $1c {
    !error "Assertion failed: vdu_define_text_window == $1c"
}
!if (vdu_enable) != $06 {
    !error "Assertion failed: vdu_enable == $06"
}
!if (vdu_goto_xy) != $1f {
    !error "Assertion failed: vdu_goto_xy == $1f"
}
!if (vdu_set_graphics_colour) != $12 {
    !error "Assertion failed: vdu_set_graphics_colour == $12"
}
!if (vdu_set_mode) != $16 {
    !error "Assertion failed: vdu_set_mode == $16"
}
!if (vdu_set_text_colour) != $11 {
    !error "Assertion failed: vdu_set_text_colour == $11"
}
