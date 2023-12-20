; *************************************************************************************
;
; Level P: 'TENDER-HOOKS'
;
; Save game variables:
;
;     save_game_level_p_ring_animation                           ($0a62):
;              $0: sea lion is bouncing the ring
;              $1: on left hook in room 2
;              $2: on right hook in room 2
;              $3: on magnet
;              $4: on left hook in room 1
;              $5: on right hook in room 1
;              $6: falling to one side
;             $15: falling off edge to one side
;             $22: fall straight down
;             $25: stationary
;             $28: bounced off wall
;             $ff: taken
;
;     save_game_level_p_ring_animation_step                      ($0a63):
;             step within the animations above
;
;     save_game_level_p_ring_x_low                               ($0a64):
;     save_game_level_p_ring_x_high                              ($0a65):
;             x position of the ring
;
;     save_game_level_p_ring_direction_without_bounces           ($0a66):
;             direction the ring was thrown in
;
;     save_game_level_p_ring_direction_with_bounces              ($0a67):
;             as above, but including any subsequent bounces off walls
;
;     save_game_level_p_ring_room                                ($0a68):
;             current room containing the ring
;
;     save_game_level_p_ring_y_low                               ($0a69):
;     save_game_level_p_ring_y_high                              ($0a6a):
;             y position of the ring
;
;     save_game_level_p_left_hook_y                              ($0a6b):
;             y position of the left hook in room 2 ($18 to $78)
;
;     save_game_level_p_left_hook_speed                          ($0a6c):
;              $0: stationary
;              $4: moving down
;             $fc: moving up
;
;     save_game_level_p_magnet_x                                 ($0a6d):
;             x position of the magnet on the bar in cells ($0c to $1b)
;
;     save_game_level_p_magnet_direction                         ($0a6e):
;              $0: stationary
;              $1: moving right
;             $ff: moving left
;
; Solution:
;
;   1. Go to the leftmost room with the sea lion bouncing a ring. Climb the left rope.
;   2. Jump into the magnet to make it travel across the screen past the ring as the ring reaches
;      its highest point. (The ring sticks to the magnet)
;   3. Jump into the ring from the other rope to collect it.
;   4. In the room to the right, climb the rope with the cane attached and exit right.
;   5. Use the ring to throw it onto the left hook. (The rope descends on the left)
;   6. Collect the ring and repeat with the right hook to jump over to the right side of the room
;      at the top.
;   7. In the rightmost room, jump across the ropes to collect the spell.
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
objectid_cane                         = 7
objectid_fire1                        = 3
objectid_fire2                        = 4
objectid_magnet                       = 3
objectid_old_player                   = 11
objectid_old_player_accessory         = 12
objectid_old_ring                     = 13
objectid_player                       = 0
objectid_player_accessory             = 1
objectid_ring                         = 2
objectid_room1_left_hook              = 5
objectid_room1_right_hook             = 6
objectid_room2_left_hook              = 3
objectid_room2_right_hook             = 5
objectid_sea_lion_head                = 5
objectid_short_bar                    = 4
objectid_short_left_rope              = 4
objectid_short_right_rope             = 6
opcode_jmp                            = 76
ring_on_magnet                        = 3
ring_on_room1_left_hook               = 4
ring_on_room1_right_hook              = 5
ring_on_room2_left_hook               = 1
ring_on_room2_right_hook              = 2
sprite_op_flags_copy_screen           = 1
sprite_op_flags_erase_to_bg_colour    = 2
sprite_op_flags_erase_to_fg_colour    = 4
sprite_op_flags_normal                = 0
spriteid_ball                         = 59
spriteid_boulder                      = 210
spriteid_brazier                      = 58
spriteid_cane                         = 221
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
spriteid_erase1                       = 202
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
spriteid_hook                         = 207
spriteid_hook_with_ring               = 208
spriteid_horizontal_bar               = 211
spriteid_horizontal_rope              = 205
spriteid_icodata_box                  = 9
spriteid_icodata_cat                  = 5
spriteid_icodata_disc                 = 3
spriteid_icodata_info                 = 7
spriteid_icodata_monkey               = 6
spriteid_icodata_password             = 8
spriteid_icodata_sound                = 2
spriteid_icodata_wizard               = 4
spriteid_icon_background              = 1
spriteid_left_bar                     = 212
spriteid_left_hook                    = 203
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
spriteid_rght_hook                    = 204
spriteid_right_bar                    = 213
spriteid_ring                         = 200
spriteid_ring_menu_item               = 201
spriteid_rope                         = 206
spriteid_rope1                        = 85
spriteid_rope2                        = 86
spriteid_rope3                        = 87
spriteid_rope4                        = 88
spriteid_rope_end                     = 10
spriteid_rope_hook                    = 11
spriteid_rope_with_magnet             = 214
spriteid_sea_lion_body                = 216
spriteid_sea_lion_head1               = 217
spriteid_sea_lion_head2a              = 218
spriteid_sea_lion_head2b              = 219
spriteid_short_bar                    = 215
spriteid_short_rope                   = 209
spriteid_sparkles1                    = 34
spriteid_sparkles2                    = 35
spriteid_sparkles3                    = 36
spriteid_sparkles4                    = 37
spriteid_sparkles5                    = 38
spriteid_table                        = 220
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
remember_a                                          = $70
room_exit_direction                                 = $70
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
save_game_level_p_ring_animation                    = $0a62
save_game_level_p_ring_animation_step               = $0a63
save_game_level_p_ring_x_low                        = $0a64
save_game_level_p_ring_x_high                       = $0a65
save_game_level_p_ring_direction_without_bounces    = $0a66
save_game_level_p_ring_direction_with_bounces       = $0a67
save_game_level_p_ring_room                         = $0a68
save_game_level_p_ring_y_low                        = $0a69
save_game_level_p_ring_y_high                       = $0a6a
save_game_level_p_left_hook_y                       = $0a6b
save_game_level_p_left_hook_speed                   = $0a6c
save_game_level_p_magnet_x                          = $0a6d
save_game_level_p_magnet_direction                  = $0a6e
fast_forward_ring_movement_steps                    = $0a6f
ring_bounce_cycle_animation_step                    = $0a70
ring_y_position                                     = $0a71
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
    !word sprite_data - level_data                                    ; 3ad5: 67 0b                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f4 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 17 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
room_index_cheat1
    !byte 1                                                           ; 3add: 01
room_index_cheat2
    !byte 1                                                           ; 3ade: 01
level_room_data_table
    !word room_0_data                                                 ; 3adf: 68 40                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: 3c 3b
    !word room_2_data                                                 ; 3ae3: af 3c
    !word room_3_data                                                 ; 3ae5: b8 3f

; *************************************************************************************
; 'TENDER-HOOKS[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $9f, $8e, $85, $8f, $8e, $99, $e6, $83, $84, $84, $80, $98  ; 3ae7: 9f 8e 85...
    !byte $c6                                                         ; 3af3: c6

; *************************************************************************************
; 
; Level initialisation
; 
; This is called whenever a new room is entered.
; 
; *************************************************************************************
; check for level change (branch if not)
level_specific_initialisation
    lda current_level                                                 ; 3af4: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3af6: c5 51
    beq set_rock_tiles                                                ; 3af8: f0 14
    lda developer_flags                                               ; 3afa: ad 03 11
    bpl developer_mode_inactive                                       ; 3afd: 10 05
    lda #$ff                                                          ; 3aff: a9 ff
    sta save_game_level_p_ring_animation                              ; 3b01: 8d 62 0a
developer_mode_inactive
    lda save_game_level_p_ring_animation                              ; 3b04: ad 62 0a
    bpl set_rock_tiles                                                ; 3b07: 10 05
    lda #spriteid_ring_menu_item                                      ; 3b09: a9 c9
    jsr find_or_create_menu_slot_for_A                                ; 3b0b: 20 bd 2b
set_rock_tiles
    lda #<ground_fill_2x2_top_left                                    ; 3b0e: a9 1c
    sta source_sprite_memory_low                                      ; 3b10: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3b12: a9 46
    sta source_sprite_memory_high                                     ; 3b14: 85 41
    rts                                                               ; 3b16: 60

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
    jsr update_sea_lion_and_ring                                      ; 3b17: 20 e2 40
    jsr update_magnet_and_rod                                         ; 3b1a: 20 a5 41
    jsr update_ring                                                   ; 3b1d: 20 24 43
    jsr room_2_update_handler                                         ; 3b20: 20 34 3d
    jsr room_1_update_handler                                         ; 3b23: 20 c3 3b
    jsr room_3_update_handler                                         ; 3b26: 20 4a 40
    rts                                                               ; 3b29: 60

draw_rock_in_top_corner_cells
    ldx #3                                                            ; 3b2a: a2 03
    ldy #2                                                            ; 3b2c: a0 02
    lda #1                                                            ; 3b2e: a9 01
    sta width_in_cells                                                ; 3b30: 85 3c
    sta height_in_cells                                               ; 3b32: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b34: 20 bb 1a
    ldx #$24 ; '$'                                                    ; 3b37: a2 24
    jmp copy_rectangle_of_memory_to_screen                            ; 3b39: 4c bb 1a

; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 20                                                          ; 3b3c: 14                      ; initial player X cell
    !byte 22                                                          ; 3b3d: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####                                ####
; ###                                  ###
; ###                                  ###
; ###
; ###
; ###
; ###
; ######                            ######
; ######              S             ######
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; 
; 
; 
; 
; ######              P             ######
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_1_code
    ldx #0                                                            ; 3b3e: a2 00
    ldy #0                                                            ; 3b40: a0 00
    lda #$ff                                                          ; 3b42: a9 ff
    sta width_in_cells                                                ; 3b44: 85 3c
    lda #2                                                            ; 3b46: a9 02
    sta height_in_cells                                               ; 3b48: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b4a: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3b4d: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3b4f: 20 bb 1a
; draw 3x15 rectangle at (0,2)
    ldy #2                                                            ; 3b52: a0 02
    lda #3                                                            ; 3b54: a9 03
    sta width_in_cells                                                ; 3b56: 85 3c
    lda #$0f                                                          ; 3b58: a9 0f
    sta height_in_cells                                               ; 3b5a: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b5c: 20 bb 1a
; draw 3x3 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3b5f: a2 25
    lda #3                                                            ; 3b61: a9 03
    sta height_in_cells                                               ; 3b63: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b65: 20 bb 1a
; draw 3x8 rectangle at (37,9)
    ldy #9                                                            ; 3b68: a0 09
    lda #8                                                            ; 3b6a: a9 08
    sta height_in_cells                                               ; 3b6c: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b6e: 20 bb 1a
; draw 3x2 rectangle at (3,9)
    ldx #3                                                            ; 3b71: a2 03
    lda #2                                                            ; 3b73: a9 02
    sta height_in_cells                                               ; 3b75: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b77: 20 bb 1a
; draw 3x2 rectangle at (34,9)
    ldx #$22 ; '"'                                                    ; 3b7a: a2 22
    jsr copy_rectangle_of_memory_to_screen                            ; 3b7c: 20 bb 1a
; draw 6x1 rectangle at (34,21)
    ldy #$15                                                          ; 3b7f: a0 15
    lda #6                                                            ; 3b81: a9 06
    sta width_in_cells                                                ; 3b83: 85 3c
    dec height_in_cells                                               ; 3b85: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b87: 20 bb 1a
; draw 6x1 rectangle at (0,21)
    ldx #0                                                            ; 3b8a: a2 00
    jsr copy_rectangle_of_memory_to_screen                            ; 3b8c: 20 bb 1a
    jsr draw_rock_in_top_corner_cells                                 ; 3b8f: 20 2a 3b
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3b92: 20 90 1b
; draw ball at (20,10)
    ldx #$14                                                          ; 3b95: a2 14
    ldy #$0a                                                          ; 3b97: a0 0a
    lda #spriteid_ball                                                ; 3b99: a9 3b
    jsr draw_sprite_a_at_cell_xy                                      ; 3b9b: 20 4c 1f
    lda #collision_map_solid_rock                                     ; 3b9e: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3ba0: 20 bb 1e
    jsr start_room                                                    ; 3ba3: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 3ba6: 20 da 12
    sta room_exit_direction                                           ; 3ba9: 85 70
    and #exit_room_left                                               ; 3bab: 29 01
    beq room_1_check_right_exit                                       ; 3bad: f0 07
    ldx #0                                                            ; 3baf: a2 00
    ldy current_level                                                 ; 3bb1: a4 31
    jmp initialise_level_and_room                                     ; 3bb3: 4c 40 11

room_1_check_right_exit
    lda room_exit_direction                                           ; 3bb6: a5 70
    and #exit_room_right                                              ; 3bb8: 29 04
    beq room_1_game_update_loop                                       ; 3bba: f0 ea
    ldx #2                                                            ; 3bbc: a2 02
    ldy current_level                                                 ; 3bbe: a4 31
    jmp initialise_level_and_room                                     ; 3bc0: 4c 40 11

room_1_update_handler
    lda #1                                                            ; 3bc3: a9 01
    sta currently_updating_logic_for_room_index                       ; 3bc5: 8d ba 1a
; update braziers
    ldx #$14                                                          ; 3bc8: a2 14
    ldy #$0a                                                          ; 3bca: a0 0a
    lda #objectid_fire1                                               ; 3bcc: a9 03
    jsr update_brazier_and_fire                                       ; 3bce: 20 88 19
    inx                                                               ; 3bd1: e8
    lda #objectid_fire2                                               ; 3bd2: a9 04
    jsr update_brazier_and_fire                                       ; 3bd4: 20 88 19
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 3bd7: ad 2b 13
    beq room_1_not_first_update                                       ; 3bda: f0 5a
    lda desired_room_index                                            ; 3bdc: a5 30
    cmp #1                                                            ; 3bde: c9 01
    bne set_ring_sprites_local1                                       ; 3be0: d0 51
    ldx #$0a                                                          ; 3be2: a2 0a
    ldy #2                                                            ; 3be4: a0 02
    lda #$0e                                                          ; 3be6: a9 0e
    jsr draw_rope                                                     ; 3be8: 20 b9 1d
    ldy #$0f                                                          ; 3beb: a0 0f
    lda #sprite_op_flags_erase_to_fg_colour                           ; 3bed: a9 04
    sta sprite_op_flags                                               ; 3bef: 85 15
    lda #spriteid_rope_end                                            ; 3bf1: a9 0a
    jsr draw_sprite_a_at_cell_xy                                      ; 3bf3: 20 4c 1f
    lda #objectid_room1_left_hook                                     ; 3bf6: a9 05
    jsr set_object_position_from_cell_xy                              ; 3bf8: 20 5d 1f
    ldx #$1d                                                          ; 3bfb: a2 1d
    ldy #2                                                            ; 3bfd: a0 02
    lda #$0e                                                          ; 3bff: a9 0e
    jsr draw_rope                                                     ; 3c01: 20 b9 1d
    ldy #$0f                                                          ; 3c04: a0 0f
    lda #sprite_op_flags_erase_to_fg_colour                           ; 3c06: a9 04
    sta sprite_op_flags                                               ; 3c08: 85 15
    lda #spriteid_rope_end                                            ; 3c0a: a9 0a
    jsr draw_sprite_a_at_cell_xy                                      ; 3c0c: 20 4c 1f
    lda #objectid_short_right_rope                                    ; 3c0f: a9 06
    jsr set_object_position_from_cell_xy                              ; 3c11: 20 5d 1f
    lda #objectid_cane                                                ; 3c14: a9 07
    jsr set_object_position_from_cell_xy                              ; 3c16: 20 5d 1f
    lda #spriteid_cane                                                ; 3c19: a9 dd
    sta object_spriteid + objectid_cane                               ; 3c1b: 8d af 09
    lda #$c0                                                          ; 3c1e: a9 c0
    sta object_z_order + objectid_cane                                ; 3c20: 8d c9 38
    iny                                                               ; 3c23: c8
    lda #1                                                            ; 3c24: a9 01
    sta width_in_cells                                                ; 3c26: 85 3c
    lda #4                                                            ; 3c28: a9 04
    sta height_in_cells                                               ; 3c2a: 85 3d
    lda #collision_map_rope                                           ; 3c2c: a9 02
    sta value_to_write_to_collision_map                               ; 3c2e: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3c30: 20 44 1e
set_ring_sprites_local1
    jmp set_ring_sprites                                              ; 3c33: 4c 86 3c

room_1_not_first_update
    lda save_game_level_p_ring_animation                              ; 3c36: ad 62 0a
    cmp #ring_on_room1_left_hook                                      ; 3c39: c9 04
    beq ring_is_on_room1_left_hook                                    ; 3c3b: f0 3a
    cmp #ring_on_room1_right_hook                                     ; 3c3d: c9 05
    beq ring_is_on_room1_right_hook                                   ; 3c3f: f0 3a
    lda desired_room_index                                            ; 3c41: a5 30
    cmp #1                                                            ; 3c43: c9 01
    bne set_ring_sprites                                              ; 3c45: d0 3f
    lda save_game_level_p_ring_direction_with_bounces                 ; 3c47: ad 67 0a
    bmi set_ring_sprites                                              ; 3c4a: 30 3a
    ldx #objectid_room1_left_hook                                     ; 3c4c: a2 05
    jsr check_for_hook_x_collision_with_ring                          ; 3c4e: 20 56 3e
    beq set_ring_sprites_local2                                       ; 3c51: f0 0d
    lda #spriteid_one_pixel_masked_out                                ; 3c53: a9 00
    sta object_spriteid + objectid_ring                               ; 3c55: 8d aa 09
    lda #ring_on_room1_left_hook                                      ; 3c58: a9 04
    sta save_game_level_p_ring_animation                              ; 3c5a: 8d 62 0a
    jmp set_ring_sprites                                              ; 3c5d: 4c 86 3c

set_ring_sprites_local2
    jmp set_ring_sprites                                              ; 3c60: 4c 86 3c

; unused code
    ldx #objectid_room1_right_hook                                    ; 3c63: a2 06
    jsr check_for_hook_x_collision_with_ring                          ; 3c65: 20 56 3e
    beq set_ring_sprites                                              ; 3c68: f0 1c
    lda #spriteid_one_pixel_masked_out                                ; 3c6a: a9 00
    sta object_spriteid + objectid_ring                               ; 3c6c: 8d aa 09
    lda #ring_on_room1_right_hook                                     ; 3c6f: a9 05
    sta save_game_level_p_ring_animation                              ; 3c71: 8d 62 0a
    jmp set_ring_sprites                                              ; 3c74: 4c 86 3c

ring_is_on_room1_left_hook
    ldx #objectid_room1_left_hook                                     ; 3c77: a2 05
    bne got_hook_sprite_in_x                                          ; 3c79: d0 02                   ; ALWAYS branch

ring_is_on_room1_right_hook
    ldx #objectid_room1_right_hook                                    ; 3c7b: a2 06
got_hook_sprite_in_x
    lda desired_room_index                                            ; 3c7d: a5 30
    cmp #1                                                            ; 3c7f: c9 01
    bne set_ring_sprites                                              ; 3c81: d0 03
    jsr check_for_picking_up_ring_from_hook_x                         ; 3c83: 20 89 3e
set_ring_sprites
    lda desired_room_index                                            ; 3c86: a5 30
    cmp #1                                                            ; 3c88: c9 01
    bne return1                                                       ; 3c8a: d0 22
    lda #spriteid_hook                                                ; 3c8c: a9 cf
    sta object_spriteid + objectid_room1_left_hook                    ; 3c8e: 8d ad 09
    lda save_game_level_p_ring_animation                              ; 3c91: ad 62 0a
    cmp #ring_on_room1_left_hook                                      ; 3c94: c9 04
    bne set_ring_sprite                                               ; 3c96: d0 05
    lda #spriteid_hook_with_ring                                      ; 3c98: a9 d0
    sta object_spriteid + objectid_room1_left_hook                    ; 3c9a: 8d ad 09
set_ring_sprite
    lda #spriteid_hook                                                ; 3c9d: a9 cf
    sta object_spriteid + objectid_room1_right_hook                   ; 3c9f: 8d ae 09
    lda save_game_level_p_ring_animation                              ; 3ca2: ad 62 0a
    cmp #ring_on_room1_right_hook                                     ; 3ca5: c9 05
    bne return1                                                       ; 3ca7: d0 05
    lda #spriteid_hook_with_ring                                      ; 3ca9: a9 d0
    sta object_spriteid + objectid_room1_right_hook                   ; 3cab: 8d ae 09
return1
    rts                                                               ; 3cae: 60

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 20                                                          ; 3caf: 14                      ; initial player X cell
    !byte 22                                                          ; 3cb0: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####                                ####
; ###                                  ###
; ###                                  ###
; 
; 
; 
; 
; ######         ##########         ######
; ######         ##########         ######
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; 
; 
; 
; 
; ######              P             ######
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_2_code
    ldx #0                                                            ; 3cb1: a2 00
    ldy #0                                                            ; 3cb3: a0 00
    lda #$ff                                                          ; 3cb5: a9 ff
    sta width_in_cells                                                ; 3cb7: 85 3c
    lda #2                                                            ; 3cb9: a9 02
    sta height_in_cells                                               ; 3cbb: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3cbd: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3cc0: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3cc2: 20 bb 1a
; draw 3x3 rectangle at (0,2)
    ldy #2                                                            ; 3cc5: a0 02
    lda #3                                                            ; 3cc7: a9 03
    sta width_in_cells                                                ; 3cc9: 85 3c
    sta height_in_cells                                               ; 3ccb: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ccd: 20 bb 1a
; draw 3x3 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3cd0: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 3cd2: 20 bb 1a
; draw 3x8 rectangle at (0,9)
    ldx #0                                                            ; 3cd5: a2 00
    ldy #9                                                            ; 3cd7: a0 09
    lda #8                                                            ; 3cd9: a9 08
    sta height_in_cells                                               ; 3cdb: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3cdd: 20 bb 1a
; draw 3x8 rectangle at (37,9)
    ldx #$25 ; '%'                                                    ; 3ce0: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 3ce2: 20 bb 1a
; draw 3x2 rectangle at (3,9)
    ldx #3                                                            ; 3ce5: a2 03
    lda #2                                                            ; 3ce7: a9 02
    sta height_in_cells                                               ; 3ce9: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ceb: 20 bb 1a
; draw 3x2 rectangle at (34,9)
    ldx #$22 ; '"'                                                    ; 3cee: a2 22
    jsr copy_rectangle_of_memory_to_screen                            ; 3cf0: 20 bb 1a
; draw 10x2 rectangle at (15,9)
    ldx #$0f                                                          ; 3cf3: a2 0f
    lda #$0a                                                          ; 3cf5: a9 0a
    sta width_in_cells                                                ; 3cf7: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3cf9: 20 bb 1a
; draw 6x1 rectangle at (0,21)
    ldx #0                                                            ; 3cfc: a2 00
    ldy #$15                                                          ; 3cfe: a0 15
    lda #6                                                            ; 3d00: a9 06
    sta width_in_cells                                                ; 3d02: 85 3c
    dec height_in_cells                                               ; 3d04: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d06: 20 bb 1a
; draw 6x1 rectangle at (34,21)
    ldx #$22 ; '"'                                                    ; 3d09: a2 22
    jsr copy_rectangle_of_memory_to_screen                            ; 3d0b: 20 bb 1a
    jsr draw_rock_in_top_corner_cells                                 ; 3d0e: 20 2a 3b
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3d11: 20 90 1b
    jsr start_room                                                    ; 3d14: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 3d17: 20 da 12
    sta room_exit_direction                                           ; 3d1a: 85 70
    and #exit_room_left                                               ; 3d1c: 29 01
    beq room_2_check_right_exit                                       ; 3d1e: f0 07
    ldx #1                                                            ; 3d20: a2 01
    ldy current_level                                                 ; 3d22: a4 31
    jmp initialise_level_and_room                                     ; 3d24: 4c 40 11

room_2_check_right_exit
    lda room_exit_direction                                           ; 3d27: a5 70
    and #exit_room_right                                              ; 3d29: 29 04
    beq room_2_game_update_loop                                       ; 3d2b: f0 ea
    ldx #3                                                            ; 3d2d: a2 03
    ldy current_level                                                 ; 3d2f: a4 31
    jmp initialise_level_and_room                                     ; 3d31: 4c 40 11

; check for first update in room (branch if so)
room_2_update_handler
    lda update_room_first_update_flag                                 ; 3d34: ad 2b 13
    bne initialise_room_2                                             ; 3d37: d0 03
    jmp room_2_not_first_update                                       ; 3d39: 4c f1 3d

; check for level change (branch if not)
initialise_room_2
    lda current_level                                                 ; 3d3c: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3d3e: c5 51
    beq position_room_2_hooks_and_rope                                ; 3d40: f0 30
    ldx #<envelope1                                                   ; 3d42: a2 f0
    ldy #>envelope1                                                   ; 3d44: a0 45
    jsr define_envelope                                               ; 3d46: 20 5e 39
    ldx #<envelope2                                                   ; 3d49: a2 06
    ldy #>envelope2                                                   ; 3d4b: a0 46
    jsr define_envelope                                               ; 3d4d: 20 5e 39
    lda save_game_level_p_left_hook_y                                 ; 3d50: ad 6b 0a
    beq set_left_hook_y_in_up_position                                ; 3d53: f0 13
    lda save_game_level_p_left_hook_speed                             ; 3d55: ad 6c 0a
    beq position_room_2_hooks_and_rope                                ; 3d58: f0 18
    bmi set_left_hook_y_in_up_position                                ; 3d5a: 30 0c
; set left hook low down and stopped
    lda #$78 ; 'x'                                                    ; 3d5c: a9 78
    sta save_game_level_p_left_hook_y                                 ; 3d5e: 8d 6b 0a
    lda #0                                                            ; 3d61: a9 00
    sta save_game_level_p_left_hook_speed                             ; 3d63: 8d 6c 0a
    beq position_room_2_hooks_and_rope                                ; 3d66: f0 0a
set_left_hook_y_in_up_position
    lda #$18                                                          ; 3d68: a9 18
    sta save_game_level_p_left_hook_y                                 ; 3d6a: 8d 6b 0a
    lda #0                                                            ; 3d6d: a9 00
    sta save_game_level_p_left_hook_speed                             ; 3d6f: 8d 6c 0a
position_room_2_hooks_and_rope
    lda desired_room_index                                            ; 3d72: a5 30
    cmp #2                                                            ; 3d74: c9 02
    bne set_hook_and_rope_objects_local1                              ; 3d76: d0 5c
    ldx #$0a                                                          ; 3d78: a2 0a
    ldy #0                                                            ; 3d7a: a0 00
    lda #objectid_room2_left_hook                                     ; 3d7c: a9 03
    jsr set_object_position_from_cell_xy                              ; 3d7e: 20 5d 1f
    lda #objectid_short_left_rope                                     ; 3d81: a9 04
    jsr set_object_position_from_cell_xy                              ; 3d83: 20 5d 1f
    lda #$c0                                                          ; 3d86: a9 c0
    sta object_z_order + objectid_short_left_rope                     ; 3d88: 8d c6 38
    ldx #$1d                                                          ; 3d8b: a2 1d
    lda #objectid_room2_right_hook                                    ; 3d8d: a9 05
    jsr set_object_position_from_cell_xy                              ; 3d8f: 20 5d 1f
    lda #objectid_short_right_rope                                    ; 3d92: a9 06
    jsr set_object_position_from_cell_xy                              ; 3d94: 20 5d 1f
    lda #$c0                                                          ; 3d97: a9 c0
    sta object_z_order + objectid_short_right_rope                    ; 3d99: 8d c8 38
    ldx #$0a                                                          ; 3d9c: a2 0a
    ldy #2                                                            ; 3d9e: a0 02
    lda #spriteid_left_hook                                           ; 3da0: a9 cb
    jsr draw_sprite_a_at_cell_xy                                      ; 3da2: 20 4c 1f
    lda #collision_map_solid_rock                                     ; 3da5: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3da7: 20 bb 1e
    inx                                                               ; 3daa: e8
    inx                                                               ; 3dab: e8
    lda #spriteid_horizontal_rope                                     ; 3dac: a9 cd
draw_horizontal_rope_loop
    jsr draw_sprite_a_at_cell_xy                                      ; 3dae: 20 4c 1f
    inx                                                               ; 3db1: e8
    cpx #$1c                                                          ; 3db2: e0 1c
    bcc draw_horizontal_rope_loop                                     ; 3db4: 90 f8
    inx                                                               ; 3db6: e8
    lda #spriteid_rght_hook                                           ; 3db7: a9 cc
    jsr draw_sprite_a_at_cell_xy                                      ; 3db9: 20 4c 1f
    lda #collision_map_solid_rock                                     ; 3dbc: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3dbe: 20 bb 1e
    ldx #$0a                                                          ; 3dc1: a2 0a
    lda save_game_level_p_left_hook_y                                 ; 3dc3: ad 6b 0a
    jsr calculate_rope_y_in_cells_and_draw_it                         ; 3dc6: 20 d7 3d
    ldx #$1d                                                          ; 3dc9: a2 1d
    lda #$90                                                          ; 3dcb: a9 90
    sec                                                               ; 3dcd: 38
    sbc save_game_level_p_left_hook_y                                 ; 3dce: ed 6b 0a
    jsr calculate_rope_y_in_cells_and_draw_it                         ; 3dd1: 20 d7 3d
set_hook_and_rope_objects_local1
    jmp set_hook_and_rope_objects                                     ; 3dd4: 4c 03 3f

calculate_rope_y_in_cells_and_draw_it
    sec                                                               ; 3dd7: 38
    sbc #4                                                            ; 3dd8: e9 04
    lsr                                                               ; 3dda: 4a
    lsr                                                               ; 3ddb: 4a
    lsr                                                               ; 3ddc: 4a
    tay                                                               ; 3ddd: a8
    jmp draw_right_rope                                               ; 3dde: 4c ec 3d

draw_right_rope_loop
    lda #spriteid_rope                                                ; 3de1: a9 ce
    jsr draw_sprite_a_at_cell_xy                                      ; 3de3: 20 4c 1f
    lda #collision_map_rope                                           ; 3de6: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3de8: 20 bb 1e
    dey                                                               ; 3deb: 88
draw_right_rope
    cpy #3                                                            ; 3dec: c0 03
    bcs draw_right_rope_loop                                          ; 3dee: b0 f1
    rts                                                               ; 3df0: 60

room_2_not_first_update
    lda save_game_level_p_ring_animation                              ; 3df1: ad 62 0a
    cmp #ring_on_room2_left_hook                                      ; 3df4: c9 01
    beq ring_is_on_room_2_left_hook                                   ; 3df6: f0 7f
    cmp #ring_on_room2_right_hook                                     ; 3df8: c9 02
    beq ring_is_on_room_2_right_hook                                  ; 3dfa: f0 7f
    lda save_game_level_p_left_hook_speed                             ; 3dfc: ad 6c 0a
    beq room_2_left_hook_stationary                                   ; 3dff: f0 03
    jmp add_speed_to_left_hook_y                                      ; 3e01: 4c aa 3e

room_2_left_hook_stationary
    lda desired_room_index                                            ; 3e04: a5 30
    cmp #2                                                            ; 3e06: c9 02
    bne set_hook_and_rope_objects_local2                              ; 3e08: d0 49
    lda save_game_level_p_ring_animation                              ; 3e0a: ad 62 0a
    cmp #ring_fall_to_side_animation - ring_animations                ; 3e0d: c9 06
    bcc set_hook_and_rope_objects_local2                              ; 3e0f: 90 42
    lda save_game_level_p_ring_direction_with_bounces                 ; 3e11: ad 67 0a
    bmi set_hook_and_rope_objects_local2                              ; 3e14: 30 3d
; handle left hook
    ldx #objectid_room2_left_hook                                     ; 3e16: a2 03
    jsr check_for_hook_x_collision_with_ring                          ; 3e18: 20 56 3e
    beq handle_right_hook                                             ; 3e1b: f0 19
    lda #spriteid_one_pixel_masked_out                                ; 3e1d: a9 00
    sta object_spriteid + objectid_ring                               ; 3e1f: 8d aa 09
    lda #ring_on_room2_left_hook                                      ; 3e22: a9 01
    sta save_game_level_p_ring_animation                              ; 3e24: 8d 62 0a
    lda save_game_level_p_left_hook_y                                 ; 3e27: ad 6b 0a
    cmp #$78 ; 'x'                                                    ; 3e2a: c9 78
    beq set_hook_and_rope_objects_local2                              ; 3e2c: f0 25
    lda #4                                                            ; 3e2e: a9 04
    sta save_game_level_p_left_hook_speed                             ; 3e30: 8d 6c 0a
    jmp set_hook_and_rope_objects                                     ; 3e33: 4c 03 3f

handle_right_hook
    ldx #objectid_room2_right_hook                                    ; 3e36: a2 05
    jsr check_for_hook_x_collision_with_ring                          ; 3e38: 20 56 3e
    beq set_hook_and_rope_objects_local2                              ; 3e3b: f0 16
    lda #spriteid_one_pixel_masked_out                                ; 3e3d: a9 00
    sta object_spriteid + objectid_ring                               ; 3e3f: 8d aa 09
    lda #ring_on_room2_right_hook                                     ; 3e42: a9 02
    sta save_game_level_p_ring_animation                              ; 3e44: 8d 62 0a
    lda save_game_level_p_left_hook_y                                 ; 3e47: ad 6b 0a
    cmp #$18                                                          ; 3e4a: c9 18
    beq set_hook_and_rope_objects_local2                              ; 3e4c: f0 05
    lda #$fc                                                          ; 3e4e: a9 fc
    sta save_game_level_p_left_hook_speed                             ; 3e50: 8d 6c 0a
set_hook_and_rope_objects_local2
    jmp set_hook_and_rope_objects                                     ; 3e53: 4c 03 3f

check_for_hook_x_collision_with_ring
    lda #7                                                            ; 3e56: a9 07
    sta temp_top_offset                                               ; 3e58: 8d 50 25
    lda #$fa                                                          ; 3e5b: a9 fa
    sta temp_bottom_offset                                            ; 3e5d: 8d 51 25
    lda #7                                                            ; 3e60: a9 07
    sta temp_left_offset                                              ; 3e62: 8d d0 24
    lda #$f9                                                          ; 3e65: a9 f9
    sta temp_right_offset                                             ; 3e67: 8d d1 24
    ldy #objectid_old_ring                                            ; 3e6a: a0 0d
    jsr test_for_collision_between_objects_x_and_y                    ; 3e6c: 20 e2 28
    pha                                                               ; 3e6f: 48
    beq skip_playing_hook_to_ring_collision_sound                     ; 3e70: f0 03
    jsr play_ring_sound                                               ; 3e72: 20 af 3f
skip_playing_hook_to_ring_collision_sound
    pla                                                               ; 3e75: 68
    rts                                                               ; 3e76: 60

ring_is_on_room_2_left_hook
    ldx #objectid_room2_left_hook                                     ; 3e77: a2 03
    bne check_for_picking_up_ring_if_in_room_2                        ; 3e79: d0 02                   ; ALWAYS branch

ring_is_on_room_2_right_hook
    ldx #objectid_room2_right_hook                                    ; 3e7b: a2 05
check_for_picking_up_ring_if_in_room_2
    lda desired_room_index                                            ; 3e7d: a5 30
    cmp #2                                                            ; 3e7f: c9 02
    bne add_speed_to_left_hook_y                                      ; 3e81: d0 27
    jsr check_for_picking_up_ring_from_hook_x                         ; 3e83: 20 89 3e
    jmp add_speed_to_left_hook_y                                      ; 3e86: 4c aa 3e

check_for_picking_up_ring_from_hook_x
    lda #8                                                            ; 3e89: a9 08
    sta temp_top_offset                                               ; 3e8b: 8d 50 25
    lda #3                                                            ; 3e8e: a9 03
    sta temp_left_offset                                              ; 3e90: 8d d0 24
    lda #$fe                                                          ; 3e93: a9 fe
    sta temp_right_offset                                             ; 3e95: 8d d1 24
    ldy #objectid_old_player                                          ; 3e98: a0 0b
    jsr test_for_collision_between_objects_x_and_y                    ; 3e9a: 20 e2 28
    beq return2                                                       ; 3e9d: f0 0a
    lda #$ff                                                          ; 3e9f: a9 ff
    sta save_game_level_p_ring_animation                              ; 3ea1: 8d 62 0a
    lda #spriteid_ring_menu_item                                      ; 3ea4: a9 c9
    jsr find_or_create_menu_slot_for_A                                ; 3ea6: 20 bd 2b
return2
    rts                                                               ; 3ea9: 60

add_speed_to_left_hook_y
    lda save_game_level_p_left_hook_speed                             ; 3eaa: ad 6c 0a
    beq set_hook_and_rope_objects                                     ; 3ead: f0 54
    sta remember_left_hook_speed                                      ; 3eaf: 8d 5e 3f
    clc                                                               ; 3eb2: 18
    adc save_game_level_p_left_hook_y                                 ; 3eb3: 6d 6b 0a
    sta save_game_level_p_left_hook_y                                 ; 3eb6: 8d 6b 0a
    ldx #$18                                                          ; 3eb9: a2 18
    cmp #$19                                                          ; 3ebb: c9 19
    bcc store_left_hook_y                                             ; 3ebd: 90 06
    ldx #$78 ; 'x'                                                    ; 3ebf: a2 78
    cmp #$78 ; 'x'                                                    ; 3ec1: c9 78
    bcc play_rope_movement_sound_if_in_room_2                         ; 3ec3: 90 08
store_left_hook_y
    stx save_game_level_p_left_hook_y                                 ; 3ec5: 8e 6b 0a
    lda #0                                                            ; 3ec8: a9 00
    sta save_game_level_p_left_hook_speed                             ; 3eca: 8d 6c 0a
play_rope_movement_sound_if_in_room_2
    lda desired_room_index                                            ; 3ecd: a5 30
    cmp #2                                                            ; 3ecf: c9 02
    bne set_hook_and_rope_objects                                     ; 3ed1: d0 30
    lda #0                                                            ; 3ed3: a9 00
    ldx #<sound1                                                      ; 3ed5: a2 fe
    ldy #>sound1                                                      ; 3ed7: a0 45
    jsr play_sound_yx                                                 ; 3ed9: 20 f6 38
    lda #spriteid_one_pixel_masked_out                                ; 3edc: a9 00
    sta object_spriteid_old + objectid_short_left_rope                ; 3ede: 8d b7 09
    sta object_spriteid + objectid_short_left_rope                    ; 3ee1: 8d ac 09
    lda remember_left_hook_speed                                      ; 3ee4: ad 5e 3f
    bmi stop_drawing_short_right_rope                                 ; 3ee7: 30 05
    lda #spriteid_short_rope                                          ; 3ee9: a9 d1
    sta object_spriteid + objectid_short_left_rope                    ; 3eeb: 8d ac 09
stop_drawing_short_right_rope
    lda #spriteid_one_pixel_masked_out                                ; 3eee: a9 00
    sta object_spriteid_old + objectid_short_right_rope               ; 3ef0: 8d b9 09
    sta object_spriteid + objectid_short_right_rope                   ; 3ef3: 8d ae 09
    lda remember_left_hook_speed                                      ; 3ef6: ad 5e 3f
    bpl hook_moving_down                                              ; 3ef9: 10 05
    lda #spriteid_short_rope                                          ; 3efb: a9 d1
    sta object_spriteid + objectid_short_right_rope                   ; 3efd: 8d ae 09
hook_moving_down
    jsr check_for_monkey_on_rope                                      ; 3f00: 20 5f 3f
set_hook_and_rope_objects
    lda desired_room_index                                            ; 3f03: a5 30
    cmp #2                                                            ; 3f05: c9 02
    bne return3                                                       ; 3f07: d0 41
; update room 2 left hook and rope
    lda save_game_level_p_left_hook_y                                 ; 3f09: ad 6b 0a
    sta object_y_low + objectid_room2_left_hook                       ; 3f0c: 8d 7f 09
    sta object_y_low + objectid_short_left_rope                       ; 3f0f: 8d 80 09
    ldx #$0a                                                          ; 3f12: a2 0a
    jsr update_rope_collision_map                                     ; 3f14: 20 4b 3f
    lda #spriteid_hook                                                ; 3f17: a9 cf
    sta object_spriteid + objectid_room2_left_hook                    ; 3f19: 8d ab 09
    lda save_game_level_p_ring_animation                              ; 3f1c: ad 62 0a
    cmp #ring_on_room2_left_hook                                      ; 3f1f: c9 01
    bne update_room2_right_hook_and_rope                              ; 3f21: d0 05
    lda #spriteid_hook_with_ring                                      ; 3f23: a9 d0
    sta object_spriteid + objectid_room2_left_hook                    ; 3f25: 8d ab 09
update_room2_right_hook_and_rope
    lda #$90                                                          ; 3f28: a9 90
    sec                                                               ; 3f2a: 38
    sbc save_game_level_p_left_hook_y                                 ; 3f2b: ed 6b 0a
    sta object_y_low + objectid_room2_right_hook                      ; 3f2e: 8d 81 09
    sta object_y_low + objectid_short_right_rope                      ; 3f31: 8d 82 09
    ldx #$1d                                                          ; 3f34: a2 1d
    jsr update_rope_collision_map                                     ; 3f36: 20 4b 3f
    lda #spriteid_hook                                                ; 3f39: a9 cf
    sta object_spriteid + objectid_room2_right_hook                   ; 3f3b: 8d ad 09
    lda save_game_level_p_ring_animation                              ; 3f3e: ad 62 0a
    cmp #ring_on_room2_right_hook                                     ; 3f41: c9 02
    bne return3                                                       ; 3f43: d0 05
    lda #spriteid_hook_with_ring                                      ; 3f45: a9 d0
    sta object_spriteid + objectid_room2_right_hook                   ; 3f47: 8d ad 09
return3
    rts                                                               ; 3f4a: 60

update_rope_collision_map
    lsr                                                               ; 3f4b: 4a
    lsr                                                               ; 3f4c: 4a
    lsr                                                               ; 3f4d: 4a
    tay                                                               ; 3f4e: a8
    cpy #3                                                            ; 3f4f: c0 03
    bcc clear_collision_map_of_rope                                   ; 3f51: 90 05
    lda #collision_map_rope                                           ; 3f53: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3f55: 20 bb 1e
clear_collision_map_of_rope
    iny                                                               ; 3f58: c8
    lda #collision_map_none                                           ; 3f59: a9 00
    jmp write_a_single_value_to_cell_in_collision_map                 ; 3f5b: 4c bb 1e

remember_left_hook_speed
    !byte 0                                                           ; 3f5e: 00

check_for_monkey_on_rope
    lda current_player_character                                      ; 3f5f: a5 48
    cmp #spriteid_icodata_monkey                                      ; 3f61: c9 06
    bne return4                                                       ; 3f63: d0 49
    lda current_player_animation                                      ; 3f65: ad df 09
    cmp #monkey_climb_animation - monkey_base_animation               ; 3f68: c9 51
    beq player_is_monkey_on_rope                                      ; 3f6a: f0 08
    cmp #monkey_climb_idle_animation - monkey_base_animation          ; 3f6c: c9 45
    beq player_is_monkey_on_rope                                      ; 3f6e: f0 04
    cmp #monkey_climb_down_animation - monkey_base_animation          ; 3f70: c9 49
    bne return4                                                       ; 3f72: d0 3a
player_is_monkey_on_rope
    lda remember_left_hook_speed                                      ; 3f74: ad 5e 3f
    eor #$ff                                                          ; 3f77: 49 ff
    clc                                                               ; 3f79: 18
    adc #1                                                            ; 3f7a: 69 01
    ldx object_x_high                                                 ; 3f7c: ae 66 09
    bne adding_to_player_y_position_when_on_rope                      ; 3f7f: d0 0a
    ldx object_x_low                                                  ; 3f81: ae 50 09
    cpx #$a0                                                          ; 3f84: e0 a0
    bcs adding_to_player_y_position_when_on_rope                      ; 3f86: b0 03
    lda remember_left_hook_speed                                      ; 3f88: ad 5e 3f
adding_to_player_y_position_when_on_rope
    ldy #0                                                            ; 3f8b: a0 00
    tax                                                               ; 3f8d: aa
    bpl add_ay_to_player_y_position                                   ; 3f8e: 10 01
    dey                                                               ; 3f90: 88
add_ay_to_player_y_position
    clc                                                               ; 3f91: 18
    adc object_y_low                                                  ; 3f92: 6d 7c 09
    sta object_y_low                                                  ; 3f95: 8d 7c 09
    tya                                                               ; 3f98: 98
    adc object_y_high                                                 ; 3f99: 6d 92 09
    sta object_y_high                                                 ; 3f9c: 8d 92 09
    txa                                                               ; 3f9f: 8a
    clc                                                               ; 3fa0: 18
    adc object_y_low + objectid_player_accessory                      ; 3fa1: 6d 7d 09
    sta object_y_low + objectid_player_accessory                      ; 3fa4: 8d 7d 09
    tya                                                               ; 3fa7: 98
    adc object_y_high + objectid_player_accessory                     ; 3fa8: 6d 93 09
    sta object_y_high + objectid_player_accessory                     ; 3fab: 8d 93 09
return4
    rts                                                               ; 3fae: 60

play_ring_sound
    lda #0                                                            ; 3faf: a9 00
    ldx #<sound2                                                      ; 3fb1: a2 14
    ldy #>sound2                                                      ; 3fb3: a0 46
    jmp play_sound_yx                                                 ; 3fb5: 4c f6 38

; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 20                                                          ; 3fb8: 14                      ; initial player X cell
    !byte 22                                                          ; 3fb9: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####      |    |                    ####
; ###       |    |                     ###
; ###       |    |                     ###
;           |    |                     ###
;           |    |                     ###
;           |    |                     ###
;           |    |                     ###
; ######    |    |    ####################
; ######    |    |    ####################
; ###       |    |                     ###
; ###       |    |                     ###
; ###       |    |                     ###
; ###       |    |                     ###
; ###       |    |                     ###
; ###       |    |                     ###
;                                      ###
;                                      ###
;                                      ###
;                                OOOOOO###
; ######              P          OOOOOO###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_3_code
    ldx #0                                                            ; 3fba: a2 00
    ldy #0                                                            ; 3fbc: a0 00
    lda #$ff                                                          ; 3fbe: a9 ff
    sta width_in_cells                                                ; 3fc0: 85 3c
    lda #2                                                            ; 3fc2: a9 02
    sta height_in_cells                                               ; 3fc4: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fc6: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3fc9: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3fcb: 20 bb 1a
; draw 255x20 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3fce: a2 25
    ldy #2                                                            ; 3fd0: a0 02
    lda #$14                                                          ; 3fd2: a9 14
    sta height_in_cells                                               ; 3fd4: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fd6: 20 bb 1a
; draw 3x3 rectangle at (0,2)
    ldx #0                                                            ; 3fd9: a2 00
    lda #3                                                            ; 3fdb: a9 03
    sta width_in_cells                                                ; 3fdd: 85 3c
    sta height_in_cells                                               ; 3fdf: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fe1: 20 bb 1a
; draw 3x8 rectangle at (0,9)
    ldy #9                                                            ; 3fe4: a0 09
    lda #8                                                            ; 3fe6: a9 08
    sta height_in_cells                                               ; 3fe8: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fea: 20 bb 1a
; draw 3x2 rectangle at (3,9)
    ldx #3                                                            ; 3fed: a2 03
    lda #2                                                            ; 3fef: a9 02
    sta height_in_cells                                               ; 3ff1: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ff3: 20 bb 1a
; draw 17x2 rectangle at (20,9)
    ldx #$14                                                          ; 3ff6: a2 14
    lda #$11                                                          ; 3ff8: a9 11
    sta width_in_cells                                                ; 3ffa: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3ffc: 20 bb 1a
; draw 6x1 rectangle at (0,21)
    ldx #0                                                            ; 3fff: a2 00
    ldy #$15                                                          ; 4001: a0 15
    lda #6                                                            ; 4003: a9 06
    sta width_in_cells                                                ; 4005: 85 3c
    dec height_in_cells                                               ; 4007: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4009: 20 bb 1a
    jsr draw_rock_in_top_corner_cells                                 ; 400c: 20 2a 3b
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 400f: 20 90 1b
; draw table at (34,20) of size (3x2)
    lda #3                                                            ; 4012: a9 03
    sta width_in_cells                                                ; 4014: 85 3c
    lda #2                                                            ; 4016: a9 02
    sta height_in_cells                                               ; 4018: 85 3d
    ldx #$22 ; '"'                                                    ; 401a: a2 22
    ldy #$14                                                          ; 401c: a0 14
    lda #spriteid_table                                               ; 401e: a9 dc
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 4020: 20 57 1f
; draw boulder at (31,20) of size (3x2)
    dex                                                               ; 4023: ca
    dex                                                               ; 4024: ca
    dex                                                               ; 4025: ca
    lda #spriteid_boulder                                             ; 4026: a9 d2
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 4028: 20 57 1f
; draw rope at (10,2) length 15
    ldx #$0a                                                          ; 402b: a2 0a
    ldy #2                                                            ; 402d: a0 02
    lda #$0f                                                          ; 402f: a9 0f
    jsr draw_rope                                                     ; 4031: 20 b9 1d
; draw rope at (15,2) length 15
    ldx #$0f                                                          ; 4034: a2 0f
    jsr draw_rope                                                     ; 4036: 20 b9 1d
    jsr start_room                                                    ; 4039: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 403c: 20 da 12
    and #exit_room_left                                               ; 403f: 29 01
    beq room_3_game_update_loop                                       ; 4041: f0 f9
    ldx #2                                                            ; 4043: a2 02
    ldy current_level                                                 ; 4045: a4 31
    jmp initialise_level_and_room                                     ; 4047: 4c 40 11

room_3_update_handler
    lda #3                                                            ; 404a: a9 03
    sta currently_updating_logic_for_room_index                       ; 404c: 8d ba 1a
    ldx #3                                                            ; 404f: a2 03
    ldy #$0e                                                          ; 4051: a0 0e
    lda #4                                                            ; 4053: a9 04
    jsr update_brazier_and_fire                                       ; 4055: 20 88 19
    ldx #$25 ; '%'                                                    ; 4058: a2 25
    lda #5                                                            ; 405a: a9 05
    jsr update_brazier_and_fire                                       ; 405c: 20 88 19
    ldx #$22 ; '"'                                                    ; 405f: a2 22
    ldy #9                                                            ; 4061: a0 09
    lda #3                                                            ; 4063: a9 03
    jmp update_level_completion                                       ; 4065: 4c 10 1a

; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 20                                                          ; 4068: 14                      ; initial player X cell
    !byte 22                                                          ; 4069: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####   |                        |   ####
; ###    |                        |    ###
; ###    |                        |    ###
; ###    |                        |    ###
; ###    |                        |    ###
; ###    |                        |    ###
; ###    |                        |    ###
; ###    |                        |    ###
; ###    |                        |    ###
; ###    |                        |    ###
; ###    |                        |    ###
; ###    |                        |    ###
; ###    |                        |    ###
; ###    |     ##############     |    ###
; ###    |     ##############     |    ###
; ###    |                        |
; ###    |                        |
; ###    |
; ###
; ###                 P             ######
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_0_code
    ldx #0                                                            ; 406a: a2 00
    ldy #0                                                            ; 406c: a0 00
    lda #$ff                                                          ; 406e: a9 ff
    sta width_in_cells                                                ; 4070: 85 3c
    lda #2                                                            ; 4072: a9 02
    sta height_in_cells                                               ; 4074: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4076: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 4079: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 407b: 20 bb 1a
; draw 3x20 rectangle at (0,2)
    ldy #2                                                            ; 407e: a0 02
    lda #3                                                            ; 4080: a9 03
    sta width_in_cells                                                ; 4082: 85 3c
    lda #$14                                                          ; 4084: a9 14
    sta height_in_cells                                               ; 4086: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4088: 20 bb 1a
; draw 3x15 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 408b: a2 25
    lda #$0f                                                          ; 408d: a9 0f
    sta height_in_cells                                               ; 408f: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4091: 20 bb 1a
; draw 6x1 rectangle at (34,21)
    ldx #$22 ; '"'                                                    ; 4094: a2 22
    ldy #$15                                                          ; 4096: a0 15
    lda #6                                                            ; 4098: a9 06
    sta width_in_cells                                                ; 409a: 85 3c
    lda #1                                                            ; 409c: a9 01
    sta height_in_cells                                               ; 409e: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 40a0: 20 bb 1a
; draw 14x2 rectangle at (13,15)
    ldx #$0d                                                          ; 40a3: a2 0d
    ldy #$0f                                                          ; 40a5: a0 0f
    lda #$0e                                                          ; 40a7: a9 0e
    sta width_in_cells                                                ; 40a9: 85 3c
    lda #2                                                            ; 40ab: a9 02
    sta height_in_cells                                               ; 40ad: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 40af: 20 bb 1a
    jsr draw_rock_in_top_corner_cells                                 ; 40b2: 20 2a 3b
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 40b5: 20 90 1b
; draw rope at (7,2) length 18
    ldx #7                                                            ; 40b8: a2 07
    ldy #2                                                            ; 40ba: a0 02
    lda #$12                                                          ; 40bc: a9 12
    jsr draw_rope                                                     ; 40be: 20 b9 1d
; draw rope at (32,2) length 17
    ldx #$20 ; ' '                                                    ; 40c1: a2 20
    lda #$11                                                          ; 40c3: a9 11
    jsr draw_rope                                                     ; 40c5: 20 b9 1d
    jsr start_room                                                    ; 40c8: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 40cb: 20 da 12
    and #exit_room_right                                              ; 40ce: 29 04
    beq room_0_game_update_loop                                       ; 40d0: f0 f9
    ldx #1                                                            ; 40d2: a2 01
    ldy current_level                                                 ; 40d4: a4 31
    jmp initialise_level_and_room                                     ; 40d6: 4c 40 11

ring_bounce_y_table
    !byte 8, 6, 5, 4, 3, 2, 2, 1, 0                                   ; 40d9: 08 06 05...

; check for first update in room (branch if not)
update_sea_lion_and_ring
    lda update_room_first_update_flag                                 ; 40e2: ad 2b 13
    beq update_ring_bouncing                                          ; 40e5: f0 22
; check for level change (branch if not)
    lda current_level                                                 ; 40e7: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 40e9: c5 51
    beq update_room_only                                              ; 40eb: f0 05
    lda #$60 ; '`'                                                    ; 40ed: a9 60
    sta ring_y_position                                               ; 40ef: 8d 71 0a
update_room_only
    lda desired_room_index                                            ; 40f2: a5 30
    cmp #0                                                            ; 40f4: c9 00
    bne update_sea_lion_local                                         ; 40f6: d0 0e
    ldx #$14                                                          ; 40f8: a2 14
    ldy #$0f                                                          ; 40fa: a0 0f
    lda #spriteid_sea_lion_body                                       ; 40fc: a9 d8
    jsr draw_sprite_a_at_cell_xy                                      ; 40fe: 20 4c 1f
    lda #objectid_sea_lion_head                                       ; 4101: a9 05
    jsr set_object_position_from_cell_xy                              ; 4103: 20 5d 1f
update_sea_lion_local
    jmp update_sea_lion                                               ; 4106: 4c 3f 41

update_ring_bouncing
    ldy ring_bounce_cycle_animation_step                              ; 4109: ac 70 0a
    iny                                                               ; 410c: c8
    cpy #$1a                                                          ; 410d: c0 1a
    bcc store_ring_bounce_animation_step_y                            ; 410f: 90 02
    ldy #0                                                            ; 4111: a0 00
store_ring_bounce_animation_step_y
    sty ring_bounce_cycle_animation_step                              ; 4113: 8c 70 0a
    tya                                                               ; 4116: 98
    sec                                                               ; 4117: 38
    sbc #8                                                            ; 4118: e9 08
    bcc update_sea_lion                                               ; 411a: 90 23
    tay                                                               ; 411c: a8
    sec                                                               ; 411d: 38
    sbc #9                                                            ; 411e: e9 09
    bcs bounce_down                                                   ; 4120: b0 0b
    lda ring_bounce_y_table,y                                         ; 4122: b9 d9 40
    eor #$ff                                                          ; 4125: 49 ff
    clc                                                               ; 4127: 18
    adc #1                                                            ; 4128: 69 01
    jmp add_a_to_ring_y_position                                      ; 412a: 4c 38 41

bounce_down
    sta remember_a                                                    ; 412d: 85 70
    lda #9                                                            ; 412f: a9 09
    clc                                                               ; 4131: 18
    sbc remember_a                                                    ; 4132: e5 70
    tay                                                               ; 4134: a8
    lda ring_bounce_y_table,y                                         ; 4135: b9 d9 40
add_a_to_ring_y_position
    clc                                                               ; 4138: 18
    adc ring_y_position                                               ; 4139: 6d 71 0a
    sta ring_y_position                                               ; 413c: 8d 71 0a
update_sea_lion
    lda desired_room_index                                            ; 413f: a5 30
    cmp #0                                                            ; 4141: c9 00
    bne return5                                                       ; 4143: d0 5f
    ldx #spriteid_sea_lion_head2b                                     ; 4145: a2 db
    stx object_spriteid + objectid_sea_lion_head                      ; 4147: 8e ad 09
    lda save_game_level_p_ring_animation                              ; 414a: ad 62 0a
    cmp #ring_on_magnet                                               ; 414d: c9 03
    beq return5                                                       ; 414f: f0 53
    ldx #spriteid_sea_lion_head1                                      ; 4151: a2 d9
    stx object_spriteid + objectid_sea_lion_head                      ; 4153: 8e ad 09
    tax                                                               ; 4156: aa
    bne return5                                                       ; 4157: d0 4b
    lda ring_bounce_cycle_animation_step                              ; 4159: ad 70 0a
    cmp #8                                                            ; 415c: c9 08
    bcc set_ring_object                                               ; 415e: 90 14
    cmp #$19                                                          ; 4160: c9 19
    bne set_alternative_sea_lion_head                                 ; 4162: d0 0b
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 4164: ad 2b 13
    bne set_ring_object                                               ; 4167: d0 0b
    jsr play_landing_sound                                            ; 4169: 20 a9 23
    jmp set_ring_object                                               ; 416c: 4c 74 41

set_alternative_sea_lion_head
    ldx #spriteid_sea_lion_head2b                                     ; 416f: a2 db
    stx object_spriteid + objectid_sea_lion_head                      ; 4171: 8e ad 09
set_ring_object
    lda #spriteid_ring                                                ; 4174: a9 c8
    sta object_spriteid + objectid_ring                               ; 4176: 8d aa 09
    lda #$a6                                                          ; 4179: a9 a6
    sta object_x_low + objectid_ring                                  ; 417b: 8d 52 09
    lda ring_y_position                                               ; 417e: ad 71 0a
    sta object_y_low + objectid_ring                                  ; 4181: 8d 7e 09
    lda #$a0                                                          ; 4184: a9 a0
    sta object_z_order + objectid_ring                                ; 4186: 8d c4 38
    lda #$f7                                                          ; 4189: a9 f7
    sta temp_top_offset                                               ; 418b: 8d 50 25
    ldx #objectid_old_ring                                            ; 418e: a2 0d
    ldy #objectid_magnet                                              ; 4190: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 4192: 20 e2 28
    beq return5                                                       ; 4195: f0 0d
    lda #ring_on_magnet                                               ; 4197: a9 03
    sta save_game_level_p_ring_animation                              ; 4199: 8d 62 0a
    lda #spriteid_one_pixel_masked_out                                ; 419c: a9 00
    sta object_spriteid + objectid_ring                               ; 419e: 8d aa 09
    jsr play_ring_sound                                               ; 41a1: 20 af 3f
return5
    rts                                                               ; 41a4: 60

; check for first update in room (branch if not)
update_magnet_and_rod
    lda update_room_first_update_flag                                 ; 41a5: ad 2b 13
    beq magnet_and_rod_not_first_update                               ; 41a8: f0 51
; check for level change (branch if not)
    lda current_level                                                 ; 41aa: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 41ac: c5 51
    beq initialise_room                                               ; 41ae: f0 1e
    lda save_game_level_p_magnet_x                                    ; 41b0: ad 6d 0a
    beq set_magnet_fully_left                                         ; 41b3: f0 0f
    lda save_game_level_p_magnet_direction                            ; 41b5: ad 6e 0a
    beq initialise_room                                               ; 41b8: f0 14
    bpl set_magnet_fully_right                                        ; 41ba: 10 04
    lda #$0c                                                          ; 41bc: a9 0c
    bne set_magnet_x                                                  ; 41be: d0 06                   ; ALWAYS branch

set_magnet_fully_right
    lda #$1b                                                          ; 41c0: a9 1b
    bne set_magnet_x                                                  ; 41c2: d0 02                   ; ALWAYS branch

set_magnet_fully_left
    lda #$0c                                                          ; 41c4: a9 0c
set_magnet_x
    sta save_game_level_p_magnet_x                                    ; 41c6: 8d 6d 0a
    lda #0                                                            ; 41c9: a9 00
    sta save_game_level_p_magnet_direction                            ; 41cb: 8d 6e 0a
initialise_room
    lda desired_room_index                                            ; 41ce: a5 30
    cmp #0                                                            ; 41d0: c9 00
    bne update_magnet_local                                           ; 41d2: d0 24
    ldx #$0b                                                          ; 41d4: a2 0b
    ldy #2                                                            ; 41d6: a0 02
    lda #spriteid_left_bar                                            ; 41d8: a9 d4
    jsr draw_sprite_a_at_cell_xy                                      ; 41da: 20 4c 1f
    inx                                                               ; 41dd: e8
    inx                                                               ; 41de: e8
    lda #spriteid_horizontal_bar                                      ; 41df: a9 d3
draw_horizontal_bar_loop
    jsr draw_sprite_a_at_cell_xy                                      ; 41e1: 20 4c 1f
    inx                                                               ; 41e4: e8
    cpx #$1b                                                          ; 41e5: e0 1b
    bcc draw_horizontal_bar_loop                                      ; 41e7: 90 f8
    lda #spriteid_right_bar                                           ; 41e9: a9 d5
    jsr draw_sprite_a_at_cell_xy                                      ; 41eb: 20 4c 1f
    lda #spriteid_rope_with_magnet                                    ; 41ee: a9 d6
    sta object_spriteid + objectid_magnet                             ; 41f0: 8d ab 09
    lda #$c0                                                          ; 41f3: a9 c0
    sta object_z_order + objectid_short_bar                           ; 41f5: 8d c6 38
update_magnet_local
    jmp update_magnet                                                 ; 41f8: 4c 7e 42

magnet_and_rod_not_first_update
    lda save_game_level_p_magnet_direction                            ; 41fb: ad 6e 0a
    bne set_short_bar_object_if_in_room_0                             ; 41fe: d0 23
; magnet is not moving. check for player magnet collision
    ldx #objectid_player                                              ; 4200: a2 00
    ldy #objectid_magnet                                              ; 4202: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 4204: 20 e2 28
    beq update_magnet                                                 ; 4207: f0 75
    lda object_room_collision_flags                                   ; 4209: ad d8 38
    and #4                                                            ; 420c: 29 04
    bne set_magnet_going_right                                        ; 420e: d0 0e
    lda object_room_collision_flags                                   ; 4210: ad d8 38
    and #1                                                            ; 4213: 29 01
    beq update_magnet                                                 ; 4215: f0 67
    lda #$ff                                                          ; 4217: a9 ff
    sta save_game_level_p_magnet_direction                            ; 4219: 8d 6e 0a
    bne set_short_bar_object_if_in_room_0                             ; 421c: d0 05
set_magnet_going_right
    lda #1                                                            ; 421e: a9 01
    sta save_game_level_p_magnet_direction                            ; 4220: 8d 6e 0a
set_short_bar_object_if_in_room_0
    lda desired_room_index                                            ; 4223: a5 30
    cmp #0                                                            ; 4225: c9 00
    bne move_magnet_bar                                               ; 4227: d0 14
    ldx save_game_level_p_magnet_x                                    ; 4229: ae 6d 0a
    ldy #2                                                            ; 422c: a0 02
    lda #objectid_short_bar                                           ; 422e: a9 04
    jsr set_object_position_from_cell_xy                              ; 4230: 20 5d 1f
    lda #spriteid_one_pixel_masked_out                                ; 4233: a9 00
    sta object_spriteid_old + objectid_short_bar                      ; 4235: 8d b7 09
    lda #spriteid_short_bar                                           ; 4238: a9 d7
    sta object_spriteid + objectid_short_bar                          ; 423a: 8d ac 09
move_magnet_bar
    lda save_game_level_p_magnet_x                                    ; 423d: ad 6d 0a
    clc                                                               ; 4240: 18
    adc save_game_level_p_magnet_direction                            ; 4241: 6d 6e 0a
    sta save_game_level_p_magnet_x                                    ; 4244: 8d 6d 0a
    cmp #$0c                                                          ; 4247: c9 0c
    beq magnet_at_end_of_bar                                          ; 4249: f0 16
    cmp #$1b                                                          ; 424b: c9 1b
    beq magnet_at_end_of_bar                                          ; 424d: f0 12
    lda desired_room_index                                            ; 424f: a5 30
    cmp #0                                                            ; 4251: c9 00
    bne update_magnet                                                 ; 4253: d0 29
; play magnet moving along bar sound
    lda #$40 ; '@'                                                    ; 4255: a9 40
    ldx #<sound1                                                      ; 4257: a2 fe
    ldy #>sound1                                                      ; 4259: a0 45
    jsr play_sound_yx                                                 ; 425b: 20 f6 38
    jmp update_magnet                                                 ; 425e: 4c 7e 42

magnet_at_end_of_bar
    lda #0                                                            ; 4261: a9 00
    sta save_game_level_p_magnet_direction                            ; 4263: 8d 6e 0a
    lda desired_room_index                                            ; 4266: a5 30
    cmp #0                                                            ; 4268: c9 00
    bne update_magnet                                                 ; 426a: d0 12
    lda sound_priority_per_channel_table                              ; 426c: ad 6f 39
    cmp #$41 ; 'A'                                                    ; 426f: c9 41
    bcs skip_reset_sound_priorities                                   ; 4271: b0 08
    lda #0                                                            ; 4273: a9 00
    sta sound_priority_per_channel_table                              ; 4275: 8d 6f 39
    sta sound_priority_per_channel_table+1                            ; 4278: 8d 70 39
skip_reset_sound_priorities
    jsr play_landing_sound                                            ; 427b: 20 a9 23
update_magnet
    lda desired_room_index                                            ; 427e: a5 30
    cmp #0                                                            ; 4280: c9 00
    bne return6                                                       ; 4282: d0 6e
; set magnet object position
    ldx save_game_level_p_magnet_x                                    ; 4284: ae 6d 0a
    ldy #2                                                            ; 4287: a0 02
    lda #objectid_magnet                                              ; 4289: a9 03
    jsr set_object_position_from_cell_xy                              ; 428b: 20 5d 1f
; set collision map for magnet
    iny                                                               ; 428e: c8
    iny                                                               ; 428f: c8
    iny                                                               ; 4290: c8
    lda #1                                                            ; 4291: a9 01
    sta width_in_cells                                                ; 4293: 85 3c
    lda #2                                                            ; 4295: a9 02
    sta height_in_cells                                               ; 4297: 85 3d
    lda #collision_map_solid_rock                                     ; 4299: a9 03
    sta value_to_write_to_collision_map                               ; 429b: 85 3e
    jsr read_collision_map_value_for_xy                               ; 429d: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 42a0: c5 3e
    beq check_for_player_ring_collision                               ; 42a2: f0 10
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 42a4: 20 44 1e
    lda #collision_map_none                                           ; 42a7: a9 00
    sta value_to_write_to_collision_map                               ; 42a9: 85 3e
    dex                                                               ; 42ab: ca
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 42ac: 20 44 1e
    inx                                                               ; 42af: e8
    inx                                                               ; 42b0: e8
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 42b1: 20 44 1e
check_for_player_ring_collision
    lda save_game_level_p_ring_animation                              ; 42b4: ad 62 0a
    cmp #ring_on_magnet                                               ; 42b7: c9 03
    bne return6                                                       ; 42b9: d0 37
; collision check
    ldx #objectid_old_player                                          ; 42bb: a2 0b
    ldy #objectid_ring                                                ; 42bd: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 42bf: 20 e2 28
    beq no_player_ring_collision1                                     ; 42c2: f0 12
; collided. hide ring, add to toolbar
    lda #spriteid_one_pixel_masked_out                                ; 42c4: a9 00
    sta object_spriteid + objectid_ring                               ; 42c6: 8d aa 09
    lda #$ff                                                          ; 42c9: a9 ff
    sta save_game_level_p_ring_animation                              ; 42cb: 8d 62 0a
    lda #spriteid_ring_menu_item                                      ; 42ce: a9 c9
    jsr find_or_create_menu_slot_for_A                                ; 42d0: 20 bd 2b
    jmp return6                                                       ; 42d3: 4c f2 42

no_player_ring_collision1
    ldx save_game_level_p_magnet_x                                    ; 42d6: ae 6d 0a
    lda #$ff                                                          ; 42d9: a9 ff
    sta temp_sprite_x_offset                                          ; 42db: 85 3a
    ldy #2                                                            ; 42dd: a0 02
    lda #$2d ; '-'                                                    ; 42df: a9 2d
    sta temp_sprite_y_offset                                          ; 42e1: 85 3b
    lda #objectid_ring                                                ; 42e3: a9 02
    jsr set_object_position_from_cell_xy                              ; 42e5: 20 5d 1f
    lda #spriteid_ring                                                ; 42e8: a9 c8
    sta object_spriteid + objectid_ring                               ; 42ea: 8d aa 09
    lda #$a0                                                          ; 42ed: a9 a0
    sta object_z_order + objectid_ring                                ; 42ef: 8d c4 38
return6
    rts                                                               ; 42f2: 60

ring_animations
    !byte 8                                                           ; 42f3: 08
    !byte $80                                                         ; 42f4: 80
    !byte 0, 8                                                        ; 42f5: 00 08
    !byte 0, 0                                                        ; 42f7: 00 00
ring_fall_to_side_animation
    !byte 0, 0                                                        ; 42f9: 00 00
    !byte   8, $f8                                                    ; 42fb: 08 f8
    !byte   6, $f8                                                    ; 42fd: 06 f8
    !byte   6, $fa                                                    ; 42ff: 06 fa
    !byte   6, $fc                                                    ; 4301: 06 fc
    !byte   6, $fe                                                    ; 4303: 06 fe
    !byte   6, $ff                                                    ; 4305: 06 ff
    !byte $80                                                         ; 4307: 80
ring_fall_off_edge_animation
    !byte 6, 1                                                        ; 4308: 06 01
    !byte 6, 2                                                        ; 430a: 06 02
    !byte 6, 4                                                        ; 430c: 06 04
    !byte 6, 6                                                        ; 430e: 06 06
    !byte 4, 8                                                        ; 4310: 04 08
    !byte 2, 8                                                        ; 4312: 02 08
    !byte $80                                                         ; 4314: 80
ring_straight_down_animation
    !byte 0, 8                                                        ; 4315: 00 08
    !byte $80                                                         ; 4317: 80
ring_stationary_animation
    !byte 0, 0                                                        ; 4318: 00 00
    !byte $80                                                         ; 431a: 80
ring_bounced_off_wall_animation
    !byte 4, 2                                                        ; 431b: 04 02
    !byte 3, 3                                                        ; 431d: 03 03
    !byte 2, 4                                                        ; 431f: 02 04
    !byte 1, 6                                                        ; 4321: 01 06
    !byte $80                                                         ; 4323: 80

; check for first update in room (branch if so)
update_ring
    lda update_room_first_update_flag                                 ; 4324: ad 2b 13
    bne initialise_ring                                               ; 4327: d0 03
    jmp update_ring_not_first_update                                  ; 4329: 4c 84 43

initialise_ring
    lda #spriteid_ring_menu_item                                      ; 432c: a9 c9
    sta toolbar_collectable_spriteids+1                               ; 432e: 8d e9 2e
    lda #spriteid_ring                                                ; 4331: a9 c8
    sta collectable_spriteids+1                                       ; 4333: 8d ee 2e
    sta collectable_being_used_spriteids + 1                          ; 4336: 8d f3 2e
; check for level change (branch if not)
    lda current_level                                                 ; 4339: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 433b: c5 51
    beq initialise_ring_room_changed_only                             ; 433d: f0 10
    lda save_game_level_p_ring_animation                              ; 433f: ad 62 0a
    bmi initialise_ring_room_changed_only                             ; 4342: 30 0b
    cmp #ring_fall_to_side_animation - ring_animations                ; 4344: c9 06
    bcc initialise_ring_room_changed_only                             ; 4346: 90 07
    cmp #ring_stationary_animation - ring_animations                  ; 4348: c9 25
    beq initialise_ring_room_changed_only                             ; 434a: f0 03
    dec fast_forward_ring_movement_steps                              ; 434c: ce 6f 0a
initialise_ring_room_changed_only
    lda desired_room_index                                            ; 434f: a5 30
    cmp save_game_level_p_ring_room                                   ; 4351: cd 68 0a
    bne hide_ring1                                                    ; 4354: d0 26
    lda save_game_level_p_ring_animation                              ; 4356: ad 62 0a
    bmi hide_ring1                                                    ; 4359: 30 21
    cmp #ring_fall_to_side_animation - ring_animations                ; 435b: c9 06
    bcc hide_ring1                                                    ; 435d: 90 1d
    jsr update_ring_object                                            ; 435f: 20 be 45
fast_forward_ring_loop
    lda desired_room_index                                            ; 4362: a5 30
    cmp save_game_level_p_ring_room                                   ; 4364: cd 68 0a
    bne hide_ring1                                                    ; 4367: d0 13
    lda fast_forward_ring_movement_steps                              ; 4369: ad 6f 0a
    beq hide_ring1                                                    ; 436c: f0 0e
    dec fast_forward_ring_movement_steps                              ; 436e: ce 6f 0a
    ldx #objectid_ring                                                ; 4371: a2 02
    jsr copy_object_state_to_old                                      ; 4373: 20 f7 20
    jsr update_ring_animation                                         ; 4376: 20 90 44
    jmp fast_forward_ring_loop                                        ; 4379: 4c 62 43

hide_ring1
    lda #spriteid_one_pixel_masked_out                                ; 437c: a9 00
    sta object_spriteid_old + objectid_ring                           ; 437e: 8d b5 09
return7_local
    jmp return7                                                       ; 4381: 4c 8f 44

update_ring_not_first_update
    lda #0                                                            ; 4384: a9 00
    sta just_used_ring                                                ; 4386: 8d ec 45
    lda player_held_object_spriteid                                   ; 4389: a5 52
    sta remember_held_object                                          ; 438b: 8d ed 45
    lda object_spriteid_old + objectid_ring                           ; 438e: ad b5 09
    sta ring_sprite_as_drawn                                          ; 4391: 8d ee 45
    lda save_game_level_p_ring_animation                              ; 4394: ad 62 0a
    bmi check_for_using_the_ring                                      ; 4397: 30 16
    cmp #ring_fall_to_side_animation - ring_animations                ; 4399: c9 06
    bcc return7_local                                                 ; 439b: 90 e4
    lda desired_room_index                                            ; 439d: a5 30
    cmp save_game_level_p_ring_room                                   ; 439f: cd 68 0a
    beq update_ring_in_room                                           ; 43a2: f0 54
    lda fast_forward_ring_movement_steps                              ; 43a4: ad 6f 0a
    bmi return7_local                                                 ; 43a7: 30 d8
    inc fast_forward_ring_movement_steps                              ; 43a9: ee 6f 0a
    jmp return7                                                       ; 43ac: 4c 8f 44

check_for_using_the_ring
    lda #spriteid_ring_menu_item                                      ; 43af: a9 c9
    cmp player_using_object_spriteid                                  ; 43b1: cd b6 2e
    bne return7_local                                                 ; 43b4: d0 cb
    cmp previous_player_using_object_spriteid                         ; 43b6: cd b7 2e
    beq return7_local                                                 ; 43b9: f0 c6
    dec just_used_ring                                                ; 43bb: ce ec 45
    lda desired_room_index                                            ; 43be: a5 30
    sta save_game_level_p_ring_room                                   ; 43c0: 8d 68 0a
    lda object_direction                                              ; 43c3: ad be 09
    sta save_game_level_p_ring_direction_without_bounces              ; 43c6: 8d 66 0a
    sta save_game_level_p_ring_direction_with_bounces                 ; 43c9: 8d 67 0a
    lda object_x_low + objectid_player_accessory                      ; 43cc: ad 51 09
    sta save_game_level_p_ring_x_low                                  ; 43cf: 8d 64 0a
    lda object_x_high + objectid_player_accessory                     ; 43d2: ad 67 09
    sta save_game_level_p_ring_x_high                                 ; 43d5: 8d 65 0a
    lda object_y_low + objectid_player_accessory                      ; 43d8: ad 7d 09
    sta save_game_level_p_ring_y_low                                  ; 43db: 8d 69 0a
    lda object_y_high + objectid_player_accessory                     ; 43de: ad 93 09
    sta save_game_level_p_ring_y_high                                 ; 43e1: 8d 6a 0a
    lda #ring_fall_to_side_animation - ring_animations                ; 43e4: a9 06
    sta save_game_level_p_ring_animation_step                         ; 43e6: 8d 63 0a
    sta save_game_level_p_ring_animation                              ; 43e9: 8d 62 0a
    jsr update_ring_object                                            ; 43ec: 20 be 45
    ldx #objectid_ring                                                ; 43ef: a2 02
    jsr copy_object_state_to_old                                      ; 43f1: 20 f7 20
    lda #spriteid_one_pixel_masked_out                                ; 43f4: a9 00
    sta player_held_object_spriteid                                   ; 43f6: 85 52
update_ring_in_room
    jsr update_ring_animation                                         ; 43f8: 20 90 44
    lda desired_room_index                                            ; 43fb: a5 30
    cmp save_game_level_p_ring_room                                   ; 43fd: cd 68 0a
    beq check_player_ring_collision                                   ; 4400: f0 05
    lda #0                                                            ; 4402: a9 00
    sta fast_forward_ring_movement_steps                              ; 4404: 8d 6f 0a
check_player_ring_collision
    lda ring_sprite_as_drawn                                          ; 4407: ad ee 45
    sta object_spriteid_old + objectid_ring                           ; 440a: 8d b5 09
    ldy #$0d                                                          ; 440d: a0 0d                   ; redundant instruction
    lda just_used_ring                                                ; 440f: ad ec 45                ; redundant instruction
    ldy #objectid_ring                                                ; 4412: a0 02
    ldx #objectid_old_player                                          ; 4414: a2 0b
    jsr test_for_collision_between_objects_x_and_y                    ; 4416: 20 e2 28
    ldx remember_held_object                                          ; 4419: ae ed 45
    stx player_held_object_spriteid                                   ; 441c: 86 52
    ora #0                                                            ; 441e: 09 00
    beq no_player_ring_collision2                                     ; 4420: f0 17
    lda just_used_ring                                                ; 4422: ad ec 45
    bne taken_ring                                                    ; 4425: d0 05
    lda #spriteid_ring_menu_item                                      ; 4427: a9 c9
    jsr find_or_create_menu_slot_for_A                                ; 4429: 20 bd 2b
taken_ring
    lda #spriteid_one_pixel_masked_out                                ; 442c: a9 00
    sta object_spriteid + objectid_ring                               ; 442e: 8d aa 09
    lda #$ff                                                          ; 4431: a9 ff
    sta save_game_level_p_ring_animation                              ; 4433: 8d 62 0a
    jmp return7                                                       ; 4436: 4c 8f 44

no_player_ring_collision2
    lda just_used_ring                                                ; 4439: ad ec 45
    beq check_for_ring_moving                                         ; 443c: f0 0f
    lda #spriteid_ring_menu_item                                      ; 443e: a9 c9
    jsr remove_item_from_toolbar_menu                                 ; 4440: 20 e0 2b
    lda #spriteid_one_pixel_masked_out                                ; 4443: a9 00
    sta object_spriteid + objectid_player_accessory                   ; 4445: 8d a9 09
    sta player_using_object_spriteid                                  ; 4448: 8d b6 2e
    sta player_held_object_spriteid                                   ; 444b: 85 52
check_for_ring_moving
    lda object_x_low + objectid_ring                                  ; 444d: ad 52 09
    cmp object_x_low_old + objectid_ring                              ; 4450: cd 5d 09
    beq check_ring_movement_in_y                                      ; 4453: f0 20
    lda save_game_level_p_ring_direction_with_bounces                 ; 4455: ad 67 0a
    bmi ring_moving_left1                                             ; 4458: 30 06
    inc temp_right_offset                                             ; 445a: ee d1 24
    jmp check_ring_rock_collision                                     ; 445d: 4c 63 44

ring_moving_left1
    dec temp_left_offset                                              ; 4460: ce d0 24
check_ring_rock_collision
    lda #1                                                            ; 4463: a9 01
    sta temp_bottom_offset                                            ; 4465: 8d 51 25
    lda #objectid_ring                                                ; 4468: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 446a: 20 94 28
    beq check_ring_movement_in_y                                      ; 446d: f0 06
    jsr play_ring_sound                                               ; 446f: 20 af 3f
    jmp return7                                                       ; 4472: 4c 8f 44

check_ring_movement_in_y
    lda object_y_low + objectid_ring                                  ; 4475: ad 7e 09
    cmp object_y_low_old + objectid_ring                              ; 4478: cd 89 09
    beq return7                                                       ; 447b: f0 12
    dec temp_top_offset                                               ; 447d: ce 50 25
    lda #2                                                            ; 4480: a9 02
    sta temp_bottom_offset                                            ; 4482: 8d 51 25
    lda #objectid_ring                                                ; 4485: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4487: 20 94 28
    beq return7                                                       ; 448a: f0 03
    jsr play_ring_sound                                               ; 448c: 20 af 3f
return7
    rts                                                               ; 448f: 60

update_ring_animation
    lda save_game_level_p_ring_animation_step                         ; 4490: ad 63 0a
    clc                                                               ; 4493: 18
    adc #2                                                            ; 4494: 69 02
    tay                                                               ; 4496: a8
    lda ring_animations,y                                             ; 4497: b9 f3 42
    cmp #$80                                                          ; 449a: c9 80
    bne got_next_ring_animation_step_in_y                             ; 449c: d0 03
    ldy save_game_level_p_ring_animation                              ; 449e: ac 62 0a
got_next_ring_animation_step_in_y
    lda save_game_level_p_ring_direction_with_bounces                 ; 44a1: ad 67 0a
    bmi ring_moving_left2                                             ; 44a4: 30 06
    inc temp_right_offset                                             ; 44a6: ee d1 24
    jmp check_for_ring_rock_collision                                 ; 44a9: 4c af 44

ring_moving_left2
    dec temp_left_offset                                              ; 44ac: ce d0 24
check_for_ring_rock_collision
    lda #1                                                            ; 44af: a9 01
    sta temp_bottom_offset                                            ; 44b1: 8d 51 25
    lda #objectid_ring                                                ; 44b4: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 44b6: 20 94 28
    beq check_ring_falling_to_side                                    ; 44b9: f0 08
; bounce the ring by inverting the X direction
    lda save_game_level_p_ring_direction_with_bounces                 ; 44bb: ad 67 0a
    eor #$fe                                                          ; 44be: 49 fe
    sta save_game_level_p_ring_direction_with_bounces                 ; 44c0: 8d 67 0a
check_ring_falling_to_side
    lda save_game_level_p_ring_animation                              ; 44c3: ad 62 0a
    cmp #ring_fall_to_side_animation - ring_animations                ; 44c6: c9 06
    bne check_ring_hitting_floor                                      ; 44c8: d0 16
    dec temp_top_offset                                               ; 44ca: ce 50 25
    lda #objectid_ring                                                ; 44cd: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 44cf: 20 94 28
    bne ring_collided_so_fall_straight_down                           ; 44d2: d0 05
    cpy save_game_level_p_ring_animation                              ; 44d4: cc 62 0a
    bne store_ring_animation_step                                     ; 44d7: d0 37
ring_collided_so_fall_straight_down
    lda #ring_straight_down_animation - ring_animations               ; 44d9: a9 22
    sta save_game_level_p_ring_animation                              ; 44db: 8d 62 0a
    ldy #ring_fall_off_edge_animation - ring_animations               ; 44de: a0 15
check_ring_hitting_floor
    lda #objectid_ring                                                ; 44e0: a9 02
    jsr update_object_hitting_floor                                   ; 44e2: 20 70 27
    lda save_game_level_p_ring_animation                              ; 44e5: ad 62 0a
    cmp #ring_straight_down_animation - ring_animations               ; 44e8: c9 22
    bne check_ring_fallen_off_edge_direction                          ; 44ea: d0 0a
    lda object_has_hit_floor_flag                                     ; 44ec: ad 8f 28
    beq store_ring_animation_step                                     ; 44ef: f0 1f
    ldy #ring_stationary_animation - ring_animations                  ; 44f1: a0 25
    sty save_game_level_p_ring_animation                              ; 44f3: 8c 62 0a
check_ring_fallen_off_edge_direction
    lda object_just_fallen_off_edge_direction                         ; 44f6: ad 90 28
    beq store_ring_animation_step                                     ; 44f9: f0 15
    ldy #ring_straight_down_animation - ring_animations               ; 44fb: a0 22
    sty save_game_level_p_ring_animation                              ; 44fd: 8c 62 0a
    ldy #ring_bounced_off_wall_animation - ring_animations            ; 4500: a0 28
    ldx #1                                                            ; 4502: a2 01
    stx save_game_level_p_ring_direction_with_bounces                 ; 4504: 8e 67 0a
    ora #0                                                            ; 4507: 09 00
    bpl store_ring_animation_step                                     ; 4509: 10 05
    ldx #$ff                                                          ; 450b: a2 ff
    stx save_game_level_p_ring_direction_with_bounces                 ; 450d: 8e 67 0a
store_ring_animation_step
    sty save_game_level_p_ring_animation_step                         ; 4510: 8c 63 0a
    lda save_game_level_p_ring_animation                              ; 4513: ad 62 0a
    cmp #ring_stationary_animation - ring_animations                  ; 4516: c9 25
    bne get_animation_movement_in_x_position                          ; 4518: d0 05
    lda #0                                                            ; 451a: a9 00
    sta fast_forward_ring_movement_steps                              ; 451c: 8d 6f 0a
get_animation_movement_in_x_position
    lda ring_animations,y                                             ; 451f: b9 f3 42
    ldx save_game_level_p_ring_direction_with_bounces                 ; 4522: ae 67 0a
    bpl sign_extend_a_to_ax                                           ; 4525: 10 05
    eor #$ff                                                          ; 4527: 49 ff
    clc                                                               ; 4529: 18
    adc #1                                                            ; 452a: 69 01
sign_extend_a_to_ax
    ldx #0                                                            ; 452c: a2 00
    ora #0                                                            ; 452e: 09 00
    bpl add_ax_to_ring_x_position                                     ; 4530: 10 01
    dex                                                               ; 4532: ca
add_ax_to_ring_x_position
    clc                                                               ; 4533: 18
    adc save_game_level_p_ring_x_low                                  ; 4534: 6d 64 0a
    sta save_game_level_p_ring_x_low                                  ; 4537: 8d 64 0a
    txa                                                               ; 453a: 8a
    adc save_game_level_p_ring_x_high                                 ; 453b: 6d 65 0a
    sta save_game_level_p_ring_x_high                                 ; 453e: 8d 65 0a
    iny                                                               ; 4541: c8
    lda ring_animations,y                                             ; 4542: b9 f3 42
    ldx #0                                                            ; 4545: a2 00
    ora #0                                                            ; 4547: 09 00
    bpl add_ax_to_ring_y_position                                     ; 4549: 10 01
    dex                                                               ; 454b: ca
add_ax_to_ring_y_position
    clc                                                               ; 454c: 18
    adc save_game_level_p_ring_y_low                                  ; 454d: 6d 69 0a
    sta save_game_level_p_ring_y_low                                  ; 4550: 8d 69 0a
    txa                                                               ; 4553: 8a
    adc save_game_level_p_ring_y_high                                 ; 4554: 6d 6a 0a
    sta save_game_level_p_ring_y_high                                 ; 4557: 8d 6a 0a
    jsr update_ring_object                                            ; 455a: 20 be 45
    lda #objectid_ring                                                ; 455d: a9 02
    jsr update_object_a_solid_rock_collision                          ; 455f: 20 f5 25
    lda object_x_low + objectid_ring                                  ; 4562: ad 52 09
    sta save_game_level_p_ring_x_low                                  ; 4565: 8d 64 0a
    lda object_x_high + objectid_ring                                 ; 4568: ad 68 09
    sta save_game_level_p_ring_x_high                                 ; 456b: 8d 65 0a
    lda object_y_low + objectid_ring                                  ; 456e: ad 7e 09
    sta save_game_level_p_ring_y_low                                  ; 4571: 8d 69 0a
    lda object_y_high + objectid_ring                                 ; 4574: ad 94 09
    sta save_game_level_p_ring_y_high                                 ; 4577: 8d 6a 0a
    ldx #objectid_ring                                                ; 457a: a2 02
    jsr find_left_and_right_of_object                                 ; 457c: 20 34 24
    jsr find_top_and_bottom_of_object                                 ; 457f: 20 d2 24
    lda save_game_level_p_ring_direction_with_bounces                 ; 4582: ad 67 0a
    bmi check_if_ring_should_move_one_room_left                       ; 4585: 30 1c
    lda object_left_cell_x                                            ; 4587: a5 78
    cmp #game_area_width_cells                                        ; 4589: c9 28
    bcc return8                                                       ; 458b: 90 30
; move ring right one room
    lda save_game_level_p_ring_x_low                                  ; 458d: ad 64 0a
    sec                                                               ; 4590: 38
    sbc #$40 ; '@'                                                    ; 4591: e9 40
    sta save_game_level_p_ring_x_low                                  ; 4593: 8d 64 0a
    lda #0                                                            ; 4596: a9 00
    sbc #0                                                            ; 4598: e9 00
    sta save_game_level_p_ring_x_high                                 ; 459a: 8d 65 0a
    inc save_game_level_p_ring_room                                   ; 459d: ee 68 0a
    jmp hide_ring2                                                    ; 45a0: 4c b8 45

check_if_ring_should_move_one_room_left
    lda object_right_cell_x                                           ; 45a3: a5 79
    bpl return8                                                       ; 45a5: 10 16
    lda save_game_level_p_ring_x_low                                  ; 45a7: ad 64 0a
    clc                                                               ; 45aa: 18
    adc #$40 ; '@'                                                    ; 45ab: 69 40
    sta save_game_level_p_ring_x_low                                  ; 45ad: 8d 64 0a
    lda #1                                                            ; 45b0: a9 01
    sta save_game_level_p_ring_x_high                                 ; 45b2: 8d 65 0a
    dec save_game_level_p_ring_room                                   ; 45b5: ce 68 0a
hide_ring2
    lda #spriteid_one_pixel_masked_out                                ; 45b8: a9 00
    sta object_spriteid + objectid_ring                               ; 45ba: 8d aa 09
return8
    rts                                                               ; 45bd: 60

update_ring_object
    lda #spriteid_erase1                                              ; 45be: a9 ca
    sta object_erase_type + objectid_ring                             ; 45c0: 8d ae 38
    lda #$a0                                                          ; 45c3: a9 a0
    sta object_z_order + objectid_ring                                ; 45c5: 8d c4 38
    lda save_game_level_p_ring_x_low                                  ; 45c8: ad 64 0a
    sta object_x_low + objectid_ring                                  ; 45cb: 8d 52 09
    lda save_game_level_p_ring_x_high                                 ; 45ce: ad 65 0a
    sta object_x_high + objectid_ring                                 ; 45d1: 8d 68 09
    lda save_game_level_p_ring_y_low                                  ; 45d4: ad 69 0a
    sta object_y_low + objectid_ring                                  ; 45d7: 8d 7e 09
    lda save_game_level_p_ring_y_high                                 ; 45da: ad 6a 0a
    sta object_y_high + objectid_ring                                 ; 45dd: 8d 94 09
    lda #spriteid_ring                                                ; 45e0: a9 c8
    sta object_spriteid + objectid_ring                               ; 45e2: 8d aa 09
    lda save_game_level_p_ring_direction_without_bounces              ; 45e5: ad 66 0a
    sta object_direction + objectid_ring                              ; 45e8: 8d c0 09
    rts                                                               ; 45eb: 60

just_used_ring
    !byte 0                                                           ; 45ec: 00
remember_held_object
    !byte 0                                                           ; 45ed: 00
ring_sprite_as_drawn
    !byte   0, $60                                                    ; 45ee: 00 60
envelope1
    !byte 5                                                           ; 45f0: 05                      ; envelope number
    !byte 1                                                           ; 45f1: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 45f2: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 45f3: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 45f4: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 45f5: 00                      ; number of steps in section 1
    !byte 0                                                           ; 45f6: 00                      ; number of steps in section 2
    !byte 0                                                           ; 45f7: 00                      ; number of steps in section 3
    !byte 10                                                          ; 45f8: 0a                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 45f9: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 45fa: 00                      ; change of amplitude per step during sustain phase
    !byte 216                                                         ; 45fb: d8                      ; change of amplitude per step during release phase
    !byte 40                                                          ; 45fc: 28                      ; target of level at end of attack phase
    !byte 0                                                           ; 45fd: 00                      ; target of level at end of decay phase
sound1
    !word $10                                                         ; 45fe: 10 00                   ; channel
    !word 5                                                           ; 4600: 05 00                   ; amplitude
    !word 4                                                           ; 4602: 04 00                   ; pitch
    !word 4                                                           ; 4604: 04 00                   ; duration
envelope2
    !byte 6                                                           ; 4606: 06                      ; envelope number
    !byte 1                                                           ; 4607: 01                      ; step length (100ths of a second)
    !byte 255                                                         ; 4608: ff                      ; pitch change per step in section 1
    !byte 0                                                           ; 4609: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 460a: 00                      ; pitch change per step in section 3
    !byte 1                                                           ; 460b: 01                      ; number of steps in section 1
    !byte 1                                                           ; 460c: 01                      ; number of steps in section 2
    !byte 0                                                           ; 460d: 00                      ; number of steps in section 3
    !byte 110                                                         ; 460e: 6e                      ; change of amplitude per step during attack phase
    !byte 252                                                         ; 460f: fc                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4610: 00                      ; change of amplitude per step during sustain phase
    !byte 248                                                         ; 4611: f8                      ; change of amplitude per step during release phase
    !byte 110                                                         ; 4612: 6e                      ; target of level at end of attack phase
    !byte 0                                                           ; 4613: 00                      ; target of level at end of decay phase
sound2
    !word $13                                                         ; 4614: 13 00                   ; channel
    !word 6                                                           ; 4616: 06 00                   ; amplitude
    !word 201                                                         ; 4618: c9 00                   ; pitch
    !word 1                                                           ; 461a: 01 00                   ; duration
ground_fill_2x2_top_left
    !byte %..##....                                                   ; 461c: 30
    !byte %...##...                                                   ; 461d: 18
    !byte %#...##..                                                   ; 461e: 8c
    !byte %##...##.                                                   ; 461f: c6
    !byte %.##...##                                                   ; 4620: 63
    !byte %..##...#                                                   ; 4621: 31
    !byte %...##...                                                   ; 4622: 18
    !byte %....##..                                                   ; 4623: 0c
ground_fill_2x2_top_right
    !byte %....##..                                                   ; 4624: 0c
    !byte %...##...                                                   ; 4625: 18
    !byte %..##...#                                                   ; 4626: 31
    !byte %.##...##                                                   ; 4627: 63
    !byte %##...##.                                                   ; 4628: c6
    !byte %#...##..                                                   ; 4629: 8c
    !byte %...##...                                                   ; 462a: 18
    !byte %..##....                                                   ; 462b: 30
ground_fill_2x2_bottom_left
    !byte %....##..                                                   ; 462c: 0c
    !byte %...##...                                                   ; 462d: 18
    !byte %..##...#                                                   ; 462e: 31
    !byte %.##...##                                                   ; 462f: 63
    !byte %##...##.                                                   ; 4630: c6
    !byte %#...##..                                                   ; 4631: 8c
    !byte %...##...                                                   ; 4632: 18
    !byte %..##....                                                   ; 4633: 30
ground_fill_2x2_bottom_right
    !byte %..##....                                                   ; 4634: 30
    !byte %...##...                                                   ; 4635: 18
    !byte %#...##..                                                   ; 4636: 8c
    !byte %##...##.                                                   ; 4637: c6
    !byte %.##...##                                                   ; 4638: 63
    !byte %..##...#                                                   ; 4639: 31
    !byte %...##...                                                   ; 463a: 18
    !byte %....##..                                                   ; 463b: 0c
sprite_data
pydis_end
!if (<envelope1) != $f0 {
    !error "Assertion failed: <envelope1 == $f0"
}
!if (<envelope2) != $06 {
    !error "Assertion failed: <envelope2 == $06"
}
!if (<ground_fill_2x2_top_left) != $1c {
    !error "Assertion failed: <ground_fill_2x2_top_left == $1c"
}
!if (<sound1) != $fe {
    !error "Assertion failed: <sound1 == $fe"
}
!if (<sound2) != $14 {
    !error "Assertion failed: <sound2 == $14"
}
!if (>envelope1) != $45 {
    !error "Assertion failed: >envelope1 == $45"
}
!if (>envelope2) != $46 {
    !error "Assertion failed: >envelope2 == $46"
}
!if (>ground_fill_2x2_top_left) != $46 {
    !error "Assertion failed: >ground_fill_2x2_top_left == $46"
}
!if (>sound1) != $45 {
    !error "Assertion failed: >sound1 == $45"
}
!if (>sound2) != $46 {
    !error "Assertion failed: >sound2 == $46"
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
!if (level_specific_initialisation) != $3af4 {
    !error "Assertion failed: level_specific_initialisation == $3af4"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b17 {
    !error "Assertion failed: level_specific_update == $3b17"
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
!if (object_direction + objectid_ring) != $09c0 {
    !error "Assertion failed: object_direction + objectid_ring == $09c0"
}
!if (object_erase_type + objectid_ring) != $38ae {
    !error "Assertion failed: object_erase_type + objectid_ring == $38ae"
}
!if (object_spriteid + objectid_cane) != $09af {
    !error "Assertion failed: object_spriteid + objectid_cane == $09af"
}
!if (object_spriteid + objectid_magnet) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_magnet == $09ab"
}
!if (object_spriteid + objectid_ring) != $09aa {
    !error "Assertion failed: object_spriteid + objectid_ring == $09aa"
}
!if (object_spriteid + objectid_room1_left_hook) != $09ad {
    !error "Assertion failed: object_spriteid + objectid_room1_left_hook == $09ad"
}
!if (object_spriteid + objectid_room1_right_hook) != $09ae {
    !error "Assertion failed: object_spriteid + objectid_room1_right_hook == $09ae"
}
!if (object_spriteid + objectid_room2_left_hook) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_room2_left_hook == $09ab"
}
!if (object_spriteid + objectid_room2_right_hook) != $09ad {
    !error "Assertion failed: object_spriteid + objectid_room2_right_hook == $09ad"
}
!if (object_spriteid + objectid_sea_lion_head) != $09ad {
    !error "Assertion failed: object_spriteid + objectid_sea_lion_head == $09ad"
}
!if (object_spriteid + objectid_short_bar) != $09ac {
    !error "Assertion failed: object_spriteid + objectid_short_bar == $09ac"
}
!if (object_spriteid + objectid_short_left_rope) != $09ac {
    !error "Assertion failed: object_spriteid + objectid_short_left_rope == $09ac"
}
!if (object_spriteid + objectid_short_right_rope) != $09ae {
    !error "Assertion failed: object_spriteid + objectid_short_right_rope == $09ae"
}
!if (object_spriteid_old + objectid_ring) != $09b5 {
    !error "Assertion failed: object_spriteid_old + objectid_ring == $09b5"
}
!if (object_spriteid_old + objectid_short_bar) != $09b7 {
    !error "Assertion failed: object_spriteid_old + objectid_short_bar == $09b7"
}
!if (object_spriteid_old + objectid_short_left_rope) != $09b7 {
    !error "Assertion failed: object_spriteid_old + objectid_short_left_rope == $09b7"
}
!if (object_spriteid_old + objectid_short_right_rope) != $09b9 {
    !error "Assertion failed: object_spriteid_old + objectid_short_right_rope == $09b9"
}
!if (object_x_high + objectid_ring) != $0968 {
    !error "Assertion failed: object_x_high + objectid_ring == $0968"
}
!if (object_x_low + objectid_ring) != $0952 {
    !error "Assertion failed: object_x_low + objectid_ring == $0952"
}
!if (object_x_low_old + objectid_ring) != $095d {
    !error "Assertion failed: object_x_low_old + objectid_ring == $095d"
}
!if (object_y_high + objectid_ring) != $0994 {
    !error "Assertion failed: object_y_high + objectid_ring == $0994"
}
!if (object_y_low + objectid_ring) != $097e {
    !error "Assertion failed: object_y_low + objectid_ring == $097e"
}
!if (object_y_low + objectid_room2_left_hook) != $097f {
    !error "Assertion failed: object_y_low + objectid_room2_left_hook == $097f"
}
!if (object_y_low + objectid_room2_right_hook) != $0981 {
    !error "Assertion failed: object_y_low + objectid_room2_right_hook == $0981"
}
!if (object_y_low + objectid_short_left_rope) != $0980 {
    !error "Assertion failed: object_y_low + objectid_short_left_rope == $0980"
}
!if (object_y_low + objectid_short_right_rope) != $0982 {
    !error "Assertion failed: object_y_low + objectid_short_right_rope == $0982"
}
!if (object_y_low_old + objectid_ring) != $0989 {
    !error "Assertion failed: object_y_low_old + objectid_ring == $0989"
}
!if (object_z_order + objectid_cane) != $38c9 {
    !error "Assertion failed: object_z_order + objectid_cane == $38c9"
}
!if (object_z_order + objectid_ring) != $38c4 {
    !error "Assertion failed: object_z_order + objectid_ring == $38c4"
}
!if (object_z_order + objectid_short_bar) != $38c6 {
    !error "Assertion failed: object_z_order + objectid_short_bar == $38c6"
}
!if (object_z_order + objectid_short_left_rope) != $38c6 {
    !error "Assertion failed: object_z_order + objectid_short_left_rope == $38c6"
}
!if (object_z_order + objectid_short_right_rope) != $38c8 {
    !error "Assertion failed: object_z_order + objectid_short_right_rope == $38c8"
}
!if (objectid_cane) != $07 {
    !error "Assertion failed: objectid_cane == $07"
}
!if (objectid_fire1) != $03 {
    !error "Assertion failed: objectid_fire1 == $03"
}
!if (objectid_fire2) != $04 {
    !error "Assertion failed: objectid_fire2 == $04"
}
!if (objectid_magnet) != $03 {
    !error "Assertion failed: objectid_magnet == $03"
}
!if (objectid_old_player) != $0b {
    !error "Assertion failed: objectid_old_player == $0b"
}
!if (objectid_old_ring) != $0d {
    !error "Assertion failed: objectid_old_ring == $0d"
}
!if (objectid_player) != $00 {
    !error "Assertion failed: objectid_player == $00"
}
!if (objectid_ring) != $02 {
    !error "Assertion failed: objectid_ring == $02"
}
!if (objectid_room1_left_hook) != $05 {
    !error "Assertion failed: objectid_room1_left_hook == $05"
}
!if (objectid_room1_right_hook) != $06 {
    !error "Assertion failed: objectid_room1_right_hook == $06"
}
!if (objectid_room2_left_hook) != $03 {
    !error "Assertion failed: objectid_room2_left_hook == $03"
}
!if (objectid_room2_right_hook) != $05 {
    !error "Assertion failed: objectid_room2_right_hook == $05"
}
!if (objectid_sea_lion_head) != $05 {
    !error "Assertion failed: objectid_sea_lion_head == $05"
}
!if (objectid_short_bar) != $04 {
    !error "Assertion failed: objectid_short_bar == $04"
}
!if (objectid_short_left_rope) != $04 {
    !error "Assertion failed: objectid_short_left_rope == $04"
}
!if (objectid_short_right_rope) != $06 {
    !error "Assertion failed: objectid_short_right_rope == $06"
}
!if (ring_bounced_off_wall_animation - ring_animations) != $28 {
    !error "Assertion failed: ring_bounced_off_wall_animation - ring_animations == $28"
}
!if (ring_fall_off_edge_animation - ring_animations) != $15 {
    !error "Assertion failed: ring_fall_off_edge_animation - ring_animations == $15"
}
!if (ring_fall_to_side_animation - ring_animations) != $06 {
    !error "Assertion failed: ring_fall_to_side_animation - ring_animations == $06"
}
!if (ring_on_magnet) != $03 {
    !error "Assertion failed: ring_on_magnet == $03"
}
!if (ring_on_room1_left_hook) != $04 {
    !error "Assertion failed: ring_on_room1_left_hook == $04"
}
!if (ring_on_room1_right_hook) != $05 {
    !error "Assertion failed: ring_on_room1_right_hook == $05"
}
!if (ring_on_room2_left_hook) != $01 {
    !error "Assertion failed: ring_on_room2_left_hook == $01"
}
!if (ring_on_room2_right_hook) != $02 {
    !error "Assertion failed: ring_on_room2_right_hook == $02"
}
!if (ring_stationary_animation - ring_animations) != $25 {
    !error "Assertion failed: ring_stationary_animation - ring_animations == $25"
}
!if (ring_straight_down_animation - ring_animations) != $22 {
    !error "Assertion failed: ring_straight_down_animation - ring_animations == $22"
}
!if (room_0_data) != $4068 {
    !error "Assertion failed: room_0_data == $4068"
}
!if (room_1_data) != $3b3c {
    !error "Assertion failed: room_1_data == $3b3c"
}
!if (room_2_data) != $3caf {
    !error "Assertion failed: room_2_data == $3caf"
}
!if (room_3_data) != $3fb8 {
    !error "Assertion failed: room_3_data == $3fb8"
}
!if (sound_priority_per_channel_table+1) != $3970 {
    !error "Assertion failed: sound_priority_per_channel_table+1 == $3970"
}
!if (sprite_data - level_data) != $0b67 {
    !error "Assertion failed: sprite_data - level_data == $0b67"
}
!if (sprite_op_flags_erase_to_fg_colour) != $04 {
    !error "Assertion failed: sprite_op_flags_erase_to_fg_colour == $04"
}
!if (spriteid_ball) != $3b {
    !error "Assertion failed: spriteid_ball == $3b"
}
!if (spriteid_boulder) != $d2 {
    !error "Assertion failed: spriteid_boulder == $d2"
}
!if (spriteid_cane) != $dd {
    !error "Assertion failed: spriteid_cane == $dd"
}
!if (spriteid_erase1) != $ca {
    !error "Assertion failed: spriteid_erase1 == $ca"
}
!if (spriteid_hook) != $cf {
    !error "Assertion failed: spriteid_hook == $cf"
}
!if (spriteid_hook_with_ring) != $d0 {
    !error "Assertion failed: spriteid_hook_with_ring == $d0"
}
!if (spriteid_horizontal_bar) != $d3 {
    !error "Assertion failed: spriteid_horizontal_bar == $d3"
}
!if (spriteid_horizontal_rope) != $cd {
    !error "Assertion failed: spriteid_horizontal_rope == $cd"
}
!if (spriteid_icodata_monkey) != $06 {
    !error "Assertion failed: spriteid_icodata_monkey == $06"
}
!if (spriteid_left_bar) != $d4 {
    !error "Assertion failed: spriteid_left_bar == $d4"
}
!if (spriteid_left_hook) != $cb {
    !error "Assertion failed: spriteid_left_hook == $cb"
}
!if (spriteid_one_pixel_masked_out) != $00 {
    !error "Assertion failed: spriteid_one_pixel_masked_out == $00"
}
!if (spriteid_rght_hook) != $cc {
    !error "Assertion failed: spriteid_rght_hook == $cc"
}
!if (spriteid_right_bar) != $d5 {
    !error "Assertion failed: spriteid_right_bar == $d5"
}
!if (spriteid_ring) != $c8 {
    !error "Assertion failed: spriteid_ring == $c8"
}
!if (spriteid_ring_menu_item) != $c9 {
    !error "Assertion failed: spriteid_ring_menu_item == $c9"
}
!if (spriteid_rope) != $ce {
    !error "Assertion failed: spriteid_rope == $ce"
}
!if (spriteid_rope_end) != $0a {
    !error "Assertion failed: spriteid_rope_end == $0a"
}
!if (spriteid_rope_with_magnet) != $d6 {
    !error "Assertion failed: spriteid_rope_with_magnet == $d6"
}
!if (spriteid_sea_lion_body) != $d8 {
    !error "Assertion failed: spriteid_sea_lion_body == $d8"
}
!if (spriteid_sea_lion_head1) != $d9 {
    !error "Assertion failed: spriteid_sea_lion_head1 == $d9"
}
!if (spriteid_sea_lion_head2b) != $db {
    !error "Assertion failed: spriteid_sea_lion_head2b == $db"
}
!if (spriteid_short_bar) != $d7 {
    !error "Assertion failed: spriteid_short_bar == $d7"
}
!if (spriteid_short_rope) != $d1 {
    !error "Assertion failed: spriteid_short_rope == $d1"
}
!if (spriteid_table) != $dc {
    !error "Assertion failed: spriteid_table == $dc"
}
