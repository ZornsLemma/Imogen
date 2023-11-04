; Constants
crtc_cursor_start                               = 10
crtc_interlace_delay                            = 8
crtc_screen_start_high                          = 12
crtc_screen_start_low                           = 13
crtc_vert_displayed                             = 6
crtc_vert_sync_pos                              = 7
osbyte_close_spool_exec                         = 119
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
osfile_load                                     = 255
osfile_read_catalogue_info                      = 5
osword_envelope                                 = 8
screen_width_minus_one                          = 39
vdu_bell                                        = 7
vdu_define_character                            = 23
vdu_define_text_window                          = 28
vdu_enable                                      = 6
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
l0028                   = $28
l0029                   = $29
l002a                   = $2a
l002e                   = $2e
l0030                   = $30
l0031                   = $31
l0037                   = $37
l0039                   = $39
l003a                   = $3a
l003b                   = $3b
l003e                   = $3e
l0042                   = $42
l0043                   = $43
l0045                   = $45
l0048                   = $48
l004c                   = $4c
l004d                   = $4d
l0050                   = $50
l0051                   = $51
l0052                   = $52
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
l0131                   = $0131
brkv                    = $0202
irq1v                   = $0204
some_data_low_TODO      = $0400
l0409                   = $0409
l040a                   = $040a
l0950                   = $0950
l0966                   = $0966
l097c                   = $097c
l0992                   = $0992
l09a8                   = $09a8
l09a9                   = $09a9
l09b3                   = $09b3
l09b4                   = $09b4
l09be                   = $09be
l09d4                   = $09d4
l09d5                   = $09d5
l09df                   = $09df
l09ea                   = $09ea
l09ec                   = $09ec
l09ed                   = $09ed
l09ee                   = $09ee
l09ef                   = $09ef
l0a6f                   = $0a6f
l0a7e                   = $0a7e
l0a7f                   = $0a7f
l0aa1                   = $0aa1
l0aa9                   = $0aa9
l0ab1                   = $0ab1
l0ab2                   = $0ab2
l0ab3                   = $0ab3
l0ab4                   = $0ab4
l0ab5                   = $0ab5
l0ab6                   = $0ab6
l0ab7                   = $0ab7
l0ad4                   = $0ad4
l0aef                   = $0aef
l0b00                   = $0b00
l0c00                   = $0c00
l3b09                   = $3b09
c3c2c                   = $3c2c
l8000                   = $8000
lbe00                   = $be00
lbf00                   = $bf00
crtc_address_register   = $fe00
crtc_address_write      = $fe01
user_via_t1c_l          = $fe64
user_via_t1c_h          = $fe65
user_via_t2c_l          = $fe68
user_via_t2c_h          = $fe69
osfile                  = $ffdd
oswrch                  = $ffee
osword                  = $fff1
osbyte                  = $fff4
oscli                   = $fff7

    * = $1234

; $1234 referenced 5 times by $1291, $3c8f, $3e8a, $3f2a, $3f6f
pydis_start

!pseudopc $1103 {
; $1234 referenced 5 times by $1291, $3c8f, $3e8a, $3f2a, $3f6f
l1103
    !byte 0                                                           ; 1234: 00          .   :1103[1]
; $1235 referenced 2 times by $3e52, $3e58
l1104
    !byte $47, $11, $0b, $1d, $10, $27                                ; 1235: 47 11 0b... G.. :1104[1]
; $123b referenced 2 times by $11f0, $1728
l110a
    !byte 0                                                           ; 123b: 00          .   :110a[1]
; $123c referenced 1 time by $3e17
l110b
    !byte 0                                                           ; 123c: 00          .   :110b[1]

; $123d referenced 1 time by $3f5b
c110c
    jsr l0ab7                                                         ; 123d: 20 b7 0a     .. :110c[1]
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
    jsr l0aef                                                         ; 126e: 20 ef 0a     .. :113d[1]
; $1271 referenced 1 time by $1130
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
    cmp l0037                                                         ; 1282: c5 37       .7  :1151[1]
    beq c1175                                                         ; 1284: f0 20       .   :1153[1]
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
    sta l0037                                                         ; 12a4: 85 37       .7  :1173[1]
; $12a6 referenced 1 time by $1153
c1175
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
    jsr l0c00                                                         ; 1326: 20 00 0c     .. :11f5[1]
; $1329 referenced 1 time by $11f3
c11f8
    lda #0                                                            ; 1329: a9 00       ..  :11f8[1]
    sta l175e                                                         ; 132b: 8d 5e 17    .^. :11fa[1]
    sta l1760                                                         ; 132e: 8d 60 17    .`. :11fd[1]
    jsr sub_c2980                                                     ; 1331: 20 80 29     .) :1200[1]
    jsr sub_c29a1                                                     ; 1334: 20 a1 29     .) :1203[1]
    jsr l0131                                                         ; 1337: 20 31 01     1. :1206[1]
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
    lda l1103                                                         ; 13c2: ad 03 11    ... :1291[1]
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
    !byte   0, $8d, $8b, $17, $60,   0                                ; 1457: 00 8d 8b... ... :1326[1]

; $145d referenced 3 times by $1394, $13a3, $3f0f
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
l1377
    !byte   1,   2,   4,   8, $10, $20, $40, $80                      ; 14a8: 01 02 04... ... :1377[1]

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

; $14be referenced 7 times by $1f51, $2a01, $2a0c, $2a2d, $2c2f, $2c35, $2c3a
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
    lda l1377,y                                                       ; 164a: b9 77 13    .w. :1519[1]
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
    lda l1377,y                                                       ; 173f: b9 77 13    .w. :160e[1]
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

; $180d referenced 4 times by $1166, $197d, $3e69, $3e9b
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
    lda l110a                                                         ; 1859: ad 0a 11    ... :1728[1]
    beq c174c                                                         ; 185c: f0 1f       ..  :172b[1]
    lda #vdu_bell                                                     ; 185e: a9 07       ..  :172d[1]
    jsr oswrch                                                        ; 1860: 20 ee ff     .. :172f[1]   ; Write character 7
    lda #$12                                                          ; 1863: a9 12       ..  :1732[1]
    sta l0409                                                         ; 1865: 8d 09 04    ... :1734[1]
    jsr l040a                                                         ; 1868: 20 0a 04     .. :1737[1]
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
; $188e referenced 2 times by $1768, $1782
l175d
    !byte 0                                                           ; 188e: 00          .   :175d[1]
; $188f referenced 1 time by $11fa
l175e
    !byte 0                                                           ; 188f: 00          .   :175e[1]
; $1890 referenced 2 times by $176b, $1787
l175f
    !byte 0                                                           ; 1890: 00          .   :175f[1]
; $1891 referenced 2 times by $11fd, $123c
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
    jsr l0ad4                                                         ; 18a6: 20 d4 0a     .. :1775[1]
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

; $18bc referenced 2 times by $388f, $3892
l178b
    !byte   0, $a9, $13, $4c, $f4, $ff, $8a, $18, $69, $ff, $98, $69  ; 18bc: 00 a9 13... ... :178b[1]
    !byte   0, $49, $ff, $cd, $49, $fe, $90, $fb, $60, $48, $a5, $fc  ; 18c8: 00 49 ff... .I. :1797[1]
    !byte $48, $8a, $48, $98, $48, $20, $b9, $17, $20, $fa, $17, $68  ; 18d4: 48 8a 48... H.H :17a3[1]
    !byte $a8, $68, $aa, $68, $85, $fc, $68, $6c, $b5, $0a, $a9,   2  ; 18e0: a8 68 aa... .h. :17af[1]
    !byte $2c, $4d, $fe, $f0, $39, $ad,   4, $11, $8d, $44, $fe, $ad  ; 18ec: 2c 4d fe... ,M. :17bb[1]
    !byte   5, $11, $8d, $45, $fe, $ad,   8, $11, $8d, $46, $fe, $ad  ; 18f8: 05 11 8d... ... :17c7[1]
    !byte   9, $11, $8d, $47, $fe, $a9, $ff, $8d, $49, $fe, $a2,   1  ; 1904: 09 11 8d... ... :17d3[1]
    !byte $ac, $5e, $17, $20, $25, $18, $ad,   3, $11, $10,   7, $a2  ; 1910: ac 5e 17... .^. :17df[1]
    !byte   0, $a0,   5, $20, $25, $18, $a9,   0, $8d, $24, $18, $ee  ; 191c: 00 a0 05... ... :17eb[1]
    !byte $8b, $17, $60, $a9                                          ; 1928: 8b 17 60... ..` :17f7[1]
    !text "@,M"                                                       ; 192c: 40 2c 4d    @,M :17fb[1]
    !byte $fe, $f0, $22, $ad, $24, $18, $d0, $1d, $a2,   1, $ac, $60  ; 192f: fe f0 22... .." :17fe[1]
    !byte $17, $20, $25, $18, $ad,   3, $11, $10,   7, $a2,   0, $a0  ; 193b: 17 20 25... . % :180a[1]
    !byte   0, $20, $25, $18, $ee, $24, $18, $20, $12                 ; 1947: 00 20 25... . % :1816[1]
    !text ": G:`"                                                     ; 1950: 3a 20 47... : G :181f[1]
    !byte   0, $8a, $4a,   8, $98, $49,   7, $0a, $28, $6a, $a2,   7  ; 1955: 00 8a 4a... ..J :1824[1]
    !byte $8d, $21, $fe, $69, $10, $ca, $10, $f8, $60, $20, $8c, $17  ; 1961: 8d 21 fe... .!. :1830[1]
    !byte $20,   0,   4, $20, $45, $18, $4c,   0, $0c, $78, $a9, $0c  ; 196d: 20 00 04...  .. :183c[1]
    !byte $8d, $30, $fe, $a0,   0, $b9,   0, $be, $99,   0, $0c, $b9  ; 1979: 8d 30 fe... .0. :1848[1]
    !byte   0, $bf, $99,   0, $0b, $c8, $d0, $f1, $a5, $f4, $8d, $30  ; 1985: 00 bf 99... ... :1854[1]
    !byte $fe, $58, $8c, $87,   2, $60, $c9, $21, $90, $39, $c9, $7f  ; 1991: fe 58 8c... .X. :1860[1]
    !byte $b0, $35, $85, $60, $8a, $48, $98, $48, $a9, $0a, $a2, $60  ; 199d: b0 35 85... .5. :186c[1]
    !byte $a0,   0, $20, $f1, $ff                                     ; 19a9: a0 00 20... ..  :1878[1]
    !text "FaFb"                                                      ; 19ae: 46 61 46... FaF :187d[1]
    !byte   6, $66,   6, $67,   6, $68, $a9, $17, $20, $ee, $ff, $a9  ; 19b2: 06 66 06... .f. :1881[1]
    !byte $ff, $20, $ee, $ff, $a2,   0, $b5, $61, $20, $ee, $ff, $e8  ; 19be: ff 20 ee... . . :188d[1]
    !byte $e0,   8, $90, $f6, $68, $a8, $68, $aa, $a9, $ff, $4c, $ee  ; 19ca: e0 08 90... ... :1899[1]
    !byte $ff                                                         ; 19d6: ff          .   :18a5[1]

; $19d7 referenced 1 time by $3f56
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

    !byte $ad, $66,   9, $30, $41, $f0,   7, $ad, $50,   9, $c9, $40  ; 19f4: ad 66 09... .f. :18c3[1]
    !byte $b0, $4e, $ad, $7c,   9, $38, $ed, $87,   9, $f0, $2c, $ad  ; 1a00: b0 4e ad... .N. :18cf[1]
    !byte $92,   9, $ed, $9d,   9, $85, $70, $a2,   0, $20, $d2, $24  ; 1a0c: 92 09 ed... ... :18db[1]
    !byte $a5, $74, $18, $65, $76, $85, $7a, $a5                      ; 1a18: a5 74 18... .t. :18e7[1]
    !text "uewJfzJfzJfzJfz"                                           ; 1a20: 75 65 77... uew :18ef[1]
    !byte $a5                                                         ; 1a2f: a5          .   :18fe[1]
    !text "z05"                                                       ; 1a30: 7a 30 35    z05 :18ff[1]
    !byte $c9, $18, $b0, $4b, $a9,   0, $60, $a2,   1, $bd, $50,   9  ; 1a33: c9 18 b0... ... :1902[1]
    !byte $18, $69, $40, $9d, $50,   9, $a9,   1, $9d, $66,   9, $ca  ; 1a3f: 18 69 40... .i@ :190e[1]
    !byte $10, $ef, $a9,   1, $60, $a2,   1, $bd, $50,   9, $38, $e9  ; 1a4b: 10 ef a9... ... :191a[1]
    !byte $40, $9d, $50,   9, $a9,   0, $e9,   0, $9d, $66,   9, $ca  ; 1a57: 40 9d 50... @.P :1926[1]
    !byte $10, $ed, $a9,   4, $60, $a5, $70, $10, $cb, $a2,   1, $bd  ; 1a63: 10 ed a9... ... :1932[1]
    !byte $7c,   9, $18, $69, $c0, $9d, $7c,   9, $a9,   0, $9d, $92  ; 1a6f: 7c 09 18... |.. :193e[1]
    !byte   9, $ca, $10, $ef, $a9,   8, $60, $a5, $70, $30, $b1, $a2  ; 1a7b: 09 ca 10... ... :194a[1]
    !byte   1, $bd, $7c,   9, $38, $e9, $c0, $9d, $7c,   9, $ca, $10  ; 1a87: 01 bd 7c... ..| :1956[1]
    !byte $f4, $a9,   2, $60                                          ; 1a93: f4 a9 02... ... :1962[1]

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
; $1aa0 referenced 1 time by $3e79
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
    !byte $8d, $0f, $1a, $8a, $48, $98, $48, $ad, $2b, $13, $f0, $51  ; 1ab9: 8d 0f 1a... ... :1988[1]
    !byte $a5, $30, $cd, $ba, $1a, $d0, $47, $20, $fa, $1e, $c9,   3  ; 1ac5: a5 30 cd... .0. :1994[1]
    !byte $f0, $17, $a9,   3, $20, $bb, $1e, $c8, $a9                 ; 1ad1: f0 17 a9... ... :19a0[1]
    !text ": L"                                                       ; 1ada: 3a 20 4c    : L :19a9[1]
    !byte $1f, $88, $e8, $ad, $0f, $1a, $20, $5d, $1f, $a9,   1, $d0  ; 1add: 1f 88 e8... ... :19ac[1]
    !byte $1b, $ca, $a9,   3, $20, $bb, $1e, $e8, $a9, $ff, $85, $1d  ; 1ae9: 1b ca a9... ... :19b8[1]
    !byte $c8, $a9                                                    ; 1af5: c8 a9       ..  :19c4[1]
    !text ": L"                                                       ; 1af7: 3a 20 4c    : L :19c6[1]
    !byte $1f, $88, $ca, $ad, $0f, $1a, $20, $5d, $1f, $a9, $ff, $ae  ; 1afa: 1f 88 ca... ... :19c9[1]
    !byte $0f, $1a, $9d, $be,   9, $a9,   7, $20, $a6, $18, $9d, $d4  ; 1b06: 0f 1a 9d... ... :19d5[1]
    !byte   9, $4c, $f2, $19, $a5, $30, $cd, $ba, $1a, $d0,   6, $ae  ; 1b12: 09 4c f2... .L. :19e1[1]
    !byte $0f, $1a, $fe, $d4,   9, $a5, $30, $cd, $ba, $1a, $d0, $0e  ; 1b1e: 0f 1a fe... ... :19ed[1]
    !byte $ae, $0f, $1a, $bd, $d4,   9, $29,   7, $18, $69, $3c, $9d  ; 1b2a: ae 0f 1a... ... :19f9[1]
    !byte $a8,   9, $68, $a8, $68, $aa, $ad, $0f, $1a, $60,   0, $8d  ; 1b36: a8 09 68... ..h :1a05[1]
    !byte $ae, $1a, $8e, $af, $1a, $8c, $b0, $1a, $ee, $b1, $1a, $ad  ; 1b42: ae 1a 8e... ... :1a11[1]
    !byte $b1, $1a, $29,   7, $a8, $b9, $b2, $1a, $8d, $ed, $2e, $8d  ; 1b4e: b1 1a 29... ..) :1a1d[1]
    !byte $f2, $2e, $a9, $21, $8d, $e8, $2e, $a5, $30, $cd, $ba, $1a  ; 1b5a: f2 2e a9... ... :1a29[1]
    !byte $d0, $67, $ad, $2b, $13, $d0, $1d, $ae, $ae, $1a, $a0, $0b  ; 1b66: d0 67 ad... .g. :1a35[1]
    !byte $20, $e2, $28, $f0, $13, $a5, $31, $38, $e9, $41, $a8, $b9  ; 1b72: 20 e2 28...  .( :1a41[1]
    !byte $ef,   9,   9, $80, $99, $ef,   9, $a9, $21, $20, $bd, $2b  ; 1b7e: ef 09 09... ... :1a4d[1]
    !byte $ae, $ae, $1a, $a9, $c5, $9d, $ac, $38, $a9,   0, $9d, $a8  ; 1b8a: ae ae 1a... ... :1a59[1]
    !byte   9, $a5, $31, $38, $e9, $41, $a8, $b9, $ef,   9, $29, $80  ; 1b96: 09 a5 31... ..1 :1a65[1]
    !byte $d0, $2b, $a9,   1, $9d, $be,   9, $ad, $b1, $1a, $29,   7  ; 1ba2: d0 2b a9... .+. :1a71[1]
    !byte $a8, $c0,   5, $90, $0d, $a9, $ff, $9d, $be,   9, $e6, $3a  ; 1bae: a8 c0 05... ... :1a7d[1]
    !byte $98, $e9,   8, $49, $ff                                     ; 1bba: 98 e9 08... ... :1a89[1]
    !text "8i", '"'                                                   ; 1bbf: 38 69 22    8i" :1a8e[1]
    !byte $9d, $a8,   9, $8a, $ae, $af, $1a, $ac, $b0, $1a, $20, $5d  ; 1bc2: 9d a8 09... ... :1a91[1]
    !byte $1f, $a9,   0, $85, $3a, $85, $3b, $ad, $ae, $1a, $ae, $af  ; 1bce: 1f a9 00... ... :1a9d[1]
    !byte $1a, $ac, $b0, $1a, $60,   0,   0,   0,   0                 ; 1bda: 1a ac b0... ... :1aa9[1]
    !text "'()*+*)("                                                  ; 1be3: 27 28 29... '() :1ab2[1]
    !byte   0, $48, $84, $7d, $20, $17, $1e, $20, $66, $1b, $a5, $76  ; 1beb: 00 48 84... .H. :1aba[1]
    !byte $85, $74, $a5, $77, $85, $75, $a6, $40, $a4, $41, $86, $78  ; 1bf7: 85 74 a5... .t. :1ac6[1]
    !byte $84, $79, $86, $7a, $84, $7b, $18, $a9,   0, $85, $7e, $a6  ; 1c03: 84 79 86... .y. :1ad2[1]
    !byte $72, $a5, $70, $85, $7c, $a0,   7, $a5, $42, $f0, $23, $30  ; 1c0f: 72 a5 70... r.p :1ade[1]
    !byte $0d, $c9,   1, $18, $f0, $38, $e9,   0, $20, $a6, $18, $4c  ; 1c1b: 0d c9 01... ... :1aea[1]
    !byte $14, $1b, $29, $7f, $38, $e9,   1, $c5, $7e, $a5, $7e, $e6  ; 1c27: 14 1b 29... ..) :1af6[1]
    !byte $7e, $b0, $0f, $a9,   0, $85, $7e, $4c, $14, $1b, $a5, $7c  ; 1c33: 7e b0 0f... ~.. :1b02[1]
    !byte $4a, $a5                                                    ; 1c3f: 4a a5       J.  :1b0e[1]
    !text "}*)"                                                       ; 1c41: 7d 2a 29    }*) :1b10[1]
    !byte   3, $0a, $0a, $26, $7b, $0a, $26, $7b, $18, $65, $78, $85  ; 1c44: 03 0a 0a... ... :1b13[1]
    !byte $7a, $a5, $7b, $29,   3, $65, $79, $85, $7b, $b1, $7a, $91  ; 1c50: 7a a5 7b... z.{ :1b1f[1]
    !byte $76, $88, $10, $f9, $e6, $7c, $ca, $f0, $0d, $a5, $76, $69  ; 1c5c: 76 88 10... v.. :1b2b[1]
    !byte   8, $85, $76, $90, $a7, $e6, $77, $18, $90, $a2, $e6, $7d  ; 1c68: 08 85 76... ..v :1b37[1]
    !byte $c6, $73, $f0, $12, $a5                                     ; 1c74: c6 73 f0... .s. :1b43[1]
    !text "ti@"                                                       ; 1c79: 74 69 40    ti@ :1b48[1]
    !byte $85, $74, $85, $76, $a5, $75, $69,   1, $85, $75, $85, $77  ; 1c7c: 85 74 85... .t. :1b4b[1]
    !byte $90, $84, $a6, $70, $a4, $71, $a5, $3e, $30,   3, $20, $44  ; 1c88: 90 84 a6... ... :1b57[1]
    !byte $1e, $68, $60, $a9,   0, $85, $76, $84, $77, $98            ; 1c94: 1e 68 60... .h` :1b63[1]
    !text "JfvJfvew"                                                  ; 1c9e: 4a 66 76... Jfv :1b6d[1]
    !byte $a8, $8a, $0a, $0a, $0a, $90,   2, $c8, $18, $65, $76, $85  ; 1ca6: a8 8a 0a... ... :1b75[1]
    !byte $76, $98, $65, $4c, $a4, $77, $85                           ; 1cb2: 76 98 65... v.e :1b81[1]
    !text "w`L;"                                                      ; 1cb9: 77 60 4c... w`L :1b88[1]
    !byte $1c, $4c, $9d, $1c, $a9,   3, $85, $44, $a0, $17, $a2, $27  ; 1cbd: 1c 4c 9d... .L. :1b8c[1]
    !byte $20, $fa, $1e, $c9,   3, $d0, $24, $e8, $20, $fa, $1e, $ca  ; 1cc9: 20 fa 1e...  .. :1b98[1]
    !byte $c9,   3, $d0, $e2, $ca, $20, $fa, $1e, $e8, $c9,   3, $d0  ; 1cd5: c9 03 d0... ... :1ba4[1]
    !byte $dc, $88, $20, $fa, $1e, $c8, $c9,   3, $d0, $10, $c8, $20  ; 1ce1: dc 88 20... ..  :1bb0[1]
    !byte $fa, $1e, $88, $c9,   3, $d0, $52, $ca, $10, $d2, $88, $10  ; 1ced: fa 1e 88... ... :1bbc[1]
    !byte $cd, $60, $84, $71, $88, $20, $66, $1b, $8a, $29,   3, $0a  ; 1cf9: cd 60 84... .`. :1bc8[1]
    !byte $0a, $0a, $0a, $18, $69, $19, $85, $7a, $a9,   0, $69, $1d  ; 1d05: 0a 0a 0a... ... :1bd4[1]
    !byte $85, $7b, $a0,   7, $b1, $7a, $91, $76, $88, $c0,   2, $b0  ; 1d11: 85 7b a0... .{. :1be0[1]
    !byte $f7, $a5, $7a, $18, $69,   8, $85, $7a, $a5, $7b, $69,   0  ; 1d1d: f7 a5 7a... ..z :1bec[1]
    !byte $85, $7b, $a5, $76, $18, $69, $40, $85, $76, $a5, $77, $69  ; 1d29: 85 7b a5... .{. :1bf8[1]
    !byte   1, $85, $77, $a0,   5, $b1, $7a, $91, $76, $88, $10, $f9  ; 1d35: 01 85 77... ..w :1c04[1]
    !byte $a4, $71, $4c, $c3, $1b, $20, $66, $1b, $8a, $29,   3, $0a  ; 1d41: a4 71 4c... .qL :1c10[1]
    !byte $0a, $0a, $18, $69, $59, $85, $7a, $a9,   0, $69, $1d, $85  ; 1d4d: 0a 0a 18... ... :1c1c[1]
    !byte $7b, $84, $71, $a0,   7, $b1, $7a, $91, $76, $88, $c0,   2  ; 1d59: 7b 84 71... {.q :1c28[1]
    !byte $b0, $f7, $a4, $71, $4c, $c3, $1b, $20, $f3, $1c, $f0, $0e  ; 1d65: b0 f7 a4... ... :1c34[1]
    !byte $e8, $a9, $ff, $85, $1d, $a5, $16, $20, $4c, $1f, $ca, $4c  ; 1d71: e8 a9 ff... ... :1c40[1]
    !byte $6e, $1c, $98, $29,   3, $0a, $0a, $0a, $18, $69, $99, $85  ; 1d7d: 6e 1c 98... n.. :1c4c[1]
    !byte $7a, $a9,   0, $69, $1d, $85, $7b, $a0,   7, $b1, $76, $29  ; 1d89: 7a a9 00... z.. :1c58[1]
    !byte $c0, $11, $7a, $91, $76, $88, $10, $f5, $a4, $71, $e8, $88  ; 1d95: c0 11 7a... ..z :1c64[1]
    !byte $30, $10, $20, $fa, $1e, $c9,   3, $d0,   9, $a9, $ff, $85  ; 1da1: 30 10 20... 0.  :1c70[1]
    !byte $1d, $a9                                                    ; 1dad: 1d a9       ..  :1c7c[1]
    !text "/ L"                                                       ; 1daf: 2f 20 4c    / L :1c7e[1]
    !byte $1f, $c8, $c8, $c0, $18, $b0, $10, $20, $fa, $1e, $c9,   3  ; 1db2: 1f c8 c8... ... :1c81[1]
    !byte $d0,   9, $a9, $ff, $85, $1d, $a9                           ; 1dbe: d0 09 a9... ... :1c8d[1]
    !text ". L"                                                       ; 1dc5: 2e 20 4c    . L :1c94[1]
    !byte $1f, $ca, $88, $4c, $c3, $1b, $20, $f3, $1c, $f0,   6, $20  ; 1dc8: 1f ca 88... ... :1c97[1]
    !byte $4c, $1f, $4c, $c8, $1c, $98, $29,   3, $0a, $0a, $0a, $18  ; 1dd4: 4c 1f 4c... L.L :1ca3[1]
    !byte $69, $79, $85, $7a, $a9,   0, $69, $1d, $85, $7b, $a0,   7  ; 1de0: 69 79 85... iy. :1caf[1]
    !byte $b1, $76, $29,   3, $11, $7a, $91, $76, $88, $10, $f5, $a4  ; 1dec: b1 76 29... .v) :1cbb[1]
    !byte $71, $ca, $88, $30, $0e, $20, $fa, $1e, $c9,   3, $d0,   7  ; 1df8: 71 ca 88... q.. :1cc7[1]
    !byte $a9, $2f, $e8, $20, $4c, $1f, $ca, $c8, $c8, $c0, $18, $b0  ; 1e04: a9 2f e8... ./. :1cd3[1]
    !byte $0e, $20, $fa, $1e, $c9,   3, $d0,   7, $a9, $2e, $e8, $20  ; 1e10: 0e 20 fa... . . :1cdf[1]
    !byte $4c, $1f, $ca, $e8, $88, $4c, $c3, $1b, $a9, $2c, $85, $16  ; 1e1c: 4c 1f ca... L.. :1ceb[1]
    !byte $88, $20, $fa, $1e, $c8, $c9,   3, $d0, $16, $a9, $2d, $85  ; 1e28: 88 20 fa... . . :1cf7[1]
    !byte $16, $c8, $20, $fa, $1e, $88, $c9,   3, $d0,   9, $84       ; 1e34: 16 c8 20... ..  :1d03[1]
    !text "q f"                                                       ; 1e3f: 71 20 66    q f :1d0e[1]
    !byte $1b, $a9,   0, $85, $16, $a5, $16, $60,   0,   0,   0, $ff  ; 1e42: 1b a9 00... ... :1d11[1]
    !byte $b7, $ff, $fd, $ef,   0, $ff, $fd, $df, $f3,   0,   0,   0  ; 1e4e: b7 ff fd... ... :1d1d[1]
    !byte   0,   0, $0c, $f3, $bf, $fd, $ef, $ff,   0, $ff, $fb, $bf  ; 1e5a: 00 00 0c... ... :1d29[1]
    !byte $ff,   0,   0,   0,   0,   0,   0, $ff, $bd, $ff, $df, $fb  ; 1e66: ff 00 00... ... :1d35[1]
    !byte   4, $ef, $ff, $db, $ff,   0,   0,   0,   0,   0, $20, $df  ; 1e72: 04 ef ff... ... :1d41[1]
    !byte $f7, $bd, $ef, $ff,   2, $fd, $bf, $fb, $ef,   0,   0,   0  ; 1e7e: f7 bd ef... ... :1d4d[1]
    !byte   0,   0,   0, $df, $fd, $bf, $f7,   8,   0,   0,   0, $ff  ; 1e8a: 00 00 00... ... :1d59[1]
    !byte $fb, $df, $f7,   0,   0,   0,   0, $bf, $f7, $df, $f9,   6  ; 1e96: fb df f7... ... :1d65[1]
    !byte   0,   0,   0, $ef, $fb, $bf, $ff,   0                      ; 1ea2: 00 00 00... ... :1d71[1]
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

; $1f25 referenced 1 time by $1242
sub_c1df4
    lda #0                                                            ; 1f25: a9 00       ..  :1df4[1]
    tay                                                               ; 1f27: a8          .   :1df6[1]
; $1f28 referenced 1 time by $1dfd
loop_c1df7
    sta l0c00,y                                                       ; 1f28: 99 00 0c    ... :1df7[1]
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

    !byte $86, $70, $84, $71, $a5, $3c, $85, $72, $a5, $3d, $85, $73  ; 1f48: 86 70 84... .p. :1e17[1]
    !byte $8a, $18, $65, $3c, $b0,   4, $c9, $29, $90,   6, $a9, $28  ; 1f54: 8a 18 65... ..e :1e23[1]
    !byte $e5, $70, $85, $72, $98, $18, $65, $3d, $b0,   4, $c9, $19  ; 1f60: e5 70 85... .p. :1e2f[1]
    !byte $90,   6, $a9, $18, $e5, $71, $85                           ; 1f6c: 90 06 a9... ... :1e3b[1]
    !text "s`H"                                                       ; 1f73: 73 60 48    s`H :1e42[1]
    !byte $a5, $3e, $c9,   4, $90,   3, $4c, $a5, $1e, $85, $49, $20  ; 1f76: a5 3e c9... .>. :1e45[1]
    !byte $17, $1e, $98, $0a, $85, $4a, $0a, $0a, $65, $4a, $85, $4a  ; 1f82: 17 1e 98... ... :1e51[1]
    !byte $8a, $4a, $4a, $18, $65, $4a, $a8, $8a, $29,   3, $49,   3  ; 1f8e: 8a 4a 4a... .JJ :1e5d[1]
    !byte $aa, $a5, $73, $85, $4b, $86, $74, $a5, $49, $0a, $0a,   5  ; 1f9a: aa a5 73... ..s :1e69[1]
    !byte $74, $aa, $bd, $ab, $1e, $a6, $74, $85, $74, $84, $75, $b9  ; 1fa6: 74 aa bd... t.. :1e75[1]
    !byte   0, $0c, $3d, $a7, $1e,   5, $74, $99,   0, $0c, $98, $69  ; 1fb2: 00 0c 3d... ..= :1e81[1]
    !byte $0a, $a8, $c6, $4b, $d0, $ed, $a4, $75, $ca, $10,   3, $a2  ; 1fbe: 0a a8 c6... ... :1e8d[1]
    !byte   3, $c8, $c6, $72, $d0, $cb, $a5, $49, $a6, $70, $a4       ; 1fca: 03 c8 c6... ... :1e99[1]
    !text "qh`?"                                                      ; 1fd5: 71 68 60... qh` :1ea4[1]
    !byte $cf, $f3, $fc,   0,   0,   0,   0, $40, $10,   4,   1, $80  ; 1fd9: cf f3 fc... ... :1ea8[1]
    !byte $20,   8,   2, $c0, $30, $0c,   3, $29,   3, $85, $49, $8a  ; 1fe5: 20 08 02...  .. :1eb4[1]
    !byte $48, $98, $48, $0a, $85, $4a, $0a, $0a, $65, $4a, $85, $4a  ; 1ff1: 48 98 48... H.H :1ec0[1]
    !byte $8a, $4a, $4a, $18, $65, $4a, $a8, $8a, $29,   3, $49,   3  ; 1ffd: 8a 4a 4a... .JJ :1ecc[1]
    !byte $85, $4a, $a5, $49, $0a, $0a,   5, $4a, $aa, $bd, $ab, $1e  ; 2009: 85 4a a5... .J. :1ed8[1]
    !byte $a6, $4a, $85, $4a, $b9,   0, $0c, $3d, $a7, $1e,   5, $4a  ; 2015: a6 4a 85... .J. :1ee4[1]
    !byte $99,   0, $0c, $68, $a8, $68, $aa, $a5, $49, $60, $e0, $28  ; 2021: 99 00 0c... ... :1ef0[1]
    !byte $b0, $2f, $c0, $18, $b0, $2b, $86, $4a, $84, $4b, $98, $0a  ; 202d: b0 2f c0... ./. :1efc[1]
    !byte $85, $49, $0a, $0a, $65, $49, $85, $49, $8a, $4a, $4a, $18  ; 2039: 85 49 0a... .I. :1f08[1]
    !byte $65, $49, $a8, $8a, $29,   3, $aa, $b9,   0, $0c, $4c, $23  ; 2045: 65 49 a8... eI. :1f14[1]
    !byte $1f, $4a, $4a, $ca, $10, $fb, $a6, $4a, $a4, $4b, $29,   3  ; 2051: 1f 4a 4a... .JJ :1f20[1]
    !byte $60, $a5, $44, $10, $fb, $86, $4a, $84, $4b, $a2,   0, $a5  ; 205d: 60 a5 44... `.D :1f2c[1]
    !byte $4a, $30, $cb, $a2, $27, $c9, $28, $b0, $c5, $aa, $a0,   0  ; 2069: 4a 30 cb... J0. :1f38[1]
    !byte $a5, $4b, $30, $be, $a0, $17, $d0, $ba                      ; 2075: a5 4b 30... .K0 :1f44[1]

; $207d referenced 1 time by $3f48
sub_c1f4c
    sta l0016                                                         ; 207d: 85 16       ..  :1f4c[1]
    jsr sub_c1f84                                                     ; 207f: 20 84 1f     .. :1f4e[1]
    jsr sub_c138d                                                     ; 2082: 20 8d 13     .. :1f51[1]
    lda l0016                                                         ; 2085: a5 16       ..  :1f54[1]
    rts                                                               ; 2087: 60          `   :1f56[1]

    !byte $20, $4c, $1f, $4c, $44, $1e                                ; 2088: 20 4c 1f...  L. :1f57[1]

; $208e referenced 1 time by $12b8
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

    !byte $a5, $52, $48, $a9,   0, $85, $52, $a9,   0, $aa, $9d, $16  ; 2108: a5 52 48... .RH :1fd7[1]
    !byte   1, $e8, $e0, $0b, $90, $f8, $a2,   0, $86, $62, $86, $63  ; 2114: 01 e8 e0... ... :1fe3[1]
    !byte $a9, $ff, $85, $60, $86, $61, $bd, $16,   1, $d0, $13, $bd  ; 2120: a9 ff 85... ... :1fef[1]
    !byte $a8,   9, $1d, $b3,   9, $f0, $0b, $bd, $c2, $38, $c5, $61  ; 212c: a8 09 1d... ... :1ffb[1]
    !byte $90,   4, $85, $61, $86, $60, $e8, $e0, $0b, $90, $e3, $a6  ; 2138: 90 04 85... ... :2007[1]
    !byte $60, $10, $11, $a2, $0a, $bd, $16,   1, $d0,   3, $20, $f7  ; 2144: 60 10 11... `.. :2013[1]
    !byte $20, $ca, $10, $f5, $68, $85, $52, $60, $a9, $ff, $9d, $16  ; 2150: 20 ca 10...  .. :201f[1]
    !byte   1, $20, $1e, $21, $f0, $b8, $8a, $a6, $62, $9d,   0,   1  ; 215c: 01 20 1e... . . :202b[1]
    !byte $e6, $62, $a6, $63, $bc,   0,   1, $84, $60, $b9, $c2, $38  ; 2168: e6 62 a6... .b. :2037[1]
    !byte $85, $61, $a2,   0, $8a, $a0,   0, $d9,   0,   1, $f0, $3e  ; 2174: 85 61 a2... .a. :2043[1]
    !byte $c8, $c4, $62, $90, $f6, $bd, $c2, $38, $c5, $61, $90,   6  ; 2180: c8 c4 62... ..b :204f[1]
    !byte $d0, $30, $e4, $60, $b0, $2c, $86, $64, $8a, $18, $69, $0b  ; 218c: d0 30 e4... .0. :205b[1]
    !byte $aa, $a4, $60, $20, $e2, $28, $d0, $0e, $98, $18, $69, $0b  ; 2198: aa a4 60... ..` :2067[1]
    !byte $a8, $20, $e2, $28, $a6, $64,   9,   0, $f0, $10, $a6, $64  ; 21a4: a8 20 e2... . . :2073[1]
    !byte $a9, $ff, $9d, $16,   1, $8a, $a6, $62, $9d,   0,   1, $e6  ; 21b0: a9 ff 9d... ... :207f[1]
    !byte $62, $aa, $e8, $e0, $0b, $90, $b5, $e6, $63, $a5, $63, $c5  ; 21bc: 62 aa e8... b.. :208b[1]
    !byte $62, $90, $9f, $a9,   0, $85, $63, $a9, $ff, $85, $60, $85  ; 21c8: 62 90 9f... b.. :2097[1]
    !byte $61, $a2,   0, $bc,   0,   1, $30, $13, $b9, $c2, $38, $c5  ; 21d4: 61 a2 00... a.. :20a3[1]
    !byte $61, $90,   6, $d0, $0a, $c4, $60, $b0,   6, $84, $60, $85  ; 21e0: 61 90 06... a.. :20af[1]
    !byte $61, $86, $64, $e8, $e4, $62, $90, $e3, $a6, $64, $a9, $ff  ; 21ec: 61 86 64... a.d :20bb[1]
    !byte $9d,   0,   1, $a6, $63, $a5, $60, $9d, $0b,   1, $e8, $86  ; 21f8: 9d 00 01... ... :20c7[1]
    !byte $63, $e4, $62, $90, $c6, $a0,   0, $b9, $0b,   1, $aa       ; 2204: 63 e4 62... c.b :20d3[1]
    !text " W!"                                                       ; 220f: 20 57 21     W! :20de[1]
    !byte $c8, $c4, $62, $90, $f4, $88, $b9, $0b,   1, $aa, $20, $9a  ; 2212: c8 c4 62... ..b :20e1[1]
    !byte $21, $20, $f7, $20, $88, $10, $f3, $4c, $e9, $1f, $48, $bd  ; 221e: 21 20 f7... ! . :20ed[1]
    !byte $50,   9, $9d, $5b,   9, $bd, $66,   9, $9d, $71,   9, $bd  ; 222a: 50 09 9d... P.. :20f9[1]
    !byte $7c,   9, $9d, $87,   9, $bd, $92,   9, $9d, $9d,   9, $bd  ; 2236: 7c 09 9d... |.. :2105[1]
    !byte $a8,   9, $9d, $b3,   9, $bd, $be,   9, $9d, $c9,   9, $68  ; 2242: a8 09 9d... ... :2111[1]
    !byte $60, $a9, $ff, $48, $bd, $50,   9, $dd, $5b,   9, $d0, $2c  ; 224e: 60 a9 ff... `.. :211d[1]
    !byte $bd, $66,   9, $dd, $71,   9, $d0, $24, $bd, $7c,   9, $dd  ; 225a: bd 66 09... .f. :2129[1]
    !byte $87,   9, $d0, $1c, $bd, $92,   9, $dd, $9d,   9, $d0, $14  ; 2266: 87 09 d0... ... :2135[1]
    !byte $bd, $a8,   9, $dd, $b3,   9, $d0, $0c, $bd, $be,   9, $dd  ; 2272: bd a8 09... ... :2141[1]
    !byte $c9,   9, $d0,   4, $68, $a9,   0                           ; 227e: c9 09 d0... ... :214d[1]
    !text "Hh`"                                                       ; 2285: 48 68 60    Hh` :2154[1]
    !byte $98, $48, $bd, $b3,   9, $f0, $39, $bd, $5b,   9, $85, $18  ; 2288: 98 48 bd... .H. :2157[1]
    !byte $bd, $71,   9, $85, $19, $bd, $87,   9, $85, $1a, $bd, $9d  ; 2294: bd 71 09... .q. :2163[1]
    !byte   9, $85, $1b, $bd, $c9,   9, $85, $1d, $bd, $ac, $38, $f0  ; 22a0: 09 85 1b... ... :216f[1]
    !byte   8, $c9, $ff, $f0, $0b, $a0,   0, $f0, $0c, $bd, $b3,   9  ; 22ac: 08 c9 ff... ... :217b[1]
    !byte $a0,   2, $d0,   5, $bd, $b3,   9, $a0,   4, $85, $16, $84  ; 22b8: a0 02 d0... ... :2187[1]
    !byte $15, $20, $8d, $13, $68, $a8, $60, $bd, $a8,   9, $f0, $60  ; 22c4: 15 20 8d... . . :2193[1]
    !byte $bd, $50,   9, $85, $18, $bd, $66,   9, $85, $19, $bd, $7c  ; 22d0: bd 50 09... .P. :219f[1]
    !byte   9, $85, $1a, $bd, $92,   9, $85, $1b, $bd, $be,   9, $85  ; 22dc: 09 85 1a... ... :21ab[1]
    !byte $1d, $bd, $a8,   9, $85, $16, $a9,   0, $85, $15, $bd, $ac  ; 22e8: 1d bd a8... ... :21b7[1]
    !byte $38, $f0, $0a, $c9, $ff, $f0,   6, $85, $14, $a9,   3, $85  ; 22f4: 38 f0 0a... 8.. :21c3[1]
    !byte $15, $20, $8d, $13, $e0,   1, $d0, $28, $a5, $48, $c9,   4  ; 2300: 15 20 8d... . . :21cf[1]
    !byte $d0, $22, $86, $65, $a2,   0, $20, $1e, $21, $a6, $65,   9  ; 230c: d0 22 86... .". :21db[1]
    !byte   0, $f0,   5, $ad, $16,   1, $f0, $10, $bd, $be,   9, $85  ; 2318: 00 f0 05... ... :21e7[1]
    !byte $1d, $a9,   0, $85, $15, $a9, $37, $85, $16, $20, $8d, $13  ; 2324: 1d a9 00... ... :21f3[1]
    !byte $60, $86, $70, $84, $71, $a8, $b1, $70, $8d, $a8,   9, $c8  ; 2330: 60 86 70... `.p :21ff[1]
    !byte $ad, $33, $24, $d0, $21, $b1, $70, $ae, $be,   9, $10,   5  ; 233c: ad 33 24... .3$ :220b[1]
    !byte $49, $ff, $18, $69,   1, $a2,   0,   9,   0, $10,   1, $ca  ; 2348: 49 ff 18... I.. :2217[1]
    !byte $18, $6d, $50,   9, $8d, $50,   9, $8a, $6d, $66,   9, $8d  ; 2354: 18 6d 50... .mP :2223[1]
    !byte $66,   9, $c8, $a2,   0, $b1, $70, $10,   1, $ca, $18, $6d  ; 2360: 66 09 c8... f.. :222f[1]
    !byte $7c,   9, $8d, $7c,   9, $8a, $6d, $92,   9, $8d, $92,   9  ; 236c: 7c 09 8d... |.. :223b[1]
    !byte $60, $86, $72, $84, $73, $a0,   0,   9,   0, $10, $15, $29  ; 2378: 60 86 72... `.r :2247[1]
    !byte $7f, $a8, $b1, $70, $c0, $7f, $d0, $0c, $ac, $d5,   9, $c8  ; 2384: 7f a8 b1... ... :2253[1]
    !byte $b1, $70, $d0,   4, $a0,   0, $b1, $70, $8c, $d5,   9, $8d  ; 2390: b1 70 d0... .p. :225f[1]
    !byte $a9,   9, $ad, $be,   9, $8d, $bf,   9, $ad, $a8,   9, $20  ; 239c: a9 09 ad... ... :226b[1]
    !byte $ae, $22, $8a, $ae, $be,   9, $10,   5, $49, $ff, $18, $69  ; 23a8: ae 22 8a... .". :2277[1]
    !byte   1, $a2,   0,   9,   0, $10,   1, $ca, $18, $6d, $50,   9  ; 23b4: 01 a2 00... ... :2283[1]
    !byte $8d, $51,   9, $8a, $6d, $66,   9, $8d, $67,   9, $a2,   0  ; 23c0: 8d 51 09... .Q. :228f[1]
    !byte $98, $10,   1, $ca, $18, $6d, $7c,   9, $8d, $7d,   9, $8a  ; 23cc: 98 10 01... ... :229b[1]
    !byte $6d, $92,   9, $8d, $93,   9, $60, $85, $74, $a0,   0, $f0  ; 23d8: 6d 92 09... m.. :22a7[1]
    !byte   7, $c5, $74, $f0, $0c, $c8, $c8, $c8, $b1, $72, $d0, $f5  ; 23e4: 07 c5 74... ..t :22b3[1]
    !byte $a2,   0, $a0,   0, $60, $c8, $b1, $72, $aa, $c8, $b1, $72  ; 23f0: a2 00 a0... ... :22bf[1]
    !byte $a8, $60, $a5, $48, $f0, $0f, $c9,   4, $f0, $0e, $c9,   5  ; 23fc: a8 60 a5... .`. :22cb[1]
    !byte $f0, $0d, $c9,   6, $f0, $0c, $4c, $ec, $22, $4c, $86, $39  ; 2408: f0 0d c9... ... :22d7[1]
    !byte $4c, $87, $2d, $4c, $c8, $2f, $4c, $d8, $31, $60,   0, $86  ; 2414: 4c 87 2d... L.- :22e3[1]
    !byte $70, $84, $71, $18, $6d, $d4,   9, $a8, $b1, $70, $d0,   3  ; 2420: 70 84 71... p.q :22ef[1]
    !byte $ac, $df,   9, $ad, $df,   9, $d0,   6, $98, $d0            ; 242c: ac df 09... ... :22fb[1]
    !text "+ X#"                                                      ; 2436: 2b 20 58... + X :2305[1]
    !byte $ad, $df,   9, $cd, $ed, $22, $d0, $14, $cc, $df,   9, $d0  ; 243a: ad df 09... ... :2309[1]
    !byte $1b, $a9,   0, $8d, $df,   9, $8d, $d4,   9, $85            ; 2446: 1b a9 00... ... :2315[1]
    !text "HhhL"                                                      ; 2450: 48 68 68... Hhh :231f[1]
    !byte $cd, $22, $a5, $48, $c5, $4d, $f0,   9, $ac, $ed, $22, $8c  ; 2454: cd 22 a5... .". :2323[1]
    !byte $df,   9, $a9, $ff, $60, $a9,   0, $60, $85, $4d, $a9,   0  ; 2460: df 09 a9... ... :232f[1]
    !byte $8d, $33, $24, $85, $52, $a5, $29, $cd, $6d, $29, $90, $10  ; 246c: 8d 33 24... .3$ :233b[1]
    !byte $a9, $ff, $a2, $d0, $a0, $38, $20, $f6, $38, $a2, $ba, $a0  ; 2478: a9 ff a2... ... :2347[1]
    !byte $38, $20, $f6, $38, $60, $a9, $15, $a2,   4, $20, $f4, $ff  ; 2484: 38 20 f6... 8 . :2353[1]
    !byte $a9,   0, $8d, $6f, $39, $8d, $70, $39, $8d                 ; 2490: a9 00 8d... ... :235f[1]
    !text "3$`"                                                       ; 2499: 33 24 60    3$` :2368[1]
    !byte $ad, $a8,   9, $2d, $b3,   9, $f0, $35, $a9,   2, $8d, $51  ; 249c: ad a8 09... ... :236b[1]
    !byte $25, $a9,   0, $20, $94, $28, $f0, $29, $ad, $87,   9, $38  ; 24a8: 25 a9 00... %.. :2377[1]
    !byte $ed, $7c,   9, $f0, $0a, $ad, $9d,   9, $ed, $92,   9, $30  ; 24b4: ed 7c 09... .|. :2383[1]
    !byte $15, $10, $16, $ad, $d8, $38, $29,   2, $f0, $0f, $a9,   2  ; 24c0: 15 10 16... ... :238f[1]
    !byte $8d, $51, $25, $a9, $0b, $20, $94, $28, $d0,   3, $20, $a9  ; 24cc: 8d 51 25... .Q% :239b[1]
    !text "#`H"                                                       ; 24d8: 23 60 48    #`H :23a7[1]
    !byte $8a, $48, $98, $48, $a9,   0, $a2, $ee, $a0, $38, $20, $f6  ; 24db: 8a 48 98... .H. :23aa[1]
    !byte $38, $a2, $e6, $a0, $38, $20, $f6, $38, $68, $a8, $68, $aa  ; 24e7: 38 a2 e6... 8.. :23b6[1]
    !byte $68, $60, $8a, $48, $98, $48, $a9,   0                      ; 24f3: 68 60 8a... h`. :23c2[1]
    !text " p'"                                                       ; 24fb: 20 70 27     p' :23ca[1]
    !byte $ad, $33, $24, $f0, $59, $c9, $80, $f0, $44, $ad            ; 24fe: ad 33 24... .3$ :23cd[1]
    !text "3$0"                                                       ; 2508: 33 24 30    3$0 :23d7[1]
    !byte   7, $ee, $d1, $24, $a0,   0, $f0,   5, $ce, $d0, $24, $a0  ; 250b: 07 ee d1... ... :23da[1]
    !byte $ff, $a9,   1, $8d, $51, $25, $a9,   0, $20, $94, $28, $f0  ; 2517: ff a9 01... ... :23e6[1]
    !byte   7, $a9, $80, $8d, $33, $24, $d0, $20, $ad, $8f, $28, $f0  ; 2523: 07 a9 80... ... :23f2[1]
    !byte   5, $a9,   0, $8d, $df,   9, $a2,   1, $ad, $33, $24, $18  ; 252f: 05 a9 00... ... :23fe[1]
    !byte $7d, $50,   9, $9d, $50,   9, $98, $7d, $66,   9, $9d, $66  ; 253b: 7d 50 09... }P. :240a[1]
    !byte   9, $ca, $10, $ec, $ad, $33, $24, $c9, $80, $d0, $0a, $ad  ; 2547: 09 ca 10... ... :2416[1]
    !byte $8f, $28, $f0,   5, $a9,   0, $8d                           ; 2553: 8f 28 f0... .(. :2422[1]
    !text "3$h"                                                       ; 255a: 33 24 68    3$h :2429[1]
    !byte $a8, $68, $aa, $ad                                          ; 255d: a8 68 aa... .h. :242c[1]
    !text "3$`"                                                       ; 2561: 33 24 60    3$` :2430[1]
; $2564 referenced 1 time by $11b4
l2433
    !byte   0, $8a, $48, $bd, $a8,   9, $20, $2c, $13, $86, $80, $84  ; 2564: 00 8a 48... ..H :2433[1]
    !byte $81, $68, $aa, $a0,   0, $b1, $80, $bc, $be,   9, $10,   2  ; 2570: 81 68 aa... .h. :243f[1]
    !byte $49, $ff, $a0,   0,   9,   0, $10,   1, $88, $18, $7d, $50  ; 257c: 49 ff a0... I.. :244b[1]
    !byte   9, $85, $70, $98, $7d, $66,   9, $85, $71, $a0,   2, $b1  ; 2588: 09 85 70... ..p :2457[1]
    !byte $80, $38, $e9,   1, $bc, $be,   9, $30, $0e, $18, $65, $70  ; 2594: 80 38 e9... .8. :2463[1]
    !byte $85, $72, $a9,   0, $65, $71, $85, $73, $4c, $8d, $24, $85  ; 25a0: 85 72 a9... .r. :246f[1]
    !byte $73, $a5, $70, $85, $72, $38, $e5, $73, $85, $70, $a5, $71  ; 25ac: 73 a5 70... s.p :247b[1]
    !byte $85, $73, $e9,   0, $85, $71, $a0,   0, $ad, $d0, $24, $10  ; 25b8: 85 73 e9... .s. :2487[1]
    !byte   1, $88, $18, $65, $70, $85, $70, $85, $78, $98, $65, $71  ; 25c4: 01 88 18... ... :2493[1]
    !byte $85                                                         ; 25d0: 85          .   :249f[1]
    !text "qJfxJfxJfx"                                                ; 25d1: 71 4a 66... qJf :24a0[1]
    !byte $a0,   0, $ad, $d1, $24, $10,   1, $88, $18, $65, $72, $85  ; 25db: a0 00 ad... ... :24aa[1]
    !byte $72, $85, $79, $98, $65, $73, $85                           ; 25e7: 72 85 79... r.y :24b6[1]
    !text "sJfyJfyJfy"                                                ; 25ee: 73 4a 66... sJf :24bd[1]
    !byte $a9,   0, $8d, $d0, $24, $8d, $d1, $24, $60,   0,   0, $8a  ; 25f8: a9 00 8d... ... :24c7[1]
    !byte $48, $bd, $a8,   9, $20, $2c, $13, $86, $80, $84, $81, $68  ; 2604: 48 bd a8... H.. :24d3[1]
    !byte $aa, $a0,   1, $b1, $80, $a0,   0,   9,   0, $10,   1, $88  ; 2610: aa a0 01... ... :24df[1]
    !byte $18, $7d, $7c,   9, $85, $76, $98, $7d, $92,   9, $85, $77  ; 261c: 18 7d 7c... .}| :24eb[1]
    !byte $a0,   3, $b1, $80, $38, $e9,   1, $85, $74, $a5, $76, $38  ; 2628: a0 03 b1... ... :24f7[1]
    !byte $e5, $74, $85, $74, $a5, $77, $e9,   0, $85, $75, $a0,   0  ; 2634: e5 74 85... .t. :2503[1]
    !byte $ad, $50, $25, $10,   1, $88, $18, $65, $74, $85, $74, $85  ; 2640: ad 50 25... .P% :250f[1]
    !byte $7a, $98, $65, $75, $85                                     ; 264c: 7a 98 65... z.e :251b[1]
    !text "uJfzJfzJfz"                                                ; 2651: 75 4a 66... uJf :2520[1]
    !byte $a0,   0, $ad, $51, $25, $10,   1, $88, $18, $65, $76, $85  ; 265b: a0 00 ad... ... :252a[1]
    !byte $76, $85, $7b, $98, $65, $77, $85                           ; 2667: 76 85 7b... v.{ :2536[1]
    !text "wJf{Jf{Jf{"                                                ; 266e: 77 4a 66... wJf :253d[1]
    !byte $a9,   0, $8d, $50, $25, $8d                                ; 2678: a9 00 8d... ... :2547[1]
    !text "Q%`"                                                       ; 267e: 51 25 60    Q%` :254d[1]
    !byte   0,   0, $e0,   0, $f0,   4, $e0, $0b, $d0, $7c, $a5, $52  ; 2681: 00 00 e0... ... :2550[1]
    !byte $f0, $78, $e8, $bd, $a8,   9, $ca,   9,   0, $f0, $6f, $e8  ; 268d: f0 78 e8... .x. :255c[1]
    !byte $a0,   3, $b9, $70,   0, $99, $29,   1, $88, $10, $f7, $a5  ; 2699: a0 03 b9... ... :2568[1]
    !byte $78, $8d, $2d,   1, $a5, $79, $8d, $2e,   1                 ; 26a5: 78 8d 2d... x.- :2574[1]
    !text " 4$"                                                       ; 26ae: 20 34 24     4$ :257d[1]
    !byte $bd, $be,   9, $10, $1f, $a5, $70, $38, $ed, $29,   1, $a5  ; 26b1: bd be 09... ... :2580[1]
    !byte $71, $ed, $2a,   1, $10, $2e, $a5, $70, $8d, $29,   1, $a5  ; 26bd: 71 ed 2a... q.* :258c[1]
    !byte $71, $8d, $2a,   1, $a5, $78, $8d, $2d,   1, $4c, $c0, $25  ; 26c9: 71 8d 2a... q.* :2598[1]
    !byte $ad, $2b,   1, $38, $e5, $72, $ad, $2c,   1, $e5, $73, $10  ; 26d5: ad 2b 01... .+. :25a4[1]
    !byte $0f, $a5, $72, $8d, $2b,   1, $a5, $73, $8d, $2c,   1, $a5  ; 26e1: 0f a5 72... ..r :25b0[1]
    !byte $79, $8d, $2e,   1, $a0,   3, $b9, $29,   1, $99, $70,   0  ; 26ed: 79 8d 2e... y.. :25bc[1]
    !byte $88, $10, $f7, $ad, $2d,   1, $85, $78, $ad, $2e,   1, $85  ; 26f9: 88 10 f7... ... :25c8[1]
    !byte $79, $ca, $a9,   0, $8d, $d0, $24, $8d, $d1, $24, $60, $ad  ; 2705: 79 ca a9... y.. :25d4[1]
    !byte $d0, $24, $48, $ad, $d1                                     ; 2711: d0 24 48... .$H :25e0[1]
    !text "$H 4$h"                                                    ; 2716: 24 48 20... $H  :25e5[1]
    !byte $8d, $d1, $24, $68, $8d, $d0                                ; 271c: 8d d1 24... ..$ :25eb[1]
    !text "$LR%"                                                      ; 2722: 24 4c 52... $LR :25f1[1]
    !byte $85, $53, $aa, $a9,   0, $9d, $d8, $38, $a9, $ff, $85, $44  ; 2726: 85 53 aa... .S. :25f5[1]
    !byte $a9,   1, $8d, $51, $25, $a6, $53, $20, $df, $25, $a5, $53  ; 2732: a9 01 8d... ... :2601[1]
    !byte $18, $69, $0b, $aa, $20, $d2                                ; 273e: 18 69 0b... .i. :260d[1]
    !text "$ Z&"                                                      ; 2744: 24 20 5a... $ Z :2613[1]
    !byte $a5, $7c,   5, $7d, $f0,   9, $a5, $53, $18, $69, $0b, $aa  ; 2748: a5 7c 05... .|. :2617[1]
    !byte $20, $df, $25, $a9,   1, $8d, $51, $25, $a6, $53, $20, $d2  ; 2754: 20 df 25...  .% :2623[1]
    !byte $24, $20, $e5, $26, $20, $1e, $27, $a5, $7c,   5, $7d, $f0  ; 2760: 24 20 e5... $ . :262f[1]
    !byte $13, $a9,   1, $8d, $51, $25, $a6, $53, $20, $df, $25, $20  ; 276c: 13 a9 01... ... :263b[1]
    !byte $d2                                                         ; 2778: d2          .   :2647[1]
    !text "$ Z& "                                                     ; 2779: 24 20 5a... $ Z :2648[1]
    !byte $93, $26, $a5, $53, $d0,   6, $20, $b8                      ; 277e: 93 26 a5... .&. :264d[1]
    !text ". k#`"                                                     ; 2786: 2e 20 6b... . k :2655[1]
    !byte $a9, $ff, $85, $7c, $a6, $78, $a4, $7b, $98, $38, $e5, $7a  ; 278b: a9 ff 85... ... :265a[1]
    !byte $85, $80, $20, $fa, $1e, $c9,   3, $f0,   7, $88, $c6, $80  ; 2797: 85 80 20... ..  :2666[1]
    !byte $10, $f4, $e6, $7c, $a9, $ff, $85, $7d, $a6, $79, $a4, $7b  ; 27a3: 10 f4 e6... ... :2672[1]
    !byte $98, $38, $e5, $7a, $85, $80, $20, $fa, $1e, $c9,   3, $f0  ; 27af: 98 38 e5... .8. :267e[1]
    !byte   7, $88, $c6, $80, $10, $f4, $e6, $7d, $60, $a6, $53, $a5  ; 27bb: 07 88 c6... ... :268a[1]
    !byte $7c, $c5, $7d, $f0, $49, $90, $25, $a5, $70, $29,   7, $85  ; 27c7: 7c c5 7d... |.} :2696[1]
    !byte $80, $a9,   8, $38, $e5, $80, $18, $7d, $50,   9, $9d, $50  ; 27d3: 80 a9 08... ... :26a2[1]
    !byte   9, $a9,   0, $7d, $66,   9, $9d, $66,   9, $bd, $d8, $38  ; 27df: 09 a9 00... ... :26ae[1]
    !byte   9,   1, $9d, $d8, $38, $4c, $e4, $26, $a5, $72, $29,   7  ; 27eb: 09 01 9d... ... :26ba[1]
    !byte $18, $69,   1, $85, $80, $bd, $50,   9, $38, $e5, $80, $9d  ; 27f7: 18 69 01... .i. :26c6[1]
    !byte $50,   9, $bd, $66,   9, $e9,   0, $9d, $66,   9, $bd, $d8  ; 2803: 50 09 bd... P.. :26d2[1]
    !byte $38,   9,   4, $9d, $d8, $38, $60, $a9, $ff, $85, $7e, $a4  ; 280f: 38 09 04... 8.. :26de[1]
    !byte $7a, $a6, $79, $8a, $38, $e5, $78, $85, $80, $20, $fa, $1e  ; 281b: 7a a6 79... z.y :26ea[1]
    !byte $c9,   3, $f0,   7, $ca, $c6, $80, $10, $f4, $e6, $7e, $a9  ; 2827: c9 03 f0... ... :26f6[1]
    !byte $ff, $85, $7f, $a4, $7b, $a6, $79, $8a, $38, $e5, $78, $85  ; 2833: ff 85 7f... ... :2702[1]
    !byte $80, $20, $fa, $1e, $c9,   3, $f0,   7, $ca, $c6, $80, $10  ; 283f: 80 20 fa... . . :270e[1]
    !byte $f4, $e6, $7f, $60, $a6, $53, $a5, $7e, $c5, $7f, $f0, $49  ; 284b: f4 e6 7f... ... :271a[1]
    !byte $90, $25, $a5, $74, $29,   7, $85, $80, $a9,   8, $38, $e5  ; 2857: 90 25 a5... .%. :2726[1]
    !byte $80, $18, $7d, $7c,   9, $9d, $7c,   9, $a9,   0, $7d, $92  ; 2863: 80 18 7d... ..} :2732[1]
    !byte   9, $9d, $92,   9, $bd, $d8, $38,   9,   8, $9d, $d8       ; 286f: 09 9d 92... ... :273e[1]
    !text "8Lo'"                                                      ; 287a: 38 4c 6f... 8Lo :2749[1]
    !byte $a5, $76, $29,   7, $18, $69,   1, $85, $80, $bd, $7c,   9  ; 287e: a5 76 29... .v) :274d[1]
    !byte $38, $e5, $80, $9d, $7c,   9, $bd, $92,   9, $e9,   0, $9d  ; 288a: 38 e5 80... 8.. :2759[1]
    !byte $92,   9, $bd, $d8, $38,   9,   2, $9d, $d8, $38, $60, $85  ; 2896: 92 09 bd... ... :2765[1]
    !byte $53, $8a, $48, $98, $48, $a6, $53, $20, $df, $25, $a9,   2  ; 28a2: 53 8a 48... S.H :2771[1]
    !byte $8d                                                         ; 28ae: 8d          .   :277d[1]
    !text "Q% "                                                       ; 28af: 51 25 20    Q%  :277e[1]
    !byte $d2, $24, $a9, $ff, $85, $44, $20, $e5, $26, $a9,   0, $8d  ; 28b2: d2 24 a9... .$. :2781[1]
    !byte $90, $28, $8d, $91, $28, $a5, $7f, $8d, $8f, $28, $d0,   3  ; 28be: 90 28 8d... .(. :278d[1]
    !text "LQ("                                                       ; 28ca: 4c 51 28    LQ( :2799[1]
    !byte $a5, $78, $8d, $21,   1, $a5, $79, $8d, $22,   1, $a6       ; 28cd: a5 78 8d... .x. :279c[1]
    !text "S 4$"                                                      ; 28d8: 53 20 34... S 4 :27a7[1]
    !byte $a5, $72, $18, $69,   1, $85, $72, $a5, $73, $69,   0, $85  ; 28dc: a5 72 18... .r. :27ab[1]
    !byte $73, $a5, $70, $18, $65, $72, $8d, $92, $28, $a5            ; 28e8: 73 a5 70... s.p :27b7[1]
    !text "qes"                                                       ; 28f2: 71 65 73    qes :27c1[1]
    !byte $8d, $93, $28, $ad, $21,   1, $85, $78, $ad, $22,   1, $85  ; 28f5: 8d 93 28... ..( :27c4[1]
    !byte $79, $a4, $7b,   6                                          ; 2901: 79 a4 7b... y.{ :27d0[1]
    !text "p&q"                                                       ; 2905: 70 26 71    p&q :27d4[1]
    !byte $ad, $92, $28, $18, $65, $70, $85, $7a, $ad, $93            ; 2908: ad 92 28... ..( :27d7[1]
    !text "(eqJfzJfz"                                                 ; 2912: 28 65 71... (eq :27e1[1]
    !byte $aa, $a5, $7a, $e9,   0, $85, $7a, $8a, $e9,   0            ; 291b: aa a5 7a... ..z :27ea[1]
    !text " Y("                                                       ; 2925: 20 59 28     Y( :27f4[1]
    !byte $d0,   5, $ce, $90, $28, $d0, $1f,   6                      ; 2928: d0 05 ce... ... :27f7[1]
    !text "r&s"                                                       ; 2930: 72 26 73    r&s :27ff[1]
    !byte $ad, $92, $28, $18, $65, $72, $85, $7a, $ad, $93            ; 2933: ad 92 28... ..( :2802[1]
    !text "(esJfzJfz m("                                              ; 293d: 28 65 73... (es :280c[1]
    !byte $d0, $37, $ee, $90, $28, $a5, $53, $f0,   4, $c9, $0b, $d0  ; 2949: d0 37 ee... .7. :2818[1]
    !byte $2c, $4e, $93, $28, $6e, $92, $28, $ad, $92, $28, $e9,   0  ; 2955: 2c 4e 93... ,N. :2824[1]
    !byte $85, $7a, $ad, $93, $28, $e9,   0                           ; 2961: 85 7a ad... .z. :2830[1]
    !text " Y("                                                       ; 2968: 20 59 28     Y( :2837[1]
    !byte $d0,   5, $ce, $91, $28, $d0, $10, $ad, $92, $28, $85, $7a  ; 296b: d0 05 ce... ... :283a[1]
    !byte $ad, $93                                                    ; 2977: ad 93       ..  :2846[1]
    !text "( m("                                                      ; 2979: 28 20 6d... ( m :2848[1]
    !byte $d0,   3, $ee, $91, $28, $68, $a8, $68, $aa, $ad, $8f       ; 297d: d0 03 ee... ... :284c[1]
    !text "(`JfzJfzJfz"                                               ; 2988: 28 60 4a... (`J :2857[1]
    !byte $a6, $7a, $8a, $38, $e5, $78, $85, $80                      ; 2993: a6 7a 8a... .z. :2862[1]
    !text "L~(JfzJfzJfz"                                              ; 299b: 4c 7e 28... L~( :286a[1]
    !byte $a6, $79, $8a, $38, $e5, $7a, $85, $80, $20, $fa, $1e, $c9  ; 29a7: a6 79 8a... .y. :2876[1]
    !byte   3, $f0,   7, $ca, $c6, $80, $10, $f4, $a9,   0,   9,   0  ; 29b3: 03 f0 07... ... :2882[1]
    !byte $60,   0,   0,   0,   0,   0, $8d, $5b, $29, $8a, $48, $98  ; 29bf: 60 00 00... `.. :288e[1]
    !byte $48, $ae                                                    ; 29cb: 48 ae       H.  :289a[1]
    !text "[) "                                                       ; 29cd: 5b 29 20    [)  :289c[1]
    !byte $df, $25, $20, $d2, $24, $ad, $e1, $28, $85                 ; 29d0: df 25 20... .%  :289f[1]
    !text "D Z& "                                                     ; 29d9: 44 20 5a... D Z :28a8[1]
    !byte $e5, $26, $a5, $7c, $29,   1, $8d, $5b, $29, $a5, $7d, $29  ; 29de: e5 26 a5... .&. :28ad[1]
    !byte   4, $0d, $5b, $29, $8d, $5b, $29, $a5, $7e, $29,   8, $0d  ; 29ea: 04 0d 5b... ..[ :28b9[1]
    !byte $5b, $29, $8d, $5b, $29, $a5, $7f, $29,   2, $0d, $5b, $29  ; 29f6: 5b 29 8d... [). :28c5[1]
    !byte $8d, $5b, $29, $a9,   0, $8d, $e1, $28, $68, $a8, $68, $aa  ; 2a02: 8d 5b 29... .[) :28d1[1]
    !byte $ad                                                         ; 2a0e: ad          .   :28dd[1]
    !text "[)`"                                                       ; 2a0f: 5b 29 60    [)` :28de[1]
    !byte   0, $8a, $48, $98, $48, $a9,   0, $8d, $5b, $29, $bd, $a8  ; 2a12: 00 8a 48... ..H :28e1[1]
    !byte   9, $f0, $55, $b9, $a8,   9, $f0, $50, $20, $df, $25, $20  ; 2a1e: 09 f0 55... ..U :28ed[1]
    !byte $d2, $24, $a2,   7, $b5, $70, $9d, $21,   1, $ca, $10, $f8  ; 2a2a: d2 24 a2... .$. :28f9[1]
    !byte $68, $48, $aa, $20, $df, $25, $20, $d2, $24, $ad, $23,   1  ; 2a36: 68 48 aa... hH. :2905[1]
    !byte $38, $e5, $70, $ad, $24,   1, $e5                           ; 2a42: 38 e5 70... 8.p :2911[1]
    !text "q0*"                                                       ; 2a49: 71 30 2a    q0* :2918[1]
    !byte $a5, $72, $38, $ed, $21,   1, $a5, $73, $ed, $22,   1, $30  ; 2a4c: a5 72 38... .r8 :291b[1]
    !byte $1d, $ad, $27,   1, $38, $e5, $74, $ad, $28,   1, $e5, $75  ; 2a58: 1d ad 27... ..' :2927[1]
    !byte $30, $10, $a5, $76, $38, $ed, $25,   1, $a5, $77, $ed, $26  ; 2a64: 30 10 a5... 0.. :2933[1]
    !byte   1, $30,   3, $ce, $5b, $29, $a9,   0, $8d, $50, $25, $8d  ; 2a70: 01 30 03... .0. :293f[1]
    !byte $51, $25, $8d, $d1, $24, $8d, $d0, $24, $68, $a8, $68, $aa  ; 2a7c: 51 25 8d... Q%. :294b[1]
    !byte $ad                                                         ; 2a88: ad          .   :2957[1]
    !text "[)`"                                                       ; 2a89: 5b 29 60    [)` :2958[1]
    !byte 0                                                           ; 2a8c: 00          .   :295b[1]
; $2a8d referenced 6 times by $2988, $29aa, $29cb, $2bc6, $2bd8, $2c23
l295c
    !byte 3, 2, 8, 7, 0, 5, 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0           ; 2a8d: 03 02 08... ... :295c[1]
; $2a9e referenced 1 time by $2998
l296d
    !byte 5                                                           ; 2a9e: 05          .   :296d[1]
; $2a9f referenced 2 times by $2982, $2bc3
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

; $2ad2 referenced 2 times by $1203, $123f
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

; $2b0f referenced 1 time by $29a4
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

    !byte $ae,   4, $11, $ac,   5, $11, $20, $91, $17, $20, $a1, $29  ; 2b69: ae 04 11... ... :2a38[1]
    !byte $20, $8f, $3a, $a5, $5b, $f0, $15, $ad,   3, $11, $29,   1  ; 2b75: 20 8f 3a...  .: :2a44[1]
    !byte $f0, $0e, $a2, $8f, $20, $cc, $3a, $f0,   7                 ; 2b81: f0 0e a2... ... :2a50[1]
    !text "hhhhL9"                                                    ; 2b8a: 68 68 68... hhh :2a59[1]
    !byte $18, $a5, $29, $85                                          ; 2b90: 18 a5 29... ..) :2a5f[1]
    !text "% g,"                                                      ; 2b94: 25 20 67... % g :2a63[1]
    !byte $a5, $29, $c5, $25, $f0,   6, $20, $53,   4, $4c, $81, $2a  ; 2b98: a5 29 c5... .). :2a67[1]
    !byte $ad, $a0, $3a, $f0,   9, $20, $db                           ; 2ba4: ad a0 3a... ..: :2a73[1]
    !text "* 7+ e+"                                                   ; 2bab: 2a 20 37... * 7 :2a7a[1]
    !byte $a5, $29, $cd, $6d, $29, $b0, $45, $a5, $25, $cd, $6d, $29  ; 2bb2: a5 29 cd... .). :2a81[1]
    !byte $90, $11, $a9, $0f, $a2,   0, $20, $f4, $ff, $a2,   3, $a9  ; 2bbe: 90 11 a9... ... :2a8d[1]
    !byte   0, $9d, $6f, $39, $ca, $10, $fa, $20,   0,   4            ; 2bca: 00 9d 6f... ..o :2a99[1]
    !text " d6 K4"                                                    ; 2bd4: 20 64 36...  d6 :2aa3[1]
    !byte $ad,   3, $11, $29,   1, $f0,   7, $a2, $ff, $20, $cc, $3a  ; 2bda: ad 03 11... ... :2aa9[1]
    !byte $d0,   6, $20, $8c, $17                                     ; 2be6: d0 06 20... ..  :2ab5[1]
    !text "L8* "                                                      ; 2beb: 4c 38 2a... L8* :2aba[1]
    !byte $a2, $3a, $a2, $80, $a0,   0, $88, $d0, $fd, $ca, $d0, $fa  ; 2bef: a2 3a a2... .:. :2abe[1]
    !byte $4c, $da, $2a, $a5, $25, $cd, $6d, $29, $b0,   6, $20, $a2  ; 2bfb: 4c da 2a... L.* :2aca[1]
    !byte $3a, $20, $12, $3a, $60, $a6, $29, $ec, $6d, $29, $b0, $13  ; 2c07: 3a 20 12... : . :2ad6[1]
    !byte $bd, $5c, $29, $c9,   7, $f0, $0d, $c9,   8, $f0, $0c, $c9  ; 2c13: bd 5c 29... .\) :2ae2[1]
    !byte   2, $f0, $0e, $c9,   3, $f0,   7                           ; 2c1f: 02 f0 0e... ... :2aee[1]
    !text "`L~7L66L"                                                  ; 2c26: 60 4c 7e... `L~ :2af5[1]
    !byte 4                                                           ; 2c2e: 04          .   :2afd[1]
    !text "4 F,"                                                      ; 2c2f: 34 20 46... 4 F :2afe[1]
    !byte $ad                                                         ; 2c33: ad          .   :2b02[1]
    !text "f9H"                                                       ; 2c34: 66 39 48    f9H :2b03[1]
    !byte $a9, $ff, $8d, $66, $39, $a9,   0, $a2, $a4, $a0, $38, $20  ; 2c37: a9 ff 8d... ... :2b06[1]
    !byte $f6                                                         ; 2c43: f6          .   :2b12[1]
    !text "8hI"                                                       ; 2c44: 38 68 49    8hI :2b13[1]
    !byte $ff, $8d, $66, $39, $a9, $1f, $85, $16, $a5, $4c, $48, $a9  ; 2c47: ff 8d 66... ..f :2b16[1]
    !byte $58, $85, $4c, $a9,   0, $ae, $66, $39, $d0,   2, $a9,   2  ; 2c53: 58 85 4c... X.L :2b22[1]
    !byte $85, $15, $20, $8d, $13, $68, $85, $4c, $60, $a6, $29, $ec  ; 2c5f: 85 15 20... ..  :2b2e[1]
    !byte $6d, $29, $90, $26, $ec, $6e, $29, $b0, $21, $a5, $48, $c5  ; 2c6b: 6d 29 90... m). :2b3a[1]
    !byte $4d, $d0, $1b, $ad, $df,   9, $f0, $16, $a9,   0, $85, $52  ; 2c77: 4d d0 1b... M.. :2b46[1]
    !byte $bd, $5c, $29, $c5, $48, $f0, $0b, $20, $8c, $2c, $90,   6  ; 2c83: bd 5c 29... .\) :2b52[1]
    !byte $20, $31,   1                                               ; 2c8f: 20 31 01     1. :2b5e[1]
    !text " 7#`"                                                      ; 2c92: 20 37 23...  7# :2b61[1]
    !byte $a6, $29, $ec, $6e, $29, $90, $1a, $a5, $48, $c9,   4, $d0  ; 2c96: a6 29 ec... .). :2b65[1]
    !byte $14, $c5, $4d, $d0, $10, $ad, $df,   9, $f0, $0b, $bd, $5c  ; 2ca2: 14 c5 4d... ..M :2b71[1]
    !byte $29, $c5, $52, $d0,   2, $a9,   0, $85, $52, $60, $85, $70  ; 2cae: 29 c5 52... ).R :2b7d[1]
    !byte $a9,   0, $85, $71, $ae, $6d, $29, $bd, $5c, $29, $c5, $70  ; 2cba: a9 00 85... ... :2b89[1]
    !byte $f0, $23, $e8, $ec, $6e, $29, $90, $f3, $a2, $10, $bd, $5c  ; 2cc6: f0 23 e8... .#. :2b95[1]
    !byte $29, $d0, $16, $bd, $5b, $29, $9d, $5c, $29, $ca, $ec, $6e  ; 2cd2: 29 d0 16... ).. :2ba1[1]
    !byte $29, $b0, $f4, $ee, $6e, $29, $a5, $70, $9d, $5c, $29, $c6  ; 2cde: 29 b0 f4... ).. :2bad[1]
    !byte $71, $a5, $71, $60                                          ; 2cea: 71 a5 71... q.q :2bb9[1]

; $2cee referenced 1 time by $1231
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

    !byte $85, $70, $a9,   0, $85, $71, $ae, $6e, $29, $bd, $5c, $29  ; 2d11: 85 70 a9... .p. :2be0[1]
    !byte $c5, $70, $f0,   7, $e8, $e0, $11, $90, $f4, $b0, $12, $bd  ; 2d1d: c5 70 f0... .p. :2bec[1]
    !byte $5d, $29, $9d, $5c, $29, $e8, $e0, $10, $90, $f5, $a9,   0  ; 2d29: 5d 29 9d... ]). :2bf8[1]
    !byte $9d, $5c, $29, $c6, $71, $a5, $71, $60                      ; 2d35: 9d 5c 29... .\) :2c04[1]

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

; $2d77 referenced 3 times by $29f6, $2a22, $2c18
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

    !byte $a6, $29, $ad, $a1, $3a, $f0, $1a, $30, $0e, $e8, $e0, $11  ; 2d98: a6 29 ad... .). :2c67[1]
    !byte $b0, $13, $bd, $5c, $29, $f0, $f6, $86, $29, $d0, $0a, $ca  ; 2da4: b0 13 bd... ... :2c73[1]
    !byte $30,   7, $bd, $5c, $29, $f0, $f8, $86, $29, $20, $de       ; 2db0: 30 07 bd... 0.. :2c7f[1]
    !text ")`H"                                                       ; 2dbb: 29 60 48    )`H :2c8a[1]
    !byte $ad, $ec,   9, $18, $6d, $ed,   9, $c9, $50, $18, $f0, $3c  ; 2dbe: ad ec 09... ... :2c8d[1]
    !byte $ce, $ec,   9, $ad, $ec,   9, $c9, $30, $b0, $31, $a9, $39  ; 2dca: ce ec 09... ... :2c99[1]
    !byte $8d, $ec,   9, $ce, $ed,   9, $ad, $ed,   9, $c9, $30, $f0  ; 2dd6: 8d ec 09... ... :2ca5[1]
    !byte $18, $b0, $20, $a9, $39, $8d, $ed,   9, $ce, $ee,   9, $ad  ; 2de2: 18 b0 20... ..  :2cb1[1]
    !byte $ee,   9, $c9, $30, $d0, $11, $a9, $20, $8d, $ee,   9, $d0  ; 2dee: ee 09 c9... ... :2cbd[1]
    !byte $0a, $ad, $ee,   9, $c9, $20, $d0,   3, $8d, $ed,   9       ; 2dfa: 0a ad ee... ... :2cc9[1]
    !text "8h`0"                                                      ; 2e05: 38 68 60... 8h` :2cd4[1]
    !byte   2, $f8, $31,   4, $f7, $32,   2, $f8, $33,   0, $f7, $34  ; 2e09: 02 f8 31... ..1 :2cd8[1]
    !byte   3, $f5, $36,   2, $f7, $35,   4, $f6,   0,   0,   0,   0  ; 2e15: 03 f5 36... ..6 :2ce4[1]
    !byte $39,   0,   0, $39,   0,   0, $38,   0,   0, $38,   0,   0  ; 2e21: 39 00 00... 9.. :2cf0[1]
    !byte $34,   0,   0, $34,   0,   0,   0, $34,   0,   0, $34,   0  ; 2e2d: 34 00 00... 4.. :2cfc[1]
    !byte   0, $38,   0,   0, $38,   0,   0, $39,   0,   0, $39,   0  ; 2e39: 00 38 00... .8. :2d08[1]
    !byte   0,   0, $30,   4,   0, $31,   4,   0, $32,   4,   0, $33  ; 2e45: 00 00 30... ..0 :2d14[1]
    !byte   4,   0,   0, $33,   0,   0, $33,   2,   0,   0, $36,   4  ; 2e51: 04 00 00... ... :2d20[1]
    !byte   0,   0, $36,   0,   0,   0, $35,   0,   0,   0, $34,   6  ; 2e5d: 00 00 36... ..6 :2d2c[1]
    !byte $fc, $34,   6, $fd, $34,   5, $fe, $34,   5, $ff, $34,   4  ; 2e69: fc 34 06... .4. :2d38[1]
    !byte   0,   0, $34,   4,   1, $34,   3,   2, $34,   3,   3, $34  ; 2e75: 00 00 34... ..4 :2d44[1]
    !byte   2,   4, $34,   2,   5, $34,   1,   6,   0, $34,   4,   2  ; 2e81: 02 04 34... ..4 :2d50[1]
    !byte $34,   3,   3, $34,   2,   4, $34,   1,   5,   0, $34, $fc  ; 2e8d: 34 03 03... 4.. :2d5c[1]
    !byte   2, $34, $fd,   3, $34, $fe,   4, $34, $ff,   5,   0, $34  ; 2e99: 02 34 fd... .4. :2d68[1]
    !byte   0,   1, $34,   0,   2, $34,   0,   3, $34,   0,   4, $34  ; 2ea5: 00 01 34... ..4 :2d74[1]
    !byte   0,   5,   0, $34,   0,   7,   0, $a9, $16, $8d, $ed, $22  ; 2eb1: 00 05 00... ... :2d80[1]
    !byte $a2, $ed, $a0, $2c, $a9,   3, $20, $ee, $22, $d0, $29, $c0  ; 2ebd: a2 ed a0... ... :2d8c[1]
    !byte $39, $d0, $0b, $ad, $be,   9, $49, $fe, $8d, $be,   9       ; 2ec9: 39 d0 0b... 9.. :2d98[1]
    !text "L_. "                                                      ; 2ed4: 4c 5f 2e... L_. :2da3[1]
    !byte $c4, $23, $d0, $39, $ad, $df,   9, $c9, $49, $d0, $18, $ce  ; 2ed8: c4 23 d0... .#. :2da7[1]
    !byte $50, $25, $a9,   0, $20, $94, $28, $d0,   7, $c0, $49, $f0  ; 2ee4: 50 25 a9... P%. :2db3[1]
    !byte   3                                                         ; 2ef0: 03          .   :2dbf[1]
    !text "L_."                                                       ; 2ef1: 4c 5f 2e    L_. :2dc0[1]
    !byte $a9, $96, $8d, $df,   9, $a0, $59, $ad, $8f, $28, $d0, $24  ; 2ef4: a9 96 8d... ... :2dc3[1]
    !byte $ad, $df,   9, $c9, $96, $d0, $0e, $a9,   4,   9,   1, $2d  ; 2f00: ad df 09... ... :2dcf[1]
    !byte $d8, $38, $f0,   5, $a9, $80, $8d, $33, $24, $a9, $96, $cd  ; 2f0c: d8 38 f0... .8. :2ddb[1]
    !byte $df,   9, $f0, $d5, $8d, $df,   9, $a0, $86                 ; 2f18: df 09 f0... ... :2de7[1]
    !text "L_."                                                       ; 2f21: 4c 5f 2e    L_. :2df0[1]
    !byte $ae, $c9, $3a, $f0, $23, $a9, $36, $ec, $be,   9, $d0, $10  ; 2f24: ae c9 3a... ..: :2df3[1]
    !byte $a9, $29, $ae, $c7, $3a, $f0,   9, $ae, $df,   9, $e0, $96  ; 2f30: a9 29 ae... .). :2dff[1]
    !byte $f0,   2, $a9, $49, $cd, $df,   9, $f0, $30, $8d, $df,   9  ; 2f3c: f0 02 a9... ... :2e0b[1]
    !byte $a8                                                         ; 2f48: a8          .   :2e17[1]
    !text "LD."                                                       ; 2f49: 4c 44 2e    LD. :2e18[1]
    !byte $ad, $df,   9, $a0, $41, $8c, $df,   9, $c9, $29, $f0, $1b  ; 2f4c: ad df 09... ... :2e1b[1]
    !byte $c9, $36, $f0, $17, $ad, $c7, $3a, $f0, $14, $a5, $52, $f0  ; 2f58: c9 36 f0... .6. :2e27[1]
    !byte $10, $a0, $45, $c9, $21, $d0, $0a, $a9,   0                 ; 2f64: 10 a0 45... ..E :2e33[1]
    !text " 7#L"                                                      ; 2f6d: 20 37 23...  7# :2e3c[1]
    !byte $87, $2d, $a0, $3d, $a2,   0, $ad, $c9, $3a, $f0,   1, $e8  ; 2f71: 87 2d a0... .-. :2e40[1]
    !byte $bd, $90, $28, $f0, $0e, $a0, $96, $8c, $df,   9, $a0, $6c  ; 2f7d: bd 90 28... ..( :2e4c[1]
    !byte $cd, $be,   9, $f0,   2, $a0, $79, $8c, $d4,   9, $a9,   0  ; 2f89: cd be 09... ... :2e58[1]
    !byte $8d, $b5, $2e, $a5, $52, $f0, $17, $ac, $d4,   9, $b9, $ed  ; 2f95: 8d b5 2e... ... :2e64[1]
    !byte $2c, $8d, $a8,   9, $20, $b8, $2e, $a9,   0, $20, $f5, $25  ; 2fa1: 2c 8d a8... ,.. :2e70[1]
    !byte $ad, $d8, $38, $8d, $b5, $2e, $ad, $d4,   9, $a2, $ed, $a0  ; 2fad: ad d8 38... ..8 :2e7c[1]
    !byte $2c, $20,   0, $22, $20, $b8, $2e, $a9,   0, $20, $f5, $25  ; 2fb9: 2c 20 00... , . :2e88[1]
    !byte $ad, $d8, $38, $0d, $b5, $2e, $8d, $d8, $38, $ad, $b6, $2e  ; 2fc5: ad d8 38... ..8 :2e94[1]
    !byte $8d, $b7, $2e, $a2,   0, $ad, $a8,   9, $c9, $35, $d0,   5  ; 2fd1: 8d b7 2e... ... :2ea0[1]
    !byte $a5, $52, $f0,   1, $aa, $8e, $b6, $2e, $60,   0            ; 2fdd: a5 52 f0... .R. :2eac[1]
; $2fe7 referenced 1 time by $11c0
l2eb6
    !byte 0                                                           ; 2fe7: 00          .   :2eb6[1]
; $2fe8 referenced 1 time by $11c3
l2eb7
    !byte   0, $a6, $52, $f0, $28, $a2, $d7, $a0, $2c, $a9,   0       ; 2fe8: 00 a6 52... ..R :2eb7[1]
    !text " H", '"'                                                   ; 2ff3: 20 48 22     H" :2ec2[1]
    !byte $a5, $52, $a0,   0, $d9, $e8, $2e, $f0,   9, $c8, $c0,   4  ; 2ff6: a5 52 a0... .R. :2ec5[1]
    !byte $90, $f6, $a2,   0, $f0, $0d, $be, $f2, $2e, $ad, $a8,   9  ; 3002: 90 f6 a2... ... :2ed1[1]
    !byte $c9, $35, $f0,   3, $be, $ed, $2e, $8e, $a9,   9, $60,   0  ; 300e: c9 35 f0... .5. :2edd[1]
; $301a referenced 1 time by $2992
l2ee9
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 301a: 00 00 00... ... :2ee9[1]
    !byte   0,   0, $12, $13, $14, $15, $16, $17, $18, $19,   0, $0c  ; 3026: 00 00 12... ... :2ef5[1]
    !byte $f9, $f6, $0d, $f9, $f5, $0e, $f9, $f6, $0f, $f9, $f5, $0f  ; 3032: f9 f6 0d... ... :2f01[1]
    !byte $f9, $f5, $1c, $f9, $f5, $1a, $f9, $f6,   0,   0,   0,   0  ; 303e: f9 f5 1c... ... :2f0d[1]
    !byte $11,   0,   0, $11,   0,   0, $10,   0,   0, $10,   0,   0  ; 304a: 11 00 00... ... :2f19[1]
    !byte $0f,   0,   0, $0f,   0,   0,   0, $0f,   0,   0, $0f,   0  ; 3056: 0f 00 00... ... :2f25[1]
    !byte   0, $10,   0,   0, $10,   0,   0, $11,   0,   0, $11,   0  ; 3062: 00 10 00... ... :2f31[1]
    !byte   0,   0, $0c,   4,   0, $0d,   4,   0, $0e,   4,   0, $0f  ; 306e: 00 00 0c... ... :2f3d[1]
    !byte   4,   0,   0, $0f,   0,   0, $0f,   2,   0,   0, $1c,   4  ; 307a: 04 00 00... ... :2f49[1]
    !byte   0,   0, $1c,   0,   0,   0, $1a,   6, $fb, $1a,   6, $fc  ; 3086: 00 00 1c... ... :2f55[1]
    !byte $1a,   5, $fc, $1a,   5, $fd, $1a,   5, $fe, $1a,   5, $ff  ; 3092: 1a 05 fc... ... :2f61[1]
    !byte   0, $1a,   5,   0, $1a,   5,   0,   0, $0f,   5,   1, $0f  ; 309e: 00 1a 05... ... :2f6d[1]
    !byte   5,   2, $0f,   4,   3, $0f,   4,   4, $0f,   4,   4, $0f  ; 30aa: 05 02 0f... ... :2f79[1]
    !byte   4,   5, $0f,   3,   5, $0f,   3,   5, $0f,   2,   6, $0f  ; 30b6: 04 05 0f... ... :2f85[1]
    !byte   2,   6, $0f,   1,   6, $0f,   1,   6,   0, $0f,   4,   2  ; 30c2: 02 06 0f... ... :2f91[1]
    !byte $0f,   3,   3, $0f,   2,   4, $0f,   1,   5,   0, $0f, $fc  ; 30ce: 0f 03 03... ... :2f9d[1]
    !byte   2, $0f, $fd,   3, $0f, $fe,   4, $0f, $ff,   5,   0, $0f  ; 30da: 02 0f fd... ... :2fa9[1]
    !byte   0,   1, $0f,   0,   2, $0f,   0,   3, $0f,   0,   4, $0f  ; 30e6: 00 01 0f... ... :2fb5[1]
    !byte   0,   5,   0, $0f,   0,   7,   0, $a9, $16, $8d, $ed, $22  ; 30f2: 00 05 00... ... :2fc1[1]
    !byte $a2, $16, $a0, $2f, $a9,   3, $20, $ee, $22, $d0, $36, $c0  ; 30fe: a2 16 a0... ... :2fcd[1]
    !byte $39, $d0, $0b, $ad, $be,   9, $49, $fe, $8d, $be,   9, $4c  ; 310a: 39 d0 0b... 9.. :2fd9[1]
    !byte $a5, $30, $20, $c4, $23, $d0, $58, $ad, $df,   9, $c9, $45  ; 3116: a5 30 20... .0  :2fe5[1]
    !byte $d0, $1e, $ce, $50, $25, $a9,   0, $20, $94, $28, $d0, $26  ; 3122: d0 1e ce... ... :2ff1[1]
    !byte $c0, $45, $d0, $0d, $ad, $c9, $3a, $cd, $be,   9, $d0, $1a  ; 312e: c0 45 d0... .E. :2ffd[1]
    !byte $a0, $58, $8c, $df,   9, $4c, $a5, $30, $c9, $58, $d0, $15  ; 313a: a0 58 8c... .X. :3009[1]
    !byte $ce, $50, $25, $a9,   0, $20, $94, $28, $d0,   4, $c0, $58  ; 3146: ce 50 25... .P% :3015[1]
    !byte $d0, $eb, $a9, $ae, $8d, $df,   9, $a0, $5f, $ad, $8f, $28  ; 3152: d0 eb a9... ... :3021[1]
    !byte $d0, $24, $ad, $df,   9, $c9, $ae, $d0, $0e, $a9,   4,   9  ; 315e: d0 24 ad... .$. :302d[1]
    !byte   1, $2d, $d8, $38, $f0,   5, $a9, $80, $8d, $33, $24, $a9  ; 316a: 01 2d d8... .-. :3039[1]
    !byte $ae, $cd, $df,   9, $f0, $c3, $8d, $df,   9, $a0, $9e, $4c  ; 3176: ae cd df... ... :3045[1]
    !byte $a5, $30, $ae, $c9, $3a, $f0, $1c, $a9, $36, $ec, $be,   9  ; 3182: a5 30 ae... .0. :3051[1]
    !byte $d0,   9, $a9, $29, $ae, $c7, $3a, $f0,   2, $a9, $45, $cd  ; 318e: d0 09 a9... ... :305d[1]
    !byte $df,   9, $f0, $1d, $8d, $df,   9, $a8, $4c, $8a, $30, $ad  ; 319a: df 09 f0... ... :3069[1]
    !byte $df,   9, $c9, $41, $f0, $0f, $a0, $41, $8c, $df,   9, $c9  ; 31a6: df 09 c9... ... :3075[1]
    !byte $29, $f0,   4, $c9, $36, $d0,   2, $a0, $3d, $a2,   0, $ad  ; 31b2: 29 f0 04... ).. :3081[1]
    !byte $c9, $3a, $f0,   1, $e8, $bd, $90, $28, $f0, $0e, $a0, $ae  ; 31be: c9 3a f0... .:. :308d[1]
    !byte $8c, $df,   9, $a0, $84, $cd, $be,   9, $f0,   2, $a0, $91  ; 31ca: 8c df 09... ... :3099[1]
    !byte $8c, $d4,   9, $98, $a2, $16, $a0, $2f, $20,   0, $22, $a9  ; 31d6: 8c d4 09... ... :30a5[1]
    !byte   0, $20, $f5, $25, $a9, $f7, $85, $70, $a9, $2e, $85, $71  ; 31e2: 00 20 f5... . . :30b1[1]
    !byte $a9, $ff, $ae, $df,   9, $e0,   0, $f0,   4, $e0, $16, $d0  ; 31ee: a9 ff ae... ... :30bd[1]
    !byte $0b, $a9,   0, $ae, $a8,   9, $e0, $0f, $d0,   2, $a9, $81  ; 31fa: 0b a9 00... ... :30c9[1]
    !byte $a2,   0, $a0                                               ; 3206: a2 00 a0    ... :30d5[1]
    !text "/ H", '"', "`FGHIJKLM"                                     ; 3209: 2f 20 48... / H :30d8[1]
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
; $3308 referenced 1 time by $120e
l31d7
    !byte   0, $a9, $16, $8d, $ed, $22, $a2, $ff, $a0, $30, $a9,   3  ; 3308: 00 a9 16... ... :31d7[1]
    !byte $20, $ee, $22, $d0, $0c, $c0, $39, $d0, $0b, $ad, $be,   9  ; 3314: 20 ee 22...  ." :31e3[1]
    !byte $49, $fe, $8d, $be,   9                                     ; 3320: 49 fe 8d... I.. :31ef[1]
    !text "L13 "                                                      ; 3325: 4c 31 33... L13 :31f4[1]
    !byte $c4, $23, $f0,   3, $4c, $b1, $32, $ad, $df,   9, $c9, $51  ; 3329: c4 23 f0... .#. :31f8[1]
    !byte $f0, $1c, $c9, $49, $f0, $18, $c9, $45, $f0, $14, $ad, $c7  ; 3335: f0 1c c9... ... :3204[1]
    !byte $3a, $f0                                                    ; 3341: 3a f0       :.  :3210[1]
    !text "c n3"                                                      ; 3343: 63 20 6e... c n :3212[1]
    !byte $f0, $5e, $a9, $51, $8d, $df,   9, $a0                      ; 3347: f0 5e a9... .^. :3216[1]
    !text "ML13"                                                      ; 334f: 4d 4c 31... ML1 :321e[1]
    !byte $a2, $d4                                                    ; 3353: a2 d4       ..  :3222[1]
    !text " n3"                                                       ; 3355: 20 6e 33     n3 :3224[1]
    !byte $f0, $36, $ad, $c7, $3a, $f0, $1e, $ce, $50, $25, $a9,   0  ; 3358: f0 36 ad... .6. :3227[1]
    !byte $20, $94, $28, $d0, $0f, $a2, $51, $ad, $d7, $31, $d0,   8  ; 3364: 20 94 28...  .( :3233[1]
    !byte $ad, $ca, $3a, $0d, $cb, $3a, $f0, $22, $a2                 ; 3370: ad ca 3a... ..: :323f[1]
    !text "ELi2"                                                      ; 3379: 45 4c 69... ELi :3248[1]
    !byte $a2, $58, $ad, $c9, $3a, $cd, $be,   9, $f0,   9, $a2, $49  ; 337d: a2 58 ad... .X. :324c[1]
    !byte $ad, $8f, $28, $f0, $0c, $d0, $17, $a9, $d4, $8d, $df,   9  ; 3389: ad 8f 28... ..( :3258[1]
    !byte $8a, $a8                                                    ; 3395: 8a a8       ..  :3264[1]
    !text "Lv2"                                                       ; 3397: 4c 76 32    Lv2 :3266[1]
    !byte $ec, $df,   9, $f0,   5, $8a, $a8, $8c, $df,   9            ; 339a: ec df 09... ... :3269[1]
    !text "L13"                                                       ; 33a4: 4c 31 33    L13 :3273[1]
    !byte $ad, $df,   9, $c9, $7a, $d0, $10, $ce, $50, $25, $a9,   0  ; 33a7: ad df 09... ... :3276[1]
    !byte $20, $94, $28, $d0, $25, $c0, $7a, $f0, $21, $d0, $e6, $ad  ; 33b3: 20 94 28...  .( :3282[1]
    !byte $df,   9, $c9, $87, $d0, $18, $ce, $50, $25, $a9,   0, $20  ; 33bf: df 09 c9... ... :328e[1]
    !byte $94, $28, $d0,   7, $c0, $87, $f0,   3                      ; 33cb: 94 28 d0... .(. :329a[1]
    !text "L13"                                                       ; 33d3: 4c 31 33    L13 :32a2[1]
    !byte $a9, $d4, $8d, $df,   9, $a0, $97, $ad, $8f, $28, $d0, $17  ; 33d6: a9 d4 8d... ... :32a5[1]
    !byte $a9, $d4, $cd, $df,   9, $f0, $bb, $ae, $df,   9, $8d, $df  ; 33e2: a9 d4 cd... ... :32b1[1]
    !byte   9, $a0, $c4, $e0, $49, $d0, $af, $a8                      ; 33ee: 09 a0 c4... ... :32bd[1]
    !text "L13"                                                       ; 33f6: 4c 31 33    L13 :32c5[1]
    !byte $ae, $c9, $3a, $d0, $11, $ad, $c7, $3a, $f0, $2f, $ad, $df  ; 33f9: ae c9 3a... ..: :32c8[1]
    !byte   9, $c9, $d4, $f0, $28, $a9, $7a, $4c, $f5, $32, $a9, $36  ; 3405: 09 c9 d4... ... :32d4[1]
    !byte $ec, $be,   9, $d0, $10, $a9, $29, $ae, $c7, $3a, $f0,   9  ; 3411: ec be 09... ... :32e0[1]
    !byte $ae, $df,   9, $e0, $d4, $f0,   2, $a9, $87, $cd, $df,   9  ; 341d: ae df 09... ... :32ec[1]
    !byte $f0, $1c, $8d, $df,   9, $a8, $4c, $16, $33, $ad, $df,   9  ; 3429: f0 1c 8d... ... :32f8[1]
    !byte $a0, $41, $8c, $df,   9, $c9, $29, $f0,   4, $c9, $36, $d0  ; 3435: a0 41 8c... .A. :3304[1]
    !byte   5, $a0, $3d, $4c, $16, $33, $a2,   0, $ad, $c9, $3a, $f0  ; 3441: 05 a0 3d... ..= :3310[1]
    !byte   1, $e8, $bd, $90, $28, $f0, $0e, $a0, $d4, $8c, $df,   9  ; 344d: 01 e8 bd... ... :331c[1]
    !byte $a0, $aa, $cd, $be,   9, $f0,   2, $a0, $b7, $a9,   0, $8d  ; 3459: a0 aa cd... ... :3328[1]
    !byte $d7, $31, $8c, $d4,   9, $98, $a2, $ff, $a0, $30, $20,   0  ; 3465: d7 31 8c... .1. :3334[1]
    !byte $22, $a9,   0, $20, $f5, $25, $a9, $dd, $85, $70, $a9, $30  ; 3471: 22 a9 00... ".. :3340[1]
    !byte $85, $71, $a9, $ff, $ae, $df,   9, $e0,   0, $f0,   4, $e0  ; 347d: 85 71 a9... .q. :334c[1]
    !byte $16, $d0, $0b, $a9,   0, $ae, $a8,   9, $e0, $51, $d0,   2  ; 3489: 16 d0 0b... ... :3358[1]
    !byte $a9, $87, $a2, $e6, $a0                                     ; 3495: a9 87 a2... ... :3364[1]
    !text "0 H", '"', "`"                                             ; 349a: 30 20 48... 0 H :3369[1]
    !byte $8a, $48, $98, $48, $a2,   0, $20, $d2, $24, $a5, $74, $18  ; 349f: 8a 48 98... .H. :336e[1]
    !byte $65, $76, $85, $71, $a5                                     ; 34ab: 65 76 85... ev. :337a[1]
    !text "uewjfqJfqJfqJfq"                                           ; 34b0: 75 65 77... uew :337f[1]
    !byte $a4, $71, $a9, $ff, $85, $44, $a9,   5, $8d,   3, $34, $ad  ; 34bf: a4 71 a9... .q. :338e[1]
    !byte $be,   9, $30, $17, $ad, $50,   9, $18, $6d,   3, $34, $85  ; 34cb: be 09 30... ..0 :339a[1]
    !byte $70, $29, $f8, $85, $72, $ad, $66,   9, $69,   0, $85, $73  ; 34d7: 70 29 f8... p). :33a6[1]
    !byte $4c, $cb, $33, $ad, $50,   9, $38, $ed,   3, $34, $85, $70  ; 34e3: 4c cb 33... L.3 :33b2[1]
    !byte $29, $f8,   9,   7, $85, $72, $ad, $66,   9, $e9,   0, $85  ; 34ef: 29 f8 09... ).. :33be[1]
    !text "sJfpJfpJfp"                                                ; 34fb: 73 4a 66... sJf :33ca[1]
    !byte $a6, $70, $20, $fa, $1e, $c9,   2, $f0, $0d, $a9,   2, $cd  ; 3505: a6 70 20... .p  :33d4[1]
    !byte   3, $34, $f0, $14, $8d,   3, $34, $4c, $99, $33, $a5, $72  ; 3511: 03 34 f0... .4. :33e0[1]
    !byte $8d, $50,   9, $a5, $73, $8d, $66,   9, $a9, $ff, $d0,   2  ; 351d: 8d 50 09... .P. :33ec[1]
    !byte $a9,   0, $85, $70, $68, $a8, $68, $aa, $a5, $70, $60,   0  ; 3529: a9 00 85... ... :33f8[1]
    !byte $a9, $12, $8d,   9,   4, $a5,   4, $d0, $1b, $20, $0a,   4  ; 3535: a9 12 8d... ... :3404[1]
    !byte $a9,   1, $85,   4, $a2, $2b, $a0, $34, $20, $1c            ; 3541: a9 01 85... ... :3410[1]
    !text "8 P8"                                                      ; 354b: 38 20 50... 8 P :341a[1]
    !byte $a2, $3b, $a0, $34, $20, $1c                                ; 354f: a2 3b a0... .;. :341e[1]
    !text "8Lr8LS"                                                    ; 3555: 38 4c 72... 8Lr :3424[1]
    !byte   4, $9b, $b9, $ae, $b8, $b8, $eb, $98, $eb, $bf, $a4, $eb  ; 355b: 04 9b b9... ... :342a[1]
    !byte $b8, $aa, $bd, $ae, $c6, $9b, $b9, $ae, $b8, $b8, $eb, $87  ; 3567: b8 aa bd... ... :3436[1]
    !byte $eb, $bf, $a4, $eb, $a7, $a4, $aa, $af, $c6, $a4, $29, $b9  ; 3573: eb bf a4... ... :3442[1]
    !byte $5c, $29, $c9,   3, $d0, $42, $a5,   4, $f0, $3e, $c9,   1  ; 357f: 5c 29 c9... \). :344e[1]
    !byte $f0, $0e, $c9,   2, $f0, $47, $c9,   3, $f0,   3            ; 358b: f0 0e c9... ... :345a[1]
    !text "LW5L"                                                      ; 3595: 4c 57 35... LW5 :3464[1]
    !byte   1, $35, $a9,   0, $8d, $97                                ; 3599: 01 35 a9... .5. :3468[1]
    !text "4 |8)"                                                     ; 359f: 34 20 7c... 4 | :346e[1]
    !byte $df, $c9, $53, $f0,   7, $c9, $4c, $d0, $1a, $ce, $97, $34  ; 35a4: df c9 53... ..S :3473[1]
    !byte $20, $0a,   4, $a9,   2, $85,   4, $a2, $98, $a0, $34, $20  ; 35b0: 20 0a 04...  .. :347f[1]
    !byte $1c                                                         ; 35bc: 1c          .   :348b[1]
    !text "8 P8 ]8Lr8`"                                               ; 35bd: 38 20 50... 8 P :348c[1]
    !byte   0, $8e, $a5, $bf, $ae, $b9, $eb, $ad, $a2, $a7, $ae, $a5  ; 35c8: 00 8e a5... ... :3497[1]
    !byte $aa, $a6, $ae, $c6, $a9,   7, $20, $fc, $36, $a4,   5, $f0  ; 35d4: aa a6 ae... ... :34a3[1]
    !byte $e6, $a0,   6, $b9, $90, $0a, $99, $db, $34, $88, $10, $f7  ; 35e0: e6 a0 06... ... :34af[1]
    !byte $20, $0a,   4, $a9,   3, $85,   4, $a2, $e3, $a0, $34, $20  ; 35ec: 20 0a 04...  .. :34bb[1]
    !byte $1c                                                         ; 35f8: 1c          .   :34c7[1]
    !text "8 P8"                                                      ; 35f9: 38 20 50... 8 P :34c8[1]
    !byte $a2, $f0, $a0, $34, $20, $1c                                ; 35fd: a2 f0 a0... ... :34cc[1]
    !text "8Lr8:0.I........"                                          ; 3603: 38 4c 72... 8Lr :34d2[1]
    !byte $0d, $9c, $a3, $a2, $a8, $a3, $eb, $af, $b9, $a2, $bd, $ae  ; 3613: 0d 9c a3... ... :34e2[1]
    !byte $f4, $c6, $9b, $b9, $ae, $b8, $b8, $eb, $fb, $e7, $fa, $e7  ; 361f: f4 c6 9b... ... :34ee[1]
    !byte $f9, $eb, $a4, $b9, $eb, $f8, $c6                           ; 362b: f9 eb a4... ... :34fa[1]
    !text " |8"                                                       ; 3632: 20 7c 38     |8 :3501[1]
    !byte $c9, $34, $b0, $2c, $c9, $30, $b0, $0a, $c9, $24, $b0, $24  ; 3635: c9 34 b0... .4. :3504[1]
    !byte $c9, $21, $90, $20, $69, $0f, $8d, $d7, $34, $20, $0a,   4  ; 3641: c9 21 90... .!. :3510[1]
    !byte $a9,   4, $85,   4, $a2, $35, $a0, $35, $20, $1c            ; 364d: a9 04 85... ... :351c[1]
    !text "8 P8"                                                      ; 3657: 38 20 50... 8 P :3526[1]
    !byte $a2, $46, $a0, $35, $20, $1c                                ; 365b: a2 46 a0... .F. :352a[1]
    !text "8Lr8`"                                                     ; 3661: 38 4c 72... 8Lr :3530[1]
    !byte $82, $a5, $b8, $ae, $b9, $bf, $eb, $b8, $aa, $bd, $ae, $eb  ; 3666: 82 a5 b8... ... :3535[1]
    !byte $af, $a2, $b8, $a0, $c6, $aa, $a5, $af, $eb, $bb, $b9, $ae  ; 3672: af a2 b8... ... :3541[1]
    !byte $b8, $b8, $eb, $99, $8e, $9f, $9e, $99, $85, $c6            ; 367e: b8 b8 eb... ... :354d[1]
    !text " |8"                                                       ; 3688: 20 7c 38     |8 :3557[1]
    !byte $c9, $0d, $d0, $d6, $20, $0a,   4, $a9, $0a, $20, $ee, $ff  ; 368b: c9 0d d0... ... :355a[1]
    !byte $a2, $f7, $a0, $35, $ad, $97, $34, $f0,   4, $a2, $fe, $a0  ; 3697: a2 f7 a0... ... :3566[1]
    !byte $35, $20, $f3, $37, $a9, $d6, $85, $70, $a9, $34, $85, $71  ; 36a3: 35 20 f3... 5 . :3572[1]
    !byte $ad, $97, $34, $f0, $1b, $a9,   5, $20, $dc, $16, $d0, $11  ; 36af: ad 97 34... ..4 :357e[1]
    !byte $a5, $7b,   5, $7c,   5, $7d, $d0,   6, $a5, $7a, $c9, $85  ; 36bb: a5 7b 05... .{. :358a[1]
    !byte $f0                                                         ; 36c7: f0          .   :3596[1]
    !text "$ ("                                                       ; 36c8: 24 20 28    $ ( :3597[1]
    !byte $17, $4c, $0d, $34, $20, $c3, $0a, $8d, $eb,   9, $a2,   0  ; 36cb: 17 4c 0d... .L. :359a[1]
    !byte $a0,   0, $86, $76, $86, $77, $a9, $ea, $85, $7a, $a9,   9  ; 36d7: a0 00 86... ... :35a6[1]
    !byte $85, $7b, $a9, $6f, $85, $7e, $a9, $0a, $85, $7f, $a2, $ea  ; 36e3: 85 7b a9... .{. :35b2[1]
    !byte $a0,   9, $ad, $97, $34, $20, $dc, $16, $d0, $d3, $20, $c3  ; 36ef: a0 09 ad... ... :35be[1]
    !byte $0a, $cd, $eb,   9, $f0,   5, $a9, $ff, $8d, $ea,   9, $ad  ; 36fb: 0a cd eb... ... :35ca[1]
    !byte $d7, $34, $38, $e9, $30, $29,   1, $d0,   3, $20, $17, $36  ; 3707: d7 34 38... .48 :35d6[1]
    !byte $20, $8f, $3a, $ad, $97, $34, $d0,   3, $4c, $53,   4, $a9  ; 3713: 20 8f 3a...  .: :35e2[1]
    !byte $ff, $85, $31, $ad, $ea,   9, $4c, $db, $36, $98, $aa, $bd  ; 371f: ff 85 31... ..1 :35ee[1]
    !byte $a2, $a5, $ac, $c6, $87, $a4, $aa, $af, $a2, $a5, $ac, $c6  ; 372b: a2 a5 ac... ... :35fa[1]
    !byte $82, $a5, $b8, $ae, $b9, $bf, $eb, $ac, $aa, $a6, $ae, $eb  ; 3737: 82 a5 b8... ... :3606[1]
    !byte $af, $a2, $b8, $a0, $c6                                     ; 3743: af a2 b8... ... :3612[1]

; $3748 referenced 1 time by $116b
sub_c3617
    jsr l040a                                                         ; 3748: 20 0a 04     .. :3617[1]
    ldx #6                                                            ; 374b: a2 06       ..  :361a[1]
    ldy #$36 ; '6'                                                    ; 374d: a0 36       .6  :361c[1]
    jsr sub_c381c                                                     ; 374f: 20 1c 38     .8 :361e[1]
    jsr sub_c3850                                                     ; 3752: 20 50 38     P8 :3621[1]
    ldx #$46 ; 'F'                                                    ; 3755: a2 46       .F  :3624[1]
    ldy #$35 ; '5'                                                    ; 3757: a0 35       .5  :3626[1]
    jsr sub_c381c                                                     ; 3759: 20 1c 38     .8 :3628[1]
    jsr sub_c3872                                                     ; 375c: 20 72 38     r8 :362b[1]
; $375f referenced 1 time by $3633
loop_c362e
    jsr sub_c387c                                                     ; 375f: 20 7c 38     |8 :362e[1]
    cmp #$0d                                                          ; 3762: c9 0d       ..  :3631[1]
    bne loop_c362e                                                    ; 3764: d0 f9       ..  :3633[1]
    rts                                                               ; 3766: 60          `   :3635[1]

    !byte $a9, $12, $8d,   9,   4, $a5,   4, $d0, $13, $20, $0a,   4  ; 3767: a9 12 8d... ... :3636[1]
    !byte $a2, $55, $a0, $36, $20, $1c                                ; 3773: a2 55 a0... .U. :3642[1]
    !text "8 P8 ]8Lr8LS"                                              ; 3779: 38 20 50... 8 P :3648[1]
    !byte   4, $8e, $a5, $bf, $ae, $b9, $eb, $bb, $aa, $b8, $b8, $bc  ; 3785: 04 8e a5... ... :3654[1]
    !byte $a4, $b9, $af, $c6, $a4, $29, $b9, $5c, $29, $c9,   8, $d0  ; 3791: a4 b9 af... ... :3660[1]
    !byte $3a, $a5,   4, $f0, $36, $a9, $10, $20, $fc, $36, $a4,   5  ; 379d: 3a a5 04... :.. :366c[1]
    !byte $f0, $1e, $ad,   3, $11, $29,   1, $f0, $27, $c0,   2, $d0  ; 37a9: f0 1e ad... ... :3678[1]
    !byte $23, $ad, $90, $0a, $c9, $41, $90, $1c, $c9, $52, $b0, $18  ; 37b5: 23 ad 90... #.. :3684[1]
    !text "H S"                                                       ; 37c1: 48 20 53    H S :3690[1]
    !byte   4, $68, $4c, $db, $36, $ad,   3, $11, $29,   1, $f0,   8  ; 37c4: 04 68 4c... .hL :3693[1]
    !byte $20, $53,   4, $a9, $ff, $4c, $db, $36, $60, $a9, $9c, $85  ; 37d0: 20 53 04...  S. :369f[1]
    !byte $70, $a9, $38, $85, $71, $a2, $c0, $a0, $53, $a9, $ff, $20  ; 37dc: 70 a9 38... p.8 :36ab[1]
    !byte $dc, $16, $f0,   6, $20, $17, $36, $4c, $a8, $36, $20, $c0  ; 37e8: dc 16 f0... ... :36b7[1]
    !byte $53, $8d, $da                                               ; 37f4: 53 8d da    S.. :36c3[1]
    !text "6 o"                                                       ; 37f7: 36 20 6f    6 o :36c6[1]
    !byte $19, $f0,   6, $20, $17, $36, $4c, $c7, $36, $ad, $da, $36  ; 37fa: 19 f0 06... ... :36c9[1]
    !byte $d0,   4                                                    ; 3806: d0 04       ..  :36d5[1]
    !text "L?6"                                                       ; 3808: 4c 3f 36    L?6 :36d7[1]
    !byte   0, $c9,   1, $f0, $17, $c5, $31, $f0, $13, $a8            ; 380b: 00 c9 01... ... :36da[1]
    !text "hhhhhh"                                                    ; 3815: 68 68 68... hhh :36e4[1]
    !byte $c0, $ff, $f0,   5, $a2,   0, $4c, $40, $11, $4c, $0c, $11  ; 381b: c0 ff f0... ... :36ea[1]
    !byte $4c, $53,   4                                               ; 3827: 4c 53 04    LS. :36f6[1]
    !text "Lz7"                                                       ; 382a: 4c 7a 37    Lz7 :36f9[1]
    !byte $8d                                                         ; 382d: 8d          .   :36fc[1]
    !text "}7 |8"                                                     ; 382e: 7d 37 20... }7  :36fd[1]
    !byte $a4,   5, $c9, $0d, $f0, $63, $c9, $7f, $f0, $44, $c9, $2d  ; 3833: a4 05 c9... ... :3702[1]
    !byte $f0, $24, $c9, $3d, $f0, $20, $c9, $21, $90, $e1, $c9, $2a  ; 383f: f0 24 c9... .$. :370e[1]
    !byte $b0,   4, $69, $10, $d0, $16, $c9, $30, $90, $56, $c9, $3a  ; 384b: b0 04 69... ..i :371a[1]
    !byte $90, $0e, $29, $df, $c9, $41, $90, $4c, $c9, $5b, $90,   4  ; 3857: 90 0e 29... ..) :3726[1]
    !byte $b0, $46, $a9, $2d, $cc, $7d, $37, $b0, $3f, $c8, $cc, $7d  ; 3863: b0 46 a9... .F. :3732[1]
    !byte $37, $d0,   3                                               ; 386f: 37 d0 03    7.. :373e[1]
    !text " c8"                                                       ; 3872: 20 63 38     c8 :3741[1]
    !byte $88, $99, $90, $0a, $20, $66, $18, $e6,   5                 ; 3875: 88 99 90... ... :3744[1]
    !text "Lz7"                                                       ; 387e: 4c 7a 37    Lz7 :374d[1]
    !byte $c0,   0, $f0, $26, $a9,   8, $20, $ee, $ff, $a9, $20, $20  ; 3881: c0 00 f0... ... :3750[1]
    !byte $ee, $ff, $a9,   8, $20, $ee, $ff, $c6,   5                 ; 388d: ee ff a9... ... :375c[1]
    !text " ]8Lz7"                                                    ; 3896: 20 5d 38...  ]8 :3765[1]
    !byte $c0,   0, $f0, $0d, $99, $90, $0a, $e6,   5                 ; 389c: c0 00 f0... ... :376b[1]
    !text " c8L|7hh`"                                                 ; 38a5: 20 63 38...  c8 :3774[1]
    !byte   0, $a9, $11, $8d,   9,   4, $a5,   4, $f0,   7, $c9,   1  ; 38ae: 00 a9 11... ... :377d[1]
    !byte $f0                                                         ; 38ba: f0          .   :3789[1]
    !text "/LS"                                                       ; 38bb: 2f 4c 53    /LS :378a[1]
    !byte   4, $20, $0a,   4, $a9,   1, $85,   4, $a2, $b1, $a0, $37  ; 38be: 04 20 0a... . . :378d[1]
    !byte $20, $1c, $38, $a4, $31, $20, $d4, $0a, $98, $20, $66, $18  ; 38ca: 20 1c 38...  .8 :3799[1]
    !text " P8"                                                       ; 38d6: 20 50 38     P8 :37a5[1]
    !byte $ae, $db, $3a, $ac, $dc, $3a, $4c, $1c, $38, $98, $ae, $a8  ; 38d9: ae db 3a... ..: :37a8[1]
    !byte $bf, $a2, $a4, $a5, $eb, $c6, $20, $0a,   4, $a9,   2, $85  ; 38e5: bf a2 a4... ... :37b4[1]
    !byte   4, $a2, $41, $8a, $a8, $20, $ef, $0a, $98, $38, $e9, $41  ; 38f1: 04 a2 41... ..A :37c0[1]
    !byte $a8, $b9, $ef,   9, $29, $80, $a8, $8a, $c0,   0, $f0,   2  ; 38fd: a8 b9 ef... ... :37cc[1]
    !byte $a9, $fe, $20, $66, $18, $e0, $50, $f0, $11, $a9,   9, $20  ; 3909: a9 fe 20... ..  :37d8[1]
    !byte $ee, $ff, $8a, $e8, $c9, $48, $d0, $d7                      ; 3915: ee ff 8a... ... :37e4[1]
    !text " P8L"                                                      ; 391d: 20 50 38...  P8 :37ec[1]
    !byte $c3, $37, $60                                               ; 3921: c3 37 60    .7` :37f0[1]

; $3924 referenced 1 time by $1743
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
; $394d referenced 2 times by $361e, $3628
sub_c381c
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
; $3981 referenced 1 time by $3621
sub_c3850
    lda #$0a                                                          ; 3981: a9 0a       ..  :3850[1]
    jsr oswrch                                                        ; 3983: 20 ee ff     .. :3852[1]   ; Write character 10
    jsr oswrch                                                        ; 3986: 20 ee ff     .. :3855[1]   ; Write character
    lda #$0d                                                          ; 3989: a9 0d       ..  :3858[1]
    jmp oswrch                                                        ; 398b: 4c ee ff    L.. :385a[1]   ; Write character 13

    !byte $48, $a9, $67, $48, $d0,   4, $48, $a9, $20, $48, $a9, $0a  ; 398e: 48 a9 67... H.g :385d[1]
    !byte $8d,   0, $fe, $68, $8d,   1, $fe, $68, $60                 ; 399a: 8d 00 fe... ... :3869[1]

; $39a3 referenced 1 time by $362b
sub_c3872
    ldx #0                                                            ; 39a3: a2 00       ..  :3872[1]
    stx l0005                                                         ; 39a5: 86 05       ..  :3874[1]
    lda #osbyte_flush_buffer_class                                    ; 39a7: a9 0f       ..  :3876[1]
    inx                                                               ; 39a9: e8          .   :3878[1]
    jmp osbyte                                                        ; 39aa: 4c f4 ff    L.. :3879[1]   ; Flush all buffers (X=0), or just input buffers (X non-zero)

; $39ad referenced 1 time by $362e
sub_c387c
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
; $39dd referenced 2 times by $11a1, $3d63
l38ac
    !byte 1                                                           ; 39dd: 01          .   :38ac[1]
; $39de referenced 1 time by $3d68
l38ad
    !byte   3,   0,   0,   0,   0,   0,   0,   3,   0,   0,   0, $40  ; 39de: 03 00 00... ... :38ad[1]
    !byte   0, $10,   0,   1,   0,   7,   0, $64,   0                 ; 39ea: 00 10 00... ... :38b9[1]
; $39f3 referenced 2 times by $11a4, $3d6d
l38c2
    !byte 2                                                           ; 39f3: 02          .   :38c2[1]
; $39f4 referenced 1 time by $3d72
l38c3
    !byte $86,   1,   3,   5, $0a, $0a, $10,   0,   0,   0,   0,   0  ; 39f4: 86 01 03... ... :38c3[1]
    !byte   0, $11,   0,   2,   0, $b4,   0, $64,   0,   3,   1,   0  ; 3a00: 00 11 00... ... :38cf[1]
    !byte   0,   0,   0,   0,   0, $64,   0,   0, $f8, $7e,   0, $10  ; 3a0c: 00 00 00... ... :38db[1]
    !byte   0,   3,   0,   3,   0,   1,   0, $11,   0,   0,   0, $28  ; 3a18: 00 03 00... ... :38e7[1]
    !byte   0,   1,   0, $8d, $73, $39, $a5, $70, $48, $a5, $71, $48  ; 3a24: 00 01 00... ... :38f3[1]
    !byte $86, $70, $84, $71, $ad, $66, $39, $f0, $4c, $a0,   0, $b1  ; 3a30: 86 70 84... .p. :38ff[1]
    !byte $70, $29, $f0, $f0, $2c, $b1, $70, $29,   3, $aa, $ad, $73  ; 3a3c: 70 29 f0... p). :390b[1]
    !byte $39, $dd, $6f, $39, $90, $37, $9d, $6f, $39, $e0,   2, $b0  ; 3a48: 39 dd 6f... 9.o :3917[1]
    !byte $27, $a5, $70, $dd, $67, $39, $d0,   7, $a5, $71, $dd, $6b  ; 3a54: 27 a5 70... '.p :3923[1]
    !byte $39, $f0, $19, $8a, $18, $69,   4, $aa, $a9, $15, $20, $f4  ; 3a60: 39 f0 19... 9.. :392f[1]
    !byte $ff, $b1, $70, $29,   3, $aa, $a5, $70, $9d, $67, $39, $a5  ; 3a6c: ff b1 70... ..p :393b[1]
    !byte $71, $9d, $6b, $39, $a6, $70, $a4, $71, $a9,   7, $20, $f1  ; 3a78: 71 9d 6b... q.k :3947[1]
    !byte $ff, $68, $85, $71, $68, $85, $70, $ad                      ; 3a84: ff 68 85... .h. :3953[1]
    !text "s9`"                                                       ; 3a8c: 73 39 60    s9` :395b[1]

; $3a8f referenced 3 times by $3d41, $3d48, $3d4f
define_envelope
    pha                                                               ; 3a8f: 48          H   :395e[1]
    lda #osword_envelope                                              ; 3a90: a9 08       ..  :395f[1]
    jsr osword                                                        ; 3a92: 20 f1 ff     .. :3961[1]   ; ENVELOPE command
    pla                                                               ; 3a95: 68          h   :3964[1]
    rts                                                               ; 3a96: 60          `   :3965[1]

    !byte $ff,   0,   0,   0,   0,   0,   0,   0,   0                 ; 3a97: ff 00 00... ... :3966[1]
; $3aa0 referenced 1 time by $1213
l396f
    !byte   0,   0,   0,   0,   0,   0, $20, $20, $ff,   0            ; 3aa0: 00 00 00... ... :396f[1]
    !text "&%$#", '"'                                                 ; 3aaa: 26 25 24... &%$ :3979[1]
    !byte $ff                                                         ; 3aaf: ff          .   :397e[1]
    !text '"', "#$%&"                                                 ; 3ab0: 22 23 24... "#$ :397f[1]
    !byte   0, $ff, $ad, $d4,   9, $18, $69,   1, $a8, $b9, $74, $39  ; 3ab5: 00 ff ad... ... :3984[1]
    !byte $c9, $ff, $d0,   3, $ac, $df,   9, $ad, $df,   9, $d0, $25  ; 3ac1: c9 ff d0... ... :3990[1]
    !byte $98, $d0, $69, $a5, $4d, $85, $48, $d0, $11, $a0, $0b, $8c  ; 3acd: 98 d0 69... ..i :399c[1]
    !byte $df,   9, $ad, $7c,   9, $18, $69,   2, $8d, $7c,   9, $4c  ; 3ad9: df 09 ad... ... :39a8[1]
    !byte   8, $3a, $a9,   0, $8d, $df,   9, $8d, $d4,   9, $4c, $cd  ; 3ae5: 08 3a a9... .:. :39b4[1]
    !byte $22, $c9, $0b, $d0, $2f, $c0, $0b, $d0                      ; 3af1: 22 c9 0b... ".. :39c0[1]

    !text "? X#hhhh"                                                  ; 3af9: 3f 20 58... ? X :39c8[1]
    !byte $a0, $0f, $b9, $ef,   9, $29, $80, $f0                      ; 3b01: a0 0f b9... ... :39d0[1]
; $3b09 referenced 1 time by $3af7
    !byte   7, $88, $10, $f6, $a0, $51, $d0, $0c, $a4, $31, $20, $d4  ; 3b09: 07 88 10... ... :39d8[1]
    !byte $0a, $c8, $c0, $51, $90,   2, $a0, $41, $a2,   0, $20, $ef  ; 3b15: 0a c8 c0... ... :39e4[1]
    !byte $0a, $4c, $40, $11, $c0,   4, $d0, $10, $a9,   0, $8d, $df  ; 3b21: 0a 4c 40... .L@ :39f0[1]
    !byte   9, $a0,   1, $ad, $7c,   9, $38, $e9,   2, $8d, $7c,   9  ; 3b2d: 09 a0 01... ... :39fc[1]
    !byte $8c, $d4,   9, $b9, $74, $39, $8d, $a8,   9, $60, $a2, $b6  ; 3b39: 8c d4 09... ... :3a08[1]
    !byte $20, $cc, $3a,   5, $46, $85, $46, $a2, $9e, $20, $cc, $3a  ; 3b45: 20 cc 3a...  .: :3a14[1]
    !byte $8d, $8d, $3a,   5, $2c, $85, $2c, $a2, $bd, $20, $cc, $3a  ; 3b51: 8d 8d 3a... ..: :3a20[1]
    !byte $48,   5, $2d, $85, $2d, $68, $a2,   0, $4d, $8d, $3a, $f0  ; 3b5d: 48 05 2d... H.- :3a2c[1]
    !byte   8, $ca, $ad, $8d, $3a, $30,   2, $a2,   1, $8a,   5, $20  ; 3b69: 08 ca ad... ... :3a38[1]
    !byte $85, $20, $60, $a2, $9d, $20, $cc, $3a, $c5, $2b, $85, $2b  ; 3b75: 85 20 60... . ` :3a44[1]
    !byte $d0,   2, $a9,   0,   5, $2a, $85, $2a, $a2, $e6, $20, $cc  ; 3b81: d0 02 a9... ... :3a50[1]
    !byte $3a, $8d, $8d, $3a, $a2, $86, $20, $cc, $3a, $cd, $8d, $3a  ; 3b8d: 3a 8d 8d... :.. :3a5c[1]
    !byte $f0,   9, $ad, $8d, $3a, $30,   6, $a9,   1, $10,   2, $a9  ; 3b99: f0 09 ad... ... :3a68[1]
    !byte   0, $c5, $27, $85, $27, $d0,   8, $a9,   0, $c6, $26, $10  ; 3ba5: 00 c5 27... ..' :3a74[1]
    !byte   7, $a5, $27, $ae, $8e, $3a, $86, $26,   5, $28, $85, $28  ; 3bb1: 07 a5 27... ..' :3a80[1]
    !byte $60,   0, $10                                               ; 3bbd: 60 00 10    `.. :3a8c[1]

; $3bc0 referenced 2 times by $174c, $3899
c3a8f
    lda l002a                                                         ; 3bc0: a5 2a       .*  :3a8f[1]
    sta l3aa0                                                         ; 3bc2: 8d a0 3a    ..: :3a91[1]
    lda l0028                                                         ; 3bc5: a5 28       .(  :3a94[1]
    sta l3aa1                                                         ; 3bc7: 8d a1 3a    ..: :3a96[1]
    lda #0                                                            ; 3bca: a9 00       ..  :3a99[1]
    sta l002a                                                         ; 3bcc: 85 2a       .*  :3a9b[1]
    sta l0028                                                         ; 3bce: 85 28       .(  :3a9d[1]
    rts                                                               ; 3bd0: 60          `   :3a9f[1]

; $3bd1 referenced 1 time by $3a91
l3aa0
    !byte 0                                                           ; 3bd1: 00          .   :3aa0[1]
; $3bd2 referenced 1 time by $3a96
l3aa1
    !byte   0, $ad, $c7, $3a, $8d, $c8, $3a, $a5, $46, $8d, $c7, $3a  ; 3bd2: 00 ad c7... ... :3aa1[1]
    !byte $a5, $20, $8d, $c9, $3a, $a5, $2c, $8d, $ca, $3a, $a5, $2d  ; 3bde: a5 20 8d... . . :3aad[1]
    !byte $8d, $cb, $3a, $a9,   0, $85, $46, $85, $20, $85, $2c, $85  ; 3bea: 8d cb 3a... ..: :3ab9[1]
    !byte $2d, $60,   0,   0,   0,   0,   0, $a0, $ff, $a9, $81, $20  ; 3bf6: 2d 60 00... -`. :3ac5[1]
    !byte $f4, $ff, $8a, $60                                          ; 3c02: f4 ff 8a... ... :3ad1[1]

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
    and #$80                                                          ; 3c0c: 29 80       ).  :3adb[1]
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
    lda l4088,x                                                       ; 3c6c: bd 88 40    ..@
    sta l0ab7,x                                                       ; 3c6f: 9d b7 0a    ...
    inx                                                               ; 3c72: e8          .
    cpx #$48 ; 'H'                                                    ; 3c73: e0 48       .H
    bcc loop_c3c6c                                                    ; 3c75: 90 f5       ..
    ldy #0                                                            ; 3c77: a0 00       ..
; $3c79 referenced 1 time by $3c80
loop_c3c79
    lda l3fcb,y                                                       ; 3c79: b9 cb 3f    ..?
    sta l0c00,y                                                       ; 3c7c: 99 00 0c    ...
    iny                                                               ; 3c7f: c8          .
    bne loop_c3c79                                                    ; 3c80: d0 f7       ..
    ldy #0                                                            ; 3c82: a0 00       ..
; $3c84 referenced 1 time by $3c8d
loop_c3c84
    lda l40d0,y                                                       ; 3c84: b9 d0 40    ..@
    sta l0131,y                                                       ; 3c87: 99 31 01    .1.
    iny                                                               ; 3c8a: c8          .
    cpy #$2f ; '/'                                                    ; 3c8b: c0 2f       ./
    bne loop_c3c84                                                    ; 3c8d: d0 f5       ..
    lda l1103                                                         ; 3c8f: ad 03 11    ...
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
    sta l0037                                                         ; 3d10: 85 37       .7
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
    lda l1103                                                         ; 3e8a: ad 03 11    ...
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
    sta l1103                                                         ; 3f2a: 8d 03 11    ...
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
    lda l1103                                                         ; 3f6f: ad 03 11    ...
    and #1                                                            ; 3f72: 29 01       ).
    sta l005b                                                         ; 3f74: 85 5b       .[
    beq c3fba                                                         ; 3f76: f0 42       .B
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
    lda l402c,y                                                       ; 3f87: b9 2c 40    .,@
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
; $3fcb referenced 1 time by $3c79
l3fcb
    !byte $a9, $ff, $8d, $0a, $11, $ad, $5d, $17, $8d, $5e, $17, $ad  ; 3fcb: a9 ff 8d... ...
    !byte $5f, $17, $8d, $60, $17, $78, $a9, $7f, $8d, $6e, $fe, $a9  ; 3fd7: 5f 17 8d... _..
    !byte $c0, $8d, $4b, $fe, $a9, $ff, $8d, $48, $fe, $a9, $3c, $8d  ; 3fe3: c0 8d 4b... ..K
    !byte $4e, $fe, $a9, $a0, $8d,   4,   2, $a9, $17, $8d,   5,   2  ; 3fef: 4e fe a9... N..
    !byte $58, $20, $8c, $17, $20, $8c, $17, $a9,   7, $8d,   0, $fe  ; 3ffb: 58 20 8c... X .
    !byte $ad, $0b, $11, $8d,   1, $fe, $a9, $0d, $8d,   0, $fe, $a9  ; 4007: ad 0b 11... ...
    !byte $78, $8d,   1, $fe, $a9, $0c, $8d,   0, $fe, $a9, $0b, $8d  ; 4013: 78 8d 01... x..
    !byte   1, $fe, $a9,   6, $8d,   0, $fe, $a9, $1d, $8d,   1, $fe  ; 401f: 01 fe a9... ...
    !byte $60                                                         ; 402b: 60          `
; $402c referenced 1 time by $3f87
l402c
    !byte $78, $ad, $b5, $0a, $8d,   4,   2, $ad, $b6, $0a, $8d,   5  ; 402c: 78 ad b5... x..
    !byte   2, $58, $a9,   3, $20, $ee, $ff, $a9, $16, $20, $ee, $ff  ; 4038: 02 58 a9... .X.
    !byte $a9,   7, $20, $ee, $ff, $a9,   4, $a2,   0, $a0,   0, $20  ; 4044: a9 07 20... ..
    !byte $f4, $ff, $a9, $c8, $a2,   0, $a0,   0, $20, $f4, $ff, $a9  ; 4050: f4 ff a9... ...
    !byte $0f, $a2,   0, $20, $f4, $ff, $a9,   0, $8d, $87,   2, $68  ; 405c: 0f a2 00... ...
    !byte $68, $a9, $42, $85, $70, $a9, $41, $85, $71, $a9, $53, $85  ; 4068: 68 a9 42... h.B
    !byte $72, $a9, $49, $85, $73, $a9, $43, $85, $74, $a9, $0d, $85  ; 4074: 72 a9 49... r.I
    !byte $75, $a2, $70, $a0,   0, $4c, $f7, $ff                      ; 4080: 75 a2 70... u.p
; $4088 referenced 1 time by $3c6c
l4088
    !byte $a9,   0, $aa, $9d, $ef,   9, $e8, $e0, $80, $90, $f8, $60  ; 4088: a9 00 aa... ...
    !byte $a9,   0, $aa, $5d, $ef,   9, $e8, $e0, $80, $90, $f8, $4d  ; 4094: a9 00 aa... ...
    !byte $ea,   9, $49, $ff, $60, $c0, $51, $f0, $26, $48, $8a, $48  ; 40a0: ea 09 49... ..I
    !byte $98, $a2, $0f, $dd, $80, $0a, $f0,   3, $ca, $10, $f8, $8a  ; 40ac: 98 a2 0f... ...
    !byte $18, $69, $41, $a8, $68, $aa, $68, $60, $c0, $51, $f0, $0b  ; 40b8: 18 69 41... .iA
    !byte $48, $98, $38, $e9, $41, $a8, $b9, $80, $0a, $a8, $68, $60  ; 40c4: 48 98 38... H.8
; $40d0 referenced 1 time by $3c84
l40d0
    !byte $48, $8a, $48, $a2,   2, $bd, $ec,   9, $d5, $5c, $f0, $1a  ; 40d0: 48 8a 48... H.H
    !byte $95, $5c, $a9, $1f, $20, $ee, $ff, $8a, $49, $ff            ; 40dc: 95 5c a9... .\.
    !text "8i% "                                                      ; 40e6: 38 69 25... 8i%
    !byte $ee, $ff, $a9,   6, $20, $ee, $ff, $b5                      ; 40ea: ee ff a9... ...
    !text $5c, " f"                                                   ; 40f2: 5c 20 66    \ f
    !byte $18, $ca, $e0, $ff, $d0, $da, $68, $aa, $68, $60            ; 40f5: 18 ca e0... ...
some_data_high_copy_TODO
icodata
    !byte $ae,   6, $11, $ac,   7, $11, $4c, $91, $17, $12, $20,   0  ; 40ff: ae 06 11... ...
    !byte   4, $a5,   4, $f0                                          ; 410b: 04 a5 04... ...
    !text ") c8"                                                      ; 410f: 29 20 63... ) c
    !byte $a2, $ff, $86, $3e, $e8, $86, $3f, $a9, $a9, $85, $40, $a9  ; 4113: a2 ff 86... ...
    !byte $0a, $85, $41, $e8, $86, $42, $a0,   1, $ad,   9,   4, $38  ; 411f: 0a 85 41... ..A
    !byte $e9,   2, $85, $3c, $a9,   3, $85, $3d, $20, $bb, $1a, $4c  ; 412b: e9 02 85... ...
    !byte $44,   4, $a9, $ff, $85,   4, $20, $74,   4, $20, $cb,   4  ; 4137: 44 04 a9... D..
    !byte $a9, $1f, $20, $ee, $ff, $a9,   0, $20, $ee, $ff, $a9,   9  ; 4143: a9 1f 20... ..
    !byte $4c, $ee, $ff, $a5,   4, $f0, $1c, $20,   0,   4            ; 414f: 4c ee ff... L..
    !text " c8"                                                       ; 4159: 20 63 38     c8
    !byte $a2, $ff, $86, $3e, $86, $42, $e8, $86,   4, $86, $3f, $a9  ; 415c: a2 ff 86... ...
    !byte $30, $85, $40, $a9,   5, $85, $41, $4c,   5,   5, $60, $a9  ; 4168: 30 85 40... 0.@
    !byte   0, $85, $74, $85, $76, $a5, $4c, $85, $75, $85, $77, $a9  ; 4174: 00 85 74... ..t
    !byte $30, $85, $7a, $a9,   5, $85, $7b, $18, $a9,   5, $85, $73  ; 4180: 30 85 7a... 0.z
    !byte $ae,   9,   4, $a0,   7, $b1, $76, $91, $7a, $88, $10, $f9  ; 418c: ae 09 04... ...
    !byte $a5, $7a, $69,   8, $85, $7a, $90,   3, $e6, $7b, $18, $ca  ; 4198: a5 7a 69... .zi
    !byte $f0, $0d, $a5, $76, $69,   8, $85, $76, $90, $e1, $e6, $77  ; 41a4: f0 0d a5... ...
    !byte $18, $90, $dc, $c6, $73, $f0, $12, $a5                      ; 41b0: 18 90 dc... ...
    !text "ti@"                                                       ; 41b8: 74 69 40    ti@
    !byte $85, $74, $85, $76, $a5, $75, $69,   1, $85, $75, $85, $77  ; 41bb: 85 74 85... .t.
    !byte $90, $c3, $60, $a2, $ff, $86, $3e, $e8, $86, $3f, $8e, $18  ; 41c7: 90 c3 60... ..`
    !byte   5, $a9, $a9, $85, $40, $a9, $0a, $85, $41, $e8, $86, $42  ; 41d3: 05 a9 a9... ...
    !byte $20,   5,   5, $ad,   9,   4, $0a, $0a, $0a, $38, $e9,   1  ; 41df: 20 05 05...  ..
    !byte $0a, $2e, $18,   5, $0a, $8d, $17,   5, $2e, $18,   5, $a0  ; 41eb: 0a 2e 18... ...
    !byte   0, $b9, $15,   5, $20, $ee, $ff, $c8, $c0, $12, $90, $f5  ; 41f7: 00 b9 15... ...
    !byte $60, $a2,   0, $a0,   0, $ad,   9,   4, $85, $3c, $a9,   5  ; 4203: 60 a2 00... `..
    !byte $85, $3d, $4c, $bb, $1a, $19,   4,   0,   0, $fc,   2, $19  ; 420f: 85 3d 4c... .=L
    !byte   1,   0,   0, $64, $ff, $19,   5,   0,   0, $60,   2       ; 421b: 01 00 00... ...
pydis_end

; Label references by decreasing frequency:
;     l0070:                                         42
;     l0072:                                         28
;     l0073:                                         27
;     oswrch:                                        25
;     l0071:                                         24
;     l0080:                                         19
;     osbyte:                                        19
;     l004c:                                         17
;     l007d:                                         14
;     l0085:                                         14
;     l0015:                                         11
;     l0031:                                         10
;     l0074:                                          9
;     l0079:                                          9
;     l0016:                                          8
;     l0030:                                          8
;     l007b:                                          8
;     l007c:                                          8
;     l0019:                                          7
;     l0075:                                          7
;     l0078:                                          7
;     sub_c14be:                                      7
;     l0018:                                          6
;     l001a:                                          6
;     l001b:                                          6
;     l001d:                                          6
;     l0029:                                          6
;     l002e:                                          6
;     l0054:                                          6
;     l0055:                                          6
;     l0081:                                          6
;     l0088:                                          6
;     l1648:                                          6
;     l173d:                                          6
;     l2a8d:                                          6
;     crtc_address_register:                          6
;     crtc_address_write:                             6
;     l007a:                                          5
;     l007e:                                          5
;     l0082:                                          5
;     l09ef:                                          5
;     pydis_start:                                    5
;     l003b:                                          4
;     l0045:                                          4
;     l0058:                                          4
;     l0076:                                          4
;     l0083:                                          4
;     l0086:                                          4
;     l0087:                                          4
;     l14b0:                                          4
;     l16c4:                                          4
;     l17ff:                                          4
;     l180d:                                          4
;     osword:                                         4
;     l0002:                                          3
;     l0006:                                          3
;     l0008:                                          3
;     l000a:                                          3
;     l0037:                                          3
;     l003a:                                          3
;     l0059:                                          3
;     l005f:                                          3
;     l0077:                                          3
;     l0084:                                          3
;     brkv:                                           3
;     brkv+1:                                         3
;     l0ab3:                                          3
;     l0ab4:                                          3
;     l0c00:                                          3
;     l145d:                                          3
;     sub_c14a7:                                      3
;     sub_c15b7:                                      3
;     sub_c15b8:                                      3
;     sub_c15e8:                                      3
;     l165a:                                          3
;     sub_c174f:                                      3
;     l17c7:                                          3
;     l2b0e:                                          3
;     l2d77:                                          3
;     c3a8f:                                          3
;     l0003:                                          2
;     l0004:                                          2
;     l0007:                                          2
;     l0009:                                          2
;     l0028:                                          2
;     l002a:                                          2
;     l0039:                                          2
;     l0043:                                          2
;     l0051:                                          2
;     l005a:                                          2
;     l0131:                                          2
;     l0409:                                          2
;     l040a:                                          2
;     l0950:                                          2
;     l0966:                                          2
;     l097c:                                          2
;     l0992:                                          2
;     l09a8:                                          2
;     l09b3:                                          2
;     l09be:                                          2
;     l0ab1:                                          2
;     l0ab2:                                          2
;     l0ab7:                                          2
;     l1235:                                          2
;     l123b:                                          2
;     sub_c13cc:                                      2
;     l14a8:                                          2
;     sub_c159f:                                      2
;     l15a8:                                          2
;     l15b9:                                          2
;     sub_c15ba:                                      2
;     sub_c15cd:                                      2
;     l167b:                                          2
;     sub_c16b2:                                      2
;     l17fe:                                          2
;     l187d:                                          2
;     l188e:                                          2
;     l1890:                                          2
;     l1891:                                          2
;     l18bc:                                          2
;     l1a97:                                          2
;     l1f3c:                                          2
;     l209d:                                          2
;     l20b5:                                          2
;     l2a9f:                                          2
;     l2aa0:                                          2
;     l2ab1:                                          2
;     l2ad2:                                          2
;     l2ad9:                                          2
;     l2b08:                                          2
;     l2b1c:                                          2
;     l2b48:                                          2
;     l2d0e:                                          2
;     l394d:                                          2
;     l397f:                                          2
;     l3980:                                          2
;     l39be:                                          2
;     l39dd:                                          2
;     l39f3:                                          2
;     c3bc0:                                          2
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
;     oscli:                                          2
;     l0000:                                          1
;     l0005:                                          1
;     l0014:                                          1
;     l003e:                                          1
;     l0042:                                          1
;     l0048:                                          1
;     l004d:                                          1
;     l0050:                                          1
;     l0052:                                          1
;     l005b:                                          1
;     l005c:                                          1
;     l005d:                                          1
;     l005e:                                          1
;     l007f:                                          1
;     irq1v:                                          1
;     irq1v+1:                                        1
;     l09a9:                                          1
;     l09b4:                                          1
;     l09d4:                                          1
;     l09d5:                                          1
;     l09df:                                          1
;     l09ea:                                          1
;     l09ec:                                          1
;     l09ed:                                          1
;     l09ee:                                          1
;     l0a6f:                                          1
;     l0a7e:                                          1
;     l0a7f:                                          1
;     l0aa1:                                          1
;     l0aa9:                                          1
;     l0ab5:                                          1
;     l0ab6:                                          1
;     l0ad4:                                          1
;     l0aef:                                          1
;     l0b00:                                          1
;     sub_c123c:                                      1
;     l123d:                                          1
;     l1271:                                          1
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
;     l17a1:                                          1
;     l17bb:                                          1
;     l17d6:                                          1
;     l17db:                                          1
;     l17e6:                                          1
;     l17f0:                                          1
;     l1828:                                          1
;     l188f:                                          1
;     l1892:                                          1
;     l1896:                                          1
;     l1897:                                          1
;     sub_c18bb:                                      1
;     l19d7:                                          1
;     l19da:                                          1
;     l1a9e:                                          1
;     l1a9f:                                          1
;     l1aa0:                                          1
;     l1f25:                                          1
;     l1f28:                                          1
;     l207d:                                          1
;     l208e:                                          1
;     l209e:                                          1
;     l20c7:                                          1
;     l20d1:                                          1
;     l20e8:                                          1
;     l20f2:                                          1
;     l2564:                                          1
;     l2a9e:                                          1
;     l2ab9:                                          1
;     l2ac3:                                          1
;     l2adb:                                          1
;     l2af2:                                          1
;     l2afa:                                          1
;     l2b05:                                          1
;     l2b0f:                                          1
;     l2b1b:                                          1
;     l2b43:                                          1
;     l2b64:                                          1
;     l2cee:                                          1
;     l2cf7:                                          1
;     l2d07:                                          1
;     l2d3d:                                          1
;     l2d66:                                          1
;     l2d6e:                                          1
;     l2d89:                                          1
;     l2d90:                                          1
;     l2d93:                                          1
;     l2fe7:                                          1
;     l2fe8:                                          1
;     l301a:                                          1
;     l3308:                                          1
;     l3748:                                          1
;     l375f:                                          1
;     l3924:                                          1
;     l392a:                                          1
;     l3935:                                          1
;     l3945:                                          1
;     l394b:                                          1
;     l3969:                                          1
;     l396b:                                          1
;     l3979:                                          1
;     l397e:                                          1
;     l3981:                                          1
;     l39a3:                                          1
;     l39ad:                                          1
;     l39bb:                                          1
;     l39c3:                                          1
;     l39de:                                          1
;     l39f4:                                          1
;     l3aa0:                                          1
;     l3b09:                                          1
;     l3bd1:                                          1
;     l3bd2:                                          1
;     c3c06:                                          1
;     l3c07:                                          1
;     c3c08:                                          1
;     l3c09:                                          1
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
;     l3fcb:                                          1
;     l402c:                                          1
;     l4088:                                          1
;     l40d0:                                          1
;     l8000:                                          1
;     lbe00:                                          1
;     lbf00:                                          1
;     user_via_t1c_l:                                 1
;     user_via_t1c_h:                                 1
;     user_via_t2c_l:                                 1
;     user_via_t2c_h:                                 1
;     osfile:                                         1

; Automatically generated labels:
;     c110c
;     c1140
;     c1171
;     c1175
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
;     c1966
;     c1e0b
;     c1f5d
;     c1f96
;     c1fa0
;     c1fb7
;     c1fc1
;     c29aa
;     c29c1
;     c29d4
;     c29d7
;     c29ea
;     c2a12
;     c2a33
;     c2bd6
;     c2bdd
;     c2c35
;     c2c3d
;     c2c5f
;     c2c62
;     c3804
;     c381a
;     c3838
;     c3848
;     c388a
;     c3a8f
;     c3ad7
;     c3add
;     c3ae0
;     c3afb
;     c3bc0
;     c3c06
;     c3c08
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
;     l0028
;     l0029
;     l002a
;     l002e
;     l0030
;     l0031
;     l0037
;     l0039
;     l003a
;     l003b
;     l003e
;     l0042
;     l0043
;     l0045
;     l0048
;     l004c
;     l004d
;     l0050
;     l0051
;     l0052
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
;     l0131
;     l0409
;     l040a
;     l0950
;     l0966
;     l097c
;     l0992
;     l09a8
;     l09a9
;     l09b3
;     l09b4
;     l09be
;     l09d4
;     l09d5
;     l09df
;     l09ea
;     l09ec
;     l09ed
;     l09ee
;     l09ef
;     l0a6f
;     l0a7e
;     l0a7f
;     l0aa1
;     l0aa9
;     l0ab1
;     l0ab2
;     l0ab3
;     l0ab4
;     l0ab5
;     l0ab6
;     l0ab7
;     l0ad4
;     l0aef
;     l0b00
;     l0c00
;     l1103
;     l1104
;     l110a
;     l110b
;     l1235
;     l123b
;     l123d
;     l1271
;     l1280
;     l12a6
;     l12b7
;     l130e
;     l1329
;     l1377
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
;     l17a1
;     l17bb
;     l17c7
;     l17d6
;     l17db
;     l17e6
;     l17f0
;     l17fe
;     l17ff
;     l180d
;     l1828
;     l187d
;     l188e
;     l188f
;     l1890
;     l1891
;     l1892
;     l1896
;     l1897
;     l18bc
;     l196d
;     l196e
;     l19d7
;     l19da
;     l1a97
;     l1a9e
;     l1a9f
;     l1aa0
;     l1f25
;     l1f28
;     l1f3c
;     l1f6c
;     l207d
;     l208e
;     l209d
;     l209e
;     l20b5
;     l20c7
;     l20d1
;     l20e8
;     l20f2
;     l2433
;     l2564
;     l295c
;     l296d
;     l296e
;     l296f
;     l29dd
;     l2a8d
;     l2a9e
;     l2a9f
;     l2aa0
;     l2ab1
;     l2ab9
;     l2ac3
;     l2ad2
;     l2ad9
;     l2adb
;     l2af2
;     l2afa
;     l2b05
;     l2b08
;     l2b0e
;     l2b0f
;     l2b1b
;     l2b1c
;     l2b43
;     l2b48
;     l2b64
;     l2cee
;     l2cf7
;     l2d07
;     l2d0e
;     l2d3d
;     l2d66
;     l2d6e
;     l2d77
;     l2d89
;     l2d90
;     l2d93
;     l2eb6
;     l2eb7
;     l2ee9
;     l2fe7
;     l2fe8
;     l301a
;     l31d7
;     l3308
;     l3748
;     l375f
;     l384e
;     l384f
;     l38ac
;     l38ad
;     l38c2
;     l38c3
;     l3924
;     l392a
;     l3935
;     l3945
;     l394b
;     l394d
;     l3969
;     l396b
;     l396f
;     l3979
;     l397e
;     l397f
;     l3980
;     l3981
;     l39a3
;     l39ad
;     l39bb
;     l39be
;     l39c3
;     l39dd
;     l39de
;     l39f3
;     l39f4
;     l3aa0
;     l3aa1
;     l3ad8
;     l3ade
;     l3adf
;     l3b09
;     l3bd1
;     l3bd2
;     l3c07
;     l3c09
;     l3c0f
;     l3c10
;     l3f05
;     l3fbb
;     l3fcb
;     l402c
;     l4088
;     l40d0
;     l8000
;     lbe00
;     lbf00
;     loop_c114f
;     loop_c11dd
;     loop_c1213
;     loop_c13ac
;     loop_c1471
;     loop_c1540
;     loop_c1623
;     loop_c18a9
;     loop_c1df7
;     loop_c2988
;     loop_c2992
;     loop_c29c9
;     loop_c2bc6
;     loop_c2c58
;     loop_c362e
;     loop_c37f9
;     loop_c3814
;     loop_c383a
;     loop_c3892
;     loop_c3c6c
;     loop_c3c79
;     loop_c3c84
;     loop_c3cfc
;     loop_c3d54
;     loop_c3e52
;     loop_c3f18
;     loop_c3f7b
;     loop_c3f87
;     sub_c123c
;     sub_c1278
;     sub_c12a2
;     sub_c133a
;     sub_c1344
;     sub_c1365
;     sub_c138d
;     sub_c13cc
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
;     sub_c174f
;     sub_c1766
;     sub_c176e
;     sub_c1771
;     sub_c18bb
;     sub_c196c
;     sub_c1df4
;     sub_c1f4c
;     sub_c1f6d
;     sub_c1f84
;     sub_c2980
;     sub_c29a1
;     sub_c29a8
;     sub_c29de
;     sub_c29eb
;     sub_c2a17
;     sub_c2bbd
;     sub_c2c0c
;     sub_c2c46
;     sub_c3617
;     sub_c37f3
;     sub_c381c
;     sub_c384d
;     sub_c3850
;     sub_c3872
;     sub_c387c
;     sub_c388d
;     sub_c3f6f
!if (<(dir_dollar_command)) != $07 {
    !error "Assertion failed: <(dir_dollar_command) == $07"
}
!if (<(drive_0_command)) != $ff {
    !error "Assertion failed: <(drive_0_command) == $ff"
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
!if (osfile_load) != $ff {
    !error "Assertion failed: osfile_load == $ff"
}
!if (osfile_read_catalogue_info) != $05 {
    !error "Assertion failed: osfile_read_catalogue_info == $05"
}
!if (osword_envelope) != $08 {
    !error "Assertion failed: osword_envelope == $08"
}
!if (screen_width_minus_one) != $27 {
    !error "Assertion failed: screen_width_minus_one == $27"
}
!if (vdu_bell) != $07 {
    !error "Assertion failed: vdu_bell == $07"
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
!if (vdu_set_graphics_colour) != $12 {
    !error "Assertion failed: vdu_set_graphics_colour == $12"
}
!if (vdu_set_mode) != $16 {
    !error "Assertion failed: vdu_set_mode == $16"
}
!if (vdu_set_text_colour) != $11 {
    !error "Assertion failed: vdu_set_text_colour == $11"
}
