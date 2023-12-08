; *************************************************************************************
;
; Level F: 'FOLLOW-ME'
;
; Save game variables:
;
;     save_game_level_f_got_banana_or_banana_y_position ($0a16):
;               0: not got
;              1+: banana y position
;             $ff: got
;
; Solution:
;
;   1. Head to the left room and down the ladder
;   2. Collect the banana that's fallen on the right side of the room
;   3. Head up the rope to the right of the gorilla in the room above, and exit the room to the right
;   4. Jump on the rope and climb until the partition is raised
;   5. Jump off the rope to the right. Hold the banana as the wizard until the gorilla starts to climb the left rope.
;   6. Stop holding the banana.
;   7. Jump right as the cat to get through to the right hand room, and collect the spell.
;
; *************************************************************************************

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
objectid_banana                       = 2
objectid_brazier                      = 2
objectid_brazier_room_1               = 6
objectid_connecting_rope              = 4
objectid_gorilla                      = 5
objectid_old_player                   = 11
objectid_old_player_accessory         = 12
objectid_partition                    = 3
objectid_player                       = 0
objectid_player_accessory             = 1
objectid_rope_end                     = 2
opcode_jmp                            = 76
sprite_op_flags_copy_screen           = 1
sprite_op_flags_erase_to_bg_colour    = 2
sprite_op_flags_erase_to_fg_colour    = 4
sprite_op_flags_normal                = 0
spriteid_197                          = 197
spriteid_ball                         = 59
spriteid_banana                       = 218
spriteid_banana_bunch                 = 220
spriteid_banana_menu_item             = 219
spriteid_banana_on_ground             = 221
spriteid_boulder                      = 208
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
spriteid_erase_gorilla                = 209
spriteid_erase_partition_or_banana    = 207
spriteid_erase_player                 = 199
spriteid_erase_player_accessory       = 198
spriteid_fingertip_tile_restoration   = 30
spriteid_fire1                        = 60
spriteid_fire2                        = 61
spriteid_fire3                        = 62
spriteid_fire4                        = 63
spriteid_fire5                        = 64
spriteid_fire6                        = 65
spriteid_fire7                        = 66
spriteid_fire8                        = 67
spriteid_gorilla1                     = 210
spriteid_gorilla2                     = 211
spriteid_gorilla3                     = 212
spriteid_gorilla4                     = 213
spriteid_gorilla5                     = 214
spriteid_gorilla_climb1               = 215
spriteid_gorilla_climb2               = 216
spriteid_gorilla_jump                 = 217
spriteid_gorilla_pushes               = 222
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
spriteid_rope_and_partition           = 206
spriteid_rope_end                     = 10
spriteid_rope_hook                    = 11
spriteid_rope_hook_left               = 200
spriteid_rope_hook_right              = 201
spriteid_rope_short_horizontal        = 202
spriteid_rope_short_vertical          = 203
spriteid_rope_vertical                = 204
spriteid_rope_vertical_end            = 205
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
sprite_id                                           = $16
sprite_x_base_low                                   = $18
sprite_x_base_high                                  = $19
sprite_y_base_low                                   = $1a
sprite_y_base_high                                  = $1b
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
current_player_character                            = $48
previous_room_index                                 = $50
level_before_latest_level_and_room_initialisation   = $51
player_held_object_spriteid                         = $52
developer_mode_sideways_ram_is_set_up_flag          = $5b
l0070                                               = $70
room_exit_direction                                 = $70
temp_x                                              = $70
object_x_low                                        = $0950
object_x_low_old                                    = $095b
object_x_high                                       = $0966
object_x_high_old                                   = $0971
object_y_low                                        = $097c
object_y_low_old                                    = $0987
object_y_high                                       = $0992
object_spriteid                                     = $09a8
object_spriteid_old                                 = $09b3
object_direction                                    = $09be
current_player_animation                            = $09df
save_game_level_f_got_banana_or_banana_y_position   = $0a16
partition_position_y                                = $0a6f
gorilla_animation                                   = $0a70
gorilla_y_position                                  = $0a71
gorilla_x_position                                  = $0a72
gorilla_direction                                   = $0a73
gorilla_animation_step                              = $0a74
delay_before_gorilla_state_change                   = $0a75
tile_all_set_pixels                                 = $0aa9
developer_flags                                     = $1103
initialise_level_and_room                           = $1140
start_room                                          = $12bb
game_update                                         = $12da
update_room_first_update_flag                       = $132b
sprite_op                                           = $138d
toolbar_colour                                      = $175e
gameplay_area_colour                                = $1760
get_random_number_up_to_a                           = $18a6
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
find_top_and_bottom_of_object                       = $24d2
temp_top_offset                                     = $2550
temp_bottom_offset                                  = $2551
update_object_a_solid_rock_collision                = $25f5
update_object_hitting_floor                         = $2770
object_has_hit_floor_flag                           = $288f
object_just_fallen_off_edge_direction               = $2890
get_solid_rock_collision_for_object_a               = $2894
temp_default_collision_map_option                   = $28e1
test_for_collision_between_objects_x_and_y          = $28e2
desired_menu_slots                                  = $295c
menu_index_for_extra_items                          = $296e
insert_character_menu_item_into_toolbar             = $2b87
find_or_create_menu_slot_for_A                      = $2bbd
remove_item_from_toolbar_menu                       = $2be0
player_using_object_spriteid                        = $2eb6
previous_player_using_object_spriteid               = $2eb7
toolbar_collectable_spriteids                       = $2ee8
collectable_spriteids                               = $2eed
collectable_being_used_spriteids                    = $2ef2
monkey_base_animation                               = $30ff
monkey_climb_idle_animation                         = $3144
monkey_climb_down_animation                         = $3148
monkey_climb_animation                              = $3150
inhibit_monkey_climb_flag                           = $31d7
object_erase_type                                   = $38ac
object_z_order                                      = $38c2
object_room_collision_flags                         = $38d8
play_sound_yx                                       = $38f6
define_envelope                                     = $395e
sound_priority_per_channel_table                    = $396f

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
    beq set_rock                                                      ; 3af5: f0 16
    lda developer_flags                                               ; 3af7: ad 03 11
    bpl developer_mode_inactive                                       ; 3afa: 10 05
    lda #$ff                                                          ; 3afc: a9 ff
    sta save_game_level_f_got_banana_or_banana_y_position             ; 3afe: 8d 16 0a
developer_mode_inactive
    lda save_game_level_f_got_banana_or_banana_y_position             ; 3b01: ad 16 0a
    cmp #$ff                                                          ; 3b04: c9 ff
    bne set_rock                                                      ; 3b06: d0 05
    lda #spriteid_banana_menu_item                                    ; 3b08: a9 db
    jsr find_or_create_menu_slot_for_A                                ; 3b0a: 20 bd 2b
set_rock
    lda #<ground_fill_2x2_top_left                                    ; 3b0d: a9 04
    sta source_sprite_memory_low                                      ; 3b0f: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3b11: a9 44
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
    jsr update_gorilla_puzzle                                         ; 3b19: 20 d3 3f
    jsr room_1_update_handler                                         ; 3b1c: 20 4c 3c
    jsr update_banana_puzzle                                          ; 3b1f: 20 f8 42
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
    lda #objectid_brazier                                             ; 3bc0: a9 02
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
    lda #objectid_brazier_room_1                                      ; 3c55: a9 06
    jsr update_brazier_and_fire                                       ; 3c57: 20 88 19
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 3c5a: ad 2b 13
    bne room_1_first_update                                           ; 3c5d: d0 03
    jmp update_partition_puzzle                                       ; 3c5f: 4c 2c 3d

; check for level change (branch if not)
room_1_first_update
    lda current_level                                                 ; 3c62: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3c64: c5 51
    beq skip_level_change                                             ; 3c66: f0 05
    lda #$48 ; 'H'                                                    ; 3c68: a9 48
    sta partition_position_y                                          ; 3c6a: 8d 6f 0a
skip_level_change
    lda desired_room_index                                            ; 3c6d: a5 30
    cmp #1                                                            ; 3c6f: c9 01
    beq room_1_initialise                                             ; 3c71: f0 03
    jmp update_rope_end_position_local                                ; 3c73: 4c 29 3d

room_1_initialise
    ldx #<partition_moving_envelope                                   ; 3c76: a2 d0
    ldy #>partition_moving_envelope                                   ; 3c78: a0 43
    jsr define_envelope                                               ; 3c7a: 20 5e 39
    ldx #<partition_landing_envelope                                  ; 3c7d: a2 e6
    ldy #>partition_landing_envelope                                  ; 3c7f: a0 43
    jsr define_envelope                                               ; 3c81: 20 5e 39
; draw hooks, including collision map
    lda #1                                                            ; 3c84: a9 01
    sta width_in_cells                                                ; 3c86: 85 3c
    sta height_in_cells                                               ; 3c88: 85 3d
    lda #collision_map_solid_rock                                     ; 3c8a: a9 03
    sta value_to_write_to_collision_map                               ; 3c8c: 85 3e
    ldx #$0d                                                          ; 3c8e: a2 0d
    ldy #2                                                            ; 3c90: a0 02
    lda #spriteid_rope_hook_left                                      ; 3c92: a9 c8
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3c94: 20 57 1f
    ldx #$22 ; '"'                                                    ; 3c97: a2 22
    lda #spriteid_rope_hook_right                                     ; 3c99: a9 c9
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3c9b: 20 57 1f
    dex                                                               ; 3c9e: ca
    dex                                                               ; 3c9f: ca
    lda #spriteid_rope_short_horizontal                               ; 3ca0: a9 ca
draw_horizontal_rope_loop
    jsr draw_sprite_a_at_cell_xy                                      ; 3ca2: 20 4c 1f
    dex                                                               ; 3ca5: ca
    cpx #$0f                                                          ; 3ca6: e0 0f
    bcs draw_horizontal_rope_loop                                     ; 3ca8: b0 f8
; left vertical hand rope
    ldx #$0d                                                          ; 3caa: a2 0d
    lda #$48 ; 'H'                                                    ; 3cac: a9 48
    sec                                                               ; 3cae: 38
    sbc partition_position_y                                          ; 3caf: ed 6f 0a
    clc                                                               ; 3cb2: 18
    adc #$6c ; 'l'                                                    ; 3cb3: 69 6c
    lsr                                                               ; 3cb5: 4a
    lsr                                                               ; 3cb6: 4a
    lsr                                                               ; 3cb7: 4a
    tay                                                               ; 3cb8: a8
    dey                                                               ; 3cb9: 88
draw_left_vertical_rope_loop
    lda #spriteid_rope_vertical                                       ; 3cba: a9 cc
    jsr draw_sprite_a_at_cell_xy                                      ; 3cbc: 20 4c 1f
    lda #2                                                            ; 3cbf: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3cc1: 20 bb 1e
    dey                                                               ; 3cc4: 88
    cpy #3                                                            ; 3cc5: c0 03
    bcs draw_left_vertical_rope_loop                                  ; 3cc7: b0 f1
; set rope end object
    lda #objectid_rope_end                                            ; 3cc9: a9 02
    jsr set_object_position_from_cell_xy                              ; 3ccb: 20 5d 1f
    tax                                                               ; 3cce: aa
    lda #spriteid_rope_vertical_end                                   ; 3ccf: a9 cd
    sta object_spriteid,x                                             ; 3cd1: 9d a8 09
    ldx #$22 ; '"'                                                    ; 3cd4: a2 22
    lda partition_position_y                                          ; 3cd6: ad 6f 0a
    and #4                                                            ; 3cd9: 29 04
    beq check_amount_of_vertical_rope_to_draw                         ; 3cdb: f0 0f
; draw short end rope to hit partition
    lda partition_position_y                                          ; 3cdd: ad 6f 0a
    sec                                                               ; 3ce0: 38
    sbc #$0c                                                          ; 3ce1: e9 0c
    lsr                                                               ; 3ce3: 4a
    lsr                                                               ; 3ce4: 4a
    lsr                                                               ; 3ce5: 4a
    tay                                                               ; 3ce6: a8
    lda #spriteid_rope_short_vertical                                 ; 3ce7: a9 cb
    jsr draw_sprite_a_at_cell_xy                                      ; 3ce9: 20 4c 1f
check_amount_of_vertical_rope_to_draw
    lda partition_position_y                                          ; 3cec: ad 6f 0a
    and #$f8                                                          ; 3cef: 29 f8
    cmp #$20 ; ' '                                                    ; 3cf1: c9 20
    beq skip_right_hand_rope_drawing_as_partition_already_fully_up    ; 3cf3: f0 10
    lsr                                                               ; 3cf5: 4a
    lsr                                                               ; 3cf6: 4a
    lsr                                                               ; 3cf7: 4a
    tay                                                               ; 3cf8: a8
    dey                                                               ; 3cf9: 88
    dey                                                               ; 3cfa: 88
    lda #spriteid_rope_vertical                                       ; 3cfb: a9 cc
draw_right_vertical_rope_loop
    jsr draw_sprite_a_at_cell_xy                                      ; 3cfd: 20 4c 1f
    dey                                                               ; 3d00: 88
    cpy #3                                                            ; 3d01: c0 03
    bcs draw_right_vertical_rope_loop                                 ; 3d03: b0 f8
; write values to partition object
skip_right_hand_rope_drawing_as_partition_already_fully_up
    lda #objectid_partition                                           ; 3d05: a9 03
    jsr set_object_position_from_cell_xy                              ; 3d07: 20 5d 1f
    lda #objectid_connecting_rope                                     ; 3d0a: a9 04
    jsr set_object_position_from_cell_xy                              ; 3d0c: 20 5d 1f
    tax                                                               ; 3d0f: aa
    jsr copy_object_state_to_old                                      ; 3d10: 20 f7 20
    lda #$c1                                                          ; 3d13: a9 c1
    sta object_z_order,x                                              ; 3d15: 9d c2 38
    ldx #objectid_partition                                           ; 3d18: a2 03
    lda #spriteid_rope_and_partition                                  ; 3d1a: a9 ce
    sta object_spriteid,x                                             ; 3d1c: 9d a8 09
    lda #spriteid_erase_partition_or_banana                           ; 3d1f: a9 cf
    sta object_erase_type,x                                           ; 3d21: 9d ac 38
    lda #$c0                                                          ; 3d24: a9 c0
    sta object_z_order,x                                              ; 3d26: 9d c2 38
update_rope_end_position_local
    jmp update_rope_end_position                                      ; 3d29: 4c 2d 3e

update_partition_puzzle
    lda desired_room_index                                            ; 3d2c: a5 30
    cmp #1                                                            ; 3d2e: c9 01
    bne skip_reset_sound_priority                                     ; 3d30: d0 0f
; update room 1 sound priorities
    lda sound_priority_per_channel_table                              ; 3d32: ad 6f 39
    cmp #$41 ; 'A'                                                    ; 3d35: c9 41
    bcs skip_reset_sound_priority                                     ; 3d37: b0 08
    lda #0                                                            ; 3d39: a9 00
    sta sound_priority_per_channel_table                              ; 3d3b: 8d 6f 39
    sta sound_priority_per_channel_table + 1                          ; 3d3e: 8d 70 39
skip_reset_sound_priority
    lda gorilla_x_position                                            ; 3d41: ad 72 0a
    cmp #$50 ; 'P'                                                    ; 3d44: c9 50
    bcc gorilla_not_on_rope                                           ; 3d46: 90 2a
    lda gorilla_animation                                             ; 3d48: ad 70 0a
    cmp #gorilla_climbing_rope_animation - gorilla_animations_table   ; 3d4b: c9 5a
    beq gorilla_on_rope                                               ; 3d4d: f0 04
    cmp #gorilla_on_rope_animation - gorilla_animations_table         ; 3d4f: c9 56
    bne gorilla_not_on_rope                                           ; 3d51: d0 1f
gorilla_on_rope
    lda partition_position_y                                          ; 3d53: ad 6f 0a
    cmp #$20 ; ' '                                                    ; 3d56: c9 20
    beq return1_local                                                 ; 3d58: f0 15
    lda gorilla_y_position                                            ; 3d5a: ad 71 0a
    clc                                                               ; 3d5d: 18
    adc #4                                                            ; 3d5e: 69 04
    sta gorilla_y_position                                            ; 3d60: 8d 71 0a
    ldx desired_room_index                                            ; 3d63: a6 30
    cpx #1                                                            ; 3d65: e0 01
    bne move_partition_up                                             ; 3d67: d0 3d
    sta object_y_low + objectid_gorilla                               ; 3d69: 8d 81 09
    jmp move_partition_up                                             ; 3d6c: 4c a6 3d

return1_local
    jmp return1                                                       ; 3d6f: 4c a6 3e

gorilla_not_on_rope
    lda desired_room_index                                            ; 3d72: a5 30
    cmp #1                                                            ; 3d74: c9 01
    bne player_not_on_rope                                            ; 3d76: d0 58
; update the rope position. First check player is the monkey
    lda current_player_character                                      ; 3d78: a5 48
    cmp #spriteid_icodata_monkey                                      ; 3d7a: c9 06
    bne player_not_on_rope                                            ; 3d7c: d0 52
; check player animation
    lda current_player_animation                                      ; 3d7e: ad df 09
    cmp #monkey_climb_animation - monkey_base_animation               ; 3d81: c9 51
    beq player_is_monkey_on_rope                                      ; 3d83: f0 08
    cmp #monkey_climb_idle_animation - monkey_base_animation          ; 3d85: c9 45
    beq player_is_monkey_on_rope                                      ; 3d87: f0 04
    cmp #monkey_climb_down_animation - monkey_base_animation          ; 3d89: c9 49
    bne player_not_on_rope                                            ; 3d8b: d0 43
; check partition position. If fully raised, then return
player_is_monkey_on_rope
    lda partition_position_y                                          ; 3d8d: ad 6f 0a
    cmp #$20 ; ' '                                                    ; 3d90: c9 20
    beq return1_local                                                 ; 3d92: f0 db
; move player down rope as it moves
    lda object_y_low                                                  ; 3d94: ad 7c 09
    clc                                                               ; 3d97: 18
    adc #4                                                            ; 3d98: 69 04
    sta object_y_low                                                  ; 3d9a: 8d 7c 09
    lda object_y_low + objectid_player_accessory                      ; 3d9d: ad 7d 09
    clc                                                               ; 3da0: 18
    adc #4                                                            ; 3da1: 69 04
    sta object_y_low + objectid_player_accessory                      ; 3da3: 8d 7d 09
move_partition_up
    lda partition_position_y                                          ; 3da6: ad 6f 0a
    sec                                                               ; 3da9: 38
    sbc #4                                                            ; 3daa: e9 04
    sta partition_position_y                                          ; 3dac: 8d 6f 0a
; check if we are in room 1
    lda desired_room_index                                            ; 3daf: a5 30
    cmp #1                                                            ; 3db1: c9 01
    bne return1_local                                                 ; 3db3: d0 ba
    jsr play_partition_moving_sound                                   ; 3db5: 20 a9 3e
    ldx #objectid_connecting_rope                                     ; 3db8: a2 04
    lda partition_position_y                                          ; 3dba: ad 6f 0a
    sec                                                               ; 3dbd: 38
    sbc #8                                                            ; 3dbe: e9 08
    sta object_y_low_old,x                                            ; 3dc0: 9d 87 09
; while partition is moving, remove the short vertical rope
    lda #spriteid_rope_short_vertical                                 ; 3dc3: a9 cb
    sta object_spriteid_old,x                                         ; 3dc5: 9d b3 09
    lda #0                                                            ; 3dc8: a9 00
    sta object_spriteid,x                                             ; 3dca: 9d a8 09
    jmp update_rope_end_position                                      ; 3dcd: 4c 2d 3e

player_not_on_rope
    lda partition_position_y                                          ; 3dd0: ad 6f 0a
    cmp #$48 ; 'H'                                                    ; 3dd3: c9 48
    bne calculate_connecting_rope                                     ; 3dd5: d0 03
    jmp return1                                                       ; 3dd7: 4c a6 3e

calculate_connecting_rope
    ldx #$0c                                                          ; 3dda: a2 0c
    ldy #spriteid_rope_short_vertical                                 ; 3ddc: a0 cb
    adc #4                                                            ; 3dde: 69 04
    cmp #$48 ; 'H'                                                    ; 3de0: c9 48
    beq remember_connecting_rope                                      ; 3de2: f0 06
    ldx #$10                                                          ; 3de4: a2 10
    ldy #spriteid_rope_vertical                                       ; 3de6: a0 cc
    adc #4                                                            ; 3de8: 69 04
remember_connecting_rope
    sta partition_position_y                                          ; 3dea: 8d 6f 0a
    stx remembered_rope_y_offset                                      ; 3ded: 8e a7 3e
    sty remembered_connecting_rope_spriteid                           ; 3df0: 8c a8 3e
; check if we are in room 1
    lda desired_room_index                                            ; 3df3: a5 30
    cmp #1                                                            ; 3df5: c9 01
    bne update_rope_end_position                                      ; 3df7: d0 34
; check for partition landing or moving (for playing sound)
    lda partition_position_y                                          ; 3df9: ad 6f 0a
    cmp #$48 ; 'H'                                                    ; 3dfc: c9 48
    beq play_partition_landing_sound                                  ; 3dfe: f0 06
    jsr play_partition_moving_sound                                   ; 3e00: 20 a9 3e
    jmp update_connecting_rope_position                               ; 3e03: 4c 16 3e

play_partition_landing_sound
    lda #0                                                            ; 3e06: a9 00
    ldx #<partition_landing_sound1                                    ; 3e08: a2 fc
    ldy #>partition_landing_sound1                                    ; 3e0a: a0 43
    jsr play_sound_yx                                                 ; 3e0c: 20 f6 38
    ldx #<partition_landing_sound2                                    ; 3e0f: a2 f4
    ldy #>partition_landing_sound2                                    ; 3e11: a0 43
    jsr play_sound_yx                                                 ; 3e13: 20 f6 38
update_connecting_rope_position
    ldx #objectid_connecting_rope                                     ; 3e16: a2 04
    lda partition_position_y                                          ; 3e18: ad 6f 0a
    sec                                                               ; 3e1b: 38
    sbc remembered_rope_y_offset                                      ; 3e1c: ed a7 3e
    sta object_y_low,x                                                ; 3e1f: 9d 7c 09
; restore the connecting rope
    lda #0                                                            ; 3e22: a9 00
    sta object_spriteid_old,x                                         ; 3e24: 9d b3 09
    lda remembered_connecting_rope_spriteid                           ; 3e27: ad a8 3e
    sta object_spriteid,x                                             ; 3e2a: 9d a8 09
update_rope_end_position
    lda desired_room_index                                            ; 3e2d: a5 30
    cmp #1                                                            ; 3e2f: c9 01
    bne return1                                                       ; 3e31: d0 73
    ldx #objectid_rope_end                                            ; 3e33: a2 02
    lda #0                                                            ; 3e35: a9 00
    sta object_spriteid_old,x                                         ; 3e37: 9d b3 09
    lda #$48 ; 'H'                                                    ; 3e3a: a9 48
    sec                                                               ; 3e3c: 38
    sbc partition_position_y                                          ; 3e3d: ed 6f 0a
    clc                                                               ; 3e40: 18
    adc #$68 ; 'h'                                                    ; 3e41: 69 68
    sta object_y_low,x                                                ; 3e43: 9d 7c 09
; update collision map for rope and partition
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
    lda partition_position_y                                          ; 3e5a: ad 6f 0a
    sta object_y_low + objectid_partition                             ; 3e5d: 8d 7f 09
    ldx #$22 ; '"'                                                    ; 3e60: a2 22
    ldy #9                                                            ; 3e62: a0 09
    lda #1                                                            ; 3e64: a9 01
    sta width_in_cells                                                ; 3e66: 85 3c
    lda #5                                                            ; 3e68: a9 05
    sta height_in_cells                                               ; 3e6a: 85 3d
    lda #collision_map_solid_rock                                     ; 3e6c: a9 03
    sta value_to_write_to_collision_map                               ; 3e6e: 85 3e
    lda partition_position_y                                          ; 3e70: ad 6f 0a
    cmp #$48 ; 'H'                                                    ; 3e73: c9 48
    beq partition_is_closed                                           ; 3e75: f0 04
    lda #collision_map_none                                           ; 3e77: a9 00
    sta value_to_write_to_collision_map                               ; 3e79: 85 3e
partition_is_closed
    jsr read_collision_map_value_for_xy                               ; 3e7b: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3e7e: c5 3e
    beq collision_map_written                                         ; 3e80: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e82: 20 44 1e
collision_map_written
    ldx #objectid_player                                              ; 3e85: a2 00
    ldy #objectid_partition                                           ; 3e87: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 3e89: 20 e2 28
    beq return1                                                       ; 3e8c: f0 18
; player collided with partition, get pushed left
    lda #$fa                                                          ; 3e8e: a9 fa
    sta player_wall_collision_reaction_speed                          ; 3e90: 8d 33 24
; but if player is to the right of the wall, the get pushed right
    lda object_x_high                                                 ; 3e93: ad 66 09
    cmp #1                                                            ; 3e96: c9 01
    bne return1                                                       ; 3e98: d0 0c
    lda object_x_low                                                  ; 3e9a: ad 50 09
    cmp #$14                                                          ; 3e9d: c9 14
    bcc return1                                                       ; 3e9f: 90 05
    lda #6                                                            ; 3ea1: a9 06
    sta player_wall_collision_reaction_speed                          ; 3ea3: 8d 33 24
return1
    rts                                                               ; 3ea6: 60

remembered_rope_y_offset
    !byte 0                                                           ; 3ea7: 00
remembered_connecting_rope_spriteid
    !byte 0                                                           ; 3ea8: 00

play_partition_moving_sound
    lda #$40 ; '@'                                                    ; 3ea9: a9 40
    ldx #<partition_moving_sound                                      ; 3eab: a2 de
    ldy #>partition_moving_sound                                      ; 3ead: a0 43
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
; draw boulder at (12,12) of size (3x2)
    lda #3                                                            ; 3f19: a9 03
    sta width_in_cells                                                ; 3f1b: 85 3c
    lda #2                                                            ; 3f1d: a9 02
    sta height_in_cells                                               ; 3f1f: 85 3d
    lda #spriteid_boulder                                             ; 3f21: a9 d0
    ldx #$0c                                                          ; 3f23: a2 0c
    ldy #$0c                                                          ; 3f25: a0 0c
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3f27: 20 57 1f
; draw boulder at (25,12) of size (3x2)
    ldx #$19                                                          ; 3f2a: a2 19
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3f2c: 20 57 1f
; draw boulder at (31,20) of size (3x2)
    ldx #$1f                                                          ; 3f2f: a2 1f
    ldy #$14                                                          ; 3f31: a0 14
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3f33: 20 57 1f
; draw boulder at (34,20) of size (3x2)
    ldx #$22 ; '"'                                                    ; 3f36: a2 22
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3f38: 20 57 1f
; draw boulder at (34,18) of size (3x2)
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
    lda #objectid_brazier                                             ; 3f5f: a9 02
    ldx #5                                                            ; 3f61: a2 05
    ldy #5                                                            ; 3f63: a0 05
    jsr update_brazier_and_fire                                       ; 3f65: 20 88 19
    lda #3                                                            ; 3f68: a9 03
    ldx #$14                                                          ; 3f6a: a2 14
    ldy #$0e                                                          ; 3f6c: a0 0e
    jsr update_level_completion                                       ; 3f6e: 20 10 1a
    rts                                                               ; 3f71: 60

gorilla_animations_table
gorilla_push_animation
    !byte spriteid_gorilla_pushes,                       0            ; 3f72: de 00
    !byte                       0                                     ; 3f74: 00
    !byte spriteid_gorilla_pushes,                       0            ; 3f75: de 00
    !byte                       0                                     ; 3f77: 00
    !byte spriteid_gorilla_pushes,                       0            ; 3f78: de 00
    !byte                       0                                     ; 3f7a: 00
    !byte spriteid_gorilla_pushes,                       0            ; 3f7b: de 00
    !byte                       0                                     ; 3f7d: 00
    !byte spriteid_gorilla_pushes,                       0            ; 3f7e: de 00
    !byte                       0                                     ; 3f80: 00
    !byte spriteid_gorilla_pushes,                       0            ; 3f81: de 00
    !byte                       0                                     ; 3f83: 00
    !byte spriteid_gorilla_pushes,                       0            ; 3f84: de 00
    !byte                       0                                     ; 3f86: 00
    !byte spriteid_gorilla_pushes,                       0            ; 3f87: de 00
    !byte                       0                                     ; 3f89: 00
    !byte 0                                                           ; 3f8a: 00
gorilla_idle_animation
    !byte spriteid_gorilla5,                 0,                 0     ; 3f8b: d6 00 00
    !byte 0                                                           ; 3f8e: 00
gorilla_walk_cycle_animation
    !byte spriteid_gorilla1,                 1,                 0     ; 3f8f: d2 01 00
    !byte spriteid_gorilla2,                 1,                 0     ; 3f92: d3 01 00
    !byte spriteid_gorilla3,                 1,                 0     ; 3f95: d4 01 00
    !byte spriteid_gorilla4,                 1,                 0     ; 3f98: d5 01 00
    !byte 0                                                           ; 3f9b: 00
gorilla_jump_on_rope_animation
    !byte spriteid_gorilla_jump,                     1                ; 3f9c: d9 01
    !byte                   $fb                                       ; 3f9e: fb
    !byte spriteid_gorilla_jump,                     1                ; 3f9f: d9 01
    !byte                   $fc                                       ; 3fa1: fc
    !byte spriteid_gorilla_jump,                     1                ; 3fa2: d9 01
    !byte                   $fd                                       ; 3fa4: fd
    !byte spriteid_gorilla_jump,                     1                ; 3fa5: d9 01
    !byte                   $fd                                       ; 3fa7: fd
    !byte spriteid_gorilla_jump,                     1                ; 3fa8: d9 01
    !byte                   $fe                                       ; 3faa: fe
    !byte spriteid_gorilla_jump,                     1                ; 3fab: d9 01
    !byte                   $fe                                       ; 3fad: fe
    !byte spriteid_gorilla_jump,                     1                ; 3fae: d9 01
    !byte                   $ff                                       ; 3fb0: ff
    !byte 0                                                           ; 3fb1: 00
gorilla_jump_off_rope_animation
    !byte spriteid_gorilla_jump,                     1                ; 3fb2: d9 01
    !byte                     1                                       ; 3fb4: 01
    !byte spriteid_gorilla_jump,                     1                ; 3fb5: d9 01
    !byte                     2                                       ; 3fb7: 02
    !byte spriteid_gorilla_jump,                     1                ; 3fb8: d9 01
    !byte                     2                                       ; 3fba: 02
    !byte spriteid_gorilla_jump,                     1                ; 3fbb: d9 01
    !byte                     3                                       ; 3fbd: 03
    !byte spriteid_gorilla_jump,                     1                ; 3fbe: d9 01
    !byte                     3                                       ; 3fc0: 03
    !byte spriteid_gorilla_jump,                     1                ; 3fc1: d9 01
    !byte                     4                                       ; 3fc3: 04
    !byte spriteid_gorilla_jump,                     1                ; 3fc4: d9 01
    !byte                     5                                       ; 3fc6: 05
    !byte 0                                                           ; 3fc7: 00
gorilla_on_rope_animation
    !byte spriteid_gorilla_climb1,                       0            ; 3fc8: d7 00
    !byte                       0                                     ; 3fca: 00
    !byte 0                                                           ; 3fcb: 00
gorilla_climbing_rope_animation
    !byte spriteid_gorilla_climb2,                       0            ; 3fcc: d8 00
    !byte                     $fc                                     ; 3fce: fc
    !byte spriteid_gorilla_climb1,                       0            ; 3fcf: d7 00
    !byte                     $fc                                     ; 3fd1: fc
    !byte 0                                                           ; 3fd2: 00

; check for first update in room (branch if not)
update_gorilla_puzzle
    lda update_room_first_update_flag                                 ; 3fd3: ad 2b 13
    beq update_gorilla_not_first_update                               ; 3fd6: f0 38
; check for level change (branch if not)
    lda current_level                                                 ; 3fd8: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3fda: c5 51
    beq initialise_room_only                                          ; 3fdc: f0 1a
    lda #$22 ; '"'                                                    ; 3fde: a9 22
    sta gorilla_x_position                                            ; 3fe0: 8d 72 0a
    lda #$6e ; 'n'                                                    ; 3fe3: a9 6e
    sta gorilla_y_position                                            ; 3fe5: 8d 71 0a
    lda #1                                                            ; 3fe8: a9 01
    sta gorilla_direction                                             ; 3fea: 8d 73 0a
    lda #gorilla_idle_animation - gorilla_animations_table            ; 3fed: a9 19
    sta gorilla_animation                                             ; 3fef: 8d 70 0a
    sta gorilla_animation_step                                        ; 3ff2: 8d 74 0a
    jsr get_random_gorilla_idle_delay                                 ; 3ff5: 20 61 42
initialise_room_only
    lda desired_room_index                                            ; 3ff8: a5 30
    cmp #2                                                            ; 3ffa: c9 02
    bcs initialise_room_2_or_3                                        ; 3ffc: b0 0f
    lda #spriteid_erase_gorilla                                       ; 3ffe: a9 d1
    sta object_erase_type + objectid_gorilla                          ; 4000: 8d b1 38
    lda #$c0                                                          ; 4003: a9 c0
    sta object_z_order + objectid_gorilla                             ; 4005: 8d c7 38
    lda #0                                                            ; 4008: a9 00
    sta object_y_high + objectid_gorilla                              ; 400a: 8d 97 09
initialise_room_2_or_3
    jmp update_gorilla_object                                         ; 400d: 4c f5 41

; take the player x position, divide by four to get an x position that ranges from
; (0-79)
update_gorilla_not_first_update
    lda object_x_high                                                 ; 4010: ad 66 09
    lsr                                                               ; 4013: 4a
    sta temp_x                                                        ; 4014: 85 70
    lda object_x_low                                                  ; 4016: ad 50 09
    ror                                                               ; 4019: 6a
    lsr temp_x                                                        ; 401a: 46 70
    ror                                                               ; 401c: 6a
; add 80 for room 1 and another 80 for room 2
    ldx desired_room_index                                            ; 401d: a6 30
    beq got_the_player_position                                       ; 401f: f0 0a
    clc                                                               ; 4021: 18
    adc #$50 ; 'P'                                                    ; 4022: 69 50
    cpx #1                                                            ; 4024: e0 01
    beq got_the_player_position                                       ; 4026: f0 03
    clc                                                               ; 4028: 18
    adc #$50 ; 'P'                                                    ; 4029: 69 50
got_the_player_position
    ldx #0                                                            ; 402b: a2 00
    sec                                                               ; 402d: 38
    sbc gorilla_x_position                                            ; 402e: ed 72 0a
    beq got_direction_for_the_gorilla                                 ; 4031: f0 06
    ldx #1                                                            ; 4033: a2 01
    bcs got_direction_for_the_gorilla                                 ; 4035: b0 02
    ldx #$ff                                                          ; 4037: a2 ff
got_direction_for_the_gorilla
    stx gorilla_to_player_direction                                   ; 4039: 8e 6d 42
; set Y to next animation step
    lda gorilla_animation_step                                        ; 403c: ad 74 0a
    clc                                                               ; 403f: 18
    adc #3                                                            ; 4040: 69 03
    tay                                                               ; 4042: a8
    lda gorilla_animations_table,y                                    ; 4043: b9 72 3f
    bne loop_animation_if_needed                                      ; 4046: d0 03
    ldy gorilla_animation                                             ; 4048: ac 70 0a
loop_animation_if_needed
    lda delay_before_gorilla_state_change                             ; 404b: ad 75 0a
    beq update_gorilla_delay                                          ; 404e: f0 03
    dec delay_before_gorilla_state_change                             ; 4050: ce 75 0a
update_gorilla_delay
    lda gorilla_animation                                             ; 4053: ad 70 0a
    cmp #gorilla_jump_on_rope_animation - gorilla_animations_table    ; 4056: c9 2a
    bne not_jump_on_rope                                              ; 4058: d0 20
; gorilla is jumping onto a rope. Are we at the end of the animation?
    cpy gorilla_animation                                             ; 405a: cc 70 0a
    bne gorilla_in_room_0_local                                       ; 405d: d0 33
; set (loop) the animation to the on rope animation. [not technically needed, isnt it
; already set?]
    ldy #gorilla_on_rope_animation - gorilla_animations_table         ; 405f: a0 56
    sty gorilla_animation                                             ; 4061: 8c 70 0a
; set a 4 frame delay before changing state
    lda #4                                                            ; 4064: a9 04
    sta delay_before_gorilla_state_change                             ; 4066: 8d 75 0a
    lda gorilla_x_position                                            ; 4069: ad 72 0a
    cmp #$50 ; 'P'                                                    ; 406c: c9 50
    bcc gorilla_in_room_0_local                                       ; 406e: 90 22
    ldy #gorilla_climbing_rope_animation - gorilla_animations_table   ; 4070: a0 5a
    sty gorilla_animation                                             ; 4072: 8c 70 0a
    lda #0                                                            ; 4075: a9 00
    sta delay_before_gorilla_state_change                             ; 4077: 8d 75 0a
not_jump_on_rope
    lda gorilla_animation                                             ; 407a: ad 70 0a
    cmp #gorilla_climbing_rope_animation - gorilla_animations_table   ; 407d: c9 5a
    bne gorilla_check_jumping_off_rope                                ; 407f: d0 14
    lda partition_position_y                                          ; 4081: ad 6f 0a
    cmp #$20 ; ' '                                                    ; 4084: c9 20
    bne gorilla_in_room_0_local                                       ; 4086: d0 0a
    ldy #gorilla_on_rope_animation - gorilla_animations_table         ; 4088: a0 56
    sty gorilla_animation                                             ; 408a: 8c 70 0a
    lda #4                                                            ; 408d: a9 04
    sta delay_before_gorilla_state_change                             ; 408f: 8d 75 0a
gorilla_in_room_0_local
    jmp update_gorilla_state                                          ; 4092: 4c 52 41

gorilla_check_jumping_off_rope
    lda gorilla_animation                                             ; 4095: ad 70 0a
    cmp #gorilla_jump_off_rope_animation - gorilla_animations_table   ; 4098: c9 40
    bne update_gorilla_if_banana_held                                 ; 409a: d0 0d
; are we at the end of the animation?
    cpy gorilla_animation                                             ; 409c: cc 70 0a
    bne gorilla_in_room_0_local                                       ; 409f: d0 f1
    ldy #gorilla_idle_animation - gorilla_animations_table            ; 40a1: a0 19
    sty gorilla_animation                                             ; 40a3: 8c 70 0a
    jsr get_random_gorilla_idle_delay                                 ; 40a6: 20 61 42
update_gorilla_if_banana_held
    lda player_held_object_spriteid                                   ; 40a9: a5 52
    cmp #spriteid_banana_menu_item                                    ; 40ab: c9 db
    bne check_for_gorilla_on_rope                                     ; 40ad: d0 28
    lda object_y_low                                                  ; 40af: ad 7c 09
    cmp #$70 ; 'p'                                                    ; 40b2: c9 70
    bcs check_for_gorilla_on_rope                                     ; 40b4: b0 21
    ldx desired_room_index                                            ; 40b6: a6 30
    beq update_gorilla_jumping_off_rope                               ; 40b8: f0 27
    cpx #3                                                            ; 40ba: e0 03
    bcs check_for_gorilla_on_rope                                     ; 40bc: b0 19
    lda partition_position_y                                          ; 40be: ad 6f 0a
    cmp #$20 ; ' '                                                    ; 40c1: c9 20
    beq update_gorilla_jumping_off_rope                               ; 40c3: f0 1c
    cpx #2                                                            ; 40c5: e0 02
    beq check_for_gorilla_on_rope                                     ; 40c7: f0 0e
    lda object_x_high                                                 ; 40c9: ad 66 09
    cmp #1                                                            ; 40cc: c9 01
    bne update_gorilla_jumping_off_rope                               ; 40ce: d0 11
    lda object_x_low                                                  ; 40d0: ad 50 09
    cmp #$10                                                          ; 40d3: c9 10
    bcc update_gorilla_jumping_off_rope                               ; 40d5: 90 0a
check_for_gorilla_on_rope
    lda gorilla_animation                                             ; 40d7: ad 70 0a
    cmp #gorilla_on_rope_animation - gorilla_animations_table         ; 40da: c9 56
    beq gorilla_in_room_0_local                                       ; 40dc: f0 b4
    jmp update_gorilla_if_not_idle                                    ; 40de: 4c 44 41

update_gorilla_jumping_off_rope
    lda gorilla_to_player_direction                                   ; 40e1: ad 6d 42
    beq update_gorilla_state                                          ; 40e4: f0 6c
    sta gorilla_direction                                             ; 40e6: 8d 73 0a
    lda gorilla_animation                                             ; 40e9: ad 70 0a
    cmp #gorilla_on_rope_animation - gorilla_animations_table         ; 40ec: c9 56
    bne check_gorilla_x_position                                      ; 40ee: d0 0d
    lda delay_before_gorilla_state_change                             ; 40f0: ad 75 0a
    bne update_gorilla_state                                          ; 40f3: d0 5d
    ldy #gorilla_jump_off_rope_animation - gorilla_animations_table   ; 40f5: a0 40
    sty gorilla_animation                                             ; 40f7: 8c 70 0a
    jmp update_gorilla_state                                          ; 40fa: 4c 52 41

check_gorilla_x_position
    lda gorilla_direction                                             ; 40fd: ad 73 0a
    bmi check_gorilla_x_position_moving_left                          ; 4100: 30 16
; check gorilla x position moving right
    lda gorilla_x_position                                            ; 4102: ad 72 0a
    cmp #$2e ; '.'                                                    ; 4105: c9 2e
    bcc update_gorilla_if_walk_cycle                                  ; 4107: 90 2d
    beq gorilla_set_jump_on_rope                                      ; 4109: f0 23
    cmp #$64 ; 'd'                                                    ; 410b: c9 64
    bcc update_gorilla_if_walk_cycle                                  ; 410d: 90 27
    beq gorilla_set_jump_on_rope                                      ; 410f: f0 1d
    cmp #$86                                                          ; 4111: c9 86
    bcc update_gorilla_if_walk_cycle                                  ; 4113: 90 21
    jmp update_gorilla_if_not_idle                                    ; 4115: 4c 44 41

check_gorilla_x_position_moving_left
    lda gorilla_x_position                                            ; 4118: ad 72 0a
    cmp #$72 ; 'r'                                                    ; 411b: c9 72
    beq gorilla_set_jump_on_rope                                      ; 411d: f0 0f
    bcs update_gorilla_if_walk_cycle                                  ; 411f: b0 15
    cmp #$3c ; '<'                                                    ; 4121: c9 3c
    beq gorilla_set_jump_on_rope                                      ; 4123: f0 09
    bcs update_gorilla_if_walk_cycle                                  ; 4125: b0 0f
    cmp #$17                                                          ; 4127: c9 17
    bcs update_gorilla_if_walk_cycle                                  ; 4129: b0 0b
    jmp update_gorilla_if_not_idle                                    ; 412b: 4c 44 41

gorilla_set_jump_on_rope
    ldy #gorilla_jump_on_rope_animation - gorilla_animations_table    ; 412e: a0 2a
    sty gorilla_animation                                             ; 4130: 8c 70 0a
    jmp update_gorilla_state                                          ; 4133: 4c 52 41

update_gorilla_if_walk_cycle
    lda #gorilla_walk_cycle_animation - gorilla_animations_table      ; 4136: a9 1d
    cmp gorilla_animation                                             ; 4138: cd 70 0a
    beq update_gorilla_state                                          ; 413b: f0 15
    tay                                                               ; 413d: a8
    sty gorilla_animation                                             ; 413e: 8c 70 0a
    jmp update_gorilla_state                                          ; 4141: 4c 52 41

update_gorilla_if_not_idle
    lda #gorilla_idle_animation - gorilla_animations_table            ; 4144: a9 19
    cmp gorilla_animation                                             ; 4146: cd 70 0a
    beq update_gorilla_state                                          ; 4149: f0 07
    tay                                                               ; 414b: a8
    sty gorilla_animation                                             ; 414c: 8c 70 0a
    jsr get_random_gorilla_idle_delay                                 ; 414f: 20 61 42
update_gorilla_state
    lda desired_room_index                                            ; 4152: a5 30
    cmp #3                                                            ; 4154: c9 03
    bcs update_gorilla_idle_delay                                     ; 4156: b0 6b
    ldx #0                                                            ; 4158: a2 00
    sty remember_gorilla_state                                        ; 415a: 8c 6e 42
    ldy #5                                                            ; 415d: a0 05
    jsr test_for_collision_between_objects_x_and_y                    ; 415f: 20 e2 28
    ldy remember_gorilla_state                                        ; 4162: ac 6e 42
    ora #0                                                            ; 4165: 09 00
    beq update_gorilla_idle_delay                                     ; 4167: f0 5a
    lda save_game_level_f_got_banana_or_banana_y_position             ; 4169: ad 16 0a
    cmp #$ff                                                          ; 416c: c9 ff
    bne set_player_reaction_speed                                     ; 416e: d0 16
    lda player_held_object_spriteid                                   ; 4170: a5 52
    cmp #$db                                                          ; 4172: c9 db
    bne set_player_reaction_speed                                     ; 4174: d0 10
    jsr remove_item_from_toolbar_menu                                 ; 4176: 20 e0 2b
    lda #0                                                            ; 4179: a9 00
    sta player_held_object_spriteid                                   ; 417b: 85 52
    sta object_spriteid + objectid_player_accessory                   ; 417d: 8d a9 09
    sta player_using_object_spriteid                                  ; 4180: 8d b6 2e
    sta save_game_level_f_got_banana_or_banana_y_position             ; 4183: 8d 16 0a
; if gorilla is climbing or on rope then fall off gorilla
set_player_reaction_speed
    lda #$80                                                          ; 4186: a9 80
    sta player_wall_collision_reaction_speed                          ; 4188: 8d 33 24
; branch if climbing or on rope
    lda gorilla_animation                                             ; 418b: ad 70 0a
    cmp #gorilla_climbing_rope_animation - gorilla_animations_table   ; 418e: c9 5a
    beq update_gorilla_idle_delay                                     ; 4190: f0 31
    cmp #gorilla_on_rope_animation - gorilla_animations_table         ; 4192: c9 56
    beq update_gorilla_idle_delay                                     ; 4194: f0 2d
    lda #6                                                            ; 4196: a9 06
    ldx gorilla_to_player_direction                                   ; 4198: ae 6d 42
    bpl set_player_reaction_speed_bounce_off_gorilla                  ; 419b: 10 02
    lda #$fa                                                          ; 419d: a9 fa
set_player_reaction_speed_bounce_off_gorilla
    sta player_wall_collision_reaction_speed                          ; 419f: 8d 33 24
    lda gorilla_animation                                             ; 41a2: ad 70 0a
    cmp #gorilla_jump_on_rope_animation - gorilla_animations_table    ; 41a5: c9 2a
    beq update_gorilla_idle_delay                                     ; 41a7: f0 1a
    cmp #gorilla_jump_off_rope_animation - gorilla_animations_table   ; 41a9: c9 40
    beq update_gorilla_idle_delay                                     ; 41ab: f0 16
    lda #1                                                            ; 41ad: a9 01
    ldx gorilla_to_player_direction                                   ; 41af: ae 6d 42
    bpl set_gorilla_direction                                         ; 41b2: 10 02
    lda #$ff                                                          ; 41b4: a9 ff
set_gorilla_direction
    sta gorilla_direction                                             ; 41b6: 8d 73 0a
    ldy #gorilla_idle_animation - gorilla_animations_table            ; 41b9: a0 19
    sty gorilla_animation                                             ; 41bb: 8c 70 0a
    ldy #0                                                            ; 41be: a0 00
    jsr get_random_gorilla_idle_delay                                 ; 41c0: 20 61 42
update_gorilla_idle_delay
    lda gorilla_animation                                             ; 41c3: ad 70 0a
    cmp #gorilla_idle_animation - gorilla_animations_table            ; 41c6: c9 19
    bne update_gorilla_state_based_on_animation_step                  ; 41c8: d0 08
    lda delay_before_gorilla_state_change                             ; 41ca: ad 75 0a
    bne update_gorilla_state_based_on_animation_step                  ; 41cd: d0 03
    jsr get_random_gorilla_idle_delay                                 ; 41cf: 20 61 42
update_gorilla_state_based_on_animation_step
    sty gorilla_animation_step                                        ; 41d2: 8c 74 0a
    iny                                                               ; 41d5: c8
    lda gorilla_animations_table,y                                    ; 41d6: b9 72 3f
    ldx gorilla_direction                                             ; 41d9: ae 73 0a
    bpl add_offset_to_x_position                                      ; 41dc: 10 05
    eor #$ff                                                          ; 41de: 49 ff
    clc                                                               ; 41e0: 18
    adc #1                                                            ; 41e1: 69 01
add_offset_to_x_position
    clc                                                               ; 41e3: 18
    adc gorilla_x_position                                            ; 41e4: 6d 72 0a
    sta gorilla_x_position                                            ; 41e7: 8d 72 0a
    iny                                                               ; 41ea: c8
; add offset to y position
    lda gorilla_animations_table,y                                    ; 41eb: b9 72 3f
    clc                                                               ; 41ee: 18
    adc gorilla_y_position                                            ; 41ef: 6d 71 0a
    sta gorilla_y_position                                            ; 41f2: 8d 71 0a
update_gorilla_object
    lda desired_room_index                                            ; 41f5: a5 30
    cmp #2                                                            ; 41f7: c9 02
    bcs return2                                                       ; 41f9: b0 65
    ldy gorilla_animation_step                                        ; 41fb: ac 74 0a
    lda gorilla_animations_table,y                                    ; 41fe: b9 72 3f
    sta object_spriteid + objectid_gorilla                            ; 4201: 8d ad 09
    lda gorilla_direction                                             ; 4204: ad 73 0a
    sta object_direction + objectid_gorilla                           ; 4207: 8d c3 09
    lda gorilla_y_position                                            ; 420a: ad 71 0a
    sta object_y_low + objectid_gorilla                               ; 420d: 8d 81 09
    lda gorilla_x_position                                            ; 4210: ad 72 0a
; reduce gorilla position to room position
    ldx desired_room_index                                            ; 4213: a6 30
    beq reduced_to_room_0                                             ; 4215: f0 03
    sec                                                               ; 4217: 38
    sbc #$50 ; 'P'                                                    ; 4218: e9 50
reduced_to_room_0
    ldx #0                                                            ; 421a: a2 00
    cmp #$a0                                                          ; 421c: c9 a0
    bcc set_gorilla_x_position                                        ; 421e: 90 01
    dex                                                               ; 4220: ca
set_gorilla_x_position
    stx object_x_high + objectid_gorilla                              ; 4221: 8e 6b 09
    asl                                                               ; 4224: 0a
    rol object_x_high + objectid_gorilla                              ; 4225: 2e 6b 09
    asl                                                               ; 4228: 0a
    rol object_x_high + objectid_gorilla                              ; 4229: 2e 6b 09
    sta object_x_low + objectid_gorilla                               ; 422c: 8d 55 09
    lda gorilla_direction                                             ; 422f: ad 73 0a
    bpl update_gorilla_jump_off_rope                                  ; 4232: 10 11
    lda object_x_low + objectid_gorilla                               ; 4234: ad 55 09
    sec                                                               ; 4237: 38
    sbc #1                                                            ; 4238: e9 01
    sta object_x_low + objectid_gorilla                               ; 423a: 8d 55 09
    lda object_x_high + objectid_gorilla                              ; 423d: ad 6b 09
    sbc #0                                                            ; 4240: e9 00
    sta object_x_high + objectid_gorilla                              ; 4242: 8d 6b 09
; check for first update in room (branch if so)
update_gorilla_jump_off_rope
    lda update_room_first_update_flag                                 ; 4245: ad 2b 13
    bne return2                                                       ; 4248: d0 16
    lda gorilla_animation                                             ; 424a: ad 70 0a
    cmp #gorilla_jump_off_rope_animation - gorilla_animations_table   ; 424d: c9 40
    bne return2                                                       ; 424f: d0 0f
    lda #2                                                            ; 4251: a9 02
    sta temp_bottom_offset                                            ; 4253: 8d 51 25
    lda #5                                                            ; 4256: a9 05
    jsr get_solid_rock_collision_for_object_a                         ; 4258: 20 94 28
    beq return2                                                       ; 425b: f0 03
    jsr play_landing_sound                                            ; 425d: 20 a9 23
return2
    rts                                                               ; 4260: 60

get_random_gorilla_idle_delay
    lda #$1f                                                          ; 4261: a9 1f
    jsr get_random_number_up_to_a                                     ; 4263: 20 a6 18
    clc                                                               ; 4266: 18
    adc #$20 ; ' '                                                    ; 4267: 69 20
    sta delay_before_gorilla_state_change                             ; 4269: 8d 75 0a
    rts                                                               ; 426c: 60

gorilla_to_player_direction
    !byte 0                                                           ; 426d: 00
remember_gorilla_state
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
; draw boulder at (13,20) of size (3x2)
    lda #3                                                            ; 42c3: a9 03
    sta width_in_cells                                                ; 42c5: 85 3c
    lda #2                                                            ; 42c7: a9 02
    sta height_in_cells                                               ; 42c9: 85 3d
    lda #spriteid_boulder                                             ; 42cb: a9 d0
    ldx #$0d                                                          ; 42cd: a2 0d
    ldy #$14                                                          ; 42cf: a0 14
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 42d1: 20 57 1f
; draw boulder at (10,20) of size (3x2)
    ldx #$0a                                                          ; 42d4: a2 0a
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 42d6: 20 57 1f
; draw boulder at (10,18) of size (3x2)
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
update_banana_puzzle
    lda update_room_first_update_flag                                 ; 42f8: ad 2b 13
    beq update_banana_not_first_update                                ; 42fb: f0 50
; initialise banana
    lda #spriteid_banana_menu_item                                    ; 42fd: a9 db
    sta toolbar_collectable_spriteids+1                               ; 42ff: 8d e9 2e
    lda #spriteid_banana                                              ; 4302: a9 da
    sta collectable_spriteids+1                                       ; 4304: 8d ee 2e
    sta collectable_being_used_spriteids + 1                          ; 4307: 8d f3 2e
; check for level change (branch if not)
    lda current_level                                                 ; 430a: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 430c: c5 51
    beq initialise_banana_new_room                                    ; 430e: f0 0e
    lda save_game_level_f_got_banana_or_banana_y_position             ; 4310: ad 16 0a
    beq initialise_banana_new_room                                    ; 4313: f0 09
    cmp #$ff                                                          ; 4315: c9 ff
    beq initialise_banana_new_room                                    ; 4317: f0 05
    lda #$86                                                          ; 4319: a9 86
    sta save_game_level_f_got_banana_or_banana_y_position             ; 431b: 8d 16 0a
initialise_banana_new_room
    lda desired_room_index                                            ; 431e: a5 30
    cmp #3                                                            ; 4320: c9 03
    bne banana_already_landed_or_taken_local                          ; 4322: d0 26
; in room 3. Draw bunch of bananas
    ldx #$21 ; '!'                                                    ; 4324: a2 21
    lda #4                                                            ; 4326: a9 04
    sta temp_sprite_x_offset                                          ; 4328: 85 3a
    ldy #2                                                            ; 432a: a0 02
    lda #spriteid_banana_bunch                                        ; 432c: a9 dc
    jsr draw_sprite_a_at_cell_xy                                      ; 432e: 20 4c 1f
    lda #spriteid_erase_partition_or_banana                           ; 4331: a9 cf
    sta object_erase_type + objectid_banana                           ; 4333: 8d ae 38
    lda #$c0                                                          ; 4336: a9 c0
    sta object_z_order + objectid_banana                              ; 4338: 8d c4 38
    lda #$0c                                                          ; 433b: a9 0c
    sta object_x_low + objectid_banana                                ; 433d: 8d 52 09
    lda #1                                                            ; 4340: a9 01
    sta object_x_high + objectid_banana                               ; 4342: 8d 68 09
    lda #0                                                            ; 4345: a9 00
    sta object_y_high + objectid_banana                               ; 4347: 8d 94 09
banana_already_landed_or_taken_local
    jmp banana_already_landed_or_taken                                ; 434a: 4c aa 43

update_banana_not_first_update
    lda save_game_level_f_got_banana_or_banana_y_position             ; 434d: ad 16 0a
    cmp #$ff                                                          ; 4350: c9 ff
    beq banana_already_landed_or_taken                                ; 4352: f0 56
    ora #0                                                            ; 4354: 09 00
    bne update_banana_in_room_3                                       ; 4356: d0 16
    lda desired_room_index                                            ; 4358: a5 30
    cmp #3                                                            ; 435a: c9 03
    bne banana_already_landed_or_taken                                ; 435c: d0 4c
; as soon as the player lands, then create a banana
    lda #2                                                            ; 435e: a9 02
    sta temp_bottom_offset                                            ; 4360: 8d 51 25
    lda #0                                                            ; 4363: a9 00
    jsr get_solid_rock_collision_for_object_a                         ; 4365: 20 94 28
    beq banana_already_landed_or_taken                                ; 4368: f0 40
    lda #$28 ; '('                                                    ; 436a: a9 28
    bne set_banana_y                                                  ; 436c: d0 39                   ; ALWAYS branch

update_banana_in_room_3
    lda desired_room_index                                            ; 436e: a5 30
    cmp #3                                                            ; 4370: c9 03
    bne no_banana_collision                                           ; 4372: d0 12
    ldx #objectid_old_player                                          ; 4374: a2 0b
    ldy #2                                                            ; 4376: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 4378: 20 e2 28
    beq no_banana_collision                                           ; 437b: f0 09
    lda #spriteid_banana_menu_item                                    ; 437d: a9 db
    jsr find_or_create_menu_slot_for_A                                ; 437f: 20 bd 2b
    lda #$ff                                                          ; 4382: a9 ff
    bne set_banana_y                                                  ; 4384: d0 21                   ; ALWAYS branch

no_banana_collision
    lda save_game_level_f_got_banana_or_banana_y_position             ; 4386: ad 16 0a
    cmp #$86                                                          ; 4389: c9 86
    beq banana_already_landed_or_taken                                ; 438b: f0 1d
    clc                                                               ; 438d: 18
    adc #8                                                            ; 438e: 69 08
    cmp #$80                                                          ; 4390: c9 80
    bcc set_banana_y                                                  ; 4392: 90 13
    bne banana_on_ground                                              ; 4394: d0 0f
    sta save_game_level_f_got_banana_or_banana_y_position             ; 4396: 8d 16 0a
    lda desired_room_index                                            ; 4399: a5 30
    cmp #3                                                            ; 439b: c9 03
    bne banana_already_landed_or_taken                                ; 439d: d0 0b
    jsr play_landing_sound                                            ; 439f: 20 a9 23
    jmp banana_already_landed_or_taken                                ; 43a2: 4c aa 43

banana_on_ground
    lda #$86                                                          ; 43a5: a9 86
set_banana_y
    sta save_game_level_f_got_banana_or_banana_y_position             ; 43a7: 8d 16 0a
banana_already_landed_or_taken
    lda desired_room_index                                            ; 43aa: a5 30
    cmp #3                                                            ; 43ac: c9 03
    bne return3                                                       ; 43ae: d0 1f
; don't show the banana object if there's no banana visible yet
    lda #spriteid_one_pixel_masked_out                                ; 43b0: a9 00
    sta object_spriteid + objectid_banana                             ; 43b2: 8d aa 09
    lda save_game_level_f_got_banana_or_banana_y_position             ; 43b5: ad 16 0a
    beq return3                                                       ; 43b8: f0 15
; don't show the banana object if it's already taken
    cmp #$ff                                                          ; 43ba: c9 ff
    beq return3                                                       ; 43bc: f0 11
; set the banana y position
    sta object_y_low + objectid_banana                                ; 43be: 8d 7e 09
; set the banana on the ground sprite, exit if on the ground
    ldx #spriteid_banana_on_ground                                    ; 43c1: a2 dd
    stx object_spriteid + objectid_banana                             ; 43c3: 8e aa 09
    cmp #$86                                                          ; 43c6: c9 86
    beq return3                                                       ; 43c8: f0 05
; set the banana in the air sprite
    lda #spriteid_banana                                              ; 43ca: a9 da
    sta object_spriteid + objectid_banana                             ; 43cc: 8d aa 09
return3
    rts                                                               ; 43cf: 60

partition_moving_envelope
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
partition_moving_sound
    !word $10                                                         ; 43de: 10 00                   ; channel
    !word 5                                                           ; 43e0: 05 00                   ; amplitude
    !word 4                                                           ; 43e2: 04 00                   ; pitch
    !word 4                                                           ; 43e4: 04 00                   ; duration
partition_landing_envelope
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
partition_landing_sound2
    !word $10                                                         ; 43f4: 10 00                   ; channel
    !word 6                                                           ; 43f6: 06 00                   ; amplitude
    !word 7                                                           ; 43f8: 07 00                   ; pitch
    !word 1                                                           ; 43fa: 01 00                   ; duration
partition_landing_sound1
    !word $11                                                         ; 43fc: 11 00                   ; channel
    !word 0                                                           ; 43fe: 00 00                   ; amplitude
    !word 210                                                         ; 4400: d2 00                   ; pitch
    !word 1                                                           ; 4402: 01 00                   ; duration
ground_fill_2x2_top_left
    !byte %...#....                                                   ; 4404: 10
    !byte %....#...                                                   ; 4405: 08
    !byte %.....#..                                                   ; 4406: 04
    !byte %#.....#.                                                   ; 4407: 82
    !byte %.#.....#                                                   ; 4408: 41
    !byte %..#....#                                                   ; 4409: 21
    !byte %...#..#.                                                   ; 440a: 12
    !byte %....##..                                                   ; 440b: 0c
ground_fill_2x2_top_right
    !byte %....#...                                                   ; 440c: 08
    !byte %...#....                                                   ; 440d: 10
    !byte %..#.....                                                   ; 440e: 20
    !byte %.#.....#                                                   ; 440f: 41
    !byte %#.....#.                                                   ; 4410: 82
    !byte %.....#..                                                   ; 4411: 04
    !byte %....#...                                                   ; 4412: 08
    !byte %...#....                                                   ; 4413: 10
ground_fill_2x2_bottom_left
    !byte %....#...                                                   ; 4414: 08
    !byte %...#....                                                   ; 4415: 10
    !byte %..#.....                                                   ; 4416: 20
    !byte %.#.....#                                                   ; 4417: 41
    !byte %#.....#.                                                   ; 4418: 82
    !byte %.....#..                                                   ; 4419: 04
    !byte %....#...                                                   ; 441a: 08
    !byte %...#....                                                   ; 441b: 10
ground_fill_2x2_bottom_right
    !byte %..##....                                                   ; 441c: 30
    !byte %.#..#...                                                   ; 441d: 48
    !byte %#....#..                                                   ; 441e: 84
    !byte %#.....#.                                                   ; 441f: 82
    !byte %.#.....#                                                   ; 4420: 41
    !byte %..#.....                                                   ; 4421: 20
    !byte %...#....                                                   ; 4422: 10
    !byte %....#...                                                   ; 4423: 08
sprite_data
pydis_end
!if (<ground_fill_2x2_top_left) != $04 {
    !error "Assertion failed: <ground_fill_2x2_top_left == $04"
}
!if (<partition_landing_envelope) != $e6 {
    !error "Assertion failed: <partition_landing_envelope == $e6"
}
!if (<partition_landing_sound1) != $fc {
    !error "Assertion failed: <partition_landing_sound1 == $fc"
}
!if (<partition_landing_sound2) != $f4 {
    !error "Assertion failed: <partition_landing_sound2 == $f4"
}
!if (<partition_moving_envelope) != $d0 {
    !error "Assertion failed: <partition_moving_envelope == $d0"
}
!if (<partition_moving_sound) != $de {
    !error "Assertion failed: <partition_moving_sound == $de"
}
!if (>ground_fill_2x2_top_left) != $44 {
    !error "Assertion failed: >ground_fill_2x2_top_left == $44"
}
!if (>partition_landing_envelope) != $43 {
    !error "Assertion failed: >partition_landing_envelope == $43"
}
!if (>partition_landing_sound1) != $43 {
    !error "Assertion failed: >partition_landing_sound1 == $43"
}
!if (>partition_landing_sound2) != $43 {
    !error "Assertion failed: >partition_landing_sound2 == $43"
}
!if (>partition_moving_envelope) != $43 {
    !error "Assertion failed: >partition_moving_envelope == $43"
}
!if (>partition_moving_sound) != $43 {
    !error "Assertion failed: >partition_moving_sound == $43"
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
!if (gorilla_climbing_rope_animation - gorilla_animations_table) != $5a {
    !error "Assertion failed: gorilla_climbing_rope_animation - gorilla_animations_table == $5a"
}
!if (gorilla_idle_animation - gorilla_animations_table) != $19 {
    !error "Assertion failed: gorilla_idle_animation - gorilla_animations_table == $19"
}
!if (gorilla_jump_off_rope_animation - gorilla_animations_table) != $40 {
    !error "Assertion failed: gorilla_jump_off_rope_animation - gorilla_animations_table == $40"
}
!if (gorilla_jump_on_rope_animation - gorilla_animations_table) != $2a {
    !error "Assertion failed: gorilla_jump_on_rope_animation - gorilla_animations_table == $2a"
}
!if (gorilla_on_rope_animation - gorilla_animations_table) != $56 {
    !error "Assertion failed: gorilla_on_rope_animation - gorilla_animations_table == $56"
}
!if (gorilla_walk_cycle_animation - gorilla_animations_table) != $1d {
    !error "Assertion failed: gorilla_walk_cycle_animation - gorilla_animations_table == $1d"
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
!if (monkey_climb_animation - monkey_base_animation) != $51 {
    !error "Assertion failed: monkey_climb_animation - monkey_base_animation == $51"
}
!if (monkey_climb_down_animation - monkey_base_animation) != $49 {
    !error "Assertion failed: monkey_climb_down_animation - monkey_base_animation == $49"
}
!if (monkey_climb_idle_animation - monkey_base_animation) != $45 {
    !error "Assertion failed: monkey_climb_idle_animation - monkey_base_animation == $45"
}
!if (object_direction + objectid_gorilla) != $09c3 {
    !error "Assertion failed: object_direction + objectid_gorilla == $09c3"
}
!if (object_spriteid + objectid_banana) != $09aa {
    !error "Assertion failed: object_spriteid + objectid_banana == $09aa"
}
!if (object_spriteid + objectid_gorilla) != $09ad {
    !error "Assertion failed: object_spriteid + objectid_gorilla == $09ad"
}
!if (object_x_high + objectid_banana) != $0968 {
    !error "Assertion failed: object_x_high + objectid_banana == $0968"
}
!if (object_x_high + objectid_gorilla) != $096b {
    !error "Assertion failed: object_x_high + objectid_gorilla == $096b"
}
!if (object_x_low + objectid_banana) != $0952 {
    !error "Assertion failed: object_x_low + objectid_banana == $0952"
}
!if (object_x_low + objectid_gorilla) != $0955 {
    !error "Assertion failed: object_x_low + objectid_gorilla == $0955"
}
!if (object_y_high + objectid_banana) != $0994 {
    !error "Assertion failed: object_y_high + objectid_banana == $0994"
}
!if (object_y_high + objectid_gorilla) != $0997 {
    !error "Assertion failed: object_y_high + objectid_gorilla == $0997"
}
!if (object_y_low + objectid_banana) != $097e {
    !error "Assertion failed: object_y_low + objectid_banana == $097e"
}
!if (object_y_low + objectid_gorilla) != $0981 {
    !error "Assertion failed: object_y_low + objectid_gorilla == $0981"
}
!if (object_y_low + objectid_partition) != $097f {
    !error "Assertion failed: object_y_low + objectid_partition == $097f"
}
!if (objectid_brazier) != $02 {
    !error "Assertion failed: objectid_brazier == $02"
}
!if (objectid_brazier_room_1) != $06 {
    !error "Assertion failed: objectid_brazier_room_1 == $06"
}
!if (objectid_connecting_rope) != $04 {
    !error "Assertion failed: objectid_connecting_rope == $04"
}
!if (objectid_old_player) != $0b {
    !error "Assertion failed: objectid_old_player == $0b"
}
!if (objectid_partition) != $03 {
    !error "Assertion failed: objectid_partition == $03"
}
!if (objectid_player) != $00 {
    !error "Assertion failed: objectid_player == $00"
}
!if (objectid_rope_end) != $02 {
    !error "Assertion failed: objectid_rope_end == $02"
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
!if (spriteid_banana) != $da {
    !error "Assertion failed: spriteid_banana == $da"
}
!if (spriteid_banana_bunch) != $dc {
    !error "Assertion failed: spriteid_banana_bunch == $dc"
}
!if (spriteid_banana_menu_item) != $db {
    !error "Assertion failed: spriteid_banana_menu_item == $db"
}
!if (spriteid_banana_on_ground) != $dd {
    !error "Assertion failed: spriteid_banana_on_ground == $dd"
}
!if (spriteid_boulder) != $d0 {
    !error "Assertion failed: spriteid_boulder == $d0"
}
!if (spriteid_erase_gorilla) != $d1 {
    !error "Assertion failed: spriteid_erase_gorilla == $d1"
}
!if (spriteid_erase_partition_or_banana) != $cf {
    !error "Assertion failed: spriteid_erase_partition_or_banana == $cf"
}
!if (spriteid_gorilla1) != $d2 {
    !error "Assertion failed: spriteid_gorilla1 == $d2"
}
!if (spriteid_gorilla2) != $d3 {
    !error "Assertion failed: spriteid_gorilla2 == $d3"
}
!if (spriteid_gorilla3) != $d4 {
    !error "Assertion failed: spriteid_gorilla3 == $d4"
}
!if (spriteid_gorilla4) != $d5 {
    !error "Assertion failed: spriteid_gorilla4 == $d5"
}
!if (spriteid_gorilla5) != $d6 {
    !error "Assertion failed: spriteid_gorilla5 == $d6"
}
!if (spriteid_gorilla_climb1) != $d7 {
    !error "Assertion failed: spriteid_gorilla_climb1 == $d7"
}
!if (spriteid_gorilla_climb2) != $d8 {
    !error "Assertion failed: spriteid_gorilla_climb2 == $d8"
}
!if (spriteid_gorilla_jump) != $d9 {
    !error "Assertion failed: spriteid_gorilla_jump == $d9"
}
!if (spriteid_gorilla_pushes) != $de {
    !error "Assertion failed: spriteid_gorilla_pushes == $de"
}
!if (spriteid_icodata_monkey) != $06 {
    !error "Assertion failed: spriteid_icodata_monkey == $06"
}
!if (spriteid_one_pixel_masked_out) != $00 {
    !error "Assertion failed: spriteid_one_pixel_masked_out == $00"
}
!if (spriteid_rope_and_partition) != $ce {
    !error "Assertion failed: spriteid_rope_and_partition == $ce"
}
!if (spriteid_rope_hook_left) != $c8 {
    !error "Assertion failed: spriteid_rope_hook_left == $c8"
}
!if (spriteid_rope_hook_right) != $c9 {
    !error "Assertion failed: spriteid_rope_hook_right == $c9"
}
!if (spriteid_rope_short_horizontal) != $ca {
    !error "Assertion failed: spriteid_rope_short_horizontal == $ca"
}
!if (spriteid_rope_short_vertical) != $cb {
    !error "Assertion failed: spriteid_rope_short_vertical == $cb"
}
!if (spriteid_rope_vertical) != $cc {
    !error "Assertion failed: spriteid_rope_vertical == $cc"
}
!if (spriteid_rope_vertical_end) != $cd {
    !error "Assertion failed: spriteid_rope_vertical_end == $cd"
}
