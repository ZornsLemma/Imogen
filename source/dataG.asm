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
objectid_arrow                        = 2
objectid_baby                         = 5
objectid_balloon1                     = 3
objectid_balloon1_rope                = 4
objectid_balloon2                     = 5
objectid_balloon2_rope                = 6
objectid_bow                          = 2
objectid_old_player                   = 11
objectid_old_player_accessory         = 12
objectid_player                       = 0
objectid_player_accessory             = 1
objectid_table                        = 5
objectid_table_rope                   = 6
opcode_jmp                            = 76
sprite_op_flags_copy_screen           = 1
sprite_op_flags_erase_to_bg_colour    = 2
sprite_op_flags_erase_to_fg_colour    = 4
sprite_op_flags_normal                = 0
spriteid_197                          = 197
spriteid_arrow                        = 204
spriteid_baby                         = 212
spriteid_baby_dead                    = 215
spriteid_baby_fall                    = 214
spriteid_baby_smile                   = 217
spriteid_baby_surprise                = 213
spriteid_ball                         = 59
spriteid_balloon                      = 200
spriteid_bow                          = 202
spriteid_bow_menu_item                = 203
spriteid_brazier                      = 58
spriteid_burst_balloon                = 211
spriteid_cache1                       = 205
spriteid_cache2                       = 207
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
spriteid_rope_bottom                  = 208
spriteid_rope_end                     = 10
spriteid_rope_end1                    = 201
spriteid_rope_hook                    = 11
spriteid_rope_top                     = 209
spriteid_rope_top_broken              = 210
spriteid_sparkles1                    = 34
spriteid_sparkles2                    = 35
spriteid_sparkles3                    = 36
spriteid_sparkles4                    = 37
spriteid_sparkles5                    = 38
spriteid_table                        = 206
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
spriteid_wood_block                   = 216

; Memory locations
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
temp_player_x                                       = $70
object_left_cell_x                                  = $78
object_right_cell_x                                 = $79
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
current_animation                                   = $09df
save_game_level_g_got_bow                           = $0a17
save_game_level_g_dropped_table_progress            = $0a18
save_game_level_g_baby_progress                     = $0a19
arrow_direction                                     = $0a6f
arrow_x_position_low                                = $0a70
arrow_x_position_high                               = $0a71
arrow_y_position_low                                = $0a72
arrow_room                                          = $0a73
arrow_active_flag                                   = $0a74
room_1_left_hand_balloon_y_position                 = $0a75
room_1_right_hand_balloon_y_position                = $0a76
room_3_balloon_y_position                           = $0a77
room_0_balloon_y_position                           = $0a78
room_3_baby_progress                                = $0a79
room_3_baby_y_position                              = $0a7a
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
update_player_solid_rock_collision                  = $25f5
update_player_hitting_floor                         = $2770
player_has_hit_floor_flag                           = $288f
player_just_fallen_off_edge_direction               = $2890
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
    !word sprite_data - level_data                                    ; 3ad5: d4 0a                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f2 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 0d 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
room_index_cheat1
    !byte 2                                                           ; 3add: 02
room_index_cheat2
    !byte 3                                                           ; 3ade: 03
level_room_data_table
    !word room_0_data                                                 ; 3adf: 3d 3f                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: a4 42
    !word room_2_data                                                 ; 3ae3: 1a 3b
    !word room_3_data                                                 ; 3ae5: 02 3d

; *************************************************************************************
; 'BALLOONACY[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $89, $8a, $87, $87, $84, $84, $85, $8a, $88, $92, $c6       ; 3ae7: 89 8a 87...

; *************************************************************************************
; 
; Level initialisation
; 
; This is called whenever a new room is entered.
; 
; *************************************************************************************
; check for level change (branch if not)
level_specific_initialisation
    lda current_level                                                 ; 3af2: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3af4: c5 51
    beq return1                                                       ; 3af6: f0 14
    lda developer_flags                                               ; 3af8: ad 03 11
    bpl developer_mode_inactive                                       ; 3afb: 10 05
    lda #$ff                                                          ; 3afd: a9 ff
    sta save_game_level_g_got_bow                                     ; 3aff: 8d 17 0a
developer_mode_inactive
    lda save_game_level_g_got_bow                                     ; 3b02: ad 17 0a
    beq return1                                                       ; 3b05: f0 05
    lda #spriteid_bow_menu_item                                       ; 3b07: a9 cb
    jsr find_or_create_menu_slot_for_A                                ; 3b09: 20 bd 2b
return1
    rts                                                               ; 3b0c: 60

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
    jsr room_0_update_handler                                         ; 3b0d: 20 d7 3f
    jsr room_1_update_handler                                         ; 3b10: 20 31 43
    jsr room_2_update_handler                                         ; 3b13: 20 ad 3b
    jsr room_3_update_handler                                         ; 3b16: 20 a9 3d
    rts                                                               ; 3b19: 60

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 19                                                          ; 3b1a: 13                      ; initial player X cell
    !byte 22                                                          ; 3b1b: 16                      ; initial player Y cell

; ########################################
; ########################################
; ###   |                              ###
; ###   |                              ###
; ###   |                              ###
; ###   |                              ###
; ###   |                              ###
; ###   |                              ###
; ###   |   #####                      ###
; ###   |   #####                      ###
; ###   |     ###                      ###
; ###   |     ###                      ###
; ###   |     ###                      ###
; ###   |     ###                      ###
; ###   |     ###                      ###
; ###   |     ###                      ###
; ###   |     ###                      ###
;       |                      ###
;       |                      ###
;       |                      ###
;                        OOOOOO###
;                    P   OOOOOO###
; ########################################
; ########################################
; set ground fill tile to use
room_2_code
    lda #<ground_fill_2x2_top_left                                    ; 3b1c: a9 89
    sta source_sprite_memory_low                                      ; 3b1e: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3b20: a9 45
    sta source_sprite_memory_high                                     ; 3b22: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3b24: a2 00
    ldy #0                                                            ; 3b26: a0 00
    lda #$ff                                                          ; 3b28: a9 ff
    sta width_in_cells                                                ; 3b2a: 85 3c
    lda #2                                                            ; 3b2c: a9 02
    sta height_in_cells                                               ; 3b2e: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b30: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3b33: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3b35: 20 bb 1a
; draw 3x15 rectangle at (0,2)
    ldy #2                                                            ; 3b38: a0 02
    lda #3                                                            ; 3b3a: a9 03
    sta width_in_cells                                                ; 3b3c: 85 3c
    lda #$0f                                                          ; 3b3e: a9 0f
    sta height_in_cells                                               ; 3b40: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b42: 20 bb 1a
; draw 3x15 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3b45: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 3b47: 20 bb 1a
; draw 3x5 rectangle at (29,17)
    ldx #$1d                                                          ; 3b4a: a2 1d
    ldy #$11                                                          ; 3b4c: a0 11
    lda #5                                                            ; 3b4e: a9 05
    sta height_in_cells                                               ; 3b50: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b52: 20 bb 1a
; draw 3x9 rectangle at (12,8)
    ldx #$0c                                                          ; 3b55: a2 0c
    ldy #8                                                            ; 3b57: a0 08
    lda #9                                                            ; 3b59: a9 09
    sta height_in_cells                                               ; 3b5b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b5d: 20 bb 1a
; draw 2x2 rectangle at (10,8)
    ldx #$0a                                                          ; 3b60: a2 0a
    lda #2                                                            ; 3b62: a9 02
    sta width_in_cells                                                ; 3b64: 85 3c
    sta height_in_cells                                               ; 3b66: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b68: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3b6b: 20 90 1b
; draw wood block at (23,20) of size (3x2)
    lda #3                                                            ; 3b6e: a9 03
    sta width_in_cells                                                ; 3b70: 85 3c
    lda #2                                                            ; 3b72: a9 02
    sta height_in_cells                                               ; 3b74: 85 3d
    ldx #$17                                                          ; 3b76: a2 17
    ldy #$14                                                          ; 3b78: a0 14
    lda #spriteid_wood_block                                          ; 3b7a: a9 d8
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3b7c: 20 57 1f
; draw wood block at (26,20) of size (3x2)
    ldx #$1a                                                          ; 3b7f: a2 1a
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3b81: 20 57 1f
; draw rope at (6,2) length 18
    ldx #6                                                            ; 3b84: a2 06
    ldy #2                                                            ; 3b86: a0 02
    lda #$12                                                          ; 3b88: a9 12
    jsr draw_rope                                                     ; 3b8a: 20 b9 1d
    jsr start_room                                                    ; 3b8d: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 3b90: 20 da 12
    sta room_exit_direction                                           ; 3b93: 85 70
    and #exit_room_left                                               ; 3b95: 29 01
    beq room_2_check_right_exit                                       ; 3b97: f0 07
    ldx #1                                                            ; 3b99: a2 01
    ldy current_level                                                 ; 3b9b: a4 31
    jmp initialise_level_and_room                                     ; 3b9d: 4c 40 11

room_2_check_right_exit
    lda room_exit_direction                                           ; 3ba0: a5 70
    and #exit_room_right                                              ; 3ba2: 29 04
    beq room_2_game_update_loop                                       ; 3ba4: f0 ea
    ldx #3                                                            ; 3ba6: a2 03
    ldy current_level                                                 ; 3ba8: a4 31
    jmp initialise_level_and_room                                     ; 3baa: 4c 40 11

room_2_update_handler
    lda #2                                                            ; 3bad: a9 02
    sta currently_updating_logic_for_room_index                       ; 3baf: 8d ba 1a
    lda #6                                                            ; 3bb2: a9 06
    ldx #$0f                                                          ; 3bb4: a2 0f
    ldy #$0c                                                          ; 3bb6: a0 0c
    jsr update_brazier_and_fire                                       ; 3bb8: 20 88 19
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 3bbb: ad 2b 13
    beq update_table_not_first_update                                 ; 3bbe: f0 3e
    ldx #<envelope1                                                   ; 3bc0: a2 0b
    ldy #>envelope1                                                   ; 3bc2: a0 45
    jsr define_envelope                                               ; 3bc4: 20 5e 39
; check for level change (branch if not)
    lda current_level                                                 ; 3bc7: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3bc9: c5 51
    beq initialise_if_room_2                                          ; 3bcb: f0 0a
    lda save_game_level_g_dropped_table_progress                      ; 3bcd: ad 18 0a
    beq initialise_if_room_2                                          ; 3bd0: f0 05
    lda #$ff                                                          ; 3bd2: a9 ff
    sta save_game_level_g_dropped_table_progress                      ; 3bd4: 8d 18 0a
initialise_if_room_2
    lda desired_room_index                                            ; 3bd7: a5 30
    cmp #2                                                            ; 3bd9: c9 02
    bne c3bf8                                                         ; 3bdb: d0 1b
; initialise room 2
    ldx #<envelope2                                                   ; 3bdd: a2 29
    ldy #>envelope2                                                   ; 3bdf: a0 45
    jsr define_envelope                                               ; 3be1: 20 5e 39
    lda #spriteid_cache2                                              ; 3be4: a9 cf
    sta object_erase_type + objectid_balloon1_rope                    ; 3be6: 8d b0 38
    lda #$c0                                                          ; 3be9: a9 c0
    sta object_z_order + objectid_balloon1_rope                       ; 3beb: 8d c6 38
    lda #$bf                                                          ; 3bee: a9 bf
    sta object_z_order + objectid_balloon1                            ; 3bf0: 8d c5 38
    lda #spriteid_table                                               ; 3bf3: a9 ce
    sta object_spriteid + objectid_table                              ; 3bf5: 8d ad 09
c3bf8
    jmp update_balloon_bursting                                       ; 3bf8: 4c 86 3c

return2_local
    jmp return2                                                       ; 3bfb: 4c 00 3d

update_table_not_first_update
    lda save_game_level_g_dropped_table_progress                      ; 3bfe: ad 18 0a
    bmi return2_local                                                 ; 3c01: 30 f8
    cmp #9                                                            ; 3c03: c9 09
    bcs continue_dropping_table                                       ; 3c05: b0 2e
    cmp #1                                                            ; 3c07: c9 01
    beq start_dropping_table                                          ; 3c09: f0 25
    lda desired_room_index                                            ; 3c0b: a5 30
    cmp #2                                                            ; 3c0d: c9 02
    bne return2_local                                                 ; 3c0f: d0 ea
; check for arrow colliding with balloon
    ldx #objectid_arrow                                               ; 3c11: a2 02
    ldy #objectid_balloon1                                            ; 3c13: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 3c15: 20 e2 28
    beq return2_local                                                 ; 3c18: f0 e1
    inc save_game_level_g_dropped_table_progress                      ; 3c1a: ee 18 0a
    lda #0                                                            ; 3c1d: a9 00
    ldx #<sound1                                                      ; 3c1f: a2 3f
    ldy #>sound1                                                      ; 3c21: a0 45
    jsr play_sound_yx                                                 ; 3c23: 20 f6 38
    ldx #<sound2                                                      ; 3c26: a2 37
    ldy #>sound2                                                      ; 3c28: a0 45
    jsr play_sound_yx                                                 ; 3c2a: 20 f6 38
    jmp update_balloon_bursting                                       ; 3c2d: 4c 86 3c

start_dropping_table
    lda #9                                                            ; 3c30: a9 09
    sta save_game_level_g_dropped_table_progress                      ; 3c32: 8d 18 0a
continue_dropping_table
    ldy save_game_level_g_dropped_table_progress                      ; 3c35: ac 18 0a
    sty dropped_table_y                                               ; 3c38: 8c 01 3d
    cpy #$12                                                          ; 3c3b: c0 12
    bcc table_dropping_in_progress                                    ; 3c3d: 90 08
; finished dropping table
    lda #$ff                                                          ; 3c3f: a9 ff
    sta save_game_level_g_dropped_table_progress                      ; 3c41: 8d 18 0a
    jmp update_balloon_bursting                                       ; 3c44: 4c 86 3c

table_dropping_in_progress
    iny                                                               ; 3c47: c8
    sty save_game_level_g_dropped_table_progress                      ; 3c48: 8c 18 0a
    cpy #$12                                                          ; 3c4b: c0 12
    bcc write_fallen_table_to_collision_map                           ; 3c4d: 90 16
; are we in room 2? branch if not
    lda desired_room_index                                            ; 3c4f: a5 30
    cmp #2                                                            ; 3c51: c9 02
    bne write_fallen_table_to_collision_map                           ; 3c53: d0 10
; play table landing sounds
    lda #0                                                            ; 3c55: a9 00
    ldx #<sound3                                                      ; 3c57: a2 21
    ldy #>sound3                                                      ; 3c59: a0 45
    jsr play_sound_yx                                                 ; 3c5b: 20 f6 38
    ldx #<sound4                                                      ; 3c5e: a2 19
    ldy #>sound4                                                      ; 3c60: a0 45
    jsr play_sound_yx                                                 ; 3c62: 20 f6 38
write_fallen_table_to_collision_map
    lda desired_room_index                                            ; 3c65: a5 30
    cmp #2                                                            ; 3c67: c9 02
    bne return2_local                                                 ; 3c69: d0 90
    ldx #$1a                                                          ; 3c6b: a2 1a
    ldy dropped_table_y                                               ; 3c6d: ac 01 3d
    lda #3                                                            ; 3c70: a9 03
    sta width_in_cells                                                ; 3c72: 85 3c
    lda #2                                                            ; 3c74: a9 02
    sta height_in_cells                                               ; 3c76: 85 3d
    lda #collision_map_none                                           ; 3c78: a9 00
    sta value_to_write_to_collision_map                               ; 3c7a: 85 3e
; read collision map and skip if already written
    jsr read_collision_map_value_for_xy                               ; 3c7c: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3c7f: c5 3e
    beq update_balloon_bursting                                       ; 3c81: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3c83: 20 44 1e
update_balloon_bursting
    lda desired_room_index                                            ; 3c86: a5 30
    cmp #2                                                            ; 3c88: c9 02
    bne return2                                                       ; 3c8a: d0 74
    lda save_game_level_g_dropped_table_progress                      ; 3c8c: ad 18 0a
    bmi end_of_table_falling                                          ; 3c8f: 30 34
    cmp #9                                                            ; 3c91: c9 09
    bcs end_of_balloon                                                ; 3c93: b0 22
    cmp #1                                                            ; 3c95: c9 01
    beq burst_the_balloon                                             ; 3c97: f0 0f
    lda #spriteid_balloon                                             ; 3c99: a9 c8
    sta object_spriteid + objectid_balloon1                           ; 3c9b: 8d ab 09
    lda #spriteid_rope_bottom                                         ; 3c9e: a9 d0
    sta object_spriteid + objectid_balloon1_rope                      ; 3ca0: 8d ac 09
    ldy #9                                                            ; 3ca3: a0 09
    jmp update_table_and_rope_objects                                 ; 3ca5: 4c d1 3c

burst_the_balloon
    lda #spriteid_burst_balloon                                       ; 3ca8: a9 d3
    sta object_spriteid + objectid_balloon1                           ; 3caa: 8d ab 09
    lda #spriteid_rope_top                                            ; 3cad: a9 d1
    sta object_spriteid + objectid_balloon1_rope                      ; 3caf: 8d ac 09
    ldy #9                                                            ; 3cb2: a0 09
    jmp update_table_and_rope_objects                                 ; 3cb4: 4c d1 3c

end_of_balloon
    tay                                                               ; 3cb7: a8
    lda #spriteid_one_pixel_masked_out                                ; 3cb8: a9 00
    sta object_spriteid + objectid_balloon1                           ; 3cba: 8d ab 09
    lda #spriteid_rope_top                                            ; 3cbd: a9 d1
    sta object_spriteid + objectid_balloon1_rope                      ; 3cbf: 8d ac 09
    jmp update_table_and_rope_objects                                 ; 3cc2: 4c d1 3c

end_of_table_falling
    lda #spriteid_one_pixel_masked_out                                ; 3cc5: a9 00
    sta object_spriteid + objectid_balloon1                           ; 3cc7: 8d ab 09
    lda #spriteid_rope_top_broken                                     ; 3cca: a9 d2
    sta object_spriteid + objectid_balloon1_rope                      ; 3ccc: 8d ac 09
    ldy #$12                                                          ; 3ccf: a0 12
update_table_and_rope_objects
    ldx #$1a                                                          ; 3cd1: a2 1a
    lda #objectid_table                                               ; 3cd3: a9 05
    jsr set_object_position_from_cell_xy                              ; 3cd5: 20 5d 1f
    lda #objectid_balloon1_rope                                       ; 3cd8: a9 04
    jsr set_object_position_from_cell_xy                              ; 3cda: 20 5d 1f
    lda #8                                                            ; 3cdd: a9 08
    sta temp_sprite_x_offset                                          ; 3cdf: 85 3a
    lda #$f4                                                          ; 3ce1: a9 f4
    sta temp_sprite_y_offset                                          ; 3ce3: 85 3b
    lda #3                                                            ; 3ce5: a9 03
    jsr set_object_position_from_cell_xy                              ; 3ce7: 20 5d 1f
    lda #3                                                            ; 3cea: a9 03
    sta width_in_cells                                                ; 3cec: 85 3c
    lda #2                                                            ; 3cee: a9 02
    sta height_in_cells                                               ; 3cf0: 85 3d
    lda #collision_map_solid_rock                                     ; 3cf2: a9 03
    sta value_to_write_to_collision_map                               ; 3cf4: 85 3e
    jsr read_collision_map_value_for_xy                               ; 3cf6: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3cf9: c5 3e
    beq return2                                                       ; 3cfb: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3cfd: 20 44 1e
return2
    rts                                                               ; 3d00: 60

dropped_table_y
    !byte 0                                                           ; 3d01: 00
; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 20                                                          ; 3d02: 14                      ; initial player X cell
    !byte 22                                                          ; 3d03: 16                      ; initial player Y cell

; ########################################
; ########################################
; ###   |         |                    ###
; ###   |         |                    ###
; ###   |         |                    ###
; ###   |         |                    ###
; ###   |         |                    ###
; ###   |         |                    ###
; ###   |         |   ####################
; ###   |         |   ####################
; ###   |                     |        ###
; ###   |                     |        ###
; ###   |                     |        ###
; ###                         |        ###
; ###                         |        ###
; ########       ##########   |   ########
; ########       ##########   |   ########
;                             |        ###
;                             |        ###
;                             |        ###
;                                      ###
;                     P                ###
; ########################################
; ########################################
; set ground fill tile to use
room_3_code
    lda #<ground_fill_2x2_top_left                                    ; 3d04: a9 89
    sta source_sprite_memory_low                                      ; 3d06: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3d08: a9 45
    sta source_sprite_memory_high                                     ; 3d0a: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3d0c: a2 00
    ldy #0                                                            ; 3d0e: a0 00
    lda #$ff                                                          ; 3d10: a9 ff
    sta width_in_cells                                                ; 3d12: 85 3c
    lda #2                                                            ; 3d14: a9 02
    sta height_in_cells                                               ; 3d16: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d18: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3d1b: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3d1d: 20 bb 1a
; draw 3x15 rectangle at (0,2)
    ldy #2                                                            ; 3d20: a0 02
    lda #3                                                            ; 3d22: a9 03
    sta width_in_cells                                                ; 3d24: 85 3c
    lda #$0f                                                          ; 3d26: a9 0f
    sta height_in_cells                                               ; 3d28: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d2a: 20 bb 1a
; draw 3x20 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3d2d: a2 25
    lda #$14                                                          ; 3d2f: a9 14
    sta height_in_cells                                               ; 3d31: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d33: 20 bb 1a
; draw 17x2 rectangle at (20,8)
    ldx #$14                                                          ; 3d36: a2 14
    ldy #8                                                            ; 3d38: a0 08
    lda #$11                                                          ; 3d3a: a9 11
    sta width_in_cells                                                ; 3d3c: 85 3c
    lda #2                                                            ; 3d3e: a9 02
    sta height_in_cells                                               ; 3d40: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d42: 20 bb 1a
; draw 5x2 rectangle at (3,15)
    ldx #3                                                            ; 3d45: a2 03
    ldy #$0f                                                          ; 3d47: a0 0f
    lda #5                                                            ; 3d49: a9 05
    sta width_in_cells                                                ; 3d4b: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3d4d: 20 bb 1a
; draw 5x2 rectangle at (32,15)
    ldx #$20 ; ' '                                                    ; 3d50: a2 20
    jsr copy_rectangle_of_memory_to_screen                            ; 3d52: 20 bb 1a
; draw 10x2 rectangle at (15,15)
    ldx #$0f                                                          ; 3d55: a2 0f
    lda #$0a                                                          ; 3d57: a9 0a
    sta width_in_cells                                                ; 3d59: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3d5b: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3d5e: 20 90 1b
; draw rope at (6,2) length 11
    ldx #6                                                            ; 3d61: a2 06
    ldy #2                                                            ; 3d63: a0 02
    lda #$0b                                                          ; 3d65: a9 0b
    jsr draw_rope                                                     ; 3d67: 20 b9 1d
; draw rope at (16,2) length 8
    ldx #$10                                                          ; 3d6a: a2 10
    lda #8                                                            ; 3d6c: a9 08
    jsr draw_rope                                                     ; 3d6e: 20 b9 1d
; draw rope at (28,10) length 10
    ldx #$1c                                                          ; 3d71: a2 1c
    ldy #$0a                                                          ; 3d73: a0 0a
    lda #$0a                                                          ; 3d75: a9 0a
    jsr draw_rope                                                     ; 3d77: 20 b9 1d
    jsr start_room                                                    ; 3d7a: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 3d7d: 20 da 12
    and #exit_room_left                                               ; 3d80: 29 01
    beq room_3_game_update_loop                                       ; 3d82: f0 f9
    ldx #2                                                            ; 3d84: a2 02
    ldy current_level                                                 ; 3d86: a4 31
    jmp initialise_level_and_room                                     ; 3d88: 4c 40 11

baby_spriteids
    !byte 0                                                           ; 3d8b: 00
    !byte spriteid_baby                                               ; 3d8c: d4
    !byte 0, 0                                                        ; 3d8d: 00 00
    !byte spriteid_baby_smile                                         ; 3d8f: d9
    !byte 0                                                           ; 3d90: 00
    !byte spriteid_baby_smile                                         ; 3d91: d9
    !byte 0                                                           ; 3d92: 00
    !byte spriteid_baby_smile                                         ; 3d93: d9
    !byte 0                                                           ; 3d94: 00
    !byte spriteid_baby_smile                                         ; 3d95: d9
    !byte 0                                                           ; 3d96: 00
    !byte spriteid_baby_smile                                         ; 3d97: d9
    !byte 0                                                           ; 3d98: 00
    !byte spriteid_baby_smile                                         ; 3d99: d9
    !byte 0                                                           ; 3d9a: 00
    !byte spriteid_baby_smile                                         ; 3d9b: d9
    !byte 0                                                           ; 3d9c: 00
    !byte spriteid_baby_smile                                         ; 3d9d: d9
    !byte 0, 0                                                        ; 3d9e: 00 00
    !byte spriteid_baby_surprise                                      ; 3da0: d5
    !byte 0, 0                                                        ; 3da1: 00 00
    !byte spriteid_baby_fall                                          ; 3da3: d6
    !byte 8, 0                                                        ; 3da4: 08 00
    !byte spriteid_baby_dead                                          ; 3da6: d7
    !byte 0, 0                                                        ; 3da7: 00 00

room_3_update_handler
    lda #3                                                            ; 3da9: a9 03
    sta currently_updating_logic_for_room_index                       ; 3dab: 8d ba 1a
    lda #6                                                            ; 3dae: a9 06
    ldx #$22 ; '"'                                                    ; 3db0: a2 22
    ldy #8                                                            ; 3db2: a0 08
    jsr update_level_completion                                       ; 3db4: 20 10 1a
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 3db7: ad 2b 13
    beq c3def                                                         ; 3dba: f0 33
; check for level change (branch if not)
    lda current_level                                                 ; 3dbc: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3dbe: c5 51
    beq c3dd5                                                         ; 3dc0: f0 13
    ldy #1                                                            ; 3dc2: a0 01
    lda save_game_level_g_baby_progress                               ; 3dc4: ad 19 0a
    beq c3dcf                                                         ; 3dc7: f0 06
    cmp #1                                                            ; 3dc9: c9 01
    beq c3dcf                                                         ; 3dcb: f0 02
    ldy #$1b                                                          ; 3dcd: a0 1b
c3dcf
    sty save_game_level_g_baby_progress                               ; 3dcf: 8c 19 0a
    sty room_3_baby_progress                                          ; 3dd2: 8c 79 0a
c3dd5
    lda desired_room_index                                            ; 3dd5: a5 30
    cmp #3                                                            ; 3dd7: c9 03
    bne c3dec                                                         ; 3dd9: d0 11
    ldx #<envelope3                                                   ; 3ddb: a2 47
    ldy #>envelope3                                                   ; 3ddd: a0 45
    jsr define_envelope                                               ; 3ddf: 20 5e 39
    lda #spriteid_cache2                                              ; 3de2: a9 cf
    sta object_erase_type + objectid_baby                             ; 3de4: 8d b1 38
    lda #$58 ; 'X'                                                    ; 3de7: a9 58
    sta object_x_low + objectid_baby                                  ; 3de9: 8d 55 09
c3dec
    jmp c3eb5                                                         ; 3dec: 4c b5 3e

c3def
    lda room_3_baby_progress                                          ; 3def: ad 79 0a
    clc                                                               ; 3df2: 18
    adc #2                                                            ; 3df3: 69 02
    tay                                                               ; 3df5: a8
    lda baby_spriteids,y                                              ; 3df6: b9 8b 3d
    cmp #0                                                            ; 3df9: c9 00
    bne c3e00                                                         ; 3dfb: d0 03
    ldy save_game_level_g_baby_progress                               ; 3dfd: ac 19 0a
c3e00
    lda save_game_level_g_baby_progress                               ; 3e00: ad 19 0a
    cmp #1                                                            ; 3e03: c9 01
    beq c3e0e                                                         ; 3e05: f0 07
    cmp #$18                                                          ; 3e07: c9 18
    beq c3e6d                                                         ; 3e09: f0 62
    jmp c3e92                                                         ; 3e0b: 4c 92 3e

c3e0e
    lda desired_room_index                                            ; 3e0e: a5 30
    cmp #3                                                            ; 3e10: c9 03
    bne c3e47                                                         ; 3e12: d0 33
    ldx #objectid_baby                                                ; 3e14: a2 05
    sty l3f3c                                                         ; 3e16: 8c 3c 3f
    ldy #objectid_arrow                                               ; 3e19: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 3e1b: 20 e2 28
    ldy l3f3c                                                         ; 3e1e: ac 3c 3f
    ora #0                                                            ; 3e21: 09 00
    beq c3e47                                                         ; 3e23: f0 22
    lda #0                                                            ; 3e25: a9 00
    ldx #<sound5                                                      ; 3e27: a2 55
    ldy #>sound5                                                      ; 3e29: a0 45
    jsr play_sound_yx                                                 ; 3e2b: 20 f6 38
    lda #spriteid_one_pixel_masked_out                                ; 3e2e: a9 00
    sta object_spriteid + objectid_bow                                ; 3e30: 8d aa 09
    lda #$ff                                                          ; 3e33: a9 ff
    sta save_game_level_g_got_bow                                     ; 3e35: 8d 17 0a
    lda #$60 ; '`'                                                    ; 3e38: a9 60
    sta room_3_baby_y_position                                        ; 3e3a: 8d 7a 0a
    ldy #$15                                                          ; 3e3d: a0 15
    lda #$18                                                          ; 3e3f: a9 18
    sta save_game_level_g_baby_progress                               ; 3e41: 8d 19 0a
    jmp c3ea7                                                         ; 3e44: 4c a7 3e

c3e47
    lda desired_room_index                                            ; 3e47: a5 30
    cmp #3                                                            ; 3e49: c9 03
    bne c3ea7                                                         ; 3e4b: d0 5a
    lda #8                                                            ; 3e4d: a9 08
    sta temp_top_offset                                               ; 3e4f: 8d 50 25
    ldx #objectid_baby                                                ; 3e52: a2 05
    sty l3f3c                                                         ; 3e54: 8c 3c 3f
    ldy #objectid_player                                              ; 3e57: a0 00
    jsr test_for_collision_between_objects_x_and_y                    ; 3e59: 20 e2 28
    ldy l3f3c                                                         ; 3e5c: ac 3c 3f
    ora #0                                                            ; 3e5f: 09 00
    beq c3ea7                                                         ; 3e61: f0 44
    lda #6                                                            ; 3e63: a9 06
    sta player_wall_collision_reaction_speed                          ; 3e65: 8d 33 24
    ldy #4                                                            ; 3e68: a0 04
    jmp c3ea7                                                         ; 3e6a: 4c a7 3e

c3e6d
    lda room_3_baby_y_position                                        ; 3e6d: ad 7a 0a
    cmp #$98                                                          ; 3e70: c9 98
    bcc c3ea7                                                         ; 3e72: 90 33
    lda desired_room_index                                            ; 3e74: a5 30
    cmp #3                                                            ; 3e76: c9 03
    bne c3e8a                                                         ; 3e78: d0 10
    lda #$40 ; '@'                                                    ; 3e7a: a9 40
    ldx #<sound3                                                      ; 3e7c: a2 21
    ldy #>sound3                                                      ; 3e7e: a0 45
    jsr play_sound_yx                                                 ; 3e80: 20 f6 38
    ldx #<sound4                                                      ; 3e83: a2 19
    ldy #>sound4                                                      ; 3e85: a0 45
    jsr play_sound_yx                                                 ; 3e87: 20 f6 38
c3e8a
    ldy #$1b                                                          ; 3e8a: a0 1b
    sty save_game_level_g_baby_progress                               ; 3e8c: 8c 19 0a
    jmp c3ea7                                                         ; 3e8f: 4c a7 3e

c3e92
    lda desired_room_index                                            ; 3e92: a5 30
    cmp #3                                                            ; 3e94: c9 03
    bne c3ea7                                                         ; 3e96: d0 0f
    lda sound_priority_per_channel_table                              ; 3e98: ad 6f 39
    cmp #$41 ; 'A'                                                    ; 3e9b: c9 41
    bcs c3ea7                                                         ; 3e9d: b0 08
    lda #0                                                            ; 3e9f: a9 00
    sta sound_priority_per_channel_table                              ; 3ea1: 8d 6f 39
    sta sound_priority_per_channel_table+1                            ; 3ea4: 8d 70 39
c3ea7
    sty room_3_baby_progress                                          ; 3ea7: 8c 79 0a
    iny                                                               ; 3eaa: c8
    lda baby_spriteids,y                                              ; 3eab: b9 8b 3d
    clc                                                               ; 3eae: 18
    adc room_3_baby_y_position                                        ; 3eaf: 6d 7a 0a
    sta room_3_baby_y_position                                        ; 3eb2: 8d 7a 0a
c3eb5
    lda desired_room_index                                            ; 3eb5: a5 30
    cmp #3                                                            ; 3eb7: c9 03
    bne c3f0c                                                         ; 3eb9: d0 51
    ldy room_3_baby_progress                                          ; 3ebb: ac 79 0a
    lda baby_spriteids,y                                              ; 3ebe: b9 8b 3d
    sta object_spriteid + objectid_baby                               ; 3ec1: 8d ad 09
    lda save_game_level_g_baby_progress                               ; 3ec4: ad 19 0a
    cmp #$1b                                                          ; 3ec7: c9 1b
    beq c3ee8                                                         ; 3ec9: f0 1d
    lda #$a0                                                          ; 3ecb: a9 a0
    sta object_z_order + objectid_baby                                ; 3ecd: 8d c7 38
    lda save_game_level_g_baby_progress                               ; 3ed0: ad 19 0a
    cmp #1                                                            ; 3ed3: c9 01
    bne c3edf                                                         ; 3ed5: d0 08
    lda #$60 ; '`'                                                    ; 3ed7: a9 60
    sta object_y_low + objectid_baby                                  ; 3ed9: 8d 81 09
    jmp c3f0c                                                         ; 3edc: 4c 0c 3f

c3edf
    lda room_3_baby_y_position                                        ; 3edf: ad 7a 0a
    sta object_y_low + objectid_baby                                  ; 3ee2: 8d 81 09
    jmp c3f0c                                                         ; 3ee5: 4c 0c 3f

c3ee8
    lda #$e0                                                          ; 3ee8: a9 e0
    sta object_z_order + objectid_baby                                ; 3eea: 8d c7 38
    lda #$b0                                                          ; 3eed: a9 b0
    sta object_y_low + objectid_baby                                  ; 3eef: 8d 81 09
    ldx #9                                                            ; 3ef2: a2 09
    ldy #$15                                                          ; 3ef4: a0 15
    lda #3                                                            ; 3ef6: a9 03
    sta width_in_cells                                                ; 3ef8: 85 3c
    lda #1                                                            ; 3efa: a9 01
    sta height_in_cells                                               ; 3efc: 85 3d
    lda #collision_map_solid_rock                                     ; 3efe: a9 03
    sta value_to_write_to_collision_map                               ; 3f00: 85 3e
    jsr read_collision_map_value_for_xy                               ; 3f02: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3f05: c5 3e
    beq c3f0c                                                         ; 3f07: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3f09: 20 44 1e
c3f0c
    lda #3                                                            ; 3f0c: a9 03
    sta currently_updating_logic_for_room_index                       ; 3f0e: 8d ba 1a
    lda #3                                                            ; 3f11: a9 03
    sta l44ab                                                         ; 3f13: 8d ab 44
    lda #4                                                            ; 3f16: a9 04
    sta l44ac                                                         ; 3f18: 8d ac 44
    ldy #$60 ; '`'                                                    ; 3f1b: a0 60
    lda save_game_level_g_baby_progress                               ; 3f1d: ad 19 0a
    cmp #1                                                            ; 3f20: c9 01
    beq c3f2d                                                         ; 3f22: f0 09
    lda room_3_baby_progress                                          ; 3f24: ad 79 0a
    cmp #$15                                                          ; 3f27: c9 15
    beq c3f2d                                                         ; 3f29: f0 02
    ldy #$20 ; ' '                                                    ; 3f2b: a0 20
c3f2d
    sty l44aa                                                         ; 3f2d: 8c aa 44
    ldx #$0b                                                          ; 3f30: a2 0b
    ldy room_3_balloon_y_position                                     ; 3f32: ac 77 0a
    jsr sub_c4366                                                     ; 3f35: 20 66 43
    sty room_3_balloon_y_position                                     ; 3f38: 8c 77 0a
    rts                                                               ; 3f3b: 60

l3f3c
    !byte 0                                                           ; 3f3c: 00
; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 20                                                          ; 3f3d: 14                      ; initial player X cell
    !byte 22                                                          ; 3f3e: 16                      ; initial player Y cell

; ########################################
; ########################################
; ###              |               |   ###
; ###              |               |   ###
; ###              |               |   ###
; ###              |               |   ###
; ###OOO           |               |   ###
; ###OOO           |               |   ###
; ##############   |        ####   |   ###
; ##############   |        ####   |   ###
; ###   |          |               |   ###
; ###   |          |               |   ###
; ###   |          |               |   ###
; ###   |          |                   ###
; ###   |          |                   ###
; ###   |   ####            ##############
; ###   |   ####            ##############
; ###   |
; ###   |
; ###   |
; ###
; ###                 P
; ########################################
; ########################################
; set ground fill tile to use
room_0_code
    lda #<ground_fill_2x2_top_left                                    ; 3f3f: a9 89
    sta source_sprite_memory_low                                      ; 3f41: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3f43: a9 45
    sta source_sprite_memory_high                                     ; 3f45: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3f47: a2 00
    ldy #0                                                            ; 3f49: a0 00
    lda #$ff                                                          ; 3f4b: a9 ff
    sta width_in_cells                                                ; 3f4d: 85 3c
    lda #2                                                            ; 3f4f: a9 02
    sta height_in_cells                                               ; 3f51: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f53: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3f56: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3f58: 20 bb 1a
; draw 3x20 rectangle at (0,2)
    ldy #2                                                            ; 3f5b: a0 02
    lda #3                                                            ; 3f5d: a9 03
    sta width_in_cells                                                ; 3f5f: 85 3c
    lda #$14                                                          ; 3f61: a9 14
    sta height_in_cells                                               ; 3f63: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f65: 20 bb 1a
; draw 3x15 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3f68: a2 25
    lda #$0f                                                          ; 3f6a: a9 0f
    sta height_in_cells                                               ; 3f6c: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f6e: 20 bb 1a
; draw 11x2 rectangle at (3,8)
    ldx #3                                                            ; 3f71: a2 03
    ldy #8                                                            ; 3f73: a0 08
    lda #$0b                                                          ; 3f75: a9 0b
    sta width_in_cells                                                ; 3f77: 85 3c
    lda #2                                                            ; 3f79: a9 02
    sta height_in_cells                                               ; 3f7b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f7d: 20 bb 1a
; draw 11x2 rectangle at (26,15)
    ldx #$1a                                                          ; 3f80: a2 1a
    ldy #$0f                                                          ; 3f82: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3f84: 20 bb 1a
; draw 4x2 rectangle at (10,15)
    ldx #$0a                                                          ; 3f87: a2 0a
    lda #4                                                            ; 3f89: a9 04
    sta width_in_cells                                                ; 3f8b: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3f8d: 20 bb 1a
; draw 4x2 rectangle at (26,8)
    ldx #$1a                                                          ; 3f90: a2 1a
    ldy #8                                                            ; 3f92: a0 08
    jsr copy_rectangle_of_memory_to_screen                            ; 3f94: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3f97: 20 90 1b
; draw table at (3,6) of size (3x2)
    lda #3                                                            ; 3f9a: a9 03
    sta width_in_cells                                                ; 3f9c: 85 3c
    lda #2                                                            ; 3f9e: a9 02
    sta height_in_cells                                               ; 3fa0: 85 3d
    ldx #3                                                            ; 3fa2: a2 03
    ldy #6                                                            ; 3fa4: a0 06
    lda #spriteid_table                                               ; 3fa6: a9 ce
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3fa8: 20 57 1f
; draw rope at (6,10) length 10
    ldx #6                                                            ; 3fab: a2 06
    ldy #$0a                                                          ; 3fad: a0 0a
    lda #$0a                                                          ; 3faf: a9 0a
    jsr draw_rope                                                     ; 3fb1: 20 b9 1d
; draw rope at (17,2) length 13
    ldx #$11                                                          ; 3fb4: a2 11
    ldy #2                                                            ; 3fb6: a0 02
    lda #$0d                                                          ; 3fb8: a9 0d
    jsr draw_rope                                                     ; 3fba: 20 b9 1d
; draw rope at (33,2) length 11
    ldx #$21 ; '!'                                                    ; 3fbd: a2 21
    ldy #2                                                            ; 3fbf: a0 02
    lda #$0b                                                          ; 3fc1: a9 0b
    jsr draw_rope                                                     ; 3fc3: 20 b9 1d
    jsr start_room                                                    ; 3fc6: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 3fc9: 20 da 12
    and #exit_room_right                                              ; 3fcc: 29 04
    beq room_0_game_update_loop                                       ; 3fce: f0 f9
    ldx #1                                                            ; 3fd0: a2 01
    ldy current_level                                                 ; 3fd2: a4 31
    jmp initialise_level_and_room                                     ; 3fd4: 4c 40 11

room_0_update_handler
    lda #0                                                            ; 3fd7: a9 00
    sta currently_updating_logic_for_room_index                       ; 3fd9: 8d ba 1a
    lda #3                                                            ; 3fdc: a9 03
    ldx #$25 ; '%'                                                    ; 3fde: a2 25
    ldy #$0d                                                          ; 3fe0: a0 0d
    lda #5                                                            ; 3fe2: a9 05
    sta l44ab                                                         ; 3fe4: 8d ab 44
    lda #6                                                            ; 3fe7: a9 06
    sta l44ac                                                         ; 3fe9: 8d ac 44
    lda #$20 ; ' '                                                    ; 3fec: a9 20
    sta l44aa                                                         ; 3fee: 8d aa 44
    ldx #$16                                                          ; 3ff1: a2 16
    ldy room_0_balloon_y_position                                     ; 3ff3: ac 78 0a
    jsr sub_c4366                                                     ; 3ff6: 20 66 43
    sty room_0_balloon_y_position                                     ; 3ff9: 8c 78 0a
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 3ffc: ad 2b 13
    bne c4004                                                         ; 3fff: d0 03
    jmp c4091                                                         ; 4001: 4c 91 40

c4004
    lda #spriteid_bow_menu_item                                       ; 4004: a9 cb
    sta toolbar_collectable_spriteids+1                               ; 4006: 8d e9 2e
    lda #spriteid_bow                                                 ; 4009: a9 ca
    sta collectable_spriteids+1                                       ; 400b: 8d ee 2e
    sta collectable_being_used_spriteids + 1                          ; 400e: 8d f3 2e
    ldx #<envelope4                                                   ; 4011: a2 f5
    ldy #>envelope4                                                   ; 4013: a0 44
    jsr define_envelope                                               ; 4015: 20 5e 39
    ldx #<envelope5                                                   ; 4018: a2 5d
    ldy #>envelope5                                                   ; 401a: a0 45
    jsr define_envelope                                               ; 401c: 20 5e 39
    ldx #<envelope6                                                   ; 401f: a2 73
    ldy #>envelope6                                                   ; 4021: a0 45
    jsr define_envelope                                               ; 4023: 20 5e 39
; check for level change (branch if not)
    lda current_level                                                 ; 4026: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 4028: c5 51
    beq c4036                                                         ; 402a: f0 0a
    lda save_game_level_g_got_bow                                     ; 402c: ad 17 0a
    beq c4036                                                         ; 402f: f0 05
    lda #$ff                                                          ; 4031: a9 ff
    sta save_game_level_g_got_bow                                     ; 4033: 8d 17 0a
c4036
    lda #spriteid_cache1                                              ; 4036: a9 cd
    sta object_erase_type + objectid_bow                              ; 4038: 8d ae 38
    lda #0                                                            ; 403b: a9 00
    sta object_y_high + objectid_bow                                  ; 403d: 8d 94 09
    lda save_game_level_g_got_bow                                     ; 4040: ad 17 0a
    bne c405e                                                         ; 4043: d0 19
    lda desired_room_index                                            ; 4045: a5 30
    cmp #0                                                            ; 4047: c9 00
    bne return3                                                       ; 4049: d0 12
    ldx #4                                                            ; 404b: a2 04
    ldy #5                                                            ; 404d: a0 05
    lda #$ff                                                          ; 404f: a9 ff
    sta temp_sprite_y_offset                                          ; 4051: 85 3b
    lda #2                                                            ; 4053: a9 02
    jsr set_object_position_from_cell_xy                              ; 4055: 20 5d 1f
    lda #spriteid_bow                                                 ; 4058: a9 ca
    sta object_spriteid + objectid_bow                                ; 405a: 8d aa 09
return3
    rts                                                               ; 405d: 60

c405e
    cmp #$ff                                                          ; 405e: c9 ff
    beq c4086                                                         ; 4060: f0 24
    lda desired_room_index                                            ; 4062: a5 30
    cmp arrow_room                                                    ; 4064: cd 73 0a
    bne c4086                                                         ; 4067: d0 1d
    jsr set_arrow_object                                              ; 4069: 20 59 42
loop_c406c
    lda desired_room_index                                            ; 406c: a5 30
    cmp arrow_room                                                    ; 406e: cd 73 0a
    bne c4086                                                         ; 4071: d0 13
    lda arrow_active_flag                                             ; 4073: ad 74 0a
    beq c4086                                                         ; 4076: f0 0e
    dec arrow_active_flag                                             ; 4078: ce 74 0a
    ldx #2                                                            ; 407b: a2 02
    jsr copy_object_state_to_old                                      ; 407d: 20 f7 20
    jsr sub_c418a                                                     ; 4080: 20 8a 41
    jmp loop_c406c                                                    ; 4083: 4c 6c 40

c4086
    lda #spriteid_one_pixel_masked_out                                ; 4086: a9 00
    sta object_spriteid_old + objectid_bow                            ; 4088: 8d b5 09
c408b
    jmp return4                                                       ; 408b: 4c 86 41

c408e
    jmp c417e                                                         ; 408e: 4c 7e 41

c4091
    lda save_game_level_g_got_bow                                     ; 4091: ad 17 0a
    bne c40b5                                                         ; 4094: d0 1f
    lda desired_room_index                                            ; 4096: a5 30
    cmp #0                                                            ; 4098: c9 00
    bne c408b                                                         ; 409a: d0 ef
    ldx #objectid_old_player                                          ; 409c: a2 0b
    ldy #objectid_bow                                                 ; 409e: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 40a0: 20 e2 28
    beq c408b                                                         ; 40a3: f0 e6
    lda #spriteid_bow_menu_item                                       ; 40a5: a9 cb
    jsr find_or_create_menu_slot_for_A                                ; 40a7: 20 bd 2b
    lda #spriteid_one_pixel_masked_out                                ; 40aa: a9 00
    sta object_spriteid + objectid_bow                                ; 40ac: 8d aa 09
    dec save_game_level_g_got_bow                                     ; 40af: ce 17 0a
    jmp return4                                                       ; 40b2: 4c 86 41

c40b5
    lda #0                                                            ; 40b5: a9 00
    sta l4188                                                         ; 40b7: 8d 88 41
    lda object_spriteid_old + objectid_bow                            ; 40ba: ad b5 09
    sta l4189                                                         ; 40bd: 8d 89 41
    ldx #0                                                            ; 40c0: a2 00
    lda #spriteid_bow_menu_item                                       ; 40c2: a9 cb
    cmp player_using_object_spriteid                                  ; 40c4: cd b6 2e
    bne c40cf                                                         ; 40c7: d0 06
    cmp previous_player_using_object_spriteid                         ; 40c9: cd b7 2e
    beq c40cf                                                         ; 40cc: f0 01
    dex                                                               ; 40ce: ca
c40cf
    stx l4187                                                         ; 40cf: 8e 87 41
    lda save_game_level_g_got_bow                                     ; 40d2: ad 17 0a
    cmp #$ff                                                          ; 40d5: c9 ff
    beq c40ee                                                         ; 40d7: f0 15
    lda arrow_room                                                    ; 40d9: ad 73 0a
    cmp desired_room_index                                            ; 40dc: c5 30
    beq c4125                                                         ; 40de: f0 45
    lda arrow_active_flag                                             ; 40e0: ad 74 0a
    cmp #$0a                                                          ; 40e3: c9 0a
    bcc c408e                                                         ; 40e5: 90 a7
    lda l4187                                                         ; 40e7: ad 87 41
    beq c408e                                                         ; 40ea: f0 a2
    bne c40f3                                                         ; 40ec: d0 05
c40ee
    lda l4187                                                         ; 40ee: ad 87 41
    beq c408b                                                         ; 40f1: f0 98
c40f3
    dec l4188                                                         ; 40f3: ce 88 41
    lda #1                                                            ; 40f6: a9 01
    sta save_game_level_g_got_bow                                     ; 40f8: 8d 17 0a
    lda desired_room_index                                            ; 40fb: a5 30
    sta arrow_room                                                    ; 40fd: 8d 73 0a
    lda object_direction                                              ; 4100: ad be 09
    sta arrow_direction                                               ; 4103: 8d 6f 0a
    lda object_x_low + objectid_player_accessory                      ; 4106: ad 51 09
    sta arrow_x_position_low                                          ; 4109: 8d 70 0a
    lda object_x_high + objectid_player_accessory                     ; 410c: ad 67 09
    sta arrow_x_position_high                                         ; 410f: 8d 71 0a
    lda object_y_low + objectid_player_accessory                      ; 4112: ad 7d 09
    sta arrow_y_position_low                                          ; 4115: 8d 72 0a
    lda #0                                                            ; 4118: a9 00
    sta arrow_active_flag                                             ; 411a: 8d 74 0a
    jsr set_arrow_object                                              ; 411d: 20 59 42
    ldx #2                                                            ; 4120: a2 02
    jsr copy_object_state_to_old                                      ; 4122: 20 f7 20
c4125
    jsr sub_c418a                                                     ; 4125: 20 8a 41
    lda desired_room_index                                            ; 4128: a5 30
    cmp arrow_room                                                    ; 412a: cd 73 0a
    beq c4134                                                         ; 412d: f0 05
    lda #0                                                            ; 412f: a9 00
    sta arrow_active_flag                                             ; 4131: 8d 74 0a
c4134
    lda l4189                                                         ; 4134: ad 89 41
    sta object_spriteid_old + objectid_bow                            ; 4137: 8d b5 09
    ldx #objectid_old_player                                          ; 413a: a2 0b
    ldy #objectid_bow                                                 ; 413c: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 413e: 20 e2 28
    bne c4171                                                         ; 4141: d0 2e
    lda #2                                                            ; 4143: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4145: 20 94 28
    bne c4171                                                         ; 4148: d0 27
    lda l4188                                                         ; 414a: ad 88 41
    beq c416b                                                         ; 414d: f0 1c
    lda desired_room_index                                            ; 414f: a5 30
    cmp arrow_room                                                    ; 4151: cd 73 0a
    bne c415b                                                         ; 4154: d0 05
    lda object_spriteid + objectid_bow                                ; 4156: ad aa 09
    beq c416b                                                         ; 4159: f0 10
c415b
    lda #0                                                            ; 415b: a9 00
    ldx #<sound6                                                      ; 415d: a2 81
    ldy #>sound6                                                      ; 415f: a0 45
    jsr play_sound_yx                                                 ; 4161: 20 f6 38
    ldx #<sound7                                                      ; 4164: a2 6b
    ldy #>sound7                                                      ; 4166: a0 45
    jsr play_sound_yx                                                 ; 4168: 20 f6 38
c416b
    jsr sub_c4281                                                     ; 416b: 20 81 42
    jmp return4                                                       ; 416e: 4c 86 41

c4171
    lda #spriteid_one_pixel_masked_out                                ; 4171: a9 00
    sta object_spriteid + objectid_bow                                ; 4173: 8d aa 09
    lda #$ff                                                          ; 4176: a9 ff
    sta save_game_level_g_got_bow                                     ; 4178: 8d 17 0a
    jmp return4                                                       ; 417b: 4c 86 41

c417e
    lda arrow_active_flag                                             ; 417e: ad 74 0a
    bmi return4                                                       ; 4181: 30 03
    inc arrow_active_flag                                             ; 4183: ee 74 0a
return4
    rts                                                               ; 4186: 60

l4187
    !byte 0                                                           ; 4187: 00
l4188
    !byte 0                                                           ; 4188: 00
l4189
    !byte 0                                                           ; 4189: 00

sub_c418a
    lda #1                                                            ; 418a: a9 01
    sta temp_bottom_offset                                            ; 418c: 8d 51 25
    dec temp_left_offset                                              ; 418f: ce d0 24
    inc temp_right_offset                                             ; 4192: ee d1 24
    lda #2                                                            ; 4195: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4197: 20 94 28
    beq c41ac                                                         ; 419a: f0 10
    lda #spriteid_one_pixel_masked_out                                ; 419c: a9 00
    sta object_spriteid + objectid_arrow                              ; 419e: 8d aa 09
    sta arrow_active_flag                                             ; 41a1: 8d 74 0a
    lda #$ff                                                          ; 41a4: a9 ff
    sta save_game_level_g_got_bow                                     ; 41a6: 8d 17 0a
    jmp return5                                                       ; 41a9: 4c 58 42

c41ac
    lda #8                                                            ; 41ac: a9 08
    ldx arrow_direction                                               ; 41ae: ae 6f 0a
    bpl c41b8                                                         ; 41b1: 10 05
    eor #$ff                                                          ; 41b3: 49 ff
    clc                                                               ; 41b5: 18
    adc #1                                                            ; 41b6: 69 01
c41b8
    ldx #0                                                            ; 41b8: a2 00
    ora #0                                                            ; 41ba: 09 00
    bpl c41bf                                                         ; 41bc: 10 01
    dex                                                               ; 41be: ca
c41bf
    clc                                                               ; 41bf: 18
    adc arrow_x_position_low                                          ; 41c0: 6d 70 0a
    sta arrow_x_position_low                                          ; 41c3: 8d 70 0a
    txa                                                               ; 41c6: 8a
    adc arrow_x_position_high                                         ; 41c7: 6d 71 0a
    sta arrow_x_position_high                                         ; 41ca: 8d 71 0a
    jsr set_arrow_object                                              ; 41cd: 20 59 42
    lda #objectid_arrow                                               ; 41d0: a9 02
    jsr update_player_solid_rock_collision                            ; 41d2: 20 f5 25
    lda #2                                                            ; 41d5: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 41d7: 20 94 28
    beq c4206                                                         ; 41da: f0 2a
    lda arrow_direction                                               ; 41dc: ad 6f 0a
    bpl c41f5                                                         ; 41df: 10 14
    lda object_x_low + objectid_arrow                                 ; 41e1: ad 52 09
    clc                                                               ; 41e4: 18
    adc #8                                                            ; 41e5: 69 08
    sta object_x_low + objectid_arrow                                 ; 41e7: 8d 52 09
    lda object_x_high + objectid_arrow                                ; 41ea: ad 68 09
    adc #0                                                            ; 41ed: 69 00
    sta object_x_high + objectid_arrow                                ; 41ef: 8d 68 09
    jmp c4206                                                         ; 41f2: 4c 06 42

c41f5
    lda object_x_low + objectid_arrow                                 ; 41f5: ad 52 09
    sec                                                               ; 41f8: 38
    sbc #8                                                            ; 41f9: e9 08
    sta object_x_low + objectid_arrow                                 ; 41fb: 8d 52 09
    lda object_x_high + objectid_arrow                                ; 41fe: ad 68 09
    sbc #0                                                            ; 4201: e9 00
    sta object_x_high + objectid_arrow                                ; 4203: 8d 68 09
c4206
    lda object_x_low + objectid_arrow                                 ; 4206: ad 52 09
    sta arrow_x_position_low                                          ; 4209: 8d 70 0a
    lda object_x_high + objectid_arrow                                ; 420c: ad 68 09
    sta arrow_x_position_high                                         ; 420f: 8d 71 0a
    lda object_y_low + objectid_arrow                                 ; 4212: ad 7e 09
    sta arrow_y_position_low                                          ; 4215: 8d 72 0a
    ldx #2                                                            ; 4218: a2 02
    jsr find_left_and_right_of_object                                 ; 421a: 20 34 24
    lda arrow_direction                                               ; 421d: ad 6f 0a
    bmi c423e                                                         ; 4220: 30 1c
    lda object_left_cell_x                                            ; 4222: a5 78
    cmp #$28 ; '('                                                    ; 4224: c9 28
    bcc return5                                                       ; 4226: 90 30
    lda arrow_x_position_low                                          ; 4228: ad 70 0a
    sec                                                               ; 422b: 38
    sbc #$40 ; '@'                                                    ; 422c: e9 40
    sta arrow_x_position_low                                          ; 422e: 8d 70 0a
    lda #0                                                            ; 4231: a9 00
    sbc #0                                                            ; 4233: e9 00
    sta arrow_x_position_high                                         ; 4235: 8d 71 0a
    inc arrow_room                                                    ; 4238: ee 73 0a
    jmp c4253                                                         ; 423b: 4c 53 42

c423e
    lda object_right_cell_x                                           ; 423e: a5 79
    bpl return5                                                       ; 4240: 10 16
    lda arrow_x_position_low                                          ; 4242: ad 70 0a
    clc                                                               ; 4245: 18
    adc #$40 ; '@'                                                    ; 4246: 69 40
    sta arrow_x_position_low                                          ; 4248: 8d 70 0a
    lda #1                                                            ; 424b: a9 01
    sta arrow_x_position_high                                         ; 424d: 8d 71 0a
    dec arrow_room                                                    ; 4250: ce 73 0a
c4253
    lda #spriteid_one_pixel_masked_out                                ; 4253: a9 00
    sta object_spriteid + objectid_arrow                              ; 4255: 8d aa 09
return5
    rts                                                               ; 4258: 60

set_arrow_object
    lda arrow_x_position_low                                          ; 4259: ad 70 0a
    sta object_x_low + objectid_arrow                                 ; 425c: 8d 52 09
    lda arrow_x_position_high                                         ; 425f: ad 71 0a
    sta object_x_high + objectid_arrow                                ; 4262: 8d 68 09
    lda arrow_y_position_low                                          ; 4265: ad 72 0a
    sta object_y_low + objectid_arrow                                 ; 4268: 8d 7e 09
    lda #0                                                            ; 426b: a9 00
    sta object_y_high + objectid_arrow                                ; 426d: 8d 94 09
    lda arrow_direction                                               ; 4270: ad 6f 0a
    sta object_direction + objectid_arrow                             ; 4273: 8d c0 09
    lda #spriteid_arrow                                               ; 4276: a9 cc
    sta object_spriteid + objectid_arrow                              ; 4278: 8d aa 09
    lda #$40 ; '@'                                                    ; 427b: a9 40
    sta object_z_order + objectid_arrow                               ; 427d: 8d c4 38
    rts                                                               ; 4280: 60

sub_c4281
    lda desired_room_index                                            ; 4281: a5 30
    cmp arrow_room                                                    ; 4283: cd 73 0a
    bne return6                                                       ; 4286: d0 1b
    lda #1                                                            ; 4288: a9 01
    sta temp_bottom_offset                                            ; 428a: 8d 51 25
    inc temp_right_offset                                             ; 428d: ee d1 24
    dec temp_left_offset                                              ; 4290: ce d0 24
    lda #2                                                            ; 4293: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4295: 20 94 28
    beq return6                                                       ; 4298: f0 09
    lda #0                                                            ; 429a: a9 00
    ldx #<sound8                                                      ; 429c: a2 03
    ldy #>sound8                                                      ; 429e: a0 45
    jsr play_sound_yx                                                 ; 42a0: 20 f6 38
return6
    rts                                                               ; 42a3: 60

; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 26                                                          ; 42a4: 1a                      ; initial player X cell
    !byte 22                                                          ; 42a5: 16                      ; initial player Y cell

; ########################################
; ########################################
; ###   |        ###               |   ###
; ###   |        ###               |   ###
; ###   |        ###               |   ###
; ###   |        ###               |   ###
; ###   |        ###               |   ###
; ###   |        ###               |   ###
; ###   |        ###       #####   |   ###
; ###   |        ###       #####   |   ###
; ###   |        ###       ###     |   ###
; ###   |        ###       ###     |   ###
; ###   |                  ###     |   ###
; ###   |                  ###     |   ###
; ###   |                  ###     |   ###
; ###   |                  ###     |   ###
; ###   |                  ###     |   ###
;       |        ###               |
;       |        ###               |
;       |        ###               |
;                ###
;                ###        P
; ########################################
; ########################################
; set ground fill tile to use
room_1_code
    lda #<ground_fill_2x2_top_left                                    ; 42a6: a9 89
    sta source_sprite_memory_low                                      ; 42a8: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 42aa: a9 45
    sta source_sprite_memory_high                                     ; 42ac: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 42ae: a2 00
    ldy #0                                                            ; 42b0: a0 00
    lda #$ff                                                          ; 42b2: a9 ff
    sta width_in_cells                                                ; 42b4: 85 3c
    lda #2                                                            ; 42b6: a9 02
    sta height_in_cells                                               ; 42b8: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42ba: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 42bd: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 42bf: 20 bb 1a
; draw 3x15 rectangle at (0,2)
    ldy #2                                                            ; 42c2: a0 02
    lda #3                                                            ; 42c4: a9 03
    sta width_in_cells                                                ; 42c6: 85 3c
    lda #$0f                                                          ; 42c8: a9 0f
    sta height_in_cells                                               ; 42ca: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42cc: 20 bb 1a
; draw 3x15 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 42cf: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 42d1: 20 bb 1a
; draw 3x10 rectangle at (15,2)
    ldx #$0f                                                          ; 42d4: a2 0f
    lda #$0a                                                          ; 42d6: a9 0a
    sta height_in_cells                                               ; 42d8: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42da: 20 bb 1a
; draw 3x5 rectangle at (15,17)
    ldy #$11                                                          ; 42dd: a0 11
    lda #5                                                            ; 42df: a9 05
    sta height_in_cells                                               ; 42e1: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42e3: 20 bb 1a
; draw 3x9 rectangle at (25,8)
    ldx #$19                                                          ; 42e6: a2 19
    ldy #8                                                            ; 42e8: a0 08
    lda #9                                                            ; 42ea: a9 09
    sta height_in_cells                                               ; 42ec: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42ee: 20 bb 1a
; draw 2x2 rectangle at (28,8)
    ldx #$1c                                                          ; 42f1: a2 1c
    lda #2                                                            ; 42f3: a9 02
    sta width_in_cells                                                ; 42f5: 85 3c
    sta height_in_cells                                               ; 42f7: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42f9: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 42fc: 20 90 1b
; draw rope at (6,2) length 18
    ldx #6                                                            ; 42ff: a2 06
    ldy #2                                                            ; 4301: a0 02
    lda #$12                                                          ; 4303: a9 12
    jsr draw_rope                                                     ; 4305: 20 b9 1d
; draw rope at (33,2) length 18
    ldx #$21 ; '!'                                                    ; 4308: a2 21
    jsr draw_rope                                                     ; 430a: 20 b9 1d
    ldx #$0a                                                          ; 430d: a2 0a
    lda #$0d                                                          ; 430f: a9 0d
    jsr start_room                                                    ; 4311: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 4314: 20 da 12
    sta room_exit_direction                                           ; 4317: 85 70
    and #exit_room_left                                               ; 4319: 29 01
    beq room_1_check_right_exit                                       ; 431b: f0 07
    ldx #0                                                            ; 431d: a2 00
    ldy current_level                                                 ; 431f: a4 31
    jmp initialise_level_and_room                                     ; 4321: 4c 40 11

room_1_check_right_exit
    lda room_exit_direction                                           ; 4324: a5 70
    and #exit_room_right                                              ; 4326: 29 04
    beq room_1_game_update_loop                                       ; 4328: f0 ea
    ldx #2                                                            ; 432a: a2 02
    ldy current_level                                                 ; 432c: a4 31
    jmp initialise_level_and_room                                     ; 432e: 4c 40 11

room_1_update_handler
    lda #1                                                            ; 4331: a9 01
    sta currently_updating_logic_for_room_index                       ; 4333: 8d ba 1a
    lda #$20 ; ' '                                                    ; 4336: a9 20
    sta l44aa                                                         ; 4338: 8d aa 44
    lda #3                                                            ; 433b: a9 03
    sta l44ab                                                         ; 433d: 8d ab 44
    lda #4                                                            ; 4340: a9 04
    sta l44ac                                                         ; 4342: 8d ac 44
    ldx #$0b                                                          ; 4345: a2 0b
    ldy room_1_left_hand_balloon_y_position                           ; 4347: ac 75 0a
    jsr sub_c4366                                                     ; 434a: 20 66 43
    sty room_1_left_hand_balloon_y_position                           ; 434d: 8c 75 0a
    lda #5                                                            ; 4350: a9 05
    sta l44ab                                                         ; 4352: 8d ab 44
    lda #6                                                            ; 4355: a9 06
    sta l44ac                                                         ; 4357: 8d ac 44
    ldx #$15                                                          ; 435a: a2 15
    ldy room_1_right_hand_balloon_y_position                          ; 435c: ac 76 0a
    jsr sub_c4366                                                     ; 435f: 20 66 43
    sty room_1_right_hand_balloon_y_position                          ; 4362: 8c 76 0a
    rts                                                               ; 4365: 60

sub_c4366
    stx l44a8                                                         ; 4366: 8e a8 44
    sty l44a9                                                         ; 4369: 8c a9 44
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 436c: ad 2b 13
    beq c43b3                                                         ; 436f: f0 42
; check for level change (branch if not)
    lda current_level                                                 ; 4371: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 4373: c5 51
    beq c437d                                                         ; 4375: f0 06
    lda l44aa                                                         ; 4377: ad aa 44
    sta l44a9                                                         ; 437a: 8d a9 44
c437d
    lda desired_room_index                                            ; 437d: a5 30
    cmp currently_updating_logic_for_room_index                       ; 437f: cd ba 1a
    bne c43ad                                                         ; 4382: d0 29
    ldx l44a8                                                         ; 4384: ae a8 44
    ldy #0                                                            ; 4387: a0 00
    lda l44ab                                                         ; 4389: ad ab 44
    jsr set_object_position_from_cell_xy                              ; 438c: 20 5d 1f
    lda l44ac                                                         ; 438f: ad ac 44
    jsr set_object_position_from_cell_xy                              ; 4392: 20 5d 1f
    lda #$c8                                                          ; 4395: a9 c8
    ldx l44ab                                                         ; 4397: ae ab 44
    sta object_spriteid,x                                             ; 439a: 9d a8 09
    lda #$c9                                                          ; 439d: a9 c9
    ldx l44ac                                                         ; 439f: ae ac 44
    sta object_spriteid,x                                             ; 43a2: 9d a8 09
    lda #$c0                                                          ; 43a5: a9 c0
    sta object_z_order,x                                              ; 43a7: 9d c2 38
    jsr sub_c44ad                                                     ; 43aa: 20 ad 44
c43ad
    jmp c4448                                                         ; 43ad: 4c 48 44

c43b0
    jmp c44a0                                                         ; 43b0: 4c a0 44

c43b3
    lda desired_room_index                                            ; 43b3: a5 30
    cmp currently_updating_logic_for_room_index                       ; 43b5: cd ba 1a
    bne c4418                                                         ; 43b8: d0 5e
    jsr sub_c44ad                                                     ; 43ba: 20 ad 44
    lda l44f4                                                         ; 43bd: ad f4 44
    beq c4418                                                         ; 43c0: f0 56
    lda #4                                                            ; 43c2: a9 04
    sta l44a7                                                         ; 43c4: 8d a7 44
    clc                                                               ; 43c7: 18
    adc object_y_low                                                  ; 43c8: 6d 7c 09
    sta object_y_low                                                  ; 43cb: 8d 7c 09
    lda l44a7                                                         ; 43ce: ad a7 44
    clc                                                               ; 43d1: 18
    adc object_y_low + objectid_player_accessory                      ; 43d2: 6d 7d 09
    sta object_y_low + objectid_player_accessory                      ; 43d5: 8d 7d 09
loop_c43d8
    lda #1                                                            ; 43d8: a9 01
    sta temp_bottom_offset                                            ; 43da: 8d 51 25
    lda #0                                                            ; 43dd: a9 00
    jsr get_solid_rock_collision_for_object_a                         ; 43df: 20 94 28
    beq c43f0                                                         ; 43e2: f0 0c
    dec l44a7                                                         ; 43e4: ce a7 44
    dec object_y_low                                                  ; 43e7: ce 7c 09
    dec object_y_low + objectid_player_accessory                      ; 43ea: ce 7d 09
    jmp loop_c43d8                                                    ; 43ed: 4c d8 43

c43f0
    lda l44a7                                                         ; 43f0: ad a7 44
    beq c43b0                                                         ; 43f3: f0 bb
    clc                                                               ; 43f5: 18
    adc l44a9                                                         ; 43f6: 6d a9 44
    sta l44a9                                                         ; 43f9: 8d a9 44
    lda #$a0                                                          ; 43fc: a9 a0
    lda #$e0                                                          ; 43fe: a9 e0
    ldx l44ab                                                         ; 4400: ae ab 44
    sta object_z_order,x                                              ; 4403: 9d c2 38
    lda #2                                                            ; 4406: a9 02
    sta temp_bottom_offset                                            ; 4408: 8d 51 25
    lda #0                                                            ; 440b: a9 00
    jsr get_solid_rock_collision_for_object_a                         ; 440d: 20 94 28
    beq c4448                                                         ; 4410: f0 36
    jsr play_landing_sound                                            ; 4412: 20 a9 23
    jmp c4448                                                         ; 4415: 4c 48 44

c4418
    lda l44a9                                                         ; 4418: ad a9 44
    cmp l44aa                                                         ; 441b: cd aa 44
    beq c43b0                                                         ; 441e: f0 90
    sec                                                               ; 4420: 38
    sbc #8                                                            ; 4421: e9 08
    cmp l44aa                                                         ; 4423: cd aa 44
    bcs c442b                                                         ; 4426: b0 03
    lda l44aa                                                         ; 4428: ad aa 44
c442b
    sta l44a9                                                         ; 442b: 8d a9 44
    lda #$e0                                                          ; 442e: a9 e0
    ldx l44ab                                                         ; 4430: ae ab 44
    sta object_z_order,x                                              ; 4433: 9d c2 38
    lda desired_room_index                                            ; 4436: a5 30
    cmp currently_updating_logic_for_room_index                       ; 4438: cd ba 1a
    bne c4448                                                         ; 443b: d0 0b
    lda l44a9                                                         ; 443d: ad a9 44
    cmp l44aa                                                         ; 4440: cd aa 44
    bne c4448                                                         ; 4443: d0 03
    jsr play_landing_sound                                            ; 4445: 20 a9 23
c4448
    lda desired_room_index                                            ; 4448: a5 30
    cmp currently_updating_logic_for_room_index                       ; 444a: cd ba 1a
    bne c44a0                                                         ; 444d: d0 51
    lda l44a9                                                         ; 444f: ad a9 44
    ldx l44ab                                                         ; 4452: ae ab 44
    sta object_y_low,x                                                ; 4455: 9d 7c 09
    ldx l44ac                                                         ; 4458: ae ac 44
    sta object_y_low,x                                                ; 445b: 9d 7c 09
    ldx l44a8                                                         ; 445e: ae a8 44
    lda l44a9                                                         ; 4461: ad a9 44
    lsr                                                               ; 4464: 4a
    lsr                                                               ; 4465: 4a
    lsr                                                               ; 4466: 4a
    tay                                                               ; 4467: a8
    dey                                                               ; 4468: 88
    dey                                                               ; 4469: 88
    lda #0                                                            ; 446a: a9 00
    jsr write_a_single_value_to_cell_in_collision_map                 ; 446c: 20 bb 1e
    iny                                                               ; 446f: c8
    lda #3                                                            ; 4470: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4472: 20 bb 1e
    iny                                                               ; 4475: c8
    lda #2                                                            ; 4476: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4478: 20 bb 1e
    iny                                                               ; 447b: c8
    jsr write_a_single_value_to_cell_in_collision_map                 ; 447c: 20 bb 1e
    iny                                                               ; 447f: c8
    jsr read_collision_map_value_for_xy                               ; 4480: 20 fa 1e
    cmp #3                                                            ; 4483: c9 03
    beq c44a0                                                         ; 4485: f0 19
    lda l44a9                                                         ; 4487: ad a9 44
    and #7                                                            ; 448a: 29 07
    beq c449b                                                         ; 448c: f0 0d
    lda #2                                                            ; 448e: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4490: 20 bb 1e
    iny                                                               ; 4493: c8
    jsr read_collision_map_value_for_xy                               ; 4494: 20 fa 1e
    cmp #3                                                            ; 4497: c9 03
    beq c44a0                                                         ; 4499: f0 05
c449b
    lda #0                                                            ; 449b: a9 00
    jsr write_a_single_value_to_cell_in_collision_map                 ; 449d: 20 bb 1e
c44a0
    ldx l44a8                                                         ; 44a0: ae a8 44
    ldy l44a9                                                         ; 44a3: ac a9 44
    rts                                                               ; 44a6: 60

l44a7
    !byte 0                                                           ; 44a7: 00
l44a8
    !byte 0                                                           ; 44a8: 00
l44a9
    !byte 0                                                           ; 44a9: 00
l44aa
    !byte 0                                                           ; 44aa: 00
l44ab
    !byte 0                                                           ; 44ab: 00
l44ac
    !byte 0                                                           ; 44ac: 00

sub_c44ad
    lda #0                                                            ; 44ad: a9 00
    sta l44f4                                                         ; 44af: 8d f4 44
    lda current_player_character                                      ; 44b2: a5 48
    cmp #6                                                            ; 44b4: c9 06
    bne return7                                                       ; 44b6: d0 3b
    lda object_x_high                                                 ; 44b8: ad 66 09
    lsr                                                               ; 44bb: 4a
    sta temp_player_x                                                 ; 44bc: 85 70
    lda object_x_low                                                  ; 44be: ad 50 09
    ror                                                               ; 44c1: 6a
    lsr temp_player_x                                                 ; 44c2: 46 70
    ror                                                               ; 44c4: 6a
    lsr temp_player_x                                                 ; 44c5: 46 70
    ror                                                               ; 44c7: 6a
    sta temp_player_x                                                 ; 44c8: 85 70
    sec                                                               ; 44ca: 38
    sbc #2                                                            ; 44cb: e9 02
    cmp l44a8                                                         ; 44cd: cd a8 44
    bcs return7                                                       ; 44d0: b0 21
    lda temp_player_x                                                 ; 44d2: a5 70
    clc                                                               ; 44d4: 18
    adc #1                                                            ; 44d5: 69 01
    cmp l44a8                                                         ; 44d7: cd a8 44
    bcc return7                                                       ; 44da: 90 17
    lda current_animation                                             ; 44dc: ad df 09
    cmp #$51 ; 'Q'                                                    ; 44df: c9 51
    beq c44eb                                                         ; 44e1: f0 08
    cmp #$45 ; 'E'                                                    ; 44e3: c9 45
    beq c44eb                                                         ; 44e5: f0 04
    cmp #$49 ; 'I'                                                    ; 44e7: c9 49
    bne return7                                                       ; 44e9: d0 08
c44eb
    lda #$ff                                                          ; 44eb: a9 ff
    sta inhibit_monkey_climb_flag                                     ; 44ed: 8d d7 31
    sta l44f4                                                         ; 44f0: 8d f4 44
return7
    rts                                                               ; 44f3: 60

l44f4
    !byte 0                                                           ; 44f4: 00
envelope4
    !byte 5                                                           ; 44f5: 05                      ; envelope number
    !byte 1                                                           ; 44f6: 01                      ; step length (100ths of a second)
    !byte 255                                                         ; 44f7: ff                      ; pitch change per step in section 1
    !byte 0                                                           ; 44f8: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 44f9: 00                      ; pitch change per step in section 3
    !byte 1                                                           ; 44fa: 01                      ; number of steps in section 1
    !byte 1                                                           ; 44fb: 01                      ; number of steps in section 2
    !byte 0                                                           ; 44fc: 00                      ; number of steps in section 3
    !byte 110                                                         ; 44fd: 6e                      ; change of amplitude per step during attack phase
    !byte 252                                                         ; 44fe: fc                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 44ff: 00                      ; change of amplitude per step during sustain phase
    !byte 248                                                         ; 4500: f8                      ; change of amplitude per step during release phase
    !byte 110                                                         ; 4501: 6e                      ; target of level at end of attack phase
    !byte 0                                                           ; 4502: 00                      ; target of level at end of decay phase
sound8
    !word $13                                                         ; 4503: 13 00                   ; channel
    !word 5                                                           ; 4505: 05 00                   ; amplitude
    !word 201                                                         ; 4507: c9 00                   ; pitch
    !word 1                                                           ; 4509: 01 00                   ; duration
envelope1
    !byte 6                                                           ; 450b: 06                      ; envelope number
    !byte 1                                                           ; 450c: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 450d: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 450e: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 450f: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 4510: 00                      ; number of steps in section 1
    !byte 0                                                           ; 4511: 00                      ; number of steps in section 2
    !byte 0                                                           ; 4512: 00                      ; number of steps in section 3
    !byte 80                                                          ; 4513: 50                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4514: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4515: 00                      ; change of amplitude per step during sustain phase
    !byte 250                                                         ; 4516: fa                      ; change of amplitude per step during release phase
    !byte 115                                                         ; 4517: 73                      ; target of level at end of attack phase
    !byte 0                                                           ; 4518: 00                      ; target of level at end of decay phase
sound4
    !word $10                                                         ; 4519: 10 00                   ; channel
    !word 6                                                           ; 451b: 06 00                   ; amplitude
    !word 7                                                           ; 451d: 07 00                   ; pitch
    !word 1                                                           ; 451f: 01 00                   ; duration
sound3
    !word $11                                                         ; 4521: 11 00                   ; channel
    !word 0                                                           ; 4523: 00 00                   ; amplitude
    !word 210                                                         ; 4525: d2 00                   ; pitch
    !word 1                                                           ; 4527: 01 00                   ; duration
envelope2
    !byte 7                                                           ; 4529: 07                      ; envelope number
    !byte 1                                                           ; 452a: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 452b: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 452c: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 452d: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 452e: 00                      ; number of steps in section 1
    !byte 0                                                           ; 452f: 00                      ; number of steps in section 2
    !byte 0                                                           ; 4530: 00                      ; number of steps in section 3
    !byte 126                                                         ; 4531: 7e                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4532: 00                      ; change of amplitude per step during decay phase
    !byte 252                                                         ; 4533: fc                      ; change of amplitude per step during sustain phase
    !byte 248                                                         ; 4534: f8                      ; change of amplitude per step during release phase
    !byte 126                                                         ; 4535: 7e                      ; target of level at end of attack phase
    !byte 0                                                           ; 4536: 00                      ; target of level at end of decay phase
sound2
    !word $10                                                         ; 4537: 10 00                   ; channel
    !word 7                                                           ; 4539: 07 00                   ; amplitude
    !word 7                                                           ; 453b: 07 00                   ; pitch
    !word 1                                                           ; 453d: 01 00                   ; duration
sound1
    !word $11                                                         ; 453f: 11 00                   ; channel
    !word 0                                                           ; 4541: 00 00                   ; amplitude
    !word 200                                                         ; 4543: c8 00                   ; pitch
    !word 1                                                           ; 4545: 01 00                   ; duration
envelope3
    !byte 7                                                           ; 4547: 07                      ; envelope number
    !byte 129                                                         ; 4548: 81                      ; step length (100ths of a second)
    !byte 252                                                         ; 4549: fc                      ; pitch change per step in section 1
    !byte 254                                                         ; 454a: fe                      ; pitch change per step in section 2
    !byte 255                                                         ; 454b: ff                      ; pitch change per step in section 3
    !byte 8                                                           ; 454c: 08                      ; number of steps in section 1
    !byte 8                                                           ; 454d: 08                      ; number of steps in section 2
    !byte 8                                                           ; 454e: 08                      ; number of steps in section 3
    !byte 96                                                          ; 454f: 60                      ; change of amplitude per step during attack phase
    !byte 252                                                         ; 4550: fc                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4551: 00                      ; change of amplitude per step during sustain phase
    !byte 252                                                         ; 4552: fc                      ; change of amplitude per step during release phase
    !byte 96                                                          ; 4553: 60                      ; target of level at end of attack phase
    !byte 0                                                           ; 4554: 00                      ; target of level at end of decay phase
sound5
    !word $13                                                         ; 4555: 13 00                   ; channel
    !word 7                                                           ; 4557: 07 00                   ; amplitude
    !word 245                                                         ; 4559: f5 00                   ; pitch
    !word 2                                                           ; 455b: 02 00                   ; duration
envelope5
    !byte 8                                                           ; 455d: 08                      ; envelope number
    !byte 1                                                           ; 455e: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 455f: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 4560: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 4561: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 4562: 00                      ; number of steps in section 1
    !byte 0                                                           ; 4563: 00                      ; number of steps in section 2
    !byte 0                                                           ; 4564: 00                      ; number of steps in section 3
    !byte 110                                                         ; 4565: 6e                      ; change of amplitude per step during attack phase
    !byte 254                                                         ; 4566: fe                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4567: 00                      ; change of amplitude per step during sustain phase
    !byte 252                                                         ; 4568: fc                      ; change of amplitude per step during release phase
    !byte 110                                                         ; 4569: 6e                      ; target of level at end of attack phase
    !byte 0                                                           ; 456a: 00                      ; target of level at end of decay phase
sound7
    !word $10                                                         ; 456b: 10 00                   ; channel
    !word 8                                                           ; 456d: 08 00                   ; amplitude
    !word 3                                                           ; 456f: 03 00                   ; pitch
    !word 2                                                           ; 4571: 02 00                   ; duration
envelope6
    !byte 9                                                           ; 4573: 09                      ; envelope number
    !byte 132                                                         ; 4574: 84                      ; step length (100ths of a second)
    !byte 2                                                           ; 4575: 02                      ; pitch change per step in section 1
    !byte 2                                                           ; 4576: 02                      ; pitch change per step in section 2
    !byte 2                                                           ; 4577: 02                      ; pitch change per step in section 3
    !byte 4                                                           ; 4578: 04                      ; number of steps in section 1
    !byte 4                                                           ; 4579: 04                      ; number of steps in section 2
    !byte 4                                                           ; 457a: 04                      ; number of steps in section 3
    !byte 0                                                           ; 457b: 00                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 457c: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 457d: 00                      ; change of amplitude per step during sustain phase
    !byte 0                                                           ; 457e: 00                      ; change of amplitude per step during release phase
    !byte 0                                                           ; 457f: 00                      ; target of level at end of attack phase
    !byte 0                                                           ; 4580: 00                      ; target of level at end of decay phase
sound6
    !word $11                                                         ; 4581: 11 00                   ; channel
    !word 9                                                           ; 4583: 09 00                   ; amplitude
    !word 110                                                         ; 4585: 6e 00                   ; pitch
    !word 2                                                           ; 4587: 02 00                   ; duration
ground_fill_2x2_top_left
    !byte %...#....                                                   ; 4589: 10
    !byte %...#....                                                   ; 458a: 10
    !byte %..#.....                                                   ; 458b: 20
    !byte %##...###                                                   ; 458c: c7
    !byte %....#...                                                   ; 458d: 08
    !byte %...#....                                                   ; 458e: 10
    !byte %...#....                                                   ; 458f: 10
    !byte %...#....                                                   ; 4590: 10
ground_fill_2x2_top_right
    !byte %...#....                                                   ; 4591: 10
    !byte %...#....                                                   ; 4592: 10
    !byte %....#...                                                   ; 4593: 08
    !byte %##...###                                                   ; 4594: c7
    !byte %..#....#                                                   ; 4595: 21
    !byte %...#...#                                                   ; 4596: 11
    !byte %...#...#                                                   ; 4597: 11
    !byte %...#...#                                                   ; 4598: 11
ground_fill_2x2_bottom_left
    !byte %...#....                                                   ; 4599: 10
    !byte %...#....                                                   ; 459a: 10
    !byte %....#...                                                   ; 459b: 08
    !byte %##...###                                                   ; 459c: c7
    !byte %..#....#                                                   ; 459d: 21
    !byte %...#...#                                                   ; 459e: 11
    !byte %...#...#                                                   ; 459f: 11
    !byte %...#...#                                                   ; 45a0: 11
ground_fill_2x2_bottom_right
    !byte %...#....                                                   ; 45a1: 10
    !byte %...#....                                                   ; 45a2: 10
    !byte %..#.....                                                   ; 45a3: 20
    !byte %##...###                                                   ; 45a4: c7
    !byte %....#...                                                   ; 45a5: 08
    !byte %...#....                                                   ; 45a6: 10
    !byte %...#....                                                   ; 45a7: 10
    !byte %...#....                                                   ; 45a8: 10
sprite_data
pydis_end

; Automatically generated labels:
;     c3bf8
;     c3dcf
;     c3dd5
;     c3dec
;     c3def
;     c3e00
;     c3e0e
;     c3e47
;     c3e6d
;     c3e8a
;     c3e92
;     c3ea7
;     c3eb5
;     c3edf
;     c3ee8
;     c3f0c
;     c3f2d
;     c4004
;     c4036
;     c405e
;     c4086
;     c408b
;     c408e
;     c4091
;     c40b5
;     c40cf
;     c40ee
;     c40f3
;     c4125
;     c4134
;     c415b
;     c416b
;     c4171
;     c417e
;     c41ac
;     c41b8
;     c41bf
;     c41f5
;     c4206
;     c423e
;     c4253
;     c437d
;     c43ad
;     c43b0
;     c43b3
;     c43f0
;     c4418
;     c442b
;     c4448
;     c449b
;     c44a0
;     c44eb
;     l3f3c
;     l4187
;     l4188
;     l4189
;     l44a7
;     l44a8
;     l44a9
;     l44aa
;     l44ab
;     l44ac
;     l44f4
;     loop_c406c
;     loop_c43d8
;     sub_c418a
;     sub_c4281
;     sub_c4366
;     sub_c44ad
!if (<envelope1) != $0b {
    !error "Assertion failed: <envelope1 == $0b"
}
!if (<envelope2) != $29 {
    !error "Assertion failed: <envelope2 == $29"
}
!if (<envelope3) != $47 {
    !error "Assertion failed: <envelope3 == $47"
}
!if (<envelope4) != $f5 {
    !error "Assertion failed: <envelope4 == $f5"
}
!if (<envelope5) != $5d {
    !error "Assertion failed: <envelope5 == $5d"
}
!if (<envelope6) != $73 {
    !error "Assertion failed: <envelope6 == $73"
}
!if (<ground_fill_2x2_top_left) != $89 {
    !error "Assertion failed: <ground_fill_2x2_top_left == $89"
}
!if (<sound1) != $3f {
    !error "Assertion failed: <sound1 == $3f"
}
!if (<sound2) != $37 {
    !error "Assertion failed: <sound2 == $37"
}
!if (<sound3) != $21 {
    !error "Assertion failed: <sound3 == $21"
}
!if (<sound4) != $19 {
    !error "Assertion failed: <sound4 == $19"
}
!if (<sound5) != $55 {
    !error "Assertion failed: <sound5 == $55"
}
!if (<sound6) != $81 {
    !error "Assertion failed: <sound6 == $81"
}
!if (<sound7) != $6b {
    !error "Assertion failed: <sound7 == $6b"
}
!if (<sound8) != $03 {
    !error "Assertion failed: <sound8 == $03"
}
!if (>envelope1) != $45 {
    !error "Assertion failed: >envelope1 == $45"
}
!if (>envelope2) != $45 {
    !error "Assertion failed: >envelope2 == $45"
}
!if (>envelope3) != $45 {
    !error "Assertion failed: >envelope3 == $45"
}
!if (>envelope4) != $44 {
    !error "Assertion failed: >envelope4 == $44"
}
!if (>envelope5) != $45 {
    !error "Assertion failed: >envelope5 == $45"
}
!if (>envelope6) != $45 {
    !error "Assertion failed: >envelope6 == $45"
}
!if (>ground_fill_2x2_top_left) != $45 {
    !error "Assertion failed: >ground_fill_2x2_top_left == $45"
}
!if (>sound1) != $45 {
    !error "Assertion failed: >sound1 == $45"
}
!if (>sound2) != $45 {
    !error "Assertion failed: >sound2 == $45"
}
!if (>sound3) != $45 {
    !error "Assertion failed: >sound3 == $45"
}
!if (>sound4) != $45 {
    !error "Assertion failed: >sound4 == $45"
}
!if (>sound5) != $45 {
    !error "Assertion failed: >sound5 == $45"
}
!if (>sound6) != $45 {
    !error "Assertion failed: >sound6 == $45"
}
!if (>sound7) != $45 {
    !error "Assertion failed: >sound7 == $45"
}
!if (>sound8) != $45 {
    !error "Assertion failed: >sound8 == $45"
}
!if (collision_map_none) != $00 {
    !error "Assertion failed: collision_map_none == $00"
}
!if (collision_map_solid_rock) != $03 {
    !error "Assertion failed: collision_map_solid_rock == $03"
}
!if (exit_room_left) != $01 {
    !error "Assertion failed: exit_room_left == $01"
}
!if (exit_room_right) != $04 {
    !error "Assertion failed: exit_room_right == $04"
}
!if (level_specific_initialisation) != $3af2 {
    !error "Assertion failed: level_specific_initialisation == $3af2"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b0d {
    !error "Assertion failed: level_specific_update == $3b0d"
}
!if (object_direction + objectid_arrow) != $09c0 {
    !error "Assertion failed: object_direction + objectid_arrow == $09c0"
}
!if (object_erase_type + objectid_baby) != $38b1 {
    !error "Assertion failed: object_erase_type + objectid_baby == $38b1"
}
!if (object_erase_type + objectid_bow) != $38ae {
    !error "Assertion failed: object_erase_type + objectid_bow == $38ae"
}
!if (object_spriteid + objectid_arrow) != $09aa {
    !error "Assertion failed: object_spriteid + objectid_arrow == $09aa"
}
!if (object_spriteid + objectid_baby) != $09ad {
    !error "Assertion failed: object_spriteid + objectid_baby == $09ad"
}
!if (object_spriteid + objectid_balloon1) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_balloon1 == $09ab"
}
!if (object_spriteid + objectid_balloon1_rope) != $09ac {
    !error "Assertion failed: object_spriteid + objectid_balloon1_rope == $09ac"
}
!if (object_spriteid + objectid_bow) != $09aa {
    !error "Assertion failed: object_spriteid + objectid_bow == $09aa"
}
!if (object_spriteid + objectid_table) != $09ad {
    !error "Assertion failed: object_spriteid + objectid_table == $09ad"
}
!if (object_spriteid_old + objectid_bow) != $09b5 {
    !error "Assertion failed: object_spriteid_old + objectid_bow == $09b5"
}
!if (object_x_high + objectid_arrow) != $0968 {
    !error "Assertion failed: object_x_high + objectid_arrow == $0968"
}
!if (object_x_low + objectid_arrow) != $0952 {
    !error "Assertion failed: object_x_low + objectid_arrow == $0952"
}
!if (object_x_low + objectid_baby) != $0955 {
    !error "Assertion failed: object_x_low + objectid_baby == $0955"
}
!if (object_y_high + objectid_arrow) != $0994 {
    !error "Assertion failed: object_y_high + objectid_arrow == $0994"
}
!if (object_y_high + objectid_bow) != $0994 {
    !error "Assertion failed: object_y_high + objectid_bow == $0994"
}
!if (object_y_low + objectid_arrow) != $097e {
    !error "Assertion failed: object_y_low + objectid_arrow == $097e"
}
!if (object_y_low + objectid_baby) != $0981 {
    !error "Assertion failed: object_y_low + objectid_baby == $0981"
}
!if (object_z_order + objectid_arrow) != $38c4 {
    !error "Assertion failed: object_z_order + objectid_arrow == $38c4"
}
!if (object_z_order + objectid_baby) != $38c7 {
    !error "Assertion failed: object_z_order + objectid_baby == $38c7"
}
!if (object_z_order + objectid_balloon1) != $38c5 {
    !error "Assertion failed: object_z_order + objectid_balloon1 == $38c5"
}
!if (objectid_arrow) != $02 {
    !error "Assertion failed: objectid_arrow == $02"
}
!if (objectid_baby) != $05 {
    !error "Assertion failed: objectid_baby == $05"
}
!if (objectid_balloon1) != $03 {
    !error "Assertion failed: objectid_balloon1 == $03"
}
!if (objectid_balloon1_rope) != $04 {
    !error "Assertion failed: objectid_balloon1_rope == $04"
}
!if (objectid_bow) != $02 {
    !error "Assertion failed: objectid_bow == $02"
}
!if (objectid_old_player) != $0b {
    !error "Assertion failed: objectid_old_player == $0b"
}
!if (objectid_player) != $00 {
    !error "Assertion failed: objectid_player == $00"
}
!if (objectid_table) != $05 {
    !error "Assertion failed: objectid_table == $05"
}
!if (room_0_data) != $3f3d {
    !error "Assertion failed: room_0_data == $3f3d"
}
!if (room_1_data) != $42a4 {
    !error "Assertion failed: room_1_data == $42a4"
}
!if (room_2_data) != $3b1a {
    !error "Assertion failed: room_2_data == $3b1a"
}
!if (room_3_data) != $3d02 {
    !error "Assertion failed: room_3_data == $3d02"
}
!if (sprite_data - level_data) != $0ad4 {
    !error "Assertion failed: sprite_data - level_data == $0ad4"
}
!if (spriteid_arrow) != $cc {
    !error "Assertion failed: spriteid_arrow == $cc"
}
!if (spriteid_baby) != $d4 {
    !error "Assertion failed: spriteid_baby == $d4"
}
!if (spriteid_baby_dead) != $d7 {
    !error "Assertion failed: spriteid_baby_dead == $d7"
}
!if (spriteid_baby_fall) != $d6 {
    !error "Assertion failed: spriteid_baby_fall == $d6"
}
!if (spriteid_baby_smile) != $d9 {
    !error "Assertion failed: spriteid_baby_smile == $d9"
}
!if (spriteid_baby_surprise) != $d5 {
    !error "Assertion failed: spriteid_baby_surprise == $d5"
}
!if (spriteid_balloon) != $c8 {
    !error "Assertion failed: spriteid_balloon == $c8"
}
!if (spriteid_bow) != $ca {
    !error "Assertion failed: spriteid_bow == $ca"
}
!if (spriteid_bow_menu_item) != $cb {
    !error "Assertion failed: spriteid_bow_menu_item == $cb"
}
!if (spriteid_burst_balloon) != $d3 {
    !error "Assertion failed: spriteid_burst_balloon == $d3"
}
!if (spriteid_cache1) != $cd {
    !error "Assertion failed: spriteid_cache1 == $cd"
}
!if (spriteid_cache2) != $cf {
    !error "Assertion failed: spriteid_cache2 == $cf"
}
!if (spriteid_one_pixel_masked_out) != $00 {
    !error "Assertion failed: spriteid_one_pixel_masked_out == $00"
}
!if (spriteid_rope_bottom) != $d0 {
    !error "Assertion failed: spriteid_rope_bottom == $d0"
}
!if (spriteid_rope_top) != $d1 {
    !error "Assertion failed: spriteid_rope_top == $d1"
}
!if (spriteid_rope_top_broken) != $d2 {
    !error "Assertion failed: spriteid_rope_top_broken == $d2"
}
!if (spriteid_table) != $ce {
    !error "Assertion failed: spriteid_table == $ce"
}
!if (spriteid_wood_block) != $d8 {
    !error "Assertion failed: spriteid_wood_block == $d8"
}
