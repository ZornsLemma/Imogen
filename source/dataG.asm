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
l0955                                               = $0955
object_x_low_old                                    = $095b
object_x_high                                       = $0966
l0968                                               = $0968
object_x_high_old                                   = $0971
object_y_low                                        = $097c
l097e                                               = $097e
l0981                                               = $0981
object_y_low_old                                    = $0987
object_y_high                                       = $0992
l0994                                               = $0994
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
object_direction_old                                = $09c9
l09df                                               = $09df
level_progress_table                                = $09ef
l0a17                                               = $0a17
l0a18                                               = $0a18
l0a19                                               = $0a19
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
l38b0                                               = $38b0
l38b1                                               = $38b1
object_z_order                                      = $38c2
l38c4                                               = $38c4
l38c5                                               = $38c5
l38c6                                               = $38c6
l38c7                                               = $38c7
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
    !word sprite_data - level_data                                    ; 3ad5: d4 0a                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f2 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 0d 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
    !byte 2, 3                                                        ; 3add: 02 03
level_room_data_table
    !word room_0_data                                                 ; 3adf: 3d 3f                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: a4 42
    !word room_2_data                                                 ; 3ae3: 1a 3b
    !word room_3_data                                                 ; 3ae5: 02 3d

; *************************************************************************************
; 'BALLOONACY[0d]' EOR-encrypted with $cb
level_specific_password
    !byte $89, $8a, $87, $87, $84, $84, $85, $8a, $88, $92, $c6       ; 3ae7: 89 8a 87...

; *************************************************************************************
; 
; Level initialisation
; 
; This is called whenever a new room is entered.
; 
; *************************************************************************************
level_specific_initialisation
    lda current_level                                                 ; 3af2: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3af4: c5 51
    beq c3b0c                                                         ; 3af6: f0 14
    lda developer_flags                                               ; 3af8: ad 03 11
    bpl c3b02                                                         ; 3afb: 10 05
    lda #$ff                                                          ; 3afd: a9 ff
    sta l0a17                                                         ; 3aff: 8d 17 0a
c3b02
    lda l0a17                                                         ; 3b02: ad 17 0a
    beq c3b0c                                                         ; 3b05: f0 05
    lda #$cb                                                          ; 3b07: a9 cb
    jsr find_or_create_menu_slot_for_A                                ; 3b09: 20 bd 2b
c3b0c
    rts                                                               ; 3b0c: 60

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
    jsr sub_c3fd7                                                     ; 3b0d: 20 d7 3f
    jsr sub_c4331                                                     ; 3b10: 20 31 43
    jsr sub_c3bad                                                     ; 3b13: 20 ad 3b
    jsr sub_c3da9                                                     ; 3b16: 20 a9 3d
    rts                                                               ; 3b19: 60

; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 19                                                          ; 3b1a: 13                      ; initial player X cell
    !byte 22                                                          ; 3b1b: 16                      ; initial player Y cell

; ########################################
; ########################################
; ###   |                              ###
; ###   |                              ###
; ###   |                              ###
; ###   |                              ###
; ###   |                              ###
; ###   |                              ###
; ###   |   #####                      ###
; ###   |   #####                      ###
; ###   |     ###                      ###
; ###   |     ###                      ###
; ###   |     ###                      ###
; ###   |     ###                      ###
; ###   |     ###                      ###
; ###   |     ###                      ###
; ###   |     ###                      ###
;       |                      ###
;       |                      ###
;       |                      ###
;                        OOOOOO###
;                    P   OOOOOO###
; ########################################
; ########################################
; set ground fill tile to use
room_2_code
    lda #<ground_fill_2x2_top_left                                    ; 3b1c: a9 89
    sta source_sprite_memory_low                                      ; 3b1e: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3b20: a9 45
    sta source_sprite_memory_high                                     ; 3b22: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3b24: a2 00
    ldy #0                                                            ; 3b26: a0 00
    lda #$ff                                                          ; 3b28: a9 ff
    sta width_in_cells                                                ; 3b2a: 85 3c
    lda #2                                                            ; 3b2c: a9 02
    sta height_in_cells                                               ; 3b2e: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b30: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3b33: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3b35: 20 bb 1a
; draw 3x15 rectangle at (0,2)
    ldy #2                                                            ; 3b38: a0 02
    lda #3                                                            ; 3b3a: a9 03
    sta width_in_cells                                                ; 3b3c: 85 3c
    lda #$0f                                                          ; 3b3e: a9 0f
    sta height_in_cells                                               ; 3b40: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b42: 20 bb 1a
; draw 3x15 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3b45: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 3b47: 20 bb 1a
; draw 3x5 rectangle at (29,17)
    ldx #$1d                                                          ; 3b4a: a2 1d
    ldy #$11                                                          ; 3b4c: a0 11
    lda #5                                                            ; 3b4e: a9 05
    sta height_in_cells                                               ; 3b50: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b52: 20 bb 1a
; draw 3x9 rectangle at (12,8)
    ldx #$0c                                                          ; 3b55: a2 0c
    ldy #8                                                            ; 3b57: a0 08
    lda #9                                                            ; 3b59: a9 09
    sta height_in_cells                                               ; 3b5b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b5d: 20 bb 1a
; draw 2x2 rectangle at (10,8)
    ldx #$0a                                                          ; 3b60: a2 0a
    lda #2                                                            ; 3b62: a9 02
    sta width_in_cells                                                ; 3b64: 85 3c
    sta height_in_cells                                               ; 3b66: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b68: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3b6b: 20 90 1b
; draw sprite $d8 at (23,20) of size (3x2)
    lda #3                                                            ; 3b6e: a9 03
    sta width_in_cells                                                ; 3b70: 85 3c
    lda #2                                                            ; 3b72: a9 02
    sta height_in_cells                                               ; 3b74: 85 3d
    ldx #$17                                                          ; 3b76: a2 17
    ldy #$14                                                          ; 3b78: a0 14
    lda #$d8                                                          ; 3b7a: a9 d8
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3b7c: 20 57 1f
; draw sprite $d8 at (26,20) of size (3x2)
    ldx #$1a                                                          ; 3b7f: a2 1a
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3b81: 20 57 1f
; draw rope at (6,2) length 18
    ldx #6                                                            ; 3b84: a2 06
    ldy #2                                                            ; 3b86: a0 02
    lda #$12                                                          ; 3b88: a9 12
    jsr draw_rope                                                     ; 3b8a: 20 b9 1d
    jsr start_room                                                    ; 3b8d: 20 bb 12
room_2_game_update_loop
    jsr game_update                                                   ; 3b90: 20 da 12
    sta room_exit_direction                                           ; 3b93: 85 70
    and #exit_room_left                                               ; 3b95: 29 01
    beq room_2_check_right_exit                                       ; 3b97: f0 07
    ldx #1                                                            ; 3b99: a2 01
    ldy current_level                                                 ; 3b9b: a4 31
    jmp initialise_level_and_room                                     ; 3b9d: 4c 40 11

room_2_check_right_exit
    lda room_exit_direction                                           ; 3ba0: a5 70
    and #exit_room_right                                              ; 3ba2: 29 04
    beq room_2_game_update_loop                                       ; 3ba4: f0 ea
    ldx #3                                                            ; 3ba6: a2 03
    ldy current_level                                                 ; 3ba8: a4 31
    jmp initialise_level_and_room                                     ; 3baa: 4c 40 11

sub_c3bad
    lda #2                                                            ; 3bad: a9 02
    sta currently_updating_logic_for_room_index                       ; 3baf: 8d ba 1a
    lda #6                                                            ; 3bb2: a9 06
    ldx #$0f                                                          ; 3bb4: a2 0f
    ldy #$0c                                                          ; 3bb6: a0 0c
    jsr update_brazier_and_fire                                       ; 3bb8: 20 88 19
    lda update_room_first_update_flag                                 ; 3bbb: ad 2b 13
    beq c3bfe                                                         ; 3bbe: f0 3e
    ldx #$0b                                                          ; 3bc0: a2 0b
    ldy #$45 ; 'E'                                                    ; 3bc2: a0 45
    jsr define_envelope                                               ; 3bc4: 20 5e 39
    lda current_level                                                 ; 3bc7: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3bc9: c5 51
    beq c3bd7                                                         ; 3bcb: f0 0a
    lda l0a18                                                         ; 3bcd: ad 18 0a
    beq c3bd7                                                         ; 3bd0: f0 05
    lda #$ff                                                          ; 3bd2: a9 ff
    sta l0a18                                                         ; 3bd4: 8d 18 0a
c3bd7
    lda desired_room_index                                            ; 3bd7: a5 30
    cmp #2                                                            ; 3bd9: c9 02
    bne c3bf8                                                         ; 3bdb: d0 1b
    ldx #$29 ; ')'                                                    ; 3bdd: a2 29
    ldy #$45 ; 'E'                                                    ; 3bdf: a0 45
    jsr define_envelope                                               ; 3be1: 20 5e 39
    lda #$cf                                                          ; 3be4: a9 cf
    sta l38b0                                                         ; 3be6: 8d b0 38
    lda #$c0                                                          ; 3be9: a9 c0
    sta l38c6                                                         ; 3beb: 8d c6 38
    lda #$bf                                                          ; 3bee: a9 bf
    sta l38c5                                                         ; 3bf0: 8d c5 38
    lda #$ce                                                          ; 3bf3: a9 ce
    sta l09ad                                                         ; 3bf5: 8d ad 09
c3bf8
    jmp c3c86                                                         ; 3bf8: 4c 86 3c

c3bfb
    jmp c3d00                                                         ; 3bfb: 4c 00 3d

c3bfe
    lda l0a18                                                         ; 3bfe: ad 18 0a
    bmi c3bfb                                                         ; 3c01: 30 f8
    cmp #9                                                            ; 3c03: c9 09
    bcs c3c35                                                         ; 3c05: b0 2e
    cmp #1                                                            ; 3c07: c9 01
    beq c3c30                                                         ; 3c09: f0 25
    lda desired_room_index                                            ; 3c0b: a5 30
    cmp #2                                                            ; 3c0d: c9 02
    bne c3bfb                                                         ; 3c0f: d0 ea
    ldx #2                                                            ; 3c11: a2 02
    ldy #3                                                            ; 3c13: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 3c15: 20 e2 28
    beq c3bfb                                                         ; 3c18: f0 e1
    inc l0a18                                                         ; 3c1a: ee 18 0a
    lda #0                                                            ; 3c1d: a9 00
    ldx #$3f ; '?'                                                    ; 3c1f: a2 3f
    ldy #$45 ; 'E'                                                    ; 3c21: a0 45
    jsr play_sound_yx                                                 ; 3c23: 20 f6 38
    ldx #$37 ; '7'                                                    ; 3c26: a2 37
    ldy #$45 ; 'E'                                                    ; 3c28: a0 45
    jsr play_sound_yx                                                 ; 3c2a: 20 f6 38
    jmp c3c86                                                         ; 3c2d: 4c 86 3c

c3c30
    lda #9                                                            ; 3c30: a9 09
    sta l0a18                                                         ; 3c32: 8d 18 0a
c3c35
    ldy l0a18                                                         ; 3c35: ac 18 0a
    sty l3d01                                                         ; 3c38: 8c 01 3d
    cpy #$12                                                          ; 3c3b: c0 12
    bcc c3c47                                                         ; 3c3d: 90 08
    lda #$ff                                                          ; 3c3f: a9 ff
    sta l0a18                                                         ; 3c41: 8d 18 0a
    jmp c3c86                                                         ; 3c44: 4c 86 3c

c3c47
    iny                                                               ; 3c47: c8
    sty l0a18                                                         ; 3c48: 8c 18 0a
    cpy #$12                                                          ; 3c4b: c0 12
    bcc c3c65                                                         ; 3c4d: 90 16
    lda desired_room_index                                            ; 3c4f: a5 30
    cmp #2                                                            ; 3c51: c9 02
    bne c3c65                                                         ; 3c53: d0 10
    lda #0                                                            ; 3c55: a9 00
    ldx #$21 ; '!'                                                    ; 3c57: a2 21
    ldy #$45 ; 'E'                                                    ; 3c59: a0 45
    jsr play_sound_yx                                                 ; 3c5b: 20 f6 38
    ldx #$19                                                          ; 3c5e: a2 19
    ldy #$45 ; 'E'                                                    ; 3c60: a0 45
    jsr play_sound_yx                                                 ; 3c62: 20 f6 38
c3c65
    lda desired_room_index                                            ; 3c65: a5 30
    cmp #2                                                            ; 3c67: c9 02
    bne c3bfb                                                         ; 3c69: d0 90
    ldx #$1a                                                          ; 3c6b: a2 1a
    ldy l3d01                                                         ; 3c6d: ac 01 3d
    lda #3                                                            ; 3c70: a9 03
    sta width_in_cells                                                ; 3c72: 85 3c
    lda #2                                                            ; 3c74: a9 02
    sta height_in_cells                                               ; 3c76: 85 3d
    lda #collision_map_none                                           ; 3c78: a9 00
    sta value_to_write_to_collision_map                               ; 3c7a: 85 3e
    jsr read_collision_map_value_for_xy                               ; 3c7c: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3c7f: c5 3e
    beq c3c86                                                         ; 3c81: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3c83: 20 44 1e
c3c86
    lda desired_room_index                                            ; 3c86: a5 30
    cmp #2                                                            ; 3c88: c9 02
    bne c3d00                                                         ; 3c8a: d0 74
    lda l0a18                                                         ; 3c8c: ad 18 0a
    bmi c3cc5                                                         ; 3c8f: 30 34
    cmp #9                                                            ; 3c91: c9 09
    bcs c3cb7                                                         ; 3c93: b0 22
    cmp #1                                                            ; 3c95: c9 01
    beq c3ca8                                                         ; 3c97: f0 0f
    lda #$c8                                                          ; 3c99: a9 c8
    sta l09ab                                                         ; 3c9b: 8d ab 09
    lda #$d0                                                          ; 3c9e: a9 d0
    sta l09ac                                                         ; 3ca0: 8d ac 09
    ldy #9                                                            ; 3ca3: a0 09
    jmp c3cd1                                                         ; 3ca5: 4c d1 3c

c3ca8
    lda #$d3                                                          ; 3ca8: a9 d3
    sta l09ab                                                         ; 3caa: 8d ab 09
    lda #$d1                                                          ; 3cad: a9 d1
    sta l09ac                                                         ; 3caf: 8d ac 09
    ldy #9                                                            ; 3cb2: a0 09
    jmp c3cd1                                                         ; 3cb4: 4c d1 3c

c3cb7
    tay                                                               ; 3cb7: a8
    lda #0                                                            ; 3cb8: a9 00
    sta l09ab                                                         ; 3cba: 8d ab 09
    lda #$d1                                                          ; 3cbd: a9 d1
    sta l09ac                                                         ; 3cbf: 8d ac 09
    jmp c3cd1                                                         ; 3cc2: 4c d1 3c

c3cc5
    lda #0                                                            ; 3cc5: a9 00
    sta l09ab                                                         ; 3cc7: 8d ab 09
    lda #$d2                                                          ; 3cca: a9 d2
    sta l09ac                                                         ; 3ccc: 8d ac 09
    ldy #$12                                                          ; 3ccf: a0 12
c3cd1
    ldx #$1a                                                          ; 3cd1: a2 1a
    lda #5                                                            ; 3cd3: a9 05
    jsr set_object_position_from_cell_xy                              ; 3cd5: 20 5d 1f
    lda #4                                                            ; 3cd8: a9 04
    jsr set_object_position_from_cell_xy                              ; 3cda: 20 5d 1f
    lda #8                                                            ; 3cdd: a9 08
    sta temp_sprite_x_offset                                          ; 3cdf: 85 3a
    lda #$f4                                                          ; 3ce1: a9 f4
    sta temp_sprite_y_offset                                          ; 3ce3: 85 3b
    lda #3                                                            ; 3ce5: a9 03
    jsr set_object_position_from_cell_xy                              ; 3ce7: 20 5d 1f
    lda #3                                                            ; 3cea: a9 03
    sta width_in_cells                                                ; 3cec: 85 3c
    lda #2                                                            ; 3cee: a9 02
    sta height_in_cells                                               ; 3cf0: 85 3d
    lda #collision_map_solid_rock                                     ; 3cf2: a9 03
    sta value_to_write_to_collision_map                               ; 3cf4: 85 3e
    jsr read_collision_map_value_for_xy                               ; 3cf6: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3cf9: c5 3e
    beq c3d00                                                         ; 3cfb: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3cfd: 20 44 1e
c3d00
    rts                                                               ; 3d00: 60

l3d01
    !byte 0                                                           ; 3d01: 00
; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 20                                                          ; 3d02: 14                      ; initial player X cell
    !byte 22                                                          ; 3d03: 16                      ; initial player Y cell

; ########################################
; ########################################
; ###   |         |                    ###
; ###   |         |                    ###
; ###   |         |                    ###
; ###   |         |                    ###
; ###   |         |                    ###
; ###   |         |                    ###
; ###   |         |   ####################
; ###   |         |   ####################
; ###   |                     |        ###
; ###   |                     |        ###
; ###   |                     |        ###
; ###                         |        ###
; ###                         |        ###
; ########       ##########   |   ########
; ########       ##########   |   ########
;                             |        ###
;                             |        ###
;                             |        ###
;                                      ###
;                     P                ###
; ########################################
; ########################################
; set ground fill tile to use
room_3_code
    lda #<ground_fill_2x2_top_left                                    ; 3d04: a9 89
    sta source_sprite_memory_low                                      ; 3d06: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3d08: a9 45
    sta source_sprite_memory_high                                     ; 3d0a: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3d0c: a2 00
    ldy #0                                                            ; 3d0e: a0 00
    lda #$ff                                                          ; 3d10: a9 ff
    sta width_in_cells                                                ; 3d12: 85 3c
    lda #2                                                            ; 3d14: a9 02
    sta height_in_cells                                               ; 3d16: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d18: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3d1b: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3d1d: 20 bb 1a
; draw 3x15 rectangle at (0,2)
    ldy #2                                                            ; 3d20: a0 02
    lda #3                                                            ; 3d22: a9 03
    sta width_in_cells                                                ; 3d24: 85 3c
    lda #$0f                                                          ; 3d26: a9 0f
    sta height_in_cells                                               ; 3d28: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d2a: 20 bb 1a
; draw 3x20 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3d2d: a2 25
    lda #$14                                                          ; 3d2f: a9 14
    sta height_in_cells                                               ; 3d31: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d33: 20 bb 1a
; draw 17x2 rectangle at (20,8)
    ldx #$14                                                          ; 3d36: a2 14
    ldy #8                                                            ; 3d38: a0 08
    lda #$11                                                          ; 3d3a: a9 11
    sta width_in_cells                                                ; 3d3c: 85 3c
    lda #2                                                            ; 3d3e: a9 02
    sta height_in_cells                                               ; 3d40: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d42: 20 bb 1a
; draw 5x2 rectangle at (3,15)
    ldx #3                                                            ; 3d45: a2 03
    ldy #$0f                                                          ; 3d47: a0 0f
    lda #5                                                            ; 3d49: a9 05
    sta width_in_cells                                                ; 3d4b: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3d4d: 20 bb 1a
; draw 5x2 rectangle at (32,15)
    ldx #$20 ; ' '                                                    ; 3d50: a2 20
    jsr copy_rectangle_of_memory_to_screen                            ; 3d52: 20 bb 1a
; draw 10x2 rectangle at (15,15)
    ldx #$0f                                                          ; 3d55: a2 0f
    lda #$0a                                                          ; 3d57: a9 0a
    sta width_in_cells                                                ; 3d59: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3d5b: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3d5e: 20 90 1b
; draw rope at (6,2) length 11
    ldx #6                                                            ; 3d61: a2 06
    ldy #2                                                            ; 3d63: a0 02
    lda #$0b                                                          ; 3d65: a9 0b
    jsr draw_rope                                                     ; 3d67: 20 b9 1d
; draw rope at (16,2) length 8
    ldx #$10                                                          ; 3d6a: a2 10
    lda #8                                                            ; 3d6c: a9 08
    jsr draw_rope                                                     ; 3d6e: 20 b9 1d
; draw rope at (28,10) length 10
    ldx #$1c                                                          ; 3d71: a2 1c
    ldy #$0a                                                          ; 3d73: a0 0a
    lda #$0a                                                          ; 3d75: a9 0a
    jsr draw_rope                                                     ; 3d77: 20 b9 1d
    jsr start_room                                                    ; 3d7a: 20 bb 12
room_3_game_update_loop
    jsr game_update                                                   ; 3d7d: 20 da 12
    and #exit_room_left                                               ; 3d80: 29 01
    beq room_3_game_update_loop                                       ; 3d82: f0 f9
    ldx #2                                                            ; 3d84: a2 02
    ldy current_level                                                 ; 3d86: a4 31
    jmp initialise_level_and_room                                     ; 3d88: 4c 40 11

l3d8b
    !byte   0, $d4,   0,   0, $d9,   0, $d9,   0, $d9,   0, $d9,   0  ; 3d8b: 00 d4 00...
    !byte $d9,   0, $d9,   0, $d9,   0, $d9,   0,   0, $d5,   0,   0  ; 3d97: d9 00 d9...
    !byte $d6,   8,   0, $d7,   0,   0                                ; 3da3: d6 08 00...

sub_c3da9
    lda #3                                                            ; 3da9: a9 03
    sta currently_updating_logic_for_room_index                       ; 3dab: 8d ba 1a
    lda #6                                                            ; 3dae: a9 06
    ldx #$22 ; '"'                                                    ; 3db0: a2 22
    ldy #8                                                            ; 3db2: a0 08
    jsr update_level_completion                                       ; 3db4: 20 10 1a
    lda update_room_first_update_flag                                 ; 3db7: ad 2b 13
    beq c3def                                                         ; 3dba: f0 33
    lda current_level                                                 ; 3dbc: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3dbe: c5 51
    beq c3dd5                                                         ; 3dc0: f0 13
    ldy #1                                                            ; 3dc2: a0 01
    lda l0a19                                                         ; 3dc4: ad 19 0a
    beq c3dcf                                                         ; 3dc7: f0 06
    cmp #1                                                            ; 3dc9: c9 01
    beq c3dcf                                                         ; 3dcb: f0 02
    ldy #$1b                                                          ; 3dcd: a0 1b
c3dcf
    sty l0a19                                                         ; 3dcf: 8c 19 0a
    sty l0a79                                                         ; 3dd2: 8c 79 0a
c3dd5
    lda desired_room_index                                            ; 3dd5: a5 30
    cmp #3                                                            ; 3dd7: c9 03
    bne c3dec                                                         ; 3dd9: d0 11
    ldx #$47 ; 'G'                                                    ; 3ddb: a2 47
    ldy #$45 ; 'E'                                                    ; 3ddd: a0 45
    jsr define_envelope                                               ; 3ddf: 20 5e 39
    lda #$cf                                                          ; 3de2: a9 cf
    sta l38b1                                                         ; 3de4: 8d b1 38
    lda #$58 ; 'X'                                                    ; 3de7: a9 58
    sta l0955                                                         ; 3de9: 8d 55 09
c3dec
    jmp c3eb5                                                         ; 3dec: 4c b5 3e

c3def
    lda l0a79                                                         ; 3def: ad 79 0a
    clc                                                               ; 3df2: 18
    adc #2                                                            ; 3df3: 69 02
    tay                                                               ; 3df5: a8
    lda l3d8b,y                                                       ; 3df6: b9 8b 3d
    cmp #0                                                            ; 3df9: c9 00
    bne c3e00                                                         ; 3dfb: d0 03
    ldy l0a19                                                         ; 3dfd: ac 19 0a
c3e00
    lda l0a19                                                         ; 3e00: ad 19 0a
    cmp #1                                                            ; 3e03: c9 01
    beq c3e0e                                                         ; 3e05: f0 07
    cmp #$18                                                          ; 3e07: c9 18
    beq c3e6d                                                         ; 3e09: f0 62
    jmp c3e92                                                         ; 3e0b: 4c 92 3e

c3e0e
    lda desired_room_index                                            ; 3e0e: a5 30
    cmp #3                                                            ; 3e10: c9 03
    bne c3e47                                                         ; 3e12: d0 33
    ldx #5                                                            ; 3e14: a2 05
    sty l3f3c                                                         ; 3e16: 8c 3c 3f
    ldy #2                                                            ; 3e19: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 3e1b: 20 e2 28
    ldy l3f3c                                                         ; 3e1e: ac 3c 3f
    ora #0                                                            ; 3e21: 09 00
    beq c3e47                                                         ; 3e23: f0 22
    lda #0                                                            ; 3e25: a9 00
    ldx #$55 ; 'U'                                                    ; 3e27: a2 55
    ldy #$45 ; 'E'                                                    ; 3e29: a0 45
    jsr play_sound_yx                                                 ; 3e2b: 20 f6 38
    lda #0                                                            ; 3e2e: a9 00
    sta l09aa                                                         ; 3e30: 8d aa 09
    lda #$ff                                                          ; 3e33: a9 ff
    sta l0a17                                                         ; 3e35: 8d 17 0a
    lda #$60 ; '`'                                                    ; 3e38: a9 60
    sta l0a7a                                                         ; 3e3a: 8d 7a 0a
    ldy #$15                                                          ; 3e3d: a0 15
    lda #$18                                                          ; 3e3f: a9 18
    sta l0a19                                                         ; 3e41: 8d 19 0a
    jmp c3ea7                                                         ; 3e44: 4c a7 3e

c3e47
    lda desired_room_index                                            ; 3e47: a5 30
    cmp #3                                                            ; 3e49: c9 03
    bne c3ea7                                                         ; 3e4b: d0 5a
    lda #8                                                            ; 3e4d: a9 08
    sta temp_top_offset                                               ; 3e4f: 8d 50 25
    ldx #5                                                            ; 3e52: a2 05
    sty l3f3c                                                         ; 3e54: 8c 3c 3f
    ldy #0                                                            ; 3e57: a0 00
    jsr test_for_collision_between_objects_x_and_y                    ; 3e59: 20 e2 28
    ldy l3f3c                                                         ; 3e5c: ac 3c 3f
    ora #0                                                            ; 3e5f: 09 00
    beq c3ea7                                                         ; 3e61: f0 44
    lda #6                                                            ; 3e63: a9 06
    sta player_wall_collision_flag                                    ; 3e65: 8d 33 24
    ldy #4                                                            ; 3e68: a0 04
    jmp c3ea7                                                         ; 3e6a: 4c a7 3e

c3e6d
    lda l0a7a                                                         ; 3e6d: ad 7a 0a
    cmp #$98                                                          ; 3e70: c9 98
    bcc c3ea7                                                         ; 3e72: 90 33
    lda desired_room_index                                            ; 3e74: a5 30
    cmp #3                                                            ; 3e76: c9 03
    bne c3e8a                                                         ; 3e78: d0 10
    lda #$40 ; '@'                                                    ; 3e7a: a9 40
    ldx #$21 ; '!'                                                    ; 3e7c: a2 21
    ldy #$45 ; 'E'                                                    ; 3e7e: a0 45
    jsr play_sound_yx                                                 ; 3e80: 20 f6 38
    ldx #$19                                                          ; 3e83: a2 19
    ldy #$45 ; 'E'                                                    ; 3e85: a0 45
    jsr play_sound_yx                                                 ; 3e87: 20 f6 38
c3e8a
    ldy #$1b                                                          ; 3e8a: a0 1b
    sty l0a19                                                         ; 3e8c: 8c 19 0a
    jmp c3ea7                                                         ; 3e8f: 4c a7 3e

c3e92
    lda desired_room_index                                            ; 3e92: a5 30
    cmp #3                                                            ; 3e94: c9 03
    bne c3ea7                                                         ; 3e96: d0 0f
    lda sound_priority_per_channel_table                              ; 3e98: ad 6f 39
    cmp #$41 ; 'A'                                                    ; 3e9b: c9 41
    bcs c3ea7                                                         ; 3e9d: b0 08
    lda #0                                                            ; 3e9f: a9 00
    sta sound_priority_per_channel_table                              ; 3ea1: 8d 6f 39
    sta l3970                                                         ; 3ea4: 8d 70 39
c3ea7
    sty l0a79                                                         ; 3ea7: 8c 79 0a
    iny                                                               ; 3eaa: c8
    lda l3d8b,y                                                       ; 3eab: b9 8b 3d
    clc                                                               ; 3eae: 18
    adc l0a7a                                                         ; 3eaf: 6d 7a 0a
    sta l0a7a                                                         ; 3eb2: 8d 7a 0a
c3eb5
    lda desired_room_index                                            ; 3eb5: a5 30
    cmp #3                                                            ; 3eb7: c9 03
    bne c3f0c                                                         ; 3eb9: d0 51
    ldy l0a79                                                         ; 3ebb: ac 79 0a
    lda l3d8b,y                                                       ; 3ebe: b9 8b 3d
    sta l09ad                                                         ; 3ec1: 8d ad 09
    lda l0a19                                                         ; 3ec4: ad 19 0a
    cmp #$1b                                                          ; 3ec7: c9 1b
    beq c3ee8                                                         ; 3ec9: f0 1d
    lda #$a0                                                          ; 3ecb: a9 a0
    sta l38c7                                                         ; 3ecd: 8d c7 38
    lda l0a19                                                         ; 3ed0: ad 19 0a
    cmp #1                                                            ; 3ed3: c9 01
    bne c3edf                                                         ; 3ed5: d0 08
    lda #$60 ; '`'                                                    ; 3ed7: a9 60
    sta l0981                                                         ; 3ed9: 8d 81 09
    jmp c3f0c                                                         ; 3edc: 4c 0c 3f

c3edf
    lda l0a7a                                                         ; 3edf: ad 7a 0a
    sta l0981                                                         ; 3ee2: 8d 81 09
    jmp c3f0c                                                         ; 3ee5: 4c 0c 3f

c3ee8
    lda #$e0                                                          ; 3ee8: a9 e0
    sta l38c7                                                         ; 3eea: 8d c7 38
    lda #$b0                                                          ; 3eed: a9 b0
    sta l0981                                                         ; 3eef: 8d 81 09
    ldx #9                                                            ; 3ef2: a2 09
    ldy #$15                                                          ; 3ef4: a0 15
    lda #3                                                            ; 3ef6: a9 03
    sta width_in_cells                                                ; 3ef8: 85 3c
    lda #1                                                            ; 3efa: a9 01
    sta height_in_cells                                               ; 3efc: 85 3d
    lda #collision_map_solid_rock                                     ; 3efe: a9 03
    sta value_to_write_to_collision_map                               ; 3f00: 85 3e
    jsr read_collision_map_value_for_xy                               ; 3f02: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 3f05: c5 3e
    beq c3f0c                                                         ; 3f07: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3f09: 20 44 1e
c3f0c
    lda #3                                                            ; 3f0c: a9 03
    sta currently_updating_logic_for_room_index                       ; 3f0e: 8d ba 1a
    lda #3                                                            ; 3f11: a9 03
    sta l44ab                                                         ; 3f13: 8d ab 44
    lda #4                                                            ; 3f16: a9 04
    sta l44ac                                                         ; 3f18: 8d ac 44
    ldy #$60 ; '`'                                                    ; 3f1b: a0 60
    lda l0a19                                                         ; 3f1d: ad 19 0a
    cmp #1                                                            ; 3f20: c9 01
    beq c3f2d                                                         ; 3f22: f0 09
    lda l0a79                                                         ; 3f24: ad 79 0a
    cmp #$15                                                          ; 3f27: c9 15
    beq c3f2d                                                         ; 3f29: f0 02
    ldy #$20 ; ' '                                                    ; 3f2b: a0 20
c3f2d
    sty l44aa                                                         ; 3f2d: 8c aa 44
    ldx #$0b                                                          ; 3f30: a2 0b
    ldy l0a77                                                         ; 3f32: ac 77 0a
    jsr sub_c4366                                                     ; 3f35: 20 66 43
    sty l0a77                                                         ; 3f38: 8c 77 0a
    rts                                                               ; 3f3b: 60

l3f3c
    !byte 0                                                           ; 3f3c: 00
; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 20                                                          ; 3f3d: 14                      ; initial player X cell
    !byte 22                                                          ; 3f3e: 16                      ; initial player Y cell

; ########################################
; ########################################
; ###              |               |   ###
; ###              |               |   ###
; ###              |               |   ###
; ###              |               |   ###
; ###OOO           |               |   ###
; ###OOO           |               |   ###
; ##############   |        ####   |   ###
; ##############   |        ####   |   ###
; ###   |          |               |   ###
; ###   |          |               |   ###
; ###   |          |               |   ###
; ###   |          |                   ###
; ###   |          |                   ###
; ###   |   ####            ##############
; ###   |   ####            ##############
; ###   |
; ###   |
; ###   |
; ###
; ###                 P
; ########################################
; ########################################
; set ground fill tile to use
room_0_code
    lda #<ground_fill_2x2_top_left                                    ; 3f3f: a9 89
    sta source_sprite_memory_low                                      ; 3f41: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 3f43: a9 45
    sta source_sprite_memory_high                                     ; 3f45: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 3f47: a2 00
    ldy #0                                                            ; 3f49: a0 00
    lda #$ff                                                          ; 3f4b: a9 ff
    sta width_in_cells                                                ; 3f4d: 85 3c
    lda #2                                                            ; 3f4f: a9 02
    sta height_in_cells                                               ; 3f51: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f53: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 3f56: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 3f58: 20 bb 1a
; draw 3x20 rectangle at (0,2)
    ldy #2                                                            ; 3f5b: a0 02
    lda #3                                                            ; 3f5d: a9 03
    sta width_in_cells                                                ; 3f5f: 85 3c
    lda #$14                                                          ; 3f61: a9 14
    sta height_in_cells                                               ; 3f63: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f65: 20 bb 1a
; draw 3x15 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 3f68: a2 25
    lda #$0f                                                          ; 3f6a: a9 0f
    sta height_in_cells                                               ; 3f6c: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f6e: 20 bb 1a
; draw 11x2 rectangle at (3,8)
    ldx #3                                                            ; 3f71: a2 03
    ldy #8                                                            ; 3f73: a0 08
    lda #$0b                                                          ; 3f75: a9 0b
    sta width_in_cells                                                ; 3f77: 85 3c
    lda #2                                                            ; 3f79: a9 02
    sta height_in_cells                                               ; 3f7b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3f7d: 20 bb 1a
; draw 11x2 rectangle at (26,15)
    ldx #$1a                                                          ; 3f80: a2 1a
    ldy #$0f                                                          ; 3f82: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3f84: 20 bb 1a
; draw 4x2 rectangle at (10,15)
    ldx #$0a                                                          ; 3f87: a2 0a
    lda #4                                                            ; 3f89: a9 04
    sta width_in_cells                                                ; 3f8b: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3f8d: 20 bb 1a
; draw 4x2 rectangle at (26,8)
    ldx #$1a                                                          ; 3f90: a2 1a
    ldy #8                                                            ; 3f92: a0 08
    jsr copy_rectangle_of_memory_to_screen                            ; 3f94: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3f97: 20 90 1b
; draw sprite $ce at (3,6) of size (3x2)
    lda #3                                                            ; 3f9a: a9 03
    sta width_in_cells                                                ; 3f9c: 85 3c
    lda #2                                                            ; 3f9e: a9 02
    sta height_in_cells                                               ; 3fa0: 85 3d
    ldx #3                                                            ; 3fa2: a2 03
    ldy #6                                                            ; 3fa4: a0 06
    lda #$ce                                                          ; 3fa6: a9 ce
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3fa8: 20 57 1f
; draw rope at (6,10) length 10
    ldx #6                                                            ; 3fab: a2 06
    ldy #$0a                                                          ; 3fad: a0 0a
    lda #$0a                                                          ; 3faf: a9 0a
    jsr draw_rope                                                     ; 3fb1: 20 b9 1d
; draw rope at (17,2) length 13
    ldx #$11                                                          ; 3fb4: a2 11
    ldy #2                                                            ; 3fb6: a0 02
    lda #$0d                                                          ; 3fb8: a9 0d
    jsr draw_rope                                                     ; 3fba: 20 b9 1d
; draw rope at (33,2) length 11
    ldx #$21 ; '!'                                                    ; 3fbd: a2 21
    ldy #2                                                            ; 3fbf: a0 02
    lda #$0b                                                          ; 3fc1: a9 0b
    jsr draw_rope                                                     ; 3fc3: 20 b9 1d
    jsr start_room                                                    ; 3fc6: 20 bb 12
room_0_game_update_loop
    jsr game_update                                                   ; 3fc9: 20 da 12
    and #exit_room_right                                              ; 3fcc: 29 04
    beq room_0_game_update_loop                                       ; 3fce: f0 f9
    ldx #1                                                            ; 3fd0: a2 01
    ldy current_level                                                 ; 3fd2: a4 31
    jmp initialise_level_and_room                                     ; 3fd4: 4c 40 11

sub_c3fd7
    lda #0                                                            ; 3fd7: a9 00
    sta currently_updating_logic_for_room_index                       ; 3fd9: 8d ba 1a
    lda #3                                                            ; 3fdc: a9 03
    ldx #$25 ; '%'                                                    ; 3fde: a2 25
    ldy #$0d                                                          ; 3fe0: a0 0d
    lda #5                                                            ; 3fe2: a9 05
    sta l44ab                                                         ; 3fe4: 8d ab 44
    lda #6                                                            ; 3fe7: a9 06
    sta l44ac                                                         ; 3fe9: 8d ac 44
    lda #$20 ; ' '                                                    ; 3fec: a9 20
    sta l44aa                                                         ; 3fee: 8d aa 44
    ldx #$16                                                          ; 3ff1: a2 16
    ldy l0a78                                                         ; 3ff3: ac 78 0a
    jsr sub_c4366                                                     ; 3ff6: 20 66 43
    sty l0a78                                                         ; 3ff9: 8c 78 0a
    lda update_room_first_update_flag                                 ; 3ffc: ad 2b 13
    bne c4004                                                         ; 3fff: d0 03
    jmp c4091                                                         ; 4001: 4c 91 40

c4004
    lda #$cb                                                          ; 4004: a9 cb
    sta toolbar_collectable_spriteids+1                               ; 4006: 8d e9 2e
    lda #$ca                                                          ; 4009: a9 ca
    sta collectable_spriteids+1                                       ; 400b: 8d ee 2e
    sta five_byte_table_paired_with_collectable_sprite_ids + 1        ; 400e: 8d f3 2e
    ldx #$f5                                                          ; 4011: a2 f5
    ldy #$44 ; 'D'                                                    ; 4013: a0 44
    jsr define_envelope                                               ; 4015: 20 5e 39
    ldx #$5d ; ']'                                                    ; 4018: a2 5d
    ldy #$45 ; 'E'                                                    ; 401a: a0 45
    jsr define_envelope                                               ; 401c: 20 5e 39
    ldx #$73 ; 's'                                                    ; 401f: a2 73
    ldy #$45 ; 'E'                                                    ; 4021: a0 45
    jsr define_envelope                                               ; 4023: 20 5e 39
    lda current_level                                                 ; 4026: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 4028: c5 51
    beq c4036                                                         ; 402a: f0 0a
    lda l0a17                                                         ; 402c: ad 17 0a
    beq c4036                                                         ; 402f: f0 05
    lda #$ff                                                          ; 4031: a9 ff
    sta l0a17                                                         ; 4033: 8d 17 0a
c4036
    lda #$cd                                                          ; 4036: a9 cd
    sta l38ae                                                         ; 4038: 8d ae 38
    lda #0                                                            ; 403b: a9 00
    sta l0994                                                         ; 403d: 8d 94 09
    lda l0a17                                                         ; 4040: ad 17 0a
    bne c405e                                                         ; 4043: d0 19
    lda desired_room_index                                            ; 4045: a5 30
    cmp #0                                                            ; 4047: c9 00
    bne c405d                                                         ; 4049: d0 12
    ldx #4                                                            ; 404b: a2 04
    ldy #5                                                            ; 404d: a0 05
    lda #$ff                                                          ; 404f: a9 ff
    sta temp_sprite_y_offset                                          ; 4051: 85 3b
    lda #2                                                            ; 4053: a9 02
    jsr set_object_position_from_cell_xy                              ; 4055: 20 5d 1f
    lda #$ca                                                          ; 4058: a9 ca
    sta l09aa                                                         ; 405a: 8d aa 09
c405d
    rts                                                               ; 405d: 60

c405e
    cmp #$ff                                                          ; 405e: c9 ff
    beq c4086                                                         ; 4060: f0 24
    lda desired_room_index                                            ; 4062: a5 30
    cmp l0a73                                                         ; 4064: cd 73 0a
    bne c4086                                                         ; 4067: d0 1d
    jsr sub_c4259                                                     ; 4069: 20 59 42
loop_c406c
    lda desired_room_index                                            ; 406c: a5 30
    cmp l0a73                                                         ; 406e: cd 73 0a
    bne c4086                                                         ; 4071: d0 13
    lda l0a74                                                         ; 4073: ad 74 0a
    beq c4086                                                         ; 4076: f0 0e
    dec l0a74                                                         ; 4078: ce 74 0a
    ldx #2                                                            ; 407b: a2 02
    jsr l20f7                                                         ; 407d: 20 f7 20
    jsr sub_c418a                                                     ; 4080: 20 8a 41
    jmp loop_c406c                                                    ; 4083: 4c 6c 40

c4086
    lda #0                                                            ; 4086: a9 00
    sta l09b5                                                         ; 4088: 8d b5 09
c408b
    jmp c4186                                                         ; 408b: 4c 86 41

c408e
    jmp c417e                                                         ; 408e: 4c 7e 41

c4091
    lda l0a17                                                         ; 4091: ad 17 0a
    bne c40b5                                                         ; 4094: d0 1f
    lda desired_room_index                                            ; 4096: a5 30
    cmp #0                                                            ; 4098: c9 00
    bne c408b                                                         ; 409a: d0 ef
    ldx #$0b                                                          ; 409c: a2 0b
    ldy #2                                                            ; 409e: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 40a0: 20 e2 28
    beq c408b                                                         ; 40a3: f0 e6
    lda #$cb                                                          ; 40a5: a9 cb
    jsr find_or_create_menu_slot_for_A                                ; 40a7: 20 bd 2b
    lda #0                                                            ; 40aa: a9 00
    sta l09aa                                                         ; 40ac: 8d aa 09
    dec l0a17                                                         ; 40af: ce 17 0a
    jmp c4186                                                         ; 40b2: 4c 86 41

c40b5
    lda #0                                                            ; 40b5: a9 00
    sta l4188                                                         ; 40b7: 8d 88 41
    lda l09b5                                                         ; 40ba: ad b5 09
    sta l4189                                                         ; 40bd: 8d 89 41
    ldx #0                                                            ; 40c0: a2 00
    lda #$cb                                                          ; 40c2: a9 cb
    cmp player_using_object_spriteid                                  ; 40c4: cd b6 2e
    bne c40cf                                                         ; 40c7: d0 06
    cmp previous_player_using_object_spriteid                         ; 40c9: cd b7 2e
    beq c40cf                                                         ; 40cc: f0 01
    dex                                                               ; 40ce: ca
c40cf
    stx l4187                                                         ; 40cf: 8e 87 41
    lda l0a17                                                         ; 40d2: ad 17 0a
    cmp #$ff                                                          ; 40d5: c9 ff
    beq c40ee                                                         ; 40d7: f0 15
    lda l0a73                                                         ; 40d9: ad 73 0a
    cmp desired_room_index                                            ; 40dc: c5 30
    beq c4125                                                         ; 40de: f0 45
    lda l0a74                                                         ; 40e0: ad 74 0a
    cmp #$0a                                                          ; 40e3: c9 0a
    bcc c408e                                                         ; 40e5: 90 a7
    lda l4187                                                         ; 40e7: ad 87 41
    beq c408e                                                         ; 40ea: f0 a2
    bne c40f3                                                         ; 40ec: d0 05
c40ee
    lda l4187                                                         ; 40ee: ad 87 41
    beq c408b                                                         ; 40f1: f0 98
c40f3
    dec l4188                                                         ; 40f3: ce 88 41
    lda #1                                                            ; 40f6: a9 01
    sta l0a17                                                         ; 40f8: 8d 17 0a
    lda desired_room_index                                            ; 40fb: a5 30
    sta l0a73                                                         ; 40fd: 8d 73 0a
    lda object_direction                                              ; 4100: ad be 09
    sta level_workspace                                               ; 4103: 8d 6f 0a
    lda object_x_low+1                                                ; 4106: ad 51 09
    sta l0a70                                                         ; 4109: 8d 70 0a
    lda object_x_high+1                                               ; 410c: ad 67 09
    sta l0a71                                                         ; 410f: 8d 71 0a
    lda object_y_low+1                                                ; 4112: ad 7d 09
    sta l0a72                                                         ; 4115: 8d 72 0a
    lda #0                                                            ; 4118: a9 00
    sta l0a74                                                         ; 411a: 8d 74 0a
    jsr sub_c4259                                                     ; 411d: 20 59 42
    ldx #2                                                            ; 4120: a2 02
    jsr l20f7                                                         ; 4122: 20 f7 20
c4125
    jsr sub_c418a                                                     ; 4125: 20 8a 41
    lda desired_room_index                                            ; 4128: a5 30
    cmp l0a73                                                         ; 412a: cd 73 0a
    beq c4134                                                         ; 412d: f0 05
    lda #0                                                            ; 412f: a9 00
    sta l0a74                                                         ; 4131: 8d 74 0a
c4134
    lda l4189                                                         ; 4134: ad 89 41
    sta l09b5                                                         ; 4137: 8d b5 09
    ldx #$0b                                                          ; 413a: a2 0b
    ldy #2                                                            ; 413c: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 413e: 20 e2 28
    bne c4171                                                         ; 4141: d0 2e
    lda #2                                                            ; 4143: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4145: 20 94 28
    bne c4171                                                         ; 4148: d0 27
    lda l4188                                                         ; 414a: ad 88 41
    beq c416b                                                         ; 414d: f0 1c
    lda desired_room_index                                            ; 414f: a5 30
    cmp l0a73                                                         ; 4151: cd 73 0a
    bne c415b                                                         ; 4154: d0 05
    lda l09aa                                                         ; 4156: ad aa 09
    beq c416b                                                         ; 4159: f0 10
c415b
    lda #0                                                            ; 415b: a9 00
    ldx #$81                                                          ; 415d: a2 81
    ldy #$45 ; 'E'                                                    ; 415f: a0 45
    jsr play_sound_yx                                                 ; 4161: 20 f6 38
    ldx #$6b ; 'k'                                                    ; 4164: a2 6b
    ldy #$45 ; 'E'                                                    ; 4166: a0 45
    jsr play_sound_yx                                                 ; 4168: 20 f6 38
c416b
    jsr sub_c4281                                                     ; 416b: 20 81 42
    jmp c4186                                                         ; 416e: 4c 86 41

c4171
    lda #0                                                            ; 4171: a9 00
    sta l09aa                                                         ; 4173: 8d aa 09
    lda #$ff                                                          ; 4176: a9 ff
    sta l0a17                                                         ; 4178: 8d 17 0a
    jmp c4186                                                         ; 417b: 4c 86 41

c417e
    lda l0a74                                                         ; 417e: ad 74 0a
    bmi c4186                                                         ; 4181: 30 03
    inc l0a74                                                         ; 4183: ee 74 0a
c4186
    rts                                                               ; 4186: 60

l4187
    !byte 0                                                           ; 4187: 00
l4188
    !byte 0                                                           ; 4188: 00
l4189
    !byte 0                                                           ; 4189: 00

sub_c418a
    lda #1                                                            ; 418a: a9 01
    sta temp_bottom_offset                                            ; 418c: 8d 51 25
    dec temp_left_offset                                              ; 418f: ce d0 24
    inc temp_right_offset                                             ; 4192: ee d1 24
    lda #2                                                            ; 4195: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4197: 20 94 28
    beq c41ac                                                         ; 419a: f0 10
    lda #0                                                            ; 419c: a9 00
    sta l09aa                                                         ; 419e: 8d aa 09
    sta l0a74                                                         ; 41a1: 8d 74 0a
    lda #$ff                                                          ; 41a4: a9 ff
    sta l0a17                                                         ; 41a6: 8d 17 0a
    jmp c4258                                                         ; 41a9: 4c 58 42

c41ac
    lda #8                                                            ; 41ac: a9 08
    ldx level_workspace                                               ; 41ae: ae 6f 0a
    bpl c41b8                                                         ; 41b1: 10 05
    eor #$ff                                                          ; 41b3: 49 ff
    clc                                                               ; 41b5: 18
    adc #1                                                            ; 41b6: 69 01
c41b8
    ldx #0                                                            ; 41b8: a2 00
    ora #0                                                            ; 41ba: 09 00
    bpl c41bf                                                         ; 41bc: 10 01
    dex                                                               ; 41be: ca
c41bf
    clc                                                               ; 41bf: 18
    adc l0a70                                                         ; 41c0: 6d 70 0a
    sta l0a70                                                         ; 41c3: 8d 70 0a
    txa                                                               ; 41c6: 8a
    adc l0a71                                                         ; 41c7: 6d 71 0a
    sta l0a71                                                         ; 41ca: 8d 71 0a
    jsr sub_c4259                                                     ; 41cd: 20 59 42
    lda #2                                                            ; 41d0: a9 02
    jsr l25f5                                                         ; 41d2: 20 f5 25
    lda #2                                                            ; 41d5: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 41d7: 20 94 28
    beq c4206                                                         ; 41da: f0 2a
    lda level_workspace                                               ; 41dc: ad 6f 0a
    bpl c41f5                                                         ; 41df: 10 14
    lda l0952                                                         ; 41e1: ad 52 09
    clc                                                               ; 41e4: 18
    adc #8                                                            ; 41e5: 69 08
    sta l0952                                                         ; 41e7: 8d 52 09
    lda l0968                                                         ; 41ea: ad 68 09
    adc #0                                                            ; 41ed: 69 00
    sta l0968                                                         ; 41ef: 8d 68 09
    jmp c4206                                                         ; 41f2: 4c 06 42

c41f5
    lda l0952                                                         ; 41f5: ad 52 09
    sec                                                               ; 41f8: 38
    sbc #8                                                            ; 41f9: e9 08
    sta l0952                                                         ; 41fb: 8d 52 09
    lda l0968                                                         ; 41fe: ad 68 09
    sbc #0                                                            ; 4201: e9 00
    sta l0968                                                         ; 4203: 8d 68 09
c4206
    lda l0952                                                         ; 4206: ad 52 09
    sta l0a70                                                         ; 4209: 8d 70 0a
    lda l0968                                                         ; 420c: ad 68 09
    sta l0a71                                                         ; 420f: 8d 71 0a
    lda l097e                                                         ; 4212: ad 7e 09
    sta l0a72                                                         ; 4215: 8d 72 0a
    ldx #2                                                            ; 4218: a2 02
    jsr l2434                                                         ; 421a: 20 34 24
    lda level_workspace                                               ; 421d: ad 6f 0a
    bmi c423e                                                         ; 4220: 30 1c
    lda l0078                                                         ; 4222: a5 78
    cmp #$28 ; '('                                                    ; 4224: c9 28
    bcc c4258                                                         ; 4226: 90 30
    lda l0a70                                                         ; 4228: ad 70 0a
    sec                                                               ; 422b: 38
    sbc #$40 ; '@'                                                    ; 422c: e9 40
    sta l0a70                                                         ; 422e: 8d 70 0a
    lda #0                                                            ; 4231: a9 00
    sbc #0                                                            ; 4233: e9 00
    sta l0a71                                                         ; 4235: 8d 71 0a
    inc l0a73                                                         ; 4238: ee 73 0a
    jmp c4253                                                         ; 423b: 4c 53 42

c423e
    lda l0079                                                         ; 423e: a5 79
    bpl c4258                                                         ; 4240: 10 16
    lda l0a70                                                         ; 4242: ad 70 0a
    clc                                                               ; 4245: 18
    adc #$40 ; '@'                                                    ; 4246: 69 40
    sta l0a70                                                         ; 4248: 8d 70 0a
    lda #1                                                            ; 424b: a9 01
    sta l0a71                                                         ; 424d: 8d 71 0a
    dec l0a73                                                         ; 4250: ce 73 0a
c4253
    lda #0                                                            ; 4253: a9 00
    sta l09aa                                                         ; 4255: 8d aa 09
c4258
    rts                                                               ; 4258: 60

sub_c4259
    lda l0a70                                                         ; 4259: ad 70 0a
    sta l0952                                                         ; 425c: 8d 52 09
    lda l0a71                                                         ; 425f: ad 71 0a
    sta l0968                                                         ; 4262: 8d 68 09
    lda l0a72                                                         ; 4265: ad 72 0a
    sta l097e                                                         ; 4268: 8d 7e 09
    lda #0                                                            ; 426b: a9 00
    sta l0994                                                         ; 426d: 8d 94 09
    lda level_workspace                                               ; 4270: ad 6f 0a
    sta l09c0                                                         ; 4273: 8d c0 09
    lda #$cc                                                          ; 4276: a9 cc
    sta l09aa                                                         ; 4278: 8d aa 09
    lda #$40 ; '@'                                                    ; 427b: a9 40
    sta l38c4                                                         ; 427d: 8d c4 38
    rts                                                               ; 4280: 60

sub_c4281
    lda desired_room_index                                            ; 4281: a5 30
    cmp l0a73                                                         ; 4283: cd 73 0a
    bne c42a3                                                         ; 4286: d0 1b
    lda #1                                                            ; 4288: a9 01
    sta temp_bottom_offset                                            ; 428a: 8d 51 25
    inc temp_right_offset                                             ; 428d: ee d1 24
    dec temp_left_offset                                              ; 4290: ce d0 24
    lda #2                                                            ; 4293: a9 02
    jsr get_solid_rock_collision_for_object_a                         ; 4295: 20 94 28
    beq c42a3                                                         ; 4298: f0 09
    lda #0                                                            ; 429a: a9 00
    ldx #3                                                            ; 429c: a2 03
    ldy #$45 ; 'E'                                                    ; 429e: a0 45
    jsr play_sound_yx                                                 ; 42a0: 20 f6 38
c42a3
    rts                                                               ; 42a3: 60

; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 26                                                          ; 42a4: 1a                      ; initial player X cell
    !byte 22                                                          ; 42a5: 16                      ; initial player Y cell

; ########################################
; ########################################
; ###   |        ###               |   ###
; ###   |        ###               |   ###
; ###   |        ###               |   ###
; ###   |        ###               |   ###
; ###   |        ###               |   ###
; ###   |        ###               |   ###
; ###   |        ###       #####   |   ###
; ###   |        ###       #####   |   ###
; ###   |        ###       ###     |   ###
; ###   |        ###       ###     |   ###
; ###   |                  ###     |   ###
; ###   |                  ###     |   ###
; ###   |                  ###     |   ###
; ###   |                  ###     |   ###
; ###   |                  ###     |   ###
;       |        ###               |
;       |        ###               |
;       |        ###               |
;                ###
;                ###        P
; ########################################
; ########################################
; set ground fill tile to use
room_1_code
    lda #<ground_fill_2x2_top_left                                    ; 42a6: a9 89
    sta source_sprite_memory_low                                      ; 42a8: 85 40
    lda #>ground_fill_2x2_top_left                                    ; 42aa: a9 45
    sta source_sprite_memory_high                                     ; 42ac: 85 41
; draw rectangles of ground fill rock with a 2x2 pattern. Also writes to the collision
; map.
; draw 255x2 rectangle at (0,0)
    ldx #0                                                            ; 42ae: a2 00
    ldy #0                                                            ; 42b0: a0 00
    lda #$ff                                                          ; 42b2: a9 ff
    sta width_in_cells                                                ; 42b4: 85 3c
    lda #2                                                            ; 42b6: a9 02
    sta height_in_cells                                               ; 42b8: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42ba: 20 bb 1a
; draw 255x2 rectangle at (0,22)
    ldy #$16                                                          ; 42bd: a0 16
    jsr copy_rectangle_of_memory_to_screen                            ; 42bf: 20 bb 1a
; draw 3x15 rectangle at (0,2)
    ldy #2                                                            ; 42c2: a0 02
    lda #3                                                            ; 42c4: a9 03
    sta width_in_cells                                                ; 42c6: 85 3c
    lda #$0f                                                          ; 42c8: a9 0f
    sta height_in_cells                                               ; 42ca: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42cc: 20 bb 1a
; draw 3x15 rectangle at (37,2)
    ldx #$25 ; '%'                                                    ; 42cf: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 42d1: 20 bb 1a
; draw 3x10 rectangle at (15,2)
    ldx #$0f                                                          ; 42d4: a2 0f
    lda #$0a                                                          ; 42d6: a9 0a
    sta height_in_cells                                               ; 42d8: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42da: 20 bb 1a
; draw 3x5 rectangle at (15,17)
    ldy #$11                                                          ; 42dd: a0 11
    lda #5                                                            ; 42df: a9 05
    sta height_in_cells                                               ; 42e1: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42e3: 20 bb 1a
; draw 3x9 rectangle at (25,8)
    ldx #$19                                                          ; 42e6: a2 19
    ldy #8                                                            ; 42e8: a0 08
    lda #9                                                            ; 42ea: a9 09
    sta height_in_cells                                               ; 42ec: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42ee: 20 bb 1a
; draw 2x2 rectangle at (28,8)
    ldx #$1c                                                          ; 42f1: a2 1c
    lda #2                                                            ; 42f3: a9 02
    sta width_in_cells                                                ; 42f5: 85 3c
    sta height_in_cells                                               ; 42f7: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 42f9: 20 bb 1a
; carve the floor, walls and ceiling into the rock
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 42fc: 20 90 1b
; draw rope at (6,2) length 18
    ldx #6                                                            ; 42ff: a2 06
    ldy #2                                                            ; 4301: a0 02
    lda #$12                                                          ; 4303: a9 12
    jsr draw_rope                                                     ; 4305: 20 b9 1d
; draw rope at (33,2) length 18
    ldx #$21 ; '!'                                                    ; 4308: a2 21
    jsr draw_rope                                                     ; 430a: 20 b9 1d
    ldx #$0a                                                          ; 430d: a2 0a
    lda #$0d                                                          ; 430f: a9 0d
    jsr start_room                                                    ; 4311: 20 bb 12
room_1_game_update_loop
    jsr game_update                                                   ; 4314: 20 da 12
    sta room_exit_direction                                           ; 4317: 85 70
    and #exit_room_left                                               ; 4319: 29 01
    beq room_1_check_right_exit                                       ; 431b: f0 07
    ldx #0                                                            ; 431d: a2 00
    ldy current_level                                                 ; 431f: a4 31
    jmp initialise_level_and_room                                     ; 4321: 4c 40 11

room_1_check_right_exit
    lda room_exit_direction                                           ; 4324: a5 70
    and #exit_room_right                                              ; 4326: 29 04
    beq room_1_game_update_loop                                       ; 4328: f0 ea
    ldx #2                                                            ; 432a: a2 02
    ldy current_level                                                 ; 432c: a4 31
    jmp initialise_level_and_room                                     ; 432e: 4c 40 11

sub_c4331
    lda #1                                                            ; 4331: a9 01
    sta currently_updating_logic_for_room_index                       ; 4333: 8d ba 1a
    lda #$20 ; ' '                                                    ; 4336: a9 20
    sta l44aa                                                         ; 4338: 8d aa 44
    lda #3                                                            ; 433b: a9 03
    sta l44ab                                                         ; 433d: 8d ab 44
    lda #4                                                            ; 4340: a9 04
    sta l44ac                                                         ; 4342: 8d ac 44
    ldx #$0b                                                          ; 4345: a2 0b
    ldy l0a75                                                         ; 4347: ac 75 0a
    jsr sub_c4366                                                     ; 434a: 20 66 43
    sty l0a75                                                         ; 434d: 8c 75 0a
    lda #5                                                            ; 4350: a9 05
    sta l44ab                                                         ; 4352: 8d ab 44
    lda #6                                                            ; 4355: a9 06
    sta l44ac                                                         ; 4357: 8d ac 44
    ldx #$15                                                          ; 435a: a2 15
    ldy l0a76                                                         ; 435c: ac 76 0a
    jsr sub_c4366                                                     ; 435f: 20 66 43
    sty l0a76                                                         ; 4362: 8c 76 0a
    rts                                                               ; 4365: 60

sub_c4366
    stx l44a8                                                         ; 4366: 8e a8 44
    sty l44a9                                                         ; 4369: 8c a9 44
    lda update_room_first_update_flag                                 ; 436c: ad 2b 13
    beq c43b3                                                         ; 436f: f0 42
    lda current_level                                                 ; 4371: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 4373: c5 51
    beq c437d                                                         ; 4375: f0 06
    lda l44aa                                                         ; 4377: ad aa 44
    sta l44a9                                                         ; 437a: 8d a9 44
c437d
    lda desired_room_index                                            ; 437d: a5 30
    cmp currently_updating_logic_for_room_index                       ; 437f: cd ba 1a
    bne c43ad                                                         ; 4382: d0 29
    ldx l44a8                                                         ; 4384: ae a8 44
    ldy #0                                                            ; 4387: a0 00
    lda l44ab                                                         ; 4389: ad ab 44
    jsr set_object_position_from_cell_xy                              ; 438c: 20 5d 1f
    lda l44ac                                                         ; 438f: ad ac 44
    jsr set_object_position_from_cell_xy                              ; 4392: 20 5d 1f
    lda #$c8                                                          ; 4395: a9 c8
    ldx l44ab                                                         ; 4397: ae ab 44
    sta object_spriteid,x                                             ; 439a: 9d a8 09
    lda #$c9                                                          ; 439d: a9 c9
    ldx l44ac                                                         ; 439f: ae ac 44
    sta object_spriteid,x                                             ; 43a2: 9d a8 09
    lda #$c0                                                          ; 43a5: a9 c0
    sta object_z_order,x                                              ; 43a7: 9d c2 38
    jsr sub_c44ad                                                     ; 43aa: 20 ad 44
c43ad
    jmp c4448                                                         ; 43ad: 4c 48 44

c43b0
    jmp c44a0                                                         ; 43b0: 4c a0 44

c43b3
    lda desired_room_index                                            ; 43b3: a5 30
    cmp currently_updating_logic_for_room_index                       ; 43b5: cd ba 1a
    bne c4418                                                         ; 43b8: d0 5e
    jsr sub_c44ad                                                     ; 43ba: 20 ad 44
    lda l44f4                                                         ; 43bd: ad f4 44
    beq c4418                                                         ; 43c0: f0 56
    lda #4                                                            ; 43c2: a9 04
    sta l44a7                                                         ; 43c4: 8d a7 44
    clc                                                               ; 43c7: 18
    adc object_y_low                                                  ; 43c8: 6d 7c 09
    sta object_y_low                                                  ; 43cb: 8d 7c 09
    lda l44a7                                                         ; 43ce: ad a7 44
    clc                                                               ; 43d1: 18
    adc object_y_low+1                                                ; 43d2: 6d 7d 09
    sta object_y_low+1                                                ; 43d5: 8d 7d 09
loop_c43d8
    lda #1                                                            ; 43d8: a9 01
    sta temp_bottom_offset                                            ; 43da: 8d 51 25
    lda #0                                                            ; 43dd: a9 00
    jsr get_solid_rock_collision_for_object_a                         ; 43df: 20 94 28
    beq c43f0                                                         ; 43e2: f0 0c
    dec l44a7                                                         ; 43e4: ce a7 44
    dec object_y_low                                                  ; 43e7: ce 7c 09
    dec object_y_low+1                                                ; 43ea: ce 7d 09
    jmp loop_c43d8                                                    ; 43ed: 4c d8 43

c43f0
    lda l44a7                                                         ; 43f0: ad a7 44
    beq c43b0                                                         ; 43f3: f0 bb
    clc                                                               ; 43f5: 18
    adc l44a9                                                         ; 43f6: 6d a9 44
    sta l44a9                                                         ; 43f9: 8d a9 44
    lda #$a0                                                          ; 43fc: a9 a0
    lda #$e0                                                          ; 43fe: a9 e0
    ldx l44ab                                                         ; 4400: ae ab 44
    sta object_z_order,x                                              ; 4403: 9d c2 38
    lda #2                                                            ; 4406: a9 02
    sta temp_bottom_offset                                            ; 4408: 8d 51 25
    lda #0                                                            ; 440b: a9 00
    jsr get_solid_rock_collision_for_object_a                         ; 440d: 20 94 28
    beq c4448                                                         ; 4410: f0 36
    jsr play_landing_sound                                            ; 4412: 20 a9 23
    jmp c4448                                                         ; 4415: 4c 48 44

c4418
    lda l44a9                                                         ; 4418: ad a9 44
    cmp l44aa                                                         ; 441b: cd aa 44
    beq c43b0                                                         ; 441e: f0 90
    sec                                                               ; 4420: 38
    sbc #8                                                            ; 4421: e9 08
    cmp l44aa                                                         ; 4423: cd aa 44
    bcs c442b                                                         ; 4426: b0 03
    lda l44aa                                                         ; 4428: ad aa 44
c442b
    sta l44a9                                                         ; 442b: 8d a9 44
    lda #$e0                                                          ; 442e: a9 e0
    ldx l44ab                                                         ; 4430: ae ab 44
    sta object_z_order,x                                              ; 4433: 9d c2 38
    lda desired_room_index                                            ; 4436: a5 30
    cmp currently_updating_logic_for_room_index                       ; 4438: cd ba 1a
    bne c4448                                                         ; 443b: d0 0b
    lda l44a9                                                         ; 443d: ad a9 44
    cmp l44aa                                                         ; 4440: cd aa 44
    bne c4448                                                         ; 4443: d0 03
    jsr play_landing_sound                                            ; 4445: 20 a9 23
c4448
    lda desired_room_index                                            ; 4448: a5 30
    cmp currently_updating_logic_for_room_index                       ; 444a: cd ba 1a
    bne c44a0                                                         ; 444d: d0 51
    lda l44a9                                                         ; 444f: ad a9 44
    ldx l44ab                                                         ; 4452: ae ab 44
    sta object_y_low,x                                                ; 4455: 9d 7c 09
    ldx l44ac                                                         ; 4458: ae ac 44
    sta object_y_low,x                                                ; 445b: 9d 7c 09
    ldx l44a8                                                         ; 445e: ae a8 44
    lda l44a9                                                         ; 4461: ad a9 44
    lsr                                                               ; 4464: 4a
    lsr                                                               ; 4465: 4a
    lsr                                                               ; 4466: 4a
    tay                                                               ; 4467: a8
    dey                                                               ; 4468: 88
    dey                                                               ; 4469: 88
    lda #0                                                            ; 446a: a9 00
    jsr write_a_single_value_to_cell_in_collision_map                 ; 446c: 20 bb 1e
    iny                                                               ; 446f: c8
    lda #3                                                            ; 4470: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4472: 20 bb 1e
    iny                                                               ; 4475: c8
    lda #2                                                            ; 4476: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4478: 20 bb 1e
    iny                                                               ; 447b: c8
    jsr write_a_single_value_to_cell_in_collision_map                 ; 447c: 20 bb 1e
    iny                                                               ; 447f: c8
    jsr read_collision_map_value_for_xy                               ; 4480: 20 fa 1e
    cmp #3                                                            ; 4483: c9 03
    beq c44a0                                                         ; 4485: f0 19
    lda l44a9                                                         ; 4487: ad a9 44
    and #7                                                            ; 448a: 29 07
    beq c449b                                                         ; 448c: f0 0d
    lda #2                                                            ; 448e: a9 02
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4490: 20 bb 1e
    iny                                                               ; 4493: c8
    jsr read_collision_map_value_for_xy                               ; 4494: 20 fa 1e
    cmp #3                                                            ; 4497: c9 03
    beq c44a0                                                         ; 4499: f0 05
c449b
    lda #0                                                            ; 449b: a9 00
    jsr write_a_single_value_to_cell_in_collision_map                 ; 449d: 20 bb 1e
c44a0
    ldx l44a8                                                         ; 44a0: ae a8 44
    ldy l44a9                                                         ; 44a3: ac a9 44
    rts                                                               ; 44a6: 60

l44a7
    !byte 0                                                           ; 44a7: 00
l44a8
    !byte 0                                                           ; 44a8: 00
l44a9
    !byte 0                                                           ; 44a9: 00
l44aa
    !byte 0                                                           ; 44aa: 00
l44ab
    !byte 0                                                           ; 44ab: 00
l44ac
    !byte 0                                                           ; 44ac: 00

sub_c44ad
    lda #0                                                            ; 44ad: a9 00
    sta l44f4                                                         ; 44af: 8d f4 44
    lda l0048                                                         ; 44b2: a5 48
    cmp #6                                                            ; 44b4: c9 06
    bne c44f3                                                         ; 44b6: d0 3b
    lda object_x_high                                                 ; 44b8: ad 66 09
    lsr                                                               ; 44bb: 4a
    sta l0070                                                         ; 44bc: 85 70
    lda object_x_low                                                  ; 44be: ad 50 09
    ror                                                               ; 44c1: 6a
    lsr l0070                                                         ; 44c2: 46 70
    ror                                                               ; 44c4: 6a
    lsr l0070                                                         ; 44c5: 46 70
    ror                                                               ; 44c7: 6a
    sta l0070                                                         ; 44c8: 85 70
    sec                                                               ; 44ca: 38
    sbc #2                                                            ; 44cb: e9 02
    cmp l44a8                                                         ; 44cd: cd a8 44
    bcs c44f3                                                         ; 44d0: b0 21
    lda l0070                                                         ; 44d2: a5 70
    clc                                                               ; 44d4: 18
    adc #1                                                            ; 44d5: 69 01
    cmp l44a8                                                         ; 44d7: cd a8 44
    bcc c44f3                                                         ; 44da: 90 17
    lda l09df                                                         ; 44dc: ad df 09
    cmp #$51 ; 'Q'                                                    ; 44df: c9 51
    beq c44eb                                                         ; 44e1: f0 08
    cmp #$45 ; 'E'                                                    ; 44e3: c9 45
    beq c44eb                                                         ; 44e5: f0 04
    cmp #$49 ; 'I'                                                    ; 44e7: c9 49
    bne c44f3                                                         ; 44e9: d0 08
c44eb
    lda #$ff                                                          ; 44eb: a9 ff
    sta inhibit_monkey_climb_flag                                     ; 44ed: 8d d7 31
    sta l44f4                                                         ; 44f0: 8d f4 44
c44f3
    rts                                                               ; 44f3: 60

l44f4
    !byte   0,   5,   1, $ff,   0,   0,   1,   1,   0, $6e, $fc,   0  ; 44f4: 00 05 01...
    !byte $f8, $6e,   0, $13,   0,   5,   0, $c9,   0,   1,   0,   6  ; 4500: f8 6e 00...
    !byte   1,   0,   0,   0,   0,   0,   0, $50,   0,   0, $fa, $73  ; 450c: 01 00 00...
    !byte   0, $10,   0,   6,   0,   7,   0,   1,   0, $11,   0,   0  ; 4518: 00 10 00...
    !byte   0, $d2,   0,   1,   0,   7,   1,   0,   0,   0,   0,   0  ; 4524: 00 d2 00...
    !byte   0, $7e,   0, $fc, $f8, $7e,   0, $10,   0,   7,   0,   7  ; 4530: 00 7e 00...
    !byte   0,   1,   0, $11,   0,   0,   0, $c8,   0,   1,   0,   7  ; 453c: 00 01 00...
    !byte $81, $fc, $fe, $ff,   8,   8,   8, $60, $fc,   0, $fc, $60  ; 4548: 81 fc fe...
    !byte   0, $13,   0,   7,   0, $f5,   0,   2,   0,   8,   1,   0  ; 4554: 00 13 00...
    !byte   0,   0,   0,   0,   0, $6e, $fe,   0, $fc, $6e,   0, $10  ; 4560: 00 00 00...
    !byte   0,   8,   0,   3,   0,   2,   0,   9, $84,   2,   2,   2  ; 456c: 00 08 00...
    !byte   4,   4,   4,   0,   0,   0,   0,   0,   0, $11,   0,   9  ; 4578: 04 04 04...
    !byte   0, $6e,   0,   2,   0                                     ; 4584: 00 6e 00...
ground_fill_2x2_top_left
    !byte %...#....                                                   ; 4589: 10
    !byte %...#....                                                   ; 458a: 10
    !byte %..#.....                                                   ; 458b: 20
    !byte %##...###                                                   ; 458c: c7
    !byte %....#...                                                   ; 458d: 08
    !byte %...#....                                                   ; 458e: 10
    !byte %...#....                                                   ; 458f: 10
    !byte %...#....                                                   ; 4590: 10
ground_fill_2x2_top_right
    !byte %...#....                                                   ; 4591: 10
    !byte %...#....                                                   ; 4592: 10
    !byte %....#...                                                   ; 4593: 08
    !byte %##...###                                                   ; 4594: c7
    !byte %..#....#                                                   ; 4595: 21
    !byte %...#...#                                                   ; 4596: 11
    !byte %...#...#                                                   ; 4597: 11
    !byte %...#...#                                                   ; 4598: 11
ground_fill_2x2_bottom_left
    !byte %...#....                                                   ; 4599: 10
    !byte %...#....                                                   ; 459a: 10
    !byte %....#...                                                   ; 459b: 08
    !byte %##...###                                                   ; 459c: c7
    !byte %..#....#                                                   ; 459d: 21
    !byte %...#...#                                                   ; 459e: 11
    !byte %...#...#                                                   ; 459f: 11
    !byte %...#...#                                                   ; 45a0: 11
ground_fill_2x2_bottom_right
    !byte %...#....                                                   ; 45a1: 10
    !byte %...#....                                                   ; 45a2: 10
    !byte %..#.....                                                   ; 45a3: 20
    !byte %##...###                                                   ; 45a4: c7
    !byte %....#...                                                   ; 45a5: 08
    !byte %...#....                                                   ; 45a6: 10
    !byte %...#....                                                   ; 45a7: 10
    !byte %...#....                                                   ; 45a8: 10
sprite_data
pydis_end

; Automatically generated labels:
;     c3b02
;     c3b0c
;     c3bd7
;     c3bf8
;     c3bfb
;     c3bfe
;     c3c30
;     c3c35
;     c3c47
;     c3c65
;     c3c86
;     c3ca8
;     c3cb7
;     c3cc5
;     c3cd1
;     c3d00
;     c3dcf
;     c3dd5
;     c3dec
;     c3def
;     c3e00
;     c3e0e
;     c3e47
;     c3e6d
;     c3e8a
;     c3e92
;     c3ea7
;     c3eb5
;     c3edf
;     c3ee8
;     c3f0c
;     c3f2d
;     c4004
;     c4036
;     c405d
;     c405e
;     c4086
;     c408b
;     c408e
;     c4091
;     c40b5
;     c40cf
;     c40ee
;     c40f3
;     c4125
;     c4134
;     c415b
;     c416b
;     c4171
;     c417e
;     c4186
;     c41ac
;     c41b8
;     c41bf
;     c41f5
;     c4206
;     c423e
;     c4253
;     c4258
;     c42a3
;     c437d
;     c43ad
;     c43b0
;     c43b3
;     c43f0
;     c4418
;     c442b
;     c4448
;     c449b
;     c44a0
;     c44eb
;     c44f3
;     l0048
;     l0078
;     l0079
;     l0952
;     l0955
;     l0968
;     l097e
;     l0981
;     l0994
;     l09aa
;     l09ab
;     l09ac
;     l09ad
;     l09b5
;     l09c0
;     l09df
;     l0a17
;     l0a18
;     l0a19
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
;     l20f7
;     l2434
;     l25f5
;     l38ae
;     l38b0
;     l38b1
;     l38c4
;     l38c5
;     l38c6
;     l38c7
;     l3970
;     l3d01
;     l3d8b
;     l3f3c
;     l4187
;     l4188
;     l4189
;     l44a7
;     l44a8
;     l44a9
;     l44aa
;     l44ab
;     l44ac
;     l44f4
;     loop_c406c
;     loop_c43d8
;     sub_c3bad
;     sub_c3da9
;     sub_c3fd7
;     sub_c418a
;     sub_c4259
;     sub_c4281
;     sub_c4331
;     sub_c4366
;     sub_c44ad
!if (<ground_fill_2x2_top_left) != $89 {
    !error "Assertion failed: <ground_fill_2x2_top_left == $89"
}
!if (>ground_fill_2x2_top_left) != $45 {
    !error "Assertion failed: >ground_fill_2x2_top_left == $45"
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
!if (level_specific_update) != $3b0d {
    !error "Assertion failed: level_specific_update == $3b0d"
}
!if (room_0_data) != $3f3d {
    !error "Assertion failed: room_0_data == $3f3d"
}
!if (room_1_data) != $42a4 {
    !error "Assertion failed: room_1_data == $42a4"
}
!if (room_2_data) != $3b1a {
    !error "Assertion failed: room_2_data == $3b1a"
}
!if (room_3_data) != $3d02 {
    !error "Assertion failed: room_3_data == $3d02"
}
!if (sprite_data - level_data) != $0ad4 {
    !error "Assertion failed: sprite_data - level_data == $0ad4"
}
