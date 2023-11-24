; Constants
copy_mode_2x2                = 0
copy_mode_random16           = 16
copy_mode_random2            = 2
copy_mode_random32           = 32
copy_mode_random4            = 4
copy_mode_random64           = 64
copy_mode_random8            = 8
copy_mode_simple             = 1
exit_room_bottom             = 2
exit_room_left               = 1
exit_room_right              = 4
exit_room_top                = 8
first_level_letter           = 65
game_area_height_cells       = 24
game_area_width_cells        = 40
last_level_letter            = 81
object_collided_ceiling      = 8
object_collided_floor        = 2
object_collided_left_wall    = 1
object_collided_right_wall   = 4
objectid_player              = 0
objectid_player_accessory    = 1
opcode_jmp                   = 76

; Memory locations
characters_entered                                  = $05
sprite_reflect_flag                                 = $1d
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
developer_mode_sideways_ram_is_set_up_flag          = $5b
l0070                                               = $70
l0078                                               = $78
l0079                                               = $79
show_dialog_box                                     = $040a
remove_dialog                                       = $0453
object_x_low                                        = $0950
l0952                                               = $0952
l0953                                               = $0953
l0957                                               = $0957
object_x_low_old                                    = $095b
object_x_high                                       = $0966
l0968                                               = $0968
l0969                                               = $0969
object_x_high_old                                   = $0971
object_y_low                                        = $097c
l097e                                               = $097e
l097f                                               = $097f
l0980                                               = $0980
l0981                                               = $0981
l0983                                               = $0983
l0986                                               = $0986
object_y_low_old                                    = $0987
object_y_high                                       = $0992
l0994                                               = $0994
l0995                                               = $0995
object_y_high_old                                   = $099d
object_spriteid                                     = $09a8
l09aa                                               = $09aa
l09ab                                               = $09ab
l09ac                                               = $09ac
l09ad                                               = $09ad
l09af                                               = $09af
l09b0                                               = $09b0
l09b1                                               = $09b1
l09b2                                               = $09b2
object_spriteid_old                                 = $09b3
l09bd                                               = $09bd
object_direction                                    = $09be
l09c1                                               = $09c1
object_direction_old                                = $09c9
level_progress_table                                = $09ef
l0a4a                                               = $0a4a
l0a4b                                               = $0a4b
l0a4c                                               = $0a4c
l0a4d                                               = $0a4d
l0a4e                                               = $0a4e
l0a4f                                               = $0a4f
l0a50                                               = $0a50
l0a51                                               = $0a51
l0a52                                               = $0a52
l0a53                                               = $0a53
l0a54                                               = $0a54
l0a6f                                               = $0a6f
l0a70                                               = $0a70
l0a71                                               = $0a71
l0a72                                               = $0a72
l0a73                                               = $0a73
l0a74                                               = $0a74
string_input_buffer                                 = $0a90
tile_all_set_pixels                                 = $0aa9
developer_flags                                     = $1103
initialise_level_and_room                           = $1140
start_room                                          = $12bb
game_update                                         = $12da
update_room_first_update_flag                       = $132b
sprite_op                                           = $138d
pending_toolbar_colour                              = $175d
toolbar_colour                                      = $175e
pending_gameplay_area_colour                        = $175f
gameplay_area_colour                                = $1760
use_colour_flag                                     = $1765
set_toolbar_and_gameplay_area_colours               = $1766
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
play_landing_sound                                  = $23a9
player_wall_collision_flag                          = $2433
l2434                                               = $2434
temp_left_offset                                    = $24d0
temp_right_offset                                   = $24d1
l24d2                                               = $24d2
temp_top_offset                                     = $2550
temp_bottom_offset                                  = $2551
l25f5                                               = $25f5
get_solid_rock_collision_for_object_a               = $2894
temp_default_collision_map_option                   = $28e1
test_for_collision_between_objects_x_and_y          = $28e2
insert_character_menu_item_into_toolbar             = $2b87
find_or_create_menu_slot_for_A                      = $2bbd
remove_item_from_toolbar_menu                       = $2be0
player_using_object_spriteid                        = $2eb6
previous_player_using_object_spriteid               = $2eb7
toolbar_collectable_spriteids                       = $2ee8
collectable_spriteids                               = $2eed
five_byte_table_paired_with_collectable_sprite_ids  = $2ef2
inhibit_monkey_climb_flag                           = $31d7
print_encrypted_string_at_yx_centred                = $37f3
wait_one_second_then_check_keys                     = $388d
object_sprite_mask_type                             = $38ac
l38ae                                               = $38ae
l38af                                               = $38af
l38b0                                               = $38b0
l38b1                                               = $38b1
l38b3                                               = $38b3
l38b5                                               = $38b5
object_z_order                                      = $38c2
l38c4                                               = $38c4
l38c5                                               = $38c5
l38c6                                               = $38c6
l38c9                                               = $38c9
l38ca                                               = $38ca
l38cb                                               = $38cb
object_room_collision_flags                         = $38d8
play_sound_yx                                       = $38f6
define_envelope                                     = $395e
sound_priority_per_channel_table                    = $396f
l3970                                               = $3970
check_menu_keys                                     = $3a8f
l3acc                                               = $3acc
auxcode                                             = $53c0
check_password                                      = $53c0

    * = $3ad5

; *************************************************************************************
; 
; Level header
; 
; *************************************************************************************
level_data
pydis_start
    !word sprite_data - level_data                                    ; 3ad5: 9f 0a                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f7 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 1a 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
    !byte 1, 2                                                        ; 3add: 01 02
level_room_data_table
    !word room_0_data                                                 ; 3adf: 2f 3b                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: 93 3e
    !word room_2_data                                                 ; 3ae3: 72 3f
    !word room_3_data                                                 ; 3ae5: 55 43

; *************************************************************************************
; 'PAVLOV-WAS-HERE[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $9b, $8a, $9d, $87, $84, $9d, $e6, $9c, $8a, $98, $e6, $83  ; 3ae7: 9b 8a 9d...
    !byte $8e, $99, $8e, $c6                                          ; 3af3: 8e 99 8e...

; *************************************************************************************
; 
; Level initialisation
; 
; This is called whenever a new room is entered.
; 
; *************************************************************************************
level_specific_initialisation
    lda current_level                                                 ; 3af7: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3af9: c5 51
    beq c3b11                                                         ; 3afb: f0 14
    lda developer_flags                                               ; 3afd: ad 03 11
    bpl c3b07                                                         ; 3b00: 10 05
    lda #$ff                                                          ; 3b02: a9 ff
    sta l0a4c                                                         ; 3b04: 8d 4c 0a
c3b07
    lda l0a4c                                                         ; 3b07: ad 4c 0a
    beq c3b11                                                         ; 3b0a: f0 05
    lda #$e0                                                          ; 3b0c: a9 e0
    jsr find_or_create_menu_slot_for_A                                ; 3b0e: 20 bd 2b
c3b11
    lda #$54 ; 'T'                                                    ; 3b11: a9 54
    sta source_sprite_memory_low                                      ; 3b13: 85 40
    lda #$45 ; 'E'                                                    ; 3b15: a9 45
    sta source_sprite_memory_high                                     ; 3b17: 85 41
    rts                                                               ; 3b19: 60

; *************************************************************************************
; 
; Level update
; 
; This generally calls individual functions to update the logic in each room.
; 
; While updating the logic for a room, 'currently_updating_logic_for_room_index' is
; normally set. In practice this only actually needs to be set if it calls
; 'update_brazier_and_fire' or 'update_level_completion'
; 
; *************************************************************************************
level_specific_update
    jsr sub_c3f35                                                     ; 3b1a: 20 35 3f
    jsr sub_c3d3a                                                     ; 3b1d: 20 3a 3d
    jsr sub_c3bf7                                                     ; 3b20: 20 f7 3b
    lda #0                                                            ; 3b23: a9 00
    sta l0a74                                                         ; 3b25: 8d 74 0a
    jsr sub_c4058                                                     ; 3b28: 20 58 40
    jsr sub_c43fb                                                     ; 3b2b: 20 fb 43
    rts                                                               ; 3b2e: 60

; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 20                                                          ; 3b2f: 14                      ; initial player X cell
    !byte 22                                                          ; 3b30: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####                             #######
; ###                              #######
; ###                              #######
; ###                              #######
; ###                              #######
; ###########                      #######
; ###########                      #######
; ###                              #######
; ###                              #######
; ###                              #######
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###        ####                #########
; ###        ####                #########
;                             ############
;                             ############
;                          ###############
;                     P    ###############
; ########################################
; ########################################
; Draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_0_code
    ldx #0                                                            ; 3b31: a2 00
    ldy #0                                                            ; 3b33: a0 00
    lda #$ff                                                          ; 3b35: a9 ff
    sta width_in_cells                                                ; 3b37: 85 3c
    lda #2                                                            ; 3b39: a9 02
    sta height_in_cells                                               ; 3b3b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b3d: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3b40: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3b42: 20 bb 1a
; draw 3x16 rectangle at (0,2)
    ldy #2                                                            ; 3b45: a0 02
    lda #3                                                            ; 3b47: a9 03
    sta width_in_cells                                                ; 3b49: 85 3c
    lda #$10                                                          ; 3b4b: a9 10
    sta height_in_cells                                               ; 3b4d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b4f: 20 bb 1a
; draw 255x10 rectangle at (33,2)
    ldx #$21 ; '!'                                                    ; 3b52: a2 21
    lda #$ff                                                          ; 3b54: a9 ff
    sta width_in_cells                                                ; 3b56: 85 3c
    lda #$0a                                                          ; 3b58: a9 0a
    sta height_in_cells                                               ; 3b5a: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b5c: 20 bb 1a
; draw 255x4 rectangle at (37,12)
    ldx #$25 ; '%'                                                    ; 3b5f: a2 25
    ldy #$0c                                                          ; 3b61: a0 0c
    lda #4                                                            ; 3b63: a9 04
    sta height_in_cells                                               ; 3b65: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b67: 20 bb 1a
; draw 255x2 rectangle at (31,16)
    ldx #$1f                                                          ; 3b6a: a2 1f
    ldy #$10                                                          ; 3b6c: a0 10
    lda #2                                                            ; 3b6e: a9 02
    sta height_in_cells                                               ; 3b70: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b72: 20 bb 1a
; draw 255x2 rectangle at (28,18)
    ldx #$1c                                                          ; 3b75: a2 1c
    ldy #$12                                                          ; 3b77: a0 12
    jsr copy_rectangle_of_memory_to_screen                            ; 3b79: 20 bb 1a
; draw 255x2 rectangle at (25,20)
    ldx #$19                                                          ; 3b7c: a2 19
    ldy #$14                                                          ; 3b7e: a0 14
    jsr copy_rectangle_of_memory_to_screen                            ; 3b80: 20 bb 1a
; draw 8x2 rectangle at (3,7)
    ldx #3                                                            ; 3b83: a2 03
    ldy #7                                                            ; 3b85: a0 07
    lda #8                                                            ; 3b87: a9 08
    sta width_in_cells                                                ; 3b89: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b8b: 20 bb 1a
; draw 4x2 rectangle at (11,16)
    ldx #$0b                                                          ; 3b8e: a2 0b
    ldy #$10                                                          ; 3b90: a0 10
    lda #4                                                            ; 3b92: a9 04
    sta width_in_cells                                                ; 3b94: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b96: 20 bb 1a
; draw 1x1 rectangle at (3,2)
    ldx #3                                                            ; 3b99: a2 03
    ldy #2                                                            ; 3b9b: a0 02
    lda #1                                                            ; 3b9d: a9 01
    sta width_in_cells                                                ; 3b9f: 85 3c
    sta height_in_cells                                               ; 3ba1: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ba3: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3ba6: 20 90 1b
    jsr start_room                                                    ; 3ba9: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 3bac: 20 da 12
    and #1                                                            ; 3baf: 29 01
    beq room_0_game_update_loop                                       ; 3bb1: f0 f9
    ldx #1                                                            ; 3bb3: a2 01
    ldy current_level                                                 ; 3bb5: a4 31
    jmp initialise_level_and_room                                     ; 3bb7: 4c 40 11

l3bba
    !byte   0, $d4,   0,   0, $ff, $d5,   0,   0, $d5,   0,   0, $d5  ; 3bba: 00 d4 00...
    !byte   0,   0, $d5,   0,   0, $d5,   0,   0, $d5,   0,   0, $d5  ; 3bc6: 00 00 d5...
    !byte   0,   0, $d5,   0,   0, $d5, $d9,   0, $d5, $d8,   0, $d5  ; 3bd2: 00 00 d5...
    !byte $d7,   0, $d5, $d6,   0, $d5, $d6,   2, $d5, $d6,   4, $ff  ; 3bde: d7 00 d5...
    !byte $d5, $d6,   8, $ff, $d5,   0,   0, $ff                      ; 3bea: d5 d6 08...
l3bf2
    !byte $db, $dc, $dd, $de, $ff                                     ; 3bf2: db dc dd...

sub_c3bf7
    lda #0                                                            ; 3bf7: a9 00
    sta currently_updating_logic_for_room_index                       ; 3bf9: 8d ba 1a
    ldx #$23 ; '#'                                                    ; 3bfc: a2 23
    ldy #$10                                                          ; 3bfe: a0 10
    lda #6                                                            ; 3c00: a9 06
    jsr update_level_completion                                       ; 3c02: 20 10 1a
    lda update_room_first_update_flag                                 ; 3c05: ad 2b 13
    beq c3c57                                                         ; 3c08: f0 4d
    lda current_level                                                 ; 3c0a: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3c0c: c5 51
    beq c3c1d                                                         ; 3c0e: f0 0d
    lda #1                                                            ; 3c10: a9 01
    sta l0a4b                                                         ; 3c12: 8d 4b 0a
    sta l0a70                                                         ; 3c15: 8d 70 0a
    lda #$30 ; '0'                                                    ; 3c18: a9 30
    sta l0a71                                                         ; 3c1a: 8d 71 0a
c3c1d
    lda desired_room_index                                            ; 3c1d: a5 30
    cmp #0                                                            ; 3c1f: c9 00
    bne c3c54                                                         ; 3c21: d0 31
    ldx #$0b                                                          ; 3c23: a2 0b
    ldy #7                                                            ; 3c25: a0 07
    lda #$d1                                                          ; 3c27: a9 d1
    jsr draw_sprite_a_at_cell_xy                                      ; 3c29: 20 4c 1f
    lda #8                                                            ; 3c2c: a9 08
    jsr set_object_position_from_cell_xy                              ; 3c2e: 20 5d 1f
    lda #$c0                                                          ; 3c31: a9 c0
    sta l38ca                                                         ; 3c33: 8d ca 38
    lda #9                                                            ; 3c36: a9 09
    jsr set_object_position_from_cell_xy                              ; 3c38: 20 5d 1f
    lda #$d2                                                          ; 3c3b: a9 d2
    sta l38b5                                                         ; 3c3d: 8d b5 38
    lda #$c0                                                          ; 3c40: a9 c0
    sta l38cb                                                         ; 3c42: 8d cb 38
    lda #$58 ; 'X'                                                    ; 3c45: a9 58
    sta l0957                                                         ; 3c47: 8d 57 09
    lda #$d3                                                          ; 3c4a: a9 d3
    sta l38b3                                                         ; 3c4c: 8d b3 38
    lda #$a0                                                          ; 3c4f: a9 a0
    sta l38c9                                                         ; 3c51: 8d c9 38
c3c54
    jmp c3d13                                                         ; 3c54: 4c 13 3d

c3c57
    lda l0a70                                                         ; 3c57: ad 70 0a
    clc                                                               ; 3c5a: 18
    adc #3                                                            ; 3c5b: 69 03
    tay                                                               ; 3c5d: a8
    lda l3bba,y                                                       ; 3c5e: b9 ba 3b
    cmp #$ff                                                          ; 3c61: c9 ff
    bne c3c68                                                         ; 3c63: d0 03
    ldy l0a4b                                                         ; 3c65: ac 4b 0a
c3c68
    lda l0a4b                                                         ; 3c68: ad 4b 0a
    cmp #1                                                            ; 3c6b: c9 01
    beq c3cbf                                                         ; 3c6d: f0 50
    cmp #$30 ; '0'                                                    ; 3c6f: c9 30
    beq c3c77                                                         ; 3c71: f0 04
    cmp #$34 ; '4'                                                    ; 3c73: c9 34
    beq c3cb5                                                         ; 3c75: f0 3e
c3c77
    lda #$60 ; '`'                                                    ; 3c77: a9 60
    sec                                                               ; 3c79: 38
    sbc l0a4a                                                         ; 3c7a: ed 4a 0a
    clc                                                               ; 3c7d: 18
    adc #$4c ; 'L'                                                    ; 3c7e: 69 4c
    cmp l0a71                                                         ; 3c80: cd 71 0a
    bcs c3ce5                                                         ; 3c83: b0 60
    lda desired_room_index                                            ; 3c85: a5 30
    cmp #0                                                            ; 3c87: c9 00
    bne c3c8e                                                         ; 3c89: d0 03
    jsr play_landing_sound                                            ; 3c8b: 20 a9 23
c3c8e
    ldy #$34 ; '4'                                                    ; 3c8e: a0 34
    sty l0a4b                                                         ; 3c90: 8c 4b 0a
    lda #$30 ; '0'                                                    ; 3c93: a9 30
    sta l0a71                                                         ; 3c95: 8d 71 0a
    lda #$14                                                          ; 3c98: a9 14
    sta l0a72                                                         ; 3c9a: 8d 72 0a
    lda l0a4a                                                         ; 3c9d: ad 4a 0a
    cmp #$60 ; '`'                                                    ; 3ca0: c9 60
    bne c3ce5                                                         ; 3ca2: d0 41
    lda #$18                                                          ; 3ca4: a9 18
    sta l0a72                                                         ; 3ca6: 8d 72 0a
    lda l0a4a                                                         ; 3ca9: ad 4a 0a
    sec                                                               ; 3cac: 38
    sbc #4                                                            ; 3cad: e9 04
    sta l0a4a                                                         ; 3caf: 8d 4a 0a
    jmp c3ce5                                                         ; 3cb2: 4c e5 3c

c3cb5
    dec l0a72                                                         ; 3cb5: ce 72 0a
    bne c3cbf                                                         ; 3cb8: d0 05
    ldy #1                                                            ; 3cba: a0 01
    sty l0a4b                                                         ; 3cbc: 8c 4b 0a
c3cbf
    lda desired_room_index                                            ; 3cbf: a5 30
    cmp #0                                                            ; 3cc1: c9 00
    bne c3ce5                                                         ; 3cc3: d0 20
    lda l0a74                                                         ; 3cc5: ad 74 0a
    bne c3cde                                                         ; 3cc8: d0 14
    lda developer_flags                                               ; 3cca: ad 03 11
    bpl c3ce5                                                         ; 3ccd: 10 16
    ldx #$c9                                                          ; 3ccf: a2 c9
    sty l3d39                                                         ; 3cd1: 8c 39 3d
    jsr l3acc                                                         ; 3cd4: 20 cc 3a
    ldy l3d39                                                         ; 3cd7: ac 39 3d
    ora #0                                                            ; 3cda: 09 00
    beq c3ce5                                                         ; 3cdc: f0 07
c3cde
    ldy #5                                                            ; 3cde: a0 05
    lda #$30 ; '0'                                                    ; 3ce0: a9 30
    sta l0a4b                                                         ; 3ce2: 8d 4b 0a
c3ce5
    sty l0a70                                                         ; 3ce5: 8c 70 0a
    iny                                                               ; 3ce8: c8
    iny                                                               ; 3ce9: c8
    lda l3bba,y                                                       ; 3cea: b9 ba 3b
    clc                                                               ; 3ced: 18
    adc l0a71                                                         ; 3cee: 6d 71 0a
    sta l0a71                                                         ; 3cf1: 8d 71 0a
    ldy l0a6f                                                         ; 3cf4: ac 6f 0a
    iny                                                               ; 3cf7: c8
    lda l3bf2,y                                                       ; 3cf8: b9 f2 3b
    cmp #$ff                                                          ; 3cfb: c9 ff
    bne c3d01                                                         ; 3cfd: d0 02
    ldy #0                                                            ; 3cff: a0 00
c3d01
    sty l0a6f                                                         ; 3d01: 8c 6f 0a
    ldy l0a70                                                         ; 3d04: ac 70 0a
    lda l3bba,y                                                       ; 3d07: b9 ba 3b
    cmp #$d5                                                          ; 3d0a: c9 d5
    beq c3d13                                                         ; 3d0c: f0 05
    lda #0                                                            ; 3d0e: a9 00
    sta l0a6f                                                         ; 3d10: 8d 6f 0a
c3d13
    lda desired_room_index                                            ; 3d13: a5 30
    cmp #0                                                            ; 3d15: c9 00
    bne c3d38                                                         ; 3d17: d0 1f
    ldy l0a70                                                         ; 3d19: ac 70 0a
    lda l3bba,y                                                       ; 3d1c: b9 ba 3b
    sta l09b1                                                         ; 3d1f: 8d b1 09
    iny                                                               ; 3d22: c8
    lda l3bba,y                                                       ; 3d23: b9 ba 3b
    sta l09af                                                         ; 3d26: 8d af 09
    lda l0a71                                                         ; 3d29: ad 71 0a
    sta l0983                                                         ; 3d2c: 8d 83 09
    ldy l0a6f                                                         ; 3d2f: ac 6f 0a
    lda l3bf2,y                                                       ; 3d32: b9 f2 3b
    sta l09b0                                                         ; 3d35: 8d b0 09
c3d38
    rts                                                               ; 3d38: 60

l3d39
    !byte 0                                                           ; 3d39: 00

sub_c3d3a
    lda update_room_first_update_flag                                 ; 3d3a: ad 2b 13
    bne c3d42                                                         ; 3d3d: d0 03
    jmp c3ddf                                                         ; 3d3f: 4c df 3d

c3d42
    lda current_level                                                 ; 3d42: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3d44: c5 51
    beq c3d66                                                         ; 3d46: f0 1e
    lda l0a4a                                                         ; 3d48: ad 4a 0a
    beq c3d51                                                         ; 3d4b: f0 04
    cmp #$60 ; '`'                                                    ; 3d4d: c9 60
    bne c3d5a                                                         ; 3d4f: d0 09
c3d51
    lda l0a4b                                                         ; 3d51: ad 4b 0a
    beq c3d61                                                         ; 3d54: f0 0b
    cmp #1                                                            ; 3d56: c9 01
    beq c3d61                                                         ; 3d58: f0 07
c3d5a
    lda #$40 ; '@'                                                    ; 3d5a: a9 40
    sta l0a4a                                                         ; 3d5c: 8d 4a 0a
    bne c3d66                                                         ; 3d5f: d0 05
c3d61
    lda #$60 ; '`'                                                    ; 3d61: a9 60
    sta l0a4a                                                         ; 3d63: 8d 4a 0a
c3d66
    lda desired_room_index                                            ; 3d66: a5 30
    cmp #0                                                            ; 3d68: c9 00
    bne c3ddc                                                         ; 3d6a: d0 70
    ldx #$20 ; ' '                                                    ; 3d6c: a2 20
    ldy #2                                                            ; 3d6e: a0 02
    lda #$c9                                                          ; 3d70: a9 c9
    jsr draw_sprite_a_at_cell_xy                                      ; 3d72: 20 4c 1f
    dex                                                               ; 3d75: ca
    dex                                                               ; 3d76: ca
    lda #$ca                                                          ; 3d77: a9 ca
loop_c3d79
    jsr draw_sprite_a_at_cell_xy                                      ; 3d79: 20 4c 1f
    dex                                                               ; 3d7c: ca
    cpx #$0f                                                          ; 3d7d: e0 0f
    bcs loop_c3d79                                                    ; 3d7f: b0 f8
    dex                                                               ; 3d81: ca
    lda #$c8                                                          ; 3d82: a9 c8
    jsr draw_sprite_a_at_cell_xy                                      ; 3d84: 20 4c 1f
    lda #$60 ; '`'                                                    ; 3d87: a9 60
    sec                                                               ; 3d89: 38
    sbc l0a4a                                                         ; 3d8a: ed 4a 0a
    clc                                                               ; 3d8d: 18
    adc #$40 ; '@'                                                    ; 3d8e: 69 40
    lsr                                                               ; 3d90: 4a
    lsr                                                               ; 3d91: 4a
    lsr                                                               ; 3d92: 4a
    tay                                                               ; 3d93: a8
    lda #$cb                                                          ; 3d94: a9 cb
loop_c3d96
    jsr draw_sprite_a_at_cell_xy                                      ; 3d96: 20 4c 1f
    dey                                                               ; 3d99: 88
    cpy #3                                                            ; 3d9a: c0 03
    bcs loop_c3d96                                                    ; 3d9c: b0 f8
    lda #$0a                                                          ; 3d9e: a9 0a
    jsr set_object_position_from_cell_xy                              ; 3da0: 20 5d 1f
    lda #$cd                                                          ; 3da3: a9 cd
    sta l09b2                                                         ; 3da5: 8d b2 09
    lda l0a4a                                                         ; 3da8: ad 4a 0a
    sec                                                               ; 3dab: 38
    sbc #4                                                            ; 3dac: e9 04
    lsr                                                               ; 3dae: 4a
    lsr                                                               ; 3daf: 4a
    lsr                                                               ; 3db0: 4a
    tay                                                               ; 3db1: a8
    ldx #$20 ; ' '                                                    ; 3db2: a2 20
    lda #$cb                                                          ; 3db4: a9 cb
loop_c3db6
    jsr draw_sprite_a_at_cell_xy                                      ; 3db6: 20 4c 1f
    dey                                                               ; 3db9: 88
    cpy #3                                                            ; 3dba: c0 03
    bcs loop_c3db6                                                    ; 3dbc: b0 f8
    lda #4                                                            ; 3dbe: a9 04
    jsr set_object_position_from_cell_xy                              ; 3dc0: 20 5d 1f
    lda #5                                                            ; 3dc3: a9 05
    jsr set_object_position_from_cell_xy                              ; 3dc5: 20 5d 1f
    lda #$ce                                                          ; 3dc8: a9 ce
    sta l09ac                                                         ; 3dca: 8d ac 09
    lda #$c0                                                          ; 3dcd: a9 c0
    sta l38c6                                                         ; 3dcf: 8d c6 38
    lda #$cf                                                          ; 3dd2: a9 cf
    sta l09ad                                                         ; 3dd4: 8d ad 09
    lda #$d0                                                          ; 3dd7: a9 d0
    sta l38b1                                                         ; 3dd9: 8d b1 38
c3ddc
    jmp c3e16                                                         ; 3ddc: 4c 16 3e

c3ddf
    lda desired_room_index                                            ; 3ddf: a5 30
    cmp #0                                                            ; 3de1: c9 00
    bne c3e16                                                         ; 3de3: d0 31
    lda l0a4a                                                         ; 3de5: ad 4a 0a
    cmp #$60 ; '`'                                                    ; 3de8: c9 60
    beq c3e16                                                         ; 3dea: f0 2a
    cmp #$40 ; '@'                                                    ; 3dec: c9 40
    beq c3e01                                                         ; 3dee: f0 11
    lda #0                                                            ; 3df0: a9 00
    sta l09bd                                                         ; 3df2: 8d bd 09
    lda #$60 ; '`'                                                    ; 3df5: a9 60
    ldx #$18                                                          ; 3df7: a2 18
    ldy #$45 ; 'E'                                                    ; 3df9: a0 45
    jsr play_sound_yx                                                 ; 3dfb: 20 f6 38
    jmp c3e16                                                         ; 3dfe: 4c 16 3e

c3e01
    lda l0980                                                         ; 3e01: ad 80 09
    cmp l0a4a                                                         ; 3e04: cd 4a 0a
    beq c3e16                                                         ; 3e07: f0 0d
    lda #0                                                            ; 3e09: a9 00
    sta l09bd                                                         ; 3e0b: 8d bd 09
    lda #$60 ; '`'                                                    ; 3e0e: a9 60
    jsr sub_c3e85                                                     ; 3e10: 20 85 3e
    jsr play_landing_sound                                            ; 3e13: 20 a9 23
c3e16
    lda desired_room_index                                            ; 3e16: a5 30
    cmp #0                                                            ; 3e18: c9 00
    bne c3e6e                                                         ; 3e1a: d0 52
    lda l0a4a                                                         ; 3e1c: ad 4a 0a
    sta l0980                                                         ; 3e1f: 8d 80 09
    sta l0981                                                         ; 3e22: 8d 81 09
    lda #$60 ; '`'                                                    ; 3e25: a9 60
    sec                                                               ; 3e27: 38
    sbc l0a4a                                                         ; 3e28: ed 4a 0a
    clc                                                               ; 3e2b: 18
    adc #$44 ; 'D'                                                    ; 3e2c: 69 44
    sta l0986                                                         ; 3e2e: 8d 86 09
    ldx #$20 ; ' '                                                    ; 3e31: a2 20
    lda l0a4a                                                         ; 3e33: ad 4a 0a
    lsr                                                               ; 3e36: 4a
    lsr                                                               ; 3e37: 4a
    lsr                                                               ; 3e38: 4a
    tay                                                               ; 3e39: a8
    lda #1                                                            ; 3e3a: a9 01
    sta width_in_cells                                                ; 3e3c: 85 3c
    lda #4                                                            ; 3e3e: a9 04
    sta height_in_cells                                               ; 3e40: 85 3d
    lda #3                                                            ; 3e42: a9 03
    sta value_to_write_to_collision_map                               ; 3e44: 85 3e
    jsr read_collision_map_value_for_xy                               ; 3e46: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3e49: c5 3e
    beq c3e50                                                         ; 3e4b: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e4d: 20 44 1e
c3e50
    tya                                                               ; 3e50: 98
    clc                                                               ; 3e51: 18
    adc height_in_cells                                               ; 3e52: 65 3d
    tay                                                               ; 3e54: a8
    sta l0070                                                         ; 3e55: 85 70
    lda #$10                                                          ; 3e57: a9 10
    sec                                                               ; 3e59: 38
    sbc l0070                                                         ; 3e5a: e5 70
    beq c3e6e                                                         ; 3e5c: f0 10
    sta height_in_cells                                               ; 3e5e: 85 3d
    lda #0                                                            ; 3e60: a9 00
    sta value_to_write_to_collision_map                               ; 3e62: 85 3e
    jsr read_collision_map_value_for_xy                               ; 3e64: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3e67: c5 3e
    beq c3e6e                                                         ; 3e69: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e6b: 20 44 1e
c3e6e
    lda update_room_first_update_flag                                 ; 3e6e: ad 2b 13
    bne c3e84                                                         ; 3e71: d0 11
    lda l0a4a                                                         ; 3e73: ad 4a 0a
    cmp #$60 ; '`'                                                    ; 3e76: c9 60
    beq c3e84                                                         ; 3e78: f0 0a
    cmp #$40 ; '@'                                                    ; 3e7a: c9 40
    beq c3e84                                                         ; 3e7c: f0 06
    sec                                                               ; 3e7e: 38
    sbc #4                                                            ; 3e7f: e9 04
    sta l0a4a                                                         ; 3e81: 8d 4a 0a
c3e84
    rts                                                               ; 3e84: 60

sub_c3e85
    cmp sound_priority_per_channel_table                              ; 3e85: cd 6f 39
    bcc c3e92                                                         ; 3e88: 90 08
    lda #0                                                            ; 3e8a: a9 00
    sta sound_priority_per_channel_table                              ; 3e8c: 8d 6f 39
    sta l3970                                                         ; 3e8f: 8d 70 39
c3e92
    rts                                                               ; 3e92: 60

; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 20                                                          ; 3e93: 14                      ; initial player X cell
    !byte 21                                                          ; 3e94: 15                      ; initial player Y cell

; ###     ###   |          |   ###     ###
; ###     ###   |          |   ###     ###
; ###     ###   |          |   ###     ###
; ###     ###   |          |   ###     ###
; ###     ###   |          |   ###     ###
; ###     ###   |          |   ###     ###
; ###     ###   |          |   ###     ###
; ###########   |   ####   |   ###########
; ###########   |   ####   |   ###########
; ###     ###   |          |   ###     ###
; ###           |          |           ###
; ###           |          |           ###
; ###           |          |           ###
; ###           |          |           ###
; ###           |          |           ###
; ###           |          |           ###
; ###           |          |           ###
; ###           |          |           ###
; ###
; ###
; ###OOO         OOO  P
; ###OOO         OOO####
; ########################################
; ########################################
; Draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 3x22 rectangle at (0,0)
room_1_code
    ldx #0                                                            ; 3e95: a2 00
    ldy #0                                                            ; 3e97: a0 00
    lda #3                                                            ; 3e99: a9 03
    sta width_in_cells                                                ; 3e9b: 85 3c
    lda #$16                                                          ; 3e9d: a9 16
    sta height_in_cells                                               ; 3e9f: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ea1: 20 bb 1a
; draw 3x18 rectangle at (37,0)
    ldx #$25 ; '%'                                                    ; 3ea4: a2 25
    lda #$12                                                          ; 3ea6: a9 12
    sta height_in_cells                                               ; 3ea8: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3eaa: 20 bb 1a
; draw 255x18 rectangle at (0,22)
    ldx #0                                                            ; 3ead: a2 00
    ldy #$16                                                          ; 3eaf: a0 16
    lda #$ff                                                          ; 3eb1: a9 ff
    sta width_in_cells                                                ; 3eb3: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3eb5: 20 bb 1a
; draw 3x10 rectangle at (8,0)
    ldx #8                                                            ; 3eb8: a2 08
    ldy #0                                                            ; 3eba: a0 00
    lda #3                                                            ; 3ebc: a9 03
    sta width_in_cells                                                ; 3ebe: 85 3c
    lda #$0a                                                          ; 3ec0: a9 0a
    sta height_in_cells                                               ; 3ec2: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ec4: 20 bb 1a
; draw 3x10 rectangle at (29,0)
    ldx #$1d                                                          ; 3ec7: a2 1d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ec9: 20 bb 1a
; draw 5x2 rectangle at (3,7)
    ldx #3                                                            ; 3ecc: a2 03
    ldy #7                                                            ; 3ece: a0 07
    lda #5                                                            ; 3ed0: a9 05
    sta width_in_cells                                                ; 3ed2: 85 3c
    lda #2                                                            ; 3ed4: a9 02
    sta height_in_cells                                               ; 3ed6: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ed8: 20 bb 1a
; draw 5x2 rectangle at (32,7)
    ldx #$20 ; ' '                                                    ; 3edb: a2 20
    jsr copy_rectangle_of_memory_to_screen                            ; 3edd: 20 bb 1a
; draw 4x2 rectangle at (18,7)
    ldx #$12                                                          ; 3ee0: a2 12
    dec width_in_cells                                                ; 3ee2: c6 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3ee4: 20 bb 1a
; draw 4x1 rectangle at (18,21)
    ldy #$15                                                          ; 3ee7: a0 15
    dec height_in_cells                                               ; 3ee9: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3eeb: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3eee: 20 90 1b
; draw sprite $cc at (15,20) of size (3x2)
    lda #3                                                            ; 3ef1: a9 03
    sta width_in_cells                                                ; 3ef3: 85 3c
    lda #2                                                            ; 3ef5: a9 02
    sta height_in_cells                                               ; 3ef7: 85 3d
    ldx #$0f                                                          ; 3ef9: a2 0f
    ldy #$14                                                          ; 3efb: a0 14
    lda #$cc                                                          ; 3efd: a9 cc
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3eff: 20 57 1f
; draw sprite $cc at (3,20) of size (3x2)
    ldx #3                                                            ; 3f02: a2 03
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3f04: 20 57 1f
; draw rope at (14,0) length 18
    ldx #$0e                                                          ; 3f07: a2 0e
    ldy #0                                                            ; 3f09: a0 00
    lda #$12                                                          ; 3f0b: a9 12
    jsr draw_rope                                                     ; 3f0d: 20 b9 1d
; draw rope at (25,0) length 18
    ldx #$19                                                          ; 3f10: a2 19
    jsr draw_rope                                                     ; 3f12: 20 b9 1d
    jsr start_room                                                    ; 3f15: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 3f18: 20 da 12
    sta l0070                                                         ; 3f1b: 85 70
    and #8                                                            ; 3f1d: 29 08
    beq c3f28                                                         ; 3f1f: f0 07
    ldx #2                                                            ; 3f21: a2 02
    ldy current_level                                                 ; 3f23: a4 31
    jmp initialise_level_and_room                                     ; 3f25: 4c 40 11

c3f28
    lda l0070                                                         ; 3f28: a5 70
    and #4                                                            ; 3f2a: 29 04
    beq room_1_game_update_loop                                       ; 3f2c: f0 ea
    ldx #0                                                            ; 3f2e: a2 00
    ldy current_level                                                 ; 3f30: a4 31
    jmp initialise_level_and_room                                     ; 3f32: 4c 40 11

sub_c3f35
    lda #1                                                            ; 3f35: a9 01
    sta currently_updating_logic_for_room_index                       ; 3f37: 8d ba 1a
    ldx #3                                                            ; 3f3a: a2 03
    ldy #$0e                                                          ; 3f3c: a0 0e
    lda #4                                                            ; 3f3e: a9 04
    jsr update_brazier_and_fire                                       ; 3f40: 20 88 19
    ldx #$25 ; '%'                                                    ; 3f43: a2 25
    lda #5                                                            ; 3f45: a9 05
    jmp update_brazier_and_fire                                       ; 3f47: 4c 88 19

sub_c3f4a
    ldx #3                                                            ; 3f4a: a2 03
    ldy #2                                                            ; 3f4c: a0 02
    lda #1                                                            ; 3f4e: a9 01
    sta width_in_cells                                                ; 3f50: 85 3c
    sta height_in_cells                                               ; 3f52: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f54: 20 bb 1a
    ldx #$24 ; '$'                                                    ; 3f57: a2 24
    jmp copy_rectangle_of_memory_to_screen                            ; 3f59: 4c bb 1a

sub_c3f5c
    lda #1                                                            ; 3f5c: a9 01
    sta width_in_cells                                                ; 3f5e: 85 3c
    lda #2                                                            ; 3f60: a9 02
    sta height_in_cells                                               ; 3f62: 85 3d
    lda #$fc                                                          ; 3f64: a9 fc
    sta temp_sprite_x_offset                                          ; 3f66: 85 3a
    lda #$e1                                                          ; 3f68: a9 e1
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3f6a: 20 57 1f
    lda #$da                                                          ; 3f6d: a9 da
    jmp draw_sprite_a_at_cell_xy                                      ; 3f6f: 4c 4c 1f

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 27                                                          ; 3f72: 1b                      ; initial player X cell
    !byte 15                                                          ; 3f73: 0f                      ; initial player Y cell

; ########################################
; ########################################
; ####          |       |    |    |   ####
; ###           |       |    |    |    ###
; ###           |       |    |    |    ###
; ###           |       |    |    |    ###
; ###           |       S    S    S    ###
; ###           |       O    O    O    ###
; ###           |                      ###
; ###           |                      ###
;               |                      ###
;               |                      ###
;               |                      ###
;               |                   OOO###
;               |            P      OOO###
; ###########   |   ######################
; ###########   |   ######################
; ###     ###   |          |   ###     ###
; ###     ###   |          |   ###     ###
; ###     ###   |          |   ###     ###
; ###     ###   |          |   ###     ###
; ###     ###   |          |   ###     ###
; ###     ###   |          |   ###     ###
; ###     ###   |          |   ###     ###
; Draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_2_code
    ldx #0                                                            ; 3f74: a2 00
    ldy #0                                                            ; 3f76: a0 00
    lda #$ff                                                          ; 3f78: a9 ff
    sta width_in_cells                                                ; 3f7a: 85 3c
    lda #2                                                            ; 3f7c: a9 02
    sta height_in_cells                                               ; 3f7e: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f80: 20 bb 1a
; draw 255x22 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3f83: a2 25
    ldy #2                                                            ; 3f85: a0 02
    lda #$16                                                          ; 3f87: a9 16
    sta height_in_cells                                               ; 3f89: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f8b: 20 bb 1a
; draw 3x8 rectangle at (0,2)
    ldx #0                                                            ; 3f8e: a2 00
    lda #3                                                            ; 3f90: a9 03
    sta width_in_cells                                                ; 3f92: 85 3c
    lda #8                                                            ; 3f94: a9 08
    sta height_in_cells                                               ; 3f96: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f98: 20 bb 1a
; draw 3x9 rectangle at (0,15)
    ldy #$0f                                                          ; 3f9b: a0 0f
    inc height_in_cells                                               ; 3f9d: e6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f9f: 20 bb 1a
; draw 3x9 rectangle at (8,15)
    ldx #8                                                            ; 3fa2: a2 08
    jsr copy_rectangle_of_memory_to_screen                            ; 3fa4: 20 bb 1a
; draw 3x9 rectangle at (29,15)
    ldx #$1d                                                          ; 3fa7: a2 1d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fa9: 20 bb 1a
; draw 5x2 rectangle at (3,15)
    ldx #3                                                            ; 3fac: a2 03
    lda #5                                                            ; 3fae: a9 05
    sta width_in_cells                                                ; 3fb0: 85 3c
    lda #2                                                            ; 3fb2: a9 02
    sta height_in_cells                                               ; 3fb4: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fb6: 20 bb 1a
; draw 5x2 rectangle at (32,15)
    ldx #$20 ; ' '                                                    ; 3fb9: a2 20
    jsr copy_rectangle_of_memory_to_screen                            ; 3fbb: 20 bb 1a
; draw 11x2 rectangle at (18,15)
    ldx #$12                                                          ; 3fbe: a2 12
    lda #$0b                                                          ; 3fc0: a9 0b
    sta width_in_cells                                                ; 3fc2: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3fc4: 20 bb 1a
    jsr sub_c3f4a                                                     ; 3fc7: 20 4a 3f
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3fca: 20 90 1b
; draw rope at (14,2) length 255
    ldx #$0e                                                          ; 3fcd: a2 0e
    ldy #2                                                            ; 3fcf: a0 02
    lda #$ff                                                          ; 3fd1: a9 ff
    jsr draw_rope                                                     ; 3fd3: 20 b9 1d
; draw rope at (25,17) length 255
    ldx #$19                                                          ; 3fd6: a2 19
    ldy #$11                                                          ; 3fd8: a0 11
    jsr draw_rope                                                     ; 3fda: 20 b9 1d
; draw rope at (22,2) length 5
    ldx #$16                                                          ; 3fdd: a2 16
    ldy #2                                                            ; 3fdf: a0 02
    lda #5                                                            ; 3fe1: a9 05
    jsr draw_rope                                                     ; 3fe3: 20 b9 1d
; draw rope at (27,2) length 5
    ldx #$1b                                                          ; 3fe6: a2 1b
    jsr draw_rope                                                     ; 3fe8: 20 b9 1d
; draw rope at (32,2) length 5
    ldx #$20 ; ' '                                                    ; 3feb: a2 20
    jsr draw_rope                                                     ; 3fed: 20 b9 1d
; draw sprite $cc at (34,13) of size (3x2)
    ldx #$22 ; '"'                                                    ; 3ff0: a2 22
    ldy #$0d                                                          ; 3ff2: a0 0d
    lda #3                                                            ; 3ff4: a9 03
    sta width_in_cells                                                ; 3ff6: 85 3c
    lda #2                                                            ; 3ff8: a9 02
    sta height_in_cells                                               ; 3ffa: 85 3d
    lda #$cc                                                          ; 3ffc: a9 cc
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3ffe: 20 57 1f
    ldy #6                                                            ; 4001: a0 06
    ldx #$16                                                          ; 4003: a2 16
    jsr sub_c3f5c                                                     ; 4005: 20 5c 3f
; draw sprite $e7 at (22,6)
    lda #$e7                                                          ; 4008: a9 e7
    jsr draw_sprite_a_at_cell_xy                                      ; 400a: 20 4c 1f
    ldx #$1b                                                          ; 400d: a2 1b
    jsr sub_c3f5c                                                     ; 400f: 20 5c 3f
; draw sprite $e7 at (27,6)
    lda #$e7                                                          ; 4012: a9 e7
    jsr draw_sprite_a_at_cell_xy                                      ; 4014: 20 4c 1f
    ldx #$20 ; ' '                                                    ; 4017: a2 20
    jsr sub_c3f5c                                                     ; 4019: 20 5c 3f
; draw sprite $e7 at (32,6)
    lda #$e7                                                          ; 401c: a9 e7
    jsr draw_sprite_a_at_cell_xy                                      ; 401e: 20 4c 1f
    jsr start_room                                                    ; 4021: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 4024: 20 da 12
    sta l0070                                                         ; 4027: 85 70
    and #1                                                            ; 4029: 29 01
    beq c4034                                                         ; 402b: f0 07
    ldx #3                                                            ; 402d: a2 03
    ldy current_level                                                 ; 402f: a4 31
    jmp initialise_level_and_room                                     ; 4031: 4c 40 11

c4034
    lda l0070                                                         ; 4034: a5 70
    and #2                                                            ; 4036: 29 02
    beq room_2_game_update_loop                                       ; 4038: f0 ea
    ldx #1                                                            ; 403a: a2 01
    ldy current_level                                                 ; 403c: a4 31
    jmp initialise_level_and_room                                     ; 403e: 4c 40 11

l4041
    !byte   0,   0,   0, $80,   8,   0, $80,   8,   2,   8,   2,   8  ; 4041: 00 00 00...
    !byte   4,   8,   4,   8,   6,   8,   6, $80,   0,   8, $80       ; 404d: 04 08 04...

sub_c4058
    lda #2                                                            ; 4058: a9 02
    sta currently_updating_logic_for_room_index                       ; 405a: 8d ba 1a
    ldx #3                                                            ; 405d: a2 03
    ldy #6                                                            ; 405f: a0 06
    lda #4                                                            ; 4061: a9 04
    jsr update_brazier_and_fire                                       ; 4063: 20 88 19
    lda update_room_first_update_flag                                 ; 4066: ad 2b 13
    beq c40e6                                                         ; 4069: f0 7b
    ldx #$0a                                                          ; 406b: a2 0a
    ldy #$45 ; 'E'                                                    ; 406d: a0 45
    jsr define_envelope                                               ; 406f: 20 5e 39
    ldx #$20 ; ' '                                                    ; 4072: a2 20
    ldy #$45 ; 'E'                                                    ; 4074: a0 45
    jsr define_envelope                                               ; 4076: 20 5e 39
    lda current_level                                                 ; 4079: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 407b: c5 51
    beq c40b1                                                         ; 407d: f0 32
    lda l0a4d                                                         ; 407f: ad 4d 0a
    cmp #1                                                            ; 4082: c9 01
    beq c40b1                                                         ; 4084: f0 2b
    dec l0a73                                                         ; 4086: ce 73 0a
    ora #0                                                            ; 4089: 09 00
    bne c40b1                                                         ; 408b: d0 24
    inc l0a73                                                         ; 408d: ee 73 0a
    lda #1                                                            ; 4090: a9 01
    sta l0a53                                                         ; 4092: 8d 53 0a
    lda #$98                                                          ; 4095: a9 98
    sta l0a4f                                                         ; 4097: 8d 4f 0a
    lda #0                                                            ; 409a: a9 00
    sta l0a50                                                         ; 409c: 8d 50 0a
    lda #$28 ; '('                                                    ; 409f: a9 28
    sta l0a51                                                         ; 40a1: 8d 51 0a
    lda #0                                                            ; 40a4: a9 00
    sta l0a52                                                         ; 40a6: 8d 52 0a
    lda #1                                                            ; 40a9: a9 01
    sta l0a4d                                                         ; 40ab: 8d 4d 0a
    sta l0a4e                                                         ; 40ae: 8d 4e 0a
c40b1
    lda #$e2                                                          ; 40b1: a9 e2
    sta l38ae                                                         ; 40b3: 8d ae 38
    lda #$c0                                                          ; 40b6: a9 c0
    sta l38c4                                                         ; 40b8: 8d c4 38
    lda desired_room_index                                            ; 40bb: a5 30
    cmp l0a53                                                         ; 40bd: cd 53 0a
    bne c40de                                                         ; 40c0: d0 1c
    jsr sub_c42f0                                                     ; 40c2: 20 f0 42
loop_c40c5
    lda desired_room_index                                            ; 40c5: a5 30
    cmp l0a53                                                         ; 40c7: cd 53 0a
    bne c40de                                                         ; 40ca: d0 12
    lda l0a73                                                         ; 40cc: ad 73 0a
    beq c40de                                                         ; 40cf: f0 0d
    cmp #$ff                                                          ; 40d1: c9 ff
    beq c40d8                                                         ; 40d3: f0 03
    dec l0a73                                                         ; 40d5: ce 73 0a
c40d8
    jsr sub_c417b                                                     ; 40d8: 20 7b 41
    jmp loop_c40c5                                                    ; 40db: 4c c5 40

c40de
    lda #3                                                            ; 40de: a9 03
    jsr sub_c430e                                                     ; 40e0: 20 0e 43
    jmp c4177                                                         ; 40e3: 4c 77 41

c40e6
    lda desired_room_index                                            ; 40e6: a5 30
    cmp l0a53                                                         ; 40e8: cd 53 0a
    beq c40f8                                                         ; 40eb: f0 0b
    lda l0a73                                                         ; 40ed: ad 73 0a
    bmi c40f5                                                         ; 40f0: 30 03
    inc l0a73                                                         ; 40f2: ee 73 0a
c40f5
    jmp c4177                                                         ; 40f5: 4c 77 41

c40f8
    lda #$40 ; '@'                                                    ; 40f8: a9 40
    jsr sub_c3e85                                                     ; 40fa: 20 85 3e
    jsr sub_c417b                                                     ; 40fd: 20 7b 41
    lda desired_room_index                                            ; 4100: a5 30
    cmp l0a53                                                         ; 4102: cd 53 0a
    beq c410f                                                         ; 4105: f0 08
    lda #0                                                            ; 4107: a9 00
    sta l0a73                                                         ; 4109: 8d 73 0a
    jmp c4177                                                         ; 410c: 4c 77 41

c410f
    lda l0a4d                                                         ; 410f: ad 4d 0a
    cmp #7                                                            ; 4112: c9 07
    bne c4131                                                         ; 4114: d0 1b
    lda l0a54                                                         ; 4116: ad 54 0a
    bpl c411e                                                         ; 4119: 10 03
    jmp c4124                                                         ; 411b: 4c 24 41

c411e
    inc temp_right_offset                                             ; 411e: ee d1 24
    inc temp_left_offset                                              ; 4121: ee d0 24
c4124
    lda #1                                                            ; 4124: a9 01
    sta temp_bottom_offset                                            ; 4126: 8d 51 25
    lda #2                                                            ; 4129: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 412b: 20 94 28
    bne c414b                                                         ; 412e: d0 1b
    rts                                                               ; 4130: 60

c4131
    lda l0a4d                                                         ; 4131: ad 4d 0a
    cmp #4                                                            ; 4134: c9 04
    bne c414e                                                         ; 4136: d0 16
    inc temp_right_offset                                             ; 4138: ee d1 24
    lda #2                                                            ; 413b: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 413d: 20 94 28
    bne c414b                                                         ; 4140: d0 09
    lda #$40 ; '@'                                                    ; 4142: a9 40
    ldx #$18                                                          ; 4144: a2 18
    ldy #$45 ; 'E'                                                    ; 4146: a0 45
    jmp play_sound_yx                                                 ; 4148: 4c f6 38

c414b
    jmp play_landing_sound                                            ; 414b: 4c a9 23

c414e
    cmp #$14                                                          ; 414e: c9 14
    bne c4172                                                         ; 4150: d0 20
    inc temp_left_offset                                              ; 4152: ee d0 24
    lda #2                                                            ; 4155: a9 02
    sta temp_bottom_offset                                            ; 4157: 8d 51 25
    lda #2                                                            ; 415a: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 415c: 20 94 28
    beq c4177                                                         ; 415f: f0 16
    lda #0                                                            ; 4161: a9 00
    ldx #$36 ; '6'                                                    ; 4163: a2 36
    ldy #$45 ; 'E'                                                    ; 4165: a0 45
    jsr play_sound_yx                                                 ; 4167: 20 f6 38
    ldx #$2e ; '.'                                                    ; 416a: a2 2e
    ldy #$45 ; 'E'                                                    ; 416c: a0 45
    jsr play_sound_yx                                                 ; 416e: 20 f6 38
    rts                                                               ; 4171: 60

c4172
    lda #3                                                            ; 4172: a9 03
    jsr sub_c430e                                                     ; 4174: 20 0e 43
c4177
    rts                                                               ; 4177: 60

c4178
    jmp c4266                                                         ; 4178: 4c 66 42

sub_c417b
    lda l0a4e                                                         ; 417b: ad 4e 0a
    clc                                                               ; 417e: 18
    adc #2                                                            ; 417f: 69 02
    tay                                                               ; 4181: a8
    lda l4041,y                                                       ; 4182: b9 41 40
    cmp #$80                                                          ; 4185: c9 80
    bne c418c                                                         ; 4187: d0 03
    ldy l0a4d                                                         ; 4189: ac 4d 0a
c418c
    lda l0a4d                                                         ; 418c: ad 4d 0a
    cmp #1                                                            ; 418f: c9 01
    bne c41ef                                                         ; 4191: d0 5c
    lda update_room_first_update_flag                                 ; 4193: ad 2b 13
    bne c4178                                                         ; 4196: d0 e0
    dec temp_left_offset                                              ; 4198: ce d0 24
    ldx #0                                                            ; 419b: a2 00
    sty l42ef                                                         ; 419d: 8c ef 42
    ldy #2                                                            ; 41a0: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 41a2: 20 e2 28
    ldy l42ef                                                         ; 41a5: ac ef 42
    ora #0                                                            ; 41a8: 09 00
    beq c4178                                                         ; 41aa: f0 cc
    lda object_y_low                                                  ; 41ac: ad 7c 09
    sec                                                               ; 41af: 38
    sbc l0a51                                                         ; 41b0: ed 51 0a
    lda object_y_high                                                 ; 41b3: ad 92 09
    sbc l0a52                                                         ; 41b6: ed 52 0a
    bmi c4178                                                         ; 41b9: 30 bd
    ldx #1                                                            ; 41bb: a2 01
    lda object_room_collision_flags                                   ; 41bd: ad d8 38
    and #4                                                            ; 41c0: 29 04
    bne c41cd                                                         ; 41c2: d0 09
    ldx #$ff                                                          ; 41c4: a2 ff
    lda object_room_collision_flags                                   ; 41c6: ad d8 38
    and #1                                                            ; 41c9: 29 01
    beq c4178                                                         ; 41cb: f0 ab
c41cd
    stx l0a54                                                         ; 41cd: 8e 54 0a
    lda #0                                                            ; 41d0: a9 00
    jsr sub_c430e                                                     ; 41d2: 20 0e 43
    lda #$e0                                                          ; 41d5: a9 e0
    cmp player_using_object_spriteid                                  ; 41d7: cd b6 2e
    bne c41ea                                                         ; 41da: d0 0e
    lda #0                                                            ; 41dc: a9 00
    ldx #$4c ; 'L'                                                    ; 41de: a2 4c
    ldy #$45 ; 'E'                                                    ; 41e0: a0 45
    jsr play_sound_yx                                                 ; 41e2: 20 f6 38
    lda #$ff                                                          ; 41e5: a9 ff
    sta l0a74                                                         ; 41e7: 8d 74 0a
c41ea
    ldy #4                                                            ; 41ea: a0 04
    sty l0a4d                                                         ; 41ec: 8c 4d 0a
c41ef
    lda l0a4d                                                         ; 41ef: ad 4d 0a
    cmp #4                                                            ; 41f2: c9 04
    bne c4235                                                         ; 41f4: d0 3f
    lda l0a54                                                         ; 41f6: ad 54 0a
    bmi c4204                                                         ; 41f9: 30 09
    inc temp_right_offset                                             ; 41fb: ee d1 24
    inc temp_left_offset                                              ; 41fe: ee d0 24
    jmp c4204                                                         ; 4201: 4c 04 42

c4204
    lda #2                                                            ; 4204: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4206: 20 94 28
    bne c425c                                                         ; 4209: d0 51
    lda l0a54                                                         ; 420b: ad 54 0a
    bmi c4217                                                         ; 420e: 30 07
    lda #9                                                            ; 4210: a9 09
    sta temp_left_offset                                              ; 4212: 8d d0 24
    bne c421c                                                         ; 4215: d0 05
c4217
    lda #$f8                                                          ; 4217: a9 f8
    sta temp_right_offset                                             ; 4219: 8d d1 24
c421c
    lda #2                                                            ; 421c: a9 02
    sta temp_bottom_offset                                            ; 421e: 8d 51 25
    lda #3                                                            ; 4221: a9 03
    sta temp_default_collision_map_option                             ; 4223: 8d e1 28
    lda #2                                                            ; 4226: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4228: 20 94 28
    bne c4266                                                         ; 422b: d0 39
    ldy #7                                                            ; 422d: a0 07
    sty l0a4d                                                         ; 422f: 8c 4d 0a
    jmp c4266                                                         ; 4232: 4c 66 42

c4235
    lda l0a4d                                                         ; 4235: ad 4d 0a
    cmp #7                                                            ; 4238: c9 07
    bne c4246                                                         ; 423a: d0 0a
    cpy l0a4d                                                         ; 423c: cc 4d 0a
    bne c4266                                                         ; 423f: d0 25
    ldy #$14                                                          ; 4241: a0 14
    sty l0a4d                                                         ; 4243: 8c 4d 0a
c4246
    lda l0a4d                                                         ; 4246: ad 4d 0a
    cmp #$14                                                          ; 4249: c9 14
    bne c4266                                                         ; 424b: d0 19
    inc temp_left_offset                                              ; 424d: ee d0 24
    lda #2                                                            ; 4250: a9 02
    sta temp_bottom_offset                                            ; 4252: 8d 51 25
    lda #2                                                            ; 4255: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4257: 20 94 28
    beq c4266                                                         ; 425a: f0 0a
c425c
    lda #0                                                            ; 425c: a9 00
    sta l0a73                                                         ; 425e: 8d 73 0a
    ldy #1                                                            ; 4261: a0 01
    sty l0a4d                                                         ; 4263: 8c 4d 0a
c4266
    sty l0a4e                                                         ; 4266: 8c 4e 0a
    lda l4041,y                                                       ; 4269: b9 41 40
    ldx l0a54                                                         ; 426c: ae 54 0a
    bpl c4276                                                         ; 426f: 10 05
    eor #$ff                                                          ; 4271: 49 ff
    clc                                                               ; 4273: 18
    adc #1                                                            ; 4274: 69 01
c4276
    ldx #0                                                            ; 4276: a2 00
    ora #0                                                            ; 4278: 09 00
    bpl c427d                                                         ; 427a: 10 01
    dex                                                               ; 427c: ca
c427d
    clc                                                               ; 427d: 18
    adc l0a4f                                                         ; 427e: 6d 4f 0a
    sta l0a4f                                                         ; 4281: 8d 4f 0a
    txa                                                               ; 4284: 8a
    adc l0a50                                                         ; 4285: 6d 50 0a
    sta l0a50                                                         ; 4288: 8d 50 0a
    iny                                                               ; 428b: c8
    lda l4041,y                                                       ; 428c: b9 41 40
    clc                                                               ; 428f: 18
    adc l0a51                                                         ; 4290: 6d 51 0a
    sta l0a51                                                         ; 4293: 8d 51 0a
    lda #0                                                            ; 4296: a9 00
    adc l0a52                                                         ; 4298: 6d 52 0a
    sta l0a52                                                         ; 429b: 8d 52 0a
    jsr sub_c42f0                                                     ; 429e: 20 f0 42
    ldx #2                                                            ; 42a1: a2 02
    jsr l2434                                                         ; 42a3: 20 34 24
    jsr l24d2                                                         ; 42a6: 20 d2 24
    lda l0a4d                                                         ; 42a9: ad 4d 0a
    cmp #4                                                            ; 42ac: c9 04
    bne c42ee                                                         ; 42ae: d0 3e
    lda l0a54                                                         ; 42b0: ad 54 0a
    bmi c42d1                                                         ; 42b3: 30 1c
    lda l0078                                                         ; 42b5: a5 78
    cmp #$28 ; '('                                                    ; 42b7: c9 28
    bcc c42ee                                                         ; 42b9: 90 33
    lda l0a4f                                                         ; 42bb: ad 4f 0a
    sec                                                               ; 42be: 38
    sbc #$40 ; '@'                                                    ; 42bf: e9 40
    sta l0a4f                                                         ; 42c1: 8d 4f 0a
    lda #0                                                            ; 42c4: a9 00
    sbc #0                                                            ; 42c6: e9 00
    sta l0a50                                                         ; 42c8: 8d 50 0a
    dec l0a53                                                         ; 42cb: ce 53 0a
    jmp c42e9                                                         ; 42ce: 4c e9 42

c42d1
    lda l0079                                                         ; 42d1: a5 79
    bpl c42ee                                                         ; 42d3: 10 19
    lda l0a4f                                                         ; 42d5: ad 4f 0a
    clc                                                               ; 42d8: 18
    adc #$40 ; '@'                                                    ; 42d9: 69 40
    sta l0a4f                                                         ; 42db: 8d 4f 0a
    lda #1                                                            ; 42de: a9 01
    sta l0a50                                                         ; 42e0: 8d 50 0a
    inc l0a53                                                         ; 42e3: ee 53 0a
    jmp c42e9                                                         ; 42e6: 4c e9 42

c42e9
    lda #0                                                            ; 42e9: a9 00
    sta l09aa                                                         ; 42eb: 8d aa 09
c42ee
    rts                                                               ; 42ee: 60

l42ef
    !byte 0                                                           ; 42ef: 00

sub_c42f0
    lda l0a4f                                                         ; 42f0: ad 4f 0a
    sta l0952                                                         ; 42f3: 8d 52 09
    lda l0a50                                                         ; 42f6: ad 50 0a
    sta l0968                                                         ; 42f9: 8d 68 09
    lda l0a51                                                         ; 42fc: ad 51 0a
    sta l097e                                                         ; 42ff: 8d 7e 09
    lda l0a52                                                         ; 4302: ad 52 0a
    sta l0994                                                         ; 4305: 8d 94 09
    lda #$e1                                                          ; 4308: a9 e1
    sta l09aa                                                         ; 430a: 8d aa 09
    rts                                                               ; 430d: 60

sub_c430e
    sta value_to_write_to_collision_map                               ; 430e: 85 3e
    ora #0                                                            ; 4310: 09 00
    beq c431b                                                         ; 4312: f0 07
    lda l0a4d                                                         ; 4314: ad 4d 0a
    cmp #1                                                            ; 4317: c9 01
    bne c4354                                                         ; 4319: d0 39
c431b
    lda desired_room_index                                            ; 431b: a5 30
    cmp l0a53                                                         ; 431d: cd 53 0a
    bne c4354                                                         ; 4320: d0 32
    lda l0a50                                                         ; 4322: ad 50 0a
    lsr                                                               ; 4325: 4a
    sta l0070                                                         ; 4326: 85 70
    lda l0a4f                                                         ; 4328: ad 4f 0a
    ror                                                               ; 432b: 6a
    lsr l0070                                                         ; 432c: 46 70
    ror                                                               ; 432e: 6a
    lsr l0070                                                         ; 432f: 46 70
    ror                                                               ; 4331: 6a
    tax                                                               ; 4332: aa
    lda l0a52                                                         ; 4333: ad 52 0a
    lsr                                                               ; 4336: 4a
    sta l0070                                                         ; 4337: 85 70
    lda l0a51                                                         ; 4339: ad 51 0a
    ror                                                               ; 433c: 6a
    lsr l0070                                                         ; 433d: 46 70
    ror                                                               ; 433f: 6a
    lsr l0070                                                         ; 4340: 46 70
    ror                                                               ; 4342: 6a
    tay                                                               ; 4343: a8
    lda #2                                                            ; 4344: a9 02
    sta width_in_cells                                                ; 4346: 85 3c
    sta height_in_cells                                               ; 4348: 85 3d
    jsr read_collision_map_value_for_xy                               ; 434a: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 434d: c5 3e
    beq c4354                                                         ; 434f: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 4351: 20 44 1e
c4354
    rts                                                               ; 4354: 60

; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 12                                                          ; 4355: 0c                      ; initial player X cell
    !byte 15                                                          ; 4356: 0f                      ; initial player Y cell

; ########################################
; ########################################
; ####   |    |    |       |          ####
; ###    |    |    |       |           ###
; ###    |    |    |       |           ###
; ###    |    |    |       |           ###
; ###    S    S    S       |           ###
; ###    O    O    O       |           ###
; ###                      |           ###
; ###                      |           ###
; ###                      |
; ###                      |
; ###                      |
; ###OOO                   |
; ###OOO      P            |
; ######################   |   ###########
; ######################   |   ###########
; ###                      |           ###
; ###                      |           ###
; ###                      |           ###
; ###                                  ###
; ###                                  ###
; ########################################
; ########################################
; Draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_3_code
    ldx #0                                                            ; 4357: a2 00
    ldy #0                                                            ; 4359: a0 00
    lda #$ff                                                          ; 435b: a9 ff
    sta width_in_cells                                                ; 435d: 85 3c
    lda #2                                                            ; 435f: a9 02
    sta height_in_cells                                               ; 4361: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4363: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 4366: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 4368: 20 bb 1a
; draw 3x20 rectangle at (0,2)
    ldy #2                                                            ; 436b: a0 02
    lda #3                                                            ; 436d: a9 03
    sta width_in_cells                                                ; 436f: 85 3c
    lda #$14                                                          ; 4371: a9 14
    sta height_in_cells                                               ; 4373: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4375: 20 bb 1a
; draw 3x8 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 4378: a2 25
    lda #8                                                            ; 437a: a9 08
    sta height_in_cells                                               ; 437c: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 437e: 20 bb 1a
; draw 3x7 rectangle at (37,15)
    ldy #$0f                                                          ; 4381: a0 0f
    dec height_in_cells                                               ; 4383: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4385: 20 bb 1a
; draw 19x2 rectangle at (3,15)
    ldx #3                                                            ; 4388: a2 03
    lda #$13                                                          ; 438a: a9 13
    sta width_in_cells                                                ; 438c: 85 3c
    lda #2                                                            ; 438e: a9 02
    sta height_in_cells                                               ; 4390: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4392: 20 bb 1a
; draw 8x2 rectangle at (29,15)
    ldx #$1d                                                          ; 4395: a2 1d
    lda #8                                                            ; 4397: a9 08
    sta width_in_cells                                                ; 4399: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 439b: 20 bb 1a
    jsr sub_c3f4a                                                     ; 439e: 20 4a 3f
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 43a1: 20 90 1b
; draw rope at (25,2) length 18
    ldx #$19                                                          ; 43a4: a2 19
    ldy #2                                                            ; 43a6: a0 02
    lda #$12                                                          ; 43a8: a9 12
    jsr draw_rope                                                     ; 43aa: 20 b9 1d
; draw rope at (7,2) length 5
    ldx #7                                                            ; 43ad: a2 07
    lda #5                                                            ; 43af: a9 05
    jsr draw_rope                                                     ; 43b1: 20 b9 1d
; draw rope at (12,2) length 5
    ldx #$0c                                                          ; 43b4: a2 0c
    jsr draw_rope                                                     ; 43b6: 20 b9 1d
; draw rope at (17,2) length 5
    ldx #$11                                                          ; 43b9: a2 11
    jsr draw_rope                                                     ; 43bb: 20 b9 1d
; draw sprite $cc at (3,13) of size (3x2)
    ldx #3                                                            ; 43be: a2 03
    ldy #$0d                                                          ; 43c0: a0 0d
    lda #3                                                            ; 43c2: a9 03
    sta width_in_cells                                                ; 43c4: 85 3c
    lda #2                                                            ; 43c6: a9 02
    sta height_in_cells                                               ; 43c8: 85 3d
    lda #$cc                                                          ; 43ca: a9 cc
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 43cc: 20 57 1f
    ldy #6                                                            ; 43cf: a0 06
    ldx #7                                                            ; 43d1: a2 07
    jsr sub_c3f5c                                                     ; 43d3: 20 5c 3f
    ldx #$0c                                                          ; 43d6: a2 0c
    jsr sub_c3f5c                                                     ; 43d8: 20 5c 3f
; draw sprite $e7 at (12,6)
    lda #$e7                                                          ; 43db: a9 e7
    jsr draw_sprite_a_at_cell_xy                                      ; 43dd: 20 4c 1f
    ldx #$11                                                          ; 43e0: a2 11
    jsr sub_c3f5c                                                     ; 43e2: 20 5c 3f
; draw sprite $e7 at (17,6)
    lda #$e7                                                          ; 43e5: a9 e7
    jsr draw_sprite_a_at_cell_xy                                      ; 43e7: 20 4c 1f
    jsr start_room                                                    ; 43ea: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 43ed: 20 da 12
    and #4                                                            ; 43f0: 29 04
    beq room_3_game_update_loop                                       ; 43f2: f0 f9
    ldx #2                                                            ; 43f4: a2 02
    ldy current_level                                                 ; 43f6: a4 31
    jmp initialise_level_and_room                                     ; 43f8: 4c 40 11

sub_c43fb
    lda #3                                                            ; 43fb: a9 03
    sta currently_updating_logic_for_room_index                       ; 43fd: 8d ba 1a
    ldx #$25 ; '%'                                                    ; 4400: a2 25
    ldy #6                                                            ; 4402: a0 06
    lda #5                                                            ; 4404: a9 05
    jsr update_brazier_and_fire                                       ; 4406: 20 88 19
    lda update_room_first_update_flag                                 ; 4409: ad 2b 13
    beq c444f                                                         ; 440c: f0 41
    ldx #$3e ; '>'                                                    ; 440e: a2 3e
    ldy #$45 ; 'E'                                                    ; 4410: a0 45
    jsr define_envelope                                               ; 4412: 20 5e 39
    lda #$e0                                                          ; 4415: a9 e0
    sta toolbar_collectable_spriteids+1                               ; 4417: 8d e9 2e
    lda #$df                                                          ; 441a: a9 df
    sta collectable_spriteids+1                                       ; 441c: 8d ee 2e
    lda #$e3                                                          ; 441f: a9 e3
    sta five_byte_table_paired_with_collectable_sprite_ids + 1        ; 4421: 8d f3 2e
    lda #$e5                                                          ; 4424: a9 e5
    sta l38af                                                         ; 4426: 8d af 38
    lda #$40 ; '@'                                                    ; 4429: a9 40
    sta l38c5                                                         ; 442b: 8d c5 38
    lda l0a4c                                                         ; 442e: ad 4c 0a
    bne c4475                                                         ; 4431: d0 42
    lda desired_room_index                                            ; 4433: a5 30
    cmp #3                                                            ; 4435: c9 03
    bne c444c                                                         ; 4437: d0 13
    ldx #6                                                            ; 4439: a2 06
    ldy #$0f                                                          ; 443b: a0 0f
    lda #4                                                            ; 443d: a9 04
    jsr set_object_position_from_cell_xy                              ; 443f: 20 5d 1f
    lda #$d2                                                          ; 4442: a9 d2
    sta l38b0                                                         ; 4444: 8d b0 38
    lda #$e8                                                          ; 4447: a9 e8
    sta l09ac                                                         ; 4449: 8d ac 09
c444c
    jmp c4508                                                         ; 444c: 4c 08 45

c444f
    lda l0a4c                                                         ; 444f: ad 4c 0a
    bne c4475                                                         ; 4452: d0 21
    lda desired_room_index                                            ; 4454: a5 30
    cmp #3                                                            ; 4456: c9 03
    bne c4472                                                         ; 4458: d0 18
    ldx #$0b                                                          ; 445a: a2 0b
    ldy #4                                                            ; 445c: a0 04
    jsr test_for_collision_between_objects_x_and_y                    ; 445e: 20 e2 28
    beq c4472                                                         ; 4461: f0 0f
    lda #$ff                                                          ; 4463: a9 ff
    sta l0a4c                                                         ; 4465: 8d 4c 0a
    lda #0                                                            ; 4468: a9 00
    sta l09ac                                                         ; 446a: 8d ac 09
    lda #$e0                                                          ; 446d: a9 e0
    jsr find_or_create_menu_slot_for_A                                ; 446f: 20 bd 2b
c4472
    jmp c4508                                                         ; 4472: 4c 08 45

c4475
    lda #0                                                            ; 4475: a9 00
    sta l09ab                                                         ; 4477: 8d ab 09
    lda #$e0                                                          ; 447a: a9 e0
    cmp player_using_object_spriteid                                  ; 447c: cd b6 2e
    bne c4472                                                         ; 447f: d0 f1
    lda #$e6                                                          ; 4481: a9 e6
    sta object_spriteid+1                                             ; 4483: 8d a9 09
    lda #1                                                            ; 4486: a9 01
    jsr get_solid_rock_collision_for_object_a                         ; 4488: 20 94 28
    beq c4472                                                         ; 448b: f0 e5
    lda object_y_low                                                  ; 448d: ad 7c 09
    cmp l0a51                                                         ; 4490: cd 51 0a
    bcc c44f9                                                         ; 4493: 90 64
    dec temp_right_offset                                             ; 4495: ce d1 24
    ldx #1                                                            ; 4498: a2 01
    ldy #2                                                            ; 449a: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 449c: 20 e2 28
    beq c44f9                                                         ; 449f: f0 58
    lda #$e3                                                          ; 44a1: a9 e3
    sta object_spriteid+1                                             ; 44a3: 8d a9 09
    lda object_x_low+1                                                ; 44a6: ad 51 09
    sta l0953                                                         ; 44a9: 8d 53 09
    lda object_x_high+1                                               ; 44ac: ad 67 09
    sta l0969                                                         ; 44af: 8d 69 09
    lda object_y_low+1                                                ; 44b2: ad 7d 09
    sta l097f                                                         ; 44b5: 8d 7f 09
    lda object_y_high+1                                               ; 44b8: ad 93 09
    sta l0995                                                         ; 44bb: 8d 95 09
    lda object_direction+1                                            ; 44be: ad bf 09
    sta l09c1                                                         ; 44c1: 8d c1 09
    lda #$e4                                                          ; 44c4: a9 e4
    sta l09ab                                                         ; 44c6: 8d ab 09
    inc temp_right_offset                                             ; 44c9: ee d1 24
    dec temp_left_offset                                              ; 44cc: ce d0 24
    inc temp_right_offset                                             ; 44cf: ee d1 24
    lda #1                                                            ; 44d2: a9 01
    jsr get_solid_rock_collision_for_object_a                         ; 44d4: 20 94 28
    beq c4508                                                         ; 44d7: f0 2f
    lda update_room_first_update_flag                                 ; 44d9: ad 2b 13
    bne c4508                                                         ; 44dc: d0 2a
    lda #$e0                                                          ; 44de: a9 e0
    cmp previous_player_using_object_spriteid                         ; 44e0: cd b7 2e
    beq c4508                                                         ; 44e3: f0 23
    lda l0a74                                                         ; 44e5: ad 74 0a
    bne c4508                                                         ; 44e8: d0 1e
    dec l0a74                                                         ; 44ea: ce 74 0a
    lda #0                                                            ; 44ed: a9 00
    ldx #$4c ; 'L'                                                    ; 44ef: a2 4c
    ldy #$45 ; 'E'                                                    ; 44f1: a0 45
    jsr play_sound_yx                                                 ; 44f3: 20 f6 38
    jmp c4508                                                         ; 44f6: 4c 08 45

c44f9
    lda #$e6                                                          ; 44f9: a9 e6
    sta five_byte_table_paired_with_collectable_sprite_ids + 1        ; 44fb: 8d f3 2e
    lda #0                                                            ; 44fe: a9 00
    jsr l25f5                                                         ; 4500: 20 f5 25
    lda #$e3                                                          ; 4503: a9 e3
    sta five_byte_table_paired_with_collectable_sprite_ids + 1        ; 4505: 8d f3 2e
c4508
    rts                                                               ; 4508: 60

    !byte   0,   5,   1,   0,   0,   0,   0,   0,   0, $0a,   0,   0  ; 4509: 00 05 01...
    !byte $d8, $28,   0, $10,   0,   5,   0,   4,   0,   4,   0,   6  ; 4515: d8 28 00...
    !byte   1,   0,   0,   0,   0,   0,   0, $37,   0,   0, $fa, $6e  ; 4521: 01 00 00...
    !byte $37, $10,   0,   6,   0,   7,   0,   1,   0, $11,   0,   0  ; 452d: 37 10 00...
    !byte   0, $d2,   0,   1,   0,   7,   1,   0,   0,   0,   0,   0  ; 4539: 00 d2 00...
    !byte   0, $37,   0, $fe, $fc, $6e,   0,   3,   0,   7,   0, $c8  ; 4545: 00 37 00...
    !byte   0,   1,   0, $88,   8, $0f, $10, $e0                      ; 4551: 00 01 00...
    !text " #", '"', "# "                                             ; 4559: 20 23 22...
    !byte $e0, $10, $0f,   8, $88, $88, $23, $20, $e0, $10, $0f,   8  ; 455e: e0 10 0f...
    !byte $88, $88, $88,   8, $0f, $10, $e0                           ; 456a: 88 88 88...
    !text " #", '"'                                                   ; 4571: 20 23 22
sprite_data
pydis_end

; Automatically generated labels:
;     c3b07
;     c3b11
;     c3c1d
;     c3c54
;     c3c57
;     c3c68
;     c3c77
;     c3c8e
;     c3cb5
;     c3cbf
;     c3cde
;     c3ce5
;     c3d01
;     c3d13
;     c3d38
;     c3d42
;     c3d51
;     c3d5a
;     c3d61
;     c3d66
;     c3ddc
;     c3ddf
;     c3e01
;     c3e16
;     c3e50
;     c3e6e
;     c3e84
;     c3e92
;     c3f28
;     c4034
;     c40b1
;     c40d8
;     c40de
;     c40e6
;     c40f5
;     c40f8
;     c410f
;     c411e
;     c4124
;     c4131
;     c414b
;     c414e
;     c4172
;     c4177
;     c4178
;     c418c
;     c41cd
;     c41ea
;     c41ef
;     c4204
;     c4217
;     c421c
;     c4235
;     c4246
;     c425c
;     c4266
;     c4276
;     c427d
;     c42d1
;     c42e9
;     c42ee
;     c431b
;     c4354
;     c444c
;     c444f
;     c4472
;     c4475
;     c44f9
;     c4508
;     l0070
;     l0078
;     l0079
;     l0952
;     l0953
;     l0957
;     l0968
;     l0969
;     l097e
;     l097f
;     l0980
;     l0981
;     l0983
;     l0986
;     l0994
;     l0995
;     l09aa
;     l09ab
;     l09ac
;     l09ad
;     l09af
;     l09b0
;     l09b1
;     l09b2
;     l09bd
;     l09c1
;     l0a4a
;     l0a4b
;     l0a4c
;     l0a4d
;     l0a4e
;     l0a4f
;     l0a50
;     l0a51
;     l0a52
;     l0a53
;     l0a54
;     l0a6f
;     l0a70
;     l0a71
;     l0a72
;     l0a73
;     l0a74
;     l2434
;     l24d2
;     l25f5
;     l38ae
;     l38af
;     l38b0
;     l38b1
;     l38b3
;     l38b5
;     l38c4
;     l38c5
;     l38c6
;     l38c9
;     l38ca
;     l38cb
;     l3970
;     l3acc
;     l3bba
;     l3bf2
;     l3d39
;     l4041
;     l42ef
;     loop_c3d79
;     loop_c3d96
;     loop_c3db6
;     loop_c40c5
;     sub_c3bf7
;     sub_c3d3a
;     sub_c3e85
;     sub_c3f35
;     sub_c3f4a
;     sub_c3f5c
;     sub_c4058
;     sub_c417b
;     sub_c42f0
;     sub_c430e
;     sub_c43fb
!if (level_specific_initialisation) != $3af7 {
    !error "Assertion failed: level_specific_initialisation == $3af7"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b1a {
    !error "Assertion failed: level_specific_update == $3b1a"
}
!if (room_0_data) != $3b2f {
    !error "Assertion failed: room_0_data == $3b2f"
}
!if (room_1_data) != $3e93 {
    !error "Assertion failed: room_1_data == $3e93"
}
!if (room_2_data) != $3f72 {
    !error "Assertion failed: room_2_data == $3f72"
}
!if (room_3_data) != $4355 {
    !error "Assertion failed: room_3_data == $4355"
}
!if (sprite_data - level_data) != $0a9f {
    !error "Assertion failed: sprite_data - level_data == $0a9f"
}
