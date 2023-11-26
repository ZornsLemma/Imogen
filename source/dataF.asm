; Constants
collision_map_none                    = 0
collision_map_out_of_bounds           = 255
collision_map_rope                    = 2
collision_map_solid_rock              = 3
collision_map_unknown                 = 1
copy_mode_2x2                         = 0
copy_mode_random16                    = 16
copy_mode_random2                     = 2
copy_mode_random32                    = 32
copy_mode_random4                     = 4
copy_mode_random64                    = 64
copy_mode_random8                     = 8
copy_mode_simple                      = 1
exit_room_bottom                      = 2
exit_room_left                        = 1
exit_room_right                       = 4
exit_room_top                         = 8
first_level_letter                    = 65
game_area_height_cells                = 24
game_area_width_cells                 = 40
last_level_letter                     = 81
object_collided_ceiling               = 8
object_collided_floor                 = 2
object_collided_left_wall             = 1
object_collided_right_wall            = 4
objectid_old_player                   = 11
objectid_old_player_accessory         = 12
objectid_player                       = 0
objectid_player_accessory             = 1
opcode_jmp                            = 76
sprite_op_flags_copy_mask             = 1
sprite_op_flags_erase                 = 2
sprite_op_flags_ignore_mask           = 4
sprite_op_flags_normal                = 0
spriteid_197                          = 197
spriteid_198                          = 198
spriteid_199                          = 199
spriteid_brazier                      = 58
spriteid_cat1                         = 27
spriteid_cat2                         = 28
spriteid_cat_jump                     = 26
spriteid_cat_tail1                    = 18
spriteid_cat_tail2                    = 19
spriteid_cat_tail3                    = 20
spriteid_cat_tail4                    = 21
spriteid_cat_tail5                    = 22
spriteid_cat_tail6                    = 23
spriteid_cat_tail7                    = 24
spriteid_cat_tail8                    = 25
spriteid_cat_transform1               = 16
spriteid_cat_transform2               = 17
spriteid_cat_walk1                    = 12
spriteid_cat_walk2                    = 13
spriteid_cat_walk3                    = 14
spriteid_cat_walk4                    = 15
spriteid_circle                       = 32
spriteid_corner_bottom_left           = 45
spriteid_corner_bottom_right          = 46
spriteid_corner_top_left              = 44
spriteid_corner_top_right             = 47
spriteid_diamond1                     = 39
spriteid_diamond2                     = 40
spriteid_diamond3                     = 41
spriteid_diamond4                     = 42
spriteid_diamond5                     = 43
spriteid_fingertip_tile_restoration   = 30
spriteid_fire1                        = 60
spriteid_fire2                        = 61
spriteid_fire3                        = 62
spriteid_fire4                        = 63
spriteid_fire5                        = 64
spriteid_fire6                        = 65
spriteid_fire7                        = 66
spriteid_fire8                        = 67
spriteid_icodata_box                  = 9
spriteid_icodata_cat                  = 5
spriteid_icodata_disc                 = 3
spriteid_icodata_info                 = 7
spriteid_icodata_monkey               = 6
spriteid_icodata_password             = 8
spriteid_icodata_sound                = 2
spriteid_icodata_wizard               = 4
spriteid_icon_background              = 1
spriteid_menu_item_completion_spell   = 33
spriteid_monkey1                      = 78
spriteid_monkey2                      = 79
spriteid_monkey3                      = 80
spriteid_monkey4                      = 81
spriteid_monkey5                      = 82
spriteid_monkey_climb1                = 83
spriteid_monkey_climb2                = 84
spriteid_monkey_tail1                 = 70
spriteid_monkey_tail2                 = 71
spriteid_monkey_tail3                 = 72
spriteid_monkey_tail4                 = 73
spriteid_monkey_tail5                 = 74
spriteid_monkey_tail6                 = 75
spriteid_monkey_tail7                 = 76
spriteid_monkey_tail8                 = 77
spriteid_monkey_transform1            = 68
spriteid_monkey_transform2            = 69
spriteid_one_pixel_masked_out         = 0
spriteid_one_pixel_set                = 31
spriteid_pointer_hand                 = 29
spriteid_rope1                        = 85
spriteid_rope2                        = 86
spriteid_rope3                        = 87
spriteid_rope4                        = 88
spriteid_rope_end                     = 10
spriteid_rope_hook                    = 11
spriteid_sparkles1                    = 34
spriteid_sparkles2                    = 35
spriteid_sparkles3                    = 36
spriteid_sparkles4                    = 37
spriteid_sparkles5                    = 38
spriteid_wizard1                      = 48
spriteid_wizard2                      = 49
spriteid_wizard3                      = 50
spriteid_wizard4                      = 51
spriteid_wizard5                      = 52
spriteid_wizard7                      = 54
spriteid_wizard_hand                  = 55
spriteid_wizard_transform1            = 56
spriteid_wizard_transform2            = 57
spriteid_wizard_using_object          = 53

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
l0048                                               = $48
previous_room_index                                 = $50
level_before_latest_level_and_room_initialisation   = $51
player_held_object_spriteid                         = $52
developer_mode_sideways_ram_is_set_up_flag          = $5b
l0070                                               = $70
room_exit_direction                                 = $70
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
l09df                                               = $09df
level_progress_table                                = $09ef
l0a16                                               = $0a16
level_workspace                                     = $0a6f
l0a70                                               = $0a70
l0a71                                               = $0a71
l0a72                                               = $0a72
l0a73                                               = $0a73
l0a74                                               = $0a74
l0a75                                               = $0a75
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
temp_left_offset                                    = $24d0
temp_right_offset                                   = $24d1
temp_top_offset                                     = $2550
temp_bottom_offset                                  = $2551
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
l38b1                                               = $38b1
object_z_order                                      = $38c2
l38c4                                               = $38c4
l38c7                                               = $38c7
object_room_collision_flags                         = $38d8
play_sound_yx                                       = $38f6
define_envelope                                     = $395e
sound_priority_per_channel_table                    = $396f
l3970                                               = $3970
check_menu_keys                                     = $3a8f
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
    !word sprite_data - level_data                                    ; 3ad5: 4f 09                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f1 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 16 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
room_index_cheat1
    !byte 1                                                           ; 3add: 01
room_index_cheat2
    !byte 0                                                           ; 3ade: 00
level_room_data_table
    !word room_0_data                                                 ; 3adf: 26 3b                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: c9 3b
    !word room_2_data                                                 ; 3ae3: b3 3e
    !word room_3_data                                                 ; 3ae5: 6f 42

; *************************************************************************************
; 'FOLLOW-ME[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $8d, $84, $87, $87, $84, $9c, $e6, $86, $8e, $c6            ; 3ae7: 8d 84 87...

; *************************************************************************************
; 
; Level initialisation
; 
; This is called whenever a new room is entered.
; 
; *************************************************************************************
; check for level change (branch if not)
level_specific_initialisation
    lda current_level                                                 ; 3af1: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3af3: c5 51
    beq c3b0d                                                         ; 3af5: f0 16
    lda developer_flags                                               ; 3af7: ad 03 11
    bpl developer_mode_inactive                                       ; 3afa: 10 05
    lda #$ff                                                          ; 3afc: a9 ff
    sta l0a16                                                         ; 3afe: 8d 16 0a
developer_mode_inactive
    lda l0a16                                                         ; 3b01: ad 16 0a
    cmp #$ff                                                          ; 3b04: c9 ff
    bne c3b0d                                                         ; 3b06: d0 05
    lda #$db                                                          ; 3b08: a9 db
    jsr find_or_create_menu_slot_for_A                                ; 3b0a: 20 bd 2b
c3b0d
    lda #4                                                            ; 3b0d: a9 04
    sta source_sprite_memory_low                                      ; 3b0f: 85 40
    lda #$44 ; 'D'                                                    ; 3b11: a9 44
    sta source_sprite_memory_high                                     ; 3b13: 85 41
    rts                                                               ; 3b15: 60

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
    jsr room_0_update_handler                                         ; 3b16: 20 bb 3b
    jsr sub_c3fd3                                                     ; 3b19: 20 d3 3f
    jsr room_1_update_handler                                         ; 3b1c: 20 4c 3c
    jsr sub_c42f8                                                     ; 3b1f: 20 f8 42
    jsr room_2_update_handler                                         ; 3b22: 20 5a 3f
    rts                                                               ; 3b25: 60

; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 20                                                          ; 3b26: 14                      ; initial player X cell
    !byte 22                                                          ; 3b27: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####  |                   |        #####
; ###   |                   |        #####
; ###   |                   |        #####
; ###   |                   |        #####
; ###   |                   |        #####
; ###   |                   |        #####
; ###   |                   |        #####
; ###   |                   |
; ###   |                   |
; ###   |                   |
; ###   |                   |
; ###   |                   |
; ###   |   ##############  |  ###########
; ###   |   ##############  |  ###########
; ###   |                   |
; ###   |                   |
; ###   |                   |
; ###   |                   |
; ###   |
; ###   |             P              #####
; ###   |   ##############################
; ###   |   ##############################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_0_code
    ldx #0                                                            ; 3b28: a2 00
    ldy #0                                                            ; 3b2a: a0 00
    lda #$ff                                                          ; 3b2c: a9 ff
    sta width_in_cells                                                ; 3b2e: 85 3c
    lda #2                                                            ; 3b30: a9 02
    sta height_in_cells                                               ; 3b32: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b34: 20 bb 1a
; draw 4x1 rectangle at (0,2)
    ldy #2                                                            ; 3b37: a0 02
    lda #4                                                            ; 3b39: a9 04
    sta width_in_cells                                                ; 3b3b: 85 3c
    dec height_in_cells                                               ; 3b3d: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b3f: 20 bb 1a
; draw 255x7 rectangle at (35,2)
    ldx #$23 ; '#'                                                    ; 3b42: a2 23
    lda #$ff                                                          ; 3b44: a9 ff
    sta width_in_cells                                                ; 3b46: 85 3c
    lda #7                                                            ; 3b48: a9 07
    sta height_in_cells                                               ; 3b4a: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b4c: 20 bb 1a
; draw 3x255 rectangle at (0,3)
    ldx #0                                                            ; 3b4f: a2 00
    iny                                                               ; 3b51: c8
    lda #3                                                            ; 3b52: a9 03
    sta width_in_cells                                                ; 3b54: 85 3c
    lda #$ff                                                          ; 3b56: a9 ff
    sta height_in_cells                                               ; 3b58: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b5a: 20 bb 1a
; draw 255x1 rectangle at (35,21)
    ldx #$23 ; '#'                                                    ; 3b5d: a2 23
    ldy #$15                                                          ; 3b5f: a0 15
    lda #$ff                                                          ; 3b61: a9 ff
    sta width_in_cells                                                ; 3b63: 85 3c
    lda #1                                                            ; 3b65: a9 01
    sta height_in_cells                                               ; 3b67: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b69: 20 bb 1a
; draw 255x2 rectangle at (10,22)
    ldx #$0a                                                          ; 3b6c: a2 0a
    iny                                                               ; 3b6e: c8
    inc height_in_cells                                               ; 3b6f: e6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b71: 20 bb 1a
; draw 14x2 rectangle at (10,14)
    ldx #$0a                                                          ; 3b74: a2 0a
    ldy #$0e                                                          ; 3b76: a0 0e
    lda #$0e                                                          ; 3b78: a9 0e
    sta width_in_cells                                                ; 3b7a: 85 3c
    lda #2                                                            ; 3b7c: a9 02
    sta height_in_cells                                               ; 3b7e: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b80: 20 bb 1a
; draw 14x2 rectangle at (29,14)
    ldx #$1d                                                          ; 3b83: a2 1d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b85: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3b88: 20 90 1b
; draw rope at (6,2) length 255
    ldx #6                                                            ; 3b8b: a2 06
    ldy #2                                                            ; 3b8d: a0 02
    lda #$ff                                                          ; 3b8f: a9 ff
    jsr draw_rope                                                     ; 3b91: 20 b9 1d
; draw rope at (26,2) length 18
    ldx #$1a                                                          ; 3b94: a2 1a
    lda #$12                                                          ; 3b96: a9 12
    jsr draw_rope                                                     ; 3b98: 20 b9 1d
    jsr start_room                                                    ; 3b9b: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 3b9e: 20 da 12
    sta room_exit_direction                                           ; 3ba1: 85 70
    and #exit_room_bottom                                             ; 3ba3: 29 02
    beq room_0_check_right_exit                                       ; 3ba5: f0 07
    ldx #3                                                            ; 3ba7: a2 03
    ldy current_level                                                 ; 3ba9: a4 31
    jmp initialise_level_and_room                                     ; 3bab: 4c 40 11

room_0_check_right_exit
    lda room_exit_direction                                           ; 3bae: a5 70
    and #exit_room_right                                              ; 3bb0: 29 04
    beq room_0_game_update_loop                                       ; 3bb2: f0 ea
    ldx #1                                                            ; 3bb4: a2 01
    ldy current_level                                                 ; 3bb6: a4 31
    jmp initialise_level_and_room                                     ; 3bb8: 4c 40 11

room_0_update_handler
    lda #0                                                            ; 3bbb: a9 00
    sta currently_updating_logic_for_room_index                       ; 3bbd: 8d ba 1a
    lda #2                                                            ; 3bc0: a9 02
    ldx #$23 ; '#'                                                    ; 3bc2: a2 23
    ldy #5                                                            ; 3bc4: a0 05
    jmp update_brazier_and_fire                                       ; 3bc6: 4c 88 19

; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 20                                                          ; 3bc9: 14                      ; initial player X cell
    !byte 22                                                          ; 3bca: 16                      ; initial player Y cell

; ########################################
; ########################################
; #####                              #####
; #####                              #####
; #####                              #####
; #####                              #####
; #####                              #####
; #####                              #####
; #####                              #####
; 
; 
; 
; 
; 
; ###########     ############     #######
; ###########     ############     #######
; 
; 
; 
; 
; 
; #####               P              #####
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_1_code
    ldx #0                                                            ; 3bcb: a2 00
    ldy #0                                                            ; 3bcd: a0 00
    lda #$ff                                                          ; 3bcf: a9 ff
    sta width_in_cells                                                ; 3bd1: 85 3c
    lda #2                                                            ; 3bd3: a9 02
    sta height_in_cells                                               ; 3bd5: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3bd7: 20 bb 1a
; draw 5x7 rectangle at (0,2)
    ldy #2                                                            ; 3bda: a0 02
    lda #5                                                            ; 3bdc: a9 05
    sta width_in_cells                                                ; 3bde: 85 3c
    lda #7                                                            ; 3be0: a9 07
    sta height_in_cells                                               ; 3be2: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3be4: 20 bb 1a
; draw 5x7 rectangle at (35,2)
    ldx #$23 ; '#'                                                    ; 3be7: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 3be9: 20 bb 1a
; draw 11x2 rectangle at (0,14)
    ldx #0                                                            ; 3bec: a2 00
    ldy #$0e                                                          ; 3bee: a0 0e
    lda #$0b                                                          ; 3bf0: a9 0b
    sta width_in_cells                                                ; 3bf2: 85 3c
    lda #2                                                            ; 3bf4: a9 02
    sta height_in_cells                                               ; 3bf6: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3bf8: 20 bb 1a
; draw 12x2 rectangle at (16,14)
    ldx #$10                                                          ; 3bfb: a2 10
    lda #$0c                                                          ; 3bfd: a9 0c
    sta width_in_cells                                                ; 3bff: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3c01: 20 bb 1a
; draw 12x2 rectangle at (33,14)
    ldx #$21 ; '!'                                                    ; 3c04: a2 21
    jsr copy_rectangle_of_memory_to_screen                            ; 3c06: 20 bb 1a
; draw 5x1 rectangle at (0,21)
    ldx #0                                                            ; 3c09: a2 00
    ldy #$15                                                          ; 3c0b: a0 15
    lda #5                                                            ; 3c0d: a9 05
    sta width_in_cells                                                ; 3c0f: 85 3c
    lda #1                                                            ; 3c11: a9 01
    sta height_in_cells                                               ; 3c13: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c15: 20 bb 1a
; draw 5x1 rectangle at (35,21)
    ldx #$23 ; '#'                                                    ; 3c18: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 3c1a: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldx #0                                                            ; 3c1d: a2 00
    iny                                                               ; 3c1f: c8
    lda #$ff                                                          ; 3c20: a9 ff
    sta width_in_cells                                                ; 3c22: 85 3c
    inc height_in_cells                                               ; 3c24: e6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c26: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3c29: 20 90 1b
    jsr start_room                                                    ; 3c2c: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 3c2f: 20 da 12
    sta room_exit_direction                                           ; 3c32: 85 70
    and #exit_room_left                                               ; 3c34: 29 01
    beq room_1_check_right_exit                                       ; 3c36: f0 07
    ldx #0                                                            ; 3c38: a2 00
    ldy current_level                                                 ; 3c3a: a4 31
    jmp initialise_level_and_room                                     ; 3c3c: 4c 40 11

room_1_check_right_exit
    lda room_exit_direction                                           ; 3c3f: a5 70
    and #exit_room_right                                              ; 3c41: 29 04
    beq room_1_game_update_loop                                       ; 3c43: f0 ea
    ldx #2                                                            ; 3c45: a2 02
    ldy current_level                                                 ; 3c47: a4 31
    jmp initialise_level_and_room                                     ; 3c49: 4c 40 11

room_1_update_handler
    lda #1                                                            ; 3c4c: a9 01
    sta currently_updating_logic_for_room_index                       ; 3c4e: 8d ba 1a
    ldx #5                                                            ; 3c51: a2 05
    ldy #5                                                            ; 3c53: a0 05
    lda #6                                                            ; 3c55: a9 06
    jsr update_brazier_and_fire                                       ; 3c57: 20 88 19
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 3c5a: ad 2b 13
    bne c3c62                                                         ; 3c5d: d0 03
    jmp c3d2c                                                         ; 3c5f: 4c 2c 3d

; check for level change (branch if not)
c3c62
    lda current_level                                                 ; 3c62: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3c64: c5 51
    beq c3c6d                                                         ; 3c66: f0 05
    lda #$48 ; 'H'                                                    ; 3c68: a9 48
    sta level_workspace                                               ; 3c6a: 8d 6f 0a
c3c6d
    lda desired_room_index                                            ; 3c6d: a5 30
    cmp #1                                                            ; 3c6f: c9 01
    beq c3c76                                                         ; 3c71: f0 03
    jmp c3d29                                                         ; 3c73: 4c 29 3d

c3c76
    ldx #<envelope1                                                   ; 3c76: a2 d0
    ldy #>envelope1                                                   ; 3c78: a0 43
    jsr define_envelope                                               ; 3c7a: 20 5e 39
    ldx #<envelope2                                                   ; 3c7d: a2 e6
    ldy #>envelope2                                                   ; 3c7f: a0 43
    jsr define_envelope                                               ; 3c81: 20 5e 39
    lda #1                                                            ; 3c84: a9 01
    sta width_in_cells                                                ; 3c86: 85 3c
    sta height_in_cells                                               ; 3c88: 85 3d
    lda #collision_map_solid_rock                                     ; 3c8a: a9 03
    sta value_to_write_to_collision_map                               ; 3c8c: 85 3e
    ldx #$0d                                                          ; 3c8e: a2 0d
    ldy #2                                                            ; 3c90: a0 02
    lda #$c8                                                          ; 3c92: a9 c8
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3c94: 20 57 1f
    ldx #$22 ; '"'                                                    ; 3c97: a2 22
    lda #$c9                                                          ; 3c99: a9 c9
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3c9b: 20 57 1f
    dex                                                               ; 3c9e: ca
    dex                                                               ; 3c9f: ca
    lda #$ca                                                          ; 3ca0: a9 ca
loop_c3ca2
    jsr draw_sprite_a_at_cell_xy                                      ; 3ca2: 20 4c 1f
    dex                                                               ; 3ca5: ca
    cpx #$0f                                                          ; 3ca6: e0 0f
    bcs loop_c3ca2                                                    ; 3ca8: b0 f8
    ldx #$0d                                                          ; 3caa: a2 0d
    lda #$48 ; 'H'                                                    ; 3cac: a9 48
    sec                                                               ; 3cae: 38
    sbc level_workspace                                               ; 3caf: ed 6f 0a
    clc                                                               ; 3cb2: 18
    adc #$6c ; 'l'                                                    ; 3cb3: 69 6c
    lsr                                                               ; 3cb5: 4a
    lsr                                                               ; 3cb6: 4a
    lsr                                                               ; 3cb7: 4a
    tay                                                               ; 3cb8: a8
    dey                                                               ; 3cb9: 88
loop_c3cba
    lda #$cc                                                          ; 3cba: a9 cc
    jsr draw_sprite_a_at_cell_xy                                      ; 3cbc: 20 4c 1f
    lda #2                                                            ; 3cbf: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3cc1: 20 bb 1e
    dey                                                               ; 3cc4: 88
    cpy #3                                                            ; 3cc5: c0 03
    bcs loop_c3cba                                                    ; 3cc7: b0 f1
    lda #2                                                            ; 3cc9: a9 02
    jsr set_object_position_from_cell_xy                              ; 3ccb: 20 5d 1f
    tax                                                               ; 3cce: aa
    lda #$cd                                                          ; 3ccf: a9 cd
    sta object_spriteid,x                                             ; 3cd1: 9d a8 09
    ldx #$22 ; '"'                                                    ; 3cd4: a2 22
    lda level_workspace                                               ; 3cd6: ad 6f 0a
    and #4                                                            ; 3cd9: 29 04
    beq c3cec                                                         ; 3cdb: f0 0f
    lda level_workspace                                               ; 3cdd: ad 6f 0a
    sec                                                               ; 3ce0: 38
    sbc #$0c                                                          ; 3ce1: e9 0c
    lsr                                                               ; 3ce3: 4a
    lsr                                                               ; 3ce4: 4a
    lsr                                                               ; 3ce5: 4a
    tay                                                               ; 3ce6: a8
    lda #$cb                                                          ; 3ce7: a9 cb
    jsr draw_sprite_a_at_cell_xy                                      ; 3ce9: 20 4c 1f
c3cec
    lda level_workspace                                               ; 3cec: ad 6f 0a
    and #$f8                                                          ; 3cef: 29 f8
    cmp #$20 ; ' '                                                    ; 3cf1: c9 20
    beq c3d05                                                         ; 3cf3: f0 10
    lsr                                                               ; 3cf5: 4a
    lsr                                                               ; 3cf6: 4a
    lsr                                                               ; 3cf7: 4a
    tay                                                               ; 3cf8: a8
    dey                                                               ; 3cf9: 88
    dey                                                               ; 3cfa: 88
    lda #$cc                                                          ; 3cfb: a9 cc
loop_c3cfd
    jsr draw_sprite_a_at_cell_xy                                      ; 3cfd: 20 4c 1f
    dey                                                               ; 3d00: 88
    cpy #3                                                            ; 3d01: c0 03
    bcs loop_c3cfd                                                    ; 3d03: b0 f8
c3d05
    lda #3                                                            ; 3d05: a9 03
    jsr set_object_position_from_cell_xy                              ; 3d07: 20 5d 1f
    lda #4                                                            ; 3d0a: a9 04
    jsr set_object_position_from_cell_xy                              ; 3d0c: 20 5d 1f
    tax                                                               ; 3d0f: aa
    jsr l20f7                                                         ; 3d10: 20 f7 20
    lda #$c1                                                          ; 3d13: a9 c1
    sta object_z_order,x                                              ; 3d15: 9d c2 38
    ldx #3                                                            ; 3d18: a2 03
    lda #$ce                                                          ; 3d1a: a9 ce
    sta object_spriteid,x                                             ; 3d1c: 9d a8 09
    lda #$cf                                                          ; 3d1f: a9 cf
    sta object_sprite_mask_type,x                                     ; 3d21: 9d ac 38
    lda #$c0                                                          ; 3d24: a9 c0
    sta object_z_order,x                                              ; 3d26: 9d c2 38
c3d29
    jmp c3e2d                                                         ; 3d29: 4c 2d 3e

c3d2c
    lda desired_room_index                                            ; 3d2c: a5 30
    cmp #1                                                            ; 3d2e: c9 01
    bne c3d41                                                         ; 3d30: d0 0f
    lda sound_priority_per_channel_table                              ; 3d32: ad 6f 39
    cmp #$41 ; 'A'                                                    ; 3d35: c9 41
    bcs c3d41                                                         ; 3d37: b0 08
    lda #0                                                            ; 3d39: a9 00
    sta sound_priority_per_channel_table                              ; 3d3b: 8d 6f 39
    sta l3970                                                         ; 3d3e: 8d 70 39
c3d41
    lda l0a72                                                         ; 3d41: ad 72 0a
    cmp #$50 ; 'P'                                                    ; 3d44: c9 50
    bcc c3d72                                                         ; 3d46: 90 2a
    lda l0a70                                                         ; 3d48: ad 70 0a
    cmp #$5a ; 'Z'                                                    ; 3d4b: c9 5a
    beq c3d53                                                         ; 3d4d: f0 04
    cmp #$56 ; 'V'                                                    ; 3d4f: c9 56
    bne c3d72                                                         ; 3d51: d0 1f
c3d53
    lda level_workspace                                               ; 3d53: ad 6f 0a
    cmp #$20 ; ' '                                                    ; 3d56: c9 20
    beq c3d6f                                                         ; 3d58: f0 15
    lda l0a71                                                         ; 3d5a: ad 71 0a
    clc                                                               ; 3d5d: 18
    adc #4                                                            ; 3d5e: 69 04
    sta l0a71                                                         ; 3d60: 8d 71 0a
    ldx desired_room_index                                            ; 3d63: a6 30
    cpx #1                                                            ; 3d65: e0 01
    bne c3da6                                                         ; 3d67: d0 3d
    sta object_y_low + 5                                              ; 3d69: 8d 81 09
    jmp c3da6                                                         ; 3d6c: 4c a6 3d

c3d6f
    jmp return1                                                       ; 3d6f: 4c a6 3e

c3d72
    lda desired_room_index                                            ; 3d72: a5 30
    cmp #1                                                            ; 3d74: c9 01
    bne c3dd0                                                         ; 3d76: d0 58
    lda l0048                                                         ; 3d78: a5 48
    cmp #6                                                            ; 3d7a: c9 06
    bne c3dd0                                                         ; 3d7c: d0 52
    lda l09df                                                         ; 3d7e: ad df 09
    cmp #$51 ; 'Q'                                                    ; 3d81: c9 51
    beq c3d8d                                                         ; 3d83: f0 08
    cmp #$45 ; 'E'                                                    ; 3d85: c9 45
    beq c3d8d                                                         ; 3d87: f0 04
    cmp #$49 ; 'I'                                                    ; 3d89: c9 49
    bne c3dd0                                                         ; 3d8b: d0 43
c3d8d
    lda level_workspace                                               ; 3d8d: ad 6f 0a
    cmp #$20 ; ' '                                                    ; 3d90: c9 20
    beq c3d6f                                                         ; 3d92: f0 db
    lda object_y_low                                                  ; 3d94: ad 7c 09
    clc                                                               ; 3d97: 18
    adc #4                                                            ; 3d98: 69 04
    sta object_y_low                                                  ; 3d9a: 8d 7c 09
    lda object_y_low+1                                                ; 3d9d: ad 7d 09
    clc                                                               ; 3da0: 18
    adc #4                                                            ; 3da1: 69 04
    sta object_y_low+1                                                ; 3da3: 8d 7d 09
c3da6
    lda level_workspace                                               ; 3da6: ad 6f 0a
    sec                                                               ; 3da9: 38
    sbc #4                                                            ; 3daa: e9 04
    sta level_workspace                                               ; 3dac: 8d 6f 0a
    lda desired_room_index                                            ; 3daf: a5 30
    cmp #1                                                            ; 3db1: c9 01
    bne c3d6f                                                         ; 3db3: d0 ba
    jsr sub_c3ea9                                                     ; 3db5: 20 a9 3e
    ldx #4                                                            ; 3db8: a2 04
    lda level_workspace                                               ; 3dba: ad 6f 0a
    sec                                                               ; 3dbd: 38
    sbc #8                                                            ; 3dbe: e9 08
    sta object_y_low_old,x                                            ; 3dc0: 9d 87 09
    lda #$cb                                                          ; 3dc3: a9 cb
    sta object_spriteid_old,x                                         ; 3dc5: 9d b3 09
    lda #0                                                            ; 3dc8: a9 00
    sta object_spriteid,x                                             ; 3dca: 9d a8 09
    jmp c3e2d                                                         ; 3dcd: 4c 2d 3e

c3dd0
    lda level_workspace                                               ; 3dd0: ad 6f 0a
    cmp #$48 ; 'H'                                                    ; 3dd3: c9 48
    bne c3dda                                                         ; 3dd5: d0 03
    jmp return1                                                       ; 3dd7: 4c a6 3e

c3dda
    ldx #$0c                                                          ; 3dda: a2 0c
    ldy #$cb                                                          ; 3ddc: a0 cb
    adc #4                                                            ; 3dde: 69 04
    cmp #$48 ; 'H'                                                    ; 3de0: c9 48
    beq c3dea                                                         ; 3de2: f0 06
    ldx #$10                                                          ; 3de4: a2 10
    ldy #$cc                                                          ; 3de6: a0 cc
    adc #4                                                            ; 3de8: 69 04
c3dea
    sta level_workspace                                               ; 3dea: 8d 6f 0a
    stx l3ea7                                                         ; 3ded: 8e a7 3e
    sty l3ea8                                                         ; 3df0: 8c a8 3e
    lda desired_room_index                                            ; 3df3: a5 30
    cmp #1                                                            ; 3df5: c9 01
    bne c3e2d                                                         ; 3df7: d0 34
    lda level_workspace                                               ; 3df9: ad 6f 0a
    cmp #$48 ; 'H'                                                    ; 3dfc: c9 48
    beq c3e06                                                         ; 3dfe: f0 06
    jsr sub_c3ea9                                                     ; 3e00: 20 a9 3e
    jmp c3e16                                                         ; 3e03: 4c 16 3e

c3e06
    lda #0                                                            ; 3e06: a9 00
    ldx #<sound1                                                      ; 3e08: a2 fc
    ldy #>sound1                                                      ; 3e0a: a0 43
    jsr play_sound_yx                                                 ; 3e0c: 20 f6 38
    ldx #<sound2                                                      ; 3e0f: a2 f4
    ldy #>sound2                                                      ; 3e11: a0 43
    jsr play_sound_yx                                                 ; 3e13: 20 f6 38
c3e16
    ldx #4                                                            ; 3e16: a2 04
    lda level_workspace                                               ; 3e18: ad 6f 0a
    sec                                                               ; 3e1b: 38
    sbc l3ea7                                                         ; 3e1c: ed a7 3e
    sta object_y_low,x                                                ; 3e1f: 9d 7c 09
    lda #0                                                            ; 3e22: a9 00
    sta object_spriteid_old,x                                         ; 3e24: 9d b3 09
    lda l3ea8                                                         ; 3e27: ad a8 3e
    sta object_spriteid,x                                             ; 3e2a: 9d a8 09
c3e2d
    lda desired_room_index                                            ; 3e2d: a5 30
    cmp #1                                                            ; 3e2f: c9 01
    bne return1                                                       ; 3e31: d0 73
    ldx #2                                                            ; 3e33: a2 02
    lda #0                                                            ; 3e35: a9 00
    sta object_spriteid_old,x                                         ; 3e37: 9d b3 09
    lda #$48 ; 'H'                                                    ; 3e3a: a9 48
    sec                                                               ; 3e3c: 38
    sbc level_workspace                                               ; 3e3d: ed 6f 0a
    clc                                                               ; 3e40: 18
    adc #$68 ; 'h'                                                    ; 3e41: 69 68
    sta object_y_low,x                                                ; 3e43: 9d 7c 09
    ldx #$0d                                                          ; 3e46: a2 0d
    clc                                                               ; 3e48: 18
    adc #4                                                            ; 3e49: 69 04
    lsr                                                               ; 3e4b: 4a
    lsr                                                               ; 3e4c: 4a
    lsr                                                               ; 3e4d: 4a
    tay                                                               ; 3e4e: a8
    lda #2                                                            ; 3e4f: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3e51: 20 bb 1e
    iny                                                               ; 3e54: c8
    lda #0                                                            ; 3e55: a9 00
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3e57: 20 bb 1e
    lda level_workspace                                               ; 3e5a: ad 6f 0a
    sta object_y_low + 3                                              ; 3e5d: 8d 7f 09
    ldx #$22 ; '"'                                                    ; 3e60: a2 22
    ldy #9                                                            ; 3e62: a0 09
    lda #1                                                            ; 3e64: a9 01
    sta width_in_cells                                                ; 3e66: 85 3c
    lda #5                                                            ; 3e68: a9 05
    sta height_in_cells                                               ; 3e6a: 85 3d
    lda #collision_map_solid_rock                                     ; 3e6c: a9 03
    sta value_to_write_to_collision_map                               ; 3e6e: 85 3e
    lda level_workspace                                               ; 3e70: ad 6f 0a
    cmp #$48 ; 'H'                                                    ; 3e73: c9 48
    beq c3e7b                                                         ; 3e75: f0 04
    lda #collision_map_none                                           ; 3e77: a9 00
    sta value_to_write_to_collision_map                               ; 3e79: 85 3e
c3e7b
    jsr read_collision_map_value_for_xy                               ; 3e7b: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3e7e: c5 3e
    beq c3e85                                                         ; 3e80: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e82: 20 44 1e
c3e85
    ldx #objectid_player                                              ; 3e85: a2 00
    ldy #3                                                            ; 3e87: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 3e89: 20 e2 28
    beq return1                                                       ; 3e8c: f0 18
    lda #$fa                                                          ; 3e8e: a9 fa
    sta player_wall_collision_flag                                    ; 3e90: 8d 33 24
    lda object_x_high                                                 ; 3e93: ad 66 09
    cmp #1                                                            ; 3e96: c9 01
    bne return1                                                       ; 3e98: d0 0c
    lda object_x_low                                                  ; 3e9a: ad 50 09
    cmp #$14                                                          ; 3e9d: c9 14
    bcc return1                                                       ; 3e9f: 90 05
    lda #6                                                            ; 3ea1: a9 06
    sta player_wall_collision_flag                                    ; 3ea3: 8d 33 24
return1
    rts                                                               ; 3ea6: 60

l3ea7
    !byte 0                                                           ; 3ea7: 00
l3ea8
    !byte 0                                                           ; 3ea8: 00

sub_c3ea9
    lda #$40 ; '@'                                                    ; 3ea9: a9 40
    ldx #<sound3                                                      ; 3eab: a2 de
    ldy #>sound3                                                      ; 3ead: a0 43
    jsr play_sound_yx                                                 ; 3eaf: 20 f6 38
    rts                                                               ; 3eb2: 60

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 20                                                          ; 3eb3: 14                      ; initial player X cell
    !byte 22                                                          ; 3eb4: 16                      ; initial player Y cell

; ########################################
; ########################################
; #####                            |  ####
; #####                            |   ###
; #####                            |   ###
; #####                            |   ###
; #####                            |   ###
; #####                            |   ###
; #####                            |   ###
;                                  |   ###
;                                  |   ###
;                                  |   ###
;             OOO          OOO     |   ###
;             OOO          OOO     |   ###
; #######     ################     |   ###
; #######     ################     |   ###
;                                      ###
;                                      ###
;                                   OOO###
;                                   OOO###
;                                OOOOOO###
; #####               P          OOOOOO###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_2_code
    ldx #0                                                            ; 3eb5: a2 00
    ldy #0                                                            ; 3eb7: a0 00
    lda #$ff                                                          ; 3eb9: a9 ff
    sta width_in_cells                                                ; 3ebb: 85 3c
    lda #2                                                            ; 3ebd: a9 02
    sta height_in_cells                                               ; 3ebf: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ec1: 20 bb 1a
; draw 5x7 rectangle at (0,2)
    ldy #2                                                            ; 3ec4: a0 02
    lda #5                                                            ; 3ec6: a9 05
    sta width_in_cells                                                ; 3ec8: 85 3c
    lda #7                                                            ; 3eca: a9 07
    sta height_in_cells                                               ; 3ecc: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ece: 20 bb 1a
; draw 5x1 rectangle at (36,2)
    ldx #$24 ; '$'                                                    ; 3ed1: a2 24
    lda #1                                                            ; 3ed3: a9 01
    sta height_in_cells                                               ; 3ed5: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ed7: 20 bb 1a
; draw 5x19 rectangle at (37,3)
    inx                                                               ; 3eda: e8
    iny                                                               ; 3edb: c8
    lda #$13                                                          ; 3edc: a9 13
    sta height_in_cells                                               ; 3ede: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ee0: 20 bb 1a
; draw 5x1 rectangle at (0,21)
    ldx #0                                                            ; 3ee3: a2 00
    ldy #$15                                                          ; 3ee5: a0 15
    lda #5                                                            ; 3ee7: a9 05
    sta width_in_cells                                                ; 3ee9: 85 3c
    lda #1                                                            ; 3eeb: a9 01
    sta height_in_cells                                               ; 3eed: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3eef: 20 bb 1a
; draw 255x255 rectangle at (0,22)
    ldx #0                                                            ; 3ef2: a2 00
    iny                                                               ; 3ef4: c8
    lda #$ff                                                          ; 3ef5: a9 ff
    sta width_in_cells                                                ; 3ef7: 85 3c
    sta height_in_cells                                               ; 3ef9: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3efb: 20 bb 1a
; draw 7x2 rectangle at (0,14)
    ldx #0                                                            ; 3efe: a2 00
    ldy #$0e                                                          ; 3f00: a0 0e
    lda #7                                                            ; 3f02: a9 07
    sta width_in_cells                                                ; 3f04: 85 3c
    lda #2                                                            ; 3f06: a9 02
    sta height_in_cells                                               ; 3f08: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f0a: 20 bb 1a
; draw 16x2 rectangle at (12,14)
    ldx #$0c                                                          ; 3f0d: a2 0c
    lda #$10                                                          ; 3f0f: a9 10
    sta width_in_cells                                                ; 3f11: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3f13: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3f16: 20 90 1b
; draw sprite $d0 at (12,12) of size (3x2)
    lda #3                                                            ; 3f19: a9 03
    sta width_in_cells                                                ; 3f1b: 85 3c
    lda #2                                                            ; 3f1d: a9 02
    sta height_in_cells                                               ; 3f1f: 85 3d
    lda #$d0                                                          ; 3f21: a9 d0
    ldx #$0c                                                          ; 3f23: a2 0c
    ldy #$0c                                                          ; 3f25: a0 0c
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3f27: 20 57 1f
; draw sprite $d0 at (25,12) of size (3x2)
    ldx #$19                                                          ; 3f2a: a2 19
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3f2c: 20 57 1f
; draw sprite $d0 at (31,20) of size (3x2)
    ldx #$1f                                                          ; 3f2f: a2 1f
    ldy #$14                                                          ; 3f31: a0 14
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3f33: 20 57 1f
; draw sprite $d0 at (34,20) of size (3x2)
    ldx #$22 ; '"'                                                    ; 3f36: a2 22
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3f38: 20 57 1f
; draw sprite $d0 at (34,18) of size (3x2)
    ldy #$12                                                          ; 3f3b: a0 12
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3f3d: 20 57 1f
; draw rope at (33,2) length 14
    ldx #$21 ; '!'                                                    ; 3f40: a2 21
    ldy #2                                                            ; 3f42: a0 02
    lda #$0e                                                          ; 3f44: a9 0e
    jsr draw_rope                                                     ; 3f46: 20 b9 1d
    jsr start_room                                                    ; 3f49: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 3f4c: 20 da 12
    and #exit_room_left                                               ; 3f4f: 29 01
    beq room_2_game_update_loop                                       ; 3f51: f0 f9
    ldx #1                                                            ; 3f53: a2 01
    ldy current_level                                                 ; 3f55: a4 31
    jmp initialise_level_and_room                                     ; 3f57: 4c 40 11

room_2_update_handler
    lda #2                                                            ; 3f5a: a9 02
    sta currently_updating_logic_for_room_index                       ; 3f5c: 8d ba 1a
    lda #2                                                            ; 3f5f: a9 02
    ldx #5                                                            ; 3f61: a2 05
    ldy #5                                                            ; 3f63: a0 05
    jsr update_brazier_and_fire                                       ; 3f65: 20 88 19
    lda #3                                                            ; 3f68: a9 03
    ldx #$14                                                          ; 3f6a: a2 14
    ldy #$0e                                                          ; 3f6c: a0 0e
    jsr update_level_completion                                       ; 3f6e: 20 10 1a
    rts                                                               ; 3f71: 60

l3f72
    !byte $de,   0,   0, $de,   0,   0, $de,   0,   0, $de,   0,   0  ; 3f72: de 00 00...
    !byte $de,   0,   0, $de,   0,   0, $de,   0,   0, $de,   0,   0  ; 3f7e: de 00 00...
    !byte   0, $d6,   0,   0,   0, $d2,   1,   0, $d3,   1,   0, $d4  ; 3f8a: 00 d6 00...
    !byte   1,   0, $d5,   1,   0,   0, $d9,   1, $fb, $d9,   1, $fc  ; 3f96: 01 00 d5...
    !byte $d9,   1, $fd, $d9,   1, $fd, $d9,   1, $fe, $d9,   1, $fe  ; 3fa2: d9 01 fd...
    !byte $d9,   1, $ff,   0, $d9,   1,   1, $d9,   1,   2, $d9,   1  ; 3fae: d9 01 ff...
    !byte   2, $d9,   1,   3, $d9,   1,   3, $d9,   1,   4, $d9,   1  ; 3fba: 02 d9 01...
    !byte   5,   0, $d7,   0,   0,   0, $d8,   0, $fc, $d7,   0, $fc  ; 3fc6: 05 00 d7...
    !byte   0                                                         ; 3fd2: 00

; check for first update in room (branch if not)
sub_c3fd3
    lda update_room_first_update_flag                                 ; 3fd3: ad 2b 13
    beq c4010                                                         ; 3fd6: f0 38
; check for level change (branch if not)
    lda current_level                                                 ; 3fd8: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3fda: c5 51
    beq c3ff8                                                         ; 3fdc: f0 1a
    lda #$22 ; '"'                                                    ; 3fde: a9 22
    sta l0a72                                                         ; 3fe0: 8d 72 0a
    lda #$6e ; 'n'                                                    ; 3fe3: a9 6e
    sta l0a71                                                         ; 3fe5: 8d 71 0a
    lda #1                                                            ; 3fe8: a9 01
    sta l0a73                                                         ; 3fea: 8d 73 0a
    lda #$19                                                          ; 3fed: a9 19
    sta l0a70                                                         ; 3fef: 8d 70 0a
    sta l0a74                                                         ; 3ff2: 8d 74 0a
    jsr sub_c4261                                                     ; 3ff5: 20 61 42
c3ff8
    lda desired_room_index                                            ; 3ff8: a5 30
    cmp #2                                                            ; 3ffa: c9 02
    bcs c400d                                                         ; 3ffc: b0 0f
    lda #$d1                                                          ; 3ffe: a9 d1
    sta l38b1                                                         ; 4000: 8d b1 38
    lda #$c0                                                          ; 4003: a9 c0
    sta l38c7                                                         ; 4005: 8d c7 38
    lda #0                                                            ; 4008: a9 00
    sta object_y_high + 5                                             ; 400a: 8d 97 09
c400d
    jmp c41f5                                                         ; 400d: 4c f5 41

c4010
    lda object_x_high                                                 ; 4010: ad 66 09
    lsr                                                               ; 4013: 4a
    sta l0070                                                         ; 4014: 85 70
    lda object_x_low                                                  ; 4016: ad 50 09
    ror                                                               ; 4019: 6a
    lsr l0070                                                         ; 401a: 46 70
    ror                                                               ; 401c: 6a
    ldx desired_room_index                                            ; 401d: a6 30
    beq c402b                                                         ; 401f: f0 0a
    clc                                                               ; 4021: 18
    adc #$50 ; 'P'                                                    ; 4022: 69 50
    cpx #1                                                            ; 4024: e0 01
    beq c402b                                                         ; 4026: f0 03
    clc                                                               ; 4028: 18
    adc #$50 ; 'P'                                                    ; 4029: 69 50
c402b
    ldx #0                                                            ; 402b: a2 00
    sec                                                               ; 402d: 38
    sbc l0a72                                                         ; 402e: ed 72 0a
    beq c4039                                                         ; 4031: f0 06
    ldx #1                                                            ; 4033: a2 01
    bcs c4039                                                         ; 4035: b0 02
    ldx #$ff                                                          ; 4037: a2 ff
c4039
    stx l426d                                                         ; 4039: 8e 6d 42
    lda l0a74                                                         ; 403c: ad 74 0a
    clc                                                               ; 403f: 18
    adc #3                                                            ; 4040: 69 03
    tay                                                               ; 4042: a8
    lda l3f72,y                                                       ; 4043: b9 72 3f
    bne c404b                                                         ; 4046: d0 03
    ldy l0a70                                                         ; 4048: ac 70 0a
c404b
    lda l0a75                                                         ; 404b: ad 75 0a
    beq c4053                                                         ; 404e: f0 03
    dec l0a75                                                         ; 4050: ce 75 0a
c4053
    lda l0a70                                                         ; 4053: ad 70 0a
    cmp #$2a ; '*'                                                    ; 4056: c9 2a
    bne c407a                                                         ; 4058: d0 20
    cpy l0a70                                                         ; 405a: cc 70 0a
    bne c4092                                                         ; 405d: d0 33
    ldy #$56 ; 'V'                                                    ; 405f: a0 56
    sty l0a70                                                         ; 4061: 8c 70 0a
    lda #4                                                            ; 4064: a9 04
    sta l0a75                                                         ; 4066: 8d 75 0a
    lda l0a72                                                         ; 4069: ad 72 0a
    cmp #$50 ; 'P'                                                    ; 406c: c9 50
    bcc c4092                                                         ; 406e: 90 22
    ldy #$5a ; 'Z'                                                    ; 4070: a0 5a
    sty l0a70                                                         ; 4072: 8c 70 0a
    lda #0                                                            ; 4075: a9 00
    sta l0a75                                                         ; 4077: 8d 75 0a
c407a
    lda l0a70                                                         ; 407a: ad 70 0a
    cmp #$5a ; 'Z'                                                    ; 407d: c9 5a
    bne c4095                                                         ; 407f: d0 14
    lda level_workspace                                               ; 4081: ad 6f 0a
    cmp #$20 ; ' '                                                    ; 4084: c9 20
    bne c4092                                                         ; 4086: d0 0a
    ldy #$56 ; 'V'                                                    ; 4088: a0 56
    sty l0a70                                                         ; 408a: 8c 70 0a
    lda #4                                                            ; 408d: a9 04
    sta l0a75                                                         ; 408f: 8d 75 0a
c4092
    jmp c4152                                                         ; 4092: 4c 52 41

c4095
    lda l0a70                                                         ; 4095: ad 70 0a
    cmp #$40 ; '@'                                                    ; 4098: c9 40
    bne c40a9                                                         ; 409a: d0 0d
    cpy l0a70                                                         ; 409c: cc 70 0a
    bne c4092                                                         ; 409f: d0 f1
    ldy #$19                                                          ; 40a1: a0 19
    sty l0a70                                                         ; 40a3: 8c 70 0a
    jsr sub_c4261                                                     ; 40a6: 20 61 42
c40a9
    lda player_held_object_spriteid                                   ; 40a9: a5 52
    cmp #$db                                                          ; 40ab: c9 db
    bne c40d7                                                         ; 40ad: d0 28
    lda object_y_low                                                  ; 40af: ad 7c 09
    cmp #$70 ; 'p'                                                    ; 40b2: c9 70
    bcs c40d7                                                         ; 40b4: b0 21
    ldx desired_room_index                                            ; 40b6: a6 30
    beq c40e1                                                         ; 40b8: f0 27
    cpx #3                                                            ; 40ba: e0 03
    bcs c40d7                                                         ; 40bc: b0 19
    lda level_workspace                                               ; 40be: ad 6f 0a
    cmp #$20 ; ' '                                                    ; 40c1: c9 20
    beq c40e1                                                         ; 40c3: f0 1c
    cpx #2                                                            ; 40c5: e0 02
    beq c40d7                                                         ; 40c7: f0 0e
    lda object_x_high                                                 ; 40c9: ad 66 09
    cmp #1                                                            ; 40cc: c9 01
    bne c40e1                                                         ; 40ce: d0 11
    lda object_x_low                                                  ; 40d0: ad 50 09
    cmp #$10                                                          ; 40d3: c9 10
    bcc c40e1                                                         ; 40d5: 90 0a
c40d7
    lda l0a70                                                         ; 40d7: ad 70 0a
    cmp #$56 ; 'V'                                                    ; 40da: c9 56
    beq c4092                                                         ; 40dc: f0 b4
    jmp c4144                                                         ; 40de: 4c 44 41

c40e1
    lda l426d                                                         ; 40e1: ad 6d 42
    beq c4152                                                         ; 40e4: f0 6c
    sta l0a73                                                         ; 40e6: 8d 73 0a
    lda l0a70                                                         ; 40e9: ad 70 0a
    cmp #$56 ; 'V'                                                    ; 40ec: c9 56
    bne c40fd                                                         ; 40ee: d0 0d
    lda l0a75                                                         ; 40f0: ad 75 0a
    bne c4152                                                         ; 40f3: d0 5d
    ldy #$40 ; '@'                                                    ; 40f5: a0 40
    sty l0a70                                                         ; 40f7: 8c 70 0a
    jmp c4152                                                         ; 40fa: 4c 52 41

c40fd
    lda l0a73                                                         ; 40fd: ad 73 0a
    bmi c4118                                                         ; 4100: 30 16
    lda l0a72                                                         ; 4102: ad 72 0a
    cmp #$2e ; '.'                                                    ; 4105: c9 2e
    bcc c4136                                                         ; 4107: 90 2d
    beq c412e                                                         ; 4109: f0 23
    cmp #$64 ; 'd'                                                    ; 410b: c9 64
    bcc c4136                                                         ; 410d: 90 27
    beq c412e                                                         ; 410f: f0 1d
    cmp #$86                                                          ; 4111: c9 86
    bcc c4136                                                         ; 4113: 90 21
    jmp c4144                                                         ; 4115: 4c 44 41

c4118
    lda l0a72                                                         ; 4118: ad 72 0a
    cmp #$72 ; 'r'                                                    ; 411b: c9 72
    beq c412e                                                         ; 411d: f0 0f
    bcs c4136                                                         ; 411f: b0 15
    cmp #$3c ; '<'                                                    ; 4121: c9 3c
    beq c412e                                                         ; 4123: f0 09
    bcs c4136                                                         ; 4125: b0 0f
    cmp #$17                                                          ; 4127: c9 17
    bcs c4136                                                         ; 4129: b0 0b
    jmp c4144                                                         ; 412b: 4c 44 41

c412e
    ldy #$2a ; '*'                                                    ; 412e: a0 2a
    sty l0a70                                                         ; 4130: 8c 70 0a
    jmp c4152                                                         ; 4133: 4c 52 41

c4136
    lda #$1d                                                          ; 4136: a9 1d
    cmp l0a70                                                         ; 4138: cd 70 0a
    beq c4152                                                         ; 413b: f0 15
    tay                                                               ; 413d: a8
    sty l0a70                                                         ; 413e: 8c 70 0a
    jmp c4152                                                         ; 4141: 4c 52 41

c4144
    lda #$19                                                          ; 4144: a9 19
    cmp l0a70                                                         ; 4146: cd 70 0a
    beq c4152                                                         ; 4149: f0 07
    tay                                                               ; 414b: a8
    sty l0a70                                                         ; 414c: 8c 70 0a
    jsr sub_c4261                                                     ; 414f: 20 61 42
c4152
    lda desired_room_index                                            ; 4152: a5 30
    cmp #3                                                            ; 4154: c9 03
    bcs c41c3                                                         ; 4156: b0 6b
    ldx #0                                                            ; 4158: a2 00
    sty l426e                                                         ; 415a: 8c 6e 42
    ldy #5                                                            ; 415d: a0 05
    jsr test_for_collision_between_objects_x_and_y                    ; 415f: 20 e2 28
    ldy l426e                                                         ; 4162: ac 6e 42
    ora #0                                                            ; 4165: 09 00
    beq c41c3                                                         ; 4167: f0 5a
    lda l0a16                                                         ; 4169: ad 16 0a
    cmp #$ff                                                          ; 416c: c9 ff
    bne c4186                                                         ; 416e: d0 16
    lda player_held_object_spriteid                                   ; 4170: a5 52
    cmp #$db                                                          ; 4172: c9 db
    bne c4186                                                         ; 4174: d0 10
    jsr remove_item_from_toolbar_menu                                 ; 4176: 20 e0 2b
    lda #0                                                            ; 4179: a9 00
    sta player_held_object_spriteid                                   ; 417b: 85 52
    sta object_spriteid+1                                             ; 417d: 8d a9 09
    sta player_using_object_spriteid                                  ; 4180: 8d b6 2e
    sta l0a16                                                         ; 4183: 8d 16 0a
c4186
    lda #$80                                                          ; 4186: a9 80
    sta player_wall_collision_flag                                    ; 4188: 8d 33 24
    lda l0a70                                                         ; 418b: ad 70 0a
    cmp #$5a ; 'Z'                                                    ; 418e: c9 5a
    beq c41c3                                                         ; 4190: f0 31
    cmp #$56 ; 'V'                                                    ; 4192: c9 56
    beq c41c3                                                         ; 4194: f0 2d
    lda #6                                                            ; 4196: a9 06
    ldx l426d                                                         ; 4198: ae 6d 42
    bpl c419f                                                         ; 419b: 10 02
    lda #$fa                                                          ; 419d: a9 fa
c419f
    sta player_wall_collision_flag                                    ; 419f: 8d 33 24
    lda l0a70                                                         ; 41a2: ad 70 0a
    cmp #$2a ; '*'                                                    ; 41a5: c9 2a
    beq c41c3                                                         ; 41a7: f0 1a
    cmp #$40 ; '@'                                                    ; 41a9: c9 40
    beq c41c3                                                         ; 41ab: f0 16
    lda #1                                                            ; 41ad: a9 01
    ldx l426d                                                         ; 41af: ae 6d 42
    bpl c41b6                                                         ; 41b2: 10 02
    lda #$ff                                                          ; 41b4: a9 ff
c41b6
    sta l0a73                                                         ; 41b6: 8d 73 0a
    ldy #$19                                                          ; 41b9: a0 19
    sty l0a70                                                         ; 41bb: 8c 70 0a
    ldy #0                                                            ; 41be: a0 00
    jsr sub_c4261                                                     ; 41c0: 20 61 42
c41c3
    lda l0a70                                                         ; 41c3: ad 70 0a
    cmp #$19                                                          ; 41c6: c9 19
    bne c41d2                                                         ; 41c8: d0 08
    lda l0a75                                                         ; 41ca: ad 75 0a
    bne c41d2                                                         ; 41cd: d0 03
    jsr sub_c4261                                                     ; 41cf: 20 61 42
c41d2
    sty l0a74                                                         ; 41d2: 8c 74 0a
    iny                                                               ; 41d5: c8
    lda l3f72,y                                                       ; 41d6: b9 72 3f
    ldx l0a73                                                         ; 41d9: ae 73 0a
    bpl c41e3                                                         ; 41dc: 10 05
    eor #$ff                                                          ; 41de: 49 ff
    clc                                                               ; 41e0: 18
    adc #1                                                            ; 41e1: 69 01
c41e3
    clc                                                               ; 41e3: 18
    adc l0a72                                                         ; 41e4: 6d 72 0a
    sta l0a72                                                         ; 41e7: 8d 72 0a
    iny                                                               ; 41ea: c8
    lda l3f72,y                                                       ; 41eb: b9 72 3f
    clc                                                               ; 41ee: 18
    adc l0a71                                                         ; 41ef: 6d 71 0a
    sta l0a71                                                         ; 41f2: 8d 71 0a
c41f5
    lda desired_room_index                                            ; 41f5: a5 30
    cmp #2                                                            ; 41f7: c9 02
    bcs return2                                                       ; 41f9: b0 65
    ldy l0a74                                                         ; 41fb: ac 74 0a
    lda l3f72,y                                                       ; 41fe: b9 72 3f
    sta object_spriteid + 5                                           ; 4201: 8d ad 09
    lda l0a73                                                         ; 4204: ad 73 0a
    sta object_direction + 5                                          ; 4207: 8d c3 09
    lda l0a71                                                         ; 420a: ad 71 0a
    sta object_y_low + 5                                              ; 420d: 8d 81 09
    lda l0a72                                                         ; 4210: ad 72 0a
    ldx desired_room_index                                            ; 4213: a6 30
    beq c421a                                                         ; 4215: f0 03
    sec                                                               ; 4217: 38
    sbc #$50 ; 'P'                                                    ; 4218: e9 50
c421a
    ldx #0                                                            ; 421a: a2 00
    cmp #$a0                                                          ; 421c: c9 a0
    bcc c4221                                                         ; 421e: 90 01
    dex                                                               ; 4220: ca
c4221
    stx object_x_high + 5                                             ; 4221: 8e 6b 09
    asl                                                               ; 4224: 0a
    rol object_x_high + 5                                             ; 4225: 2e 6b 09
    asl                                                               ; 4228: 0a
    rol object_x_high + 5                                             ; 4229: 2e 6b 09
    sta object_x_low + 5                                              ; 422c: 8d 55 09
    lda l0a73                                                         ; 422f: ad 73 0a
    bpl c4245                                                         ; 4232: 10 11
    lda object_x_low + 5                                              ; 4234: ad 55 09
    sec                                                               ; 4237: 38
    sbc #1                                                            ; 4238: e9 01
    sta object_x_low + 5                                              ; 423a: 8d 55 09
    lda object_x_high + 5                                             ; 423d: ad 6b 09
    sbc #0                                                            ; 4240: e9 00
    sta object_x_high + 5                                             ; 4242: 8d 6b 09
; check for first update in room (branch if so)
c4245
    lda update_room_first_update_flag                                 ; 4245: ad 2b 13
    bne return2                                                       ; 4248: d0 16
    lda l0a70                                                         ; 424a: ad 70 0a
    cmp #$40 ; '@'                                                    ; 424d: c9 40
    bne return2                                                       ; 424f: d0 0f
    lda #2                                                            ; 4251: a9 02
    sta temp_bottom_offset                                            ; 4253: 8d 51 25
    lda #5                                                            ; 4256: a9 05
    jsr get_solid_rock_collision_for_object_a                         ; 4258: 20 94 28
    beq return2                                                       ; 425b: f0 03
    jsr play_landing_sound                                            ; 425d: 20 a9 23
return2
    rts                                                               ; 4260: 60

sub_c4261
    lda #$1f                                                          ; 4261: a9 1f
    jsr get_random_number_up_to_a                                     ; 4263: 20 a6 18
    clc                                                               ; 4266: 18
    adc #$20 ; ' '                                                    ; 4267: 69 20
    sta l0a75                                                         ; 4269: 8d 75 0a
    rts                                                               ; 426c: 60

l426d
    !byte 0                                                           ; 426d: 00
l426e
    !byte 0                                                           ; 426e: 00
; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 20                                                          ; 426f: 14                      ; initial player X cell
    !byte 10                                                          ; 4270: 0a                      ; initial player Y cell

; ###   |   ##############################
; ###   |   ##############################
; ###   |                              ###
; ###   |                              ###
; ###   |                              ###
; ###   |                              ###
; ###   |                              ###
; ###   |                              ###
; ###   |                              ###
; ###   |             P                ###
; ###   |   ####################       ###
; ###   |   ####################       ###
; ###   |                              ###
; ###   |                              ###
; ###   |                              ###
; ###                                  ###
; ###                                  ###
; ##########                    ##########
; ##########OOO                 ##########
; ##########OOO                 ##########
; ##########OOOOOO              ##########
; ##########OOOOOO              ##########
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 27x2 rectangle at (10,0)
room_3_code
    ldx #$0a                                                          ; 4271: a2 0a
    ldy #0                                                            ; 4273: a0 00
    lda #$1b                                                          ; 4275: a9 1b
    sta width_in_cells                                                ; 4277: 85 3c
    lda #2                                                            ; 4279: a9 02
    sta height_in_cells                                               ; 427b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 427d: 20 bb 1a
; draw 3x17 rectangle at (0,0)
    ldx #0                                                            ; 4280: a2 00
    lda #3                                                            ; 4282: a9 03
    sta width_in_cells                                                ; 4284: 85 3c
    lda #$11                                                          ; 4286: a9 11
    sta height_in_cells                                               ; 4288: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 428a: 20 bb 1a
; draw 3x17 rectangle at (37,0)
    ldx #$25 ; '%'                                                    ; 428d: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 428f: 20 bb 1a
; draw 10x5 rectangle at (0,17)
    ldx #0                                                            ; 4292: a2 00
    ldy #$11                                                          ; 4294: a0 11
    lda #$0a                                                          ; 4296: a9 0a
    sta width_in_cells                                                ; 4298: 85 3c
    lda #5                                                            ; 429a: a9 05
    sta height_in_cells                                               ; 429c: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 429e: 20 bb 1a
; draw 10x5 rectangle at (30,17)
    ldx #$1e                                                          ; 42a1: a2 1e
    jsr copy_rectangle_of_memory_to_screen                            ; 42a3: 20 bb 1a
; draw 255x5 rectangle at (0,22)
    ldx #0                                                            ; 42a6: a2 00
    ldy #$16                                                          ; 42a8: a0 16
    lda #$ff                                                          ; 42aa: a9 ff
    sta width_in_cells                                                ; 42ac: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 42ae: 20 bb 1a
; draw 20x2 rectangle at (10,10)
    ldx #$0a                                                          ; 42b1: a2 0a
    ldy #$0a                                                          ; 42b3: a0 0a
    lda #$14                                                          ; 42b5: a9 14
    sta width_in_cells                                                ; 42b7: 85 3c
    lda #2                                                            ; 42b9: a9 02
    sta height_in_cells                                               ; 42bb: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42bd: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 42c0: 20 90 1b
; draw sprite $d0 at (13,20) of size (3x2)
    lda #3                                                            ; 42c3: a9 03
    sta width_in_cells                                                ; 42c5: 85 3c
    lda #2                                                            ; 42c7: a9 02
    sta height_in_cells                                               ; 42c9: 85 3d
    lda #$d0                                                          ; 42cb: a9 d0
    ldx #$0d                                                          ; 42cd: a2 0d
    ldy #$14                                                          ; 42cf: a0 14
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 42d1: 20 57 1f
; draw sprite $d0 at (10,20) of size (3x2)
    ldx #$0a                                                          ; 42d4: a2 0a
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 42d6: 20 57 1f
; draw sprite $d0 at (10,18) of size (3x2)
    ldy #$12                                                          ; 42d9: a0 12
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 42db: 20 57 1f
; draw rope at (6,0) length 15
    ldx #6                                                            ; 42de: a2 06
    ldy #0                                                            ; 42e0: a0 00
    lda #$0f                                                          ; 42e2: a9 0f
    jsr draw_rope                                                     ; 42e4: 20 b9 1d
    jsr start_room                                                    ; 42e7: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 42ea: 20 da 12
    and #exit_room_top                                                ; 42ed: 29 08
    beq room_3_game_update_loop                                       ; 42ef: f0 f9
    ldx #0                                                            ; 42f1: a2 00
    ldy current_level                                                 ; 42f3: a4 31
    jmp initialise_level_and_room                                     ; 42f5: 4c 40 11

; check for first update in room (branch if not)
sub_c42f8
    lda update_room_first_update_flag                                 ; 42f8: ad 2b 13
    beq c434d                                                         ; 42fb: f0 50
    lda #$db                                                          ; 42fd: a9 db
    sta toolbar_collectable_spriteids+1                               ; 42ff: 8d e9 2e
    lda #$da                                                          ; 4302: a9 da
    sta collectable_spriteids+1                                       ; 4304: 8d ee 2e
    sta five_byte_table_paired_with_collectable_sprite_ids + 1        ; 4307: 8d f3 2e
; check for level change (branch if not)
    lda current_level                                                 ; 430a: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 430c: c5 51
    beq c431e                                                         ; 430e: f0 0e
    lda l0a16                                                         ; 4310: ad 16 0a
    beq c431e                                                         ; 4313: f0 09
    cmp #$ff                                                          ; 4315: c9 ff
    beq c431e                                                         ; 4317: f0 05
    lda #$86                                                          ; 4319: a9 86
    sta l0a16                                                         ; 431b: 8d 16 0a
c431e
    lda desired_room_index                                            ; 431e: a5 30
    cmp #3                                                            ; 4320: c9 03
    bne c434a                                                         ; 4322: d0 26
    ldx #$21 ; '!'                                                    ; 4324: a2 21
    lda #4                                                            ; 4326: a9 04
    sta temp_sprite_x_offset                                          ; 4328: 85 3a
    ldy #2                                                            ; 432a: a0 02
    lda #$dc                                                          ; 432c: a9 dc
    jsr draw_sprite_a_at_cell_xy                                      ; 432e: 20 4c 1f
    lda #$cf                                                          ; 4331: a9 cf
    sta l38ae                                                         ; 4333: 8d ae 38
    lda #$c0                                                          ; 4336: a9 c0
    sta l38c4                                                         ; 4338: 8d c4 38
    lda #$0c                                                          ; 433b: a9 0c
    sta object_x_low + 2                                              ; 433d: 8d 52 09
    lda #1                                                            ; 4340: a9 01
    sta object_x_high + 2                                             ; 4342: 8d 68 09
    lda #0                                                            ; 4345: a9 00
    sta object_y_high + 2                                             ; 4347: 8d 94 09
c434a
    jmp c43aa                                                         ; 434a: 4c aa 43

c434d
    lda l0a16                                                         ; 434d: ad 16 0a
    cmp #$ff                                                          ; 4350: c9 ff
    beq c43aa                                                         ; 4352: f0 56
    ora #0                                                            ; 4354: 09 00
    bne c436e                                                         ; 4356: d0 16
    lda desired_room_index                                            ; 4358: a5 30
    cmp #3                                                            ; 435a: c9 03
    bne c43aa                                                         ; 435c: d0 4c
    lda #2                                                            ; 435e: a9 02
    sta temp_bottom_offset                                            ; 4360: 8d 51 25
    lda #0                                                            ; 4363: a9 00
    jsr get_solid_rock_collision_for_object_a                         ; 4365: 20 94 28
    beq c43aa                                                         ; 4368: f0 40
    lda #$28 ; '('                                                    ; 436a: a9 28
    bne c43a7                                                         ; 436c: d0 39
c436e
    lda desired_room_index                                            ; 436e: a5 30
    cmp #3                                                            ; 4370: c9 03
    bne c4386                                                         ; 4372: d0 12
    ldx #objectid_old_player                                          ; 4374: a2 0b
    ldy #2                                                            ; 4376: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 4378: 20 e2 28
    beq c4386                                                         ; 437b: f0 09
    lda #$db                                                          ; 437d: a9 db
    jsr find_or_create_menu_slot_for_A                                ; 437f: 20 bd 2b
    lda #$ff                                                          ; 4382: a9 ff
    bne c43a7                                                         ; 4384: d0 21
c4386
    lda l0a16                                                         ; 4386: ad 16 0a
    cmp #$86                                                          ; 4389: c9 86
    beq c43aa                                                         ; 438b: f0 1d
    clc                                                               ; 438d: 18
    adc #8                                                            ; 438e: 69 08
    cmp #$80                                                          ; 4390: c9 80
    bcc c43a7                                                         ; 4392: 90 13
    bne c43a5                                                         ; 4394: d0 0f
    sta l0a16                                                         ; 4396: 8d 16 0a
    lda desired_room_index                                            ; 4399: a5 30
    cmp #3                                                            ; 439b: c9 03
    bne c43aa                                                         ; 439d: d0 0b
    jsr play_landing_sound                                            ; 439f: 20 a9 23
    jmp c43aa                                                         ; 43a2: 4c aa 43

c43a5
    lda #$86                                                          ; 43a5: a9 86
c43a7
    sta l0a16                                                         ; 43a7: 8d 16 0a
c43aa
    lda desired_room_index                                            ; 43aa: a5 30
    cmp #3                                                            ; 43ac: c9 03
    bne return3                                                       ; 43ae: d0 1f
    lda #0                                                            ; 43b0: a9 00
    sta object_spriteid + 2                                           ; 43b2: 8d aa 09
    lda l0a16                                                         ; 43b5: ad 16 0a
    beq return3                                                       ; 43b8: f0 15
    cmp #$ff                                                          ; 43ba: c9 ff
    beq return3                                                       ; 43bc: f0 11
    sta object_y_low + 2                                              ; 43be: 8d 7e 09
    ldx #$dd                                                          ; 43c1: a2 dd
    stx object_spriteid + 2                                           ; 43c3: 8e aa 09
    cmp #$86                                                          ; 43c6: c9 86
    beq return3                                                       ; 43c8: f0 05
    lda #$da                                                          ; 43ca: a9 da
    sta object_spriteid + 2                                           ; 43cc: 8d aa 09
return3
    rts                                                               ; 43cf: 60

envelope1
    !byte 5                                                           ; 43d0: 05                      ; envelope number
    !byte 1                                                           ; 43d1: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 43d2: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 43d3: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 43d4: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 43d5: 00                      ; number of steps in section 1
    !byte 0                                                           ; 43d6: 00                      ; number of steps in section 2
    !byte 0                                                           ; 43d7: 00                      ; number of steps in section 3
    !byte 10                                                          ; 43d8: 0a                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 43d9: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 43da: 00                      ; change of amplitude per step during sustain phase
    !byte 216                                                         ; 43db: d8                      ; change of amplitude per step during release phase
    !byte 40                                                          ; 43dc: 28                      ; target of level at end of attack phase
    !byte 0                                                           ; 43dd: 00                      ; target of level at end of decay phase
sound3
    !word $10                                                         ; 43de: 10 00                   ; channel
    !word 5                                                           ; 43e0: 05 00                   ; amplitude
    !word 4                                                           ; 43e2: 04 00                   ; pitch
    !word 4                                                           ; 43e4: 04 00                   ; duration
envelope2
    !byte 6                                                           ; 43e6: 06                      ; envelope number
    !byte 1                                                           ; 43e7: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 43e8: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 43e9: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 43ea: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 43eb: 00                      ; number of steps in section 1
    !byte 0                                                           ; 43ec: 00                      ; number of steps in section 2
    !byte 0                                                           ; 43ed: 00                      ; number of steps in section 3
    !byte 55                                                          ; 43ee: 37                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 43ef: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 43f0: 00                      ; change of amplitude per step during sustain phase
    !byte 250                                                         ; 43f1: fa                      ; change of amplitude per step during release phase
    !byte 110                                                         ; 43f2: 6e                      ; target of level at end of attack phase
    !byte 55                                                          ; 43f3: 37                      ; target of level at end of decay phase
sound2
    !word $10                                                         ; 43f4: 10 00                   ; channel
    !word 6                                                           ; 43f6: 06 00                   ; amplitude
    !word 7                                                           ; 43f8: 07 00                   ; pitch
    !word 1                                                           ; 43fa: 01 00                   ; duration
sound1
    !word $11                                                         ; 43fc: 11 00                   ; channel
    !word 0                                                           ; 43fe: 00 00                   ; amplitude
    !word 210                                                         ; 4400: d2 00                   ; pitch
    !word 1                                                           ; 4402: 01 00                   ; duration
    !byte $10,   8,   4, $82, $41, $21, $12, $0c,   8, $10, $20, $41  ; 4404: 10 08 04...
    !byte $82,   4,   8, $10,   8, $10, $20, $41, $82,   4,   8, $10  ; 4410: 82 04 08...
    !byte $30, $48, $84, $82, $41, $20, $10,   8                      ; 441c: 30 48 84...
sprite_data
pydis_end

; Automatically generated labels:
;     c3b0d
;     c3c62
;     c3c6d
;     c3c76
;     c3cec
;     c3d05
;     c3d29
;     c3d2c
;     c3d41
;     c3d53
;     c3d6f
;     c3d72
;     c3d8d
;     c3da6
;     c3dd0
;     c3dda
;     c3dea
;     c3e06
;     c3e16
;     c3e2d
;     c3e7b
;     c3e85
;     c3ff8
;     c400d
;     c4010
;     c402b
;     c4039
;     c404b
;     c4053
;     c407a
;     c4092
;     c4095
;     c40a9
;     c40d7
;     c40e1
;     c40fd
;     c4118
;     c412e
;     c4136
;     c4144
;     c4152
;     c4186
;     c419f
;     c41b6
;     c41c3
;     c41d2
;     c41e3
;     c41f5
;     c421a
;     c4221
;     c4245
;     c431e
;     c434a
;     c434d
;     c436e
;     c4386
;     c43a5
;     c43a7
;     c43aa
;     l0048
;     l09df
;     l0a16
;     l0a70
;     l0a71
;     l0a72
;     l0a73
;     l0a74
;     l0a75
;     l20f7
;     l38ae
;     l38b1
;     l38c4
;     l38c7
;     l3970
;     l3ea7
;     l3ea8
;     l3f72
;     l426d
;     l426e
;     loop_c3ca2
;     loop_c3cba
;     loop_c3cfd
;     sub_c3ea9
;     sub_c3fd3
;     sub_c4261
;     sub_c42f8
!if (<envelope1) != $d0 {
    !error "Assertion failed: <envelope1 == $d0"
}
!if (<envelope2) != $e6 {
    !error "Assertion failed: <envelope2 == $e6"
}
!if (<sound1) != $fc {
    !error "Assertion failed: <sound1 == $fc"
}
!if (<sound2) != $f4 {
    !error "Assertion failed: <sound2 == $f4"
}
!if (<sound3) != $de {
    !error "Assertion failed: <sound3 == $de"
}
!if (>envelope1) != $43 {
    !error "Assertion failed: >envelope1 == $43"
}
!if (>envelope2) != $43 {
    !error "Assertion failed: >envelope2 == $43"
}
!if (>sound1) != $43 {
    !error "Assertion failed: >sound1 == $43"
}
!if (>sound2) != $43 {
    !error "Assertion failed: >sound2 == $43"
}
!if (>sound3) != $43 {
    !error "Assertion failed: >sound3 == $43"
}
!if (collision_map_none) != $00 {
    !error "Assertion failed: collision_map_none == $00"
}
!if (collision_map_solid_rock) != $03 {
    !error "Assertion failed: collision_map_solid_rock == $03"
}
!if (exit_room_bottom) != $02 {
    !error "Assertion failed: exit_room_bottom == $02"
}
!if (exit_room_left) != $01 {
    !error "Assertion failed: exit_room_left == $01"
}
!if (exit_room_right) != $04 {
    !error "Assertion failed: exit_room_right == $04"
}
!if (exit_room_top) != $08 {
    !error "Assertion failed: exit_room_top == $08"
}
!if (level_specific_initialisation) != $3af1 {
    !error "Assertion failed: level_specific_initialisation == $3af1"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b16 {
    !error "Assertion failed: level_specific_update == $3b16"
}
!if (object_direction + 5) != $09c3 {
    !error "Assertion failed: object_direction + 5 == $09c3"
}
!if (object_spriteid + 2) != $09aa {
    !error "Assertion failed: object_spriteid + 2 == $09aa"
}
!if (object_spriteid + 5) != $09ad {
    !error "Assertion failed: object_spriteid + 5 == $09ad"
}
!if (object_x_high + 2) != $0968 {
    !error "Assertion failed: object_x_high + 2 == $0968"
}
!if (object_x_high + 5) != $096b {
    !error "Assertion failed: object_x_high + 5 == $096b"
}
!if (object_x_low + 2) != $0952 {
    !error "Assertion failed: object_x_low + 2 == $0952"
}
!if (object_x_low + 5) != $0955 {
    !error "Assertion failed: object_x_low + 5 == $0955"
}
!if (object_y_high + 2) != $0994 {
    !error "Assertion failed: object_y_high + 2 == $0994"
}
!if (object_y_high + 5) != $0997 {
    !error "Assertion failed: object_y_high + 5 == $0997"
}
!if (object_y_low + 2) != $097e {
    !error "Assertion failed: object_y_low + 2 == $097e"
}
!if (object_y_low + 3) != $097f {
    !error "Assertion failed: object_y_low + 3 == $097f"
}
!if (object_y_low + 5) != $0981 {
    !error "Assertion failed: object_y_low + 5 == $0981"
}
!if (objectid_old_player) != $0b {
    !error "Assertion failed: objectid_old_player == $0b"
}
!if (objectid_player) != $00 {
    !error "Assertion failed: objectid_player == $00"
}
!if (room_0_data) != $3b26 {
    !error "Assertion failed: room_0_data == $3b26"
}
!if (room_1_data) != $3bc9 {
    !error "Assertion failed: room_1_data == $3bc9"
}
!if (room_2_data) != $3eb3 {
    !error "Assertion failed: room_2_data == $3eb3"
}
!if (room_3_data) != $426f {
    !error "Assertion failed: room_3_data == $426f"
}
!if (sprite_data - level_data) != $094f {
    !error "Assertion failed: sprite_data - level_data == $094f"
}
