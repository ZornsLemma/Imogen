; Constants
copy_mode_2x2                      = 0
copy_mode_random16                 = 16
copy_mode_random2                  = 2
copy_mode_random32                 = 32
copy_mode_random4                  = 4
copy_mode_random64                 = 64
copy_mode_random8                  = 8
copy_mode_simple                   = 1
first_level_letter                 = 65
game_area_height_cells             = 24
game_area_width_cells              = 40
last_level_letter                  = 81
objectid_left_mouse                = 2
objectid_left_trapdoor             = 2
objectid_mouse_ball                = 4
objectid_player                    = 0
objectid_right_mouse               = 3
objectid_right_trapdoor            = 3
objectid_saxophone                 = 4
opcode_jmp                         = 76
player_collision_flag_baby         = 6
player_collision_flag_mouse_ball   = 128
spriteid_baby0                     = 214
spriteid_baby1                     = 215
spriteid_baby2                     = 216
spriteid_baby3                     = 217
spriteid_baby4                     = 218
spriteid_baby5                     = 219
spriteid_baby6                     = 220
spriteid_baby7                     = 221
spriteid_ball                      = 59
spriteid_mouse                     = 200
spriteid_mouse_hands1              = 201
spriteid_mouse_hands2              = 202
spriteid_mouse_hands3              = 212
spriteid_mouse_hands4              = 213
spriteid_saxophone                 = 211
spriteid_small_ball                = 203
spriteid_table                     = 222
spriteid_trapdoor_diagonal         = 208
spriteid_trapdoor_horizontal       = 207
spriteid_trapdoor_vertical         = 209

; Memory locations
characters_entered                                  = $05
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
player_held_item                                    = $52
developer_mode_sideways_ram_is_set_up_flag          = $5b
l0070                                               = $70
room_exit_direction                                 = $70
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
room1_trapdoor_open_flag                            = $09ff
saxophone_collected_flag                            = $0a00
l0a01                                               = $0a01
l0a02                                               = $0a02
l0a03                                               = $0a03
l0a04                                               = $0a04
mouse_ball_position                                 = $0a6f
l0a70                                               = $0a70
l0a71                                               = $0a71
l0a72                                               = $0a72
l0a73                                               = $0a73
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
initialise_brazier_and_fire                         = $1988
update_level_completion                             = $1a10
current_room_index                                  = $1aba
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
player_collision_flag                               = $2433
temp_left_offset                                    = $24d0
temp_right_offset                                   = $24d1
temp_top_offset                                     = $2550
temp_bottom_offset                                  = $2551
something59_TODO                                    = $2894
test_for_collision_between_objects_x_and_y          = $28e2
insert_character_menu_item_into_toolbar             = $2b87
find_or_create_menu_slot_for_A                      = $2bbd
remove_item_from_toolbar_menu                       = $2be0
l2eb6                                               = $2eb6
toolbar_collectable_spriteids                       = $2ee8
collectable_spriteids                               = $2eed
l2ef3                                               = $2ef3
print_encrypted_string_at_yx_centred                = $37f3
wait_one_second_then_check_keys                     = $388d
object_sprite_mask_type                             = $38ac
object_z_order                                      = $38c2
object_collision_flags                              = $38d8
play_sound_yx                                       = $38f6
define_envelope                                     = $395e
sound_priority_per_channel_table                    = $396f
check_menu_keys                                     = $3a8f
auxcode                                             = $53c0
check_password                                      = $53c0

    * = $3ad5

level_data
pydis_start
    !word sprite_data - level_data                                    ; 3ad5: d1 09       ..
level_init_after_load_handler_ptr
    !word level_init_after_load_handler                               ; 3ad7: f2 3a       .:
update_room_ptr
    !word level_update_handler                                        ; 3ad9: 17 3b       .;
level_name_ptr
    !word level_name                                                  ; 3adb: e7 3a       .:
    !byte 0, 1                                                        ; 3add: 00 01       ..
; This is a table of four words, used by code just below
; 'skip_adding_completion_spell_to_toolbar' where the l030-th element *plus 2* is
; called. TODO: Why +2? The code at c129b suggests the two bytes *at* the address in
; this table is used as an address of some kind.
; TODO: Speculation - could this be code to draw each of the screens making up the
; level? AFAICT saxophobia does have four screens. I assume the *number* of entries in
; this table is stored somewhere, but I can't see it. It is also possible that because
; entering rooms is handled by level specific code, the player always starts in room 0
; and there is no need to have a byte of data representing the maximum room number.
level_header_data
    !word room_1_data_ptr                                             ; 3adf: 27 3b       ';
    !word room_2_data_ptr                                             ; 3ae1: 3d 3d       ==
    !word room_3_data_ptr                                             ; 3ae3: d7 3f       .?
    !word room_4_data_ptr                                             ; 3ae5: 4d 42       MB
; 'SAXOPHOBIA\r' EOR-encrypted with $cb
level_name
    !byte $98, $8a, $93, $84, $9b, $83, $84, $89, $82, $8a, $c6       ; 3ae7: 98 8a 93... ...

level_init_after_load_handler
    lda desired_level                                                 ; 3af2: a5 31       .1
    cmp previous_level                                                ; 3af4: c5 51       .Q
    beq c3b0e                                                         ; 3af6: f0 16       ..
    lda developer_flags                                               ; 3af8: ad 03 11    ...
    bpl developer_mode_not_active                                     ; 3afb: 10 07       ..
    lda #spriteid_saxophone                                           ; 3afd: a9 d3       ..
    jsr find_or_create_menu_slot_for_A                                ; 3aff: 20 bd 2b     .+
    lda #$ff                                                          ; 3b02: a9 ff       ..
; reset the saxaphone collected flag. The user can choose during the course of a game
; to enter the password to continue playing this level having previously got the
; saxaphone.
; $3b04 referenced 1 time by $3afb
developer_mode_not_active
    lda saxophone_collected_flag                                      ; 3b04: ad 00 0a    ...
    beq c3b0e                                                         ; 3b07: f0 05       ..
    lda #spriteid_saxophone                                           ; 3b09: a9 d3       ..
    jsr find_or_create_menu_slot_for_A                                ; 3b0b: 20 bd 2b     .+
; $3b0e referenced 2 times by $3af6, $3b07
c3b0e
    lda #<ground_fill_2x2_top_left                                    ; 3b0e: a9 86       ..
    sta source_sprite_memory_low                                      ; 3b10: 85 40       .@
    lda #>ground_fill_2x2_top_left                                    ; 3b12: a9 44       .D
    sta source_sprite_memory_high                                     ; 3b14: 85 41       .A
    rts                                                               ; 3b16: 60          `

level_update_handler
    jsr room0_handler                                                 ; 3b17: 20 e4 3b     .;
    jsr room1_handler                                                 ; 3b1a: 20 fc 3d     .=
    jsr sub_c407f                                                     ; 3b1d: 20 7f 40     .@
    jsr sub_c3f02                                                     ; 3b20: 20 02 3f     .?
    jsr sub_c42f8                                                     ; 3b23: 20 f8 42     .B
    rts                                                               ; 3b26: 60          `

room_1_data_ptr
    !byte 20                                                          ; 3b27: 14          .              ; initial player X cell
    !byte 22                                                          ; 3b28: 16          .              ; initial player Y cell

; TODO: I suspect this next block up to and including the jsr is drawing the 'wall'
; pattern on the top two rows of the opening screen
room_1_code
    ldx #0                                                            ; 3b29: a2 00       ..
    ldy #0                                                            ; 3b2b: a0 00       ..
    lda #$ff                                                          ; 3b2d: a9 ff       ..
    sta width_in_cells                                                ; 3b2f: 85 3c       .<
    lda #2                                                            ; 3b31: a9 02       ..
    sta height_in_cells                                               ; 3b33: 85 3d       .=
; TODO: Setting a breakpoint in b-em shows l0042 is 0 here
; TODO: Setting a breakpoint in b-em shows some_data3_ptr ($40) is $4486 here
; TODO: Setting a breakpoint in b-em shows address1_low ($70) is $00 here
; TODO: Setting a breakpoint in b-em shows address1_high ($71) is $80 here
    jsr copy_rectangle_of_memory_to_screen                            ; 3b35: 20 bb 1a     ..
    ldy #2                                                            ; 3b38: a0 02       ..
    lda #4                                                            ; 3b3a: a9 04       ..
    sta width_in_cells                                                ; 3b3c: 85 3c       .<
    dec height_in_cells                                               ; 3b3e: c6 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 3b40: 20 bb 1a     ..
    iny                                                               ; 3b43: c8          .
    dec width_in_cells                                                ; 3b44: c6 3c       .<
    lda #$13                                                          ; 3b46: a9 13       ..
    sta height_in_cells                                               ; 3b48: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 3b4a: 20 bb 1a     ..
    ldy #$16                                                          ; 3b4d: a0 16       ..
    lda #$ff                                                          ; 3b4f: a9 ff       ..
    sta width_in_cells                                                ; 3b51: 85 3c       .<
    jsr copy_rectangle_of_memory_to_screen                            ; 3b53: 20 bb 1a     ..
    ldx #$22 ; '"'                                                    ; 3b56: a2 22       ."
    ldy #7                                                            ; 3b58: a0 07       ..
    lda #6                                                            ; 3b5a: a9 06       ..
    sta width_in_cells                                                ; 3b5c: 85 3c       .<
    lda #2                                                            ; 3b5e: a9 02       ..
    sta height_in_cells                                               ; 3b60: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 3b62: 20 bb 1a     ..
    ldx #$25 ; '%'                                                    ; 3b65: a2 25       .%
    ldy #9                                                            ; 3b67: a0 09       ..
    lda #$0d                                                          ; 3b69: a9 0d       ..
    sta height_in_cells                                               ; 3b6b: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 3b6d: 20 bb 1a     ..
    ldx #$0e                                                          ; 3b70: a2 0e       ..
    ldy #$0b                                                          ; 3b72: a0 0b       ..
    lda #3                                                            ; 3b74: a9 03       ..
    sta width_in_cells                                                ; 3b76: 85 3c       .<
    lda #2                                                            ; 3b78: a9 02       ..
    sta height_in_cells                                               ; 3b7a: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 3b7c: 20 bb 1a     ..
    ldx #$18                                                          ; 3b7f: a2 18       ..
    jsr copy_rectangle_of_memory_to_screen                            ; 3b81: 20 bb 1a     ..
; TODO: I suspect we've finished drawing the ground fill and are now switching to
; another pattern.
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3b84: 20 90 1b     ..
    lda #3                                                            ; 3b87: a9 03       ..
    sta width_in_cells                                                ; 3b89: 85 3c       .<
    lda #2                                                            ; 3b8b: a9 02       ..
    sta height_in_cells                                               ; 3b8d: 85 3d       .=
    lda #spriteid_table                                               ; 3b8f: a9 de       ..
    ldx #3                                                            ; 3b91: a2 03       ..
    ldy #$14                                                          ; 3b93: a0 14       ..
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3b95: 20 57 1f     W.
    ldx #6                                                            ; 3b98: a2 06       ..
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3b9a: 20 57 1f     W.
    ldx #9                                                            ; 3b9d: a2 09       ..
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3b9f: 20 57 1f     W.
    ldx #3                                                            ; 3ba2: a2 03       ..
    ldy #$12                                                          ; 3ba4: a0 12       ..
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3ba6: 20 57 1f     W.
    ldx #6                                                            ; 3ba9: a2 06       ..
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3bab: 20 57 1f     W.
    ldx #$0a                                                          ; 3bae: a2 0a       ..
    ldy #2                                                            ; 3bb0: a0 02       ..
    lda #$0a                                                          ; 3bb2: a9 0a       ..
    jsr draw_rope                                                     ; 3bb4: 20 b9 1d     ..
    ldx #$1e                                                          ; 3bb7: a2 1e       ..
    jsr draw_rope                                                     ; 3bb9: 20 b9 1d     ..
    ldx #$14                                                          ; 3bbc: a2 14       ..
    lda #$10                                                          ; 3bbe: a9 10       ..
    jsr draw_rope                                                     ; 3bc0: 20 b9 1d     ..
    ldx #$0f                                                          ; 3bc3: a2 0f       ..
    ldy #$0d                                                          ; 3bc5: a0 0d       ..
    lda #5                                                            ; 3bc7: a9 05       ..
    jsr draw_rope                                                     ; 3bc9: 20 b9 1d     ..
    ldx #$19                                                          ; 3bcc: a2 19       ..
    jsr draw_rope                                                     ; 3bce: 20 b9 1d     ..
    jsr start_room                                                    ; 3bd1: 20 bb 12     ..
; $3bd4 referenced 1 time by $3bdb
loop_c3bd4
    jsr game_update                                                   ; 3bd4: 20 da 12     ..
    sta room_exit_direction                                           ; 3bd7: 85 70       .p
    and #4                                                            ; 3bd9: 29 04       ).
    beq loop_c3bd4                                                    ; 3bdb: f0 f7       ..
    ldx #1                                                            ; 3bdd: a2 01       ..
    ldy desired_level                                                 ; 3bdf: a4 31       .1
    jsr initialise_level                                              ; 3be1: 20 40 11     @.
; Room 0 has two mice throwing a ball back and forth.
; $3be4 referenced 1 time by $3b17
room0_handler
    lda update_room_first_update_flag                                 ; 3be4: ad 2b 13    .+.
    bne initialise_mouse_ball_position_if_level_changed               ; 3be7: d0 03       ..
    jmp bump_and_wrap_mouse_ball_position                             ; 3be9: 4c 77 3c    Lw<

; $3bec referenced 1 time by $3be7
initialise_mouse_ball_position_if_level_changed
    lda desired_level                                                 ; 3bec: a5 31       .1
    cmp previous_level                                                ; 3bee: c5 51       .Q
    beq level_unchanged                                               ; 3bf0: f0 05       ..
    lda #0                                                            ; 3bf2: a9 00       ..
    sta mouse_ball_position                                           ; 3bf4: 8d 6f 0a    .o.
; $3bf7 referenced 1 time by $3bf0
level_unchanged
    lda desired_room_index                                            ; 3bf7: a5 30       .0
    cmp #0                                                            ; 3bf9: c9 00       ..
    bne move_mouse_ball_if_room_0_local                               ; 3bfb: d0 77       .w
    ldx #<envelope1                                                   ; 3bfd: a2 60       .`
    ldy #>envelope1                                                   ; 3bff: a0 44       .D
    jsr define_envelope                                               ; 3c01: 20 5e 39     ^9
; Perform shared initialisation for both mice
    lda #2                                                            ; 3c04: a9 02       ..
    sta width_in_cells                                                ; 3c06: 85 3c       .<
    sta height_in_cells                                               ; 3c08: 85 3d       .=
    lda #3                                                            ; 3c0a: a9 03       ..
    sta value_to_write_to_collision_map                               ; 3c0c: 85 3e       .>
; Set up the left mouse
    ldx #$10                                                          ; 3c0e: a2 10       ..
    ldy #$0b                                                          ; 3c10: a0 0b       ..
    lda #$fe                                                          ; 3c12: a9 fe       ..
    sta temp_sprite_y_offset                                          ; 3c14: 85 3b       .;
    lda #spriteid_mouse                                               ; 3c16: a9 c8       ..
    jsr draw_sprite_a_at_cell_xy                                      ; 3c18: 20 4c 1f     L.
    dex                                                               ; 3c1b: ca          .
    dey                                                               ; 3c1c: 88          .
    dey                                                               ; 3c1d: 88          .
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3c1e: 20 44 1e     D.
    ldx #objectid_left_mouse                                          ; 3c21: a2 02       ..
    jsr set_object_position_from_current_sprite_position              ; 3c23: 20 6d 1f     m.
    lda #$cd                                                          ; 3c26: a9 cd       ..
    sta object_sprite_mask_type,x                                     ; 3c28: 9d ac 38    ..8
    lda #$c0                                                          ; 3c2b: a9 c0       ..
    sta object_z_order,x                                              ; 3c2d: 9d c2 38    ..8
; Set up the right mouse
    lda #$ff                                                          ; 3c30: a9 ff       ..
    sta sprite_reflect_flag                                           ; 3c32: 85 1d       ..
    ldx #$19                                                          ; 3c34: a2 19       ..
    ldy #$0b                                                          ; 3c36: a0 0b       ..
    lda #$fe                                                          ; 3c38: a9 fe       ..
    sta temp_sprite_y_offset                                          ; 3c3a: 85 3b       .;
    lda #spriteid_mouse                                               ; 3c3c: a9 c8       ..
    jsr draw_sprite_a_at_cell_xy                                      ; 3c3e: 20 4c 1f     L.
    dex                                                               ; 3c41: ca          .
    dey                                                               ; 3c42: 88          .
    dey                                                               ; 3c43: 88          .
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3c44: 20 44 1e     D.
    ldx #objectid_right_mouse                                         ; 3c47: a2 03       ..
    jsr set_object_position_from_current_sprite_position              ; 3c49: 20 6d 1f     m.
    lda #$ff                                                          ; 3c4c: a9 ff       ..
    sta object_direction,x                                            ; 3c4e: 9d be 09    ...
    lda #$ce                                                          ; 3c51: a9 ce       ..
    sta object_sprite_mask_type,x                                     ; 3c53: 9d ac 38    ..8
    lda #$c0                                                          ; 3c56: a9 c0       ..
    sta object_z_order,x                                              ; 3c58: 9d c2 38    ..8
; Set up the ball TODO: plausible guess
    ldx #objectid_mouse_ball                                          ; 3c5b: a2 04       ..
    lda #0                                                            ; 3c5d: a9 00       ..
    sta object_x_high,x                                               ; 3c5f: 9d 66 09    .f.
    sta object_y_high,x                                               ; 3c62: 9d 92 09    ...
    lda #1                                                            ; 3c65: a9 01       ..
    sta object_direction,x                                            ; 3c67: 9d be 09    ...
    lda #$cc                                                          ; 3c6a: a9 cc       ..
    sta object_sprite_mask_type,x                                     ; 3c6c: 9d ac 38    ..8
    lda #$40 ; '@'                                                    ; 3c6f: a9 40       .@
    sta object_z_order,x                                              ; 3c71: 9d c2 38    ..8
; $3c74 referenced 1 time by $3bfb
move_mouse_ball_if_room_0_local
    jmp move_mouse_ball_if_room_0                                     ; 3c74: 4c a8 3c    L.<

; $3c77 referenced 1 time by $3be9
bump_and_wrap_mouse_ball_position
    ldy mouse_ball_position                                           ; 3c77: ac 6f 0a    .o.
    iny                                                               ; 3c7a: c8          .
    cpy #$1e                                                          ; 3c7b: c0 1e       ..
    bcc no_wrap_needed                                                ; 3c7d: 90 02       ..
    ldy #0                                                            ; 3c7f: a0 00       ..
; $3c81 referenced 1 time by $3c7d
no_wrap_needed
    sty mouse_ball_position                                           ; 3c81: 8c 6f 0a    .o.
    lda desired_room_index                                            ; 3c84: a5 30       .0
    cmp #0                                                            ; 3c86: c9 00       ..
    bne move_mouse_ball_if_room_0                                     ; 3c88: d0 1e       ..
    tya                                                               ; 3c8a: 98          .
    beq play_mouse_ball_sounds                                        ; 3c8b: f0 04       ..
    cpy #$0f                                                          ; 3c8d: c0 0f       ..
    bne move_mouse_ball_if_room_0                                     ; 3c8f: d0 17       ..
; $3c91 referenced 1 time by $3c8b
play_mouse_ball_sounds
    lda #0                                                            ; 3c91: a9 00       ..
    ldx #<mouse_ball_sound1                                           ; 3c93: a2 7e       .~
    ldy #>mouse_ball_sound1                                           ; 3c95: a0 44       .D
    jsr play_sound_yx                                                 ; 3c97: 20 f6 38     .8
    ldx #<mouse_ball_sound2                                           ; 3c9a: a2 76       .v
    ldy #>mouse_ball_sound2                                           ; 3c9c: a0 44       .D
    jsr play_sound_yx                                                 ; 3c9e: 20 f6 38     .8
    ldx #<mouse_ball_sound3                                           ; 3ca1: a2 6e       .n
    ldy #>mouse_ball_sound3                                           ; 3ca3: a0 44       .D
    jsr play_sound_yx                                                 ; 3ca5: 20 f6 38     .8
; $3ca8 referenced 3 times by $3c74, $3c88, $3c8f
move_mouse_ball_if_room_0
    lda desired_room_index                                            ; 3ca8: a5 30       .0
    cmp #0                                                            ; 3caa: c9 00       ..
    bne return1                                                       ; 3cac: d0 72       .r
    lda mouse_ball_position                                           ; 3cae: ad 6f 0a    .o.
    cmp #8                                                            ; 3cb1: c9 08       ..
    bcs mouse_ball_position_ge_8                                      ; 3cb3: b0 04       ..
    ldy #0                                                            ; 3cb5: a0 00       ..
    beq mouse_ball_position_lt_8                                      ; 3cb7: f0 0a       ..             ; always branch
; $3cb9 referenced 1 time by $3cb3
mouse_ball_position_ge_8
    cmp #$0f                                                          ; 3cb9: c9 0f       ..
    bcs mouse_ball_position_ge_0xf                                    ; 3cbb: b0 1c       ..
    sec                                                               ; 3cbd: 38          8
    sbc #8                                                            ; 3cbe: e9 08       ..
    asl                                                               ; 3cc0: 0a          .
    asl                                                               ; 3cc1: 0a          .
    tay                                                               ; 3cc2: a8          .
; $3cc3 referenced 1 time by $3cb7
mouse_ball_position_lt_8
    lda mouse_sprites_and_ball_movement_table,y                       ; 3cc3: b9 21 3d    .!=
; Set the mouse sprites as a pair of values in the table
    sta object_spriteid + objectid_left_mouse                         ; 3cc6: 8d aa 09    ...
    iny                                                               ; 3cc9: c8          .
    lda mouse_sprites_and_ball_movement_table,y                       ; 3cca: b9 21 3d    .!=
    sta object_spriteid + objectid_right_mouse                        ; 3ccd: 8d ab 09    ...
    lda #$88                                                          ; 3cd0: a9 88       ..
    clc                                                               ; 3cd2: 18          .
    iny                                                               ; 3cd3: c8          .
    adc mouse_sprites_and_ball_movement_table,y                       ; 3cd4: 79 21 3d    y!=
; TODO: always branch? not sure, but superficially it would seem nothing in
; mouse_sprites_and_ball_movement_table is -$88, i.e. $78
    bne finish_mouse_ball_movement                                    ; 3cd7: d0 22       ."
; $3cd9 referenced 1 time by $3cbb
mouse_ball_position_ge_0xf
    cmp #$17                                                          ; 3cd9: c9 17       ..
    bcs mouse_ball_position_ge_0x17                                   ; 3cdb: b0 04       ..
    ldy #0                                                            ; 3cdd: a0 00       ..
    beq mouse_ball_position_ge_0xf_common_tail                        ; 3cdf: f0 06       ..             ; always branch
; $3ce1 referenced 1 time by $3cdb
mouse_ball_position_ge_0x17
    sec                                                               ; 3ce1: 38          8
    sbc #$17                                                          ; 3ce2: e9 17       ..
    asl                                                               ; 3ce4: 0a          .
    asl                                                               ; 3ce5: 0a          .
    tay                                                               ; 3ce6: a8          .
; $3ce7 referenced 1 time by $3cdf
mouse_ball_position_ge_0xf_common_tail
    lda mouse_sprites_and_ball_movement_table,y                       ; 3ce7: b9 21 3d    .!=
    sta object_spriteid + objectid_right_mouse                        ; 3cea: 8d ab 09    ...
    iny                                                               ; 3ced: c8          .
    lda mouse_sprites_and_ball_movement_table,y                       ; 3cee: b9 21 3d    .!=
    sta object_spriteid + objectid_left_mouse                         ; 3cf1: 8d aa 09    ...
    lda #$c0                                                          ; 3cf4: a9 c0       ..
    sec                                                               ; 3cf6: 38          8
    iny                                                               ; 3cf7: c8          .
    sbc mouse_sprites_and_ball_movement_table,y                       ; 3cf8: f9 21 3d    .!=
; $3cfb referenced 1 time by $3cd7
finish_mouse_ball_movement
    sta object_x_low + objectid_mouse_ball                            ; 3cfb: 8d 54 09    .T.
    lda #$53 ; 'S'                                                    ; 3cfe: a9 53       .S
    sec                                                               ; 3d00: 38          8
    iny                                                               ; 3d01: c8          .
    sbc mouse_sprites_and_ball_movement_table,y                       ; 3d02: f9 21 3d    .!=
    sta object_y_low + objectid_mouse_ball                            ; 3d05: 8d 80 09    ...
    lda #spriteid_small_ball                                          ; 3d08: a9 cb       ..
    sta object_spriteid + objectid_mouse_ball                         ; 3d0a: 8d ac 09    ...
    lda update_room_first_update_flag                                 ; 3d0d: ad 2b 13    .+.
    bne return1                                                       ; 3d10: d0 0e       ..
; Check for player-ball collision
    ldx #objectid_player                                              ; 3d12: a2 00       ..
    ldy #objectid_mouse_ball                                          ; 3d14: a0 04       ..
    jsr test_for_collision_between_objects_x_and_y                    ; 3d16: 20 e2 28     .(
    beq return1                                                       ; 3d19: f0 05       ..
    lda #player_collision_flag_mouse_ball                             ; 3d1b: a9 80       ..
    sta player_collision_flag                                         ; 3d1d: 8d 33 24    .3$
; $3d20 referenced 3 times by $3cac, $3d10, $3d19
return1
    rts                                                               ; 3d20: 60          `

; $3d21 referenced 7 times by $3cc3, $3cca, $3cd4, $3ce7, $3cee, $3cf8, $3d02
mouse_sprites_and_ball_movement_table
    !byte spriteid_mouse_hands3                                       ; 3d21: d4          .
    !byte spriteid_mouse_hands1                                       ; 3d22: c9          .
    !byte 0, 0                                                        ; 3d23: 00 00       ..
    !byte spriteid_mouse_hands2                                       ; 3d25: ca          .
    !byte spriteid_mouse_hands1                                       ; 3d26: c9          .
    !byte 8, 6                                                        ; 3d27: 08 06       ..
    !byte spriteid_mouse_hands2                                       ; 3d29: ca          .
    !byte spriteid_mouse_hands1                                       ; 3d2a: c9          .
    !byte 16, 10                                                      ; 3d2b: 10 0a       ..
    !byte spriteid_mouse_hands2                                       ; 3d2d: ca          .
    !byte spriteid_mouse_hands4                                       ; 3d2e: d5          .
    !byte 24, 12                                                      ; 3d2f: 18 0c       ..
    !byte spriteid_mouse_hands4                                       ; 3d31: d5          .
    !byte spriteid_mouse_hands2                                       ; 3d32: ca          .
    !byte 32, 12                                                      ; 3d33: 20 0c        .
    !byte spriteid_mouse_hands1                                       ; 3d35: c9          .
    !byte spriteid_mouse_hands2                                       ; 3d36: ca          .
    !byte 40, 10                                                      ; 3d37: 28 0a       (.
    !byte spriteid_mouse_hands1                                       ; 3d39: c9          .
    !byte spriteid_mouse_hands2                                       ; 3d3a: ca          .
    !byte 48,  6                                                      ; 3d3b: 30 06       0.
room_2_data_ptr
    !byte 9                                                           ; 3d3d: 09          .              ; initial player X cell
    !byte 7                                                           ; 3d3e: 07          .              ; initial player Y cell

room_2_code
    ldx #0                                                            ; 3d3f: a2 00       ..
    ldy #0                                                            ; 3d41: a0 00       ..
    lda #$ff                                                          ; 3d43: a9 ff       ..
    sta width_in_cells                                                ; 3d45: 85 3c       .<
    lda #2                                                            ; 3d47: a9 02       ..
    sta height_in_cells                                               ; 3d49: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 3d4b: 20 bb 1a     ..
    ldy #7                                                            ; 3d4e: a0 07       ..
    lda #$11                                                          ; 3d50: a9 11       ..
    sta width_in_cells                                                ; 3d52: 85 3c       .<
    jsr copy_rectangle_of_memory_to_screen                            ; 3d54: 20 bb 1a     ..
    ldx #$17                                                          ; 3d57: a2 17       ..
    jsr copy_rectangle_of_memory_to_screen                            ; 3d59: 20 bb 1a     ..
    ldx #0                                                            ; 3d5c: a2 00       ..
    ldy #$16                                                          ; 3d5e: a0 16       ..
    jsr copy_rectangle_of_memory_to_screen                            ; 3d60: 20 bb 1a     ..
    ldx #$17                                                          ; 3d63: a2 17       ..
    jsr copy_rectangle_of_memory_to_screen                            ; 3d65: 20 bb 1a     ..
    ldx #0                                                            ; 3d68: a2 00       ..
    ldy #9                                                            ; 3d6a: a0 09       ..
    lda #4                                                            ; 3d6c: a9 04       ..
    sta width_in_cells                                                ; 3d6e: 85 3c       .<
    dec height_in_cells                                               ; 3d70: c6 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 3d72: 20 bb 1a     ..
    ldx #$0d                                                          ; 3d75: a2 0d       ..
    jsr copy_rectangle_of_memory_to_screen                            ; 3d77: 20 bb 1a     ..
    ldx #$17                                                          ; 3d7a: a2 17       ..
    jsr copy_rectangle_of_memory_to_screen                            ; 3d7c: 20 bb 1a     ..
    ldx #$24 ; '$'                                                    ; 3d7f: a2 24       .$
    jsr copy_rectangle_of_memory_to_screen                            ; 3d81: 20 bb 1a     ..
    ldx #0                                                            ; 3d84: a2 00       ..
    iny                                                               ; 3d86: c8          .
    dec width_in_cells                                                ; 3d87: c6 3c       .<
    lda #$0c                                                          ; 3d89: a9 0c       ..
    sta height_in_cells                                               ; 3d8b: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 3d8d: 20 bb 1a     ..
    ldx #$0e                                                          ; 3d90: a2 0e       ..
    jsr copy_rectangle_of_memory_to_screen                            ; 3d92: 20 bb 1a     ..
    ldx #$17                                                          ; 3d95: a2 17       ..
    jsr copy_rectangle_of_memory_to_screen                            ; 3d97: 20 bb 1a     ..
    ldx #$25 ; '%'                                                    ; 3d9a: a2 25       .%
    lda #3                                                            ; 3d9c: a9 03       ..
    sta height_in_cells                                               ; 3d9e: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 3da0: 20 bb 1a     ..
    ldy #$12                                                          ; 3da3: a0 12       ..
    inc height_in_cells                                               ; 3da5: e6 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 3da7: 20 bb 1a     ..
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 3daa: 20 90 1b     ..
    lda #3                                                            ; 3dad: a9 03       ..
    sta width_in_cells                                                ; 3daf: 85 3c       .<
    lda #2                                                            ; 3db1: a9 02       ..
    sta height_in_cells                                               ; 3db3: 85 3d       .=
    lda #spriteid_table                                               ; 3db5: a9 de       ..
    ldx #$1a                                                          ; 3db7: a2 1a       ..
    ldy #$14                                                          ; 3db9: a0 14       ..
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3dbb: 20 57 1f     W.
    ldx #$22 ; '"'                                                    ; 3dbe: a2 22       ."
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3dc0: 20 57 1f     W.
    ldy #$12                                                          ; 3dc3: a0 12       ..
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3dc5: 20 57 1f     W.
    ldx #7                                                            ; 3dc8: a2 07       ..
    ldy #$14                                                          ; 3dca: a0 14       ..
    jsr draw_sprite_a_at_cell_xy_and_write_to_collision_map           ; 3dcc: 20 57 1f     W.
    jsr start_room                                                    ; 3dcf: 20 bb 12     ..
; $3dd2 referenced 1 time by $3df3
c3dd2
    jsr game_update                                                   ; 3dd2: 20 da 12     ..
    sta room_exit_direction                                           ; 3dd5: 85 70       .p
    and #1                                                            ; 3dd7: 29 01       ).
    beq c3de2                                                         ; 3dd9: f0 07       ..
    ldx #0                                                            ; 3ddb: a2 00       ..
    ldy desired_level                                                 ; 3ddd: a4 31       .1
    jmp initialise_level                                              ; 3ddf: 4c 40 11    L@.

; $3de2 referenced 1 time by $3dd9
c3de2
    lda room_exit_direction                                           ; 3de2: a5 70       .p
    and #2                                                            ; 3de4: 29 02       ).
    beq c3def                                                         ; 3de6: f0 07       ..
    ldx #2                                                            ; 3de8: a2 02       ..
    ldy desired_level                                                 ; 3dea: a4 31       .1
    jmp initialise_level                                              ; 3dec: 4c 40 11    L@.

; $3def referenced 1 time by $3de6
c3def
    lda room_exit_direction                                           ; 3def: a5 70       .p
    and #4                                                            ; 3df1: 29 04       ).
    beq c3dd2                                                         ; 3df3: f0 dd       ..
    ldx #3                                                            ; 3df5: a2 03       ..
    ldy desired_level                                                 ; 3df7: a4 31       .1
    jmp initialise_level                                              ; 3df9: 4c 40 11    L@.

; Room 1 has a trapdoor which opens when the wizard stands on it holding the saxophone.
; $3dfc referenced 1 time by $3b1a
room1_handler
    lda update_room_first_update_flag                                 ; 3dfc: ad 2b 13    .+.
    beq room1_not_first_update                                        ; 3dff: f0 6b       .k
    lda previous_level                                                ; 3e01: a5 51       .Q
    cmp desired_level                                                 ; 3e03: c5 31       .1
    beq level_unchanged2                                              ; 3e05: f0 0a       ..
    lda room1_trapdoor_open_flag                                      ; 3e07: ad ff 09    ...
    beq level_unchanged2                                              ; 3e0a: f0 05       ..
    lda #$ff                                                          ; 3e0c: a9 ff       ..
    sta room1_trapdoor_open_flag                                      ; 3e0e: 8d ff 09    ...
; $3e11 referenced 2 times by $3e05, $3e0a
level_unchanged2
    lda desired_room_index                                            ; 3e11: a5 30       .0
    cmp #1                                                            ; 3e13: c9 01       ..
    bne room1_initial_setup_done                                      ; 3e15: d0 52       .R
    ldx #<envelope2                                                   ; 3e17: a2 2c       .,
    ldy #>envelope2                                                   ; 3e19: a0 44       .D
    jsr define_envelope                                               ; 3e1b: 20 5e 39     ^9
; Set up the objects for the two trapdoors.
    ldx #$11                                                          ; 3e1e: a2 11       ..
    ldy #7                                                            ; 3e20: a0 07       ..
    lda #objectid_left_trapdoor                                       ; 3e22: a9 02       ..
    jsr set_object_position_from_cell_xy                              ; 3e24: 20 5d 1f     ].
    tax                                                               ; 3e27: aa          .
    lda #1                                                            ; 3e28: a9 01       ..
    sta object_direction,x                                            ; 3e2a: 9d be 09    ...
    ldx #$17                                                          ; 3e2d: a2 17       ..
    lda #objectid_right_trapdoor                                      ; 3e2f: a9 03       ..
    jsr set_object_position_from_cell_xy                              ; 3e31: 20 5d 1f     ].
    tax                                                               ; 3e34: aa          .
    lda #$ff                                                          ; 3e35: a9 ff       ..
    sta object_direction,x                                            ; 3e37: 9d be 09    ...
    lda #3                                                            ; 3e3a: a9 03       ..
    sta value_to_write_to_collision_map                               ; 3e3c: 85 3e       .>
; Set up the collision map for the two trapdoors.
    lda room1_trapdoor_open_flag                                      ; 3e3e: ad ff 09    ...
    bne set_up_open_trapdoor_collision_map                            ; 3e41: d0 12       ..
; Set up the trapdoor collision map if they are closed.
    ldx #$11                                                          ; 3e43: a2 11       ..
    ldy #7                                                            ; 3e45: a0 07       ..
    lda #6                                                            ; 3e47: a9 06       ..
    sta width_in_cells                                                ; 3e49: 85 3c       .<
    lda #1                                                            ; 3e4b: a9 01       ..
    sta height_in_cells                                               ; 3e4d: 85 3d       .=
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e4f: 20 44 1e     D.
    jmp room1_initial_setup_done                                      ; 3e52: 4c 69 3e    Li>

; $3e55 referenced 1 time by $3e41
set_up_open_trapdoor_collision_map
    ldx #$11                                                          ; 3e55: a2 11       ..
    ldy #8                                                            ; 3e57: a0 08       ..
    lda #1                                                            ; 3e59: a9 01       ..
    sta width_in_cells                                                ; 3e5b: 85 3c       .<
    lda #2                                                            ; 3e5d: a9 02       ..
    sta height_in_cells                                               ; 3e5f: 85 3d       .=
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e61: 20 44 1e     D.
    ldx #$16                                                          ; 3e64: a2 16       ..
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3e66: 20 44 1e     D.
; $3e69 referenced 2 times by $3e15, $3e52
room1_initial_setup_done
    jmp set_room1_trapdoor_sprites_if_required                        ; 3e69: 4c d7 3e    L.>

; $3e6c referenced 1 time by $3dff
room1_not_first_update
    ldy room1_trapdoor_open_flag                                      ; 3e6c: ac ff 09    ...
    bmi set_room1_trapdoor_sprites_if_required                        ; 3e6f: 30 66       0f
    bne c3ec1                                                         ; 3e71: d0 4e       .N
    lda desired_room_index                                            ; 3e73: a5 30       .0
    cmp #1                                                            ; 3e75: c9 01       ..
    bne set_room1_trapdoor_sprites_if_required                        ; 3e77: d0 5e       .^
    lda player_held_item                                              ; 3e79: a5 52       .R
    beq set_room1_trapdoor_sprites_if_required                        ; 3e7b: f0 5a       .Z
    lda object_x_high                                                 ; 3e7d: ad 66 09    .f.
    bne set_room1_trapdoor_sprites_if_required                        ; 3e80: d0 55       .U
    lda object_x_low                                                  ; 3e82: ad 50 09    .P.
    cmp #$88                                                          ; 3e85: c9 88       ..
    bcc set_room1_trapdoor_sprites_if_required                        ; 3e87: 90 4e       .N
    cmp #$b8                                                          ; 3e89: c9 b8       ..
    bcs set_room1_trapdoor_sprites_if_required                        ; 3e8b: b0 4a       .J
    lda #2                                                            ; 3e8d: a9 02       ..
    sta temp_bottom_offset                                            ; 3e8f: 8d 51 25    .Q%
    lda #$0b                                                          ; 3e92: a9 0b       ..
    jsr something59_TODO                                              ; 3e94: 20 94 28     .(
    beq set_room1_trapdoor_sprites_if_required                        ; 3e97: f0 3e       .>
; Remove the closed trapdoor from the collision map.
    ldx #$11                                                          ; 3e99: a2 11       ..
    ldy #7                                                            ; 3e9b: a0 07       ..
    lda #6                                                            ; 3e9d: a9 06       ..
    sta width_in_cells                                                ; 3e9f: 85 3c       .<
    lda #1                                                            ; 3ea1: a9 01       ..
    sta height_in_cells                                               ; 3ea3: 85 3d       .=
    lda #0                                                            ; 3ea5: a9 00       ..
    sta value_to_write_to_collision_map                               ; 3ea7: 85 3e       .>
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3ea9: 20 44 1e     D.
; Add the two open trapdoors to the collision map.
    iny                                                               ; 3eac: c8          .
    lda #1                                                            ; 3ead: a9 01       ..
    sta width_in_cells                                                ; 3eaf: 85 3c       .<
    lda #2                                                            ; 3eb1: a9 02       ..
    sta height_in_cells                                               ; 3eb3: 85 3d       .=
    lda #3                                                            ; 3eb5: a9 03       ..
    sta value_to_write_to_collision_map                               ; 3eb7: 85 3e       .>
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3eb9: 20 44 1e     D.
    ldx #$16                                                          ; 3ebc: a2 16       ..
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 3ebe: 20 44 1e     D.
; $3ec1 referenced 1 time by $3e71
c3ec1
    ldy room1_trapdoor_open_flag                                      ; 3ec1: ac ff 09    ...
    iny                                                               ; 3ec4: c8          .
    cpy #2                                                            ; 3ec5: c0 02       ..
    bcc new_room1_trapdoor_open_flag_in_y                             ; 3ec7: 90 0b       ..
    lda desired_room_index                                            ; 3ec9: a5 30       .0
    cmp #1                                                            ; 3ecb: c9 01       ..
    bne c3ed2                                                         ; 3ecd: d0 03       ..
    jsr play_some_sound1_then_some_sound2                             ; 3ecf: 20 f1 3e     .>
; $3ed2 referenced 1 time by $3ecd
c3ed2
    ldy #$ff                                                          ; 3ed2: a0 ff       ..
; $3ed4 referenced 1 time by $3ec7
new_room1_trapdoor_open_flag_in_y
    sty room1_trapdoor_open_flag                                      ; 3ed4: 8c ff 09    ...
; $3ed7 referenced 8 times by $3e69, $3e6f, $3e77, $3e7b, $3e80, $3e87, $3e8b, $3e97
set_room1_trapdoor_sprites_if_required
    lda desired_room_index                                            ; 3ed7: a5 30       .0
    cmp #1                                                            ; 3ed9: c9 01       ..
    bne return2                                                       ; 3edb: d0 10       ..
    ldy room1_trapdoor_open_flag                                      ; 3edd: ac ff 09    ...
    bpl adjusted_room1_trapdoor_open_flag_in_y_is_ge_0                ; 3ee0: 10 02       ..
    ldy #2                                                            ; 3ee2: a0 02       ..
; $3ee4 referenced 1 time by $3ee0
adjusted_room1_trapdoor_open_flag_in_y_is_ge_0
    lda trapdoor_sprite_table,y                                       ; 3ee4: b9 ee 3e    ..>
    sta object_spriteid + objectid_left_trapdoor                      ; 3ee7: 8d aa 09    ...
    sta object_spriteid + objectid_right_trapdoor                     ; 3eea: 8d ab 09    ...
; $3eed referenced 1 time by $3edb
return2
    rts                                                               ; 3eed: 60          `

; $3eee referenced 1 time by $3ee4
trapdoor_sprite_table
    !byte spriteid_trapdoor_horizontal                                ; 3eee: cf          .
    !byte spriteid_trapdoor_diagonal                                  ; 3eef: d0          .
    !byte spriteid_trapdoor_vertical                                  ; 3ef0: d1          .

; $3ef1 referenced 2 times by $3ecf, $41d6
play_some_sound1_then_some_sound2
    lda #0                                                            ; 3ef1: a9 00       ..
    ldx #<some_sound1                                                 ; 3ef3: a2 42       .B
    ldy #>some_sound1                                                 ; 3ef5: a0 44       .D
    jsr play_sound_yx                                                 ; 3ef7: 20 f6 38     .8
    ldx #<some_sound2                                                 ; 3efa: a2 3a       .:
    ldy #>some_sound2                                                 ; 3efc: a0 44       .D
    jsr play_sound_yx                                                 ; 3efe: 20 f6 38     .8
    rts                                                               ; 3f01: 60          `

; $3f02 referenced 1 time by $3b20
sub_c3f02
    lda #1                                                            ; 3f02: a9 01       ..
    sta current_room_index                                            ; 3f04: 8d ba 1a    ...
    lda #5                                                            ; 3f07: a9 05       ..
    ldx #$1a                                                          ; 3f09: a2 1a       ..
    ldy #$0e                                                          ; 3f0b: a0 0e       ..
    jsr initialise_brazier_and_fire                                   ; 3f0d: 20 88 19     ..
    lda update_room_first_update_flag                                 ; 3f10: ad 2b 13    .+.
    beq c3f52                                                         ; 3f13: f0 3d       .=
    lda #$d3                                                          ; 3f15: a9 d3       ..
    sta toolbar_collectable_spriteids + 1                             ; 3f17: 8d e9 2e    ...
    lda #$d2                                                          ; 3f1a: a9 d2       ..
    sta collectable_spriteids + 1                                     ; 3f1c: 8d ee 2e    ...
    sta l2ef3                                                         ; 3f1f: 8d f3 2e    ...
    ldx #<envelope3                                                   ; 3f22: a2 16       ..
    ldy #>envelope3                                                   ; 3f24: a0 44       .D
    jsr define_envelope                                               ; 3f26: 20 5e 39     ^9
    lda desired_room_index                                            ; 3f29: a5 30       .0
    cmp #1                                                            ; 3f2b: c9 01       ..
    bne c3f51                                                         ; 3f2d: d0 22       ."
    lda saxophone_collected_flag                                      ; 3f2f: ad 00 0a    ...
    bne c3f51                                                         ; 3f32: d0 1d       ..
    ldx #$1b                                                          ; 3f34: a2 1b       ..
    ldy #$12                                                          ; 3f36: a0 12       ..
    lda #7                                                            ; 3f38: a9 07       ..
    sta temp_sprite_y_offset                                          ; 3f3a: 85 3b       .;
    lda #4                                                            ; 3f3c: a9 04       ..
    jsr set_object_position_from_cell_xy                              ; 3f3e: 20 5d 1f     ].
    tax                                                               ; 3f41: aa          .
    lda #1                                                            ; 3f42: a9 01       ..
    sta object_direction,x                                            ; 3f44: 9d be 09    ...
    lda #$cc                                                          ; 3f47: a9 cc       ..
    sta object_sprite_mask_type,x                                     ; 3f49: 9d ac 38    ..8
    lda #$d2                                                          ; 3f4c: a9 d2       ..
    sta object_spriteid,x                                             ; 3f4e: 9d a8 09    ...
; $3f51 referenced 2 times by $3f2d, $3f32
c3f51
    rts                                                               ; 3f51: 60          `

; $3f52 referenced 1 time by $3f13
c3f52
    lda l2eb6                                                         ; 3f52: ad b6 2e    ...
    cmp #$d3                                                          ; 3f55: c9 d3       ..
    bne c3f62                                                         ; 3f57: d0 09       ..
    lda #0                                                            ; 3f59: a9 00       ..
    ldx #<some_sound3                                                 ; 3f5b: a2 24       .$
    ldy #>some_sound3                                                 ; 3f5d: a0 44       .D
    jsr play_sound_yx                                                 ; 3f5f: 20 f6 38     .8
; $3f62 referenced 1 time by $3f57
c3f62
    lda desired_room_index                                            ; 3f62: a5 30       .0
    cmp #1                                                            ; 3f64: c9 01       ..
    bne c3f8a                                                         ; 3f66: d0 22       ."
    lda saxophone_collected_flag                                      ; 3f68: ad 00 0a    ...
    bne c3f8a                                                         ; 3f6b: d0 1d       ..
    lda #$d2                                                          ; 3f6d: a9 d2       ..
    sta object_spriteid + objectid_saxophone                          ; 3f6f: 8d ac 09    ...
    ldx #$0b                                                          ; 3f72: a2 0b       ..
    ldy #4                                                            ; 3f74: a0 04       ..
    jsr test_for_collision_between_objects_x_and_y                    ; 3f76: 20 e2 28     .(
    beq c3f8a                                                         ; 3f79: f0 0f       ..
; TODO: I suspect this is handling 'collection of the saxophone'
    lda #spriteid_saxophone                                           ; 3f7b: a9 d3       ..
    jsr find_or_create_menu_slot_for_A                                ; 3f7d: 20 bd 2b     .+
    lda #0                                                            ; 3f80: a9 00       ..
    sta object_spriteid + objectid_saxophone                          ; 3f82: 8d ac 09    ...
    lda #$ff                                                          ; 3f85: a9 ff       ..
    sta saxophone_collected_flag                                      ; 3f87: 8d 00 0a    ...
; $3f8a referenced 3 times by $3f66, $3f6b, $3f79
c3f8a
    rts                                                               ; 3f8a: 60          `

; $3f8b referenced 4 times by $3ffa, $3fff, $4004, $4009
sub_c3f8b
    stx l3fd5                                                         ; 3f8b: 8e d5 3f    ..?
    sty l3fd6                                                         ; 3f8e: 8c d6 3f    ..?
    inx                                                               ; 3f91: e8          .
    inx                                                               ; 3f92: e8          .
    lda #5                                                            ; 3f93: a9 05       ..
    sta width_in_cells                                                ; 3f95: 85 3c       .<
    lda #1                                                            ; 3f97: a9 01       ..
    sta height_in_cells                                               ; 3f99: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 3f9b: 20 bb 1a     ..
    dex                                                               ; 3f9e: ca          .
    iny                                                               ; 3f9f: c8          .
    lda #7                                                            ; 3fa0: a9 07       ..
    sta width_in_cells                                                ; 3fa2: 85 3c       .<
    jsr copy_rectangle_of_memory_to_screen                            ; 3fa4: 20 bb 1a     ..
    dex                                                               ; 3fa7: ca          .
    iny                                                               ; 3fa8: c8          .
    lda #9                                                            ; 3fa9: a9 09       ..
    sta width_in_cells                                                ; 3fab: 85 3c       .<
    lda #5                                                            ; 3fad: a9 05       ..
    sta height_in_cells                                               ; 3faf: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 3fb1: 20 bb 1a     ..
    inx                                                               ; 3fb4: e8          .
    tya                                                               ; 3fb5: 98          .
    clc                                                               ; 3fb6: 18          .
    adc #5                                                            ; 3fb7: 69 05       i.
    tay                                                               ; 3fb9: a8          .
    lda #7                                                            ; 3fba: a9 07       ..
    sta width_in_cells                                                ; 3fbc: 85 3c       .<
    lda #1                                                            ; 3fbe: a9 01       ..
    sta height_in_cells                                               ; 3fc0: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 3fc2: 20 bb 1a     ..
    inx                                                               ; 3fc5: e8          .
    iny                                                               ; 3fc6: c8          .
    lda #5                                                            ; 3fc7: a9 05       ..
    sta width_in_cells                                                ; 3fc9: 85 3c       .<
    jsr copy_rectangle_of_memory_to_screen                            ; 3fcb: 20 bb 1a     ..
    ldx l3fd5                                                         ; 3fce: ae d5 3f    ..?
    ldy l3fd6                                                         ; 3fd1: ac d6 3f    ..?
    rts                                                               ; 3fd4: 60          `

; $3fd5 referenced 2 times by $3f8b, $3fce
l3fd5
    !byte 0                                                           ; 3fd5: 00          .
; $3fd6 referenced 2 times by $3f8e, $3fd1
l3fd6
    !byte 0                                                           ; 3fd6: 00          .
room_3_data_ptr
    !byte 20                                                          ; 3fd7: 14          .              ; initial player X cell
    !byte 9                                                           ; 3fd8: 09          .              ; initial player Y cell

room_3_code
    ldx #0                                                            ; 3fd9: a2 00       ..
    ldy #0                                                            ; 3fdb: a0 00       ..
    lda #$ff                                                          ; 3fdd: a9 ff       ..
    sta width_in_cells                                                ; 3fdf: 85 3c       .<
    sta height_in_cells                                               ; 3fe1: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 3fe3: 20 bb 1a     ..
    lda #<tile_all_set_pixels                                         ; 3fe6: a9 a9       ..
    sta source_sprite_memory_low                                      ; 3fe8: 85 40       .@
    lda #>tile_all_set_pixels                                         ; 3fea: a9 0a       ..
    sta source_sprite_memory_high                                     ; 3fec: 85 41       .A
    lda #0                                                            ; 3fee: a9 00       ..
    sta value_to_write_to_collision_map                               ; 3ff0: 85 3e       .>
    lda #copy_mode_simple                                             ; 3ff2: a9 01       ..
    sta copy_mode                                                     ; 3ff4: 85 42       .B
    ldx #3                                                            ; 3ff6: a2 03       ..
    ldy #2                                                            ; 3ff8: a0 02       ..
    jsr sub_c3f8b                                                     ; 3ffa: 20 8b 3f     .?
    ldx #$1c                                                          ; 3ffd: a2 1c       ..
    jsr sub_c3f8b                                                     ; 3fff: 20 8b 3f     .?
    ldy #$0d                                                          ; 4002: a0 0d       ..
    jsr sub_c3f8b                                                     ; 4004: 20 8b 3f     .?
    ldx #3                                                            ; 4007: a2 03       ..
    jsr sub_c3f8b                                                     ; 4009: 20 8b 3f     .?
    ldx #$11                                                          ; 400c: a2 11       ..
    ldy #0                                                            ; 400e: a0 00       ..
    lda #6                                                            ; 4010: a9 06       ..
    sta width_in_cells                                                ; 4012: 85 3c       .<
    lda #4                                                            ; 4014: a9 04       ..
    sta height_in_cells                                               ; 4016: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 4018: 20 bb 1a     ..
    ldx #$0c                                                          ; 401b: a2 0c       ..
    ldy #4                                                            ; 401d: a0 04       ..
    lda #$10                                                          ; 401f: a9 10       ..
    sta width_in_cells                                                ; 4021: 85 3c       .<
    lda #5                                                            ; 4023: a9 05       ..
    sta height_in_cells                                               ; 4025: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 4027: 20 bb 1a     ..
    ldy #$0f                                                          ; 402a: a0 0f       ..
    jsr copy_rectangle_of_memory_to_screen                            ; 402c: 20 bb 1a     ..
    ldx #$1e                                                          ; 402f: a2 1e       ..
    ldy #$0b                                                          ; 4031: a0 0b       ..
    lda #5                                                            ; 4033: a9 05       ..
    sta width_in_cells                                                ; 4035: 85 3c       .<
    lda #2                                                            ; 4037: a9 02       ..
    sta height_in_cells                                               ; 4039: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 403b: 20 bb 1a     ..
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 403e: 20 90 1b     ..
    jsr start_room                                                    ; 4041: 20 bb 12     ..
; $4044 referenced 1 time by $4049
loop_c4044
    jsr game_update                                                   ; 4044: 20 da 12     ..
    and #8                                                            ; 4047: 29 08       ).
    beq loop_c4044                                                    ; 4049: f0 f9       ..
    ldx #1                                                            ; 404b: a2 01       ..
    ldy desired_level                                                 ; 404d: a4 31       .1
    jmp initialise_level                                              ; 404f: 4c 40 11    L@.

; $4052 referenced 2 times by $40ef, $4240
baby_spriteid_data
    !byte spriteid_baby0                                              ; 4052: d6          .
    !byte spriteid_baby1                                              ; 4053: d7          .
    !byte spriteid_baby2                                              ; 4054: d8          .
    !byte spriteid_baby3                                              ; 4055: d9          .
    !byte 0                                                           ; 4056: 00          .
    !byte spriteid_baby7                                              ; 4057: dd          .
    !byte spriteid_baby7                                              ; 4058: dd          .
    !byte spriteid_baby7                                              ; 4059: dd          .
    !byte spriteid_baby7                                              ; 405a: dd          .
    !byte spriteid_baby7                                              ; 405b: dd          .
    !byte spriteid_baby7                                              ; 405c: dd          .
    !byte spriteid_baby7                                              ; 405d: dd          .
    !byte spriteid_baby7                                              ; 405e: dd          .
    !byte $ff                                                         ; 405f: ff          .
    !byte spriteid_baby4                                              ; 4060: da          .
    !byte spriteid_baby4                                              ; 4061: da          .
    !byte spriteid_baby4                                              ; 4062: da          .
    !byte spriteid_baby4                                              ; 4063: da          .
    !byte spriteid_baby4                                              ; 4064: da          .
    !byte spriteid_baby4                                              ; 4065: da          .
    !byte spriteid_baby4                                              ; 4066: da          .
    !byte spriteid_baby4                                              ; 4067: da          .
    !byte spriteid_baby4                                              ; 4068: da          .
    !byte spriteid_baby4                                              ; 4069: da          .
    !byte 0                                                           ; 406a: 00          .
    !byte spriteid_baby5                                              ; 406b: db          .
    !byte spriteid_baby5                                              ; 406c: db          .
    !byte spriteid_baby5                                              ; 406d: db          .
    !byte spriteid_baby5                                              ; 406e: db          .
    !byte spriteid_baby5                                              ; 406f: db          .
    !byte spriteid_baby5                                              ; 4070: db          .
    !byte spriteid_baby5                                              ; 4071: db          .
    !byte spriteid_baby5                                              ; 4072: db          .
    !byte $ff                                                         ; 4073: ff          .
    !byte spriteid_baby3                                              ; 4074: d9          .
    !byte spriteid_baby3                                              ; 4075: d9          .
    !byte spriteid_baby3                                              ; 4076: d9          .
    !byte spriteid_baby3                                              ; 4077: d9          .
    !byte spriteid_baby3                                              ; 4078: d9          .
    !byte spriteid_baby3                                              ; 4079: d9          .
    !byte spriteid_baby3                                              ; 407a: d9          .
    !byte spriteid_baby3                                              ; 407b: d9          .
    !byte 0                                                           ; 407c: 00          .
    !byte spriteid_baby6                                              ; 407d: dc          .
    !byte 0                                                           ; 407e: 00          .

; $407f referenced 1 time by $3b1d
sub_c407f
    lda #2                                                            ; 407f: a9 02       ..
    sta current_room_index                                            ; 4081: 8d ba 1a    ...
    lda #3                                                            ; 4084: a9 03       ..             ; redundant instruction
    ldx #3                                                            ; 4086: a2 03       ..             ; redundant instruction
    ldy #$11                                                          ; 4088: a0 11       ..             ; redundant instruction
    ldx #7                                                            ; 408a: a2 07       ..
    lda #4                                                            ; 408c: a9 04       ..
    sta temp_sprite_x_offset                                          ; 408e: 85 3a       .:
    ldy #$16                                                          ; 4090: a0 16       ..
    lda #5                                                            ; 4092: a9 05       ..
    jsr update_level_completion                                       ; 4094: 20 10 1a     ..
    lda update_room_first_update_flag                                 ; 4097: ad 2b 13    .+.
    beq c40e4                                                         ; 409a: f0 48       .H
    lda desired_level                                                 ; 409c: a5 31       .1
    cmp previous_level                                                ; 409e: c5 51       .Q
    beq c40c1                                                         ; 40a0: f0 1f       ..
    ldy #$2b ; '+'                                                    ; 40a2: a0 2b       .+
    lda l0a04                                                         ; 40a4: ad 04 0a    ...
    ldx l0a03                                                         ; 40a7: ae 03 0a    ...
    bne c40b2                                                         ; 40aa: d0 06       ..
    ldy #0                                                            ; 40ac: a0 00       ..
    lda #1                                                            ; 40ae: a9 01       ..
    ldx #$a0                                                          ; 40b0: a2 a0       ..
; $40b2 referenced 1 time by $40aa
c40b2
    sty l0a72                                                         ; 40b2: 8c 72 0a    .r.
    sty l0a73                                                         ; 40b5: 8c 73 0a    .s.
    sta l0a04                                                         ; 40b8: 8d 04 0a    ...
    sta l0a71                                                         ; 40bb: 8d 71 0a    .q.
    stx l0a70                                                         ; 40be: 8e 70 0a    .p.
; $40c1 referenced 1 time by $40a0
c40c1
    lda desired_room_index                                            ; 40c1: a5 30       .0
    cmp #2                                                            ; 40c3: c9 02       ..
    bne c40e0                                                         ; 40c5: d0 19       ..
    ldx #<envelope2                                                   ; 40c7: a2 2c       .,
    ldy #>envelope2                                                   ; 40c9: a0 44       .D
    jsr define_envelope                                               ; 40cb: 20 5e 39     ^9
    ldx #0                                                            ; 40ce: a2 00       ..
    ldy #$14                                                          ; 40d0: a0 14       ..
    lda #$fe                                                          ; 40d2: a9 fe       ..
    sta temp_sprite_y_offset                                          ; 40d4: 85 3b       .;
    lda #2                                                            ; 40d6: a9 02       ..
    jsr set_object_position_from_cell_xy                              ; 40d8: 20 5d 1f     ].
    lda #$cc                                                          ; 40db: a9 cc       ..
    sta object_sprite_mask_type + objectid_left_mouse                 ; 40dd: 8d ae 38    ..8
; $40e0 referenced 1 time by $40c5
c40e0
    jmp c41d9                                                         ; 40e0: 4c d9 41    L.A

; $40e3 referenced 2 times by $4106, $410e
l40e3
    !byte 0                                                           ; 40e3: 00          .

; $40e4 referenced 1 time by $409a
c40e4
    ldy l0a73                                                         ; 40e4: ac 73 0a    .s.
    cpy #$2b ; '+'                                                    ; 40e7: c0 2b       .+
    bne c40ee                                                         ; 40e9: d0 03       ..
    jmp c41d9                                                         ; 40eb: 4c d9 41    L.A

; $40ee referenced 1 time by $40e9
c40ee
    iny                                                               ; 40ee: c8          .
    lda baby_spriteid_data,y                                          ; 40ef: b9 52 40    .R@
    bne c40f7                                                         ; 40f2: d0 03       ..
    ldy l0a72                                                         ; 40f4: ac 72 0a    .r.
; $40f7 referenced 1 time by $40f2
c40f7
    lda desired_room_index                                            ; 40f7: a5 30       .0
    cmp #2                                                            ; 40f9: c9 02       ..
    bne c412e                                                         ; 40fb: d0 31       .1
    lda l0a72                                                         ; 40fd: ad 72 0a    .r.
    cmp #$2b ; '+'                                                    ; 4100: c9 2b       .+
    beq c412b                                                         ; 4102: f0 27       .'
    ldx #0                                                            ; 4104: a2 00       ..
    sty l40e3                                                         ; 4106: 8c e3 40    ..@
    ldy #2                                                            ; 4109: a0 02       ..
    jsr test_for_collision_between_objects_x_and_y                    ; 410b: 20 e2 28     .(
    ldy l40e3                                                         ; 410e: ac e3 40    ..@
    ora #0                                                            ; 4111: 09 00       ..
    beq c412e                                                         ; 4113: f0 19       ..
    lda #player_collision_flag_baby                                   ; 4115: a9 06       ..
    sta player_collision_flag                                         ; 4117: 8d 33 24    .3$
    lda #0                                                            ; 411a: a9 00       ..
    sta l2eb6                                                         ; 411c: 8d b6 2e    ...
    lda #1                                                            ; 411f: a9 01       ..
    sta l0a04                                                         ; 4121: 8d 04 0a    ...
    ldy #$22 ; '"'                                                    ; 4124: a0 22       ."
    lda #5                                                            ; 4126: a9 05       ..
    sta l0a72                                                         ; 4128: 8d 72 0a    .r.
; $412b referenced 1 time by $4102
c412b
    jmp c41ae                                                         ; 412b: 4c ae 41    L.A

; $412e referenced 2 times by $40fb, $4113
c412e
    cpy #$21 ; '!'                                                    ; 412e: c0 21       .!
    bne c4137                                                         ; 4130: d0 05       ..
    ldy #5                                                            ; 4132: a0 05       ..
    sty l0a72                                                         ; 4134: 8c 72 0a    .r.
; $4137 referenced 1 time by $4130
c4137
    lda desired_room_index                                            ; 4137: a5 30       .0
    cmp #2                                                            ; 4139: c9 02       ..
    bne c415e                                                         ; 413b: d0 21       .!
    lda l2eb6                                                         ; 413d: ad b6 2e    ...
    cmp #$d3                                                          ; 4140: c9 d3       ..
    bne c415e                                                         ; 4142: d0 1a       ..
    ldy #$0e                                                          ; 4144: a0 0e       ..
    lda #$19                                                          ; 4146: a9 19       ..
    sta l0a72                                                         ; 4148: 8d 72 0a    .r.
    lda object_y_low                                                  ; 414b: ad 7c 09    .|.
    cmp #$a0                                                          ; 414e: c9 a0       ..
    bcs c41ae                                                         ; 4150: b0 5c       .\
    cmp #$78 ; 'x'                                                    ; 4152: c9 78       .x
    bcc c41ae                                                         ; 4154: 90 58       .X
    lda #$2b ; '+'                                                    ; 4156: a9 2b       .+
    sta l0a72                                                         ; 4158: 8d 72 0a    .r.
    jmp c41ae                                                         ; 415b: 4c ae 41    L.A

; $415e referenced 2 times by $413b, $4142
c415e
    cpy #$0d                                                          ; 415e: c0 0d       ..
    bne c4167                                                         ; 4160: d0 05       ..
    ldy #0                                                            ; 4162: a0 00       ..
    sty l0a72                                                         ; 4164: 8c 72 0a    .r.
; $4167 referenced 1 time by $4160
c4167
    lda l0a72                                                         ; 4167: ad 72 0a    .r.
    cmp #0                                                            ; 416a: c9 00       ..
    bne c41ae                                                         ; 416c: d0 40       .@
    lda l0a71                                                         ; 416e: ad 71 0a    .q.
    sta l0a04                                                         ; 4171: 8d 04 0a    ...
    lda l0a70                                                         ; 4174: ad 70 0a    .p.
    ldx l0a71                                                         ; 4177: ae 71 0a    .q.
    bmi c4184                                                         ; 417a: 30 08       0.
    cmp #$d4                                                          ; 417c: c9 d4       ..
    beq c418c                                                         ; 417e: f0 0c       ..
    bcc c419f                                                         ; 4180: 90 1d       ..
    bcs c4194                                                         ; 4182: b0 10       ..
; $4184 referenced 1 time by $417a
c4184
    cmp #$6c ; 'l'                                                    ; 4184: c9 6c       .l
    beq c418c                                                         ; 4186: f0 04       ..
    bcs c419f                                                         ; 4188: b0 15       ..
    bcc c4194                                                         ; 418a: 90 08       ..
; $418c referenced 2 times by $417e, $4186
c418c
    ldy #5                                                            ; 418c: a0 05       ..
    sty l0a72                                                         ; 418e: 8c 72 0a    .r.
    jmp c419f                                                         ; 4191: 4c 9f 41    L.A

; $4194 referenced 2 times by $4182, $418a
c4194
    lda l0a71                                                         ; 4194: ad 71 0a    .q.
    eor #$fe                                                          ; 4197: 49 fe       I.
    sta l0a71                                                         ; 4199: 8d 71 0a    .q.
    sta l0a04                                                         ; 419c: 8d 04 0a    ...
; $419f referenced 3 times by $4180, $4188, $4191
c419f
    lda l0a71                                                         ; 419f: ad 71 0a    .q.
    asl                                                               ; 41a2: 0a          .
    asl                                                               ; 41a3: 0a          .
    clc                                                               ; 41a4: 18          .
    adc l0a70                                                         ; 41a5: 6d 70 0a    mp.
    sta l0a70                                                         ; 41a8: 8d 70 0a    .p.
    jmp c41c9                                                         ; 41ab: 4c c9 41    L.A

; $41ae referenced 5 times by $412b, $4150, $4154, $415b, $416c
c41ae
    lda l0a04                                                         ; 41ae: ad 04 0a    ...
    bmi c41c1                                                         ; 41b1: 30 0e       0.
    lda l0a70                                                         ; 41b3: ad 70 0a    .p.
    clc                                                               ; 41b6: 18          .
    adc #4                                                            ; 41b7: 69 04       i.
    and #$f8                                                          ; 41b9: 29 f8       ).
    sta l0a70                                                         ; 41bb: 8d 70 0a    .p.
    jmp c41c9                                                         ; 41be: 4c c9 41    L.A

; $41c1 referenced 1 time by $41b1
c41c1
    lda l0a70                                                         ; 41c1: ad 70 0a    .p.
    and #$f8                                                          ; 41c4: 29 f8       ).
    sta l0a70                                                         ; 41c6: 8d 70 0a    .p.
; $41c9 referenced 2 times by $41ab, $41be
c41c9
    sty l0a73                                                         ; 41c9: 8c 73 0a    .s.
    lda desired_room_index                                            ; 41cc: a5 30       .0
    cmp #2                                                            ; 41ce: c9 02       ..
    bne c41d9                                                         ; 41d0: d0 07       ..
    cpy #$2b ; '+'                                                    ; 41d2: c0 2b       .+
    bne c41d9                                                         ; 41d4: d0 03       ..
    jsr play_some_sound1_then_some_sound2                             ; 41d6: 20 f1 3e     .>
; $41d9 referenced 4 times by $40e0, $40eb, $41d0, $41d4
c41d9
    lda desired_room_index                                            ; 41d9: a5 30       .0
    cmp #2                                                            ; 41db: c9 02       ..
    bne c424c                                                         ; 41dd: d0 6d       .m
    lda l0a72                                                         ; 41df: ad 72 0a    .r.
    cmp #$2b ; '+'                                                    ; 41e2: c9 2b       .+
    bne c4235                                                         ; 41e4: d0 4f       .O
    lda l0a70                                                         ; 41e6: ad 70 0a    .p.
    sta l0a03                                                         ; 41e9: 8d 03 0a    ...
    lsr                                                               ; 41ec: 4a          J
    lsr                                                               ; 41ed: 4a          J
    lsr                                                               ; 41ee: 4a          J
    tax                                                               ; 41ef: aa          .
    lda l0a73                                                         ; 41f0: ad 73 0a    .s.
    cmp #$2b ; '+'                                                    ; 41f3: c9 2b       .+
    beq c420c                                                         ; 41f5: f0 15       ..
    dex                                                               ; 41f7: ca          .
    ldy #$11                                                          ; 41f8: a0 11       ..
    lda #2                                                            ; 41fa: a9 02       ..
    sta width_in_cells                                                ; 41fc: 85 3c       .<
    lda #3                                                            ; 41fe: a9 03       ..
    sta height_in_cells                                               ; 4200: 85 3d       .=
    lda #3                                                            ; 4202: a9 03       ..
    sta value_to_write_to_collision_map                               ; 4204: 85 3e       .>
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 4206: 20 44 1e     D.
    jmp c4235                                                         ; 4209: 4c 35 42    L5B

; $420c referenced 1 time by $41f5
c420c
    dex                                                               ; 420c: ca          .
    ldy #$11                                                          ; 420d: a0 11       ..
    lda #2                                                            ; 420f: a9 02       ..
    sta width_in_cells                                                ; 4211: 85 3c       .<
    lda #3                                                            ; 4213: a9 03       ..
    sta height_in_cells                                               ; 4215: 85 3d       .=
    lda #0                                                            ; 4217: a9 00       ..
    sta value_to_write_to_collision_map                               ; 4219: 85 3e       .>
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 421b: 20 44 1e     D.
    lda l0a04                                                         ; 421e: ad 04 0a    ...
    bmi c4224                                                         ; 4221: 30 01       0.
    dex                                                               ; 4223: ca          .
; $4224 referenced 1 time by $4221
c4224
    ldy #$13                                                          ; 4224: a0 13       ..
    lda #3                                                            ; 4226: a9 03       ..
    sta width_in_cells                                                ; 4228: 85 3c       .<
    lda #1                                                            ; 422a: a9 01       ..
    sta height_in_cells                                               ; 422c: 85 3d       .=
    lda #3                                                            ; 422e: a9 03       ..
    sta value_to_write_to_collision_map                               ; 4230: 85 3e       .>
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 4232: 20 44 1e     D.
; $4235 referenced 2 times by $41e4, $4209
c4235
    ldx #2                                                            ; 4235: a2 02       ..
    lda l0a70                                                         ; 4237: ad 70 0a    .p.
    sta object_x_low,x                                                ; 423a: 9d 50 09    .P.
    ldy l0a73                                                         ; 423d: ac 73 0a    .s.
    lda baby_spriteid_data,y                                          ; 4240: b9 52 40    .R@
    sta object_spriteid,x                                             ; 4243: 9d a8 09    ...
    lda l0a04                                                         ; 4246: ad 04 0a    ...
    sta object_direction,x                                            ; 4249: 9d be 09    ...
; $424c referenced 1 time by $41dd
c424c
    rts                                                               ; 424c: 60          `

room_4_data_ptr
    !byte 20                                                          ; 424d: 14          .              ; initial player X cell
    !byte 7                                                           ; 424e: 07          .              ; initial player Y cell

room_4_code
    ldx #0                                                            ; 424f: a2 00       ..
    ldy #0                                                            ; 4251: a0 00       ..
    lda #$ff                                                          ; 4253: a9 ff       ..
    sta width_in_cells                                                ; 4255: 85 3c       .<
    lda #2                                                            ; 4257: a9 02       ..
    sta height_in_cells                                               ; 4259: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 425b: 20 bb 1a     ..
    ldx #$24 ; '$'                                                    ; 425e: a2 24       .$
    ldy #2                                                            ; 4260: a0 02       ..
    dec height_in_cells                                               ; 4262: c6 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 4264: 20 bb 1a     ..
    inx                                                               ; 4267: e8          .
    iny                                                               ; 4268: c8          .
    lda #$0f                                                          ; 4269: a9 0f       ..
    sta height_in_cells                                               ; 426b: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 426d: 20 bb 1a     ..
    ldx #0                                                            ; 4270: a2 00       ..
    ldy #$12                                                          ; 4272: a0 12       ..
    lda #5                                                            ; 4274: a9 05       ..
    sta width_in_cells                                                ; 4276: 85 3c       .<
    lda #3                                                            ; 4278: a9 03       ..
    sta height_in_cells                                               ; 427a: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 427c: 20 bb 1a     ..
    ldx #$1e                                                          ; 427f: a2 1e       ..
    lda #$ff                                                          ; 4281: a9 ff       ..
    sta width_in_cells                                                ; 4283: 85 3c       .<
    jsr copy_rectangle_of_memory_to_screen                            ; 4285: 20 bb 1a     ..
    ldx #0                                                            ; 4288: a2 00       ..
    ldy #$15                                                          ; 428a: a0 15       ..
    lda #$0a                                                          ; 428c: a9 0a       ..
    sta width_in_cells                                                ; 428e: 85 3c       .<
    lda #1                                                            ; 4290: a9 01       ..
    sta height_in_cells                                               ; 4292: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 4294: 20 bb 1a     ..
    ldx #$19                                                          ; 4297: a2 19       ..
    lda #$ff                                                          ; 4299: a9 ff       ..
    sta width_in_cells                                                ; 429b: 85 3c       .<
    jsr copy_rectangle_of_memory_to_screen                            ; 429d: 20 bb 1a     ..
    ldx #0                                                            ; 42a0: a2 00       ..
    iny                                                               ; 42a2: c8          .
    inc height_in_cells                                               ; 42a3: e6 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 42a5: 20 bb 1a     ..
    ldx #$0a                                                          ; 42a8: a2 0a       ..
    ldy #7                                                            ; 42aa: a0 07       ..
    lda #$14                                                          ; 42ac: a9 14       ..
    sta width_in_cells                                                ; 42ae: 85 3c       .<
    lda #2                                                            ; 42b0: a9 02       ..
    sta height_in_cells                                               ; 42b2: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 42b4: 20 bb 1a     ..
    ldx #0                                                            ; 42b7: a2 00       ..
    lda #5                                                            ; 42b9: a9 05       ..
    sta width_in_cells                                                ; 42bb: 85 3c       .<
    jsr copy_rectangle_of_memory_to_screen                            ; 42bd: 20 bb 1a     ..
    ldy #9                                                            ; 42c0: a0 09       ..
    lda #3                                                            ; 42c2: a9 03       ..
    sta width_in_cells                                                ; 42c4: 85 3c       .<
    lda #4                                                            ; 42c6: a9 04       ..
    sta height_in_cells                                               ; 42c8: 85 3d       .=
    jsr copy_rectangle_of_memory_to_screen                            ; 42ca: 20 bb 1a     ..
    jsr draw_floor_walls_and_ceiling_around_solid_rock                ; 42cd: 20 90 1b     ..
    ldx #$14                                                          ; 42d0: a2 14       ..
    ldy #$0c                                                          ; 42d2: a0 0c       ..
    lda #spriteid_ball                                                ; 42d4: a9 3b       .;
    jsr draw_sprite_a_at_cell_xy                                      ; 42d6: 20 4c 1f     L.
    lda #3                                                            ; 42d9: a9 03       ..
    jsr write_a_single_value_to_cell_in_collision_map                 ; 42db: 20 bb 1e     ..
    ldx #$21 ; '!'                                                    ; 42de: a2 21       .!
    ldy #2                                                            ; 42e0: a0 02       ..
    lda #$0e                                                          ; 42e2: a9 0e       ..
    jsr draw_rope                                                     ; 42e4: 20 b9 1d     ..
    jsr start_room                                                    ; 42e7: 20 bb 12     ..
; $42ea referenced 1 time by $42ef
loop_c42ea
    jsr game_update                                                   ; 42ea: 20 da 12     ..
    and #1                                                            ; 42ed: 29 01       ).
    beq loop_c42ea                                                    ; 42ef: f0 f9       ..
    ldx #1                                                            ; 42f1: a2 01       ..
    ldy desired_level                                                 ; 42f3: a4 31       .1
    jmp initialise_level                                              ; 42f5: 4c 40 11    L@.

; $42f8 referenced 1 time by $3b23
sub_c42f8
    lda #3                                                            ; 42f8: a9 03       ..
    sta current_room_index                                            ; 42fa: 8d ba 1a    ...
    lda #3                                                            ; 42fd: a9 03       ..
    ldx #$14                                                          ; 42ff: a2 14       ..
    ldy #$0c                                                          ; 4301: a0 0c       ..
    jsr initialise_brazier_and_fire                                   ; 4303: 20 88 19     ..
    lda #4                                                            ; 4306: a9 04       ..
    inx                                                               ; 4308: e8          .
    jsr initialise_brazier_and_fire                                   ; 4309: 20 88 19     ..
    lda update_room_first_update_flag                                 ; 430c: ad 2b 13    .+.
    beq c4358                                                         ; 430f: f0 47       .G
    lda previous_level                                                ; 4311: a5 51       .Q
    cmp desired_level                                                 ; 4313: c5 31       .1
    beq c4339                                                         ; 4315: f0 22       ."
    lda l0a01                                                         ; 4317: ad 01 0a    ...
    beq c432f                                                         ; 431a: f0 13       ..
    lda l0a02                                                         ; 431c: ad 02 0a    ...
    beq c4339                                                         ; 431f: f0 18       ..
    bpl c432f                                                         ; 4321: 10 0c       ..
    lda #$0a                                                          ; 4323: a9 0a       ..
    sta l0a01                                                         ; 4325: 8d 01 0a    ...
    lda #0                                                            ; 4328: a9 00       ..
    sta l0a02                                                         ; 432a: 8d 02 0a    ...
    beq c4339                                                         ; 432d: f0 0a       ..
; $432f referenced 2 times by $431a, $4321
c432f
    lda #$16                                                          ; 432f: a9 16       ..
    sta l0a01                                                         ; 4331: 8d 01 0a    ...
    lda #0                                                            ; 4334: a9 00       ..
    sta l0a02                                                         ; 4336: 8d 02 0a    ...
; $4339 referenced 3 times by $4315, $431f, $432d
c4339
    lda desired_room_index                                            ; 4339: a5 30       .0
    cmp #3                                                            ; 433b: c9 03       ..
    bne c4352                                                         ; 433d: d0 13       ..
    ldx #<envelope4                                                   ; 433f: a2 4a       .J
    ldy #>envelope4                                                   ; 4341: a0 44       .D
    jsr define_envelope                                               ; 4343: 20 5e 39     ^9
    ldx #2                                                            ; 4346: a2 02       ..
    lda #$de                                                          ; 4348: a9 de       ..
    sta object_spriteid,x                                             ; 434a: 9d a8 09    ...
    lda #$cc                                                          ; 434d: a9 cc       ..
    sta object_sprite_mask_type,x                                     ; 434f: 9d ac 38    ..8
; $4352 referenced 1 time by $433d
c4352
    jmp c43f6                                                         ; 4352: 4c f6 43    L.C

; $4355 referenced 5 times by $4361, $436f, $437d, $438b, $4399
c4355
    jmp c4415                                                         ; 4355: 4c 15 44    L.D

; $4358 referenced 1 time by $430f
c4358
    lda l0a02                                                         ; 4358: ad 02 0a    ...
    bne c43a0                                                         ; 435b: d0 43       .C
    lda desired_room_index                                            ; 435d: a5 30       .0
    cmp #3                                                            ; 435f: c9 03       ..
    bne c4355                                                         ; 4361: d0 f2       ..
    lda l0a01                                                         ; 4363: ad 01 0a    ...
    cmp #$16                                                          ; 4366: c9 16       ..
    beq c4386                                                         ; 4368: f0 1c       ..
    lda object_collision_flags                                        ; 436a: ad d8 38    ..8
    and #4                                                            ; 436d: 29 04       ).
    beq c4355                                                         ; 436f: f0 e4       ..
    lda #1                                                            ; 4371: a9 01       ..
    sta temp_right_offset                                             ; 4373: 8d d1 24    ..$
    ldx #0                                                            ; 4376: a2 00       ..
    ldy #2                                                            ; 4378: a0 02       ..
    jsr test_for_collision_between_objects_x_and_y                    ; 437a: 20 e2 28     .(
    beq c4355                                                         ; 437d: f0 d6       ..
    lda #1                                                            ; 437f: a9 01       ..
    sta l0a02                                                         ; 4381: 8d 02 0a    ...
    bne c43a0                                                         ; 4384: d0 1a       ..
; $4386 referenced 1 time by $4368
c4386
    lda object_collision_flags                                        ; 4386: ad d8 38    ..8
    and #1                                                            ; 4389: 29 01       ).
    beq c4355                                                         ; 438b: f0 c8       ..
    lda #$ff                                                          ; 438d: a9 ff       ..
    sta temp_left_offset                                              ; 438f: 8d d0 24    ..$
    ldx #0                                                            ; 4392: a2 00       ..
    ldy #2                                                            ; 4394: a0 02       ..
    jsr test_for_collision_between_objects_x_and_y                    ; 4396: 20 e2 28     .(
    beq c4355                                                         ; 4399: f0 ba       ..
    lda #$ff                                                          ; 439b: a9 ff       ..
    sta l0a02                                                         ; 439d: 8d 02 0a    ...
; $43a0 referenced 2 times by $435b, $4384
c43a0
    lda l0a01                                                         ; 43a0: ad 01 0a    ...
    sta l0070                                                         ; 43a3: 85 70       .p
    clc                                                               ; 43a5: 18          .
    adc l0a02                                                         ; 43a6: 6d 02 0a    m..
    sta l0a01                                                         ; 43a9: 8d 01 0a    ...
    cmp #$0a                                                          ; 43ac: c9 0a       ..
    beq c43b4                                                         ; 43ae: f0 04       ..
    cmp #$16                                                          ; 43b0: c9 16       ..
    bne c43d4                                                         ; 43b2: d0 20       .
; $43b4 referenced 1 time by $43ae
c43b4
    lda #0                                                            ; 43b4: a9 00       ..
    sta l0a02                                                         ; 43b6: 8d 02 0a    ...
    lda desired_room_index                                            ; 43b9: a5 30       .0
    cmp #3                                                            ; 43bb: c9 03       ..
    bne c4415                                                         ; 43bd: d0 56       .V
    lda sound_priority_per_channel_table                              ; 43bf: ad 6f 39    .o9
    cmp #$81                                                          ; 43c2: c9 81       ..
    bcs c43ce                                                         ; 43c4: b0 08       ..
    lda #0                                                            ; 43c6: a9 00       ..
    sta sound_priority_per_channel_table                              ; 43c8: 8d 6f 39    .o9
    sta sound_priority_per_channel_table + 1                          ; 43cb: 8d 70 39    .p9
; $43ce referenced 1 time by $43c4
c43ce
    jsr play_landing_sound                                            ; 43ce: 20 a9 23     .#
    jmp c43e3                                                         ; 43d1: 4c e3 43    L.C

; $43d4 referenced 1 time by $43b2
c43d4
    lda desired_room_index                                            ; 43d4: a5 30       .0
    cmp #3                                                            ; 43d6: c9 03       ..
    bne c4415                                                         ; 43d8: d0 3b       .;
    lda #$80                                                          ; 43da: a9 80       ..
    ldx #<some_sound4                                                 ; 43dc: a2 58       .X
    ldy #>some_sound4                                                 ; 43de: a0 44       .D
    jsr play_sound_yx                                                 ; 43e0: 20 f6 38     .8
; $43e3 referenced 1 time by $43d1
c43e3
    ldx l0070                                                         ; 43e3: a6 70       .p
    ldy #$14                                                          ; 43e5: a0 14       ..
    lda #3                                                            ; 43e7: a9 03       ..
    sta width_in_cells                                                ; 43e9: 85 3c       .<
    lda #2                                                            ; 43eb: a9 02       ..
    sta height_in_cells                                               ; 43ed: 85 3d       .=
    lda #0                                                            ; 43ef: a9 00       ..
    sta value_to_write_to_collision_map                               ; 43f1: 85 3e       .>
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 43f3: 20 44 1e     D.
; $43f6 referenced 1 time by $4352
c43f6
    lda desired_room_index                                            ; 43f6: a5 30       .0
    cmp #3                                                            ; 43f8: c9 03       ..
    bne c4415                                                         ; 43fa: d0 19       ..
    ldx l0a01                                                         ; 43fc: ae 01 0a    ...
    ldy #$14                                                          ; 43ff: a0 14       ..
    lda #3                                                            ; 4401: a9 03       ..
    sta width_in_cells                                                ; 4403: 85 3c       .<
    lda #2                                                            ; 4405: a9 02       ..
    sta height_in_cells                                               ; 4407: 85 3d       .=
    lda #3                                                            ; 4409: a9 03       ..
    sta value_to_write_to_collision_map                               ; 440b: 85 3e       .>
    jsr write_value_to_a_rectangle_of_cells_in_collision_map          ; 440d: 20 44 1e     D.
    lda #2                                                            ; 4410: a9 02       ..
    jsr set_object_position_from_cell_xy                              ; 4412: 20 5d 1f     ].
; $4415 referenced 4 times by $4355, $43bd, $43d8, $43fa
c4415
    rts                                                               ; 4415: 60          `

envelope3
    !byte 5                                                           ; 4416: 05          .              ; envelope number
    !byte 1                                                           ; 4417: 01          .              ; step length (100ths of a second)
    !byte 0                                                           ; 4418: 00          .              ; pitch change per step in section 1
    !byte 0                                                           ; 4419: 00          .              ; pitch change per step in section 2
    !byte 0                                                           ; 441a: 00          .              ; pitch change per step in section 3
    !byte 0                                                           ; 441b: 00          .              ; number of steps in section 1
    !byte 0                                                           ; 441c: 00          .              ; number of steps in section 2
    !byte 0                                                           ; 441d: 00          .              ; number of steps in section 3
    !byte 20                                                          ; 441e: 14          .              ; change of amplitude per step during attack phase
    !byte 0                                                           ; 441f: 00          .              ; change of amplitude per step during decay phase
    !byte 255                                                         ; 4420: ff          .              ; change of amplitude per step during sustain phase
    !byte 246                                                         ; 4421: f6          .              ; change of amplitude per step during release phase
    !byte 100                                                         ; 4422: 64          d              ; target of level at end of attack phase
    !byte 0                                                           ; 4423: 00          .              ; target of level at end of decay phase
some_sound3
    !word $13                                                         ; 4424: 13 00       ..             ; channel
    !word 5                                                           ; 4426: 05 00       ..             ; amplitude
    !word 0                                                           ; 4428: 00 00       ..             ; pitch
    !word 4                                                           ; 442a: 04 00       ..             ; duration
envelope2
    !byte 6                                                           ; 442c: 06          .              ; envelope number
    !byte 1                                                           ; 442d: 01          .              ; step length (100ths of a second)
    !byte 0                                                           ; 442e: 00          .              ; pitch change per step in section 1
    !byte 0                                                           ; 442f: 00          .              ; pitch change per step in section 2
    !byte 0                                                           ; 4430: 00          .              ; pitch change per step in section 3
    !byte 0                                                           ; 4431: 00          .              ; number of steps in section 1
    !byte 0                                                           ; 4432: 00          .              ; number of steps in section 2
    !byte 0                                                           ; 4433: 00          .              ; number of steps in section 3
    !byte 80                                                          ; 4434: 50          P              ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4435: 00          .              ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4436: 00          .              ; change of amplitude per step during sustain phase
    !byte 250                                                         ; 4437: fa          .              ; change of amplitude per step during release phase
    !byte 115                                                         ; 4438: 73          s              ; target of level at end of attack phase
    !byte 0                                                           ; 4439: 00          .              ; target of level at end of decay phase
some_sound2
    !word $10                                                         ; 443a: 10 00       ..             ; channel
    !word 6                                                           ; 443c: 06 00       ..             ; amplitude
    !word 7                                                           ; 443e: 07 00       ..             ; pitch
    !word 1                                                           ; 4440: 01 00       ..             ; duration
some_sound1
    !word $11                                                         ; 4442: 11 00       ..             ; channel
    !word 0                                                           ; 4444: 00 00       ..             ; amplitude
    !word 210                                                         ; 4446: d2 00       ..             ; pitch
    !word 1                                                           ; 4448: 01 00       ..             ; duration
envelope4
    !byte 6                                                           ; 444a: 06          .              ; envelope number
    !byte 1                                                           ; 444b: 01          .              ; step length (100ths of a second)
    !byte 0                                                           ; 444c: 00          .              ; pitch change per step in section 1
    !byte 0                                                           ; 444d: 00          .              ; pitch change per step in section 2
    !byte 0                                                           ; 444e: 00          .              ; pitch change per step in section 3
    !byte 0                                                           ; 444f: 00          .              ; number of steps in section 1
    !byte 0                                                           ; 4450: 00          .              ; number of steps in section 2
    !byte 0                                                           ; 4451: 00          .              ; number of steps in section 3
    !byte 10                                                          ; 4452: 0a          .              ; change of amplitude per step during attack phase
    !byte 0                                                           ; 4453: 00          .              ; change of amplitude per step during decay phase
    !byte 0                                                           ; 4454: 00          .              ; change of amplitude per step during sustain phase
    !byte 216                                                         ; 4455: d8          .              ; change of amplitude per step during release phase
    !byte 40                                                          ; 4456: 28          (              ; target of level at end of attack phase
    !byte 0                                                           ; 4457: 00          .              ; target of level at end of decay phase
some_sound4
    !word $10                                                         ; 4458: 10 00       ..             ; channel
    !word 6                                                           ; 445a: 06 00       ..             ; amplitude
    !word 4                                                           ; 445c: 04 00       ..             ; pitch
    !word 4                                                           ; 445e: 04 00       ..             ; duration
envelope1
    !byte 6                                                           ; 4460: 06          .              ; envelope number
    !byte 1                                                           ; 4461: 01          .              ; step length (100ths of a second)
    !byte 0                                                           ; 4462: 00          .              ; pitch change per step in section 1
    !byte 0                                                           ; 4463: 00          .              ; pitch change per step in section 2
    !byte 0                                                           ; 4464: 00          .              ; pitch change per step in section 3
    !byte 0                                                           ; 4465: 00          .              ; number of steps in section 1
    !byte 0                                                           ; 4466: 00          .              ; number of steps in section 2
    !byte 0                                                           ; 4467: 00          .              ; number of steps in section 3
    !byte 30                                                          ; 4468: 1e          .              ; change of amplitude per step during attack phase
    !byte 206                                                         ; 4469: ce          .              ; change of amplitude per step during decay phase
    !byte 206                                                         ; 446a: ce          .              ; change of amplitude per step during sustain phase
    !byte 156                                                         ; 446b: 9c          .              ; change of amplitude per step during release phase
    !byte 100                                                         ; 446c: 64          d              ; target of level at end of attack phase
    !byte 0                                                           ; 446d: 00          .              ; target of level at end of decay phase
mouse_ball_sound3
    !word $10                                                         ; 446e: 10 00       ..             ; channel
    !word 6                                                           ; 4470: 06 00       ..             ; amplitude
    !word 7                                                           ; 4472: 07 00       ..             ; pitch
    !word 1                                                           ; 4474: 01 00       ..             ; duration
mouse_ball_sound2
    !word $11                                                         ; 4476: 11 00       ..             ; channel
    !word 0                                                           ; 4478: 00 00       ..             ; amplitude
    !word 190                                                         ; 447a: be 00       ..             ; pitch
    !word 1                                                           ; 447c: 01 00       ..             ; duration
mouse_ball_sound1
    !word $10                                                         ; 447e: 10 00       ..             ; channel
    !word 0                                                           ; 4480: 00 00       ..             ; amplitude
    !word 0                                                           ; 4482: 00 00       ..             ; pitch
    !word 0                                                           ; 4484: 00 00       ..             ; duration
ground_fill_2x2_top_left
    !byte %...#....                                                   ; 4486: 10          .
    !byte %..#.....                                                   ; 4487: 20
    !byte %.#......                                                   ; 4488: 40          @
    !byte %#.....##                                                   ; 4489: 83          .
    !byte %.....#..                                                   ; 448a: 04          .
    !byte %....#...                                                   ; 448b: 08          .
    !byte %...#....                                                   ; 448c: 10          .
    !byte %...#....                                                   ; 448d: 10          .
; Note that the next three characters are all identical. I think this is done because
; the 'tiling' code in restore_rectangle_of_screen_memory for l0042=1 uses a 2x2 tiling
; arrangement.
ground_fill_2x2_top_right
    !byte %....#...                                                   ; 448e: 08          .
    !byte %.....#..                                                   ; 448f: 04          .
    !byte %......#.                                                   ; 4490: 02          .
    !byte %.......#                                                   ; 4491: 01          .
    !byte %#.......                                                   ; 4492: 80          .
    !byte %.#......                                                   ; 4493: 40          @
    !byte %..#.....                                                   ; 4494: 20
    !byte %...#....                                                   ; 4495: 10          .
ground_fill_2x2_bottom_left
    !byte %....#...                                                   ; 4496: 08          .
    !byte %.....#..                                                   ; 4497: 04          .
    !byte %......#.                                                   ; 4498: 02          .
    !byte %.......#                                                   ; 4499: 01          .
    !byte %#.......                                                   ; 449a: 80          .
    !byte %.#......                                                   ; 449b: 40          @
    !byte %..#.....                                                   ; 449c: 20
    !byte %...#....                                                   ; 449d: 10          .
ground_fill_2x2_bottom_right
    !byte %....#...                                                   ; 449e: 08          .
    !byte %.....#..                                                   ; 449f: 04          .
    !byte %......#.                                                   ; 44a0: 02          .
    !byte %.......#                                                   ; 44a1: 01          .
    !byte %#.......                                                   ; 44a2: 80          .
    !byte %.#......                                                   ; 44a3: 40          @
    !byte %..#.....                                                   ; 44a4: 20
    !byte %...#....                                                   ; 44a5: 10          .
sprite_data
    !byte $2e,   0, $79,   0, $86,   0, $98,   0, $c7,   0, $53,   1  ; 44a6: 2e 00 79... ..y
    !byte $67,   1, $7b,   1, $c1,   1, $1e,   2, $4d,   2, $71,   2  ; 44b2: 67 01 7b... g.{
    !byte $9d,   2, $aa,   2, $b9,   2, $0f,   3, $68,   3, $be,   3  ; 44be: 9d 02 aa... ...
    !byte $1d,   4, $72,   4, $e0,   4, $32,   5, $86,   5, $f0,   0  ; 44ca: 1d 04 72... ..r
    !byte $18, $14, $a3, $84, $c5                                     ; 44d6: 18 14 a3... ...
    !text "1111N"                                                     ; 44db: 31 31 31... 111
    !byte $13, $85, $3a, $13, $a1,   0,   3, $a1                      ; 44e0: 13 85 3a... ..:
    !text "UT8UUT "                                                   ; 44e8: 55 54 38... UT8
    !byte $e1                                                         ; 44ef: e1          .
    !text "UUU"                                                       ; 44f0: 55 55 55    UUU
    !byte $14, $c5                                                    ; 44f3: 14 c5       ..
    !text "UUUT"                                                      ; 44f5: 55 55 55... UUU
    !byte $c5, $55, $55, $15, $50, $c5, $55, $55, $14, $55, $31,   5  ; 44f9: c5 55 55... .UU
    !byte $55, $15                                                    ; 4505: 55 15       U.
    !text "ULEUEQ"                                                    ; 4507: 55 4c 45... ULE
    !byte $0c, $45, $55,   5, $54, $e0, $15                           ; 450d: 0c 45 55... .EU
    !text "AT8@"                                                      ; 4514: 41 54 38... AT8
    !byte   8, $50, $e1, $2a, $a8, $3a, $30,   0, $fb,   8,   5, $87  ; 4518: 08 50 e1... .P.
    !byte $84, $c5, $38, $3e, $84, $e1, $4e, $83,   0, $fa,   9,   6  ; 4524: 84 c5 38... ..8
    !byte $94, $c5, $38, $53, $a1, $4e, $80, $e1, $38, $53, $a1, $4e  ; 4530: 94 c5 38... ..8
    !byte $a0, $c0, $f9,   0, $0e, $0d, $aa, $80, $ea,   5, $43, $a1  ; 453c: a0 c0 f9... ...
    !byte $55, $53, $85, $55, $54, $e1                                ; 4548: 55 53 85... US.
    !text "UU1UUS"                                                    ; 454e: 55 55 31... UU1
    !byte $15                                                         ; 4554: 15          .
    !text "UU1UUS"                                                    ; 4555: 55 55 31... UU1
    !byte $15                                                         ; 455b: 15          .
    !text "UU8UUN"                                                    ; 455c: 55 55 38... UU8
    !byte   5, $55, $43, $a0, $15,   3, $a8,   0, $0e, $aa,   3,   0  ; 4562: 05 55 43... .UC
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 456e: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 457a: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4586: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 4592: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 459e: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45aa: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45b6: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45c2: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45ce: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45da: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45e6: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45f2: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 45fe: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0  ; 460a: 00 00 00... ...
    !byte   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, $ff  ; 4616: 00 00 00... ...
    !byte   3, $18, $0a, $aa, $a0                                     ; 4622: 03 18 0a... ...
    !text "1ET"                                                       ; 4627: 31 45 54    1ET
    !byte $c5, $15, $53, $14                                          ; 462a: c5 15 53... ..S
    !text "ELQ"                                                       ; 462e: 45 4c 51    ELQ
    !byte $15, $31, $45, $14, $c4, $54, $53, $14                      ; 4631: 15 31 45... .1E
    !text "QLQ"                                                       ; 4639: 51 4c 51    QLQ
    !byte $15                                                         ; 463c: 15          .
    !text "0DT"                                                       ; 463d: 30 44 54    0DT
    !byte $c5, $11, $13, $14                                          ; 4640: c5 11 13... ...
    !text "TLQQ1ED"                                                   ; 4644: 54 4c 51... TLQ
    !byte $c5, $44, $53, $14                                          ; 464b: c5 44 53... .DS
    !text "QLQE1ET"                                                   ; 464f: 51 4c 51... QLQ
    !byte $c4, $15, $13, $14                                          ; 4656: c4 15 13... ...
    !text "DLQ"                                                       ; 465a: 44 4c 51    DLQ
    !byte $11                                                         ; 465d: 11          .
    !text "1ET"                                                       ; 465e: 31 45 54    1ET
    !byte $c5, $15, $53, $80,   0, $30,   0, $11, $14, $17, $aa, $aa  ; 4661: c5 15 53... ..S
    !byte $aa, $aa, $11, $3a, $aa, $aa, $aa, $a0,   3, $aa, $aa, $aa  ; 466d: aa aa 11... ...
    !byte $a0, $55, $4e, $aa, $aa, $aa, $14, $45, $4e, $aa, $aa, $a8  ; 4679: a0 55 4e... .UN
    !byte $55,   0, $3a, $aa, $aa, $85, $51, $54, $ea, $aa, $a8, $55  ; 4685: 55 00 3a... U.:
    !byte $11, $4e, $aa, $aa, $15,   4, $53, $aa, $aa,   5, $45, $13  ; 4691: 11 4e aa... .N.
    !byte $aa, $a8, $55, $10, $4e, $aa, $85, $51, $14, $ea, $a1       ; 469d: aa a8 55... ..U
    !text "TT:"                                                       ; 46a8: 54 54 3a    TT:
    !byte $a1, $54, $10, $3a, $85, $51, $44, $e8, $55, $15, $4e, $15  ; 46ab: a1 54 10... .T.
    !byte   5, $43, $15, $44, $43, $15, $11, $4e, $11, $54, $e8,   0  ; 46b7: 05 43 15... .C.
    !byte $30,   0, $17,   6, $1c, $aa, $aa, $aa, $aa, $aa, $a1, $13  ; 46c3: 30 00 17... 0..
    !byte $80,   0,   0,   0,   0,   0,   3, $15                      ; 46cf: 80 00 00... ...
    !text "UUQUET"                                                    ; 46d7: 55 55 51... UUQ
    !byte $c5                                                         ; 46dd: c5          .
    !text "UUUUQU1U"                                                  ; 46de: 55 55 55... UUU
    !byte $15                                                         ; 46e6: 15          .
    !text "UTTEN"                                                     ; 46e7: 55 54 54... UTT
    !byte   0,   0,   0,   0,   0,   0, $0c, $ff,   7, $0a, $0f, $a0  ; 46ec: 00 00 00... ...
    !text "8T1UB"                                                     ; 46f8: 38 54 31... 8T1
    !byte $a8, $c5, $55, $50, $84, $e1, $51, $55,   4, $e8, $54, $15  ; 46fd: a8 c5 55... ..U
    !byte $54, $ea, $15,   1, $53, $a8, $54, $a0, $3a, $15, $53, $a8  ; 4709: 54 ea 15... T..
    !byte   0, $c0,   5, $10, $0a, $0f,   0,   1, $11, $13,   5       ; 4715: 00 c0 05... ...
    !text "@DG"                                                       ; 4720: 40 44 47    @DG
    !byte $15, $54,   1,   3, $15, $55, $40, $13,   5, $45, $54, $13  ; 4723: 15 54 01... .T.
    !text "APUS"                                                      ; 472f: 41 50 55... APU
    !byte $10, $54,   5                                               ; 4733: 10 54 05    .T.
    !text "C@T"                                                       ; 4736: 43 40 54    C@T
    !byte   0,   7, $11, $55, $11, $13, $40,   0,   4, $47, $ff, $fb  ; 4739: 00 07 11... ...
    !byte   9,   5, $8e, $1c, $53, $83, $fa, $13, $85, $3a, $0c,   0  ; 4745: 09 05 8e... ...
    !byte $fa,   9,   5, $93, $13, $14, $e1                           ; 4751: fa 09 05... ...
    !text ":8N"                                                       ; 4758: 3a 38 4e    :8N
    !byte $14, $e8, $4e, $a3, $f7,   0, $12, $15, $aa, $aa, $aa, $a0  ; 475b: 14 e8 4e... ..N
    !byte $0e, $aa, $aa, $aa, $15, $4e, $80, $a0                      ; 4767: 0e aa aa... ...
    !text "(US"                                                       ; 476f: 28 55 53    (US
    !byte $85                                                         ; 4772: 85          .
    !text "APUT"                                                      ; 4773: 41 50 55... APU
    !byte $c5, $51, $55, $14                                          ; 4777: c5 51 55... .QU
    !text "ULD"                                                       ; 477b: 55 4c 44    ULD
    !byte $10, $55, $15, $54, $e0,   5, $15, $45, $15, $4e, $85,   5  ; 477e: 10 55 15... .U.
    !byte $54, $15, $53, $81                                          ; 478a: 54 15 53... T.S
    !text "UUE"                                                       ; 478e: 55 55 45    UUE
    !byte $14, $c5, $55, $55, $14, $54, $c5                           ; 4791: 14 c5 55... ..U
    !text "UUEC"                                                      ; 4798: 55 55 45... UUE
    !byte $11, $51, $54, $80, $c4, $15, $54, $c4, $85, $51, $38, $a8  ; 479c: 11 51 54... .QT
    !byte   1, $53, $aa, $aa, $81, $3a, $aa, $a8, $53, $aa, $aa, $a0  ; 47a8: 01 53 aa... .S.
    !byte $c0, $f7,   0, $13, $16, $aa, $aa, $aa, $a8,   3, $aa, $aa  ; 47b4: c0 f7 00... ...
    !byte $aa, $a1, $54, $ea, $aa, $80, $a1, $55, $4e, $8a, $a1       ; 47c0: aa a1 54... ..T
    !text "PUT"                                                       ; 47cb: 50 55 54    PUT
    !byte $e1                                                         ; 47ce: e1          .
    !text " UE"                                                       ; 47cf: 20 55 45     UE
    !byte $15, $53, $15, $11                                          ; 47d2: 15 53 15... .S.
    !text "UQULUQ"                                                    ; 47d6: 55 51 55... UQU
    !byte $15, $14, $55, $31, $15, $44, $54, $15, $53, $10            ; 47dc: 15 14 55... ..U
    !text "QEQE1"                                                     ; 47e6: 51 45 51... QEQ
    !byte 5                                                           ; 47eb: 05          .
    !text "AQEN!UU"                                                   ; 47ec: 41 51 45... AQE
    !byte $15, $0e, $a1, $51, $54, $80, $ea, $85, $55, $3a, $84, $55  ; 47f3: 15 0e a1... ...
    !byte $3a, $15,   0, $4e, $85, $28, $53, $a8, $52, $83, $aa, $14  ; 47ff: 3a 15 00... :..
    !byte $ea, $a0, $c0, $f7,   0, $12, $15, $aa, $aa, $aa, $a0, $0e  ; 480b: ea a0 c0... ...
    !byte $aa, $aa, $aa, $15, $4e, $80, $a0                           ; 4817: aa aa aa... ...
    !text "(US"                                                       ; 481e: 28 55 53    (US
    !byte $85                                                         ; 4821: 85          .
    !text "APUT"                                                      ; 4822: 41 50 55... APU
    !byte $c5, $51, $55, $14                                          ; 4826: c5 51 55... .QU
    !text "ULD"                                                       ; 482a: 55 4c 44    ULD
    !byte $10, $55, $15, $54, $e0, $45, $15, $45, $15, $4e, $85,   5  ; 482d: 10 55 15... .U.
    !byte $54, $15, $53, $80                                          ; 4839: 54 15 53... T.S
    !text "UUE"                                                       ; 483d: 55 55 45    UUE
    !byte $14, $c4, $55, $55, $14, $54, $c4                           ; 4840: 14 c4 55... ..U
    !text "UUEC"                                                      ; 4847: 55 55 45... UUE
    !byte $11, $51, $54, $80, $c4, $15, $54, $c4, $85, $51, $38, $a8  ; 484b: 11 51 54... .QT
    !byte   1, $53, $aa, $aa, $81, $3a, $aa, $a8, $53, $aa, $aa, $a0  ; 4857: 01 53 aa... .S.
    !byte $c0, $f7,   0, $13, $16, $aa, $a0, $aa, $a8,   3, $aa, $85  ; 4863: c0 f7 00... ...
    !byte $2a, $a1, $54, $ea, $85,   0, $a1, $55, $4e, $8a, $15       ; 486f: 2a a1 54... *.T
    !text "PUT"                                                       ; 487a: 50 55 54    PUT
    !byte $e1,   0,   5, $45, $15, $53, $15                           ; 487d: e1 00 05... ...
    !text "EEQULTUU"                                                  ; 4884: 45 45 51... EEQ
    !byte $14, $55, $31, $11, $55, $54, $15, $53, $10                 ; 488c: 14 55 31... .U1
    !text "UUQE1"                                                     ; 4895: 55 55 51... UUQ
    !byte 5                                                           ; 489a: 05          .
    !text "UQEN!UU"                                                   ; 489b: 55 51 45... UQE
    !byte $15, $0e, $a1, $51, $54, $80, $ea, $85, $55, $13, $a8       ; 48a2: 15 0e a1... ...
    !text "UQS"                                                       ; 48ad: 55 51 53    UQS
    !byte $a1, $50,   8, $14, $e8, $52, $aa, $a1, $3a, $85, $2a, $a1  ; 48b0: a1 50 08... .P.
    !byte $4e, $a8, $52, $aa, $0e, $aa, $0c, $f7,   0, $11, $16, $aa  ; 48bc: 4e a8 52... N.R
    !byte $aa, $aa, $a8,   3, $aa, $aa, $aa, $a1, $54, $ea, $aa, $80  ; 48c8: aa aa a8... ...
    !byte $a1, $55, $4e, $0a,   1                                     ; 48d4: a1 55 4e... .UN
    !text "PUT"                                                       ; 48d9: 50 55 54    PUT
    !byte $c5,   4                                                    ; 48dc: c5 04       ..
    !text "UEUS"                                                      ; 48de: 55 45 55... UEU
    !byte $15                                                         ; 48e2: 15          .
    !text "QUUALUQ"                                                   ; 48e3: 51 55 55... QUU
    !byte $15                                                         ; 48ea: 15          .
    !text "EU1"                                                       ; 48eb: 45 55 31    EU1
    !byte $15                                                         ; 48ee: 15          .
    !text "DUT"                                                       ; 48ef: 44 55 54    DUT
    !byte $13, $10                                                    ; 48f2: 13 10       ..
    !text "QEUU8EAQUN"                                                ; 48f4: 51 45 55... QEU
    !byte $11, $55, $55, $15, $0e, $11, $51, $54, $80, $e8, $85, $55  ; 48fe: 11 55 55... .UU
    !byte $3a, $a8, $55, $13, $aa, $a0,   5, $3a, $aa, $a1, $4e, $aa  ; 490a: 3a a8 55... :.U
    !byte $aa, $0c, $f3,   0, $17, $16, $aa, $aa, $a3, $aa, $aa, $84  ; 4916: aa 0c f3... ...
    !byte $ea, $aa, $a1, $4e, $aa, $aa, $14, $ea, $aa,   5, $2a,   0  ; 4922: ea aa a1... ...
    !byte $ea, $a8, $54, $a8, $55, $3a, $aa, $15                      ; 492e: ea a8 54... ..T
    !text "HUS"                                                       ; 4936: 48 55 53    HUS
    !byte $82, $80, $54, $14                                          ; 4939: 82 80 54... ..T
    !text "U1AQQ"                                                     ; 493d: 55 31 41... U1A
    !byte $15, $54, $c5                                               ; 4942: 15 54 c5    .T.
    !text "UUTQS"                                                     ; 4945: 55 55 54... UUT
    !byte $15                                                         ; 494a: 15          .
    !text "UUQULEUUE"                                                 ; 494b: 55 55 51... UUQ
    !byte $14, $c4, $15                                               ; 4954: 14 c4 15    ...
    !text "UTUN"                                                      ; 4957: 55 54 55... UTU
    !byte $11                                                         ; 495b: 11          .
    !text "UTQS"                                                      ; 495c: 55 54 51... UTQ
    !byte $84                                                         ; 4960: 84          .
    !text "UUEC"                                                      ; 4961: 55 55 45... UUE
    !byte $84                                                         ; 4965: 84          .
    !text "TU :!UC"                                                   ; 4966: 54 55 20... TU
    !byte $aa, $85, $51, $4e, $aa, $80, $15, $4e, $aa, $aa, $80, $53  ; 496d: aa 85 51... ..Q
    !byte $aa, $aa, $aa, $84, $ea, $aa, $aa, $a1, $3a, $aa, $aa, $aa  ; 4979: aa aa aa... ...
    !byte $30, $ef,   1, $1a, $0e, $aa, $83, $a8, $14, $3a, $15, $54  ; 4985: 30 ef 01... 0..
    !byte $e1, $55, $54, $e1, $54, $44, $e1                           ; 4991: e1 55 54... .UT
    !text "TE8UUN"                                                    ; 4998: 54 45 38... TE8
    !byte $15, $55, $53, $a1, $40, $14, $ea, $11, $14, $e8, $54, $53  ; 499e: 15 55 53... .US
    !byte $85, $55,   0, $c5                                          ; 49aa: 85 55 00... .U.
    !text "UQLUUE1P"                                                  ; 49ae: 55 51 4c... UQL
    !byte $15, $44, $c5, $55, $15, $0e, $14, $11, $13, $80, $51, $54  ; 49b6: 15 44 c5... .D.
    !byte $e1                                                         ; 49c2: e1          .
    !text "UU:"                                                       ; 49c3: 55 55 3a    UU:
    !byte $15, $55, $3a, $15, $54, $e1, $54, $0e, $15, $14, $e8, $54  ; 49c6: 15 55 3a... .U:
    !byte $53, $a8, $14, $3a, $a8, $30, $f7,   0, $11, $16, $aa, $a0  ; 49d2: 53 a8 14... S..
    !byte $aa, $a8,   3, $aa, $85, $2a, $a1, $54, $ea, $85,   0, $a1  ; 49de: aa a8 03... ...
    !byte $55, $4e, $0a, $15                                          ; 49ea: 55 4e 0a... UN.
    !text "PUT"                                                       ; 49ee: 50 55 54    PUT
    !byte $c5,   4,   5                                               ; 49f1: c5 04 05    ...
    !text "EUS"                                                       ; 49f4: 45 55 53    EUS
    !byte $15                                                         ; 49f7: 15          .
    !text "UEQELUUU"                                                  ; 49f8: 55 45 51... UEQ
    !byte $15, $55, $31, $15, $55, $54, $14, $53, $10                 ; 4a00: 15 55 31... .U1
    !text "UUQU8EUQUN"                                                ; 4a09: 55 55 51... UUQ
    !byte $11, $55, $55, $15, $0e, $11, $51, $54, $80, $e8, $85, $55  ; 4a13: 11 55 55... .UU
    !byte $3a, $a8, $55, $3a, $aa,   0, $3a, $aa, $85, $3a, $aa, $a0  ; 4a1f: 3a a8 55... :.U
    !byte $c0,   0, $0e, $18, $15, $aa, $aa, $aa,   0,   0, $ea, $aa  ; 4a2b: c0 00 0e... ...
    !byte $aa, $14, $55, $4e,   0,   0,   1, $45, $54, $c5, $55, $55  ; 4a37: aa 14 55... ..U
    !byte $14                                                         ; 4a43: 14          .
    !text "ELDDA"                                                     ; 4a44: 45 4c 44... ELD
    !byte $14, $44, $e0,   0,   0, $14, $44, $4e, $a1, $55,   0, $45  ; 4a49: 14 44 e0... .D.
    !byte $44, $ea, $80,   0, $14, $55, $4e, $aa, $aa, $a1, $45, $14  ; 4a55: 44 ea 80... D..
    !byte $ea, $aa, $aa, $14, $51, $4e, $aa, $aa, $a0, $44, $54, $ea  ; 4a61: ea aa aa... ...
    !byte $aa, $aa, $14, $45, $4e, $aa, $aa, $a1, $44, $44, $ea, $aa  ; 4a6d: aa aa 14... ...
    !byte $aa, $14, $54, $4e, $aa, $aa, $a1, $45, $44, $ea, $aa, $aa  ; 4a79: aa 14 54... ..T
    !byte $10, $44, $4e, $a8,   0,   1, $44, $54, $ea, $15, $50, $14  ; 4a85: 10 44 4e... .DN
    !byte $45, $4e,   0,   0,   1, $15, $14, $c5, $55, $55, $14       ; 4a91: 45 4e 00... EN.
    !text "QLDDAET"                                                   ; 4a9c: 51 4c 44... QLD
    !byte $e0,   0,   0, $14, $45, $4e, $aa, $aa, $a1, $45, $54, $ea  ; 4aa3: e0 00 00... ...
    !byte $aa, $aa, $80,   0, $30                                     ; 4aaf: aa aa 80... ...
pydis_end

; Label references by decreasing frequency:
;     copy_rectangle_of_memory_to_screen:                    43
;     width_in_cells:                                        39
;     height_in_cells:                                       38
;     desired_room_index:                                    19
;     write_value_to_a_rectangle_of_cells_in_collision_map:  13
;     desired_level:                                         11
;     l0a72:                                                 11
;     value_to_write_to_collision_map:                       10
;     l0a70:                                                 10
;     draw_sprite_a_at_cell_xy_and_write_to_collision_map:    9
;     l0a02:                                                  8
;     l0a04:                                                  8
;     set_room1_trapdoor_sprites_if_required:                 8
;     room1_trapdoor_open_flag:                               7
;     l0a01:                                                  7
;     play_sound_yx:                                          7
;     mouse_sprites_and_ball_movement_table:                  7
;     l0070:                                                  6
;     object_direction:                                       6
;     l0a71:                                                  6
;     initialise_level:                                       6
;     update_room_first_update_flag:                          6
;     draw_rope:                                              6
;     previous_level:                                         5
;     l0a73:                                                  5
;     set_object_position_from_cell_xy:                       5
;     test_for_collision_between_objects_x_and_y:             5
;     object_sprite_mask_type:                                5
;     define_envelope:                                        5
;     c41ae:                                                  5
;     c4355:                                                  5
;     temp_sprite_y_offset:                                   4
;     saxophone_collected_flag:                               4
;     mouse_ball_position:                                    4
;     start_room:                                             4
;     game_update:                                            4
;     draw_floor_walls_and_ceiling_around_solid_rock:         4
;     sub_c3f8b:                                              4
;     c41d9:                                                  4
;     c4415:                                                  4
;     object_spriteid:                                        3
;     l09aa:                                                  3
;     l09ab:                                                  3
;     l09ac:                                                  3
;     initialise_brazier_and_fire:                            3
;     current_room_index:                                     3
;     draw_sprite_a_at_cell_xy:                               3
;     find_or_create_menu_slot_for_A:                         3
;     l2eb6:                                                  3
;     object_z_order:                                         3
;     move_mouse_ball_if_room_0:                              3
;     return1:                                                3
;     c3f8a:                                                  3
;     c419f:                                                  3
;     c4339:                                                  3
;     source_sprite_memory_low:                               2
;     source_sprite_memory_high:                              2
;     object_x_low:                                           2
;     object_x_high:                                          2
;     l0a03:                                                  2
;     set_object_position_from_current_sprite_position:       2
;     player_collision_flag:                                  2
;     object_collision_flags:                                 2
;     sound_priority_per_channel_table:                       2
;     c3b0e:                                                  2
;     level_unchanged2:                                       2
;     room1_initial_setup_done:                               2
;     play_some_sound1_then_some_sound2:                      2
;     c3f51:                                                  2
;     l3fd5:                                                  2
;     l3fd6:                                                  2
;     baby_spriteid_data:                                     2
;     l40e3:                                                  2
;     c412e:                                                  2
;     c415e:                                                  2
;     c418c:                                                  2
;     c4194:                                                  2
;     c41c9:                                                  2
;     c4235:                                                  2
;     c432f:                                                  2
;     c43a0:                                                  2
;     sprite_reflect_flag:                                    1
;     temp_sprite_x_offset:                                   1
;     copy_mode:                                              1
;     player_held_item:                                       1
;     l0954:                                                  1
;     object_y_low:                                           1
;     l0980:                                                  1
;     object_y_high:                                          1
;     developer_flags:                                        1
;     update_level_completion:                                1
;     write_a_single_value_to_cell_in_collision_map:          1
;     play_landing_sound:                                     1
;     temp_left_offset:                                       1
;     temp_right_offset:                                      1
;     temp_bottom_offset:                                     1
;     something59_TODO:                                       1
;     l2ee9:                                                  1
;     l2eee:                                                  1
;     l2ef3:                                                  1
;     object_sprite_mask_type + objectid_left_mouse:          1
;     l3970:                                                  1
;     developer_mode_not_active:                              1
;     loop_c3bd4:                                             1
;     room0_handler:                                          1
;     initialise_mouse_ball_position_if_level_changed:        1
;     level_unchanged:                                        1
;     move_mouse_ball_if_room_0_local:                        1
;     bump_and_wrap_mouse_ball_position:                      1
;     no_wrap_needed:                                         1
;     play_mouse_ball_sounds:                                 1
;     mouse_ball_position_ge_8:                               1
;     mouse_ball_position_lt_8:                               1
;     mouse_ball_position_ge_0xf:                             1
;     mouse_ball_position_ge_0x17:                            1
;     mouse_ball_position_ge_0xf_common_tail:                 1
;     finish_mouse_ball_movement:                             1
;     c3dd2:                                                  1
;     c3de2:                                                  1
;     c3def:                                                  1
;     room1_handler:                                          1
;     set_up_open_trapdoor_collision_map:                     1
;     room1_not_first_update:                                 1
;     c3ec1:                                                  1
;     c3ed2:                                                  1
;     new_room1_trapdoor_open_flag_in_y:                      1
;     adjusted_room1_trapdoor_open_flag_in_y_is_ge_0:         1
;     return2:                                                1
;     trapdoor_sprite_table:                                  1
;     sub_c3f02:                                              1
;     c3f52:                                                  1
;     c3f62:                                                  1
;     loop_c4044:                                             1
;     sub_c407f:                                              1
;     c40b2:                                                  1
;     c40c1:                                                  1
;     c40e0:                                                  1
;     c40e4:                                                  1
;     c40ee:                                                  1
;     c40f7:                                                  1
;     c412b:                                                  1
;     c4137:                                                  1
;     c4167:                                                  1
;     c4184:                                                  1
;     c41c1:                                                  1
;     c420c:                                                  1
;     c4224:                                                  1
;     c424c:                                                  1
;     loop_c42ea:                                             1
;     sub_c42f8:                                              1
;     c4352:                                                  1
;     c4358:                                                  1
;     c4386:                                                  1
;     c43b4:                                                  1
;     c43ce:                                                  1
;     c43d4:                                                  1
;     c43e3:                                                  1
;     c43f6:                                                  1

; Automatically generated labels:
;     c3b0e
;     c3dd2
;     c3de2
;     c3def
;     c3ec1
;     c3ed2
;     c3f51
;     c3f52
;     c3f62
;     c3f8a
;     c40b2
;     c40c1
;     c40e0
;     c40e4
;     c40ee
;     c40f7
;     c412b
;     c412e
;     c4137
;     c415e
;     c4167
;     c4184
;     c418c
;     c4194
;     c419f
;     c41ae
;     c41c1
;     c41c9
;     c41d9
;     c420c
;     c4224
;     c4235
;     c424c
;     c432f
;     c4339
;     c4352
;     c4355
;     c4358
;     c4386
;     c43a0
;     c43b4
;     c43ce
;     c43d4
;     c43e3
;     c43f6
;     c4415
;     l0954
;     l0980
;     l09aa
;     l09ab
;     l09ac
;     l0a01
;     l0a02
;     l0a03
;     l0a04
;     l0a70
;     l0a71
;     l0a72
;     l0a73
;     l2eb6
;     l2ee9
;     l2eee
;     l2ef3
;     l3970
;     l3fd5
;     l3fd6
;     l40e3
;     loop_c3bd4
;     loop_c4044
;     loop_c42ea
;     sub_c3f02
;     sub_c3f8b
;     sub_c407f
;     sub_c42f8
!if (<envelope1) != $60 {
    !error "Assertion failed: <envelope1 == $60"
}
!if (<envelope2) != $2c {
    !error "Assertion failed: <envelope2 == $2c"
}
!if (<envelope3) != $16 {
    !error "Assertion failed: <envelope3 == $16"
}
!if (<envelope4) != $4a {
    !error "Assertion failed: <envelope4 == $4a"
}
!if (<ground_fill_2x2_top_left) != $86 {
    !error "Assertion failed: <ground_fill_2x2_top_left == $86"
}
!if (<mouse_ball_sound1) != $7e {
    !error "Assertion failed: <mouse_ball_sound1 == $7e"
}
!if (<mouse_ball_sound2) != $76 {
    !error "Assertion failed: <mouse_ball_sound2 == $76"
}
!if (<mouse_ball_sound3) != $6e {
    !error "Assertion failed: <mouse_ball_sound3 == $6e"
}
!if (<some_sound1) != $42 {
    !error "Assertion failed: <some_sound1 == $42"
}
!if (<some_sound2) != $3a {
    !error "Assertion failed: <some_sound2 == $3a"
}
!if (<some_sound3) != $24 {
    !error "Assertion failed: <some_sound3 == $24"
}
!if (<some_sound4) != $58 {
    !error "Assertion failed: <some_sound4 == $58"
}
!if (<tile_all_set_pixels) != $a9 {
    !error "Assertion failed: <tile_all_set_pixels == $a9"
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
!if (>envelope4) != $44 {
    !error "Assertion failed: >envelope4 == $44"
}
!if (>ground_fill_2x2_top_left) != $44 {
    !error "Assertion failed: >ground_fill_2x2_top_left == $44"
}
!if (>mouse_ball_sound1) != $44 {
    !error "Assertion failed: >mouse_ball_sound1 == $44"
}
!if (>mouse_ball_sound2) != $44 {
    !error "Assertion failed: >mouse_ball_sound2 == $44"
}
!if (>mouse_ball_sound3) != $44 {
    !error "Assertion failed: >mouse_ball_sound3 == $44"
}
!if (>some_sound1) != $44 {
    !error "Assertion failed: >some_sound1 == $44"
}
!if (>some_sound2) != $44 {
    !error "Assertion failed: >some_sound2 == $44"
}
!if (>some_sound3) != $44 {
    !error "Assertion failed: >some_sound3 == $44"
}
!if (>some_sound4) != $44 {
    !error "Assertion failed: >some_sound4 == $44"
}
!if (>tile_all_set_pixels) != $0a {
    !error "Assertion failed: >tile_all_set_pixels == $0a"
}
!if (collectable_spriteids + 1) != $2eee {
    !error "Assertion failed: collectable_spriteids + 1 == $2eee"
}
!if (copy_mode_simple) != $01 {
    !error "Assertion failed: copy_mode_simple == $01"
}
!if (level_init_after_load_handler) != $3af2 {
    !error "Assertion failed: level_init_after_load_handler == $3af2"
}
!if (level_name) != $3ae7 {
    !error "Assertion failed: level_name == $3ae7"
}
!if (level_update_handler) != $3b17 {
    !error "Assertion failed: level_update_handler == $3b17"
}
!if (object_spriteid + objectid_left_mouse) != $09aa {
    !error "Assertion failed: object_spriteid + objectid_left_mouse == $09aa"
}
!if (object_spriteid + objectid_left_trapdoor) != $09aa {
    !error "Assertion failed: object_spriteid + objectid_left_trapdoor == $09aa"
}
!if (object_spriteid + objectid_mouse_ball) != $09ac {
    !error "Assertion failed: object_spriteid + objectid_mouse_ball == $09ac"
}
!if (object_spriteid + objectid_right_mouse) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_right_mouse == $09ab"
}
!if (object_spriteid + objectid_right_trapdoor) != $09ab {
    !error "Assertion failed: object_spriteid + objectid_right_trapdoor == $09ab"
}
!if (object_spriteid + objectid_saxophone) != $09ac {
    !error "Assertion failed: object_spriteid + objectid_saxophone == $09ac"
}
!if (object_x_low + objectid_mouse_ball) != $0954 {
    !error "Assertion failed: object_x_low + objectid_mouse_ball == $0954"
}
!if (object_y_low + objectid_mouse_ball) != $0980 {
    !error "Assertion failed: object_y_low + objectid_mouse_ball == $0980"
}
!if (objectid_left_mouse) != $02 {
    !error "Assertion failed: objectid_left_mouse == $02"
}
!if (objectid_left_trapdoor) != $02 {
    !error "Assertion failed: objectid_left_trapdoor == $02"
}
!if (objectid_mouse_ball) != $04 {
    !error "Assertion failed: objectid_mouse_ball == $04"
}
!if (objectid_player) != $00 {
    !error "Assertion failed: objectid_player == $00"
}
!if (objectid_right_mouse) != $03 {
    !error "Assertion failed: objectid_right_mouse == $03"
}
!if (objectid_right_trapdoor) != $03 {
    !error "Assertion failed: objectid_right_trapdoor == $03"
}
!if (player_collision_flag_baby) != $06 {
    !error "Assertion failed: player_collision_flag_baby == $06"
}
!if (player_collision_flag_mouse_ball) != $80 {
    !error "Assertion failed: player_collision_flag_mouse_ball == $80"
}
!if (room_1_data_ptr) != $3b27 {
    !error "Assertion failed: room_1_data_ptr == $3b27"
}
!if (room_2_data_ptr) != $3d3d {
    !error "Assertion failed: room_2_data_ptr == $3d3d"
}
!if (room_3_data_ptr) != $3fd7 {
    !error "Assertion failed: room_3_data_ptr == $3fd7"
}
!if (room_4_data_ptr) != $424d {
    !error "Assertion failed: room_4_data_ptr == $424d"
}
!if (sound_priority_per_channel_table + 1) != $3970 {
    !error "Assertion failed: sound_priority_per_channel_table + 1 == $3970"
}
!if (sprite_data - level_data) != $09d1 {
    !error "Assertion failed: sprite_data - level_data == $09d1"
}
!if (spriteid_baby0) != $d6 {
    !error "Assertion failed: spriteid_baby0 == $d6"
}
!if (spriteid_baby1) != $d7 {
    !error "Assertion failed: spriteid_baby1 == $d7"
}
!if (spriteid_baby2) != $d8 {
    !error "Assertion failed: spriteid_baby2 == $d8"
}
!if (spriteid_baby3) != $d9 {
    !error "Assertion failed: spriteid_baby3 == $d9"
}
!if (spriteid_baby4) != $da {
    !error "Assertion failed: spriteid_baby4 == $da"
}
!if (spriteid_baby5) != $db {
    !error "Assertion failed: spriteid_baby5 == $db"
}
!if (spriteid_baby6) != $dc {
    !error "Assertion failed: spriteid_baby6 == $dc"
}
!if (spriteid_baby7) != $dd {
    !error "Assertion failed: spriteid_baby7 == $dd"
}
!if (spriteid_ball) != $3b {
    !error "Assertion failed: spriteid_ball == $3b"
}
!if (spriteid_mouse) != $c8 {
    !error "Assertion failed: spriteid_mouse == $c8"
}
!if (spriteid_mouse_hands1) != $c9 {
    !error "Assertion failed: spriteid_mouse_hands1 == $c9"
}
!if (spriteid_mouse_hands2) != $ca {
    !error "Assertion failed: spriteid_mouse_hands2 == $ca"
}
!if (spriteid_mouse_hands3) != $d4 {
    !error "Assertion failed: spriteid_mouse_hands3 == $d4"
}
!if (spriteid_mouse_hands4) != $d5 {
    !error "Assertion failed: spriteid_mouse_hands4 == $d5"
}
!if (spriteid_saxophone) != $d3 {
    !error "Assertion failed: spriteid_saxophone == $d3"
}
!if (spriteid_small_ball) != $cb {
    !error "Assertion failed: spriteid_small_ball == $cb"
}
!if (spriteid_table) != $de {
    !error "Assertion failed: spriteid_table == $de"
}
!if (spriteid_trapdoor_diagonal) != $d0 {
    !error "Assertion failed: spriteid_trapdoor_diagonal == $d0"
}
!if (spriteid_trapdoor_horizontal) != $cf {
    !error "Assertion failed: spriteid_trapdoor_horizontal == $cf"
}
!if (spriteid_trapdoor_vertical) != $d1 {
    !error "Assertion failed: spriteid_trapdoor_vertical == $d1"
}
!if (toolbar_collectable_spriteids + 1) != $2ee9 {
    !error "Assertion failed: toolbar_collectable_spriteids + 1 == $2ee9"
}
