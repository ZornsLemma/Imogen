; Constants
collision_map_none                   = 0
collision_map_out_of_bounds          = 255
collision_map_rope                   = 2
collision_map_solid_rock             = 3
collision_map_unknown                = 1
copy_mode_2x2                        = 0
copy_mode_random16                   = 16
copy_mode_random2                    = 2
copy_mode_random32                   = 32
copy_mode_random4                    = 4
copy_mode_random64                   = 64
copy_mode_random8                    = 8
copy_mode_simple                     = 1
exit_room_bottom                     = 2
exit_room_left                       = 1
exit_room_right                      = 4
exit_room_top                        = 8
first_level_letter                   = 65
game_area_height_cells               = 24
game_area_width_cells                = 40
last_level_letter                    = 81
object_collided_ceiling              = 8
object_collided_floor                = 2
object_collided_left_wall            = 1
object_collided_right_wall           = 4
objectid_old_player                  = 11
objectid_old_player_accessory        = 12
objectid_player                      = 0
objectid_player_accessory            = 1
opcode_jmp                           = 76
osbyte_flush_buffer_class            = 15
sprite_op_flags_copy_screen          = 1
sprite_op_flags_erase_to_bg_colour   = 2
sprite_op_flags_erase_to_fg_colour   = 4
sprite_op_flags_normal               = 0

; Memory locations
characters_entered                                  = $05
sprite_reflect_flag                                 = $1d
l002e                                               = $2e
desired_room_index                                  = $30
current_level                                       = $31
temp_sprite_x_offset                                = $3a
temp_sprite_y_offset                                = $3b
width_in_cells                                      = $3c
height_in_cells                                     = $3d
value_to_write_to_collision_map                     = $3e
source_sprite_memory_low                            = $40
source_sprite_memory_high                           = $41
copy_mode                                           = $42
previous_room_index                                 = $50
level_before_latest_level_and_room_initialisation   = $51
player_held_object_spriteid                         = $52
l0054                                               = $54
l0055                                               = $55
developer_mode_sideways_ram_is_set_up_flag          = $5b
l0070                                               = $70
l0071                                               = $71
l0072                                               = $72
l0073                                               = $73
l0074                                               = $74
l0075                                               = $75
l0076                                               = $76
l0077                                               = $77
l0078                                               = $78
l0079                                               = $79
l007a                                               = $7a
l007b                                               = $7b
l007c                                               = $7c
l007d                                               = $7d
show_dialog_box                                     = $040a
remove_dialog                                       = $0453
object_x_low                                        = $0950
object_x_low_old                                    = $095b
object_x_high                                       = $0966
object_x_high_old                                   = $0971
object_y_low                                        = $097c
object_y_low_old                                    = $0987
object_y_high                                       = $0992
object_y_high_old                                   = $099d
object_spriteid                                     = $09a8
object_spriteid_old                                 = $09b3
object_direction                                    = $09be
object_direction_old                                = $09c9
level_progress_table                                = $09ef
string_input_buffer                                 = $0a90
tile_all_set_pixels                                 = $0aa9
l0ab1                                               = $0ab1
l0ab2                                               = $0ab2
developer_flags                                     = $1103
l110c                                               = $110c
initialise_level_and_room                           = $1140
start_room                                          = $12bb
game_update                                         = $12da
update_room_first_update_flag                       = $132b
sprite_op                                           = $138d
l16dc                                               = $16dc
pending_toolbar_colour                              = $175d
toolbar_colour                                      = $175e
pending_gameplay_area_colour                        = $175f
gameplay_area_colour                                = $1760
use_colour_flag                                     = $1765
set_toolbar_and_gameplay_area_colours               = $1766
l178b                                               = $178b
l178c                                               = $178c
l1839                                               = $1839
get_random_number_up_to_a                           = $18a6
jmp_yx                                              = $1966
update_brazier_and_fire                             = $1988
update_level_completion                             = $1a10
currently_updating_logic_for_room_index             = $1aba
copy_rectangle_of_memory_to_screen                  = $1abb
draw_floor_walls_and_ceiling_around_solid_rock      = $1b90
draw_rope                                           = $1db9
write_value_to_a_rectangle_of_cells_in_collision_map = $1e44
write_a_single_value_to_cell_in_collision_map       = $1ebb
read_collision_map_value_for_xy                     = $1efa
draw_sprite_a_at_cell_xy                            = $1f4c
draw_sprite_a_at_cell_xy_and_write_to_collision_map = $1f57
set_object_position_from_cell_xy                    = $1f5d
set_object_position_from_current_sprite_position    = $1f6d
copy_object_state_to_old                            = $20f7
jmp_for_update_extra_player_character               = $22dd
play_landing_sound                                  = $23a9
player_wall_collision_reaction_speed                = $2433
find_left_and_right_of_object                       = $2434
temp_left_offset                                    = $24d0
temp_right_offset                                   = $24d1
temp_top_offset                                     = $2550
temp_bottom_offset                                  = $2551
get_solid_rock_collision_for_object_a               = $2894
temp_default_collision_map_option                   = $28e1
test_for_collision_between_objects_x_and_y          = $28e2
l296f                                               = $296f
l2980                                               = $2980
l29a8                                               = $29a8
insert_character_menu_item_into_toolbar             = $2b87
find_or_create_menu_slot_for_A                      = $2bbd
remove_item_from_toolbar_menu                       = $2be0
player_using_object_spriteid                        = $2eb6
previous_player_using_object_spriteid               = $2eb7
toolbar_collectable_spriteids                       = $2ee8
collectable_spriteids                               = $2eed
collectable_being_used_spriteids                    = $2ef2
inhibit_monkey_climb_flag                           = $31d7
l3617                                               = $3617
print_encrypted_string_at_yx_centred                = $37f3
l381c                                               = $381c
l387c                                               = $387c
wait_one_second_then_check_keys                     = $388d
object_erase_type                                   = $38ac
object_z_order                                      = $38c2
object_room_collision_flags                         = $38d8
play_sound_yx                                       = $38f6
sound_priority_per_channel_table                    = $396f
check_menu_keys                                     = $3a8f
l3acc                                               = $3acc
auxcode                                             = $53c0
check_password                                      = $53c0
oswrch                                              = $ffee
osbyte                                              = $fff4

    * = $3ad5

level_data
pydis_start
    !byte $3b, $0c                                                    ; 3ad5: 3b 0c
level_specific_initialisation_ptr
    !byte $d9                                                         ; 3ad7: d9
    !byte $3a                                                         ; 3ad8: 3a

level_specific_update_ptr
    pla                                                               ; 3ad9: 68
    pla                                                               ; 3ada: 68
level_specific_password_ptr
room_index_cheat1 = level_specific_password_ptr+2
    jsr l178c                                                         ; 3adb: 20 8c 17
room_index_cheat2
level_room_data_table = room_index_cheat2+1
    jsr l178c                                                         ; 3ade: 20 8c 17
    jsr sub_c3cc9                                                     ; 3ae1: 20 c9 3c
    lda #7                                                            ; 3ae4: a9 07
    sta toolbar_colour                                                ; 3ae6: 8d 5e 17
    sta gameplay_area_colour                                          ; 3ae9: 8d 60 17
    lda #$64 ; 'd'                                                    ; 3aec: a9 64
    jsr sub_c4325                                                     ; 3aee: 20 25 43
    lda #7                                                            ; 3af1: a9 07
    sta l0073                                                         ; 3af3: 85 73
    lda #$20 ; ' '                                                    ; 3af5: a9 20
    sta l0074                                                         ; 3af7: 85 74
    lda #$80                                                          ; 3af9: a9 80
    sta l0075                                                         ; 3afb: 85 75
c3afd
    lda #0                                                            ; 3afd: a9 00
    sta l178b                                                         ; 3aff: 8d 8b 17
    jsr sub_c3ce3                                                     ; 3b02: 20 e3 3c
    lda #$fc                                                          ; 3b05: a9 fc
    sta l0070                                                         ; 3b07: 85 70
    lda #$3f ; '?'                                                    ; 3b09: a9 3f
    sta l0071                                                         ; 3b0b: 85 71
    ldy #0                                                            ; 3b0d: a0 00
    sty l0072                                                         ; 3b0f: 84 72
    lda l0074                                                         ; 3b11: a5 74
    sta l0076                                                         ; 3b13: 85 76
    sta l0078                                                         ; 3b15: 85 78
    sta l007a                                                         ; 3b17: 85 7a
    lda l0075                                                         ; 3b19: a5 75
    sta l0077                                                         ; 3b1b: 85 77
    sta l0079                                                         ; 3b1d: 85 79
    sta l007b                                                         ; 3b1f: 85 7b
    jmp c3bbb                                                         ; 3b21: 4c bb 3b

c3b24
    ldy l0072                                                         ; 3b24: a4 72
    inc l0072                                                         ; 3b26: e6 72
    lda (l0070),y                                                     ; 3b28: b1 70
    eor #$cb                                                          ; 3b2a: 49 cb
    beq c3b93                                                         ; 3b2c: f0 65
    cmp #$0d                                                          ; 3b2e: c9 0d
    beq c3b96                                                         ; 3b30: f0 64
    cmp #$20 ; ' '                                                    ; 3b32: c9 20
    beq c3b80                                                         ; 3b34: f0 4a
    sec                                                               ; 3b36: 38
    sbc #$21 ; '!'                                                    ; 3b37: e9 21
    ldx #0                                                            ; 3b39: a2 00
    stx l007d                                                         ; 3b3b: 86 7d
    asl                                                               ; 3b3d: 0a
    asl                                                               ; 3b3e: 0a
    rol l007d                                                         ; 3b3f: 26 7d
    asl                                                               ; 3b41: 0a
    rol l007d                                                         ; 3b42: 26 7d
    adc #$0c                                                          ; 3b44: 69 0c
    sta l007c                                                         ; 3b46: 85 7c
    lda l007d                                                         ; 3b48: a5 7d
    adc #$3d ; '='                                                    ; 3b4a: 69 3d
    sta l007d                                                         ; 3b4c: 85 7d
    ldy #7                                                            ; 3b4e: a0 07
loop_c3b50
    lda (l007c),y                                                     ; 3b50: b1 7c
    sta l3cfb,y                                                       ; 3b52: 99 fb 3c
    dey                                                               ; 3b55: 88
    bpl loop_c3b50                                                    ; 3b56: 10 f8
    ldx #8                                                            ; 3b58: a2 08
    ldy l0073                                                         ; 3b5a: a4 73
c3b5c
    lda l007b                                                         ; 3b5c: a5 7b
    cmp #$80                                                          ; 3b5e: c9 80
    bcs c3b67                                                         ; 3b60: b0 05
    lda l3cfb,x                                                       ; 3b62: bd fb 3c
    sta (l007a),y                                                     ; 3b65: 91 7a
c3b67
    dex                                                               ; 3b67: ca
    bmi c3b80                                                         ; 3b68: 30 16
    dey                                                               ; 3b6a: 88
    bpl c3b5c                                                         ; 3b6b: 10 ef
    ldy #7                                                            ; 3b6d: a0 07
    lda l007a                                                         ; 3b6f: a5 7a
    sec                                                               ; 3b71: 38
    sbc #$40 ; '@'                                                    ; 3b72: e9 40
    sta l007a                                                         ; 3b74: 85 7a
    lda l007b                                                         ; 3b76: a5 7b
    sbc #1                                                            ; 3b78: e9 01
    sta l007b                                                         ; 3b7a: 85 7b
    cmp #$5d ; ']'                                                    ; 3b7c: c9 5d
    bcs c3b5c                                                         ; 3b7e: b0 dc
c3b80
    lda l0078                                                         ; 3b80: a5 78
    clc                                                               ; 3b82: 18
    adc #8                                                            ; 3b83: 69 08
    sta l0078                                                         ; 3b85: 85 78
    sta l007a                                                         ; 3b87: 85 7a
    lda l0079                                                         ; 3b89: a5 79
    adc #0                                                            ; 3b8b: 69 00
    sta l0079                                                         ; 3b8d: 85 79
    sta l007b                                                         ; 3b8f: 85 7b
    bne c3b24                                                         ; 3b91: d0 91
c3b93
    jmp c3bd8                                                         ; 3b93: 4c d8 3b

c3b96
    tya                                                               ; 3b96: 98
    ldy #0                                                            ; 3b97: a0 00
    sty l0072                                                         ; 3b99: 84 72
    sec                                                               ; 3b9b: 38
    adc l0070                                                         ; 3b9c: 65 70
    sta l0070                                                         ; 3b9e: 85 70
    lda #0                                                            ; 3ba0: a9 00
    adc l0071                                                         ; 3ba2: 65 71
    sta l0071                                                         ; 3ba4: 85 71
    lda l0076                                                         ; 3ba6: a5 76
    clc                                                               ; 3ba8: 18
    adc #$80                                                          ; 3ba9: 69 80
    sta l0076                                                         ; 3bab: 85 76
    sta l0078                                                         ; 3bad: 85 78
    sta l007a                                                         ; 3baf: 85 7a
    lda l0077                                                         ; 3bb1: a5 77
    adc #2                                                            ; 3bb3: 69 02
    sta l0077                                                         ; 3bb5: 85 77
    sta l0079                                                         ; 3bb7: 85 79
    sta l007b                                                         ; 3bb9: 85 7b
c3bbb
    cmp #$c0                                                          ; 3bbb: c9 c0
    bcs c3bca                                                         ; 3bbd: b0 0b
    cmp #$81                                                          ; 3bbf: c9 81
    bcs c3bd8                                                         ; 3bc1: b0 15
    cmp #$5d ; ']'                                                    ; 3bc3: c9 5d
    bcc c3bca                                                         ; 3bc5: 90 03
    jmp c3b24                                                         ; 3bc7: 4c 24 3b

c3bca
    lda (l0070),y                                                     ; 3bca: b1 70
    eor #$cb                                                          ; 3bcc: 49 cb
    beq c3bd8                                                         ; 3bce: f0 08
    cmp #$0d                                                          ; 3bd0: c9 0d
    beq c3b96                                                         ; 3bd2: f0 c2
    iny                                                               ; 3bd4: c8
    jmp c3bca                                                         ; 3bd5: 4c ca 3b

c3bd8
    lda l0073                                                         ; 3bd8: a5 73
    cmp #0                                                            ; 3bda: c9 00
    bne c3be4                                                         ; 3bdc: d0 06
    lda l0077                                                         ; 3bde: a5 77
    cmp #$5d ; ']'                                                    ; 3be0: c9 5d
    beq c3c14                                                         ; 3be2: f0 30
c3be4
    lda l0073                                                         ; 3be4: a5 73
    sec                                                               ; 3be6: 38
    sbc #1                                                            ; 3be7: e9 01
    and #7                                                            ; 3be9: 29 07
    sta l0073                                                         ; 3beb: 85 73
    bcs c3bfc                                                         ; 3bed: b0 0d
    lda l0074                                                         ; 3bef: a5 74
    sec                                                               ; 3bf1: 38
    sbc #$40 ; '@'                                                    ; 3bf2: e9 40
    sta l0074                                                         ; 3bf4: 85 74
    lda l0075                                                         ; 3bf6: a5 75
    sbc #1                                                            ; 3bf8: e9 01
    sta l0075                                                         ; 3bfa: 85 75
c3bfc
    lda developer_flags                                               ; 3bfc: ad 03 11
    and #1                                                            ; 3bff: 29 01
    beq c3c0a                                                         ; 3c01: f0 07
    ldx #$c6                                                          ; 3c03: a2 c6
    jsr l3acc                                                         ; 3c05: 20 cc 3a
    bne c3c11                                                         ; 3c08: d0 07
c3c0a
    lda l178b                                                         ; 3c0a: ad 8b 17
    cmp #4                                                            ; 3c0d: c9 04
    bcc c3c0a                                                         ; 3c0f: 90 f9
c3c11
    jmp c3afd                                                         ; 3c11: 4c fd 3a

c3c14
    lda #$32 ; '2'                                                    ; 3c14: a9 32
    jsr sub_c4325                                                     ; 3c16: 20 25 43
    ldx #4                                                            ; 3c19: a2 04
    ldy #$40 ; '@'                                                    ; 3c1b: a0 40
    sty l0074                                                         ; 3c1d: 84 74
    lda #$30 ; '0'                                                    ; 3c1f: a9 30
    sec                                                               ; 3c21: 38
    sbc l0074                                                         ; 3c22: e5 74
    sta l0070                                                         ; 3c24: 85 70
    lda #$43 ; 'C'                                                    ; 3c26: a9 43
    sbc #0                                                            ; 3c28: e9 00
    sta l0071                                                         ; 3c2a: 85 71
    lda #$80                                                          ; 3c2c: a9 80
    sec                                                               ; 3c2e: 38
    sbc l0074                                                         ; 3c2f: e5 74
    sta l0072                                                         ; 3c31: 85 72
    lda #$69 ; 'i'                                                    ; 3c33: a9 69
    sbc #0                                                            ; 3c35: e9 00
    sta l0073                                                         ; 3c37: 85 73
c3c39
    lda (l0070),y                                                     ; 3c39: b1 70
    sta (l0072),y                                                     ; 3c3b: 91 72
    iny                                                               ; 3c3d: c8
    bne c3c39                                                         ; 3c3e: d0 f9
    inc l0071                                                         ; 3c40: e6 71
    inc l0073                                                         ; 3c42: e6 73
    dex                                                               ; 3c44: ca
    bne c3c39                                                         ; 3c45: d0 f2
    lda #$1a                                                          ; 3c47: a9 1a
    jsr oswrch                                                        ; 3c49: 20 ee ff                ; Write character 26
    lda #$11                                                          ; 3c4c: a9 11
    jsr oswrch                                                        ; 3c4e: 20 ee ff                ; Write character 17
    lda #$80                                                          ; 3c51: a9 80
    jsr oswrch                                                        ; 3c53: 20 ee ff                ; Write character 128
    lda #$11                                                          ; 3c56: a9 11
    jsr oswrch                                                        ; 3c58: 20 ee ff                ; Write character 17
    lda #1                                                            ; 3c5b: a9 01
    jsr oswrch                                                        ; 3c5d: 20 ee ff                ; Write character 1
    lda #$1f                                                          ; 3c60: a9 1f
    jsr oswrch                                                        ; 3c62: 20 ee ff                ; Write character 31
    lda #3                                                            ; 3c65: a9 03
    jsr oswrch                                                        ; 3c67: 20 ee ff                ; Write character 3
    lda #$14                                                          ; 3c6a: a9 14
    jsr oswrch                                                        ; 3c6c: 20 ee ff                ; Write character 20
    ldx #$a6                                                          ; 3c6f: a2 a6
    ldy #$3c ; '<'                                                    ; 3c71: a0 3c
    jsr l381c                                                         ; 3c73: 20 1c 38
    lda #$1c                                                          ; 3c76: a9 1c
    jsr oswrch                                                        ; 3c78: 20 ee ff                ; Write character 28
    lda #1                                                            ; 3c7b: a9 01
    jsr oswrch                                                        ; 3c7d: 20 ee ff                ; Write character 1
    lda #$1f                                                          ; 3c80: a9 1f
    jsr oswrch                                                        ; 3c82: 20 ee ff                ; Write character 31
    lda #$27 ; '''                                                    ; 3c85: a9 27
    jsr oswrch                                                        ; 3c87: 20 ee ff                ; Write character 39
    lda #9                                                            ; 3c8a: a9 09
    jsr oswrch                                                        ; 3c8c: 20 ee ff                ; Write character 9
    lda #$11                                                          ; 3c8f: a9 11
    jsr oswrch                                                        ; 3c91: 20 ee ff                ; Write character 17
    lda #$81                                                          ; 3c94: a9 81
    jsr oswrch                                                        ; 3c96: 20 ee ff                ; Write character 129
    lda #$11                                                          ; 3c99: a9 11
    jsr oswrch                                                        ; 3c9b: 20 ee ff                ; Write character 17
    lda #0                                                            ; 3c9e: a9 00
    jsr oswrch                                                        ; 3ca0: 20 ee ff                ; Write character 0
    jmp c42aa                                                         ; 3ca3: 4c aa 42

    !byte $88, $a4, $bb, $b2, $b9, $a2, $ac, $a3, $bf, $eb, $86, $a2  ; 3ca6: 88 a4 bb...
    !byte $a8, $b9, $a4, $eb, $9b, $a4, $bc, $ae, $b9, $eb, $87, $a2  ; 3cb2: a8 b9 a4...
    !byte $a6, $a2, $bf, $ae, $af, $eb, $fa, $f2, $f3, $fd, $c6       ; 3cbe: a6 a2 bf...

sub_c3cc9
    lda #0                                                            ; 3cc9: a9 00
    sta l0070                                                         ; 3ccb: 85 70
    lda #$5b ; '['                                                    ; 3ccd: a9 5b
    sta l0071                                                         ; 3ccf: 85 71
    lda #0                                                            ; 3cd1: a9 00
    ldx #$80                                                          ; 3cd3: a2 80
    ldy #$c0                                                          ; 3cd5: a0 c0
c3cd7
    sta (l0070),y                                                     ; 3cd7: 91 70
    iny                                                               ; 3cd9: c8
    bne c3cd7                                                         ; 3cda: d0 fb
    inc l0071                                                         ; 3cdc: e6 71
    cpx l0071                                                         ; 3cde: e4 71
    bne c3cd7                                                         ; 3ce0: d0 f5
    rts                                                               ; 3ce2: 60

sub_c3ce3
    lda developer_mode_sideways_ram_is_set_up_flag                    ; 3ce3: a5 5b
    beq return1                                                       ; 3ce5: f0 13
    lda developer_flags                                               ; 3ce7: ad 03 11
    and #1                                                            ; 3cea: 29 01
    beq return1                                                       ; 3cec: f0 0c
    ldx #$8f                                                          ; 3cee: a2 8f
    jsr l3acc                                                         ; 3cf0: 20 cc 3a
    beq return1                                                       ; 3cf3: f0 05
    pla                                                               ; 3cf5: 68
    pla                                                               ; 3cf6: 68
    jmp l1839                                                         ; 3cf7: 4c 39 18

return1
    rts                                                               ; 3cfa: 60

l3cfb
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 3cfb: 00 00 00...
    !byte   0,   0,   0,   0,   0, $0c, $0c, $18, $18, $18,   0, $30  ; 3d07: 00 00 00...
    !byte   0                                                         ; 3d13: 00
    !text "66l"                                                       ; 3d14: 36 36 6c
    !byte   0,   0,   0,   0,   0, $1b, $1b, $7f, $36, $7f, $6c, $6c  ; 3d17: 00 00 00...
    !byte   0,   6, $1f, $68, $3e, $0b, $fc, $30,   0, $30, $33, $0c  ; 3d23: 00 06 1f...
    !byte $18, $30, $cc, $0c,   0, $1c                                ; 3d2f: 18 30 cc...
    !text "6l8m"                                                      ; 3d35: 36 6c 38...
    !byte $cc, $76,   0,   6, $0c, $30,   0,   0,   0,   0,   0,   6  ; 3d39: cc 76 00...
    !byte $0c                                                         ; 3d45: 0c
    !text "0000"                                                      ; 3d46: 30 30 30...
    !byte $18,   0, $18, $0c, $0c, $0c, $0c, $30, $60,   0,   0, $0c  ; 3d4a: 18 00 18...
    !text "~<~0"                                                      ; 3d56: 7e 3c 7e...
    !byte   0,   0,   0, $0c, $18, $7e, $18, $30,   0,   0,   0,   0  ; 3d5a: 00 00 00...
    !byte   0,   0,   0                                               ; 3d66: 00 00 00
    !text "00`"                                                       ; 3d69: 30 30 60
    !byte   0,   0,   0, $7e,   0,   0,   0,   0,   0,   0,   0,   0  ; 3d6c: 00 00 00...
    !byte   0, $30, $30,   0,   0,   3, $0c, $18, $30, $c0,   0,   0  ; 3d78: 00 30 30...
    !byte $1e                                                         ; 3d84: 1e
    !text "3n~v"                                                      ; 3d85: 33 6e 7e...
    !byte $cc, $78,   0, $0c, $1c, $18, $18, $18, $30, $fc,   0, $1e  ; 3d89: cc 78 00...
    !byte $33,   6, $0c, $18, $60, $fc,   0, $1e, $33,   6, $1c,   6  ; 3d95: 33 06 0c...
    !byte $cc, $78,   0,   6, $0e                                     ; 3da1: cc 78 00...
    !text "<l~"                                                       ; 3da6: 3c 6c 7e
    !byte $18, $18,   0                                               ; 3da9: 18 18 00
    !text "?0|"                                                       ; 3dac: 3f 30 7c
    !byte   6,   6, $cc, $78,   0, $0e, $18                           ; 3daf: 06 06 cc...
    !text "`|f"                                                       ; 3db6: 60 7c 66
    !byte $cc, $78,   0, $3f,   3, $0c, $18                           ; 3db9: cc 78 00...
    !text "0``"                                                       ; 3dc0: 30 60 60
    !byte   0, $1e                                                    ; 3dc3: 00 1e
    !text "3f<f"                                                      ; 3dc5: 33 66 3c...
    !byte $cc, $78,   0, $1e                                          ; 3dc9: cc 78 00...
    !text "3f>"                                                       ; 3dcd: 33 66 3e
    !byte   6, $18, $70,   0,   0,   0, $18, $18,   0, $30, $30,   0  ; 3dd0: 06 18 70...
    !byte   0,   0, $18, $18,   0                                     ; 3ddc: 00 00 18...
    !text "00`"                                                       ; 3de1: 30 30 60
    !byte   6, $0c                                                    ; 3de4: 06 0c
    !text "0`00"                                                      ; 3de6: 30 60 30...
    !byte $18,   0,   0,   0, $7e,   0, $7e,   0,   0,   0, $18, $0c  ; 3dea: 18 00 00...
    !byte $0c,   6, $0c, $30, $60,   0, $1e, $33, $0c, $18, $18,   0  ; 3df6: 0c 06 0c...
    !byte $30,   0, $1e                                               ; 3e02: 30 00 1e
    !text "3njn"                                                      ; 3e05: 33 6e 6a...
    !byte $c0, $78,   0, $1e                                          ; 3e09: c0 78 00...
    !text "3f~f"                                                      ; 3e0d: 33 66 7e...
    !byte $cc, $cc,   0                                               ; 3e11: cc cc 00
    !text ">3f|f"                                                     ; 3e14: 3e 33 66...
    !byte $cc, $f8,   0, $1e                                          ; 3e19: cc f8 00...
    !text "3```"                                                      ; 3e1d: 33 60 60...
    !byte $cc, $78,   0                                               ; 3e21: cc 78 00
    !text "<6fff"                                                     ; 3e24: 3c 36 66...
    !byte $d8, $f0,   0                                               ; 3e29: d8 f0 00
    !text "?0`|`"                                                     ; 3e2c: 3f 30 60...
    !byte $c0, $fc,   0                                               ; 3e31: c0 fc 00
    !text "?0`|`"                                                     ; 3e34: 3f 30 60...
    !byte $c0, $c0,   0, $1e                                          ; 3e39: c0 c0 00...
    !text "3`nf"                                                      ; 3e3d: 33 60 6e...
    !byte $cc, $78,   0                                               ; 3e41: cc 78 00
    !text "33f~f"                                                     ; 3e44: 33 33 66...
    !byte $cc, $cc,   0, $3f, $0c, $18, $18, $18, $30, $fc,   0, $1f  ; 3e49: cc cc 00...
    !byte   6, $0c, $0c, $0c, $d8, $70,   0                           ; 3e55: 06 0c 0c...
    !text "36xpx"                                                     ; 3e5c: 33 36 78...
    !byte $d8, $cc,   0                                               ; 3e61: d8 cc 00
    !text "00```"                                                     ; 3e64: 30 30 60...
    !byte $c0, $fc,   0, $31, $3b, $7f, $6b, $6b, $c6, $c6,   0       ; 3e69: c0 fc 00...
    !text "33v~n"                                                     ; 3e74: 33 33 76...
    !byte $cc, $cc,   0, $1e                                          ; 3e79: cc cc 00...
    !text "3fff"                                                      ; 3e7d: 33 66 66...
    !byte $cc, $78,   0                                               ; 3e81: cc 78 00
    !text ">3f|`"                                                     ; 3e84: 3e 33 66...
    !byte $c0, $c0,   0, $1e                                          ; 3e89: c0 c0 00...
    !text "3ffj"                                                      ; 3e8d: 33 66 66...
    !byte $d8, $6c,   0                                               ; 3e91: d8 6c 00
    !text ">3f|l"                                                     ; 3e94: 3e 33 66...
    !byte $cc, $cc,   0, $1e                                          ; 3e99: cc cc 00...
    !text "3`<"                                                       ; 3e9d: 33 60 3c
    !byte   6, $cc, $78,   0, $3f, $0c, $18, $18, $18, $30, $30,   0  ; 3ea0: 06 cc 78...
    !text "33fff"                                                     ; 3eac: 33 33 66...
    !byte $cc, $78,   0                                               ; 3eb1: cc 78 00
    !text "33fffx0"                                                   ; 3eb4: 33 33 66...
    !byte 0                                                           ; 3ebb: 00
    !text "11kk"                                                      ; 3ebc: 31 31 6b...
    !byte $7f, $ee, $c6,   0                                          ; 3ec0: 7f ee c6...
    !text "33<"                                                       ; 3ec4: 33 33 3c
    !byte $18, $3c, $cc, $cc,   0                                     ; 3ec7: 18 3c cc...
    !text "33f<"                                                      ; 3ecc: 33 33 66...
    !byte $18, $30, $30,   0, $3f,   3, $0c, $18, $30, $c0, $fc,   0  ; 3ed0: 18 30 30...
    !text ">0```"                                                     ; 3edc: 3e 30 60...
    !byte $c0, $f8,   0,   0, $30, $30, $18, $0c, $0c,   0,   0, $1f  ; 3ee1: c0 f8 00...
    !byte   3,   6,   6,   6, $0c, $7c,   0, $0c, $1e, $66, $42,   0  ; 3eed: 03 06 06...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, $fe, $0e  ; 3ef9: 00 00 00...
    !byte $1b                                                         ; 3f05: 1b
    !text "0|0`"                                                      ; 3f06: 30 7c 30...
    !byte $fc,   0,   0,   0, $3c,   6, $3e, $cc, $7c,   0            ; 3f0a: fc 00 00...
    !text "00|ff"                                                     ; 3f14: 30 30 7c...
    !byte $cc, $f8,   0,   0,   0                                     ; 3f19: cc f8 00...
    !text "<f`"                                                       ; 3f1e: 3c 66 60
    !byte $cc, $78,   0,   3,   3                                     ; 3f21: cc 78 00...
    !text ">ff"                                                       ; 3f26: 3e 66 66
    !byte $cc, $7c,   0,   0,   0                                     ; 3f29: cc 7c 00...
    !text "<f~"                                                       ; 3f2e: 3c 66 7e
    !byte $c0, $78,   0, $0e, $18                                     ; 3f31: c0 78 00...
    !text "0|0``"                                                     ; 3f36: 30 7c 30...
    !byte 0, 0, 0                                                     ; 3f3b: 00 00 00
    !text ">ff|"                                                      ; 3f3e: 3e 66 66...
    !byte $0c                                                         ; 3f42: 0c
    !text "x00|ff"                                                    ; 3f43: 78 30 30...
    !byte $cc, $cc,   0, $0c,   0, $38, $18, $18, $30, $78,   0, $0c  ; 3f49: cc cc 00...
    !byte   0, $38, $18, $18, $30, $30, $e0                           ; 3f55: 00 38 18...
    !text "00flx"                                                     ; 3f5c: 30 30 66...
    !byte $d8, $cc,   0, $1c, $0c, $18, $18, $18, $30, $78,   0,   0  ; 3f61: d8 cc 00...
    !byte   0, $36, $7f, $6b, $d6, $c6,   0,   0,   0                 ; 3f6d: 00 36 7f...
    !text "|ff"                                                       ; 3f76: 7c 66 66
    !byte $cc, $cc,   0,   0,   0                                     ; 3f79: cc cc 00...
    !text "<ff"                                                       ; 3f7e: 3c 66 66
    !byte $cc, $78,   0,   0,   0                                     ; 3f81: cc 78 00...
    !text "|ff"                                                       ; 3f86: 7c 66 66
    !byte $f8, $c0, $c0,   0,   0                                     ; 3f89: f8 c0 c0...
    !text ">ff|"                                                      ; 3f8e: 3e 66 66...
    !byte $0c, $0e,   0,   0                                          ; 3f92: 0c 0e 00...
    !text "lv`"                                                       ; 3f96: 6c 76 60
    !byte $c0, $c0,   0,   0,   0                                     ; 3f99: c0 c0 00...
    !text ">`<"                                                       ; 3f9e: 3e 60 3c
    !byte $0c, $f8,   0, $18, $18                                     ; 3fa1: 0c f8 00...
    !text "|00`8"                                                     ; 3fa6: 7c 30 30...
    !byte 0, 0, 0                                                     ; 3fab: 00 00 00
    !text "fff"                                                       ; 3fae: 66 66 66
    !byte $cc, $7c,   0,   0,   0                                     ; 3fb1: cc 7c 00...
    !text "fffx0"                                                     ; 3fb6: 66 66 66...
    !byte 0, 0, 0                                                     ; 3fbb: 00 00 00
    !text "ckk"                                                       ; 3fbe: 63 6b 6b
    !byte $fe, $6c,   0,   0,   0, $66, $3c, $18, $78, $cc,   0,   0  ; 3fc1: fe 6c 00...
    !byte   0                                                         ; 3fcd: 00
    !text "fff|"                                                      ; 3fce: 66 66 66...
    !byte $0c, $78,   0,   0, $7e, $0c, $18, $60, $fc,   0,   6, $0c  ; 3fd2: 0c 78 00...
    !byte $18, $70, $18, $30, $18,   0, $0c, $0c, $18,   0, $18, $30  ; 3fde: 18 70 18...
    !byte $30,   0, $18, $0c, $18, $0e, $18, $30, $60,   0, $18, $35  ; 3fea: 30 00 18...
    !byte $46,   0,   0,   0,   0,   0, $eb, $eb, $eb, $eb, $8a, $bf  ; 3ff6: 46 00 00...
    !byte $eb, $bf, $a3, $aa, $bf, $eb, $a6, $a4, $a6, $ae, $a5, $bf  ; 4002: eb bf a3...
    !byte $eb, $bf, $a3, $ae, $b9, $ae, $eb, $c6, $a8, $aa, $a6, $ae  ; 400e: eb bf a3...
    !byte $eb, $aa, $eb, $af, $ae, $aa, $ad, $ae, $a5, $a2, $a5, $ac  ; 401a: eb aa eb...
    !byte $eb, $a8, $b9, $aa, $a8, $a0, $eb, $c6, $aa, $a5, $af, $eb  ; 4026: eb a8 b9...
    !byte $bf, $a3, $ae, $eb, $a6, $a4, $be, $a5, $bf, $aa, $a2, $a5  ; 4032: bf a3 ae...
    !byte $eb, $b8, $bb, $a7, $a2, $bf, $eb, $c6, $aa, $a5, $af, $eb  ; 403e: eb b8 bb...
    !byte $a8, $b9, $be, $a6, $a9, $a7, $ae, $af, $e5, $eb, $eb, $8a  ; 404a: a8 b9 be...
    !byte $a5, $af, $eb, $aa, $b8, $eb, $bf, $a3, $ae, $c6, $bf, $a4  ; 4056: a5 af eb...
    !byte $bc, $a5, $b8, $bb, $ae, $a4, $bb, $a7, $ae, $eb, $a8, $aa  ; 4062: bc a5 b8...
    !byte $a6, $ae, $eb, $b9, $be, $a5, $a5, $a2, $a5, $ac, $eb, $c6  ; 406e: a6 ae eb...
    !byte $ad, $b9, $a4, $a6, $eb, $bf, $a3, $ae, $a2, $b9, $eb, $a3  ; 407a: ad b9 a4...
    !byte $a4, $a6, $ae, $b8, $e7, $eb, $bf, $a3, $ae, $b2, $eb, $c6  ; 4086: a4 a6 ae...
    !byte $b8, $aa, $bc, $eb, $aa, $eb, $af, $a2, $b8, $a3, $ae, $bd  ; 4092: b8 aa bc...
    !byte $ae, $a7, $a7, $ae, $af, $eb, $ad, $a2, $ac, $be, $b9, $ae  ; 409e: ae a7 a7...
    !byte $eb, $c6, $ae, $a6, $ae, $b9, $ac, $ae, $eb, $ad, $b9, $a4  ; 40aa: eb c6 ae...
    !byte $a6, $eb, $bf, $a3, $ae, $eb, $b9, $be, $a9, $a9, $a7, $ae  ; 40b6: a6 eb bf...
    !byte $eb, $a4, $ad, $c6, $bf, $a3, $ae, $eb, $a8, $aa, $bd, $ae  ; 40c2: eb a4 ad...
    !byte $b9, $a5, $e5, $eb, $eb, $c6, $c6, $eb, $eb, $eb, $eb, $8a  ; 40ce: b9 a5 e5...
    !byte $a7, $bf, $a3, $a4, $be, $ac, $a3, $eb, $ac, $ae, $a5, $ae  ; 40da: a7 bf a3...
    !byte $b9, $aa, $bf, $a2, $a4, $a5, $b8, $eb, $c6, $a3, $aa, $af  ; 40e6: b9 aa bf...
    !byte $eb, $ae, $a7, $aa, $bb, $b8, $ae, $af, $eb, $b8, $a2, $a5  ; 40f2: eb ae a7...
    !byte $a8, $ae, $eb, $bf, $a3, $ae, $eb, $c6, $a2, $a6, $bb, $b9  ; 40fe: a8 ae eb...
    !byte $a2, $b8, $a4, $a5, $a6, $ae, $a5, $bf, $eb, $a4, $ad, $eb  ; 410a: a2 b8 a4...
    !byte $82, $a6, $a4, $ac, $ae, $a5, $e7, $eb, $c6, $a3, $a2, $b8  ; 4116: 82 a6 a4...
    !byte $eb, $bf, $aa, $a7, $ae, $eb, $a3, $aa, $af, $eb, $bb, $aa  ; 4122: eb bf aa...
    !byte $b8, $b8, $ae, $af, $eb, $a2, $a5, $bf, $a4, $eb, $c6, $a7  ; 412e: b8 b8 ae...
    !byte $ae, $ac, $ae, $a5, $af, $e7, $eb, $aa, $a5, $af, $eb, $bf  ; 413a: ae ac ae...
    !byte $a3, $ae, $eb, $bb, $ae, $a4, $bb, $a7, $ae, $eb, $c6, $a0  ; 4146: a3 ae eb...
    !byte $a5, $ae, $bc, $eb, $aa, $bf, $eb, $a4, $a5, $a8, $ae, $eb  ; 4152: a5 ae bc...
    !byte $bf, $a3, $aa, $bf, $eb, $a2, $bf, $eb, $bc, $aa, $b8, $eb  ; 415e: bf a3 aa...
    !byte $c6, $bf, $b9, $be, $a7, $b2, $eb, $a3, $ae, $eb, $bc, $a3  ; 416a: c6 bf b9...
    !byte $a4, $eb, $a3, $aa, $af, $eb, $b9, $ae, $bf, $be, $b9, $a5  ; 4176: a4 eb a3...
    !byte $ae, $af, $c6, $bf, $a4, $eb, $bf, $a3, $ae, $a2, $b9, $eb  ; 4182: ae af c6...
    !byte $a6, $a2, $af, $b8, $bf, $e5, $eb, $eb, $c6, $c6, $eb, $eb  ; 418e: a6 a2 af...
    !byte $eb, $eb, $8a, $a7, $a7, $eb, $bf, $b9, $aa, $a8, $ae, $eb  ; 419a: eb eb 8a...
    !byte $a4, $ad, $eb, $bf, $a3, $ae, $eb, $c6, $a2, $a5, $b8, $aa  ; 41a6: a4 ad eb...
    !byte $a5, $a2, $bf, $b2, $eb, $a3, $aa, $af, $eb, $ac, $a4, $a5  ; 41b2: a5 a2 bf...
    !byte $ae, $e7, $eb, $aa, $a5, $af, $eb, $c6, $bc, $a3, $a2, $a7  ; 41be: ae e7 eb...
    !byte $ae, $eb, $bf, $a3, $ae, $eb, $a8, $a2, $bf, $a2, $b1, $ae  ; 41ca: ae eb bf...
    !byte $a5, $b8, $eb, $a4, $ad, $eb, $c6, $8e, $ac, $a6, $aa, $a2  ; 41d6: a5 b8 eb...
    !byte $a5, $eb, $a8, $a3, $ae, $ae, $b9, $ae, $af, $eb, $aa, $a5  ; 41e2: a5 eb a8...
    !byte $af, $eb, $b8, $aa, $a5, $ac, $e7, $eb, $c6, $bf, $a3, $ae  ; 41ee: af eb b8...
    !byte $eb, $b8, $bb, $ae, $a7, $a7, $eb, $a4, $ad, $eb, $ad, $b9  ; 41fa: eb b8 bb...
    !byte $ae, $ae, $af, $a4, $a6, $e7, $eb, $a2, $bf, $b8, $c6, $bb  ; 4206: ae ae af...
    !byte $be, $b9, $bb, $a4, $b8, $ae, $eb, $ad, $be, $a7, $ad, $a2  ; 4212: be b9 bb...
    !byte $a7, $a7, $ae, $af, $e7, $eb, $b8, $a4, $aa, $b9, $ae, $af  ; 421e: a7 a7 ae...
    !byte $c6, $a2, $a5, $bf, $a4, $eb, $bf, $a3, $ae, $eb, $a5, $a2  ; 422a: c6 a2 a5...
    !byte $ac, $a3, $bf, $eb, $b8, $a0, $b2, $eb, $aa, $a5, $af, $eb  ; 4236: ac a3 bf...
    !byte $c6, $a9, $ae, $a8, $aa, $a6, $ae, $eb, $aa, $eb, $a8, $a4  ; 4242: c6 a9 ae...
    !byte $a6, $ae, $bf, $eb, $bf, $a4, $eb, $c6, $a8, $ae, $a7, $ae  ; 424e: a6 ae bf...
    !byte $a9, $b9, $aa, $bf, $ae, $eb, $ad, $a4, $b9, $eb, $bf, $a3  ; 425a: a9 b9 aa...
    !byte $ae, $eb, $b9, $ae, $b8, $bf, $eb, $a4, $ad, $c6, $bf, $a2  ; 4266: ae eb b9...
    !byte $a6, $ae, $eb, $bf, $a3, $ae, $eb, $b9, $ae, $a8, $a4, $bd  ; 4272: a6 ae eb...
    !byte $ae, $b9, $b2, $eb, $a4, $ad, $eb, $bf, $a3, $ae, $eb, $c6  ; 427e: ae b9 b2...
    !byte $bc, $a2, $b1, $aa, $b9, $af, $eb, $bc, $a3, $a4, $a6, $eb  ; 428a: bc a2 b1...
    !byte $a6, $ae, $a5, $eb, $a8, $aa, $a7, $a7, $eb, $c6, $82, $a6  ; 4296: a6 ae a5...
    !byte $a4, $ac, $ae, $a5, $e5, $eb, $eb, $cb                      ; 42a2: a4 ac ae...

c42aa
    jmp c42aa                                                         ; 42aa: 4c aa 42

    lda #$c8                                                          ; 42ad: a9 c8
    jsr sub_c4325                                                     ; 42af: 20 25 43
    lda #osbyte_flush_buffer_class                                    ; 42b2: a9 0f
    ldx #1                                                            ; 42b4: a2 01
    jsr osbyte                                                        ; 42b6: 20 f4 ff                ; Flush input buffers (X non-zero)
loop_c42b9
    jsr sub_c3ce3                                                     ; 42b9: 20 e3 3c
    jsr l387c                                                         ; 42bc: 20 7c 38
    beq loop_c42b9                                                    ; 42bf: f0 f8
    lda #$ff                                                          ; 42c1: a9 ff
    sta l002e                                                         ; 42c3: 85 2e
    lda #0                                                            ; 42c5: a9 00
    ldx #$10                                                          ; 42c7: a2 10
loop_c42c9
    sta l296f,x                                                       ; 42c9: 9d 6f 29
    dex                                                               ; 42cc: ca
    bpl loop_c42c9                                                    ; 42cd: 10 fa
    lda l0ab1                                                         ; 42cf: ad b1 0a
    lda l0ab2                                                         ; 42d2: ad b2 0a
    lda l0054                                                         ; 42d5: a5 54
    pha                                                               ; 42d7: 48
    sta l4323                                                         ; 42d8: 8d 23 43
    lda l0055                                                         ; 42db: a5 55
    pha                                                               ; 42dd: 48
    sec                                                               ; 42de: 38
    sbc #2                                                            ; 42df: e9 02
    sta l4324                                                         ; 42e1: 8d 24 43
    sta l0055                                                         ; 42e4: 85 55
loop_c42e6
    lda #$1b                                                          ; 42e6: a9 1b
    sta l0070                                                         ; 42e8: 85 70
    lda #$43 ; 'C'                                                    ; 42ea: a9 43
    sta l0071                                                         ; 42ec: 85 71
    ldx l4323                                                         ; 42ee: ae 23 43
    ldy l4324                                                         ; 42f1: ac 24 43
    lda #$ff                                                          ; 42f4: a9 ff
    jsr l16dc                                                         ; 42f6: 20 dc 16
    beq c4301                                                         ; 42f9: f0 06
    jsr l3617                                                         ; 42fb: 20 17 36
    jmp loop_c42e6                                                    ; 42fe: 4c e6 42

c4301
    lda #0                                                            ; 4301: a9 00
    sta toolbar_colour                                                ; 4303: 8d 5e 17
    sta gameplay_area_colour                                          ; 4306: 8d 60 17
    jsr l178c                                                         ; 4309: 20 8c 17
    jsr l2980                                                         ; 430c: 20 80 29
    jsr l29a8                                                         ; 430f: 20 a8 29
    pla                                                               ; 4312: 68
    sta l0055                                                         ; 4313: 85 55
    pla                                                               ; 4315: 68
    sta l0054                                                         ; 4316: 85 54
    jmp l110c                                                         ; 4318: 4c 0c 11

    !text "icodata"                                                   ; 431b: 69 63 6f...
    !byte $0d                                                         ; 4322: 0d
l4323
    !byte 0                                                           ; 4323: 00
l4324
    !byte 0                                                           ; 4324: 00

sub_c4325
    ldx #0                                                            ; 4325: a2 00
    stx l178b                                                         ; 4327: 8e 8b 17
loop_c432a
    cmp l178b                                                         ; 432a: cd 8b 17
    bcs loop_c432a                                                    ; 432d: b0 fb
    rts                                                               ; 432f: 60

    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4330: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 433c: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4348: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4354: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4360: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 436c: 00 00 00...
    !byte   1,   1,   3,   3,   3,   7,   6,   6, $ff, $ff, $e7, $c7  ; 4378: 01 01 03...
    !byte   7,   7, $0f, $0f, $ff, $ff, $c7, $83, $83, $83, $83,   3  ; 4384: 07 07 0f...
    !byte $81, $81, $80, $80,   0,   0,   0,   0, $ff, $ff            ; 4390: 81 81 80...
    !text "|xxx"                                                      ; 439a: 7c 78 78...
    !byte $f8, $f0, $9f, $9f,   7,   7,   7,   7, $0f, $0f, $f8, $f8  ; 439e: f8 f0 9f...
    !byte $c0, $80, $80, $80, $80,   0, $1f, $1f,   7,   7,   7,   7  ; 43aa: c0 80 80...
    !byte $0f, $0f, $ff, $ff, $c0, $80, $80, $80, $8c, $1c, $f0, $f0  ; 43b6: 0f 0f ff...
    !byte $f0                                                         ; 43c2: f0
    !text "p````"                                                     ; 43c3: 70 60 60...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 43c8: 00 00 00...
    !byte   0,   0,   0,   0,   3,   3,   0,   0,   0,   0,   1,   1  ; 43d4: 00 00 00...
    !byte $ff, $ff, $f8, $f0, $f0, $f0, $f1, $e3, $fe, $fe, $1e, $0e  ; 43e0: ff ff f8...
    !byte $0c, $0c, $8c, $8c,   0,   0,   0,   0,   0,   0,   0,   0  ; 43ec: 0c 0c 8c...
    !byte $fe, $fe                                                    ; 43f8: fe fe
    !text "???"                                                       ; 43fa: 3f 3f 3f
    !byte $7f, $67, $67,   7,   7,   0,   1,   1, $81, $81, $83, $f8  ; 43fd: 7f 67 67...
    !byte $f8, $e0, $c0, $80, $80, $80, $80, $3f, $3f, $0f, $0f, $0f  ; 4409: f8 e0 c0...
    !byte $0f, $1f, $1e, $fc, $ff, $8f,   7,   7,   3,   3,   3,   0  ; 4415: 0f 1f 1e...
    !byte   0, $80, $80, $c0, $c0, $c0, $c0,   0,   0,   0,   0,   0  ; 4421: 00 80 80...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 442d: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4439: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4445: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4451: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 445d: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4469: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4475: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4481: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 448d: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4499: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 44a5: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 44b1: 00 00 00...
    !byte   0,   0,   0, $0f, $1f, $1e, $1e, $1e                      ; 44bd: 00 00 00...
    !text "><<"                                                       ; 44c5: 3e 3c 3c
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   1,   1,   1  ; 44c8: 00 00 00...
    !byte   1,   3,   3,   3, $f0, $f0, $ff, $ff, $e0, $e0, $c0, $c0  ; 44d4: 01 03 03...
    !byte $0f, $1f, $fe, $fe, $1e                                     ; 44e0: 0f 1f fe...
    !text "><<"                                                       ; 44e5: 3e 3c 3c
    !byte   0,   0,   0,   0,   0,   0,   0,   0, $0f, $1f, $1f, $1f  ; 44e8: 00 00 00...
    !byte $1e                                                         ; 44f4: 1e
    !text "><<"                                                       ; 44f5: 3e 3c 3c
    !byte $1c, $38, $f8, $f8                                          ; 44f8: 1c 38 f8...
    !text "8000"                                                      ; 44fc: 38 30 30...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4500: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 450c: 00 00 00...
    !byte   1,   3,   3,   3,   3,   7,   7,   7, $e3, $e7, $ff, $ff  ; 4518: 01 03 03...
    !byte $c7, $c6, $86, $86, $80,   0,   0,   0,   0,   0,   0,   0  ; 4524: c7 c6 86...
    !byte   0,   0,   0,   0,   1,   1,   1,   3, $67, $e3, $c3, $c3  ; 4530: 00 00 00...
    !byte $c1, $81, $81, $80, $c3, $c3, $c7, $e6, $e6, $ee, $fc, $fc  ; 453c: c1 81 81...
    !byte   0,   0,   0,   0,   0,   0,   0,   0, $1e                 ; 4548: 00 00 00...
    !text "><<<|xx"                                                   ; 4551: 3e 3c 3c...
    !byte   3,   3,   3,   7,   7,   7, $0f, $0f, $c0, $c0, $c0, $c0  ; 4558: 03 03 03...
    !byte $80, $80, $80,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4564: 80 80 80...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4570: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 457c: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4588: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4594: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45a0: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45ac: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45b8: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45c4: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45d0: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45dc: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45e8: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   7,   7,   0  ; 45f4: 00 00 00...
    !text "|xxx"                                                      ; 4600: 7c 78 78...
    !byte $f8, $fe, $fe,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4604: f8 fe fe...
    !byte   7,   7,   7,   7, $0f, $7f, $7f,   0, $c0, $80, $80, $80  ; 4610: 07 07 07...
    !byte $80, $e7, $e7,   0                                          ; 461c: 80 e7 e7...
    !text "|xxx"                                                      ; 4620: 7c 78 78...
    !byte $f8, $fe, $fe,   0,   0,   0,   0,   0,   0,   7,   7,   0  ; 4624: f8 fe fe...
    !text "|xxx"                                                      ; 4630: 7c 78 78...
    !byte $f8, $ff, $ff,   0,   3,   7,   7, $0e, $3e, $fc, $fc,   0  ; 4634: f8 ff ff...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4640: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 464c: 00 00 00...
    !byte $0f, $0f, $0f, $0f, $1f, $ff, $ff,   0, $80,   0,   0,   1  ; 4658: 0f 0f 0f...
    !byte   7, $ff, $ff,   0, $60, $e0, $e0, $c0, $c0, $80, $80,   0  ; 4664: 07 ff ff...
    !byte   3,   3,   3,   7,   7, $3f, $3f,   0,   0,   0,   0,   0  ; 4670: 03 03 03...
    !byte   0, $c0, $c0,   0, $fc, $fc                                ; 467c: 00 c0 c0...
    !text "xxx00"                                                     ; 4682: 78 78 78...
    !byte   0,   0,   0,   0,   0,   1, $0f, $0f,   0, $f8, $f0, $f0  ; 4687: 00 00 00...
    !byte $f0, $f1, $ff, $ff,   0, $1f, $1e, $3e, $7c, $f8, $f0, $80  ; 4693: f0 f1 ff...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 469f: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 46ab: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 46b7: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 46c3: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 46cf: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 46db: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0                 ; 46e7: 00 00 00...
    !text "H.", '"', "M", '"'                                         ; 46f0: 48 2e 22...
    !byte $0d, $0d                                                    ; 46f5: 0d 0d
    !text "?24=17:B%=0:CH.", '"', "M", '"'                            ; 46f7: 3f 32 34...
    !byte $0d, $10, $10, $10, $10,   2,   0                           ; 4709: 0d 10 10...
pydis_end

; Automatically generated labels:
;     c3afd
;     c3b24
;     c3b5c
;     c3b67
;     c3b80
;     c3b93
;     c3b96
;     c3bbb
;     c3bca
;     c3bd8
;     c3be4
;     c3bfc
;     c3c0a
;     c3c11
;     c3c14
;     c3c39
;     c3cd7
;     c42aa
;     c4301
;     l002e
;     l0054
;     l0055
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
;     l0ab1
;     l0ab2
;     l110c
;     l16dc
;     l178b
;     l178c
;     l1839
;     l296f
;     l2980
;     l29a8
;     l3617
;     l381c
;     l387c
;     l3acc
;     l3cfb
;     l4323
;     l4324
;     loop_c3b50
;     loop_c42b9
;     loop_c42c9
;     loop_c42e6
;     loop_c432a
;     sub_c3cc9
;     sub_c3ce3
;     sub_c4325
!if (osbyte_flush_buffer_class) != $0f {
    !error "Assertion failed: osbyte_flush_buffer_class == $0f"
}
