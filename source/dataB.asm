; *************************************************************************************
;
; Level B: TIME-FLIES
;
; Save game variables:
;
;     save_game_level_b_cuckoo_room_1_progress ($0a05):
;               0: hidden in room 1 clock,
;              1+: cuckooing
;             $ff: got cuckoo (cuckoo object created)
;     save_game_level_b_cuckoo_room_2_progress ($0a06):
;               0: in room 2 clock or held
;               1: installed in clock
;              15: just launched
;           16-40: animation being thrown into room3 (just the odd numbers)
;             $ff: in room 3
;     save_game_level_b_room_2_falling_boulder_progress ($0a07):
;               0: suspended
;             $ff: finished falling
;       otherwise: falling (Y coordinate)
;     save_game_level_b_room_0_falling_boulder_progress ($0a08):
;               0: suspended
;             $ff: finished falling
;       otherwise: falling (Y coordinate)
;     save_game_level_b_got_hourglass_flag ($0a09)
;
; Solution:
;
;   1. Get the hourglass collectable from room 2 (to the right of the start room 0)
;   2. Stand as the wizard on top of the suspended boulder in room 0 holding the hourglass
;           (The boulder falls)
;   3. Jump left into room 1 from the fallen boulder, and go to the far left edge
;   4. Jump into the pendulum to set it ticking for a short time
;   5. As the cat, jump back to the right of the room, up onto the ledge and as the monkey jump
;      onto the rope and into the cuckoo before the clock stops. Timing is tight here.
;      Alternatively, jump as the cat towards the rope from the right below the rope and
;      change mid-air into the monkey to grab onto the rope.
;   6. Take the cuckoo to the clock in room 2 and use it on top of the clock to fix the clock.
;   7. Set the clock ticking by jumping into the pendulum.
;           (The cuckoo is thrown into room 3, and the suspended boulder falls)
;   8. Jump to the right into room 3 from the fallen boulder
;   9. Climb the rope over to the right side of the room and jump into the spell collectable.
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
objectid_clock_workings               = 3
objectid_cuckoo                       = 2
objectid_hourglass                    = 7
objectid_old_player                   = 11
objectid_old_player_accessory         = 12
objectid_pendulum                     = 2
objectid_player                       = 0
objectid_player_accessory             = 1
objectid_rope_broken_bottom_end       = 6
objectid_rope_broken_top_end          = 5
objectid_spell                        = 5
objectid_suspended_boulder            = 4
opcode_jmp                            = 76
sprite_op_flags_copy_screen           = 1
sprite_op_flags_erase_to_bg_colour    = 2
sprite_op_flags_erase_to_fg_colour    = 4
sprite_op_flags_normal                = 0
spriteid_197                          = 197
spriteid_ball                         = 59
spriteid_boulder                      = 213
spriteid_brazier                      = 58
spriteid_cache1                       = 215
spriteid_cache2                       = 216
spriteid_cache3                       = 223
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
spriteid_clock                        = 200
spriteid_clock_workings               = 209
spriteid_corner_bottom_left           = 45
spriteid_corner_bottom_right          = 46
spriteid_corner_top_left              = 44
spriteid_corner_top_right             = 47
spriteid_cuckoo                       = 211
spriteid_cuckoo_appear_full           = 208
spriteid_cuckoo_appear_partly         = 207
spriteid_cuckoo_menu_item             = 212
spriteid_cuckoo_open_beak             = 214
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
spriteid_hourglass                    = 221
spriteid_hourglass_menu_item          = 222
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
spriteid_pendulum1                    = 201
spriteid_pendulum2                    = 202
spriteid_pendulum3                    = 203
spriteid_pendulum4                    = 204
spriteid_pendulum5                    = 205
spriteid_pointer_hand                 = 29
spriteid_rope1                        = 85
spriteid_rope2                        = 86
spriteid_rope3                        = 87
spriteid_rope4                        = 88
spriteid_rope_broken_bottom_end       = 219
spriteid_rope_broken_falling_end      = 218
spriteid_rope_broken_top_end          = 220
spriteid_rope_end                     = 10
spriteid_rope_end_at_object           = 217
spriteid_rope_hook                    = 11
spriteid_sparkles1                    = 34
spriteid_sparkles2                    = 35
spriteid_sparkles3                    = 36
spriteid_sparkles4                    = 37
spriteid_sparkles5                    = 38
spriteid_table                        = 210
spriteid_vertical_rod                 = 206
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
sprite_op_flags                                     = $15
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
previous_boulder_progress                           = $70
room_exit_direction                                 = $70
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
save_game_level_b_cuckoo_room_1_progress            = $0a05
save_game_level_b_cuckoo_room_2_progress            = $0a06
save_game_level_b_room_2_falling_boulder_progress   = $0a07
save_game_level_b_room_0_falling_boulder_progress   = $0a08
save_game_level_b_got_hourglass_flag                = $0a09
room_1_clock_repeat_counter                         = $0a6f
room_1_clock_repeat_limit                           = $0a70
room_1_pendulum_swing_index                         = $0a71
room_2_clock_repeat_counter                         = $0a72
room_2_clock_repeat_limit                           = $0a73
room_2_pendulum_swing_index                         = $0a74
player_playing_cuckoo_progress                      = $0a75
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
    !word sprite_data - level_data                                    ; 3ad5: 71 0a                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f2 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 1c 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
room_index_cheat1
    !byte 0                                                           ; 3add: 00
room_index_cheat2
    !byte 1                                                           ; 3ade: 01
level_room_data_table
    !word room_0_data                                                 ; 3adf: 2f 3b                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: 81 3c
    !word room_2_data                                                 ; 3ae3: 93 3f
    !word room_3_data                                                 ; 3ae5: 3d 43

; *************************************************************************************
; 'TIME-FLIES[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $9f, $82, $86, $8e, $e6, $8d, $87, $82, $8e, $98, $c6       ; 3ae7: 9f 82 86...

; *************************************************************************************
; 
; Level initialisation
; 
; This is called whenever a new room is entered.
; 
; *************************************************************************************
level_specific_initialisation
    lda current_level                                                 ; 3af2: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3af4: c5 51
    beq return1                                                       ; 3af6: f0 23
    lda developer_flags                                               ; 3af8: ad 03 11
    bpl developer_mode_inactive                                       ; 3afb: 10 05
    lda #$ff                                                          ; 3afd: a9 ff
    sta save_game_level_b_cuckoo_room_1_progress                      ; 3aff: 8d 05 0a
developer_mode_inactive
    lda save_game_level_b_got_hourglass_flag                          ; 3b02: ad 09 0a
    beq check_got_cuckoo                                              ; 3b05: f0 05
    lda #spriteid_hourglass_menu_item                                 ; 3b07: a9 de
    jsr find_or_create_menu_slot_for_A                                ; 3b09: 20 bd 2b
check_got_cuckoo
    lda save_game_level_b_cuckoo_room_1_progress                      ; 3b0c: ad 05 0a
    beq return1                                                       ; 3b0f: f0 0a
    lda save_game_level_b_cuckoo_room_2_progress                      ; 3b11: ad 06 0a
    bne return1                                                       ; 3b14: d0 05
    lda #spriteid_cuckoo_menu_item                                    ; 3b16: a9 d4
    jsr find_or_create_menu_slot_for_A                                ; 3b18: 20 bd 2b
return1
    rts                                                               ; 3b1b: 60

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
    jsr room_1_update_handler                                         ; 3b1c: 20 66 3d
    jsr room_2_update_handler                                         ; 3b1f: 20 6d 40
    jsr update_hourglass_handler                                      ; 3b22: 20 dd 42
    jsr room_0_update_handler                                         ; 3b25: 20 08 3c
    jsr room_3_update_handler                                         ; 3b28: 20 3d 44
    jsr update_playing_cuckoo_handler                                 ; 3b2b: 20 2f 3f
    rts                                                               ; 3b2e: 60

; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 22                                                          ; 3b2f: 16                      ; initial player X cell
    !byte 20                                                          ; 3b30: 14                      ; initial player Y cell

; ########################################
; ########################################
; #####                       |      #####
; ####                        |       ####
; ###                         |        ###
; ###                         |        ###
; ###                         |        ###
; ###                         |        ###
; ########           ######   |   ########
; ########           ######   |   ########
;                             |        ###
;                             |        ###
;                             |        ###
;                             |
;                             |
; #####                       |
; #####                       |
; #####                       |
; #####    OOOOOOOOO                 #####
; #####    OOOOOOOOO    P            #####
; ########################################
; ########################################
; ########################################
; ########################################
; set ground fill tile to use
room_0_code
    lda #<ground_fill_2x2_top_left                                    ; 3b31: a9 26
    sta source_sprite_memory_low                                      ; 3b33: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3b35: a9 45
    sta source_sprite_memory_high                                     ; 3b37: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3b39: a2 00
    ldy #0                                                            ; 3b3b: a0 00
    lda #$ff                                                          ; 3b3d: a9 ff
    sta width_in_cells                                                ; 3b3f: 85 3c
    lda #2                                                            ; 3b41: a9 02
    sta height_in_cells                                               ; 3b43: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b45: 20 bb 1a
; draw 5x1 rectangle at (0,2)
    ldy #2                                                            ; 3b48: a0 02
    lda #5                                                            ; 3b4a: a9 05
    sta width_in_cells                                                ; 3b4c: 85 3c
    dec height_in_cells                                               ; 3b4e: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b50: 20 bb 1a
; draw 5x1 rectangle at (35,2)
    ldx #$23 ; '#'                                                    ; 3b53: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 3b55: 20 bb 1a
; draw 4x1 rectangle at (0,3)
    ldx #0                                                            ; 3b58: a2 00
    iny                                                               ; 3b5a: c8
    dec width_in_cells                                                ; 3b5b: c6 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b5d: 20 bb 1a
; draw 4x1 rectangle at (36,3)
    ldx #$24 ; '$'                                                    ; 3b60: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 3b62: 20 bb 1a
; draw 3x4 rectangle at (0,4)
    ldx #0                                                            ; 3b65: a2 00
    iny                                                               ; 3b67: c8
    dec width_in_cells                                                ; 3b68: c6 3c
    lda #4                                                            ; 3b6a: a9 04
    sta height_in_cells                                               ; 3b6c: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b6e: 20 bb 1a
; draw 3x4 rectangle at (37,4)
    ldx #$25 ; '%'                                                    ; 3b71: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 3b73: 20 bb 1a
; draw 8x2 rectangle at (0,8)
    ldx #0                                                            ; 3b76: a2 00
    ldy #8                                                            ; 3b78: a0 08
    sty width_in_cells                                                ; 3b7a: 84 3c
    lda #2                                                            ; 3b7c: a9 02
    sta height_in_cells                                               ; 3b7e: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b80: 20 bb 1a
; draw 8x2 rectangle at (32,8)
    ldx #$20 ; ' '                                                    ; 3b83: a2 20
    jsr copy_rectangle_of_memory_to_screen                            ; 3b85: 20 bb 1a
; draw 8x3 rectangle at (37,10)
    ldx #$25 ; '%'                                                    ; 3b88: a2 25
    ldy #$0a                                                          ; 3b8a: a0 0a
    inc height_in_cells                                               ; 3b8c: e6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b8e: 20 bb 1a
; draw 5x5 rectangle at (0,15)
    ldx #0                                                            ; 3b91: a2 00
    ldy #$0f                                                          ; 3b93: a0 0f
    lda #5                                                            ; 3b95: a9 05
    sta width_in_cells                                                ; 3b97: 85 3c
    sta height_in_cells                                               ; 3b99: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b9b: 20 bb 1a
; draw 255x5 rectangle at (0,20)
    ldy #$14                                                          ; 3b9e: a0 14
    lda #$ff                                                          ; 3ba0: a9 ff
    sta width_in_cells                                                ; 3ba2: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3ba4: 20 bb 1a
; draw 255x2 rectangle at (35,18)
    ldx #$23 ; '#'                                                    ; 3ba7: a2 23
    ldy #$12                                                          ; 3ba9: a0 12
    lda #2                                                            ; 3bab: a9 02
    sta height_in_cells                                               ; 3bad: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3baf: 20 bb 1a
; draw 6x2 rectangle at (19,8)
    ldx #$13                                                          ; 3bb2: a2 13
    ldy #8                                                            ; 3bb4: a0 08
    lda #6                                                            ; 3bb6: a9 06
    sta width_in_cells                                                ; 3bb8: 85 3c
    lda #2                                                            ; 3bba: a9 02
    sta height_in_cells                                               ; 3bbc: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3bbe: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3bc1: 20 90 1b
; draw table at (9,18) of size (3x2)
    lda #3                                                            ; 3bc4: a9 03
    sta width_in_cells                                                ; 3bc6: 85 3c
    lda #2                                                            ; 3bc8: a9 02
    sta height_in_cells                                               ; 3bca: 85 3d
    ldx #9                                                            ; 3bcc: a2 09
    ldy #$12                                                          ; 3bce: a0 12
    lda #spriteid_table                                               ; 3bd0: a9 d2
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bd2: 20 57 1f
; draw table at (12,18) of size (3x2)
    ldx #$0c                                                          ; 3bd5: a2 0c
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bd7: 20 57 1f
; draw table at (15,18) of size (3x2)
    ldx #$0f                                                          ; 3bda: a2 0f
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bdc: 20 57 1f
; draw rope at (28,2) length 16
    ldx #$1c                                                          ; 3bdf: a2 1c
    ldy #2                                                            ; 3be1: a0 02
    lda #$10                                                          ; 3be3: a9 10
    jsr draw_rope                                                     ; 3be5: 20 b9 1d
    jsr start_room                                                    ; 3be8: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 3beb: 20 da 12
    sta room_exit_direction                                           ; 3bee: 85 70
    and #exit_room_left                                               ; 3bf0: 29 01
    beq room_0_check_right_exit                                       ; 3bf2: f0 07
; exit room left, to room 1
    ldx #1                                                            ; 3bf4: a2 01
    ldy current_level                                                 ; 3bf6: a4 31
    jmp initialise_level_and_room                                     ; 3bf8: 4c 40 11

room_0_check_right_exit
    lda room_exit_direction                                           ; 3bfb: a5 70
    and #exit_room_right                                              ; 3bfd: 29 04
    beq room_0_game_update_loop                                       ; 3bff: f0 ea
; exit room right, to room 2
    ldx #2                                                            ; 3c01: a2 02
    ldy current_level                                                 ; 3c03: a4 31
    jmp initialise_level_and_room                                     ; 3c05: 4c 40 11

room_0_update_handler
    lda update_room_first_update_flag                                 ; 3c08: ad 2b 13
    beq room_0_update_suspended_boulder_puzzle                        ; 3c0b: f0 0d
; on the first update, if we have changed levels, then define the envelope
    lda current_level                                                 ; 3c0d: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3c0f: c5 51
    beq room_0_update_suspended_boulder_puzzle                        ; 3c11: f0 07
; level changed, define the envelope
    ldx #<envelope1                                                   ; 3c13: a2 08
    ldy #>envelope1                                                   ; 3c15: a0 45
    jsr define_envelope                                               ; 3c17: 20 5e 39

room_0_update_suspended_boulder_puzzle
    lda #0                                                            ; 3c1a: a9 00
    sta player_on_suspended_boulder_holding_object                    ; 3c1c: 8d dc 42
; check if in room 0
    lda desired_room_index                                            ; 3c1f: a5 30
    cmp #0                                                            ; 3c21: c9 00
    bne room_0_update_boulder_falling_progress                        ; 3c23: d0 2c
; check the player is holding something
    lda player_held_object_spriteid                                   ; 3c25: a5 52
    beq room_0_update_boulder_falling_progress                        ; 3c27: f0 28
; check the player Y coordinate is less than 64
    lda object_y_low                                                  ; 3c29: ad 7c 09
    cmp #$40 ; '@'                                                    ; 3c2c: c9 40
    bcs room_0_update_boulder_falling_progress                        ; 3c2e: b0 21
    lda object_x_high                                                 ; 3c30: ad 66 09
    bne room_0_update_boulder_falling_progress                        ; 3c33: d0 1c
; check the player X coordinate is between 96 and 127
    lda object_x_low                                                  ; 3c35: ad 50 09
    cmp #$60 ; '`'                                                    ; 3c38: c9 60
    bcc room_0_update_boulder_falling_progress                        ; 3c3a: 90 15
    cmp #$80                                                          ; 3c3c: c9 80
    bcs room_0_update_boulder_falling_progress                        ; 3c3e: b0 11
; with a bottom offset of 2 pixels, look if we are on the rope
    lda #2                                                            ; 3c40: a9 02
    sta temp_bottom_offset                                            ; 3c42: 8d 51 25
    lda #0                                                            ; 3c45: a9 00
    jsr get_solid_rock_collision_for_object_a                         ; 3c47: 20 94 28
    and #collision_map_rope                                           ; 3c4a: 29 02
    beq room_0_update_boulder_falling_progress                        ; 3c4c: f0 03
    dec player_on_suspended_boulder_holding_object                    ; 3c4e: ce dc 42

room_0_update_boulder_falling_progress
    lda save_game_level_b_room_0_falling_boulder_progress             ; 3c51: ad 08 0a
    sta falling_boulder_progress                                      ; 3c54: 8d d8 42
    ldy #$10                                                          ; 3c57: a0 10
    sty fallen_boulder_y                                              ; 3c59: 8c db 42
    lda #0                                                            ; 3c5c: a9 00
    ldx #$0d                                                          ; 3c5e: a2 0d
    ldy #8                                                            ; 3c60: a0 08
    jsr update_suspended_boulder_at_xy_in_room_a                      ; 3c62: 20 d2 41
    lda falling_boulder_progress                                      ; 3c65: ad d8 42
    sta save_game_level_b_room_0_falling_boulder_progress             ; 3c68: 8d 08 0a
    lda update_room_first_update_flag                                 ; 3c6b: ad 2b 13
    bne return2                                                       ; 3c6e: d0 10
    lda desired_room_index                                            ; 3c70: a5 30
    cmp #0                                                            ; 3c72: c9 00
    bne return2                                                       ; 3c74: d0 0a
    lda save_game_level_b_room_0_falling_boulder_progress             ; 3c76: ad 08 0a
    cmp #$10                                                          ; 3c79: c9 10
    bne return2                                                       ; 3c7b: d0 03
    jsr play_boulder_landing_sounds                                   ; 3c7d: 20 c1 41
return2
    rts                                                               ; 3c80: 60

; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 13                                                          ; 3c81: 0d                      ; initial player X cell
    !byte 20                                                          ; 3c82: 14                      ; initial player Y cell

; ########################################
; ########################################
; ######            #####           ######
; #####              ###             #####
; ####                |               ####
; ###                 |                ###
; ###                 |                ###
; ###                 |                ###
; ###                 |                ###
; ###                 |                ###
; ###                 |
; ###                 |
; ###                 |
; ###                 |    ####
; ###                 |    ####
; ###                 |              #####
; ###OOO                             #####
; ###OOO                           #######
; ###OOOOOO                        #######
; ###OOOOOO    P          ################
; #################       ################
; #################       ################
; ########################################
; ########################################
; set ground fill tile to use
room_1_code
    lda #<ground_fill_2x2_top_left                                    ; 3c83: a9 26
    sta source_sprite_memory_low                                      ; 3c85: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3c87: a9 45
    sta source_sprite_memory_high                                     ; 3c89: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3c8b: a2 00
    ldy #0                                                            ; 3c8d: a0 00
    lda #$ff                                                          ; 3c8f: a9 ff
    sta width_in_cells                                                ; 3c91: 85 3c
    lda #2                                                            ; 3c93: a9 02
    sta height_in_cells                                               ; 3c95: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c97: 20 bb 1a
; draw 6x1 rectangle at (0,2)
    ldy #2                                                            ; 3c9a: a0 02
    lda #6                                                            ; 3c9c: a9 06
    sta width_in_cells                                                ; 3c9e: 85 3c
    dec height_in_cells                                               ; 3ca0: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ca2: 20 bb 1a
; draw 6x1 rectangle at (34,2)
    ldx #$22 ; '"'                                                    ; 3ca5: a2 22
    jsr copy_rectangle_of_memory_to_screen                            ; 3ca7: 20 bb 1a
; draw 5x1 rectangle at (18,2)
    ldx #$12                                                          ; 3caa: a2 12
    dec width_in_cells                                                ; 3cac: c6 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3cae: 20 bb 1a
; draw 5x1 rectangle at (0,3)
    ldx #0                                                            ; 3cb1: a2 00
    iny                                                               ; 3cb3: c8
    lda #5                                                            ; 3cb4: a9 05
    sta width_in_cells                                                ; 3cb6: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3cb8: 20 bb 1a
; draw 5x1 rectangle at (35,3)
    ldx #$23 ; '#'                                                    ; 3cbb: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 3cbd: 20 bb 1a
; draw 3x1 rectangle at (19,3)
    ldx #$13                                                          ; 3cc0: a2 13
    lda #3                                                            ; 3cc2: a9 03
    sta width_in_cells                                                ; 3cc4: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3cc6: 20 bb 1a
; draw 4x1 rectangle at (0,4)
    ldx #0                                                            ; 3cc9: a2 00
    iny                                                               ; 3ccb: c8
    lda #4                                                            ; 3ccc: a9 04
    sta width_in_cells                                                ; 3cce: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3cd0: 20 bb 1a
; draw 4x1 rectangle at (36,4)
    ldx #$24 ; '$'                                                    ; 3cd3: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 3cd5: 20 bb 1a
; draw 4x5 rectangle at (37,5)
    inx                                                               ; 3cd8: e8
    iny                                                               ; 3cd9: c8
    lda #5                                                            ; 3cda: a9 05
    sta height_in_cells                                               ; 3cdc: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3cde: 20 bb 1a
; draw 3x255 rectangle at (0,5)
    ldx #0                                                            ; 3ce1: a2 00
    dec width_in_cells                                                ; 3ce3: c6 3c
    lda #$ff                                                          ; 3ce5: a9 ff
    sta height_in_cells                                               ; 3ce7: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ce9: 20 bb 1a
; draw 14x255 rectangle at (3,20)
    ldx #3                                                            ; 3cec: a2 03
    ldy #$14                                                          ; 3cee: a0 14
    lda #$0e                                                          ; 3cf0: a9 0e
    sta width_in_cells                                                ; 3cf2: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3cf4: 20 bb 1a
; draw 255x255 rectangle at (16,22)
    ldx #$10                                                          ; 3cf7: a2 10
    ldy #$16                                                          ; 3cf9: a0 16
    lda #$ff                                                          ; 3cfb: a9 ff
    sta width_in_cells                                                ; 3cfd: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3cff: 20 bb 1a
; draw 255x3 rectangle at (24,19)
    ldx #$18                                                          ; 3d02: a2 18
    ldy #$13                                                          ; 3d04: a0 13
    lda #3                                                            ; 3d06: a9 03
    sta height_in_cells                                               ; 3d08: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d0a: 20 bb 1a
; draw 255x2 rectangle at (33,17)
    ldx #$21 ; '!'                                                    ; 3d0d: a2 21
    ldy #$11                                                          ; 3d0f: a0 11
    lda #2                                                            ; 3d11: a9 02
    sta height_in_cells                                               ; 3d13: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d15: 20 bb 1a
; draw 255x2 rectangle at (35,15)
    ldx #$23 ; '#'                                                    ; 3d18: a2 23
    ldy #$0f                                                          ; 3d1a: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3d1c: 20 bb 1a
; draw 4x2 rectangle at (25,13)
    ldx #$19                                                          ; 3d1f: a2 19
    ldy #$0d                                                          ; 3d21: a0 0d
    lda #4                                                            ; 3d23: a9 04
    sta width_in_cells                                                ; 3d25: 85 3c
    lda #2                                                            ; 3d27: a9 02
    sta height_in_cells                                               ; 3d29: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d2b: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3d2e: 20 90 1b
; draw table at (6,18) of size (3x2)
    lda #3                                                            ; 3d31: a9 03
    sta width_in_cells                                                ; 3d33: 85 3c
    lda #2                                                            ; 3d35: a9 02
    sta height_in_cells                                               ; 3d37: 85 3d
    ldx #6                                                            ; 3d39: a2 06
    ldy #$12                                                          ; 3d3b: a0 12
    lda #spriteid_table                                               ; 3d3d: a9 d2
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3d3f: 20 57 1f
; draw table at (3,18) of size (3x2)
    ldx #3                                                            ; 3d42: a2 03
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3d44: 20 57 1f
; draw table at (3,16) of size (3x2)
    ldy #$10                                                          ; 3d47: a0 10
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3d49: 20 57 1f
; draw rope at (20,4) length 12
    ldx #$14                                                          ; 3d4c: a2 14
    ldy #4                                                            ; 3d4e: a0 04
    lda #$0c                                                          ; 3d50: a9 0c
    jsr draw_rope                                                     ; 3d52: 20 b9 1d
    jsr start_room                                                    ; 3d55: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 3d58: 20 da 12
    and #exit_room_right                                              ; 3d5b: 29 04
    beq room_1_game_update_loop                                       ; 3d5d: f0 f9
    ldx #0                                                            ; 3d5f: a2 00
    ldy current_level                                                 ; 3d61: a4 31
    jmp initialise_level_and_room                                     ; 3d63: 4c 40 11

room_1_update_handler
    lda #1                                                            ; 3d66: a9 01
    sta currently_updating_logic_for_room_index                       ; 3d68: 8d ba 1a
    lda #4                                                            ; 3d6b: a9 04
    ldx #$25 ; '%'                                                    ; 3d6d: a2 25
    ldy #7                                                            ; 3d6f: a0 07
    jsr update_brazier_and_fire                                       ; 3d71: 20 88 19
; update room 1 clock
    lda room_1_clock_repeat_counter                                   ; 3d74: ad 6f 0a
    sta clock_repeat_counter                                          ; 3d77: 8d 1e 3f
    lda room_1_clock_repeat_limit                                     ; 3d7a: ad 70 0a
    sta clock_repeat_limit                                            ; 3d7d: 8d 1f 3f
    lda room_1_pendulum_swing_index                                   ; 3d80: ad 71 0a
    sta pendulum_swing_index                                          ; 3d83: 8d 20 3f
    lda #1                                                            ; 3d86: a9 01
    ldx #$0c                                                          ; 3d88: a2 0c
    ldy #$0b                                                          ; 3d8a: a0 0b
    jsr update_clock                                                  ; 3d8c: 20 47 3e
    lda clock_repeat_counter                                          ; 3d8f: ad 1e 3f
    sta room_1_clock_repeat_counter                                   ; 3d92: 8d 6f 0a
    lda clock_repeat_limit                                            ; 3d95: ad 1f 3f
    sta room_1_clock_repeat_limit                                     ; 3d98: 8d 70 0a
    lda pendulum_swing_index                                          ; 3d9b: ad 20 3f
    sta room_1_pendulum_swing_index                                   ; 3d9e: 8d 71 0a
; check for first update (branch if not)
    lda update_room_first_update_flag                                 ; 3da1: ad 2b 13
    beq update_room_1_cuckoo                                          ; 3da4: f0 2b
; check for level change (branch if not)
    lda level_before_latest_level_and_room_initialisation             ; 3da6: a5 51
    cmp current_level                                                 ; 3da8: c5 31
    beq set_clock_workings_in_room_1                                  ; 3daa: f0 0a
; the level has changed. If we don't actually have the cuckoo, then reset any cuckoo
; progress to zero
    lda save_game_level_b_cuckoo_room_1_progress                      ; 3dac: ad 05 0a
    bmi set_clock_workings_in_room_1                                  ; 3daf: 30 05
    lda #0                                                            ; 3db1: a9 00
    sta save_game_level_b_cuckoo_room_1_progress                      ; 3db3: 8d 05 0a
set_clock_workings_in_room_1
    lda desired_room_index                                            ; 3db6: a5 30
    cmp #1                                                            ; 3db8: c9 01
    bne update_room_1_cuckooing_animation_local                       ; 3dba: d0 12
    ldx #objectid_clock_workings                                      ; 3dbc: a2 03
    jsr set_object_position_from_current_sprite_position              ; 3dbe: 20 6d 1f
    lda #1                                                            ; 3dc1: a9 01
    sta object_direction,x                                            ; 3dc3: 9d be 09
    lda #$ff                                                          ; 3dc6: a9 ff
    sta object_erase_type,x                                           ; 3dc8: 9d ac 38
    sta object_z_order,x                                              ; 3dcb: 9d c2 38
update_room_1_cuckooing_animation_local
    jmp update_room_1_cuckooing_animation                             ; 3dce: 4c 2b 3e

update_room_1_cuckoo
    lda save_game_level_b_cuckoo_room_1_progress                      ; 3dd1: ad 05 0a
    bmi update_room_1_cuckooing_animation                             ; 3dd4: 30 55
    beq room_1_increment_the_clock_timers                             ; 3dd6: f0 1b
    lda desired_room_index                                            ; 3dd8: a5 30
    cmp #1                                                            ; 3dda: c9 01
    bne update_room_1_cuckooing                                       ; 3ddc: d0 33
; check for collision in room 1 with cuckoo
    ldx #objectid_old_player                                          ; 3dde: a2 0b
    ldy #objectid_clock_workings                                      ; 3de0: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 3de2: 20 e2 28
    beq update_room_1_cuckooing                                       ; 3de5: f0 2a
    lda #spriteid_cuckoo_menu_item                                    ; 3de7: a9 d4
    jsr find_or_create_menu_slot_for_A                                ; 3de9: 20 bd 2b
    lda #$ff                                                          ; 3dec: a9 ff
    sta save_game_level_b_cuckoo_room_1_progress                      ; 3dee: 8d 05 0a
    bmi update_room_1_cuckooing_animation                             ; 3df1: 30 38
room_1_increment_the_clock_timers
    lda room_1_clock_repeat_counter                                   ; 3df3: ad 6f 0a
    cmp #3                                                            ; 3df6: c9 03
    bcc update_room_1_cuckooing_animation                             ; 3df8: 90 31
    lda room_1_clock_repeat_limit                                     ; 3dfa: ad 70 0a
    sec                                                               ; 3dfd: 38
    sbc room_1_clock_repeat_counter                                   ; 3dfe: ed 6f 0a
    cmp #3                                                            ; 3e01: c9 03
    bcc update_room_1_cuckooing_animation                             ; 3e03: 90 26
    lda room_1_clock_repeat_counter                                   ; 3e05: ad 6f 0a
    and #3                                                            ; 3e08: 29 03
    bne update_room_1_cuckooing_animation                             ; 3e0a: d0 1f
    lda room_1_pendulum_swing_index                                   ; 3e0c: ad 71 0a
    bne update_room_1_cuckooing_animation                             ; 3e0f: d0 1a
update_room_1_cuckooing
    ldy save_game_level_b_cuckoo_room_1_progress                      ; 3e11: ac 05 0a
    iny                                                               ; 3e14: c8
    cpy #6                                                            ; 3e15: c0 06
    bcc save_cuckooing_progress                                       ; 3e17: 90 02
    ldy #0                                                            ; 3e19: a0 00
save_cuckooing_progress
    sty save_game_level_b_cuckoo_room_1_progress                      ; 3e1b: 8c 05 0a
    lda desired_room_index                                            ; 3e1e: a5 30
    cmp #1                                                            ; 3e20: c9 01
    bne update_room_1_cuckooing_animation                             ; 3e22: d0 07
    cpy #2                                                            ; 3e24: c0 02
    bne update_room_1_cuckooing_animation                             ; 3e26: d0 03
    jsr play_cuckoo_two_sounds                                        ; 3e28: 20 82 3f
update_room_1_cuckooing_animation
    lda desired_room_index                                            ; 3e2b: a5 30
    cmp #1                                                            ; 3e2d: c9 01
    bne return9                                                       ; 3e2f: d0 0f
    ldy save_game_level_b_cuckoo_room_1_progress                      ; 3e31: ac 05 0a
    bpl set_cuckooing_animation_to_index_y                            ; 3e34: 10 04
    lda #spriteid_clock_workings                                      ; 3e36: a9 d1
    bne set_cuckooing_animation_spriteid                              ; 3e38: d0 03                   ; ALWAYS branch

set_cuckooing_animation_to_index_y
    lda cuckooing_spriteid_table,y                                    ; 3e3a: b9 41 3e
set_cuckooing_animation_spriteid
    sta object_spriteid + objectid_clock_workings                     ; 3e3d: 8d ab 09
return9
    rts                                                               ; 3e40: 60

cuckooing_spriteid_table
    !byte         spriteid_vertical_rod                               ; 3e41: ce
    !byte spriteid_cuckoo_appear_partly                               ; 3e42: cf
    !byte   spriteid_cuckoo_appear_full                               ; 3e43: d0
    !byte   spriteid_cuckoo_appear_full                               ; 3e44: d0
    !byte   spriteid_cuckoo_appear_full                               ; 3e45: d0
    !byte spriteid_cuckoo_appear_partly                               ; 3e46: cf

update_clock
    sta currently_updating_logic_for_room_index                       ; 3e47: 8d ba 1a
    lda update_room_first_update_flag                                 ; 3e4a: ad 2b 13
    beq update_clock_not_first_update                                 ; 3e4d: f0 4e
; first update in room
    lda current_level                                                 ; 3e4f: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3e51: c5 51
    beq update_clock_first_update_same_level                          ; 3e53: f0 0b
; changed level, so reset clock (reset pendulum swings)
    lda #0                                                            ; 3e55: a9 00
    sta clock_repeat_counter                                          ; 3e57: 8d 1e 3f
    sta clock_repeat_limit                                            ; 3e5a: 8d 1f 3f
    sta pendulum_swing_index                                          ; 3e5d: 8d 20 3f
update_clock_first_update_same_level
    lda desired_room_index                                            ; 3e60: a5 30
    cmp currently_updating_logic_for_room_index                       ; 3e62: cd ba 1a
    bne update_swinging_pendulum_local                                ; 3e65: d0 33
; player is in the same room as the clock. Draw the clock.
    lda #4                                                            ; 3e67: a9 04
    sta temp_sprite_x_offset                                          ; 3e69: 85 3a
    lda #spriteid_clock                                               ; 3e6b: a9 c8
    jsr draw_sprite_a_at_cell_xy                                      ; 3e6d: 20 4c 1f
; write clock to collison map
    dex                                                               ; 3e70: ca
    dey                                                               ; 3e71: 88
    dey                                                               ; 3e72: 88
    dey                                                               ; 3e73: 88
    lda #3                                                            ; 3e74: a9 03
    sta width_in_cells                                                ; 3e76: 85 3c
    sta height_in_cells                                               ; 3e78: 85 3d
    lda #collision_map_solid_rock                                     ; 3e7a: a9 03
    sta value_to_write_to_collision_map                               ; 3e7c: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e7e: 20 44 1e
    ldx #2                                                            ; 3e81: a2 02
    jsr set_object_position_from_current_sprite_position              ; 3e83: 20 6d 1f
    lda #1                                                            ; 3e86: a9 01
    sta object_direction,x                                            ; 3e88: 9d be 09
    lda #$ff                                                          ; 3e8b: a9 ff
    sta object_erase_type,x                                           ; 3e8d: 9d ac 38
    sta object_z_order,x                                              ; 3e90: 9d c2 38
    ldx #<envelope2                                                   ; 3e93: a2 cc
    ldy #>envelope2                                                   ; 3e95: a0 44
    jsr define_envelope                                               ; 3e97: 20 5e 39
update_swinging_pendulum_local
    jmp finish_swinging_pendulum                                      ; 3e9a: 4c fd 3e

update_clock_not_first_update
    lda desired_room_index                                            ; 3e9d: a5 30
    cmp currently_updating_logic_for_room_index                       ; 3e9f: cd ba 1a
    bne update_swinging_pendulum                                      ; 3ea2: d0 12
    ldx #objectid_old_player                                          ; 3ea4: a2 0b
    ldy #objectid_pendulum                                            ; 3ea6: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 3ea8: 20 e2 28
    beq update_swinging_pendulum                                      ; 3eab: f0 09
; add to clock counter
    lda clock_repeat_counter                                          ; 3ead: ad 1e 3f
    clc                                                               ; 3eb0: 18
    adc #$10                                                          ; 3eb1: 69 10
    sta clock_repeat_limit                                            ; 3eb3: 8d 1f 3f
update_swinging_pendulum
    ldy #0                                                            ; 3eb6: a0 00
    lda clock_repeat_counter                                          ; 3eb8: ad 1e 3f
    cmp clock_repeat_limit                                            ; 3ebb: cd 1f 3f
    beq finish_swinging_pendulum                                      ; 3ebe: f0 3d
    ldy pendulum_swing_index                                          ; 3ec0: ac 20 3f
    iny                                                               ; 3ec3: c8
    cpy #$0a                                                          ; 3ec4: c0 0a
    bcc still_mid_swing                                               ; 3ec6: 90 05
    ldy #0                                                            ; 3ec8: a0 00
    inc clock_repeat_counter                                          ; 3eca: ee 1e 3f
still_mid_swing
    sty pendulum_swing_index                                          ; 3ecd: 8c 20 3f
    lda desired_room_index                                            ; 3ed0: a5 30
    cmp currently_updating_logic_for_room_index                       ; 3ed2: cd ba 1a
    bne finish_swinging_pendulum                                      ; 3ed5: d0 26
    cpy #2                                                            ; 3ed7: c0 02
    bne check_for_clock_tock                                          ; 3ed9: d0 0c
; clock tick
    lda #0                                                            ; 3edb: a9 00
    ldx #<sound_tick                                                  ; 3edd: a2 e2
    ldy #>sound_tick                                                  ; 3edf: a0 44
    jsr play_sound_yx                                                 ; 3ee1: 20 f6 38
    jmp clock_bass                                                    ; 3ee4: 4c f4 3e

check_for_clock_tock
    cpy #7                                                            ; 3ee7: c0 07
    bne finish_swinging_pendulum                                      ; 3ee9: d0 12
; clock tock
    lda #0                                                            ; 3eeb: a9 00
    ldx #<sound_tock                                                  ; 3eed: a2 ea
    ldy #>sound_tock                                                  ; 3eef: a0 44
    jsr play_sound_yx                                                 ; 3ef1: 20 f6 38
clock_bass
    lda #0                                                            ; 3ef4: a9 00
    ldx #<sound_clock_bass                                            ; 3ef6: a2 da
    ldy #>sound_clock_bass                                            ; 3ef8: a0 44
    jsr play_sound_yx                                                 ; 3efa: 20 f6 38
finish_swinging_pendulum
    lda desired_room_index                                            ; 3efd: a5 30
    cmp currently_updating_logic_for_room_index                       ; 3eff: cd ba 1a
    bne check_for_end_of_clock_ticking                                ; 3f02: d0 09
    ldy pendulum_swing_index                                          ; 3f04: ac 20 3f
    lda swinging_pendulum_spriteids,y                                 ; 3f07: b9 21 3f
    sta object_spriteid + objectid_pendulum                           ; 3f0a: 8d aa 09
check_for_end_of_clock_ticking
    lda clock_repeat_counter                                          ; 3f0d: ad 1e 3f
    cmp clock_repeat_limit                                            ; 3f10: cd 1f 3f
    bne return10                                                      ; 3f13: d0 08
    lda #0                                                            ; 3f15: a9 00
    sta clock_repeat_counter                                          ; 3f17: 8d 1e 3f
    sta clock_repeat_limit                                            ; 3f1a: 8d 1f 3f
return10
    rts                                                               ; 3f1d: 60

clock_repeat_counter
    !byte 0                                                           ; 3f1e: 00
clock_repeat_limit
    !byte 0                                                           ; 3f1f: 00
pendulum_swing_index
    !byte 0                                                           ; 3f20: 00
swinging_pendulum_spriteids
    !byte spriteid_pendulum1                                          ; 3f21: c9
    !byte spriteid_pendulum2                                          ; 3f22: ca
    !byte spriteid_pendulum3                                          ; 3f23: cb
    !byte spriteid_pendulum3                                          ; 3f24: cb
    !byte spriteid_pendulum2                                          ; 3f25: ca
    !byte spriteid_pendulum1                                          ; 3f26: c9
    !byte spriteid_pendulum4                                          ; 3f27: cc
    !byte spriteid_pendulum5                                          ; 3f28: cd
    !byte spriteid_pendulum5                                          ; 3f29: cd
    !byte spriteid_pendulum4                                          ; 3f2a: cc

cuckoo_tweeting_spriteids
    !byte spriteid_cuckoo_open_beak                                   ; 3f2b: d6
    !byte spriteid_cuckoo_open_beak                                   ; 3f2c: d6
    !byte spriteid_cuckoo_open_beak                                   ; 3f2d: d6
    !byte spriteid_cuckoo                                             ; 3f2e: d3

update_playing_cuckoo_handler
    lda update_room_first_update_flag                                 ; 3f2f: ad 2b 13
    beq update_playing_cuckoo_not_first_update                        ; 3f32: f0 1f
    lda current_level                                                 ; 3f34: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3f36: c5 51
    beq initialise_cuckoo                                             ; 3f38: f0 05
    lda #0                                                            ; 3f3a: a9 00
    sta player_playing_cuckoo_progress                                ; 3f3c: 8d 75 0a
initialise_cuckoo
    ldx #<envelope3                                                   ; 3f3f: a2 ae
    ldy #>envelope3                                                   ; 3f41: a0 44
    jsr define_envelope                                               ; 3f43: 20 5e 39
    lda #spriteid_cuckoo_menu_item                                    ; 3f46: a9 d4
    sta toolbar_collectable_spriteids+1                               ; 3f48: 8d e9 2e
    lda #spriteid_cuckoo                                              ; 3f4b: a9 d3
    sta collectable_spriteids+1                                       ; 3f4d: 8d ee 2e
    jmp set_cuckoo_sprite                                             ; 3f50: 4c 6d 3f

update_playing_cuckoo_not_first_update
    lda #spriteid_cuckoo_menu_item                                    ; 3f53: a9 d4
    cmp player_using_object_spriteid                                  ; 3f55: cd b6 2e
    beq player_using_cuckoo                                           ; 3f58: f0 08
    lda #0                                                            ; 3f5a: a9 00
    sta player_playing_cuckoo_progress                                ; 3f5c: 8d 75 0a
    jmp set_cuckoo_sprite                                             ; 3f5f: 4c 6d 3f

player_using_cuckoo
    ldy player_playing_cuckoo_progress                                ; 3f62: ac 75 0a
    cpy #3                                                            ; 3f65: c0 03
    beq set_cuckoo_sprite                                             ; 3f67: f0 04
    iny                                                               ; 3f69: c8
    sty player_playing_cuckoo_progress                                ; 3f6a: 8c 75 0a
set_cuckoo_sprite
    ldy player_playing_cuckoo_progress                                ; 3f6d: ac 75 0a
    lda cuckoo_tweeting_spriteids,y                                   ; 3f70: b9 2b 3f
    sta collectable_being_used_spriteids + 1                          ; 3f73: 8d f3 2e
    lda update_room_first_update_flag                                 ; 3f76: ad 2b 13
    bne return3                                                       ; 3f79: d0 06
    dey                                                               ; 3f7b: 88
    bne return3                                                       ; 3f7c: d0 03
    jsr play_cuckoo_two_sounds                                        ; 3f7e: 20 82 3f
return3
    rts                                                               ; 3f81: 60

play_cuckoo_two_sounds
    lda #0                                                            ; 3f82: a9 00
    ldx #<sound_cuckoo1                                               ; 3f84: a2 bc
    ldy #>sound_cuckoo1                                               ; 3f86: a0 44
    jsr play_sound_yx                                                 ; 3f88: 20 f6 38
    ldx #<sound_cuckoo2                                               ; 3f8b: a2 c4
    ldy #>sound_cuckoo2                                               ; 3f8d: a0 44
    jsr play_sound_yx                                                 ; 3f8f: 20 f6 38
    rts                                                               ; 3f92: 60

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 14                                                          ; 3f93: 0e                      ; initial player X cell
    !byte 20                                                          ; 3f94: 14                      ; initial player Y cell

; ########################################
; ########################################
; ######   |        #####           ######
; #####    |         ###             #####
; ####     |                          ####
; ###      |                           ###
; ###      |                           ###
; ###      |                           ###
; ###      |                           ###
; ###      |
; ###      |
; ###      |
; ###      |
;          |
;          |
;          |                         #####
;          |                         #####
;          |                         #####
; #####              OOO    OOOOOOOOO#####
; #####         P    OOO    OOOOOOOOO#####
; ########################################
; ########################################
; ########################################
; ########################################
; set ground fill tile to use
room_2_code
    lda #<ground_fill_2x2_top_left                                    ; 3f95: a9 26
    sta source_sprite_memory_low                                      ; 3f97: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3f99: a9 45
    sta source_sprite_memory_high                                     ; 3f9b: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3f9d: a2 00
    ldy #0                                                            ; 3f9f: a0 00
    lda #$ff                                                          ; 3fa1: a9 ff
    sta width_in_cells                                                ; 3fa3: 85 3c
    lda #2                                                            ; 3fa5: a9 02
    sta height_in_cells                                               ; 3fa7: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fa9: 20 bb 1a
; draw 6x1 rectangle at (0,2)
    ldy #2                                                            ; 3fac: a0 02
    lda #6                                                            ; 3fae: a9 06
    sta width_in_cells                                                ; 3fb0: 85 3c
    dec height_in_cells                                               ; 3fb2: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fb4: 20 bb 1a
; draw 6x1 rectangle at (34,2)
    ldx #$22 ; '"'                                                    ; 3fb7: a2 22
    jsr copy_rectangle_of_memory_to_screen                            ; 3fb9: 20 bb 1a
; draw 5x1 rectangle at (18,2)
    ldx #$12                                                          ; 3fbc: a2 12
    dec width_in_cells                                                ; 3fbe: c6 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3fc0: 20 bb 1a
; draw 5x1 rectangle at (0,3)
    ldx #0                                                            ; 3fc3: a2 00
    iny                                                               ; 3fc5: c8
    lda #5                                                            ; 3fc6: a9 05
    sta width_in_cells                                                ; 3fc8: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3fca: 20 bb 1a
; draw 5x1 rectangle at (35,3)
    ldx #$23 ; '#'                                                    ; 3fcd: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 3fcf: 20 bb 1a
; draw 3x1 rectangle at (19,3)
    ldx #$13                                                          ; 3fd2: a2 13
    lda #3                                                            ; 3fd4: a9 03
    sta width_in_cells                                                ; 3fd6: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3fd8: 20 bb 1a
; draw 4x1 rectangle at (0,4)
    ldx #0                                                            ; 3fdb: a2 00
    iny                                                               ; 3fdd: c8
    lda #4                                                            ; 3fde: a9 04
    sta width_in_cells                                                ; 3fe0: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3fe2: 20 bb 1a
; draw 4x1 rectangle at (36,4)
    ldx #$24 ; '$'                                                    ; 3fe5: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 3fe7: 20 bb 1a
; draw 4x4 rectangle at (37,5)
    inx                                                               ; 3fea: e8
    iny                                                               ; 3feb: c8
    lda #4                                                            ; 3fec: a9 04
    sta height_in_cells                                               ; 3fee: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ff0: 20 bb 1a
; draw 3x8 rectangle at (0,5)
    ldx #0                                                            ; 3ff3: a2 00
    dec width_in_cells                                                ; 3ff5: c6 3c
    lda #8                                                            ; 3ff7: a9 08
    sta height_in_cells                                               ; 3ff9: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ffb: 20 bb 1a
; draw 5x2 rectangle at (0,18)
    ldy #$12                                                          ; 3ffe: a0 12
    lda #5                                                            ; 4000: a9 05
    sta width_in_cells                                                ; 4002: 85 3c
    lda #2                                                            ; 4004: a9 02
    sta height_in_cells                                               ; 4006: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4008: 20 bb 1a
; draw 255x255 rectangle at (0,20)
    ldy #$14                                                          ; 400b: a0 14
    lda #$ff                                                          ; 400d: a9 ff
    sta width_in_cells                                                ; 400f: 85 3c
    sta height_in_cells                                               ; 4011: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4013: 20 bb 1a
; draw 255x5 rectangle at (35,15)
    ldx #$23 ; '#'                                                    ; 4016: a2 23
    ldy #$0f                                                          ; 4018: a0 0f
    lda #5                                                            ; 401a: a9 05
    sta height_in_cells                                               ; 401c: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 401e: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 4021: 20 90 1b
; draw rope at (9,2) length 16
    ldx #9                                                            ; 4024: a2 09
    ldy #2                                                            ; 4026: a0 02
    lda #$10                                                          ; 4028: a9 10
    jsr draw_rope                                                     ; 402a: 20 b9 1d
; draw boulder at (19,18) of size (3x2)
    lda #3                                                            ; 402d: a9 03
    sta width_in_cells                                                ; 402f: 85 3c
    lda #2                                                            ; 4031: a9 02
    sta height_in_cells                                               ; 4033: 85 3d
    ldx #$13                                                          ; 4035: a2 13
    ldy #$12                                                          ; 4037: a0 12
    lda #spriteid_boulder                                             ; 4039: a9 d5
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 403b: 20 57 1f
; draw boulder at (26,18) of size (3x2)
    ldx #$1a                                                          ; 403e: a2 1a
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 4040: 20 57 1f
; draw boulder at (29,18) of size (3x2)
    ldx #$1d                                                          ; 4043: a2 1d
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 4045: 20 57 1f
; draw boulder at (32,18) of size (3x2)
    ldx #$20 ; ' '                                                    ; 4048: a2 20
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 404a: 20 57 1f
    jsr start_room                                                    ; 404d: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 4050: 20 da 12
    sta room_exit_direction                                           ; 4053: 85 70
    and #exit_room_left                                               ; 4055: 29 01
    beq room_2_check_right_exit                                       ; 4057: f0 07
    ldx #0                                                            ; 4059: a2 00
    ldy current_level                                                 ; 405b: a4 31
    jmp initialise_level_and_room                                     ; 405d: 4c 40 11

room_2_check_right_exit
    lda room_exit_direction                                           ; 4060: a5 70
    and #exit_room_right                                              ; 4062: 29 04
    beq room_2_game_update_loop                                       ; 4064: f0 ea
    ldx #3                                                            ; 4066: a2 03
    ldy current_level                                                 ; 4068: a4 31
    jmp initialise_level_and_room                                     ; 406a: 4c 40 11

; update room 2 clock
room_2_update_handler
    lda room_2_clock_repeat_counter                                   ; 406d: ad 72 0a
    sta clock_repeat_counter                                          ; 4070: 8d 1e 3f
    lda room_2_clock_repeat_limit                                     ; 4073: ad 73 0a
    sta clock_repeat_limit                                            ; 4076: 8d 1f 3f
    lda room_2_pendulum_swing_index                                   ; 4079: ad 74 0a
    sta pendulum_swing_index                                          ; 407c: 8d 20 3f
    lda #2                                                            ; 407f: a9 02
    ldx #$0d                                                          ; 4081: a2 0d
    ldy #$0b                                                          ; 4083: a0 0b
    jsr update_clock                                                  ; 4085: 20 47 3e
    lda clock_repeat_counter                                          ; 4088: ad 1e 3f
    sta room_2_clock_repeat_counter                                   ; 408b: 8d 72 0a
    lda clock_repeat_limit                                            ; 408e: ad 1f 3f
    sta room_2_clock_repeat_limit                                     ; 4091: 8d 73 0a
    lda pendulum_swing_index                                          ; 4094: ad 20 3f
    sta room_2_pendulum_swing_index                                   ; 4097: 8d 74 0a
; check for first update
    lda update_room_first_update_flag                                 ; 409a: ad 2b 13
    beq room_2_update_clock_puzzle                                    ; 409d: f0 39
; first update. check for level change
    lda current_level                                                 ; 409f: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 40a1: c5 51
    beq room_2_draw_clock_workings                                    ; 40a3: f0 0c
; level changed. if cuckoo in room 2 had enough progress, then set as completed.
    lda save_game_level_b_cuckoo_room_2_progress                      ; 40a5: ad 06 0a
    cmp #2                                                            ; 40a8: c9 02
    bcc room_2_draw_clock_workings                                    ; 40aa: 90 05
    lda #$ff                                                          ; 40ac: a9 ff
    sta save_game_level_b_cuckoo_room_2_progress                      ; 40ae: 8d 06 0a
room_2_draw_clock_workings
    lda desired_room_index                                            ; 40b1: a5 30
    cmp #2                                                            ; 40b3: c9 02
    bne skip_draw_workings                                            ; 40b5: d0 1e
    ldx #$0d                                                          ; 40b7: a2 0d
    ldy #$0b                                                          ; 40b9: a0 0b
    lda #4                                                            ; 40bb: a9 04
    sta temp_sprite_x_offset                                          ; 40bd: 85 3a
    lda #spriteid_clock_workings                                      ; 40bf: a9 d1
    jsr draw_sprite_a_at_cell_xy                                      ; 40c1: 20 4c 1f
    ldx #objectid_clock_workings                                      ; 40c4: a2 03
    lda #1                                                            ; 40c6: a9 01
    sta object_direction,x                                            ; 40c8: 9d be 09
    lda #$c0                                                          ; 40cb: a9 c0
    sta object_z_order,x                                              ; 40cd: 9d c2 38
    lda #spriteid_cache1                                              ; 40d0: a9 d7
    sta object_erase_type,x                                           ; 40d2: 9d ac 38
skip_draw_workings
    jmp room_2_update_clock_workings                                  ; 40d5: 4c 52 41

room_2_update_clock_puzzle
    lda save_game_level_b_cuckoo_room_2_progress                      ; 40d8: ad 06 0a
    bmi room_2_update_clock_workings                                  ; 40db: 30 75
    cmp #1                                                            ; 40dd: c9 01
    beq room_2_update_cuckoo_in_clock                                 ; 40df: f0 46
    bcs room_2_update_cuckoo_being_thrown_into_room_3                 ; 40e1: b0 5d
; check in room 2
    lda desired_room_index                                            ; 40e3: a5 30
    cmp #2                                                            ; 40e5: c9 02
    bne room_2_update_clock_workings                                  ; 40e7: d0 69
; check player is using the cuckoo on the clock (in room 2)
    lda player_using_object_spriteid                                  ; 40e9: ad b6 2e
    cmp #spriteid_cuckoo_menu_item                                    ; 40ec: c9 d4
    bne room_2_update_clock_workings                                  ; 40ee: d0 62
    lda object_y_low                                                  ; 40f0: ad 7c 09
    cmp #$40 ; '@'                                                    ; 40f3: c9 40
    bcs room_2_update_clock_workings                                  ; 40f5: b0 5b
    lda #2                                                            ; 40f7: a9 02
    sta temp_bottom_offset                                            ; 40f9: 8d 51 25
    lda #0                                                            ; 40fc: a9 00
    jsr get_solid_rock_collision_for_object_a                         ; 40fe: 20 94 28
    and #2                                                            ; 4101: 29 02
    beq room_2_update_clock_workings                                  ; 4103: f0 4d
; remove cuckoo from the toolbar and player's hand, increment progress, and reset
; wizard animation state
    lda #spriteid_cuckoo_menu_item                                    ; 4105: a9 d4
    jsr remove_item_from_toolbar_menu                                 ; 4107: 20 e0 2b
    lda #1                                                            ; 410a: a9 01
    sta save_game_level_b_cuckoo_room_2_progress                      ; 410c: 8d 06 0a
    lda #0                                                            ; 410f: a9 00
    sta player_held_object_spriteid                                   ; 4111: 85 52
    sta object_spriteid + objectid_player_accessory                   ; 4113: 8d a9 09
    lda player_using_object_spriteid                                  ; 4116: ad b6 2e
    cmp #spriteid_cuckoo_menu_item                                    ; 4119: c9 d4
    bne room_2_update_cuckoo_in_clock                                 ; 411b: d0 0a
    lda #0                                                            ; 411d: a9 00
    sta player_using_object_spriteid                                  ; 411f: 8d b6 2e
    lda #spriteid_wizard7                                             ; 4122: a9 36
    sta object_spriteid                                               ; 4124: 8d a8 09
; check if clock in room 2 is running (branch if not)
room_2_update_cuckoo_in_clock
    lda room_2_clock_repeat_counter                                   ; 4127: ad 72 0a
    cmp room_2_clock_repeat_limit                                     ; 412a: cd 73 0a
    beq room_2_update_clock_workings                                  ; 412d: f0 23
; mark the cuckoo in room 2 as launched
    lda #$0f                                                          ; 412f: a9 0f
    sta save_game_level_b_cuckoo_room_2_progress                      ; 4131: 8d 06 0a
; if player is in room 2 then play the cuckoo sound
    lda desired_room_index                                            ; 4134: a5 30
    cmp #2                                                            ; 4136: c9 02
    bne room_2_update_clock_workings                                  ; 4138: d0 18
    jsr play_cuckoo_two_sounds                                        ; 413a: 20 82 3f
    jmp room_2_update_clock_workings                                  ; 413d: 4c 52 41

room_2_update_cuckoo_being_thrown_into_room_3
    lda save_game_level_b_cuckoo_room_2_progress                      ; 4140: ad 06 0a
    clc                                                               ; 4143: 18
    adc #2                                                            ; 4144: 69 02
    sta save_game_level_b_cuckoo_room_2_progress                      ; 4146: 8d 06 0a
    cmp #$28 ; '('                                                    ; 4149: c9 28
    bcc room_2_update_clock_workings                                  ; 414b: 90 05
; cuckoo finished being thrown animation, now in room 3
    lda #$ff                                                          ; 414d: a9 ff
    sta save_game_level_b_cuckoo_room_2_progress                      ; 414f: 8d 06 0a

room_2_update_clock_workings
    lda desired_room_index                                            ; 4152: a5 30
    cmp #2                                                            ; 4154: c9 02
    bne room_2_update_suspended_boulder_puzzle                        ; 4156: d0 2a
    lda #0                                                            ; 4158: a9 00
    sta object_spriteid + objectid_clock_workings                     ; 415a: 8d ab 09
    lda save_game_level_b_cuckoo_room_2_progress                      ; 415d: ad 06 0a
    bmi room_2_update_suspended_boulder_puzzle                        ; 4160: 30 20
    cmp #2                                                            ; 4162: c9 02
    bcc room_2_update_suspended_boulder_puzzle                        ; 4164: 90 1c
    tax                                                               ; 4166: aa
    lda #5                                                            ; 4167: a9 05
    sta temp_sprite_x_offset                                          ; 4169: 85 3a
    ldy #9                                                            ; 416b: a0 09
    sta temp_sprite_y_offset                                          ; 416d: 85 3b
    lda #objectid_clock_workings                                      ; 416f: a9 03
    jsr set_object_position_from_cell_xy                              ; 4171: 20 5d 1f
    lda #spriteid_cuckoo_open_beak                                    ; 4174: a9 d6
    sta object_spriteid + objectid_clock_workings                     ; 4176: 8d ab 09
    cpx #$15                                                          ; 4179: e0 15
    bcc room_2_update_suspended_boulder_puzzle                        ; 417b: 90 05
    lda #spriteid_cuckoo                                              ; 417d: a9 d3
    sta object_spriteid + objectid_clock_workings                     ; 417f: 8d ab 09

room_2_update_suspended_boulder_puzzle
    lda #0                                                            ; 4182: a9 00
    sta player_on_suspended_boulder_holding_object                    ; 4184: 8d dc 42
    lda save_game_level_b_cuckoo_room_2_progress                      ; 4187: ad 06 0a
    cmp #$1b                                                          ; 418a: c9 1b
    bcc room_2_update_boulder_falling_progress                        ; 418c: 90 03
    dec player_on_suspended_boulder_holding_object                    ; 418e: ce dc 42
room_2_update_boulder_falling_progress
    lda save_game_level_b_room_2_falling_boulder_progress             ; 4191: ad 07 0a
    sta falling_boulder_progress                                      ; 4194: 8d d8 42
    ldy #$10                                                          ; 4197: a0 10
    sty fallen_boulder_y                                              ; 4199: 8c db 42
    lda #2                                                            ; 419c: a9 02
    ldx #$1b                                                          ; 419e: a2 1b
    ldy #$0b                                                          ; 41a0: a0 0b
    jsr update_suspended_boulder_at_xy_in_room_a                      ; 41a2: 20 d2 41
    lda falling_boulder_progress                                      ; 41a5: ad d8 42
    sta save_game_level_b_room_2_falling_boulder_progress             ; 41a8: 8d 07 0a
    lda update_room_first_update_flag                                 ; 41ab: ad 2b 13
    bne return6                                                       ; 41ae: d0 10
    lda desired_room_index                                            ; 41b0: a5 30
    cmp #2                                                            ; 41b2: c9 02
    bne return6                                                       ; 41b4: d0 0a
    lda save_game_level_b_room_2_falling_boulder_progress             ; 41b6: ad 07 0a
    cmp #$10                                                          ; 41b9: c9 10
    bne return6                                                       ; 41bb: d0 03
    jsr play_boulder_landing_sounds                                   ; 41bd: 20 c1 41
return6
    rts                                                               ; 41c0: 60

play_boulder_landing_sounds
    lda #0                                                            ; 41c1: a9 00
    ldx #<sound6                                                      ; 41c3: a2 1e
    ldy #>sound6                                                      ; 41c5: a0 45
    jsr play_sound_yx                                                 ; 41c7: 20 f6 38
    ldx #<sound7                                                      ; 41ca: a2 16
    ldy #>sound7                                                      ; 41cc: a0 45
    jsr play_sound_yx                                                 ; 41ce: 20 f6 38
    rts                                                               ; 41d1: 60

update_suspended_boulder_at_xy_in_room_a
    sta currently_updating_logic_for_room_index                       ; 41d2: 8d ba 1a
    stx suspended_boulder_x                                           ; 41d5: 8e d9 42
    sty suspended_boulder_y                                           ; 41d8: 8c da 42
; branch if not the first room update
    lda update_room_first_update_flag                                 ; 41db: ad 2b 13
    beq update_falling_boulder                                        ; 41de: f0 4d
; check if level just changed
    lda current_level                                                 ; 41e0: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 41e2: c5 51
    beq room_2_initialise_suspended_boulder                           ; 41e4: f0 0a
; new level, finish any falling boulder progress immediately
    lda falling_boulder_progress                                      ; 41e6: ad d8 42
    beq room_2_initialise_suspended_boulder                           ; 41e9: f0 05
    lda #$ff                                                          ; 41eb: a9 ff
    sta falling_boulder_progress                                      ; 41ed: 8d d8 42
room_2_initialise_suspended_boulder
    lda desired_room_index                                            ; 41f0: a5 30
    cmp currently_updating_logic_for_room_index                       ; 41f2: cd ba 1a
    bne update_rope_sprites_and_boulder_collision_map_local           ; 41f5: d0 30
; draw rope above boulder
    ldx suspended_boulder_x                                           ; 41f7: ae d9 42
    ldy #2                                                            ; 41fa: a0 02
    lda suspended_boulder_y                                           ; 41fc: ad da 42
    sec                                                               ; 41ff: 38
    sbc #3                                                            ; 4200: e9 03
    jsr draw_rope                                                     ; 4202: 20 b9 1d
    ldy suspended_boulder_y                                           ; 4205: ac da 42
    dey                                                               ; 4208: 88
    dey                                                               ; 4209: 88
    lda #sprite_op_flags_erase_to_fg_colour                           ; 420a: a9 04
    sta sprite_op_flags                                               ; 420c: 85 15
    lda #spriteid_rope_end                                            ; 420e: a9 0a
    jsr draw_sprite_a_at_cell_xy                                      ; 4210: 20 4c 1f
    lda #objectid_rope_broken_top_end                                 ; 4213: a9 05
    jsr set_object_position_from_cell_xy                              ; 4215: 20 5d 1f
; set boulder sprite for object
    lda #spriteid_boulder                                             ; 4218: a9 d5
    sta object_spriteid + objectid_suspended_boulder                  ; 421a: 8d ac 09
; broken rope in front of boulder needs offscreen cache
    lda #spriteid_cache2                                              ; 421d: a9 d8
    sta object_erase_type + objectid_rope_broken_bottom_end           ; 421f: 8d b2 38
    lda #$e0                                                          ; 4222: a9 e0
    sta object_z_order + objectid_rope_broken_bottom_end              ; 4224: 8d c8 38
update_rope_sprites_and_boulder_collision_map_local
    jmp update_rope_sprites_and_boulder_collision_map                 ; 4227: 4c 7f 42

return7_local
    jmp return7                                                       ; 422a: 4c d7 42

update_falling_boulder
    lda falling_boulder_progress                                      ; 422d: ad d8 42
    bmi return7_local                                                 ; 4230: 30 f8
    bne boulder_is_falling                                            ; 4232: d0 12
; is the player on the boulder and holding an object?
    lda player_on_suspended_boulder_holding_object                    ; 4234: ad dc 42
    beq return7_local                                                 ; 4237: f0 f1
; start the boulder falling
    lda suspended_boulder_y                                           ; 4239: ad da 42
    sta falling_boulder_progress                                      ; 423c: 8d d8 42
    lda desired_room_index                                            ; 423f: a5 30
    cmp currently_updating_logic_for_room_index                       ; 4241: cd ba 1a
    bne boulder_is_falling                                            ; 4244: d0 00
boulder_is_falling
    ldy falling_boulder_progress                                      ; 4246: ac d8 42
    sty previous_boulder_progress                                     ; 4249: 84 70
    cpy fallen_boulder_y                                              ; 424b: cc db 42
    bcc move_falling_boulder_down                                     ; 424e: 90 08
    lda #$ff                                                          ; 4250: a9 ff
    sta falling_boulder_progress                                      ; 4252: 8d d8 42
    jmp update_rope_sprites_and_boulder_collision_map                 ; 4255: 4c 7f 42

move_falling_boulder_down
    iny                                                               ; 4258: c8
    sty falling_boulder_progress                                      ; 4259: 8c d8 42
; check we are in the right room
    lda desired_room_index                                            ; 425c: a5 30
    cmp currently_updating_logic_for_room_index                       ; 425e: cd ba 1a
    bne return7                                                       ; 4261: d0 74
; clear collision where the boulder was
    ldx suspended_boulder_x                                           ; 4263: ae d9 42
    dex                                                               ; 4266: ca
    ldy previous_boulder_progress                                     ; 4267: a4 70
    lda #3                                                            ; 4269: a9 03
    sta width_in_cells                                                ; 426b: 85 3c
    lda #2                                                            ; 426d: a9 02
    sta height_in_cells                                               ; 426f: 85 3d
    lda #collision_map_none                                           ; 4271: a9 00
    sta value_to_write_to_collision_map                               ; 4273: 85 3e
    jsr read_collision_map_value_for_xy                               ; 4275: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 4278: c5 3e
    beq update_rope_sprites_and_boulder_collision_map                 ; 427a: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 427c: 20 44 1e
update_rope_sprites_and_boulder_collision_map
    lda desired_room_index                                            ; 427f: a5 30
    cmp currently_updating_logic_for_room_index                       ; 4281: cd ba 1a
    bne return7                                                       ; 4284: d0 51
; check progress
    lda falling_boulder_progress                                      ; 4286: ad d8 42
    bmi set_rope_ends_once_boulder_landed                             ; 4289: 30 1b
    bne set_rope_ends_while_boulder_falling                           ; 428b: d0 0b
; set rope and collision when suspended
    lda #spriteid_rope_end_at_object                                  ; 428d: a9 d9
    sta object_spriteid + objectid_rope_broken_bottom_end             ; 428f: 8d ae 09
    ldy suspended_boulder_y                                           ; 4292: ac da 42
    jmp write_boulder_position_to_collision_map                       ; 4295: 4c b3 42

set_rope_ends_while_boulder_falling
    tay                                                               ; 4298: a8
    lda #spriteid_rope_broken_top_end                                 ; 4299: a9 dc
    sta object_spriteid + objectid_rope_broken_top_end                ; 429b: 8d ad 09
    lda #spriteid_rope_broken_falling_end                             ; 429e: a9 da
    sta object_spriteid + objectid_rope_broken_bottom_end             ; 42a0: 8d ae 09
    jmp write_boulder_position_to_collision_map                       ; 42a3: 4c b3 42

set_rope_ends_once_boulder_landed
    lda #spriteid_rope_broken_top_end                                 ; 42a6: a9 dc
    sta object_spriteid + objectid_rope_broken_top_end                ; 42a8: 8d ad 09
    lda #spriteid_rope_broken_bottom_end                              ; 42ab: a9 db
    sta object_spriteid + objectid_rope_broken_bottom_end             ; 42ad: 8d ae 09
    ldy fallen_boulder_y                                              ; 42b0: ac db 42
write_boulder_position_to_collision_map
    ldx suspended_boulder_x                                           ; 42b3: ae d9 42
    dex                                                               ; 42b6: ca
    lda #objectid_suspended_boulder                                   ; 42b7: a9 04
    jsr set_object_position_from_cell_xy                              ; 42b9: 20 5d 1f
    lda #objectid_rope_broken_bottom_end                              ; 42bc: a9 06
    jsr set_object_position_from_cell_xy                              ; 42be: 20 5d 1f
    lda #3                                                            ; 42c1: a9 03
    sta width_in_cells                                                ; 42c3: 85 3c
    lda #2                                                            ; 42c5: a9 02
    sta height_in_cells                                               ; 42c7: 85 3d
    lda #collision_map_solid_rock                                     ; 42c9: a9 03
    sta value_to_write_to_collision_map                               ; 42cb: 85 3e
    jsr read_collision_map_value_for_xy                               ; 42cd: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 42d0: c5 3e
    beq return7                                                       ; 42d2: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 42d4: 20 44 1e
return7
    rts                                                               ; 42d7: 60

falling_boulder_progress
    !byte 0                                                           ; 42d8: 00
suspended_boulder_x
    !byte 0                                                           ; 42d9: 00
suspended_boulder_y
    !byte 0                                                           ; 42da: 00
fallen_boulder_y
    !byte 0                                                           ; 42db: 00
player_on_suspended_boulder_holding_object
    !byte 0                                                           ; 42dc: 00

update_hourglass_handler
    lda update_room_first_update_flag                                 ; 42dd: ad 2b 13
    beq room_2_update_hourglass                                       ; 42e0: f0 37
    lda #spriteid_hourglass_menu_item                                 ; 42e2: a9 de
    sta toolbar_collectable_spriteids+2                               ; 42e4: 8d ea 2e
    lda #spriteid_hourglass                                           ; 42e7: a9 dd
    sta collectable_spriteids+2                                       ; 42e9: 8d ef 2e
    sta collectable_being_used_spriteids+2                            ; 42ec: 8d f4 2e
; check for being in room 2
    lda desired_room_index                                            ; 42ef: a5 30
    cmp #2                                                            ; 42f1: c9 02
    bne return4                                                       ; 42f3: d0 23
; room 2 update
    lda save_game_level_b_got_hourglass_flag                          ; 42f5: ad 09 0a
    bne return4                                                       ; 42f8: d0 1e
    ldx #$14                                                          ; 42fa: a2 14
    ldy #$11                                                          ; 42fc: a0 11
    lda #objectid_hourglass                                           ; 42fe: a9 07
    jsr set_object_position_from_cell_xy                              ; 4300: 20 5d 1f
    tax                                                               ; 4303: aa
    lda #1                                                            ; 4304: a9 01
    sta object_direction,x                                            ; 4306: 9d be 09
    lda #spriteid_cache3                                              ; 4309: a9 df
    sta object_erase_type,x                                           ; 430b: 9d ac 38
    lda #$c0                                                          ; 430e: a9 c0
    sta object_z_order,x                                              ; 4310: 9d c2 38
    lda #spriteid_hourglass                                           ; 4313: a9 dd
    sta object_spriteid,x                                             ; 4315: 9d a8 09
return4
    rts                                                               ; 4318: 60

room_2_update_hourglass
    lda desired_room_index                                            ; 4319: a5 30
    cmp #2                                                            ; 431b: c9 02
    bne return8                                                       ; 431d: d0 1d
    lda save_game_level_b_got_hourglass_flag                          ; 431f: ad 09 0a
    bne return8                                                       ; 4322: d0 18
    ldx #objectid_old_player                                          ; 4324: a2 0b
    ldy #objectid_hourglass                                           ; 4326: a0 07
    jsr test_for_collision_between_objects_x_and_y                    ; 4328: 20 e2 28
    beq return8                                                       ; 432b: f0 0f
    lda #spriteid_hourglass_menu_item                                 ; 432d: a9 de
    jsr find_or_create_menu_slot_for_A                                ; 432f: 20 bd 2b
    lda #0                                                            ; 4332: a9 00
    sta object_spriteid + objectid_hourglass                          ; 4334: 8d af 09
    lda #$ff                                                          ; 4337: a9 ff
    sta save_game_level_b_got_hourglass_flag                          ; 4339: 8d 09 0a
return8
    rts                                                               ; 433c: 60

; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 20                                                          ; 433d: 14                      ; initial player X cell
    !byte 7                                                           ; 433e: 07                      ; initial player Y cell

; ########################################
; ########################################
; ######   |                    |   ######
; #####    |                    |    #####
; ####     |                    |     ####
; ###      |                    |      ###
; ###      |          P         |      ###
; ###      |   ###############  |      ###
; ###      |   ###############  |      ###
;          |                    |      ###
;          |                    |      ###
;          |          S         |      ###
;          |                    |      ###
;          |                    |      ###
;          |                    |      ###
; #####    |                    |      ###
; #####    |     OOO     OOO    |      ###
; ###      |     OOO     OOO    |      ###
; ###      |     OOOOSOOOSOO    |      ###
; ###      |     OOOOOOOOOOO    |      ###
; ###          ###############         ###
; ###         #################        ###
; ########################################
; ########################################
; set ground fill tile to use
room_3_code
    lda #<ground_fill_2x2_top_left                                    ; 433f: a9 26
    sta source_sprite_memory_low                                      ; 4341: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 4343: a9 45
    sta source_sprite_memory_high                                     ; 4345: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 4347: a2 00
    ldy #0                                                            ; 4349: a0 00
    lda #$ff                                                          ; 434b: a9 ff
    sta width_in_cells                                                ; 434d: 85 3c
    lda #2                                                            ; 434f: a9 02
    sta height_in_cells                                               ; 4351: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4353: 20 bb 1a
; draw 6x1 rectangle at (0,2)
    ldy #2                                                            ; 4356: a0 02
    lda #6                                                            ; 4358: a9 06
    sta width_in_cells                                                ; 435a: 85 3c
    dec height_in_cells                                               ; 435c: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 435e: 20 bb 1a
; draw 6x1 rectangle at (34,2)
    ldx #$22 ; '"'                                                    ; 4361: a2 22
    jsr copy_rectangle_of_memory_to_screen                            ; 4363: 20 bb 1a
; draw 5x1 rectangle at (0,3)
    ldx #0                                                            ; 4366: a2 00
    iny                                                               ; 4368: c8
    dec width_in_cells                                                ; 4369: c6 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 436b: 20 bb 1a
; draw 5x1 rectangle at (35,3)
    ldx #$23 ; '#'                                                    ; 436e: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 4370: 20 bb 1a
; draw 4x1 rectangle at (0,4)
    ldx #0                                                            ; 4373: a2 00
    iny                                                               ; 4375: c8
    dec width_in_cells                                                ; 4376: c6 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 4378: 20 bb 1a
; draw 4x1 rectangle at (36,4)
    ldx #$24 ; '$'                                                    ; 437b: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 437d: 20 bb 1a
; draw 3x4 rectangle at (0,5)
    ldx #0                                                            ; 4380: a2 00
    iny                                                               ; 4382: c8
    dec width_in_cells                                                ; 4383: c6 3c
    lda #4                                                            ; 4385: a9 04
    sta height_in_cells                                               ; 4387: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4389: 20 bb 1a
; draw 3x17 rectangle at (37,5)
    ldx #$25 ; '%'                                                    ; 438c: a2 25
    lda #$11                                                          ; 438e: a9 11
    sta height_in_cells                                               ; 4390: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4392: 20 bb 1a
; draw 5x2 rectangle at (0,15)
    ldx #0                                                            ; 4395: a2 00
    ldy #$0f                                                          ; 4397: a0 0f
    lda #5                                                            ; 4399: a9 05
    sta width_in_cells                                                ; 439b: 85 3c
    lda #2                                                            ; 439d: a9 02
    sta height_in_cells                                               ; 439f: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43a1: 20 bb 1a
; draw 3x5 rectangle at (0,17)
    ldy #$11                                                          ; 43a4: a0 11
    lda #3                                                            ; 43a6: a9 03
    sta width_in_cells                                                ; 43a8: 85 3c
    lda #5                                                            ; 43aa: a9 05
    sta height_in_cells                                               ; 43ac: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43ae: 20 bb 1a
; draw 255x5 rectangle at (0,22)
    ldy #$16                                                          ; 43b1: a0 16
    lda #$ff                                                          ; 43b3: a9 ff
    sta width_in_cells                                                ; 43b5: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 43b7: 20 bb 1a
; draw 17x1 rectangle at (12,21)
    ldx #$0c                                                          ; 43ba: a2 0c
    dey                                                               ; 43bc: 88
    lda #$11                                                          ; 43bd: a9 11
    sta width_in_cells                                                ; 43bf: 85 3c
    lda #1                                                            ; 43c1: a9 01
    sta height_in_cells                                               ; 43c3: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43c5: 20 bb 1a
; draw 15x1 rectangle at (13,20)
    inx                                                               ; 43c8: e8
    dey                                                               ; 43c9: 88
    lda #$0f                                                          ; 43ca: a9 0f
    sta width_in_cells                                                ; 43cc: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 43ce: 20 bb 1a
; draw 15x2 rectangle at (13,7)
    ldx #$0d                                                          ; 43d1: a2 0d
    ldy #7                                                            ; 43d3: a0 07
    lda #$0f                                                          ; 43d5: a9 0f
    sta width_in_cells                                                ; 43d7: 85 3c
    lda #2                                                            ; 43d9: a9 02
    sta height_in_cells                                               ; 43db: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43dd: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 43e0: 20 90 1b
; draw rope at (9,2) length 18
; draw rope
    ldx #9                                                            ; 43e3: a2 09
    ldy #2                                                            ; 43e5: a0 02
    lda #$12                                                          ; 43e7: a9 12
    jsr draw_rope                                                     ; 43e9: 20 b9 1d
; draw rope at (30,2) length 18
    ldx #$1e                                                          ; 43ec: a2 1e
    jsr draw_rope                                                     ; 43ee: 20 b9 1d
; draw table at (15,18) of size (11x2)
    lda #$0b                                                          ; 43f1: a9 0b
    sta width_in_cells                                                ; 43f3: 85 3c
    lda #2                                                            ; 43f5: a9 02
    sta height_in_cells                                               ; 43f7: 85 3d
    ldx #$0f                                                          ; 43f9: a2 0f
    ldy #$12                                                          ; 43fb: a0 12
    lda #spriteid_table                                               ; 43fd: a9 d2
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 43ff: 20 57 1f
; draw table at (19,18)
    ldx #$13                                                          ; 4402: a2 13
    jsr draw_sprite_a_at_cell_xy                                      ; 4404: 20 4c 1f
; draw table at (23,18)
    ldx #$17                                                          ; 4407: a2 17
    jsr draw_sprite_a_at_cell_xy                                      ; 4409: 20 4c 1f
; draw boulder at (15,16) of size (3x2)
    lda #3                                                            ; 440c: a9 03
    sta width_in_cells                                                ; 440e: 85 3c
    ldx #$0f                                                          ; 4410: a2 0f
    ldy #$10                                                          ; 4412: a0 10
    lda #spriteid_boulder                                             ; 4414: a9 d5
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 4416: 20 57 1f
; draw boulder at (23,16) of size (3x2)
    ldx #$17                                                          ; 4419: a2 17
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 441b: 20 57 1f
; draw ball at (20,11)
    ldx #$14                                                          ; 441e: a2 14
    ldy #$0b                                                          ; 4420: a0 0b
    lda #spriteid_ball                                                ; 4422: a9 3b
    jsr draw_sprite_a_at_cell_xy                                      ; 4424: 20 4c 1f
    lda #3                                                            ; 4427: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4429: 20 bb 1e
    jsr start_room                                                    ; 442c: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 442f: 20 da 12
    and #exit_room_left                                               ; 4432: 29 01
    beq room_3_game_update_loop                                       ; 4434: f0 f9
    ldx #2                                                            ; 4436: a2 02
    ldy current_level                                                 ; 4438: a4 31
    jmp initialise_level_and_room                                     ; 443a: 4c 40 11

room_3_update_handler
    lda #3                                                            ; 443d: a9 03
    sta currently_updating_logic_for_room_index                       ; 443f: 8d ba 1a
; update fire
    lda #3                                                            ; 4442: a9 03
    ldx #$14                                                          ; 4444: a2 14
    ldy #$0b                                                          ; 4446: a0 0b
    jsr update_brazier_and_fire                                       ; 4448: 20 88 19
    lda #4                                                            ; 444b: a9 04
    inx                                                               ; 444d: e8
    jsr update_brazier_and_fire                                       ; 444e: 20 88 19
; position and update the spell collectable object
    ldx #$14                                                          ; 4451: a2 14
    lda #4                                                            ; 4453: a9 04
    sta temp_sprite_x_offset                                          ; 4455: 85 3a
    ldy #$12                                                          ; 4457: a0 12
    lda #objectid_spell                                               ; 4459: a9 05
    jsr update_level_completion                                       ; 445b: 20 10 1a
; check for room 3 (return if not)
    lda desired_room_index                                            ; 445e: a5 30
    cmp #3                                                            ; 4460: c9 03
    bne return5                                                       ; 4462: d0 49
    lda update_room_first_update_flag                                 ; 4464: ad 2b 13
    beq room_3_not_first_update                                       ; 4467: f0 2c
; first update in room 3
    lda save_game_level_b_cuckoo_room_2_progress                      ; 4469: ad 06 0a
    cmp #2                                                            ; 446c: c9 02
    bcc return5                                                       ; 446e: 90 3d
    ldx #$23 ; '#'                                                    ; 4470: a2 23
    lda #3                                                            ; 4472: a9 03
    sta temp_sprite_x_offset                                          ; 4474: 85 3a
    ldy #$15                                                          ; 4476: a0 15
    lda #objectid_cuckoo                                              ; 4478: a9 02
    jsr set_object_position_from_cell_xy                              ; 447a: 20 5d 1f
; set properties of the cuckoo in room 3
    tax                                                               ; 447d: aa
    lda #1                                                            ; 447e: a9 01
    sta object_direction,x                                            ; 4480: 9d be 09
    lda #spriteid_cache1                                              ; 4483: a9 d7
    sta object_erase_type,x                                           ; 4485: 9d ac 38
    lda #$c0                                                          ; 4488: a9 c0
    sta object_z_order,x                                              ; 448a: 9d c2 38
    lda #spriteid_cuckoo                                              ; 448d: a9 d3
    sta object_spriteid,x                                             ; 448f: 9d a8 09
    jmp return5                                                       ; 4492: 4c ad 44

room_3_not_first_update
    ldx #objectid_old_player                                          ; 4495: a2 0b
    ldy #objectid_cuckoo                                              ; 4497: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 4499: 20 e2 28
    beq return5                                                       ; 449c: f0 0f
    lda #spriteid_cuckoo_menu_item                                    ; 449e: a9 d4
    jsr find_or_create_menu_slot_for_A                                ; 44a0: 20 bd 2b
    lda #0                                                            ; 44a3: a9 00
    sta object_spriteid + objectid_pendulum                           ; 44a5: 8d aa 09
    lda #0                                                            ; 44a8: a9 00
    sta save_game_level_b_cuckoo_room_2_progress                      ; 44aa: 8d 06 0a
return5
    rts                                                               ; 44ad: 60

envelope3
    !byte 5                                                           ; 44ae: 05                      ; envelope number
    !byte 1                                                           ; 44af: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 44b0: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 44b1: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 44b2: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 44b3: 00                      ; number of steps in section 1
    !byte 0                                                           ; 44b4: 00                      ; number of steps in section 2
    !byte 0                                                           ; 44b5: 00                      ; number of steps in section 3
    !byte 40                                                          ; 44b6: 28                      ; change of amplitude per step during attack phase
    !byte 246                                                         ; 44b7: f6                      ; change of amplitude per step during decay phase
    !byte 246                                                         ; 44b8: f6                      ; change of amplitude per step during sustain phase
    !byte 236                                                         ; 44b9: ec                      ; change of amplitude per step during release phase
    !byte 100                                                         ; 44ba: 64                      ; target of level at end of attack phase
    !byte 0                                                           ; 44bb: 00                      ; target of level at end of decay phase
sound_cuckoo1
    !word $13                                                         ; 44bc: 13 00                   ; channel
    !word 5                                                           ; 44be: 05 00                   ; amplitude
    !word 149                                                         ; 44c0: 95 00                   ; pitch
    !word 3                                                           ; 44c2: 03 00                   ; duration
sound_cuckoo2
    !word 3                                                           ; 44c4: 03 00                   ; channel
    !word 5                                                           ; 44c6: 05 00                   ; amplitude
    !word 137                                                         ; 44c8: 89 00                   ; pitch
    !word 2                                                           ; 44ca: 02 00                   ; duration
envelope2
    !byte 6                                                           ; 44cc: 06                      ; envelope number
    !byte 1                                                           ; 44cd: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 44ce: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 44cf: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 44d0: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 44d1: 00                      ; number of steps in section 1
    !byte 0                                                           ; 44d2: 00                      ; number of steps in section 2
    !byte 0                                                           ; 44d3: 00                      ; number of steps in section 3
    !byte 100                                                         ; 44d4: 64                      ; change of amplitude per step during attack phase
    !byte 206                                                         ; 44d5: ce                      ; change of amplitude per step during decay phase
    !byte 206                                                         ; 44d6: ce                      ; change of amplitude per step during sustain phase
    !byte 156                                                         ; 44d7: 9c                      ; change of amplitude per step during release phase
    !byte 100                                                         ; 44d8: 64                      ; target of level at end of attack phase
    !byte 0                                                           ; 44d9: 00                      ; target of level at end of decay phase
sound_clock_bass
    !word $10                                                         ; 44da: 10 00                   ; channel
    !word 6                                                           ; 44dc: 06 00                   ; amplitude
    !word 7                                                           ; 44de: 07 00                   ; pitch
    !word 1                                                           ; 44e0: 01 00                   ; duration
sound_tick
    !word $11                                                         ; 44e2: 11 00                   ; channel
    !word 0                                                           ; 44e4: 00 00                   ; amplitude
    !word 250                                                         ; 44e6: fa 00                   ; pitch
    !word 0                                                           ; 44e8: 00 00                   ; duration
sound_tock
    !word $11                                                         ; 44ea: 11 00                   ; channel
    !word 0                                                           ; 44ec: 00 00                   ; amplitude
    !word 190                                                         ; 44ee: be 00                   ; pitch
    !word 0                                                           ; 44f0: 00 00                   ; duration
envelope_unused
    !byte 7                                                           ; 44f2: 07                      ; envelope number
    !byte 1                                                           ; 44f3: 01                      ; step length (100ths of a second)
    !byte 255                                                         ; 44f4: ff                      ; pitch change per step in section 1
    !byte 0                                                           ; 44f5: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 44f6: 00                      ; pitch change per step in section 3
    !byte 1                                                           ; 44f7: 01                      ; number of steps in section 1
    !byte 1                                                           ; 44f8: 01                      ; number of steps in section 2
    !byte 0                                                           ; 44f9: 00                      ; number of steps in section 3
    !byte 120                                                         ; 44fa: 78                      ; change of amplitude per step during attack phase
    !byte 252                                                         ; 44fb: fc                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 44fc: 00                      ; change of amplitude per step during sustain phase
    !byte 248                                                         ; 44fd: f8                      ; change of amplitude per step during release phase
    !byte 120                                                         ; 44fe: 78                      ; target of level at end of attack phase
    !byte 0                                                           ; 44ff: 00                      ; target of level at end of decay phase
sound_unused
    !word $13                                                         ; 4500: 13 00                   ; channel
    !word 7                                                           ; 4502: 07 00                   ; amplitude
    !word 200                                                         ; 4504: c8 00                   ; pitch
    !word 1                                                           ; 4506: 01 00                   ; duration
envelope1
    !byte 7                                                           ; 4508: 07                      ; envelope number
    !byte 1                                                           ; 4509: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 450a: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 450b: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 450c: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 450d: 00                      ; number of steps in section 1
    !byte 0                                                           ; 450e: 00                      ; number of steps in section 2
    !byte 0                                                           ; 450f: 00                      ; number of steps in section 3
    !byte 55                                                          ; 4510: 37                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4511: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4512: 00                      ; change of amplitude per step during sustain phase
    !byte 250                                                         ; 4513: fa                      ; change of amplitude per step during release phase
    !byte 110                                                         ; 4514: 6e                      ; target of level at end of attack phase
    !byte 55                                                          ; 4515: 37                      ; target of level at end of decay phase
sound7
    !word $10                                                         ; 4516: 10 00                   ; channel
    !word 7                                                           ; 4518: 07 00                   ; amplitude
    !word 7                                                           ; 451a: 07 00                   ; pitch
    !word 1                                                           ; 451c: 01 00                   ; duration
sound6
    !word $11                                                         ; 451e: 11 00                   ; channel
    !word 0                                                           ; 4520: 00 00                   ; amplitude
    !word 210                                                         ; 4522: d2 00                   ; pitch
    !word 1                                                           ; 4524: 01 00                   ; duration
ground_fill_2x2_top_left
    !byte %..#.....                                                   ; 4526: 20
    !byte %...#....                                                   ; 4527: 10
    !byte %#...#...                                                   ; 4528: 88
    !byte %.#...#..                                                   ; 4529: 44
    !byte %..#...##                                                   ; 452a: 23
    !byte %...#....                                                   ; 452b: 10
    !byte %....#...                                                   ; 452c: 08
    !byte %....#...                                                   ; 452d: 08
ground_fill_2x2_top_right
    !byte %.....#..                                                   ; 452e: 04
    !byte %....#...                                                   ; 452f: 08
    !byte %...#...#                                                   ; 4530: 11
    !byte %###...#.                                                   ; 4531: e2
    !byte %.....#..                                                   ; 4532: 04
    !byte %....#...                                                   ; 4533: 08
    !byte %....#...                                                   ; 4534: 08
    !byte %....#...                                                   ; 4535: 08
ground_fill_2x2_bottom_left
    !byte %...#....                                                   ; 4536: 10
    !byte %...#....                                                   ; 4537: 10
    !byte %...#....                                                   ; 4538: 10
    !byte %..#.....                                                   ; 4539: 20
    !byte %.#...###                                                   ; 453a: 47
    !byte %#...#...                                                   ; 453b: 88
    !byte %...#....                                                   ; 453c: 10
    !byte %..#.....                                                   ; 453d: 20
ground_fill_2x2_bottom_right
    !byte %...#....                                                   ; 453e: 10
    !byte %...#....                                                   ; 453f: 10
    !byte %....#...                                                   ; 4540: 08
    !byte %##...#..                                                   ; 4541: c4
    !byte %..#...#.                                                   ; 4542: 22
    !byte %...#...#                                                   ; 4543: 11
    !byte %....#...                                                   ; 4544: 08
    !byte %.....#..                                                   ; 4545: 04
sprite_data
pydis_end
!if (<envelope1) != $08 {
    !error "Assertion failed: <envelope1 == $08"
}
!if (<envelope2) != $cc {
    !error "Assertion failed: <envelope2 == $cc"
}
!if (<envelope3) != $ae {
    !error "Assertion failed: <envelope3 == $ae"
}
!if (<ground_fill_2x2_top_left) != $26 {
    !error "Assertion failed: <ground_fill_2x2_top_left == $26"
}
!if (<sound6) != $1e {
    !error "Assertion failed: <sound6 == $1e"
}
!if (<sound7) != $16 {
    !error "Assertion failed: <sound7 == $16"
}
!if (<sound_clock_bass) != $da {
    !error "Assertion failed: <sound_clock_bass == $da"
}
!if (<sound_cuckoo1) != $bc {
    !error "Assertion failed: <sound_cuckoo1 == $bc"
}
!if (<sound_cuckoo2) != $c4 {
    !error "Assertion failed: <sound_cuckoo2 == $c4"
}
!if (<sound_tick) != $e2 {
    !error "Assertion failed: <sound_tick == $e2"
}
!if (<sound_tock) != $ea {
    !error "Assertion failed: <sound_tock == $ea"
}
!if (>envelope1) != $45 {
    !error "Assertion failed: >envelope1 == $45"
}
!if (>envelope2) != $44 {
    !error "Assertion failed: >envelope2 == $44"
}
!if (>envelope3) != $44 {
    !error "Assertion failed: >envelope3 == $44"
}
!if (>ground_fill_2x2_top_left) != $45 {
    !error "Assertion failed: >ground_fill_2x2_top_left == $45"
}
!if (>sound6) != $45 {
    !error "Assertion failed: >sound6 == $45"
}
!if (>sound7) != $45 {
    !error "Assertion failed: >sound7 == $45"
}
!if (>sound_clock_bass) != $44 {
    !error "Assertion failed: >sound_clock_bass == $44"
}
!if (>sound_cuckoo1) != $44 {
    !error "Assertion failed: >sound_cuckoo1 == $44"
}
!if (>sound_cuckoo2) != $44 {
    !error "Assertion failed: >sound_cuckoo2 == $44"
}
!if (>sound_tick) != $44 {
    !error "Assertion failed: >sound_tick == $44"
}
!if (>sound_tock) != $44 {
    !error "Assertion failed: >sound_tock == $44"
}
!if (collision_map_none) != $00 {
    !error "Assertion failed: collision_map_none == $00"
}
!if (collision_map_rope) != $02 {
    !error "Assertion failed: collision_map_rope == $02"
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
!if (level_specific_update) != $3b1c {
    !error "Assertion failed: level_specific_update == $3b1c"
}
!if (objectid_clock_workings) != $03 {
    !error "Assertion failed: objectid_clock_workings == $03"
}
!if (objectid_cuckoo) != $02 {
    !error "Assertion failed: objectid_cuckoo == $02"
}
!if (objectid_hourglass) != $07 {
    !error "Assertion failed: objectid_hourglass == $07"
}
!if (objectid_old_player) != $0b {
    !error "Assertion failed: objectid_old_player == $0b"
}
!if (objectid_pendulum) != $02 {
    !error "Assertion failed: objectid_pendulum == $02"
}
!if (objectid_rope_broken_bottom_end) != $06 {
    !error "Assertion failed: objectid_rope_broken_bottom_end == $06"
}
!if (objectid_rope_broken_top_end) != $05 {
    !error "Assertion failed: objectid_rope_broken_top_end == $05"
}
!if (objectid_spell) != $05 {
    !error "Assertion failed: objectid_spell == $05"
}
!if (objectid_suspended_boulder) != $04 {
    !error "Assertion failed: objectid_suspended_boulder == $04"
}
!if (room_0_data) != $3b2f {
    !error "Assertion failed: room_0_data == $3b2f"
}
!if (room_1_data) != $3c81 {
    !error "Assertion failed: room_1_data == $3c81"
}
!if (room_2_data) != $3f93 {
    !error "Assertion failed: room_2_data == $3f93"
}
!if (room_3_data) != $433d {
    !error "Assertion failed: room_3_data == $433d"
}
!if (sprite_data - level_data) != $0a71 {
    !error "Assertion failed: sprite_data - level_data == $0a71"
}
!if (sprite_op_flags_erase_to_fg_colour) != $04 {
    !error "Assertion failed: sprite_op_flags_erase_to_fg_colour == $04"
}
!if (spriteid_ball) != $3b {
    !error "Assertion failed: spriteid_ball == $3b"
}
!if (spriteid_boulder) != $d5 {
    !error "Assertion failed: spriteid_boulder == $d5"
}
!if (spriteid_cache1) != $d7 {
    !error "Assertion failed: spriteid_cache1 == $d7"
}
!if (spriteid_cache2) != $d8 {
    !error "Assertion failed: spriteid_cache2 == $d8"
}
!if (spriteid_cache3) != $df {
    !error "Assertion failed: spriteid_cache3 == $df"
}
!if (spriteid_clock) != $c8 {
    !error "Assertion failed: spriteid_clock == $c8"
}
!if (spriteid_clock_workings) != $d1 {
    !error "Assertion failed: spriteid_clock_workings == $d1"
}
!if (spriteid_cuckoo) != $d3 {
    !error "Assertion failed: spriteid_cuckoo == $d3"
}
!if (spriteid_cuckoo_appear_full) != $d0 {
    !error "Assertion failed: spriteid_cuckoo_appear_full == $d0"
}
!if (spriteid_cuckoo_appear_partly) != $cf {
    !error "Assertion failed: spriteid_cuckoo_appear_partly == $cf"
}
!if (spriteid_cuckoo_menu_item) != $d4 {
    !error "Assertion failed: spriteid_cuckoo_menu_item == $d4"
}
!if (spriteid_cuckoo_open_beak) != $d6 {
    !error "Assertion failed: spriteid_cuckoo_open_beak == $d6"
}
!if (spriteid_hourglass) != $dd {
    !error "Assertion failed: spriteid_hourglass == $dd"
}
!if (spriteid_hourglass_menu_item) != $de {
    !error "Assertion failed: spriteid_hourglass_menu_item == $de"
}
!if (spriteid_pendulum1) != $c9 {
    !error "Assertion failed: spriteid_pendulum1 == $c9"
}
!if (spriteid_pendulum2) != $ca {
    !error "Assertion failed: spriteid_pendulum2 == $ca"
}
!if (spriteid_pendulum3) != $cb {
    !error "Assertion failed: spriteid_pendulum3 == $cb"
}
!if (spriteid_pendulum4) != $cc {
    !error "Assertion failed: spriteid_pendulum4 == $cc"
}
!if (spriteid_pendulum5) != $cd {
    !error "Assertion failed: spriteid_pendulum5 == $cd"
}
!if (spriteid_rope_broken_bottom_end) != $db {
    !error "Assertion failed: spriteid_rope_broken_bottom_end == $db"
}
!if (spriteid_rope_broken_falling_end) != $da {
    !error "Assertion failed: spriteid_rope_broken_falling_end == $da"
}
!if (spriteid_rope_broken_top_end) != $dc {
    !error "Assertion failed: spriteid_rope_broken_top_end == $dc"
}
!if (spriteid_rope_end) != $0a {
    !error "Assertion failed: spriteid_rope_end == $0a"
}
!if (spriteid_rope_end_at_object) != $d9 {
    !error "Assertion failed: spriteid_rope_end_at_object == $d9"
}
!if (spriteid_table) != $d2 {
    !error "Assertion failed: spriteid_table == $d2"
}
!if (spriteid_vertical_rod) != $ce {
    !error "Assertion failed: spriteid_vertical_rod == $ce"
}
!if (spriteid_wizard7) != $36 {
    !error "Assertion failed: spriteid_wizard7 == $36"
}
