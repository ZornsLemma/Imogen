; *************************************************************************************
;
; Level J: 'BABBOONACY'
;
; Save game variables:
;
;     save_game_level_j_got_cannonball_progress                  ($0a30):
;               0: untouched
;              1+: cannonball thrown, animating
;             $ff: held by babboon
;
;     save_game_level_j_room_0_babboon_animation                 ($0a31):
;               0: untouched
;              1+: animating babboon
;             $37: descending with cannonball
;             $3f: cannonball thrown
;
;     save_game_level_j_partition_progress                       ($0a32):
;               0: untouched
;             1,2: partition falling over
;             $ff: partition fallen over
;
; Solution:
;
;   1. Move to left room and collect a cannonball that's thrown, then move back to room
;      to the right.
;   2. Stand next to the babboon and throw the cannonball at the babboon.
;   3. Quickly move back to the leftmost room and collect another cannonball.
;   4. Quickly move back to the initial room and jump over the babboon before they
;      reach the top of the rope.
;   5. Jump across the bottom of the three ropes, avoiding the babboons.
;   6. Throw the cannonball at the partition to knock it over, then collect the spell.
;
; *************************************************************************************

; Constants
collision_map_none                     = 0
collision_map_out_of_bounds            = 255
collision_map_rope                     = 2
collision_map_solid_rock               = 3
collision_map_unknown                  = 1
copy_mode_2x2                          = 0
copy_mode_random16                     = 16
copy_mode_random2                      = 2
copy_mode_random32                     = 32
copy_mode_random4                      = 4
copy_mode_random64                     = 64
copy_mode_random8                      = 8
copy_mode_simple                       = 1
exit_room_bottom                       = 2
exit_room_left                         = 1
exit_room_right                        = 4
exit_room_top                          = 8
first_level_letter                     = 65
game_area_height_cells                 = 24
game_area_width_cells                  = 40
last_level_letter                      = 81
object_collided_ceiling                = 8
object_collided_floor                  = 2
object_collided_left_wall              = 1
object_collided_right_wall             = 4
objectid_babboon1                      = 3
objectid_babboon2                      = 4
objectid_babboon3                      = 5
objectid_cannonball                    = 2
objectid_fire                          = 5
objectid_old_cannonball                = 13
objectid_old_player                    = 11
objectid_old_player_accessory          = 12
objectid_partition                     = 4
objectid_player                        = 0
objectid_player_accessory              = 1
objectid_spell                         = 3
opcode_jmp                             = 76
sprite_op_flags_copy_screen            = 1
sprite_op_flags_erase_to_bg_colour     = 2
sprite_op_flags_erase_to_fg_colour     = 4
sprite_op_flags_normal                 = 0
spriteid_babboon1                      = 204
spriteid_babboon2                      = 205
spriteid_babboon_push                  = 206
spriteid_ball                          = 59
spriteid_brazier                       = 58
spriteid_cannonball1                   = 200
spriteid_cannonball2                   = 208
spriteid_cannonball_and_arm            = 209
spriteid_cannonball_menu_item          = 202
spriteid_cat1                          = 27
spriteid_cat2                          = 28
spriteid_cat_jump                      = 26
spriteid_cat_tail1                     = 18
spriteid_cat_tail2                     = 19
spriteid_cat_tail3                     = 20
spriteid_cat_tail4                     = 21
spriteid_cat_tail5                     = 22
spriteid_cat_tail6                     = 23
spriteid_cat_tail7                     = 24
spriteid_cat_tail8                     = 25
spriteid_cat_transform1                = 16
spriteid_cat_transform2                = 17
spriteid_cat_walk1                     = 12
spriteid_cat_walk2                     = 13
spriteid_cat_walk3                     = 14
spriteid_cat_walk4                     = 15
spriteid_circle                        = 32
spriteid_collision                     = 203
spriteid_corner_bottom_left            = 45
spriteid_corner_bottom_right           = 46
spriteid_corner_top_left               = 44
spriteid_corner_top_right              = 47
spriteid_diamond1                      = 39
spriteid_diamond2                      = 40
spriteid_diamond3                      = 41
spriteid_diamond4                      = 42
spriteid_diamond5                      = 43
spriteid_erase_babboon1_or_partition   = 207
spriteid_erase_babboon2                = 214
spriteid_erase_babboon3                = 215
spriteid_erase_cannonball              = 201
spriteid_erase_player                  = 199
spriteid_erase_player_accessory        = 198
spriteid_erase_sparkles                = 197
spriteid_fingertip_tile_restoration    = 30
spriteid_fire1                         = 60
spriteid_fire2                         = 61
spriteid_fire3                         = 62
spriteid_fire4                         = 63
spriteid_fire5                         = 64
spriteid_fire6                         = 65
spriteid_fire7                         = 66
spriteid_fire8                         = 67
spriteid_icodata_box                   = 9
spriteid_icodata_cat                   = 5
spriteid_icodata_disc                  = 3
spriteid_icodata_info                  = 7
spriteid_icodata_monkey                = 6
spriteid_icodata_password              = 8
spriteid_icodata_sound                 = 2
spriteid_icodata_wizard                = 4
spriteid_icon_background               = 1
spriteid_menu_item_completion_spell    = 33
spriteid_monkey1                       = 78
spriteid_monkey2                       = 79
spriteid_monkey3                       = 80
spriteid_monkey4                       = 81
spriteid_monkey5                       = 82
spriteid_monkey_climb1                 = 83
spriteid_monkey_climb2                 = 84
spriteid_monkey_tail1                  = 70
spriteid_monkey_tail2                  = 71
spriteid_monkey_tail3                  = 72
spriteid_monkey_tail4                  = 73
spriteid_monkey_tail5                  = 74
spriteid_monkey_tail6                  = 75
spriteid_monkey_tail7                  = 76
spriteid_monkey_tail8                  = 77
spriteid_monkey_transform1             = 68
spriteid_monkey_transform2             = 69
spriteid_one_pixel_masked_out          = 0
spriteid_one_pixel_set                 = 31
spriteid_partition                     = 211
spriteid_partition_fallen              = 213
spriteid_partition_falling             = 212
spriteid_partition_remains             = 210
spriteid_pointer_hand                  = 29
spriteid_rope1                         = 85
spriteid_rope2                         = 86
spriteid_rope3                         = 87
spriteid_rope4                         = 88
spriteid_rope_end                      = 10
spriteid_rope_hook                     = 11
spriteid_sparkles1                     = 34
spriteid_sparkles2                     = 35
spriteid_sparkles3                     = 36
spriteid_sparkles4                     = 37
spriteid_sparkles5                     = 38
spriteid_wizard1                       = 48
spriteid_wizard2                       = 49
spriteid_wizard3                       = 50
spriteid_wizard4                       = 51
spriteid_wizard5                       = 52
spriteid_wizard7                       = 54
spriteid_wizard_hand                   = 55
spriteid_wizard_transform1             = 56
spriteid_wizard_transform2             = 57
spriteid_wizard_using_object           = 53

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
temp_babboon_y                                      = $70
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
current_player_animation                            = $09df
save_game_level_j_got_cannonball_progress           = $0a30
save_game_level_j_room_0_babboon_animation          = $0a31
save_game_level_j_partition_progress                = $0a32
cannonball_fast_forward_steps                       = $0a6f
cannonball_x_low                                    = $0a70
cannonball_x_high                                   = $0a71
cannonball_y_low                                    = $0a72
cannonball_y_high                                   = $0a73
cannonball_direction                                = $0a74
cannonball_room                                     = $0a75
cannonball_animation_step                           = $0a76
room_0_babboon_animation_step                       = $0a77
room_0_babboon_y_low                                = $0a78
room_0_cannonball_throw_animation_step              = $0a79
room_1_babboon_y                                    = $0a7a
room_1_babboon_animation                            = $0a7b
room_1_babboon_animation_step                       = $0a7c
delay_before_babboon_moves_up_rope                  = $0a7d
delay_timer                                         = $0a7e
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
negative_inkey                                      = $3acc

    * = $3ad5

; *************************************************************************************
; 
; Level header
; 
; *************************************************************************************
level_data
pydis_start
    !word sprite_data - level_data                                    ; 3ad5: 25 0a                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f2 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 0f 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
initial_room_index
    !byte 1                                                           ; 3add: 01
initial_room_index_cheat
    !byte 2                                                           ; 3ade: 02
level_room_data_table
    !word room_0_data                                                 ; 3adf: 73 3f                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: 1f 3b
    !word room_2_data                                                 ; 3ae3: a2 3c
    !word room_3_data                                                 ; 3ae5: 05 3e

; *************************************************************************************
; 'BABBOONACY[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $89, $8a, $89, $89, $84, $84, $85, $8a, $88, $92, $c6       ; 3ae7: 89 8a 89...

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
    beq return1                                                       ; 3af6: f0 16
    lda developer_flags                                               ; 3af8: ad 03 11
    bpl developer_mode_inactive                                       ; 3afb: 10 05
    lda #$ff                                                          ; 3afd: a9 ff
    sta save_game_level_j_got_cannonball_progress                     ; 3aff: 8d 30 0a
developer_mode_inactive
    lda save_game_level_j_got_cannonball_progress                     ; 3b02: ad 30 0a
    cmp #$ff                                                          ; 3b05: c9 ff
    bne return1                                                       ; 3b07: d0 05
    lda #spriteid_cannonball_menu_item                                ; 3b09: a9 ca
    jsr find_or_create_menu_slot_for_A                                ; 3b0b: 20 bd 2b
return1
    rts                                                               ; 3b0e: 60

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
    jsr update_cannonball                                             ; 3b0f: 20 41 42
    jsr room_0_update_handler                                         ; 3b12: 20 a1 40
    jsr room_1_update_handler                                         ; 3b15: 20 c3 3b
    jsr room_2_update_handler                                         ; 3b18: 20 3a 3d
    jsr room_3_update_handler                                         ; 3b1b: 20 89 3e
    rts                                                               ; 3b1e: 60

; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 20                                                          ; 3b1f: 14                      ; initial player X cell
    !byte 15                                                          ; 3b20: 0f                      ; initial player Y cell

; ########################################
; ########################################
; ####      |                  |
; ###       |                  |
; ###       |                  |
; ###       |                  |
; ###       |                  |
; ###       |                  |
; ###       |   ############   |   #######
; ###       |   ############   |   #######
;           |                  |       ###
;           |                  |       ###
;           |                  |       ###
;           |                  |       ###
;           |         P        |       ###
; #######   |   ############   |       ###
; #######   |   ############   |       ###
; ###       |                  |       ###
; ###       |                  |       ###
; ###       |                  |       ###
; ###                                  ###
; ###                                  ###
; ########################################
; ########################################
; set ground fill tile to use
room_1_code
    lda #<ground_fill_2x2_top_left                                    ; 3b21: a9 da
    sta source_sprite_memory_low                                      ; 3b23: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3b25: a9 44
    sta source_sprite_memory_high                                     ; 3b27: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3b29: a2 00
    ldy #0                                                            ; 3b2b: a0 00
    lda #$ff                                                          ; 3b2d: a9 ff
    sta width_in_cells                                                ; 3b2f: 85 3c
    lda #2                                                            ; 3b31: a9 02
    sta height_in_cells                                               ; 3b33: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b35: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3b38: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3b3a: 20 bb 1a
; draw 4x1 rectangle at (0,2)
    ldy #2                                                            ; 3b3d: a0 02
    lda #4                                                            ; 3b3f: a9 04
    sta width_in_cells                                                ; 3b41: 85 3c
    dec height_in_cells                                               ; 3b43: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b45: 20 bb 1a
; draw 3x7 rectangle at (0,3)
    iny                                                               ; 3b48: c8
    dec width_in_cells                                                ; 3b49: c6 3c
    lda #7                                                            ; 3b4b: a9 07
    sta height_in_cells                                               ; 3b4d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b4f: 20 bb 1a
; draw 3x7 rectangle at (0,15)
    ldy #$0f                                                          ; 3b52: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3b54: 20 bb 1a
; draw 3x14 rectangle at (37,8)
    ldx #$25 ; '%'                                                    ; 3b57: a2 25
    ldy #8                                                            ; 3b59: a0 08
    lda #$0e                                                          ; 3b5b: a9 0e
    sta height_in_cells                                               ; 3b5d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b5f: 20 bb 1a
; draw 4x2 rectangle at (3,15)
    ldx #3                                                            ; 3b62: a2 03
    ldy #$0f                                                          ; 3b64: a0 0f
    lda #4                                                            ; 3b66: a9 04
    sta width_in_cells                                                ; 3b68: 85 3c
    lda #2                                                            ; 3b6a: a9 02
    sta height_in_cells                                               ; 3b6c: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b6e: 20 bb 1a
; draw 4x2 rectangle at (33,8)
    ldx #$21 ; '!'                                                    ; 3b71: a2 21
    ldy #8                                                            ; 3b73: a0 08
    jsr copy_rectangle_of_memory_to_screen                            ; 3b75: 20 bb 1a
; draw 12x2 rectangle at (14,8)
    ldx #$0e                                                          ; 3b78: a2 0e
    lda #$0c                                                          ; 3b7a: a9 0c
    sta width_in_cells                                                ; 3b7c: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b7e: 20 bb 1a
; draw 12x2 rectangle at (14,15)
    ldy #$0f                                                          ; 3b81: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3b83: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3b86: 20 90 1b
; draw rope at (10,2) length 18
    ldx #$0a                                                          ; 3b89: a2 0a
    ldy #2                                                            ; 3b8b: a0 02
    lda #$12                                                          ; 3b8d: a9 12
    jsr draw_rope                                                     ; 3b8f: 20 b9 1d
; draw rope at (29,2) length 18
    ldx #$1d                                                          ; 3b92: a2 1d
    jsr draw_rope                                                     ; 3b94: 20 b9 1d
    jsr start_room                                                    ; 3b97: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 3b9a: 20 da 12
    sta room_exit_direction                                           ; 3b9d: 85 70
    and #exit_room_left                                               ; 3b9f: 29 01
    beq room_1_check_right_exit                                       ; 3ba1: f0 07
    ldx #0                                                            ; 3ba3: a2 00
    ldy current_level                                                 ; 3ba5: a4 31
    jmp initialise_level_and_room                                     ; 3ba7: 4c 40 11

room_1_check_right_exit
    lda room_exit_direction                                           ; 3baa: a5 70
    and #exit_room_right                                              ; 3bac: 29 04
    beq room_1_game_update_loop                                       ; 3bae: f0 ea
    ldx #2                                                            ; 3bb0: a2 02
    ldy current_level                                                 ; 3bb2: a4 31
    jmp initialise_level_and_room                                     ; 3bb4: 4c 40 11

babboon_base_animation
    !byte 0                                                           ; 3bb7: 00
babboon_idle_animation
    !byte spriteid_babboon1                                           ; 3bb8: cc
    !byte   0, $80                                                    ; 3bb9: 00 80
babboon_climb_up_animation
    !byte spriteid_babboon2                                           ; 3bbb: cd
    !byte 252                                                         ; 3bbc: fc
    !byte spriteid_babboon1                                           ; 3bbd: cc
    !byte 252, $80                                                    ; 3bbe: fc 80
babboon_climb_down_animation
    !byte spriteid_babboon1                                           ; 3bc0: cc
    !byte   6, $80                                                    ; 3bc1: 06 80

; check for first update in room (branch if not)
room_1_update_handler
    lda update_room_first_update_flag                                 ; 3bc3: ad 2b 13
    beq room_1_not_first_update                                       ; 3bc6: f0 30
; check for level change (branch if not)
    lda current_level                                                 ; 3bc8: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3bca: c5 51
    beq initialise_room                                               ; 3bcc: f0 0d
    lda #babboon_idle_animation - babboon_base_animation              ; 3bce: a9 01
    sta room_1_babboon_animation                                      ; 3bd0: 8d 7b 0a
    sta room_1_babboon_animation_step                                 ; 3bd3: 8d 7c 0a
    lda #$38 ; '8'                                                    ; 3bd6: a9 38
    sta room_1_babboon_y                                              ; 3bd8: 8d 7a 0a
initialise_room
    lda desired_room_index                                            ; 3bdb: a5 30
    cmp #1                                                            ; 3bdd: c9 01
    bne update_babboon_object_if_in_room_1_local                      ; 3bdf: d0 14
; initialise room 1 babboon
    lda #spriteid_erase_babboon1_or_partition                         ; 3be1: a9 cf
    sta object_erase_type + objectid_babboon1                         ; 3be3: 8d af 38
    lda #$c0                                                          ; 3be6: a9 c0
    sta object_z_order + objectid_babboon1                            ; 3be8: 8d c5 38
    lda #$ef                                                          ; 3beb: a9 ef
    sta object_x_low + objectid_babboon1                              ; 3bed: 8d 53 09
    lda #$ff                                                          ; 3bf0: a9 ff
    sta object_direction + objectid_babboon1                          ; 3bf2: 8d c1 09
update_babboon_object_if_in_room_1_local
    jmp update_babboon_object_if_in_room_1                            ; 3bf5: 4c 65 3c

room_1_not_first_update
    lda room_1_babboon_animation_step                                 ; 3bf8: ad 7c 0a
    clc                                                               ; 3bfb: 18
    adc #2                                                            ; 3bfc: 69 02
    tay                                                               ; 3bfe: a8
    lda babboon_base_animation,y                                      ; 3bff: b9 b7 3b
    cmp #$80                                                          ; 3c02: c9 80
    bne got_babboon_animation_step_in_y                               ; 3c04: d0 03
    ldy room_1_babboon_animation                                      ; 3c06: ac 7b 0a
got_babboon_animation_step_in_y
    lda room_1_babboon_animation                                      ; 3c09: ad 7b 0a
    cmp #babboon_climb_down_animation - babboon_base_animation        ; 3c0c: c9 09
    bne babboon_not_climbing_down                                     ; 3c0e: d0 0a
; babboon climbing down
    lda room_1_babboon_y                                              ; 3c10: ad 7a 0a
    cmp #$98                                                          ; 3c13: c9 98
    bne set_animation_step                                            ; 3c15: d0 37
    jmp set_babboon_idle                                              ; 3c17: 4c 26 3c

babboon_not_climbing_down
    lda room_1_babboon_animation                                      ; 3c1a: ad 7b 0a
    cmp #babboon_climb_up_animation - babboon_base_animation          ; 3c1d: c9 04
    bne check_if_babboon_idle                                         ; 3c1f: d0 0f
    cpy room_1_babboon_animation                                      ; 3c21: cc 7b 0a
    bne set_animation_step                                            ; 3c24: d0 28
set_babboon_idle
    ldy #babboon_idle_animation - babboon_base_animation              ; 3c26: a0 01
    sty room_1_babboon_animation                                      ; 3c28: 8c 7b 0a
    lda #$18                                                          ; 3c2b: a9 18
    sta delay_before_babboon_moves_up_rope                            ; 3c2d: 8d 7d 0a
check_if_babboon_idle
    lda room_1_babboon_animation                                      ; 3c30: ad 7b 0a
    cmp #babboon_idle_animation - babboon_base_animation              ; 3c33: c9 01
    bne set_animation_step                                            ; 3c35: d0 17
; check_if_babboon_should_climb_up
    lda room_1_babboon_y                                              ; 3c37: ad 7a 0a
    cmp #$38 ; '8'                                                    ; 3c3a: c9 38
    beq set_animation_step                                            ; 3c3c: f0 10
    lda delay_before_babboon_moves_up_rope                            ; 3c3e: ad 7d 0a
    beq set_babboon_climbing_up                                       ; 3c41: f0 06
    dec delay_before_babboon_moves_up_rope                            ; 3c43: ce 7d 0a
    jmp set_animation_step                                            ; 3c46: 4c 4e 3c

set_babboon_climbing_up
    ldy #babboon_climb_up_animation - babboon_base_animation          ; 3c49: a0 04
    sty room_1_babboon_animation                                      ; 3c4b: 8c 7b 0a
set_animation_step
    sty room_1_babboon_animation_step                                 ; 3c4e: 8c 7c 0a
; update room 1 babboon y
    iny                                                               ; 3c51: c8
    lda babboon_base_animation,y                                      ; 3c52: b9 b7 3b
    clc                                                               ; 3c55: 18
    adc room_1_babboon_y                                              ; 3c56: 6d 7a 0a
    sta room_1_babboon_y                                              ; 3c59: 8d 7a 0a
    cmp #$99                                                          ; 3c5c: c9 99
    bcc update_babboon_object_if_in_room_1                            ; 3c5e: 90 05
    lda #$98                                                          ; 3c60: a9 98
    sta room_1_babboon_y                                              ; 3c62: 8d 7a 0a
update_babboon_object_if_in_room_1
    lda desired_room_index                                            ; 3c65: a5 30
    cmp #1                                                            ; 3c67: c9 01
    bne return2                                                       ; 3c69: d0 36
; update babboon object
    ldy room_1_babboon_animation_step                                 ; 3c6b: ac 7c 0a
    lda babboon_base_animation,y                                      ; 3c6e: b9 b7 3b
    sta object_spriteid + objectid_babboon1                           ; 3c71: 8d ab 09
    lda room_1_babboon_y                                              ; 3c74: ad 7a 0a
    sta object_y_low + objectid_babboon1                              ; 3c77: 8d 7f 09
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 3c7a: ad 2b 13
    bne return2                                                       ; 3c7d: d0 22
; check for player babboon collision
    ldx #objectid_player                                              ; 3c7f: a2 00
    ldy #objectid_babboon1                                            ; 3c81: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 3c83: 20 e2 28
    beq check_babboon_cannonball_collision                            ; 3c86: f0 05
    lda #$80                                                          ; 3c88: a9 80
    sta player_wall_collision_reaction_speed                          ; 3c8a: 8d 33 24
check_babboon_cannonball_collision
    ldx #objectid_babboon1                                            ; 3c8d: a2 03
    ldy #objectid_cannonball                                          ; 3c8f: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 3c91: 20 e2 28
    beq return2                                                       ; 3c94: f0 0b
; collision found, set babboon climbing down the rope
    lda #babboon_climb_down_animation - babboon_base_animation        ; 3c96: a9 09
    sta room_1_babboon_animation                                      ; 3c98: 8d 7b 0a
    sta room_1_babboon_animation_step                                 ; 3c9b: 8d 7c 0a
    jsr show_cannonball_collision                                     ; 3c9e: 20 33 43
return2
    rts                                                               ; 3ca1: 60

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 16                                                          ; 3ca2: 10                      ; initial player X cell
    !byte 15                                                          ; 3ca3: 0f                      ; initial player Y cell

; ########################################
; ########################################
;           |          |   |   |      ####
;           |          |   |   |       ###
;           |          |   |   |       ###
;           |          |   |   |       ###
;           |          |   |   |       ###
;           |          |   |   |       ###
; #######   |          |   |   |       ###
; #######   |          |   |   |       ###
; ###       |          |   |   |
; ###       |          |   |   |
; ###       |          |   |   |
; ###       |
; ###       |     P
; ###       |   ####               #######
; ###       |   ####               #######
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ###                                  ###
; ###                                  ###
; ########################################
; ########################################
; set ground fill tile to use
room_2_code
    lda #<ground_fill_2x2_top_left                                    ; 3ca4: a9 da
    sta source_sprite_memory_low                                      ; 3ca6: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3ca8: a9 44
    sta source_sprite_memory_high                                     ; 3caa: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3cac: a2 00
    ldy #0                                                            ; 3cae: a0 00
    lda #$ff                                                          ; 3cb0: a9 ff
    sta width_in_cells                                                ; 3cb2: 85 3c
    lda #2                                                            ; 3cb4: a9 02
    sta height_in_cells                                               ; 3cb6: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3cb8: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3cbb: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3cbd: 20 bb 1a
; draw 255x1 rectangle at (36,2)
    ldx #$24 ; '$'                                                    ; 3cc0: a2 24
    ldy #2                                                            ; 3cc2: a0 02
    dec height_in_cells                                               ; 3cc4: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3cc6: 20 bb 1a
; draw 255x7 rectangle at (37,3)
    inx                                                               ; 3cc9: e8
    iny                                                               ; 3cca: c8
    lda #7                                                            ; 3ccb: a9 07
    sta height_in_cells                                               ; 3ccd: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ccf: 20 bb 1a
; draw 255x7 rectangle at (37,15)
    ldy #$0f                                                          ; 3cd2: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3cd4: 20 bb 1a
; draw 3x14 rectangle at (0,8)
    ldx #0                                                            ; 3cd7: a2 00
    ldy #8                                                            ; 3cd9: a0 08
    lda #3                                                            ; 3cdb: a9 03
    sta width_in_cells                                                ; 3cdd: 85 3c
    lda #$0e                                                          ; 3cdf: a9 0e
    sta height_in_cells                                               ; 3ce1: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ce3: 20 bb 1a
; draw 4x2 rectangle at (3,8)
    ldx #3                                                            ; 3ce6: a2 03
    inc width_in_cells                                                ; 3ce8: e6 3c
    lda #2                                                            ; 3cea: a9 02
    sta height_in_cells                                               ; 3cec: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3cee: 20 bb 1a
; draw 4x2 rectangle at (33,15)
    ldx #$21 ; '!'                                                    ; 3cf1: a2 21
    ldy #$0f                                                          ; 3cf3: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3cf5: 20 bb 1a
; draw 4x2 rectangle at (14,15)
    ldx #$0e                                                          ; 3cf8: a2 0e
    jsr copy_rectangle_of_memory_to_screen                            ; 3cfa: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3cfd: 20 90 1b
; draw rope at (10,2) length 18
    ldx #$0a                                                          ; 3d00: a2 0a
    ldy #2                                                            ; 3d02: a0 02
    lda #$12                                                          ; 3d04: a9 12
    jsr draw_rope                                                     ; 3d06: 20 b9 1d
; draw rope at (21,2) length 11
    ldx #$15                                                          ; 3d09: a2 15
    lda #$0b                                                          ; 3d0b: a9 0b
    jsr draw_rope                                                     ; 3d0d: 20 b9 1d
; draw rope at (25,2) length 11
    ldx #$19                                                          ; 3d10: a2 19
    jsr draw_rope                                                     ; 3d12: 20 b9 1d
; draw rope at (29,2) length 11
    ldx #$1d                                                          ; 3d15: a2 1d
    jsr draw_rope                                                     ; 3d17: 20 b9 1d
    jsr start_room                                                    ; 3d1a: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 3d1d: 20 da 12
    sta room_exit_direction                                           ; 3d20: 85 70
    and #exit_room_left                                               ; 3d22: 29 01
    beq room_2_check_right_exit                                       ; 3d24: f0 07
    ldx #1                                                            ; 3d26: a2 01
    ldy current_level                                                 ; 3d28: a4 31
    jmp initialise_level_and_room                                     ; 3d2a: 4c 40 11

room_2_check_right_exit
    lda room_exit_direction                                           ; 3d2d: a5 70
    and #exit_room_right                                              ; 3d2f: 29 04
    beq room_2_game_update_loop                                       ; 3d31: f0 ea
    ldx #3                                                            ; 3d33: a2 03
    ldy current_level                                                 ; 3d35: a4 31
    jmp initialise_level_and_room                                     ; 3d37: 4c 40 11

; check for first update in room (branch if not)
room_2_update_handler
    lda update_room_first_update_flag                                 ; 3d3a: ad 2b 13
    beq update_delay_timer                                            ; 3d3d: f0 41
; check for level change (branch if not)
    lda current_level                                                 ; 3d3f: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3d41: c5 51
    beq skip_reset_delay                                              ; 3d43: f0 05
    lda #0                                                            ; 3d45: a9 00
    sta delay_timer                                                   ; 3d47: 8d 7e 0a
skip_reset_delay
    lda desired_room_index                                            ; 3d4a: a5 30
    cmp #2                                                            ; 3d4c: c9 02
    bne update_room_2_babboons_local                                  ; 3d4e: d0 2d
    lda #spriteid_erase_babboon1_or_partition                         ; 3d50: a9 cf
    sta object_erase_type + objectid_babboon1                         ; 3d52: 8d af 38
    lda #spriteid_erase_babboon2                                      ; 3d55: a9 d6
    sta object_erase_type + objectid_babboon2                         ; 3d57: 8d b0 38
    lda #spriteid_erase_babboon3                                      ; 3d5a: a9 d7
    sta object_erase_type + objectid_babboon3                         ; 3d5c: 8d b1 38
    lda #$af                                                          ; 3d5f: a9 af
    sta object_x_low + objectid_babboon1                              ; 3d61: 8d 53 09
    lda #$ff                                                          ; 3d64: a9 ff
    sta object_direction + objectid_babboon1                          ; 3d66: 8d c1 09
    lda #$cf                                                          ; 3d69: a9 cf
    sta object_x_low + objectid_babboon2                              ; 3d6b: 8d 54 09
    lda #$ff                                                          ; 3d6e: a9 ff
    sta object_direction + objectid_babboon2                          ; 3d70: 8d c2 09
    lda #$ef                                                          ; 3d73: a9 ef
    sta object_x_low + objectid_babboon3                              ; 3d75: 8d 55 09
    lda #$ff                                                          ; 3d78: a9 ff
    sta object_direction + objectid_babboon3                          ; 3d7a: 8d c3 09
update_room_2_babboons_local
    jmp update_room_2_babboons                                        ; 3d7d: 4c 8f 3d

update_delay_timer
    inc delay_timer                                                   ; 3d80: ee 7e 0a
    lda delay_timer                                                   ; 3d83: ad 7e 0a
    cmp #$3c ; '<'                                                    ; 3d86: c9 3c
    bcc update_room_2_babboons                                        ; 3d88: 90 05
    lda #0                                                            ; 3d8a: a9 00
    sta delay_timer                                                   ; 3d8c: 8d 7e 0a
update_room_2_babboons
    lda desired_room_index                                            ; 3d8f: a5 30
    cmp #2                                                            ; 3d91: c9 02
    bne return3                                                       ; 3d93: d0 1e
    lda delay_timer                                                   ; 3d95: ad 7e 0a
    ldx #objectid_babboon1                                            ; 3d98: a2 03
    jsr update_room_2_babboon                                         ; 3d9a: 20 b4 3d
    lda delay_timer                                                   ; 3d9d: ad 7e 0a
    clc                                                               ; 3da0: 18
    adc #$28 ; '('                                                    ; 3da1: 69 28
    ldx #objectid_babboon2                                            ; 3da3: a2 04
    jsr update_room_2_babboon                                         ; 3da5: 20 b4 3d
    lda delay_timer                                                   ; 3da8: ad 7e 0a
    clc                                                               ; 3dab: 18
    adc #$32 ; '2'                                                    ; 3dac: 69 32
    ldx #objectid_babboon3                                            ; 3dae: a2 05
    jsr update_room_2_babboon                                         ; 3db0: 20 b4 3d
return3
    rts                                                               ; 3db3: 60

; bring the delay timer (in A) into range 0-$3c
update_room_2_babboon
    cmp #$3c ; '<'                                                    ; 3db4: c9 3c
    bcc got_delay_timer                                               ; 3db6: 90 03
    sec                                                               ; 3db8: 38
    sbc #$3c ; '<'                                                    ; 3db9: e9 3c
got_delay_timer
    tay                                                               ; 3dbb: a8
    asl                                                               ; 3dbc: 0a
    asl                                                               ; 3dbd: 0a
    sta temp_babboon_y                                                ; 3dbe: 85 70
    lda #spriteid_babboon1                                            ; 3dc0: a9 cc
    sta object_spriteid,x                                             ; 3dc2: 9d a8 09
    lda #$60 ; '`'                                                    ; 3dc5: a9 60
    sec                                                               ; 3dc7: 38
    sbc temp_babboon_y                                                ; 3dc8: e5 70
    cpy #$0a                                                          ; 3dca: c0 0a
    bcc store_y_position                                              ; 3dcc: 90 19
    lda #$38 ; '8'                                                    ; 3dce: a9 38
    cpy #$1e                                                          ; 3dd0: c0 1e
    bcc store_y_position                                              ; 3dd2: 90 13
    tya                                                               ; 3dd4: 98
    sec                                                               ; 3dd5: 38
    sbc #$1e                                                          ; 3dd6: e9 1e
    asl                                                               ; 3dd8: 0a
    asl                                                               ; 3dd9: 0a
    sta temp_babboon_y                                                ; 3dda: 85 70
    lda #$38 ; '8'                                                    ; 3ddc: a9 38
    clc                                                               ; 3dde: 18
    adc temp_babboon_y                                                ; 3ddf: 65 70
    cpy #$28 ; '('                                                    ; 3de1: c0 28
    bcc store_y_position                                              ; 3de3: 90 02
    lda #$60 ; '`'                                                    ; 3de5: a9 60
store_y_position
    sta object_y_low,x                                                ; 3de7: 9d 7c 09
    and #7                                                            ; 3dea: 29 07
    beq check_babboon_player_collision                                ; 3dec: f0 05
    lda #spriteid_babboon2                                            ; 3dee: a9 cd
    sta object_spriteid,x                                             ; 3df0: 9d a8 09
; check for first update in room (branch if so)
check_babboon_player_collision
    lda update_room_first_update_flag                                 ; 3df3: ad 2b 13
    bne return4                                                       ; 3df6: d0 0c
    ldy #objectid_player                                              ; 3df8: a0 00
    jsr test_for_collision_between_objects_x_and_y                    ; 3dfa: 20 e2 28
    beq return4                                                       ; 3dfd: f0 05
    lda #$80                                                          ; 3dff: a9 80
    sta player_wall_collision_reaction_speed                          ; 3e01: 8d 33 24
return4
    rts                                                               ; 3e04: 60

; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 4                                                           ; 3e05: 04                      ; initial player X cell
    !byte 15                                                          ; 3e06: 0f                      ; initial player Y cell

; ########################################
; ########################################
; ####      |                         ####
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ###       |   ##########################
; ###       |   ##########################
;           |                          ###
;           |                          ###
;           |                          ###
;           |                          ###
;     P     |                          ###
; #######   |   ##########################
; #######   |   ##########################
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ###                                  ###
; ###                                  ###
; ########################################
; ########################################
; set ground fill tile to use
room_3_code
    lda #<ground_fill_2x2_top_left                                    ; 3e07: a9 da
    sta source_sprite_memory_low                                      ; 3e09: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3e0b: a9 44
    sta source_sprite_memory_high                                     ; 3e0d: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3e0f: a2 00
    ldy #0                                                            ; 3e11: a0 00
    lda #$ff                                                          ; 3e13: a9 ff
    sta width_in_cells                                                ; 3e15: 85 3c
    lda #2                                                            ; 3e17: a9 02
    sta height_in_cells                                               ; 3e19: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e1b: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3e1e: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3e20: 20 bb 1a
; draw 4x1 rectangle at (0,2)
    ldy #2                                                            ; 3e23: a0 02
    lda #4                                                            ; 3e25: a9 04
    sta width_in_cells                                                ; 3e27: 85 3c
    dec height_in_cells                                               ; 3e29: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e2b: 20 bb 1a
; draw 4x1 rectangle at (36,2)
    ldx #$24 ; '$'                                                    ; 3e2e: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 3e30: 20 bb 1a
; draw 3x7 rectangle at (0,3)
    ldx #0                                                            ; 3e33: a2 00
    iny                                                               ; 3e35: c8
    dec width_in_cells                                                ; 3e36: c6 3c
    lda #7                                                            ; 3e38: a9 07
    sta height_in_cells                                               ; 3e3a: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e3c: 20 bb 1a
; draw 3x7 rectangle at (0,15)
    ldy #$0f                                                          ; 3e3f: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3e41: 20 bb 1a
; draw 3x19 rectangle at (37,3)
    ldx #$25 ; '%'                                                    ; 3e44: a2 25
    ldy #3                                                            ; 3e46: a0 03
    lda #$13                                                          ; 3e48: a9 13
    sta height_in_cells                                               ; 3e4a: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e4c: 20 bb 1a
; draw 4x2 rectangle at (3,15)
    ldx #3                                                            ; 3e4f: a2 03
    ldy #$0f                                                          ; 3e51: a0 0f
    lda #4                                                            ; 3e53: a9 04
    sta width_in_cells                                                ; 3e55: 85 3c
    lda #2                                                            ; 3e57: a9 02
    sta height_in_cells                                               ; 3e59: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e5b: 20 bb 1a
; draw 23x2 rectangle at (14,15)
    ldx #$0e                                                          ; 3e5e: a2 0e
    lda #$17                                                          ; 3e60: a9 17
    sta width_in_cells                                                ; 3e62: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3e64: 20 bb 1a
; draw 23x2 rectangle at (14,8)
    ldy #8                                                            ; 3e67: a0 08
    jsr copy_rectangle_of_memory_to_screen                            ; 3e69: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3e6c: 20 90 1b
; draw rope at (10,2) length 18
    ldx #$0a                                                          ; 3e6f: a2 0a
    ldy #2                                                            ; 3e71: a0 02
    lda #$12                                                          ; 3e73: a9 12
    jsr draw_rope                                                     ; 3e75: 20 b9 1d
    jsr start_room                                                    ; 3e78: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 3e7b: 20 da 12
    and #exit_room_left                                               ; 3e7e: 29 01
    beq room_3_game_update_loop                                       ; 3e80: f0 f9
    ldx #2                                                            ; 3e82: a2 02
    ldy current_level                                                 ; 3e84: a4 31
    jmp initialise_level_and_room                                     ; 3e86: 4c 40 11

room_3_update_handler
    lda #3                                                            ; 3e89: a9 03
    sta currently_updating_logic_for_room_index                       ; 3e8b: 8d ba 1a
    ldx #$1d                                                          ; 3e8e: a2 1d
    lda #4                                                            ; 3e90: a9 04
    sta temp_sprite_x_offset                                          ; 3e92: 85 3a
    ldy #$0f                                                          ; 3e94: a0 0f
    lda #objectid_spell                                               ; 3e96: a9 03
    jsr update_level_completion                                       ; 3e98: 20 10 1a
    ldx #3                                                            ; 3e9b: a2 03
    ldy #6                                                            ; 3e9d: a0 06
    lda #5                                                            ; 3e9f: a9 05
    jsr update_brazier_and_fire                                       ; 3ea1: 20 88 19
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 3ea4: ad 2b 13
    beq room_3_not_first_update                                       ; 3ea7: f0 38
; check for level change (branch if not)
    lda current_level                                                 ; 3ea9: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3eab: c5 51
    beq initialise_room_3                                             ; 3ead: f0 0a
    lda save_game_level_j_partition_progress                          ; 3eaf: ad 32 0a
    beq initialise_room_3                                             ; 3eb2: f0 05
    lda #$ff                                                          ; 3eb4: a9 ff
    sta save_game_level_j_partition_progress                          ; 3eb6: 8d 32 0a
initialise_room_3
    lda desired_room_index                                            ; 3eb9: a5 30
    cmp #3                                                            ; 3ebb: c9 03
    bne update_partition_local                                        ; 3ebd: d0 1f
    ldx #<envelope1                                                   ; 3ebf: a2 bc
    ldy #>envelope1                                                   ; 3ec1: a0 44
    jsr define_envelope                                               ; 3ec3: 20 5e 39
    ldx #$11                                                          ; 3ec6: a2 11
    ldy #$0f                                                          ; 3ec8: a0 0f
    lda #spriteid_partition_remains                                   ; 3eca: a9 d2
    jsr draw_sprite_a_at_cell_xy                                      ; 3ecc: 20 4c 1f
    lda #4                                                            ; 3ecf: a9 04
    jsr set_object_position_from_cell_xy                              ; 3ed1: 20 5d 1f
    lda #spriteid_erase_babboon1_or_partition                         ; 3ed4: a9 cf
    sta object_erase_type + objectid_partition                        ; 3ed6: 8d b0 38
    lda #$c0                                                          ; 3ed9: a9 c0
    sta object_z_order + objectid_partition                           ; 3edb: 8d c6 38
update_partition_local
    jmp update_partition                                              ; 3ede: 4c 33 3f

room_3_not_first_update
    lda save_game_level_j_partition_progress                          ; 3ee1: ad 32 0a
    bmi update_partition                                              ; 3ee4: 30 4d
    bne partition_animation_in_progress                               ; 3ee6: d0 0f
; check we are in room 3
    lda desired_room_index                                            ; 3ee8: a5 30
    cmp #3                                                            ; 3eea: c9 03
    bne update_partition                                              ; 3eec: d0 45
; check for cannonball partition collision (branch if none)
    ldx #objectid_cannonball                                          ; 3eee: a2 02
    ldy #objectid_partition                                           ; 3ef0: a0 04
    jsr test_for_collision_between_objects_x_and_y                    ; 3ef2: 20 e2 28
    beq update_partition                                              ; 3ef5: f0 3c
partition_animation_in_progress
    ldy save_game_level_j_partition_progress                          ; 3ef7: ac 32 0a
    iny                                                               ; 3efa: c8
    sty save_game_level_j_partition_progress                          ; 3efb: 8c 32 0a
    cpy #2                                                            ; 3efe: c0 02
    bcc update_partition                                              ; 3f00: 90 31
; write to clear collision map from partition area
    ldy #$ff                                                          ; 3f02: a0 ff
    sty save_game_level_j_partition_progress                          ; 3f04: 8c 32 0a
    lda desired_room_index                                            ; 3f07: a5 30
    cmp #3                                                            ; 3f09: c9 03
    bne update_partition                                              ; 3f0b: d0 26
    ldx #$11                                                          ; 3f0d: a2 11
    ldy #$0a                                                          ; 3f0f: a0 0a
    lda #1                                                            ; 3f11: a9 01
    sta width_in_cells                                                ; 3f13: 85 3c
    lda #5                                                            ; 3f15: a9 05
    sta height_in_cells                                               ; 3f17: 85 3d
    lda #collision_map_none                                           ; 3f19: a9 00
    sta value_to_write_to_collision_map                               ; 3f1b: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3f1d: 20 44 1e
    jmp update_partition                                              ; 3f20: 4c 33 3f

; unused?
    lda #0                                                            ; 3f23: a9 00
    ldx #<sound4                                                      ; 3f25: a2 d2
    ldy #>sound4                                                      ; 3f27: a0 44
    jsr play_sound_yx                                                 ; 3f29: 20 f6 38
    ldx #<sound3                                                      ; 3f2c: a2 ca
    ldy #>sound3                                                      ; 3f2e: a0 44
    jsr play_sound_yx                                                 ; 3f30: 20 f6 38
update_partition
    lda desired_room_index                                            ; 3f33: a5 30
    cmp #3                                                            ; 3f35: c9 03
    bne return5                                                       ; 3f37: d0 36
    ldy save_game_level_j_partition_progress                          ; 3f39: ac 32 0a
    bpl set_partition_object                                          ; 3f3c: 10 02
    ldy #2                                                            ; 3f3e: a0 02
set_partition_object
    lda partition_animation,y                                         ; 3f40: b9 70 3f
    sta object_spriteid + objectid_partition                          ; 3f43: 8d ac 09
; write collision for partition
    ldx #$11                                                          ; 3f46: a2 11
    ldy #$0a                                                          ; 3f48: a0 0a
    lda #1                                                            ; 3f4a: a9 01
    sta width_in_cells                                                ; 3f4c: 85 3c
    lda #5                                                            ; 3f4e: a9 05
    sta height_in_cells                                               ; 3f50: 85 3d
    lda #collision_map_solid_rock                                     ; 3f52: a9 03
    sta value_to_write_to_collision_map                               ; 3f54: 85 3e
    lda save_game_level_j_partition_progress                          ; 3f56: ad 32 0a
    bpl write_collision_if_needed                                     ; 3f59: 10 0a
    ldy #$0e                                                          ; 3f5b: a0 0e
    lda #6                                                            ; 3f5d: a9 06
    sta width_in_cells                                                ; 3f5f: 85 3c
    lda #1                                                            ; 3f61: a9 01
    sta height_in_cells                                               ; 3f63: 85 3d
write_collision_if_needed
    jsr read_collision_map_value_for_xy                               ; 3f65: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3f68: c5 3e
    beq return5                                                       ; 3f6a: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3f6c: 20 44 1e
return5
    rts                                                               ; 3f6f: 60

partition_animation
    !byte spriteid_partition                                          ; 3f70: d3
    !byte spriteid_partition_falling                                  ; 3f71: d4
    !byte spriteid_partition_fallen                                   ; 3f72: d5

; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 20                                                          ; 3f73: 14                      ; initial player X cell
    !byte 22                                                          ; 3f74: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####      |                         ####
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ########  |  ###########################
; ########  |  ###########################
; ###       |                  |
; ###       |                  |
; ###       |                  |
; ###       |                  |
; ###       |                  |
; ###       |                  |   #######
; ###       |                  |   #######
; ###       |                  |       ###
; ###       |                  |       ###
; ###       |                  |       ###
; ###                                  ###
; ###                 P                ###
; ########################################
; ########################################
; set ground fill tile to use
room_0_code
    lda #<ground_fill_2x2_top_left                                    ; 3f75: a9 da
    sta source_sprite_memory_low                                      ; 3f77: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3f79: a9 44
    sta source_sprite_memory_high                                     ; 3f7b: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3f7d: a2 00
    ldy #0                                                            ; 3f7f: a0 00
    lda #$ff                                                          ; 3f81: a9 ff
    sta width_in_cells                                                ; 3f83: 85 3c
    lda #2                                                            ; 3f85: a9 02
    sta height_in_cells                                               ; 3f87: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f89: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3f8c: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3f8e: 20 bb 1a
; draw 4x1 rectangle at (0,2)
    ldy #2                                                            ; 3f91: a0 02
    lda #4                                                            ; 3f93: a9 04
    sta width_in_cells                                                ; 3f95: 85 3c
    dec height_in_cells                                               ; 3f97: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f99: 20 bb 1a
; draw 4x1 rectangle at (36,2)
    ldx #$24 ; '$'                                                    ; 3f9c: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 3f9e: 20 bb 1a
; draw 3x19 rectangle at (0,3)
    ldx #0                                                            ; 3fa1: a2 00
    iny                                                               ; 3fa3: c8
    dec width_in_cells                                                ; 3fa4: c6 3c
    lda #$13                                                          ; 3fa6: a9 13
    sta height_in_cells                                               ; 3fa8: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3faa: 20 bb 1a
; draw 3x5 rectangle at (37,3)
    ldx #$25 ; '%'                                                    ; 3fad: a2 25
    lda #5                                                            ; 3faf: a9 05
    sta height_in_cells                                               ; 3fb1: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fb3: 20 bb 1a
; draw 3x5 rectangle at (37,17)
    ldy #$11                                                          ; 3fb6: a0 11
    jsr copy_rectangle_of_memory_to_screen                            ; 3fb8: 20 bb 1a
; draw 5x2 rectangle at (3,8)
    ldx #3                                                            ; 3fbb: a2 03
    ldy #8                                                            ; 3fbd: a0 08
    lda #5                                                            ; 3fbf: a9 05
    sta width_in_cells                                                ; 3fc1: 85 3c
    lda #2                                                            ; 3fc3: a9 02
    sta height_in_cells                                               ; 3fc5: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fc7: 20 bb 1a
; draw 255x2 rectangle at (13,8)
    ldx #$0d                                                          ; 3fca: a2 0d
    lda #$ff                                                          ; 3fcc: a9 ff
    sta width_in_cells                                                ; 3fce: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3fd0: 20 bb 1a
; draw 255x2 rectangle at (33,15)
    ldx #$21 ; '!'                                                    ; 3fd3: a2 21
    ldy #$0f                                                          ; 3fd5: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3fd7: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3fda: 20 90 1b
; draw rope at (10,2) length 18
    ldx #$0a                                                          ; 3fdd: a2 0a
    ldy #2                                                            ; 3fdf: a0 02
    lda #$12                                                          ; 3fe1: a9 12
    jsr draw_rope                                                     ; 3fe3: 20 b9 1d
; draw rope at (29,10) length 10
    ldx #$1d                                                          ; 3fe6: a2 1d
    ldy #$0a                                                          ; 3fe8: a0 0a
    lda #$0a                                                          ; 3fea: a9 0a
    jsr draw_rope                                                     ; 3fec: 20 b9 1d
; draw cannonballs
    lda #0                                                            ; 3fef: a9 00
    sta sprite_x_base_high                                            ; 3ff1: 85 19
    sta sprite_y_base_high                                            ; 3ff3: 85 1b
    lda #spriteid_cannonball2                                         ; 3ff5: a9 d0
    sta sprite_id                                                     ; 3ff7: 85 16
    lda #$68 ; 'h'                                                    ; 3ff9: a9 68
    sta sprite_x_base_low                                             ; 3ffb: 85 18
    lda #$3e ; '>'                                                    ; 3ffd: a9 3e
    sta sprite_y_base_low                                             ; 3fff: 85 1a
; draw base of three cannonballs
    ldx #3                                                            ; 4001: a2 03
draw_base_loop
    jsr sprite_op                                                     ; 4003: 20 8d 13
    lda sprite_x_base_low                                             ; 4006: a5 18
    clc                                                               ; 4008: 18
    adc #8                                                            ; 4009: 69 08
    sta sprite_x_base_low                                             ; 400b: 85 18
    dex                                                               ; 400d: ca
    bne draw_base_loop                                                ; 400e: d0 f3
; draw second row of cannonballs
    lda #$6c ; 'l'                                                    ; 4010: a9 6c
    sta sprite_x_base_low                                             ; 4012: 85 18
    lda sprite_y_base_low                                             ; 4014: a5 1a
    sec                                                               ; 4016: 38
    sbc #6                                                            ; 4017: e9 06
    sta sprite_y_base_low                                             ; 4019: 85 1a
    ldx #2                                                            ; 401b: a2 02
draw_second_row_loop
    jsr sprite_op                                                     ; 401d: 20 8d 13
    lda sprite_x_base_low                                             ; 4020: a5 18
    clc                                                               ; 4022: 18
    adc #8                                                            ; 4023: 69 08
    sta sprite_x_base_low                                             ; 4025: 85 18
    dex                                                               ; 4027: ca
    bne draw_second_row_loop                                          ; 4028: d0 f3
; draw top cannonball
    lda #$70 ; 'p'                                                    ; 402a: a9 70
    sta sprite_x_base_low                                             ; 402c: 85 18
    lda sprite_y_base_low                                             ; 402e: a5 1a
    sec                                                               ; 4030: 38
    sbc #6                                                            ; 4031: e9 06
    sta sprite_y_base_low                                             ; 4033: 85 1a
    jsr sprite_op                                                     ; 4035: 20 8d 13
    jsr start_room                                                    ; 4038: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 403b: 20 da 12
    and #exit_room_right                                              ; 403e: 29 04
    beq room_0_game_update_loop                                       ; 4040: f0 f9
    ldx #1                                                            ; 4042: a2 01
    ldy current_level                                                 ; 4044: a4 31
    jmp initialise_level_and_room                                     ; 4046: 4c 40 11

babboon_room_0_animations
    !byte 0                                                           ; 4049: 00
babboon_room_0_move_up_animation
    !byte spriteid_babboon2                                           ; 404a: cd
    !byte 252                                                         ; 404b: fc
    !byte spriteid_babboon1                                           ; 404c: cc
    !byte 252                                                         ; 404d: fc
    !byte spriteid_babboon2                                           ; 404e: cd
    !byte 252                                                         ; 404f: fc
    !byte spriteid_babboon1                                           ; 4050: cc
    !byte 252                                                         ; 4051: fc
    !byte spriteid_babboon2                                           ; 4052: cd
    !byte 252                                                         ; 4053: fc
    !byte spriteid_babboon1                                           ; 4054: cc
    !byte 252                                                         ; 4055: fc
    !byte spriteid_babboon2                                           ; 4056: cd
    !byte 252                                                         ; 4057: fc
    !byte spriteid_babboon1                                           ; 4058: cc
    !byte 252                                                         ; 4059: fc
    !byte spriteid_babboon2                                           ; 405a: cd
    !byte 252                                                         ; 405b: fc
    !byte spriteid_babboon1                                           ; 405c: cc
    !byte 252                                                         ; 405d: fc
    !byte spriteid_babboon1                                           ; 405e: cc
    !byte 0                                                           ; 405f: 00
    !byte spriteid_babboon_push                                       ; 4060: ce
    !byte 0                                                           ; 4061: 00
    !byte spriteid_babboon_push                                       ; 4062: ce
    !byte   0, $80                                                    ; 4063: 00 80
babboon_room_0_move_down_animation
    !byte spriteid_babboon1                                           ; 4065: cc
    !byte 0                                                           ; 4066: 00
    !byte spriteid_babboon1                                           ; 4067: cc
    !byte 0                                                           ; 4068: 00
    !byte spriteid_babboon2                                           ; 4069: cd
    !byte 4                                                           ; 406a: 04
    !byte spriteid_babboon1                                           ; 406b: cc
    !byte 4                                                           ; 406c: 04
    !byte spriteid_babboon2                                           ; 406d: cd
    !byte 4                                                           ; 406e: 04
    !byte spriteid_babboon1                                           ; 406f: cc
    !byte 4                                                           ; 4070: 04
    !byte spriteid_babboon2                                           ; 4071: cd
    !byte 4                                                           ; 4072: 04
    !byte spriteid_babboon1                                           ; 4073: cc
    !byte 4                                                           ; 4074: 04
    !byte spriteid_babboon2                                           ; 4075: cd
    !byte 4                                                           ; 4076: 04
    !byte spriteid_babboon1                                           ; 4077: cc
    !byte 4                                                           ; 4078: 04
    !byte spriteid_babboon2                                           ; 4079: cd
    !byte 4                                                           ; 407a: 04
    !byte spriteid_babboon1                                           ; 407b: cc
    !byte 4                                                           ; 407c: 04
    !byte spriteid_babboon1                                           ; 407d: cc
    !byte   0, $80                                                    ; 407e: 00 80
babboon_room_0_stationary1_animation
    !byte spriteid_babboon1                                           ; 4080: cc
    !byte   0, $80                                                    ; 4081: 00 80
babboon_room_0_push_animation
    !byte spriteid_babboon_push                                       ; 4083: ce
    !byte 0                                                           ; 4084: 00
    !byte spriteid_babboon_push                                       ; 4085: ce
    !byte   0, $80                                                    ; 4086: 00 80
babboon_room_0_stationary2_animation
    !byte spriteid_babboon1                                           ; 4088: cc
    !byte   0, $80                                                    ; 4089: 00 80
; (dX,dY) pairs of bytes when throwing a cannonball
cannonball_throw_animation
    !byte 0                                                           ; 408b: 00
    !byte 8, 1                                                        ; 408c: 08 01
    !byte 16,  3                                                      ; 408e: 10 03
    !byte 24,  6                                                      ; 4090: 18 06
    !byte 32, 10                                                      ; 4092: 20 0a
    !byte 40, 16                                                      ; 4094: 28 10
    !byte 47, 24                                                      ; 4096: 2f 18
    !byte 54, 34                                                      ; 4098: 36 22
    !byte 60, 45                                                      ; 409a: 3c 2d
    !byte 65, 57                                                      ; 409c: 41 39
    !byte 68, 70                                                      ; 409e: 44 46
    !byte 0                                                           ; 40a0: 00

; check for first update in room (branch if not)
room_0_update_handler
    lda update_room_first_update_flag                                 ; 40a1: ad 2b 13
    beq update_babboon_animation_step                                 ; 40a4: f0 2b
; check for level change (branch if not)
    lda current_level                                                 ; 40a6: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 40a8: c5 51
    beq initialise_room_0                                             ; 40aa: f0 0d
; initialise level
    lda #$3f ; '?'                                                    ; 40ac: a9 3f
    sta save_game_level_j_room_0_babboon_animation                    ; 40ae: 8d 31 0a
    sta room_0_babboon_animation_step                                 ; 40b1: 8d 77 0a
    lda #$68 ; 'h'                                                    ; 40b4: a9 68
    sta room_0_babboon_y_low                                          ; 40b6: 8d 78 0a
initialise_room_0
    lda desired_room_index                                            ; 40b9: a5 30
    cmp #0                                                            ; 40bb: c9 00
    bne update_room_0_babboon_and_cannonball_puzzle_local             ; 40bd: d0 0f
    lda #spriteid_erase_babboon1_or_partition                         ; 40bf: a9 cf
    sta object_erase_type + objectid_babboon1                         ; 40c1: 8d af 38
    lda #$c0                                                          ; 40c4: a9 c0
    sta object_z_order + objectid_babboon1                            ; 40c6: 8d c5 38
    lda #$50 ; 'P'                                                    ; 40c9: a9 50
    sta object_x_low + objectid_babboon1                              ; 40cb: 8d 53 09
update_room_0_babboon_and_cannonball_puzzle_local
    jmp update_room_0_babboon_and_cannonball_puzzle                   ; 40ce: 4c 7a 41

update_babboon_animation_step
    lda room_0_babboon_animation_step                                 ; 40d1: ad 77 0a
    clc                                                               ; 40d4: 18
    adc #2                                                            ; 40d5: 69 02
    tay                                                               ; 40d7: a8
    lda babboon_room_0_animations,y                                   ; 40d8: b9 49 40
    cmp #$80                                                          ; 40db: c9 80
    bne check_if_room_0_babboon_is_climbing_up_rope                   ; 40dd: d0 03
    ldy save_game_level_j_room_0_babboon_animation                    ; 40df: ac 31 0a
check_if_room_0_babboon_is_climbing_up_rope
    lda save_game_level_j_room_0_babboon_animation                    ; 40e2: ad 31 0a
    cmp #babboon_room_0_move_up_animation - babboon_room_0_animations ; 40e5: c9 01
    bne check_if_room_0_babboon_is_stationary                         ; 40e7: d0 14
    cpy save_game_level_j_room_0_babboon_animation                    ; 40e9: cc 31 0a
    bne set_room_0_babboon_animation_step                             ; 40ec: d0 78
    ldy #babboon_room_0_move_down_animation - babboon_room_0_animations; 40ee: a0 1c
    lda #babboon_room_0_stationary1_animation - babboon_room_0_animations; 40f0: a9 37
    sta save_game_level_j_room_0_babboon_animation                    ; 40f2: 8d 31 0a
    lda #$ff                                                          ; 40f5: a9 ff
    sta room_0_cannonball_throw_animation_step                        ; 40f7: 8d 79 0a
    jmp set_room_0_babboon_animation_step                             ; 40fa: 4c 66 41

check_if_room_0_babboon_is_stationary
    lda save_game_level_j_room_0_babboon_animation                    ; 40fd: ad 31 0a
    cmp #babboon_room_0_stationary1_animation - babboon_room_0_animations; 4100: c9 37
    bne check_if_room_0_babboon_is_throwing_cannonball                ; 4102: d0 1a
    cpy save_game_level_j_room_0_babboon_animation                    ; 4104: cc 31 0a
    bne set_room_0_babboon_animation_step                             ; 4107: d0 5d
    lda desired_room_index                                            ; 4109: a5 30
    cmp #0                                                            ; 410b: c9 00
    bne set_room_0_babboon_animation_step                             ; 410d: d0 57
    lda #1                                                            ; 410f: a9 01
    sta room_0_cannonball_throw_animation_step                        ; 4111: 8d 79 0a
    ldy #babboon_room_0_push_animation - babboon_room_0_animations    ; 4114: a0 3a
    lda #babboon_room_0_stationary2_animation - babboon_room_0_animations; 4116: a9 3f
    sta save_game_level_j_room_0_babboon_animation                    ; 4118: 8d 31 0a
    jmp set_room_0_babboon_animation_step                             ; 411b: 4c 66 41

check_if_room_0_babboon_is_throwing_cannonball
    ldx room_0_cannonball_throw_animation_step                        ; 411e: ae 79 0a
    beq check_if_in_room_0_and_cannonball_animations_are_in_progress  ; 4121: f0 1f
    inx                                                               ; 4123: e8
    inx                                                               ; 4124: e8
    stx room_0_cannonball_throw_animation_step                        ; 4125: 8e 79 0a
    lda cannonball_throw_animation,x                                  ; 4128: bd 8b 40
    cmp #0                                                            ; 412b: c9 00
    bne set_room_0_babboon_animation_step                             ; 412d: d0 37
    lda #0                                                            ; 412f: a9 00
    sta room_0_cannonball_throw_animation_step                        ; 4131: 8d 79 0a
    lda desired_room_index                                            ; 4134: a5 30
    cmp #0                                                            ; 4136: c9 00
    bne set_room_0_babboon_animation_step                             ; 4138: d0 2c
    lda #spriteid_one_pixel_masked_out                                ; 413a: a9 00
    sta object_spriteid + objectid_cannonball                         ; 413c: 8d aa 09
    jmp set_room_0_babboon_animation_step                             ; 413f: 4c 66 41

check_if_in_room_0_and_cannonball_animations_are_in_progress
    lda desired_room_index                                            ; 4142: a5 30
    cmp #0                                                            ; 4144: c9 00
    bne set_room_0_babboon_animation_step                             ; 4146: d0 1e
    lda save_game_level_j_got_cannonball_progress                     ; 4148: ad 30 0a
    cmp #$ff                                                          ; 414b: c9 ff
    beq set_room_0_babboon_animation_step                             ; 414d: f0 17
    ora #0                                                            ; 414f: 09 00
    beq start_babboon_move_up_animation                               ; 4151: f0 0e
    lda desired_room_index                                            ; 4153: a5 30
    cmp cannonball_room                                               ; 4155: cd 75 0a
    beq set_room_0_babboon_animation_step                             ; 4158: f0 0c
    lda cannonball_fast_forward_steps                                 ; 415a: ad 6f 0a
    cmp #4                                                            ; 415d: c9 04
    bcc set_room_0_babboon_animation_step                             ; 415f: 90 05
start_babboon_move_up_animation
    ldy #babboon_room_0_move_up_animation - babboon_room_0_animations ; 4161: a0 01
    sty save_game_level_j_room_0_babboon_animation                    ; 4163: 8c 31 0a
set_room_0_babboon_animation_step
    sty room_0_babboon_animation_step                                 ; 4166: 8c 77 0a
    iny                                                               ; 4169: c8
    lda babboon_room_0_animations,y                                   ; 416a: b9 49 40
    clc                                                               ; 416d: 18
    adc room_0_babboon_y_low                                          ; 416e: 6d 78 0a
    sta room_0_babboon_y_low                                          ; 4171: 8d 78 0a
    jmp update_room_0_babboon_and_cannonball_puzzle                   ; 4174: 4c 7a 41

return6_local
    jmp return6                                                       ; 4177: 4c 2c 42

update_room_0_babboon_and_cannonball_puzzle
    lda desired_room_index                                            ; 417a: a5 30
    cmp #0                                                            ; 417c: c9 00
    bne return6_local                                                 ; 417e: d0 f7
    ldy room_0_babboon_animation_step                                 ; 4180: ac 77 0a
    lda babboon_room_0_animations,y                                   ; 4183: b9 49 40
    sta object_spriteid + objectid_babboon1                           ; 4186: 8d ab 09
    lda room_0_babboon_y_low                                          ; 4189: ad 78 0a
    sta object_y_low + objectid_babboon1                              ; 418c: 8d 7f 09
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 418f: ad 2b 13
    bne skip_setting_collision_result                                 ; 4192: d0 0e
    ldx #objectid_player                                              ; 4194: a2 00
    ldy #objectid_babboon1                                            ; 4196: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 4198: 20 e2 28
    beq skip_setting_collision_result                                 ; 419b: f0 05
; fall straight down
    lda #$80                                                          ; 419d: a9 80
    sta player_wall_collision_reaction_speed                          ; 419f: 8d 33 24
skip_setting_collision_result
    ldx room_0_cannonball_throw_animation_step                        ; 41a2: ae 79 0a
    beq return6_local                                                 ; 41a5: f0 d0
; set cannonball object, starting at the babboon coordinates with the cannonball and
; arm sprite
    lda #spriteid_erase_cannonball                                    ; 41a7: a9 c9
    sta object_erase_type + objectid_cannonball                       ; 41a9: 8d ae 38
    lda #$40 ; '@'                                                    ; 41ac: a9 40
    sta object_z_order + objectid_cannonball                          ; 41ae: 8d c4 38
    lda object_x_low + objectid_babboon1                              ; 41b1: ad 53 09
    sta object_x_low + objectid_cannonball                            ; 41b4: 8d 52 09
    lda #0                                                            ; 41b7: a9 00
    sta object_x_high + objectid_cannonball                           ; 41b9: 8d 68 09
    lda object_y_low + objectid_babboon1                              ; 41bc: ad 7f 09
    sta object_y_low + objectid_cannonball                            ; 41bf: 8d 7e 09
    lda #0                                                            ; 41c2: a9 00
    sta object_y_high + objectid_cannonball                           ; 41c4: 8d 94 09
    lda #1                                                            ; 41c7: a9 01
    sta object_direction + objectid_cannonball                        ; 41c9: 8d c0 09
    lda #spriteid_cannonball_and_arm                                  ; 41cc: a9 d1
    sta object_spriteid + objectid_cannonball                         ; 41ce: 8d aa 09
    cpx #$ff                                                          ; 41d1: e0 ff
    beq return6_local                                                 ; 41d3: f0 a2
; update cannonball position based on animation
    lda cannonball_throw_animation,x                                  ; 41d5: bd 8b 40
    clc                                                               ; 41d8: 18
    adc #$58 ; 'X'                                                    ; 41d9: 69 58
    sta object_x_low + objectid_cannonball                            ; 41db: 8d 52 09
    inx                                                               ; 41de: e8
    lda cannonball_throw_animation,x                                  ; 41df: bd 8b 40
    clc                                                               ; 41e2: 18
    adc #$68 ; 'h'                                                    ; 41e3: 69 68
    sta object_y_low + objectid_cannonball                            ; 41e5: 8d 7e 09
    lda #spriteid_cannonball2                                         ; 41e8: a9 d0
    sta object_spriteid + objectid_cannonball                         ; 41ea: 8d aa 09
    inx                                                               ; 41ed: e8
    lda cannonball_throw_animation,x                                  ; 41ee: bd 8b 40
    cmp #0                                                            ; 41f1: c9 00
    bne update_player_cannonball_collision_to_collect_cannonball      ; 41f3: d0 05
    lda #spriteid_collision                                           ; 41f5: a9 cb
    sta object_spriteid + objectid_cannonball                         ; 41f7: 8d aa 09
; check for first update in room (branch if so)
update_player_cannonball_collision_to_collect_cannonball
    lda update_room_first_update_flag                                 ; 41fa: ad 2b 13
    bne return6                                                       ; 41fd: d0 2d
    ldx #objectid_old_player                                          ; 41ff: a2 0b
    ldy #objectid_old_cannonball                                      ; 4201: a0 0d
    jsr test_for_collision_between_objects_x_and_y                    ; 4203: 20 e2 28
    beq test_for_cannonball_end_of_life                               ; 4206: f0 15
; cannonball collected
    lda #spriteid_cannonball_menu_item                                ; 4208: a9 ca
    jsr find_or_create_menu_slot_for_A                                ; 420a: 20 bd 2b
    lda #spriteid_one_pixel_masked_out                                ; 420d: a9 00
    sta object_spriteid + objectid_cannonball                         ; 420f: 8d aa 09
    sta room_0_cannonball_throw_animation_step                        ; 4212: 8d 79 0a
    lda #$ff                                                          ; 4215: a9 ff
    sta save_game_level_j_got_cannonball_progress                     ; 4217: 8d 30 0a
    jmp return6                                                       ; 421a: 4c 2c 42

test_for_cannonball_end_of_life
    lda object_spriteid + objectid_cannonball                         ; 421d: ad aa 09
    cmp #spriteid_collision                                           ; 4220: c9 cb
    bne return6                                                       ; 4222: d0 08
    jsr show_cannonball_collision                                     ; 4224: 20 33 43
    lda #0                                                            ; 4227: a9 00
    sta save_game_level_j_got_cannonball_progress                     ; 4229: 8d 30 0a
return6
    rts                                                               ; 422c: 60

cannonball_animations
    !byte 0                                                           ; 422d: 00
cannonball_animation1
    !byte 0, 0                                                        ; 422e: 00 00
    !byte   6, $fc                                                    ; 4230: 06 fc
    !byte   6, $ff                                                    ; 4232: 06 ff
    !byte 6, 2                                                        ; 4234: 06 02
    !byte 4, 4                                                        ; 4236: 04 04
    !byte 2, 6                                                        ; 4238: 02 06
    !byte $80                                                         ; 423a: 80
cannonball_animation2
    !byte 0, 8                                                        ; 423b: 00 08
    !byte $80                                                         ; 423d: 80
cannonball_animation3
    !byte 0, 0                                                        ; 423e: 00 00
    !byte $80                                                         ; 4240: 80

; check for first update in room (branch if not)
update_cannonball
    lda update_room_first_update_flag                                 ; 4241: ad 2b 13
    beq update_cannonball_not_first_update                            ; 4244: f0 5b
; initialise
    lda #spriteid_cannonball_menu_item                                ; 4246: a9 ca
    sta toolbar_collectable_spriteids+1                               ; 4248: 8d e9 2e
    lda #spriteid_cannonball1                                         ; 424b: a9 c8
    sta collectable_spriteids+1                                       ; 424d: 8d ee 2e
    sta collectable_being_used_spriteids + 1                          ; 4250: 8d f3 2e
    ldx #<envelope2                                                   ; 4253: a2 9e
    ldy #>envelope2                                                   ; 4255: a0 44
    jsr define_envelope                                               ; 4257: 20 5e 39
; check for level change (branch if not)
    lda current_level                                                 ; 425a: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 425c: c5 51
    beq check_if_cannonball_in_current_room                           ; 425e: f0 0c
    lda save_game_level_j_got_cannonball_progress                     ; 4260: ad 30 0a
    cmp #$ff                                                          ; 4263: c9 ff
    beq check_if_cannonball_in_current_room                           ; 4265: f0 05
; reset cannonball animation progress
    lda #0                                                            ; 4267: a9 00
    sta save_game_level_j_got_cannonball_progress                     ; 4269: 8d 30 0a
check_if_cannonball_in_current_room
    lda desired_room_index                                            ; 426c: a5 30
    cmp cannonball_room                                               ; 426e: cd 75 0a
    bne hide_cannonball1                                              ; 4271: d0 26
    lda save_game_level_j_got_cannonball_progress                     ; 4273: ad 30 0a
    beq hide_cannonball1                                              ; 4276: f0 21
    cmp #$ff                                                          ; 4278: c9 ff
    beq hide_cannonball1                                              ; 427a: f0 1d
    jsr set_cannonball_object                                         ; 427c: 20 64 44
fast_forward_cannonball_loop
    lda desired_room_index                                            ; 427f: a5 30
    cmp cannonball_room                                               ; 4281: cd 75 0a
    bne hide_cannonball1                                              ; 4284: d0 13
    lda cannonball_fast_forward_steps                                 ; 4286: ad 6f 0a
    beq hide_cannonball1                                              ; 4289: f0 0e
    dec cannonball_fast_forward_steps                                 ; 428b: ce 6f 0a
    ldx #objectid_cannonball                                          ; 428e: a2 02
    jsr copy_object_state_to_old                                      ; 4290: 20 f7 20
    jsr move_to_next_cannonball_animation_step                        ; 4293: 20 73 43
    jmp fast_forward_cannonball_loop                                  ; 4296: 4c 7f 42

hide_cannonball1
    lda #spriteid_one_pixel_masked_out                                ; 4299: a9 00
    sta object_spriteid_old + objectid_cannonball                     ; 429b: 8d b5 09
return7_local
    jmp return7                                                       ; 429e: 4c 32 43

update_cannonball_not_first_update
    lda object_spriteid_old + objectid_cannonball                     ; 42a1: ad b5 09
    sta remember_cannonball_spriteid                                  ; 42a4: 8d 63 44
    lda save_game_level_j_got_cannonball_progress                     ; 42a7: ad 30 0a
    beq return7_local                                                 ; 42aa: f0 f2
    bmi check_if_player_is_using_cannonball                           ; 42ac: 30 12
    lda desired_room_index                                            ; 42ae: a5 30
    cmp cannonball_room                                               ; 42b0: cd 75 0a
    beq update_cannonball_in_room                                     ; 42b3: f0 5b
    lda cannonball_fast_forward_steps                                 ; 42b5: ad 6f 0a
    bmi return7_local                                                 ; 42b8: 30 e4
    inc cannonball_fast_forward_steps                                 ; 42ba: ee 6f 0a
    jmp return7                                                       ; 42bd: 4c 32 43

check_if_player_is_using_cannonball
    lda #spriteid_cannonball_menu_item                                ; 42c0: a9 ca
    cmp player_using_object_spriteid                                  ; 42c2: cd b6 2e
    bne return7_local                                                 ; 42c5: d0 d7
; check if just stopped 'using' cannonball
    cmp previous_player_using_object_spriteid                         ; 42c7: cd b7 2e
    beq return7_local                                                 ; 42ca: f0 d2
; remove cannonabll from toolbar
    lda #spriteid_cannonball_menu_item                                ; 42cc: a9 ca
    jsr remove_item_from_toolbar_menu                                 ; 42ce: 20 e0 2b
; remove accessory object
    lda #0                                                            ; 42d1: a9 00
    sta object_spriteid + objectid_player_accessory                   ; 42d3: 8d a9 09
    sta player_using_object_spriteid                                  ; 42d6: 8d b6 2e
    sta player_held_object_spriteid                                   ; 42d9: 85 52
; add cannonball to room
    lda desired_room_index                                            ; 42db: a5 30
    sta cannonball_room                                               ; 42dd: 8d 75 0a
; set current and next animations
    lda #cannonball_animation1 - cannonball_animations                ; 42e0: a9 01
    sta cannonball_animation_step                                     ; 42e2: 8d 76 0a
    lda #cannonball_animation2 - cannonball_animations                ; 42e5: a9 0e
    sta save_game_level_j_got_cannonball_progress                     ; 42e7: 8d 30 0a
; set cannonball position to be where accessory was
    lda object_x_low + objectid_player_accessory                      ; 42ea: ad 51 09
    sta cannonball_x_low                                              ; 42ed: 8d 70 0a
    lda object_x_high + objectid_player_accessory                     ; 42f0: ad 67 09
    sta cannonball_x_high                                             ; 42f3: 8d 71 0a
    lda object_y_low + objectid_player_accessory                      ; 42f6: ad 7d 09
    sta cannonball_y_low                                              ; 42f9: 8d 72 0a
    lda object_y_high + objectid_player_accessory                     ; 42fc: ad 93 09
    sta cannonball_y_high                                             ; 42ff: 8d 73 0a
; set cannonball direction
    lda object_direction                                              ; 4302: ad be 09
    sta cannonball_direction                                          ; 4305: 8d 74 0a
    jsr set_cannonball_object                                         ; 4308: 20 64 44
; cannonball was drawn as accessory object, so copy to the old state
    ldx #objectid_cannonball                                          ; 430b: a2 02
    jsr copy_object_state_to_old                                      ; 430d: 20 f7 20
update_cannonball_in_room
    jsr move_to_next_cannonball_animation_step                        ; 4310: 20 73 43
    lda remember_cannonball_spriteid                                  ; 4313: ad 63 44
    sta object_spriteid_old + objectid_cannonball                     ; 4316: 8d b5 09
    lda desired_room_index                                            ; 4319: a5 30
    cmp cannonball_room                                               ; 431b: cd 75 0a
    beq check_cannonball_last_animation                               ; 431e: f0 08
    lda #0                                                            ; 4320: a9 00
    sta cannonball_fast_forward_steps                                 ; 4322: 8d 6f 0a
    jmp return7                                                       ; 4325: 4c 32 43

check_cannonball_last_animation
    lda cannonball_animation_step                                     ; 4328: ad 76 0a
    cmp #cannonball_animation3 - cannonball_animations                ; 432b: c9 11
    bne return7                                                       ; 432d: d0 03
    jsr show_cannonball_collision                                     ; 432f: 20 33 43
return7
    rts                                                               ; 4332: 60

show_cannonball_collision
    lda #spriteid_collision                                           ; 4333: a9 cb
    sta object_spriteid + objectid_cannonball                         ; 4335: 8d aa 09
    lda #cannonball_animation3 - cannonball_animations                ; 4338: a9 11
    sta save_game_level_j_got_cannonball_progress                     ; 433a: 8d 30 0a
    sta cannonball_animation_step                                     ; 433d: 8d 76 0a
    lda #0                                                            ; 4340: a9 00
    ldx #<sound1                                                      ; 4342: a2 b4
    ldy #>sound1                                                      ; 4344: a0 44
    jsr play_sound_yx                                                 ; 4346: 20 f6 38
    ldx #<sound2                                                      ; 4349: a2 ac
    ldy #>sound2                                                      ; 434b: a0 44
    jsr play_sound_yx                                                 ; 434d: 20 f6 38
; check player cannonball collision
    ldx #objectid_player                                              ; 4350: a2 00
    ldy #objectid_cannonball                                          ; 4352: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 4354: 20 e2 28
    beq return8                                                       ; 4357: f0 19
; decide on reaction direction based on relative x position of the cannonball and
; player
    lda #$fa                                                          ; 4359: a9 fa
    sta player_wall_collision_reaction_speed                          ; 435b: 8d 33 24
    lda object_x_low + objectid_cannonball                            ; 435e: ad 52 09
    sec                                                               ; 4361: 38
    sbc object_x_low                                                  ; 4362: ed 50 09
    lda object_x_high + objectid_cannonball                           ; 4365: ad 68 09
    sbc object_x_high                                                 ; 4368: ed 66 09
    bpl return8                                                       ; 436b: 10 05
    lda #6                                                            ; 436d: a9 06
    sta player_wall_collision_reaction_speed                          ; 436f: 8d 33 24
return8
    rts                                                               ; 4372: 60

move_to_next_cannonball_animation_step
    lda cannonball_animation_step                                     ; 4373: ad 76 0a
    clc                                                               ; 4376: 18
    adc #2                                                            ; 4377: 69 02
    tay                                                               ; 4379: a8
    lda cannonball_animations,y                                       ; 437a: b9 2d 42
    cmp #$80                                                          ; 437d: c9 80
    bne check_for_final_cannonball_animation                          ; 437f: d0 03
    ldy save_game_level_j_got_cannonball_progress                     ; 4381: ac 30 0a
check_for_final_cannonball_animation
    lda save_game_level_j_got_cannonball_progress                     ; 4384: ad 30 0a
    cmp #cannonball_animation3 - cannonball_animations                ; 4387: c9 11
    bne save_cannonball_animation_step                                ; 4389: d0 16
    cpy save_game_level_j_got_cannonball_progress                     ; 438b: cc 30 0a
    bne save_cannonball_animation_step                                ; 438e: d0 11
    lda #0                                                            ; 4390: a9 00
    sta cannonball_animation_step                                     ; 4392: 8d 76 0a
    sta save_game_level_j_got_cannonball_progress                     ; 4395: 8d 30 0a
    sta object_spriteid + objectid_cannonball                         ; 4398: 8d aa 09
    sta cannonball_fast_forward_steps                                 ; 439b: 8d 6f 0a
    jmp return9                                                       ; 439e: 4c 62 44

save_cannonball_animation_step
    sty cannonball_animation_step                                     ; 43a1: 8c 76 0a
    lda cannonball_animations,y                                       ; 43a4: b9 2d 42
    ldx cannonball_direction                                          ; 43a7: ae 74 0a
    bpl sign_extend_based_on_direction                                ; 43aa: 10 05
    eor #$ff                                                          ; 43ac: 49 ff
    clc                                                               ; 43ae: 18
    adc #1                                                            ; 43af: 69 01
sign_extend_based_on_direction
    ldx #0                                                            ; 43b1: a2 00
    ora #0                                                            ; 43b3: 09 00
    bpl add_animation_with_direction_to_cannonball_x                  ; 43b5: 10 01
    dex                                                               ; 43b7: ca
add_animation_with_direction_to_cannonball_x
    clc                                                               ; 43b8: 18
    adc cannonball_x_low                                              ; 43b9: 6d 70 0a
    sta cannonball_x_low                                              ; 43bc: 8d 70 0a
    txa                                                               ; 43bf: 8a
    adc cannonball_x_high                                             ; 43c0: 6d 71 0a
    sta cannonball_x_high                                             ; 43c3: 8d 71 0a
    iny                                                               ; 43c6: c8
    lda cannonball_animations,y                                       ; 43c7: b9 2d 42
    ldx #0                                                            ; 43ca: a2 00
    ora #0                                                            ; 43cc: 09 00
    bpl add_animation_to_cannonball_y                                 ; 43ce: 10 01
    dex                                                               ; 43d0: ca
add_animation_to_cannonball_y
    clc                                                               ; 43d1: 18
    adc cannonball_y_low                                              ; 43d2: 6d 72 0a
    sta cannonball_y_low                                              ; 43d5: 8d 72 0a
    txa                                                               ; 43d8: 8a
    adc cannonball_y_high                                             ; 43d9: 6d 73 0a
    sta cannonball_y_high                                             ; 43dc: 8d 73 0a
    jsr set_cannonball_object                                         ; 43df: 20 64 44
; update based on collision with room
    lda #objectid_cannonball                                          ; 43e2: a9 02
    jsr update_object_a_solid_rock_collision                          ; 43e4: 20 f5 25
    lda object_x_low + objectid_cannonball                            ; 43e7: ad 52 09
    sta cannonball_x_low                                              ; 43ea: 8d 70 0a
    lda object_x_high + objectid_cannonball                           ; 43ed: ad 68 09
    sta cannonball_x_high                                             ; 43f0: 8d 71 0a
    lda object_y_low + objectid_cannonball                            ; 43f3: ad 7e 09
    sta cannonball_y_low                                              ; 43f6: 8d 72 0a
    lda object_y_high + objectid_cannonball                           ; 43f9: ad 94 09
    sta cannonball_y_high                                             ; 43fc: 8d 73 0a
; check for collision with extra surround
    dec temp_top_offset                                               ; 43ff: ce 50 25
    lda #2                                                            ; 4402: a9 02
    sta temp_bottom_offset                                            ; 4404: 8d 51 25
    dec temp_left_offset                                              ; 4407: ce d0 24
    inc temp_right_offset                                             ; 440a: ee d1 24
    lda #objectid_cannonball                                          ; 440d: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 440f: 20 94 28
    beq no_collision                                                  ; 4412: f0 0b
    lda #cannonball_animation3 - cannonball_animations                ; 4414: a9 11
    sta save_game_level_j_got_cannonball_progress                     ; 4416: 8d 30 0a
    sta cannonball_animation_step                                     ; 4419: 8d 76 0a
    jsr set_cannonball_object                                         ; 441c: 20 64 44
no_collision
    ldx #objectid_cannonball                                          ; 441f: a2 02
    jsr find_left_and_right_of_object                                 ; 4421: 20 34 24
    jsr find_top_and_bottom_of_object                                 ; 4424: 20 d2 24
    lda cannonball_direction                                          ; 4427: ad 74 0a
    bmi cannonball_move_left_one_room_if_needed                       ; 442a: 30 1c
; cannonball move right one room if needed
    lda object_left_cell_x                                            ; 442c: a5 78
    cmp #game_area_width_cells                                        ; 442e: c9 28
    bcc return9                                                       ; 4430: 90 30
    lda cannonball_x_low                                              ; 4432: ad 70 0a
    sec                                                               ; 4435: 38
    sbc #$40 ; '@'                                                    ; 4436: e9 40
    sta cannonball_x_low                                              ; 4438: 8d 70 0a
    lda #0                                                            ; 443b: a9 00
    sbc #0                                                            ; 443d: e9 00
    sta cannonball_x_high                                             ; 443f: 8d 71 0a
    inc cannonball_room                                               ; 4442: ee 75 0a
    jmp hide_cannonball2                                              ; 4445: 4c 5d 44

cannonball_move_left_one_room_if_needed
    lda object_right_cell_x                                           ; 4448: a5 79
    bpl return9                                                       ; 444a: 10 16
    lda cannonball_x_low                                              ; 444c: ad 70 0a
    clc                                                               ; 444f: 18
    adc #$40 ; '@'                                                    ; 4450: 69 40
    sta cannonball_x_low                                              ; 4452: 8d 70 0a
    lda #1                                                            ; 4455: a9 01
    sta cannonball_x_high                                             ; 4457: 8d 71 0a
    dec cannonball_room                                               ; 445a: ce 75 0a
hide_cannonball2
    lda #spriteid_one_pixel_masked_out                                ; 445d: a9 00
    sta object_spriteid + objectid_cannonball                         ; 445f: 8d aa 09
return9
    rts                                                               ; 4462: 60

remember_cannonball_spriteid
    !byte 0                                                           ; 4463: 00

set_cannonball_object
    lda #spriteid_erase_cannonball                                    ; 4464: a9 c9
    sta object_erase_type + objectid_cannonball                       ; 4466: 8d ae 38
    lda #$40 ; '@'                                                    ; 4469: a9 40
    sta object_z_order + objectid_cannonball                          ; 446b: 8d c4 38
    lda cannonball_x_low                                              ; 446e: ad 70 0a
    sta object_x_low + objectid_cannonball                            ; 4471: 8d 52 09
    lda cannonball_x_high                                             ; 4474: ad 71 0a
    sta object_x_high + objectid_cannonball                           ; 4477: 8d 68 09
    lda cannonball_y_low                                              ; 447a: ad 72 0a
    sta object_y_low + objectid_cannonball                            ; 447d: 8d 7e 09
    lda cannonball_y_high                                             ; 4480: ad 73 0a
    sta object_y_high + objectid_cannonball                           ; 4483: 8d 94 09
    lda cannonball_direction                                          ; 4486: ad 74 0a
    sta object_direction + objectid_cannonball                        ; 4489: 8d c0 09
    lda #spriteid_cannonball1                                         ; 448c: a9 c8
    sta object_spriteid + objectid_cannonball                         ; 448e: 8d aa 09
    lda save_game_level_j_got_cannonball_progress                     ; 4491: ad 30 0a
    cmp #cannonball_animation3 - cannonball_animations                ; 4494: c9 11
    bne return10                                                      ; 4496: d0 05
    lda #spriteid_collision                                           ; 4498: a9 cb
    sta object_spriteid + objectid_cannonball                         ; 449a: 8d aa 09
return10
    rts                                                               ; 449d: 60

envelope2
    !byte 5                                                           ; 449e: 05                      ; envelope number
    !byte 1                                                           ; 449f: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 44a0: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 44a1: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 44a2: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 44a3: 00                      ; number of steps in section 1
    !byte 0                                                           ; 44a4: 00                      ; number of steps in section 2
    !byte 0                                                           ; 44a5: 00                      ; number of steps in section 3
    !byte 126                                                         ; 44a6: 7e                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 44a7: 00                      ; change of amplitude per step during decay phase
    !byte 252                                                         ; 44a8: fc                      ; change of amplitude per step during sustain phase
    !byte 248                                                         ; 44a9: f8                      ; change of amplitude per step during release phase
    !byte 126                                                         ; 44aa: 7e                      ; target of level at end of attack phase
    !byte 0                                                           ; 44ab: 00                      ; target of level at end of decay phase
sound2
    !word $10                                                         ; 44ac: 10 00                   ; channel
    !word 5                                                           ; 44ae: 05 00                   ; amplitude
    !word 7                                                           ; 44b0: 07 00                   ; pitch
    !word 1                                                           ; 44b2: 01 00                   ; duration
sound1
    !word $11                                                         ; 44b4: 11 00                   ; channel
    !word 0                                                           ; 44b6: 00 00                   ; amplitude
    !word 220                                                         ; 44b8: dc 00                   ; pitch
    !word 1                                                           ; 44ba: 01 00                   ; duration
envelope1
    !byte 6                                                           ; 44bc: 06                      ; envelope number
    !byte 1                                                           ; 44bd: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 44be: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 44bf: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 44c0: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 44c1: 00                      ; number of steps in section 1
    !byte 0                                                           ; 44c2: 00                      ; number of steps in section 2
    !byte 0                                                           ; 44c3: 00                      ; number of steps in section 3
    !byte 80                                                          ; 44c4: 50                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 44c5: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 44c6: 00                      ; change of amplitude per step during sustain phase
    !byte 250                                                         ; 44c7: fa                      ; change of amplitude per step during release phase
    !byte 115                                                         ; 44c8: 73                      ; target of level at end of attack phase
    !byte 0                                                           ; 44c9: 00                      ; target of level at end of decay phase
sound3
    !word $10                                                         ; 44ca: 10 00                   ; channel
    !word 6                                                           ; 44cc: 06 00                   ; amplitude
    !word 7                                                           ; 44ce: 07 00                   ; pitch
    !word 1                                                           ; 44d0: 01 00                   ; duration
sound4
    !word $11                                                         ; 44d2: 11 00                   ; channel
    !word 0                                                           ; 44d4: 00 00                   ; amplitude
    !word 240                                                         ; 44d6: f0 00                   ; pitch
    !word 1                                                           ; 44d8: 01 00                   ; duration
ground_fill_2x2_top_left
    !byte %.#....#.                                                   ; 44da: 42
    !byte %#......#                                                   ; 44db: 81
    !byte %........                                                   ; 44dc: 00
    !byte %........                                                   ; 44dd: 00
    !byte %......##                                                   ; 44de: 03
    !byte %.....#..                                                   ; 44df: 04
    !byte %#...#...                                                   ; 44e0: 88
    !byte %.#..#...                                                   ; 44e1: 48
ground_fill_2x2_top_right
    !byte %.#....#.                                                   ; 44e2: 42
    !byte %#......#                                                   ; 44e3: 81
    !byte %........                                                   ; 44e4: 00
    !byte %........                                                   ; 44e5: 00
    !byte %##......                                                   ; 44e6: c0
    !byte %..#.....                                                   ; 44e7: 20
    !byte %...#...#                                                   ; 44e8: 11
    !byte %...#..#.                                                   ; 44e9: 12
ground_fill_2x2_bottom_left
    !byte %.#..#...                                                   ; 44ea: 48
    !byte %#...#...                                                   ; 44eb: 88
    !byte %.....#..                                                   ; 44ec: 04
    !byte %......##                                                   ; 44ed: 03
    !byte %........                                                   ; 44ee: 00
    !byte %........                                                   ; 44ef: 00
    !byte %#......#                                                   ; 44f0: 81
    !byte %.#....#.                                                   ; 44f1: 42
ground_fill_2x2_bottom_right
    !byte %...#..#.                                                   ; 44f2: 12
    !byte %...#...#                                                   ; 44f3: 11
    !byte %..#.....                                                   ; 44f4: 20
    !byte %##......                                                   ; 44f5: c0
    !byte %........                                                   ; 44f6: 00
    !byte %........                                                   ; 44f7: 00
    !byte %#......#                                                   ; 44f8: 81
    !byte %.#....#.                                                   ; 44f9: 42
sprite_data
pydis_end
!if (<envelope1) != $bc {
    !error "Assertion failed: <envelope1 == $bc"
}
!if (<envelope2) != $9e {
    !error "Assertion failed: <envelope2 == $9e"
}
!if (<ground_fill_2x2_top_left) != $da {
    !error "Assertion failed: <ground_fill_2x2_top_left == $da"
}
!if (<sound1) != $b4 {
    !error "Assertion failed: <sound1 == $b4"
}
!if (<sound2) != $ac {
    !error "Assertion failed: <sound2 == $ac"
}
!if (<sound3) != $ca {
    !error "Assertion failed: <sound3 == $ca"
}
!if (<sound4) != $d2 {
    !error "Assertion failed: <sound4 == $d2"
}
!if (>envelope1) != $44 {
    !error "Assertion failed: >envelope1 == $44"
}
!if (>envelope2) != $44 {
    !error "Assertion failed: >envelope2 == $44"
}
!if (>ground_fill_2x2_top_left) != $44 {
    !error "Assertion failed: >ground_fill_2x2_top_left == $44"
}
!if (>sound1) != $44 {
    !error "Assertion failed: >sound1 == $44"
}
!if (>sound2) != $44 {
    !error "Assertion failed: >sound2 == $44"
}
!if (>sound3) != $44 {
    !error "Assertion failed: >sound3 == $44"
}
!if (>sound4) != $44 {
    !error "Assertion failed: >sound4 == $44"
}
!if (babboon_climb_down_animation - babboon_base_animation) != $09 {
    !error "Assertion failed: babboon_climb_down_animation - babboon_base_animation == $09"
}
!if (babboon_climb_up_animation - babboon_base_animation) != $04 {
    !error "Assertion failed: babboon_climb_up_animation - babboon_base_animation == $04"
}
!if (babboon_idle_animation - babboon_base_animation) != $01 {
    !error "Assertion failed: babboon_idle_animation - babboon_base_animation == $01"
}
!if (babboon_room_0_move_down_animation - babboon_room_0_animations) != $1c {
    !error "Assertion failed: babboon_room_0_move_down_animation - babboon_room_0_animations == $1c"
}
!if (babboon_room_0_move_up_animation - babboon_room_0_animations) != $01 {
    !error "Assertion failed: babboon_room_0_move_up_animation - babboon_room_0_animations == $01"
}
!if (babboon_room_0_push_animation - babboon_room_0_animations) != $3a {
    !error "Assertion failed: babboon_room_0_push_animation - babboon_room_0_animations == $3a"
}
!if (babboon_room_0_stationary1_animation - babboon_room_0_animations) != $37 {
    !error "Assertion failed: babboon_room_0_stationary1_animation - babboon_room_0_animations == $37"
}
!if (babboon_room_0_stationary2_animation - babboon_room_0_animations) != $3f {
    !error "Assertion failed: babboon_room_0_stationary2_animation - babboon_room_0_animations == $3f"
}
!if (cannonball_animation1 - cannonball_animations) != $01 {
    !error "Assertion failed: cannonball_animation1 - cannonball_animations == $01"
}
!if (cannonball_animation2 - cannonball_animations) != $0e {
    !error "Assertion failed: cannonball_animation2 - cannonball_animations == $0e"
}
!if (cannonball_animation3 - cannonball_animations) != $11 {
    !error "Assertion failed: cannonball_animation3 - cannonball_animations == $11"
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
!if (game_area_width_cells) != $28 {
    !error "Assertion failed: game_area_width_cells == $28"
}
!if (level_specific_initialisation) != $3af2 {
    !error "Assertion failed: level_specific_initialisation == $3af2"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b0f {
    !error "Assertion failed: level_specific_update == $3b0f"
}
!if (object_direction + objectid_babboon1) != $09c1 {
    !error "Assertion failed: object_direction + objectid_babboon1 == $09c1"
}
!if (object_direction + objectid_babboon2) != $09c2 {
    !error "Assertion failed: object_direction + objectid_babboon2 == $09c2"
}
!if (object_direction + objectid_babboon3) != $09c3 {
    !error "Assertion failed: object_direction + objectid_babboon3 == $09c3"
}
!if (object_direction + objectid_cannonball) != $09c0 {
    !error "Assertion failed: object_direction + objectid_cannonball == $09c0"
}
!if (object_erase_type + objectid_babboon1) != $38af {
    !error "Assertion failed: object_erase_type + objectid_babboon1 == $38af"
}
!if (object_erase_type + objectid_babboon2) != $38b0 {
    !error "Assertion failed: object_erase_type + objectid_babboon2 == $38b0"
}
!if (object_erase_type + objectid_babboon3) != $38b1 {
    !error "Assertion failed: object_erase_type + objectid_babboon3 == $38b1"
}
!if (object_erase_type + objectid_partition) != $38b0 {
    !error "Assertion failed: object_erase_type + objectid_partition == $38b0"
}
!if (object_spriteid + objectid_babboon1) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_babboon1 == $09ab"
}
!if (object_spriteid + objectid_cannonball) != $09aa {
    !error "Assertion failed: object_spriteid + objectid_cannonball == $09aa"
}
!if (object_spriteid + objectid_partition) != $09ac {
    !error "Assertion failed: object_spriteid + objectid_partition == $09ac"
}
!if (object_spriteid_old + objectid_cannonball) != $09b5 {
    !error "Assertion failed: object_spriteid_old + objectid_cannonball == $09b5"
}
!if (object_x_high + objectid_cannonball) != $0968 {
    !error "Assertion failed: object_x_high + objectid_cannonball == $0968"
}
!if (object_x_low + objectid_babboon1) != $0953 {
    !error "Assertion failed: object_x_low + objectid_babboon1 == $0953"
}
!if (object_x_low + objectid_babboon2) != $0954 {
    !error "Assertion failed: object_x_low + objectid_babboon2 == $0954"
}
!if (object_x_low + objectid_babboon3) != $0955 {
    !error "Assertion failed: object_x_low + objectid_babboon3 == $0955"
}
!if (object_x_low + objectid_cannonball) != $0952 {
    !error "Assertion failed: object_x_low + objectid_cannonball == $0952"
}
!if (object_y_high + objectid_cannonball) != $0994 {
    !error "Assertion failed: object_y_high + objectid_cannonball == $0994"
}
!if (object_y_low + objectid_babboon1) != $097f {
    !error "Assertion failed: object_y_low + objectid_babboon1 == $097f"
}
!if (object_y_low + objectid_cannonball) != $097e {
    !error "Assertion failed: object_y_low + objectid_cannonball == $097e"
}
!if (object_z_order + objectid_babboon1) != $38c5 {
    !error "Assertion failed: object_z_order + objectid_babboon1 == $38c5"
}
!if (object_z_order + objectid_cannonball) != $38c4 {
    !error "Assertion failed: object_z_order + objectid_cannonball == $38c4"
}
!if (object_z_order + objectid_partition) != $38c6 {
    !error "Assertion failed: object_z_order + objectid_partition == $38c6"
}
!if (objectid_babboon1) != $03 {
    !error "Assertion failed: objectid_babboon1 == $03"
}
!if (objectid_babboon2) != $04 {
    !error "Assertion failed: objectid_babboon2 == $04"
}
!if (objectid_babboon3) != $05 {
    !error "Assertion failed: objectid_babboon3 == $05"
}
!if (objectid_cannonball) != $02 {
    !error "Assertion failed: objectid_cannonball == $02"
}
!if (objectid_old_cannonball) != $0d {
    !error "Assertion failed: objectid_old_cannonball == $0d"
}
!if (objectid_old_player) != $0b {
    !error "Assertion failed: objectid_old_player == $0b"
}
!if (objectid_partition) != $04 {
    !error "Assertion failed: objectid_partition == $04"
}
!if (objectid_player) != $00 {
    !error "Assertion failed: objectid_player == $00"
}
!if (objectid_spell) != $03 {
    !error "Assertion failed: objectid_spell == $03"
}
!if (room_0_data) != $3f73 {
    !error "Assertion failed: room_0_data == $3f73"
}
!if (room_1_data) != $3b1f {
    !error "Assertion failed: room_1_data == $3b1f"
}
!if (room_2_data) != $3ca2 {
    !error "Assertion failed: room_2_data == $3ca2"
}
!if (room_3_data) != $3e05 {
    !error "Assertion failed: room_3_data == $3e05"
}
!if (sprite_data - level_data) != $0a25 {
    !error "Assertion failed: sprite_data - level_data == $0a25"
}
!if (spriteid_babboon1) != $cc {
    !error "Assertion failed: spriteid_babboon1 == $cc"
}
!if (spriteid_babboon2) != $cd {
    !error "Assertion failed: spriteid_babboon2 == $cd"
}
!if (spriteid_babboon_push) != $ce {
    !error "Assertion failed: spriteid_babboon_push == $ce"
}
!if (spriteid_cannonball1) != $c8 {
    !error "Assertion failed: spriteid_cannonball1 == $c8"
}
!if (spriteid_cannonball2) != $d0 {
    !error "Assertion failed: spriteid_cannonball2 == $d0"
}
!if (spriteid_cannonball_and_arm) != $d1 {
    !error "Assertion failed: spriteid_cannonball_and_arm == $d1"
}
!if (spriteid_cannonball_menu_item) != $ca {
    !error "Assertion failed: spriteid_cannonball_menu_item == $ca"
}
!if (spriteid_collision) != $cb {
    !error "Assertion failed: spriteid_collision == $cb"
}
!if (spriteid_erase_babboon1_or_partition) != $cf {
    !error "Assertion failed: spriteid_erase_babboon1_or_partition == $cf"
}
!if (spriteid_erase_babboon2) != $d6 {
    !error "Assertion failed: spriteid_erase_babboon2 == $d6"
}
!if (spriteid_erase_babboon3) != $d7 {
    !error "Assertion failed: spriteid_erase_babboon3 == $d7"
}
!if (spriteid_erase_cannonball) != $c9 {
    !error "Assertion failed: spriteid_erase_cannonball == $c9"
}
!if (spriteid_one_pixel_masked_out) != $00 {
    !error "Assertion failed: spriteid_one_pixel_masked_out == $00"
}
!if (spriteid_partition) != $d3 {
    !error "Assertion failed: spriteid_partition == $d3"
}
!if (spriteid_partition_fallen) != $d5 {
    !error "Assertion failed: spriteid_partition_fallen == $d5"
}
!if (spriteid_partition_falling) != $d4 {
    !error "Assertion failed: spriteid_partition_falling == $d4"
}
!if (spriteid_partition_remains) != $d2 {
    !error "Assertion failed: spriteid_partition_remains == $d2"
}
