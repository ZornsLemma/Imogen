; *************************************************************************************
;
; Level J: 'DRIPPING-STUFF'
;
; Save game variables:
;
;     save_game_level_k_plant_top_y                              ($0a33):
;             $70: plant starting y position
;             $50: plant grown once y position
;             $30: plant grown twice y position
;             $10: plant full y position
;
;     save_game_level_k_plant_growth_timer                       ($0a34):
;               0: not growing
;           1-$15: growing
;            $80+: being poisoned
;
;     save_game_level_k_got_bottle_flag                          ($0a35):
;               0: bottle not got
;               1: empty bottle taken
;             $ff: full bottle taken
;
;     save_game_level_k_poison_in_bottle_flag                    ($0a36):
;               0: no poison in bottle
;             $ff: poison in bottle
;
;     save_game_level_k_dog_animation:                           ($0a37):
;               1: dead
;               5: drinking
;             $1b: pushing player
;             $3a: stunned before dying
;
;     save_game_level_k_poison_dog_animation_step                ($0a38):
;               a timer for the dog's death sequence
;
; Solution:
;
;   1. Collect the bottle from the leftmost room
;   2. Hold the bottle under the drip in the initial room to fill with water
;   3. pour the water onto the stem of the plant one room to the right
;   4. repeat until plant is fully grown (reaches ceiling)
;   5. climb plant and go to room to the right
;   6. Fill bottle with poison from the drip
;   7. go to the leftmost room and climb the rope to the dog
;   8. pour the poison into the dog bowl (the dog dies) and jump over to reach the spell
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
inkey_key_g                           = 172
inkey_key_p                           = 200
last_level_letter                     = 81
object_collided_ceiling               = 8
object_collided_floor                 = 2
object_collided_left_wall             = 1
object_collided_right_wall            = 4
objectid_bottle_pour                  = 2
objectid_dog_body                     = 5
objectid_dog_bowl                     = 7
objectid_dog_head                     = 6
objectid_drip                         = 3
objectid_empty_bottle                 = 3
objectid_leaf1                        = 4
objectid_leaf2                        = 5
objectid_old_drip                     = 14
objectid_old_player                   = 11
objectid_old_player_accessory         = 12
objectid_player                       = 0
objectid_player_accessory             = 1
objectid_room2_fire1                  = 6
objectid_room2_fire2                  = 7
objectid_room_1_fire1                 = 4
objectid_room_1_fire2                 = 5
objectid_room_3_fire                  = 4
objectid_spell                        = 4
objectid_top_of_stalk                 = 3
opcode_jmp                            = 76
sprite_op_flags_copy_screen           = 1
sprite_op_flags_erase_to_bg_colour    = 2
sprite_op_flags_erase_to_fg_colour    = 4
sprite_op_flags_normal                = 0
spriteid_197                          = 197
spriteid_ball                         = 59
spriteid_brazier                      = 58
spriteid_bucket                       = 216
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
spriteid_dog_body                     = 233
spriteid_dog_bowl1                    = 236
spriteid_dog_bowl2                    = 237
spriteid_dog_dead                     = 232
spriteid_dog_head                     = 234
spriteid_dog_head_licking             = 235
spriteid_droplet                      = 218
spriteid_droplet1                     = 219
spriteid_droplet2                     = 220
spriteid_droplet3                     = 221
spriteid_droplet4                     = 222
spriteid_empty_bottle                 = 210
spriteid_empty_bottle_held            = 211
spriteid_empty_bottle_menu_item       = 214
spriteid_emptying_bottle              = 213
spriteid_erase_1                      = 209
spriteid_erase_2                      = 228
spriteid_erase_3                      = 231
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
spriteid_full_bottle                  = 204
spriteid_full_bottle_held             = 212
spriteid_full_bottle_menu_item        = 215
spriteid_icodata_box                  = 9
spriteid_icodata_cat                  = 5
spriteid_icodata_disc                 = 3
spriteid_icodata_info                 = 7
spriteid_icodata_monkey               = 6
spriteid_icodata_password             = 8
spriteid_icodata_sound                = 2
spriteid_icodata_wizard               = 4
spriteid_icon_background              = 1
spriteid_leaf                         = 205
spriteid_leaf_grow1                   = 208
spriteid_leaf_grow2                   = 207
spriteid_leaf_grow3                   = 206
spriteid_leaf_wilt_1                  = 224
spriteid_leaf_wilt_2                  = 225
spriteid_leaf_wilt_3                  = 226
spriteid_leaf_wilt_4                  = 227
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
spriteid_pour                         = 223
spriteid_rope1                        = 85
spriteid_rope2                        = 86
spriteid_rope3                        = 87
spriteid_rope4                        = 88
spriteid_rope_end                     = 10
spriteid_rope_hook                    = 11
spriteid_shelf                        = 229
spriteid_shelf_support                = 230
spriteid_sparkles1                    = 34
spriteid_sparkles2                    = 35
spriteid_sparkles3                    = 36
spriteid_sparkles4                    = 37
spriteid_sparkles5                    = 38
spriteid_splash                       = 217
spriteid_stalk                        = 200
spriteid_stalk_bottom_end             = 201
spriteid_stalk_top_end                = 202
spriteid_stalk_top_end_short          = 203
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
room_exit_direction                                 = $70
stalk_cell_y_min                                    = $70
temp_stalk_y                                        = $70
temp_y                                              = $70
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
save_game_level_k_plant_top_y                       = $0a33
save_game_level_k_plant_growth_timer                = $0a34
save_game_level_k_got_bottle_flag                   = $0a35
save_game_level_k_poison_in_bottle_flag             = $0a36
save_game_level_k_dog_animation                     = $0a37
save_game_level_k_poison_dog_animation_step         = $0a38
room_1_drip_timer                                   = $0a6f
bottle_pour_x_low                                   = $0a70
bottle_pour_x_high                                  = $0a71
bottle_pour_y                                       = $0a72
bottle_pour_animation_step                          = $0a73
bottle_pour_direction                               = $0a74
room_3_drip_timer                                   = $0a75
dog_animation_step                                  = $0a76
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
    !word sprite_data - level_data                                    ; 3ad5: 58 0a                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f6 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 2a 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
room_index_cheat1
    !byte 1                                                           ; 3add: 01
room_index_cheat2
    !byte 0                                                           ; 3ade: 00
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
; check for level change (branch if not)
level_specific_initialisation
    lda current_level                                                 ; 3af6: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3af8: c5 51
    beq set_ground_tile                                               ; 3afa: f0 25
    lda developer_flags                                               ; 3afc: ad 03 11
    bpl developer_mode_inactive1                                      ; 3aff: 10 0a
; in developer mode, we have the bottle filled with poison
    lda #$ff                                                          ; 3b01: a9 ff
    sta save_game_level_k_got_bottle_flag                             ; 3b03: 8d 35 0a
    lda #$ff                                                          ; 3b06: a9 ff
    sta save_game_level_k_poison_in_bottle_flag                       ; 3b08: 8d 36 0a
developer_mode_inactive1
    lda save_game_level_k_got_bottle_flag                             ; 3b0b: ad 35 0a
    beq set_ground_tile                                               ; 3b0e: f0 11
; add full or empty bottle to taskbar
    cmp #$ff                                                          ; 3b10: c9 ff
    beq add_full_bottle_to_toolbar                                    ; 3b12: f0 08
    lda #spriteid_empty_bottle_menu_item                              ; 3b14: a9 d6
    jsr find_or_create_menu_slot_for_A                                ; 3b16: 20 bd 2b
    jmp set_ground_tile                                               ; 3b19: 4c 21 3b

add_full_bottle_to_toolbar
    lda #spriteid_full_bottle_menu_item                               ; 3b1c: a9 d7
    jsr find_or_create_menu_slot_for_A                                ; 3b1e: 20 bd 2b
set_ground_tile
    lda #<ground_fill_2x2_top_left                                    ; 3b21: a9 0d
    sta source_sprite_memory_low                                      ; 3b23: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3b25: a9 45
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
    jsr room_0_update_handler                                         ; 3b2a: 20 9f 41
    jsr room_1_update_handler                                         ; 3b2d: 20 a4 43
    jsr room_3_update_handler                                         ; 3b30: 20 56 3f
    jsr room_2_update_handler                                         ; 3b33: 20 d9 3b
    jsr update_dog_puzzle                                             ; 3b36: 20 44 40
    rts                                                               ; 3b39: 60

draw_top_and_bottom_rows
    ldx #0                                                            ; 3b3a: a2 00
    ldy #0                                                            ; 3b3c: a0 00
    lda #$ff                                                          ; 3b3e: a9 ff
    sta width_in_cells                                                ; 3b40: 85 3c
    lda #2                                                            ; 3b42: a9 02
    sta height_in_cells                                               ; 3b44: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b46: 20 bb 1a
    ldy #$16                                                          ; 3b49: a0 16
    jmp copy_rectangle_of_memory_to_screen                            ; 3b4b: 4c bb 1a

draw_top_left_and_right_corners
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
    jsr draw_top_and_bottom_rows                                      ; 3b62: 20 3a 3b
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
; right of room 2 is room 3
    ldx #3                                                            ; 3bca: a2 03
    ldy current_level                                                 ; 3bcc: a4 31
    jmp initialise_level_and_room                                     ; 3bce: 4c 40 11

growing_leaf_animation
    !byte spriteid_leaf_grow1                                         ; 3bd1: d0
    !byte spriteid_leaf_grow2                                         ; 3bd2: cf
    !byte spriteid_leaf_grow3                                         ; 3bd3: ce
full_leaf
    !byte spriteid_leaf                                               ; 3bd4: cd
leaf_wilt_animation
    !byte spriteid_leaf_wilt_4                                        ; 3bd5: e3
    !byte spriteid_leaf_wilt_3                                        ; 3bd6: e2
    !byte spriteid_leaf_wilt_2                                        ; 3bd7: e1
leaf_start_wilting
    !byte spriteid_leaf_wilt_1                                        ; 3bd8: e0

room_2_update_handler
    lda #2                                                            ; 3bd9: a9 02
    sta currently_updating_logic_for_room_index                       ; 3bdb: 8d ba 1a
; update the two brazier fires
    ldx #3                                                            ; 3bde: a2 03
    ldy #$0c                                                          ; 3be0: a0 0c
    lda #objectid_room2_fire1                                         ; 3be2: a9 06
    jsr update_brazier_and_fire                                       ; 3be4: 20 88 19
    ldx #$25 ; '%'                                                    ; 3be7: a2 25
    lda #objectid_room2_fire2                                         ; 3be9: a9 07
    jsr update_brazier_and_fire                                       ; 3beb: 20 88 19
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 3bee: ad 2b 13
    bne initialise_room_2                                             ; 3bf1: d0 03
    jmp update_room_2                                                 ; 3bf3: 4c 0d 3d

; check for level change (branch if not)
initialise_room_2
    lda current_level                                                 ; 3bf6: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3bf8: c5 51
    beq room_changed_only                                             ; 3bfa: f0 33
; initialise plant top y value
    lda save_game_level_k_plant_top_y                                 ; 3bfc: ad 33 0a
    bne check_plant_growth_timer                                      ; 3bff: d0 0c
; set initial height of the plant
    lda #$70 ; 'p'                                                    ; 3c01: a9 70
    sta save_game_level_k_plant_top_y                                 ; 3c03: 8d 33 0a
    lda #0                                                            ; 3c06: a9 00
    sta save_game_level_k_plant_growth_timer                          ; 3c08: 8d 34 0a
    beq room_changed_only                                             ; 3c0b: f0 22                   ; ALWAYS branch

check_plant_growth_timer
    lda save_game_level_k_plant_growth_timer                          ; 3c0d: ad 34 0a
    bmi initialise_poisoned_plant                                     ; 3c10: 30 13
    beq room_changed_only                                             ; 3c12: f0 1b
; reset timer and grow plant by 32 pixels
    lda #0                                                            ; 3c14: a9 00
    sta save_game_level_k_plant_growth_timer                          ; 3c16: 8d 34 0a
    lda save_game_level_k_plant_top_y                                 ; 3c19: ad 33 0a
    sec                                                               ; 3c1c: 38
    sbc #$20 ; ' '                                                    ; 3c1d: e9 20
    sta save_game_level_k_plant_top_y                                 ; 3c1f: 8d 33 0a
    jmp room_changed_only                                             ; 3c22: 4c 2f 3c

; poisoned plant starts at maximum height
initialise_poisoned_plant
    lda #$10                                                          ; 3c25: a9 10
    sta save_game_level_k_plant_top_y                                 ; 3c27: 8d 33 0a
    lda #$80                                                          ; 3c2a: a9 80
    sta save_game_level_k_plant_growth_timer                          ; 3c2c: 8d 34 0a
room_changed_only
    lda desired_room_index                                            ; 3c2f: a5 30
    cmp #2                                                            ; 3c31: c9 02
    beq initialise_in_room_2                                          ; 3c33: f0 03
    jmp plant_is_growing_local1                                       ; 3c35: 4c cd 3c

initialise_in_room_2
    ldy #$10                                                          ; 3c38: a0 10
    lda save_game_level_k_plant_growth_timer                          ; 3c3a: ad 34 0a
    bmi got_top_of_stalk_in_y                                         ; 3c3d: 30 1a
; calculate position of top of stalk
    ldy save_game_level_k_plant_top_y                                 ; 3c3f: ac 33 0a
    sec                                                               ; 3c42: 38
    sbc #4                                                            ; 3c43: e9 04
    bcc got_top_of_stalk_in_y                                         ; 3c45: 90 12
    asl                                                               ; 3c47: 0a
    sta temp_stalk_y                                                  ; 3c48: 85 70
    cmp #$20 ; ' '                                                    ; 3c4a: c9 20
    bcc got_temp_stalk_y                                              ; 3c4c: 90 04
    lda #$20 ; ' '                                                    ; 3c4e: a9 20
    sta temp_stalk_y                                                  ; 3c50: 85 70
got_temp_stalk_y
    lda save_game_level_k_plant_top_y                                 ; 3c52: ad 33 0a
    sec                                                               ; 3c55: 38
    sbc temp_stalk_y                                                  ; 3c56: e5 70
    tay                                                               ; 3c58: a8
got_top_of_stalk_in_y
    ldx #$14                                                          ; 3c59: a2 14
    lda #1                                                            ; 3c5b: a9 01
    sta width_in_cells                                                ; 3c5d: 85 3c
    sta height_in_cells                                               ; 3c5f: 85 3d
    lda #collision_map_rope                                           ; 3c61: a9 02
    sta value_to_write_to_collision_map                               ; 3c63: 85 3e
    tya                                                               ; 3c65: 98
    pha                                                               ; 3c66: 48
    lsr                                                               ; 3c67: 4a
    lsr                                                               ; 3c68: 4a
    lsr                                                               ; 3c69: 4a
    tay                                                               ; 3c6a: a8
    dey                                                               ; 3c6b: 88
    lda #collision_map_solid_rock                                     ; 3c6c: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3c6e: 20 bb 1e
    iny                                                               ; 3c71: c8
    pla                                                               ; 3c72: 68
    and #7                                                            ; 3c73: 29 07
    sta temp_sprite_y_offset                                          ; 3c75: 85 3b
    lda #spriteid_stalk_top_end                                       ; 3c77: a9 ca
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3c79: 20 57 1f
    ldx #objectid_top_of_stalk                                        ; 3c7c: a2 03
    jsr set_object_position_from_current_sprite_position              ; 3c7e: 20 6d 1f
    ldx #$14                                                          ; 3c81: a2 14
    iny                                                               ; 3c83: c8
    lda #spriteid_stalk                                               ; 3c84: a9 c8
draw_stalk_to_bottom
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3c86: 20 57 1f
    iny                                                               ; 3c89: c8
    cpy #$15                                                          ; 3c8a: c0 15
    bcc draw_stalk_to_bottom                                          ; 3c8c: 90 f8
; draw bottom of stalk
    lda #spriteid_stalk_bottom_end                                    ; 3c8e: a9 c9
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3c90: 20 57 1f
    lda save_game_level_k_plant_top_y                                 ; 3c93: ad 33 0a
    lsr                                                               ; 3c96: 4a
    lsr                                                               ; 3c97: 4a
    lsr                                                               ; 3c98: 4a
    tay                                                               ; 3c99: a8
    lda full_leaf                                                     ; 3c9a: ad d4 3b
    sta draw_leaf_sprite                                              ; 3c9d: 8d 08 3d
    lda save_game_level_k_plant_growth_timer                          ; 3ca0: ad 34 0a
    bpl draw_leaves                                                   ; 3ca3: 10 16
    tya                                                               ; 3ca5: 98
    sec                                                               ; 3ca6: 38
    sbc #4                                                            ; 3ca7: e9 04
    ldy #2                                                            ; 3ca9: a0 02
    jsr draw_leaves_on_stalk                                          ; 3cab: 20 d0 3c
    lda save_game_level_k_plant_top_y                                 ; 3cae: ad 33 0a
    lsr                                                               ; 3cb1: 4a
    lsr                                                               ; 3cb2: 4a
    lsr                                                               ; 3cb3: 4a
    tay                                                               ; 3cb4: a8
    lda leaf_start_wilting                                            ; 3cb5: ad d8 3b
    sta draw_leaf_sprite                                              ; 3cb8: 8d 08 3d
draw_leaves
    lda #$12                                                          ; 3cbb: a9 12
    jsr draw_leaves_on_stalk                                          ; 3cbd: 20 d0 3c
    lda #$e0                                                          ; 3cc0: a9 e0
    sta object_z_order + objectid_leaf1                               ; 3cc2: 8d c6 38
    sta object_z_order + objectid_leaf2                               ; 3cc5: 8d c7 38
    lda #$ff                                                          ; 3cc8: a9 ff
    sta object_direction + objectid_leaf2                             ; 3cca: 8d c3 09
plant_is_growing_local1
    jmp plant_is_growing_or_poisoned                                  ; 3ccd: 4c b6 3d

draw_leaves_on_stalk
    sta stalk_cell_y_max                                              ; 3cd0: 8d 09 3d
    sty stalk_cell_y_min                                              ; 3cd3: 84 70
    sec                                                               ; 3cd5: 38
    sbc stalk_cell_y_min                                              ; 3cd6: e5 70
    bmi return1                                                       ; 3cd8: 30 2d
    beq return1                                                       ; 3cda: f0 2b
draw_leaves_loop
    ldx #$14                                                          ; 3cdc: a2 14
    iny                                                               ; 3cde: c8
    lda draw_leaf_sprite                                              ; 3cdf: ad 08 3d
    jsr draw_sprite_a_at_cell_xy                                      ; 3ce2: 20 4c 1f
    ldx #objectid_leaf1                                               ; 3ce5: a2 04
    jsr set_object_position_from_current_sprite_position              ; 3ce7: 20 6d 1f
    ldx #$15                                                          ; 3cea: a2 15
    lda #$ff                                                          ; 3cec: a9 ff
    sta temp_sprite_x_offset                                          ; 3cee: 85 3a
    iny                                                               ; 3cf0: c8
    iny                                                               ; 3cf1: c8
    lda #$ff                                                          ; 3cf2: a9 ff
    sta sprite_reflect_flag                                           ; 3cf4: 85 1d
    lda draw_leaf_sprite                                              ; 3cf6: ad 08 3d
    jsr draw_sprite_a_at_cell_xy                                      ; 3cf9: 20 4c 1f
    ldx #objectid_leaf2                                               ; 3cfc: a2 05
    jsr set_object_position_from_current_sprite_position              ; 3cfe: 20 6d 1f
    iny                                                               ; 3d01: c8
    cpy stalk_cell_y_max                                              ; 3d02: cc 09 3d
    bcc draw_leaves_loop                                              ; 3d05: 90 d5
return1
    rts                                                               ; 3d07: 60

draw_leaf_sprite
    !byte 0                                                           ; 3d08: 00
stalk_cell_y_max
    !byte 0                                                           ; 3d09: 00

plant_is_growing_local2
    jmp plant_is_growing_or_poisoned                                  ; 3d0a: 4c b6 3d

update_room_2
    lda save_game_level_k_plant_growth_timer                          ; 3d0d: ad 34 0a
    bne check_plant_timer                                             ; 3d10: d0 51
    lda desired_room_index                                            ; 3d12: a5 30
    cmp #2                                                            ; 3d14: c9 02
    bne plant_is_growing_local2                                       ; 3d16: d0 f2
    lda developer_flags                                               ; 3d18: ad 03 11
    bpl developer_mode_inactive2                                      ; 3d1b: 10 0e
; in developer mode 'G' grows the plant, and 'P' poisons it
    ldx #inkey_key_g                                                  ; 3d1d: a2 ac
    jsr negative_inkey                                                ; 3d1f: 20 cc 3a
    bne grow_plant                                                    ; 3d22: d0 24
    ldx #inkey_key_p                                                  ; 3d24: a2 c8
    jsr negative_inkey                                                ; 3d26: 20 cc 3a
    bne poison_plant                                                  ; 3d29: d0 27
developer_mode_inactive2
    lda object_spriteid + objectid_bottle_pour                        ; 3d2b: ad aa 09
    cmp #spriteid_splash                                              ; 3d2e: c9 d9
    bne plant_is_growing_local2                                       ; 3d30: d0 d8
    ldx #objectid_bottle_pour                                         ; 3d32: a2 02
    jsr find_left_and_right_of_object                                 ; 3d34: 20 34 24
    lda object_left_cell_x                                            ; 3d37: a5 78
    cmp #$15                                                          ; 3d39: c9 15
    bcs plant_is_growing_local2                                       ; 3d3b: b0 cd
    lda object_right_cell_x                                           ; 3d3d: a5 79
    cmp #$14                                                          ; 3d3f: c9 14
    bcc plant_is_growing_local2                                       ; 3d41: 90 c7
    lda save_game_level_k_poison_in_bottle_flag                       ; 3d43: ad 36 0a
    bne poison_plant                                                  ; 3d46: d0 0a
grow_plant
    lda save_game_level_k_plant_top_y                                 ; 3d48: ad 33 0a
    cmp #$10                                                          ; 3d4b: c9 10
    beq plant_is_growing_or_poisoned                                  ; 3d4d: f0 67
    jmp check_plant_timer                                             ; 3d4f: 4c 63 3d

poison_plant
    lda save_game_level_k_plant_top_y                                 ; 3d52: ad 33 0a
    cmp #$10                                                          ; 3d55: c9 10
    bne plant_is_growing_or_poisoned                                  ; 3d57: d0 5d
    lda #$90                                                          ; 3d59: a9 90
    sta save_game_level_k_plant_top_y                                 ; 3d5b: 8d 33 0a
    lda #$80                                                          ; 3d5e: a9 80
    sta save_game_level_k_plant_growth_timer                          ; 3d60: 8d 34 0a
check_plant_timer
    lda save_game_level_k_plant_growth_timer                          ; 3d63: ad 34 0a
    bmi plant_is_poisoned                                             ; 3d66: 30 25
    lda save_game_level_k_plant_growth_timer                          ; 3d68: ad 34 0a
    cmp #$0f                                                          ; 3d6b: c9 0f
    bcc increment_growth                                              ; 3d6d: 90 04
    cmp #$15                                                          ; 3d6f: c9 15
    bcs finished_growing                                              ; 3d71: b0 09
increment_growth
    clc                                                               ; 3d73: 18
    adc #1                                                            ; 3d74: 69 01
    sta save_game_level_k_plant_growth_timer                          ; 3d76: 8d 34 0a
    jmp plant_is_growing_or_poisoned                                  ; 3d79: 4c b6 3d

finished_growing
    lda #0                                                            ; 3d7c: a9 00
    sta save_game_level_k_plant_growth_timer                          ; 3d7e: 8d 34 0a
    lda save_game_level_k_plant_top_y                                 ; 3d81: ad 33 0a
    sec                                                               ; 3d84: 38
    sbc #$20 ; ' '                                                    ; 3d85: e9 20
    sta save_game_level_k_plant_top_y                                 ; 3d87: 8d 33 0a
    jmp plant_is_growing_or_poisoned                                  ; 3d8a: 4c b6 3d

plant_is_poisoned
    lda save_game_level_k_plant_top_y                                 ; 3d8d: ad 33 0a
    cmp #$10                                                          ; 3d90: c9 10
    beq plant_is_growing_or_poisoned                                  ; 3d92: f0 22
    lda save_game_level_k_plant_growth_timer                          ; 3d94: ad 34 0a
    cmp #$8f                                                          ; 3d97: c9 8f
    bcc increment_poisoning_state                                     ; 3d99: 90 04
    cmp #$8f                                                          ; 3d9b: c9 8f
    bcs poison_stage_increases                                        ; 3d9d: b0 09
increment_poisoning_state
    clc                                                               ; 3d9f: 18
    adc #1                                                            ; 3da0: 69 01
    sta save_game_level_k_plant_growth_timer                          ; 3da2: 8d 34 0a
    jmp plant_is_growing_or_poisoned                                  ; 3da5: 4c b6 3d

poison_stage_increases
    lda #$80                                                          ; 3da8: a9 80
    sta save_game_level_k_plant_growth_timer                          ; 3daa: 8d 34 0a
    lda save_game_level_k_plant_top_y                                 ; 3dad: ad 33 0a
    sec                                                               ; 3db0: 38
    sbc #$20 ; ' '                                                    ; 3db1: e9 20
    sta save_game_level_k_plant_top_y                                 ; 3db3: 8d 33 0a
plant_is_growing_or_poisoned
    lda desired_room_index                                            ; 3db6: a5 30
    cmp #2                                                            ; 3db8: c9 02
    bne return2_local                                                 ; 3dba: d0 4b
    ldy #$10                                                          ; 3dbc: a0 10
    lda save_game_level_k_plant_growth_timer                          ; 3dbe: ad 34 0a
    bmi update_stalk_top_object_and_collision_map                     ; 3dc1: 30 1a
    ldy save_game_level_k_plant_top_y                                 ; 3dc3: ac 33 0a
    sec                                                               ; 3dc6: 38
    sbc #4                                                            ; 3dc7: e9 04
    bcc update_stalk_top_object_and_collision_map                     ; 3dc9: 90 12
    asl                                                               ; 3dcb: 0a
    sta temp_stalk_y                                                  ; 3dcc: 85 70
    cmp #$20 ; ' '                                                    ; 3dce: c9 20
    bcc get_y_position_of_stalk                                       ; 3dd0: 90 04
    lda #$20 ; ' '                                                    ; 3dd2: a9 20
    sta temp_stalk_y                                                  ; 3dd4: 85 70
get_y_position_of_stalk
    lda save_game_level_k_plant_top_y                                 ; 3dd6: ad 33 0a
    sec                                                               ; 3dd9: 38
    sbc temp_stalk_y                                                  ; 3dda: e5 70
    tay                                                               ; 3ddc: a8
update_stalk_top_object_and_collision_map
    lda #spriteid_one_pixel_masked_out                                ; 3ddd: a9 00
    sta object_spriteid_old + objectid_top_of_stalk                   ; 3ddf: 8d b6 09
    sta object_spriteid + objectid_top_of_stalk                       ; 3de2: 8d ab 09
    cpy object_y_low + objectid_top_of_stalk                          ; 3de5: cc 7f 09
    beq hide_leaf_objects_when_stalk_is_full                          ; 3de8: f0 20
    sty object_y_low + objectid_top_of_stalk                          ; 3dea: 8c 7f 09
    ldx #$14                                                          ; 3ded: a2 14
    tya                                                               ; 3def: 98
    lsr                                                               ; 3df0: 4a
    lsr                                                               ; 3df1: 4a
    lsr                                                               ; 3df2: 4a
    tay                                                               ; 3df3: a8
    lda #collision_map_rope                                           ; 3df4: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3df6: 20 bb 1e
    dey                                                               ; 3df9: 88
    lda #collision_map_solid_rock                                     ; 3dfa: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3dfc: 20 bb 1e
    lda #spriteid_stalk_top_end_short                                 ; 3dff: a9 cb
    sta object_spriteid + objectid_top_of_stalk                       ; 3e01: 8d ab 09
    jmp hide_leaf_objects_when_stalk_is_full                          ; 3e04: 4c 0a 3e

return2_local
    jmp return2                                                       ; 3e07: 4c cb 3e

hide_leaf_objects_when_stalk_is_full
    lda save_game_level_k_plant_top_y                                 ; 3e0a: ad 33 0a
    cmp #$10                                                          ; 3e0d: c9 10
    bne set_leaf_positions                                            ; 3e0f: d0 11
    lda #spriteid_one_pixel_masked_out                                ; 3e11: a9 00
    sta object_spriteid_old + objectid_leaf1                          ; 3e13: 8d b7 09
    sta object_spriteid_old + objectid_leaf2                          ; 3e16: 8d b8 09
    sta object_spriteid + objectid_leaf1                              ; 3e19: 8d ac 09
    sta object_spriteid + objectid_leaf2                              ; 3e1c: 8d ad 09
    jmp return2                                                       ; 3e1f: 4c cb 3e

set_leaf_positions
    lda save_game_level_k_plant_top_y                                 ; 3e22: ad 33 0a
    sec                                                               ; 3e25: 38
    sbc #$18                                                          ; 3e26: e9 18
    sta object_y_low + objectid_leaf1                                 ; 3e28: 8d 80 09
    lda save_game_level_k_plant_top_y                                 ; 3e2b: ad 33 0a
    sec                                                               ; 3e2e: 38
    sbc #8                                                            ; 3e2f: e9 08
    sta object_y_low + objectid_leaf2                                 ; 3e31: 8d 81 09
    lda save_game_level_k_plant_growth_timer                          ; 3e34: ad 34 0a
    bmi update_plant_wilting                                          ; 3e37: 30 3f
    bne plant_growing                                                 ; 3e39: d0 08
    lda #spriteid_one_pixel_masked_out                                ; 3e3b: a9 00
    sta object_spriteid_old + objectid_leaf1                          ; 3e3d: 8d b7 09
    sta object_spriteid_old + objectid_leaf2                          ; 3e40: 8d b8 09
plant_growing
    lda #spriteid_one_pixel_masked_out                                ; 3e43: a9 00
    sta object_spriteid + objectid_leaf1                              ; 3e45: 8d ac 09
    sta object_spriteid + objectid_leaf2                              ; 3e48: 8d ad 09
    lda save_game_level_k_plant_growth_timer                          ; 3e4b: ad 34 0a
    sec                                                               ; 3e4e: 38
    sbc #$0a                                                          ; 3e4f: e9 0a
    bcc return2_local                                                 ; 3e51: 90 b4
    ldy #3                                                            ; 3e53: a0 03
    cmp #4                                                            ; 3e55: c9 04
    bcs set_leaf2_sprite                                              ; 3e57: b0 01
    tay                                                               ; 3e59: a8
set_leaf2_sprite
    lda growing_leaf_animation,y                                      ; 3e5a: b9 d1 3b
    sta object_spriteid + objectid_leaf2                              ; 3e5d: 8d ad 09
    lda save_game_level_k_plant_growth_timer                          ; 3e60: ad 34 0a
    sec                                                               ; 3e63: 38
    sbc #$12                                                          ; 3e64: e9 12
    bcc return2                                                       ; 3e66: 90 63
    ldy #3                                                            ; 3e68: a0 03
    cmp #4                                                            ; 3e6a: c9 04
    bcs set_leaf1_sprite                                              ; 3e6c: b0 01
    tay                                                               ; 3e6e: a8
set_leaf1_sprite
    lda growing_leaf_animation,y                                      ; 3e6f: b9 d1 3b
    sta object_spriteid + objectid_leaf1                              ; 3e72: 8d ac 09
    jmp return2                                                       ; 3e75: 4c cb 3e

update_plant_wilting
    and #$7f                                                          ; 3e78: 29 7f
    bne set_full_leaf                                                 ; 3e7a: d0 18
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 3e7c: ad 2b 13
    bne set_full_leaf                                                 ; 3e7f: d0 13
; copy to old, so the leaves don't get erased when the objects move
    ldx #objectid_leaf2                                               ; 3e81: a2 05
    jsr copy_object_state_to_old                                      ; 3e83: 20 f7 20
    ldx #objectid_leaf1                                               ; 3e86: a2 04
    jsr copy_object_state_to_old                                      ; 3e88: 20 f7 20
    lda full_leaf                                                     ; 3e8b: ad d4 3b
    sta object_spriteid_old + objectid_leaf1                          ; 3e8e: 8d b7 09
    sta object_spriteid_old + objectid_leaf2                          ; 3e91: 8d b8 09
set_full_leaf
    lda full_leaf                                                     ; 3e94: ad d4 3b
    sta object_spriteid + objectid_leaf1                              ; 3e97: 8d ac 09
    sta object_spriteid + objectid_leaf2                              ; 3e9a: 8d ad 09
    lda save_game_level_k_plant_growth_timer                          ; 3e9d: ad 34 0a
    and #$7f                                                          ; 3ea0: 29 7f
    sec                                                               ; 3ea2: 38
    sbc #4                                                            ; 3ea3: e9 04
    bcc return2                                                       ; 3ea5: 90 24
    ldy #3                                                            ; 3ea7: a0 03
    cmp #4                                                            ; 3ea9: c9 04
    bcs update_leaf2                                                  ; 3eab: b0 01
    tay                                                               ; 3ead: a8
update_leaf2
    lda leaf_wilt_animation,y                                         ; 3eae: b9 d5 3b
    sta object_spriteid + objectid_leaf2                              ; 3eb1: 8d ad 09
    lda save_game_level_k_plant_growth_timer                          ; 3eb4: ad 34 0a
    and #$7f                                                          ; 3eb7: 29 7f
    sec                                                               ; 3eb9: 38
    sbc #$0c                                                          ; 3eba: e9 0c
    bcc return2                                                       ; 3ebc: 90 0d
    ldy #3                                                            ; 3ebe: a0 03
    cmp #4                                                            ; 3ec0: c9 04
    bcs update_leaf1                                                  ; 3ec2: b0 01
    tay                                                               ; 3ec4: a8
update_leaf1
    lda leaf_wilt_animation,y                                         ; 3ec5: b9 d5 3b
    sta object_spriteid + objectid_leaf1                              ; 3ec8: 8d ac 09
return2
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
    jsr draw_top_and_bottom_rows                                      ; 3ece: 20 3a 3b
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
; draw shelf at (37,7)
    ldx #$25 ; '%'                                                    ; 3f1a: a2 25
    ldy #7                                                            ; 3f1c: a0 07
    lda #4                                                            ; 3f1e: a9 04
    sta temp_sprite_y_offset                                          ; 3f20: 85 3b
    lda #$ff                                                          ; 3f22: a9 ff
    sta sprite_reflect_flag                                           ; 3f24: 85 1d
    lda #spriteid_shelf                                               ; 3f26: a9 e5
    jsr draw_sprite_a_at_cell_xy                                      ; 3f28: 20 4c 1f
; draw shelf support at (37,7)
    lda #4                                                            ; 3f2b: a9 04
    sta temp_sprite_y_offset                                          ; 3f2d: 85 3b
    lda #$ff                                                          ; 3f2f: a9 ff
    sta sprite_reflect_flag                                           ; 3f31: 85 1d
    lda #spriteid_shelf_support                                       ; 3f33: a9 e6
    jsr draw_sprite_a_at_cell_xy                                      ; 3f35: 20 4c 1f
; draw full bottle at (34,7)
    ldx #$22 ; '"'                                                    ; 3f38: a2 22
    lda #4                                                            ; 3f3a: a9 04
    sta temp_sprite_x_offset                                          ; 3f3c: 85 3a
    sta temp_sprite_y_offset                                          ; 3f3e: 85 3b
    lda #spriteid_full_bottle                                         ; 3f40: a9 cc
    jsr draw_sprite_a_at_cell_xy                                      ; 3f42: 20 4c 1f
    jsr start_room                                                    ; 3f45: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 3f48: 20 da 12
    and #exit_room_left                                               ; 3f4b: 29 01
    beq room_3_game_update_loop                                       ; 3f4d: f0 f9
    ldx #2                                                            ; 3f4f: a2 02
    ldy current_level                                                 ; 3f51: a4 31
    jmp initialise_level_and_room                                     ; 3f53: 4c 40 11

room_3_update_handler
    lda #3                                                            ; 3f56: a9 03
    sta currently_updating_logic_for_room_index                       ; 3f58: 8d ba 1a
    ldx #3                                                            ; 3f5b: a2 03
    ldy #$0c                                                          ; 3f5d: a0 0c
    lda #objectid_room_3_fire                                         ; 3f5f: a9 04
    jsr update_brazier_and_fire                                       ; 3f61: 20 88 19
    lda #$ff                                                          ; 3f64: a9 ff
    sta drip_is_poison_flag                                           ; 3f66: 8d ec 44
    lda #8                                                            ; 3f69: a9 08
    sta drip_start_frame                                              ; 3f6b: 8d eb 44
    lda #$40 ; '@'                                                    ; 3f6e: a9 40
    sta drip_initial_y                                                ; 3f70: 8d ed 44
    lda #$13                                                          ; 3f73: a9 13
    sta drip_timer_limit                                              ; 3f75: 8d ee 44
    ldx #$10                                                          ; 3f78: a2 10
    ldy #1                                                            ; 3f7a: a0 01
    lda room_3_drip_timer                                             ; 3f7c: ad 75 0a
    jsr update_drip                                                   ; 3f7f: 20 ec 43
    sta room_3_drip_timer                                             ; 3f82: 8d 75 0a
    rts                                                               ; 3f85: 60

dog_death_sound
    lda #0                                                            ; 3f86: a9 00
    ldx #<sound1                                                      ; 3f88: a2 05
    ldy #>sound1                                                      ; 3f8a: a0 45
    jsr play_sound_yx                                                 ; 3f8c: 20 f6 38
    ldx #<sound2                                                      ; 3f8f: a2 fd
    ldy #>sound2                                                      ; 3f91: a0 44
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
    jsr draw_top_and_bottom_rows                                      ; 3f98: 20 3a 3b
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
    jsr draw_top_left_and_right_corners                               ; 3fc9: 20 4e 3b
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3fcc: 20 90 1b
; draw shelf at (3,7) of size (4x1)
    lda #4                                                            ; 3fcf: a9 04
    sta width_in_cells                                                ; 3fd1: 85 3c
    lda #1                                                            ; 3fd3: a9 01
    sta height_in_cells                                               ; 3fd5: 85 3d
    lda #spriteid_shelf                                               ; 3fd7: a9 e5
    ldx #3                                                            ; 3fd9: a2 03
    ldy #7                                                            ; 3fdb: a0 07
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3fdd: 20 57 1f
; draw shelf support at (3,7)
    lda #spriteid_shelf_support                                       ; 3fe0: a9 e6
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

dog_head_animations
    !byte 0                                                           ; 4006: 00
dog_head_dead_animation
    !byte 0, 0, 0                                                     ; 4007: 00 00 00
    !byte $80                                                         ; 400a: 80
dog_head_drinking_animation
    !byte spriteid_dog_head                                           ; 400b: ea
    !byte $18, $ff                                                    ; 400c: 18 ff
    !byte spriteid_dog_head                                           ; 400e: ea
    !byte $18, $ff                                                    ; 400f: 18 ff
    !byte spriteid_dog_head                                           ; 4011: ea
    !byte $18, $ff                                                    ; 4012: 18 ff
    !byte spriteid_dog_head                                           ; 4014: ea
    !byte $18, $ff                                                    ; 4015: 18 ff
    !byte spriteid_dog_head_licking                                   ; 4017: eb
    !byte $18,   0                                                    ; 4018: 18 00
    !byte spriteid_dog_head_licking                                   ; 401a: eb
    !byte $19,   0                                                    ; 401b: 19 00
    !byte spriteid_dog_head_licking                                   ; 401d: eb
    !byte $19, $ff                                                    ; 401e: 19 ff
    !byte $80                                                         ; 4020: 80
dog_head_push_animation
    !byte spriteid_dog_head                                           ; 4021: ea
    !byte $19, $fe                                                    ; 4022: 19 fe
    !byte spriteid_dog_head                                           ; 4024: ea
    !byte $19, $fe                                                    ; 4025: 19 fe
    !byte spriteid_dog_head                                           ; 4027: ea
    !byte $19, $fe                                                    ; 4028: 19 fe
    !byte spriteid_dog_head                                           ; 402a: ea
    !byte $19, $fe                                                    ; 402b: 19 fe
    !byte spriteid_dog_head                                           ; 402d: ea
    !byte $19, $fe                                                    ; 402e: 19 fe
    !byte spriteid_dog_head                                           ; 4030: ea
    !byte $19, $fe                                                    ; 4031: 19 fe
    !byte spriteid_dog_head                                           ; 4033: ea
    !byte $19, $fe                                                    ; 4034: 19 fe
    !byte spriteid_dog_head                                           ; 4036: ea
    !byte $19, $fe                                                    ; 4037: 19 fe
    !byte spriteid_dog_head                                           ; 4039: ea
    !byte $19, $fe                                                    ; 403a: 19 fe
    !byte spriteid_dog_head                                           ; 403c: ea
    !byte $19, $fe                                                    ; 403d: 19 fe
    !byte $80                                                         ; 403f: 80
dog_head_stunned_animation
    !byte spriteid_dog_head                                           ; 4040: ea
    !byte $18, $fe                                                    ; 4041: 18 fe
    !byte $80                                                         ; 4043: 80

; check for first update in room (branch if not)
update_dog_puzzle
    lda update_room_first_update_flag                                 ; 4044: ad 2b 13
    beq update_dog_head_animation                                     ; 4047: f0 64
; check for level change (branch if not)
    lda current_level                                                 ; 4049: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 404b: c5 51
    beq initialise_dog_puzzle                                         ; 404d: f0 18
    lda save_game_level_k_poison_dog_animation_step                   ; 404f: ad 38 0a
    beq set_dog_head_drinking_animation                               ; 4052: f0 0b
    lda #dog_head_dead_animation - dog_head_animations                ; 4054: a9 01
    sta save_game_level_k_dog_animation                               ; 4056: 8d 37 0a
    sta dog_animation_step                                            ; 4059: 8d 76 0a
    jmp initialise_dog_puzzle                                         ; 405c: 4c 67 40

set_dog_head_drinking_animation
    lda #dog_head_drinking_animation - dog_head_animations            ; 405f: a9 05
    sta save_game_level_k_dog_animation                               ; 4061: 8d 37 0a
    sta dog_animation_step                                            ; 4064: 8d 76 0a
initialise_dog_puzzle
    lda desired_room_index                                            ; 4067: a5 30
    cmp #0                                                            ; 4069: c9 00
    bne set_dog_head_object_local                                     ; 406b: d0 3d
    ldx #<envelope1                                                   ; 406d: a2 ef
    ldy #>envelope1                                                   ; 406f: a0 44
    jsr define_envelope                                               ; 4071: 20 5e 39
    lda #4                                                            ; 4074: a9 04
    sta width_in_cells                                                ; 4076: 85 3c
    lda #1                                                            ; 4078: a9 01
    sta height_in_cells                                               ; 407a: 85 3d
    lda #collision_map_solid_rock                                     ; 407c: a9 03
    sta value_to_write_to_collision_map                               ; 407e: 85 3e
    ldx #$0e                                                          ; 4080: a2 0e
    ldy #$0e                                                          ; 4082: a0 0e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 4084: 20 44 1e
    lda #$78 ; 'x'                                                    ; 4087: a9 78
    sta object_y_low + objectid_leaf2                                 ; 4089: 8d 81 09
    lda #$e0                                                          ; 408c: a9 e0
    sta object_z_order + objectid_dog_body                            ; 408e: 8d c7 38
    lda #$e7                                                          ; 4091: a9 e7
    sta object_erase_type + objectid_dog_head                         ; 4093: 8d b2 38
    lda #$c0                                                          ; 4096: a9 c0
    sta object_z_order + objectid_dog_head                            ; 4098: 8d c8 38
    lda #$8e                                                          ; 409b: a9 8e
    sta object_x_low + objectid_dog_bowl                              ; 409d: 8d 57 09
    lda #$78 ; 'x'                                                    ; 40a0: a9 78
    sta object_y_low + objectid_dog_bowl                              ; 40a2: 8d 83 09
    lda #spriteid_dog_bowl2                                           ; 40a5: a9 ed
    sta object_spriteid + objectid_dog_bowl                           ; 40a7: 8d af 09
set_dog_head_object_local
    jmp set_dog_head_object                                           ; 40aa: 4c 3e 41

update_dog_head_animation
    lda dog_animation_step                                            ; 40ad: ad 76 0a
    clc                                                               ; 40b0: 18
    adc #3                                                            ; 40b1: 69 03
    tay                                                               ; 40b3: a8
    lda dog_head_animations,y                                         ; 40b4: b9 06 40
    cmp #$80                                                          ; 40b7: c9 80
    bne got_dog_animation_step_in_y                                   ; 40b9: d0 03
    ldy save_game_level_k_dog_animation                               ; 40bb: ac 37 0a
got_dog_animation_step_in_y
    lda save_game_level_k_dog_animation                               ; 40be: ad 37 0a
    cmp #dog_head_dead_animation - dog_head_animations                ; 40c1: c9 01
    beq set_dog_animation_step_local                                  ; 40c3: f0 50
    lda save_game_level_k_poison_dog_animation_step                   ; 40c5: ad 38 0a
    bne update_dog_poisoning_animation                                ; 40c8: d0 23
    lda desired_room_index                                            ; 40ca: a5 30
    cmp #0                                                            ; 40cc: c9 00
    bne check_if_dog_is_dying                                         ; 40ce: d0 27
    lda object_spriteid + objectid_bottle_pour                        ; 40d0: ad aa 09
    cmp #spriteid_splash                                              ; 40d3: c9 d9
    bne check_if_dog_is_dying                                         ; 40d5: d0 20
    lda save_game_level_k_poison_in_bottle_flag                       ; 40d7: ad 36 0a
    beq check_if_dog_is_dying                                         ; 40da: f0 1b
; check for bottle and dog bowl collision
    ldx #objectid_bottle_pour                                         ; 40dc: a2 02
    sty remember_y                                                    ; 40de: 8c 9e 41
    ldy #objectid_dog_bowl                                            ; 40e1: a0 07
    jsr test_for_collision_between_objects_x_and_y                    ; 40e3: 20 e2 28
    ldy remember_y                                                    ; 40e6: ac 9e 41
    ora #0                                                            ; 40e9: 09 00
    beq check_if_dog_is_dying                                         ; 40eb: f0 0a
update_dog_poisoning_animation
    lda save_game_level_k_poison_dog_animation_step                   ; 40ed: ad 38 0a
    cmp #$10                                                          ; 40f0: c9 10
    bcs check_if_dog_is_dying                                         ; 40f2: b0 03
    inc save_game_level_k_poison_dog_animation_step                   ; 40f4: ee 38 0a
check_if_dog_is_dying
    lda save_game_level_k_poison_dog_animation_step                   ; 40f7: ad 38 0a
    cmp #8                                                            ; 40fa: c9 08
    bcc check_for_player_colliding_with_dog                           ; 40fc: 90 1a
    ldy #dog_head_stunned_animation - dog_head_animations             ; 40fe: a0 3a
    sty save_game_level_k_dog_animation                               ; 4100: 8c 37 0a
    cmp #$10                                                          ; 4103: c9 10
    bcc set_dog_animation_step                                        ; 4105: 90 34
    lda desired_room_index                                            ; 4107: a5 30
    cmp #0                                                            ; 4109: c9 00
    bne set_dog_head_dead_animation                                   ; 410b: d0 03
    jsr dog_death_sound                                               ; 410d: 20 86 3f
set_dog_head_dead_animation
    ldy #dog_head_dead_animation - dog_head_animations                ; 4110: a0 01
    sty save_game_level_k_dog_animation                               ; 4112: 8c 37 0a
set_dog_animation_step_local
    jmp set_dog_animation_step                                        ; 4115: 4c 3b 41

check_for_player_colliding_with_dog
    lda desired_room_index                                            ; 4118: a5 30
    cmp #0                                                            ; 411a: c9 00
    bne set_dog_animation_step                                        ; 411c: d0 1d
    lda #$f8                                                          ; 411e: a9 f8
    sta temp_top_offset                                               ; 4120: 8d 50 25
    ldx #objectid_dog_head                                            ; 4123: a2 06
    sty remember_y                                                    ; 4125: 8c 9e 41
    ldy #objectid_player                                              ; 4128: a0 00
    jsr test_for_collision_between_objects_x_and_y                    ; 412a: 20 e2 28
    ldy remember_y                                                    ; 412d: ac 9e 41
    ora #0                                                            ; 4130: 09 00
    beq set_dog_animation_step                                        ; 4132: f0 07
    lda #6                                                            ; 4134: a9 06
    sta player_wall_collision_reaction_speed                          ; 4136: 8d 33 24
    ldy #dog_head_push_animation - dog_head_animations                ; 4139: a0 1b
set_dog_animation_step
    sty dog_animation_step                                            ; 413b: 8c 76 0a
set_dog_head_object
    lda desired_room_index                                            ; 413e: a5 30
    cmp #0                                                            ; 4140: c9 00
    bne return3                                                       ; 4142: d0 59
    ldy dog_animation_step                                            ; 4144: ac 76 0a
    lda dog_head_animations,y                                         ; 4147: b9 06 40
    sta object_spriteid + objectid_dog_head                           ; 414a: 8d ae 09
    iny                                                               ; 414d: c8
    lda dog_head_animations,y                                         ; 414e: b9 06 40
    clc                                                               ; 4151: 18
    adc #$74 ; 't'                                                    ; 4152: 69 74
    sta object_x_low + objectid_dog_head                              ; 4154: 8d 56 09
    iny                                                               ; 4157: c8
    lda dog_head_animations,y                                         ; 4158: b9 06 40
    clc                                                               ; 415b: 18
    adc #$78 ; 'x'                                                    ; 415c: 69 78
    sta object_y_low + objectid_dog_head                              ; 415e: 8d 82 09
    lda #spriteid_dog_body                                            ; 4161: a9 e9
    sta object_spriteid + objectid_dog_body                           ; 4163: 8d ad 09
    lda #$74 ; 't'                                                    ; 4166: a9 74
    sta object_x_low + objectid_dog_body                              ; 4168: 8d 55 09
    lda save_game_level_k_dog_animation                               ; 416b: ad 37 0a
    cmp #dog_head_dead_animation - dog_head_animations                ; 416e: c9 01
    beq dog_is_dead                                                   ; 4170: f0 14
    cmp #dog_head_stunned_animation - dog_head_animations             ; 4172: c9 3a
    bne return3                                                       ; 4174: d0 27
; set solid rock collision
    ldx #$11                                                          ; 4176: a2 11
    ldy #$0c                                                          ; 4178: a0 0c
    lda #collision_map_solid_rock                                     ; 417a: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 417c: 20 bb 1e
    iny                                                               ; 417f: c8
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4180: 20 bb 1e
    jmp return3                                                       ; 4183: 4c 9d 41

dog_is_dead
    ldx #$11                                                          ; 4186: a2 11
    ldy #$0c                                                          ; 4188: a0 0c
    lda #collision_map_none                                           ; 418a: a9 00
    jsr write_a_single_value_to_cell_in_collision_map                 ; 418c: 20 bb 1e
    iny                                                               ; 418f: c8
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4190: 20 bb 1e
    lda #spriteid_dog_dead                                            ; 4193: a9 e8
    sta object_spriteid + objectid_dog_body                           ; 4195: 8d ad 09
    lda #$70 ; 'p'                                                    ; 4198: a9 70
    sta object_x_low + objectid_dog_body                              ; 419a: 8d 55 09
return3
    rts                                                               ; 419d: 60

remember_y
    !byte 0                                                           ; 419e: 00

room_0_update_handler
    lda #0                                                            ; 419f: a9 00
    sta currently_updating_logic_for_room_index                       ; 41a1: 8d ba 1a
    ldx #5                                                            ; 41a4: a2 05
    ldy #7                                                            ; 41a6: a0 07
    lda #objectid_spell                                               ; 41a8: a9 04
    jsr update_level_completion                                       ; 41aa: 20 10 1a
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 41ad: ad 2b 13
    beq room_0_not_first_update                                       ; 41b0: f0 68
; initialise room 0
    lda #spriteid_empty_bottle_menu_item                              ; 41b2: a9 d6
    sta toolbar_collectable_spriteids+1                               ; 41b4: 8d e9 2e
    lda #spriteid_empty_bottle_held                                   ; 41b7: a9 d3
    sta collectable_spriteids+1                                       ; 41b9: 8d ee 2e
    lda #spriteid_emptying_bottle                                     ; 41bc: a9 d5
    sta collectable_being_used_spriteids + 1                          ; 41be: 8d f3 2e
    lda #spriteid_full_bottle_menu_item                               ; 41c1: a9 d7
    sta toolbar_collectable_spriteids+2                               ; 41c3: 8d ea 2e
    lda #spriteid_full_bottle_held                                    ; 41c6: a9 d4
    sta collectable_spriteids+2                                       ; 41c8: 8d ef 2e
    lda #spriteid_emptying_bottle                                     ; 41cb: a9 d5
    sta collectable_being_used_spriteids + 2                          ; 41cd: 8d f4 2e
; check for level change (branch if not)
    lda current_level                                                 ; 41d0: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 41d2: c5 51
    beq check_for_room_change                                         ; 41d4: f0 05
    lda #0                                                            ; 41d6: a9 00
    sta bottle_pour_animation_step                                    ; 41d8: 8d 73 0a
check_for_room_change
    lda desired_room_index                                            ; 41db: a5 30
    cmp previous_room_index                                           ; 41dd: c5 50
    beq initialise_bottle                                             ; 41df: f0 05
    lda #0                                                            ; 41e1: a9 00
    sta bottle_pour_animation_step                                    ; 41e3: 8d 73 0a
initialise_bottle
    lda #spriteid_erase_2                                             ; 41e6: a9 e4
    sta object_erase_type + objectid_bottle_pour                      ; 41e8: 8d ae 38
    lda #$60 ; '`'                                                    ; 41eb: a9 60
    sta object_z_order + objectid_bottle_pour                         ; 41ed: 8d c4 38
    lda desired_room_index                                            ; 41f0: a5 30
    cmp #0                                                            ; 41f2: c9 00
    bne update_pouring_object_local                                   ; 41f4: d0 21
; initialise room 0
    lda save_game_level_k_got_bottle_flag                             ; 41f6: ad 35 0a
    bne update_pouring_object_local                                   ; 41f9: d0 1c
    ldx #$23 ; '#'                                                    ; 41fb: a2 23
    lda #4                                                            ; 41fd: a9 04
    sta temp_sprite_x_offset                                          ; 41ff: 85 3a
    ldy #$0f                                                          ; 4201: a0 0f
    lda #3                                                            ; 4203: a9 03
    jsr set_object_position_from_cell_xy                              ; 4205: 20 5d 1f
    lda #spriteid_empty_bottle                                        ; 4208: a9 d2
    sta object_spriteid + objectid_empty_bottle                       ; 420a: 8d ab 09
    lda #spriteid_erase_1                                             ; 420d: a9 d1
    sta object_erase_type + objectid_drip                             ; 420f: 8d af 38
    lda #$c0                                                          ; 4212: a9 c0
    sta object_z_order + objectid_drip                                ; 4214: 8d c5 38
update_pouring_object_local
    jmp update_pouring_object                                         ; 4217: 4c ae 42

room_0_not_first_update
    lda save_game_level_k_got_bottle_flag                             ; 421a: ad 35 0a
    bne update_in_room_0_with_bottle                                  ; 421d: d0 26
    lda desired_room_index                                            ; 421f: a5 30
    cmp #0                                                            ; 4221: c9 00
    bne return4_local                                                 ; 4223: d0 1d
; update bottle in room 0
    lda save_game_level_k_got_bottle_flag                             ; 4225: ad 35 0a
    bne update_pouring_object_local                                   ; 4228: d0 ed
    ldx #objectid_old_player                                          ; 422a: a2 0b
    ldy #objectid_empty_bottle                                        ; 422c: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 422e: 20 e2 28
    beq return4_local                                                 ; 4231: f0 0f
    lda #spriteid_one_pixel_masked_out                                ; 4233: a9 00
    sta object_spriteid + objectid_empty_bottle                       ; 4235: 8d ab 09
    lda #1                                                            ; 4238: a9 01
    sta save_game_level_k_got_bottle_flag                             ; 423a: 8d 35 0a
    lda #spriteid_empty_bottle_menu_item                              ; 423d: a9 d6
    jsr find_or_create_menu_slot_for_A                                ; 423f: 20 bd 2b
return4_local
    jmp return4                                                       ; 4242: 4c 27 43

; check if already pouring
update_in_room_0_with_bottle
    lda bottle_pour_animation_step                                    ; 4245: ad 73 0a
    bne pour_in_progress                                              ; 4248: d0 56
; check if starting to pour
    lda #spriteid_full_bottle_menu_item                               ; 424a: a9 d7
    cmp player_using_object_spriteid                                  ; 424c: cd b6 2e
    bne update_pouring_object                                         ; 424f: d0 5d
; set empty bottle
    lda #spriteid_empty_bottle_menu_item                              ; 4251: a9 d6
    sta player_held_object_spriteid                                   ; 4253: 85 52
    sta player_using_object_spriteid                                  ; 4255: 8d b6 2e
; set empty bottle in toolbar
    ldx menu_index_for_extra_items                                    ; 4258: ae 6e 29
    sta desired_menu_slots,x                                          ; 425b: 9d 5c 29
; start pouring animation
    lda #1                                                            ; 425e: a9 01
    sta bottle_pour_animation_step                                    ; 4260: 8d 73 0a
    lda #1                                                            ; 4263: a9 01                   ; redundant instruction
    sta save_game_level_k_got_bottle_flag                             ; 4265: 8d 35 0a
; move player accessory in X based on player direction
    lda #4                                                            ; 4268: a9 04
    ldx object_direction                                              ; 426a: ae be 09
    bpl sign_extend_a_to_ax                                           ; 426d: 10 05
    eor #$ff                                                          ; 426f: 49 ff
    clc                                                               ; 4271: 18
    adc #1                                                            ; 4272: 69 01
sign_extend_a_to_ax
    ldx #0                                                            ; 4274: a2 00
    ora #0                                                            ; 4276: 09 00
    bpl add_to_bottle_accessory_x                                     ; 4278: 10 01
    dex                                                               ; 427a: ca
add_to_bottle_accessory_x
    clc                                                               ; 427b: 18
    adc object_x_low + objectid_player_accessory                      ; 427c: 6d 51 09
    sta bottle_pour_x_low                                             ; 427f: 8d 70 0a
    txa                                                               ; 4282: 8a
    adc object_x_high + objectid_player_accessory                     ; 4283: 6d 67 09
    sta bottle_pour_x_high                                            ; 4286: 8d 71 0a
; move accessory up four pixels. X is irrelevant.
    ldx #0                                                            ; 4289: a2 00                   ; redundant instruction
    lda #$fc                                                          ; 428b: a9 fc
    bpl move_bottle_accessory_up_in_y                                 ; 428d: 10 01                   ; redundant instruction
    dex                                                               ; 428f: ca                      ; redundant instruction
move_bottle_accessory_up_in_y
    clc                                                               ; 4290: 18
    adc object_y_low + objectid_player_accessory                      ; 4291: 6d 7d 09
    sta bottle_pour_y                                                 ; 4294: 8d 72 0a
    lda object_direction                                              ; 4297: ad be 09
    sta bottle_pour_direction                                         ; 429a: 8d 74 0a
    jmp update_pouring_object                                         ; 429d: 4c ae 42

pour_in_progress
    inc bottle_pour_animation_step                                    ; 42a0: ee 73 0a
    beq update_pouring_object                                         ; 42a3: f0 09
    lda bottle_pour_y                                                 ; 42a5: ad 72 0a
    clc                                                               ; 42a8: 18
    adc #8                                                            ; 42a9: 69 08
    sta bottle_pour_y                                                 ; 42ab: 8d 72 0a
update_pouring_object
    lda #spriteid_one_pixel_masked_out                                ; 42ae: a9 00
    sta object_spriteid + objectid_bottle_pour                        ; 42b0: 8d aa 09
    ldx bottle_pour_animation_step                                    ; 42b3: ae 73 0a
    beq return4_local                                                 ; 42b6: f0 8a
    lda bottle_pour_x_low                                             ; 42b8: ad 70 0a
    sta object_x_low + objectid_bottle_pour                           ; 42bb: 8d 52 09
    lda bottle_pour_x_high                                            ; 42be: ad 71 0a
    sta object_x_high + objectid_bottle_pour                          ; 42c1: 8d 68 09
    lda bottle_pour_direction                                         ; 42c4: ad 74 0a
    sta object_direction + objectid_bottle_pour                       ; 42c7: 8d c0 09
    lda bottle_pour_y                                                 ; 42ca: ad 72 0a
    sta object_y_low + objectid_bottle_pour                           ; 42cd: 8d 7e 09
    lda #spriteid_pour                                                ; 42d0: a9 df
    sta object_spriteid + objectid_bottle_pour                        ; 42d2: 8d aa 09
    cpx #1                                                            ; 42d5: e0 01
    beq check_for_bottle_pouring_offscreen                            ; 42d7: f0 33
    lda #spriteid_splash                                              ; 42d9: a9 d9
    sta object_spriteid + objectid_bottle_pour                        ; 42db: 8d aa 09
    cpx #$ff                                                          ; 42de: e0 ff
    beq check_for_bottle_pouring_offscreen                            ; 42e0: f0 2a
; start droplet
    lda #spriteid_droplet                                             ; 42e2: a9 da
    sta object_spriteid + objectid_bottle_pour                        ; 42e4: 8d aa 09
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 42e7: ad 2b 13
    bne check_for_bottle_pouring_offscreen                            ; 42ea: d0 20
    lda object_spriteid_old + objectid_bottle_pour                    ; 42ec: ad b5 09
    cmp #$da                                                          ; 42ef: c9 da
    bne check_for_bottle_pouring_offscreen                            ; 42f1: d0 19
    lda #1                                                            ; 42f3: a9 01
    sta temp_bottom_offset                                            ; 42f5: 8d 51 25
    lda #2                                                            ; 42f8: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 42fa: 20 94 28
    beq check_for_bottle_pouring_offscreen                            ; 42fd: f0 0d
    lda #$ff                                                          ; 42ff: a9 ff
    sta bottle_pour_animation_step                                    ; 4301: 8d 73 0a
    lda #spriteid_splash                                              ; 4304: a9 d9
    sta object_spriteid + objectid_bottle_pour                        ; 4306: 8d aa 09
    jsr play_landing_sound                                            ; 4309: 20 a9 23
check_for_bottle_pouring_offscreen
    ldx #objectid_bottle_pour                                         ; 430c: a2 02
    jsr find_left_and_right_of_object                                 ; 430e: 20 34 24
    lda object_left_cell_x                                            ; 4311: a5 78
    cmp #game_area_width_cells                                        ; 4313: c9 28
    bcc return4                                                       ; 4315: 90 10
    ora #0                                                            ; 4317: 09 00
    bpl stop_bottle_pour_animation                                    ; 4319: 10 04
    lda object_right_cell_x                                           ; 431b: a5 79
    bpl return4                                                       ; 431d: 10 08
stop_bottle_pour_animation
    lda #0                                                            ; 431f: a9 00
    sta bottle_pour_animation_step                                    ; 4321: 8d 73 0a
    sta object_spriteid + objectid_bottle_pour                        ; 4324: 8d aa 09
return4
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
    jsr draw_top_and_bottom_rows                                      ; 432a: 20 3a 3b
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
    jsr draw_top_left_and_right_corners                               ; 4367: 20 4e 3b
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 436a: 20 90 1b
; draw rope at (26,2) length 9
    ldx #$1a                                                          ; 436d: a2 1a
    ldy #2                                                            ; 436f: a0 02
    lda #9                                                            ; 4371: a9 09
    jsr draw_rope                                                     ; 4373: 20 b9 1d
    lda #sprite_op_flags_erase_to_fg_colour                           ; 4376: a9 04
    sta sprite_op_flags                                               ; 4378: 85 15
    jsr sprite_op                                                     ; 437a: 20 8d 13
; draw bucket at (26,10)
    ldy #$0a                                                          ; 437d: a0 0a
    lda #spriteid_bucket                                              ; 437f: a9 d8
    jsr draw_sprite_a_at_cell_xy                                      ; 4381: 20 4c 1f
    jsr start_room                                                    ; 4384: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 4387: 20 da 12
    sta room_exit_direction                                           ; 438a: 85 70
    and #exit_room_left                                               ; 438c: 29 01
    beq try_right_exit                                                ; 438e: f0 07
; left from room 1 is room 0
    ldx #0                                                            ; 4390: a2 00
    ldy current_level                                                 ; 4392: a4 31
    jmp initialise_level_and_room                                     ; 4394: 4c 40 11

try_right_exit
    lda room_exit_direction                                           ; 4397: a5 70
    and #exit_room_right                                              ; 4399: 29 04
    beq room_1_game_update_loop                                       ; 439b: f0 ea
; right from room 1 is room 2
    ldx #2                                                            ; 439d: a2 02
    ldy current_level                                                 ; 439f: a4 31
    jmp initialise_level_and_room                                     ; 43a1: 4c 40 11

room_1_update_handler
    lda #1                                                            ; 43a4: a9 01
    sta currently_updating_logic_for_room_index                       ; 43a6: 8d ba 1a
    ldx #3                                                            ; 43a9: a2 03
    ldy #$0c                                                          ; 43ab: a0 0c
    lda #objectid_room_1_fire1                                        ; 43ad: a9 04
    jsr update_brazier_and_fire                                       ; 43af: 20 88 19
    ldx #$25 ; '%'                                                    ; 43b2: a2 25
    lda #objectid_room_1_fire2                                        ; 43b4: a9 05
    jsr update_brazier_and_fire                                       ; 43b6: 20 88 19
    lda #0                                                            ; 43b9: a9 00
    sta drip_is_poison_flag                                           ; 43bb: 8d ec 44
    lda #$10                                                          ; 43be: a9 10
    sta drip_start_frame                                              ; 43c0: 8d eb 44
    lda #$68 ; 'h'                                                    ; 43c3: a9 68
    sta drip_initial_y                                                ; 43c5: 8d ed 44
; long-winded way of saying: 'lda #$1d'
    lda #$10                                                          ; 43c8: a9 10
    clc                                                               ; 43ca: 18
    adc #5                                                            ; 43cb: 69 05
    clc                                                               ; 43cd: 18
    adc #$16                                                          ; 43ce: 69 16
    sec                                                               ; 43d0: 38
    sbc #$0d                                                          ; 43d1: e9 0d
    sec                                                               ; 43d3: 38
    sbc #1                                                            ; 43d4: e9 01
    sta drip_timer_limit                                              ; 43d6: 8d ee 44
    ldx #$d0                                                          ; 43d9: a2 d0
    ldy #0                                                            ; 43db: a0 00
    lda room_1_drip_timer                                             ; 43dd: ad 6f 0a
    jsr update_drip                                                   ; 43e0: 20 ec 43
    sta room_1_drip_timer                                             ; 43e3: 8d 6f 0a
    rts                                                               ; 43e6: 60

droplet_animation
    !byte spriteid_droplet4                                           ; 43e7: de
    !byte spriteid_droplet3                                           ; 43e8: dd
    !byte spriteid_droplet2                                           ; 43e9: dc
    !byte spriteid_droplet1                                           ; 43ea: db
droplet_full
    !byte spriteid_droplet                                            ; 43eb: da

update_drip
    sta temp_drip_timer                                               ; 43ec: 8d ea 44
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 43ef: ad 2b 13
    beq increment_drip_timer                                          ; 43f2: f0 28
; check for level change (branch if not)
    lda current_level                                                 ; 43f4: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 43f6: c5 51
    beq new_room                                                      ; 43f8: f0 05
; initialise drip timer for new level
    lda #0                                                            ; 43fa: a9 00
    sta temp_drip_timer                                               ; 43fc: 8d ea 44
; check_for_being_in_same_room_as_drip
new_room
    lda desired_room_index                                            ; 43ff: a5 30
    cmp currently_updating_logic_for_room_index                       ; 4401: cd ba 1a
    bne update_drip_animation_local                                   ; 4404: d0 10
; initialise drip
    lda #spriteid_erase_1                                             ; 4406: a9 d1
    sta object_erase_type + objectid_drip                             ; 4408: 8d af 38
    lda #$40 ; '@'                                                    ; 440b: a9 40
    sta object_z_order + objectid_drip                                ; 440d: 8d c5 38
    stx object_x_low + objectid_drip                                  ; 4410: 8e 53 09
    sty object_x_high + objectid_drip                                 ; 4413: 8c 69 09
update_drip_animation_local
    jmp update_drip_animation                                         ; 4416: 4c 2f 44

return_drip_timer_local
    jmp return_drip_timer                                             ; 4419: 4c e6 44

increment_drip_timer
    inc temp_drip_timer                                               ; 441c: ee ea 44
    lda drip_timer_limit                                              ; 441f: ad ee 44
    clc                                                               ; 4422: 18
    adc #1                                                            ; 4423: 69 01
    cmp temp_drip_timer                                               ; 4425: cd ea 44
    bne update_drip_animation                                         ; 4428: d0 05
    lda #0                                                            ; 442a: a9 00
    sta temp_drip_timer                                               ; 442c: 8d ea 44
update_drip_animation
    lda desired_room_index                                            ; 442f: a5 30
    cmp currently_updating_logic_for_room_index                       ; 4431: cd ba 1a
    bne return_drip_timer_local                                       ; 4434: d0 e3
    lda #spriteid_one_pixel_masked_out                                ; 4436: a9 00
    sta object_spriteid + objectid_drip                               ; 4438: 8d ab 09
    lda drip_timer_limit                                              ; 443b: ad ee 44
    clc                                                               ; 443e: 18
    adc #1                                                            ; 443f: 69 01
    sta temp_y                                                        ; 4441: 85 70
    lda temp_drip_timer                                               ; 4443: ad ea 44
    cmp temp_y                                                        ; 4446: c5 70
    bcs return_drip_timer_local                                       ; 4448: b0 cf
    sec                                                               ; 444a: 38
    sbc drip_start_frame                                              ; 444b: ed eb 44
    bcc return_drip_timer_local                                       ; 444e: 90 c9
    cmp #5                                                            ; 4450: c9 05
    bcs drip_is_falling                                               ; 4452: b0 10
    tay                                                               ; 4454: a8
    lda droplet_animation,y                                           ; 4455: b9 e7 43
    sta object_spriteid + objectid_drip                               ; 4458: 8d ab 09
    lda drip_initial_y                                                ; 445b: ad ed 44
    sta object_y_low + objectid_drip                                  ; 445e: 8d 7f 09
    jmp return_drip_timer                                             ; 4461: 4c e6 44

drip_is_falling
    sec                                                               ; 4464: 38
    sbc #5                                                            ; 4465: e9 05
    clc                                                               ; 4467: 18
    adc #1                                                            ; 4468: 69 01
    asl                                                               ; 446a: 0a
    asl                                                               ; 446b: 0a
    asl                                                               ; 446c: 0a
    clc                                                               ; 446d: 18
    adc drip_initial_y                                                ; 446e: 6d ed 44
    sta object_y_low + objectid_drip                                  ; 4471: 8d 7f 09
    lda #spriteid_splash                                              ; 4474: a9 d9
    sta object_spriteid + objectid_drip                               ; 4476: 8d ab 09
    lda temp_drip_timer                                               ; 4479: ad ea 44
    cmp drip_timer_limit                                              ; 447c: cd ee 44
    bne set_full_droplet                                              ; 447f: d0 0b
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 4481: ad 2b 13
    bne return_drip_timer                                             ; 4484: d0 60
    jsr play_landing_sound                                            ; 4486: 20 a9 23
    jmp return_drip_timer                                             ; 4489: 4c e6 44

set_full_droplet
    lda droplet_full                                                  ; 448c: ad eb 43
    sta object_spriteid + objectid_drip                               ; 448f: 8d ab 09
    lda object_y_low + objectid_drip                                  ; 4492: ad 7f 09
    sec                                                               ; 4495: 38
    sbc #4                                                            ; 4496: e9 04
    sta object_y_low + objectid_drip                                  ; 4498: 8d 7f 09
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 449b: ad 2b 13
    bne return_drip_timer                                             ; 449e: d0 46
; is player holding the empty bottle? (return if not)
    lda object_spriteid + objectid_player_accessory                   ; 44a0: ad a9 09
    cmp #spriteid_empty_bottle_held                                   ; 44a3: c9 d3
    bne return_drip_timer                                             ; 44a5: d0 3f
; is the pouring animation happening? (return if so)
    lda bottle_pour_animation_step                                    ; 44a7: ad 73 0a
    bne return_drip_timer                                             ; 44aa: d0 3a
; check for bottle and drip collision (return if none)
    ldx #objectid_old_player_accessory                                ; 44ac: a2 0c
    ldy #objectid_old_drip                                            ; 44ae: a0 0e
    jsr test_for_collision_between_objects_x_and_y                    ; 44b0: 20 e2 28
    beq return_drip_timer                                             ; 44b3: f0 31
; bottle is now full
    lda #spriteid_full_bottle_held                                    ; 44b5: a9 d4
    sta object_spriteid + objectid_player_accessory                   ; 44b7: 8d a9 09
    lda #spriteid_full_bottle_menu_item                               ; 44ba: a9 d7
    sta player_held_object_spriteid                                   ; 44bc: 85 52
    ldx menu_index_for_extra_items                                    ; 44be: ae 6e 29
    sta desired_menu_slots,x                                          ; 44c1: 9d 5c 29
    lda #$ff                                                          ; 44c4: a9 ff
    sta save_game_level_k_got_bottle_flag                             ; 44c6: 8d 35 0a
    lda drip_is_poison_flag                                           ; 44c9: ad ec 44
    sta save_game_level_k_poison_in_bottle_flag                       ; 44cc: 8d 36 0a
; long-winded way of saying: temp_drip_timer -= drip_timer_limit+1
    lda drip_timer_limit                                              ; 44cf: ad ee 44
    clc                                                               ; 44d2: 18
    adc #1                                                            ; 44d3: 69 01
    sec                                                               ; 44d5: 38
    sbc temp_drip_timer                                               ; 44d6: ed ea 44
    eor #$ff                                                          ; 44d9: 49 ff
    clc                                                               ; 44db: 18
    adc #1                                                            ; 44dc: 69 01
    sta temp_drip_timer                                               ; 44de: 8d ea 44
; hide the collected drip
    lda #spriteid_one_pixel_masked_out                                ; 44e1: a9 00
    sta object_spriteid + objectid_drip                               ; 44e3: 8d ab 09
return_drip_timer
    lda temp_drip_timer                                               ; 44e6: ad ea 44
    rts                                                               ; 44e9: 60

temp_drip_timer
    !byte 0                                                           ; 44ea: 00
drip_start_frame
    !byte 0                                                           ; 44eb: 00
drip_is_poison_flag
    !byte 0                                                           ; 44ec: 00
drip_initial_y
    !byte 0                                                           ; 44ed: 00
drip_timer_limit
    !byte 0                                                           ; 44ee: 00
envelope1
    !byte 5                                                           ; 44ef: 05                      ; envelope number
    !byte 1                                                           ; 44f0: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 44f1: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 44f2: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 44f3: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 44f4: 00                      ; number of steps in section 1
    !byte 0                                                           ; 44f5: 00                      ; number of steps in section 2
    !byte 0                                                           ; 44f6: 00                      ; number of steps in section 3
    !byte 20                                                          ; 44f7: 14                      ; change of amplitude per step during attack phase
    !byte 246                                                         ; 44f8: f6                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 44f9: 00                      ; change of amplitude per step during sustain phase
    !byte 246                                                         ; 44fa: f6                      ; change of amplitude per step during release phase
    !byte 120                                                         ; 44fb: 78                      ; target of level at end of attack phase
    !byte 60                                                          ; 44fc: 3c                      ; target of level at end of decay phase
sound2
    !word $10                                                         ; 44fd: 10 00                   ; channel
    !word 5                                                           ; 44ff: 05 00                   ; amplitude
    !word 7                                                           ; 4501: 07 00                   ; pitch
    !word 2                                                           ; 4503: 02 00                   ; duration
sound1
    !word $11                                                         ; 4505: 11 00                   ; channel
    !word 0                                                           ; 4507: 00 00                   ; amplitude
    !word 180                                                         ; 4509: b4 00                   ; pitch
    !word 2                                                           ; 450b: 02 00                   ; duration
ground_fill_2x2_top_left
    !byte %....#...                                                   ; 450d: 08
    !byte %....#...                                                   ; 450e: 08
    !byte %...#....                                                   ; 450f: 10
    !byte %.###....                                                   ; 4510: 70
    !byte %#.......                                                   ; 4511: 80
    !byte %.....###                                                   ; 4512: 07
    !byte %.....#..                                                   ; 4513: 04
    !byte %....#...                                                   ; 4514: 08
ground_fill_2x2_top_right
    !byte %....#...                                                   ; 4515: 08
    !byte %.....#..                                                   ; 4516: 04
    !byte %.....#..                                                   ; 4517: 04
    !byte %.....##.                                                   ; 4518: 06
    !byte %##.....#                                                   ; 4519: c1
    !byte %..##....                                                   ; 451a: 30
    !byte %...#....                                                   ; 451b: 10
    !byte %...#....                                                   ; 451c: 10
ground_fill_2x2_bottom_left
    !byte %....#...                                                   ; 451d: 08
    !byte %.....#..                                                   ; 451e: 04
    !byte %.....#..                                                   ; 451f: 04
    !byte %.....##.                                                   ; 4520: 06
    !byte %##.....#                                                   ; 4521: c1
    !byte %..##....                                                   ; 4522: 30
    !byte %...#....                                                   ; 4523: 10
    !byte %...#....                                                   ; 4524: 10
ground_fill_2x2_bottom_right
    !byte %....#...                                                   ; 4525: 08
    !byte %....#...                                                   ; 4526: 08
    !byte %...#....                                                   ; 4527: 10
    !byte %.###....                                                   ; 4528: 70
    !byte %#.......                                                   ; 4529: 80
    !byte %.....###                                                   ; 452a: 07
    !byte %.....#..                                                   ; 452b: 04
    !byte %....#...                                                   ; 452c: 08
sprite_data
pydis_end
!if (<envelope1) != $ef {
    !error "Assertion failed: <envelope1 == $ef"
}
!if (<ground_fill_2x2_top_left) != $0d {
    !error "Assertion failed: <ground_fill_2x2_top_left == $0d"
}
!if (<sound1) != $05 {
    !error "Assertion failed: <sound1 == $05"
}
!if (<sound2) != $fd {
    !error "Assertion failed: <sound2 == $fd"
}
!if (>envelope1) != $44 {
    !error "Assertion failed: >envelope1 == $44"
}
!if (>ground_fill_2x2_top_left) != $45 {
    !error "Assertion failed: >ground_fill_2x2_top_left == $45"
}
!if (>sound1) != $45 {
    !error "Assertion failed: >sound1 == $45"
}
!if (>sound2) != $44 {
    !error "Assertion failed: >sound2 == $44"
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
!if (dog_head_dead_animation - dog_head_animations) != $01 {
    !error "Assertion failed: dog_head_dead_animation - dog_head_animations == $01"
}
!if (dog_head_drinking_animation - dog_head_animations) != $05 {
    !error "Assertion failed: dog_head_drinking_animation - dog_head_animations == $05"
}
!if (dog_head_push_animation - dog_head_animations) != $1b {
    !error "Assertion failed: dog_head_push_animation - dog_head_animations == $1b"
}
!if (dog_head_stunned_animation - dog_head_animations) != $3a {
    !error "Assertion failed: dog_head_stunned_animation - dog_head_animations == $3a"
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
!if (inkey_key_g) != $ac {
    !error "Assertion failed: inkey_key_g == $ac"
}
!if (inkey_key_p) != $c8 {
    !error "Assertion failed: inkey_key_p == $c8"
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
!if (object_direction + objectid_bottle_pour) != $09c0 {
    !error "Assertion failed: object_direction + objectid_bottle_pour == $09c0"
}
!if (object_direction + objectid_leaf2) != $09c3 {
    !error "Assertion failed: object_direction + objectid_leaf2 == $09c3"
}
!if (object_erase_type + objectid_bottle_pour) != $38ae {
    !error "Assertion failed: object_erase_type + objectid_bottle_pour == $38ae"
}
!if (object_erase_type + objectid_dog_head) != $38b2 {
    !error "Assertion failed: object_erase_type + objectid_dog_head == $38b2"
}
!if (object_erase_type + objectid_drip) != $38af {
    !error "Assertion failed: object_erase_type + objectid_drip == $38af"
}
!if (object_spriteid + objectid_bottle_pour) != $09aa {
    !error "Assertion failed: object_spriteid + objectid_bottle_pour == $09aa"
}
!if (object_spriteid + objectid_dog_body) != $09ad {
    !error "Assertion failed: object_spriteid + objectid_dog_body == $09ad"
}
!if (object_spriteid + objectid_dog_bowl) != $09af {
    !error "Assertion failed: object_spriteid + objectid_dog_bowl == $09af"
}
!if (object_spriteid + objectid_dog_head) != $09ae {
    !error "Assertion failed: object_spriteid + objectid_dog_head == $09ae"
}
!if (object_spriteid + objectid_drip) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_drip == $09ab"
}
!if (object_spriteid + objectid_empty_bottle) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_empty_bottle == $09ab"
}
!if (object_spriteid + objectid_leaf1) != $09ac {
    !error "Assertion failed: object_spriteid + objectid_leaf1 == $09ac"
}
!if (object_spriteid + objectid_leaf2) != $09ad {
    !error "Assertion failed: object_spriteid + objectid_leaf2 == $09ad"
}
!if (object_spriteid + objectid_top_of_stalk) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_top_of_stalk == $09ab"
}
!if (object_spriteid_old + objectid_bottle_pour) != $09b5 {
    !error "Assertion failed: object_spriteid_old + objectid_bottle_pour == $09b5"
}
!if (object_spriteid_old + objectid_leaf1) != $09b7 {
    !error "Assertion failed: object_spriteid_old + objectid_leaf1 == $09b7"
}
!if (object_spriteid_old + objectid_leaf2) != $09b8 {
    !error "Assertion failed: object_spriteid_old + objectid_leaf2 == $09b8"
}
!if (object_spriteid_old + objectid_top_of_stalk) != $09b6 {
    !error "Assertion failed: object_spriteid_old + objectid_top_of_stalk == $09b6"
}
!if (object_x_high + objectid_bottle_pour) != $0968 {
    !error "Assertion failed: object_x_high + objectid_bottle_pour == $0968"
}
!if (object_x_high + objectid_drip) != $0969 {
    !error "Assertion failed: object_x_high + objectid_drip == $0969"
}
!if (object_x_low + objectid_bottle_pour) != $0952 {
    !error "Assertion failed: object_x_low + objectid_bottle_pour == $0952"
}
!if (object_x_low + objectid_dog_body) != $0955 {
    !error "Assertion failed: object_x_low + objectid_dog_body == $0955"
}
!if (object_x_low + objectid_dog_bowl) != $0957 {
    !error "Assertion failed: object_x_low + objectid_dog_bowl == $0957"
}
!if (object_x_low + objectid_dog_head) != $0956 {
    !error "Assertion failed: object_x_low + objectid_dog_head == $0956"
}
!if (object_x_low + objectid_drip) != $0953 {
    !error "Assertion failed: object_x_low + objectid_drip == $0953"
}
!if (object_y_low + objectid_bottle_pour) != $097e {
    !error "Assertion failed: object_y_low + objectid_bottle_pour == $097e"
}
!if (object_y_low + objectid_dog_bowl) != $0983 {
    !error "Assertion failed: object_y_low + objectid_dog_bowl == $0983"
}
!if (object_y_low + objectid_dog_head) != $0982 {
    !error "Assertion failed: object_y_low + objectid_dog_head == $0982"
}
!if (object_y_low + objectid_drip) != $097f {
    !error "Assertion failed: object_y_low + objectid_drip == $097f"
}
!if (object_y_low + objectid_leaf1) != $0980 {
    !error "Assertion failed: object_y_low + objectid_leaf1 == $0980"
}
!if (object_y_low + objectid_leaf2) != $0981 {
    !error "Assertion failed: object_y_low + objectid_leaf2 == $0981"
}
!if (object_y_low + objectid_top_of_stalk) != $097f {
    !error "Assertion failed: object_y_low + objectid_top_of_stalk == $097f"
}
!if (object_z_order + objectid_bottle_pour) != $38c4 {
    !error "Assertion failed: object_z_order + objectid_bottle_pour == $38c4"
}
!if (object_z_order + objectid_dog_body) != $38c7 {
    !error "Assertion failed: object_z_order + objectid_dog_body == $38c7"
}
!if (object_z_order + objectid_dog_head) != $38c8 {
    !error "Assertion failed: object_z_order + objectid_dog_head == $38c8"
}
!if (object_z_order + objectid_drip) != $38c5 {
    !error "Assertion failed: object_z_order + objectid_drip == $38c5"
}
!if (object_z_order + objectid_leaf1) != $38c6 {
    !error "Assertion failed: object_z_order + objectid_leaf1 == $38c6"
}
!if (object_z_order + objectid_leaf2) != $38c7 {
    !error "Assertion failed: object_z_order + objectid_leaf2 == $38c7"
}
!if (objectid_bottle_pour) != $02 {
    !error "Assertion failed: objectid_bottle_pour == $02"
}
!if (objectid_dog_bowl) != $07 {
    !error "Assertion failed: objectid_dog_bowl == $07"
}
!if (objectid_dog_head) != $06 {
    !error "Assertion failed: objectid_dog_head == $06"
}
!if (objectid_empty_bottle) != $03 {
    !error "Assertion failed: objectid_empty_bottle == $03"
}
!if (objectid_leaf1) != $04 {
    !error "Assertion failed: objectid_leaf1 == $04"
}
!if (objectid_leaf2) != $05 {
    !error "Assertion failed: objectid_leaf2 == $05"
}
!if (objectid_old_drip) != $0e {
    !error "Assertion failed: objectid_old_drip == $0e"
}
!if (objectid_old_player) != $0b {
    !error "Assertion failed: objectid_old_player == $0b"
}
!if (objectid_old_player_accessory) != $0c {
    !error "Assertion failed: objectid_old_player_accessory == $0c"
}
!if (objectid_player) != $00 {
    !error "Assertion failed: objectid_player == $00"
}
!if (objectid_room2_fire1) != $06 {
    !error "Assertion failed: objectid_room2_fire1 == $06"
}
!if (objectid_room2_fire2) != $07 {
    !error "Assertion failed: objectid_room2_fire2 == $07"
}
!if (objectid_room_1_fire1) != $04 {
    !error "Assertion failed: objectid_room_1_fire1 == $04"
}
!if (objectid_room_1_fire2) != $05 {
    !error "Assertion failed: objectid_room_1_fire2 == $05"
}
!if (objectid_room_3_fire) != $04 {
    !error "Assertion failed: objectid_room_3_fire == $04"
}
!if (objectid_spell) != $04 {
    !error "Assertion failed: objectid_spell == $04"
}
!if (objectid_top_of_stalk) != $03 {
    !error "Assertion failed: objectid_top_of_stalk == $03"
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
!if (sprite_op_flags_erase_to_fg_colour) != $04 {
    !error "Assertion failed: sprite_op_flags_erase_to_fg_colour == $04"
}
!if (spriteid_bucket) != $d8 {
    !error "Assertion failed: spriteid_bucket == $d8"
}
!if (spriteid_dog_body) != $e9 {
    !error "Assertion failed: spriteid_dog_body == $e9"
}
!if (spriteid_dog_bowl2) != $ed {
    !error "Assertion failed: spriteid_dog_bowl2 == $ed"
}
!if (spriteid_dog_dead) != $e8 {
    !error "Assertion failed: spriteid_dog_dead == $e8"
}
!if (spriteid_dog_head) != $ea {
    !error "Assertion failed: spriteid_dog_head == $ea"
}
!if (spriteid_dog_head_licking) != $eb {
    !error "Assertion failed: spriteid_dog_head_licking == $eb"
}
!if (spriteid_droplet) != $da {
    !error "Assertion failed: spriteid_droplet == $da"
}
!if (spriteid_droplet1) != $db {
    !error "Assertion failed: spriteid_droplet1 == $db"
}
!if (spriteid_droplet2) != $dc {
    !error "Assertion failed: spriteid_droplet2 == $dc"
}
!if (spriteid_droplet3) != $dd {
    !error "Assertion failed: spriteid_droplet3 == $dd"
}
!if (spriteid_droplet4) != $de {
    !error "Assertion failed: spriteid_droplet4 == $de"
}
!if (spriteid_empty_bottle) != $d2 {
    !error "Assertion failed: spriteid_empty_bottle == $d2"
}
!if (spriteid_empty_bottle_held) != $d3 {
    !error "Assertion failed: spriteid_empty_bottle_held == $d3"
}
!if (spriteid_empty_bottle_menu_item) != $d6 {
    !error "Assertion failed: spriteid_empty_bottle_menu_item == $d6"
}
!if (spriteid_emptying_bottle) != $d5 {
    !error "Assertion failed: spriteid_emptying_bottle == $d5"
}
!if (spriteid_erase_1) != $d1 {
    !error "Assertion failed: spriteid_erase_1 == $d1"
}
!if (spriteid_erase_2) != $e4 {
    !error "Assertion failed: spriteid_erase_2 == $e4"
}
!if (spriteid_full_bottle) != $cc {
    !error "Assertion failed: spriteid_full_bottle == $cc"
}
!if (spriteid_full_bottle_held) != $d4 {
    !error "Assertion failed: spriteid_full_bottle_held == $d4"
}
!if (spriteid_full_bottle_menu_item) != $d7 {
    !error "Assertion failed: spriteid_full_bottle_menu_item == $d7"
}
!if (spriteid_leaf) != $cd {
    !error "Assertion failed: spriteid_leaf == $cd"
}
!if (spriteid_leaf_grow1) != $d0 {
    !error "Assertion failed: spriteid_leaf_grow1 == $d0"
}
!if (spriteid_leaf_grow2) != $cf {
    !error "Assertion failed: spriteid_leaf_grow2 == $cf"
}
!if (spriteid_leaf_grow3) != $ce {
    !error "Assertion failed: spriteid_leaf_grow3 == $ce"
}
!if (spriteid_leaf_wilt_1) != $e0 {
    !error "Assertion failed: spriteid_leaf_wilt_1 == $e0"
}
!if (spriteid_leaf_wilt_2) != $e1 {
    !error "Assertion failed: spriteid_leaf_wilt_2 == $e1"
}
!if (spriteid_leaf_wilt_3) != $e2 {
    !error "Assertion failed: spriteid_leaf_wilt_3 == $e2"
}
!if (spriteid_leaf_wilt_4) != $e3 {
    !error "Assertion failed: spriteid_leaf_wilt_4 == $e3"
}
!if (spriteid_one_pixel_masked_out) != $00 {
    !error "Assertion failed: spriteid_one_pixel_masked_out == $00"
}
!if (spriteid_pour) != $df {
    !error "Assertion failed: spriteid_pour == $df"
}
!if (spriteid_shelf) != $e5 {
    !error "Assertion failed: spriteid_shelf == $e5"
}
!if (spriteid_shelf_support) != $e6 {
    !error "Assertion failed: spriteid_shelf_support == $e6"
}
!if (spriteid_splash) != $d9 {
    !error "Assertion failed: spriteid_splash == $d9"
}
!if (spriteid_stalk) != $c8 {
    !error "Assertion failed: spriteid_stalk == $c8"
}
!if (spriteid_stalk_bottom_end) != $c9 {
    !error "Assertion failed: spriteid_stalk_bottom_end == $c9"
}
!if (spriteid_stalk_top_end) != $ca {
    !error "Assertion failed: spriteid_stalk_top_end == $ca"
}
!if (spriteid_stalk_top_end_short) != $cb {
    !error "Assertion failed: spriteid_stalk_top_end_short == $cb"
}
