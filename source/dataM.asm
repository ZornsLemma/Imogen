; *************************************************************************************
;
; Level M: 'HAMSTER-JAM'
;
; Save game variables:
;
;     save_game_level_m_hamster_animation                        ($0a3f):
;               0: untouched
;              1+: animations for hamster
;             $3b: hamster jam landed
;
;     save_game_level_m_got_tulip_bulb_progress                  ($0a40):
;               0: untouched
;        1, 9, 14: tulip bulb animations
;             $ff: taken
;
;     save_game_level_m_tulip_bulb_x_animation_step              ($0a41):
;               step within animations above
;
;     save_game_level_m_tulip_bulb_x_low                         ($0a42):
;     save_game_level_m_tulip_bulb_x_high                        ($0a43):
;               position of tulip bulb (x coordinate)
;
;     save_game_level_m_tulip_bulb_y                             ($0a44):
;               position of tulip bulb (y coordinate)
;
;     save_game_level_m_tulip_bulb_direction1                    ($0a45):
;                 1: pointing right
;               $ff: pointing left
;
;     save_game_level_m_tulip_bulb_room                          ($0a46):
;               room that the tulip bulb is in
;
;     save_game_level_m_tulip_bulb_direction2                    ($0a47):
;               same as save_game_level_m_tulip_bulb_direction1
;
;     save_game_level_m_tulip_bulb_y_animation_step              ($0a48):
;               animation step for a falling tulip bulb
;
;     save_game_level_m_tulip_growth_index                       ($0a49):
;               0: not growing
;           1-$44: growing
;             $45: fully grown
;
; Solution:
;
;   1. Jump on the block to the right as the cat, and between the cat and the monkey
;      traverse the rest of the obstacles to exit the room.
;   2. Get the tulip bulb under the sign. Exit to the left using the middle exit.
;   3. Climb onto the rope and descend to the bottom. Time falling off the rope
;      to squash the hamster.
;   4. Drop the tulip bulb onto the hamster jam. (A tulip grows)
;   5. Climb the tulip to exit the room to the left.
;   6. Climb the three ropes, and turn into the cat on the final block.
;   7. Jump across to collect the spell.
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
objectid_block                        = 3
objectid_fire1                        = 2
objectid_fire2                        = 3
objectid_hamster_body                 = 7
objectid_hamster_feet_or_jam          = 5
objectid_old_player                   = 11
objectid_old_player_accessory         = 12
objectid_old_tulip_bulb               = 17
objectid_player                       = 0
objectid_player_accessory             = 1
objectid_rope_end                     = 2
objectid_rope_to_block                = 4
objectid_sparkles                     = 2
objectid_tulip_bulb                   = 6
objectid_tulip_head                   = 6
opcode_jmp                            = 76
sprite_op_flags_copy_screen           = 1
sprite_op_flags_erase_to_bg_colour    = 2
sprite_op_flags_erase_to_fg_colour    = 4
sprite_op_flags_normal                = 0
spriteid_ball                         = 59
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
spriteid_erase1                       = 207
spriteid_erase2                       = 212
spriteid_erase3                       = 218
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
spriteid_flying_hamster_jam           = 213
spriteid_frayed_rope_end              = 205
spriteid_hamster_body                 = 228
spriteid_hamster_jam                  = 214
spriteid_hamster_legs_1               = 208
spriteid_hamster_legs_2               = 209
spriteid_hamster_legs_3               = 210
spriteid_hamster_legs_4               = 211
spriteid_hamster_looking_back         = 215
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
spriteid_long_rope                    = 203
spriteid_long_rope_to_block           = 227
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
spriteid_right_hook                   = 201
spriteid_rope1                        = 85
spriteid_rope2                        = 86
spriteid_rope3                        = 87
spriteid_rope4                        = 88
spriteid_rope_end                     = 10
spriteid_rope_hook                    = 11
spriteid_short_rope                   = 204
spriteid_short_rope_to_block1         = 225
spriteid_short_rope_to_block2         = 226
spriteid_sign                         = 219
spriteid_sparkles1                    = 34
spriteid_sparkles2                    = 35
spriteid_sparkles3                    = 36
spriteid_sparkles4                    = 37
spriteid_sparkles5                    = 38
spriteid_tall_block                   = 206
spriteid_tulip_bulb                   = 217
spriteid_tulip_bulb_menu_item         = 216
spriteid_tulip_flower1                = 224
spriteid_tulip_flower2                = 223
spriteid_tulip_flower3                = 222
spriteid_tulip_head                   = 220
spriteid_tulip_stalk                  = 221
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
save_game_level_m_hamster_animation                 = $0a3f
save_game_level_m_got_tulip_bulb_progress           = $0a40
save_game_level_m_tulip_bulb_x_animation_step       = $0a41
save_game_level_m_tulip_bulb_x_low                  = $0a42
save_game_level_m_tulip_bulb_x_high                 = $0a43
save_game_level_m_tulip_bulb_y                      = $0a44
save_game_level_m_tulip_bulb_direction1             = $0a45
save_game_level_m_tulip_bulb_room                   = $0a46
save_game_level_m_tulip_bulb_direction2             = $0a47
save_game_level_m_tulip_bulb_y_animation_step       = $0a48
save_game_level_m_tulip_growth_index                = $0a49
block_y_position                                    = $0a6f
hamster_animation_step                              = $0a70
hamster_x                                           = $0a71
hamster_y                                           = $0a72
hamster_direction                                   = $0a73
tulip_bulb_steps_to_catch_up_while_offscreen        = $0a74
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
    !word sprite_data - level_data                                    ; 3ad5: f2 0a                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f3 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 11 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
initial_room_index
    !byte 3                                                           ; 3add: 03
initial_room_index_cheat
    !byte 2                                                           ; 3ade: 02
level_room_data_table
    !word room_0_data                                                 ; 3adf: 4a 3b                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: 07 3c
    !word room_2_data                                                 ; 3ae3: 2e 41
    !word room_3_data                                                 ; 3ae5: ac 44

; *************************************************************************************
; 'HAMSTER-JAM[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $83, $8a, $86, $98, $9f, $8e, $99, $e6, $81, $8a, $86, $c6  ; 3ae7: 83 8a 86...

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
    beq set_rock_tiles                                                ; 3af7: f0 0f
    lda developer_flags                                               ; 3af9: ad 03 11
    bpl developer_mode_inactive                                       ; 3afc: 10 00
developer_mode_inactive
    lda save_game_level_m_got_tulip_bulb_progress                     ; 3afe: ad 40 0a
    bpl set_rock_tiles                                                ; 3b01: 10 05
    lda #spriteid_tulip_bulb_menu_item                                ; 3b03: a9 d8
    jsr find_or_create_menu_slot_for_A                                ; 3b05: 20 bd 2b
set_rock_tiles
    lda #<ground_fill_2x2_top_left                                    ; 3b08: a9 a7
    sta source_sprite_memory_low                                      ; 3b0a: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3b0c: a9 45
    sta source_sprite_memory_high                                     ; 3b0e: 85 41
    rts                                                               ; 3b10: 60

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
    jsr room_3_update_handler                                         ; 3b11: 20 39 45
    jsr room_1_update_handler                                         ; 3b14: 20 e6 3d
    jsr update_hamster                                                ; 3b17: 20 b5 3c
    jsr room_2_update_handler                                         ; 3b1a: 20 de 41
    jsr update_tulip_growth                                           ; 3b1d: 20 29 40
    jsr room_0_update_handler                                         ; 3b20: 20 f0 3b
    rts                                                               ; 3b23: 60

draw_top_and_bottom_rows_of_rock
    ldx #0                                                            ; 3b24: a2 00
    ldy #0                                                            ; 3b26: a0 00
    lda #$ff                                                          ; 3b28: a9 ff
    sta width_in_cells                                                ; 3b2a: 85 3c
    lda #2                                                            ; 3b2c: a9 02
    sta height_in_cells                                               ; 3b2e: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b30: 20 bb 1a
    ldy #$16                                                          ; 3b33: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3b35: 20 bb 1a
    ldx #3                                                            ; 3b38: a2 03
    ldy #2                                                            ; 3b3a: a0 02
    lda #1                                                            ; 3b3c: a9 01
    sta width_in_cells                                                ; 3b3e: 85 3c
    sta height_in_cells                                               ; 3b40: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b42: 20 bb 1a
    ldx #$24 ; '$'                                                    ; 3b45: a2 24
    jmp copy_rectangle_of_memory_to_screen                            ; 3b47: 4c bb 1a

; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 20                                                          ; 3b4a: 14                      ; initial player X cell
    !byte 22                                                          ; 3b4b: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####      |    |    |               ####
; ###       |    |    |                ###
; ###       |    |    |                ###
; ###       |    |    |                ###
; ###       |    |    |                ###
; ###       |    |   OSO        ##########
; ###       |    |   OOO        ##########
; ###       |    |
; ###       |    |
; ###       |    |
; ###       |    |
; ###       |   OSO
; ###       |   OOO                  #####
; ###       |                        #####
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ###                                  ###
; ########                             ###
; #############       P                ###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_0_code
    jsr draw_top_and_bottom_rows_of_rock                              ; 3b4c: 20 24 3b
; draw 3x20 rectangle at (0,2)
    ldx #0                                                            ; 3b4f: a2 00
    ldy #2                                                            ; 3b51: a0 02
    lda #3                                                            ; 3b53: a9 03
    sta width_in_cells                                                ; 3b55: 85 3c
    lda #$14                                                          ; 3b57: a9 14
    sta height_in_cells                                               ; 3b59: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b5b: 20 bb 1a
; draw 3x7 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3b5e: a2 25
    lda #7                                                            ; 3b60: a9 07
    sta height_in_cells                                               ; 3b62: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b64: 20 bb 1a
; draw 3x6 rectangle at (37,16)
    ldy #$10                                                          ; 3b67: a0 10
    dec height_in_cells                                               ; 3b69: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b6b: 20 bb 1a
; draw 255x2 rectangle at (35,14)
    ldx #$23 ; '#'                                                    ; 3b6e: a2 23
    ldy #$0e                                                          ; 3b70: a0 0e
    lda #$ff                                                          ; 3b72: a9 ff
    sta width_in_cells                                                ; 3b74: 85 3c
    lda #2                                                            ; 3b76: a9 02
    sta height_in_cells                                               ; 3b78: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b7a: 20 bb 1a
; draw 7x2 rectangle at (30,7)
    ldx #$1e                                                          ; 3b7d: a2 1e
    ldy #7                                                            ; 3b7f: a0 07
    lda #7                                                            ; 3b81: a9 07
    sta width_in_cells                                                ; 3b83: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b85: 20 bb 1a
; draw 5x1 rectangle at (3,20)
    ldx #3                                                            ; 3b88: a2 03
    ldy #$14                                                          ; 3b8a: a0 14
    lda #5                                                            ; 3b8c: a9 05
    sta width_in_cells                                                ; 3b8e: 85 3c
    dec height_in_cells                                               ; 3b90: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b92: 20 bb 1a
; draw 10x1 rectangle at (3,21)
    iny                                                               ; 3b95: c8
    lda #$0a                                                          ; 3b96: a9 0a
    sta width_in_cells                                                ; 3b98: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b9a: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3b9d: 20 90 1b
; draw rope at (10,2) length 17
    ldx #$0a                                                          ; 3ba0: a2 0a
    ldy #2                                                            ; 3ba2: a0 02
    lda #$11                                                          ; 3ba4: a9 11
    jsr draw_rope                                                     ; 3ba6: 20 b9 1d
; draw rope at (15,2) length 12
    lda #3                                                            ; 3ba9: a9 03
    sta width_in_cells                                                ; 3bab: 85 3c
    lda #2                                                            ; 3bad: a9 02
    sta height_in_cells                                               ; 3baf: 85 3d
    ldx #$0f                                                          ; 3bb1: a2 0f
    ldy #2                                                            ; 3bb3: a0 02
    lda #$0c                                                          ; 3bb5: a9 0c
    jsr draw_rope                                                     ; 3bb7: 20 b9 1d
; draw tall block at (14,13) of size (3x2)
    dex                                                               ; 3bba: ca
    ldy #$0d                                                          ; 3bbb: a0 0d
    lda #spriteid_tall_block                                          ; 3bbd: a9 ce
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bbf: 20 57 1f
; draw short rope to block2 at (15,13)
    inx                                                               ; 3bc2: e8
    lda #spriteid_short_rope_to_block2                                ; 3bc3: a9 e2
    jsr draw_sprite_a_at_cell_xy                                      ; 3bc5: 20 4c 1f
; draw rope at (20,2) length 6
    ldx #$14                                                          ; 3bc8: a2 14
    ldy #2                                                            ; 3bca: a0 02
    lda #6                                                            ; 3bcc: a9 06
    jsr draw_rope                                                     ; 3bce: 20 b9 1d
; draw tall block at (19,7) of size (3x2)
    dex                                                               ; 3bd1: ca
    ldy #7                                                            ; 3bd2: a0 07
    lda #spriteid_tall_block                                          ; 3bd4: a9 ce
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bd6: 20 57 1f
; draw short rope to block2 at (20,7)
    inx                                                               ; 3bd9: e8
    lda #spriteid_short_rope_to_block2                                ; 3bda: a9 e2
    jsr draw_sprite_a_at_cell_xy                                      ; 3bdc: 20 4c 1f
    jsr start_room                                                    ; 3bdf: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 3be2: 20 da 12
    and #exit_room_right                                              ; 3be5: 29 04
    beq room_0_game_update_loop                                       ; 3be7: f0 f9
    ldx #1                                                            ; 3be9: a2 01
    ldy current_level                                                 ; 3beb: a4 31
    jmp initialise_level_and_room                                     ; 3bed: 4c 40 11

room_0_update_handler
    lda #0                                                            ; 3bf0: a9 00
    sta currently_updating_logic_for_room_index                       ; 3bf2: 8d ba 1a
    ldx #3                                                            ; 3bf5: a2 03
    ldy #$0a                                                          ; 3bf7: a0 0a
    lda #objectid_fire2                                               ; 3bf9: a9 03
    jsr update_brazier_and_fire                                       ; 3bfb: 20 88 19
    ldx #$21 ; '!'                                                    ; 3bfe: a2 21
    ldy #7                                                            ; 3c00: a0 07
    lda #2                                                            ; 3c02: a9 02
    jmp update_level_completion                                       ; 3c04: 4c 10 1a

; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 20                                                          ; 3c07: 14                      ; initial player X cell
    !byte 22                                                          ; 3c08: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####                                ####
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; 
; 
; 
;               ############
;               ############
; #####                              #####
; #####                              #####
; ###
; ###
; ###
; ###
; ###
; ###                 P              #####
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_1_code
    jsr draw_top_and_bottom_rows_of_rock                              ; 3c09: 20 24 3b
; draw 3x7 rectangle at (0,2)
    ldx #0                                                            ; 3c0c: a2 00
    ldy #2                                                            ; 3c0e: a0 02
    lda #3                                                            ; 3c10: a9 03
    sta width_in_cells                                                ; 3c12: 85 3c
    lda #7                                                            ; 3c14: a9 07
    sta height_in_cells                                               ; 3c16: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c18: 20 bb 1a
; draw 3x7 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3c1b: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 3c1d: 20 bb 1a
; draw 3x6 rectangle at (0,16)
    ldx #0                                                            ; 3c20: a2 00
    ldy #$10                                                          ; 3c22: a0 10
    lda #6                                                            ; 3c24: a9 06
    sta height_in_cells                                               ; 3c26: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c28: 20 bb 1a
; draw 5x2 rectangle at (0,14)
    ldy #$0e                                                          ; 3c2b: a0 0e
    lda #5                                                            ; 3c2d: a9 05
    sta width_in_cells                                                ; 3c2f: 85 3c
    lda #2                                                            ; 3c31: a9 02
    sta height_in_cells                                               ; 3c33: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c35: 20 bb 1a
; draw 5x2 rectangle at (35,14)
    ldx #$23 ; '#'                                                    ; 3c38: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 3c3a: 20 bb 1a
; draw 12x2 rectangle at (14,12)
    ldx #$0e                                                          ; 3c3d: a2 0e
    ldy #$0c                                                          ; 3c3f: a0 0c
    lda #$0c                                                          ; 3c41: a9 0c
    sta width_in_cells                                                ; 3c43: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3c45: 20 bb 1a
; draw 12x1 rectangle at (35,21)
    ldx #$23 ; '#'                                                    ; 3c48: a2 23
    ldy #$15                                                          ; 3c4a: a0 15
    lda #1                                                            ; 3c4c: a9 01
    sta height_in_cells                                               ; 3c4e: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c50: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3c53: 20 90 1b
    jsr start_room                                                    ; 3c56: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 3c59: 20 da 12
    sta room_exit_direction                                           ; 3c5c: 85 70
    and #exit_room_left                                               ; 3c5e: 29 01
    beq room_1_check_right_exit                                       ; 3c60: f0 07
    ldx #0                                                            ; 3c62: a2 00
    ldy current_level                                                 ; 3c64: a4 31
    jmp initialise_level_and_room                                     ; 3c66: 4c 40 11

room_1_check_right_exit
    lda room_exit_direction                                           ; 3c69: a5 70
    and #exit_room_right                                              ; 3c6b: 29 04
    beq room_1_game_update_loop                                       ; 3c6d: f0 ea
    ldx #2                                                            ; 3c6f: a2 02
    ldy current_level                                                 ; 3c71: a4 31
    jmp initialise_level_and_room                                     ; 3c73: 4c 40 11

hamster_animations
    !byte 0                                                           ; 3c76: 00
hamster_walk_animation
    !byte spriteid_hamster_legs_1                                     ; 3c77: d0
    !byte 2, 0                                                        ; 3c78: 02 00
    !byte spriteid_hamster_legs_2                                     ; 3c7a: d1
    !byte 2, 0                                                        ; 3c7b: 02 00
    !byte spriteid_hamster_legs_3                                     ; 3c7d: d2
    !byte 2, 0                                                        ; 3c7e: 02 00
    !byte spriteid_hamster_legs_4                                     ; 3c80: d3
    !byte 2, 0                                                        ; 3c81: 02 00
    !byte $ff                                                         ; 3c83: ff
hamster_look_back_animation
    !byte spriteid_hamster_looking_back                               ; 3c84: d7
    !byte 0, 0                                                        ; 3c85: 00 00
hamster_static_animation
    !byte spriteid_hamster_legs_4                                     ; 3c87: d3
    !byte 0, 0                                                        ; 3c88: 00 00
    !byte $ff                                                         ; 3c8a: ff
hamster_jam_flying
    !byte spriteid_one_pixel_masked_out                               ; 3c8b: 00
    !byte 0, 0                                                        ; 3c8c: 00 00
    !byte spriteid_flying_hamster_jam                                 ; 3c8e: d5
    !byte 0, 0                                                        ; 3c8f: 00 00
    !byte spriteid_flying_hamster_jam                                 ; 3c91: d5
    !byte $f8,   2                                                    ; 3c92: f8 02
    !byte spriteid_flying_hamster_jam                                 ; 3c94: d5
    !byte $f8,   3                                                    ; 3c95: f8 03
    !byte spriteid_flying_hamster_jam                                 ; 3c97: d5
    !byte $fa,   4                                                    ; 3c98: fa 04
    !byte spriteid_flying_hamster_jam                                 ; 3c9a: d5
    !byte $fa,   5                                                    ; 3c9b: fa 05
    !byte spriteid_flying_hamster_jam                                 ; 3c9d: d5
    !byte $fb,   6                                                    ; 3c9e: fb 06
    !byte spriteid_flying_hamster_jam                                 ; 3ca0: d5
    !byte $fc,   6                                                    ; 3ca1: fc 06
    !byte spriteid_flying_hamster_jam                                 ; 3ca3: d5
    !byte $fd,   7                                                    ; 3ca4: fd 07
    !byte spriteid_flying_hamster_jam                                 ; 3ca6: d5
    !byte $fe,   7                                                    ; 3ca7: fe 07
    !byte spriteid_flying_hamster_jam                                 ; 3ca9: d5
    !byte $fe,   8                                                    ; 3caa: fe 08
    !byte $ff                                                         ; 3cac: ff
hamster_jam_static_animation
    !byte spriteid_flying_hamster_jam                                 ; 3cad: d5
    !byte 0, 8                                                        ; 3cae: 00 08
    !byte $ff                                                         ; 3cb0: ff
hamster_jam_landed_animation
    !byte spriteid_hamster_jam                                        ; 3cb1: d6
    !byte 0, 0                                                        ; 3cb2: 00 00
    !byte $ff                                                         ; 3cb4: ff

; check for first update in room (branch if not)
update_hamster
    lda update_room_first_update_flag                                 ; 3cb5: ad 2b 13
    beq update_hamster_animation_step                                 ; 3cb8: f0 56
; check for level change (branch if not)
    lda current_level                                                 ; 3cba: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3cbc: c5 51
    beq room_changed_only1                                            ; 3cbe: f0 38
    lda save_game_level_m_hamster_animation                           ; 3cc0: ad 3f 0a
    beq initalise_to_hamster_walk_animation                           ; 3cc3: f0 08
    cmp #hamster_walk_animation - hamster_animations                  ; 3cc5: c9 01
    beq initalise_to_hamster_walk_animation                           ; 3cc7: f0 04
    cmp #hamster_look_back_animation - hamster_animations             ; 3cc9: c9 0e
    bne set_hamster_jam_landed                                        ; 3ccb: d0 14
initalise_to_hamster_walk_animation
    ldy #hamster_walk_animation - hamster_animations                  ; 3ccd: a0 01
    lda #$a0                                                          ; 3ccf: a9 a0
    sta hamster_x                                                     ; 3cd1: 8d 71 0a
    lda #$60 ; '`'                                                    ; 3cd4: a9 60
    sta hamster_y                                                     ; 3cd6: 8d 72 0a
    lda #1                                                            ; 3cd9: a9 01
    sta hamster_direction                                             ; 3cdb: 8d 73 0a
    jmp set_hamster_animation                                         ; 3cde: 4c f2 3c

set_hamster_jam_landed
    ldy #hamster_jam_landed_animation - hamster_animations            ; 3ce1: a0 3b
    lda #$44 ; 'D'                                                    ; 3ce3: a9 44
    sta hamster_x                                                     ; 3ce5: 8d 71 0a
    lda #$b0                                                          ; 3ce8: a9 b0
    sta hamster_y                                                     ; 3cea: 8d 72 0a
    lda #1                                                            ; 3ced: a9 01
    sta hamster_direction                                             ; 3cef: 8d 73 0a
set_hamster_animation
    sty save_game_level_m_hamster_animation                           ; 3cf2: 8c 3f 0a
    sty hamster_animation_step                                        ; 3cf5: 8c 70 0a
room_changed_only1
    lda desired_room_index                                            ; 3cf8: a5 30
    cmp #1                                                            ; 3cfa: c9 01
    bne set_hamster_objects_local                                     ; 3cfc: d0 0f
; initialise hamster when entering room 1
    lda #spriteid_erase2                                              ; 3cfe: a9 d4
    sta object_erase_type + objectid_hamster_feet_or_jam              ; 3d00: 8d b1 38
    lda #$e0                                                          ; 3d03: a9 e0
    sta object_z_order + objectid_hamster_feet_or_jam                 ; 3d05: 8d c7 38
    lda #$df                                                          ; 3d08: a9 df
    sta object_z_order + objectid_hamster_body                        ; 3d0a: 8d c9 38
set_hamster_objects_local
    jmp set_hamster_objects                                           ; 3d0d: 4c ac 3d

update_hamster_animation_step
    lda hamster_animation_step                                        ; 3d10: ad 70 0a
    clc                                                               ; 3d13: 18
    adc #3                                                            ; 3d14: 69 03
    tay                                                               ; 3d16: a8
    lda hamster_animations,y                                          ; 3d17: b9 76 3c
    cmp #$ff                                                          ; 3d1a: c9 ff
    bne set_hamster_static_animation                                  ; 3d1c: d0 03
    ldy save_game_level_m_hamster_animation                           ; 3d1e: ac 3f 0a
set_hamster_static_animation
    cpy #hamster_static_animation - hamster_animations                ; 3d21: c0 11
    bne check_if_hamster_is_looking_back                              ; 3d23: d0 08
    lda hamster_direction                                             ; 3d25: ad 73 0a
    eor #$fe                                                          ; 3d28: 49 fe
    sta hamster_direction                                             ; 3d2a: 8d 73 0a
check_if_hamster_is_looking_back
    lda save_game_level_m_hamster_animation                           ; 3d2d: ad 3f 0a
    cmp #hamster_look_back_animation - hamster_animations             ; 3d30: c9 0e
    bne check_if_hamster_is_walking                                   ; 3d32: d0 0a
    cpy save_game_level_m_hamster_animation                           ; 3d34: cc 3f 0a
    bne set_hamster_animation_step                                    ; 3d37: d0 31
    ldy #hamster_walk_animation - hamster_animations                  ; 3d39: a0 01
    sty save_game_level_m_hamster_animation                           ; 3d3b: 8c 3f 0a
check_if_hamster_is_walking
    lda save_game_level_m_hamster_animation                           ; 3d3e: ad 3f 0a
    cmp #hamster_walk_animation - hamster_animations                  ; 3d41: c9 01
    bne set_hamster_animation_step                                    ; 3d43: d0 25
    ldx hamster_x                                                     ; 3d45: ae 71 0a
    lda hamster_direction                                             ; 3d48: ad 73 0a
    bmi hamster_looking_left                                          ; 3d4b: 30 06
    cpx #$c0                                                          ; 3d4d: e0 c0
    bne set_hamster_animation_step                                    ; 3d4f: d0 19
    beq set_hamster_looking_back                                      ; 3d51: f0 0f                   ; ALWAYS branch

hamster_looking_left
    cpx #$80                                                          ; 3d53: e0 80
    beq set_hamster_looking_back                                      ; 3d55: f0 0b
    cpx #$9c                                                          ; 3d57: e0 9c
    bne set_hamster_animation_step                                    ; 3d59: d0 0f
    lda block_y_position                                              ; 3d5b: ad 6f 0a
    cmp #$48 ; 'H'                                                    ; 3d5e: c9 48
    bcc set_hamster_animation_step                                    ; 3d60: 90 08
set_hamster_looking_back
    ldy #hamster_look_back_animation - hamster_animations             ; 3d62: a0 0e
    sty save_game_level_m_hamster_animation                           ; 3d64: 8c 3f 0a
    jmp set_hamster_animation_step                                    ; 3d67: 4c 6a 3d                ; redundant instruction

set_hamster_animation_step
    sty hamster_animation_step                                        ; 3d6a: 8c 70 0a
    iny                                                               ; 3d6d: c8
    lda hamster_animations,y                                          ; 3d6e: b9 76 3c
    ldx hamster_direction                                             ; 3d71: ae 73 0a
    bpl hamster_looking_right                                         ; 3d74: 10 05
    eor #$ff                                                          ; 3d76: 49 ff
    clc                                                               ; 3d78: 18
    adc #1                                                            ; 3d79: 69 01
hamster_looking_right
    clc                                                               ; 3d7b: 18
    adc hamster_x                                                     ; 3d7c: 6d 71 0a
    sta hamster_x                                                     ; 3d7f: 8d 71 0a
    iny                                                               ; 3d82: c8
    lda hamster_animations,y                                          ; 3d83: b9 76 3c
    clc                                                               ; 3d86: 18
    adc hamster_y                                                     ; 3d87: 6d 72 0a
    sta hamster_y                                                     ; 3d8a: 8d 72 0a
    cmp #$b0                                                          ; 3d8d: c9 b0
    bcc set_hamster_objects                                           ; 3d8f: 90 1b
    lda #$b0                                                          ; 3d91: a9 b0
    sta hamster_y                                                     ; 3d93: 8d 72 0a
    lda #hamster_jam_landed_animation - hamster_animations            ; 3d96: a9 3b
    cmp save_game_level_m_hamster_animation                           ; 3d98: cd 3f 0a
    beq set_hamster_objects                                           ; 3d9b: f0 0f
    sta save_game_level_m_hamster_animation                           ; 3d9d: 8d 3f 0a
    sta hamster_animation_step                                        ; 3da0: 8d 70 0a
    lda desired_room_index                                            ; 3da3: a5 30
    cmp #1                                                            ; 3da5: c9 01
    bne set_hamster_objects                                           ; 3da7: d0 03
    jsr play_landing_sound                                            ; 3da9: 20 a9 23
set_hamster_objects
    lda desired_room_index                                            ; 3dac: a5 30
    cmp #1                                                            ; 3dae: c9 01
    bne return1                                                       ; 3db0: d0 33
    lda hamster_x                                                     ; 3db2: ad 71 0a
    sta object_x_low + objectid_hamster_feet_or_jam                   ; 3db5: 8d 55 09
    sta object_x_low + objectid_hamster_body                          ; 3db8: 8d 57 09
    lda hamster_y                                                     ; 3dbb: ad 72 0a
    sta object_y_low + objectid_hamster_feet_or_jam                   ; 3dbe: 8d 81 09
    sta object_y_low + objectid_hamster_body                          ; 3dc1: 8d 83 09
    lda hamster_direction                                             ; 3dc4: ad 73 0a
    sta object_direction + objectid_hamster_feet_or_jam               ; 3dc7: 8d c3 09
    sta object_direction + objectid_hamster_body                      ; 3dca: 8d c5 09
    ldy hamster_animation_step                                        ; 3dcd: ac 70 0a
    lda hamster_animations,y                                          ; 3dd0: b9 76 3c
    ldx #spriteid_one_pixel_masked_out                                ; 3dd3: a2 00
    cmp #spriteid_hamster_legs_1                                      ; 3dd5: c9 d0
    bcc set_hamster_sprites                                           ; 3dd7: 90 06
    cmp #spriteid_erase2                                              ; 3dd9: c9 d4
    bcs set_hamster_sprites                                           ; 3ddb: b0 02
    ldx #spriteid_hamster_body                                        ; 3ddd: a2 e4
set_hamster_sprites
    sta object_spriteid + objectid_hamster_feet_or_jam                ; 3ddf: 8d ad 09
    stx object_spriteid + objectid_hamster_body                       ; 3de2: 8e af 09
return1
    rts                                                               ; 3de5: 60

; check for first update in room (branch if so)
room_1_update_handler
    lda update_room_first_update_flag                                 ; 3de6: ad 2b 13
    bne initialise_room_1                                             ; 3de9: d0 03
    jmp update_room_1                                                 ; 3deb: 4c d3 3e

; check for level change (branch if not)
initialise_room_1
    lda current_level                                                 ; 3dee: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3df0: c5 51
    beq room_changed_only2                                            ; 3df2: f0 05
    lda #$50 ; 'P'                                                    ; 3df4: a9 50
    sta block_y_position                                              ; 3df6: 8d 6f 0a
room_changed_only2
    lda desired_room_index                                            ; 3df9: a5 30
    cmp #1                                                            ; 3dfb: c9 01
    beq initialise                                                    ; 3dfd: f0 03
    jmp position_rope_and_write_to_collision_map_local                ; 3dff: 4c d0 3e

initialise
    ldx #<envelope1                                                   ; 3e02: a2 47
    ldy #>envelope1                                                   ; 3e04: a0 45
    jsr define_envelope                                               ; 3e06: 20 5e 39
    ldx #<envelope2                                                   ; 3e09: a2 5d
    ldy #>envelope2                                                   ; 3e0b: a0 45
    jsr define_envelope                                               ; 3e0d: 20 5e 39
    ldx #<envelope3                                                   ; 3e10: a2 91
    ldy #>envelope3                                                   ; 3e12: a0 45
    jsr define_envelope                                               ; 3e14: 20 5e 39
    ldx #<envelope4                                                   ; 3e17: a2 7b
    ldy #>envelope4                                                   ; 3e19: a0 45
    jsr define_envelope                                               ; 3e1b: 20 5e 39
    ldx #$10                                                          ; 3e1e: a2 10
    ldy #2                                                            ; 3e20: a0 02
    lda #spriteid_left_hook                                           ; 3e22: a9 c8
    jsr draw_sprite_a_at_cell_xy                                      ; 3e24: 20 4c 1f
    inx                                                               ; 3e27: e8
    inx                                                               ; 3e28: e8
    lda #spriteid_horizontal_rope                                     ; 3e29: a9 ca
draw_horizontal_rope
    jsr draw_sprite_a_at_cell_xy                                      ; 3e2b: 20 4c 1f
    inx                                                               ; 3e2e: e8
    cpx #$1e                                                          ; 3e2f: e0 1e
    bcc draw_horizontal_rope                                          ; 3e31: 90 f8
    inx                                                               ; 3e33: e8
    lda #spriteid_right_hook                                          ; 3e34: a9 c9
    jsr draw_sprite_a_at_cell_xy                                      ; 3e36: 20 4c 1f
    lda #collision_map_solid_rock                                     ; 3e39: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3e3b: 20 bb 1e
    lda #$50 ; 'P'                                                    ; 3e3e: a9 50
    sec                                                               ; 3e40: 38
    sbc block_y_position                                              ; 3e41: ed 6f 0a
    clc                                                               ; 3e44: 18
    adc #$5c ; '\'                                                    ; 3e45: 69 5c
    lsr                                                               ; 3e47: 4a
    lsr                                                               ; 3e48: 4a
    lsr                                                               ; 3e49: 4a
    tay                                                               ; 3e4a: a8
    dey                                                               ; 3e4b: 88
draw_rope_loop1
    lda #spriteid_long_rope                                           ; 3e4c: a9 cb
    jsr draw_sprite_a_at_cell_xy                                      ; 3e4e: 20 4c 1f
    lda #collision_map_rope                                           ; 3e51: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3e53: 20 bb 1e
    dey                                                               ; 3e56: 88
    cpy #3                                                            ; 3e57: c0 03
    bcs draw_rope_loop1                                               ; 3e59: b0 f1
    lda #objectid_rope_end                                            ; 3e5b: a9 02
    jsr set_object_position_from_cell_xy                              ; 3e5d: 20 5d 1f
    lda #spriteid_frayed_rope_end                                     ; 3e60: a9 cd
    sta object_spriteid + objectid_rope_end                           ; 3e62: 8d aa 09
    ldx #$10                                                          ; 3e65: a2 10
    lda block_y_position                                              ; 3e67: ad 6f 0a
    and #4                                                            ; 3e6a: 29 04
    beq draw_long_rope_sprites                                        ; 3e6c: f0 0f
    lda block_y_position                                              ; 3e6e: ad 6f 0a
    sec                                                               ; 3e71: 38
    sbc #$0c                                                          ; 3e72: e9 0c
    lsr                                                               ; 3e74: 4a
    lsr                                                               ; 3e75: 4a
    lsr                                                               ; 3e76: 4a
    tay                                                               ; 3e77: a8
    lda #spriteid_short_rope                                          ; 3e78: a9 cc
    jsr draw_sprite_a_at_cell_xy                                      ; 3e7a: 20 4c 1f
draw_long_rope_sprites
    lda block_y_position                                              ; 3e7d: ad 6f 0a
    lsr                                                               ; 3e80: 4a
    lsr                                                               ; 3e81: 4a
    lsr                                                               ; 3e82: 4a
    tay                                                               ; 3e83: a8
    dey                                                               ; 3e84: 88
    dey                                                               ; 3e85: 88
    cpy #3                                                            ; 3e86: c0 03
    bcc draw_block                                                    ; 3e88: 90 0a
    lda #spriteid_long_rope                                           ; 3e8a: a9 cb
draw_rope_loop2
    jsr draw_sprite_a_at_cell_xy                                      ; 3e8c: 20 4c 1f
    dey                                                               ; 3e8f: 88
    cpy #3                                                            ; 3e90: c0 03
    bcs draw_rope_loop2                                               ; 3e92: b0 f8
draw_block
    lda #objectid_block                                               ; 3e94: a9 03
    dex                                                               ; 3e96: ca
    jsr set_object_position_from_cell_xy                              ; 3e97: 20 5d 1f
    inx                                                               ; 3e9a: e8
    lda #spriteid_tall_block                                          ; 3e9b: a9 ce
    sta object_spriteid + objectid_block                              ; 3e9d: 8d ab 09
    lda #spriteid_erase1                                              ; 3ea0: a9 cf
    sta object_erase_type + objectid_block                            ; 3ea2: 8d af 38
    lda #$c0                                                          ; 3ea5: a9 c0
    sta object_z_order + objectid_block                               ; 3ea7: 8d c5 38
    lda #objectid_rope_to_block                                       ; 3eaa: a9 04
    jsr set_object_position_from_cell_xy                              ; 3eac: 20 5d 1f
    tax                                                               ; 3eaf: aa
    jsr copy_object_state_to_old                                      ; 3eb0: 20 f7 20
    lda #spriteid_short_rope_to_block2                                ; 3eb3: a9 e2
    sta object_spriteid + objectid_rope_to_block                      ; 3eb5: 8d ac 09
    lda #$bf                                                          ; 3eb8: a9 bf
    sta object_z_order + objectid_rope_to_block                       ; 3eba: 8d c6 38
    ldx #$0f                                                          ; 3ebd: a2 0f
    ldy #$0a                                                          ; 3ebf: a0 0a
    lda #3                                                            ; 3ec1: a9 03
    sta width_in_cells                                                ; 3ec3: 85 3c
    lda #2                                                            ; 3ec5: a9 02
    sta height_in_cells                                               ; 3ec7: 85 3d
    lda #collision_map_solid_rock                                     ; 3ec9: a9 03
    sta value_to_write_to_collision_map                               ; 3ecb: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3ecd: 20 44 1e
position_rope_and_write_to_collision_map_local
    jmp position_rope_and_write_to_collision_map                      ; 3ed0: 4c e8 3f

update_room_1
    lda desired_room_index                                            ; 3ed3: a5 30
    cmp #1                                                            ; 3ed5: c9 01
    bne move_block_position_up                                        ; 3ed7: d0 65
    lda current_player_character                                      ; 3ed9: a5 48
    cmp #6                                                            ; 3edb: c9 06
    bne move_block_position_up                                        ; 3edd: d0 5f
    lda object_x_high                                                 ; 3edf: ad 66 09
    sta l0070                                                         ; 3ee2: 85 70
    lda object_x_low                                                  ; 3ee4: ad 50 09
    lsr l0070                                                         ; 3ee7: 46 70
    ror                                                               ; 3ee9: 6a
    lsr l0070                                                         ; 3eea: 46 70
    ror                                                               ; 3eec: 6a
    lsr l0070                                                         ; 3eed: 46 70
    ror                                                               ; 3eef: 6a
    cmp #$14                                                          ; 3ef0: c9 14
    bcc move_block_position_up                                        ; 3ef2: 90 4a
    lda current_player_animation                                      ; 3ef4: ad df 09
    cmp #monkey_climb_animation - monkey_base_animation               ; 3ef7: c9 51
    beq player_is_a_climbing_monkey                                   ; 3ef9: f0 08
    cmp #monkey_climb_idle_animation - monkey_base_animation          ; 3efb: c9 45
    beq player_is_a_climbing_monkey                                   ; 3efd: f0 04
    cmp #monkey_climb_down_animation - monkey_base_animation          ; 3eff: c9 49
    bne move_block_position_up                                        ; 3f01: d0 3b
player_is_a_climbing_monkey
    lda block_y_position                                              ; 3f03: ad 6f 0a
    cmp #$20 ; ' '                                                    ; 3f06: c9 20
    beq position_rope_and_write_to_collision_map_local                ; 3f08: f0 c6
; move player and accessory up
    lda object_y_low                                                  ; 3f0a: ad 7c 09
    clc                                                               ; 3f0d: 18
    adc #4                                                            ; 3f0e: 69 04
    sta object_y_low                                                  ; 3f10: 8d 7c 09
    lda object_y_low + objectid_player_accessory                      ; 3f13: ad 7d 09
    clc                                                               ; 3f16: 18
    adc #4                                                            ; 3f17: 69 04
    sta object_y_low + objectid_player_accessory                      ; 3f19: 8d 7d 09
; move block down
    lda block_y_position                                              ; 3f1c: ad 6f 0a
    sec                                                               ; 3f1f: 38
    sbc #4                                                            ; 3f20: e9 04
    sta block_y_position                                              ; 3f22: 8d 6f 0a
; check if the player is in room 1
    lda desired_room_index                                            ; 3f25: a5 30
    cmp #1                                                            ; 3f27: c9 01
    bne position_rope_and_write_to_collision_map_local                ; 3f29: d0 a5
; play rope movement sound
    jsr play_sound5                                                   ; 3f2b: 20 1a 40
; set end of rope sprites
    lda #spriteid_short_rope_to_block2                                ; 3f2e: a9 e2
    sta object_spriteid_old + objectid_rope_to_block                  ; 3f30: 8d b7 09
    sta object_spriteid + objectid_rope_to_block                      ; 3f33: 8d ac 09
    lda #spriteid_one_pixel_masked_out                                ; 3f36: a9 00
    sta object_spriteid_old + objectid_rope_end                       ; 3f38: 8d b5 09
    jmp position_rope_and_write_to_collision_map                      ; 3f3b: 4c e8 3f

move_block_position_up
    lda block_y_position                                              ; 3f3e: ad 6f 0a
    cmp #$50 ; 'P'                                                    ; 3f41: c9 50
    bcs position_rope_and_write_to_collision_map_local                ; 3f43: b0 8b
    ldx #$0c                                                          ; 3f45: a2 0c
    ldy #spriteid_short_rope                                          ; 3f47: a0 cc
    adc #4                                                            ; 3f49: 69 04
    cmp #$50 ; 'P'                                                    ; 3f4b: c9 50
    bcs store_block_y_position                                        ; 3f4d: b0 06
    ldx #$10                                                          ; 3f4f: a2 10
    ldy #spriteid_long_rope                                           ; 3f51: a0 cb
    adc #4                                                            ; 3f53: 69 04
store_block_y_position
    sta block_y_position                                              ; 3f55: 8d 6f 0a
    stx unused_x_value                                                ; 3f58: 8e 18 40
    sty unused_rope_spriteid                                          ; 3f5b: 8c 19 40
    lda desired_room_index                                            ; 3f5e: a5 30
    cmp #1                                                            ; 3f60: c9 01
    bne check_if_rope_is_moving                                       ; 3f62: d0 0f
; set rope sprites
    lda #spriteid_one_pixel_masked_out                                ; 3f64: a9 00
    sta object_spriteid_old + objectid_rope_to_block                  ; 3f66: 8d b7 09
    lda #spriteid_long_rope_to_block                                  ; 3f69: a9 e3
    sta object_spriteid + objectid_rope_to_block                      ; 3f6b: 8d ac 09
    lda #spriteid_one_pixel_masked_out                                ; 3f6e: a9 00
    sta object_spriteid_old + objectid_rope_end                       ; 3f70: 8d b5 09
check_if_rope_is_moving
    lda block_y_position                                              ; 3f73: ad 6f 0a
    cmp #$50 ; 'P'                                                    ; 3f76: c9 50
    beq rope_is_at_rest_so_check_for_hamster_being_squashed           ; 3f78: f0 0c
    lda desired_room_index                                            ; 3f7a: a5 30
    cmp #1                                                            ; 3f7c: c9 01
    bne position_rope_and_write_to_collision_map                      ; 3f7e: d0 68
    jsr play_sound5                                                   ; 3f80: 20 1a 40
    jmp position_rope_and_write_to_collision_map                      ; 3f83: 4c e8 3f

rope_is_at_rest_so_check_for_hamster_being_squashed
    lda save_game_level_m_hamster_animation                           ; 3f86: ad 3f 0a
    cmp #hamster_jam_static_animation - hamster_animations            ; 3f89: c9 37
    beq make_sound_for_block_landing_or_hamster_jam_landing           ; 3f8b: f0 45
    cmp #hamster_jam_landed_animation - hamster_animations            ; 3f8d: c9 3b
    beq make_sound_for_block_landing_or_hamster_jam_landing           ; 3f8f: f0 41
    ldx hamster_x                                                     ; 3f91: ae 71 0a
    lda hamster_direction                                             ; 3f94: ad 73 0a
    bmi hamster_looking_left1                                         ; 3f97: 30 06
    cpx #$98                                                          ; 3f99: e0 98
    bcc hamster_just_killed                                           ; 3f9b: 90 08
    bcs make_sound_for_block_landing_or_hamster_jam_landing           ; 3f9d: b0 33
hamster_looking_left1
    cpx #$9c                                                          ; 3f9f: e0 9c
    bcc hamster_just_killed                                           ; 3fa1: 90 02
    bcs make_sound_for_block_landing_or_hamster_jam_landing           ; 3fa3: b0 2d
hamster_just_killed
    lda #hamster_jam_static_animation - hamster_animations            ; 3fa5: a9 37
    sta save_game_level_m_hamster_animation                           ; 3fa7: 8d 3f 0a
    lda #hamster_jam_flying - hamster_animations                      ; 3faa: a9 15
    sta hamster_animation_step                                        ; 3fac: 8d 70 0a
    lda #$70 ; 'p'                                                    ; 3faf: a9 70
    sta hamster_x                                                     ; 3fb1: 8d 71 0a
    lda #1                                                            ; 3fb4: a9 01
    sta hamster_direction                                             ; 3fb6: 8d 73 0a
    lda desired_room_index                                            ; 3fb9: a5 30
    cmp #1                                                            ; 3fbb: c9 01
    bne position_rope_and_write_to_collision_map                      ; 3fbd: d0 29
; hamster death sound
    lda #0                                                            ; 3fbf: a9 00
    ldx #<sound1                                                      ; 3fc1: a2 9f
    ldy #>sound1                                                      ; 3fc3: a0 45
    jsr play_sound_yx                                                 ; 3fc5: 20 f6 38
    ldx #<sound2                                                      ; 3fc8: a2 89
    ldy #>sound2                                                      ; 3fca: a0 45
    jsr play_sound_yx                                                 ; 3fcc: 20 f6 38
    jmp position_rope_and_write_to_collision_map                      ; 3fcf: 4c e8 3f

make_sound_for_block_landing_or_hamster_jam_landing
    lda desired_room_index                                            ; 3fd2: a5 30
    cmp #1                                                            ; 3fd4: c9 01
    bne position_rope_and_write_to_collision_map                      ; 3fd6: d0 10
; block landing sound
    lda #0                                                            ; 3fd8: a9 00
    ldx #<sound3                                                      ; 3fda: a2 73
    ldy #>sound3                                                      ; 3fdc: a0 45
    jsr play_sound_yx                                                 ; 3fde: 20 f6 38
    ldx #<sound4                                                      ; 3fe1: a2 6b
    ldy #>sound4                                                      ; 3fe3: a0 45
    jsr play_sound_yx                                                 ; 3fe5: 20 f6 38
position_rope_and_write_to_collision_map
    lda desired_room_index                                            ; 3fe8: a5 30
    cmp #1                                                            ; 3fea: c9 01
    bne return2                                                       ; 3fec: d0 29
    lda #$50 ; 'P'                                                    ; 3fee: a9 50
    sec                                                               ; 3ff0: 38
    sbc block_y_position                                              ; 3ff1: ed 6f 0a
    clc                                                               ; 3ff4: 18
    adc #$58 ; 'X'                                                    ; 3ff5: 69 58
    sta object_y_low + objectid_rope_end                              ; 3ff7: 8d 7e 09
    ldx #$1f                                                          ; 3ffa: a2 1f
    clc                                                               ; 3ffc: 18
    adc #4                                                            ; 3ffd: 69 04
    lsr                                                               ; 3fff: 4a
    lsr                                                               ; 4000: 4a
    lsr                                                               ; 4001: 4a
    tay                                                               ; 4002: a8
    lda #collision_map_rope                                           ; 4003: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4005: 20 bb 1e
    iny                                                               ; 4008: c8
    lda #collision_map_none                                           ; 4009: a9 00
    jsr write_a_single_value_to_cell_in_collision_map                 ; 400b: 20 bb 1e
    lda block_y_position                                              ; 400e: ad 6f 0a
    sta object_y_low + objectid_block                                 ; 4011: 8d 7f 09
    sta object_y_low + objectid_rope_to_block                         ; 4014: 8d 80 09
return2
    rts                                                               ; 4017: 60

unused_x_value
    !byte 0                                                           ; 4018: 00
unused_rope_spriteid
    !byte 0                                                           ; 4019: 00

play_sound5
    lda #0                                                            ; 401a: a9 00
    ldx #<sound5                                                      ; 401c: a2 55
    ldy #>sound5                                                      ; 401e: a0 45
    jmp play_sound_yx                                                 ; 4020: 4c f6 38

tulip_flower_animation
    !byte spriteid_tulip_flower1                                      ; 4023: e0
    !byte spriteid_tulip_flower2                                      ; 4024: df
    !byte spriteid_tulip_flower3                                      ; 4025: de

return3_local
    jmp return3                                                       ; 4026: 4c 2d 41

update_tulip_growth
    lda save_game_level_m_tulip_growth_index                          ; 4029: ad 49 0a
    beq return3_local                                                 ; 402c: f0 f8
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 402e: ad 2b 13
    beq tulip_stalk_is_drawn                                          ; 4031: f0 45
; check for level change (branch if not)
    lda current_level                                                 ; 4033: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 4035: c5 51
    beq draw_stalk_at_corrent_position                                ; 4037: f0 05
; set tulip animation to finished growing
    lda #$45 ; 'E'                                                    ; 4039: a9 45
    sta save_game_level_m_tulip_growth_index                          ; 403b: 8d 49 0a
draw_stalk_at_corrent_position
    lda desired_room_index                                            ; 403e: a5 30
    cmp #1                                                            ; 4040: c9 01
    bne tulip_stalk_is_drawn                                          ; 4042: d0 34
    lda save_game_level_m_tulip_growth_index                          ; 4044: ad 49 0a
    sec                                                               ; 4047: 38
    sbc #8                                                            ; 4048: e9 08
    bcc tulip_stalk_is_drawn                                          ; 404a: 90 2c
    sta temp_y                                                        ; 404c: 85 70
    ldy #$38 ; '8'                                                    ; 404e: a0 38
    sec                                                               ; 4050: 38
    sbc #$3b ; ';'                                                    ; 4051: e9 3b
    bcs calculate_y_position_of_top_of_stalk                          ; 4053: b0 08
    asl temp_y                                                        ; 4055: 06 70
    lda #$ac                                                          ; 4057: a9 ac
    sec                                                               ; 4059: 38
    sbc temp_y                                                        ; 405a: e5 70
    tay                                                               ; 405c: a8
calculate_y_position_of_top_of_stalk
    tya                                                               ; 405d: 98
    clc                                                               ; 405e: 18                      ; redundant instruction
    tay                                                               ; 405f: a8                      ; redundant instruction
    tya                                                               ; 4060: 98                      ; redundant instruction
    and #7                                                            ; 4061: 29 07
    sta temp_sprite_y_offset                                          ; 4063: 85 3b
; calculate cell y for stalk by dividing by eight
    tya                                                               ; 4065: 98
    lsr                                                               ; 4066: 4a
    lsr                                                               ; 4067: 4a
    lsr                                                               ; 4068: 4a
    tay                                                               ; 4069: a8
    ldx #8                                                            ; 406a: a2 08
    lda #spriteid_tulip_stalk                                         ; 406c: a9 dd
draw_tulip_stalk_loop
    cpy #$15                                                          ; 406e: c0 15
    bcs tulip_stalk_is_drawn                                          ; 4070: b0 06
    jsr draw_sprite_a_at_cell_xy                                      ; 4072: 20 4c 1f
    iny                                                               ; 4075: c8
    bne draw_tulip_stalk_loop                                         ; 4076: d0 f6
tulip_stalk_is_drawn
    lda desired_room_index                                            ; 4078: a5 30
    cmp #1                                                            ; 407a: c9 01
    beq update_tulip_head_object                                      ; 407c: f0 03
increment_tulip_growth_animation_local
    jmp increment_tulip_growth_animation                              ; 407e: 4c 1c 41

update_tulip_head_object
    lda #$40 ; '@'                                                    ; 4081: a9 40
    sta object_x_low + objectid_tulip_head                            ; 4083: 8d 56 09
    lda #0                                                            ; 4086: a9 00
    sta object_x_high + objectid_tulip_head                           ; 4088: 8d 6c 09
    sta object_spriteid + objectid_tulip_head                         ; 408b: 8d ae 09
    lda #1                                                            ; 408e: a9 01
    sta object_direction + objectid_tulip_head                        ; 4090: 8d c4 09
    lda save_game_level_m_tulip_growth_index                          ; 4093: ad 49 0a
    sec                                                               ; 4096: 38
    sbc #8                                                            ; 4097: e9 08
    bcc increment_tulip_growth_animation_local                        ; 4099: 90 e3
    sta l0070                                                         ; 409b: 85 70
    lda #$ff                                                          ; 409d: a9 ff
    sta object_erase_type + objectid_tulip_head                       ; 409f: 8d b2 38
    lda #$f0                                                          ; 40a2: a9 f0
    sta object_z_order + objectid_tulip_head                          ; 40a4: 8d c8 38
    lda l0070                                                         ; 40a7: a5 70
    sec                                                               ; 40a9: 38
    sbc #$3b ; ';'                                                    ; 40aa: e9 3b
    bcs update_tulip_flower                                           ; 40ac: b0 17
    asl l0070                                                         ; 40ae: 06 70
    lda #$ac                                                          ; 40b0: a9 ac
    sec                                                               ; 40b2: 38
    sbc l0070                                                         ; 40b3: e5 70
    sta object_y_low + objectid_tulip_head                            ; 40b5: 8d 82 09
    lda #spriteid_tulip_head                                          ; 40b8: a9 dc
    sta object_spriteid + objectid_tulip_head                         ; 40ba: 8d ae 09
; nothing to erase
    lda #spriteid_one_pixel_masked_out                                ; 40bd: a9 00
    sta object_spriteid_old + objectid_tulip_head                     ; 40bf: 8d b9 09
    jmp set_tulip_collision_map                                       ; 40c2: 4c e6 40

update_tulip_flower
    tay                                                               ; 40c5: a8
    lda tulip_flower_animation,y                                      ; 40c6: b9 23 40
    sta object_spriteid + objectid_tulip_head                         ; 40c9: 8d ae 09
    lda #$38 ; '8'                                                    ; 40cc: a9 38
    sta object_y_low + objectid_tulip_head                            ; 40ce: 8d 82 09
    lda object_spriteid + objectid_tulip_head                         ; 40d1: ad ae 09
    cmp object_spriteid_old + objectid_tulip_head                     ; 40d4: cd b9 09
    bne finished_animating_head_so_nothing_to_erase                   ; 40d7: d0 08
    lda object_y_low + objectid_tulip_head                            ; 40d9: ad 82 09
    cmp object_y_low_old + objectid_tulip_head                        ; 40dc: cd 8d 09
    beq set_tulip_collision_map                                       ; 40df: f0 05
finished_animating_head_so_nothing_to_erase
    lda #spriteid_one_pixel_masked_out                                ; 40e1: a9 00
    sta object_spriteid_old + objectid_tulip_head                     ; 40e3: 8d b9 09
set_tulip_collision_map
    lda object_y_low + objectid_tulip_head                            ; 40e6: ad 82 09
    cmp #$89                                                          ; 40e9: c9 89
    bcs increment_tulip_growth_animation                              ; 40eb: b0 2f
    ldx #8                                                            ; 40ed: a2 08
    ldy #2                                                            ; 40ef: a0 02
    lda #1                                                            ; 40f1: a9 01
    sta width_in_cells                                                ; 40f3: 85 3c
    lda #$14                                                          ; 40f5: a9 14
    sta height_in_cells                                               ; 40f7: 85 3d
    lda #collision_map_rope                                           ; 40f9: a9 02
    sta value_to_write_to_collision_map                               ; 40fb: 85 3e
    jsr read_collision_map_value_for_xy                               ; 40fd: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 4100: c5 3e
    beq set_tulip_head_collision_map                                  ; 4102: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 4104: 20 44 1e
set_tulip_head_collision_map
    lda object_y_low + objectid_tulip_head                            ; 4107: ad 82 09
    sec                                                               ; 410a: 38
    sbc #6                                                            ; 410b: e9 06
    lsr                                                               ; 410d: 4a
    lsr                                                               ; 410e: 4a
    lsr                                                               ; 410f: 4a
    tay                                                               ; 4110: a8
    lda #collision_map_solid_rock                                     ; 4111: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4113: 20 bb 1e
    iny                                                               ; 4116: c8
    lda #collision_map_rope                                           ; 4117: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4119: 20 bb 1e
; check for first update in room (branch if so)
increment_tulip_growth_animation
    lda update_room_first_update_flag                                 ; 411c: ad 2b 13
    bne return3                                                       ; 411f: d0 0c
    lda save_game_level_m_tulip_growth_index                          ; 4121: ad 49 0a
    beq return3                                                       ; 4124: f0 07
    cmp #$45 ; 'E'                                                    ; 4126: c9 45
    beq return3                                                       ; 4128: f0 03
    inc save_game_level_m_tulip_growth_index                          ; 412a: ee 49 0a
return3
    rts                                                               ; 412d: 60

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 20                                                          ; 412e: 14                      ; initial player X cell
    !byte 22                                                          ; 412f: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####    |           |          |    ####
; ###     |           |          |     ###
; ###     |           |          |     ###
; ###     |          S|          |     ###
; ###     |                      |     ###
; ###     |                      |     ###
; ###     |                      |     ###
;         |                      |
;         |                      |
;         |                      |
;         |   ################   |
;         |   ################   |
; #####   |                      |   #####
; #####   |                      |   #####
;         |                      |     ###
;         |                      |     ###
;         |                      |     ###
;         |                      |     ###
;                                      ###
; #####               P                ###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_2_code
    jsr draw_top_and_bottom_rows_of_rock                              ; 4130: 20 24 3b
; draw 3x7 rectangle at (0,2)
    ldx #0                                                            ; 4133: a2 00
    ldy #2                                                            ; 4135: a0 02
    lda #3                                                            ; 4137: a9 03
    sta width_in_cells                                                ; 4139: 85 3c
    lda #7                                                            ; 413b: a9 07
    sta height_in_cells                                               ; 413d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 413f: 20 bb 1a
; draw 3x7 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 4142: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 4144: 20 bb 1a
; draw 3x6 rectangle at (37,16)
    ldy #$10                                                          ; 4147: a0 10
    dec height_in_cells                                               ; 4149: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 414b: 20 bb 1a
; draw 5x2 rectangle at (0,14)
    ldx #0                                                            ; 414e: a2 00
    ldy #$0e                                                          ; 4150: a0 0e
    lda #5                                                            ; 4152: a9 05
    sta width_in_cells                                                ; 4154: 85 3c
    lda #2                                                            ; 4156: a9 02
    sta height_in_cells                                               ; 4158: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 415a: 20 bb 1a
; draw 5x2 rectangle at (35,14)
    ldx #$23 ; '#'                                                    ; 415d: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 415f: 20 bb 1a
; draw 16x2 rectangle at (12,12)
    ldx #$0c                                                          ; 4162: a2 0c
    ldy #$0c                                                          ; 4164: a0 0c
    lda #$10                                                          ; 4166: a9 10
    sta width_in_cells                                                ; 4168: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 416a: 20 bb 1a
; draw 5x1 rectangle at (0,21)
    ldx #0                                                            ; 416d: a2 00
    ldy #$15                                                          ; 416f: a0 15
    lda #5                                                            ; 4171: a9 05
    sta width_in_cells                                                ; 4173: 85 3c
    lda #1                                                            ; 4175: a9 01
    sta height_in_cells                                               ; 4177: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4179: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 417c: 20 90 1b
; draw rope at (8,2) length 18
    ldx #8                                                            ; 417f: a2 08
    ldy #2                                                            ; 4181: a0 02
    lda #$12                                                          ; 4183: a9 12
    jsr draw_rope                                                     ; 4185: 20 b9 1d
; draw rope at (31,2) length 18
    ldx #$1f                                                          ; 4188: a2 1f
    jsr draw_rope                                                     ; 418a: 20 b9 1d
; draw rope at (20,2) length 4
    lda #3                                                            ; 418d: a9 03
    sta width_in_cells                                                ; 418f: 85 3c
    lda #2                                                            ; 4191: a9 02
    sta height_in_cells                                               ; 4193: 85 3d
    ldx #$14                                                          ; 4195: a2 14
    ldy #2                                                            ; 4197: a0 02
    lda #4                                                            ; 4199: a9 04
    jsr draw_rope                                                     ; 419b: 20 b9 1d
; draw sign at (19,5)
    dex                                                               ; 419e: ca
    ldy #5                                                            ; 419f: a0 05
    lda #spriteid_sign                                                ; 41a1: a9 db
    jsr draw_sprite_a_at_cell_xy                                      ; 41a3: 20 4c 1f
    jsr start_room                                                    ; 41a6: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 41a9: 20 da 12
    sta room_exit_direction                                           ; 41ac: 85 70
    and #exit_room_left                                               ; 41ae: 29 01
    beq room_2_check_right_exit                                       ; 41b0: f0 07
    ldx #1                                                            ; 41b2: a2 01
    ldy current_level                                                 ; 41b4: a4 31
    jmp initialise_level_and_room                                     ; 41b6: 4c 40 11

room_2_check_right_exit
    lda room_exit_direction                                           ; 41b9: a5 70
    and #exit_room_right                                              ; 41bb: 29 04
    beq room_2_game_update_loop                                       ; 41bd: f0 ea
    ldx #3                                                            ; 41bf: a2 03
    ldy current_level                                                 ; 41c1: a4 31
    jmp initialise_level_and_room                                     ; 41c3: 4c 40 11

tulip_bulb_x_animations
    !byte 0                                                           ; 41c6: 00
tulip_bulb_x_animation0
    !byte 0                                                           ; 41c7: 00
    !byte 7                                                           ; 41c8: 07
    !byte 7                                                           ; 41c9: 07
    !byte 7                                                           ; 41ca: 07
    !byte 6                                                           ; 41cb: 06
    !byte 6                                                           ; 41cc: 06
    !byte 5                                                           ; 41cd: 05
    !byte $80                                                         ; 41ce: 80
tulip_bulb_x_animation1
    !byte 4                                                           ; 41cf: 04
    !byte 3                                                           ; 41d0: 03
    !byte 2                                                           ; 41d1: 02
    !byte 1                                                           ; 41d2: 01
    !byte $80                                                         ; 41d3: 80
tulip_bulb_x_animation2
    !byte 0                                                           ; 41d4: 00
    !byte $80                                                         ; 41d5: 80
tulip_bulb_y_animations
    !byte 1                                                           ; 41d6: 01
    !byte 2                                                           ; 41d7: 02
    !byte 3                                                           ; 41d8: 03
    !byte 4                                                           ; 41d9: 04
    !byte 6                                                           ; 41da: 06
    !byte 8                                                           ; 41db: 08
    !byte $80                                                         ; 41dc: 80

return4
    rts                                                               ; 41dd: 60

room_2_update_handler
    lda #2                                                            ; 41de: a9 02
    sta currently_updating_logic_for_room_index                       ; 41e0: 8d ba 1a
    ldx #3                                                            ; 41e3: a2 03
    ldy #6                                                            ; 41e5: a0 06
    lda #objectid_fire1                                               ; 41e7: a9 02
    jsr update_brazier_and_fire                                       ; 41e9: 20 88 19
    ldx #$25 ; '%'                                                    ; 41ec: a2 25
    lda #objectid_fire2                                               ; 41ee: a9 03
    jsr update_brazier_and_fire                                       ; 41f0: 20 88 19
    lda save_game_level_m_tulip_growth_index                          ; 41f3: ad 49 0a
    bne return4                                                       ; 41f6: d0 e5
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 41f8: ad 2b 13
    bne initialise_room_2                                             ; 41fb: d0 03
    jmp room_2_not_first_update                                       ; 41fd: 4c 75 42

initialise_room_2
    lda #spriteid_tulip_bulb_menu_item                                ; 4200: a9 d8
    sta toolbar_collectable_spriteids+1                               ; 4202: 8d e9 2e
    lda #spriteid_tulip_bulb                                          ; 4205: a9 d9
    sta collectable_spriteids+1                                       ; 4207: 8d ee 2e
    sta collectable_being_used_spriteids + 1                          ; 420a: 8d f3 2e
; check for level change (branch if not)
    lda current_level                                                 ; 420d: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 420f: c5 51
    beq room_change_only                                              ; 4211: f0 31
    lda save_game_level_m_got_tulip_bulb_progress                     ; 4213: ad 40 0a
    beq initialise_tulip_bulb                                         ; 4216: f0 08
    bmi room_change_only                                              ; 4218: 30 2a
    dec tulip_bulb_steps_to_catch_up_while_offscreen                  ; 421a: ce 74 0a
    jmp room_change_only                                              ; 421d: 4c 44 42

initialise_tulip_bulb
    lda #$a1                                                          ; 4220: a9 a1
    sta save_game_level_m_tulip_bulb_x_low                            ; 4222: 8d 42 0a
    lda #0                                                            ; 4225: a9 00
    sta save_game_level_m_tulip_bulb_x_high                           ; 4227: 8d 43 0a
    lda #1                                                            ; 422a: a9 01
    sta save_game_level_m_tulip_bulb_direction1                       ; 422c: 8d 45 0a
    sta save_game_level_m_tulip_bulb_direction2                       ; 422f: 8d 47 0a
    lda #$5b ; '['                                                    ; 4232: a9 5b
    sta save_game_level_m_tulip_bulb_y                                ; 4234: 8d 44 0a
    lda #2                                                            ; 4237: a9 02
    sta save_game_level_m_tulip_bulb_room                             ; 4239: 8d 46 0a
    lda #tulip_bulb_x_animation2 - tulip_bulb_x_animations            ; 423c: a9 0e
    sta save_game_level_m_got_tulip_bulb_progress                     ; 423e: 8d 40 0a
    sta save_game_level_m_tulip_bulb_x_animation_step                 ; 4241: 8d 41 0a
room_change_only
    lda desired_room_index                                            ; 4244: a5 30
    cmp save_game_level_m_tulip_bulb_room                             ; 4246: cd 46 0a
    bne hide_bulb1                                                    ; 4249: d0 22
    lda save_game_level_m_got_tulip_bulb_progress                     ; 424b: ad 40 0a
    bmi hide_bulb1                                                    ; 424e: 30 1d
    jsr update_tulip_bulb_object                                      ; 4250: 20 80 44
fast_forward_tulip_bulb
    lda desired_room_index                                            ; 4253: a5 30
    cmp save_game_level_m_tulip_bulb_room                             ; 4255: cd 46 0a
    bne hide_bulb1                                                    ; 4258: d0 13
    lda tulip_bulb_steps_to_catch_up_while_offscreen                  ; 425a: ad 74 0a
    beq hide_bulb1                                                    ; 425d: f0 0e
    dec tulip_bulb_steps_to_catch_up_while_offscreen                  ; 425f: ce 74 0a
    ldx #objectid_tulip_bulb                                          ; 4262: a2 06
    jsr copy_object_state_to_old                                      ; 4264: 20 f7 20
    jsr update_tulip                                                  ; 4267: 20 71 43
    jmp fast_forward_tulip_bulb                                       ; 426a: 4c 53 42

hide_bulb1
    lda #spriteid_one_pixel_masked_out                                ; 426d: a9 00
    sta object_spriteid_old + objectid_tulip_bulb                     ; 426f: 8d b9 09
return5_local
    jmp return5                                                       ; 4272: 4c 70 43

room_2_not_first_update
    lda #0                                                            ; 4275: a9 00
    sta player_just_used_tulip_bulb_flag                              ; 4277: 8d a8 44
    lda player_held_object_spriteid                                   ; 427a: a5 52
    sta remember_player_help_sprite                                   ; 427c: 8d a9 44
    lda object_spriteid_old + objectid_tulip_bulb                     ; 427f: ad b9 09
    sta remember_old_tulip_bulb_sprite                                ; 4282: 8d aa 44
    lda save_game_level_m_got_tulip_bulb_progress                     ; 4285: ad 40 0a
    bmi player_is_holding_tulip_bulb                                  ; 4288: 30 12
    lda desired_room_index                                            ; 428a: a5 30
    cmp save_game_level_m_tulip_bulb_room                             ; 428c: cd 46 0a
    beq tulip_is_in_current_room                                      ; 428f: f0 53
    lda tulip_bulb_steps_to_catch_up_while_offscreen                  ; 4291: ad 74 0a
    bmi return5_local                                                 ; 4294: 30 dc
    inc tulip_bulb_steps_to_catch_up_while_offscreen                  ; 4296: ee 74 0a
    jmp return5                                                       ; 4299: 4c 70 43

player_is_holding_tulip_bulb
    lda #spriteid_tulip_bulb_menu_item                                ; 429c: a9 d8
    cmp player_using_object_spriteid                                  ; 429e: cd b6 2e
    bne return5_local                                                 ; 42a1: d0 cf
    cmp previous_player_using_object_spriteid                         ; 42a3: cd b7 2e
    beq return5_local                                                 ; 42a6: f0 ca
; player just used the tulip bulb
    dec player_just_used_tulip_bulb_flag                              ; 42a8: ce a8 44
    lda desired_room_index                                            ; 42ab: a5 30
; set up tulip bulb object
    sta save_game_level_m_tulip_bulb_room                             ; 42ad: 8d 46 0a
    lda object_direction                                              ; 42b0: ad be 09
    sta save_game_level_m_tulip_bulb_direction1                       ; 42b3: 8d 45 0a
    sta save_game_level_m_tulip_bulb_direction2                       ; 42b6: 8d 47 0a
    lda object_x_low + objectid_player_accessory                      ; 42b9: ad 51 09
    sta save_game_level_m_tulip_bulb_x_low                            ; 42bc: 8d 42 0a
    lda object_x_high + objectid_player_accessory                     ; 42bf: ad 67 09
    sta save_game_level_m_tulip_bulb_x_high                           ; 42c2: 8d 43 0a
    lda object_y_low + objectid_player_accessory                      ; 42c5: ad 7d 09
    sta save_game_level_m_tulip_bulb_y                                ; 42c8: 8d 44 0a
    lda #tulip_bulb_x_animation0 - tulip_bulb_x_animations            ; 42cb: a9 01
    sta save_game_level_m_tulip_bulb_x_animation_step                 ; 42cd: 8d 41 0a
    sta save_game_level_m_got_tulip_bulb_progress                     ; 42d0: 8d 40 0a
    lda #0                                                            ; 42d3: a9 00
    sta save_game_level_m_tulip_bulb_y_animation_step                 ; 42d5: 8d 48 0a
    jsr update_tulip_bulb_object                                      ; 42d8: 20 80 44
    ldx #objectid_tulip_bulb                                          ; 42db: a2 06
    jsr copy_object_state_to_old                                      ; 42dd: 20 f7 20
    lda #0                                                            ; 42e0: a9 00
    sta player_held_object_spriteid                                   ; 42e2: 85 52
tulip_is_in_current_room
    jsr update_tulip                                                  ; 42e4: 20 71 43
    lda desired_room_index                                            ; 42e7: a5 30
    cmp save_game_level_m_tulip_bulb_room                             ; 42e9: cd 46 0a
    beq check_for_tulib_bulb_player_collision                         ; 42ec: f0 05
    lda #0                                                            ; 42ee: a9 00
    sta tulip_bulb_steps_to_catch_up_while_offscreen                  ; 42f0: 8d 74 0a
check_for_tulib_bulb_player_collision
    lda remember_old_tulip_bulb_sprite                                ; 42f3: ad aa 44
    sta object_spriteid_old + objectid_tulip_bulb                     ; 42f6: 8d b9 09
    ldx #objectid_old_player                                          ; 42f9: a2 0b
    ldy #objectid_tulip_bulb                                          ; 42fb: a0 06
    jsr test_for_collision_between_objects_x_and_y                    ; 42fd: 20 e2 28
    ldx remember_player_help_sprite                                   ; 4300: ae a9 44
    stx player_held_object_spriteid                                   ; 4303: 86 52
    ora #0                                                            ; 4305: 09 00
    beq check_if_bulb_just_used                                       ; 4307: f0 17
    lda player_just_used_tulip_bulb_flag                              ; 4309: ad a8 44
    bne take_bulb                                                     ; 430c: d0 05
    lda #spriteid_tulip_bulb_menu_item                                ; 430e: a9 d8
    jsr find_or_create_menu_slot_for_A                                ; 4310: 20 bd 2b
take_bulb
    lda #spriteid_one_pixel_masked_out                                ; 4313: a9 00
    sta object_spriteid + objectid_tulip_bulb                         ; 4315: 8d ae 09
    lda #$ff                                                          ; 4318: a9 ff
    sta save_game_level_m_got_tulip_bulb_progress                     ; 431a: 8d 40 0a
    jmp return5                                                       ; 431d: 4c 70 43

check_if_bulb_just_used
    lda player_just_used_tulip_bulb_flag                              ; 4320: ad a8 44
    beq check_for_bulb_movement                                       ; 4323: f0 0f
    lda #spriteid_tulip_bulb_menu_item                                ; 4325: a9 d8
    jsr remove_item_from_toolbar_menu                                 ; 4327: 20 e0 2b
    lda #spriteid_one_pixel_masked_out                                ; 432a: a9 00
    sta object_spriteid + objectid_player_accessory                   ; 432c: 8d a9 09
    sta player_using_object_spriteid                                  ; 432f: 8d b6 2e
    sta player_held_object_spriteid                                   ; 4332: 85 52
check_for_bulb_movement
    lda object_x_low + objectid_tulip_bulb                            ; 4334: ad 56 09
    cmp object_x_low_old + objectid_tulip_bulb                        ; 4337: cd 61 09
    beq check_for_bulb_movement_in_y                                  ; 433a: f0 1a
    lda save_game_level_m_tulip_bulb_direction2                       ; 433c: ad 47 0a
    bmi moving_bulb_left                                              ; 433f: 30 06
    inc temp_right_offset                                             ; 4341: ee d1 24
    jmp moving_bulb                                                   ; 4344: 4c 4a 43

moving_bulb_left
    dec temp_left_offset                                              ; 4347: ce d0 24
moving_bulb
    lda #1                                                            ; 434a: a9 01
    sta temp_bottom_offset                                            ; 434c: 8d 51 25
    lda #objectid_tulip_bulb                                          ; 434f: a9 06
    jsr get_solid_rock_collision_for_object_a                         ; 4351: 20 94 28
    bne bulb_landed                                                   ; 4354: d0 17
check_for_bulb_movement_in_y
    lda object_y_low + objectid_tulip_bulb                            ; 4356: ad 82 09
    cmp object_y_low_old + objectid_tulip_bulb                        ; 4359: cd 8d 09
    beq return5                                                       ; 435c: f0 12
; check for room collision
    dec temp_top_offset                                               ; 435e: ce 50 25
    lda #2                                                            ; 4361: a9 02
    sta temp_bottom_offset                                            ; 4363: 8d 51 25
    lda #objectid_tulip_bulb                                          ; 4366: a9 06
    jsr get_solid_rock_collision_for_object_a                         ; 4368: 20 94 28
    beq return5                                                       ; 436b: f0 03
bulb_landed
    jsr play_landing_sound                                            ; 436d: 20 a9 23
return5
    rts                                                               ; 4370: 60

update_tulip
    lda save_game_level_m_tulip_bulb_room                             ; 4371: ad 46 0a
    cmp #1                                                            ; 4374: c9 01
    bne move_bulb_x_position1                                         ; 4376: d0 18
    ldx #objectid_old_tulip_bulb                                      ; 4378: a2 11
    ldy #objectid_hamster_feet_or_jam                                 ; 437a: a0 05
    jsr test_for_collision_between_objects_x_and_y                    ; 437c: 20 e2 28
    beq move_bulb_x_position1                                         ; 437f: f0 0f
; the tulip bulb is planted in the ground with hamster jam
    lda #spriteid_one_pixel_masked_out                                ; 4381: a9 00
    sta object_spriteid + objectid_tulip_bulb                         ; 4383: 8d ae 09
; start growing
    lda #1                                                            ; 4386: a9 01
    sta save_game_level_m_tulip_growth_index                          ; 4388: 8d 49 0a
    lda #0                                                            ; 438b: a9 00
    sta tulip_bulb_steps_to_catch_up_while_offscreen                  ; 438d: 8d 74 0a
move_bulb_x_position1
    lda save_game_level_m_tulip_bulb_x_animation_step                 ; 4390: ad 41 0a
    clc                                                               ; 4393: 18
    adc #1                                                            ; 4394: 69 01
    tay                                                               ; 4396: a8
    lda tulip_bulb_x_animations,y                                     ; 4397: b9 c6 41
    cmp #$80                                                          ; 439a: c9 80
    bne check_animation                                               ; 439c: d0 03
    ldy save_game_level_m_got_tulip_bulb_progress                     ; 439e: ac 40 0a
check_animation
    lda save_game_level_m_got_tulip_bulb_progress                     ; 43a1: ad 40 0a
    cmp #tulip_bulb_x_animation0 - tulip_bulb_x_animations            ; 43a4: c9 01
    bne check_if_tulip_bulb_x_animation1                              ; 43a6: d0 0d
    cpy save_game_level_m_got_tulip_bulb_progress                     ; 43a8: cc 40 0a
    bne set_bulb_animation_step                                       ; 43ab: d0 22
    ldy #tulip_bulb_x_animation1 - tulip_bulb_x_animations            ; 43ad: a0 09
    sty save_game_level_m_got_tulip_bulb_progress                     ; 43af: 8c 40 0a
    jmp set_bulb_animation_step                                       ; 43b2: 4c cf 43

check_if_tulip_bulb_x_animation1
    cpy #tulip_bulb_x_animation1 - tulip_bulb_x_animations            ; 43b5: c0 09
    bne update_bulb_animation                                         ; 43b7: d0 05
    ldy #tulip_bulb_x_animation2 - tulip_bulb_x_animations            ; 43b9: a0 0e
    sty save_game_level_m_got_tulip_bulb_progress                     ; 43bb: 8c 40 0a
update_bulb_animation
    lda #objectid_tulip_bulb                                          ; 43be: a9 06
    jsr update_object_hitting_floor                                   ; 43c0: 20 70 27
    beq set_bulb_animation_step                                       ; 43c3: f0 0a
    lda object_just_fallen_off_edge_direction                         ; 43c5: ad 90 28
    beq set_bulb_animation_step                                       ; 43c8: f0 05
    ldy #tulip_bulb_x_animation1 - tulip_bulb_x_animations            ; 43ca: a0 09
    sty save_game_level_m_got_tulip_bulb_progress                     ; 43cc: 8c 40 0a
set_bulb_animation_step
    sty save_game_level_m_tulip_bulb_x_animation_step                 ; 43cf: 8c 41 0a
    lda tulip_bulb_x_animations,y                                     ; 43d2: b9 c6 41
    ldx save_game_level_m_tulip_bulb_direction2                       ; 43d5: ae 47 0a
    bpl sign_extending_a_to_ax                                        ; 43d8: 10 05
    eor #$ff                                                          ; 43da: 49 ff
    clc                                                               ; 43dc: 18
    adc #1                                                            ; 43dd: 69 01
sign_extending_a_to_ax
    ldx #0                                                            ; 43df: a2 00
    ora #0                                                            ; 43e1: 09 00
    bpl move_bulb_x_position2                                         ; 43e3: 10 01
    dex                                                               ; 43e5: ca
move_bulb_x_position2
    clc                                                               ; 43e6: 18
    adc save_game_level_m_tulip_bulb_x_low                            ; 43e7: 6d 42 0a
    sta save_game_level_m_tulip_bulb_x_low                            ; 43ea: 8d 42 0a
    txa                                                               ; 43ed: 8a
    adc save_game_level_m_tulip_bulb_x_high                           ; 43ee: 6d 43 0a
    sta save_game_level_m_tulip_bulb_x_high                           ; 43f1: 8d 43 0a
    ldy save_game_level_m_tulip_bulb_y_animation_step                 ; 43f4: ac 48 0a
    lda #2                                                            ; 43f7: a9 02
    sta temp_bottom_offset                                            ; 43f9: 8d 51 25
    lda #objectid_tulip_bulb                                          ; 43fc: a9 06
    jsr get_solid_rock_collision_for_object_a                         ; 43fe: 20 94 28
    beq update_bulb_y_position                                        ; 4401: f0 0c
    ldy #0                                                            ; 4403: a0 00
    lda save_game_level_m_got_tulip_bulb_progress                     ; 4405: ad 40 0a
    cmp #tulip_bulb_x_animation2 - tulip_bulb_x_animations            ; 4408: c9 0e
    bne update_bulb_y_position                                        ; 440a: d0 03
    sty tulip_bulb_steps_to_catch_up_while_offscreen                  ; 440c: 8c 74 0a
update_bulb_y_position
    lda tulip_bulb_y_animations,y                                     ; 440f: b9 d6 41
    clc                                                               ; 4412: 18
    adc save_game_level_m_tulip_bulb_y                                ; 4413: 6d 44 0a
    sta save_game_level_m_tulip_bulb_y                                ; 4416: 8d 44 0a
    iny                                                               ; 4419: c8
    lda tulip_bulb_y_animations,y                                     ; 441a: b9 d6 41
    cmp #$80                                                          ; 441d: c9 80
    bne save_bulb_animation_step                                      ; 441f: d0 01
    dey                                                               ; 4421: 88
save_bulb_animation_step
    sty save_game_level_m_tulip_bulb_y_animation_step                 ; 4422: 8c 48 0a
    jsr update_tulip_bulb_object                                      ; 4425: 20 80 44
    lda #objectid_tulip_bulb                                          ; 4428: a9 06
    jsr update_object_a_solid_rock_collision                          ; 442a: 20 f5 25
    lda object_x_low + objectid_tulip_bulb                            ; 442d: ad 56 09
    sta save_game_level_m_tulip_bulb_x_low                            ; 4430: 8d 42 0a
    lda object_x_high + objectid_tulip_bulb                           ; 4433: ad 6c 09
    sta save_game_level_m_tulip_bulb_x_high                           ; 4436: 8d 43 0a
    lda object_y_low + objectid_tulip_bulb                            ; 4439: ad 82 09
    sta save_game_level_m_tulip_bulb_y                                ; 443c: 8d 44 0a
    ldx #objectid_tulip_bulb                                          ; 443f: a2 06
    jsr find_left_and_right_of_object                                 ; 4441: 20 34 24
    lda save_game_level_m_tulip_bulb_direction2                       ; 4444: ad 47 0a
    bmi move_bulb_one_room_left                                       ; 4447: 30 1c
    lda object_left_cell_x                                            ; 4449: a5 78
    cmp #game_area_width_cells                                        ; 444b: c9 28
    bcc return6                                                       ; 444d: 90 30
; move bulb to next room to the right
    lda save_game_level_m_tulip_bulb_x_low                            ; 444f: ad 42 0a
    sec                                                               ; 4452: 38
    sbc #$40 ; '@'                                                    ; 4453: e9 40
    sta save_game_level_m_tulip_bulb_x_low                            ; 4455: 8d 42 0a
    lda #0                                                            ; 4458: a9 00
    sbc #0                                                            ; 445a: e9 00
    sta save_game_level_m_tulip_bulb_x_high                           ; 445c: 8d 43 0a
    inc save_game_level_m_tulip_bulb_room                             ; 445f: ee 46 0a
    jmp hide_bulb                                                     ; 4462: 4c 7a 44

move_bulb_one_room_left
    lda object_right_cell_x                                           ; 4465: a5 79
    bpl return6                                                       ; 4467: 10 16
    lda save_game_level_m_tulip_bulb_x_low                            ; 4469: ad 42 0a
    clc                                                               ; 446c: 18
    adc #$40 ; '@'                                                    ; 446d: 69 40
    sta save_game_level_m_tulip_bulb_x_low                            ; 446f: 8d 42 0a
    lda #1                                                            ; 4472: a9 01
    sta save_game_level_m_tulip_bulb_x_high                           ; 4474: 8d 43 0a
    dec save_game_level_m_tulip_bulb_room                             ; 4477: ce 46 0a
hide_bulb
    lda #spriteid_one_pixel_masked_out                                ; 447a: a9 00
    sta object_spriteid + objectid_tulip_bulb                         ; 447c: 8d ae 09
return6
    rts                                                               ; 447f: 60

update_tulip_bulb_object
    lda #spriteid_erase3                                              ; 4480: a9 da
    sta object_erase_type + objectid_tulip_bulb                       ; 4482: 8d b2 38
    lda #$f0                                                          ; 4485: a9 f0
    sta object_z_order + objectid_tulip_bulb                          ; 4487: 8d c8 38
    lda save_game_level_m_tulip_bulb_x_low                            ; 448a: ad 42 0a
    sta object_x_low + objectid_tulip_bulb                            ; 448d: 8d 56 09
    lda save_game_level_m_tulip_bulb_x_high                           ; 4490: ad 43 0a
    sta object_x_high + objectid_tulip_bulb                           ; 4493: 8d 6c 09
    lda save_game_level_m_tulip_bulb_y                                ; 4496: ad 44 0a
    sta object_y_low + objectid_tulip_bulb                            ; 4499: 8d 82 09
    lda #spriteid_tulip_bulb                                          ; 449c: a9 d9
    sta object_spriteid + objectid_tulip_bulb                         ; 449e: 8d ae 09
    lda save_game_level_m_tulip_bulb_direction1                       ; 44a1: ad 45 0a
    sta object_direction + objectid_tulip_bulb                        ; 44a4: 8d c4 09
    rts                                                               ; 44a7: 60

player_just_used_tulip_bulb_flag
    !byte 0                                                           ; 44a8: 00
remember_player_help_sprite
    !byte 0                                                           ; 44a9: 00
remember_old_tulip_bulb_sprite
    !byte 0                                                           ; 44aa: 00
    !byte $60                                                         ; 44ab: 60                      ; unused
; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 20                                                          ; 44ac: 14                      ; initial player X cell
    !byte 22                                                          ; 44ad: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####    |           |           |   ####
; ###     |           |           |    ###
; ###     |           |           |    ###
; ###     |           |           |    ###
; ###     |           |           |    ###
; ###     |           |           |    ###
; ###     |           |           |    ###
;         |           |           |    ###
;         |    OOO    |    OOO    |    ###
;         |    OOO         OOO    |    ###
;         |   #####       #####   |    ###
;         |   #####       #####   |    ###
; #####   |                       |    ###
; #####   |                       |    ###
; ###     |                       |    ###
; ###     |                       |    ###
; ###                                  ###
; ###                                  ###
; ###                               OOO###
; ###                 P             OOO###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_3_code
    jsr draw_top_and_bottom_rows_of_rock                              ; 44ae: 20 24 3b
; draw 3x7 rectangle at (0,2)
    ldx #0                                                            ; 44b1: a2 00
    ldy #2                                                            ; 44b3: a0 02
    lda #3                                                            ; 44b5: a9 03
    sta width_in_cells                                                ; 44b7: 85 3c
    lda #7                                                            ; 44b9: a9 07
    sta height_in_cells                                               ; 44bb: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 44bd: 20 bb 1a
; draw 3x20 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 44c0: a2 25
    lda #$14                                                          ; 44c2: a9 14
    sta height_in_cells                                               ; 44c4: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 44c6: 20 bb 1a
; draw 3x8 rectangle at (0,14)
    ldx #0                                                            ; 44c9: a2 00
    ldy #$0e                                                          ; 44cb: a0 0e
    lda #8                                                            ; 44cd: a9 08
    sta height_in_cells                                               ; 44cf: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 44d1: 20 bb 1a
; draw 2x2 rectangle at (3,14)
    ldx #3                                                            ; 44d4: a2 03
    dec width_in_cells                                                ; 44d6: c6 3c
    lda #2                                                            ; 44d8: a9 02
    sta height_in_cells                                               ; 44da: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 44dc: 20 bb 1a
; draw 5x2 rectangle at (12,12)
    ldx #$0c                                                          ; 44df: a2 0c
    ldy #$0c                                                          ; 44e1: a0 0c
    lda #5                                                            ; 44e3: a9 05
    sta width_in_cells                                                ; 44e5: 85 3c
    lda #2                                                            ; 44e7: a9 02
    sta height_in_cells                                               ; 44e9: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 44eb: 20 bb 1a
; draw 5x2 rectangle at (24,12)
    ldx #$18                                                          ; 44ee: a2 18
    jsr copy_rectangle_of_memory_to_screen                            ; 44f0: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 44f3: 20 90 1b
; draw tall block at (13,10) of size (3x2)
    lda #3                                                            ; 44f6: a9 03
    sta width_in_cells                                                ; 44f8: 85 3c
    lda #2                                                            ; 44fa: a9 02
    sta height_in_cells                                               ; 44fc: 85 3d
    ldx #$0d                                                          ; 44fe: a2 0d
    ldy #$0a                                                          ; 4500: a0 0a
    lda #spriteid_tall_block                                          ; 4502: a9 ce
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 4504: 20 57 1f
; draw tall block at (25,10) of size (3x2)
    ldx #$19                                                          ; 4507: a2 19
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 4509: 20 57 1f
; draw tall block at (34,20) of size (3x2)
    ldx #$22 ; '"'                                                    ; 450c: a2 22
    ldy #$14                                                          ; 450e: a0 14
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 4510: 20 57 1f
; draw rope at (8,2) length 16
    ldx #8                                                            ; 4513: a2 08
    ldy #2                                                            ; 4515: a0 02
    lda #$10                                                          ; 4517: a9 10
    jsr draw_rope                                                     ; 4519: 20 b9 1d
; draw rope at (32,2) length 16
    ldx #$20 ; ' '                                                    ; 451c: a2 20
    jsr draw_rope                                                     ; 451e: 20 b9 1d
; draw rope at (20,2) length 9
    ldx #$14                                                          ; 4521: a2 14
    lda #9                                                            ; 4523: a9 09
    jsr draw_rope                                                     ; 4525: 20 b9 1d
    jsr start_room                                                    ; 4528: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 452b: 20 da 12
    and #exit_room_left                                               ; 452e: 29 01
    beq room_3_game_update_loop                                       ; 4530: f0 f9
    ldx #2                                                            ; 4532: a2 02
    ldy current_level                                                 ; 4534: a4 31
    jmp initialise_level_and_room                                     ; 4536: 4c 40 11

room_3_update_handler
    lda #3                                                            ; 4539: a9 03
    sta currently_updating_logic_for_room_index                       ; 453b: 8d ba 1a
    ldx #3                                                            ; 453e: a2 03
    ldy #6                                                            ; 4540: a0 06
    lda #objectid_fire2                                               ; 4542: a9 03
    jmp update_brazier_and_fire                                       ; 4544: 4c 88 19

envelope1
    !byte 5                                                           ; 4547: 05                      ; envelope number
    !byte 1                                                           ; 4548: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 4549: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 454a: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 454b: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 454c: 00                      ; number of steps in section 1
    !byte 0                                                           ; 454d: 00                      ; number of steps in section 2
    !byte 0                                                           ; 454e: 00                      ; number of steps in section 3
    !byte 10                                                          ; 454f: 0a                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4550: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4551: 00                      ; change of amplitude per step during sustain phase
    !byte 216                                                         ; 4552: d8                      ; change of amplitude per step during release phase
    !byte 40                                                          ; 4553: 28                      ; target of level at end of attack phase
    !byte 0                                                           ; 4554: 00                      ; target of level at end of decay phase
sound5
    !word $10                                                         ; 4555: 10 00                   ; channel
    !word 5                                                           ; 4557: 05 00                   ; amplitude
    !word 4                                                           ; 4559: 04 00                   ; pitch
    !word 4                                                           ; 455b: 04 00                   ; duration
envelope2
    !byte 6                                                           ; 455d: 06                      ; envelope number
    !byte 1                                                           ; 455e: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 455f: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 4560: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 4561: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 4562: 00                      ; number of steps in section 1
    !byte 0                                                           ; 4563: 00                      ; number of steps in section 2
    !byte 0                                                           ; 4564: 00                      ; number of steps in section 3
    !byte 55                                                          ; 4565: 37                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4566: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4567: 00                      ; change of amplitude per step during sustain phase
    !byte 250                                                         ; 4568: fa                      ; change of amplitude per step during release phase
    !byte 110                                                         ; 4569: 6e                      ; target of level at end of attack phase
    !byte 55                                                          ; 456a: 37                      ; target of level at end of decay phase
sound4
    !word $10                                                         ; 456b: 10 00                   ; channel
    !word 6                                                           ; 456d: 06 00                   ; amplitude
    !word 7                                                           ; 456f: 07 00                   ; pitch
    !word 1                                                           ; 4571: 01 00                   ; duration
sound3
    !word $11                                                         ; 4573: 11 00                   ; channel
    !word 0                                                           ; 4575: 00 00                   ; amplitude
    !word 210                                                         ; 4577: d2 00                   ; pitch
    !word 1                                                           ; 4579: 01 00                   ; duration
envelope4
    !byte 7                                                           ; 457b: 07                      ; envelope number
    !byte 2                                                           ; 457c: 02                      ; step length (100ths of a second)
    !byte 0                                                           ; 457d: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 457e: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 457f: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 4580: 00                      ; number of steps in section 1
    !byte 0                                                           ; 4581: 00                      ; number of steps in section 2
    !byte 0                                                           ; 4582: 00                      ; number of steps in section 3
    !byte 120                                                         ; 4583: 78                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4584: 00                      ; change of amplitude per step during decay phase
    !byte 246                                                         ; 4585: f6                      ; change of amplitude per step during sustain phase
    !byte 246                                                         ; 4586: f6                      ; change of amplitude per step during release phase
    !byte 120                                                         ; 4587: 78                      ; target of level at end of attack phase
    !byte 0                                                           ; 4588: 00                      ; target of level at end of decay phase
sound2
    !word $10                                                         ; 4589: 10 00                   ; channel
    !word 7                                                           ; 458b: 07 00                   ; amplitude
    !word 3                                                           ; 458d: 03 00                   ; pitch
    !word 2                                                           ; 458f: 02 00                   ; duration
envelope3
    !byte 8                                                           ; 4591: 08                      ; envelope number
    !byte 130                                                         ; 4592: 82                      ; step length (100ths of a second)
    !byte 252                                                         ; 4593: fc                      ; pitch change per step in section 1
    !byte 254                                                         ; 4594: fe                      ; pitch change per step in section 2
    !byte 255                                                         ; 4595: ff                      ; pitch change per step in section 3
    !byte 20                                                          ; 4596: 14                      ; number of steps in section 1
    !byte 40                                                          ; 4597: 28                      ; number of steps in section 2
    !byte 80                                                          ; 4598: 50                      ; number of steps in section 3
    !byte 0                                                           ; 4599: 00                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 459a: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 459b: 00                      ; change of amplitude per step during sustain phase
    !byte 0                                                           ; 459c: 00                      ; change of amplitude per step during release phase
    !byte 0                                                           ; 459d: 00                      ; target of level at end of attack phase
    !byte 0                                                           ; 459e: 00                      ; target of level at end of decay phase
sound1
    !word $11                                                         ; 459f: 11 00                   ; channel
    !word 8                                                           ; 45a1: 08 00                   ; amplitude
    !word 128                                                         ; 45a3: 80 00                   ; pitch
    !word 2                                                           ; 45a5: 02 00                   ; duration
ground_fill_2x2_top_left
    !byte %#......#                                                   ; 45a7: 81
    !byte %.....##.                                                   ; 45a8: 06
    !byte %...##...                                                   ; 45a9: 18
    !byte %.##.....                                                   ; 45aa: 60
    !byte %#.......                                                   ; 45ab: 80
    !byte %#.......                                                   ; 45ac: 80
    !byte %.#....##                                                   ; 45ad: 43
    !byte %.#..##..                                                   ; 45ae: 4c
ground_fill_2x2_top_right
    !byte %#...#..#                                                   ; 45af: 89
    !byte %.#...##.                                                   ; 45b0: 46
    !byte %.#......                                                   ; 45b1: 40
    !byte %..#.....                                                   ; 45b2: 20
    !byte %..#.....                                                   ; 45b3: 20
    !byte %##......                                                   ; 45b4: c0
    !byte %........                                                   ; 45b5: 00
    !byte %....##..                                                   ; 45b6: 0c
ground_fill_2x2_bottom_left
    !byte %..##....                                                   ; 45b7: 30
    !byte %........                                                   ; 45b8: 00
    !byte %....###.                                                   ; 45b9: 0e
    !byte %...#...#                                                   ; 45ba: 11
    !byte %#..#...#                                                   ; 45bb: 91
    !byte %#..#...#                                                   ; 45bc: 91
    !byte %.#..###.                                                   ; 45bd: 4e
    !byte %.#......                                                   ; 45be: 40
ground_fill_2x2_bottom_right
    !byte %..##..#.                                                   ; 45bf: 32
    !byte %.#....#.                                                   ; 45c0: 42
    !byte %.#.....#                                                   ; 45c1: 41
    !byte %..#....#                                                   ; 45c2: 21
    !byte %..#.....                                                   ; 45c3: 20
    !byte %...#....                                                   ; 45c4: 10
    !byte %...#....                                                   ; 45c5: 10
    !byte %....#...                                                   ; 45c6: 08
sprite_data
pydis_end
!if (<envelope1) != $47 {
    !error "Assertion failed: <envelope1 == $47"
}
!if (<envelope2) != $5d {
    !error "Assertion failed: <envelope2 == $5d"
}
!if (<envelope3) != $91 {
    !error "Assertion failed: <envelope3 == $91"
}
!if (<envelope4) != $7b {
    !error "Assertion failed: <envelope4 == $7b"
}
!if (<ground_fill_2x2_top_left) != $a7 {
    !error "Assertion failed: <ground_fill_2x2_top_left == $a7"
}
!if (<sound1) != $9f {
    !error "Assertion failed: <sound1 == $9f"
}
!if (<sound2) != $89 {
    !error "Assertion failed: <sound2 == $89"
}
!if (<sound3) != $73 {
    !error "Assertion failed: <sound3 == $73"
}
!if (<sound4) != $6b {
    !error "Assertion failed: <sound4 == $6b"
}
!if (<sound5) != $55 {
    !error "Assertion failed: <sound5 == $55"
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
!if (>envelope4) != $45 {
    !error "Assertion failed: >envelope4 == $45"
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
!if (game_area_width_cells) != $28 {
    !error "Assertion failed: game_area_width_cells == $28"
}
!if (hamster_jam_flying - hamster_animations) != $15 {
    !error "Assertion failed: hamster_jam_flying - hamster_animations == $15"
}
!if (hamster_jam_landed_animation - hamster_animations) != $3b {
    !error "Assertion failed: hamster_jam_landed_animation - hamster_animations == $3b"
}
!if (hamster_jam_static_animation - hamster_animations) != $37 {
    !error "Assertion failed: hamster_jam_static_animation - hamster_animations == $37"
}
!if (hamster_look_back_animation - hamster_animations) != $0e {
    !error "Assertion failed: hamster_look_back_animation - hamster_animations == $0e"
}
!if (hamster_static_animation - hamster_animations) != $11 {
    !error "Assertion failed: hamster_static_animation - hamster_animations == $11"
}
!if (hamster_walk_animation - hamster_animations) != $01 {
    !error "Assertion failed: hamster_walk_animation - hamster_animations == $01"
}
!if (level_specific_initialisation) != $3af3 {
    !error "Assertion failed: level_specific_initialisation == $3af3"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b11 {
    !error "Assertion failed: level_specific_update == $3b11"
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
!if (object_direction + objectid_hamster_body) != $09c5 {
    !error "Assertion failed: object_direction + objectid_hamster_body == $09c5"
}
!if (object_direction + objectid_hamster_feet_or_jam) != $09c3 {
    !error "Assertion failed: object_direction + objectid_hamster_feet_or_jam == $09c3"
}
!if (object_direction + objectid_tulip_bulb) != $09c4 {
    !error "Assertion failed: object_direction + objectid_tulip_bulb == $09c4"
}
!if (object_direction + objectid_tulip_head) != $09c4 {
    !error "Assertion failed: object_direction + objectid_tulip_head == $09c4"
}
!if (object_erase_type + objectid_block) != $38af {
    !error "Assertion failed: object_erase_type + objectid_block == $38af"
}
!if (object_erase_type + objectid_hamster_feet_or_jam) != $38b1 {
    !error "Assertion failed: object_erase_type + objectid_hamster_feet_or_jam == $38b1"
}
!if (object_erase_type + objectid_tulip_bulb) != $38b2 {
    !error "Assertion failed: object_erase_type + objectid_tulip_bulb == $38b2"
}
!if (object_erase_type + objectid_tulip_head) != $38b2 {
    !error "Assertion failed: object_erase_type + objectid_tulip_head == $38b2"
}
!if (object_spriteid + objectid_block) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_block == $09ab"
}
!if (object_spriteid + objectid_hamster_body) != $09af {
    !error "Assertion failed: object_spriteid + objectid_hamster_body == $09af"
}
!if (object_spriteid + objectid_hamster_feet_or_jam) != $09ad {
    !error "Assertion failed: object_spriteid + objectid_hamster_feet_or_jam == $09ad"
}
!if (object_spriteid + objectid_rope_end) != $09aa {
    !error "Assertion failed: object_spriteid + objectid_rope_end == $09aa"
}
!if (object_spriteid + objectid_rope_to_block) != $09ac {
    !error "Assertion failed: object_spriteid + objectid_rope_to_block == $09ac"
}
!if (object_spriteid + objectid_tulip_bulb) != $09ae {
    !error "Assertion failed: object_spriteid + objectid_tulip_bulb == $09ae"
}
!if (object_spriteid + objectid_tulip_head) != $09ae {
    !error "Assertion failed: object_spriteid + objectid_tulip_head == $09ae"
}
!if (object_spriteid_old + objectid_rope_end) != $09b5 {
    !error "Assertion failed: object_spriteid_old + objectid_rope_end == $09b5"
}
!if (object_spriteid_old + objectid_rope_to_block) != $09b7 {
    !error "Assertion failed: object_spriteid_old + objectid_rope_to_block == $09b7"
}
!if (object_spriteid_old + objectid_tulip_bulb) != $09b9 {
    !error "Assertion failed: object_spriteid_old + objectid_tulip_bulb == $09b9"
}
!if (object_spriteid_old + objectid_tulip_head) != $09b9 {
    !error "Assertion failed: object_spriteid_old + objectid_tulip_head == $09b9"
}
!if (object_x_high + objectid_tulip_bulb) != $096c {
    !error "Assertion failed: object_x_high + objectid_tulip_bulb == $096c"
}
!if (object_x_high + objectid_tulip_head) != $096c {
    !error "Assertion failed: object_x_high + objectid_tulip_head == $096c"
}
!if (object_x_low + objectid_hamster_body) != $0957 {
    !error "Assertion failed: object_x_low + objectid_hamster_body == $0957"
}
!if (object_x_low + objectid_hamster_feet_or_jam) != $0955 {
    !error "Assertion failed: object_x_low + objectid_hamster_feet_or_jam == $0955"
}
!if (object_x_low + objectid_tulip_bulb) != $0956 {
    !error "Assertion failed: object_x_low + objectid_tulip_bulb == $0956"
}
!if (object_x_low + objectid_tulip_head) != $0956 {
    !error "Assertion failed: object_x_low + objectid_tulip_head == $0956"
}
!if (object_x_low_old + objectid_tulip_bulb) != $0961 {
    !error "Assertion failed: object_x_low_old + objectid_tulip_bulb == $0961"
}
!if (object_y_low + objectid_block) != $097f {
    !error "Assertion failed: object_y_low + objectid_block == $097f"
}
!if (object_y_low + objectid_hamster_body) != $0983 {
    !error "Assertion failed: object_y_low + objectid_hamster_body == $0983"
}
!if (object_y_low + objectid_hamster_feet_or_jam) != $0981 {
    !error "Assertion failed: object_y_low + objectid_hamster_feet_or_jam == $0981"
}
!if (object_y_low + objectid_rope_end) != $097e {
    !error "Assertion failed: object_y_low + objectid_rope_end == $097e"
}
!if (object_y_low + objectid_rope_to_block) != $0980 {
    !error "Assertion failed: object_y_low + objectid_rope_to_block == $0980"
}
!if (object_y_low + objectid_tulip_bulb) != $0982 {
    !error "Assertion failed: object_y_low + objectid_tulip_bulb == $0982"
}
!if (object_y_low + objectid_tulip_head) != $0982 {
    !error "Assertion failed: object_y_low + objectid_tulip_head == $0982"
}
!if (object_y_low_old + objectid_tulip_bulb) != $098d {
    !error "Assertion failed: object_y_low_old + objectid_tulip_bulb == $098d"
}
!if (object_y_low_old + objectid_tulip_head) != $098d {
    !error "Assertion failed: object_y_low_old + objectid_tulip_head == $098d"
}
!if (object_z_order + objectid_block) != $38c5 {
    !error "Assertion failed: object_z_order + objectid_block == $38c5"
}
!if (object_z_order + objectid_hamster_body) != $38c9 {
    !error "Assertion failed: object_z_order + objectid_hamster_body == $38c9"
}
!if (object_z_order + objectid_hamster_feet_or_jam) != $38c7 {
    !error "Assertion failed: object_z_order + objectid_hamster_feet_or_jam == $38c7"
}
!if (object_z_order + objectid_rope_to_block) != $38c6 {
    !error "Assertion failed: object_z_order + objectid_rope_to_block == $38c6"
}
!if (object_z_order + objectid_tulip_bulb) != $38c8 {
    !error "Assertion failed: object_z_order + objectid_tulip_bulb == $38c8"
}
!if (object_z_order + objectid_tulip_head) != $38c8 {
    !error "Assertion failed: object_z_order + objectid_tulip_head == $38c8"
}
!if (objectid_block) != $03 {
    !error "Assertion failed: objectid_block == $03"
}
!if (objectid_fire1) != $02 {
    !error "Assertion failed: objectid_fire1 == $02"
}
!if (objectid_fire2) != $03 {
    !error "Assertion failed: objectid_fire2 == $03"
}
!if (objectid_hamster_feet_or_jam) != $05 {
    !error "Assertion failed: objectid_hamster_feet_or_jam == $05"
}
!if (objectid_old_player) != $0b {
    !error "Assertion failed: objectid_old_player == $0b"
}
!if (objectid_old_tulip_bulb) != $11 {
    !error "Assertion failed: objectid_old_tulip_bulb == $11"
}
!if (objectid_rope_end) != $02 {
    !error "Assertion failed: objectid_rope_end == $02"
}
!if (objectid_rope_to_block) != $04 {
    !error "Assertion failed: objectid_rope_to_block == $04"
}
!if (objectid_tulip_bulb) != $06 {
    !error "Assertion failed: objectid_tulip_bulb == $06"
}
!if (room_0_data) != $3b4a {
    !error "Assertion failed: room_0_data == $3b4a"
}
!if (room_1_data) != $3c07 {
    !error "Assertion failed: room_1_data == $3c07"
}
!if (room_2_data) != $412e {
    !error "Assertion failed: room_2_data == $412e"
}
!if (room_3_data) != $44ac {
    !error "Assertion failed: room_3_data == $44ac"
}
!if (sprite_data - level_data) != $0af2 {
    !error "Assertion failed: sprite_data - level_data == $0af2"
}
!if (spriteid_erase1) != $cf {
    !error "Assertion failed: spriteid_erase1 == $cf"
}
!if (spriteid_erase2) != $d4 {
    !error "Assertion failed: spriteid_erase2 == $d4"
}
!if (spriteid_erase3) != $da {
    !error "Assertion failed: spriteid_erase3 == $da"
}
!if (spriteid_flying_hamster_jam) != $d5 {
    !error "Assertion failed: spriteid_flying_hamster_jam == $d5"
}
!if (spriteid_frayed_rope_end) != $cd {
    !error "Assertion failed: spriteid_frayed_rope_end == $cd"
}
!if (spriteid_hamster_body) != $e4 {
    !error "Assertion failed: spriteid_hamster_body == $e4"
}
!if (spriteid_hamster_jam) != $d6 {
    !error "Assertion failed: spriteid_hamster_jam == $d6"
}
!if (spriteid_hamster_legs_1) != $d0 {
    !error "Assertion failed: spriteid_hamster_legs_1 == $d0"
}
!if (spriteid_hamster_legs_2) != $d1 {
    !error "Assertion failed: spriteid_hamster_legs_2 == $d1"
}
!if (spriteid_hamster_legs_3) != $d2 {
    !error "Assertion failed: spriteid_hamster_legs_3 == $d2"
}
!if (spriteid_hamster_legs_4) != $d3 {
    !error "Assertion failed: spriteid_hamster_legs_4 == $d3"
}
!if (spriteid_hamster_looking_back) != $d7 {
    !error "Assertion failed: spriteid_hamster_looking_back == $d7"
}
!if (spriteid_horizontal_rope) != $ca {
    !error "Assertion failed: spriteid_horizontal_rope == $ca"
}
!if (spriteid_left_hook) != $c8 {
    !error "Assertion failed: spriteid_left_hook == $c8"
}
!if (spriteid_long_rope) != $cb {
    !error "Assertion failed: spriteid_long_rope == $cb"
}
!if (spriteid_long_rope_to_block) != $e3 {
    !error "Assertion failed: spriteid_long_rope_to_block == $e3"
}
!if (spriteid_one_pixel_masked_out) != $00 {
    !error "Assertion failed: spriteid_one_pixel_masked_out == $00"
}
!if (spriteid_right_hook) != $c9 {
    !error "Assertion failed: spriteid_right_hook == $c9"
}
!if (spriteid_short_rope) != $cc {
    !error "Assertion failed: spriteid_short_rope == $cc"
}
!if (spriteid_short_rope_to_block2) != $e2 {
    !error "Assertion failed: spriteid_short_rope_to_block2 == $e2"
}
!if (spriteid_sign) != $db {
    !error "Assertion failed: spriteid_sign == $db"
}
!if (spriteid_tall_block) != $ce {
    !error "Assertion failed: spriteid_tall_block == $ce"
}
!if (spriteid_tulip_bulb) != $d9 {
    !error "Assertion failed: spriteid_tulip_bulb == $d9"
}
!if (spriteid_tulip_bulb_menu_item) != $d8 {
    !error "Assertion failed: spriteid_tulip_bulb_menu_item == $d8"
}
!if (spriteid_tulip_flower1) != $e0 {
    !error "Assertion failed: spriteid_tulip_flower1 == $e0"
}
!if (spriteid_tulip_flower2) != $df {
    !error "Assertion failed: spriteid_tulip_flower2 == $df"
}
!if (spriteid_tulip_flower3) != $de {
    !error "Assertion failed: spriteid_tulip_flower3 == $de"
}
!if (spriteid_tulip_head) != $dc {
    !error "Assertion failed: spriteid_tulip_head == $dc"
}
!if (spriteid_tulip_stalk) != $dd {
    !error "Assertion failed: spriteid_tulip_stalk == $dd"
}
!if (tulip_bulb_x_animation0 - tulip_bulb_x_animations) != $01 {
    !error "Assertion failed: tulip_bulb_x_animation0 - tulip_bulb_x_animations == $01"
}
!if (tulip_bulb_x_animation1 - tulip_bulb_x_animations) != $09 {
    !error "Assertion failed: tulip_bulb_x_animation1 - tulip_bulb_x_animations == $09"
}
!if (tulip_bulb_x_animation2 - tulip_bulb_x_animations) != $0e {
    !error "Assertion failed: tulip_bulb_x_animation2 - tulip_bulb_x_animations == $0e"
}
