; *************************************************************************************
;
; Level L: 'WHIP-IT'
;
; Save game variables:
;
;     save_game_level_l_got_whip_progress                        ($0a39):
;               0: untouched
;              1+: using whip
;             $ff: got whip
;
;     save_game_level_l_dog_x                                    ($0a3a):
;             pixel X position of the dog
;
;     save_game_level_l_got_frog_progress                        ($0a3b):
;               0: untouched
;              1+: using frog
;             $ff: got frog
;
;     save_game_level_l_baby_animation                           ($0a3c):
;               0: untouched
;              1+: animation for baby arms
;
;     save_game_level_l_partition_y                              ($0a3d):
;              pixel Y position of the partition
;
;     save_game_level_l_frog_dir:                                ($0a3e):
;               1: looking right
;             $ff: looking left
;
; Solution:
;
;   1. move to the room to the left and retrieve the whip from the ledge
;   2. stand near the dog in the initial room and use the whip to repeatedly
;      send the dog backwards until the rope above is clear to use
;   3. climb the rope and enter the room to the right
;   4. descend halfway down the rope to the left and jump onto the ledge
;           (the frog jumps to the right)
;   5. as the cat jump to the right hand ledge and collect the frog
;   6. return two rooms to the left and stand under the 'speak here' sign
;   7. use the frog to cause the partition to rise.
;   8. collect the spell in the room to the left
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
objectid_baby_arms                    = 3
objectid_dog                          = 2
objectid_dog_tail                     = 3
objectid_end_of_partition             = 6
objectid_fire1                        = 3
objectid_fire2                        = 4
objectid_frog                         = 2
objectid_old_player                   = 11
objectid_old_player_accessory         = 12
objectid_partition                    = 5
objectid_player                       = 0
objectid_player_accessory             = 1
objectid_rope_frayed_end              = 4
objectid_sparkles                     = 2
objectid_whip                         = 2
opcode_jmp                            = 76
sprite_op_flags_copy_screen           = 1
sprite_op_flags_erase_to_bg_colour    = 2
sprite_op_flags_erase_to_fg_colour    = 4
sprite_op_flags_normal                = 0
spriteid_arm1                         = 235
spriteid_arm2                         = 236
spriteid_arm3                         = 237
spriteid_arm4                         = 238
spriteid_baby1                        = 232
spriteid_baby2                        = 233
spriteid_baby3                        = 234
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
spriteid_dog                          = 210
spriteid_dog_cower1                   = 212
spriteid_dog_cower2                   = 213
spriteid_dog_raised                   = 211
spriteid_erase_1                      = 201
spriteid_erase_2                      = 202
spriteid_erase_3                      = 214
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
spriteid_frog                         = 222
spriteid_frog_leap1                   = 239
spriteid_frog_leap2                   = 240
spriteid_frog_menu_item               = 221
spriteid_frog_speaking                = 223
spriteid_horizontal_short_rope        = 227
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
spriteid_partition                    = 230
spriteid_partition_end                = 231
spriteid_pointer_hand                 = 29
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
spriteid_speak_here_sign              = 224
spriteid_tail1                        = 215
spriteid_tail2                        = 216
spriteid_tail3                        = 217
spriteid_tail4                        = 218
spriteid_tail5                        = 219
spriteid_tail6                        = 220
spriteid_top_left_hook                = 226
spriteid_top_right_hook               = 225
spriteid_vertical_rope                = 228
spriteid_vertical_rope_frayed_end     = 229
spriteid_whip_1                       = 203
spriteid_whip_2                       = 204
spriteid_whip_3                       = 205
spriteid_whip_4                       = 206
spriteid_whip_5                       = 207
spriteid_whip_hook1                   = 208
spriteid_whip_hook2                   = 209
spriteid_whip_menu_item               = 200
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
remember_a                                          = $70
room_exit_direction                                 = $70
l007a                                               = $7a
l007b                                               = $7b
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
save_game_level_l_got_whip_progress                 = $0a39
save_game_level_l_dog_x                             = $0a3a
save_game_level_l_got_frog_progress                 = $0a3b
save_game_level_l_baby_animation                    = $0a3c
save_game_level_l_partition_y                       = $0a3d
save_game_level_l_frog_dir                          = $0a3e
dog_animation                                       = $0a6f
dog_animation_step                                  = $0a70
dog_tail_animation_step                             = $0a71
baby_animation_step                                 = $0a72
frog_x                                              = $0a73
frog_y                                              = $0a74
frog_animation                                      = $0a75
frog_animation_step                                 = $0a76
delay_before_ribbit                                 = $0a77
dog_animation_delay                                 = $0a78
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
    !word sprite_data - level_data                                    ; 3ad5: bf 09                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: ef 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 1f 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
initial_room_index
    !byte 2                                                           ; 3add: 02
initial_room_index_cheat
    !byte 1                                                           ; 3ade: 01
level_room_data_table
    !word room_0_data                                                 ; 3adf: 47 3b                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: fe 3b
    !word room_2_data                                                 ; 3ae3: 1b 3f
    !word room_3_data                                                 ; 3ae5: 40 41

; *************************************************************************************
; 'WHIP-IT[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $9c, $83, $82, $9b, $e6, $82, $9f, $c6                      ; 3ae7: 9c 83 82...

; *************************************************************************************
; 
; Level initialisation
; 
; This is called whenever a new room is entered.
; 
; *************************************************************************************
; check for level change (branch if not)
level_specific_initialisation
    lda current_level                                                 ; 3aef: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3af1: c5 51
    beq no_frog                                                       ; 3af3: f0 21
    lda developer_flags                                               ; 3af5: ad 03 11
    bpl developer_mode_inactive                                       ; 3af8: 10 08
; in developer mode. get whip and frog
    lda #$ff                                                          ; 3afa: a9 ff
    sta save_game_level_l_got_whip_progress                           ; 3afc: 8d 39 0a
    sta save_game_level_l_got_frog_progress                           ; 3aff: 8d 3b 0a
developer_mode_inactive
    lda save_game_level_l_got_whip_progress                           ; 3b02: ad 39 0a
    beq no_whip                                                       ; 3b05: f0 05
    lda #spriteid_whip_menu_item                                      ; 3b07: a9 c8
    jsr find_or_create_menu_slot_for_A                                ; 3b09: 20 bd 2b
no_whip
    lda save_game_level_l_got_frog_progress                           ; 3b0c: ad 3b 0a
    beq no_frog                                                       ; 3b0f: f0 05
    lda #spriteid_frog_menu_item                                      ; 3b11: a9 dd
    jsr find_or_create_menu_slot_for_A                                ; 3b13: 20 bd 2b
; set rock tile
no_frog
    lda #<ground_fill_2x2_top_left                                    ; 3b16: a9 74
    sta source_sprite_memory_low                                      ; 3b18: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3b1a: a9 44
    sta source_sprite_memory_high                                     ; 3b1c: 85 41
    rts                                                               ; 3b1e: 60

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
    jsr update_whip                                                   ; 3b1f: 20 5f 3e
    jsr room_2_update_handler                                         ; 3b22: 20 d7 3f
    jsr update_frog_speaking                                          ; 3b25: 20 61 43
    jsr room_1_update_handler                                         ; 3b28: 20 bb 3c
    jsr room_3_update_handler                                         ; 3b2b: 20 d8 41
    jsr room_0_update_handler                                         ; 3b2e: 20 df 3b
    rts                                                               ; 3b31: 60

draw_top_and_bottom_rows_of_rock
    ldx #0                                                            ; 3b32: a2 00
    ldy #0                                                            ; 3b34: a0 00
    lda #$ff                                                          ; 3b36: a9 ff
    sta width_in_cells                                                ; 3b38: 85 3c
    lda #2                                                            ; 3b3a: a9 02
    sta height_in_cells                                               ; 3b3c: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b3e: 20 bb 1a
    ldy #$16                                                          ; 3b41: a0 16
    jmp copy_rectangle_of_memory_to_screen                            ; 3b43: 4c bb 1a

remember_y
    !byte 0                                                           ; 3b46: 00
; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 20                                                          ; 3b47: 14                      ; initial player X cell
    !byte 22                                                          ; 3b48: 16                      ; initial player Y cell

; ########################################
; ########################################
; ###                ###               ###
; ###                ###               ###
; ###                ###               ###
; ###                ###               ###
; ###                ###               ###
; ########################################
; ########################################
; ###      |                           ###
; ###      |                           ###
; ###      |                           ###
; ###      |                           ###
; ###      |          S             #S####
; ###      |                        ######
; ######   |
; ######   |
; ###      |
; ###      |
; ###      |
; ###                               ######
; ###                 P          #########
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_0_code
    jsr draw_top_and_bottom_rows_of_rock                              ; 3b49: 20 32 3b
; draw 3x20 rectangle at (0,2)
    ldy #2                                                            ; 3b4c: a0 02
    lda #3                                                            ; 3b4e: a9 03
    sta width_in_cells                                                ; 3b50: 85 3c
    lda #$14                                                          ; 3b52: a9 14
    sta height_in_cells                                               ; 3b54: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b56: 20 bb 1a
; draw 3x13 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3b59: a2 25
    lda #$0d                                                          ; 3b5b: a9 0d
    sta height_in_cells                                               ; 3b5d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b5f: 20 bb 1a
; draw 3x5 rectangle at (19,2)
    ldx #$13                                                          ; 3b62: a2 13
    lda #5                                                            ; 3b64: a9 05
    sta height_in_cells                                               ; 3b66: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b68: 20 bb 1a
; draw 34x2 rectangle at (3,7)
    ldx #3                                                            ; 3b6b: a2 03
    ldy #7                                                            ; 3b6d: a0 07
    lda #$22 ; '"'                                                    ; 3b6f: a9 22
    sta width_in_cells                                                ; 3b71: 85 3c
    lda #2                                                            ; 3b73: a9 02
    sta height_in_cells                                               ; 3b75: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b77: 20 bb 1a
; draw 3x2 rectangle at (3,15)
    ldy #$0f                                                          ; 3b7a: a0 0f
    lda #3                                                            ; 3b7c: a9 03
    sta width_in_cells                                                ; 3b7e: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b80: 20 bb 1a
; draw 3x2 rectangle at (34,13)
    ldx #$22 ; '"'                                                    ; 3b83: a2 22
    ldy #$0d                                                          ; 3b85: a0 0d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b87: 20 bb 1a
; draw 6x2 rectangle at (34,20)
    ldy #$14                                                          ; 3b8a: a0 14
    lda #6                                                            ; 3b8c: a9 06
    sta width_in_cells                                                ; 3b8e: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b90: 20 bb 1a
; draw 3x1 rectangle at (31,21)
    ldx #$1f                                                          ; 3b93: a2 1f
    iny                                                               ; 3b95: c8
    lda #3                                                            ; 3b96: a9 03
    sta width_in_cells                                                ; 3b98: 85 3c
    dec height_in_cells                                               ; 3b9a: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b9c: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3b9f: 20 90 1b
; draw ball at (20,13)
    ldx #$14                                                          ; 3ba2: a2 14
    ldy #$0d                                                          ; 3ba4: a0 0d
    lda #spriteid_ball                                                ; 3ba6: a9 3b
    jsr draw_sprite_a_at_cell_xy                                      ; 3ba8: 20 4c 1f
    lda #3                                                            ; 3bab: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3bad: 20 bb 1e
; draw rope at (9,9) length 11
    ldx #9                                                            ; 3bb0: a2 09
    ldy #9                                                            ; 3bb2: a0 09
    lda #$0b                                                          ; 3bb4: a9 0b
    jsr draw_rope                                                     ; 3bb6: 20 b9 1d
; draw frog at (35,13)
    ldx #$23 ; '#'                                                    ; 3bb9: a2 23
    lda #8                                                            ; 3bbb: a9 08
    sta temp_sprite_x_offset                                          ; 3bbd: 85 3a
    ldy #$0d                                                          ; 3bbf: a0 0d
    lda #$f9                                                          ; 3bc1: a9 f9
    sta temp_sprite_y_offset                                          ; 3bc3: 85 3b
    lda #$ff                                                          ; 3bc5: a9 ff
    sta sprite_reflect_flag                                           ; 3bc7: 85 1d
    lda #spriteid_frog                                                ; 3bc9: a9 de
    jsr draw_sprite_a_at_cell_xy                                      ; 3bcb: 20 4c 1f
    jsr start_room                                                    ; 3bce: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 3bd1: 20 da 12
    and #exit_room_right                                              ; 3bd4: 29 04
    beq room_0_game_update_loop                                       ; 3bd6: f0 f9
; right of room 0 is room 1
    ldx #1                                                            ; 3bd8: a2 01
goto_new_room
    ldy current_level                                                 ; 3bda: a4 31
    jmp initialise_level_and_room                                     ; 3bdc: 4c 40 11

room_0_update_handler
    lda #0                                                            ; 3bdf: a9 00
    sta currently_updating_logic_for_room_index                       ; 3be1: 8d ba 1a
    ldx #$14                                                          ; 3be4: a2 14
    ldy #$0d                                                          ; 3be6: a0 0d
    lda #objectid_fire1                                               ; 3be8: a9 03
    jsr update_brazier_and_fire                                       ; 3bea: 20 88 19
    inx                                                               ; 3bed: e8
    lda #objectid_fire2                                               ; 3bee: a9 04
    jsr update_brazier_and_fire                                       ; 3bf0: 20 88 19
    ldx #4                                                            ; 3bf3: a2 04
    stx temp_sprite_x_offset                                          ; 3bf5: 86 3a
    ldy #$0f                                                          ; 3bf7: a0 0f
    lda #objectid_sparkles                                            ; 3bf9: a9 02
    jmp update_level_completion                                       ; 3bfb: 4c 10 1a

; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 26                                                          ; 3bfe: 1a                      ; initial player X cell
    !byte 22                                                          ; 3bff: 16                      ; initial player Y cell

; ########################################
; ########################################
; ###                ###               ###
; ###                ###               ###
; ###                ###               ###
; ###                ###               ###
; ###                ###               ###
; ### ########### ########################
; ### ########### ########################
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      S                    |      S##
; ###                           |      ###
; ###                           |      ###
;                               |   ######
;                               |   ######
;                               |
;                               |
;                               |
; ###################
; ######################    P
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_1_code
    jsr draw_top_and_bottom_rows_of_rock                              ; 3c00: 20 32 3b
; draw 3x13 rectangle at (0,2)
    ldy #2                                                            ; 3c03: a0 02
    lda #3                                                            ; 3c05: a9 03
    sta width_in_cells                                                ; 3c07: 85 3c
    lda #$0d                                                          ; 3c09: a9 0d
    sta height_in_cells                                               ; 3c0b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c0d: 20 bb 1a
; draw 3x15 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3c10: a2 25
    lda #$0f                                                          ; 3c12: a9 0f
    sta height_in_cells                                               ; 3c14: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c16: 20 bb 1a
; draw 3x5 rectangle at (19,2)
    ldx #$13                                                          ; 3c19: a2 13
    lda #5                                                            ; 3c1b: a9 05
    sta height_in_cells                                               ; 3c1d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c1f: 20 bb 1a
; draw 11x2 rectangle at (4,7)
    ldx #4                                                            ; 3c22: a2 04
    ldy #7                                                            ; 3c24: a0 07
    lda #$0b                                                          ; 3c26: a9 0b
    sta width_in_cells                                                ; 3c28: 85 3c
    lda #2                                                            ; 3c2a: a9 02
    sta height_in_cells                                               ; 3c2c: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c2e: 20 bb 1a
; draw 21x2 rectangle at (16,7)
    ldx #$10                                                          ; 3c31: a2 10
    lda #$15                                                          ; 3c33: a9 15
    sta width_in_cells                                                ; 3c35: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3c37: 20 bb 1a
; draw 3x2 rectangle at (34,15)
    ldx #$22 ; '"'                                                    ; 3c3a: a2 22
    ldy #$0f                                                          ; 3c3c: a0 0f
    lda #3                                                            ; 3c3e: a9 03
    sta width_in_cells                                                ; 3c40: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3c42: 20 bb 1a
; draw 19x2 rectangle at (0,20)
    ldx #0                                                            ; 3c45: a2 00
    ldy #$14                                                          ; 3c47: a0 14
    lda #$13                                                          ; 3c49: a9 13
    sta width_in_cells                                                ; 3c4b: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3c4d: 20 bb 1a
; draw 3x1 rectangle at (19,21)
    ldx #$13                                                          ; 3c50: a2 13
    iny                                                               ; 3c52: c8
    lda #3                                                            ; 3c53: a9 03
    sta width_in_cells                                                ; 3c55: 85 3c
    dec height_in_cells                                               ; 3c57: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c59: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3c5c: 20 90 1b
; draw whip hook2 at (37,12)
    ldx #$25 ; '%'                                                    ; 3c5f: a2 25
    ldy #$0c                                                          ; 3c61: a0 0c
    lda #spriteid_whip_hook2                                          ; 3c63: a9 d1
    jsr draw_sprite_a_at_cell_xy                                      ; 3c65: 20 4c 1f
; draw rope at (30,9) length 11
    ldx #$1e                                                          ; 3c68: a2 1e
    ldy #9                                                            ; 3c6a: a0 09
    lda #$0b                                                          ; 3c6c: a9 0b
    jsr draw_rope                                                     ; 3c6e: 20 b9 1d
; draw rope at (9,9) length 4
    ldx #9                                                            ; 3c71: a2 09
    lda #4                                                            ; 3c73: a9 04
    jsr draw_rope                                                     ; 3c75: 20 b9 1d
; draw speak here sign at (9,12)
    ldy #$0c                                                          ; 3c78: a0 0c
    lda #spriteid_speak_here_sign                                     ; 3c7a: a9 e0
    jsr draw_sprite_a_at_cell_xy                                      ; 3c7c: 20 4c 1f
    jsr start_room                                                    ; 3c7f: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 3c82: 20 da 12
    sta room_exit_direction                                           ; 3c85: 85 70
    and #exit_room_left                                               ; 3c87: 29 01
    beq room_1_check_right_exit                                       ; 3c89: f0 05
    ldx #0                                                            ; 3c8b: a2 00
    jmp goto_new_room                                                 ; 3c8d: 4c da 3b

room_1_check_right_exit
    lda room_exit_direction                                           ; 3c90: a5 70
    and #exit_room_right                                              ; 3c92: 29 04
    beq room_1_game_update_loop                                       ; 3c94: f0 ec
    ldx #2                                                            ; 3c96: a2 02
    jmp goto_new_room                                                 ; 3c98: 4c da 3b

baby_arm_animations
    !byte 0                                                           ; 3c9b: 00
baby_arm_static_animation
    !byte spriteid_arm2,             0                                ; 3c9c: ec 00
    !byte $ff                                                         ; 3c9e: ff
baby_arm_pre_pulling_animation
    !byte spriteid_arm2,             0                                ; 3c9f: ec 00
    !byte spriteid_arm2,             0                                ; 3ca1: ec 00
    !byte spriteid_arm2,             0                                ; 3ca3: ec 00
    !byte spriteid_arm2,             0                                ; 3ca5: ec 00
    !byte spriteid_arm2,             0                                ; 3ca7: ec 00
    !byte spriteid_arm2,             0                                ; 3ca9: ec 00
    !byte spriteid_arm2,             0                                ; 3cab: ec 00
    !byte spriteid_arm2,             0                                ; 3cad: ec 00
    !byte $ff                                                         ; 3caf: ff
baby_arm_pulling_rope_animation
    !byte spriteid_arm3,             0                                ; 3cb0: ed 00
    !byte spriteid_arm3,             0                                ; 3cb2: ed 00
    !byte spriteid_arm2,           $fc                                ; 3cb4: ec fc
    !byte spriteid_arm4,           $fc                                ; 3cb6: ee fc
    !byte spriteid_arm4,             0                                ; 3cb8: ee 00
    !byte $ff                                                         ; 3cba: ff

; check for first update in room (branch if so)
room_1_update_handler
    lda update_room_first_update_flag                                 ; 3cbb: ad 2b 13
    bne initialise_room_1                                             ; 3cbe: d0 03
    jmp update_room_1                                                 ; 3cc0: 4c 83 3d

; check for level change (branch if not)
initialise_room_1
    lda current_level                                                 ; 3cc3: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3cc5: c5 51
    beq only_room_changed                                             ; 3cc7: f0 1d
    ldy save_game_level_l_baby_animation                              ; 3cc9: ac 3c 0a
    bne check_partition_open_or_closed                                ; 3ccc: d0 07
    ldy #1                                                            ; 3cce: a0 01
    lda #$78 ; 'x'                                                    ; 3cd0: a9 78
    sta save_game_level_l_partition_y                                 ; 3cd2: 8d 3d 0a
check_partition_open_or_closed
    cpy #1                                                            ; 3cd5: c0 01
    beq store_baby_animation                                          ; 3cd7: f0 07
    ldy #1                                                            ; 3cd9: a0 01
    lda #$50 ; 'P'                                                    ; 3cdb: a9 50
    sta save_game_level_l_partition_y                                 ; 3cdd: 8d 3d 0a
store_baby_animation
    sty save_game_level_l_baby_animation                              ; 3ce0: 8c 3c 0a
    sty baby_animation_step                                           ; 3ce3: 8c 72 0a
only_room_changed
    lda desired_room_index                                            ; 3ce6: a5 30
    cmp #1                                                            ; 3ce8: c9 01
    beq initialise_room_1_envelope_and_rope                           ; 3cea: f0 03
    jmp update_partition_and_rope_local                               ; 3cec: 4c 80 3d

initialise_room_1_envelope_and_rope
    ldx #<envelope1                                                   ; 3cef: a2 f6
    ldy #>envelope1                                                   ; 3cf1: a0 43
    jsr define_envelope                                               ; 3cf3: 20 5e 39
    ldx #3                                                            ; 3cf6: a2 03
    ldy #2                                                            ; 3cf8: a0 02
    lda #spriteid_top_left_hook                                       ; 3cfa: a9 e2
    jsr draw_sprite_a_at_cell_xy                                      ; 3cfc: 20 4c 1f
    inx                                                               ; 3cff: e8
    inx                                                               ; 3d00: e8
    lda #spriteid_horizontal_short_rope                               ; 3d01: a9 e3
draw_rope_loop0
    jsr draw_sprite_a_at_cell_xy                                      ; 3d03: 20 4c 1f
    inx                                                               ; 3d06: e8
    cpx #$0e                                                          ; 3d07: e0 0e
    bcc draw_rope_loop0                                               ; 3d09: 90 f8
    inx                                                               ; 3d0b: e8
    lda #spriteid_top_right_hook                                      ; 3d0c: a9 e1
    jsr draw_sprite_a_at_cell_xy                                      ; 3d0e: 20 4c 1f
    lda #$78 ; 'x'                                                    ; 3d11: a9 78
    sec                                                               ; 3d13: 38
    sbc save_game_level_l_partition_y                                 ; 3d14: ed 3d 0a
    clc                                                               ; 3d17: 18
    adc #$4c ; 'L'                                                    ; 3d18: 69 4c
    lsr                                                               ; 3d1a: 4a
    lsr                                                               ; 3d1b: 4a
    lsr                                                               ; 3d1c: 4a
    tay                                                               ; 3d1d: a8
    dey                                                               ; 3d1e: 88
    lda #spriteid_vertical_rope                                       ; 3d1f: a9 e4
draw_rope_loop1
    jsr draw_sprite_a_at_cell_xy                                      ; 3d21: 20 4c 1f
    dey                                                               ; 3d24: 88
    cpy #3                                                            ; 3d25: c0 03
    bcs draw_rope_loop1                                               ; 3d27: b0 f8
    lda #4                                                            ; 3d29: a9 04
    jsr set_object_position_from_cell_xy                              ; 3d2b: 20 5d 1f
    lda #spriteid_vertical_rope_frayed_end                            ; 3d2e: a9 e5
    sta object_spriteid + objectid_rope_frayed_end                    ; 3d30: 8d ac 09
    lda save_game_level_l_partition_y                                 ; 3d33: ad 3d 0a
    clc                                                               ; 3d36: 18
    adc #4                                                            ; 3d37: 69 04
    lsr                                                               ; 3d39: 4a
    lsr                                                               ; 3d3a: 4a
    lsr                                                               ; 3d3b: 4a
    tay                                                               ; 3d3c: a8
    dey                                                               ; 3d3d: 88
    ldx #3                                                            ; 3d3e: a2 03
    lda #spriteid_vertical_rope                                       ; 3d40: a9 e4
draw_rope_loop2
    jsr draw_sprite_a_at_cell_xy                                      ; 3d42: 20 4c 1f
    dey                                                               ; 3d45: 88
    cpy #3                                                            ; 3d46: c0 03
    bcs draw_rope_loop2                                               ; 3d48: b0 f8
    lda #objectid_partition                                           ; 3d4a: a9 05
    jsr set_object_position_from_cell_xy                              ; 3d4c: 20 5d 1f
    lda #objectid_end_of_partition                                    ; 3d4f: a9 06
    jsr set_object_position_from_cell_xy                              ; 3d51: 20 5d 1f
    lda #spriteid_partition                                           ; 3d54: a9 e6
    sta object_spriteid + objectid_partition                          ; 3d56: 8d ad 09
    lda #$c0                                                          ; 3d59: a9 c0
    sta object_z_order + objectid_partition                           ; 3d5b: 8d c7 38
    lda #spriteid_partition_end                                       ; 3d5e: a9 e7
    sta object_spriteid + objectid_end_of_partition                   ; 3d60: 8d ae 09
    lda #spriteid_erase_3                                             ; 3d63: a9 d6
    sta object_erase_type + objectid_end_of_partition                 ; 3d65: 8d b2 38
    ldx #$10                                                          ; 3d68: a2 10
    ldy #7                                                            ; 3d6a: a0 07
    lda #spriteid_baby3                                               ; 3d6c: a9 ea
    jsr draw_sprite_a_at_cell_xy                                      ; 3d6e: 20 4c 1f
    lda #3                                                            ; 3d71: a9 03
    jsr set_object_position_from_cell_xy                              ; 3d73: 20 5d 1f
    lda #spriteid_erase_2                                             ; 3d76: a9 ca
    sta object_erase_type + objectid_baby_arms                        ; 3d78: 8d af 38
    lda #$c0                                                          ; 3d7b: a9 c0
    sta object_z_order + objectid_baby_arms                           ; 3d7d: 8d c5 38
update_partition_and_rope_local
    jmp update_partition_and_rope                                     ; 3d80: 4c 06 3e

update_room_1
    lda baby_animation_step                                           ; 3d83: ad 72 0a
    clc                                                               ; 3d86: 18
    adc #2                                                            ; 3d87: 69 02
    tay                                                               ; 3d89: a8
    lda baby_arm_animations,y                                         ; 3d8a: b9 9b 3c
    cmp #$ff                                                          ; 3d8d: c9 ff
    bne check_baby_animation                                          ; 3d8f: d0 03
    ldy save_game_level_l_baby_animation                              ; 3d91: ac 3c 0a
check_baby_animation
    lda save_game_level_l_baby_animation                              ; 3d94: ad 3c 0a
    cmp #baby_arm_static_animation - baby_arm_animations              ; 3d97: c9 01
    bne after_pre_pulling_goto_pulling_animation                      ; 3d99: d0 27
    lda save_game_level_l_partition_y                                 ; 3d9b: ad 3d 0a
    cmp #$78 ; 'x'                                                    ; 3d9e: c9 78
    bne set_baby_animation_step                                       ; 3da0: d0 42
    lda desired_room_index                                            ; 3da2: a5 30
    cmp #1                                                            ; 3da4: c9 01
    bne set_baby_animation_step                                       ; 3da6: d0 3c
    lda save_game_level_l_got_frog_progress                           ; 3da8: ad 3b 0a
    cmp #1                                                            ; 3dab: c9 01
    bne set_baby_animation_step                                       ; 3dad: d0 35
    lda object_y_low                                                  ; 3daf: ad 7c 09
    cmp #$a0                                                          ; 3db2: c9 a0
    bcs set_baby_animation_step                                       ; 3db4: b0 2e
    cmp #$78 ; 'x'                                                    ; 3db6: c9 78
    bcc set_baby_animation_step                                       ; 3db8: 90 2a
; start pulling animation
    ldy #baby_arm_pre_pulling_animation - baby_arm_animations         ; 3dba: a0 04
    sty save_game_level_l_baby_animation                              ; 3dbc: 8c 3c 0a
    jmp set_baby_animation_step                                       ; 3dbf: 4c e4 3d

after_pre_pulling_goto_pulling_animation
    cmp #baby_arm_pre_pulling_animation - baby_arm_animations         ; 3dc2: c9 04
    bne check_if_we_should_initialise_baby_animation                  ; 3dc4: d0 0d
    cpy save_game_level_l_baby_animation                              ; 3dc6: cc 3c 0a
    bne set_baby_animation_step                                       ; 3dc9: d0 19
    ldy #baby_arm_pulling_rope_animation - baby_arm_animations        ; 3dcb: a0 15
    sty save_game_level_l_baby_animation                              ; 3dcd: 8c 3c 0a
    jmp set_baby_animation_step                                       ; 3dd0: 4c e4 3d

check_if_we_should_initialise_baby_animation
    cpy save_game_level_l_baby_animation                              ; 3dd3: cc 3c 0a
    bne set_baby_animation_step                                       ; 3dd6: d0 0c
    lda save_game_level_l_partition_y                                 ; 3dd8: ad 3d 0a
    cmp #$50 ; 'P'                                                    ; 3ddb: c9 50
    bne set_baby_animation_step                                       ; 3ddd: d0 05
    ldy #baby_arm_static_animation - baby_arm_animations              ; 3ddf: a0 01
    sty save_game_level_l_baby_animation                              ; 3de1: 8c 3c 0a
set_baby_animation_step
    sty baby_animation_step                                           ; 3de4: 8c 72 0a
    iny                                                               ; 3de7: c8
    lda baby_arm_animations,y                                         ; 3de8: b9 9b 3c
    beq update_partition_and_rope                                     ; 3deb: f0 19
    clc                                                               ; 3ded: 18
    adc save_game_level_l_partition_y                                 ; 3dee: 6d 3d 0a
    sta save_game_level_l_partition_y                                 ; 3df1: 8d 3d 0a
    lda desired_room_index                                            ; 3df4: a5 30
    cmp #1                                                            ; 3df6: c9 01
    bne update_partition_and_rope                                     ; 3df8: d0 0c
    lda #spriteid_one_pixel_masked_out                                ; 3dfa: a9 00
    sta object_spriteid_old + objectid_rope_frayed_end                ; 3dfc: 8d b7 09
    ldx #<sound1                                                      ; 3dff: a2 04
    ldy #>sound1                                                      ; 3e01: a0 44
    jsr play_sound_yx                                                 ; 3e03: 20 f6 38
update_partition_and_rope
    lda desired_room_index                                            ; 3e06: a5 30
    cmp #1                                                            ; 3e08: c9 01
    bne return1                                                       ; 3e0a: d0 4d
    ldy baby_animation_step                                           ; 3e0c: ac 72 0a
    lda baby_arm_animations,y                                         ; 3e0f: b9 9b 3c
    sta object_spriteid + objectid_baby_arms                          ; 3e12: 8d ab 09
    lda save_game_level_l_partition_y                                 ; 3e15: ad 3d 0a
    sta object_y_low + objectid_partition                             ; 3e18: 8d 81 09
    sta object_y_low + objectid_end_of_partition                      ; 3e1b: 8d 82 09
    lda #$78 ; 'x'                                                    ; 3e1e: a9 78
    sec                                                               ; 3e20: 38
    sbc save_game_level_l_partition_y                                 ; 3e21: ed 3d 0a
    clc                                                               ; 3e24: 18
    adc #$48 ; 'H'                                                    ; 3e25: 69 48
    sta object_y_low + objectid_rope_frayed_end                       ; 3e27: 8d 80 09
    ldx #3                                                            ; 3e2a: a2 03
    lda save_game_level_l_partition_y                                 ; 3e2c: ad 3d 0a
    lsr                                                               ; 3e2f: 4a
    lsr                                                               ; 3e30: 4a
    lsr                                                               ; 3e31: 4a
    tay                                                               ; 3e32: a8
    lda #1                                                            ; 3e33: a9 01
    sta width_in_cells                                                ; 3e35: 85 3c
    lda #5                                                            ; 3e37: a9 05
    sta height_in_cells                                               ; 3e39: 85 3d
    lda #collision_map_solid_rock                                     ; 3e3b: a9 03
    sta value_to_write_to_collision_map                               ; 3e3d: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e3f: 20 44 1e
    tya                                                               ; 3e42: 98
    clc                                                               ; 3e43: 18
    adc height_in_cells                                               ; 3e44: 65 3d
    tay                                                               ; 3e46: a8
    sta remember_a                                                    ; 3e47: 85 70
    lda #$14                                                          ; 3e49: a9 14
    sec                                                               ; 3e4b: 38
    sbc remember_a                                                    ; 3e4c: e5 70
    beq return1                                                       ; 3e4e: f0 09
    sta height_in_cells                                               ; 3e50: 85 3d
    lda #collision_map_none                                           ; 3e52: a9 00
    sta value_to_write_to_collision_map                               ; 3e54: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e56: 20 44 1e
return1
    rts                                                               ; 3e59: 60

whip_animation_table
    !byte spriteid_whip_2                                             ; 3e5a: cc
    !byte spriteid_whip_3                                             ; 3e5b: cd
    !byte spriteid_whip_4                                             ; 3e5c: ce
    !byte spriteid_whip_5                                             ; 3e5d: cf
    !byte spriteid_whip_1                                             ; 3e5e: cb

; check for first update in room (branch if not)
update_whip
    lda update_room_first_update_flag                                 ; 3e5f: ad 2b 13
    beq not_first_update_whip                                         ; 3e62: f0 4b
; check for level change (branch if not)
    lda current_level                                                 ; 3e64: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3e66: c5 51
    beq new_room_only                                                 ; 3e68: f0 0a
    lda save_game_level_l_got_whip_progress                           ; 3e6a: ad 39 0a
    beq new_room_only                                                 ; 3e6d: f0 05
    lda #$ff                                                          ; 3e6f: a9 ff
    sta save_game_level_l_got_whip_progress                           ; 3e71: 8d 39 0a
new_room_only
    ldx #<envelope2                                                   ; 3e74: a2 0c
    ldy #>envelope2                                                   ; 3e76: a0 44
    jsr define_envelope                                               ; 3e78: 20 5e 39
    lda #spriteid_whip_menu_item                                      ; 3e7b: a9 c8
    sta toolbar_collectable_spriteids+1                               ; 3e7d: 8d e9 2e
    lda #spriteid_whip_1                                              ; 3e80: a9 cb
    sta collectable_spriteids+1                                       ; 3e82: 8d ee 2e
    lda desired_room_index                                            ; 3e85: a5 30
    cmp #1                                                            ; 3e87: c9 01
    bne update_whip_in_hand_local                                     ; 3e89: d0 21
    lda save_game_level_l_got_whip_progress                           ; 3e8b: ad 39 0a
    bne update_whip_in_hand_local                                     ; 3e8e: d0 1c
    ldx #$25 ; '%'                                                    ; 3e90: a2 25
    lda #$fe                                                          ; 3e92: a9 fe
    sta temp_sprite_x_offset                                          ; 3e94: 85 3a
    ldy #$0c                                                          ; 3e96: a0 0c
    lda #objectid_whip                                                ; 3e98: a9 02
    jsr set_object_position_from_cell_xy                              ; 3e9a: 20 5d 1f
    lda #$ff                                                          ; 3e9d: a9 ff
    sta object_direction + objectid_whip                              ; 3e9f: 8d c0 09
    lda #spriteid_erase_1                                             ; 3ea2: a9 c9
    sta object_erase_type + objectid_whip                             ; 3ea4: 8d ae 38
    lda #spriteid_whip_5                                              ; 3ea7: a9 cf
    sta object_spriteid + objectid_whip                               ; 3ea9: 8d aa 09
update_whip_in_hand_local
    jmp update_whip_in_hand                                           ; 3eac: 4c f3 3e

not_first_update_whip
    lda save_game_level_l_got_whip_progress                           ; 3eaf: ad 39 0a
    bne check_if_using_whip                                           ; 3eb2: d0 20
    lda desired_room_index                                            ; 3eb4: a5 30
    cmp #1                                                            ; 3eb6: c9 01
    bne return2                                                       ; 3eb8: d0 60
; not got whip, but we are in room 1. Check for collision with whip
    ldx #objectid_old_player                                          ; 3eba: a2 0b
    ldy #objectid_whip                                                ; 3ebc: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 3ebe: 20 e2 28
    beq return2                                                       ; 3ec1: f0 57
; whip collected
    lda #$ff                                                          ; 3ec3: a9 ff
    sta save_game_level_l_got_whip_progress                           ; 3ec5: 8d 39 0a
    lda #spriteid_whip_menu_item                                      ; 3ec8: a9 c8
    jsr find_or_create_menu_slot_for_A                                ; 3eca: 20 bd 2b
    lda #spriteid_one_pixel_masked_out                                ; 3ecd: a9 00
    sta object_spriteid + objectid_whip                               ; 3ecf: 8d aa 09
    beq return2                                                       ; 3ed2: f0 46
check_if_using_whip
    lda #spriteid_whip_menu_item                                      ; 3ed4: a9 c8
    cmp player_using_object_spriteid                                  ; 3ed6: cd b6 2e
    beq using_whip                                                    ; 3ed9: f0 07
; not using_whip
    lda #$ff                                                          ; 3edb: a9 ff
    sta save_game_level_l_got_whip_progress                           ; 3edd: 8d 39 0a
    bmi update_whip_in_hand                                           ; 3ee0: 30 11                   ; ALWAYS branch

using_whip
    ldy save_game_level_l_got_whip_progress                           ; 3ee2: ac 39 0a
    cpy #4                                                            ; 3ee5: c0 04
    beq update_whip_in_hand                                           ; 3ee7: f0 0a
    cpy #$ff                                                          ; 3ee9: c0 ff
    bne increment_whip_animation                                      ; 3eeb: d0 02
    ldy #0                                                            ; 3eed: a0 00
increment_whip_animation
    iny                                                               ; 3eef: c8
    sty save_game_level_l_got_whip_progress                           ; 3ef0: 8c 39 0a
update_whip_in_hand
    lda whip_animation_table                                          ; 3ef3: ad 5a 3e
    ldy save_game_level_l_got_whip_progress                           ; 3ef6: ac 39 0a
    cpy #$ff                                                          ; 3ef9: c0 ff
    beq got_whip_in_hand_sprite                                       ; 3efb: f0 03
    lda whip_animation_table,y                                        ; 3efd: b9 5a 3e
got_whip_in_hand_sprite
    sta collectable_being_used_spriteids + 1                          ; 3f00: 8d f3 2e
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 3f03: ad 2b 13
    bne return2                                                       ; 3f06: d0 12
    cpy #2                                                            ; 3f08: c0 02
    bne return2                                                       ; 3f0a: d0 0e
    ldx #<sound2                                                      ; 3f0c: a2 22
    ldy #>sound2                                                      ; 3f0e: a0 44
    jsr play_sound_yx                                                 ; 3f10: 20 f6 38
    ldx #<sound3                                                      ; 3f13: a2 1a
    ldy #>sound3                                                      ; 3f15: a0 44
    jsr play_sound_yx                                                 ; 3f17: 20 f6 38
return2
    rts                                                               ; 3f1a: 60

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 20                                                          ; 3f1b: 14                      ; initial player X cell
    !byte 22                                                          ; 3f1c: 16                      ; initial player Y cell

; ########################################
; ########################################
; ###                ###        |
; ###                ###        |
; ###                ###        |
; ###                ###        |
; ###                ###        |
; ###########################   |   ######
; ###########################   |   ######
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                           ###
; ###      |                           ###
; ######   |   ###########################
; ######   |   ###########################
;          |                           ###
;          |                           ###
;          |                           ###
;                                      ###
;                     P                ###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_2_code
    jsr draw_top_and_bottom_rows_of_rock                              ; 3f1d: 20 32 3b
; draw 3x15 rectangle at (0,2)
    ldy #2                                                            ; 3f20: a0 02
    lda #3                                                            ; 3f22: a9 03
    sta width_in_cells                                                ; 3f24: 85 3c
    lda #$0f                                                          ; 3f26: a9 0f
    sta height_in_cells                                               ; 3f28: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f2a: 20 bb 1a
; draw 3x15 rectangle at (37,7)
    ldx #$25 ; '%'                                                    ; 3f2d: a2 25
    ldy #7                                                            ; 3f2f: a0 07
    jsr copy_rectangle_of_memory_to_screen                            ; 3f31: 20 bb 1a
; draw 3x5 rectangle at (19,2)
    ldx #$13                                                          ; 3f34: a2 13
    ldy #2                                                            ; 3f36: a0 02
    lda #5                                                            ; 3f38: a9 05
    sta height_in_cells                                               ; 3f3a: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f3c: 20 bb 1a
; draw 24x2 rectangle at (3,7)
    ldx #3                                                            ; 3f3f: a2 03
    ldy #7                                                            ; 3f41: a0 07
    lda #$18                                                          ; 3f43: a9 18
    sta width_in_cells                                                ; 3f45: 85 3c
    lda #2                                                            ; 3f47: a9 02
    sta height_in_cells                                               ; 3f49: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f4b: 20 bb 1a
; draw 3x2 rectangle at (34,7)
    ldx #$22 ; '"'                                                    ; 3f4e: a2 22
    lda #3                                                            ; 3f50: a9 03
    sta width_in_cells                                                ; 3f52: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3f54: 20 bb 1a
; draw 3x2 rectangle at (3,15)
    ldx #3                                                            ; 3f57: a2 03
    ldy #$0f                                                          ; 3f59: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3f5b: 20 bb 1a
; draw 24x2 rectangle at (13,15)
    ldx #$0d                                                          ; 3f5e: a2 0d
    lda #$18                                                          ; 3f60: a9 18
    sta width_in_cells                                                ; 3f62: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3f64: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3f67: 20 90 1b
; draw rope at (9,9) length 11
    ldx #9                                                            ; 3f6a: a2 09
    ldy #9                                                            ; 3f6c: a0 09
    lda #$0b                                                          ; 3f6e: a9 0b
    jsr draw_rope                                                     ; 3f70: 20 b9 1d
; draw rope at (30,2) length 11
    ldx #$1e                                                          ; 3f73: a2 1e
    ldy #2                                                            ; 3f75: a0 02
    jsr draw_rope                                                     ; 3f77: 20 b9 1d
    jsr start_room                                                    ; 3f7a: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 3f7d: 20 da 12
    sta room_exit_direction                                           ; 3f80: 85 70
    and #exit_room_left                                               ; 3f82: 29 01
    beq room_2_check_right_exit                                       ; 3f84: f0 05
    ldx #1                                                            ; 3f86: a2 01
    jmp goto_new_room                                                 ; 3f88: 4c da 3b

room_2_check_right_exit
    lda room_exit_direction                                           ; 3f8b: a5 70
    and #exit_room_right                                              ; 3f8d: 29 04
    beq room_2_game_update_loop                                       ; 3f8f: f0 ec
    ldx #3                                                            ; 3f91: a2 03
    jmp goto_new_room                                                 ; 3f93: 4c da 3b

dog_animations
    !byte 0                                                           ; 3f96: 00
dog_animation_normal
    !byte spriteid_dog                                                ; 3f97: d2
    !byte   0, $ff,   0                                               ; 3f98: 00 ff 00
dog_animation_cower_in_place
    !byte spriteid_dog_cower1                                         ; 3f9b: d4
    !byte 0, 0, 0                                                     ; 3f9c: 00 00 00
dog_animation_push
    !byte spriteid_dog_raised                                         ; 3f9f: d3
    !byte   0, $ff                                                    ; 3fa0: 00 ff
    !byte spriteid_dog_raised                                         ; 3fa2: d3
    !byte   0, $ff                                                    ; 3fa3: 00 ff
    !byte spriteid_dog_raised                                         ; 3fa5: d3
    !byte   0, $ff                                                    ; 3fa6: 00 ff
    !byte spriteid_dog_raised                                         ; 3fa8: d3
    !byte   0, $ff                                                    ; 3fa9: 00 ff
    !byte spriteid_dog_raised                                         ; 3fab: d3
    !byte   0, $ff                                                    ; 3fac: 00 ff
    !byte spriteid_dog_raised                                         ; 3fae: d3
    !byte   0, $ff                                                    ; 3faf: 00 ff
    !byte spriteid_dog_raised                                         ; 3fb1: d3
    !byte   0, $ff                                                    ; 3fb2: 00 ff
    !byte spriteid_dog_raised                                         ; 3fb4: d3
    !byte   0, $ff,   0                                               ; 3fb5: 00 ff 00
dog_animation_back_up
    !byte spriteid_dog_cower1                                         ; 3fb8: d4
    !byte 0, 0                                                        ; 3fb9: 00 00
    !byte spriteid_dog_cower1                                         ; 3fbb: d4
    !byte 0, 0                                                        ; 3fbc: 00 00
    !byte spriteid_dog_cower1                                         ; 3fbe: d4
    !byte 0, 0                                                        ; 3fbf: 00 00
    !byte spriteid_dog_cower1                                         ; 3fc1: d4
    !byte 0, 0                                                        ; 3fc2: 00 00
    !byte spriteid_dog_cower2                                         ; 3fc4: d5
    !byte 2, 0                                                        ; 3fc5: 02 00
    !byte spriteid_dog_cower2                                         ; 3fc7: d5
    !byte 0, 0                                                        ; 3fc8: 00 00
    !byte spriteid_dog_cower2                                         ; 3fca: d5
    !byte 0, 0                                                        ; 3fcb: 00 00
    !byte spriteid_dog_cower1                                         ; 3fcd: d4
    !byte 2, 0, 0                                                     ; 3fce: 02 00 00
dog_tail_animation
    !byte spriteid_tail1                                              ; 3fd1: d7
    !byte spriteid_tail2                                              ; 3fd2: d8
    !byte spriteid_tail3                                              ; 3fd3: d9
    !byte spriteid_tail4                                              ; 3fd4: da
    !byte spriteid_tail5                                              ; 3fd5: db
    !byte spriteid_tail6                                              ; 3fd6: dc

; check for first update in room (branch if not)
room_2_update_handler
    lda update_room_first_update_flag                                 ; 3fd7: ad 2b 13
    beq update_room_2                                                 ; 3fda: f0 42
; check for level change (branch if not)
    lda current_level                                                 ; 3fdc: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3fde: c5 51
    beq room_change_only1                                             ; 3fe0: f0 17
    lda #dog_animation_normal - dog_animations                        ; 3fe2: a9 01
    sta dog_animation                                                 ; 3fe4: 8d 6f 0a
    sta dog_animation_step                                            ; 3fe7: 8d 70 0a
    lda save_game_level_l_dog_x                                       ; 3fea: ad 3a 0a
    bne set_initial_dog_x_position                                    ; 3fed: d0 02
    lda #$68 ; 'h'                                                    ; 3fef: a9 68
set_initial_dog_x_position
    clc                                                               ; 3ff1: 18
    adc #2                                                            ; 3ff2: 69 02
    and #$fc                                                          ; 3ff4: 29 fc
    sta save_game_level_l_dog_x                                       ; 3ff6: 8d 3a 0a
room_change_only1
    lda desired_room_index                                            ; 3ff9: a5 30
    cmp #2                                                            ; 3ffb: c9 02
    bne update_dog_object_local                                       ; 3ffd: d0 1c
    lda #spriteid_erase_1                                             ; 3fff: a9 c9
    sta object_erase_type + objectid_dog                              ; 4001: 8d ae 38
    lda #$c0                                                          ; 4004: a9 c0
    sta object_z_order + objectid_dog                                 ; 4006: 8d c4 38
    lda #$78 ; 'x'                                                    ; 4009: a9 78
    sta object_y_low + objectid_dog                                   ; 400b: 8d 7e 09
    sta object_y_low + objectid_dog_tail                              ; 400e: 8d 7f 09
    lda #spriteid_erase_3                                             ; 4011: a9 d6
    sta object_erase_type + objectid_baby_arms                        ; 4013: 8d af 38
    lda #$a0                                                          ; 4016: a9 a0
    sta object_z_order + objectid_baby_arms                           ; 4018: 8d c5 38
update_dog_object_local
    jmp update_dog_object                                             ; 401b: 4c 0a 41

update_room_2
    lda dog_animation_step                                            ; 401e: ad 70 0a
    clc                                                               ; 4021: 18
    adc #3                                                            ; 4022: 69 03
    tay                                                               ; 4024: a8
    lda dog_animations,y                                              ; 4025: b9 96 3f
    cmp #0                                                            ; 4028: c9 00                   ; redundant instruction
    bne check_for_dog_cowering                                        ; 402a: d0 03
    ldy dog_animation                                                 ; 402c: ac 6f 0a
check_for_dog_cowering
    cpy #dog_animation_cower_in_place - dog_animations                ; 402f: c0 05
    bne check_for_dog_backing_up                                      ; 4031: d0 0a
; while cowering, wait until timeout and then return to normal
    dec dog_animation_delay                                           ; 4033: ce 78 0a
    bpl check_for_player_using_whip                                   ; 4036: 10 1b
    ldy #dog_animation_normal - dog_animations                        ; 4038: a0 01
    sty dog_animation                                                 ; 403a: 8c 6f 0a
check_for_dog_backing_up
    lda dog_animation                                                 ; 403d: ad 6f 0a
    cmp #dog_animation_back_up - dog_animations                       ; 4040: c9 22
    bne check_for_player_using_whip                                   ; 4042: d0 0f
    cpy dog_animation                                                 ; 4044: cc 6f 0a
    bne check_player_dog_collisions                                   ; 4047: d0 4b
    ldy #dog_animation_cower_in_place - dog_animations                ; 4049: a0 05
    sty dog_animation                                                 ; 404b: 8c 6f 0a
    lda #9                                                            ; 404e: a9 09
    sta dog_animation_delay                                           ; 4050: 8d 78 0a
check_for_player_using_whip
    lda desired_room_index                                            ; 4053: a5 30
    cmp #2                                                            ; 4055: c9 02
    bne check_player_dog_collisions                                   ; 4057: d0 3b
    lda #spriteid_whip_menu_item                                      ; 4059: a9 c8
    cmp previous_player_using_object_spriteid                         ; 405b: cd b7 2e
    bne check_player_dog_collisions                                   ; 405e: d0 34
    lda object_spriteid_old + objectid_player_accessory               ; 4060: ad b4 09
    cmp #spriteid_whip_1                                              ; 4063: c9 cb
    beq check_player_dog_collisions                                   ; 4065: f0 2d
    lda #8                                                            ; 4067: a9 08
    sta temp_right_offset                                             ; 4069: 8d d1 24
    ldx #objectid_old_player_accessory                                ; 406c: a2 0c
    sty remember_y                                                    ; 406e: 8c 46 3b
    ldy #objectid_dog                                                 ; 4071: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 4073: 20 e2 28
    ldy remember_y                                                    ; 4076: ac 46 3b
    tax                                                               ; 4079: aa
    beq check_player_dog_collisions                                   ; 407a: f0 18
    lda save_game_level_l_dog_x                                       ; 407c: ad 3a 0a
    cmp #$8c                                                          ; 407f: c9 8c
    bcc dog_backs_up                                                  ; 4081: 90 0c
    ldy #dog_animation_cower_in_place - dog_animations                ; 4083: a0 05
    sty dog_animation                                                 ; 4085: 8c 6f 0a
    lda #9                                                            ; 4088: a9 09
    sta dog_animation_delay                                           ; 408a: 8d 78 0a
    bpl check_player_dog_collisions                                   ; 408d: 10 05                   ; ALWAYS branch

dog_backs_up
    ldy #dog_animation_back_up - dog_animations                       ; 408f: a0 22
    sty dog_animation                                                 ; 4091: 8c 6f 0a
check_player_dog_collisions
    lda desired_room_index                                            ; 4094: a5 30
    cmp #2                                                            ; 4096: c9 02
    bne increment_dog_animation                                       ; 4098: d0 44
    lda player_held_object_spriteid                                   ; 409a: a5 52
    sta remember_player_held_sprite                                   ; 409c: 8d 3f 41
    lda #spriteid_whip_menu_item                                      ; 409f: a9 c8
    cmp player_using_object_spriteid                                  ; 40a1: cd b6 2e
    bne check_dog_player_collision                                    ; 40a4: d0 04
    lda #0                                                            ; 40a6: a9 00
    sta player_held_object_spriteid                                   ; 40a8: 85 52
check_dog_player_collision
    ldx #objectid_player                                              ; 40aa: a2 00
    sty remember_y                                                    ; 40ac: 8c 46 3b
    ldy #objectid_dog                                                 ; 40af: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 40b1: 20 e2 28
    ldy remember_y                                                    ; 40b4: ac 46 3b
    ldx remember_player_held_sprite                                   ; 40b7: ae 3f 41
    stx player_held_object_spriteid                                   ; 40ba: 86 52
    tax                                                               ; 40bc: aa
    bne dog_pushes_player                                             ; 40bd: d0 13
    lda #4                                                            ; 40bf: a9 04
    cmp current_player_character                                      ; 40c1: c5 48
    beq increment_dog_animation                                       ; 40c3: f0 19
    ldx #objectid_player_accessory                                    ; 40c5: a2 01
    ldy #objectid_dog                                                 ; 40c7: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 40c9: 20 e2 28
    ldy remember_y                                                    ; 40cc: ac 46 3b
    tax                                                               ; 40cf: aa
    beq increment_dog_animation                                       ; 40d0: f0 0c
dog_pushes_player
    lda #$fa                                                          ; 40d2: a9 fa
    sta player_wall_collision_reaction_speed                          ; 40d4: 8d 33 24
    ldy #dog_animation_push - dog_animations                          ; 40d7: a0 09
    lda #dog_animation_normal - dog_animations                        ; 40d9: a9 01
    sta dog_animation                                                 ; 40db: 8d 6f 0a
increment_dog_animation
    sty dog_animation_step                                            ; 40de: 8c 70 0a
    iny                                                               ; 40e1: c8
    lda dog_animations,y                                              ; 40e2: b9 96 3f
    clc                                                               ; 40e5: 18
    adc save_game_level_l_dog_x                                       ; 40e6: 6d 3a 0a
    sta save_game_level_l_dog_x                                       ; 40e9: 8d 3a 0a
    iny                                                               ; 40ec: c8
    lda dog_animations,y                                              ; 40ed: b9 96 3f
    cmp #$ff                                                          ; 40f0: c9 ff
    beq increment_dog_tail_animation                                  ; 40f2: f0 07
    lda #$ff                                                          ; 40f4: a9 ff
    sta dog_tail_animation_step                                       ; 40f6: 8d 71 0a
    bmi update_dog_object                                             ; 40f9: 30 0f
increment_dog_tail_animation
    inc dog_tail_animation_step                                       ; 40fb: ee 71 0a
    lda dog_tail_animation_step                                       ; 40fe: ad 71 0a
    cmp #6                                                            ; 4101: c9 06
    bcc update_dog_object                                             ; 4103: 90 05
    lda #0                                                            ; 4105: a9 00
    sta dog_tail_animation_step                                       ; 4107: 8d 71 0a
update_dog_object
    lda desired_room_index                                            ; 410a: a5 30
    cmp #2                                                            ; 410c: c9 02
    bne return3                                                       ; 410e: d0 2e
    ldy dog_animation_step                                            ; 4110: ac 70 0a
    lda dog_animations,y                                              ; 4113: b9 96 3f
    sta object_spriteid + objectid_dog                                ; 4116: 8d aa 09
    lda save_game_level_l_dog_x                                       ; 4119: ad 3a 0a
    asl                                                               ; 411c: 0a
    sta object_x_low + objectid_dog                                   ; 411d: 8d 52 09
    sta object_x_low + objectid_dog_tail                              ; 4120: 8d 53 09
    lda #0                                                            ; 4123: a9 00
    rol                                                               ; 4125: 2a
    sta object_x_high + objectid_dog                                  ; 4126: 8d 68 09
    sta object_x_high + objectid_dog_tail                             ; 4129: 8d 69 09
    iny                                                               ; 412c: c8
    iny                                                               ; 412d: c8
    lda dog_animations,y                                              ; 412e: b9 96 3f
    cmp #$ff                                                          ; 4131: c9 ff
    bne store_dog_tail_sprite                                         ; 4133: d0 06
    ldy dog_tail_animation_step                                       ; 4135: ac 71 0a
    lda dog_tail_animation,y                                          ; 4138: b9 d1 3f
store_dog_tail_sprite
    sta object_spriteid + objectid_dog_tail                           ; 413b: 8d ab 09
return3
    rts                                                               ; 413e: 60

remember_player_held_sprite
    !byte 0                                                           ; 413f: 00
; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 20                                                          ; 4140: 14                      ; initial player X cell
    !byte 22                                                          ; 4141: 16                      ; initial player Y cell

; ########################################
; ########################################
;          |                    |      ###
;          |                    |      ###
;          |                    |      ###
;          |                    |      ###
;          |                    |      ###
; ######   |   ##############   |   ######
; ######   |   ##############   |   ######
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |   ###        ###   |      ###
; ###      |   ###        ###   |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###      |                    |      ###
; ###                                  ###
; ###                 P                ###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_3_code
    jsr draw_top_and_bottom_rows_of_rock                              ; 4142: 20 32 3b
; draw 3x15 rectangle at (0,7)
    ldy #7                                                            ; 4145: a0 07
    lda #3                                                            ; 4147: a9 03
    sta width_in_cells                                                ; 4149: 85 3c
    lda #$0f                                                          ; 414b: a9 0f
    sta height_in_cells                                               ; 414d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 414f: 20 bb 1a
; draw 3x20 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 4152: a2 25
    ldy #2                                                            ; 4154: a0 02
    lda #$14                                                          ; 4156: a9 14
    sta height_in_cells                                               ; 4158: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 415a: 20 bb 1a
; draw 3x2 rectangle at (3,7)
    ldx #3                                                            ; 415d: a2 03
    ldy #7                                                            ; 415f: a0 07
    lda #2                                                            ; 4161: a9 02
    sta height_in_cells                                               ; 4163: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4165: 20 bb 1a
; draw 3x2 rectangle at (34,7)
    ldx #$22 ; '"'                                                    ; 4168: a2 22
    jsr copy_rectangle_of_memory_to_screen                            ; 416a: 20 bb 1a
; draw 3x2 rectangle at (13,15)
    ldx #$0d                                                          ; 416d: a2 0d
    ldy #$0f                                                          ; 416f: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 4171: 20 bb 1a
; draw 3x2 rectangle at (24,15)
    ldx #$18                                                          ; 4174: a2 18
    jsr copy_rectangle_of_memory_to_screen                            ; 4176: 20 bb 1a
; draw 14x2 rectangle at (13,7)
    ldx #$0d                                                          ; 4179: a2 0d
    ldy #7                                                            ; 417b: a0 07
    lda #$0e                                                          ; 417d: a9 0e
    sta width_in_cells                                                ; 417f: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 4181: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 4184: 20 90 1b
; draw rope at (9,2) length 18
    ldx #9                                                            ; 4187: a2 09
    ldy #2                                                            ; 4189: a0 02
    lda #$12                                                          ; 418b: a9 12
    jsr draw_rope                                                     ; 418d: 20 b9 1d
; draw rope at (30,2) length 18
    ldx #$1e                                                          ; 4190: a2 1e
    jsr draw_rope                                                     ; 4192: 20 b9 1d
    jsr start_room                                                    ; 4195: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 4198: 20 da 12
    and #exit_room_left                                               ; 419b: 29 01
    beq room_3_game_update_loop                                       ; 419d: f0 f9
    ldx #2                                                            ; 419f: a2 02
    jmp goto_new_room                                                 ; 41a1: 4c da 3b

frog_animations
    !byte 0                                                           ; 41a4: 00
frog_idle_animation
    !byte spriteid_frog                                               ; 41a5: de
    !byte 0, 0                                                        ; 41a6: 00 00
    !byte $ff                                                         ; 41a8: ff
frog_speaking_animation
    !byte spriteid_frog_speaking                                      ; 41a9: df
    !byte 0, 0                                                        ; 41aa: 00 00
    !byte spriteid_frog_speaking                                      ; 41ac: df
    !byte 0, 0                                                        ; 41ad: 00 00
    !byte spriteid_frog_speaking                                      ; 41af: df
    !byte 0, 0                                                        ; 41b0: 00 00
    !byte spriteid_frog_speaking                                      ; 41b2: df
    !byte 0, 0                                                        ; 41b3: 00 00
    !byte $ff                                                         ; 41b5: ff
frog_leap_animation
    !byte spriteid_frog_leap1                                         ; 41b6: ef
    !byte   8, $f6                                                    ; 41b7: 08 f6
    !byte spriteid_frog_leap1                                         ; 41b9: ef
    !byte   8, $fb                                                    ; 41ba: 08 fb
    !byte spriteid_frog_leap1                                         ; 41bc: ef
    !byte   8, $fc                                                    ; 41bd: 08 fc
    !byte spriteid_frog_leap1                                         ; 41bf: ef
    !byte   8, $fe                                                    ; 41c0: 08 fe
    !byte spriteid_frog_leap1                                         ; 41c2: ef
    !byte   8, $ff                                                    ; 41c3: 08 ff
    !byte spriteid_frog_leap1                                         ; 41c5: ef
    !byte 8, 0                                                        ; 41c6: 08 00
    !byte spriteid_frog_leap2                                         ; 41c8: f0
    !byte 8, 1                                                        ; 41c9: 08 01
    !byte spriteid_frog_leap2                                         ; 41cb: f0
    !byte 8, 2                                                        ; 41cc: 08 02
    !byte spriteid_frog_leap2                                         ; 41ce: f0
    !byte 8, 4                                                        ; 41cf: 08 04
    !byte spriteid_frog_leap2                                         ; 41d1: f0
    !byte 8, 5                                                        ; 41d2: 08 05
    !byte spriteid_frog_leap2                                         ; 41d4: f0
    !byte   8, $0a                                                    ; 41d5: 08 0a
    !byte $ff                                                         ; 41d7: ff

room_3_update_handler
    lda #3                                                            ; 41d8: a9 03
    sta currently_updating_logic_for_room_index                       ; 41da: 8d ba 1a
    ldx #3                                                            ; 41dd: a2 03
    ldy #$0c                                                          ; 41df: a0 0c
    lda #objectid_fire1                                               ; 41e1: a9 03
    jsr update_brazier_and_fire                                       ; 41e3: 20 88 19
    ldx #$25 ; '%'                                                    ; 41e6: a2 25
    lda #objectid_fire2                                               ; 41e8: a9 04
    jsr update_brazier_and_fire                                       ; 41ea: 20 88 19
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 41ed: ad 2b 13
    beq room_3_not_first_update                                       ; 41f0: f0 3e
; initialise frog
    lda save_game_level_l_got_frog_progress                           ; 41f2: ad 3b 0a
    bne update_frog_object_local                                      ; 41f5: d0 36
; check for level change (branch if not)
    lda current_level                                                 ; 41f7: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 41f9: c5 51
    beq room_change_only2                                             ; 41fb: f0 25
    ldx #$74 ; 't'                                                    ; 41fd: a2 74
    ldy #$ff                                                          ; 41ff: a0 ff
    lda save_game_level_l_frog_dir                                    ; 4201: ad 3e 0a
    beq store_frog_position_and_direction                             ; 4204: f0 06
    bmi store_frog_position_and_direction                             ; 4206: 30 04
    ldx #$cc                                                          ; 4208: a2 cc
    ldy #1                                                            ; 420a: a0 01
store_frog_position_and_direction
    stx frog_x                                                        ; 420c: 8e 73 0a
    sty save_game_level_l_frog_dir                                    ; 420f: 8c 3e 0a
    lda #$76 ; 'v'                                                    ; 4212: a9 76
    sta frog_y                                                        ; 4214: 8d 74 0a
    lda #frog_idle_animation - frog_animations                        ; 4217: a9 01
    sta frog_animation                                                ; 4219: 8d 75 0a
    sta frog_animation_step                                           ; 421c: 8d 76 0a
    jsr get_delay_before_next_ribbit                                  ; 421f: 20 50 43
room_change_only2
    lda desired_room_index                                            ; 4222: a5 30
    cmp #3                                                            ; 4224: c9 03
    bne update_frog_object_local                                      ; 4226: d0 05
    lda #spriteid_erase_1                                             ; 4228: a9 c9
    sta object_erase_type + objectid_frog                             ; 422a: 8d ae 38
update_frog_object_local
    jmp update_frog_object                                            ; 422d: 4c 03 43

room_3_not_first_update
    lda save_game_level_l_got_frog_progress                           ; 4230: ad 3b 0a
    bne update_frog_object_local                                      ; 4233: d0 f8
    lda frog_animation_step                                           ; 4235: ad 76 0a
    clc                                                               ; 4238: 18
    adc #3                                                            ; 4239: 69 03
    tay                                                               ; 423b: a8
    lda frog_animations,y                                             ; 423c: b9 a4 41
    cmp #$ff                                                          ; 423f: c9 ff
    bne check_player_frog_collision_for_collection                    ; 4241: d0 03
    ldy frog_animation                                                ; 4243: ac 75 0a
check_player_frog_collision_for_collection
    lda desired_room_index                                            ; 4246: a5 30
    cmp #3                                                            ; 4248: c9 03
    bne check_for_frog_leaping                                        ; 424a: d0 1c
    ldx #objectid_old_player                                          ; 424c: a2 0b
    sty remember_y                                                    ; 424e: 8c 46 3b
    ldy #objectid_frog                                                ; 4251: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 4253: 20 e2 28
    ldy remember_y                                                    ; 4256: ac 46 3b
    tax                                                               ; 4259: aa
    beq check_for_frog_leaping                                        ; 425a: f0 0c
    lda #spriteid_frog_menu_item                                      ; 425c: a9 dd
    jsr find_or_create_menu_slot_for_A                                ; 425e: 20 bd 2b
    lda #$ff                                                          ; 4261: a9 ff
    sta save_game_level_l_got_frog_progress                           ; 4263: 8d 3b 0a
    bmi set_frog_animation_step                                       ; 4266: 30 7a
check_for_frog_leaping
    lda frog_animation                                                ; 4268: ad 75 0a
    cmp #frog_leap_animation - frog_animations                        ; 426b: c9 12
    bne check_for_frog_idle                                           ; 426d: d0 0d
    cpy frog_animation                                                ; 426f: cc 75 0a
    bne set_frog_animation_step                                       ; 4272: d0 6e
set_frog_idle
    ldy #frog_idle_animation - frog_animations                        ; 4274: a0 01
    sty frog_animation                                                ; 4276: 8c 75 0a
    jsr get_delay_before_next_ribbit                                  ; 4279: 20 50 43
check_for_frog_idle
    lda frog_animation                                                ; 427c: ad 75 0a
    cmp #frog_idle_animation - frog_animations                        ; 427f: c9 01
    bne check_for_frog_speaking                                       ; 4281: d0 5b
    lda desired_room_index                                            ; 4283: a5 30
    cmp #3                                                            ; 4285: c9 03
    bne update_delay_between_ribbits                                  ; 4287: d0 40
    ldx #$0b                                                          ; 4289: a2 0b
    sty remember_y                                                    ; 428b: 8c 46 3b
    jsr find_top_and_bottom_of_object                                 ; 428e: 20 d2 24
    ldy remember_y                                                    ; 4291: ac 46 3b
    lda l007b                                                         ; 4294: a5 7b
    cmp #9                                                            ; 4296: c9 09
    bcc update_delay_between_ribbits                                  ; 4298: 90 2f
    lda l007a                                                         ; 429a: a5 7a
    cmp #$0f                                                          ; 429c: c9 0f
    bcs update_delay_between_ribbits                                  ; 429e: b0 29
; get difference between player and frog x
    lda object_x_low_old                                              ; 42a0: ad 5b 09
    sec                                                               ; 42a3: 38
    sbc frog_x                                                        ; 42a4: ed 73 0a
    lda object_x_high_old                                             ; 42a7: ad 71 09
    sbc #0                                                            ; 42aa: e9 00
    tax                                                               ; 42ac: aa
    lda save_game_level_l_frog_dir                                    ; 42ad: ad 3e 0a
    bpl frog_direction_right                                          ; 42b0: 10 05
    txa                                                               ; 42b2: 8a
    bpl update_delay_between_ribbits                                  ; 42b3: 10 14
    bmi flip_frog_direction                                           ; 42b5: 30 03                   ; ALWAYS branch

frog_direction_right
    txa                                                               ; 42b7: 8a
    bmi update_delay_between_ribbits                                  ; 42b8: 30 0f
flip_frog_direction
    lda save_game_level_l_frog_dir                                    ; 42ba: ad 3e 0a
    eor #$fe                                                          ; 42bd: 49 fe
    sta save_game_level_l_frog_dir                                    ; 42bf: 8d 3e 0a
; set frog leaping
    ldy #frog_leap_animation - frog_animations                        ; 42c2: a0 12
    sty frog_animation                                                ; 42c4: 8c 75 0a
    bpl set_frog_animation_step                                       ; 42c7: 10 19
update_delay_between_ribbits
    dec delay_before_ribbit                                           ; 42c9: ce 77 0a
    bne set_frog_animation_step                                       ; 42cc: d0 14
    lda desired_room_index                                            ; 42ce: a5 30
    cmp #3                                                            ; 42d0: c9 03
    bne set_frog_speaking                                             ; 42d2: d0 03
    jsr play_ribbit_sound                                             ; 42d4: 20 d8 43
set_frog_speaking
    ldy #frog_speaking_animation - frog_animations                    ; 42d7: a0 05
    sty frog_animation                                                ; 42d9: 8c 75 0a
    bpl set_frog_animation_step                                       ; 42dc: 10 04
check_for_frog_speaking
    cpy #frog_speaking_animation - frog_animations                    ; 42de: c0 05
    beq set_frog_idle                                                 ; 42e0: f0 92
set_frog_animation_step
    sty frog_animation_step                                           ; 42e2: 8c 76 0a
    iny                                                               ; 42e5: c8
    lda frog_animations,y                                             ; 42e6: b9 a4 41
    clc                                                               ; 42e9: 18
    ldx save_game_level_l_frog_dir                                    ; 42ea: ae 3e 0a
    bpl update_frog_x                                                 ; 42ed: 10 03
    eor #$ff                                                          ; 42ef: 49 ff
    sec                                                               ; 42f1: 38
update_frog_x
    adc frog_x                                                        ; 42f2: 6d 73 0a
    sta frog_x                                                        ; 42f5: 8d 73 0a
    iny                                                               ; 42f8: c8
    lda frog_animations,y                                             ; 42f9: b9 a4 41
    clc                                                               ; 42fc: 18
    adc frog_y                                                        ; 42fd: 6d 74 0a
    sta frog_y                                                        ; 4300: 8d 74 0a
update_frog_object
    lda desired_room_index                                            ; 4303: a5 30
    cmp #3                                                            ; 4305: c9 03
    bne return4                                                       ; 4307: d0 46
    lda #spriteid_one_pixel_masked_out                                ; 4309: a9 00
    sta object_spriteid + objectid_frog                               ; 430b: 8d aa 09
    lda save_game_level_l_got_frog_progress                           ; 430e: ad 3b 0a
    bne return4                                                       ; 4311: d0 3c
    lda save_game_level_l_frog_dir                                    ; 4313: ad 3e 0a
    sta object_direction + objectid_frog                              ; 4316: 8d c0 09
    lda frog_x                                                        ; 4319: ad 73 0a
    sta object_x_low + objectid_frog                                  ; 431c: 8d 52 09
    lda frog_y                                                        ; 431f: ad 74 0a
    sta object_y_low + objectid_frog                                  ; 4322: 8d 7e 09
    ldy frog_animation_step                                           ; 4325: ac 76 0a
    lda frog_animations,y                                             ; 4328: b9 a4 41
    sta object_spriteid + objectid_frog                               ; 432b: 8d aa 09
    cmp #spriteid_frog                                                ; 432e: c9 de
    beq calculate_frog_offset_based_on_frog_direction                 ; 4330: f0 04
    cmp #spriteid_frog_speaking                                       ; 4332: c9 df
    bne return4                                                       ; 4334: d0 19
calculate_frog_offset_based_on_frog_direction
    lda #$fc                                                          ; 4336: a9 fc
    ldx save_game_level_l_frog_dir                                    ; 4338: ae 3e 0a
    bpl move_frog                                                     ; 433b: 10 02
    lda #4                                                            ; 433d: a9 04
move_frog
    clc                                                               ; 433f: 18
    adc object_x_low + objectid_frog                                  ; 4340: 6d 52 09
    sta object_x_low + objectid_frog                                  ; 4343: 8d 52 09
    lda #$fb                                                          ; 4346: a9 fb
    clc                                                               ; 4348: 18
    adc object_y_low + objectid_frog                                  ; 4349: 6d 7e 09
    sta object_y_low + objectid_frog                                  ; 434c: 8d 7e 09
return4
    rts                                                               ; 434f: 60

get_delay_before_next_ribbit
    lda #$1f                                                          ; 4350: a9 1f
    jsr get_random_number_up_to_a                                     ; 4352: 20 a6 18
    clc                                                               ; 4355: 18
    adc #$14                                                          ; 4356: 69 14
    sta delay_before_ribbit                                           ; 4358: 8d 77 0a
    rts                                                               ; 435b: 60

frog_animation_table
    !byte spriteid_frog_speaking                                      ; 435c: df
    !byte spriteid_frog_speaking                                      ; 435d: df
    !byte spriteid_frog_speaking                                      ; 435e: df
    !byte spriteid_frog_speaking                                      ; 435f: df
    !byte spriteid_frog                                               ; 4360: de

; check for first update in room (branch if not)
update_frog_speaking
    lda update_room_first_update_flag                                 ; 4361: ad 2b 13
    beq update_frog_collectable                                       ; 4364: f0 32
; check for level change (branch if not)
    lda current_level                                                 ; 4366: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 4368: c5 51
    beq initialise_frog_collectable                                   ; 436a: f0 0a
    lda save_game_level_l_got_frog_progress                           ; 436c: ad 3b 0a
    beq initialise_frog_collectable                                   ; 436f: f0 05
    lda #$ff                                                          ; 4371: a9 ff
    sta save_game_level_l_got_frog_progress                           ; 4373: 8d 3b 0a
initialise_frog_collectable
    lda #spriteid_frog_menu_item                                      ; 4376: a9 dd
    sta toolbar_collectable_spriteids+2                               ; 4378: 8d ea 2e
    lda #spriteid_frog                                                ; 437b: a9 de
    sta collectable_spriteids+2                                       ; 437d: 8d ef 2e
    ldx #<envelope3                                                   ; 4380: a2 40
    ldy #>envelope3                                                   ; 4382: a0 44
    jsr define_envelope                                               ; 4384: 20 5e 39
    ldx #<envelope4                                                   ; 4387: a2 5e
    ldy #>envelope4                                                   ; 4389: a0 44
    jsr define_envelope                                               ; 438b: 20 5e 39
    ldx #<envelope5                                                   ; 438e: a2 2a
    ldy #>envelope5                                                   ; 4390: a0 44
    jsr define_envelope                                               ; 4392: 20 5e 39
    jmp update_frog_collectable_sprite                                ; 4395: 4c bc 43

update_frog_collectable
    lda save_game_level_l_got_frog_progress                           ; 4398: ad 3b 0a
    beq update_frog_collectable_sprite                                ; 439b: f0 1f
    lda #spriteid_frog_menu_item                                      ; 439d: a9 dd
    cmp player_using_object_spriteid                                  ; 439f: cd b6 2e
    beq player_using_frog                                             ; 43a2: f0 07
    lda #$ff                                                          ; 43a4: a9 ff
    sta save_game_level_l_got_frog_progress                           ; 43a6: 8d 3b 0a
    bmi update_frog_collectable_sprite                                ; 43a9: 30 11
player_using_frog
    ldy save_game_level_l_got_frog_progress                           ; 43ab: ac 3b 0a
    cpy #4                                                            ; 43ae: c0 04
    beq update_frog_collectable_sprite                                ; 43b0: f0 0a
    cpy #$ff                                                          ; 43b2: c0 ff
    bne increment_frog_speaking_animation                             ; 43b4: d0 02
    ldy #0                                                            ; 43b6: a0 00
increment_frog_speaking_animation
    iny                                                               ; 43b8: c8
    sty save_game_level_l_got_frog_progress                           ; 43b9: 8c 3b 0a
update_frog_collectable_sprite
    lda frog_animation_table                                          ; 43bc: ad 5c 43
    ldy save_game_level_l_got_frog_progress                           ; 43bf: ac 3b 0a
    cpy #$ff                                                          ; 43c2: c0 ff
    beq store_frog_collectable_sprite                                 ; 43c4: f0 03
    lda frog_animation_table,y                                        ; 43c6: b9 5c 43
store_frog_collectable_sprite
    sta collectable_being_used_spriteids + 2                          ; 43c9: 8d f4 2e
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 43cc: ad 2b 13
    bne return5                                                       ; 43cf: d0 06
    dey                                                               ; 43d1: 88
    bne return5                                                       ; 43d2: d0 03
    jsr play_ribbit_sound                                             ; 43d4: 20 d8 43
return5
    rts                                                               ; 43d7: 60

play_ribbit_sound
    lda #0                                                            ; 43d8: a9 00
    ldx #<sound4                                                      ; 43da: a2 4e
    ldy #>sound4                                                      ; 43dc: a0 44
    jsr play_sound_yx                                                 ; 43de: 20 f6 38
    ldx #<sound5                                                      ; 43e1: a2 38
    ldy #>sound5                                                      ; 43e3: a0 44
    jsr play_sound_yx                                                 ; 43e5: 20 f6 38
    ldx #<sound6                                                      ; 43e8: a2 6c
    ldy #>sound6                                                      ; 43ea: a0 44
    jsr play_sound_yx                                                 ; 43ec: 20 f6 38
    ldx #<sound7                                                      ; 43ef: a2 56
    ldy #>sound7                                                      ; 43f1: a0 44
    jmp play_sound_yx                                                 ; 43f3: 4c f6 38

envelope1
    !byte 9                                                           ; 43f6: 09                      ; envelope number
    !byte 1                                                           ; 43f7: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 43f8: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 43f9: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 43fa: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 43fb: 00                      ; number of steps in section 1
    !byte 0                                                           ; 43fc: 00                      ; number of steps in section 2
    !byte 0                                                           ; 43fd: 00                      ; number of steps in section 3
    !byte 10                                                          ; 43fe: 0a                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 43ff: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4400: 00                      ; change of amplitude per step during sustain phase
    !byte 216                                                         ; 4401: d8                      ; change of amplitude per step during release phase
    !byte 40                                                          ; 4402: 28                      ; target of level at end of attack phase
    !byte 0                                                           ; 4403: 00                      ; target of level at end of decay phase
sound1
    !word $10                                                         ; 4404: 10 00                   ; channel
    !word 9                                                           ; 4406: 09 00                   ; amplitude
    !word 4                                                           ; 4408: 04 00                   ; pitch
    !word 4                                                           ; 440a: 04 00                   ; duration
envelope2
    !byte 5                                                           ; 440c: 05                      ; envelope number
    !byte 1                                                           ; 440d: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 440e: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 440f: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 4410: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 4411: 00                      ; number of steps in section 1
    !byte 0                                                           ; 4412: 00                      ; number of steps in section 2
    !byte 0                                                           ; 4413: 00                      ; number of steps in section 3
    !byte 60                                                          ; 4414: 3c                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4415: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4416: 00                      ; change of amplitude per step during sustain phase
    !byte 246                                                         ; 4417: f6                      ; change of amplitude per step during release phase
    !byte 120                                                         ; 4418: 78                      ; target of level at end of attack phase
    !byte 60                                                          ; 4419: 3c                      ; target of level at end of decay phase
sound3
    !word $10                                                         ; 441a: 10 00                   ; channel
    !word 5                                                           ; 441c: 05 00                   ; amplitude
    !word 7                                                           ; 441e: 07 00                   ; pitch
    !word 1                                                           ; 4420: 01 00                   ; duration
sound2
    !word $11                                                         ; 4422: 11 00                   ; channel
    !word 0                                                           ; 4424: 00 00                   ; amplitude
    !word 240                                                         ; 4426: f0 00                   ; pitch
    !word 1                                                           ; 4428: 01 00                   ; duration
envelope5
    !byte 6                                                           ; 442a: 06                      ; envelope number
    !byte 1                                                           ; 442b: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 442c: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 442d: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 442e: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 442f: 00                      ; number of steps in section 1
    !byte 0                                                           ; 4430: 00                      ; number of steps in section 2
    !byte 0                                                           ; 4431: 00                      ; number of steps in section 3
    !byte 20                                                          ; 4432: 14                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4433: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4434: 00                      ; change of amplitude per step during sustain phase
    !byte 226                                                         ; 4435: e2                      ; change of amplitude per step during release phase
    !byte 120                                                         ; 4436: 78                      ; target of level at end of attack phase
    !byte 60                                                          ; 4437: 3c                      ; target of level at end of decay phase
sound5
    !word $10                                                         ; 4438: 10 00                   ; channel
    !word 6                                                           ; 443a: 06 00                   ; amplitude
    !word 3                                                           ; 443c: 03 00                   ; pitch
    !word 4                                                           ; 443e: 04 00                   ; duration
envelope3
    !byte 7                                                           ; 4440: 07                      ; envelope number
    !byte 129                                                         ; 4441: 81                      ; step length (100ths of a second)
    !byte 1                                                           ; 4442: 01                      ; pitch change per step in section 1
    !byte 4                                                           ; 4443: 04                      ; pitch change per step in section 2
    !byte 6                                                           ; 4444: 06                      ; pitch change per step in section 3
    !byte 2                                                           ; 4445: 02                      ; number of steps in section 1
    !byte 4                                                           ; 4446: 04                      ; number of steps in section 2
    !byte 8                                                           ; 4447: 08                      ; number of steps in section 3
    !byte 0                                                           ; 4448: 00                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4449: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 444a: 00                      ; change of amplitude per step during sustain phase
    !byte 0                                                           ; 444b: 00                      ; change of amplitude per step during release phase
    !byte 0                                                           ; 444c: 00                      ; target of level at end of attack phase
    !byte 0                                                           ; 444d: 00                      ; target of level at end of decay phase
sound4
    !word $11                                                         ; 444e: 11 00                   ; channel
    !word 7                                                           ; 4450: 07 00                   ; amplitude
    !word 80                                                          ; 4452: 50 00                   ; pitch
    !word 4                                                           ; 4454: 04 00                   ; duration
sound7
    !word 0                                                           ; 4456: 00 00                   ; channel
    !word 241                                                         ; 4458: f1 00                   ; amplitude
    !word 3                                                           ; 445a: 03 00                   ; pitch
    !word 2                                                           ; 445c: 02 00                   ; duration
envelope4
    !byte 8                                                           ; 445e: 08                      ; envelope number
    !byte 129                                                         ; 445f: 81                      ; step length (100ths of a second)
    !byte 0                                                           ; 4460: 00                      ; pitch change per step in section 1
    !byte 84                                                          ; 4461: 54                      ; pitch change per step in section 2
    !byte 0                                                           ; 4462: 00                      ; pitch change per step in section 3
    !byte 5                                                           ; 4463: 05                      ; number of steps in section 1
    !byte 1                                                           ; 4464: 01                      ; number of steps in section 2
    !byte 100                                                         ; 4465: 64                      ; number of steps in section 3
    !byte 0                                                           ; 4466: 00                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4467: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4468: 00                      ; change of amplitude per step during sustain phase
    !byte 0                                                           ; 4469: 00                      ; change of amplitude per step during release phase
    !byte 0                                                           ; 446a: 00                      ; target of level at end of attack phase
    !byte 0                                                           ; 446b: 00                      ; target of level at end of decay phase
sound6
    !word 1                                                           ; 446c: 01 00                   ; channel
    !word 8                                                           ; 446e: 08 00                   ; amplitude
    !word 0                                                           ; 4470: 00 00                   ; pitch
    !word 2                                                           ; 4472: 02 00                   ; duration
ground_fill_2x2_top_left
    !byte %.....#..                                                   ; 4474: 04
    !byte %....#...                                                   ; 4475: 08
    !byte %...#....                                                   ; 4476: 10
    !byte %..##....                                                   ; 4477: 30
    !byte %.#..#..#                                                   ; 4478: 49
    !byte %#....##.                                                   ; 4479: 86
    !byte %.....#..                                                   ; 447a: 04
    !byte %....#...                                                   ; 447b: 08
ground_fill_2x2_top_right
    !byte %..#.....                                                   ; 447c: 20
    !byte %...#....                                                   ; 447d: 10
    !byte %....#...                                                   ; 447e: 08
    !byte %....##..                                                   ; 447f: 0c
    !byte %#..#..#.                                                   ; 4480: 92
    !byte %.##....#                                                   ; 4481: 61
    !byte %..#.....                                                   ; 4482: 20
    !byte %...#....                                                   ; 4483: 10
ground_fill_2x2_bottom_left
    !byte %....#...                                                   ; 4484: 08
    !byte %.....#..                                                   ; 4485: 04
    !byte %#....##.                                                   ; 4486: 86
    !byte %.#..#..#                                                   ; 4487: 49
    !byte %..##....                                                   ; 4488: 30
    !byte %...#....                                                   ; 4489: 10
    !byte %....#...                                                   ; 448a: 08
    !byte %.....#..                                                   ; 448b: 04
ground_fill_2x2_bottom_right
    !byte %...#....                                                   ; 448c: 10
    !byte %..#.....                                                   ; 448d: 20
    !byte %.##....#                                                   ; 448e: 61
    !byte %#..#..#.                                                   ; 448f: 92
    !byte %....##..                                                   ; 4490: 0c
    !byte %....#...                                                   ; 4491: 08
    !byte %...#....                                                   ; 4492: 10
    !byte %..#.....                                                   ; 4493: 20
sprite_data
pydis_end

; Automatically generated labels:
;     l007a
;     l007b
!if (<envelope1) != $f6 {
    !error "Assertion failed: <envelope1 == $f6"
}
!if (<envelope2) != $0c {
    !error "Assertion failed: <envelope2 == $0c"
}
!if (<envelope3) != $40 {
    !error "Assertion failed: <envelope3 == $40"
}
!if (<envelope4) != $5e {
    !error "Assertion failed: <envelope4 == $5e"
}
!if (<envelope5) != $2a {
    !error "Assertion failed: <envelope5 == $2a"
}
!if (<ground_fill_2x2_top_left) != $74 {
    !error "Assertion failed: <ground_fill_2x2_top_left == $74"
}
!if (<sound1) != $04 {
    !error "Assertion failed: <sound1 == $04"
}
!if (<sound2) != $22 {
    !error "Assertion failed: <sound2 == $22"
}
!if (<sound3) != $1a {
    !error "Assertion failed: <sound3 == $1a"
}
!if (<sound4) != $4e {
    !error "Assertion failed: <sound4 == $4e"
}
!if (<sound5) != $38 {
    !error "Assertion failed: <sound5 == $38"
}
!if (<sound6) != $6c {
    !error "Assertion failed: <sound6 == $6c"
}
!if (<sound7) != $56 {
    !error "Assertion failed: <sound7 == $56"
}
!if (>envelope1) != $43 {
    !error "Assertion failed: >envelope1 == $43"
}
!if (>envelope2) != $44 {
    !error "Assertion failed: >envelope2 == $44"
}
!if (>envelope3) != $44 {
    !error "Assertion failed: >envelope3 == $44"
}
!if (>envelope4) != $44 {
    !error "Assertion failed: >envelope4 == $44"
}
!if (>envelope5) != $44 {
    !error "Assertion failed: >envelope5 == $44"
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
!if (>sound7) != $44 {
    !error "Assertion failed: >sound7 == $44"
}
!if (baby_arm_pre_pulling_animation - baby_arm_animations) != $04 {
    !error "Assertion failed: baby_arm_pre_pulling_animation - baby_arm_animations == $04"
}
!if (baby_arm_pulling_rope_animation - baby_arm_animations) != $15 {
    !error "Assertion failed: baby_arm_pulling_rope_animation - baby_arm_animations == $15"
}
!if (baby_arm_static_animation - baby_arm_animations) != $01 {
    !error "Assertion failed: baby_arm_static_animation - baby_arm_animations == $01"
}
!if (collectable_being_used_spriteids + 2) != $2ef4 {
    !error "Assertion failed: collectable_being_used_spriteids + 2 == $2ef4"
}
!if (collision_map_none) != $00 {
    !error "Assertion failed: collision_map_none == $00"
}
!if (collision_map_solid_rock) != $03 {
    !error "Assertion failed: collision_map_solid_rock == $03"
}
!if (dog_animation_back_up - dog_animations) != $22 {
    !error "Assertion failed: dog_animation_back_up - dog_animations == $22"
}
!if (dog_animation_cower_in_place - dog_animations) != $05 {
    !error "Assertion failed: dog_animation_cower_in_place - dog_animations == $05"
}
!if (dog_animation_normal - dog_animations) != $01 {
    !error "Assertion failed: dog_animation_normal - dog_animations == $01"
}
!if (dog_animation_push - dog_animations) != $09 {
    !error "Assertion failed: dog_animation_push - dog_animations == $09"
}
!if (exit_room_left) != $01 {
    !error "Assertion failed: exit_room_left == $01"
}
!if (exit_room_right) != $04 {
    !error "Assertion failed: exit_room_right == $04"
}
!if (frog_idle_animation - frog_animations) != $01 {
    !error "Assertion failed: frog_idle_animation - frog_animations == $01"
}
!if (frog_leap_animation - frog_animations) != $12 {
    !error "Assertion failed: frog_leap_animation - frog_animations == $12"
}
!if (frog_speaking_animation - frog_animations) != $05 {
    !error "Assertion failed: frog_speaking_animation - frog_animations == $05"
}
!if (level_specific_initialisation) != $3aef {
    !error "Assertion failed: level_specific_initialisation == $3aef"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b1f {
    !error "Assertion failed: level_specific_update == $3b1f"
}
!if (object_direction + objectid_frog) != $09c0 {
    !error "Assertion failed: object_direction + objectid_frog == $09c0"
}
!if (object_direction + objectid_whip) != $09c0 {
    !error "Assertion failed: object_direction + objectid_whip == $09c0"
}
!if (object_erase_type + objectid_baby_arms) != $38af {
    !error "Assertion failed: object_erase_type + objectid_baby_arms == $38af"
}
!if (object_erase_type + objectid_dog) != $38ae {
    !error "Assertion failed: object_erase_type + objectid_dog == $38ae"
}
!if (object_erase_type + objectid_end_of_partition) != $38b2 {
    !error "Assertion failed: object_erase_type + objectid_end_of_partition == $38b2"
}
!if (object_erase_type + objectid_frog) != $38ae {
    !error "Assertion failed: object_erase_type + objectid_frog == $38ae"
}
!if (object_erase_type + objectid_whip) != $38ae {
    !error "Assertion failed: object_erase_type + objectid_whip == $38ae"
}
!if (object_spriteid + objectid_baby_arms) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_baby_arms == $09ab"
}
!if (object_spriteid + objectid_dog) != $09aa {
    !error "Assertion failed: object_spriteid + objectid_dog == $09aa"
}
!if (object_spriteid + objectid_dog_tail) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_dog_tail == $09ab"
}
!if (object_spriteid + objectid_end_of_partition) != $09ae {
    !error "Assertion failed: object_spriteid + objectid_end_of_partition == $09ae"
}
!if (object_spriteid + objectid_frog) != $09aa {
    !error "Assertion failed: object_spriteid + objectid_frog == $09aa"
}
!if (object_spriteid + objectid_partition) != $09ad {
    !error "Assertion failed: object_spriteid + objectid_partition == $09ad"
}
!if (object_spriteid + objectid_rope_frayed_end) != $09ac {
    !error "Assertion failed: object_spriteid + objectid_rope_frayed_end == $09ac"
}
!if (object_spriteid + objectid_whip) != $09aa {
    !error "Assertion failed: object_spriteid + objectid_whip == $09aa"
}
!if (object_spriteid_old + objectid_rope_frayed_end) != $09b7 {
    !error "Assertion failed: object_spriteid_old + objectid_rope_frayed_end == $09b7"
}
!if (object_x_high + objectid_dog) != $0968 {
    !error "Assertion failed: object_x_high + objectid_dog == $0968"
}
!if (object_x_high + objectid_dog_tail) != $0969 {
    !error "Assertion failed: object_x_high + objectid_dog_tail == $0969"
}
!if (object_x_low + objectid_dog) != $0952 {
    !error "Assertion failed: object_x_low + objectid_dog == $0952"
}
!if (object_x_low + objectid_dog_tail) != $0953 {
    !error "Assertion failed: object_x_low + objectid_dog_tail == $0953"
}
!if (object_x_low + objectid_frog) != $0952 {
    !error "Assertion failed: object_x_low + objectid_frog == $0952"
}
!if (object_y_low + objectid_dog) != $097e {
    !error "Assertion failed: object_y_low + objectid_dog == $097e"
}
!if (object_y_low + objectid_dog_tail) != $097f {
    !error "Assertion failed: object_y_low + objectid_dog_tail == $097f"
}
!if (object_y_low + objectid_end_of_partition) != $0982 {
    !error "Assertion failed: object_y_low + objectid_end_of_partition == $0982"
}
!if (object_y_low + objectid_frog) != $097e {
    !error "Assertion failed: object_y_low + objectid_frog == $097e"
}
!if (object_y_low + objectid_partition) != $0981 {
    !error "Assertion failed: object_y_low + objectid_partition == $0981"
}
!if (object_y_low + objectid_rope_frayed_end) != $0980 {
    !error "Assertion failed: object_y_low + objectid_rope_frayed_end == $0980"
}
!if (object_z_order + objectid_baby_arms) != $38c5 {
    !error "Assertion failed: object_z_order + objectid_baby_arms == $38c5"
}
!if (object_z_order + objectid_dog) != $38c4 {
    !error "Assertion failed: object_z_order + objectid_dog == $38c4"
}
!if (object_z_order + objectid_partition) != $38c7 {
    !error "Assertion failed: object_z_order + objectid_partition == $38c7"
}
!if (objectid_dog) != $02 {
    !error "Assertion failed: objectid_dog == $02"
}
!if (objectid_end_of_partition) != $06 {
    !error "Assertion failed: objectid_end_of_partition == $06"
}
!if (objectid_fire1) != $03 {
    !error "Assertion failed: objectid_fire1 == $03"
}
!if (objectid_fire2) != $04 {
    !error "Assertion failed: objectid_fire2 == $04"
}
!if (objectid_frog) != $02 {
    !error "Assertion failed: objectid_frog == $02"
}
!if (objectid_old_player) != $0b {
    !error "Assertion failed: objectid_old_player == $0b"
}
!if (objectid_old_player_accessory) != $0c {
    !error "Assertion failed: objectid_old_player_accessory == $0c"
}
!if (objectid_partition) != $05 {
    !error "Assertion failed: objectid_partition == $05"
}
!if (objectid_player) != $00 {
    !error "Assertion failed: objectid_player == $00"
}
!if (objectid_player_accessory) != $01 {
    !error "Assertion failed: objectid_player_accessory == $01"
}
!if (objectid_sparkles) != $02 {
    !error "Assertion failed: objectid_sparkles == $02"
}
!if (objectid_whip) != $02 {
    !error "Assertion failed: objectid_whip == $02"
}
!if (room_0_data) != $3b47 {
    !error "Assertion failed: room_0_data == $3b47"
}
!if (room_1_data) != $3bfe {
    !error "Assertion failed: room_1_data == $3bfe"
}
!if (room_2_data) != $3f1b {
    !error "Assertion failed: room_2_data == $3f1b"
}
!if (room_3_data) != $4140 {
    !error "Assertion failed: room_3_data == $4140"
}
!if (sprite_data - level_data) != $09bf {
    !error "Assertion failed: sprite_data - level_data == $09bf"
}
!if (spriteid_arm2) != $ec {
    !error "Assertion failed: spriteid_arm2 == $ec"
}
!if (spriteid_arm3) != $ed {
    !error "Assertion failed: spriteid_arm3 == $ed"
}
!if (spriteid_arm4) != $ee {
    !error "Assertion failed: spriteid_arm4 == $ee"
}
!if (spriteid_baby3) != $ea {
    !error "Assertion failed: spriteid_baby3 == $ea"
}
!if (spriteid_ball) != $3b {
    !error "Assertion failed: spriteid_ball == $3b"
}
!if (spriteid_dog) != $d2 {
    !error "Assertion failed: spriteid_dog == $d2"
}
!if (spriteid_dog_cower1) != $d4 {
    !error "Assertion failed: spriteid_dog_cower1 == $d4"
}
!if (spriteid_dog_cower2) != $d5 {
    !error "Assertion failed: spriteid_dog_cower2 == $d5"
}
!if (spriteid_dog_raised) != $d3 {
    !error "Assertion failed: spriteid_dog_raised == $d3"
}
!if (spriteid_erase_1) != $c9 {
    !error "Assertion failed: spriteid_erase_1 == $c9"
}
!if (spriteid_erase_2) != $ca {
    !error "Assertion failed: spriteid_erase_2 == $ca"
}
!if (spriteid_erase_3) != $d6 {
    !error "Assertion failed: spriteid_erase_3 == $d6"
}
!if (spriteid_frog) != $de {
    !error "Assertion failed: spriteid_frog == $de"
}
!if (spriteid_frog_leap1) != $ef {
    !error "Assertion failed: spriteid_frog_leap1 == $ef"
}
!if (spriteid_frog_leap2) != $f0 {
    !error "Assertion failed: spriteid_frog_leap2 == $f0"
}
!if (spriteid_frog_menu_item) != $dd {
    !error "Assertion failed: spriteid_frog_menu_item == $dd"
}
!if (spriteid_frog_speaking) != $df {
    !error "Assertion failed: spriteid_frog_speaking == $df"
}
!if (spriteid_horizontal_short_rope) != $e3 {
    !error "Assertion failed: spriteid_horizontal_short_rope == $e3"
}
!if (spriteid_one_pixel_masked_out) != $00 {
    !error "Assertion failed: spriteid_one_pixel_masked_out == $00"
}
!if (spriteid_partition) != $e6 {
    !error "Assertion failed: spriteid_partition == $e6"
}
!if (spriteid_partition_end) != $e7 {
    !error "Assertion failed: spriteid_partition_end == $e7"
}
!if (spriteid_speak_here_sign) != $e0 {
    !error "Assertion failed: spriteid_speak_here_sign == $e0"
}
!if (spriteid_tail1) != $d7 {
    !error "Assertion failed: spriteid_tail1 == $d7"
}
!if (spriteid_tail2) != $d8 {
    !error "Assertion failed: spriteid_tail2 == $d8"
}
!if (spriteid_tail3) != $d9 {
    !error "Assertion failed: spriteid_tail3 == $d9"
}
!if (spriteid_tail4) != $da {
    !error "Assertion failed: spriteid_tail4 == $da"
}
!if (spriteid_tail5) != $db {
    !error "Assertion failed: spriteid_tail5 == $db"
}
!if (spriteid_tail6) != $dc {
    !error "Assertion failed: spriteid_tail6 == $dc"
}
!if (spriteid_top_left_hook) != $e2 {
    !error "Assertion failed: spriteid_top_left_hook == $e2"
}
!if (spriteid_top_right_hook) != $e1 {
    !error "Assertion failed: spriteid_top_right_hook == $e1"
}
!if (spriteid_vertical_rope) != $e4 {
    !error "Assertion failed: spriteid_vertical_rope == $e4"
}
!if (spriteid_vertical_rope_frayed_end) != $e5 {
    !error "Assertion failed: spriteid_vertical_rope_frayed_end == $e5"
}
!if (spriteid_whip_1) != $cb {
    !error "Assertion failed: spriteid_whip_1 == $cb"
}
!if (spriteid_whip_2) != $cc {
    !error "Assertion failed: spriteid_whip_2 == $cc"
}
!if (spriteid_whip_3) != $cd {
    !error "Assertion failed: spriteid_whip_3 == $cd"
}
!if (spriteid_whip_4) != $ce {
    !error "Assertion failed: spriteid_whip_4 == $ce"
}
!if (spriteid_whip_5) != $cf {
    !error "Assertion failed: spriteid_whip_5 == $cf"
}
!if (spriteid_whip_hook2) != $d1 {
    !error "Assertion failed: spriteid_whip_hook2 == $d1"
}
!if (spriteid_whip_menu_item) != $c8 {
    !error "Assertion failed: spriteid_whip_menu_item == $c8"
}
