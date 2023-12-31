; *************************************************************************************
;
; Level E: 'DUCK-EGG-BLUES'
;
; Save game variables:
;
;     save_game_level_e_small_egg_status                         ($0a13):
;               0: uninitialised
;               1: stationary
;              $c: thrown right
;             $25: thrown left
;             $32: falling
;             $ff: taken
;
;     save_game_level_e_big_egg_animation_index                  ($0a14):
;               0: uninitialised
;               1: normal position
;               5: tilted position
;               9: falling off ledge
;             $16: falling straight down
;             $1a: landed
;
;     save_game_level_e_bird_global_x_position                   ($0a15):
;             X position within the bird's cross-screen flight path
;             $ff: taken
;
; Solution:
;
;   1. Move to the room to the right and climb the rope to collect the small egg
;   2. Return to the starting room and climb the rope exiting on the right to stand on nest.
;   3. As the wizard, use the small egg to tilt the big egg.
;   4. Collect the small egg and throw from the same position. (The big egg falls)
;   5. Jump onto the big egg as the cat and jump onto the left platform to exit the room left.
;   6. Climb the rope while looking right to the top then jump off to the right, timing it to
;      collide with the bird.
;   7. Change into the bird and fly up to the top room to collect the spell.
;
; *************************************************************************************

; Constants
bird_max_global_x_position            = 116
bird_min_global_x_position            = 30
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
objectid_bird                         = 4
objectid_bird_wings                   = 5
objectid_egg                          = 3
objectid_fire1                        = 3
objectid_fire2                        = 4
objectid_old_player                   = 11
objectid_old_player_accessory         = 12
objectid_player                       = 0
objectid_player_accessory             = 1
objectid_small_egg                    = 2
objectid_sparkles                     = 5
opcode_jmp                            = 76
small_egg_status_collected            = 255
sprite_op_flags_copy_screen           = 1
sprite_op_flags_erase_to_bg_colour    = 2
sprite_op_flags_erase_to_fg_colour    = 4
sprite_op_flags_normal                = 0
spriteid_ball                         = 59
spriteid_bird_1                       = 200
spriteid_bird_2                       = 201
spriteid_bird_toolbar                 = 209
spriteid_bird_transform_1             = 204
spriteid_bird_transform_2             = 205
spriteid_bird_turn                    = 202
spriteid_bird_wing_1                  = 206
spriteid_bird_wing_2                  = 207
spriteid_bird_wing_3                  = 208
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
spriteid_egg                          = 210
spriteid_egg_toolbar                  = 211
spriteid_erase_bird_wings             = 223
spriteid_erase_large_egg              = 222
spriteid_erase_player                 = 199
spriteid_erase_player_accessory       = 198
spriteid_erase_small_egg              = 214
spriteid_erase_sparkles               = 197
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
spriteid_large_egg_sideways           = 221
spriteid_large_egg_tilted             = 220
spriteid_large_egg_upright            = 219
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
spriteid_nest                         = 212
spriteid_one_pixel_masked_out         = 0
spriteid_one_pixel_set                = 31
spriteid_pointer_hand                 = 29
spriteid_rope1                        = 85
spriteid_rope2                        = 86
spriteid_rope3                        = 87
spriteid_rope4                        = 88
spriteid_rope_end                     = 10
spriteid_rope_hook                    = 11
spriteid_small_egg_down               = 216
spriteid_small_egg_left               = 217
spriteid_small_egg_right              = 215
spriteid_small_egg_upright            = 218
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
sprite_id                                               = $16
sprite_x_base_low                                       = $18
sprite_x_base_high                                      = $19
sprite_y_base_low                                       = $1a
sprite_y_base_high                                      = $1b
sprite_reflect_flag                                     = $1d
timeout_while_bird_on_ground_stationary                 = $23
desired_room_index                                      = $30
current_level                                           = $31
temp_sprite_x_offset                                    = $3a
temp_sprite_y_offset                                    = $3b
width_in_cells                                          = $3c
height_in_cells                                         = $3d
value_to_write_to_collision_map                         = $3e
source_sprite_memory_low                                = $40
source_sprite_memory_high                               = $41
copy_mode                                               = $42
current_player_character                                = $48
previous_room_index                                     = $50
level_before_latest_level_and_room_initialisation       = $51
player_held_object_spriteid                             = $52
developer_mode_sideways_ram_is_set_up_flag              = $5b
l0070                                                   = $70
object_left_low                                         = $70
room_exit_direction                                     = $70
object_left_high                                        = $71
object_right_low                                        = $72
object_right_high                                       = $73
object_left_cell_x                                      = $78
object_right_cell_x                                     = $79
object_x_low                                            = $0950
object_x_low_old                                        = $095b
object_x_high                                           = $0966
object_x_high_old                                       = $0971
object_y_low                                            = $097c
object_y_low_old                                        = $0987
object_y_high                                           = $0992
object_spriteid                                         = $09a8
object_spriteid_old                                     = $09b3
object_direction                                        = $09be
object_current_index_in_animation                       = $09d4
current_player_animation                                = $09df
save_game_level_e_small_egg_status                      = $0a13
save_game_level_e_big_egg_animation_index               = $0a14
save_game_level_e_bird_global_x_position                = $0a15
level_workspace_small_egg_offscreen_time                = $0a6f
thrown_egg_x_low                                        = $0a70
thrown_egg_x_high                                       = $0a71
thrown_egg_y_low                                        = $0a72
thrown_egg_direction                                    = $0a73
small_egg_animation_step                                = $0a74
room_containing_small_egg                               = $0a75
egg_animation_index                                     = $0a76
room_1_egg_x                                            = $0a77
room_1_egg_y                                            = $0a78
bird_object_direction                                   = $0a79
bird_x_direction                                        = $0a7a
bird_wing_animation_index                               = $0a7b
tile_all_set_pixels                                     = $0aa9
developer_flags                                         = $1103
initialise_level_and_room                               = $1140
start_room                                              = $12bb
game_update                                             = $12da
update_room_first_update_flag                           = $132b
sprite_op                                               = $138d
toolbar_colour                                          = $175e
gameplay_area_colour                                    = $1760
get_random_number_up_to_a                               = $18a6
update_brazier_and_fire                                 = $1988
update_level_completion                                 = $1a10
currently_updating_logic_for_room_index                 = $1aba
copy_rectangle_of_memory_to_screen                      = $1abb
draw_floor_walls_and_ceiling_around_solid_rock          = $1b90
draw_rope                                               = $1db9
write_value_to_a_rectangle_of_cells_in_collision_map    = $1e44
write_a_single_value_to_cell_in_collision_map           = $1ebb
read_collision_map_value_for_xy                         = $1efa
draw_sprite_a_at_cell_xy                                = $1f4c
draw_sprite_a_at_cell_xy_and_write_to_collision_map     = $1f57
set_object_position_from_cell_xy                        = $1f5d
set_object_position_from_current_sprite_position        = $1f6d
copy_object_state_to_old                                = $20f7
set_player_spriteid_and_offset_from_animation_table     = $2200
update_player_accessory_object_animation                = $2248
jmp_for_update_extra_player_character                   = $22dd
transform_out_animation                                 = $22ed
set_base_animation_address_and_handle_transform_in_out  = $22ee
play_landing_sound                                      = $23a9
update_player_hitting_floor_or_pushed                   = $23c4
player_wall_collision_reaction_speed                    = $2433
find_left_and_right_of_object                           = $2434
temp_left_offset                                        = $24d0
temp_right_offset                                       = $24d1
find_top_and_bottom_of_object                           = $24d2
temp_top_offset                                         = $2550
temp_bottom_offset                                      = $2551
update_object_a_solid_rock_collision                    = $25f5
update_object_hitting_floor                             = $2770
object_has_hit_floor_flag                               = $288f
object_just_fallen_off_edge_direction                   = $2890
get_solid_rock_collision_for_object_a                   = $2894
temp_default_collision_map_option                       = $28e1
test_for_collision_between_objects_x_and_y              = $28e2
desired_menu_slots                                      = $295c
menu_index_for_extra_items                              = $296e
insert_character_menu_item_into_toolbar                 = $2b87
find_or_create_menu_slot_for_A                          = $2bbd
remove_item_from_toolbar_menu                           = $2be0
player_using_object_spriteid                            = $2eb6
previous_player_using_object_spriteid                   = $2eb7
toolbar_collectable_spriteids                           = $2ee8
collectable_spriteids                                   = $2eed
collectable_being_used_spriteids                        = $2ef2
monkey_base_animation                                   = $30ff
monkey_climb_idle_animation                             = $3144
monkey_climb_down_animation                             = $3148
monkey_climb_animation                                  = $3150
inhibit_monkey_climb_flag                               = $31d7
object_erase_type                                       = $38ac
object_z_order                                          = $38c2
object_room_collision_flags                             = $38d8
play_sound_yx                                           = $38f6
define_envelope                                         = $395e
sound_priority_per_channel_table                        = $396f
jump_requested                                          = $3ac7
player_move_direction_requested                         = $3ac9
move_left_requested                                     = $3aca
move_right_requested                                    = $3acb
negative_inkey                                          = $3acc

    * = $3ad5

; *************************************************************************************
; 
; Level header
; 
; *************************************************************************************
level_data
pydis_start
    !word sprite_data - level_data                                    ; 3ad5: 57 0b                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f6 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 34 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
initial_room_index
    !byte 1                                                           ; 3add: 01
initial_room_index_cheat
    !byte 3                                                           ; 3ade: 03
level_room_data_table
    !word room_0_data                                                 ; 3adf: f2 3f                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: 8c 43
    !word room_2_data                                                 ; 3ae3: 18 3c
    !word room_3_data                                                 ; 3ae5: f7 3d

; *************************************************************************************
; 'DUCK-EGG-BLUES[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $8f, $9e, $88, $80, $e6, $8e, $8c, $8c, $e6, $89, $87, $9e  ; 3ae7: 8f 9e 88...
    !byte $8e, $98, $c6                                               ; 3af3: 8e 98 c6

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
    beq bird_not_captured_yet                                         ; 3afa: f0 25
    lda developer_flags                                               ; 3afc: ad 03 11
    bpl developer_mode_not_active                                     ; 3aff: 10 0a
    lda #small_egg_status_collected                                   ; 3b01: a9 ff
    sta save_game_level_e_small_egg_status                            ; 3b03: 8d 13 0a
    lda #spriteid_bird_toolbar                                        ; 3b06: a9 d1
    jsr insert_character_menu_item_into_toolbar                       ; 3b08: 20 87 2b
developer_mode_not_active
    lda save_game_level_e_small_egg_status                            ; 3b0b: ad 13 0a
    bpl dont_have_egg                                                 ; 3b0e: 10 05
    lda #spriteid_egg_toolbar                                         ; 3b10: a9 d3
    jsr find_or_create_menu_slot_for_A                                ; 3b12: 20 bd 2b
dont_have_egg
    lda save_game_level_e_bird_global_x_position                      ; 3b15: ad 15 0a
    cmp #$ff                                                          ; 3b18: c9 ff
    bne bird_not_captured_yet                                         ; 3b1a: d0 05
    lda #spriteid_bird_toolbar                                        ; 3b1c: a9 d1
    jsr insert_character_menu_item_into_toolbar                       ; 3b1e: 20 87 2b
bird_not_captured_yet
    lda #<update_bird                                                 ; 3b21: a9 b8
    sta jmp_for_update_extra_player_character + 1                     ; 3b23: 8d de 22
    lda #>update_bird                                                 ; 3b26: a9 3e
    sta jmp_for_update_extra_player_character + 2                     ; 3b28: 8d df 22
    lda #<ground_fill_2x2_top_left                                    ; 3b2b: a9 0c
    sta source_sprite_memory_low                                      ; 3b2d: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3b2f: a9 46
    sta source_sprite_memory_high                                     ; 3b31: 85 41
    rts                                                               ; 3b33: 60

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
    jsr room_0_update_handler                                         ; 3b34: 20 cf 40
    jsr room_1_update_handler                                         ; 3b37: 20 6a 44
    jsr room_2_update_handler                                         ; 3b3a: 20 e0 3c
    jmp room_3_update_handler                                         ; 3b3d: 4c 96 3e

; This table is 0-terminated
bird_wing_animation_table
    !byte spriteid_bird_wing_1, spriteid_bird_wing_2                  ; 3b40: ce cf
    !byte spriteid_bird_wing_3, spriteid_bird_wing_2                  ; 3b42: d0 cf
    !byte                    0                                        ; 3b44: 00
; bird doesn't have accessories
bird_accessory_sprite_list
    !byte 0                                                           ; 3b45: 00
bird_base_animations
bird_transition_in_animation
    !byte spriteid_one_pixel_masked_out                               ; 3b46: 00
    !byte 0                                                           ; 3b47: 00
    !byte 0                                                           ; 3b48: 00
    !byte 0                                                           ; 3b49: 00
    !byte spriteid_bird_transform_2                                   ; 3b4a: cd
    !byte 0                                                           ; 3b4b: 00
    !byte 0                                                           ; 3b4c: 00
    !byte 0                                                           ; 3b4d: 00
    !byte spriteid_bird_transform_2                                   ; 3b4e: cd
    !byte 0                                                           ; 3b4f: 00
    !byte 0                                                           ; 3b50: 00
    !byte 0                                                           ; 3b51: 00
    !byte spriteid_bird_transform_1                                   ; 3b52: cc
    !byte 0                                                           ; 3b53: 00
    !byte 0                                                           ; 3b54: 00
    !byte 0                                                           ; 3b55: 00
    !byte spriteid_bird_transform_1                                   ; 3b56: cc
    !byte 0                                                           ; 3b57: 00
    !byte 0                                                           ; 3b58: 00
    !byte 0                                                           ; 3b59: 00
    !byte spriteid_bird_1                                             ; 3b5a: c8
    !byte 0                                                           ; 3b5b: 00
    !byte 0                                                           ; 3b5c: 00
    !byte 0                                                           ; 3b5d: 00
    !byte spriteid_bird_1                                             ; 3b5e: c8
    !byte 0                                                           ; 3b5f: 00
    !byte 0                                                           ; 3b60: 00
    !byte 0                                                           ; 3b61: 00
    !byte 0                                                           ; 3b62: 00                      ; terminator

bird_transition_out_animation
    !byte spriteid_bird_1                                             ; 3b63: c8
    !byte 0                                                           ; 3b64: 00
    !byte 0                                                           ; 3b65: 00
    !byte 0                                                           ; 3b66: 00
    !byte spriteid_bird_1                                             ; 3b67: c8
    !byte 0                                                           ; 3b68: 00
    !byte 0                                                           ; 3b69: 00
    !byte 0                                                           ; 3b6a: 00
    !byte spriteid_bird_transform_1                                   ; 3b6b: cc
    !byte 0                                                           ; 3b6c: 00
    !byte 0                                                           ; 3b6d: 00
    !byte 0                                                           ; 3b6e: 00
    !byte spriteid_bird_transform_1                                   ; 3b6f: cc
    !byte 0                                                           ; 3b70: 00
    !byte 0                                                           ; 3b71: 00
    !byte 0                                                           ; 3b72: 00
    !byte spriteid_bird_transform_2                                   ; 3b73: cd
    !byte 0                                                           ; 3b74: 00
    !byte 0                                                           ; 3b75: 00
    !byte 0                                                           ; 3b76: 00
    !byte spriteid_bird_transform_2                                   ; 3b77: cd
    !byte 0                                                           ; 3b78: 00
    !byte 0                                                           ; 3b79: 00
    !byte 0                                                           ; 3b7a: 00
    !byte 0                                                           ; 3b7b: 00                      ; terminator

bird_stationary_for_a_while_animation
    !byte spriteid_bird_1                                             ; 3b7c: c8
    !byte 0                                                           ; 3b7d: 00
    !byte 0                                                           ; 3b7e: 00
    !byte 0                                                           ; 3b7f: 00
    !byte 0                                                           ; 3b80: 00                      ; terminator

bird_turn1_animation
    !byte spriteid_bird_turn                                          ; 3b81: ca
    !byte 0                                                           ; 3b82: 00
    !byte $fc                                                         ; 3b83: fc
    !byte 0                                                           ; 3b84: 00
bird_turn1_mid_way
    !byte spriteid_bird_2                                             ; 3b85: c9
    !byte 2                                                           ; 3b86: 02
    !byte $fe                                                         ; 3b87: fe
    !byte 0                                                           ; 3b88: 00
    !byte 0                                                           ; 3b89: 00                      ; terminator

bird_stationary_on_floor_animation
    !byte spriteid_bird_1                                             ; 3b8a: c8
    !byte 0                                                           ; 3b8b: 00
    !byte 0                                                           ; 3b8c: 00
    !byte 0                                                           ; 3b8d: 00
    !byte 0                                                           ; 3b8e: 00                      ; terminator

bird_animation5
    !byte spriteid_bird_2                                             ; 3b8f: c9
    !byte 0                                                           ; 3b90: 00
    !byte 0                                                           ; 3b91: 00
    !byte $ff                                                         ; 3b92: ff
    !byte 0                                                           ; 3b93: 00                      ; terminator

bird_fly_straight_up_animation
    !byte spriteid_bird_2                                             ; 3b94: c9
    !byte 0                                                           ; 3b95: 00
    !byte $fc                                                         ; 3b96: fc
    !byte $ff                                                         ; 3b97: ff
    !byte 0                                                           ; 3b98: 00                      ; terminator

bird_flying_sideways_animation
    !byte spriteid_bird_2                                             ; 3b99: c9
    !byte 4                                                           ; 3b9a: 04
    !byte 0                                                           ; 3b9b: 00
    !byte $ff                                                         ; 3b9c: ff
    !byte 0                                                           ; 3b9d: 00                      ; terminator

bird_animation8
    !byte spriteid_bird_2                                             ; 3b9e: c9
    !byte 4                                                           ; 3b9f: 04
    !byte $fc                                                         ; 3ba0: fc
    !byte $ff                                                         ; 3ba1: ff
    !byte 0                                                           ; 3ba2: 00                      ; terminator

bird_turn_while_flying_animation
    !byte spriteid_bird_turn                                          ; 3ba3: ca
    !byte 0                                                           ; 3ba4: 00
    !byte 0                                                           ; 3ba5: 00
    !byte $ff                                                         ; 3ba6: ff
bird_turn_while_flying_mid_way
    !byte spriteid_bird_2                                             ; 3ba7: c9
    !byte 2                                                           ; 3ba8: 02
    !byte 0                                                           ; 3ba9: 00
    !byte $ff                                                         ; 3baa: ff
    !byte 0                                                           ; 3bab: 00                      ; terminator

bird_start_hop_animation
    !byte spriteid_bird_2                                             ; 3bac: c9
    !byte 4                                                           ; 3bad: 04
    !byte $fc                                                         ; 3bae: fc
    !byte 0                                                           ; 3baf: 00
    !byte spriteid_bird_2                                             ; 3bb0: c9
    !byte 4                                                           ; 3bb1: 04
    !byte $fe                                                         ; 3bb2: fe
    !byte 0                                                           ; 3bb3: 00
    !byte 0                                                           ; 3bb4: 00                      ; terminator

bird_animation11
    !byte spriteid_bird_1                                             ; 3bb5: c8
    !byte 4                                                           ; 3bb6: 04
    !byte 2                                                           ; 3bb7: 02
    !byte 0                                                           ; 3bb8: 00
    !byte spriteid_bird_1                                             ; 3bb9: c8
    !byte 4                                                           ; 3bba: 04
    !byte 4                                                           ; 3bbb: 04
    !byte 0                                                           ; 3bbc: 00
    !byte spriteid_bird_1                                             ; 3bbd: c8
    !byte 2                                                           ; 3bbe: 02
    !byte 4                                                           ; 3bbf: 04
    !byte 0                                                           ; 3bc0: 00
    !byte 0                                                           ; 3bc1: 00                      ; terminator

bird_animation12
    !byte spriteid_bird_1                                             ; 3bc2: c8
    !byte 3                                                           ; 3bc3: 03
    !byte 1                                                           ; 3bc4: 01
    !byte 0                                                           ; 3bc5: 00
    !byte spriteid_bird_1                                             ; 3bc6: c8
    !byte 2                                                           ; 3bc7: 02
    !byte 3                                                           ; 3bc8: 03
    !byte 0                                                           ; 3bc9: 00
    !byte spriteid_bird_1                                             ; 3bca: c8
    !byte 1                                                           ; 3bcb: 01
    !byte 5                                                           ; 3bcc: 05
    !byte 0                                                           ; 3bcd: 00
    !byte 0                                                           ; 3bce: 00                      ; terminator

bird_animation13
    !byte spriteid_bird_1                                             ; 3bcf: c8
    !byte 4                                                           ; 3bd0: 04
    !byte 2                                                           ; 3bd1: 02
    !byte 0                                                           ; 3bd2: 00
    !byte spriteid_bird_1                                             ; 3bd3: c8
    !byte 3                                                           ; 3bd4: 03
    !byte 3                                                           ; 3bd5: 03
    !byte 0                                                           ; 3bd6: 00
    !byte spriteid_bird_1                                             ; 3bd7: c8
    !byte 2                                                           ; 3bd8: 02
    !byte 4                                                           ; 3bd9: 04
    !byte 0                                                           ; 3bda: 00
    !byte spriteid_bird_1                                             ; 3bdb: c8
    !byte 1                                                           ; 3bdc: 01
    !byte 5                                                           ; 3bdd: 05
    !byte 0                                                           ; 3bde: 00
    !byte 0                                                           ; 3bdf: 00                      ; terminator

bird_animation14
    !byte spriteid_bird_1                                             ; 3be0: c8
    !byte $fc                                                         ; 3be1: fc
    !byte 2                                                           ; 3be2: 02
    !byte 0                                                           ; 3be3: 00
    !byte spriteid_bird_1                                             ; 3be4: c8
    !byte $fd                                                         ; 3be5: fd
    !byte 3                                                           ; 3be6: 03
    !byte 0                                                           ; 3be7: 00
    !byte spriteid_bird_1                                             ; 3be8: c8
    !byte $fe                                                         ; 3be9: fe
    !byte 4                                                           ; 3bea: 04
    !byte 0                                                           ; 3beb: 00
    !byte spriteid_bird_1                                             ; 3bec: c8
    !byte $ff                                                         ; 3bed: ff
    !byte 5                                                           ; 3bee: 05
    !byte 0                                                           ; 3bef: 00
    !byte 0                                                           ; 3bf0: 00                      ; terminator

bird_animation15
    !byte spriteid_bird_1                                             ; 3bf1: c8
    !byte 0                                                           ; 3bf2: 00
    !byte 1                                                           ; 3bf3: 01
    !byte 0                                                           ; 3bf4: 00
    !byte spriteid_bird_1                                             ; 3bf5: c8
    !byte 0                                                           ; 3bf6: 00
    !byte 2                                                           ; 3bf7: 02
    !byte 0                                                           ; 3bf8: 00
    !byte spriteid_bird_1                                             ; 3bf9: c8
    !byte 0                                                           ; 3bfa: 00
    !byte 3                                                           ; 3bfb: 03
    !byte 0                                                           ; 3bfc: 00
    !byte spriteid_bird_1                                             ; 3bfd: c8
    !byte 0                                                           ; 3bfe: 00
    !byte 4                                                           ; 3bff: 04
    !byte 0                                                           ; 3c00: 00
    !byte spriteid_bird_1                                             ; 3c01: c8
    !byte 0                                                           ; 3c02: 00
    !byte 5                                                           ; 3c03: 05
    !byte 0                                                           ; 3c04: 00
    !byte 0                                                           ; 3c05: 00                      ; terminator

bird_fall_straight_down_animation
    !byte spriteid_bird_1                                             ; 3c06: c8
    !byte 0                                                           ; 3c07: 00
    !byte 7                                                           ; 3c08: 07
    !byte 0                                                           ; 3c09: 00
    !byte 0                                                           ; 3c0a: 00                      ; terminator


draw_sprite_nest_at_cell_xy_and_write_to_collision_map
    lda #3                                                            ; 3c0b: a9 03
    sta width_in_cells                                                ; 3c0d: 85 3c
    lda #1                                                            ; 3c0f: a9 01
    sta height_in_cells                                               ; 3c11: 85 3d
    lda #spriteid_nest                                                ; 3c13: a9 d4
    jmp draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3c15: 4c 57 1f

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 20                                                          ; 3c18: 14                      ; initial player X cell
    !byte 22                                                          ; 3c19: 16                      ; initial player Y cell

; #################      #################
; #################      #################
; ###        |
; ###        |
; ###        |
; ###        |
; ###        |
; ###        |     ######              ###
; ###        |     ######              ###
; ###        |        ###              ###
; ###        |        ###              ###
; ###OOO     |        ###           OOO###
; ######     |        ###           ######
; ######     |        ###           ######
; ###        |        ###OOO
; ###        |        ######
; ###        |        ######
; ###        |
; ###        |
; ###        |                      ######
; ###                            #########
; ###                 P       ############
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 17x2 rectangle at (0,0)
room_2_code
    ldx #0                                                            ; 3c1a: a2 00
    ldy #0                                                            ; 3c1c: a0 00
    lda #$11                                                          ; 3c1e: a9 11
    sta width_in_cells                                                ; 3c20: 85 3c
    lda #2                                                            ; 3c22: a9 02
    sta height_in_cells                                               ; 3c24: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c26: 20 bb 1a
; draw 17x2 rectangle at (23,0)
    ldx #$17                                                          ; 3c29: a2 17
    jsr copy_rectangle_of_memory_to_screen                            ; 3c2b: 20 bb 1a
; draw 3x20 rectangle at (0,2)
    ldx #0                                                            ; 3c2e: a2 00
    ldy #2                                                            ; 3c30: a0 02
    lda #3                                                            ; 3c32: a9 03
    sta width_in_cells                                                ; 3c34: 85 3c
    lda #$14                                                          ; 3c36: a9 14
    sta height_in_cells                                               ; 3c38: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c3a: 20 bb 1a
; draw 255x20 rectangle at (0,22)
    ldy #$16                                                          ; 3c3d: a0 16
    lda #$ff                                                          ; 3c3f: a9 ff
    sta width_in_cells                                                ; 3c41: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3c43: 20 bb 1a
; draw 255x1 rectangle at (28,21)
    ldx #$1c                                                          ; 3c46: a2 1c
    dey                                                               ; 3c48: 88
    lda #1                                                            ; 3c49: a9 01
    sta height_in_cells                                               ; 3c4b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c4d: 20 bb 1a
; draw 255x1 rectangle at (31,20)
    ldx #$1f                                                          ; 3c50: a2 1f
    dey                                                               ; 3c52: 88
    jsr copy_rectangle_of_memory_to_screen                            ; 3c53: 20 bb 1a
; draw 255x1 rectangle at (34,19)
    ldx #$22 ; '"'                                                    ; 3c56: a2 22
    dey                                                               ; 3c58: 88
    jsr copy_rectangle_of_memory_to_screen                            ; 3c59: 20 bb 1a
; draw 3x2 rectangle at (3,12)
    ldx #3                                                            ; 3c5c: a2 03
    ldy #$0c                                                          ; 3c5e: a0 0c
    lda #3                                                            ; 3c60: a9 03
    sta width_in_cells                                                ; 3c62: 85 3c
    lda #2                                                            ; 3c64: a9 02
    sta height_in_cells                                               ; 3c66: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c68: 20 bb 1a
; draw 3x2 rectangle at (34,12)
    ldx #$22 ; '"'                                                    ; 3c6b: a2 22
    jsr copy_rectangle_of_memory_to_screen                            ; 3c6d: 20 bb 1a
; draw 3x2 rectangle at (17,7)
    ldx #$11                                                          ; 3c70: a2 11
    ldy #7                                                            ; 3c72: a0 07
    jsr copy_rectangle_of_memory_to_screen                            ; 3c74: 20 bb 1a
; draw 3x2 rectangle at (23,15)
    ldx #$17                                                          ; 3c77: a2 17
    ldy #$0f                                                          ; 3c79: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3c7b: 20 bb 1a
; draw 3x10 rectangle at (20,7)
    ldx #$14                                                          ; 3c7e: a2 14
    ldy #7                                                            ; 3c80: a0 07
    lda #$0a                                                          ; 3c82: a9 0a
    sta height_in_cells                                               ; 3c84: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c86: 20 bb 1a
; draw 3x7 rectangle at (37,7)
    ldx #$25 ; '%'                                                    ; 3c89: a2 25
    lda #7                                                            ; 3c8b: a9 07
    sta height_in_cells                                               ; 3c8d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c8f: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3c92: 20 90 1b
    ldx #3                                                            ; 3c95: a2 03
    ldy #$0b                                                          ; 3c97: a0 0b
    jsr draw_sprite_nest_at_cell_xy_and_write_to_collision_map        ; 3c99: 20 0b 3c
    ldx #$22 ; '"'                                                    ; 3c9c: a2 22
    jsr draw_sprite_nest_at_cell_xy_and_write_to_collision_map        ; 3c9e: 20 0b 3c
    ldx #$17                                                          ; 3ca1: a2 17
    ldy #$0e                                                          ; 3ca3: a0 0e
    jsr draw_sprite_nest_at_cell_xy_and_write_to_collision_map        ; 3ca5: 20 0b 3c
    ldx #$13                                                          ; 3ca8: a2 13
    ldy #9                                                            ; 3caa: a0 09
    lda #1                                                            ; 3cac: a9 01
    sta width_in_cells                                                ; 3cae: 85 3c
    lda #3                                                            ; 3cb0: a9 03
    sta height_in_cells                                               ; 3cb2: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3cb4: 20 44 1e
; draw rope at (11,2) length 18
    ldx #$0b                                                          ; 3cb7: a2 0b
    ldy #2                                                            ; 3cb9: a0 02
    lda #$12                                                          ; 3cbb: a9 12
    jsr draw_rope                                                     ; 3cbd: 20 b9 1d
    jsr start_room                                                    ; 3cc0: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 3cc3: 20 da 12
    sta room_exit_direction                                           ; 3cc6: 85 70
    and #exit_room_top                                                ; 3cc8: 29 08
    beq room_2_check_right_exit                                       ; 3cca: f0 07
    ldx #3                                                            ; 3ccc: a2 03
    ldy current_level                                                 ; 3cce: a4 31
    jmp initialise_level_and_room                                     ; 3cd0: 4c 40 11

room_2_check_right_exit
    lda room_exit_direction                                           ; 3cd3: a5 70
    and #exit_room_right                                              ; 3cd5: 29 04
    beq room_2_game_update_loop                                       ; 3cd7: f0 ea
    ldx #1                                                            ; 3cd9: a2 01
    ldy current_level                                                 ; 3cdb: a4 31
    jmp initialise_level_and_room                                     ; 3cdd: 4c 40 11

room_2_update_handler
    lda #2                                                            ; 3ce0: a9 02
    sta currently_updating_logic_for_room_index                       ; 3ce2: 8d ba 1a
    lda #objectid_fire1                                               ; 3ce5: a9 03
    ldx #$14                                                          ; 3ce7: a2 14
    ldy #$0c                                                          ; 3ce9: a0 0c
    jsr update_brazier_and_fire                                       ; 3ceb: 20 88 19
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 3cee: ad 2b 13
    beq room_2_not_first_update                                       ; 3cf1: f0 47
    lda save_game_level_e_bird_global_x_position                      ; 3cf3: ad 15 0a
    cmp #$ff                                                          ; 3cf6: c9 ff
    beq choose_bird_sprite_if_in_room_1_or_2_local                    ; 3cf8: f0 3a
; check for level change (branch if not)
    lda current_level                                                 ; 3cfa: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3cfc: c5 51
    beq initialise_bird_in_room_1_or_2                                ; 3cfe: f0 12
    lda #$73 ; 's'                                                    ; 3d00: a9 73
    sta save_game_level_e_bird_global_x_position                      ; 3d02: 8d 15 0a
    lda #$ff                                                          ; 3d05: a9 ff
    sta bird_object_direction                                         ; 3d07: 8d 79 0a
    sta bird_x_direction                                              ; 3d0a: 8d 7a 0a
    lda #0                                                            ; 3d0d: a9 00
    sta bird_wing_animation_index                                     ; 3d0f: 8d 7b 0a
initialise_bird_in_room_1_or_2
    lda desired_room_index                                            ; 3d12: a5 30
    beq choose_bird_sprite_if_in_room_1_or_2_local                    ; 3d14: f0 1e
    cmp #3                                                            ; 3d16: c9 03
    bcs choose_bird_sprite_if_in_room_1_or_2_local                    ; 3d18: b0 1a
; initialise bird
    lda #spriteid_erase_bird_wings                                    ; 3d1a: a9 df
    sta object_erase_type + objectid_bird_wings                       ; 3d1c: 8d b1 38
    lda #$fe                                                          ; 3d1f: a9 fe
    sta object_z_order + objectid_bird_wings                          ; 3d21: 8d c7 38
    lda #$2c ; ','                                                    ; 3d24: a9 2c
    sta object_y_low + objectid_bird                                  ; 3d26: 8d 80 09
    sta object_y_low + objectid_bird_wings                            ; 3d29: 8d 81 09
    lda #0                                                            ; 3d2c: a9 00
    sta object_y_high + objectid_bird                                 ; 3d2e: 8d 96 09
    sta object_y_high + objectid_bird_wings                           ; 3d31: 8d 97 09
choose_bird_sprite_if_in_room_1_or_2_local
    jmp choose_bird_sprite_if_in_room_1_or_2                          ; 3d34: 4c 9f 3d

return1_local
    jmp return1                                                       ; 3d37: 4c f6 3d

room_2_not_first_update
    lda save_game_level_e_bird_global_x_position                      ; 3d3a: ad 15 0a
    cmp #$ff                                                          ; 3d3d: c9 ff
    beq return1_local                                                 ; 3d3f: f0 f6
    lda desired_room_index                                            ; 3d41: a5 30
    cmp #2                                                            ; 3d43: c9 02
    bne update_bird_animation                                         ; 3d45: d0 1d
    ldx #objectid_old_player                                          ; 3d47: a2 0b
    ldy #objectid_bird                                                ; 3d49: a0 04
    jsr test_for_collision_between_objects_x_and_y                    ; 3d4b: 20 e2 28
    beq update_bird_animation                                         ; 3d4e: f0 14
    lda #spriteid_bird_toolbar                                        ; 3d50: a9 d1
    jsr insert_character_menu_item_into_toolbar                       ; 3d52: 20 87 2b
    lda #spriteid_one_pixel_masked_out                                ; 3d55: a9 00
    sta object_spriteid + objectid_bird                               ; 3d57: 8d ac 09
    sta object_spriteid + objectid_bird_wings                         ; 3d5a: 8d ad 09
    lda #$ff                                                          ; 3d5d: a9 ff
    sta save_game_level_e_bird_global_x_position                      ; 3d5f: 8d 15 0a
    bmi return1_local                                                 ; 3d62: 30 d3
update_bird_animation
    ldy bird_wing_animation_index                                     ; 3d64: ac 7b 0a
    iny                                                               ; 3d67: c8
    lda bird_wing_animation_table,y                                   ; 3d68: b9 40 3b
    bne store_bird_wind_animation_index                               ; 3d6b: d0 02
    ldy #0                                                            ; 3d6d: a0 00
store_bird_wind_animation_index
    sty bird_wing_animation_index                                     ; 3d6f: 8c 7b 0a
    lda bird_x_direction                                              ; 3d72: ad 7a 0a
    bne check_bird_x_range_limits                                     ; 3d75: d0 0e
; flip bird direction
    lda bird_object_direction                                         ; 3d77: ad 79 0a
    eor #$fe                                                          ; 3d7a: 49 fe
    sta bird_object_direction                                         ; 3d7c: 8d 79 0a
    sta bird_x_direction                                              ; 3d7f: 8d 7a 0a
    jmp add_direction_to_bird_x_position                              ; 3d82: 4c 95 3d

check_bird_x_range_limits
    lda save_game_level_e_bird_global_x_position                      ; 3d85: ad 15 0a
    cmp #bird_min_global_x_position                                   ; 3d88: c9 1e
    beq bird_hit_min_or_max_global_x_position                         ; 3d8a: f0 04
    cmp #bird_max_global_x_position                                   ; 3d8c: c9 74
    bne add_direction_to_bird_x_position                              ; 3d8e: d0 05
bird_hit_min_or_max_global_x_position
    lda #0                                                            ; 3d90: a9 00
    sta bird_x_direction                                              ; 3d92: 8d 7a 0a
add_direction_to_bird_x_position
    lda save_game_level_e_bird_global_x_position                      ; 3d95: ad 15 0a
    clc                                                               ; 3d98: 18
    adc bird_x_direction                                              ; 3d99: 6d 7a 0a
    sta save_game_level_e_bird_global_x_position                      ; 3d9c: 8d 15 0a
choose_bird_sprite_if_in_room_1_or_2
    lda save_game_level_e_bird_global_x_position                      ; 3d9f: ad 15 0a
    cmp #$ff                                                          ; 3da2: c9 ff
    beq return1                                                       ; 3da4: f0 50
    lda desired_room_index                                            ; 3da6: a5 30
    beq return1                                                       ; 3da8: f0 4c
    cmp #3                                                            ; 3daa: c9 03
    bcs return1                                                       ; 3dac: b0 48
    lda #spriteid_bird_2                                              ; 3dae: a9 c9
    ldx bird_x_direction                                              ; 3db0: ae 7a 0a
    bne set_bird_sprite                                               ; 3db3: d0 02
    lda #spriteid_bird_turn                                           ; 3db5: a9 ca
set_bird_sprite
    sta object_spriteid + objectid_bird                               ; 3db7: 8d ac 09
    ldy bird_wing_animation_index                                     ; 3dba: ac 7b 0a
    lda bird_wing_animation_table,y                                   ; 3dbd: b9 40 3b
    sta object_spriteid + objectid_bird_wings                         ; 3dc0: 8d ad 09
    lda save_game_level_e_bird_global_x_position                      ; 3dc3: ad 15 0a
    ldx desired_room_index                                            ; 3dc6: a6 30
    cpx #2                                                            ; 3dc8: e0 02
    beq set_x_to_high_byte_of_bird_x_position                         ; 3dca: f0 03
    sec                                                               ; 3dcc: 38
    sbc #$50 ; 'P'                                                    ; 3dcd: e9 50
set_x_to_high_byte_of_bird_x_position
    ldx #0                                                            ; 3dcf: a2 00
    cmp #$a0                                                          ; 3dd1: c9 a0
    bcc set_bird_object_x_and_direction                               ; 3dd3: 90 01
    dex                                                               ; 3dd5: ca
set_bird_object_x_and_direction
    stx object_x_high + objectid_bird                                 ; 3dd6: 8e 6a 09
    asl                                                               ; 3dd9: 0a
    rol object_x_high + objectid_bird                                 ; 3dda: 2e 6a 09
    asl                                                               ; 3ddd: 0a
    rol object_x_high + objectid_bird                                 ; 3dde: 2e 6a 09
    sta object_x_low + objectid_bird                                  ; 3de1: 8d 54 09
    sta object_x_low + objectid_bird_wings                            ; 3de4: 8d 55 09
    lda object_x_high + objectid_bird                                 ; 3de7: ad 6a 09
    sta object_x_high + objectid_bird_wings                           ; 3dea: 8d 6b 09
    lda bird_object_direction                                         ; 3ded: ad 79 0a
    sta object_direction + objectid_bird                              ; 3df0: 8d c2 09
    sta object_direction + objectid_bird_wings                        ; 3df3: 8d c3 09
return1
    rts                                                               ; 3df6: 60

; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 12                                                          ; 3df7: 0c                      ; initial player X cell
    !byte 8                                                           ; 3df8: 08                      ; initial player Y cell

; ########################################
; ########################################
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###         P                        ###
; ###     #########      #########     ###
; ###     #########      #########     ###
; ###           ###      ###           ###
; ###           ###      ###           ###
; ###           ###      ###           ###
; ###           ###      ###           ###
; ###        OOO###      ###OOO        ###
; ###        ######      ######        ###
; ###        ######      ######        ###
; ###           ###      ###           ###
; ###           ###      ###           ###
; ###           ###      ###           ###
; ###           ###      ###           ###
; ###           ###      ###           ###
; #################      #################
; #################      #################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_3_code
    ldx #0                                                            ; 3df9: a2 00
    ldy #0                                                            ; 3dfb: a0 00
    lda #$ff                                                          ; 3dfd: a9 ff
    sta width_in_cells                                                ; 3dff: 85 3c
    lda #2                                                            ; 3e01: a9 02
    sta height_in_cells                                               ; 3e03: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e05: 20 bb 1a
; draw 3x20 rectangle at (0,2)
    ldy #2                                                            ; 3e08: a0 02
    lda #3                                                            ; 3e0a: a9 03
    sta width_in_cells                                                ; 3e0c: 85 3c
    lda #$14                                                          ; 3e0e: a9 14
    sta height_in_cells                                               ; 3e10: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e12: 20 bb 1a
; draw 3x20 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3e15: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 3e17: 20 bb 1a
; draw 17x20 rectangle at (0,22)
    ldx #0                                                            ; 3e1a: a2 00
    ldy #$16                                                          ; 3e1c: a0 16
    lda #$11                                                          ; 3e1e: a9 11
    sta width_in_cells                                                ; 3e20: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3e22: 20 bb 1a
; draw 17x20 rectangle at (23,22)
    ldx #$17                                                          ; 3e25: a2 17
    jsr copy_rectangle_of_memory_to_screen                            ; 3e27: 20 bb 1a
; draw 9x2 rectangle at (8,8)
    ldx #8                                                            ; 3e2a: a2 08
    ldy #8                                                            ; 3e2c: a0 08
    lda #9                                                            ; 3e2e: a9 09
    sta width_in_cells                                                ; 3e30: 85 3c
    lda #2                                                            ; 3e32: a9 02
    sta height_in_cells                                               ; 3e34: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e36: 20 bb 1a
; draw 9x2 rectangle at (23,8)
    ldx #$17                                                          ; 3e39: a2 17
    jsr copy_rectangle_of_memory_to_screen                            ; 3e3b: 20 bb 1a
; draw 3x12 rectangle at (14,10)
    ldx #$0e                                                          ; 3e3e: a2 0e
    ldy #$0a                                                          ; 3e40: a0 0a
    lda #3                                                            ; 3e42: a9 03
    sta width_in_cells                                                ; 3e44: 85 3c
    lda #$0c                                                          ; 3e46: a9 0c
    sta height_in_cells                                               ; 3e48: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e4a: 20 bb 1a
; draw 3x12 rectangle at (23,10)
    ldx #$17                                                          ; 3e4d: a2 17
    jsr copy_rectangle_of_memory_to_screen                            ; 3e4f: 20 bb 1a
; draw 3x2 rectangle at (11,15)
    ldx #$0b                                                          ; 3e52: a2 0b
    ldy #$0f                                                          ; 3e54: a0 0f
    lda #2                                                            ; 3e56: a9 02
    sta height_in_cells                                               ; 3e58: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e5a: 20 bb 1a
; draw 3x2 rectangle at (26,15)
    ldx #$1a                                                          ; 3e5d: a2 1a
    jsr copy_rectangle_of_memory_to_screen                            ; 3e5f: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3e62: 20 90 1b
    ldx #$0b                                                          ; 3e65: a2 0b
    ldy #$0e                                                          ; 3e67: a0 0e
    jsr draw_sprite_nest_at_cell_xy_and_write_to_collision_map        ; 3e69: 20 0b 3c
    ldx #$1a                                                          ; 3e6c: a2 1a
    jsr draw_sprite_nest_at_cell_xy_and_write_to_collision_map        ; 3e6e: 20 0b 3c
    ldx #3                                                            ; 3e71: a2 03
    ldy #2                                                            ; 3e73: a0 02
    lda #1                                                            ; 3e75: a9 01
    sta width_in_cells                                                ; 3e77: 85 3c
    lda #3                                                            ; 3e79: a9 03
    sta height_in_cells                                               ; 3e7b: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e7d: 20 44 1e
    ldx #$24 ; '$'                                                    ; 3e80: a2 24
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e82: 20 44 1e
    jsr start_room                                                    ; 3e85: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 3e88: 20 da 12
    and #exit_room_bottom                                             ; 3e8b: 29 02
    beq room_3_game_update_loop                                       ; 3e8d: f0 f9
    ldx #2                                                            ; 3e8f: a2 02
    ldy current_level                                                 ; 3e91: a4 31
    jmp initialise_level_and_room                                     ; 3e93: 4c 40 11

room_3_update_handler
    lda #3                                                            ; 3e96: a9 03
    sta currently_updating_logic_for_room_index                       ; 3e98: 8d ba 1a
    lda #objectid_fire1                                               ; 3e9b: a9 03
    ldx #3                                                            ; 3e9d: a2 03
    ldy #5                                                            ; 3e9f: a0 05
    jsr update_brazier_and_fire                                       ; 3ea1: 20 88 19
    lda #objectid_fire2                                               ; 3ea4: a9 04
    ldx #$25 ; '%'                                                    ; 3ea6: a2 25
    jsr update_brazier_and_fire                                       ; 3ea8: 20 88 19
    ldx #$1b                                                          ; 3eab: a2 1b
    lda #4                                                            ; 3ead: a9 04
    sta temp_sprite_x_offset                                          ; 3eaf: 85 3a
    ldy #$0e                                                          ; 3eb1: a0 0e
    lda #objectid_sparkles                                            ; 3eb3: a9 05
    jmp update_level_completion                                       ; 3eb5: 4c 10 1a

update_bird
    lda #bird_transition_out_animation - bird_base_animations         ; 3eb8: a9 1d
    sta transform_out_animation                                       ; 3eba: 8d ed 22
    ldx #<bird_base_animations                                        ; 3ebd: a2 46
    ldy #>bird_base_animations                                        ; 3ebf: a0 3b
    lda #objectid_bird                                                ; 3ec1: a9 04
    jsr set_base_animation_address_and_handle_transform_in_out        ; 3ec3: 20 ee 22
    bne set_player_animation_step_local                               ; 3ec6: d0 72
; check for reversing bird direction
    cpy #bird_turn1_mid_way - bird_base_animations                    ; 3ec8: c0 3f
    beq reverse_direction_of_player                                   ; 3eca: f0 04
    cpy #bird_turn_while_flying_mid_way - bird_base_animations        ; 3ecc: c0 61
    bne check_bird_wall_and_floor_collision                           ; 3ece: d0 0b
reverse_direction_of_player
    lda object_direction                                              ; 3ed0: ad be 09
    eor #$fe                                                          ; 3ed3: 49 fe
    sta object_direction                                              ; 3ed5: 8d be 09
    jmp set_player_animation_step                                     ; 3ed8: 4c ca 3f

check_bird_wall_and_floor_collision
    jsr update_player_hitting_floor_or_pushed                         ; 3edb: 20 c4 23
    beq no_floor_collision                                            ; 3ede: f0 03
    jmp bird_hit_wall_or_floor                                        ; 3ee0: 4c 61 3f

no_floor_collision
    lda jump_requested                                                ; 3ee3: ad c7 3a
    beq no_flying_requested                                           ; 3ee6: f0 55
    ldx #bird_fly_straight_up_animation - bird_base_animations        ; 3ee8: a2 4e
    lda move_left_requested                                           ; 3eea: ad ca 3a
    ora move_right_requested                                          ; 3eed: 0d cb 3a
    bne left_or_right_requested                                       ; 3ef0: d0 05
    dec temp_top_offset                                               ; 3ef2: ce 50 25
    bne check_for_player_rock_collisions                              ; 3ef5: d0 2a                   ; ALWAYS branch

left_or_right_requested
    ldx #bird_animation5 - bird_base_animations                       ; 3ef7: a2 49
    lda move_left_requested                                           ; 3ef9: ad ca 3a
    and move_right_requested                                          ; 3efc: 2d cb 3a
    bne left_and_right_requested                                      ; 3eff: d0 2f
    ldx #bird_turn_while_flying_animation - bird_base_animations      ; 3f01: a2 5d
    lda player_move_direction_requested                               ; 3f03: ad c9 3a
    cmp object_direction                                              ; 3f06: cd be 09
    bne left_and_right_requested                                      ; 3f09: d0 25
    ldx #bird_flying_sideways_animation - bird_base_animations        ; 3f0b: a2 53
    lda #1                                                            ; 3f0d: a9 01
    sta temp_bottom_offset                                            ; 3f0f: 8d 51 25
    lda object_direction                                              ; 3f12: ad be 09
    cmp #$ff                                                          ; 3f15: c9 ff
    beq player_looking_left                                           ; 3f17: f0 05
    inc temp_right_offset                                             ; 3f19: ee d1 24
    bne check_for_player_rock_collisions                              ; 3f1c: d0 03
player_looking_left
    dec temp_left_offset                                              ; 3f1e: ce d0 24
check_for_player_rock_collisions
    lda #objectid_player                                              ; 3f21: a9 00
    jsr get_solid_rock_collision_for_object_a                         ; 3f23: 20 94 28
    beq left_and_right_requested                                      ; 3f26: f0 08
    stx current_player_animation                                      ; 3f28: 8e df 09
    ldy #bird_animation8 - bird_base_animations                       ; 3f2b: a0 58
    jmp set_player_animation_step_local                               ; 3f2d: 4c 3a 3f

left_and_right_requested
    cpx current_player_animation                                      ; 3f30: ec df 09
    beq set_player_animation_step_local                               ; 3f33: f0 05
    stx current_player_animation                                      ; 3f35: 8e df 09
    txa                                                               ; 3f38: 8a
    tay                                                               ; 3f39: a8
set_player_animation_step_local
    jmp set_player_animation_step                                     ; 3f3a: 4c ca 3f

no_flying_requested
    lda current_player_animation                                      ; 3f3d: ad df 09
    cmp #bird_start_hop_animation - bird_base_animations              ; 3f40: c9 66
    bne check_if_player_is_on_the_floor                               ; 3f42: d0 18
    dec temp_top_offset                                               ; 3f44: ce 50 25
    lda #objectid_player                                              ; 3f47: a9 00
    jsr get_solid_rock_collision_for_object_a                         ; 3f49: 20 94 28
    bne set_falling_straight_down                                     ; 3f4c: d0 07
    cpy #bird_start_hop_animation - bird_base_animations              ; 3f4e: c0 66
    beq set_falling_straight_down                                     ; 3f50: f0 03
    jmp set_player_animation_step                                     ; 3f52: 4c ca 3f

set_falling_straight_down
    lda #bird_fall_straight_down_animation - bird_base_animations     ; 3f55: a9 c0
    sta current_player_animation                                      ; 3f57: 8d df 09
    ldy #bird_animation11 - bird_base_animations                      ; 3f5a: a0 6f
check_if_player_is_on_the_floor
    lda object_has_hit_floor_flag                                     ; 3f5c: ad 8f 28
    bne check_for_player_change_of_direction                          ; 3f5f: d0 18
bird_hit_wall_or_floor
    lda #bird_fall_straight_down_animation - bird_base_animations     ; 3f61: a9 c0
    cmp current_player_animation                                      ; 3f63: cd df 09
    beq set_player_animation_step_local                               ; 3f66: f0 d2
    ldx current_player_animation                                      ; 3f68: ae df 09
    sta current_player_animation                                      ; 3f6b: 8d df 09
    ldy #bird_animation12 - bird_base_animations                      ; 3f6e: a0 7c
    cpx #bird_flying_sideways_animation - bird_base_animations        ; 3f70: e0 53
    beq set_player_animation_step_local                               ; 3f72: f0 c6
    ldy #bird_animation15 - bird_base_animations                      ; 3f74: a0 ab
    jmp set_player_animation_step                                     ; 3f76: 4c ca 3f

check_for_player_change_of_direction
    ldx player_move_direction_requested                               ; 3f79: ae c9 3a
    beq bird_is_stationary                                            ; 3f7c: f0 11
    ldy #bird_turn1_animation - bird_base_animations                  ; 3f7e: a0 3b
    cpx object_direction                                              ; 3f80: ec be 09
    bne set_next_animation_to_hop                                     ; 3f83: d0 02
    ldy #bird_start_hop_animation - bird_base_animations              ; 3f85: a0 66
set_next_animation_to_hop
    lda #bird_start_hop_animation - bird_base_animations              ; 3f87: a9 66
    sta current_player_animation                                      ; 3f89: 8d df 09
    jmp check_for_falling_off_edge                                    ; 3f8c: 4c af 3f

bird_is_stationary
    lda current_player_animation                                      ; 3f8f: ad df 09
    cmp #bird_stationary_on_floor_animation - bird_base_animations    ; 3f92: c9 44
    beq check_for_change_to_stationary_for_a_while_state              ; 3f94: f0 10
    cmp #bird_stationary_for_a_while_animation - bird_base_animations ; 3f96: c9 36
    beq check_for_falling_off_edge                                    ; 3f98: f0 15
; bird is staionary on the ground. set a delay before the bird changes to the
; 'stationary for a while' state. There seems to be no point in this extra state.
; Perhaps there were once idle sprites that were later dropped during development.
    ldy #$40 ; '@'                                                    ; 3f9a: a0 40
    sty timeout_while_bird_on_ground_stationary                       ; 3f9c: 84 23
    ldy #bird_stationary_on_floor_animation - bird_base_animations    ; 3f9e: a0 44
    sty current_player_animation                                      ; 3fa0: 8c df 09
    jmp check_for_falling_off_edge                                    ; 3fa3: 4c af 3f

check_for_change_to_stationary_for_a_while_state
    dec timeout_while_bird_on_ground_stationary                       ; 3fa6: c6 23
    bne check_for_falling_off_edge                                    ; 3fa8: d0 05
    ldy #bird_stationary_for_a_while_animation - bird_base_animations ; 3faa: a0 36
    sty current_player_animation                                      ; 3fac: 8c df 09
check_for_falling_off_edge
    ldx #0                                                            ; 3faf: a2 00
    lda player_move_direction_requested                               ; 3fb1: ad c9 3a
    beq check_for_player_just_fallen_off_edge                         ; 3fb4: f0 01
    inx                                                               ; 3fb6: e8
check_for_player_just_fallen_off_edge
    lda object_just_fallen_off_edge_direction,x                       ; 3fb7: bd 90 28
    beq set_player_animation_step                                     ; 3fba: f0 0e
; next animation is falling straight down
    ldy #bird_fall_straight_down_animation - bird_base_animations     ; 3fbc: a0 c0
    sty current_player_animation                                      ; 3fbe: 8c df 09
    ldy #bird_animation13 - bird_base_animations                      ; 3fc1: a0 89
    cmp object_direction                                              ; 3fc3: cd be 09
    beq set_player_animation_step                                     ; 3fc6: f0 02
    ldy #bird_animation14 - bird_base_animations                      ; 3fc8: a0 9a
set_player_animation_step
    sty object_current_index_in_animation                             ; 3fca: 8c d4 09
    tya                                                               ; 3fcd: 98
    ldx #<bird_base_animations                                        ; 3fce: a2 46
    ldy #>bird_base_animations                                        ; 3fd0: a0 3b
    jsr set_player_spriteid_and_offset_from_animation_table           ; 3fd2: 20 00 22
    lda #objectid_player                                              ; 3fd5: a9 00
    jsr update_object_a_solid_rock_collision                          ; 3fd7: 20 f5 25
    lda #$40 ; '@'                                                    ; 3fda: a9 40
    sta object_left_low                                               ; 3fdc: 85 70
    lda #$3b ; ';'                                                    ; 3fde: a9 3b
    sta object_left_high                                              ; 3fe0: 85 71
    ldx object_current_index_in_animation                             ; 3fe2: ae d4 09
    inx                                                               ; 3fe5: e8
    inx                                                               ; 3fe6: e8
    inx                                                               ; 3fe7: e8
    lda bird_base_animations,x                                        ; 3fe8: bd 46 3b
    ldx #<bird_accessory_sprite_list                                  ; 3feb: a2 45
    ldy #>bird_accessory_sprite_list                                  ; 3fed: a0 3b
    jmp update_player_accessory_object_animation                      ; 3fef: 4c 48 22

; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 20                                                          ; 3ff2: 14                      ; initial player X cell
    !byte 22                                                          ; 3ff3: 16                      ; initial player Y cell

; ########################################
; ########################################
; ###     |     ###      ###     |     ###
; ###     |     ###      ###     |     ###
; ###     |     ###      ###     |     ###
; ###     |     ###      ###     |     ###
; ###     |     ###      ###     |     ###
; ###     |     ###      ###     |     ###
; ###OOO  |     ###      ###OOO  |     ###
; ######  |     ###      ######  |     ###
; ######  |     ###      ######  |  OOO###
; ###     |     ###              |  ######
; ###     |  ######              |  ######
; ###     |  ######              |     ###
; ###     |                      |     ###
; ###     |                      |     ###
;         |                      |     ###
;         |                      |     ###
;         |                      |     ###
;         |                      |     ###
;                                      ###
; ######              P                ###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_0_code
    ldx #0                                                            ; 3ff4: a2 00
    ldy #0                                                            ; 3ff6: a0 00
    lda #$ff                                                          ; 3ff8: a9 ff
    sta width_in_cells                                                ; 3ffa: 85 3c
    lda #2                                                            ; 3ffc: a9 02
    sta height_in_cells                                               ; 3ffe: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4000: 20 bb 1a
; draw 3x14 rectangle at (0,2)
    ldy #2                                                            ; 4003: a0 02
    lda #3                                                            ; 4005: a9 03
    sta width_in_cells                                                ; 4007: 85 3c
    lda #$0e                                                          ; 4009: a9 0e
    sta height_in_cells                                               ; 400b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 400d: 20 bb 1a
; draw 3x12 rectangle at (14,2)
    ldx #$0e                                                          ; 4010: a2 0e
    lda #$0c                                                          ; 4012: a9 0c
    sta height_in_cells                                               ; 4014: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4016: 20 bb 1a
; draw 3x9 rectangle at (23,2)
    ldx #$17                                                          ; 4019: a2 17
    lda #9                                                            ; 401b: a9 09
    sta height_in_cells                                               ; 401d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 401f: 20 bb 1a
; draw 3x20 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 4022: a2 25
    lda #$14                                                          ; 4024: a9 14
    sta height_in_cells                                               ; 4026: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4028: 20 bb 1a
; draw 3x2 rectangle at (3,9)
    ldx #3                                                            ; 402b: a2 03
    ldy #9                                                            ; 402d: a0 09
    lda #2                                                            ; 402f: a9 02
    sta height_in_cells                                               ; 4031: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4033: 20 bb 1a
; draw 3x2 rectangle at (11,12)
    ldx #$0b                                                          ; 4036: a2 0b
    ldy #$0c                                                          ; 4038: a0 0c
    jsr copy_rectangle_of_memory_to_screen                            ; 403a: 20 bb 1a
; draw 3x2 rectangle at (26,9)
    ldx #$1a                                                          ; 403d: a2 1a
    ldy #9                                                            ; 403f: a0 09
    jsr copy_rectangle_of_memory_to_screen                            ; 4041: 20 bb 1a
; draw 3x2 rectangle at (34,11)
    ldx #$22 ; '"'                                                    ; 4044: a2 22
    ldy #$0b                                                          ; 4046: a0 0b
    jsr copy_rectangle_of_memory_to_screen                            ; 4048: 20 bb 1a
; draw 6x1 rectangle at (0,21)
    ldx #0                                                            ; 404b: a2 00
    ldy #$15                                                          ; 404d: a0 15
    lda #6                                                            ; 404f: a9 06
    sta width_in_cells                                                ; 4051: 85 3c
    lda #1                                                            ; 4053: a9 01
    sta height_in_cells                                               ; 4055: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4057: 20 bb 1a
; draw 255x255 rectangle at (0,22)
    iny                                                               ; 405a: c8
    lda #$ff                                                          ; 405b: a9 ff
    sta width_in_cells                                                ; 405d: 85 3c
    sta height_in_cells                                               ; 405f: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4061: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 4064: 20 90 1b
    ldx #3                                                            ; 4067: a2 03
    ldy #8                                                            ; 4069: a0 08
    jsr draw_sprite_nest_at_cell_xy_and_write_to_collision_map        ; 406b: 20 0b 3c
    ldx #$1a                                                          ; 406e: a2 1a
    jsr draw_sprite_nest_at_cell_xy_and_write_to_collision_map        ; 4070: 20 0b 3c
    ldx #$22 ; '"'                                                    ; 4073: a2 22
    ldy #$0a                                                          ; 4075: a0 0a
    jsr draw_sprite_nest_at_cell_xy_and_write_to_collision_map        ; 4077: 20 0b 3c
; draw rope at (8,2) length 18
    ldx #8                                                            ; 407a: a2 08
    ldy #2                                                            ; 407c: a0 02
    lda #$12                                                          ; 407e: a9 12
    jsr draw_rope                                                     ; 4080: 20 b9 1d
; draw rope at (31,2) length 18
    ldx #$1f                                                          ; 4083: a2 1f
    jsr draw_rope                                                     ; 4085: 20 b9 1d
    jsr start_room                                                    ; 4088: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 408b: 20 da 12
    and #exit_room_left                                               ; 408e: 29 01
    beq room_0_game_update_loop                                       ; 4090: f0 f9
    ldx #1                                                            ; 4092: a2 01
    ldy current_level                                                 ; 4094: a4 31
    jmp initialise_level_and_room                                     ; 4096: 4c 40 11

; Table for the small egg animations. Each step in an animation is three bytes:
; (0) spriteid, (1) X offset, (2) Y offset.
; Each animation is terminated by an extra zero byte.
small_egg_animations
    !byte 0                                                           ; 4099: 00
small_egg_stationary_animation
    !byte spriteid_small_egg_upright                                  ; 409a: da
    !byte 0                                                           ; 409b: 00
    !byte 0                                                           ; 409c: 00
    !byte 0                                                           ; 409d: 00
small_egg_start_throwing_animation
    !byte spriteid_one_pixel_masked_out                               ; 409e: 00
    !byte 0                                                           ; 409f: 00
    !byte 0                                                           ; 40a0: 00
    !byte spriteid_small_egg_right                                    ; 40a1: d7
    !byte $0a                                                         ; 40a2: 0a
    !byte 1                                                           ; 40a3: 01
    !byte 0                                                           ; 40a4: 00
small_egg_thrown_right_animation
    !byte spriteid_small_egg_right                                    ; 40a5: d7
    !byte 8                                                           ; 40a6: 08
    !byte 0                                                           ; 40a7: 00
    !byte spriteid_small_egg_down                                     ; 40a8: d8
    !byte 8                                                           ; 40a9: 08
    !byte 0                                                           ; 40aa: 00
    !byte spriteid_small_egg_down                                     ; 40ab: d8
    !byte 8                                                           ; 40ac: 08
    !byte 0                                                           ; 40ad: 00
    !byte spriteid_small_egg_left                                     ; 40ae: d9
    !byte 8                                                           ; 40af: 08
    !byte 0                                                           ; 40b0: 00
    !byte spriteid_small_egg_left                                     ; 40b1: d9
    !byte 8                                                           ; 40b2: 08
    !byte 0                                                           ; 40b3: 00
    !byte spriteid_small_egg_upright                                  ; 40b4: da
    !byte 8                                                           ; 40b5: 08
    !byte 0                                                           ; 40b6: 00
    !byte spriteid_small_egg_upright                                  ; 40b7: da
    !byte 8                                                           ; 40b8: 08
    !byte 0                                                           ; 40b9: 00
    !byte spriteid_small_egg_right                                    ; 40ba: d7
    !byte 8                                                           ; 40bb: 08
    !byte 0                                                           ; 40bc: 00
    !byte 0                                                           ; 40bd: 00
small_egg_thrown_left_animation
    !byte spriteid_small_egg_right                                    ; 40be: d7
    !byte $fc                                                         ; 40bf: fc
    !byte 0                                                           ; 40c0: 00
    !byte spriteid_small_egg_upright                                  ; 40c1: da
    !byte $fe                                                         ; 40c2: fe
    !byte 2                                                           ; 40c3: 02
    !byte spriteid_small_egg_upright                                  ; 40c4: da
    !byte $fe                                                         ; 40c5: fe
    !byte 4                                                           ; 40c6: 04
    !byte spriteid_small_egg_upright                                  ; 40c7: da
    !byte 0                                                           ; 40c8: 00
    !byte 6                                                           ; 40c9: 06
    !byte 0                                                           ; 40ca: 00
small_egg_falling_animation
    !byte spriteid_small_egg_upright                                  ; 40cb: da
    !byte 0                                                           ; 40cc: 00
    !byte 8                                                           ; 40cd: 08
    !byte 0                                                           ; 40ce: 00

; The small egg starts in room 0 but it can move between rooms, either by being carried
; by the player or by being thrown. Its position updating is always handled by
; room_0_update_handler wherever it is.
room_0_update_handler
    lda #0                                                            ; 40cf: a9 00
    sta currently_updating_logic_for_room_index                       ; 40d1: 8d ba 1a
    ldx #$25 ; '%'                                                    ; 40d4: a2 25
    ldy #$11                                                          ; 40d6: a0 11
    lda #objectid_fire1                                               ; 40d8: a9 03
    jsr update_brazier_and_fire                                       ; 40da: 20 88 19
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 40dd: ad 2b 13
    bne room0_first_update                                            ; 40e0: d0 03
    jmp room0_not_first_update                                        ; 40e2: 4c 6e 41

room0_first_update
    lda #spriteid_egg_toolbar                                         ; 40e5: a9 d3
    sta toolbar_collectable_spriteids+1                               ; 40e7: 8d e9 2e
    lda #spriteid_egg                                                 ; 40ea: a9 d2
    sta collectable_spriteids+1                                       ; 40ec: 8d ee 2e
    sta collectable_being_used_spriteids + 1                          ; 40ef: 8d f3 2e
    ldx #<envelope1                                                   ; 40f2: a2 d8
    ldy #>envelope1                                                   ; 40f4: a0 45
    jsr define_envelope                                               ; 40f6: 20 5e 39
; check for level change (branch if not)
    lda current_level                                                 ; 40f9: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 40fb: c5 51
    beq initialise_small_egg                                          ; 40fd: f0 2b
    lda save_game_level_e_small_egg_status                            ; 40ff: ad 13 0a
    bmi initialise_small_egg                                          ; 4102: 30 26                   ; branch if have collected egg
    lda #0                                                            ; 4104: a9 00
    sta room_containing_small_egg                                     ; 4106: 8d 75 0a
    lda #1                                                            ; 4109: a9 01
    sta thrown_egg_direction                                          ; 410b: 8d 73 0a
    lda #$da                                                          ; 410e: a9 da
    sta thrown_egg_x_low                                              ; 4110: 8d 70 0a
    lda #0                                                            ; 4113: a9 00
    sta thrown_egg_x_high                                             ; 4115: 8d 71 0a
    lda #$3a ; ':'                                                    ; 4118: a9 3a
    sta thrown_egg_y_low                                              ; 411a: 8d 72 0a
    lda #small_egg_stationary_animation - small_egg_animations        ; 411d: a9 01
    sta save_game_level_e_small_egg_status                            ; 411f: 8d 13 0a
    sta small_egg_animation_step                                      ; 4122: 8d 74 0a
    lda #0                                                            ; 4125: a9 00
    sta level_workspace_small_egg_offscreen_time                      ; 4127: 8d 6f 0a
initialise_small_egg
    lda #spriteid_erase_small_egg                                     ; 412a: a9 d6
    sta object_erase_type + objectid_small_egg                        ; 412c: 8d ae 38
    lda #$c0                                                          ; 412f: a9 c0
    sta object_z_order + objectid_small_egg                           ; 4131: 8d c4 38
    lda desired_room_index                                            ; 4134: a5 30
    cmp room_containing_small_egg                                     ; 4136: cd 75 0a
    bne skip_small_egg_setup                                          ; 4139: d0 2b
    lda save_game_level_e_small_egg_status                            ; 413b: ad 13 0a
    bmi skip_small_egg_setup                                          ; 413e: 30 26                   ; branch if have collected egg
    jsr update_object_properties_for_small_egg                        ; 4140: 20 1d 43
    ldy small_egg_animation_step                                      ; 4143: ac 74 0a
    lda small_egg_animations,y                                        ; 4146: b9 99 40
    sta object_spriteid + objectid_small_egg                          ; 4149: 8d aa 09
; Update the egg position repeatedly (without updating the screen) to catch up on any
; missed animation between it being thrown off screen and now when we are going to see
; it again. Note that small_egg_animation_update will set the offscreen time to 0 if
; there is nothing else to do, so this loop doesn't do unnecessary work.
small_egg_animation_catch_up_loop
    lda desired_room_index                                            ; 414c: a5 30
    cmp room_containing_small_egg                                     ; 414e: cd 75 0a
    bne skip_small_egg_setup                                          ; 4151: d0 13
    lda level_workspace_small_egg_offscreen_time                      ; 4153: ad 6f 0a
    beq skip_small_egg_setup                                          ; 4156: f0 0e
    dec level_workspace_small_egg_offscreen_time                      ; 4158: ce 6f 0a
    ldx #objectid_small_egg                                           ; 415b: a2 02
    jsr copy_object_state_to_old                                      ; 415d: 20 f7 20
    jsr small_egg_animation_update                                    ; 4160: 20 31 42
    jmp small_egg_animation_catch_up_loop                             ; 4163: 4c 4c 41

skip_small_egg_setup
    lda #spriteid_one_pixel_masked_out                                ; 4166: a9 00
    sta object_spriteid_old + objectid_small_egg                      ; 4168: 8d b5 09
    jmp return2                                                       ; 416b: 4c 30 42

room0_not_first_update
    lda #0                                                            ; 416e: a9 00
    sta player_just_used_small_egg_flag                               ; 4170: 8d 89 43
    lda player_held_object_spriteid                                   ; 4173: a5 52
    sta remember_object_held_sprite                                   ; 4175: 8d 8a 43
    lda object_spriteid_old + objectid_small_egg                      ; 4178: ad b5 09
    sta remember_small_egg_sprite                                     ; 417b: 8d 8b 43
    lda save_game_level_e_small_egg_status                            ; 417e: ad 13 0a
    bmi have_small_egg                                                ; 4181: 30 12                   ; branch if have collected egg
    lda desired_room_index                                            ; 4183: a5 30
    cmp room_containing_small_egg                                     ; 4185: cd 75 0a
    beq small_egg_in_room                                             ; 4188: f0 53
; The egg is off screen for this update, so increment the offscreen time (capping at
; &880 so its position can be correctly updated when it next appears on screen.
    lda level_workspace_small_egg_offscreen_time                      ; 418a: ad 6f 0a
    bmi return2_local                                                 ; 418d: 30 03
    inc level_workspace_small_egg_offscreen_time                      ; 418f: ee 6f 0a
return2_local
    jmp return2                                                       ; 4192: 4c 30 42

have_small_egg
    lda #spriteid_egg_toolbar                                         ; 4195: a9 d3
    cmp player_using_object_spriteid                                  ; 4197: cd b6 2e
    bne return2_local                                                 ; 419a: d0 f6
    cmp previous_player_using_object_spriteid                         ; 419c: cd b7 2e
    beq return2_local                                                 ; 419f: f0 f1
    dec player_just_used_small_egg_flag                               ; 41a1: ce 89 43
    lda desired_room_index                                            ; 41a4: a5 30
    sta room_containing_small_egg                                     ; 41a6: 8d 75 0a
    lda object_direction                                              ; 41a9: ad be 09
    sta thrown_egg_direction                                          ; 41ac: 8d 73 0a
    lda object_x_low + objectid_player_accessory                      ; 41af: ad 51 09
    sta thrown_egg_x_low                                              ; 41b2: 8d 70 0a
    lda object_x_high + objectid_player_accessory                     ; 41b5: ad 67 09
    sta thrown_egg_x_high                                             ; 41b8: 8d 71 0a
    lda object_y_low + objectid_player_accessory                      ; 41bb: ad 7d 09
    sta thrown_egg_y_low                                              ; 41be: 8d 72 0a
    lda #small_egg_thrown_right_animation - small_egg_animations      ; 41c1: a9 0c
    sta save_game_level_e_small_egg_status                            ; 41c3: 8d 13 0a
    lda #small_egg_start_throwing_animation - small_egg_animations    ; 41c6: a9 05
    sta small_egg_animation_step                                      ; 41c8: 8d 74 0a
    jsr update_object_properties_for_small_egg                        ; 41cb: 20 1d 43
    lda object_spriteid + objectid_player_accessory                   ; 41ce: ad a9 09
    sta object_spriteid + objectid_small_egg                          ; 41d1: 8d aa 09
    ldx #objectid_small_egg                                           ; 41d4: a2 02
    jsr copy_object_state_to_old                                      ; 41d6: 20 f7 20
    lda #0                                                            ; 41d9: a9 00
    sta player_held_object_spriteid                                   ; 41db: 85 52
small_egg_in_room
    jsr small_egg_animation_update                                    ; 41dd: 20 31 42
    lda desired_room_index                                            ; 41e0: a5 30
    cmp room_containing_small_egg                                     ; 41e2: cd 75 0a
    beq restore_small_egg_sprite_and_test_for_collision_with_player   ; 41e5: f0 05
    lda #0                                                            ; 41e7: a9 00
    sta level_workspace_small_egg_offscreen_time                      ; 41e9: 8d 6f 0a
restore_small_egg_sprite_and_test_for_collision_with_player
    lda remember_small_egg_sprite                                     ; 41ec: ad 8b 43
    sta object_spriteid_old + objectid_small_egg                      ; 41ef: 8d b5 09
    ldx #objectid_old_player                                          ; 41f2: a2 0b
    ldy #objectid_small_egg                                           ; 41f4: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 41f6: 20 e2 28
    ldx remember_object_held_sprite                                   ; 41f9: ae 8a 43
    stx player_held_object_spriteid                                   ; 41fc: 86 52
    ora #0                                                            ; 41fe: 09 00
    beq update_small_egg_sounds_and_check_if_just_used_egg            ; 4200: f0 17
    lda player_just_used_small_egg_flag                               ; 4202: ad 89 43
    bne take_small_egg                                                ; 4205: d0 05
; add small egg to toolbar
    lda #spriteid_egg_toolbar                                         ; 4207: a9 d3
    jsr find_or_create_menu_slot_for_A                                ; 4209: 20 bd 2b
take_small_egg
    lda #spriteid_one_pixel_masked_out                                ; 420c: a9 00
    sta object_spriteid + objectid_small_egg                          ; 420e: 8d aa 09
    lda #small_egg_status_collected                                   ; 4211: a9 ff
    sta save_game_level_e_small_egg_status                            ; 4213: 8d 13 0a
    jmp return2                                                       ; 4216: 4c 30 42

update_small_egg_sounds_and_check_if_just_used_egg
    jsr update_small_egg_collision_sounds                             ; 4219: 20 3b 43
    lda player_just_used_small_egg_flag                               ; 421c: ad 89 43
    beq return2                                                       ; 421f: f0 0f
    lda #spriteid_egg_toolbar                                         ; 4221: a9 d3
    jsr remove_item_from_toolbar_menu                                 ; 4223: 20 e0 2b
    lda #spriteid_one_pixel_masked_out                                ; 4226: a9 00
    sta object_spriteid + objectid_player_accessory                   ; 4228: 8d a9 09
    sta player_using_object_spriteid                                  ; 422b: 8d b6 2e
    sta player_held_object_spriteid                                   ; 422e: 85 52
return2
    rts                                                               ; 4230: 60

small_egg_animation_update
    lda small_egg_animation_step                                      ; 4231: ad 74 0a
    clc                                                               ; 4234: 18
    adc #3                                                            ; 4235: 69 03
    tay                                                               ; 4237: a8
    lda small_egg_animations,y                                        ; 4238: b9 99 40
    bne got_small_egg_animation_step_in_y                             ; 423b: d0 03
    ldy save_game_level_e_small_egg_status                            ; 423d: ac 13 0a
got_small_egg_animation_step_in_y
    lda save_game_level_e_small_egg_status                            ; 4240: ad 13 0a
    cmp #small_egg_thrown_right_animation - small_egg_animations      ; 4243: c9 0c
    bne small_egg_not_being_thrown                                    ; 4245: d0 23
    lda thrown_egg_direction                                          ; 4247: ad 73 0a
    bmi small_egg_thrown_left                                         ; 424a: 30 05
    inc temp_right_offset                                             ; 424c: ee d1 24
    bne small_egg_temp_left_right_offset_set                          ; 424f: d0 03                   ; ALWAYS branch
small_egg_thrown_left
    dec temp_left_offset                                              ; 4251: ce d0 24
small_egg_temp_left_right_offset_set
    lda #1                                                            ; 4254: a9 01
    sta temp_bottom_offset                                            ; 4256: 8d 51 25
    lda #objectid_small_egg                                           ; 4259: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 425b: 20 94 28
    beq set_small_egg_animation_step                                  ; 425e: f0 24
    lda #small_egg_falling_animation - small_egg_animations           ; 4260: a9 32
    sta save_game_level_e_small_egg_status                            ; 4262: 8d 13 0a
    ldy #small_egg_thrown_left_animation - small_egg_animations       ; 4265: a0 25
    jmp set_small_egg_animation_step                                  ; 4267: 4c 84 42

small_egg_not_being_thrown
    cmp #small_egg_falling_animation - small_egg_animations           ; 426a: c9 32
    bne small_egg_not_falling                                         ; 426c: d0 11
    lda #objectid_small_egg                                           ; 426e: a9 02
    sta temp_bottom_offset                                            ; 4270: 8d 51 25
    lda #objectid_small_egg                                           ; 4273: a9 02                   ; redundant instruction
    jsr get_solid_rock_collision_for_object_a                         ; 4275: 20 94 28
    beq set_small_egg_animation_step                                  ; 4278: f0 0a                   ; branch if not collided with anything
    ldy #small_egg_stationary_animation - small_egg_animations        ; 427a: a0 01
    sty save_game_level_e_small_egg_status                            ; 427c: 8c 13 0a
small_egg_not_falling
    lda #0                                                            ; 427f: a9 00
    sta level_workspace_small_egg_offscreen_time                      ; 4281: 8d 6f 0a
set_small_egg_animation_step
    sty small_egg_animation_step                                      ; 4284: 8c 74 0a
    lda small_egg_animations,y                                        ; 4287: b9 99 40
    sta object_spriteid + objectid_small_egg                          ; 428a: 8d aa 09
; get the X offset from the animation table
    iny                                                               ; 428d: c8
    lda small_egg_animations,y                                        ; 428e: b9 99 40
    ldx thrown_egg_direction                                          ; 4291: ae 73 0a
    bpl egg_thrown_to_right                                           ; 4294: 10 05
; the egg has been thrown left, so negate the X offset from the animation table
    eor #$ff                                                          ; 4296: 49 ff
    clc                                                               ; 4298: 18
    adc #1                                                            ; 4299: 69 01
; Set X to the high byte of the X offset
egg_thrown_to_right
    ldx #0                                                            ; 429b: a2 00
    ora #0                                                            ; 429d: 09 00                   ; set flags based on A
    bpl adding_positive_value_to_x                                    ; 429f: 10 01
    dex                                                               ; 42a1: ca
; Add 16-bit offset in XA to thrown_egg_x.
adding_positive_value_to_x
    clc                                                               ; 42a2: 18
    adc thrown_egg_x_low                                              ; 42a3: 6d 70 0a
    sta thrown_egg_x_low                                              ; 42a6: 8d 70 0a
    txa                                                               ; 42a9: 8a
    adc thrown_egg_x_high                                             ; 42aa: 6d 71 0a
    sta thrown_egg_x_high                                             ; 42ad: 8d 71 0a
; Get the Y offset from the animation table and add it to thrown_egg_y_low. This is an
; 8-bit value so no need to mess around with high byte.
    iny                                                               ; 42b0: c8
    lda small_egg_animations,y                                        ; 42b1: b9 99 40
    clc                                                               ; 42b4: 18
    adc thrown_egg_y_low                                              ; 42b5: 6d 72 0a
    sta thrown_egg_y_low                                              ; 42b8: 8d 72 0a
    jsr update_object_properties_for_small_egg                        ; 42bb: 20 1d 43
    lda #objectid_small_egg                                           ; 42be: a9 02
    jsr update_object_a_solid_rock_collision                          ; 42c0: 20 f5 25
    lda object_x_low + objectid_small_egg                             ; 42c3: ad 52 09
    sta thrown_egg_x_low                                              ; 42c6: 8d 70 0a
    lda object_x_high + objectid_small_egg                            ; 42c9: ad 68 09
    sta thrown_egg_x_high                                             ; 42cc: 8d 71 0a
    lda object_y_low + objectid_small_egg                             ; 42cf: ad 7e 09
    sta thrown_egg_y_low                                              ; 42d2: 8d 72 0a
    lda save_game_level_e_small_egg_status                            ; 42d5: ad 13 0a
    cmp #small_egg_thrown_right_animation - small_egg_animations      ; 42d8: c9 0c
    bne return3                                                       ; 42da: d0 40
    ldx #objectid_small_egg                                           ; 42dc: a2 02
    jsr find_left_and_right_of_object                                 ; 42de: 20 34 24
    lda thrown_egg_direction                                          ; 42e1: ad 73 0a
    bmi check_and_move_small_egg_one_room_right                       ; 42e4: 30 1c
; check and move small egg one room left
    lda object_left_cell_x                                            ; 42e6: a5 78
    cmp #game_area_width_cells                                        ; 42e8: c9 28
    bcc return3                                                       ; 42ea: 90 30
    lda thrown_egg_x_low                                              ; 42ec: ad 70 0a
    sec                                                               ; 42ef: 38
    sbc #$40 ; '@'                                                    ; 42f0: e9 40
    sta thrown_egg_x_low                                              ; 42f2: 8d 70 0a
    lda #0                                                            ; 42f5: a9 00
    sbc #0                                                            ; 42f7: e9 00
    sta thrown_egg_x_high                                             ; 42f9: 8d 71 0a
    dec room_containing_small_egg                                     ; 42fc: ce 75 0a
    jmp hide_small_egg                                                ; 42ff: 4c 17 43

check_and_move_small_egg_one_room_right
    lda object_right_cell_x                                           ; 4302: a5 79
    bpl return3                                                       ; 4304: 10 16
    lda thrown_egg_x_low                                              ; 4306: ad 70 0a
    clc                                                               ; 4309: 18
    adc #$40 ; '@'                                                    ; 430a: 69 40
    sta thrown_egg_x_low                                              ; 430c: 8d 70 0a
    lda #1                                                            ; 430f: a9 01
    sta thrown_egg_x_high                                             ; 4311: 8d 71 0a
    inc room_containing_small_egg                                     ; 4314: ee 75 0a
hide_small_egg
    lda #spriteid_one_pixel_masked_out                                ; 4317: a9 00
    sta object_spriteid + objectid_small_egg                          ; 4319: 8d aa 09
return3
    rts                                                               ; 431c: 60

update_object_properties_for_small_egg
    lda thrown_egg_x_low                                              ; 431d: ad 70 0a
    sta object_x_low + objectid_small_egg                             ; 4320: 8d 52 09
    lda thrown_egg_x_high                                             ; 4323: ad 71 0a
    sta object_x_high + objectid_small_egg                            ; 4326: 8d 68 09
    lda thrown_egg_y_low                                              ; 4329: ad 72 0a
    sta object_y_low + objectid_small_egg                             ; 432c: 8d 7e 09
    lda #0                                                            ; 432f: a9 00
    sta object_y_high + objectid_small_egg                            ; 4331: 8d 94 09
    lda thrown_egg_direction                                          ; 4334: ad 73 0a
    sta object_direction + objectid_small_egg                         ; 4337: 8d c0 09
    rts                                                               ; 433a: 60

update_small_egg_collision_sounds
    lda desired_room_index                                            ; 433b: a5 30
    cmp room_containing_small_egg                                     ; 433d: cd 75 0a
    bne return4                                                       ; 4340: d0 46
    lda #2                                                            ; 4342: a9 02
    sta temp_bottom_offset                                            ; 4344: 8d 51 25
    lda #objectid_small_egg                                           ; 4347: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4349: 20 94 28
    beq check_for_delta_x_in_small_egg_movement                       ; 434c: f0 0b
    lda object_y_low + objectid_small_egg                             ; 434e: ad 7e 09
    cmp object_y_low_old + objectid_small_egg                         ; 4351: cd 89 09
    beq check_for_delta_x_in_small_egg_movement                       ; 4354: f0 03
    jsr play_landing_sound                                            ; 4356: 20 a9 23
check_for_delta_x_in_small_egg_movement
    lda object_x_low + objectid_small_egg                             ; 4359: ad 52 09
    sec                                                               ; 435c: 38
    sbc object_x_low_old + objectid_small_egg                         ; 435d: ed 5d 09
    beq return4                                                       ; 4360: f0 26
    lda object_x_high + objectid_small_egg                            ; 4362: ad 68 09
    sbc object_x_high_old + objectid_small_egg                        ; 4365: ed 73 09
    bpl small_egg_moving_right                                        ; 4368: 10 06
    dec temp_left_offset                                              ; 436a: ce d0 24
    jmp test_for_small_egg_collision_with_rock_and_play_sound         ; 436d: 4c 73 43

small_egg_moving_right
    inc temp_right_offset                                             ; 4370: ee d1 24
test_for_small_egg_collision_with_rock_and_play_sound
    lda #1                                                            ; 4373: a9 01
    sta temp_bottom_offset                                            ; 4375: 8d 51 25
    lda #objectid_small_egg                                           ; 4378: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 437a: 20 94 28
    beq return4                                                       ; 437d: f0 09
    lda #0                                                            ; 437f: a9 00
    ldx #<sound1                                                      ; 4381: a2 e6
    ldy #>sound1                                                      ; 4383: a0 45
    jsr play_sound_yx                                                 ; 4385: 20 f6 38
return4
    rts                                                               ; 4388: 60

player_just_used_small_egg_flag
    !byte 0                                                           ; 4389: 00
remember_object_held_sprite
    !byte 0                                                           ; 438a: 00
remember_small_egg_sprite
    !byte 0                                                           ; 438b: 00
; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 20                                                          ; 438c: 14                      ; initial player X cell
    !byte 22                                                          ; 438d: 16                      ; initial player Y cell

; ########################################
; ########################################
;                        ###     |     ###
;                        ###     |     ###
;                        ###     |     ###
;                        ###     |     ###
;                     OOO###     |     ###
; #############################  |     ###
; #############################  |     ###
; ###                            |     ###
; ###                            |     ###
; ###                            |     ###
; ###                            |     ###
; ###          OOO               |  OOO###
;              ###               |  ######
;              ###               |  ######
;                                |
;                                |
;                                |
; ######                         |
; ######
; ######              P             ######
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_1_code
    ldx #0                                                            ; 438e: a2 00
    ldy #0                                                            ; 4390: a0 00
    lda #$ff                                                          ; 4392: a9 ff
    sta width_in_cells                                                ; 4394: 85 3c
    lda #2                                                            ; 4396: a9 02
    sta height_in_cells                                               ; 4398: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 439a: 20 bb 1a
; draw 3x5 rectangle at (23,2)
    ldx #$17                                                          ; 439d: a2 17
    ldy #2                                                            ; 439f: a0 02
    lda #3                                                            ; 43a1: a9 03
    sta width_in_cells                                                ; 43a3: 85 3c
    lda #5                                                            ; 43a5: a9 05
    sta height_in_cells                                               ; 43a7: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43a9: 20 bb 1a
; draw 3x12 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 43ac: a2 25
    lda #$0c                                                          ; 43ae: a9 0c
    sta height_in_cells                                               ; 43b0: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43b2: 20 bb 1a
; draw 29x2 rectangle at (0,7)
    ldx #0                                                            ; 43b5: a2 00
    ldy #7                                                            ; 43b7: a0 07
    lda #$1d                                                          ; 43b9: a9 1d
    sta width_in_cells                                                ; 43bb: 85 3c
    lda #2                                                            ; 43bd: a9 02
    sta height_in_cells                                               ; 43bf: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43c1: 20 bb 1a
; draw 29x2 rectangle at (34,14)
    ldx #$22 ; '"'                                                    ; 43c4: a2 22
    ldy #$0e                                                          ; 43c6: a0 0e
    jsr copy_rectangle_of_memory_to_screen                            ; 43c8: 20 bb 1a
; draw 3x5 rectangle at (0,9)
    ldx #0                                                            ; 43cb: a2 00
    ldy #9                                                            ; 43cd: a0 09
    lda #3                                                            ; 43cf: a9 03
    sta width_in_cells                                                ; 43d1: 85 3c
    lda #5                                                            ; 43d3: a9 05
    sta height_in_cells                                               ; 43d5: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43d7: 20 bb 1a
; draw 3x2 rectangle at (13,14)
    ldx #$0d                                                          ; 43da: a2 0d
    ldy #$0e                                                          ; 43dc: a0 0e
    lda #3                                                            ; 43de: a9 03
    sta width_in_cells                                                ; 43e0: 85 3c
    lda #2                                                            ; 43e2: a9 02
    sta height_in_cells                                               ; 43e4: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43e6: 20 bb 1a
; draw 6x3 rectangle at (0,19)
    ldx #0                                                            ; 43e9: a2 00
    ldy #$13                                                          ; 43eb: a0 13
    lda #6                                                            ; 43ed: a9 06
    sta width_in_cells                                                ; 43ef: 85 3c
    lda #3                                                            ; 43f1: a9 03
    sta height_in_cells                                               ; 43f3: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43f5: 20 bb 1a
; draw 255x3 rectangle at (0,22)
    ldy #$16                                                          ; 43f8: a0 16
    lda #$ff                                                          ; 43fa: a9 ff
    sta width_in_cells                                                ; 43fc: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 43fe: 20 bb 1a
; draw 255x1 rectangle at (34,21)
    ldx #$22 ; '"'                                                    ; 4401: a2 22
    dey                                                               ; 4403: 88
    lda #1                                                            ; 4404: a9 01
    sta height_in_cells                                               ; 4406: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4408: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 440b: 20 90 1b
    ldx #$0d                                                          ; 440e: a2 0d
    ldy #$0d                                                          ; 4410: a0 0d
    jsr draw_sprite_nest_at_cell_xy_and_write_to_collision_map        ; 4412: 20 0b 3c
    ldx #$14                                                          ; 4415: a2 14
    ldy #6                                                            ; 4417: a0 06
    jsr draw_sprite_nest_at_cell_xy_and_write_to_collision_map        ; 4419: 20 0b 3c
    ldx #$22 ; '"'                                                    ; 441c: a2 22
    ldy #$0d                                                          ; 441e: a0 0d
    jsr draw_sprite_nest_at_cell_xy_and_write_to_collision_map        ; 4420: 20 0b 3c
; draw rope at (31,2) length 18
    ldx #$1f                                                          ; 4423: a2 1f
    ldy #2                                                            ; 4425: a0 02
    lda #$12                                                          ; 4427: a9 12
    jsr draw_rope                                                     ; 4429: 20 b9 1d
    jsr start_room                                                    ; 442c: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 442f: 20 da 12
    sta room_exit_direction                                           ; 4432: 85 70
    and #exit_room_left                                               ; 4434: 29 01
    beq room_1_check_right_exit                                       ; 4436: f0 07
    ldx #2                                                            ; 4438: a2 02
    ldy current_level                                                 ; 443a: a4 31
    jmp initialise_level_and_room                                     ; 443c: 4c 40 11

room_1_check_right_exit
    lda room_exit_direction                                           ; 443f: a5 70
    and #exit_room_right                                              ; 4441: 29 04
    beq room_1_game_update_loop                                       ; 4443: f0 ea
    ldx #0                                                            ; 4445: a2 00
    ldy current_level                                                 ; 4447: a4 31
    jmp initialise_level_and_room                                     ; 4449: 4c 40 11

; Table of animations for the big egg. There are three bytes per entry. First byte is a
; sprite ID. Second and third bytes of each entry are signed (X,Y) position offsets,
; added to the egg position. Each animation is terminated with an extra zero byte.
egg_animations_table
    !byte 0                                                           ; 444c: 00

egg_normal_animation
    !byte spriteid_large_egg_upright                                  ; 444d: db
    !byte 0                                                           ; 444e: 00
    !byte 0                                                           ; 444f: 00
    !byte 0                                                           ; 4450: 00                      ; terminator

egg_tilted_animation
    !byte spriteid_large_egg_tilted                                   ; 4451: dc
    !byte 0                                                           ; 4452: 00
    !byte 0                                                           ; 4453: 00
    !byte 0                                                           ; 4454: 00                      ; terminator

egg_falling_off_animation
    !byte spriteid_large_egg_tilted                                   ; 4455: dc
    !byte $f8                                                         ; 4456: f8
    !byte 0                                                           ; 4457: 00
    !byte spriteid_large_egg_sideways                                 ; 4458: dd
    !byte $f8                                                         ; 4459: f8
    !byte 8                                                           ; 445a: 08
    !byte spriteid_large_egg_sideways                                 ; 445b: dd
    !byte $fc                                                         ; 445c: fc
    !byte 4                                                           ; 445d: 04
    !byte spriteid_large_egg_sideways                                 ; 445e: dd
    !byte $fc                                                         ; 445f: fc
    !byte 4                                                           ; 4460: 04
    !byte 0                                                           ; 4461: 00                      ; terminator

egg_falling_straight_down_animation
    !byte spriteid_large_egg_sideways                                 ; 4462: dd
    !byte 0                                                           ; 4463: 00
    !byte 8                                                           ; 4464: 08
    !byte 0                                                           ; 4465: 00                      ; terminator

egg_stationary_animation
    !byte spriteid_large_egg_sideways                                 ; 4466: dd
    !byte 0                                                           ; 4467: 00
    !byte 0                                                           ; 4468: 00
    !byte 0                                                           ; 4469: 00                      ; terminator

; check for first update in room (branch if not)
room_1_update_handler
    lda update_room_first_update_flag                                 ; 446a: ad 2b 13
    beq room_1_not_first_update                                       ; 446d: f0 4d
; check for level change (branch if not)
    lda current_level                                                 ; 446f: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 4471: c5 51
    beq room_1_not_this_room1                                         ; 4473: f0 2a
    ldx #$70 ; 'p'                                                    ; 4475: a2 70
    ldy #$58 ; 'X'                                                    ; 4477: a0 58
    lda save_game_level_e_big_egg_animation_index                     ; 4479: ad 14 0a
    cmp #egg_normal_animation - egg_animations_table                  ; 447c: c9 01
    beq room_1_set_egg_animation_and_position                         ; 447e: f0 13
    cmp #egg_tilted_animation - egg_animations_table                  ; 4480: c9 05
    beq room_1_set_egg_animation_and_position                         ; 4482: f0 0f
    ora #0                                                            ; 4484: 09 00                   ; set flags based on A
    bne egg_on_floor                                                  ; 4486: d0 05
    lda #egg_normal_animation - egg_animations_table                  ; 4488: a9 01
    jmp room_1_set_egg_animation_and_position                         ; 448a: 4c 93 44

egg_on_floor
    ldx #$58 ; 'X'                                                    ; 448d: a2 58
    ldy #$a8                                                          ; 448f: a0 a8
    lda #egg_stationary_animation - egg_animations_table              ; 4491: a9 1a
room_1_set_egg_animation_and_position
    sta save_game_level_e_big_egg_animation_index                     ; 4493: 8d 14 0a
    sta egg_animation_index                                           ; 4496: 8d 76 0a
    stx room_1_egg_x                                                  ; 4499: 8e 77 0a
    sty room_1_egg_y                                                  ; 449c: 8c 78 0a
room_1_not_this_room1
    lda desired_room_index                                            ; 449f: a5 30
    cmp #1                                                            ; 44a1: c9 01
    bne room_1_not_this_room2                                         ; 44a3: d0 14
    ldx #<envelope2                                                   ; 44a5: a2 ee
    ldy #>envelope2                                                   ; 44a7: a0 45
    jsr define_envelope                                               ; 44a9: 20 5e 39
    lda #spriteid_erase_large_egg                                     ; 44ac: a9 de
    sta object_erase_type + objectid_egg                              ; 44ae: 8d af 38
    lda #0                                                            ; 44b1: a9 00
    sta object_x_high + objectid_egg                                  ; 44b3: 8d 69 09
    sta object_y_high + objectid_egg                                  ; 44b6: 8d 95 09
room_1_not_this_room2
    jmp finish_setting_up_egg                                         ; 44b9: 4c 51 45

room_1_not_first_update
    lda egg_animation_index                                           ; 44bc: ad 76 0a
    clc                                                               ; 44bf: 18
    adc #3                                                            ; 44c0: 69 03
    tay                                                               ; 44c2: a8
    lda egg_animations_table,y                                        ; 44c3: b9 4c 44
    bne not_end_of_egg_animation_sequence                             ; 44c6: d0 03
    ldy save_game_level_e_big_egg_animation_index                     ; 44c8: ac 14 0a
not_end_of_egg_animation_sequence
    lda save_game_level_e_big_egg_animation_index                     ; 44cb: ad 14 0a
    cmp #egg_normal_animation - egg_animations_table                  ; 44ce: c9 01
    bne check_if_egg_is_tilted                                        ; 44d0: d0 0d
    jsr test_if_small_egg_hit_large_egg                               ; 44d2: 20 a1 45
    beq new_egg_animation_index_in_y                                  ; 44d5: f0 61
    ldy #egg_tilted_animation - egg_animations_table                  ; 44d7: a0 05
    sty save_game_level_e_big_egg_animation_index                     ; 44d9: 8c 14 0a
    jmp new_egg_animation_index_in_y                                  ; 44dc: 4c 38 45

check_if_egg_is_tilted
    cmp #egg_tilted_animation - egg_animations_table                  ; 44df: c9 05
    bne check_if_egg_is_falling_straight_down                         ; 44e1: d0 28
    jsr test_if_small_egg_hit_large_egg                               ; 44e3: 20 a1 45
    beq new_egg_animation_index_in_y                                  ; 44e6: f0 50
    lda desired_room_index                                            ; 44e8: a5 30
    cmp #1                                                            ; 44ea: c9 01
    bne room_1_not_this_room3                                         ; 44ec: d0 13
    lda #collision_map_none                                           ; 44ee: a9 00
    sta value_to_write_to_collision_map                               ; 44f0: 85 3e
    ldx #$0e                                                          ; 44f2: a2 0e
    ldy #$0b                                                          ; 44f4: a0 0b
    lda #1                                                            ; 44f6: a9 01
    sta width_in_cells                                                ; 44f8: 85 3c
    lda #2                                                            ; 44fa: a9 02
    sta height_in_cells                                               ; 44fc: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 44fe: 20 44 1e
room_1_not_this_room3
    lda #egg_falling_straight_down_animation - egg_animations_table   ; 4501: a9 16
    sta save_game_level_e_big_egg_animation_index                     ; 4503: 8d 14 0a
    ldy #egg_falling_off_animation - egg_animations_table             ; 4506: a0 09
    jmp new_egg_animation_index_in_y                                  ; 4508: 4c 38 45

check_if_egg_is_falling_straight_down
    cmp #egg_falling_straight_down_animation - egg_animations_table   ; 450b: c9 16
    bne new_egg_animation_index_in_y                                  ; 450d: d0 29
    lda room_1_egg_y                                                  ; 450f: ad 78 0a
    cmp #$a0                                                          ; 4512: c9 a0
    bcc new_egg_animation_index_in_y                                  ; 4514: 90 22
    bne set_egg_stationary                                            ; 4516: d0 1b
    lda desired_room_index                                            ; 4518: a5 30
    cmp #1                                                            ; 451a: c9 01
    bne new_egg_animation_index_in_y                                  ; 451c: d0 1a
    lda #0                                                            ; 451e: a9 00
    ldx #<sound2                                                      ; 4520: a2 04
    ldy #>sound2                                                      ; 4522: a0 46
    jsr play_sound_yx                                                 ; 4524: 20 f6 38
    ldx #<sound3                                                      ; 4527: a2 fc
    ldy #>sound3                                                      ; 4529: a0 45
    jsr play_sound_yx                                                 ; 452b: 20 f6 38
    ldy #egg_falling_straight_down_animation - egg_animations_table   ; 452e: a0 16
    jmp new_egg_animation_index_in_y                                  ; 4530: 4c 38 45

set_egg_stationary
    ldy #egg_stationary_animation - egg_animations_table              ; 4533: a0 1a
    sty save_game_level_e_big_egg_animation_index                     ; 4535: 8c 14 0a
new_egg_animation_index_in_y
    sty egg_animation_index                                           ; 4538: 8c 76 0a
    iny                                                               ; 453b: c8
; add animation x offset to egg x position
    lda egg_animations_table,y                                        ; 453c: b9 4c 44
    clc                                                               ; 453f: 18
    adc room_1_egg_x                                                  ; 4540: 6d 77 0a
    sta room_1_egg_x                                                  ; 4543: 8d 77 0a
; add animation y offset to egg y position
    iny                                                               ; 4546: c8
    lda egg_animations_table,y                                        ; 4547: b9 4c 44
    clc                                                               ; 454a: 18
    adc room_1_egg_y                                                  ; 454b: 6d 78 0a
    sta room_1_egg_y                                                  ; 454e: 8d 78 0a
finish_setting_up_egg
    lda desired_room_index                                            ; 4551: a5 30
    cmp #1                                                            ; 4553: c9 01
    bne return5                                                       ; 4555: d0 49
    ldy egg_animation_index                                           ; 4557: ac 76 0a
    lda egg_animations_table,y                                        ; 455a: b9 4c 44
    sta object_spriteid + objectid_egg                                ; 455d: 8d ab 09
    lda room_1_egg_x                                                  ; 4560: ad 77 0a
    sta object_x_low + objectid_egg                                   ; 4563: 8d 53 09
    lda room_1_egg_y                                                  ; 4566: ad 78 0a
    sta object_y_low + objectid_egg                                   ; 4569: 8d 7f 09
    lda #collision_map_solid_rock                                     ; 456c: a9 03
    sta value_to_write_to_collision_map                               ; 456e: 85 3e
    ldx #$0e                                                          ; 4570: a2 0e
    ldy #$0b                                                          ; 4572: a0 0b
    lda #1                                                            ; 4574: a9 01
    sta width_in_cells                                                ; 4576: 85 3c
    lda #2                                                            ; 4578: a9 02
    sta height_in_cells                                               ; 457a: 85 3d
    lda save_game_level_e_big_egg_animation_index                     ; 457c: ad 14 0a
    cmp #egg_normal_animation - egg_animations_table                  ; 457f: c9 01
    beq write_egg_to_collision_map                                    ; 4581: f0 13
    cmp #egg_tilted_animation - egg_animations_table                  ; 4583: c9 05
    beq write_egg_to_collision_map                                    ; 4585: f0 0f
    ldx #$0b                                                          ; 4587: a2 0b
    ldy #$15                                                          ; 4589: a0 15
    inc width_in_cells                                                ; 458b: e6 3c
    dec height_in_cells                                               ; 458d: c6 3d
    lda room_1_egg_y                                                  ; 458f: ad 78 0a
    cmp #$a8                                                          ; 4592: c9 a8
    bcc return5                                                       ; 4594: 90 0a
write_egg_to_collision_map
    jsr read_collision_map_value_for_xy                               ; 4596: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 4599: c5 3e
    beq return5                                                       ; 459b: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 459d: 20 44 1e
return5
    rts                                                               ; 45a0: 60

; Preserves Y. A is $ff on exit if small egg has hit large egg, 0 otherwise. Flags
; reflect A on exit.
test_if_small_egg_hit_large_egg
    lda #0                                                            ; 45a1: a9 00
    sta return_a                                                      ; 45a3: 8d d6 45
    lda room_containing_small_egg                                     ; 45a6: ad 75 0a
    cmp #1                                                            ; 45a9: c9 01
    bne load_a_and_return                                             ; 45ab: d0 25
; Why not lda object_spriteid+2? And similarly for following lda abs,x
    ldx #objectid_small_egg                                           ; 45ad: a2 02
    lda object_spriteid,x                                             ; 45af: bd a8 09
    beq load_a_and_return                                             ; 45b2: f0 1e
    lda object_x_high,x                                               ; 45b4: bd 66 09
    bne load_a_and_return                                             ; 45b7: d0 19
    lda object_y_low,x                                                ; 45b9: bd 7c 09
    cmp #$70 ; 'p'                                                    ; 45bc: c9 70
    bcs load_a_and_return                                             ; 45be: b0 12
    sty saved_y                                                       ; 45c0: 8c d7 45
    jsr find_left_and_right_of_object                                 ; 45c3: 20 34 24
    ldy saved_y                                                       ; 45c6: ac d7 45
    lda object_left_low                                               ; 45c9: a5 70
    cmp #$78 ; 'x'                                                    ; 45cb: c9 78
    bne load_a_and_return                                             ; 45cd: d0 03
    dec return_a                                                      ; 45cf: ce d6 45
load_a_and_return
    lda return_a                                                      ; 45d2: ad d6 45
    rts                                                               ; 45d5: 60

return_a
    !byte 0                                                           ; 45d6: 00
saved_y
    !byte 0                                                           ; 45d7: 00

envelope1
    !byte 5                                                           ; 45d8: 05                      ; envelope number
    !byte 1                                                           ; 45d9: 01                      ; step length (100ths of a second)
    !byte 255                                                         ; 45da: ff                      ; pitch change per step in section 1
    !byte 0                                                           ; 45db: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 45dc: 00                      ; pitch change per step in section 3
    !byte 1                                                           ; 45dd: 01                      ; number of steps in section 1
    !byte 1                                                           ; 45de: 01                      ; number of steps in section 2
    !byte 0                                                           ; 45df: 00                      ; number of steps in section 3
    !byte 110                                                         ; 45e0: 6e                      ; change of amplitude per step during attack phase
    !byte 252                                                         ; 45e1: fc                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 45e2: 00                      ; change of amplitude per step during sustain phase
    !byte 248                                                         ; 45e3: f8                      ; change of amplitude per step during release phase
    !byte 110                                                         ; 45e4: 6e                      ; target of level at end of attack phase
    !byte 0                                                           ; 45e5: 00                      ; target of level at end of decay phase
sound1
    !word $13                                                         ; 45e6: 13 00                   ; channel
    !word 5                                                           ; 45e8: 05 00                   ; amplitude
    !word 201                                                         ; 45ea: c9 00                   ; pitch
    !word 1                                                           ; 45ec: 01 00                   ; duration
envelope2
    !byte 6                                                           ; 45ee: 06                      ; envelope number
    !byte 1                                                           ; 45ef: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 45f0: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 45f1: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 45f2: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 45f3: 00                      ; number of steps in section 1
    !byte 0                                                           ; 45f4: 00                      ; number of steps in section 2
    !byte 0                                                           ; 45f5: 00                      ; number of steps in section 3
    !byte 55                                                          ; 45f6: 37                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 45f7: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 45f8: 00                      ; change of amplitude per step during sustain phase
    !byte 250                                                         ; 45f9: fa                      ; change of amplitude per step during release phase
    !byte 110                                                         ; 45fa: 6e                      ; target of level at end of attack phase
    !byte 55                                                          ; 45fb: 37                      ; target of level at end of decay phase
sound3
    !word $10                                                         ; 45fc: 10 00                   ; channel
    !word 6                                                           ; 45fe: 06 00                   ; amplitude
    !word 7                                                           ; 4600: 07 00                   ; pitch
    !word 1                                                           ; 4602: 01 00                   ; duration
sound2
    !word $11                                                         ; 4604: 11 00                   ; channel
    !word 0                                                           ; 4606: 00 00                   ; amplitude
    !word 210                                                         ; 4608: d2 00                   ; pitch
    !word 1                                                           ; 460a: 01 00                   ; duration

ground_fill_2x2_top_left
    !byte %..#.....                                                   ; 460c: 20
    !byte %...#....                                                   ; 460d: 10
    !byte %#..#....                                                   ; 460e: 90
    !byte %.##....#                                                   ; 460f: 61
    !byte %......#.                                                   ; 4610: 02
    !byte %......#.                                                   ; 4611: 02
    !byte %....##..                                                   ; 4612: 0c
    !byte %...#....                                                   ; 4613: 10
ground_fill_2x2_top_right
    !byte %.....#..                                                   ; 4614: 04
    !byte %....#...                                                   ; 4615: 08
    !byte %....#..#                                                   ; 4616: 09
    !byte %#....##.                                                   ; 4617: 86
    !byte %.#......                                                   ; 4618: 40
    !byte %.#......                                                   ; 4619: 40
    !byte %..##....                                                   ; 461a: 30
    !byte %....#...                                                   ; 461b: 08
ground_fill_2x2_bottom_left
    !byte %...#....                                                   ; 461c: 10
    !byte %....##..                                                   ; 461d: 0c
    !byte %......#.                                                   ; 461e: 02
    !byte %......#.                                                   ; 461f: 02
    !byte %.##....#                                                   ; 4620: 61
    !byte %#..#....                                                   ; 4621: 90
    !byte %...#....                                                   ; 4622: 10
    !byte %..#.....                                                   ; 4623: 20
ground_fill_2x2_bottom_right
    !byte %....#...                                                   ; 4624: 08
    !byte %..##....                                                   ; 4625: 30
    !byte %.#......                                                   ; 4626: 40
    !byte %.#......                                                   ; 4627: 40
    !byte %#....##.                                                   ; 4628: 86
    !byte %....#..#                                                   ; 4629: 09
    !byte %....#...                                                   ; 462a: 08
    !byte %.....#..                                                   ; 462b: 04
sprite_data
pydis_end
!if (<bird_accessory_sprite_list) != $45 {
    !error "Assertion failed: <bird_accessory_sprite_list == $45"
}
!if (<bird_base_animations) != $46 {
    !error "Assertion failed: <bird_base_animations == $46"
}
!if (<envelope1) != $d8 {
    !error "Assertion failed: <envelope1 == $d8"
}
!if (<envelope2) != $ee {
    !error "Assertion failed: <envelope2 == $ee"
}
!if (<ground_fill_2x2_top_left) != $0c {
    !error "Assertion failed: <ground_fill_2x2_top_left == $0c"
}
!if (<sound1) != $e6 {
    !error "Assertion failed: <sound1 == $e6"
}
!if (<sound2) != $04 {
    !error "Assertion failed: <sound2 == $04"
}
!if (<sound3) != $fc {
    !error "Assertion failed: <sound3 == $fc"
}
!if (<update_bird) != $b8 {
    !error "Assertion failed: <update_bird == $b8"
}
!if (>bird_accessory_sprite_list) != $3b {
    !error "Assertion failed: >bird_accessory_sprite_list == $3b"
}
!if (>bird_base_animations) != $3b {
    !error "Assertion failed: >bird_base_animations == $3b"
}
!if (>envelope1) != $45 {
    !error "Assertion failed: >envelope1 == $45"
}
!if (>envelope2) != $45 {
    !error "Assertion failed: >envelope2 == $45"
}
!if (>ground_fill_2x2_top_left) != $46 {
    !error "Assertion failed: >ground_fill_2x2_top_left == $46"
}
!if (>sound1) != $45 {
    !error "Assertion failed: >sound1 == $45"
}
!if (>sound2) != $46 {
    !error "Assertion failed: >sound2 == $46"
}
!if (>sound3) != $45 {
    !error "Assertion failed: >sound3 == $45"
}
!if (>update_bird) != $3e {
    !error "Assertion failed: >update_bird == $3e"
}
!if (bird_animation11 - bird_base_animations) != $6f {
    !error "Assertion failed: bird_animation11 - bird_base_animations == $6f"
}
!if (bird_animation12 - bird_base_animations) != $7c {
    !error "Assertion failed: bird_animation12 - bird_base_animations == $7c"
}
!if (bird_animation13 - bird_base_animations) != $89 {
    !error "Assertion failed: bird_animation13 - bird_base_animations == $89"
}
!if (bird_animation14 - bird_base_animations) != $9a {
    !error "Assertion failed: bird_animation14 - bird_base_animations == $9a"
}
!if (bird_animation15 - bird_base_animations) != $ab {
    !error "Assertion failed: bird_animation15 - bird_base_animations == $ab"
}
!if (bird_animation5 - bird_base_animations) != $49 {
    !error "Assertion failed: bird_animation5 - bird_base_animations == $49"
}
!if (bird_animation8 - bird_base_animations) != $58 {
    !error "Assertion failed: bird_animation8 - bird_base_animations == $58"
}
!if (bird_fall_straight_down_animation - bird_base_animations) != $c0 {
    !error "Assertion failed: bird_fall_straight_down_animation - bird_base_animations == $c0"
}
!if (bird_fly_straight_up_animation - bird_base_animations) != $4e {
    !error "Assertion failed: bird_fly_straight_up_animation - bird_base_animations == $4e"
}
!if (bird_flying_sideways_animation - bird_base_animations) != $53 {
    !error "Assertion failed: bird_flying_sideways_animation - bird_base_animations == $53"
}
!if (bird_max_global_x_position) != $74 {
    !error "Assertion failed: bird_max_global_x_position == $74"
}
!if (bird_min_global_x_position) != $1e {
    !error "Assertion failed: bird_min_global_x_position == $1e"
}
!if (bird_start_hop_animation - bird_base_animations) != $66 {
    !error "Assertion failed: bird_start_hop_animation - bird_base_animations == $66"
}
!if (bird_stationary_for_a_while_animation - bird_base_animations) != $36 {
    !error "Assertion failed: bird_stationary_for_a_while_animation - bird_base_animations == $36"
}
!if (bird_stationary_on_floor_animation - bird_base_animations) != $44 {
    !error "Assertion failed: bird_stationary_on_floor_animation - bird_base_animations == $44"
}
!if (bird_transition_out_animation - bird_base_animations) != $1d {
    !error "Assertion failed: bird_transition_out_animation - bird_base_animations == $1d"
}
!if (bird_turn1_animation - bird_base_animations) != $3b {
    !error "Assertion failed: bird_turn1_animation - bird_base_animations == $3b"
}
!if (bird_turn1_mid_way - bird_base_animations) != $3f {
    !error "Assertion failed: bird_turn1_mid_way - bird_base_animations == $3f"
}
!if (bird_turn_while_flying_animation - bird_base_animations) != $5d {
    !error "Assertion failed: bird_turn_while_flying_animation - bird_base_animations == $5d"
}
!if (bird_turn_while_flying_mid_way - bird_base_animations) != $61 {
    !error "Assertion failed: bird_turn_while_flying_mid_way - bird_base_animations == $61"
}
!if (collision_map_none) != $00 {
    !error "Assertion failed: collision_map_none == $00"
}
!if (collision_map_solid_rock) != $03 {
    !error "Assertion failed: collision_map_solid_rock == $03"
}
!if (egg_falling_off_animation - egg_animations_table) != $09 {
    !error "Assertion failed: egg_falling_off_animation - egg_animations_table == $09"
}
!if (egg_falling_straight_down_animation - egg_animations_table) != $16 {
    !error "Assertion failed: egg_falling_straight_down_animation - egg_animations_table == $16"
}
!if (egg_normal_animation - egg_animations_table) != $01 {
    !error "Assertion failed: egg_normal_animation - egg_animations_table == $01"
}
!if (egg_stationary_animation - egg_animations_table) != $1a {
    !error "Assertion failed: egg_stationary_animation - egg_animations_table == $1a"
}
!if (egg_tilted_animation - egg_animations_table) != $05 {
    !error "Assertion failed: egg_tilted_animation - egg_animations_table == $05"
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
!if (game_area_width_cells) != $28 {
    !error "Assertion failed: game_area_width_cells == $28"
}
!if (jmp_for_update_extra_player_character + 1) != $22de {
    !error "Assertion failed: jmp_for_update_extra_player_character + 1 == $22de"
}
!if (jmp_for_update_extra_player_character + 2) != $22df {
    !error "Assertion failed: jmp_for_update_extra_player_character + 2 == $22df"
}
!if (level_specific_initialisation) != $3af6 {
    !error "Assertion failed: level_specific_initialisation == $3af6"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b34 {
    !error "Assertion failed: level_specific_update == $3b34"
}
!if (object_direction + objectid_bird) != $09c2 {
    !error "Assertion failed: object_direction + objectid_bird == $09c2"
}
!if (object_direction + objectid_bird_wings) != $09c3 {
    !error "Assertion failed: object_direction + objectid_bird_wings == $09c3"
}
!if (object_direction + objectid_small_egg) != $09c0 {
    !error "Assertion failed: object_direction + objectid_small_egg == $09c0"
}
!if (object_erase_type + objectid_bird_wings) != $38b1 {
    !error "Assertion failed: object_erase_type + objectid_bird_wings == $38b1"
}
!if (object_erase_type + objectid_egg) != $38af {
    !error "Assertion failed: object_erase_type + objectid_egg == $38af"
}
!if (object_erase_type + objectid_small_egg) != $38ae {
    !error "Assertion failed: object_erase_type + objectid_small_egg == $38ae"
}
!if (object_spriteid + objectid_bird) != $09ac {
    !error "Assertion failed: object_spriteid + objectid_bird == $09ac"
}
!if (object_spriteid + objectid_bird_wings) != $09ad {
    !error "Assertion failed: object_spriteid + objectid_bird_wings == $09ad"
}
!if (object_spriteid + objectid_egg) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_egg == $09ab"
}
!if (object_spriteid + objectid_small_egg) != $09aa {
    !error "Assertion failed: object_spriteid + objectid_small_egg == $09aa"
}
!if (object_spriteid_old + objectid_small_egg) != $09b5 {
    !error "Assertion failed: object_spriteid_old + objectid_small_egg == $09b5"
}
!if (object_x_high + objectid_bird) != $096a {
    !error "Assertion failed: object_x_high + objectid_bird == $096a"
}
!if (object_x_high + objectid_bird_wings) != $096b {
    !error "Assertion failed: object_x_high + objectid_bird_wings == $096b"
}
!if (object_x_high + objectid_egg) != $0969 {
    !error "Assertion failed: object_x_high + objectid_egg == $0969"
}
!if (object_x_high + objectid_small_egg) != $0968 {
    !error "Assertion failed: object_x_high + objectid_small_egg == $0968"
}
!if (object_x_high_old + objectid_small_egg) != $0973 {
    !error "Assertion failed: object_x_high_old + objectid_small_egg == $0973"
}
!if (object_x_low + objectid_bird) != $0954 {
    !error "Assertion failed: object_x_low + objectid_bird == $0954"
}
!if (object_x_low + objectid_bird_wings) != $0955 {
    !error "Assertion failed: object_x_low + objectid_bird_wings == $0955"
}
!if (object_x_low + objectid_egg) != $0953 {
    !error "Assertion failed: object_x_low + objectid_egg == $0953"
}
!if (object_x_low + objectid_small_egg) != $0952 {
    !error "Assertion failed: object_x_low + objectid_small_egg == $0952"
}
!if (object_x_low_old + objectid_small_egg) != $095d {
    !error "Assertion failed: object_x_low_old + objectid_small_egg == $095d"
}
!if (object_y_high + objectid_bird) != $0996 {
    !error "Assertion failed: object_y_high + objectid_bird == $0996"
}
!if (object_y_high + objectid_bird_wings) != $0997 {
    !error "Assertion failed: object_y_high + objectid_bird_wings == $0997"
}
!if (object_y_high + objectid_egg) != $0995 {
    !error "Assertion failed: object_y_high + objectid_egg == $0995"
}
!if (object_y_high + objectid_small_egg) != $0994 {
    !error "Assertion failed: object_y_high + objectid_small_egg == $0994"
}
!if (object_y_low + objectid_bird) != $0980 {
    !error "Assertion failed: object_y_low + objectid_bird == $0980"
}
!if (object_y_low + objectid_bird_wings) != $0981 {
    !error "Assertion failed: object_y_low + objectid_bird_wings == $0981"
}
!if (object_y_low + objectid_egg) != $097f {
    !error "Assertion failed: object_y_low + objectid_egg == $097f"
}
!if (object_y_low + objectid_small_egg) != $097e {
    !error "Assertion failed: object_y_low + objectid_small_egg == $097e"
}
!if (object_y_low_old + objectid_small_egg) != $0989 {
    !error "Assertion failed: object_y_low_old + objectid_small_egg == $0989"
}
!if (object_z_order + objectid_bird_wings) != $38c7 {
    !error "Assertion failed: object_z_order + objectid_bird_wings == $38c7"
}
!if (object_z_order + objectid_small_egg) != $38c4 {
    !error "Assertion failed: object_z_order + objectid_small_egg == $38c4"
}
!if (objectid_bird) != $04 {
    !error "Assertion failed: objectid_bird == $04"
}
!if (objectid_fire1) != $03 {
    !error "Assertion failed: objectid_fire1 == $03"
}
!if (objectid_fire2) != $04 {
    !error "Assertion failed: objectid_fire2 == $04"
}
!if (objectid_old_player) != $0b {
    !error "Assertion failed: objectid_old_player == $0b"
}
!if (objectid_player) != $00 {
    !error "Assertion failed: objectid_player == $00"
}
!if (objectid_small_egg) != $02 {
    !error "Assertion failed: objectid_small_egg == $02"
}
!if (objectid_sparkles) != $05 {
    !error "Assertion failed: objectid_sparkles == $05"
}
!if (room_0_data) != $3ff2 {
    !error "Assertion failed: room_0_data == $3ff2"
}
!if (room_1_data) != $438c {
    !error "Assertion failed: room_1_data == $438c"
}
!if (room_2_data) != $3c18 {
    !error "Assertion failed: room_2_data == $3c18"
}
!if (room_3_data) != $3df7 {
    !error "Assertion failed: room_3_data == $3df7"
}
!if (small_egg_falling_animation - small_egg_animations) != $32 {
    !error "Assertion failed: small_egg_falling_animation - small_egg_animations == $32"
}
!if (small_egg_start_throwing_animation - small_egg_animations) != $05 {
    !error "Assertion failed: small_egg_start_throwing_animation - small_egg_animations == $05"
}
!if (small_egg_stationary_animation - small_egg_animations) != $01 {
    !error "Assertion failed: small_egg_stationary_animation - small_egg_animations == $01"
}
!if (small_egg_status_collected) != $ff {
    !error "Assertion failed: small_egg_status_collected == $ff"
}
!if (small_egg_thrown_left_animation - small_egg_animations) != $25 {
    !error "Assertion failed: small_egg_thrown_left_animation - small_egg_animations == $25"
}
!if (small_egg_thrown_right_animation - small_egg_animations) != $0c {
    !error "Assertion failed: small_egg_thrown_right_animation - small_egg_animations == $0c"
}
!if (sprite_data - level_data) != $0b57 {
    !error "Assertion failed: sprite_data - level_data == $0b57"
}
!if (spriteid_bird_1) != $c8 {
    !error "Assertion failed: spriteid_bird_1 == $c8"
}
!if (spriteid_bird_2) != $c9 {
    !error "Assertion failed: spriteid_bird_2 == $c9"
}
!if (spriteid_bird_toolbar) != $d1 {
    !error "Assertion failed: spriteid_bird_toolbar == $d1"
}
!if (spriteid_bird_transform_1) != $cc {
    !error "Assertion failed: spriteid_bird_transform_1 == $cc"
}
!if (spriteid_bird_transform_2) != $cd {
    !error "Assertion failed: spriteid_bird_transform_2 == $cd"
}
!if (spriteid_bird_turn) != $ca {
    !error "Assertion failed: spriteid_bird_turn == $ca"
}
!if (spriteid_bird_wing_1) != $ce {
    !error "Assertion failed: spriteid_bird_wing_1 == $ce"
}
!if (spriteid_bird_wing_2) != $cf {
    !error "Assertion failed: spriteid_bird_wing_2 == $cf"
}
!if (spriteid_bird_wing_3) != $d0 {
    !error "Assertion failed: spriteid_bird_wing_3 == $d0"
}
!if (spriteid_egg) != $d2 {
    !error "Assertion failed: spriteid_egg == $d2"
}
!if (spriteid_egg_toolbar) != $d3 {
    !error "Assertion failed: spriteid_egg_toolbar == $d3"
}
!if (spriteid_erase_bird_wings) != $df {
    !error "Assertion failed: spriteid_erase_bird_wings == $df"
}
!if (spriteid_erase_large_egg) != $de {
    !error "Assertion failed: spriteid_erase_large_egg == $de"
}
!if (spriteid_erase_small_egg) != $d6 {
    !error "Assertion failed: spriteid_erase_small_egg == $d6"
}
!if (spriteid_large_egg_sideways) != $dd {
    !error "Assertion failed: spriteid_large_egg_sideways == $dd"
}
!if (spriteid_large_egg_tilted) != $dc {
    !error "Assertion failed: spriteid_large_egg_tilted == $dc"
}
!if (spriteid_large_egg_upright) != $db {
    !error "Assertion failed: spriteid_large_egg_upright == $db"
}
!if (spriteid_nest) != $d4 {
    !error "Assertion failed: spriteid_nest == $d4"
}
!if (spriteid_one_pixel_masked_out) != $00 {
    !error "Assertion failed: spriteid_one_pixel_masked_out == $00"
}
!if (spriteid_small_egg_down) != $d8 {
    !error "Assertion failed: spriteid_small_egg_down == $d8"
}
!if (spriteid_small_egg_left) != $d9 {
    !error "Assertion failed: spriteid_small_egg_left == $d9"
}
!if (spriteid_small_egg_right) != $d7 {
    !error "Assertion failed: spriteid_small_egg_right == $d7"
}
!if (spriteid_small_egg_upright) != $da {
    !error "Assertion failed: spriteid_small_egg_upright == $da"
}
