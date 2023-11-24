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
l0078                                               = $78
l0079                                               = $79
l007a                                               = $7a
show_dialog_box                                     = $040a
remove_dialog                                       = $0453
object_x_low                                        = $0950
l0952                                               = $0952
l0954                                               = $0954
l0955                                               = $0955
object_x_low_old                                    = $095b
l095d                                               = $095d
object_x_high                                       = $0966
l0968                                               = $0968
l096a                                               = $096a
object_x_high_old                                   = $0971
object_y_low                                        = $097c
l097e                                               = $097e
l0980                                               = $0980
l0981                                               = $0981
l0982                                               = $0982
l0983                                               = $0983
object_y_low_old                                    = $0987
l0989                                               = $0989
l098d                                               = $098d
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
l09b0                                               = $09b0
object_spriteid_old                                 = $09b3
l09b5                                               = $09b5
l09b9                                               = $09b9
object_direction                                    = $09be
l09c0                                               = $09c0
l09c1                                               = $09c1
l09c2                                               = $09c2
object_direction_old                                = $09c9
level_progress_table                                = $09ef
l0a24                                               = $0a24
l0a25                                               = $0a25
l0a26                                               = $0a26
l0a27                                               = $0a27
l0a28                                               = $0a28
l0a29                                               = $0a29
l0a2a                                               = $0a2a
l0a2b                                               = $0a2b
l0a2c                                               = $0a2c
l0a2d                                               = $0a2d
l0a2e                                               = $0a2e
l0a2f                                               = $0a2f
l0a6f                                               = $0a6f
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
l2ef4                                               = $2ef4
inhibit_monkey_climb_flag                           = $31d7
print_encrypted_string_at_yx_centred                = $37f3
wait_one_second_then_check_keys                     = $388d
object_sprite_mask_type                             = $38ac
l38ae                                               = $38ae
l38af                                               = $38af
l38b0                                               = $38b0
l38b1                                               = $38b1
l38b4                                               = $38b4
object_z_order                                      = $38c2
l38c4                                               = $38c4
l38c6                                               = $38c6
l38c7                                               = $38c7
l38c8                                               = $38c8
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
    !word sprite_data - level_data                                    ; 3ad5: c7 0b                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f1 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 3a 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
    !byte 1, 1                                                        ; 3add: 01 01
level_room_data_table
    !word room_0_data                                                 ; 3adf: d6 40                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: 49 3b
    !word room_2_data                                                 ; 3ae3: f4 3b
    !word room_3_data                                                 ; 3ae5: aa 3e

; *************************************************************************************
; 'SEE-SWORD[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $98, $8e, $8e, $e6, $98, $9c, $84, $99, $8f, $c6            ; 3ae7: 98 8e 8e...

; *************************************************************************************
; 
; Level initialisation
; 
; This is called whenever a new room is entered.
; 
; *************************************************************************************
level_specific_initialisation
    lda current_level                                                 ; 3af1: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3af3: c5 51
    beq c3b31                                                         ; 3af5: f0 3a
    lda developer_flags                                               ; 3af7: ad 03 11
    bpl c3b06                                                         ; 3afa: 10 0a
    lda #$ff                                                          ; 3afc: a9 ff
    sta l0a24                                                         ; 3afe: 8d 24 0a
    lda #$d1                                                          ; 3b01: a9 d1
    jsr find_or_create_menu_slot_for_A                                ; 3b03: 20 bd 2b
c3b06
    lda l0a24                                                         ; 3b06: ad 24 0a
    bpl c3b10                                                         ; 3b09: 10 05
    lda #$ca                                                          ; 3b0b: a9 ca
    jsr find_or_create_menu_slot_for_A                                ; 3b0d: 20 bd 2b
c3b10
    lda l0a25                                                         ; 3b10: ad 25 0a
    bpl c3b1a                                                         ; 3b13: 10 05
    lda #$d1                                                          ; 3b15: a9 d1
    jsr find_or_create_menu_slot_for_A                                ; 3b17: 20 bd 2b
c3b1a
    lda desired_room_index                                            ; 3b1a: a5 30
    cmp #3                                                            ; 3b1c: c9 03
    bne c3b31                                                         ; 3b1e: d0 11
    lda #1                                                            ; 3b20: a9 01
    sta desired_room_index                                            ; 3b22: 85 30
    ldx #$14                                                          ; 3b24: a2 14
    ldy #7                                                            ; 3b26: a0 07
    lda #0                                                            ; 3b28: a9 00
    sta temp_sprite_y_offset                                          ; 3b2a: 85 3b
    lda #0                                                            ; 3b2c: a9 00
    jsr set_object_position_from_cell_xy                              ; 3b2e: 20 5d 1f
c3b31
    lda #$7c ; '|'                                                    ; 3b31: a9 7c
    sta source_sprite_memory_low                                      ; 3b33: 85 40
    lda #$46 ; 'F'                                                    ; 3b35: a9 46
    sta source_sprite_memory_high                                     ; 3b37: 85 41
    rts                                                               ; 3b39: 60

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
    jsr sub_c4337                                                     ; 3b3a: 20 37 43
    jsr sub_c3fa4                                                     ; 3b3d: 20 a4 3f
    jsr sub_c41a4                                                     ; 3b40: 20 a4 41
    jsr sub_c3c67                                                     ; 3b43: 20 67 3c
    jmp c3bdf                                                         ; 3b46: 4c df 3b

; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 20                                                          ; 3b49: 14                      ; initial player X cell
    !byte 21                                                          ; 3b4a: 15                      ; initial player Y cell

; #####   |                      |   #####
; #####   |                      |   #####
;         |                      |
;         |                      |
;         |                      |
;         |                      |
;         |                      |
; #####   |   ################   |   #####
; #####   |   ################   |   #####
; ###     |                      |     ###
; ###     |                      |     ###
; ###     |                      |     ###
; ###     |                      |     ###
; ###     |                      |     ###
; ###     |                      |     ###
; ###     |                      |     ###
; ###     |                      |     ###
;         |                      |
;         |                      |
; 
;                     P
;        ##########################
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 5x2 rectangle at (0,0)
room_1_code
    ldx #0                                                            ; 3b4b: a2 00
    ldy #0                                                            ; 3b4d: a0 00
    lda #5                                                            ; 3b4f: a9 05
    sta width_in_cells                                                ; 3b51: 85 3c
    lda #2                                                            ; 3b53: a9 02
    sta height_in_cells                                               ; 3b55: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b57: 20 bb 1a
; draw 5x2 rectangle at (35,0)
    ldx #$23 ; '#'                                                    ; 3b5a: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 3b5c: 20 bb 1a
; draw 5x2 rectangle at (0,7)
    ldx #0                                                            ; 3b5f: a2 00
    ldy #7                                                            ; 3b61: a0 07
    jsr copy_rectangle_of_memory_to_screen                            ; 3b63: 20 bb 1a
; draw 5x2 rectangle at (35,7)
    ldx #$23 ; '#'                                                    ; 3b66: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 3b68: 20 bb 1a
; draw 16x2 rectangle at (12,7)
    ldx #$0c                                                          ; 3b6b: a2 0c
    lda #$10                                                          ; 3b6d: a9 10
    sta width_in_cells                                                ; 3b6f: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b71: 20 bb 1a
; draw 3x8 rectangle at (0,9)
    ldx #0                                                            ; 3b74: a2 00
    ldy #9                                                            ; 3b76: a0 09
    lda #3                                                            ; 3b78: a9 03
    sta width_in_cells                                                ; 3b7a: 85 3c
    lda #8                                                            ; 3b7c: a9 08
    sta height_in_cells                                               ; 3b7e: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b80: 20 bb 1a
; draw 3x8 rectangle at (37,9)
    ldx #$25 ; '%'                                                    ; 3b83: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 3b85: 20 bb 1a
; draw 255x8 rectangle at (0,22)
    ldx #0                                                            ; 3b88: a2 00
    ldy #$16                                                          ; 3b8a: a0 16
    lda #$ff                                                          ; 3b8c: a9 ff
    sta width_in_cells                                                ; 3b8e: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b90: 20 bb 1a
; draw 26x1 rectangle at (7,21)
    ldx #7                                                            ; 3b93: a2 07
    dey                                                               ; 3b95: 88
    lda #$1a                                                          ; 3b96: a9 1a
    sta width_in_cells                                                ; 3b98: 85 3c
    lda #1                                                            ; 3b9a: a9 01
    sta height_in_cells                                               ; 3b9c: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b9e: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3ba1: 20 90 1b
; draw rope at (8,0) length 19
    ldx #8                                                            ; 3ba4: a2 08
    ldy #0                                                            ; 3ba6: a0 00
    lda #$13                                                          ; 3ba8: a9 13
    jsr draw_rope                                                     ; 3baa: 20 b9 1d
; draw rope at (31,0) length 19
    ldx #$1f                                                          ; 3bad: a2 1f
    jsr draw_rope                                                     ; 3baf: 20 b9 1d
    jsr start_room                                                    ; 3bb2: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 3bb5: 20 da 12
    sta l0070                                                         ; 3bb8: 85 70
    and #exit_room_top                                                ; 3bba: 29 08
    beq c3bc5                                                         ; 3bbc: f0 07
    ldx #3                                                            ; 3bbe: a2 03
    ldy current_level                                                 ; 3bc0: a4 31
    jmp initialise_level_and_room                                     ; 3bc2: 4c 40 11

c3bc5
    lda l0070                                                         ; 3bc5: a5 70
    and #1                                                            ; 3bc7: 29 01
    beq c3bd2                                                         ; 3bc9: f0 07
    ldx #0                                                            ; 3bcb: a2 00
    ldy current_level                                                 ; 3bcd: a4 31
    jmp initialise_level_and_room                                     ; 3bcf: 4c 40 11

c3bd2
    lda l0070                                                         ; 3bd2: a5 70
    and #4                                                            ; 3bd4: 29 04
    beq room_1_game_update_loop                                       ; 3bd6: f0 dd
    ldx #2                                                            ; 3bd8: a2 02
    ldy current_level                                                 ; 3bda: a4 31
    jmp initialise_level_and_room                                     ; 3bdc: 4c 40 11

c3bdf
    lda #1                                                            ; 3bdf: a9 01
    sta currently_updating_logic_for_room_index                       ; 3be1: 8d ba 1a
    ldx #3                                                            ; 3be4: a2 03
    ldy #$0c                                                          ; 3be6: a0 0c
    lda #3                                                            ; 3be8: a9 03
    jsr update_brazier_and_fire                                       ; 3bea: 20 88 19
    ldx #$25 ; '%'                                                    ; 3bed: a2 25
    lda #4                                                            ; 3bef: a9 04
    jmp update_brazier_and_fire                                       ; 3bf1: 4c 88 19

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 16                                                          ; 3bf4: 10                      ; initial player X cell
    !byte 21                                                          ; 3bf5: 15                      ; initial player Y cell

; ########################################
; ########################################
;                                    #####
;                                     ####
;                                      ###
;                                      ###
;                                      ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
;                    ###               ###
;                    ###               ###
;                    ###               ###
;                 P  ###               ###
;        ###############               ###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_2_code
    jsr sub_c40c2                                                     ; 3bf6: 20 c2 40
; draw 255x1 rectangle at (35,2)
    ldx #$23 ; '#'                                                    ; 3bf9: a2 23
    ldy #2                                                            ; 3bfb: a0 02
    dec height_in_cells                                               ; 3bfd: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3bff: 20 bb 1a
; draw 255x1 rectangle at (36,3)
    inx                                                               ; 3c02: e8
    iny                                                               ; 3c03: c8
    jsr copy_rectangle_of_memory_to_screen                            ; 3c04: 20 bb 1a
; draw 255x18 rectangle at (37,4)
    inx                                                               ; 3c07: e8
    iny                                                               ; 3c08: c8
    lda #$12                                                          ; 3c09: a9 12
    sta height_in_cells                                               ; 3c0b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c0d: 20 bb 1a
; draw 3x10 rectangle at (0,7)
    ldx #0                                                            ; 3c10: a2 00
    ldy #7                                                            ; 3c12: a0 07
    lda #3                                                            ; 3c14: a9 03
    sta width_in_cells                                                ; 3c16: 85 3c
    lda #$0a                                                          ; 3c18: a9 0a
    sta height_in_cells                                               ; 3c1a: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c1c: 20 bb 1a
; draw 3x5 rectangle at (19,17)
    ldx #$13                                                          ; 3c1f: a2 13
    ldy #$11                                                          ; 3c21: a0 11
    lda #3                                                            ; 3c23: a9 03
    sta width_in_cells                                                ; 3c25: 85 3c
    lda #5                                                            ; 3c27: a9 05
    sta height_in_cells                                               ; 3c29: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c2b: 20 bb 1a
; draw 12x1 rectangle at (7,21)
    ldx #7                                                            ; 3c2e: a2 07
    ldy #$15                                                          ; 3c30: a0 15
    lda #$0c                                                          ; 3c32: a9 0c
    sta width_in_cells                                                ; 3c34: 85 3c
    lda #1                                                            ; 3c36: a9 01
    sta height_in_cells                                               ; 3c38: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c3a: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3c3d: 20 90 1b
    jsr start_room                                                    ; 3c40: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 3c43: 20 da 12
    and #exit_room_left                                               ; 3c46: 29 01
    beq room_2_game_update_loop                                       ; 3c48: f0 f9
    ldx #1                                                            ; 3c4a: a2 01
    ldy current_level                                                 ; 3c4c: a4 31
    jmp initialise_level_and_room                                     ; 3c4e: 4c 40 11

l3c51
    !byte $92, $88, $80                                               ; 3c51: 92 88 80
    !text "yrlhdba``acfjpx"                                           ; 3c54: 79 72 6c...
    !byte $82, $8b, $98, $a8                                          ; 3c63: 82 8b 98...

sub_c3c67
    lda #2                                                            ; 3c67: a9 02
    sta currently_updating_logic_for_room_index                       ; 3c69: 8d ba 1a
    ldx #$1f                                                          ; 3c6c: a2 1f
    ldy #$15                                                          ; 3c6e: a0 15
    lda #3                                                            ; 3c70: a9 03
    sta temp_sprite_y_offset                                          ; 3c72: 85 3b
    lda #4                                                            ; 3c74: a9 04
    jsr update_level_completion                                       ; 3c76: 20 10 1a
    lda update_room_first_update_flag                                 ; 3c79: ad 2b 13
    bne c3c81                                                         ; 3c7c: d0 03
    jmp c3d5a                                                         ; 3c7e: 4c 5a 3d

c3c81
    lda current_level                                                 ; 3c81: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3c83: c5 51
    beq c3c91                                                         ; 3c85: f0 0a
    lda l0a26                                                         ; 3c87: ad 26 0a
    beq c3c91                                                         ; 3c8a: f0 05
    lda #$1f                                                          ; 3c8c: a9 1f
    sta l0a26                                                         ; 3c8e: 8d 26 0a
c3c91
    lda desired_room_index                                            ; 3c91: a5 30
    cmp #2                                                            ; 3c93: c9 02
    beq c3c9a                                                         ; 3c95: f0 03
    jmp c3d57                                                         ; 3c97: 4c 57 3d

c3c9a
    ldx #$48 ; 'H'                                                    ; 3c9a: a2 48
    ldy #$46 ; 'F'                                                    ; 3c9c: a0 46
    jsr define_envelope                                               ; 3c9e: 20 5e 39
    ldx #$5e ; '^'                                                    ; 3ca1: a2 5e
    ldy #$46 ; 'F'                                                    ; 3ca3: a0 46
    jsr define_envelope                                               ; 3ca5: 20 5e 39
    lda #$40 ; '@'                                                    ; 3ca8: a9 40
    sta l38c6                                                         ; 3caa: 8d c6 38
    lda #$cd                                                          ; 3cad: a9 cd
    sta l38af                                                         ; 3caf: 8d af 38
    ldx #$1d                                                          ; 3cb2: a2 1d
    lda #4                                                            ; 3cb4: a9 04
    sta temp_sprite_x_offset                                          ; 3cb6: 85 3a
    ldy #$16                                                          ; 3cb8: a0 16
    lda #3                                                            ; 3cba: a9 03
    jsr set_object_position_from_cell_xy                              ; 3cbc: 20 5d 1f
    lda #$ce                                                          ; 3cbf: a9 ce
    sta l09ab                                                         ; 3cc1: 8d ab 09
    lda #1                                                            ; 3cc4: a9 01
    sta width_in_cells                                                ; 3cc6: 85 3c
    sta height_in_cells                                               ; 3cc8: 85 3d
    lda #3                                                            ; 3cca: a9 03
    sta value_to_write_to_collision_map                               ; 3ccc: 85 3e
    ldx #$0d                                                          ; 3cce: a2 0d
    ldy #2                                                            ; 3cd0: a0 02
    lda #$d6                                                          ; 3cd2: a9 d6
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3cd4: 20 57 1f
    ldx #$1b                                                          ; 3cd7: a2 1b
    lda #$d7                                                          ; 3cd9: a9 d7
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3cdb: 20 57 1f
    dex                                                               ; 3cde: ca
    dex                                                               ; 3cdf: ca
    lda #$d8                                                          ; 3ce0: a9 d8
loop_c3ce2
    jsr draw_sprite_a_at_cell_xy                                      ; 3ce2: 20 4c 1f
    dex                                                               ; 3ce5: ca
    cpx #$0f                                                          ; 3ce6: e0 0f
    bcs loop_c3ce2                                                    ; 3ce8: b0 f8
    lda l0a26                                                         ; 3cea: ad 26 0a
    cmp #$0a                                                          ; 3ced: c9 0a
    bcc c3cf3                                                         ; 3cef: 90 02
    lda #$0a                                                          ; 3cf1: a9 0a
c3cf3
    sta l3ea9                                                         ; 3cf3: 8d a9 3e
    ldx #$0d                                                          ; 3cf6: a2 0d
    lda #$12                                                          ; 3cf8: a9 12
    sec                                                               ; 3cfa: 38
    sbc l3ea9                                                         ; 3cfb: ed a9 3e
    tay                                                               ; 3cfe: a8
    lda #2                                                            ; 3cff: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3d01: 20 bb 1e
    dey                                                               ; 3d04: 88
loop_c3d05
    lda #$d9                                                          ; 3d05: a9 d9
    jsr draw_sprite_a_at_cell_xy                                      ; 3d07: 20 4c 1f
    lda #2                                                            ; 3d0a: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3d0c: 20 bb 1e
    dey                                                               ; 3d0f: 88
    cpy #3                                                            ; 3d10: c0 03
    bcs loop_c3d05                                                    ; 3d12: b0 f1
    lda #7                                                            ; 3d14: a9 07
    jsr set_object_position_from_cell_xy                              ; 3d16: 20 5d 1f
    lda #8                                                            ; 3d19: a9 08
    ldy #$15                                                          ; 3d1b: a0 15
    jsr set_object_position_from_cell_xy                              ; 3d1d: 20 5d 1f
    lda #$cc                                                          ; 3d20: a9 cc
    sta l38b4                                                         ; 3d22: 8d b4 38
    ldx #$1b                                                          ; 3d25: a2 1b
    lda #7                                                            ; 3d27: a9 07
    clc                                                               ; 3d29: 18
    adc l3ea9                                                         ; 3d2a: 6d a9 3e
    tay                                                               ; 3d2d: a8
    lda #$d9                                                          ; 3d2e: a9 d9
loop_c3d30
    jsr draw_sprite_a_at_cell_xy                                      ; 3d30: 20 4c 1f
    dey                                                               ; 3d33: 88
    cpy #3                                                            ; 3d34: c0 03
    bcs loop_c3d30                                                    ; 3d36: b0 f8
    lda #$de                                                          ; 3d38: a9 de
    sta l09ae                                                         ; 3d3a: 8d ae 09
    lda #6                                                            ; 3d3d: a9 06
    jsr set_object_position_from_cell_xy                              ; 3d3f: 20 5d 1f
    lda #$c0                                                          ; 3d42: a9 c0
    sta l38c8                                                         ; 3d44: 8d c8 38
    lda #$dd                                                          ; 3d47: a9 dd
    sta l09ad                                                         ; 3d49: 8d ad 09
    lda #5                                                            ; 3d4c: a9 05
    dex                                                               ; 3d4e: ca
    jsr set_object_position_from_cell_xy                              ; 3d4f: 20 5d 1f
    lda #$e0                                                          ; 3d52: a9 e0
    sta l38c7                                                         ; 3d54: 8d c7 38
c3d57
    jmp c3df5                                                         ; 3d57: 4c f5 3d

c3d5a
    lda l0a26                                                         ; 3d5a: ad 26 0a
    beq c3d69                                                         ; 3d5d: f0 0a
    cmp #$1f                                                          ; 3d5f: c9 1f
    beq c3d57                                                         ; 3d61: f0 f4
    inc l0a26                                                         ; 3d63: ee 26 0a
    jmp c3db1                                                         ; 3d66: 4c b1 3d

c3d69
    lda desired_room_index                                            ; 3d69: a5 30
    cmp #2                                                            ; 3d6b: c9 02
    bne c3d57                                                         ; 3d6d: d0 e8
    lda player_using_object_spriteid                                  ; 3d6f: ad b6 2e
    cmp #$d1                                                          ; 3d72: c9 d1
    bne c3d57                                                         ; 3d74: d0 e1
    lda object_direction+1                                            ; 3d76: ad bf 09
    bmi c3d88                                                         ; 3d79: 30 0d
    lda #1                                                            ; 3d7b: a9 01
    sta temp_right_offset                                             ; 3d7d: 8d d1 24
    lda #2                                                            ; 3d80: a9 02
    sta temp_left_offset                                              ; 3d82: 8d d0 24
    jmp c3d92                                                         ; 3d85: 4c 92 3d

c3d88
    lda #$ff                                                          ; 3d88: a9 ff
    sta temp_left_offset                                              ; 3d8a: 8d d0 24
    lda #$fe                                                          ; 3d8d: a9 fe
    sta temp_right_offset                                             ; 3d8f: 8d d1 24
c3d92
    ldx #1                                                            ; 3d92: a2 01
    ldy #8                                                            ; 3d94: a0 08
    jsr test_for_collision_between_objects_x_and_y                    ; 3d96: 20 e2 28
    beq c3df5                                                         ; 3d99: f0 5a
    ldx #$0d                                                          ; 3d9b: a2 0d
    ldy #$13                                                          ; 3d9d: a0 13
    lda #1                                                            ; 3d9f: a9 01
    sta width_in_cells                                                ; 3da1: 85 3c
    lda #2                                                            ; 3da3: a9 02
    sta height_in_cells                                               ; 3da5: 85 3d
    lda #0                                                            ; 3da7: a9 00
    sta value_to_write_to_collision_map                               ; 3da9: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3dab: 20 44 1e
    inc l0a26                                                         ; 3dae: ee 26 0a
c3db1
    lda desired_room_index                                            ; 3db1: a5 30
    cmp #2                                                            ; 3db3: c9 02
    bne c3df5                                                         ; 3db5: d0 3e
    lda l0a26                                                         ; 3db7: ad 26 0a
    beq c3df5                                                         ; 3dba: f0 39
    cmp #$0a                                                          ; 3dbc: c9 0a
    beq c3dd1                                                         ; 3dbe: f0 11
    bcc c3de6                                                         ; 3dc0: 90 24
    cmp #$1f                                                          ; 3dc2: c9 1f
    bne c3df5                                                         ; 3dc4: d0 2f
    lda l09ac                                                         ; 3dc6: ad ac 09
    beq c3df5                                                         ; 3dc9: f0 2a
    jsr play_landing_sound                                            ; 3dcb: 20 a9 23
    jmp c3df5                                                         ; 3dce: 4c f5 3d

c3dd1
    lda sound_priority_per_channel_table                              ; 3dd1: ad 6f 39
    cmp #$41 ; 'A'                                                    ; 3dd4: c9 41
    bcs c3de0                                                         ; 3dd6: b0 08
    lda #0                                                            ; 3dd8: a9 00
    sta sound_priority_per_channel_table                              ; 3dda: 8d 6f 39
    sta l3970                                                         ; 3ddd: 8d 70 39
c3de0
    jsr sub_c4622                                                     ; 3de0: 20 22 46
    jmp c3df5                                                         ; 3de3: 4c f5 3d

c3de6
    lda #$40 ; '@'                                                    ; 3de6: a9 40
    ldx #$56 ; 'V'                                                    ; 3de8: a2 56
    ldy #$46 ; 'F'                                                    ; 3dea: a0 46
    jsr play_sound_yx                                                 ; 3dec: 20 f6 38
    jmp c3df5                                                         ; 3def: 4c f5 3d

loop_c3df2
    jmp c3ea8                                                         ; 3df2: 4c a8 3e

c3df5
    lda desired_room_index                                            ; 3df5: a5 30
    cmp #2                                                            ; 3df7: c9 02
    bne loop_c3df2                                                    ; 3df9: d0 f7
    lda l0a26                                                         ; 3dfb: ad 26 0a
    ldx #$ff                                                          ; 3dfe: a2 ff
    cmp #$0a                                                          ; 3e00: c9 0a
    bcc c3e08                                                         ; 3e02: 90 04
    lda #$0a                                                          ; 3e04: a9 0a
    ldx #1                                                            ; 3e06: a2 01
c3e08
    sta l3ea9                                                         ; 3e08: 8d a9 3e
    stx l09c1                                                         ; 3e0b: 8e c1 09
    lda l3ea9                                                         ; 3e0e: ad a9 3e
    bne c3e3a                                                         ; 3e11: d0 27
    lda #0                                                            ; 3e13: a9 00
    sta l09af                                                         ; 3e15: 8d af 09
    lda #$db                                                          ; 3e18: a9 db
    sta l09b0                                                         ; 3e1a: 8d b0 09
    ldx #$0d                                                          ; 3e1d: a2 0d
    ldy #$13                                                          ; 3e1f: a0 13
    lda #1                                                            ; 3e21: a9 01
    sta width_in_cells                                                ; 3e23: 85 3c
    lda #2                                                            ; 3e25: a9 02
    sta height_in_cells                                               ; 3e27: 85 3d
    lda #2                                                            ; 3e29: a9 02
    sta value_to_write_to_collision_map                               ; 3e2b: 85 3e
    jsr read_collision_map_value_for_xy                               ; 3e2d: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3e30: c5 3e
    beq c3e37                                                         ; 3e32: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e34: 20 44 1e
c3e37
    jmp c3e59                                                         ; 3e37: 4c 59 3e

c3e3a
    lda #$12                                                          ; 3e3a: a9 12
    sec                                                               ; 3e3c: 38
    sbc l3ea9                                                         ; 3e3d: ed a9 3e
    tay                                                               ; 3e40: a8
    asl                                                               ; 3e41: 0a
    asl                                                               ; 3e42: 0a
    asl                                                               ; 3e43: 0a
    sta l0983                                                         ; 3e44: 8d 83 09
    lda #$0a                                                          ; 3e47: a9 0a
    sta l09af                                                         ; 3e49: 8d af 09
    lda #$dc                                                          ; 3e4c: a9 dc
    sta l09b0                                                         ; 3e4e: 8d b0 09
    ldx #$0d                                                          ; 3e51: a2 0d
    iny                                                               ; 3e53: c8
    lda #0                                                            ; 3e54: a9 00
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3e56: 20 bb 1e
c3e59
    lda l3ea9                                                         ; 3e59: ad a9 3e
    clc                                                               ; 3e5c: 18
    adc #8                                                            ; 3e5d: 69 08
    asl                                                               ; 3e5f: 0a
    asl                                                               ; 3e60: 0a
    asl                                                               ; 3e61: 0a
    ldx l3ea9                                                         ; 3e62: ae a9 3e
    cpx #$0a                                                          ; 3e65: e0 0a
    bcc c3e6c                                                         ; 3e67: 90 03
    clc                                                               ; 3e69: 18
    adc #4                                                            ; 3e6a: 69 04
c3e6c
    sta l0982                                                         ; 3e6c: 8d 82 09
    clc                                                               ; 3e6f: 18
    adc #8                                                            ; 3e70: 69 08
    sta l0981                                                         ; 3e72: 8d 81 09
    lda l0982                                                         ; 3e75: ad 82 09
    cmp l098d                                                         ; 3e78: cd 8d 09
    beq c3e82                                                         ; 3e7b: f0 05
    lda #0                                                            ; 3e7d: a9 00
    sta l09b9                                                         ; 3e7f: 8d b9 09
c3e82
    lda l0a26                                                         ; 3e82: ad 26 0a
    cmp #$0a                                                          ; 3e85: c9 0a
    bcc c3ea8                                                         ; 3e87: 90 1f
    sec                                                               ; 3e89: 38
    sbc #$0a                                                          ; 3e8a: e9 0a
    tax                                                               ; 3e8c: aa
    asl                                                               ; 3e8d: 0a
    asl                                                               ; 3e8e: 0a
    asl                                                               ; 3e8f: 0a
    sta l0070                                                         ; 3e90: 85 70
    lda #$f0                                                          ; 3e92: a9 f0
    sec                                                               ; 3e94: 38
    sbc l0070                                                         ; 3e95: e5 70
    sta l0954                                                         ; 3e97: 8d 54 09
    lda l3c51,x                                                       ; 3e9a: bd 51 3c
    sta l0980                                                         ; 3e9d: 8d 80 09
    lda l09c2                                                         ; 3ea0: ad c2 09
    bpl c3ea8                                                         ; 3ea3: 10 03
    inc l0954                                                         ; 3ea5: ee 54 09
c3ea8
    rts                                                               ; 3ea8: 60

l3ea9
    !byte 0                                                           ; 3ea9: 00
; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 20                                                          ; 3eaa: 14                      ; initial player X cell
    !byte 22                                                          ; 3eab: 16                      ; initial player Y cell

; ########################################
; ########################################
; #####   |     ###      ###     |   #####
; ####    |                      |    ####
; ###     |                      |     ###
; ###     |                      |     ###
; ###     |                      |     ###
; ###     |                      |     ###
; ###     |                      |     ###
; ###     |                      |     ###
; ###     |     OOO              |     ###
; ###     |     OOO              |     ###
; ###     |     ###      ###     |     ###
; ###     |     ###      ###     |     ###
; ###     |     ###      ###     |     ###
; ###     |     ###      ###     |     ###
; ###     |     ############     |     ###
; ###     |     ############     |     ###
; ###     |       ########       |     ###
; ###     |                      |     ###
; ###     |                      |     ###
; ###     |           P          |     ###
; #####   |                      |   #####
; #####   |                      |   #####
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_3_code
    ldx #0                                                            ; 3eac: a2 00
    ldy #0                                                            ; 3eae: a0 00
    lda #$ff                                                          ; 3eb0: a9 ff
    sta width_in_cells                                                ; 3eb2: 85 3c
    lda #2                                                            ; 3eb4: a9 02
    sta height_in_cells                                               ; 3eb6: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3eb8: 20 bb 1a
; draw 5x1 rectangle at (0,2)
    ldy #2                                                            ; 3ebb: a0 02
    lda #5                                                            ; 3ebd: a9 05
    sta width_in_cells                                                ; 3ebf: 85 3c
    dec height_in_cells                                               ; 3ec1: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ec3: 20 bb 1a
; draw 5x1 rectangle at (35,2)
    ldx #$23 ; '#'                                                    ; 3ec6: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 3ec8: 20 bb 1a
; draw 4x1 rectangle at (0,3)
    ldx #0                                                            ; 3ecb: a2 00
    iny                                                               ; 3ecd: c8
    dec width_in_cells                                                ; 3ece: c6 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3ed0: 20 bb 1a
; draw 4x1 rectangle at (36,3)
    ldx #$24 ; '$'                                                    ; 3ed3: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 3ed5: 20 bb 1a
; draw 3x18 rectangle at (0,4)
    ldx #0                                                            ; 3ed8: a2 00
    iny                                                               ; 3eda: c8
    dec width_in_cells                                                ; 3edb: c6 3c
    lda #$12                                                          ; 3edd: a9 12
    sta height_in_cells                                               ; 3edf: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ee1: 20 bb 1a
; draw 3x18 rectangle at (37,4)
    ldx #$25 ; '%'                                                    ; 3ee4: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 3ee6: 20 bb 1a
; draw 5x18 rectangle at (0,22)
    ldx #0                                                            ; 3ee9: a2 00
    ldy #$16                                                          ; 3eeb: a0 16
    lda #5                                                            ; 3eed: a9 05
    sta width_in_cells                                                ; 3eef: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3ef1: 20 bb 1a
; draw 5x18 rectangle at (35,22)
    ldx #$23 ; '#'                                                    ; 3ef4: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 3ef6: 20 bb 1a
; draw 3x1 rectangle at (14,2)
    ldx #$0e                                                          ; 3ef9: a2 0e
    ldy #2                                                            ; 3efb: a0 02
    lda #3                                                            ; 3efd: a9 03
    sta width_in_cells                                                ; 3eff: 85 3c
    lda #1                                                            ; 3f01: a9 01
    sta height_in_cells                                               ; 3f03: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f05: 20 bb 1a
; draw 3x1 rectangle at (23,2)
    ldx #$17                                                          ; 3f08: a2 17
    jsr copy_rectangle_of_memory_to_screen                            ; 3f0a: 20 bb 1a
; draw 3x4 rectangle at (14,12)
    ldx #$0e                                                          ; 3f0d: a2 0e
    ldy #$0c                                                          ; 3f0f: a0 0c
    lda #4                                                            ; 3f11: a9 04
    sta height_in_cells                                               ; 3f13: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f15: 20 bb 1a
; draw 3x4 rectangle at (23,12)
    ldx #$17                                                          ; 3f18: a2 17
    jsr copy_rectangle_of_memory_to_screen                            ; 3f1a: 20 bb 1a
; draw 12x2 rectangle at (14,16)
    ldx #$0e                                                          ; 3f1d: a2 0e
    ldy #$10                                                          ; 3f1f: a0 10
    lda #$0c                                                          ; 3f21: a9 0c
    sta width_in_cells                                                ; 3f23: 85 3c
    lda #2                                                            ; 3f25: a9 02
    sta height_in_cells                                               ; 3f27: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f29: 20 bb 1a
; draw 8x1 rectangle at (16,18)
    ldx #$10                                                          ; 3f2c: a2 10
    ldy #$12                                                          ; 3f2e: a0 12
    lda #8                                                            ; 3f30: a9 08
    sta width_in_cells                                                ; 3f32: 85 3c
    dec height_in_cells                                               ; 3f34: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f36: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3f39: 20 90 1b
; draw sprite $dd at (14,10) of size (3x2)
    ldx #$0e                                                          ; 3f3c: a2 0e
    ldy #$0a                                                          ; 3f3e: a0 0a
    lda #3                                                            ; 3f40: a9 03
    sta width_in_cells                                                ; 3f42: 85 3c
    lda #2                                                            ; 3f44: a9 02
    sta height_in_cells                                               ; 3f46: 85 3d
    lda #$dd                                                          ; 3f48: a9 dd
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3f4a: 20 57 1f
; draw rope at (8,2) length 255
    ldx #8                                                            ; 3f4d: a2 08
    ldy #2                                                            ; 3f4f: a0 02
    lda #$ff                                                          ; 3f51: a9 ff
    jsr draw_rope                                                     ; 3f53: 20 b9 1d
; draw rope at (31,2) length 255
    ldx #$1f                                                          ; 3f56: a2 1f
    jsr draw_rope                                                     ; 3f58: 20 b9 1d
    jsr start_room                                                    ; 3f5b: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 3f5e: 20 da 12
    and #exit_room_bottom                                             ; 3f61: 29 02
    beq room_3_game_update_loop                                       ; 3f63: f0 f9
    ldx #1                                                            ; 3f65: a2 01
    ldy current_level                                                 ; 3f67: a4 31
    jmp initialise_level_and_room                                     ; 3f69: 4c 40 11

l3f6c
    !byte   0,   0, $f8,   0, $f1,   0, $eb,   6, $e9, $10, $e8, $1b  ; 3f6c: 00 00 f8...
l3f78
    !byte   0, $3e,   2, $33,   8, $28, $10, $1d, $18, $16, $20, $10  ; 3f78: 00 3e 02...
    !byte $28, $0b, $30,   9, $38,   7, $40,   6, $48,   7, $50,   9  ; 3f84: 28 0b 30...
    !byte $58, $0b, $60, $10, $68, $16, $70, $1d                      ; 3f90: 58 0b 60...
    !text "x(~3"                                                      ; 3f98: 78 28 7e...
    !byte $83, $40, $87, $50, $8a, $60, $8c, $73                      ; 3f9c: 83 40 87...

sub_c3fa4
    lda update_room_first_update_flag                                 ; 3fa4: ad 2b 13
    beq c3fe8                                                         ; 3fa7: f0 3f
    lda current_level                                                 ; 3fa9: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3fab: c5 51
    beq c3fbd                                                         ; 3fad: f0 0e
    lda l0a2f                                                         ; 3faf: ad 2f 0a
    beq c3fbd                                                         ; 3fb2: f0 09
    cmp #$ff                                                          ; 3fb4: c9 ff
    beq c3fbd                                                         ; 3fb6: f0 05
    lda #$19                                                          ; 3fb8: a9 19
    sta l0a2f                                                         ; 3fba: 8d 2f 0a
c3fbd
    lda desired_room_index                                            ; 3fbd: a5 30
    cmp #3                                                            ; 3fbf: c9 03
    bne c3fe5                                                         ; 3fc1: d0 22
    lda #$cc                                                          ; 3fc3: a9 cc
    sta l38b0                                                         ; 3fc5: 8d b0 38
    lda #$e0                                                          ; 3fc8: a9 e0
    sta l38c6                                                         ; 3fca: 8d c6 38
    lda #$cb                                                          ; 3fcd: a9 cb
    sta l09ac                                                         ; 3fcf: 8d ac 09
    lda #$cd                                                          ; 3fd2: a9 cd
    sta l38af                                                         ; 3fd4: 8d af 38
    ldx #$14                                                          ; 3fd7: a2 14
    ldy #$10                                                          ; 3fd9: a0 10
    lda #3                                                            ; 3fdb: a9 03
    jsr set_object_position_from_cell_xy                              ; 3fdd: 20 5d 1f
    lda #$ce                                                          ; 3fe0: a9 ce
    sta l09ab                                                         ; 3fe2: 8d ab 09
c3fe5
    jmp c4045                                                         ; 3fe5: 4c 45 40

c3fe8
    lda l0a2f                                                         ; 3fe8: ad 2f 0a
    beq c400f                                                         ; 3feb: f0 22
    cmp #$19                                                          ; 3fed: c9 19
    beq c4024                                                         ; 3fef: f0 33
    cmp #$ff                                                          ; 3ff1: c9 ff
    beq c4045                                                         ; 3ff3: f0 50
    inc l0a2f                                                         ; 3ff5: ee 2f 0a
    lda desired_room_index                                            ; 3ff8: a5 30
    cmp #3                                                            ; 3ffa: c9 03
    bne c4045                                                         ; 3ffc: d0 47
    lda l0a2f                                                         ; 3ffe: ad 2f 0a
    cmp #5                                                            ; 4001: c9 05
    beq c4009                                                         ; 4003: f0 04
    cmp #$19                                                          ; 4005: c9 19
    bne c4045                                                         ; 4007: d0 3c
c4009
    jsr play_landing_sound                                            ; 4009: 20 a9 23
    jmp c4045                                                         ; 400c: 4c 45 40

c400f
    lda desired_room_index                                            ; 400f: a5 30
    cmp #3                                                            ; 4011: c9 03
    bne c4045                                                         ; 4013: d0 30
    ldx #$0b                                                          ; 4015: a2 0b
    ldy #4                                                            ; 4017: a0 04
    jsr test_for_collision_between_objects_x_and_y                    ; 4019: 20 e2 28
    beq c4045                                                         ; 401c: f0 27
    inc l0a2f                                                         ; 401e: ee 2f 0a
    jmp c4045                                                         ; 4021: 4c 45 40

c4024
    lda desired_room_index                                            ; 4024: a5 30
    cmp #3                                                            ; 4026: c9 03
    bne c4045                                                         ; 4028: d0 1b
    ldx #$0b                                                          ; 402a: a2 0b
    ldy #2                                                            ; 402c: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 402e: 20 e2 28
    beq c4045                                                         ; 4031: f0 12
    lda #$ca                                                          ; 4033: a9 ca
    jsr find_or_create_menu_slot_for_A                                ; 4035: 20 bd 2b
    lda #$ff                                                          ; 4038: a9 ff
    sta l0a2f                                                         ; 403a: 8d 2f 0a
    sta l0a24                                                         ; 403d: 8d 24 0a
    lda #0                                                            ; 4040: a9 00
    sta l09aa                                                         ; 4042: 8d aa 09
c4045
    lda desired_room_index                                            ; 4045: a5 30
    cmp #3                                                            ; 4047: c9 03
    bne c40c1                                                         ; 4049: d0 76
    lda #1                                                            ; 404b: a9 01
    sta l09c1                                                         ; 404d: 8d c1 09
    ldx l0a2f                                                         ; 4050: ae 2f 0a
    ldy #0                                                            ; 4053: a0 00
    cpx #5                                                            ; 4055: e0 05
    bcc c4068                                                         ; 4057: 90 0f
    lda #$ff                                                          ; 4059: a9 ff
    sta l09c1                                                         ; 405b: 8d c1 09
    ldx #5                                                            ; 405e: a2 05
    lda l0a2f                                                         ; 4060: ad 2f 0a
    sec                                                               ; 4063: 38
    sbc #5                                                            ; 4064: e9 05
    tay                                                               ; 4066: a8
    iny                                                               ; 4067: c8
c4068
    txa                                                               ; 4068: 8a
    asl                                                               ; 4069: 0a
    tax                                                               ; 406a: aa
    lda l3f6c,x                                                       ; 406b: bd 6c 3f
    clc                                                               ; 406e: 18
    adc #$c4                                                          ; 406f: 69 c4
    sta l0954                                                         ; 4071: 8d 54 09
    inx                                                               ; 4074: e8
    lda l3f6c,x                                                       ; 4075: bd 6c 3f
    dex                                                               ; 4078: ca
    clc                                                               ; 4079: 18
    adc #$5e ; '^'                                                    ; 407a: 69 5e
    sta l0980                                                         ; 407c: 8d 80 09
    ldx #$18                                                          ; 407f: a2 18
    sty l4621                                                         ; 4081: 8c 21 46
    ldy #$0b                                                          ; 4084: a0 0b
    lda #3                                                            ; 4086: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4088: 20 bb 1e
    ldy l4621                                                         ; 408b: ac 21 46
    lda l0a2f                                                         ; 408e: ad 2f 0a
    cmp #$ff                                                          ; 4091: c9 ff
    beq c40c1                                                         ; 4093: f0 2c
    lda #$c9                                                          ; 4095: a9 c9
    sta l38ae                                                         ; 4097: 8d ae 38
    lda #$a0                                                          ; 409a: a9 a0
    sta l38c4                                                         ; 409c: 8d c4 38
    lda #$c8                                                          ; 409f: a9 c8
    sta l09aa                                                         ; 40a1: 8d aa 09
    tya                                                               ; 40a4: 98
    asl                                                               ; 40a5: 0a
    tay                                                               ; 40a6: a8
    lda l3f78,y                                                       ; 40a7: b9 78 3f
    clc                                                               ; 40aa: 18
    adc #$90                                                          ; 40ab: 69 90
    sta l0952                                                         ; 40ad: 8d 52 09
    lda #0                                                            ; 40b0: a9 00
    adc #0                                                            ; 40b2: 69 00
    sta l0968                                                         ; 40b4: 8d 68 09
    iny                                                               ; 40b7: c8
    lda l3f78,y                                                       ; 40b8: b9 78 3f
    clc                                                               ; 40bb: 18
    adc #$38 ; '8'                                                    ; 40bc: 69 38
    sta l097e                                                         ; 40be: 8d 7e 09
c40c1
    rts                                                               ; 40c1: 60

sub_c40c2
    ldx #0                                                            ; 40c2: a2 00
    ldy #0                                                            ; 40c4: a0 00
    lda #$ff                                                          ; 40c6: a9 ff
    sta width_in_cells                                                ; 40c8: 85 3c
    lda #2                                                            ; 40ca: a9 02
    sta height_in_cells                                               ; 40cc: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 40ce: 20 bb 1a
    ldy #$16                                                          ; 40d1: a0 16
    jmp copy_rectangle_of_memory_to_screen                            ; 40d3: 4c bb 1a

; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 31                                                          ; 40d6: 1f                      ; initial player X cell
    !byte 21                                                          ; 40d7: 15                      ; initial player Y cell

; ########################################
; ########################################
; #####
; ####
; ###
; ###          OOO         OOO
; ###          OOO         OOO
; ###          ###############         ###
; ###          ###############         ###
; ###          ###                     ###
; ###          ###                     ###
; ###          ###                     ###
; ###          ###                     ###
; ###          ###                     ###
; ###          ###                     ###
; ###          ###                     ###
; ###          ###                     ###
; ###          ###
; ###          ###         ###
; ###          ###         ###
; ###          ###         ###   P
; ###          ###         ########
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_0_code
    jsr sub_c40c2                                                     ; 40d8: 20 c2 40
; draw 5x1 rectangle at (0,2)
    ldy #2                                                            ; 40db: a0 02
    lda #5                                                            ; 40dd: a9 05
    sta width_in_cells                                                ; 40df: 85 3c
    dec height_in_cells                                               ; 40e1: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 40e3: 20 bb 1a
; draw 4x1 rectangle at (0,3)
    iny                                                               ; 40e6: c8
    dec width_in_cells                                                ; 40e7: c6 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 40e9: 20 bb 1a
; draw 3x18 rectangle at (0,4)
    iny                                                               ; 40ec: c8
    dec width_in_cells                                                ; 40ed: c6 3c
    lda #$12                                                          ; 40ef: a9 12
    sta height_in_cells                                               ; 40f1: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 40f3: 20 bb 1a
; draw 3x10 rectangle at (37,7)
    ldx #$25 ; '%'                                                    ; 40f6: a2 25
    ldy #7                                                            ; 40f8: a0 07
    lda #$0a                                                          ; 40fa: a9 0a
    sta height_in_cells                                               ; 40fc: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 40fe: 20 bb 1a
; draw 15x2 rectangle at (13,7)
    ldx #$0d                                                          ; 4101: a2 0d
    ldy #7                                                            ; 4103: a0 07
    lda #$0f                                                          ; 4105: a9 0f
    sta width_in_cells                                                ; 4107: 85 3c
    lda #2                                                            ; 4109: a9 02
    sta height_in_cells                                               ; 410b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 410d: 20 bb 1a
; draw 3x13 rectangle at (13,9)
    ldy #9                                                            ; 4110: a0 09
    lda #3                                                            ; 4112: a9 03
    sta width_in_cells                                                ; 4114: 85 3c
    lda #$0d                                                          ; 4116: a9 0d
    sta height_in_cells                                               ; 4118: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 411a: 20 bb 1a
; draw 3x4 rectangle at (25,18)
    ldx #$19                                                          ; 411d: a2 19
    ldy #$12                                                          ; 411f: a0 12
    lda #4                                                            ; 4121: a9 04
    sta height_in_cells                                               ; 4123: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4125: 20 bb 1a
; draw 5x1 rectangle at (28,21)
    ldx #$1c                                                          ; 4128: a2 1c
    ldy #$15                                                          ; 412a: a0 15
    lda #5                                                            ; 412c: a9 05
    sta width_in_cells                                                ; 412e: 85 3c
    lda #1                                                            ; 4130: a9 01
    sta height_in_cells                                               ; 4132: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4134: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 4137: 20 90 1b
; draw sprite $dd at (13,5) of size (3x2)
    lda #3                                                            ; 413a: a9 03
    sta width_in_cells                                                ; 413c: 85 3c
    lda #2                                                            ; 413e: a9 02
    sta height_in_cells                                               ; 4140: 85 3d
    ldx #$0d                                                          ; 4142: a2 0d
    ldy #5                                                            ; 4144: a0 05
    lda #$dd                                                          ; 4146: a9 dd
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 4148: 20 57 1f
; draw sprite $dd at (25,5) of size (3x2)
    ldx #$19                                                          ; 414b: a2 19
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 414d: 20 57 1f
    jsr sub_c42fa                                                     ; 4150: 20 fa 42
    jsr start_room                                                    ; 4153: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 4156: 20 da 12
    and #exit_room_right                                              ; 4159: 29 04
    beq room_0_game_update_loop                                       ; 415b: f0 f9
    ldx #1                                                            ; 415d: a2 01
    ldy current_level                                                 ; 415f: a4 31
    jmp initialise_level_and_room                                     ; 4161: 4c 40 11

l4164
    !byte   0,   0, $f8,   0, $f1,   0, $eb,   2, $e5,   6, $e0, $0c  ; 4164: 00 00 f8...
    !byte $dd, $13, $dc, $1b                                          ; 4170: dd 13 dc...
l4174
    !byte   4, $48, $0b, $3e, $14, $2f, $1d, $25, $26, $1e, $2f, $19  ; 4174: 04 48 0b...
    !byte $38, $14, $41, $10, $4a, $0c, $53, $0a, $5c,   8, $65,   7  ; 4180: 38 14 41...
    !byte $6f,   6, $79,   5, $83,   5, $8d,   5                      ; 418c: 6f 06 79...
l4194
    !byte $0a, $f6, $f5, $f4, $f3, $0d, $0c, $0b, $0a, $f6, $f5, $f4  ; 4194: 0a f6 f5...
    !byte $f3, $0d, $0c, $0b                                          ; 41a0: f3 0d 0c...

sub_c41a4
    lda update_room_first_update_flag                                 ; 41a4: ad 2b 13
    beq c420a                                                         ; 41a7: f0 61
    lda #$d1                                                          ; 41a9: a9 d1
    sta toolbar_collectable_spriteids+2                               ; 41ab: 8d ea 2e
    lda #$d0                                                          ; 41ae: a9 d0
    sta collectable_spriteids+2                                       ; 41b0: 8d ef 2e
    sta l2ef4                                                         ; 41b3: 8d f4 2e
    lda current_level                                                 ; 41b6: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 41b8: c5 51
    beq c41ca                                                         ; 41ba: f0 0e
    lda l0a25                                                         ; 41bc: ad 25 0a
    beq c41ca                                                         ; 41bf: f0 09
    cmp #$ff                                                          ; 41c1: c9 ff
    beq c41ca                                                         ; 41c3: f0 05
    lda #$15                                                          ; 41c5: a9 15
    sta l0a25                                                         ; 41c7: 8d 25 0a
c41ca
    lda desired_room_index                                            ; 41ca: a5 30
    cmp #0                                                            ; 41cc: c9 00
    bne c4207                                                         ; 41ce: d0 37
    ldx #$32 ; '2'                                                    ; 41d0: a2 32
    ldy #$46 ; 'F'                                                    ; 41d2: a0 46
    jsr define_envelope                                               ; 41d4: 20 5e 39
    lda #$cc                                                          ; 41d7: a9 cc
    sta l38b1                                                         ; 41d9: 8d b1 38
    lda #$e0                                                          ; 41dc: a9 e0
    sta l38c7                                                         ; 41de: 8d c7 38
    lda #$cb                                                          ; 41e1: a9 cb
    sta l09ad                                                         ; 41e3: 8d ad 09
    lda #$cd                                                          ; 41e6: a9 cd
    sta l38af                                                         ; 41e8: 8d af 38
    ldx #$14                                                          ; 41eb: a2 14
    lda #4                                                            ; 41ed: a9 04
    sta temp_sprite_x_offset                                          ; 41ef: 85 3a
    ldy #$16                                                          ; 41f1: a0 16
    lda #3                                                            ; 41f3: a9 03
    jsr set_object_position_from_cell_xy                              ; 41f5: 20 5d 1f
    lda #$ce                                                          ; 41f8: a9 ce
    sta l09ab                                                         ; 41fa: 8d ab 09
    lda #$cf                                                          ; 41fd: a9 cf
    sta l38b0                                                         ; 41ff: 8d b0 38
    lda #$c0                                                          ; 4202: a9 c0
    sta l38c6                                                         ; 4204: 8d c6 38
c4207
    jmp c426c                                                         ; 4207: 4c 6c 42

c420a
    lda l0a25                                                         ; 420a: ad 25 0a
    beq c423e                                                         ; 420d: f0 2f
    cmp #$15                                                          ; 420f: c9 15
    beq c4253                                                         ; 4211: f0 40
    cmp #$ff                                                          ; 4213: c9 ff
    beq c426c                                                         ; 4215: f0 55
    inc l0a25                                                         ; 4217: ee 25 0a
    lda desired_room_index                                            ; 421a: a5 30
    cmp #0                                                            ; 421c: c9 00
    bne c426c                                                         ; 421e: d0 4c
    lda l0a25                                                         ; 4220: ad 25 0a
    cmp #7                                                            ; 4223: c9 07
    bne c422d                                                         ; 4225: d0 06
    jsr play_landing_sound                                            ; 4227: 20 a9 23
    jmp c426c                                                         ; 422a: 4c 6c 42

c422d
    lda l0a25                                                         ; 422d: ad 25 0a
    cmp #$15                                                          ; 4230: c9 15
    bne c426c                                                         ; 4232: d0 38
    ldx #$40 ; '@'                                                    ; 4234: a2 40
    ldy #$46 ; 'F'                                                    ; 4236: a0 46
    jsr play_sound_yx                                                 ; 4238: 20 f6 38
    jmp c426c                                                         ; 423b: 4c 6c 42

c423e
    lda desired_room_index                                            ; 423e: a5 30
    cmp #0                                                            ; 4240: c9 00
    bne c426c                                                         ; 4242: d0 28
    ldx #$0d                                                          ; 4244: a2 0d
    ldy #5                                                            ; 4246: a0 05
    jsr test_for_collision_between_objects_x_and_y                    ; 4248: 20 e2 28
    beq c426c                                                         ; 424b: f0 1f
    inc l0a25                                                         ; 424d: ee 25 0a
    jmp c426c                                                         ; 4250: 4c 6c 42

c4253
    lda desired_room_index                                            ; 4253: a5 30
    cmp #0                                                            ; 4255: c9 00
    bne c426c                                                         ; 4257: d0 13
    ldx #$0b                                                          ; 4259: a2 0b
    ldy #4                                                            ; 425b: a0 04
    jsr test_for_collision_between_objects_x_and_y                    ; 425d: 20 e2 28
    beq c426c                                                         ; 4260: f0 0a
    lda #$d1                                                          ; 4262: a9 d1
    jsr find_or_create_menu_slot_for_A                                ; 4264: 20 bd 2b
    lda #$ff                                                          ; 4267: a9 ff
    sta l0a25                                                         ; 4269: 8d 25 0a
c426c
    lda desired_room_index                                            ; 426c: a5 30
    cmp #0                                                            ; 426e: c9 00
    beq c4275                                                         ; 4270: f0 03
    jmp c42f9                                                         ; 4272: 4c f9 42

c4275
    lda #1                                                            ; 4275: a9 01
    sta l09c1                                                         ; 4277: 8d c1 09
    ldx l0a25                                                         ; 427a: ae 25 0a
    ldy #0                                                            ; 427d: a0 00
    cpx #7                                                            ; 427f: e0 07
    bcc c4292                                                         ; 4281: 90 0f
    lda #$ff                                                          ; 4283: a9 ff
    sta l09c1                                                         ; 4285: 8d c1 09
    ldx #7                                                            ; 4288: a2 07
    lda l0a25                                                         ; 428a: ad 25 0a
    sec                                                               ; 428d: 38
    sbc #7                                                            ; 428e: e9 07
    tay                                                               ; 4290: a8
    iny                                                               ; 4291: c8
c4292
    txa                                                               ; 4292: 8a
    asl                                                               ; 4293: 0a
    tax                                                               ; 4294: aa
    lda l4164,x                                                       ; 4295: bd 64 41
    clc                                                               ; 4298: 18
    adc #$d4                                                          ; 4299: 69 d4
    sta l0955                                                         ; 429b: 8d 55 09
    inx                                                               ; 429e: e8
    lda l4164,x                                                       ; 429f: bd 64 41
    dex                                                               ; 42a2: ca
    clc                                                               ; 42a3: 18
    adc #$8e                                                          ; 42a4: 69 8e
    sta l0981                                                         ; 42a6: 8d 81 09
    tya                                                               ; 42a9: 98
    pha                                                               ; 42aa: 48
    jsr sub_c42fa                                                     ; 42ab: 20 fa 42
    pla                                                               ; 42ae: 68
    tay                                                               ; 42af: a8
    lda #0                                                            ; 42b0: a9 00
    sta l09ac                                                         ; 42b2: 8d ac 09
    lda l0a25                                                         ; 42b5: ad 25 0a
    cmp #$ff                                                          ; 42b8: c9 ff
    beq c42f9                                                         ; 42ba: f0 3d
    lda l4194,y                                                       ; 42bc: b9 94 41
    bmi c42cf                                                         ; 42bf: 30 0e
    clc                                                               ; 42c1: 18
    adc #$c8                                                          ; 42c2: 69 c8
    sta l09ac                                                         ; 42c4: 8d ac 09
    lda #1                                                            ; 42c7: a9 01
    sta l09c2                                                         ; 42c9: 8d c2 09
    jmp c42dc                                                         ; 42cc: 4c dc 42

c42cf
    eor #$ff                                                          ; 42cf: 49 ff
    sec                                                               ; 42d1: 38
    adc #$c8                                                          ; 42d2: 69 c8
    sta l09ac                                                         ; 42d4: 8d ac 09
    lda #$ff                                                          ; 42d7: a9 ff
    sta l09c2                                                         ; 42d9: 8d c2 09
c42dc
    tya                                                               ; 42dc: 98
    asl                                                               ; 42dd: 0a
    tay                                                               ; 42de: a8
    lda l4174,y                                                       ; 42df: b9 74 41
    clc                                                               ; 42e2: 18
    adc #$90                                                          ; 42e3: 69 90
    sta l0954                                                         ; 42e5: 8d 54 09
    lda #0                                                            ; 42e8: a9 00
    adc #0                                                            ; 42ea: 69 00
    sta l096a                                                         ; 42ec: 8d 6a 09
    iny                                                               ; 42ef: c8
    lda l4174,y                                                       ; 42f0: b9 74 41
    clc                                                               ; 42f3: 18
    adc #$58 ; 'X'                                                    ; 42f4: 69 58
    sta l0980                                                         ; 42f6: 8d 80 09
c42f9
    rts                                                               ; 42f9: 60

sub_c42fa
    lda #3                                                            ; 42fa: a9 03
    ldx l0a25                                                         ; 42fc: ae 25 0a
    cpx #4                                                            ; 42ff: e0 04
    bcc c4305                                                         ; 4301: 90 02
    lda #0                                                            ; 4303: a9 00
c4305
    ldx #$1a                                                          ; 4305: a2 1a
    ldy #$11                                                          ; 4307: a0 11
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4309: 20 bb 1e
    rts                                                               ; 430c: 60

l430d
    !byte   0,   0,   0,   8, $f8,   6, $fa,   6, $fc,   6, $fe,   6  ; 430d: 00 00 00...
    !byte $ff, $80,   6,   1,   6,   2,   6,   4,   6,   6,   4,   8  ; 4319: ff 80 06...
    !byte   2,   8, $80,   0,   8, $80,   0,   0, $80,   4,   2,   3  ; 4325: 02 08 80...
    !byte   3,   2,   4,   1,   6, $80                                ; 4331: 03 02 04...

sub_c4337
    lda update_room_first_update_flag                                 ; 4337: ad 2b 13
    bne c433f                                                         ; 433a: d0 03
    jmp c4398                                                         ; 433c: 4c 98 43

c433f
    lda #$ca                                                          ; 433f: a9 ca
    sta toolbar_collectable_spriteids+1                               ; 4341: 8d e9 2e
    lda #$c8                                                          ; 4344: a9 c8
    sta collectable_spriteids+1                                       ; 4346: 8d ee 2e
    sta five_byte_table_paired_with_collectable_sprite_ids + 1        ; 4349: 8d f3 2e
    lda current_level                                                 ; 434c: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 434e: c5 51
    beq c4365                                                         ; 4350: f0 13
    lda #0                                                            ; 4352: a9 00
    sta l0a6f                                                         ; 4354: 8d 6f 0a
    lda l0a24                                                         ; 4357: ad 24 0a
    beq c4365                                                         ; 435a: f0 09
    bmi c4365                                                         ; 435c: 30 07
    cmp #$1e                                                          ; 435e: c9 1e
    beq c4365                                                         ; 4360: f0 03
    dec l0a6f                                                         ; 4362: ce 6f 0a
c4365
    lda desired_room_index                                            ; 4365: a5 30
    cmp l0a2d                                                         ; 4367: cd 2d 0a
    bne c4390                                                         ; 436a: d0 24
    lda l0a24                                                         ; 436c: ad 24 0a
    beq c4390                                                         ; 436f: f0 1f
    bmi c4390                                                         ; 4371: 30 1d
    jsr sub_c45f0                                                     ; 4373: 20 f0 45
loop_c4376
    lda desired_room_index                                            ; 4376: a5 30
    cmp l0a2d                                                         ; 4378: cd 2d 0a
    bne c4390                                                         ; 437b: d0 13
    lda l0a6f                                                         ; 437d: ad 6f 0a
    beq c4390                                                         ; 4380: f0 0e
    dec l0a6f                                                         ; 4382: ce 6f 0a
    ldx #2                                                            ; 4385: a2 02
    jsr l20f7                                                         ; 4387: 20 f7 20
    jsr sub_c449d                                                     ; 438a: 20 9d 44
    jmp loop_c4376                                                    ; 438d: 4c 76 43

c4390
    lda #0                                                            ; 4390: a9 00
    sta l09b5                                                         ; 4392: 8d b5 09
c4395
    jmp c449c                                                         ; 4395: 4c 9c 44

c4398
    lda #0                                                            ; 4398: a9 00
    sta l461e                                                         ; 439a: 8d 1e 46
    lda player_held_object_spriteid                                   ; 439d: a5 52
    sta l461f                                                         ; 439f: 8d 1f 46
    lda l09b5                                                         ; 43a2: ad b5 09
    sta l4620                                                         ; 43a5: 8d 20 46
    lda l0a24                                                         ; 43a8: ad 24 0a
    beq c4395                                                         ; 43ab: f0 e8
    bmi c43c1                                                         ; 43ad: 30 12
    lda desired_room_index                                            ; 43af: a5 30
    cmp l0a2d                                                         ; 43b1: cd 2d 0a
    beq c440a                                                         ; 43b4: f0 54
    lda l0a6f                                                         ; 43b6: ad 6f 0a
    bmi c4395                                                         ; 43b9: 30 da
    inc l0a6f                                                         ; 43bb: ee 6f 0a
    jmp c449c                                                         ; 43be: 4c 9c 44

c43c1
    lda #$ca                                                          ; 43c1: a9 ca
    cmp player_using_object_spriteid                                  ; 43c3: cd b6 2e
    bne c4395                                                         ; 43c6: d0 cd
    cmp previous_player_using_object_spriteid                         ; 43c8: cd b7 2e
    beq c4395                                                         ; 43cb: f0 c8
    dec l461e                                                         ; 43cd: ce 1e 46
    lda desired_room_index                                            ; 43d0: a5 30
    sta l0a2d                                                         ; 43d2: 8d 2d 0a
    lda object_direction                                              ; 43d5: ad be 09
    sta l0a2b                                                         ; 43d8: 8d 2b 0a
    sta l0a2e                                                         ; 43db: 8d 2e 0a
    lda object_x_low+1                                                ; 43de: ad 51 09
    sta l0a27                                                         ; 43e1: 8d 27 0a
    lda object_x_high+1                                               ; 43e4: ad 67 09
    sta l0a28                                                         ; 43e7: 8d 28 0a
    lda object_y_low+1                                                ; 43ea: ad 7d 09
    sta l0a29                                                         ; 43ed: 8d 29 0a
    lda object_y_high+1                                               ; 43f0: ad 93 09
    sta l0a2a                                                         ; 43f3: 8d 2a 0a
    lda #1                                                            ; 43f6: a9 01
    sta l0a2c                                                         ; 43f8: 8d 2c 0a
    sta l0a24                                                         ; 43fb: 8d 24 0a
    jsr sub_c45f0                                                     ; 43fe: 20 f0 45
    ldx #2                                                            ; 4401: a2 02
    jsr l20f7                                                         ; 4403: 20 f7 20
    lda #0                                                            ; 4406: a9 00
    sta player_held_object_spriteid                                   ; 4408: 85 52
c440a
    jsr sub_c449d                                                     ; 440a: 20 9d 44
    lda desired_room_index                                            ; 440d: a5 30
    cmp l0a2d                                                         ; 440f: cd 2d 0a
    beq c4419                                                         ; 4412: f0 05
    lda #0                                                            ; 4414: a9 00
    sta l0a6f                                                         ; 4416: 8d 6f 0a
c4419
    lda l4620                                                         ; 4419: ad 20 46
    sta l09b5                                                         ; 441c: 8d b5 09
    ldx #$0b                                                          ; 441f: a2 0b
    ldy #2                                                            ; 4421: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 4423: 20 e2 28
    ldx l461f                                                         ; 4426: ae 1f 46
    stx player_held_object_spriteid                                   ; 4429: 86 52
    ora #0                                                            ; 442b: 09 00
    beq c4446                                                         ; 442d: f0 17
    lda l461e                                                         ; 442f: ad 1e 46
    bne c4439                                                         ; 4432: d0 05
    lda #$ca                                                          ; 4434: a9 ca
    jsr find_or_create_menu_slot_for_A                                ; 4436: 20 bd 2b
c4439
    lda #0                                                            ; 4439: a9 00
    sta l09aa                                                         ; 443b: 8d aa 09
    lda #$ff                                                          ; 443e: a9 ff
    sta l0a24                                                         ; 4440: 8d 24 0a
    jmp c449c                                                         ; 4443: 4c 9c 44

c4446
    lda l461e                                                         ; 4446: ad 1e 46
    beq c445a                                                         ; 4449: f0 0f
    lda #$ca                                                          ; 444b: a9 ca
    jsr remove_item_from_toolbar_menu                                 ; 444d: 20 e0 2b
    lda #0                                                            ; 4450: a9 00
    sta object_spriteid+1                                             ; 4452: 8d a9 09
    sta player_using_object_spriteid                                  ; 4455: 8d b6 2e
    sta player_held_object_spriteid                                   ; 4458: 85 52
c445a
    lda l0952                                                         ; 445a: ad 52 09
    cmp l095d                                                         ; 445d: cd 5d 09
    beq c4482                                                         ; 4460: f0 20
    lda l0a2e                                                         ; 4462: ad 2e 0a
    bmi c446d                                                         ; 4465: 30 06
    inc temp_right_offset                                             ; 4467: ee d1 24
    jmp c4470                                                         ; 446a: 4c 70 44

c446d
    dec temp_left_offset                                              ; 446d: ce d0 24
c4470
    lda #1                                                            ; 4470: a9 01
    sta temp_bottom_offset                                            ; 4472: 8d 51 25
    lda #2                                                            ; 4475: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4477: 20 94 28
    beq c4482                                                         ; 447a: f0 06
    jsr play_landing_sound                                            ; 447c: 20 a9 23
    jmp c449c                                                         ; 447f: 4c 9c 44

c4482
    lda l097e                                                         ; 4482: ad 7e 09
    cmp l0989                                                         ; 4485: cd 89 09
    beq c449c                                                         ; 4488: f0 12
    dec temp_top_offset                                               ; 448a: ce 50 25
    lda #2                                                            ; 448d: a9 02
    sta temp_bottom_offset                                            ; 448f: 8d 51 25
    lda #2                                                            ; 4492: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4494: 20 94 28
    beq c449c                                                         ; 4497: f0 03
    jsr play_landing_sound                                            ; 4499: 20 a9 23
c449c
    rts                                                               ; 449c: 60

sub_c449d
    lda l0a2c                                                         ; 449d: ad 2c 0a
    clc                                                               ; 44a0: 18
    adc #2                                                            ; 44a1: 69 02
    tay                                                               ; 44a3: a8
    lda l430d,y                                                       ; 44a4: b9 0d 43
    cmp #$80                                                          ; 44a7: c9 80
    bne c44ae                                                         ; 44a9: d0 03
    ldy l0a24                                                         ; 44ab: ac 24 0a
c44ae
    lda l0a2e                                                         ; 44ae: ad 2e 0a
    bmi c44b9                                                         ; 44b1: 30 06
    inc temp_right_offset                                             ; 44b3: ee d1 24
    jmp c44bc                                                         ; 44b6: 4c bc 44

c44b9
    dec temp_left_offset                                              ; 44b9: ce d0 24
c44bc
    lda #1                                                            ; 44bc: a9 01
    sta temp_bottom_offset                                            ; 44be: 8d 51 25
    lda #2                                                            ; 44c1: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 44c3: 20 94 28
    beq c44d0                                                         ; 44c6: f0 08
    lda l0a2e                                                         ; 44c8: ad 2e 0a
    eor #$fe                                                          ; 44cb: 49 fe
    sta l0a2e                                                         ; 44cd: 8d 2e 0a
c44d0
    lda l0a24                                                         ; 44d0: ad 24 0a
    cmp #1                                                            ; 44d3: c9 01
    bne c44ed                                                         ; 44d5: d0 16
    dec temp_top_offset                                               ; 44d7: ce 50 25
    lda #2                                                            ; 44da: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 44dc: 20 94 28
    bne c44e6                                                         ; 44df: d0 05
    cpy l0a24                                                         ; 44e1: cc 24 0a
    bne c451d                                                         ; 44e4: d0 37
c44e6
    lda #$1b                                                          ; 44e6: a9 1b
    sta l0a24                                                         ; 44e8: 8d 24 0a
    ldy #$0e                                                          ; 44eb: a0 0e
c44ed
    lda #2                                                            ; 44ed: a9 02
    jsr l2770                                                         ; 44ef: 20 70 27
    lda l0a24                                                         ; 44f2: ad 24 0a
    cmp #$1b                                                          ; 44f5: c9 1b
    bne c4503                                                         ; 44f7: d0 0a
    lda l288f                                                         ; 44f9: ad 8f 28
    beq c451d                                                         ; 44fc: f0 1f
    ldy #$1e                                                          ; 44fe: a0 1e
    sty l0a24                                                         ; 4500: 8c 24 0a
c4503
    lda l2890                                                         ; 4503: ad 90 28
    beq c451d                                                         ; 4506: f0 15
    ldy #$1b                                                          ; 4508: a0 1b
    sty l0a24                                                         ; 450a: 8c 24 0a
    ldy #$21 ; '!'                                                    ; 450d: a0 21
    ldx #1                                                            ; 450f: a2 01
    stx l0a2e                                                         ; 4511: 8e 2e 0a
    ora #0                                                            ; 4514: 09 00
    bpl c451d                                                         ; 4516: 10 05
    ldx #$ff                                                          ; 4518: a2 ff
    stx l0a2e                                                         ; 451a: 8e 2e 0a
c451d
    sty l0a2c                                                         ; 451d: 8c 2c 0a
    lda l0a24                                                         ; 4520: ad 24 0a
    cmp #$1e                                                          ; 4523: c9 1e
    bne c452c                                                         ; 4525: d0 05
    lda #0                                                            ; 4527: a9 00
    sta l0a6f                                                         ; 4529: 8d 6f 0a
c452c
    lda l430d,y                                                       ; 452c: b9 0d 43
    ldx l0a2e                                                         ; 452f: ae 2e 0a
    bpl c4539                                                         ; 4532: 10 05
    eor #$ff                                                          ; 4534: 49 ff
    clc                                                               ; 4536: 18
    adc #1                                                            ; 4537: 69 01
c4539
    ldx #0                                                            ; 4539: a2 00
    ora #0                                                            ; 453b: 09 00
    bpl c4540                                                         ; 453d: 10 01
    dex                                                               ; 453f: ca
c4540
    clc                                                               ; 4540: 18
    adc l0a27                                                         ; 4541: 6d 27 0a
    sta l0a27                                                         ; 4544: 8d 27 0a
    txa                                                               ; 4547: 8a
    adc l0a28                                                         ; 4548: 6d 28 0a
    sta l0a28                                                         ; 454b: 8d 28 0a
    iny                                                               ; 454e: c8
    lda l430d,y                                                       ; 454f: b9 0d 43
    ldx #0                                                            ; 4552: a2 00
    ora #0                                                            ; 4554: 09 00
    bpl c4559                                                         ; 4556: 10 01
    dex                                                               ; 4558: ca
c4559
    clc                                                               ; 4559: 18
    adc l0a29                                                         ; 455a: 6d 29 0a
    sta l0a29                                                         ; 455d: 8d 29 0a
    txa                                                               ; 4560: 8a
    adc l0a2a                                                         ; 4561: 6d 2a 0a
    sta l0a2a                                                         ; 4564: 8d 2a 0a
    jsr sub_c45f0                                                     ; 4567: 20 f0 45
    lda #2                                                            ; 456a: a9 02
    jsr l25f5                                                         ; 456c: 20 f5 25
    lda l0952                                                         ; 456f: ad 52 09
    sta l0a27                                                         ; 4572: 8d 27 0a
    lda l0968                                                         ; 4575: ad 68 09
    sta l0a28                                                         ; 4578: 8d 28 0a
    lda l097e                                                         ; 457b: ad 7e 09
    sta l0a29                                                         ; 457e: 8d 29 0a
    lda l0994                                                         ; 4581: ad 94 09
    sta l0a2a                                                         ; 4584: 8d 2a 0a
    ldx #2                                                            ; 4587: a2 02
    jsr l2434                                                         ; 4589: 20 34 24
    jsr l24d2                                                         ; 458c: 20 d2 24
    lda l0a2d                                                         ; 458f: ad 2d 0a
    cmp #3                                                            ; 4592: c9 03
    beq c45cf                                                         ; 4594: f0 39
    lda l0a2e                                                         ; 4596: ad 2e 0a
    bmi c45b7                                                         ; 4599: 30 1c
    lda l0078                                                         ; 459b: a5 78
    cmp #$28 ; '('                                                    ; 459d: c9 28
    bcc c45ef                                                         ; 459f: 90 4e
    lda l0a27                                                         ; 45a1: ad 27 0a
    sec                                                               ; 45a4: 38
    sbc #$40 ; '@'                                                    ; 45a5: e9 40
    sta l0a27                                                         ; 45a7: 8d 27 0a
    lda #0                                                            ; 45aa: a9 00
    sbc #0                                                            ; 45ac: e9 00
    sta l0a28                                                         ; 45ae: 8d 28 0a
    inc l0a2d                                                         ; 45b1: ee 2d 0a
    jmp c45ea                                                         ; 45b4: 4c ea 45

c45b7
    lda l0079                                                         ; 45b7: a5 79
    bpl c45ef                                                         ; 45b9: 10 34
    lda l0a27                                                         ; 45bb: ad 27 0a
    clc                                                               ; 45be: 18
    adc #$40 ; '@'                                                    ; 45bf: 69 40
    sta l0a27                                                         ; 45c1: 8d 27 0a
    lda #1                                                            ; 45c4: a9 01
    sta l0a28                                                         ; 45c6: 8d 28 0a
    dec l0a2d                                                         ; 45c9: ce 2d 0a
    jmp c45ea                                                         ; 45cc: 4c ea 45

c45cf
    lda l007a                                                         ; 45cf: a5 7a
    cmp #$18                                                          ; 45d1: c9 18
    bcc c45ef                                                         ; 45d3: 90 1a
    lda l0a27                                                         ; 45d5: ad 27 0a
    sec                                                               ; 45d8: 38
    sbc #$c0                                                          ; 45d9: e9 c0
    sta l0a29                                                         ; 45db: 8d 29 0a
    lda #0                                                            ; 45de: a9 00
    sbc #0                                                            ; 45e0: e9 00
    sta l0a2a                                                         ; 45e2: 8d 2a 0a
    lda #1                                                            ; 45e5: a9 01
    sta l0a2d                                                         ; 45e7: 8d 2d 0a
c45ea
    lda #0                                                            ; 45ea: a9 00
    sta l09aa                                                         ; 45ec: 8d aa 09
c45ef
    rts                                                               ; 45ef: 60

sub_c45f0
    lda #$c9                                                          ; 45f0: a9 c9
    sta l38ae                                                         ; 45f2: 8d ae 38
    lda #$a0                                                          ; 45f5: a9 a0
    sta l38c4                                                         ; 45f7: 8d c4 38
    lda l0a27                                                         ; 45fa: ad 27 0a
    sta l0952                                                         ; 45fd: 8d 52 09
    lda l0a28                                                         ; 4600: ad 28 0a
    sta l0968                                                         ; 4603: 8d 68 09
    lda l0a29                                                         ; 4606: ad 29 0a
    sta l097e                                                         ; 4609: 8d 7e 09
    lda l0a2a                                                         ; 460c: ad 2a 0a
    sta l0994                                                         ; 460f: 8d 94 09
    lda #$c8                                                          ; 4612: a9 c8
    sta l09aa                                                         ; 4614: 8d aa 09
    lda l0a2b                                                         ; 4617: ad 2b 0a
    sta l09c0                                                         ; 461a: 8d c0 09
    rts                                                               ; 461d: 60

l461e
    !byte 0                                                           ; 461e: 00
l461f
    !byte 0                                                           ; 461f: 00
l4620
    !byte 0                                                           ; 4620: 00
l4621
    !byte 0                                                           ; 4621: 00

sub_c4622
    lda #0                                                            ; 4622: a9 00
    ldx #$74 ; 't'                                                    ; 4624: a2 74
    ldy #$46 ; 'F'                                                    ; 4626: a0 46
    jsr play_sound_yx                                                 ; 4628: 20 f6 38
    ldx #$6c ; 'l'                                                    ; 462b: a2 6c
    ldy #$46 ; 'F'                                                    ; 462d: a0 46
    jmp play_sound_yx                                                 ; 462f: 4c f6 38

    !byte   5,   1, $ff,   0,   0,   1,   1,   0, $6e, $fc,   0, $f8  ; 4632: 05 01 ff...
    !byte $6e,   0, $13,   0,   5,   0, $c9,   0,   1,   0,   5,   1  ; 463e: 6e 00 13...
    !byte   0,   0,   0,   0,   0,   0, $0a,   0,   0, $d8, $28,   0  ; 464a: 00 00 00...
    !byte $10,   0,   5,   0,   4,   0,   4,   0,   6,   1,   0,   0  ; 4656: 10 00 05...
    !byte   0,   0,   0,   0, $37,   0,   0, $fa, $6e, $37, $10,   0  ; 4662: 00 00 00...
    !byte   6,   0,   7,   0,   1,   0, $11,   0,   0,   0, $d2,   0  ; 466e: 06 00 07...
    !byte   1,   0,   8,   8, $14, $23, $c0, $20, $10, $10, $10, $10  ; 467a: 01 00 08...
    !byte $28, $c4,   3,   4,   8,   8, $10, $10, $20, $c0, $23, $14  ; 4686: 28 c4 03...
    !byte   8,   8,   8,   8,   4,   3, $c4, $28, $10, $10            ; 4692: 08 08 08...
sprite_data
pydis_end

; Automatically generated labels:
;     c3b06
;     c3b10
;     c3b1a
;     c3b31
;     c3bc5
;     c3bd2
;     c3bdf
;     c3c81
;     c3c91
;     c3c9a
;     c3cf3
;     c3d57
;     c3d5a
;     c3d69
;     c3d88
;     c3d92
;     c3db1
;     c3dd1
;     c3de0
;     c3de6
;     c3df5
;     c3e08
;     c3e37
;     c3e3a
;     c3e59
;     c3e6c
;     c3e82
;     c3ea8
;     c3fbd
;     c3fe5
;     c3fe8
;     c4009
;     c400f
;     c4024
;     c4045
;     c4068
;     c40c1
;     c41ca
;     c4207
;     c420a
;     c422d
;     c423e
;     c4253
;     c426c
;     c4275
;     c4292
;     c42cf
;     c42dc
;     c42f9
;     c4305
;     c433f
;     c4365
;     c4390
;     c4395
;     c4398
;     c43c1
;     c440a
;     c4419
;     c4439
;     c4446
;     c445a
;     c446d
;     c4470
;     c4482
;     c449c
;     c44ae
;     c44b9
;     c44bc
;     c44d0
;     c44e6
;     c44ed
;     c4503
;     c451d
;     c452c
;     c4539
;     c4540
;     c4559
;     c45b7
;     c45cf
;     c45ea
;     c45ef
;     l0070
;     l0078
;     l0079
;     l007a
;     l0952
;     l0954
;     l0955
;     l095d
;     l0968
;     l096a
;     l097e
;     l0980
;     l0981
;     l0982
;     l0983
;     l0989
;     l098d
;     l0994
;     l09aa
;     l09ab
;     l09ac
;     l09ad
;     l09ae
;     l09af
;     l09b0
;     l09b5
;     l09b9
;     l09c0
;     l09c1
;     l09c2
;     l0a24
;     l0a25
;     l0a26
;     l0a27
;     l0a28
;     l0a29
;     l0a2a
;     l0a2b
;     l0a2c
;     l0a2d
;     l0a2e
;     l0a2f
;     l0a6f
;     l20f7
;     l2434
;     l24d2
;     l25f5
;     l2770
;     l288f
;     l2890
;     l2ef4
;     l38ae
;     l38af
;     l38b0
;     l38b1
;     l38b4
;     l38c4
;     l38c6
;     l38c7
;     l38c8
;     l3970
;     l3c51
;     l3ea9
;     l3f6c
;     l3f78
;     l4164
;     l4174
;     l4194
;     l430d
;     l461e
;     l461f
;     l4620
;     l4621
;     loop_c3ce2
;     loop_c3d05
;     loop_c3d30
;     loop_c3df2
;     loop_c4376
;     sub_c3c67
;     sub_c3fa4
;     sub_c40c2
;     sub_c41a4
;     sub_c42fa
;     sub_c4337
;     sub_c449d
;     sub_c45f0
;     sub_c4622
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
!if (level_specific_initialisation) != $3af1 {
    !error "Assertion failed: level_specific_initialisation == $3af1"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b3a {
    !error "Assertion failed: level_specific_update == $3b3a"
}
!if (room_0_data) != $40d6 {
    !error "Assertion failed: room_0_data == $40d6"
}
!if (room_1_data) != $3b49 {
    !error "Assertion failed: room_1_data == $3b49"
}
!if (room_2_data) != $3bf4 {
    !error "Assertion failed: room_2_data == $3bf4"
}
!if (room_3_data) != $3eaa {
    !error "Assertion failed: room_3_data == $3eaa"
}
!if (sprite_data - level_data) != $0bc7 {
    !error "Assertion failed: sprite_data - level_data == $0bc7"
}
