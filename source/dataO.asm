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
room_exit_direction                                 = $70
l0078                                               = $78
l0079                                               = $79
show_dialog_box                                     = $040a
remove_dialog                                       = $0453
object_x_low                                        = $0950
l0952                                               = $0952
l0954                                               = $0954
l0955                                               = $0955
l0956                                               = $0956
object_x_low_old                                    = $095b
l095d                                               = $095d
object_x_high                                       = $0966
l0968                                               = $0968
l096b                                               = $096b
l096c                                               = $096c
object_x_high_old                                   = $0971
object_y_low                                        = $097c
l097e                                               = $097e
l0980                                               = $0980
l0981                                               = $0981
l0982                                               = $0982
object_y_low_old                                    = $0987
l0989                                               = $0989
object_y_high                                       = $0992
object_y_high_old                                   = $099d
object_spriteid                                     = $09a8
l09aa                                               = $09aa
l09ab                                               = $09ab
l09ac                                               = $09ac
l09ad                                               = $09ad
l09ae                                               = $09ae
object_spriteid_old                                 = $09b3
l09b5                                               = $09b5
object_direction                                    = $09be
l09c0                                               = $09c0
l09c3                                               = $09c3
l09c4                                               = $09c4
object_direction_old                                = $09c9
level_progress_table                                = $09ef
l0a55                                               = $0a55
l0a56                                               = $0a56
l0a57                                               = $0a57
l0a58                                               = $0a58
l0a59                                               = $0a59
l0a5a                                               = $0a5a
l0a5b                                               = $0a5b
l0a5c                                               = $0a5c
l0a5d                                               = $0a5d
l0a5e                                               = $0a5e
l0a5f                                               = $0a5f
l0a60                                               = $0a60
l0a61                                               = $0a61
level_workspace                                     = $0a6f
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
temp_top_offset                                     = $2550
temp_bottom_offset                                  = $2551
l25f5                                               = $25f5
l2770                                               = $2770
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
l2eeb                                               = $2eeb
collectable_spriteids                               = $2eed
l2ef0                                               = $2ef0
five_byte_table_paired_with_collectable_sprite_ids  = $2ef2
l2ef4                                               = $2ef4
l2ef5                                               = $2ef5
inhibit_monkey_climb_flag                           = $31d7
print_encrypted_string_at_yx_centred                = $37f3
wait_one_second_then_check_keys                     = $388d
object_sprite_mask_type                             = $38ac
l38ae                                               = $38ae
l38af                                               = $38af
l38b0                                               = $38b0
l38b1                                               = $38b1
l38b2                                               = $38b2
object_z_order                                      = $38c2
l38c4                                               = $38c4
l38c6                                               = $38c6
l38c7                                               = $38c7
l38c8                                               = $38c8
object_room_collision_flags                         = $38d8
play_sound_yx                                       = $38f6
define_envelope                                     = $395e
sound_priority_per_channel_table                    = $396f
check_menu_keys                                     = $3a8f
l3acc                                               = $3acc
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
    !word sprite_data - level_data                                    ; 3ad5: 12 0a                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f4 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 30 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
room_index_cheat1
    !byte 2                                                           ; 3add: 02
room_index_cheat2
    !byte 3                                                           ; 3ade: 03
level_room_data_table
    !word room_0_data                                                 ; 3adf: 40 3b                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: 92 3c
    !word room_2_data                                                 ; 3ae3: 83 40
    !word room_3_data                                                 ; 3ae5: d0 42

; *************************************************************************************
; 'DOWN-AND-OUT[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $8f, $84, $9c, $85, $e6, $8a, $85, $8f, $e6, $84, $9e, $9f  ; 3ae7: 8f 84 9c...
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
    beq c3b27                                                         ; 3af8: f0 2d
    lda developer_flags                                               ; 3afa: ad 03 11
    bpl c3b0a                                                         ; 3afd: 10 0b
    lda #$ff                                                          ; 3aff: a9 ff
    sta l0a55                                                         ; 3b01: 8d 55 0a
    sta l0a5d                                                         ; 3b04: 8d 5d 0a
    sta l0a60                                                         ; 3b07: 8d 60 0a
c3b0a
    lda l0a55                                                         ; 3b0a: ad 55 0a
    cmp #$ff                                                          ; 3b0d: c9 ff
    bne c3b1d                                                         ; 3b0f: d0 0c
    lda #$ca                                                          ; 3b11: a9 ca
    ldx l0a5d                                                         ; 3b13: ae 5d 0a
    beq c3b1a                                                         ; 3b16: f0 02
    lda #$cb                                                          ; 3b18: a9 cb
c3b1a
    jsr find_or_create_menu_slot_for_A                                ; 3b1a: 20 bd 2b
c3b1d
    lda l0a60                                                         ; 3b1d: ad 60 0a
    beq c3b27                                                         ; 3b20: f0 05
    lda #$d4                                                          ; 3b22: a9 d4
    jsr find_or_create_menu_slot_for_A                                ; 3b24: 20 bd 2b
c3b27
    lda #$c7                                                          ; 3b27: a9 c7
    sta source_sprite_memory_low                                      ; 3b29: 85 40
    lda #$44 ; 'D'                                                    ; 3b2b: a9 44
    sta source_sprite_memory_high                                     ; 3b2d: 85 41
    rts                                                               ; 3b2f: 60

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
    jsr sub_c3bcc                                                     ; 3b30: 20 cc 3b
    jsr sub_c3d61                                                     ; 3b33: 20 61 3d
    jsr sub_c434e                                                     ; 3b36: 20 4e 43
    jsr sub_c4035                                                     ; 3b39: 20 35 40
    jsr sub_c4115                                                     ; 3b3c: 20 15 41
    rts                                                               ; 3b3f: 60

; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 30                                                          ; 3b40: 1e                      ; initial player X cell
    !byte 14                                                          ; 3b41: 0e                      ; initial player Y cell

; ########################################
; ########################################
; ###            ###                   ###
; ###            ###                   ###
; ###            ###                   ###
; ###            ###                   ###
; ###            #########################
; ###            #########################
; ###            ###
; ###            ###
; ###            ###
; ###            ###
; ###            ###
; ###            ###            P      ###
; ##################    ##################
; ##################    ##################
; ###                   ###            ###
; ###                   ###            ###
; ###                   ###            ###
; ###                   ###            ###
; ###OOO                ###            ###
; ###OOO                ###            ###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_0_code
    ldx #0                                                            ; 3b42: a2 00
    ldy #0                                                            ; 3b44: a0 00
    lda #$ff                                                          ; 3b46: a9 ff
    sta width_in_cells                                                ; 3b48: 85 3c
    lda #2                                                            ; 3b4a: a9 02
    sta height_in_cells                                               ; 3b4c: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b4e: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3b51: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3b53: 20 bb 1a
; draw 3x20 rectangle at (0,2)
    ldy #2                                                            ; 3b56: a0 02
    lda #3                                                            ; 3b58: a9 03
    sta width_in_cells                                                ; 3b5a: 85 3c
    lda #$14                                                          ; 3b5c: a9 14
    sta height_in_cells                                               ; 3b5e: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b60: 20 bb 1a
; draw 3x14 rectangle at (15,2)
    ldx #$0f                                                          ; 3b63: a2 0f
    lda #$0e                                                          ; 3b65: a9 0e
    sta height_in_cells                                               ; 3b67: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b69: 20 bb 1a
; draw 3x8 rectangle at (22,14)
    ldx #$16                                                          ; 3b6c: a2 16
    ldy #$0e                                                          ; 3b6e: a0 0e
    lda #8                                                            ; 3b70: a9 08
    sta height_in_cells                                               ; 3b72: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b74: 20 bb 1a
; draw 3x9 rectangle at (37,13)
    ldx #$25 ; '%'                                                    ; 3b77: a2 25
    dey                                                               ; 3b79: 88
    inc height_in_cells                                               ; 3b7a: e6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b7c: 20 bb 1a
; draw 3x6 rectangle at (37,2)
    ldy #2                                                            ; 3b7f: a0 02
    lda #6                                                            ; 3b81: a9 06
    sta height_in_cells                                               ; 3b83: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b85: 20 bb 1a
; draw 12x2 rectangle at (3,14)
    ldx #3                                                            ; 3b88: a2 03
    ldy #$0e                                                          ; 3b8a: a0 0e
    lda #$0c                                                          ; 3b8c: a9 0c
    sta width_in_cells                                                ; 3b8e: 85 3c
    lda #2                                                            ; 3b90: a9 02
    sta height_in_cells                                               ; 3b92: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b94: 20 bb 1a
; draw 12x2 rectangle at (25,14)
    ldx #$19                                                          ; 3b97: a2 19
    jsr copy_rectangle_of_memory_to_screen                            ; 3b99: 20 bb 1a
; draw 19x2 rectangle at (18,6)
    ldx #$12                                                          ; 3b9c: a2 12
    ldy #6                                                            ; 3b9e: a0 06
    lda #$13                                                          ; 3ba0: a9 13
    sta width_in_cells                                                ; 3ba2: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3ba4: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3ba7: 20 90 1b
; draw sprite $cd at (3,20) of size (3x2)
    lda #3                                                            ; 3baa: a9 03
    sta width_in_cells                                                ; 3bac: 85 3c
    lda #2                                                            ; 3bae: a9 02
    sta height_in_cells                                               ; 3bb0: 85 3d
    ldx #3                                                            ; 3bb2: a2 03
    ldy #$14                                                          ; 3bb4: a0 14
    lda #$cd                                                          ; 3bb6: a9 cd
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bb8: 20 57 1f
    jsr start_room                                                    ; 3bbb: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 3bbe: 20 da 12
    and #exit_room_right                                              ; 3bc1: 29 04
    beq room_0_game_update_loop                                       ; 3bc3: f0 f9
    ldx #1                                                            ; 3bc5: a2 01
    ldy current_level                                                 ; 3bc7: a4 31
    jmp initialise_level_and_room                                     ; 3bc9: 4c 40 11

sub_c3bcc
    lda #0                                                            ; 3bcc: a9 00
    sta currently_updating_logic_for_room_index                       ; 3bce: 8d ba 1a
    ldx #4                                                            ; 3bd1: a2 04
    stx temp_sprite_x_offset                                          ; 3bd3: 86 3a
    ldy #$14                                                          ; 3bd5: a0 14
    lda #3                                                            ; 3bd7: a9 03
    jsr update_level_completion                                       ; 3bd9: 20 10 1a
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 3bdc: ad 2b 13
    beq c3c17                                                         ; 3bdf: f0 36
; check for level change (branch if not)
    lda current_level                                                 ; 3be1: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3be3: c5 51
    beq c3bff                                                         ; 3be5: f0 18
    lda l0a5e                                                         ; 3be7: ad 5e 0a
    cmp #$71 ; 'q'                                                    ; 3bea: c9 71
    bcs c3bfa                                                         ; 3bec: b0 0c
    lda l0a61                                                         ; 3bee: ad 61 0a
    bne c3bfa                                                         ; 3bf1: d0 07
    lda #$70 ; 'p'                                                    ; 3bf3: a9 70
    sta l0a5e                                                         ; 3bf5: 8d 5e 0a
    bne c3bff                                                         ; 3bf8: d0 05
c3bfa
    lda #$a8                                                          ; 3bfa: a9 a8
    sta l0a5e                                                         ; 3bfc: 8d 5e 0a
c3bff
    lda desired_room_index                                            ; 3bff: a5 30
    cmp #0                                                            ; 3c01: c9 00
    bne c3c14                                                         ; 3c03: d0 0f
    lda #$90                                                          ; 3c05: a9 90
    sta l0954                                                         ; 3c07: 8d 54 09
    lda #$ce                                                          ; 3c0a: a9 ce
    sta l09ac                                                         ; 3c0c: 8d ac 09
    lda #$cf                                                          ; 3c0f: a9 cf
    sta l38b0                                                         ; 3c11: 8d b0 38
c3c14
    jmp c3c58                                                         ; 3c14: 4c 58 3c

c3c17
    lda l0a5e                                                         ; 3c17: ad 5e 0a
    cmp #$a8                                                          ; 3c1a: c9 a8
    beq c3c58                                                         ; 3c1c: f0 3a
    cmp #$70 ; 'p'                                                    ; 3c1e: c9 70
    bne c3c40                                                         ; 3c20: d0 1e
    lda desired_room_index                                            ; 3c22: a5 30
    cmp #0                                                            ; 3c24: c9 00
    bne c3c58                                                         ; 3c26: d0 30
    lda developer_flags                                               ; 3c28: ad 03 11
    bpl c3c34                                                         ; 3c2b: 10 07
    ldx #$c9                                                          ; 3c2d: a2 c9
    jsr l3acc                                                         ; 3c2f: 20 cc 3a
    bne c3c40                                                         ; 3c32: d0 0c
c3c34
    lda l0a71                                                         ; 3c34: ad 71 0a
    cmp #2                                                            ; 3c37: c9 02
    bne c3c58                                                         ; 3c39: d0 1d
    lda l0a61                                                         ; 3c3b: ad 61 0a
    beq c3c58                                                         ; 3c3e: f0 18
c3c40
    lda l0a5e                                                         ; 3c40: ad 5e 0a
    clc                                                               ; 3c43: 18
    adc #8                                                            ; 3c44: 69 08
    sta l0a5e                                                         ; 3c46: 8d 5e 0a
    cmp #$a8                                                          ; 3c49: c9 a8
    bcc c3c58                                                         ; 3c4b: 90 0b
    lda #$a8                                                          ; 3c4d: a9 a8
    lda desired_room_index                                            ; 3c4f: a5 30
    cmp #0                                                            ; 3c51: c9 00
    bne c3c58                                                         ; 3c53: d0 03
    jsr sub_c4465                                                     ; 3c55: 20 65 44
c3c58
    lda desired_room_index                                            ; 3c58: a5 30
    cmp #0                                                            ; 3c5a: c9 00
    bne return1                                                       ; 3c5c: d0 33
    lda l0a5e                                                         ; 3c5e: ad 5e 0a
    sta l0980                                                         ; 3c61: 8d 80 09
    ldx #$12                                                          ; 3c64: a2 12
    lsr                                                               ; 3c66: 4a
    lsr                                                               ; 3c67: 4a
    lsr                                                               ; 3c68: 4a
    tay                                                               ; 3c69: a8
    lda #4                                                            ; 3c6a: a9 04
    sta width_in_cells                                                ; 3c6c: 85 3c
    lda #1                                                            ; 3c6e: a9 01
    sta height_in_cells                                               ; 3c70: 85 3d
    lda #collision_map_solid_rock                                     ; 3c72: a9 03
    sta value_to_write_to_collision_map                               ; 3c74: 85 3e
    lda l0a5e                                                         ; 3c76: ad 5e 0a
    cmp #$70 ; 'p'                                                    ; 3c79: c9 70
    beq c3c87                                                         ; 3c7b: f0 0a
    cmp #$a8                                                          ; 3c7d: c9 a8
    beq c3c87                                                         ; 3c7f: f0 06
    ldy #$0e                                                          ; 3c81: a0 0e
    lda #collision_map_none                                           ; 3c83: a9 00
    sta value_to_write_to_collision_map                               ; 3c85: 85 3e
c3c87
    jsr read_collision_map_value_for_xy                               ; 3c87: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3c8a: c5 3e
    beq return1                                                       ; 3c8c: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3c8e: 20 44 1e
return1
    rts                                                               ; 3c91: 60

; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 20                                                          ; 3c92: 14                      ; initial player X cell
    !byte 22                                                          ; 3c93: 16                      ; initial player Y cell

; ########################################
; ########################################
; ###                |             |   ###
; ###                |             |   ###
; ###                |             |   ###
; ###                |             |   ###
; ###                |             |   ###
; ###                |             |   ###
;                    |   #######   |   ###
;                    |   #######   |   ###
;                    |       ###   |   ###
;                    |       ###   |   ###
;                            ###   |   ###
; ###                        ###   |   ###
; ##############################   |   ###
; ##############################   |   ###
; ###                              |
; ###                              |
; ###                              |
; ###                              |
; ###OOO
; ###OOO              P                ###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_1_code
    ldx #0                                                            ; 3c94: a2 00
    ldy #0                                                            ; 3c96: a0 00
    lda #$ff                                                          ; 3c98: a9 ff
    sta width_in_cells                                                ; 3c9a: 85 3c
    lda #2                                                            ; 3c9c: a9 02
    sta height_in_cells                                               ; 3c9e: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ca0: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3ca3: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3ca5: 20 bb 1a
; draw 3x6 rectangle at (0,2)
    ldy #2                                                            ; 3ca8: a0 02
    lda #3                                                            ; 3caa: a9 03
    sta width_in_cells                                                ; 3cac: 85 3c
    lda #6                                                            ; 3cae: a9 06
    sta height_in_cells                                               ; 3cb0: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3cb2: 20 bb 1a
; draw 3x9 rectangle at (0,13)
    ldy #$0d                                                          ; 3cb5: a0 0d
    lda #9                                                            ; 3cb7: a9 09
    sta height_in_cells                                               ; 3cb9: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3cbb: 20 bb 1a
; draw 3x14 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3cbe: a2 25
    ldy #2                                                            ; 3cc0: a0 02
    lda #$0e                                                          ; 3cc2: a9 0e
    sta height_in_cells                                               ; 3cc4: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3cc6: 20 bb 1a
; draw 3x1 rectangle at (37,21)
    ldy #$15                                                          ; 3cc9: a0 15
    lda #1                                                            ; 3ccb: a9 01
    sta height_in_cells                                               ; 3ccd: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ccf: 20 bb 1a
; draw 24x2 rectangle at (3,14)
    ldx #3                                                            ; 3cd2: a2 03
    ldy #$0e                                                          ; 3cd4: a0 0e
    lda #$18                                                          ; 3cd6: a9 18
    sta width_in_cells                                                ; 3cd8: 85 3c
    lda #2                                                            ; 3cda: a9 02
    sta height_in_cells                                               ; 3cdc: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3cde: 20 bb 1a
; draw 4x2 rectangle at (23,8)
    ldx #$17                                                          ; 3ce1: a2 17
    ldy #8                                                            ; 3ce3: a0 08
    lda #4                                                            ; 3ce5: a9 04
    sta width_in_cells                                                ; 3ce7: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3ce9: 20 bb 1a
; draw 3x8 rectangle at (27,8)
    ldx #$1b                                                          ; 3cec: a2 1b
    lda #3                                                            ; 3cee: a9 03
    sta width_in_cells                                                ; 3cf0: 85 3c
    lda #8                                                            ; 3cf2: a9 08
    sta height_in_cells                                               ; 3cf4: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3cf6: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3cf9: 20 90 1b
; draw sprite $cd at (3,20) of size (3x2)
    lda #3                                                            ; 3cfc: a9 03
    sta width_in_cells                                                ; 3cfe: 85 3c
    lda #2                                                            ; 3d00: a9 02
    sta height_in_cells                                               ; 3d02: 85 3d
    ldx #3                                                            ; 3d04: a2 03
    ldy #$14                                                          ; 3d06: a0 14
    lda #$cd                                                          ; 3d08: a9 cd
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3d0a: 20 57 1f
; draw rope at (19,2) length 10
    ldx #$13                                                          ; 3d0d: a2 13
    ldy #2                                                            ; 3d0f: a0 02
    lda #$0a                                                          ; 3d11: a9 0a
    jsr draw_rope                                                     ; 3d13: 20 b9 1d
; draw rope at (33,2) length 18
    ldx #$21 ; '!'                                                    ; 3d16: a2 21
    lda #$12                                                          ; 3d18: a9 12
    jsr draw_rope                                                     ; 3d1a: 20 b9 1d
    jsr start_room                                                    ; 3d1d: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 3d20: 20 da 12
    sta room_exit_direction                                           ; 3d23: 85 70
    and #exit_room_left                                               ; 3d25: 29 01
    beq room_1_check_right_exit                                       ; 3d27: f0 07
    ldx #0                                                            ; 3d29: a2 00
    ldy current_level                                                 ; 3d2b: a4 31
    jmp initialise_level_and_room                                     ; 3d2d: 4c 40 11

room_1_check_right_exit
    lda room_exit_direction                                           ; 3d30: a5 70
    and #exit_room_right                                              ; 3d32: 29 04
    beq room_1_game_update_loop                                       ; 3d34: f0 ea
    ldx #2                                                            ; 3d36: a2 02
    ldy current_level                                                 ; 3d38: a4 31
    jmp initialise_level_and_room                                     ; 3d3a: 4c 40 11

l3d3d
    !byte   0,   0,   0,   7,   1,   6,   2,   4,   4,   2,   6, $80  ; 3d3d: 00 00 00...
    !byte   4,   1,   3,   2,   2,   4,   1,   6, $80,   0,   1,   0  ; 3d49: 04 01 03...
    !byte   2,   0,   4,   0,   6, $80,   0,   8, $80,   0,   0, $80  ; 3d55: 02 00 04...

sub_c3d61
    lda #1                                                            ; 3d61: a9 01
    sta currently_updating_logic_for_room_index                       ; 3d63: 8d ba 1a
    ldx #3                                                            ; 3d66: a2 03
    ldy #5                                                            ; 3d68: a0 05
    lda #3                                                            ; 3d6a: a9 03
    jsr update_brazier_and_fire                                       ; 3d6c: 20 88 19
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 3d6f: ad 2b 13
    bne c3d77                                                         ; 3d72: d0 03
    jmp c3e00                                                         ; 3d74: 4c 00 3e

c3d77
    ldx #<envelope1                                                   ; 3d77: a2 75
    ldy #>envelope1                                                   ; 3d79: a0 44
    jsr define_envelope                                               ; 3d7b: 20 5e 39
    lda #$ca                                                          ; 3d7e: a9 ca
    sta toolbar_collectable_spriteids+1                               ; 3d80: 8d e9 2e
    lda #$c8                                                          ; 3d83: a9 c8
    sta collectable_spriteids+1                                       ; 3d85: 8d ee 2e
    sta five_byte_table_paired_with_collectable_sprite_ids + 1        ; 3d88: 8d f3 2e
    lda #$cb                                                          ; 3d8b: a9 cb
    sta toolbar_collectable_spriteids+2                               ; 3d8d: 8d ea 2e
    lda #$c9                                                          ; 3d90: a9 c9
    sta collectable_spriteids+2                                       ; 3d92: 8d ef 2e
    sta l2ef4                                                         ; 3d95: 8d f4 2e
; check for level change (branch if not)
    lda current_level                                                 ; 3d98: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3d9a: c5 51
    beq c3dcf                                                         ; 3d9c: f0 31
    lda l0a55                                                         ; 3d9e: ad 55 0a
    beq c3dab                                                         ; 3da1: f0 08
    bmi c3dcf                                                         ; 3da3: 30 2a
    dec level_workspace                                               ; 3da5: ce 6f 0a
    jmp c3dcf                                                         ; 3da8: 4c cf 3d

c3dab
    lda #$1e                                                          ; 3dab: a9 1e
    sta l0a57                                                         ; 3dad: 8d 57 0a
    lda #0                                                            ; 3db0: a9 00
    sta l0a58                                                         ; 3db2: 8d 58 0a
    lda #1                                                            ; 3db5: a9 01
    sta l0a5a                                                         ; 3db7: 8d 5a 0a
    sta l0a5c                                                         ; 3dba: 8d 5c 0a
    lda #$9b                                                          ; 3dbd: a9 9b
    sta l0a59                                                         ; 3dbf: 8d 59 0a
    lda #1                                                            ; 3dc2: a9 01
    sta l0a5b                                                         ; 3dc4: 8d 5b 0a
    lda #$21 ; '!'                                                    ; 3dc7: a9 21
    sta l0a55                                                         ; 3dc9: 8d 55 0a
    sta l0a56                                                         ; 3dcc: 8d 56 0a
c3dcf
    lda desired_room_index                                            ; 3dcf: a5 30
    cmp l0a5b                                                         ; 3dd1: cd 5b 0a
    bne c3df8                                                         ; 3dd4: d0 22
    lda l0a55                                                         ; 3dd6: ad 55 0a
    bmi c3df8                                                         ; 3dd9: 30 1d
    jsr sub_c4002                                                     ; 3ddb: 20 02 40
loop_c3dde
    lda desired_room_index                                            ; 3dde: a5 30
    cmp l0a5b                                                         ; 3de0: cd 5b 0a
    bne c3df8                                                         ; 3de3: d0 13
    lda level_workspace                                               ; 3de5: ad 6f 0a
    beq c3df8                                                         ; 3de8: f0 0e
    dec level_workspace                                               ; 3dea: ce 6f 0a
    ldx #2                                                            ; 3ded: a2 02
    jsr l20f7                                                         ; 3def: 20 f7 20
    jsr sub_c3f28                                                     ; 3df2: 20 28 3f
    jmp loop_c3dde                                                    ; 3df5: 4c de 3d

c3df8
    lda #0                                                            ; 3df8: a9 00
    sta l09b5                                                         ; 3dfa: 8d b5 09
c3dfd
    jmp return2                                                       ; 3dfd: 4c 27 3f

c3e00
    lda #0                                                            ; 3e00: a9 00
    sta l4031                                                         ; 3e02: 8d 31 40
    lda player_held_object_spriteid                                   ; 3e05: a5 52
    sta l4032                                                         ; 3e07: 8d 32 40
    lda l09b5                                                         ; 3e0a: ad b5 09
    sta l4033                                                         ; 3e0d: 8d 33 40
    lda l0a55                                                         ; 3e10: ad 55 0a
    bmi c3e27                                                         ; 3e13: 30 12
    lda desired_room_index                                            ; 3e15: a5 30
    cmp l0a5b                                                         ; 3e17: cd 5b 0a
    beq c3e70                                                         ; 3e1a: f0 54
    lda level_workspace                                               ; 3e1c: ad 6f 0a
    bmi c3dfd                                                         ; 3e1f: 30 dc
    inc level_workspace                                               ; 3e21: ee 6f 0a
    jmp return2                                                       ; 3e24: 4c 27 3f

c3e27
    lda player_using_object_spriteid                                  ; 3e27: ad b6 2e
    cmp #$ca                                                          ; 3e2a: c9 ca
    beq c3e32                                                         ; 3e2c: f0 04
    cmp #$cb                                                          ; 3e2e: c9 cb
    bne c3dfd                                                         ; 3e30: d0 cb
c3e32
    cmp previous_player_using_object_spriteid                         ; 3e32: cd b7 2e
    beq c3dfd                                                         ; 3e35: f0 c6
    dec l4031                                                         ; 3e37: ce 31 40
    lda desired_room_index                                            ; 3e3a: a5 30
    sta l0a5b                                                         ; 3e3c: 8d 5b 0a
    lda object_direction                                              ; 3e3f: ad be 09
    sta l0a5a                                                         ; 3e42: 8d 5a 0a
    sta l0a5c                                                         ; 3e45: 8d 5c 0a
    lda object_x_low+1                                                ; 3e48: ad 51 09
    sta l0a57                                                         ; 3e4b: 8d 57 0a
    lda object_x_high+1                                               ; 3e4e: ad 67 09
    sta l0a58                                                         ; 3e51: 8d 58 0a
    lda object_y_low+1                                                ; 3e54: ad 7d 09
    sta l0a59                                                         ; 3e57: 8d 59 0a
    lda #1                                                            ; 3e5a: a9 01
    sta l0a56                                                         ; 3e5c: 8d 56 0a
    lda #$1e                                                          ; 3e5f: a9 1e
    sta l0a55                                                         ; 3e61: 8d 55 0a
    jsr sub_c4002                                                     ; 3e64: 20 02 40
    ldx #2                                                            ; 3e67: a2 02
    jsr l20f7                                                         ; 3e69: 20 f7 20
    lda #0                                                            ; 3e6c: a9 00
    sta player_held_object_spriteid                                   ; 3e6e: 85 52
c3e70
    jsr sub_c3f28                                                     ; 3e70: 20 28 3f
    lda desired_room_index                                            ; 3e73: a5 30
    cmp l0a5b                                                         ; 3e75: cd 5b 0a
    beq c3e7f                                                         ; 3e78: f0 05
    lda #0                                                            ; 3e7a: a9 00
    sta level_workspace                                               ; 3e7c: 8d 6f 0a
c3e7f
    lda l4033                                                         ; 3e7f: ad 33 40
    sta l09b5                                                         ; 3e82: 8d b5 09
    lda player_held_object_spriteid                                   ; 3e85: a5 52
    cmp #$d4                                                          ; 3e87: c9 d4
    bne c3e99                                                         ; 3e89: d0 0e
    lda #0                                                            ; 3e8b: a9 00
    sta player_held_object_spriteid                                   ; 3e8d: 85 52
    lda #4                                                            ; 3e8f: a9 04
    sta temp_left_offset                                              ; 3e91: 8d d0 24
    lda #$fc                                                          ; 3e94: a9 fc
    sta temp_right_offset                                             ; 3e96: 8d d1 24
c3e99
    ldx #objectid_old_player                                          ; 3e99: a2 0b
    ldy #2                                                            ; 3e9b: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 3e9d: 20 e2 28
    ldx l4032                                                         ; 3ea0: ae 32 40
    stx player_held_object_spriteid                                   ; 3ea3: 86 52
    ora #0                                                            ; 3ea5: 09 00
    beq c3ec7                                                         ; 3ea7: f0 1e
    lda l4031                                                         ; 3ea9: ad 31 40
    bne c3eba                                                         ; 3eac: d0 0c
    lda #$ca                                                          ; 3eae: a9 ca
    ldx l0a5d                                                         ; 3eb0: ae 5d 0a
    beq c3eb7                                                         ; 3eb3: f0 02
    lda #$cb                                                          ; 3eb5: a9 cb
c3eb7
    jsr find_or_create_menu_slot_for_A                                ; 3eb7: 20 bd 2b
c3eba
    lda #0                                                            ; 3eba: a9 00
    sta l09aa                                                         ; 3ebc: 8d aa 09
    lda #$ff                                                          ; 3ebf: a9 ff
    sta l0a55                                                         ; 3ec1: 8d 55 0a
    jmp return2                                                       ; 3ec4: 4c 27 3f

c3ec7
    lda l4031                                                         ; 3ec7: ad 31 40
    beq c3ee2                                                         ; 3eca: f0 16
    lda #$ca                                                          ; 3ecc: a9 ca
    ldx l0a5d                                                         ; 3ece: ae 5d 0a
    beq c3ed5                                                         ; 3ed1: f0 02
    lda #$cb                                                          ; 3ed3: a9 cb
c3ed5
    jsr remove_item_from_toolbar_menu                                 ; 3ed5: 20 e0 2b
    lda #0                                                            ; 3ed8: a9 00
    sta object_spriteid+1                                             ; 3eda: 8d a9 09
    sta player_using_object_spriteid                                  ; 3edd: 8d b6 2e
    sta player_held_object_spriteid                                   ; 3ee0: 85 52
c3ee2
    lda l0952                                                         ; 3ee2: ad 52 09
    cmp l095d                                                         ; 3ee5: cd 5d 09
    beq c3f07                                                         ; 3ee8: f0 1d
    lda l0a5c                                                         ; 3eea: ad 5c 0a
    bmi c3ef5                                                         ; 3eed: 30 06
    inc temp_right_offset                                             ; 3eef: ee d1 24
    jmp c3ef8                                                         ; 3ef2: 4c f8 3e

c3ef5
    dec temp_left_offset                                              ; 3ef5: ce d0 24
c3ef8
    lda #1                                                            ; 3ef8: a9 01
    sta temp_bottom_offset                                            ; 3efa: 8d 51 25
    lda #2                                                            ; 3efd: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 3eff: 20 94 28
    beq c3f07                                                         ; 3f02: f0 03
    jmp c3f1e                                                         ; 3f04: 4c 1e 3f

c3f07
    lda l097e                                                         ; 3f07: ad 7e 09
    cmp l0989                                                         ; 3f0a: cd 89 09
    beq return2                                                       ; 3f0d: f0 18
    dec temp_top_offset                                               ; 3f0f: ce 50 25
    lda #2                                                            ; 3f12: a9 02
    sta temp_bottom_offset                                            ; 3f14: 8d 51 25
    lda #2                                                            ; 3f17: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 3f19: 20 94 28
    beq return2                                                       ; 3f1c: f0 09
c3f1e
    lda #0                                                            ; 3f1e: a9 00
    ldx #<sound1                                                      ; 3f20: a2 83
    ldy #>sound1                                                      ; 3f22: a0 44
    jsr play_sound_yx                                                 ; 3f24: 20 f6 38
return2
    rts                                                               ; 3f27: 60

sub_c3f28
    lda l0a56                                                         ; 3f28: ad 56 0a
    clc                                                               ; 3f2b: 18
    adc #2                                                            ; 3f2c: 69 02
    tay                                                               ; 3f2e: a8
    lda l3d3d,y                                                       ; 3f2f: b9 3d 3d
    cmp #$80                                                          ; 3f32: c9 80
    bne c3f39                                                         ; 3f34: d0 03
    ldy l0a55                                                         ; 3f36: ac 55 0a
c3f39
    lda #2                                                            ; 3f39: a9 02
    jsr l2770                                                         ; 3f3b: 20 70 27
    bne c3f51                                                         ; 3f3e: d0 11
    lda l0a55                                                         ; 3f40: ad 55 0a
    cmp #$1e                                                          ; 3f43: c9 1e
    beq c3f77                                                         ; 3f45: f0 30
    ldy #$15                                                          ; 3f47: a0 15
    lda #$1e                                                          ; 3f49: a9 1e
    sta l0a55                                                         ; 3f4b: 8d 55 0a
    jmp c3f77                                                         ; 3f4e: 4c 77 3f

c3f51
    lda l2890                                                         ; 3f51: ad 90 28
    beq c3f6d                                                         ; 3f54: f0 17
    ldy #$1e                                                          ; 3f56: a0 1e
    sty l0a55                                                         ; 3f58: 8c 55 0a
    ldy #$0c                                                          ; 3f5b: a0 0c
    ldx #1                                                            ; 3f5d: a2 01
    stx l0a5c                                                         ; 3f5f: 8e 5c 0a
    ora #0                                                            ; 3f62: 09 00
    bpl c3f77                                                         ; 3f64: 10 11
    ldx #$ff                                                          ; 3f66: a2 ff
    stx l0a5c                                                         ; 3f68: 8e 5c 0a
    bne c3f77                                                         ; 3f6b: d0 0a
c3f6d
    ldy #$21 ; '!'                                                    ; 3f6d: a0 21
    sty l0a55                                                         ; 3f6f: 8c 55 0a
    lda #0                                                            ; 3f72: a9 00
    sta level_workspace                                               ; 3f74: 8d 6f 0a
c3f77
    sty l0a56                                                         ; 3f77: 8c 56 0a
    lda l3d3d,y                                                       ; 3f7a: b9 3d 3d
    ldx l0a5c                                                         ; 3f7d: ae 5c 0a
    bpl c3f87                                                         ; 3f80: 10 05
    eor #$ff                                                          ; 3f82: 49 ff
    clc                                                               ; 3f84: 18
    adc #1                                                            ; 3f85: 69 01
c3f87
    ldx #0                                                            ; 3f87: a2 00
    ora #0                                                            ; 3f89: 09 00
    bpl c3f8e                                                         ; 3f8b: 10 01
    dex                                                               ; 3f8d: ca
c3f8e
    clc                                                               ; 3f8e: 18
    adc l0a57                                                         ; 3f8f: 6d 57 0a
    sta l0a57                                                         ; 3f92: 8d 57 0a
    txa                                                               ; 3f95: 8a
    adc l0a58                                                         ; 3f96: 6d 58 0a
    sta l0a58                                                         ; 3f99: 8d 58 0a
    iny                                                               ; 3f9c: c8
    lda l3d3d,y                                                       ; 3f9d: b9 3d 3d
    clc                                                               ; 3fa0: 18
    adc l0a59                                                         ; 3fa1: 6d 59 0a
    sta l0a59                                                         ; 3fa4: 8d 59 0a
    jsr sub_c4002                                                     ; 3fa7: 20 02 40
    lda #2                                                            ; 3faa: a9 02
    jsr l25f5                                                         ; 3fac: 20 f5 25
    lda l0952                                                         ; 3faf: ad 52 09
    sta l0a57                                                         ; 3fb2: 8d 57 0a
    lda l0968                                                         ; 3fb5: ad 68 09
    sta l0a58                                                         ; 3fb8: 8d 58 0a
    lda l097e                                                         ; 3fbb: ad 7e 09
    sta l0a59                                                         ; 3fbe: 8d 59 0a
    ldx #2                                                            ; 3fc1: a2 02
    jsr l2434                                                         ; 3fc3: 20 34 24
    lda l0a5c                                                         ; 3fc6: ad 5c 0a
    bmi c3fe7                                                         ; 3fc9: 30 1c
    lda l0078                                                         ; 3fcb: a5 78
    cmp #$28 ; '('                                                    ; 3fcd: c9 28
    bcc return3                                                       ; 3fcf: 90 30
    lda l0a57                                                         ; 3fd1: ad 57 0a
    sec                                                               ; 3fd4: 38
    sbc #$40 ; '@'                                                    ; 3fd5: e9 40
    sta l0a57                                                         ; 3fd7: 8d 57 0a
    lda #0                                                            ; 3fda: a9 00
    sbc #0                                                            ; 3fdc: e9 00
    sta l0a58                                                         ; 3fde: 8d 58 0a
    inc l0a5b                                                         ; 3fe1: ee 5b 0a
    jmp c3ffc                                                         ; 3fe4: 4c fc 3f

c3fe7
    lda l0079                                                         ; 3fe7: a5 79
    bpl return3                                                       ; 3fe9: 10 16
    lda l0a57                                                         ; 3feb: ad 57 0a
    clc                                                               ; 3fee: 18
    adc #$40 ; '@'                                                    ; 3fef: 69 40
    sta l0a57                                                         ; 3ff1: 8d 57 0a
    lda #1                                                            ; 3ff4: a9 01
    sta l0a58                                                         ; 3ff6: 8d 58 0a
    dec l0a5b                                                         ; 3ff9: ce 5b 0a
c3ffc
    lda #0                                                            ; 3ffc: a9 00
    sta l09aa                                                         ; 3ffe: 8d aa 09
return3
    rts                                                               ; 4001: 60

sub_c4002
    lda #$cc                                                          ; 4002: a9 cc
    sta l38ae                                                         ; 4004: 8d ae 38
    lda #$a0                                                          ; 4007: a9 a0
    sta l38c4                                                         ; 4009: 8d c4 38
    lda l0a57                                                         ; 400c: ad 57 0a
    sta l0952                                                         ; 400f: 8d 52 09
    lda l0a58                                                         ; 4012: ad 58 0a
    sta l0968                                                         ; 4015: 8d 68 09
    lda l0a59                                                         ; 4018: ad 59 0a
    sta l097e                                                         ; 401b: 8d 7e 09
    lda #$c8                                                          ; 401e: a9 c8
    ldx l0a5d                                                         ; 4020: ae 5d 0a
    beq c4027                                                         ; 4023: f0 02
    lda #$c9                                                          ; 4025: a9 c9
c4027
    sta l09aa                                                         ; 4027: 8d aa 09
    lda l0a5a                                                         ; 402a: ad 5a 0a
    sta l09c0                                                         ; 402d: 8d c0 09
    rts                                                               ; 4030: 60

l4031
    !byte 0                                                           ; 4031: 00
l4032
    !byte 0                                                           ; 4032: 00
l4033
    !byte   0, $60                                                    ; 4033: 00 60

; check for first update in room (branch if not)
sub_c4035
    lda update_room_first_update_flag                                 ; 4035: ad 2b 13
    beq c406e                                                         ; 4038: f0 34
    lda desired_room_index                                            ; 403a: a5 30
    cmp #1                                                            ; 403c: c9 01
    bne c406b                                                         ; 403e: d0 2b
    ldx #$19                                                          ; 4040: a2 19
    ldy #$0a                                                          ; 4042: a0 0a
    lda #2                                                            ; 4044: a9 02
    sta width_in_cells                                                ; 4046: 85 3c
    lda #4                                                            ; 4048: a9 04
    sta height_in_cells                                               ; 404a: 85 3d
    lda #collision_map_solid_rock                                     ; 404c: a9 03
    sta value_to_write_to_collision_map                               ; 404e: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 4050: 20 44 1e
    ldy #$0e                                                          ; 4053: a0 0e
    lda #$e4                                                          ; 4055: a9 e4
    jsr draw_sprite_a_at_cell_xy                                      ; 4057: 20 4c 1f
    ldx #$19                                                          ; 405a: a2 19
    lda #5                                                            ; 405c: a9 05
    sta temp_sprite_x_offset                                          ; 405e: 85 3a
    ldy #$0c                                                          ; 4060: a0 0c
    lda #2                                                            ; 4062: a9 02
    sta temp_sprite_y_offset                                          ; 4064: 85 3b
    lda #4                                                            ; 4066: a9 04
    jsr set_object_position_from_cell_xy                              ; 4068: 20 5d 1f
c406b
    jmp c4071                                                         ; 406b: 4c 71 40

c406e
    inc l0a70                                                         ; 406e: ee 70 0a
c4071
    lda desired_room_index                                            ; 4071: a5 30
    cmp #1                                                            ; 4073: c9 01
    bne return4                                                       ; 4075: d0 0b
    lda l0a70                                                         ; 4077: ad 70 0a
    and #7                                                            ; 407a: 29 07
    clc                                                               ; 407c: 18
    adc #$3c ; '<'                                                    ; 407d: 69 3c
    sta l09ac                                                         ; 407f: 8d ac 09
return4
    rts                                                               ; 4082: 60

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 20                                                          ; 4083: 14                      ; initial player X cell
    !byte 22                                                          ; 4084: 16                      ; initial player Y cell

; ########################################
; ########################################
; ###   |             |                ###
; ###   |             |                ###
; ###   |             |                ###
; ###   |             |                ###
; ###   |             |                ###
; ###   |             |                ###
; ###   |   #######   |
; ###   |   #######   |
; ###   |   ###       |
; ###   |   ###       |
; ###   |   ###
; ###   |   ###                        ###
; ###   |   ##############################
; ###   |   ##############################
;       |                              ###
;       |                              ###
;       |                              ###
;       |                              ###
;                                      ###
; ###                 P                ###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_2_code
    ldx #0                                                            ; 4085: a2 00
    ldy #0                                                            ; 4087: a0 00
    lda #$ff                                                          ; 4089: a9 ff
    sta width_in_cells                                                ; 408b: 85 3c
    lda #2                                                            ; 408d: a9 02
    sta height_in_cells                                               ; 408f: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4091: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 4094: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 4096: 20 bb 1a
; draw 3x14 rectangle at (0,2)
    ldy #2                                                            ; 4099: a0 02
    lda #3                                                            ; 409b: a9 03
    sta width_in_cells                                                ; 409d: 85 3c
    lda #$0e                                                          ; 409f: a9 0e
    sta height_in_cells                                               ; 40a1: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 40a3: 20 bb 1a
; draw 3x1 rectangle at (0,21)
    ldy #$15                                                          ; 40a6: a0 15
    lda #1                                                            ; 40a8: a9 01
    sta height_in_cells                                               ; 40aa: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 40ac: 20 bb 1a
; draw 3x6 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 40af: a2 25
    ldy #2                                                            ; 40b1: a0 02
    lda #6                                                            ; 40b3: a9 06
    sta height_in_cells                                               ; 40b5: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 40b7: 20 bb 1a
; draw 3x9 rectangle at (37,13)
    ldy #$0d                                                          ; 40ba: a0 0d
    lda #9                                                            ; 40bc: a9 09
    sta height_in_cells                                               ; 40be: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 40c0: 20 bb 1a
; draw 3x8 rectangle at (10,8)
    ldx #$0a                                                          ; 40c3: a2 0a
    ldy #8                                                            ; 40c5: a0 08
    lda #8                                                            ; 40c7: a9 08
    sta height_in_cells                                               ; 40c9: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 40cb: 20 bb 1a
; draw 4x2 rectangle at (13,8)
    ldx #$0d                                                          ; 40ce: a2 0d
    inc width_in_cells                                                ; 40d0: e6 3c
    lda #2                                                            ; 40d2: a9 02
    sta height_in_cells                                               ; 40d4: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 40d6: 20 bb 1a
; draw 24x2 rectangle at (13,14)
    ldy #$0e                                                          ; 40d9: a0 0e
    lda #$18                                                          ; 40db: a9 18
    sta width_in_cells                                                ; 40dd: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 40df: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 40e2: 20 90 1b
; draw rope at (6,2) length 18
    ldx #6                                                            ; 40e5: a2 06
    ldy #2                                                            ; 40e7: a0 02
    lda #$12                                                          ; 40e9: a9 12
    jsr draw_rope                                                     ; 40eb: 20 b9 1d
; draw rope at (20,2) length 10
    ldx #$14                                                          ; 40ee: a2 14
    lda #$0a                                                          ; 40f0: a9 0a
    jsr draw_rope                                                     ; 40f2: 20 b9 1d
    jsr start_room                                                    ; 40f5: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 40f8: 20 da 12
    sta room_exit_direction                                           ; 40fb: 85 70
    and #exit_room_left                                               ; 40fd: 29 01
    beq room_2_check_right_exit                                       ; 40ff: f0 07
    ldx #1                                                            ; 4101: a2 01
    ldy current_level                                                 ; 4103: a4 31
    jmp initialise_level_and_room                                     ; 4105: 4c 40 11

room_2_check_right_exit
    lda room_exit_direction                                           ; 4108: a5 70
    and #exit_room_right                                              ; 410a: 29 04
    beq room_2_game_update_loop                                       ; 410c: f0 ea
    ldx #3                                                            ; 410e: a2 03
    ldy current_level                                                 ; 4110: a4 31
    jmp initialise_level_and_room                                     ; 4112: 4c 40 11

sub_c4115
    lda #2                                                            ; 4115: a9 02
    sta currently_updating_logic_for_room_index                       ; 4117: 8d ba 1a
    ldx #$25 ; '%'                                                    ; 411a: a2 25
    ldy #5                                                            ; 411c: a0 05
    lda #3                                                            ; 411e: a9 03
    jsr update_brazier_and_fire                                       ; 4120: 20 88 19
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 4123: ad 2b 13
    beq c4183                                                         ; 4126: f0 5b
    ldx #<envelope2                                                   ; 4128: a2 a9
    ldy #>envelope2                                                   ; 412a: a0 44
    jsr define_envelope                                               ; 412c: 20 5e 39
    lda #$d4                                                          ; 412f: a9 d4
    sta l2eeb                                                         ; 4131: 8d eb 2e
    lda #$d7                                                          ; 4134: a9 d7
    sta l2ef0                                                         ; 4136: 8d f0 2e
    lda #$d6                                                          ; 4139: a9 d6
    sta l2ef5                                                         ; 413b: 8d f5 2e
; check for level change (branch if not)
    lda current_level                                                 ; 413e: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 4140: c5 51
    beq c414e                                                         ; 4142: f0 0a
    lda l0a60                                                         ; 4144: ad 60 0a
    beq c414e                                                         ; 4147: f0 05
    lda #$ff                                                          ; 4149: a9 ff
    sta l0a60                                                         ; 414b: 8d 60 0a
c414e
    lda #$db                                                          ; 414e: a9 db
    sta l38b1                                                         ; 4150: 8d b1 38
    lda #$40 ; '@'                                                    ; 4153: a9 40
    sta l38c7                                                         ; 4155: 8d c7 38
    lda #$d8                                                          ; 4158: a9 d8
    sta l38b2                                                         ; 415a: 8d b2 38
    lda #$90                                                          ; 415d: a9 90
    sta l38c8                                                         ; 415f: 8d c8 38
    lda desired_room_index                                            ; 4162: a5 30
    cmp #2                                                            ; 4164: c9 02
    bne c4180                                                         ; 4166: d0 18
    lda l0a60                                                         ; 4168: ad 60 0a
    bne c4180                                                         ; 416b: d0 13
    lda #$cf                                                          ; 416d: a9 cf
    sta l38b0                                                         ; 416f: 8d b0 38
    ldx #$0d                                                          ; 4172: a2 0d
    ldy #$0e                                                          ; 4174: a0 0e
    lda #4                                                            ; 4176: a9 04
    jsr set_object_position_from_cell_xy                              ; 4178: 20 5d 1f
    lda #$d5                                                          ; 417b: a9 d5
    sta l09ac                                                         ; 417d: 8d ac 09
c4180
    jmp c4260                                                         ; 4180: 4c 60 42

c4183
    lda l0a71                                                         ; 4183: ad 71 0a
    beq c4191                                                         ; 4186: f0 09
    clc                                                               ; 4188: 18
    adc #1                                                            ; 4189: 69 01
    cmp #3                                                            ; 418b: c9 03
    bcc c4191                                                         ; 418d: 90 02
    lda #0                                                            ; 418f: a9 00
c4191
    sta l0a71                                                         ; 4191: 8d 71 0a
    lda l0a60                                                         ; 4194: ad 60 0a
    beq c419d                                                         ; 4197: f0 04
    bmi c41be                                                         ; 4199: 30 23
    bpl c41ea                                                         ; 419b: 10 4d
c419d
    lda desired_room_index                                            ; 419d: a5 30
    cmp #2                                                            ; 419f: c9 02
    bne c41bb                                                         ; 41a1: d0 18
    ldx #objectid_old_player                                          ; 41a3: a2 0b
    ldy #4                                                            ; 41a5: a0 04
    jsr test_for_collision_between_objects_x_and_y                    ; 41a7: 20 e2 28
    beq c41bb                                                         ; 41aa: f0 0f
    lda #$d4                                                          ; 41ac: a9 d4
    jsr find_or_create_menu_slot_for_A                                ; 41ae: 20 bd 2b
    lda #0                                                            ; 41b1: a9 00
    sta l09ac                                                         ; 41b3: 8d ac 09
    lda #$ff                                                          ; 41b6: a9 ff
    sta l0a60                                                         ; 41b8: 8d 60 0a
c41bb
    jmp c4260                                                         ; 41bb: 4c 60 42

c41be
    lda developer_flags                                               ; 41be: ad 03 11
    bpl c41ca                                                         ; 41c1: 10 07
    ldx #$a9                                                          ; 41c3: a2 a9
    jsr l3acc                                                         ; 41c5: 20 cc 3a
    bne c41e2                                                         ; 41c8: d0 18
c41ca
    lda desired_room_index                                            ; 41ca: a5 30
    cmp #1                                                            ; 41cc: c9 01
    bne c41bb                                                         ; 41ce: d0 eb
    lda player_held_object_spriteid                                   ; 41d0: a5 52
    cmp #$d4                                                          ; 41d2: c9 d4
    bne c41bb                                                         ; 41d4: d0 e5
    dec temp_left_offset                                              ; 41d6: ce d0 24
    ldx #4                                                            ; 41d9: a2 04
    ldy #objectid_player_accessory                                    ; 41db: a0 01
    jsr test_for_collision_between_objects_x_and_y                    ; 41dd: 20 e2 28
    beq c41bb                                                         ; 41e0: f0 d9
c41e2
    lda #1                                                            ; 41e2: a9 01
    sta l0a60                                                         ; 41e4: 8d 60 0a
    jmp c4260                                                         ; 41e7: 4c 60 42

c41ea
    ldy l0a60                                                         ; 41ea: ac 60 0a
    iny                                                               ; 41ed: c8
    cpy #9                                                            ; 41ee: c0 09
    bcc c41f4                                                         ; 41f0: 90 02
    ldy #1                                                            ; 41f2: a0 01
c41f4
    lda player_held_object_spriteid                                   ; 41f4: a5 52
    cmp #$d4                                                          ; 41f6: c9 d4
    beq c41fc                                                         ; 41f8: f0 02
    ldy #$ff                                                          ; 41fa: a0 ff
c41fc
    sty l0a60                                                         ; 41fc: 8c 60 0a
    lda l0a71                                                         ; 41ff: ad 71 0a
    bne c4260                                                         ; 4202: d0 5c
    lda l0a5d                                                         ; 4204: ad 5d 0a
    beq c4260                                                         ; 4207: f0 57
    ldx #objectid_old_player_accessory                                ; 4209: a2 0c
    ldy #2                                                            ; 420b: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 420d: 20 e2 28
    beq c4260                                                         ; 4210: f0 4e
    lda #0                                                            ; 4212: a9 00
    sta l0a5d                                                         ; 4214: 8d 5d 0a
    lda #$ff                                                          ; 4217: a9 ff
    sta l0a60                                                         ; 4219: 8d 60 0a
    lda #1                                                            ; 421c: a9 01
    sta l0a71                                                         ; 421e: 8d 71 0a
    lda #0                                                            ; 4221: a9 00
    ldx #<sound2                                                      ; 4223: a2 bf
    ldy #>sound2                                                      ; 4225: a0 44
    jsr play_sound_yx                                                 ; 4227: 20 f6 38
    ldx #<sound3                                                      ; 422a: a2 b7
    ldy #>sound3                                                      ; 422c: a0 44
    jsr play_sound_yx                                                 ; 422e: 20 f6 38
    lda object_x_low                                                  ; 4231: ad 50 09
    sec                                                               ; 4234: 38
    sbc l0952                                                         ; 4235: ed 52 09
    lda object_x_high                                                 ; 4238: ad 66 09
    sbc l0968                                                         ; 423b: ed 68 09
    bmi c4248                                                         ; 423e: 30 08
    lda #6                                                            ; 4240: a9 06
    sta player_wall_collision_flag                                    ; 4242: 8d 33 24
    jmp c424d                                                         ; 4245: 4c 4d 42

c4248
    lda #$fa                                                          ; 4248: a9 fa
    sta player_wall_collision_flag                                    ; 424a: 8d 33 24
c424d
    lda #6                                                            ; 424d: a9 06
    sta temp_left_offset                                              ; 424f: 8d d0 24
    ldx #2                                                            ; 4252: a2 02
    ldy #4                                                            ; 4254: a0 04
    jsr test_for_collision_between_objects_x_and_y                    ; 4256: 20 e2 28
    beq c4260                                                         ; 4259: f0 05
    lda #$ff                                                          ; 425b: a9 ff
    sta l0a61                                                         ; 425d: 8d 61 0a
c4260
    lda l0952                                                         ; 4260: ad 52 09
    sta l0956                                                         ; 4263: 8d 56 09
    lda l0968                                                         ; 4266: ad 68 09
    sta l096c                                                         ; 4269: 8d 6c 09
    lda l097e                                                         ; 426c: ad 7e 09
    sta l0982                                                         ; 426f: 8d 82 09
    lda l09c0                                                         ; 4272: ad c0 09
    sta l09c4                                                         ; 4275: 8d c4 09
    ldy l0a71                                                         ; 4278: ac 71 0a
    lda l42cd,y                                                       ; 427b: b9 cd 42
    sta l09ae                                                         ; 427e: 8d ae 09
    lda #0                                                            ; 4281: a9 00
    sta l09ad                                                         ; 4283: 8d ad 09
    lda l0a60                                                         ; 4286: ad 60 0a
    beq return5                                                       ; 4289: f0 41
    bmi return5                                                       ; 428b: 30 3f
    clc                                                               ; 428d: 18
    adc #$db                                                          ; 428e: 69 db
    sta l09ad                                                         ; 4290: 8d ad 09
    lda object_x_low+1                                                ; 4293: ad 51 09
    sta l0955                                                         ; 4296: 8d 55 09
    lda object_x_high+1                                               ; 4299: ad 67 09
    sta l096b                                                         ; 429c: 8d 6b 09
    lda object_y_low+1                                                ; 429f: ad 7d 09
    sta l0981                                                         ; 42a2: 8d 81 09
    lda object_direction+1                                            ; 42a5: ad bf 09
    sta l09c3                                                         ; 42a8: 8d c3 09
    lda player_using_object_spriteid                                  ; 42ab: ad b6 2e
    cmp #$d4                                                          ; 42ae: c9 d4
    bne return5                                                       ; 42b0: d0 1a
    lda l0955                                                         ; 42b2: ad 55 09
    clc                                                               ; 42b5: 18
    adc #0                                                            ; 42b6: 69 00
    sta l0955                                                         ; 42b8: 8d 55 09
    lda l096b                                                         ; 42bb: ad 6b 09
    adc #0                                                            ; 42be: 69 00
    sta l096b                                                         ; 42c0: 8d 6b 09
    lda l0981                                                         ; 42c3: ad 81 09
    clc                                                               ; 42c6: 18
    adc #$fc                                                          ; 42c7: 69 fc
    sta l0981                                                         ; 42c9: 8d 81 09
return5
    rts                                                               ; 42cc: 60

l42cd
    !byte   0, $d9, $d9                                               ; 42cd: 00 d9 d9
; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 10                                                          ; 42d0: 0a                      ; initial player X cell
    !byte 14                                                          ; 42d1: 0e                      ; initial player Y cell

; ########################################
; ########################################
; ###                     ###          ###
; ###                     ###          ###
; ###                     ###          ###
; ###                     ###          ###
; ###########################          ###
; ###########################          ###
;                     |   ###          ###
;                     |   ###          ###
;                     |   ###          ###
;                     |   ###          ###
;                     |   ###          ###
; ###       P         |   ###          ###
; #################   |   ################
; #################   |   ################
; ###                 |                ###
; ###                 |                ###
; ###                 |                ###
; ###                 |                ###
; ###                                  ###
; ###                                  ###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
room_3_code
    ldx #0                                                            ; 42d2: a2 00
    ldy #0                                                            ; 42d4: a0 00
    lda #$ff                                                          ; 42d6: a9 ff
    sta width_in_cells                                                ; 42d8: 85 3c
    lda #2                                                            ; 42da: a9 02
    sta height_in_cells                                               ; 42dc: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42de: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 42e1: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 42e3: 20 bb 1a
; draw 3x6 rectangle at (0,2)
    ldy #2                                                            ; 42e6: a0 02
    lda #3                                                            ; 42e8: a9 03
    sta width_in_cells                                                ; 42ea: 85 3c
    lda #6                                                            ; 42ec: a9 06
    sta height_in_cells                                               ; 42ee: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42f0: 20 bb 1a
; draw 3x9 rectangle at (0,13)
    ldy #$0d                                                          ; 42f3: a0 0d
    lda #9                                                            ; 42f5: a9 09
    sta height_in_cells                                               ; 42f7: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42f9: 20 bb 1a
; draw 3x14 rectangle at (24,2)
    ldx #$18                                                          ; 42fc: a2 18
    ldy #2                                                            ; 42fe: a0 02
    lda #$0e                                                          ; 4300: a9 0e
    sta height_in_cells                                               ; 4302: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4304: 20 bb 1a
; draw 3x20 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 4307: a2 25
    lda #$14                                                          ; 4309: a9 14
    sta height_in_cells                                               ; 430b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 430d: 20 bb 1a
; draw 21x2 rectangle at (3,6)
    ldx #3                                                            ; 4310: a2 03
    ldy #6                                                            ; 4312: a0 06
    lda #$15                                                          ; 4314: a9 15
    sta width_in_cells                                                ; 4316: 85 3c
    lda #2                                                            ; 4318: a9 02
    sta height_in_cells                                               ; 431a: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 431c: 20 bb 1a
; draw 14x2 rectangle at (3,14)
    ldy #$0e                                                          ; 431f: a0 0e
    lda #$0e                                                          ; 4321: a9 0e
    sta width_in_cells                                                ; 4323: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 4325: 20 bb 1a
; draw 10x2 rectangle at (27,14)
    ldx #$1b                                                          ; 4328: a2 1b
    lda #$0a                                                          ; 432a: a9 0a
    sta width_in_cells                                                ; 432c: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 432e: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 4331: 20 90 1b
; draw rope at (20,8) length 12
    ldx #$14                                                          ; 4334: a2 14
    ldy #8                                                            ; 4336: a0 08
    lda #$0c                                                          ; 4338: a9 0c
    jsr draw_rope                                                     ; 433a: 20 b9 1d
    jsr start_room                                                    ; 433d: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 4340: 20 da 12
    and #exit_room_left                                               ; 4343: 29 01
    beq room_3_game_update_loop                                       ; 4345: f0 f9
    ldx #2                                                            ; 4347: a2 02
    ldy current_level                                                 ; 4349: a4 31
    jmp initialise_level_and_room                                     ; 434b: 4c 40 11

; check for first update in room (branch if not)
sub_c434e
    lda update_room_first_update_flag                                 ; 434e: ad 2b 13
    beq c438b                                                         ; 4351: f0 38
    ldx #<envelope3                                                   ; 4353: a2 8b
    ldy #>envelope3                                                   ; 4355: a0 44
    jsr define_envelope                                               ; 4357: 20 5e 39
; check for level change (branch if not)
    lda current_level                                                 ; 435a: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 435c: c5 51
    beq c436a                                                         ; 435e: f0 0a
    lda l0a5f                                                         ; 4360: ad 5f 0a
    beq c436a                                                         ; 4363: f0 05
    lda #2                                                            ; 4365: a9 02
    sta l0a5f                                                         ; 4367: 8d 5f 0a
c436a
    lda desired_room_index                                            ; 436a: a5 30
    cmp #3                                                            ; 436c: c9 03
    bne c4388                                                         ; 436e: d0 18
    lda #$cf                                                          ; 4370: a9 cf
    sta l38af                                                         ; 4372: 8d af 38
    ldx #$0a                                                          ; 4375: a2 0a
    ldy #$14                                                          ; 4377: a0 14
    lda #3                                                            ; 4379: a9 03
    jsr set_object_position_from_cell_xy                              ; 437b: 20 5d 1f
    lda #4                                                            ; 437e: a9 04
    jsr set_object_position_from_cell_xy                              ; 4380: 20 5d 1f
    lda #$c0                                                          ; 4383: a9 c0
    sta l38c6                                                         ; 4385: 8d c6 38
c4388
    jmp c43c8                                                         ; 4388: 4c c8 43

c438b
    lda l0a5f                                                         ; 438b: ad 5f 0a
    beq c4396                                                         ; 438e: f0 06
    cmp #2                                                            ; 4390: c9 02
    bne c43b5                                                         ; 4392: d0 21
    beq c43c8                                                         ; 4394: f0 32
c4396
    lda desired_room_index                                            ; 4396: a5 30
    cmp #3                                                            ; 4398: c9 03
    bne c43c8                                                         ; 439a: d0 2c
    lda object_room_collision_flags                                   ; 439c: ad d8 38
    and #1                                                            ; 439f: 29 01
    beq c43c8                                                         ; 43a1: f0 25
    lda object_x_low                                                  ; 43a3: ad 50 09
    cmp #$90                                                          ; 43a6: c9 90
    bcs c43c8                                                         ; 43a8: b0 1e
    lda object_y_low                                                  ; 43aa: ad 7c 09
    cmp #$80                                                          ; 43ad: c9 80
    bcc c43c8                                                         ; 43af: 90 17
    cmp #$aa                                                          ; 43b1: c9 aa
    bcs c43c8                                                         ; 43b3: b0 13
c43b5
    inc l0a5f                                                         ; 43b5: ee 5f 0a
    lda l0a5f                                                         ; 43b8: ad 5f 0a
    cmp #2                                                            ; 43bb: c9 02
    bne c43c8                                                         ; 43bd: d0 09
    lda desired_room_index                                            ; 43bf: a5 30
    cmp #3                                                            ; 43c1: c9 03
    bne c43c8                                                         ; 43c3: d0 03
    jsr sub_c4465                                                     ; 43c5: 20 65 44
c43c8
    lda desired_room_index                                            ; 43c8: a5 30
    cmp #3                                                            ; 43ca: c9 03
    bne c442b                                                         ; 43cc: d0 5d
    ldy l0a5f                                                         ; 43ce: ac 5f 0a
    lda l4462,y                                                       ; 43d1: b9 62 44
    sta l09ab                                                         ; 43d4: 8d ab 09
    cpy #2                                                            ; 43d7: c0 02
    bne c43e0                                                         ; 43d9: d0 05
    lda #$d3                                                          ; 43db: a9 d3
    sta l09ac                                                         ; 43dd: 8d ac 09
c43e0
    lda #collision_map_solid_rock                                     ; 43e0: a9 03
    sta value_to_write_to_collision_map                               ; 43e2: 85 3e
    lda l0a5f                                                         ; 43e4: ad 5f 0a
    bne c4402                                                         ; 43e7: d0 19
    ldx #$0e                                                          ; 43e9: a2 0e
    ldy #$13                                                          ; 43eb: a0 13
    lda #1                                                            ; 43ed: a9 01
    sta width_in_cells                                                ; 43ef: 85 3c
    lda #3                                                            ; 43f1: a9 03
    sta height_in_cells                                               ; 43f3: 85 3d
    jsr read_collision_map_value_for_xy                               ; 43f5: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 43f8: c5 3e
    beq c442b                                                         ; 43fa: f0 2f
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 43fc: 20 44 1e
    jmp c442b                                                         ; 43ff: 4c 2b 44

c4402
    ldx #$0a                                                          ; 4402: a2 0a
    ldy #$14                                                          ; 4404: a0 14
    lda #3                                                            ; 4406: a9 03
    sta width_in_cells                                                ; 4408: 85 3c
    lda #2                                                            ; 440a: a9 02
    sta height_in_cells                                               ; 440c: 85 3d
    jsr read_collision_map_value_for_xy                               ; 440e: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 4411: c5 3e
    beq c442b                                                         ; 4413: f0 16
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 4415: 20 44 1e
    lda #collision_map_none                                           ; 4418: a9 00
    sta value_to_write_to_collision_map                               ; 441a: 85 3e
    ldx #$0e                                                          ; 441c: a2 0e
    ldy #$13                                                          ; 441e: a0 13
    lda #1                                                            ; 4420: a9 01
    sta width_in_cells                                                ; 4422: 85 3c
    lda #3                                                            ; 4424: a9 03
    sta height_in_cells                                               ; 4426: 85 3d
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 4428: 20 44 1e
c442b
    lda desired_room_index                                            ; 442b: a5 30
    cmp #3                                                            ; 442d: c9 03
    bne return6                                                       ; 442f: d0 30
    lda l0a55                                                         ; 4431: ad 55 0a
    cmp #$ff                                                          ; 4434: c9 ff
    beq return6                                                       ; 4436: f0 29
    lda l0a5d                                                         ; 4438: ad 5d 0a
    bne return6                                                       ; 443b: d0 24
    lda #2                                                            ; 443d: a9 02
    sta temp_bottom_offset                                            ; 443f: 8d 51 25
    lda #2                                                            ; 4442: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4444: 20 94 28
    beq return6                                                       ; 4447: f0 18
    lda #8                                                            ; 4449: a9 08
    sta temp_left_offset                                              ; 444b: 8d d0 24
    ldx #4                                                            ; 444e: a2 04
    ldy #2                                                            ; 4450: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 4452: 20 e2 28
    beq return6                                                       ; 4455: f0 0a
    lda #$ff                                                          ; 4457: a9 ff
    sta l0a5d                                                         ; 4459: 8d 5d 0a
    lda #$c9                                                          ; 445c: a9 c9
    sta l09aa                                                         ; 445e: 8d aa 09
return6
    rts                                                               ; 4461: 60

l4462
    !byte $d0, $d1, $d2                                               ; 4462: d0 d1 d2

sub_c4465
    lda #0                                                            ; 4465: a9 00
    ldx #<sound4                                                      ; 4467: a2 a1
    ldy #>sound4                                                      ; 4469: a0 44
    jsr play_sound_yx                                                 ; 446b: 20 f6 38
    ldx #$99                                                          ; 446e: a2 99
    ldy #$44 ; 'D'                                                    ; 4470: a0 44
    jmp play_sound_yx                                                 ; 4472: 4c f6 38

envelope1
    !byte 5                                                           ; 4475: 05                      ; envelope number
    !byte 1                                                           ; 4476: 01                      ; step length (100ths of a second)
    !byte 255                                                         ; 4477: ff                      ; pitch change per step in section 1
    !byte 0                                                           ; 4478: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 4479: 00                      ; pitch change per step in section 3
    !byte 1                                                           ; 447a: 01                      ; number of steps in section 1
    !byte 1                                                           ; 447b: 01                      ; number of steps in section 2
    !byte 0                                                           ; 447c: 00                      ; number of steps in section 3
    !byte 110                                                         ; 447d: 6e                      ; change of amplitude per step during attack phase
    !byte 252                                                         ; 447e: fc                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 447f: 00                      ; change of amplitude per step during sustain phase
    !byte 248                                                         ; 4480: f8                      ; change of amplitude per step during release phase
    !byte 110                                                         ; 4481: 6e                      ; target of level at end of attack phase
    !byte 0                                                           ; 4482: 00                      ; target of level at end of decay phase
sound1
    !word $13                                                         ; 4483: 13 00                   ; channel
    !word 5                                                           ; 4485: 05 00                   ; amplitude
    !word 201                                                         ; 4487: c9 00                   ; pitch
    !word 1                                                           ; 4489: 01 00                   ; duration
envelope3
    !byte 6                                                           ; 448b: 06                      ; envelope number
    !byte 1                                                           ; 448c: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 448d: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 448e: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 448f: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 4490: 00                      ; number of steps in section 1
    !byte 0                                                           ; 4491: 00                      ; number of steps in section 2
    !byte 0                                                           ; 4492: 00                      ; number of steps in section 3
    !byte 55                                                          ; 4493: 37                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4494: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4495: 00                      ; change of amplitude per step during sustain phase
    !byte 250                                                         ; 4496: fa                      ; change of amplitude per step during release phase
    !byte 110                                                         ; 4497: 6e                      ; target of level at end of attack phase
    !byte 55                                                          ; 4498: 37                      ; target of level at end of decay phase
    !byte $10,   0,   6,   0,   7,   0,   1,   0                      ; 4499: 10 00 06...
sound4
    !word $11                                                         ; 44a1: 11 00                   ; channel
    !word 0                                                           ; 44a3: 00 00                   ; amplitude
    !word 210                                                         ; 44a5: d2 00                   ; pitch
    !word 1                                                           ; 44a7: 01 00                   ; duration
envelope2
    !byte 7                                                           ; 44a9: 07                      ; envelope number
    !byte 1                                                           ; 44aa: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 44ab: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 44ac: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 44ad: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 44ae: 00                      ; number of steps in section 1
    !byte 0                                                           ; 44af: 00                      ; number of steps in section 2
    !byte 0                                                           ; 44b0: 00                      ; number of steps in section 3
    !byte 126                                                         ; 44b1: 7e                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 44b2: 00                      ; change of amplitude per step during decay phase
    !byte 252                                                         ; 44b3: fc                      ; change of amplitude per step during sustain phase
    !byte 248                                                         ; 44b4: f8                      ; change of amplitude per step during release phase
    !byte 126                                                         ; 44b5: 7e                      ; target of level at end of attack phase
    !byte 0                                                           ; 44b6: 00                      ; target of level at end of decay phase
sound3
    !word $10                                                         ; 44b7: 10 00                   ; channel
    !word 7                                                           ; 44b9: 07 00                   ; amplitude
    !word 7                                                           ; 44bb: 07 00                   ; pitch
    !word 1                                                           ; 44bd: 01 00                   ; duration
sound2
    !word $11                                                         ; 44bf: 11 00                   ; channel
    !word 0                                                           ; 44c1: 00 00                   ; amplitude
    !word 220                                                         ; 44c3: dc 00                   ; pitch
    !word 1                                                           ; 44c5: 01 00                   ; duration
    !byte $10, $10, $20, $d3, $0c,   8, $10, $10,   8,   4, $e2, $11  ; 44c7: 10 10 20...
    !byte   8,   4,   4,   4                                          ; 44d3: 08 04 04...
    !text "   "                                                       ; 44d7: 20 20 20
    !byte $10, $88, $47, $20, $10,   8,   8, $10, $30, $cb,   4,   8  ; 44da: 10 88 47...
    !byte   8                                                         ; 44e6: 08
sprite_data
pydis_end

; Automatically generated labels:
;     c3b0a
;     c3b1a
;     c3b1d
;     c3b27
;     c3bfa
;     c3bff
;     c3c14
;     c3c17
;     c3c34
;     c3c40
;     c3c58
;     c3c87
;     c3d77
;     c3dab
;     c3dcf
;     c3df8
;     c3dfd
;     c3e00
;     c3e27
;     c3e32
;     c3e70
;     c3e7f
;     c3e99
;     c3eb7
;     c3eba
;     c3ec7
;     c3ed5
;     c3ee2
;     c3ef5
;     c3ef8
;     c3f07
;     c3f1e
;     c3f39
;     c3f51
;     c3f6d
;     c3f77
;     c3f87
;     c3f8e
;     c3fe7
;     c3ffc
;     c4027
;     c406b
;     c406e
;     c4071
;     c414e
;     c4180
;     c4183
;     c4191
;     c419d
;     c41bb
;     c41be
;     c41ca
;     c41e2
;     c41ea
;     c41f4
;     c41fc
;     c4248
;     c424d
;     c4260
;     c436a
;     c4388
;     c438b
;     c4396
;     c43b5
;     c43c8
;     c43e0
;     c4402
;     c442b
;     l0078
;     l0079
;     l0952
;     l0954
;     l0955
;     l0956
;     l095d
;     l0968
;     l096b
;     l096c
;     l097e
;     l0980
;     l0981
;     l0982
;     l0989
;     l09aa
;     l09ab
;     l09ac
;     l09ad
;     l09ae
;     l09b5
;     l09c0
;     l09c3
;     l09c4
;     l0a55
;     l0a56
;     l0a57
;     l0a58
;     l0a59
;     l0a5a
;     l0a5b
;     l0a5c
;     l0a5d
;     l0a5e
;     l0a5f
;     l0a60
;     l0a61
;     l0a70
;     l0a71
;     l20f7
;     l2434
;     l25f5
;     l2770
;     l2890
;     l2eeb
;     l2ef0
;     l2ef4
;     l2ef5
;     l38ae
;     l38af
;     l38b0
;     l38b1
;     l38b2
;     l38c4
;     l38c6
;     l38c7
;     l38c8
;     l3acc
;     l3d3d
;     l4031
;     l4032
;     l4033
;     l42cd
;     l4462
;     loop_c3dde
;     sub_c3bcc
;     sub_c3d61
;     sub_c3f28
;     sub_c4002
;     sub_c4035
;     sub_c4115
;     sub_c434e
;     sub_c4465
!if (<envelope1) != $75 {
    !error "Assertion failed: <envelope1 == $75"
}
!if (<envelope2) != $a9 {
    !error "Assertion failed: <envelope2 == $a9"
}
!if (<envelope3) != $8b {
    !error "Assertion failed: <envelope3 == $8b"
}
!if (<sound1) != $83 {
    !error "Assertion failed: <sound1 == $83"
}
!if (<sound2) != $bf {
    !error "Assertion failed: <sound2 == $bf"
}
!if (<sound3) != $b7 {
    !error "Assertion failed: <sound3 == $b7"
}
!if (<sound4) != $a1 {
    !error "Assertion failed: <sound4 == $a1"
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
!if (level_specific_initialisation) != $3af4 {
    !error "Assertion failed: level_specific_initialisation == $3af4"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b30 {
    !error "Assertion failed: level_specific_update == $3b30"
}
!if (objectid_old_player) != $0b {
    !error "Assertion failed: objectid_old_player == $0b"
}
!if (objectid_old_player_accessory) != $0c {
    !error "Assertion failed: objectid_old_player_accessory == $0c"
}
!if (objectid_player_accessory) != $01 {
    !error "Assertion failed: objectid_player_accessory == $01"
}
!if (room_0_data) != $3b40 {
    !error "Assertion failed: room_0_data == $3b40"
}
!if (room_1_data) != $3c92 {
    !error "Assertion failed: room_1_data == $3c92"
}
!if (room_2_data) != $4083 {
    !error "Assertion failed: room_2_data == $4083"
}
!if (room_3_data) != $42d0 {
    !error "Assertion failed: room_3_data == $42d0"
}
!if (sprite_data - level_data) != $0a12 {
    !error "Assertion failed: sprite_data - level_data == $0a12"
}
