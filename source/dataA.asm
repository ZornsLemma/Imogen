; Constants
baby_max_pixel_x                          = 212
baby_spriteid_data_entries_minus_1        = 43
copy_mode_2x2                             = 0
copy_mode_random16                        = 16
copy_mode_random2                         = 2
copy_mode_random32                        = 32
copy_mode_random4                         = 4
copy_mode_random64                        = 64
copy_mode_random8                         = 8
copy_mode_simple                          = 1
exit_room_bottom                          = 2
exit_room_left                            = 1
exit_room_right                           = 4
exit_room_top                             = 8
first_level_letter                        = 65
game_area_height_cells                    = 24
game_area_width_cells                     = 40
last_level_letter                         = 81
object_collided_ceiling                   = 8
object_collided_floor                     = 2
object_collided_left_wall                 = 1
object_collided_right_wall                = 4
objectid_baby                             = 2
objectid_brazier                          = 5
objectid_brazier2                         = 3
objectid_left_mouse                       = 2
objectid_left_trapdoor                    = 2
objectid_mouse_ball                       = 4
objectid_player                           = 0
objectid_player_accessory                 = 1
objectid_right_mouse                      = 3
objectid_right_trapdoor                   = 3
objectid_saxophone                        = 4
objectid_something                        = 11
objectid_spell                            = 5
objectid_table                            = 2
opcode_jmp                                = 76
player_collision_flag_baby                = 6
player_collision_flag_mouse_ball          = 128
some_specific_baby_spriteid_index_entry   = 33
spriteid_baby0                            = 214
spriteid_baby1                            = 215
spriteid_baby2                            = 216
spriteid_baby3                            = 217
spriteid_baby4                            = 218
spriteid_baby5                            = 219
spriteid_baby6                            = 220
spriteid_baby7                            = 221
spriteid_ball                             = 59
spriteid_mouse                            = 200
spriteid_mouse_hands1                     = 201
spriteid_mouse_hands2                     = 202
spriteid_mouse_hands3                     = 212
spriteid_mouse_hands4                     = 213
spriteid_saxophone1                       = 210
spriteid_saxophone2                       = 211
spriteid_small_ball                       = 203
spriteid_table                            = 222
spriteid_trapdoor_diagonal                = 208
spriteid_trapdoor_horizontal              = 207
spriteid_trapdoor_vertical                = 209
spriteid_zero_size1                       = 204
table_max_x                               = 22
table_min_x                               = 10

; Memory locations
characters_entered                                  = $05
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
previous_room_index                                 = $50
level_before_latest_level_and_room_initialisation   = $51
player_held_object_spriteid                         = $52
developer_mode_sideways_ram_is_set_up_flag          = $5b
l0070                                               = $70
old_table_x_position                                = $70
room_exit_direction                                 = $70
show_dialog_box                                     = $040a
remove_dialog                                       = $0453
object_x_low                                        = $0950
object_x_low_old                                    = $095b
object_x_high                                       = $0966
object_x_high_old                                   = $0971
object_y_low                                        = $097c
object_y_low_old                                    = $0987
object_y_high                                       = $0992
object_y_high_old                                   = $099d
object_spriteid                                     = $09a8
object_spriteid_old                                 = $09b3
object_direction                                    = $09be
object_direction_old                                = $09c9
level_progress_table                                = $09ef
room1_trapdoor_open_flag                            = $09ff
saxophone_collected_flag                            = $0a00
table_x_position                                    = $0a01
table_x_speed                                       = $0a02
save_game_level_a_room_2_baby_pixel_x_coordinate    = $0a03
save_game_level_a_room_2_baby_direction             = $0a04
mouse_ball_animation_position                       = $0a6f
baby_pixel_x_coordinate                             = $0a70
baby_pixel_x_speed                                  = $0a71
baby_spriteid_index_if_baby_spriteid_data_is_zero   = $0a72
baby_sprite_index                                   = $0a73
string_input_buffer                                 = $0a90
tile_all_set_pixels                                 = $0aa9
developer_flags                                     = $1103
initialise_level_and_room                           = $1140
start_room                                          = $12bb
game_update                                         = $12da
update_room_first_update_flag                       = $132b
pending_toolbar_colour                              = $175d
toolbar_colour                                      = $175e
pending_gameplay_area_colour                        = $175f
gameplay_area_colour                                = $1760
use_colour_flag                                     = $1765
set_toolbar_and_gameplay_area_colours               = $1766
get_random_number_up_to_a                           = $18a6
jmp_yx                                              = $1966
update_brazier_and_fire                             = $1988
update_level_completion                             = $1a10
currently_updating_logic_for_room_index             = $1aba
copy_rectangle_of_memory_to_screen                  = $1abb
draw_floor_walls_and_ceiling_around_solid_rock      = $1b90
draw_rope                                           = $1db9
write_value_to_a_rectangle_of_cells_in_collision_map = $1e44
write_a_single_value_to_cell_in_collision_map       = $1ebb
draw_sprite_a_at_cell_xy                            = $1f4c
draw_sprite_a_at_cell_xy_and_write_to_collision_map = $1f57
set_object_position_from_cell_xy                    = $1f5d
set_object_position_from_current_sprite_position    = $1f6d
play_landing_sound                                  = $23a9
player_wall_collision_flag                          = $2433
temp_left_offset                                    = $24d0
temp_right_offset                                   = $24d1
temp_top_offset                                     = $2550
temp_bottom_offset                                  = $2551
get_solid_rock_collision_for_object_a               = $2894
test_for_collision_between_objects_x_and_y          = $28e2
insert_character_menu_item_into_toolbar             = $2b87
find_or_create_menu_slot_for_A                      = $2bbd
remove_item_from_toolbar_menu                       = $2be0
player_using_object_spriteid                        = $2eb6
previous_player_using_object_spriteid               = $2eb7
toolbar_collectable_spriteids                       = $2ee8
collectable_spriteids                               = $2eed
five_byte_table_paired_with_collectable_sprite_ids  = $2ef2
print_encrypted_string_at_yx_centred                = $37f3
wait_one_second_then_check_keys                     = $388d
object_sprite_mask_type                             = $38ac
object_z_order                                      = $38c2
object_room_collision_flags                         = $38d8
play_sound_yx                                       = $38f6
define_envelope                                     = $395e
sound_priority_per_channel_table                    = $396f
check_menu_keys                                     = $3a8f
auxcode                                             = $53c0
check_password                                      = $53c0

    * = $3ad5

; *************************************************************************************
; 
; Level header
; 
; *************************************************************************************
level_data
pydis_start
    !word sprite_data - level_data                                    ; 3ad5: d1 09                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f2 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 17 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
    !byte 0, 1                                                        ; 3add: 00 01
level_room_data_table
    !word room_0_data                                                 ; 3adf: 27 3b                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: 3d 3d
    !word room_2_data                                                 ; 3ae3: d7 3f
    !word room_3_data                                                 ; 3ae5: 4d 42

; *************************************************************************************
; 'SAXOPHOBIA\r' EOR-encrypted with $cb
level_specific_password
    !byte $98, $8a, $93, $84, $9b, $83, $84, $89, $82, $8a, $c6       ; 3ae7: 98 8a 93...

; *************************************************************************************
; 
; Level initialisation
; 
; This is called whenever a new room is entered.
; 
; *************************************************************************************
level_specific_initialisation
    lda current_level                                                 ; 3af2: a5 31
; if level is unchanged, skip forwards
    cmp level_before_latest_level_and_room_initialisation             ; 3af4: c5 51
    beq saxophone_not_collected_yet                                   ; 3af6: f0 16
; if not in developer mode, skip forwards
    lda developer_flags                                               ; 3af8: ad 03 11
    bpl developer_mode_not_active                                     ; 3afb: 10 07
; add the saxophone menu item to the toolbar (due to being in developer mode)
    lda #spriteid_saxophone2                                          ; 3afd: a9 d3
    jsr find_or_create_menu_slot_for_A                                ; 3aff: 20 bd 2b
    lda #$ff                                                          ; 3b02: a9 ff                   ; redundant instruction
; check the saxophone collected flag. The user can choose during the course of a game
; to enter the password to continue playing this level having previously got the
; saxophone. Or indeed may have just loaded a previously saved game.
developer_mode_not_active
    lda saxophone_collected_flag                                      ; 3b04: ad 00 0a
    beq saxophone_not_collected_yet                                   ; 3b07: f0 05
; add the saxophone menu item to the toolbar (due to having collected it on a previous
; visit to the level)
    lda #spriteid_saxophone2                                          ; 3b09: a9 d3
    jsr find_or_create_menu_slot_for_A                                ; 3b0b: 20 bd 2b
saxophone_not_collected_yet
    lda #<ground_fill_2x2_top_left                                    ; 3b0e: a9 86
    sta source_sprite_memory_low                                      ; 3b10: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3b12: a9 44
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
    jsr room0_update_handler                                          ; 3b17: 20 e4 3b
    jsr room1_update_handler                                          ; 3b1a: 20 fc 3d
    jsr room2_update_handler                                          ; 3b1d: 20 7f 40
    jsr room1_saxophone_and_brazier_handler                           ; 3b20: 20 02 3f
    jsr room3_update_handler                                          ; 3b23: 20 f8 42
    rts                                                               ; 3b26: 60

; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 20                                                          ; 3b27: 14                      ; initial player X cell
    !byte 22                                                          ; 3b28: 16                      ; initial player Y cell

room_0_code
    ldx #0                                                            ; 3b29: a2 00                   ; Draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision map.
    ldy #0                                                            ; 3b2b: a0 00
    lda #$ff                                                          ; 3b2d: a9 ff
    sta width_in_cells                                                ; 3b2f: 85 3c
    lda #2                                                            ; 3b31: a9 02
    sta height_in_cells                                               ; 3b33: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b35: 20 bb 1a
    ldy #2                                                            ; 3b38: a0 02
    lda #4                                                            ; 3b3a: a9 04
    sta width_in_cells                                                ; 3b3c: 85 3c
    dec height_in_cells                                               ; 3b3e: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b40: 20 bb 1a
    iny                                                               ; 3b43: c8
    dec width_in_cells                                                ; 3b44: c6 3c
    lda #$13                                                          ; 3b46: a9 13
    sta height_in_cells                                               ; 3b48: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b4a: 20 bb 1a
    ldy #$16                                                          ; 3b4d: a0 16
    lda #$ff                                                          ; 3b4f: a9 ff
    sta width_in_cells                                                ; 3b51: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b53: 20 bb 1a
    ldx #$22 ; '"'                                                    ; 3b56: a2 22
    ldy #7                                                            ; 3b58: a0 07
    lda #6                                                            ; 3b5a: a9 06
    sta width_in_cells                                                ; 3b5c: 85 3c
    lda #2                                                            ; 3b5e: a9 02
    sta height_in_cells                                               ; 3b60: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b62: 20 bb 1a
    ldx #$25 ; '%'                                                    ; 3b65: a2 25
    ldy #9                                                            ; 3b67: a0 09
    lda #$0d                                                          ; 3b69: a9 0d
    sta height_in_cells                                               ; 3b6b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b6d: 20 bb 1a
    ldx #$0e                                                          ; 3b70: a2 0e
    ldy #$0b                                                          ; 3b72: a0 0b
    lda #3                                                            ; 3b74: a9 03
    sta width_in_cells                                                ; 3b76: 85 3c
    lda #2                                                            ; 3b78: a9 02
    sta height_in_cells                                               ; 3b7a: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b7c: 20 bb 1a
    ldx #$18                                                          ; 3b7f: a2 18
    jsr copy_rectangle_of_memory_to_screen                            ; 3b81: 20 bb 1a
; Carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3b84: 20 90 1b
; Draw tables
    lda #3                                                            ; 3b87: a9 03
    sta width_in_cells                                                ; 3b89: 85 3c
    lda #2                                                            ; 3b8b: a9 02
    sta height_in_cells                                               ; 3b8d: 85 3d
    lda #spriteid_table                                               ; 3b8f: a9 de
    ldx #3                                                            ; 3b91: a2 03
    ldy #$14                                                          ; 3b93: a0 14
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3b95: 20 57 1f
    ldx #6                                                            ; 3b98: a2 06
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3b9a: 20 57 1f
    ldx #9                                                            ; 3b9d: a2 09
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3b9f: 20 57 1f
    ldx #3                                                            ; 3ba2: a2 03
    ldy #$12                                                          ; 3ba4: a0 12
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3ba6: 20 57 1f
    ldx #6                                                            ; 3ba9: a2 06
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bab: 20 57 1f
; Draw ropes
    ldx #$0a                                                          ; 3bae: a2 0a
    ldy #2                                                            ; 3bb0: a0 02
    lda #$0a                                                          ; 3bb2: a9 0a
    jsr draw_rope                                                     ; 3bb4: 20 b9 1d
    ldx #$1e                                                          ; 3bb7: a2 1e
    jsr draw_rope                                                     ; 3bb9: 20 b9 1d
    ldx #$14                                                          ; 3bbc: a2 14
    lda #$10                                                          ; 3bbe: a9 10
    jsr draw_rope                                                     ; 3bc0: 20 b9 1d
    ldx #$0f                                                          ; 3bc3: a2 0f
    ldy #$0d                                                          ; 3bc5: a0 0d
    lda #5                                                            ; 3bc7: a9 05
    jsr draw_rope                                                     ; 3bc9: 20 b9 1d
    ldx #$19                                                          ; 3bcc: a2 19
    jsr draw_rope                                                     ; 3bce: 20 b9 1d
; start main game loop for room 1
    jsr start_room                                                    ; 3bd1: 20 bb 12
loop_until_exit_room_right
    jsr game_update                                                   ; 3bd4: 20 da 12
    sta room_exit_direction                                           ; 3bd7: 85 70
    and #exit_room_right                                              ; 3bd9: 29 04
    beq loop_until_exit_room_right                                    ; 3bdb: f0 f7
    ldx #1                                                            ; 3bdd: a2 01
    ldy current_level                                                 ; 3bdf: a4 31
    jsr initialise_level_and_room                                     ; 3be1: 20 40 11

; *************************************************************************************
; 
; Room 0 update
; 
; Room 0 has two mice throwing a ball back and forth.
; 
; *************************************************************************************
room0_update_handler
    lda update_room_first_update_flag                                 ; 3be4: ad 2b 13
    bne initialise_mouse_ball_position_if_level_changed               ; 3be7: d0 03
    jmp bump_and_wrap_mouse_ball_position                             ; 3be9: 4c 77 3c

initialise_mouse_ball_position_if_level_changed
    lda current_level                                                 ; 3bec: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3bee: c5 51
    beq level_unchanged                                               ; 3bf0: f0 05
    lda #0                                                            ; 3bf2: a9 00
    sta mouse_ball_animation_position                                 ; 3bf4: 8d 6f 0a
level_unchanged
    lda desired_room_index                                            ; 3bf7: a5 30
    cmp #0                                                            ; 3bf9: c9 00
    bne move_mouse_ball_if_room_0_local                               ; 3bfb: d0 77
    ldx #<envelope1                                                   ; 3bfd: a2 60
    ldy #>envelope1                                                   ; 3bff: a0 44
    jsr define_envelope                                               ; 3c01: 20 5e 39
; Perform shared initialisation for both mice
    lda #2                                                            ; 3c04: a9 02
    sta width_in_cells                                                ; 3c06: 85 3c
    sta height_in_cells                                               ; 3c08: 85 3d
    lda #3                                                            ; 3c0a: a9 03
    sta value_to_write_to_collision_map                               ; 3c0c: 85 3e
; Set up the left mouse
    ldx #$10                                                          ; 3c0e: a2 10
    ldy #$0b                                                          ; 3c10: a0 0b
    lda #$fe                                                          ; 3c12: a9 fe
    sta temp_sprite_y_offset                                          ; 3c14: 85 3b
    lda #spriteid_mouse                                               ; 3c16: a9 c8
    jsr draw_sprite_a_at_cell_xy                                      ; 3c18: 20 4c 1f
    dex                                                               ; 3c1b: ca
    dey                                                               ; 3c1c: 88
    dey                                                               ; 3c1d: 88
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3c1e: 20 44 1e
    ldx #objectid_left_mouse                                          ; 3c21: a2 02
    jsr set_object_position_from_current_sprite_position              ; 3c23: 20 6d 1f
    lda #$cd                                                          ; 3c26: a9 cd
    sta object_sprite_mask_type,x                                     ; 3c28: 9d ac 38
    lda #$c0                                                          ; 3c2b: a9 c0
    sta object_z_order,x                                              ; 3c2d: 9d c2 38
; Set up the right mouse
    lda #$ff                                                          ; 3c30: a9 ff
    sta sprite_reflect_flag                                           ; 3c32: 85 1d
    ldx #$19                                                          ; 3c34: a2 19
    ldy #$0b                                                          ; 3c36: a0 0b
    lda #$fe                                                          ; 3c38: a9 fe
    sta temp_sprite_y_offset                                          ; 3c3a: 85 3b
    lda #spriteid_mouse                                               ; 3c3c: a9 c8
    jsr draw_sprite_a_at_cell_xy                                      ; 3c3e: 20 4c 1f
    dex                                                               ; 3c41: ca
    dey                                                               ; 3c42: 88
    dey                                                               ; 3c43: 88
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3c44: 20 44 1e
    ldx #objectid_right_mouse                                         ; 3c47: a2 03
    jsr set_object_position_from_current_sprite_position              ; 3c49: 20 6d 1f
    lda #$ff                                                          ; 3c4c: a9 ff
    sta object_direction,x                                            ; 3c4e: 9d be 09
    lda #$ce                                                          ; 3c51: a9 ce
    sta object_sprite_mask_type,x                                     ; 3c53: 9d ac 38
    lda #$c0                                                          ; 3c56: a9 c0
    sta object_z_order,x                                              ; 3c58: 9d c2 38
; Set up the ball
    ldx #objectid_mouse_ball                                          ; 3c5b: a2 04
    lda #0                                                            ; 3c5d: a9 00
    sta object_x_high,x                                               ; 3c5f: 9d 66 09
    sta object_y_high,x                                               ; 3c62: 9d 92 09
    lda #1                                                            ; 3c65: a9 01
    sta object_direction,x                                            ; 3c67: 9d be 09
    lda #spriteid_zero_size1                                          ; 3c6a: a9 cc
    sta object_sprite_mask_type,x                                     ; 3c6c: 9d ac 38
    lda #$40 ; '@'                                                    ; 3c6f: a9 40
    sta object_z_order,x                                              ; 3c71: 9d c2 38
move_mouse_ball_if_room_0_local
    jmp move_mouse_ball_if_room_0                                     ; 3c74: 4c a8 3c

bump_and_wrap_mouse_ball_position
    ldy mouse_ball_animation_position                                 ; 3c77: ac 6f 0a
    iny                                                               ; 3c7a: c8
    cpy #$1e                                                          ; 3c7b: c0 1e
    bcc no_wrap_needed                                                ; 3c7d: 90 02
    ldy #0                                                            ; 3c7f: a0 00
no_wrap_needed
    sty mouse_ball_animation_position                                 ; 3c81: 8c 6f 0a
    lda desired_room_index                                            ; 3c84: a5 30
    cmp #0                                                            ; 3c86: c9 00
    bne move_mouse_ball_if_room_0                                     ; 3c88: d0 1e
    tya                                                               ; 3c8a: 98
    beq play_mouse_ball_sounds                                        ; 3c8b: f0 04
    cpy #$0f                                                          ; 3c8d: c0 0f
    bne move_mouse_ball_if_room_0                                     ; 3c8f: d0 17
play_mouse_ball_sounds
    lda #0                                                            ; 3c91: a9 00
    ldx #<mouse_ball_sound1                                           ; 3c93: a2 7e
    ldy #>mouse_ball_sound1                                           ; 3c95: a0 44
    jsr play_sound_yx                                                 ; 3c97: 20 f6 38
    ldx #<mouse_ball_sound2                                           ; 3c9a: a2 76
    ldy #>mouse_ball_sound2                                           ; 3c9c: a0 44
    jsr play_sound_yx                                                 ; 3c9e: 20 f6 38
    ldx #<mouse_ball_sound3                                           ; 3ca1: a2 6e
    ldy #>mouse_ball_sound3                                           ; 3ca3: a0 44
    jsr play_sound_yx                                                 ; 3ca5: 20 f6 38
move_mouse_ball_if_room_0
    lda desired_room_index                                            ; 3ca8: a5 30
    cmp #0                                                            ; 3caa: c9 00
    bne return1                                                       ; 3cac: d0 72
    lda mouse_ball_animation_position                                 ; 3cae: ad 6f 0a
    cmp #8                                                            ; 3cb1: c9 08
    bcs mouse_ball_position_ge_8                                      ; 3cb3: b0 04
    ldy #0                                                            ; 3cb5: a0 00
    beq mouse_ball_position_lt_8                                      ; 3cb7: f0 0a                   ; ALWAYS branch
mouse_ball_position_ge_8
    cmp #$0f                                                          ; 3cb9: c9 0f
    bcs mouse_ball_position_ge_0xf                                    ; 3cbb: b0 1c
    sec                                                               ; 3cbd: 38
    sbc #8                                                            ; 3cbe: e9 08
    asl                                                               ; 3cc0: 0a
    asl                                                               ; 3cc1: 0a
    tay                                                               ; 3cc2: a8
mouse_ball_position_lt_8
    lda mouse_hand_sprites_and_ball_movement_table,y                  ; 3cc3: b9 21 3d
; Set the mouse sprites as a pair of values in the table
    sta object_spriteid + objectid_left_mouse                         ; 3cc6: 8d aa 09
    iny                                                               ; 3cc9: c8
    lda mouse_hand_sprites_and_ball_movement_table,y                  ; 3cca: b9 21 3d
    sta object_spriteid + objectid_right_mouse                        ; 3ccd: 8d ab 09
    lda #$88                                                          ; 3cd0: a9 88
    clc                                                               ; 3cd2: 18
    iny                                                               ; 3cd3: c8
    adc mouse_hand_sprites_and_ball_movement_table,y                  ; 3cd4: 79 21 3d
    bne finish_mouse_ball_movement                                    ; 3cd7: d0 22                   ; ALWAYS branch
mouse_ball_position_ge_0xf
    cmp #$17                                                          ; 3cd9: c9 17
    bcs mouse_ball_position_ge_0x17                                   ; 3cdb: b0 04
    ldy #0                                                            ; 3cdd: a0 00
    beq c3ce7                                                         ; 3cdf: f0 06                   ; ALWAYS branch
mouse_ball_position_ge_0x17
    sec                                                               ; 3ce1: 38
    sbc #$17                                                          ; 3ce2: e9 17
    asl                                                               ; 3ce4: 0a
    asl                                                               ; 3ce5: 0a
    tay                                                               ; 3ce6: a8
c3ce7
    lda mouse_hand_sprites_and_ball_movement_table,y                  ; 3ce7: b9 21 3d
    sta object_spriteid + objectid_right_mouse                        ; 3cea: 8d ab 09
    iny                                                               ; 3ced: c8
    lda mouse_hand_sprites_and_ball_movement_table,y                  ; 3cee: b9 21 3d
    sta object_spriteid + objectid_left_mouse                         ; 3cf1: 8d aa 09
    lda #$c0                                                          ; 3cf4: a9 c0
    sec                                                               ; 3cf6: 38
    iny                                                               ; 3cf7: c8
    sbc mouse_hand_sprites_and_ball_movement_table,y                  ; 3cf8: f9 21 3d
finish_mouse_ball_movement
    sta object_x_low + objectid_mouse_ball                            ; 3cfb: 8d 54 09
    lda #$53 ; 'S'                                                    ; 3cfe: a9 53
    sec                                                               ; 3d00: 38
    iny                                                               ; 3d01: c8
    sbc mouse_hand_sprites_and_ball_movement_table,y                  ; 3d02: f9 21 3d
    sta object_y_low + objectid_mouse_ball                            ; 3d05: 8d 80 09
    lda #spriteid_small_ball                                          ; 3d08: a9 cb
    sta object_spriteid + objectid_mouse_ball                         ; 3d0a: 8d ac 09
    lda update_room_first_update_flag                                 ; 3d0d: ad 2b 13
    bne return1                                                       ; 3d10: d0 0e
; Check for player-ball collision
    ldx #objectid_player                                              ; 3d12: a2 00
    ldy #objectid_mouse_ball                                          ; 3d14: a0 04
    jsr test_for_collision_between_objects_x_and_y                    ; 3d16: 20 e2 28
    beq return1                                                       ; 3d19: f0 05
    lda #player_collision_flag_mouse_ball                             ; 3d1b: a9 80
    sta player_wall_collision_flag                                    ; 3d1d: 8d 33 24
return1
    rts                                                               ; 3d20: 60

mouse_hand_sprites_and_ball_movement_table
    !byte spriteid_mouse_hands3                                       ; 3d21: d4
    !byte spriteid_mouse_hands1                                       ; 3d22: c9
    !byte 0, 0                                                        ; 3d23: 00 00
    !byte spriteid_mouse_hands2                                       ; 3d25: ca
    !byte spriteid_mouse_hands1                                       ; 3d26: c9
    !byte 8, 6                                                        ; 3d27: 08 06
    !byte spriteid_mouse_hands2                                       ; 3d29: ca
    !byte spriteid_mouse_hands1                                       ; 3d2a: c9
    !byte 16, 10                                                      ; 3d2b: 10 0a
    !byte spriteid_mouse_hands2                                       ; 3d2d: ca
    !byte spriteid_mouse_hands4                                       ; 3d2e: d5
    !byte 24, 12                                                      ; 3d2f: 18 0c
    !byte spriteid_mouse_hands4                                       ; 3d31: d5
    !byte spriteid_mouse_hands2                                       ; 3d32: ca
    !byte 32, 12                                                      ; 3d33: 20 0c
    !byte spriteid_mouse_hands1                                       ; 3d35: c9
    !byte spriteid_mouse_hands2                                       ; 3d36: ca
    !byte 40, 10                                                      ; 3d37: 28 0a
    !byte spriteid_mouse_hands1                                       ; 3d39: c9
    !byte spriteid_mouse_hands2                                       ; 3d3a: ca
    !byte 48,  6                                                      ; 3d3b: 30 06
; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 9                                                           ; 3d3d: 09                      ; initial player X cell
    !byte 7                                                           ; 3d3e: 07                      ; initial player Y cell

room_1_code
    ldx #0                                                            ; 3d3f: a2 00
    ldy #0                                                            ; 3d41: a0 00
    lda #$ff                                                          ; 3d43: a9 ff
    sta width_in_cells                                                ; 3d45: 85 3c
    lda #2                                                            ; 3d47: a9 02
    sta height_in_cells                                               ; 3d49: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d4b: 20 bb 1a
    ldy #7                                                            ; 3d4e: a0 07
    lda #$11                                                          ; 3d50: a9 11
    sta width_in_cells                                                ; 3d52: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3d54: 20 bb 1a
    ldx #$17                                                          ; 3d57: a2 17
    jsr copy_rectangle_of_memory_to_screen                            ; 3d59: 20 bb 1a
    ldx #0                                                            ; 3d5c: a2 00
    ldy #$16                                                          ; 3d5e: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3d60: 20 bb 1a
    ldx #$17                                                          ; 3d63: a2 17
    jsr copy_rectangle_of_memory_to_screen                            ; 3d65: 20 bb 1a
    ldx #0                                                            ; 3d68: a2 00
    ldy #9                                                            ; 3d6a: a0 09
    lda #4                                                            ; 3d6c: a9 04
    sta width_in_cells                                                ; 3d6e: 85 3c
    dec height_in_cells                                               ; 3d70: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d72: 20 bb 1a
    ldx #$0d                                                          ; 3d75: a2 0d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d77: 20 bb 1a
    ldx #$17                                                          ; 3d7a: a2 17
    jsr copy_rectangle_of_memory_to_screen                            ; 3d7c: 20 bb 1a
    ldx #$24 ; '$'                                                    ; 3d7f: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 3d81: 20 bb 1a
    ldx #0                                                            ; 3d84: a2 00
    iny                                                               ; 3d86: c8
    dec width_in_cells                                                ; 3d87: c6 3c
    lda #$0c                                                          ; 3d89: a9 0c
    sta height_in_cells                                               ; 3d8b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d8d: 20 bb 1a
    ldx #$0e                                                          ; 3d90: a2 0e
    jsr copy_rectangle_of_memory_to_screen                            ; 3d92: 20 bb 1a
    ldx #$17                                                          ; 3d95: a2 17
    jsr copy_rectangle_of_memory_to_screen                            ; 3d97: 20 bb 1a
    ldx #$25 ; '%'                                                    ; 3d9a: a2 25
    lda #3                                                            ; 3d9c: a9 03
    sta height_in_cells                                               ; 3d9e: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3da0: 20 bb 1a
    ldy #$12                                                          ; 3da3: a0 12
    inc height_in_cells                                               ; 3da5: e6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3da7: 20 bb 1a
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3daa: 20 90 1b
    lda #3                                                            ; 3dad: a9 03
    sta width_in_cells                                                ; 3daf: 85 3c
    lda #2                                                            ; 3db1: a9 02
    sta height_in_cells                                               ; 3db3: 85 3d
    lda #spriteid_table                                               ; 3db5: a9 de
    ldx #$1a                                                          ; 3db7: a2 1a
    ldy #$14                                                          ; 3db9: a0 14
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3dbb: 20 57 1f
    ldx #$22 ; '"'                                                    ; 3dbe: a2 22
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3dc0: 20 57 1f
    ldy #$12                                                          ; 3dc3: a0 12
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3dc5: 20 57 1f
    ldx #7                                                            ; 3dc8: a2 07
    ldy #$14                                                          ; 3dca: a0 14
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3dcc: 20 57 1f
    jsr start_room                                                    ; 3dcf: 20 bb 12
loop_until_exited_room
    jsr game_update                                                   ; 3dd2: 20 da 12
    sta room_exit_direction                                           ; 3dd5: 85 70
    and #exit_room_left                                               ; 3dd7: 29 01
    beq exited_room_not_left                                          ; 3dd9: f0 07
    ldx #0                                                            ; 3ddb: a2 00
    ldy current_level                                                 ; 3ddd: a4 31
    jmp initialise_level_and_room                                     ; 3ddf: 4c 40 11

exited_room_not_left
    lda room_exit_direction                                           ; 3de2: a5 70
    and #exit_room_bottom                                             ; 3de4: 29 02
    beq exited_room_not_bottom                                        ; 3de6: f0 07
    ldx #2                                                            ; 3de8: a2 02
    ldy current_level                                                 ; 3dea: a4 31
    jmp initialise_level_and_room                                     ; 3dec: 4c 40 11

exited_room_not_bottom
    lda room_exit_direction                                           ; 3def: a5 70
    and #exit_room_right                                              ; 3df1: 29 04
    beq loop_until_exited_room                                        ; 3df3: f0 dd
    ldx #3                                                            ; 3df5: a2 03
    ldy current_level                                                 ; 3df7: a4 31
    jmp initialise_level_and_room                                     ; 3df9: 4c 40 11

; *************************************************************************************
; 
; Room 1 update
; 
; Room 1 has a trapdoor which opens when the wizard stands on it holding the saxophone.
; 
; *************************************************************************************
room1_update_handler
    lda update_room_first_update_flag                                 ; 3dfc: ad 2b 13
    beq room1_not_first_update                                        ; 3dff: f0 6b
    lda level_before_latest_level_and_room_initialisation             ; 3e01: a5 51
    cmp current_level                                                 ; 3e03: c5 31
    beq level_unchanged2                                              ; 3e05: f0 0a
    lda room1_trapdoor_open_flag                                      ; 3e07: ad ff 09
    beq level_unchanged2                                              ; 3e0a: f0 05
    lda #$ff                                                          ; 3e0c: a9 ff
    sta room1_trapdoor_open_flag                                      ; 3e0e: 8d ff 09
level_unchanged2
    lda desired_room_index                                            ; 3e11: a5 30
    cmp #1                                                            ; 3e13: c9 01
    bne room1_initial_setup_done                                      ; 3e15: d0 52
    ldx #<envelope2                                                   ; 3e17: a2 2c
    ldy #>envelope2                                                   ; 3e19: a0 44
    jsr define_envelope                                               ; 3e1b: 20 5e 39
; Set up the objects for the two trapdoors.
    ldx #$11                                                          ; 3e1e: a2 11
    ldy #7                                                            ; 3e20: a0 07
    lda #objectid_left_trapdoor                                       ; 3e22: a9 02
    jsr set_object_position_from_cell_xy                              ; 3e24: 20 5d 1f
    tax                                                               ; 3e27: aa
    lda #1                                                            ; 3e28: a9 01
    sta object_direction,x                                            ; 3e2a: 9d be 09
    ldx #$17                                                          ; 3e2d: a2 17
    lda #objectid_right_trapdoor                                      ; 3e2f: a9 03
    jsr set_object_position_from_cell_xy                              ; 3e31: 20 5d 1f
    tax                                                               ; 3e34: aa
    lda #$ff                                                          ; 3e35: a9 ff
    sta object_direction,x                                            ; 3e37: 9d be 09
    lda #3                                                            ; 3e3a: a9 03
    sta value_to_write_to_collision_map                               ; 3e3c: 85 3e
; Set up the collision map for the two trapdoors.
    lda room1_trapdoor_open_flag                                      ; 3e3e: ad ff 09
    bne set_up_open_trapdoor_collision_map                            ; 3e41: d0 12
; Set up the trapdoor collision map if they are closed.
    ldx #$11                                                          ; 3e43: a2 11
    ldy #7                                                            ; 3e45: a0 07
    lda #6                                                            ; 3e47: a9 06
    sta width_in_cells                                                ; 3e49: 85 3c
    lda #1                                                            ; 3e4b: a9 01
    sta height_in_cells                                               ; 3e4d: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e4f: 20 44 1e
    jmp room1_initial_setup_done                                      ; 3e52: 4c 69 3e

set_up_open_trapdoor_collision_map
    ldx #$11                                                          ; 3e55: a2 11
    ldy #8                                                            ; 3e57: a0 08
    lda #1                                                            ; 3e59: a9 01
    sta width_in_cells                                                ; 3e5b: 85 3c
    lda #2                                                            ; 3e5d: a9 02
    sta height_in_cells                                               ; 3e5f: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e61: 20 44 1e
    ldx #$16                                                          ; 3e64: a2 16
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e66: 20 44 1e
room1_initial_setup_done
    jmp set_room1_trapdoor_sprites_if_required                        ; 3e69: 4c d7 3e

room1_not_first_update
    ldy room1_trapdoor_open_flag                                      ; 3e6c: ac ff 09
    bmi set_room1_trapdoor_sprites_if_required                        ; 3e6f: 30 66
    bne increment_trapdoor_open_flag                                  ; 3e71: d0 4e
    lda desired_room_index                                            ; 3e73: a5 30
    cmp #1                                                            ; 3e75: c9 01
    bne set_room1_trapdoor_sprites_if_required                        ; 3e77: d0 5e
    lda player_held_object_spriteid                                   ; 3e79: a5 52
    beq set_room1_trapdoor_sprites_if_required                        ; 3e7b: f0 5a
    lda object_x_high                                                 ; 3e7d: ad 66 09
    bne set_room1_trapdoor_sprites_if_required                        ; 3e80: d0 55
    lda object_x_low                                                  ; 3e82: ad 50 09
    cmp #$88                                                          ; 3e85: c9 88
    bcc set_room1_trapdoor_sprites_if_required                        ; 3e87: 90 4e
    cmp #$b8                                                          ; 3e89: c9 b8
    bcs set_room1_trapdoor_sprites_if_required                        ; 3e8b: b0 4a
    lda #2                                                            ; 3e8d: a9 02
    sta temp_bottom_offset                                            ; 3e8f: 8d 51 25
    lda #objectid_something                                           ; 3e92: a9 0b
    jsr get_solid_rock_collision_for_object_a                         ; 3e94: 20 94 28
    beq set_room1_trapdoor_sprites_if_required                        ; 3e97: f0 3e
; Remove the closed trapdoor from the collision map.
    ldx #$11                                                          ; 3e99: a2 11
    ldy #7                                                            ; 3e9b: a0 07
    lda #6                                                            ; 3e9d: a9 06
    sta width_in_cells                                                ; 3e9f: 85 3c
    lda #1                                                            ; 3ea1: a9 01
    sta height_in_cells                                               ; 3ea3: 85 3d
    lda #0                                                            ; 3ea5: a9 00
    sta value_to_write_to_collision_map                               ; 3ea7: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3ea9: 20 44 1e
; Add the two open trapdoors to the collision map.
    iny                                                               ; 3eac: c8
    lda #1                                                            ; 3ead: a9 01
    sta width_in_cells                                                ; 3eaf: 85 3c
    lda #2                                                            ; 3eb1: a9 02
    sta height_in_cells                                               ; 3eb3: 85 3d
    lda #3                                                            ; 3eb5: a9 03
    sta value_to_write_to_collision_map                               ; 3eb7: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3eb9: 20 44 1e
    ldx #$16                                                          ; 3ebc: a2 16
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3ebe: 20 44 1e
increment_trapdoor_open_flag
    ldy room1_trapdoor_open_flag                                      ; 3ec1: ac ff 09
    iny                                                               ; 3ec4: c8
    cpy #2                                                            ; 3ec5: c0 02
    bcc new_room1_trapdoor_open_flag_in_y                             ; 3ec7: 90 0b
    lda desired_room_index                                            ; 3ec9: a5 30
    cmp #1                                                            ; 3ecb: c9 01
    bne skip_play_sound                                               ; 3ecd: d0 03
; TODO: Pretty confident this is the trapdoor opening sound, but this is called
; elsewhere so don't want to rename subroutine yet
    jsr play_some_sound1_then_some_sound2                             ; 3ecf: 20 f1 3e
skip_play_sound
    ldy #$ff                                                          ; 3ed2: a0 ff
new_room1_trapdoor_open_flag_in_y
    sty room1_trapdoor_open_flag                                      ; 3ed4: 8c ff 09
set_room1_trapdoor_sprites_if_required
    lda desired_room_index                                            ; 3ed7: a5 30
    cmp #1                                                            ; 3ed9: c9 01
    bne return2                                                       ; 3edb: d0 10
    ldy room1_trapdoor_open_flag                                      ; 3edd: ac ff 09
    bpl adjusted_room1_trapdoor_open_flag_in_y_is_ge_0                ; 3ee0: 10 02
; Use sprite index 2 (vertical) if room1_trapdoor_open_flag is $ff
    ldy #2                                                            ; 3ee2: a0 02
adjusted_room1_trapdoor_open_flag_in_y_is_ge_0
    lda trapdoor_sprite_table,y                                       ; 3ee4: b9 ee 3e
    sta object_spriteid + objectid_left_trapdoor                      ; 3ee7: 8d aa 09
    sta object_spriteid + objectid_right_trapdoor                     ; 3eea: 8d ab 09
return2
    rts                                                               ; 3eed: 60

trapdoor_sprite_table
    !byte spriteid_trapdoor_horizontal                                ; 3eee: cf
    !byte spriteid_trapdoor_diagonal                                  ; 3eef: d0
    !byte spriteid_trapdoor_vertical                                  ; 3ef0: d1

play_some_sound1_then_some_sound2
    lda #0                                                            ; 3ef1: a9 00
    ldx #<some_sound1                                                 ; 3ef3: a2 42
    ldy #>some_sound1                                                 ; 3ef5: a0 44
    jsr play_sound_yx                                                 ; 3ef7: 20 f6 38
    ldx #<some_sound2                                                 ; 3efa: a2 3a
    ldy #>some_sound2                                                 ; 3efc: a0 44
    jsr play_sound_yx                                                 ; 3efe: 20 f6 38
    rts                                                               ; 3f01: 60

room1_saxophone_and_brazier_handler
    lda #1                                                            ; 3f02: a9 01
    sta currently_updating_logic_for_room_index                       ; 3f04: 8d ba 1a
    lda #objectid_brazier                                             ; 3f07: a9 05
    ldx #$1a                                                          ; 3f09: a2 1a
    ldy #$0e                                                          ; 3f0b: a0 0e
    jsr update_brazier_and_fire                                       ; 3f0d: 20 88 19
    lda update_room_first_update_flag                                 ; 3f10: ad 2b 13
    beq not_first_room_update                                         ; 3f13: f0 3d
    lda #spriteid_saxophone2                                          ; 3f15: a9 d3
    sta toolbar_collectable_spriteids + 1                             ; 3f17: 8d e9 2e
    lda #spriteid_saxophone1                                          ; 3f1a: a9 d2
    sta collectable_spriteids + 1                                     ; 3f1c: 8d ee 2e
    sta five_byte_table_paired_with_collectable_sprite_ids + 1        ; 3f1f: 8d f3 2e
    ldx #<envelope3                                                   ; 3f22: a2 16
    ldy #>envelope3                                                   ; 3f24: a0 44
    jsr define_envelope                                               ; 3f26: 20 5e 39
    lda desired_room_index                                            ; 3f29: a5 30
    cmp #1                                                            ; 3f2b: c9 01
    bne return3                                                       ; 3f2d: d0 22
    lda saxophone_collected_flag                                      ; 3f2f: ad 00 0a
    bne return3                                                       ; 3f32: d0 1d
; The player has not collected the saxophone, so place it in the lower left of the
; room.
    ldx #$1b                                                          ; 3f34: a2 1b
    ldy #$12                                                          ; 3f36: a0 12
    lda #7                                                            ; 3f38: a9 07
    sta temp_sprite_y_offset                                          ; 3f3a: 85 3b
    lda #objectid_saxophone                                           ; 3f3c: a9 04
    jsr set_object_position_from_cell_xy                              ; 3f3e: 20 5d 1f
    tax                                                               ; 3f41: aa
    lda #1                                                            ; 3f42: a9 01
    sta object_direction,x                                            ; 3f44: 9d be 09
    lda #spriteid_zero_size1                                          ; 3f47: a9 cc
    sta object_sprite_mask_type,x                                     ; 3f49: 9d ac 38
    lda #spriteid_saxophone1                                          ; 3f4c: a9 d2
    sta object_spriteid,x                                             ; 3f4e: 9d a8 09
return3
    rts                                                               ; 3f51: 60

not_first_room_update
    lda player_using_object_spriteid                                  ; 3f52: ad b6 2e
    cmp #spriteid_saxophone2                                          ; 3f55: c9 d3
    bne dont_play_sound3                                              ; 3f57: d0 09
    lda #0                                                            ; 3f59: a9 00
    ldx #<some_sound3                                                 ; 3f5b: a2 24
    ldy #>some_sound3                                                 ; 3f5d: a0 44
    jsr play_sound_yx                                                 ; 3f5f: 20 f6 38
dont_play_sound3
    lda desired_room_index                                            ; 3f62: a5 30
    cmp #1                                                            ; 3f64: c9 01
    bne return6                                                       ; 3f66: d0 22
    lda saxophone_collected_flag                                      ; 3f68: ad 00 0a
    bne return6                                                       ; 3f6b: d0 1d
    lda #$d2                                                          ; 3f6d: a9 d2
    sta object_spriteid + objectid_saxophone                          ; 3f6f: 8d ac 09
    ldx #objectid_something                                           ; 3f72: a2 0b
    ldy #objectid_saxophone                                           ; 3f74: a0 04
    jsr test_for_collision_between_objects_x_and_y                    ; 3f76: 20 e2 28
    beq return6                                                       ; 3f79: f0 0f
; This is handling 'collection of the saxophone'
    lda #spriteid_saxophone2                                          ; 3f7b: a9 d3
    jsr find_or_create_menu_slot_for_A                                ; 3f7d: 20 bd 2b
    lda #0                                                            ; 3f80: a9 00
    sta object_spriteid + objectid_saxophone                          ; 3f82: 8d ac 09
    lda #$ff                                                          ; 3f85: a9 ff
    sta saxophone_collected_flag                                      ; 3f87: 8d 00 0a
return6
    rts                                                               ; 3f8a: 60

; *************************************************************************************
; 
; Use copy_rectangle_of_memory_to_screen repeatedly to create a pseudo-circle shape -
; room 1 (the baby/spell room) has one of these in each corner.
; 
; On Entry:
;     X and Y registers specify top left cell of pseudo-circle
;     Everything else except {width,height}_in_cells_to_write as for
;         copy_rectangle_of_memory_to_screen
; 
; On Exit:
;     Preserves X,Y
; 
; *************************************************************************************
copy_pseudo_circle_to_screen
    stx copy_pseudo_circle_to_screen_saved_x                          ; 3f8b: 8e d5 3f
    sty copy_pseudo_circle_to_screen_saved_y                          ; 3f8e: 8c d6 3f
    inx                                                               ; 3f91: e8
    inx                                                               ; 3f92: e8
    lda #5                                                            ; 3f93: a9 05
    sta width_in_cells                                                ; 3f95: 85 3c
    lda #1                                                            ; 3f97: a9 01
    sta height_in_cells                                               ; 3f99: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f9b: 20 bb 1a
    dex                                                               ; 3f9e: ca
    iny                                                               ; 3f9f: c8
    lda #7                                                            ; 3fa0: a9 07
    sta width_in_cells                                                ; 3fa2: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3fa4: 20 bb 1a
    dex                                                               ; 3fa7: ca
    iny                                                               ; 3fa8: c8
    lda #9                                                            ; 3fa9: a9 09
    sta width_in_cells                                                ; 3fab: 85 3c
    lda #5                                                            ; 3fad: a9 05
    sta height_in_cells                                               ; 3faf: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fb1: 20 bb 1a
    inx                                                               ; 3fb4: e8
    tya                                                               ; 3fb5: 98
    clc                                                               ; 3fb6: 18
    adc #5                                                            ; 3fb7: 69 05
    tay                                                               ; 3fb9: a8
    lda #7                                                            ; 3fba: a9 07
    sta width_in_cells                                                ; 3fbc: 85 3c
    lda #1                                                            ; 3fbe: a9 01
    sta height_in_cells                                               ; 3fc0: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fc2: 20 bb 1a
    inx                                                               ; 3fc5: e8
    iny                                                               ; 3fc6: c8
    lda #5                                                            ; 3fc7: a9 05
    sta width_in_cells                                                ; 3fc9: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3fcb: 20 bb 1a
    ldx copy_pseudo_circle_to_screen_saved_x                          ; 3fce: ae d5 3f
    ldy copy_pseudo_circle_to_screen_saved_y                          ; 3fd1: ac d6 3f
    rts                                                               ; 3fd4: 60

copy_pseudo_circle_to_screen_saved_x
    !byte 0                                                           ; 3fd5: 00
copy_pseudo_circle_to_screen_saved_y
    !byte 0                                                           ; 3fd6: 00
; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 20                                                          ; 3fd7: 14                      ; initial player X cell
    !byte 9                                                           ; 3fd8: 09                      ; initial player Y cell

room_2_code
    ldx #0                                                            ; 3fd9: a2 00
    ldy #0                                                            ; 3fdb: a0 00
    lda #$ff                                                          ; 3fdd: a9 ff
    sta width_in_cells                                                ; 3fdf: 85 3c
    sta height_in_cells                                               ; 3fe1: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fe3: 20 bb 1a
    lda #<tile_all_set_pixels                                         ; 3fe6: a9 a9
    sta source_sprite_memory_low                                      ; 3fe8: 85 40
    lda #>tile_all_set_pixels                                         ; 3fea: a9 0a
    sta source_sprite_memory_high                                     ; 3fec: 85 41
    lda #0                                                            ; 3fee: a9 00
    sta value_to_write_to_collision_map                               ; 3ff0: 85 3e
    lda #copy_mode_simple                                             ; 3ff2: a9 01
    sta copy_mode                                                     ; 3ff4: 85 42
    ldx #3                                                            ; 3ff6: a2 03
    ldy #2                                                            ; 3ff8: a0 02
    jsr copy_pseudo_circle_to_screen                                  ; 3ffa: 20 8b 3f
    ldx #$1c                                                          ; 3ffd: a2 1c
    jsr copy_pseudo_circle_to_screen                                  ; 3fff: 20 8b 3f
    ldy #$0d                                                          ; 4002: a0 0d
    jsr copy_pseudo_circle_to_screen                                  ; 4004: 20 8b 3f
    ldx #3                                                            ; 4007: a2 03
    jsr copy_pseudo_circle_to_screen                                  ; 4009: 20 8b 3f
    ldx #$11                                                          ; 400c: a2 11
    ldy #0                                                            ; 400e: a0 00
    lda #6                                                            ; 4010: a9 06
    sta width_in_cells                                                ; 4012: 85 3c
    lda #4                                                            ; 4014: a9 04
    sta height_in_cells                                               ; 4016: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4018: 20 bb 1a
    ldx #$0c                                                          ; 401b: a2 0c
    ldy #4                                                            ; 401d: a0 04
    lda #$10                                                          ; 401f: a9 10
    sta width_in_cells                                                ; 4021: 85 3c
    lda #5                                                            ; 4023: a9 05
    sta height_in_cells                                               ; 4025: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4027: 20 bb 1a
    ldy #$0f                                                          ; 402a: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 402c: 20 bb 1a
    ldx #$1e                                                          ; 402f: a2 1e
    ldy #$0b                                                          ; 4031: a0 0b
    lda #5                                                            ; 4033: a9 05
    sta width_in_cells                                                ; 4035: 85 3c
    lda #2                                                            ; 4037: a9 02
    sta height_in_cells                                               ; 4039: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 403b: 20 bb 1a
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 403e: 20 90 1b
    jsr start_room                                                    ; 4041: 20 bb 12
loop_until_exit_room_top
    jsr game_update                                                   ; 4044: 20 da 12
    and #exit_room_top                                                ; 4047: 29 08
    beq loop_until_exit_room_top                                      ; 4049: f0 f9
    ldx #1                                                            ; 404b: a2 01
    ldy current_level                                                 ; 404d: a4 31
    jmp initialise_level_and_room                                     ; 404f: 4c 40 11

baby_spriteid_data
    !byte spriteid_baby0                                              ; 4052: d6
    !byte spriteid_baby1                                              ; 4053: d7
    !byte spriteid_baby2                                              ; 4054: d8
    !byte spriteid_baby3                                              ; 4055: d9
    !byte 0                                                           ; 4056: 00
    !byte spriteid_baby7                                              ; 4057: dd
    !byte spriteid_baby7                                              ; 4058: dd
    !byte spriteid_baby7                                              ; 4059: dd
    !byte spriteid_baby7                                              ; 405a: dd
    !byte spriteid_baby7                                              ; 405b: dd
    !byte spriteid_baby7                                              ; 405c: dd
    !byte spriteid_baby7                                              ; 405d: dd
    !byte spriteid_baby7                                              ; 405e: dd
    !byte $ff                                                         ; 405f: ff
    !byte spriteid_baby4                                              ; 4060: da
    !byte spriteid_baby4                                              ; 4061: da
    !byte spriteid_baby4                                              ; 4062: da
    !byte spriteid_baby4                                              ; 4063: da
    !byte spriteid_baby4                                              ; 4064: da
    !byte spriteid_baby4                                              ; 4065: da
    !byte spriteid_baby4                                              ; 4066: da
    !byte spriteid_baby4                                              ; 4067: da
    !byte spriteid_baby4                                              ; 4068: da
    !byte spriteid_baby4                                              ; 4069: da
    !byte 0                                                           ; 406a: 00
    !byte spriteid_baby5                                              ; 406b: db
    !byte spriteid_baby5                                              ; 406c: db
    !byte spriteid_baby5                                              ; 406d: db
    !byte spriteid_baby5                                              ; 406e: db
    !byte spriteid_baby5                                              ; 406f: db
    !byte spriteid_baby5                                              ; 4070: db
    !byte spriteid_baby5                                              ; 4071: db
    !byte spriteid_baby5                                              ; 4072: db
    !byte $ff                                                         ; 4073: ff
    !byte spriteid_baby3                                              ; 4074: d9
    !byte spriteid_baby3                                              ; 4075: d9
    !byte spriteid_baby3                                              ; 4076: d9
    !byte spriteid_baby3                                              ; 4077: d9
    !byte spriteid_baby3                                              ; 4078: d9
    !byte spriteid_baby3                                              ; 4079: d9
    !byte spriteid_baby3                                              ; 407a: d9
    !byte spriteid_baby3                                              ; 407b: d9
    !byte 0                                                           ; 407c: 00
    !byte spriteid_baby6                                              ; 407d: dc
    !byte 0                                                           ; 407e: 00

; *************************************************************************************
; 
; Room 2 update
; 
; Room 2 has the spell, guarded by a baby.
; 
; *************************************************************************************
room2_update_handler
    lda #2                                                            ; 407f: a9 02
    sta currently_updating_logic_for_room_index                       ; 4081: 8d ba 1a
    lda #3                                                            ; 4084: a9 03                   ; redundant instruction
    ldx #3                                                            ; 4086: a2 03                   ; redundant instruction
    ldy #$11                                                          ; 4088: a0 11                   ; redundant instruction
    ldx #7                                                            ; 408a: a2 07
    lda #4                                                            ; 408c: a9 04
    sta temp_sprite_x_offset                                          ; 408e: 85 3a
    ldy #$16                                                          ; 4090: a0 16
    lda #objectid_spell                                               ; 4092: a9 05
    jsr update_level_completion                                       ; 4094: 20 10 1a
    lda update_room_first_update_flag                                 ; 4097: ad 2b 13
    beq room2_not_first_update                                        ; 409a: f0 48
    lda current_level                                                 ; 409c: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 409e: c5 51
    beq room2_update_handler_not_new_level                            ; 40a0: f0 1f
    ldy #$2b ; '+'                                                    ; 40a2: a0 2b
    lda save_game_level_a_room_2_baby_direction                       ; 40a4: ad 04 0a
    ldx save_game_level_a_room_2_baby_pixel_x_coordinate              ; 40a7: ae 03 0a
    bne have_valid_baby_properties_in_axy                             ; 40aa: d0 06
    ldy #0                                                            ; 40ac: a0 00
    lda #1                                                            ; 40ae: a9 01
    ldx #$a0                                                          ; 40b0: a2 a0
have_valid_baby_properties_in_axy
    sty baby_spriteid_index_if_baby_spriteid_data_is_zero             ; 40b2: 8c 72 0a
    sty baby_sprite_index                                             ; 40b5: 8c 73 0a
    sta save_game_level_a_room_2_baby_direction                       ; 40b8: 8d 04 0a
    sta baby_pixel_x_speed                                            ; 40bb: 8d 71 0a
    stx baby_pixel_x_coordinate                                       ; 40be: 8e 70 0a
room2_update_handler_not_new_level
    lda desired_room_index                                            ; 40c1: a5 30
    cmp #2                                                            ; 40c3: c9 02
    bne room2_update_second_part_local                                ; 40c5: d0 19
    ldx #<envelope2                                                   ; 40c7: a2 2c
    ldy #>envelope2                                                   ; 40c9: a0 44
    jsr define_envelope                                               ; 40cb: 20 5e 39
    ldx #0                                                            ; 40ce: a2 00
    ldy #$14                                                          ; 40d0: a0 14
    lda #$fe                                                          ; 40d2: a9 fe
    sta temp_sprite_y_offset                                          ; 40d4: 85 3b
    lda #objectid_baby                                                ; 40d6: a9 02
    jsr set_object_position_from_cell_xy                              ; 40d8: 20 5d 1f
    lda #spriteid_zero_size1                                          ; 40db: a9 cc
    sta object_sprite_mask_type + objectid_baby                       ; 40dd: 8d ae 38
room2_update_second_part_local
    jmp room2_update_second_part                                      ; 40e0: 4c d9 41

room2_update_handler_temp
    !byte 0                                                           ; 40e3: 00

room2_not_first_update
    ldy baby_sprite_index                                             ; 40e4: ac 73 0a
    cpy #baby_spriteid_data_entries_minus_1                           ; 40e7: c0 2b
    bne not_at_last_baby_spriteid_entry                               ; 40e9: d0 03
    jmp room2_update_second_part                                      ; 40eb: 4c d9 41

not_at_last_baby_spriteid_entry
    iny                                                               ; 40ee: c8
    lda baby_spriteid_data,y                                          ; 40ef: b9 52 40
    bne have_specific_baby_spriteid                                   ; 40f2: d0 03
; TODO: I suspect what happens here is that there are multiple animation sequences and
; 0 means 'jump to a new sequence, identified by baby_sprite_index_if...'
    ldy baby_spriteid_index_if_baby_spriteid_data_is_zero             ; 40f4: ac 72 0a
have_specific_baby_spriteid
    lda desired_room_index                                            ; 40f7: a5 30
    cmp #2                                                            ; 40f9: c9 02
    bne player_not_collided_with_baby                                 ; 40fb: d0 31
    lda baby_spriteid_index_if_baby_spriteid_data_is_zero             ; 40fd: ad 72 0a
    cmp #baby_spriteid_data_entries_minus_1                           ; 4100: c9 2b
    beq baby_spriteid_index_if_baby_spriteid_data_is_zero_set         ; 4102: f0 27
    ldx #objectid_player                                              ; 4104: a2 00
    sty room2_update_handler_temp                                     ; 4106: 8c e3 40
    ldy #objectid_baby                                                ; 4109: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 410b: 20 e2 28
    ldy room2_update_handler_temp                                     ; 410e: ac e3 40
    ora #0                                                            ; 4111: 09 00                   ; set flags to reflect value in set flags to reflect value in A
    beq player_not_collided_with_baby                                 ; 4113: f0 19
    lda #player_collision_flag_baby                                   ; 4115: a9 06
    sta player_wall_collision_flag                                    ; 4117: 8d 33 24
    lda #0                                                            ; 411a: a9 00
    sta player_using_object_spriteid                                  ; 411c: 8d b6 2e
    lda #1                                                            ; 411f: a9 01
    sta save_game_level_a_room_2_baby_direction                       ; 4121: 8d 04 0a
    ldy #$22 ; '"'                                                    ; 4124: a0 22
    lda #5                                                            ; 4126: a9 05
    sta baby_spriteid_index_if_baby_spriteid_data_is_zero             ; 4128: 8d 72 0a
baby_spriteid_index_if_baby_spriteid_data_is_zero_set
    jmp move_baby                                                     ; 412b: 4c ae 41

; Y contains an index into baby_spriteid_data
player_not_collided_with_baby
    cpy #some_specific_baby_spriteid_index_entry                      ; 412e: c0 21
    bne c4137                                                         ; 4130: d0 05
    ldy #5                                                            ; 4132: a0 05
    sty baby_spriteid_index_if_baby_spriteid_data_is_zero             ; 4134: 8c 72 0a
c4137
    lda desired_room_index                                            ; 4137: a5 30
    cmp #2                                                            ; 4139: c9 02
    bne c415e                                                         ; 413b: d0 21
    lda player_using_object_spriteid                                  ; 413d: ad b6 2e
    cmp #spriteid_saxophone2                                          ; 4140: c9 d3
    bne c415e                                                         ; 4142: d0 1a
    ldy #$0e                                                          ; 4144: a0 0e
    lda #$19                                                          ; 4146: a9 19
    sta baby_spriteid_index_if_baby_spriteid_data_is_zero             ; 4148: 8d 72 0a
    lda object_y_low                                                  ; 414b: ad 7c 09
    cmp #$a0                                                          ; 414e: c9 a0
    bcs move_baby                                                     ; 4150: b0 5c
    cmp #$78 ; 'x'                                                    ; 4152: c9 78
    bcc move_baby                                                     ; 4154: 90 58
    lda #$2b ; '+'                                                    ; 4156: a9 2b
    sta baby_spriteid_index_if_baby_spriteid_data_is_zero             ; 4158: 8d 72 0a
    jmp move_baby                                                     ; 415b: 4c ae 41

c415e
    cpy #$0d                                                          ; 415e: c0 0d
    bne c4167                                                         ; 4160: d0 05
    ldy #0                                                            ; 4162: a0 00
    sty baby_spriteid_index_if_baby_spriteid_data_is_zero             ; 4164: 8c 72 0a
c4167
    lda baby_spriteid_index_if_baby_spriteid_data_is_zero             ; 4167: ad 72 0a
    cmp #0                                                            ; 416a: c9 00
    bne move_baby                                                     ; 416c: d0 40
    lda baby_pixel_x_speed                                            ; 416e: ad 71 0a
    sta save_game_level_a_room_2_baby_direction                       ; 4171: 8d 04 0a
    lda baby_pixel_x_coordinate                                       ; 4174: ad 70 0a
    ldx baby_pixel_x_speed                                            ; 4177: ae 71 0a
    bmi c4184                                                         ; 417a: 30 08
    cmp #baby_max_pixel_x                                             ; 417c: c9 d4
    beq c418c                                                         ; 417e: f0 0c
    bcc c419f                                                         ; 4180: 90 1d
    bcs c4194                                                         ; 4182: b0 10
c4184
    cmp #$6c ; 'l'                                                    ; 4184: c9 6c
    beq c418c                                                         ; 4186: f0 04
    bcs c419f                                                         ; 4188: b0 15
    bcc c4194                                                         ; 418a: 90 08
c418c
    ldy #5                                                            ; 418c: a0 05
    sty baby_spriteid_index_if_baby_spriteid_data_is_zero             ; 418e: 8c 72 0a
    jmp c419f                                                         ; 4191: 4c 9f 41

c4194
    lda baby_pixel_x_speed                                            ; 4194: ad 71 0a
    eor #$fe                                                          ; 4197: 49 fe
    sta baby_pixel_x_speed                                            ; 4199: 8d 71 0a
    sta save_game_level_a_room_2_baby_direction                       ; 419c: 8d 04 0a
c419f
    lda baby_pixel_x_speed                                            ; 419f: ad 71 0a
    asl                                                               ; 41a2: 0a
    asl                                                               ; 41a3: 0a
    clc                                                               ; 41a4: 18
    adc baby_pixel_x_coordinate                                       ; 41a5: 6d 70 0a
    sta baby_pixel_x_coordinate                                       ; 41a8: 8d 70 0a
    jmp c41c9                                                         ; 41ab: 4c c9 41

move_baby
    lda save_game_level_a_room_2_baby_direction                       ; 41ae: ad 04 0a
    bmi baby_direction_negative                                       ; 41b1: 30 0e
    lda baby_pixel_x_coordinate                                       ; 41b3: ad 70 0a
    clc                                                               ; 41b6: 18
    adc #4                                                            ; 41b7: 69 04
    and #$f8                                                          ; 41b9: 29 f8
    sta baby_pixel_x_coordinate                                       ; 41bb: 8d 70 0a
    jmp c41c9                                                         ; 41be: 4c c9 41

; TODO: This doesn't seem to be subtracting from baby_pixel_x_coordinate, suggesting
; 'baby_direction' is not quite what I thought
baby_direction_negative
    lda baby_pixel_x_coordinate                                       ; 41c1: ad 70 0a
    and #$f8                                                          ; 41c4: 29 f8
    sta baby_pixel_x_coordinate                                       ; 41c6: 8d 70 0a
c41c9
    sty baby_sprite_index                                             ; 41c9: 8c 73 0a
    lda desired_room_index                                            ; 41cc: a5 30
    cmp #2                                                            ; 41ce: c9 02
    bne room2_update_second_part                                      ; 41d0: d0 07
    cpy #baby_spriteid_data_entries_minus_1                           ; 41d2: c0 2b
    bne room2_update_second_part                                      ; 41d4: d0 03
    jsr play_some_sound1_then_some_sound2                             ; 41d6: 20 f1 3e
room2_update_second_part
    lda desired_room_index                                            ; 41d9: a5 30
    cmp #2                                                            ; 41db: c9 02
    bne return5                                                       ; 41dd: d0 6d
    lda baby_spriteid_index_if_baby_spriteid_data_is_zero             ; 41df: ad 72 0a
    cmp #baby_spriteid_data_entries_minus_1                           ; 41e2: c9 2b
    bne set_baby_object_properties                                    ; 41e4: d0 4f
    lda baby_pixel_x_coordinate                                       ; 41e6: ad 70 0a
    sta save_game_level_a_room_2_baby_pixel_x_coordinate              ; 41e9: 8d 03 0a
    lsr                                                               ; 41ec: 4a
    lsr                                                               ; 41ed: 4a
    lsr                                                               ; 41ee: 4a
    tax                                                               ; 41ef: aa
    lda baby_sprite_index                                             ; 41f0: ad 73 0a
    cmp #baby_spriteid_data_entries_minus_1                           ; 41f3: c9 2b
    beq update_collision_map_for_baby                                 ; 41f5: f0 15
; Add the baby to the collision map.
    dex                                                               ; 41f7: ca
    ldy #$11                                                          ; 41f8: a0 11
    lda #2                                                            ; 41fa: a9 02
    sta width_in_cells                                                ; 41fc: 85 3c
    lda #3                                                            ; 41fe: a9 03
    sta height_in_cells                                               ; 4200: 85 3d
    lda #3                                                            ; 4202: a9 03
    sta value_to_write_to_collision_map                               ; 4204: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 4206: 20 44 1e
    jmp set_baby_object_properties                                    ; 4209: 4c 35 42

; Remove the baby from the collision map (TODO: at its old position?) and add it at its
; new position. TODO: Looking at the change in Y position and the change in
; width/heigh, I suspect this is handling the baby being killed and falling flat
update_collision_map_for_baby
    dex                                                               ; 420c: ca
    ldy #$11                                                          ; 420d: a0 11
    lda #2                                                            ; 420f: a9 02
    sta width_in_cells                                                ; 4211: 85 3c
    lda #3                                                            ; 4213: a9 03
    sta height_in_cells                                               ; 4215: 85 3d
    lda #0                                                            ; 4217: a9 00
    sta value_to_write_to_collision_map                               ; 4219: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 421b: 20 44 1e
    lda save_game_level_a_room_2_baby_direction                       ; 421e: ad 04 0a
    bmi baby_direction_negative2                                      ; 4221: 30 01
    dex                                                               ; 4223: ca
baby_direction_negative2
    ldy #$13                                                          ; 4224: a0 13
    lda #3                                                            ; 4226: a9 03
    sta width_in_cells                                                ; 4228: 85 3c
    lda #1                                                            ; 422a: a9 01
    sta height_in_cells                                               ; 422c: 85 3d
    lda #3                                                            ; 422e: a9 03
    sta value_to_write_to_collision_map                               ; 4230: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 4232: 20 44 1e
set_baby_object_properties
    ldx #2                                                            ; 4235: a2 02
    lda baby_pixel_x_coordinate                                       ; 4237: ad 70 0a
    sta object_x_low,x                                                ; 423a: 9d 50 09
    ldy baby_sprite_index                                             ; 423d: ac 73 0a
    lda baby_spriteid_data,y                                          ; 4240: b9 52 40
    sta object_spriteid,x                                             ; 4243: 9d a8 09
    lda save_game_level_a_room_2_baby_direction                       ; 4246: ad 04 0a
    sta object_direction,x                                            ; 4249: 9d be 09
return5
    rts                                                               ; 424c: 60

; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 20                                                          ; 424d: 14                      ; initial player X cell
    !byte 7                                                           ; 424e: 07                      ; initial player Y cell

room_3_code
    ldx #0                                                            ; 424f: a2 00
    ldy #0                                                            ; 4251: a0 00
    lda #$ff                                                          ; 4253: a9 ff
    sta width_in_cells                                                ; 4255: 85 3c
    lda #2                                                            ; 4257: a9 02
    sta height_in_cells                                               ; 4259: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 425b: 20 bb 1a
    ldx #$24 ; '$'                                                    ; 425e: a2 24
    ldy #2                                                            ; 4260: a0 02
    dec height_in_cells                                               ; 4262: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4264: 20 bb 1a
    inx                                                               ; 4267: e8
    iny                                                               ; 4268: c8
    lda #$0f                                                          ; 4269: a9 0f
    sta height_in_cells                                               ; 426b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 426d: 20 bb 1a
    ldx #0                                                            ; 4270: a2 00
    ldy #$12                                                          ; 4272: a0 12
    lda #5                                                            ; 4274: a9 05
    sta width_in_cells                                                ; 4276: 85 3c
    lda #3                                                            ; 4278: a9 03
    sta height_in_cells                                               ; 427a: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 427c: 20 bb 1a
    ldx #$1e                                                          ; 427f: a2 1e
    lda #$ff                                                          ; 4281: a9 ff
    sta width_in_cells                                                ; 4283: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 4285: 20 bb 1a
    ldx #0                                                            ; 4288: a2 00
    ldy #$15                                                          ; 428a: a0 15
    lda #$0a                                                          ; 428c: a9 0a
    sta width_in_cells                                                ; 428e: 85 3c
    lda #1                                                            ; 4290: a9 01
    sta height_in_cells                                               ; 4292: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4294: 20 bb 1a
    ldx #$19                                                          ; 4297: a2 19
    lda #$ff                                                          ; 4299: a9 ff
    sta width_in_cells                                                ; 429b: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 429d: 20 bb 1a
    ldx #0                                                            ; 42a0: a2 00
    iny                                                               ; 42a2: c8
    inc height_in_cells                                               ; 42a3: e6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42a5: 20 bb 1a
    ldx #$0a                                                          ; 42a8: a2 0a
    ldy #7                                                            ; 42aa: a0 07
    lda #$14                                                          ; 42ac: a9 14
    sta width_in_cells                                                ; 42ae: 85 3c
    lda #2                                                            ; 42b0: a9 02
    sta height_in_cells                                               ; 42b2: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42b4: 20 bb 1a
    ldx #0                                                            ; 42b7: a2 00
    lda #5                                                            ; 42b9: a9 05
    sta width_in_cells                                                ; 42bb: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 42bd: 20 bb 1a
    ldy #9                                                            ; 42c0: a0 09
    lda #3                                                            ; 42c2: a9 03
    sta width_in_cells                                                ; 42c4: 85 3c
    lda #4                                                            ; 42c6: a9 04
    sta height_in_cells                                               ; 42c8: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42ca: 20 bb 1a
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 42cd: 20 90 1b
    ldx #$14                                                          ; 42d0: a2 14
    ldy #$0c                                                          ; 42d2: a0 0c
    lda #spriteid_ball                                                ; 42d4: a9 3b
    jsr draw_sprite_a_at_cell_xy                                      ; 42d6: 20 4c 1f
    lda #3                                                            ; 42d9: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 42db: 20 bb 1e
    ldx #$21 ; '!'                                                    ; 42de: a2 21
    ldy #2                                                            ; 42e0: a0 02
    lda #$0e                                                          ; 42e2: a9 0e
    jsr draw_rope                                                     ; 42e4: 20 b9 1d
    jsr start_room                                                    ; 42e7: 20 bb 12
loop_until_exit_room_left
    jsr game_update                                                   ; 42ea: 20 da 12
    and #exit_room_left                                               ; 42ed: 29 01
    beq loop_until_exit_room_left                                     ; 42ef: f0 f9
    ldx #1                                                            ; 42f1: a2 01
    ldy current_level                                                 ; 42f3: a4 31
    jmp initialise_level_and_room                                     ; 42f5: 4c 40 11

; *************************************************************************************
; 
; Room 3 update
; 
; Room 3 has a table which can be pushed to the left or right side of the screen.
; 
; *************************************************************************************
room3_update_handler
    lda #3                                                            ; 42f8: a9 03
    sta currently_updating_logic_for_room_index                       ; 42fa: 8d ba 1a
    lda #objectid_brazier2                                            ; 42fd: a9 03
    ldx #$14                                                          ; 42ff: a2 14
    ldy #$0c                                                          ; 4301: a0 0c
    jsr update_brazier_and_fire                                       ; 4303: 20 88 19
    lda #4                                                            ; 4306: a9 04
    inx                                                               ; 4308: e8
    jsr update_brazier_and_fire                                       ; 4309: 20 88 19
    lda update_room_first_update_flag                                 ; 430c: ad 2b 13
    beq room3_not_first_update                                        ; 430f: f0 47
    lda level_before_latest_level_and_room_initialisation             ; 4311: a5 51
    cmp current_level                                                 ; 4313: c5 31
    beq table_x_position_update_finished                              ; 4315: f0 22
    lda table_x_position                                              ; 4317: ad 01 0a
    beq set_table_x_position_to_right_side                            ; 431a: f0 13
    lda table_x_speed                                                 ; 431c: ad 02 0a
    beq table_x_position_update_finished                              ; 431f: f0 18
    bpl set_table_x_position_to_right_side                            ; 4321: 10 0c
; Set table_x_position to left side of screen
    lda #table_min_x                                                  ; 4323: a9 0a
    sta table_x_position                                              ; 4325: 8d 01 0a
    lda #0                                                            ; 4328: a9 00
    sta table_x_speed                                                 ; 432a: 8d 02 0a
    beq table_x_position_update_finished                              ; 432d: f0 0a                   ; ALWAYS branch
set_table_x_position_to_right_side
    lda #table_max_x                                                  ; 432f: a9 16
    sta table_x_position                                              ; 4331: 8d 01 0a
    lda #0                                                            ; 4334: a9 00
    sta table_x_speed                                                 ; 4336: 8d 02 0a
table_x_position_update_finished
    lda desired_room_index                                            ; 4339: a5 30
    cmp #3                                                            ; 433b: c9 03
    bne add_table_to_collision_map_if_room_3_local                    ; 433d: d0 13
    ldx #<envelope4                                                   ; 433f: a2 4a
    ldy #>envelope4                                                   ; 4341: a0 44
    jsr define_envelope                                               ; 4343: 20 5e 39
    ldx #objectid_table                                               ; 4346: a2 02
    lda #spriteid_table                                               ; 4348: a9 de
    sta object_spriteid,x                                             ; 434a: 9d a8 09
    lda #spriteid_zero_size1                                          ; 434d: a9 cc
    sta object_sprite_mask_type,x                                     ; 434f: 9d ac 38
add_table_to_collision_map_if_room_3_local
    jmp add_table_to_collision_map_if_room_3                          ; 4352: 4c f6 43

return4_local
    jmp return4                                                       ; 4355: 4c 15 44

room3_not_first_update
    lda table_x_speed                                                 ; 4358: ad 02 0a
    bne move_table                                                    ; 435b: d0 43
    lda desired_room_index                                            ; 435d: a5 30
    cmp #3                                                            ; 435f: c9 03
    bne return4_local                                                 ; 4361: d0 f2
    lda table_x_position                                              ; 4363: ad 01 0a
    cmp #table_max_x                                                  ; 4366: c9 16
    beq table_at_max_x_position                                       ; 4368: f0 1c
    lda object_room_collision_flags                                   ; 436a: ad d8 38
    and #object_collided_right_wall                                   ; 436d: 29 04
    beq return4_local                                                 ; 436f: f0 e4
    lda #1                                                            ; 4371: a9 01
    sta temp_right_offset                                             ; 4373: 8d d1 24
    ldx #objectid_player                                              ; 4376: a2 00
    ldy #objectid_table                                               ; 4378: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 437a: 20 e2 28
    beq return4_local                                                 ; 437d: f0 d6
    lda #1                                                            ; 437f: a9 01
    sta table_x_speed                                                 ; 4381: 8d 02 0a
    bne move_table                                                    ; 4384: d0 1a                   ; ALWAYS branch
table_at_max_x_position
    lda object_room_collision_flags                                   ; 4386: ad d8 38
    and #object_collided_left_wall                                    ; 4389: 29 01
    beq return4_local                                                 ; 438b: f0 c8
    lda #$ff                                                          ; 438d: a9 ff
    sta temp_left_offset                                              ; 438f: 8d d0 24
    ldx #objectid_player                                              ; 4392: a2 00
    ldy #objectid_table                                               ; 4394: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 4396: 20 e2 28
    beq return4_local                                                 ; 4399: f0 ba
    lda #$ff                                                          ; 439b: a9 ff
    sta table_x_speed                                                 ; 439d: 8d 02 0a
move_table
    lda table_x_position                                              ; 43a0: ad 01 0a
    sta old_table_x_position                                          ; 43a3: 85 70
    clc                                                               ; 43a5: 18
    adc table_x_speed                                                 ; 43a6: 6d 02 0a
    sta table_x_position                                              ; 43a9: 8d 01 0a
    cmp #table_min_x                                                  ; 43ac: c9 0a
    beq moving_table_hit_wall                                         ; 43ae: f0 04
    cmp #table_max_x                                                  ; 43b0: c9 16
    bne moving_table_not_hit_wall                                     ; 43b2: d0 20
moving_table_hit_wall
    lda #0                                                            ; 43b4: a9 00
    sta table_x_speed                                                 ; 43b6: 8d 02 0a
    lda desired_room_index                                            ; 43b9: a5 30
    cmp #3                                                            ; 43bb: c9 03
    bne return4                                                       ; 43bd: d0 56
    lda sound_priority_per_channel_table                              ; 43bf: ad 6f 39
    cmp #$81                                                          ; 43c2: c9 81
    bcs ready_to_play_table_hit_wall_sound                            ; 43c4: b0 08
    lda #0                                                            ; 43c6: a9 00
    sta sound_priority_per_channel_table                              ; 43c8: 8d 6f 39
    sta sound_priority_per_channel_table + 1                          ; 43cb: 8d 70 39
ready_to_play_table_hit_wall_sound
    jsr play_landing_sound                                            ; 43ce: 20 a9 23
    jmp remove_table_from_collision_map_at_old_table_x_position       ; 43d1: 4c e3 43

moving_table_not_hit_wall
    lda desired_room_index                                            ; 43d4: a5 30
    cmp #3                                                            ; 43d6: c9 03
    bne return4                                                       ; 43d8: d0 3b
    lda #$80                                                          ; 43da: a9 80
    ldx #<some_sound4                                                 ; 43dc: a2 58
    ldy #>some_sound4                                                 ; 43de: a0 44
    jsr play_sound_yx                                                 ; 43e0: 20 f6 38
remove_table_from_collision_map_at_old_table_x_position
    ldx old_table_x_position                                          ; 43e3: a6 70
    ldy #$14                                                          ; 43e5: a0 14
    lda #3                                                            ; 43e7: a9 03
    sta width_in_cells                                                ; 43e9: 85 3c
    lda #2                                                            ; 43eb: a9 02
    sta height_in_cells                                               ; 43ed: 85 3d
    lda #0                                                            ; 43ef: a9 00
    sta value_to_write_to_collision_map                               ; 43f1: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 43f3: 20 44 1e
add_table_to_collision_map_if_room_3
    lda desired_room_index                                            ; 43f6: a5 30
    cmp #3                                                            ; 43f8: c9 03
    bne return4                                                       ; 43fa: d0 19
; Add the table to the collision map and set its object position.
    ldx table_x_position                                              ; 43fc: ae 01 0a
    ldy #$14                                                          ; 43ff: a0 14
    lda #3                                                            ; 4401: a9 03
    sta width_in_cells                                                ; 4403: 85 3c
    lda #2                                                            ; 4405: a9 02
    sta height_in_cells                                               ; 4407: 85 3d
    lda #3                                                            ; 4409: a9 03
    sta value_to_write_to_collision_map                               ; 440b: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 440d: 20 44 1e
    lda #objectid_table                                               ; 4410: a9 02
    jsr set_object_position_from_cell_xy                              ; 4412: 20 5d 1f
return4
    rts                                                               ; 4415: 60

envelope3
    !byte 5                                                           ; 4416: 05                      ; envelope number
    !byte 1                                                           ; 4417: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 4418: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 4419: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 441a: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 441b: 00                      ; number of steps in section 1
    !byte 0                                                           ; 441c: 00                      ; number of steps in section 2
    !byte 0                                                           ; 441d: 00                      ; number of steps in section 3
    !byte 20                                                          ; 441e: 14                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 441f: 00                      ; change of amplitude per step during decay phase
    !byte 255                                                         ; 4420: ff                      ; change of amplitude per step during sustain phase
    !byte 246                                                         ; 4421: f6                      ; change of amplitude per step during release phase
    !byte 100                                                         ; 4422: 64                      ; target of level at end of attack phase
    !byte 0                                                           ; 4423: 00                      ; target of level at end of decay phase
some_sound3
    !word $13                                                         ; 4424: 13 00                   ; channel
    !word 5                                                           ; 4426: 05 00                   ; amplitude
    !word 0                                                           ; 4428: 00 00                   ; pitch
    !word 4                                                           ; 442a: 04 00                   ; duration
envelope2
    !byte 6                                                           ; 442c: 06                      ; envelope number
    !byte 1                                                           ; 442d: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 442e: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 442f: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 4430: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 4431: 00                      ; number of steps in section 1
    !byte 0                                                           ; 4432: 00                      ; number of steps in section 2
    !byte 0                                                           ; 4433: 00                      ; number of steps in section 3
    !byte 80                                                          ; 4434: 50                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4435: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4436: 00                      ; change of amplitude per step during sustain phase
    !byte 250                                                         ; 4437: fa                      ; change of amplitude per step during release phase
    !byte 115                                                         ; 4438: 73                      ; target of level at end of attack phase
    !byte 0                                                           ; 4439: 00                      ; target of level at end of decay phase
some_sound2
    !word $10                                                         ; 443a: 10 00                   ; channel
    !word 6                                                           ; 443c: 06 00                   ; amplitude
    !word 7                                                           ; 443e: 07 00                   ; pitch
    !word 1                                                           ; 4440: 01 00                   ; duration
some_sound1
    !word $11                                                         ; 4442: 11 00                   ; channel
    !word 0                                                           ; 4444: 00 00                   ; amplitude
    !word 210                                                         ; 4446: d2 00                   ; pitch
    !word 1                                                           ; 4448: 01 00                   ; duration
envelope4
    !byte 6                                                           ; 444a: 06                      ; envelope number
    !byte 1                                                           ; 444b: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 444c: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 444d: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 444e: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 444f: 00                      ; number of steps in section 1
    !byte 0                                                           ; 4450: 00                      ; number of steps in section 2
    !byte 0                                                           ; 4451: 00                      ; number of steps in section 3
    !byte 10                                                          ; 4452: 0a                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4453: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4454: 00                      ; change of amplitude per step during sustain phase
    !byte 216                                                         ; 4455: d8                      ; change of amplitude per step during release phase
    !byte 40                                                          ; 4456: 28                      ; target of level at end of attack phase
    !byte 0                                                           ; 4457: 00                      ; target of level at end of decay phase
some_sound4
    !word $10                                                         ; 4458: 10 00                   ; channel
    !word 6                                                           ; 445a: 06 00                   ; amplitude
    !word 4                                                           ; 445c: 04 00                   ; pitch
    !word 4                                                           ; 445e: 04 00                   ; duration
envelope1
    !byte 6                                                           ; 4460: 06                      ; envelope number
    !byte 1                                                           ; 4461: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 4462: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 4463: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 4464: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 4465: 00                      ; number of steps in section 1
    !byte 0                                                           ; 4466: 00                      ; number of steps in section 2
    !byte 0                                                           ; 4467: 00                      ; number of steps in section 3
    !byte 30                                                          ; 4468: 1e                      ; change of amplitude per step during attack phase
    !byte 206                                                         ; 4469: ce                      ; change of amplitude per step during decay phase
    !byte 206                                                         ; 446a: ce                      ; change of amplitude per step during sustain phase
    !byte 156                                                         ; 446b: 9c                      ; change of amplitude per step during release phase
    !byte 100                                                         ; 446c: 64                      ; target of level at end of attack phase
    !byte 0                                                           ; 446d: 00                      ; target of level at end of decay phase
mouse_ball_sound3
    !word $10                                                         ; 446e: 10 00                   ; channel
    !word 6                                                           ; 4470: 06 00                   ; amplitude
    !word 7                                                           ; 4472: 07 00                   ; pitch
    !word 1                                                           ; 4474: 01 00                   ; duration
mouse_ball_sound2
    !word $11                                                         ; 4476: 11 00                   ; channel
    !word 0                                                           ; 4478: 00 00                   ; amplitude
    !word 190                                                         ; 447a: be 00                   ; pitch
    !word 1                                                           ; 447c: 01 00                   ; duration
mouse_ball_sound1
    !word $10                                                         ; 447e: 10 00                   ; channel
    !word 0                                                           ; 4480: 00 00                   ; amplitude
    !word 0                                                           ; 4482: 00 00                   ; pitch
    !word 0                                                           ; 4484: 00 00                   ; duration
ground_fill_2x2_top_left
    !byte %...#....                                                   ; 4486: 10
    !byte %..#.....                                                   ; 4487: 20
    !byte %.#......                                                   ; 4488: 40
    !byte %#.....##                                                   ; 4489: 83
    !byte %.....#..                                                   ; 448a: 04
    !byte %....#...                                                   ; 448b: 08
    !byte %...#....                                                   ; 448c: 10
    !byte %...#....                                                   ; 448d: 10
; Note that the next three tiles are all identical. This is done because the 'tiling'
; code in copy_rectangle_of_memory_to_screen for copy_mode=1 uses a 2x2 tiling
; arrangement.
ground_fill_2x2_top_right
    !byte %....#...                                                   ; 448e: 08
    !byte %.....#..                                                   ; 448f: 04
    !byte %......#.                                                   ; 4490: 02
    !byte %.......#                                                   ; 4491: 01
    !byte %#.......                                                   ; 4492: 80
    !byte %.#......                                                   ; 4493: 40
    !byte %..#.....                                                   ; 4494: 20
    !byte %...#....                                                   ; 4495: 10
ground_fill_2x2_bottom_left
    !byte %....#...                                                   ; 4496: 08
    !byte %.....#..                                                   ; 4497: 04
    !byte %......#.                                                   ; 4498: 02
    !byte %.......#                                                   ; 4499: 01
    !byte %#.......                                                   ; 449a: 80
    !byte %.#......                                                   ; 449b: 40
    !byte %..#.....                                                   ; 449c: 20
    !byte %...#....                                                   ; 449d: 10
ground_fill_2x2_bottom_right
    !byte %....#...                                                   ; 449e: 08
    !byte %.....#..                                                   ; 449f: 04
    !byte %......#.                                                   ; 44a0: 02
    !byte %.......#                                                   ; 44a1: 01
    !byte %#.......                                                   ; 44a2: 80
    !byte %.#......                                                   ; 44a3: 40
    !byte %..#.....                                                   ; 44a4: 20
    !byte %...#....                                                   ; 44a5: 10
sprite_data
pydis_end

; Automatically generated labels:
;     c3ce7
;     c4137
;     c415e
;     c4167
;     c4184
;     c418c
;     c4194
;     c419f
;     c41c9
!if (<envelope1) != $60 {
    !error "Assertion failed: <envelope1 == $60"
}
!if (<envelope2) != $2c {
    !error "Assertion failed: <envelope2 == $2c"
}
!if (<envelope3) != $16 {
    !error "Assertion failed: <envelope3 == $16"
}
!if (<envelope4) != $4a {
    !error "Assertion failed: <envelope4 == $4a"
}
!if (<ground_fill_2x2_top_left) != $86 {
    !error "Assertion failed: <ground_fill_2x2_top_left == $86"
}
!if (<mouse_ball_sound1) != $7e {
    !error "Assertion failed: <mouse_ball_sound1 == $7e"
}
!if (<mouse_ball_sound2) != $76 {
    !error "Assertion failed: <mouse_ball_sound2 == $76"
}
!if (<mouse_ball_sound3) != $6e {
    !error "Assertion failed: <mouse_ball_sound3 == $6e"
}
!if (<some_sound1) != $42 {
    !error "Assertion failed: <some_sound1 == $42"
}
!if (<some_sound2) != $3a {
    !error "Assertion failed: <some_sound2 == $3a"
}
!if (<some_sound3) != $24 {
    !error "Assertion failed: <some_sound3 == $24"
}
!if (<some_sound4) != $58 {
    !error "Assertion failed: <some_sound4 == $58"
}
!if (<tile_all_set_pixels) != $a9 {
    !error "Assertion failed: <tile_all_set_pixels == $a9"
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
!if (>envelope4) != $44 {
    !error "Assertion failed: >envelope4 == $44"
}
!if (>ground_fill_2x2_top_left) != $44 {
    !error "Assertion failed: >ground_fill_2x2_top_left == $44"
}
!if (>mouse_ball_sound1) != $44 {
    !error "Assertion failed: >mouse_ball_sound1 == $44"
}
!if (>mouse_ball_sound2) != $44 {
    !error "Assertion failed: >mouse_ball_sound2 == $44"
}
!if (>mouse_ball_sound3) != $44 {
    !error "Assertion failed: >mouse_ball_sound3 == $44"
}
!if (>some_sound1) != $44 {
    !error "Assertion failed: >some_sound1 == $44"
}
!if (>some_sound2) != $44 {
    !error "Assertion failed: >some_sound2 == $44"
}
!if (>some_sound3) != $44 {
    !error "Assertion failed: >some_sound3 == $44"
}
!if (>some_sound4) != $44 {
    !error "Assertion failed: >some_sound4 == $44"
}
!if (>tile_all_set_pixels) != $0a {
    !error "Assertion failed: >tile_all_set_pixels == $0a"
}
!if (baby_max_pixel_x) != $d4 {
    !error "Assertion failed: baby_max_pixel_x == $d4"
}
!if (baby_spriteid_data_entries_minus_1) != $2b {
    !error "Assertion failed: baby_spriteid_data_entries_minus_1 == $2b"
}
!if (collectable_spriteids + 1) != $2eee {
    !error "Assertion failed: collectable_spriteids + 1 == $2eee"
}
!if (copy_mode_simple) != $01 {
    !error "Assertion failed: copy_mode_simple == $01"
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
!if (level_specific_initialisation) != $3af2 {
    !error "Assertion failed: level_specific_initialisation == $3af2"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b17 {
    !error "Assertion failed: level_specific_update == $3b17"
}
!if (object_collided_left_wall) != $01 {
    !error "Assertion failed: object_collided_left_wall == $01"
}
!if (object_collided_right_wall) != $04 {
    !error "Assertion failed: object_collided_right_wall == $04"
}
!if (object_sprite_mask_type + objectid_baby) != $38ae {
    !error "Assertion failed: object_sprite_mask_type + objectid_baby == $38ae"
}
!if (object_spriteid + objectid_left_mouse) != $09aa {
    !error "Assertion failed: object_spriteid + objectid_left_mouse == $09aa"
}
!if (object_spriteid + objectid_left_trapdoor) != $09aa {
    !error "Assertion failed: object_spriteid + objectid_left_trapdoor == $09aa"
}
!if (object_spriteid + objectid_mouse_ball) != $09ac {
    !error "Assertion failed: object_spriteid + objectid_mouse_ball == $09ac"
}
!if (object_spriteid + objectid_right_mouse) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_right_mouse == $09ab"
}
!if (object_spriteid + objectid_right_trapdoor) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_right_trapdoor == $09ab"
}
!if (object_spriteid + objectid_saxophone) != $09ac {
    !error "Assertion failed: object_spriteid + objectid_saxophone == $09ac"
}
!if (object_x_low + objectid_mouse_ball) != $0954 {
    !error "Assertion failed: object_x_low + objectid_mouse_ball == $0954"
}
!if (object_y_low + objectid_mouse_ball) != $0980 {
    !error "Assertion failed: object_y_low + objectid_mouse_ball == $0980"
}
!if (objectid_baby) != $02 {
    !error "Assertion failed: objectid_baby == $02"
}
!if (objectid_brazier) != $05 {
    !error "Assertion failed: objectid_brazier == $05"
}
!if (objectid_brazier2) != $03 {
    !error "Assertion failed: objectid_brazier2 == $03"
}
!if (objectid_left_mouse) != $02 {
    !error "Assertion failed: objectid_left_mouse == $02"
}
!if (objectid_left_trapdoor) != $02 {
    !error "Assertion failed: objectid_left_trapdoor == $02"
}
!if (objectid_mouse_ball) != $04 {
    !error "Assertion failed: objectid_mouse_ball == $04"
}
!if (objectid_player) != $00 {
    !error "Assertion failed: objectid_player == $00"
}
!if (objectid_right_mouse) != $03 {
    !error "Assertion failed: objectid_right_mouse == $03"
}
!if (objectid_right_trapdoor) != $03 {
    !error "Assertion failed: objectid_right_trapdoor == $03"
}
!if (objectid_saxophone) != $04 {
    !error "Assertion failed: objectid_saxophone == $04"
}
!if (objectid_something) != $0b {
    !error "Assertion failed: objectid_something == $0b"
}
!if (objectid_spell) != $05 {
    !error "Assertion failed: objectid_spell == $05"
}
!if (objectid_table) != $02 {
    !error "Assertion failed: objectid_table == $02"
}
!if (player_collision_flag_baby) != $06 {
    !error "Assertion failed: player_collision_flag_baby == $06"
}
!if (player_collision_flag_mouse_ball) != $80 {
    !error "Assertion failed: player_collision_flag_mouse_ball == $80"
}
!if (room_0_data) != $3b27 {
    !error "Assertion failed: room_0_data == $3b27"
}
!if (room_1_data) != $3d3d {
    !error "Assertion failed: room_1_data == $3d3d"
}
!if (room_2_data) != $3fd7 {
    !error "Assertion failed: room_2_data == $3fd7"
}
!if (room_3_data) != $424d {
    !error "Assertion failed: room_3_data == $424d"
}
!if (some_specific_baby_spriteid_index_entry) != $21 {
    !error "Assertion failed: some_specific_baby_spriteid_index_entry == $21"
}
!if (sound_priority_per_channel_table + 1) != $3970 {
    !error "Assertion failed: sound_priority_per_channel_table + 1 == $3970"
}
!if (sprite_data - level_data) != $09d1 {
    !error "Assertion failed: sprite_data - level_data == $09d1"
}
!if (spriteid_baby0) != $d6 {
    !error "Assertion failed: spriteid_baby0 == $d6"
}
!if (spriteid_baby1) != $d7 {
    !error "Assertion failed: spriteid_baby1 == $d7"
}
!if (spriteid_baby2) != $d8 {
    !error "Assertion failed: spriteid_baby2 == $d8"
}
!if (spriteid_baby3) != $d9 {
    !error "Assertion failed: spriteid_baby3 == $d9"
}
!if (spriteid_baby4) != $da {
    !error "Assertion failed: spriteid_baby4 == $da"
}
!if (spriteid_baby5) != $db {
    !error "Assertion failed: spriteid_baby5 == $db"
}
!if (spriteid_baby6) != $dc {
    !error "Assertion failed: spriteid_baby6 == $dc"
}
!if (spriteid_baby7) != $dd {
    !error "Assertion failed: spriteid_baby7 == $dd"
}
!if (spriteid_ball) != $3b {
    !error "Assertion failed: spriteid_ball == $3b"
}
!if (spriteid_mouse) != $c8 {
    !error "Assertion failed: spriteid_mouse == $c8"
}
!if (spriteid_mouse_hands1) != $c9 {
    !error "Assertion failed: spriteid_mouse_hands1 == $c9"
}
!if (spriteid_mouse_hands2) != $ca {
    !error "Assertion failed: spriteid_mouse_hands2 == $ca"
}
!if (spriteid_mouse_hands3) != $d4 {
    !error "Assertion failed: spriteid_mouse_hands3 == $d4"
}
!if (spriteid_mouse_hands4) != $d5 {
    !error "Assertion failed: spriteid_mouse_hands4 == $d5"
}
!if (spriteid_saxophone1) != $d2 {
    !error "Assertion failed: spriteid_saxophone1 == $d2"
}
!if (spriteid_saxophone2) != $d3 {
    !error "Assertion failed: spriteid_saxophone2 == $d3"
}
!if (spriteid_small_ball) != $cb {
    !error "Assertion failed: spriteid_small_ball == $cb"
}
!if (spriteid_table) != $de {
    !error "Assertion failed: spriteid_table == $de"
}
!if (spriteid_trapdoor_diagonal) != $d0 {
    !error "Assertion failed: spriteid_trapdoor_diagonal == $d0"
}
!if (spriteid_trapdoor_horizontal) != $cf {
    !error "Assertion failed: spriteid_trapdoor_horizontal == $cf"
}
!if (spriteid_trapdoor_vertical) != $d1 {
    !error "Assertion failed: spriteid_trapdoor_vertical == $d1"
}
!if (spriteid_zero_size1) != $cc {
    !error "Assertion failed: spriteid_zero_size1 == $cc"
}
!if (table_max_x) != $16 {
    !error "Assertion failed: table_max_x == $16"
}
!if (table_min_x) != $0a {
    !error "Assertion failed: table_min_x == $0a"
}
!if (toolbar_collectable_spriteids + 1) != $2ee9 {
    !error "Assertion failed: toolbar_collectable_spriteids + 1 == $2ee9"
}
