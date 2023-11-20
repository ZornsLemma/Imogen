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
desired_level                                       = $31
temp_sprite_x_offset                                = $3a
temp_sprite_y_offset                                = $3b
width_in_cells                                      = $3c
height_in_cells                                     = $3d
value_to_write_to_collision_map                     = $3e
source_sprite_memory_low                            = $40
source_sprite_memory_high                           = $41
copy_mode                                           = $42
previous_room_index                                 = $50
previous_level                                      = $51
player_held_object_menu_item_spriteid               = $52
developer_mode_sideways_ram_is_set_up_flag          = $5b
l0070                                               = $70
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
l09aa                                               = $09aa
l09ab                                               = $09ab
l09ac                                               = $09ac
l09ad                                               = $09ad
l09ae                                               = $09ae
l09af                                               = $09af
object_spriteid_old                                 = $09b3
object_direction                                    = $09be
object_direction_old                                = $09c9
level_progress_table                                = $09ef
l0a05                                               = $0a05
l0a06                                               = $0a06
l0a07                                               = $0a07
l0a08                                               = $0a08
l0a09                                               = $0a09
l0a6f                                               = $0a6f
l0a70                                               = $0a70
l0a71                                               = $0a71
l0a72                                               = $0a72
l0a73                                               = $0a73
l0a74                                               = $0a74
l0a75                                               = $0a75
string_input_buffer                                 = $0a90
tile_all_set_pixels                                 = $0aa9
developer_flags                                     = $1103
initialise_level                                    = $1140
start_room                                          = $12bb
game_update                                         = $12da
update_room_first_update_flag                       = $132b
pending_toolbar_colour                              = $175d
toolbar_colour                                      = $175e
pending_gameplay_area_colour                        = $175f
gameplay_area_colour                                = $1760
use_colour_flag                                     = $1765
set_toolbar_and_gameplay_area_colours               = $1766
jmp_yx                                              = $1966
update_brazier_and_fire                             = $1988
update_level_completion                             = $1a10
currently_updating_logic_for_room_index             = $1aba
copy_rectangle_of_memory_to_screen                  = $1abb
draw_floor_walls_and_ceiling_around_solid_rock      = $1b90
draw_rope                                           = $1db9
write_value_to_a_rectangle_of_cells_in_collision_map = $1e44
write_a_single_value_to_cell_in_collision_map       = $1ebb
l1efa                                               = $1efa
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
player_held_object_for_spriteid_wizard6             = $2eb6
previous_player_held_object_for_spriteid_wizard6    = $2eb7
toolbar_collectable_spriteids                       = $2ee8
l2ee9                                               = $2ee9
l2eea                                               = $2eea
collectable_spriteids                               = $2eed
l2eee                                               = $2eee
l2eef                                               = $2eef
five_byte_table_paired_with_collectable_sprite_ids  = $2ef2
l2ef4                                               = $2ef4
print_encrypted_string_at_yx_centred                = $37f3
wait_one_second_then_check_keys                     = $388d
object_sprite_mask_type                             = $38ac
l38b2                                               = $38b2
object_z_order                                      = $38c2
l38c8                                               = $38c8
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
    !word sprite_data - level_data                                    ; 3ad5: 71 0a                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f2 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 1c 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
    !byte 0, 1                                                        ; 3add: 00 01
level_room_data_table
    !word room_0_data                                                 ; 3adf: 2f 3b                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: 81 3c
    !word room_2_data                                                 ; 3ae3: 93 3f
    !word room_3_data                                                 ; 3ae5: 3d 43

; *************************************************************************************
level_specific_password
    !byte $9f, $82, $86, $8e, $e6, $8d, $87, $82, $8e, $98, $c6       ; 3ae7: 9f 82 86...

; *************************************************************************************
level_specific_initialisation
    lda desired_level                                                 ; 3af2: a5 31
    cmp previous_level                                                ; 3af4: c5 51
    beq c3b1b                                                         ; 3af6: f0 23
    lda developer_flags                                               ; 3af8: ad 03 11
    bpl c3b02                                                         ; 3afb: 10 05
    lda #$ff                                                          ; 3afd: a9 ff
    sta l0a05                                                         ; 3aff: 8d 05 0a
c3b02
    lda l0a09                                                         ; 3b02: ad 09 0a
    beq c3b0c                                                         ; 3b05: f0 05
    lda #$de                                                          ; 3b07: a9 de
    jsr find_or_create_menu_slot_for_A                                ; 3b09: 20 bd 2b
c3b0c
    lda l0a05                                                         ; 3b0c: ad 05 0a
    beq c3b1b                                                         ; 3b0f: f0 0a
    lda l0a06                                                         ; 3b11: ad 06 0a
    bne c3b1b                                                         ; 3b14: d0 05
    lda #$d4                                                          ; 3b16: a9 d4
    jsr find_or_create_menu_slot_for_A                                ; 3b18: 20 bd 2b
c3b1b
    rts                                                               ; 3b1b: 60

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
    jsr sub_c3d66                                                     ; 3b1c: 20 66 3d
    jsr sub_c406d                                                     ; 3b1f: 20 6d 40
    jsr sub_c42dd                                                     ; 3b22: 20 dd 42
    jsr sub_c3c08                                                     ; 3b25: 20 08 3c
    jsr sub_c443d                                                     ; 3b28: 20 3d 44
    jsr sub_c3f2f                                                     ; 3b2b: 20 2f 3f
    rts                                                               ; 3b2e: 60

; *************************************************************************************
; 
; Room 0 initialisation
; 
; *************************************************************************************
room_0_data
    !byte 22                                                          ; 3b2f: 16                      ; initial player X cell
    !byte 20                                                          ; 3b30: 14                      ; initial player Y cell

room_0_initialisation_code
    lda #$26 ; '&'                                                    ; 3b31: a9 26
    sta source_sprite_memory_low                                      ; 3b33: 85 40
    lda #$45 ; 'E'                                                    ; 3b35: a9 45
    sta source_sprite_memory_high                                     ; 3b37: 85 41
    ldx #0                                                            ; 3b39: a2 00
    ldy #0                                                            ; 3b3b: a0 00
    lda #$ff                                                          ; 3b3d: a9 ff
    sta width_in_cells                                                ; 3b3f: 85 3c
    lda #2                                                            ; 3b41: a9 02
    sta height_in_cells                                               ; 3b43: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b45: 20 bb 1a
    ldy #2                                                            ; 3b48: a0 02
    lda #5                                                            ; 3b4a: a9 05
    sta width_in_cells                                                ; 3b4c: 85 3c
    dec height_in_cells                                               ; 3b4e: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b50: 20 bb 1a
    ldx #$23 ; '#'                                                    ; 3b53: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 3b55: 20 bb 1a
    ldx #0                                                            ; 3b58: a2 00
    iny                                                               ; 3b5a: c8
    dec width_in_cells                                                ; 3b5b: c6 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b5d: 20 bb 1a
    ldx #$24 ; '$'                                                    ; 3b60: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 3b62: 20 bb 1a
    ldx #0                                                            ; 3b65: a2 00
    iny                                                               ; 3b67: c8
    dec width_in_cells                                                ; 3b68: c6 3c
    lda #4                                                            ; 3b6a: a9 04
    sta height_in_cells                                               ; 3b6c: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b6e: 20 bb 1a
    ldx #$25 ; '%'                                                    ; 3b71: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 3b73: 20 bb 1a
    ldx #0                                                            ; 3b76: a2 00
    ldy #8                                                            ; 3b78: a0 08
    sty width_in_cells                                                ; 3b7a: 84 3c
    lda #2                                                            ; 3b7c: a9 02
    sta height_in_cells                                               ; 3b7e: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b80: 20 bb 1a
    ldx #$20 ; ' '                                                    ; 3b83: a2 20
    jsr copy_rectangle_of_memory_to_screen                            ; 3b85: 20 bb 1a
    ldx #$25 ; '%'                                                    ; 3b88: a2 25
    ldy #$0a                                                          ; 3b8a: a0 0a
    inc height_in_cells                                               ; 3b8c: e6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b8e: 20 bb 1a
    ldx #0                                                            ; 3b91: a2 00
    ldy #$0f                                                          ; 3b93: a0 0f
    lda #5                                                            ; 3b95: a9 05
    sta width_in_cells                                                ; 3b97: 85 3c
    sta height_in_cells                                               ; 3b99: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b9b: 20 bb 1a
    ldy #$14                                                          ; 3b9e: a0 14
    lda #$ff                                                          ; 3ba0: a9 ff
    sta width_in_cells                                                ; 3ba2: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3ba4: 20 bb 1a
    ldx #$23 ; '#'                                                    ; 3ba7: a2 23
    ldy #$12                                                          ; 3ba9: a0 12
    lda #2                                                            ; 3bab: a9 02
    sta height_in_cells                                               ; 3bad: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3baf: 20 bb 1a
    ldx #$13                                                          ; 3bb2: a2 13
    ldy #8                                                            ; 3bb4: a0 08
    lda #6                                                            ; 3bb6: a9 06
    sta width_in_cells                                                ; 3bb8: 85 3c
    lda #2                                                            ; 3bba: a9 02
    sta height_in_cells                                               ; 3bbc: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3bbe: 20 bb 1a
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3bc1: 20 90 1b
    lda #3                                                            ; 3bc4: a9 03
    sta width_in_cells                                                ; 3bc6: 85 3c
    lda #2                                                            ; 3bc8: a9 02
    sta height_in_cells                                               ; 3bca: 85 3d
    ldx #9                                                            ; 3bcc: a2 09
    ldy #$12                                                          ; 3bce: a0 12
    lda #$d2                                                          ; 3bd0: a9 d2
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bd2: 20 57 1f
    ldx #$0c                                                          ; 3bd5: a2 0c
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bd7: 20 57 1f
    ldx #$0f                                                          ; 3bda: a2 0f
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bdc: 20 57 1f
    ldx #$1c                                                          ; 3bdf: a2 1c
    ldy #2                                                            ; 3be1: a0 02
    lda #$10                                                          ; 3be3: a9 10
    jsr draw_rope                                                     ; 3be5: 20 b9 1d
    jsr start_room                                                    ; 3be8: 20 bb 12
loop_c3beb
    jsr game_update                                                   ; 3beb: 20 da 12
    sta l0070                                                         ; 3bee: 85 70
    and #1                                                            ; 3bf0: 29 01
    beq c3bfb                                                         ; 3bf2: f0 07
    ldx #1                                                            ; 3bf4: a2 01
    ldy desired_level                                                 ; 3bf6: a4 31
    jmp initialise_level                                              ; 3bf8: 4c 40 11

c3bfb
    lda l0070                                                         ; 3bfb: a5 70
    and #4                                                            ; 3bfd: 29 04
    beq loop_c3beb                                                    ; 3bff: f0 ea
    ldx #2                                                            ; 3c01: a2 02
    ldy desired_level                                                 ; 3c03: a4 31
    jmp initialise_level                                              ; 3c05: 4c 40 11

sub_c3c08
    lda update_room_first_update_flag                                 ; 3c08: ad 2b 13
    beq c3c1a                                                         ; 3c0b: f0 0d
    lda desired_level                                                 ; 3c0d: a5 31
    cmp previous_level                                                ; 3c0f: c5 51
    beq c3c1a                                                         ; 3c11: f0 07
    ldx #8                                                            ; 3c13: a2 08
    ldy #$45 ; 'E'                                                    ; 3c15: a0 45
    jsr define_envelope                                               ; 3c17: 20 5e 39
c3c1a
    lda #0                                                            ; 3c1a: a9 00
    sta l42dc                                                         ; 3c1c: 8d dc 42
    lda desired_room_index                                            ; 3c1f: a5 30
    cmp #0                                                            ; 3c21: c9 00
    bne c3c51                                                         ; 3c23: d0 2c
    lda player_held_object_menu_item_spriteid                         ; 3c25: a5 52
    beq c3c51                                                         ; 3c27: f0 28
    lda object_y_low                                                  ; 3c29: ad 7c 09
    cmp #$40 ; '@'                                                    ; 3c2c: c9 40
    bcs c3c51                                                         ; 3c2e: b0 21
    lda object_x_high                                                 ; 3c30: ad 66 09
    bne c3c51                                                         ; 3c33: d0 1c
    lda object_x_low                                                  ; 3c35: ad 50 09
    cmp #$60 ; '`'                                                    ; 3c38: c9 60
    bcc c3c51                                                         ; 3c3a: 90 15
    cmp #$80                                                          ; 3c3c: c9 80
    bcs c3c51                                                         ; 3c3e: b0 11
    lda #2                                                            ; 3c40: a9 02
    sta temp_bottom_offset                                            ; 3c42: 8d 51 25
    lda #0                                                            ; 3c45: a9 00
    jsr get_solid_rock_collision_for_object_a                         ; 3c47: 20 94 28
    and #2                                                            ; 3c4a: 29 02
    beq c3c51                                                         ; 3c4c: f0 03
    dec l42dc                                                         ; 3c4e: ce dc 42
c3c51
    lda l0a08                                                         ; 3c51: ad 08 0a
    sta l42d8                                                         ; 3c54: 8d d8 42
    ldy #$10                                                          ; 3c57: a0 10
    sty l42db                                                         ; 3c59: 8c db 42
    lda #0                                                            ; 3c5c: a9 00
    ldx #$0d                                                          ; 3c5e: a2 0d
    ldy #8                                                            ; 3c60: a0 08
    jsr sub_c41d2                                                     ; 3c62: 20 d2 41
    lda l42d8                                                         ; 3c65: ad d8 42
    sta l0a08                                                         ; 3c68: 8d 08 0a
    lda update_room_first_update_flag                                 ; 3c6b: ad 2b 13
    bne c3c80                                                         ; 3c6e: d0 10
    lda desired_room_index                                            ; 3c70: a5 30
    cmp #0                                                            ; 3c72: c9 00
    bne c3c80                                                         ; 3c74: d0 0a
    lda l0a08                                                         ; 3c76: ad 08 0a
    cmp #$10                                                          ; 3c79: c9 10
    bne c3c80                                                         ; 3c7b: d0 03
    jsr sub_c41c1                                                     ; 3c7d: 20 c1 41
c3c80
    rts                                                               ; 3c80: 60

; *************************************************************************************
; 
; Room 1 initialisation
; 
; *************************************************************************************
room_1_data
    !byte 13                                                          ; 3c81: 0d                      ; initial player X cell
    !byte 20                                                          ; 3c82: 14                      ; initial player Y cell

room_1_initialisation_code
    lda #$26 ; '&'                                                    ; 3c83: a9 26
    sta source_sprite_memory_low                                      ; 3c85: 85 40
    lda #$45 ; 'E'                                                    ; 3c87: a9 45
    sta source_sprite_memory_high                                     ; 3c89: 85 41
    ldx #0                                                            ; 3c8b: a2 00
    ldy #0                                                            ; 3c8d: a0 00
    lda #$ff                                                          ; 3c8f: a9 ff
    sta width_in_cells                                                ; 3c91: 85 3c
    lda #2                                                            ; 3c93: a9 02
    sta height_in_cells                                               ; 3c95: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3c97: 20 bb 1a
    ldy #2                                                            ; 3c9a: a0 02
    lda #6                                                            ; 3c9c: a9 06
    sta width_in_cells                                                ; 3c9e: 85 3c
    dec height_in_cells                                               ; 3ca0: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ca2: 20 bb 1a
    ldx #$22 ; '"'                                                    ; 3ca5: a2 22
    jsr copy_rectangle_of_memory_to_screen                            ; 3ca7: 20 bb 1a
    ldx #$12                                                          ; 3caa: a2 12
    dec width_in_cells                                                ; 3cac: c6 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3cae: 20 bb 1a
    ldx #0                                                            ; 3cb1: a2 00
    iny                                                               ; 3cb3: c8
    lda #5                                                            ; 3cb4: a9 05
    sta width_in_cells                                                ; 3cb6: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3cb8: 20 bb 1a
    ldx #$23 ; '#'                                                    ; 3cbb: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 3cbd: 20 bb 1a
    ldx #$13                                                          ; 3cc0: a2 13
    lda #3                                                            ; 3cc2: a9 03
    sta width_in_cells                                                ; 3cc4: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3cc6: 20 bb 1a
    ldx #0                                                            ; 3cc9: a2 00
    iny                                                               ; 3ccb: c8
    lda #4                                                            ; 3ccc: a9 04
    sta width_in_cells                                                ; 3cce: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3cd0: 20 bb 1a
    ldx #$24 ; '$'                                                    ; 3cd3: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 3cd5: 20 bb 1a
    inx                                                               ; 3cd8: e8
    iny                                                               ; 3cd9: c8
    lda #5                                                            ; 3cda: a9 05
    sta height_in_cells                                               ; 3cdc: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3cde: 20 bb 1a
    ldx #0                                                            ; 3ce1: a2 00
    dec width_in_cells                                                ; 3ce3: c6 3c
    lda #$ff                                                          ; 3ce5: a9 ff
    sta height_in_cells                                               ; 3ce7: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ce9: 20 bb 1a
    ldx #3                                                            ; 3cec: a2 03
    ldy #$14                                                          ; 3cee: a0 14
    lda #$0e                                                          ; 3cf0: a9 0e
    sta width_in_cells                                                ; 3cf2: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3cf4: 20 bb 1a
    ldx #$10                                                          ; 3cf7: a2 10
    ldy #$16                                                          ; 3cf9: a0 16
    lda #$ff                                                          ; 3cfb: a9 ff
    sta width_in_cells                                                ; 3cfd: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3cff: 20 bb 1a
    ldx #$18                                                          ; 3d02: a2 18
    ldy #$13                                                          ; 3d04: a0 13
    lda #3                                                            ; 3d06: a9 03
    sta height_in_cells                                               ; 3d08: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d0a: 20 bb 1a
    ldx #$21 ; '!'                                                    ; 3d0d: a2 21
    ldy #$11                                                          ; 3d0f: a0 11
    lda #2                                                            ; 3d11: a9 02
    sta height_in_cells                                               ; 3d13: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d15: 20 bb 1a
    ldx #$23 ; '#'                                                    ; 3d18: a2 23
    ldy #$0f                                                          ; 3d1a: a0 0f
    jsr copy_rectangle_of_memory_to_screen                            ; 3d1c: 20 bb 1a
    ldx #$19                                                          ; 3d1f: a2 19
    ldy #$0d                                                          ; 3d21: a0 0d
    lda #4                                                            ; 3d23: a9 04
    sta width_in_cells                                                ; 3d25: 85 3c
    lda #2                                                            ; 3d27: a9 02
    sta height_in_cells                                               ; 3d29: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d2b: 20 bb 1a
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3d2e: 20 90 1b
    lda #3                                                            ; 3d31: a9 03
    sta width_in_cells                                                ; 3d33: 85 3c
    lda #2                                                            ; 3d35: a9 02
    sta height_in_cells                                               ; 3d37: 85 3d
    ldx #6                                                            ; 3d39: a2 06
    ldy #$12                                                          ; 3d3b: a0 12
    lda #$d2                                                          ; 3d3d: a9 d2
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3d3f: 20 57 1f
    ldx #3                                                            ; 3d42: a2 03
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3d44: 20 57 1f
    ldy #$10                                                          ; 3d47: a0 10
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3d49: 20 57 1f
    ldx #$14                                                          ; 3d4c: a2 14
    ldy #4                                                            ; 3d4e: a0 04
    lda #$0c                                                          ; 3d50: a9 0c
    jsr draw_rope                                                     ; 3d52: 20 b9 1d
    jsr start_room                                                    ; 3d55: 20 bb 12
loop_c3d58
    jsr game_update                                                   ; 3d58: 20 da 12
    and #4                                                            ; 3d5b: 29 04
    beq loop_c3d58                                                    ; 3d5d: f0 f9
    ldx #0                                                            ; 3d5f: a2 00
    ldy desired_level                                                 ; 3d61: a4 31
    jmp initialise_level                                              ; 3d63: 4c 40 11

sub_c3d66
    lda #1                                                            ; 3d66: a9 01
    sta currently_updating_logic_for_room_index                       ; 3d68: 8d ba 1a
    lda #4                                                            ; 3d6b: a9 04
    ldx #$25 ; '%'                                                    ; 3d6d: a2 25
    ldy #7                                                            ; 3d6f: a0 07
    jsr update_brazier_and_fire                                       ; 3d71: 20 88 19
    lda l0a6f                                                         ; 3d74: ad 6f 0a
    sta l3f1e                                                         ; 3d77: 8d 1e 3f
    lda l0a70                                                         ; 3d7a: ad 70 0a
    sta l3f1f                                                         ; 3d7d: 8d 1f 3f
    lda l0a71                                                         ; 3d80: ad 71 0a
    sta l3f20                                                         ; 3d83: 8d 20 3f
    lda #1                                                            ; 3d86: a9 01
    ldx #$0c                                                          ; 3d88: a2 0c
    ldy #$0b                                                          ; 3d8a: a0 0b
    jsr sub_c3e47                                                     ; 3d8c: 20 47 3e
    lda l3f1e                                                         ; 3d8f: ad 1e 3f
    sta l0a6f                                                         ; 3d92: 8d 6f 0a
    lda l3f1f                                                         ; 3d95: ad 1f 3f
    sta l0a70                                                         ; 3d98: 8d 70 0a
    lda l3f20                                                         ; 3d9b: ad 20 3f
    sta l0a71                                                         ; 3d9e: 8d 71 0a
    lda update_room_first_update_flag                                 ; 3da1: ad 2b 13
    beq c3dd1                                                         ; 3da4: f0 2b
    lda previous_level                                                ; 3da6: a5 51
    cmp desired_level                                                 ; 3da8: c5 31
    beq c3db6                                                         ; 3daa: f0 0a
    lda l0a05                                                         ; 3dac: ad 05 0a
    bmi c3db6                                                         ; 3daf: 30 05
    lda #0                                                            ; 3db1: a9 00
    sta l0a05                                                         ; 3db3: 8d 05 0a
c3db6
    lda desired_room_index                                            ; 3db6: a5 30
    cmp #1                                                            ; 3db8: c9 01
    bne c3dce                                                         ; 3dba: d0 12
    ldx #3                                                            ; 3dbc: a2 03
    jsr set_object_position_from_current_sprite_position              ; 3dbe: 20 6d 1f
    lda #1                                                            ; 3dc1: a9 01
    sta object_direction,x                                            ; 3dc3: 9d be 09
    lda #$ff                                                          ; 3dc6: a9 ff
    sta object_sprite_mask_type,x                                     ; 3dc8: 9d ac 38
    sta object_z_order,x                                              ; 3dcb: 9d c2 38
c3dce
    jmp c3e2b                                                         ; 3dce: 4c 2b 3e

c3dd1
    lda l0a05                                                         ; 3dd1: ad 05 0a
    bmi c3e2b                                                         ; 3dd4: 30 55
    beq c3df3                                                         ; 3dd6: f0 1b
    lda desired_room_index                                            ; 3dd8: a5 30
    cmp #1                                                            ; 3dda: c9 01
    bne c3e11                                                         ; 3ddc: d0 33
    ldx #$0b                                                          ; 3dde: a2 0b
    ldy #3                                                            ; 3de0: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 3de2: 20 e2 28
    beq c3e11                                                         ; 3de5: f0 2a
    lda #$d4                                                          ; 3de7: a9 d4
    jsr find_or_create_menu_slot_for_A                                ; 3de9: 20 bd 2b
    lda #$ff                                                          ; 3dec: a9 ff
    sta l0a05                                                         ; 3dee: 8d 05 0a
    bmi c3e2b                                                         ; 3df1: 30 38
c3df3
    lda l0a6f                                                         ; 3df3: ad 6f 0a
    cmp #3                                                            ; 3df6: c9 03
    bcc c3e2b                                                         ; 3df8: 90 31
    lda l0a70                                                         ; 3dfa: ad 70 0a
    sec                                                               ; 3dfd: 38
    sbc l0a6f                                                         ; 3dfe: ed 6f 0a
    cmp #3                                                            ; 3e01: c9 03
    bcc c3e2b                                                         ; 3e03: 90 26
    lda l0a6f                                                         ; 3e05: ad 6f 0a
    and #3                                                            ; 3e08: 29 03
    bne c3e2b                                                         ; 3e0a: d0 1f
    lda l0a71                                                         ; 3e0c: ad 71 0a
    bne c3e2b                                                         ; 3e0f: d0 1a
c3e11
    ldy l0a05                                                         ; 3e11: ac 05 0a
    iny                                                               ; 3e14: c8
    cpy #6                                                            ; 3e15: c0 06
    bcc c3e1b                                                         ; 3e17: 90 02
    ldy #0                                                            ; 3e19: a0 00
c3e1b
    sty l0a05                                                         ; 3e1b: 8c 05 0a
    lda desired_room_index                                            ; 3e1e: a5 30
    cmp #1                                                            ; 3e20: c9 01
    bne c3e2b                                                         ; 3e22: d0 07
    cpy #2                                                            ; 3e24: c0 02
    bne c3e2b                                                         ; 3e26: d0 03
    jsr sub_c3f82                                                     ; 3e28: 20 82 3f
c3e2b
    lda desired_room_index                                            ; 3e2b: a5 30
    cmp #1                                                            ; 3e2d: c9 01
    bne c3e40                                                         ; 3e2f: d0 0f
    ldy l0a05                                                         ; 3e31: ac 05 0a
    bpl c3e3a                                                         ; 3e34: 10 04
    lda #$d1                                                          ; 3e36: a9 d1
    bne c3e3d                                                         ; 3e38: d0 03
c3e3a
    lda l3e41,y                                                       ; 3e3a: b9 41 3e
c3e3d
    sta l09ab                                                         ; 3e3d: 8d ab 09
c3e40
    rts                                                               ; 3e40: 60

l3e41
    !byte $ce, $cf, $d0, $d0, $d0, $cf                                ; 3e41: ce cf d0...

sub_c3e47
    sta currently_updating_logic_for_room_index                       ; 3e47: 8d ba 1a
    lda update_room_first_update_flag                                 ; 3e4a: ad 2b 13
    beq c3e9d                                                         ; 3e4d: f0 4e
    lda desired_level                                                 ; 3e4f: a5 31
    cmp previous_level                                                ; 3e51: c5 51
    beq c3e60                                                         ; 3e53: f0 0b
    lda #0                                                            ; 3e55: a9 00
    sta l3f1e                                                         ; 3e57: 8d 1e 3f
    sta l3f1f                                                         ; 3e5a: 8d 1f 3f
    sta l3f20                                                         ; 3e5d: 8d 20 3f
c3e60
    lda desired_room_index                                            ; 3e60: a5 30
    cmp currently_updating_logic_for_room_index                       ; 3e62: cd ba 1a
    bne c3e9a                                                         ; 3e65: d0 33
    lda #4                                                            ; 3e67: a9 04
    sta temp_sprite_x_offset                                          ; 3e69: 85 3a
    lda #$c8                                                          ; 3e6b: a9 c8
    jsr draw_sprite_a_at_cell_xy                                      ; 3e6d: 20 4c 1f
    dex                                                               ; 3e70: ca
    dey                                                               ; 3e71: 88
    dey                                                               ; 3e72: 88
    dey                                                               ; 3e73: 88
    lda #3                                                            ; 3e74: a9 03
    sta width_in_cells                                                ; 3e76: 85 3c
    sta height_in_cells                                               ; 3e78: 85 3d
    lda #3                                                            ; 3e7a: a9 03
    sta value_to_write_to_collision_map                               ; 3e7c: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e7e: 20 44 1e
    ldx #2                                                            ; 3e81: a2 02
    jsr set_object_position_from_current_sprite_position              ; 3e83: 20 6d 1f
    lda #1                                                            ; 3e86: a9 01
    sta object_direction,x                                            ; 3e88: 9d be 09
    lda #$ff                                                          ; 3e8b: a9 ff
    sta object_sprite_mask_type,x                                     ; 3e8d: 9d ac 38
    sta object_z_order,x                                              ; 3e90: 9d c2 38
    ldx #$cc                                                          ; 3e93: a2 cc
    ldy #$44 ; 'D'                                                    ; 3e95: a0 44
    jsr define_envelope                                               ; 3e97: 20 5e 39
c3e9a
    jmp c3efd                                                         ; 3e9a: 4c fd 3e

c3e9d
    lda desired_room_index                                            ; 3e9d: a5 30
    cmp currently_updating_logic_for_room_index                       ; 3e9f: cd ba 1a
    bne c3eb6                                                         ; 3ea2: d0 12
    ldx #$0b                                                          ; 3ea4: a2 0b
    ldy #2                                                            ; 3ea6: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 3ea8: 20 e2 28
    beq c3eb6                                                         ; 3eab: f0 09
    lda l3f1e                                                         ; 3ead: ad 1e 3f
    clc                                                               ; 3eb0: 18
    adc #$10                                                          ; 3eb1: 69 10
    sta l3f1f                                                         ; 3eb3: 8d 1f 3f
c3eb6
    ldy #0                                                            ; 3eb6: a0 00
    lda l3f1e                                                         ; 3eb8: ad 1e 3f
    cmp l3f1f                                                         ; 3ebb: cd 1f 3f
    beq c3efd                                                         ; 3ebe: f0 3d
    ldy l3f20                                                         ; 3ec0: ac 20 3f
    iny                                                               ; 3ec3: c8
    cpy #$0a                                                          ; 3ec4: c0 0a
    bcc c3ecd                                                         ; 3ec6: 90 05
    ldy #0                                                            ; 3ec8: a0 00
    inc l3f1e                                                         ; 3eca: ee 1e 3f
c3ecd
    sty l3f20                                                         ; 3ecd: 8c 20 3f
    lda desired_room_index                                            ; 3ed0: a5 30
    cmp currently_updating_logic_for_room_index                       ; 3ed2: cd ba 1a
    bne c3efd                                                         ; 3ed5: d0 26
    cpy #2                                                            ; 3ed7: c0 02
    bne c3ee7                                                         ; 3ed9: d0 0c
    lda #0                                                            ; 3edb: a9 00
    ldx #$e2                                                          ; 3edd: a2 e2
    ldy #$44 ; 'D'                                                    ; 3edf: a0 44
    jsr play_sound_yx                                                 ; 3ee1: 20 f6 38
    jmp c3ef4                                                         ; 3ee4: 4c f4 3e

c3ee7
    cpy #7                                                            ; 3ee7: c0 07
    bne c3efd                                                         ; 3ee9: d0 12
    lda #0                                                            ; 3eeb: a9 00
    ldx #$ea                                                          ; 3eed: a2 ea
    ldy #$44 ; 'D'                                                    ; 3eef: a0 44
    jsr play_sound_yx                                                 ; 3ef1: 20 f6 38
c3ef4
    lda #0                                                            ; 3ef4: a9 00
    ldx #$da                                                          ; 3ef6: a2 da
    ldy #$44 ; 'D'                                                    ; 3ef8: a0 44
    jsr play_sound_yx                                                 ; 3efa: 20 f6 38
c3efd
    lda desired_room_index                                            ; 3efd: a5 30
    cmp currently_updating_logic_for_room_index                       ; 3eff: cd ba 1a
    bne c3f0d                                                         ; 3f02: d0 09
    ldy l3f20                                                         ; 3f04: ac 20 3f
    lda l3f21,y                                                       ; 3f07: b9 21 3f
    sta l09aa                                                         ; 3f0a: 8d aa 09
c3f0d
    lda l3f1e                                                         ; 3f0d: ad 1e 3f
    cmp l3f1f                                                         ; 3f10: cd 1f 3f
    bne c3f1d                                                         ; 3f13: d0 08
    lda #0                                                            ; 3f15: a9 00
    sta l3f1e                                                         ; 3f17: 8d 1e 3f
    sta l3f1f                                                         ; 3f1a: 8d 1f 3f
c3f1d
    rts                                                               ; 3f1d: 60

l3f1e
    !byte 0                                                           ; 3f1e: 00
l3f1f
    !byte 0                                                           ; 3f1f: 00
l3f20
    !byte 0                                                           ; 3f20: 00
l3f21
    !byte $c9, $ca, $cb, $cb, $ca, $c9, $cc, $cd, $cd, $cc            ; 3f21: c9 ca cb...
l3f2b
    !byte $d6, $d6, $d6, $d3                                          ; 3f2b: d6 d6 d6...

sub_c3f2f
    lda update_room_first_update_flag                                 ; 3f2f: ad 2b 13
    beq c3f53                                                         ; 3f32: f0 1f
    lda desired_level                                                 ; 3f34: a5 31
    cmp previous_level                                                ; 3f36: c5 51
    beq c3f3f                                                         ; 3f38: f0 05
    lda #0                                                            ; 3f3a: a9 00
    sta l0a75                                                         ; 3f3c: 8d 75 0a
c3f3f
    ldx #$ae                                                          ; 3f3f: a2 ae
    ldy #$44 ; 'D'                                                    ; 3f41: a0 44
    jsr define_envelope                                               ; 3f43: 20 5e 39
    lda #$d4                                                          ; 3f46: a9 d4
    sta l2ee9                                                         ; 3f48: 8d e9 2e
    lda #$d3                                                          ; 3f4b: a9 d3
    sta l2eee                                                         ; 3f4d: 8d ee 2e
    jmp c3f6d                                                         ; 3f50: 4c 6d 3f

c3f53
    lda #$d4                                                          ; 3f53: a9 d4
    cmp player_held_object_for_spriteid_wizard6                       ; 3f55: cd b6 2e
    beq c3f62                                                         ; 3f58: f0 08
    lda #0                                                            ; 3f5a: a9 00
    sta l0a75                                                         ; 3f5c: 8d 75 0a
    jmp c3f6d                                                         ; 3f5f: 4c 6d 3f

c3f62
    ldy l0a75                                                         ; 3f62: ac 75 0a
    cpy #3                                                            ; 3f65: c0 03
    beq c3f6d                                                         ; 3f67: f0 04
    iny                                                               ; 3f69: c8
    sty l0a75                                                         ; 3f6a: 8c 75 0a
c3f6d
    ldy l0a75                                                         ; 3f6d: ac 75 0a
    lda l3f2b,y                                                       ; 3f70: b9 2b 3f
    sta five_byte_table_paired_with_collectable_sprite_ids + 1        ; 3f73: 8d f3 2e
    lda update_room_first_update_flag                                 ; 3f76: ad 2b 13
    bne c3f81                                                         ; 3f79: d0 06
    dey                                                               ; 3f7b: 88
    bne c3f81                                                         ; 3f7c: d0 03
    jsr sub_c3f82                                                     ; 3f7e: 20 82 3f
c3f81
    rts                                                               ; 3f81: 60

sub_c3f82
    lda #0                                                            ; 3f82: a9 00
    ldx #$bc                                                          ; 3f84: a2 bc
    ldy #$44 ; 'D'                                                    ; 3f86: a0 44
    jsr play_sound_yx                                                 ; 3f88: 20 f6 38
    ldx #$c4                                                          ; 3f8b: a2 c4
    ldy #$44 ; 'D'                                                    ; 3f8d: a0 44
    jsr play_sound_yx                                                 ; 3f8f: 20 f6 38
    rts                                                               ; 3f92: 60

; *************************************************************************************
; 
; Room 2 initialisation
; 
; *************************************************************************************
room_2_data
    !byte 14                                                          ; 3f93: 0e                      ; initial player X cell
    !byte 20                                                          ; 3f94: 14                      ; initial player Y cell

room_2_initialisation_code
    lda #$26 ; '&'                                                    ; 3f95: a9 26
    sta source_sprite_memory_low                                      ; 3f97: 85 40
    lda #$45 ; 'E'                                                    ; 3f99: a9 45
    sta source_sprite_memory_high                                     ; 3f9b: 85 41
    ldx #0                                                            ; 3f9d: a2 00
    ldy #0                                                            ; 3f9f: a0 00
    lda #$ff                                                          ; 3fa1: a9 ff
    sta width_in_cells                                                ; 3fa3: 85 3c
    lda #2                                                            ; 3fa5: a9 02
    sta height_in_cells                                               ; 3fa7: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fa9: 20 bb 1a
    ldy #2                                                            ; 3fac: a0 02
    lda #6                                                            ; 3fae: a9 06
    sta width_in_cells                                                ; 3fb0: 85 3c
    dec height_in_cells                                               ; 3fb2: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3fb4: 20 bb 1a
    ldx #$22 ; '"'                                                    ; 3fb7: a2 22
    jsr copy_rectangle_of_memory_to_screen                            ; 3fb9: 20 bb 1a
    ldx #$12                                                          ; 3fbc: a2 12
    dec width_in_cells                                                ; 3fbe: c6 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3fc0: 20 bb 1a
    ldx #0                                                            ; 3fc3: a2 00
    iny                                                               ; 3fc5: c8
    lda #5                                                            ; 3fc6: a9 05
    sta width_in_cells                                                ; 3fc8: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3fca: 20 bb 1a
    ldx #$23 ; '#'                                                    ; 3fcd: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 3fcf: 20 bb 1a
    ldx #$13                                                          ; 3fd2: a2 13
    lda #3                                                            ; 3fd4: a9 03
    sta width_in_cells                                                ; 3fd6: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3fd8: 20 bb 1a
    ldx #0                                                            ; 3fdb: a2 00
    iny                                                               ; 3fdd: c8
    lda #4                                                            ; 3fde: a9 04
    sta width_in_cells                                                ; 3fe0: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3fe2: 20 bb 1a
    ldx #$24 ; '$'                                                    ; 3fe5: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 3fe7: 20 bb 1a
    inx                                                               ; 3fea: e8
    iny                                                               ; 3feb: c8
    lda #4                                                            ; 3fec: a9 04
    sta height_in_cells                                               ; 3fee: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ff0: 20 bb 1a
    ldx #0                                                            ; 3ff3: a2 00
    dec width_in_cells                                                ; 3ff5: c6 3c
    lda #8                                                            ; 3ff7: a9 08
    sta height_in_cells                                               ; 3ff9: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3ffb: 20 bb 1a
    ldy #$12                                                          ; 3ffe: a0 12
    lda #5                                                            ; 4000: a9 05
    sta width_in_cells                                                ; 4002: 85 3c
    lda #2                                                            ; 4004: a9 02
    sta height_in_cells                                               ; 4006: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4008: 20 bb 1a
    ldy #$14                                                          ; 400b: a0 14
    lda #$ff                                                          ; 400d: a9 ff
    sta width_in_cells                                                ; 400f: 85 3c
    sta height_in_cells                                               ; 4011: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4013: 20 bb 1a
    ldx #$23 ; '#'                                                    ; 4016: a2 23
    ldy #$0f                                                          ; 4018: a0 0f
    lda #5                                                            ; 401a: a9 05
    sta height_in_cells                                               ; 401c: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 401e: 20 bb 1a
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 4021: 20 90 1b
    ldx #9                                                            ; 4024: a2 09
    ldy #2                                                            ; 4026: a0 02
    lda #$10                                                          ; 4028: a9 10
    jsr draw_rope                                                     ; 402a: 20 b9 1d
    lda #3                                                            ; 402d: a9 03
    sta width_in_cells                                                ; 402f: 85 3c
    lda #2                                                            ; 4031: a9 02
    sta height_in_cells                                               ; 4033: 85 3d
    ldx #$13                                                          ; 4035: a2 13
    ldy #$12                                                          ; 4037: a0 12
    lda #$d5                                                          ; 4039: a9 d5
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 403b: 20 57 1f
    ldx #$1a                                                          ; 403e: a2 1a
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 4040: 20 57 1f
    ldx #$1d                                                          ; 4043: a2 1d
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 4045: 20 57 1f
    ldx #$20 ; ' '                                                    ; 4048: a2 20
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 404a: 20 57 1f
    jsr start_room                                                    ; 404d: 20 bb 12
loop_c4050
    jsr game_update                                                   ; 4050: 20 da 12
    sta l0070                                                         ; 4053: 85 70
    and #1                                                            ; 4055: 29 01
    beq c4060                                                         ; 4057: f0 07
    ldx #0                                                            ; 4059: a2 00
    ldy desired_level                                                 ; 405b: a4 31
    jmp initialise_level                                              ; 405d: 4c 40 11

c4060
    lda l0070                                                         ; 4060: a5 70
    and #4                                                            ; 4062: 29 04
    beq loop_c4050                                                    ; 4064: f0 ea
    ldx #3                                                            ; 4066: a2 03
    ldy desired_level                                                 ; 4068: a4 31
    jmp initialise_level                                              ; 406a: 4c 40 11

sub_c406d
    lda l0a72                                                         ; 406d: ad 72 0a
    sta l3f1e                                                         ; 4070: 8d 1e 3f
    lda l0a73                                                         ; 4073: ad 73 0a
    sta l3f1f                                                         ; 4076: 8d 1f 3f
    lda l0a74                                                         ; 4079: ad 74 0a
    sta l3f20                                                         ; 407c: 8d 20 3f
    lda #2                                                            ; 407f: a9 02
    ldx #$0d                                                          ; 4081: a2 0d
    ldy #$0b                                                          ; 4083: a0 0b
    jsr sub_c3e47                                                     ; 4085: 20 47 3e
    lda l3f1e                                                         ; 4088: ad 1e 3f
    sta l0a72                                                         ; 408b: 8d 72 0a
    lda l3f1f                                                         ; 408e: ad 1f 3f
    sta l0a73                                                         ; 4091: 8d 73 0a
    lda l3f20                                                         ; 4094: ad 20 3f
    sta l0a74                                                         ; 4097: 8d 74 0a
    lda update_room_first_update_flag                                 ; 409a: ad 2b 13
    beq c40d8                                                         ; 409d: f0 39
    lda desired_level                                                 ; 409f: a5 31
    cmp previous_level                                                ; 40a1: c5 51
    beq c40b1                                                         ; 40a3: f0 0c
    lda l0a06                                                         ; 40a5: ad 06 0a
    cmp #2                                                            ; 40a8: c9 02
    bcc c40b1                                                         ; 40aa: 90 05
    lda #$ff                                                          ; 40ac: a9 ff
    sta l0a06                                                         ; 40ae: 8d 06 0a
c40b1
    lda desired_room_index                                            ; 40b1: a5 30
    cmp #2                                                            ; 40b3: c9 02
    bne c40d5                                                         ; 40b5: d0 1e
    ldx #$0d                                                          ; 40b7: a2 0d
    ldy #$0b                                                          ; 40b9: a0 0b
    lda #4                                                            ; 40bb: a9 04
    sta temp_sprite_x_offset                                          ; 40bd: 85 3a
    lda #$d1                                                          ; 40bf: a9 d1
    jsr draw_sprite_a_at_cell_xy                                      ; 40c1: 20 4c 1f
    ldx #3                                                            ; 40c4: a2 03
    lda #1                                                            ; 40c6: a9 01
    sta object_direction,x                                            ; 40c8: 9d be 09
    lda #$c0                                                          ; 40cb: a9 c0
    sta object_z_order,x                                              ; 40cd: 9d c2 38
    lda #$d7                                                          ; 40d0: a9 d7
    sta object_sprite_mask_type,x                                     ; 40d2: 9d ac 38
c40d5
    jmp c4152                                                         ; 40d5: 4c 52 41

c40d8
    lda l0a06                                                         ; 40d8: ad 06 0a
    bmi c4152                                                         ; 40db: 30 75
    cmp #1                                                            ; 40dd: c9 01
    beq c4127                                                         ; 40df: f0 46
    bcs c4140                                                         ; 40e1: b0 5d
    lda desired_room_index                                            ; 40e3: a5 30
    cmp #2                                                            ; 40e5: c9 02
    bne c4152                                                         ; 40e7: d0 69
    lda player_held_object_for_spriteid_wizard6                       ; 40e9: ad b6 2e
    cmp #$d4                                                          ; 40ec: c9 d4
    bne c4152                                                         ; 40ee: d0 62
    lda object_y_low                                                  ; 40f0: ad 7c 09
    cmp #$40 ; '@'                                                    ; 40f3: c9 40
    bcs c4152                                                         ; 40f5: b0 5b
    lda #2                                                            ; 40f7: a9 02
    sta temp_bottom_offset                                            ; 40f9: 8d 51 25
    lda #0                                                            ; 40fc: a9 00
    jsr get_solid_rock_collision_for_object_a                         ; 40fe: 20 94 28
    and #2                                                            ; 4101: 29 02
    beq c4152                                                         ; 4103: f0 4d
    lda #$d4                                                          ; 4105: a9 d4
    jsr remove_item_from_toolbar_menu                                 ; 4107: 20 e0 2b
    lda #1                                                            ; 410a: a9 01
    sta l0a06                                                         ; 410c: 8d 06 0a
    lda #0                                                            ; 410f: a9 00
    sta player_held_object_menu_item_spriteid                         ; 4111: 85 52
    sta object_spriteid+1                                             ; 4113: 8d a9 09
    lda player_held_object_for_spriteid_wizard6                       ; 4116: ad b6 2e
    cmp #$d4                                                          ; 4119: c9 d4
    bne c4127                                                         ; 411b: d0 0a
    lda #0                                                            ; 411d: a9 00
    sta player_held_object_for_spriteid_wizard6                       ; 411f: 8d b6 2e
    lda #$36 ; '6'                                                    ; 4122: a9 36
    sta object_spriteid                                               ; 4124: 8d a8 09
c4127
    lda l0a72                                                         ; 4127: ad 72 0a
    cmp l0a73                                                         ; 412a: cd 73 0a
    beq c4152                                                         ; 412d: f0 23
    lda #$0f                                                          ; 412f: a9 0f
    sta l0a06                                                         ; 4131: 8d 06 0a
    lda desired_room_index                                            ; 4134: a5 30
    cmp #2                                                            ; 4136: c9 02
    bne c4152                                                         ; 4138: d0 18
    jsr sub_c3f82                                                     ; 413a: 20 82 3f
    jmp c4152                                                         ; 413d: 4c 52 41

c4140
    lda l0a06                                                         ; 4140: ad 06 0a
    clc                                                               ; 4143: 18
    adc #2                                                            ; 4144: 69 02
    sta l0a06                                                         ; 4146: 8d 06 0a
    cmp #$28 ; '('                                                    ; 4149: c9 28
    bcc c4152                                                         ; 414b: 90 05
    lda #$ff                                                          ; 414d: a9 ff
    sta l0a06                                                         ; 414f: 8d 06 0a
c4152
    lda desired_room_index                                            ; 4152: a5 30
    cmp #2                                                            ; 4154: c9 02
    bne c4182                                                         ; 4156: d0 2a
    lda #0                                                            ; 4158: a9 00
    sta l09ab                                                         ; 415a: 8d ab 09
    lda l0a06                                                         ; 415d: ad 06 0a
    bmi c4182                                                         ; 4160: 30 20
    cmp #2                                                            ; 4162: c9 02
    bcc c4182                                                         ; 4164: 90 1c
    tax                                                               ; 4166: aa
    lda #5                                                            ; 4167: a9 05
    sta temp_sprite_x_offset                                          ; 4169: 85 3a
    ldy #9                                                            ; 416b: a0 09
    sta temp_sprite_y_offset                                          ; 416d: 85 3b
    lda #3                                                            ; 416f: a9 03
    jsr set_object_position_from_cell_xy                              ; 4171: 20 5d 1f
    lda #$d6                                                          ; 4174: a9 d6
    sta l09ab                                                         ; 4176: 8d ab 09
    cpx #$15                                                          ; 4179: e0 15
    bcc c4182                                                         ; 417b: 90 05
    lda #$d3                                                          ; 417d: a9 d3
    sta l09ab                                                         ; 417f: 8d ab 09
c4182
    lda #0                                                            ; 4182: a9 00
    sta l42dc                                                         ; 4184: 8d dc 42
    lda l0a06                                                         ; 4187: ad 06 0a
    cmp #$1b                                                          ; 418a: c9 1b
    bcc c4191                                                         ; 418c: 90 03
    dec l42dc                                                         ; 418e: ce dc 42
c4191
    lda l0a07                                                         ; 4191: ad 07 0a
    sta l42d8                                                         ; 4194: 8d d8 42
    ldy #$10                                                          ; 4197: a0 10
    sty l42db                                                         ; 4199: 8c db 42
    lda #2                                                            ; 419c: a9 02
    ldx #$1b                                                          ; 419e: a2 1b
    ldy #$0b                                                          ; 41a0: a0 0b
    jsr sub_c41d2                                                     ; 41a2: 20 d2 41
    lda l42d8                                                         ; 41a5: ad d8 42
    sta l0a07                                                         ; 41a8: 8d 07 0a
    lda update_room_first_update_flag                                 ; 41ab: ad 2b 13
    bne c41c0                                                         ; 41ae: d0 10
    lda desired_room_index                                            ; 41b0: a5 30
    cmp #2                                                            ; 41b2: c9 02
    bne c41c0                                                         ; 41b4: d0 0a
    lda l0a07                                                         ; 41b6: ad 07 0a
    cmp #$10                                                          ; 41b9: c9 10
    bne c41c0                                                         ; 41bb: d0 03
    jsr sub_c41c1                                                     ; 41bd: 20 c1 41
c41c0
    rts                                                               ; 41c0: 60

sub_c41c1
    lda #0                                                            ; 41c1: a9 00
    ldx #$1e                                                          ; 41c3: a2 1e
    ldy #$45 ; 'E'                                                    ; 41c5: a0 45
    jsr play_sound_yx                                                 ; 41c7: 20 f6 38
    ldx #$16                                                          ; 41ca: a2 16
    ldy #$45 ; 'E'                                                    ; 41cc: a0 45
    jsr play_sound_yx                                                 ; 41ce: 20 f6 38
    rts                                                               ; 41d1: 60

sub_c41d2
    sta currently_updating_logic_for_room_index                       ; 41d2: 8d ba 1a
    stx l42d9                                                         ; 41d5: 8e d9 42
    sty l42da                                                         ; 41d8: 8c da 42
    lda update_room_first_update_flag                                 ; 41db: ad 2b 13
    beq c422d                                                         ; 41de: f0 4d
    lda desired_level                                                 ; 41e0: a5 31
    cmp previous_level                                                ; 41e2: c5 51
    beq c41f0                                                         ; 41e4: f0 0a
    lda l42d8                                                         ; 41e6: ad d8 42
    beq c41f0                                                         ; 41e9: f0 05
    lda #$ff                                                          ; 41eb: a9 ff
    sta l42d8                                                         ; 41ed: 8d d8 42
c41f0
    lda desired_room_index                                            ; 41f0: a5 30
    cmp currently_updating_logic_for_room_index                       ; 41f2: cd ba 1a
    bne c4227                                                         ; 41f5: d0 30
    ldx l42d9                                                         ; 41f7: ae d9 42
    ldy #2                                                            ; 41fa: a0 02
    lda l42da                                                         ; 41fc: ad da 42
    sec                                                               ; 41ff: 38
    sbc #3                                                            ; 4200: e9 03
    jsr draw_rope                                                     ; 4202: 20 b9 1d
    ldy l42da                                                         ; 4205: ac da 42
    dey                                                               ; 4208: 88
    dey                                                               ; 4209: 88
    lda #4                                                            ; 420a: a9 04
    sta l0015                                                         ; 420c: 85 15
    lda #$0a                                                          ; 420e: a9 0a
    jsr draw_sprite_a_at_cell_xy                                      ; 4210: 20 4c 1f
    lda #5                                                            ; 4213: a9 05
    jsr set_object_position_from_cell_xy                              ; 4215: 20 5d 1f
    lda #$d5                                                          ; 4218: a9 d5
    sta l09ac                                                         ; 421a: 8d ac 09
    lda #$d8                                                          ; 421d: a9 d8
    sta l38b2                                                         ; 421f: 8d b2 38
    lda #$e0                                                          ; 4222: a9 e0
    sta l38c8                                                         ; 4224: 8d c8 38
c4227
    jmp c427f                                                         ; 4227: 4c 7f 42

c422a
    jmp c42d7                                                         ; 422a: 4c d7 42

c422d
    lda l42d8                                                         ; 422d: ad d8 42
    bmi c422a                                                         ; 4230: 30 f8
    bne c4246                                                         ; 4232: d0 12
    lda l42dc                                                         ; 4234: ad dc 42
    beq c422a                                                         ; 4237: f0 f1
    lda l42da                                                         ; 4239: ad da 42
    sta l42d8                                                         ; 423c: 8d d8 42
    lda desired_room_index                                            ; 423f: a5 30
    cmp currently_updating_logic_for_room_index                       ; 4241: cd ba 1a
    bne c4246                                                         ; 4244: d0 00
c4246
    ldy l42d8                                                         ; 4246: ac d8 42
    sty l0070                                                         ; 4249: 84 70
    cpy l42db                                                         ; 424b: cc db 42
    bcc c4258                                                         ; 424e: 90 08
    lda #$ff                                                          ; 4250: a9 ff
    sta l42d8                                                         ; 4252: 8d d8 42
    jmp c427f                                                         ; 4255: 4c 7f 42

c4258
    iny                                                               ; 4258: c8
    sty l42d8                                                         ; 4259: 8c d8 42
    lda desired_room_index                                            ; 425c: a5 30
    cmp currently_updating_logic_for_room_index                       ; 425e: cd ba 1a
    bne c42d7                                                         ; 4261: d0 74
    ldx l42d9                                                         ; 4263: ae d9 42
    dex                                                               ; 4266: ca
    ldy l0070                                                         ; 4267: a4 70
    lda #3                                                            ; 4269: a9 03
    sta width_in_cells                                                ; 426b: 85 3c
    lda #2                                                            ; 426d: a9 02
    sta height_in_cells                                               ; 426f: 85 3d
    lda #0                                                            ; 4271: a9 00
    sta value_to_write_to_collision_map                               ; 4273: 85 3e
    jsr l1efa                                                         ; 4275: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 4278: c5 3e
    beq c427f                                                         ; 427a: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 427c: 20 44 1e
c427f
    lda desired_room_index                                            ; 427f: a5 30
    cmp currently_updating_logic_for_room_index                       ; 4281: cd ba 1a
    bne c42d7                                                         ; 4284: d0 51
    lda l42d8                                                         ; 4286: ad d8 42
    bmi c42a6                                                         ; 4289: 30 1b
    bne c4298                                                         ; 428b: d0 0b
    lda #$d9                                                          ; 428d: a9 d9
    sta l09ae                                                         ; 428f: 8d ae 09
    ldy l42da                                                         ; 4292: ac da 42
    jmp c42b3                                                         ; 4295: 4c b3 42

c4298
    tay                                                               ; 4298: a8
    lda #$dc                                                          ; 4299: a9 dc
    sta l09ad                                                         ; 429b: 8d ad 09
    lda #$da                                                          ; 429e: a9 da
    sta l09ae                                                         ; 42a0: 8d ae 09
    jmp c42b3                                                         ; 42a3: 4c b3 42

c42a6
    lda #$dc                                                          ; 42a6: a9 dc
    sta l09ad                                                         ; 42a8: 8d ad 09
    lda #$db                                                          ; 42ab: a9 db
    sta l09ae                                                         ; 42ad: 8d ae 09
    ldy l42db                                                         ; 42b0: ac db 42
c42b3
    ldx l42d9                                                         ; 42b3: ae d9 42
    dex                                                               ; 42b6: ca
    lda #4                                                            ; 42b7: a9 04
    jsr set_object_position_from_cell_xy                              ; 42b9: 20 5d 1f
    lda #6                                                            ; 42bc: a9 06
    jsr set_object_position_from_cell_xy                              ; 42be: 20 5d 1f
    lda #3                                                            ; 42c1: a9 03
    sta width_in_cells                                                ; 42c3: 85 3c
    lda #2                                                            ; 42c5: a9 02
    sta height_in_cells                                               ; 42c7: 85 3d
    lda #3                                                            ; 42c9: a9 03
    sta value_to_write_to_collision_map                               ; 42cb: 85 3e
    jsr l1efa                                                         ; 42cd: 20 fa 1e
    cmp value_to_write_to_collision_map                               ; 42d0: c5 3e
    beq c42d7                                                         ; 42d2: f0 03
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 42d4: 20 44 1e
c42d7
    rts                                                               ; 42d7: 60

l42d8
    !byte 0                                                           ; 42d8: 00
l42d9
    !byte 0                                                           ; 42d9: 00
l42da
    !byte 0                                                           ; 42da: 00
l42db
    !byte 0                                                           ; 42db: 00
l42dc
    !byte 0                                                           ; 42dc: 00

sub_c42dd
    lda update_room_first_update_flag                                 ; 42dd: ad 2b 13
    beq c4319                                                         ; 42e0: f0 37
    lda #$de                                                          ; 42e2: a9 de
    sta l2eea                                                         ; 42e4: 8d ea 2e
    lda #$dd                                                          ; 42e7: a9 dd
    sta l2eef                                                         ; 42e9: 8d ef 2e
    sta l2ef4                                                         ; 42ec: 8d f4 2e
    lda desired_room_index                                            ; 42ef: a5 30
    cmp #2                                                            ; 42f1: c9 02
    bne c4318                                                         ; 42f3: d0 23
    lda l0a09                                                         ; 42f5: ad 09 0a
    bne c4318                                                         ; 42f8: d0 1e
    ldx #$14                                                          ; 42fa: a2 14
    ldy #$11                                                          ; 42fc: a0 11
    lda #7                                                            ; 42fe: a9 07
    jsr set_object_position_from_cell_xy                              ; 4300: 20 5d 1f
    tax                                                               ; 4303: aa
    lda #1                                                            ; 4304: a9 01
    sta object_direction,x                                            ; 4306: 9d be 09
    lda #$df                                                          ; 4309: a9 df
    sta object_sprite_mask_type,x                                     ; 430b: 9d ac 38
    lda #$c0                                                          ; 430e: a9 c0
    sta object_z_order,x                                              ; 4310: 9d c2 38
    lda #$dd                                                          ; 4313: a9 dd
    sta object_spriteid,x                                             ; 4315: 9d a8 09
c4318
    rts                                                               ; 4318: 60

c4319
    lda desired_room_index                                            ; 4319: a5 30
    cmp #2                                                            ; 431b: c9 02
    bne c433c                                                         ; 431d: d0 1d
    lda l0a09                                                         ; 431f: ad 09 0a
    bne c433c                                                         ; 4322: d0 18
    ldx #$0b                                                          ; 4324: a2 0b
    ldy #7                                                            ; 4326: a0 07
    jsr test_for_collision_between_objects_x_and_y                    ; 4328: 20 e2 28
    beq c433c                                                         ; 432b: f0 0f
    lda #$de                                                          ; 432d: a9 de
    jsr find_or_create_menu_slot_for_A                                ; 432f: 20 bd 2b
    lda #0                                                            ; 4332: a9 00
    sta l09af                                                         ; 4334: 8d af 09
    lda #$ff                                                          ; 4337: a9 ff
    sta l0a09                                                         ; 4339: 8d 09 0a
c433c
    rts                                                               ; 433c: 60

; *************************************************************************************
; 
; Room 3 initialisation
; 
; *************************************************************************************
room_3_data
    !byte 20                                                          ; 433d: 14                      ; initial player X cell
    !byte 7                                                           ; 433e: 07                      ; initial player Y cell

room_3_initialisation_code
    lda #$26 ; '&'                                                    ; 433f: a9 26
    sta source_sprite_memory_low                                      ; 4341: 85 40
    lda #$45 ; 'E'                                                    ; 4343: a9 45
    sta source_sprite_memory_high                                     ; 4345: 85 41
    ldx #0                                                            ; 4347: a2 00
    ldy #0                                                            ; 4349: a0 00
    lda #$ff                                                          ; 434b: a9 ff
    sta width_in_cells                                                ; 434d: 85 3c
    lda #2                                                            ; 434f: a9 02
    sta height_in_cells                                               ; 4351: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4353: 20 bb 1a
    ldy #2                                                            ; 4356: a0 02
    lda #6                                                            ; 4358: a9 06
    sta width_in_cells                                                ; 435a: 85 3c
    dec height_in_cells                                               ; 435c: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 435e: 20 bb 1a
    ldx #$22 ; '"'                                                    ; 4361: a2 22
    jsr copy_rectangle_of_memory_to_screen                            ; 4363: 20 bb 1a
    ldx #0                                                            ; 4366: a2 00
    iny                                                               ; 4368: c8
    dec width_in_cells                                                ; 4369: c6 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 436b: 20 bb 1a
    ldx #$23 ; '#'                                                    ; 436e: a2 23
    jsr copy_rectangle_of_memory_to_screen                            ; 4370: 20 bb 1a
    ldx #0                                                            ; 4373: a2 00
    iny                                                               ; 4375: c8
    dec width_in_cells                                                ; 4376: c6 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 4378: 20 bb 1a
    ldx #$24 ; '$'                                                    ; 437b: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 437d: 20 bb 1a
    ldx #0                                                            ; 4380: a2 00
    iny                                                               ; 4382: c8
    dec width_in_cells                                                ; 4383: c6 3c
    lda #4                                                            ; 4385: a9 04
    sta height_in_cells                                               ; 4387: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4389: 20 bb 1a
    ldx #$25 ; '%'                                                    ; 438c: a2 25
    lda #$11                                                          ; 438e: a9 11
    sta height_in_cells                                               ; 4390: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4392: 20 bb 1a
    ldx #0                                                            ; 4395: a2 00
    ldy #$0f                                                          ; 4397: a0 0f
    lda #5                                                            ; 4399: a9 05
    sta width_in_cells                                                ; 439b: 85 3c
    lda #2                                                            ; 439d: a9 02
    sta height_in_cells                                               ; 439f: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43a1: 20 bb 1a
    ldy #$11                                                          ; 43a4: a0 11
    lda #3                                                            ; 43a6: a9 03
    sta width_in_cells                                                ; 43a8: 85 3c
    lda #5                                                            ; 43aa: a9 05
    sta height_in_cells                                               ; 43ac: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43ae: 20 bb 1a
    ldy #$16                                                          ; 43b1: a0 16
    lda #$ff                                                          ; 43b3: a9 ff
    sta width_in_cells                                                ; 43b5: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 43b7: 20 bb 1a
    ldx #$0c                                                          ; 43ba: a2 0c
    dey                                                               ; 43bc: 88
    lda #$11                                                          ; 43bd: a9 11
    sta width_in_cells                                                ; 43bf: 85 3c
    lda #1                                                            ; 43c1: a9 01
    sta height_in_cells                                               ; 43c3: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43c5: 20 bb 1a
    inx                                                               ; 43c8: e8
    dey                                                               ; 43c9: 88
    lda #$0f                                                          ; 43ca: a9 0f
    sta width_in_cells                                                ; 43cc: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 43ce: 20 bb 1a
    ldx #$0d                                                          ; 43d1: a2 0d
    ldy #7                                                            ; 43d3: a0 07
    lda #$0f                                                          ; 43d5: a9 0f
    sta width_in_cells                                                ; 43d7: 85 3c
    lda #2                                                            ; 43d9: a9 02
    sta height_in_cells                                               ; 43db: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 43dd: 20 bb 1a
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 43e0: 20 90 1b
    ldx #9                                                            ; 43e3: a2 09
    ldy #2                                                            ; 43e5: a0 02
    lda #$12                                                          ; 43e7: a9 12
    jsr draw_rope                                                     ; 43e9: 20 b9 1d
    ldx #$1e                                                          ; 43ec: a2 1e
    jsr draw_rope                                                     ; 43ee: 20 b9 1d
    lda #$0b                                                          ; 43f1: a9 0b
    sta width_in_cells                                                ; 43f3: 85 3c
    lda #2                                                            ; 43f5: a9 02
    sta height_in_cells                                               ; 43f7: 85 3d
    ldx #$0f                                                          ; 43f9: a2 0f
    ldy #$12                                                          ; 43fb: a0 12
    lda #$d2                                                          ; 43fd: a9 d2
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 43ff: 20 57 1f
    ldx #$13                                                          ; 4402: a2 13
    jsr draw_sprite_a_at_cell_xy                                      ; 4404: 20 4c 1f
    ldx #$17                                                          ; 4407: a2 17
    jsr draw_sprite_a_at_cell_xy                                      ; 4409: 20 4c 1f
    lda #3                                                            ; 440c: a9 03
    sta width_in_cells                                                ; 440e: 85 3c
    ldx #$0f                                                          ; 4410: a2 0f
    ldy #$10                                                          ; 4412: a0 10
    lda #$d5                                                          ; 4414: a9 d5
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 4416: 20 57 1f
    ldx #$17                                                          ; 4419: a2 17
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 441b: 20 57 1f
    ldx #$14                                                          ; 441e: a2 14
    ldy #$0b                                                          ; 4420: a0 0b
    lda #$3b ; ';'                                                    ; 4422: a9 3b
    jsr draw_sprite_a_at_cell_xy                                      ; 4424: 20 4c 1f
    lda #3                                                            ; 4427: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 4429: 20 bb 1e
    jsr start_room                                                    ; 442c: 20 bb 12
loop_c442f
    jsr game_update                                                   ; 442f: 20 da 12
    and #1                                                            ; 4432: 29 01
    beq loop_c442f                                                    ; 4434: f0 f9
    ldx #2                                                            ; 4436: a2 02
    ldy desired_level                                                 ; 4438: a4 31
    jmp initialise_level                                              ; 443a: 4c 40 11

sub_c443d
    lda #3                                                            ; 443d: a9 03
    sta currently_updating_logic_for_room_index                       ; 443f: 8d ba 1a
    lda #3                                                            ; 4442: a9 03
    ldx #$14                                                          ; 4444: a2 14
    ldy #$0b                                                          ; 4446: a0 0b
    jsr update_brazier_and_fire                                       ; 4448: 20 88 19
    lda #4                                                            ; 444b: a9 04
    inx                                                               ; 444d: e8
    jsr update_brazier_and_fire                                       ; 444e: 20 88 19
    ldx #$14                                                          ; 4451: a2 14
    lda #4                                                            ; 4453: a9 04
    sta temp_sprite_x_offset                                          ; 4455: 85 3a
    ldy #$12                                                          ; 4457: a0 12
    lda #5                                                            ; 4459: a9 05
    jsr update_level_completion                                       ; 445b: 20 10 1a
    lda desired_room_index                                            ; 445e: a5 30
    cmp #3                                                            ; 4460: c9 03
    bne c44ad                                                         ; 4462: d0 49
    lda update_room_first_update_flag                                 ; 4464: ad 2b 13
    beq c4495                                                         ; 4467: f0 2c
    lda l0a06                                                         ; 4469: ad 06 0a
    cmp #2                                                            ; 446c: c9 02
    bcc c44ad                                                         ; 446e: 90 3d
    ldx #$23 ; '#'                                                    ; 4470: a2 23
    lda #3                                                            ; 4472: a9 03
    sta temp_sprite_x_offset                                          ; 4474: 85 3a
    ldy #$15                                                          ; 4476: a0 15
    lda #2                                                            ; 4478: a9 02
    jsr set_object_position_from_cell_xy                              ; 447a: 20 5d 1f
    tax                                                               ; 447d: aa
    lda #1                                                            ; 447e: a9 01
    sta object_direction,x                                            ; 4480: 9d be 09
    lda #$d7                                                          ; 4483: a9 d7
    sta object_sprite_mask_type,x                                     ; 4485: 9d ac 38
    lda #$c0                                                          ; 4488: a9 c0
    sta object_z_order,x                                              ; 448a: 9d c2 38
    lda #$d3                                                          ; 448d: a9 d3
    sta object_spriteid,x                                             ; 448f: 9d a8 09
    jmp c44ad                                                         ; 4492: 4c ad 44

c4495
    ldx #$0b                                                          ; 4495: a2 0b
    ldy #2                                                            ; 4497: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 4499: 20 e2 28
    beq c44ad                                                         ; 449c: f0 0f
    lda #$d4                                                          ; 449e: a9 d4
    jsr find_or_create_menu_slot_for_A                                ; 44a0: 20 bd 2b
    lda #0                                                            ; 44a3: a9 00
    sta l09aa                                                         ; 44a5: 8d aa 09
    lda #0                                                            ; 44a8: a9 00
    sta l0a06                                                         ; 44aa: 8d 06 0a
c44ad
    rts                                                               ; 44ad: 60

    !byte   5,   1,   0,   0,   0,   0,   0,   0, $28, $f6, $f6, $ec  ; 44ae: 05 01 00...
    !byte $64,   0, $13,   0,   5,   0, $95,   0,   3,   0,   3,   0  ; 44ba: 64 00 13...
    !byte   5,   0, $89,   0,   2,   0,   6,   1,   0,   0,   0,   0  ; 44c6: 05 00 89...
    !byte   0,   0, $64, $ce, $ce, $9c, $64,   0, $10,   0,   6,   0  ; 44d2: 00 00 64...
    !byte   7,   0,   1,   0, $11,   0,   0,   0, $fa,   0,   0,   0  ; 44de: 07 00 01...
    !byte $11,   0,   0,   0, $be,   0,   0,   0,   7,   1, $ff,   0  ; 44ea: 11 00 00...
    !byte   0,   1,   1,   0, $78, $fc,   0, $f8, $78,   0, $13,   0  ; 44f6: 00 01 01...
    !byte   7,   0, $c8,   0,   1,   0,   7,   1,   0,   0,   0,   0  ; 4502: 07 00 c8...
    !byte   0,   0, $37,   0,   0, $fa, $6e, $37, $10,   0,   7,   0  ; 450e: 00 00 37...
    !byte   7,   0,   1,   0, $11,   0,   0,   0, $d2,   0,   1,   0  ; 451a: 07 00 01...
    !byte $20, $10, $88, $44, $23, $10,   8,   8,   4,   8, $11, $e2  ; 4526: 20 10 88...
    !byte   4,   8,   8,   8, $10, $10, $10, $20, $47, $88, $10, $20  ; 4532: 04 08 08...
    !byte $10, $10,   8, $c4, $22, $11,   8,   4                      ; 453e: 10 10 08...
sprite_data
    !byte $30,   0, $e9,   0,   6,   1, $29,   1, $4f,   1, $72,   1  ; 4546: 30 00 e9...
    !byte $98,   1, $a1,   1, $d1,   1, $33,   2, $64,   2, $ec,   2  ; 4552: 98 01 a1...
    !byte   7,   3, $27,   3, $a0,   3, $bc,   3, $da,   3,   2,   4  ; 455e: 07 03 27...
    !byte $1a,   4, $32,   4, $52,   4, $62,   4, $82,   4, $a4,   4  ; 456a: 1a 04 32...
    !byte $f3, $ff, $1b, $1d, $aa, $aa, $aa, $aa, $80, $0e, $aa, $aa  ; 4576: f3 ff 1b...
    !byte $aa, $a8, $45, $4e, $a0,   0,   0,   0, $51, $13, $a1, $55  ; 4582: aa a8 45...
    !byte $55, $55, $44, $54, $e1,   0,   0,   0,   1, $44, $4c, $41  ; 458e: 55 55 44...
    !byte $55, $55, $55,   4, $54, $c4, $51, $50, $15, $14, $51, $53  ; 459a: 55 55 55...
    !byte $11, $14, $15,   5, $10, $44, $4c, $45, $45, $45, $45, $51  ; 45a6: 11 14 15...
    !byte $45, $4c, $45, $15, $55, $51, $50, $45, $4c, $45, $15, $55  ; 45b2: 45 4c 45...
    !byte $11, $54, $51, $13, $11, $15, $55, $15, $15,   4, $54, $c4  ; 45be: 11 54 51...
    !byte $45, $55, $15, $45, $51, $45, $4c, $44, $45, $45, $44, $55  ; 45ca: 45 55 15...
    !byte   4, $54, $c4, $45, $54, $55, $45, $51, $44, $4c, $44, $55  ; 45d6: 04 54 c4...
    !byte $51, $54, $54, $11, $53, $11, $45, $55, $14, $55, $14, $54  ; 45e2: 51 54 54...
    !byte $c4, $51, $55, $55, $15,   4, $44, $c4, $54, $54, $54, $55  ; 45ee: c4 51 55...
    !byte $14, $54, $c4, $45,   5, $41, $44, $11, $13, $11, $45, $40  ; 45fa: 14 54 c4...
    !byte $54, $51, $45, $4c, $41, $55, $55, $55,   4, $54, $e1,   0  ; 4606: 54 51 45...
    !byte   0,   0,   1, $44, $4e, $85, $15, $55, $45, $11, $53, $a8  ; 4612: 00 00 01...
    !byte $20,   0,   8, $14, $44, $ea, $aa, $aa, $aa, $84, $54, $ea  ; 461e: 20 00 08...
    !byte $aa, $aa, $aa, $a0,   3, $fc, $0f,   9, $10, $a8, $0e, $85  ; 462a: aa aa aa...
    !byte $4e, $15, $53, $15, $55,   8, $88, $c5, $55, $44, $44, $71  ; 4636: 4e 15 53...
    !byte $15, $50, $88, $8e, $10, $53, $a1, $53, $a8, $0c,   0, $0d  ; 4642: 15 50 88...
    !byte $0b, $0e, $aa, $aa, $aa, $0e, $aa, $aa, $81, $7a, $80, $a0  ; 464e: 0b 0e aa...
    !byte $50, $e8, $54, $14, $38, $55, $40, $c5, $55, $4c, $55, $54  ; 465a: 50 e8 54...
    !byte $c4, $55, $4e, $10, $53, $a1, $53, $a8, $0c,   1, $0b, $0d  ; 4666: c4 55 4e...
    !byte $0c, $aa, $aa, $a8, $ea, $aa, $a8, $7a, $aa, $a8, $4e, $aa  ; 4672: 0c aa aa...
    !byte $a8, $4e, $a0, $21, $3a, $15, $13, $85, $54, $c5, $55, $4c  ; 467e: a8 4e a0...
    !byte $55, $54, $c4, $55, $4e, $10, $53, $a1, $53, $a8, $0c, $f6  ; 468a: 55 54 c4...
    !byte $0d, $0b, $0e, $a8, $0e, $85, $4e, $15, $53, $15, $55, $31  ; 4696: 0d 0b 0e...
    !byte $55, $53, $11, $55, $38, $41, $40, $e8, $54, $14, $3a, $80  ; 46a2: 55 53 11...
    !byte $a0, $50, $ea, $aa, $a8, $17, $aa, $aa, $aa, $0c, $f3, $0b  ; 46ae: a0 50 ea...
    !byte $0d, $0c, $a8, $0e, $85, $4e, $15, $53, $15, $55, $31, $55  ; 46ba: 0d 0c a8...
    !byte $53, $11, $55, $38, $41, $4e, $85, $44, $ea,   2, $13, $aa  ; 46c6: 53 11 55...
    !byte $aa, $13, $aa, $aa, $84, $ea, $aa, $a8, $7a, $aa, $aa, $8c  ; 46d2: aa 13 aa...
    !byte $0a, $f9,   2,   8, $55, $55, $c0,   0, $30, $0a, $fb, $10  ; 46de: 0a f9 02...
    !byte $0b, $a5, $11, $5e, $95, $15, $3a, $a1, $21, $3a, $a8, $a1  ; 46ea: 0b a5 11...
    !byte $3a, $a1, $21, $3a, $a8, $a1, $3a,   1, $21, $38, $50, $a1  ; 46f6: 3a a1 21...
    !byte $38, $55,   8, $c4, $55, $4c, $51, $55, $38, $51, $54, $e1  ; 4702: 38 55 08...
    !byte $54, $53, $a1, $55, $3a, $80, $4e, $aa, $8c, $0a, $fb, $28  ; 470e: 54 53 a1...
    !byte $0e, $a5, $11, $5e, $95, $15, $0e, $a8, $4a, $13, $aa, $8a  ; 471a: 0e a5 11...
    !byte $84, $ea, $84, $a8, $4e, $aa, $2a, $84, $ea, $84, $aa, $13  ; 4726: 84 ea 84...
    !byte $aa, $8a, $a8, $4e, $a8, $4a, $a8, $ea, $a3, $aa, $13, $aa  ; 4732: aa 8a a8...
    !byte $8e, $a8, $4e, $aa, $3a, $a1, $3a, $a8, $ea, $84, $ea, $a3  ; 473e: 8e a8 4e...
    !byte $aa, $13, $aa, $8e, $a8, $4e, $aa, $3a, $a1, $3a, $a8, $ea  ; 474a: aa 13 aa...
    !byte $84, $ea, $a3, $aa, $13, $aa, $8e, $a8, $4e, $aa, $3a,   1  ; 4756: 84 ea a3...
    !byte $38, $50, $e1, $54, $31, $15, $53, $14, $55, $4e, $14, $55  ; 4762: 38 50 e1...
    !byte $38, $55, $14, $e8, $55, $4e, $a0, $44, $ea, $a2, $30, $0a  ; 476e: 38 55 14...
    !byte   0, $0b, $13, $aa, $a9, $44, $57, $aa, $a9, $51, $50, $ea  ; 477a: 00 0b 13...
    !byte $aa, $a1, $28, $4e, $aa, $aa, $8a, $84, $ea, $aa, $a1, $2a  ; 4786: aa a1 28...
    !byte $13, $aa, $aa, $12, $a8, $4e, $aa, $aa, $2a, $a8, $4e, $88  ; 4792: 13 aa aa...
    !byte $88, $4a, $a8, $4e, $11, $11, $2a, $aa, $31, $22, $23, $8c  ; 479e: 88 4a a8...
    !byte   0, $0e, $18, $15, $aa, $aa, $aa,   0,   0, $ea, $aa, $aa  ; 47aa: 00 0e 18...
    !byte $14, $55, $4e,   0,   0,   1, $45, $54, $c5, $55, $55, $14  ; 47b6: 14 55 4e...
    !byte $45, $4c, $44, $44, $41, $14, $44, $e0,   0,   0, $14, $44  ; 47c2: 45 4c 44...
    !byte $4e, $a1, $55,   0, $45, $44, $ea, $80,   0, $14, $55, $4e  ; 47ce: 4e a1 55...
    !byte $aa, $aa, $a1, $45, $14, $ea, $aa, $aa, $14, $51, $4e, $aa  ; 47da: aa aa a1...
    !byte $aa, $a0, $44, $54, $ea, $aa, $aa, $14, $45, $4e, $aa, $aa  ; 47e6: aa a0 44...
    !byte $a1, $44, $44, $ea, $aa, $aa, $14, $54, $4e, $aa, $aa, $a1  ; 47f2: a1 44 44...
    !byte $45, $44, $ea, $aa, $aa, $10, $44, $4e, $a8,   0,   1, $44  ; 47fe: 45 44 ea...
    !byte $54, $ea, $15, $50, $14, $45, $4e,   0,   0,   1, $15, $14  ; 480a: 54 ea 15...
    !byte $c5, $55, $55, $14, $51, $4c, $44, $44, $41, $45, $54, $e0  ; 4816: c5 55 55...
    !byte   0,   0, $14, $45, $4e, $aa, $aa, $a1, $45, $54, $ea, $aa  ; 4822: 00 00 14...
    !byte $aa, $80,   0, $30, $ff,   6, $0a, $0a, $a0, $e1, $43, $85  ; 482e: aa 80 00...
    !byte $50, $c4, $55, $4c, $51, $55, $38, $51, $54, $e1, $54, $53  ; 483a: 50 c4 55...
    !byte $a1, $55, $3a, $80, $4e, $aa, $8c,   5, $0e, $0a, $0a,   0  ; 4846: a1 55 3a...
    !byte $11, $1d, $14,   1, $30, $55,   1, $c4, $55, $43, $14, $55  ; 4852: 11 1d 14...
    !byte $4c, $14, $55, $30, $55, $14, $d0, $55, $43, $10,   4, $1d  ; 485e: 4c 14 55...
    !byte $11,   1, $30,   0, $0e, $18, $14, $aa, $a0,   0, $0e, $a8  ; 486a: 11 01 30...
    !byte $15, $55, $43, $a8, $55, $55, $55, $3a, $15, $55, $55, $54  ; 4876: 15 55 43...
    !byte $e8, $55, $55, $55, $53, $85, $55, $55, $55, $53, $85, $55  ; 4882: e8 55 55...
    !byte $55, $55, $53, $15, $55, $55, $55, $54, $c5, $55, $55, $55  ; 488e: 55 55 53...
    !byte $55, $31, $55, $55, $55, $55, $4c, $55, $55, $55, $55, $53  ; 489a: 55 31 55...
    !byte   5, $55, $55, $55, $54, $c5, $55, $55, $55, $55, $31, $15  ; 48a6: 05 55 55...
    !byte $55, $55, $55, $4c, $15, $55, $55, $55, $53, $15, $55, $55  ; 48b2: 55 55 55...
    !byte $55, $54, $c4, $55, $55, $55, $55, $38, $55, $55, $55, $55  ; 48be: 55 54 c4...
    !byte $38, $45, $55, $55, $55, $3a, $14, $55, $55, $54, $e8, $45  ; 48ca: 38 45 55...
    !byte $15, $55, $13, $a8, $51, $11,   5, $3a, $a0, $44, $45, $0e  ; 48d6: 15 55 13...
    !byte $aa, $80,   0, $30, $ff,   6, $0a, $0a, $a0, $e1, $43, $85  ; 48e2: aa 80 00...
    !byte $50, $c4, $55, $4c, $51, $55, $38, $51, $54, $e1, $54, $53  ; 48ee: 50 c4 55...
    !byte $a1, $55, $3a, $81, $13, $aa, $88, $c0,   0,   0,   0,   0  ; 48fa: a1 55 3a...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4906: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4912: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 491e: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 492a: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4936: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   9, $fe,   5, $0f, $40,   0  ; 4942: 00 00 00...
    !byte   0,   3, $15, $15, $15, $17,   5, $45, $45, $47, $11, $51  ; 494e: 00 03 15...
    !byte $41, $53, $40,   0, $20,   3,   8, $fe,   7, $0b, $54, $aa  ; 495a: 41 53 40...
    !byte $34,   0, $0a, $31, $51, $40, $c1, $51, $0c, $45, $44, $0d  ; 4966: 34 00 0a...
    !byte   0,   0, $35, $4a, $aa, $30,   4,   3, $0b, $0a, $45, $53  ; 4972: 00 00 35...
    !byte $50, $14, $d5, $11, $34,   5, $13, $11, $44, $35,   5, $13  ; 497e: 50 14 d5...
    !byte $45, $11, $4d, $55, $14, $35, $54,   4, $d5, $51, $4d, $55  ; 498a: 45 11 4d...
    !byte $40, $c0,   0,   6,   7,   7, $a3, $28,   3, $80, $17, $a8  ; 4996: 40 c0 00...
    !byte $47,   1, $53, $80,   3, $30, $ff,   6,   9, $0c, $a0, $aa  ; 49a2: 47 01 53...
    !byte $0e, $14, $a1, $4c, $41,   4, $13, $14, $14,   4, $c5, $40  ; 49ae: 0e 14 a1...
    !byte   1, $31, $41, $40, $4c, $41,   4, $13, $85, $28, $53, $a0  ; 49ba: 01 31 41...
    !byte $aa, $0c,   5, $0f,   9, $0c, $40,   4,   0, $c1, $40, $14  ; 49c6: aa 0c 05...
    !byte $31,   4, $10, $4c, $50, $50, $13, $15,   0,   4, $c5,   5  ; 49d2: 31 04 10...
    !byte   1, $31,   4, $10, $4c, $14,   1, $43, $40,   4,   0, $c0  ; 49de: 01 31 04...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 49ea: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 49f6: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4a02: 00 00 00...
    !byte   0,   0,   0,   0                                          ; 4a0e: 00 00 00...
pydis_end

; Automatically generated labels:
;     c3b02
;     c3b0c
;     c3b1b
;     c3bfb
;     c3c1a
;     c3c51
;     c3c80
;     c3db6
;     c3dce
;     c3dd1
;     c3df3
;     c3e11
;     c3e1b
;     c3e2b
;     c3e3a
;     c3e3d
;     c3e40
;     c3e60
;     c3e9a
;     c3e9d
;     c3eb6
;     c3ecd
;     c3ee7
;     c3ef4
;     c3efd
;     c3f0d
;     c3f1d
;     c3f3f
;     c3f53
;     c3f62
;     c3f6d
;     c3f81
;     c4060
;     c40b1
;     c40d5
;     c40d8
;     c4127
;     c4140
;     c4152
;     c4182
;     c4191
;     c41c0
;     c41f0
;     c4227
;     c422a
;     c422d
;     c4246
;     c4258
;     c427f
;     c4298
;     c42a6
;     c42b3
;     c42d7
;     c4318
;     c4319
;     c433c
;     c4495
;     c44ad
;     l0015
;     l0070
;     l09aa
;     l09ab
;     l09ac
;     l09ad
;     l09ae
;     l09af
;     l0a05
;     l0a06
;     l0a07
;     l0a08
;     l0a09
;     l0a6f
;     l0a70
;     l0a71
;     l0a72
;     l0a73
;     l0a74
;     l0a75
;     l1efa
;     l2ee9
;     l2eea
;     l2eee
;     l2eef
;     l2ef4
;     l38b2
;     l38c8
;     l3e41
;     l3f1e
;     l3f1f
;     l3f20
;     l3f21
;     l3f2b
;     l42d8
;     l42d9
;     l42da
;     l42db
;     l42dc
;     loop_c3beb
;     loop_c3d58
;     loop_c4050
;     loop_c442f
;     sub_c3c08
;     sub_c3d66
;     sub_c3e47
;     sub_c3f2f
;     sub_c3f82
;     sub_c406d
;     sub_c41c1
;     sub_c41d2
;     sub_c42dd
;     sub_c443d
!if (level_specific_initialisation) != $3af2 {
    !error "Assertion failed: level_specific_initialisation == $3af2"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b1c {
    !error "Assertion failed: level_specific_update == $3b1c"
}
!if (room_0_data) != $3b2f {
    !error "Assertion failed: room_0_data == $3b2f"
}
!if (room_1_data) != $3c81 {
    !error "Assertion failed: room_1_data == $3c81"
}
!if (room_2_data) != $3f93 {
    !error "Assertion failed: room_2_data == $3f93"
}
!if (room_3_data) != $433d {
    !error "Assertion failed: room_3_data == $433d"
}
!if (sprite_data - level_data) != $0a71 {
    !error "Assertion failed: sprite_data - level_data == $0a71"
}
