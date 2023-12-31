; *************************************************************************************
;
; Level H: 'APPLESOURCE'
;
; Save game variables:
;
;     save_game_level_h_rail_rope_x_cell            ($0a1a):
;             $0c: left side position
;         $0d-$1a: rope is moving between left and right
;             $1b: right side position
;
;     save_game_level_h_rail_rope_current_dir       ($0a1b):
;               0: not moving
;               1: moving right
;             $ff: moving left
;
;     save_game_level_h_current_fruit_animation     ($0a1c):
;               0: not started
;               1: initial idle animation
;               4: fall sideways 1
;             $0d: stopped
;             $10: moving sideways
;             $13: fall sideways 2
;             $1a: fall straight down
;
;     save_game_level_h_fruit_animation_step        ($0a1d):
;         $00-$1c: animation index for the current fruit step
;
;     save_game_level_h_fruit_x_low                 ($0a1e):
;     save_game_level_h_fruit_x_high                ($0a1f):
;               pixel X position for fruit
;
;     save_game_level_h_fruit_y_low                 ($0a20):
;     save_game_level_h_fruit_y_high                ($0a21):
;               pixel Y position for fruit
;
;     save_game_level_h_fruit_room                  ($0a22):
;            $0-3: room the fruit is in
;
;     save_game_level_h_current_fruit_direction     ($0a23):
;         $ff/1/0: direction of fruit ($ff=left, $0,=none, $1=right)
;
; Solution:
;
;   1. move to the room on the right, climb the rope pointing left.
;   2. Jump at the point the rabbit turns away, and climb the flower.
;   3. Wait for the rabbit to go past, and continue into the room to the left.
;   4. Up the rope, knock the fruit to the right at the top center of the room
;       (The fruit falls into the room below)
;   5. Push the fruit to the right and follow it.
;       (The fruit falls)
;   6. Push the fruit to the left and follow it.
;   7. Use the cat to climb the fruit and use the monkey to climb the 'this way' rope,
;      and out of the room to the left.
;   8. Climb the leftmost rope, and jump onto (and hold) the rail rope to the other side.
;   9. Jump off the ropes to the right, then reverse direction and ride the rail back
;      to get to the spell.
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
objectid_fruit                        = 2
objectid_old_player                   = 11
objectid_old_player_accessory         = 12
objectid_player                       = 0
objectid_player_accessory             = 1
objectid_rabbit                       = 3
objectid_rail_rope_end                = 3
objectid_spell                        = 5
opcode_jmp                            = 76
sprite_op_flags_copy_screen           = 1
sprite_op_flags_erase_to_bg_colour    = 2
sprite_op_flags_erase_to_fg_colour    = 4
sprite_op_flags_normal                = 0
spriteid_ball                         = 59
spriteid_boulder                      = 206
spriteid_brazier                      = 58
spriteid_cache1                       = 203
spriteid_cache2                       = 205
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
spriteid_fruit                        = 208
spriteid_horizontal_rail              = 200
spriteid_icodata_box                  = 9
spriteid_icodata_cat                  = 5
spriteid_icodata_disc                 = 3
spriteid_icodata_info                 = 7
spriteid_icodata_monkey               = 6
spriteid_icodata_password             = 8
spriteid_icodata_sound                = 2
spriteid_icodata_wizard               = 4
spriteid_icon_background              = 1
spriteid_leaf                         = 214
spriteid_long_rope_end                = 204
spriteid_menu_item_completion_spell   = 33
spriteid_missing                      = 212
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
spriteid_rabbit_push                  = 219
spriteid_rabbit_sit                   = 218
spriteid_rabbit_walk_1                = 215
spriteid_rabbit_walk_2                = 216
spriteid_rabbit_walk_3                = 217
spriteid_rail_left_corner             = 201
spriteid_rail_right_corner            = 202
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
spriteid_stalk_bottom                 = 211
spriteid_stalk_middle                 = 210
spriteid_stalk_top                    = 209
spriteid_table                        = 207
spriteid_way_out                      = 213
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
movement_low                                        = $70
room_exit_direction                                 = $70
movement_high                                       = $71
object_left_cell_x                                  = $78
object_right_cell_x                                 = $79
object_top_cell_y                                   = $7a
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
save_game_level_h_rail_rope_x_cell                  = $0a1a
save_game_level_h_rail_rope_current_dir             = $0a1b
save_game_level_h_current_fruit_animation           = $0a1c
save_game_level_h_fruit_animation_step              = $0a1d
save_game_level_h_fruit_x_low                       = $0a1e
save_game_level_h_fruit_x_high                      = $0a1f
save_game_level_h_fruit_y_low                       = $0a20
save_game_level_h_fruit_y_high                      = $0a21
save_game_level_h_fruit_room                        = $0a22
save_game_level_h_current_fruit_direction           = $0a23
fruit_timer                                         = $0a6f
rabbit_sprite_animation                             = $0a70
rabbit_sprite_animation_step                        = $0a71
rabbit_x                                            = $0a72
rabbit_direction                                    = $0a73
rabbit_speed                                        = $0a74
l0a75                                               = $0a75
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
    !word sprite_data - level_data                                    ; 3ad5: 0a 0a                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f3 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 07 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
initial_room_index
    !byte 1                                                           ; 3add: 01
initial_room_index_cheat
    !byte 2                                                           ; 3ade: 02
level_room_data_table
    !word room_0_data                                                 ; 3adf: 14 3b                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: 4b 3d
    !word room_2_data                                                 ; 3ae3: 31 3e
    !word room_3_data                                                 ; 3ae5: 0a 40

; *************************************************************************************
; 'APPLESOURCE[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $8a, $9b, $9b, $87, $8e, $98, $84, $9e, $99, $88, $8e, $c6  ; 3ae7: 8a 9b 9b...

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
    beq developer_mode_inactive                                       ; 3af7: f0 05
    lda developer_flags                                               ; 3af9: ad 03 11
    bpl developer_mode_inactive                                       ; 3afc: 10 00
developer_mode_inactive
    lda #<ground_fill_2x2_top_left                                    ; 3afe: a9 bf
    sta source_sprite_memory_low                                      ; 3b00: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3b02: a9 44
    sta source_sprite_memory_high                                     ; 3b04: 85 41
    rts                                                               ; 3b06: 60

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
    jsr room_0_update_handler                                         ; 3b07: 20 aa 3b
    jsr room_1_update_handler                                         ; 3b0a: 20 22 3e
    jsr update_rabbit_puzzle                                          ; 3b0d: 20 d4 3e
    jsr update_fruit_puzzle                                           ; 3b10: 20 d6 40
    rts                                                               ; 3b13: 60

; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 20                                                          ; 3b14: 14                      ; initial player X cell
    !byte 22                                                          ; 3b15: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####     |                    |     ####
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |
; ###      |                    |
; ###      |                    |
; ###      |                    |
; ###      |                    |
; #######  |      ########      |  #######
; #######  |      ########      |  #######
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###                                  ###
; ###                                  ###
; ###OOO                            OOO###
; ###OOO              P             OOO###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_0_code
    ldx #0                                                            ; 3b16: a2 00
    ldy #0                                                            ; 3b18: a0 00
    lda #$ff                                                          ; 3b1a: a9 ff
    sta width_in_cells                                                ; 3b1c: 85 3c
    lda #2                                                            ; 3b1e: a9 02
    sta height_in_cells                                               ; 3b20: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b22: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3b25: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3b27: 20 bb 1a
; draw 4x1 rectangle at (0,2)
    ldy #2                                                            ; 3b2a: a0 02
    lda #4                                                            ; 3b2c: a9 04
    sta width_in_cells                                                ; 3b2e: 85 3c
    dec height_in_cells                                               ; 3b30: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b32: 20 bb 1a
; draw 4x1 rectangle at (36,2)
    ldx #$24 ; '$'                                                    ; 3b35: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 3b37: 20 bb 1a
; draw 3x19 rectangle at (0,3)
    ldx #0                                                            ; 3b3a: a2 00
    iny                                                               ; 3b3c: c8
    dec width_in_cells                                                ; 3b3d: c6 3c
    lda #$13                                                          ; 3b3f: a9 13
    sta height_in_cells                                               ; 3b41: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b43: 20 bb 1a
; draw 3x5 rectangle at (37,3)
    ldx #$25 ; '%'                                                    ; 3b46: a2 25
    lda #5                                                            ; 3b48: a9 05
    sta height_in_cells                                               ; 3b4a: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b4c: 20 bb 1a
; draw 3x9 rectangle at (37,13)
    ldy #$0d                                                          ; 3b4f: a0 0d
    lda #9                                                            ; 3b51: a9 09
    sta height_in_cells                                               ; 3b53: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b55: 20 bb 1a
; draw 4x2 rectangle at (33,13)
    ldx #$21 ; '!'                                                    ; 3b58: a2 21
    lda #4                                                            ; 3b5a: a9 04
    sta width_in_cells                                                ; 3b5c: 85 3c
    lda #2                                                            ; 3b5e: a9 02
    sta height_in_cells                                               ; 3b60: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b62: 20 bb 1a
; draw 4x2 rectangle at (3,13)
    ldx #3                                                            ; 3b65: a2 03
    jsr copy_rectangle_of_memory_to_screen                            ; 3b67: 20 bb 1a
; draw 8x2 rectangle at (16,13)
    ldx #$10                                                          ; 3b6a: a2 10
    lda #8                                                            ; 3b6c: a9 08
    sta width_in_cells                                                ; 3b6e: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b70: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3b73: 20 90 1b
; draw boulder at (3,20) of size (3x2)
    ldx #2                                                            ; 3b76: a2 02
    stx height_in_cells                                               ; 3b78: 86 3d
    inx                                                               ; 3b7a: e8
    stx width_in_cells                                                ; 3b7b: 86 3c
    ldy #$14                                                          ; 3b7d: a0 14
    lda #spriteid_boulder                                             ; 3b7f: a9 ce
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3b81: 20 57 1f
; draw table at (34,20) of size (3x2)
    ldx #$22 ; '"'                                                    ; 3b84: a2 22
    lda #spriteid_table                                               ; 3b86: a9 cf
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3b88: 20 57 1f
; draw rope at (9,2) length 16
    ldx #9                                                            ; 3b8b: a2 09
    ldy #2                                                            ; 3b8d: a0 02
    lda #$10                                                          ; 3b8f: a9 10
    jsr draw_rope                                                     ; 3b91: 20 b9 1d
; draw rope at (30,2) length 16
    ldx #$1e                                                          ; 3b94: a2 1e
    jsr draw_rope                                                     ; 3b96: 20 b9 1d
    jsr start_room                                                    ; 3b99: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 3b9c: 20 da 12
    and #exit_room_right                                              ; 3b9f: 29 04
    beq room_0_game_update_loop                                       ; 3ba1: f0 f9
    ldx #1                                                            ; 3ba3: a2 01
    ldy current_level                                                 ; 3ba5: a4 31
    jmp initialise_level_and_room                                     ; 3ba7: 4c 40 11

room_0_update_handler
    lda #0                                                            ; 3baa: a9 00
    sta currently_updating_logic_for_room_index                       ; 3bac: 8d ba 1a
    ldx #$25 ; '%'                                                    ; 3baf: a2 25
    ldy #5                                                            ; 3bb1: a0 05
    lda #4                                                            ; 3bb3: a9 04
    jsr update_brazier_and_fire                                       ; 3bb5: 20 88 19
    ldx #5                                                            ; 3bb8: a2 05
    ldy #$0d                                                          ; 3bba: a0 0d
    lda #objectid_spell                                               ; 3bbc: a9 05
    jsr update_level_completion                                       ; 3bbe: 20 10 1a
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 3bc1: ad 2b 13
    bne room_0_first_update                                           ; 3bc4: d0 03
    jmp check_if_player_is_on_room_0_rope                             ; 3bc6: 4c 38 3c

; check for level change (branch if not)
room_0_first_update
    lda current_level                                                 ; 3bc9: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3bcb: c5 51
    beq rail_rope_not_moving                                          ; 3bcd: f0 2d
; initiailise new level
    ldx #<envelope1                                                   ; 3bcf: a2 65
    ldy #>envelope1                                                   ; 3bd1: a0 44
    jsr define_envelope                                               ; 3bd3: 20 5e 39
    lda save_game_level_h_rail_rope_x_cell                            ; 3bd6: ad 1a 0a
    beq set_rail_rope_to_initial_position                             ; 3bd9: f0 17
    lda save_game_level_h_rail_rope_current_dir                       ; 3bdb: ad 1b 0a
    beq rail_rope_not_moving                                          ; 3bde: f0 1c
    bpl set_rail_rope_to_far_right                                    ; 3be0: 10 08
; set rail rope to far left
    lda #$0c                                                          ; 3be2: a9 0c
    sta save_game_level_h_rail_rope_x_cell                            ; 3be4: 8d 1a 0a
    jmp stop_rail_rope                                                ; 3be7: 4c f7 3b

set_rail_rope_to_far_right
    lda #$1b                                                          ; 3bea: a9 1b
    sta save_game_level_h_rail_rope_x_cell                            ; 3bec: 8d 1a 0a
    jmp stop_rail_rope                                                ; 3bef: 4c f7 3b

set_rail_rope_to_initial_position
    lda #$0c                                                          ; 3bf2: a9 0c
    sta save_game_level_h_rail_rope_x_cell                            ; 3bf4: 8d 1a 0a
stop_rail_rope
    lda #0                                                            ; 3bf7: a9 00
    sta save_game_level_h_rail_rope_current_dir                       ; 3bf9: 8d 1b 0a
; check for being in room 0, and branch otherwise
rail_rope_not_moving
    lda desired_room_index                                            ; 3bfc: a5 30
    cmp #0                                                            ; 3bfe: c9 00
    bne set_rail_rope_object_position_and_collision_map_local1        ; 3c00: d0 33
; in room 0. set rail collision
    ldx #$0c                                                          ; 3c02: a2 0c
    ldy #2                                                            ; 3c04: a0 02
    lda #$10                                                          ; 3c06: a9 10
    sta width_in_cells                                                ; 3c08: 85 3c
    lda #1                                                            ; 3c0a: a9 01
    sta height_in_cells                                               ; 3c0c: 85 3d
    lda #collision_map_solid_rock                                     ; 3c0e: a9 03
    sta value_to_write_to_collision_map                               ; 3c10: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3c12: 20 44 1e
; draw rail itself, with corners
    iny                                                               ; 3c15: c8
    lda #spriteid_rail_left_corner                                    ; 3c16: a9 c9
    jsr draw_sprite_a_at_cell_xy                                      ; 3c18: 20 4c 1f
    inx                                                               ; 3c1b: e8
    lda #spriteid_horizontal_rail                                     ; 3c1c: a9 c8
draw_rail_loop
    jsr draw_sprite_a_at_cell_xy                                      ; 3c1e: 20 4c 1f
    inx                                                               ; 3c21: e8
    cpx #$1b                                                          ; 3c22: e0 1b
    bcc draw_rail_loop                                                ; 3c24: 90 f8
    lda #spriteid_rail_right_corner                                   ; 3c26: a9 ca
    jsr draw_sprite_a_at_cell_xy                                      ; 3c28: 20 4c 1f
; draw end of rope on the rail
    lda #spriteid_long_rope_end                                       ; 3c2b: a9 cc
    sta object_spriteid + objectid_rail_rope_end                      ; 3c2d: 8d ab 09
    lda #spriteid_cache1                                              ; 3c30: a9 cb
    sta object_erase_type + objectid_rail_rope_end                    ; 3c32: 8d af 38
set_rail_rope_object_position_and_collision_map_local1
    jmp set_rail_rope_object_position_and_collision_map               ; 3c35: 4c 16 3d

check_if_player_is_on_room_0_rope
    lda #0                                                            ; 3c38: a9 00
    sta player_is_on_room_0_rope_flag                                 ; 3c3a: 8d 4a 3d
    lda desired_room_index                                            ; 3c3d: a5 30
    cmp #0                                                            ; 3c3f: c9 00
    bne check_rope_direction                                          ; 3c41: d0 21
    lda current_player_character                                      ; 3c43: a5 48
    cmp #spriteid_icodata_monkey                                      ; 3c45: c9 06
    bne check_rope_direction                                          ; 3c47: d0 1b
    ldx #objectid_player                                              ; 3c49: a2 00
    ldy #objectid_rail_rope_end                                       ; 3c4b: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 3c4d: 20 e2 28
    beq check_rope_direction                                          ; 3c50: f0 12
    lda current_player_animation                                      ; 3c52: ad df 09
    cmp #monkey_climb_animation - monkey_base_animation               ; 3c55: c9 51
    beq player_is_on_rope                                             ; 3c57: f0 08
    cmp #monkey_climb_idle_animation - monkey_base_animation          ; 3c59: c9 45
    beq player_is_on_rope                                             ; 3c5b: f0 04
    cmp #monkey_climb_down_animation - monkey_base_animation          ; 3c5d: c9 49
    bne check_rope_direction                                          ; 3c5f: d0 03
player_is_on_rope
    dec player_is_on_room_0_rope_flag                                 ; 3c61: ce 4a 3d
check_rope_direction
    lda save_game_level_h_rail_rope_current_dir                       ; 3c64: ad 1b 0a
    bne update_rail_x_position                                        ; 3c67: d0 25
; check if player is on the rope
    lda player_is_on_room_0_rope_flag                                 ; 3c69: ad 4a 3d
    beq set_rail_rope_object_position_and_collision_map_local         ; 3c6c: f0 1d
; is the rail rope to the left? branch if not
    lda save_game_level_h_rail_rope_x_cell                            ; 3c6e: ad 1a 0a
    cmp #$0c                                                          ; 3c71: c9 0c
    bne rail_rope_not_left                                            ; 3c73: d0 0b
; if the player is looking left, then branch
    lda object_direction                                              ; 3c75: ad be 09
    bmi set_rail_rope_object_position_and_collision_map_local         ; 3c78: 30 11
; start moving the rail rope right
    inc save_game_level_h_rail_rope_current_dir                       ; 3c7a: ee 1b 0a
    jmp update_rail_x_position                                        ; 3c7d: 4c 8e 3c

; if the player is looking right, then branch
rail_rope_not_left
    lda object_direction                                              ; 3c80: ad be 09
    bpl set_rail_rope_object_position_and_collision_map_local         ; 3c83: 10 06
; start moving the rail rope left
    dec save_game_level_h_rail_rope_current_dir                       ; 3c85: ce 1b 0a
    jmp update_rail_x_position                                        ; 3c88: 4c 8e 3c

set_rail_rope_object_position_and_collision_map_local
    jmp set_rail_rope_object_position_and_collision_map               ; 3c8b: 4c 16 3d

; add direction to cell x
update_rail_x_position
    lda save_game_level_h_rail_rope_x_cell                            ; 3c8e: ad 1a 0a
    clc                                                               ; 3c91: 18
    adc save_game_level_h_rail_rope_current_dir                       ; 3c92: 6d 1b 0a
    sta save_game_level_h_rail_rope_x_cell                            ; 3c95: 8d 1a 0a
; check if the player is on the rope, branch if not
    lda player_is_on_room_0_rope_flag                                 ; 3c98: ad 4a 3d
    beq update_rail_moving_sound                                      ; 3c9b: f0 31
; multiply the direction by eight, and sign extend using x as the high byte
    ldx #0                                                            ; 3c9d: a2 00
    lda save_game_level_h_rail_rope_current_dir                       ; 3c9f: ad 1b 0a
    asl                                                               ; 3ca2: 0a
    asl                                                               ; 3ca3: 0a
    asl                                                               ; 3ca4: 0a
    sta movement_low                                                  ; 3ca5: 85 70
    bpl sign_extended                                                 ; 3ca7: 10 01
    dex                                                               ; 3ca9: ca
sign_extended
    stx movement_high                                                 ; 3caa: 86 71
; add to the player x position
    lda object_x_low                                                  ; 3cac: ad 50 09
    clc                                                               ; 3caf: 18
    adc movement_low                                                  ; 3cb0: 65 70
    sta object_x_low                                                  ; 3cb2: 8d 50 09
    lda object_x_high                                                 ; 3cb5: ad 66 09
    adc movement_high                                                 ; 3cb8: 65 71
    sta object_x_high                                                 ; 3cba: 8d 66 09
; add to the player accessory x position
    lda object_x_low + objectid_player_accessory                      ; 3cbd: ad 51 09
    clc                                                               ; 3cc0: 18
    adc movement_low                                                  ; 3cc1: 65 70
    sta object_x_low + objectid_player_accessory                      ; 3cc3: 8d 51 09
    lda object_x_high + objectid_player_accessory                     ; 3cc6: ad 67 09
    adc movement_high                                                 ; 3cc9: 65 71
    sta object_x_high + objectid_player_accessory                     ; 3ccb: 8d 67 09
; branch if rail rope is at either end
update_rail_moving_sound
    lda save_game_level_h_rail_rope_x_cell                            ; 3cce: ad 1a 0a
    cmp #$0c                                                          ; 3cd1: c9 0c
    beq rail_at_either_end                                            ; 3cd3: f0 16
    cmp #$1b                                                          ; 3cd5: c9 1b
    beq rail_at_either_end                                            ; 3cd7: f0 12
; branch if not in room zero
    lda desired_room_index                                            ; 3cd9: a5 30
    cmp #0                                                            ; 3cdb: c9 00
    bne set_rail_rope_object_position_and_collision_map               ; 3cdd: d0 37
; make rail movement sound
    lda #$40 ; '@'                                                    ; 3cdf: a9 40
    ldx #<sound1                                                      ; 3ce1: a2 73
    ldy #>sound1                                                      ; 3ce3: a0 44
    jsr play_sound_yx                                                 ; 3ce5: 20 f6 38
    jmp set_rail_rope_object_position_and_collision_map               ; 3ce8: 4c 16 3d

rail_at_either_end
    lda #0                                                            ; 3ceb: a9 00
    sta save_game_level_h_rail_rope_current_dir                       ; 3ced: 8d 1b 0a
    lda desired_room_index                                            ; 3cf0: a5 30
    cmp #0                                                            ; 3cf2: c9 00
    bne set_rail_rope_object_position_and_collision_map               ; 3cf4: d0 20
; reset sound priorities
    lda sound_priority_per_channel_table                              ; 3cf6: ad 6f 39
    cmp #$41 ; 'A'                                                    ; 3cf9: c9 41
    bcs end_of_move_sound                                             ; 3cfb: b0 08
    lda #0                                                            ; 3cfd: a9 00
    sta sound_priority_per_channel_table                              ; 3cff: 8d 6f 39
    sta sound_priority_per_channel_table + 1                          ; 3d02: 8d 70 39
end_of_move_sound
    jsr play_landing_sound                                            ; 3d05: 20 a9 23
; the following tests are redundant. branch if player is not on rope
    lda player_is_on_room_0_rope_flag                                 ; 3d08: ad 4a 3d
    beq set_rail_rope_object_position_and_collision_map               ; 3d0b: f0 09
    lda #6                                                            ; 3d0d: a9 06                   ; redundant instruction
; this test is redundant. branch if player is looking right
    lda object_direction                                              ; 3d0f: ad be 09
    bpl set_rail_rope_object_position_and_collision_map               ; 3d12: 10 02
; this is redundant. player is on rope and looking left
    lda #$fa                                                          ; 3d14: a9 fa
; branch if not in room zero
set_rail_rope_object_position_and_collision_map
    lda desired_room_index                                            ; 3d16: a5 30
    cmp #0                                                            ; 3d18: c9 00
    bne return1                                                       ; 3d1a: d0 2d
; position the rail rope
    ldx save_game_level_h_rail_rope_x_cell                            ; 3d1c: ae 1a 0a
    ldy #3                                                            ; 3d1f: a0 03
    lda #objectid_rail_rope_end                                       ; 3d21: a9 03
    jsr set_object_position_from_cell_xy                              ; 3d23: 20 5d 1f
; write to the collision map
    lda #1                                                            ; 3d26: a9 01
    sta width_in_cells                                                ; 3d28: 85 3c
    lda #2                                                            ; 3d2a: a9 02
    sta height_in_cells                                               ; 3d2c: 85 3d
    lda #collision_map_rope                                           ; 3d2e: a9 02
    sta value_to_write_to_collision_map                               ; 3d30: 85 3e
    jsr read_collision_map_value_for_xy                               ; 3d32: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3d35: c5 3e
    beq return1                                                       ; 3d37: f0 10
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3d39: 20 44 1e
; write zero to either side of the rail rope
    lda #collision_map_none                                           ; 3d3c: a9 00
    sta value_to_write_to_collision_map                               ; 3d3e: 85 3e
    dex                                                               ; 3d40: ca
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3d41: 20 44 1e
    inx                                                               ; 3d44: e8
    inx                                                               ; 3d45: e8
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3d46: 20 44 1e
return1
    rts                                                               ; 3d49: 60

player_is_on_room_0_rope_flag
    !byte 0                                                           ; 3d4a: 00
; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 20                                                          ; 3d4b: 14                      ; initial player X cell
    !byte 22                                                          ; 3d4c: 16                      ; initial player Y cell

; ############################  |  #######
; ############################  |  #######
; ####     |     #####          |     ####
; ###      |      ###           |      ###
; ###      |      ###           |      ###
; ###      |      ###           |      ###
; ###      |      ###           |      ###
; ###      S      ###           |      ###
;          |      ###           |
;          |      ###           |
;          |      ###           |
;          |      ###
;          |      #######
; #######  |  ############################
; #######  |  ############################
; ###      |
; ###      |
; ###      |
; ###
; ###
; ###
; ###                 P
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 28x2 rectangle at (0,0)
room_1_code
    ldx #0                                                            ; 3d4d: a2 00
    ldy #0                                                            ; 3d4f: a0 00
    lda #$1c                                                          ; 3d51: a9 1c
    sta width_in_cells                                                ; 3d53: 85 3c
    lda #2                                                            ; 3d55: a9 02
    sta height_in_cells                                               ; 3d57: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d59: 20 bb 1a
; draw 28x2 rectangle at (33,0)
    ldx #$21 ; '!'                                                    ; 3d5c: a2 21
    jsr copy_rectangle_of_memory_to_screen                            ; 3d5e: 20 bb 1a
; draw 4x1 rectangle at (0,2)
    ldx #0                                                            ; 3d61: a2 00
    ldy #2                                                            ; 3d63: a0 02
    lda #4                                                            ; 3d65: a9 04
    sta width_in_cells                                                ; 3d67: 85 3c
    dec height_in_cells                                               ; 3d69: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d6b: 20 bb 1a
; draw 4x1 rectangle at (36,2)
    ldx #$24 ; '$'                                                    ; 3d6e: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 3d70: 20 bb 1a
; draw 5x1 rectangle at (15,2)
    ldx #$0f                                                          ; 3d73: a2 0f
    inc width_in_cells                                                ; 3d75: e6 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3d77: 20 bb 1a
; draw 3x5 rectangle at (0,3)
    ldx #0                                                            ; 3d7a: a2 00
    iny                                                               ; 3d7c: c8
    lda #3                                                            ; 3d7d: a9 03
    sta width_in_cells                                                ; 3d7f: 85 3c
    lda #5                                                            ; 3d81: a9 05
    sta height_in_cells                                               ; 3d83: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d85: 20 bb 1a
; draw 3x5 rectangle at (37,3)
    ldx #$25 ; '%'                                                    ; 3d88: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 3d8a: 20 bb 1a
; draw 3x10 rectangle at (16,3)
    ldx #$10                                                          ; 3d8d: a2 10
    lda #$0a                                                          ; 3d8f: a9 0a
    sta height_in_cells                                               ; 3d91: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d93: 20 bb 1a
; draw 4x1 rectangle at (19,12)
    ldx #$13                                                          ; 3d96: a2 13
    ldy #$0c                                                          ; 3d98: a0 0c
    lda #4                                                            ; 3d9a: a9 04
    sta width_in_cells                                                ; 3d9c: 85 3c
    lda #1                                                            ; 3d9e: a9 01
    sta height_in_cells                                               ; 3da0: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3da2: 20 bb 1a
; draw 7x2 rectangle at (0,13)
    ldx #0                                                            ; 3da5: a2 00
    ldy #$0d                                                          ; 3da7: a0 0d
    lda #7                                                            ; 3da9: a9 07
    sta width_in_cells                                                ; 3dab: 85 3c
    lda #2                                                            ; 3dad: a9 02
    sta height_in_cells                                               ; 3daf: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3db1: 20 bb 1a
; draw 255x2 rectangle at (12,13)
    ldx #$0c                                                          ; 3db4: a2 0c
    lda #$ff                                                          ; 3db6: a9 ff
    sta width_in_cells                                                ; 3db8: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3dba: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldx #0                                                            ; 3dbd: a2 00
    ldy #$16                                                          ; 3dbf: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3dc1: 20 bb 1a
; draw 3x7 rectangle at (0,15)
    ldy #$0f                                                          ; 3dc4: a0 0f
    lda #3                                                            ; 3dc6: a9 03
    sta width_in_cells                                                ; 3dc8: 85 3c
    lda #7                                                            ; 3dca: a9 07
    sta height_in_cells                                               ; 3dcc: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3dce: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3dd1: 20 90 1b
; draw rope at (9,2) length 16
    ldx #9                                                            ; 3dd4: a2 09
    ldy #2                                                            ; 3dd6: a0 02
    lda #$10                                                          ; 3dd8: a9 10
    jsr draw_rope                                                     ; 3dda: 20 b9 1d
; draw rope at (30,0) length 11
    ldx #$1e                                                          ; 3ddd: a2 1e
    ldy #0                                                            ; 3ddf: a0 00
    lda #$0b                                                          ; 3de1: a9 0b
    jsr draw_rope                                                     ; 3de3: 20 b9 1d
    ldx #9                                                            ; 3de6: a2 09
    ldy #6                                                            ; 3de8: a0 06
    lda #3                                                            ; 3dea: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3dec: 20 bb 1e
; draw way out at (9,7)
    iny                                                               ; 3def: c8
    lda #spriteid_way_out                                             ; 3df0: a9 d5
    jsr draw_sprite_a_at_cell_xy                                      ; 3df2: 20 4c 1f
    jsr start_room                                                    ; 3df5: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 3df8: 20 da 12
    sta room_exit_direction                                           ; 3dfb: 85 70
    and #exit_room_top                                                ; 3dfd: 29 08
    beq room_1_check_left_exit                                        ; 3dff: f0 07
    ldx #3                                                            ; 3e01: a2 03
    ldy current_level                                                 ; 3e03: a4 31
    jmp initialise_level_and_room                                     ; 3e05: 4c 40 11

room_1_check_left_exit
    lda room_exit_direction                                           ; 3e08: a5 70
    and #exit_room_left                                               ; 3e0a: 29 01
    beq room_1_check_right_exit                                       ; 3e0c: f0 07
    ldx #0                                                            ; 3e0e: a2 00
    ldy current_level                                                 ; 3e10: a4 31
    jmp initialise_level_and_room                                     ; 3e12: 4c 40 11

room_1_check_right_exit
    lda room_exit_direction                                           ; 3e15: a5 70
    and #exit_room_right                                              ; 3e17: 29 04
    beq room_1_game_update_loop                                       ; 3e19: f0 dd
    ldx #2                                                            ; 3e1b: a2 02
    ldy current_level                                                 ; 3e1d: a4 31
    jmp initialise_level_and_room                                     ; 3e1f: 4c 40 11

room_1_update_handler
    lda #1                                                            ; 3e22: a9 01
    sta currently_updating_logic_for_room_index                       ; 3e24: 8d ba 1a
    ldx #$25 ; '%'                                                    ; 3e27: a2 25
    ldy #5                                                            ; 3e29: a0 05
    lda #3                                                            ; 3e2b: a9 03
    jsr update_brazier_and_fire                                       ; 3e2d: 20 88 19
    rts                                                               ; 3e30: 60

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 20                                                          ; 3e31: 14                      ; initial player X cell
    !byte 21                                                          ; 3e32: 15                      ; initial player Y cell

; ########################################
; ########################################
; ####     |  ################  |     ####
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
;          |                    |      ###
;          |                    |      ###
;          |                    |      ###
;                               |      ###
;                               |      ###
; #######     ################  |  #######
; #######     ################  |  #######
;                               |      ###
;                               |      ###
;                               |      ###
;                               |      ###
;                               |      ###
;                     P                ###
;             ################         ###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_2_code
    ldx #0                                                            ; 3e33: a2 00
    ldy #0                                                            ; 3e35: a0 00
    lda #$ff                                                          ; 3e37: a9 ff
    sta width_in_cells                                                ; 3e39: 85 3c
    lda #2                                                            ; 3e3b: a9 02
    sta height_in_cells                                               ; 3e3d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e3f: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3e42: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3e44: 20 bb 1a
; draw 4x1 rectangle at (0,2)
    ldy #2                                                            ; 3e47: a0 02
    lda #4                                                            ; 3e49: a9 04
    sta width_in_cells                                                ; 3e4b: 85 3c
    dec height_in_cells                                               ; 3e4d: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e4f: 20 bb 1a
; draw 4x1 rectangle at (36,2)
    ldx #$24 ; '$'                                                    ; 3e52: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 3e54: 20 bb 1a
; draw 3x5 rectangle at (0,3)
    ldx #0                                                            ; 3e57: a2 00
    iny                                                               ; 3e59: c8
    dec width_in_cells                                                ; 3e5a: c6 3c
    lda #5                                                            ; 3e5c: a9 05
    sta height_in_cells                                               ; 3e5e: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e60: 20 bb 1a
; draw 3x19 rectangle at (37,3)
    ldx #$25 ; '%'                                                    ; 3e63: a2 25
    lda #$13                                                          ; 3e65: a9 13
    sta height_in_cells                                               ; 3e67: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e69: 20 bb 1a
; draw 7x2 rectangle at (0,13)
    ldx #0                                                            ; 3e6c: a2 00
    ldy #$0d                                                          ; 3e6e: a0 0d
    lda #7                                                            ; 3e70: a9 07
    sta width_in_cells                                                ; 3e72: 85 3c
    lda #2                                                            ; 3e74: a9 02
    sta height_in_cells                                               ; 3e76: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e78: 20 bb 1a
; draw 16x2 rectangle at (12,13)
    ldx #$0c                                                          ; 3e7b: a2 0c
    lda #$10                                                          ; 3e7d: a9 10
    sta width_in_cells                                                ; 3e7f: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3e81: 20 bb 1a
; draw 4x2 rectangle at (33,13)
    ldx #$21 ; '!'                                                    ; 3e84: a2 21
    lda #4                                                            ; 3e86: a9 04
    sta width_in_cells                                                ; 3e88: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3e8a: 20 bb 1a
; draw 16x1 rectangle at (12,2)
    ldx #$0c                                                          ; 3e8d: a2 0c
    ldy #2                                                            ; 3e8f: a0 02
    lda #$10                                                          ; 3e91: a9 10
    sta width_in_cells                                                ; 3e93: 85 3c
    dec height_in_cells                                               ; 3e95: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e97: 20 bb 1a
; draw 16x1 rectangle at (12,21)
    ldy #$15                                                          ; 3e9a: a0 15
    jsr copy_rectangle_of_memory_to_screen                            ; 3e9c: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3e9f: 20 90 1b
; draw rope at (9,2) length 9
    ldx #9                                                            ; 3ea2: a2 09
    ldy #2                                                            ; 3ea4: a0 02
    lda #9                                                            ; 3ea6: a9 09
    jsr draw_rope                                                     ; 3ea8: 20 b9 1d
; draw rope at (30,2) length 18
    ldx #$1e                                                          ; 3eab: a2 1e
    lda #$12                                                          ; 3ead: a9 12
    jsr draw_rope                                                     ; 3eaf: 20 b9 1d
    jsr start_room                                                    ; 3eb2: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 3eb5: 20 da 12
    and #exit_room_left                                               ; 3eb8: 29 01
    beq room_2_game_update_loop                                       ; 3eba: f0 f9
    ldx #1                                                            ; 3ebc: a2 01
    ldy current_level                                                 ; 3ebe: a4 31
    jmp initialise_level_and_room                                     ; 3ec0: 4c 40 11

rabbit_sprites_base
    !byte 0                                                           ; 3ec3: 00
rabbit_walk_sprites
    !byte spriteid_rabbit_walk_1                                      ; 3ec4: d7
    !byte spriteid_rabbit_walk_2                                      ; 3ec5: d8
    !byte spriteid_rabbit_walk_3                                      ; 3ec6: d9
    !byte spriteid_rabbit_sit                                         ; 3ec7: da
    !byte $ff                                                         ; 3ec8: ff
rabbit_sit_sprites
    !byte spriteid_rabbit_sit                                         ; 3ec9: da
    !byte $ff                                                         ; 3eca: ff
rabbit_push_sprites
    !byte spriteid_rabbit_push                                        ; 3ecb: db
    !byte spriteid_rabbit_push                                        ; 3ecc: db
    !byte spriteid_rabbit_push                                        ; 3ecd: db
    !byte spriteid_rabbit_push                                        ; 3ece: db
    !byte spriteid_rabbit_push                                        ; 3ecf: db
    !byte spriteid_rabbit_push                                        ; 3ed0: db
    !byte spriteid_rabbit_push                                        ; 3ed1: db
    !byte spriteid_rabbit_push                                        ; 3ed2: db
    !byte $ff                                                         ; 3ed3: ff

; check for first update in room (branch if not)
update_rabbit_puzzle
    lda update_room_first_update_flag                                 ; 3ed4: ad 2b 13
    beq update_rabbit_not_first_update                                ; 3ed7: f0 43
; check for level change (branch if not)
    lda current_level                                                 ; 3ed9: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3edb: c5 51
    beq new_room_only1                                                ; 3edd: f0 1a
; new level
    lda #rabbit_sit_sprites  - rabbit_sprites_base                    ; 3edf: a9 06
    sta rabbit_sprite_animation                                       ; 3ee1: 8d 70 0a
    sta rabbit_sprite_animation_step                                  ; 3ee4: 8d 71 0a
    lda #0                                                            ; 3ee7: a9 00
    sta l0a75                                                         ; 3ee9: 8d 75 0a
    lda #$80                                                          ; 3eec: a9 80
    sta rabbit_x                                                      ; 3eee: 8d 72 0a
    lda #1                                                            ; 3ef1: a9 01
    sta rabbit_direction                                              ; 3ef3: 8d 73 0a
    sta rabbit_speed                                                  ; 3ef6: 8d 74 0a
new_room_only1
    ldx #<envelope2                                                   ; 3ef9: a2 99
    ldy #>envelope2                                                   ; 3efb: a0 44
    jsr define_envelope                                               ; 3efd: 20 5e 39
    lda desired_room_index                                            ; 3f00: a5 30
    cmp #2                                                            ; 3f02: c9 02
    bne update_rabbit_object_local                                    ; 3f04: d0 13
    ldx #$14                                                          ; 3f06: a2 14
    ldy #$0d                                                          ; 3f08: a0 0d
    lda #7                                                            ; 3f0a: a9 07
    jsr draw_plant_a_at_cell_xy_and_add_to_collision_map              ; 3f0c: 20 1d 44
    lda #spriteid_cache2                                              ; 3f0f: a9 cd
    sta object_erase_type + objectid_rabbit                           ; 3f11: 8d af 38
    lda #$66 ; 'f'                                                    ; 3f14: a9 66
    sta object_y_low + objectid_rabbit                                ; 3f16: 8d 7f 09
update_rabbit_object_local
    jmp update_rabbit_object                                          ; 3f19: 4c ed 3f

update_rabbit_not_first_update
    lda rabbit_sprite_animation_step                                  ; 3f1c: ad 71 0a
    clc                                                               ; 3f1f: 18
    adc #1                                                            ; 3f20: 69 01
    tay                                                               ; 3f22: a8
    lda rabbit_sprites_base,y                                         ; 3f23: b9 c3 3e
    cmp #$ff                                                          ; 3f26: c9 ff
    bne got_animation_step_y                                          ; 3f28: d0 03
    ldy rabbit_sprite_animation                                       ; 3f2a: ac 70 0a
got_animation_step_y
    lda desired_room_index                                            ; 3f2d: a5 30
    cmp #2                                                            ; 3f2f: c9 02
    bne rabbit_animation                                              ; 3f31: d0 3e
; in room 2
    ldx #objectid_rabbit                                              ; 3f33: a2 03
    sty remember_y                                                    ; 3f35: 8c 09 40
    ldy #objectid_player                                              ; 3f38: a0 00
    jsr test_for_collision_between_objects_x_and_y                    ; 3f3a: 20 e2 28
    ldy remember_y                                                    ; 3f3d: ac 09 40
    ora #0                                                            ; 3f40: 09 00
    beq rabbit_animation                                              ; 3f42: f0 2d
    ldy #rabbit_push_sprites - rabbit_sprites_base                    ; 3f44: a0 08
    lda #rabbit_sit_sprites  - rabbit_sprites_base                    ; 3f46: a9 06
    sta rabbit_sprite_animation                                       ; 3f48: 8d 70 0a
    lda #$0c                                                          ; 3f4b: a9 0c
    sta l0a75                                                         ; 3f4d: 8d 75 0a
    lda object_x_low                                                  ; 3f50: ad 50 09
    cmp object_x_low + objectid_rabbit                                ; 3f53: cd 53 09
    bcc player_bounces_off_the_rabbit_to_the_left                     ; 3f56: 90 0c
    lda #6                                                            ; 3f58: a9 06
    sta player_wall_collision_reaction_speed                          ; 3f5a: 8d 33 24
    lda #1                                                            ; 3f5d: a9 01
    sta rabbit_direction                                              ; 3f5f: 8d 73 0a
    bne update_rabbit_animation_step_local                            ; 3f62: d0 0a                   ; ALWAYS branch

player_bounces_off_the_rabbit_to_the_left
    lda #$fa                                                          ; 3f64: a9 fa
    sta player_wall_collision_reaction_speed                          ; 3f66: 8d 33 24
    lda #$ff                                                          ; 3f69: a9 ff
    sta rabbit_direction                                              ; 3f6b: 8d 73 0a
update_rabbit_animation_step_local
    jmp update_rabbit_animation_step                                  ; 3f6e: 4c ea 3f

rabbit_animation
    lda rabbit_sprite_animation                                       ; 3f71: ad 70 0a
    cmp #rabbit_sit_sprites  - rabbit_sprites_base                    ; 3f74: c9 06
    bne rabbit_is_hopping_along                                       ; 3f76: d0 26
    dec l0a75                                                         ; 3f78: ce 75 0a
    bpl update_rabbit_animation_step_local                            ; 3f7b: 10 f1
    ldy #rabbit_walk_sprites - rabbit_sprites_base                    ; 3f7d: a0 01
    sty rabbit_sprite_animation                                       ; 3f7f: 8c 70 0a
    lda rabbit_speed                                                  ; 3f82: ad 74 0a
    sta rabbit_direction                                              ; 3f85: 8d 73 0a
    lda rabbit_x                                                      ; 3f88: ad 72 0a
    cmp #$70 ; 'p'                                                    ; 3f8b: c9 70
    beq reverse_direction                                             ; 3f8d: f0 04
    cmp #$d0                                                          ; 3f8f: c9 d0
    bne rabbit_is_hopping_along                                       ; 3f91: d0 0b
reverse_direction
    lda rabbit_speed                                                  ; 3f93: ad 74 0a
    eor #$fe                                                          ; 3f96: 49 fe
    sta rabbit_speed                                                  ; 3f98: 8d 74 0a
    sta rabbit_direction                                              ; 3f9b: 8d 73 0a
rabbit_is_hopping_along
    lda rabbit_sprite_animation                                       ; 3f9e: ad 70 0a
    cmp #rabbit_walk_sprites - rabbit_sprites_base                    ; 3fa1: c9 01
    bne update_rabbit_animation_step                                  ; 3fa3: d0 45
    cpy #fruit_fall_sideways_animation1 - fruit_animation_base        ; 3fa5: c0 04
    bne move_rabbit                                                   ; 3fa7: d0 23
    lda desired_room_index                                            ; 3fa9: a5 30
    cmp #2                                                            ; 3fab: c9 02
    bne move_rabbit                                                   ; 3fad: d0 1d
    sty remember_y                                                    ; 3faf: 8c 09 40
    lda #0                                                            ; 3fb2: a9 00
    ldx #<sound2                                                      ; 3fb4: a2 b7
    ldy #>sound2                                                      ; 3fb6: a0 44
    jsr play_sound_yx                                                 ; 3fb8: 20 f6 38
    ldx #<sound3                                                      ; 3fbb: a2 af
    ldy #>sound3                                                      ; 3fbd: a0 44
    jsr play_sound_yx                                                 ; 3fbf: 20 f6 38
    ldx #<sound4                                                      ; 3fc2: a2 a7
    ldy #>sound4                                                      ; 3fc4: a0 44
    jsr play_sound_yx                                                 ; 3fc6: 20 f6 38
    ldy remember_y                                                    ; 3fc9: ac 09 40
move_rabbit
    lda rabbit_speed                                                  ; 3fcc: ad 74 0a
    asl                                                               ; 3fcf: 0a
    asl                                                               ; 3fd0: 0a
    clc                                                               ; 3fd1: 18
    adc rabbit_x                                                      ; 3fd2: 6d 72 0a
    sta rabbit_x                                                      ; 3fd5: 8d 72 0a
    cmp #$70 ; 'p'                                                    ; 3fd8: c9 70
    beq rabbit_at_end_of_walking                                      ; 3fda: f0 04
    cmp #$d0                                                          ; 3fdc: c9 d0
    bne update_rabbit_animation_step                                  ; 3fde: d0 0a
rabbit_at_end_of_walking
    ldy #rabbit_sit_sprites - rabbit_sprites_base                     ; 3fe0: a0 06
    sty rabbit_sprite_animation                                       ; 3fe2: 8c 70 0a
    lda #fruit_fall_sideways_animation1 - fruit_animation_base        ; 3fe5: a9 04
    sta l0a75                                                         ; 3fe7: 8d 75 0a
update_rabbit_animation_step
    sty rabbit_sprite_animation_step                                  ; 3fea: 8c 71 0a
update_rabbit_object
    lda desired_room_index                                            ; 3fed: a5 30
    cmp #2                                                            ; 3fef: c9 02
    bne return2                                                       ; 3ff1: d0 15
; in room 2. set rabbit object
    ldy rabbit_sprite_animation_step                                  ; 3ff3: ac 71 0a
    lda rabbit_sprites_base,y                                         ; 3ff6: b9 c3 3e
    sta object_spriteid + objectid_rabbit                             ; 3ff9: 8d ab 09
    lda rabbit_x                                                      ; 3ffc: ad 72 0a
    sta object_x_low + objectid_rabbit                                ; 3fff: 8d 53 09
    lda rabbit_direction                                              ; 4002: ad 73 0a
    sta object_direction + objectid_rabbit                            ; 4005: 8d c1 09
return2
    rts                                                               ; 4008: 60

remember_y
    !byte 0                                                           ; 4009: 00
; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 20                                                          ; 400a: 14                      ; initial player X cell
    !byte 22                                                          ; 400b: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####     |  ################  |     ####
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###OOO   |                    |      ###
; ###OOO   |                    |      ###
; #######  |  ################  |  #######
; #######  |  ################  |  #######
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###                           |   OOO###
; #######             P         |   OOO###
; ############################  |  #######
; ############################  |  #######
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_3_code
    ldx #0                                                            ; 400c: a2 00
    ldy #0                                                            ; 400e: a0 00
    lda #$ff                                                          ; 4010: a9 ff
    sta width_in_cells                                                ; 4012: 85 3c
    lda #2                                                            ; 4014: a9 02
    sta height_in_cells                                               ; 4016: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4018: 20 bb 1a
; draw 4x1 rectangle at (0,2)
    ldy #2                                                            ; 401b: a0 02
    lda #4                                                            ; 401d: a9 04
    sta width_in_cells                                                ; 401f: 85 3c
    dec height_in_cells                                               ; 4021: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4023: 20 bb 1a
; draw 4x1 rectangle at (36,2)
    ldx #$24 ; '$'                                                    ; 4026: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 4028: 20 bb 1a
; draw 3x19 rectangle at (0,3)
    ldx #0                                                            ; 402b: a2 00
    iny                                                               ; 402d: c8
    dec width_in_cells                                                ; 402e: c6 3c
    lda #$13                                                          ; 4030: a9 13
    sta height_in_cells                                               ; 4032: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4034: 20 bb 1a
; draw 3x19 rectangle at (37,3)
    ldx #$25 ; '%'                                                    ; 4037: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 4039: 20 bb 1a
; draw 4x2 rectangle at (3,13)
    ldx #3                                                            ; 403c: a2 03
    ldy #$0d                                                          ; 403e: a0 0d
    lda #4                                                            ; 4040: a9 04
    sta width_in_cells                                                ; 4042: 85 3c
    lda #2                                                            ; 4044: a9 02
    sta height_in_cells                                               ; 4046: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4048: 20 bb 1a
; draw 4x2 rectangle at (33,13)
    ldx #$21 ; '!'                                                    ; 404b: a2 21
    jsr copy_rectangle_of_memory_to_screen                            ; 404d: 20 bb 1a
; draw 16x2 rectangle at (12,13)
    ldx #$0c                                                          ; 4050: a2 0c
    lda #$10                                                          ; 4052: a9 10
    sta width_in_cells                                                ; 4054: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 4056: 20 bb 1a
; draw 28x2 rectangle at (0,22)
    ldx #0                                                            ; 4059: a2 00
    ldy #$16                                                          ; 405b: a0 16
    lda #$1c                                                          ; 405d: a9 1c
    sta width_in_cells                                                ; 405f: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 4061: 20 bb 1a
; draw 28x2 rectangle at (33,22)
    ldx #$21 ; '!'                                                    ; 4064: a2 21
    jsr copy_rectangle_of_memory_to_screen                            ; 4066: 20 bb 1a
; draw 4x1 rectangle at (3,21)
    ldx #3                                                            ; 4069: a2 03
    dey                                                               ; 406b: 88
    lda #4                                                            ; 406c: a9 04
    sta width_in_cells                                                ; 406e: 85 3c
    dec height_in_cells                                               ; 4070: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4072: 20 bb 1a
; draw 16x1 rectangle at (12,2)
    ldx #$0c                                                          ; 4075: a2 0c
    ldy #2                                                            ; 4077: a0 02
    lda #$10                                                          ; 4079: a9 10
    sta width_in_cells                                                ; 407b: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 407d: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 4080: 20 90 1b
; draw fruit at (3,11) of size (3x2)
    ldx #2                                                            ; 4083: a2 02
    stx height_in_cells                                               ; 4085: 86 3d
    inx                                                               ; 4087: e8
    stx width_in_cells                                                ; 4088: 86 3c
    ldy #$0b                                                          ; 408a: a0 0b
    lda #spriteid_fruit                                               ; 408c: a9 d0
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 408e: 20 57 1f
; draw fruit at (34,20) of size (3x2)
    ldx #$22 ; '"'                                                    ; 4091: a2 22
    ldy #$14                                                          ; 4093: a0 14
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 4095: 20 57 1f
; draw rope at (9,2) length 18
    ldx #9                                                            ; 4098: a2 09
    ldy #2                                                            ; 409a: a0 02
    lda #$12                                                          ; 409c: a9 12
    jsr draw_rope                                                     ; 409e: 20 b9 1d
; draw rope at (30,2) length 255
    ldx #$1e                                                          ; 40a1: a2 1e
    lda #$ff                                                          ; 40a3: a9 ff
    jsr draw_rope                                                     ; 40a5: 20 b9 1d
    jsr start_room                                                    ; 40a8: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 40ab: 20 da 12
    and #exit_room_bottom                                             ; 40ae: 29 02
    beq room_3_game_update_loop                                       ; 40b0: f0 f9
    ldx #1                                                            ; 40b2: a2 01
    ldy current_level                                                 ; 40b4: a4 31
    jmp initialise_level_and_room                                     ; 40b6: 4c 40 11

; (x,y) fruit offsets for animation
fruit_animation_base
    !byte 0                                                           ; 40b9: 00
fruit_initial_idle_animation
    !byte 0, 0                                                        ; 40ba: 00 00
    !byte $80                                                         ; 40bc: 80
fruit_fall_sideways_animation1
    !byte 8, 2                                                        ; 40bd: 08 02
    !byte 8, 2                                                        ; 40bf: 08 02
    !byte 4, 4                                                        ; 40c1: 04 04
    !byte 4, 4                                                        ; 40c3: 04 04
    !byte $80                                                         ; 40c5: 80
fruit_stopped_animation
    !byte 0, 0                                                        ; 40c6: 00 00
    !byte $80                                                         ; 40c8: 80
fruit_sideways_animation
    !byte 8, 0                                                        ; 40c9: 08 00
    !byte $80                                                         ; 40cb: 80
fruit_fall_sideways_animation2
    !byte 8, 2                                                        ; 40cc: 08 02
    !byte 8, 2                                                        ; 40ce: 08 02
    !byte 8, 4                                                        ; 40d0: 08 04
    !byte $80                                                         ; 40d2: 80
fruit_fall_straight_down_animation
    !byte 0, 8                                                        ; 40d3: 00 08
    !byte $80                                                         ; 40d5: 80

; check for first update in room (branch if so)
update_fruit_puzzle
    lda update_room_first_update_flag                                 ; 40d6: ad 2b 13
    bne update_fruit_first_update                                     ; 40d9: d0 03
    jmp update_fruit_timer                                            ; 40db: 4c 67 41

; check for level change (branch if not)
update_fruit_first_update
    lda current_level                                                 ; 40de: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 40e0: c5 51
    beq new_room_only2                                                ; 40e2: f0 42
; new level. initialise fruit
    ldx #<envelope3                                                   ; 40e4: a2 7b
    ldy #>envelope3                                                   ; 40e6: a0 44
    jsr define_envelope                                               ; 40e8: 20 5e 39
    lda #0                                                            ; 40eb: a9 00
    sta fruit_timer                                                   ; 40ed: 8d 6f 0a
    lda save_game_level_h_current_fruit_animation                     ; 40f0: ad 1c 0a
    cmp #fruit_stopped_animation - fruit_animation_base               ; 40f3: c9 0d
    beq new_room_only2                                                ; 40f5: f0 2f
    cmp #fruit_initial_idle_animation - fruit_animation_base          ; 40f7: c9 01
    beq new_room_only2                                                ; 40f9: f0 2b
    dec fruit_timer                                                   ; 40fb: ce 6f 0a
    ora #0                                                            ; 40fe: 09 00
    bne new_room_only2                                                ; 4100: d0 24
    inc fruit_timer                                                   ; 4102: ee 6f 0a
    lda #3                                                            ; 4105: a9 03
    sta save_game_level_h_fruit_room                                  ; 4107: 8d 22 0a
    lda #$98                                                          ; 410a: a9 98
    sta save_game_level_h_fruit_x_low                                 ; 410c: 8d 1e 0a
    lda #0                                                            ; 410f: a9 00
    sta save_game_level_h_fruit_x_high                                ; 4111: 8d 1f 0a
    lda #$2c ; ','                                                    ; 4114: a9 2c
    sta save_game_level_h_fruit_y_low                                 ; 4116: 8d 20 0a
    lda #0                                                            ; 4119: a9 00
    sta save_game_level_h_fruit_y_high                                ; 411b: 8d 21 0a
    lda #fruit_initial_idle_animation - fruit_animation_base          ; 411e: a9 01
    sta save_game_level_h_current_fruit_animation                     ; 4120: 8d 1c 0a
    sta save_game_level_h_fruit_animation_step                        ; 4123: 8d 1d 0a
new_room_only2
    lda desired_room_index                                            ; 4126: a5 30
    beq fruit_fully_fast_forwarded                                    ; 4128: f0 35
    cmp #3                                                            ; 412a: c9 03
    bne not_room_3                                                    ; 412c: d0 09
; draw room 3 plant
    ldx #$14                                                          ; 412e: a2 14
    ldy #$0d                                                          ; 4130: a0 0d
    lda #6                                                            ; 4132: a9 06
    jsr draw_plant_a_at_cell_xy_and_add_to_collision_map              ; 4134: 20 1d 44
not_room_3
    lda #spriteid_cache1                                              ; 4137: a9 cb
    sta object_erase_type + objectid_fruit                            ; 4139: 8d ae 38
    lda desired_room_index                                            ; 413c: a5 30
    cmp save_game_level_h_fruit_room                                  ; 413e: cd 22 0a
    bne fruit_fully_fast_forwarded                                    ; 4141: d0 1c
    jsr set_fruit_object_position                                     ; 4143: 20 b6 43
fast_forward_fruit_animation_loop
    lda desired_room_index                                            ; 4146: a5 30
    cmp save_game_level_h_fruit_room                                  ; 4148: cd 22 0a
    bne fruit_fully_fast_forwarded                                    ; 414b: d0 12
    lda fruit_timer                                                   ; 414d: ad 6f 0a
    beq fruit_fully_fast_forwarded                                    ; 4150: f0 0d
    cmp #$ff                                                          ; 4152: c9 ff
    beq fruit_not_done_yet                                            ; 4154: f0 03
    dec fruit_timer                                                   ; 4156: ce 6f 0a
fruit_not_done_yet
    jsr update_fruit_animation                                        ; 4159: 20 0e 42
    jmp fast_forward_fruit_animation_loop                             ; 415c: 4c 46 41

fruit_fully_fast_forwarded
    lda #collision_map_solid_rock                                     ; 415f: a9 03
    jsr write_fruit_collision_map                                     ; 4161: 20 d4 43
    jmp return3                                                       ; 4164: 4c 0d 42

update_fruit_timer
    lda desired_room_index                                            ; 4167: a5 30
    cmp save_game_level_h_fruit_room                                  ; 4169: cd 22 0a
    beq reset_sound_priorities                                        ; 416c: f0 0b
    lda fruit_timer                                                   ; 416e: ad 6f 0a
    bmi return3_local                                                 ; 4171: 30 03
    inc fruit_timer                                                   ; 4173: ee 6f 0a
return3_local
    jmp return3                                                       ; 4176: 4c 0d 42

reset_sound_priorities
    lda sound_priority_per_channel_table                              ; 4179: ad 6f 39
    cmp #$41 ; 'A'                                                    ; 417c: c9 41
    bcs continue_updating_fruit                                       ; 417e: b0 08
    lda #0                                                            ; 4180: a9 00
    sta sound_priority_per_channel_table                              ; 4182: 8d 6f 39
    sta sound_priority_per_channel_table + 1                          ; 4185: 8d 70 39
continue_updating_fruit
    jsr update_fruit_animation                                        ; 4188: 20 0e 42
    lda desired_room_index                                            ; 418b: a5 30
    cmp save_game_level_h_fruit_room                                  ; 418d: cd 22 0a
    beq in_fruit_room                                                 ; 4190: f0 08
    lda #0                                                            ; 4192: a9 00
    sta fruit_timer                                                   ; 4194: 8d 6f 0a
    jmp return3                                                       ; 4197: 4c 0d 42

in_fruit_room
    lda save_game_level_h_current_fruit_animation                     ; 419a: ad 1c 0a
    cmp #fruit_fall_sideways_animation2 - fruit_animation_base        ; 419d: c9 13
    bne check_for_fruit_falling_sideways1                             ; 419f: d0 1d
    lda save_game_level_h_current_fruit_direction                     ; 41a1: ad 23 0a
    bpl fruit_falling_right                                           ; 41a4: 10 06
    dec temp_left_offset                                              ; 41a6: ce d0 24
    jmp fruit_falling_left                                            ; 41a9: 4c af 41

fruit_falling_right
    inc temp_right_offset                                             ; 41ac: ee d1 24
fruit_falling_left
    lda #1                                                            ; 41af: a9 01
    sta temp_bottom_offset                                            ; 41b1: 8d 51 25
    lda #objectid_fruit                                               ; 41b4: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 41b6: 20 94 28
    bne play_landing_sound_local                                      ; 41b9: d0 2a
    jmp return3                                                       ; 41bb: 4c 0d 42

check_for_fruit_falling_sideways1
    lda save_game_level_h_fruit_animation_step                        ; 41be: ad 1d 0a
    cmp #fruit_fall_sideways_animation1 - fruit_animation_base        ; 41c1: c9 04
    beq end_of_fall_sound                                             ; 41c3: f0 14
    lda save_game_level_h_current_fruit_animation                     ; 41c5: ad 1c 0a
    cmp #fruit_sideways_animation - fruit_animation_base              ; 41c8: c9 10
    bne check_for_fruit_falling_straight_down                         ; 41ca: d0 1c
; check for left or right fruit-wall collision
    dec temp_left_offset                                              ; 41cc: ce d0 24
    inc temp_right_offset                                             ; 41cf: ee d1 24
    lda #objectid_fruit                                               ; 41d2: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 41d4: 20 94 28
    bne play_landing_sound_local                                      ; 41d7: d0 0c
end_of_fall_sound
    lda #$40 ; '@'                                                    ; 41d9: a9 40
    ldx #<sound1                                                      ; 41db: a2 73
    ldy #>sound1                                                      ; 41dd: a0 44
    jsr play_sound_yx                                                 ; 41df: 20 f6 38
    jmp return3                                                       ; 41e2: 4c 0d 42

play_landing_sound_local
    jmp play_landing_sound                                            ; 41e5: 4c a9 23

check_for_fruit_falling_straight_down
    cmp #fruit_fall_straight_down_animation - fruit_animation_base    ; 41e8: c9 1a
    bne write_solid_fruit_collision                                   ; 41ea: d0 1c
    lda #2                                                            ; 41ec: a9 02
    sta temp_bottom_offset                                            ; 41ee: 8d 51 25
    lda #objectid_fruit                                               ; 41f1: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 41f3: 20 94 28
    beq return3                                                       ; 41f6: f0 15
; fruit collision sound
    lda #0                                                            ; 41f8: a9 00
    ldx #<sound5                                                      ; 41fa: a2 91
    ldy #>sound5                                                      ; 41fc: a0 44
    jsr play_sound_yx                                                 ; 41fe: 20 f6 38
    ldx #<sound6                                                      ; 4201: a2 89
    ldy #>sound6                                                      ; 4203: a0 44
    jmp play_sound_yx                                                 ; 4205: 4c f6 38

write_solid_fruit_collision
    lda #collision_map_solid_rock                                     ; 4208: a9 03
    jsr write_fruit_collision_map                                     ; 420a: 20 d4 43
return3
    rts                                                               ; 420d: 60

update_fruit_animation
    lda save_game_level_h_fruit_animation_step                        ; 420e: ad 1d 0a
    clc                                                               ; 4211: 18
    adc #2                                                            ; 4212: 69 02
    tay                                                               ; 4214: a8
    lda fruit_animation_base,y                                        ; 4215: b9 b9 40
    cmp #$80                                                          ; 4218: c9 80
    bne got_fruit_animation_step_y                                    ; 421a: d0 03
    ldy save_game_level_h_current_fruit_animation                     ; 421c: ac 1c 0a
got_fruit_animation_step_y
    lda save_game_level_h_current_fruit_animation                     ; 421f: ad 1c 0a
    cmp #fruit_initial_idle_animation - fruit_animation_base          ; 4222: c9 01
    bne check_for_fruit_stopped                                       ; 4224: d0 26
    ldx #objectid_player                                              ; 4226: a2 00
    sty remember_y2                                                   ; 4228: 8c b5 43
    ldy #objectid_fruit                                               ; 422b: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 422d: 20 e2 28
    ldy remember_y2                                                   ; 4230: ac b5 43
; branch if player and fruit didn't collide
    ora #0                                                            ; 4233: 09 00
    beq no_player_fruit_collision                                     ; 4235: f0 12
    lda #$80                                                          ; 4237: a9 80
    sta player_wall_collision_reaction_speed                          ; 4239: 8d 33 24
    lda object_direction                                              ; 423c: ad be 09
    sta save_game_level_h_current_fruit_direction                     ; 423f: 8d 23 0a
    ldy #4                                                            ; 4242: a0 04
    lda #$1a                                                          ; 4244: a9 1a
    sta save_game_level_h_current_fruit_animation                     ; 4246: 8d 1c 0a
no_player_fruit_collision
    jmp update_fruit_position                                         ; 4249: 4c 14 43

check_for_fruit_stopped
    lda save_game_level_h_current_fruit_animation                     ; 424c: ad 1c 0a
    cmp #fruit_stopped_animation - fruit_animation_base               ; 424f: c9 0d
    bne check_for_fruit_going_sideways                                ; 4251: d0 4a
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 4253: ad 2b 13
    bne no_player_fruit_collision                                     ; 4256: d0 f1
    dec temp_left_offset                                              ; 4258: ce d0 24
    inc temp_right_offset                                             ; 425b: ee d1 24
    ldx #objectid_player                                              ; 425e: a2 00
    sty remember_y2                                                   ; 4260: 8c b5 43
    ldy #objectid_fruit                                               ; 4263: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 4265: 20 e2 28
    ldy remember_y2                                                   ; 4268: ac b5 43
    ora #0                                                            ; 426b: 09 00
    beq no_player_fruit_collision                                     ; 426d: f0 da
    lda object_y_low                                                  ; 426f: ad 7c 09
    sec                                                               ; 4272: 38
    sbc save_game_level_h_fruit_y_low                                 ; 4273: ed 20 0a
    lda object_y_high                                                 ; 4276: ad 92 09
    sbc save_game_level_h_fruit_y_high                                ; 4279: ed 21 0a
    bmi no_player_fruit_collision                                     ; 427c: 30 cb
    ldx #1                                                            ; 427e: a2 01
    lda object_room_collision_flags                                   ; 4280: ad d8 38
    and #object_collided_right_wall                                   ; 4283: 29 04
    bne found_fruit_wall_collision                                    ; 4285: d0 09
    ldx #$ff                                                          ; 4287: a2 ff
    lda object_room_collision_flags                                   ; 4289: ad d8 38
    and #object_collided_left_wall                                    ; 428c: 29 01
    beq no_player_fruit_collision                                     ; 428e: f0 b9
found_fruit_wall_collision
    stx save_game_level_h_current_fruit_direction                     ; 4290: 8e 23 0a
    lda #collision_map_none                                           ; 4293: a9 00
    jsr write_fruit_collision_map                                     ; 4295: 20 d4 43
    ldy #fruit_sideways_animation - fruit_animation_base              ; 4298: a0 10
    sty save_game_level_h_current_fruit_animation                     ; 429a: 8c 1c 0a
check_for_fruit_going_sideways
    lda save_game_level_h_current_fruit_animation                     ; 429d: ad 1c 0a
    cmp #fruit_sideways_animation - fruit_animation_base              ; 42a0: c9 10
    bne check_for_fruit_fall_sideways2                                ; 42a2: d0 38
    lda save_game_level_h_current_fruit_direction                     ; 42a4: ad 23 0a
    bmi fruit_moving_left                                             ; 42a7: 30 06
    inc temp_right_offset                                             ; 42a9: ee d1 24
    jmp check_fruit_rock_collision                                    ; 42ac: 4c b2 42

fruit_moving_left
    dec temp_left_offset                                              ; 42af: ce d0 24
check_fruit_rock_collision
    lda #objectid_fruit                                               ; 42b2: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 42b4: 20 94 28
    bne stop_the_fruit                                                ; 42b7: d0 51
    lda #8                                                            ; 42b9: a9 08
    sta temp_left_offset                                              ; 42bb: 8d d0 24
    lda #$f8                                                          ; 42be: a9 f8
    sta temp_right_offset                                             ; 42c0: 8d d1 24
    lda #3                                                            ; 42c3: a9 03
    sta temp_default_collision_map_option                             ; 42c5: 8d e1 28
    lda #2                                                            ; 42c8: a9 02
    sta temp_bottom_offset                                            ; 42ca: 8d 51 25
    lda #2                                                            ; 42cd: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 42cf: 20 94 28
    bne update_fruit_position                                         ; 42d2: d0 40
    ldy #fruit_fall_sideways_animation2 - fruit_animation_base        ; 42d4: a0 13
    sty save_game_level_h_current_fruit_animation                     ; 42d6: 8c 1c 0a
    jmp update_fruit_position                                         ; 42d9: 4c 14 43

check_for_fruit_fall_sideways2
    lda save_game_level_h_current_fruit_animation                     ; 42dc: ad 1c 0a
    cmp #fruit_fall_sideways_animation2 - fruit_animation_base        ; 42df: c9 13
    bne check_for_fruit_falling_straight_down1                        ; 42e1: d0 0a
    cpy save_game_level_h_current_fruit_animation                     ; 42e3: cc 1c 0a
    bne update_fruit_position                                         ; 42e6: d0 2c
    ldy #fruit_fall_straight_down_animation - fruit_animation_base    ; 42e8: a0 1a
    sty save_game_level_h_current_fruit_animation                     ; 42ea: 8c 1c 0a
check_for_fruit_falling_straight_down1
    lda save_game_level_h_current_fruit_animation                     ; 42ed: ad 1c 0a
    cmp #fruit_fall_straight_down_animation - fruit_animation_base    ; 42f0: c9 1a
    bne update_fruit_position                                         ; 42f2: d0 20
    lda #8                                                            ; 42f4: a9 08
    sta temp_left_offset                                              ; 42f6: 8d d0 24
    lda #$f8                                                          ; 42f9: a9 f8
    sta temp_right_offset                                             ; 42fb: 8d d1 24
    lda #2                                                            ; 42fe: a9 02
    sta temp_bottom_offset                                            ; 4300: 8d 51 25
    lda #objectid_fruit                                               ; 4303: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4305: 20 94 28
    beq update_fruit_position                                         ; 4308: f0 0a
stop_the_fruit
    lda #0                                                            ; 430a: a9 00
    sta fruit_timer                                                   ; 430c: 8d 6f 0a
    ldy #fruit_stopped_animation - fruit_animation_base               ; 430f: a0 0d
    sty save_game_level_h_current_fruit_animation                     ; 4311: 8c 1c 0a
update_fruit_position
    sty save_game_level_h_fruit_animation_step                        ; 4314: 8c 1d 0a
    lda fruit_animation_base,y                                        ; 4317: b9 b9 40
    ldx save_game_level_h_current_fruit_direction                     ; 431a: ae 23 0a
    bpl fruit_moving_right                                            ; 431d: 10 05
    eor #$ff                                                          ; 431f: 49 ff
    clc                                                               ; 4321: 18
    adc #1                                                            ; 4322: 69 01
fruit_moving_right
    ldx #0                                                            ; 4324: a2 00
    ora #0                                                            ; 4326: 09 00
    bpl add_to_fruit_x_position                                       ; 4328: 10 01
    dex                                                               ; 432a: ca
add_to_fruit_x_position
    clc                                                               ; 432b: 18
    adc save_game_level_h_fruit_x_low                                 ; 432c: 6d 1e 0a
    sta save_game_level_h_fruit_x_low                                 ; 432f: 8d 1e 0a
    txa                                                               ; 4332: 8a
    adc save_game_level_h_fruit_x_high                                ; 4333: 6d 1f 0a
    sta save_game_level_h_fruit_x_high                                ; 4336: 8d 1f 0a
    iny                                                               ; 4339: c8
; add offset to fruit y position
    lda fruit_animation_base,y                                        ; 433a: b9 b9 40
    clc                                                               ; 433d: 18
    adc save_game_level_h_fruit_y_low                                 ; 433e: 6d 20 0a
    sta save_game_level_h_fruit_y_low                                 ; 4341: 8d 20 0a
    lda #0                                                            ; 4344: a9 00
    adc save_game_level_h_fruit_y_high                                ; 4346: 6d 21 0a
    sta save_game_level_h_fruit_y_high                                ; 4349: 8d 21 0a
    jsr set_fruit_object_position                                     ; 434c: 20 b6 43
    ldx #objectid_fruit                                               ; 434f: a2 02
    jsr find_left_and_right_of_object                                 ; 4351: 20 34 24
    jsr find_top_and_bottom_of_object                                 ; 4354: 20 d2 24
; move fruit to next room
    lda save_game_level_h_current_fruit_animation                     ; 4357: ad 1c 0a
    cmp #fruit_fall_straight_down_animation - fruit_animation_base    ; 435a: c9 1a
    beq check_for_moving_fruit_off_bottom_of_screen                   ; 435c: f0 3d
    cmp #fruit_sideways_animation - fruit_animation_base              ; 435e: c9 10
    bne return4                                                       ; 4360: d0 52
    lda save_game_level_h_current_fruit_direction                     ; 4362: ad 23 0a
    bmi move_fruit_left_one_room                                      ; 4365: 30 1c
    lda object_left_cell_x                                            ; 4367: a5 78
    cmp #game_area_width_cells                                        ; 4369: c9 28
    bcc return4                                                       ; 436b: 90 47
; subtract 320 pixels from x position
    lda save_game_level_h_fruit_x_low                                 ; 436d: ad 1e 0a
    sec                                                               ; 4370: 38
    sbc #$40 ; '@'                                                    ; 4371: e9 40
    sta save_game_level_h_fruit_x_low                                 ; 4373: 8d 1e 0a
    lda #0                                                            ; 4376: a9 00
    sbc #0                                                            ; 4378: e9 00
    sta save_game_level_h_fruit_x_high                                ; 437a: 8d 1f 0a
    inc save_game_level_h_fruit_room                                  ; 437d: ee 22 0a
    jmp hide_fruit                                                    ; 4380: 4c af 43

move_fruit_left_one_room
    lda object_right_cell_x                                           ; 4383: a5 79
    bpl return4                                                       ; 4385: 10 2d
; add 320 pixels to x position
    lda save_game_level_h_fruit_x_low                                 ; 4387: ad 1e 0a
    clc                                                               ; 438a: 18
    adc #$40 ; '@'                                                    ; 438b: 69 40
    sta save_game_level_h_fruit_x_low                                 ; 438d: 8d 1e 0a
    lda #1                                                            ; 4390: a9 01
    sta save_game_level_h_fruit_x_high                                ; 4392: 8d 1f 0a
    dec save_game_level_h_fruit_room                                  ; 4395: ce 22 0a
    jmp hide_fruit                                                    ; 4398: 4c af 43

check_for_moving_fruit_off_bottom_of_screen
    lda object_top_cell_y                                             ; 439b: a5 7a
    cmp #game_area_height_cells                                       ; 439d: c9 18
    bcc return4                                                       ; 439f: 90 13
; move fruit up 192 pixels
    lda save_game_level_h_fruit_y_low                                 ; 43a1: ad 20 0a
    sec                                                               ; 43a4: 38
    sbc #$c0                                                          ; 43a5: e9 c0
    sta save_game_level_h_fruit_y_low                                 ; 43a7: 8d 20 0a
; set fruit to room 1 as this is the only possible destination room
    lda #1                                                            ; 43aa: a9 01
    sta save_game_level_h_fruit_room                                  ; 43ac: 8d 22 0a
hide_fruit
    lda #spriteid_one_pixel_masked_out                                ; 43af: a9 00
    sta object_spriteid + objectid_fruit                              ; 43b1: 8d aa 09
return4
    rts                                                               ; 43b4: 60

remember_y2
    !byte 0                                                           ; 43b5: 00

set_fruit_object_position
    lda save_game_level_h_fruit_x_low                                 ; 43b6: ad 1e 0a
    sta object_x_low + objectid_fruit                                 ; 43b9: 8d 52 09
    lda save_game_level_h_fruit_x_high                                ; 43bc: ad 1f 0a
    sta object_x_high + objectid_fruit                                ; 43bf: 8d 68 09
    lda save_game_level_h_fruit_y_low                                 ; 43c2: ad 20 0a
    sta object_y_low + objectid_fruit                                 ; 43c5: 8d 7e 09
    lda save_game_level_h_fruit_y_high                                ; 43c8: ad 21 0a
    sta object_y_high + objectid_fruit                                ; 43cb: 8d 94 09
    lda #spriteid_fruit                                               ; 43ce: a9 d0
    sta object_spriteid + objectid_fruit                              ; 43d0: 8d aa 09
    rts                                                               ; 43d3: 60

write_fruit_collision_map
    sta value_to_write_to_collision_map                               ; 43d4: 85 3e
    ora #0                                                            ; 43d6: 09 00
    beq valid_write                                                   ; 43d8: f0 07
; we want to write a non-zero value to the collision map. check the fruit is stopped
; before doing so
    lda save_game_level_h_current_fruit_animation                     ; 43da: ad 1c 0a
    cmp #fruit_stopped_animation - fruit_animation_base               ; 43dd: c9 0d
    bne return5                                                       ; 43df: d0 3b
; check we are in the same room as the fruit (return if not)
valid_write
    lda desired_room_index                                            ; 43e1: a5 30
    cmp save_game_level_h_fruit_room                                  ; 43e3: cd 22 0a
    bne return5                                                       ; 43e6: d0 34
; calculate the x cell coordinate to write to
    lda save_game_level_h_fruit_x_high                                ; 43e8: ad 1f 0a
    lsr                                                               ; 43eb: 4a
    sta movement_low                                                  ; 43ec: 85 70
    lda save_game_level_h_fruit_x_low                                 ; 43ee: ad 1e 0a
    ror                                                               ; 43f1: 6a
    lsr movement_low                                                  ; 43f2: 46 70
    ror                                                               ; 43f4: 6a
    lsr movement_low                                                  ; 43f5: 46 70
    ror                                                               ; 43f7: 6a
    tax                                                               ; 43f8: aa
; calculate the y cell coordinate to write to
    lda save_game_level_h_fruit_y_high                                ; 43f9: ad 21 0a
    lsr                                                               ; 43fc: 4a
    sta movement_low                                                  ; 43fd: 85 70
    lda save_game_level_h_fruit_y_low                                 ; 43ff: ad 20 0a
    ror                                                               ; 4402: 6a
    lsr movement_low                                                  ; 4403: 46 70
    ror                                                               ; 4405: 6a
    lsr movement_low                                                  ; 4406: 46 70
    ror                                                               ; 4408: 6a
    tay                                                               ; 4409: a8
; fruit is 3x2 cells
    lda #3                                                            ; 440a: a9 03
    sta width_in_cells                                                ; 440c: 85 3c
    lda #2                                                            ; 440e: a9 02
    sta height_in_cells                                               ; 4410: 85 3d
    jsr read_collision_map_value_for_xy                               ; 4412: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 4415: c5 3e
    beq return5                                                       ; 4417: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 4419: 20 44 1e
return5
    rts                                                               ; 441c: 60

draw_plant_a_at_cell_xy_and_add_to_collision_map
    sec                                                               ; 441d: 38
    sbc #2                                                            ; 441e: e9 02
    sta plant_height_loop_counter                                     ; 4420: 8d 64 44
    dey                                                               ; 4423: 88
    lda #spriteid_stalk_bottom                                        ; 4424: a9 d3
    jsr draw_sprite_a_at_cell_xy                                      ; 4426: 20 4c 1f
    lda #collision_map_rope                                           ; 4429: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 442b: 20 bb 1e
draw_plant_loop
    dey                                                               ; 442e: 88
    lda #spriteid_stalk_middle                                        ; 442f: a9 d2
    jsr draw_sprite_a_at_cell_xy                                      ; 4431: 20 4c 1f
    lda #collision_map_rope                                           ; 4434: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4436: 20 bb 1e
    dec plant_height_loop_counter                                     ; 4439: ce 64 44
    bne draw_plant_loop                                               ; 443c: d0 f0
    dey                                                               ; 443e: 88
    lda #spriteid_stalk_top                                           ; 443f: a9 d1
    jsr draw_sprite_a_at_cell_xy                                      ; 4441: 20 4c 1f
    lda #collision_map_rope                                           ; 4444: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4446: 20 bb 1e
    dey                                                               ; 4449: 88
    lda #collision_map_solid_rock                                     ; 444a: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 444c: 20 bb 1e
    iny                                                               ; 444f: c8
    iny                                                               ; 4450: c8
    iny                                                               ; 4451: c8
    lda #spriteid_leaf                                                ; 4452: a9 d6
    jsr draw_sprite_a_at_cell_xy                                      ; 4454: 20 4c 1f
    inx                                                               ; 4457: e8
    lda #$ff                                                          ; 4458: a9 ff
    sta temp_sprite_x_offset                                          ; 445a: 85 3a
    dey                                                               ; 445c: 88
    sta sprite_reflect_flag                                           ; 445d: 85 1d
    lda #spriteid_leaf                                                ; 445f: a9 d6
    jmp draw_sprite_a_at_cell_xy                                      ; 4461: 4c 4c 1f

plant_height_loop_counter
    !byte 0                                                           ; 4464: 00
envelope1
    !byte 5                                                           ; 4465: 05                      ; envelope number
    !byte 1                                                           ; 4466: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 4467: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 4468: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 4469: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 446a: 00                      ; number of steps in section 1
    !byte 0                                                           ; 446b: 00                      ; number of steps in section 2
    !byte 0                                                           ; 446c: 00                      ; number of steps in section 3
    !byte 10                                                          ; 446d: 0a                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 446e: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 446f: 00                      ; change of amplitude per step during sustain phase
    !byte 216                                                         ; 4470: d8                      ; change of amplitude per step during release phase
    !byte 40                                                          ; 4471: 28                      ; target of level at end of attack phase
    !byte 0                                                           ; 4472: 00                      ; target of level at end of decay phase
sound1
    !word $10                                                         ; 4473: 10 00                   ; channel
    !word 5                                                           ; 4475: 05 00                   ; amplitude
    !word 4                                                           ; 4477: 04 00                   ; pitch
    !word 4                                                           ; 4479: 04 00                   ; duration
envelope3
    !byte 6                                                           ; 447b: 06                      ; envelope number
    !byte 1                                                           ; 447c: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 447d: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 447e: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 447f: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 4480: 00                      ; number of steps in section 1
    !byte 0                                                           ; 4481: 00                      ; number of steps in section 2
    !byte 0                                                           ; 4482: 00                      ; number of steps in section 3
    !byte 110                                                         ; 4483: 6e                      ; change of amplitude per step during attack phase
    !byte 255                                                         ; 4484: ff                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4485: 00                      ; change of amplitude per step during sustain phase
    !byte 248                                                         ; 4486: f8                      ; change of amplitude per step during release phase
    !byte 110                                                         ; 4487: 6e                      ; target of level at end of attack phase
    !byte 55                                                          ; 4488: 37                      ; target of level at end of decay phase
sound6
    !word $10                                                         ; 4489: 10 00                   ; channel
    !word 6                                                           ; 448b: 06 00                   ; amplitude
    !word 7                                                           ; 448d: 07 00                   ; pitch
    !word 1                                                           ; 448f: 01 00                   ; duration
sound5
    !word $11                                                         ; 4491: 11 00                   ; channel
    !word 0                                                           ; 4493: 00 00                   ; amplitude
    !word 210                                                         ; 4495: d2 00                   ; pitch
    !word 1                                                           ; 4497: 01 00                   ; duration
envelope2
    !byte 7                                                           ; 4499: 07                      ; envelope number
    !byte 1                                                           ; 449a: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 449b: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 449c: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 449d: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 449e: 00                      ; number of steps in section 1
    !byte 0                                                           ; 449f: 00                      ; number of steps in section 2
    !byte 0                                                           ; 44a0: 00                      ; number of steps in section 3
    !byte 40                                                          ; 44a1: 28                      ; change of amplitude per step during attack phase
    !byte 216                                                         ; 44a2: d8                      ; change of amplitude per step during decay phase
    !byte 216                                                         ; 44a3: d8                      ; change of amplitude per step during sustain phase
    !byte 176                                                         ; 44a4: b0                      ; change of amplitude per step during release phase
    !byte 80                                                          ; 44a5: 50                      ; target of level at end of attack phase
    !byte 0                                                           ; 44a6: 00                      ; target of level at end of decay phase
sound4
    !word $10                                                         ; 44a7: 10 00                   ; channel
    !word 7                                                           ; 44a9: 07 00                   ; amplitude
    !word 7                                                           ; 44ab: 07 00                   ; pitch
    !word 1                                                           ; 44ad: 01 00                   ; duration
sound3
    !word $11                                                         ; 44af: 11 00                   ; channel
    !word 0                                                           ; 44b1: 00 00                   ; amplitude
    !word 190                                                         ; 44b3: be 00                   ; pitch
    !word 1                                                           ; 44b5: 01 00                   ; duration
sound2
    !word $10                                                         ; 44b7: 10 00                   ; channel
    !word 0                                                           ; 44b9: 00 00                   ; amplitude
    !word 0                                                           ; 44bb: 00 00                   ; pitch
    !word 0                                                           ; 44bd: 00 00                   ; duration
ground_fill_2x2_top_left
    !byte %....#...                                                   ; 44bf: 08
    !byte %....#...                                                   ; 44c0: 08
    !byte %...#....                                                   ; 44c1: 10
    !byte %..#...##                                                   ; 44c2: 23
    !byte %##...#..                                                   ; 44c3: c4
    !byte %....#...                                                   ; 44c4: 08
    !byte %...#....                                                   ; 44c5: 10
    !byte %...#....                                                   ; 44c6: 10
ground_fill_2x2_top_right
    !byte %...#....                                                   ; 44c7: 10
    !byte %...#....                                                   ; 44c8: 10
    !byte %..#.....                                                   ; 44c9: 20
    !byte %##......                                                   ; 44ca: c0
    !byte %......##                                                   ; 44cb: 03
    !byte %.....#..                                                   ; 44cc: 04
    !byte %....#...                                                   ; 44cd: 08
    !byte %....#...                                                   ; 44ce: 08
ground_fill_2x2_bottom_left
    !byte %...#....                                                   ; 44cf: 10
    !byte %...#....                                                   ; 44d0: 10
    !byte %..#.....                                                   ; 44d1: 20
    !byte %##......                                                   ; 44d2: c0
    !byte %......##                                                   ; 44d3: 03
    !byte %.....#..                                                   ; 44d4: 04
    !byte %....#...                                                   ; 44d5: 08
    !byte %....#...                                                   ; 44d6: 08
ground_fill_2x2_bottom_right
    !byte %....#...                                                   ; 44d7: 08
    !byte %....#...                                                   ; 44d8: 08
    !byte %...#....                                                   ; 44d9: 10
    !byte %..#...##                                                   ; 44da: 23
    !byte %##...#..                                                   ; 44db: c4
    !byte %....#...                                                   ; 44dc: 08
    !byte %...#....                                                   ; 44dd: 10
    !byte %...#....                                                   ; 44de: 10
sprite_data
pydis_end

; Automatically generated labels:
;     l0a75
!if (<envelope1) != $65 {
    !error "Assertion failed: <envelope1 == $65"
}
!if (<envelope2) != $99 {
    !error "Assertion failed: <envelope2 == $99"
}
!if (<envelope3) != $7b {
    !error "Assertion failed: <envelope3 == $7b"
}
!if (<ground_fill_2x2_top_left) != $bf {
    !error "Assertion failed: <ground_fill_2x2_top_left == $bf"
}
!if (<sound1) != $73 {
    !error "Assertion failed: <sound1 == $73"
}
!if (<sound2) != $b7 {
    !error "Assertion failed: <sound2 == $b7"
}
!if (<sound3) != $af {
    !error "Assertion failed: <sound3 == $af"
}
!if (<sound4) != $a7 {
    !error "Assertion failed: <sound4 == $a7"
}
!if (<sound5) != $91 {
    !error "Assertion failed: <sound5 == $91"
}
!if (<sound6) != $89 {
    !error "Assertion failed: <sound6 == $89"
}
!if (>envelope1) != $44 {
    !error "Assertion failed: >envelope1 == $44"
}
!if (>envelope2) != $44 {
    !error "Assertion failed: >envelope2 == $44"
}
!if (>envelope3) != $44 {
    !error "Assertion failed: >envelope3 == $44"
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
!if (>sound5) != $44 {
    !error "Assertion failed: >sound5 == $44"
}
!if (>sound6) != $44 {
    !error "Assertion failed: >sound6 == $44"
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
!if (fruit_fall_sideways_animation1 - fruit_animation_base) != $04 {
    !error "Assertion failed: fruit_fall_sideways_animation1 - fruit_animation_base == $04"
}
!if (fruit_fall_sideways_animation2 - fruit_animation_base) != $13 {
    !error "Assertion failed: fruit_fall_sideways_animation2 - fruit_animation_base == $13"
}
!if (fruit_fall_straight_down_animation - fruit_animation_base) != $1a {
    !error "Assertion failed: fruit_fall_straight_down_animation - fruit_animation_base == $1a"
}
!if (fruit_initial_idle_animation - fruit_animation_base) != $01 {
    !error "Assertion failed: fruit_initial_idle_animation - fruit_animation_base == $01"
}
!if (fruit_sideways_animation - fruit_animation_base) != $10 {
    !error "Assertion failed: fruit_sideways_animation - fruit_animation_base == $10"
}
!if (fruit_stopped_animation - fruit_animation_base) != $0d {
    !error "Assertion failed: fruit_stopped_animation - fruit_animation_base == $0d"
}
!if (game_area_height_cells) != $18 {
    !error "Assertion failed: game_area_height_cells == $18"
}
!if (game_area_width_cells) != $28 {
    !error "Assertion failed: game_area_width_cells == $28"
}
!if (level_specific_initialisation) != $3af3 {
    !error "Assertion failed: level_specific_initialisation == $3af3"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b07 {
    !error "Assertion failed: level_specific_update == $3b07"
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
!if (object_collided_left_wall) != $01 {
    !error "Assertion failed: object_collided_left_wall == $01"
}
!if (object_collided_right_wall) != $04 {
    !error "Assertion failed: object_collided_right_wall == $04"
}
!if (object_direction + objectid_rabbit) != $09c1 {
    !error "Assertion failed: object_direction + objectid_rabbit == $09c1"
}
!if (object_erase_type + objectid_rail_rope_end) != $38af {
    !error "Assertion failed: object_erase_type + objectid_rail_rope_end == $38af"
}
!if (object_spriteid + objectid_fruit) != $09aa {
    !error "Assertion failed: object_spriteid + objectid_fruit == $09aa"
}
!if (object_spriteid + objectid_rabbit) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_rabbit == $09ab"
}
!if (object_spriteid + objectid_rail_rope_end) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_rail_rope_end == $09ab"
}
!if (object_x_high + objectid_fruit) != $0968 {
    !error "Assertion failed: object_x_high + objectid_fruit == $0968"
}
!if (object_x_low + objectid_fruit) != $0952 {
    !error "Assertion failed: object_x_low + objectid_fruit == $0952"
}
!if (object_x_low + objectid_rabbit) != $0953 {
    !error "Assertion failed: object_x_low + objectid_rabbit == $0953"
}
!if (object_y_high + objectid_fruit) != $0994 {
    !error "Assertion failed: object_y_high + objectid_fruit == $0994"
}
!if (object_y_low + objectid_fruit) != $097e {
    !error "Assertion failed: object_y_low + objectid_fruit == $097e"
}
!if (object_y_low + objectid_rabbit) != $097f {
    !error "Assertion failed: object_y_low + objectid_rabbit == $097f"
}
!if (objectid_fruit) != $02 {
    !error "Assertion failed: objectid_fruit == $02"
}
!if (objectid_player) != $00 {
    !error "Assertion failed: objectid_player == $00"
}
!if (objectid_rabbit) != $03 {
    !error "Assertion failed: objectid_rabbit == $03"
}
!if (objectid_rail_rope_end) != $03 {
    !error "Assertion failed: objectid_rail_rope_end == $03"
}
!if (objectid_spell) != $05 {
    !error "Assertion failed: objectid_spell == $05"
}
!if (rabbit_push_sprites - rabbit_sprites_base) != $08 {
    !error "Assertion failed: rabbit_push_sprites - rabbit_sprites_base == $08"
}
!if (rabbit_sit_sprites  - rabbit_sprites_base) != $06 {
    !error "Assertion failed: rabbit_sit_sprites  - rabbit_sprites_base == $06"
}
!if (rabbit_sit_sprites - rabbit_sprites_base) != $06 {
    !error "Assertion failed: rabbit_sit_sprites - rabbit_sprites_base == $06"
}
!if (rabbit_walk_sprites - rabbit_sprites_base) != $01 {
    !error "Assertion failed: rabbit_walk_sprites - rabbit_sprites_base == $01"
}
!if (room_0_data) != $3b14 {
    !error "Assertion failed: room_0_data == $3b14"
}
!if (room_1_data) != $3d4b {
    !error "Assertion failed: room_1_data == $3d4b"
}
!if (room_2_data) != $3e31 {
    !error "Assertion failed: room_2_data == $3e31"
}
!if (room_3_data) != $400a {
    !error "Assertion failed: room_3_data == $400a"
}
!if (sprite_data - level_data) != $0a0a {
    !error "Assertion failed: sprite_data - level_data == $0a0a"
}
!if (spriteid_boulder) != $ce {
    !error "Assertion failed: spriteid_boulder == $ce"
}
!if (spriteid_cache1) != $cb {
    !error "Assertion failed: spriteid_cache1 == $cb"
}
!if (spriteid_cache2) != $cd {
    !error "Assertion failed: spriteid_cache2 == $cd"
}
!if (spriteid_fruit) != $d0 {
    !error "Assertion failed: spriteid_fruit == $d0"
}
!if (spriteid_horizontal_rail) != $c8 {
    !error "Assertion failed: spriteid_horizontal_rail == $c8"
}
!if (spriteid_icodata_monkey) != $06 {
    !error "Assertion failed: spriteid_icodata_monkey == $06"
}
!if (spriteid_leaf) != $d6 {
    !error "Assertion failed: spriteid_leaf == $d6"
}
!if (spriteid_long_rope_end) != $cc {
    !error "Assertion failed: spriteid_long_rope_end == $cc"
}
!if (spriteid_one_pixel_masked_out) != $00 {
    !error "Assertion failed: spriteid_one_pixel_masked_out == $00"
}
!if (spriteid_rabbit_push) != $db {
    !error "Assertion failed: spriteid_rabbit_push == $db"
}
!if (spriteid_rabbit_sit) != $da {
    !error "Assertion failed: spriteid_rabbit_sit == $da"
}
!if (spriteid_rabbit_walk_1) != $d7 {
    !error "Assertion failed: spriteid_rabbit_walk_1 == $d7"
}
!if (spriteid_rabbit_walk_2) != $d8 {
    !error "Assertion failed: spriteid_rabbit_walk_2 == $d8"
}
!if (spriteid_rabbit_walk_3) != $d9 {
    !error "Assertion failed: spriteid_rabbit_walk_3 == $d9"
}
!if (spriteid_rail_left_corner) != $c9 {
    !error "Assertion failed: spriteid_rail_left_corner == $c9"
}
!if (spriteid_rail_right_corner) != $ca {
    !error "Assertion failed: spriteid_rail_right_corner == $ca"
}
!if (spriteid_stalk_bottom) != $d3 {
    !error "Assertion failed: spriteid_stalk_bottom == $d3"
}
!if (spriteid_stalk_middle) != $d2 {
    !error "Assertion failed: spriteid_stalk_middle == $d2"
}
!if (spriteid_stalk_top) != $d1 {
    !error "Assertion failed: spriteid_stalk_top == $d1"
}
!if (spriteid_table) != $cf {
    !error "Assertion failed: spriteid_table == $cf"
}
!if (spriteid_way_out) != $d5 {
    !error "Assertion failed: spriteid_way_out == $d5"
}
