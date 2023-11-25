; Constants
collision_map_none                    = 0
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
objectid_player                       = 0
objectid_player_accessory             = 1
objectid_something                    = 11
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
l0952                                               = $0952
l0953                                               = $0953
l0954                                               = $0954
l0955                                               = $0955
object_x_low_old                                    = $095b
l095d                                               = $095d
object_x_high                                       = $0966
l0968                                               = $0968
l0969                                               = $0969
l096a                                               = $096a
l096b                                               = $096b
object_x_high_old                                   = $0971
l0973                                               = $0973
object_y_low                                        = $097c
l097e                                               = $097e
l097f                                               = $097f
l0980                                               = $0980
l0981                                               = $0981
object_y_low_old                                    = $0987
l0989                                               = $0989
object_y_high                                       = $0992
l0994                                               = $0994
l0995                                               = $0995
l0996                                               = $0996
l0997                                               = $0997
object_y_high_old                                   = $099d
object_spriteid                                     = $09a8
l09aa                                               = $09aa
l09ab                                               = $09ab
l09ac                                               = $09ac
l09ad                                               = $09ad
object_spriteid_old                                 = $09b3
l09b5                                               = $09b5
object_direction                                    = $09be
l09c0                                               = $09c0
l09c2                                               = $09c2
l09c3                                               = $09c3
object_direction_old                                = $09c9
level_progress_table                                = $09ef
l0a13                                               = $0a13
l0a14                                               = $0a14
l0a15                                               = $0a15
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
l22de                                               = $22de
l22df                                               = $22df
play_landing_sound                                  = $23a9
player_wall_collision_flag                          = $2433
l2434                                               = $2434
temp_left_offset                                    = $24d0
temp_right_offset                                   = $24d1
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
l38b1                                               = $38b1
object_z_order                                      = $38c2
l38c4                                               = $38c4
l38c7                                               = $38c7
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
    !word sprite_data - level_data                                    ; 3ad5: 57 0b                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f6 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 34 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
    !byte 1, 3                                                        ; 3add: 01 03
level_room_data_table
    !word room_0_data                                                 ; 3adf: f2 3f                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: 8c 43
    !word room_2_data                                                 ; 3ae3: 18 3c
    !word room_3_data                                                 ; 3ae5: f7 3d

; *************************************************************************************
; 'DUCK-EGG-BLUES[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $8f, $9e, $88, $80, $e6, $8e, $8c, $8c, $e6, $89, $87, $9e  ; 3ae7: 8f 9e 88...
    !byte $8e, $98, $c6                                               ; 3af3: 8e 98 c6

; *************************************************************************************
; 
; Level initialisation
; 
; This is called whenever a new room is entered.
; 
; *************************************************************************************
level_specific_initialisation
    lda current_level                                                 ; 3af6: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3af8: c5 51
    beq c3b21                                                         ; 3afa: f0 25
    lda developer_flags                                               ; 3afc: ad 03 11
    bpl c3b0b                                                         ; 3aff: 10 0a
    lda #$ff                                                          ; 3b01: a9 ff
    sta l0a13                                                         ; 3b03: 8d 13 0a
    lda #$d1                                                          ; 3b06: a9 d1
    jsr insert_character_menu_item_into_toolbar                       ; 3b08: 20 87 2b
c3b0b
    lda l0a13                                                         ; 3b0b: ad 13 0a
    bpl c3b15                                                         ; 3b0e: 10 05
    lda #$d3                                                          ; 3b10: a9 d3
    jsr find_or_create_menu_slot_for_A                                ; 3b12: 20 bd 2b
c3b15
    lda l0a15                                                         ; 3b15: ad 15 0a
    cmp #$ff                                                          ; 3b18: c9 ff
    bne c3b21                                                         ; 3b1a: d0 05
    lda #$d1                                                          ; 3b1c: a9 d1
    jsr insert_character_menu_item_into_toolbar                       ; 3b1e: 20 87 2b
c3b21
    lda #$b8                                                          ; 3b21: a9 b8
    sta l22de                                                         ; 3b23: 8d de 22
    lda #$3e ; '>'                                                    ; 3b26: a9 3e
    sta l22df                                                         ; 3b28: 8d df 22
    lda #$0c                                                          ; 3b2b: a9 0c
    sta source_sprite_memory_low                                      ; 3b2d: 85 40
    lda #$46 ; 'F'                                                    ; 3b2f: a9 46
    sta source_sprite_memory_high                                     ; 3b31: 85 41
    rts                                                               ; 3b33: 60

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
    jsr sub_c40cf                                                     ; 3b34: 20 cf 40
    jsr sub_c446a                                                     ; 3b37: 20 6a 44
    jsr sub_c3ce0                                                     ; 3b3a: 20 e0 3c
    jmp c3e96                                                         ; 3b3d: 4c 96 3e

l3b40
    !byte $ce, $cf, $d0, $cf,   0,   0,   0,   0,   0,   0, $cd,   0  ; 3b40: ce cf d0...
    !byte   0,   0, $cd,   0,   0,   0, $cc,   0,   0,   0, $cc,   0  ; 3b4c: 00 00 cd...
    !byte   0,   0, $c8,   0,   0,   0, $c8,   0,   0,   0,   0, $c8  ; 3b58: 00 00 c8...
    !byte   0,   0,   0, $c8,   0,   0,   0, $cc,   0,   0,   0, $cc  ; 3b64: 00 00 00...
    !byte   0,   0,   0, $cd,   0,   0,   0, $cd,   0,   0,   0,   0  ; 3b70: 00 00 00...
    !byte $c8,   0,   0,   0,   0, $ca,   0, $fc,   0, $c9,   2, $fe  ; 3b7c: c8 00 00...
    !byte   0,   0, $c8,   0,   0,   0,   0, $c9,   0,   0, $ff,   0  ; 3b88: 00 00 c8...
    !byte $c9,   0, $fc, $ff,   0, $c9,   4,   0, $ff,   0, $c9,   4  ; 3b94: c9 00 fc...
    !byte $fc, $ff,   0, $ca,   0,   0, $ff, $c9,   2,   0, $ff,   0  ; 3ba0: fc ff 00...
    !byte $c9,   4, $fc,   0, $c9,   4, $fe,   0,   0, $c8,   4,   2  ; 3bac: c9 04 fc...
    !byte   0, $c8,   4,   4,   0, $c8,   2,   4,   0,   0, $c8,   3  ; 3bb8: 00 c8 04...
    !byte   1,   0, $c8,   2,   3,   0, $c8,   1,   5,   0,   0, $c8  ; 3bc4: 01 00 c8...
    !byte   4,   2,   0, $c8,   3,   3,   0, $c8,   2,   4,   0, $c8  ; 3bd0: 04 02 00...
    !byte   1,   5,   0,   0, $c8, $fc,   2,   0, $c8, $fd,   3,   0  ; 3bdc: 01 05 00...
    !byte $c8, $fe,   4,   0, $c8, $ff,   5,   0,   0, $c8,   0,   1  ; 3be8: c8 fe 04...
    !byte   0, $c8,   0,   2,   0, $c8,   0,   3,   0, $c8,   0,   4  ; 3bf4: 00 c8 00...
    !byte   0, $c8,   0,   5,   0,   0, $c8,   0,   7,   0,   0       ; 3c00: 00 c8 00...

sub_c3c0b
    lda #3                                                            ; 3c0b: a9 03
    sta width_in_cells                                                ; 3c0d: 85 3c
    lda #1                                                            ; 3c0f: a9 01
    sta height_in_cells                                               ; 3c11: 85 3d
    lda #$d4                                                          ; 3c13: a9 d4
    jmp draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3c15: 4c 57 1f

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 20                                                          ; 3c18: 14                      ; initial player X cell
    !byte 22                                                          ; 3c19: 16                      ; initial player Y cell

; #################      #################
; #################      #################
; ###        |
; ###        |
; ###        |
; ###        |
; ###        |
; ###        |     ######              ###
; ###        |     ######              ###
; ###        |        ###              ###
; ###        |        ###              ###
; ###OOO     |        ###           OOO###
; ######     |        ###           ######
; ######     |        ###           ######
; ###        |        ###OOO
; ###        |        ######
; ###        |        ######
; ###        |
; ###        |
; ###        |                      ######
; ###                            #########
; ###                 P       ############
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 17x2 rectangle at (0,0)
room_2_code
    ldx #0                                                            ; 3c1a: a2 00
    ldy #0                                                            ; 3c1c: a0 00
    lda #$11                                                          ; 3c1e: a9 11
    sta width_in_cells                                                ; 3c20: 85 3c
    lda #2                                                            ; 3c22: a9 02
    sta height_in_cells                                               ; 3c24: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c26: 20 bb 1a
; draw 17x2 rectangle at (23,0)
    ldx #$17                                                          ; 3c29: a2 17
    jsr copy_rectangle_of_memory_to_screen                            ; 3c2b: 20 bb 1a
; draw 3x20 rectangle at (0,2)
    ldx #0                                                            ; 3c2e: a2 00
    ldy #2                                                            ; 3c30: a0 02
    lda #3                                                            ; 3c32: a9 03
    sta width_in_cells                                                ; 3c34: 85 3c
    lda #$14                                                          ; 3c36: a9 14
    sta height_in_cells                                               ; 3c38: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c3a: 20 bb 1a
; draw 255x20 rectangle at (0,22)
    ldy #$16                                                          ; 3c3d: a0 16
    lda #$ff                                                          ; 3c3f: a9 ff
    sta width_in_cells                                                ; 3c41: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3c43: 20 bb 1a
; draw 255x1 rectangle at (28,21)
    ldx #$1c                                                          ; 3c46: a2 1c
    dey                                                               ; 3c48: 88
    lda #1                                                            ; 3c49: a9 01
    sta height_in_cells                                               ; 3c4b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c4d: 20 bb 1a
; draw 255x1 rectangle at (31,20)
    ldx #$1f                                                          ; 3c50: a2 1f
    dey                                                               ; 3c52: 88
    jsr copy_rectangle_of_memory_to_screen                            ; 3c53: 20 bb 1a
; draw 255x1 rectangle at (34,19)
    ldx #$22 ; '"'                                                    ; 3c56: a2 22
    dey                                                               ; 3c58: 88
    jsr copy_rectangle_of_memory_to_screen                            ; 3c59: 20 bb 1a
; draw 3x2 rectangle at (3,12)
    ldx #3                                                            ; 3c5c: a2 03
    ldy #$0c                                                          ; 3c5e: a0 0c
    lda #3                                                            ; 3c60: a9 03
    sta width_in_cells                                                ; 3c62: 85 3c
    lda #2                                                            ; 3c64: a9 02
    sta height_in_cells                                               ; 3c66: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c68: 20 bb 1a
; draw 3x2 rectangle at (34,12)
    ldx #$22 ; '"'                                                    ; 3c6b: a2 22
    jsr copy_rectangle_of_memory_to_screen                            ; 3c6d: 20 bb 1a
; draw 3x2 rectangle at (17,7)
    ldx #$11                                                          ; 3c70: a2 11
    ldy #7                                                            ; 3c72: a0 07
    jsr copy_rectangle_of_memory_to_screen                            ; 3c74: 20 bb 1a
; draw 3x2 rectangle at (23,15)
    ldx #$17                                                          ; 3c77: a2 17
    ldy #$0f                                                          ; 3c79: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3c7b: 20 bb 1a
; draw 3x10 rectangle at (20,7)
    ldx #$14                                                          ; 3c7e: a2 14
    ldy #7                                                            ; 3c80: a0 07
    lda #$0a                                                          ; 3c82: a9 0a
    sta height_in_cells                                               ; 3c84: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c86: 20 bb 1a
; draw 3x7 rectangle at (37,7)
    ldx #$25 ; '%'                                                    ; 3c89: a2 25
    lda #7                                                            ; 3c8b: a9 07
    sta height_in_cells                                               ; 3c8d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c8f: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3c92: 20 90 1b
    ldx #3                                                            ; 3c95: a2 03
    ldy #$0b                                                          ; 3c97: a0 0b
    jsr sub_c3c0b                                                     ; 3c99: 20 0b 3c
    ldx #$22 ; '"'                                                    ; 3c9c: a2 22
    jsr sub_c3c0b                                                     ; 3c9e: 20 0b 3c
    ldx #$17                                                          ; 3ca1: a2 17
    ldy #$0e                                                          ; 3ca3: a0 0e
    jsr sub_c3c0b                                                     ; 3ca5: 20 0b 3c
    ldx #$13                                                          ; 3ca8: a2 13
    ldy #9                                                            ; 3caa: a0 09
    lda #1                                                            ; 3cac: a9 01
    sta width_in_cells                                                ; 3cae: 85 3c
    lda #3                                                            ; 3cb0: a9 03
    sta height_in_cells                                               ; 3cb2: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3cb4: 20 44 1e
; draw rope at (11,2) length 18
    ldx #$0b                                                          ; 3cb7: a2 0b
    ldy #2                                                            ; 3cb9: a0 02
    lda #$12                                                          ; 3cbb: a9 12
    jsr draw_rope                                                     ; 3cbd: 20 b9 1d
    jsr start_room                                                    ; 3cc0: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 3cc3: 20 da 12
    sta room_exit_direction                                           ; 3cc6: 85 70
    and #exit_room_top                                                ; 3cc8: 29 08
    beq room_2_check_right_exit                                       ; 3cca: f0 07
    ldx #3                                                            ; 3ccc: a2 03
    ldy current_level                                                 ; 3cce: a4 31
    jmp initialise_level_and_room                                     ; 3cd0: 4c 40 11

room_2_check_right_exit
    lda room_exit_direction                                           ; 3cd3: a5 70
    and #exit_room_right                                              ; 3cd5: 29 04
    beq room_2_game_update_loop                                       ; 3cd7: f0 ea
    ldx #1                                                            ; 3cd9: a2 01
    ldy current_level                                                 ; 3cdb: a4 31
    jmp initialise_level_and_room                                     ; 3cdd: 4c 40 11

sub_c3ce0
    lda #2                                                            ; 3ce0: a9 02
    sta currently_updating_logic_for_room_index                       ; 3ce2: 8d ba 1a
    lda #3                                                            ; 3ce5: a9 03
    ldx #$14                                                          ; 3ce7: a2 14
    ldy #$0c                                                          ; 3ce9: a0 0c
    jsr update_brazier_and_fire                                       ; 3ceb: 20 88 19
    lda update_room_first_update_flag                                 ; 3cee: ad 2b 13
    beq c3d3a                                                         ; 3cf1: f0 47
    lda l0a15                                                         ; 3cf3: ad 15 0a
    cmp #$ff                                                          ; 3cf6: c9 ff
    beq c3d34                                                         ; 3cf8: f0 3a
    lda current_level                                                 ; 3cfa: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3cfc: c5 51
    beq c3d12                                                         ; 3cfe: f0 12
    lda #$73 ; 's'                                                    ; 3d00: a9 73
    sta l0a15                                                         ; 3d02: 8d 15 0a
    lda #$ff                                                          ; 3d05: a9 ff
    sta l0a79                                                         ; 3d07: 8d 79 0a
    sta l0a7a                                                         ; 3d0a: 8d 7a 0a
    lda #0                                                            ; 3d0d: a9 00
    sta l0a7b                                                         ; 3d0f: 8d 7b 0a
c3d12
    lda desired_room_index                                            ; 3d12: a5 30
    beq c3d34                                                         ; 3d14: f0 1e
    cmp #3                                                            ; 3d16: c9 03
    bcs c3d34                                                         ; 3d18: b0 1a
    lda #$df                                                          ; 3d1a: a9 df
    sta l38b1                                                         ; 3d1c: 8d b1 38
    lda #$fe                                                          ; 3d1f: a9 fe
    sta l38c7                                                         ; 3d21: 8d c7 38
    lda #$2c ; ','                                                    ; 3d24: a9 2c
    sta l0980                                                         ; 3d26: 8d 80 09
    sta l0981                                                         ; 3d29: 8d 81 09
    lda #0                                                            ; 3d2c: a9 00
    sta l0996                                                         ; 3d2e: 8d 96 09
    sta l0997                                                         ; 3d31: 8d 97 09
c3d34
    jmp c3d9f                                                         ; 3d34: 4c 9f 3d

c3d37
    jmp c3df6                                                         ; 3d37: 4c f6 3d

c3d3a
    lda l0a15                                                         ; 3d3a: ad 15 0a
    cmp #$ff                                                          ; 3d3d: c9 ff
    beq c3d37                                                         ; 3d3f: f0 f6
    lda desired_room_index                                            ; 3d41: a5 30
    cmp #2                                                            ; 3d43: c9 02
    bne c3d64                                                         ; 3d45: d0 1d
    ldx #$0b                                                          ; 3d47: a2 0b
    ldy #4                                                            ; 3d49: a0 04
    jsr test_for_collision_between_objects_x_and_y                    ; 3d4b: 20 e2 28
    beq c3d64                                                         ; 3d4e: f0 14
    lda #$d1                                                          ; 3d50: a9 d1
    jsr insert_character_menu_item_into_toolbar                       ; 3d52: 20 87 2b
    lda #0                                                            ; 3d55: a9 00
    sta l09ac                                                         ; 3d57: 8d ac 09
    sta l09ad                                                         ; 3d5a: 8d ad 09
    lda #$ff                                                          ; 3d5d: a9 ff
    sta l0a15                                                         ; 3d5f: 8d 15 0a
    bmi c3d37                                                         ; 3d62: 30 d3
c3d64
    ldy l0a7b                                                         ; 3d64: ac 7b 0a
    iny                                                               ; 3d67: c8
    lda l3b40,y                                                       ; 3d68: b9 40 3b
    bne c3d6f                                                         ; 3d6b: d0 02
    ldy #0                                                            ; 3d6d: a0 00
c3d6f
    sty l0a7b                                                         ; 3d6f: 8c 7b 0a
    lda l0a7a                                                         ; 3d72: ad 7a 0a
    bne c3d85                                                         ; 3d75: d0 0e
    lda l0a79                                                         ; 3d77: ad 79 0a
    eor #$fe                                                          ; 3d7a: 49 fe
    sta l0a79                                                         ; 3d7c: 8d 79 0a
    sta l0a7a                                                         ; 3d7f: 8d 7a 0a
    jmp c3d95                                                         ; 3d82: 4c 95 3d

c3d85
    lda l0a15                                                         ; 3d85: ad 15 0a
    cmp #$1e                                                          ; 3d88: c9 1e
    beq c3d90                                                         ; 3d8a: f0 04
    cmp #$74 ; 't'                                                    ; 3d8c: c9 74
    bne c3d95                                                         ; 3d8e: d0 05
c3d90
    lda #0                                                            ; 3d90: a9 00
    sta l0a7a                                                         ; 3d92: 8d 7a 0a
c3d95
    lda l0a15                                                         ; 3d95: ad 15 0a
    clc                                                               ; 3d98: 18
    adc l0a7a                                                         ; 3d99: 6d 7a 0a
    sta l0a15                                                         ; 3d9c: 8d 15 0a
c3d9f
    lda l0a15                                                         ; 3d9f: ad 15 0a
    cmp #$ff                                                          ; 3da2: c9 ff
    beq c3df6                                                         ; 3da4: f0 50
    lda desired_room_index                                            ; 3da6: a5 30
    beq c3df6                                                         ; 3da8: f0 4c
    cmp #3                                                            ; 3daa: c9 03
    bcs c3df6                                                         ; 3dac: b0 48
    lda #$c9                                                          ; 3dae: a9 c9
    ldx l0a7a                                                         ; 3db0: ae 7a 0a
    bne c3db7                                                         ; 3db3: d0 02
    lda #$ca                                                          ; 3db5: a9 ca
c3db7
    sta l09ac                                                         ; 3db7: 8d ac 09
    ldy l0a7b                                                         ; 3dba: ac 7b 0a
    lda l3b40,y                                                       ; 3dbd: b9 40 3b
    sta l09ad                                                         ; 3dc0: 8d ad 09
    lda l0a15                                                         ; 3dc3: ad 15 0a
    ldx desired_room_index                                            ; 3dc6: a6 30
    cpx #2                                                            ; 3dc8: e0 02
    beq c3dcf                                                         ; 3dca: f0 03
    sec                                                               ; 3dcc: 38
    sbc #$50 ; 'P'                                                    ; 3dcd: e9 50
c3dcf
    ldx #0                                                            ; 3dcf: a2 00
    cmp #$a0                                                          ; 3dd1: c9 a0
    bcc c3dd6                                                         ; 3dd3: 90 01
    dex                                                               ; 3dd5: ca
c3dd6
    stx l096a                                                         ; 3dd6: 8e 6a 09
    asl                                                               ; 3dd9: 0a
    rol l096a                                                         ; 3dda: 2e 6a 09
    asl                                                               ; 3ddd: 0a
    rol l096a                                                         ; 3dde: 2e 6a 09
    sta l0954                                                         ; 3de1: 8d 54 09
    sta l0955                                                         ; 3de4: 8d 55 09
    lda l096a                                                         ; 3de7: ad 6a 09
    sta l096b                                                         ; 3dea: 8d 6b 09
    lda l0a79                                                         ; 3ded: ad 79 0a
    sta l09c2                                                         ; 3df0: 8d c2 09
    sta l09c3                                                         ; 3df3: 8d c3 09
c3df6
    rts                                                               ; 3df6: 60

; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 12                                                          ; 3df7: 0c                      ; initial player X cell
    !byte 8                                                           ; 3df8: 08                      ; initial player Y cell

; ########################################
; ########################################
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###         P                        ###
; ###     #########      #########     ###
; ###     #########      #########     ###
; ###           ###      ###           ###
; ###           ###      ###           ###
; ###           ###      ###           ###
; ###           ###      ###           ###
; ###        OOO###      ###OOO        ###
; ###        ######      ######        ###
; ###        ######      ######        ###
; ###           ###      ###           ###
; ###           ###      ###           ###
; ###           ###      ###           ###
; ###           ###      ###           ###
; ###           ###      ###           ###
; #################      #################
; #################      #################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_3_code
    ldx #0                                                            ; 3df9: a2 00
    ldy #0                                                            ; 3dfb: a0 00
    lda #$ff                                                          ; 3dfd: a9 ff
    sta width_in_cells                                                ; 3dff: 85 3c
    lda #2                                                            ; 3e01: a9 02
    sta height_in_cells                                               ; 3e03: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e05: 20 bb 1a
; draw 3x20 rectangle at (0,2)
    ldy #2                                                            ; 3e08: a0 02
    lda #3                                                            ; 3e0a: a9 03
    sta width_in_cells                                                ; 3e0c: 85 3c
    lda #$14                                                          ; 3e0e: a9 14
    sta height_in_cells                                               ; 3e10: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e12: 20 bb 1a
; draw 3x20 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3e15: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 3e17: 20 bb 1a
; draw 17x20 rectangle at (0,22)
    ldx #0                                                            ; 3e1a: a2 00
    ldy #$16                                                          ; 3e1c: a0 16
    lda #$11                                                          ; 3e1e: a9 11
    sta width_in_cells                                                ; 3e20: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3e22: 20 bb 1a
; draw 17x20 rectangle at (23,22)
    ldx #$17                                                          ; 3e25: a2 17
    jsr copy_rectangle_of_memory_to_screen                            ; 3e27: 20 bb 1a
; draw 9x2 rectangle at (8,8)
    ldx #8                                                            ; 3e2a: a2 08
    ldy #8                                                            ; 3e2c: a0 08
    lda #9                                                            ; 3e2e: a9 09
    sta width_in_cells                                                ; 3e30: 85 3c
    lda #2                                                            ; 3e32: a9 02
    sta height_in_cells                                               ; 3e34: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e36: 20 bb 1a
; draw 9x2 rectangle at (23,8)
    ldx #$17                                                          ; 3e39: a2 17
    jsr copy_rectangle_of_memory_to_screen                            ; 3e3b: 20 bb 1a
; draw 3x12 rectangle at (14,10)
    ldx #$0e                                                          ; 3e3e: a2 0e
    ldy #$0a                                                          ; 3e40: a0 0a
    lda #3                                                            ; 3e42: a9 03
    sta width_in_cells                                                ; 3e44: 85 3c
    lda #$0c                                                          ; 3e46: a9 0c
    sta height_in_cells                                               ; 3e48: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e4a: 20 bb 1a
; draw 3x12 rectangle at (23,10)
    ldx #$17                                                          ; 3e4d: a2 17
    jsr copy_rectangle_of_memory_to_screen                            ; 3e4f: 20 bb 1a
; draw 3x2 rectangle at (11,15)
    ldx #$0b                                                          ; 3e52: a2 0b
    ldy #$0f                                                          ; 3e54: a0 0f
    lda #2                                                            ; 3e56: a9 02
    sta height_in_cells                                               ; 3e58: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3e5a: 20 bb 1a
; draw 3x2 rectangle at (26,15)
    ldx #$1a                                                          ; 3e5d: a2 1a
    jsr copy_rectangle_of_memory_to_screen                            ; 3e5f: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3e62: 20 90 1b
    ldx #$0b                                                          ; 3e65: a2 0b
    ldy #$0e                                                          ; 3e67: a0 0e
    jsr sub_c3c0b                                                     ; 3e69: 20 0b 3c
    ldx #$1a                                                          ; 3e6c: a2 1a
    jsr sub_c3c0b                                                     ; 3e6e: 20 0b 3c
    ldx #3                                                            ; 3e71: a2 03
    ldy #2                                                            ; 3e73: a0 02
    lda #1                                                            ; 3e75: a9 01
    sta width_in_cells                                                ; 3e77: 85 3c
    lda #3                                                            ; 3e79: a9 03
    sta height_in_cells                                               ; 3e7b: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e7d: 20 44 1e
    ldx #$24 ; '$'                                                    ; 3e80: a2 24
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e82: 20 44 1e
    jsr start_room                                                    ; 3e85: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 3e88: 20 da 12
    and #exit_room_bottom                                             ; 3e8b: 29 02
    beq room_3_game_update_loop                                       ; 3e8d: f0 f9
    ldx #2                                                            ; 3e8f: a2 02
    ldy current_level                                                 ; 3e91: a4 31
    jmp initialise_level_and_room                                     ; 3e93: 4c 40 11

c3e96
    lda #3                                                            ; 3e96: a9 03
    sta currently_updating_logic_for_room_index                       ; 3e98: 8d ba 1a
    lda #3                                                            ; 3e9b: a9 03
    ldx #3                                                            ; 3e9d: a2 03
    ldy #5                                                            ; 3e9f: a0 05
    jsr update_brazier_and_fire                                       ; 3ea1: 20 88 19
    lda #4                                                            ; 3ea4: a9 04
    ldx #$25 ; '%'                                                    ; 3ea6: a2 25
    jsr update_brazier_and_fire                                       ; 3ea8: 20 88 19
    ldx #$1b                                                          ; 3eab: a2 1b
    lda #4                                                            ; 3ead: a9 04
    sta temp_sprite_x_offset                                          ; 3eaf: 85 3a
    ldy #$0e                                                          ; 3eb1: a0 0e
    lda #5                                                            ; 3eb3: a9 05
    jmp update_level_completion                                       ; 3eb5: 4c 10 1a

    !byte $a9, $1d, $8d, $ed, $22, $a2, $46, $a0, $3b, $a9,   4, $20  ; 3eb8: a9 1d 8d...
    !byte $ee, $22, $d0, $72, $c0, $3f, $f0,   4, $c0, $61, $d0, $0b  ; 3ec4: ee 22 d0...
    !byte $ad, $be,   9, $49, $fe, $8d, $be,   9, $4c, $ca, $3f, $20  ; 3ed0: ad be 09...
    !byte $c4, $23, $f0,   3                                          ; 3edc: c4 23 f0...
    !text "La?"                                                       ; 3ee0: 4c 61 3f
    !byte $ad, $c7, $3a, $f0, $55, $a2, $4e, $ad, $ca, $3a, $0d, $cb  ; 3ee3: ad c7 3a...
    !byte $3a, $d0,   5, $ce, $50, $25, $d0, $2a, $a2, $49, $ad, $ca  ; 3eef: 3a d0 05...
    !byte $3a, $2d, $cb, $3a, $d0, $2f, $a2, $5d, $ad, $c9, $3a, $cd  ; 3efb: 3a 2d cb...
    !byte $be,   9, $d0, $25, $a2, $53, $a9,   1, $8d, $51, $25, $ad  ; 3f07: be 09 d0...
    !byte $be,   9, $c9, $ff, $f0,   5, $ee, $d1, $24, $d0,   3, $ce  ; 3f13: be 09 c9...
    !byte $d0, $24, $a9,   0, $20, $94, $28, $f0,   8, $8e, $df,   9  ; 3f1f: d0 24 a9...
    !byte $a0                                                         ; 3f2b: a0
    !text "XL:?"                                                      ; 3f2c: 58 4c 3a...
    !byte $ec, $df,   9, $f0,   5, $8e, $df,   9, $8a, $a8, $4c, $ca  ; 3f30: ec df 09...
    !byte $3f, $ad, $df,   9, $c9, $66, $d0, $18, $ce, $50, $25, $a9  ; 3f3c: 3f ad df...
    !byte   0, $20, $94, $28, $d0,   7, $c0, $66, $f0,   3, $4c, $ca  ; 3f48: 00 20 94...
    !byte $3f, $a9, $c0, $8d, $df,   9, $a0, $6f, $ad, $8f, $28, $d0  ; 3f54: 3f a9 c0...
    !byte $18, $a9, $c0, $cd, $df,   9, $f0, $d2, $ae, $df,   9, $8d  ; 3f60: 18 a9 c0...
    !byte $df,   9, $a0, $7c, $e0, $53, $f0, $c6, $a0, $ab, $4c, $ca  ; 3f6c: df 09 a0...
    !byte $3f, $ae, $c9, $3a, $f0, $11, $a0, $3b, $ec, $be,   9, $d0  ; 3f78: 3f ae c9...
    !byte   2, $a0, $66, $a9, $66, $8d, $df,   9, $4c, $af, $3f, $ad  ; 3f84: 02 a0 66...
    !byte $df,   9, $c9, $44, $f0, $10, $c9, $36, $f0, $15, $a0, $40  ; 3f90: df 09 c9...
    !byte $84, $23, $a0, $44, $8c, $df,   9, $4c, $af, $3f, $c6, $23  ; 3f9c: 84 23 a0...
    !byte $d0,   5, $a0, $36, $8c, $df,   9, $a2,   0, $ad, $c9, $3a  ; 3fa8: d0 05 a0...
    !byte $f0,   1, $e8, $bd, $90, $28, $f0, $0e, $a0, $c0, $8c, $df  ; 3fb4: f0 01 e8...
    !byte   9, $a0, $89, $cd, $be,   9, $f0,   2, $a0, $9a, $8c, $d4  ; 3fc0: 09 a0 89...
    !byte   9, $98, $a2, $46, $a0, $3b, $20,   0, $22, $a9,   0, $20  ; 3fcc: 09 98 a2...
    !byte $f5, $25, $a9, $40, $85, $70, $a9, $3b, $85, $71, $ae, $d4  ; 3fd8: f5 25 a9...
    !byte   9, $e8, $e8, $e8, $bd, $46, $3b, $a2, $45, $a0            ; 3fe4: 09 e8 e8...
    !text ";LH", '"'                                                  ; 3fee: 3b 4c 48...
; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 20                                                          ; 3ff2: 14                      ; initial player X cell
    !byte 22                                                          ; 3ff3: 16                      ; initial player Y cell

; ########################################
; ########################################
; ###     |     ###      ###     |     ###
; ###     |     ###      ###     |     ###
; ###     |     ###      ###     |     ###
; ###     |     ###      ###     |     ###
; ###     |     ###      ###     |     ###
; ###     |     ###      ###     |     ###
; ###OOO  |     ###      ###OOO  |     ###
; ######  |     ###      ######  |     ###
; ######  |     ###      ######  |  OOO###
; ###     |     ###              |  ######
; ###     |  ######              |  ######
; ###     |  ######              |     ###
; ###     |                      |     ###
; ###     |                      |     ###
;         |                      |     ###
;         |                      |     ###
;         |                      |     ###
;         |                      |     ###
;                                      ###
; ######              P                ###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_0_code
    ldx #0                                                            ; 3ff4: a2 00
    ldy #0                                                            ; 3ff6: a0 00
    lda #$ff                                                          ; 3ff8: a9 ff
    sta width_in_cells                                                ; 3ffa: 85 3c
    lda #2                                                            ; 3ffc: a9 02
    sta height_in_cells                                               ; 3ffe: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4000: 20 bb 1a
; draw 3x14 rectangle at (0,2)
    ldy #2                                                            ; 4003: a0 02
    lda #3                                                            ; 4005: a9 03
    sta width_in_cells                                                ; 4007: 85 3c
    lda #$0e                                                          ; 4009: a9 0e
    sta height_in_cells                                               ; 400b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 400d: 20 bb 1a
; draw 3x12 rectangle at (14,2)
    ldx #$0e                                                          ; 4010: a2 0e
    lda #$0c                                                          ; 4012: a9 0c
    sta height_in_cells                                               ; 4014: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4016: 20 bb 1a
; draw 3x9 rectangle at (23,2)
    ldx #$17                                                          ; 4019: a2 17
    lda #9                                                            ; 401b: a9 09
    sta height_in_cells                                               ; 401d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 401f: 20 bb 1a
; draw 3x20 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 4022: a2 25
    lda #$14                                                          ; 4024: a9 14
    sta height_in_cells                                               ; 4026: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4028: 20 bb 1a
; draw 3x2 rectangle at (3,9)
    ldx #3                                                            ; 402b: a2 03
    ldy #9                                                            ; 402d: a0 09
    lda #2                                                            ; 402f: a9 02
    sta height_in_cells                                               ; 4031: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4033: 20 bb 1a
; draw 3x2 rectangle at (11,12)
    ldx #$0b                                                          ; 4036: a2 0b
    ldy #$0c                                                          ; 4038: a0 0c
    jsr copy_rectangle_of_memory_to_screen                            ; 403a: 20 bb 1a
; draw 3x2 rectangle at (26,9)
    ldx #$1a                                                          ; 403d: a2 1a
    ldy #9                                                            ; 403f: a0 09
    jsr copy_rectangle_of_memory_to_screen                            ; 4041: 20 bb 1a
; draw 3x2 rectangle at (34,11)
    ldx #$22 ; '"'                                                    ; 4044: a2 22
    ldy #$0b                                                          ; 4046: a0 0b
    jsr copy_rectangle_of_memory_to_screen                            ; 4048: 20 bb 1a
; draw 6x1 rectangle at (0,21)
    ldx #0                                                            ; 404b: a2 00
    ldy #$15                                                          ; 404d: a0 15
    lda #6                                                            ; 404f: a9 06
    sta width_in_cells                                                ; 4051: 85 3c
    lda #1                                                            ; 4053: a9 01
    sta height_in_cells                                               ; 4055: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4057: 20 bb 1a
; draw 255x255 rectangle at (0,22)
    iny                                                               ; 405a: c8
    lda #$ff                                                          ; 405b: a9 ff
    sta width_in_cells                                                ; 405d: 85 3c
    sta height_in_cells                                               ; 405f: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4061: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 4064: 20 90 1b
    ldx #3                                                            ; 4067: a2 03
    ldy #8                                                            ; 4069: a0 08
    jsr sub_c3c0b                                                     ; 406b: 20 0b 3c
    ldx #$1a                                                          ; 406e: a2 1a
    jsr sub_c3c0b                                                     ; 4070: 20 0b 3c
    ldx #$22 ; '"'                                                    ; 4073: a2 22
    ldy #$0a                                                          ; 4075: a0 0a
    jsr sub_c3c0b                                                     ; 4077: 20 0b 3c
; draw rope at (8,2) length 18
    ldx #8                                                            ; 407a: a2 08
    ldy #2                                                            ; 407c: a0 02
    lda #$12                                                          ; 407e: a9 12
    jsr draw_rope                                                     ; 4080: 20 b9 1d
; draw rope at (31,2) length 18
    ldx #$1f                                                          ; 4083: a2 1f
    jsr draw_rope                                                     ; 4085: 20 b9 1d
    jsr start_room                                                    ; 4088: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 408b: 20 da 12
    and #exit_room_left                                               ; 408e: 29 01
    beq room_0_game_update_loop                                       ; 4090: f0 f9
    ldx #1                                                            ; 4092: a2 01
    ldy current_level                                                 ; 4094: a4 31
    jmp initialise_level_and_room                                     ; 4096: 4c 40 11

l4099
    !byte   0, $da,   0,   0,   0,   0,   0,   0, $d7, $0a,   1,   0  ; 4099: 00 da 00...
    !byte $d7,   8,   0, $d8,   8,   0, $d8,   8,   0, $d9,   8,   0  ; 40a5: d7 08 00...
    !byte $d9,   8,   0, $da,   8,   0, $da,   8,   0, $d7,   8,   0  ; 40b1: d9 08 00...
    !byte   0, $d7, $fc,   0, $da, $fe,   2, $da, $fe,   4, $da,   0  ; 40bd: 00 d7 fc...
    !byte   6,   0, $da,   0,   8,   0                                ; 40c9: 06 00 da...

sub_c40cf
    lda #0                                                            ; 40cf: a9 00
    sta currently_updating_logic_for_room_index                       ; 40d1: 8d ba 1a
    ldx #$25 ; '%'                                                    ; 40d4: a2 25
    ldy #$11                                                          ; 40d6: a0 11
    lda #3                                                            ; 40d8: a9 03
    jsr update_brazier_and_fire                                       ; 40da: 20 88 19
    lda update_room_first_update_flag                                 ; 40dd: ad 2b 13
    bne c40e5                                                         ; 40e0: d0 03
    jmp c416e                                                         ; 40e2: 4c 6e 41

c40e5
    lda #$d3                                                          ; 40e5: a9 d3
    sta toolbar_collectable_spriteids+1                               ; 40e7: 8d e9 2e
    lda #$d2                                                          ; 40ea: a9 d2
    sta collectable_spriteids+1                                       ; 40ec: 8d ee 2e
    sta five_byte_table_paired_with_collectable_sprite_ids + 1        ; 40ef: 8d f3 2e
    ldx #$d8                                                          ; 40f2: a2 d8
    ldy #$45 ; 'E'                                                    ; 40f4: a0 45
    jsr define_envelope                                               ; 40f6: 20 5e 39
    lda current_level                                                 ; 40f9: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 40fb: c5 51
    beq c412a                                                         ; 40fd: f0 2b
    lda l0a13                                                         ; 40ff: ad 13 0a
    bmi c412a                                                         ; 4102: 30 26
    lda #0                                                            ; 4104: a9 00
    sta l0a75                                                         ; 4106: 8d 75 0a
    lda #1                                                            ; 4109: a9 01
    sta l0a73                                                         ; 410b: 8d 73 0a
    lda #$da                                                          ; 410e: a9 da
    sta l0a70                                                         ; 4110: 8d 70 0a
    lda #0                                                            ; 4113: a9 00
    sta l0a71                                                         ; 4115: 8d 71 0a
    lda #$3a ; ':'                                                    ; 4118: a9 3a
    sta l0a72                                                         ; 411a: 8d 72 0a
    lda #1                                                            ; 411d: a9 01
    sta l0a13                                                         ; 411f: 8d 13 0a
    sta l0a74                                                         ; 4122: 8d 74 0a
    lda #0                                                            ; 4125: a9 00
    sta level_workspace                                               ; 4127: 8d 6f 0a
c412a
    lda #$d6                                                          ; 412a: a9 d6
    sta l38ae                                                         ; 412c: 8d ae 38
    lda #$c0                                                          ; 412f: a9 c0
    sta l38c4                                                         ; 4131: 8d c4 38
    lda desired_room_index                                            ; 4134: a5 30
    cmp l0a75                                                         ; 4136: cd 75 0a
    bne c4166                                                         ; 4139: d0 2b
    lda l0a13                                                         ; 413b: ad 13 0a
    bmi c4166                                                         ; 413e: 30 26
    jsr sub_c431d                                                     ; 4140: 20 1d 43
    ldy l0a74                                                         ; 4143: ac 74 0a
    lda l4099,y                                                       ; 4146: b9 99 40
    sta l09aa                                                         ; 4149: 8d aa 09
loop_c414c
    lda desired_room_index                                            ; 414c: a5 30
    cmp l0a75                                                         ; 414e: cd 75 0a
    bne c4166                                                         ; 4151: d0 13
    lda level_workspace                                               ; 4153: ad 6f 0a
    beq c4166                                                         ; 4156: f0 0e
    dec level_workspace                                               ; 4158: ce 6f 0a
    ldx #2                                                            ; 415b: a2 02
    jsr l20f7                                                         ; 415d: 20 f7 20
    jsr sub_c4231                                                     ; 4160: 20 31 42
    jmp loop_c414c                                                    ; 4163: 4c 4c 41

c4166
    lda #0                                                            ; 4166: a9 00
    sta l09b5                                                         ; 4168: 8d b5 09
    jmp c4230                                                         ; 416b: 4c 30 42

c416e
    lda #0                                                            ; 416e: a9 00
    sta l4389                                                         ; 4170: 8d 89 43
    lda player_held_object_spriteid                                   ; 4173: a5 52
    sta l438a                                                         ; 4175: 8d 8a 43
    lda l09b5                                                         ; 4178: ad b5 09
    sta l438b                                                         ; 417b: 8d 8b 43
    lda l0a13                                                         ; 417e: ad 13 0a
    bmi c4195                                                         ; 4181: 30 12
    lda desired_room_index                                            ; 4183: a5 30
    cmp l0a75                                                         ; 4185: cd 75 0a
    beq c41dd                                                         ; 4188: f0 53
    lda level_workspace                                               ; 418a: ad 6f 0a
    bmi c4192                                                         ; 418d: 30 03
    inc level_workspace                                               ; 418f: ee 6f 0a
c4192
    jmp c4230                                                         ; 4192: 4c 30 42

c4195
    lda #$d3                                                          ; 4195: a9 d3
    cmp player_using_object_spriteid                                  ; 4197: cd b6 2e
    bne c4192                                                         ; 419a: d0 f6
    cmp previous_player_using_object_spriteid                         ; 419c: cd b7 2e
    beq c4192                                                         ; 419f: f0 f1
    dec l4389                                                         ; 41a1: ce 89 43
    lda desired_room_index                                            ; 41a4: a5 30
    sta l0a75                                                         ; 41a6: 8d 75 0a
    lda object_direction                                              ; 41a9: ad be 09
    sta l0a73                                                         ; 41ac: 8d 73 0a
    lda object_x_low+1                                                ; 41af: ad 51 09
    sta l0a70                                                         ; 41b2: 8d 70 0a
    lda object_x_high+1                                               ; 41b5: ad 67 09
    sta l0a71                                                         ; 41b8: 8d 71 0a
    lda object_y_low+1                                                ; 41bb: ad 7d 09
    sta l0a72                                                         ; 41be: 8d 72 0a
    lda #$0c                                                          ; 41c1: a9 0c
    sta l0a13                                                         ; 41c3: 8d 13 0a
    lda #5                                                            ; 41c6: a9 05
    sta l0a74                                                         ; 41c8: 8d 74 0a
    jsr sub_c431d                                                     ; 41cb: 20 1d 43
    lda object_spriteid+1                                             ; 41ce: ad a9 09
    sta l09aa                                                         ; 41d1: 8d aa 09
    ldx #2                                                            ; 41d4: a2 02
    jsr l20f7                                                         ; 41d6: 20 f7 20
    lda #0                                                            ; 41d9: a9 00
    sta player_held_object_spriteid                                   ; 41db: 85 52
c41dd
    jsr sub_c4231                                                     ; 41dd: 20 31 42
    lda desired_room_index                                            ; 41e0: a5 30
    cmp l0a75                                                         ; 41e2: cd 75 0a
    beq c41ec                                                         ; 41e5: f0 05
    lda #0                                                            ; 41e7: a9 00
    sta level_workspace                                               ; 41e9: 8d 6f 0a
c41ec
    lda l438b                                                         ; 41ec: ad 8b 43
    sta l09b5                                                         ; 41ef: 8d b5 09
    ldx #$0b                                                          ; 41f2: a2 0b
    ldy #2                                                            ; 41f4: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 41f6: 20 e2 28
    ldx l438a                                                         ; 41f9: ae 8a 43
    stx player_held_object_spriteid                                   ; 41fc: 86 52
    ora #0                                                            ; 41fe: 09 00
    beq c4219                                                         ; 4200: f0 17
    lda l4389                                                         ; 4202: ad 89 43
    bne c420c                                                         ; 4205: d0 05
    lda #$d3                                                          ; 4207: a9 d3
    jsr find_or_create_menu_slot_for_A                                ; 4209: 20 bd 2b
c420c
    lda #0                                                            ; 420c: a9 00
    sta l09aa                                                         ; 420e: 8d aa 09
    lda #$ff                                                          ; 4211: a9 ff
    sta l0a13                                                         ; 4213: 8d 13 0a
    jmp c4230                                                         ; 4216: 4c 30 42

c4219
    jsr sub_c433b                                                     ; 4219: 20 3b 43
    lda l4389                                                         ; 421c: ad 89 43
    beq c4230                                                         ; 421f: f0 0f
    lda #$d3                                                          ; 4221: a9 d3
    jsr remove_item_from_toolbar_menu                                 ; 4223: 20 e0 2b
    lda #0                                                            ; 4226: a9 00
    sta object_spriteid+1                                             ; 4228: 8d a9 09
    sta player_using_object_spriteid                                  ; 422b: 8d b6 2e
    sta player_held_object_spriteid                                   ; 422e: 85 52
c4230
    rts                                                               ; 4230: 60

sub_c4231
    lda l0a74                                                         ; 4231: ad 74 0a
    clc                                                               ; 4234: 18
    adc #3                                                            ; 4235: 69 03
    tay                                                               ; 4237: a8
    lda l4099,y                                                       ; 4238: b9 99 40
    bne c4240                                                         ; 423b: d0 03
    ldy l0a13                                                         ; 423d: ac 13 0a
c4240
    lda l0a13                                                         ; 4240: ad 13 0a
    cmp #$0c                                                          ; 4243: c9 0c
    bne c426a                                                         ; 4245: d0 23
    lda l0a73                                                         ; 4247: ad 73 0a
    bmi c4251                                                         ; 424a: 30 05
    inc temp_right_offset                                             ; 424c: ee d1 24
    bne c4254                                                         ; 424f: d0 03
c4251
    dec temp_left_offset                                              ; 4251: ce d0 24
c4254
    lda #1                                                            ; 4254: a9 01
    sta temp_bottom_offset                                            ; 4256: 8d 51 25
    lda #2                                                            ; 4259: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 425b: 20 94 28
    beq c4284                                                         ; 425e: f0 24
    lda #$32 ; '2'                                                    ; 4260: a9 32
    sta l0a13                                                         ; 4262: 8d 13 0a
    ldy #$25 ; '%'                                                    ; 4265: a0 25
    jmp c4284                                                         ; 4267: 4c 84 42

c426a
    cmp #$32 ; '2'                                                    ; 426a: c9 32
    bne c427f                                                         ; 426c: d0 11
    lda #2                                                            ; 426e: a9 02
    sta temp_bottom_offset                                            ; 4270: 8d 51 25
    lda #2                                                            ; 4273: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4275: 20 94 28
    beq c4284                                                         ; 4278: f0 0a
    ldy #1                                                            ; 427a: a0 01
    sty l0a13                                                         ; 427c: 8c 13 0a
c427f
    lda #0                                                            ; 427f: a9 00
    sta level_workspace                                               ; 4281: 8d 6f 0a
c4284
    sty l0a74                                                         ; 4284: 8c 74 0a
    lda l4099,y                                                       ; 4287: b9 99 40
    sta l09aa                                                         ; 428a: 8d aa 09
    iny                                                               ; 428d: c8
    lda l4099,y                                                       ; 428e: b9 99 40
    ldx l0a73                                                         ; 4291: ae 73 0a
    bpl c429b                                                         ; 4294: 10 05
    eor #$ff                                                          ; 4296: 49 ff
    clc                                                               ; 4298: 18
    adc #1                                                            ; 4299: 69 01
c429b
    ldx #0                                                            ; 429b: a2 00
    ora #0                                                            ; 429d: 09 00
    bpl c42a2                                                         ; 429f: 10 01
    dex                                                               ; 42a1: ca
c42a2
    clc                                                               ; 42a2: 18
    adc l0a70                                                         ; 42a3: 6d 70 0a
    sta l0a70                                                         ; 42a6: 8d 70 0a
    txa                                                               ; 42a9: 8a
    adc l0a71                                                         ; 42aa: 6d 71 0a
    sta l0a71                                                         ; 42ad: 8d 71 0a
    iny                                                               ; 42b0: c8
    lda l4099,y                                                       ; 42b1: b9 99 40
    clc                                                               ; 42b4: 18
    adc l0a72                                                         ; 42b5: 6d 72 0a
    sta l0a72                                                         ; 42b8: 8d 72 0a
    jsr sub_c431d                                                     ; 42bb: 20 1d 43
    lda #2                                                            ; 42be: a9 02
    jsr l25f5                                                         ; 42c0: 20 f5 25
    lda l0952                                                         ; 42c3: ad 52 09
    sta l0a70                                                         ; 42c6: 8d 70 0a
    lda l0968                                                         ; 42c9: ad 68 09
    sta l0a71                                                         ; 42cc: 8d 71 0a
    lda l097e                                                         ; 42cf: ad 7e 09
    sta l0a72                                                         ; 42d2: 8d 72 0a
    lda l0a13                                                         ; 42d5: ad 13 0a
    cmp #$0c                                                          ; 42d8: c9 0c
    bne c431c                                                         ; 42da: d0 40
    ldx #2                                                            ; 42dc: a2 02
    jsr l2434                                                         ; 42de: 20 34 24
    lda l0a73                                                         ; 42e1: ad 73 0a
    bmi c4302                                                         ; 42e4: 30 1c
    lda l0078                                                         ; 42e6: a5 78
    cmp #$28 ; '('                                                    ; 42e8: c9 28
    bcc c431c                                                         ; 42ea: 90 30
    lda l0a70                                                         ; 42ec: ad 70 0a
    sec                                                               ; 42ef: 38
    sbc #$40 ; '@'                                                    ; 42f0: e9 40
    sta l0a70                                                         ; 42f2: 8d 70 0a
    lda #0                                                            ; 42f5: a9 00
    sbc #0                                                            ; 42f7: e9 00
    sta l0a71                                                         ; 42f9: 8d 71 0a
    dec l0a75                                                         ; 42fc: ce 75 0a
    jmp c4317                                                         ; 42ff: 4c 17 43

c4302
    lda l0079                                                         ; 4302: a5 79
    bpl c431c                                                         ; 4304: 10 16
    lda l0a70                                                         ; 4306: ad 70 0a
    clc                                                               ; 4309: 18
    adc #$40 ; '@'                                                    ; 430a: 69 40
    sta l0a70                                                         ; 430c: 8d 70 0a
    lda #1                                                            ; 430f: a9 01
    sta l0a71                                                         ; 4311: 8d 71 0a
    inc l0a75                                                         ; 4314: ee 75 0a
c4317
    lda #0                                                            ; 4317: a9 00
    sta l09aa                                                         ; 4319: 8d aa 09
c431c
    rts                                                               ; 431c: 60

sub_c431d
    lda l0a70                                                         ; 431d: ad 70 0a
    sta l0952                                                         ; 4320: 8d 52 09
    lda l0a71                                                         ; 4323: ad 71 0a
    sta l0968                                                         ; 4326: 8d 68 09
    lda l0a72                                                         ; 4329: ad 72 0a
    sta l097e                                                         ; 432c: 8d 7e 09
    lda #0                                                            ; 432f: a9 00
    sta l0994                                                         ; 4331: 8d 94 09
    lda l0a73                                                         ; 4334: ad 73 0a
    sta l09c0                                                         ; 4337: 8d c0 09
    rts                                                               ; 433a: 60

sub_c433b
    lda desired_room_index                                            ; 433b: a5 30
    cmp l0a75                                                         ; 433d: cd 75 0a
    bne c4388                                                         ; 4340: d0 46
    lda #2                                                            ; 4342: a9 02
    sta temp_bottom_offset                                            ; 4344: 8d 51 25
    lda #2                                                            ; 4347: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4349: 20 94 28
    beq c4359                                                         ; 434c: f0 0b
    lda l097e                                                         ; 434e: ad 7e 09
    cmp l0989                                                         ; 4351: cd 89 09
    beq c4359                                                         ; 4354: f0 03
    jsr play_landing_sound                                            ; 4356: 20 a9 23
c4359
    lda l0952                                                         ; 4359: ad 52 09
    sec                                                               ; 435c: 38
    sbc l095d                                                         ; 435d: ed 5d 09
    beq c4388                                                         ; 4360: f0 26
    lda l0968                                                         ; 4362: ad 68 09
    sbc l0973                                                         ; 4365: ed 73 09
    bpl c4370                                                         ; 4368: 10 06
    dec temp_left_offset                                              ; 436a: ce d0 24
    jmp c4373                                                         ; 436d: 4c 73 43

c4370
    inc temp_right_offset                                             ; 4370: ee d1 24
c4373
    lda #1                                                            ; 4373: a9 01
    sta temp_bottom_offset                                            ; 4375: 8d 51 25
    lda #2                                                            ; 4378: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 437a: 20 94 28
    beq c4388                                                         ; 437d: f0 09
    lda #0                                                            ; 437f: a9 00
    ldx #$e6                                                          ; 4381: a2 e6
    ldy #$45 ; 'E'                                                    ; 4383: a0 45
    jsr play_sound_yx                                                 ; 4385: 20 f6 38
c4388
    rts                                                               ; 4388: 60

l4389
    !byte 0                                                           ; 4389: 00
l438a
    !byte 0                                                           ; 438a: 00
l438b
    !byte 0                                                           ; 438b: 00
; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 20                                                          ; 438c: 14                      ; initial player X cell
    !byte 22                                                          ; 438d: 16                      ; initial player Y cell

; ########################################
; ########################################
;                        ###     |     ###
;                        ###     |     ###
;                        ###     |     ###
;                        ###     |     ###
;                     OOO###     |     ###
; #############################  |     ###
; #############################  |     ###
; ###                            |     ###
; ###                            |     ###
; ###                            |     ###
; ###                            |     ###
; ###          OOO               |  OOO###
;              ###               |  ######
;              ###               |  ######
;                                |
;                                |
;                                |
; ######                         |
; ######
; ######              P             ######
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_1_code
    ldx #0                                                            ; 438e: a2 00
    ldy #0                                                            ; 4390: a0 00
    lda #$ff                                                          ; 4392: a9 ff
    sta width_in_cells                                                ; 4394: 85 3c
    lda #2                                                            ; 4396: a9 02
    sta height_in_cells                                               ; 4398: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 439a: 20 bb 1a
; draw 3x5 rectangle at (23,2)
    ldx #$17                                                          ; 439d: a2 17
    ldy #2                                                            ; 439f: a0 02
    lda #3                                                            ; 43a1: a9 03
    sta width_in_cells                                                ; 43a3: 85 3c
    lda #5                                                            ; 43a5: a9 05
    sta height_in_cells                                               ; 43a7: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43a9: 20 bb 1a
; draw 3x12 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 43ac: a2 25
    lda #$0c                                                          ; 43ae: a9 0c
    sta height_in_cells                                               ; 43b0: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43b2: 20 bb 1a
; draw 29x2 rectangle at (0,7)
    ldx #0                                                            ; 43b5: a2 00
    ldy #7                                                            ; 43b7: a0 07
    lda #$1d                                                          ; 43b9: a9 1d
    sta width_in_cells                                                ; 43bb: 85 3c
    lda #2                                                            ; 43bd: a9 02
    sta height_in_cells                                               ; 43bf: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43c1: 20 bb 1a
; draw 29x2 rectangle at (34,14)
    ldx #$22 ; '"'                                                    ; 43c4: a2 22
    ldy #$0e                                                          ; 43c6: a0 0e
    jsr copy_rectangle_of_memory_to_screen                            ; 43c8: 20 bb 1a
; draw 3x5 rectangle at (0,9)
    ldx #0                                                            ; 43cb: a2 00
    ldy #9                                                            ; 43cd: a0 09
    lda #3                                                            ; 43cf: a9 03
    sta width_in_cells                                                ; 43d1: 85 3c
    lda #5                                                            ; 43d3: a9 05
    sta height_in_cells                                               ; 43d5: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43d7: 20 bb 1a
; draw 3x2 rectangle at (13,14)
    ldx #$0d                                                          ; 43da: a2 0d
    ldy #$0e                                                          ; 43dc: a0 0e
    lda #3                                                            ; 43de: a9 03
    sta width_in_cells                                                ; 43e0: 85 3c
    lda #2                                                            ; 43e2: a9 02
    sta height_in_cells                                               ; 43e4: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43e6: 20 bb 1a
; draw 6x3 rectangle at (0,19)
    ldx #0                                                            ; 43e9: a2 00
    ldy #$13                                                          ; 43eb: a0 13
    lda #6                                                            ; 43ed: a9 06
    sta width_in_cells                                                ; 43ef: 85 3c
    lda #3                                                            ; 43f1: a9 03
    sta height_in_cells                                               ; 43f3: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43f5: 20 bb 1a
; draw 255x3 rectangle at (0,22)
    ldy #$16                                                          ; 43f8: a0 16
    lda #$ff                                                          ; 43fa: a9 ff
    sta width_in_cells                                                ; 43fc: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 43fe: 20 bb 1a
; draw 255x1 rectangle at (34,21)
    ldx #$22 ; '"'                                                    ; 4401: a2 22
    dey                                                               ; 4403: 88
    lda #1                                                            ; 4404: a9 01
    sta height_in_cells                                               ; 4406: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4408: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 440b: 20 90 1b
    ldx #$0d                                                          ; 440e: a2 0d
    ldy #$0d                                                          ; 4410: a0 0d
    jsr sub_c3c0b                                                     ; 4412: 20 0b 3c
    ldx #$14                                                          ; 4415: a2 14
    ldy #6                                                            ; 4417: a0 06
    jsr sub_c3c0b                                                     ; 4419: 20 0b 3c
    ldx #$22 ; '"'                                                    ; 441c: a2 22
    ldy #$0d                                                          ; 441e: a0 0d
    jsr sub_c3c0b                                                     ; 4420: 20 0b 3c
; draw rope at (31,2) length 18
    ldx #$1f                                                          ; 4423: a2 1f
    ldy #2                                                            ; 4425: a0 02
    lda #$12                                                          ; 4427: a9 12
    jsr draw_rope                                                     ; 4429: 20 b9 1d
    jsr start_room                                                    ; 442c: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 442f: 20 da 12
    sta room_exit_direction                                           ; 4432: 85 70
    and #exit_room_left                                               ; 4434: 29 01
    beq room_1_check_right_exit                                       ; 4436: f0 07
    ldx #2                                                            ; 4438: a2 02
    ldy current_level                                                 ; 443a: a4 31
    jmp initialise_level_and_room                                     ; 443c: 4c 40 11

room_1_check_right_exit
    lda room_exit_direction                                           ; 443f: a5 70
    and #exit_room_right                                              ; 4441: 29 04
    beq room_1_game_update_loop                                       ; 4443: f0 ea
    ldx #0                                                            ; 4445: a2 00
    ldy current_level                                                 ; 4447: a4 31
    jmp initialise_level_and_room                                     ; 4449: 4c 40 11

l444c
    !byte   0, $db,   0,   0,   0, $dc,   0,   0,   0, $dc, $f8,   0  ; 444c: 00 db 00...
    !byte $dd, $f8,   8, $dd, $fc,   4, $dd, $fc,   4,   0, $dd,   0  ; 4458: dd f8 08...
    !byte   8,   0, $dd,   0,   0,   0                                ; 4464: 08 00 dd...

sub_c446a
    lda update_room_first_update_flag                                 ; 446a: ad 2b 13
    beq c44bc                                                         ; 446d: f0 4d
    lda current_level                                                 ; 446f: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 4471: c5 51
    beq c449f                                                         ; 4473: f0 2a
    ldx #$70 ; 'p'                                                    ; 4475: a2 70
    ldy #$58 ; 'X'                                                    ; 4477: a0 58
    lda l0a14                                                         ; 4479: ad 14 0a
    cmp #1                                                            ; 447c: c9 01
    beq c4493                                                         ; 447e: f0 13
    cmp #5                                                            ; 4480: c9 05
    beq c4493                                                         ; 4482: f0 0f
    ora #0                                                            ; 4484: 09 00
    bne c448d                                                         ; 4486: d0 05
    lda #1                                                            ; 4488: a9 01
    jmp c4493                                                         ; 448a: 4c 93 44

c448d
    ldx #$58 ; 'X'                                                    ; 448d: a2 58
    ldy #$a8                                                          ; 448f: a0 a8
    lda #$1a                                                          ; 4491: a9 1a
c4493
    sta l0a14                                                         ; 4493: 8d 14 0a
    sta l0a76                                                         ; 4496: 8d 76 0a
    stx l0a77                                                         ; 4499: 8e 77 0a
    sty l0a78                                                         ; 449c: 8c 78 0a
c449f
    lda desired_room_index                                            ; 449f: a5 30
    cmp #1                                                            ; 44a1: c9 01
    bne c44b9                                                         ; 44a3: d0 14
    ldx #$ee                                                          ; 44a5: a2 ee
    ldy #$45 ; 'E'                                                    ; 44a7: a0 45
    jsr define_envelope                                               ; 44a9: 20 5e 39
    lda #$de                                                          ; 44ac: a9 de
    sta l38af                                                         ; 44ae: 8d af 38
    lda #0                                                            ; 44b1: a9 00
    sta l0969                                                         ; 44b3: 8d 69 09
    sta l0995                                                         ; 44b6: 8d 95 09
c44b9
    jmp c4551                                                         ; 44b9: 4c 51 45

c44bc
    lda l0a76                                                         ; 44bc: ad 76 0a
    clc                                                               ; 44bf: 18
    adc #3                                                            ; 44c0: 69 03
    tay                                                               ; 44c2: a8
    lda l444c,y                                                       ; 44c3: b9 4c 44
    bne c44cb                                                         ; 44c6: d0 03
    ldy l0a14                                                         ; 44c8: ac 14 0a
c44cb
    lda l0a14                                                         ; 44cb: ad 14 0a
    cmp #1                                                            ; 44ce: c9 01
    bne c44df                                                         ; 44d0: d0 0d
    jsr sub_c45a1                                                     ; 44d2: 20 a1 45
    beq c4538                                                         ; 44d5: f0 61
    ldy #5                                                            ; 44d7: a0 05
    sty l0a14                                                         ; 44d9: 8c 14 0a
    jmp c4538                                                         ; 44dc: 4c 38 45

c44df
    cmp #5                                                            ; 44df: c9 05
    bne c450b                                                         ; 44e1: d0 28
    jsr sub_c45a1                                                     ; 44e3: 20 a1 45
    beq c4538                                                         ; 44e6: f0 50
    lda desired_room_index                                            ; 44e8: a5 30
    cmp #1                                                            ; 44ea: c9 01
    bne c4501                                                         ; 44ec: d0 13
    lda #0                                                            ; 44ee: a9 00
    sta value_to_write_to_collision_map                               ; 44f0: 85 3e
    ldx #$0e                                                          ; 44f2: a2 0e
    ldy #$0b                                                          ; 44f4: a0 0b
    lda #1                                                            ; 44f6: a9 01
    sta width_in_cells                                                ; 44f8: 85 3c
    lda #2                                                            ; 44fa: a9 02
    sta height_in_cells                                               ; 44fc: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 44fe: 20 44 1e
c4501
    lda #$16                                                          ; 4501: a9 16
    sta l0a14                                                         ; 4503: 8d 14 0a
    ldy #9                                                            ; 4506: a0 09
    jmp c4538                                                         ; 4508: 4c 38 45

c450b
    cmp #$16                                                          ; 450b: c9 16
    bne c4538                                                         ; 450d: d0 29
    lda l0a78                                                         ; 450f: ad 78 0a
    cmp #$a0                                                          ; 4512: c9 a0
    bcc c4538                                                         ; 4514: 90 22
    bne c4533                                                         ; 4516: d0 1b
    lda desired_room_index                                            ; 4518: a5 30
    cmp #1                                                            ; 451a: c9 01
    bne c4538                                                         ; 451c: d0 1a
    lda #0                                                            ; 451e: a9 00
    ldx #4                                                            ; 4520: a2 04
    ldy #$46 ; 'F'                                                    ; 4522: a0 46
    jsr play_sound_yx                                                 ; 4524: 20 f6 38
    ldx #$fc                                                          ; 4527: a2 fc
    ldy #$45 ; 'E'                                                    ; 4529: a0 45
    jsr play_sound_yx                                                 ; 452b: 20 f6 38
    ldy #$16                                                          ; 452e: a0 16
    jmp c4538                                                         ; 4530: 4c 38 45

c4533
    ldy #$1a                                                          ; 4533: a0 1a
    sty l0a14                                                         ; 4535: 8c 14 0a
c4538
    sty l0a76                                                         ; 4538: 8c 76 0a
    iny                                                               ; 453b: c8
    lda l444c,y                                                       ; 453c: b9 4c 44
    clc                                                               ; 453f: 18
    adc l0a77                                                         ; 4540: 6d 77 0a
    sta l0a77                                                         ; 4543: 8d 77 0a
    iny                                                               ; 4546: c8
    lda l444c,y                                                       ; 4547: b9 4c 44
    clc                                                               ; 454a: 18
    adc l0a78                                                         ; 454b: 6d 78 0a
    sta l0a78                                                         ; 454e: 8d 78 0a
c4551
    lda desired_room_index                                            ; 4551: a5 30
    cmp #1                                                            ; 4553: c9 01
    bne c45a0                                                         ; 4555: d0 49
    ldy l0a76                                                         ; 4557: ac 76 0a
    lda l444c,y                                                       ; 455a: b9 4c 44
    sta l09ab                                                         ; 455d: 8d ab 09
    lda l0a77                                                         ; 4560: ad 77 0a
    sta l0953                                                         ; 4563: 8d 53 09
    lda l0a78                                                         ; 4566: ad 78 0a
    sta l097f                                                         ; 4569: 8d 7f 09
    lda #3                                                            ; 456c: a9 03
    sta value_to_write_to_collision_map                               ; 456e: 85 3e
    ldx #$0e                                                          ; 4570: a2 0e
    ldy #$0b                                                          ; 4572: a0 0b
    lda #1                                                            ; 4574: a9 01
    sta width_in_cells                                                ; 4576: 85 3c
    lda #2                                                            ; 4578: a9 02
    sta height_in_cells                                               ; 457a: 85 3d
    lda l0a14                                                         ; 457c: ad 14 0a
    cmp #1                                                            ; 457f: c9 01
    beq c4596                                                         ; 4581: f0 13
    cmp #5                                                            ; 4583: c9 05
    beq c4596                                                         ; 4585: f0 0f
    ldx #$0b                                                          ; 4587: a2 0b
    ldy #$15                                                          ; 4589: a0 15
    inc width_in_cells                                                ; 458b: e6 3c
    dec height_in_cells                                               ; 458d: c6 3d
    lda l0a78                                                         ; 458f: ad 78 0a
    cmp #$a8                                                          ; 4592: c9 a8
    bcc c45a0                                                         ; 4594: 90 0a
c4596
    jsr read_collision_map_value_for_xy                               ; 4596: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 4599: c5 3e
    beq c45a0                                                         ; 459b: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 459d: 20 44 1e
c45a0
    rts                                                               ; 45a0: 60

sub_c45a1
    lda #0                                                            ; 45a1: a9 00
    sta l45d6                                                         ; 45a3: 8d d6 45
    lda l0a75                                                         ; 45a6: ad 75 0a
    cmp #1                                                            ; 45a9: c9 01
    bne c45d2                                                         ; 45ab: d0 25
    ldx #2                                                            ; 45ad: a2 02
    lda object_spriteid,x                                             ; 45af: bd a8 09
    beq c45d2                                                         ; 45b2: f0 1e
    lda object_x_high,x                                               ; 45b4: bd 66 09
    bne c45d2                                                         ; 45b7: d0 19
    lda object_y_low,x                                                ; 45b9: bd 7c 09
    cmp #$70 ; 'p'                                                    ; 45bc: c9 70
    bcs c45d2                                                         ; 45be: b0 12
    sty l45d7                                                         ; 45c0: 8c d7 45
    jsr l2434                                                         ; 45c3: 20 34 24
    ldy l45d7                                                         ; 45c6: ac d7 45
    lda l0070                                                         ; 45c9: a5 70
    cmp #$78 ; 'x'                                                    ; 45cb: c9 78
    bne c45d2                                                         ; 45cd: d0 03
    dec l45d6                                                         ; 45cf: ce d6 45
c45d2
    lda l45d6                                                         ; 45d2: ad d6 45
    rts                                                               ; 45d5: 60

l45d6
    !byte 0                                                           ; 45d6: 00
l45d7
    !byte   0,   5,   1, $ff,   0,   0,   1,   1,   0, $6e, $fc,   0  ; 45d7: 00 05 01...
    !byte $f8, $6e,   0, $13,   0,   5,   0, $c9,   0,   1,   0,   6  ; 45e3: f8 6e 00...
    !byte   1,   0,   0,   0,   0,   0,   0, $37,   0,   0, $fa, $6e  ; 45ef: 01 00 00...
    !byte $37, $10,   0,   6,   0,   7,   0,   1,   0, $11,   0,   0  ; 45fb: 37 10 00...
    !byte   0, $d2,   0,   1,   0, $20, $10, $90, $61,   2,   2, $0c  ; 4607: 00 d2 00...
    !byte $10,   4,   8,   9, $86                                     ; 4613: 10 04 08...
    !text "@@0"                                                       ; 4618: 40 40 30
    !byte   8, $10, $0c,   2,   2, $61, $90, $10, $20,   8            ; 461b: 08 10 0c...
    !text "0@@"                                                       ; 4625: 30 40 40
    !byte $86,   9,   8,   4                                          ; 4628: 86 09 08...
sprite_data
pydis_end

; Automatically generated labels:
;     c3b0b
;     c3b15
;     c3b21
;     c3d12
;     c3d34
;     c3d37
;     c3d3a
;     c3d64
;     c3d6f
;     c3d85
;     c3d90
;     c3d95
;     c3d9f
;     c3db7
;     c3dcf
;     c3dd6
;     c3df6
;     c3e96
;     c40e5
;     c412a
;     c4166
;     c416e
;     c4192
;     c4195
;     c41dd
;     c41ec
;     c420c
;     c4219
;     c4230
;     c4240
;     c4251
;     c4254
;     c426a
;     c427f
;     c4284
;     c429b
;     c42a2
;     c4302
;     c4317
;     c431c
;     c4359
;     c4370
;     c4373
;     c4388
;     c448d
;     c4493
;     c449f
;     c44b9
;     c44bc
;     c44cb
;     c44df
;     c4501
;     c450b
;     c4533
;     c4538
;     c4551
;     c4596
;     c45a0
;     c45d2
;     l0078
;     l0079
;     l0952
;     l0953
;     l0954
;     l0955
;     l095d
;     l0968
;     l0969
;     l096a
;     l096b
;     l0973
;     l097e
;     l097f
;     l0980
;     l0981
;     l0989
;     l0994
;     l0995
;     l0996
;     l0997
;     l09aa
;     l09ab
;     l09ac
;     l09ad
;     l09b5
;     l09c0
;     l09c2
;     l09c3
;     l0a13
;     l0a14
;     l0a15
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
;     l20f7
;     l22de
;     l22df
;     l2434
;     l25f5
;     l38ae
;     l38af
;     l38b1
;     l38c4
;     l38c7
;     l3b40
;     l4099
;     l4389
;     l438a
;     l438b
;     l444c
;     l45d6
;     l45d7
;     loop_c414c
;     sub_c3c0b
;     sub_c3ce0
;     sub_c40cf
;     sub_c4231
;     sub_c431d
;     sub_c433b
;     sub_c446a
;     sub_c45a1
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
!if (level_specific_initialisation) != $3af6 {
    !error "Assertion failed: level_specific_initialisation == $3af6"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b34 {
    !error "Assertion failed: level_specific_update == $3b34"
}
!if (room_0_data) != $3ff2 {
    !error "Assertion failed: room_0_data == $3ff2"
}
!if (room_1_data) != $438c {
    !error "Assertion failed: room_1_data == $438c"
}
!if (room_2_data) != $3c18 {
    !error "Assertion failed: room_2_data == $3c18"
}
!if (room_3_data) != $3df7 {
    !error "Assertion failed: room_3_data == $3df7"
}
!if (sprite_data - level_data) != $0b57 {
    !error "Assertion failed: sprite_data - level_data == $0b57"
}
