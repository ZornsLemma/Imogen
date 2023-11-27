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
objectid_old_player                   = 11
objectid_old_player_accessory         = 12
objectid_player                       = 0
objectid_player_accessory             = 1
opcode_jmp                            = 76
sprite_op_flags_copy_mask             = 1
sprite_op_flags_erase                 = 2
sprite_op_flags_ignore_mask           = 4
sprite_op_flags_normal                = 0
spriteid_197                          = 197
spriteid_198                          = 198
spriteid_199                          = 199
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
spriteid_fingertip_tile_restoration   = 30
spriteid_fire1                        = 60
spriteid_fire2                        = 61
spriteid_fire3                        = 62
spriteid_fire4                        = 63
spriteid_fire5                        = 64
spriteid_fire6                        = 65
spriteid_fire7                        = 66
spriteid_fire8                        = 67
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
characters_entered                                  = $05
l0016                                               = $16
l0018                                               = $18
l0019                                               = $19
l001a                                               = $1a
l001b                                               = $1b
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
room_exit_direction                                 = $70
l0078                                               = $78
l0079                                               = $79
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
l0a30                                               = $0a30
l0a31                                               = $0a31
l0a32                                               = $0a32
level_workspace                                     = $0a6f
l0a70                                               = $0a70
l0a71                                               = $0a71
l0a72                                               = $0a72
l0a73                                               = $0a73
l0a74                                               = $0a74
l0a75                                               = $0a75
l0a76                                               = $0a76
l0a77                                               = $0a77
l0a78                                               = $0a78
l0a79                                               = $0a79
l0a7a                                               = $0a7a
l0a7b                                               = $0a7b
l0a7c                                               = $0a7c
l0a7d                                               = $0a7d
l0a7e                                               = $0a7e
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
jmp_for_update_extra_player_character               = $22dd
play_landing_sound                                  = $23a9
player_wall_collision_flag                          = $2433
l2434                                               = $2434
temp_left_offset                                    = $24d0
temp_right_offset                                   = $24d1
l24d2                                               = $24d2
temp_top_offset                                     = $2550
temp_bottom_offset                                  = $2551
l25f5                                               = $25f5
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
l38af                                               = $38af
l38b0                                               = $38b0
l38b1                                               = $38b1
object_z_order                                      = $38c2
l38c4                                               = $38c4
l38c5                                               = $38c5
l38c6                                               = $38c6
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
    !word sprite_data - level_data                                    ; 3ad5: 25 0a                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f2 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 0f 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
room_index_cheat1
    !byte 1                                                           ; 3add: 01
room_index_cheat2
    !byte 2                                                           ; 3ade: 02
level_room_data_table
    !word room_0_data                                                 ; 3adf: 73 3f                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: 1f 3b
    !word room_2_data                                                 ; 3ae3: a2 3c
    !word room_3_data                                                 ; 3ae5: 05 3e

; *************************************************************************************
; 'BABBOONACY[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $89, $8a, $89, $89, $84, $84, $85, $8a, $88, $92, $c6       ; 3ae7: 89 8a 89...

; *************************************************************************************
; 
; Level initialisation
; 
; This is called whenever a new room is entered.
; 
; *************************************************************************************
; check for level change (branch if not)
level_specific_initialisation
    lda current_level                                                 ; 3af2: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3af4: c5 51
    beq return1                                                       ; 3af6: f0 16
    lda developer_flags                                               ; 3af8: ad 03 11
    bpl developer_mode_inactive                                       ; 3afb: 10 05
    lda #$ff                                                          ; 3afd: a9 ff
    sta l0a30                                                         ; 3aff: 8d 30 0a
developer_mode_inactive
    lda l0a30                                                         ; 3b02: ad 30 0a
    cmp #$ff                                                          ; 3b05: c9 ff
    bne return1                                                       ; 3b07: d0 05
    lda #$ca                                                          ; 3b09: a9 ca
    jsr find_or_create_menu_slot_for_A                                ; 3b0b: 20 bd 2b
return1
    rts                                                               ; 3b0e: 60

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
    jsr sub_c4241                                                     ; 3b0f: 20 41 42
    jsr sub_c40a1                                                     ; 3b12: 20 a1 40
    jsr sub_c3bc3                                                     ; 3b15: 20 c3 3b
    jsr sub_c3d3a                                                     ; 3b18: 20 3a 3d
    jsr room_3_update_handler                                         ; 3b1b: 20 89 3e
    rts                                                               ; 3b1e: 60

; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 20                                                          ; 3b1f: 14                      ; initial player X cell
    !byte 15                                                          ; 3b20: 0f                      ; initial player Y cell

; ########################################
; ########################################
; ####      |                  |
; ###       |                  |
; ###       |                  |
; ###       |                  |
; ###       |                  |
; ###       |                  |
; ###       |   ############   |   #######
; ###       |   ############   |   #######
;           |                  |       ###
;           |                  |       ###
;           |                  |       ###
;           |                  |       ###
;           |         P        |       ###
; #######   |   ############   |       ###
; #######   |   ############   |       ###
; ###       |                  |       ###
; ###       |                  |       ###
; ###       |                  |       ###
; ###                                  ###
; ###                                  ###
; ########################################
; ########################################
; set ground fill tile to use
room_1_code
    lda #<ground_fill_2x2_top_left                                    ; 3b21: a9 da
    sta source_sprite_memory_low                                      ; 3b23: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3b25: a9 44
    sta source_sprite_memory_high                                     ; 3b27: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3b29: a2 00
    ldy #0                                                            ; 3b2b: a0 00
    lda #$ff                                                          ; 3b2d: a9 ff
    sta width_in_cells                                                ; 3b2f: 85 3c
    lda #2                                                            ; 3b31: a9 02
    sta height_in_cells                                               ; 3b33: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b35: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3b38: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3b3a: 20 bb 1a
; draw 4x1 rectangle at (0,2)
    ldy #2                                                            ; 3b3d: a0 02
    lda #4                                                            ; 3b3f: a9 04
    sta width_in_cells                                                ; 3b41: 85 3c
    dec height_in_cells                                               ; 3b43: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b45: 20 bb 1a
; draw 3x7 rectangle at (0,3)
    iny                                                               ; 3b48: c8
    dec width_in_cells                                                ; 3b49: c6 3c
    lda #7                                                            ; 3b4b: a9 07
    sta height_in_cells                                               ; 3b4d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b4f: 20 bb 1a
; draw 3x7 rectangle at (0,15)
    ldy #$0f                                                          ; 3b52: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3b54: 20 bb 1a
; draw 3x14 rectangle at (37,8)
    ldx #$25 ; '%'                                                    ; 3b57: a2 25
    ldy #8                                                            ; 3b59: a0 08
    lda #$0e                                                          ; 3b5b: a9 0e
    sta height_in_cells                                               ; 3b5d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b5f: 20 bb 1a
; draw 4x2 rectangle at (3,15)
    ldx #3                                                            ; 3b62: a2 03
    ldy #$0f                                                          ; 3b64: a0 0f
    lda #4                                                            ; 3b66: a9 04
    sta width_in_cells                                                ; 3b68: 85 3c
    lda #2                                                            ; 3b6a: a9 02
    sta height_in_cells                                               ; 3b6c: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b6e: 20 bb 1a
; draw 4x2 rectangle at (33,8)
    ldx #$21 ; '!'                                                    ; 3b71: a2 21
    ldy #8                                                            ; 3b73: a0 08
    jsr copy_rectangle_of_memory_to_screen                            ; 3b75: 20 bb 1a
; draw 12x2 rectangle at (14,8)
    ldx #$0e                                                          ; 3b78: a2 0e
    lda #$0c                                                          ; 3b7a: a9 0c
    sta width_in_cells                                                ; 3b7c: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b7e: 20 bb 1a
; draw 12x2 rectangle at (14,15)
    ldy #$0f                                                          ; 3b81: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3b83: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3b86: 20 90 1b
; draw rope at (10,2) length 18
    ldx #$0a                                                          ; 3b89: a2 0a
    ldy #2                                                            ; 3b8b: a0 02
    lda #$12                                                          ; 3b8d: a9 12
    jsr draw_rope                                                     ; 3b8f: 20 b9 1d
; draw rope at (29,2) length 18
    ldx #$1d                                                          ; 3b92: a2 1d
    jsr draw_rope                                                     ; 3b94: 20 b9 1d
    jsr start_room                                                    ; 3b97: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 3b9a: 20 da 12
    sta room_exit_direction                                           ; 3b9d: 85 70
    and #exit_room_left                                               ; 3b9f: 29 01
    beq room_1_check_right_exit                                       ; 3ba1: f0 07
    ldx #0                                                            ; 3ba3: a2 00
    ldy current_level                                                 ; 3ba5: a4 31
    jmp initialise_level_and_room                                     ; 3ba7: 4c 40 11

room_1_check_right_exit
    lda room_exit_direction                                           ; 3baa: a5 70
    and #exit_room_right                                              ; 3bac: 29 04
    beq room_1_game_update_loop                                       ; 3bae: f0 ea
    ldx #2                                                            ; 3bb0: a2 02
    ldy current_level                                                 ; 3bb2: a4 31
    jmp initialise_level_and_room                                     ; 3bb4: 4c 40 11

l3bb7
    !byte   0, $cc,   0, $80, $cd, $fc, $cc, $fc, $80, $cc,   6, $80  ; 3bb7: 00 cc 00...

; check for first update in room (branch if not)
sub_c3bc3
    lda update_room_first_update_flag                                 ; 3bc3: ad 2b 13
    beq c3bf8                                                         ; 3bc6: f0 30
; check for level change (branch if not)
    lda current_level                                                 ; 3bc8: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3bca: c5 51
    beq c3bdb                                                         ; 3bcc: f0 0d
    lda #1                                                            ; 3bce: a9 01
    sta l0a7b                                                         ; 3bd0: 8d 7b 0a
    sta l0a7c                                                         ; 3bd3: 8d 7c 0a
    lda #$38 ; '8'                                                    ; 3bd6: a9 38
    sta l0a7a                                                         ; 3bd8: 8d 7a 0a
c3bdb
    lda desired_room_index                                            ; 3bdb: a5 30
    cmp #1                                                            ; 3bdd: c9 01
    bne c3bf5                                                         ; 3bdf: d0 14
    lda #$cf                                                          ; 3be1: a9 cf
    sta l38af                                                         ; 3be3: 8d af 38
    lda #$c0                                                          ; 3be6: a9 c0
    sta l38c5                                                         ; 3be8: 8d c5 38
    lda #$ef                                                          ; 3beb: a9 ef
    sta object_x_low + 3                                              ; 3bed: 8d 53 09
    lda #$ff                                                          ; 3bf0: a9 ff
    sta object_direction + 3                                          ; 3bf2: 8d c1 09
c3bf5
    jmp c3c65                                                         ; 3bf5: 4c 65 3c

c3bf8
    lda l0a7c                                                         ; 3bf8: ad 7c 0a
    clc                                                               ; 3bfb: 18
    adc #2                                                            ; 3bfc: 69 02
    tay                                                               ; 3bfe: a8
    lda l3bb7,y                                                       ; 3bff: b9 b7 3b
    cmp #$80                                                          ; 3c02: c9 80
    bne c3c09                                                         ; 3c04: d0 03
    ldy l0a7b                                                         ; 3c06: ac 7b 0a
c3c09
    lda l0a7b                                                         ; 3c09: ad 7b 0a
    cmp #9                                                            ; 3c0c: c9 09
    bne c3c1a                                                         ; 3c0e: d0 0a
    lda l0a7a                                                         ; 3c10: ad 7a 0a
    cmp #$98                                                          ; 3c13: c9 98
    bne c3c4e                                                         ; 3c15: d0 37
    jmp c3c26                                                         ; 3c17: 4c 26 3c

c3c1a
    lda l0a7b                                                         ; 3c1a: ad 7b 0a
    cmp #4                                                            ; 3c1d: c9 04
    bne c3c30                                                         ; 3c1f: d0 0f
    cpy l0a7b                                                         ; 3c21: cc 7b 0a
    bne c3c4e                                                         ; 3c24: d0 28
c3c26
    ldy #1                                                            ; 3c26: a0 01
    sty l0a7b                                                         ; 3c28: 8c 7b 0a
    lda #$18                                                          ; 3c2b: a9 18
    sta l0a7d                                                         ; 3c2d: 8d 7d 0a
c3c30
    lda l0a7b                                                         ; 3c30: ad 7b 0a
    cmp #1                                                            ; 3c33: c9 01
    bne c3c4e                                                         ; 3c35: d0 17
    lda l0a7a                                                         ; 3c37: ad 7a 0a
    cmp #$38 ; '8'                                                    ; 3c3a: c9 38
    beq c3c4e                                                         ; 3c3c: f0 10
    lda l0a7d                                                         ; 3c3e: ad 7d 0a
    beq c3c49                                                         ; 3c41: f0 06
    dec l0a7d                                                         ; 3c43: ce 7d 0a
    jmp c3c4e                                                         ; 3c46: 4c 4e 3c

c3c49
    ldy #4                                                            ; 3c49: a0 04
    sty l0a7b                                                         ; 3c4b: 8c 7b 0a
c3c4e
    sty l0a7c                                                         ; 3c4e: 8c 7c 0a
    iny                                                               ; 3c51: c8
    lda l3bb7,y                                                       ; 3c52: b9 b7 3b
    clc                                                               ; 3c55: 18
    adc l0a7a                                                         ; 3c56: 6d 7a 0a
    sta l0a7a                                                         ; 3c59: 8d 7a 0a
    cmp #$99                                                          ; 3c5c: c9 99
    bcc c3c65                                                         ; 3c5e: 90 05
    lda #$98                                                          ; 3c60: a9 98
    sta l0a7a                                                         ; 3c62: 8d 7a 0a
c3c65
    lda desired_room_index                                            ; 3c65: a5 30
    cmp #1                                                            ; 3c67: c9 01
    bne return2                                                       ; 3c69: d0 36
    ldy l0a7c                                                         ; 3c6b: ac 7c 0a
    lda l3bb7,y                                                       ; 3c6e: b9 b7 3b
    sta object_spriteid + 3                                           ; 3c71: 8d ab 09
    lda l0a7a                                                         ; 3c74: ad 7a 0a
    sta object_y_low + 3                                              ; 3c77: 8d 7f 09
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 3c7a: ad 2b 13
    bne return2                                                       ; 3c7d: d0 22
    ldx #objectid_player                                              ; 3c7f: a2 00
    ldy #3                                                            ; 3c81: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 3c83: 20 e2 28
    beq c3c8d                                                         ; 3c86: f0 05
    lda #$80                                                          ; 3c88: a9 80
    sta player_wall_collision_flag                                    ; 3c8a: 8d 33 24
c3c8d
    ldx #3                                                            ; 3c8d: a2 03
    ldy #2                                                            ; 3c8f: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 3c91: 20 e2 28
    beq return2                                                       ; 3c94: f0 0b
    lda #9                                                            ; 3c96: a9 09
    sta l0a7b                                                         ; 3c98: 8d 7b 0a
    sta l0a7c                                                         ; 3c9b: 8d 7c 0a
    jsr sub_c4333                                                     ; 3c9e: 20 33 43
return2
    rts                                                               ; 3ca1: 60

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 16                                                          ; 3ca2: 10                      ; initial player X cell
    !byte 15                                                          ; 3ca3: 0f                      ; initial player Y cell

; ########################################
; ########################################
;           |          |   |   |      ####
;           |          |   |   |       ###
;           |          |   |   |       ###
;           |          |   |   |       ###
;           |          |   |   |       ###
;           |          |   |   |       ###
; #######   |          |   |   |       ###
; #######   |          |   |   |       ###
; ###       |          |   |   |
; ###       |          |   |   |
; ###       |          |   |   |
; ###       |
; ###       |     P
; ###       |   ####               #######
; ###       |   ####               #######
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ###                                  ###
; ###                                  ###
; ########################################
; ########################################
; set ground fill tile to use
room_2_code
    lda #<ground_fill_2x2_top_left                                    ; 3ca4: a9 da
    sta source_sprite_memory_low                                      ; 3ca6: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3ca8: a9 44
    sta source_sprite_memory_high                                     ; 3caa: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3cac: a2 00
    ldy #0                                                            ; 3cae: a0 00
    lda #$ff                                                          ; 3cb0: a9 ff
    sta width_in_cells                                                ; 3cb2: 85 3c
    lda #2                                                            ; 3cb4: a9 02
    sta height_in_cells                                               ; 3cb6: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3cb8: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3cbb: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3cbd: 20 bb 1a
; draw 255x1 rectangle at (36,2)
    ldx #$24 ; '$'                                                    ; 3cc0: a2 24
    ldy #2                                                            ; 3cc2: a0 02
    dec height_in_cells                                               ; 3cc4: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3cc6: 20 bb 1a
; draw 255x7 rectangle at (37,3)
    inx                                                               ; 3cc9: e8
    iny                                                               ; 3cca: c8
    lda #7                                                            ; 3ccb: a9 07
    sta height_in_cells                                               ; 3ccd: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ccf: 20 bb 1a
; draw 255x7 rectangle at (37,15)
    ldy #$0f                                                          ; 3cd2: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3cd4: 20 bb 1a
; draw 3x14 rectangle at (0,8)
    ldx #0                                                            ; 3cd7: a2 00
    ldy #8                                                            ; 3cd9: a0 08
    lda #3                                                            ; 3cdb: a9 03
    sta width_in_cells                                                ; 3cdd: 85 3c
    lda #$0e                                                          ; 3cdf: a9 0e
    sta height_in_cells                                               ; 3ce1: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ce3: 20 bb 1a
; draw 4x2 rectangle at (3,8)
    ldx #3                                                            ; 3ce6: a2 03
    inc width_in_cells                                                ; 3ce8: e6 3c
    lda #2                                                            ; 3cea: a9 02
    sta height_in_cells                                               ; 3cec: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3cee: 20 bb 1a
; draw 4x2 rectangle at (33,15)
    ldx #$21 ; '!'                                                    ; 3cf1: a2 21
    ldy #$0f                                                          ; 3cf3: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3cf5: 20 bb 1a
; draw 4x2 rectangle at (14,15)
    ldx #$0e                                                          ; 3cf8: a2 0e
    jsr copy_rectangle_of_memory_to_screen                            ; 3cfa: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3cfd: 20 90 1b
; draw rope at (10,2) length 18
    ldx #$0a                                                          ; 3d00: a2 0a
    ldy #2                                                            ; 3d02: a0 02
    lda #$12                                                          ; 3d04: a9 12
    jsr draw_rope                                                     ; 3d06: 20 b9 1d
; draw rope at (21,2) length 11
    ldx #$15                                                          ; 3d09: a2 15
    lda #$0b                                                          ; 3d0b: a9 0b
    jsr draw_rope                                                     ; 3d0d: 20 b9 1d
; draw rope at (25,2) length 11
    ldx #$19                                                          ; 3d10: a2 19
    jsr draw_rope                                                     ; 3d12: 20 b9 1d
; draw rope at (29,2) length 11
    ldx #$1d                                                          ; 3d15: a2 1d
    jsr draw_rope                                                     ; 3d17: 20 b9 1d
    jsr start_room                                                    ; 3d1a: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 3d1d: 20 da 12
    sta room_exit_direction                                           ; 3d20: 85 70
    and #exit_room_left                                               ; 3d22: 29 01
    beq room_2_check_right_exit                                       ; 3d24: f0 07
    ldx #1                                                            ; 3d26: a2 01
    ldy current_level                                                 ; 3d28: a4 31
    jmp initialise_level_and_room                                     ; 3d2a: 4c 40 11

room_2_check_right_exit
    lda room_exit_direction                                           ; 3d2d: a5 70
    and #exit_room_right                                              ; 3d2f: 29 04
    beq room_2_game_update_loop                                       ; 3d31: f0 ea
    ldx #3                                                            ; 3d33: a2 03
    ldy current_level                                                 ; 3d35: a4 31
    jmp initialise_level_and_room                                     ; 3d37: 4c 40 11

; check for first update in room (branch if not)
sub_c3d3a
    lda update_room_first_update_flag                                 ; 3d3a: ad 2b 13
    beq c3d80                                                         ; 3d3d: f0 41
; check for level change (branch if not)
    lda current_level                                                 ; 3d3f: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3d41: c5 51
    beq c3d4a                                                         ; 3d43: f0 05
    lda #0                                                            ; 3d45: a9 00
    sta l0a7e                                                         ; 3d47: 8d 7e 0a
c3d4a
    lda desired_room_index                                            ; 3d4a: a5 30
    cmp #2                                                            ; 3d4c: c9 02
    bne c3d7d                                                         ; 3d4e: d0 2d
    lda #$cf                                                          ; 3d50: a9 cf
    sta l38af                                                         ; 3d52: 8d af 38
    lda #$d6                                                          ; 3d55: a9 d6
    sta l38b0                                                         ; 3d57: 8d b0 38
    lda #$d7                                                          ; 3d5a: a9 d7
    sta l38b1                                                         ; 3d5c: 8d b1 38
    lda #$af                                                          ; 3d5f: a9 af
    sta object_x_low + 3                                              ; 3d61: 8d 53 09
    lda #$ff                                                          ; 3d64: a9 ff
    sta object_direction + 3                                          ; 3d66: 8d c1 09
    lda #$cf                                                          ; 3d69: a9 cf
    sta object_x_low + 4                                              ; 3d6b: 8d 54 09
    lda #$ff                                                          ; 3d6e: a9 ff
    sta object_direction + 4                                          ; 3d70: 8d c2 09
    lda #$ef                                                          ; 3d73: a9 ef
    sta object_x_low + 5                                              ; 3d75: 8d 55 09
    lda #$ff                                                          ; 3d78: a9 ff
    sta object_direction + 5                                          ; 3d7a: 8d c3 09
c3d7d
    jmp c3d8f                                                         ; 3d7d: 4c 8f 3d

c3d80
    inc l0a7e                                                         ; 3d80: ee 7e 0a
    lda l0a7e                                                         ; 3d83: ad 7e 0a
    cmp #$3c ; '<'                                                    ; 3d86: c9 3c
    bcc c3d8f                                                         ; 3d88: 90 05
    lda #0                                                            ; 3d8a: a9 00
    sta l0a7e                                                         ; 3d8c: 8d 7e 0a
c3d8f
    lda desired_room_index                                            ; 3d8f: a5 30
    cmp #2                                                            ; 3d91: c9 02
    bne return3                                                       ; 3d93: d0 1e
    lda l0a7e                                                         ; 3d95: ad 7e 0a
    ldx #3                                                            ; 3d98: a2 03
    jsr sub_c3db4                                                     ; 3d9a: 20 b4 3d
    lda l0a7e                                                         ; 3d9d: ad 7e 0a
    clc                                                               ; 3da0: 18
    adc #$28 ; '('                                                    ; 3da1: 69 28
    ldx #4                                                            ; 3da3: a2 04
    jsr sub_c3db4                                                     ; 3da5: 20 b4 3d
    lda l0a7e                                                         ; 3da8: ad 7e 0a
    clc                                                               ; 3dab: 18
    adc #$32 ; '2'                                                    ; 3dac: 69 32
    ldx #5                                                            ; 3dae: a2 05
    jsr sub_c3db4                                                     ; 3db0: 20 b4 3d
return3
    rts                                                               ; 3db3: 60

sub_c3db4
    cmp #$3c ; '<'                                                    ; 3db4: c9 3c
    bcc c3dbb                                                         ; 3db6: 90 03
    sec                                                               ; 3db8: 38
    sbc #$3c ; '<'                                                    ; 3db9: e9 3c
c3dbb
    tay                                                               ; 3dbb: a8
    asl                                                               ; 3dbc: 0a
    asl                                                               ; 3dbd: 0a
    sta l0070                                                         ; 3dbe: 85 70
    lda #$cc                                                          ; 3dc0: a9 cc
    sta object_spriteid,x                                             ; 3dc2: 9d a8 09
    lda #$60 ; '`'                                                    ; 3dc5: a9 60
    sec                                                               ; 3dc7: 38
    sbc l0070                                                         ; 3dc8: e5 70
    cpy #$0a                                                          ; 3dca: c0 0a
    bcc c3de7                                                         ; 3dcc: 90 19
    lda #$38 ; '8'                                                    ; 3dce: a9 38
    cpy #$1e                                                          ; 3dd0: c0 1e
    bcc c3de7                                                         ; 3dd2: 90 13
    tya                                                               ; 3dd4: 98
    sec                                                               ; 3dd5: 38
    sbc #$1e                                                          ; 3dd6: e9 1e
    asl                                                               ; 3dd8: 0a
    asl                                                               ; 3dd9: 0a
    sta l0070                                                         ; 3dda: 85 70
    lda #$38 ; '8'                                                    ; 3ddc: a9 38
    clc                                                               ; 3dde: 18
    adc l0070                                                         ; 3ddf: 65 70
    cpy #$28 ; '('                                                    ; 3de1: c0 28
    bcc c3de7                                                         ; 3de3: 90 02
    lda #$60 ; '`'                                                    ; 3de5: a9 60
c3de7
    sta object_y_low,x                                                ; 3de7: 9d 7c 09
    and #7                                                            ; 3dea: 29 07
    beq c3df3                                                         ; 3dec: f0 05
    lda #$cd                                                          ; 3dee: a9 cd
    sta object_spriteid,x                                             ; 3df0: 9d a8 09
; check for first update in room (branch if so)
c3df3
    lda update_room_first_update_flag                                 ; 3df3: ad 2b 13
    bne return4                                                       ; 3df6: d0 0c
    ldy #0                                                            ; 3df8: a0 00
    jsr test_for_collision_between_objects_x_and_y                    ; 3dfa: 20 e2 28
    beq return4                                                       ; 3dfd: f0 05
    lda #$80                                                          ; 3dff: a9 80
    sta player_wall_collision_flag                                    ; 3e01: 8d 33 24
return4
    rts                                                               ; 3e04: 60

; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 4                                                           ; 3e05: 04                      ; initial player X cell
    !byte 15                                                          ; 3e06: 0f                      ; initial player Y cell

; ########################################
; ########################################
; ####      |                         ####
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ###       |   ##########################
; ###       |   ##########################
;           |                          ###
;           |                          ###
;           |                          ###
;           |                          ###
;     P     |                          ###
; #######   |   ##########################
; #######   |   ##########################
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ###                                  ###
; ###                                  ###
; ########################################
; ########################################
; set ground fill tile to use
room_3_code
    lda #<ground_fill_2x2_top_left                                    ; 3e07: a9 da
    sta source_sprite_memory_low                                      ; 3e09: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3e0b: a9 44
    sta source_sprite_memory_high                                     ; 3e0d: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3e0f: a2 00
    ldy #0                                                            ; 3e11: a0 00
    lda #$ff                                                          ; 3e13: a9 ff
    sta width_in_cells                                                ; 3e15: 85 3c
    lda #2                                                            ; 3e17: a9 02
    sta height_in_cells                                               ; 3e19: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e1b: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3e1e: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3e20: 20 bb 1a
; draw 4x1 rectangle at (0,2)
    ldy #2                                                            ; 3e23: a0 02
    lda #4                                                            ; 3e25: a9 04
    sta width_in_cells                                                ; 3e27: 85 3c
    dec height_in_cells                                               ; 3e29: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e2b: 20 bb 1a
; draw 4x1 rectangle at (36,2)
    ldx #$24 ; '$'                                                    ; 3e2e: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 3e30: 20 bb 1a
; draw 3x7 rectangle at (0,3)
    ldx #0                                                            ; 3e33: a2 00
    iny                                                               ; 3e35: c8
    dec width_in_cells                                                ; 3e36: c6 3c
    lda #7                                                            ; 3e38: a9 07
    sta height_in_cells                                               ; 3e3a: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e3c: 20 bb 1a
; draw 3x7 rectangle at (0,15)
    ldy #$0f                                                          ; 3e3f: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3e41: 20 bb 1a
; draw 3x19 rectangle at (37,3)
    ldx #$25 ; '%'                                                    ; 3e44: a2 25
    ldy #3                                                            ; 3e46: a0 03
    lda #$13                                                          ; 3e48: a9 13
    sta height_in_cells                                               ; 3e4a: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e4c: 20 bb 1a
; draw 4x2 rectangle at (3,15)
    ldx #3                                                            ; 3e4f: a2 03
    ldy #$0f                                                          ; 3e51: a0 0f
    lda #4                                                            ; 3e53: a9 04
    sta width_in_cells                                                ; 3e55: 85 3c
    lda #2                                                            ; 3e57: a9 02
    sta height_in_cells                                               ; 3e59: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e5b: 20 bb 1a
; draw 23x2 rectangle at (14,15)
    ldx #$0e                                                          ; 3e5e: a2 0e
    lda #$17                                                          ; 3e60: a9 17
    sta width_in_cells                                                ; 3e62: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3e64: 20 bb 1a
; draw 23x2 rectangle at (14,8)
    ldy #8                                                            ; 3e67: a0 08
    jsr copy_rectangle_of_memory_to_screen                            ; 3e69: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3e6c: 20 90 1b
; draw rope at (10,2) length 18
    ldx #$0a                                                          ; 3e6f: a2 0a
    ldy #2                                                            ; 3e71: a0 02
    lda #$12                                                          ; 3e73: a9 12
    jsr draw_rope                                                     ; 3e75: 20 b9 1d
    jsr start_room                                                    ; 3e78: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 3e7b: 20 da 12
    and #exit_room_left                                               ; 3e7e: 29 01
    beq room_3_game_update_loop                                       ; 3e80: f0 f9
    ldx #2                                                            ; 3e82: a2 02
    ldy current_level                                                 ; 3e84: a4 31
    jmp initialise_level_and_room                                     ; 3e86: 4c 40 11

room_3_update_handler
    lda #3                                                            ; 3e89: a9 03
    sta currently_updating_logic_for_room_index                       ; 3e8b: 8d ba 1a
    ldx #$1d                                                          ; 3e8e: a2 1d
    lda #4                                                            ; 3e90: a9 04
    sta temp_sprite_x_offset                                          ; 3e92: 85 3a
    ldy #$0f                                                          ; 3e94: a0 0f
    lda #3                                                            ; 3e96: a9 03
    jsr update_level_completion                                       ; 3e98: 20 10 1a
    ldx #3                                                            ; 3e9b: a2 03
    ldy #6                                                            ; 3e9d: a0 06
    lda #5                                                            ; 3e9f: a9 05
    jsr update_brazier_and_fire                                       ; 3ea1: 20 88 19
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 3ea4: ad 2b 13
    beq c3ee1                                                         ; 3ea7: f0 38
; check for level change (branch if not)
    lda current_level                                                 ; 3ea9: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3eab: c5 51
    beq c3eb9                                                         ; 3ead: f0 0a
    lda l0a32                                                         ; 3eaf: ad 32 0a
    beq c3eb9                                                         ; 3eb2: f0 05
    lda #$ff                                                          ; 3eb4: a9 ff
    sta l0a32                                                         ; 3eb6: 8d 32 0a
c3eb9
    lda desired_room_index                                            ; 3eb9: a5 30
    cmp #3                                                            ; 3ebb: c9 03
    bne c3ede                                                         ; 3ebd: d0 1f
    ldx #<envelope1                                                   ; 3ebf: a2 bc
    ldy #>envelope1                                                   ; 3ec1: a0 44
    jsr define_envelope                                               ; 3ec3: 20 5e 39
    ldx #$11                                                          ; 3ec6: a2 11
    ldy #$0f                                                          ; 3ec8: a0 0f
    lda #$d2                                                          ; 3eca: a9 d2
    jsr draw_sprite_a_at_cell_xy                                      ; 3ecc: 20 4c 1f
    lda #4                                                            ; 3ecf: a9 04
    jsr set_object_position_from_cell_xy                              ; 3ed1: 20 5d 1f
    lda #$cf                                                          ; 3ed4: a9 cf
    sta l38b0                                                         ; 3ed6: 8d b0 38
    lda #$c0                                                          ; 3ed9: a9 c0
    sta l38c6                                                         ; 3edb: 8d c6 38
c3ede
    jmp c3f33                                                         ; 3ede: 4c 33 3f

c3ee1
    lda l0a32                                                         ; 3ee1: ad 32 0a
    bmi c3f33                                                         ; 3ee4: 30 4d
    bne c3ef7                                                         ; 3ee6: d0 0f
    lda desired_room_index                                            ; 3ee8: a5 30
    cmp #3                                                            ; 3eea: c9 03
    bne c3f33                                                         ; 3eec: d0 45
    ldx #2                                                            ; 3eee: a2 02
    ldy #4                                                            ; 3ef0: a0 04
    jsr test_for_collision_between_objects_x_and_y                    ; 3ef2: 20 e2 28
    beq c3f33                                                         ; 3ef5: f0 3c
c3ef7
    ldy l0a32                                                         ; 3ef7: ac 32 0a
    iny                                                               ; 3efa: c8
    sty l0a32                                                         ; 3efb: 8c 32 0a
    cpy #2                                                            ; 3efe: c0 02
    bcc c3f33                                                         ; 3f00: 90 31
    ldy #$ff                                                          ; 3f02: a0 ff
    sty l0a32                                                         ; 3f04: 8c 32 0a
    lda desired_room_index                                            ; 3f07: a5 30
    cmp #3                                                            ; 3f09: c9 03
    bne c3f33                                                         ; 3f0b: d0 26
    ldx #$11                                                          ; 3f0d: a2 11
    ldy #$0a                                                          ; 3f0f: a0 0a
    lda #1                                                            ; 3f11: a9 01
    sta width_in_cells                                                ; 3f13: 85 3c
    lda #5                                                            ; 3f15: a9 05
    sta height_in_cells                                               ; 3f17: 85 3d
    lda #collision_map_none                                           ; 3f19: a9 00
    sta value_to_write_to_collision_map                               ; 3f1b: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3f1d: 20 44 1e
    jmp c3f33                                                         ; 3f20: 4c 33 3f

    !byte $a9,   0, $a2, $d2, $a0, $44, $20, $f6, $38, $a2, $ca, $a0  ; 3f23: a9 00 a2...
    !byte $44, $20, $f6, $38                                          ; 3f2f: 44 20 f6...

c3f33
    lda desired_room_index                                            ; 3f33: a5 30
    cmp #3                                                            ; 3f35: c9 03
    bne return5                                                       ; 3f37: d0 36
    ldy l0a32                                                         ; 3f39: ac 32 0a
    bpl c3f40                                                         ; 3f3c: 10 02
    ldy #2                                                            ; 3f3e: a0 02
c3f40
    lda l3f70,y                                                       ; 3f40: b9 70 3f
    sta object_spriteid + 4                                           ; 3f43: 8d ac 09
    ldx #$11                                                          ; 3f46: a2 11
    ldy #$0a                                                          ; 3f48: a0 0a
    lda #1                                                            ; 3f4a: a9 01
    sta width_in_cells                                                ; 3f4c: 85 3c
    lda #5                                                            ; 3f4e: a9 05
    sta height_in_cells                                               ; 3f50: 85 3d
    lda #collision_map_solid_rock                                     ; 3f52: a9 03
    sta value_to_write_to_collision_map                               ; 3f54: 85 3e
    lda l0a32                                                         ; 3f56: ad 32 0a
    bpl c3f65                                                         ; 3f59: 10 0a
    ldy #$0e                                                          ; 3f5b: a0 0e
    lda #6                                                            ; 3f5d: a9 06
    sta width_in_cells                                                ; 3f5f: 85 3c
    lda #1                                                            ; 3f61: a9 01
    sta height_in_cells                                               ; 3f63: 85 3d
c3f65
    jsr read_collision_map_value_for_xy                               ; 3f65: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3f68: c5 3e
    beq return5                                                       ; 3f6a: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3f6c: 20 44 1e
return5
    rts                                                               ; 3f6f: 60

l3f70
    !byte $d3, $d4, $d5                                               ; 3f70: d3 d4 d5
; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 20                                                          ; 3f73: 14                      ; initial player X cell
    !byte 22                                                          ; 3f74: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####      |                         ####
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ########  |  ###########################
; ########  |  ###########################
; ###       |                  |
; ###       |                  |
; ###       |                  |
; ###       |                  |
; ###       |                  |
; ###       |                  |   #######
; ###       |                  |   #######
; ###       |                  |       ###
; ###       |                  |       ###
; ###       |                  |       ###
; ###                                  ###
; ###                 P                ###
; ########################################
; ########################################
; set ground fill tile to use
room_0_code
    lda #<ground_fill_2x2_top_left                                    ; 3f75: a9 da
    sta source_sprite_memory_low                                      ; 3f77: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3f79: a9 44
    sta source_sprite_memory_high                                     ; 3f7b: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3f7d: a2 00
    ldy #0                                                            ; 3f7f: a0 00
    lda #$ff                                                          ; 3f81: a9 ff
    sta width_in_cells                                                ; 3f83: 85 3c
    lda #2                                                            ; 3f85: a9 02
    sta height_in_cells                                               ; 3f87: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f89: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3f8c: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3f8e: 20 bb 1a
; draw 4x1 rectangle at (0,2)
    ldy #2                                                            ; 3f91: a0 02
    lda #4                                                            ; 3f93: a9 04
    sta width_in_cells                                                ; 3f95: 85 3c
    dec height_in_cells                                               ; 3f97: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f99: 20 bb 1a
; draw 4x1 rectangle at (36,2)
    ldx #$24 ; '$'                                                    ; 3f9c: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 3f9e: 20 bb 1a
; draw 3x19 rectangle at (0,3)
    ldx #0                                                            ; 3fa1: a2 00
    iny                                                               ; 3fa3: c8
    dec width_in_cells                                                ; 3fa4: c6 3c
    lda #$13                                                          ; 3fa6: a9 13
    sta height_in_cells                                               ; 3fa8: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3faa: 20 bb 1a
; draw 3x5 rectangle at (37,3)
    ldx #$25 ; '%'                                                    ; 3fad: a2 25
    lda #5                                                            ; 3faf: a9 05
    sta height_in_cells                                               ; 3fb1: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fb3: 20 bb 1a
; draw 3x5 rectangle at (37,17)
    ldy #$11                                                          ; 3fb6: a0 11
    jsr copy_rectangle_of_memory_to_screen                            ; 3fb8: 20 bb 1a
; draw 5x2 rectangle at (3,8)
    ldx #3                                                            ; 3fbb: a2 03
    ldy #8                                                            ; 3fbd: a0 08
    lda #5                                                            ; 3fbf: a9 05
    sta width_in_cells                                                ; 3fc1: 85 3c
    lda #2                                                            ; 3fc3: a9 02
    sta height_in_cells                                               ; 3fc5: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fc7: 20 bb 1a
; draw 255x2 rectangle at (13,8)
    ldx #$0d                                                          ; 3fca: a2 0d
    lda #$ff                                                          ; 3fcc: a9 ff
    sta width_in_cells                                                ; 3fce: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3fd0: 20 bb 1a
; draw 255x2 rectangle at (33,15)
    ldx #$21 ; '!'                                                    ; 3fd3: a2 21
    ldy #$0f                                                          ; 3fd5: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3fd7: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3fda: 20 90 1b
; draw rope at (10,2) length 18
    ldx #$0a                                                          ; 3fdd: a2 0a
    ldy #2                                                            ; 3fdf: a0 02
    lda #$12                                                          ; 3fe1: a9 12
    jsr draw_rope                                                     ; 3fe3: 20 b9 1d
; draw rope at (29,10) length 10
    ldx #$1d                                                          ; 3fe6: a2 1d
    ldy #$0a                                                          ; 3fe8: a0 0a
    lda #$0a                                                          ; 3fea: a9 0a
    jsr draw_rope                                                     ; 3fec: 20 b9 1d
    lda #0                                                            ; 3fef: a9 00
    sta l0019                                                         ; 3ff1: 85 19
    sta l001b                                                         ; 3ff3: 85 1b
    lda #$d0                                                          ; 3ff5: a9 d0
    sta l0016                                                         ; 3ff7: 85 16
    lda #$68 ; 'h'                                                    ; 3ff9: a9 68
    sta l0018                                                         ; 3ffb: 85 18
    lda #$3e ; '>'                                                    ; 3ffd: a9 3e
    sta l001a                                                         ; 3fff: 85 1a
    ldx #3                                                            ; 4001: a2 03
loop_c4003
    jsr sprite_op                                                     ; 4003: 20 8d 13
    lda l0018                                                         ; 4006: a5 18
    clc                                                               ; 4008: 18
    adc #8                                                            ; 4009: 69 08
    sta l0018                                                         ; 400b: 85 18
    dex                                                               ; 400d: ca
    bne loop_c4003                                                    ; 400e: d0 f3
    lda #$6c ; 'l'                                                    ; 4010: a9 6c
    sta l0018                                                         ; 4012: 85 18
    lda l001a                                                         ; 4014: a5 1a
    sec                                                               ; 4016: 38
    sbc #6                                                            ; 4017: e9 06
    sta l001a                                                         ; 4019: 85 1a
    ldx #2                                                            ; 401b: a2 02
loop_c401d
    jsr sprite_op                                                     ; 401d: 20 8d 13
    lda l0018                                                         ; 4020: a5 18
    clc                                                               ; 4022: 18
    adc #8                                                            ; 4023: 69 08
    sta l0018                                                         ; 4025: 85 18
    dex                                                               ; 4027: ca
    bne loop_c401d                                                    ; 4028: d0 f3
    lda #$70 ; 'p'                                                    ; 402a: a9 70
    sta l0018                                                         ; 402c: 85 18
    lda l001a                                                         ; 402e: a5 1a
    sec                                                               ; 4030: 38
    sbc #6                                                            ; 4031: e9 06
    sta l001a                                                         ; 4033: 85 1a
    jsr sprite_op                                                     ; 4035: 20 8d 13
    jsr start_room                                                    ; 4038: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 403b: 20 da 12
    and #exit_room_right                                              ; 403e: 29 04
    beq room_0_game_update_loop                                       ; 4040: f0 f9
    ldx #1                                                            ; 4042: a2 01
    ldy current_level                                                 ; 4044: a4 31
    jmp initialise_level_and_room                                     ; 4046: 4c 40 11

l4049
    !byte   0, $cd, $fc, $cc, $fc, $cd, $fc, $cc, $fc, $cd, $fc, $cc  ; 4049: 00 cd fc...
    !byte $fc, $cd, $fc, $cc, $fc, $cd, $fc, $cc, $fc, $cc,   0, $ce  ; 4055: fc cd fc...
    !byte   0, $ce,   0, $80, $cc,   0, $cc,   0, $cd,   4, $cc,   4  ; 4061: 00 ce 00...
    !byte $cd,   4, $cc,   4, $cd,   4, $cc,   4, $cd,   4, $cc,   4  ; 406d: cd 04 cc...
    !byte $cd,   4, $cc,   4, $cc,   0, $80, $cc,   0, $80, $ce,   0  ; 4079: cd 04 cc...
    !byte $ce,   0, $80, $cc,   0, $80                                ; 4085: ce 00 80...
l408b
    !byte   0,   8,   1, $10,   3, $18,   6, $20, $0a, $28, $10, $2f  ; 408b: 00 08 01...
    !byte $18                                                         ; 4097: 18
    !text "6", '"', "<-A9DF"                                          ; 4098: 36 22 3c...
    !byte 0                                                           ; 40a0: 00

; check for first update in room (branch if not)
sub_c40a1
    lda update_room_first_update_flag                                 ; 40a1: ad 2b 13
    beq c40d1                                                         ; 40a4: f0 2b
; check for level change (branch if not)
    lda current_level                                                 ; 40a6: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 40a8: c5 51
    beq c40b9                                                         ; 40aa: f0 0d
    lda #$3f ; '?'                                                    ; 40ac: a9 3f
    sta l0a31                                                         ; 40ae: 8d 31 0a
    sta l0a77                                                         ; 40b1: 8d 77 0a
    lda #$68 ; 'h'                                                    ; 40b4: a9 68
    sta l0a78                                                         ; 40b6: 8d 78 0a
c40b9
    lda desired_room_index                                            ; 40b9: a5 30
    cmp #0                                                            ; 40bb: c9 00
    bne c40ce                                                         ; 40bd: d0 0f
    lda #$cf                                                          ; 40bf: a9 cf
    sta l38af                                                         ; 40c1: 8d af 38
    lda #$c0                                                          ; 40c4: a9 c0
    sta l38c5                                                         ; 40c6: 8d c5 38
    lda #$50 ; 'P'                                                    ; 40c9: a9 50
    sta object_x_low + 3                                              ; 40cb: 8d 53 09
c40ce
    jmp c417a                                                         ; 40ce: 4c 7a 41

c40d1
    lda l0a77                                                         ; 40d1: ad 77 0a
    clc                                                               ; 40d4: 18
    adc #2                                                            ; 40d5: 69 02
    tay                                                               ; 40d7: a8
    lda l4049,y                                                       ; 40d8: b9 49 40
    cmp #$80                                                          ; 40db: c9 80
    bne c40e2                                                         ; 40dd: d0 03
    ldy l0a31                                                         ; 40df: ac 31 0a
c40e2
    lda l0a31                                                         ; 40e2: ad 31 0a
    cmp #1                                                            ; 40e5: c9 01
    bne c40fd                                                         ; 40e7: d0 14
    cpy l0a31                                                         ; 40e9: cc 31 0a
    bne c4166                                                         ; 40ec: d0 78
    ldy #$1c                                                          ; 40ee: a0 1c
    lda #$37 ; '7'                                                    ; 40f0: a9 37
    sta l0a31                                                         ; 40f2: 8d 31 0a
    lda #$ff                                                          ; 40f5: a9 ff
    sta l0a79                                                         ; 40f7: 8d 79 0a
    jmp c4166                                                         ; 40fa: 4c 66 41

c40fd
    lda l0a31                                                         ; 40fd: ad 31 0a
    cmp #$37 ; '7'                                                    ; 4100: c9 37
    bne c411e                                                         ; 4102: d0 1a
    cpy l0a31                                                         ; 4104: cc 31 0a
    bne c4166                                                         ; 4107: d0 5d
    lda desired_room_index                                            ; 4109: a5 30
    cmp #0                                                            ; 410b: c9 00
    bne c4166                                                         ; 410d: d0 57
    lda #1                                                            ; 410f: a9 01
    sta l0a79                                                         ; 4111: 8d 79 0a
    ldy #$3a ; ':'                                                    ; 4114: a0 3a
    lda #$3f ; '?'                                                    ; 4116: a9 3f
    sta l0a31                                                         ; 4118: 8d 31 0a
    jmp c4166                                                         ; 411b: 4c 66 41

c411e
    ldx l0a79                                                         ; 411e: ae 79 0a
    beq c4142                                                         ; 4121: f0 1f
    inx                                                               ; 4123: e8
    inx                                                               ; 4124: e8
    stx l0a79                                                         ; 4125: 8e 79 0a
    lda l408b,x                                                       ; 4128: bd 8b 40
    cmp #0                                                            ; 412b: c9 00
    bne c4166                                                         ; 412d: d0 37
    lda #0                                                            ; 412f: a9 00
    sta l0a79                                                         ; 4131: 8d 79 0a
    lda desired_room_index                                            ; 4134: a5 30
    cmp #0                                                            ; 4136: c9 00
    bne c4166                                                         ; 4138: d0 2c
    lda #0                                                            ; 413a: a9 00
    sta object_spriteid + 2                                           ; 413c: 8d aa 09
    jmp c4166                                                         ; 413f: 4c 66 41

c4142
    lda desired_room_index                                            ; 4142: a5 30
    cmp #0                                                            ; 4144: c9 00
    bne c4166                                                         ; 4146: d0 1e
    lda l0a30                                                         ; 4148: ad 30 0a
    cmp #$ff                                                          ; 414b: c9 ff
    beq c4166                                                         ; 414d: f0 17
    ora #0                                                            ; 414f: 09 00
    beq c4161                                                         ; 4151: f0 0e
    lda desired_room_index                                            ; 4153: a5 30
    cmp l0a75                                                         ; 4155: cd 75 0a
    beq c4166                                                         ; 4158: f0 0c
    lda level_workspace                                               ; 415a: ad 6f 0a
    cmp #4                                                            ; 415d: c9 04
    bcc c4166                                                         ; 415f: 90 05
c4161
    ldy #1                                                            ; 4161: a0 01
    sty l0a31                                                         ; 4163: 8c 31 0a
c4166
    sty l0a77                                                         ; 4166: 8c 77 0a
    iny                                                               ; 4169: c8
    lda l4049,y                                                       ; 416a: b9 49 40
    clc                                                               ; 416d: 18
    adc l0a78                                                         ; 416e: 6d 78 0a
    sta l0a78                                                         ; 4171: 8d 78 0a
    jmp c417a                                                         ; 4174: 4c 7a 41

c4177
    jmp return6                                                       ; 4177: 4c 2c 42

c417a
    lda desired_room_index                                            ; 417a: a5 30
    cmp #0                                                            ; 417c: c9 00
    bne c4177                                                         ; 417e: d0 f7
    ldy l0a77                                                         ; 4180: ac 77 0a
    lda l4049,y                                                       ; 4183: b9 49 40
    sta object_spriteid + 3                                           ; 4186: 8d ab 09
    lda l0a78                                                         ; 4189: ad 78 0a
    sta object_y_low + 3                                              ; 418c: 8d 7f 09
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 418f: ad 2b 13
    bne c41a2                                                         ; 4192: d0 0e
    ldx #objectid_player                                              ; 4194: a2 00
    ldy #3                                                            ; 4196: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 4198: 20 e2 28
    beq c41a2                                                         ; 419b: f0 05
    lda #$80                                                          ; 419d: a9 80
    sta player_wall_collision_flag                                    ; 419f: 8d 33 24
c41a2
    ldx l0a79                                                         ; 41a2: ae 79 0a
    beq c4177                                                         ; 41a5: f0 d0
    lda #$c9                                                          ; 41a7: a9 c9
    sta l38ae                                                         ; 41a9: 8d ae 38
    lda #$40 ; '@'                                                    ; 41ac: a9 40
    sta l38c4                                                         ; 41ae: 8d c4 38
    lda object_x_low + 3                                              ; 41b1: ad 53 09
    sta object_x_low + 2                                              ; 41b4: 8d 52 09
    lda #0                                                            ; 41b7: a9 00
    sta object_x_high + 2                                             ; 41b9: 8d 68 09
    lda object_y_low + 3                                              ; 41bc: ad 7f 09
    sta object_y_low + 2                                              ; 41bf: 8d 7e 09
    lda #0                                                            ; 41c2: a9 00
    sta object_y_high + 2                                             ; 41c4: 8d 94 09
    lda #1                                                            ; 41c7: a9 01
    sta object_direction + 2                                          ; 41c9: 8d c0 09
    lda #$d1                                                          ; 41cc: a9 d1
    sta object_spriteid + 2                                           ; 41ce: 8d aa 09
    cpx #$ff                                                          ; 41d1: e0 ff
    beq c4177                                                         ; 41d3: f0 a2
    lda l408b,x                                                       ; 41d5: bd 8b 40
    clc                                                               ; 41d8: 18
    adc #$58 ; 'X'                                                    ; 41d9: 69 58
    sta object_x_low + 2                                              ; 41db: 8d 52 09
    inx                                                               ; 41de: e8
    lda l408b,x                                                       ; 41df: bd 8b 40
    clc                                                               ; 41e2: 18
    adc #$68 ; 'h'                                                    ; 41e3: 69 68
    sta object_y_low + 2                                              ; 41e5: 8d 7e 09
    lda #$d0                                                          ; 41e8: a9 d0
    sta object_spriteid + 2                                           ; 41ea: 8d aa 09
    inx                                                               ; 41ed: e8
    lda l408b,x                                                       ; 41ee: bd 8b 40
    cmp #0                                                            ; 41f1: c9 00
    bne c41fa                                                         ; 41f3: d0 05
    lda #$cb                                                          ; 41f5: a9 cb
    sta object_spriteid + 2                                           ; 41f7: 8d aa 09
; check for first update in room (branch if so)
c41fa
    lda update_room_first_update_flag                                 ; 41fa: ad 2b 13
    bne return6                                                       ; 41fd: d0 2d
    ldx #objectid_old_player                                          ; 41ff: a2 0b
    ldy #$0d                                                          ; 4201: a0 0d
    jsr test_for_collision_between_objects_x_and_y                    ; 4203: 20 e2 28
    beq c421d                                                         ; 4206: f0 15
    lda #$ca                                                          ; 4208: a9 ca
    jsr find_or_create_menu_slot_for_A                                ; 420a: 20 bd 2b
    lda #0                                                            ; 420d: a9 00
    sta object_spriteid + 2                                           ; 420f: 8d aa 09
    sta l0a79                                                         ; 4212: 8d 79 0a
    lda #$ff                                                          ; 4215: a9 ff
    sta l0a30                                                         ; 4217: 8d 30 0a
    jmp return6                                                       ; 421a: 4c 2c 42

c421d
    lda object_spriteid + 2                                           ; 421d: ad aa 09
    cmp #$cb                                                          ; 4220: c9 cb
    bne return6                                                       ; 4222: d0 08
    jsr sub_c4333                                                     ; 4224: 20 33 43
    lda #0                                                            ; 4227: a9 00
    sta l0a30                                                         ; 4229: 8d 30 0a
return6
    rts                                                               ; 422c: 60

l422d
    !byte   0,   0,   0,   6, $fc,   6, $ff,   6,   2,   4,   4,   2  ; 422d: 00 00 00...
    !byte   6, $80,   0,   8, $80,   0,   0, $80                      ; 4239: 06 80 00...

; check for first update in room (branch if not)
sub_c4241
    lda update_room_first_update_flag                                 ; 4241: ad 2b 13
    beq c42a1                                                         ; 4244: f0 5b
    lda #$ca                                                          ; 4246: a9 ca
    sta toolbar_collectable_spriteids+1                               ; 4248: 8d e9 2e
    lda #$c8                                                          ; 424b: a9 c8
    sta collectable_spriteids+1                                       ; 424d: 8d ee 2e
    sta five_byte_table_paired_with_collectable_sprite_ids + 1        ; 4250: 8d f3 2e
    ldx #<envelope2                                                   ; 4253: a2 9e
    ldy #>envelope2                                                   ; 4255: a0 44
    jsr define_envelope                                               ; 4257: 20 5e 39
; check for level change (branch if not)
    lda current_level                                                 ; 425a: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 425c: c5 51
    beq c426c                                                         ; 425e: f0 0c
    lda l0a30                                                         ; 4260: ad 30 0a
    cmp #$ff                                                          ; 4263: c9 ff
    beq c426c                                                         ; 4265: f0 05
    lda #0                                                            ; 4267: a9 00
    sta l0a30                                                         ; 4269: 8d 30 0a
c426c
    lda desired_room_index                                            ; 426c: a5 30
    cmp l0a75                                                         ; 426e: cd 75 0a
    bne c4299                                                         ; 4271: d0 26
    lda l0a30                                                         ; 4273: ad 30 0a
    beq c4299                                                         ; 4276: f0 21
    cmp #$ff                                                          ; 4278: c9 ff
    beq c4299                                                         ; 427a: f0 1d
    jsr sub_c4464                                                     ; 427c: 20 64 44
loop_c427f
    lda desired_room_index                                            ; 427f: a5 30
    cmp l0a75                                                         ; 4281: cd 75 0a
    bne c4299                                                         ; 4284: d0 13
    lda level_workspace                                               ; 4286: ad 6f 0a
    beq c4299                                                         ; 4289: f0 0e
    dec level_workspace                                               ; 428b: ce 6f 0a
    ldx #2                                                            ; 428e: a2 02
    jsr l20f7                                                         ; 4290: 20 f7 20
    jsr sub_c4373                                                     ; 4293: 20 73 43
    jmp loop_c427f                                                    ; 4296: 4c 7f 42

c4299
    lda #0                                                            ; 4299: a9 00
    sta object_spriteid_old + 2                                       ; 429b: 8d b5 09
c429e
    jmp return7                                                       ; 429e: 4c 32 43

c42a1
    lda object_spriteid_old + 2                                       ; 42a1: ad b5 09
    sta l4463                                                         ; 42a4: 8d 63 44
    lda l0a30                                                         ; 42a7: ad 30 0a
    beq c429e                                                         ; 42aa: f0 f2
    bmi c42c0                                                         ; 42ac: 30 12
    lda desired_room_index                                            ; 42ae: a5 30
    cmp l0a75                                                         ; 42b0: cd 75 0a
    beq c4310                                                         ; 42b3: f0 5b
    lda level_workspace                                               ; 42b5: ad 6f 0a
    bmi c429e                                                         ; 42b8: 30 e4
    inc level_workspace                                               ; 42ba: ee 6f 0a
    jmp return7                                                       ; 42bd: 4c 32 43

c42c0
    lda #$ca                                                          ; 42c0: a9 ca
    cmp player_using_object_spriteid                                  ; 42c2: cd b6 2e
    bne c429e                                                         ; 42c5: d0 d7
    cmp previous_player_using_object_spriteid                         ; 42c7: cd b7 2e
    beq c429e                                                         ; 42ca: f0 d2
    lda #$ca                                                          ; 42cc: a9 ca
    jsr remove_item_from_toolbar_menu                                 ; 42ce: 20 e0 2b
    lda #0                                                            ; 42d1: a9 00
    sta object_spriteid+1                                             ; 42d3: 8d a9 09
    sta player_using_object_spriteid                                  ; 42d6: 8d b6 2e
    sta player_held_object_spriteid                                   ; 42d9: 85 52
    lda desired_room_index                                            ; 42db: a5 30
    sta l0a75                                                         ; 42dd: 8d 75 0a
    lda #1                                                            ; 42e0: a9 01
    sta l0a76                                                         ; 42e2: 8d 76 0a
    lda #$0e                                                          ; 42e5: a9 0e
    sta l0a30                                                         ; 42e7: 8d 30 0a
    lda object_x_low+1                                                ; 42ea: ad 51 09
    sta l0a70                                                         ; 42ed: 8d 70 0a
    lda object_x_high+1                                               ; 42f0: ad 67 09
    sta l0a71                                                         ; 42f3: 8d 71 0a
    lda object_y_low+1                                                ; 42f6: ad 7d 09
    sta l0a72                                                         ; 42f9: 8d 72 0a
    lda object_y_high+1                                               ; 42fc: ad 93 09
    sta l0a73                                                         ; 42ff: 8d 73 0a
    lda object_direction                                              ; 4302: ad be 09
    sta l0a74                                                         ; 4305: 8d 74 0a
    jsr sub_c4464                                                     ; 4308: 20 64 44
    ldx #2                                                            ; 430b: a2 02
    jsr l20f7                                                         ; 430d: 20 f7 20
c4310
    jsr sub_c4373                                                     ; 4310: 20 73 43
    lda l4463                                                         ; 4313: ad 63 44
    sta object_spriteid_old + 2                                       ; 4316: 8d b5 09
    lda desired_room_index                                            ; 4319: a5 30
    cmp l0a75                                                         ; 431b: cd 75 0a
    beq c4328                                                         ; 431e: f0 08
    lda #0                                                            ; 4320: a9 00
    sta level_workspace                                               ; 4322: 8d 6f 0a
    jmp return7                                                       ; 4325: 4c 32 43

c4328
    lda l0a76                                                         ; 4328: ad 76 0a
    cmp #$11                                                          ; 432b: c9 11
    bne return7                                                       ; 432d: d0 03
    jsr sub_c4333                                                     ; 432f: 20 33 43
return7
    rts                                                               ; 4332: 60

sub_c4333
    lda #$cb                                                          ; 4333: a9 cb
    sta object_spriteid + 2                                           ; 4335: 8d aa 09
    lda #$11                                                          ; 4338: a9 11
    sta l0a30                                                         ; 433a: 8d 30 0a
    sta l0a76                                                         ; 433d: 8d 76 0a
    lda #0                                                            ; 4340: a9 00
    ldx #<sound1                                                      ; 4342: a2 b4
    ldy #>sound1                                                      ; 4344: a0 44
    jsr play_sound_yx                                                 ; 4346: 20 f6 38
    ldx #<sound2                                                      ; 4349: a2 ac
    ldy #>sound2                                                      ; 434b: a0 44
    jsr play_sound_yx                                                 ; 434d: 20 f6 38
    ldx #objectid_player                                              ; 4350: a2 00
    ldy #2                                                            ; 4352: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 4354: 20 e2 28
    beq return8                                                       ; 4357: f0 19
    lda #$fa                                                          ; 4359: a9 fa
    sta player_wall_collision_flag                                    ; 435b: 8d 33 24
    lda object_x_low + 2                                              ; 435e: ad 52 09
    sec                                                               ; 4361: 38
    sbc object_x_low                                                  ; 4362: ed 50 09
    lda object_x_high + 2                                             ; 4365: ad 68 09
    sbc object_x_high                                                 ; 4368: ed 66 09
    bpl return8                                                       ; 436b: 10 05
    lda #6                                                            ; 436d: a9 06
    sta player_wall_collision_flag                                    ; 436f: 8d 33 24
return8
    rts                                                               ; 4372: 60

sub_c4373
    lda l0a76                                                         ; 4373: ad 76 0a
    clc                                                               ; 4376: 18
    adc #2                                                            ; 4377: 69 02
    tay                                                               ; 4379: a8
    lda l422d,y                                                       ; 437a: b9 2d 42
    cmp #$80                                                          ; 437d: c9 80
    bne c4384                                                         ; 437f: d0 03
    ldy l0a30                                                         ; 4381: ac 30 0a
c4384
    lda l0a30                                                         ; 4384: ad 30 0a
    cmp #$11                                                          ; 4387: c9 11
    bne c43a1                                                         ; 4389: d0 16
    cpy l0a30                                                         ; 438b: cc 30 0a
    bne c43a1                                                         ; 438e: d0 11
    lda #0                                                            ; 4390: a9 00
    sta l0a76                                                         ; 4392: 8d 76 0a
    sta l0a30                                                         ; 4395: 8d 30 0a
    sta object_spriteid + 2                                           ; 4398: 8d aa 09
    sta level_workspace                                               ; 439b: 8d 6f 0a
    jmp return9                                                       ; 439e: 4c 62 44

c43a1
    sty l0a76                                                         ; 43a1: 8c 76 0a
    lda l422d,y                                                       ; 43a4: b9 2d 42
    ldx l0a74                                                         ; 43a7: ae 74 0a
    bpl c43b1                                                         ; 43aa: 10 05
    eor #$ff                                                          ; 43ac: 49 ff
    clc                                                               ; 43ae: 18
    adc #1                                                            ; 43af: 69 01
c43b1
    ldx #0                                                            ; 43b1: a2 00
    ora #0                                                            ; 43b3: 09 00
    bpl c43b8                                                         ; 43b5: 10 01
    dex                                                               ; 43b7: ca
c43b8
    clc                                                               ; 43b8: 18
    adc l0a70                                                         ; 43b9: 6d 70 0a
    sta l0a70                                                         ; 43bc: 8d 70 0a
    txa                                                               ; 43bf: 8a
    adc l0a71                                                         ; 43c0: 6d 71 0a
    sta l0a71                                                         ; 43c3: 8d 71 0a
    iny                                                               ; 43c6: c8
    lda l422d,y                                                       ; 43c7: b9 2d 42
    ldx #0                                                            ; 43ca: a2 00
    ora #0                                                            ; 43cc: 09 00
    bpl c43d1                                                         ; 43ce: 10 01
    dex                                                               ; 43d0: ca
c43d1
    clc                                                               ; 43d1: 18
    adc l0a72                                                         ; 43d2: 6d 72 0a
    sta l0a72                                                         ; 43d5: 8d 72 0a
    txa                                                               ; 43d8: 8a
    adc l0a73                                                         ; 43d9: 6d 73 0a
    sta l0a73                                                         ; 43dc: 8d 73 0a
    jsr sub_c4464                                                     ; 43df: 20 64 44
    lda #2                                                            ; 43e2: a9 02
    jsr l25f5                                                         ; 43e4: 20 f5 25
    lda object_x_low + 2                                              ; 43e7: ad 52 09
    sta l0a70                                                         ; 43ea: 8d 70 0a
    lda object_x_high + 2                                             ; 43ed: ad 68 09
    sta l0a71                                                         ; 43f0: 8d 71 0a
    lda object_y_low + 2                                              ; 43f3: ad 7e 09
    sta l0a72                                                         ; 43f6: 8d 72 0a
    lda object_y_high + 2                                             ; 43f9: ad 94 09
    sta l0a73                                                         ; 43fc: 8d 73 0a
    dec temp_top_offset                                               ; 43ff: ce 50 25
    lda #2                                                            ; 4402: a9 02
    sta temp_bottom_offset                                            ; 4404: 8d 51 25
    dec temp_left_offset                                              ; 4407: ce d0 24
    inc temp_right_offset                                             ; 440a: ee d1 24
    lda #2                                                            ; 440d: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 440f: 20 94 28
    beq c441f                                                         ; 4412: f0 0b
    lda #$11                                                          ; 4414: a9 11
    sta l0a30                                                         ; 4416: 8d 30 0a
    sta l0a76                                                         ; 4419: 8d 76 0a
    jsr sub_c4464                                                     ; 441c: 20 64 44
c441f
    ldx #2                                                            ; 441f: a2 02
    jsr l2434                                                         ; 4421: 20 34 24
    jsr l24d2                                                         ; 4424: 20 d2 24
    lda l0a74                                                         ; 4427: ad 74 0a
    bmi c4448                                                         ; 442a: 30 1c
    lda l0078                                                         ; 442c: a5 78
    cmp #$28 ; '('                                                    ; 442e: c9 28
    bcc return9                                                       ; 4430: 90 30
    lda l0a70                                                         ; 4432: ad 70 0a
    sec                                                               ; 4435: 38
    sbc #$40 ; '@'                                                    ; 4436: e9 40
    sta l0a70                                                         ; 4438: 8d 70 0a
    lda #0                                                            ; 443b: a9 00
    sbc #0                                                            ; 443d: e9 00
    sta l0a71                                                         ; 443f: 8d 71 0a
    inc l0a75                                                         ; 4442: ee 75 0a
    jmp c445d                                                         ; 4445: 4c 5d 44

c4448
    lda l0079                                                         ; 4448: a5 79
    bpl return9                                                       ; 444a: 10 16
    lda l0a70                                                         ; 444c: ad 70 0a
    clc                                                               ; 444f: 18
    adc #$40 ; '@'                                                    ; 4450: 69 40
    sta l0a70                                                         ; 4452: 8d 70 0a
    lda #1                                                            ; 4455: a9 01
    sta l0a71                                                         ; 4457: 8d 71 0a
    dec l0a75                                                         ; 445a: ce 75 0a
c445d
    lda #0                                                            ; 445d: a9 00
    sta object_spriteid + 2                                           ; 445f: 8d aa 09
return9
    rts                                                               ; 4462: 60

l4463
    !byte 0                                                           ; 4463: 00

sub_c4464
    lda #$c9                                                          ; 4464: a9 c9
    sta l38ae                                                         ; 4466: 8d ae 38
    lda #$40 ; '@'                                                    ; 4469: a9 40
    sta l38c4                                                         ; 446b: 8d c4 38
    lda l0a70                                                         ; 446e: ad 70 0a
    sta object_x_low + 2                                              ; 4471: 8d 52 09
    lda l0a71                                                         ; 4474: ad 71 0a
    sta object_x_high + 2                                             ; 4477: 8d 68 09
    lda l0a72                                                         ; 447a: ad 72 0a
    sta object_y_low + 2                                              ; 447d: 8d 7e 09
    lda l0a73                                                         ; 4480: ad 73 0a
    sta object_y_high + 2                                             ; 4483: 8d 94 09
    lda l0a74                                                         ; 4486: ad 74 0a
    sta object_direction + 2                                          ; 4489: 8d c0 09
    lda #$c8                                                          ; 448c: a9 c8
    sta object_spriteid + 2                                           ; 448e: 8d aa 09
    lda l0a30                                                         ; 4491: ad 30 0a
    cmp #$11                                                          ; 4494: c9 11
    bne return10                                                      ; 4496: d0 05
    lda #$cb                                                          ; 4498: a9 cb
    sta object_spriteid + 2                                           ; 449a: 8d aa 09
return10
    rts                                                               ; 449d: 60

envelope2
    !byte 5                                                           ; 449e: 05                      ; envelope number
    !byte 1                                                           ; 449f: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 44a0: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 44a1: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 44a2: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 44a3: 00                      ; number of steps in section 1
    !byte 0                                                           ; 44a4: 00                      ; number of steps in section 2
    !byte 0                                                           ; 44a5: 00                      ; number of steps in section 3
    !byte 126                                                         ; 44a6: 7e                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 44a7: 00                      ; change of amplitude per step during decay phase
    !byte 252                                                         ; 44a8: fc                      ; change of amplitude per step during sustain phase
    !byte 248                                                         ; 44a9: f8                      ; change of amplitude per step during release phase
    !byte 126                                                         ; 44aa: 7e                      ; target of level at end of attack phase
    !byte 0                                                           ; 44ab: 00                      ; target of level at end of decay phase
sound2
    !word $10                                                         ; 44ac: 10 00                   ; channel
    !word 5                                                           ; 44ae: 05 00                   ; amplitude
    !word 7                                                           ; 44b0: 07 00                   ; pitch
    !word 1                                                           ; 44b2: 01 00                   ; duration
sound1
    !word $11                                                         ; 44b4: 11 00                   ; channel
    !word 0                                                           ; 44b6: 00 00                   ; amplitude
    !word 220                                                         ; 44b8: dc 00                   ; pitch
    !word 1                                                           ; 44ba: 01 00                   ; duration
envelope1
    !byte 6                                                           ; 44bc: 06                      ; envelope number
    !byte 1                                                           ; 44bd: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 44be: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 44bf: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 44c0: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 44c1: 00                      ; number of steps in section 1
    !byte 0                                                           ; 44c2: 00                      ; number of steps in section 2
    !byte 0                                                           ; 44c3: 00                      ; number of steps in section 3
    !byte 80                                                          ; 44c4: 50                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 44c5: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 44c6: 00                      ; change of amplitude per step during sustain phase
    !byte 250                                                         ; 44c7: fa                      ; change of amplitude per step during release phase
    !byte 115                                                         ; 44c8: 73                      ; target of level at end of attack phase
    !byte 0                                                           ; 44c9: 00                      ; target of level at end of decay phase
    !byte $10,   0,   6,   0,   7,   0,   1,   0, $11,   0,   0,   0  ; 44ca: 10 00 06...
    !byte $f0,   0,   1,   0                                          ; 44d6: f0 00 01...
ground_fill_2x2_top_left
    !byte %.#....#.                                                   ; 44da: 42
    !byte %#......#                                                   ; 44db: 81
    !byte %........                                                   ; 44dc: 00
    !byte %........                                                   ; 44dd: 00
    !byte %......##                                                   ; 44de: 03
    !byte %.....#..                                                   ; 44df: 04
    !byte %#...#...                                                   ; 44e0: 88
    !byte %.#..#...                                                   ; 44e1: 48
ground_fill_2x2_top_right
    !byte %.#....#.                                                   ; 44e2: 42
    !byte %#......#                                                   ; 44e3: 81
    !byte %........                                                   ; 44e4: 00
    !byte %........                                                   ; 44e5: 00
    !byte %##......                                                   ; 44e6: c0
    !byte %..#.....                                                   ; 44e7: 20
    !byte %...#...#                                                   ; 44e8: 11
    !byte %...#..#.                                                   ; 44e9: 12
ground_fill_2x2_bottom_left
    !byte %.#..#...                                                   ; 44ea: 48
    !byte %#...#...                                                   ; 44eb: 88
    !byte %.....#..                                                   ; 44ec: 04
    !byte %......##                                                   ; 44ed: 03
    !byte %........                                                   ; 44ee: 00
    !byte %........                                                   ; 44ef: 00
    !byte %#......#                                                   ; 44f0: 81
    !byte %.#....#.                                                   ; 44f1: 42
ground_fill_2x2_bottom_right
    !byte %...#..#.                                                   ; 44f2: 12
    !byte %...#...#                                                   ; 44f3: 11
    !byte %..#.....                                                   ; 44f4: 20
    !byte %##......                                                   ; 44f5: c0
    !byte %........                                                   ; 44f6: 00
    !byte %........                                                   ; 44f7: 00
    !byte %#......#                                                   ; 44f8: 81
    !byte %.#....#.                                                   ; 44f9: 42
sprite_data
pydis_end

; Automatically generated labels:
;     c3bdb
;     c3bf5
;     c3bf8
;     c3c09
;     c3c1a
;     c3c26
;     c3c30
;     c3c49
;     c3c4e
;     c3c65
;     c3c8d
;     c3d4a
;     c3d7d
;     c3d80
;     c3d8f
;     c3dbb
;     c3de7
;     c3df3
;     c3eb9
;     c3ede
;     c3ee1
;     c3ef7
;     c3f33
;     c3f40
;     c3f65
;     c40b9
;     c40ce
;     c40d1
;     c40e2
;     c40fd
;     c411e
;     c4142
;     c4161
;     c4166
;     c4177
;     c417a
;     c41a2
;     c41fa
;     c421d
;     c426c
;     c4299
;     c429e
;     c42a1
;     c42c0
;     c4310
;     c4328
;     c4384
;     c43a1
;     c43b1
;     c43b8
;     c43d1
;     c441f
;     c4448
;     c445d
;     l0016
;     l0018
;     l0019
;     l001a
;     l001b
;     l0078
;     l0079
;     l0a30
;     l0a31
;     l0a32
;     l0a70
;     l0a71
;     l0a72
;     l0a73
;     l0a74
;     l0a75
;     l0a76
;     l0a77
;     l0a78
;     l0a79
;     l0a7a
;     l0a7b
;     l0a7c
;     l0a7d
;     l0a7e
;     l20f7
;     l2434
;     l24d2
;     l25f5
;     l38ae
;     l38af
;     l38b0
;     l38b1
;     l38c4
;     l38c5
;     l38c6
;     l3bb7
;     l3f70
;     l4049
;     l408b
;     l422d
;     l4463
;     loop_c4003
;     loop_c401d
;     loop_c427f
;     sub_c3bc3
;     sub_c3d3a
;     sub_c3db4
;     sub_c40a1
;     sub_c4241
;     sub_c4333
;     sub_c4373
;     sub_c4464
!if (<envelope1) != $bc {
    !error "Assertion failed: <envelope1 == $bc"
}
!if (<envelope2) != $9e {
    !error "Assertion failed: <envelope2 == $9e"
}
!if (<ground_fill_2x2_top_left) != $da {
    !error "Assertion failed: <ground_fill_2x2_top_left == $da"
}
!if (<sound1) != $b4 {
    !error "Assertion failed: <sound1 == $b4"
}
!if (<sound2) != $ac {
    !error "Assertion failed: <sound2 == $ac"
}
!if (>envelope1) != $44 {
    !error "Assertion failed: >envelope1 == $44"
}
!if (>envelope2) != $44 {
    !error "Assertion failed: >envelope2 == $44"
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
!if (collision_map_none) != $00 {
    !error "Assertion failed: collision_map_none == $00"
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
!if (level_specific_initialisation) != $3af2 {
    !error "Assertion failed: level_specific_initialisation == $3af2"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b0f {
    !error "Assertion failed: level_specific_update == $3b0f"
}
!if (object_direction + 2) != $09c0 {
    !error "Assertion failed: object_direction + 2 == $09c0"
}
!if (object_direction + 3) != $09c1 {
    !error "Assertion failed: object_direction + 3 == $09c1"
}
!if (object_direction + 4) != $09c2 {
    !error "Assertion failed: object_direction + 4 == $09c2"
}
!if (object_direction + 5) != $09c3 {
    !error "Assertion failed: object_direction + 5 == $09c3"
}
!if (object_spriteid + 2) != $09aa {
    !error "Assertion failed: object_spriteid + 2 == $09aa"
}
!if (object_spriteid + 3) != $09ab {
    !error "Assertion failed: object_spriteid + 3 == $09ab"
}
!if (object_spriteid + 4) != $09ac {
    !error "Assertion failed: object_spriteid + 4 == $09ac"
}
!if (object_spriteid_old + 2) != $09b5 {
    !error "Assertion failed: object_spriteid_old + 2 == $09b5"
}
!if (object_x_high + 2) != $0968 {
    !error "Assertion failed: object_x_high + 2 == $0968"
}
!if (object_x_low + 2) != $0952 {
    !error "Assertion failed: object_x_low + 2 == $0952"
}
!if (object_x_low + 3) != $0953 {
    !error "Assertion failed: object_x_low + 3 == $0953"
}
!if (object_x_low + 4) != $0954 {
    !error "Assertion failed: object_x_low + 4 == $0954"
}
!if (object_x_low + 5) != $0955 {
    !error "Assertion failed: object_x_low + 5 == $0955"
}
!if (object_y_high + 2) != $0994 {
    !error "Assertion failed: object_y_high + 2 == $0994"
}
!if (object_y_low + 2) != $097e {
    !error "Assertion failed: object_y_low + 2 == $097e"
}
!if (object_y_low + 3) != $097f {
    !error "Assertion failed: object_y_low + 3 == $097f"
}
!if (objectid_old_player) != $0b {
    !error "Assertion failed: objectid_old_player == $0b"
}
!if (objectid_player) != $00 {
    !error "Assertion failed: objectid_player == $00"
}
!if (room_0_data) != $3f73 {
    !error "Assertion failed: room_0_data == $3f73"
}
!if (room_1_data) != $3b1f {
    !error "Assertion failed: room_1_data == $3b1f"
}
!if (room_2_data) != $3ca2 {
    !error "Assertion failed: room_2_data == $3ca2"
}
!if (room_3_data) != $3e05 {
    !error "Assertion failed: room_3_data == $3e05"
}
!if (sprite_data - level_data) != $0a25 {
    !error "Assertion failed: sprite_data - level_data == $0a25"
}
