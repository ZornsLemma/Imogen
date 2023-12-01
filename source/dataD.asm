; *************************************************************************************
;
; Level D: 'GNU-PROBLEM'
;
; Save game variables:
;
;     save_game_level_d_got_axe ($0a03):
;               0: not got
;             $ff: got
;     save_game_level_d_got_gun ($0a0f):
;               0: not got
;             $ff: got
;     save_game_level_d_gnu_sign_position ($0a10):
;             $20-$30: X position of 'GNU CLIMBING' sign
;     save_game_level_d_partition_progress ($0a11):
;               0: normal position
;               1: falling
;             $ff: fallen
;     save_game_level_d_baby_progress ($0a12):
;               0: not started
;             $12: sleeping
;             $14: blocking exit
;             $21: surprised
;             $2c: dead
;
; Solution:
;
;   1. Get gun in the far right room
;   2. Shoot the baby to escape the room
;   3. In the far left room, shoot the gnu climbing sign until it is no longer visible
;   4. Get the axe
;   5. Move two rooms to the right, climb up the rope and move into the room to the left.
;   6. Shoot the sign until it's back offscreen to the left.
;   7. Climb up the rope, over the gnu head, then back to exit the room at the top right.
;   8. Chop down the wooden partition wall with the axe, and collect the spell.
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
objectid_axe                          = 3
objectid_baby                         = 5
objectid_gun                          = 3
objectid_old_player                   = 11
objectid_old_player_accessory         = 12
objectid_partition                    = 4
objectid_player                       = 0
objectid_player_accessory             = 1
objectid_sign                         = 5
objectid_sign_stand                   = 4
opcode_jmp                            = 76
sprite_op_flags_copy_screen           = 1
sprite_op_flags_erase_to_bg_colour    = 2
sprite_op_flags_erase_to_fg_colour    = 4
sprite_op_flags_normal                = 0
spriteid_197                          = 197
spriteid_axe                          = 201
spriteid_axe_menu_item                = 202
spriteid_baby_dead                    = 218
spriteid_baby_sit                     = 220
spriteid_baby_smile                   = 216
spriteid_baby_surprise                = 217
spriteid_baby_walk                    = 219
spriteid_ball                         = 59
spriteid_brazier                      = 58
spriteid_broken_partition_base        = 212
spriteid_cache1                       = 208
spriteid_cache2                       = 209
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
spriteid_fallen_partition             = 215
spriteid_falling_partition            = 214
spriteid_fingertip_tile_restoration   = 30
spriteid_fire1                        = 60
spriteid_fire2                        = 61
spriteid_fire3                        = 62
spriteid_fire4                        = 63
spriteid_fire5                        = 64
spriteid_fire6                        = 65
spriteid_fire7                        = 66
spriteid_fire8                        = 67
spriteid_gnu_head                     = 203
spriteid_gun                          = 205
spriteid_gun_held                     = 206
spriteid_gun_menu_item                = 207
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
spriteid_partition                    = 213
spriteid_pointer_hand                 = 29
spriteid_rock                         = 204
spriteid_rope1                        = 85
spriteid_rope2                        = 86
spriteid_rope3                        = 87
spriteid_rope4                        = 88
spriteid_rope_end                     = 10
spriteid_rope_hook                    = 11
spriteid_sign                         = 211
spriteid_sign_stand                   = 210
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
spriteid_wood_block                   = 200

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
save_game_level_d_got_axe                           = $0a0e
save_game_level_d_got_gun                           = $0a0f
save_game_level_d_gnu_sign_position                 = $0a10
save_game_level_d_partition_progress                = $0a11
save_game_level_d_baby_progress                     = $0a12
baby_animation_step_index                           = $0a6f
baby_x_position                                     = $0a70
baby_y_position                                     = $0a71
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
    !word sprite_data - level_data                                    ; 3ad5: ef 08                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f3 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 1d 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
room_index_cheat1
    !byte 1                                                           ; 3add: 01
room_index_cheat2
    !byte 1                                                           ; 3ade: 01
level_room_data_table
    !word room_0_data                                                 ; 3adf: 2d 3b                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: 7e 3d
    !word room_2_data                                                 ; 3ae3: 39 3e
    !word room_3_data                                                 ; 3ae5: fb 3f

; *************************************************************************************
; 'GNU-PROBLEM[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $8c, $85, $9e, $e6, $9b, $99, $84, $89, $87, $8e, $86, $c6  ; 3ae7: 8c 85 9e...

; *************************************************************************************
; 
; Level initialisation
; 
; This is called whenever a new room is entered.
; 
; *************************************************************************************
; check for level change (branch if not)
level_specific_initialisation
    lda current_level                                                 ; 3af3: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3af5: c5 51
    beq return1                                                       ; 3af7: f0 23
    lda developer_flags                                               ; 3af9: ad 03 11
    bpl developer_mode_inactive                                       ; 3afc: 10 0a
    lda #$ff                                                          ; 3afe: a9 ff
    sta save_game_level_d_got_gun                                     ; 3b00: 8d 0f 0a
    lda #$ff                                                          ; 3b03: a9 ff
    sta save_game_level_d_got_axe                                     ; 3b05: 8d 0e 0a
developer_mode_inactive
    lda save_game_level_d_got_gun                                     ; 3b08: ad 0f 0a
    beq no_gun                                                        ; 3b0b: f0 05
    lda #spriteid_gun_menu_item                                       ; 3b0d: a9 cf
    jsr find_or_create_menu_slot_for_A                                ; 3b0f: 20 bd 2b
no_gun
    lda save_game_level_d_got_axe                                     ; 3b12: ad 0e 0a
    beq return1                                                       ; 3b15: f0 05
    lda #spriteid_axe_menu_item                                       ; 3b17: a9 ca
    jsr find_or_create_menu_slot_for_A                                ; 3b19: 20 bd 2b
return1
    rts                                                               ; 3b1c: 60

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
    jsr room_0_update_handler                                         ; 3b1d: 20 fc 3b
    jsr room_2_update_handler                                         ; 3b20: 20 e9 3e
    jsr room_3_update_handler                                         ; 3b23: 20 c2 40
    jsr update_gnu_sign_puzzle                                        ; 3b26: 20 73 3c
    jsr update_baby_puzzle                                            ; 3b29: 20 ac 41
    rts                                                               ; 3b2c: 60

; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 20                                                          ; 3b2d: 14                      ; initial player X cell
    !byte 22                                                          ; 3b2e: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####                |    |          ####
; ###                 |    |           ###
; ###                 |    |           ###
; ###                 |    |           ###
; ###                 |    |           ###
; ###                 |    |   ###########
; ###                 |    |   ###########
; ###                 |
; ###                 |
; ###                 |
; ###                 |
; ###                 |
; #######             |        ###########
; #######             |        ###########
; #######OOO          |
; #######OOO          |
; #######OOOOOO       |
; #######OOOOOO       |
; #######OOOOOOOOO
; #######OOOOOOOOO    P        ###########
; ########################################
; ########################################
; set ground fill tile to use
room_0_code
    lda #<ground_fill_2x2_top_left                                    ; 3b2f: a9 a4
    sta source_sprite_memory_low                                      ; 3b31: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3b33: a9 43
    sta source_sprite_memory_high                                     ; 3b35: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3b37: a2 00
    ldy #0                                                            ; 3b39: a0 00
    lda #$ff                                                          ; 3b3b: a9 ff
    sta width_in_cells                                                ; 3b3d: 85 3c
    lda #2                                                            ; 3b3f: a9 02
    sta height_in_cells                                               ; 3b41: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b43: 20 bb 1a
; draw 4x1 rectangle at (0,2)
    iny                                                               ; 3b46: c8
    iny                                                               ; 3b47: c8
    lda #4                                                            ; 3b48: a9 04
    sta width_in_cells                                                ; 3b4a: 85 3c
    dec height_in_cells                                               ; 3b4c: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b4e: 20 bb 1a
; draw 4x1 rectangle at (36,2)
    ldx #$24 ; '$'                                                    ; 3b51: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 3b53: 20 bb 1a
; draw 3x11 rectangle at (0,3)
    ldx #0                                                            ; 3b56: a2 00
    iny                                                               ; 3b58: c8
    dec width_in_cells                                                ; 3b59: c6 3c
    lda #$0b                                                          ; 3b5b: a9 0b
    sta height_in_cells                                               ; 3b5d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b5f: 20 bb 1a
; draw 3x4 rectangle at (37,3)
    ldx #$25 ; '%'                                                    ; 3b62: a2 25
    lda #4                                                            ; 3b64: a9 04
    sta height_in_cells                                               ; 3b66: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b68: 20 bb 1a
; draw 255x2 rectangle at (29,7)
    ldx #$1d                                                          ; 3b6b: a2 1d
    ldy #7                                                            ; 3b6d: a0 07
    lda #$ff                                                          ; 3b6f: a9 ff
    sta width_in_cells                                                ; 3b71: 85 3c
    lda #2                                                            ; 3b73: a9 02
    sta height_in_cells                                               ; 3b75: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b77: 20 bb 1a
; draw 7x8 rectangle at (0,14)
    ldx #0                                                            ; 3b7a: a2 00
    ldy #$0e                                                          ; 3b7c: a0 0e
    lda #7                                                            ; 3b7e: a9 07
    sta width_in_cells                                                ; 3b80: 85 3c
    lda #8                                                            ; 3b82: a9 08
    sta height_in_cells                                               ; 3b84: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b86: 20 bb 1a
; draw 255x8 rectangle at (0,22)
    ldy #$16                                                          ; 3b89: a0 16
    lda #$ff                                                          ; 3b8b: a9 ff
    sta width_in_cells                                                ; 3b8d: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b8f: 20 bb 1a
; draw 255x1 rectangle at (29,21)
    ldx #$1d                                                          ; 3b92: a2 1d
    ldy #$15                                                          ; 3b94: a0 15
    lda #1                                                            ; 3b96: a9 01
    sta height_in_cells                                               ; 3b98: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b9a: 20 bb 1a
; draw 255x2 rectangle at (29,14)
    ldx #$1d                                                          ; 3b9d: a2 1d
    ldy #$0e                                                          ; 3b9f: a0 0e
    lda #$ff                                                          ; 3ba1: a9 ff
    sta width_in_cells                                                ; 3ba3: 85 3c
    lda #2                                                            ; 3ba5: a9 02
    sta height_in_cells                                               ; 3ba7: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ba9: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3bac: 20 90 1b
; draw wood block at (13,20) of size (3x2)
    lda #3                                                            ; 3baf: a9 03
    sta width_in_cells                                                ; 3bb1: 85 3c
    lda #2                                                            ; 3bb3: a9 02
    sta height_in_cells                                               ; 3bb5: 85 3d
    lda #spriteid_wood_block                                          ; 3bb7: a9 c8
    ldx #$0d                                                          ; 3bb9: a2 0d
    ldy #$14                                                          ; 3bbb: a0 14
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bbd: 20 57 1f
; draw wood block at (10,20) of size (3x2)
    ldx #$0a                                                          ; 3bc0: a2 0a
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bc2: 20 57 1f
; draw wood block at (7,20) of size (3x2)
    ldx #7                                                            ; 3bc5: a2 07
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bc7: 20 57 1f
; draw wood block at (7,18) of size (3x2)
    ldy #$12                                                          ; 3bca: a0 12
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bcc: 20 57 1f
; draw wood block at (10,18) of size (3x2)
    ldx #$0a                                                          ; 3bcf: a2 0a
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bd1: 20 57 1f
; draw wood block at (7,16) of size (3x2)
    ldx #7                                                            ; 3bd4: a2 07
    ldy #$10                                                          ; 3bd6: a0 10
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bd8: 20 57 1f
; draw rope at (20,2) length 18
    ldx #$14                                                          ; 3bdb: a2 14
    ldy #2                                                            ; 3bdd: a0 02
    lda #$12                                                          ; 3bdf: a9 12
    jsr draw_rope                                                     ; 3be1: 20 b9 1d
; draw rope at (25,2) length 7
    ldx #$19                                                          ; 3be4: a2 19
    lda #7                                                            ; 3be6: a9 07
    jsr draw_rope                                                     ; 3be8: 20 b9 1d
    jsr start_room                                                    ; 3beb: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 3bee: 20 da 12
    and #exit_room_right                                              ; 3bf1: 29 04
    beq room_0_game_update_loop                                       ; 3bf3: f0 f9
    ldx #1                                                            ; 3bf5: a2 01
    ldy current_level                                                 ; 3bf7: a4 31
    jmp initialise_level_and_room                                     ; 3bf9: 4c 40 11

room_0_update_handler
    lda #0                                                            ; 3bfc: a9 00
    sta currently_updating_logic_for_room_index                       ; 3bfe: 8d ba 1a
    lda #2                                                            ; 3c01: a9 02
    ldx #3                                                            ; 3c03: a2 03
    ldy #8                                                            ; 3c05: a0 08
    jsr update_brazier_and_fire                                       ; 3c07: 20 88 19
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 3c0a: ad 2b 13
    beq room_0_not_first_update                                       ; 3c0d: f0 40
; check for level change (branch if not)
    lda current_level                                                 ; 3c0f: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3c11: c5 51
    beq room_change_only                                              ; 3c13: f0 0d
; new level
    lda #spriteid_axe_menu_item                                       ; 3c15: a9 ca
    sta toolbar_collectable_spriteids+2                               ; 3c17: 8d ea 2e
    lda #spriteid_axe                                                 ; 3c1a: a9 c9
    sta collectable_spriteids+2                                       ; 3c1c: 8d ef 2e
    sta collectable_being_used_spriteids+2                            ; 3c1f: 8d f4 2e
; no_level_change, just a room change only
room_change_only
    lda desired_room_index                                            ; 3c22: a5 30
    cmp #0                                                            ; 3c24: c9 00
    bne return2                                                       ; 3c26: d0 26
; in room 0
    lda save_game_level_d_got_axe                                     ; 3c28: ad 0e 0a
    bne return2                                                       ; 3c2b: d0 21
; not got axe yet, position the axe
    ldx #$23 ; '#'                                                    ; 3c2d: a2 23
    lda #5                                                            ; 3c2f: a9 05
    sta temp_sprite_x_offset                                          ; 3c31: 85 3a
    ldy #5                                                            ; 3c33: a0 05
    lda #1                                                            ; 3c35: a9 01
    sta temp_sprite_y_offset                                          ; 3c37: 85 3b
    lda #objectid_axe                                                 ; 3c39: a9 03
    jsr set_object_position_from_cell_xy                              ; 3c3b: 20 5d 1f
    tax                                                               ; 3c3e: aa
    lda #spriteid_axe                                                 ; 3c3f: a9 c9
    sta object_spriteid,x                                             ; 3c41: 9d a8 09
    lda #spriteid_cache1                                              ; 3c44: a9 d0
    sta object_erase_type,x                                           ; 3c46: 9d ac 38
    lda #$c0                                                          ; 3c49: a9 c0
    sta object_z_order,x                                              ; 3c4b: 9d c2 38
return2
    rts                                                               ; 3c4e: 60

room_0_not_first_update
    lda desired_room_index                                            ; 3c4f: a5 30
    cmp #0                                                            ; 3c51: c9 00
    bne return3                                                       ; 3c53: d0 1d
    lda save_game_level_d_got_axe                                     ; 3c55: ad 0e 0a
    bne return3                                                       ; 3c58: d0 18
; not got axe. check for collision with axe
    ldx #objectid_old_player                                          ; 3c5a: a2 0b
    ldy #objectid_axe                                                 ; 3c5c: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 3c5e: 20 e2 28
    beq return3                                                       ; 3c61: f0 0f
; player has collided with axe. mark axe as collected.
    lda #$ff                                                          ; 3c63: a9 ff
    sta save_game_level_d_got_axe                                     ; 3c65: 8d 0e 0a
; add axe to toolbar
    lda #spriteid_axe_menu_item                                       ; 3c68: a9 ca
    jsr find_or_create_menu_slot_for_A                                ; 3c6a: 20 bd 2b
; mark axe object as invisible
    lda #spriteid_one_pixel_masked_out                                ; 3c6d: a9 00
    sta object_spriteid + objectid_axe                                ; 3c6f: 8d ab 09
return3
    rts                                                               ; 3c72: 60

; check for first update in room (branch if not)
update_gnu_sign_puzzle
    lda update_room_first_update_flag                                 ; 3c73: ad 2b 13
    beq update_gnu_sign_puzzle_not_first_update                       ; 3c76: f0 55
; initialise sign position
    lda save_game_level_d_gnu_sign_position                           ; 3c78: ad 10 0a
    bne draw_rock_and_block_passage                                   ; 3c7b: d0 05
; initial position of the sign
    lda #$21 ; '!'                                                    ; 3c7d: a9 21
    sta save_game_level_d_gnu_sign_position                           ; 3c7f: 8d 10 0a
draw_rock_and_block_passage
    ldy #$0e                                                          ; 3c82: a0 0e
    lda #1                                                            ; 3c84: a9 01
    sta width_in_cells                                                ; 3c86: 85 3c
    lda #5                                                            ; 3c88: a9 05
    sta height_in_cells                                               ; 3c8a: 85 3d
    lda #collision_map_solid_rock                                     ; 3c8c: a9 03
    sta value_to_write_to_collision_map                               ; 3c8e: 85 3e
    lda desired_room_index                                            ; 3c90: a5 30
    cmp #1                                                            ; 3c92: c9 01
    beq draw_rock_in_room_1                                           ; 3c94: f0 0d
    bcs deal_with_sign_position_consequences_local                    ; 3c96: b0 32
; draw rock in room 0
    ldx #$1e                                                          ; 3c98: a2 1e
    lda #spriteid_rock                                                ; 3c9a: a9 cc
    jsr draw_sprite_a_at_cell_xy                                      ; 3c9c: 20 4c 1f
    dex                                                               ; 3c9f: ca
    jmp set_up_sign_object                                            ; 3ca0: 4c af 3c

draw_rock_in_room_1
    ldx #9                                                            ; 3ca3: a2 09
    lda #4                                                            ; 3ca5: a9 04
    sta temp_sprite_x_offset                                          ; 3ca7: 85 3a
    lda #spriteid_rock                                                ; 3ca9: a9 cc
    jsr draw_sprite_a_at_cell_xy                                      ; 3cab: 20 4c 1f
    inx                                                               ; 3cae: e8
set_up_sign_object
    ldy #9                                                            ; 3caf: a0 09
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3cb1: 20 bb 1e
    ldx #4                                                            ; 3cb4: a2 04
    lda #spriteid_sign_stand                                          ; 3cb6: a9 d2
    sta object_spriteid,x                                             ; 3cb8: 9d a8 09
    lda #spriteid_cache2                                              ; 3cbb: a9 d1
    sta object_erase_type,x                                           ; 3cbd: 9d ac 38
    lda #$c0                                                          ; 3cc0: a9 c0
    sta object_z_order,x                                              ; 3cc2: 9d c2 38
    lda #spriteid_sign                                                ; 3cc5: a9 d3
    sta object_spriteid + objectid_sign                               ; 3cc7: 8d ad 09
deal_with_sign_position_consequences_local
    jmp deal_with_sign_position_consequences                          ; 3cca: 4c 0b 3d

update_gnu_sign_puzzle_not_first_update
    lda desired_room_index                                            ; 3ccd: a5 30
    cmp #3                                                            ; 3ccf: c9 03
    beq deal_with_sign_position_consequences                          ; 3cd1: f0 38
; check if player is currently using the gun, and branch if not
    lda #spriteid_gun_menu_item                                       ; 3cd3: a9 cf
    cmp player_using_object_spriteid                                  ; 3cd5: cd b6 2e
    bne deal_with_sign_position_consequences                          ; 3cd8: d0 31
; check if player just used the gun this game tick
    cmp previous_player_using_object_spriteid                         ; 3cda: cd b7 2e
    beq deal_with_sign_position_consequences                          ; 3cdd: f0 2c
; check the Y coordinate of theplayer to see if it at the same height as the sign
    lda object_y_low                                                  ; 3cdf: ad 7c 09
    cmp #$6e ; 'n'                                                    ; 3ce2: c9 6e
    bne deal_with_sign_position_consequences                          ; 3ce4: d0 25
; if not in room 0 then branch
    lda desired_room_index                                            ; 3ce6: a5 30
    bne check_for_gun_in_rooms_other_than_0                           ; 3ce8: d0 12
; in room 0, make sure we are pointing right (branch if not)
    lda object_direction                                              ; 3cea: ad be 09
    bmi deal_with_sign_position_consequences                          ; 3ced: 30 1c
; move the sign to the right if not already fully to the right (position $30 is fully
; right)
    lda save_game_level_d_gnu_sign_position                           ; 3cef: ad 10 0a
    cmp #$30 ; '0'                                                    ; 3cf2: c9 30
    beq deal_with_sign_position_consequences                          ; 3cf4: f0 15
    inc save_game_level_d_gnu_sign_position                           ; 3cf6: ee 10 0a
    jmp deal_with_sign_position_consequences                          ; 3cf9: 4c 0b 3d

; rooms other than room 0 need the player to look left for the gun to work (branch
; otherwise)
check_for_gun_in_rooms_other_than_0
    lda object_direction                                              ; 3cfc: ad be 09
    bpl deal_with_sign_position_consequences                          ; 3cff: 10 0a
; move sign left not already all the way left (position $20 is fully left)
    lda save_game_level_d_gnu_sign_position                           ; 3d01: ad 10 0a
    cmp #$20 ; ' '                                                    ; 3d04: c9 20
    beq deal_with_sign_position_consequences                          ; 3d06: f0 03
    dec save_game_level_d_gnu_sign_position                           ; 3d08: ce 10 0a
deal_with_sign_position_consequences
    lda #1                                                            ; 3d0b: a9 01
    sta width_in_cells                                                ; 3d0d: 85 3c
    lda save_game_level_d_gnu_sign_position                           ; 3d0f: ad 10 0a
    ldx desired_room_index                                            ; 3d12: a6 30
    cpx #1                                                            ; 3d14: e0 01
    beq check_if_gnu_sign_is_in_room_1                                ; 3d16: f0 2d
    bcs return4                                                       ; 3d18: b0 63
; player in room 0. if (sign is in position >= $29) then add collision map for ropes
    ldx #collision_map_rope                                           ; 3d1a: a2 02
    cmp #$29 ; ')'                                                    ; 3d1c: c9 29
    bcs add_ropes_to_collision_map_room_0                             ; 3d1e: b0 02
    ldx #collision_map_none                                           ; 3d20: a2 00
add_ropes_to_collision_map_room_0
    stx value_to_write_to_collision_map                               ; 3d22: 86 3e
    ldx #$14                                                          ; 3d24: a2 14
    ldy #3                                                            ; 3d26: a0 03
    jsr read_collision_map_value_for_xy                               ; 3d28: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3d2b: c5 3e
    beq already_written_to_collision_map_room_0                       ; 3d2d: f0 10
    lda #$11                                                          ; 3d2f: a9 11
    sta height_in_cells                                               ; 3d31: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3d33: 20 44 1e
    ldx #$19                                                          ; 3d36: a2 19
    lda #6                                                            ; 3d38: a9 06
    sta height_in_cells                                               ; 3d3a: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3d3c: 20 44 1e
already_written_to_collision_map_room_0
    lda save_game_level_d_gnu_sign_position                           ; 3d3f: ad 10 0a
    jmp set_sign_object_position                                      ; 3d42: 4c 70 3d

check_if_gnu_sign_is_in_room_1
    ldx #collision_map_rope                                           ; 3d45: a2 02
    cmp #$28 ; '('                                                    ; 3d47: c9 28
    bcc add_ropes_to_collision_map_room_1                             ; 3d49: 90 02
    ldx #collision_map_none                                           ; 3d4b: a2 00
add_ropes_to_collision_map_room_1
    stx value_to_write_to_collision_map                               ; 3d4d: 86 3e
    ldx #$0e                                                          ; 3d4f: a2 0e
    ldy #3                                                            ; 3d51: a0 03
    jsr read_collision_map_value_for_xy                               ; 3d53: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3d56: c5 3e
    beq already_written_to_collision_map_room_1                       ; 3d58: f0 10
    lda #6                                                            ; 3d5a: a9 06
    sta height_in_cells                                               ; 3d5c: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3d5e: 20 44 1e
    ldx #$19                                                          ; 3d61: a2 19
    lda #$0d                                                          ; 3d63: a9 0d
    sta height_in_cells                                               ; 3d65: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3d67: 20 44 1e
already_written_to_collision_map_room_1
    lda save_game_level_d_gnu_sign_position                           ; 3d6a: ad 10 0a
    sec                                                               ; 3d6d: 38
    sbc #$28 ; '('                                                    ; 3d6e: e9 28
set_sign_object_position
    tax                                                               ; 3d70: aa
    ldy #$0e                                                          ; 3d71: a0 0e
    lda #objectid_sign_stand                                          ; 3d73: a9 04
    jsr set_object_position_from_cell_xy                              ; 3d75: 20 5d 1f
    lda #objectid_sign                                                ; 3d78: a9 05
    jsr set_object_position_from_cell_xy                              ; 3d7a: 20 5d 1f
return4
    rts                                                               ; 3d7d: 60

; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 20                                                          ; 3d7e: 14                      ; initial player X cell
    !byte 22                                                          ; 3d7f: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####          |          |
; ###           |          |
; ###           |          |
; ###           |          |
; ###           |          |
; ###########   |   OOOO   |   ###########
; ###########   |          |   ###########
;                          |
;                          |
;                          |
;                          |
;                          |
; ###########              |   ###########
; ###########              |   ###########
; 
; 
; 
; 
; 
; ###########         P        ###########
; ########################################
; ########################################
; set ground fill tile to use
room_1_code
    lda #<ground_fill_2x2_top_left                                    ; 3d80: a9 a4
    sta source_sprite_memory_low                                      ; 3d82: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3d84: a9 43
    sta source_sprite_memory_high                                     ; 3d86: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3d88: a2 00
    ldy #0                                                            ; 3d8a: a0 00
    lda #$ff                                                          ; 3d8c: a9 ff
    sta width_in_cells                                                ; 3d8e: 85 3c
    lda #2                                                            ; 3d90: a9 02
    sta height_in_cells                                               ; 3d92: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d94: 20 bb 1a
; draw 4x1 rectangle at (0,2)
    iny                                                               ; 3d97: c8
    iny                                                               ; 3d98: c8
    lda #4                                                            ; 3d99: a9 04
    sta width_in_cells                                                ; 3d9b: 85 3c
    dec height_in_cells                                               ; 3d9d: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d9f: 20 bb 1a
; draw 3x4 rectangle at (0,3)
    iny                                                               ; 3da2: c8
    dec width_in_cells                                                ; 3da3: c6 3c
    lda #4                                                            ; 3da5: a9 04
    sta height_in_cells                                               ; 3da7: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3da9: 20 bb 1a
; draw 11x2 rectangle at (0,7)
    ldy #7                                                            ; 3dac: a0 07
    lda #$0b                                                          ; 3dae: a9 0b
    sta width_in_cells                                                ; 3db0: 85 3c
    lda #2                                                            ; 3db2: a9 02
    sta height_in_cells                                               ; 3db4: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3db6: 20 bb 1a
; draw 11x2 rectangle at (29,7)
    ldx #$1d                                                          ; 3db9: a2 1d
    jsr copy_rectangle_of_memory_to_screen                            ; 3dbb: 20 bb 1a
; draw 11x2 rectangle at (0,14)
    ldx #0                                                            ; 3dbe: a2 00
    ldy #$0e                                                          ; 3dc0: a0 0e
    lda #$0b                                                          ; 3dc2: a9 0b
    sta width_in_cells                                                ; 3dc4: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3dc6: 20 bb 1a
; draw 11x2 rectangle at (29,14)
    ldx #$1d                                                          ; 3dc9: a2 1d
    jsr copy_rectangle_of_memory_to_screen                            ; 3dcb: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldx #0                                                            ; 3dce: a2 00
    ldy #$16                                                          ; 3dd0: a0 16
    lda #$ff                                                          ; 3dd2: a9 ff
    sta width_in_cells                                                ; 3dd4: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3dd6: 20 bb 1a
; draw 11x1 rectangle at (0,21)
    dey                                                               ; 3dd9: 88
    lda #$0b                                                          ; 3dda: a9 0b
    sta width_in_cells                                                ; 3ddc: 85 3c
    lda #1                                                            ; 3dde: a9 01
    sta height_in_cells                                               ; 3de0: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3de2: 20 bb 1a
; draw 11x1 rectangle at (29,21)
    ldx #$1d                                                          ; 3de5: a2 1d
    jsr copy_rectangle_of_memory_to_screen                            ; 3de7: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3dea: 20 90 1b
; draw gnu head at (18,7) of size (4x1)
    lda #4                                                            ; 3ded: a9 04
    sta width_in_cells                                                ; 3def: 85 3c
    lda #1                                                            ; 3df1: a9 01
    sta height_in_cells                                               ; 3df3: 85 3d
    ldx #$12                                                          ; 3df5: a2 12
    ldy #7                                                            ; 3df7: a0 07
    lda #spriteid_gnu_head                                            ; 3df9: a9 cb
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3dfb: 20 57 1f
    inx                                                               ; 3dfe: e8
    iny                                                               ; 3dff: c8
    lda #2                                                            ; 3e00: a9 02
    sta width_in_cells                                                ; 3e02: 85 3c
    sta height_in_cells                                               ; 3e04: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e06: 20 44 1e
; draw rope at (14,2) length 7
    ldx #$0e                                                          ; 3e09: a2 0e
    ldy #2                                                            ; 3e0b: a0 02
    lda #7                                                            ; 3e0d: a9 07
    jsr draw_rope                                                     ; 3e0f: 20 b9 1d
; draw rope at (25,2) length 14
    ldx #$19                                                          ; 3e12: a2 19
    lda #$0e                                                          ; 3e14: a9 0e
    jsr draw_rope                                                     ; 3e16: 20 b9 1d
    jsr start_room                                                    ; 3e19: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 3e1c: 20 da 12
    sta room_exit_direction                                           ; 3e1f: 85 70
    and #exit_room_left                                               ; 3e21: 29 01
    beq room_1_check_right_exit                                       ; 3e23: f0 07
    ldx #0                                                            ; 3e25: a2 00
    ldy current_level                                                 ; 3e27: a4 31
    jmp initialise_level_and_room                                     ; 3e29: 4c 40 11

room_1_check_right_exit
    lda room_exit_direction                                           ; 3e2c: a5 70
    and #exit_room_right                                              ; 3e2e: 29 04
    beq room_1_game_update_loop                                       ; 3e30: f0 ea
    ldx #2                                                            ; 3e32: a2 02
    ldy current_level                                                 ; 3e34: a4 31
    jmp initialise_level_and_room                                     ; 3e36: 4c 40 11

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 30                                                          ; 3e39: 1e                      ; initial player X cell
    !byte 22                                                          ; 3e3a: 16                      ; initial player Y cell

; ########################################
; ########################################
;                                     ####
;                                      ###
;                                      ###
;                                      ###
;                                      ###
; ########################################
; ########################################
;               |                     ####
;               |                      ###
;               |                      ###
;               |                      ###
;               |                      ###
; ###########   |                      ###
; ###########   |                      ###
;               |                      ###
;               |
;               |
;               |
;                   OOOOOO
; ###########       OOOOOO      P
; ########################################
; ########################################
; set ground fill tile to use
room_2_code
    lda #<ground_fill_2x2_top_left                                    ; 3e3b: a9 a4
    sta source_sprite_memory_low                                      ; 3e3d: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3e3f: a9 43
    sta source_sprite_memory_high                                     ; 3e41: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3e43: a2 00
    ldy #0                                                            ; 3e45: a0 00
    lda #$ff                                                          ; 3e47: a9 ff
    sta width_in_cells                                                ; 3e49: 85 3c
    lda #2                                                            ; 3e4b: a9 02
    sta height_in_cells                                               ; 3e4d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e4f: 20 bb 1a
; draw 255x1 rectangle at (36,2)
    ldx #$24 ; '$'                                                    ; 3e52: a2 24
    ldy #2                                                            ; 3e54: a0 02
    dec height_in_cells                                               ; 3e56: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e58: 20 bb 1a
; draw 255x4 rectangle at (37,3)
    inx                                                               ; 3e5b: e8
    iny                                                               ; 3e5c: c8
    lda #4                                                            ; 3e5d: a9 04
    sta height_in_cells                                               ; 3e5f: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e61: 20 bb 1a
; draw 255x2 rectangle at (0,7)
    ldx #0                                                            ; 3e64: a2 00
    ldy #7                                                            ; 3e66: a0 07
    lda #2                                                            ; 3e68: a9 02
    sta height_in_cells                                               ; 3e6a: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e6c: 20 bb 1a
; draw 255x1 rectangle at (36,9)
    ldx #$24 ; '$'                                                    ; 3e6f: a2 24
    ldy #9                                                            ; 3e71: a0 09
    dec height_in_cells                                               ; 3e73: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e75: 20 bb 1a
; draw 255x7 rectangle at (37,10)
    inx                                                               ; 3e78: e8
    iny                                                               ; 3e79: c8
    lda #7                                                            ; 3e7a: a9 07
    sta height_in_cells                                               ; 3e7c: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e7e: 20 bb 1a
; draw 11x2 rectangle at (0,14)
    ldx #0                                                            ; 3e81: a2 00
    ldy #$0e                                                          ; 3e83: a0 0e
    lda #$0b                                                          ; 3e85: a9 0b
    sta width_in_cells                                                ; 3e87: 85 3c
    lda #2                                                            ; 3e89: a9 02
    sta height_in_cells                                               ; 3e8b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e8d: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldx #0                                                            ; 3e90: a2 00
    ldy #$16                                                          ; 3e92: a0 16
    lda #$ff                                                          ; 3e94: a9 ff
    sta width_in_cells                                                ; 3e96: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3e98: 20 bb 1a
; draw 11x1 rectangle at (0,21)
    dey                                                               ; 3e9b: 88
    lda #$0b                                                          ; 3e9c: a9 0b
    sta width_in_cells                                                ; 3e9e: 85 3c
    lda #1                                                            ; 3ea0: a9 01
    sta height_in_cells                                               ; 3ea2: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ea4: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3ea7: 20 90 1b
; draw wood block at (21,20) of size (3x2)
    lda #3                                                            ; 3eaa: a9 03
    sta width_in_cells                                                ; 3eac: 85 3c
    lda #2                                                            ; 3eae: a9 02
    sta height_in_cells                                               ; 3eb0: 85 3d
    ldx #$15                                                          ; 3eb2: a2 15
    ldy #$14                                                          ; 3eb4: a0 14
    lda #spriteid_wood_block                                          ; 3eb6: a9 c8
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3eb8: 20 57 1f
; draw wood block at (18,20) of size (3x2)
    ldx #$12                                                          ; 3ebb: a2 12
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3ebd: 20 57 1f
; draw rope at (14,9) length 11
    ldx #$0e                                                          ; 3ec0: a2 0e
    ldy #9                                                            ; 3ec2: a0 09
    lda #$0b                                                          ; 3ec4: a9 0b
    jsr draw_rope                                                     ; 3ec6: 20 b9 1d
    jsr start_room                                                    ; 3ec9: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 3ecc: 20 da 12
    sta room_exit_direction                                           ; 3ecf: 85 70
    and #exit_room_left                                               ; 3ed1: 29 01
    beq room_2_check_right_exit                                       ; 3ed3: f0 07
    ldx #1                                                            ; 3ed5: a2 01
    ldy current_level                                                 ; 3ed7: a4 31
    jmp initialise_level_and_room                                     ; 3ed9: 4c 40 11

room_2_check_right_exit
    lda room_exit_direction                                           ; 3edc: a5 70
    and #exit_room_right                                              ; 3ede: 29 04
    beq room_2_game_update_loop                                       ; 3ee0: f0 ea
    ldx #3                                                            ; 3ee2: a2 03
    ldy current_level                                                 ; 3ee4: a4 31
    jmp initialise_level_and_room                                     ; 3ee6: 4c 40 11

room_2_update_handler
    lda #2                                                            ; 3ee9: a9 02
    sta currently_updating_logic_for_room_index                       ; 3eeb: 8d ba 1a
    ldx #$25 ; '%'                                                    ; 3eee: a2 25
    ldy #$0d                                                          ; 3ef0: a0 0d
    lda #2                                                            ; 3ef2: a9 02
    jsr update_brazier_and_fire                                       ; 3ef4: 20 88 19
    ldx #$1f                                                          ; 3ef7: a2 1f
    ldy #7                                                            ; 3ef9: a0 07
    lda #3                                                            ; 3efb: a9 03
    jsr update_level_completion                                       ; 3efd: 20 10 1a
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 3f00: ad 2b 13
    beq update_partition_puzzle                                       ; 3f03: f0 61
    ldx #<envelope1                                                   ; 3f05: a2 86
    ldy #>envelope1                                                   ; 3f07: a0 43
    jsr define_envelope                                               ; 3f09: 20 5e 39
; check for level change (branch if not)
    lda current_level                                                 ; 3f0c: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3f0e: c5 51
    beq level_changed                                                 ; 3f10: f0 0a
; if partition is partly fallen over, make it fully fallen
    lda save_game_level_d_partition_progress                          ; 3f12: ad 11 0a
    beq level_changed                                                 ; 3f15: f0 05
    lda #$ff                                                          ; 3f17: a9 ff
    sta save_game_level_d_partition_progress                          ; 3f19: 8d 11 0a
level_changed
    lda desired_room_index                                            ; 3f1c: a5 30
    cmp #2                                                            ; 3f1e: c9 02
    bne update_partition_sprite_local                                 ; 3f20: d0 41
    ldx #$14                                                          ; 3f22: a2 14
    ldy #7                                                            ; 3f24: a0 07
    lda #spriteid_broken_partition_base                               ; 3f26: a9 d4
    jsr draw_sprite_a_at_cell_xy                                      ; 3f28: 20 4c 1f
    lda #objectid_partition                                           ; 3f2b: a9 04
    jsr set_object_position_from_cell_xy                              ; 3f2d: 20 5d 1f
    tax                                                               ; 3f30: aa
    lda #spriteid_cache1                                              ; 3f31: a9 d0
    sta object_erase_type,x                                           ; 3f33: 9d ac 38
    lda #$c0                                                          ; 3f36: a9 c0
    sta object_z_order,x                                              ; 3f38: 9d c2 38
    ldx #$14                                                          ; 3f3b: a2 14
    lda #collision_map_solid_rock                                     ; 3f3d: a9 03
    sta value_to_write_to_collision_map                               ; 3f3f: 85 3e
    lda save_game_level_d_partition_progress                          ; 3f41: ad 11 0a
    bne set_partition_to_solid_collision_map                          ; 3f44: d0 10
    ldy #2                                                            ; 3f46: a0 02
    lda #1                                                            ; 3f48: a9 01
    sta width_in_cells                                                ; 3f4a: 85 3c
    lda #5                                                            ; 3f4c: a9 05
    sta height_in_cells                                               ; 3f4e: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3f50: 20 44 1e
    jmp update_partition_sprite_local                                 ; 3f53: 4c 63 3f

set_partition_to_solid_collision_map
    ldy #6                                                            ; 3f56: a0 06
    lda #6                                                            ; 3f58: a9 06
    sta width_in_cells                                                ; 3f5a: 85 3c
    lda #1                                                            ; 3f5c: a9 01
    sta height_in_cells                                               ; 3f5e: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3f60: 20 44 1e
update_partition_sprite_local
    jmp update_partition_sprite                                       ; 3f63: 4c c2 3f

update_partition_puzzle
    lda save_game_level_d_partition_progress                          ; 3f66: ad 11 0a
    bmi update_partition_sprite                                       ; 3f69: 30 57
    bne update_partition_progress                                     ; 3f6b: d0 42
    lda desired_room_index                                            ; 3f6d: a5 30
    cmp #2                                                            ; 3f6f: c9 02
    bne update_partition_sprite                                       ; 3f71: d0 4f
    lda player_using_object_spriteid                                  ; 3f73: ad b6 2e
    cmp #spriteid_axe_menu_item                                       ; 3f76: c9 ca
    bne update_partition_sprite                                       ; 3f78: d0 48
    lda #1                                                            ; 3f7a: a9 01
    sta temp_right_offset                                             ; 3f7c: 8d d1 24
    ldx #objectid_player_accessory                                    ; 3f7f: a2 01
    ldy #4                                                            ; 3f81: a0 04
    jsr test_for_collision_between_objects_x_and_y                    ; 3f83: 20 e2 28
    beq update_partition_sprite                                       ; 3f86: f0 3a
    ldx #$14                                                          ; 3f88: a2 14
    ldy #2                                                            ; 3f8a: a0 02
    lda #1                                                            ; 3f8c: a9 01
    sta width_in_cells                                                ; 3f8e: 85 3c
    lda #5                                                            ; 3f90: a9 05
    sta height_in_cells                                               ; 3f92: 85 3d
    lda #collision_map_none                                           ; 3f94: a9 00
    sta value_to_write_to_collision_map                               ; 3f96: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3f98: 20 44 1e
    ldy #6                                                            ; 3f9b: a0 06
    lda #6                                                            ; 3f9d: a9 06
    sta width_in_cells                                                ; 3f9f: 85 3c
    lda #1                                                            ; 3fa1: a9 01
    sta height_in_cells                                               ; 3fa3: 85 3d
    lda #collision_map_solid_rock                                     ; 3fa5: a9 03
    sta value_to_write_to_collision_map                               ; 3fa7: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3fa9: 20 44 1e
    jsr play_baby_dying_or_partition_landing_sounds                   ; 3fac: 20 d9 3f
update_partition_progress
    ldy save_game_level_d_partition_progress                          ; 3faf: ac 11 0a
    iny                                                               ; 3fb2: c8
    cpy #2                                                            ; 3fb3: c0 02
    bcc partition_is_falling                                          ; 3fb5: 90 08
    lda desired_room_index                                            ; 3fb7: a5 30
    cmp #2                                                            ; 3fb9: c9 02
    bne redundant_branch                                              ; 3fbb: d0 00
redundant_branch
    ldy #$ff                                                          ; 3fbd: a0 ff
partition_is_falling
    sty save_game_level_d_partition_progress                          ; 3fbf: 8c 11 0a
update_partition_sprite
    lda desired_room_index                                            ; 3fc2: a5 30
    cmp #2                                                            ; 3fc4: c9 02
    bne return5                                                       ; 3fc6: d0 0d
    ldy save_game_level_d_partition_progress                          ; 3fc8: ac 11 0a
    bpl set_partition_sprite                                          ; 3fcb: 10 02
    ldy #2                                                            ; 3fcd: a0 02
set_partition_sprite
    lda partition_spriteid_table,y                                    ; 3fcf: b9 d6 3f
    sta object_spriteid + objectid_partition                          ; 3fd2: 8d ac 09
return5
    rts                                                               ; 3fd5: 60

partition_spriteid_table
    !byte spriteid_partition                                          ; 3fd6: d5
    !byte spriteid_falling_partition                                  ; 3fd7: d6
    !byte spriteid_fallen_partition                                   ; 3fd8: d7

play_baby_dying_or_partition_landing_sounds
    lda #0                                                            ; 3fd9: a9 00
    ldx #<sound1                                                      ; 3fdb: a2 9c
    ldy #>sound1                                                      ; 3fdd: a0 43
    jsr play_sound_yx                                                 ; 3fdf: 20 f6 38
    ldx #<sound2                                                      ; 3fe2: a2 94
    ldy #>sound2                                                      ; 3fe4: a0 43
    jsr play_sound_yx                                                 ; 3fe6: 20 f6 38
    rts                                                               ; 3fe9: 60

play_gunshot_sound
    lda #0                                                            ; 3fea: a9 00
    ldx #<sound3                                                      ; 3fec: a2 7e
    ldy #>sound3                                                      ; 3fee: a0 43
    jsr play_sound_yx                                                 ; 3ff0: 20 f6 38
    ldx #<sound4                                                      ; 3ff3: a2 76
    ldy #>sound4                                                      ; 3ff5: a0 43
    jsr play_sound_yx                                                 ; 3ff7: 20 f6 38
    rts                                                               ; 3ffa: 60

; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 14                                                          ; 3ffb: 0e                      ; initial player X cell
    !byte 22                                                          ; 3ffc: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####               |             |  ####
; ###                |             |   ###
; ###                |             |   ###
; ###                |             |   ###
; ###                |             |   ###
; ################   |   #######   |   ###
; ################   |   #######   |   ###
; ####               |     ###     |   ###
; ###                |     ###     |   ###
; ###                |     ###     |   ###
; ###                |     ###     |   ###
; ###                |     ###     |   ###
; ###                |     ###     |   ###
; ######             |     ###     |   ###
; ######             |     ###     |   ###
;                    |     ###     |   ###
;                    |     ###     |   ###
;                    |     ###     |   ###
;                          ###OOO      ###
;               P          ###OOO      ###
; ########################################
; ########################################
; set ground fill tile to use
room_3_code
    lda #<ground_fill_2x2_top_left                                    ; 3ffd: a9 a4
    sta source_sprite_memory_low                                      ; 3fff: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 4001: a9 43
    sta source_sprite_memory_high                                     ; 4003: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 4005: a2 00
    ldy #0                                                            ; 4007: a0 00
    lda #$ff                                                          ; 4009: a9 ff
    sta width_in_cells                                                ; 400b: 85 3c
    lda #2                                                            ; 400d: a9 02
    sta height_in_cells                                               ; 400f: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4011: 20 bb 1a
; draw 4x1 rectangle at (0,2)
    ldy #2                                                            ; 4014: a0 02
    lda #4                                                            ; 4016: a9 04
    sta width_in_cells                                                ; 4018: 85 3c
    dec height_in_cells                                               ; 401a: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 401c: 20 bb 1a
; draw 4x1 rectangle at (36,2)
    ldx #$24 ; '$'                                                    ; 401f: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 4021: 20 bb 1a
; draw 3x4 rectangle at (0,3)
    ldx #0                                                            ; 4024: a2 00
    iny                                                               ; 4026: c8
    dec width_in_cells                                                ; 4027: c6 3c
    lda #4                                                            ; 4029: a9 04
    sta height_in_cells                                               ; 402b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 402d: 20 bb 1a
; draw 3x19 rectangle at (37,3)
    ldx #$25 ; '%'                                                    ; 4030: a2 25
    lda #$13                                                          ; 4032: a9 13
    sta height_in_cells                                               ; 4034: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4036: 20 bb 1a
; draw 16x2 rectangle at (0,7)
    ldx #0                                                            ; 4039: a2 00
    ldy #7                                                            ; 403b: a0 07
    lda #$10                                                          ; 403d: a9 10
    sta width_in_cells                                                ; 403f: 85 3c
    lda #2                                                            ; 4041: a9 02
    sta height_in_cells                                               ; 4043: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4045: 20 bb 1a
; draw 7x2 rectangle at (23,7)
    ldx #$17                                                          ; 4048: a2 17
    lda #7                                                            ; 404a: a9 07
    sta width_in_cells                                                ; 404c: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 404e: 20 bb 1a
; draw 4x1 rectangle at (0,9)
    ldx #0                                                            ; 4051: a2 00
    ldy #9                                                            ; 4053: a0 09
    lda #4                                                            ; 4055: a9 04
    sta width_in_cells                                                ; 4057: 85 3c
    dec height_in_cells                                               ; 4059: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 405b: 20 bb 1a
; draw 3x13 rectangle at (25,9)
    ldx #$19                                                          ; 405e: a2 19
    lda #3                                                            ; 4060: a9 03
    sta width_in_cells                                                ; 4062: 85 3c
    lda #$0d                                                          ; 4064: a9 0d
    sta height_in_cells                                               ; 4066: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4068: 20 bb 1a
; draw 3x5 rectangle at (0,10)
    ldx #0                                                            ; 406b: a2 00
    iny                                                               ; 406d: c8
    lda #3                                                            ; 406e: a9 03
    sta width_in_cells                                                ; 4070: 85 3c
    lda #5                                                            ; 4072: a9 05
    sta height_in_cells                                               ; 4074: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4076: 20 bb 1a
; draw 6x2 rectangle at (0,15)
    ldy #$0f                                                          ; 4079: a0 0f
    lda #6                                                            ; 407b: a9 06
    sta width_in_cells                                                ; 407d: 85 3c
    lda #2                                                            ; 407f: a9 02
    sta height_in_cells                                               ; 4081: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4083: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 4086: a0 16
    lda #$ff                                                          ; 4088: a9 ff
    sta width_in_cells                                                ; 408a: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 408c: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 408f: 20 90 1b
; draw wood block at (28,20) of size (3x2)
    lda #3                                                            ; 4092: a9 03
    sta width_in_cells                                                ; 4094: 85 3c
    lda #2                                                            ; 4096: a9 02
    sta height_in_cells                                               ; 4098: 85 3d
    ldx #$1c                                                          ; 409a: a2 1c
    ldy #$14                                                          ; 409c: a0 14
    lda #spriteid_wood_block                                          ; 409e: a9 c8
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 40a0: 20 57 1f
; draw rope at (19,2) length 18
    ldx #$13                                                          ; 40a3: a2 13
    ldy #2                                                            ; 40a5: a0 02
    lda #$12                                                          ; 40a7: a9 12
    jsr draw_rope                                                     ; 40a9: 20 b9 1d
; draw rope at (33,2) length 18
    ldx #$21 ; '!'                                                    ; 40ac: a2 21
    jsr draw_rope                                                     ; 40ae: 20 b9 1d
    jsr start_room                                                    ; 40b1: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 40b4: 20 da 12
    and #exit_room_left                                               ; 40b7: 29 01
    beq room_3_game_update_loop                                       ; 40b9: f0 f9
    ldx #2                                                            ; 40bb: a2 02
    ldy current_level                                                 ; 40bd: a4 31
    jmp initialise_level_and_room                                     ; 40bf: 4c 40 11

room_3_update_handler
    lda #3                                                            ; 40c2: a9 03
    sta currently_updating_logic_for_room_index                       ; 40c4: 8d ba 1a
    ldx #$19                                                          ; 40c7: a2 19
    ldy #$0d                                                          ; 40c9: a0 0d
    lda #2                                                            ; 40cb: a9 02
    jsr update_brazier_and_fire                                       ; 40cd: 20 88 19
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 40d0: ad 2b 13
    beq update_gun                                                    ; 40d3: f0 51
    lda #spriteid_gun_menu_item                                       ; 40d5: a9 cf
    sta toolbar_collectable_spriteids+1                               ; 40d7: 8d e9 2e
    lda #spriteid_gun_held                                            ; 40da: a9 ce
    sta collectable_spriteids+1                                       ; 40dc: 8d ee 2e
    sta collectable_being_used_spriteids + 1                          ; 40df: 8d f3 2e
    ldx #<envelope2                                                   ; 40e2: a2 68
    ldy #>envelope2                                                   ; 40e4: a0 43
    jsr define_envelope                                               ; 40e6: 20 5e 39
; check for level change (branch if not)
    lda current_level                                                 ; 40e9: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 40eb: c5 51
    beq initialise_gun_in_room_3                                      ; 40ed: f0 0a
    lda save_game_level_d_got_gun                                     ; 40ef: ad 0f 0a
    beq initialise_gun_in_room_3                                      ; 40f2: f0 05
    lda #$ff                                                          ; 40f4: a9 ff
    sta save_game_level_d_got_gun                                     ; 40f6: 8d 0f 0a
initialise_gun_in_room_3
    lda save_game_level_d_got_gun                                     ; 40f9: ad 0f 0a
    bne return6                                                       ; 40fc: d0 27
    lda desired_room_index                                            ; 40fe: a5 30
    cmp #3                                                            ; 4100: c9 03
    bne return6                                                       ; 4102: d0 21
    ldx #$1d                                                          ; 4104: a2 1d
    lda #4                                                            ; 4106: a9 04
    sta temp_sprite_x_offset                                          ; 4108: 85 3a
    ldy #$14                                                          ; 410a: a0 14
    lda #$fd                                                          ; 410c: a9 fd
    sta temp_sprite_y_offset                                          ; 410e: 85 3b
    lda #objectid_gun                                                 ; 4110: a9 03
    jsr set_object_position_from_cell_xy                              ; 4112: 20 5d 1f
    tax                                                               ; 4115: aa
    lda #spriteid_gun                                                 ; 4116: a9 cd
    sta object_spriteid,x                                             ; 4118: 9d a8 09
    lda #spriteid_cache1                                              ; 411b: a9 d0
    sta object_erase_type,x                                           ; 411d: 9d ac 38
    lda #$c0                                                          ; 4120: a9 c0
    sta object_z_order,x                                              ; 4122: 9d c2 38
return6
    rts                                                               ; 4125: 60

update_gun
    lda save_game_level_d_got_gun                                     ; 4126: ad 0f 0a
    bne update_gunshot                                                ; 4129: d0 21
    lda desired_room_index                                            ; 412b: a5 30
    cmp #3                                                            ; 412d: c9 03
    bne return7                                                       ; 412f: d0 2a
    ldx #objectid_old_player                                          ; 4131: a2 0b
    ldy #objectid_gun                                                 ; 4133: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 4135: 20 e2 28
    beq return7                                                       ; 4138: f0 21
    lda #spriteid_gun_menu_item                                       ; 413a: a9 cf
    jsr find_or_create_menu_slot_for_A                                ; 413c: 20 bd 2b
    lda #spriteid_one_pixel_masked_out                                ; 413f: a9 00
    sta object_spriteid + objectid_gun                                ; 4141: 8d ab 09
    lda #$ff                                                          ; 4144: a9 ff
    sta save_game_level_d_got_gun                                     ; 4146: 8d 0f 0a
    jmp return7                                                       ; 4149: 4c 5b 41

update_gunshot
    lda #spriteid_gun_menu_item                                       ; 414c: a9 cf
    cmp player_using_object_spriteid                                  ; 414e: cd b6 2e
    bne return7                                                       ; 4151: d0 08
    cmp previous_player_using_object_spriteid                         ; 4153: cd b7 2e
    beq return7                                                       ; 4156: f0 03
    jsr play_gunshot_sound                                            ; 4158: 20 ea 3f
return7
    rts                                                               ; 415b: 60

baby_x_offsets
    !byte 4                                                           ; 415c: 04
    !byte 0                                                           ; 415d: 00
    !byte 0                                                           ; 415e: 00
    !byte 0                                                           ; 415f: 00
    !byte 0                                                           ; 4160: 00
    !byte 0                                                           ; 4161: 00
    !byte 6                                                           ; 4162: 06
    !byte 5                                                           ; 4163: 05
    !byte 5                                                           ; 4164: 05
    !byte 4                                                           ; 4165: 04
    !byte 0                                                           ; 4166: 00
    !byte 0                                                           ; 4167: 00
    !byte 0                                                           ; 4168: 00
    !byte 0                                                           ; 4169: 00
    !byte 0                                                           ; 416a: 00
    !byte 0                                                           ; 416b: 00
    !byte 0                                                           ; 416c: 00
baby_y_offsets
    !byte 0                                                           ; 416d: 00
    !byte 0                                                           ; 416e: 00
    !byte 0                                                           ; 416f: 00
    !byte 0                                                           ; 4170: 00
    !byte 0                                                           ; 4171: 00
    !byte 0                                                           ; 4172: 00
    !byte $fa                                                         ; 4173: fa
    !byte $fe                                                         ; 4174: fe
    !byte 2                                                           ; 4175: 02
    !byte 6                                                           ; 4176: 06
    !byte 8                                                           ; 4177: 08
    !byte 8                                                           ; 4178: 08
    !byte 8                                                           ; 4179: 08
    !byte 8                                                           ; 417a: 08
    !byte 8                                                           ; 417b: 08
    !byte 8                                                           ; 417c: 08
    !byte 8                                                           ; 417d: 08
baby_base_spriteids
baby_walk_to_block_exit_animation
    !byte spriteid_baby_smile                                         ; 417e: d8
    !byte spriteid_baby_smile                                         ; 417f: d8
    !byte spriteid_baby_smile                                         ; 4180: d8
    !byte spriteid_baby_smile                                         ; 4181: d8
    !byte spriteid_baby_smile                                         ; 4182: d8
    !byte spriteid_baby_smile                                         ; 4183: d8
    !byte spriteid_baby_walk                                          ; 4184: db
    !byte spriteid_baby_walk                                          ; 4185: db
    !byte spriteid_baby_walk                                          ; 4186: db
    !byte spriteid_baby_walk                                          ; 4187: db
    !byte spriteid_baby_walk                                          ; 4188: db
    !byte spriteid_baby_walk                                          ; 4189: db
    !byte spriteid_baby_walk                                          ; 418a: db
    !byte spriteid_baby_walk                                          ; 418b: db
    !byte spriteid_baby_walk                                          ; 418c: db
    !byte spriteid_baby_walk                                          ; 418d: db
    !byte spriteid_baby_walk                                          ; 418e: db
    !byte 0                                                           ; 418f: 00
baby_sit_animation
    !byte spriteid_baby_sit                                           ; 4190: dc
    !byte 0                                                           ; 4191: 00
baby_smile_animation
    !byte spriteid_baby_smile                                         ; 4192: d8
    !byte 0                                                           ; 4193: 00
baby_walk_animation
    !byte spriteid_baby_walk                                          ; 4194: db
    !byte spriteid_baby_walk                                          ; 4195: db
    !byte spriteid_baby_walk                                          ; 4196: db
    !byte spriteid_baby_walk                                          ; 4197: db
    !byte spriteid_baby_walk                                          ; 4198: db
    !byte spriteid_baby_walk                                          ; 4199: db
    !byte spriteid_baby_walk                                          ; 419a: db
    !byte spriteid_baby_walk                                          ; 419b: db
    !byte spriteid_baby_walk                                          ; 419c: db
    !byte spriteid_baby_walk                                          ; 419d: db
    !byte 0                                                           ; 419e: 00
baby_surprise_animation
    !byte spriteid_baby_surprise                                      ; 419f: d9
    !byte spriteid_baby_surprise                                      ; 41a0: d9
    !byte spriteid_baby_surprise                                      ; 41a1: d9
    !byte spriteid_baby_surprise                                      ; 41a2: d9
    !byte spriteid_baby_surprise                                      ; 41a3: d9
    !byte spriteid_baby_surprise                                      ; 41a4: d9
    !byte spriteid_baby_surprise                                      ; 41a5: d9
    !byte spriteid_baby_surprise                                      ; 41a6: d9
    !byte spriteid_baby_surprise                                      ; 41a7: d9
    !byte spriteid_baby_surprise                                      ; 41a8: d9
    !byte 0                                                           ; 41a9: 00
baby_dead_animation
    !byte spriteid_baby_dead                                          ; 41aa: da
    !byte 0                                                           ; 41ab: 00

; check for first update in room (branch if not)
update_baby_puzzle
    lda update_room_first_update_flag                                 ; 41ac: ad 2b 13
    beq update_baby_animation_step                                    ; 41af: f0 5c
; check for level change (branch if not)
    lda current_level                                                 ; 41b1: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 41b3: c5 51
    beq update_baby_object_if_in_room_3                               ; 41b5: f0 36
    lda #baby_sit_animation - baby_base_spriteids                     ; 41b7: a9 12
    sta l0070                                                         ; 41b9: 85 70
    ldx #$20 ; ' '                                                    ; 41bb: a2 20
    ldy #$76 ; 'v'                                                    ; 41bd: a0 76
    lda save_game_level_d_baby_progress                               ; 41bf: ad 12 0a
    beq set_baby_position_and_animation                               ; 41c2: f0 1b
    cmp #baby_sit_animation - baby_base_spriteids                     ; 41c4: c9 12
    beq set_baby_position_and_animation                               ; 41c6: f0 17
    lda #baby_dead_animation - baby_base_spriteids                    ; 41c8: a9 2c
    sta l0070                                                         ; 41ca: 85 70
    ldx #$38 ; '8'                                                    ; 41cc: a2 38
    ldy #$ae                                                          ; 41ce: a0 ae
    lda save_game_level_d_baby_progress                               ; 41d0: ad 12 0a
    cmp #baby_dead_animation - baby_base_spriteids                    ; 41d3: c9 2c
    beq set_baby_position_and_animation                               ; 41d5: f0 08
    cmp #baby_surprise_animation - baby_base_spriteids                ; 41d7: c9 21
    beq set_baby_position_and_animation                               ; 41d9: f0 04
    lda #baby_smile_animation - baby_base_spriteids                   ; 41db: a9 14
    sta l0070                                                         ; 41dd: 85 70
set_baby_position_and_animation
    lda l0070                                                         ; 41df: a5 70
    sta save_game_level_d_baby_progress                               ; 41e1: 8d 12 0a
    sta baby_animation_step_index                                     ; 41e4: 8d 6f 0a
    stx baby_x_position                                               ; 41e7: 8e 70 0a
    sty baby_y_position                                               ; 41ea: 8c 71 0a
update_baby_object_if_in_room_3
    lda desired_room_index                                            ; 41ed: a5 30
    cmp #3                                                            ; 41ef: c9 03
    bne copy_new_baby_state_back_to_object_local                      ; 41f1: d0 14
    ldx #objectid_baby                                                ; 41f3: a2 05
    lda #0                                                            ; 41f5: a9 00
    sta object_x_high,x                                               ; 41f7: 9d 66 09
    sta object_y_high,x                                               ; 41fa: 9d 92 09
    lda #spriteid_cache2                                              ; 41fd: a9 d1
    sta object_erase_type,x                                           ; 41ff: 9d ac 38
    lda #$c0                                                          ; 4202: a9 c0
    sta object_z_order,x                                              ; 4204: 9d c2 38
copy_new_baby_state_back_to_object_local
    jmp copy_new_baby_state_back_to_object                            ; 4207: 4c 09 43

set_baby_animation_step_local
    jmp set_baby_animation_step                                       ; 420a: 4c eb 42

update_baby_animation_step
    lda baby_animation_step_index                                     ; 420d: ad 6f 0a
    clc                                                               ; 4210: 18
    adc #1                                                            ; 4211: 69 01
    tay                                                               ; 4213: a8
    lda baby_base_spriteids,y                                         ; 4214: b9 7e 41
    bne baby_animation_in_progress                                    ; 4217: d0 03
    ldy save_game_level_d_baby_progress                               ; 4219: ac 12 0a
baby_animation_in_progress
    lda save_game_level_d_baby_progress                               ; 421c: ad 12 0a
    cmp #baby_sit_animation - baby_base_spriteids                     ; 421f: c9 12
    bne baby_is_not_sitting                                           ; 4221: d0 1a
    lda desired_room_index                                            ; 4223: a5 30
    cmp #3                                                            ; 4225: c9 03
    bne set_baby_animation_step_local                                 ; 4227: d0 e1
    lda object_x_high                                                 ; 4229: ad 66 09
    bne set_baby_animation_step_local                                 ; 422c: d0 dc
    lda object_x_low                                                  ; 422e: ad 50 09
    cmp #$80                                                          ; 4231: c9 80
    bcc set_baby_animation_step_local                                 ; 4233: 90 d5
    ldy #baby_walk_to_block_exit_animation - baby_base_spriteids      ; 4235: a0 00
    sty save_game_level_d_baby_progress                               ; 4237: 8c 12 0a
    jmp set_baby_animation_step                                       ; 423a: 4c eb 42

baby_is_not_sitting
    cmp #baby_walk_to_block_exit_animation - baby_base_spriteids      ; 423d: c9 00
    bne baby_is_not_walking_to_block_exit                             ; 423f: d0 1f
; check if we have reached the end of the 'walk to block exit' animation (branch if so)
    cpy #baby_walk_to_block_exit_animation+16 - baby_base_spriteids   ; 4241: c0 10
    beq reached_end_of_walk_to_block_exit_animation                   ; 4243: f0 07
    cpy #baby_walk_to_block_exit_animation - baby_base_spriteids      ; 4245: c0 00
    beq start_of_walk_to_block_exit_animation                         ; 4247: f0 11
    jmp set_baby_animation_step                                       ; 4249: 4c eb 42

reached_end_of_walk_to_block_exit_animation
    lda desired_room_index                                            ; 424c: a5 30
    cmp #3                                                            ; 424e: c9 03
    bne set_baby_animation_step_local                                 ; 4250: d0 b8
    jsr play_landing_sound                                            ; 4252: 20 a9 23
    ldy #baby_walk_to_block_exit_animation+16 - baby_base_spriteids   ; 4255: a0 10
    jmp set_baby_animation_step                                       ; 4257: 4c eb 42

start_of_walk_to_block_exit_animation
    lda #baby_smile_animation - baby_base_spriteids                   ; 425a: a9 14
    sta save_game_level_d_baby_progress                               ; 425c: 8d 12 0a
    tay                                                               ; 425f: a8
baby_is_not_walking_to_block_exit
    cmp #baby_smile_animation - baby_base_spriteids                   ; 4260: c9 14
    bne baby_is_not_smiling                                           ; 4262: d0 5e
    lda desired_room_index                                            ; 4264: a5 30
    cmp #3                                                            ; 4266: c9 03
    bne set_baby_animation_step_local                                 ; 4268: d0 a0
    lda #spriteid_gun_menu_item                                       ; 426a: a9 cf
    cmp player_using_object_spriteid                                  ; 426c: cd b6 2e
    bne check_for_player_baby_collision                               ; 426f: d0 25
    cmp previous_player_using_object_spriteid                         ; 4271: cd b7 2e
    beq check_for_player_baby_collision                               ; 4274: f0 20
    lda object_direction                                              ; 4276: ad be 09
    bpl check_for_player_baby_collision                               ; 4279: 10 1b
    lda object_y_low                                                  ; 427b: ad 7c 09
    cmp #$a8                                                          ; 427e: c9 a8
    bcc check_for_player_baby_collision                               ; 4280: 90 14
    lda object_x_high                                                 ; 4282: ad 66 09
    bne check_for_player_baby_collision                               ; 4285: d0 0f
    lda object_x_low                                                  ; 4287: ad 50 09
    cmp #$d0                                                          ; 428a: c9 d0
    bcs check_for_player_baby_collision                               ; 428c: b0 08
    ldy #baby_surprise_animation - baby_base_spriteids                ; 428e: a0 21
    sty save_game_level_d_baby_progress                               ; 4290: 8c 12 0a
    jmp set_baby_animation_step                                       ; 4293: 4c eb 42

check_for_player_baby_collision
    ldx #objectid_player                                              ; 4296: a2 00
    sty temp_animation_index                                          ; 4298: 8c 67 43
    ldy #objectid_baby                                                ; 429b: a0 05
    jsr test_for_collision_between_objects_x_and_y                    ; 429d: 20 e2 28
    ldy temp_animation_index                                          ; 42a0: ac 67 43
    ora #0                                                            ; 42a3: 09 00
    bne got_player_baby_collision                                     ; 42a5: d0 11
    ldx #objectid_player_accessory                                    ; 42a7: a2 01
    sty temp_animation_index                                          ; 42a9: 8c 67 43
    ldy #objectid_baby                                                ; 42ac: a0 05
    jsr test_for_collision_between_objects_x_and_y                    ; 42ae: 20 e2 28
    ldy temp_animation_index                                          ; 42b1: ac 67 43
    ora #0                                                            ; 42b4: 09 00
    beq set_baby_animation_step                                       ; 42b6: f0 33
got_player_baby_collision
    lda #6                                                            ; 42b8: a9 06
    sta player_wall_collision_reaction_speed                          ; 42ba: 8d 33 24
    ldy #baby_walk_animation - baby_base_spriteids                    ; 42bd: a0 16
    jmp set_baby_animation_step                                       ; 42bf: 4c eb 42

baby_is_not_smiling
    cmp #baby_surprise_animation - baby_base_spriteids                ; 42c2: c9 21
    bne set_baby_animation_step                                       ; 42c4: d0 25
    cpy #baby_surprise_animation - baby_base_spriteids                ; 42c6: c0 21
    bne set_baby_animation_step                                       ; 42c8: d0 21
; beginning the surprise animation, clear collision map for baby
    lda desired_room_index                                            ; 42ca: a5 30
    cmp #3                                                            ; 42cc: c9 03
    bne set_dead_baby_animation                                       ; 42ce: d0 16
    jsr play_baby_dying_or_partition_landing_sounds                   ; 42d0: 20 d9 3f
    lda #collision_map_none                                           ; 42d3: a9 00
    sta value_to_write_to_collision_map                               ; 42d5: 85 3e
    ldx #6                                                            ; 42d7: a2 06
    ldy #$13                                                          ; 42d9: a0 13
    lda #2                                                            ; 42db: a9 02
    sta width_in_cells                                                ; 42dd: 85 3c
    lda #3                                                            ; 42df: a9 03
    sta height_in_cells                                               ; 42e1: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 42e3: 20 44 1e
set_dead_baby_animation
    ldy #baby_dead_animation - baby_base_spriteids                    ; 42e6: a0 2c
    sty save_game_level_d_baby_progress                               ; 42e8: 8c 12 0a
set_baby_animation_step
    sty baby_animation_step_index                                     ; 42eb: 8c 6f 0a
    lda save_game_level_d_baby_progress                               ; 42ee: ad 12 0a
    cmp #0                                                            ; 42f1: c9 00
    bne copy_new_baby_state_back_to_object                            ; 42f3: d0 14
    lda baby_x_offsets,y                                              ; 42f5: b9 5c 41
    clc                                                               ; 42f8: 18
    adc baby_x_position                                               ; 42f9: 6d 70 0a
    sta baby_x_position                                               ; 42fc: 8d 70 0a
    lda baby_y_offsets,y                                              ; 42ff: b9 6d 41
    clc                                                               ; 4302: 18
    adc baby_y_position                                               ; 4303: 6d 71 0a
    sta baby_y_position                                               ; 4306: 8d 71 0a
copy_new_baby_state_back_to_object
    lda desired_room_index                                            ; 4309: a5 30
    cmp #3                                                            ; 430b: c9 03
    bne return8                                                       ; 430d: d0 57
    ldy baby_animation_step_index                                     ; 430f: ac 6f 0a
    lda baby_base_spriteids,y                                         ; 4312: b9 7e 41
    sta object_spriteid + objectid_baby                               ; 4315: 8d ad 09
    lda baby_x_position                                               ; 4318: ad 70 0a
    sta object_x_low + objectid_baby                                  ; 431b: 8d 55 09
    lda baby_y_position                                               ; 431e: ad 71 0a
    sta object_y_low + objectid_baby                                  ; 4321: 8d 81 09
    lda #collision_map_solid_rock                                     ; 4324: a9 03
    sta value_to_write_to_collision_map                               ; 4326: 85 3e
    lda save_game_level_d_baby_progress                               ; 4328: ad 12 0a
    cmp #baby_smile_animation - baby_base_spriteids                   ; 432b: c9 14
    beq add_baby_to_collision_map                                     ; 432d: f0 23
    cmp #baby_surprise_animation - baby_base_spriteids                ; 432f: c9 21
    beq add_baby_to_collision_map                                     ; 4331: f0 1f
    cmp #baby_walk_to_block_exit_animation - baby_base_spriteids      ; 4333: c9 00
    beq add_baby_to_collision_map                                     ; 4335: f0 1b
    cmp #baby_dead_animation - baby_base_spriteids                    ; 4337: c9 2c
    bne return8                                                       ; 4339: d0 2b
; write sold rock values into the collision map for the dead baby
    lda #3                                                            ; 433b: a9 03
    sta width_in_cells                                                ; 433d: 85 3c
    lda #1                                                            ; 433f: a9 01
    sta height_in_cells                                               ; 4341: 85 3d
    ldx #4                                                            ; 4343: a2 04
    ldy #$15                                                          ; 4345: a0 15
    jsr read_collision_map_value_for_xy                               ; 4347: 20 fa 1e
    bne return8                                                       ; 434a: d0 1a
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 434c: 20 44 1e
    jmp return8                                                       ; 434f: 4c 66 43

add_baby_to_collision_map
    lda #2                                                            ; 4352: a9 02
    sta width_in_cells                                                ; 4354: 85 3c
    lda #3                                                            ; 4356: a9 03
    sta height_in_cells                                               ; 4358: 85 3d
    ldx #6                                                            ; 435a: a2 06
    ldy #$13                                                          ; 435c: a0 13
    jsr read_collision_map_value_for_xy                               ; 435e: 20 fa 1e
    bne return8                                                       ; 4361: d0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 4363: 20 44 1e
return8
    rts                                                               ; 4366: 60

temp_animation_index
    !byte 0                                                           ; 4367: 00
envelope2
    !byte 5                                                           ; 4368: 05                      ; envelope number
    !byte 1                                                           ; 4369: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 436a: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 436b: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 436c: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 436d: 00                      ; number of steps in section 1
    !byte 0                                                           ; 436e: 00                      ; number of steps in section 2
    !byte 0                                                           ; 436f: 00                      ; number of steps in section 3
    !byte 126                                                         ; 4370: 7e                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4371: 00                      ; change of amplitude per step during decay phase
    !byte 252                                                         ; 4372: fc                      ; change of amplitude per step during sustain phase
    !byte 248                                                         ; 4373: f8                      ; change of amplitude per step during release phase
    !byte 126                                                         ; 4374: 7e                      ; target of level at end of attack phase
    !byte 0                                                           ; 4375: 00                      ; target of level at end of decay phase
sound4
    !word $10                                                         ; 4376: 10 00                   ; channel
    !word 5                                                           ; 4378: 05 00                   ; amplitude
    !word 7                                                           ; 437a: 07 00                   ; pitch
    !word 1                                                           ; 437c: 01 00                   ; duration
sound3
    !word $11                                                         ; 437e: 11 00                   ; channel
    !word 0                                                           ; 4380: 00 00                   ; amplitude
    !word 200                                                         ; 4382: c8 00                   ; pitch
    !word 1                                                           ; 4384: 01 00                   ; duration
envelope1
    !byte 6                                                           ; 4386: 06                      ; envelope number
    !byte 1                                                           ; 4387: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 4388: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 4389: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 438a: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 438b: 00                      ; number of steps in section 1
    !byte 0                                                           ; 438c: 00                      ; number of steps in section 2
    !byte 0                                                           ; 438d: 00                      ; number of steps in section 3
    !byte 80                                                          ; 438e: 50                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 438f: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4390: 00                      ; change of amplitude per step during sustain phase
    !byte 250                                                         ; 4391: fa                      ; change of amplitude per step during release phase
    !byte 115                                                         ; 4392: 73                      ; target of level at end of attack phase
    !byte 0                                                           ; 4393: 00                      ; target of level at end of decay phase
sound2
    !word $10                                                         ; 4394: 10 00                   ; channel
    !word 6                                                           ; 4396: 06 00                   ; amplitude
    !word 7                                                           ; 4398: 07 00                   ; pitch
    !word 1                                                           ; 439a: 01 00                   ; duration
sound1
    !word $11                                                         ; 439c: 11 00                   ; channel
    !word 0                                                           ; 439e: 00 00                   ; amplitude
    !word 210                                                         ; 43a0: d2 00                   ; pitch
    !word 1                                                           ; 43a2: 01 00                   ; duration
ground_fill_2x2_top_left
    !byte %....#...                                                   ; 43a4: 08
    !byte %...#.#..                                                   ; 43a5: 14
    !byte %..#...#.                                                   ; 43a6: 22
    !byte %.#.....#                                                   ; 43a7: 41
    !byte %#.......                                                   ; 43a8: 80
    !byte %.#......                                                   ; 43a9: 40
    !byte %..#.....                                                   ; 43aa: 20
    !byte %...#....                                                   ; 43ab: 10
ground_fill_2x2_top_right
    !byte %...#....                                                   ; 43ac: 10
    !byte %..#.....                                                   ; 43ad: 20
    !byte %##......                                                   ; 43ae: c0
    !byte %..#.....                                                   ; 43af: 20
    !byte %...#...#                                                   ; 43b0: 11
    !byte %....#.#.                                                   ; 43b1: 0a
    !byte %.....#..                                                   ; 43b2: 04
    !byte %.....#..                                                   ; 43b3: 04
ground_fill_2x2_bottom_left
    !byte %..#.....                                                   ; 43b4: 20
    !byte %..#.....                                                   ; 43b5: 20
    !byte %.#.#....                                                   ; 43b6: 50
    !byte %#...#...                                                   ; 43b7: 88
    !byte %.....#..                                                   ; 43b8: 04
    !byte %......##                                                   ; 43b9: 03
    !byte %.....#..                                                   ; 43ba: 04
    !byte %....#...                                                   ; 43bb: 08
ground_fill_2x2_bottom_right
    !byte %....#...                                                   ; 43bc: 08
    !byte %.....#..                                                   ; 43bd: 04
    !byte %......#.                                                   ; 43be: 02
    !byte %.......#                                                   ; 43bf: 01
    !byte %#.....#.                                                   ; 43c0: 82
    !byte %.#...#..                                                   ; 43c1: 44
    !byte %..#.#...                                                   ; 43c2: 28
    !byte %...#....                                                   ; 43c3: 10
sprite_data
pydis_end
!if (<envelope1) != $86 {
    !error "Assertion failed: <envelope1 == $86"
}
!if (<envelope2) != $68 {
    !error "Assertion failed: <envelope2 == $68"
}
!if (<ground_fill_2x2_top_left) != $a4 {
    !error "Assertion failed: <ground_fill_2x2_top_left == $a4"
}
!if (<sound1) != $9c {
    !error "Assertion failed: <sound1 == $9c"
}
!if (<sound2) != $94 {
    !error "Assertion failed: <sound2 == $94"
}
!if (<sound3) != $7e {
    !error "Assertion failed: <sound3 == $7e"
}
!if (<sound4) != $76 {
    !error "Assertion failed: <sound4 == $76"
}
!if (>envelope1) != $43 {
    !error "Assertion failed: >envelope1 == $43"
}
!if (>envelope2) != $43 {
    !error "Assertion failed: >envelope2 == $43"
}
!if (>ground_fill_2x2_top_left) != $43 {
    !error "Assertion failed: >ground_fill_2x2_top_left == $43"
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
!if (>sound4) != $43 {
    !error "Assertion failed: >sound4 == $43"
}
!if (baby_dead_animation - baby_base_spriteids) != $2c {
    !error "Assertion failed: baby_dead_animation - baby_base_spriteids == $2c"
}
!if (baby_sit_animation - baby_base_spriteids) != $12 {
    !error "Assertion failed: baby_sit_animation - baby_base_spriteids == $12"
}
!if (baby_smile_animation - baby_base_spriteids) != $14 {
    !error "Assertion failed: baby_smile_animation - baby_base_spriteids == $14"
}
!if (baby_surprise_animation - baby_base_spriteids) != $21 {
    !error "Assertion failed: baby_surprise_animation - baby_base_spriteids == $21"
}
!if (baby_walk_animation - baby_base_spriteids) != $16 {
    !error "Assertion failed: baby_walk_animation - baby_base_spriteids == $16"
}
!if (baby_walk_to_block_exit_animation - baby_base_spriteids) != $00 {
    !error "Assertion failed: baby_walk_to_block_exit_animation - baby_base_spriteids == $00"
}
!if (baby_walk_to_block_exit_animation+16 - baby_base_spriteids) != $10 {
    !error "Assertion failed: baby_walk_to_block_exit_animation+16 - baby_base_spriteids == $10"
}
!if (collectable_being_used_spriteids+2) != $2ef4 {
    !error "Assertion failed: collectable_being_used_spriteids+2 == $2ef4"
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
!if (level_specific_initialisation) != $3af3 {
    !error "Assertion failed: level_specific_initialisation == $3af3"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b1d {
    !error "Assertion failed: level_specific_update == $3b1d"
}
!if (object_spriteid + objectid_axe) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_axe == $09ab"
}
!if (object_spriteid + objectid_baby) != $09ad {
    !error "Assertion failed: object_spriteid + objectid_baby == $09ad"
}
!if (object_spriteid + objectid_gun) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_gun == $09ab"
}
!if (object_spriteid + objectid_partition) != $09ac {
    !error "Assertion failed: object_spriteid + objectid_partition == $09ac"
}
!if (object_spriteid + objectid_sign) != $09ad {
    !error "Assertion failed: object_spriteid + objectid_sign == $09ad"
}
!if (object_x_low + objectid_baby) != $0955 {
    !error "Assertion failed: object_x_low + objectid_baby == $0955"
}
!if (object_y_low + objectid_baby) != $0981 {
    !error "Assertion failed: object_y_low + objectid_baby == $0981"
}
!if (objectid_axe) != $03 {
    !error "Assertion failed: objectid_axe == $03"
}
!if (objectid_baby) != $05 {
    !error "Assertion failed: objectid_baby == $05"
}
!if (objectid_gun) != $03 {
    !error "Assertion failed: objectid_gun == $03"
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
!if (objectid_player_accessory) != $01 {
    !error "Assertion failed: objectid_player_accessory == $01"
}
!if (objectid_sign) != $05 {
    !error "Assertion failed: objectid_sign == $05"
}
!if (objectid_sign_stand) != $04 {
    !error "Assertion failed: objectid_sign_stand == $04"
}
!if (room_0_data) != $3b2d {
    !error "Assertion failed: room_0_data == $3b2d"
}
!if (room_1_data) != $3d7e {
    !error "Assertion failed: room_1_data == $3d7e"
}
!if (room_2_data) != $3e39 {
    !error "Assertion failed: room_2_data == $3e39"
}
!if (room_3_data) != $3ffb {
    !error "Assertion failed: room_3_data == $3ffb"
}
!if (sprite_data - level_data) != $08ef {
    !error "Assertion failed: sprite_data - level_data == $08ef"
}
!if (spriteid_axe) != $c9 {
    !error "Assertion failed: spriteid_axe == $c9"
}
!if (spriteid_axe_menu_item) != $ca {
    !error "Assertion failed: spriteid_axe_menu_item == $ca"
}
!if (spriteid_baby_dead) != $da {
    !error "Assertion failed: spriteid_baby_dead == $da"
}
!if (spriteid_baby_sit) != $dc {
    !error "Assertion failed: spriteid_baby_sit == $dc"
}
!if (spriteid_baby_smile) != $d8 {
    !error "Assertion failed: spriteid_baby_smile == $d8"
}
!if (spriteid_baby_surprise) != $d9 {
    !error "Assertion failed: spriteid_baby_surprise == $d9"
}
!if (spriteid_baby_walk) != $db {
    !error "Assertion failed: spriteid_baby_walk == $db"
}
!if (spriteid_broken_partition_base) != $d4 {
    !error "Assertion failed: spriteid_broken_partition_base == $d4"
}
!if (spriteid_cache1) != $d0 {
    !error "Assertion failed: spriteid_cache1 == $d0"
}
!if (spriteid_cache2) != $d1 {
    !error "Assertion failed: spriteid_cache2 == $d1"
}
!if (spriteid_fallen_partition) != $d7 {
    !error "Assertion failed: spriteid_fallen_partition == $d7"
}
!if (spriteid_falling_partition) != $d6 {
    !error "Assertion failed: spriteid_falling_partition == $d6"
}
!if (spriteid_gnu_head) != $cb {
    !error "Assertion failed: spriteid_gnu_head == $cb"
}
!if (spriteid_gun) != $cd {
    !error "Assertion failed: spriteid_gun == $cd"
}
!if (spriteid_gun_held) != $ce {
    !error "Assertion failed: spriteid_gun_held == $ce"
}
!if (spriteid_gun_menu_item) != $cf {
    !error "Assertion failed: spriteid_gun_menu_item == $cf"
}
!if (spriteid_one_pixel_masked_out) != $00 {
    !error "Assertion failed: spriteid_one_pixel_masked_out == $00"
}
!if (spriteid_partition) != $d5 {
    !error "Assertion failed: spriteid_partition == $d5"
}
!if (spriteid_rock) != $cc {
    !error "Assertion failed: spriteid_rock == $cc"
}
!if (spriteid_sign) != $d3 {
    !error "Assertion failed: spriteid_sign == $d3"
}
!if (spriteid_sign_stand) != $d2 {
    !error "Assertion failed: spriteid_sign_stand == $d2"
}
!if (spriteid_wood_block) != $c8 {
    !error "Assertion failed: spriteid_wood_block == $c8"
}
