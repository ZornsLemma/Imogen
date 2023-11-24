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
l0015                                               = $15
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
room_exit_direction                                 = $70
l0078                                               = $78
l0079                                               = $79
show_dialog_box                                     = $040a
remove_dialog                                       = $0453
object_x_low                                        = $0950
l0952                                               = $0952
l0953                                               = $0953
l0955                                               = $0955
l0956                                               = $0956
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
l0982                                               = $0982
l0983                                               = $0983
object_y_low_old                                    = $0987
object_y_high                                       = $0992
object_y_high_old                                   = $099d
object_spriteid                                     = $09a8
l09aa                                               = $09aa
l09ab                                               = $09ab
l09ac                                               = $09ac
l09ad                                               = $09ad
l09ae                                               = $09ae
l09af                                               = $09af
object_spriteid_old                                 = $09b3
l09b5                                               = $09b5
l09b6                                               = $09b6
l09b7                                               = $09b7
l09b8                                               = $09b8
object_direction                                    = $09be
l09c0                                               = $09c0
l09c3                                               = $09c3
object_direction_old                                = $09c9
level_progress_table                                = $09ef
l0a33                                               = $0a33
l0a34                                               = $0a34
l0a35                                               = $0a35
l0a36                                               = $0a36
l0a37                                               = $0a37
l0a38                                               = $0a38
l0a6f                                               = $0a6f
l0a70                                               = $0a70
l0a71                                               = $0a71
l0a72                                               = $0a72
l0a73                                               = $0a73
l0a74                                               = $0a74
l0a75                                               = $0a75
l0a76                                               = $0a76
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
l20f7                                               = $20f7
play_landing_sound                                  = $23a9
player_wall_collision_flag                          = $2433
l2434                                               = $2434
temp_left_offset                                    = $24d0
temp_right_offset                                   = $24d1
temp_top_offset                                     = $2550
temp_bottom_offset                                  = $2551
get_solid_rock_collision_for_object_a               = $2894
temp_default_collision_map_option                   = $28e1
test_for_collision_between_objects_x_and_y          = $28e2
l295c                                               = $295c
l296e                                               = $296e
insert_character_menu_item_into_toolbar             = $2b87
find_or_create_menu_slot_for_A                      = $2bbd
remove_item_from_toolbar_menu                       = $2be0
player_using_object_spriteid                        = $2eb6
previous_player_using_object_spriteid               = $2eb7
toolbar_collectable_spriteids                       = $2ee8
collectable_spriteids                               = $2eed
five_byte_table_paired_with_collectable_sprite_ids  = $2ef2
l2ef4                                               = $2ef4
inhibit_monkey_climb_flag                           = $31d7
print_encrypted_string_at_yx_centred                = $37f3
wait_one_second_then_check_keys                     = $388d
object_sprite_mask_type                             = $38ac
l38ae                                               = $38ae
l38af                                               = $38af
l38b2                                               = $38b2
object_z_order                                      = $38c2
l38c4                                               = $38c4
l38c5                                               = $38c5
l38c6                                               = $38c6
l38c7                                               = $38c7
l38c8                                               = $38c8
object_room_collision_flags                         = $38d8
play_sound_yx                                       = $38f6
define_envelope                                     = $395e
sound_priority_per_channel_table                    = $396f
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
    !word sprite_data - level_data                                    ; 3ad5: 58 0a                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f6 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 2a 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
    !byte 1, 0                                                        ; 3add: 01 00
level_room_data_table
    !word room_0_data                                                 ; 3adf: 96 3f                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: 28 43
    !word room_2_data                                                 ; 3ae3: 60 3b
    !word room_3_data                                                 ; 3ae5: cc 3e

; *************************************************************************************
; 'DRIPPING-STUFF[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $8f, $99, $82, $9b, $9b, $82, $85, $8c, $e6, $98, $9f, $9e  ; 3ae7: 8f 99 82...
    !byte $8d, $8d, $c6                                               ; 3af3: 8d 8d c6

; *************************************************************************************
; 
; Level initialisation
; 
; This is called whenever a new room is entered.
; 
; *************************************************************************************
level_specific_initialisation
    lda current_level                                                 ; 3af6: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3af8: c5 51
    beq c3b21                                                         ; 3afa: f0 25
    lda developer_flags                                               ; 3afc: ad 03 11
    bpl c3b0b                                                         ; 3aff: 10 0a
    lda #$ff                                                          ; 3b01: a9 ff
    sta l0a35                                                         ; 3b03: 8d 35 0a
    lda #$ff                                                          ; 3b06: a9 ff
    sta l0a36                                                         ; 3b08: 8d 36 0a
c3b0b
    lda l0a35                                                         ; 3b0b: ad 35 0a
    beq c3b21                                                         ; 3b0e: f0 11
    cmp #$ff                                                          ; 3b10: c9 ff
    beq c3b1c                                                         ; 3b12: f0 08
    lda #$d6                                                          ; 3b14: a9 d6
    jsr find_or_create_menu_slot_for_A                                ; 3b16: 20 bd 2b
    jmp c3b21                                                         ; 3b19: 4c 21 3b

c3b1c
    lda #$d7                                                          ; 3b1c: a9 d7
    jsr find_or_create_menu_slot_for_A                                ; 3b1e: 20 bd 2b
c3b21
    lda #$0d                                                          ; 3b21: a9 0d
    sta source_sprite_memory_low                                      ; 3b23: 85 40
    lda #$45 ; 'E'                                                    ; 3b25: a9 45
    sta source_sprite_memory_high                                     ; 3b27: 85 41
    rts                                                               ; 3b29: 60

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
    jsr sub_c419f                                                     ; 3b2a: 20 9f 41
    jsr sub_c43a4                                                     ; 3b2d: 20 a4 43
    jsr sub_c3f56                                                     ; 3b30: 20 56 3f
    jsr sub_c3bd9                                                     ; 3b33: 20 d9 3b
    jsr sub_c4044                                                     ; 3b36: 20 44 40
    rts                                                               ; 3b39: 60

sub_c3b3a
    ldx #0                                                            ; 3b3a: a2 00
    ldy #0                                                            ; 3b3c: a0 00
    lda #$ff                                                          ; 3b3e: a9 ff
    sta width_in_cells                                                ; 3b40: 85 3c
    lda #2                                                            ; 3b42: a9 02
    sta height_in_cells                                               ; 3b44: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b46: 20 bb 1a
    ldy #$16                                                          ; 3b49: a0 16
    jmp copy_rectangle_of_memory_to_screen                            ; 3b4b: 4c bb 1a

sub_c3b4e
    ldx #3                                                            ; 3b4e: a2 03
    ldy #2                                                            ; 3b50: a0 02
    lda #1                                                            ; 3b52: a9 01
    sta width_in_cells                                                ; 3b54: 85 3c
    sta height_in_cells                                               ; 3b56: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b58: 20 bb 1a
    ldx #$24 ; '$'                                                    ; 3b5b: a2 24
    jmp copy_rectangle_of_memory_to_screen                            ; 3b5d: 4c bb 1a

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 14                                                          ; 3b60: 0e                      ; initial player X cell
    !byte 22                                                          ; 3b61: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####
; ###
; ###
; ###
; ###
; #################       ################
; #################       ################
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ######                            ######
; ######                            ######
; 
; 
; 
; 
;               P
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_2_code
    jsr sub_c3b3a                                                     ; 3b62: 20 3a 3b
; draw 3x15 rectangle at (0,2)
    ldy #2                                                            ; 3b65: a0 02
    lda #3                                                            ; 3b67: a9 03
    sta width_in_cells                                                ; 3b69: 85 3c
    lda #$0f                                                          ; 3b6b: a9 0f
    sta height_in_cells                                               ; 3b6d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b6f: 20 bb 1a
; draw 3x10 rectangle at (37,7)
    ldx #$25 ; '%'                                                    ; 3b72: a2 25
    ldy #7                                                            ; 3b74: a0 07
    lda #$0a                                                          ; 3b76: a9 0a
    sta height_in_cells                                               ; 3b78: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b7a: 20 bb 1a
; draw 14x2 rectangle at (3,7)
    ldx #3                                                            ; 3b7d: a2 03
    lda #$0e                                                          ; 3b7f: a9 0e
    sta width_in_cells                                                ; 3b81: 85 3c
    lda #2                                                            ; 3b83: a9 02
    sta height_in_cells                                               ; 3b85: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b87: 20 bb 1a
; draw 13x2 rectangle at (24,7)
    ldx #$18                                                          ; 3b8a: a2 18
    dec width_in_cells                                                ; 3b8c: c6 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b8e: 20 bb 1a
; draw 3x2 rectangle at (3,15)
    ldx #3                                                            ; 3b91: a2 03
    ldy #$0f                                                          ; 3b93: a0 0f
    lda #3                                                            ; 3b95: a9 03
    sta width_in_cells                                                ; 3b97: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b99: 20 bb 1a
; draw 3x2 rectangle at (34,15)
    ldx #$22 ; '"'                                                    ; 3b9c: a2 22
    jsr copy_rectangle_of_memory_to_screen                            ; 3b9e: 20 bb 1a
; draw 1x1 rectangle at (3,2)
    ldx #3                                                            ; 3ba1: a2 03
    ldy #2                                                            ; 3ba3: a0 02
    lda #1                                                            ; 3ba5: a9 01
    sta width_in_cells                                                ; 3ba7: 85 3c
    sta height_in_cells                                               ; 3ba9: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3bab: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3bae: 20 90 1b
    jsr start_room                                                    ; 3bb1: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 3bb4: 20 da 12
    sta room_exit_direction                                           ; 3bb7: 85 70
    and #exit_room_left                                               ; 3bb9: 29 01
    beq room_2_check_right_exit                                       ; 3bbb: f0 07
    ldx #1                                                            ; 3bbd: a2 01
    ldy current_level                                                 ; 3bbf: a4 31
    jmp initialise_level_and_room                                     ; 3bc1: 4c 40 11

room_2_check_right_exit
    lda room_exit_direction                                           ; 3bc4: a5 70
    and #exit_room_right                                              ; 3bc6: 29 04
    beq room_2_game_update_loop                                       ; 3bc8: f0 ea
    ldx #3                                                            ; 3bca: a2 03
    ldy current_level                                                 ; 3bcc: a4 31
    jmp initialise_level_and_room                                     ; 3bce: 4c 40 11

l3bd1
    !byte $d0, $cf, $ce                                               ; 3bd1: d0 cf ce
l3bd4
    !byte $cd                                                         ; 3bd4: cd
l3bd5
    !byte $e3, $e2, $e1                                               ; 3bd5: e3 e2 e1
l3bd8
    !byte $e0                                                         ; 3bd8: e0

sub_c3bd9
    lda #2                                                            ; 3bd9: a9 02
    sta currently_updating_logic_for_room_index                       ; 3bdb: 8d ba 1a
    ldx #3                                                            ; 3bde: a2 03
    ldy #$0c                                                          ; 3be0: a0 0c
    lda #6                                                            ; 3be2: a9 06
    jsr update_brazier_and_fire                                       ; 3be4: 20 88 19
    ldx #$25 ; '%'                                                    ; 3be7: a2 25
    lda #7                                                            ; 3be9: a9 07
    jsr update_brazier_and_fire                                       ; 3beb: 20 88 19
    lda update_room_first_update_flag                                 ; 3bee: ad 2b 13
    bne c3bf6                                                         ; 3bf1: d0 03
    jmp c3d0d                                                         ; 3bf3: 4c 0d 3d

c3bf6
    lda current_level                                                 ; 3bf6: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3bf8: c5 51
    beq c3c2f                                                         ; 3bfa: f0 33
    lda l0a33                                                         ; 3bfc: ad 33 0a
    bne c3c0d                                                         ; 3bff: d0 0c
    lda #$70 ; 'p'                                                    ; 3c01: a9 70
    sta l0a33                                                         ; 3c03: 8d 33 0a
    lda #0                                                            ; 3c06: a9 00
    sta l0a34                                                         ; 3c08: 8d 34 0a
    beq c3c2f                                                         ; 3c0b: f0 22
c3c0d
    lda l0a34                                                         ; 3c0d: ad 34 0a
    bmi c3c25                                                         ; 3c10: 30 13
    beq c3c2f                                                         ; 3c12: f0 1b
    lda #0                                                            ; 3c14: a9 00
    sta l0a34                                                         ; 3c16: 8d 34 0a
    lda l0a33                                                         ; 3c19: ad 33 0a
    sec                                                               ; 3c1c: 38
    sbc #$20 ; ' '                                                    ; 3c1d: e9 20
    sta l0a33                                                         ; 3c1f: 8d 33 0a
    jmp c3c2f                                                         ; 3c22: 4c 2f 3c

c3c25
    lda #$10                                                          ; 3c25: a9 10
    sta l0a33                                                         ; 3c27: 8d 33 0a
    lda #$80                                                          ; 3c2a: a9 80
    sta l0a34                                                         ; 3c2c: 8d 34 0a
c3c2f
    lda desired_room_index                                            ; 3c2f: a5 30
    cmp #2                                                            ; 3c31: c9 02
    beq c3c38                                                         ; 3c33: f0 03
    jmp c3ccd                                                         ; 3c35: 4c cd 3c

c3c38
    ldy #$10                                                          ; 3c38: a0 10
    lda l0a34                                                         ; 3c3a: ad 34 0a
    bmi c3c59                                                         ; 3c3d: 30 1a
    ldy l0a33                                                         ; 3c3f: ac 33 0a
    sec                                                               ; 3c42: 38
    sbc #4                                                            ; 3c43: e9 04
    bcc c3c59                                                         ; 3c45: 90 12
    asl                                                               ; 3c47: 0a
    sta l0070                                                         ; 3c48: 85 70
    cmp #$20 ; ' '                                                    ; 3c4a: c9 20
    bcc c3c52                                                         ; 3c4c: 90 04
    lda #$20 ; ' '                                                    ; 3c4e: a9 20
    sta l0070                                                         ; 3c50: 85 70
c3c52
    lda l0a33                                                         ; 3c52: ad 33 0a
    sec                                                               ; 3c55: 38
    sbc l0070                                                         ; 3c56: e5 70
    tay                                                               ; 3c58: a8
c3c59
    ldx #$14                                                          ; 3c59: a2 14
    lda #1                                                            ; 3c5b: a9 01
    sta width_in_cells                                                ; 3c5d: 85 3c
    sta height_in_cells                                               ; 3c5f: 85 3d
    lda #2                                                            ; 3c61: a9 02
    sta value_to_write_to_collision_map                               ; 3c63: 85 3e
    tya                                                               ; 3c65: 98
    pha                                                               ; 3c66: 48
    lsr                                                               ; 3c67: 4a
    lsr                                                               ; 3c68: 4a
    lsr                                                               ; 3c69: 4a
    tay                                                               ; 3c6a: a8
    dey                                                               ; 3c6b: 88
    lda #3                                                            ; 3c6c: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3c6e: 20 bb 1e
    iny                                                               ; 3c71: c8
    pla                                                               ; 3c72: 68
    and #7                                                            ; 3c73: 29 07
    sta temp_sprite_y_offset                                          ; 3c75: 85 3b
    lda #$ca                                                          ; 3c77: a9 ca
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3c79: 20 57 1f
    ldx #3                                                            ; 3c7c: a2 03
    jsr set_object_position_from_current_sprite_position              ; 3c7e: 20 6d 1f
    ldx #$14                                                          ; 3c81: a2 14
    iny                                                               ; 3c83: c8
    lda #$c8                                                          ; 3c84: a9 c8
loop_c3c86
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3c86: 20 57 1f
    iny                                                               ; 3c89: c8
    cpy #$15                                                          ; 3c8a: c0 15
    bcc loop_c3c86                                                    ; 3c8c: 90 f8
    lda #$c9                                                          ; 3c8e: a9 c9
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3c90: 20 57 1f
    lda l0a33                                                         ; 3c93: ad 33 0a
    lsr                                                               ; 3c96: 4a
    lsr                                                               ; 3c97: 4a
    lsr                                                               ; 3c98: 4a
    tay                                                               ; 3c99: a8
    lda l3bd4                                                         ; 3c9a: ad d4 3b
    sta l3d08                                                         ; 3c9d: 8d 08 3d
    lda l0a34                                                         ; 3ca0: ad 34 0a
    bpl c3cbb                                                         ; 3ca3: 10 16
    tya                                                               ; 3ca5: 98
    sec                                                               ; 3ca6: 38
    sbc #4                                                            ; 3ca7: e9 04
    ldy #2                                                            ; 3ca9: a0 02
    jsr sub_c3cd0                                                     ; 3cab: 20 d0 3c
    lda l0a33                                                         ; 3cae: ad 33 0a
    lsr                                                               ; 3cb1: 4a
    lsr                                                               ; 3cb2: 4a
    lsr                                                               ; 3cb3: 4a
    tay                                                               ; 3cb4: a8
    lda l3bd8                                                         ; 3cb5: ad d8 3b
    sta l3d08                                                         ; 3cb8: 8d 08 3d
c3cbb
    lda #$12                                                          ; 3cbb: a9 12
    jsr sub_c3cd0                                                     ; 3cbd: 20 d0 3c
    lda #$e0                                                          ; 3cc0: a9 e0
    sta l38c6                                                         ; 3cc2: 8d c6 38
    sta l38c7                                                         ; 3cc5: 8d c7 38
    lda #$ff                                                          ; 3cc8: a9 ff
    sta l09c3                                                         ; 3cca: 8d c3 09
c3ccd
    jmp c3db6                                                         ; 3ccd: 4c b6 3d

sub_c3cd0
    sta l3d09                                                         ; 3cd0: 8d 09 3d
    sty l0070                                                         ; 3cd3: 84 70
    sec                                                               ; 3cd5: 38
    sbc l0070                                                         ; 3cd6: e5 70
    bmi c3d07                                                         ; 3cd8: 30 2d
    beq c3d07                                                         ; 3cda: f0 2b
c3cdc
    ldx #$14                                                          ; 3cdc: a2 14
    iny                                                               ; 3cde: c8
    lda l3d08                                                         ; 3cdf: ad 08 3d
    jsr draw_sprite_a_at_cell_xy                                      ; 3ce2: 20 4c 1f
    ldx #4                                                            ; 3ce5: a2 04
    jsr set_object_position_from_current_sprite_position              ; 3ce7: 20 6d 1f
    ldx #$15                                                          ; 3cea: a2 15
    lda #$ff                                                          ; 3cec: a9 ff
    sta temp_sprite_x_offset                                          ; 3cee: 85 3a
    iny                                                               ; 3cf0: c8
    iny                                                               ; 3cf1: c8
    lda #$ff                                                          ; 3cf2: a9 ff
    sta sprite_reflect_flag                                           ; 3cf4: 85 1d
    lda l3d08                                                         ; 3cf6: ad 08 3d
    jsr draw_sprite_a_at_cell_xy                                      ; 3cf9: 20 4c 1f
    ldx #5                                                            ; 3cfc: a2 05
    jsr set_object_position_from_current_sprite_position              ; 3cfe: 20 6d 1f
    iny                                                               ; 3d01: c8
    cpy l3d09                                                         ; 3d02: cc 09 3d
    bcc c3cdc                                                         ; 3d05: 90 d5
c3d07
    rts                                                               ; 3d07: 60

l3d08
    !byte 0                                                           ; 3d08: 00
l3d09
    !byte 0                                                           ; 3d09: 00

c3d0a
    jmp c3db6                                                         ; 3d0a: 4c b6 3d

c3d0d
    lda l0a34                                                         ; 3d0d: ad 34 0a
    bne c3d63                                                         ; 3d10: d0 51
    lda desired_room_index                                            ; 3d12: a5 30
    cmp #2                                                            ; 3d14: c9 02
    bne c3d0a                                                         ; 3d16: d0 f2
    lda developer_flags                                               ; 3d18: ad 03 11
    bpl c3d2b                                                         ; 3d1b: 10 0e
    ldx #$ac                                                          ; 3d1d: a2 ac
    jsr l3acc                                                         ; 3d1f: 20 cc 3a
    bne c3d48                                                         ; 3d22: d0 24
    ldx #$c8                                                          ; 3d24: a2 c8
    jsr l3acc                                                         ; 3d26: 20 cc 3a
    bne c3d52                                                         ; 3d29: d0 27
c3d2b
    lda l09aa                                                         ; 3d2b: ad aa 09
    cmp #$d9                                                          ; 3d2e: c9 d9
    bne c3d0a                                                         ; 3d30: d0 d8
    ldx #2                                                            ; 3d32: a2 02
    jsr l2434                                                         ; 3d34: 20 34 24
    lda l0078                                                         ; 3d37: a5 78
    cmp #$15                                                          ; 3d39: c9 15
    bcs c3d0a                                                         ; 3d3b: b0 cd
    lda l0079                                                         ; 3d3d: a5 79
    cmp #$14                                                          ; 3d3f: c9 14
    bcc c3d0a                                                         ; 3d41: 90 c7
    lda l0a36                                                         ; 3d43: ad 36 0a
    bne c3d52                                                         ; 3d46: d0 0a
c3d48
    lda l0a33                                                         ; 3d48: ad 33 0a
    cmp #$10                                                          ; 3d4b: c9 10
    beq c3db6                                                         ; 3d4d: f0 67
    jmp c3d63                                                         ; 3d4f: 4c 63 3d

c3d52
    lda l0a33                                                         ; 3d52: ad 33 0a
    cmp #$10                                                          ; 3d55: c9 10
    bne c3db6                                                         ; 3d57: d0 5d
    lda #$90                                                          ; 3d59: a9 90
    sta l0a33                                                         ; 3d5b: 8d 33 0a
    lda #$80                                                          ; 3d5e: a9 80
    sta l0a34                                                         ; 3d60: 8d 34 0a
c3d63
    lda l0a34                                                         ; 3d63: ad 34 0a
    bmi c3d8d                                                         ; 3d66: 30 25
    lda l0a34                                                         ; 3d68: ad 34 0a
    cmp #$0f                                                          ; 3d6b: c9 0f
    bcc c3d73                                                         ; 3d6d: 90 04
    cmp #$15                                                          ; 3d6f: c9 15
    bcs c3d7c                                                         ; 3d71: b0 09
c3d73
    clc                                                               ; 3d73: 18
    adc #1                                                            ; 3d74: 69 01
    sta l0a34                                                         ; 3d76: 8d 34 0a
    jmp c3db6                                                         ; 3d79: 4c b6 3d

c3d7c
    lda #0                                                            ; 3d7c: a9 00
    sta l0a34                                                         ; 3d7e: 8d 34 0a
    lda l0a33                                                         ; 3d81: ad 33 0a
    sec                                                               ; 3d84: 38
    sbc #$20 ; ' '                                                    ; 3d85: e9 20
    sta l0a33                                                         ; 3d87: 8d 33 0a
    jmp c3db6                                                         ; 3d8a: 4c b6 3d

c3d8d
    lda l0a33                                                         ; 3d8d: ad 33 0a
    cmp #$10                                                          ; 3d90: c9 10
    beq c3db6                                                         ; 3d92: f0 22
    lda l0a34                                                         ; 3d94: ad 34 0a
    cmp #$8f                                                          ; 3d97: c9 8f
    bcc c3d9f                                                         ; 3d99: 90 04
    cmp #$8f                                                          ; 3d9b: c9 8f
    bcs c3da8                                                         ; 3d9d: b0 09
c3d9f
    clc                                                               ; 3d9f: 18
    adc #1                                                            ; 3da0: 69 01
    sta l0a34                                                         ; 3da2: 8d 34 0a
    jmp c3db6                                                         ; 3da5: 4c b6 3d

c3da8
    lda #$80                                                          ; 3da8: a9 80
    sta l0a34                                                         ; 3daa: 8d 34 0a
    lda l0a33                                                         ; 3dad: ad 33 0a
    sec                                                               ; 3db0: 38
    sbc #$20 ; ' '                                                    ; 3db1: e9 20
    sta l0a33                                                         ; 3db3: 8d 33 0a
c3db6
    lda desired_room_index                                            ; 3db6: a5 30
    cmp #2                                                            ; 3db8: c9 02
    bne c3e07                                                         ; 3dba: d0 4b
    ldy #$10                                                          ; 3dbc: a0 10
    lda l0a34                                                         ; 3dbe: ad 34 0a
    bmi c3ddd                                                         ; 3dc1: 30 1a
    ldy l0a33                                                         ; 3dc3: ac 33 0a
    sec                                                               ; 3dc6: 38
    sbc #4                                                            ; 3dc7: e9 04
    bcc c3ddd                                                         ; 3dc9: 90 12
    asl                                                               ; 3dcb: 0a
    sta l0070                                                         ; 3dcc: 85 70
    cmp #$20 ; ' '                                                    ; 3dce: c9 20
    bcc c3dd6                                                         ; 3dd0: 90 04
    lda #$20 ; ' '                                                    ; 3dd2: a9 20
    sta l0070                                                         ; 3dd4: 85 70
c3dd6
    lda l0a33                                                         ; 3dd6: ad 33 0a
    sec                                                               ; 3dd9: 38
    sbc l0070                                                         ; 3dda: e5 70
    tay                                                               ; 3ddc: a8
c3ddd
    lda #0                                                            ; 3ddd: a9 00
    sta l09b6                                                         ; 3ddf: 8d b6 09
    sta l09ab                                                         ; 3de2: 8d ab 09
    cpy l097f                                                         ; 3de5: cc 7f 09
    beq c3e0a                                                         ; 3de8: f0 20
    sty l097f                                                         ; 3dea: 8c 7f 09
    ldx #$14                                                          ; 3ded: a2 14
    tya                                                               ; 3def: 98
    lsr                                                               ; 3df0: 4a
    lsr                                                               ; 3df1: 4a
    lsr                                                               ; 3df2: 4a
    tay                                                               ; 3df3: a8
    lda #2                                                            ; 3df4: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3df6: 20 bb 1e
    dey                                                               ; 3df9: 88
    lda #3                                                            ; 3dfa: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3dfc: 20 bb 1e
    lda #$cb                                                          ; 3dff: a9 cb
    sta l09ab                                                         ; 3e01: 8d ab 09
    jmp c3e0a                                                         ; 3e04: 4c 0a 3e

c3e07
    jmp c3ecb                                                         ; 3e07: 4c cb 3e

c3e0a
    lda l0a33                                                         ; 3e0a: ad 33 0a
    cmp #$10                                                          ; 3e0d: c9 10
    bne c3e22                                                         ; 3e0f: d0 11
    lda #0                                                            ; 3e11: a9 00
    sta l09b7                                                         ; 3e13: 8d b7 09
    sta l09b8                                                         ; 3e16: 8d b8 09
    sta l09ac                                                         ; 3e19: 8d ac 09
    sta l09ad                                                         ; 3e1c: 8d ad 09
    jmp c3ecb                                                         ; 3e1f: 4c cb 3e

c3e22
    lda l0a33                                                         ; 3e22: ad 33 0a
    sec                                                               ; 3e25: 38
    sbc #$18                                                          ; 3e26: e9 18
    sta l0980                                                         ; 3e28: 8d 80 09
    lda l0a33                                                         ; 3e2b: ad 33 0a
    sec                                                               ; 3e2e: 38
    sbc #8                                                            ; 3e2f: e9 08
    sta l0981                                                         ; 3e31: 8d 81 09
    lda l0a34                                                         ; 3e34: ad 34 0a
    bmi c3e78                                                         ; 3e37: 30 3f
    bne c3e43                                                         ; 3e39: d0 08
    lda #0                                                            ; 3e3b: a9 00
    sta l09b7                                                         ; 3e3d: 8d b7 09
    sta l09b8                                                         ; 3e40: 8d b8 09
c3e43
    lda #0                                                            ; 3e43: a9 00
    sta l09ac                                                         ; 3e45: 8d ac 09
    sta l09ad                                                         ; 3e48: 8d ad 09
    lda l0a34                                                         ; 3e4b: ad 34 0a
    sec                                                               ; 3e4e: 38
    sbc #$0a                                                          ; 3e4f: e9 0a
    bcc c3e07                                                         ; 3e51: 90 b4
    ldy #3                                                            ; 3e53: a0 03
    cmp #4                                                            ; 3e55: c9 04
    bcs c3e5a                                                         ; 3e57: b0 01
    tay                                                               ; 3e59: a8
c3e5a
    lda l3bd1,y                                                       ; 3e5a: b9 d1 3b
    sta l09ad                                                         ; 3e5d: 8d ad 09
    lda l0a34                                                         ; 3e60: ad 34 0a
    sec                                                               ; 3e63: 38
    sbc #$12                                                          ; 3e64: e9 12
    bcc c3ecb                                                         ; 3e66: 90 63
    ldy #3                                                            ; 3e68: a0 03
    cmp #4                                                            ; 3e6a: c9 04
    bcs c3e6f                                                         ; 3e6c: b0 01
    tay                                                               ; 3e6e: a8
c3e6f
    lda l3bd1,y                                                       ; 3e6f: b9 d1 3b
    sta l09ac                                                         ; 3e72: 8d ac 09
    jmp c3ecb                                                         ; 3e75: 4c cb 3e

c3e78
    and #$7f                                                          ; 3e78: 29 7f
    bne c3e94                                                         ; 3e7a: d0 18
    lda update_room_first_update_flag                                 ; 3e7c: ad 2b 13
    bne c3e94                                                         ; 3e7f: d0 13
    ldx #5                                                            ; 3e81: a2 05
    jsr l20f7                                                         ; 3e83: 20 f7 20
    ldx #4                                                            ; 3e86: a2 04
    jsr l20f7                                                         ; 3e88: 20 f7 20
    lda l3bd4                                                         ; 3e8b: ad d4 3b
    sta l09b7                                                         ; 3e8e: 8d b7 09
    sta l09b8                                                         ; 3e91: 8d b8 09
c3e94
    lda l3bd4                                                         ; 3e94: ad d4 3b
    sta l09ac                                                         ; 3e97: 8d ac 09
    sta l09ad                                                         ; 3e9a: 8d ad 09
    lda l0a34                                                         ; 3e9d: ad 34 0a
    and #$7f                                                          ; 3ea0: 29 7f
    sec                                                               ; 3ea2: 38
    sbc #4                                                            ; 3ea3: e9 04
    bcc c3ecb                                                         ; 3ea5: 90 24
    ldy #3                                                            ; 3ea7: a0 03
    cmp #4                                                            ; 3ea9: c9 04
    bcs c3eae                                                         ; 3eab: b0 01
    tay                                                               ; 3ead: a8
c3eae
    lda l3bd5,y                                                       ; 3eae: b9 d5 3b
    sta l09ad                                                         ; 3eb1: 8d ad 09
    lda l0a34                                                         ; 3eb4: ad 34 0a
    and #$7f                                                          ; 3eb7: 29 7f
    sec                                                               ; 3eb9: 38
    sbc #$0c                                                          ; 3eba: e9 0c
    bcc c3ecb                                                         ; 3ebc: 90 0d
    ldy #3                                                            ; 3ebe: a0 03
    cmp #4                                                            ; 3ec0: c9 04
    bcs c3ec5                                                         ; 3ec2: b0 01
    tay                                                               ; 3ec4: a8
c3ec5
    lda l3bd5,y                                                       ; 3ec5: b9 d5 3b
    sta l09ac                                                         ; 3ec8: 8d ac 09
c3ecb
    rts                                                               ; 3ecb: 60

; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 20                                                          ; 3ecc: 14                      ; initial player X cell
    !byte 22                                                          ; 3ecd: 16                      ; initial player Y cell

; ########################################
; ########################################
;                                     ####
;                                      ###
;                                      ###
;                                      ###
;                                      ###
; ####################              S  S##
; ####################                 ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ######              ####################
; ######              ####################
;                                      ###
;                                      ###
;                                      ###
;                                      ###
;                     P                ###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_3_code
    jsr sub_c3b3a                                                     ; 3ece: 20 3a 3b
; draw 255x20 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3ed1: a2 25
    ldy #2                                                            ; 3ed3: a0 02
    lda #$14                                                          ; 3ed5: a9 14
    sta height_in_cells                                               ; 3ed7: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ed9: 20 bb 1a
; draw 3x10 rectangle at (0,7)
    ldx #0                                                            ; 3edc: a2 00
    ldy #7                                                            ; 3ede: a0 07
    lda #3                                                            ; 3ee0: a9 03
    sta width_in_cells                                                ; 3ee2: 85 3c
    lda #$0a                                                          ; 3ee4: a9 0a
    sta height_in_cells                                               ; 3ee6: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ee8: 20 bb 1a
; draw 17x2 rectangle at (3,7)
    ldx #3                                                            ; 3eeb: a2 03
    ldy #7                                                            ; 3eed: a0 07
    lda #$11                                                          ; 3eef: a9 11
    sta width_in_cells                                                ; 3ef1: 85 3c
    lda #2                                                            ; 3ef3: a9 02
    sta height_in_cells                                               ; 3ef5: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ef7: 20 bb 1a
; draw 17x2 rectangle at (20,15)
    ldx #$14                                                          ; 3efa: a2 14
    ldy #$0f                                                          ; 3efc: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3efe: 20 bb 1a
; draw 3x2 rectangle at (3,15)
    ldx #3                                                            ; 3f01: a2 03
    lda #3                                                            ; 3f03: a9 03
    sta width_in_cells                                                ; 3f05: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3f07: 20 bb 1a
; draw 1x1 rectangle at (36,2)
    ldx #$24 ; '$'                                                    ; 3f0a: a2 24
    ldy #2                                                            ; 3f0c: a0 02
    lda #1                                                            ; 3f0e: a9 01
    sta width_in_cells                                                ; 3f10: 85 3c
    sta height_in_cells                                               ; 3f12: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f14: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3f17: 20 90 1b
; draw sprite $e5 at (37,7)
    ldx #$25 ; '%'                                                    ; 3f1a: a2 25
    ldy #7                                                            ; 3f1c: a0 07
    lda #4                                                            ; 3f1e: a9 04
    sta temp_sprite_y_offset                                          ; 3f20: 85 3b
    lda #$ff                                                          ; 3f22: a9 ff
    sta sprite_reflect_flag                                           ; 3f24: 85 1d
    lda #$e5                                                          ; 3f26: a9 e5
    jsr draw_sprite_a_at_cell_xy                                      ; 3f28: 20 4c 1f
; draw sprite $e6 at (37,7)
    lda #4                                                            ; 3f2b: a9 04
    sta temp_sprite_y_offset                                          ; 3f2d: 85 3b
    lda #$ff                                                          ; 3f2f: a9 ff
    sta sprite_reflect_flag                                           ; 3f31: 85 1d
    lda #$e6                                                          ; 3f33: a9 e6
    jsr draw_sprite_a_at_cell_xy                                      ; 3f35: 20 4c 1f
; draw sprite $cc at (34,7)
    ldx #$22 ; '"'                                                    ; 3f38: a2 22
    lda #4                                                            ; 3f3a: a9 04
    sta temp_sprite_x_offset                                          ; 3f3c: 85 3a
    sta temp_sprite_y_offset                                          ; 3f3e: 85 3b
    lda #$cc                                                          ; 3f40: a9 cc
    jsr draw_sprite_a_at_cell_xy                                      ; 3f42: 20 4c 1f
    jsr start_room                                                    ; 3f45: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 3f48: 20 da 12
    and #exit_room_left                                               ; 3f4b: 29 01
    beq room_3_game_update_loop                                       ; 3f4d: f0 f9
    ldx #2                                                            ; 3f4f: a2 02
    ldy current_level                                                 ; 3f51: a4 31
    jmp initialise_level_and_room                                     ; 3f53: 4c 40 11

sub_c3f56
    lda #3                                                            ; 3f56: a9 03
    sta currently_updating_logic_for_room_index                       ; 3f58: 8d ba 1a
    ldx #3                                                            ; 3f5b: a2 03
    ldy #$0c                                                          ; 3f5d: a0 0c
    lda #4                                                            ; 3f5f: a9 04
    jsr update_brazier_and_fire                                       ; 3f61: 20 88 19
    lda #$ff                                                          ; 3f64: a9 ff
    sta l44ec                                                         ; 3f66: 8d ec 44
    lda #8                                                            ; 3f69: a9 08
    sta l44eb                                                         ; 3f6b: 8d eb 44
    lda #$40 ; '@'                                                    ; 3f6e: a9 40
    sta l44ed                                                         ; 3f70: 8d ed 44
    lda #$13                                                          ; 3f73: a9 13
    sta l44ee                                                         ; 3f75: 8d ee 44
    ldx #$10                                                          ; 3f78: a2 10
    ldy #1                                                            ; 3f7a: a0 01
    lda l0a75                                                         ; 3f7c: ad 75 0a
    jsr sub_c43ec                                                     ; 3f7f: 20 ec 43
    sta l0a75                                                         ; 3f82: 8d 75 0a
    rts                                                               ; 3f85: 60

sub_c3f86
    lda #0                                                            ; 3f86: a9 00
    ldx #5                                                            ; 3f88: a2 05
    ldy #$45 ; 'E'                                                    ; 3f8a: a0 45
    jsr play_sound_yx                                                 ; 3f8c: 20 f6 38
    ldx #$fd                                                          ; 3f8f: a2 fd
    ldy #$44 ; 'D'                                                    ; 3f91: a0 44
    jmp play_sound_yx                                                 ; 3f93: 4c f6 38

; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 20                                                          ; 3f96: 14                      ; initial player X cell
    !byte 22                                                          ; 3f97: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####      |                   |     ####
; ###       |                   |      ###
; ###       |                   |      ###
; ###       |                   |      ###
; ###       |                   |      ###
; ###SOOO   |                   |      ###
; ###       |                   |      ###
; ###       |                   |      ###
; ###       |                   |      ###
; ###       |                   |      ###
; ###       |                   |      ###
; ###                           |      ###
; ###                           |      ###
; ###########################   |   ######
; ###########################   |   ######
; ###                           |
; ###                           |
; ###                           |
; ###
; ###                 P
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_0_code
    jsr sub_c3b3a                                                     ; 3f98: 20 3a 3b
; draw 3x20 rectangle at (0,2)
    ldy #2                                                            ; 3f9b: a0 02
    lda #3                                                            ; 3f9d: a9 03
    sta width_in_cells                                                ; 3f9f: 85 3c
    lda #$14                                                          ; 3fa1: a9 14
    sta height_in_cells                                               ; 3fa3: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fa5: 20 bb 1a
; draw 3x15 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3fa8: a2 25
    lda #$0f                                                          ; 3faa: a9 0f
    sta height_in_cells                                               ; 3fac: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fae: 20 bb 1a
; draw 24x2 rectangle at (3,15)
    ldx #3                                                            ; 3fb1: a2 03
    ldy #$0f                                                          ; 3fb3: a0 0f
    lda #$18                                                          ; 3fb5: a9 18
    sta width_in_cells                                                ; 3fb7: 85 3c
    lda #2                                                            ; 3fb9: a9 02
    sta height_in_cells                                               ; 3fbb: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fbd: 20 bb 1a
; draw 3x2 rectangle at (34,15)
    ldx #$22 ; '"'                                                    ; 3fc0: a2 22
    lda #3                                                            ; 3fc2: a9 03
    sta width_in_cells                                                ; 3fc4: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3fc6: 20 bb 1a
    jsr sub_c3b4e                                                     ; 3fc9: 20 4e 3b
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3fcc: 20 90 1b
; draw sprite $e5 at (3,7) of size (4x1)
    lda #4                                                            ; 3fcf: a9 04
    sta width_in_cells                                                ; 3fd1: 85 3c
    lda #1                                                            ; 3fd3: a9 01
    sta height_in_cells                                               ; 3fd5: 85 3d
    lda #$e5                                                          ; 3fd7: a9 e5
    ldx #3                                                            ; 3fd9: a2 03
    ldy #7                                                            ; 3fdb: a0 07
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3fdd: 20 57 1f
; draw sprite $e6 at (3,7)
    lda #$e6                                                          ; 3fe0: a9 e6
    jsr draw_sprite_a_at_cell_xy                                      ; 3fe2: 20 4c 1f
; draw rope at (10,2) length 11
    ldx #$0a                                                          ; 3fe5: a2 0a
    ldy #2                                                            ; 3fe7: a0 02
    lda #$0b                                                          ; 3fe9: a9 0b
    jsr draw_rope                                                     ; 3feb: 20 b9 1d
; draw rope at (30,2) length 18
    ldx #$1e                                                          ; 3fee: a2 1e
    lda #$12                                                          ; 3ff0: a9 12
    jsr draw_rope                                                     ; 3ff2: 20 b9 1d
    jsr start_room                                                    ; 3ff5: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 3ff8: 20 da 12
    and #exit_room_right                                              ; 3ffb: 29 04
    beq room_0_game_update_loop                                       ; 3ffd: f0 f9
    ldx #1                                                            ; 3fff: a2 01
    ldy current_level                                                 ; 4001: a4 31
    jmp initialise_level_and_room                                     ; 4003: 4c 40 11

l4006
    !byte   0,   0,   0,   0, $80, $ea, $18, $ff, $ea, $18, $ff, $ea  ; 4006: 00 00 00...
    !byte $18, $ff, $ea, $18, $ff, $eb, $18,   0, $eb, $19,   0, $eb  ; 4012: 18 ff ea...
    !byte $19, $ff, $80, $ea, $19, $fe, $ea, $19, $fe, $ea, $19, $fe  ; 401e: 19 ff 80...
    !byte $ea, $19, $fe, $ea, $19, $fe, $ea, $19, $fe, $ea, $19, $fe  ; 402a: ea 19 fe...
    !byte $ea, $19, $fe, $ea, $19, $fe, $ea, $19, $fe, $80, $ea, $18  ; 4036: ea 19 fe...
    !byte $fe, $80                                                    ; 4042: fe 80

sub_c4044
    lda update_room_first_update_flag                                 ; 4044: ad 2b 13
    beq c40ad                                                         ; 4047: f0 64
    lda current_level                                                 ; 4049: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 404b: c5 51
    beq c4067                                                         ; 404d: f0 18
    lda l0a38                                                         ; 404f: ad 38 0a
    beq c405f                                                         ; 4052: f0 0b
    lda #1                                                            ; 4054: a9 01
    sta l0a37                                                         ; 4056: 8d 37 0a
    sta l0a76                                                         ; 4059: 8d 76 0a
    jmp c4067                                                         ; 405c: 4c 67 40

c405f
    lda #5                                                            ; 405f: a9 05
    sta l0a37                                                         ; 4061: 8d 37 0a
    sta l0a76                                                         ; 4064: 8d 76 0a
c4067
    lda desired_room_index                                            ; 4067: a5 30
    cmp #0                                                            ; 4069: c9 00
    bne c40aa                                                         ; 406b: d0 3d
    ldx #$ef                                                          ; 406d: a2 ef
    ldy #$44 ; 'D'                                                    ; 406f: a0 44
    jsr define_envelope                                               ; 4071: 20 5e 39
    lda #4                                                            ; 4074: a9 04
    sta width_in_cells                                                ; 4076: 85 3c
    lda #1                                                            ; 4078: a9 01
    sta height_in_cells                                               ; 407a: 85 3d
    lda #3                                                            ; 407c: a9 03
    sta value_to_write_to_collision_map                               ; 407e: 85 3e
    ldx #$0e                                                          ; 4080: a2 0e
    ldy #$0e                                                          ; 4082: a0 0e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 4084: 20 44 1e
    lda #$78 ; 'x'                                                    ; 4087: a9 78
    sta l0981                                                         ; 4089: 8d 81 09
    lda #$e0                                                          ; 408c: a9 e0
    sta l38c7                                                         ; 408e: 8d c7 38
    lda #$e7                                                          ; 4091: a9 e7
    sta l38b2                                                         ; 4093: 8d b2 38
    lda #$c0                                                          ; 4096: a9 c0
    sta l38c8                                                         ; 4098: 8d c8 38
    lda #$8e                                                          ; 409b: a9 8e
    sta l0957                                                         ; 409d: 8d 57 09
    lda #$78 ; 'x'                                                    ; 40a0: a9 78
    sta l0983                                                         ; 40a2: 8d 83 09
    lda #$ed                                                          ; 40a5: a9 ed
    sta l09af                                                         ; 40a7: 8d af 09
c40aa
    jmp c413e                                                         ; 40aa: 4c 3e 41

c40ad
    lda l0a76                                                         ; 40ad: ad 76 0a
    clc                                                               ; 40b0: 18
    adc #3                                                            ; 40b1: 69 03
    tay                                                               ; 40b3: a8
    lda l4006,y                                                       ; 40b4: b9 06 40
    cmp #$80                                                          ; 40b7: c9 80
    bne c40be                                                         ; 40b9: d0 03
    ldy l0a37                                                         ; 40bb: ac 37 0a
c40be
    lda l0a37                                                         ; 40be: ad 37 0a
    cmp #1                                                            ; 40c1: c9 01
    beq c4115                                                         ; 40c3: f0 50
    lda l0a38                                                         ; 40c5: ad 38 0a
    bne c40ed                                                         ; 40c8: d0 23
    lda desired_room_index                                            ; 40ca: a5 30
    cmp #0                                                            ; 40cc: c9 00
    bne c40f7                                                         ; 40ce: d0 27
    lda l09aa                                                         ; 40d0: ad aa 09
    cmp #$d9                                                          ; 40d3: c9 d9
    bne c40f7                                                         ; 40d5: d0 20
    lda l0a36                                                         ; 40d7: ad 36 0a
    beq c40f7                                                         ; 40da: f0 1b
    ldx #2                                                            ; 40dc: a2 02
    sty l419e                                                         ; 40de: 8c 9e 41
    ldy #7                                                            ; 40e1: a0 07
    jsr test_for_collision_between_objects_x_and_y                    ; 40e3: 20 e2 28
    ldy l419e                                                         ; 40e6: ac 9e 41
    ora #0                                                            ; 40e9: 09 00
    beq c40f7                                                         ; 40eb: f0 0a
c40ed
    lda l0a38                                                         ; 40ed: ad 38 0a
    cmp #$10                                                          ; 40f0: c9 10
    bcs c40f7                                                         ; 40f2: b0 03
    inc l0a38                                                         ; 40f4: ee 38 0a
c40f7
    lda l0a38                                                         ; 40f7: ad 38 0a
    cmp #8                                                            ; 40fa: c9 08
    bcc c4118                                                         ; 40fc: 90 1a
    ldy #$3a ; ':'                                                    ; 40fe: a0 3a
    sty l0a37                                                         ; 4100: 8c 37 0a
    cmp #$10                                                          ; 4103: c9 10
    bcc c413b                                                         ; 4105: 90 34
    lda desired_room_index                                            ; 4107: a5 30
    cmp #0                                                            ; 4109: c9 00
    bne c4110                                                         ; 410b: d0 03
    jsr sub_c3f86                                                     ; 410d: 20 86 3f
c4110
    ldy #1                                                            ; 4110: a0 01
    sty l0a37                                                         ; 4112: 8c 37 0a
c4115
    jmp c413b                                                         ; 4115: 4c 3b 41

c4118
    lda desired_room_index                                            ; 4118: a5 30
    cmp #0                                                            ; 411a: c9 00
    bne c413b                                                         ; 411c: d0 1d
    lda #$f8                                                          ; 411e: a9 f8
    sta temp_top_offset                                               ; 4120: 8d 50 25
    ldx #6                                                            ; 4123: a2 06
    sty l419e                                                         ; 4125: 8c 9e 41
    ldy #0                                                            ; 4128: a0 00
    jsr test_for_collision_between_objects_x_and_y                    ; 412a: 20 e2 28
    ldy l419e                                                         ; 412d: ac 9e 41
    ora #0                                                            ; 4130: 09 00
    beq c413b                                                         ; 4132: f0 07
    lda #6                                                            ; 4134: a9 06
    sta player_wall_collision_flag                                    ; 4136: 8d 33 24
    ldy #$1b                                                          ; 4139: a0 1b
c413b
    sty l0a76                                                         ; 413b: 8c 76 0a
c413e
    lda desired_room_index                                            ; 413e: a5 30
    cmp #0                                                            ; 4140: c9 00
    bne c419d                                                         ; 4142: d0 59
    ldy l0a76                                                         ; 4144: ac 76 0a
    lda l4006,y                                                       ; 4147: b9 06 40
    sta l09ae                                                         ; 414a: 8d ae 09
    iny                                                               ; 414d: c8
    lda l4006,y                                                       ; 414e: b9 06 40
    clc                                                               ; 4151: 18
    adc #$74 ; 't'                                                    ; 4152: 69 74
    sta l0956                                                         ; 4154: 8d 56 09
    iny                                                               ; 4157: c8
    lda l4006,y                                                       ; 4158: b9 06 40
    clc                                                               ; 415b: 18
    adc #$78 ; 'x'                                                    ; 415c: 69 78
    sta l0982                                                         ; 415e: 8d 82 09
    lda #$e9                                                          ; 4161: a9 e9
    sta l09ad                                                         ; 4163: 8d ad 09
    lda #$74 ; 't'                                                    ; 4166: a9 74
    sta l0955                                                         ; 4168: 8d 55 09
    lda l0a37                                                         ; 416b: ad 37 0a
    cmp #1                                                            ; 416e: c9 01
    beq c4186                                                         ; 4170: f0 14
    cmp #$3a ; ':'                                                    ; 4172: c9 3a
    bne c419d                                                         ; 4174: d0 27
    ldx #$11                                                          ; 4176: a2 11
    ldy #$0c                                                          ; 4178: a0 0c
    lda #3                                                            ; 417a: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 417c: 20 bb 1e
    iny                                                               ; 417f: c8
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4180: 20 bb 1e
    jmp c419d                                                         ; 4183: 4c 9d 41

c4186
    ldx #$11                                                          ; 4186: a2 11
    ldy #$0c                                                          ; 4188: a0 0c
    lda #0                                                            ; 418a: a9 00
    jsr write_a_single_value_to_cell_in_collision_map                 ; 418c: 20 bb 1e
    iny                                                               ; 418f: c8
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4190: 20 bb 1e
    lda #$e8                                                          ; 4193: a9 e8
    sta l09ad                                                         ; 4195: 8d ad 09
    lda #$70 ; 'p'                                                    ; 4198: a9 70
    sta l0955                                                         ; 419a: 8d 55 09
c419d
    rts                                                               ; 419d: 60

l419e
    !byte 0                                                           ; 419e: 00

sub_c419f
    lda #0                                                            ; 419f: a9 00
    sta currently_updating_logic_for_room_index                       ; 41a1: 8d ba 1a
    ldx #5                                                            ; 41a4: a2 05
    ldy #7                                                            ; 41a6: a0 07
    lda #4                                                            ; 41a8: a9 04
    jsr update_level_completion                                       ; 41aa: 20 10 1a
    lda update_room_first_update_flag                                 ; 41ad: ad 2b 13
    beq c421a                                                         ; 41b0: f0 68
    lda #$d6                                                          ; 41b2: a9 d6
    sta toolbar_collectable_spriteids+1                               ; 41b4: 8d e9 2e
    lda #$d3                                                          ; 41b7: a9 d3
    sta collectable_spriteids+1                                       ; 41b9: 8d ee 2e
    lda #$d5                                                          ; 41bc: a9 d5
    sta five_byte_table_paired_with_collectable_sprite_ids + 1        ; 41be: 8d f3 2e
    lda #$d7                                                          ; 41c1: a9 d7
    sta toolbar_collectable_spriteids+2                               ; 41c3: 8d ea 2e
    lda #$d4                                                          ; 41c6: a9 d4
    sta collectable_spriteids+2                                       ; 41c8: 8d ef 2e
    lda #$d5                                                          ; 41cb: a9 d5
    sta l2ef4                                                         ; 41cd: 8d f4 2e
    lda current_level                                                 ; 41d0: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 41d2: c5 51
    beq c41db                                                         ; 41d4: f0 05
    lda #0                                                            ; 41d6: a9 00
    sta l0a73                                                         ; 41d8: 8d 73 0a
c41db
    lda desired_room_index                                            ; 41db: a5 30
    cmp previous_room_index                                           ; 41dd: c5 50
    beq c41e6                                                         ; 41df: f0 05
    lda #0                                                            ; 41e1: a9 00
    sta l0a73                                                         ; 41e3: 8d 73 0a
c41e6
    lda #$e4                                                          ; 41e6: a9 e4
    sta l38ae                                                         ; 41e8: 8d ae 38
    lda #$60 ; '`'                                                    ; 41eb: a9 60
    sta l38c4                                                         ; 41ed: 8d c4 38
    lda desired_room_index                                            ; 41f0: a5 30
    cmp #0                                                            ; 41f2: c9 00
    bne c4217                                                         ; 41f4: d0 21
    lda l0a35                                                         ; 41f6: ad 35 0a
    bne c4217                                                         ; 41f9: d0 1c
    ldx #$23 ; '#'                                                    ; 41fb: a2 23
    lda #4                                                            ; 41fd: a9 04
    sta temp_sprite_x_offset                                          ; 41ff: 85 3a
    ldy #$0f                                                          ; 4201: a0 0f
    lda #3                                                            ; 4203: a9 03
    jsr set_object_position_from_cell_xy                              ; 4205: 20 5d 1f
    lda #$d2                                                          ; 4208: a9 d2
    sta l09ab                                                         ; 420a: 8d ab 09
    lda #$d1                                                          ; 420d: a9 d1
    sta l38af                                                         ; 420f: 8d af 38
    lda #$c0                                                          ; 4212: a9 c0
    sta l38c5                                                         ; 4214: 8d c5 38
c4217
    jmp c42ae                                                         ; 4217: 4c ae 42

c421a
    lda l0a35                                                         ; 421a: ad 35 0a
    bne c4245                                                         ; 421d: d0 26
    lda desired_room_index                                            ; 421f: a5 30
    cmp #0                                                            ; 4221: c9 00
    bne c4242                                                         ; 4223: d0 1d
    lda l0a35                                                         ; 4225: ad 35 0a
    bne c4217                                                         ; 4228: d0 ed
    ldx #$0b                                                          ; 422a: a2 0b
    ldy #3                                                            ; 422c: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 422e: 20 e2 28
    beq c4242                                                         ; 4231: f0 0f
    lda #0                                                            ; 4233: a9 00
    sta l09ab                                                         ; 4235: 8d ab 09
    lda #1                                                            ; 4238: a9 01
    sta l0a35                                                         ; 423a: 8d 35 0a
    lda #$d6                                                          ; 423d: a9 d6
    jsr find_or_create_menu_slot_for_A                                ; 423f: 20 bd 2b
c4242
    jmp c4327                                                         ; 4242: 4c 27 43

c4245
    lda l0a73                                                         ; 4245: ad 73 0a
    bne c42a0                                                         ; 4248: d0 56
    lda #$d7                                                          ; 424a: a9 d7
    cmp player_using_object_spriteid                                  ; 424c: cd b6 2e
    bne c42ae                                                         ; 424f: d0 5d
    lda #$d6                                                          ; 4251: a9 d6
    sta player_held_object_spriteid                                   ; 4253: 85 52
    sta player_using_object_spriteid                                  ; 4255: 8d b6 2e
    ldx l296e                                                         ; 4258: ae 6e 29
    sta l295c,x                                                       ; 425b: 9d 5c 29
    lda #1                                                            ; 425e: a9 01
    sta l0a73                                                         ; 4260: 8d 73 0a
    lda #1                                                            ; 4263: a9 01
    sta l0a35                                                         ; 4265: 8d 35 0a
    lda #4                                                            ; 4268: a9 04
    ldx object_direction                                              ; 426a: ae be 09
    bpl c4274                                                         ; 426d: 10 05
    eor #$ff                                                          ; 426f: 49 ff
    clc                                                               ; 4271: 18
    adc #1                                                            ; 4272: 69 01
c4274
    ldx #0                                                            ; 4274: a2 00
    ora #0                                                            ; 4276: 09 00
    bpl c427b                                                         ; 4278: 10 01
    dex                                                               ; 427a: ca
c427b
    clc                                                               ; 427b: 18
    adc object_x_low+1                                                ; 427c: 6d 51 09
    sta l0a70                                                         ; 427f: 8d 70 0a
    txa                                                               ; 4282: 8a
    adc object_x_high+1                                               ; 4283: 6d 67 09
    sta l0a71                                                         ; 4286: 8d 71 0a
    ldx #0                                                            ; 4289: a2 00
    lda #$fc                                                          ; 428b: a9 fc
    bpl c4290                                                         ; 428d: 10 01
    dex                                                               ; 428f: ca
c4290
    clc                                                               ; 4290: 18
    adc object_y_low+1                                                ; 4291: 6d 7d 09
    sta l0a72                                                         ; 4294: 8d 72 0a
    lda object_direction                                              ; 4297: ad be 09
    sta l0a74                                                         ; 429a: 8d 74 0a
    jmp c42ae                                                         ; 429d: 4c ae 42

c42a0
    inc l0a73                                                         ; 42a0: ee 73 0a
    beq c42ae                                                         ; 42a3: f0 09
    lda l0a72                                                         ; 42a5: ad 72 0a
    clc                                                               ; 42a8: 18
    adc #8                                                            ; 42a9: 69 08
    sta l0a72                                                         ; 42ab: 8d 72 0a
c42ae
    lda #0                                                            ; 42ae: a9 00
    sta l09aa                                                         ; 42b0: 8d aa 09
    ldx l0a73                                                         ; 42b3: ae 73 0a
    beq c4242                                                         ; 42b6: f0 8a
    lda l0a70                                                         ; 42b8: ad 70 0a
    sta l0952                                                         ; 42bb: 8d 52 09
    lda l0a71                                                         ; 42be: ad 71 0a
    sta l0968                                                         ; 42c1: 8d 68 09
    lda l0a74                                                         ; 42c4: ad 74 0a
    sta l09c0                                                         ; 42c7: 8d c0 09
    lda l0a72                                                         ; 42ca: ad 72 0a
    sta l097e                                                         ; 42cd: 8d 7e 09
    lda #$df                                                          ; 42d0: a9 df
    sta l09aa                                                         ; 42d2: 8d aa 09
    cpx #1                                                            ; 42d5: e0 01
    beq c430c                                                         ; 42d7: f0 33
    lda #$d9                                                          ; 42d9: a9 d9
    sta l09aa                                                         ; 42db: 8d aa 09
    cpx #$ff                                                          ; 42de: e0 ff
    beq c430c                                                         ; 42e0: f0 2a
    lda #$da                                                          ; 42e2: a9 da
    sta l09aa                                                         ; 42e4: 8d aa 09
    lda update_room_first_update_flag                                 ; 42e7: ad 2b 13
    bne c430c                                                         ; 42ea: d0 20
    lda l09b5                                                         ; 42ec: ad b5 09
    cmp #$da                                                          ; 42ef: c9 da
    bne c430c                                                         ; 42f1: d0 19
    lda #1                                                            ; 42f3: a9 01
    sta temp_bottom_offset                                            ; 42f5: 8d 51 25
    lda #2                                                            ; 42f8: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 42fa: 20 94 28
    beq c430c                                                         ; 42fd: f0 0d
    lda #$ff                                                          ; 42ff: a9 ff
    sta l0a73                                                         ; 4301: 8d 73 0a
    lda #$d9                                                          ; 4304: a9 d9
    sta l09aa                                                         ; 4306: 8d aa 09
    jsr play_landing_sound                                            ; 4309: 20 a9 23
c430c
    ldx #2                                                            ; 430c: a2 02
    jsr l2434                                                         ; 430e: 20 34 24
    lda l0078                                                         ; 4311: a5 78
    cmp #$28 ; '('                                                    ; 4313: c9 28
    bcc c4327                                                         ; 4315: 90 10
    ora #0                                                            ; 4317: 09 00
    bpl c431f                                                         ; 4319: 10 04
    lda l0079                                                         ; 431b: a5 79
    bpl c4327                                                         ; 431d: 10 08
c431f
    lda #0                                                            ; 431f: a9 00
    sta l0a73                                                         ; 4321: 8d 73 0a
    sta l09aa                                                         ; 4324: 8d aa 09
c4327
    rts                                                               ; 4327: 60

; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 20                                                          ; 4328: 14                      ; initial player X cell
    !byte 22                                                          ; 4329: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####                      |         ####
; ###                       |          ###
; ###                       |          ###
; ###                       |          ###
; ###                       |          ###
; #######################   |   ##########
; #######################   |   ##########
; ###                       |          ###
; ###                       S          ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ######                            ######
; ######                            ######
; 
; 
; 
; 
;                     P
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_1_code
    jsr sub_c3b3a                                                     ; 432a: 20 3a 3b
; draw 3x15 rectangle at (0,2)
    ldy #2                                                            ; 432d: a0 02
    lda #3                                                            ; 432f: a9 03
    sta width_in_cells                                                ; 4331: 85 3c
    lda #$0f                                                          ; 4333: a9 0f
    sta height_in_cells                                               ; 4335: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4337: 20 bb 1a
; draw 3x15 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 433a: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 433c: 20 bb 1a
; draw 20x2 rectangle at (3,7)
    ldx #3                                                            ; 433f: a2 03
    ldy #7                                                            ; 4341: a0 07
    lda #$14                                                          ; 4343: a9 14
    sta width_in_cells                                                ; 4345: 85 3c
    lda #2                                                            ; 4347: a9 02
    sta height_in_cells                                               ; 4349: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 434b: 20 bb 1a
; draw 7x2 rectangle at (30,7)
    ldx #$1e                                                          ; 434e: a2 1e
    lda #7                                                            ; 4350: a9 07
    sta width_in_cells                                                ; 4352: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 4354: 20 bb 1a
; draw 3x2 rectangle at (3,15)
    ldx #3                                                            ; 4357: a2 03
    ldy #$0f                                                          ; 4359: a0 0f
    lda #3                                                            ; 435b: a9 03
    sta width_in_cells                                                ; 435d: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 435f: 20 bb 1a
; draw 3x2 rectangle at (34,15)
    ldx #$22 ; '"'                                                    ; 4362: a2 22
    jsr copy_rectangle_of_memory_to_screen                            ; 4364: 20 bb 1a
    jsr sub_c3b4e                                                     ; 4367: 20 4e 3b
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 436a: 20 90 1b
; draw rope at (26,2) length 9
    ldx #$1a                                                          ; 436d: a2 1a
    ldy #2                                                            ; 436f: a0 02
    lda #9                                                            ; 4371: a9 09
    jsr draw_rope                                                     ; 4373: 20 b9 1d
    lda #4                                                            ; 4376: a9 04
    sta l0015                                                         ; 4378: 85 15
    jsr sprite_op                                                     ; 437a: 20 8d 13
; draw sprite $d8 at (26,10)
    ldy #$0a                                                          ; 437d: a0 0a
    lda #$d8                                                          ; 437f: a9 d8
    jsr draw_sprite_a_at_cell_xy                                      ; 4381: 20 4c 1f
    jsr start_room                                                    ; 4384: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 4387: 20 da 12
    sta l0070                                                         ; 438a: 85 70
    and #exit_room_left                                               ; 438c: 29 01
    beq c4397                                                         ; 438e: f0 07
    ldx #0                                                            ; 4390: a2 00
    ldy current_level                                                 ; 4392: a4 31
    jmp initialise_level_and_room                                     ; 4394: 4c 40 11

c4397
    lda l0070                                                         ; 4397: a5 70
    and #4                                                            ; 4399: 29 04
    beq room_1_game_update_loop                                       ; 439b: f0 ea
    ldx #2                                                            ; 439d: a2 02
    ldy current_level                                                 ; 439f: a4 31
    jmp initialise_level_and_room                                     ; 43a1: 4c 40 11

sub_c43a4
    lda #1                                                            ; 43a4: a9 01
    sta currently_updating_logic_for_room_index                       ; 43a6: 8d ba 1a
    ldx #3                                                            ; 43a9: a2 03
    ldy #$0c                                                          ; 43ab: a0 0c
    lda #4                                                            ; 43ad: a9 04
    jsr update_brazier_and_fire                                       ; 43af: 20 88 19
    ldx #$25 ; '%'                                                    ; 43b2: a2 25
    lda #5                                                            ; 43b4: a9 05
    jsr update_brazier_and_fire                                       ; 43b6: 20 88 19
    lda #0                                                            ; 43b9: a9 00
    sta l44ec                                                         ; 43bb: 8d ec 44
    lda #$10                                                          ; 43be: a9 10
    sta l44eb                                                         ; 43c0: 8d eb 44
    lda #$68 ; 'h'                                                    ; 43c3: a9 68
    sta l44ed                                                         ; 43c5: 8d ed 44
    lda #$10                                                          ; 43c8: a9 10
    clc                                                               ; 43ca: 18
    adc #5                                                            ; 43cb: 69 05
    clc                                                               ; 43cd: 18
    adc #$16                                                          ; 43ce: 69 16
    sec                                                               ; 43d0: 38
    sbc #$0d                                                          ; 43d1: e9 0d
    sec                                                               ; 43d3: 38
    sbc #1                                                            ; 43d4: e9 01
    sta l44ee                                                         ; 43d6: 8d ee 44
    ldx #$d0                                                          ; 43d9: a2 d0
    ldy #0                                                            ; 43db: a0 00
    lda l0a6f                                                         ; 43dd: ad 6f 0a
    jsr sub_c43ec                                                     ; 43e0: 20 ec 43
    sta l0a6f                                                         ; 43e3: 8d 6f 0a
    rts                                                               ; 43e6: 60

l43e7
    !byte $de, $dd, $dc, $db                                          ; 43e7: de dd dc...
l43eb
    !byte $da                                                         ; 43eb: da

sub_c43ec
    sta l44ea                                                         ; 43ec: 8d ea 44
    lda update_room_first_update_flag                                 ; 43ef: ad 2b 13
    beq c441c                                                         ; 43f2: f0 28
    lda current_level                                                 ; 43f4: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 43f6: c5 51
    beq c43ff                                                         ; 43f8: f0 05
    lda #0                                                            ; 43fa: a9 00
    sta l44ea                                                         ; 43fc: 8d ea 44
c43ff
    lda desired_room_index                                            ; 43ff: a5 30
    cmp currently_updating_logic_for_room_index                       ; 4401: cd ba 1a
    bne c4416                                                         ; 4404: d0 10
    lda #$d1                                                          ; 4406: a9 d1
    sta l38af                                                         ; 4408: 8d af 38
    lda #$40 ; '@'                                                    ; 440b: a9 40
    sta l38c5                                                         ; 440d: 8d c5 38
    stx l0953                                                         ; 4410: 8e 53 09
    sty l0969                                                         ; 4413: 8c 69 09
c4416
    jmp c442f                                                         ; 4416: 4c 2f 44

c4419
    jmp c44e6                                                         ; 4419: 4c e6 44

c441c
    inc l44ea                                                         ; 441c: ee ea 44
    lda l44ee                                                         ; 441f: ad ee 44
    clc                                                               ; 4422: 18
    adc #1                                                            ; 4423: 69 01
    cmp l44ea                                                         ; 4425: cd ea 44
    bne c442f                                                         ; 4428: d0 05
    lda #0                                                            ; 442a: a9 00
    sta l44ea                                                         ; 442c: 8d ea 44
c442f
    lda desired_room_index                                            ; 442f: a5 30
    cmp currently_updating_logic_for_room_index                       ; 4431: cd ba 1a
    bne c4419                                                         ; 4434: d0 e3
    lda #0                                                            ; 4436: a9 00
    sta l09ab                                                         ; 4438: 8d ab 09
    lda l44ee                                                         ; 443b: ad ee 44
    clc                                                               ; 443e: 18
    adc #1                                                            ; 443f: 69 01
    sta l0070                                                         ; 4441: 85 70
    lda l44ea                                                         ; 4443: ad ea 44
    cmp l0070                                                         ; 4446: c5 70
    bcs c4419                                                         ; 4448: b0 cf
    sec                                                               ; 444a: 38
    sbc l44eb                                                         ; 444b: ed eb 44
    bcc c4419                                                         ; 444e: 90 c9
    cmp #5                                                            ; 4450: c9 05
    bcs c4464                                                         ; 4452: b0 10
    tay                                                               ; 4454: a8
    lda l43e7,y                                                       ; 4455: b9 e7 43
    sta l09ab                                                         ; 4458: 8d ab 09
    lda l44ed                                                         ; 445b: ad ed 44
    sta l097f                                                         ; 445e: 8d 7f 09
    jmp c44e6                                                         ; 4461: 4c e6 44

c4464
    sec                                                               ; 4464: 38
    sbc #5                                                            ; 4465: e9 05
    clc                                                               ; 4467: 18
    adc #1                                                            ; 4468: 69 01
    asl                                                               ; 446a: 0a
    asl                                                               ; 446b: 0a
    asl                                                               ; 446c: 0a
    clc                                                               ; 446d: 18
    adc l44ed                                                         ; 446e: 6d ed 44
    sta l097f                                                         ; 4471: 8d 7f 09
    lda #$d9                                                          ; 4474: a9 d9
    sta l09ab                                                         ; 4476: 8d ab 09
    lda l44ea                                                         ; 4479: ad ea 44
    cmp l44ee                                                         ; 447c: cd ee 44
    bne c448c                                                         ; 447f: d0 0b
    lda update_room_first_update_flag                                 ; 4481: ad 2b 13
    bne c44e6                                                         ; 4484: d0 60
    jsr play_landing_sound                                            ; 4486: 20 a9 23
    jmp c44e6                                                         ; 4489: 4c e6 44

c448c
    lda l43eb                                                         ; 448c: ad eb 43
    sta l09ab                                                         ; 448f: 8d ab 09
    lda l097f                                                         ; 4492: ad 7f 09
    sec                                                               ; 4495: 38
    sbc #4                                                            ; 4496: e9 04
    sta l097f                                                         ; 4498: 8d 7f 09
    lda update_room_first_update_flag                                 ; 449b: ad 2b 13
    bne c44e6                                                         ; 449e: d0 46
    lda object_spriteid+1                                             ; 44a0: ad a9 09
    cmp #$d3                                                          ; 44a3: c9 d3
    bne c44e6                                                         ; 44a5: d0 3f
    lda l0a73                                                         ; 44a7: ad 73 0a
    bne c44e6                                                         ; 44aa: d0 3a
    ldx #$0c                                                          ; 44ac: a2 0c
    ldy #$0e                                                          ; 44ae: a0 0e
    jsr test_for_collision_between_objects_x_and_y                    ; 44b0: 20 e2 28
    beq c44e6                                                         ; 44b3: f0 31
    lda #$d4                                                          ; 44b5: a9 d4
    sta object_spriteid+1                                             ; 44b7: 8d a9 09
    lda #$d7                                                          ; 44ba: a9 d7
    sta player_held_object_spriteid                                   ; 44bc: 85 52
    ldx l296e                                                         ; 44be: ae 6e 29
    sta l295c,x                                                       ; 44c1: 9d 5c 29
    lda #$ff                                                          ; 44c4: a9 ff
    sta l0a35                                                         ; 44c6: 8d 35 0a
    lda l44ec                                                         ; 44c9: ad ec 44
    sta l0a36                                                         ; 44cc: 8d 36 0a
    lda l44ee                                                         ; 44cf: ad ee 44
    clc                                                               ; 44d2: 18
    adc #1                                                            ; 44d3: 69 01
    sec                                                               ; 44d5: 38
    sbc l44ea                                                         ; 44d6: ed ea 44
    eor #$ff                                                          ; 44d9: 49 ff
    clc                                                               ; 44db: 18
    adc #1                                                            ; 44dc: 69 01
    sta l44ea                                                         ; 44de: 8d ea 44
    lda #0                                                            ; 44e1: a9 00
    sta l09ab                                                         ; 44e3: 8d ab 09
c44e6
    lda l44ea                                                         ; 44e6: ad ea 44
    rts                                                               ; 44e9: 60

l44ea
    !byte 0                                                           ; 44ea: 00
l44eb
    !byte 0                                                           ; 44eb: 00
l44ec
    !byte 0                                                           ; 44ec: 00
l44ed
    !byte 0                                                           ; 44ed: 00
l44ee
    !byte   0,   5,   1,   0,   0,   0,   0,   0,   0, $14, $f6,   0  ; 44ee: 00 05 01...
    !byte $f6, $78, $3c, $10,   0,   5,   0,   7,   0,   2,   0, $11  ; 44fa: f6 78 3c...
    !byte   0,   0,   0, $b4,   0,   2,   0,   8,   8, $10, $70, $80  ; 4506: 00 00 00...
    !byte   7,   4,   8,   8,   4,   4,   6, $c1, $30, $10, $10,   8  ; 4512: 07 04 08...
    !byte   4,   4,   6, $c1, $30, $10, $10,   8,   8, $10, $70, $80  ; 451e: 04 04 06...
    !byte   7,   4,   8                                               ; 452a: 07 04 08
sprite_data
pydis_end

; Automatically generated labels:
;     c3b0b
;     c3b1c
;     c3b21
;     c3bf6
;     c3c0d
;     c3c25
;     c3c2f
;     c3c38
;     c3c52
;     c3c59
;     c3cbb
;     c3ccd
;     c3cdc
;     c3d07
;     c3d0a
;     c3d0d
;     c3d2b
;     c3d48
;     c3d52
;     c3d63
;     c3d73
;     c3d7c
;     c3d8d
;     c3d9f
;     c3da8
;     c3db6
;     c3dd6
;     c3ddd
;     c3e07
;     c3e0a
;     c3e22
;     c3e43
;     c3e5a
;     c3e6f
;     c3e78
;     c3e94
;     c3eae
;     c3ec5
;     c3ecb
;     c405f
;     c4067
;     c40aa
;     c40ad
;     c40be
;     c40ed
;     c40f7
;     c4110
;     c4115
;     c4118
;     c413b
;     c413e
;     c4186
;     c419d
;     c41db
;     c41e6
;     c4217
;     c421a
;     c4242
;     c4245
;     c4274
;     c427b
;     c4290
;     c42a0
;     c42ae
;     c430c
;     c431f
;     c4327
;     c4397
;     c43ff
;     c4416
;     c4419
;     c441c
;     c442f
;     c4464
;     c448c
;     c44e6
;     l0015
;     l0078
;     l0079
;     l0952
;     l0953
;     l0955
;     l0956
;     l0957
;     l0968
;     l0969
;     l097e
;     l097f
;     l0980
;     l0981
;     l0982
;     l0983
;     l09aa
;     l09ab
;     l09ac
;     l09ad
;     l09ae
;     l09af
;     l09b5
;     l09b6
;     l09b7
;     l09b8
;     l09c0
;     l09c3
;     l0a33
;     l0a34
;     l0a35
;     l0a36
;     l0a37
;     l0a38
;     l0a6f
;     l0a70
;     l0a71
;     l0a72
;     l0a73
;     l0a74
;     l0a75
;     l0a76
;     l20f7
;     l2434
;     l295c
;     l296e
;     l2ef4
;     l38ae
;     l38af
;     l38b2
;     l38c4
;     l38c5
;     l38c6
;     l38c7
;     l38c8
;     l3acc
;     l3bd1
;     l3bd4
;     l3bd5
;     l3bd8
;     l3d08
;     l3d09
;     l4006
;     l419e
;     l43e7
;     l43eb
;     l44ea
;     l44eb
;     l44ec
;     l44ed
;     l44ee
;     loop_c3c86
;     sub_c3b3a
;     sub_c3b4e
;     sub_c3bd9
;     sub_c3cd0
;     sub_c3f56
;     sub_c3f86
;     sub_c4044
;     sub_c419f
;     sub_c43a4
;     sub_c43ec
!if (exit_room_left) != $01 {
    !error "Assertion failed: exit_room_left == $01"
}
!if (exit_room_right) != $04 {
    !error "Assertion failed: exit_room_right == $04"
}
!if (level_specific_initialisation) != $3af6 {
    !error "Assertion failed: level_specific_initialisation == $3af6"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b2a {
    !error "Assertion failed: level_specific_update == $3b2a"
}
!if (room_0_data) != $3f96 {
    !error "Assertion failed: room_0_data == $3f96"
}
!if (room_1_data) != $4328 {
    !error "Assertion failed: room_1_data == $4328"
}
!if (room_2_data) != $3b60 {
    !error "Assertion failed: room_2_data == $3b60"
}
!if (room_3_data) != $3ecc {
    !error "Assertion failed: room_3_data == $3ecc"
}
!if (sprite_data - level_data) != $0a58 {
    !error "Assertion failed: sprite_data - level_data == $0a58"
}
