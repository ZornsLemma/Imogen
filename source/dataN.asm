; *************************************************************************************
;
; Level N: 'PAVLOV-WAS-HERE'
;
; Save game variables:
;
;     save_game_level_n_partition_y                              ($0a4a):
;             $40: partition is up
;         $41-$5f: partition is between up and down
;             $60: partition is down
;
;     save_game_level_n_dog_head_animation                       ($0a4b):
;               1: regular animation
;             $30: drooling with drip
;             $34: ending drooling
;
;     save_game_level_n_got_clanger                              ($0a4c):
;               0: no
;             $ff: got clanger
;
;     save_game_level_n_bell_animation                           ($0a4d):
;               1: stopped
;               4: move sideways
;               7: fall sideways
;             $14: fall down
;
;     save_game_level_n_bell_animation_step                      ($0a4e):
;             animation step for the above animation
;
;     save_game_level_n_bell_x_low                               ($0a4f):
;     save_game_level_n_bell_x_high                              ($0a50):
;     save_game_level_n_bell_y_low                               ($0a51):
;     save_game_level_n_bell_y_high                              ($0a52):
;             position of the bell within the room
;
;     save_game_level_n_bell_room                                ($0a53):
;             room number containing the bell
;
;     save_game_level_n_bell_direction                           ($0a54):
;               0: stationary
;               1: moving right
;             $ff: moving left
;
; Solution:
;
;   1. Climb the left rope to the top and exit to the left room
;   2. Collect the clanger and return to the rope
;   3. Descend halfway down the rope and jump off to push the bell off the ledge
;   4. Push the bell to the room to the right
;   5. Use the clanger on the bell to ring it, causing the dog to drool into the umbrella
;       (The partition raises)
;   6. Collect the spell
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
inkey_key_o                           = 201
last_level_letter                     = 81
object_collided_ceiling               = 8
object_collided_floor                 = 2
object_collided_left_wall             = 1
object_collided_right_wall            = 4
objectid_bell                         = 2
objectid_clanger                      = 4
objectid_clanger_end                  = 3
objectid_dog_head                     = 9
objectid_dog_tail                     = 8
objectid_drip                         = 7
objectid_fire1                        = 4
objectid_fire2                        = 5
objectid_old_player                   = 11
objectid_old_player_accessory         = 12
objectid_partition                    = 5
objectid_partition_end                = 4
objectid_player                       = 0
objectid_player_accessory             = 1
objectid_sparkles                     = 6
objectid_umbrella                     = 10
opcode_jmp                            = 76
sprite_op_flags_copy_screen           = 1
sprite_op_flags_erase_to_bg_colour    = 2
sprite_op_flags_erase_to_fg_colour    = 4
sprite_op_flags_normal                = 0
spriteid_ball                         = 59
spriteid_bell                         = 225
spriteid_boulder                      = 204
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
spriteid_clanger                      = 223
spriteid_clanger2                     = 232
spriteid_clanger_end                  = 231
spriteid_clanger_menu_item            = 224
spriteid_corner_bottom_left           = 45
spriteid_corner_bottom_right          = 46
spriteid_corner_top_left              = 44
spriteid_corner_top_right             = 47
spriteid_diamond1                     = 39
spriteid_diamond2                     = 40
spriteid_diamond3                     = 41
spriteid_diamond4                     = 42
spriteid_diamond5                     = 43
spriteid_dog_body                     = 209
spriteid_dog_head                     = 212
spriteid_dog_head_drooling            = 213
spriteid_droplet1                     = 217
spriteid_droplet2                     = 216
spriteid_droplet3                     = 215
spriteid_droplet4                     = 214
spriteid_erase1                       = 208
spriteid_erase2                       = 210
spriteid_erase3                       = 211
spriteid_erase4                       = 226
spriteid_erase5                       = 229
spriteid_erase_player                 = 199
spriteid_erase_player_accessory       = 198
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
spriteid_holding_clanger              = 230
spriteid_horizontal_rope              = 202
spriteid_icodata_box                  = 9
spriteid_icodata_cat                  = 5
spriteid_icodata_disc                 = 3
spriteid_icodata_info                 = 7
spriteid_icodata_monkey               = 6
spriteid_icodata_password             = 8
spriteid_icodata_sound                = 2
spriteid_icodata_wizard               = 4
spriteid_icon_background              = 1
spriteid_left_hook                    = 200
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
spriteid_partition                    = 206
spriteid_partition_end                = 207
spriteid_pointer_hand                 = 29
spriteid_right_hook                   = 201
spriteid_rope                         = 203
spriteid_rope1                        = 85
spriteid_rope2                        = 86
spriteid_rope3                        = 87
spriteid_rope4                        = 88
spriteid_rope_end                     = 10
spriteid_rope_end1                    = 218
spriteid_rope_hook                    = 11
spriteid_sparkles1                    = 34
spriteid_sparkles2                    = 35
spriteid_sparkles3                    = 36
spriteid_sparkles4                    = 37
spriteid_sparkles5                    = 38
spriteid_tail1                        = 219
spriteid_tail2                        = 220
spriteid_tail3                        = 221
spriteid_tail4                        = 222
spriteid_umbrella                     = 205
spriteid_using_clanger                = 227
spriteid_using_clanger_end            = 228
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
save_game_level_n_partition_y                       = $0a4a
save_game_level_n_dog_head_animation                = $0a4b
save_game_level_n_got_clanger                       = $0a4c
save_game_level_n_bell_animation                    = $0a4d
save_game_level_n_bell_animation_step               = $0a4e
save_game_level_n_bell_x_low                        = $0a4f
save_game_level_n_bell_x_high                       = $0a50
save_game_level_n_bell_y_low                        = $0a51
save_game_level_n_bell_y_high                       = $0a52
save_game_level_n_bell_room                         = $0a53
save_game_level_n_bell_direction                    = $0a54
dog_tail_animation_step                             = $0a6f
dog_head_animation_step                             = $0a70
drip_y_position                                     = $0a71
drip_final_delay                                    = $0a72
fast_forward_bell_counter                           = $0a73
player_is_currently_clanging_the_bell               = $0a74
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
    !word sprite_data - level_data                                    ; 3ad5: 9f 0a                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f7 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 1a 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
initial_room_index
    !byte 1                                                           ; 3add: 01
initial_room_index_cheat
    !byte 2                                                           ; 3ade: 02
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
; check for level change (branch if not)
level_specific_initialisation
    lda current_level                                                 ; 3af7: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3af9: c5 51
    beq set_rock_tiles                                                ; 3afb: f0 14
    lda developer_flags                                               ; 3afd: ad 03 11
    bpl developer_mode_inactive1                                      ; 3b00: 10 05
    lda #$ff                                                          ; 3b02: a9 ff
    sta save_game_level_n_got_clanger                                 ; 3b04: 8d 4c 0a
developer_mode_inactive1
    lda save_game_level_n_got_clanger                                 ; 3b07: ad 4c 0a
    beq set_rock_tiles                                                ; 3b0a: f0 05
    lda #spriteid_clanger_menu_item                                   ; 3b0c: a9 e0
    jsr find_or_create_menu_slot_for_A                                ; 3b0e: 20 bd 2b
set_rock_tiles
    lda #<ground_fill_2x2_top_left                                    ; 3b11: a9 54
    sta source_sprite_memory_low                                      ; 3b13: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3b15: a9 45
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
    jsr room_1_update_handler                                         ; 3b1a: 20 35 3f
    jsr update_dog_umbrella_puzzle                                    ; 3b1d: 20 3a 3d
    jsr room_0_update_handler                                         ; 3b20: 20 f7 3b
    lda #0                                                            ; 3b23: a9 00
    sta player_is_currently_clanging_the_bell                         ; 3b25: 8d 74 0a
    jsr room_2_update_handler                                         ; 3b28: 20 58 40
    jsr room_3_update_handler                                         ; 3b2b: 20 fb 43
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
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
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
    and #exit_room_left                                               ; 3baf: 29 01
    beq room_0_game_update_loop                                       ; 3bb1: f0 f9
    ldx #1                                                            ; 3bb3: a2 01
    ldy current_level                                                 ; 3bb5: a4 31
    jmp initialise_level_and_room                                     ; 3bb7: 4c 40 11

dog_head_animations
    !byte 0                                                           ; 3bba: 00
dog_head_normal_animation
    !byte spriteid_dog_head                                           ; 3bbb: d4
    !byte 0, 0                                                        ; 3bbc: 00 00
    !byte $ff                                                         ; 3bbe: ff
dog_head_drooling_animation
    !byte spriteid_dog_head_drooling                                  ; 3bbf: d5
    !byte 0, 0                                                        ; 3bc0: 00 00
    !byte spriteid_dog_head_drooling                                  ; 3bc2: d5
    !byte 0, 0                                                        ; 3bc3: 00 00
    !byte spriteid_dog_head_drooling                                  ; 3bc5: d5
    !byte 0, 0                                                        ; 3bc6: 00 00
    !byte spriteid_dog_head_drooling                                  ; 3bc8: d5
    !byte 0, 0                                                        ; 3bc9: 00 00
    !byte spriteid_dog_head_drooling                                  ; 3bcb: d5
    !byte 0, 0                                                        ; 3bcc: 00 00
    !byte spriteid_dog_head_drooling                                  ; 3bce: d5
    !byte 0, 0                                                        ; 3bcf: 00 00
    !byte spriteid_dog_head_drooling                                  ; 3bd1: d5
    !byte 0, 0                                                        ; 3bd2: 00 00
    !byte spriteid_dog_head_drooling                                  ; 3bd4: d5
    !byte 0, 0                                                        ; 3bd5: 00 00
    !byte spriteid_dog_head_drooling                                  ; 3bd7: d5
    !byte spriteid_droplet1,                 0                        ; 3bd8: d9 00
    !byte spriteid_dog_head_drooling                                  ; 3bda: d5
    !byte spriteid_droplet2,                 0                        ; 3bdb: d8 00
    !byte spriteid_dog_head_drooling                                  ; 3bdd: d5
    !byte spriteid_droplet3,                 0                        ; 3bde: d7 00
    !byte spriteid_dog_head_drooling                                  ; 3be0: d5
    !byte spriteid_droplet4,                 0                        ; 3be1: d6 00
    !byte spriteid_dog_head_drooling                                  ; 3be3: d5
    !byte spriteid_droplet4,                 2                        ; 3be4: d6 02
    !byte spriteid_dog_head_drooling                                  ; 3be6: d5
    !byte spriteid_droplet4,                 4                        ; 3be7: d6 04
    !byte $ff                                                         ; 3be9: ff
dog_head_drooling_held_animation
    !byte spriteid_dog_head_drooling                                  ; 3bea: d5
    !byte spriteid_droplet4,                 8                        ; 3beb: d6 08
    !byte $ff                                                         ; 3bed: ff
dog_head_drooling_final_animation
    !byte spriteid_dog_head_drooling                                  ; 3bee: d5
    !byte 0, 0                                                        ; 3bef: 00 00
    !byte $ff                                                         ; 3bf1: ff
dog_tail_animation
    !byte spriteid_tail1                                              ; 3bf2: db
    !byte spriteid_tail2                                              ; 3bf3: dc
    !byte spriteid_tail3                                              ; 3bf4: dd
    !byte spriteid_tail4                                              ; 3bf5: de
    !byte $ff                                                         ; 3bf6: ff

room_0_update_handler
    lda #0                                                            ; 3bf7: a9 00
    sta currently_updating_logic_for_room_index                       ; 3bf9: 8d ba 1a
; level completion code
    ldx #$23 ; '#'                                                    ; 3bfc: a2 23
    ldy #$10                                                          ; 3bfe: a0 10
    lda #objectid_sparkles                                            ; 3c00: a9 06
    jsr update_level_completion                                       ; 3c02: 20 10 1a
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 3c05: ad 2b 13
    beq room_0_not_first_update                                       ; 3c08: f0 4d
; check for level change (branch if not)
    lda current_level                                                 ; 3c0a: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3c0c: c5 51
    beq room_changed_only                                             ; 3c0e: f0 0d
; initialise dog and drip
    lda #dog_head_normal_animation - dog_head_animations              ; 3c10: a9 01
    sta save_game_level_n_dog_head_animation                          ; 3c12: 8d 4b 0a
    sta dog_head_animation_step                                       ; 3c15: 8d 70 0a
    lda #$30 ; '0'                                                    ; 3c18: a9 30
    sta drip_y_position                                               ; 3c1a: 8d 71 0a
room_changed_only
    lda desired_room_index                                            ; 3c1d: a5 30
    cmp #0                                                            ; 3c1f: c9 00                   ; redundant instruction
    bne update_dog_head_and_drip_objects_local                        ; 3c21: d0 31
; draw dog body
    ldx #$0b                                                          ; 3c23: a2 0b
    ldy #7                                                            ; 3c25: a0 07
    lda #spriteid_dog_body                                            ; 3c27: a9 d1
    jsr draw_sprite_a_at_cell_xy                                      ; 3c29: 20 4c 1f
; initialise dog tail object
    lda #objectid_dog_tail                                            ; 3c2c: a9 08
    jsr set_object_position_from_cell_xy                              ; 3c2e: 20 5d 1f
    lda #$c0                                                          ; 3c31: a9 c0
    sta object_z_order + objectid_dog_tail                            ; 3c33: 8d ca 38
; initialise dog head object
    lda #objectid_dog_head                                            ; 3c36: a9 09
    jsr set_object_position_from_cell_xy                              ; 3c38: 20 5d 1f
    lda #spriteid_erase2                                              ; 3c3b: a9 d2
    sta object_erase_type + objectid_dog_head                         ; 3c3d: 8d b5 38
    lda #$c0                                                          ; 3c40: a9 c0
    sta object_z_order + objectid_dog_head                            ; 3c42: 8d cb 38
; initialise drip
    lda #$58 ; 'X'                                                    ; 3c45: a9 58
    sta object_x_low + objectid_drip                                  ; 3c47: 8d 57 09
    lda #spriteid_erase3                                              ; 3c4a: a9 d3
    sta object_erase_type + objectid_drip                             ; 3c4c: 8d b3 38
    lda #$a0                                                          ; 3c4f: a9 a0
    sta object_z_order + objectid_drip                                ; 3c51: 8d c9 38
update_dog_head_and_drip_objects_local
    jmp update_dog_head_and_drip_objects                              ; 3c54: 4c 13 3d

room_0_not_first_update
    lda dog_head_animation_step                                       ; 3c57: ad 70 0a
    clc                                                               ; 3c5a: 18
    adc #3                                                            ; 3c5b: 69 03
    tay                                                               ; 3c5d: a8
    lda dog_head_animations,y                                         ; 3c5e: b9 ba 3b
    cmp #$ff                                                          ; 3c61: c9 ff
    bne got_dog_head_animation_step_in_y                              ; 3c63: d0 03
    ldy save_game_level_n_dog_head_animation                          ; 3c65: ac 4b 0a
; check for regular dog animation
got_dog_head_animation_step_in_y
    lda save_game_level_n_dog_head_animation                          ; 3c68: ad 4b 0a
    cmp #dog_head_normal_animation - dog_head_animations              ; 3c6b: c9 01
    beq doing_normal_animation                                        ; 3c6d: f0 50
; check for drooling dog animation
    cmp #dog_head_drooling_held_animation - dog_head_animations       ; 3c6f: c9 30
    beq update_drip                                                   ; 3c71: f0 04
; check for end of drooling animation
    cmp #dog_head_drooling_final_animation - dog_head_animations      ; 3c73: c9 34
    beq end_of_drooling                                               ; 3c75: f0 3e
; could be 'lda #$ac:sec:sbc:save_game_level_n_partition_y' without adding $4c
; afterwards?
update_drip
    lda #$60 ; '`'                                                    ; 3c77: a9 60
    sec                                                               ; 3c79: 38
    sbc save_game_level_n_partition_y                                 ; 3c7a: ed 4a 0a
    clc                                                               ; 3c7d: 18
    adc #$4c ; 'L'                                                    ; 3c7e: 69 4c
    cmp drip_y_position                                               ; 3c80: cd 71 0a
    bcs set_dog_head_animation_step                                   ; 3c83: b0 60
    lda desired_room_index                                            ; 3c85: a5 30
    cmp #0                                                            ; 3c87: c9 00
    bne set_end_of_dog_drooling                                       ; 3c89: d0 03
    jsr play_landing_sound                                            ; 3c8b: 20 a9 23
set_end_of_dog_drooling
    ldy #dog_head_drooling_final_animation - dog_head_animations      ; 3c8e: a0 34
    sty save_game_level_n_dog_head_animation                          ; 3c90: 8c 4b 0a
    lda #$30 ; '0'                                                    ; 3c93: a9 30
    sta drip_y_position                                               ; 3c95: 8d 71 0a
    lda #$14                                                          ; 3c98: a9 14
    sta drip_final_delay                                              ; 3c9a: 8d 72 0a
    lda save_game_level_n_partition_y                                 ; 3c9d: ad 4a 0a
    cmp #$60 ; '`'                                                    ; 3ca0: c9 60
    bne set_dog_head_animation_step                                   ; 3ca2: d0 41
    lda #$18                                                          ; 3ca4: a9 18
    sta drip_final_delay                                              ; 3ca6: 8d 72 0a
; move partition down 4 pixels
    lda save_game_level_n_partition_y                                 ; 3ca9: ad 4a 0a
    sec                                                               ; 3cac: 38
    sbc #4                                                            ; 3cad: e9 04
    sta save_game_level_n_partition_y                                 ; 3caf: 8d 4a 0a
    jmp set_dog_head_animation_step                                   ; 3cb2: 4c e5 3c

end_of_drooling
    dec drip_final_delay                                              ; 3cb5: ce 72 0a
    bne doing_normal_animation                                        ; 3cb8: d0 05
    ldy #dog_head_normal_animation - dog_head_animations              ; 3cba: a0 01
    sty save_game_level_n_dog_head_animation                          ; 3cbc: 8c 4b 0a
doing_normal_animation
    lda desired_room_index                                            ; 3cbf: a5 30
    cmp #0                                                            ; 3cc1: c9 00                   ; redundant instruction
    bne set_dog_head_animation_step                                   ; 3cc3: d0 20
    lda player_is_currently_clanging_the_bell                         ; 3cc5: ad 74 0a
    bne start_dog_drooling                                            ; 3cc8: d0 14
    lda developer_flags                                               ; 3cca: ad 03 11
    bpl set_dog_head_animation_step                                   ; 3ccd: 10 16
    ldx #inkey_key_o                                                  ; 3ccf: a2 c9
    sty remember_y                                                    ; 3cd1: 8c 39 3d
    jsr negative_inkey                                                ; 3cd4: 20 cc 3a
    ldy remember_y                                                    ; 3cd7: ac 39 3d
    ora #0                                                            ; 3cda: 09 00
    beq set_dog_head_animation_step                                   ; 3cdc: f0 07
start_dog_drooling
    ldy #dog_head_drooling_animation - dog_head_animations            ; 3cde: a0 05
    lda #dog_head_drooling_held_animation - dog_head_animations       ; 3ce0: a9 30
    sta save_game_level_n_dog_head_animation                          ; 3ce2: 8d 4b 0a
set_dog_head_animation_step
    sty dog_head_animation_step                                       ; 3ce5: 8c 70 0a
    iny                                                               ; 3ce8: c8
    iny                                                               ; 3ce9: c8
    lda dog_head_animations,y                                         ; 3cea: b9 ba 3b
    clc                                                               ; 3ced: 18
    adc drip_y_position                                               ; 3cee: 6d 71 0a
    sta drip_y_position                                               ; 3cf1: 8d 71 0a
    ldy dog_tail_animation_step                                       ; 3cf4: ac 6f 0a
    iny                                                               ; 3cf7: c8
    lda dog_tail_animation,y                                          ; 3cf8: b9 f2 3b
    cmp #$ff                                                          ; 3cfb: c9 ff
    bne got_dog_tail_animation_step_in_y                              ; 3cfd: d0 02
    ldy #0                                                            ; 3cff: a0 00
got_dog_tail_animation_step_in_y
    sty dog_tail_animation_step                                       ; 3d01: 8c 6f 0a
    ldy dog_head_animation_step                                       ; 3d04: ac 70 0a
    lda dog_head_animations,y                                         ; 3d07: b9 ba 3b
    cmp #spriteid_dog_head_drooling                                   ; 3d0a: c9 d5
    beq update_dog_head_and_drip_objects                              ; 3d0c: f0 05
    lda #0                                                            ; 3d0e: a9 00
    sta dog_tail_animation_step                                       ; 3d10: 8d 6f 0a
update_dog_head_and_drip_objects
    lda desired_room_index                                            ; 3d13: a5 30
    cmp #0                                                            ; 3d15: c9 00
    bne return1                                                       ; 3d17: d0 1f
    ldy dog_head_animation_step                                       ; 3d19: ac 70 0a
    lda dog_head_animations,y                                         ; 3d1c: b9 ba 3b
    sta object_spriteid + objectid_dog_head                           ; 3d1f: 8d b1 09
    iny                                                               ; 3d22: c8
    lda dog_head_animations,y                                         ; 3d23: b9 ba 3b
    sta object_spriteid + objectid_drip                               ; 3d26: 8d af 09
    lda drip_y_position                                               ; 3d29: ad 71 0a
    sta object_y_low + objectid_drip                                  ; 3d2c: 8d 83 09
    ldy dog_tail_animation_step                                       ; 3d2f: ac 6f 0a
    lda dog_tail_animation,y                                          ; 3d32: b9 f2 3b
    sta object_spriteid + objectid_dog_tail                           ; 3d35: 8d b0 09
return1
    rts                                                               ; 3d38: 60

remember_y
    !byte 0                                                           ; 3d39: 00

; check for first update in room (branch if so)
update_dog_umbrella_puzzle
    lda update_room_first_update_flag                                 ; 3d3a: ad 2b 13
    bne initialise_room_0                                             ; 3d3d: d0 03
    jmp update_room_0                                                 ; 3d3f: 4c df 3d

; check for level change (branch if not)
initialise_room_0
    lda current_level                                                 ; 3d42: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3d44: c5 51
    beq initialise_rope_system                                        ; 3d46: f0 1e
    lda save_game_level_n_partition_y                                 ; 3d48: ad 4a 0a
    beq check_to_see_if_partition_should_be_up_or_down                ; 3d4b: f0 04
    cmp #$60 ; '`'                                                    ; 3d4d: c9 60
    bne set_partition_up                                              ; 3d4f: d0 09
check_to_see_if_partition_should_be_up_or_down
    lda save_game_level_n_dog_head_animation                          ; 3d51: ad 4b 0a
    beq set_partition_down                                            ; 3d54: f0 0b
    cmp #dog_head_normal_animation - dog_head_animations              ; 3d56: c9 01
    beq set_partition_down                                            ; 3d58: f0 07
set_partition_up
    lda #$40 ; '@'                                                    ; 3d5a: a9 40
    sta save_game_level_n_partition_y                                 ; 3d5c: 8d 4a 0a
    bne initialise_rope_system                                        ; 3d5f: d0 05                   ; ALWAYS branch

set_partition_down
    lda #$60 ; '`'                                                    ; 3d61: a9 60
    sta save_game_level_n_partition_y                                 ; 3d63: 8d 4a 0a
initialise_rope_system
    lda desired_room_index                                            ; 3d66: a5 30
    cmp #0                                                            ; 3d68: c9 00                   ; redundant instruction
    bne update_partition_and_umbrella_local                           ; 3d6a: d0 70
    ldx #$20 ; ' '                                                    ; 3d6c: a2 20
    ldy #2                                                            ; 3d6e: a0 02
    lda #spriteid_right_hook                                          ; 3d70: a9 c9
    jsr draw_sprite_a_at_cell_xy                                      ; 3d72: 20 4c 1f
    dex                                                               ; 3d75: ca
    dex                                                               ; 3d76: ca
    lda #spriteid_horizontal_rope                                     ; 3d77: a9 ca
draw_horizontal_rope_loop
    jsr draw_sprite_a_at_cell_xy                                      ; 3d79: 20 4c 1f
    dex                                                               ; 3d7c: ca
    cpx #$0f                                                          ; 3d7d: e0 0f
    bcs draw_horizontal_rope_loop                                     ; 3d7f: b0 f8
    dex                                                               ; 3d81: ca
    lda #spriteid_left_hook                                           ; 3d82: a9 c8
    jsr draw_sprite_a_at_cell_xy                                      ; 3d84: 20 4c 1f
    lda #$60 ; '`'                                                    ; 3d87: a9 60
    sec                                                               ; 3d89: 38
    sbc save_game_level_n_partition_y                                 ; 3d8a: ed 4a 0a
    clc                                                               ; 3d8d: 18
    adc #$40 ; '@'                                                    ; 3d8e: 69 40
    lsr                                                               ; 3d90: 4a
    lsr                                                               ; 3d91: 4a
    lsr                                                               ; 3d92: 4a
    tay                                                               ; 3d93: a8
    lda #spriteid_rope                                                ; 3d94: a9 cb
draw_vertical_rope1_loop
    jsr draw_sprite_a_at_cell_xy                                      ; 3d96: 20 4c 1f
    dey                                                               ; 3d99: 88
    cpy #3                                                            ; 3d9a: c0 03
    bcs draw_vertical_rope1_loop                                      ; 3d9c: b0 f8
    lda #$0a                                                          ; 3d9e: a9 0a
    jsr set_object_position_from_cell_xy                              ; 3da0: 20 5d 1f
    lda #spriteid_umbrella                                            ; 3da3: a9 cd
    sta object_spriteid + objectid_umbrella                           ; 3da5: 8d b2 09
    lda save_game_level_n_partition_y                                 ; 3da8: ad 4a 0a
    sec                                                               ; 3dab: 38
    sbc #4                                                            ; 3dac: e9 04
    lsr                                                               ; 3dae: 4a
    lsr                                                               ; 3daf: 4a
    lsr                                                               ; 3db0: 4a
    tay                                                               ; 3db1: a8
    ldx #$20 ; ' '                                                    ; 3db2: a2 20
    lda #spriteid_rope                                                ; 3db4: a9 cb
draw_vertical_rope2_loop
    jsr draw_sprite_a_at_cell_xy                                      ; 3db6: 20 4c 1f
    dey                                                               ; 3db9: 88
    cpy #3                                                            ; 3dba: c0 03
    bcs draw_vertical_rope2_loop                                      ; 3dbc: b0 f8
; initialise fire
    lda #objectid_fire1                                               ; 3dbe: a9 04
    jsr set_object_position_from_cell_xy                              ; 3dc0: 20 5d 1f
    lda #objectid_fire2                                               ; 3dc3: a9 05
    jsr set_object_position_from_cell_xy                              ; 3dc5: 20 5d 1f
; initialise partition
    lda #spriteid_partition                                           ; 3dc8: a9 ce
    sta object_spriteid + objectid_partition_end                      ; 3dca: 8d ac 09
    lda #$c0                                                          ; 3dcd: a9 c0
    sta object_z_order + objectid_partition_end                       ; 3dcf: 8d c6 38
    lda #spriteid_partition_end                                       ; 3dd2: a9 cf
    sta object_spriteid + objectid_partition                          ; 3dd4: 8d ad 09
    lda #spriteid_erase1                                              ; 3dd7: a9 d0
    sta object_erase_type + objectid_partition                        ; 3dd9: 8d b1 38
update_partition_and_umbrella_local
    jmp update_partition_and_umbrella                                 ; 3ddc: 4c 16 3e

update_room_0
    lda desired_room_index                                            ; 3ddf: a5 30
    cmp #0                                                            ; 3de1: c9 00                   ; redundant instruction
    bne update_partition_and_umbrella                                 ; 3de3: d0 31
; branch if partition is fully down
    lda save_game_level_n_partition_y                                 ; 3de5: ad 4a 0a
    cmp #$60 ; '`'                                                    ; 3de8: c9 60
    beq update_partition_and_umbrella                                 ; 3dea: f0 2a
; branch if partition is fully up
    cmp #$40 ; '@'                                                    ; 3dec: c9 40
    beq set_partition_down_and_umbrella_up                            ; 3dee: f0 11
; umbrella and partition are moving
    lda #spriteid_one_pixel_masked_out                                ; 3df0: a9 00
    sta object_spriteid_old + objectid_umbrella                       ; 3df2: 8d bd 09
    lda #$60 ; '`'                                                    ; 3df5: a9 60
    ldx #<sound1                                                      ; 3df7: a2 18
    ldy #>sound1                                                      ; 3df9: a0 45
    jsr play_sound_yx                                                 ; 3dfb: 20 f6 38
    jmp update_partition_and_umbrella                                 ; 3dfe: 4c 16 3e

set_partition_down_and_umbrella_up
    lda object_y_low + objectid_partition_end                         ; 3e01: ad 80 09
    cmp save_game_level_n_partition_y                                 ; 3e04: cd 4a 0a
    beq update_partition_and_umbrella                                 ; 3e07: f0 0d
; move umbrella
    lda #spriteid_one_pixel_masked_out                                ; 3e09: a9 00
    sta object_spriteid_old + objectid_umbrella                       ; 3e0b: 8d bd 09
    lda #$60 ; '`'                                                    ; 3e0e: a9 60
    jsr update_sound_priorities                                       ; 3e10: 20 85 3e
    jsr play_landing_sound                                            ; 3e13: 20 a9 23
update_partition_and_umbrella
    lda desired_room_index                                            ; 3e16: a5 30
    cmp #0                                                            ; 3e18: c9 00
    bne check_for_moving_partition_up                                 ; 3e1a: d0 52
; set partition y position
    lda save_game_level_n_partition_y                                 ; 3e1c: ad 4a 0a
    sta object_y_low + objectid_partition_end                         ; 3e1f: 8d 80 09
    sta object_y_low + objectid_partition                             ; 3e22: 8d 81 09
; set umbrella y position
    lda #$60 ; '`'                                                    ; 3e25: a9 60
    sec                                                               ; 3e27: 38
    sbc save_game_level_n_partition_y                                 ; 3e28: ed 4a 0a
    clc                                                               ; 3e2b: 18
    adc #$44 ; 'D'                                                    ; 3e2c: 69 44
    sta object_y_low + objectid_umbrella                              ; 3e2e: 8d 86 09
; update collision map at partition
    ldx #$20 ; ' '                                                    ; 3e31: a2 20
    lda save_game_level_n_partition_y                                 ; 3e33: ad 4a 0a
    lsr                                                               ; 3e36: 4a
    lsr                                                               ; 3e37: 4a
    lsr                                                               ; 3e38: 4a
    tay                                                               ; 3e39: a8
    lda #1                                                            ; 3e3a: a9 01
    sta width_in_cells                                                ; 3e3c: 85 3c
    lda #4                                                            ; 3e3e: a9 04
    sta height_in_cells                                               ; 3e40: 85 3d
    lda #collision_map_solid_rock                                     ; 3e42: a9 03
    sta value_to_write_to_collision_map                               ; 3e44: 85 3e
    jsr read_collision_map_value_for_xy                               ; 3e46: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3e49: c5 3e
    beq check_for_changing_partition_collision_map                    ; 3e4b: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e4d: 20 44 1e
check_for_changing_partition_collision_map
    tya                                                               ; 3e50: 98
    clc                                                               ; 3e51: 18
    adc height_in_cells                                               ; 3e52: 65 3d
    tay                                                               ; 3e54: a8
    sta temp_y                                                        ; 3e55: 85 70
    lda #$10                                                          ; 3e57: a9 10
    sec                                                               ; 3e59: 38
    sbc temp_y                                                        ; 3e5a: e5 70
    beq check_for_moving_partition_up                                 ; 3e5c: f0 10
    sta height_in_cells                                               ; 3e5e: 85 3d
    lda #collision_map_none                                           ; 3e60: a9 00
    sta value_to_write_to_collision_map                               ; 3e62: 85 3e
    jsr read_collision_map_value_for_xy                               ; 3e64: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3e67: c5 3e
    beq check_for_moving_partition_up                                 ; 3e69: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e6b: 20 44 1e
; check for first update in room (branch if so)
check_for_moving_partition_up
    lda update_room_first_update_flag                                 ; 3e6e: ad 2b 13
    bne return2                                                       ; 3e71: d0 11
; if partition is fully down, then return
    lda save_game_level_n_partition_y                                 ; 3e73: ad 4a 0a
    cmp #$60 ; '`'                                                    ; 3e76: c9 60
    beq return2                                                       ; 3e78: f0 0a
; if partition is fully up, then return
    cmp #$40 ; '@'                                                    ; 3e7a: c9 40
    beq return2                                                       ; 3e7c: f0 06
; move partition up
    sec                                                               ; 3e7e: 38
    sbc #4                                                            ; 3e7f: e9 04
    sta save_game_level_n_partition_y                                 ; 3e81: 8d 4a 0a
return2
    rts                                                               ; 3e84: 60

update_sound_priorities
    cmp sound_priority_per_channel_table                              ; 3e85: cd 6f 39
    bcc return3                                                       ; 3e88: 90 08
    lda #0                                                            ; 3e8a: a9 00
    sta sound_priority_per_channel_table                              ; 3e8c: 8d 6f 39
    sta sound_priority_per_channel_table + 1                          ; 3e8f: 8d 70 39
return3
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
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
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
; draw boulder at (15,20) of size (3x2)
    lda #3                                                            ; 3ef1: a9 03
    sta width_in_cells                                                ; 3ef3: 85 3c
    lda #2                                                            ; 3ef5: a9 02
    sta height_in_cells                                               ; 3ef7: 85 3d
    ldx #$0f                                                          ; 3ef9: a2 0f
    ldy #$14                                                          ; 3efb: a0 14
    lda #spriteid_boulder                                             ; 3efd: a9 cc
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3eff: 20 57 1f
; draw boulder at (3,20) of size (3x2)
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
    sta room_exit_direction                                           ; 3f1b: 85 70
    and #exit_room_top                                                ; 3f1d: 29 08
    beq room_1_check_right_exit                                       ; 3f1f: f0 07
    ldx #2                                                            ; 3f21: a2 02
    ldy current_level                                                 ; 3f23: a4 31
    jmp initialise_level_and_room                                     ; 3f25: 4c 40 11

room_1_check_right_exit
    lda room_exit_direction                                           ; 3f28: a5 70
    and #exit_room_right                                              ; 3f2a: 29 04
    beq room_1_game_update_loop                                       ; 3f2c: f0 ea
    ldx #0                                                            ; 3f2e: a2 00
    ldy current_level                                                 ; 3f30: a4 31
    jmp initialise_level_and_room                                     ; 3f32: 4c 40 11

room_1_update_handler
    lda #1                                                            ; 3f35: a9 01
    sta currently_updating_logic_for_room_index                       ; 3f37: 8d ba 1a
; update brazier fires
    ldx #3                                                            ; 3f3a: a2 03
    ldy #$0e                                                          ; 3f3c: a0 0e
    lda #objectid_fire1                                               ; 3f3e: a9 04
    jsr update_brazier_and_fire                                       ; 3f40: 20 88 19
    ldx #$25 ; '%'                                                    ; 3f43: a2 25
    lda #objectid_fire2                                               ; 3f45: a9 05
    jmp update_brazier_and_fire                                       ; 3f47: 4c 88 19

draw_3x2_boulder_to_screen
    ldx #3                                                            ; 3f4a: a2 03
    ldy #2                                                            ; 3f4c: a0 02
    lda #1                                                            ; 3f4e: a9 01
    sta width_in_cells                                                ; 3f50: 85 3c
    sta height_in_cells                                               ; 3f52: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f54: 20 bb 1a
    ldx #$24 ; '$'                                                    ; 3f57: a2 24
    jmp copy_rectangle_of_memory_to_screen                            ; 3f59: 4c bb 1a

draw_bell
    lda #1                                                            ; 3f5c: a9 01
    sta width_in_cells                                                ; 3f5e: 85 3c
    lda #2                                                            ; 3f60: a9 02
    sta height_in_cells                                               ; 3f62: 85 3d
    lda #$fc                                                          ; 3f64: a9 fc
    sta temp_sprite_x_offset                                          ; 3f66: 85 3a
    lda #spriteid_bell                                                ; 3f68: a9 e1
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3f6a: 20 57 1f
    lda #spriteid_rope_end1                                           ; 3f6d: a9 da
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
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
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
    jsr draw_3x2_boulder_to_screen                                    ; 3fc7: 20 4a 3f
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
; draw boulder at (34,13) of size (3x2)
    ldx #$22 ; '"'                                                    ; 3ff0: a2 22
    ldy #$0d                                                          ; 3ff2: a0 0d
    lda #3                                                            ; 3ff4: a9 03
    sta width_in_cells                                                ; 3ff6: 85 3c
    lda #2                                                            ; 3ff8: a9 02
    sta height_in_cells                                               ; 3ffa: 85 3d
    lda #spriteid_boulder                                             ; 3ffc: a9 cc
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3ffe: 20 57 1f
    ldy #6                                                            ; 4001: a0 06
    ldx #$16                                                          ; 4003: a2 16
    jsr draw_bell                                                     ; 4005: 20 5c 3f
; draw clanger end at (22,6)
    lda #spriteid_clanger_end                                         ; 4008: a9 e7
    jsr draw_sprite_a_at_cell_xy                                      ; 400a: 20 4c 1f
    ldx #$1b                                                          ; 400d: a2 1b
    jsr draw_bell                                                     ; 400f: 20 5c 3f
; draw clanger end at (27,6)
    lda #spriteid_clanger_end                                         ; 4012: a9 e7
    jsr draw_sprite_a_at_cell_xy                                      ; 4014: 20 4c 1f
    ldx #$20 ; ' '                                                    ; 4017: a2 20
    jsr draw_bell                                                     ; 4019: 20 5c 3f
; draw clanger end at (32,6)
    lda #spriteid_clanger_end                                         ; 401c: a9 e7
    jsr draw_sprite_a_at_cell_xy                                      ; 401e: 20 4c 1f
    jsr start_room                                                    ; 4021: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 4024: 20 da 12
    sta room_exit_direction                                           ; 4027: 85 70
    and #exit_room_left                                               ; 4029: 29 01
    beq room_2_check_bottom_exit                                      ; 402b: f0 07
    ldx #3                                                            ; 402d: a2 03
    ldy current_level                                                 ; 402f: a4 31
    jmp initialise_level_and_room                                     ; 4031: 4c 40 11

room_2_check_bottom_exit
    lda room_exit_direction                                           ; 4034: a5 70
    and #exit_room_bottom                                             ; 4036: 29 02
    beq room_2_game_update_loop                                       ; 4038: f0 ea
    ldx #1                                                            ; 403a: a2 01
    ldy current_level                                                 ; 403c: a4 31
    jmp initialise_level_and_room                                     ; 403e: 4c 40 11

bell_animations
    !byte 0                                                           ; 4041: 00
bell_stopped_animation
    !byte 0, 0                                                        ; 4042: 00 00
    !byte $80                                                         ; 4044: 80
bell_move_sideways_animation
    !byte 8, 0                                                        ; 4045: 08 00
    !byte $80                                                         ; 4047: 80
bell_fall_sideways_animation
    !byte 8, 2                                                        ; 4048: 08 02
    !byte 8, 2                                                        ; 404a: 08 02
    !byte 8, 4                                                        ; 404c: 08 04
    !byte 8, 4                                                        ; 404e: 08 04
    !byte 8, 6                                                        ; 4050: 08 06
    !byte 8, 6                                                        ; 4052: 08 06
    !byte $80                                                         ; 4054: 80
bell_fall_animation
    !byte 0, 8                                                        ; 4055: 00 08
    !byte $80                                                         ; 4057: 80

; odd that this function mostly updates the bell normally in room 1, but also the
; braziers in room 2
room_2_update_handler
    lda #2                                                            ; 4058: a9 02
    sta currently_updating_logic_for_room_index                       ; 405a: 8d ba 1a
    ldx #3                                                            ; 405d: a2 03
    ldy #6                                                            ; 405f: a0 06
    lda #objectid_fire1                                               ; 4061: a9 04
    jsr update_brazier_and_fire                                       ; 4063: 20 88 19
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 4066: ad 2b 13
    beq room_2_not_first_update                                       ; 4069: f0 7b
; initialise envelopes
    ldx #<envelope1                                                   ; 406b: a2 0a
    ldy #>envelope1                                                   ; 406d: a0 45
    jsr define_envelope                                               ; 406f: 20 5e 39
    ldx #<envelope2                                                   ; 4072: a2 20
    ldy #>envelope2                                                   ; 4074: a0 45
    jsr define_envelope                                               ; 4076: 20 5e 39
; check for level change (branch if not)
    lda current_level                                                 ; 4079: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 407b: c5 51
    beq room_change_only                                              ; 407d: f0 32
; initialise bell position in room 1
    lda save_game_level_n_bell_animation                              ; 407f: ad 4d 0a
    cmp #bell_stopped_animation - bell_animations                     ; 4082: c9 01
    beq room_change_only                                              ; 4084: f0 2b
    dec fast_forward_bell_counter                                     ; 4086: ce 73 0a
    ora #0                                                            ; 4089: 09 00
    bne room_change_only                                              ; 408b: d0 24
    inc fast_forward_bell_counter                                     ; 408d: ee 73 0a
; initialise bell in room 1
    lda #1                                                            ; 4090: a9 01
    sta save_game_level_n_bell_room                                   ; 4092: 8d 53 0a
    lda #$98                                                          ; 4095: a9 98
    sta save_game_level_n_bell_x_low                                  ; 4097: 8d 4f 0a
    lda #0                                                            ; 409a: a9 00
    sta save_game_level_n_bell_x_high                                 ; 409c: 8d 50 0a
    lda #$28 ; '('                                                    ; 409f: a9 28
    sta save_game_level_n_bell_y_low                                  ; 40a1: 8d 51 0a
    lda #0                                                            ; 40a4: a9 00
    sta save_game_level_n_bell_y_high                                 ; 40a6: 8d 52 0a
    lda #bell_stopped_animation - bell_animations                     ; 40a9: a9 01
    sta save_game_level_n_bell_animation                              ; 40ab: 8d 4d 0a
    sta save_game_level_n_bell_animation_step                         ; 40ae: 8d 4e 0a
room_change_only
    lda #spriteid_erase4                                              ; 40b1: a9 e2
    sta object_erase_type + objectid_bell                             ; 40b3: 8d ae 38
    lda #$c0                                                          ; 40b6: a9 c0
    sta object_z_order + objectid_bell                                ; 40b8: 8d c4 38
    lda desired_room_index                                            ; 40bb: a5 30
    cmp save_game_level_n_bell_room                                   ; 40bd: cd 53 0a
    bne initialise_bell_collision_map                                 ; 40c0: d0 1c
    jsr set_bell_object                                               ; 40c2: 20 f0 42
fast_forward_bell_animation
    lda desired_room_index                                            ; 40c5: a5 30
    cmp save_game_level_n_bell_room                                   ; 40c7: cd 53 0a
    bne initialise_bell_collision_map                                 ; 40ca: d0 12
    lda fast_forward_bell_counter                                     ; 40cc: ad 73 0a
    beq initialise_bell_collision_map                                 ; 40cf: f0 0d
    cmp #$ff                                                          ; 40d1: c9 ff
    beq more_fast_forwarding_needed                                   ; 40d3: f0 03
    dec fast_forward_bell_counter                                     ; 40d5: ce 73 0a
more_fast_forwarding_needed
    jsr update_bell                                                   ; 40d8: 20 7b 41
    jmp fast_forward_bell_animation                                   ; 40db: 4c c5 40

initialise_bell_collision_map
    lda #collision_map_solid_rock                                     ; 40de: a9 03
    jsr write_bell_to_collision_map                                   ; 40e0: 20 0e 43
    jmp return4                                                       ; 40e3: 4c 77 41

room_2_not_first_update
    lda desired_room_index                                            ; 40e6: a5 30
    cmp save_game_level_n_bell_room                                   ; 40e8: cd 53 0a
    beq bell_in_room                                                  ; 40eb: f0 0b
; update fast forward counter when bell is not in the room
    lda fast_forward_bell_counter                                     ; 40ed: ad 73 0a
    bmi return4_local                                                 ; 40f0: 30 03
    inc fast_forward_bell_counter                                     ; 40f2: ee 73 0a
return4_local
    jmp return4                                                       ; 40f5: 4c 77 41

bell_in_room
    lda #$40 ; '@'                                                    ; 40f8: a9 40
    jsr update_sound_priorities                                       ; 40fa: 20 85 3e
    jsr update_bell                                                   ; 40fd: 20 7b 41
    lda desired_room_index                                            ; 4100: a5 30
    cmp save_game_level_n_bell_room                                   ; 4102: cd 53 0a
    beq update_bell_if_falling_sideways                               ; 4105: f0 08
; start counting the number of ticks the bell is off screen
    lda #0                                                            ; 4107: a9 00
    sta fast_forward_bell_counter                                     ; 4109: 8d 73 0a
    jmp return4                                                       ; 410c: 4c 77 41

update_bell_if_falling_sideways
    lda save_game_level_n_bell_animation                              ; 410f: ad 4d 0a
    cmp #bell_fall_sideways_animation - bell_animations               ; 4112: c9 07
    bne update_bell_if_moving_sideways                                ; 4114: d0 1b
    lda save_game_level_n_bell_direction                              ; 4116: ad 54 0a
    bpl adjust_collision_check_when_moving_right                      ; 4119: 10 03
    jmp check_for_bell_room_collision                                 ; 411b: 4c 24 41

adjust_collision_check_when_moving_right
    inc temp_right_offset                                             ; 411e: ee d1 24
    inc temp_left_offset                                              ; 4121: ee d0 24
check_for_bell_room_collision
    lda #1                                                            ; 4124: a9 01
    sta temp_bottom_offset                                            ; 4126: 8d 51 25
    lda #objectid_bell                                                ; 4129: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 412b: 20 94 28
    bne play_landing_sound_local                                      ; 412e: d0 1b
    rts                                                               ; 4130: 60

update_bell_if_moving_sideways
    lda save_game_level_n_bell_animation                              ; 4131: ad 4d 0a
    cmp #bell_move_sideways_animation - bell_animations               ; 4134: c9 04
    bne check_collision_if_falling                                    ; 4136: d0 16
    inc temp_right_offset                                             ; 4138: ee d1 24
    lda #2                                                            ; 413b: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 413d: 20 94 28
    bne play_landing_sound_local                                      ; 4140: d0 09
; play bell sliding sound
    lda #$40 ; '@'                                                    ; 4142: a9 40
    ldx #<sound1                                                      ; 4144: a2 18
    ldy #>sound1                                                      ; 4146: a0 45
    jmp play_sound_yx                                                 ; 4148: 4c f6 38

play_landing_sound_local
    jmp play_landing_sound                                            ; 414b: 4c a9 23

check_collision_if_falling
    cmp #bell_fall_animation - bell_animations                        ; 414e: c9 14
    bne write_static_bell_to_collision_map                            ; 4150: d0 20
; check for collision with ground
    inc temp_left_offset                                              ; 4152: ee d0 24
    lda #2                                                            ; 4155: a9 02
    sta temp_bottom_offset                                            ; 4157: 8d 51 25
    lda #2                                                            ; 415a: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 415c: 20 94 28
    beq return4                                                       ; 415f: f0 16
; bell hit rock
    lda #0                                                            ; 4161: a9 00
    ldx #<sound2                                                      ; 4163: a2 36
    ldy #>sound2                                                      ; 4165: a0 45
    jsr play_sound_yx                                                 ; 4167: 20 f6 38
    ldx #<sound3                                                      ; 416a: a2 2e
    ldy #>sound3                                                      ; 416c: a0 45
    jsr play_sound_yx                                                 ; 416e: 20 f6 38
    rts                                                               ; 4171: 60

write_static_bell_to_collision_map
    lda #collision_map_solid_rock                                     ; 4172: a9 03
    jsr write_bell_to_collision_map                                   ; 4174: 20 0e 43
return4
    rts                                                               ; 4177: 60

store_bell_animation_step_local
    jmp store_bell_animation_step                                     ; 4178: 4c 66 42

update_bell
    lda save_game_level_n_bell_animation_step                         ; 417b: ad 4e 0a
    clc                                                               ; 417e: 18
    adc #2                                                            ; 417f: 69 02
    tay                                                               ; 4181: a8
    lda bell_animations,y                                             ; 4182: b9 41 40
    cmp #$80                                                          ; 4185: c9 80
    bne got_bell_animation_step_in_y                                  ; 4187: d0 03
    ldy save_game_level_n_bell_animation                              ; 4189: ac 4d 0a
got_bell_animation_step_in_y
    lda save_game_level_n_bell_animation                              ; 418c: ad 4d 0a
    cmp #bell_stopped_animation - bell_animations                     ; 418f: c9 01
    bne bell_is_moving                                                ; 4191: d0 5c
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 4193: ad 2b 13
    bne store_bell_animation_step_local                               ; 4196: d0 e0
; check for player bell collision (branch if none)
    dec temp_left_offset                                              ; 4198: ce d0 24
    ldx #objectid_player                                              ; 419b: a2 00
    sty remember_y1                                                   ; 419d: 8c ef 42
    ldy #objectid_bell                                                ; 41a0: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 41a2: 20 e2 28
    ldy remember_y1                                                   ; 41a5: ac ef 42
    ora #0                                                            ; 41a8: 09 00
    beq store_bell_animation_step_local                               ; 41aa: f0 cc
; we have a collision. Check the player is below the bell?
    lda object_y_low                                                  ; 41ac: ad 7c 09
    sec                                                               ; 41af: 38
    sbc save_game_level_n_bell_y_low                                  ; 41b0: ed 51 0a
    lda object_y_high                                                 ; 41b3: ad 92 09
    sbc save_game_level_n_bell_y_high                                 ; 41b6: ed 52 0a
    bmi store_bell_animation_step_local                               ; 41b9: 30 bd
; find left or right direction of impact
    ldx #1                                                            ; 41bb: a2 01
    lda object_room_collision_flags                                   ; 41bd: ad d8 38
    and #object_collided_right_wall                                   ; 41c0: 29 04
    bne got_direction_in_x                                            ; 41c2: d0 09
    ldx #$ff                                                          ; 41c4: a2 ff
    lda object_room_collision_flags                                   ; 41c6: ad d8 38
    and #object_collided_left_wall                                    ; 41c9: 29 01
    beq store_bell_animation_step_local                               ; 41cb: f0 ab
got_direction_in_x
    stx save_game_level_n_bell_direction                              ; 41cd: 8e 54 0a
; bell is about to move. clear it from the collision map
    lda #collision_map_none                                           ; 41d0: a9 00
    jsr write_bell_to_collision_map                                   ; 41d2: 20 0e 43
    lda #spriteid_clanger_menu_item                                   ; 41d5: a9 e0
    cmp player_using_object_spriteid                                  ; 41d7: cd b6 2e
    bne set_bell_moving_sideways                                      ; 41da: d0 0e
; clanging bell, not moving it
    lda #0                                                            ; 41dc: a9 00
    ldx #<sound4                                                      ; 41de: a2 4c
    ldy #>sound4                                                      ; 41e0: a0 45
    jsr play_sound_yx                                                 ; 41e2: 20 f6 38
    lda #$ff                                                          ; 41e5: a9 ff
    sta player_is_currently_clanging_the_bell                         ; 41e7: 8d 74 0a
set_bell_moving_sideways
    ldy #bell_move_sideways_animation - bell_animations               ; 41ea: a0 04
    sty save_game_level_n_bell_animation                              ; 41ec: 8c 4d 0a
bell_is_moving
    lda save_game_level_n_bell_animation                              ; 41ef: ad 4d 0a
    cmp #bell_move_sideways_animation - bell_animations               ; 41f2: c9 04
    bne check_if_bell_is_falling_sideways                             ; 41f4: d0 3f
    lda save_game_level_n_bell_direction                              ; 41f6: ad 54 0a
    bmi check_bell_falling_rock_collision                             ; 41f9: 30 09
    inc temp_right_offset                                             ; 41fb: ee d1 24
    inc temp_left_offset                                              ; 41fe: ee d0 24
    jmp check_bell_falling_rock_collision                             ; 4201: 4c 04 42                ; redundant instruction

check_bell_falling_rock_collision
    lda #objectid_bell                                                ; 4204: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4206: 20 94 28
    bne stop_bell                                                     ; 4209: d0 51
    lda save_game_level_n_bell_direction                              ; 420b: ad 54 0a
    bmi set_bell_moving_right                                         ; 420e: 30 07
    lda #9                                                            ; 4210: a9 09
    sta temp_left_offset                                              ; 4212: 8d d0 24
    bne check_bell_moving_rock_collision                              ; 4215: d0 05
set_bell_moving_right
    lda #$f8                                                          ; 4217: a9 f8
    sta temp_right_offset                                             ; 4219: 8d d1 24
check_bell_moving_rock_collision
    lda #2                                                            ; 421c: a9 02
    sta temp_bottom_offset                                            ; 421e: 8d 51 25
    lda #3                                                            ; 4221: a9 03
    sta temp_default_collision_map_option                             ; 4223: 8d e1 28
    lda #objectid_bell                                                ; 4226: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4228: 20 94 28
    bne store_bell_animation_step                                     ; 422b: d0 39
; set bell falling sideways
    ldy #bell_fall_sideways_animation - bell_animations               ; 422d: a0 07
    sty save_game_level_n_bell_animation                              ; 422f: 8c 4d 0a
    jmp store_bell_animation_step                                     ; 4232: 4c 66 42

check_if_bell_is_falling_sideways
    lda save_game_level_n_bell_animation                              ; 4235: ad 4d 0a
    cmp #bell_fall_sideways_animation - bell_animations               ; 4238: c9 07
    bne check_if_falling_straight_down                                ; 423a: d0 0a
; check if at end of animation (looped)
    cpy save_game_level_n_bell_animation                              ; 423c: cc 4d 0a
    bne store_bell_animation_step                                     ; 423f: d0 25
; set bell falling straight down
    ldy #bell_fall_animation - bell_animations                        ; 4241: a0 14
    sty save_game_level_n_bell_animation                              ; 4243: 8c 4d 0a
check_if_falling_straight_down
    lda save_game_level_n_bell_animation                              ; 4246: ad 4d 0a
    cmp #bell_fall_animation - bell_animations                        ; 4249: c9 14
    bne store_bell_animation_step                                     ; 424b: d0 19
; bell is falling straight down
    inc temp_left_offset                                              ; 424d: ee d0 24
    lda #2                                                            ; 4250: a9 02
    sta temp_bottom_offset                                            ; 4252: 8d 51 25
    lda #objectid_bell                                                ; 4255: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4257: 20 94 28
    beq store_bell_animation_step                                     ; 425a: f0 0a
stop_bell
    lda #0                                                            ; 425c: a9 00
    sta fast_forward_bell_counter                                     ; 425e: 8d 73 0a
    ldy #bell_stopped_animation - bell_animations                     ; 4261: a0 01
    sty save_game_level_n_bell_animation                              ; 4263: 8c 4d 0a
store_bell_animation_step
    sty save_game_level_n_bell_animation_step                         ; 4266: 8c 4e 0a
    lda bell_animations,y                                             ; 4269: b9 41 40
    ldx save_game_level_n_bell_direction                              ; 426c: ae 54 0a
    bpl sign_extend_a_to_ax                                           ; 426f: 10 05
    eor #$ff                                                          ; 4271: 49 ff
    clc                                                               ; 4273: 18
    adc #1                                                            ; 4274: 69 01
sign_extend_a_to_ax
    ldx #0                                                            ; 4276: a2 00
    ora #0                                                            ; 4278: 09 00
    bpl add_animation_offsets_to_position                             ; 427a: 10 01
    dex                                                               ; 427c: ca
add_animation_offsets_to_position
    clc                                                               ; 427d: 18
    adc save_game_level_n_bell_x_low                                  ; 427e: 6d 4f 0a
    sta save_game_level_n_bell_x_low                                  ; 4281: 8d 4f 0a
    txa                                                               ; 4284: 8a
    adc save_game_level_n_bell_x_high                                 ; 4285: 6d 50 0a
    sta save_game_level_n_bell_x_high                                 ; 4288: 8d 50 0a
    iny                                                               ; 428b: c8
    lda bell_animations,y                                             ; 428c: b9 41 40
    clc                                                               ; 428f: 18
    adc save_game_level_n_bell_y_low                                  ; 4290: 6d 51 0a
    sta save_game_level_n_bell_y_low                                  ; 4293: 8d 51 0a
    lda #0                                                            ; 4296: a9 00
    adc save_game_level_n_bell_y_high                                 ; 4298: 6d 52 0a
    sta save_game_level_n_bell_y_high                                 ; 429b: 8d 52 0a
    jsr set_bell_object                                               ; 429e: 20 f0 42
; get extents of bell object
    ldx #objectid_bell                                                ; 42a1: a2 02
    jsr find_left_and_right_of_object                                 ; 42a3: 20 34 24
    jsr find_top_and_bottom_of_object                                 ; 42a6: 20 d2 24
; check if bell is moving sideways (return if not)
    lda save_game_level_n_bell_animation                              ; 42a9: ad 4d 0a
    cmp #bell_move_sideways_animation - bell_animations               ; 42ac: c9 04
    bne return5                                                       ; 42ae: d0 3e
; check if bell has moved offscreen, into the next room
    lda save_game_level_n_bell_direction                              ; 42b0: ad 54 0a
    bmi move_bell_left_one_room_if_needed                             ; 42b3: 30 1c
    lda object_left_cell_x                                            ; 42b5: a5 78
    cmp #game_area_width_cells                                        ; 42b7: c9 28
    bcc return5                                                       ; 42b9: 90 33
; move ball right one room
    lda save_game_level_n_bell_x_low                                  ; 42bb: ad 4f 0a
    sec                                                               ; 42be: 38
    sbc #$40 ; '@'                                                    ; 42bf: e9 40
    sta save_game_level_n_bell_x_low                                  ; 42c1: 8d 4f 0a
    lda #0                                                            ; 42c4: a9 00
    sbc #0                                                            ; 42c6: e9 00
    sta save_game_level_n_bell_x_high                                 ; 42c8: 8d 50 0a
    dec save_game_level_n_bell_room                                   ; 42cb: ce 53 0a
    jmp hide_bell                                                     ; 42ce: 4c e9 42

move_bell_left_one_room_if_needed
    lda object_right_cell_x                                           ; 42d1: a5 79
    bpl return5                                                       ; 42d3: 10 19
    lda save_game_level_n_bell_x_low                                  ; 42d5: ad 4f 0a
    clc                                                               ; 42d8: 18
    adc #$40 ; '@'                                                    ; 42d9: 69 40
    sta save_game_level_n_bell_x_low                                  ; 42db: 8d 4f 0a
    lda #1                                                            ; 42de: a9 01
    sta save_game_level_n_bell_x_high                                 ; 42e0: 8d 50 0a
    inc save_game_level_n_bell_room                                   ; 42e3: ee 53 0a
    jmp hide_bell                                                     ; 42e6: 4c e9 42                ; redundant instruction

hide_bell
    lda #spriteid_one_pixel_masked_out                                ; 42e9: a9 00
    sta object_spriteid + objectid_bell                               ; 42eb: 8d aa 09
return5
    rts                                                               ; 42ee: 60

remember_y1
    !byte 0                                                           ; 42ef: 00

set_bell_object
    lda save_game_level_n_bell_x_low                                  ; 42f0: ad 4f 0a
    sta object_x_low + objectid_bell                                  ; 42f3: 8d 52 09
    lda save_game_level_n_bell_x_high                                 ; 42f6: ad 50 0a
    sta object_x_high + objectid_bell                                 ; 42f9: 8d 68 09
    lda save_game_level_n_bell_y_low                                  ; 42fc: ad 51 0a
    sta object_y_low + objectid_bell                                  ; 42ff: 8d 7e 09
    lda save_game_level_n_bell_y_high                                 ; 4302: ad 52 0a
    sta object_y_high + objectid_bell                                 ; 4305: 8d 94 09
    lda #spriteid_bell                                                ; 4308: a9 e1
    sta object_spriteid + objectid_bell                               ; 430a: 8d aa 09
    rts                                                               ; 430d: 60

write_bell_to_collision_map
    sta value_to_write_to_collision_map                               ; 430e: 85 3e
    ora #0                                                            ; 4310: 09 00
    beq validated_the_write                                           ; 4312: f0 07
    lda save_game_level_n_bell_animation                              ; 4314: ad 4d 0a
    cmp #bell_stopped_animation - bell_animations                     ; 4317: c9 01
    bne return6                                                       ; 4319: d0 39
validated_the_write
    lda desired_room_index                                            ; 431b: a5 30
    cmp save_game_level_n_bell_room                                   ; 431d: cd 53 0a
    bne return6                                                       ; 4320: d0 32
    lda save_game_level_n_bell_x_high                                 ; 4322: ad 50 0a
    lsr                                                               ; 4325: 4a
    sta temp_x                                                        ; 4326: 85 70
    lda save_game_level_n_bell_x_low                                  ; 4328: ad 4f 0a
    ror                                                               ; 432b: 6a
    lsr temp_x                                                        ; 432c: 46 70
    ror                                                               ; 432e: 6a
    lsr temp_x                                                        ; 432f: 46 70
    ror                                                               ; 4331: 6a
    tax                                                               ; 4332: aa
    lda save_game_level_n_bell_y_high                                 ; 4333: ad 52 0a
    lsr                                                               ; 4336: 4a
    sta temp_x                                                        ; 4337: 85 70
    lda save_game_level_n_bell_y_low                                  ; 4339: ad 51 0a
    ror                                                               ; 433c: 6a
    lsr temp_x                                                        ; 433d: 46 70
    ror                                                               ; 433f: 6a
    lsr temp_x                                                        ; 4340: 46 70
    ror                                                               ; 4342: 6a
    tay                                                               ; 4343: a8
    lda #2                                                            ; 4344: a9 02
    sta width_in_cells                                                ; 4346: 85 3c
    sta height_in_cells                                               ; 4348: 85 3d
    jsr read_collision_map_value_for_xy                               ; 434a: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 434d: c5 3e
    beq return6                                                       ; 434f: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 4351: 20 44 1e
return6
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
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
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
    jsr draw_3x2_boulder_to_screen                                    ; 439e: 20 4a 3f
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
; draw boulder at (3,13) of size (3x2)
    ldx #3                                                            ; 43be: a2 03
    ldy #$0d                                                          ; 43c0: a0 0d
    lda #3                                                            ; 43c2: a9 03
    sta width_in_cells                                                ; 43c4: 85 3c
    lda #2                                                            ; 43c6: a9 02
    sta height_in_cells                                               ; 43c8: 85 3d
    lda #spriteid_boulder                                             ; 43ca: a9 cc
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 43cc: 20 57 1f
    ldy #6                                                            ; 43cf: a0 06
    ldx #7                                                            ; 43d1: a2 07
    jsr draw_bell                                                     ; 43d3: 20 5c 3f
    ldx #$0c                                                          ; 43d6: a2 0c
    jsr draw_bell                                                     ; 43d8: 20 5c 3f
; draw clanger end at (12,6)
    lda #spriteid_clanger_end                                         ; 43db: a9 e7
    jsr draw_sprite_a_at_cell_xy                                      ; 43dd: 20 4c 1f
    ldx #$11                                                          ; 43e0: a2 11
    jsr draw_bell                                                     ; 43e2: 20 5c 3f
; draw clanger end at (17,6)
    lda #spriteid_clanger_end                                         ; 43e5: a9 e7
    jsr draw_sprite_a_at_cell_xy                                      ; 43e7: 20 4c 1f
    jsr start_room                                                    ; 43ea: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 43ed: 20 da 12
    and #exit_room_right                                              ; 43f0: 29 04
    beq room_3_game_update_loop                                       ; 43f2: f0 f9
    ldx #2                                                            ; 43f4: a2 02
    ldy current_level                                                 ; 43f6: a4 31
    jmp initialise_level_and_room                                     ; 43f8: 4c 40 11

room_3_update_handler
    lda #3                                                            ; 43fb: a9 03
    sta currently_updating_logic_for_room_index                       ; 43fd: 8d ba 1a
    ldx #$25 ; '%'                                                    ; 4400: a2 25
    ldy #6                                                            ; 4402: a0 06
    lda #objectid_fire2                                               ; 4404: a9 05
    jsr update_brazier_and_fire                                       ; 4406: 20 88 19
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 4409: ad 2b 13
    beq update_clanger                                                ; 440c: f0 41
; initialise envelopes
    ldx #<envelope3                                                   ; 440e: a2 3e
    ldy #>envelope3                                                   ; 4410: a0 45
    jsr define_envelope                                               ; 4412: 20 5e 39
; initialise clanger
    lda #spriteid_clanger_menu_item                                   ; 4415: a9 e0
    sta toolbar_collectable_spriteids+1                               ; 4417: 8d e9 2e
    lda #spriteid_clanger                                             ; 441a: a9 df
    sta collectable_spriteids+1                                       ; 441c: 8d ee 2e
    lda #spriteid_using_clanger                                       ; 441f: a9 e3
    sta collectable_being_used_spriteids + 1                          ; 4421: 8d f3 2e
    lda #spriteid_erase5                                              ; 4424: a9 e5
    sta object_erase_type + objectid_clanger_end                      ; 4426: 8d af 38
    lda #$40 ; '@'                                                    ; 4429: a9 40
    sta object_z_order + objectid_clanger_end                         ; 442b: 8d c5 38
; branch if player has the clanger in the toolbox but is not holding it
    lda save_game_level_n_got_clanger                                 ; 442e: ad 4c 0a
    bne got_clanger_so_now_check_if_using_clanger                     ; 4431: d0 42
; branch (return) if not in room 3
    lda desired_room_index                                            ; 4433: a5 30
    cmp #3                                                            ; 4435: c9 03
    bne return7_local                                                 ; 4437: d0 13
; position the clanger in room 3
    ldx #6                                                            ; 4439: a2 06
    ldy #$0f                                                          ; 443b: a0 0f
    lda #objectid_clanger                                             ; 443d: a9 04
    jsr set_object_position_from_cell_xy                              ; 443f: 20 5d 1f
    lda #spriteid_erase2                                              ; 4442: a9 d2
    sta object_erase_type + objectid_clanger                          ; 4444: 8d b0 38
    lda #spriteid_clanger2                                            ; 4447: a9 e8
    sta object_spriteid + objectid_clanger                            ; 4449: 8d ac 09
return7_local
    jmp return7                                                       ; 444c: 4c 08 45

update_clanger
    lda save_game_level_n_got_clanger                                 ; 444f: ad 4c 0a
    bne got_clanger_so_now_check_if_using_clanger                     ; 4452: d0 21
    lda desired_room_index                                            ; 4454: a5 30
    cmp #3                                                            ; 4456: c9 03
    bne return7_local2                                                ; 4458: d0 18
    ldx #objectid_old_player                                          ; 445a: a2 0b
    ldy #4                                                            ; 445c: a0 04
    jsr test_for_collision_between_objects_x_and_y                    ; 445e: 20 e2 28
    beq return7_local2                                                ; 4461: f0 0f
    lda #$ff                                                          ; 4463: a9 ff
    sta save_game_level_n_got_clanger                                 ; 4465: 8d 4c 0a
    lda #spriteid_one_pixel_masked_out                                ; 4468: a9 00
    sta object_spriteid + objectid_clanger                            ; 446a: 8d ac 09
    lda #spriteid_clanger_menu_item                                   ; 446d: a9 e0
    jsr find_or_create_menu_slot_for_A                                ; 446f: 20 bd 2b
return7_local2
    jmp return7                                                       ; 4472: 4c 08 45

; hold clanger (only used when it was on the floor)
got_clanger_so_now_check_if_using_clanger
    lda #spriteid_one_pixel_masked_out                                ; 4475: a9 00
    sta object_spriteid + objectid_clanger_end                        ; 4477: 8d ab 09
    lda #spriteid_clanger_menu_item                                   ; 447a: a9 e0
    cmp player_using_object_spriteid                                  ; 447c: cd b6 2e
    bne return7_local2                                                ; 447f: d0 f1
; check if using clanger (return if not)
    lda #spriteid_holding_clanger                                     ; 4481: a9 e6
    sta object_spriteid + objectid_player_accessory                   ; 4483: 8d a9 09
    lda #objectid_player_accessory                                    ; 4486: a9 01
    jsr get_solid_rock_collision_for_object_a                         ; 4488: 20 94 28
    beq return7_local2                                                ; 448b: f0 e5
    lda object_y_low                                                  ; 448d: ad 7c 09
    cmp save_game_level_n_bell_y_low                                  ; 4490: cd 51 0a
    bcc check_collision_while_holding_clanger_then_set_using_clanger  ; 4493: 90 64
    dec temp_right_offset                                             ; 4495: ce d1 24
    ldx #objectid_player_accessory                                    ; 4498: a2 01
    ldy #objectid_bell                                                ; 449a: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 449c: 20 e2 28
    beq check_collision_while_holding_clanger_then_set_using_clanger  ; 449f: f0 58
; copy the player accessory object to the clanger object
    lda #spriteid_using_clanger                                       ; 44a1: a9 e3
    sta object_spriteid + objectid_player_accessory                   ; 44a3: 8d a9 09
    lda object_x_low + objectid_player_accessory                      ; 44a6: ad 51 09
    sta object_x_low + objectid_clanger_end                           ; 44a9: 8d 53 09
    lda object_x_high + objectid_player_accessory                     ; 44ac: ad 67 09
    sta object_x_high + objectid_clanger_end                          ; 44af: 8d 69 09
    lda object_y_low + objectid_player_accessory                      ; 44b2: ad 7d 09
    sta object_y_low + objectid_clanger_end                           ; 44b5: 8d 7f 09
    lda object_y_high + objectid_player_accessory                     ; 44b8: ad 93 09
    sta object_y_high + objectid_clanger_end                          ; 44bb: 8d 95 09
    lda object_direction + objectid_player_accessory                  ; 44be: ad bf 09
    sta object_direction + objectid_clanger_end                       ; 44c1: 8d c1 09
    lda #spriteid_using_clanger_end                                   ; 44c4: a9 e4
    sta object_spriteid + objectid_clanger_end                        ; 44c6: 8d ab 09
    inc temp_right_offset                                             ; 44c9: ee d1 24
    dec temp_left_offset                                              ; 44cc: ce d0 24
    inc temp_right_offset                                             ; 44cf: ee d1 24
    lda #1                                                            ; 44d2: a9 01
    jsr get_solid_rock_collision_for_object_a                         ; 44d4: 20 94 28
    beq return7                                                       ; 44d7: f0 2f
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 44d9: ad 2b 13
    bne return7                                                       ; 44dc: d0 2a
    lda #spriteid_clanger_menu_item                                   ; 44de: a9 e0
    cmp previous_player_using_object_spriteid                         ; 44e0: cd b7 2e
    beq return7                                                       ; 44e3: f0 23
    lda player_is_currently_clanging_the_bell                         ; 44e5: ad 74 0a
    bne return7                                                       ; 44e8: d0 1e
    dec player_is_currently_clanging_the_bell                         ; 44ea: ce 74 0a
    lda #0                                                            ; 44ed: a9 00
    ldx #<sound4                                                      ; 44ef: a2 4c
    ldy #>sound4                                                      ; 44f1: a0 45
    jsr play_sound_yx                                                 ; 44f3: 20 f6 38
    jmp return7                                                       ; 44f6: 4c 08 45

check_collision_while_holding_clanger_then_set_using_clanger
    lda #spriteid_holding_clanger                                     ; 44f9: a9 e6
    sta collectable_being_used_spriteids + 1                          ; 44fb: 8d f3 2e
    lda #0                                                            ; 44fe: a9 00
    jsr update_object_a_solid_rock_collision                          ; 4500: 20 f5 25
    lda #spriteid_using_clanger                                       ; 4503: a9 e3
    sta collectable_being_used_spriteids + 1                          ; 4505: 8d f3 2e
return7
    rts                                                               ; 4508: 60

    !byte 0                                                           ; 4509: 00
envelope1
    !byte 5                                                           ; 450a: 05                      ; envelope number
    !byte 1                                                           ; 450b: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 450c: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 450d: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 450e: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 450f: 00                      ; number of steps in section 1
    !byte 0                                                           ; 4510: 00                      ; number of steps in section 2
    !byte 0                                                           ; 4511: 00                      ; number of steps in section 3
    !byte 10                                                          ; 4512: 0a                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4513: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4514: 00                      ; change of amplitude per step during sustain phase
    !byte 216                                                         ; 4515: d8                      ; change of amplitude per step during release phase
    !byte 40                                                          ; 4516: 28                      ; target of level at end of attack phase
    !byte 0                                                           ; 4517: 00                      ; target of level at end of decay phase
sound1
    !word $10                                                         ; 4518: 10 00                   ; channel
    !word 5                                                           ; 451a: 05 00                   ; amplitude
    !word 4                                                           ; 451c: 04 00                   ; pitch
    !word 4                                                           ; 451e: 04 00                   ; duration
envelope2
    !byte 6                                                           ; 4520: 06                      ; envelope number
    !byte 1                                                           ; 4521: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 4522: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 4523: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 4524: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 4525: 00                      ; number of steps in section 1
    !byte 0                                                           ; 4526: 00                      ; number of steps in section 2
    !byte 0                                                           ; 4527: 00                      ; number of steps in section 3
    !byte 55                                                          ; 4528: 37                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4529: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 452a: 00                      ; change of amplitude per step during sustain phase
    !byte 250                                                         ; 452b: fa                      ; change of amplitude per step during release phase
    !byte 110                                                         ; 452c: 6e                      ; target of level at end of attack phase
    !byte 55                                                          ; 452d: 37                      ; target of level at end of decay phase
sound3
    !word $10                                                         ; 452e: 10 00                   ; channel
    !word 6                                                           ; 4530: 06 00                   ; amplitude
    !word 7                                                           ; 4532: 07 00                   ; pitch
    !word 1                                                           ; 4534: 01 00                   ; duration
sound2
    !word $11                                                         ; 4536: 11 00                   ; channel
    !word 0                                                           ; 4538: 00 00                   ; amplitude
    !word 210                                                         ; 453a: d2 00                   ; pitch
    !word 1                                                           ; 453c: 01 00                   ; duration
envelope3
    !byte 7                                                           ; 453e: 07                      ; envelope number
    !byte 1                                                           ; 453f: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 4540: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 4541: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 4542: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 4543: 00                      ; number of steps in section 1
    !byte 0                                                           ; 4544: 00                      ; number of steps in section 2
    !byte 0                                                           ; 4545: 00                      ; number of steps in section 3
    !byte 55                                                          ; 4546: 37                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4547: 00                      ; change of amplitude per step during decay phase
    !byte 254                                                         ; 4548: fe                      ; change of amplitude per step during sustain phase
    !byte 252                                                         ; 4549: fc                      ; change of amplitude per step during release phase
    !byte 110                                                         ; 454a: 6e                      ; target of level at end of attack phase
    !byte 0                                                           ; 454b: 00                      ; target of level at end of decay phase
sound4
    !word 3                                                           ; 454c: 03 00                   ; channel
    !word 7                                                           ; 454e: 07 00                   ; amplitude
    !word 200                                                         ; 4550: c8 00                   ; pitch
    !word 1                                                           ; 4552: 01 00                   ; duration
ground_fill_2x2_top_left
    !byte %#...#...                                                   ; 4554: 88
    !byte %....#...                                                   ; 4555: 08
    !byte %....####                                                   ; 4556: 0f
    !byte %...#....                                                   ; 4557: 10
    !byte %###.....                                                   ; 4558: e0
    !byte %..#.....                                                   ; 4559: 20
    !byte %..#...##                                                   ; 455a: 23
    !byte %..#...#.                                                   ; 455b: 22
ground_fill_2x2_top_right
    !byte %..#...##                                                   ; 455c: 23
    !byte %..#.....                                                   ; 455d: 20
    !byte %###.....                                                   ; 455e: e0
    !byte %...#....                                                   ; 455f: 10
    !byte %....####                                                   ; 4560: 0f
    !byte %....#...                                                   ; 4561: 08
    !byte %#...#...                                                   ; 4562: 88
    !byte %#...#...                                                   ; 4563: 88
ground_fill_2x2_bottom_left
    !byte %..#...##                                                   ; 4564: 23
    !byte %..#.....                                                   ; 4565: 20
    !byte %###.....                                                   ; 4566: e0
    !byte %...#....                                                   ; 4567: 10
    !byte %....####                                                   ; 4568: 0f
    !byte %....#...                                                   ; 4569: 08
    !byte %#...#...                                                   ; 456a: 88
    !byte %#...#...                                                   ; 456b: 88
ground_fill_2x2_bottom_right
    !byte %#...#...                                                   ; 456c: 88
    !byte %....#...                                                   ; 456d: 08
    !byte %....####                                                   ; 456e: 0f
    !byte %...#....                                                   ; 456f: 10
    !byte %###.....                                                   ; 4570: e0
    !byte %..#.....                                                   ; 4571: 20
    !byte %..#...##                                                   ; 4572: 23
    !byte %..#...#.                                                   ; 4573: 22
sprite_data
pydis_end
!if (<envelope1) != $0a {
    !error "Assertion failed: <envelope1 == $0a"
}
!if (<envelope2) != $20 {
    !error "Assertion failed: <envelope2 == $20"
}
!if (<envelope3) != $3e {
    !error "Assertion failed: <envelope3 == $3e"
}
!if (<ground_fill_2x2_top_left) != $54 {
    !error "Assertion failed: <ground_fill_2x2_top_left == $54"
}
!if (<sound1) != $18 {
    !error "Assertion failed: <sound1 == $18"
}
!if (<sound2) != $36 {
    !error "Assertion failed: <sound2 == $36"
}
!if (<sound3) != $2e {
    !error "Assertion failed: <sound3 == $2e"
}
!if (<sound4) != $4c {
    !error "Assertion failed: <sound4 == $4c"
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
!if (bell_fall_animation - bell_animations) != $14 {
    !error "Assertion failed: bell_fall_animation - bell_animations == $14"
}
!if (bell_fall_sideways_animation - bell_animations) != $07 {
    !error "Assertion failed: bell_fall_sideways_animation - bell_animations == $07"
}
!if (bell_move_sideways_animation - bell_animations) != $04 {
    !error "Assertion failed: bell_move_sideways_animation - bell_animations == $04"
}
!if (bell_stopped_animation - bell_animations) != $01 {
    !error "Assertion failed: bell_stopped_animation - bell_animations == $01"
}
!if (collision_map_none) != $00 {
    !error "Assertion failed: collision_map_none == $00"
}
!if (collision_map_solid_rock) != $03 {
    !error "Assertion failed: collision_map_solid_rock == $03"
}
!if (dog_head_drooling_animation - dog_head_animations) != $05 {
    !error "Assertion failed: dog_head_drooling_animation - dog_head_animations == $05"
}
!if (dog_head_drooling_final_animation - dog_head_animations) != $34 {
    !error "Assertion failed: dog_head_drooling_final_animation - dog_head_animations == $34"
}
!if (dog_head_drooling_held_animation - dog_head_animations) != $30 {
    !error "Assertion failed: dog_head_drooling_held_animation - dog_head_animations == $30"
}
!if (dog_head_normal_animation - dog_head_animations) != $01 {
    !error "Assertion failed: dog_head_normal_animation - dog_head_animations == $01"
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
!if (inkey_key_o) != $c9 {
    !error "Assertion failed: inkey_key_o == $c9"
}
!if (level_specific_initialisation) != $3af7 {
    !error "Assertion failed: level_specific_initialisation == $3af7"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b1a {
    !error "Assertion failed: level_specific_update == $3b1a"
}
!if (object_collided_left_wall) != $01 {
    !error "Assertion failed: object_collided_left_wall == $01"
}
!if (object_collided_right_wall) != $04 {
    !error "Assertion failed: object_collided_right_wall == $04"
}
!if (object_direction + objectid_clanger_end) != $09c1 {
    !error "Assertion failed: object_direction + objectid_clanger_end == $09c1"
}
!if (object_erase_type + objectid_bell) != $38ae {
    !error "Assertion failed: object_erase_type + objectid_bell == $38ae"
}
!if (object_erase_type + objectid_clanger) != $38b0 {
    !error "Assertion failed: object_erase_type + objectid_clanger == $38b0"
}
!if (object_erase_type + objectid_clanger_end) != $38af {
    !error "Assertion failed: object_erase_type + objectid_clanger_end == $38af"
}
!if (object_erase_type + objectid_dog_head) != $38b5 {
    !error "Assertion failed: object_erase_type + objectid_dog_head == $38b5"
}
!if (object_erase_type + objectid_drip) != $38b3 {
    !error "Assertion failed: object_erase_type + objectid_drip == $38b3"
}
!if (object_erase_type + objectid_partition) != $38b1 {
    !error "Assertion failed: object_erase_type + objectid_partition == $38b1"
}
!if (object_spriteid + objectid_bell) != $09aa {
    !error "Assertion failed: object_spriteid + objectid_bell == $09aa"
}
!if (object_spriteid + objectid_clanger) != $09ac {
    !error "Assertion failed: object_spriteid + objectid_clanger == $09ac"
}
!if (object_spriteid + objectid_clanger_end) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_clanger_end == $09ab"
}
!if (object_spriteid + objectid_dog_head) != $09b1 {
    !error "Assertion failed: object_spriteid + objectid_dog_head == $09b1"
}
!if (object_spriteid + objectid_dog_tail) != $09b0 {
    !error "Assertion failed: object_spriteid + objectid_dog_tail == $09b0"
}
!if (object_spriteid + objectid_drip) != $09af {
    !error "Assertion failed: object_spriteid + objectid_drip == $09af"
}
!if (object_spriteid + objectid_partition) != $09ad {
    !error "Assertion failed: object_spriteid + objectid_partition == $09ad"
}
!if (object_spriteid + objectid_partition_end) != $09ac {
    !error "Assertion failed: object_spriteid + objectid_partition_end == $09ac"
}
!if (object_spriteid + objectid_umbrella) != $09b2 {
    !error "Assertion failed: object_spriteid + objectid_umbrella == $09b2"
}
!if (object_spriteid_old + objectid_umbrella) != $09bd {
    !error "Assertion failed: object_spriteid_old + objectid_umbrella == $09bd"
}
!if (object_x_high + objectid_bell) != $0968 {
    !error "Assertion failed: object_x_high + objectid_bell == $0968"
}
!if (object_x_high + objectid_clanger_end) != $0969 {
    !error "Assertion failed: object_x_high + objectid_clanger_end == $0969"
}
!if (object_x_low + objectid_bell) != $0952 {
    !error "Assertion failed: object_x_low + objectid_bell == $0952"
}
!if (object_x_low + objectid_clanger_end) != $0953 {
    !error "Assertion failed: object_x_low + objectid_clanger_end == $0953"
}
!if (object_x_low + objectid_drip) != $0957 {
    !error "Assertion failed: object_x_low + objectid_drip == $0957"
}
!if (object_y_high + objectid_bell) != $0994 {
    !error "Assertion failed: object_y_high + objectid_bell == $0994"
}
!if (object_y_high + objectid_clanger_end) != $0995 {
    !error "Assertion failed: object_y_high + objectid_clanger_end == $0995"
}
!if (object_y_low + objectid_bell) != $097e {
    !error "Assertion failed: object_y_low + objectid_bell == $097e"
}
!if (object_y_low + objectid_clanger_end) != $097f {
    !error "Assertion failed: object_y_low + objectid_clanger_end == $097f"
}
!if (object_y_low + objectid_drip) != $0983 {
    !error "Assertion failed: object_y_low + objectid_drip == $0983"
}
!if (object_y_low + objectid_partition) != $0981 {
    !error "Assertion failed: object_y_low + objectid_partition == $0981"
}
!if (object_y_low + objectid_partition_end) != $0980 {
    !error "Assertion failed: object_y_low + objectid_partition_end == $0980"
}
!if (object_y_low + objectid_umbrella) != $0986 {
    !error "Assertion failed: object_y_low + objectid_umbrella == $0986"
}
!if (object_z_order + objectid_bell) != $38c4 {
    !error "Assertion failed: object_z_order + objectid_bell == $38c4"
}
!if (object_z_order + objectid_clanger_end) != $38c5 {
    !error "Assertion failed: object_z_order + objectid_clanger_end == $38c5"
}
!if (object_z_order + objectid_dog_head) != $38cb {
    !error "Assertion failed: object_z_order + objectid_dog_head == $38cb"
}
!if (object_z_order + objectid_dog_tail) != $38ca {
    !error "Assertion failed: object_z_order + objectid_dog_tail == $38ca"
}
!if (object_z_order + objectid_drip) != $38c9 {
    !error "Assertion failed: object_z_order + objectid_drip == $38c9"
}
!if (object_z_order + objectid_partition_end) != $38c6 {
    !error "Assertion failed: object_z_order + objectid_partition_end == $38c6"
}
!if (objectid_bell) != $02 {
    !error "Assertion failed: objectid_bell == $02"
}
!if (objectid_clanger) != $04 {
    !error "Assertion failed: objectid_clanger == $04"
}
!if (objectid_dog_head) != $09 {
    !error "Assertion failed: objectid_dog_head == $09"
}
!if (objectid_dog_tail) != $08 {
    !error "Assertion failed: objectid_dog_tail == $08"
}
!if (objectid_fire1) != $04 {
    !error "Assertion failed: objectid_fire1 == $04"
}
!if (objectid_fire2) != $05 {
    !error "Assertion failed: objectid_fire2 == $05"
}
!if (objectid_old_player) != $0b {
    !error "Assertion failed: objectid_old_player == $0b"
}
!if (objectid_player) != $00 {
    !error "Assertion failed: objectid_player == $00"
}
!if (objectid_player_accessory) != $01 {
    !error "Assertion failed: objectid_player_accessory == $01"
}
!if (objectid_sparkles) != $06 {
    !error "Assertion failed: objectid_sparkles == $06"
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
!if (sound_priority_per_channel_table + 1) != $3970 {
    !error "Assertion failed: sound_priority_per_channel_table + 1 == $3970"
}
!if (sprite_data - level_data) != $0a9f {
    !error "Assertion failed: sprite_data - level_data == $0a9f"
}
!if (spriteid_bell) != $e1 {
    !error "Assertion failed: spriteid_bell == $e1"
}
!if (spriteid_boulder) != $cc {
    !error "Assertion failed: spriteid_boulder == $cc"
}
!if (spriteid_clanger) != $df {
    !error "Assertion failed: spriteid_clanger == $df"
}
!if (spriteid_clanger2) != $e8 {
    !error "Assertion failed: spriteid_clanger2 == $e8"
}
!if (spriteid_clanger_end) != $e7 {
    !error "Assertion failed: spriteid_clanger_end == $e7"
}
!if (spriteid_clanger_menu_item) != $e0 {
    !error "Assertion failed: spriteid_clanger_menu_item == $e0"
}
!if (spriteid_dog_body) != $d1 {
    !error "Assertion failed: spriteid_dog_body == $d1"
}
!if (spriteid_dog_head) != $d4 {
    !error "Assertion failed: spriteid_dog_head == $d4"
}
!if (spriteid_dog_head_drooling) != $d5 {
    !error "Assertion failed: spriteid_dog_head_drooling == $d5"
}
!if (spriteid_droplet1) != $d9 {
    !error "Assertion failed: spriteid_droplet1 == $d9"
}
!if (spriteid_droplet2) != $d8 {
    !error "Assertion failed: spriteid_droplet2 == $d8"
}
!if (spriteid_droplet3) != $d7 {
    !error "Assertion failed: spriteid_droplet3 == $d7"
}
!if (spriteid_droplet4) != $d6 {
    !error "Assertion failed: spriteid_droplet4 == $d6"
}
!if (spriteid_erase1) != $d0 {
    !error "Assertion failed: spriteid_erase1 == $d0"
}
!if (spriteid_erase2) != $d2 {
    !error "Assertion failed: spriteid_erase2 == $d2"
}
!if (spriteid_erase3) != $d3 {
    !error "Assertion failed: spriteid_erase3 == $d3"
}
!if (spriteid_erase4) != $e2 {
    !error "Assertion failed: spriteid_erase4 == $e2"
}
!if (spriteid_erase5) != $e5 {
    !error "Assertion failed: spriteid_erase5 == $e5"
}
!if (spriteid_holding_clanger) != $e6 {
    !error "Assertion failed: spriteid_holding_clanger == $e6"
}
!if (spriteid_horizontal_rope) != $ca {
    !error "Assertion failed: spriteid_horizontal_rope == $ca"
}
!if (spriteid_left_hook) != $c8 {
    !error "Assertion failed: spriteid_left_hook == $c8"
}
!if (spriteid_one_pixel_masked_out) != $00 {
    !error "Assertion failed: spriteid_one_pixel_masked_out == $00"
}
!if (spriteid_partition) != $ce {
    !error "Assertion failed: spriteid_partition == $ce"
}
!if (spriteid_partition_end) != $cf {
    !error "Assertion failed: spriteid_partition_end == $cf"
}
!if (spriteid_right_hook) != $c9 {
    !error "Assertion failed: spriteid_right_hook == $c9"
}
!if (spriteid_rope) != $cb {
    !error "Assertion failed: spriteid_rope == $cb"
}
!if (spriteid_rope_end1) != $da {
    !error "Assertion failed: spriteid_rope_end1 == $da"
}
!if (spriteid_tail1) != $db {
    !error "Assertion failed: spriteid_tail1 == $db"
}
!if (spriteid_tail2) != $dc {
    !error "Assertion failed: spriteid_tail2 == $dc"
}
!if (spriteid_tail3) != $dd {
    !error "Assertion failed: spriteid_tail3 == $dd"
}
!if (spriteid_tail4) != $de {
    !error "Assertion failed: spriteid_tail4 == $de"
}
!if (spriteid_umbrella) != $cd {
    !error "Assertion failed: spriteid_umbrella == $cd"
}
!if (spriteid_using_clanger) != $e3 {
    !error "Assertion failed: spriteid_using_clanger == $e3"
}
!if (spriteid_using_clanger_end) != $e4 {
    !error "Assertion failed: spriteid_using_clanger_end == $e4"
}
