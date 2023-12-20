; *************************************************************************************
;
; Level Q: 'EPILOGUE'
;
; Shows a scrolling message to tie in with the back story of Imogen (see 'encoded_message'),
; then displays a copyright message (see copyright_message) and 'The End' in large letters
; (a bitmap). At this point an infinite loop is entered. The player must reset the machine.
;
; The character definitions are embedded (an italic version of the standard BBC characters).
;
; Unused code:
; 1. There is code to press a key to restart the game. (Reloading the toolbar etc)
; 2. There is also code that in developer mode, the up arrow key will pause the scrolling of
;    the text.
; 3. There is a short fragment of BASIC code at the end which was probably part of the
;    original development process.
;
; *************************************************************************************

; Constants
colour_white                    = 7
copy_mode_2x2                   = 0
copy_mode_random16              = 16
copy_mode_random2               = 2
copy_mode_random32              = 32
copy_mode_random4               = 4
copy_mode_random64              = 64
copy_mode_random8               = 8
copy_mode_simple                = 1
exit_room_bottom                = 2
exit_room_left                  = 1
exit_room_right                 = 4
exit_room_top                   = 8
first_level_letter              = 65
game_area_height_cells          = 24
game_area_width_cells           = 40
inkey_key_escape                = 143
inkey_up_cursor                 = 198
last_level_letter               = 81
object_collided_ceiling         = 8
object_collided_floor           = 2
object_collided_left_wall       = 1
object_collided_right_wall      = 4
objectid_old_player             = 11
objectid_old_player_accessory   = 12
objectid_player                 = 0
objectid_player_accessory       = 1
opcode_jmp                      = 76
osbyte_flush_buffer_class       = 15

; Memory locations
sprite_id                                           = $16
sprite_x_base_low                                   = $18
sprite_x_base_high                                  = $19
sprite_y_base_low                                   = $1a
sprite_y_base_high                                  = $1b
sprite_reflect_flag                                 = $1d
current_menu_index                                  = $2e
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
current_player_character                            = $48
previous_room_index                                 = $50
level_before_latest_level_and_room_initialisation   = $51
player_held_object_spriteid                         = $52
sprdata_ptr                                         = $54
developer_mode_sideways_ram_is_set_up_flag          = $5b
bitmap_address_low                                  = $70
filename_address_low                                = $70
l0070                                               = $70
message_address_low                                 = $70
screen_address_low                                  = $70
bitmap_address_high                                 = $71
filename_address_high                               = $71
l0071                                               = $71
message_address_high                                = $71
screen_address_high                                 = $71
l0072                                               = $72
message_offset_low                                  = $72
screen_address1_low                                 = $72
l0073                                               = $73
screen_address1_high                                = $73
screen_y_offset_within_cell                         = $73
l0074                                               = $74
l0075                                               = $75
l0076                                               = $76
l0077                                               = $77
l0078                                               = $78
l0079                                               = $79
l007a                                               = $7a
l007b                                               = $7b
character_definition_low                            = $7c
character_definition_high                           = $7d
object_x_low                                        = $0950
object_x_low_old                                    = $095b
object_x_high                                       = $0966
object_x_high_old                                   = $0971
object_y_low                                        = $097c
object_y_low_old                                    = $0987
object_y_high                                       = $0992
object_spriteid                                     = $09a8
object_spriteid_old                                 = $09b3
object_direction                                    = $09be
current_player_animation                            = $09df
tile_all_set_pixels                                 = $0aa9
l0ab1                                               = $0ab1
l0ab2                                               = $0ab2
developer_flags                                     = $1103
start_game                                          = $110c
initialise_level_and_room                           = $1140
start_room                                          = $12bb
game_update                                         = $12da
update_room_first_update_flag                       = $132b
sprite_op                                           = $138d
osfile_wrapper                                      = $16dc
toolbar_colour                                      = $175e
gameplay_area_colour                                = $1760
vsync_counter                                       = $178b
wait_for_vsync                                      = $178c
reset_game_because_escape_pressed                   = $1839
get_random_number_up_to_a                           = $18a6
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
copy_object_state_to_old                            = $20f7
jmp_for_update_extra_player_character               = $22dd
play_landing_sound                                  = $23a9
player_wall_collision_reaction_speed                = $2433
find_left_and_right_of_object                       = $2434
temp_left_offset                                    = $24d0
temp_right_offset                                   = $24d1
find_top_and_bottom_of_object                       = $24d2
temp_top_offset                                     = $2550
temp_bottom_offset                                  = $2551
update_object_a_solid_rock_collision                = $25f5
update_object_hitting_floor                         = $2770
object_has_hit_floor_flag                           = $288f
object_just_fallen_off_edge_direction               = $2890
get_solid_rock_collision_for_object_a               = $2894
temp_default_collision_map_option                   = $28e1
test_for_collision_between_objects_x_and_y          = $28e2
desired_menu_slots                                  = $295c
menu_index_for_extra_items                          = $296e
displayed_menu_slots                                = $296f
reset_menu_items                                    = $2980
draw_menu_icons                                     = $29a8
insert_character_menu_item_into_toolbar             = $2b87
find_or_create_menu_slot_for_A                      = $2bbd
remove_item_from_toolbar_menu                       = $2be0
player_using_object_spriteid                        = $2eb6
previous_player_using_object_spriteid               = $2eb7
toolbar_collectable_spriteids                       = $2ee8
collectable_spriteids                               = $2eed
collectable_being_used_spriteids                    = $2ef2
monkey_base_animation                               = $30ff
monkey_climb_idle_animation                         = $3144
monkey_climb_down_animation                         = $3148
monkey_climb_animation                              = $3150
inhibit_monkey_climb_flag                           = $31d7
prompt_user_to_insert_correct_disc                  = $3617
print_encrypted_string_at_yx                        = $381c
inkey_0                                             = $387c
object_erase_type                                   = $38ac
object_z_order                                      = $38c2
object_room_collision_flags                         = $38d8
play_sound_yx                                       = $38f6
sound_priority_per_channel_table                    = $396f
negative_inkey                                      = $3acc
oswrch                                              = $ffee
osbyte                                              = $fff4

    * = $3ad5

level_data
pydis_start
    !word $0c3b                                                       ; 3ad5: 3b 0c
level_specific_initialisation_ptr
    !word level_specific_update_ptr                                   ; 3ad7: d9 3a

level_specific_update_ptr
    pla                                                               ; 3ad9: 68
    pla                                                               ; 3ada: 68
level_specific_password_ptr
    jsr wait_for_vsync                                                ; 3adb: 20 8c 17
    jsr wait_for_vsync                                                ; 3ade: 20 8c 17
    jsr clear_screen                                                  ; 3ae1: 20 c9 3c
; make toolbar palette white so all text appears white
    lda #colour_white                                                 ; 3ae4: a9 07
    sta toolbar_colour                                                ; 3ae6: 8d 5e 17
    sta gameplay_area_colour                                          ; 3ae9: 8d 60 17
; wait 2 seconds
    lda #100                                                          ; 3aec: a9 64
    jsr wait_for_a_vsyncs                                             ; 3aee: 20 25 43
; start the scrolling message
    lda #7                                                            ; 3af1: a9 07
    sta screen_y_offset_within_cell                                   ; 3af3: 85 73
    lda #$20 ; ' '                                                    ; 3af5: a9 20
    sta l0074                                                         ; 3af7: 85 74
    lda #$80                                                          ; 3af9: a9 80
    sta l0075                                                         ; 3afb: 85 75
display_full_message_loop
    lda #0                                                            ; 3afd: a9 00
    sta vsync_counter                                                 ; 3aff: 8d 8b 17
    jsr check_for_escape_pressed_in_developer_mode                    ; 3b02: 20 e3 3c
    lda #<encoded_message                                             ; 3b05: a9 fc
    sta message_address_low                                           ; 3b07: 85 70
    lda #>encoded_message                                             ; 3b09: a9 3f
    sta message_address_high                                          ; 3b0b: 85 71
    ldy #0                                                            ; 3b0d: a0 00
    sty message_offset_low                                            ; 3b0f: 84 72
    lda l0074                                                         ; 3b11: a5 74
    sta l0076                                                         ; 3b13: 85 76
    sta l0078                                                         ; 3b15: 85 78
    sta l007a                                                         ; 3b17: 85 7a
    lda l0075                                                         ; 3b19: a5 75
    sta l0077                                                         ; 3b1b: 85 77
    sta l0079                                                         ; 3b1d: 85 79
    sta l007b                                                         ; 3b1f: 85 7b
    jmp entry_point_for_scrolling_message                             ; 3b21: 4c bb 3b

get_next_character
    ldy message_offset_low                                            ; 3b24: a4 72
    inc message_offset_low                                            ; 3b26: e6 72
; read next character of message
    lda (message_address_low),y                                       ; 3b28: b1 70
; decode character
    eor #$cb                                                          ; 3b2a: 49 cb
    beq end_of_message_local                                          ; 3b2c: f0 65
    cmp #$0d                                                          ; 3b2e: c9 0d
    beq end_of_line                                                   ; 3b30: f0 64
    cmp #$20 ; ' '                                                    ; 3b32: c9 20
    beq move_forwards_8_pixels                                        ; 3b34: f0 4a
; reduce ASCII character to index starting at zero
    sec                                                               ; 3b36: 38
    sbc #$21 ; '!'                                                    ; 3b37: e9 21
    ldx #0                                                            ; 3b39: a2 00
    stx character_definition_high                                     ; 3b3b: 86 7d
; multiply index by eight
    asl                                                               ; 3b3d: 0a
    asl                                                               ; 3b3e: 0a
    rol character_definition_high                                     ; 3b3f: 26 7d
    asl                                                               ; 3b41: 0a
    rol character_definition_high                                     ; 3b42: 26 7d
; add $3d0c to get address of character definition
    adc #<character_definitions                                       ; 3b44: 69 0c
    sta character_definition_low                                      ; 3b46: 85 7c
    lda character_definition_high                                     ; 3b48: a5 7d
    adc #>character_definitions                                       ; 3b4a: 69 3d
    sta character_definition_high                                     ; 3b4c: 85 7d
; copy character definition
    ldy #7                                                            ; 3b4e: a0 07
copy_character_loop
    lda (character_definition_low),y                                  ; 3b50: b1 7c
    sta character,y                                                   ; 3b52: 99 fb 3c
    dey                                                               ; 3b55: 88
    bpl copy_character_loop                                           ; 3b56: 10 f8
    ldx #8                                                            ; 3b58: a2 08
    ldy screen_y_offset_within_cell                                   ; 3b5a: a4 73
copy_to_screen_loop
    lda l007b                                                         ; 3b5c: a5 7b
; skip when we reach the end of screen memory, i.e. $8000
    cmp #$80                                                          ; 3b5e: c9 80
    bcs skip_write_to_screen                                          ; 3b60: b0 05
; copy byte of character to the screen
    lda character,x                                                   ; 3b62: bd fb 3c
    sta (l007a),y                                                     ; 3b65: 91 7a
skip_write_to_screen
    dex                                                               ; 3b67: ca
    bmi move_forwards_8_pixels                                        ; 3b68: 30 16
    dey                                                               ; 3b6a: 88
    bpl copy_to_screen_loop                                           ; 3b6b: 10 ef
    ldy #7                                                            ; 3b6d: a0 07
; move screen address up one character row
    lda l007a                                                         ; 3b6f: a5 7a
    sec                                                               ; 3b71: 38
    sbc #$40 ; '@'                                                    ; 3b72: e9 40
    sta l007a                                                         ; 3b74: 85 7a
    lda l007b                                                         ; 3b76: a5 7b
    sbc #1                                                            ; 3b78: e9 01
    sta l007b                                                         ; 3b7a: 85 7b
    cmp #$5d ; ']'                                                    ; 3b7c: c9 5d
    bcs copy_to_screen_loop                                           ; 3b7e: b0 dc
move_forwards_8_pixels
    lda l0078                                                         ; 3b80: a5 78
    clc                                                               ; 3b82: 18
    adc #8                                                            ; 3b83: 69 08
    sta l0078                                                         ; 3b85: 85 78
    sta l007a                                                         ; 3b87: 85 7a
    lda l0079                                                         ; 3b89: a5 79
    adc #0                                                            ; 3b8b: 69 00
    sta l0079                                                         ; 3b8d: 85 79
    sta l007b                                                         ; 3b8f: 85 7b
    bne get_next_character                                            ; 3b91: d0 91
end_of_message_local
    jmp end_of_message                                                ; 3b93: 4c d8 3b

end_of_line
    tya                                                               ; 3b96: 98
    ldy #0                                                            ; 3b97: a0 00
    sty message_offset_low                                            ; 3b99: 84 72
    sec                                                               ; 3b9b: 38
    adc message_address_low                                           ; 3b9c: 65 70
    sta message_address_low                                           ; 3b9e: 85 70
    lda #0                                                            ; 3ba0: a9 00
    adc message_address_high                                          ; 3ba2: 65 71
    sta message_address_high                                          ; 3ba4: 85 71
; move down two character rows
    lda l0076                                                         ; 3ba6: a5 76
    clc                                                               ; 3ba8: 18
    adc #$80                                                          ; 3ba9: 69 80
    sta l0076                                                         ; 3bab: 85 76
    sta l0078                                                         ; 3bad: 85 78
    sta l007a                                                         ; 3baf: 85 7a
    lda l0077                                                         ; 3bb1: a5 77
    adc #2                                                            ; 3bb3: 69 02
    sta l0077                                                         ; 3bb5: 85 77
    sta l0079                                                         ; 3bb7: 85 79
    sta l007b                                                         ; 3bb9: 85 7b
entry_point_for_scrolling_message
    cmp #$c0                                                          ; 3bbb: c9 c0
    bcs skip_to_next_line_of_message                                  ; 3bbd: b0 0b
    cmp #$81                                                          ; 3bbf: c9 81
    bcs end_of_message                                                ; 3bc1: b0 15
    cmp #$5d ; ']'                                                    ; 3bc3: c9 5d
    bcc skip_to_next_line_of_message                                  ; 3bc5: 90 03
    jmp get_next_character                                            ; 3bc7: 4c 24 3b

skip_to_next_line_of_message
    lda (message_address_low),y                                       ; 3bca: b1 70
    eor #$cb                                                          ; 3bcc: 49 cb
    beq end_of_message                                                ; 3bce: f0 08
    cmp #$0d                                                          ; 3bd0: c9 0d
    beq end_of_line                                                   ; 3bd2: f0 c2
    iny                                                               ; 3bd4: c8
    jmp skip_to_next_line_of_message                                  ; 3bd5: 4c ca 3b

end_of_message
    lda screen_y_offset_within_cell                                   ; 3bd8: a5 73
    cmp #0                                                            ; 3bda: c9 00                   ; redundant instruction
    bne move_up_one_pixel                                             ; 3bdc: d0 06
    lda l0077                                                         ; 3bde: a5 77
    cmp #$5d ; ']'                                                    ; 3be0: c9 5d
    beq copy_the_end_bitmap_to_screen                                 ; 3be2: f0 30
move_up_one_pixel
    lda screen_y_offset_within_cell                                   ; 3be4: a5 73
    sec                                                               ; 3be6: 38
    sbc #1                                                            ; 3be7: e9 01
    and #7                                                            ; 3be9: 29 07
    sta screen_y_offset_within_cell                                   ; 3beb: 85 73
    bcs check_for_up_arrow_in_developer_mode                          ; 3bed: b0 0d
; move up one character row
    lda l0074                                                         ; 3bef: a5 74
    sec                                                               ; 3bf1: 38
    sbc #$40 ; '@'                                                    ; 3bf2: e9 40
    sta l0074                                                         ; 3bf4: 85 74
    lda l0075                                                         ; 3bf6: a5 75
    sbc #1                                                            ; 3bf8: e9 01
    sta l0075                                                         ; 3bfa: 85 75
check_for_up_arrow_in_developer_mode
    lda developer_flags                                               ; 3bfc: ad 03 11
    and #1                                                            ; 3bff: 29 01
    beq wait_four_vsyncs_loop                                         ; 3c01: f0 07
    ldx #inkey_up_cursor                                              ; 3c03: a2 c6
    jsr negative_inkey                                                ; 3c05: 20 cc 3a
    bne display_full_message_loop_local                               ; 3c08: d0 07
; wait until four vsyncs have passed and repeat
wait_four_vsyncs_loop
    lda vsync_counter                                                 ; 3c0a: ad 8b 17
    cmp #4                                                            ; 3c0d: c9 04
    bcc wait_four_vsyncs_loop                                         ; 3c0f: 90 f9
display_full_message_loop_local
    jmp display_full_message_loop                                     ; 3c11: 4c fd 3a

copy_the_end_bitmap_to_screen
    lda #50                                                           ; 3c14: a9 32
    jsr wait_for_a_vsyncs                                             ; 3c16: 20 25 43
; copy bitmap to screen
    ldx #4                                                            ; 3c19: a2 04
    ldy #$40 ; '@'                                                    ; 3c1b: a0 40
    sty l0074                                                         ; 3c1d: 84 74
    lda #<the_end_bitmap                                              ; 3c1f: a9 30
    sec                                                               ; 3c21: 38
    sbc l0074                                                         ; 3c22: e5 74
    sta bitmap_address_low                                            ; 3c24: 85 70
    lda #>the_end_bitmap                                              ; 3c26: a9 43
    sbc #0                                                            ; 3c28: e9 00
    sta bitmap_address_high                                           ; 3c2a: 85 71
    lda #$80                                                          ; 3c2c: a9 80
    sec                                                               ; 3c2e: 38
    sbc l0074                                                         ; 3c2f: e5 74
    sta screen_address1_low                                           ; 3c31: 85 72
    lda #$69 ; 'i'                                                    ; 3c33: a9 69
    sbc #0                                                            ; 3c35: e9 00
    sta screen_address1_high                                          ; 3c37: 85 73
copy_loop
    lda (bitmap_address_low),y                                        ; 3c39: b1 70
    sta (screen_address1_low),y                                       ; 3c3b: 91 72
    iny                                                               ; 3c3d: c8
    bne copy_loop                                                     ; 3c3e: d0 f9
    inc bitmap_address_high                                           ; 3c40: e6 71
    inc screen_address1_high                                          ; 3c42: e6 73
    dex                                                               ; 3c44: ca
    bne copy_loop                                                     ; 3c45: d0 f2
; clear text and graphics windows
    lda #$1a                                                          ; 3c47: a9 1a
    jsr oswrch                                                        ; 3c49: 20 ee ff                ; Write character 26
; change background colour to black (logical colour 0)
    lda #$11                                                          ; 3c4c: a9 11
    jsr oswrch                                                        ; 3c4e: 20 ee ff                ; Write character 17
    lda #$80                                                          ; 3c51: a9 80
    jsr oswrch                                                        ; 3c53: 20 ee ff                ; Write character 128
; change foreground colour to white (logical colour 1)
    lda #$11                                                          ; 3c56: a9 11
    jsr oswrch                                                        ; 3c58: 20 ee ff                ; Write character 17
    lda #1                                                            ; 3c5b: a9 01
    jsr oswrch                                                        ; 3c5d: 20 ee ff                ; Write character 1
; set cursor position to (3, 20)
    lda #$1f                                                          ; 3c60: a9 1f
    jsr oswrch                                                        ; 3c62: 20 ee ff                ; Write character 31
    lda #3                                                            ; 3c65: a9 03
    jsr oswrch                                                        ; 3c67: 20 ee ff                ; Write character 3
    lda #$14                                                          ; 3c6a: a9 14
    jsr oswrch                                                        ; 3c6c: 20 ee ff                ; Write character 20
; show copyright message
    ldx #<copyright_message                                           ; 3c6f: a2 a6
    ldy #>copyright_message                                           ; 3c71: a0 3c
    jsr print_encrypted_string_at_yx                                  ; 3c73: 20 1c 38
; set text window to (left, bottom, right, top) = (1, 31, 39, 9)
    lda #$1c                                                          ; 3c76: a9 1c
    jsr oswrch                                                        ; 3c78: 20 ee ff                ; Write character 28
    lda #1                                                            ; 3c7b: a9 01
    jsr oswrch                                                        ; 3c7d: 20 ee ff                ; Write character 1
    lda #$1f                                                          ; 3c80: a9 1f
    jsr oswrch                                                        ; 3c82: 20 ee ff                ; Write character 31
    lda #$27 ; '''                                                    ; 3c85: a9 27
    jsr oswrch                                                        ; 3c87: 20 ee ff                ; Write character 39
    lda #9                                                            ; 3c8a: a9 09
    jsr oswrch                                                        ; 3c8c: 20 ee ff                ; Write character 9
; reset background colour to logical colour 1
    lda #$11                                                          ; 3c8f: a9 11
    jsr oswrch                                                        ; 3c91: 20 ee ff                ; Write character 17
    lda #$81                                                          ; 3c94: a9 81
    jsr oswrch                                                        ; 3c96: 20 ee ff                ; Write character 129
; reset foreground colour to logical colour 0
    lda #$11                                                          ; 3c99: a9 11
    jsr oswrch                                                        ; 3c9b: 20 ee ff                ; Write character 17
    lda #0                                                            ; 3c9e: a9 00
    jsr oswrch                                                        ; 3ca0: 20 ee ff                ; Write character 0
    jmp the_end_loop                                                  ; 3ca3: 4c aa 42

; 'Copyright Micro Power Limited 1986[0d]' EOR-encrypted with $cb
copyright_message
    !byte $88, $a4, $bb, $b2, $b9, $a2, $ac, $a3, $bf, $eb, $86, $a2  ; 3ca6: 88 a4 bb...
    !byte $a8, $b9, $a4, $eb, $9b, $a4, $bc, $ae, $b9, $eb, $87, $a2  ; 3cb2: a8 b9 a4...
    !byte $a6, $a2, $bf, $ae, $af, $eb, $fa, $f2, $f3, $fd, $c6       ; 3cbe: a6 a2 bf...

clear_screen
    lda #0                                                            ; 3cc9: a9 00
    sta screen_address_low                                            ; 3ccb: 85 70
    lda #$5b ; '['                                                    ; 3ccd: a9 5b
    sta screen_address_high                                           ; 3ccf: 85 71
    lda #0                                                            ; 3cd1: a9 00
    ldx #$80                                                          ; 3cd3: a2 80
    ldy #$c0                                                          ; 3cd5: a0 c0
clear_screen_loop
    sta (screen_address_low),y                                        ; 3cd7: 91 70
    iny                                                               ; 3cd9: c8
    bne clear_screen_loop                                             ; 3cda: d0 fb
    inc screen_address_high                                           ; 3cdc: e6 71
    cpx screen_address_high                                           ; 3cde: e4 71
    bne clear_screen_loop                                             ; 3ce0: d0 f5
    rts                                                               ; 3ce2: 60

check_for_escape_pressed_in_developer_mode
    lda developer_mode_sideways_ram_is_set_up_flag                    ; 3ce3: a5 5b
    beq return1                                                       ; 3ce5: f0 13
    lda developer_flags                                               ; 3ce7: ad 03 11
    and #1                                                            ; 3cea: 29 01
    beq return1                                                       ; 3cec: f0 0c
    ldx #inkey_key_escape                                             ; 3cee: a2 8f
    jsr negative_inkey                                                ; 3cf0: 20 cc 3a
    beq return1                                                       ; 3cf3: f0 05
; reset game
    pla                                                               ; 3cf5: 68
    pla                                                               ; 3cf6: 68
    jmp reset_game_because_escape_pressed                             ; 3cf7: 4c 39 18

return1
    rts                                                               ; 3cfa: 60

character
    !byte 0, 0, 0, 0, 0, 0, 0, 0                                      ; 3cfb: 00 00 00...

unused1
    !byte 0, 0, 0, 0, 0, 0, 0, 0, 0                                   ; 3d03: 00 00 00...

character_definitions
    !byte %....##..                                                   ; 3d0c: 0c
    !byte %....##..                                                   ; 3d0d: 0c
    !byte %...##...                                                   ; 3d0e: 18
    !byte %...##...                                                   ; 3d0f: 18
    !byte %...##...                                                   ; 3d10: 18
    !byte %........                                                   ; 3d11: 00
    !byte %..##....                                                   ; 3d12: 30
    !byte %........                                                   ; 3d13: 00

    !byte %..##.##.                                                   ; 3d14: 36
    !byte %..##.##.                                                   ; 3d15: 36
    !byte %.##.##..                                                   ; 3d16: 6c
    !byte %........                                                   ; 3d17: 00
    !byte %........                                                   ; 3d18: 00
    !byte %........                                                   ; 3d19: 00
    !byte %........                                                   ; 3d1a: 00
    !byte %........                                                   ; 3d1b: 00

    !byte %...##.##                                                   ; 3d1c: 1b
    !byte %...##.##                                                   ; 3d1d: 1b
    !byte %.#######                                                   ; 3d1e: 7f
    !byte %..##.##.                                                   ; 3d1f: 36
    !byte %.#######                                                   ; 3d20: 7f
    !byte %.##.##..                                                   ; 3d21: 6c
    !byte %.##.##..                                                   ; 3d22: 6c
    !byte %........                                                   ; 3d23: 00

    !byte %.....##.                                                   ; 3d24: 06
    !byte %...#####                                                   ; 3d25: 1f
    !byte %.##.#...                                                   ; 3d26: 68
    !byte %..#####.                                                   ; 3d27: 3e
    !byte %....#.##                                                   ; 3d28: 0b
    !byte %######..                                                   ; 3d29: fc
    !byte %..##....                                                   ; 3d2a: 30
    !byte %........                                                   ; 3d2b: 00

    !byte %..##....                                                   ; 3d2c: 30
    !byte %..##..##                                                   ; 3d2d: 33
    !byte %....##..                                                   ; 3d2e: 0c
    !byte %...##...                                                   ; 3d2f: 18
    !byte %..##....                                                   ; 3d30: 30
    !byte %##..##..                                                   ; 3d31: cc
    !byte %....##..                                                   ; 3d32: 0c
    !byte %........                                                   ; 3d33: 00

    !byte %...###..                                                   ; 3d34: 1c
    !byte %..##.##.                                                   ; 3d35: 36
    !byte %.##.##..                                                   ; 3d36: 6c
    !byte %..###...                                                   ; 3d37: 38
    !byte %.##.##.#                                                   ; 3d38: 6d
    !byte %##..##..                                                   ; 3d39: cc
    !byte %.###.##.                                                   ; 3d3a: 76
    !byte %........                                                   ; 3d3b: 00

    !byte %.....##.                                                   ; 3d3c: 06
    !byte %....##..                                                   ; 3d3d: 0c
    !byte %..##....                                                   ; 3d3e: 30
    !byte %........                                                   ; 3d3f: 00
    !byte %........                                                   ; 3d40: 00
    !byte %........                                                   ; 3d41: 00
    !byte %........                                                   ; 3d42: 00
    !byte %........                                                   ; 3d43: 00

    !byte %.....##.                                                   ; 3d44: 06
    !byte %....##..                                                   ; 3d45: 0c
    !byte %..##....                                                   ; 3d46: 30
    !byte %..##....                                                   ; 3d47: 30
    !byte %..##....                                                   ; 3d48: 30
    !byte %..##....                                                   ; 3d49: 30
    !byte %...##...                                                   ; 3d4a: 18
    !byte %........                                                   ; 3d4b: 00

    !byte %...##...                                                   ; 3d4c: 18
    !byte %....##..                                                   ; 3d4d: 0c
    !byte %....##..                                                   ; 3d4e: 0c
    !byte %....##..                                                   ; 3d4f: 0c
    !byte %....##..                                                   ; 3d50: 0c
    !byte %..##....                                                   ; 3d51: 30
    !byte %.##.....                                                   ; 3d52: 60
    !byte %........                                                   ; 3d53: 00

    !byte %........                                                   ; 3d54: 00
    !byte %....##..                                                   ; 3d55: 0c
    !byte %.######.                                                   ; 3d56: 7e
    !byte %..####..                                                   ; 3d57: 3c
    !byte %.######.                                                   ; 3d58: 7e
    !byte %..##....                                                   ; 3d59: 30
    !byte %........                                                   ; 3d5a: 00
    !byte %........                                                   ; 3d5b: 00

    !byte %........                                                   ; 3d5c: 00
    !byte %....##..                                                   ; 3d5d: 0c
    !byte %...##...                                                   ; 3d5e: 18
    !byte %.######.                                                   ; 3d5f: 7e
    !byte %...##...                                                   ; 3d60: 18
    !byte %..##....                                                   ; 3d61: 30
    !byte %........                                                   ; 3d62: 00
    !byte %........                                                   ; 3d63: 00

    !byte %........                                                   ; 3d64: 00
    !byte %........                                                   ; 3d65: 00
    !byte %........                                                   ; 3d66: 00
    !byte %........                                                   ; 3d67: 00
    !byte %........                                                   ; 3d68: 00
    !byte %..##....                                                   ; 3d69: 30
    !byte %..##....                                                   ; 3d6a: 30
    !byte %.##.....                                                   ; 3d6b: 60

    !byte %........                                                   ; 3d6c: 00
    !byte %........                                                   ; 3d6d: 00
    !byte %........                                                   ; 3d6e: 00
    !byte %.######.                                                   ; 3d6f: 7e
    !byte %........                                                   ; 3d70: 00
    !byte %........                                                   ; 3d71: 00
    !byte %........                                                   ; 3d72: 00
    !byte %........                                                   ; 3d73: 00

    !byte %........                                                   ; 3d74: 00
    !byte %........                                                   ; 3d75: 00
    !byte %........                                                   ; 3d76: 00
    !byte %........                                                   ; 3d77: 00
    !byte %........                                                   ; 3d78: 00
    !byte %..##....                                                   ; 3d79: 30
    !byte %..##....                                                   ; 3d7a: 30
    !byte %........                                                   ; 3d7b: 00

    !byte %........                                                   ; 3d7c: 00
    !byte %......##                                                   ; 3d7d: 03
    !byte %....##..                                                   ; 3d7e: 0c
    !byte %...##...                                                   ; 3d7f: 18
    !byte %..##....                                                   ; 3d80: 30
    !byte %##......                                                   ; 3d81: c0
    !byte %........                                                   ; 3d82: 00
    !byte %........                                                   ; 3d83: 00

    !byte %...####.                                                   ; 3d84: 1e
    !byte %..##..##                                                   ; 3d85: 33
    !byte %.##.###.                                                   ; 3d86: 6e
    !byte %.######.                                                   ; 3d87: 7e
    !byte %.###.##.                                                   ; 3d88: 76
    !byte %##..##..                                                   ; 3d89: cc
    !byte %.####...                                                   ; 3d8a: 78
    !byte %........                                                   ; 3d8b: 00

    !byte %....##..                                                   ; 3d8c: 0c
    !byte %...###..                                                   ; 3d8d: 1c
    !byte %...##...                                                   ; 3d8e: 18
    !byte %...##...                                                   ; 3d8f: 18
    !byte %...##...                                                   ; 3d90: 18
    !byte %..##....                                                   ; 3d91: 30
    !byte %######..                                                   ; 3d92: fc
    !byte %........                                                   ; 3d93: 00

    !byte %...####.                                                   ; 3d94: 1e
    !byte %..##..##                                                   ; 3d95: 33
    !byte %.....##.                                                   ; 3d96: 06
    !byte %....##..                                                   ; 3d97: 0c
    !byte %...##...                                                   ; 3d98: 18
    !byte %.##.....                                                   ; 3d99: 60
    !byte %######..                                                   ; 3d9a: fc
    !byte %........                                                   ; 3d9b: 00

    !byte %...####.                                                   ; 3d9c: 1e
    !byte %..##..##                                                   ; 3d9d: 33
    !byte %.....##.                                                   ; 3d9e: 06
    !byte %...###..                                                   ; 3d9f: 1c
    !byte %.....##.                                                   ; 3da0: 06
    !byte %##..##..                                                   ; 3da1: cc
    !byte %.####...                                                   ; 3da2: 78
    !byte %........                                                   ; 3da3: 00

    !byte %.....##.                                                   ; 3da4: 06
    !byte %....###.                                                   ; 3da5: 0e
    !byte %..####..                                                   ; 3da6: 3c
    !byte %.##.##..                                                   ; 3da7: 6c
    !byte %.######.                                                   ; 3da8: 7e
    !byte %...##...                                                   ; 3da9: 18
    !byte %...##...                                                   ; 3daa: 18
    !byte %........                                                   ; 3dab: 00

    !byte %..######                                                   ; 3dac: 3f
    !byte %..##....                                                   ; 3dad: 30
    !byte %.#####..                                                   ; 3dae: 7c
    !byte %.....##.                                                   ; 3daf: 06
    !byte %.....##.                                                   ; 3db0: 06
    !byte %##..##..                                                   ; 3db1: cc
    !byte %.####...                                                   ; 3db2: 78
    !byte %........                                                   ; 3db3: 00

    !byte %....###.                                                   ; 3db4: 0e
    !byte %...##...                                                   ; 3db5: 18
    !byte %.##.....                                                   ; 3db6: 60
    !byte %.#####..                                                   ; 3db7: 7c
    !byte %.##..##.                                                   ; 3db8: 66
    !byte %##..##..                                                   ; 3db9: cc
    !byte %.####...                                                   ; 3dba: 78
    !byte %........                                                   ; 3dbb: 00

    !byte %..######                                                   ; 3dbc: 3f
    !byte %......##                                                   ; 3dbd: 03
    !byte %....##..                                                   ; 3dbe: 0c
    !byte %...##...                                                   ; 3dbf: 18
    !byte %..##....                                                   ; 3dc0: 30
    !byte %.##.....                                                   ; 3dc1: 60
    !byte %.##.....                                                   ; 3dc2: 60
    !byte %........                                                   ; 3dc3: 00

    !byte %...####.                                                   ; 3dc4: 1e
    !byte %..##..##                                                   ; 3dc5: 33
    !byte %.##..##.                                                   ; 3dc6: 66
    !byte %..####..                                                   ; 3dc7: 3c
    !byte %.##..##.                                                   ; 3dc8: 66
    !byte %##..##..                                                   ; 3dc9: cc
    !byte %.####...                                                   ; 3dca: 78
    !byte %........                                                   ; 3dcb: 00

    !byte %...####.                                                   ; 3dcc: 1e
    !byte %..##..##                                                   ; 3dcd: 33
    !byte %.##..##.                                                   ; 3dce: 66
    !byte %..#####.                                                   ; 3dcf: 3e
    !byte %.....##.                                                   ; 3dd0: 06
    !byte %...##...                                                   ; 3dd1: 18
    !byte %.###....                                                   ; 3dd2: 70
    !byte %........                                                   ; 3dd3: 00

    !byte %........                                                   ; 3dd4: 00
    !byte %........                                                   ; 3dd5: 00
    !byte %...##...                                                   ; 3dd6: 18
    !byte %...##...                                                   ; 3dd7: 18
    !byte %........                                                   ; 3dd8: 00
    !byte %..##....                                                   ; 3dd9: 30
    !byte %..##....                                                   ; 3dda: 30
    !byte %........                                                   ; 3ddb: 00

    !byte %........                                                   ; 3ddc: 00
    !byte %........                                                   ; 3ddd: 00
    !byte %...##...                                                   ; 3dde: 18
    !byte %...##...                                                   ; 3ddf: 18
    !byte %........                                                   ; 3de0: 00
    !byte %..##....                                                   ; 3de1: 30
    !byte %..##....                                                   ; 3de2: 30
    !byte %.##.....                                                   ; 3de3: 60

    !byte %.....##.                                                   ; 3de4: 06
    !byte %....##..                                                   ; 3de5: 0c
    !byte %..##....                                                   ; 3de6: 30
    !byte %.##.....                                                   ; 3de7: 60
    !byte %..##....                                                   ; 3de8: 30
    !byte %..##....                                                   ; 3de9: 30
    !byte %...##...                                                   ; 3dea: 18
    !byte %........                                                   ; 3deb: 00

    !byte %........                                                   ; 3dec: 00
    !byte %........                                                   ; 3ded: 00
    !byte %.######.                                                   ; 3dee: 7e
    !byte %........                                                   ; 3def: 00
    !byte %.######.                                                   ; 3df0: 7e
    !byte %........                                                   ; 3df1: 00
    !byte %........                                                   ; 3df2: 00
    !byte %........                                                   ; 3df3: 00

    !byte %...##...                                                   ; 3df4: 18
    !byte %....##..                                                   ; 3df5: 0c
    !byte %....##..                                                   ; 3df6: 0c
    !byte %.....##.                                                   ; 3df7: 06
    !byte %....##..                                                   ; 3df8: 0c
    !byte %..##....                                                   ; 3df9: 30
    !byte %.##.....                                                   ; 3dfa: 60
    !byte %........                                                   ; 3dfb: 00

    !byte %...####.                                                   ; 3dfc: 1e
    !byte %..##..##                                                   ; 3dfd: 33
    !byte %....##..                                                   ; 3dfe: 0c
    !byte %...##...                                                   ; 3dff: 18
    !byte %...##...                                                   ; 3e00: 18
    !byte %........                                                   ; 3e01: 00
    !byte %..##....                                                   ; 3e02: 30
    !byte %........                                                   ; 3e03: 00

    !byte %...####.                                                   ; 3e04: 1e
    !byte %..##..##                                                   ; 3e05: 33
    !byte %.##.###.                                                   ; 3e06: 6e
    !byte %.##.#.#.                                                   ; 3e07: 6a
    !byte %.##.###.                                                   ; 3e08: 6e
    !byte %##......                                                   ; 3e09: c0
    !byte %.####...                                                   ; 3e0a: 78
    !byte %........                                                   ; 3e0b: 00

    !byte %...####.                                                   ; 3e0c: 1e
    !byte %..##..##                                                   ; 3e0d: 33
    !byte %.##..##.                                                   ; 3e0e: 66
    !byte %.######.                                                   ; 3e0f: 7e
    !byte %.##..##.                                                   ; 3e10: 66
    !byte %##..##..                                                   ; 3e11: cc
    !byte %##..##..                                                   ; 3e12: cc
    !byte %........                                                   ; 3e13: 00

    !byte %..#####.                                                   ; 3e14: 3e
    !byte %..##..##                                                   ; 3e15: 33
    !byte %.##..##.                                                   ; 3e16: 66
    !byte %.#####..                                                   ; 3e17: 7c
    !byte %.##..##.                                                   ; 3e18: 66
    !byte %##..##..                                                   ; 3e19: cc
    !byte %#####...                                                   ; 3e1a: f8
    !byte %........                                                   ; 3e1b: 00

    !byte %...####.                                                   ; 3e1c: 1e
    !byte %..##..##                                                   ; 3e1d: 33
    !byte %.##.....                                                   ; 3e1e: 60
    !byte %.##.....                                                   ; 3e1f: 60
    !byte %.##.....                                                   ; 3e20: 60
    !byte %##..##..                                                   ; 3e21: cc
    !byte %.####...                                                   ; 3e22: 78
    !byte %........                                                   ; 3e23: 00

    !byte %..####..                                                   ; 3e24: 3c
    !byte %..##.##.                                                   ; 3e25: 36
    !byte %.##..##.                                                   ; 3e26: 66
    !byte %.##..##.                                                   ; 3e27: 66
    !byte %.##..##.                                                   ; 3e28: 66
    !byte %##.##...                                                   ; 3e29: d8
    !byte %####....                                                   ; 3e2a: f0
    !byte %........                                                   ; 3e2b: 00

    !byte %..######                                                   ; 3e2c: 3f
    !byte %..##....                                                   ; 3e2d: 30
    !byte %.##.....                                                   ; 3e2e: 60
    !byte %.#####..                                                   ; 3e2f: 7c
    !byte %.##.....                                                   ; 3e30: 60
    !byte %##......                                                   ; 3e31: c0
    !byte %######..                                                   ; 3e32: fc
    !byte %........                                                   ; 3e33: 00

    !byte %..######                                                   ; 3e34: 3f
    !byte %..##....                                                   ; 3e35: 30
    !byte %.##.....                                                   ; 3e36: 60
    !byte %.#####..                                                   ; 3e37: 7c
    !byte %.##.....                                                   ; 3e38: 60
    !byte %##......                                                   ; 3e39: c0
    !byte %##......                                                   ; 3e3a: c0
    !byte %........                                                   ; 3e3b: 00

    !byte %...####.                                                   ; 3e3c: 1e
    !byte %..##..##                                                   ; 3e3d: 33
    !byte %.##.....                                                   ; 3e3e: 60
    !byte %.##.###.                                                   ; 3e3f: 6e
    !byte %.##..##.                                                   ; 3e40: 66
    !byte %##..##..                                                   ; 3e41: cc
    !byte %.####...                                                   ; 3e42: 78
    !byte %........                                                   ; 3e43: 00

    !byte %..##..##                                                   ; 3e44: 33
    !byte %..##..##                                                   ; 3e45: 33
    !byte %.##..##.                                                   ; 3e46: 66
    !byte %.######.                                                   ; 3e47: 7e
    !byte %.##..##.                                                   ; 3e48: 66
    !byte %##..##..                                                   ; 3e49: cc
    !byte %##..##..                                                   ; 3e4a: cc
    !byte %........                                                   ; 3e4b: 00

    !byte %..######                                                   ; 3e4c: 3f
    !byte %....##..                                                   ; 3e4d: 0c
    !byte %...##...                                                   ; 3e4e: 18
    !byte %...##...                                                   ; 3e4f: 18
    !byte %...##...                                                   ; 3e50: 18
    !byte %..##....                                                   ; 3e51: 30
    !byte %######..                                                   ; 3e52: fc
    !byte %........                                                   ; 3e53: 00

    !byte %...#####                                                   ; 3e54: 1f
    !byte %.....##.                                                   ; 3e55: 06
    !byte %....##..                                                   ; 3e56: 0c
    !byte %....##..                                                   ; 3e57: 0c
    !byte %....##..                                                   ; 3e58: 0c
    !byte %##.##...                                                   ; 3e59: d8
    !byte %.###....                                                   ; 3e5a: 70
    !byte %........                                                   ; 3e5b: 00

    !byte %..##..##                                                   ; 3e5c: 33
    !byte %..##.##.                                                   ; 3e5d: 36
    !byte %.####...                                                   ; 3e5e: 78
    !byte %.###....                                                   ; 3e5f: 70
    !byte %.####...                                                   ; 3e60: 78
    !byte %##.##...                                                   ; 3e61: d8
    !byte %##..##..                                                   ; 3e62: cc
    !byte %........                                                   ; 3e63: 00

    !byte %..##....                                                   ; 3e64: 30
    !byte %..##....                                                   ; 3e65: 30
    !byte %.##.....                                                   ; 3e66: 60
    !byte %.##.....                                                   ; 3e67: 60
    !byte %.##.....                                                   ; 3e68: 60
    !byte %##......                                                   ; 3e69: c0
    !byte %######..                                                   ; 3e6a: fc
    !byte %........                                                   ; 3e6b: 00

    !byte %..##...#                                                   ; 3e6c: 31
    !byte %..###.##                                                   ; 3e6d: 3b
    !byte %.#######                                                   ; 3e6e: 7f
    !byte %.##.#.##                                                   ; 3e6f: 6b
    !byte %.##.#.##                                                   ; 3e70: 6b
    !byte %##...##.                                                   ; 3e71: c6
    !byte %##...##.                                                   ; 3e72: c6
    !byte %........                                                   ; 3e73: 00

    !byte %..##..##                                                   ; 3e74: 33
    !byte %..##..##                                                   ; 3e75: 33
    !byte %.###.##.                                                   ; 3e76: 76
    !byte %.######.                                                   ; 3e77: 7e
    !byte %.##.###.                                                   ; 3e78: 6e
    !byte %##..##..                                                   ; 3e79: cc
    !byte %##..##..                                                   ; 3e7a: cc
    !byte %........                                                   ; 3e7b: 00

    !byte %...####.                                                   ; 3e7c: 1e
    !byte %..##..##                                                   ; 3e7d: 33
    !byte %.##..##.                                                   ; 3e7e: 66
    !byte %.##..##.                                                   ; 3e7f: 66
    !byte %.##..##.                                                   ; 3e80: 66
    !byte %##..##..                                                   ; 3e81: cc
    !byte %.####...                                                   ; 3e82: 78
    !byte %........                                                   ; 3e83: 00

    !byte %..#####.                                                   ; 3e84: 3e
    !byte %..##..##                                                   ; 3e85: 33
    !byte %.##..##.                                                   ; 3e86: 66
    !byte %.#####..                                                   ; 3e87: 7c
    !byte %.##.....                                                   ; 3e88: 60
    !byte %##......                                                   ; 3e89: c0
    !byte %##......                                                   ; 3e8a: c0
    !byte %........                                                   ; 3e8b: 00

    !byte %...####.                                                   ; 3e8c: 1e
    !byte %..##..##                                                   ; 3e8d: 33
    !byte %.##..##.                                                   ; 3e8e: 66
    !byte %.##..##.                                                   ; 3e8f: 66
    !byte %.##.#.#.                                                   ; 3e90: 6a
    !byte %##.##...                                                   ; 3e91: d8
    !byte %.##.##..                                                   ; 3e92: 6c
    !byte %........                                                   ; 3e93: 00

    !byte %..#####.                                                   ; 3e94: 3e
    !byte %..##..##                                                   ; 3e95: 33
    !byte %.##..##.                                                   ; 3e96: 66
    !byte %.#####..                                                   ; 3e97: 7c
    !byte %.##.##..                                                   ; 3e98: 6c
    !byte %##..##..                                                   ; 3e99: cc
    !byte %##..##..                                                   ; 3e9a: cc
    !byte %........                                                   ; 3e9b: 00

    !byte %...####.                                                   ; 3e9c: 1e
    !byte %..##..##                                                   ; 3e9d: 33
    !byte %.##.....                                                   ; 3e9e: 60
    !byte %..####..                                                   ; 3e9f: 3c
    !byte %.....##.                                                   ; 3ea0: 06
    !byte %##..##..                                                   ; 3ea1: cc
    !byte %.####...                                                   ; 3ea2: 78
    !byte %........                                                   ; 3ea3: 00

    !byte %..######                                                   ; 3ea4: 3f
    !byte %....##..                                                   ; 3ea5: 0c
    !byte %...##...                                                   ; 3ea6: 18
    !byte %...##...                                                   ; 3ea7: 18
    !byte %...##...                                                   ; 3ea8: 18
    !byte %..##....                                                   ; 3ea9: 30
    !byte %..##....                                                   ; 3eaa: 30
    !byte %........                                                   ; 3eab: 00

    !byte %..##..##                                                   ; 3eac: 33
    !byte %..##..##                                                   ; 3ead: 33
    !byte %.##..##.                                                   ; 3eae: 66
    !byte %.##..##.                                                   ; 3eaf: 66
    !byte %.##..##.                                                   ; 3eb0: 66
    !byte %##..##..                                                   ; 3eb1: cc
    !byte %.####...                                                   ; 3eb2: 78
    !byte %........                                                   ; 3eb3: 00

    !byte %..##..##                                                   ; 3eb4: 33
    !byte %..##..##                                                   ; 3eb5: 33
    !byte %.##..##.                                                   ; 3eb6: 66
    !byte %.##..##.                                                   ; 3eb7: 66
    !byte %.##..##.                                                   ; 3eb8: 66
    !byte %.####...                                                   ; 3eb9: 78
    !byte %..##....                                                   ; 3eba: 30
    !byte %........                                                   ; 3ebb: 00

    !byte %..##...#                                                   ; 3ebc: 31
    !byte %..##...#                                                   ; 3ebd: 31
    !byte %.##.#.##                                                   ; 3ebe: 6b
    !byte %.##.#.##                                                   ; 3ebf: 6b
    !byte %.#######                                                   ; 3ec0: 7f
    !byte %###.###.                                                   ; 3ec1: ee
    !byte %##...##.                                                   ; 3ec2: c6
    !byte %........                                                   ; 3ec3: 00

    !byte %..##..##                                                   ; 3ec4: 33
    !byte %..##..##                                                   ; 3ec5: 33
    !byte %..####..                                                   ; 3ec6: 3c
    !byte %...##...                                                   ; 3ec7: 18
    !byte %..####..                                                   ; 3ec8: 3c
    !byte %##..##..                                                   ; 3ec9: cc
    !byte %##..##..                                                   ; 3eca: cc
    !byte %........                                                   ; 3ecb: 00

    !byte %..##..##                                                   ; 3ecc: 33
    !byte %..##..##                                                   ; 3ecd: 33
    !byte %.##..##.                                                   ; 3ece: 66
    !byte %..####..                                                   ; 3ecf: 3c
    !byte %...##...                                                   ; 3ed0: 18
    !byte %..##....                                                   ; 3ed1: 30
    !byte %..##....                                                   ; 3ed2: 30
    !byte %........                                                   ; 3ed3: 00

    !byte %..######                                                   ; 3ed4: 3f
    !byte %......##                                                   ; 3ed5: 03
    !byte %....##..                                                   ; 3ed6: 0c
    !byte %...##...                                                   ; 3ed7: 18
    !byte %..##....                                                   ; 3ed8: 30
    !byte %##......                                                   ; 3ed9: c0
    !byte %######..                                                   ; 3eda: fc
    !byte %........                                                   ; 3edb: 00

    !byte %..#####.                                                   ; 3edc: 3e
    !byte %..##....                                                   ; 3edd: 30
    !byte %.##.....                                                   ; 3ede: 60
    !byte %.##.....                                                   ; 3edf: 60
    !byte %.##.....                                                   ; 3ee0: 60
    !byte %##......                                                   ; 3ee1: c0
    !byte %#####...                                                   ; 3ee2: f8
    !byte %........                                                   ; 3ee3: 00

    !byte %........                                                   ; 3ee4: 00
    !byte %..##....                                                   ; 3ee5: 30
    !byte %..##....                                                   ; 3ee6: 30
    !byte %...##...                                                   ; 3ee7: 18
    !byte %....##..                                                   ; 3ee8: 0c
    !byte %....##..                                                   ; 3ee9: 0c
    !byte %........                                                   ; 3eea: 00
    !byte %........                                                   ; 3eeb: 00

    !byte %...#####                                                   ; 3eec: 1f
    !byte %......##                                                   ; 3eed: 03
    !byte %.....##.                                                   ; 3eee: 06
    !byte %.....##.                                                   ; 3eef: 06
    !byte %.....##.                                                   ; 3ef0: 06
    !byte %....##..                                                   ; 3ef1: 0c
    !byte %.#####..                                                   ; 3ef2: 7c
    !byte %........                                                   ; 3ef3: 00

    !byte %....##..                                                   ; 3ef4: 0c
    !byte %...####.                                                   ; 3ef5: 1e
    !byte %.##..##.                                                   ; 3ef6: 66
    !byte %.#....#.                                                   ; 3ef7: 42
    !byte %........                                                   ; 3ef8: 00
    !byte %........                                                   ; 3ef9: 00
    !byte %........                                                   ; 3efa: 00
    !byte %........                                                   ; 3efb: 00

    !byte %........                                                   ; 3efc: 00
    !byte %........                                                   ; 3efd: 00
    !byte %........                                                   ; 3efe: 00
    !byte %........                                                   ; 3eff: 00
    !byte %........                                                   ; 3f00: 00
    !byte %........                                                   ; 3f01: 00
    !byte %........                                                   ; 3f02: 00
    !byte %#######.                                                   ; 3f03: fe

    !byte %....###.                                                   ; 3f04: 0e
    !byte %...##.##                                                   ; 3f05: 1b
    !byte %..##....                                                   ; 3f06: 30
    !byte %.#####..                                                   ; 3f07: 7c
    !byte %..##....                                                   ; 3f08: 30
    !byte %.##.....                                                   ; 3f09: 60
    !byte %######..                                                   ; 3f0a: fc
    !byte %........                                                   ; 3f0b: 00

    !byte %........                                                   ; 3f0c: 00
    !byte %........                                                   ; 3f0d: 00
    !byte %..####..                                                   ; 3f0e: 3c
    !byte %.....##.                                                   ; 3f0f: 06
    !byte %..#####.                                                   ; 3f10: 3e
    !byte %##..##..                                                   ; 3f11: cc
    !byte %.#####..                                                   ; 3f12: 7c
    !byte %........                                                   ; 3f13: 00

    !byte %..##....                                                   ; 3f14: 30
    !byte %..##....                                                   ; 3f15: 30
    !byte %.#####..                                                   ; 3f16: 7c
    !byte %.##..##.                                                   ; 3f17: 66
    !byte %.##..##.                                                   ; 3f18: 66
    !byte %##..##..                                                   ; 3f19: cc
    !byte %#####...                                                   ; 3f1a: f8
    !byte %........                                                   ; 3f1b: 00

    !byte %........                                                   ; 3f1c: 00
    !byte %........                                                   ; 3f1d: 00
    !byte %..####..                                                   ; 3f1e: 3c
    !byte %.##..##.                                                   ; 3f1f: 66
    !byte %.##.....                                                   ; 3f20: 60
    !byte %##..##..                                                   ; 3f21: cc
    !byte %.####...                                                   ; 3f22: 78
    !byte %........                                                   ; 3f23: 00

    !byte %......##                                                   ; 3f24: 03
    !byte %......##                                                   ; 3f25: 03
    !byte %..#####.                                                   ; 3f26: 3e
    !byte %.##..##.                                                   ; 3f27: 66
    !byte %.##..##.                                                   ; 3f28: 66
    !byte %##..##..                                                   ; 3f29: cc
    !byte %.#####..                                                   ; 3f2a: 7c
    !byte %........                                                   ; 3f2b: 00

    !byte %........                                                   ; 3f2c: 00
    !byte %........                                                   ; 3f2d: 00
    !byte %..####..                                                   ; 3f2e: 3c
    !byte %.##..##.                                                   ; 3f2f: 66
    !byte %.######.                                                   ; 3f30: 7e
    !byte %##......                                                   ; 3f31: c0
    !byte %.####...                                                   ; 3f32: 78
    !byte %........                                                   ; 3f33: 00

    !byte %....###.                                                   ; 3f34: 0e
    !byte %...##...                                                   ; 3f35: 18
    !byte %..##....                                                   ; 3f36: 30
    !byte %.#####..                                                   ; 3f37: 7c
    !byte %..##....                                                   ; 3f38: 30
    !byte %.##.....                                                   ; 3f39: 60
    !byte %.##.....                                                   ; 3f3a: 60
    !byte %........                                                   ; 3f3b: 00

    !byte %........                                                   ; 3f3c: 00
    !byte %........                                                   ; 3f3d: 00
    !byte %..#####.                                                   ; 3f3e: 3e
    !byte %.##..##.                                                   ; 3f3f: 66
    !byte %.##..##.                                                   ; 3f40: 66
    !byte %.#####..                                                   ; 3f41: 7c
    !byte %....##..                                                   ; 3f42: 0c
    !byte %.####...                                                   ; 3f43: 78

    !byte %..##....                                                   ; 3f44: 30
    !byte %..##....                                                   ; 3f45: 30
    !byte %.#####..                                                   ; 3f46: 7c
    !byte %.##..##.                                                   ; 3f47: 66
    !byte %.##..##.                                                   ; 3f48: 66
    !byte %##..##..                                                   ; 3f49: cc
    !byte %##..##..                                                   ; 3f4a: cc
    !byte %........                                                   ; 3f4b: 00

    !byte %....##..                                                   ; 3f4c: 0c
    !byte %........                                                   ; 3f4d: 00
    !byte %..###...                                                   ; 3f4e: 38
    !byte %...##...                                                   ; 3f4f: 18
    !byte %...##...                                                   ; 3f50: 18
    !byte %..##....                                                   ; 3f51: 30
    !byte %.####...                                                   ; 3f52: 78
    !byte %........                                                   ; 3f53: 00

    !byte %....##..                                                   ; 3f54: 0c
    !byte %........                                                   ; 3f55: 00
    !byte %..###...                                                   ; 3f56: 38
    !byte %...##...                                                   ; 3f57: 18
    !byte %...##...                                                   ; 3f58: 18
    !byte %..##....                                                   ; 3f59: 30
    !byte %..##....                                                   ; 3f5a: 30
    !byte %###.....                                                   ; 3f5b: e0

    !byte %..##....                                                   ; 3f5c: 30
    !byte %..##....                                                   ; 3f5d: 30
    !byte %.##..##.                                                   ; 3f5e: 66
    !byte %.##.##..                                                   ; 3f5f: 6c
    !byte %.####...                                                   ; 3f60: 78
    !byte %##.##...                                                   ; 3f61: d8
    !byte %##..##..                                                   ; 3f62: cc
    !byte %........                                                   ; 3f63: 00

    !byte %...###..                                                   ; 3f64: 1c
    !byte %....##..                                                   ; 3f65: 0c
    !byte %...##...                                                   ; 3f66: 18
    !byte %...##...                                                   ; 3f67: 18
    !byte %...##...                                                   ; 3f68: 18
    !byte %..##....                                                   ; 3f69: 30
    !byte %.####...                                                   ; 3f6a: 78
    !byte %........                                                   ; 3f6b: 00

    !byte %........                                                   ; 3f6c: 00
    !byte %........                                                   ; 3f6d: 00
    !byte %..##.##.                                                   ; 3f6e: 36
    !byte %.#######                                                   ; 3f6f: 7f
    !byte %.##.#.##                                                   ; 3f70: 6b
    !byte %##.#.##.                                                   ; 3f71: d6
    !byte %##...##.                                                   ; 3f72: c6
    !byte %........                                                   ; 3f73: 00

    !byte %........                                                   ; 3f74: 00
    !byte %........                                                   ; 3f75: 00
    !byte %.#####..                                                   ; 3f76: 7c
    !byte %.##..##.                                                   ; 3f77: 66
    !byte %.##..##.                                                   ; 3f78: 66
    !byte %##..##..                                                   ; 3f79: cc
    !byte %##..##..                                                   ; 3f7a: cc
    !byte %........                                                   ; 3f7b: 00

    !byte %........                                                   ; 3f7c: 00
    !byte %........                                                   ; 3f7d: 00
    !byte %..####..                                                   ; 3f7e: 3c
    !byte %.##..##.                                                   ; 3f7f: 66
    !byte %.##..##.                                                   ; 3f80: 66
    !byte %##..##..                                                   ; 3f81: cc
    !byte %.####...                                                   ; 3f82: 78
    !byte %........                                                   ; 3f83: 00

    !byte %........                                                   ; 3f84: 00
    !byte %........                                                   ; 3f85: 00
    !byte %.#####..                                                   ; 3f86: 7c
    !byte %.##..##.                                                   ; 3f87: 66
    !byte %.##..##.                                                   ; 3f88: 66
    !byte %#####...                                                   ; 3f89: f8
    !byte %##......                                                   ; 3f8a: c0
    !byte %##......                                                   ; 3f8b: c0

    !byte %........                                                   ; 3f8c: 00
    !byte %........                                                   ; 3f8d: 00
    !byte %..#####.                                                   ; 3f8e: 3e
    !byte %.##..##.                                                   ; 3f8f: 66
    !byte %.##..##.                                                   ; 3f90: 66
    !byte %.#####..                                                   ; 3f91: 7c
    !byte %....##..                                                   ; 3f92: 0c
    !byte %....###.                                                   ; 3f93: 0e

    !byte %........                                                   ; 3f94: 00
    !byte %........                                                   ; 3f95: 00
    !byte %.##.##..                                                   ; 3f96: 6c
    !byte %.###.##.                                                   ; 3f97: 76
    !byte %.##.....                                                   ; 3f98: 60
    !byte %##......                                                   ; 3f99: c0
    !byte %##......                                                   ; 3f9a: c0
    !byte %........                                                   ; 3f9b: 00

    !byte %........                                                   ; 3f9c: 00
    !byte %........                                                   ; 3f9d: 00
    !byte %..#####.                                                   ; 3f9e: 3e
    !byte %.##.....                                                   ; 3f9f: 60
    !byte %..####..                                                   ; 3fa0: 3c
    !byte %....##..                                                   ; 3fa1: 0c
    !byte %#####...                                                   ; 3fa2: f8
    !byte %........                                                   ; 3fa3: 00

    !byte %...##...                                                   ; 3fa4: 18
    !byte %...##...                                                   ; 3fa5: 18
    !byte %.#####..                                                   ; 3fa6: 7c
    !byte %..##....                                                   ; 3fa7: 30
    !byte %..##....                                                   ; 3fa8: 30
    !byte %.##.....                                                   ; 3fa9: 60
    !byte %..###...                                                   ; 3faa: 38
    !byte %........                                                   ; 3fab: 00

    !byte %........                                                   ; 3fac: 00
    !byte %........                                                   ; 3fad: 00
    !byte %.##..##.                                                   ; 3fae: 66
    !byte %.##..##.                                                   ; 3faf: 66
    !byte %.##..##.                                                   ; 3fb0: 66
    !byte %##..##..                                                   ; 3fb1: cc
    !byte %.#####..                                                   ; 3fb2: 7c
    !byte %........                                                   ; 3fb3: 00

    !byte %........                                                   ; 3fb4: 00
    !byte %........                                                   ; 3fb5: 00
    !byte %.##..##.                                                   ; 3fb6: 66
    !byte %.##..##.                                                   ; 3fb7: 66
    !byte %.##..##.                                                   ; 3fb8: 66
    !byte %.####...                                                   ; 3fb9: 78
    !byte %..##....                                                   ; 3fba: 30
    !byte %........                                                   ; 3fbb: 00

    !byte %........                                                   ; 3fbc: 00
    !byte %........                                                   ; 3fbd: 00
    !byte %.##...##                                                   ; 3fbe: 63
    !byte %.##.#.##                                                   ; 3fbf: 6b
    !byte %.##.#.##                                                   ; 3fc0: 6b
    !byte %#######.                                                   ; 3fc1: fe
    !byte %.##.##..                                                   ; 3fc2: 6c
    !byte %........                                                   ; 3fc3: 00

    !byte %........                                                   ; 3fc4: 00
    !byte %........                                                   ; 3fc5: 00
    !byte %.##..##.                                                   ; 3fc6: 66
    !byte %..####..                                                   ; 3fc7: 3c
    !byte %...##...                                                   ; 3fc8: 18
    !byte %.####...                                                   ; 3fc9: 78
    !byte %##..##..                                                   ; 3fca: cc
    !byte %........                                                   ; 3fcb: 00

    !byte %........                                                   ; 3fcc: 00
    !byte %........                                                   ; 3fcd: 00
    !byte %.##..##.                                                   ; 3fce: 66
    !byte %.##..##.                                                   ; 3fcf: 66
    !byte %.##..##.                                                   ; 3fd0: 66
    !byte %.#####..                                                   ; 3fd1: 7c
    !byte %....##..                                                   ; 3fd2: 0c
    !byte %.####...                                                   ; 3fd3: 78

    !byte %........                                                   ; 3fd4: 00
    !byte %........                                                   ; 3fd5: 00
    !byte %.######.                                                   ; 3fd6: 7e
    !byte %....##..                                                   ; 3fd7: 0c
    !byte %...##...                                                   ; 3fd8: 18
    !byte %.##.....                                                   ; 3fd9: 60
    !byte %######..                                                   ; 3fda: fc
    !byte %........                                                   ; 3fdb: 00

    !byte %.....##.                                                   ; 3fdc: 06
    !byte %....##..                                                   ; 3fdd: 0c
    !byte %...##...                                                   ; 3fde: 18
    !byte %.###....                                                   ; 3fdf: 70
    !byte %...##...                                                   ; 3fe0: 18
    !byte %..##....                                                   ; 3fe1: 30
    !byte %...##...                                                   ; 3fe2: 18
    !byte %........                                                   ; 3fe3: 00

    !byte %....##..                                                   ; 3fe4: 0c
    !byte %....##..                                                   ; 3fe5: 0c
    !byte %...##...                                                   ; 3fe6: 18
    !byte %........                                                   ; 3fe7: 00
    !byte %...##...                                                   ; 3fe8: 18
    !byte %..##....                                                   ; 3fe9: 30
    !byte %..##....                                                   ; 3fea: 30
    !byte %........                                                   ; 3feb: 00

    !byte %...##...                                                   ; 3fec: 18
    !byte %....##..                                                   ; 3fed: 0c
    !byte %...##...                                                   ; 3fee: 18
    !byte %....###.                                                   ; 3fef: 0e
    !byte %...##...                                                   ; 3ff0: 18
    !byte %..##....                                                   ; 3ff1: 30
    !byte %.##.....                                                   ; 3ff2: 60
    !byte %........                                                   ; 3ff3: 00

    !byte %...##...                                                   ; 3ff4: 18
    !byte %..##.#.#                                                   ; 3ff5: 35
    !byte %.#...##.                                                   ; 3ff6: 46
    !byte %........                                                   ; 3ff7: 00
    !byte %........                                                   ; 3ff8: 00
    !byte %........                                                   ; 3ff9: 00
    !byte %........                                                   ; 3ffa: 00
    !byte %........                                                   ; 3ffb: 00
; Encrypted scrolling message:
; 
; '    At that moment there [0d]
; came a deafening crack [0d]
; and the mountain split [0d]
; and crumbled.  And as the[0d]
; townspeople came running [0d]
; from their homes, they [0d]
; saw a dishevelled figure [0d]
; emerge from the rubble of[0d]
; the cavern.  [0d]
; [0d]
;     Although generations [0d]
; had elapsed since the [0d]
; imprisonment of Imogen, [0d]
; his tale had passed into [0d]
; legend, and the people [0d]
; knew at once that it was [0d]
; truly he who had returned[0d]
; to their midst.  [0d]
; [0d]
;     All trace of the [0d]
; insanity had gone, and [0d]
; while the citizens of [0d]
; Egmain cheered and sang, [0d]
; the spell of freedom, its[0d]
; purpose fulfilled, soared[0d]
; into the night sky and [0d]
; became a comet to [0d]
; celebrate for the rest of[0d]
; time the recovery of the [0d]
; wizard whom men call [0d]
; Imogen.  [00]'
; 
; EOR-encrypted with $cb
encoded_message
    !byte $eb, $eb, $eb, $eb, $8a, $bf, $eb, $bf, $a3, $aa, $bf, $eb  ; 3ffc: eb eb eb...
    !byte $a6, $a4, $a6, $ae, $a5, $bf, $eb, $bf, $a3, $ae, $b9, $ae  ; 4008: a6 a4 a6...
    !byte $eb, $c6, $a8, $aa, $a6, $ae, $eb, $aa, $eb, $af, $ae, $aa  ; 4014: eb c6 a8...
    !byte $ad, $ae, $a5, $a2, $a5, $ac, $eb, $a8, $b9, $aa, $a8, $a0  ; 4020: ad ae a5...
    !byte $eb, $c6, $aa, $a5, $af, $eb, $bf, $a3, $ae, $eb, $a6, $a4  ; 402c: eb c6 aa...
    !byte $be, $a5, $bf, $aa, $a2, $a5, $eb, $b8, $bb, $a7, $a2, $bf  ; 4038: be a5 bf...
    !byte $eb, $c6, $aa, $a5, $af, $eb, $a8, $b9, $be, $a6, $a9, $a7  ; 4044: eb c6 aa...
    !byte $ae, $af, $e5, $eb, $eb, $8a, $a5, $af, $eb, $aa, $b8, $eb  ; 4050: ae af e5...
    !byte $bf, $a3, $ae, $c6, $bf, $a4, $bc, $a5, $b8, $bb, $ae, $a4  ; 405c: bf a3 ae...
    !byte $bb, $a7, $ae, $eb, $a8, $aa, $a6, $ae, $eb, $b9, $be, $a5  ; 4068: bb a7 ae...
    !byte $a5, $a2, $a5, $ac, $eb, $c6, $ad, $b9, $a4, $a6, $eb, $bf  ; 4074: a5 a2 a5...
    !byte $a3, $ae, $a2, $b9, $eb, $a3, $a4, $a6, $ae, $b8, $e7, $eb  ; 4080: a3 ae a2...
    !byte $bf, $a3, $ae, $b2, $eb, $c6, $b8, $aa, $bc, $eb, $aa, $eb  ; 408c: bf a3 ae...
    !byte $af, $a2, $b8, $a3, $ae, $bd, $ae, $a7, $a7, $ae, $af, $eb  ; 4098: af a2 b8...
    !byte $ad, $a2, $ac, $be, $b9, $ae, $eb, $c6, $ae, $a6, $ae, $b9  ; 40a4: ad a2 ac...
    !byte $ac, $ae, $eb, $ad, $b9, $a4, $a6, $eb, $bf, $a3, $ae, $eb  ; 40b0: ac ae eb...
    !byte $b9, $be, $a9, $a9, $a7, $ae, $eb, $a4, $ad, $c6, $bf, $a3  ; 40bc: b9 be a9...
    !byte $ae, $eb, $a8, $aa, $bd, $ae, $b9, $a5, $e5, $eb, $eb, $c6  ; 40c8: ae eb a8...
    !byte $c6, $eb, $eb, $eb, $eb, $8a, $a7, $bf, $a3, $a4, $be, $ac  ; 40d4: c6 eb eb...
    !byte $a3, $eb, $ac, $ae, $a5, $ae, $b9, $aa, $bf, $a2, $a4, $a5  ; 40e0: a3 eb ac...
    !byte $b8, $eb, $c6, $a3, $aa, $af, $eb, $ae, $a7, $aa, $bb, $b8  ; 40ec: b8 eb c6...
    !byte $ae, $af, $eb, $b8, $a2, $a5, $a8, $ae, $eb, $bf, $a3, $ae  ; 40f8: ae af eb...
    !byte $eb, $c6, $a2, $a6, $bb, $b9, $a2, $b8, $a4, $a5, $a6, $ae  ; 4104: eb c6 a2...
    !byte $a5, $bf, $eb, $a4, $ad, $eb, $82, $a6, $a4, $ac, $ae, $a5  ; 4110: a5 bf eb...
    !byte $e7, $eb, $c6, $a3, $a2, $b8, $eb, $bf, $aa, $a7, $ae, $eb  ; 411c: e7 eb c6...
    !byte $a3, $aa, $af, $eb, $bb, $aa, $b8, $b8, $ae, $af, $eb, $a2  ; 4128: a3 aa af...
    !byte $a5, $bf, $a4, $eb, $c6, $a7, $ae, $ac, $ae, $a5, $af, $e7  ; 4134: a5 bf a4...
    !byte $eb, $aa, $a5, $af, $eb, $bf, $a3, $ae, $eb, $bb, $ae, $a4  ; 4140: eb aa a5...
    !byte $bb, $a7, $ae, $eb, $c6, $a0, $a5, $ae, $bc, $eb, $aa, $bf  ; 414c: bb a7 ae...
    !byte $eb, $a4, $a5, $a8, $ae, $eb, $bf, $a3, $aa, $bf, $eb, $a2  ; 4158: eb a4 a5...
    !byte $bf, $eb, $bc, $aa, $b8, $eb, $c6, $bf, $b9, $be, $a7, $b2  ; 4164: bf eb bc...
    !byte $eb, $a3, $ae, $eb, $bc, $a3, $a4, $eb, $a3, $aa, $af, $eb  ; 4170: eb a3 ae...
    !byte $b9, $ae, $bf, $be, $b9, $a5, $ae, $af, $c6, $bf, $a4, $eb  ; 417c: b9 ae bf...
    !byte $bf, $a3, $ae, $a2, $b9, $eb, $a6, $a2, $af, $b8, $bf, $e5  ; 4188: bf a3 ae...
    !byte $eb, $eb, $c6, $c6, $eb, $eb, $eb, $eb, $8a, $a7, $a7, $eb  ; 4194: eb eb c6...
    !byte $bf, $b9, $aa, $a8, $ae, $eb, $a4, $ad, $eb, $bf, $a3, $ae  ; 41a0: bf b9 aa...
    !byte $eb, $c6, $a2, $a5, $b8, $aa, $a5, $a2, $bf, $b2, $eb, $a3  ; 41ac: eb c6 a2...
    !byte $aa, $af, $eb, $ac, $a4, $a5, $ae, $e7, $eb, $aa, $a5, $af  ; 41b8: aa af eb...
    !byte $eb, $c6, $bc, $a3, $a2, $a7, $ae, $eb, $bf, $a3, $ae, $eb  ; 41c4: eb c6 bc...
    !byte $a8, $a2, $bf, $a2, $b1, $ae, $a5, $b8, $eb, $a4, $ad, $eb  ; 41d0: a8 a2 bf...
    !byte $c6, $8e, $ac, $a6, $aa, $a2, $a5, $eb, $a8, $a3, $ae, $ae  ; 41dc: c6 8e ac...
    !byte $b9, $ae, $af, $eb, $aa, $a5, $af, $eb, $b8, $aa, $a5, $ac  ; 41e8: b9 ae af...
    !byte $e7, $eb, $c6, $bf, $a3, $ae, $eb, $b8, $bb, $ae, $a7, $a7  ; 41f4: e7 eb c6...
    !byte $eb, $a4, $ad, $eb, $ad, $b9, $ae, $ae, $af, $a4, $a6, $e7  ; 4200: eb a4 ad...
    !byte $eb, $a2, $bf, $b8, $c6, $bb, $be, $b9, $bb, $a4, $b8, $ae  ; 420c: eb a2 bf...
    !byte $eb, $ad, $be, $a7, $ad, $a2, $a7, $a7, $ae, $af, $e7, $eb  ; 4218: eb ad be...
    !byte $b8, $a4, $aa, $b9, $ae, $af, $c6, $a2, $a5, $bf, $a4, $eb  ; 4224: b8 a4 aa...
    !byte $bf, $a3, $ae, $eb, $a5, $a2, $ac, $a3, $bf, $eb, $b8, $a0  ; 4230: bf a3 ae...
    !byte $b2, $eb, $aa, $a5, $af, $eb, $c6, $a9, $ae, $a8, $aa, $a6  ; 423c: b2 eb aa...
    !byte $ae, $eb, $aa, $eb, $a8, $a4, $a6, $ae, $bf, $eb, $bf, $a4  ; 4248: ae eb aa...
    !byte $eb, $c6, $a8, $ae, $a7, $ae, $a9, $b9, $aa, $bf, $ae, $eb  ; 4254: eb c6 a8...
    !byte $ad, $a4, $b9, $eb, $bf, $a3, $ae, $eb, $b9, $ae, $b8, $bf  ; 4260: ad a4 b9...
    !byte $eb, $a4, $ad, $c6, $bf, $a2, $a6, $ae, $eb, $bf, $a3, $ae  ; 426c: eb a4 ad...
    !byte $eb, $b9, $ae, $a8, $a4, $bd, $ae, $b9, $b2, $eb, $a4, $ad  ; 4278: eb b9 ae...
    !byte $eb, $bf, $a3, $ae, $eb, $c6, $bc, $a2, $b1, $aa, $b9, $af  ; 4284: eb bf a3...
    !byte $eb, $bc, $a3, $a4, $a6, $eb, $a6, $ae, $a5, $eb, $a8, $aa  ; 4290: eb bc a3...
    !byte $a7, $a7, $eb, $c6, $82, $a6, $a4, $ac, $ae, $a5, $e5, $eb  ; 429c: a7 a7 eb...
    !byte $eb, $cb                                                    ; 42a8: eb cb

the_end_loop
    jmp the_end_loop                                                  ; 42aa: 4c aa 42

; this code waits for a keypress then starts a new game, but it is never called.
; Instead there is a deliberate infinite loop above, forcing the user to reset the
; machine.
unused2
    lda #200                                                          ; 42ad: a9 c8
    jsr wait_for_a_vsyncs                                             ; 42af: 20 25 43
    lda #osbyte_flush_buffer_class                                    ; 42b2: a9 0f
    ldx #1                                                            ; 42b4: a2 01
    jsr osbyte                                                        ; 42b6: 20 f4 ff                ; Flush input buffers (X non-zero)
wait_for_keypress_loop
    jsr check_for_escape_pressed_in_developer_mode                    ; 42b9: 20 e3 3c
    jsr inkey_0                                                       ; 42bc: 20 7c 38
    beq wait_for_keypress_loop                                        ; 42bf: f0 f8
    lda #$ff                                                          ; 42c1: a9 ff
    sta current_menu_index                                            ; 42c3: 85 2e
    lda #0                                                            ; 42c5: a9 00
    ldx #$10                                                          ; 42c7: a2 10
clear_menu_slots_loop
    sta displayed_menu_slots,x                                        ; 42c9: 9d 6f 29
    dex                                                               ; 42cc: ca
    bpl clear_menu_slots_loop                                         ; 42cd: 10 fa
    lda l0ab1                                                         ; 42cf: ad b1 0a                ; redundant instruction
    lda l0ab2                                                         ; 42d2: ad b2 0a                ; redundant instruction
    lda sprdata_ptr                                                   ; 42d5: a5 54
    pha                                                               ; 42d7: 48
    sta icodata_load_address_low                                      ; 42d8: 8d 23 43
    lda sprdata_ptr + 1                                               ; 42db: a5 55
    pha                                                               ; 42dd: 48
    sec                                                               ; 42de: 38
    sbc #2                                                            ; 42df: e9 02
    sta icodata_load_address_high                                     ; 42e1: 8d 24 43
    sta sprdata_ptr + 1                                               ; 42e4: 85 55
load_icodata_loop
    lda #<icodata_filename                                            ; 42e6: a9 1b
    sta filename_address_low                                          ; 42e8: 85 70
    lda #>icodata_filename                                            ; 42ea: a9 43
    sta filename_address_high                                         ; 42ec: 85 71
    ldx icodata_load_address_low                                      ; 42ee: ae 23 43
    ldy icodata_load_address_high                                     ; 42f1: ac 24 43
    lda #$ff                                                          ; 42f4: a9 ff
    jsr osfile_wrapper                                                ; 42f6: 20 dc 16
    beq reset_menus_and_start_new_game                                ; 42f9: f0 06
    jsr prompt_user_to_insert_correct_disc                            ; 42fb: 20 17 36
    jmp load_icodata_loop                                             ; 42fe: 4c e6 42

reset_menus_and_start_new_game
    lda #0                                                            ; 4301: a9 00
    sta toolbar_colour                                                ; 4303: 8d 5e 17
    sta gameplay_area_colour                                          ; 4306: 8d 60 17
    jsr wait_for_vsync                                                ; 4309: 20 8c 17
    jsr reset_menu_items                                              ; 430c: 20 80 29
    jsr draw_menu_icons                                               ; 430f: 20 a8 29
    pla                                                               ; 4312: 68
    sta sprdata_ptr + 1                                               ; 4313: 85 55
    pla                                                               ; 4315: 68
    sta sprdata_ptr                                                   ; 4316: 85 54
    jmp start_game                                                    ; 4318: 4c 0c 11

icodata_filename
    !text "icodata"                                                   ; 431b: 69 63 6f...
    !byte $0d                                                         ; 4322: 0d
icodata_load_address_low
    !byte 0                                                           ; 4323: 00
icodata_load_address_high
    !byte 0                                                           ; 4324: 00

wait_for_a_vsyncs
    ldx #0                                                            ; 4325: a2 00
    stx vsync_counter                                                 ; 4327: 8e 8b 17
wait_loop
    cmp vsync_counter                                                 ; 432a: cd 8b 17
    bcs wait_loop                                                     ; 432d: b0 fb
    rts                                                               ; 432f: 60

the_end_bitmap
    !byte %........                                                   ; 4330: 00
    !byte %........                                                   ; 4331: 00
    !byte %........                                                   ; 4332: 00
    !byte %........                                                   ; 4333: 00
    !byte %........                                                   ; 4334: 00
    !byte %........                                                   ; 4335: 00
    !byte %........                                                   ; 4336: 00
    !byte %........                                                   ; 4337: 00
    !byte %........                                                   ; 4338: 00
    !byte %........                                                   ; 4339: 00
    !byte %........                                                   ; 433a: 00
    !byte %........                                                   ; 433b: 00
    !byte %........                                                   ; 433c: 00
    !byte %........                                                   ; 433d: 00
    !byte %........                                                   ; 433e: 00
    !byte %........                                                   ; 433f: 00
    !byte %........                                                   ; 4340: 00
    !byte %........                                                   ; 4341: 00
    !byte %........                                                   ; 4342: 00
    !byte %........                                                   ; 4343: 00
    !byte %........                                                   ; 4344: 00
    !byte %........                                                   ; 4345: 00
    !byte %........                                                   ; 4346: 00
    !byte %........                                                   ; 4347: 00
    !byte %........                                                   ; 4348: 00
    !byte %........                                                   ; 4349: 00
    !byte %........                                                   ; 434a: 00
    !byte %........                                                   ; 434b: 00
    !byte %........                                                   ; 434c: 00
    !byte %........                                                   ; 434d: 00
    !byte %........                                                   ; 434e: 00
    !byte %........                                                   ; 434f: 00
    !byte %........                                                   ; 4350: 00
    !byte %........                                                   ; 4351: 00
    !byte %........                                                   ; 4352: 00
    !byte %........                                                   ; 4353: 00
    !byte %........                                                   ; 4354: 00
    !byte %........                                                   ; 4355: 00
    !byte %........                                                   ; 4356: 00
    !byte %........                                                   ; 4357: 00
    !byte %........                                                   ; 4358: 00
    !byte %........                                                   ; 4359: 00
    !byte %........                                                   ; 435a: 00
    !byte %........                                                   ; 435b: 00
    !byte %........                                                   ; 435c: 00
    !byte %........                                                   ; 435d: 00
    !byte %........                                                   ; 435e: 00
    !byte %........                                                   ; 435f: 00
    !byte %........                                                   ; 4360: 00
    !byte %........                                                   ; 4361: 00
    !byte %........                                                   ; 4362: 00
    !byte %........                                                   ; 4363: 00
    !byte %........                                                   ; 4364: 00
    !byte %........                                                   ; 4365: 00
    !byte %........                                                   ; 4366: 00
    !byte %........                                                   ; 4367: 00
    !byte %........                                                   ; 4368: 00
    !byte %........                                                   ; 4369: 00
    !byte %........                                                   ; 436a: 00
    !byte %........                                                   ; 436b: 00
    !byte %........                                                   ; 436c: 00
    !byte %........                                                   ; 436d: 00
    !byte %........                                                   ; 436e: 00
    !byte %........                                                   ; 436f: 00
    !byte %........                                                   ; 4370: 00
    !byte %........                                                   ; 4371: 00
    !byte %........                                                   ; 4372: 00
    !byte %........                                                   ; 4373: 00
    !byte %........                                                   ; 4374: 00
    !byte %........                                                   ; 4375: 00
    !byte %........                                                   ; 4376: 00
    !byte %........                                                   ; 4377: 00
    !byte %.......#                                                   ; 4378: 01
    !byte %.......#                                                   ; 4379: 01
    !byte %......##                                                   ; 437a: 03
    !byte %......##                                                   ; 437b: 03
    !byte %......##                                                   ; 437c: 03
    !byte %.....###                                                   ; 437d: 07
    !byte %.....##.                                                   ; 437e: 06
    !byte %.....##.                                                   ; 437f: 06
    !byte %########                                                   ; 4380: ff
    !byte %########                                                   ; 4381: ff
    !byte %###..###                                                   ; 4382: e7
    !byte %##...###                                                   ; 4383: c7
    !byte %.....###                                                   ; 4384: 07
    !byte %.....###                                                   ; 4385: 07
    !byte %....####                                                   ; 4386: 0f
    !byte %....####                                                   ; 4387: 0f
    !byte %########                                                   ; 4388: ff
    !byte %########                                                   ; 4389: ff
    !byte %##...###                                                   ; 438a: c7
    !byte %#.....##                                                   ; 438b: 83
    !byte %#.....##                                                   ; 438c: 83
    !byte %#.....##                                                   ; 438d: 83
    !byte %#.....##                                                   ; 438e: 83
    !byte %......##                                                   ; 438f: 03
    !byte %#......#                                                   ; 4390: 81
    !byte %#......#                                                   ; 4391: 81
    !byte %#.......                                                   ; 4392: 80
    !byte %#.......                                                   ; 4393: 80
    !byte %........                                                   ; 4394: 00
    !byte %........                                                   ; 4395: 00
    !byte %........                                                   ; 4396: 00
    !byte %........                                                   ; 4397: 00
    !byte %########                                                   ; 4398: ff
    !byte %########                                                   ; 4399: ff
    !byte %.#####..                                                   ; 439a: 7c
    !byte %.####...                                                   ; 439b: 78
    !byte %.####...                                                   ; 439c: 78
    !byte %.####...                                                   ; 439d: 78
    !byte %#####...                                                   ; 439e: f8
    !byte %####....                                                   ; 439f: f0
    !byte %#..#####                                                   ; 43a0: 9f
    !byte %#..#####                                                   ; 43a1: 9f
    !byte %.....###                                                   ; 43a2: 07
    !byte %.....###                                                   ; 43a3: 07
    !byte %.....###                                                   ; 43a4: 07
    !byte %.....###                                                   ; 43a5: 07
    !byte %....####                                                   ; 43a6: 0f
    !byte %....####                                                   ; 43a7: 0f
    !byte %#####...                                                   ; 43a8: f8
    !byte %#####...                                                   ; 43a9: f8
    !byte %##......                                                   ; 43aa: c0
    !byte %#.......                                                   ; 43ab: 80
    !byte %#.......                                                   ; 43ac: 80
    !byte %#.......                                                   ; 43ad: 80
    !byte %#.......                                                   ; 43ae: 80
    !byte %........                                                   ; 43af: 00
    !byte %...#####                                                   ; 43b0: 1f
    !byte %...#####                                                   ; 43b1: 1f
    !byte %.....###                                                   ; 43b2: 07
    !byte %.....###                                                   ; 43b3: 07
    !byte %.....###                                                   ; 43b4: 07
    !byte %.....###                                                   ; 43b5: 07
    !byte %....####                                                   ; 43b6: 0f
    !byte %....####                                                   ; 43b7: 0f
    !byte %########                                                   ; 43b8: ff
    !byte %########                                                   ; 43b9: ff
    !byte %##......                                                   ; 43ba: c0
    !byte %#.......                                                   ; 43bb: 80
    !byte %#.......                                                   ; 43bc: 80
    !byte %#.......                                                   ; 43bd: 80
    !byte %#...##..                                                   ; 43be: 8c
    !byte %...###..                                                   ; 43bf: 1c
    !byte %####....                                                   ; 43c0: f0
    !byte %####....                                                   ; 43c1: f0
    !byte %####....                                                   ; 43c2: f0
    !byte %.###....                                                   ; 43c3: 70
    !byte %.##.....                                                   ; 43c4: 60
    !byte %.##.....                                                   ; 43c5: 60
    !byte %.##.....                                                   ; 43c6: 60
    !byte %.##.....                                                   ; 43c7: 60
    !byte %........                                                   ; 43c8: 00
    !byte %........                                                   ; 43c9: 00
    !byte %........                                                   ; 43ca: 00
    !byte %........                                                   ; 43cb: 00
    !byte %........                                                   ; 43cc: 00
    !byte %........                                                   ; 43cd: 00
    !byte %........                                                   ; 43ce: 00
    !byte %........                                                   ; 43cf: 00
    !byte %........                                                   ; 43d0: 00
    !byte %........                                                   ; 43d1: 00
    !byte %........                                                   ; 43d2: 00
    !byte %........                                                   ; 43d3: 00
    !byte %........                                                   ; 43d4: 00
    !byte %........                                                   ; 43d5: 00
    !byte %........                                                   ; 43d6: 00
    !byte %........                                                   ; 43d7: 00
    !byte %......##                                                   ; 43d8: 03
    !byte %......##                                                   ; 43d9: 03
    !byte %........                                                   ; 43da: 00
    !byte %........                                                   ; 43db: 00
    !byte %........                                                   ; 43dc: 00
    !byte %........                                                   ; 43dd: 00
    !byte %.......#                                                   ; 43de: 01
    !byte %.......#                                                   ; 43df: 01
    !byte %########                                                   ; 43e0: ff
    !byte %########                                                   ; 43e1: ff
    !byte %#####...                                                   ; 43e2: f8
    !byte %####....                                                   ; 43e3: f0
    !byte %####....                                                   ; 43e4: f0
    !byte %####....                                                   ; 43e5: f0
    !byte %####...#                                                   ; 43e6: f1
    !byte %###...##                                                   ; 43e7: e3
    !byte %#######.                                                   ; 43e8: fe
    !byte %#######.                                                   ; 43e9: fe
    !byte %...####.                                                   ; 43ea: 1e
    !byte %....###.                                                   ; 43eb: 0e
    !byte %....##..                                                   ; 43ec: 0c
    !byte %....##..                                                   ; 43ed: 0c
    !byte %#...##..                                                   ; 43ee: 8c
    !byte %#...##..                                                   ; 43ef: 8c
    !byte %........                                                   ; 43f0: 00
    !byte %........                                                   ; 43f1: 00
    !byte %........                                                   ; 43f2: 00
    !byte %........                                                   ; 43f3: 00
    !byte %........                                                   ; 43f4: 00
    !byte %........                                                   ; 43f5: 00
    !byte %........                                                   ; 43f6: 00
    !byte %........                                                   ; 43f7: 00
    !byte %#######.                                                   ; 43f8: fe
    !byte %#######.                                                   ; 43f9: fe
    !byte %..######                                                   ; 43fa: 3f
    !byte %..######                                                   ; 43fb: 3f
    !byte %..######                                                   ; 43fc: 3f
    !byte %.#######                                                   ; 43fd: 7f
    !byte %.##..###                                                   ; 43fe: 67
    !byte %.##..###                                                   ; 43ff: 67
    !byte %.....###                                                   ; 4400: 07
    !byte %.....###                                                   ; 4401: 07
    !byte %........                                                   ; 4402: 00
    !byte %.......#                                                   ; 4403: 01
    !byte %.......#                                                   ; 4404: 01
    !byte %#......#                                                   ; 4405: 81
    !byte %#......#                                                   ; 4406: 81
    !byte %#.....##                                                   ; 4407: 83
    !byte %#####...                                                   ; 4408: f8
    !byte %#####...                                                   ; 4409: f8
    !byte %###.....                                                   ; 440a: e0
    !byte %##......                                                   ; 440b: c0
    !byte %#.......                                                   ; 440c: 80
    !byte %#.......                                                   ; 440d: 80
    !byte %#.......                                                   ; 440e: 80
    !byte %#.......                                                   ; 440f: 80
    !byte %..######                                                   ; 4410: 3f
    !byte %..######                                                   ; 4411: 3f
    !byte %....####                                                   ; 4412: 0f
    !byte %....####                                                   ; 4413: 0f
    !byte %....####                                                   ; 4414: 0f
    !byte %....####                                                   ; 4415: 0f
    !byte %...#####                                                   ; 4416: 1f
    !byte %...####.                                                   ; 4417: 1e
    !byte %######..                                                   ; 4418: fc
    !byte %########                                                   ; 4419: ff
    !byte %#...####                                                   ; 441a: 8f
    !byte %.....###                                                   ; 441b: 07
    !byte %.....###                                                   ; 441c: 07
    !byte %......##                                                   ; 441d: 03
    !byte %......##                                                   ; 441e: 03
    !byte %......##                                                   ; 441f: 03
    !byte %........                                                   ; 4420: 00
    !byte %........                                                   ; 4421: 00
    !byte %#.......                                                   ; 4422: 80
    !byte %#.......                                                   ; 4423: 80
    !byte %##......                                                   ; 4424: c0
    !byte %##......                                                   ; 4425: c0
    !byte %##......                                                   ; 4426: c0
    !byte %##......                                                   ; 4427: c0
    !byte %........                                                   ; 4428: 00
    !byte %........                                                   ; 4429: 00
    !byte %........                                                   ; 442a: 00
    !byte %........                                                   ; 442b: 00
    !byte %........                                                   ; 442c: 00
    !byte %........                                                   ; 442d: 00
    !byte %........                                                   ; 442e: 00
    !byte %........                                                   ; 442f: 00
    !byte %........                                                   ; 4430: 00
    !byte %........                                                   ; 4431: 00
    !byte %........                                                   ; 4432: 00
    !byte %........                                                   ; 4433: 00
    !byte %........                                                   ; 4434: 00
    !byte %........                                                   ; 4435: 00
    !byte %........                                                   ; 4436: 00
    !byte %........                                                   ; 4437: 00
    !byte %........                                                   ; 4438: 00
    !byte %........                                                   ; 4439: 00
    !byte %........                                                   ; 443a: 00
    !byte %........                                                   ; 443b: 00
    !byte %........                                                   ; 443c: 00
    !byte %........                                                   ; 443d: 00
    !byte %........                                                   ; 443e: 00
    !byte %........                                                   ; 443f: 00
    !byte %........                                                   ; 4440: 00
    !byte %........                                                   ; 4441: 00
    !byte %........                                                   ; 4442: 00
    !byte %........                                                   ; 4443: 00
    !byte %........                                                   ; 4444: 00
    !byte %........                                                   ; 4445: 00
    !byte %........                                                   ; 4446: 00
    !byte %........                                                   ; 4447: 00
    !byte %........                                                   ; 4448: 00
    !byte %........                                                   ; 4449: 00
    !byte %........                                                   ; 444a: 00
    !byte %........                                                   ; 444b: 00
    !byte %........                                                   ; 444c: 00
    !byte %........                                                   ; 444d: 00
    !byte %........                                                   ; 444e: 00
    !byte %........                                                   ; 444f: 00
    !byte %........                                                   ; 4450: 00
    !byte %........                                                   ; 4451: 00
    !byte %........                                                   ; 4452: 00
    !byte %........                                                   ; 4453: 00
    !byte %........                                                   ; 4454: 00
    !byte %........                                                   ; 4455: 00
    !byte %........                                                   ; 4456: 00
    !byte %........                                                   ; 4457: 00
    !byte %........                                                   ; 4458: 00
    !byte %........                                                   ; 4459: 00
    !byte %........                                                   ; 445a: 00
    !byte %........                                                   ; 445b: 00
    !byte %........                                                   ; 445c: 00
    !byte %........                                                   ; 445d: 00
    !byte %........                                                   ; 445e: 00
    !byte %........                                                   ; 445f: 00
    !byte %........                                                   ; 4460: 00
    !byte %........                                                   ; 4461: 00
    !byte %........                                                   ; 4462: 00
    !byte %........                                                   ; 4463: 00
    !byte %........                                                   ; 4464: 00
    !byte %........                                                   ; 4465: 00
    !byte %........                                                   ; 4466: 00
    !byte %........                                                   ; 4467: 00
    !byte %........                                                   ; 4468: 00
    !byte %........                                                   ; 4469: 00
    !byte %........                                                   ; 446a: 00
    !byte %........                                                   ; 446b: 00
    !byte %........                                                   ; 446c: 00
    !byte %........                                                   ; 446d: 00
    !byte %........                                                   ; 446e: 00
    !byte %........                                                   ; 446f: 00
    !byte %........                                                   ; 4470: 00
    !byte %........                                                   ; 4471: 00
    !byte %........                                                   ; 4472: 00
    !byte %........                                                   ; 4473: 00
    !byte %........                                                   ; 4474: 00
    !byte %........                                                   ; 4475: 00
    !byte %........                                                   ; 4476: 00
    !byte %........                                                   ; 4477: 00
    !byte %........                                                   ; 4478: 00
    !byte %........                                                   ; 4479: 00
    !byte %........                                                   ; 447a: 00
    !byte %........                                                   ; 447b: 00
    !byte %........                                                   ; 447c: 00
    !byte %........                                                   ; 447d: 00
    !byte %........                                                   ; 447e: 00
    !byte %........                                                   ; 447f: 00
    !byte %........                                                   ; 4480: 00
    !byte %........                                                   ; 4481: 00
    !byte %........                                                   ; 4482: 00
    !byte %........                                                   ; 4483: 00
    !byte %........                                                   ; 4484: 00
    !byte %........                                                   ; 4485: 00
    !byte %........                                                   ; 4486: 00
    !byte %........                                                   ; 4487: 00
    !byte %........                                                   ; 4488: 00
    !byte %........                                                   ; 4489: 00
    !byte %........                                                   ; 448a: 00
    !byte %........                                                   ; 448b: 00
    !byte %........                                                   ; 448c: 00
    !byte %........                                                   ; 448d: 00
    !byte %........                                                   ; 448e: 00
    !byte %........                                                   ; 448f: 00
    !byte %........                                                   ; 4490: 00
    !byte %........                                                   ; 4491: 00
    !byte %........                                                   ; 4492: 00
    !byte %........                                                   ; 4493: 00
    !byte %........                                                   ; 4494: 00
    !byte %........                                                   ; 4495: 00
    !byte %........                                                   ; 4496: 00
    !byte %........                                                   ; 4497: 00
    !byte %........                                                   ; 4498: 00
    !byte %........                                                   ; 4499: 00
    !byte %........                                                   ; 449a: 00
    !byte %........                                                   ; 449b: 00
    !byte %........                                                   ; 449c: 00
    !byte %........                                                   ; 449d: 00
    !byte %........                                                   ; 449e: 00
    !byte %........                                                   ; 449f: 00
    !byte %........                                                   ; 44a0: 00
    !byte %........                                                   ; 44a1: 00
    !byte %........                                                   ; 44a2: 00
    !byte %........                                                   ; 44a3: 00
    !byte %........                                                   ; 44a4: 00
    !byte %........                                                   ; 44a5: 00
    !byte %........                                                   ; 44a6: 00
    !byte %........                                                   ; 44a7: 00
    !byte %........                                                   ; 44a8: 00
    !byte %........                                                   ; 44a9: 00
    !byte %........                                                   ; 44aa: 00
    !byte %........                                                   ; 44ab: 00
    !byte %........                                                   ; 44ac: 00
    !byte %........                                                   ; 44ad: 00
    !byte %........                                                   ; 44ae: 00
    !byte %........                                                   ; 44af: 00
    !byte %........                                                   ; 44b0: 00
    !byte %........                                                   ; 44b1: 00
    !byte %........                                                   ; 44b2: 00
    !byte %........                                                   ; 44b3: 00
    !byte %........                                                   ; 44b4: 00
    !byte %........                                                   ; 44b5: 00
    !byte %........                                                   ; 44b6: 00
    !byte %........                                                   ; 44b7: 00
    !byte %........                                                   ; 44b8: 00
    !byte %........                                                   ; 44b9: 00
    !byte %........                                                   ; 44ba: 00
    !byte %........                                                   ; 44bb: 00
    !byte %........                                                   ; 44bc: 00
    !byte %........                                                   ; 44bd: 00
    !byte %........                                                   ; 44be: 00
    !byte %........                                                   ; 44bf: 00
    !byte %....####                                                   ; 44c0: 0f
    !byte %...#####                                                   ; 44c1: 1f
    !byte %...####.                                                   ; 44c2: 1e
    !byte %...####.                                                   ; 44c3: 1e
    !byte %...####.                                                   ; 44c4: 1e
    !byte %..#####.                                                   ; 44c5: 3e
    !byte %..####..                                                   ; 44c6: 3c
    !byte %..####..                                                   ; 44c7: 3c
    !byte %........                                                   ; 44c8: 00
    !byte %........                                                   ; 44c9: 00
    !byte %........                                                   ; 44ca: 00
    !byte %........                                                   ; 44cb: 00
    !byte %........                                                   ; 44cc: 00
    !byte %........                                                   ; 44cd: 00
    !byte %........                                                   ; 44ce: 00
    !byte %........                                                   ; 44cf: 00
    !byte %........                                                   ; 44d0: 00
    !byte %.......#                                                   ; 44d1: 01
    !byte %.......#                                                   ; 44d2: 01
    !byte %.......#                                                   ; 44d3: 01
    !byte %.......#                                                   ; 44d4: 01
    !byte %......##                                                   ; 44d5: 03
    !byte %......##                                                   ; 44d6: 03
    !byte %......##                                                   ; 44d7: 03
    !byte %####....                                                   ; 44d8: f0
    !byte %####....                                                   ; 44d9: f0
    !byte %########                                                   ; 44da: ff
    !byte %########                                                   ; 44db: ff
    !byte %###.....                                                   ; 44dc: e0
    !byte %###.....                                                   ; 44dd: e0
    !byte %##......                                                   ; 44de: c0
    !byte %##......                                                   ; 44df: c0
    !byte %....####                                                   ; 44e0: 0f
    !byte %...#####                                                   ; 44e1: 1f
    !byte %#######.                                                   ; 44e2: fe
    !byte %#######.                                                   ; 44e3: fe
    !byte %...####.                                                   ; 44e4: 1e
    !byte %..#####.                                                   ; 44e5: 3e
    !byte %..####..                                                   ; 44e6: 3c
    !byte %..####..                                                   ; 44e7: 3c
    !byte %........                                                   ; 44e8: 00
    !byte %........                                                   ; 44e9: 00
    !byte %........                                                   ; 44ea: 00
    !byte %........                                                   ; 44eb: 00
    !byte %........                                                   ; 44ec: 00
    !byte %........                                                   ; 44ed: 00
    !byte %........                                                   ; 44ee: 00
    !byte %........                                                   ; 44ef: 00
    !byte %....####                                                   ; 44f0: 0f
    !byte %...#####                                                   ; 44f1: 1f
    !byte %...#####                                                   ; 44f2: 1f
    !byte %...#####                                                   ; 44f3: 1f
    !byte %...####.                                                   ; 44f4: 1e
    !byte %..#####.                                                   ; 44f5: 3e
    !byte %..####..                                                   ; 44f6: 3c
    !byte %..####..                                                   ; 44f7: 3c
    !byte %...###..                                                   ; 44f8: 1c
    !byte %..###...                                                   ; 44f9: 38
    !byte %#####...                                                   ; 44fa: f8
    !byte %#####...                                                   ; 44fb: f8
    !byte %..###...                                                   ; 44fc: 38
    !byte %..##....                                                   ; 44fd: 30
    !byte %..##....                                                   ; 44fe: 30
    !byte %..##....                                                   ; 44ff: 30
    !byte %........                                                   ; 4500: 00
    !byte %........                                                   ; 4501: 00
    !byte %........                                                   ; 4502: 00
    !byte %........                                                   ; 4503: 00
    !byte %........                                                   ; 4504: 00
    !byte %........                                                   ; 4505: 00
    !byte %........                                                   ; 4506: 00
    !byte %........                                                   ; 4507: 00
    !byte %........                                                   ; 4508: 00
    !byte %........                                                   ; 4509: 00
    !byte %........                                                   ; 450a: 00
    !byte %........                                                   ; 450b: 00
    !byte %........                                                   ; 450c: 00
    !byte %........                                                   ; 450d: 00
    !byte %........                                                   ; 450e: 00
    !byte %........                                                   ; 450f: 00
    !byte %........                                                   ; 4510: 00
    !byte %........                                                   ; 4511: 00
    !byte %........                                                   ; 4512: 00
    !byte %........                                                   ; 4513: 00
    !byte %........                                                   ; 4514: 00
    !byte %........                                                   ; 4515: 00
    !byte %........                                                   ; 4516: 00
    !byte %........                                                   ; 4517: 00
    !byte %.......#                                                   ; 4518: 01
    !byte %......##                                                   ; 4519: 03
    !byte %......##                                                   ; 451a: 03
    !byte %......##                                                   ; 451b: 03
    !byte %......##                                                   ; 451c: 03
    !byte %.....###                                                   ; 451d: 07
    !byte %.....###                                                   ; 451e: 07
    !byte %.....###                                                   ; 451f: 07
    !byte %###...##                                                   ; 4520: e3
    !byte %###..###                                                   ; 4521: e7
    !byte %########                                                   ; 4522: ff
    !byte %########                                                   ; 4523: ff
    !byte %##...###                                                   ; 4524: c7
    !byte %##...##.                                                   ; 4525: c6
    !byte %#....##.                                                   ; 4526: 86
    !byte %#....##.                                                   ; 4527: 86
    !byte %#.......                                                   ; 4528: 80
    !byte %........                                                   ; 4529: 00
    !byte %........                                                   ; 452a: 00
    !byte %........                                                   ; 452b: 00
    !byte %........                                                   ; 452c: 00
    !byte %........                                                   ; 452d: 00
    !byte %........                                                   ; 452e: 00
    !byte %........                                                   ; 452f: 00
    !byte %........                                                   ; 4530: 00
    !byte %........                                                   ; 4531: 00
    !byte %........                                                   ; 4532: 00
    !byte %........                                                   ; 4533: 00
    !byte %.......#                                                   ; 4534: 01
    !byte %.......#                                                   ; 4535: 01
    !byte %.......#                                                   ; 4536: 01
    !byte %......##                                                   ; 4537: 03
    !byte %.##..###                                                   ; 4538: 67
    !byte %###...##                                                   ; 4539: e3
    !byte %##....##                                                   ; 453a: c3
    !byte %##....##                                                   ; 453b: c3
    !byte %##.....#                                                   ; 453c: c1
    !byte %#......#                                                   ; 453d: 81
    !byte %#......#                                                   ; 453e: 81
    !byte %#.......                                                   ; 453f: 80
    !byte %##....##                                                   ; 4540: c3
    !byte %##....##                                                   ; 4541: c3
    !byte %##...###                                                   ; 4542: c7
    !byte %###..##.                                                   ; 4543: e6
    !byte %###..##.                                                   ; 4544: e6
    !byte %###.###.                                                   ; 4545: ee
    !byte %######..                                                   ; 4546: fc
    !byte %######..                                                   ; 4547: fc
    !byte %........                                                   ; 4548: 00
    !byte %........                                                   ; 4549: 00
    !byte %........                                                   ; 454a: 00
    !byte %........                                                   ; 454b: 00
    !byte %........                                                   ; 454c: 00
    !byte %........                                                   ; 454d: 00
    !byte %........                                                   ; 454e: 00
    !byte %........                                                   ; 454f: 00
    !byte %...####.                                                   ; 4550: 1e
    !byte %..#####.                                                   ; 4551: 3e
    !byte %..####..                                                   ; 4552: 3c
    !byte %..####..                                                   ; 4553: 3c
    !byte %..####..                                                   ; 4554: 3c
    !byte %.#####..                                                   ; 4555: 7c
    !byte %.####...                                                   ; 4556: 78
    !byte %.####...                                                   ; 4557: 78
    !byte %......##                                                   ; 4558: 03
    !byte %......##                                                   ; 4559: 03
    !byte %......##                                                   ; 455a: 03
    !byte %.....###                                                   ; 455b: 07
    !byte %.....###                                                   ; 455c: 07
    !byte %.....###                                                   ; 455d: 07
    !byte %....####                                                   ; 455e: 0f
    !byte %....####                                                   ; 455f: 0f
    !byte %##......                                                   ; 4560: c0
    !byte %##......                                                   ; 4561: c0
    !byte %##......                                                   ; 4562: c0
    !byte %##......                                                   ; 4563: c0
    !byte %#.......                                                   ; 4564: 80
    !byte %#.......                                                   ; 4565: 80
    !byte %#.......                                                   ; 4566: 80
    !byte %........                                                   ; 4567: 00
    !byte %........                                                   ; 4568: 00
    !byte %........                                                   ; 4569: 00
    !byte %........                                                   ; 456a: 00
    !byte %........                                                   ; 456b: 00
    !byte %........                                                   ; 456c: 00
    !byte %........                                                   ; 456d: 00
    !byte %........                                                   ; 456e: 00
    !byte %........                                                   ; 456f: 00
    !byte %........                                                   ; 4570: 00
    !byte %........                                                   ; 4571: 00
    !byte %........                                                   ; 4572: 00
    !byte %........                                                   ; 4573: 00
    !byte %........                                                   ; 4574: 00
    !byte %........                                                   ; 4575: 00
    !byte %........                                                   ; 4576: 00
    !byte %........                                                   ; 4577: 00
    !byte %........                                                   ; 4578: 00
    !byte %........                                                   ; 4579: 00
    !byte %........                                                   ; 457a: 00
    !byte %........                                                   ; 457b: 00
    !byte %........                                                   ; 457c: 00
    !byte %........                                                   ; 457d: 00
    !byte %........                                                   ; 457e: 00
    !byte %........                                                   ; 457f: 00
    !byte %........                                                   ; 4580: 00
    !byte %........                                                   ; 4581: 00
    !byte %........                                                   ; 4582: 00
    !byte %........                                                   ; 4583: 00
    !byte %........                                                   ; 4584: 00
    !byte %........                                                   ; 4585: 00
    !byte %........                                                   ; 4586: 00
    !byte %........                                                   ; 4587: 00
    !byte %........                                                   ; 4588: 00
    !byte %........                                                   ; 4589: 00
    !byte %........                                                   ; 458a: 00
    !byte %........                                                   ; 458b: 00
    !byte %........                                                   ; 458c: 00
    !byte %........                                                   ; 458d: 00
    !byte %........                                                   ; 458e: 00
    !byte %........                                                   ; 458f: 00
    !byte %........                                                   ; 4590: 00
    !byte %........                                                   ; 4591: 00
    !byte %........                                                   ; 4592: 00
    !byte %........                                                   ; 4593: 00
    !byte %........                                                   ; 4594: 00
    !byte %........                                                   ; 4595: 00
    !byte %........                                                   ; 4596: 00
    !byte %........                                                   ; 4597: 00
    !byte %........                                                   ; 4598: 00
    !byte %........                                                   ; 4599: 00
    !byte %........                                                   ; 459a: 00
    !byte %........                                                   ; 459b: 00
    !byte %........                                                   ; 459c: 00
    !byte %........                                                   ; 459d: 00
    !byte %........                                                   ; 459e: 00
    !byte %........                                                   ; 459f: 00
    !byte %........                                                   ; 45a0: 00
    !byte %........                                                   ; 45a1: 00
    !byte %........                                                   ; 45a2: 00
    !byte %........                                                   ; 45a3: 00
    !byte %........                                                   ; 45a4: 00
    !byte %........                                                   ; 45a5: 00
    !byte %........                                                   ; 45a6: 00
    !byte %........                                                   ; 45a7: 00
    !byte %........                                                   ; 45a8: 00
    !byte %........                                                   ; 45a9: 00
    !byte %........                                                   ; 45aa: 00
    !byte %........                                                   ; 45ab: 00
    !byte %........                                                   ; 45ac: 00
    !byte %........                                                   ; 45ad: 00
    !byte %........                                                   ; 45ae: 00
    !byte %........                                                   ; 45af: 00
    !byte %........                                                   ; 45b0: 00
    !byte %........                                                   ; 45b1: 00
    !byte %........                                                   ; 45b2: 00
    !byte %........                                                   ; 45b3: 00
    !byte %........                                                   ; 45b4: 00
    !byte %........                                                   ; 45b5: 00
    !byte %........                                                   ; 45b6: 00
    !byte %........                                                   ; 45b7: 00
    !byte %........                                                   ; 45b8: 00
    !byte %........                                                   ; 45b9: 00
    !byte %........                                                   ; 45ba: 00
    !byte %........                                                   ; 45bb: 00
    !byte %........                                                   ; 45bc: 00
    !byte %........                                                   ; 45bd: 00
    !byte %........                                                   ; 45be: 00
    !byte %........                                                   ; 45bf: 00
    !byte %........                                                   ; 45c0: 00
    !byte %........                                                   ; 45c1: 00
    !byte %........                                                   ; 45c2: 00
    !byte %........                                                   ; 45c3: 00
    !byte %........                                                   ; 45c4: 00
    !byte %........                                                   ; 45c5: 00
    !byte %........                                                   ; 45c6: 00
    !byte %........                                                   ; 45c7: 00
    !byte %........                                                   ; 45c8: 00
    !byte %........                                                   ; 45c9: 00
    !byte %........                                                   ; 45ca: 00
    !byte %........                                                   ; 45cb: 00
    !byte %........                                                   ; 45cc: 00
    !byte %........                                                   ; 45cd: 00
    !byte %........                                                   ; 45ce: 00
    !byte %........                                                   ; 45cf: 00
    !byte %........                                                   ; 45d0: 00
    !byte %........                                                   ; 45d1: 00
    !byte %........                                                   ; 45d2: 00
    !byte %........                                                   ; 45d3: 00
    !byte %........                                                   ; 45d4: 00
    !byte %........                                                   ; 45d5: 00
    !byte %........                                                   ; 45d6: 00
    !byte %........                                                   ; 45d7: 00
    !byte %........                                                   ; 45d8: 00
    !byte %........                                                   ; 45d9: 00
    !byte %........                                                   ; 45da: 00
    !byte %........                                                   ; 45db: 00
    !byte %........                                                   ; 45dc: 00
    !byte %........                                                   ; 45dd: 00
    !byte %........                                                   ; 45de: 00
    !byte %........                                                   ; 45df: 00
    !byte %........                                                   ; 45e0: 00
    !byte %........                                                   ; 45e1: 00
    !byte %........                                                   ; 45e2: 00
    !byte %........                                                   ; 45e3: 00
    !byte %........                                                   ; 45e4: 00
    !byte %........                                                   ; 45e5: 00
    !byte %........                                                   ; 45e6: 00
    !byte %........                                                   ; 45e7: 00
    !byte %........                                                   ; 45e8: 00
    !byte %........                                                   ; 45e9: 00
    !byte %........                                                   ; 45ea: 00
    !byte %........                                                   ; 45eb: 00
    !byte %........                                                   ; 45ec: 00
    !byte %........                                                   ; 45ed: 00
    !byte %........                                                   ; 45ee: 00
    !byte %........                                                   ; 45ef: 00
    !byte %........                                                   ; 45f0: 00
    !byte %........                                                   ; 45f1: 00
    !byte %........                                                   ; 45f2: 00
    !byte %........                                                   ; 45f3: 00
    !byte %........                                                   ; 45f4: 00
    !byte %........                                                   ; 45f5: 00
    !byte %........                                                   ; 45f6: 00
    !byte %........                                                   ; 45f7: 00
    !byte %........                                                   ; 45f8: 00
    !byte %........                                                   ; 45f9: 00
    !byte %........                                                   ; 45fa: 00
    !byte %........                                                   ; 45fb: 00
    !byte %........                                                   ; 45fc: 00
    !byte %.....###                                                   ; 45fd: 07
    !byte %.....###                                                   ; 45fe: 07
    !byte %........                                                   ; 45ff: 00
    !byte %.#####..                                                   ; 4600: 7c
    !byte %.####...                                                   ; 4601: 78
    !byte %.####...                                                   ; 4602: 78
    !byte %.####...                                                   ; 4603: 78
    !byte %#####...                                                   ; 4604: f8
    !byte %#######.                                                   ; 4605: fe
    !byte %#######.                                                   ; 4606: fe
    !byte %........                                                   ; 4607: 00
    !byte %........                                                   ; 4608: 00
    !byte %........                                                   ; 4609: 00
    !byte %........                                                   ; 460a: 00
    !byte %........                                                   ; 460b: 00
    !byte %........                                                   ; 460c: 00
    !byte %........                                                   ; 460d: 00
    !byte %........                                                   ; 460e: 00
    !byte %........                                                   ; 460f: 00
    !byte %.....###                                                   ; 4610: 07
    !byte %.....###                                                   ; 4611: 07
    !byte %.....###                                                   ; 4612: 07
    !byte %.....###                                                   ; 4613: 07
    !byte %....####                                                   ; 4614: 0f
    !byte %.#######                                                   ; 4615: 7f
    !byte %.#######                                                   ; 4616: 7f
    !byte %........                                                   ; 4617: 00
    !byte %##......                                                   ; 4618: c0
    !byte %#.......                                                   ; 4619: 80
    !byte %#.......                                                   ; 461a: 80
    !byte %#.......                                                   ; 461b: 80
    !byte %#.......                                                   ; 461c: 80
    !byte %###..###                                                   ; 461d: e7
    !byte %###..###                                                   ; 461e: e7
    !byte %........                                                   ; 461f: 00
    !byte %.#####..                                                   ; 4620: 7c
    !byte %.####...                                                   ; 4621: 78
    !byte %.####...                                                   ; 4622: 78
    !byte %.####...                                                   ; 4623: 78
    !byte %#####...                                                   ; 4624: f8
    !byte %#######.                                                   ; 4625: fe
    !byte %#######.                                                   ; 4626: fe
    !byte %........                                                   ; 4627: 00
    !byte %........                                                   ; 4628: 00
    !byte %........                                                   ; 4629: 00
    !byte %........                                                   ; 462a: 00
    !byte %........                                                   ; 462b: 00
    !byte %........                                                   ; 462c: 00
    !byte %.....###                                                   ; 462d: 07
    !byte %.....###                                                   ; 462e: 07
    !byte %........                                                   ; 462f: 00
    !byte %.#####..                                                   ; 4630: 7c
    !byte %.####...                                                   ; 4631: 78
    !byte %.####...                                                   ; 4632: 78
    !byte %.####...                                                   ; 4633: 78
    !byte %#####...                                                   ; 4634: f8
    !byte %########                                                   ; 4635: ff
    !byte %########                                                   ; 4636: ff
    !byte %........                                                   ; 4637: 00
    !byte %......##                                                   ; 4638: 03
    !byte %.....###                                                   ; 4639: 07
    !byte %.....###                                                   ; 463a: 07
    !byte %....###.                                                   ; 463b: 0e
    !byte %..#####.                                                   ; 463c: 3e
    !byte %######..                                                   ; 463d: fc
    !byte %######..                                                   ; 463e: fc
    !byte %........                                                   ; 463f: 00
    !byte %........                                                   ; 4640: 00
    !byte %........                                                   ; 4641: 00
    !byte %........                                                   ; 4642: 00
    !byte %........                                                   ; 4643: 00
    !byte %........                                                   ; 4644: 00
    !byte %........                                                   ; 4645: 00
    !byte %........                                                   ; 4646: 00
    !byte %........                                                   ; 4647: 00
    !byte %........                                                   ; 4648: 00
    !byte %........                                                   ; 4649: 00
    !byte %........                                                   ; 464a: 00
    !byte %........                                                   ; 464b: 00
    !byte %........                                                   ; 464c: 00
    !byte %........                                                   ; 464d: 00
    !byte %........                                                   ; 464e: 00
    !byte %........                                                   ; 464f: 00
    !byte %........                                                   ; 4650: 00
    !byte %........                                                   ; 4651: 00
    !byte %........                                                   ; 4652: 00
    !byte %........                                                   ; 4653: 00
    !byte %........                                                   ; 4654: 00
    !byte %........                                                   ; 4655: 00
    !byte %........                                                   ; 4656: 00
    !byte %........                                                   ; 4657: 00
    !byte %....####                                                   ; 4658: 0f
    !byte %....####                                                   ; 4659: 0f
    !byte %....####                                                   ; 465a: 0f
    !byte %....####                                                   ; 465b: 0f
    !byte %...#####                                                   ; 465c: 1f
    !byte %########                                                   ; 465d: ff
    !byte %########                                                   ; 465e: ff
    !byte %........                                                   ; 465f: 00
    !byte %#.......                                                   ; 4660: 80
    !byte %........                                                   ; 4661: 00
    !byte %........                                                   ; 4662: 00
    !byte %.......#                                                   ; 4663: 01
    !byte %.....###                                                   ; 4664: 07
    !byte %########                                                   ; 4665: ff
    !byte %########                                                   ; 4666: ff
    !byte %........                                                   ; 4667: 00
    !byte %.##.....                                                   ; 4668: 60
    !byte %###.....                                                   ; 4669: e0
    !byte %###.....                                                   ; 466a: e0
    !byte %##......                                                   ; 466b: c0
    !byte %##......                                                   ; 466c: c0
    !byte %#.......                                                   ; 466d: 80
    !byte %#.......                                                   ; 466e: 80
    !byte %........                                                   ; 466f: 00
    !byte %......##                                                   ; 4670: 03
    !byte %......##                                                   ; 4671: 03
    !byte %......##                                                   ; 4672: 03
    !byte %.....###                                                   ; 4673: 07
    !byte %.....###                                                   ; 4674: 07
    !byte %..######                                                   ; 4675: 3f
    !byte %..######                                                   ; 4676: 3f
    !byte %........                                                   ; 4677: 00
    !byte %........                                                   ; 4678: 00
    !byte %........                                                   ; 4679: 00
    !byte %........                                                   ; 467a: 00
    !byte %........                                                   ; 467b: 00
    !byte %........                                                   ; 467c: 00
    !byte %##......                                                   ; 467d: c0
    !byte %##......                                                   ; 467e: c0
    !byte %........                                                   ; 467f: 00
    !byte %######..                                                   ; 4680: fc
    !byte %######..                                                   ; 4681: fc
    !byte %.####...                                                   ; 4682: 78
    !byte %.####...                                                   ; 4683: 78
    !byte %.####...                                                   ; 4684: 78
    !byte %..##....                                                   ; 4685: 30
    !byte %..##....                                                   ; 4686: 30
    !byte %........                                                   ; 4687: 00
    !byte %........                                                   ; 4688: 00
    !byte %........                                                   ; 4689: 00
    !byte %........                                                   ; 468a: 00
    !byte %........                                                   ; 468b: 00
    !byte %.......#                                                   ; 468c: 01
    !byte %....####                                                   ; 468d: 0f
    !byte %....####                                                   ; 468e: 0f
    !byte %........                                                   ; 468f: 00
    !byte %#####...                                                   ; 4690: f8
    !byte %####....                                                   ; 4691: f0
    !byte %####....                                                   ; 4692: f0
    !byte %####....                                                   ; 4693: f0
    !byte %####...#                                                   ; 4694: f1
    !byte %########                                                   ; 4695: ff
    !byte %########                                                   ; 4696: ff
    !byte %........                                                   ; 4697: 00
    !byte %...#####                                                   ; 4698: 1f
    !byte %...####.                                                   ; 4699: 1e
    !byte %..#####.                                                   ; 469a: 3e
    !byte %.#####..                                                   ; 469b: 7c
    !byte %#####...                                                   ; 469c: f8
    !byte %####....                                                   ; 469d: f0
    !byte %#.......                                                   ; 469e: 80
    !byte %........                                                   ; 469f: 00
    !byte %........                                                   ; 46a0: 00
    !byte %........                                                   ; 46a1: 00
    !byte %........                                                   ; 46a2: 00
    !byte %........                                                   ; 46a3: 00
    !byte %........                                                   ; 46a4: 00
    !byte %........                                                   ; 46a5: 00
    !byte %........                                                   ; 46a6: 00
    !byte %........                                                   ; 46a7: 00
    !byte %........                                                   ; 46a8: 00
    !byte %........                                                   ; 46a9: 00
    !byte %........                                                   ; 46aa: 00
    !byte %........                                                   ; 46ab: 00
    !byte %........                                                   ; 46ac: 00
    !byte %........                                                   ; 46ad: 00
    !byte %........                                                   ; 46ae: 00
    !byte %........                                                   ; 46af: 00
    !byte %........                                                   ; 46b0: 00
    !byte %........                                                   ; 46b1: 00
    !byte %........                                                   ; 46b2: 00
    !byte %........                                                   ; 46b3: 00
    !byte %........                                                   ; 46b4: 00
    !byte %........                                                   ; 46b5: 00
    !byte %........                                                   ; 46b6: 00
    !byte %........                                                   ; 46b7: 00
    !byte %........                                                   ; 46b8: 00
    !byte %........                                                   ; 46b9: 00
    !byte %........                                                   ; 46ba: 00
    !byte %........                                                   ; 46bb: 00
    !byte %........                                                   ; 46bc: 00
    !byte %........                                                   ; 46bd: 00
    !byte %........                                                   ; 46be: 00
    !byte %........                                                   ; 46bf: 00
    !byte %........                                                   ; 46c0: 00
    !byte %........                                                   ; 46c1: 00
    !byte %........                                                   ; 46c2: 00
    !byte %........                                                   ; 46c3: 00
    !byte %........                                                   ; 46c4: 00
    !byte %........                                                   ; 46c5: 00
    !byte %........                                                   ; 46c6: 00
    !byte %........                                                   ; 46c7: 00
    !byte %........                                                   ; 46c8: 00
    !byte %........                                                   ; 46c9: 00
    !byte %........                                                   ; 46ca: 00
    !byte %........                                                   ; 46cb: 00
    !byte %........                                                   ; 46cc: 00
    !byte %........                                                   ; 46cd: 00
    !byte %........                                                   ; 46ce: 00
    !byte %........                                                   ; 46cf: 00
    !byte %........                                                   ; 46d0: 00
    !byte %........                                                   ; 46d1: 00
    !byte %........                                                   ; 46d2: 00
    !byte %........                                                   ; 46d3: 00
    !byte %........                                                   ; 46d4: 00
    !byte %........                                                   ; 46d5: 00
    !byte %........                                                   ; 46d6: 00
    !byte %........                                                   ; 46d7: 00
    !byte %........                                                   ; 46d8: 00
    !byte %........                                                   ; 46d9: 00
    !byte %........                                                   ; 46da: 00
    !byte %........                                                   ; 46db: 00
    !byte %........                                                   ; 46dc: 00
    !byte %........                                                   ; 46dd: 00
    !byte %........                                                   ; 46de: 00
    !byte %........                                                   ; 46df: 00
    !byte %........                                                   ; 46e0: 00
    !byte %........                                                   ; 46e1: 00
    !byte %........                                                   ; 46e2: 00
    !byte %........                                                   ; 46e3: 00
    !byte %........                                                   ; 46e4: 00
    !byte %........                                                   ; 46e5: 00
    !byte %........                                                   ; 46e6: 00
    !byte %........                                                   ; 46e7: 00
    !byte %........                                                   ; 46e8: 00
    !byte %........                                                   ; 46e9: 00
    !byte %........                                                   ; 46ea: 00
    !byte %........                                                   ; 46eb: 00
    !byte %........                                                   ; 46ec: 00
    !byte %........                                                   ; 46ed: 00
    !byte %........                                                   ; 46ee: 00
    !byte %........                                                   ; 46ef: 00

; unused: remenants of a BASIC program
    !text "H.", '"', "M", '"'                                         ; 46f0: 48 2e 22...
    !byte $0d, $0d                                                    ; 46f5: 0d 0d
    !text "?24=17:B%=0:CH.", '"', "M", '"'                            ; 46f7: 3f 32 34...
    !byte $0d, $10, $10, $10, $10,   2,   0                           ; 4709: 0d 10 10...
pydis_end

; Automatically generated labels:
;     l0074
;     l0075
;     l0076
;     l0077
;     l0078
;     l0079
;     l007a
;     l007b
;     l0ab1
;     l0ab2
!if (<character_definitions) != $0c {
    !error "Assertion failed: <character_definitions == $0c"
}
!if (<copyright_message) != $a6 {
    !error "Assertion failed: <copyright_message == $a6"
}
!if (<encoded_message) != $fc {
    !error "Assertion failed: <encoded_message == $fc"
}
!if (<icodata_filename) != $1b {
    !error "Assertion failed: <icodata_filename == $1b"
}
!if (<the_end_bitmap) != $30 {
    !error "Assertion failed: <the_end_bitmap == $30"
}
!if (>character_definitions) != $3d {
    !error "Assertion failed: >character_definitions == $3d"
}
!if (>copyright_message) != $3c {
    !error "Assertion failed: >copyright_message == $3c"
}
!if (>encoded_message) != $3f {
    !error "Assertion failed: >encoded_message == $3f"
}
!if (>icodata_filename) != $43 {
    !error "Assertion failed: >icodata_filename == $43"
}
!if (>the_end_bitmap) != $43 {
    !error "Assertion failed: >the_end_bitmap == $43"
}
!if (colour_white) != $07 {
    !error "Assertion failed: colour_white == $07"
}
!if (inkey_key_escape) != $8f {
    !error "Assertion failed: inkey_key_escape == $8f"
}
!if (inkey_up_cursor) != $c6 {
    !error "Assertion failed: inkey_up_cursor == $c6"
}
!if (level_specific_update_ptr) != $3ad9 {
    !error "Assertion failed: level_specific_update_ptr == $3ad9"
}
!if (osbyte_flush_buffer_class) != $0f {
    !error "Assertion failed: osbyte_flush_buffer_class == $0f"
}
