; Constants
copy_mode_2x2                = 0
copy_mode_random16           = 16
copy_mode_random2            = 2
copy_mode_random32           = 32
copy_mode_random4            = 4
copy_mode_random64           = 64
copy_mode_random8            = 8
copy_mode_simple             = 1
exit_room_bottom             = 2
exit_room_left               = 1
exit_room_right              = 4
exit_room_top                = 8
first_level_letter           = 65
game_area_height_cells       = 24
game_area_width_cells        = 40
last_level_letter            = 81
object_collided_ceiling      = 8
object_collided_floor        = 2
object_collided_left_wall    = 1
object_collided_right_wall   = 4
objectid_player              = 0
objectid_player_accessory    = 1
opcode_jmp                   = 76

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
show_dialog_box                                     = $040a
remove_dialog                                       = $0453
object_x_low                                        = $0950
l0955                                               = $0955
object_x_low_old                                    = $095b
object_x_high                                       = $0966
object_x_high_old                                   = $0971
object_y_low                                        = $097c
l0981                                               = $0981
object_y_low_old                                    = $0987
object_y_high                                       = $0992
object_y_high_old                                   = $099d
object_spriteid                                     = $09a8
l09ab                                               = $09ab
l09ac                                               = $09ac
l09ad                                               = $09ad
object_spriteid_old                                 = $09b3
object_direction                                    = $09be
object_direction_old                                = $09c9
level_progress_table                                = $09ef
l0a0e                                               = $0a0e
l0a0f                                               = $0a0f
l0a10                                               = $0a10
l0a11                                               = $0a11
l0a12                                               = $0a12
l0a6f                                               = $0a6f
l0a70                                               = $0a70
l0a71                                               = $0a71
string_input_buffer                                 = $0a90
tile_all_set_pixels                                 = $0aa9
developer_flags                                     = $1103
initialise_level_and_room                           = $1140
start_room                                          = $12bb
game_update                                         = $12da
update_room_first_update_flag                       = $132b
sprite_op                                           = $138d
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
read_collision_map_value_for_xy                     = $1efa
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
temp_default_collision_map_option                   = $28e1
test_for_collision_between_objects_x_and_y          = $28e2
insert_character_menu_item_into_toolbar             = $2b87
find_or_create_menu_slot_for_A                      = $2bbd
remove_item_from_toolbar_menu                       = $2be0
player_using_object_spriteid                        = $2eb6
previous_player_using_object_spriteid               = $2eb7
toolbar_collectable_spriteids                       = $2ee8
collectable_spriteids                               = $2eed
five_byte_table_paired_with_collectable_sprite_ids  = $2ef2
l2ef4                                               = $2ef4
inhibit_monkey_climb_flag                           = $31d7
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
    !word sprite_data - level_data                                    ; 3ad5: ef 08                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f3 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 1d 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
    !byte 1, 1                                                        ; 3add: 01 01
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
level_specific_initialisation
    lda current_level                                                 ; 3af3: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3af5: c5 51
    beq c3b1c                                                         ; 3af7: f0 23
    lda developer_flags                                               ; 3af9: ad 03 11
    bpl c3b08                                                         ; 3afc: 10 0a
    lda #$ff                                                          ; 3afe: a9 ff
    sta l0a0f                                                         ; 3b00: 8d 0f 0a
    lda #$ff                                                          ; 3b03: a9 ff
    sta l0a0e                                                         ; 3b05: 8d 0e 0a
c3b08
    lda l0a0f                                                         ; 3b08: ad 0f 0a
    beq c3b12                                                         ; 3b0b: f0 05
    lda #$cf                                                          ; 3b0d: a9 cf
    jsr find_or_create_menu_slot_for_A                                ; 3b0f: 20 bd 2b
c3b12
    lda l0a0e                                                         ; 3b12: ad 0e 0a
    beq c3b1c                                                         ; 3b15: f0 05
    lda #$ca                                                          ; 3b17: a9 ca
    jsr find_or_create_menu_slot_for_A                                ; 3b19: 20 bd 2b
c3b1c
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
    jsr sub_c3bfc                                                     ; 3b1d: 20 fc 3b
    jsr sub_c3ee9                                                     ; 3b20: 20 e9 3e
    jsr sub_c40c2                                                     ; 3b23: 20 c2 40
    jsr sub_c3c73                                                     ; 3b26: 20 73 3c
    jsr sub_c41ac                                                     ; 3b29: 20 ac 41
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
; draw sprite $c8 at (13,20) of size (3x2)
    lda #3                                                            ; 3baf: a9 03
    sta width_in_cells                                                ; 3bb1: 85 3c
    lda #2                                                            ; 3bb3: a9 02
    sta height_in_cells                                               ; 3bb5: 85 3d
    lda #$c8                                                          ; 3bb7: a9 c8
    ldx #$0d                                                          ; 3bb9: a2 0d
    ldy #$14                                                          ; 3bbb: a0 14
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bbd: 20 57 1f
; draw sprite $c8 at (10,20) of size (3x2)
    ldx #$0a                                                          ; 3bc0: a2 0a
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bc2: 20 57 1f
; draw sprite $c8 at (7,20) of size (3x2)
    ldx #7                                                            ; 3bc5: a2 07
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bc7: 20 57 1f
; draw sprite $c8 at (7,18) of size (3x2)
    ldy #$12                                                          ; 3bca: a0 12
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bcc: 20 57 1f
; draw sprite $c8 at (10,18) of size (3x2)
    ldx #$0a                                                          ; 3bcf: a2 0a
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bd1: 20 57 1f
; draw sprite $c8 at (7,16) of size (3x2)
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

sub_c3bfc
    lda #0                                                            ; 3bfc: a9 00
    sta currently_updating_logic_for_room_index                       ; 3bfe: 8d ba 1a
    lda #2                                                            ; 3c01: a9 02
    ldx #3                                                            ; 3c03: a2 03
    ldy #8                                                            ; 3c05: a0 08
    jsr update_brazier_and_fire                                       ; 3c07: 20 88 19
    lda update_room_first_update_flag                                 ; 3c0a: ad 2b 13
    beq c3c4f                                                         ; 3c0d: f0 40
    lda current_level                                                 ; 3c0f: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3c11: c5 51
    beq c3c22                                                         ; 3c13: f0 0d
    lda #$ca                                                          ; 3c15: a9 ca
    sta toolbar_collectable_spriteids+2                               ; 3c17: 8d ea 2e
    lda #$c9                                                          ; 3c1a: a9 c9
    sta collectable_spriteids+2                                       ; 3c1c: 8d ef 2e
    sta l2ef4                                                         ; 3c1f: 8d f4 2e
c3c22
    lda desired_room_index                                            ; 3c22: a5 30
    cmp #0                                                            ; 3c24: c9 00
    bne c3c4e                                                         ; 3c26: d0 26
    lda l0a0e                                                         ; 3c28: ad 0e 0a
    bne c3c4e                                                         ; 3c2b: d0 21
    ldx #$23 ; '#'                                                    ; 3c2d: a2 23
    lda #5                                                            ; 3c2f: a9 05
    sta temp_sprite_x_offset                                          ; 3c31: 85 3a
    ldy #5                                                            ; 3c33: a0 05
    lda #1                                                            ; 3c35: a9 01
    sta temp_sprite_y_offset                                          ; 3c37: 85 3b
    lda #3                                                            ; 3c39: a9 03
    jsr set_object_position_from_cell_xy                              ; 3c3b: 20 5d 1f
    tax                                                               ; 3c3e: aa
    lda #$c9                                                          ; 3c3f: a9 c9
    sta object_spriteid,x                                             ; 3c41: 9d a8 09
    lda #$d0                                                          ; 3c44: a9 d0
    sta object_sprite_mask_type,x                                     ; 3c46: 9d ac 38
    lda #$c0                                                          ; 3c49: a9 c0
    sta object_z_order,x                                              ; 3c4b: 9d c2 38
c3c4e
    rts                                                               ; 3c4e: 60

c3c4f
    lda desired_room_index                                            ; 3c4f: a5 30
    cmp #0                                                            ; 3c51: c9 00
    bne c3c72                                                         ; 3c53: d0 1d
    lda l0a0e                                                         ; 3c55: ad 0e 0a
    bne c3c72                                                         ; 3c58: d0 18
    ldx #$0b                                                          ; 3c5a: a2 0b
    ldy #3                                                            ; 3c5c: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 3c5e: 20 e2 28
    beq c3c72                                                         ; 3c61: f0 0f
    lda #$ff                                                          ; 3c63: a9 ff
    sta l0a0e                                                         ; 3c65: 8d 0e 0a
    lda #$ca                                                          ; 3c68: a9 ca
    jsr find_or_create_menu_slot_for_A                                ; 3c6a: 20 bd 2b
    lda #0                                                            ; 3c6d: a9 00
    sta l09ab                                                         ; 3c6f: 8d ab 09
c3c72
    rts                                                               ; 3c72: 60

sub_c3c73
    lda update_room_first_update_flag                                 ; 3c73: ad 2b 13
    beq c3ccd                                                         ; 3c76: f0 55
    lda l0a10                                                         ; 3c78: ad 10 0a
    bne c3c82                                                         ; 3c7b: d0 05
    lda #$21 ; '!'                                                    ; 3c7d: a9 21
    sta l0a10                                                         ; 3c7f: 8d 10 0a
c3c82
    ldy #$0e                                                          ; 3c82: a0 0e
    lda #1                                                            ; 3c84: a9 01
    sta width_in_cells                                                ; 3c86: 85 3c
    lda #5                                                            ; 3c88: a9 05
    sta height_in_cells                                               ; 3c8a: 85 3d
    lda #3                                                            ; 3c8c: a9 03
    sta value_to_write_to_collision_map                               ; 3c8e: 85 3e
    lda desired_room_index                                            ; 3c90: a5 30
    cmp #1                                                            ; 3c92: c9 01
    beq c3ca3                                                         ; 3c94: f0 0d
    bcs c3cca                                                         ; 3c96: b0 32
    ldx #$1e                                                          ; 3c98: a2 1e
    lda #$cc                                                          ; 3c9a: a9 cc
    jsr draw_sprite_a_at_cell_xy                                      ; 3c9c: 20 4c 1f
    dex                                                               ; 3c9f: ca
    jmp c3caf                                                         ; 3ca0: 4c af 3c

c3ca3
    ldx #9                                                            ; 3ca3: a2 09
    lda #4                                                            ; 3ca5: a9 04
    sta temp_sprite_x_offset                                          ; 3ca7: 85 3a
    lda #$cc                                                          ; 3ca9: a9 cc
    jsr draw_sprite_a_at_cell_xy                                      ; 3cab: 20 4c 1f
    inx                                                               ; 3cae: e8
c3caf
    ldy #9                                                            ; 3caf: a0 09
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3cb1: 20 bb 1e
    ldx #4                                                            ; 3cb4: a2 04
    lda #$d2                                                          ; 3cb6: a9 d2
    sta object_spriteid,x                                             ; 3cb8: 9d a8 09
    lda #$d1                                                          ; 3cbb: a9 d1
    sta object_sprite_mask_type,x                                     ; 3cbd: 9d ac 38
    lda #$c0                                                          ; 3cc0: a9 c0
    sta object_z_order,x                                              ; 3cc2: 9d c2 38
    lda #$d3                                                          ; 3cc5: a9 d3
    sta l09ad                                                         ; 3cc7: 8d ad 09
c3cca
    jmp c3d0b                                                         ; 3cca: 4c 0b 3d

c3ccd
    lda desired_room_index                                            ; 3ccd: a5 30
    cmp #3                                                            ; 3ccf: c9 03
    beq c3d0b                                                         ; 3cd1: f0 38
    lda #$cf                                                          ; 3cd3: a9 cf
    cmp player_using_object_spriteid                                  ; 3cd5: cd b6 2e
    bne c3d0b                                                         ; 3cd8: d0 31
    cmp previous_player_using_object_spriteid                         ; 3cda: cd b7 2e
    beq c3d0b                                                         ; 3cdd: f0 2c
    lda object_y_low                                                  ; 3cdf: ad 7c 09
    cmp #$6e ; 'n'                                                    ; 3ce2: c9 6e
    bne c3d0b                                                         ; 3ce4: d0 25
    lda desired_room_index                                            ; 3ce6: a5 30
    bne c3cfc                                                         ; 3ce8: d0 12
    lda object_direction                                              ; 3cea: ad be 09
    bmi c3d0b                                                         ; 3ced: 30 1c
    lda l0a10                                                         ; 3cef: ad 10 0a
    cmp #$30 ; '0'                                                    ; 3cf2: c9 30
    beq c3d0b                                                         ; 3cf4: f0 15
    inc l0a10                                                         ; 3cf6: ee 10 0a
    jmp c3d0b                                                         ; 3cf9: 4c 0b 3d

c3cfc
    lda object_direction                                              ; 3cfc: ad be 09
    bpl c3d0b                                                         ; 3cff: 10 0a
    lda l0a10                                                         ; 3d01: ad 10 0a
    cmp #$20 ; ' '                                                    ; 3d04: c9 20
    beq c3d0b                                                         ; 3d06: f0 03
    dec l0a10                                                         ; 3d08: ce 10 0a
c3d0b
    lda #1                                                            ; 3d0b: a9 01
    sta width_in_cells                                                ; 3d0d: 85 3c
    lda l0a10                                                         ; 3d0f: ad 10 0a
    ldx desired_room_index                                            ; 3d12: a6 30
    cpx #1                                                            ; 3d14: e0 01
    beq c3d45                                                         ; 3d16: f0 2d
    bcs c3d7d                                                         ; 3d18: b0 63
    ldx #2                                                            ; 3d1a: a2 02
    cmp #$29 ; ')'                                                    ; 3d1c: c9 29
    bcs c3d22                                                         ; 3d1e: b0 02
    ldx #0                                                            ; 3d20: a2 00
c3d22
    stx value_to_write_to_collision_map                               ; 3d22: 86 3e
    ldx #$14                                                          ; 3d24: a2 14
    ldy #3                                                            ; 3d26: a0 03
    jsr read_collision_map_value_for_xy                               ; 3d28: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3d2b: c5 3e
    beq c3d3f                                                         ; 3d2d: f0 10
    lda #$11                                                          ; 3d2f: a9 11
    sta height_in_cells                                               ; 3d31: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3d33: 20 44 1e
    ldx #$19                                                          ; 3d36: a2 19
    lda #6                                                            ; 3d38: a9 06
    sta height_in_cells                                               ; 3d3a: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3d3c: 20 44 1e
c3d3f
    lda l0a10                                                         ; 3d3f: ad 10 0a
    jmp c3d70                                                         ; 3d42: 4c 70 3d

c3d45
    ldx #2                                                            ; 3d45: a2 02
    cmp #$28 ; '('                                                    ; 3d47: c9 28
    bcc c3d4d                                                         ; 3d49: 90 02
    ldx #0                                                            ; 3d4b: a2 00
c3d4d
    stx value_to_write_to_collision_map                               ; 3d4d: 86 3e
    ldx #$0e                                                          ; 3d4f: a2 0e
    ldy #3                                                            ; 3d51: a0 03
    jsr read_collision_map_value_for_xy                               ; 3d53: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3d56: c5 3e
    beq c3d6a                                                         ; 3d58: f0 10
    lda #6                                                            ; 3d5a: a9 06
    sta height_in_cells                                               ; 3d5c: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3d5e: 20 44 1e
    ldx #$19                                                          ; 3d61: a2 19
    lda #$0d                                                          ; 3d63: a9 0d
    sta height_in_cells                                               ; 3d65: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3d67: 20 44 1e
c3d6a
    lda l0a10                                                         ; 3d6a: ad 10 0a
    sec                                                               ; 3d6d: 38
    sbc #$28 ; '('                                                    ; 3d6e: e9 28
c3d70
    tax                                                               ; 3d70: aa
    ldy #$0e                                                          ; 3d71: a0 0e
    lda #4                                                            ; 3d73: a9 04
    jsr set_object_position_from_cell_xy                              ; 3d75: 20 5d 1f
    lda #5                                                            ; 3d78: a9 05
    jsr set_object_position_from_cell_xy                              ; 3d7a: 20 5d 1f
c3d7d
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
; draw sprite $cb at (18,7) of size (4x1)
    lda #4                                                            ; 3ded: a9 04
    sta width_in_cells                                                ; 3def: 85 3c
    lda #1                                                            ; 3df1: a9 01
    sta height_in_cells                                               ; 3df3: 85 3d
    ldx #$12                                                          ; 3df5: a2 12
    ldy #7                                                            ; 3df7: a0 07
    lda #$cb                                                          ; 3df9: a9 cb
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
    sta l0070                                                         ; 3e1f: 85 70
    and #exit_room_left                                               ; 3e21: 29 01
    beq c3e2c                                                         ; 3e23: f0 07
    ldx #0                                                            ; 3e25: a2 00
    ldy current_level                                                 ; 3e27: a4 31
    jmp initialise_level_and_room                                     ; 3e29: 4c 40 11

c3e2c
    lda l0070                                                         ; 3e2c: a5 70
    and #4                                                            ; 3e2e: 29 04
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
; draw sprite $c8 at (21,20) of size (3x2)
    lda #3                                                            ; 3eaa: a9 03
    sta width_in_cells                                                ; 3eac: 85 3c
    lda #2                                                            ; 3eae: a9 02
    sta height_in_cells                                               ; 3eb0: 85 3d
    ldx #$15                                                          ; 3eb2: a2 15
    ldy #$14                                                          ; 3eb4: a0 14
    lda #$c8                                                          ; 3eb6: a9 c8
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3eb8: 20 57 1f
; draw sprite $c8 at (18,20) of size (3x2)
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
    sta l0070                                                         ; 3ecf: 85 70
    and #exit_room_left                                               ; 3ed1: 29 01
    beq c3edc                                                         ; 3ed3: f0 07
    ldx #1                                                            ; 3ed5: a2 01
    ldy current_level                                                 ; 3ed7: a4 31
    jmp initialise_level_and_room                                     ; 3ed9: 4c 40 11

c3edc
    lda l0070                                                         ; 3edc: a5 70
    and #4                                                            ; 3ede: 29 04
    beq room_2_game_update_loop                                       ; 3ee0: f0 ea
    ldx #3                                                            ; 3ee2: a2 03
    ldy current_level                                                 ; 3ee4: a4 31
    jmp initialise_level_and_room                                     ; 3ee6: 4c 40 11

sub_c3ee9
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
    lda update_room_first_update_flag                                 ; 3f00: ad 2b 13
    beq c3f66                                                         ; 3f03: f0 61
    ldx #$86                                                          ; 3f05: a2 86
    ldy #$43 ; 'C'                                                    ; 3f07: a0 43
    jsr define_envelope                                               ; 3f09: 20 5e 39
    lda current_level                                                 ; 3f0c: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3f0e: c5 51
    beq c3f1c                                                         ; 3f10: f0 0a
    lda l0a11                                                         ; 3f12: ad 11 0a
    beq c3f1c                                                         ; 3f15: f0 05
    lda #$ff                                                          ; 3f17: a9 ff
    sta l0a11                                                         ; 3f19: 8d 11 0a
c3f1c
    lda desired_room_index                                            ; 3f1c: a5 30
    cmp #2                                                            ; 3f1e: c9 02
    bne c3f63                                                         ; 3f20: d0 41
    ldx #$14                                                          ; 3f22: a2 14
    ldy #7                                                            ; 3f24: a0 07
    lda #$d4                                                          ; 3f26: a9 d4
    jsr draw_sprite_a_at_cell_xy                                      ; 3f28: 20 4c 1f
    lda #4                                                            ; 3f2b: a9 04
    jsr set_object_position_from_cell_xy                              ; 3f2d: 20 5d 1f
    tax                                                               ; 3f30: aa
    lda #$d0                                                          ; 3f31: a9 d0
    sta object_sprite_mask_type,x                                     ; 3f33: 9d ac 38
    lda #$c0                                                          ; 3f36: a9 c0
    sta object_z_order,x                                              ; 3f38: 9d c2 38
    ldx #$14                                                          ; 3f3b: a2 14
    lda #3                                                            ; 3f3d: a9 03
    sta value_to_write_to_collision_map                               ; 3f3f: 85 3e
    lda l0a11                                                         ; 3f41: ad 11 0a
    bne c3f56                                                         ; 3f44: d0 10
    ldy #2                                                            ; 3f46: a0 02
    lda #1                                                            ; 3f48: a9 01
    sta width_in_cells                                                ; 3f4a: 85 3c
    lda #5                                                            ; 3f4c: a9 05
    sta height_in_cells                                               ; 3f4e: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3f50: 20 44 1e
    jmp c3f63                                                         ; 3f53: 4c 63 3f

c3f56
    ldy #6                                                            ; 3f56: a0 06
    lda #6                                                            ; 3f58: a9 06
    sta width_in_cells                                                ; 3f5a: 85 3c
    lda #1                                                            ; 3f5c: a9 01
    sta height_in_cells                                               ; 3f5e: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3f60: 20 44 1e
c3f63
    jmp c3fc2                                                         ; 3f63: 4c c2 3f

c3f66
    lda l0a11                                                         ; 3f66: ad 11 0a
    bmi c3fc2                                                         ; 3f69: 30 57
    bne c3faf                                                         ; 3f6b: d0 42
    lda desired_room_index                                            ; 3f6d: a5 30
    cmp #2                                                            ; 3f6f: c9 02
    bne c3fc2                                                         ; 3f71: d0 4f
    lda player_using_object_spriteid                                  ; 3f73: ad b6 2e
    cmp #$ca                                                          ; 3f76: c9 ca
    bne c3fc2                                                         ; 3f78: d0 48
    lda #1                                                            ; 3f7a: a9 01
    sta temp_right_offset                                             ; 3f7c: 8d d1 24
    ldx #1                                                            ; 3f7f: a2 01
    ldy #4                                                            ; 3f81: a0 04
    jsr test_for_collision_between_objects_x_and_y                    ; 3f83: 20 e2 28
    beq c3fc2                                                         ; 3f86: f0 3a
    ldx #$14                                                          ; 3f88: a2 14
    ldy #2                                                            ; 3f8a: a0 02
    lda #1                                                            ; 3f8c: a9 01
    sta width_in_cells                                                ; 3f8e: 85 3c
    lda #5                                                            ; 3f90: a9 05
    sta height_in_cells                                               ; 3f92: 85 3d
    lda #0                                                            ; 3f94: a9 00
    sta value_to_write_to_collision_map                               ; 3f96: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3f98: 20 44 1e
    ldy #6                                                            ; 3f9b: a0 06
    lda #6                                                            ; 3f9d: a9 06
    sta width_in_cells                                                ; 3f9f: 85 3c
    lda #1                                                            ; 3fa1: a9 01
    sta height_in_cells                                               ; 3fa3: 85 3d
    lda #3                                                            ; 3fa5: a9 03
    sta value_to_write_to_collision_map                               ; 3fa7: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3fa9: 20 44 1e
    jsr sub_c3fd9                                                     ; 3fac: 20 d9 3f
c3faf
    ldy l0a11                                                         ; 3faf: ac 11 0a
    iny                                                               ; 3fb2: c8
    cpy #2                                                            ; 3fb3: c0 02
    bcc c3fbf                                                         ; 3fb5: 90 08
    lda desired_room_index                                            ; 3fb7: a5 30
    cmp #2                                                            ; 3fb9: c9 02
    bne c3fbd                                                         ; 3fbb: d0 00
c3fbd
    ldy #$ff                                                          ; 3fbd: a0 ff
c3fbf
    sty l0a11                                                         ; 3fbf: 8c 11 0a
c3fc2
    lda desired_room_index                                            ; 3fc2: a5 30
    cmp #2                                                            ; 3fc4: c9 02
    bne c3fd5                                                         ; 3fc6: d0 0d
    ldy l0a11                                                         ; 3fc8: ac 11 0a
    bpl c3fcf                                                         ; 3fcb: 10 02
    ldy #2                                                            ; 3fcd: a0 02
c3fcf
    lda l3fd6,y                                                       ; 3fcf: b9 d6 3f
    sta l09ac                                                         ; 3fd2: 8d ac 09
c3fd5
    rts                                                               ; 3fd5: 60

l3fd6
    !byte $d5, $d6, $d7                                               ; 3fd6: d5 d6 d7

sub_c3fd9
    lda #0                                                            ; 3fd9: a9 00
    ldx #$9c                                                          ; 3fdb: a2 9c
    ldy #$43 ; 'C'                                                    ; 3fdd: a0 43
    jsr play_sound_yx                                                 ; 3fdf: 20 f6 38
    ldx #$94                                                          ; 3fe2: a2 94
    ldy #$43 ; 'C'                                                    ; 3fe4: a0 43
    jsr play_sound_yx                                                 ; 3fe6: 20 f6 38
    rts                                                               ; 3fe9: 60

sub_c3fea
    lda #0                                                            ; 3fea: a9 00
    ldx #$7e ; '~'                                                    ; 3fec: a2 7e
    ldy #$43 ; 'C'                                                    ; 3fee: a0 43
    jsr play_sound_yx                                                 ; 3ff0: 20 f6 38
    ldx #$76 ; 'v'                                                    ; 3ff3: a2 76
    ldy #$43 ; 'C'                                                    ; 3ff5: a0 43
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
; draw sprite $c8 at (28,20) of size (3x2)
    lda #3                                                            ; 4092: a9 03
    sta width_in_cells                                                ; 4094: 85 3c
    lda #2                                                            ; 4096: a9 02
    sta height_in_cells                                               ; 4098: 85 3d
    ldx #$1c                                                          ; 409a: a2 1c
    ldy #$14                                                          ; 409c: a0 14
    lda #$c8                                                          ; 409e: a9 c8
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

sub_c40c2
    lda #3                                                            ; 40c2: a9 03
    sta currently_updating_logic_for_room_index                       ; 40c4: 8d ba 1a
    ldx #$19                                                          ; 40c7: a2 19
    ldy #$0d                                                          ; 40c9: a0 0d
    lda #2                                                            ; 40cb: a9 02
    jsr update_brazier_and_fire                                       ; 40cd: 20 88 19
    lda update_room_first_update_flag                                 ; 40d0: ad 2b 13
    beq c4126                                                         ; 40d3: f0 51
    lda #$cf                                                          ; 40d5: a9 cf
    sta toolbar_collectable_spriteids+1                               ; 40d7: 8d e9 2e
    lda #$ce                                                          ; 40da: a9 ce
    sta collectable_spriteids+1                                       ; 40dc: 8d ee 2e
    sta five_byte_table_paired_with_collectable_sprite_ids + 1        ; 40df: 8d f3 2e
    ldx #$68 ; 'h'                                                    ; 40e2: a2 68
    ldy #$43 ; 'C'                                                    ; 40e4: a0 43
    jsr define_envelope                                               ; 40e6: 20 5e 39
    lda current_level                                                 ; 40e9: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 40eb: c5 51
    beq c40f9                                                         ; 40ed: f0 0a
    lda l0a0f                                                         ; 40ef: ad 0f 0a
    beq c40f9                                                         ; 40f2: f0 05
    lda #$ff                                                          ; 40f4: a9 ff
    sta l0a0f                                                         ; 40f6: 8d 0f 0a
c40f9
    lda l0a0f                                                         ; 40f9: ad 0f 0a
    bne c4125                                                         ; 40fc: d0 27
    lda desired_room_index                                            ; 40fe: a5 30
    cmp #3                                                            ; 4100: c9 03
    bne c4125                                                         ; 4102: d0 21
    ldx #$1d                                                          ; 4104: a2 1d
    lda #4                                                            ; 4106: a9 04
    sta temp_sprite_x_offset                                          ; 4108: 85 3a
    ldy #$14                                                          ; 410a: a0 14
    lda #$fd                                                          ; 410c: a9 fd
    sta temp_sprite_y_offset                                          ; 410e: 85 3b
    lda #3                                                            ; 4110: a9 03
    jsr set_object_position_from_cell_xy                              ; 4112: 20 5d 1f
    tax                                                               ; 4115: aa
    lda #$cd                                                          ; 4116: a9 cd
    sta object_spriteid,x                                             ; 4118: 9d a8 09
    lda #$d0                                                          ; 411b: a9 d0
    sta object_sprite_mask_type,x                                     ; 411d: 9d ac 38
    lda #$c0                                                          ; 4120: a9 c0
    sta object_z_order,x                                              ; 4122: 9d c2 38
c4125
    rts                                                               ; 4125: 60

c4126
    lda l0a0f                                                         ; 4126: ad 0f 0a
    bne c414c                                                         ; 4129: d0 21
    lda desired_room_index                                            ; 412b: a5 30
    cmp #3                                                            ; 412d: c9 03
    bne c415b                                                         ; 412f: d0 2a
    ldx #$0b                                                          ; 4131: a2 0b
    ldy #3                                                            ; 4133: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 4135: 20 e2 28
    beq c415b                                                         ; 4138: f0 21
    lda #$cf                                                          ; 413a: a9 cf
    jsr find_or_create_menu_slot_for_A                                ; 413c: 20 bd 2b
    lda #0                                                            ; 413f: a9 00
    sta l09ab                                                         ; 4141: 8d ab 09
    lda #$ff                                                          ; 4144: a9 ff
    sta l0a0f                                                         ; 4146: 8d 0f 0a
    jmp c415b                                                         ; 4149: 4c 5b 41

c414c
    lda #$cf                                                          ; 414c: a9 cf
    cmp player_using_object_spriteid                                  ; 414e: cd b6 2e
    bne c415b                                                         ; 4151: d0 08
    cmp previous_player_using_object_spriteid                         ; 4153: cd b7 2e
    beq c415b                                                         ; 4156: f0 03
    jsr sub_c3fea                                                     ; 4158: 20 ea 3f
c415b
    rts                                                               ; 415b: 60

l415c
    !byte 4, 0, 0, 0, 0, 0, 6, 5, 5, 4, 0, 0, 0, 0, 0, 0, 0           ; 415c: 04 00 00...
l416d
    !byte   0,   0,   0,   0,   0,   0, $fa, $fe,   2,   6,   8,   8  ; 416d: 00 00 00...
    !byte   8,   8,   8,   8,   8                                     ; 4179: 08 08 08...
l417e
    !byte $d8, $d8, $d8, $d8, $d8, $d8, $db, $db, $db, $db, $db, $db  ; 417e: d8 d8 d8...
    !byte $db, $db, $db, $db, $db,   0, $dc,   0, $d8,   0, $db, $db  ; 418a: db db db...
    !byte $db, $db, $db, $db, $db, $db, $db, $db,   0, $d9, $d9, $d9  ; 4196: db db db...
    !byte $d9, $d9, $d9, $d9, $d9, $d9, $d9,   0, $da,   0            ; 41a2: d9 d9 d9...

sub_c41ac
    lda update_room_first_update_flag                                 ; 41ac: ad 2b 13
    beq c420d                                                         ; 41af: f0 5c
    lda current_level                                                 ; 41b1: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 41b3: c5 51
    beq c41ed                                                         ; 41b5: f0 36
    lda #$12                                                          ; 41b7: a9 12
    sta l0070                                                         ; 41b9: 85 70
    ldx #$20 ; ' '                                                    ; 41bb: a2 20
    ldy #$76 ; 'v'                                                    ; 41bd: a0 76
    lda l0a12                                                         ; 41bf: ad 12 0a
    beq c41df                                                         ; 41c2: f0 1b
    cmp #$12                                                          ; 41c4: c9 12
    beq c41df                                                         ; 41c6: f0 17
    lda #$2c ; ','                                                    ; 41c8: a9 2c
    sta l0070                                                         ; 41ca: 85 70
    ldx #$38 ; '8'                                                    ; 41cc: a2 38
    ldy #$ae                                                          ; 41ce: a0 ae
    lda l0a12                                                         ; 41d0: ad 12 0a
    cmp #$2c ; ','                                                    ; 41d3: c9 2c
    beq c41df                                                         ; 41d5: f0 08
    cmp #$21 ; '!'                                                    ; 41d7: c9 21
    beq c41df                                                         ; 41d9: f0 04
    lda #$14                                                          ; 41db: a9 14
    sta l0070                                                         ; 41dd: 85 70
c41df
    lda l0070                                                         ; 41df: a5 70
    sta l0a12                                                         ; 41e1: 8d 12 0a
    sta l0a6f                                                         ; 41e4: 8d 6f 0a
    stx l0a70                                                         ; 41e7: 8e 70 0a
    sty l0a71                                                         ; 41ea: 8c 71 0a
c41ed
    lda desired_room_index                                            ; 41ed: a5 30
    cmp #3                                                            ; 41ef: c9 03
    bne c4207                                                         ; 41f1: d0 14
    ldx #5                                                            ; 41f3: a2 05
    lda #0                                                            ; 41f5: a9 00
    sta object_x_high,x                                               ; 41f7: 9d 66 09
    sta object_y_high,x                                               ; 41fa: 9d 92 09
    lda #$d1                                                          ; 41fd: a9 d1
    sta object_sprite_mask_type,x                                     ; 41ff: 9d ac 38
    lda #$c0                                                          ; 4202: a9 c0
    sta object_z_order,x                                              ; 4204: 9d c2 38
c4207
    jmp c4309                                                         ; 4207: 4c 09 43

c420a
    jmp c42eb                                                         ; 420a: 4c eb 42

c420d
    lda l0a6f                                                         ; 420d: ad 6f 0a
    clc                                                               ; 4210: 18
    adc #1                                                            ; 4211: 69 01
    tay                                                               ; 4213: a8
    lda l417e,y                                                       ; 4214: b9 7e 41
    bne c421c                                                         ; 4217: d0 03
    ldy l0a12                                                         ; 4219: ac 12 0a
c421c
    lda l0a12                                                         ; 421c: ad 12 0a
    cmp #$12                                                          ; 421f: c9 12
    bne c423d                                                         ; 4221: d0 1a
    lda desired_room_index                                            ; 4223: a5 30
    cmp #3                                                            ; 4225: c9 03
    bne c420a                                                         ; 4227: d0 e1
    lda object_x_high                                                 ; 4229: ad 66 09
    bne c420a                                                         ; 422c: d0 dc
    lda object_x_low                                                  ; 422e: ad 50 09
    cmp #$80                                                          ; 4231: c9 80
    bcc c420a                                                         ; 4233: 90 d5
    ldy #0                                                            ; 4235: a0 00
    sty l0a12                                                         ; 4237: 8c 12 0a
    jmp c42eb                                                         ; 423a: 4c eb 42

c423d
    cmp #0                                                            ; 423d: c9 00
    bne c4260                                                         ; 423f: d0 1f
    cpy #$10                                                          ; 4241: c0 10
    beq c424c                                                         ; 4243: f0 07
    cpy #0                                                            ; 4245: c0 00
    beq c425a                                                         ; 4247: f0 11
    jmp c42eb                                                         ; 4249: 4c eb 42

c424c
    lda desired_room_index                                            ; 424c: a5 30
    cmp #3                                                            ; 424e: c9 03
    bne c420a                                                         ; 4250: d0 b8
    jsr play_landing_sound                                            ; 4252: 20 a9 23
    ldy #$10                                                          ; 4255: a0 10
    jmp c42eb                                                         ; 4257: 4c eb 42

c425a
    lda #$14                                                          ; 425a: a9 14
    sta l0a12                                                         ; 425c: 8d 12 0a
    tay                                                               ; 425f: a8
c4260
    cmp #$14                                                          ; 4260: c9 14
    bne c42c2                                                         ; 4262: d0 5e
    lda desired_room_index                                            ; 4264: a5 30
    cmp #3                                                            ; 4266: c9 03
    bne c420a                                                         ; 4268: d0 a0
    lda #$cf                                                          ; 426a: a9 cf
    cmp player_using_object_spriteid                                  ; 426c: cd b6 2e
    bne c4296                                                         ; 426f: d0 25
    cmp previous_player_using_object_spriteid                         ; 4271: cd b7 2e
    beq c4296                                                         ; 4274: f0 20
    lda object_direction                                              ; 4276: ad be 09
    bpl c4296                                                         ; 4279: 10 1b
    lda object_y_low                                                  ; 427b: ad 7c 09
    cmp #$a8                                                          ; 427e: c9 a8
    bcc c4296                                                         ; 4280: 90 14
    lda object_x_high                                                 ; 4282: ad 66 09
    bne c4296                                                         ; 4285: d0 0f
    lda object_x_low                                                  ; 4287: ad 50 09
    cmp #$d0                                                          ; 428a: c9 d0
    bcs c4296                                                         ; 428c: b0 08
    ldy #$21 ; '!'                                                    ; 428e: a0 21
    sty l0a12                                                         ; 4290: 8c 12 0a
    jmp c42eb                                                         ; 4293: 4c eb 42

c4296
    ldx #0                                                            ; 4296: a2 00
    sty l4367                                                         ; 4298: 8c 67 43
    ldy #5                                                            ; 429b: a0 05
    jsr test_for_collision_between_objects_x_and_y                    ; 429d: 20 e2 28
    ldy l4367                                                         ; 42a0: ac 67 43
    ora #0                                                            ; 42a3: 09 00
    bne c42b8                                                         ; 42a5: d0 11
    ldx #1                                                            ; 42a7: a2 01
    sty l4367                                                         ; 42a9: 8c 67 43
    ldy #5                                                            ; 42ac: a0 05
    jsr test_for_collision_between_objects_x_and_y                    ; 42ae: 20 e2 28
    ldy l4367                                                         ; 42b1: ac 67 43
    ora #0                                                            ; 42b4: 09 00
    beq c42eb                                                         ; 42b6: f0 33
c42b8
    lda #6                                                            ; 42b8: a9 06
    sta player_wall_collision_flag                                    ; 42ba: 8d 33 24
    ldy #$16                                                          ; 42bd: a0 16
    jmp c42eb                                                         ; 42bf: 4c eb 42

c42c2
    cmp #$21 ; '!'                                                    ; 42c2: c9 21
    bne c42eb                                                         ; 42c4: d0 25
    cpy #$21 ; '!'                                                    ; 42c6: c0 21
    bne c42eb                                                         ; 42c8: d0 21
    lda desired_room_index                                            ; 42ca: a5 30
    cmp #3                                                            ; 42cc: c9 03
    bne c42e6                                                         ; 42ce: d0 16
    jsr sub_c3fd9                                                     ; 42d0: 20 d9 3f
    lda #0                                                            ; 42d3: a9 00
    sta value_to_write_to_collision_map                               ; 42d5: 85 3e
    ldx #6                                                            ; 42d7: a2 06
    ldy #$13                                                          ; 42d9: a0 13
    lda #2                                                            ; 42db: a9 02
    sta width_in_cells                                                ; 42dd: 85 3c
    lda #3                                                            ; 42df: a9 03
    sta height_in_cells                                               ; 42e1: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 42e3: 20 44 1e
c42e6
    ldy #$2c ; ','                                                    ; 42e6: a0 2c
    sty l0a12                                                         ; 42e8: 8c 12 0a
c42eb
    sty l0a6f                                                         ; 42eb: 8c 6f 0a
    lda l0a12                                                         ; 42ee: ad 12 0a
    cmp #0                                                            ; 42f1: c9 00
    bne c4309                                                         ; 42f3: d0 14
    lda l415c,y                                                       ; 42f5: b9 5c 41
    clc                                                               ; 42f8: 18
    adc l0a70                                                         ; 42f9: 6d 70 0a
    sta l0a70                                                         ; 42fc: 8d 70 0a
    lda l416d,y                                                       ; 42ff: b9 6d 41
    clc                                                               ; 4302: 18
    adc l0a71                                                         ; 4303: 6d 71 0a
    sta l0a71                                                         ; 4306: 8d 71 0a
c4309
    lda desired_room_index                                            ; 4309: a5 30
    cmp #3                                                            ; 430b: c9 03
    bne c4366                                                         ; 430d: d0 57
    ldy l0a6f                                                         ; 430f: ac 6f 0a
    lda l417e,y                                                       ; 4312: b9 7e 41
    sta l09ad                                                         ; 4315: 8d ad 09
    lda l0a70                                                         ; 4318: ad 70 0a
    sta l0955                                                         ; 431b: 8d 55 09
    lda l0a71                                                         ; 431e: ad 71 0a
    sta l0981                                                         ; 4321: 8d 81 09
    lda #3                                                            ; 4324: a9 03
    sta value_to_write_to_collision_map                               ; 4326: 85 3e
    lda l0a12                                                         ; 4328: ad 12 0a
    cmp #$14                                                          ; 432b: c9 14
    beq c4352                                                         ; 432d: f0 23
    cmp #$21 ; '!'                                                    ; 432f: c9 21
    beq c4352                                                         ; 4331: f0 1f
    cmp #0                                                            ; 4333: c9 00
    beq c4352                                                         ; 4335: f0 1b
    cmp #$2c ; ','                                                    ; 4337: c9 2c
    bne c4366                                                         ; 4339: d0 2b
    lda #3                                                            ; 433b: a9 03
    sta width_in_cells                                                ; 433d: 85 3c
    lda #1                                                            ; 433f: a9 01
    sta height_in_cells                                               ; 4341: 85 3d
    ldx #4                                                            ; 4343: a2 04
    ldy #$15                                                          ; 4345: a0 15
    jsr read_collision_map_value_for_xy                               ; 4347: 20 fa 1e
    bne c4366                                                         ; 434a: d0 1a
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 434c: 20 44 1e
    jmp c4366                                                         ; 434f: 4c 66 43

c4352
    lda #2                                                            ; 4352: a9 02
    sta width_in_cells                                                ; 4354: 85 3c
    lda #3                                                            ; 4356: a9 03
    sta height_in_cells                                               ; 4358: 85 3d
    ldx #6                                                            ; 435a: a2 06
    ldy #$13                                                          ; 435c: a0 13
    jsr read_collision_map_value_for_xy                               ; 435e: 20 fa 1e
    bne c4366                                                         ; 4361: d0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 4363: 20 44 1e
c4366
    rts                                                               ; 4366: 60

l4367
    !byte   0,   5,   1,   0,   0,   0,   0,   0,   0, $7e,   0, $fc  ; 4367: 00 05 01...
    !byte $f8, $7e,   0, $10,   0,   5,   0,   7,   0,   1,   0, $11  ; 4373: f8 7e 00...
    !byte   0,   0,   0, $c8,   0,   1,   0,   6,   1,   0,   0,   0  ; 437f: 00 00 00...
    !byte   0,   0,   0, $50,   0,   0, $fa, $73,   0, $10,   0,   6  ; 438b: 00 00 00...
    !byte   0,   7,   0,   1,   0, $11,   0,   0,   0, $d2,   0,   1  ; 4397: 00 07 00...
    !byte   0                                                         ; 43a3: 00
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

; Automatically generated labels:
;     c3b08
;     c3b12
;     c3b1c
;     c3c22
;     c3c4e
;     c3c4f
;     c3c72
;     c3c82
;     c3ca3
;     c3caf
;     c3cca
;     c3ccd
;     c3cfc
;     c3d0b
;     c3d22
;     c3d3f
;     c3d45
;     c3d4d
;     c3d6a
;     c3d70
;     c3d7d
;     c3e2c
;     c3edc
;     c3f1c
;     c3f56
;     c3f63
;     c3f66
;     c3faf
;     c3fbd
;     c3fbf
;     c3fc2
;     c3fcf
;     c3fd5
;     c40f9
;     c4125
;     c4126
;     c414c
;     c415b
;     c41df
;     c41ed
;     c4207
;     c420a
;     c420d
;     c421c
;     c423d
;     c424c
;     c425a
;     c4260
;     c4296
;     c42b8
;     c42c2
;     c42e6
;     c42eb
;     c4309
;     c4352
;     c4366
;     l0070
;     l0955
;     l0981
;     l09ab
;     l09ac
;     l09ad
;     l0a0e
;     l0a0f
;     l0a10
;     l0a11
;     l0a12
;     l0a6f
;     l0a70
;     l0a71
;     l2ef4
;     l3fd6
;     l415c
;     l416d
;     l417e
;     l4367
;     sub_c3bfc
;     sub_c3c73
;     sub_c3ee9
;     sub_c3fd9
;     sub_c3fea
;     sub_c40c2
;     sub_c41ac
!if (<ground_fill_2x2_top_left) != $a4 {
    !error "Assertion failed: <ground_fill_2x2_top_left == $a4"
}
!if (>ground_fill_2x2_top_left) != $43 {
    !error "Assertion failed: >ground_fill_2x2_top_left == $43"
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
