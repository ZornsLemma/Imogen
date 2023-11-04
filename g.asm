; Constants
crtc_cursor_start                               = 10
crtc_interlace_delay                            = 8
crtc_screen_start_high                          = 12
crtc_screen_start_low                           = 13
crtc_vert_displayed                             = 6
crtc_vert_sync_pos                              = 7
osbyte_close_spool_exec                         = 119
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
osword_envelope                                 = 8
vdu_define_character                            = 23
vdu_define_text_window                          = 28
vdu_enable                                      = 6
vdu_set_graphics_colour                         = 18
vdu_set_mode                                    = 22
vdu_set_text_colour                             = 17

; Memory locations
l0002                   = &0002
l0004                   = &0004
l0005                   = &0005
l0006                   = &0006
l0007                   = &0007
l0008                   = &0008
l0009                   = &0009
l000a                   = &000a
l0015                   = &0015
l001d                   = &001d
l001e                   = &001e
l0028                   = &0028
l002e                   = &002e
l0030                   = &0030
l0031                   = &0031
l0032                   = &0032
l0037                   = &0037
l003a                   = &003a
l003b                   = &003b
l003c                   = &003c
l003d                   = &003d
l0043                   = &0043
l0045                   = &0045
l004c                   = &004c
l0054                   = &0054
l0055                   = &0055
l0056                   = &0056
l005b                   = &005b
l005c                   = &005c
l005d                   = &005d
l005e                   = &005e
l005f                   = &005f
l0070                   = &0070
l0071                   = &0071
l0072                   = &0072
l0073                   = &0073
l0077                   = &0077
l0078                   = &0078
l0079                   = &0079
l007a                   = &007a
l007b                   = &007b
l007c                   = &007c
l007d                   = &007d
l007e                   = &007e
l007f                   = &007f
l0080                   = &0080
l0081                   = &0081
l0082                   = &0082
l0083                   = &0083
l0084                   = &0084
l0085                   = &0085
l0087                   = &0087
l0088                   = &0088
l00a0                   = &00a0
l00c9                   = &00c9
l0131                   = &0131
brkv                    = &0202
irq1v                   = &0204
some_data_low_TODO      = &0400
l040a                   = &040a
l0453                   = &0453
l09a8                   = &09a8
l09be                   = &09be
l09d4                   = &09d4
l09df                   = &09df
l09ea                   = &09ea
l09eb                   = &09eb
l09ef                   = &09ef
l0a7e                   = &0a7e
l0a90                   = &0a90
l0aa1                   = &0aa1
l0aa9                   = &0aa9
l0ab1                   = &0ab1
l0ab2                   = &0ab2
l0ab3                   = &0ab3
l0ab4                   = &0ab4
l0ab5                   = &0ab5
l0ab6                   = &0ab6
l0ab7                   = &0ab7
l0ac3                   = &0ac3
l0ad4                   = &0ad4
l0b00                   = &0b00
l0c00                   = &0c00
l0e1a                   = &0e1a
l1103                   = &1103
l1104                   = &1104
l110b                   = &110b
l110c                   = &110c
l1140                   = &1140
l37e4                   = &37e4
l8000                   = &8000
l8d17                   = &8d17
l9d09                   = &9d09
la9ff                   = &a9ff
lbe00                   = &be00
lbf00                   = &bf00
crtc_address_register   = &fe00
crtc_address_write      = &fe01
video_ula_palette       = &fe21
user_via_t1c_l          = &fe64
user_via_t1c_h          = &fe65
user_via_t2c_l          = &fe68
user_via_t2c_h          = &fe69
oswrch                  = &ffee
osword                  = &fff1
osbyte                  = &fff4
oscli                   = &fff7

    org &1234

.pydis_start
    equb   0, &47, &11, &0b, &1d, &10, &27,   0,   0, &20, &b7, &0a   ; 1234: 00 47 11... .G.
    equb &a9, &ff, &85, &31, &a9, &0f, &a2,   0, &20, &f4, &ff, &a9   ; 1240: a9 ff 85... ...
    equb &30, &8d, &ec,   9, &a9, &35, &8d, &ed,   9, &a9, &31, &8d   ; 124c: 30 8d ec... 0..
    equb &ee,   9, &a2,   0, &ac, &7f, &0a, &c0, &52, &d0, &0e, &e6   ; 1258: ee 09 a2... ...
    equb &5f, &a5, &5f, &29,   3, &0a, &0a, &69, &41, &a8, &20, &ef   ; 1264: 5f a5 5f... _._
    equb &0a, &a5, &30, &85, &50, &a5, &31, &85, &51, &86, &30, &84   ; 1270: 0a a5 30... ..0
    equb &31, &8c, &ea,   9, &a5, &31, &c5, &37, &f0, &20, &8d, &76   ; 127c: 31 8c ea... 1..
    equb &12, &a9, &72, &85, &70, &a9, &12, &85, &71, &a2, &d5, &a0   ; 1288: 12 a9 72... ..r
    equb &3a, &a9, &ff, &20, &dc, &16, &f0,   6, &20, &17             ; 1294: 3a a9 ff... :..
    equs "6LO"                                                        ; 129e: 36 4c 4f    6LO
    equb &11, &a5, &31, &85, &37, &a9, &0f, &a2,   0, &20, &f4, &ff   ; 12a1: 11 a5 31... ..1
    equb &a9,   0, &8d, &b3,   9, &8d, &b4,   9, &a0,   2, &a9,   0   ; 12ad: a9 00 8d... ...
    equb &99, &a8,   9, &99, &b3,   9, &99, &50,   9, &99, &66,   9   ; 12b9: 99 a8 09... ...
    equb &99, &7c,   9, &99, &92,   9, &a9,   1, &99, &be,   9, &a9   ; 12c5: 99 7c 09... .|.
    equb &ff, &99, &ac, &38, &99, &c2, &38, &c8, &c0, &0b, &90, &da   ; 12d1: ff 99 ac... ...
    equb &a5, &31, &c5, &51, &f0, &57, &a9,   0, &8d, &33, &24, &85   ; 12dd: a5 31 c5... .1.
    equb &48, &85, &4d, &8d, &a8,   9, &85, &52, &8d, &b6, &2e, &8d   ; 12e9: 48 85 4d... H.M
    equb &b7, &2e, &8d, &d5,   9, &8d, &a9,   9, &a9,   4, &8d, &df   ; 12f5: b7 2e 8d... ...
    equb   9, &8d, &d4,   9, &a9,   1, &8d, &be,   9, &a9,   0, &a0   ; 1301: 09 8d d4... ...
    equb &0f, &99, &6f, &0a, &88, &10, &fa, &20, &78, &12, &a9, &d3   ; 130d: 0f 99 6f... ..o
    equb &8d, &b3, &0a, &a9, &16, &8d, &b4, &0a, &ad, &0a, &11, &d0   ; 1319: 8d b3 0a... ...
    equb   3, &20,   0, &0c, &a9,   0, &8d                            ; 1325: 03 20 00... . .

; &132c referenced 1 time by &3f0f
.sub_c132c
    lsr l8d17,x                                                       ; 132c: 5e 17 8d    ^..
    rts                                                               ; 132f: 60          `

    equb &17, &20, &80, &29, &20, &a1                                 ; 1330: 17 20 80... . .
    equs ") 1"                                                        ; 1336: 29 20 31    ) 1
    equb   1, &20, &66, &17, &a9,   0, &8d, &d7, &31, &a2,   3, &9d   ; 1339: 01 20 66... . f
    equb &6f, &39, &ca, &10, &fa, &ae, &d7, &3a, &ac, &d8             ; 1345: 6f 39 ca... o9.
    equs ": f"                                                        ; 134f: 3a 20 66    : f
    equb &19, &a5, &31, &38, &e9, &41, &aa, &bd, &ef,   9, &29, &80   ; 1352: 19 a5 31... ..1
    equb &f0,   5, &a9, &21, &20, &bd, &2b, &a9,   3, &85, &3e, &a9   ; 135e: f0 05 a9... ...
    equb   0, &85, &42, &8d, &60, &17, &20, &a1, &29, &20, &f4, &1d   ; 136a: 00 85 42... ..B
    equb &a9                                                          ; 1376: a9          .
; &1377 referenced 1 time by &173f
.l1377
    equb   0, &85,   4, &a5, &31, &38, &e9, &41                       ; 1377: 00 85 04... ...

; &137f referenced 1 time by &175d
.c137f
    tax                                                               ; 137f: aa          .
    lda l09ef,x                                                       ; 1380: bd ef 09    ...
    and #&f8                                                          ; 1383: 29 f8       ).
    ora l0030                                                         ; 1385: 05 30       .0
    ora #&40 ; '@'                                                    ; 1387: 09 40       .@
    sta l09ef,x                                                       ; 1389: 9d ef 09    ...
    lda l0030                                                         ; 138c: a5 30       .0
    asl a                                                             ; 138e: 0a          .
    tay                                                               ; 138f: a8          .
    ldx l3adf,y                                                       ; 1390: be df 3a    ..:
    lda l3ae0,y                                                       ; 1393: b9 e0 3a    ..:
    tay                                                               ; 1396: a8          .
    txa                                                               ; 1397: 8a          .
    clc                                                               ; 1398: 18          .
    adc #2                                                            ; 1399: 69 02       i.
    tax                                                               ; 139b: aa          .
    tya                                                               ; 139c: 98          .
    adc #0                                                            ; 139d: 69 00       i.
    tay                                                               ; 139f: a8          .
    jmp c1966                                                         ; 13a0: 4c 66 19    Lf.

    equs "dataA"                                                      ; 13a3: 64 61 74... dat
    equb &0d, &a5, &31, &38, &e9, &41, &aa, &bd, &ef,   9, &29,   7   ; 13a8: 0d a5 31... ..1
    equb &85, &30, &bd, &ef,   9, &29, &40, &d0, &0f, &ad, &dd, &3a   ; 13b4: 85 30 bd... .0.
    equb &85, &30, &ad,   3, &11, &10,   5, &ad, &de, &3a, &85, &30   ; 13c0: 85 30 ad... .0.
    equb &a5, &30, &0a, &a8, &b9, &df, &3a, &85, &70, &b9, &e0, &3a   ; 13cc: a5 30 0a... .0.
    equb &85, &71, &a0,   0, &b1, &70, &aa, &c8, &b1, &70, &a8, &a9   ; 13d8: 85 71 a0... .q.
    equb   0, &85, &3b, &a9,   0, &4c, &5d, &1f, &a9, &ff, &8d, &2b   ; 13e4: 00 85 3b... ..;
    equb &13, &ae, &d9, &3a, &ac, &da                                 ; 13f0: 13 ae d9... ...
    equs ": f"                                                        ; 13f6: 3a 20 66    : f
    equb &19, &a9,   0, &8d, &2b, &13, &a5, &31, &c5, &51, &f0,   5   ; 13f9: 19 a9 00... ...
    equb &a9,   4                                                     ; 1405: a9 04       ..
    equs " 7#` "                                                      ; 1407: 20 37 23...  7#
    equb &d7, &1f, &ad, &60, &17, &d0, &1a, &ad, &5d, &17, &8d, &5e   ; 140c: d7 1f ad... ...
    equb &17, &ad, &5f, &17, &8d, &60, &17, &20, &8c, &17, &a9,   0   ; 1418: 17 ad 5f... .._
    equb &8d, &8b, &17, &20, &8f, &3a, &20, &a2, &3a, &ad, &8b, &17   ; 1424: 8d 8b 17... ...
    equb &c9,   4, &b0,   3, &20, &8c, &17                            ; 1430: c9 04 b0... ...
    equs " 8* "                                                       ; 1437: 20 38 2a...  8*
    equb &1e, &13, &20, &a2, &3a, &20, &cd, &22, &ae, &d9, &3a, &ac   ; 143b: 1e 13 20... ..
    equb &da                                                          ; 1447: da          .
    equs ": f"                                                        ; 1448: 3a 20 66    : f
    equb &19, &4c, &c3, &18, &ad, &8b, &17, &c9,   5, &90, &f9, &a9   ; 144b: 19 4c c3... .L.
    equb   0, &8d, &8b, &17, &60,   0, &a2, &11, &a0, &0b, &c9, &c7   ; 1457: 00 8d 8b... ...
    equb &f0, &42, &a2, &93, &a0, &0b, &c9, &c6, &f0, &3a, &a2, &c5   ; 1463: f0 42 a2... .B.
    equb &a0, &0b, &c9, &c5, &f0, &32, &a6, &54, &a4, &55, &c9, &c8   ; 146f: a0 0b c9... ...
    equb &90, &11, &e9, &c8, &48, &a9, &d5, &18, &6d, &d5, &3a        ; 147b: 90 11 e9... ...
; &1486 referenced 2 times by &1583, &1599
.l1486
    equb &aa                                                          ; 1486: aa          .
; &1487 referenced 2 times by &1588, &159c
.l1487
    equb &a9                                                          ; 1487: a9          .
; &1488 referenced 1 time by &158d
.l1488
    equb &3a                                                          ; 1488: 3a          :
; &1489 referenced 1 time by &1592
.l1489
    equb &6d, &d6, &3a, &a8, &68, &86, &58, &84, &59, &0a, &a8, &a5   ; 1489: 6d d6 3a... m.:
    equb &59, &85, &5a, &69,   0, &85, &59, &b1                       ; 1495: 59 85 5a... Y.Z
    equs "XeX"                                                        ; 149d: 58 65 58    XeX
    equb &aa, &c8, &b1                                                ; 14a0: aa c8 b1    ...
    equs "XeZ"                                                        ; 14a3: 58 65 5a    XeZ
    equb &a8, &60,   1,   2,   4,   8, &10, &20, &40, &80, &a9,   0   ; 14a6: a8 60 01... .`.
    equb &85, &15, &a9,   1, &85, &1d, &68, &a8, &68, &aa             ; 14b2: 85 15 a9... ...
    equs "h`H"                                                        ; 14bc: 68 60 48    h`H
    equb &8a, &48, &98, &48, &a5, &16, &20, &2c, &13, &86, &70, &84   ; 14bf: 8a 48 98... .H.
    equb &71, &a5, &15, &29,   1, &f0, &14, &a5, &14, &20, &2c, &13   ; 14cb: 71 a5 15... q..
    equb &86, &7e, &84, &7f, &a0,   3, &b1, &70, &91, &7e, &88, &10   ; 14d7: 86 7e 84... .~.
    equb &f9, &84, &80, &a0,   0, &b1, &70, &a6, &1d, &10,   2, &49   ; 14e3: f9 84 80... ...
    equb &ff, &a2,   0,   9,   0, &10,   1, &ca, &18, &65, &18, &85   ; 14ef: ff a2 00... ...
    equb &74, &8a, &65, &19, &85, &75, &a2,   0, &c8, &b1, &70, &10   ; 14fb: 74 8a 65... t.e
    equb   1, &ca, &18, &65, &1a, &85, &76, &8a, &65, &1b, &85, &77   ; 1507: 01 ca 18... ...
    equb &c8, &b1, &70, &85                                           ; 1513: c8 b1 70... ..p

; &1517 referenced 1 time by &159f
.c1517
    sta (l00a0,x)                                                     ; 1517: 81 a0       ..
    equb   4, &b1, &70, &85, &7d, &84, &79, &a9,   4, &85, &87, &20   ; 1519: 04 b1 70... ..p
    equb &2f, &16, &a5, &77, &85, &73, &a5, &76, &29, &f8, &0a, &26   ; 1525: 2f 16 a5... /..
    equb &73, &0a, &26, &73, &0a, &26, &73, &85, &72, &a6, &73, &0a   ; 1531: 73 0a 26... s.&
    equb &26, &73, &0a, &26, &73, &a5, &74, &29, &f8, &18, &65, &72   ; 153d: 26 73 0a... &s.
    equb &85, &72, &85, &7b, &8a, &65, &73, &18, &65, &75, &10,   3   ; 1549: 85 72 85... .r.
    equb &4c, &7f, &13, &18, &65, &4c, &85, &73, &85, &7c, &a5, &74   ; 1555: 4c 7f 13... L..
    equb &29,   7, &49,   7, &a8, &a5, &76                            ; 1561: 29 07 49... ).I

; &1568 referenced 1 time by &1678
.c1568
    and #7                                                            ; 1568: 29 07       ).
    sta l0084                                                         ; 156a: 85 84       ..
    ldx l0087                                                         ; 156c: a6 87       ..
    lda l0015                                                         ; 156e: a5 15       ..
    and #1                                                            ; 1570: 29 01       ).
    beq c1577                                                         ; 1572: f0 03       ..
    jmp l160c                                                         ; 1574: 4c 0c 16    L..

; &1577 referenced 1 time by &1572
.c1577
    lda l0015                                                         ; 1577: a5 15       ..
    and #6                                                            ; 1579: 29 06       ).
    beq c159f                                                         ; 157b: f0 22       ."
    and #4                                                            ; 157d: 29 04       ).
    bne c1597                                                         ; 157f: d0 16       ..
; &1581 referenced 2 times by &16a2, &16f1
.c1581
    lda #&18                                                          ; 1581: a9 18       ..
    sta l1486                                                         ; 1583: 8d 86 14    ...
    lda #&4c ; 'L'                                                    ; 1586: a9 4c       .L
.sub_c1588
l1589 = sub_c1588+1
    sta l1487                                                         ; 1588: 8d 87 14    ...
; &1589 referenced 1 time by &174c
    lda #&98                                                          ; 158b: a9 98       ..
    sta l1488                                                         ; 158d: 8d 88 14    ...
    lda #&14                                                          ; 1590: a9 14       ..
.sub_c1592
l1593 = sub_c1592+1
    sta l1489                                                         ; 1592: 8d 89 14    ...
; &1593 referenced 1 time by &167f
    bne c159f                                                         ; 1595: d0 08       ..
; &1597 referenced 1 time by &157f
.c1597
    lda #&38 ; '8'                                                    ; 1597: a9 38       .8
    sta l1486                                                         ; 1599: 8d 86 14    ...
    sta l1487                                                         ; 159c: 8d 87 14    ...
; &159f referenced 2 times by &157b, &1595
.c159f
    jmp c1517                                                         ; 159f: 4c 17 15    L..

    equb   6, &7d, &18, &4c, &9c, &14, &a9,   0, &85, &88, &4c, &b7   ; 15a2: 06 7d 18... .}.
    equb &14, &a5, &88, &f0, &ef, &b1, &72,   6, &7d, &90, &10,   5   ; 15ae: 14 a5 88... ...
    equb &82, &91, &72, &88, &10, &28, &a0,   7, &a5, &72, &e9, &40   ; 15ba: 82 91 72... ..r
    equb &4c, &a5, &14, &25, &83, &91, &72, &88, &10, &18, &a0,   7   ; 15c6: 4c a5 14... L..
    equb &a5, &72, &e9, &3f, &85, &72, &a5, &73, &e9,   1, &85, &73   ; 15d2: a5 72 e9... .r.
    equb &85, &88, &c9, &80, &b0, &c4, &c5, &4c, &90, &c0, &ca, &10   ; 15de: 85 88 c9... ...
    equb &0e, &84, &7a, &e6, &79, &a4, &79, &b1, &70, &85, &7d, &a2   ; 15ea: 0e 84 7a... ..z
    equb   3, &a4, &7a,   6, &7d, &90, &b2,   6, &7d, &90, &cc, &c6   ; 15f6: 03 a4 7a... ..z
    equb &81, &f0, &55, &a5, &7c, &85, &73, &a5, &7b, &85             ; 1602: 81 f0 55... ..U
; &160c referenced 2 times by &1574, &1721
.l160c
    equb &72, &a4, &1d, &30, &1e, &a4, &78, &88, &10, &32, &e6, &85   ; 160c: 72 a4 1d... r..
    equb &a4, &85, &c0, &28, &b0, &3c, &a0,   7, &69,   8, &85, &7b   ; 1618: a4 85 c0... ...
    equb &85, &72, &90, &20, &e6, &7c, &e6, &73, &4c, &17, &15, &a4   ; 1624: 85 72 90... .r.
    equb &78, &c8, &c0,   8, &90, &12, &c6, &85, &30, &20, &a0,   0   ; 1630: 78 c8 c0... x..
    equb &e9,   8, &85, &7b, &85, &72, &b0,   4, &c6, &7c, &c6, &73   ; 163c: e9 08 85... ...
    equb &84, &78, &b9, &77, &13, &85, &82, &49, &ff, &85, &83, &a4   ; 1648: 84 78 b9... .x.
    equb &84, &a5, &73, &4c, &ad, &14, &a9, &90, &8d, &86, &14, &a9   ; 1654: 84 a5 73... ..s
    equb &10, &8d, &87, &14, &a9,   5, &8d, &88, &14, &a9, &82, &8d   ; 1660: 10 8d 87... ...
    equb &89, &14, &4c, &7f, &13                                      ; 166c: 89 14 4c... ..L

; &1671 referenced 1 time by &1684
.loop_c1671
    asl l007d                                                         ; 1671: 06 7d       .}
    sec                                                               ; 1673: 38          8
    rol l0080                                                         ; 1674: 26 80       &.
    asl l0080                                                         ; 1676: 06 80       ..
    jmp c1568                                                         ; 1678: 4c 68 15    Lh.

; &167b referenced 2 times by &16be, &16c2
.c167b
    lda #0                                                            ; 167b: a9 00       ..
    sta l0088                                                         ; 167d: 85 88       ..
    jmp l1593                                                         ; 167f: 4c 93 15    L..

; &1682 referenced 1 time by &16de
.c1682
    lda l0088                                                         ; 1682: a5 88       ..
    beq loop_c1671                                                    ; 1684: f0 eb       ..
    asl l0080                                                         ; 1686: 06 80       ..
    lda (l0072),y                                                     ; 1688: b1 72       .r
    bit l0082                                                         ; 168a: 24 82       $.
    bne c168f                                                         ; 168c: d0 01       ..
    clc                                                               ; 168e: 18          .
; &168f referenced 1 time by &168c
.c168f
    rol l0080                                                         ; 168f: 26 80       &.
    asl l007d                                                         ; 1691: 06 7d       .}
    bcc c16a5                                                         ; 1693: 90 10       ..
    ora l0082                                                         ; 1695: 05 82       ..
    sta (l0072),y                                                     ; 1697: 91 72       .r
    dey                                                               ; 1699: 88          .
    bpl c16c4                                                         ; 169a: 10 28       .(
    ldy #7                                                            ; 169c: a0 07       ..
    lda l0072                                                         ; 169e: a5 72       .r
    sbc #&40 ; '@'                                                    ; 16a0: e9 40       .@
    jmp c1581                                                         ; 16a2: 4c 81 15    L..

; &16a5 referenced 1 time by &1693
.c16a5
    and l0083                                                         ; 16a5: 25 83       %.
    sta (l0072),y                                                     ; 16a7: 91 72       .r
    dey                                                               ; 16a9: 88          .
    bpl c16c4                                                         ; 16aa: 10 18       ..
    ldy #7                                                            ; 16ac: a0 07       ..
    lda l0072                                                         ; 16ae: a5 72       .r
    sbc #&3f ; '?'                                                    ; 16b0: e9 3f       .?
    sta l0072                                                         ; 16b2: 85 72       .r
    lda l0073                                                         ; 16b4: a5 73       .s
    sbc #1                                                            ; 16b6: e9 01       ..
    sta l0073                                                         ; 16b8: 85 73       .s
    sta l0088                                                         ; 16ba: 85 88       ..
    cmp #&80                                                          ; 16bc: c9 80       ..
    bcs c167b                                                         ; 16be: b0 bb       ..
    cmp l004c                                                         ; 16c0: c5 4c       .L
    bcc c167b                                                         ; 16c2: 90 b7       ..
; &16c4 referenced 3 times by &169a, &16aa, &16e9
.c16c4
    dex                                                               ; 16c4: ca          .
    bpl c16dc                                                         ; 16c5: 10 15       ..
    sty l007a                                                         ; 16c7: 84 7a       .z
    ldy l0079                                                         ; 16c9: a4 79       .y
    lda l0080                                                         ; 16cb: a5 80       ..
    sta (l007e),y                                                     ; 16cd: 91 7e       .~
    iny                                                               ; 16cf: c8          .
    sty l0079                                                         ; 16d0: 84 79       .y
    lda (l0070),y                                                     ; 16d2: b1 70       .p
    sta l007d                                                         ; 16d4: 85 7d       .}
    stx l0080                                                         ; 16d6: 86 80       ..
    ldx #3                                                            ; 16d8: a2 03       ..
    ldy l007a                                                         ; 16da: a4 7a       .z
; &16dc referenced 4 times by &16c5, &36f4, &3e69, &3e9b
.c16dc
    asl l007d                                                         ; 16dc: 06 7d       .}
    bcc c1682                                                         ; 16de: 90 a2       ..
    rol l0080                                                         ; 16e0: 26 80       &.
    asl l007d                                                         ; 16e2: 06 7d       .}
    bcs c16f4                                                         ; 16e4: b0 0e       ..
    rol l0080                                                         ; 16e6: 26 80       &.
    dey                                                               ; 16e8: 88          .
    bpl c16c4                                                         ; 16e9: 10 d9       ..
    ldy #7                                                            ; 16eb: a0 07       ..
    lda l0072                                                         ; 16ed: a5 72       .r
    sbc #&40 ; '@'                                                    ; 16ef: e9 40       .@
    jmp c1581                                                         ; 16f1: 4c 81 15    L..

; &16f4 referenced 1 time by &16e4
.c16f4
    rol l0080                                                         ; 16f4: 26 80       &.
    dec l0081                                                         ; 16f6: c6 81       ..
    beq c174f                                                         ; 16f8: f0 55       .U
    lda l007c                                                         ; 16fa: a5 7c       .|
    sta l0073                                                         ; 16fc: 85 73       .s
    lda l007b                                                         ; 16fe: a5 7b       .{
    sta l0072                                                         ; 1700: 85 72       .r
    ldy l001d                                                         ; 1702: a4 1d       ..
    bmi c1724                                                         ; 1704: 30 1e       0.
    ldy l0078                                                         ; 1706: a4 78       .x
    dey                                                               ; 1708: 88          .
    bpl c173d                                                         ; 1709: 10 32       .2
    inc l0085                                                         ; 170b: e6 85       ..
    ldy l0085                                                         ; 170d: a4 85       ..
    cpy #&28 ; '('                                                    ; 170f: c0 28       .(
    bcs c174f                                                         ; 1711: b0 3c       .<
    ldy #7                                                            ; 1713: a0 07       ..
    adc #8                                                            ; 1715: 69 08       i.
    sta l007b                                                         ; 1717: 85 7b       .{
    sta l0072                                                         ; 1719: 85 72       .r
    bcc c173d                                                         ; 171b: 90 20       .
    inc l007c                                                         ; 171d: e6 7c       .|
    inc l0073                                                         ; 171f: e6 73       .s
    jmp l160c                                                         ; 1721: 4c 0c 16    L..

; &1724 referenced 1 time by &1704
.c1724
    ldy l0078                                                         ; 1724: a4 78       .x
    iny                                                               ; 1726: c8          .
; overlapping: cpy #8                                                 ; 1727: c0 08       ..
    equb &c0                                                          ; 1727: c0          .

; &1728 referenced 1 time by &36c9
.sub_c1728
    php                                                               ; 1728: 08          .
    bcc c173d                                                         ; 1729: 90 12       ..
    dec l0085                                                         ; 172b: c6 85       ..
    bmi c174f                                                         ; 172d: 30 20       0
    ldy #0                                                            ; 172f: a0 00       ..
    sbc #8                                                            ; 1731: e9 08       ..
    sta l007b                                                         ; 1733: 85 7b       .{
    sta l0072                                                         ; 1735: 85 72       .r
    bcs c173d                                                         ; 1737: b0 04       ..
    dec l007c                                                         ; 1739: c6 7c       .|
    dec l0073                                                         ; 173b: c6 73       .s
; &173d referenced 4 times by &1709, &171b, &1729, &1737
.c173d
    sty l0078                                                         ; 173d: 84 78       .x
    lda l1377,y                                                       ; 173f: b9 77 13    .w.
    sta l0082                                                         ; 1742: 85 82       ..
    eor #&ff                                                          ; 1744: 49 ff       I.
    sta l0083                                                         ; 1746: 85 83       ..
    ldy l0084                                                         ; 1748: a4 84       ..
    lda l0073                                                         ; 174a: a5 73       .s
    jmp l1589                                                         ; 174c: 4c 89 15    L..

; &174f referenced 3 times by &16f8, &1711, &172d
.c174f
    lda l0080                                                         ; 174f: a5 80       ..
    dex                                                               ; 1751: ca          .
    bmi c1759                                                         ; 1752: 30 05       0.
; &1754 referenced 1 time by &1757
.loop_c1754
    asl a                                                             ; 1754: 0a          .
    asl a                                                             ; 1755: 0a          .
    dex                                                               ; 1756: ca          .
    bpl loop_c1754                                                    ; 1757: 10 fb       ..
; &1759 referenced 1 time by &1752
.c1759
    ldy l0079                                                         ; 1759: a4 79       .y
    sta (l007e),y                                                     ; 175b: 91 7e       .~
; &175d referenced 1 time by &18b3
.c175d
l175f = c175d+2
    jmp c137f                                                         ; 175d: 4c 7f 13    L..

; &175f referenced 1 time by &18b8
    equb &a4                                                          ; 1760: a4          .
; &1761 referenced 1 time by &18b0
.l1761
    equb &75, &c8, &c0,   3, &b0,   7, &a4, &77, &c8, &c0,   3, &90   ; 1761: 75 c8 c0... u..
    equb   3, &4c, &ce, &16, &a5, &74, &85, &85, &a5                  ; 176d: 03 4c ce... .L.
    equs "uJf"                                                        ; 1776: 75 4a 66    uJf
    equb &85, &4a, &66, &85, &4a, &66, &85, &a5, &1d, &30, &1d, &a5   ; 1779: 85 4a 66... .Jf
    equb &85, &30,   7, &c9, &28, &90, &72, &4c, &ce, &16, &a9,   0   ; 1785: 85 30 07... .0.
    equb &38, &e5, &74, &85, &86, &a9,   0, &85, &74, &85, &75, &85   ; 1791: 38 e5 74... 8.t
    equb &85, &4c, &8a, &16, &a5, &85, &30, &5a, &c9, &28, &90, &55   ; 179d: 85 4c 8a... .L.
    equb &a5, &74, &e9, &3f, &85, &86, &a9, &3f, &85, &74, &a9,   1   ; 17a9: a5 74 e9... .t.
    equb &85, &75, &a9, &27, &85, &85, &a5, &86, &c5, &81, &b0, &3e   ; 17b5: 85 75 a9... .u.
    equb &a5, &7d, &a6, &87, &a4, &79, &ca, &10, &11, &a5, &15, &29   ; 17c1: a5 7d a6... .}.
    equb   1, &f0,   6, &a5, &80, &91, &7e, &86, &80, &c8, &b1, &70   ; 17cd: 01 f0 06... ...
    equb &a2,   3, &0a, &b0,   8, &26, &80, &0a, &26, &80, &4c, &96   ; 17d9: a2 03 0a... ...
    equb &16, &26, &80, &0a, &b0,   5, &26, &80, &4c, &96, &16, &26   ; 17e5: 16 26 80... .&.
    equb &80, &c6, &81, &c6, &86, &d0, &cf, &85, &7d, &86, &87, &84   ; 17f1: 80 c6 81... ...
    equs "y`hhL"                                                      ; 17fd: 79 60 68... y`h
    equb &7f, &13, &a0,   0, &b1, &fd, &85,   2, &4c, &13, &17, &86   ; 1802: 7f 13 a0... ...
    equb &72, &84, &73, &a2,   0, &86, &74, &86, &75, &86, &78, &86   ; 180e: 72 84 73... r.s
    equb &79, &86, &7c, &86, &7d, &86, &80, &86, &81, &a8, &f0,   2   ; 181a: 79 86 7c... y.|
    equb &86, &76, &a2,   0, &86,   2, &ba, &86,   3, &78, &ae, &b3   ; 1826: 86 76 a2... .v.
    equb &0a, &8e,   2,   2, &ae, &b4, &0a, &8e,   3,   2, &58, &a2   ; 1832: 0a 8e 02... ...
    equb &70, &a0,   0, &20, &dd, &ff, &78, &ae, &b1, &0a, &8e,   2   ; 183e: 70 a0 00... p..
    equb   2, &ae, &b2, &0a, &8e,   3,   2, &58, &a6,   3, &9a, &a5   ; 184a: 02 ae b2... ...
    equb   2, &f0, &24, &ad, &0a, &11, &f0, &1f, &a9,   7, &20, &ee   ; 1856: 02 f0 24... ..$
    equb &ff, &a9, &12, &8d                                           ; 1862: ff a9 12... ...

; &1866 referenced 1 time by &3879
.sub_c1866
    ora #4                                                            ; 1866: 09 04       ..
    jsr l040a                                                         ; 1868: 20 0a 04     ..
    lda #&0a                                                          ; 186b: a9 0a       ..
    jsr oswrch                                                        ; 186d: 20 ee ff     ..            ; Write character 10
    ldx #&52 ; 'R'                                                    ; 1870: a2 52       .R
    ldy #&17                                                          ; 1872: a0 17       ..
    jsr sub_c37f3                                                     ; 1874: 20 f3 37     .7
    jsr sub_c388d                                                     ; 1877: 20 8d 38     .8
    jsr sub_c388d                                                     ; 187a: 20 8d 38     .8
    jsr sub_c3a8f                                                     ; 187d: 20 8f 3a     .:
    lda l0002                                                         ; 1880: a5 02       ..
    rts                                                               ; 1882: 60          `

    equb &8f, &a2, &b8, &a0, &eb, &ae, &b9, &b9, &a4, &b9, &c6,   0   ; 1883: 8f a2 b8... ...
    equb   0,   0,   0,   3,   2,   7,   1, &ff, &a9,   7, &8d, &5d   ; 188f: 00 00 00... ...
    equb &17, &8d, &5f, &17, &ad, &65, &17, &f0, &17, &a4, &31        ; 189b: 17 8d 5f... .._

; &18a6 referenced 1 time by &3f56
.sub_c18a6
    jsr l0ad4                                                         ; 18a6: 20 d4 0a     ..
    tya                                                               ; 18a9: 98          .
    sec                                                               ; 18aa: 38          8
    sbc #&41 ; 'A'                                                    ; 18ab: e9 41       .A
    and #3                                                            ; 18ad: 29 03       ).
    tax                                                               ; 18af: aa          .
    lda l1761,x                                                       ; 18b0: bd 61 17    .a.
    sta c175d                                                         ; 18b3: 8d 5d 17    .].
    lda #6                                                            ; 18b6: a9 06       ..
    sta l175f                                                         ; 18b8: 8d 5f 17    ._.
    rts                                                               ; 18bb: 60          `

    equb   0, &a9, &13, &4c, &f4, &ff, &8a, &18, &69, &ff, &98, &69   ; 18bc: 00 a9 13... ...
    equb   0, &49, &ff, &cd, &49, &fe, &90, &fb, &60, &48, &a5, &fc   ; 18c8: 00 49 ff... .I.
    equb &48, &8a, &48, &98, &48, &20, &b9, &17, &20, &fa, &17, &68   ; 18d4: 48 8a 48... H.H
    equb &a8, &68, &aa, &68, &85, &fc, &68, &6c, &b5, &0a, &a9,   2   ; 18e0: a8 68 aa... .h.
    equb &2c, &4d, &fe, &f0, &39, &ad,   4, &11, &8d, &44, &fe, &ad   ; 18ec: 2c 4d fe... ,M.
    equb   5, &11, &8d, &45, &fe, &ad,   8, &11, &8d, &46, &fe, &ad   ; 18f8: 05 11 8d... ...
    equb   9, &11, &8d, &47, &fe, &a9, &ff, &8d, &49, &fe, &a2,   1   ; 1904: 09 11 8d... ...
    equb &ac, &5e, &17, &20, &25, &18, &ad,   3, &11, &10,   7, &a2   ; 1910: ac 5e 17... .^.
    equb   0, &a0,   5, &20, &25, &18, &a9,   0, &8d, &24, &18, &ee   ; 191c: 00 a0 05... ...
    equb &8b, &17, &60, &a9                                           ; 1928: 8b 17 60... ..`
    equs "@,M"                                                        ; 192c: 40 2c 4d    @,M
    equb &fe, &f0, &22, &ad, &24, &18, &d0, &1d, &a2,   1, &ac, &60   ; 192f: fe f0 22... .."
    equb &17, &20, &25, &18, &ad,   3, &11, &10,   7, &a2,   0, &a0   ; 193b: 17 20 25... . %
    equb   0, &20, &25, &18, &ee, &24, &18, &20, &12                  ; 1947: 00 20 25... . %
    equs ": G:`"                                                      ; 1950: 3a 20 47... : G
    equb   0, &8a, &4a,   8, &98, &49,   7, &0a, &28, &6a, &a2,   7   ; 1955: 00 8a 4a... ..J

; &1961 referenced 1 time by &1967
.loop_c1961
    sta video_ula_palette                                             ; 1961: 8d 21 fe    .!.
    adc #&10                                                          ; 1964: 69 10       i.
; &1966 referenced 1 time by &13a0
.c1966
    dex                                                               ; 1966: ca          .
    bpl loop_c1961                                                    ; 1967: 10 f8       ..
    rts                                                               ; 1969: 60          `

    equb &20, &8c, &17, &20,   0                                      ; 196a: 20 8c 17...  ..
; &196f referenced 2 times by &37f8, &3e79
.l196f
    equb   4, &20, &45, &18, &4c,   0, &0c, &78, &a9, &0c, &8d, &30   ; 196f: 04 20 45... . E
    equb &fe, &a0,   0, &b9,   0, &be, &99,   0, &0c, &b9,   0, &bf   ; 197b: fe a0 00... ...
    equb &99,   0, &0b, &c8, &d0, &f1, &a5, &f4, &8d, &30, &fe, &58   ; 1987: 99 00 0b... ...
    equb &8c, &87,   2, &60, &c9, &21, &90, &39, &c9, &7f, &b0, &35   ; 1993: 8c 87 02... ...
    equb &85, &60, &8a, &48, &98, &48, &a9, &0a, &a2, &60, &a0,   0   ; 199f: 85 60 8a... .`.
    equb &20, &f1, &ff                                                ; 19ab: 20 f1 ff     ..
    equs "FaFb"                                                       ; 19ae: 46 61 46... FaF
    equb   6, &66,   6, &67,   6, &68, &a9, &17, &20, &ee, &ff, &a9   ; 19b2: 06 66 06... .f.
    equb &ff, &20, &ee, &ff, &a2,   0, &b5, &61, &20, &ee, &ff, &e8   ; 19be: ff 20 ee... . .
    equb &e0,   8, &90, &f6, &68, &a8, &68, &aa, &a9, &ff, &4c, &ee   ; 19ca: e0 08 90... ...
    equb &ff, &85, &39, &48, &a5,   8                                 ; 19d6: ff 85 39... ..9
    equs "JJJE"                                                       ; 19dc: 4a 4a 4a... JJJ
    equb &0a, &6a, &26,   6, &26,   7, &26,   8, &26,   9, &26, &0a   ; 19e0: 0a 6a 26... .j&
    equb &46, &39, &d0, &ea, &68, &25,   6, &60, &ad, &66,   9, &30   ; 19ec: 46 39 d0... F9.
    equb &41, &f0,   7, &ad, &50,   9, &c9, &40, &b0, &4e, &ad, &7c   ; 19f8: 41 f0 07... A..
    equb   9, &38, &ed, &87,   9, &f0, &2c, &ad, &92,   9, &ed, &9d   ; 1a04: 09 38 ed... .8.
    equb   9, &85, &70, &a2,   0, &20, &d2, &24, &a5, &74, &18, &65   ; 1a10: 09 85 70... ..p
    equb &76, &85, &7a, &a5                                           ; 1a1c: 76 85 7a... v.z
    equs "uewJfzJfzJfzJfz"                                            ; 1a20: 75 65 77... uew
    equb &a5                                                          ; 1a2f: a5          .
    equs "z05"                                                        ; 1a30: 7a 30 35    z05
    equb &c9, &18, &b0, &4b, &a9,   0, &60, &a2,   1, &bd, &50,   9   ; 1a33: c9 18 b0... ...
    equb &18, &69, &40, &9d, &50,   9, &a9,   1, &9d, &66,   9, &ca   ; 1a3f: 18 69 40... .i@
    equb &10, &ef, &a9,   1, &60, &a2,   1, &bd, &50,   9, &38, &e9   ; 1a4b: 10 ef a9... ...
    equb &40, &9d, &50,   9, &a9,   0, &e9,   0, &9d, &66,   9, &ca   ; 1a57: 40 9d 50... @.P
    equb &10, &ed, &a9,   4, &60, &a5, &70, &10, &cb, &a2,   1, &bd   ; 1a63: 10 ed a9... ...
    equb &7c,   9, &18, &69, &c0, &9d, &7c,   9, &a9,   0, &9d, &92   ; 1a6f: 7c 09 18... |..
    equb   9, &ca, &10, &ef, &a9,   8, &60, &a5, &70, &30, &b1, &a2   ; 1a7b: 09 ca 10... ...
    equb   1, &bd, &7c,   9, &38, &e9, &c0, &9d, &7c,   9, &ca, &10   ; 1a87: 01 bd 7c... ..|
    equb &f4, &a9,   2, &60, &8e, &6d, &19, &8c, &6e, &19, &4c,   0   ; 1a93: f4 a9 02... ...
    equb   0, &a9, &80, &85, &70, &a9, &19, &85, &71, &a6, &54, &a4   ; 1a9f: 00 a9 80... ...
    equb &55, &a9, &ff, &4c, &dc, &16                                 ; 1aab: 55 a9 ff... U..
    equs "sprdata"                                                    ; 1ab1: 73 70 72... spr
    equb &0d, &8d, &0f, &1a, &8a, &48, &98, &48, &ad, &2b, &13, &f0   ; 1ab8: 0d 8d 0f... ...
    equb &51, &a5, &30, &cd, &ba, &1a, &d0, &47, &20, &fa, &1e, &c9   ; 1ac4: 51 a5 30... Q.0
    equb   3, &f0, &17, &a9,   3, &20, &bb, &1e, &c8, &a9             ; 1ad0: 03 f0 17... ...
    equs ": L"                                                        ; 1ada: 3a 20 4c    : L
    equb &1f, &88, &e8, &ad, &0f, &1a, &20, &5d, &1f, &a9,   1, &d0   ; 1add: 1f 88 e8... ...
    equb &1b, &ca, &a9,   3, &20, &bb, &1e, &e8, &a9, &ff, &85, &1d   ; 1ae9: 1b ca a9... ...
    equb &c8, &a9                                                     ; 1af5: c8 a9       ..
    equs ": L"                                                        ; 1af7: 3a 20 4c    : L
    equb &1f, &88, &ca, &ad, &0f, &1a, &20, &5d, &1f, &a9, &ff, &ae   ; 1afa: 1f 88 ca... ...
    equb &0f, &1a, &9d, &be,   9, &a9,   7, &20, &a6, &18, &9d, &d4   ; 1b06: 0f 1a 9d... ...
    equb   9, &4c, &f2, &19, &a5, &30, &cd, &ba, &1a, &d0,   6, &ae   ; 1b12: 09 4c f2... .L.
    equb &0f, &1a, &fe, &d4,   9, &a5, &30, &cd, &ba, &1a, &d0, &0e   ; 1b1e: 0f 1a fe... ...
    equb &ae, &0f, &1a, &bd, &d4,   9, &29,   7, &18, &69, &3c, &9d   ; 1b2a: ae 0f 1a... ...
    equb &a8,   9, &68, &a8, &68, &aa, &ad, &0f, &1a, &60,   0, &8d   ; 1b36: a8 09 68... ..h
    equb &ae, &1a, &8e, &af, &1a, &8c, &b0, &1a, &ee, &b1, &1a, &ad   ; 1b42: ae 1a 8e... ...
    equb &b1, &1a, &29,   7, &a8, &b9, &b2, &1a, &8d, &ed, &2e, &8d   ; 1b4e: b1 1a 29... ..)
    equb &f2, &2e, &a9, &21, &8d, &e8, &2e, &a5, &30, &cd, &ba, &1a   ; 1b5a: f2 2e a9... ...
    equb &d0, &67, &ad, &2b, &13, &d0, &1d, &ae, &ae, &1a, &a0, &0b   ; 1b66: d0 67 ad... .g.
    equb &20, &e2, &28, &f0, &13, &a5, &31, &38, &e9, &41, &a8, &b9   ; 1b72: 20 e2 28...  .(
    equb &ef,   9,   9, &80, &99, &ef,   9, &a9, &21, &20, &bd, &2b   ; 1b7e: ef 09 09... ...
    equb &ae, &ae, &1a, &a9, &c5, &9d, &ac, &38, &a9,   0, &9d, &a8   ; 1b8a: ae ae 1a... ...
    equb   9, &a5, &31, &38, &e9, &41, &a8, &b9, &ef,   9, &29, &80   ; 1b96: 09 a5 31... ..1
    equb &d0, &2b, &a9,   1, &9d, &be,   9, &ad, &b1, &1a, &29,   7   ; 1ba2: d0 2b a9... .+.
    equb &a8, &c0,   5, &90, &0d, &a9, &ff, &9d, &be,   9, &e6, &3a   ; 1bae: a8 c0 05... ...
    equb &98, &e9,   8, &49, &ff                                      ; 1bba: 98 e9 08... ...
    equs "8i", '"'                                                    ; 1bbf: 38 69 22    8i"
    equb &9d, &a8,   9, &8a, &ae, &af, &1a, &ac, &b0, &1a, &20, &5d   ; 1bc2: 9d a8 09... ...
    equb &1f, &a9,   0, &85, &3a, &85, &3b, &ad, &ae, &1a, &ae, &af   ; 1bce: 1f a9 00... ...
    equb &1a, &ac, &b0, &1a, &60,   0,   0,   0,   0                  ; 1bda: 1a ac b0... ...
    equs "'()*+*)("                                                   ; 1be3: 27 28 29... '()
    equb   0, &48, &84, &7d, &20, &17, &1e, &20, &66, &1b, &a5, &76   ; 1beb: 00 48 84... .H.
    equb &85, &74, &a5, &77, &85, &75, &a6, &40, &a4, &41, &86, &78   ; 1bf7: 85 74 a5... .t.
    equb &84, &79, &86, &7a, &84, &7b, &18, &a9,   0, &85, &7e, &a6   ; 1c03: 84 79 86... .y.
    equb &72, &a5, &70, &85, &7c, &a0,   7, &a5, &42, &f0, &23, &30   ; 1c0f: 72 a5 70... r.p
    equb &0d, &c9,   1, &18, &f0, &38, &e9,   0, &20, &a6, &18, &4c   ; 1c1b: 0d c9 01... ...
    equb &14, &1b, &29, &7f, &38, &e9,   1, &c5, &7e, &a5, &7e, &e6   ; 1c27: 14 1b 29... ..)
    equb &7e, &b0, &0f, &a9,   0, &85, &7e, &4c, &14, &1b, &a5, &7c   ; 1c33: 7e b0 0f... ~..
    equb &4a, &a5                                                     ; 1c3f: 4a a5       J.
    equs "}*)"                                                        ; 1c41: 7d 2a 29    }*)
    equb   3, &0a, &0a, &26, &7b, &0a, &26, &7b, &18, &65, &78, &85   ; 1c44: 03 0a 0a... ...
    equb &7a, &a5, &7b, &29,   3, &65, &79, &85, &7b, &b1, &7a, &91   ; 1c50: 7a a5 7b... z.{
    equb &76, &88, &10, &f9, &e6, &7c, &ca, &f0, &0d, &a5, &76, &69   ; 1c5c: 76 88 10... v..
    equb   8, &85, &76, &90, &a7, &e6, &77, &18, &90, &a2, &e6, &7d   ; 1c68: 08 85 76... ..v
    equb &c6, &73, &f0, &12, &a5                                      ; 1c74: c6 73 f0... .s.
    equs "ti@"                                                        ; 1c79: 74 69 40    ti@
    equb &85, &74, &85, &76, &a5, &75, &69,   1, &85, &75, &85, &77   ; 1c7c: 85 74 85... .t.
    equb &90, &84, &a6, &70, &a4, &71, &a5, &3e, &30,   3, &20, &44   ; 1c88: 90 84 a6... ...
    equb &1e, &68, &60, &a9,   0, &85, &76, &84, &77, &98             ; 1c94: 1e 68 60... .h`
    equs "JfvJfvew"                                                   ; 1c9e: 4a 66 76... Jfv
    equb &a8, &8a, &0a, &0a, &0a, &90,   2, &c8, &18, &65, &76, &85   ; 1ca6: a8 8a 0a... ...
    equb &76, &98, &65, &4c, &a4, &77, &85                            ; 1cb2: 76 98 65... v.e
    equs "w`L;"                                                       ; 1cb9: 77 60 4c... w`L
    equb &1c, &4c, &9d, &1c, &a9,   3, &85, &44, &a0, &17, &a2, &27   ; 1cbd: 1c 4c 9d... .L.
    equb &20, &fa, &1e, &c9,   3, &d0, &24, &e8, &20, &fa, &1e, &ca   ; 1cc9: 20 fa 1e...  ..
    equb &c9,   3, &d0, &e2, &ca, &20, &fa, &1e, &e8, &c9,   3, &d0   ; 1cd5: c9 03 d0... ...
    equb &dc, &88, &20, &fa, &1e, &c8, &c9,   3, &d0, &10, &c8, &20   ; 1ce1: dc 88 20... ..
    equb &fa, &1e, &88, &c9,   3, &d0, &52, &ca, &10, &d2, &88, &10   ; 1ced: fa 1e 88... ...
    equb &cd, &60, &84, &71, &88, &20, &66, &1b, &8a, &29,   3, &0a   ; 1cf9: cd 60 84... .`.
    equb &0a, &0a, &0a, &18, &69, &19, &85, &7a, &a9,   0, &69, &1d   ; 1d05: 0a 0a 0a... ...
    equb &85, &7b, &a0,   7, &b1, &7a, &91, &76, &88, &c0,   2, &b0   ; 1d11: 85 7b a0... .{.
    equb &f7, &a5, &7a, &18, &69,   8, &85, &7a, &a5, &7b, &69,   0   ; 1d1d: f7 a5 7a... ..z
    equb &85, &7b, &a5, &76, &18, &69, &40, &85, &76, &a5, &77, &69   ; 1d29: 85 7b a5... .{.
    equb   1, &85, &77, &a0,   5, &b1, &7a, &91, &76, &88, &10, &f9   ; 1d35: 01 85 77... ..w
    equb &a4, &71, &4c, &c3, &1b, &20, &66, &1b, &8a, &29,   3, &0a   ; 1d41: a4 71 4c... .qL
    equb &0a, &0a, &18, &69, &59, &85, &7a, &a9,   0, &69, &1d, &85   ; 1d4d: 0a 0a 18... ...
    equb &7b, &84, &71, &a0,   7, &b1, &7a, &91, &76, &88, &c0,   2   ; 1d59: 7b 84 71... {.q
    equb &b0, &f7, &a4, &71, &4c, &c3, &1b, &20, &f3, &1c, &f0, &0e   ; 1d65: b0 f7 a4... ...
    equb &e8, &a9, &ff, &85, &1d, &a5, &16, &20, &4c, &1f, &ca, &4c   ; 1d71: e8 a9 ff... ...
    equb &6e, &1c, &98, &29,   3, &0a, &0a, &0a, &18, &69, &99, &85   ; 1d7d: 6e 1c 98... n..
    equb &7a, &a9,   0, &69, &1d, &85, &7b, &a0,   7, &b1, &76, &29   ; 1d89: 7a a9 00... z..
    equb &c0, &11, &7a, &91, &76, &88, &10, &f5, &a4, &71, &e8, &88   ; 1d95: c0 11 7a... ..z
    equb &30, &10, &20, &fa, &1e, &c9,   3, &d0,   9, &a9, &ff, &85   ; 1da1: 30 10 20... 0.
    equb &1d, &a9                                                     ; 1dad: 1d a9       ..
    equs "/ L"                                                        ; 1daf: 2f 20 4c    / L
    equb &1f, &c8, &c8, &c0, &18, &b0, &10, &20, &fa, &1e, &c9,   3   ; 1db2: 1f c8 c8... ...
    equb &d0,   9, &a9, &ff, &85, &1d, &a9                            ; 1dbe: d0 09 a9... ...
    equs ". L"                                                        ; 1dc5: 2e 20 4c    . L
    equb &1f, &ca, &88, &4c, &c3, &1b, &20, &f3, &1c, &f0,   6, &20   ; 1dc8: 1f ca 88... ...
    equb &4c, &1f, &4c, &c8, &1c, &98, &29,   3, &0a, &0a, &0a, &18   ; 1dd4: 4c 1f 4c... L.L
    equb &69, &79, &85, &7a, &a9,   0, &69, &1d, &85, &7b, &a0,   7   ; 1de0: 69 79 85... iy.
    equb &b1, &76, &29,   3, &11, &7a, &91, &76, &88, &10, &f5, &a4   ; 1dec: b1 76 29... .v)
    equb &71, &ca, &88, &30, &0e, &20, &fa, &1e, &c9,   3, &d0,   7   ; 1df8: 71 ca 88... q..
    equb &a9, &2f, &e8, &20, &4c, &1f, &ca, &c8, &c8, &c0, &18, &b0   ; 1e04: a9 2f e8... ./.
    equb &0e, &20, &fa, &1e, &c9,   3                                 ; 1e10: 0e 20 fa... . .
; &1e16 referenced 1 time by &1ed2
.l1e16
    equb &d0,   7, &a9, &2e                                           ; 1e16: d0 07 a9... ...
; &1e1a referenced 1 time by &1ecd
.l1e1a
    equb &e8, &20, &4c, &1f, &ca, &e8, &88, &4c, &c3, &1b, &a9, &2c   ; 1e1a: e8 20 4c... . L
    equb &85, &16, &88, &20, &fa, &1e, &c8, &c9,   3, &d0, &16, &a9   ; 1e26: 85 16 88... ...
    equb &2d, &85, &16, &c8, &20, &fa, &1e, &88, &c9,   3, &d0,   9   ; 1e32: 2d 85 16... -..
    equb &84                                                          ; 1e3e: 84          .
    equs "q f"                                                        ; 1e3f: 71 20 66    q f
    equb &1b, &a9,   0, &85, &16, &a5, &16, &60,   0,   0,   0, &ff   ; 1e42: 1b a9 00... ...
    equb &b7, &ff, &fd, &ef,   0, &ff, &fd, &df, &f3,   0,   0,   0   ; 1e4e: b7 ff fd... ...
    equb   0,   0, &0c, &f3, &bf, &fd, &ef, &ff,   0, &ff, &fb, &bf   ; 1e5a: 00 00 0c... ...
    equb &ff,   0,   0,   0,   0,   0,   0, &ff, &bd, &ff, &df, &fb   ; 1e66: ff 00 00... ...
    equb   4, &ef, &ff, &db, &ff,   0,   0,   0,   0,   0, &20, &df   ; 1e72: 04 ef ff... ...
    equb &f7, &bd, &ef, &ff,   2, &fd, &bf, &fb, &ef,   0,   0,   0   ; 1e7e: f7 bd ef... ...
    equb   0,   0,   0, &df, &fd, &bf, &f7,   8,   0,   0,   0, &ff   ; 1e8a: 00 00 00... ...
    equb &fb, &df, &f7,   0,   0,   0,   0, &bf, &f7, &df, &f9,   6   ; 1e96: fb df f7... ...
    equb   0,   0,   0, &ef, &fb, &bf, &ff,   0                       ; 1ea2: 00 00 00... ...
    equs "xXppXxhxxhxXx"                                              ; 1eaa: 78 58 70... xXp
    equb &b8                                                          ; 1eb7: b8          .
    equs "hxx"                                                        ; 1eb8: 68 78 78    hxx

; &1ebb referenced 2 times by &1f0b, &1f1e
.sub_c1ebb
    cli                                                               ; 1ebb: 58          X
    sei                                                               ; 1ebc: 78          x
    pla                                                               ; 1ebd: 68          h
    sei                                                               ; 1ebe: 78          x
    bvs c1f19                                                         ; 1ebf: 70 58       pX
    sei                                                               ; 1ec1: 78          x
    pla                                                               ; 1ec2: 68          h
    sei                                                               ; 1ec3: 78          x
    sei                                                               ; 1ec4: 78          x
    clv                                                               ; 1ec5: b8          .
    tay                                                               ; 1ec6: a8          .
    sei                                                               ; 1ec7: 78          x
    cli                                                               ; 1ec8: 58          X
    sei                                                               ; 1ec9: 78          x
    asl l0e1a,x                                                       ; 1eca: 1e 1a 0e    ...
    asl l1e1a                                                         ; 1ecd: 0e 1a 1e    ...
    asl l001e,x                                                       ; 1ed0: 16 1e       ..
    asl l1e16,x                                                       ; 1ed2: 1e 16 1e    ...
    equb &1a, &1e, &1d, &16, &1e, &1e, &1a, &1e, &16, &1e, &0e, &1a   ; 1ed5: 1a 1e 1d... ...
    equb &1e, &16, &1e, &1e, &1d, &15, &1e, &1a, &1e, &85, &56, &48   ; 1ee1: 1e 16 1e... ...
    equb &98, &48, &f0,   9, &a9, &0b, &20, &4c, &1f, &a9,   3, &d0   ; 1eed: 98 48 f0... .H.
    equb &11                                                          ; 1ef9: 11          .

; &1efa referenced 2 times by &1f13, &29af
.c1efa
    lda l0056                                                         ; 1efa: a5 56       .V
    cmp #1                                                            ; 1efc: c9 01       ..
    beq c1f17                                                         ; 1efe: f0 17       ..
    tya                                                               ; 1f00: 98          .
    and #3                                                            ; 1f01: 29 03       ).
    clc                                                               ; 1f03: 18          .
    adc #&55 ; 'U'                                                    ; 1f04: 69 55       iU
    jsr sub_c1f4c                                                     ; 1f06: 20 4c 1f     L.
    lda #2                                                            ; 1f09: a9 02       ..
    jsr sub_c1ebb                                                     ; 1f0b: 20 bb 1e     ..
    dec l0056                                                         ; 1f0e: c6 56       .V
    iny                                                               ; 1f10: c8          .
    cpy #&18                                                          ; 1f11: c0 18       ..
    bcc c1efa                                                         ; 1f13: 90 e5       ..
    bcs c1f21                                                         ; 1f15: b0 0a       ..
; &1f17 referenced 1 time by &1efe
.c1f17
    lda #&0a                                                          ; 1f17: a9 0a       ..
; &1f19 referenced 1 time by &1ebf
.c1f19
    jsr sub_c1f4c                                                     ; 1f19: 20 4c 1f     L.
    lda #2                                                            ; 1f1c: a9 02       ..
    jsr sub_c1ebb                                                     ; 1f1e: 20 bb 1e     ..
; &1f21 referenced 1 time by &1f15
.c1f21
    pla                                                               ; 1f21: 68          h
    tay                                                               ; 1f22: a8          .
    pla                                                               ; 1f23: 68          h
    rts                                                               ; 1f24: 60          `

    equb &a9,   0, &a8, &99,   0, &0c, &c8, &c0, &f0, &d0, &f8, &a0   ; 1f25: a9 00 a8... ...
    equb   0, &84, &70, &a2, &62, &86, &71, &a9, &ff, &a2, &80, &91   ; 1f31: 00 84 70... ..p
    equb &70, &c8, &d0, &fb, &e6, &71, &e4, &71, &d0, &f5, &60, &86   ; 1f3d: 70 c8 d0... p..
    equb &70, &84, &71                                                ; 1f49: 70 84 71    p.q

; &1f4c referenced 3 times by &1f06, &1f19, &3f48
.sub_c1f4c
    lda l003c                                                         ; 1f4c: a5 3c       .<
    sta l0072                                                         ; 1f4e: 85 72       .r
    lda l003d                                                         ; 1f50: a5 3d       .=
    sta l0073                                                         ; 1f52: 85 73       .s
    txa                                                               ; 1f54: 8a          .
    clc                                                               ; 1f55: 18          .
    adc l003c                                                         ; 1f56: 65 3c       e<
    bcs c1f5e                                                         ; 1f58: b0 04       ..
    cmp #&29 ; ')'                                                    ; 1f5a: c9 29       .)
    bcc c1f64                                                         ; 1f5c: 90 06       ..
; &1f5e referenced 1 time by &1f58
.c1f5e
    lda #&28 ; '('                                                    ; 1f5e: a9 28       .(
    sbc l0070                                                         ; 1f60: e5 70       .p
    sta l0072                                                         ; 1f62: 85 72       .r
; &1f64 referenced 1 time by &1f5c
.c1f64
    tya                                                               ; 1f64: 98          .
    clc                                                               ; 1f65: 18          .
    adc l003d                                                         ; 1f66: 65 3d       e=
    bcs c1f6e                                                         ; 1f68: b0 04       ..
    cmp #&19                                                          ; 1f6a: c9 19       ..
    bcc c1f74                                                         ; 1f6c: 90 06       ..
; &1f6e referenced 1 time by &1f68
.c1f6e
    lda #&18                                                          ; 1f6e: a9 18       ..
    sbc l0071                                                         ; 1f70: e5 71       .q
    sta l0073                                                         ; 1f72: 85 73       .s
; &1f74 referenced 1 time by &1f6c
.c1f74
    rts                                                               ; 1f74: 60          `

    equb &48, &a5, &3e, &c9,   4, &90,   3, &4c, &a5, &1e, &85, &49   ; 1f75: 48 a5 3e... H.>
    equb &20, &17, &1e, &98, &0a, &85, &4a, &0a, &0a, &65, &4a, &85   ; 1f81: 20 17 1e...  ..
    equb &4a, &8a, &4a, &4a, &18, &65, &4a, &a8, &8a, &29,   3, &49   ; 1f8d: 4a 8a 4a... J.J
    equb   3, &aa, &a5, &73, &85, &4b, &86, &74, &a5, &49, &0a, &0a   ; 1f99: 03 aa a5... ...
    equb   5, &74, &aa, &bd, &ab, &1e, &a6, &74, &85, &74, &84, &75   ; 1fa5: 05 74 aa... .t.
    equb &b9,   0, &0c, &3d, &a7, &1e,   5, &74, &99,   0, &0c, &98   ; 1fb1: b9 00 0c... ...
    equb &69, &0a, &a8, &c6, &4b, &d0, &ed, &a4, &75, &ca, &10,   3   ; 1fbd: 69 0a a8... i..
    equb &a2,   3, &c8, &c6, &72, &d0, &cb, &a5, &49, &a6, &70, &a4   ; 1fc9: a2 03 c8... ...
    equs "qh`?"                                                       ; 1fd5: 71 68 60... qh`
    equb &cf, &f3, &fc,   0,   0,   0,   0, &40, &10,   4,   1, &80   ; 1fd9: cf f3 fc... ...
    equb &20,   8,   2, &c0, &30, &0c,   3, &29,   3, &85, &49, &8a   ; 1fe5: 20 08 02...  ..
    equb &48, &98, &48, &0a, &85, &4a, &0a, &0a, &65, &4a, &85, &4a   ; 1ff1: 48 98 48... H.H
    equb &8a, &4a, &4a, &18, &65, &4a, &a8, &8a, &29,   3, &49,   3   ; 1ffd: 8a 4a 4a... .JJ
    equb &85, &4a, &a5, &49, &0a, &0a,   5, &4a, &aa, &bd, &ab, &1e   ; 2009: 85 4a a5... .J.
    equb &a6, &4a, &85, &4a, &b9,   0, &0c, &3d, &a7, &1e,   5, &4a   ; 2015: a6 4a 85... .J.
    equb &99,   0, &0c, &68, &a8, &68, &aa, &a5, &49, &60, &e0, &28   ; 2021: 99 00 0c... ...
    equb &b0, &2f, &c0, &18, &b0, &2b, &86, &4a, &84, &4b, &98, &0a   ; 202d: b0 2f c0... ./.
    equb &85, &49, &0a, &0a, &65, &49, &85, &49, &8a, &4a, &4a, &18   ; 2039: 85 49 0a... .I.
    equb &65, &49, &a8, &8a, &29,   3, &aa, &b9,   0, &0c, &4c, &23   ; 2045: 65 49 a8... eI.
    equb &1f, &4a, &4a, &ca, &10, &fb, &a6, &4a, &a4, &4b, &29,   3   ; 2051: 1f 4a 4a... .JJ
    equb &60, &a5, &44, &10, &fb, &86, &4a, &84, &4b, &a2,   0, &a5   ; 205d: 60 a5 44... `.D
    equb &4a, &30, &cb, &a2, &27, &c9, &28, &b0, &c5, &aa, &a0,   0   ; 2069: 4a 30 cb... J0.
    equb &a5, &4b, &30, &be, &a0, &17, &d0, &ba, &85, &16, &20, &84   ; 2075: a5 4b 30... .K0
    equb &1f, &20, &8d, &13, &a5, &16                                 ; 2081: 1f 20 8d... . .
    equs "` L"                                                        ; 2087: 60 20 4c    ` L
    equb &1f, &4c, &44, &1e, &20, &84, &1f, &8e, &6c, &1f, &aa, &20   ; 208a: 1f 4c 44... .LD
    equb &6d, &1f, &8a, &ae, &6c, &1f, &60,   0, &48, &a5, &18, &9d   ; 2096: 6d 1f 8a... m..
    equb &50,   9, &a5, &19, &9d, &66,   9, &a5, &1a, &9d, &7c,   9   ; 20a2: 50 09 a5... P..
    equb &a5, &1b, &9d, &92,   9                                      ; 20ae: a5 1b 9d... ...
    equs "h`H"                                                        ; 20b3: 68 60 48    h`H
    equb &8a, &48, &98, &48, &8a, &0a, &0a, &0a, &85, &18, &8a, &29   ; 20b6: 8a 48 98... .H.
    equb &80, &f0,   2, &a9, &ff, &2a, &85, &19, &a2,   0, &a5, &3a   ; 20c2: 80 f0 02... ...
    equb &10,   1, &ca, &18, &65, &18, &85, &18, &8a, &65, &19, &85   ; 20ce: 10 01 ca... ...
    equb &19, &98, &0a, &0a, &0a, &85, &1a, &98, &29, &80, &f0,   2   ; 20da: 19 98 0a... ...
    equb &a9, &ff, &2a, &85, &1b, &a0,   0, &a5, &3b, &10,   1, &88   ; 20e6: a9 ff 2a... ..*
    equb &18, &65, &1a, &85, &1a, &98, &65, &1b, &85, &1b, &a9,   0   ; 20f2: 18 65 1a... .e.
    equb &85, &3a, &85, &3b, &68, &a8, &68, &aa, &68, &60, &a5, &52   ; 20fe: 85 3a 85... .:.
    equb &48, &a9,   0, &85, &52, &a9,   0, &aa, &9d, &16,   1, &e8   ; 210a: 48 a9 00... H..
    equb &e0, &0b, &90, &f8, &a2,   0, &86, &62, &86, &63, &a9, &ff   ; 2116: e0 0b 90... ...
    equb &85, &60, &86, &61, &bd, &16,   1, &d0, &13, &bd, &a8,   9   ; 2122: 85 60 86... .`.
    equb &1d, &b3,   9, &f0, &0b, &bd, &c2, &38, &c5, &61, &90,   4   ; 212e: 1d b3 09... ...
    equb &85, &61, &86, &60, &e8, &e0, &0b, &90, &e3, &a6, &60, &10   ; 213a: 85 61 86... .a.
    equb &11, &a2, &0a, &bd, &16,   1, &d0,   3, &20, &f7, &20, &ca   ; 2146: 11 a2 0a... ...
    equb &10, &f5, &68, &85, &52, &60, &a9, &ff, &9d, &16,   1, &20   ; 2152: 10 f5 68... ..h
    equb &1e, &21, &f0, &b8, &8a, &a6, &62, &9d,   0,   1, &e6, &62   ; 215e: 1e 21 f0... .!.
    equb &a6, &63, &bc,   0,   1, &84, &60, &b9, &c2, &38, &85, &61   ; 216a: a6 63 bc... .c.
    equb &a2,   0, &8a, &a0,   0, &d9,   0,   1, &f0, &3e, &c8, &c4   ; 2176: a2 00 8a... ...
    equb &62, &90, &f6, &bd, &c2, &38, &c5, &61, &90,   6, &d0, &30   ; 2182: 62 90 f6... b..
    equb &e4, &60, &b0, &2c, &86, &64, &8a, &18, &69, &0b, &aa, &a4   ; 218e: e4 60 b0... .`.
    equb &60, &20, &e2, &28, &d0, &0e, &98, &18, &69, &0b, &a8, &20   ; 219a: 60 20 e2... ` .
    equb &e2, &28, &a6, &64,   9,   0, &f0, &10, &a6, &64, &a9, &ff   ; 21a6: e2 28 a6... .(.
    equb &9d, &16,   1, &8a, &a6, &62, &9d,   0,   1, &e6, &62, &aa   ; 21b2: 9d 16 01... ...
    equb &e8, &e0, &0b, &90, &b5, &e6, &63, &a5, &63, &c5, &62, &90   ; 21be: e8 e0 0b... ...
    equb &9f, &a9,   0, &85, &63, &a9, &ff, &85, &60, &85, &61, &a2   ; 21ca: 9f a9 00... ...
    equb   0, &bc,   0,   1, &30, &13, &b9, &c2, &38, &c5, &61, &90   ; 21d6: 00 bc 00... ...
    equb   6, &d0, &0a, &c4, &60, &b0,   6, &84, &60, &85, &61, &86   ; 21e2: 06 d0 0a... ...
    equb &64, &e8, &e4, &62, &90, &e3, &a6, &64, &a9, &ff, &9d,   0   ; 21ee: 64 e8 e4... d..
    equb   1, &a6, &63, &a5, &60, &9d                                 ; 21fa: 01 a6 63... ..c
; &2200 referenced 1 time by &346f
.l2200
    equb &0b,   1, &e8, &86, &63, &e4, &62, &90, &c6, &a0,   0, &b9   ; 2200: 0b 01 e8... ...
    equb &0b,   1, &aa                                                ; 220c: 0b 01 aa    ...
    equs " W!"                                                        ; 220f: 20 57 21     W!
    equb &c8, &c4, &62, &90, &f4, &88, &b9, &0b,   1, &aa, &20, &9a   ; 2212: c8 c4 62... ..b
    equb &21, &20, &f7, &20, &88, &10, &f3, &4c, &e9, &1f, &48, &bd   ; 221e: 21 20 f7... ! .
    equb &50,   9, &9d, &5b,   9, &bd, &66,   9, &9d, &71,   9, &bd   ; 222a: 50 09 9d... P..
    equb &7c,   9, &9d, &87,   9, &bd, &92,   9, &9d, &9d,   9, &bd   ; 2236: 7c 09 9d... |..
    equb &a8,   9, &9d, &b3,   9, &bd                                 ; 2242: a8 09 9d... ...

; &2248 referenced 1 time by &349b
.sub_c2248
    ldx l9d09,y                                                       ; 2248: be 09 9d    ...
    cmp #9                                                            ; 224b: c9 09       ..
    pla                                                               ; 224d: 68          h
    rts                                                               ; 224e: 60          `

    equb &a9, &ff, &48, &bd, &50,   9, &dd, &5b,   9, &d0, &2c, &bd   ; 224f: a9 ff 48... ..H
    equb &66,   9, &dd, &71,   9, &d0, &24, &bd, &7c,   9, &dd, &87   ; 225b: 66 09 dd... f..
    equb   9, &d0, &1c, &bd, &92,   9, &dd, &9d,   9, &d0, &14, &bd   ; 2267: 09 d0 1c... ...
    equb &a8,   9, &dd, &b3,   9, &d0, &0c, &bd, &be,   9, &dd, &c9   ; 2273: a8 09 dd... ...
    equb   9, &d0,   4, &68, &a9,   0                                 ; 227f: 09 d0 04... ...
    equs "Hh`"                                                        ; 2285: 48 68 60    Hh`
    equb &98, &48, &bd, &b3,   9, &f0, &39, &bd, &5b,   9, &85, &18   ; 2288: 98 48 bd... .H.
    equb &bd, &71,   9, &85, &19, &bd, &87,   9, &85, &1a, &bd, &9d   ; 2294: bd 71 09... .q.
    equb   9, &85, &1b, &bd, &c9,   9, &85, &1d, &bd, &ac, &38, &f0   ; 22a0: 09 85 1b... ...
    equb   8, &c9, &ff, &f0, &0b, &a0,   0, &f0, &0c, &bd, &b3,   9   ; 22ac: 08 c9 ff... ...
    equb &a0,   2, &d0,   5, &bd, &b3,   9, &a0,   4, &85, &16, &84   ; 22b8: a0 02 d0... ...
    equb &15, &20, &8d, &13, &68, &a8, &60, &bd, &a8,   9, &f0, &60   ; 22c4: 15 20 8d... . .
    equb &bd, &50,   9, &85, &18, &bd, &66,   9, &85, &19, &bd, &7c   ; 22d0: bd 50 09... .P.
    equb   9, &85, &1a, &bd, &92,   9, &85, &1b, &bd, &be,   9, &85   ; 22dc: 09 85 1a... ...
    equb &1d, &bd, &a8,   9, &85, &16, &a9,   0, &85, &15, &bd, &ac   ; 22e8: 1d bd a8... ...
    equb &38, &f0, &0a, &c9, &ff, &f0,   6, &85, &14, &a9,   3, &85   ; 22f4: 38 f0 0a... 8..
    equb &15, &20, &8d, &13, &e0,   1, &d0, &28, &a5, &48, &c9,   4   ; 2300: 15 20 8d... . .
    equb &d0, &22, &86, &65, &a2,   0, &20, &1e, &21, &a6, &65,   9   ; 230c: d0 22 86... .".
    equb   0, &f0,   5, &ad, &16,   1, &f0, &10, &bd, &be,   9, &85   ; 2318: 00 f0 05... ...
    equb &1d, &a9,   0, &85, &15, &a9, &37, &85, &16, &20, &8d, &13   ; 2324: 1d a9 00... ...
    equb &60, &86, &70, &84, &71, &a8, &b1, &70, &8d, &a8,   9, &c8   ; 2330: 60 86 70... `.p
    equb &ad, &33, &24, &d0, &21, &b1, &70, &ae, &be,   9, &10,   5   ; 233c: ad 33 24... .3$
    equb &49, &ff, &18, &69,   1, &a2,   0,   9,   0, &10,   1, &ca   ; 2348: 49 ff 18... I..
    equb &18, &6d, &50,   9, &8d, &50,   9, &8a, &6d, &66,   9, &8d   ; 2354: 18 6d 50... .mP
    equb &66,   9, &c8, &a2,   0, &b1, &70, &10,   1, &ca, &18, &6d   ; 2360: 66 09 c8... f..
    equb &7c,   9, &8d, &7c,   9, &8a, &6d, &92,   9, &8d, &92,   9   ; 236c: 7c 09 8d... |..
    equb &60, &86, &72, &84, &73, &a0,   0,   9,   0, &10, &15, &29   ; 2378: 60 86 72... `.r
    equb &7f, &a8, &b1, &70, &c0, &7f, &d0, &0c, &ac, &d5,   9, &c8   ; 2384: 7f a8 b1... ...
    equb &b1, &70, &d0,   4, &a0,   0, &b1, &70, &8c, &d5,   9, &8d   ; 2390: b1 70 d0... .p.
    equb &a9,   9, &ad, &be,   9, &8d, &bf,   9, &ad, &a8,   9, &20   ; 239c: a9 09 ad... ...
    equb &ae, &22, &8a, &ae, &be,   9, &10,   5, &49, &ff, &18, &69   ; 23a8: ae 22 8a... .".
    equb   1, &a2,   0,   9,   0, &10,   1, &ca, &18, &6d, &50,   9   ; 23b4: 01 a2 00... ...
    equb &8d, &51,   9, &8a, &6d, &66,   9, &8d, &67,   9, &a2,   0   ; 23c0: 8d 51 09... .Q.
    equb &98, &10,   1, &ca, &18, &6d, &7c,   9, &8d, &7d,   9, &8a   ; 23cc: 98 10 01... ...
    equb &6d, &92,   9, &8d, &93,   9, &60, &85, &74, &a0,   0, &f0   ; 23d8: 6d 92 09... m..
    equb   7, &c5, &74, &f0, &0c, &c8, &c8, &c8, &b1, &72, &d0, &f5   ; 23e4: 07 c5 74... ..t
    equb &a2,   0, &a0,   0, &60, &c8, &b1, &72, &aa, &c8, &b1, &72   ; 23f0: a2 00 a0... ...
    equb &a8, &60, &a5, &48, &f0, &0f, &c9,   4, &f0, &0e, &c9,   5   ; 23fc: a8 60 a5... .`.
    equb &f0, &0d, &c9,   6, &f0, &0c, &4c, &ec, &22, &4c, &86, &39   ; 2408: f0 0d c9... ...
    equb &4c, &87, &2d, &4c, &c8, &2f, &4c, &d8, &31, &60,   0, &86   ; 2414: 4c 87 2d... L.-
    equb &70, &84, &71, &18, &6d, &d4,   9, &a8, &b1, &70, &d0,   3   ; 2420: 70 84 71... p.q
    equb &ac, &df,   9, &ad, &df,   9, &d0,   6, &98, &d0             ; 242c: ac df 09... ...
    equs "+ X#"                                                       ; 2436: 2b 20 58... + X
    equb &ad, &df,   9, &cd, &ed, &22, &d0, &14, &cc, &df,   9, &d0   ; 243a: ad df 09... ...
    equb &1b, &a9,   0, &8d, &df,   9, &8d, &d4,   9, &85             ; 2446: 1b a9 00... ...
    equs "HhhL"                                                       ; 2450: 48 68 68... Hhh
    equb &cd, &22, &a5, &48, &c5, &4d, &f0,   9, &ac, &ed, &22, &8c   ; 2454: cd 22 a5... .".
    equb &df,   9, &a9, &ff, &60, &a9,   0, &60, &85, &4d, &a9,   0   ; 2460: df 09 a9... ...
    equb &8d, &33, &24, &85, &52, &a5, &29, &cd, &6d, &29, &90, &10   ; 246c: 8d 33 24... .3$
    equb &a9, &ff, &a2, &d0, &a0, &38, &20, &f6, &38, &a2, &ba, &a0   ; 2478: a9 ff a2... ...
    equb &38, &20, &f6, &38, &60, &a9, &15, &a2,   4, &20, &f4, &ff   ; 2484: 38 20 f6... 8 .
    equb &a9,   0, &8d, &6f, &39, &8d, &70, &39, &8d                  ; 2490: a9 00 8d... ...
    equs "3$`"                                                        ; 2499: 33 24 60    3$`
    equb &ad, &a8,   9, &2d, &b3,   9, &f0, &35, &a9,   2, &8d, &51   ; 249c: ad a8 09... ...
    equb &25, &a9,   0, &20, &94, &28, &f0, &29, &ad, &87,   9, &38   ; 24a8: 25 a9 00... %..
    equb &ed, &7c,   9, &f0, &0a, &ad, &9d,   9, &ed, &92,   9, &30   ; 24b4: ed 7c 09... .|.
    equb &15, &10, &16, &ad, &d8, &38, &29,   2, &f0, &0f, &a9,   2   ; 24c0: 15 10 16... ...
    equb &8d, &51, &25, &a9                                           ; 24cc: 8d 51 25... .Q%
; &24d0 referenced 1 time by &25fa
.l24d0
    equb &0b                                                          ; 24d0: 0b          .
; &24d1 referenced 1 time by &25fd
.l24d1
    equb &20, &94, &28, &d0,   3, &20, &a9                            ; 24d1: 20 94 28...  .(
    equs "#`H"                                                        ; 24d8: 23 60 48    #`H
    equb &8a, &48, &98, &48, &a9,   0, &a2, &ee, &a0, &38, &20, &f6   ; 24db: 8a 48 98... .H.
    equb &38, &a2, &e6, &a0, &38, &20, &f6, &38, &68, &a8, &68, &aa   ; 24e7: 38 a2 e6... 8..
    equb &68, &60, &8a, &48, &98, &48, &a9,   0                       ; 24f3: 68 60 8a... h`.
    equs " p'"                                                        ; 24fb: 20 70 27     p'
    equb &ad, &33, &24, &f0, &59, &c9, &80, &f0, &44, &ad             ; 24fe: ad 33 24... .3$
    equs "3$0"                                                        ; 2508: 33 24 30    3$0
    equb   7, &ee, &d1, &24, &a0,   0, &f0,   5, &ce, &d0, &24, &a0   ; 250b: 07 ee d1... ...
    equb &ff, &a9,   1, &8d, &51, &25, &a9,   0, &20, &94, &28, &f0   ; 2517: ff a9 01... ...
    equb   7, &a9, &80, &8d, &33, &24, &d0, &20, &ad, &8f, &28, &f0   ; 2523: 07 a9 80... ...
    equb   5, &a9,   0, &8d, &df,   9, &a2,   1, &ad, &33, &24, &18   ; 252f: 05 a9 00... ...
    equb &7d, &50,   9, &9d, &50,   9, &98, &7d, &66,   9, &9d, &66   ; 253b: 7d 50 09... }P.
    equb   9, &ca, &10, &ec, &ad, &33, &24, &c9, &80, &d0, &0a, &ad   ; 2547: 09 ca 10... ...
    equb &8f, &28, &f0,   5, &a9,   0, &8d                            ; 2553: 8f 28 f0... .(.
    equs "3$h"                                                        ; 255a: 33 24 68    3$h
    equb &a8, &68, &aa, &ad                                           ; 255d: a8 68 aa... .h.
    equs "3$`"                                                        ; 2561: 33 24 60    3$`
    equb   0, &8a, &48, &bd, &a8,   9, &20, &2c, &13, &86, &80, &84   ; 2564: 00 8a 48... ..H
    equb &81, &68, &aa, &a0,   0, &b1, &80, &bc, &be,   9, &10,   2   ; 2570: 81 68 aa... .h.
    equb &49, &ff, &a0,   0,   9,   0, &10,   1, &88, &18, &7d, &50   ; 257c: 49 ff a0... I..
    equb   9, &85, &70, &98, &7d, &66,   9, &85, &71, &a0,   2, &b1   ; 2588: 09 85 70... ..p
    equb &80, &38, &e9,   1, &bc, &be,   9, &30, &0e, &18, &65, &70   ; 2594: 80 38 e9... .8.
    equb &85, &72, &a9,   0, &65, &71, &85, &73, &4c, &8d, &24, &85   ; 25a0: 85 72 a9... .r.
    equb &73, &a5, &70, &85, &72, &38, &e5, &73, &85, &70, &a5, &71   ; 25ac: 73 a5 70... s.p
    equb &85, &73, &e9,   0, &85, &71, &a0,   0, &ad, &d0, &24, &10   ; 25b8: 85 73 e9... .s.
    equb   1, &88, &18, &65, &70, &85, &70, &85, &78, &98, &65, &71   ; 25c4: 01 88 18... ...
    equb &85                                                          ; 25d0: 85          .
    equs "qJfxJfxJfx"                                                 ; 25d1: 71 4a 66... qJf
    equb &a0,   0, &ad, &d1, &24, &10,   1, &88, &18, &65, &72, &85   ; 25db: a0 00 ad... ...
    equb &72, &85, &79, &98, &65, &73, &85                            ; 25e7: 72 85 79... r.y
    equs "sJfyJfy"                                                    ; 25ee: 73 4a 66... sJf

; &25f5 referenced 1 time by &3474
.sub_c25f5
    lsr a                                                             ; 25f5: 4a          J
    ror l0079                                                         ; 25f6: 66 79       fy
    lda #0                                                            ; 25f8: a9 00       ..
    sta l24d0                                                         ; 25fa: 8d d0 24    ..$
    sta l24d1                                                         ; 25fd: 8d d1 24    ..$
    rts                                                               ; 2600: 60          `

    equb   0,   0, &8a, &48, &bd, &a8,   9, &20, &2c, &13, &86, &80   ; 2601: 00 00 8a... ...
    equb &84, &81, &68, &aa, &a0,   1, &b1, &80, &a0,   0,   9,   0   ; 260d: 84 81 68... ..h
    equb &10,   1, &88, &18, &7d, &7c,   9, &85, &76, &98, &7d, &92   ; 2619: 10 01 88... ...
    equb   9, &85, &77, &a0,   3, &b1, &80, &38, &e9,   1, &85, &74   ; 2625: 09 85 77... ..w
    equb &a5, &76, &38, &e5, &74, &85, &74, &a5, &77, &e9,   0, &85   ; 2631: a5 76 38... .v8
    equb &75, &a0,   0, &ad, &50, &25, &10,   1, &88, &18, &65, &74   ; 263d: 75 a0 00... u..
    equb &85, &74, &85, &7a, &98, &65, &75, &85                       ; 2649: 85 74 85... .t.
    equs "uJfzJfzJfz"                                                 ; 2651: 75 4a 66... uJf
    equb &a0,   0, &ad, &51, &25, &10,   1, &88, &18, &65, &76, &85   ; 265b: a0 00 ad... ...
    equb &76, &85, &7b, &98, &65, &77, &85                            ; 2667: 76 85 7b... v.{
    equs "wJf{Jf{Jf{"                                                 ; 266e: 77 4a 66... wJf
    equb &a9,   0, &8d, &50, &25, &8d                                 ; 2678: a9 00 8d... ...
    equs "Q%`"                                                        ; 267e: 51 25 60    Q%`
    equb   0,   0, &e0,   0, &f0,   4, &e0, &0b, &d0, &7c, &a5, &52   ; 2681: 00 00 e0... ...
    equb &f0, &78, &e8, &bd, &a8,   9, &ca,   9,   0, &f0, &6f, &e8   ; 268d: f0 78 e8... .x.
    equb &a0,   3, &b9, &70,   0, &99, &29,   1, &88, &10, &f7, &a5   ; 2699: a0 03 b9... ...
    equb &78, &8d, &2d,   1, &a5, &79, &8d, &2e,   1                  ; 26a5: 78 8d 2d... x.-
    equs " 4$"                                                        ; 26ae: 20 34 24     4$
    equb &bd, &be,   9, &10, &1f, &a5, &70, &38, &ed, &29,   1, &a5   ; 26b1: bd be 09... ...
    equb &71, &ed, &2a,   1, &10, &2e, &a5, &70, &8d, &29,   1, &a5   ; 26bd: 71 ed 2a... q.*
    equb &71, &8d, &2a,   1, &a5, &78, &8d, &2d,   1, &4c, &c0, &25   ; 26c9: 71 8d 2a... q.*
    equb &ad, &2b,   1, &38, &e5, &72, &ad, &2c,   1, &e5, &73, &10   ; 26d5: ad 2b 01... .+.
    equb &0f, &a5, &72, &8d, &2b,   1, &a5, &73, &8d, &2c,   1, &a5   ; 26e1: 0f a5 72... ..r
    equb &79, &8d, &2e,   1, &a0,   3, &b9, &29,   1, &99, &70,   0   ; 26ed: 79 8d 2e... y..
    equb &88, &10, &f7, &ad, &2d,   1, &85, &78, &ad, &2e,   1, &85   ; 26f9: 88 10 f7... ...
    equb &79, &ca, &a9,   0, &8d, &d0, &24, &8d, &d1, &24, &60, &ad   ; 2705: 79 ca a9... y..
    equb &d0, &24, &48, &ad, &d1                                      ; 2711: d0 24 48... .$H
    equs "$H 4$h"                                                     ; 2716: 24 48 20... $H
    equb &8d, &d1, &24, &68, &8d, &d0                                 ; 271c: 8d d1 24... ..$
    equs "$LR%"                                                       ; 2722: 24 4c 52... $LR
    equb &85, &53, &aa, &a9,   0, &9d, &d8, &38, &a9, &ff, &85, &44   ; 2726: 85 53 aa... .S.
    equb &a9,   1, &8d, &51, &25, &a6, &53, &20, &df, &25, &a5, &53   ; 2732: a9 01 8d... ...
    equb &18, &69, &0b, &aa, &20, &d2                                 ; 273e: 18 69 0b... .i.
    equs "$ Z&"                                                       ; 2744: 24 20 5a... $ Z
    equb &a5, &7c,   5, &7d, &f0,   9, &a5, &53, &18, &69, &0b, &aa   ; 2748: a5 7c 05... .|.
    equb &20, &df, &25, &a9,   1, &8d, &51, &25, &a6, &53, &20, &d2   ; 2754: 20 df 25...  .%
    equb &24, &20, &e5, &26, &20, &1e, &27, &a5, &7c,   5, &7d, &f0   ; 2760: 24 20 e5... $ .
    equb &13, &a9,   1, &8d, &51, &25, &a6, &53, &20, &df, &25, &20   ; 276c: 13 a9 01... ...
    equb &d2                                                          ; 2778: d2          .
    equs "$ Z& "                                                      ; 2779: 24 20 5a... $ Z
    equb &93, &26, &a5, &53, &d0,   6, &20, &b8                       ; 277e: 93 26 a5... .&.
    equs ". k#`"                                                      ; 2786: 2e 20 6b... . k
    equb &a9, &ff, &85, &7c, &a6, &78, &a4, &7b, &98, &38, &e5, &7a   ; 278b: a9 ff 85... ...
    equb &85, &80, &20, &fa, &1e, &c9,   3, &f0,   7, &88, &c6, &80   ; 2797: 85 80 20... ..
    equb &10, &f4, &e6, &7c, &a9, &ff, &85, &7d, &a6, &79, &a4, &7b   ; 27a3: 10 f4 e6... ...
    equb &98, &38, &e5, &7a, &85, &80, &20, &fa, &1e, &c9,   3, &f0   ; 27af: 98 38 e5... .8.
    equb   7, &88, &c6, &80, &10, &f4, &e6, &7d, &60, &a6, &53, &a5   ; 27bb: 07 88 c6... ...
    equb &7c, &c5, &7d, &f0, &49, &90, &25, &a5, &70, &29,   7, &85   ; 27c7: 7c c5 7d... |.}
    equb &80, &a9,   8, &38, &e5, &80, &18, &7d, &50,   9, &9d, &50   ; 27d3: 80 a9 08... ...
    equb   9, &a9,   0, &7d, &66,   9, &9d, &66,   9, &bd, &d8, &38   ; 27df: 09 a9 00... ...
    equb   9,   1, &9d, &d8, &38, &4c, &e4, &26, &a5, &72, &29,   7   ; 27eb: 09 01 9d... ...
    equb &18, &69,   1, &85, &80, &bd, &50,   9, &38, &e5, &80, &9d   ; 27f7: 18 69 01... .i.
    equb &50,   9, &bd, &66,   9, &e9,   0, &9d, &66,   9, &bd, &d8   ; 2803: 50 09 bd... P..
    equb &38,   9,   4, &9d, &d8, &38, &60, &a9, &ff, &85, &7e, &a4   ; 280f: 38 09 04... 8..
    equb &7a, &a6, &79, &8a, &38, &e5, &78, &85, &80, &20, &fa, &1e   ; 281b: 7a a6 79... z.y
    equb &c9,   3, &f0,   7, &ca, &c6, &80, &10, &f4, &e6, &7e, &a9   ; 2827: c9 03 f0... ...
    equb &ff, &85, &7f, &a4, &7b, &a6, &79, &8a, &38, &e5, &78, &85   ; 2833: ff 85 7f... ...
    equb &80, &20, &fa, &1e, &c9,   3, &f0,   7, &ca, &c6, &80, &10   ; 283f: 80 20 fa... . .
    equb &f4, &e6, &7f, &60, &a6, &53, &a5, &7e, &c5, &7f, &f0, &49   ; 284b: f4 e6 7f... ...
    equb &90, &25, &a5, &74, &29,   7, &85, &80, &a9,   8, &38, &e5   ; 2857: 90 25 a5... .%.
    equb &80, &18, &7d, &7c,   9, &9d, &7c,   9, &a9,   0, &7d, &92   ; 2863: 80 18 7d... ..}
    equb   9, &9d, &92,   9, &bd, &d8, &38,   9,   8, &9d, &d8        ; 286f: 09 9d 92... ...
    equs "8Lo'"                                                       ; 287a: 38 4c 6f... 8Lo
    equb &a5, &76, &29,   7, &18, &69,   1, &85, &80, &bd, &7c,   9   ; 287e: a5 76 29... .v)
    equb &38, &e5, &80, &9d, &7c                                      ; 288a: 38 e5 80... 8..
; &288f referenced 1 time by &2986
.l288f
    equb 9                                                            ; 288f: 09          .
; &2890 referenced 1 time by &344f
.l2890
    equb &bd, &92,   9, &e9,   0, &9d, &92,   9, &bd, &d8, &38,   9   ; 2890: bd 92 09... ...
    equb   2, &9d, &d8, &38, &60, &85, &53, &8a, &48, &98, &48, &a6   ; 289c: 02 9d d8... ...
    equb &53, &20, &df, &25, &a9,   2, &8d                            ; 28a8: 53 20 df... S .
    equs "Q% "                                                        ; 28af: 51 25 20    Q%
    equb &d2, &24, &a9, &ff, &85, &44, &20, &e5, &26, &a9,   0, &8d   ; 28b2: d2 24 a9... .$.
    equb &90, &28, &8d, &91, &28, &a5, &7f, &8d, &8f, &28, &d0,   3   ; 28be: 90 28 8d... .(.
    equs "LQ("                                                        ; 28ca: 4c 51 28    LQ(
    equb &a5, &78, &8d, &21,   1, &a5, &79, &8d, &22,   1, &a6        ; 28cd: a5 78 8d... .x.
    equs "S 4$"                                                       ; 28d8: 53 20 34... S 4
    equb &a5, &72, &18, &69,   1, &85, &72, &a5, &73, &69,   0, &85   ; 28dc: a5 72 18... .r.
    equb &73, &a5, &70, &18, &65, &72, &8d, &92, &28, &a5             ; 28e8: 73 a5 70... s.p
    equs "qes"                                                        ; 28f2: 71 65 73    qes
    equb &8d, &93, &28, &ad, &21,   1, &85, &78, &ad, &22,   1, &85   ; 28f5: 8d 93 28... ..(
    equb &79, &a4, &7b,   6                                           ; 2901: 79 a4 7b... y.{
    equs "p&q"                                                        ; 2905: 70 26 71    p&q
    equb &ad, &92, &28, &18, &65, &70, &85, &7a, &ad, &93             ; 2908: ad 92 28... ..(
    equs "(eqJfzJfz"                                                  ; 2912: 28 65 71... (eq
    equb &aa, &a5, &7a, &e9,   0, &85, &7a, &8a, &e9,   0             ; 291b: aa a5 7a... ..z
    equs " Y("                                                        ; 2925: 20 59 28     Y(
    equb &d0,   5, &ce, &90, &28, &d0, &1f,   6                       ; 2928: d0 05 ce... ...
    equs "r&s"                                                        ; 2930: 72 26 73    r&s
    equb &ad, &92, &28, &18, &65, &72, &85, &7a, &ad, &93             ; 2933: ad 92 28... ..(
    equs "(esJfzJfz m("                                               ; 293d: 28 65 73... (es
    equb &d0, &37, &ee, &90, &28, &a5, &53, &f0,   4, &c9, &0b, &d0   ; 2949: d0 37 ee... .7.
    equb &2c, &4e, &93, &28, &6e, &92, &28, &ad, &92, &28, &e9,   0   ; 2955: 2c 4e 93... ,N.
    equb &85, &7a, &ad, &93, &28, &e9,   0                            ; 2961: 85 7a ad... .z.
    equs " Y("                                                        ; 2968: 20 59 28     Y(
    equb &d0,   5, &ce, &91, &28, &d0, &10, &ad, &92, &28, &85, &7a   ; 296b: d0 05 ce... ...
    equb &ad, &93                                                     ; 2977: ad 93       ..
    equs "( m("                                                       ; 2979: 28 20 6d... ( m
    equb &d0,   3, &ee                                                ; 297d: d0 03 ee    ...

; &2980 referenced 1 time by &3f35
.sub_c2980
    sta (l0028),y                                                     ; 2980: 91 28       .(
    pla                                                               ; 2982: 68          h
    tay                                                               ; 2983: a8          .
    pla                                                               ; 2984: 68          h
    tax                                                               ; 2985: aa          .
    lda l288f                                                         ; 2986: ad 8f 28    ..(
    rts                                                               ; 2989: 60          `

    equs "JfzJfzJfz"                                                  ; 298a: 4a 66 7a... Jfz
    equb &a6, &7a, &8a, &38, &e5, &78, &85, &80                       ; 2993: a6 7a 8a... .z.
    equs "L~(JfzJfzJfz"                                               ; 299b: 4c 7e 28... L~(
    equb &a6                                                          ; 29a7: a6          .

; &29a8 referenced 1 time by &3f38
.sub_c29a8
    adc l388a,y                                                       ; 29a8: 79 8a 38    y.8
    sbc l007a                                                         ; 29ab: e5 7a       .z
    sta l0080                                                         ; 29ad: 85 80       ..
; &29af referenced 1 time by &29b9
.loop_c29af
    jsr c1efa                                                         ; 29af: 20 fa 1e     ..
    cmp #3                                                            ; 29b2: c9 03       ..
    beq c29bd                                                         ; 29b4: f0 07       ..
    dex                                                               ; 29b6: ca          .
    dec l0080                                                         ; 29b7: c6 80       ..
    bpl loop_c29af                                                    ; 29b9: 10 f4       ..
    lda #0                                                            ; 29bb: a9 00       ..
; &29bd referenced 1 time by &29b4
.c29bd
    ora #0                                                            ; 29bd: 09 00       ..
    rts                                                               ; 29bf: 60          `

    equb   0,   0,   0,   0,   0, &8d, &5b, &29, &8a, &48, &98, &48   ; 29c0: 00 00 00... ...
    equb &ae                                                          ; 29cc: ae          .
    equs "[) "                                                        ; 29cd: 5b 29 20    [)
    equb &df, &25, &20, &d2, &24, &ad, &e1, &28, &85                  ; 29d0: df 25 20... .%
    equs "D Z& "                                                      ; 29d9: 44 20 5a... D Z
    equb &e5, &26, &a5, &7c, &29,   1, &8d, &5b, &29, &a5, &7d, &29   ; 29de: e5 26 a5... .&.
    equb   4, &0d, &5b, &29, &8d, &5b, &29, &a5, &7e, &29,   8, &0d   ; 29ea: 04 0d 5b... ..[
    equb &5b, &29, &8d, &5b, &29, &a5, &7f, &29,   2, &0d, &5b, &29   ; 29f6: 5b 29 8d... [).
    equb &8d, &5b, &29, &a9,   0, &8d, &e1, &28, &68, &a8, &68, &aa   ; 2a02: 8d 5b 29... .[)
    equb &ad                                                          ; 2a0e: ad          .
    equs "[)`"                                                        ; 2a0f: 5b 29 60    [)`
    equb   0, &8a, &48, &98, &48, &a9,   0, &8d, &5b, &29, &bd, &a8   ; 2a12: 00 8a 48... ..H
    equb   9, &f0, &55, &b9, &a8,   9, &f0, &50, &20, &df, &25, &20   ; 2a1e: 09 f0 55... ..U
    equb &d2, &24, &a2,   7, &b5, &70, &9d, &21,   1, &ca, &10, &f8   ; 2a2a: d2 24 a2... .$.
    equb &68, &48, &aa, &20, &df, &25, &20, &d2, &24, &ad, &23,   1   ; 2a36: 68 48 aa... hH.
    equb &38, &e5, &70, &ad, &24,   1, &e5                            ; 2a42: 38 e5 70... 8.p
    equs "q0*"                                                        ; 2a49: 71 30 2a    q0*
    equb &a5, &72, &38, &ed, &21,   1, &a5, &73, &ed, &22,   1, &30   ; 2a4c: a5 72 38... .r8
    equb &1d, &ad, &27,   1, &38, &e5, &74, &ad, &28,   1, &e5, &75   ; 2a58: 1d ad 27... ..'
    equb &30, &10, &a5, &76, &38, &ed, &25,   1, &a5, &77, &ed, &26   ; 2a64: 30 10 a5... 0..
    equb   1, &30,   3, &ce, &5b, &29, &a9,   0, &8d, &50, &25, &8d   ; 2a70: 01 30 03... .0.
    equb &51, &25, &8d, &d1, &24, &8d, &d0, &24, &68, &a8, &68, &aa   ; 2a7c: 51 25 8d... Q%.
    equb &ad                                                          ; 2a88: ad          .
    equs "[)`"                                                        ; 2a89: 5b 29 60    [)`
    equb   0,   3,   2,   8,   7,   0,   5,   6,   4,   0,   0,   0   ; 2a8c: 00 03 02... ...
    equb   0,   0,   0,   0,   0,   0,   5,   9,   0,   0,   0,   0   ; 2a98: 00 00 00... ...
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 2aa4: 00 00 00... ...
    equb   0, &a2,   9, &8e, &6e, &29, &ca, &a9,   0, &9d, &5c, &29   ; 2ab0: 00 a2 09... ...
    equb &e8, &e0, &11, &90, &f8, &a2,   3, &9d, &e9, &2e, &ca, &10   ; 2abc: e8 e0 11... ...
    equb &fa, &ad, &6d, &29, &18, &69,   2, &85                       ; 2ac8: fa ad 6d... ..m
    equs ")` "                                                        ; 2ad0: 29 60 20    )`
    equb &a8, &29, &20, &de, &29, &60, &a2,   0, &bd, &5c, &29, &dd   ; 2ad3: a8 29 20... .)
    equb &6f, &29, &f0, &25, &a9,   0, &8d, &dd, &29, &e4, &2e, &d0   ; 2adf: 6f 29 f0... o).
    equb   6, &ce, &dd, &29, &20, &eb, &29, &20, &0c, &2c, &ad, &dd   ; 2aeb: 06 ce dd... ...
    equb &29, &f0, &0e, &a4, &29, &b9, &5c, &29, &d0,   4, &c6, &29   ; 2af7: 29 f0 0e... )..
    equb &d0, &f5, &20, &17, &2a, &e8, &e0, &11, &90, &ce, &60,   0   ; 2b03: d0 f5 20... ..
    equb &a5, &29, &c5, &2e, &f0,   6, &20, &eb, &29, &20, &17, &2a   ; 2b0f: a5 29 c5... .).
    equb &60, &a6                                                     ; 2b1b: 60 a6       `.
    equs ".0#"                                                        ; 2b1d: 2e 30 23    .0#
    equb &a5, &4c, &48, &a9, &58, &85                                 ; 2b20: a5 4c 48... .LH
    equs "L F,"                                                       ; 2b26: 4c 20 46... L F
    equb &a9, &1d, &85, &16, &a9,   2, &85, &15, &20, &8d, &13, &a9   ; 2b2a: a9 1d 85... ...
    equb &1e, &85, &16, &a9,   0, &85, &15, &20, &8d, &13, &68, &85   ; 2b36: 1e 85 16... ...
    equb &4c, &a9, &ff, &85, &2e, &60, &a6, &29, &30, &18, &a5, &4c   ; 2b42: 4c a9 ff... L..
    equb &48, &a9, &58, &85                                           ; 2b4e: 48 a9 58... H.X
    equs "L F,"                                                       ; 2b52: 4c 20 46... L F
    equb &a9, &1d, &85, &16, &a9,   0, &85, &15, &20, &8d, &13, &68   ; 2b56: a9 1d 85... ...
    equb &85, &4c, &a5, &29, &85, &2e, &60, &ae,   4, &11, &ac,   5   ; 2b62: 85 4c a5... .L.
    equb &11, &20, &91, &17, &20, &a1, &29, &20, &8f, &3a, &a5, &5b   ; 2b6e: 11 20 91... . .
    equb &f0, &15, &ad,   3, &11, &29,   1, &f0, &0e, &a2, &8f, &20   ; 2b7a: f0 15 ad... ...
    equb &cc, &3a, &f0,   7                                           ; 2b86: cc 3a f0... .:.
    equs "hhhhL9"                                                     ; 2b8a: 68 68 68... hhh
    equb &18, &a5, &29, &85                                           ; 2b90: 18 a5 29... ..)
    equs "% g,"                                                       ; 2b94: 25 20 67... % g
    equb &a5, &29, &c5, &25, &f0,   6, &20, &53,   4, &4c, &81, &2a   ; 2b98: a5 29 c5... .).
    equb &ad, &a0, &3a, &f0,   9, &20, &db                            ; 2ba4: ad a0 3a... ..:
    equs "* 7+ e+"                                                    ; 2bab: 2a 20 37... * 7
    equb &a5, &29, &cd, &6d, &29, &b0, &45, &a5, &25, &cd, &6d, &29   ; 2bb2: a5 29 cd... .).
    equb &90, &11, &a9, &0f, &a2,   0, &20, &f4, &ff, &a2,   3, &a9   ; 2bbe: 90 11 a9... ...
    equb   0, &9d, &6f, &39, &ca, &10, &fa, &20,   0,   4             ; 2bca: 00 9d 6f... ..o
    equs " d6 K4"                                                     ; 2bd4: 20 64 36...  d6
    equb &ad,   3, &11, &29,   1, &f0,   7, &a2, &ff, &20, &cc, &3a   ; 2bda: ad 03 11... ...
    equb &d0,   6, &20, &8c, &17                                      ; 2be6: d0 06 20... ..
    equs "L8* "                                                       ; 2beb: 4c 38 2a... L8*
    equb &a2, &3a, &a2, &80, &a0,   0, &88, &d0, &fd, &ca, &d0, &fa   ; 2bef: a2 3a a2... .:.
    equb &4c, &da, &2a, &a5, &25, &cd, &6d, &29, &b0,   6, &20, &a2   ; 2bfb: 4c da 2a... L.*
    equb &3a, &20, &12, &3a, &60, &a6, &29, &ec, &6d, &29, &b0, &13   ; 2c07: 3a 20 12... : .
    equb &bd, &5c, &29, &c9,   7, &f0, &0d, &c9,   8, &f0, &0c, &c9   ; 2c13: bd 5c 29... .\)
    equb   2, &f0, &0e, &c9,   3, &f0,   7                            ; 2c1f: 02 f0 0e... ...
    equs "`L~7L66L"                                                   ; 2c26: 60 4c 7e... `L~
    equb 4                                                            ; 2c2e: 04          .
    equs "4 F,"                                                       ; 2c2f: 34 20 46... 4 F
    equb &ad                                                          ; 2c33: ad          .
    equs "f9H"                                                        ; 2c34: 66 39 48    f9H
    equb &a9, &ff, &8d, &66, &39, &a9,   0, &a2, &a4, &a0, &38, &20   ; 2c37: a9 ff 8d... ...
    equb &f6                                                          ; 2c43: f6          .
    equs "8hI"                                                        ; 2c44: 38 68 49    8hI
    equb &ff, &8d, &66, &39, &a9, &1f, &85, &16, &a5, &4c, &48, &a9   ; 2c47: ff 8d 66... ..f
    equb &58, &85, &4c, &a9,   0, &ae, &66, &39, &d0,   2, &a9,   2   ; 2c53: 58 85 4c... X.L
    equb &85, &15, &20, &8d, &13, &68, &85, &4c, &60, &a6, &29, &ec   ; 2c5f: 85 15 20... ..
    equb &6d, &29, &90, &26, &ec, &6e, &29, &b0, &21, &a5, &48, &c5   ; 2c6b: 6d 29 90... m).
    equb &4d, &d0, &1b, &ad, &df,   9, &f0, &16, &a9,   0, &85, &52   ; 2c77: 4d d0 1b... M..
    equb &bd, &5c, &29, &c5, &48, &f0, &0b, &20, &8c, &2c, &90,   6   ; 2c83: bd 5c 29... .\)
    equb &20, &31,   1                                                ; 2c8f: 20 31 01     1.
    equs " 7#`"                                                       ; 2c92: 20 37 23...  7#
    equb &a6, &29, &ec, &6e, &29, &90, &1a, &a5, &48, &c9,   4, &d0   ; 2c96: a6 29 ec... .).
    equb &14, &c5, &4d, &d0, &10, &ad, &df,   9, &f0, &0b, &bd, &5c   ; 2ca2: 14 c5 4d... ..M
    equb &29, &c5, &52, &d0,   2, &a9,   0, &85, &52, &60, &85, &70   ; 2cae: 29 c5 52... ).R
    equb &a9,   0, &85, &71, &ae, &6d, &29, &bd, &5c, &29, &c5, &70   ; 2cba: a9 00 85... ...
    equb &f0, &23, &e8, &ec, &6e, &29, &90, &f3, &a2, &10, &bd, &5c   ; 2cc6: f0 23 e8... .#.
    equb &29, &d0, &16, &bd, &5b, &29, &9d, &5c, &29, &ca, &ec, &6e   ; 2cd2: 29 d0 16... )..
    equb &29, &b0, &f4, &ee, &6e, &29, &a5, &70, &9d, &5c, &29, &c6   ; 2cde: 29 b0 f4... )..
    equb &71, &a5, &71, &60, &85, &70, &a9,   0, &85, &71, &ae, &6e   ; 2cea: 71 a5 71... q.q
    equb &29, &bd, &5c, &29, &f0, &0b, &c5, &70, &f0, &0e, &e8, &e0   ; 2cf6: 29 bd 5c... ).\
    equb &11, &90, &f2, &b0,   7, &a5, &70, &9d, &5c, &29, &c6, &71   ; 2d02: 11 90 f2... ...
    equb &a5, &71, &60, &85, &70, &a9,   0, &85, &71, &ae, &6e, &29   ; 2d0e: a5 71 60... .q`
    equb &bd, &5c, &29, &c5, &70, &f0,   7, &e8, &e0, &11, &90, &f4   ; 2d1a: bd 5c 29... .\)
    equb &b0, &12, &bd, &5d, &29, &9d, &5c, &29, &e8, &e0, &10, &90   ; 2d26: b0 12 bd... ...
    equb &f5, &a9,   0, &9d, &5c, &29, &c6, &71, &a5                  ; 2d32: f5 a9 00... ...
    equs "q`H"                                                        ; 2d3b: 71 60 48    q`H
    equb &8a, &48, &98, &48, &a5, &4c, &48, &a9, &58, &85             ; 2d3e: 8a 48 98... .H.
    equs "L F,"                                                       ; 2d48: 4c 20 46... L F
    equb &a9,   0, &85, &15, &a9,   1, &85, &16, &bd, &5c, &29, &9d   ; 2d4c: a9 00 85... ...
    equb &6f, &29, &d0, &0a, &a9,   2, &85, &15, &20, &8d, &13        ; 2d58: 6f 29 d0... o).
    equs "L=, "                                                       ; 2d63: 4c 3d 2c... L=,
    equb &8d, &13, &85, &16, &20, &8d, &13, &68, &85, &4c, &68, &a8   ; 2d67: 8d 13 85... ...
    equb &68, &aa, &68, &60, &8a, &48, &a9, &25, &85, &1a, &a9,   0   ; 2d73: 68 aa 68... h.h
    equb &85, &19, &85, &1b, &a9,   0, &e0,   0, &f0, &0a, &18, &69   ; 2d7f: 85 19 85... ...
    equb &14, &90,   2, &e6, &19, &ca, &d0, &f6, &85, &18, &68, &aa   ; 2d8b: 14 90 02... ...
    equb &60, &a6, &29, &ad, &a1, &3a, &f0, &1a, &30, &0e, &e8, &e0   ; 2d97: 60 a6 29... `.)
    equb &11, &b0, &13, &bd, &5c, &29, &f0, &f6, &86, &29, &d0, &0a   ; 2da3: 11 b0 13... ...
    equb &ca, &30,   7, &bd, &5c, &29, &f0, &f8, &86, &29, &20, &de   ; 2daf: ca 30 07... .0.
    equs ")`H"                                                        ; 2dbb: 29 60 48    )`H
    equb &ad, &ec,   9, &18, &6d, &ed,   9, &c9, &50, &18, &f0, &3c   ; 2dbe: ad ec 09... ...
    equb &ce, &ec,   9, &ad, &ec,   9, &c9, &30, &b0, &31, &a9, &39   ; 2dca: ce ec 09... ...
    equb &8d, &ec,   9, &ce, &ed,   9, &ad, &ed,   9, &c9, &30, &f0   ; 2dd6: 8d ec 09... ...
    equb &18, &b0, &20, &a9, &39, &8d, &ed,   9, &ce, &ee,   9, &ad   ; 2de2: 18 b0 20... ..
    equb &ee,   9, &c9, &30, &d0, &11, &a9, &20, &8d, &ee,   9, &d0   ; 2dee: ee 09 c9... ...
    equb &0a, &ad, &ee,   9, &c9, &20, &d0,   3, &8d, &ed,   9        ; 2dfa: 0a ad ee... ...
    equs "8h`0"                                                       ; 2e05: 38 68 60... 8h`
    equb   2, &f8, &31,   4, &f7, &32,   2, &f8, &33,   0, &f7, &34   ; 2e09: 02 f8 31... ..1
    equb   3, &f5, &36,   2, &f7, &35,   4, &f6,   0,   0,   0,   0   ; 2e15: 03 f5 36... ..6
    equb &39,   0,   0, &39,   0,   0, &38,   0,   0, &38,   0,   0   ; 2e21: 39 00 00... 9..
    equb &34,   0,   0, &34,   0,   0,   0, &34,   0,   0, &34,   0   ; 2e2d: 34 00 00... 4..
    equb   0, &38,   0,   0, &38,   0,   0, &39,   0,   0, &39,   0   ; 2e39: 00 38 00... .8.
    equb   0,   0, &30,   4,   0, &31,   4,   0, &32,   4,   0, &33   ; 2e45: 00 00 30... ..0
    equb   4,   0,   0, &33,   0,   0, &33,   2,   0,   0, &36,   4   ; 2e51: 04 00 00... ...
    equb   0,   0, &36,   0,   0,   0, &35,   0,   0,   0, &34,   6   ; 2e5d: 00 00 36... ..6
    equb &fc, &34,   6, &fd, &34,   5, &fe, &34,   5, &ff, &34,   4   ; 2e69: fc 34 06... .4.
    equb   0,   0, &34,   4,   1, &34,   3,   2, &34,   3,   3, &34   ; 2e75: 00 00 34... ..4
    equb   2,   4, &34,   2,   5, &34,   1,   6,   0, &34,   4,   2   ; 2e81: 02 04 34... ..4
    equb &34,   3,   3, &34,   2,   4, &34,   1,   5,   0, &34, &fc   ; 2e8d: 34 03 03... 4..
    equb   2, &34, &fd,   3, &34, &fe,   4, &34, &ff,   5,   0, &34   ; 2e99: 02 34 fd... .4.
    equb   0,   1, &34,   0,   2, &34,   0,   3, &34,   0,   4, &34   ; 2ea5: 00 01 34... ..4
    equb   0,   5,   0, &34,   0,   7,   0, &a9, &16, &8d, &ed, &22   ; 2eb1: 00 05 00... ...
    equb &a2, &ed, &a0, &2c, &a9,   3, &20, &ee, &22, &d0, &29, &c0   ; 2ebd: a2 ed a0... ...
    equb &39, &d0, &0b, &ad, &be,   9, &49, &fe, &8d, &be,   9        ; 2ec9: 39 d0 0b... 9..
    equs "L_. "                                                       ; 2ed4: 4c 5f 2e... L_.
    equb &c4, &23, &d0, &39, &ad, &df,   9, &c9, &49, &d0, &18, &ce   ; 2ed8: c4 23 d0... .#.
    equb &50, &25, &a9,   0, &20, &94, &28, &d0,   7, &c0, &49, &f0   ; 2ee4: 50 25 a9... P%.
    equb   3                                                          ; 2ef0: 03          .
    equs "L_."                                                        ; 2ef1: 4c 5f 2e    L_.
    equb &a9, &96, &8d, &df,   9, &a0, &59, &ad, &8f, &28, &d0, &24   ; 2ef4: a9 96 8d... ...
    equb &ad, &df,   9, &c9, &96, &d0, &0e, &a9,   4,   9,   1, &2d   ; 2f00: ad df 09... ...
    equb &d8, &38, &f0,   5, &a9, &80, &8d, &33, &24, &a9, &96, &cd   ; 2f0c: d8 38 f0... .8.
    equb &df,   9, &f0, &d5, &8d, &df,   9, &a0, &86                  ; 2f18: df 09 f0... ...
    equs "L_."                                                        ; 2f21: 4c 5f 2e    L_.
    equb &ae, &c9, &3a, &f0, &23, &a9, &36, &ec, &be,   9, &d0, &10   ; 2f24: ae c9 3a... ..:
    equb &a9, &29, &ae, &c7, &3a, &f0,   9, &ae, &df,   9, &e0, &96   ; 2f30: a9 29 ae... .).
    equb &f0,   2, &a9, &49, &cd, &df,   9, &f0, &30, &8d, &df,   9   ; 2f3c: f0 02 a9... ...
    equb &a8                                                          ; 2f48: a8          .
    equs "LD."                                                        ; 2f49: 4c 44 2e    LD.
    equb &ad, &df,   9, &a0, &41, &8c, &df,   9, &c9, &29, &f0, &1b   ; 2f4c: ad df 09... ...
    equb &c9, &36, &f0, &17, &ad, &c7, &3a, &f0, &14, &a5, &52, &f0   ; 2f58: c9 36 f0... .6.
    equb &10, &a0, &45, &c9, &21, &d0, &0a, &a9,   0                  ; 2f64: 10 a0 45... ..E
    equs " 7#L"                                                       ; 2f6d: 20 37 23...  7#
    equb &87, &2d, &a0, &3d, &a2,   0, &ad, &c9, &3a, &f0,   1, &e8   ; 2f71: 87 2d a0... .-.
    equb &bd, &90, &28, &f0, &0e, &a0, &96, &8c, &df,   9, &a0, &6c   ; 2f7d: bd 90 28... ..(
    equb &cd, &be,   9, &f0,   2, &a0, &79, &8c, &d4,   9, &a9,   0   ; 2f89: cd be 09... ...
    equb &8d, &b5, &2e, &a5, &52, &f0, &17, &ac, &d4,   9, &b9, &ed   ; 2f95: 8d b5 2e... ...
    equb &2c, &8d, &a8,   9, &20, &b8, &2e, &a9,   0, &20, &f5, &25   ; 2fa1: 2c 8d a8... ,..
    equb &ad, &d8, &38, &8d, &b5, &2e, &ad, &d4,   9, &a2, &ed, &a0   ; 2fad: ad d8 38... ..8
    equb &2c, &20,   0, &22, &20, &b8, &2e, &a9,   0, &20, &f5, &25   ; 2fb9: 2c 20 00... , .
    equb &ad, &d8, &38, &0d, &b5, &2e, &8d, &d8, &38, &ad, &b6, &2e   ; 2fc5: ad d8 38... ..8
    equb &8d, &b7, &2e, &a2,   0, &ad, &a8,   9, &c9, &35, &d0,   5   ; 2fd1: 8d b7 2e... ...
    equb &a5, &52, &f0,   1, &aa, &8e, &b6, &2e, &60,   0,   0,   0   ; 2fdd: a5 52 f0... .R.
    equb &a6, &52, &f0, &28, &a2, &d7, &a0, &2c, &a9,   0             ; 2fe9: a6 52 f0... .R.
    equs " H", '"'                                                    ; 2ff3: 20 48 22     H"
    equb &a5, &52, &a0,   0, &d9, &e8, &2e, &f0,   9, &c8, &c0,   4   ; 2ff6: a5 52 a0... .R.
    equb &90, &f6, &a2,   0, &f0, &0d, &be, &f2, &2e, &ad, &a8,   9   ; 3002: 90 f6 a2... ...
    equb &c9, &35, &f0,   3, &be, &ed, &2e, &8e, &a9,   9, &60,   0   ; 300e: c9 35 f0... .5.
    equb   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 301a: 00 00 00... ...
    equb   0,   0, &12, &13, &14, &15, &16, &17, &18, &19,   0, &0c   ; 3026: 00 00 12... ...
    equb &f9, &f6, &0d, &f9, &f5, &0e, &f9, &f6, &0f, &f9, &f5, &0f   ; 3032: f9 f6 0d... ...
    equb &f9, &f5, &1c, &f9, &f5, &1a, &f9, &f6,   0,   0,   0,   0   ; 303e: f9 f5 1c... ...
    equb &11,   0,   0, &11,   0,   0, &10,   0,   0, &10,   0,   0   ; 304a: 11 00 00... ...
    equb &0f,   0,   0, &0f,   0,   0,   0, &0f,   0,   0, &0f,   0   ; 3056: 0f 00 00... ...
    equb   0, &10,   0,   0, &10,   0,   0, &11,   0,   0, &11,   0   ; 3062: 00 10 00... ...
    equb   0,   0, &0c,   4,   0, &0d,   4,   0, &0e,   4,   0, &0f   ; 306e: 00 00 0c... ...
    equb   4,   0,   0, &0f,   0,   0, &0f,   2,   0,   0, &1c,   4   ; 307a: 04 00 00... ...
    equb   0,   0, &1c,   0,   0,   0, &1a,   6, &fb, &1a,   6, &fc   ; 3086: 00 00 1c... ...
    equb &1a,   5, &fc, &1a,   5, &fd, &1a,   5, &fe, &1a,   5, &ff   ; 3092: 1a 05 fc... ...
    equb   0, &1a,   5,   0, &1a,   5,   0,   0, &0f,   5,   1, &0f   ; 309e: 00 1a 05... ...
    equb   5,   2, &0f,   4,   3, &0f,   4,   4, &0f,   4,   4, &0f   ; 30aa: 05 02 0f... ...
    equb   4,   5, &0f,   3,   5, &0f,   3,   5, &0f,   2,   6, &0f   ; 30b6: 04 05 0f... ...
    equb   2,   6, &0f,   1,   6, &0f,   1,   6,   0, &0f,   4,   2   ; 30c2: 02 06 0f... ...
    equb &0f,   3,   3, &0f,   2,   4, &0f,   1,   5,   0, &0f, &fc   ; 30ce: 0f 03 03... ...
    equb   2, &0f, &fd,   3, &0f, &fe,   4, &0f, &ff,   5,   0, &0f   ; 30da: 02 0f fd... ...
    equb   0,   1, &0f,   0,   2, &0f,   0,   3, &0f,   0,   4, &0f   ; 30e6: 00 01 0f... ...
    equb   0,   5,   0, &0f,   0,   7,   0, &a9, &16, &8d, &ed, &22   ; 30f2: 00 05 00... ...
    equb &a2, &16, &a0, &2f, &a9,   3, &20, &ee, &22, &d0, &36, &c0   ; 30fe: a2 16 a0... ...
    equb &39, &d0, &0b, &ad, &be,   9, &49, &fe, &8d, &be,   9, &4c   ; 310a: 39 d0 0b... 9..
    equb &a5, &30, &20, &c4, &23, &d0, &58, &ad, &df,   9, &c9, &45   ; 3116: a5 30 20... .0
    equb &d0, &1e, &ce, &50, &25, &a9,   0, &20, &94, &28, &d0, &26   ; 3122: d0 1e ce... ...
    equb &c0, &45, &d0, &0d, &ad, &c9, &3a, &cd, &be,   9, &d0, &1a   ; 312e: c0 45 d0... .E.
    equb &a0, &58, &8c, &df,   9, &4c, &a5, &30, &c9, &58, &d0, &15   ; 313a: a0 58 8c... .X.
    equb &ce, &50, &25, &a9,   0, &20, &94, &28, &d0,   4, &c0, &58   ; 3146: ce 50 25... .P%
    equb &d0, &eb, &a9, &ae, &8d, &df,   9, &a0, &5f, &ad, &8f, &28   ; 3152: d0 eb a9... ...
    equb &d0, &24, &ad, &df,   9, &c9, &ae, &d0, &0e, &a9,   4,   9   ; 315e: d0 24 ad... .$.
    equb   1, &2d, &d8, &38, &f0,   5, &a9, &80, &8d, &33, &24, &a9   ; 316a: 01 2d d8... .-.
    equb &ae, &cd, &df,   9, &f0, &c3, &8d, &df,   9, &a0, &9e, &4c   ; 3176: ae cd df... ...
    equb &a5, &30, &ae, &c9, &3a, &f0, &1c, &a9, &36, &ec, &be,   9   ; 3182: a5 30 ae... .0.
    equb &d0,   9, &a9, &29, &ae, &c7, &3a, &f0,   2, &a9, &45, &cd   ; 318e: d0 09 a9... ...
    equb &df,   9, &f0, &1d, &8d, &df,   9, &a8, &4c, &8a, &30, &ad   ; 319a: df 09 f0... ...
    equb &df,   9, &c9, &41, &f0, &0f, &a0, &41, &8c, &df,   9, &c9   ; 31a6: df 09 c9... ...
    equb &29, &f0,   4, &c9, &36, &d0,   2, &a0, &3d, &a2,   0, &ad   ; 31b2: 29 f0 04... )..
    equb &c9, &3a, &f0,   1, &e8, &bd, &90, &28, &f0, &0e, &a0, &ae   ; 31be: c9 3a f0... .:.
    equb &8c, &df,   9, &a0, &84, &cd, &be,   9, &f0,   2, &a0, &91   ; 31ca: 8c df 09... ...
    equb &8c                                                          ; 31d6: 8c          .
; &31d7 referenced 1 time by &3464
.l31d7
    equb &d4,   9, &98, &a2, &16, &a0, &2f, &20,   0, &22, &a9,   0   ; 31d7: d4 09 98... ...
    equb &20, &f5, &25, &a9, &f7, &85, &70, &a9, &2e, &85, &71, &a9   ; 31e3: 20 f5 25...  .%
    equb &ff, &ae, &df,   9, &e0,   0, &f0,   4, &e0, &16, &d0, &0b   ; 31ef: ff ae df... ...
    equb &a9,   0, &ae, &a8,   9, &e0, &0f, &d0,   2, &a9, &81, &a2   ; 31fb: a9 00 ae... ...
    equb   0, &a0                                                     ; 3207: 00 a0       ..
    equs "/ H", '"', "`FGHIJKLM"                                      ; 3209: 2f 20 48... / H
    equb   0, &52, &f7, &f9, &4e, &f7, &fa, &4f, &f7, &f9, &50, &f7   ; 3216: 00 52 f7... .R.
    equb &fa, &51, &f7, &f9, &51, &f7, &f9, &53, &f7, &fa, &54, &f8   ; 3222: fa 51 f7... .Q.
    equb &fa,   0,   0,   0,   0, &45,   0,   0, &45,   0,   0, &44   ; 322e: fa 00 00... ...
    equb   0,   0, &44,   0,   0, &51,   0,   0, &51,   0,   0,   0   ; 323a: 00 00 44... ..D
    equb &51,   0,   0, &51,   0,   0, &44,   0,   0, &44,   0,   0   ; 3246: 51 00 00... Q..
    equb &45,   0,   0, &45,   0,   0,   0, &4e,   4,   0, &4f,   4   ; 3252: 45 00 00... E..
    equb   0, &50,   4,   0, &51,   4,   0,   0, &51,   0,   0, &51   ; 325e: 00 50 04... .P.
    equb   2,   0,   0, &52,   4,   0,   0, &52,   0,   0,   0, &53   ; 326a: 02 00 00... ...
    equb   0,   0,   0, &53,   0,   6,   0, &53,   0, &fc,   0, &54   ; 3276: 00 00 00... ...
    equb   0, &fc, &53,   0, &fc,   0, &51,   7,   0, &51,   7,   1   ; 3282: 00 fc 53... ..S
    equb &51,   6,   1, &51,   6,   2, &51,   4,   2, &51,   4,   3   ; 328e: 51 06 01... Q..
    equb &51,   3,   4, &51,   2,   4, &51,   2,   4, &51,   1,   5   ; 329a: 51 03 04... Q..
    equb &51,   1,   6,   0, &51,   0, &fc, &51,   0, &fd, &51,   0   ; 32a6: 51 01 06... Q..
    equb &fe, &51,   0, &ff,   0, &51,   6, &fc, &51,   6, &fe, &51   ; 32b2: fe 51 00... .Q.
    equb   5, &fe, &51,   5, &ff, &51,   4,   0,   0, &51,   4,   1   ; 32be: 05 fe 51... ..Q
    equb &51,   3,   2, &51,   3,   3, &51,   2,   4, &51,   2,   5   ; 32ca: 51 03 02... Q..
    equb &51,   1,   6,   0, &51,   4,   2, &51,   3,   3, &51,   2   ; 32d6: 51 01 06... Q..
    equb   4, &51,   1,   5,   0, &51, &fc,   2, &51, &fd,   3, &51   ; 32e2: 04 51 01... .Q.
    equb &fe,   4, &51, &ff,   5,   0, &51,   0,   1, &51,   0,   2   ; 32ee: fe 04 51... ..Q
    equb &51,   0,   3, &51,   0,   4, &51,   0,   5,   0, &51,   0   ; 32fa: 51 00 03... Q..
    equb   7,   0,   0, &a9, &16, &8d, &ed, &22, &a2, &ff, &a0, &30   ; 3306: 07 00 00... ...
    equb &a9,   3, &20, &ee                                           ; 3312: a9 03 20... ..
; &3316 referenced 1 time by &342f
.l3316
    equb &22, &d0, &0c, &c0, &39, &d0, &0b, &ad, &be,   9, &49, &fe   ; 3316: 22 d0 0c... "..
    equb &8d, &be,   9                                                ; 3322: 8d be 09    ...
    equs "L13 "                                                       ; 3325: 4c 31 33... L13
    equb &c4, &23, &f0,   3, &4c, &b1, &32, &ad, &df,   9, &c9, &51   ; 3329: c4 23 f0... .#.
    equb &f0, &1c, &c9, &49, &f0, &18, &c9, &45, &f0, &14, &ad, &c7   ; 3335: f0 1c c9... ...
    equb &3a, &f0                                                     ; 3341: 3a f0       :.
    equs "c n3"                                                       ; 3343: 63 20 6e... c n
    equb &f0, &5e, &a9, &51, &8d, &df,   9, &a0                       ; 3347: f0 5e a9... .^.
    equs "ML13"                                                       ; 334f: 4d 4c 31... ML1
    equb &a2, &d4                                                     ; 3353: a2 d4       ..
    equs " n3"                                                        ; 3355: 20 6e 33     n3
    equb &f0, &36, &ad, &c7, &3a, &f0, &1e, &ce, &50, &25, &a9,   0   ; 3358: f0 36 ad... .6.
    equb &20, &94, &28, &d0, &0f, &a2, &51, &ad, &d7, &31, &d0,   8   ; 3364: 20 94 28...  .(
    equb &ad, &ca, &3a, &0d, &cb, &3a, &f0, &22, &a2                  ; 3370: ad ca 3a... ..:
    equs "ELi2"                                                       ; 3379: 45 4c 69... ELi
    equb &a2, &58, &ad, &c9, &3a, &cd, &be,   9, &f0,   9, &a2, &49   ; 337d: a2 58 ad... .X.
    equb &ad, &8f, &28, &f0, &0c, &d0, &17, &a9, &d4, &8d, &df,   9   ; 3389: ad 8f 28... ..(
    equb &8a, &a8                                                     ; 3395: 8a a8       ..
    equs "Lv2"                                                        ; 3397: 4c 76 32    Lv2
    equb &ec, &df,   9, &f0,   5, &8a, &a8, &8c, &df,   9             ; 339a: ec df 09... ...
    equs "L13"                                                        ; 33a4: 4c 31 33    L13
    equb &ad, &df,   9, &c9, &7a, &d0, &10, &ce, &50, &25, &a9,   0   ; 33a7: ad df 09... ...
    equb &20, &94, &28, &d0, &25, &c0, &7a, &f0, &21, &d0, &e6, &ad   ; 33b3: 20 94 28...  .(
    equb &df,   9, &c9, &87, &d0, &18, &ce, &50, &25, &a9,   0, &20   ; 33bf: df 09 c9... ...
    equb &94, &28, &d0,   7, &c0, &87, &f0,   3                       ; 33cb: 94 28 d0... .(.
    equs "L13"                                                        ; 33d3: 4c 31 33    L13
    equb &a9, &d4, &8d, &df,   9, &a0, &97, &ad, &8f, &28, &d0, &17   ; 33d6: a9 d4 8d... ...
    equb &a9, &d4, &cd, &df,   9, &f0, &bb, &ae, &df,   9, &8d, &df   ; 33e2: a9 d4 cd... ...
    equb   9, &a0, &c4, &e0, &49, &d0, &af, &a8                       ; 33ee: 09 a0 c4... ...
    equs "L13"                                                        ; 33f6: 4c 31 33    L13
    equb &ae, &c9, &3a, &d0, &11, &ad, &c7, &3a, &f0, &2f, &ad, &df   ; 33f9: ae c9 3a... ..:
    equb   9, &c9, &d4, &f0, &28, &a9, &7a, &4c                       ; 3405: 09 c9 d4... ...

; &340d referenced 1 time by &36cc
.c340d
    sbc l0032,x                                                       ; 340d: f5 32       .2
    lda #&36 ; '6'                                                    ; 340f: a9 36       .6
    cpx l09be                                                         ; 3411: ec be 09    ...
    bne c3426                                                         ; 3414: d0 10       ..
    lda #&29 ; ')'                                                    ; 3416: a9 29       .)
    ldx l3ac7                                                         ; 3418: ae c7 3a    ..:
    beq c3426                                                         ; 341b: f0 09       ..
    ldx l09df                                                         ; 341d: ae df 09    ...
    cpx #&d4                                                          ; 3420: e0 d4       ..
    beq c3426                                                         ; 3422: f0 02       ..
    lda #&87                                                          ; 3424: a9 87       ..
; &3426 referenced 3 times by &3414, &341b, &3422
.c3426
    cmp l09df                                                         ; 3426: cd df 09    ...
    beq c3447                                                         ; 3429: f0 1c       ..
    sta l09df                                                         ; 342b: 8d df 09    ...
    tay                                                               ; 342e: a8          .
    jmp l3316                                                         ; 342f: 4c 16 33    L.3

    equb &ad, &df,   9, &a0, &41, &8c, &df,   9, &c9, &29, &f0,   4   ; 3432: ad df 09... ...
    equb &c9, &36, &d0,   5, &a0, &3d, &4c, &16, &33                  ; 343e: c9 36 d0... .6.

; &3447 referenced 1 time by &3429
.c3447
    ldx #0                                                            ; 3447: a2 00       ..
    lda l3ac9                                                         ; 3449: ad c9 3a    ..:
    beq c344f                                                         ; 344c: f0 01       ..
    inx                                                               ; 344e: e8          .
; &344f referenced 1 time by &344c
.c344f
    lda l2890,x                                                       ; 344f: bd 90 28    ..(
    beq c3462                                                         ; 3452: f0 0e       ..
    ldy #&d4                                                          ; 3454: a0 d4       ..
    sty l09df                                                         ; 3456: 8c df 09    ...
    ldy #&aa                                                          ; 3459: a0 aa       ..
    cmp l09be                                                         ; 345b: cd be 09    ...
    beq c3462                                                         ; 345e: f0 02       ..
    ldy #&b7                                                          ; 3460: a0 b7       ..
; &3462 referenced 2 times by &3452, &345e
.c3462
    lda #0                                                            ; 3462: a9 00       ..
    sta l31d7                                                         ; 3464: 8d d7 31    ..1
    sty l09d4                                                         ; 3467: 8c d4 09    ...
    tya                                                               ; 346a: 98          .
    ldx #&ff                                                          ; 346b: a2 ff       ..
    ldy #&30 ; '0'                                                    ; 346d: a0 30       .0
    jsr l2200                                                         ; 346f: 20 00 22     ."
    lda #0                                                            ; 3472: a9 00       ..
    jsr sub_c25f5                                                     ; 3474: 20 f5 25     .%
    lda #&dd                                                          ; 3477: a9 dd       ..
    sta l0070                                                         ; 3479: 85 70       .p
    lda #&30 ; '0'                                                    ; 347b: a9 30       .0
    sta l0071                                                         ; 347d: 85 71       .q
    lda #&ff                                                          ; 347f: a9 ff       ..
    ldx l09df                                                         ; 3481: ae df 09    ...
    cpx #0                                                            ; 3484: e0 00       ..
    beq c348c                                                         ; 3486: f0 04       ..
    cpx #&16                                                          ; 3488: e0 16       ..
    bne c3497                                                         ; 348a: d0 0b       ..
; &348c referenced 1 time by &3486
.c348c
    lda #0                                                            ; 348c: a9 00       ..
    ldx l09a8                                                         ; 348e: ae a8 09    ...
    cpx #&51 ; 'Q'                                                    ; 3491: e0 51       .Q
    bne c3497                                                         ; 3493: d0 02       ..
    lda #&87                                                          ; 3495: a9 87       ..
; &3497 referenced 4 times by &348a, &3493, &36f1, &3716
.c3497
    ldx #&e6                                                          ; 3497: a2 e6       ..
    ldy #&30 ; '0'                                                    ; 3499: a0 30       .0
    jsr sub_c2248                                                     ; 349b: 20 48 22     H"
    rts                                                               ; 349e: 60          `

    equb &8a, &48, &98, &48, &a2,   0, &20, &d2, &24, &a5, &74, &18   ; 349f: 8a 48 98... .H.
    equb &65, &76, &85, &71, &a5                                      ; 34ab: 65 76 85... ev.
    equs "uewjfqJfqJfqJfq"                                            ; 34b0: 75 65 77... uew
    equb &a4, &71, &a9, &ff, &85, &44, &a9,   5, &8d,   3, &34, &ad   ; 34bf: a4 71 a9... .q.
    equb &be,   9, &30, &17, &ad, &50,   9, &18, &6d,   3, &34, &85   ; 34cb: be 09 30... ..0
; &34d7 referenced 2 times by &3647, &3706
.l34d7
    equb &70, &29, &f8, &85, &72, &ad, &66,   9, &69,   0, &85, &73   ; 34d7: 70 29 f8... p).
    equb &4c, &cb, &33, &ad, &50,   9, &38, &ed,   3, &34, &85, &70   ; 34e3: 4c cb 33... L.3
    equb &29, &f8,   9,   7, &85, &72, &ad, &66,   9, &e9,   0, &85   ; 34ef: 29 f8 09... )..
    equs "sJfpJfpJfp"                                                 ; 34fb: 73 4a 66... sJf
    equb &a6, &70, &20, &fa, &1e, &c9,   2, &f0, &0d, &a9,   2, &cd   ; 3505: a6 70 20... .p
    equb   3, &34, &f0, &14, &8d,   3, &34, &4c, &99, &33, &a5, &72   ; 3511: 03 34 f0... .4.
    equb &8d, &50,   9, &a5, &73, &8d, &66,   9, &a9, &ff, &d0,   2   ; 351d: 8d 50 09... .P.
    equb &a9,   0, &85, &70, &68, &a8, &68, &aa, &a5, &70, &60,   0   ; 3529: a9 00 85... ...
    equb &a9, &12, &8d,   9,   4, &a5,   4, &d0, &1b, &20, &0a,   4   ; 3535: a9 12 8d... ...
    equb &a9,   1, &85,   4, &a2, &2b, &a0, &34, &20, &1c             ; 3541: a9 01 85... ...
    equs "8 P8"                                                       ; 354b: 38 20 50... 8 P
    equb &a2, &3b, &a0, &34, &20, &1c                                 ; 354f: a2 3b a0... .;.
    equs "8Lr8LS"                                                     ; 3555: 38 4c 72... 8Lr
    equb   4, &9b, &b9, &ae, &b8, &b8, &eb, &98, &eb, &bf, &a4, &eb   ; 355b: 04 9b b9... ...
    equb &b8, &aa, &bd, &ae, &c6, &9b, &b9, &ae, &b8, &b8, &eb, &87   ; 3567: b8 aa bd... ...
    equb &eb, &bf, &a4, &eb, &a7, &a4, &aa, &af, &c6, &a4, &29, &b9   ; 3573: eb bf a4... ...
    equb &5c, &29, &c9,   3, &d0, &42, &a5,   4, &f0, &3e, &c9,   1   ; 357f: 5c 29 c9... \).
    equb &f0, &0e, &c9,   2, &f0, &47, &c9,   3, &f0,   3             ; 358b: f0 0e c9... ...
    equs "LW5L"                                                       ; 3595: 4c 57 35... LW5
    equb   1, &35, &a9,   0, &8d, &97                                 ; 3599: 01 35 a9... .5.
    equs "4 |8)"                                                      ; 359f: 34 20 7c... 4 |
    equb &df, &c9, &53, &f0,   7, &c9, &4c, &d0, &1a, &ce, &97, &34   ; 35a4: df c9 53... ..S
    equb &20, &0a,   4, &a9,   2, &85,   4, &a2, &98, &a0, &34, &20   ; 35b0: 20 0a 04...  ..
    equb &1c                                                          ; 35bc: 1c          .
    equs "8 P8 ]8Lr8`"                                                ; 35bd: 38 20 50... 8 P
    equb   0, &8e, &a5, &bf, &ae, &b9, &eb, &ad, &a2, &a7, &ae, &a5   ; 35c8: 00 8e a5... ...
    equb &aa, &a6, &ae, &c6, &a9,   7, &20, &fc, &36, &a4,   5, &f0   ; 35d4: aa a6 ae... ...
    equb &e6, &a0,   6, &b9, &90, &0a, &99, &db, &34, &88, &10, &f7   ; 35e0: e6 a0 06... ...
    equb &20, &0a,   4, &a9,   3, &85,   4, &a2, &e3, &a0, &34, &20   ; 35ec: 20 0a 04...  ..
    equb &1c                                                          ; 35f8: 1c          .
    equs "8 P8"                                                       ; 35f9: 38 20 50... 8 P
    equb &a2, &f0, &a0, &34, &20, &1c                                 ; 35fd: a2 f0 a0... ...
    equs "8Lr8:0.I........"                                           ; 3603: 38 4c 72... 8Lr
    equb &0d, &9c, &a3, &a2                                           ; 3613: 0d 9c a3... ...

; &3617 referenced 2 times by &3710, &37fd
.sub_c3617
    tay                                                               ; 3617: a8          .
    equb &a3, &eb, &af, &b9, &a2, &bd, &ae, &f4, &c6, &9b, &b9, &ae   ; 3618: a3 eb af... ...
    equb &b8, &b8, &eb, &fb, &e7, &fa, &e7, &f9, &eb, &a4, &b9, &eb   ; 3624: b8 b8 eb... ...
    equb &f8, &c6                                                     ; 3630: f8 c6       ..
    equs " |8"                                                        ; 3632: 20 7c 38     |8
    equb &c9, &34, &b0, &2c, &c9, &30, &b0, &0a, &c9, &24             ; 3635: c9 34 b0... .4.

; &363f referenced 1 time by &3808
.c363f
    bcs c3665                                                         ; 363f: b0 24       .$
    cmp #&21 ; '!'                                                    ; 3641: c9 21       .!
    bcc c3665                                                         ; 3643: 90 20       .
    adc #&0f                                                          ; 3645: 69 0f       i.
    sta l34d7                                                         ; 3647: 8d d7 34    ..4
    jsr l040a                                                         ; 364a: 20 0a 04     ..
    lda #4                                                            ; 364d: a9 04       ..
    sta l0004                                                         ; 364f: 85 04       ..
    ldx #&35 ; '5'                                                    ; 3651: a2 35       .5
    ldy #&35 ; '5'                                                    ; 3653: a0 35       .5
    jsr l381c                                                         ; 3655: 20 1c 38     .8
    jsr l3850                                                         ; 3658: 20 50 38     P8
    ldx #&46 ; 'F'                                                    ; 365b: a2 46       .F
    ldy #&35 ; '5'                                                    ; 365d: a0 35       .5
    jsr l381c                                                         ; 365f: 20 1c 38     .8
    jmp c3872                                                         ; 3662: 4c 72 38    Lr8

; &3665 referenced 2 times by &363f, &3643
.c3665
    rts                                                               ; 3665: 60          `

    equb &82, &a5, &b8, &ae, &b9, &bf, &eb, &b8, &aa, &bd, &ae, &eb   ; 3666: 82 a5 b8... ...
    equb &af, &a2, &b8, &a0, &c6, &aa, &a5, &af, &eb, &bb, &b9, &ae   ; 3672: af a2 b8... ...
    equb &b8, &b8, &eb, &99, &8e, &9f, &9e, &99, &85, &c6             ; 367e: b8 b8 eb... ...
    equs " |8"                                                        ; 3688: 20 7c 38     |8
    equb &c9, &0d, &d0, &d6, &20, &0a,   4, &a9, &0a, &20, &ee, &ff   ; 368b: c9 0d d0... ...
    equb &a2, &f7, &a0, &35, &ad, &97, &34, &f0,   4, &a2, &fe, &a0   ; 3697: a2 f7 a0... ...
    equb &35, &20, &f3, &37, &a9, &d6, &85, &70, &a9, &34, &85, &71   ; 36a3: 35 20 f3... 5 .
    equb &ad, &97, &34, &f0, &1b, &a9,   5, &20, &dc, &16, &d0, &11   ; 36af: ad 97 34... ..4
    equb &a5, &7b,   5, &7c,   5, &7d, &d0,   6, &a5, &7a, &c9, &85   ; 36bb: a5 7b 05... .{.

; &36c7 referenced 1 time by &3800
.c36c7
    beq c36ed                                                         ; 36c7: f0 24       .$
    jsr sub_c1728                                                     ; 36c9: 20 28 17     (.
; &36cc referenced 1 time by &36f7
.c36cc
    jmp c340d                                                         ; 36cc: 4c 0d 34    L.4

    equb &20, &c3, &0a, &8d, &eb,   9, &a2,   0, &a0,   0, &86        ; 36cf: 20 c3 0a...  ..
; &36da referenced 2 times by &37f5, &3803
.l36da
    equb &76                                                          ; 36da: 76          v

; &36db referenced 1 time by &3725
.c36db
    stx l0077                                                         ; 36db: 86 77       .w
    lda #&ea                                                          ; 36dd: a9 ea       ..
    sta l007a                                                         ; 36df: 85 7a       .z
    lda #9                                                            ; 36e1: a9 09       ..
    sta l007b                                                         ; 36e3: 85 7b       .{
    lda #&6f ; 'o'                                                    ; 36e5: a9 6f       .o
    sta l007e                                                         ; 36e7: 85 7e       .~
    lda #&0a                                                          ; 36e9: a9 0a       ..
    sta l007f                                                         ; 36eb: 85 7f       ..
; &36ed referenced 1 time by &36c7
.c36ed
    ldx #&ea                                                          ; 36ed: a2 ea       ..
    ldy #9                                                            ; 36ef: a0 09       ..
    lda c3497                                                         ; 36f1: ad 97 34    ..4
    jsr c16dc                                                         ; 36f4: 20 dc 16     ..
    bne c36cc                                                         ; 36f7: d0 d3       ..
    jsr l0ac3                                                         ; 36f9: 20 c3 0a     ..
    cmp l09eb                                                         ; 36fc: cd eb 09    ...
    beq c3706                                                         ; 36ff: f0 05       ..
    lda #&ff                                                          ; 3701: a9 ff       ..
    sta l09ea                                                         ; 3703: 8d ea 09    ...
; &3706 referenced 1 time by &36ff
.c3706
    lda l34d7                                                         ; 3706: ad d7 34    ..4
    sec                                                               ; 3709: 38          8
    sbc #&30 ; '0'                                                    ; 370a: e9 30       .0
    and #1                                                            ; 370c: 29 01       ).
    bne c3713                                                         ; 370e: d0 03       ..
    jsr sub_c3617                                                     ; 3710: 20 17 36     .6
; &3713 referenced 1 time by &370e
.c3713
    jsr sub_c3a8f                                                     ; 3713: 20 8f 3a     .:
    lda c3497                                                         ; 3716: ad 97 34    ..4
    bne c371e                                                         ; 3719: d0 03       ..
    jmp l0453                                                         ; 371b: 4c 53 04    LS.

; &371e referenced 1 time by &3719
.c371e
    lda #&ff                                                          ; 371e: a9 ff       ..
    sta l0031                                                         ; 3720: 85 31       .1
    lda l09ea                                                         ; 3722: ad ea 09    ...
    jmp c36db                                                         ; 3725: 4c db 36    L.6

    equb &98, &aa, &bd, &a2, &a5, &ac, &c6, &87, &a4, &aa, &af, &a2   ; 3728: 98 aa bd... ...
    equb &a5, &ac, &c6, &82, &a5, &b8, &ae, &b9, &bf, &eb, &ac, &aa   ; 3734: a5 ac c6... ...
    equb &a6, &ae, &eb, &af, &a2, &b8, &a0, &c6, &20, &0a,   4, &a2   ; 3740: a6 ae eb... ...
    equb   6, &a0, &36, &20, &1c                                      ; 374c: 06 a0 36... ..6
    equs "8 P8"                                                       ; 3751: 38 20 50... 8 P
    equb &a2, &46, &a0, &35, &20, &1c                                 ; 3755: a2 46 a0... .F.
    equs "8 r8 |8"                                                    ; 375b: 38 20 72... 8 r
    equb &c9, &0d, &d0, &f9, &60, &a9, &12, &8d,   9,   4, &a5,   4   ; 3762: c9 0d d0... ...
    equb &d0, &13, &20, &0a,   4, &a2, &55, &a0, &36, &20, &1c, &38   ; 376e: d0 13 20... ..

; &377a referenced 2 times by &387e, &3899
.c377a
    jsr l3850                                                         ; 377a: 20 50 38     P8
; &377d referenced 2 times by &3867, &386d
.c377d
    jsr sub_c385d                                                     ; 377d: 20 5d 38     ]8
    jmp c3872                                                         ; 3780: 4c 72 38    Lr8

    equb &4c, &53,   4, &8e, &a5, &bf, &ae, &b9, &eb, &bb, &aa, &b8   ; 3783: 4c 53 04... LS.
    equb &b8, &bc, &a4, &b9, &af, &c6, &a4, &29, &b9, &5c, &29, &c9   ; 378f: b8 bc a4... ...
    equb   8, &d0, &3a, &a5,   4, &f0, &36, &a9, &10, &20, &fc, &36   ; 379b: 08 d0 3a... ..:
    equb &a4,   5, &f0, &1e, &ad,   3, &11, &29,   1, &f0, &27, &c0   ; 37a7: a4 05 f0... ...
    equb   2, &d0, &23, &ad, &90, &0a, &c9, &41, &90, &1c, &c9, &52   ; 37b3: 02 d0 23... ..#
    equb &b0, &18                                                     ; 37bf: b0 18       ..
    equs "H S"                                                        ; 37c1: 48 20 53    H S
    equb   4, &68, &4c, &db, &36, &ad,   3, &11, &29,   1, &f0,   8   ; 37c4: 04 68 4c... .hL
    equb &20, &53,   4, &a9, &ff, &4c, &db, &36, &60, &a9, &9c, &85   ; 37d0: 20 53 04...  S.
    equb &70, &a9, &38, &85, &71, &a2, &c0, &a0                       ; 37dc: 70 a9 38... p.8
    equb &53, &a9, &ff, &20, &dc, &16, &f0,   6, &20, &17, &36, &4c   ; 37e4: 53 a9 ff... S..
    equb &a8, &36, &20                                                ; 37f0: a8 36 20    .6

; &37f3 referenced 1 time by &1874
.sub_c37f3
    cpy #&53 ; 'S'                                                    ; 37f3: c0 53       .S
    sta l36da                                                         ; 37f5: 8d da 36    ..6
    jsr l196f                                                         ; 37f8: 20 6f 19     o.
    beq c3803                                                         ; 37fb: f0 06       ..
    jsr sub_c3617                                                     ; 37fd: 20 17 36     .6
    jmp c36c7                                                         ; 3800: 4c c7 36    L.6

; &3803 referenced 1 time by &37fb
.c3803
    lda l36da                                                         ; 3803: ad da 36    ..6
    bne c380c                                                         ; 3806: d0 04       ..
    jmp c363f                                                         ; 3808: 4c 3f 36    L?6

    equb 0                                                            ; 380b: 00          .

; &380c referenced 1 time by &3806
.c380c
    cmp #1                                                            ; 380c: c9 01       ..
    beq c3827                                                         ; 380e: f0 17       ..
    cmp l0031                                                         ; 3810: c5 31       .1
    beq c3827                                                         ; 3812: f0 13       ..
    tay                                                               ; 3814: a8          .
    pla                                                               ; 3815: 68          h
    pla                                                               ; 3816: 68          h
    pla                                                               ; 3817: 68          h
    pla                                                               ; 3818: 68          h
    pla                                                               ; 3819: 68          h
    pla                                                               ; 381a: 68          h
.sub_c381b
l381c = sub_c381b+1
    cpy #&ff                                                          ; 381b: c0 ff       ..
; &381c referenced 2 times by &3655, &365f
    beq c3824                                                         ; 381d: f0 05       ..
    ldx #0                                                            ; 381f: a2 00       ..
    jmp l1140                                                         ; 3821: 4c 40 11    L@.

; &3824 referenced 1 time by &381d
.c3824
    jmp l110c                                                         ; 3824: 4c 0c 11    L..

; &3827 referenced 2 times by &380e, &3812
.c3827
    jmp l0453                                                         ; 3827: 4c 53 04    LS.

    equs "Lz7"                                                        ; 382a: 4c 7a 37    Lz7
    equb &8d                                                          ; 382d: 8d          .
    equs "}7 |8"                                                      ; 382e: 7d 37 20... }7
    equb &a4,   5, &c9, &0d, &f0, &63, &c9, &7f, &f0, &44, &c9, &2d   ; 3833: a4 05 c9... ...
    equb &f0, &24, &c9, &3d, &f0, &20, &c9, &21, &90, &e1, &c9, &2a   ; 383f: f0 24 c9... .$.
    equb &b0,   4                                                     ; 384b: b0 04       ..

; &384d referenced 1 time by &3973
.sub_c384d
l384e = sub_c384d+1
    adc #&10                                                          ; 384d: 69 10       i.
; &384e referenced 1 time by &3961
; &384f referenced 1 time by &3966
.c384f
l3850 = c384f+1
    bne c3867                                                         ; 384f: d0 16       ..
; overlapping: asl l00c9,x                                            ; 3850: 16 c9       ..
; &3850 referenced 2 times by &3658, &377a
    cmp #&30 ; '0'                                                    ; 3851: c9 30       .0
; overlapping: bmi l37e4                                              ; 3852: 30 90       0.
    bcc c38ab                                                         ; 3853: 90 56       .V
; overlapping: lsr l00c9,x                                            ; 3854: 56 c9       V.
    cmp #&3a ; ':'                                                    ; 3855: c9 3a       .:
    bcc c3867                                                         ; 3857: 90 0e       ..
    and #&df                                                          ; 3859: 29 df       ).
    cmp #&41 ; 'A'                                                    ; 385b: c9 41       .A
; &385d referenced 2 times by &377d, &3896
.sub_c385d
    bcc c38ab                                                         ; 385d: 90 4c       .L
    cmp #&5b ; '['                                                    ; 385f: c9 5b       .[
    bcc c3867                                                         ; 3861: 90 04       ..
; &3863 referenced 1 time by &3872
.sub_c3863
    bcs c38ab                                                         ; 3863: b0 46       .F
    lda #&2d ; '-'                                                    ; 3865: a9 2d       .-
; &3867 referenced 3 times by &384f, &3857, &3861
.c3867
    cpy c377d                                                         ; 3867: cc 7d 37    .}7
    bcs c38ab                                                         ; 386a: b0 3f       .?
    iny                                                               ; 386c: c8          .
    cpy c377d                                                         ; 386d: cc 7d 37    .}7
    bne c3875                                                         ; 3870: d0 03       ..
; &3872 referenced 2 times by &3662, &3780
.c3872
    jsr sub_c3863                                                     ; 3872: 20 63 38     c8
; &3875 referenced 1 time by &3870
.c3875
    dey                                                               ; 3875: 88          .
    sta l0a90,y                                                       ; 3876: 99 90 0a    ...
    jsr sub_c1866                                                     ; 3879: 20 66 18     f.
    inc l0005                                                         ; 387c: e6 05       ..
    jmp c377a                                                         ; 387e: 4c 7a 37    Lz7

    equb &c0,   0, &f0, &26, &a9,   8, &20, &ee, &ff                  ; 3881: c0 00 f0... ...
; &388a referenced 1 time by &29a8
.l388a
    equb &a9, &20, &20                                                ; 388a: a9 20 20    .

; &388d referenced 2 times by &1877, &187a
.sub_c388d
    inc la9ff                                                         ; 388d: ee ff a9    ...
    php                                                               ; 3890: 08          .
    jsr oswrch                                                        ; 3891: 20 ee ff     ..            ; Write character
    dec l0005                                                         ; 3894: c6 05       ..
    jsr sub_c385d                                                     ; 3896: 20 5d 38     ]8
    jmp c377a                                                         ; 3899: 4c 7a 37    Lz7

    equb &c0,   0, &f0, &0d, &99, &90, &0a, &e6,   5                  ; 389c: c0 00 f0... ...
    equs " c8L|7"                                                     ; 38a5: 20 63 38...  c8

; &38ab referenced 4 times by &3853, &385d, &3863, &386a
.c38ab
    pla                                                               ; 38ab: 68          h
; &38ac referenced 1 time by &3d63
.c38ac
    pla                                                               ; 38ac: 68          h
; &38ad referenced 1 time by &3d68
.c38ad
    rts                                                               ; 38ad: 60          `

    equb   0, &a9, &11, &8d,   9,   4, &a5,   4, &f0,   7, &c9,   1   ; 38ae: 00 a9 11... ...
    equb &f0                                                          ; 38ba: f0          .
    equs "/LS"                                                        ; 38bb: 2f 4c 53    /LS
    equb   4, &20, &0a,   4                                           ; 38be: 04 20 0a... . .
; &38c2 referenced 1 time by &3d6d
.l38c2
    equb &a9                                                          ; 38c2: a9          .
; &38c3 referenced 1 time by &3d72
.l38c3
    equb   1, &85,   4, &a2, &b1, &a0, &37, &20, &1c, &38, &a4, &31   ; 38c3: 01 85 04... ...
    equb &20, &d4, &0a, &98, &20, &66, &18                            ; 38cf: 20 d4 0a...  ..
    equs " P8"                                                        ; 38d6: 20 50 38     P8
    equb &ae, &db, &3a, &ac, &dc, &3a, &4c, &1c, &38, &98, &ae, &a8   ; 38d9: ae db 3a... ..:
    equb &bf, &a2, &a4, &a5, &eb, &c6, &20, &0a,   4, &a9,   2, &85   ; 38e5: bf a2 a4... ...
    equb   4, &a2, &41, &8a, &a8, &20, &ef, &0a, &98, &38, &e9, &41   ; 38f1: 04 a2 41... ..A
    equb &a8, &b9, &ef,   9, &29, &80, &a8, &8a, &c0,   0, &f0,   2   ; 38fd: a8 b9 ef... ...
    equb &a9, &fe, &20, &66, &18, &e0, &50, &f0, &11, &a9,   9, &20   ; 3909: a9 fe 20... ..
    equb &ee, &ff, &8a, &e8, &c9, &48, &d0, &d7                       ; 3915: ee ff 8a... ...
    equs " P8L"                                                       ; 391d: 20 50 38...  P8
    equb &c3, &37, &60, &86, &70, &84, &71, &a0,   0, &b1             ; 3921: c3 37 60... .7`
    equs "pEE"                                                        ; 392b: 70 45 45    pEE
    equb &c9, &0d, &f0,   3, &c8, &d0, &f5, &84, &70, &ad,   9,   4   ; 392e: c9 0d f0... ...
    equb &38, &e9,   2, &e5, &70, &4a, &a8, &f0,   8, &a9, &20, &20   ; 393a: 38 e9 02... 8..
    equb &ee, &ff, &88, &d0, &fa, &a4, &71, &86, &70, &84, &71, &a9   ; 3946: ee ff 88... ...
    equb &66, &8d, &4e, &38, &a9, &18, &8d, &4f, &38, &a5, &43, &d0   ; 3952: 66 8d 4e... f.N

; &395e referenced 3 times by &3d41, &3d48, &3d4f
.sub_c395e
    asl a                                                             ; 395e: 0a          .
    lda #&ee                                                          ; 395f: a9 ee       ..
    sta l384e                                                         ; 3961: 8d 4e 38    .N8
    lda #&ff                                                          ; 3964: a9 ff       ..
    sta c384f                                                         ; 3966: 8d 4f 38    .O8
    ldy #0                                                            ; 3969: a0 00       ..
; &396b referenced 1 time by &3977
.loop_c396b
    lda (l0070),y                                                     ; 396b: b1 70       .p
    eor l0045                                                         ; 396d: 45 45       EE
    cmp #&0d                                                          ; 396f: c9 0d       ..
    beq c3979                                                         ; 3971: f0 06       ..
    jsr sub_c384d                                                     ; 3973: 20 4d 38     M8
    iny                                                               ; 3976: c8          .
    bne loop_c396b                                                    ; 3977: d0 f2       ..
; &3979 referenced 1 time by &3971
.c3979
    lda #&cb                                                          ; 3979: a9 cb       ..
    sta l0045                                                         ; 397b: 85 45       .E
    rts                                                               ; 397d: 60          `

    equb &4c, &ee, &ff, &a9, &0a, &20, &ee, &ff, &20, &ee, &ff, &a9   ; 397e: 4c ee ff... L..
    equb &0d, &4c, &ee, &ff, &48, &a9, &67, &48, &d0,   4, &48, &a9   ; 398a: 0d 4c ee... .L.
    equb &20, &48, &a9, &0a, &8d,   0, &fe, &68, &8d,   1, &fe, &68   ; 3996: 20 48 a9...  H.
    equb &60, &a2,   0, &86,   5, &a9, &0f, &e8, &4c, &f4, &ff, &a9   ; 39a2: 60 a2 00... `..
    equb &81, &a2,   0, &a0,   0, &20, &f4, &ff, &98, &d0,   2, &8a   ; 39ae: 81 a2 00... ...
    equb &60, &a9,   0, &60, &a9,   0, &8d, &8b, &17, &ad, &8b, &17   ; 39ba: 60 a9 00... `..
    equb &c9, &32, &90, &f9, &4c, &8f                                 ; 39c6: c9 32 90... .2.
    equs ":auxcode"                                                   ; 39cc: 3a 61 75... :au
    equb &0d, &10,   0, &f4, &ff,   2,   0,   1,   0,   1,   3,   0   ; 39d4: 0d 10 00... ...
    equb   0,   0,   0,   0,   0,   3,   0,   0,   0, &40,   0, &10   ; 39e0: 00 00 00... ...
    equb   0,   1,   0,   7,   0, &64,   0,   2, &86,   1,   3,   5   ; 39ec: 00 01 00... ...
    equb &0a, &0a, &10,   0,   0,   0,   0,   0,   0, &11,   0,   2   ; 39f8: 0a 0a 10... ...
    equb   0, &b4,   0, &64,   0,   3,   1,   0,   0,   0,   0,   0   ; 3a04: 00 b4 00... ...
    equb   0, &64,   0,   0, &f8, &7e,   0, &10,   0,   3,   0,   3   ; 3a10: 00 64 00... .d.
    equb   0,   1,   0, &11,   0,   0,   0, &28,   0,   1,   0, &8d   ; 3a1c: 00 01 00... ...
    equb &73, &39, &a5, &70, &48, &a5, &71, &48, &86, &70, &84, &71   ; 3a28: 73 39 a5... s9.
    equb &ad, &66, &39, &f0, &4c, &a0,   0, &b1, &70, &29, &f0, &f0   ; 3a34: ad 66 39... .f9
    equb &2c, &b1, &70, &29,   3, &aa, &ad, &73, &39, &dd, &6f, &39   ; 3a40: 2c b1 70... ,.p
    equb &90, &37, &9d, &6f, &39, &e0,   2, &b0, &27, &a5, &70, &dd   ; 3a4c: 90 37 9d... .7.
    equb &67, &39, &d0,   7, &a5, &71, &dd, &6b, &39, &f0, &19, &8a   ; 3a58: 67 39 d0... g9.
    equb &18, &69,   4, &aa, &a9, &15, &20, &f4, &ff, &b1, &70, &29   ; 3a64: 18 69 04... .i.
    equb   3, &aa, &a5, &70, &9d, &67, &39, &a5, &71, &9d, &6b, &39   ; 3a70: 03 aa a5... ...
    equb &a6, &70, &a4, &71, &a9,   7, &20, &f1, &ff, &68, &85, &71   ; 3a7c: a6 70 a4... .p.
    equb &68, &85, &70, &ad                                           ; 3a88: 68 85 70... h.p
    equs "s9`"                                                        ; 3a8c: 73 39 60    s9`

; &3a8f referenced 2 times by &187d, &3713
.sub_c3a8f
    pha                                                               ; 3a8f: 48          H
    lda #osword_envelope                                              ; 3a90: a9 08       ..
    jsr osword                                                        ; 3a92: 20 f1 ff     ..            ; ENVELOPE command
    pla                                                               ; 3a95: 68          h
    rts                                                               ; 3a96: 60          `

    equb &ff,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0   ; 3a97: ff 00 00... ...
    equb   0,   0,   0, &20, &20, &ff,   0                            ; 3aa3: 00 00 00... ...
    equs "&%$#", '"'                                                  ; 3aaa: 26 25 24... &%$
    equb &ff                                                          ; 3aaf: ff          .
    equs '"', "#$%&"                                                  ; 3ab0: 22 23 24... "#$
    equb   0, &ff, &ad, &d4,   9, &18, &69,   1, &a8, &b9, &74, &39   ; 3ab5: 00 ff ad... ...
    equb &c9, &ff, &d0,   3, &ac, &df                                 ; 3ac1: c9 ff d0... ...
; &3ac7 referenced 1 time by &3418
.l3ac7
    equb   9, &ad                                                     ; 3ac7: 09 ad       ..
; &3ac9 referenced 1 time by &3449
.l3ac9
    equb &df,   9, &d0, &25, &98, &d0, &69, &a5, &4d, &85, &48, &d0   ; 3ac9: df 09 d0... ...
    equb &11, &a0, &0b, &8c, &df,   9, &ad, &7c,   9, &18             ; 3ad5: 11 a0 0b... ...
; &3adf referenced 1 time by &1390
.l3adf
    equb &69                                                          ; 3adf: 69          i
; &3ae0 referenced 1 time by &1393
.l3ae0
    equb   2, &8d, &7c,   9, &4c,   8, &3a, &a9,   0, &8d, &df,   9   ; 3ae0: 02 8d 7c... ..|
    equb &8d, &d4,   9, &4c, &cd, &22, &c9, &0b, &d0, &2f, &c0, &0b   ; 3aec: 8d d4 09... ...
    equb &d0                                                          ; 3af8: d0          .
    equs "? X#hhhh"                                                   ; 3af9: 3f 20 58... ? X
    equb &a0, &0f, &b9, &ef,   9, &29, &80, &f0,   7, &88, &10, &f6   ; 3b01: a0 0f b9... ...
    equb &a0, &51, &d0, &0c, &a4, &31, &20, &d4, &0a, &c8, &c0, &51   ; 3b0d: a0 51 d0... .Q.
    equb &90,   2, &a0, &41, &a2,   0, &20, &ef, &0a, &4c, &40, &11   ; 3b19: 90 02 a0... ...
    equb &c0,   4, &d0, &10, &a9,   0, &8d, &df,   9, &a0,   1, &ad   ; 3b25: c0 04 d0... ...
    equb &7c,   9, &38, &e9,   2, &8d, &7c,   9, &8c, &d4,   9, &b9   ; 3b31: 7c 09 38... |.8
    equb &74, &39, &8d, &a8,   9, &60, &a2, &b6, &20, &cc, &3a,   5   ; 3b3d: 74 39 8d... t9.
    equb &46, &85, &46, &a2, &9e, &20, &cc, &3a, &8d, &8d, &3a,   5   ; 3b49: 46 85 46... F.F
    equb &2c, &85, &2c, &a2, &bd, &20, &cc, &3a, &48,   5, &2d, &85   ; 3b55: 2c 85 2c... ,.,
    equb &2d, &68, &a2,   0, &4d, &8d, &3a, &f0,   8, &ca, &ad, &8d   ; 3b61: 2d 68 a2... -h.
    equb &3a, &30,   2, &a2,   1, &8a,   5, &20, &85, &20, &60, &a2   ; 3b6d: 3a 30 02... :0.
    equb &9d, &20, &cc, &3a, &c5, &2b, &85, &2b, &d0,   2, &a9,   0   ; 3b79: 9d 20 cc... . .
    equb   5, &2a, &85, &2a, &a2, &e6, &20, &cc, &3a, &8d, &8d, &3a   ; 3b85: 05 2a 85... .*.
    equb &a2, &86, &20, &cc, &3a, &cd, &8d, &3a, &f0,   9, &ad, &8d   ; 3b91: a2 86 20... ..
    equb &3a, &30,   6, &a9,   1, &10,   2, &a9,   0, &c5, &27, &85   ; 3b9d: 3a 30 06... :0.
    equb &27, &d0,   8, &a9,   0, &c6, &26, &10,   7, &a5, &27, &ae   ; 3ba9: 27 d0 08... '..
    equb &8e, &3a, &86, &26,   5, &28, &85, &28, &60,   0, &10, &a5   ; 3bb5: 8e 3a 86... .:.
    equb &2a, &8d, &a0, &3a, &a5, &28, &8d, &a1, &3a, &a9,   0, &85   ; 3bc1: 2a 8d a0... *..
    equb &2a, &85, &28, &60,   0,   0, &ad, &c7, &3a, &8d, &c8, &3a   ; 3bcd: 2a 85 28... *.(
    equb &a5, &46, &8d, &c7, &3a, &a5, &20, &8d, &c9, &3a, &a5, &2c   ; 3bd9: a5 46 8d... .F.
    equb &8d, &ca, &3a, &a5, &2d, &8d, &cb, &3a, &a9,   0, &85, &46   ; 3be5: 8d ca 3a... ..:
    equb &85, &20, &85, &2c, &85, &2d, &60,   0,   0,   0,   0,   0   ; 3bf1: 85 20 85... . .
    equb &a0, &ff, &a9, &81, &20, &f4, &ff, &8a, &60                  ; 3bfd: a0 ff a9... ...

; The loader will have executed VDU 21 to disable VDU output. Record the current
; disable state before re-enabling it, so we can check it later as part of a copy
; protection scheme.
.execution_start
    lda #osbyte_read_vdu_status                                       ; 3c06: a9 75       .u
    jsr osbyte                                                        ; 3c08: 20 f4 ff     ..            ; Read VDU status byte

    ; X is VDU status byte:
    ;     bit 0=printer output enabled by a VDU 2
    ;     bit 1=scrolling disabled (cursor editing)
    ;     bit 2=paged scrolling selected
    ;     bit 3=software scrolling selected (text window)
    ;     bit 4=shadow mode selected
    ;     bit 5=text at graphics cursor (VDU 5)
    ;     bit 6=two cursor editing mode
    ;     bit 7=screen disabled via VDU 21
    txa                                                               ; 3c0b: 8a          .
    and #&80                                                          ; 3c0c: 29 80       ).
    sta initial_screen_disabled_flag                                  ; 3c0e: 8d 6e 3f    .n?
    lda #vdu_enable                                                   ; 3c11: a9 06       ..
    jsr oswrch                                                        ; 3c13: 20 ee ff     ..            ; Write character 6
; Copy 512 bytes from &40FF to &400. TODO: I THINK?
    lda #<some_data_high_copy_TODO                                    ; 3c16: a9 ff       ..
    sta l0070                                                         ; 3c18: 85 70       .p
    lda #>some_data_high_copy_TODO                                    ; 3c1a: a9 40       .@
    sta l0071                                                         ; 3c1c: 85 71       .q
    lda #<some_data_low_TODO                                          ; 3c1e: a9 00       ..
    sta l0072                                                         ; 3c20: 85 72       .r
    lda #>some_data_low_TODO                                          ; 3c22: a9 04       ..
    sta l0073                                                         ; 3c24: 85 73       .s
    ldx #2                                                            ; 3c26: a2 02       ..
    beq c3c3a                                                         ; 3c28: f0 10       ..             ; TODO: branch never taken?
    ldy #0                                                            ; 3c2a: a0 00       ..
; &3c2c referenced 2 times by &3c31, &3c38
.c3c2c
    lda (l0070),y                                                     ; 3c2c: b1 70       .p
    sta (l0072),y                                                     ; 3c2e: 91 72       .r
    iny                                                               ; 3c30: c8          .
    bne c3c2c                                                         ; 3c31: d0 f9       ..
    inc l0071                                                         ; 3c33: e6 71       .q
    inc l0073                                                         ; 3c35: e6 73       .s
    dex                                                               ; 3c37: ca          .
    bne c3c2c                                                         ; 3c38: d0 f2       ..
; Copy &2A00 bytes from &1234 to &1103. TODO: I think? If this is right, label this up
; nicely and use constants etc later.
; &3c3a referenced 1 time by &3c28
.c3c3a
    lda #&34 ; '4'                                                    ; 3c3a: a9 34       .4
    sta l0070                                                         ; 3c3c: 85 70       .p
    lda #&12                                                          ; 3c3e: a9 12       ..
    sta l0071                                                         ; 3c40: 85 71       .q
    lda #3                                                            ; 3c42: a9 03       ..
    sta l0072                                                         ; 3c44: 85 72       .r
    lda #&11                                                          ; 3c46: a9 11       ..
    sta l0073                                                         ; 3c48: 85 73       .s
    lda l0071                                                         ; 3c4a: a5 71       .q
    cmp l0073                                                         ; 3c4c: c5 73       .s
    bne c3c56                                                         ; 3c4e: d0 06       ..             ; TODO: branch always taken?
    lda l0070                                                         ; 3c50: a5 70       .p
    cmp l0072                                                         ; 3c52: c5 72       .r
    beq c3c6a                                                         ; 3c54: f0 14       ..
; &3c56 referenced 1 time by &3c4e
.c3c56
    ldx #&2a ; '*'                                                    ; 3c56: a2 2a       .*
    beq c3c6a                                                         ; 3c58: f0 10       ..             ; TODO: branch never taken?
    ldy #0                                                            ; 3c5a: a0 00       ..
; &3c5c referenced 2 times by &3c61, &3c68
.c3c5c
    lda (l0070),y                                                     ; 3c5c: b1 70       .p
    sta (l0072),y                                                     ; 3c5e: 91 72       .r
    iny                                                               ; 3c60: c8          .
    bne c3c5c                                                         ; 3c61: d0 f9       ..
    inc l0071                                                         ; 3c63: e6 71       .q
    inc l0073                                                         ; 3c65: e6 73       .s
    dex                                                               ; 3c67: ca          .
    bne c3c5c                                                         ; 3c68: d0 f2       ..
; &3c6a referenced 2 times by &3c54, &3c58
.c3c6a
    ldx #0                                                            ; 3c6a: a2 00       ..
; &3c6c referenced 1 time by &3c75
.loop_c3c6c
    lda l4088,x                                                       ; 3c6c: bd 88 40    ..@
    sta l0ab7,x                                                       ; 3c6f: 9d b7 0a    ...
    inx                                                               ; 3c72: e8          .
    cpx #&48 ; 'H'                                                    ; 3c73: e0 48       .H
    bcc loop_c3c6c                                                    ; 3c75: 90 f5       ..
    ldy #0                                                            ; 3c77: a0 00       ..
; &3c79 referenced 1 time by &3c80
.loop_c3c79
    lda l3fcb,y                                                       ; 3c79: b9 cb 3f    ..?
    sta l0c00,y                                                       ; 3c7c: 99 00 0c    ...
    iny                                                               ; 3c7f: c8          .
    bne loop_c3c79                                                    ; 3c80: d0 f7       ..
    ldy #0                                                            ; 3c82: a0 00       ..
; &3c84 referenced 1 time by &3c8d
.loop_c3c84
    lda l40d0,y                                                       ; 3c84: b9 d0 40    ..@
    sta l0131,y                                                       ; 3c87: 99 31 01    .1.
    iny                                                               ; 3c8a: c8          .
    cpy #&2f ; '/'                                                    ; 3c8b: c0 2f       ./
    bne loop_c3c84                                                    ; 3c8d: d0 f5       ..
    lda l1103                                                         ; 3c8f: ad 03 11    ...
    and #8                                                            ; 3c92: 29 08       ).
    beq c3c9b                                                         ; 3c94: f0 05       ..
    lda #&32 ; '2'                                                    ; 3c96: a9 32       .2
    sta l3f05                                                         ; 3c98: 8d 05 3f    ..?
; &3c9b referenced 1 time by &3c94
.c3c9b
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
    lda #&fe                                                          ; 3cf5: a9 fe       ..
    jsr oswrch                                                        ; 3cf7: 20 ee ff     ..            ; Write character 254
    ldx #0                                                            ; 3cfa: a2 00       ..
; &3cfc referenced 1 time by &3d05
.loop_c3cfc
    lda character_fe_bitmap,x                                         ; 3cfc: bd 66 3f    .f?
    jsr oswrch                                                        ; 3cff: 20 ee ff     ..            ; Write character
    inx                                                               ; 3d02: e8          .
    cpx #8                                                            ; 3d03: e0 08       ..
    bcc loop_c3cfc                                                    ; 3d05: 90 f5       ..
    lda #osbyte_set_printer_ignore                                    ; 3d07: a9 06       ..
    ldx #0                                                            ; 3d09: a2 00       ..
    jsr osbyte                                                        ; 3d0b: 20 f4 ff     ..            ; Set printer ignore character to X=0
    lda #&fe                                                          ; 3d0e: a9 fe       ..
    sta l0037                                                         ; 3d10: 85 37       .7
    lda #0                                                            ; 3d12: a9 00       ..
    sta l0004                                                         ; 3d14: 85 04       ..
    lda #&ff                                                          ; 3d16: a9 ff       ..
    sta l002e                                                         ; 3d18: 85 2e       ..
    lda #&20 ; ' '                                                    ; 3d1a: a9 20       .
    sta l005c                                                         ; 3d1c: 85 5c       .\
    sta l005d                                                         ; 3d1e: 85 5d       .]
    sta l005e                                                         ; 3d20: 85 5e       .^
    lda #&cb                                                          ; 3d22: a9 cb       ..
    sta l0045                                                         ; 3d24: 85 45       .E
    lda #&ff                                                          ; 3d26: a9 ff       ..
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
    ldx #&ac                                                          ; 3d3d: a2 ac       ..
    ldy #&38 ; '8'                                                    ; 3d3f: a0 38       .8
    jsr sub_c395e                                                     ; 3d41: 20 5e 39     ^9
    ldx #&c2                                                          ; 3d44: a2 c2       ..
    ldy #&38 ; '8'                                                    ; 3d46: a0 38       .8
    jsr sub_c395e                                                     ; 3d48: 20 5e 39     ^9
    ldx #&d8                                                          ; 3d4b: a2 d8       ..
    ldy #&38 ; '8'                                                    ; 3d4d: a0 38       .8
    jsr sub_c395e                                                     ; 3d4f: 20 5e 39     ^9
    ldy #7                                                            ; 3d52: a0 07       ..
; &3d54 referenced 1 time by &3d5f
.loop_c3d54
    lda #0                                                            ; 3d54: a9 00       ..
    sta l0aa1,y                                                       ; 3d56: 99 a1 0a    ...
    lda #&ff                                                          ; 3d59: a9 ff       ..
    sta l0aa9,y                                                       ; 3d5b: 99 a9 0a    ...
    dey                                                               ; 3d5e: 88          .
    bpl loop_c3d54                                                    ; 3d5f: 10 f3       ..
    lda #&c7                                                          ; 3d61: a9 c7       ..
    sta c38ac                                                         ; 3d63: 8d ac 38    ..8
    lda #&c6                                                          ; 3d66: a9 c6       ..
    sta c38ad                                                         ; 3d68: 8d ad 38    ..8
    lda #&80                                                          ; 3d6b: a9 80       ..
    sta l38c2                                                         ; 3d6d: 8d c2 38    ..8
    lda #&7f                                                          ; 3d70: a9 7f       ..
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
    lda #&62 ; 'b'                                                    ; 3d8d: a9 62       .b
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

; &3da3 referenced 1 time by &3d94
.initial_screen_disabled_flag_ok
    lda #0                                                            ; 3da3: a9 00       ..
    sta l0070                                                         ; 3da5: 85 70       .p
    tay                                                               ; 3da7: a8          .
    ldx #&5b ; '['                                                    ; 3da8: a2 5b       .[
    stx l0071                                                         ; 3daa: 86 71       .q
    ldx l004c                                                         ; 3dac: a6 4c       .L
; &3dae referenced 2 times by &3db1, &3db7
.c3dae
    sta (l0070),y                                                     ; 3dae: 91 70       .p
    iny                                                               ; 3db0: c8          .
    bne c3dae                                                         ; 3db1: d0 fb       ..
    inc l0071                                                         ; 3db3: e6 71       .q
    cpx l0071                                                         ; 3db5: e4 71       .q
    bne c3dae                                                         ; 3db7: d0 f5       ..
; &3db9 referenced 1 time by &3da0
.c3db9
    lda #vdu_define_text_window                                       ; 3db9: a9 1c       ..
    jsr oswrch                                                        ; 3dbb: 20 ee ff     ..            ; Write character 28
    lda #1                                                            ; 3dbe: a9 01       ..
    jsr oswrch                                                        ; 3dc0: 20 ee ff     ..            ; Write character 1
    lda #&1f                                                          ; 3dc3: a9 1f       ..
    jsr oswrch                                                        ; 3dc5: 20 ee ff     ..            ; Write character 31
    lda #&27 ; '''                                                    ; 3dc8: a9 27       .'
    jsr oswrch                                                        ; 3dca: 20 ee ff     ..            ; Write character 39
    lda #0                                                            ; 3dcd: a9 00       ..
    jsr oswrch                                                        ; 3dcf: 20 ee ff     ..            ; Write character 0
    lda #vdu_set_text_colour                                          ; 3dd2: a9 11       ..
    jsr oswrch                                                        ; 3dd4: 20 ee ff     ..            ; Write character 17
    lda #&81                                                          ; 3dd7: a9 81       ..
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
    lda #&20 ; ' '                                                    ; 3e06: a9 20       .
    sta crtc_address_write                                            ; 3e08: 8d 01 fe    ...
    lda #&0b                                                          ; 3e0b: a9 0b       ..
    lda #0                                                            ; 3e0d: a9 00       ..
    lda #&23 ; '#'                                                    ; 3e0f: a9 23       .#
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
    lda #&40 ; '@'                                                    ; 3e2b: a9 40       .@
    sta crtc_address_write                                            ; 3e2d: 8d 01 fe    ...
    lda #crtc_screen_start_high                                       ; 3e30: a9 0c       ..
    sta crtc_address_register                                         ; 3e32: 8d 00 fe    ...
    lda #&0c                                                          ; 3e35: a9 0c       ..
    sta crtc_address_write                                            ; 3e37: 8d 01 fe    ...
    lda #crtc_vert_displayed                                          ; 3e3a: a9 06       ..
    sta crtc_address_register                                         ; 3e3c: 8d 00 fe    ...
    lda #&18                                                          ; 3e3f: a9 18       ..
    sta crtc_address_write                                            ; 3e41: 8d 01 fe    ...
    lda #crtc_interlace_delay                                         ; 3e44: a9 08       ..
    sta crtc_address_register                                         ; 3e46: 8d 00 fe    ...
    lda #0                                                            ; 3e49: a9 00       ..
    sta crtc_address_write                                            ; 3e4b: 8d 01 fe    ...
    asl l0070                                                         ; 3e4e: 06 70       .p
    ldy #3                                                            ; 3e50: a0 03       ..
; &3e52 referenced 1 time by &3e5d
.loop_c3e52
    lda l1104,y                                                       ; 3e52: b9 04 11    ...
    sec                                                               ; 3e55: 38          8
    sbc l0070                                                         ; 3e56: e5 70       .p
    sta l1104,y                                                       ; 3e58: 99 04 11    ...
    dey                                                               ; 3e5b: 88          .
    dey                                                               ; 3e5c: 88          .
    bpl loop_c3e52                                                    ; 3e5d: 10 f3       ..
    lda #&80                                                          ; 3e5f: a9 80       ..
    sta l0070                                                         ; 3e61: 85 70       .p
    lda #&19                                                          ; 3e63: a9 19       ..
    sta l0071                                                         ; 3e65: 85 71       .q
    lda #5                                                            ; 3e67: a9 05       ..
    jsr c16dc                                                         ; 3e69: 20 dc 16     ..
    lda #&c0                                                          ; 3e6c: a9 c0       ..
    sec                                                               ; 3e6e: 38          8
    sbc l007a                                                         ; 3e6f: e5 7a       .z
    sta l0054                                                         ; 3e71: 85 54       .T
    lda #&5b ; '['                                                    ; 3e73: a9 5b       .[
    sbc l007b                                                         ; 3e75: e5 7b       .{
    sta l0055                                                         ; 3e77: 85 55       .U
    jsr l196f                                                         ; 3e79: 20 6f 19     o.
    lda l0054                                                         ; 3e7c: a5 54       .T
    pha                                                               ; 3e7e: 48          H
    lda l0055                                                         ; 3e7f: a5 55       .U
    pha                                                               ; 3e81: 48          H
    ldx #&ff                                                          ; 3e82: a2 ff       ..
    stx l0054                                                         ; 3e84: 86 54       .T
    ldy #&40 ; '@'                                                    ; 3e86: a0 40       .@
    sty l0055                                                         ; 3e88: 84 55       .U
    lda l1103                                                         ; 3e8a: ad 03 11    ...
    and #4                                                            ; 3e8d: 29 04       ).
    bne c3ea1                                                         ; 3e8f: d0 10       ..
    lda #&5e ; '^'                                                    ; 3e91: a9 5e       .^
    sta l0070                                                         ; 3e93: 85 70       .p
    lda #&3f ; '?'                                                    ; 3e95: a9 3f       .?
    sta l0071                                                         ; 3e97: 85 71       .q
    lda #&ff                                                          ; 3e99: a9 ff       ..
    jsr c16dc                                                         ; 3e9b: 20 dc 16     ..
    jmp c3f0d                                                         ; 3e9e: 4c 0d 3f    L.?

; &3ea1 referenced 2 times by &3e8f, &3ebe
.c3ea1
    lda #&27 ; '''                                                    ; 3ea1: a9 27       .'
    jsr sub_c3ec9                                                     ; 3ea3: 20 c9 3e     .>
    lda #&7f                                                          ; 3ea6: a9 7f       ..
    jsr sub_c3ed5                                                     ; 3ea8: 20 d5 3e     .>
    lda #&7f                                                          ; 3eab: a9 7f       ..
    ldx #<(l3ef4)                                                     ; 3ead: a2 f4       ..
    ldy #>(l3ef4)                                                     ; 3eaf: a0 3e       .>
    jsr osword                                                        ; 3eb1: 20 f1 ff     ..            ; Single track single density FDC command (see https://beebwiki.mdfs.net/OSWORDs)
    lda l3efe                                                         ; 3eb4: ad fe 3e    ..>
    beq c3ec1                                                         ; 3eb7: f0 08       ..
    lda #0                                                            ; 3eb9: a9 00       ..
    jsr sub_c3ec9                                                     ; 3ebb: 20 c9 3e     .>
    jmp c3ea1                                                         ; 3ebe: 4c a1 3e    L.>

; &3ec1 referenced 1 time by &3eb7
.c3ec1
    lda #&27 ; '''                                                    ; 3ec1: a9 27       .'
    jsr sub_c3ed5                                                     ; 3ec3: 20 d5 3e     .>
    jmp c3f0d                                                         ; 3ec6: 4c 0d 3f    L.?

; &3ec9 referenced 2 times by &3ea3, &3ebb
.sub_c3ec9
    sta l3ee8                                                         ; 3ec9: 8d e8 3e    ..>
    lda #&7f                                                          ; 3ecc: a9 7f       ..
    ldx #<(l3ee1)                                                     ; 3ece: a2 e1       ..
    ldy #>(l3ee1)                                                     ; 3ed0: a0 3e       .>
    jmp osword                                                        ; 3ed2: 4c f1 ff    L..            ; Single track single density FDC command (see https://beebwiki.mdfs.net/OSWORDs)

; &3ed5 referenced 2 times by &3ea8, &3ec3
.sub_c3ed5
    sta l3ef2                                                         ; 3ed5: 8d f2 3e    ..>
    lda #&7f                                                          ; 3ed8: a9 7f       ..
    ldx #<(l3eea)                                                     ; 3eda: a2 ea       ..
    ldy #>(l3eea)                                                     ; 3edc: a0 3e       .>
    jmp osword                                                        ; 3ede: 4c f1 ff    L..            ; Single track single density FDC command (see https://beebwiki.mdfs.net/OSWORDs)

.l3ee1
    equb   0, &ff, &ff,   0,   0,   1, &69                            ; 3ee1: 00 ff ff... ...
; &3ee8 referenced 1 time by &3ec9
.l3ee8
    equb 0, 0                                                         ; 3ee8: 00 00       ..
.l3eea
    equb   0, &ff, &ff,   0,   0,   2, &7a, &12                       ; 3eea: 00 ff ff... ...
; &3ef2 referenced 1 time by &3ed5
.l3ef2
    equb 0, 0                                                         ; 3ef2: 00 00       ..
.l3ef4
    equb   0, &ff, &40,   0,   0,   3, &53, &7f, &7d, &23             ; 3ef4: 00 ff 40... ..@
; &3efe referenced 1 time by &3eb4
.l3efe
    equb 0                                                            ; 3efe: 00          .
.drive_0_command
    equs "DRIVE "                                                     ; 3eff: 44 52 49... DRI
; &3f05 referenced 1 time by &3c98
.l3f05
    equb &30, &0d                                                     ; 3f05: 30 0d       0.
.dir_dollar_command
    equs "DIR $"                                                      ; 3f07: 44 49 52... DIR
    equb &0d                                                          ; 3f0c: 0d          .

; &3f0d referenced 2 times by &3e9e, &3ec6
.c3f0d
    lda #0                                                            ; 3f0d: a9 00       ..
    jsr sub_c132c                                                     ; 3f0f: 20 2c 13     ,.
    stx l0070                                                         ; 3f12: 86 70       .p
    sty l0071                                                         ; 3f14: 84 71       .q
    ldy #&11                                                          ; 3f16: a0 11       ..
; &3f18 referenced 1 time by &3f1e
.loop_c3f18
    lda (l0070),y                                                     ; 3f18: b1 70       .p
    sta l0a7e,y                                                       ; 3f1a: 99 7e 0a    .~.
    dey                                                               ; 3f1d: 88          .
    bne loop_c3f18                                                    ; 3f1e: d0 f8       ..
    lda (l0070),y                                                     ; 3f20: b1 70       .p
    and #&40 ; '@'                                                    ; 3f22: 29 40       )@
    beq c3f2d                                                         ; 3f24: f0 07       ..
    lda (l0070),y                                                     ; 3f26: b1 70       .p
    and #&bf                                                          ; 3f28: 29 bf       ).
    sta l1103                                                         ; 3f2a: 8d 03 11    ...
; &3f2d referenced 1 time by &3f24
.c3f2d
    jsr sub_c3f6f                                                     ; 3f2d: 20 6f 3f     o?
    lda #osbyte_reset_soft_keys                                       ; 3f30: a9 12       ..
    jsr osbyte                                                        ; 3f32: 20 f4 ff     ..            ; Reset function keys
    jsr sub_c2980                                                     ; 3f35: 20 80 29     .)
    jsr sub_c29a8                                                     ; 3f38: 20 a8 29     .)
    lda l004c                                                         ; 3f3b: a5 4c       .L
    pha                                                               ; 3f3d: 48          H
    lda #&58 ; 'X'                                                    ; 3f3e: a9 58       .X
    sta l004c                                                         ; 3f40: 85 4c       .L
    ldx #&24 ; '$'                                                    ; 3f42: a2 24       .$
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
    jsr sub_c18a6                                                     ; 3f56: 20 a6 18     ..
    sta l005f                                                         ; 3f59: 85 5f       ._
    jmp l110c                                                         ; 3f5b: 4c 0c 11    L..

    equs "icodata"                                                    ; 3f5e: 69 63 6f... ico
    equb &0d                                                          ; 3f65: 0d          .
; &3f66 referenced 1 time by &3cfc
.character_fe_bitmap
    equb %00001000                                                    ; 3f66: 08          .
    equb %00010100                                                    ; 3f67: 14          .
    equb %00100010                                                    ; 3f68: 22          "
    equb %01000001                                                    ; 3f69: 41          A
    equb %00100010                                                    ; 3f6a: 22          "
    equb %00010100                                                    ; 3f6b: 14          .
    equb %00001000                                                    ; 3f6c: 08          .
    equb %00000000                                                    ; 3f6d: 00          .
; &3f6e referenced 2 times by &3c0e, &3d91
.initial_screen_disabled_flag
    equb 0                                                            ; 3f6e: 00          .

; &3f6f referenced 1 time by &3f2d
.sub_c3f6f
    lda l1103                                                         ; 3f6f: ad 03 11    ...
    and #1                                                            ; 3f72: 29 01       ).
    sta l005b                                                         ; 3f74: 85 5b       .[
    beq c3fba                                                         ; 3f76: f0 42       .B
    ldy #&0f                                                          ; 3f78: a0 0f       ..
    sei                                                               ; 3f7a: 78          x
; &3f7b referenced 1 time by &3f82
.loop_c3f7b
    lda l3fbb,y                                                       ; 3f7b: b9 bb 3f    ..?
    sta l8000,y                                                       ; 3f7e: 99 00 80    ...
    dey                                                               ; 3f81: 88          .
    bpl loop_c3f7b                                                    ; 3f82: 10 f7       ..
    cli                                                               ; 3f84: 58          X
    ldy #0                                                            ; 3f85: a0 00       ..
; &3f87 referenced 1 time by &3f94
.loop_c3f87
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
    ldx #&4c ; 'L'                                                    ; 3fa1: a2 4c       .L
    ldy #0                                                            ; 3fa3: a0 00       ..
    jsr osbyte                                                        ; 3fa5: 20 f4 ff     ..            ; Write reset intercept code (opcode), value X=76
    lda #osbyte_read_write_second_byte_break_intercept                ; 3fa8: a9 f8       ..
    ldx #&45 ; 'E'                                                    ; 3faa: a2 45       .E
    ldy #0                                                            ; 3fac: a0 00       ..
    jsr osbyte                                                        ; 3fae: 20 f4 ff     ..            ; Write reset intercept code (operand low), value X=69
    lda #osbyte_read_write_third_byte_break_intercept                 ; 3fb1: a9 f9       ..
    ldx #&18                                                          ; 3fb3: a2 18       ..
    ldy #0                                                            ; 3fb5: a0 00       ..
    jsr osbyte                                                        ; 3fb7: 20 f4 ff     ..            ; Write reset intercept code (operand high), value X=24
; &3fba referenced 1 time by &3f76
.c3fba
    rts                                                               ; 3fba: 60          `

; &3fbb referenced 1 time by &3f7b
.l3fbb
    equb &4c,   8, &80, &4c,   8, &80,   0, &0a, &60,   0,   0,   0   ; 3fbb: 4c 08 80... L..
    equb   0,   0,   0,   0                                           ; 3fc7: 00 00 00... ...
; &3fcb referenced 1 time by &3c79
.l3fcb
    equb &a9, &ff, &8d, &0a, &11, &ad, &5d, &17, &8d, &5e, &17, &ad   ; 3fcb: a9 ff 8d... ...
    equb &5f, &17, &8d, &60, &17, &78, &a9, &7f, &8d, &6e, &fe, &a9   ; 3fd7: 5f 17 8d... _..
    equb &c0, &8d, &4b, &fe, &a9, &ff, &8d, &48, &fe, &a9, &3c, &8d   ; 3fe3: c0 8d 4b... ..K
    equb &4e, &fe, &a9, &a0, &8d,   4,   2, &a9, &17, &8d,   5,   2   ; 3fef: 4e fe a9... N..
    equb &58, &20, &8c, &17, &20, &8c, &17, &a9,   7, &8d,   0, &fe   ; 3ffb: 58 20 8c... X .
    equb &ad, &0b, &11, &8d,   1, &fe, &a9, &0d, &8d,   0, &fe, &a9   ; 4007: ad 0b 11... ...
    equb &78, &8d,   1, &fe, &a9, &0c, &8d,   0, &fe, &a9, &0b, &8d   ; 4013: 78 8d 01... x..
    equb   1, &fe, &a9,   6, &8d,   0, &fe, &a9, &1d, &8d,   1, &fe   ; 401f: 01 fe a9... ...
    equb &60                                                          ; 402b: 60          `
; &402c referenced 1 time by &3f87
.l402c
    equb &78, &ad, &b5, &0a, &8d,   4,   2, &ad, &b6, &0a, &8d,   5   ; 402c: 78 ad b5... x..
    equb   2, &58, &a9,   3, &20, &ee, &ff, &a9, &16, &20, &ee, &ff   ; 4038: 02 58 a9... .X.
    equb &a9,   7, &20, &ee, &ff, &a9,   4, &a2,   0, &a0,   0, &20   ; 4044: a9 07 20... ..
    equb &f4, &ff, &a9, &c8, &a2,   0, &a0,   0, &20, &f4, &ff, &a9   ; 4050: f4 ff a9... ...
    equb &0f, &a2,   0, &20, &f4, &ff, &a9,   0, &8d, &87,   2, &68   ; 405c: 0f a2 00... ...
    equb &68, &a9, &42, &85, &70, &a9, &41, &85, &71, &a9, &53, &85   ; 4068: 68 a9 42... h.B
    equb &72, &a9, &49, &85, &73, &a9, &43, &85, &74, &a9, &0d, &85   ; 4074: 72 a9 49... r.I
    equb &75, &a2, &70, &a0,   0, &4c, &f7, &ff                       ; 4080: 75 a2 70... u.p
; &4088 referenced 1 time by &3c6c
.l4088
    equb &a9,   0, &aa, &9d, &ef,   9, &e8, &e0, &80, &90, &f8, &60   ; 4088: a9 00 aa... ...
    equb &a9,   0, &aa, &5d, &ef,   9, &e8, &e0, &80, &90, &f8, &4d   ; 4094: a9 00 aa... ...
    equb &ea,   9, &49, &ff, &60, &c0, &51, &f0, &26, &48, &8a, &48   ; 40a0: ea 09 49... ..I
    equb &98, &a2, &0f, &dd, &80, &0a, &f0,   3, &ca, &10, &f8, &8a   ; 40ac: 98 a2 0f... ...
    equb &18, &69, &41, &a8, &68, &aa, &68, &60, &c0, &51, &f0, &0b   ; 40b8: 18 69 41... .iA
    equb &48, &98, &38, &e9, &41, &a8, &b9, &80, &0a, &a8, &68, &60   ; 40c4: 48 98 38... H.8
; &40d0 referenced 1 time by &3c84
.l40d0
    equb &48, &8a, &48, &a2,   2, &bd, &ec,   9, &d5, &5c, &f0, &1a   ; 40d0: 48 8a 48... H.H
    equb &95, &5c, &a9, &1f, &20, &ee, &ff, &8a, &49, &ff             ; 40dc: 95 5c a9... .\.
    equs "8i% "                                                       ; 40e6: 38 69 25... 8i%
    equb &ee, &ff, &a9,   6, &20, &ee, &ff, &b5                       ; 40ea: ee ff a9... ...
    equs "\ f"                                                        ; 40f2: 5c 20 66    \ f
    equb &18, &ca, &e0, &ff, &d0, &da, &68, &aa, &68, &60             ; 40f5: 18 ca e0... ...
.some_data_high_copy_TODO
    equb &ae,   6, &11, &ac,   7, &11, &4c, &91, &17, &12, &20,   0   ; 40ff: ae 06 11... ...
    equb   4, &a5,   4, &f0                                           ; 410b: 04 a5 04... ...
    equs ") c8"                                                       ; 410f: 29 20 63... ) c
    equb &a2, &ff, &86, &3e, &e8, &86, &3f, &a9, &a9, &85, &40, &a9   ; 4113: a2 ff 86... ...
    equb &0a, &85, &41, &e8, &86, &42, &a0,   1, &ad,   9,   4, &38   ; 411f: 0a 85 41... ..A
    equb &e9,   2, &85, &3c, &a9,   3, &85, &3d, &20, &bb, &1a, &4c   ; 412b: e9 02 85... ...
    equb &44,   4, &a9, &ff, &85,   4, &20, &74,   4, &20, &cb,   4   ; 4137: 44 04 a9... D..
    equb &a9, &1f, &20, &ee, &ff, &a9,   0, &20, &ee, &ff, &a9,   9   ; 4143: a9 1f 20... ..
    equb &4c, &ee, &ff, &a5,   4, &f0, &1c, &20,   0,   4             ; 414f: 4c ee ff... L..
    equs " c8"                                                        ; 4159: 20 63 38     c8
    equb &a2, &ff, &86, &3e, &86, &42, &e8, &86,   4, &86, &3f, &a9   ; 415c: a2 ff 86... ...
    equb &30, &85, &40, &a9,   5, &85, &41, &4c,   5,   5, &60, &a9   ; 4168: 30 85 40... 0.@
    equb   0, &85, &74, &85, &76, &a5, &4c, &85, &75, &85, &77, &a9   ; 4174: 00 85 74... ..t
    equb &30, &85, &7a, &a9,   5, &85, &7b, &18, &a9,   5, &85, &73   ; 4180: 30 85 7a... 0.z
    equb &ae,   9,   4, &a0,   7, &b1, &76, &91, &7a, &88, &10, &f9   ; 418c: ae 09 04... ...
    equb &a5, &7a, &69,   8, &85, &7a, &90,   3, &e6, &7b, &18, &ca   ; 4198: a5 7a 69... .zi
    equb &f0, &0d, &a5, &76, &69,   8, &85, &76, &90, &e1, &e6, &77   ; 41a4: f0 0d a5... ...
    equb &18, &90, &dc, &c6, &73, &f0, &12, &a5                       ; 41b0: 18 90 dc... ...
    equs "ti@"                                                        ; 41b8: 74 69 40    ti@
    equb &85, &74, &85, &76, &a5, &75, &69,   1, &85, &75, &85, &77   ; 41bb: 85 74 85... .t.
    equb &90, &c3, &60, &a2, &ff, &86, &3e, &e8, &86, &3f, &8e, &18   ; 41c7: 90 c3 60... ..`
    equb   5, &a9, &a9, &85, &40, &a9, &0a, &85, &41, &e8, &86, &42   ; 41d3: 05 a9 a9... ...
    equb &20,   5,   5, &ad,   9,   4, &0a, &0a, &0a, &38, &e9,   1   ; 41df: 20 05 05...  ..
    equb &0a, &2e, &18,   5, &0a, &8d, &17,   5, &2e, &18,   5, &a0   ; 41eb: 0a 2e 18... ...
    equb   0, &b9, &15,   5, &20, &ee, &ff, &c8, &c0, &12, &90, &f5   ; 41f7: 00 b9 15... ...
    equb &60, &a2,   0, &a0,   0, &ad,   9,   4, &85, &3c, &a9,   5   ; 4203: 60 a2 00... `..
    equb &85, &3d, &4c, &bb, &1a, &19,   4,   0,   0, &fc,   2, &19   ; 420f: 85 3d 4c... .=L
    equb   1,   0,   0, &64, &ff, &19,   5,   0,   0, &60,   2        ; 421b: 01 00 00... ...
.pydis_end

; Label references by decreasing frequency:
;     l0070:                            21
;     oswrch:                           20
;     l0072:                            17
;     osbyte:                           15
;     l0071:                            13
;     l0073:                            13
;     l0080:                            12
;     l004c:                             6
;     crtc_address_register:             6
;     crtc_address_write:                6
;     l007a:                             5
;     l007b:                             5
;     l007d:                             5
;     l09df:                             5
;     l0054:                             4
;     l0055:                             4
;     l0079:                             4
;     l1103:                             4
;     c16dc:                             4
;     c173d:                             4
;     c3497:                             4
;     c38ab:                             4
;     osword:                            4
;     l0015:                             3
;     l0045:                             3
;     l0078:                             3
;     l007c:                             3
;     l007e:                             3
;     l0082:                             3
;     l0085:                             3
;     l0088:                             3
;     c16c4:                             3
;     c174f:                             3
;     sub_c1f4c:                         3
;     c3426:                             3
;     c3867:                             3
;     sub_c395e:                         3
;     l0004:                             2
;     l0005:                             2
;     l001d:                             2
;     l0030:                             2
;     l0031:                             2
;     l003c:                             2
;     l003d:                             2
;     l0056:                             2
;     l0083:                             2
;     l0084:                             2
;     l040a:                             2
;     l0453:                             2
;     l09be:                             2
;     l09ea:                             2
;     l09ef:                             2
;     l1104:                             2
;     l110c:                             2
;     l1486:                             2
;     l1487:                             2
;     c1581:                             2
;     c159f:                             2
;     l160c:                             2
;     c167b:                             2
;     l196f:                             2
;     sub_c1ebb:                         2
;     c1efa:                             2
;     c3462:                             2
;     l34d7:                             2
;     sub_c3617:                         2
;     c3665:                             2
;     l36da:                             2
;     c377a:                             2
;     c377d:                             2
;     l381c:                             2
;     c3827:                             2
;     l3850:                             2
;     sub_c385d:                         2
;     c3872:                             2
;     sub_c388d:                         2
;     sub_c3a8f:                         2
;     c3c2c:                             2
;     c3c5c:                             2
;     c3c6a:                             2
;     c3dae:                             2
;     c3ea1:                             2
;     sub_c3ec9:                         2
;     sub_c3ed5:                         2
;     c3f0d:                             2
;     initial_screen_disabled_flag:      2
;     oscli:                             2
;     l0002:                             1
;     l0006:                             1
;     l0007:                             1
;     l0008:                             1
;     l0009:                             1
;     l000a:                             1
;     l001e:                             1
;     l0028:                             1
;     l002e:                             1
;     l0032:                             1
;     l0037:                             1
;     l003a:                             1
;     l003b:                             1
;     l0043:                             1
;     l005b:                             1
;     l005c:                             1
;     l005d:                             1
;     l005e:                             1
;     l005f:                             1
;     l0077:                             1
;     l007f:                             1
;     l0081:                             1
;     l0087:                             1
;     l00a0:                             1
;     l0131:                             1
;     brkv:                              1
;     brkv+1:                            1
;     irq1v:                             1
;     irq1v+1:                           1
;     l09a8:                             1
;     l09d4:                             1
;     l09eb:                             1
;     l0a7e:                             1
;     l0a90:                             1
;     l0aa1:                             1
;     l0aa9:                             1
;     l0ab1:                             1
;     l0ab2:                             1
;     l0ab3:                             1
;     l0ab4:                             1
;     l0ab5:                             1
;     l0ab6:                             1
;     l0ab7:                             1
;     l0ac3:                             1
;     l0ad4:                             1
;     l0b00:                             1
;     l0c00:                             1
;     l0e1a:                             1
;     l110b:                             1
;     l1140:                             1
;     sub_c132c:                         1
;     l1377:                             1
;     c137f:                             1
;     l1488:                             1
;     l1489:                             1
;     c1517:                             1
;     c1568:                             1
;     c1577:                             1
;     l1589:                             1
;     l1593:                             1
;     c1597:                             1
;     loop_c1671:                        1
;     c1682:                             1
;     c168f:                             1
;     c16a5:                             1
;     c16f4:                             1
;     c1724:                             1
;     sub_c1728:                         1
;     loop_c1754:                        1
;     c1759:                             1
;     c175d:                             1
;     l175f:                             1
;     l1761:                             1
;     sub_c1866:                         1
;     sub_c18a6:                         1
;     loop_c1961:                        1
;     c1966:                             1
;     l1e16:                             1
;     l1e1a:                             1
;     c1f17:                             1
;     c1f19:                             1
;     c1f21:                             1
;     c1f5e:                             1
;     c1f64:                             1
;     c1f6e:                             1
;     c1f74:                             1
;     l2200:                             1
;     sub_c2248:                         1
;     l24d0:                             1
;     l24d1:                             1
;     sub_c25f5:                         1
;     l288f:                             1
;     l2890:                             1
;     sub_c2980:                         1
;     sub_c29a8:                         1
;     loop_c29af:                        1
;     c29bd:                             1
;     l31d7:                             1
;     l3316:                             1
;     c340d:                             1
;     c3447:                             1
;     c344f:                             1
;     c348c:                             1
;     c363f:                             1
;     c36c7:                             1
;     c36cc:                             1
;     c36db:                             1
;     c36ed:                             1
;     c3706:                             1
;     c3713:                             1
;     c371e:                             1
;     sub_c37f3:                         1
;     c3803:                             1
;     c380c:                             1
;     c3824:                             1
;     sub_c384d:                         1
;     l384e:                             1
;     c384f:                             1
;     sub_c3863:                         1
;     c3875:                             1
;     l388a:                             1
;     c38ac:                             1
;     c38ad:                             1
;     l38c2:                             1
;     l38c3:                             1
;     loop_c396b:                        1
;     c3979:                             1
;     l3ac7:                             1
;     l3ac9:                             1
;     l3adf:                             1
;     l3ae0:                             1
;     c3c3a:                             1
;     c3c56:                             1
;     loop_c3c6c:                        1
;     loop_c3c79:                        1
;     loop_c3c84:                        1
;     c3c9b:                             1
;     loop_c3cfc:                        1
;     loop_c3d54:                        1
;     initial_screen_disabled_flag_ok:   1
;     c3db9:                             1
;     loop_c3e52:                        1
;     c3ec1:                             1
;     l3ee8:                             1
;     l3ef2:                             1
;     l3efe:                             1
;     l3f05:                             1
;     loop_c3f18:                        1
;     c3f2d:                             1
;     character_fe_bitmap:               1
;     sub_c3f6f:                         1
;     loop_c3f7b:                        1
;     loop_c3f87:                        1
;     c3fba:                             1
;     l3fbb:                             1
;     l3fcb:                             1
;     l402c:                             1
;     l4088:                             1
;     l40d0:                             1
;     l8000:                             1
;     l8d17:                             1
;     l9d09:                             1
;     la9ff:                             1
;     lbe00:                             1
;     lbf00:                             1
;     video_ula_palette:                 1
;     user_via_t1c_l:                    1
;     user_via_t1c_h:                    1
;     user_via_t2c_l:                    1
;     user_via_t2c_h:                    1

; Automatically generated labels:
;     c137f
;     c1517
;     c1568
;     c1577
;     c1581
;     c1597
;     c159f
;     c167b
;     c1682
;     c168f
;     c16a5
;     c16c4
;     c16dc
;     c16f4
;     c1724
;     c173d
;     c174f
;     c1759
;     c175d
;     c1966
;     c1efa
;     c1f17
;     c1f19
;     c1f21
;     c1f5e
;     c1f64
;     c1f6e
;     c1f74
;     c29bd
;     c340d
;     c3426
;     c3447
;     c344f
;     c3462
;     c348c
;     c3497
;     c363f
;     c3665
;     c36c7
;     c36cc
;     c36db
;     c36ed
;     c3706
;     c3713
;     c371e
;     c377a
;     c377d
;     c3803
;     c380c
;     c3824
;     c3827
;     c384f
;     c3867
;     c3872
;     c3875
;     c38ab
;     c38ac
;     c38ad
;     c3979
;     c3c2c
;     c3c3a
;     c3c56
;     c3c5c
;     c3c6a
;     c3c9b
;     c3dae
;     c3db9
;     c3ea1
;     c3ec1
;     c3f0d
;     c3f2d
;     c3fba
;     l0002
;     l0004
;     l0005
;     l0006
;     l0007
;     l0008
;     l0009
;     l000a
;     l0015
;     l001d
;     l001e
;     l0028
;     l002e
;     l0030
;     l0031
;     l0032
;     l0037
;     l003a
;     l003b
;     l003c
;     l003d
;     l0043
;     l0045
;     l004c
;     l0054
;     l0055
;     l0056
;     l005b
;     l005c
;     l005d
;     l005e
;     l005f
;     l0070
;     l0071
;     l0072
;     l0073
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
;     l0087
;     l0088
;     l00a0
;     l00c9
;     l0131
;     l040a
;     l0453
;     l09a8
;     l09be
;     l09d4
;     l09df
;     l09ea
;     l09eb
;     l09ef
;     l0a7e
;     l0a90
;     l0aa1
;     l0aa9
;     l0ab1
;     l0ab2
;     l0ab3
;     l0ab4
;     l0ab5
;     l0ab6
;     l0ab7
;     l0ac3
;     l0ad4
;     l0b00
;     l0c00
;     l0e1a
;     l1103
;     l1104
;     l110b
;     l110c
;     l1140
;     l1377
;     l1486
;     l1487
;     l1488
;     l1489
;     l1589
;     l1593
;     l160c
;     l175f
;     l1761
;     l196f
;     l1e16
;     l1e1a
;     l2200
;     l24d0
;     l24d1
;     l288f
;     l2890
;     l31d7
;     l3316
;     l34d7
;     l36da
;     l37e4
;     l381c
;     l384e
;     l3850
;     l388a
;     l38c2
;     l38c3
;     l3ac7
;     l3ac9
;     l3adf
;     l3ae0
;     l3ee1
;     l3ee8
;     l3eea
;     l3ef2
;     l3ef4
;     l3efe
;     l3f05
;     l3fbb
;     l3fcb
;     l402c
;     l4088
;     l40d0
;     l8000
;     l8d17
;     l9d09
;     la9ff
;     lbe00
;     lbf00
;     loop_c1671
;     loop_c1754
;     loop_c1961
;     loop_c29af
;     loop_c396b
;     loop_c3c6c
;     loop_c3c79
;     loop_c3c84
;     loop_c3cfc
;     loop_c3d54
;     loop_c3e52
;     loop_c3f18
;     loop_c3f7b
;     loop_c3f87
;     sub_c132c
;     sub_c1588
;     sub_c1592
;     sub_c1728
;     sub_c1866
;     sub_c18a6
;     sub_c1ebb
;     sub_c1f4c
;     sub_c2248
;     sub_c25f5
;     sub_c2980
;     sub_c29a8
;     sub_c3617
;     sub_c37f3
;     sub_c381b
;     sub_c384d
;     sub_c385d
;     sub_c3863
;     sub_c388d
;     sub_c395e
;     sub_c3a8f
;     sub_c3ec9
;     sub_c3ed5
;     sub_c3f6f
    assert <(dir_dollar_command) == &07
    assert <(drive_0_command) == &ff
    assert <(l3ee1) == &e1
    assert <(l3eea) == &ea
    assert <(l3ef4) == &f4
    assert <some_data_high_copy_TODO == &ff
    assert <some_data_low_TODO == &00
    assert >(dir_dollar_command) == &3f
    assert >(drive_0_command) == &3e
    assert >(l3ee1) == &3e
    assert >(l3eea) == &3e
    assert >(l3ef4) == &3e
    assert >some_data_high_copy_TODO == &40
    assert >some_data_low_TODO == &04
    assert crtc_cursor_start == &0a
    assert crtc_interlace_delay == &08
    assert crtc_screen_start_high == &0c
    assert crtc_screen_start_low == &0d
    assert crtc_vert_displayed == &06
    assert crtc_vert_sync_pos == &07
    assert osbyte_close_spool_exec == &77
    assert osbyte_opt == &8b
    assert osbyte_read_vdu_status == &75
    assert osbyte_read_write_escape_break_effect == &c8
    assert osbyte_read_write_first_byte_break_intercept == &f7
    assert osbyte_read_write_second_byte_break_intercept == &f8
    assert osbyte_read_write_third_byte_break_intercept == &f9
    assert osbyte_reset_soft_keys == &12
    assert osbyte_select_adc_channels == &10
    assert osbyte_set_cursor_editing == &04
    assert osbyte_set_printer_ignore == &06
    assert osbyte_tv == &90
    assert osword_envelope == &08
    assert vdu_define_character == &17
    assert vdu_define_text_window == &1c
    assert vdu_enable == &06
    assert vdu_set_graphics_colour == &12
    assert vdu_set_mode == &16
    assert vdu_set_text_colour == &11

save pydis_start, pydis_end
