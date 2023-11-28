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
sprite_op_flags_copy_screen           = 1
sprite_op_flags_erase_to_bg_colour    = 2
sprite_op_flags_erase_to_fg_colour    = 4
sprite_op_flags_normal                = 0
spriteid_197                          = 197
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
spriteid_erase_player                 = 199
spriteid_erase_player_accessory       = 198
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
l09df                                               = $09df
level_progress_table                                = $09ef
l0a3f                                               = $0a3f
l0a40                                               = $0a40
l0a41                                               = $0a41
l0a42                                               = $0a42
l0a43                                               = $0a43
l0a44                                               = $0a44
l0a45                                               = $0a45
l0a46                                               = $0a46
l0a47                                               = $0a47
l0a48                                               = $0a48
l0a49                                               = $0a49
level_workspace                                     = $0a6f
l0a70                                               = $0a70
l0a71                                               = $0a71
l0a72                                               = $0a72
l0a73                                               = $0a73
l0a74                                               = $0a74
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
player_wall_collision_reaction_speed                = $2433
find_left_and_right_of_object                       = $2434
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
collectable_spriteids                               = $2eed
collectable_being_used_spriteids                    = $2ef2
inhibit_monkey_climb_flag                           = $31d7
print_encrypted_string_at_yx_centred                = $37f3
wait_one_second_then_check_keys                     = $388d
object_erase_type                                   = $38ac
l38af                                               = $38af
l38b1                                               = $38b1
l38b2                                               = $38b2
object_z_order                                      = $38c2
l38c5                                               = $38c5
l38c6                                               = $38c6
l38c7                                               = $38c7
l38c8                                               = $38c8
l38c9                                               = $38c9
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
    !word sprite_data - level_data                                    ; 3ad5: f2 0a                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f3 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 11 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
room_index_cheat1
    !byte 3                                                           ; 3add: 03
room_index_cheat2
    !byte 2                                                           ; 3ade: 02
level_room_data_table
    !word room_0_data                                                 ; 3adf: 4a 3b                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: 07 3c
    !word room_2_data                                                 ; 3ae3: 2e 41
    !word room_3_data                                                 ; 3ae5: ac 44

; *************************************************************************************
; 'HAMSTER-JAM[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $83, $8a, $86, $98, $9f, $8e, $99, $e6, $81, $8a, $86, $c6  ; 3ae7: 83 8a 86...

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
    beq c3b08                                                         ; 3af7: f0 0f
    lda developer_flags                                               ; 3af9: ad 03 11
    bpl developer_mode_inactive                                       ; 3afc: 10 00
developer_mode_inactive
    lda l0a40                                                         ; 3afe: ad 40 0a
    bpl c3b08                                                         ; 3b01: 10 05
    lda #$d8                                                          ; 3b03: a9 d8
    jsr find_or_create_menu_slot_for_A                                ; 3b05: 20 bd 2b
c3b08
    lda #$a7                                                          ; 3b08: a9 a7
    sta source_sprite_memory_low                                      ; 3b0a: 85 40
    lda #$45 ; 'E'                                                    ; 3b0c: a9 45
    sta source_sprite_memory_high                                     ; 3b0e: 85 41
    rts                                                               ; 3b10: 60

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
    jsr room_3_update_handler                                         ; 3b11: 20 39 45
    jsr sub_c3de6                                                     ; 3b14: 20 e6 3d
    jsr sub_c3cb5                                                     ; 3b17: 20 b5 3c
    jsr room_2_update_handler                                         ; 3b1a: 20 de 41
    jsr sub_c4029                                                     ; 3b1d: 20 29 40
    jsr room_0_update_handler                                         ; 3b20: 20 f0 3b
    rts                                                               ; 3b23: 60

sub_c3b24
    ldx #0                                                            ; 3b24: a2 00
    ldy #0                                                            ; 3b26: a0 00
    lda #$ff                                                          ; 3b28: a9 ff
    sta width_in_cells                                                ; 3b2a: 85 3c
    lda #2                                                            ; 3b2c: a9 02
    sta height_in_cells                                               ; 3b2e: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b30: 20 bb 1a
    ldy #$16                                                          ; 3b33: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3b35: 20 bb 1a
    ldx #3                                                            ; 3b38: a2 03
    ldy #2                                                            ; 3b3a: a0 02
    lda #1                                                            ; 3b3c: a9 01
    sta width_in_cells                                                ; 3b3e: 85 3c
    sta height_in_cells                                               ; 3b40: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b42: 20 bb 1a
    ldx #$24 ; '$'                                                    ; 3b45: a2 24
    jmp copy_rectangle_of_memory_to_screen                            ; 3b47: 4c bb 1a

; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 20                                                          ; 3b4a: 14                      ; initial player X cell
    !byte 22                                                          ; 3b4b: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####      |    |    |               ####
; ###       |    |    |                ###
; ###       |    |    |                ###
; ###       |    |    |                ###
; ###       |    |    |                ###
; ###       |    |   OSO        ##########
; ###       |    |   OOO        ##########
; ###       |    |
; ###       |    |
; ###       |    |
; ###       |    |
; ###       |   OSO
; ###       |   OOO                  #####
; ###       |                        #####
; ###       |                          ###
; ###       |                          ###
; ###       |                          ###
; ###                                  ###
; ########                             ###
; #############       P                ###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_0_code
    jsr sub_c3b24                                                     ; 3b4c: 20 24 3b
; draw 3x20 rectangle at (0,2)
    ldx #0                                                            ; 3b4f: a2 00
    ldy #2                                                            ; 3b51: a0 02
    lda #3                                                            ; 3b53: a9 03
    sta width_in_cells                                                ; 3b55: 85 3c
    lda #$14                                                          ; 3b57: a9 14
    sta height_in_cells                                               ; 3b59: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b5b: 20 bb 1a
; draw 3x7 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3b5e: a2 25
    lda #7                                                            ; 3b60: a9 07
    sta height_in_cells                                               ; 3b62: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b64: 20 bb 1a
; draw 3x6 rectangle at (37,16)
    ldy #$10                                                          ; 3b67: a0 10
    dec height_in_cells                                               ; 3b69: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b6b: 20 bb 1a
; draw 255x2 rectangle at (35,14)
    ldx #$23 ; '#'                                                    ; 3b6e: a2 23
    ldy #$0e                                                          ; 3b70: a0 0e
    lda #$ff                                                          ; 3b72: a9 ff
    sta width_in_cells                                                ; 3b74: 85 3c
    lda #2                                                            ; 3b76: a9 02
    sta height_in_cells                                               ; 3b78: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b7a: 20 bb 1a
; draw 7x2 rectangle at (30,7)
    ldx #$1e                                                          ; 3b7d: a2 1e
    ldy #7                                                            ; 3b7f: a0 07
    lda #7                                                            ; 3b81: a9 07
    sta width_in_cells                                                ; 3b83: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b85: 20 bb 1a
; draw 5x1 rectangle at (3,20)
    ldx #3                                                            ; 3b88: a2 03
    ldy #$14                                                          ; 3b8a: a0 14
    lda #5                                                            ; 3b8c: a9 05
    sta width_in_cells                                                ; 3b8e: 85 3c
    dec height_in_cells                                               ; 3b90: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b92: 20 bb 1a
; draw 10x1 rectangle at (3,21)
    iny                                                               ; 3b95: c8
    lda #$0a                                                          ; 3b96: a9 0a
    sta width_in_cells                                                ; 3b98: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b9a: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3b9d: 20 90 1b
; draw rope at (10,2) length 17
    ldx #$0a                                                          ; 3ba0: a2 0a
    ldy #2                                                            ; 3ba2: a0 02
    lda #$11                                                          ; 3ba4: a9 11
    jsr draw_rope                                                     ; 3ba6: 20 b9 1d
; draw rope at (15,2) length 12
    lda #3                                                            ; 3ba9: a9 03
    sta width_in_cells                                                ; 3bab: 85 3c
    lda #2                                                            ; 3bad: a9 02
    sta height_in_cells                                               ; 3baf: 85 3d
    ldx #$0f                                                          ; 3bb1: a2 0f
    ldy #2                                                            ; 3bb3: a0 02
    lda #$0c                                                          ; 3bb5: a9 0c
    jsr draw_rope                                                     ; 3bb7: 20 b9 1d
; draw sprite $ce at (14,13) of size (3x2)
    dex                                                               ; 3bba: ca
    ldy #$0d                                                          ; 3bbb: a0 0d
    lda #$ce                                                          ; 3bbd: a9 ce
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bbf: 20 57 1f
; draw sprite $e2 at (15,13)
    inx                                                               ; 3bc2: e8
    lda #$e2                                                          ; 3bc3: a9 e2
    jsr draw_sprite_a_at_cell_xy                                      ; 3bc5: 20 4c 1f
; draw rope at (20,2) length 6
    ldx #$14                                                          ; 3bc8: a2 14
    ldy #2                                                            ; 3bca: a0 02
    lda #6                                                            ; 3bcc: a9 06
    jsr draw_rope                                                     ; 3bce: 20 b9 1d
; draw sprite $ce at (19,7) of size (3x2)
    dex                                                               ; 3bd1: ca
    ldy #7                                                            ; 3bd2: a0 07
    lda #$ce                                                          ; 3bd4: a9 ce
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bd6: 20 57 1f
; draw sprite $e2 at (20,7)
    inx                                                               ; 3bd9: e8
    lda #$e2                                                          ; 3bda: a9 e2
    jsr draw_sprite_a_at_cell_xy                                      ; 3bdc: 20 4c 1f
    jsr start_room                                                    ; 3bdf: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 3be2: 20 da 12
    and #exit_room_right                                              ; 3be5: 29 04
    beq room_0_game_update_loop                                       ; 3be7: f0 f9
    ldx #1                                                            ; 3be9: a2 01
    ldy current_level                                                 ; 3beb: a4 31
    jmp initialise_level_and_room                                     ; 3bed: 4c 40 11

room_0_update_handler
    lda #0                                                            ; 3bf0: a9 00
    sta currently_updating_logic_for_room_index                       ; 3bf2: 8d ba 1a
    ldx #3                                                            ; 3bf5: a2 03
    ldy #$0a                                                          ; 3bf7: a0 0a
    lda #3                                                            ; 3bf9: a9 03
    jsr update_brazier_and_fire                                       ; 3bfb: 20 88 19
    ldx #$21 ; '!'                                                    ; 3bfe: a2 21
    ldy #7                                                            ; 3c00: a0 07
    lda #2                                                            ; 3c02: a9 02
    jmp update_level_completion                                       ; 3c04: 4c 10 1a

; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 20                                                          ; 3c07: 14                      ; initial player X cell
    !byte 22                                                          ; 3c08: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####                                ####
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; ###                                  ###
; 
; 
; 
;               ############
;               ############
; #####                              #####
; #####                              #####
; ###
; ###
; ###
; ###
; ###
; ###                 P              #####
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_1_code
    jsr sub_c3b24                                                     ; 3c09: 20 24 3b
; draw 3x7 rectangle at (0,2)
    ldx #0                                                            ; 3c0c: a2 00
    ldy #2                                                            ; 3c0e: a0 02
    lda #3                                                            ; 3c10: a9 03
    sta width_in_cells                                                ; 3c12: 85 3c
    lda #7                                                            ; 3c14: a9 07
    sta height_in_cells                                               ; 3c16: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c18: 20 bb 1a
; draw 3x7 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3c1b: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 3c1d: 20 bb 1a
; draw 3x6 rectangle at (0,16)
    ldx #0                                                            ; 3c20: a2 00
    ldy #$10                                                          ; 3c22: a0 10
    lda #6                                                            ; 3c24: a9 06
    sta height_in_cells                                               ; 3c26: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c28: 20 bb 1a
; draw 5x2 rectangle at (0,14)
    ldy #$0e                                                          ; 3c2b: a0 0e
    lda #5                                                            ; 3c2d: a9 05
    sta width_in_cells                                                ; 3c2f: 85 3c
    lda #2                                                            ; 3c31: a9 02
    sta height_in_cells                                               ; 3c33: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c35: 20 bb 1a
; draw 5x2 rectangle at (35,14)
    ldx #$23 ; '#'                                                    ; 3c38: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 3c3a: 20 bb 1a
; draw 12x2 rectangle at (14,12)
    ldx #$0e                                                          ; 3c3d: a2 0e
    ldy #$0c                                                          ; 3c3f: a0 0c
    lda #$0c                                                          ; 3c41: a9 0c
    sta width_in_cells                                                ; 3c43: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3c45: 20 bb 1a
; draw 12x1 rectangle at (35,21)
    ldx #$23 ; '#'                                                    ; 3c48: a2 23
    ldy #$15                                                          ; 3c4a: a0 15
    lda #1                                                            ; 3c4c: a9 01
    sta height_in_cells                                               ; 3c4e: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c50: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3c53: 20 90 1b
    jsr start_room                                                    ; 3c56: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 3c59: 20 da 12
    sta room_exit_direction                                           ; 3c5c: 85 70
    and #exit_room_left                                               ; 3c5e: 29 01
    beq room_1_check_right_exit                                       ; 3c60: f0 07
    ldx #0                                                            ; 3c62: a2 00
    ldy current_level                                                 ; 3c64: a4 31
    jmp initialise_level_and_room                                     ; 3c66: 4c 40 11

room_1_check_right_exit
    lda room_exit_direction                                           ; 3c69: a5 70
    and #exit_room_right                                              ; 3c6b: 29 04
    beq room_1_game_update_loop                                       ; 3c6d: f0 ea
    ldx #2                                                            ; 3c6f: a2 02
    ldy current_level                                                 ; 3c71: a4 31
    jmp initialise_level_and_room                                     ; 3c73: 4c 40 11

l3c76
    !byte   0, $d0,   2,   0, $d1,   2,   0, $d2,   2,   0, $d3,   2  ; 3c76: 00 d0 02...
    !byte   0, $ff, $d7,   0,   0, $d3,   0,   0, $ff,   0,   0,   0  ; 3c82: 00 ff d7...
    !byte $d5,   0,   0, $d5, $f8,   2, $d5, $f8,   3, $d5, $fa,   4  ; 3c8e: d5 00 00...
    !byte $d5, $fa,   5, $d5, $fb,   6, $d5, $fc,   6, $d5, $fd,   7  ; 3c9a: d5 fa 05...
    !byte $d5, $fe,   7, $d5, $fe,   8, $ff, $d5,   0,   8, $ff, $d6  ; 3ca6: d5 fe 07...
    !byte   0,   0, $ff                                               ; 3cb2: 00 00 ff

; check for first update in room (branch if not)
sub_c3cb5
    lda update_room_first_update_flag                                 ; 3cb5: ad 2b 13
    beq c3d10                                                         ; 3cb8: f0 56
; check for level change (branch if not)
    lda current_level                                                 ; 3cba: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3cbc: c5 51
    beq c3cf8                                                         ; 3cbe: f0 38
    lda l0a3f                                                         ; 3cc0: ad 3f 0a
    beq c3ccd                                                         ; 3cc3: f0 08
    cmp #1                                                            ; 3cc5: c9 01
    beq c3ccd                                                         ; 3cc7: f0 04
    cmp #$0e                                                          ; 3cc9: c9 0e
    bne c3ce1                                                         ; 3ccb: d0 14
c3ccd
    ldy #1                                                            ; 3ccd: a0 01
    lda #$a0                                                          ; 3ccf: a9 a0
    sta l0a71                                                         ; 3cd1: 8d 71 0a
    lda #$60 ; '`'                                                    ; 3cd4: a9 60
    sta l0a72                                                         ; 3cd6: 8d 72 0a
    lda #1                                                            ; 3cd9: a9 01
    sta l0a73                                                         ; 3cdb: 8d 73 0a
    jmp c3cf2                                                         ; 3cde: 4c f2 3c

c3ce1
    ldy #$3b ; ';'                                                    ; 3ce1: a0 3b
    lda #$44 ; 'D'                                                    ; 3ce3: a9 44
    sta l0a71                                                         ; 3ce5: 8d 71 0a
    lda #$b0                                                          ; 3ce8: a9 b0
    sta l0a72                                                         ; 3cea: 8d 72 0a
    lda #1                                                            ; 3ced: a9 01
    sta l0a73                                                         ; 3cef: 8d 73 0a
c3cf2
    sty l0a3f                                                         ; 3cf2: 8c 3f 0a
    sty l0a70                                                         ; 3cf5: 8c 70 0a
c3cf8
    lda desired_room_index                                            ; 3cf8: a5 30
    cmp #1                                                            ; 3cfa: c9 01
    bne c3d0d                                                         ; 3cfc: d0 0f
    lda #$d4                                                          ; 3cfe: a9 d4
    sta l38b1                                                         ; 3d00: 8d b1 38
    lda #$e0                                                          ; 3d03: a9 e0
    sta l38c7                                                         ; 3d05: 8d c7 38
    lda #$df                                                          ; 3d08: a9 df
    sta l38c9                                                         ; 3d0a: 8d c9 38
c3d0d
    jmp c3dac                                                         ; 3d0d: 4c ac 3d

c3d10
    lda l0a70                                                         ; 3d10: ad 70 0a
    clc                                                               ; 3d13: 18
    adc #3                                                            ; 3d14: 69 03
    tay                                                               ; 3d16: a8
    lda l3c76,y                                                       ; 3d17: b9 76 3c
    cmp #$ff                                                          ; 3d1a: c9 ff
    bne c3d21                                                         ; 3d1c: d0 03
    ldy l0a3f                                                         ; 3d1e: ac 3f 0a
c3d21
    cpy #$11                                                          ; 3d21: c0 11
    bne c3d2d                                                         ; 3d23: d0 08
    lda l0a73                                                         ; 3d25: ad 73 0a
    eor #$fe                                                          ; 3d28: 49 fe
    sta l0a73                                                         ; 3d2a: 8d 73 0a
c3d2d
    lda l0a3f                                                         ; 3d2d: ad 3f 0a
    cmp #$0e                                                          ; 3d30: c9 0e
    bne c3d3e                                                         ; 3d32: d0 0a
    cpy l0a3f                                                         ; 3d34: cc 3f 0a
    bne c3d6a                                                         ; 3d37: d0 31
    ldy #1                                                            ; 3d39: a0 01
    sty l0a3f                                                         ; 3d3b: 8c 3f 0a
c3d3e
    lda l0a3f                                                         ; 3d3e: ad 3f 0a
    cmp #1                                                            ; 3d41: c9 01
    bne c3d6a                                                         ; 3d43: d0 25
    ldx l0a71                                                         ; 3d45: ae 71 0a
    lda l0a73                                                         ; 3d48: ad 73 0a
    bmi c3d53                                                         ; 3d4b: 30 06
    cpx #$c0                                                          ; 3d4d: e0 c0
    bne c3d6a                                                         ; 3d4f: d0 19
    beq c3d62                                                         ; 3d51: f0 0f
c3d53
    cpx #$80                                                          ; 3d53: e0 80
    beq c3d62                                                         ; 3d55: f0 0b
    cpx #$9c                                                          ; 3d57: e0 9c
    bne c3d6a                                                         ; 3d59: d0 0f
    lda level_workspace                                               ; 3d5b: ad 6f 0a
    cmp #$48 ; 'H'                                                    ; 3d5e: c9 48
    bcc c3d6a                                                         ; 3d60: 90 08
c3d62
    ldy #$0e                                                          ; 3d62: a0 0e
    sty l0a3f                                                         ; 3d64: 8c 3f 0a
    jmp c3d6a                                                         ; 3d67: 4c 6a 3d

c3d6a
    sty l0a70                                                         ; 3d6a: 8c 70 0a
    iny                                                               ; 3d6d: c8
    lda l3c76,y                                                       ; 3d6e: b9 76 3c
    ldx l0a73                                                         ; 3d71: ae 73 0a
    bpl c3d7b                                                         ; 3d74: 10 05
    eor #$ff                                                          ; 3d76: 49 ff
    clc                                                               ; 3d78: 18
    adc #1                                                            ; 3d79: 69 01
c3d7b
    clc                                                               ; 3d7b: 18
    adc l0a71                                                         ; 3d7c: 6d 71 0a
    sta l0a71                                                         ; 3d7f: 8d 71 0a
    iny                                                               ; 3d82: c8
    lda l3c76,y                                                       ; 3d83: b9 76 3c
    clc                                                               ; 3d86: 18
    adc l0a72                                                         ; 3d87: 6d 72 0a
    sta l0a72                                                         ; 3d8a: 8d 72 0a
    cmp #$b0                                                          ; 3d8d: c9 b0
    bcc c3dac                                                         ; 3d8f: 90 1b
    lda #$b0                                                          ; 3d91: a9 b0
    sta l0a72                                                         ; 3d93: 8d 72 0a
    lda #$3b ; ';'                                                    ; 3d96: a9 3b
    cmp l0a3f                                                         ; 3d98: cd 3f 0a
    beq c3dac                                                         ; 3d9b: f0 0f
    sta l0a3f                                                         ; 3d9d: 8d 3f 0a
    sta l0a70                                                         ; 3da0: 8d 70 0a
    lda desired_room_index                                            ; 3da3: a5 30
    cmp #1                                                            ; 3da5: c9 01
    bne c3dac                                                         ; 3da7: d0 03
    jsr play_landing_sound                                            ; 3da9: 20 a9 23
c3dac
    lda desired_room_index                                            ; 3dac: a5 30
    cmp #1                                                            ; 3dae: c9 01
    bne return1                                                       ; 3db0: d0 33
    lda l0a71                                                         ; 3db2: ad 71 0a
    sta object_x_low + 5                                              ; 3db5: 8d 55 09
    sta object_x_low + 7                                              ; 3db8: 8d 57 09
    lda l0a72                                                         ; 3dbb: ad 72 0a
    sta object_y_low + 5                                              ; 3dbe: 8d 81 09
    sta object_y_low + 7                                              ; 3dc1: 8d 83 09
    lda l0a73                                                         ; 3dc4: ad 73 0a
    sta object_direction + 5                                          ; 3dc7: 8d c3 09
    sta object_direction + 7                                          ; 3dca: 8d c5 09
    ldy l0a70                                                         ; 3dcd: ac 70 0a
    lda l3c76,y                                                       ; 3dd0: b9 76 3c
    ldx #0                                                            ; 3dd3: a2 00
    cmp #$d0                                                          ; 3dd5: c9 d0
    bcc c3ddf                                                         ; 3dd7: 90 06
    cmp #$d4                                                          ; 3dd9: c9 d4
    bcs c3ddf                                                         ; 3ddb: b0 02
    ldx #$e4                                                          ; 3ddd: a2 e4
c3ddf
    sta object_spriteid + 5                                           ; 3ddf: 8d ad 09
    stx object_spriteid + 7                                           ; 3de2: 8e af 09
return1
    rts                                                               ; 3de5: 60

; check for first update in room (branch if so)
sub_c3de6
    lda update_room_first_update_flag                                 ; 3de6: ad 2b 13
    bne c3dee                                                         ; 3de9: d0 03
    jmp c3ed3                                                         ; 3deb: 4c d3 3e

; check for level change (branch if not)
c3dee
    lda current_level                                                 ; 3dee: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3df0: c5 51
    beq c3df9                                                         ; 3df2: f0 05
    lda #$50 ; 'P'                                                    ; 3df4: a9 50
    sta level_workspace                                               ; 3df6: 8d 6f 0a
c3df9
    lda desired_room_index                                            ; 3df9: a5 30
    cmp #1                                                            ; 3dfb: c9 01
    beq c3e02                                                         ; 3dfd: f0 03
    jmp c3ed0                                                         ; 3dff: 4c d0 3e

c3e02
    ldx #<envelope1                                                   ; 3e02: a2 47
    ldy #>envelope1                                                   ; 3e04: a0 45
    jsr define_envelope                                               ; 3e06: 20 5e 39
    ldx #<envelope2                                                   ; 3e09: a2 5d
    ldy #>envelope2                                                   ; 3e0b: a0 45
    jsr define_envelope                                               ; 3e0d: 20 5e 39
    ldx #<envelope3                                                   ; 3e10: a2 91
    ldy #>envelope3                                                   ; 3e12: a0 45
    jsr define_envelope                                               ; 3e14: 20 5e 39
    ldx #<envelope4                                                   ; 3e17: a2 7b
    ldy #>envelope4                                                   ; 3e19: a0 45
    jsr define_envelope                                               ; 3e1b: 20 5e 39
    ldx #$10                                                          ; 3e1e: a2 10
    ldy #2                                                            ; 3e20: a0 02
    lda #$c8                                                          ; 3e22: a9 c8
    jsr draw_sprite_a_at_cell_xy                                      ; 3e24: 20 4c 1f
    inx                                                               ; 3e27: e8
    inx                                                               ; 3e28: e8
    lda #$ca                                                          ; 3e29: a9 ca
loop_c3e2b
    jsr draw_sprite_a_at_cell_xy                                      ; 3e2b: 20 4c 1f
    inx                                                               ; 3e2e: e8
    cpx #$1e                                                          ; 3e2f: e0 1e
    bcc loop_c3e2b                                                    ; 3e31: 90 f8
    inx                                                               ; 3e33: e8
    lda #$c9                                                          ; 3e34: a9 c9
    jsr draw_sprite_a_at_cell_xy                                      ; 3e36: 20 4c 1f
    lda #3                                                            ; 3e39: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3e3b: 20 bb 1e
    lda #$50 ; 'P'                                                    ; 3e3e: a9 50
    sec                                                               ; 3e40: 38
    sbc level_workspace                                               ; 3e41: ed 6f 0a
    clc                                                               ; 3e44: 18
    adc #$5c ; '\'                                                    ; 3e45: 69 5c
    lsr                                                               ; 3e47: 4a
    lsr                                                               ; 3e48: 4a
    lsr                                                               ; 3e49: 4a
    tay                                                               ; 3e4a: a8
    dey                                                               ; 3e4b: 88
loop_c3e4c
    lda #$cb                                                          ; 3e4c: a9 cb
    jsr draw_sprite_a_at_cell_xy                                      ; 3e4e: 20 4c 1f
    lda #2                                                            ; 3e51: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3e53: 20 bb 1e
    dey                                                               ; 3e56: 88
    cpy #3                                                            ; 3e57: c0 03
    bcs loop_c3e4c                                                    ; 3e59: b0 f1
    lda #2                                                            ; 3e5b: a9 02
    jsr set_object_position_from_cell_xy                              ; 3e5d: 20 5d 1f
    lda #$cd                                                          ; 3e60: a9 cd
    sta object_spriteid + 2                                           ; 3e62: 8d aa 09
    ldx #$10                                                          ; 3e65: a2 10
    lda level_workspace                                               ; 3e67: ad 6f 0a
    and #4                                                            ; 3e6a: 29 04
    beq c3e7d                                                         ; 3e6c: f0 0f
    lda level_workspace                                               ; 3e6e: ad 6f 0a
    sec                                                               ; 3e71: 38
    sbc #$0c                                                          ; 3e72: e9 0c
    lsr                                                               ; 3e74: 4a
    lsr                                                               ; 3e75: 4a
    lsr                                                               ; 3e76: 4a
    tay                                                               ; 3e77: a8
    lda #$cc                                                          ; 3e78: a9 cc
    jsr draw_sprite_a_at_cell_xy                                      ; 3e7a: 20 4c 1f
c3e7d
    lda level_workspace                                               ; 3e7d: ad 6f 0a
    lsr                                                               ; 3e80: 4a
    lsr                                                               ; 3e81: 4a
    lsr                                                               ; 3e82: 4a
    tay                                                               ; 3e83: a8
    dey                                                               ; 3e84: 88
    dey                                                               ; 3e85: 88
    cpy #3                                                            ; 3e86: c0 03
    bcc c3e94                                                         ; 3e88: 90 0a
    lda #$cb                                                          ; 3e8a: a9 cb
loop_c3e8c
    jsr draw_sprite_a_at_cell_xy                                      ; 3e8c: 20 4c 1f
    dey                                                               ; 3e8f: 88
    cpy #3                                                            ; 3e90: c0 03
    bcs loop_c3e8c                                                    ; 3e92: b0 f8
c3e94
    lda #3                                                            ; 3e94: a9 03
    dex                                                               ; 3e96: ca
    jsr set_object_position_from_cell_xy                              ; 3e97: 20 5d 1f
    inx                                                               ; 3e9a: e8
    lda #$ce                                                          ; 3e9b: a9 ce
    sta object_spriteid + 3                                           ; 3e9d: 8d ab 09
    lda #$cf                                                          ; 3ea0: a9 cf
    sta l38af                                                         ; 3ea2: 8d af 38
    lda #$c0                                                          ; 3ea5: a9 c0
    sta l38c5                                                         ; 3ea7: 8d c5 38
    lda #4                                                            ; 3eaa: a9 04
    jsr set_object_position_from_cell_xy                              ; 3eac: 20 5d 1f
    tax                                                               ; 3eaf: aa
    jsr l20f7                                                         ; 3eb0: 20 f7 20
    lda #$e2                                                          ; 3eb3: a9 e2
    sta object_spriteid + 4                                           ; 3eb5: 8d ac 09
    lda #$bf                                                          ; 3eb8: a9 bf
    sta l38c6                                                         ; 3eba: 8d c6 38
    ldx #$0f                                                          ; 3ebd: a2 0f
    ldy #$0a                                                          ; 3ebf: a0 0a
    lda #3                                                            ; 3ec1: a9 03
    sta width_in_cells                                                ; 3ec3: 85 3c
    lda #2                                                            ; 3ec5: a9 02
    sta height_in_cells                                               ; 3ec7: 85 3d
    lda #collision_map_solid_rock                                     ; 3ec9: a9 03
    sta value_to_write_to_collision_map                               ; 3ecb: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3ecd: 20 44 1e
c3ed0
    jmp c3fe8                                                         ; 3ed0: 4c e8 3f

c3ed3
    lda desired_room_index                                            ; 3ed3: a5 30
    cmp #1                                                            ; 3ed5: c9 01
    bne c3f3e                                                         ; 3ed7: d0 65
    lda l0048                                                         ; 3ed9: a5 48
    cmp #6                                                            ; 3edb: c9 06
    bne c3f3e                                                         ; 3edd: d0 5f
    lda object_x_high                                                 ; 3edf: ad 66 09
    sta l0070                                                         ; 3ee2: 85 70
    lda object_x_low                                                  ; 3ee4: ad 50 09
    lsr l0070                                                         ; 3ee7: 46 70
    ror                                                               ; 3ee9: 6a
    lsr l0070                                                         ; 3eea: 46 70
    ror                                                               ; 3eec: 6a
    lsr l0070                                                         ; 3eed: 46 70
    ror                                                               ; 3eef: 6a
    cmp #$14                                                          ; 3ef0: c9 14
    bcc c3f3e                                                         ; 3ef2: 90 4a
    lda l09df                                                         ; 3ef4: ad df 09
    cmp #$51 ; 'Q'                                                    ; 3ef7: c9 51
    beq c3f03                                                         ; 3ef9: f0 08
    cmp #$45 ; 'E'                                                    ; 3efb: c9 45
    beq c3f03                                                         ; 3efd: f0 04
    cmp #$49 ; 'I'                                                    ; 3eff: c9 49
    bne c3f3e                                                         ; 3f01: d0 3b
c3f03
    lda level_workspace                                               ; 3f03: ad 6f 0a
    cmp #$20 ; ' '                                                    ; 3f06: c9 20
    beq c3ed0                                                         ; 3f08: f0 c6
    lda object_y_low                                                  ; 3f0a: ad 7c 09
    clc                                                               ; 3f0d: 18
    adc #4                                                            ; 3f0e: 69 04
    sta object_y_low                                                  ; 3f10: 8d 7c 09
    lda object_y_low + objectid_player_accessory                      ; 3f13: ad 7d 09
    clc                                                               ; 3f16: 18
    adc #4                                                            ; 3f17: 69 04
    sta object_y_low + objectid_player_accessory                      ; 3f19: 8d 7d 09
    lda level_workspace                                               ; 3f1c: ad 6f 0a
    sec                                                               ; 3f1f: 38
    sbc #4                                                            ; 3f20: e9 04
    sta level_workspace                                               ; 3f22: 8d 6f 0a
    lda desired_room_index                                            ; 3f25: a5 30
    cmp #1                                                            ; 3f27: c9 01
    bne c3ed0                                                         ; 3f29: d0 a5
    jsr sub_c401a                                                     ; 3f2b: 20 1a 40
    lda #$e2                                                          ; 3f2e: a9 e2
    sta object_spriteid_old + 4                                       ; 3f30: 8d b7 09
    sta object_spriteid + 4                                           ; 3f33: 8d ac 09
    lda #0                                                            ; 3f36: a9 00
    sta object_spriteid_old + 2                                       ; 3f38: 8d b5 09
    jmp c3fe8                                                         ; 3f3b: 4c e8 3f

c3f3e
    lda level_workspace                                               ; 3f3e: ad 6f 0a
    cmp #$50 ; 'P'                                                    ; 3f41: c9 50
    bcs c3ed0                                                         ; 3f43: b0 8b
    ldx #$0c                                                          ; 3f45: a2 0c
    ldy #$cc                                                          ; 3f47: a0 cc
    adc #4                                                            ; 3f49: 69 04
    cmp #$50 ; 'P'                                                    ; 3f4b: c9 50
    bcs c3f55                                                         ; 3f4d: b0 06
    ldx #$10                                                          ; 3f4f: a2 10
    ldy #$cb                                                          ; 3f51: a0 cb
    adc #4                                                            ; 3f53: 69 04
c3f55
    sta level_workspace                                               ; 3f55: 8d 6f 0a
    stx l4018                                                         ; 3f58: 8e 18 40
    sty l4019                                                         ; 3f5b: 8c 19 40
    lda desired_room_index                                            ; 3f5e: a5 30
    cmp #1                                                            ; 3f60: c9 01
    bne c3f73                                                         ; 3f62: d0 0f
    lda #0                                                            ; 3f64: a9 00
    sta object_spriteid_old + 4                                       ; 3f66: 8d b7 09
    lda #$e3                                                          ; 3f69: a9 e3
    sta object_spriteid + 4                                           ; 3f6b: 8d ac 09
    lda #0                                                            ; 3f6e: a9 00
    sta object_spriteid_old + 2                                       ; 3f70: 8d b5 09
c3f73
    lda level_workspace                                               ; 3f73: ad 6f 0a
    cmp #$50 ; 'P'                                                    ; 3f76: c9 50
    beq c3f86                                                         ; 3f78: f0 0c
    lda desired_room_index                                            ; 3f7a: a5 30
    cmp #1                                                            ; 3f7c: c9 01
    bne c3fe8                                                         ; 3f7e: d0 68
    jsr sub_c401a                                                     ; 3f80: 20 1a 40
    jmp c3fe8                                                         ; 3f83: 4c e8 3f

c3f86
    lda l0a3f                                                         ; 3f86: ad 3f 0a
    cmp #$37 ; '7'                                                    ; 3f89: c9 37
    beq c3fd2                                                         ; 3f8b: f0 45
    cmp #$3b ; ';'                                                    ; 3f8d: c9 3b
    beq c3fd2                                                         ; 3f8f: f0 41
    ldx l0a71                                                         ; 3f91: ae 71 0a
    lda l0a73                                                         ; 3f94: ad 73 0a
    bmi c3f9f                                                         ; 3f97: 30 06
    cpx #$98                                                          ; 3f99: e0 98
    bcc c3fa5                                                         ; 3f9b: 90 08
    bcs c3fd2                                                         ; 3f9d: b0 33
c3f9f
    cpx #$9c                                                          ; 3f9f: e0 9c
    bcc c3fa5                                                         ; 3fa1: 90 02
    bcs c3fd2                                                         ; 3fa3: b0 2d
c3fa5
    lda #$37 ; '7'                                                    ; 3fa5: a9 37
    sta l0a3f                                                         ; 3fa7: 8d 3f 0a
    lda #$15                                                          ; 3faa: a9 15
    sta l0a70                                                         ; 3fac: 8d 70 0a
    lda #$70 ; 'p'                                                    ; 3faf: a9 70
    sta l0a71                                                         ; 3fb1: 8d 71 0a
    lda #1                                                            ; 3fb4: a9 01
    sta l0a73                                                         ; 3fb6: 8d 73 0a
    lda desired_room_index                                            ; 3fb9: a5 30
    cmp #1                                                            ; 3fbb: c9 01
    bne c3fe8                                                         ; 3fbd: d0 29
    lda #0                                                            ; 3fbf: a9 00
    ldx #<sound1                                                      ; 3fc1: a2 9f
    ldy #>sound1                                                      ; 3fc3: a0 45
    jsr play_sound_yx                                                 ; 3fc5: 20 f6 38
    ldx #<sound2                                                      ; 3fc8: a2 89
    ldy #>sound2                                                      ; 3fca: a0 45
    jsr play_sound_yx                                                 ; 3fcc: 20 f6 38
    jmp c3fe8                                                         ; 3fcf: 4c e8 3f

c3fd2
    lda desired_room_index                                            ; 3fd2: a5 30
    cmp #1                                                            ; 3fd4: c9 01
    bne c3fe8                                                         ; 3fd6: d0 10
    lda #0                                                            ; 3fd8: a9 00
    ldx #<sound3                                                      ; 3fda: a2 73
    ldy #>sound3                                                      ; 3fdc: a0 45
    jsr play_sound_yx                                                 ; 3fde: 20 f6 38
    ldx #<sound4                                                      ; 3fe1: a2 6b
    ldy #>sound4                                                      ; 3fe3: a0 45
    jsr play_sound_yx                                                 ; 3fe5: 20 f6 38
c3fe8
    lda desired_room_index                                            ; 3fe8: a5 30
    cmp #1                                                            ; 3fea: c9 01
    bne return2                                                       ; 3fec: d0 29
    lda #$50 ; 'P'                                                    ; 3fee: a9 50
    sec                                                               ; 3ff0: 38
    sbc level_workspace                                               ; 3ff1: ed 6f 0a
    clc                                                               ; 3ff4: 18
    adc #$58 ; 'X'                                                    ; 3ff5: 69 58
    sta object_y_low + 2                                              ; 3ff7: 8d 7e 09
    ldx #$1f                                                          ; 3ffa: a2 1f
    clc                                                               ; 3ffc: 18
    adc #4                                                            ; 3ffd: 69 04
    lsr                                                               ; 3fff: 4a
    lsr                                                               ; 4000: 4a
    lsr                                                               ; 4001: 4a
    tay                                                               ; 4002: a8
    lda #2                                                            ; 4003: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4005: 20 bb 1e
    iny                                                               ; 4008: c8
    lda #0                                                            ; 4009: a9 00
    jsr write_a_single_value_to_cell_in_collision_map                 ; 400b: 20 bb 1e
    lda level_workspace                                               ; 400e: ad 6f 0a
    sta object_y_low + 3                                              ; 4011: 8d 7f 09
    sta object_y_low + 4                                              ; 4014: 8d 80 09
return2
    rts                                                               ; 4017: 60

l4018
    !byte 0                                                           ; 4018: 00
l4019
    !byte 0                                                           ; 4019: 00

sub_c401a
    lda #0                                                            ; 401a: a9 00
    ldx #$55 ; 'U'                                                    ; 401c: a2 55
    ldy #$45 ; 'E'                                                    ; 401e: a0 45
    jmp play_sound_yx                                                 ; 4020: 4c f6 38

l4023
    !byte $e0, $df, $de                                               ; 4023: e0 df de

loop_c4026
    jmp return3                                                       ; 4026: 4c 2d 41

sub_c4029
    lda l0a49                                                         ; 4029: ad 49 0a
    beq loop_c4026                                                    ; 402c: f0 f8
; check for first update in room (branch if not)
    lda update_room_first_update_flag                                 ; 402e: ad 2b 13
    beq c4078                                                         ; 4031: f0 45
; check for level change (branch if not)
    lda current_level                                                 ; 4033: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 4035: c5 51
    beq c403e                                                         ; 4037: f0 05
    lda #$45 ; 'E'                                                    ; 4039: a9 45
    sta l0a49                                                         ; 403b: 8d 49 0a
c403e
    lda desired_room_index                                            ; 403e: a5 30
    cmp #1                                                            ; 4040: c9 01
    bne c4078                                                         ; 4042: d0 34
    lda l0a49                                                         ; 4044: ad 49 0a
    sec                                                               ; 4047: 38
    sbc #8                                                            ; 4048: e9 08
    bcc c4078                                                         ; 404a: 90 2c
    sta l0070                                                         ; 404c: 85 70
    ldy #$38 ; '8'                                                    ; 404e: a0 38
    sec                                                               ; 4050: 38
    sbc #$3b ; ';'                                                    ; 4051: e9 3b
    bcs c405d                                                         ; 4053: b0 08
    asl l0070                                                         ; 4055: 06 70
    lda #$ac                                                          ; 4057: a9 ac
    sec                                                               ; 4059: 38
    sbc l0070                                                         ; 405a: e5 70
    tay                                                               ; 405c: a8
c405d
    tya                                                               ; 405d: 98
    clc                                                               ; 405e: 18
    tay                                                               ; 405f: a8
    tya                                                               ; 4060: 98
    and #7                                                            ; 4061: 29 07
    sta temp_sprite_y_offset                                          ; 4063: 85 3b
    tya                                                               ; 4065: 98
    lsr                                                               ; 4066: 4a
    lsr                                                               ; 4067: 4a
    lsr                                                               ; 4068: 4a
    tay                                                               ; 4069: a8
    ldx #8                                                            ; 406a: a2 08
    lda #$dd                                                          ; 406c: a9 dd
loop_c406e
    cpy #$15                                                          ; 406e: c0 15
    bcs c4078                                                         ; 4070: b0 06
    jsr draw_sprite_a_at_cell_xy                                      ; 4072: 20 4c 1f
    iny                                                               ; 4075: c8
    bne loop_c406e                                                    ; 4076: d0 f6
c4078
    lda desired_room_index                                            ; 4078: a5 30
    cmp #1                                                            ; 407a: c9 01
    beq c4081                                                         ; 407c: f0 03
loop_c407e
    jmp c411c                                                         ; 407e: 4c 1c 41

c4081
    lda #$40 ; '@'                                                    ; 4081: a9 40
    sta object_x_low + 6                                              ; 4083: 8d 56 09
    lda #0                                                            ; 4086: a9 00
    sta object_x_high + 6                                             ; 4088: 8d 6c 09
    sta object_spriteid + 6                                           ; 408b: 8d ae 09
    lda #1                                                            ; 408e: a9 01
    sta object_direction + 6                                          ; 4090: 8d c4 09
    lda l0a49                                                         ; 4093: ad 49 0a
    sec                                                               ; 4096: 38
    sbc #8                                                            ; 4097: e9 08
    bcc loop_c407e                                                    ; 4099: 90 e3
    sta l0070                                                         ; 409b: 85 70
    lda #$ff                                                          ; 409d: a9 ff
    sta l38b2                                                         ; 409f: 8d b2 38
    lda #$f0                                                          ; 40a2: a9 f0
    sta l38c8                                                         ; 40a4: 8d c8 38
    lda l0070                                                         ; 40a7: a5 70
    sec                                                               ; 40a9: 38
    sbc #$3b ; ';'                                                    ; 40aa: e9 3b
    bcs c40c5                                                         ; 40ac: b0 17
    asl l0070                                                         ; 40ae: 06 70
    lda #$ac                                                          ; 40b0: a9 ac
    sec                                                               ; 40b2: 38
    sbc l0070                                                         ; 40b3: e5 70
    sta object_y_low + 6                                              ; 40b5: 8d 82 09
    lda #$dc                                                          ; 40b8: a9 dc
    sta object_spriteid + 6                                           ; 40ba: 8d ae 09
    lda #0                                                            ; 40bd: a9 00
    sta object_spriteid_old + 6                                       ; 40bf: 8d b9 09
    jmp c40e6                                                         ; 40c2: 4c e6 40

c40c5
    tay                                                               ; 40c5: a8
    lda l4023,y                                                       ; 40c6: b9 23 40
    sta object_spriteid + 6                                           ; 40c9: 8d ae 09
    lda #$38 ; '8'                                                    ; 40cc: a9 38
    sta object_y_low + 6                                              ; 40ce: 8d 82 09
    lda object_spriteid + 6                                           ; 40d1: ad ae 09
    cmp object_spriteid_old + 6                                       ; 40d4: cd b9 09
    bne c40e1                                                         ; 40d7: d0 08
    lda object_y_low + 6                                              ; 40d9: ad 82 09
    cmp object_y_low_old + 6                                          ; 40dc: cd 8d 09
    beq c40e6                                                         ; 40df: f0 05
c40e1
    lda #0                                                            ; 40e1: a9 00
    sta object_spriteid_old + 6                                       ; 40e3: 8d b9 09
c40e6
    lda object_y_low + 6                                              ; 40e6: ad 82 09
    cmp #$89                                                          ; 40e9: c9 89
    bcs c411c                                                         ; 40eb: b0 2f
    ldx #8                                                            ; 40ed: a2 08
    ldy #2                                                            ; 40ef: a0 02
    lda #1                                                            ; 40f1: a9 01
    sta width_in_cells                                                ; 40f3: 85 3c
    lda #$14                                                          ; 40f5: a9 14
    sta height_in_cells                                               ; 40f7: 85 3d
    lda #collision_map_rope                                           ; 40f9: a9 02
    sta value_to_write_to_collision_map                               ; 40fb: 85 3e
    jsr read_collision_map_value_for_xy                               ; 40fd: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 4100: c5 3e
    beq c4107                                                         ; 4102: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 4104: 20 44 1e
c4107
    lda object_y_low + 6                                              ; 4107: ad 82 09
    sec                                                               ; 410a: 38
    sbc #6                                                            ; 410b: e9 06
    lsr                                                               ; 410d: 4a
    lsr                                                               ; 410e: 4a
    lsr                                                               ; 410f: 4a
    tay                                                               ; 4110: a8
    lda #3                                                            ; 4111: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4113: 20 bb 1e
    iny                                                               ; 4116: c8
    lda #2                                                            ; 4117: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4119: 20 bb 1e
; check for first update in room (branch if so)
c411c
    lda update_room_first_update_flag                                 ; 411c: ad 2b 13
    bne return3                                                       ; 411f: d0 0c
    lda l0a49                                                         ; 4121: ad 49 0a
    beq return3                                                       ; 4124: f0 07
    cmp #$45 ; 'E'                                                    ; 4126: c9 45
    beq return3                                                       ; 4128: f0 03
    inc l0a49                                                         ; 412a: ee 49 0a
return3
    rts                                                               ; 412d: 60

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 20                                                          ; 412e: 14                      ; initial player X cell
    !byte 22                                                          ; 412f: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####    |           |          |    ####
; ###     |           |          |     ###
; ###     |           |          |     ###
; ###     |          S|          |     ###
; ###     |                      |     ###
; ###     |                      |     ###
; ###     |                      |     ###
;         |                      |
;         |                      |
;         |                      |
;         |   ################   |
;         |   ################   |
; #####   |                      |   #####
; #####   |                      |   #####
;         |                      |     ###
;         |                      |     ###
;         |                      |     ###
;         |                      |     ###
;                                      ###
; #####               P                ###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_2_code
    jsr sub_c3b24                                                     ; 4130: 20 24 3b
; draw 3x7 rectangle at (0,2)
    ldx #0                                                            ; 4133: a2 00
    ldy #2                                                            ; 4135: a0 02
    lda #3                                                            ; 4137: a9 03
    sta width_in_cells                                                ; 4139: 85 3c
    lda #7                                                            ; 413b: a9 07
    sta height_in_cells                                               ; 413d: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 413f: 20 bb 1a
; draw 3x7 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 4142: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 4144: 20 bb 1a
; draw 3x6 rectangle at (37,16)
    ldy #$10                                                          ; 4147: a0 10
    dec height_in_cells                                               ; 4149: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 414b: 20 bb 1a
; draw 5x2 rectangle at (0,14)
    ldx #0                                                            ; 414e: a2 00
    ldy #$0e                                                          ; 4150: a0 0e
    lda #5                                                            ; 4152: a9 05
    sta width_in_cells                                                ; 4154: 85 3c
    lda #2                                                            ; 4156: a9 02
    sta height_in_cells                                               ; 4158: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 415a: 20 bb 1a
; draw 5x2 rectangle at (35,14)
    ldx #$23 ; '#'                                                    ; 415d: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 415f: 20 bb 1a
; draw 16x2 rectangle at (12,12)
    ldx #$0c                                                          ; 4162: a2 0c
    ldy #$0c                                                          ; 4164: a0 0c
    lda #$10                                                          ; 4166: a9 10
    sta width_in_cells                                                ; 4168: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 416a: 20 bb 1a
; draw 5x1 rectangle at (0,21)
    ldx #0                                                            ; 416d: a2 00
    ldy #$15                                                          ; 416f: a0 15
    lda #5                                                            ; 4171: a9 05
    sta width_in_cells                                                ; 4173: 85 3c
    lda #1                                                            ; 4175: a9 01
    sta height_in_cells                                               ; 4177: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4179: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 417c: 20 90 1b
; draw rope at (8,2) length 18
    ldx #8                                                            ; 417f: a2 08
    ldy #2                                                            ; 4181: a0 02
    lda #$12                                                          ; 4183: a9 12
    jsr draw_rope                                                     ; 4185: 20 b9 1d
; draw rope at (31,2) length 18
    ldx #$1f                                                          ; 4188: a2 1f
    jsr draw_rope                                                     ; 418a: 20 b9 1d
; draw rope at (20,2) length 4
    lda #3                                                            ; 418d: a9 03
    sta width_in_cells                                                ; 418f: 85 3c
    lda #2                                                            ; 4191: a9 02
    sta height_in_cells                                               ; 4193: 85 3d
    ldx #$14                                                          ; 4195: a2 14
    ldy #2                                                            ; 4197: a0 02
    lda #4                                                            ; 4199: a9 04
    jsr draw_rope                                                     ; 419b: 20 b9 1d
; draw sprite $db at (19,5)
    dex                                                               ; 419e: ca
    ldy #5                                                            ; 419f: a0 05
    lda #$db                                                          ; 41a1: a9 db
    jsr draw_sprite_a_at_cell_xy                                      ; 41a3: 20 4c 1f
    jsr start_room                                                    ; 41a6: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 41a9: 20 da 12
    sta room_exit_direction                                           ; 41ac: 85 70
    and #exit_room_left                                               ; 41ae: 29 01
    beq room_2_check_right_exit                                       ; 41b0: f0 07
    ldx #1                                                            ; 41b2: a2 01
    ldy current_level                                                 ; 41b4: a4 31
    jmp initialise_level_and_room                                     ; 41b6: 4c 40 11

room_2_check_right_exit
    lda room_exit_direction                                           ; 41b9: a5 70
    and #exit_room_right                                              ; 41bb: 29 04
    beq room_2_game_update_loop                                       ; 41bd: f0 ea
    ldx #3                                                            ; 41bf: a2 03
    ldy current_level                                                 ; 41c1: a4 31
    jmp initialise_level_and_room                                     ; 41c3: 4c 40 11

l41c6
    !byte   0,   0,   7,   7,   7,   6,   6,   5, $80,   4,   3,   2  ; 41c6: 00 00 07...
    !byte   1, $80,   0, $80                                          ; 41d2: 01 80 00...
l41d6
    !byte   1,   2,   3,   4,   6,   8, $80                           ; 41d6: 01 02 03...

return4
    rts                                                               ; 41dd: 60

room_2_update_handler
    lda #2                                                            ; 41de: a9 02
    sta currently_updating_logic_for_room_index                       ; 41e0: 8d ba 1a
    ldx #3                                                            ; 41e3: a2 03
    ldy #6                                                            ; 41e5: a0 06
    lda #2                                                            ; 41e7: a9 02
    jsr update_brazier_and_fire                                       ; 41e9: 20 88 19
    ldx #$25 ; '%'                                                    ; 41ec: a2 25
    lda #3                                                            ; 41ee: a9 03
    jsr update_brazier_and_fire                                       ; 41f0: 20 88 19
    lda l0a49                                                         ; 41f3: ad 49 0a
    bne return4                                                       ; 41f6: d0 e5
; check for first update in room (branch if so)
    lda update_room_first_update_flag                                 ; 41f8: ad 2b 13
    bne c4200                                                         ; 41fb: d0 03
    jmp c4275                                                         ; 41fd: 4c 75 42

c4200
    lda #$d8                                                          ; 4200: a9 d8
    sta toolbar_collectable_spriteids+1                               ; 4202: 8d e9 2e
    lda #$d9                                                          ; 4205: a9 d9
    sta collectable_spriteids+1                                       ; 4207: 8d ee 2e
    sta collectable_being_used_spriteids + 1                          ; 420a: 8d f3 2e
; check for level change (branch if not)
    lda current_level                                                 ; 420d: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 420f: c5 51
    beq c4244                                                         ; 4211: f0 31
    lda l0a40                                                         ; 4213: ad 40 0a
    beq c4220                                                         ; 4216: f0 08
    bmi c4244                                                         ; 4218: 30 2a
    dec l0a74                                                         ; 421a: ce 74 0a
    jmp c4244                                                         ; 421d: 4c 44 42

c4220
    lda #$a1                                                          ; 4220: a9 a1
    sta l0a42                                                         ; 4222: 8d 42 0a
    lda #0                                                            ; 4225: a9 00
    sta l0a43                                                         ; 4227: 8d 43 0a
    lda #1                                                            ; 422a: a9 01
    sta l0a45                                                         ; 422c: 8d 45 0a
    sta l0a47                                                         ; 422f: 8d 47 0a
    lda #$5b ; '['                                                    ; 4232: a9 5b
    sta l0a44                                                         ; 4234: 8d 44 0a
    lda #2                                                            ; 4237: a9 02
    sta l0a46                                                         ; 4239: 8d 46 0a
    lda #$0e                                                          ; 423c: a9 0e
    sta l0a40                                                         ; 423e: 8d 40 0a
    sta l0a41                                                         ; 4241: 8d 41 0a
c4244
    lda desired_room_index                                            ; 4244: a5 30
    cmp l0a46                                                         ; 4246: cd 46 0a
    bne c426d                                                         ; 4249: d0 22
    lda l0a40                                                         ; 424b: ad 40 0a
    bmi c426d                                                         ; 424e: 30 1d
    jsr sub_c4480                                                     ; 4250: 20 80 44
loop_c4253
    lda desired_room_index                                            ; 4253: a5 30
    cmp l0a46                                                         ; 4255: cd 46 0a
    bne c426d                                                         ; 4258: d0 13
    lda l0a74                                                         ; 425a: ad 74 0a
    beq c426d                                                         ; 425d: f0 0e
    dec l0a74                                                         ; 425f: ce 74 0a
    ldx #6                                                            ; 4262: a2 06
    jsr l20f7                                                         ; 4264: 20 f7 20
    jsr sub_c4371                                                     ; 4267: 20 71 43
    jmp loop_c4253                                                    ; 426a: 4c 53 42

c426d
    lda #0                                                            ; 426d: a9 00
    sta object_spriteid_old + 6                                       ; 426f: 8d b9 09
c4272
    jmp return5                                                       ; 4272: 4c 70 43

c4275
    lda #0                                                            ; 4275: a9 00
    sta l44a8                                                         ; 4277: 8d a8 44
    lda player_held_object_spriteid                                   ; 427a: a5 52
    sta l44a9                                                         ; 427c: 8d a9 44
    lda object_spriteid_old + 6                                       ; 427f: ad b9 09
    sta l44aa                                                         ; 4282: 8d aa 44
    lda l0a40                                                         ; 4285: ad 40 0a
    bmi c429c                                                         ; 4288: 30 12
    lda desired_room_index                                            ; 428a: a5 30
    cmp l0a46                                                         ; 428c: cd 46 0a
    beq c42e4                                                         ; 428f: f0 53
    lda l0a74                                                         ; 4291: ad 74 0a
    bmi c4272                                                         ; 4294: 30 dc
    inc l0a74                                                         ; 4296: ee 74 0a
    jmp return5                                                       ; 4299: 4c 70 43

c429c
    lda #$d8                                                          ; 429c: a9 d8
    cmp player_using_object_spriteid                                  ; 429e: cd b6 2e
    bne c4272                                                         ; 42a1: d0 cf
    cmp previous_player_using_object_spriteid                         ; 42a3: cd b7 2e
    beq c4272                                                         ; 42a6: f0 ca
    dec l44a8                                                         ; 42a8: ce a8 44
    lda desired_room_index                                            ; 42ab: a5 30
    sta l0a46                                                         ; 42ad: 8d 46 0a
    lda object_direction                                              ; 42b0: ad be 09
    sta l0a45                                                         ; 42b3: 8d 45 0a
    sta l0a47                                                         ; 42b6: 8d 47 0a
    lda object_x_low + objectid_player_accessory                      ; 42b9: ad 51 09
    sta l0a42                                                         ; 42bc: 8d 42 0a
    lda object_x_high + objectid_player_accessory                     ; 42bf: ad 67 09
    sta l0a43                                                         ; 42c2: 8d 43 0a
    lda object_y_low + objectid_player_accessory                      ; 42c5: ad 7d 09
    sta l0a44                                                         ; 42c8: 8d 44 0a
    lda #1                                                            ; 42cb: a9 01
    sta l0a41                                                         ; 42cd: 8d 41 0a
    sta l0a40                                                         ; 42d0: 8d 40 0a
    lda #0                                                            ; 42d3: a9 00
    sta l0a48                                                         ; 42d5: 8d 48 0a
    jsr sub_c4480                                                     ; 42d8: 20 80 44
    ldx #6                                                            ; 42db: a2 06
    jsr l20f7                                                         ; 42dd: 20 f7 20
    lda #0                                                            ; 42e0: a9 00
    sta player_held_object_spriteid                                   ; 42e2: 85 52
c42e4
    jsr sub_c4371                                                     ; 42e4: 20 71 43
    lda desired_room_index                                            ; 42e7: a5 30
    cmp l0a46                                                         ; 42e9: cd 46 0a
    beq c42f3                                                         ; 42ec: f0 05
    lda #0                                                            ; 42ee: a9 00
    sta l0a74                                                         ; 42f0: 8d 74 0a
c42f3
    lda l44aa                                                         ; 42f3: ad aa 44
    sta object_spriteid_old + 6                                       ; 42f6: 8d b9 09
    ldx #objectid_old_player                                          ; 42f9: a2 0b
    ldy #6                                                            ; 42fb: a0 06
    jsr test_for_collision_between_objects_x_and_y                    ; 42fd: 20 e2 28
    ldx l44a9                                                         ; 4300: ae a9 44
    stx player_held_object_spriteid                                   ; 4303: 86 52
    ora #0                                                            ; 4305: 09 00
    beq c4320                                                         ; 4307: f0 17
    lda l44a8                                                         ; 4309: ad a8 44
    bne c4313                                                         ; 430c: d0 05
    lda #$d8                                                          ; 430e: a9 d8
    jsr find_or_create_menu_slot_for_A                                ; 4310: 20 bd 2b
c4313
    lda #0                                                            ; 4313: a9 00
    sta object_spriteid + 6                                           ; 4315: 8d ae 09
    lda #$ff                                                          ; 4318: a9 ff
    sta l0a40                                                         ; 431a: 8d 40 0a
    jmp return5                                                       ; 431d: 4c 70 43

c4320
    lda l44a8                                                         ; 4320: ad a8 44
    beq c4334                                                         ; 4323: f0 0f
    lda #$d8                                                          ; 4325: a9 d8
    jsr remove_item_from_toolbar_menu                                 ; 4327: 20 e0 2b
    lda #0                                                            ; 432a: a9 00
    sta object_spriteid + objectid_player_accessory                   ; 432c: 8d a9 09
    sta player_using_object_spriteid                                  ; 432f: 8d b6 2e
    sta player_held_object_spriteid                                   ; 4332: 85 52
c4334
    lda object_x_low + 6                                              ; 4334: ad 56 09
    cmp object_x_low_old + 6                                          ; 4337: cd 61 09
    beq c4356                                                         ; 433a: f0 1a
    lda l0a47                                                         ; 433c: ad 47 0a
    bmi c4347                                                         ; 433f: 30 06
    inc temp_right_offset                                             ; 4341: ee d1 24
    jmp c434a                                                         ; 4344: 4c 4a 43

c4347
    dec temp_left_offset                                              ; 4347: ce d0 24
c434a
    lda #1                                                            ; 434a: a9 01
    sta temp_bottom_offset                                            ; 434c: 8d 51 25
    lda #6                                                            ; 434f: a9 06
    jsr get_solid_rock_collision_for_object_a                         ; 4351: 20 94 28
    bne c436d                                                         ; 4354: d0 17
c4356
    lda object_y_low + 6                                              ; 4356: ad 82 09
    cmp object_y_low_old + 6                                          ; 4359: cd 8d 09
    beq return5                                                       ; 435c: f0 12
    dec temp_top_offset                                               ; 435e: ce 50 25
    lda #2                                                            ; 4361: a9 02
    sta temp_bottom_offset                                            ; 4363: 8d 51 25
    lda #6                                                            ; 4366: a9 06
    jsr get_solid_rock_collision_for_object_a                         ; 4368: 20 94 28
    beq return5                                                       ; 436b: f0 03
c436d
    jsr play_landing_sound                                            ; 436d: 20 a9 23
return5
    rts                                                               ; 4370: 60

sub_c4371
    lda l0a46                                                         ; 4371: ad 46 0a
    cmp #1                                                            ; 4374: c9 01
    bne c4390                                                         ; 4376: d0 18
    ldx #$11                                                          ; 4378: a2 11
    ldy #5                                                            ; 437a: a0 05
    jsr test_for_collision_between_objects_x_and_y                    ; 437c: 20 e2 28
    beq c4390                                                         ; 437f: f0 0f
    lda #0                                                            ; 4381: a9 00
    sta object_spriteid + 6                                           ; 4383: 8d ae 09
    lda #1                                                            ; 4386: a9 01
    sta l0a49                                                         ; 4388: 8d 49 0a
    lda #0                                                            ; 438b: a9 00
    sta l0a74                                                         ; 438d: 8d 74 0a
c4390
    lda l0a41                                                         ; 4390: ad 41 0a
    clc                                                               ; 4393: 18
    adc #1                                                            ; 4394: 69 01
    tay                                                               ; 4396: a8
    lda l41c6,y                                                       ; 4397: b9 c6 41
    cmp #$80                                                          ; 439a: c9 80
    bne c43a1                                                         ; 439c: d0 03
    ldy l0a40                                                         ; 439e: ac 40 0a
c43a1
    lda l0a40                                                         ; 43a1: ad 40 0a
    cmp #1                                                            ; 43a4: c9 01
    bne c43b5                                                         ; 43a6: d0 0d
    cpy l0a40                                                         ; 43a8: cc 40 0a
    bne c43cf                                                         ; 43ab: d0 22
    ldy #9                                                            ; 43ad: a0 09
    sty l0a40                                                         ; 43af: 8c 40 0a
    jmp c43cf                                                         ; 43b2: 4c cf 43

c43b5
    cpy #9                                                            ; 43b5: c0 09
    bne c43be                                                         ; 43b7: d0 05
    ldy #$0e                                                          ; 43b9: a0 0e
    sty l0a40                                                         ; 43bb: 8c 40 0a
c43be
    lda #6                                                            ; 43be: a9 06
    jsr l2770                                                         ; 43c0: 20 70 27
    beq c43cf                                                         ; 43c3: f0 0a
    lda l2890                                                         ; 43c5: ad 90 28
    beq c43cf                                                         ; 43c8: f0 05
    ldy #9                                                            ; 43ca: a0 09
    sty l0a40                                                         ; 43cc: 8c 40 0a
c43cf
    sty l0a41                                                         ; 43cf: 8c 41 0a
    lda l41c6,y                                                       ; 43d2: b9 c6 41
    ldx l0a47                                                         ; 43d5: ae 47 0a
    bpl c43df                                                         ; 43d8: 10 05
    eor #$ff                                                          ; 43da: 49 ff
    clc                                                               ; 43dc: 18
    adc #1                                                            ; 43dd: 69 01
c43df
    ldx #0                                                            ; 43df: a2 00
    ora #0                                                            ; 43e1: 09 00
    bpl c43e6                                                         ; 43e3: 10 01
    dex                                                               ; 43e5: ca
c43e6
    clc                                                               ; 43e6: 18
    adc l0a42                                                         ; 43e7: 6d 42 0a
    sta l0a42                                                         ; 43ea: 8d 42 0a
    txa                                                               ; 43ed: 8a
    adc l0a43                                                         ; 43ee: 6d 43 0a
    sta l0a43                                                         ; 43f1: 8d 43 0a
    ldy l0a48                                                         ; 43f4: ac 48 0a
    lda #2                                                            ; 43f7: a9 02
    sta temp_bottom_offset                                            ; 43f9: 8d 51 25
    lda #6                                                            ; 43fc: a9 06
    jsr get_solid_rock_collision_for_object_a                         ; 43fe: 20 94 28
    beq c440f                                                         ; 4401: f0 0c
    ldy #0                                                            ; 4403: a0 00
    lda l0a40                                                         ; 4405: ad 40 0a
    cmp #$0e                                                          ; 4408: c9 0e
    bne c440f                                                         ; 440a: d0 03
    sty l0a74                                                         ; 440c: 8c 74 0a
c440f
    lda l41d6,y                                                       ; 440f: b9 d6 41
    clc                                                               ; 4412: 18
    adc l0a44                                                         ; 4413: 6d 44 0a
    sta l0a44                                                         ; 4416: 8d 44 0a
    iny                                                               ; 4419: c8
    lda l41d6,y                                                       ; 441a: b9 d6 41
    cmp #$80                                                          ; 441d: c9 80
    bne c4422                                                         ; 441f: d0 01
    dey                                                               ; 4421: 88
c4422
    sty l0a48                                                         ; 4422: 8c 48 0a
    jsr sub_c4480                                                     ; 4425: 20 80 44
    lda #6                                                            ; 4428: a9 06
    jsr l25f5                                                         ; 442a: 20 f5 25
    lda object_x_low + 6                                              ; 442d: ad 56 09
    sta l0a42                                                         ; 4430: 8d 42 0a
    lda object_x_high + 6                                             ; 4433: ad 6c 09
    sta l0a43                                                         ; 4436: 8d 43 0a
    lda object_y_low + 6                                              ; 4439: ad 82 09
    sta l0a44                                                         ; 443c: 8d 44 0a
    ldx #6                                                            ; 443f: a2 06
    jsr find_left_and_right_of_object                                 ; 4441: 20 34 24
    lda l0a47                                                         ; 4444: ad 47 0a
    bmi c4465                                                         ; 4447: 30 1c
    lda l0078                                                         ; 4449: a5 78
    cmp #$28 ; '('                                                    ; 444b: c9 28
    bcc return6                                                       ; 444d: 90 30
    lda l0a42                                                         ; 444f: ad 42 0a
    sec                                                               ; 4452: 38
    sbc #$40 ; '@'                                                    ; 4453: e9 40
    sta l0a42                                                         ; 4455: 8d 42 0a
    lda #0                                                            ; 4458: a9 00
    sbc #0                                                            ; 445a: e9 00
    sta l0a43                                                         ; 445c: 8d 43 0a
    inc l0a46                                                         ; 445f: ee 46 0a
    jmp c447a                                                         ; 4462: 4c 7a 44

c4465
    lda l0079                                                         ; 4465: a5 79
    bpl return6                                                       ; 4467: 10 16
    lda l0a42                                                         ; 4469: ad 42 0a
    clc                                                               ; 446c: 18
    adc #$40 ; '@'                                                    ; 446d: 69 40
    sta l0a42                                                         ; 446f: 8d 42 0a
    lda #1                                                            ; 4472: a9 01
    sta l0a43                                                         ; 4474: 8d 43 0a
    dec l0a46                                                         ; 4477: ce 46 0a
c447a
    lda #0                                                            ; 447a: a9 00
    sta object_spriteid + 6                                           ; 447c: 8d ae 09
return6
    rts                                                               ; 447f: 60

sub_c4480
    lda #$da                                                          ; 4480: a9 da
    sta l38b2                                                         ; 4482: 8d b2 38
    lda #$f0                                                          ; 4485: a9 f0
    sta l38c8                                                         ; 4487: 8d c8 38
    lda l0a42                                                         ; 448a: ad 42 0a
    sta object_x_low + 6                                              ; 448d: 8d 56 09
    lda l0a43                                                         ; 4490: ad 43 0a
    sta object_x_high + 6                                             ; 4493: 8d 6c 09
    lda l0a44                                                         ; 4496: ad 44 0a
    sta object_y_low + 6                                              ; 4499: 8d 82 09
    lda #$d9                                                          ; 449c: a9 d9
    sta object_spriteid + 6                                           ; 449e: 8d ae 09
    lda l0a45                                                         ; 44a1: ad 45 0a
    sta object_direction + 6                                          ; 44a4: 8d c4 09
    rts                                                               ; 44a7: 60

l44a8
    !byte 0                                                           ; 44a8: 00
l44a9
    !byte 0                                                           ; 44a9: 00
l44aa
    !byte   0, $60                                                    ; 44aa: 00 60
; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 20                                                          ; 44ac: 14                      ; initial player X cell
    !byte 22                                                          ; 44ad: 16                      ; initial player Y cell

; ########################################
; ########################################
; ####    |           |           |   ####
; ###     |           |           |    ###
; ###     |           |           |    ###
; ###     |           |           |    ###
; ###     |           |           |    ###
; ###     |           |           |    ###
; ###     |           |           |    ###
;         |           |           |    ###
;         |    OOO    |    OOO    |    ###
;         |    OOO         OOO    |    ###
;         |   #####       #####   |    ###
;         |   #####       #####   |    ###
; #####   |                       |    ###
; #####   |                       |    ###
; ###     |                       |    ###
; ###     |                       |    ###
; ###                                  ###
; ###                                  ###
; ###                               OOO###
; ###                 P             OOO###
; ########################################
; ########################################
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
room_3_code
    jsr sub_c3b24                                                     ; 44ae: 20 24 3b
; draw 3x7 rectangle at (0,2)
    ldx #0                                                            ; 44b1: a2 00
    ldy #2                                                            ; 44b3: a0 02
    lda #3                                                            ; 44b5: a9 03
    sta width_in_cells                                                ; 44b7: 85 3c
    lda #7                                                            ; 44b9: a9 07
    sta height_in_cells                                               ; 44bb: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 44bd: 20 bb 1a
; draw 3x20 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 44c0: a2 25
    lda #$14                                                          ; 44c2: a9 14
    sta height_in_cells                                               ; 44c4: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 44c6: 20 bb 1a
; draw 3x8 rectangle at (0,14)
    ldx #0                                                            ; 44c9: a2 00
    ldy #$0e                                                          ; 44cb: a0 0e
    lda #8                                                            ; 44cd: a9 08
    sta height_in_cells                                               ; 44cf: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 44d1: 20 bb 1a
; draw 2x2 rectangle at (3,14)
    ldx #3                                                            ; 44d4: a2 03
    dec width_in_cells                                                ; 44d6: c6 3c
    lda #2                                                            ; 44d8: a9 02
    sta height_in_cells                                               ; 44da: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 44dc: 20 bb 1a
; draw 5x2 rectangle at (12,12)
    ldx #$0c                                                          ; 44df: a2 0c
    ldy #$0c                                                          ; 44e1: a0 0c
    lda #5                                                            ; 44e3: a9 05
    sta width_in_cells                                                ; 44e5: 85 3c
    lda #2                                                            ; 44e7: a9 02
    sta height_in_cells                                               ; 44e9: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 44eb: 20 bb 1a
; draw 5x2 rectangle at (24,12)
    ldx #$18                                                          ; 44ee: a2 18
    jsr copy_rectangle_of_memory_to_screen                            ; 44f0: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 44f3: 20 90 1b
; draw sprite $ce at (13,10) of size (3x2)
    lda #3                                                            ; 44f6: a9 03
    sta width_in_cells                                                ; 44f8: 85 3c
    lda #2                                                            ; 44fa: a9 02
    sta height_in_cells                                               ; 44fc: 85 3d
    ldx #$0d                                                          ; 44fe: a2 0d
    ldy #$0a                                                          ; 4500: a0 0a
    lda #$ce                                                          ; 4502: a9 ce
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 4504: 20 57 1f
; draw sprite $ce at (25,10) of size (3x2)
    ldx #$19                                                          ; 4507: a2 19
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 4509: 20 57 1f
; draw sprite $ce at (34,20) of size (3x2)
    ldx #$22 ; '"'                                                    ; 450c: a2 22
    ldy #$14                                                          ; 450e: a0 14
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 4510: 20 57 1f
; draw rope at (8,2) length 16
    ldx #8                                                            ; 4513: a2 08
    ldy #2                                                            ; 4515: a0 02
    lda #$10                                                          ; 4517: a9 10
    jsr draw_rope                                                     ; 4519: 20 b9 1d
; draw rope at (32,2) length 16
    ldx #$20 ; ' '                                                    ; 451c: a2 20
    jsr draw_rope                                                     ; 451e: 20 b9 1d
; draw rope at (20,2) length 9
    ldx #$14                                                          ; 4521: a2 14
    lda #9                                                            ; 4523: a9 09
    jsr draw_rope                                                     ; 4525: 20 b9 1d
    jsr start_room                                                    ; 4528: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 452b: 20 da 12
    and #exit_room_left                                               ; 452e: 29 01
    beq room_3_game_update_loop                                       ; 4530: f0 f9
    ldx #2                                                            ; 4532: a2 02
    ldy current_level                                                 ; 4534: a4 31
    jmp initialise_level_and_room                                     ; 4536: 4c 40 11

room_3_update_handler
    lda #3                                                            ; 4539: a9 03
    sta currently_updating_logic_for_room_index                       ; 453b: 8d ba 1a
    ldx #3                                                            ; 453e: a2 03
    ldy #6                                                            ; 4540: a0 06
    lda #3                                                            ; 4542: a9 03
    jmp update_brazier_and_fire                                       ; 4544: 4c 88 19

envelope1
    !byte 5                                                           ; 4547: 05                      ; envelope number
    !byte 1                                                           ; 4548: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 4549: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 454a: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 454b: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 454c: 00                      ; number of steps in section 1
    !byte 0                                                           ; 454d: 00                      ; number of steps in section 2
    !byte 0                                                           ; 454e: 00                      ; number of steps in section 3
    !byte 10                                                          ; 454f: 0a                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4550: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4551: 00                      ; change of amplitude per step during sustain phase
    !byte 216                                                         ; 4552: d8                      ; change of amplitude per step during release phase
    !byte 40                                                          ; 4553: 28                      ; target of level at end of attack phase
    !byte 0                                                           ; 4554: 00                      ; target of level at end of decay phase
    !byte $10,   0,   5,   0,   4,   0,   4,   0                      ; 4555: 10 00 05...
envelope2
    !byte 6                                                           ; 455d: 06                      ; envelope number
    !byte 1                                                           ; 455e: 01                      ; step length (100ths of a second)
    !byte 0                                                           ; 455f: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 4560: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 4561: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 4562: 00                      ; number of steps in section 1
    !byte 0                                                           ; 4563: 00                      ; number of steps in section 2
    !byte 0                                                           ; 4564: 00                      ; number of steps in section 3
    !byte 55                                                          ; 4565: 37                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4566: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4567: 00                      ; change of amplitude per step during sustain phase
    !byte 250                                                         ; 4568: fa                      ; change of amplitude per step during release phase
    !byte 110                                                         ; 4569: 6e                      ; target of level at end of attack phase
    !byte 55                                                          ; 456a: 37                      ; target of level at end of decay phase
sound4
    !word $10                                                         ; 456b: 10 00                   ; channel
    !word 6                                                           ; 456d: 06 00                   ; amplitude
    !word 7                                                           ; 456f: 07 00                   ; pitch
    !word 1                                                           ; 4571: 01 00                   ; duration
sound3
    !word $11                                                         ; 4573: 11 00                   ; channel
    !word 0                                                           ; 4575: 00 00                   ; amplitude
    !word 210                                                         ; 4577: d2 00                   ; pitch
    !word 1                                                           ; 4579: 01 00                   ; duration
envelope4
    !byte 7                                                           ; 457b: 07                      ; envelope number
    !byte 2                                                           ; 457c: 02                      ; step length (100ths of a second)
    !byte 0                                                           ; 457d: 00                      ; pitch change per step in section 1
    !byte 0                                                           ; 457e: 00                      ; pitch change per step in section 2
    !byte 0                                                           ; 457f: 00                      ; pitch change per step in section 3
    !byte 0                                                           ; 4580: 00                      ; number of steps in section 1
    !byte 0                                                           ; 4581: 00                      ; number of steps in section 2
    !byte 0                                                           ; 4582: 00                      ; number of steps in section 3
    !byte 120                                                         ; 4583: 78                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4584: 00                      ; change of amplitude per step during decay phase
    !byte 246                                                         ; 4585: f6                      ; change of amplitude per step during sustain phase
    !byte 246                                                         ; 4586: f6                      ; change of amplitude per step during release phase
    !byte 120                                                         ; 4587: 78                      ; target of level at end of attack phase
    !byte 0                                                           ; 4588: 00                      ; target of level at end of decay phase
sound2
    !word $10                                                         ; 4589: 10 00                   ; channel
    !word 7                                                           ; 458b: 07 00                   ; amplitude
    !word 3                                                           ; 458d: 03 00                   ; pitch
    !word 2                                                           ; 458f: 02 00                   ; duration
envelope3
    !byte 8                                                           ; 4591: 08                      ; envelope number
    !byte 130                                                         ; 4592: 82                      ; step length (100ths of a second)
    !byte 252                                                         ; 4593: fc                      ; pitch change per step in section 1
    !byte 254                                                         ; 4594: fe                      ; pitch change per step in section 2
    !byte 255                                                         ; 4595: ff                      ; pitch change per step in section 3
    !byte 20                                                          ; 4596: 14                      ; number of steps in section 1
    !byte 40                                                          ; 4597: 28                      ; number of steps in section 2
    !byte 80                                                          ; 4598: 50                      ; number of steps in section 3
    !byte 0                                                           ; 4599: 00                      ; change of amplitude per step during attack phase
    !byte 0                                                           ; 459a: 00                      ; change of amplitude per step during decay phase
    !byte 0                                                           ; 459b: 00                      ; change of amplitude per step during sustain phase
    !byte 0                                                           ; 459c: 00                      ; change of amplitude per step during release phase
    !byte 0                                                           ; 459d: 00                      ; target of level at end of attack phase
    !byte 0                                                           ; 459e: 00                      ; target of level at end of decay phase
sound1
    !word $11                                                         ; 459f: 11 00                   ; channel
    !word 8                                                           ; 45a1: 08 00                   ; amplitude
    !word 128                                                         ; 45a3: 80 00                   ; pitch
    !word 2                                                           ; 45a5: 02 00                   ; duration
    !byte $81,   6, $18, $60, $80, $80, $43, $4c, $89                 ; 45a7: 81 06 18...
    !text "F@  "                                                      ; 45b0: 46 40 20...
    !byte $c0,   0, $0c, $30,   0, $0e, $11, $91, $91                 ; 45b4: c0 00 0c...
    !text "N@2BA! "                                                   ; 45bd: 4e 40 32...
    !byte $10, $10,   8                                               ; 45c4: 10 10 08
sprite_data
pydis_end

; Automatically generated labels:
;     c3b08
;     c3ccd
;     c3ce1
;     c3cf2
;     c3cf8
;     c3d0d
;     c3d10
;     c3d21
;     c3d2d
;     c3d3e
;     c3d53
;     c3d62
;     c3d6a
;     c3d7b
;     c3dac
;     c3ddf
;     c3dee
;     c3df9
;     c3e02
;     c3e7d
;     c3e94
;     c3ed0
;     c3ed3
;     c3f03
;     c3f3e
;     c3f55
;     c3f73
;     c3f86
;     c3f9f
;     c3fa5
;     c3fd2
;     c3fe8
;     c403e
;     c405d
;     c4078
;     c4081
;     c40c5
;     c40e1
;     c40e6
;     c4107
;     c411c
;     c4200
;     c4220
;     c4244
;     c426d
;     c4272
;     c4275
;     c429c
;     c42e4
;     c42f3
;     c4313
;     c4320
;     c4334
;     c4347
;     c434a
;     c4356
;     c436d
;     c4390
;     c43a1
;     c43b5
;     c43be
;     c43cf
;     c43df
;     c43e6
;     c440f
;     c4422
;     c4465
;     c447a
;     l0048
;     l0078
;     l0079
;     l09df
;     l0a3f
;     l0a40
;     l0a41
;     l0a42
;     l0a43
;     l0a44
;     l0a45
;     l0a46
;     l0a47
;     l0a48
;     l0a49
;     l0a70
;     l0a71
;     l0a72
;     l0a73
;     l0a74
;     l20f7
;     l25f5
;     l2770
;     l2890
;     l38af
;     l38b1
;     l38b2
;     l38c5
;     l38c6
;     l38c7
;     l38c8
;     l38c9
;     l3c76
;     l4018
;     l4019
;     l4023
;     l41c6
;     l41d6
;     l44a8
;     l44a9
;     l44aa
;     loop_c3e2b
;     loop_c3e4c
;     loop_c3e8c
;     loop_c4026
;     loop_c406e
;     loop_c407e
;     loop_c4253
;     sub_c3b24
;     sub_c3cb5
;     sub_c3de6
;     sub_c401a
;     sub_c4029
;     sub_c4371
;     sub_c4480
!if (<envelope1) != $47 {
    !error "Assertion failed: <envelope1 == $47"
}
!if (<envelope2) != $5d {
    !error "Assertion failed: <envelope2 == $5d"
}
!if (<envelope3) != $91 {
    !error "Assertion failed: <envelope3 == $91"
}
!if (<envelope4) != $7b {
    !error "Assertion failed: <envelope4 == $7b"
}
!if (<sound1) != $9f {
    !error "Assertion failed: <sound1 == $9f"
}
!if (<sound2) != $89 {
    !error "Assertion failed: <sound2 == $89"
}
!if (<sound3) != $73 {
    !error "Assertion failed: <sound3 == $73"
}
!if (<sound4) != $6b {
    !error "Assertion failed: <sound4 == $6b"
}
!if (>envelope1) != $45 {
    !error "Assertion failed: >envelope1 == $45"
}
!if (>envelope2) != $45 {
    !error "Assertion failed: >envelope2 == $45"
}
!if (>envelope3) != $45 {
    !error "Assertion failed: >envelope3 == $45"
}
!if (>envelope4) != $45 {
    !error "Assertion failed: >envelope4 == $45"
}
!if (>sound1) != $45 {
    !error "Assertion failed: >sound1 == $45"
}
!if (>sound2) != $45 {
    !error "Assertion failed: >sound2 == $45"
}
!if (>sound3) != $45 {
    !error "Assertion failed: >sound3 == $45"
}
!if (>sound4) != $45 {
    !error "Assertion failed: >sound4 == $45"
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
!if (level_specific_initialisation) != $3af3 {
    !error "Assertion failed: level_specific_initialisation == $3af3"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b11 {
    !error "Assertion failed: level_specific_update == $3b11"
}
!if (object_direction + 5) != $09c3 {
    !error "Assertion failed: object_direction + 5 == $09c3"
}
!if (object_direction + 6) != $09c4 {
    !error "Assertion failed: object_direction + 6 == $09c4"
}
!if (object_direction + 7) != $09c5 {
    !error "Assertion failed: object_direction + 7 == $09c5"
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
!if (object_spriteid + 5) != $09ad {
    !error "Assertion failed: object_spriteid + 5 == $09ad"
}
!if (object_spriteid + 6) != $09ae {
    !error "Assertion failed: object_spriteid + 6 == $09ae"
}
!if (object_spriteid + 7) != $09af {
    !error "Assertion failed: object_spriteid + 7 == $09af"
}
!if (object_spriteid_old + 2) != $09b5 {
    !error "Assertion failed: object_spriteid_old + 2 == $09b5"
}
!if (object_spriteid_old + 4) != $09b7 {
    !error "Assertion failed: object_spriteid_old + 4 == $09b7"
}
!if (object_spriteid_old + 6) != $09b9 {
    !error "Assertion failed: object_spriteid_old + 6 == $09b9"
}
!if (object_x_high + 6) != $096c {
    !error "Assertion failed: object_x_high + 6 == $096c"
}
!if (object_x_low + 5) != $0955 {
    !error "Assertion failed: object_x_low + 5 == $0955"
}
!if (object_x_low + 6) != $0956 {
    !error "Assertion failed: object_x_low + 6 == $0956"
}
!if (object_x_low + 7) != $0957 {
    !error "Assertion failed: object_x_low + 7 == $0957"
}
!if (object_x_low_old + 6) != $0961 {
    !error "Assertion failed: object_x_low_old + 6 == $0961"
}
!if (object_y_low + 2) != $097e {
    !error "Assertion failed: object_y_low + 2 == $097e"
}
!if (object_y_low + 3) != $097f {
    !error "Assertion failed: object_y_low + 3 == $097f"
}
!if (object_y_low + 4) != $0980 {
    !error "Assertion failed: object_y_low + 4 == $0980"
}
!if (object_y_low + 5) != $0981 {
    !error "Assertion failed: object_y_low + 5 == $0981"
}
!if (object_y_low + 6) != $0982 {
    !error "Assertion failed: object_y_low + 6 == $0982"
}
!if (object_y_low + 7) != $0983 {
    !error "Assertion failed: object_y_low + 7 == $0983"
}
!if (object_y_low_old + 6) != $098d {
    !error "Assertion failed: object_y_low_old + 6 == $098d"
}
!if (objectid_old_player) != $0b {
    !error "Assertion failed: objectid_old_player == $0b"
}
!if (room_0_data) != $3b4a {
    !error "Assertion failed: room_0_data == $3b4a"
}
!if (room_1_data) != $3c07 {
    !error "Assertion failed: room_1_data == $3c07"
}
!if (room_2_data) != $412e {
    !error "Assertion failed: room_2_data == $412e"
}
!if (room_3_data) != $44ac {
    !error "Assertion failed: room_3_data == $44ac"
}
!if (sprite_data - level_data) != $0af2 {
    !error "Assertion failed: sprite_data - level_data == $0af2"
}
