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
previous_room_index                                 = $50
level_before_latest_level_and_room_initialisation   = $51
player_held_object_spriteid                         = $52
developer_mode_sideways_ram_is_set_up_flag          = $5b
l0070                                               = $70
l0071                                               = $71
show_dialog_box                                     = $040a
remove_dialog                                       = $0453
object_x_low                                        = $0950
l0955                                               = $0955
object_x_low_old                                    = $095b
object_x_high                                       = $0966
l096b                                               = $096b
object_x_high_old                                   = $0971
object_y_low                                        = $097c
l097f                                               = $097f
l0980                                               = $0980
l0981                                               = $0981
l0982                                               = $0982
l0983                                               = $0983
object_y_low_old                                    = $0987
object_y_high                                       = $0992
l0997                                               = $0997
object_y_high_old                                   = $099d
object_spriteid                                     = $09a8
l09aa                                               = $09aa
l09ab                                               = $09ab
l09ac                                               = $09ac
l09ad                                               = $09ad
l09ae                                               = $09ae
l09af                                               = $09af
object_spriteid_old                                 = $09b3
l09b6                                               = $09b6
object_direction                                    = $09be
l09c3                                               = $09c3
object_direction_old                                = $09c9
level_progress_table                                = $09ef
l0a0a                                               = $0a0a
l0a0b                                               = $0a0b
l0a0c                                               = $0a0c
l0a0d                                               = $0a0d
l0a6f                                               = $0a6f
l0a70                                               = $0a70
l0a71                                               = $0a71
l0a72                                               = $0a72
l0a73                                               = $0a73
l0a74                                               = $0a74
l0a75                                               = $0a75
l0a76                                               = $0a76
l0a77                                               = $0a77
l0a78                                               = $0a78
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
l18a6                                               = $18a6
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
l2ee9                                               = $2ee9
collectable_spriteids                               = $2eed
l2eee                                               = $2eee
five_byte_table_paired_with_collectable_sprite_ids  = $2ef2
print_encrypted_string_at_yx_centred                = $37f3
wait_one_second_then_check_keys                     = $388d
object_sprite_mask_type                             = $38ac
l38ae                                               = $38ae
object_z_order                                      = $38c2
l38c4                                               = $38c4
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
    !word sprite_data - level_data                                    ; 3ad5: ac 0a                   ; offset to sprite data
level_specific_initialisation_ptr
    !word level_specific_initialisation                               ; 3ad7: f2 3a                   ; address of level initialisation code
level_specific_update_ptr
    !word level_specific_update                                       ; 3ad9: 0d 3b                   ; address of level update code
level_specific_password_ptr
    !word level_specific_password                                     ; 3adb: e7 3a                   ; address of level password
    !byte 0, 0                                                        ; 3add: 00 00
level_room_data_table
    !word room_0_data                                                 ; 3adf: 1d 3b                   ; table of room data/initialisation code
    !word room_1_data                                                 ; 3ae1: 7a 3d
    !word room_2_data                                                 ; 3ae3: dd 40
    !word room_3_data                                                 ; 3ae5: 31 44

; *************************************************************************************
level_specific_password
    !byte $8d, $82, $99, $8e, $e6, $9c, $84, $99, $80, $98, $c6       ; 3ae7: 8d 82 99...

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
    sta l0a0a                                                         ; 3aff: 8d 0a 0a
c3b02
    lda l0a0a                                                         ; 3b02: ad 0a 0a
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
    jsr sub_c3bb3                                                     ; 3b0d: 20 b3 3b
    jsr sub_c3e45                                                     ; 3b10: 20 45 3e
    jsr sub_c41a1                                                     ; 3b13: 20 a1 41
    jsr sub_c44f0                                                     ; 3b16: 20 f0 44
    jsr sub_c3fe5                                                     ; 3b19: 20 e5 3f
    rts                                                               ; 3b1c: 60

; *************************************************************************************
; 
; Room 0 initialisation and game loop
; 
; *************************************************************************************
room_0_data
    !byte 20                                                          ; 3b1d: 14                      ; initial player X cell
    !byte 22                                                          ; 3b1e: 16                      ; initial player Y cell

room_0_code
    lda #$61 ; 'a'                                                    ; 3b1f: a9 61
    sta source_sprite_memory_low                                      ; 3b21: 85 40
    lda #$45 ; 'E'                                                    ; 3b23: a9 45
    sta source_sprite_memory_high                                     ; 3b25: 85 41
    ldx #0                                                            ; 3b27: a2 00
    ldy #0                                                            ; 3b29: a0 00
    lda #3                                                            ; 3b2b: a9 03
    sta width_in_cells                                                ; 3b2d: 85 3c
    lda #$ff                                                          ; 3b2f: a9 ff
    sta height_in_cells                                               ; 3b31: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b33: 20 bb 1a
    ldx #$25 ; '%'                                                    ; 3b36: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 3b38: 20 bb 1a
    ldx #3                                                            ; 3b3b: a2 03
    ldy #$13                                                          ; 3b3d: a0 13
    lda #9                                                            ; 3b3f: a9 09
    sta width_in_cells                                                ; 3b41: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b43: 20 bb 1a
    ldx #$0c                                                          ; 3b46: a2 0c
    ldy #$16                                                          ; 3b48: a0 16
    lda #$19                                                          ; 3b4a: a9 19
    sta width_in_cells                                                ; 3b4c: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b4e: 20 bb 1a
    dey                                                               ; 3b51: 88
    lda #4                                                            ; 3b52: a9 04
    sta width_in_cells                                                ; 3b54: 85 3c
    lda #1                                                            ; 3b56: a9 01
    sta height_in_cells                                               ; 3b58: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b5a: 20 bb 1a
    dey                                                               ; 3b5d: 88
    dec width_in_cells                                                ; 3b5e: c6 3c
    dec width_in_cells                                                ; 3b60: c6 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3b62: 20 bb 1a
    ldx #$0c                                                          ; 3b65: a2 0c
    ldy #0                                                            ; 3b67: a0 00
    lda #$10                                                          ; 3b69: a9 10
    sta width_in_cells                                                ; 3b6b: 85 3c
    lda #2                                                            ; 3b6d: a9 02
    sta height_in_cells                                               ; 3b6f: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3b71: 20 bb 1a
    ldy #9                                                            ; 3b74: a0 09
    jsr copy_rectangle_of_memory_to_screen                            ; 3b76: 20 bb 1a
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3b79: 20 90 1b
    ldx #$1f                                                          ; 3b7c: a2 1f
    ldy #0                                                            ; 3b7e: a0 00
    lda #$10                                                          ; 3b80: a9 10
    jsr draw_rope                                                     ; 3b82: 20 b9 1d
    lda #3                                                            ; 3b85: a9 03
    sta width_in_cells                                                ; 3b87: 85 3c
    lda #2                                                            ; 3b89: a9 02
    sta height_in_cells                                               ; 3b8b: 85 3d
    ldx #$22 ; '"'                                                    ; 3b8d: a2 22
    ldy #$14                                                          ; 3b8f: a0 14
    lda #$c8                                                          ; 3b91: a9 c8
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3b93: 20 57 1f
    ldx #$1f                                                          ; 3b96: a2 1f
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3b98: 20 57 1f
    ldx #$22 ; '"'                                                    ; 3b9b: a2 22
    ldy #$12                                                          ; 3b9d: a0 12
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3b9f: 20 57 1f
    jsr start_room                                                    ; 3ba2: 20 bb 12
loop_c3ba5
    jsr game_update                                                   ; 3ba5: 20 da 12
    and #8                                                            ; 3ba8: 29 08
    beq loop_c3ba5                                                    ; 3baa: f0 f9
    ldx #2                                                            ; 3bac: a2 02
    ldy current_level                                                 ; 3bae: a4 31
    jmp initialise_level_and_room                                     ; 3bb0: 4c 40 11

sub_c3bb3
    lda #0                                                            ; 3bb3: a9 00
    sta currently_updating_logic_for_room_index                       ; 3bb5: 8d ba 1a
    ldx #3                                                            ; 3bb8: a2 03
    ldy #$0a                                                          ; 3bba: a0 0a
    lda #6                                                            ; 3bbc: a9 06
    jsr update_brazier_and_fire                                       ; 3bbe: 20 88 19
    ldx #$25 ; '%'                                                    ; 3bc1: a2 25
    lda #7                                                            ; 3bc3: a9 07
    jsr update_brazier_and_fire                                       ; 3bc5: 20 88 19
    lda l0a6f                                                         ; 3bc8: ad 6f 0a
    sta l3d76                                                         ; 3bcb: 8d 76 3d
    lda l0a0c                                                         ; 3bce: ad 0c 0a
    sta l3d75                                                         ; 3bd1: 8d 75 3d
    ldx #8                                                            ; 3bd4: a2 08
    ldy #0                                                            ; 3bd6: a0 00
    lda #$10                                                          ; 3bd8: a9 10
    jsr sub_c3bea                                                     ; 3bda: 20 ea 3b
    lda l3d76                                                         ; 3bdd: ad 76 3d
    sta l0a6f                                                         ; 3be0: 8d 6f 0a
    lda l3d75                                                         ; 3be3: ad 75 3d
    sta l0a0c                                                         ; 3be6: 8d 0c 0a
    rts                                                               ; 3be9: 60

sub_c3bea
    sta l3d79                                                         ; 3bea: 8d 79 3d
    stx l3d77                                                         ; 3bed: 8e 77 3d
    sty l3d78                                                         ; 3bf0: 8c 78 3d
    lda update_room_first_update_flag                                 ; 3bf3: ad 2b 13
    bne c3bfb                                                         ; 3bf6: d0 03
    jmp c3c89                                                         ; 3bf8: 4c 89 3c

c3bfb
    lda current_level                                                 ; 3bfb: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3bfd: c5 51
    beq c3c0b                                                         ; 3bff: f0 0a
    lda l3d75                                                         ; 3c01: ad 75 3d
    beq c3c0b                                                         ; 3c04: f0 05
    lda #$ff                                                          ; 3c06: a9 ff
    sta l3d75                                                         ; 3c08: 8d 75 3d
c3c0b
    lda desired_room_index                                            ; 3c0b: a5 30
    cmp currently_updating_logic_for_room_index                       ; 3c0d: cd ba 1a
    bne c3c83                                                         ; 3c10: d0 71
    ldx #4                                                            ; 3c12: a2 04
    lda #$d9                                                          ; 3c14: a9 d9
    sta object_sprite_mask_type,x                                     ; 3c16: 9d ac 38
    lda #$e0                                                          ; 3c19: a9 e0
    sta object_z_order,x                                              ; 3c1b: 9d c2 38
    ldx l3d77                                                         ; 3c1e: ae 77 3d
    ldy l3d78                                                         ; 3c21: ac 78 3d
    lda l3d75                                                         ; 3c24: ad 75 3d
    beq c3c6b                                                         ; 3c27: f0 42
    bpl c3c3d                                                         ; 3c29: 10 12
    lda l3d78                                                         ; 3c2b: ad 78 3d
    beq c3c83                                                         ; 3c2e: f0 53
    lda #$d8                                                          ; 3c30: a9 d8
    jsr draw_sprite_a_at_cell_xy                                      ; 3c32: 20 4c 1f
    lda #3                                                            ; 3c35: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3c37: 20 bb 1e
    jmp c3c83                                                         ; 3c3a: 4c 83 3c

c3c3d
    lda l3d76                                                         ; 3c3d: ad 76 3d
    clc                                                               ; 3c40: 18
    adc #3                                                            ; 3c41: 69 03
    lsr                                                               ; 3c43: 4a
    lsr                                                               ; 3c44: 4a
    lsr                                                               ; 3c45: 4a
    sec                                                               ; 3c46: 38
    sbc l3d78                                                         ; 3c47: ed 78 3d
    beq c3c83                                                         ; 3c4a: f0 37
    clc                                                               ; 3c4c: 18
    adc #1                                                            ; 3c4d: 69 01
    jsr draw_rope                                                     ; 3c4f: 20 b9 1d
    sec                                                               ; 3c52: 38
    sbc #1                                                            ; 3c53: e9 01
    clc                                                               ; 3c55: 18
    adc l3d78                                                         ; 3c56: 6d 78 3d
    tay                                                               ; 3c59: a8
    lda #4                                                            ; 3c5a: a9 04
    sta l0015                                                         ; 3c5c: 85 15
    lda #$0a                                                          ; 3c5e: a9 0a
    jsr draw_sprite_a_at_cell_xy                                      ; 3c60: 20 4c 1f
    lda #0                                                            ; 3c63: a9 00
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3c65: 20 bb 1e
    jmp c3c83                                                         ; 3c68: 4c 83 3c

c3c6b
    lda l3d79                                                         ; 3c6b: ad 79 3d
    jsr draw_rope                                                     ; 3c6e: 20 b9 1d
    tya                                                               ; 3c71: 98
    clc                                                               ; 3c72: 18
    adc l3d79                                                         ; 3c73: 6d 79 3d
    tay                                                               ; 3c76: a8
    dey                                                               ; 3c77: 88
    lda #3                                                            ; 3c78: a9 03
    jsr set_object_position_from_cell_xy                              ; 3c7a: 20 5d 1f
    tax                                                               ; 3c7d: aa
    lda #$0a                                                          ; 3c7e: a9 0a
    sta object_spriteid,x                                             ; 3c80: 9d a8 09
c3c83
    jmp c3d26                                                         ; 3c83: 4c 26 3d

c3c86
    jmp c3d74                                                         ; 3c86: 4c 74 3d

c3c89
    lda l3d75                                                         ; 3c89: ad 75 3d
    bmi c3c86                                                         ; 3c8c: 30 f8
    bne c3cbf                                                         ; 3c8e: d0 2f
    lda desired_room_index                                            ; 3c90: a5 30
    cmp currently_updating_logic_for_room_index                       ; 3c92: cd ba 1a
    bne c3c86                                                         ; 3c95: d0 ef
    ldx #2                                                            ; 3c97: a2 02
    ldy #3                                                            ; 3c99: a0 03
    jsr test_for_collision_between_objects_x_and_y                    ; 3c9b: 20 e2 28
    beq c3c86                                                         ; 3c9e: f0 e6
    lda #0                                                            ; 3ca0: a9 00
    sta l09b6                                                         ; 3ca2: 8d b6 09
    lda l3d78                                                         ; 3ca5: ad 78 3d
    clc                                                               ; 3ca8: 18
    adc l3d79                                                         ; 3ca9: 6d 79 3d
    sec                                                               ; 3cac: 38
    sbc #1                                                            ; 3cad: e9 01
    asl                                                               ; 3caf: 0a
    asl                                                               ; 3cb0: 0a
    asl                                                               ; 3cb1: 0a
    ora #5                                                            ; 3cb2: 09 05
    sta l3d76                                                         ; 3cb4: 8d 76 3d
    lda #1                                                            ; 3cb7: a9 01
    sta l3d75                                                         ; 3cb9: 8d 75 3d
    jmp c3d26                                                         ; 3cbc: 4c 26 3d

c3cbf
    lda l3d75                                                         ; 3cbf: ad 75 3d
    cmp #2                                                            ; 3cc2: c9 02
    beq c3cee                                                         ; 3cc4: f0 28
    lda l3d76                                                         ; 3cc6: ad 76 3d
    sec                                                               ; 3cc9: 38
    sbc #4                                                            ; 3cca: e9 04
    sta l3d76                                                         ; 3ccc: 8d 76 3d
    cmp #$c0                                                          ; 3ccf: c9 c0
    bcs c3d12                                                         ; 3cd1: b0 3f
    lsr                                                               ; 3cd3: 4a
    lsr                                                               ; 3cd4: 4a
    lsr                                                               ; 3cd5: 4a
    beq c3d26                                                         ; 3cd6: f0 4e
    cmp l3d78                                                         ; 3cd8: cd 78 3d
    bne c3d26                                                         ; 3cdb: d0 49
    lda #2                                                            ; 3cdd: a9 02
    sta l3d75                                                         ; 3cdf: 8d 75 3d
    lda desired_room_index                                            ; 3ce2: a5 30
    cmp currently_updating_logic_for_room_index                       ; 3ce4: cd ba 1a
    bne c3d26                                                         ; 3ce7: d0 3d
    lda #$ce                                                          ; 3ce9: a9 ce
    sta l09ac                                                         ; 3ceb: 8d ac 09
c3cee
    lda #$ff                                                          ; 3cee: a9 ff
    sta l3d75                                                         ; 3cf0: 8d 75 3d
    lda desired_room_index                                            ; 3cf3: a5 30
    cmp currently_updating_logic_for_room_index                       ; 3cf5: cd ba 1a
    bne c3d26                                                         ; 3cf8: d0 2c
    ldx l3d77                                                         ; 3cfa: ae 77 3d
    ldy l3d78                                                         ; 3cfd: ac 78 3d
    lda #3                                                            ; 3d00: a9 03
    jsr set_object_position_from_cell_xy                              ; 3d02: 20 5d 1f
    lda #$d8                                                          ; 3d05: a9 d8
    sta l09ab                                                         ; 3d07: 8d ab 09
    lda #0                                                            ; 3d0a: a9 00
    sta l09ac                                                         ; 3d0c: 8d ac 09
    jmp c3d26                                                         ; 3d0f: 4c 26 3d

c3d12
    lda #$ff                                                          ; 3d12: a9 ff
    sta l3d75                                                         ; 3d14: 8d 75 3d
    lda desired_room_index                                            ; 3d17: a5 30
    cmp currently_updating_logic_for_room_index                       ; 3d19: cd ba 1a
    bne c3d26                                                         ; 3d1c: d0 08
    lda #0                                                            ; 3d1e: a9 00
    sta l09ab                                                         ; 3d20: 8d ab 09
    sta l09ac                                                         ; 3d23: 8d ac 09
c3d26
    lda desired_room_index                                            ; 3d26: a5 30
    cmp currently_updating_logic_for_room_index                       ; 3d28: cd ba 1a
    bne c3d74                                                         ; 3d2b: d0 47
    lda l3d75                                                         ; 3d2d: ad 75 3d
    cmp #1                                                            ; 3d30: c9 01
    bne c3d74                                                         ; 3d32: d0 40
    lda #$d7                                                          ; 3d34: a9 d7
    sta l09ab                                                         ; 3d36: 8d ab 09
    lda l3d76                                                         ; 3d39: ad 76 3d
    lsr                                                               ; 3d3c: 4a
    lsr                                                               ; 3d3d: 4a
    and #7                                                            ; 3d3e: 29 07
    clc                                                               ; 3d40: 18
    adc #$3c ; '<'                                                    ; 3d41: 69 3c
    sta l09ac                                                         ; 3d43: 8d ac 09
    ldx l3d77                                                         ; 3d46: ae 77 3d
    lda #3                                                            ; 3d49: a9 03
    sta temp_sprite_x_offset                                          ; 3d4b: 85 3a
    ldy #0                                                            ; 3d4d: a0 00
    lda #3                                                            ; 3d4f: a9 03
    jsr set_object_position_from_cell_xy                              ; 3d51: 20 5d 1f
    lda #3                                                            ; 3d54: a9 03
    sta temp_sprite_x_offset                                          ; 3d56: 85 3a
    lda #4                                                            ; 3d58: a9 04
    jsr set_object_position_from_cell_xy                              ; 3d5a: 20 5d 1f
    lda l3d76                                                         ; 3d5d: ad 76 3d
    sta l097f                                                         ; 3d60: 8d 7f 09
    sta l0980                                                         ; 3d63: 8d 80 09
    ldx #8                                                            ; 3d66: a2 08
    lda l3d76                                                         ; 3d68: ad 76 3d
    lsr                                                               ; 3d6b: 4a
    lsr                                                               ; 3d6c: 4a
    lsr                                                               ; 3d6d: 4a
    tay                                                               ; 3d6e: a8
    lda #0                                                            ; 3d6f: a9 00
    jsr write_a_single_value_to_cell_in_collision_map                 ; 3d71: 20 bb 1e
c3d74
    rts                                                               ; 3d74: 60

l3d75
    !byte 0                                                           ; 3d75: 00
l3d76
    !byte 0                                                           ; 3d76: 00
l3d77
    !byte 0                                                           ; 3d77: 00
l3d78
    !byte 0                                                           ; 3d78: 00
l3d79
    !byte 0                                                           ; 3d79: 00
; *************************************************************************************
; 
; Room 1 initialisation and game loop
; 
; *************************************************************************************
room_1_data
    !byte 20                                                          ; 3d7a: 14                      ; initial player X cell
    !byte 22                                                          ; 3d7b: 16                      ; initial player Y cell

room_1_code
    lda #$61 ; 'a'                                                    ; 3d7c: a9 61
    sta source_sprite_memory_low                                      ; 3d7e: 85 40
    lda #$45 ; 'E'                                                    ; 3d80: a9 45
    sta source_sprite_memory_high                                     ; 3d82: 85 41
    ldx #0                                                            ; 3d84: a2 00
    ldy #0                                                            ; 3d86: a0 00
    lda #$ff                                                          ; 3d88: a9 ff
    sta width_in_cells                                                ; 3d8a: 85 3c
    lda #2                                                            ; 3d8c: a9 02
    sta height_in_cells                                               ; 3d8e: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d90: 20 bb 1a
    ldy #2                                                            ; 3d93: a0 02
    lda #4                                                            ; 3d95: a9 04
    sta width_in_cells                                                ; 3d97: 85 3c
    dec height_in_cells                                               ; 3d99: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3d9b: 20 bb 1a
    ldx #$11                                                          ; 3d9e: a2 11
    lda #7                                                            ; 3da0: a9 07
    sta width_in_cells                                                ; 3da2: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 3da4: 20 bb 1a
    ldx #$24 ; '$'                                                    ; 3da7: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 3da9: 20 bb 1a
    ldx #0                                                            ; 3dac: a2 00
    iny                                                               ; 3dae: c8
    lda #3                                                            ; 3daf: a9 03
    sta width_in_cells                                                ; 3db1: 85 3c
    lda #8                                                            ; 3db3: a9 08
    sta height_in_cells                                               ; 3db5: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3db7: 20 bb 1a
    ldx #$25 ; '%'                                                    ; 3dba: a2 25
    jsr copy_rectangle_of_memory_to_screen                            ; 3dbc: 20 bb 1a
    ldx #0                                                            ; 3dbf: a2 00
    ldy #$0b                                                          ; 3dc1: a0 0b
    lda #$11                                                          ; 3dc3: a9 11
    sta width_in_cells                                                ; 3dc5: 85 3c
    lda #2                                                            ; 3dc7: a9 02
    sta height_in_cells                                               ; 3dc9: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3dcb: 20 bb 1a
    ldx #$18                                                          ; 3dce: a2 18
    jsr copy_rectangle_of_memory_to_screen                            ; 3dd0: 20 bb 1a
    ldx #$24 ; '$'                                                    ; 3dd3: a2 24
    ldy #$0d                                                          ; 3dd5: a0 0d
    dec height_in_cells                                               ; 3dd7: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3dd9: 20 bb 1a
    inx                                                               ; 3ddc: e8
    iny                                                               ; 3ddd: c8
    lda #8                                                            ; 3dde: a9 08
    sta height_in_cells                                               ; 3de0: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3de2: 20 bb 1a
    ldx #0                                                            ; 3de5: a2 00
    ldy #$12                                                          ; 3de7: a0 12
    lda #5                                                            ; 3de9: a9 05
    sta width_in_cells                                                ; 3deb: 85 3c
    lda #4                                                            ; 3ded: a9 04
    sta height_in_cells                                               ; 3def: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3df1: 20 bb 1a
    ldy #$16                                                          ; 3df4: a0 16
    lda #$ff                                                          ; 3df6: a9 ff
    sta width_in_cells                                                ; 3df8: 85 3c
    sta height_in_cells                                               ; 3dfa: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 3dfc: 20 bb 1a
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3dff: 20 90 1b
    lda #3                                                            ; 3e02: a9 03
    sta width_in_cells                                                ; 3e04: 85 3c
    lda #2                                                            ; 3e06: a9 02
    sta height_in_cells                                               ; 3e08: 85 3d
    ldx #$22 ; '"'                                                    ; 3e0a: a2 22
    ldy #9                                                            ; 3e0c: a0 09
    lda #$c9                                                          ; 3e0e: a9 c9
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3e10: 20 57 1f
    ldx #$1f                                                          ; 3e13: a2 1f
    lda #$c8                                                          ; 3e15: a9 c8
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3e17: 20 57 1f
    ldx #6                                                            ; 3e1a: a2 06
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3e1c: 20 57 1f
    ldx #3                                                            ; 3e1f: a2 03
    lda #$c9                                                          ; 3e21: a9 c9
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3e23: 20 57 1f
    ldy #7                                                            ; 3e26: a0 07
    lda #$c8                                                          ; 3e28: a9 c8
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3e2a: 20 57 1f
    ldx #5                                                            ; 3e2d: a2 05
    ldy #$14                                                          ; 3e2f: a0 14
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3e31: 20 57 1f
    jsr start_room                                                    ; 3e34: 20 bb 12
loop_c3e37
    jsr game_update                                                   ; 3e37: 20 da 12
    and #1                                                            ; 3e3a: 29 01
    beq loop_c3e37                                                    ; 3e3c: f0 f9
    ldx #2                                                            ; 3e3e: a2 02
    ldy current_level                                                 ; 3e40: a4 31
    jmp initialise_level_and_room                                     ; 3e42: 4c 40 11

sub_c3e45
    lda #1                                                            ; 3e45: a9 01
    sta currently_updating_logic_for_room_index                       ; 3e47: 8d ba 1a
    lda #8                                                            ; 3e4a: a9 08
    ldx #$25 ; '%'                                                    ; 3e4c: a2 25
    ldy #$11                                                          ; 3e4e: a0 11
    jsr update_brazier_and_fire                                       ; 3e50: 20 88 19
    lda l0a70                                                         ; 3e53: ad 70 0a
    sta l3d76                                                         ; 3e56: 8d 76 3d
    lda l0a0d                                                         ; 3e59: ad 0d 0a
    sta l3d75                                                         ; 3e5c: 8d 75 3d
    ldx #$14                                                          ; 3e5f: a2 14
    ldy #3                                                            ; 3e61: a0 03
    lda #$11                                                          ; 3e63: a9 11
    jsr sub_c3bea                                                     ; 3e65: 20 ea 3b
    lda l3d76                                                         ; 3e68: ad 76 3d
    sta l0a70                                                         ; 3e6b: 8d 70 0a
    lda l3d75                                                         ; 3e6e: ad 75 3d
    sta l0a0d                                                         ; 3e71: 8d 0d 0a
    lda update_room_first_update_flag                                 ; 3e74: ad 2b 13
    beq c3ede                                                         ; 3e77: f0 65
    lda current_level                                                 ; 3e79: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3e7b: c5 51
    beq c3e89                                                         ; 3e7d: f0 0a
    lda l0a0b                                                         ; 3e7f: ad 0b 0a
    beq c3e89                                                         ; 3e82: f0 05
    lda #$ff                                                          ; 3e84: a9 ff
    sta l0a0b                                                         ; 3e86: 8d 0b 0a
c3e89
    lda desired_room_index                                            ; 3e89: a5 30
    cmp #1                                                            ; 3e8b: c9 01
    bne c3ed8                                                         ; 3e8d: d0 49
    ldx #5                                                            ; 3e8f: a2 05
    ldy #$12                                                          ; 3e91: a0 12
    lda #5                                                            ; 3e93: a9 05
    jsr set_object_position_from_cell_xy                              ; 3e95: 20 5d 1f
    tax                                                               ; 3e98: aa
    lda #$d1                                                          ; 3e99: a9 d1
    sta object_sprite_mask_type,x                                     ; 3e9b: 9d ac 38
    lda #$c0                                                          ; 3e9e: a9 c0
    sta object_z_order,x                                              ; 3ea0: 9d c2 38
    ldx #5                                                            ; 3ea3: a2 05
    lda #6                                                            ; 3ea5: a9 06
    sta temp_sprite_x_offset                                          ; 3ea7: 85 3a
    ldy #$12                                                          ; 3ea9: a0 12
    lda #6                                                            ; 3eab: a9 06
    jsr set_object_position_from_cell_xy                              ; 3ead: 20 5d 1f
    tax                                                               ; 3eb0: aa
    lda #$ff                                                          ; 3eb1: a9 ff
    sta object_direction,x                                            ; 3eb3: 9d be 09
    lda #$d2                                                          ; 3eb6: a9 d2
    sta object_sprite_mask_type,x                                     ; 3eb8: 9d ac 38
    lda #$a0                                                          ; 3ebb: a9 a0
    sta object_z_order,x                                              ; 3ebd: 9d c2 38
    ldx #7                                                            ; 3ec0: a2 07
    lda #2                                                            ; 3ec2: a9 02
    sta temp_sprite_x_offset                                          ; 3ec4: 85 3a
    ldy #$12                                                          ; 3ec6: a0 12
    lda #7                                                            ; 3ec8: a9 07
    jsr set_object_position_from_cell_xy                              ; 3eca: 20 5d 1f
    tax                                                               ; 3ecd: aa
    lda #$d3                                                          ; 3ece: a9 d3
    sta object_sprite_mask_type,x                                     ; 3ed0: 9d ac 38
    lda #$a0                                                          ; 3ed3: a9 a0
    sta object_z_order,x                                              ; 3ed5: 9d c2 38
c3ed8
    jmp c3f04                                                         ; 3ed8: 4c 04 3f

c3edb
    jmp c3fe4                                                         ; 3edb: 4c e4 3f

c3ede
    ldy l0a0b                                                         ; 3ede: ac 0b 0a
    bmi c3f04                                                         ; 3ee1: 30 21
    bne c3ef4                                                         ; 3ee3: d0 0f
    lda desired_room_index                                            ; 3ee5: a5 30
    cmp #1                                                            ; 3ee7: c9 01
    bne c3f04                                                         ; 3ee9: d0 19
    ldx #2                                                            ; 3eeb: a2 02
    ldy #5                                                            ; 3eed: a0 05
    jsr test_for_collision_between_objects_x_and_y                    ; 3eef: 20 e2 28
    beq c3f04                                                         ; 3ef2: f0 10
c3ef4
    ldy l0a0b                                                         ; 3ef4: ac 0b 0a
    iny                                                               ; 3ef7: c8
    sty l0a0b                                                         ; 3ef8: 8c 0b 0a
    cpy #$30 ; '0'                                                    ; 3efb: c0 30
    bcc c3f04                                                         ; 3efd: 90 05
    ldy #$ff                                                          ; 3eff: a0 ff
    sty l0a0b                                                         ; 3f01: 8c 0b 0a
c3f04
    lda desired_room_index                                            ; 3f04: a5 30
    cmp #1                                                            ; 3f06: c9 01
    bne c3edb                                                         ; 3f08: d0 d1
    ldx #5                                                            ; 3f0a: a2 05
    ldy #$12                                                          ; 3f0c: a0 12
    lda #3                                                            ; 3f0e: a9 03
    sta width_in_cells                                                ; 3f10: 85 3c
    lda #2                                                            ; 3f12: a9 02
    sta height_in_cells                                               ; 3f14: 85 3d
    lda l0a0b                                                         ; 3f16: ad 0b 0a
    beq c3f20                                                         ; 3f19: f0 05
    bpl c3f30                                                         ; 3f1b: 10 13
    jmp c3fb5                                                         ; 3f1d: 4c b5 3f

c3f20
    lda #$c9                                                          ; 3f20: a9 c9
    sta l09ad                                                         ; 3f22: 8d ad 09
    lda #0                                                            ; 3f25: a9 00
    sta l09ae                                                         ; 3f27: 8d ae 09
    sta l09af                                                         ; 3f2a: 8d af 09
    jmp c3fdd                                                         ; 3f2d: 4c dd 3f

c3f30
    lda l0a0b                                                         ; 3f30: ad 0b 0a
    and #7                                                            ; 3f33: 29 07
    clc                                                               ; 3f35: 18
    adc #$3c ; '<'                                                    ; 3f36: 69 3c
    sta l09ae                                                         ; 3f38: 8d ae 09
    lda l0a0b                                                         ; 3f3b: ad 0b 0a
    clc                                                               ; 3f3e: 18
    adc #4                                                            ; 3f3f: 69 04
    and #7                                                            ; 3f41: 29 07
    adc #$3c ; '<'                                                    ; 3f43: 69 3c
    sta l09af                                                         ; 3f45: 8d af 09
    lda l0a0b                                                         ; 3f48: ad 0b 0a
    cmp #$24 ; '$'                                                    ; 3f4b: c9 24
    bcs c3f96                                                         ; 3f4d: b0 47
    cmp #$18                                                          ; 3f4f: c9 18
    bcs c3f86                                                         ; 3f51: b0 33
    cmp #$0c                                                          ; 3f53: c9 0c
    bcs c3f76                                                         ; 3f55: b0 1f
    lda #$c9                                                          ; 3f57: a9 c9
    sta l09ad                                                         ; 3f59: 8d ad 09
    lda #$8e                                                          ; 3f5c: a9 8e
    sta l0982                                                         ; 3f5e: 8d 82 09
    sta l0983                                                         ; 3f61: 8d 83 09
    lda l0a0b                                                         ; 3f64: ad 0b 0a
    cmp #2                                                            ; 3f67: c9 02
    bcs c3fdd                                                         ; 3f69: b0 72
    lda #$ce                                                          ; 3f6b: a9 ce
    sta l09ae                                                         ; 3f6d: 8d ae 09
    sta l09af                                                         ; 3f70: 8d af 09
    jmp c3fdd                                                         ; 3f73: 4c dd 3f

c3f76
    lda #$d4                                                          ; 3f76: a9 d4
    sta l09ad                                                         ; 3f78: 8d ad 09
    lda #$92                                                          ; 3f7b: a9 92
    sta l0982                                                         ; 3f7d: 8d 82 09
    sta l0983                                                         ; 3f80: 8d 83 09
    jmp c3fdd                                                         ; 3f83: 4c dd 3f

c3f86
    lda #$d5                                                          ; 3f86: a9 d5
    sta l09ad                                                         ; 3f88: 8d ad 09
    lda #$97                                                          ; 3f8b: a9 97
    sta l0982                                                         ; 3f8d: 8d 82 09
    sta l0983                                                         ; 3f90: 8d 83 09
    jmp c3fd3                                                         ; 3f93: 4c d3 3f

c3f96
    lda #$d6                                                          ; 3f96: a9 d6
    sta l09ad                                                         ; 3f98: 8d ad 09
    lda #$9d                                                          ; 3f9b: a9 9d
    sta l0982                                                         ; 3f9d: 8d 82 09
    sta l0983                                                         ; 3fa0: 8d 83 09
    lda l0a0b                                                         ; 3fa3: ad 0b 0a
    cmp #$2f ; '/'                                                    ; 3fa6: c9 2f
    bcc c3fd3                                                         ; 3fa8: 90 29
    lda #$ce                                                          ; 3faa: a9 ce
    sta l09ae                                                         ; 3fac: 8d ae 09
    sta l09af                                                         ; 3faf: 8d af 09
    jmp c3fd3                                                         ; 3fb2: 4c d3 3f

c3fb5
    lda #$d6                                                          ; 3fb5: a9 d6
    sta l09ad                                                         ; 3fb7: 8d ad 09
    lda #0                                                            ; 3fba: a9 00
    sta l09ae                                                         ; 3fbc: 8d ae 09
    sta l09af                                                         ; 3fbf: 8d af 09
    lda #0                                                            ; 3fc2: a9 00
    sta value_to_write_to_collision_map                               ; 3fc4: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3fc6: 20 44 1e
    lda #0                                                            ; 3fc9: a9 00
    sta value_to_write_to_collision_map                               ; 3fcb: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3fcd: 20 44 1e
    jmp c3fe4                                                         ; 3fd0: 4c e4 3f

c3fd3
    dec height_in_cells                                               ; 3fd3: c6 3d
    lda #0                                                            ; 3fd5: a9 00
    sta value_to_write_to_collision_map                               ; 3fd7: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3fd9: 20 44 1e
    iny                                                               ; 3fdc: c8
c3fdd
    lda #3                                                            ; 3fdd: a9 03
    sta value_to_write_to_collision_map                               ; 3fdf: 85 3e
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3fe1: 20 44 1e
c3fe4
    rts                                                               ; 3fe4: 60

sub_c3fe5
    lda update_room_first_update_flag                                 ; 3fe5: ad 2b 13
    beq c4035                                                         ; 3fe8: f0 4b
    lda #$cb                                                          ; 3fea: a9 cb
    sta l2ee9                                                         ; 3fec: 8d e9 2e
    lda #$ca                                                          ; 3fef: a9 ca
    sta l2eee                                                         ; 3ff1: 8d ee 2e
    lda #$df                                                          ; 3ff4: a9 df
    sta five_byte_table_paired_with_collectable_sprite_ids + 1        ; 3ff6: 8d f3 2e
    lda current_level                                                 ; 3ff9: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 3ffb: c5 51
    beq c4009                                                         ; 3ffd: f0 0a
    lda l0a0a                                                         ; 3fff: ad 0a 0a
    beq c4009                                                         ; 4002: f0 05
    lda #$ff                                                          ; 4004: a9 ff
    sta l0a0a                                                         ; 4006: 8d 0a 0a
c4009
    lda #$cc                                                          ; 4009: a9 cc
    sta l38ae                                                         ; 400b: 8d ae 38
    lda l0a0a                                                         ; 400e: ad 0a 0a
    bne c4053                                                         ; 4011: d0 40
    lda desired_room_index                                            ; 4013: a5 30
    cmp #1                                                            ; 4015: c9 01
    bne c4031                                                         ; 4017: d0 18
    ldx #$23 ; '#'                                                    ; 4019: a2 23
    ldy #8                                                            ; 401b: a0 08
    lda #1                                                            ; 401d: a9 01
    sta temp_sprite_y_offset                                          ; 401f: 85 3b
    lda #2                                                            ; 4021: a9 02
    jsr set_object_position_from_cell_xy                              ; 4023: 20 5d 1f
    tax                                                               ; 4026: aa
    lda #$c0                                                          ; 4027: a9 c0
    sta l38c4                                                         ; 4029: 8d c4 38
    lda #$ca                                                          ; 402c: a9 ca
    sta l09aa                                                         ; 402e: 8d aa 09
c4031
    rts                                                               ; 4031: 60

c4032
    jmp c40d0                                                         ; 4032: 4c d0 40

c4035
    lda l0a0a                                                         ; 4035: ad 0a 0a
    bne c4053                                                         ; 4038: d0 19
    lda desired_room_index                                            ; 403a: a5 30
    cmp #1                                                            ; 403c: c9 01
    bne c4032                                                         ; 403e: d0 f2
    ldx #$0b                                                          ; 4040: a2 0b
    ldy #2                                                            ; 4042: a0 02
    jsr test_for_collision_between_objects_x_and_y                    ; 4044: 20 e2 28
    beq c4032                                                         ; 4047: f0 e9
    lda #$cb                                                          ; 4049: a9 cb
    jsr find_or_create_menu_slot_for_A                                ; 404b: 20 bd 2b
    lda #$ff                                                          ; 404e: a9 ff
    sta l0a0a                                                         ; 4050: 8d 0a 0a
c4053
    ldy l0a0a                                                         ; 4053: ac 0a 0a
    beq c4032                                                         ; 4056: f0 da
    lda update_room_first_update_flag                                 ; 4058: ad 2b 13
    bne c4079                                                         ; 405b: d0 1c
    lda player_using_object_spriteid                                  ; 405d: ad b6 2e
    cmp #$cb                                                          ; 4060: c9 cb
    beq c4068                                                         ; 4062: f0 04
    ldy #$ff                                                          ; 4064: a0 ff
    bne c4079                                                         ; 4066: d0 11
c4068
    cpy #$ff                                                          ; 4068: c0 ff
    bne c4071                                                         ; 406a: d0 05
    ldy #$0a                                                          ; 406c: a0 0a
    jmp c4079                                                         ; 406e: 4c 79 40

c4071
    iny                                                               ; 4071: c8
    lda l40d1,y                                                       ; 4072: b9 d1 40
    bne c4079                                                         ; 4075: d0 02
    ldy #1                                                            ; 4077: a0 01
c4079
    sty l0a0a                                                         ; 4079: 8c 0a 0a
    lda #0                                                            ; 407c: a9 00
    sta l09aa                                                         ; 407e: 8d aa 09
    cpy #$ff                                                          ; 4081: c0 ff
    beq c40d0                                                         ; 4083: f0 4b
    ldx #2                                                            ; 4085: a2 02
    lda l40d1,y                                                       ; 4087: b9 d1 40
    sta object_spriteid,x                                             ; 408a: 9d a8 09
    lda #$40 ; '@'                                                    ; 408d: a9 40
    sta object_z_order,x                                              ; 408f: 9d c2 38
    lda object_direction+1                                            ; 4092: ad bf 09
    sta object_direction,x                                            ; 4095: 9d be 09
    bmi c40ae                                                         ; 4098: 30 14
    lda object_x_low+1                                                ; 409a: ad 51 09
    clc                                                               ; 409d: 18
    adc #6                                                            ; 409e: 69 06
    sta object_x_low,x                                                ; 40a0: 9d 50 09
    lda object_x_high+1                                               ; 40a3: ad 67 09
    adc #0                                                            ; 40a6: 69 00
    sta object_x_high,x                                               ; 40a8: 9d 66 09
    jmp c40bf                                                         ; 40ab: 4c bf 40

c40ae
    lda object_x_low+1                                                ; 40ae: ad 51 09
    sec                                                               ; 40b1: 38
    sbc #6                                                            ; 40b2: e9 06
    sta object_x_low,x                                                ; 40b4: 9d 50 09
    lda object_x_high+1                                               ; 40b7: ad 67 09
    sbc #0                                                            ; 40ba: e9 00
    sta object_x_high,x                                               ; 40bc: 9d 66 09
c40bf
    lda object_y_low+1                                                ; 40bf: ad 7d 09
    clc                                                               ; 40c2: 18
    adc #$fd                                                          ; 40c3: 69 fd
    sta object_y_low,x                                                ; 40c5: 9d 7c 09
    lda object_y_high+1                                               ; 40c8: ad 93 09
    adc #$ff                                                          ; 40cb: 69 ff
    sta object_y_high,x                                               ; 40cd: 9d 92 09
c40d0
    rts                                                               ; 40d0: 60

l40d1
    !byte 0                                                           ; 40d1: 00
    !text "<=>?@ABC"                                                  ; 40d2: 3c 3d 3e...
    !byte   0, $ce,   0                                               ; 40da: 00 ce 00
; *************************************************************************************
; 
; Room 2 initialisation and game loop
; 
; *************************************************************************************
room_2_data
    !byte 20                                                          ; 40dd: 14                      ; initial player X cell
    !byte 11                                                          ; 40de: 0b                      ; initial player Y cell

room_2_code
    lda #$61 ; 'a'                                                    ; 40df: a9 61
    sta source_sprite_memory_low                                      ; 40e1: 85 40
    lda #$45 ; 'E'                                                    ; 40e3: a9 45
    sta source_sprite_memory_high                                     ; 40e5: 85 41
    ldx #0                                                            ; 40e7: a2 00
    ldy #0                                                            ; 40e9: a0 00
    lda #$ff                                                          ; 40eb: a9 ff
    sta width_in_cells                                                ; 40ed: 85 3c
    lda #2                                                            ; 40ef: a9 02
    sta height_in_cells                                               ; 40f1: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 40f3: 20 bb 1a
    ldy #2                                                            ; 40f6: a0 02
    lda #4                                                            ; 40f8: a9 04
    sta width_in_cells                                                ; 40fa: 85 3c
    lda #1                                                            ; 40fc: a9 01
    sta height_in_cells                                               ; 40fe: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4100: 20 bb 1a
    ldx #$24 ; '$'                                                    ; 4103: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 4105: 20 bb 1a
    ldx #0                                                            ; 4108: a2 00
    iny                                                               ; 410a: c8
    dec width_in_cells                                                ; 410b: c6 3c
    inc height_in_cells                                               ; 410d: e6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 410f: 20 bb 1a
    ldx #$25 ; '%'                                                    ; 4112: a2 25
    lda #$0a                                                          ; 4114: a9 0a
    sta height_in_cells                                               ; 4116: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4118: 20 bb 1a
    ldx #0                                                            ; 411b: a2 00
    ldy #$0b                                                          ; 411d: a0 0b
    lda #5                                                            ; 411f: a9 05
    sta width_in_cells                                                ; 4121: 85 3c
    lda #2                                                            ; 4123: a9 02
    sta height_in_cells                                               ; 4125: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4127: 20 bb 1a
    ldx #$23 ; '#'                                                    ; 412a: a2 23
    ldy #$12                                                          ; 412c: a0 12
    jsr copy_rectangle_of_memory_to_screen                            ; 412e: 20 bb 1a
    ldx #0                                                            ; 4131: a2 00
    ldy #$0d                                                          ; 4133: a0 0d
    lda #3                                                            ; 4135: a9 03
    sta width_in_cells                                                ; 4137: 85 3c
    lda #$ff                                                          ; 4139: a9 ff
    sta height_in_cells                                               ; 413b: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 413d: 20 bb 1a
    ldx #$25 ; '%'                                                    ; 4140: a2 25
    ldy #$14                                                          ; 4142: a0 14
    jsr copy_rectangle_of_memory_to_screen                            ; 4144: 20 bb 1a
    ldx #$0c                                                          ; 4147: a2 0c
    ldy #$0b                                                          ; 4149: a0 0b
    lda #$10                                                          ; 414b: a9 10
    sta width_in_cells                                                ; 414d: 85 3c
    lda #2                                                            ; 414f: a9 02
    sta height_in_cells                                               ; 4151: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4153: 20 bb 1a
    ldy #$14                                                          ; 4156: a0 14
    lda #$ff                                                          ; 4158: a9 ff
    sta height_in_cells                                               ; 415a: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 415c: 20 bb 1a
    ldy #2                                                            ; 415f: a0 02
    lda #1                                                            ; 4161: a9 01
    sta height_in_cells                                               ; 4163: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4165: 20 bb 1a
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 4168: 20 90 1b
    ldx #$1f                                                          ; 416b: a2 1f
    ldy #2                                                            ; 416d: a0 02
    lda #$ff                                                          ; 416f: a9 ff
    jsr draw_rope                                                     ; 4171: 20 b9 1d
    jsr start_room                                                    ; 4174: 20 bb 12
c4177
    jsr game_update                                                   ; 4177: 20 da 12
    sta l0070                                                         ; 417a: 85 70
    and #1                                                            ; 417c: 29 01
    beq c4187                                                         ; 417e: f0 07
    ldx #3                                                            ; 4180: a2 03
    ldy current_level                                                 ; 4182: a4 31
    jmp initialise_level_and_room                                     ; 4184: 4c 40 11

c4187
    lda l0070                                                         ; 4187: a5 70
    and #2                                                            ; 4189: 29 02
    beq c4194                                                         ; 418b: f0 07
    ldx #0                                                            ; 418d: a2 00
    ldy current_level                                                 ; 418f: a4 31
    jmp initialise_level_and_room                                     ; 4191: 4c 40 11

c4194
    lda l0070                                                         ; 4194: a5 70
    and #4                                                            ; 4196: 29 04
    beq c4177                                                         ; 4198: f0 dd
    ldx #1                                                            ; 419a: a2 01
    ldy current_level                                                 ; 419c: a4 31
    jmp initialise_level_and_room                                     ; 419e: 4c 40 11

sub_c41a1
    lda #2                                                            ; 41a1: a9 02
    sta currently_updating_logic_for_room_index                       ; 41a3: 8d ba 1a
    ldx #$25 ; '%'                                                    ; 41a6: a2 25
    ldy #7                                                            ; 41a8: a0 07
    lda #6                                                            ; 41aa: a9 06
    jsr update_brazier_and_fire                                       ; 41ac: 20 88 19
    lda update_room_first_update_flag                                 ; 41af: ad 2b 13
    beq c41d5                                                         ; 41b2: f0 21
    lda desired_room_index                                            ; 41b4: a5 30
    cmp #2                                                            ; 41b6: c9 02
    bne c41d5                                                         ; 41b8: d0 1b
    ldx #8                                                            ; 41ba: a2 08
    ldy #2                                                            ; 41bc: a0 02
    lda l0a0c                                                         ; 41be: ad 0c 0a
    beq c41d0                                                         ; 41c1: f0 0d
    lda #$d8                                                          ; 41c3: a9 d8
    jsr draw_sprite_a_at_cell_xy                                      ; 41c5: 20 4c 1f
    lda #3                                                            ; 41c8: a9 03
    jsr write_a_single_value_to_cell_in_collision_map                 ; 41ca: 20 bb 1e
    jmp c41d5                                                         ; 41cd: 4c d5 41

c41d0
    lda #$ff                                                          ; 41d0: a9 ff
    jsr draw_rope                                                     ; 41d2: 20 b9 1d
c41d5
    lda #2                                                            ; 41d5: a9 02
    sta l4430                                                         ; 41d7: 8d 30 44
    lda #$20 ; ' '                                                    ; 41da: a9 20
    sta l442a                                                         ; 41dc: 8d 2a 44
    lda #$80                                                          ; 41df: a9 80
    sta l442b                                                         ; 41e1: 8d 2b 44
    lda l0a71                                                         ; 41e4: ad 71 0a
    sta l442c                                                         ; 41e7: 8d 2c 44
    lda l0a74                                                         ; 41ea: ad 74 0a
    sta l442f                                                         ; 41ed: 8d 2f 44
    lda l0a72                                                         ; 41f0: ad 72 0a
    sta l442d                                                         ; 41f3: 8d 2d 44
    lda l0a73                                                         ; 41f6: ad 73 0a
    sta l442e                                                         ; 41f9: 8d 2e 44
    ldx #$40 ; '@'                                                    ; 41fc: a2 40
    ldy #0                                                            ; 41fe: a0 00
    lda #1                                                            ; 4200: a9 01
    jsr sub_c422d                                                     ; 4202: 20 2d 42
    lda l442c                                                         ; 4205: ad 2c 44
    sta l0a71                                                         ; 4208: 8d 71 0a
    lda l442f                                                         ; 420b: ad 2f 44
    sta l0a74                                                         ; 420e: 8d 74 0a
    lda l442d                                                         ; 4211: ad 2d 44
    sta l0a72                                                         ; 4214: 8d 72 0a
    lda l442e                                                         ; 4217: ad 2e 44
    sta l0a73                                                         ; 421a: 8d 73 0a
    rts                                                               ; 421d: 60

l421e
    !byte $db, $da,   0, $db, $da,   0, $da,   0, $dc, $dc, $dc, $dc  ; 421e: db da 00...
    !byte $dc, $dc,   0                                               ; 422a: dc dc 00

sub_c422d
    sta l4427                                                         ; 422d: 8d 27 44
    stx l4428                                                         ; 4230: 8e 28 44
    sty l4429                                                         ; 4233: 8c 29 44
    lda currently_updating_logic_for_room_index                       ; 4236: ad ba 1a
    cmp #3                                                            ; 4239: c9 03
    beq c4242                                                         ; 423b: f0 05
    lda l0a0c                                                         ; 423d: ad 0c 0a
    bmi c428d                                                         ; 4240: 30 4b
c4242
    lda update_room_first_update_flag                                 ; 4242: ad 2b 13
    beq c4290                                                         ; 4245: f0 49
    lda current_level                                                 ; 4247: a5 31
    cmp level_before_latest_level_and_room_initialisation             ; 4249: c5 51
    beq c4278                                                         ; 424b: f0 2b
    ldx #$4b ; 'K'                                                    ; 424d: a2 4b
    ldy #$45 ; 'E'                                                    ; 424f: a0 45
    jsr define_envelope                                               ; 4251: 20 5e 39
    lda l0a0c                                                         ; 4254: ad 0c 0a
    beq c4265                                                         ; 4257: f0 0c
    lda #$ff                                                          ; 4259: a9 ff
    sta l0a0c                                                         ; 425b: 8d 0c 0a
    lda currently_updating_logic_for_room_index                       ; 425e: ad ba 1a
    cmp #3                                                            ; 4261: c9 03
    bne c428d                                                         ; 4263: d0 28
c4265
    lda l442a                                                         ; 4265: ad 2a 44
    sta l442c                                                         ; 4268: 8d 2c 44
    lda #6                                                            ; 426b: a9 06
    sta l442d                                                         ; 426d: 8d 2d 44
    sta l442e                                                         ; 4270: 8d 2e 44
    lda #$10                                                          ; 4273: a9 10
    sta l442f                                                         ; 4275: 8d 2f 44
c4278
    lda desired_room_index                                            ; 4278: a5 30
    cmp #1                                                            ; 427a: c9 01
    beq c428a                                                         ; 427c: f0 0c
    ldx #5                                                            ; 427e: a2 05
    lda #$d1                                                          ; 4280: a9 d1
    sta object_sprite_mask_type,x                                     ; 4282: 9d ac 38
    lda #$f0                                                          ; 4285: a9 f0
    sta object_z_order,x                                              ; 4287: 9d c2 38
c428a
    jmp c43cd                                                         ; 428a: 4c cd 43

c428d
    jmp c4424                                                         ; 428d: 4c 24 44

c4290
    lda object_y_high                                                 ; 4290: ad 92 09
    sta l0070                                                         ; 4293: 85 70
    lda object_y_low                                                  ; 4295: ad 7c 09
    lsr l0070                                                         ; 4298: 46 70
    ror                                                               ; 429a: 6a
    ldx desired_room_index                                            ; 429b: a6 30
    cpx currently_updating_logic_for_room_index                       ; 429d: ec ba 1a
    beq c42be                                                         ; 42a0: f0 1c
    cpx #0                                                            ; 42a2: e0 00
    bne c42ad                                                         ; 42a4: d0 07
    ldx currently_updating_logic_for_room_index                       ; 42a6: ae ba 1a
    cpx #2                                                            ; 42a9: e0 02
    beq c42bb                                                         ; 42ab: f0 0e
c42ad
    lda l442a                                                         ; 42ad: ad 2a 44
    sta l4425                                                         ; 42b0: 8d 25 44
    lda #0                                                            ; 42b3: a9 00
    sta l4426                                                         ; 42b5: 8d 26 44
    jmp c42ef                                                         ; 42b8: 4c ef 42

c42bb
    clc                                                               ; 42bb: 18
    adc #$60 ; '`'                                                    ; 42bc: 69 60
c42be
    sta l4425                                                         ; 42be: 8d 25 44
    lda object_x_low                                                  ; 42c1: ad 50 09
    sec                                                               ; 42c4: 38
    sbc l4428                                                         ; 42c5: ed 28 44
    sta l0070                                                         ; 42c8: 85 70
    lda object_x_high                                                 ; 42ca: ad 66 09
    sbc l4429                                                         ; 42cd: ed 29 44
    sta l0071                                                         ; 42d0: 85 71
    bpl c42e5                                                         ; 42d2: 10 11
    lda l0070                                                         ; 42d4: a5 70
    eor #$ff                                                          ; 42d6: 49 ff
    clc                                                               ; 42d8: 18
    adc #1                                                            ; 42d9: 69 01
    sta l0070                                                         ; 42db: 85 70
    lda l0071                                                         ; 42dd: a5 71
    eor #$ff                                                          ; 42df: 49 ff
    adc #0                                                            ; 42e1: 69 00
    sta l0071                                                         ; 42e3: 85 71
c42e5
    lsr l0071                                                         ; 42e5: 46 71
    lda l0070                                                         ; 42e7: a5 70
    ror                                                               ; 42e9: 6a
    lsr                                                               ; 42ea: 4a
    lsr                                                               ; 42eb: 4a
    sta l4426                                                         ; 42ec: 8d 26 44
c42ef
    lda l442e                                                         ; 42ef: ad 2e 44
    clc                                                               ; 42f2: 18
    adc #1                                                            ; 42f3: 69 01
    tay                                                               ; 42f5: a8
    lda l421e,y                                                       ; 42f6: b9 1e 42
    bne c42fe                                                         ; 42f9: d0 03
    ldy l442d                                                         ; 42fb: ac 2d 44
c42fe
    lda l442c                                                         ; 42fe: ad 2c 44
    cmp l442a                                                         ; 4301: cd 2a 44
    beq c4340                                                         ; 4304: f0 3a
    bcc c4340                                                         ; 4306: 90 38
    lda currently_updating_logic_for_room_index                       ; 4308: ad ba 1a
    cmp #3                                                            ; 430b: c9 03
    beq c4314                                                         ; 430d: f0 05
    lda l0a0c                                                         ; 430f: ad 0c 0a
    bne c4328                                                         ; 4312: d0 14
c4314
    lda l442c                                                         ; 4314: ad 2c 44
    cmp l4425                                                         ; 4317: cd 25 44
    beq c4374                                                         ; 431a: f0 58
    bcc c4340                                                         ; 431c: 90 22
    sbc l4425                                                         ; 431e: ed 25 44
    cmp l4426                                                         ; 4321: cd 26 44
    beq c4374                                                         ; 4324: f0 4e
    bcc c4374                                                         ; 4326: 90 4c
c4328
    lda l442c                                                         ; 4328: ad 2c 44
    sec                                                               ; 432b: 38
    sbc l4430                                                         ; 432c: ed 30 44
    sta l442c                                                         ; 432f: 8d 2c 44
    lda #0                                                            ; 4332: a9 00
    cmp l442d                                                         ; 4334: cd 2d 44
    beq c433d                                                         ; 4337: f0 04
    sta l442d                                                         ; 4339: 8d 2d 44
    tay                                                               ; 433c: a8
c433d
    jmp c43ca                                                         ; 433d: 4c ca 43

c4340
    lda l442c                                                         ; 4340: ad 2c 44
    cmp l442b                                                         ; 4343: cd 2b 44
    bcs c4374                                                         ; 4346: b0 2c
    lda l4425                                                         ; 4348: ad 25 44
    cmp l442c                                                         ; 434b: cd 2c 44
    beq c4374                                                         ; 434e: f0 24
    bcc c4374                                                         ; 4350: 90 22
    sbc l442c                                                         ; 4352: ed 2c 44
    cmp l4426                                                         ; 4355: cd 26 44
    beq c4374                                                         ; 4358: f0 1a
    bcc c4374                                                         ; 435a: 90 18
    lda l442c                                                         ; 435c: ad 2c 44
    clc                                                               ; 435f: 18
    adc l4430                                                         ; 4360: 6d 30 44
    sta l442c                                                         ; 4363: 8d 2c 44
    lda #3                                                            ; 4366: a9 03
    cmp l442d                                                         ; 4368: cd 2d 44
    beq c433d                                                         ; 436b: f0 d0
    sta l442d                                                         ; 436d: 8d 2d 44
    tay                                                               ; 4370: a8
    jmp c43ca                                                         ; 4371: 4c ca 43

c4374
    lda l442d                                                         ; 4374: ad 2d 44
    cmp #6                                                            ; 4377: c9 06
    beq c4393                                                         ; 4379: f0 18
    cmp #8                                                            ; 437b: c9 08
    bne c4383                                                         ; 437d: d0 04
    cpy #8                                                            ; 437f: c0 08
    bne c43ca                                                         ; 4381: d0 47
c4383
    lda #$0f                                                          ; 4383: a9 0f
    jsr l18a6                                                         ; 4385: 20 a6 18
    clc                                                               ; 4388: 18
    adc #$10                                                          ; 4389: 69 10
    sta l442f                                                         ; 438b: 8d 2f 44
    ldy #6                                                            ; 438e: a0 06
    sty l442d                                                         ; 4390: 8c 2d 44
c4393
    dec l442f                                                         ; 4393: ce 2f 44
    bpl c43ca                                                         ; 4396: 10 32
    lda currently_updating_logic_for_room_index                       ; 4398: ad ba 1a
    cmp #3                                                            ; 439b: c9 03
    bne c43a5                                                         ; 439d: d0 06
    cmp desired_room_index                                            ; 439f: c5 30
    beq c43bc                                                         ; 43a1: f0 19
    bne c43c5                                                         ; 43a3: d0 20
c43a5
    ldy l0a71                                                         ; 43a5: ac 71 0a
    lda desired_room_index                                            ; 43a8: a5 30
    cmp #2                                                            ; 43aa: c9 02
    beq c43b8                                                         ; 43ac: f0 0a
    cmp #0                                                            ; 43ae: c9 00
    bne c43c5                                                         ; 43b0: d0 13
    cpy #$66 ; 'f'                                                    ; 43b2: c0 66
    bcs c43bc                                                         ; 43b4: b0 06
    bcc c43c5                                                         ; 43b6: 90 0d
c43b8
    cpy #$68 ; 'h'                                                    ; 43b8: c0 68
    bcs c43c5                                                         ; 43ba: b0 09
c43bc
    lda #0                                                            ; 43bc: a9 00
    ldx #$59 ; 'Y'                                                    ; 43be: a2 59
    ldy #$45 ; 'E'                                                    ; 43c0: a0 45
    jsr play_sound_yx                                                 ; 43c2: 20 f6 38
c43c5
    ldy #8                                                            ; 43c5: a0 08
    sty l442d                                                         ; 43c7: 8c 2d 44
c43ca
    sty l442e                                                         ; 43ca: 8c 2e 44
c43cd
    lda l442c                                                         ; 43cd: ad 2c 44
    ldx desired_room_index                                            ; 43d0: a6 30
    cpx currently_updating_logic_for_room_index                       ; 43d2: ec ba 1a
    beq c43e5                                                         ; 43d5: f0 0e
    cpx #0                                                            ; 43d7: e0 00
    bne c4424                                                         ; 43d9: d0 49
    ldx currently_updating_logic_for_room_index                       ; 43db: ae ba 1a
    cpx #2                                                            ; 43de: e0 02
    bne c4424                                                         ; 43e0: d0 42
    sec                                                               ; 43e2: 38
    sbc #$60 ; '`'                                                    ; 43e3: e9 60
c43e5
    ldx #0                                                            ; 43e5: a2 00
    ora #0                                                            ; 43e7: 09 00
    bpl c43ec                                                         ; 43e9: 10 01
    dex                                                               ; 43eb: ca
c43ec
    stx l0997                                                         ; 43ec: 8e 97 09
    asl                                                               ; 43ef: 0a
    rol l0997                                                         ; 43f0: 2e 97 09
    sta l0981                                                         ; 43f3: 8d 81 09
    lda l4427                                                         ; 43f6: ad 27 44
    sta l09c3                                                         ; 43f9: 8d c3 09
    lda l4428                                                         ; 43fc: ad 28 44
    sta l0955                                                         ; 43ff: 8d 55 09
    lda l4429                                                         ; 4402: ad 29 44
    sta l096b                                                         ; 4405: 8d 6b 09
    ldy l442e                                                         ; 4408: ac 2e 44
    lda l421e,y                                                       ; 440b: b9 1e 42
    sta l09ad                                                         ; 440e: 8d ad 09
    lda update_room_first_update_flag                                 ; 4411: ad 2b 13
    bne c4424                                                         ; 4414: d0 0e
    ldx #0                                                            ; 4416: a2 00
    ldy #5                                                            ; 4418: a0 05
    jsr test_for_collision_between_objects_x_and_y                    ; 441a: 20 e2 28
    beq c4424                                                         ; 441d: f0 05
    lda #$80                                                          ; 441f: a9 80
    sta player_wall_collision_flag                                    ; 4421: 8d 33 24
c4424
    rts                                                               ; 4424: 60

l4425
    !byte 0                                                           ; 4425: 00
l4426
    !byte 0                                                           ; 4426: 00
l4427
    !byte 0                                                           ; 4427: 00
l4428
    !byte 0                                                           ; 4428: 00
l4429
    !byte 0                                                           ; 4429: 00
l442a
    !byte 0                                                           ; 442a: 00
l442b
    !byte 0                                                           ; 442b: 00
l442c
    !byte 0                                                           ; 442c: 00
l442d
    !byte 0                                                           ; 442d: 00
l442e
    !byte 0                                                           ; 442e: 00
l442f
    !byte 0                                                           ; 442f: 00
l4430
    !byte 0                                                           ; 4430: 00
; *************************************************************************************
; 
; Room 3 initialisation and game loop
; 
; *************************************************************************************
room_3_data
    !byte 29                                                          ; 4431: 1d                      ; initial player X cell
    !byte 11                                                          ; 4432: 0b                      ; initial player Y cell

room_3_code
    lda #$61 ; 'a'                                                    ; 4433: a9 61
    sta source_sprite_memory_low                                      ; 4435: 85 40
    lda #$45 ; 'E'                                                    ; 4437: a9 45
    sta source_sprite_memory_high                                     ; 4439: 85 41
    ldx #0                                                            ; 443b: a2 00
    ldy #0                                                            ; 443d: a0 00
    lda #$ff                                                          ; 443f: a9 ff
    sta width_in_cells                                                ; 4441: 85 3c
    lda #2                                                            ; 4443: a9 02
    sta height_in_cells                                               ; 4445: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4447: 20 bb 1a
    iny                                                               ; 444a: c8
    iny                                                               ; 444b: c8
    lda #4                                                            ; 444c: a9 04
    sta width_in_cells                                                ; 444e: 85 3c
    dec height_in_cells                                               ; 4450: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4452: 20 bb 1a
    ldx #$24 ; '$'                                                    ; 4455: a2 24
    jsr copy_rectangle_of_memory_to_screen                            ; 4457: 20 bb 1a
    ldx #0                                                            ; 445a: a2 00
    iny                                                               ; 445c: c8
    dec width_in_cells                                                ; 445d: c6 3c
    lda #$ff                                                          ; 445f: a9 ff
    sta height_in_cells                                               ; 4461: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4463: 20 bb 1a
    ldx #$25 ; '%'                                                    ; 4466: a2 25
    lda #2                                                            ; 4468: a9 02
    sta height_in_cells                                               ; 446a: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 446c: 20 bb 1a
    ldx #$16                                                          ; 446f: a2 16
    ldy #$0b                                                          ; 4471: a0 0b
    lda #$ff                                                          ; 4473: a9 ff
    sta width_in_cells                                                ; 4475: 85 3c
    jsr copy_rectangle_of_memory_to_screen                            ; 4477: 20 bb 1a
    ldx #$24 ; '$'                                                    ; 447a: a2 24
    iny                                                               ; 447c: c8
    iny                                                               ; 447d: c8
    dec height_in_cells                                               ; 447e: c6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4480: 20 bb 1a
    inx                                                               ; 4483: e8
    iny                                                               ; 4484: c8
    lda #7                                                            ; 4485: a9 07
    sta height_in_cells                                               ; 4487: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4489: 20 bb 1a
    ldx #$16                                                          ; 448c: a2 16
    ldy #$15                                                          ; 448e: a0 15
    lda #1                                                            ; 4490: a9 01
    sta height_in_cells                                               ; 4492: 85 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 4494: 20 bb 1a
    ldx #3                                                            ; 4497: a2 03
    iny                                                               ; 4499: c8
    inc height_in_cells                                               ; 449a: e6 3d
    jsr copy_rectangle_of_memory_to_screen                            ; 449c: 20 bb 1a
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 449f: 20 90 1b
    lda #3                                                            ; 44a2: a9 03
    sta width_in_cells                                                ; 44a4: 85 3c
    lda #2                                                            ; 44a6: a9 02
    sta height_in_cells                                               ; 44a8: 85 3d
    ldx #$22 ; '"'                                                    ; 44aa: a2 22
    ldy #$13                                                          ; 44ac: a0 13
    lda #$c8                                                          ; 44ae: a9 c8
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 44b0: 20 57 1f
    ldx #$16                                                          ; 44b3: a2 16
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 44b5: 20 57 1f
    ldx #6                                                            ; 44b8: a2 06
    iny                                                               ; 44ba: c8
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 44bb: 20 57 1f
    ldx #3                                                            ; 44be: a2 03
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 44c0: 20 57 1f
    ldy #$12                                                          ; 44c3: a0 12
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 44c5: 20 57 1f
    ldx #8                                                            ; 44c8: a2 08
    ldy #2                                                            ; 44ca: a0 02
    lda #$0e                                                          ; 44cc: a9 0e
    jsr draw_rope                                                     ; 44ce: 20 b9 1d
    ldx #$0d                                                          ; 44d1: a2 0d
    lda #$0f                                                          ; 44d3: a9 0f
    jsr draw_rope                                                     ; 44d5: 20 b9 1d
    ldx #$12                                                          ; 44d8: a2 12
    lda #$10                                                          ; 44da: a9 10
    jsr draw_rope                                                     ; 44dc: 20 b9 1d
    jsr start_room                                                    ; 44df: 20 bb 12
loop_c44e2
    jsr game_update                                                   ; 44e2: 20 da 12
    and #4                                                            ; 44e5: 29 04
    beq loop_c44e2                                                    ; 44e7: f0 f9
    ldx #2                                                            ; 44e9: a2 02
    ldy current_level                                                 ; 44eb: a4 31
    jmp initialise_level_and_room                                     ; 44ed: 4c 40 11

sub_c44f0
    lda #3                                                            ; 44f0: a9 03
    sta currently_updating_logic_for_room_index                       ; 44f2: 8d ba 1a
    ldx #$1d                                                          ; 44f5: a2 1d
    lda #4                                                            ; 44f7: a9 04
    sta temp_sprite_x_offset                                          ; 44f9: 85 3a
    ldy #$15                                                          ; 44fb: a0 15
    lda #6                                                            ; 44fd: a9 06
    jsr update_level_completion                                       ; 44ff: 20 10 1a
    lda #1                                                            ; 4502: a9 01
    sta l4430                                                         ; 4504: 8d 30 44
    lda #$18                                                          ; 4507: a9 18
    sta l442a                                                         ; 4509: 8d 2a 44
    lda #$3c ; '<'                                                    ; 450c: a9 3c
    sta l442b                                                         ; 450e: 8d 2b 44
    lda l0a75                                                         ; 4511: ad 75 0a
    sta l442c                                                         ; 4514: 8d 2c 44
    lda l0a78                                                         ; 4517: ad 78 0a
    sta l442f                                                         ; 451a: 8d 2f 44
    lda l0a76                                                         ; 451d: ad 76 0a
    sta l442d                                                         ; 4520: 8d 2d 44
    lda l0a77                                                         ; 4523: ad 77 0a
    sta l442e                                                         ; 4526: 8d 2e 44
    ldx #$6f ; 'o'                                                    ; 4529: a2 6f
    ldy #0                                                            ; 452b: a0 00
    lda #$ff                                                          ; 452d: a9 ff
    jsr sub_c422d                                                     ; 452f: 20 2d 42
    lda l442c                                                         ; 4532: ad 2c 44
    sta l0a75                                                         ; 4535: 8d 75 0a
    lda l442f                                                         ; 4538: ad 2f 44
    sta l0a78                                                         ; 453b: 8d 78 0a
    lda l442d                                                         ; 453e: ad 2d 44
    sta l0a76                                                         ; 4541: 8d 76 0a
    lda l442e                                                         ; 4544: ad 2e 44
    sta l0a77                                                         ; 4547: 8d 77 0a
    rts                                                               ; 454a: 60

    !byte   5, $81,   1, $fe, $fc,   8,   8,   8, $3c, $ff,   0, $fc  ; 454b: 05 81 01...
    !byte $5a,   0, $13,   0,   5,   0, $e6,   0,   1,   0, $40, $c0  ; 4557: 5a 00 13...
    !byte $20, $10, $0b,   4,   8,   8,   2,   3,   4,   8, $d0, $20  ; 4563: 20 10 0b...
    !byte $10, $10,   8,   8,   4, $0b, $10, $20, $c0, $40, $10, $10  ; 456f: 10 10 08...
    !byte $20, $d0,   8,   4,   3,   2                                ; 457b: 20 d0 08...
sprite_data
    !byte $30,   0, $a9,   0, $31,   1, $51,   1, $79,   1, $a1,   1  ; 4581: 30 00 a9...
    !byte $a1,   1, $b7,   1, $b7,   1, $b7,   1, $43,   2, $6b,   2  ; 458d: a1 01 b7...
    !byte $93,   2,   2,   3, $57,   3, $8a,   3, $9c,   3, $be,   3  ; 4599: 93 02 02...
    !byte $e6,   3, $4a,   4, $b0,   4, $19,   5, $19,   5, $19,   5  ; 45a5: e6 03 4a...
    !byte   0, $0e, $18, $14, $aa, $a0,   0, $0e, $a8, $15, $55, $43  ; 45b1: 00 0e 18...
    !byte $a8, $55, $55, $55, $3a, $15, $55, $55, $54, $e8, $55, $55  ; 45bd: a8 55 55...
    !byte $55, $53, $85, $55, $55, $55, $53, $85, $55, $55, $55, $53  ; 45c9: 55 53 85...
    !byte $15, $55, $55, $55, $54, $c5, $55, $55, $55, $55, $31, $55  ; 45d5: 15 55 55...
    !byte $55, $55, $55, $4c, $55, $55, $55, $55, $53,   5, $55, $55  ; 45e1: 55 55 55...
    !byte $55, $54, $c5, $55, $55, $55, $55, $31, $15, $55, $55, $55  ; 45ed: 55 54 c5...
    !byte $4c, $15, $55, $55, $55, $53, $15, $55, $55, $55, $54, $c4  ; 45f9: 4c 15 55...
    !byte $55, $55, $55, $55, $38, $55, $55, $55, $55, $38, $45, $55  ; 4605: 55 55 55...
    !byte $55, $55, $3a, $14, $55, $55, $54, $e8, $45, $15, $55, $13  ; 4611: 55 55 3a...
    !byte $a8, $51, $11,   5, $3a, $a0, $44, $45, $0e, $aa, $80,   0  ; 461d: a8 51 11...
    !byte $30,   0, $0e, $18, $15, $aa, $aa, $aa,   0,   0, $ea, $aa  ; 4629: 30 00 0e...
    !byte $aa, $14, $55, $4e,   0,   0,   1, $45, $54, $c5, $55, $55  ; 4635: aa 14 55...
    !byte $14, $45, $4c, $44, $44, $41, $14, $44, $e0,   0,   0, $14  ; 4641: 14 45 4c...
    !byte $44, $4e, $a1, $55,   0, $45, $44, $ea, $80,   0, $14, $55  ; 464d: 44 4e a1...
    !byte $4e, $aa, $aa, $a1, $45, $14, $ea, $aa, $aa, $14, $51, $4e  ; 4659: 4e aa aa...
    !byte $aa, $aa, $a0, $44, $54, $ea, $aa, $aa, $14, $45, $4e, $aa  ; 4665: aa aa a0...
    !byte $aa, $a1, $44, $44, $ea, $aa, $aa, $14, $54, $4e, $aa, $aa  ; 4671: aa a1 44...
    !byte $a1, $45, $44, $ea, $aa, $aa, $10, $44, $4e, $a8,   0,   1  ; 467d: a1 45 44...
    !byte $44, $54, $ea, $15, $50, $14, $45, $4e,   0,   0,   1, $15  ; 4689: 44 54 ea...
    !byte $14, $c5, $55, $55, $14, $51, $4c, $44, $44, $41, $45, $54  ; 4695: 14 c5 55...
    !byte $e0,   0,   0, $14, $45, $4e, $aa, $aa, $a1, $45, $54, $ea  ; 46a1: e0 00 00...
    !byte $aa, $aa, $80,   0, $30, $fe,   5, $0c, $0b, $83, $14, $c5  ; 46ad: aa aa 80...
    !byte $4e, $15, $28, $3a, $15,   5, $3a, $85, $45, $3a, $a1, $14  ; 46b9: 4e 15 28...
    !byte $ea, $a0, $53, $aa, $85, $4e, $aa, $14, $ea, $a8, $4e, $aa  ; 46c5: ea a0 53...
    !byte $a3,   4, $0e, $0c, $0b,   0, $44, $47, $14, $11, $13, $15  ; 46d1: a3 04 0e...
    !byte   4, $47,   5, $40,   3, $41, $50, $53, $10, $54, $53, $44  ; 46dd: 04 47 05...
    !byte $11, $43, $11,   1, $43, $44, $45, $47, $11,   5,   3, $44  ; 46e9: 11 43 11...
    !byte $41,   7, $11, $10, $13,   0,   0,   0,   0,   0,   0,   0  ; 46f5: 41 07 11...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4701: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 470d: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0, $fb, $ff, $0b  ; 4719: 00 00 00...
    !byte   8, $a3, $a4, $e9, $0e, $55, $39, $51, $39, $44, $d5, $53  ; 4725: 08 a3 a4...
    !byte $55, $53, $15, $14, $c4, $20, $e3,   0,   0,   0,   0,   0  ; 4731: 55 53 15...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 473d: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4749: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4755: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4761: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 476d: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4779: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4785: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4791: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 479d: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 47a9: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 47b5: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 47c1: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 47cd: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 47d9: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 47e5: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 47f1: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 47fd: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4809: 00 00 00...
    !byte $0e, $18, $11, $aa, $aa,   0,   0, $ea, $aa, $10, $10, $4e  ; 4815: 0e 18 11...
    !byte   0, $80, $41, $10, $c5, $51,   4,   1, $0c, $44, $41,   1  ; 4821: 00 80 41...
    !byte   4, $e0,   0, $10, $44, $0e, $a1,   0, $44,   4, $ea, $80  ; 482d: 04 e0 00...
    !byte   0, $10, $4e, $aa, $a0, $45, $10, $ea, $aa, $10, $10, $0e  ; 4839: 00 10 4e...
    !byte $aa, $a1, $40, $10, $ea, $aa, $10, $44, $4e, $aa, $a0, $44  ; 4845: aa a1 40...
    !byte $40, $ea, $aa,   4, $40, $4e, $aa, $a1,   1,   4, $ea, $aa  ; 4851: 40 ea aa...
    !byte   0,   4, $3a, $a0,   4, $11, $0e, $a1, $41, $44,   0, $e0  ; 485d: 00 04 3a...
    !byte   0, $10, $10, $4c, $55, $10, $41, $10, $c4, $40, $10, $40  ; 4869: 00 10 10...
    !byte $4e,   0,   1,   4, $10, $ea, $aa,   0, $45, $0e, $aa, $a8  ; 4875: 4e 00 01...
    !byte   0,   3,   0, $0f, $18, $0d, $aa, $80,   3, $aa,   0, $44  ; 4881: 00 03 00...
    !byte $e2,   4,   0, $30,   0,   4,   3, $11,   0, $41, $30,   0  ; 488d: e2 04 00...
    !byte   0, $43, $88,   1,   0, $3a, $81,   0, $43, $aa, $10, $10  ; 4899: 00 43 88...
    !byte $3a, $a0, $10, $0e, $a8,   4,   3, $aa, $10,   4, $3a, $a0  ; 48a5: 3a a0 10...
    !byte $11,   3, $aa,   0, $10, $3a, $a1,   0,   3, $aa,   0,   4  ; 48b1: 11 03 aa...
    !byte $ea, $84, $40, $3a,   0,   1,   3, $80,   1,   1, $30,   0  ; 48bd: ea 84 40...
    !byte   4,   3, $14, $10, $40, $30,   0,   0, $4e, $a8,   4,   3  ; 48c9: 04 03 14...
    !byte $aa, $80,   3,   1, $10, $16,   8, $80, $0c,   4, $0c,   1  ; 48d5: aa 80 03...
    !byte $0c,   0,   3,   4,   4, $e0,   0, $38,   4, $0c,   0, $4c  ; 48e1: 0c 00 03...
    !byte   0, $0c,   4, $4c, $10, $13,   0,   0, $c0, $10, $30, $10  ; 48ed: 00 0c 04...
    !byte $0c,   0, $0e,   4, $4e,   0,   3,   0,   0, $c0, $11, $30  ; 48f9: 0c 00 0e...
    !byte $11, $0c,   0, $0e,   0, $30, $fb,   2, $0a,   5, $aa, $3a  ; 4905: 11 0c 00...
    !byte   7, $45, $71, $5c, $57, $15, $c5, $71, $5d, $17, $51, $c0  ; 4911: 07 45 71...
    !byte $fd,   7, $0d,   9, $aa, $a8, $3a,   0, $13, $85, $51, $31  ; 491d: fd 07 0d...
    !byte $40,   3, $14, $a8, $31, $47, $14, $71, $47, $14, $a8, $31  ; 4929: 40 03 14...
    !byte $40, $13, $85, $51, $3a,   0,   3, $aa, $a8, $30,   0,   0  ; 4935: 40 13 85...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4941: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 494d: 00 00 00...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4959: 00 00 00...
    !byte   0,   0, $f6,   1, $1a, $15, $83, $14, $c5, $4e, $15, $38  ; 4965: 00 00 f6...
    !byte $55, $3a, $15, $4e, $85, $54, $ea, $15, $50, $ea, $15, $55  ; 4971: 55 3a 15...
    !byte $0e, $a8, $55, $55, $0e, $88, $55, $41, $53, $84, $aa, $85  ; 497d: 0e a8 55...
    !byte $3a, $2a, $aa, $13, $aa, $2a, $a8, $ea, $12, $a3, $a8, $52  ; 4989: 3a 2a aa...
    !byte $13, $aa,   5, $45, $55, $54, $ea, $a8, $55, $55, $55, $3a  ; 4995: 13 aa 05...
    !byte $aa, $85, $55, $55, $53, $aa, $aa,   5, $45, $55, $3a, $aa  ; 49a1: aa 85 55...
    !byte $aa,   1, $55, $53, $aa, $aa, $aa, $10, $45, $3a, $aa, $aa  ; 49ad: aa 01 55...
    !byte $84, $15, $53, $aa, $aa, $a8, $55, $54, $ea, $aa, $aa, $85  ; 49b9: 84 15 53...
    !byte $54, $ea, $aa, $aa, $a0,   3, $f9,   3, $16, $18, $83, $14  ; 49c5: 54 ea aa...
    !byte $31, $54, $38, $55, $43, $a1, $55, $40, $ea, $15, $55, $40  ; 49d1: 31 54 38...
    !byte $3a, $a1, $55, $55, $50, $ea, $81, $55, $41, $54, $ea, $12  ; 49dd: 3a a1 55...
    !byte $aa, $14, $ea, $8a, $aa, $84, $ea, $a8, $aa, $a3, $aa, $84  ; 49e9: aa 14 ea...
    !byte $a8, $ea, $a1, $48, $4e, $aa, $80, $51, $55, $55, $4e, $aa  ; 49f5: a8 ea a1...
    !byte $aa, $15, $55, $55, $53, $aa, $aa, $a0, $55, $15, $54, $ea  ; 4a01: aa 15 55...
    !byte $aa, $aa, $80, $15, $55, $3a, $aa, $aa, $aa, $84, $11, $4e  ; 4a0d: aa aa 80...
    !byte $aa, $aa, $aa, $84, $15, $53, $aa, $aa, $aa, $a1, $55, $53  ; 4a19: aa aa aa...
    !byte $aa, $aa, $aa, $a8, $55, $4e, $aa, $aa, $aa, $a8,   0, $c0  ; 4a25: aa aa aa...
    !byte $f6,   1, $1b, $15, $83, $14, $c5, $4e, $15, $38, $55, $3a  ; 4a31: f6 01 1b...
    !byte $15, $4e, $85, $54, $ea, $15, $50, $ea, $15, $55, $0e, $a8  ; 4a3d: 15 4e 85...
    !byte $55, $55, $0e, $88, $55, $41, $53, $84, $aa, $85, $3a, $2a  ; 4a49: 55 55 0e...
    !byte $aa, $13, $aa, $2a, $a8, $ea, $12, $a3, $a8, $52, $13, $aa  ; 4a55: aa 13 aa...
    !byte   5, $45, $55, $54, $ea, $a8, $55, $55, $55, $3a, $aa, $85  ; 4a61: 05 45 55...
    !byte $55, $55, $53, $aa, $aa,   5, $45, $55, $3a, $aa, $aa,   1  ; 4a6d: 55 55 53...
    !byte $55, $53, $aa, $aa, $aa, $10, $45, $3a, $aa, $aa, $a8, $85  ; 4a79: 55 53 aa...
    !byte $53, $aa, $aa, $aa, $a8, $54, $ea, $aa, $aa, $a8, $54, $ea  ; 4a85: 53 aa aa...
    !byte $aa, $aa, $a1, $53, $aa, $aa, $aa, $a0, $30, $fe,   5, $0d  ; 4a91: aa aa a1...
    !byte $0b, $83, $14, $c5, $4e, $15, $28, $3a, $15,   5, $3a, $85  ; 4a9d: 0b 83 14...
    !byte $45, $3a, $a1, $14, $ea, $a0, $53, $aa, $85, $4e, $aa, $14  ; 4aa9: 45 3a a1...
    !byte $ea, $a8, $4e, $aa, $a1, $ea, $aa, $8c                      ; 4ab5: ea a8 4e...
pydis_end

; Automatically generated labels:
;     c3b02
;     c3b0c
;     c3bfb
;     c3c0b
;     c3c3d
;     c3c6b
;     c3c83
;     c3c86
;     c3c89
;     c3cbf
;     c3cee
;     c3d12
;     c3d26
;     c3d74
;     c3e89
;     c3ed8
;     c3edb
;     c3ede
;     c3ef4
;     c3f04
;     c3f20
;     c3f30
;     c3f76
;     c3f86
;     c3f96
;     c3fb5
;     c3fd3
;     c3fdd
;     c3fe4
;     c4009
;     c4031
;     c4032
;     c4035
;     c4053
;     c4068
;     c4071
;     c4079
;     c40ae
;     c40bf
;     c40d0
;     c4177
;     c4187
;     c4194
;     c41d0
;     c41d5
;     c4242
;     c4265
;     c4278
;     c428a
;     c428d
;     c4290
;     c42ad
;     c42bb
;     c42be
;     c42e5
;     c42ef
;     c42fe
;     c4314
;     c4328
;     c433d
;     c4340
;     c4374
;     c4383
;     c4393
;     c43a5
;     c43b8
;     c43bc
;     c43c5
;     c43ca
;     c43cd
;     c43e5
;     c43ec
;     c4424
;     l0015
;     l0070
;     l0071
;     l0955
;     l096b
;     l097f
;     l0980
;     l0981
;     l0982
;     l0983
;     l0997
;     l09aa
;     l09ab
;     l09ac
;     l09ad
;     l09ae
;     l09af
;     l09b6
;     l09c3
;     l0a0a
;     l0a0b
;     l0a0c
;     l0a0d
;     l0a6f
;     l0a70
;     l0a71
;     l0a72
;     l0a73
;     l0a74
;     l0a75
;     l0a76
;     l0a77
;     l0a78
;     l18a6
;     l2ee9
;     l2eee
;     l38ae
;     l38c4
;     l3d75
;     l3d76
;     l3d77
;     l3d78
;     l3d79
;     l40d1
;     l421e
;     l4425
;     l4426
;     l4427
;     l4428
;     l4429
;     l442a
;     l442b
;     l442c
;     l442d
;     l442e
;     l442f
;     l4430
;     loop_c3ba5
;     loop_c3e37
;     loop_c44e2
;     sub_c3bb3
;     sub_c3bea
;     sub_c3e45
;     sub_c3fe5
;     sub_c41a1
;     sub_c422d
;     sub_c44f0
!if (level_specific_initialisation) != $3af2 {
    !error "Assertion failed: level_specific_initialisation == $3af2"
}
!if (level_specific_password) != $3ae7 {
    !error "Assertion failed: level_specific_password == $3ae7"
}
!if (level_specific_update) != $3b0d {
    !error "Assertion failed: level_specific_update == $3b0d"
}
!if (room_0_data) != $3b1d {
    !error "Assertion failed: room_0_data == $3b1d"
}
!if (room_1_data) != $3d7a {
    !error "Assertion failed: room_1_data == $3d7a"
}
!if (room_2_data) != $40dd {
    !error "Assertion failed: room_2_data == $40dd"
}
!if (room_3_data) != $4431 {
    !error "Assertion failed: room_3_data == $4431"
}
!if (sprite_data - level_data) != $0aac {
    !error "Assertion failed: sprite_data - level_data == $0aac"
}
