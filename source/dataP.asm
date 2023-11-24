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
l0015                                               = $15
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
l0048                                               = $48
previous_room_index                                 = $50
level_before_latest_level_and_room_initialisation   = $51
player_held_object_spriteid                         = $52
developer_mode_sideways_ram_is_set_up_flag          = $5b
l0070                                               = $70
room_exit_direction                                 = $70
l0078                                               = $78
l0079                                               = $79
show_dialog_box                                     = $040a
remove_dialog                                       = $0453
object_x_low                                        = $0950
l0952                                               = $0952
object_x_low_old                                    = $095b
l095d                                               = $095d
object_x_high                                       = $0966
l0968                                               = $0968
object_x_high_old                                   = $0971
object_y_low                                        = $097c
l097e                                               = $097e
l097f                                               = $097f
l0980                                               = $0980
l0981                                               = $0981
l0982                                               = $0982
object_y_low_old                                    = $0987
l0989                                               = $0989
object_y_high                                       = $0992
l0994                                               = $0994
object_y_high_old                                   = $099d
object_spriteid                                     = $09a8
l09aa                                               = $09aa
l09ab                                               = $09ab
l09ac                                               = $09ac
l09ad                                               = $09ad
l09ae                                               = $09ae
l09af                                               = $09af
object_spriteid_old                                 = $09b3
l09b5                                               = $09b5
l09b7                                               = $09b7
l09b9                                               = $09b9
object_direction                                    = $09be
l09c0                                               = $09c0
object_direction_old                                = $09c9
l09df                                               = $09df
level_progress_table                                = $09ef
l0a62                                               = $0a62
l0a63                                               = $0a63
l0a64                                               = $0a64
l0a65                                               = $0a65
l0a66                                               = $0a66
l0a67                                               = $0a67
l0a68                                               = $0a68
l0a69                                               = $0a69
l0a6a                                               = $0a6a
l0a6b                                               = $0a6b
l0a6c                                               = $0a6c
l0a6d                                               = $0a6d
l0a6e                                               = $0a6e
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
l20f7                                               = $20f7
play_landing_sound                                  = $23a9
player_wall_collision_flag                          = $2433
l2434                                               = $2434
temp_left_offset                                    = $24d0
temp_right_offset                                   = $24d1
l24d2                                               = $24d2
temp_top_offset                                     = $2550
temp_bottom_offset                                  = $2551
l25f5                                               = $25f5
l2770                                               = $2770
l288f                                               = $288f
l2890                                               = $2890
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
inhibit_monkey_climb_flag                           = $31d7
print_encrypted_string_at_yx_centred                = $37f3
wait_one_second_then_check_keys                     = $388d
object_sprite_mask_type                             = $38ac
l38ae                                               = $38ae
object_z_order                                      = $38c2
l38c4                                               = $38c4
l38c6                                               = $38c6
l38c8                                               = $38c8
l38c9                                               = $38c9
object_room_collision_flags                         = $38d8
play_sound_yx                                       = $38f6
define_envelope                                     = $395e
sound_priority_per_channel_table                    = $396f
l3970                                               = $3970
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
    !word sprite_data - level_data                                    ; 3ad5: 67 0b                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f4 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 17 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
    !byte 1, 1                                                        ; 3add: 01 01
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
level_specific_initialisation
    lda current_level                                                 ; 3af4: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3af6: c5 51
    beq c3b0e                                                         ; 3af8: f0 14
    lda developer_flags                                               ; 3afa: ad 03 11
    bpl c3b04                                                         ; 3afd: 10 05
    lda #$ff                                                          ; 3aff: a9 ff
    sta l0a62                                                         ; 3b01: 8d 62 0a
c3b04
    lda l0a62                                                         ; 3b04: ad 62 0a
    bpl c3b0e                                                         ; 3b07: 10 05
    lda #$c9                                                          ; 3b09: a9 c9
    jsr find_or_create_menu_slot_for_A                                ; 3b0b: 20 bd 2b
c3b0e
    lda #$1c                                                          ; 3b0e: a9 1c
    sta source_sprite_memory_low                                      ; 3b10: 85 40
    lda #$46 ; 'F'                                                    ; 3b12: a9 46
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
    jsr sub_c40e2                                                     ; 3b17: 20 e2 40
    jsr sub_c41a5                                                     ; 3b1a: 20 a5 41
    jsr sub_c4324                                                     ; 3b1d: 20 24 43
    jsr sub_c3d34                                                     ; 3b20: 20 34 3d
    jsr sub_c3bc3                                                     ; 3b23: 20 c3 3b
    jsr sub_c404a                                                     ; 3b26: 20 4a 40
    rts                                                               ; 3b29: 60

sub_c3b2a
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
    jsr sub_c3b2a                                                     ; 3b8f: 20 2a 3b
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3b92: 20 90 1b
; draw sprite $3b at (20,10)
    ldx #$14                                                          ; 3b95: a2 14
    ldy #$0a                                                          ; 3b97: a0 0a
    lda #$3b ; ';'                                                    ; 3b99: a9 3b
    jsr draw_sprite_a_at_cell_xy                                      ; 3b9b: 20 4c 1f
    lda #3                                                            ; 3b9e: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3ba0: 20 bb 1e
    jsr start_room                                                    ; 3ba3: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 3ba6: 20 da 12
    sta room_exit_direction                                           ; 3ba9: 85 70
    and #exit_room_left                                               ; 3bab: 29 01
    beq c3bb6                                                         ; 3bad: f0 07
    ldx #0                                                            ; 3baf: a2 00
    ldy current_level                                                 ; 3bb1: a4 31
    jmp initialise_level_and_room                                     ; 3bb3: 4c 40 11

c3bb6
    lda room_exit_direction                                           ; 3bb6: a5 70
    and #exit_room_right                                              ; 3bb8: 29 04
    beq room_1_game_update_loop                                       ; 3bba: f0 ea
    ldx #2                                                            ; 3bbc: a2 02
    ldy current_level                                                 ; 3bbe: a4 31
    jmp initialise_level_and_room                                     ; 3bc0: 4c 40 11

sub_c3bc3
    lda #1                                                            ; 3bc3: a9 01
    sta currently_updating_logic_for_room_index                       ; 3bc5: 8d ba 1a
    ldx #$14                                                          ; 3bc8: a2 14
    ldy #$0a                                                          ; 3bca: a0 0a
    lda #3                                                            ; 3bcc: a9 03
    jsr update_brazier_and_fire                                       ; 3bce: 20 88 19
    inx                                                               ; 3bd1: e8
    lda #4                                                            ; 3bd2: a9 04
    jsr update_brazier_and_fire                                       ; 3bd4: 20 88 19
    lda update_room_first_update_flag                                 ; 3bd7: ad 2b 13
    beq c3c36                                                         ; 3bda: f0 5a
    lda desired_room_index                                            ; 3bdc: a5 30
    cmp #1                                                            ; 3bde: c9 01
    bne c3c33                                                         ; 3be0: d0 51
    ldx #$0a                                                          ; 3be2: a2 0a
    ldy #2                                                            ; 3be4: a0 02
    lda #$0e                                                          ; 3be6: a9 0e
    jsr draw_rope                                                     ; 3be8: 20 b9 1d
    ldy #$0f                                                          ; 3beb: a0 0f
    lda #4                                                            ; 3bed: a9 04
    sta l0015                                                         ; 3bef: 85 15
    lda #$0a                                                          ; 3bf1: a9 0a
    jsr draw_sprite_a_at_cell_xy                                      ; 3bf3: 20 4c 1f
    lda #5                                                            ; 3bf6: a9 05
    jsr set_object_position_from_cell_xy                              ; 3bf8: 20 5d 1f
    ldx #$1d                                                          ; 3bfb: a2 1d
    ldy #2                                                            ; 3bfd: a0 02
    lda #$0e                                                          ; 3bff: a9 0e
    jsr draw_rope                                                     ; 3c01: 20 b9 1d
    ldy #$0f                                                          ; 3c04: a0 0f
    lda #4                                                            ; 3c06: a9 04
    sta l0015                                                         ; 3c08: 85 15
    lda #$0a                                                          ; 3c0a: a9 0a
    jsr draw_sprite_a_at_cell_xy                                      ; 3c0c: 20 4c 1f
    lda #6                                                            ; 3c0f: a9 06
    jsr set_object_position_from_cell_xy                              ; 3c11: 20 5d 1f
    lda #7                                                            ; 3c14: a9 07
    jsr set_object_position_from_cell_xy                              ; 3c16: 20 5d 1f
    lda #$dd                                                          ; 3c19: a9 dd
    sta l09af                                                         ; 3c1b: 8d af 09
    lda #$c0                                                          ; 3c1e: a9 c0
    sta l38c9                                                         ; 3c20: 8d c9 38
    iny                                                               ; 3c23: c8
    lda #1                                                            ; 3c24: a9 01
    sta width_in_cells                                                ; 3c26: 85 3c
    lda #4                                                            ; 3c28: a9 04
    sta height_in_cells                                               ; 3c2a: 85 3d
    lda #2                                                            ; 3c2c: a9 02
    sta value_to_write_to_collision_map                               ; 3c2e: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3c30: 20 44 1e
c3c33
    jmp c3c86                                                         ; 3c33: 4c 86 3c

c3c36
    lda l0a62                                                         ; 3c36: ad 62 0a
    cmp #4                                                            ; 3c39: c9 04
    beq c3c77                                                         ; 3c3b: f0 3a
    cmp #5                                                            ; 3c3d: c9 05
    beq c3c7b                                                         ; 3c3f: f0 3a
    lda desired_room_index                                            ; 3c41: a5 30
    cmp #1                                                            ; 3c43: c9 01
    bne c3c86                                                         ; 3c45: d0 3f
    lda l0a67                                                         ; 3c47: ad 67 0a
    bmi c3c86                                                         ; 3c4a: 30 3a
    ldx #5                                                            ; 3c4c: a2 05
    jsr sub_c3e56                                                     ; 3c4e: 20 56 3e
    beq c3c60                                                         ; 3c51: f0 0d
    lda #0                                                            ; 3c53: a9 00
    sta l09aa                                                         ; 3c55: 8d aa 09
    lda #4                                                            ; 3c58: a9 04
    sta l0a62                                                         ; 3c5a: 8d 62 0a
    jmp c3c86                                                         ; 3c5d: 4c 86 3c

c3c60
    jmp c3c86                                                         ; 3c60: 4c 86 3c

    !byte $a2,   6                                                    ; 3c63: a2 06
    !text " V>"                                                       ; 3c65: 20 56 3e
    !byte $f0, $1c, $a9,   0, $8d, $aa,   9, $a9,   5, $8d, $62, $0a  ; 3c68: f0 1c a9...
    !byte $4c, $86, $3c                                               ; 3c74: 4c 86 3c

c3c77
    ldx #5                                                            ; 3c77: a2 05
    bne c3c7d                                                         ; 3c79: d0 02
c3c7b
    ldx #6                                                            ; 3c7b: a2 06
c3c7d
    lda desired_room_index                                            ; 3c7d: a5 30
    cmp #1                                                            ; 3c7f: c9 01
    bne c3c86                                                         ; 3c81: d0 03
    jsr sub_c3e89                                                     ; 3c83: 20 89 3e
c3c86
    lda desired_room_index                                            ; 3c86: a5 30
    cmp #1                                                            ; 3c88: c9 01
    bne c3cae                                                         ; 3c8a: d0 22
    lda #$cf                                                          ; 3c8c: a9 cf
    sta l09ad                                                         ; 3c8e: 8d ad 09
    lda l0a62                                                         ; 3c91: ad 62 0a
    cmp #4                                                            ; 3c94: c9 04
    bne c3c9d                                                         ; 3c96: d0 05
    lda #$d0                                                          ; 3c98: a9 d0
    sta l09ad                                                         ; 3c9a: 8d ad 09
c3c9d
    lda #$cf                                                          ; 3c9d: a9 cf
    sta l09ae                                                         ; 3c9f: 8d ae 09
    lda l0a62                                                         ; 3ca2: ad 62 0a
    cmp #5                                                            ; 3ca5: c9 05
    bne c3cae                                                         ; 3ca7: d0 05
    lda #$d0                                                          ; 3ca9: a9 d0
    sta l09ae                                                         ; 3cab: 8d ae 09
c3cae
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
    jsr sub_c3b2a                                                     ; 3d0e: 20 2a 3b
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3d11: 20 90 1b
    jsr start_room                                                    ; 3d14: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 3d17: 20 da 12
    sta room_exit_direction                                           ; 3d1a: 85 70
    and #exit_room_left                                               ; 3d1c: 29 01
    beq c3d27                                                         ; 3d1e: f0 07
    ldx #1                                                            ; 3d20: a2 01
    ldy current_level                                                 ; 3d22: a4 31
    jmp initialise_level_and_room                                     ; 3d24: 4c 40 11

c3d27
    lda room_exit_direction                                           ; 3d27: a5 70
    and #exit_room_right                                              ; 3d29: 29 04
    beq room_2_game_update_loop                                       ; 3d2b: f0 ea
    ldx #3                                                            ; 3d2d: a2 03
    ldy current_level                                                 ; 3d2f: a4 31
    jmp initialise_level_and_room                                     ; 3d31: 4c 40 11

sub_c3d34
    lda update_room_first_update_flag                                 ; 3d34: ad 2b 13
    bne c3d3c                                                         ; 3d37: d0 03
    jmp c3df1                                                         ; 3d39: 4c f1 3d

c3d3c
    lda current_level                                                 ; 3d3c: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3d3e: c5 51
    beq c3d72                                                         ; 3d40: f0 30
    ldx #$f0                                                          ; 3d42: a2 f0
    ldy #$45 ; 'E'                                                    ; 3d44: a0 45
    jsr define_envelope                                               ; 3d46: 20 5e 39
    ldx #6                                                            ; 3d49: a2 06
    ldy #$46 ; 'F'                                                    ; 3d4b: a0 46
    jsr define_envelope                                               ; 3d4d: 20 5e 39
    lda l0a6b                                                         ; 3d50: ad 6b 0a
    beq c3d68                                                         ; 3d53: f0 13
    lda l0a6c                                                         ; 3d55: ad 6c 0a
    beq c3d72                                                         ; 3d58: f0 18
    bmi c3d68                                                         ; 3d5a: 30 0c
    lda #$78 ; 'x'                                                    ; 3d5c: a9 78
    sta l0a6b                                                         ; 3d5e: 8d 6b 0a
    lda #0                                                            ; 3d61: a9 00
    sta l0a6c                                                         ; 3d63: 8d 6c 0a
    beq c3d72                                                         ; 3d66: f0 0a
c3d68
    lda #$18                                                          ; 3d68: a9 18
    sta l0a6b                                                         ; 3d6a: 8d 6b 0a
    lda #0                                                            ; 3d6d: a9 00
    sta l0a6c                                                         ; 3d6f: 8d 6c 0a
c3d72
    lda desired_room_index                                            ; 3d72: a5 30
    cmp #2                                                            ; 3d74: c9 02
    bne c3dd4                                                         ; 3d76: d0 5c
    ldx #$0a                                                          ; 3d78: a2 0a
    ldy #0                                                            ; 3d7a: a0 00
    lda #3                                                            ; 3d7c: a9 03
    jsr set_object_position_from_cell_xy                              ; 3d7e: 20 5d 1f
    lda #4                                                            ; 3d81: a9 04
    jsr set_object_position_from_cell_xy                              ; 3d83: 20 5d 1f
    lda #$c0                                                          ; 3d86: a9 c0
    sta l38c6                                                         ; 3d88: 8d c6 38
    ldx #$1d                                                          ; 3d8b: a2 1d
    lda #5                                                            ; 3d8d: a9 05
    jsr set_object_position_from_cell_xy                              ; 3d8f: 20 5d 1f
    lda #6                                                            ; 3d92: a9 06
    jsr set_object_position_from_cell_xy                              ; 3d94: 20 5d 1f
    lda #$c0                                                          ; 3d97: a9 c0
    sta l38c8                                                         ; 3d99: 8d c8 38
    ldx #$0a                                                          ; 3d9c: a2 0a
    ldy #2                                                            ; 3d9e: a0 02
    lda #$cb                                                          ; 3da0: a9 cb
    jsr draw_sprite_a_at_cell_xy                                      ; 3da2: 20 4c 1f
    lda #3                                                            ; 3da5: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3da7: 20 bb 1e
    inx                                                               ; 3daa: e8
    inx                                                               ; 3dab: e8
    lda #$cd                                                          ; 3dac: a9 cd
loop_c3dae
    jsr draw_sprite_a_at_cell_xy                                      ; 3dae: 20 4c 1f
    inx                                                               ; 3db1: e8
    cpx #$1c                                                          ; 3db2: e0 1c
    bcc loop_c3dae                                                    ; 3db4: 90 f8
    inx                                                               ; 3db6: e8
    lda #$cc                                                          ; 3db7: a9 cc
    jsr draw_sprite_a_at_cell_xy                                      ; 3db9: 20 4c 1f
    lda #3                                                            ; 3dbc: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3dbe: 20 bb 1e
    ldx #$0a                                                          ; 3dc1: a2 0a
    lda l0a6b                                                         ; 3dc3: ad 6b 0a
    jsr sub_c3dd7                                                     ; 3dc6: 20 d7 3d
    ldx #$1d                                                          ; 3dc9: a2 1d
    lda #$90                                                          ; 3dcb: a9 90
    sec                                                               ; 3dcd: 38
    sbc l0a6b                                                         ; 3dce: ed 6b 0a
    jsr sub_c3dd7                                                     ; 3dd1: 20 d7 3d
c3dd4
    jmp c3f03                                                         ; 3dd4: 4c 03 3f

sub_c3dd7
    sec                                                               ; 3dd7: 38
    sbc #4                                                            ; 3dd8: e9 04
    lsr                                                               ; 3dda: 4a
    lsr                                                               ; 3ddb: 4a
    lsr                                                               ; 3ddc: 4a
    tay                                                               ; 3ddd: a8
    jmp c3dec                                                         ; 3dde: 4c ec 3d

loop_c3de1
    lda #$ce                                                          ; 3de1: a9 ce
    jsr draw_sprite_a_at_cell_xy                                      ; 3de3: 20 4c 1f
    lda #2                                                            ; 3de6: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3de8: 20 bb 1e
    dey                                                               ; 3deb: 88
c3dec
    cpy #3                                                            ; 3dec: c0 03
    bcs loop_c3de1                                                    ; 3dee: b0 f1
    rts                                                               ; 3df0: 60

c3df1
    lda l0a62                                                         ; 3df1: ad 62 0a
    cmp #1                                                            ; 3df4: c9 01
    beq c3e77                                                         ; 3df6: f0 7f
    cmp #2                                                            ; 3df8: c9 02
    beq c3e7b                                                         ; 3dfa: f0 7f
    lda l0a6c                                                         ; 3dfc: ad 6c 0a
    beq c3e04                                                         ; 3dff: f0 03
    jmp c3eaa                                                         ; 3e01: 4c aa 3e

c3e04
    lda desired_room_index                                            ; 3e04: a5 30
    cmp #2                                                            ; 3e06: c9 02
    bne c3e53                                                         ; 3e08: d0 49
    lda l0a62                                                         ; 3e0a: ad 62 0a
    cmp #6                                                            ; 3e0d: c9 06
    bcc c3e53                                                         ; 3e0f: 90 42
    lda l0a67                                                         ; 3e11: ad 67 0a
    bmi c3e53                                                         ; 3e14: 30 3d
    ldx #3                                                            ; 3e16: a2 03
    jsr sub_c3e56                                                     ; 3e18: 20 56 3e
    beq c3e36                                                         ; 3e1b: f0 19
    lda #0                                                            ; 3e1d: a9 00
    sta l09aa                                                         ; 3e1f: 8d aa 09
    lda #1                                                            ; 3e22: a9 01
    sta l0a62                                                         ; 3e24: 8d 62 0a
    lda l0a6b                                                         ; 3e27: ad 6b 0a
    cmp #$78 ; 'x'                                                    ; 3e2a: c9 78
    beq c3e53                                                         ; 3e2c: f0 25
    lda #4                                                            ; 3e2e: a9 04
    sta l0a6c                                                         ; 3e30: 8d 6c 0a
    jmp c3f03                                                         ; 3e33: 4c 03 3f

c3e36
    ldx #5                                                            ; 3e36: a2 05
    jsr sub_c3e56                                                     ; 3e38: 20 56 3e
    beq c3e53                                                         ; 3e3b: f0 16
    lda #0                                                            ; 3e3d: a9 00
    sta l09aa                                                         ; 3e3f: 8d aa 09
    lda #2                                                            ; 3e42: a9 02
    sta l0a62                                                         ; 3e44: 8d 62 0a
    lda l0a6b                                                         ; 3e47: ad 6b 0a
    cmp #$18                                                          ; 3e4a: c9 18
    beq c3e53                                                         ; 3e4c: f0 05
    lda #$fc                                                          ; 3e4e: a9 fc
    sta l0a6c                                                         ; 3e50: 8d 6c 0a
c3e53
    jmp c3f03                                                         ; 3e53: 4c 03 3f

sub_c3e56
    lda #7                                                            ; 3e56: a9 07
    sta temp_top_offset                                               ; 3e58: 8d 50 25
    lda #$fa                                                          ; 3e5b: a9 fa
    sta temp_bottom_offset                                            ; 3e5d: 8d 51 25
    lda #7                                                            ; 3e60: a9 07
    sta temp_left_offset                                              ; 3e62: 8d d0 24
    lda #$f9                                                          ; 3e65: a9 f9
    sta temp_right_offset                                             ; 3e67: 8d d1 24
    ldy #$0d                                                          ; 3e6a: a0 0d
    jsr test_for_collision_between_objects_x_and_y                    ; 3e6c: 20 e2 28
    pha                                                               ; 3e6f: 48
    beq c3e75                                                         ; 3e70: f0 03
    jsr sub_c3faf                                                     ; 3e72: 20 af 3f
c3e75
    pla                                                               ; 3e75: 68
    rts                                                               ; 3e76: 60

c3e77
    ldx #3                                                            ; 3e77: a2 03
    bne c3e7d                                                         ; 3e79: d0 02
c3e7b
    ldx #5                                                            ; 3e7b: a2 05
c3e7d
    lda desired_room_index                                            ; 3e7d: a5 30
    cmp #2                                                            ; 3e7f: c9 02
    bne c3eaa                                                         ; 3e81: d0 27
    jsr sub_c3e89                                                     ; 3e83: 20 89 3e
    jmp c3eaa                                                         ; 3e86: 4c aa 3e

sub_c3e89
    lda #8                                                            ; 3e89: a9 08
    sta temp_top_offset                                               ; 3e8b: 8d 50 25
    lda #3                                                            ; 3e8e: a9 03
    sta temp_left_offset                                              ; 3e90: 8d d0 24
    lda #$fe                                                          ; 3e93: a9 fe
    sta temp_right_offset                                             ; 3e95: 8d d1 24
    ldy #$0b                                                          ; 3e98: a0 0b
    jsr test_for_collision_between_objects_x_and_y                    ; 3e9a: 20 e2 28
    beq c3ea9                                                         ; 3e9d: f0 0a
    lda #$ff                                                          ; 3e9f: a9 ff
    sta l0a62                                                         ; 3ea1: 8d 62 0a
    lda #$c9                                                          ; 3ea4: a9 c9
    jsr find_or_create_menu_slot_for_A                                ; 3ea6: 20 bd 2b
c3ea9
    rts                                                               ; 3ea9: 60

c3eaa
    lda l0a6c                                                         ; 3eaa: ad 6c 0a
    beq c3f03                                                         ; 3ead: f0 54
    sta l3f5e                                                         ; 3eaf: 8d 5e 3f
    clc                                                               ; 3eb2: 18
    adc l0a6b                                                         ; 3eb3: 6d 6b 0a
    sta l0a6b                                                         ; 3eb6: 8d 6b 0a
    ldx #$18                                                          ; 3eb9: a2 18
    cmp #$19                                                          ; 3ebb: c9 19
    bcc c3ec5                                                         ; 3ebd: 90 06
    ldx #$78 ; 'x'                                                    ; 3ebf: a2 78
    cmp #$78 ; 'x'                                                    ; 3ec1: c9 78
    bcc c3ecd                                                         ; 3ec3: 90 08
c3ec5
    stx l0a6b                                                         ; 3ec5: 8e 6b 0a
    lda #0                                                            ; 3ec8: a9 00
    sta l0a6c                                                         ; 3eca: 8d 6c 0a
c3ecd
    lda desired_room_index                                            ; 3ecd: a5 30
    cmp #2                                                            ; 3ecf: c9 02
    bne c3f03                                                         ; 3ed1: d0 30
    lda #0                                                            ; 3ed3: a9 00
    ldx #$fe                                                          ; 3ed5: a2 fe
    ldy #$45 ; 'E'                                                    ; 3ed7: a0 45
    jsr play_sound_yx                                                 ; 3ed9: 20 f6 38
    lda #0                                                            ; 3edc: a9 00
    sta l09b7                                                         ; 3ede: 8d b7 09
    sta l09ac                                                         ; 3ee1: 8d ac 09
    lda l3f5e                                                         ; 3ee4: ad 5e 3f
    bmi c3eee                                                         ; 3ee7: 30 05
    lda #$d1                                                          ; 3ee9: a9 d1
    sta l09ac                                                         ; 3eeb: 8d ac 09
c3eee
    lda #0                                                            ; 3eee: a9 00
    sta l09b9                                                         ; 3ef0: 8d b9 09
    sta l09ae                                                         ; 3ef3: 8d ae 09
    lda l3f5e                                                         ; 3ef6: ad 5e 3f
    bpl c3f00                                                         ; 3ef9: 10 05
    lda #$d1                                                          ; 3efb: a9 d1
    sta l09ae                                                         ; 3efd: 8d ae 09
c3f00
    jsr sub_c3f5f                                                     ; 3f00: 20 5f 3f
c3f03
    lda desired_room_index                                            ; 3f03: a5 30
    cmp #2                                                            ; 3f05: c9 02
    bne c3f4a                                                         ; 3f07: d0 41
    lda l0a6b                                                         ; 3f09: ad 6b 0a
    sta l097f                                                         ; 3f0c: 8d 7f 09
    sta l0980                                                         ; 3f0f: 8d 80 09
    ldx #$0a                                                          ; 3f12: a2 0a
    jsr sub_c3f4b                                                     ; 3f14: 20 4b 3f
    lda #$cf                                                          ; 3f17: a9 cf
    sta l09ab                                                         ; 3f19: 8d ab 09
    lda l0a62                                                         ; 3f1c: ad 62 0a
    cmp #1                                                            ; 3f1f: c9 01
    bne c3f28                                                         ; 3f21: d0 05
    lda #$d0                                                          ; 3f23: a9 d0
    sta l09ab                                                         ; 3f25: 8d ab 09
c3f28
    lda #$90                                                          ; 3f28: a9 90
    sec                                                               ; 3f2a: 38
    sbc l0a6b                                                         ; 3f2b: ed 6b 0a
    sta l0981                                                         ; 3f2e: 8d 81 09
    sta l0982                                                         ; 3f31: 8d 82 09
    ldx #$1d                                                          ; 3f34: a2 1d
    jsr sub_c3f4b                                                     ; 3f36: 20 4b 3f
    lda #$cf                                                          ; 3f39: a9 cf
    sta l09ad                                                         ; 3f3b: 8d ad 09
    lda l0a62                                                         ; 3f3e: ad 62 0a
    cmp #2                                                            ; 3f41: c9 02
    bne c3f4a                                                         ; 3f43: d0 05
    lda #$d0                                                          ; 3f45: a9 d0
    sta l09ad                                                         ; 3f47: 8d ad 09
c3f4a
    rts                                                               ; 3f4a: 60

sub_c3f4b
    lsr                                                               ; 3f4b: 4a
    lsr                                                               ; 3f4c: 4a
    lsr                                                               ; 3f4d: 4a
    tay                                                               ; 3f4e: a8
    cpy #3                                                            ; 3f4f: c0 03
    bcc c3f58                                                         ; 3f51: 90 05
    lda #2                                                            ; 3f53: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3f55: 20 bb 1e
c3f58
    iny                                                               ; 3f58: c8
    lda #0                                                            ; 3f59: a9 00
    jmp write_a_single_value_to_cell_in_collision_map                 ; 3f5b: 4c bb 1e

l3f5e
    !byte 0                                                           ; 3f5e: 00

sub_c3f5f
    lda l0048                                                         ; 3f5f: a5 48
    cmp #6                                                            ; 3f61: c9 06
    bne c3fae                                                         ; 3f63: d0 49
    lda l09df                                                         ; 3f65: ad df 09
    cmp #$51 ; 'Q'                                                    ; 3f68: c9 51
    beq c3f74                                                         ; 3f6a: f0 08
    cmp #$45 ; 'E'                                                    ; 3f6c: c9 45
    beq c3f74                                                         ; 3f6e: f0 04
    cmp #$49 ; 'I'                                                    ; 3f70: c9 49
    bne c3fae                                                         ; 3f72: d0 3a
c3f74
    lda l3f5e                                                         ; 3f74: ad 5e 3f
    eor #$ff                                                          ; 3f77: 49 ff
    clc                                                               ; 3f79: 18
    adc #1                                                            ; 3f7a: 69 01
    ldx object_x_high                                                 ; 3f7c: ae 66 09
    bne c3f8b                                                         ; 3f7f: d0 0a
    ldx object_x_low                                                  ; 3f81: ae 50 09
    cpx #$a0                                                          ; 3f84: e0 a0
    bcs c3f8b                                                         ; 3f86: b0 03
    lda l3f5e                                                         ; 3f88: ad 5e 3f
c3f8b
    ldy #0                                                            ; 3f8b: a0 00
    tax                                                               ; 3f8d: aa
    bpl c3f91                                                         ; 3f8e: 10 01
    dey                                                               ; 3f90: 88
c3f91
    clc                                                               ; 3f91: 18
    adc object_y_low                                                  ; 3f92: 6d 7c 09
    sta object_y_low                                                  ; 3f95: 8d 7c 09
    tya                                                               ; 3f98: 98
    adc object_y_high                                                 ; 3f99: 6d 92 09
    sta object_y_high                                                 ; 3f9c: 8d 92 09
    txa                                                               ; 3f9f: 8a
    clc                                                               ; 3fa0: 18
    adc object_y_low+1                                                ; 3fa1: 6d 7d 09
    sta object_y_low+1                                                ; 3fa4: 8d 7d 09
    tya                                                               ; 3fa7: 98
    adc object_y_high+1                                               ; 3fa8: 6d 93 09
    sta object_y_high+1                                               ; 3fab: 8d 93 09
c3fae
    rts                                                               ; 3fae: 60

sub_c3faf
    lda #0                                                            ; 3faf: a9 00
    ldx #$14                                                          ; 3fb1: a2 14
    ldy #$46 ; 'F'                                                    ; 3fb3: a0 46
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
    jsr sub_c3b2a                                                     ; 400c: 20 2a 3b
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 400f: 20 90 1b
; draw sprite $dc at (34,20) of size (3x2)
    lda #3                                                            ; 4012: a9 03
    sta width_in_cells                                                ; 4014: 85 3c
    lda #2                                                            ; 4016: a9 02
    sta height_in_cells                                               ; 4018: 85 3d
    ldx #$22 ; '"'                                                    ; 401a: a2 22
    ldy #$14                                                          ; 401c: a0 14
    lda #$dc                                                          ; 401e: a9 dc
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 4020: 20 57 1f
; draw sprite $d2 at (31,20) of size (3x2)
    dex                                                               ; 4023: ca
    dex                                                               ; 4024: ca
    dex                                                               ; 4025: ca
    lda #$d2                                                          ; 4026: a9 d2
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

sub_c404a
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
    jsr sub_c3b2a                                                     ; 40b2: 20 2a 3b
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

l40d9
    !byte 8, 6, 5, 4, 3, 2, 2, 1, 0                                   ; 40d9: 08 06 05...

sub_c40e2
    lda update_room_first_update_flag                                 ; 40e2: ad 2b 13
    beq c4109                                                         ; 40e5: f0 22
    lda current_level                                                 ; 40e7: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 40e9: c5 51
    beq c40f2                                                         ; 40eb: f0 05
    lda #$60 ; '`'                                                    ; 40ed: a9 60
    sta l0a71                                                         ; 40ef: 8d 71 0a
c40f2
    lda desired_room_index                                            ; 40f2: a5 30
    cmp #0                                                            ; 40f4: c9 00
    bne c4106                                                         ; 40f6: d0 0e
    ldx #$14                                                          ; 40f8: a2 14
    ldy #$0f                                                          ; 40fa: a0 0f
    lda #$d8                                                          ; 40fc: a9 d8
    jsr draw_sprite_a_at_cell_xy                                      ; 40fe: 20 4c 1f
    lda #5                                                            ; 4101: a9 05
    jsr set_object_position_from_cell_xy                              ; 4103: 20 5d 1f
c4106
    jmp c413f                                                         ; 4106: 4c 3f 41

c4109
    ldy l0a70                                                         ; 4109: ac 70 0a
    iny                                                               ; 410c: c8
    cpy #$1a                                                          ; 410d: c0 1a
    bcc c4113                                                         ; 410f: 90 02
    ldy #0                                                            ; 4111: a0 00
c4113
    sty l0a70                                                         ; 4113: 8c 70 0a
    tya                                                               ; 4116: 98
    sec                                                               ; 4117: 38
    sbc #8                                                            ; 4118: e9 08
    bcc c413f                                                         ; 411a: 90 23
    tay                                                               ; 411c: a8
    sec                                                               ; 411d: 38
    sbc #9                                                            ; 411e: e9 09
    bcs c412d                                                         ; 4120: b0 0b
    lda l40d9,y                                                       ; 4122: b9 d9 40
    eor #$ff                                                          ; 4125: 49 ff
    clc                                                               ; 4127: 18
    adc #1                                                            ; 4128: 69 01
    jmp c4138                                                         ; 412a: 4c 38 41

c412d
    sta l0070                                                         ; 412d: 85 70
    lda #9                                                            ; 412f: a9 09
    clc                                                               ; 4131: 18
    sbc l0070                                                         ; 4132: e5 70
    tay                                                               ; 4134: a8
    lda l40d9,y                                                       ; 4135: b9 d9 40
c4138
    clc                                                               ; 4138: 18
    adc l0a71                                                         ; 4139: 6d 71 0a
    sta l0a71                                                         ; 413c: 8d 71 0a
c413f
    lda desired_room_index                                            ; 413f: a5 30
    cmp #0                                                            ; 4141: c9 00
    bne c41a4                                                         ; 4143: d0 5f
    ldx #$db                                                          ; 4145: a2 db
    stx l09ad                                                         ; 4147: 8e ad 09
    lda l0a62                                                         ; 414a: ad 62 0a
    cmp #3                                                            ; 414d: c9 03
    beq c41a4                                                         ; 414f: f0 53
    ldx #$d9                                                          ; 4151: a2 d9
    stx l09ad                                                         ; 4153: 8e ad 09
    tax                                                               ; 4156: aa
    bne c41a4                                                         ; 4157: d0 4b
    lda l0a70                                                         ; 4159: ad 70 0a
    cmp #8                                                            ; 415c: c9 08
    bcc c4174                                                         ; 415e: 90 14
    cmp #$19                                                          ; 4160: c9 19
    bne c416f                                                         ; 4162: d0 0b
    lda update_room_first_update_flag                                 ; 4164: ad 2b 13
    bne c4174                                                         ; 4167: d0 0b
    jsr play_landing_sound                                            ; 4169: 20 a9 23
    jmp c4174                                                         ; 416c: 4c 74 41

c416f
    ldx #$db                                                          ; 416f: a2 db
    stx l09ad                                                         ; 4171: 8e ad 09
c4174
    lda #$c8                                                          ; 4174: a9 c8
    sta l09aa                                                         ; 4176: 8d aa 09
    lda #$a6                                                          ; 4179: a9 a6
    sta l0952                                                         ; 417b: 8d 52 09
    lda l0a71                                                         ; 417e: ad 71 0a
    sta l097e                                                         ; 4181: 8d 7e 09
    lda #$a0                                                          ; 4184: a9 a0
    sta l38c4                                                         ; 4186: 8d c4 38
    lda #$f7                                                          ; 4189: a9 f7
    sta temp_top_offset                                               ; 418b: 8d 50 25
    ldx #$0d                                                          ; 418e: a2 0d
    ldy #3                                                            ; 4190: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 4192: 20 e2 28
    beq c41a4                                                         ; 4195: f0 0d
    lda #3                                                            ; 4197: a9 03
    sta l0a62                                                         ; 4199: 8d 62 0a
    lda #0                                                            ; 419c: a9 00
    sta l09aa                                                         ; 419e: 8d aa 09
    jsr sub_c3faf                                                     ; 41a1: 20 af 3f
c41a4
    rts                                                               ; 41a4: 60

sub_c41a5
    lda update_room_first_update_flag                                 ; 41a5: ad 2b 13
    beq c41fb                                                         ; 41a8: f0 51
    lda current_level                                                 ; 41aa: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 41ac: c5 51
    beq c41ce                                                         ; 41ae: f0 1e
    lda l0a6d                                                         ; 41b0: ad 6d 0a
    beq c41c4                                                         ; 41b3: f0 0f
    lda l0a6e                                                         ; 41b5: ad 6e 0a
    beq c41ce                                                         ; 41b8: f0 14
    bpl c41c0                                                         ; 41ba: 10 04
    lda #$0c                                                          ; 41bc: a9 0c
    bne c41c6                                                         ; 41be: d0 06
c41c0
    lda #$1b                                                          ; 41c0: a9 1b
    bne c41c6                                                         ; 41c2: d0 02
c41c4
    lda #$0c                                                          ; 41c4: a9 0c
c41c6
    sta l0a6d                                                         ; 41c6: 8d 6d 0a
    lda #0                                                            ; 41c9: a9 00
    sta l0a6e                                                         ; 41cb: 8d 6e 0a
c41ce
    lda desired_room_index                                            ; 41ce: a5 30
    cmp #0                                                            ; 41d0: c9 00
    bne c41f8                                                         ; 41d2: d0 24
    ldx #$0b                                                          ; 41d4: a2 0b
    ldy #2                                                            ; 41d6: a0 02
    lda #$d4                                                          ; 41d8: a9 d4
    jsr draw_sprite_a_at_cell_xy                                      ; 41da: 20 4c 1f
    inx                                                               ; 41dd: e8
    inx                                                               ; 41de: e8
    lda #$d3                                                          ; 41df: a9 d3
loop_c41e1
    jsr draw_sprite_a_at_cell_xy                                      ; 41e1: 20 4c 1f
    inx                                                               ; 41e4: e8
    cpx #$1b                                                          ; 41e5: e0 1b
    bcc loop_c41e1                                                    ; 41e7: 90 f8
    lda #$d5                                                          ; 41e9: a9 d5
    jsr draw_sprite_a_at_cell_xy                                      ; 41eb: 20 4c 1f
    lda #$d6                                                          ; 41ee: a9 d6
    sta l09ab                                                         ; 41f0: 8d ab 09
    lda #$c0                                                          ; 41f3: a9 c0
    sta l38c6                                                         ; 41f5: 8d c6 38
c41f8
    jmp c427e                                                         ; 41f8: 4c 7e 42

c41fb
    lda l0a6e                                                         ; 41fb: ad 6e 0a
    bne c4223                                                         ; 41fe: d0 23
    ldx #0                                                            ; 4200: a2 00
    ldy #3                                                            ; 4202: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 4204: 20 e2 28
    beq c427e                                                         ; 4207: f0 75
    lda object_room_collision_flags                                   ; 4209: ad d8 38
    and #4                                                            ; 420c: 29 04
    bne c421e                                                         ; 420e: d0 0e
    lda object_room_collision_flags                                   ; 4210: ad d8 38
    and #1                                                            ; 4213: 29 01
    beq c427e                                                         ; 4215: f0 67
    lda #$ff                                                          ; 4217: a9 ff
    sta l0a6e                                                         ; 4219: 8d 6e 0a
    bne c4223                                                         ; 421c: d0 05
c421e
    lda #1                                                            ; 421e: a9 01
    sta l0a6e                                                         ; 4220: 8d 6e 0a
c4223
    lda desired_room_index                                            ; 4223: a5 30
    cmp #0                                                            ; 4225: c9 00
    bne c423d                                                         ; 4227: d0 14
    ldx l0a6d                                                         ; 4229: ae 6d 0a
    ldy #2                                                            ; 422c: a0 02
    lda #4                                                            ; 422e: a9 04
    jsr set_object_position_from_cell_xy                              ; 4230: 20 5d 1f
    lda #0                                                            ; 4233: a9 00
    sta l09b7                                                         ; 4235: 8d b7 09
    lda #$d7                                                          ; 4238: a9 d7
    sta l09ac                                                         ; 423a: 8d ac 09
c423d
    lda l0a6d                                                         ; 423d: ad 6d 0a
    clc                                                               ; 4240: 18
    adc l0a6e                                                         ; 4241: 6d 6e 0a
    sta l0a6d                                                         ; 4244: 8d 6d 0a
    cmp #$0c                                                          ; 4247: c9 0c
    beq c4261                                                         ; 4249: f0 16
    cmp #$1b                                                          ; 424b: c9 1b
    beq c4261                                                         ; 424d: f0 12
    lda desired_room_index                                            ; 424f: a5 30
    cmp #0                                                            ; 4251: c9 00
    bne c427e                                                         ; 4253: d0 29
    lda #$40 ; '@'                                                    ; 4255: a9 40
    ldx #$fe                                                          ; 4257: a2 fe
    ldy #$45 ; 'E'                                                    ; 4259: a0 45
    jsr play_sound_yx                                                 ; 425b: 20 f6 38
    jmp c427e                                                         ; 425e: 4c 7e 42

c4261
    lda #0                                                            ; 4261: a9 00
    sta l0a6e                                                         ; 4263: 8d 6e 0a
    lda desired_room_index                                            ; 4266: a5 30
    cmp #0                                                            ; 4268: c9 00
    bne c427e                                                         ; 426a: d0 12
    lda sound_priority_per_channel_table                              ; 426c: ad 6f 39
    cmp #$41 ; 'A'                                                    ; 426f: c9 41
    bcs c427b                                                         ; 4271: b0 08
    lda #0                                                            ; 4273: a9 00
    sta sound_priority_per_channel_table                              ; 4275: 8d 6f 39
    sta l3970                                                         ; 4278: 8d 70 39
c427b
    jsr play_landing_sound                                            ; 427b: 20 a9 23
c427e
    lda desired_room_index                                            ; 427e: a5 30
    cmp #0                                                            ; 4280: c9 00
    bne c42f2                                                         ; 4282: d0 6e
    ldx l0a6d                                                         ; 4284: ae 6d 0a
    ldy #2                                                            ; 4287: a0 02
    lda #3                                                            ; 4289: a9 03
    jsr set_object_position_from_cell_xy                              ; 428b: 20 5d 1f
    iny                                                               ; 428e: c8
    iny                                                               ; 428f: c8
    iny                                                               ; 4290: c8
    lda #1                                                            ; 4291: a9 01
    sta width_in_cells                                                ; 4293: 85 3c
    lda #2                                                            ; 4295: a9 02
    sta height_in_cells                                               ; 4297: 85 3d
    lda #3                                                            ; 4299: a9 03
    sta value_to_write_to_collision_map                               ; 429b: 85 3e
    jsr read_collision_map_value_for_xy                               ; 429d: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 42a0: c5 3e
    beq c42b4                                                         ; 42a2: f0 10
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 42a4: 20 44 1e
    lda #0                                                            ; 42a7: a9 00
    sta value_to_write_to_collision_map                               ; 42a9: 85 3e
    dex                                                               ; 42ab: ca
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 42ac: 20 44 1e
    inx                                                               ; 42af: e8
    inx                                                               ; 42b0: e8
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 42b1: 20 44 1e
c42b4
    lda l0a62                                                         ; 42b4: ad 62 0a
    cmp #3                                                            ; 42b7: c9 03
    bne c42f2                                                         ; 42b9: d0 37
    ldx #$0b                                                          ; 42bb: a2 0b
    ldy #2                                                            ; 42bd: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 42bf: 20 e2 28
    beq c42d6                                                         ; 42c2: f0 12
    lda #0                                                            ; 42c4: a9 00
    sta l09aa                                                         ; 42c6: 8d aa 09
    lda #$ff                                                          ; 42c9: a9 ff
    sta l0a62                                                         ; 42cb: 8d 62 0a
    lda #$c9                                                          ; 42ce: a9 c9
    jsr find_or_create_menu_slot_for_A                                ; 42d0: 20 bd 2b
    jmp c42f2                                                         ; 42d3: 4c f2 42

c42d6
    ldx l0a6d                                                         ; 42d6: ae 6d 0a
    lda #$ff                                                          ; 42d9: a9 ff
    sta temp_sprite_x_offset                                          ; 42db: 85 3a
    ldy #2                                                            ; 42dd: a0 02
    lda #$2d ; '-'                                                    ; 42df: a9 2d
    sta temp_sprite_y_offset                                          ; 42e1: 85 3b
    lda #2                                                            ; 42e3: a9 02
    jsr set_object_position_from_cell_xy                              ; 42e5: 20 5d 1f
    lda #$c8                                                          ; 42e8: a9 c8
    sta l09aa                                                         ; 42ea: 8d aa 09
    lda #$a0                                                          ; 42ed: a9 a0
    sta l38c4                                                         ; 42ef: 8d c4 38
c42f2
    rts                                                               ; 42f2: 60

l42f3
    !byte   8, $80,   0,   8,   0,   0,   0,   0,   8, $f8,   6, $f8  ; 42f3: 08 80 00...
    !byte   6, $fa,   6, $fc,   6, $fe,   6, $ff, $80,   6,   1,   6  ; 42ff: 06 fa 06...
    !byte   2,   6,   4,   6,   6,   4,   8,   2,   8, $80,   0,   8  ; 430b: 02 06 04...
    !byte $80,   0,   0, $80,   4,   2,   3,   3,   2,   4,   1,   6  ; 4317: 80 00 00...
    !byte $80                                                         ; 4323: 80

sub_c4324
    lda update_room_first_update_flag                                 ; 4324: ad 2b 13
    bne c432c                                                         ; 4327: d0 03
    jmp c4384                                                         ; 4329: 4c 84 43

c432c
    lda #$c9                                                          ; 432c: a9 c9
    sta toolbar_collectable_spriteids+1                               ; 432e: 8d e9 2e
    lda #$c8                                                          ; 4331: a9 c8
    sta collectable_spriteids+1                                       ; 4333: 8d ee 2e
    sta five_byte_table_paired_with_collectable_sprite_ids + 1        ; 4336: 8d f3 2e
    lda current_level                                                 ; 4339: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 433b: c5 51
    beq c434f                                                         ; 433d: f0 10
    lda l0a62                                                         ; 433f: ad 62 0a
    bmi c434f                                                         ; 4342: 30 0b
    cmp #6                                                            ; 4344: c9 06
    bcc c434f                                                         ; 4346: 90 07
    cmp #$25 ; '%'                                                    ; 4348: c9 25
    beq c434f                                                         ; 434a: f0 03
    dec l0a6f                                                         ; 434c: ce 6f 0a
c434f
    lda desired_room_index                                            ; 434f: a5 30
    cmp l0a68                                                         ; 4351: cd 68 0a
    bne c437c                                                         ; 4354: d0 26
    lda l0a62                                                         ; 4356: ad 62 0a
    bmi c437c                                                         ; 4359: 30 21
    cmp #6                                                            ; 435b: c9 06
    bcc c437c                                                         ; 435d: 90 1d
    jsr sub_c45be                                                     ; 435f: 20 be 45
loop_c4362
    lda desired_room_index                                            ; 4362: a5 30
    cmp l0a68                                                         ; 4364: cd 68 0a
    bne c437c                                                         ; 4367: d0 13
    lda l0a6f                                                         ; 4369: ad 6f 0a
    beq c437c                                                         ; 436c: f0 0e
    dec l0a6f                                                         ; 436e: ce 6f 0a
    ldx #2                                                            ; 4371: a2 02
    jsr l20f7                                                         ; 4373: 20 f7 20
    jsr sub_c4490                                                     ; 4376: 20 90 44
    jmp loop_c4362                                                    ; 4379: 4c 62 43

c437c
    lda #0                                                            ; 437c: a9 00
    sta l09b5                                                         ; 437e: 8d b5 09
c4381
    jmp c448f                                                         ; 4381: 4c 8f 44

c4384
    lda #0                                                            ; 4384: a9 00
    sta l45ec                                                         ; 4386: 8d ec 45
    lda player_held_object_spriteid                                   ; 4389: a5 52
    sta l45ed                                                         ; 438b: 8d ed 45
    lda l09b5                                                         ; 438e: ad b5 09
    sta l45ee                                                         ; 4391: 8d ee 45
    lda l0a62                                                         ; 4394: ad 62 0a
    bmi c43af                                                         ; 4397: 30 16
    cmp #6                                                            ; 4399: c9 06
    bcc c4381                                                         ; 439b: 90 e4
    lda desired_room_index                                            ; 439d: a5 30
    cmp l0a68                                                         ; 439f: cd 68 0a
    beq c43f8                                                         ; 43a2: f0 54
    lda l0a6f                                                         ; 43a4: ad 6f 0a
    bmi c4381                                                         ; 43a7: 30 d8
    inc l0a6f                                                         ; 43a9: ee 6f 0a
    jmp c448f                                                         ; 43ac: 4c 8f 44

c43af
    lda #$c9                                                          ; 43af: a9 c9
    cmp player_using_object_spriteid                                  ; 43b1: cd b6 2e
    bne c4381                                                         ; 43b4: d0 cb
    cmp previous_player_using_object_spriteid                         ; 43b6: cd b7 2e
    beq c4381                                                         ; 43b9: f0 c6
    dec l45ec                                                         ; 43bb: ce ec 45
    lda desired_room_index                                            ; 43be: a5 30
    sta l0a68                                                         ; 43c0: 8d 68 0a
    lda object_direction                                              ; 43c3: ad be 09
    sta l0a66                                                         ; 43c6: 8d 66 0a
    sta l0a67                                                         ; 43c9: 8d 67 0a
    lda object_x_low+1                                                ; 43cc: ad 51 09
    sta l0a64                                                         ; 43cf: 8d 64 0a
    lda object_x_high+1                                               ; 43d2: ad 67 09
    sta l0a65                                                         ; 43d5: 8d 65 0a
    lda object_y_low+1                                                ; 43d8: ad 7d 09
    sta l0a69                                                         ; 43db: 8d 69 0a
    lda object_y_high+1                                               ; 43de: ad 93 09
    sta l0a6a                                                         ; 43e1: 8d 6a 0a
    lda #6                                                            ; 43e4: a9 06
    sta l0a63                                                         ; 43e6: 8d 63 0a
    sta l0a62                                                         ; 43e9: 8d 62 0a
    jsr sub_c45be                                                     ; 43ec: 20 be 45
    ldx #2                                                            ; 43ef: a2 02
    jsr l20f7                                                         ; 43f1: 20 f7 20
    lda #0                                                            ; 43f4: a9 00
    sta player_held_object_spriteid                                   ; 43f6: 85 52
c43f8
    jsr sub_c4490                                                     ; 43f8: 20 90 44
    lda desired_room_index                                            ; 43fb: a5 30
    cmp l0a68                                                         ; 43fd: cd 68 0a
    beq c4407                                                         ; 4400: f0 05
    lda #0                                                            ; 4402: a9 00
    sta l0a6f                                                         ; 4404: 8d 6f 0a
c4407
    lda l45ee                                                         ; 4407: ad ee 45
    sta l09b5                                                         ; 440a: 8d b5 09
    ldy #$0d                                                          ; 440d: a0 0d
    lda l45ec                                                         ; 440f: ad ec 45
    ldy #2                                                            ; 4412: a0 02
    ldx #$0b                                                          ; 4414: a2 0b
    jsr test_for_collision_between_objects_x_and_y                    ; 4416: 20 e2 28
    ldx l45ed                                                         ; 4419: ae ed 45
    stx player_held_object_spriteid                                   ; 441c: 86 52
    ora #0                                                            ; 441e: 09 00
    beq c4439                                                         ; 4420: f0 17
    lda l45ec                                                         ; 4422: ad ec 45
    bne c442c                                                         ; 4425: d0 05
    lda #$c9                                                          ; 4427: a9 c9
    jsr find_or_create_menu_slot_for_A                                ; 4429: 20 bd 2b
c442c
    lda #0                                                            ; 442c: a9 00
    sta l09aa                                                         ; 442e: 8d aa 09
    lda #$ff                                                          ; 4431: a9 ff
    sta l0a62                                                         ; 4433: 8d 62 0a
    jmp c448f                                                         ; 4436: 4c 8f 44

c4439
    lda l45ec                                                         ; 4439: ad ec 45
    beq c444d                                                         ; 443c: f0 0f
    lda #$c9                                                          ; 443e: a9 c9
    jsr remove_item_from_toolbar_menu                                 ; 4440: 20 e0 2b
    lda #0                                                            ; 4443: a9 00
    sta object_spriteid+1                                             ; 4445: 8d a9 09
    sta player_using_object_spriteid                                  ; 4448: 8d b6 2e
    sta player_held_object_spriteid                                   ; 444b: 85 52
c444d
    lda l0952                                                         ; 444d: ad 52 09
    cmp l095d                                                         ; 4450: cd 5d 09
    beq c4475                                                         ; 4453: f0 20
    lda l0a67                                                         ; 4455: ad 67 0a
    bmi c4460                                                         ; 4458: 30 06
    inc temp_right_offset                                             ; 445a: ee d1 24
    jmp c4463                                                         ; 445d: 4c 63 44

c4460
    dec temp_left_offset                                              ; 4460: ce d0 24
c4463
    lda #1                                                            ; 4463: a9 01
    sta temp_bottom_offset                                            ; 4465: 8d 51 25
    lda #2                                                            ; 4468: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 446a: 20 94 28
    beq c4475                                                         ; 446d: f0 06
    jsr sub_c3faf                                                     ; 446f: 20 af 3f
    jmp c448f                                                         ; 4472: 4c 8f 44

c4475
    lda l097e                                                         ; 4475: ad 7e 09
    cmp l0989                                                         ; 4478: cd 89 09
    beq c448f                                                         ; 447b: f0 12
    dec temp_top_offset                                               ; 447d: ce 50 25
    lda #2                                                            ; 4480: a9 02
    sta temp_bottom_offset                                            ; 4482: 8d 51 25
    lda #2                                                            ; 4485: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4487: 20 94 28
    beq c448f                                                         ; 448a: f0 03
    jsr sub_c3faf                                                     ; 448c: 20 af 3f
c448f
    rts                                                               ; 448f: 60

sub_c4490
    lda l0a63                                                         ; 4490: ad 63 0a
    clc                                                               ; 4493: 18
    adc #2                                                            ; 4494: 69 02
    tay                                                               ; 4496: a8
    lda l42f3,y                                                       ; 4497: b9 f3 42
    cmp #$80                                                          ; 449a: c9 80
    bne c44a1                                                         ; 449c: d0 03
    ldy l0a62                                                         ; 449e: ac 62 0a
c44a1
    lda l0a67                                                         ; 44a1: ad 67 0a
    bmi c44ac                                                         ; 44a4: 30 06
    inc temp_right_offset                                             ; 44a6: ee d1 24
    jmp c44af                                                         ; 44a9: 4c af 44

c44ac
    dec temp_left_offset                                              ; 44ac: ce d0 24
c44af
    lda #1                                                            ; 44af: a9 01
    sta temp_bottom_offset                                            ; 44b1: 8d 51 25
    lda #2                                                            ; 44b4: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 44b6: 20 94 28
    beq c44c3                                                         ; 44b9: f0 08
    lda l0a67                                                         ; 44bb: ad 67 0a
    eor #$fe                                                          ; 44be: 49 fe
    sta l0a67                                                         ; 44c0: 8d 67 0a
c44c3
    lda l0a62                                                         ; 44c3: ad 62 0a
    cmp #6                                                            ; 44c6: c9 06
    bne c44e0                                                         ; 44c8: d0 16
    dec temp_top_offset                                               ; 44ca: ce 50 25
    lda #2                                                            ; 44cd: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 44cf: 20 94 28
    bne c44d9                                                         ; 44d2: d0 05
    cpy l0a62                                                         ; 44d4: cc 62 0a
    bne c4510                                                         ; 44d7: d0 37
c44d9
    lda #$22 ; '"'                                                    ; 44d9: a9 22
    sta l0a62                                                         ; 44db: 8d 62 0a
    ldy #$15                                                          ; 44de: a0 15
c44e0
    lda #2                                                            ; 44e0: a9 02
    jsr l2770                                                         ; 44e2: 20 70 27
    lda l0a62                                                         ; 44e5: ad 62 0a
    cmp #$22 ; '"'                                                    ; 44e8: c9 22
    bne c44f6                                                         ; 44ea: d0 0a
    lda l288f                                                         ; 44ec: ad 8f 28
    beq c4510                                                         ; 44ef: f0 1f
    ldy #$25 ; '%'                                                    ; 44f1: a0 25
    sty l0a62                                                         ; 44f3: 8c 62 0a
c44f6
    lda l2890                                                         ; 44f6: ad 90 28
    beq c4510                                                         ; 44f9: f0 15
    ldy #$22 ; '"'                                                    ; 44fb: a0 22
    sty l0a62                                                         ; 44fd: 8c 62 0a
    ldy #$28 ; '('                                                    ; 4500: a0 28
    ldx #1                                                            ; 4502: a2 01
    stx l0a67                                                         ; 4504: 8e 67 0a
    ora #0                                                            ; 4507: 09 00
    bpl c4510                                                         ; 4509: 10 05
    ldx #$ff                                                          ; 450b: a2 ff
    stx l0a67                                                         ; 450d: 8e 67 0a
c4510
    sty l0a63                                                         ; 4510: 8c 63 0a
    lda l0a62                                                         ; 4513: ad 62 0a
    cmp #$25 ; '%'                                                    ; 4516: c9 25
    bne c451f                                                         ; 4518: d0 05
    lda #0                                                            ; 451a: a9 00
    sta l0a6f                                                         ; 451c: 8d 6f 0a
c451f
    lda l42f3,y                                                       ; 451f: b9 f3 42
    ldx l0a67                                                         ; 4522: ae 67 0a
    bpl c452c                                                         ; 4525: 10 05
    eor #$ff                                                          ; 4527: 49 ff
    clc                                                               ; 4529: 18
    adc #1                                                            ; 452a: 69 01
c452c
    ldx #0                                                            ; 452c: a2 00
    ora #0                                                            ; 452e: 09 00
    bpl c4533                                                         ; 4530: 10 01
    dex                                                               ; 4532: ca
c4533
    clc                                                               ; 4533: 18
    adc l0a64                                                         ; 4534: 6d 64 0a
    sta l0a64                                                         ; 4537: 8d 64 0a
    txa                                                               ; 453a: 8a
    adc l0a65                                                         ; 453b: 6d 65 0a
    sta l0a65                                                         ; 453e: 8d 65 0a
    iny                                                               ; 4541: c8
    lda l42f3,y                                                       ; 4542: b9 f3 42
    ldx #0                                                            ; 4545: a2 00
    ora #0                                                            ; 4547: 09 00
    bpl c454c                                                         ; 4549: 10 01
    dex                                                               ; 454b: ca
c454c
    clc                                                               ; 454c: 18
    adc l0a69                                                         ; 454d: 6d 69 0a
    sta l0a69                                                         ; 4550: 8d 69 0a
    txa                                                               ; 4553: 8a
    adc l0a6a                                                         ; 4554: 6d 6a 0a
    sta l0a6a                                                         ; 4557: 8d 6a 0a
    jsr sub_c45be                                                     ; 455a: 20 be 45
    lda #2                                                            ; 455d: a9 02
    jsr l25f5                                                         ; 455f: 20 f5 25
    lda l0952                                                         ; 4562: ad 52 09
    sta l0a64                                                         ; 4565: 8d 64 0a
    lda l0968                                                         ; 4568: ad 68 09
    sta l0a65                                                         ; 456b: 8d 65 0a
    lda l097e                                                         ; 456e: ad 7e 09
    sta l0a69                                                         ; 4571: 8d 69 0a
    lda l0994                                                         ; 4574: ad 94 09
    sta l0a6a                                                         ; 4577: 8d 6a 0a
    ldx #2                                                            ; 457a: a2 02
    jsr l2434                                                         ; 457c: 20 34 24
    jsr l24d2                                                         ; 457f: 20 d2 24
    lda l0a67                                                         ; 4582: ad 67 0a
    bmi c45a3                                                         ; 4585: 30 1c
    lda l0078                                                         ; 4587: a5 78
    cmp #$28 ; '('                                                    ; 4589: c9 28
    bcc c45bd                                                         ; 458b: 90 30
    lda l0a64                                                         ; 458d: ad 64 0a
    sec                                                               ; 4590: 38
    sbc #$40 ; '@'                                                    ; 4591: e9 40
    sta l0a64                                                         ; 4593: 8d 64 0a
    lda #0                                                            ; 4596: a9 00
    sbc #0                                                            ; 4598: e9 00
    sta l0a65                                                         ; 459a: 8d 65 0a
    inc l0a68                                                         ; 459d: ee 68 0a
    jmp c45b8                                                         ; 45a0: 4c b8 45

c45a3
    lda l0079                                                         ; 45a3: a5 79
    bpl c45bd                                                         ; 45a5: 10 16
    lda l0a64                                                         ; 45a7: ad 64 0a
    clc                                                               ; 45aa: 18
    adc #$40 ; '@'                                                    ; 45ab: 69 40
    sta l0a64                                                         ; 45ad: 8d 64 0a
    lda #1                                                            ; 45b0: a9 01
    sta l0a65                                                         ; 45b2: 8d 65 0a
    dec l0a68                                                         ; 45b5: ce 68 0a
c45b8
    lda #0                                                            ; 45b8: a9 00
    sta l09aa                                                         ; 45ba: 8d aa 09
c45bd
    rts                                                               ; 45bd: 60

sub_c45be
    lda #$ca                                                          ; 45be: a9 ca
    sta l38ae                                                         ; 45c0: 8d ae 38
    lda #$a0                                                          ; 45c3: a9 a0
    sta l38c4                                                         ; 45c5: 8d c4 38
    lda l0a64                                                         ; 45c8: ad 64 0a
    sta l0952                                                         ; 45cb: 8d 52 09
    lda l0a65                                                         ; 45ce: ad 65 0a
    sta l0968                                                         ; 45d1: 8d 68 09
    lda l0a69                                                         ; 45d4: ad 69 0a
    sta l097e                                                         ; 45d7: 8d 7e 09
    lda l0a6a                                                         ; 45da: ad 6a 0a
    sta l0994                                                         ; 45dd: 8d 94 09
    lda #$c8                                                          ; 45e0: a9 c8
    sta l09aa                                                         ; 45e2: 8d aa 09
    lda l0a66                                                         ; 45e5: ad 66 0a
    sta l09c0                                                         ; 45e8: 8d c0 09
    rts                                                               ; 45eb: 60

l45ec
    !byte 0                                                           ; 45ec: 00
l45ed
    !byte 0                                                           ; 45ed: 00
l45ee
    !byte   0, $60,   5,   1,   0,   0,   0,   0,   0,   0, $0a,   0  ; 45ee: 00 60 05...
    !byte   0, $d8, $28,   0, $10,   0,   5,   0,   4,   0,   4,   0  ; 45fa: 00 d8 28...
    !byte   6,   1, $ff,   0,   0,   1,   1,   0, $6e, $fc,   0, $f8  ; 4606: 06 01 ff...
    !byte $6e,   0, $13,   0,   6,   0, $c9,   0,   1,   0, $30, $18  ; 4612: 6e 00 13...
    !byte $8c, $c6, $63, $31, $18, $0c, $0c, $18, $31, $63, $c6, $8c  ; 461e: 8c c6 63...
    !byte $18, $30, $0c, $18, $31, $63, $c6, $8c, $18, $30, $30, $18  ; 462a: 18 30 0c...
    !byte $8c, $c6, $63, $31, $18, $0c                                ; 4636: 8c c6 63...
sprite_data
pydis_end

; Automatically generated labels:
;     c3b04
;     c3b0e
;     c3bb6
;     c3c33
;     c3c36
;     c3c60
;     c3c77
;     c3c7b
;     c3c7d
;     c3c86
;     c3c9d
;     c3cae
;     c3d27
;     c3d3c
;     c3d68
;     c3d72
;     c3dd4
;     c3dec
;     c3df1
;     c3e04
;     c3e36
;     c3e53
;     c3e75
;     c3e77
;     c3e7b
;     c3e7d
;     c3ea9
;     c3eaa
;     c3ec5
;     c3ecd
;     c3eee
;     c3f00
;     c3f03
;     c3f28
;     c3f4a
;     c3f58
;     c3f74
;     c3f8b
;     c3f91
;     c3fae
;     c40f2
;     c4106
;     c4109
;     c4113
;     c412d
;     c4138
;     c413f
;     c416f
;     c4174
;     c41a4
;     c41c0
;     c41c4
;     c41c6
;     c41ce
;     c41f8
;     c41fb
;     c421e
;     c4223
;     c423d
;     c4261
;     c427b
;     c427e
;     c42b4
;     c42d6
;     c42f2
;     c432c
;     c434f
;     c437c
;     c4381
;     c4384
;     c43af
;     c43f8
;     c4407
;     c442c
;     c4439
;     c444d
;     c4460
;     c4463
;     c4475
;     c448f
;     c44a1
;     c44ac
;     c44af
;     c44c3
;     c44d9
;     c44e0
;     c44f6
;     c4510
;     c451f
;     c452c
;     c4533
;     c454c
;     c45a3
;     c45b8
;     c45bd
;     l0015
;     l0048
;     l0078
;     l0079
;     l0952
;     l095d
;     l0968
;     l097e
;     l097f
;     l0980
;     l0981
;     l0982
;     l0989
;     l0994
;     l09aa
;     l09ab
;     l09ac
;     l09ad
;     l09ae
;     l09af
;     l09b5
;     l09b7
;     l09b9
;     l09c0
;     l09df
;     l0a62
;     l0a63
;     l0a64
;     l0a65
;     l0a66
;     l0a67
;     l0a68
;     l0a69
;     l0a6a
;     l0a6b
;     l0a6c
;     l0a6d
;     l0a6e
;     l0a6f
;     l0a70
;     l0a71
;     l20f7
;     l2434
;     l24d2
;     l25f5
;     l2770
;     l288f
;     l2890
;     l38ae
;     l38c4
;     l38c6
;     l38c8
;     l38c9
;     l3970
;     l3f5e
;     l40d9
;     l42f3
;     l45ec
;     l45ed
;     l45ee
;     loop_c3dae
;     loop_c3de1
;     loop_c41e1
;     loop_c4362
;     sub_c3b2a
;     sub_c3bc3
;     sub_c3d34
;     sub_c3dd7
;     sub_c3e56
;     sub_c3e89
;     sub_c3f4b
;     sub_c3f5f
;     sub_c3faf
;     sub_c404a
;     sub_c40e2
;     sub_c41a5
;     sub_c4324
;     sub_c4490
;     sub_c45be
!if (exit_room_left) != $01 {
    !error "Assertion failed: exit_room_left == $01"
}
!if (exit_room_right) != $04 {
    !error "Assertion failed: exit_room_right == $04"
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
!if (sprite_data - level_data) != $0b67 {
    !error "Assertion failed: sprite_data - level_data == $0b67"
}
